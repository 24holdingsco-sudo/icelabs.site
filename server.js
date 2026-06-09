const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;
const ROOT = __dirname;

const publicDirs = ['shows', 'images'];
const publicExts = ['.html', '.css', '.js', '.jpg', '.jpeg', '.png', '.gif', '.webp', '.svg', '.ico', '.xml', '.txt'];

app.use(express.static(ROOT, {
  setHeaders: (res, fp) => {
    const ext = path.extname(fp).toLowerCase();
    if (ext === '.html') res.set('Cache-Control', 'public, max-age=0, must-revalidate');
  },
  redirect: false
}));

app.get('/health', (req, res) => {
  res.json({ status: 'ok', uptime: process.uptime() });
});

app.use((req, res) => {
  let p = req.path;

  if (p.startsWith('/shows/') && !p.endsWith('.html')) {
    const cand = path.join(ROOT, p + '.html');
    if (fs.existsSync(cand)) return res.sendFile(cand);
  }

  if (!p.endsWith('.html')) {
    const cand = path.join(ROOT, p + '.html');
    if (fs.existsSync(cand)) return res.sendFile(cand);
  }

  const f = path.join(ROOT, '404.html');
  if (fs.existsSync(f)) return res.status(404).sendFile(f);
  res.status(404).send('Not Found');
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`ICELABS site serving on port ${PORT}`);
});
