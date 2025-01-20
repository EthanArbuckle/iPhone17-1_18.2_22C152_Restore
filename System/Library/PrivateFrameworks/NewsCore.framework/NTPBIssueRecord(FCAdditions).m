@interface NTPBIssueRecord(FCAdditions)
- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions;
- (id)generateMetadataJSONAssetHandleWithAssetManager:()FCAdditions;
- (uint64_t)isAllowedInStorefront:()FCAdditions;
@end

@implementation NTPBIssueRecord(FCAdditions)

- (id)generateMetadataJSONAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  if ([a1 hasMetadataURL])
  {
    v5 = [a1 metadataURL];
    v6 = [a1 base];
    int v7 = [v6 cacheLifetimeHint];
    if (v7 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7 == 1;
    }
    v9 = [v4 assetHandleForCKAssetURLString:v5 lifetimeHint:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)generateCoverImageAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  if ([a1 hasCoverImageURL])
  {
    v5 = [a1 coverImageURL];
    v6 = [a1 base];
    int v7 = [v6 cacheLifetimeHint];
    if (v7 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7 == 1;
    }
    v9 = [v4 assetHandleForCKAssetURLString:v5 lifetimeHint:v8];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (uint64_t)isAllowedInStorefront:()FCAdditions
{
  id v4 = a3;
  v5 = +[FCRestrictions sharedInstance];
  v6 = [a1 allowedStorefrontIDs];
  int v7 = [a1 blockedStorefrontIDs];
  uint64_t v8 = [v5 isContentAllowedInStorefrontID:v4 withAllowedStorefrontIDs:v6 blockedStorefrontIDs:v7];

  return v8;
}

@end