@interface NTPBPuzzleTypeRecord(FCAdditions)
- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateExploreTileImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateFeedNavImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageCompactAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageForDarkBackgroundAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageMaskAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNavigationChromeBackgroundDarkModeImageCompactHandleWithAssetManager:()FCAdditions;
- (id)generateNavigationChromeBackgroundDarkModeImageHandleWithAssetManager:()FCAdditions;
- (id)generateNavigationChromeBackgroundDarkModeImageLargeHandleWithAssetManager:()FCAdditions;
- (id)generateNavigationChromeBackgroundImageCompactHandleWithAssetManager:()FCAdditions;
- (id)generateNavigationChromeBackgroundImageHandleWithAssetManager:()FCAdditions;
- (id)generateNavigationChromeBackgroundImageLargeHandleWithAssetManager:()FCAdditions;
- (id)generateThumbnailImageAssetHandleForDate:()FCAdditions difficulty:assetManager:;
@end

@implementation NTPBPuzzleTypeRecord(FCAdditions)

- (id)generateNameImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageURL];
  if (v5)
  {
    v6 = [a1 nameImageURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNameImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageCompactURL];
  if (v5)
  {
    v6 = [a1 nameImageCompactURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNameImageForDarkBackgroundAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageForDarkBackgroundURL];
  if (v5)
  {
    v6 = [a1 nameImageForDarkBackgroundURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNameImageMaskAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageMaskURL];
  if (v5)
  {
    v6 = [a1 nameImageMaskURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 coverImageURL];
  if (v5)
  {
    v6 = [a1 coverImageURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateFeedNavImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 feedNavImageURL];
  if (v5)
  {
    v6 = [a1 feedNavImageURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateExploreTileImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 exploreTileImageURL];
  if (v5)
  {
    v6 = [a1 exploreTileImageURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNavigationChromeBackgroundImageHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 navigationChromeBackgroundImageURL];
  if (v5)
  {
    v6 = [a1 navigationChromeBackgroundImageURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNavigationChromeBackgroundImageCompactHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 navigationChromeBackgroundImageCompactURL];
  if (v5)
  {
    v6 = [a1 navigationChromeBackgroundImageCompactURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNavigationChromeBackgroundImageLargeHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 navigationChromeBackgroundImageLargeURL];
  if (v5)
  {
    v6 = [a1 navigationChromeBackgroundImageLargeURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNavigationChromeBackgroundDarkModeImageHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 navigationChromeBackgroundDarkModeImageURL];
  if (v5)
  {
    v6 = [a1 navigationChromeBackgroundDarkModeImageURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNavigationChromeBackgroundDarkModeImageCompactHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 navigationChromeBackgroundDarkModeImageCompactURL];
  if (v5)
  {
    v6 = [a1 navigationChromeBackgroundDarkModeImageCompactURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateNavigationChromeBackgroundDarkModeImageLargeHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 navigationChromeBackgroundDarkModeImageLargeURL];
  if (v5)
  {
    v6 = [a1 navigationChromeBackgroundDarkModeImageLargeURL];
    v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)generateThumbnailImageAssetHandleForDate:()FCAdditions difficulty:assetManager:
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [a1 imagesResourceID];
  if (v11)
  {
    v12 = +[FCPuzzleThumbnailURLProtocol URLForResourceMapID:v11 publishDate:v8 difficulty:v9];
    v13 = [a1 base];
    int v14 = [v13 cacheLifetimeHint];
    if (v14 == 2) {
      uint64_t v15 = 2;
    }
    else {
      uint64_t v15 = v14 == 1;
    }
    v16 = [v10 assetHandleForURL:v12 lifetimeHint:v15];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

@end