# my-fish-functions

## gh-cdp.fish

`gh`コマンドのラッパー

1. ブランチを作成
2. 空コミットを行いpush
3. `gh`コマンドでDraftPRを作成
4. `open`コマンドで作成したPRをブラウザで表示

をワンコマンドで実現するfunctionです。

- b/branch
  - 作成するブランチの名前。指定しないとブランチ作成からpushの処理を行いません
- t/title
  - 作成するPRのタイトル。必須 
