@interface PXSortOnceCollectionAction
+ (BOOL)canPerformOnCollection:(id)a3;
+ (id)assetDateIntervalOfCollection:(id)a3;
+ (id)collections:(id)a3 sortedByTag:(int64_t)a4;
+ (id)makeFetchOptionsWithPhotoLibrary:(id)a3;
- (NSArray)sortedChildCollections;
- (PHCollection)collection;
- (PHFetchResult)initialFetchResult;
- (PXSortOnceCollectionAction)initWithCollection:(id)a3 sortType:(int64_t)a4;
- (id)actionIdentifier;
- (id)makeFetchOptions;
- (int64_t)sortType;
- (void)performAction:(id)a3;
- (void)performUndo:(id)a3;
@end

@implementation PXSortOnceCollectionAction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initialFetchResult, 0);
  objc_storeStrong((id *)&self->_collection, 0);
  objc_storeStrong((id *)&self->_sortedChildCollections, 0);
}

- (PHFetchResult)initialFetchResult
{
  return self->_initialFetchResult;
}

- (int64_t)sortType
{
  return self->_sortType;
}

- (PHCollection)collection
{
  return self->_collection;
}

- (id)actionIdentifier
{
  return @"SortOnceCollectionAction";
}

- (void)performUndo:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__PXSortOnceCollectionAction_performUndo___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __42__PXSortOnceCollectionAction_performUndo___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F38FF8];
  v3 = [*(id *)(a1 + 32) collection];
  v4 = [*(id *)(a1 + 32) makeFetchOptions];
  id v10 = [v2 fetchCollectionsInCollectionList:v3 options:v4];

  v5 = (void *)MEMORY[0x1E4F39010];
  v6 = [*(id *)(a1 + 32) collection];
  v7 = [v5 changeRequestForCollectionList:v6 childCollections:v10];

  v8 = [*(id *)(a1 + 32) initialFetchResult];
  [v7 removeChildCollections:v8];
  v9 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));
  [v7 insertChildCollections:v8 atIndexes:v9];
}

- (void)performAction:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __44__PXSortOnceCollectionAction_performAction___block_invoke;
  v3[3] = &unk_1E5DD36F8;
  v3[4] = self;
  [(PXPhotosAction *)self performChanges:v3 completionHandler:a3];
}

void __44__PXSortOnceCollectionAction_performAction___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F39010];
  v3 = [*(id *)(a1 + 32) collection];
  v4 = [*(id *)(a1 + 32) initialFetchResult];
  id v7 = [v2 changeRequestForCollectionList:v3 childCollections:v4];

  v5 = [*(id *)(a1 + 32) sortedChildCollections];
  [v7 removeChildCollections:v5];
  v6 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, objc_msgSend(v5, "count"));
  [v7 insertChildCollections:v5 atIndexes:v6];
}

- (NSArray)sortedChildCollections
{
  sortedChildCollections = self->_sortedChildCollections;
  if (!sortedChildCollections)
  {
    v4 = objc_opt_class();
    v5 = [(PHFetchResult *)self->_initialFetchResult fetchedObjects];
    objc_msgSend(v4, "collections:sortedByTag:", v5, -[PXSortOnceCollectionAction sortType](self, "sortType"));
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    id v7 = self->_sortedChildCollections;
    self->_sortedChildCollections = v6;

    sortedChildCollections = self->_sortedChildCollections;
  }
  return sortedChildCollections;
}

- (PXSortOnceCollectionAction)initWithCollection:(id)a3 sortType:(int64_t)a4
{
  id v7 = a3;
  v8 = [v7 photoLibrary];
  v16.receiver = self;
  v16.super_class = (Class)PXSortOnceCollectionAction;
  v9 = [(PXPhotosAction *)&v16 initWithPhotoLibrary:v8];

  if (v9)
  {
    objc_storeStrong((id *)&v9->_collection, a3);
    v9->_sortType = a4;
    id v10 = (void *)MEMORY[0x1E4F38FF8];
    v11 = [(PXSortOnceCollectionAction *)v9 collection];
    v12 = [(PXSortOnceCollectionAction *)v9 makeFetchOptions];
    uint64_t v13 = [v10 fetchCollectionsInCollectionList:v11 options:v12];
    initialFetchResult = v9->_initialFetchResult;
    v9->_initialFetchResult = (PHFetchResult *)v13;
  }
  return v9;
}

- (id)makeFetchOptions
{
  v3 = objc_opt_class();
  v4 = [(PXPhotosAction *)self photoLibrary];
  v5 = [v3 makeFetchOptionsWithPhotoLibrary:v4];

  return v5;
}

+ (id)collections:(id)a3 sortedByTag:(int64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  if ((unint64_t)(a4 - 1) <= 1)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v6;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          v14 = [a1 assetDateIntervalOfCollection:v13];
          v15 = [v13 uuid];
          [v7 setObject:v14 forKeyedSubscript:v15];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    id v6 = v19;
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __54__PXSortOnceCollectionAction_collections_sortedByTag___block_invoke;
  v20[3] = &unk_1E5DBACA0;
  BOOL v22 = (unint64_t)(a4 - 1) < 2;
  id v21 = v7;
  BOOL v23 = a4 != 2;
  id v16 = v7;
  v17 = [v6 sortedArrayUsingComparator:v20];

  return v17;
}

uint64_t __54__PXSortOnceCollectionAction_collections_sortedByTag___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [v5 uuid];
  uint64_t v8 = [v6 uuid];
  uint64_t v9 = (void *)v8;
  if (*(unsigned char *)(a1 + 40)) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  v31 = v6;
  if (v10)
  {
    uint64_t v11 = 0;
    BOOL v15 = v8 != 0;
    if (*(unsigned char *)(a1 + 40))
    {
      v12 = 0;
      if (!v8) {
        goto LABEL_34;
      }
      goto LABEL_12;
    }
LABEL_22:
    v12 = 0;
    goto LABEL_34;
  }
  uint64_t v13 = [*(id *)(a1 + 32) objectForKeyedSubscript:v7];
  v14 = (void *)v13;
  BOOL v15 = v9 != 0;
  if (!*(unsigned char *)(a1 + 40) || !v9)
  {
    uint64_t v11 = 0;
    if (v13)
    {
      uint64_t v17 = -1;
      goto LABEL_49;
    }
    goto LABEL_22;
  }
  uint64_t v11 = (void *)v13;
LABEL_12:
  uint64_t v16 = [*(id *)(a1 + 32) objectForKeyedSubscript:v9];
  v12 = (void *)v16;
  if (!v11 || !v16)
  {
    if (v16)
    {
      if (v11) {
        uint64_t v17 = -1;
      }
      else {
        uint64_t v17 = 1;
      }
    }
    else
    {
      if (!v11)
      {
        BOOL v15 = 1;
        uint64_t v11 = 0;
        goto LABEL_34;
      }
      uint64_t v17 = -1;
    }
    v14 = v11;
    uint64_t v11 = (void *)v16;
    goto LABEL_49;
  }
  if (*(unsigned char *)(a1 + 41)) {
    [v11 startDate];
  }
  else {
  v18 = [v11 endDate];
  }
  id v19 = v5;
  if (*(unsigned char *)(a1 + 41)) {
    [v12 startDate];
  }
  else {
  v20 = [v12 endDate];
  }
  uint64_t v17 = [v18 compare:v20];

  if (v17)
  {
    v14 = v11;
    uint64_t v11 = v12;
    id v5 = v19;
    goto LABEL_49;
  }
  BOOL v15 = 1;
  id v5 = v19;
  id v6 = v31;
LABEL_34:
  id v21 = objc_msgSend(v5, "localizedTitle", v5);
  uint64_t v22 = [v6 localizedTitle];
  BOOL v23 = (void *)v22;
  if (v21 && v22)
  {
    uint64_t v24 = [v21 length];
    long long v25 = [MEMORY[0x1E4F1CA20] currentLocale];
    uint64_t v17 = objc_msgSend(v21, "compare:options:range:locale:", v23, 577, 0, v24, v25);
  }
  else if (v21)
  {
    uint64_t v17 = -1;
  }
  else
  {
    uint64_t v17 = v22 != 0;
  }

  if (v17) {
    BOOL v26 = 1;
  }
  else {
    BOOL v26 = v7 == 0;
  }
  if (!v26 && v15) {
    uint64_t v17 = [v7 compare:v9];
  }
  v14 = v11;
  uint64_t v11 = v12;
  id v5 = v30;
LABEL_49:
  if (*(unsigned char *)(a1 + 41)) {
    uint64_t v28 = v17;
  }
  else {
    uint64_t v28 = -v17;
  }

  return v28;
}

+ (id)assetDateIntervalOfCollection:(id)a3
{
  v45[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 photoLibrary];
  id v6 = [a1 makeFetchOptionsWithPhotoLibrary:v5];

  if (![v4 canContainAssets])
  {
    if ([v4 canContainCollections])
    {
      v12 = [MEMORY[0x1E4F38FF8] fetchCollectionsInCollectionList:v4 options:v6];
      long long v40 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v15 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v15)
      {
        uint64_t v16 = v15;
        v38 = v6;
        id v39 = v4;
        v14 = 0;
        uint64_t v11 = 0;
        uint64_t v17 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v41 != v17) {
              objc_enumerationMutation(v12);
            }
            id v19 = objc_msgSend(a1, "assetDateIntervalOfCollection:", *(void *)(*((void *)&v40 + 1) + 8 * i), v38, v39);
            v20 = v19;
            if (v19)
            {
              id v21 = [v19 startDate];
              uint64_t v22 = v21;
              if (!v11 || [v21 compare:v11] == -1)
              {
                id v23 = v22;

                uint64_t v11 = v23;
              }
              uint64_t v24 = [v20 endDate];
              long long v25 = v24;
              if (!v14 || [v24 compare:v14] == 1)
              {
                id v26 = v25;
                long long v27 = v14;
                uint64_t v28 = v16;
                uint64_t v29 = v11;
                uint64_t v30 = v17;
                id v31 = a1;
                v32 = v12;
                id v33 = v26;

                id v34 = v33;
                v12 = v32;
                a1 = v31;
                uint64_t v17 = v30;
                uint64_t v11 = v29;
                uint64_t v16 = v28;
                v14 = v34;
              }
            }
          }
          uint64_t v16 = [v12 countByEnumeratingWithState:&v40 objects:v44 count:16];
        }
        while (v16);
        id v6 = v38;
        id v4 = v39;
        goto LABEL_20;
      }
    }
    uint64_t v11 = 0;
    v14 = 0;
    goto LABEL_30;
  }
  id v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v45[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v45 count:1];
  [v6 setSortDescriptors:v8];

  uint64_t v9 = [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:v4 options:v6];
  BOOL v10 = [v9 firstObject];
  uint64_t v11 = [v10 creationDate];

  v12 = v9;
  uint64_t v13 = [v9 lastObject];
  v14 = [v13 creationDate];

LABEL_20:
  if (v11 && v14)
  {
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 endDate:v14];
LABEL_25:
    v36 = (void *)v35;
    goto LABEL_31;
  }
  if (v11)
  {
    uint64_t v35 = [objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v11 duration:0.0];
    goto LABEL_25;
  }
  if (v14)
  {
    v36 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v14 duration:0.0];
    uint64_t v11 = 0;
    goto LABEL_31;
  }
  uint64_t v11 = 0;
LABEL_30:
  v36 = 0;
LABEL_31:

  return v36;
}

+ (id)makeFetchOptionsWithPhotoLibrary:(id)a3
{
  v3 = [a3 librarySpecificFetchOptions];
  [v3 setIncludeUserSmartAlbums:1];
  [v3 setWantsIncrementalChangeDetails:0];
  return v3;
}

+ (BOOL)canPerformOnCollection:(id)a3
{
  id v3 = a3;
  if (objc_msgSend(v3, "px_isRegularFolder")) {
    char v4 = 1;
  }
  else {
    char v4 = objc_msgSend(v3, "px_isTopLevelFolder");
  }

  return v4;
}

@end