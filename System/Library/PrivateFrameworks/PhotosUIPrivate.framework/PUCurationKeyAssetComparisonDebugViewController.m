@interface PUCurationKeyAssetComparisonDebugViewController
- (BOOL)shouldShowSectionHeaders;
- (void)_fetchHighlights;
- (void)didTapHeaderView:(id)a3;
- (void)toggleShowsDifferentOnly:(id)a3;
- (void)toggleShowsMeaningsOnly:(id)a3;
- (void)updateData;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PUCurationKeyAssetComparisonDebugViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visibleAssets, 0);
  objc_storeStrong((id *)&self->_indexMap, 0);
  objc_storeStrong((id *)&self->_keyAssetReasons, 0);
  objc_storeStrong((id *)&self->_modernKeyAssets, 0);
  objc_storeStrong((id *)&self->_legacyKeyAssets, 0);
  objc_storeStrong((id *)&self->_currentKeyAssets, 0);
  objc_storeStrong((id *)&self->_highlights, 0);
}

- (void)didTapHeaderView:(id)a3
{
  v4 = -[NSMutableArray objectAtIndexedSubscript:](self->_indexMap, "objectAtIndexedSubscript:", [a3 sectionIndex]);
  uint64_t v5 = [v4 unsignedIntegerValue];

  id v8 = [(NSArray *)self->_highlights objectAtIndexedSubscript:v5];
  v6 = (void *)[objc_alloc(MEMORY[0x1E4F90298]) initWithHighlight:v8];
  [v6 setInitiallyShowCuration:1];
  [v6 setCurrentCurationType:0];
  v7 = [(PUCurationKeyAssetComparisonDebugViewController *)self navigationController];
  [v7 pushViewController:v6 animated:1];
}

- (void)updateData
{
  v39[3] = *MEMORY[0x1E4F143B8];
  obj = self->_legacyKeyAssets;
  objc_sync_enter(obj);
  NSUInteger v37 = [(NSArray *)self->_highlights count];
  v35 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v37];
  v38 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:3 * v37];
  [(NSMutableArray *)self->_indexMap removeAllObjects];
  v36 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  if (v37)
  {
    for (uint64_t i = 0; v37 != i; ++i)
    {
      v4 = [(NSMutableArray *)self->_currentKeyAssets objectAtIndexedSubscript:i];
      uint64_t v5 = [(NSMutableArray *)self->_legacyKeyAssets objectAtIndexedSubscript:i];
      v6 = [(NSMutableArray *)self->_modernKeyAssets objectAtIndexedSubscript:i];
      if (!self->_showsDifferentOnly) {
        goto LABEL_10;
      }
      if ([v4 isTransient]) {
        goto LABEL_10;
      }
      if ([v5 isTransient]) {
        goto LABEL_10;
      }
      if ([v6 isTransient]) {
        goto LABEL_10;
      }
      v7 = [v4 uuid];
      id v8 = [v5 uuid];
      int v9 = [v7 isEqualToString:v8];

      if (!v9
        || ([v5 uuid],
            v10 = objc_claimAutoreleasedReturnValue(),
            [v6 uuid],
            v11 = objc_claimAutoreleasedReturnValue(),
            int v12 = [v10 isEqualToString:v11],
            v11,
            v10,
            !v12))
      {
LABEL_10:
        int v16 = 1;
      }
      else
      {
        v13 = [v6 uuid];
        v14 = [v4 uuid];
        int v15 = [v13 isEqualToString:v14];

        int v16 = v15 ^ 1;
      }
      if (self->_showsMeaningsOnly)
      {
        v17 = [(NSMutableArray *)self->_keyAssetReasons objectAtIndexedSubscript:i];
        int v18 = [v17 hasPrefix:@"Meanings"];

        if (v16 & v18) {
          goto LABEL_15;
        }
      }
      else if (v16)
      {
LABEL_15:
        [v38 addObject:v4];
        [v38 addObject:v5];
        [v38 addObject:v6];
        v19 = [(NSArray *)self->_highlights objectAtIndexedSubscript:i];
        v20 = [(NSMutableArray *)self->_keyAssetReasons objectAtIndexedSubscript:i];
        if ([v20 length])
        {
          v21 = NSString;
          v22 = [v19 localizedSubtitle];
          v23 = [(NSMutableArray *)self->_keyAssetReasons objectAtIndexedSubscript:i];
          v24 = [v21 stringWithFormat:@"%@ - %@", v22, v23];
        }
        else
        {
          v24 = [v19 localizedSubtitle];
        }

        v25 = (void *)MEMORY[0x1E4F38EE8];
        v39[0] = v4;
        v39[1] = v5;
        v39[2] = v6;
        v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:3];
        v27 = [v25 transientAssetCollectionWithAssets:v26 title:v24 identifier:0 photoLibrary:v36];

        [v35 addObject:v27];
        indexMap = self->_indexMap;
        v29 = [NSNumber numberWithUnsignedInteger:i];
        [(NSMutableArray *)indexMap addObject:v29];
      }
    }
  }
  v30 = [MEMORY[0x1E4F38EE8] transientAssetCollectionWithAssets:v38 title:&stru_1F06BE7B8 identifier:0 photoLibrary:v36];
  v31 = [MEMORY[0x1E4F39008] transientCollectionListWithCollections:v35 title:@"Highlights"];
  v32 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v31 options:0];
  [(PUPhotosAlbumViewController *)self setAssetCollection:v30 fetchResultContainingAssetCollection:v32 filterPredicate:0];
  v33 = [(PUCurationKeyAssetComparisonDebugViewController *)self navigationController];
  [v33 setToolbarHidden:0];

  objc_sync_exit(obj);
}

- (void)toggleShowsMeaningsOnly:(id)a3
{
  BOOL showsMeaningsOnly = self->_showsMeaningsOnly;
  self->_BOOL showsMeaningsOnly = !showsMeaningsOnly;
  if (showsMeaningsOnly) {
    v6 = @"☐Meaningful Only";
  }
  else {
    v6 = @"☑︎Meaningful Only";
  }
  [a3 setTitle:v6];
  [(PUCurationKeyAssetComparisonDebugViewController *)self updateData];
}

- (void)toggleShowsDifferentOnly:(id)a3
{
  BOOL showsDifferentOnly = self->_showsDifferentOnly;
  self->_BOOL showsDifferentOnly = !showsDifferentOnly;
  if (showsDifferentOnly) {
    v6 = @"☐Different Only";
  }
  else {
    v6 = @"☑︎Different Only";
  }
  [a3 setTitle:v6];
  [(PUCurationKeyAssetComparisonDebugViewController *)self updateData];
}

- (BOOL)shouldShowSectionHeaders
{
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PUCurationKeyAssetComparisonDebugViewController;
  [(PUPhotosGridViewController *)&v4 viewWillDisappear:a3];
  self->_canLiveUpdate = 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUCurationKeyAssetComparisonDebugViewController;
  [(PUPhotosAlbumViewController *)&v7 viewDidAppear:a3];
  self->_canLiveUpdate = 1;
  objc_super v4 = [(PUCurationKeyAssetComparisonDebugViewController *)self navigationController];
  uint64_t v5 = [(PUCurationKeyAssetComparisonDebugViewController *)self toolbarItems];
  [v4 setToolbarItems:v5 animated:1];

  v6 = [(PUCurationKeyAssetComparisonDebugViewController *)self navigationController];
  [v6 setToolbarHidden:0];
}

- (void)_fetchHighlights
{
  v54[3] = *MEMORY[0x1E4F143B8];
  v41 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v3 = [v41 librarySpecificFetchOptions];
  objc_super v4 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v54[0] = v4;
  uint64_t v5 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v54[1] = v5;
  v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v54[2] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:3];
  [v3 setSortDescriptors:v7];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v9 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000301 options:v3];
  v10 = [v9 fetchedObjects];
  [v8 addObjectsFromArray:v10];

  v42 = v3;
  v11 = [MEMORY[0x1E4F38EE8] fetchAssetCollectionsWithType:6 subtype:1000000304 options:v3];
  int v12 = [v11 fetchedObjects];
  [v8 addObjectsFromArray:v12];

  v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"startDate" ascending:0];
  v53[0] = v13;
  v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"endDate" ascending:0];
  v53[1] = v14;
  int v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
  v53[2] = v15;
  int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v53 count:3];
  [v8 sortUsingDescriptors:v16];

  v40 = v8;
  objc_storeStrong((id *)&self->_highlights, v8);
  NSUInteger v17 = [(NSArray *)self->_highlights count];
  int v18 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  currentKeyAssets = self->_currentKeyAssets;
  self->_currentKeyAssets = v18;

  v20 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  legacyKeyAssets = self->_legacyKeyAssets;
  self->_legacyKeyAssets = v20;

  v22 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  modernKeyAssets = self->_modernKeyAssets;
  self->_modernKeyAssets = v22;

  v24 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  keyAssetReasons = self->_keyAssetReasons;
  self->_keyAssetReasons = v24;

  v26 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v17];
  indexMap = self->_indexMap;
  self->_indexMap = v26;

  v28 = objc_alloc_init(PHNullAsset);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  obj = self->_highlights;
  uint64_t v29 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v49 != v31) {
          objc_enumerationMutation(obj);
        }
        v33 = [MEMORY[0x1E4F38EB8] fetchKeyCuratedAssetInAssetCollection:*(void *)(*((void *)&v48 + 1) + 8 * i) referenceAsset:0];
        uint64_t v34 = [v33 firstObject];
        v35 = (void *)v34;
        if (v34) {
          v36 = (void *)v34;
        }
        else {
          v36 = v28;
        }
        id v37 = v36;

        [(NSMutableArray *)self->_currentKeyAssets addObject:v37];
        [(NSMutableArray *)self->_legacyKeyAssets addObject:v28];
        [(NSMutableArray *)self->_modernKeyAssets addObject:v28];

        [(NSMutableArray *)self->_keyAssetReasons addObject:&stru_1F06BE7B8];
      }
      uint64_t v30 = [(NSArray *)obj countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v30);
  }

  v38 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke;
  block[3] = &unk_1E5F2E908;
  id v45 = v41;
  v46 = self;
  id v47 = &unk_1F078B958;
  id v39 = v41;
  dispatch_async(v38, block);
}

void __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  v23 = [*(id *)(a1 + 32) librarySpecificFetchOptions];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(*(void *)(a1 + 40) + 1776);
  uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v24)
  {
    uint64_t v1 = 0;
    uint64_t v22 = *(void *)v39;
    do
    {
      uint64_t v2 = 0;
      do
      {
        if (*(void *)v39 != v22)
        {
          uint64_t v3 = v2;
          objc_enumerationMutation(obj);
          uint64_t v2 = v3;
        }
        uint64_t v26 = v2;
        objc_super v4 = *(void **)(a1 + 32);
        uint64_t v5 = [*(id *)(*((void *)&v38 + 1) + 8 * v2) localIdentifier];
        uint64_t v6 = *(void *)(a1 + 48);
        id v37 = 0;
        v28 = [v4 curationDebugInformationForAssetCollectionWithLocalIdentifier:v5 options:v6 error:&v37];
        id v25 = v37;

        objc_super v7 = [v28 objectForKeyedSubscript:@"keyAssetComparison"];
        id v8 = (void *)MEMORY[0x1E4F38EB8];
        int v9 = [v7 allValues];
        v10 = [v8 fetchAssetsWithLocalIdentifiers:v9 options:v23];

        id v27 = *(id *)(*(void *)(a1 + 40) + 1792);
        objc_sync_enter(v27);
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v29 = v10;
        uint64_t v11 = [v29 countByEnumeratingWithState:&v33 objects:v42 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v34;
          do
          {
            for (uint64_t i = 0; i != v11; ++i)
            {
              if (*(void *)v34 != v12) {
                objc_enumerationMutation(v29);
              }
              v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
              int v15 = [v14 uuid];
              int v16 = [v7 objectForKeyedSubscript:@"legacyKeyAssetUUID"];
              int v17 = [v15 isEqualToString:v16];

              if (v17) {
                [*(id *)(*(void *)(a1 + 40) + 1792) replaceObjectAtIndex:v1 withObject:v14];
              }
              int v18 = [v7 objectForKeyedSubscript:@"keyAssetUUID"];
              int v19 = [v15 isEqualToString:v18];

              if (v19) {
                [*(id *)(*(void *)(a1 + 40) + 1800) replaceObjectAtIndex:v1 withObject:v14];
              }
            }
            uint64_t v11 = [v29 countByEnumeratingWithState:&v33 objects:v42 count:16];
          }
          while (v11);
        }

        v20 = [v28 objectForKeyedSubscript:@"keyAssetReason"];
        if ([v20 length]) {
          [*(id *)(*(void *)(a1 + 40) + 1808) replaceObjectAtIndex:v1 withObject:v20];
        }

        objc_sync_exit(v27);
        if (__ROR8__(0xCCCCCCCCCCCCCCCDLL * (v1 - 9), 1) <= 0x1999999999999998uLL)
        {
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_2;
          block[3] = &unk_1E5F2ED10;
          void block[4] = *(void *)(a1 + 40);
          dispatch_async(MEMORY[0x1E4F14428], block);
        }

        ++v1;
        uint64_t v2 = v26 + 1;
      }
      while (v26 + 1 != v24);
      uint64_t v24 = [obj countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v24);
  }

  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_3;
  v31[3] = &unk_1E5F2ED10;
  v31[4] = *(void *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], v31);
}

unsigned char *__67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_2(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[1834]) {
    return (unsigned char *)[result updateData];
  }
  return result;
}

unsigned char *__67__PUCurationKeyAssetComparisonDebugViewController__fetchHighlights__block_invoke_3(uint64_t a1)
{
  result = *(unsigned char **)(a1 + 32);
  if (result[1834]) {
    return (unsigned char *)[result updateData];
  }
  return result;
}

- (void)viewDidLoad
{
  v9[5] = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)PUCurationKeyAssetComparisonDebugViewController;
  [(PUPhotosAlbumViewController *)&v8 viewDidLoad];
  uint64_t v3 = [(PUCurationKeyAssetComparisonDebugViewController *)self collectionView];
  [v3 registerClass:objc_opt_class() forSupplementaryViewOfKind:*MEMORY[0x1E4FB2770] withReuseIdentifier:@"PUCurationKeyAssetComparisonViewSectionHeaderReuseIdentifier"];

  self->_BOOL showsDifferentOnly = 1;
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"☑︎Different Only" style:0 target:self action:sel_toggleShowsDifferentOnly_];
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithTitle:@"☐Meaningful Only" style:0 target:self action:sel_toggleShowsMeaningsOnly_];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:5 target:0 action:0];
  v9[0] = v6;
  v9[1] = v4;
  v9[2] = v6;
  v9[3] = v5;
  v9[4] = v6;
  objc_super v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:5];
  [(PUCurationKeyAssetComparisonDebugViewController *)self setToolbarItems:v7];

  [(PUCurationKeyAssetComparisonDebugViewController *)self _fetchHighlights];
}

@end