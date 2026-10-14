# OVYNS

Interactive Solana dashboard with OVYNS branding, animated charts, gold laser and code-rain backgrounds, and Phantom, Solflare and Backpack browser-wallet connections.

## Run locally

With Node.js installed:

```sh
npm start
```

Open http://localhost:8081. The frontend server uses Node built-ins and does not require npm install.

On Windows, you can also run:

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File .\preview-server.ps1
```

Wallet extensions require a supported browser and localhost or HTTPS. Connections request the public address only; this frontend does not sign or submit transactions. Actual authorization must be confirmed in the wallet extension.

## Data and effects

The dashboard currently runs on clearly labelled demo data, updated every 1.2 seconds. No deployed OVYNS contract or real market feed is configured. FX can be toggled with the bottom-right button; reduced-motion preferences are respected. All interface text is English.

## Files

- index.html: standalone frontend, charts, effects and wallet integration.
- OVYNS.png: supplied project logo.
- serve.mjs / preview-server.ps1: local preview servers.
- programs/, migrations/, tests/: original Anchor/Rust project retained from Onsnes.
- UPSTREAM.md: original project documentation, provided for provenance; its deployment claims are not verification of an OVYNS deployment.

The inherited Anchor program identifiers and deployment configuration have not been migrated or deployed for OVYNS. Review them before any on-chain deployment. Original contract tests were not run in this environment.

## Hosting

Serve index.html and OVYNS.png together on an HTTPS static host. For GitHub Pages, select Settings > Pages > Deploy from a branch > main > / (root).

## Validation

The local preview returned HTTP 200. Browser checks confirmed continuously updating data and wallet connection, account-change and disconnect UI flows using test providers. Real extension authorization remains a manual verification step.

## License

Derived from Onsnes under the MIT license. Original copyright and license are retained in LICENSE.