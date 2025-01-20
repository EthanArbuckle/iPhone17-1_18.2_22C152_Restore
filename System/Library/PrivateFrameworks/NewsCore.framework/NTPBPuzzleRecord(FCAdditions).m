@interface NTPBPuzzleRecord(FCAdditions)
- (id)generateThumbnailLargeImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateThumbnailSmallImageAssetHandleWithAssetManager:()FCAdditions;
@end

@implementation NTPBPuzzleRecord(FCAdditions)

- (id)generateThumbnailSmallImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 thumbnailImageCompactURL];
  if (v5)
  {
    v6 = [a1 thumbnailImageCompactURL];
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

- (id)generateThumbnailLargeImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 thumbnailImageLargeURL];
  if (v5)
  {
    v6 = [a1 thumbnailImageLargeURL];
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

@end