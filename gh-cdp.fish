function gh-cdp                                                                                                                                                                                                                                                                                                                                                                                                                                
  argparse -n gh-cdp 'b/branch=' 't/title=' -- $argv
  or return 1
  if not set -lq _flag_title
    echo "PRタイトルは必須です"
    return 1
  end
  if set -lq _flag_branch
    git checkout -b $_flag_branch
    git commit --allow-empty -m "[ci skip]empty commit"
    set -l current_branch (git rev-parse --abbrev-ref HEAD)
    git push --set-upstream origin $current_branch
  end
  set gh_options -d -f -a @me -t $_flag_title
  set -l git_root (git rev-parse --show-toplevel)
  if test -e $git_root/.github/pull_request_template.md
    set gh_options $gh_options -F $git_root/.github/pull_request_template.md
  end
  if test -e $git_root/.github/PULL_REQUEST_TEMPATE.md
    set gh_options $gh_options -F $git_root/.github/PULL_REQUEST_TEMPATE.md
  end
  gh pr create $gh_options | tail -n 1 | read pr_url
  open $pr_url
end
