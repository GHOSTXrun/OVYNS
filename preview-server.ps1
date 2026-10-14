$root=Split-Path -Parent $MyInvocation.MyCommand.Path
$listener=[Net.HttpListener]::new()
$listener.Prefixes.Add('http://localhost:8081/')
$listener.Start()
while($listener.IsListening){$context=$listener.GetContext();try{$path=$context.Request.Url.AbsolutePath;if($path -eq '/' -or $path -eq '/index.html'){$file=Join-Path $root 'index.html';$type='text/html; charset=utf-8'}elseif($path -eq '/OVYNS.png'){$file=Join-Path $root 'OVYNS.png';$type='image/png'}else{$context.Response.StatusCode=404;$context.Response.Close();continue};$bytes=[IO.File]::ReadAllBytes($file);$context.Response.ContentType=$type;$context.Response.ContentLength64=$bytes.Length;$context.Response.OutputStream.Write($bytes,0,$bytes.Length)}catch{$context.Response.StatusCode=500}finally{$context.Response.Close()}}