@interface NTPBArticleRecord(FCAdditions)
- (id)generateFlintDocumentAssetHandleWithAssetManager:()FCAdditions;
- (id)generateThumbnailAssetHandleForURL:()FCAdditions withAssetManager:;
- (id)generateWebExcerptAssetHandleWithAssetManager:()FCAdditions;
- (id)narrativeTrackFullIdentifier;
- (id)narrativeTrackSampleIdentifier;
- (id)topicIDs;
- (uint64_t)isAllowedInStorefront:()FCAdditions;
@end

@implementation NTPBArticleRecord(FCAdditions)

- (id)generateThumbnailAssetHandleForURL:()FCAdditions withAssetManager:
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

- (id)topicIDs
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CA48];
  v3 = [a1 topics];
  v4 = objc_msgSend(v2, "arrayWithCapacity:", objc_msgSend(v3, "count"));

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = objc_msgSend(a1, "topics", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) tagID];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)narrativeTrackFullIdentifier
{
  v2 = NSString;
  v3 = [a1 base];
  v4 = [v3 identifier];
  v5 = NSNumber;
  uint64_t v6 = [a1 narrativeTrackFullURL];
  uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  uint64_t v8 = [v2 stringWithFormat:@"%@-narration-full-%@", v4, v7];

  return v8;
}

- (id)narrativeTrackSampleIdentifier
{
  v2 = NSString;
  v3 = [a1 base];
  v4 = [v3 identifier];
  v5 = NSNumber;
  uint64_t v6 = [a1 narrativeTrackSampleURL];
  uint64_t v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "hash"));
  uint64_t v8 = [v2 stringWithFormat:@"%@-narration-sample-%@", v4, v7];

  return v8;
}

- (id)generateFlintDocumentAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 flintDocumentURL];
  if (v5)
  {
    uint64_t v6 = [a1 base];
    int v7 = [v6 cacheLifetimeHint];
    if (v7 == 2) {
      uint64_t v8 = 2;
    }
    else {
      uint64_t v8 = v7 == 1;
    }
    int v9 = [v4 assetHandleForCKAssetURLString:v5 lifetimeHint:v8];
  }
  else
  {
    int v9 = 0;
  }

  return v9;
}

- (id)generateWebExcerptAssetHandleWithAssetManager:()FCAdditions
{
  id v4 = a3;
  v5 = [a1 base];
  int v6 = [v5 cacheLifetimeHint];
  if (v6 == 2) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6 == 1;
  }

  uint64_t v8 = [a1 excerptURL];

  if (v8)
  {
    int v9 = [a1 excerptURL];
    [v4 assetHandleForCKAssetURLString:v9 lifetimeHint:v7];
  }
  else
  {
    uint64_t v10 = [a1 base];
    v11 = [v10 identifier];
    long long v12 = [a1 base];
    long long v13 = [v12 changeTag];
    int v9 = +[FCExcerptURLProtocol excerptURLForArticleID:v11 changeTag:v13];

    [v4 assetHandleForURL:v9 lifetimeHint:v7];
  long long v14 = };

  return v14;
}

- (uint64_t)isAllowedInStorefront:()FCAdditions
{
  id v4 = a3;
  v5 = +[FCRestrictions sharedInstance];
  int v6 = [a1 allowedStorefrontIDs];
  uint64_t v7 = [a1 blockedStorefrontIDs];
  uint64_t v8 = [v5 isContentAllowedInStorefrontID:v4 withAllowedStorefrontIDs:v6 blockedStorefrontIDs:v7];

  return v8;
}

@end