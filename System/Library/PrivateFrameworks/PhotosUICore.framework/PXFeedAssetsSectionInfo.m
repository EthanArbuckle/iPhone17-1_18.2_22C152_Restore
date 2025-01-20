@interface PXFeedAssetsSectionInfo
- (BOOL)areAllAssetsLiked;
- (BOOL)containsAsset:(id)a3;
- (BOOL)hasPlayableAssetForItemAtIndex:(int64_t)a3;
- (BOOL)isMine;
- (id)assetForItemAtIndex:(int64_t)a3;
- (id)assets;
- (id)batchIDForItemAtIndex:(int64_t)a3;
- (id)captionForItemAtIndex:(int64_t)a3;
- (id)cloudFeedAssetsEntry;
- (id)commentForItemAtIndex:(int64_t)a3;
- (id)commentsForItemAtIndex:(int64_t)a3;
- (id)countsByAssetDisplayType;
- (id)likesForItemAtIndex:(int64_t)a3;
- (int64_t)indexOfFirstItemFromLastBatch;
- (int64_t)indexOfItemWithAsset:(id)a3;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
- (unint64_t)assetsCount;
- (void)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4;
- (void)updateFromCloudFeedEntry;
@end

@implementation PXFeedAssetsSectionInfo

- (BOOL)isMine
{
  if ([(PXFeedSectionInfo *)self numberOfItems] < 1)
  {
    v3 = 0;
  }
  else
  {
    v3 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:0];
  }
  char v4 = [v3 cloudIsMyAsset];

  return v4;
}

- (unint64_t)assetsCount
{
  int64_t v3 = [(PXFeedSectionInfo *)self numberOfItems];
  char v4 = [(PXFeedSectionInfo *)self excludedAssetIndexes];
  unint64_t v5 = v3 - [v4 count];

  return v5;
}

- (id)assets
{
  int64_t v3 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  char v4 = [v3 entryAssets];
  unint64_t v5 = [(PXFeedSectionInfo *)self excludedAssetIndexes];
  if ([v5 count])
  {
    v6 = (void *)[v4 mutableCopy];
    [v6 removeObjectsAtIndexes:v5];

    char v4 = v6;
  }

  return v4;
}

- (int64_t)indexOfItemWithAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  v6 = [v5 entryAssets];
  int64_t v7 = [v6 indexOfObject:v4];

  return v7;
}

- (BOOL)containsAsset:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  v6 = [v5 entryAssets];
  char v7 = [v6 containsObject:v4];

  return v7;
}

- (BOOL)areAllAssetsLiked
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  int64_t v3 = [v2 entryAssets];
  if ([v3 count])
  {
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = v3;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "userCloudSharedLiked", (void)v11))
          {
            BOOL v9 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    BOOL v9 = 1;
LABEL_12:
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)getPhotoCount:(unint64_t *)a3 videoCount:(unint64_t *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  uint64_t v7 = [v6 entryAssets];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v7);
        }
        int v14 = [*(id *)(*((void *)&v15 + 1) + 8 * i) kind];
        if (v14 == 1)
        {
          ++v10;
        }
        else if (!v14)
        {
          ++v11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
    if (a3) {
      goto LABEL_13;
    }
  }
  else
  {
    unint64_t v10 = 0;
    unint64_t v11 = 0;
    if (a3) {
LABEL_13:
    }
      *a3 = v11;
  }
  if (a4) {
    *a4 = v10;
  }
}

- (id)countsByAssetDisplayType
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  int64_t v3 = [v2 entryAssets];
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "px_displayType", (void)v13);
        unint64_t v11 = [NSNumber numberWithInteger:v10];
        [v4 addObject:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)likesForItemAtIndex:(int64_t)a3
{
  int64_t v3 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:a3];
  id v4 = [v3 orderedLikeComments];

  return v4;
}

- (id)commentsForItemAtIndex:(int64_t)a3
{
  int64_t v3 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:a3];
  id v4 = [v3 orderedCloudComments];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_187761];
  uint64_t v6 = [v4 filteredOrderedSetUsingPredicate:v5];

  return v6;
}

uint64_t __50__PXFeedAssetsSectionInfo_commentsForItemAtIndex___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 isCaption];
  uint64_t v3 = [v2 BOOLValue] ^ 1;

  return v3;
}

- (id)commentForItemAtIndex:(int64_t)a3
{
  uint64_t v6 = [(PXFeedAssetsSectionInfo *)self commentsForItemAtIndex:0];
  if (!v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXFeedAssetsSectionInfo.m" lineNumber:113 description:@"Invalid comments for requested item"];
  }
  if ([v6 count] <= (unint64_t)a3)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXFeedAssetsSectionInfo.m" lineNumber:114 description:@"Invalid comment requrested from item"];
  }
  uint64_t v7 = [v6 objectAtIndexedSubscript:a3];

  return v7;
}

- (int64_t)indexOfFirstItemFromLastBatch
{
  uint64_t v3 = [(PXFeedSectionInfo *)self numberOfItems];
  id v4 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:v3 - 1];
  id v5 = [v4 cloudBatchID];
  int64_t v6 = v3 - 1;
  if (v3 >= 1)
  {
    uint64_t v7 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:v3 - 1];
    uint64_t v8 = [v7 cloudBatchID];
    int v9 = [v5 isEqualToString:v8];

    if (v9)
    {
      while (1)
      {
        int64_t v6 = v3 - 1;
        if (v3 - 1 < 1) {
          break;
        }
        uint64_t v10 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:v3 - 2];
        unint64_t v11 = [v10 cloudBatchID];
        char v12 = [v5 isEqualToString:v11];

        uint64_t v3 = v6;
        if ((v12 & 1) == 0) {
          goto LABEL_7;
        }
      }
      int64_t v6 = 0;
    }
  }
LABEL_7:

  return v6;
}

- (id)batchIDForItemAtIndex:(int64_t)a3
{
  uint64_t v3 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:a3];
  id v4 = [v3 cloudBatchID];

  return v4;
}

- (id)captionForItemAtIndex:(int64_t)a3
{
  uint64_t v3 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:a3];
  id v4 = [v3 orderedCloudComments];
  if ([v4 count])
  {
    id v5 = [v4 objectAtIndex:0];
    int64_t v6 = [v5 isCaption];
    int v7 = [v6 BOOLValue];

    uint64_t v8 = 0;
    if (v7)
    {
      uint64_t v8 = [v5 commentText];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  id v4 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  id v5 = [v4 entryAssets];
  int64_t v6 = [v5 objectAtIndex:a3];

  return v6;
}

- (BOOL)hasPlayableAssetForItemAtIndex:(int64_t)a3
{
  uint64_t v3 = [(PXFeedAssetsSectionInfo *)self assetForItemAtIndex:a3];
  char v4 = [v3 canPlayPhotoIris];

  return v4;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (void)updateFromCloudFeedEntry
{
  v9.receiver = self;
  v9.super_class = (Class)PXFeedAssetsSectionInfo;
  [(PXFeedSectionInfo *)&v9 updateFromCloudFeedEntry];
  uint64_t v3 = [(PXFeedAssetsSectionInfo *)self cloudFeedAssetsEntry];
  char v4 = [v3 entryAssets];
  uint64_t v5 = [v4 count];
  int64_t v6 = [v3 entryAlbumGUID];
  int v7 = [(PXFeedSectionInfo *)self sharedAlbumWithGUID:v6];
  uint64_t v8 = [v7 localizedTitle];
  [(PXFeedSectionInfo *)self setNumberOfItems:v5];
  [(PXFeedSectionInfo *)self setSharedAlbum:v7];
  [(PXFeedSectionInfo *)self setAlbumTitle:v8];
}

- (id)cloudFeedAssetsEntry
{
  char v4 = [(PXFeedSectionInfo *)self cloudFeedEntry];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    int64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"PXFeedAssetsSectionInfo.m" lineNumber:32 description:@"unexpected cloud feed entry class"];
  }
  return v4;
}

- (int64_t)sectionType
{
  return 0;
}

@end