# baixar-videos-ig

Baixa os reels do Instagram listados em `links.txt` usando [yt-dlp](https://github.com/yt-dlp/yt-dlp).

```bash
./baixar.sh                # sem login
./baixar.sh chrome         # usa a sessão logada do Google Chrome (feche o Chrome antes)
./baixar.sh cookies.txt    # usa cookies exportados do navegador
```

Os vídeos ficam em `videos/`. Links já baixados são pulados nas próximas execuções.
Para adicionar vídeos, inclua novos links (um por linha) em `links.txt`.
