@interface PXFeedTestAssetsSectionInfo
- (NSArray)plAssets;
- (PXFeedTestAssetsSectionInfo)initWithPhotoLibrary:(id)a3;
- (id)_fetchPhotoAssets:(int64_t)a3;
- (id)assetForItemAtIndex:(int64_t)a3;
- (id)countsByAssetDisplayType;
- (int64_t)sectionType;
- (int64_t)typeForItemAtIndex:(int64_t)a3;
@end

@implementation PXFeedTestAssetsSectionInfo

- (void).cxx_destruct
{
}

- (NSArray)plAssets
{
  return self->_plAssets;
}

- (id)_fetchPhotoAssets:(int64_t)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  v6 = [MEMORY[0x1E4F8A950] entityName];
  v7 = [v5 fetchRequestWithEntityName:v6];

  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", @"kind", 0);
  v22[0] = v9;
  v10 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCloudSharedAsset"), 1);
  v22[1] = v10;
  v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  v12 = [v8 andPredicateWithSubpredicates:v11];
  [v7 setPredicate:v12];

  [v7 setFetchLimit:a3];
  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
  v21 = v13;
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v7 setSortDescriptors:v14];

  v15 = [(PXFeedTestSectionInfo *)self photoLibrary];
  v16 = [v15 managedObjectContext];

  v17 = [v16 executeFetchRequest:v7 error:0];
  if (![v17 count])
  {
    v18 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"(kind = %d)", 0);
    [v7 setPredicate:v18];

    uint64_t v19 = [v16 executeFetchRequest:v7 error:0];

    v17 = (void *)v19;
  }

  return v17;
}

- (id)countsByAssetDisplayType
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v2 = [(PXFeedTestAssetsSectionInfo *)self plAssets];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "px_displayType", (void)v12);
        v10 = [NSNumber numberWithInteger:v9];
        [v3 addObject:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)assetForItemAtIndex:(int64_t)a3
{
  id v4 = [(PXFeedTestAssetsSectionInfo *)self plAssets];
  uint64_t v5 = [v4 objectAtIndexedSubscript:a3];

  return v5;
}

- (int64_t)typeForItemAtIndex:(int64_t)a3
{
  return 0;
}

- (int64_t)sectionType
{
  return 0;
}

- (PXFeedTestAssetsSectionInfo)initWithPhotoLibrary:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXFeedTestAssetsSectionInfo;
  id v3 = [(PXFeedTestSectionInfo *)&v8 initWithPhotoLibrary:a3];
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [(PXFeedTestAssetsSectionInfo *)v3 _fetchPhotoAssets:[(PXFeedTestSectionInfo *)v3 countOfItems]];
    plAssets = v4->_plAssets;
    v4->_plAssets = (NSArray *)v5;
  }
  return v4;
}

@end