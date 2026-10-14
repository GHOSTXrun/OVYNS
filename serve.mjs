import { createServer } from 'node:http';
import { readFile } from 'node:fs/promises';
const port = Number(process.env.PORT || 8081);
const assets = { '/': ['index.html','text/html; charset=utf-8'], '/index.html': ['index.html','text/html; charset=utf-8'], '/OVYNS.png': ['OVYNS.png','image/png'] };
createServer(async (req,res) => {
  const entry = assets[new URL(req.url,'http://localhost').pathname];
  if (!entry) { res.writeHead(404).end('Not found'); return; }
  try { const data=await readFile(new URL(entry[0],import.meta.url)); res.writeHead(200,{'Content-Type':entry[1]});res.end(data); }
  catch { res.writeHead(500).end('Could not load asset'); }
}).listen(port,'127.0.0.1',()=>console.log(`OVYNS at http://localhost:${port}`));