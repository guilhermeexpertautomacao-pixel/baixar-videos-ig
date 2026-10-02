# baixar-videos-ig

Baixa os reels do Instagram listados em `links.txt` usando [yt-dlp](https://github.com/yt-dlp/yt-dlp).

```bash
./baixar.sh                # sem login
./baixar.sh cookies.txt    # com cookies do Instagram (se pedir login)
```

Os vídeos ficam em `videos/`. Links já baixados são pulados nas próximas execuções.
Para adicionar vídeos, inclua novos links (um por linha) em `links.txt`.
