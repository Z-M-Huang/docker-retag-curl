# docker-retag-curl
Retag official docker hub images with curl. Multi-arch images supported

## Usage
Retag to latest

```yaml
- name: Retag to latest
  uses: Z-M-Huang/docker-retag-curl@0.1.0
  with:
    repo: username/repo
    old_tag: ${{ github.sha }}
    new_tag: latest
    username: github
    password: ${{ secrets.GITHUB_TOKEN }}
```