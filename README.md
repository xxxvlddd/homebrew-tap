# Homebrew tap: xxxvlddd/tap

Установка [GREENFOX](https://github.com/xxxvlddd/greenfox) — домашней
бухгалтерии для Mac на Apple Silicon:

```sh
brew install --cask xxxvlddd/tap/greenfox
```

Обновление — `brew upgrade --cask greenfox`, удаление —
`brew uninstall --cask greenfox` (с `--zap` — вместе с учётом).

Формула — [Casks/greenfox.rb](Casks/greenfox.rb): скачивает
`GREENFOX-arm64.dmg` со страницы релиза нужной версии и сверяет его
контрольную сумму.
