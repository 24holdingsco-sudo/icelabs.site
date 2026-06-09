const express = require('express');
const path = require('path');
const fs = require('fs');

const app = express();
const PORT = process.env.PORT || 3000;

app.use(express.static(__dirname, {
  setHeaders: (res, filePath) => {
    if (filePath.endsWith('.html')) {
      res.set('Cache-Control', 'public, max-age=0, must-revalidate');
    }
    if (filePath.endsWith('.xml') || filePath.endsWith('.txt')) {
      res.set('Content-Type', 'text/plain; charset=utf-8');
    }
  }
}));

app.get('*', (req, res) => {
  const filePath = path.join(__dirname, req.path);

  if (req.path.startsWith('/shows/') && !req.path.endsWith('.html')) {
    const withHtml = filePath + '.html';
    if (fs.existsSync(withHtml)) {
      return res.sendFile(withHtml);
    }
  }

  const htmlFile = filePath.endsWith('.html') ? filePath : filePath + '.html';
  if (fs.existsSync(htmlFile)) {
    return res.sendFile(htmlFile);
  }

  res.status(404).sendFile(path.join(__dirname, '404.html'));
});

app.listen(PORT, '0.0.0.0', () => {
  console.log(`ICELABS site serving on port ${PORT}`);
});
