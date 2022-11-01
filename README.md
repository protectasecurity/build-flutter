# Flutter GitHub Actions

Flutter GitHub Actions allows you to build flutter projects

## Example usage

```yaml
on: [push]

jobs:
  flutter:
    runs-on: ubuntu-latest
    environment: develop
    steps:

      - name: Checkout
        uses: actions/checkout@v3

      - name: Build
        uses: protectasecurity/build-flutter@v1
        with:
          type: 'web'
          params: '--dart-define=ENVIRONMENT=DEV --web-renderer canvaskit --release'
          workspace: 'packages/ofvi_web'
```
Output: /dist


## Inputs

- `type` **Required** Flutter build type
- `params` **Optional** Flutter build params
- `workspace` **Optional** Relative path under $GITHUB_WORKSPACE to place the project

## Outputs

- `status` Returned status code.

## Authors

- [Ronnie Ayala](https://github.com/ronnieacs)