@interface NTPBTagRecord(FCAdditions)
- (id)generateCoverImageAssetHandleForURLString:()FCAdditions withAssetManager:;
- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateFeedNavImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateFeedNavImageHQAssetHandleWithAssetManager:()FCAdditions;
- (id)generateLogoImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageCompactAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageForDarkBackgroundAssetHandleWithAssetManager:()FCAdditions;
- (id)generateNameImageLargeAssetHandleForURLString:()FCAdditions withAssetManager:;
- (id)generateNameImageLargeMaskAssetHandleForURLString:()FCAdditions withAssetManager:;
- (id)generateNameImageMaskAssetHandleForURL:()FCAdditions withAssetManager:;
- (id)generateNavigationChromeBackgroundImageAssetHandleForURLString:()FCAdditions withAssetManager:;
- (id)generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:()FCAdditions withAssetManager:;
- (id)generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:()FCAdditions withAssetManager:;
- (id)generateSportsLogoAltImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateSportsLogoAltImageCompactAssetHandleWithAssetManager:()FCAdditions;
- (id)generateSportsLogoAltImageLargeAssetHandleWithAssetManager:()FCAdditions;
- (id)generateSportsLogoImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateSportsLogoImageCompactAssetHandleWithAssetManager:()FCAdditions;
- (id)generateSportsLogoImageLargeAssetHandleWithAssetManager:()FCAdditions;
@end

@implementation NTPBTagRecord(FCAdditions)

- (id)generateNameImageMaskAssetHandleForURL:()FCAdditions withAssetManager:
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v12 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "assetManager");
    *(_DWORD *)buf = 136315906;
    v15 = "-[NTPBTagRecord(FCAdditions) generateNameImageMaskAssetHandleForURL:withAssetManager:]";
    __int16 v16 = 2080;
    v17 = "NTPBTagRecord+FCAdditions.m";
    __int16 v18 = 1024;
    int v19 = 41;
    __int16 v20 = 2114;
    v21 = v12;
    _os_log_error_impl(&dword_1A460D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    if (v6) {
      goto LABEL_4;
    }
  }
  else if (v6)
  {
LABEL_4:
    v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v7 assetHandleForCKAssetURLString:v6 lifetimeHint:v10];

    goto LABEL_10;
  }
  v11 = 0;
LABEL_10:

  return v11;
}

- (id)generateNavigationChromeBackgroundImageLargeAssetHandleForURLString:()FCAdditions withAssetManager:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v6 assetHandleForCKAssetURLString:v7 lifetimeHint:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNavigationChromeBackgroundImageCompactAssetHandleForURLString:()FCAdditions withAssetManager:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v6 assetHandleForCKAssetURLString:v7 lifetimeHint:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNavigationChromeBackgroundImageAssetHandleForURLString:()FCAdditions withAssetManager:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v6 assetHandleForCKAssetURLString:v7 lifetimeHint:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateSportsLogoImageLargeAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 sportsLogoImageLargeURL];

  if (v5)
  {
    id v6 = [a1 sportsLogoImageLargeURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 sportsLogoImageCompactURL];

  if (v5)
  {
    id v6 = [a1 sportsLogoImageCompactURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 sportsLogoImageURL];

  if (v5)
  {
    id v6 = [a1 sportsLogoImageURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoAltImageLargeAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 sportsLogoAltImageLargeURL];

  if (v5)
  {
    id v6 = [a1 sportsLogoAltImageLargeURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoAltImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 sportsLogoAltImageCompactURL];

  if (v5)
  {
    id v6 = [a1 sportsLogoAltImageCompactURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateSportsLogoAltImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 sportsLogoAltImageURL];

  if (v5)
  {
    id v6 = [a1 sportsLogoAltImageURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateNameImageLargeMaskAssetHandleForURLString:()FCAdditions withAssetManager:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    int v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v6 assetHandleForCKAssetURLString:v7 lifetimeHint:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateNameImageForDarkBackgroundAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageForDarkBackgroundURL];
  if (v5)
  {
    id v6 = [a1 nameImageForDarkBackgroundURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateNameImageCompactAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageCompactURL];
  if (v5)
  {
    id v6 = [a1 nameImageCompactURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateNameImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 nameImageURL];
  if (v5)
  {
    id v6 = [a1 nameImageURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateLogoImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 logoURL];
  if (v5)
  {
    id v6 = [a1 logoURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateFeedNavImageHQAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 feedNavImageHQURL];
  if (v5)
  {
    id v6 = [a1 feedNavImageHQURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateFeedNavImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 feedNavImageURL];
  if (v5)
  {
    id v6 = [a1 feedNavImageURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateNameImageLargeAssetHandleForURLString:()FCAdditions withAssetManager:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    int v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v6 assetHandleForCKAssetURLString:v7 lifetimeHint:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 coverImageURL];
  if (v5)
  {
    id v6 = [a1 coverImageURL];
    id v7 = [a1 base];
    int v8 = [v7 cacheLifetimeHint];
    if (v8 == 2) {
      uint64_t v9 = 2;
    }
    else {
      uint64_t v9 = v8 == 1;
    }
    uint64_t v10 = [v4 assetHandleForCKAssetURLString:v6 lifetimeHint:v9];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)generateCoverImageAssetHandleForURLString:()FCAdditions withAssetManager:
{
  if (a3)
  {
    id v6 = a4;
    id v7 = a3;
    int v8 = [a1 base];
    int v9 = [v8 cacheLifetimeHint];
    if (v9 == 2) {
      uint64_t v10 = 2;
    }
    else {
      uint64_t v10 = v9 == 1;
    }
    v11 = [v6 assetHandleForCKAssetURLString:v7 lifetimeHint:v10];
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

@end