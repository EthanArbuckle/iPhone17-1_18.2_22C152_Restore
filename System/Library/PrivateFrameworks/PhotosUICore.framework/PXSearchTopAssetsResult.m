@interface PXSearchTopAssetsResult
+ (id)_fetchAssetsForAssetUUIDs:(id)a3;
+ (id)_fetchResultForTopAssets:(id)a3;
+ (id)sampledAssetUUIDsFrom:(id)a3 numberOfTopAssets:(int64_t)a4 maxNumberToSample:(int64_t)a5 rangeToSample:(int64_t)a6;
+ (id)sortedPreviewAssetsFrom:(id)a3 priorityAssetUUID:(id)a4 numberOfTopAssets:(int64_t)a5;
- (BOOL)_shouldRecurateForChangeDetails:(id)a3;
- (NSArray)assetUUIDs;
- (NSArray)hiddenObjects;
- (NSArray)removedObjects;
- (NSDictionary)debugDictionary;
- (NSString)debugDescription;
- (NSString)priorityAssetUUID;
- (PHFetchResult)topAssetsFetchResult;
- (PXSearchTopAssetsResult)init;
- (PXSearchTopAssetsResult)initWithAssetUUIDs:(id)a3 priorityAssetUUID:(id)a4;
- (PXSearchTopAssetsResultChangeDelegate)delegate;
- (id)topAssetFilter;
- (unint64_t)itemType;
- (unint64_t)numberOfTopAssets;
- (void)_curateThumbnailAssets;
- (void)_filterTopAssets:(id)a3;
- (void)_notifyDelegateOfAssetChanges:(id)a3 newCuration:(BOOL)a4;
- (void)dealloc;
- (void)photoLibraryDidChange:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTopAssetFilter:(id)a3;
@end

@implementation PXSearchTopAssetsResult

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenObjects, 0);
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_priorityAssetUUID, 0);
  objc_storeStrong(&self->_topAssetFilter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_topAssetsFetchResult, 0);
  objc_storeStrong((id *)&self->_assetUUIDs, 0);
}

- (NSArray)hiddenObjects
{
  return self->_hiddenObjects;
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (NSString)priorityAssetUUID
{
  return self->_priorityAssetUUID;
}

- (id)topAssetFilter
{
  return self->_topAssetFilter;
}

- (void)setDelegate:(id)a3
{
}

- (PXSearchTopAssetsResultChangeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXSearchTopAssetsResultChangeDelegate *)WeakRetained;
}

- (PHFetchResult)topAssetsFetchResult
{
  return self->_topAssetsFetchResult;
}

- (NSArray)assetUUIDs
{
  return self->_assetUUIDs;
}

- (PXSearchTopAssetsResult)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSearchTopAssetsResult.m", 402, @"%s is not available as initializer", "-[PXSearchTopAssetsResult init]");

  abort();
}

- (NSString)debugDescription
{
  v2 = [(PXSearchTopAssetsResult *)self debugDictionary];
  v3 = [v2 description];

  return (NSString *)v3;
}

- (NSDictionary)debugDictionary
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = NSString;
  v5 = (objc_class *)objc_opt_class();
  v6 = NSStringFromClass(v5);
  v7 = [v4 stringWithFormat:@"%@:%p", v6, self];
  [v3 setObject:v7 forKeyedSubscript:@"self"];

  v8 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[PXSearchTopAssetsResult itemType](self, "itemType"));
  [v3 setObject:v8 forKeyedSubscript:@"itemType"];

  [v3 setObject:self->_assetUUIDs forKeyedSubscript:@"assetUUIDs"];
  v9 = NSNumber;
  v10 = [(PXSearchTopAssetsResult *)self assetUUIDs];
  v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
  [v3 setObject:v11 forKeyedSubscript:@"previewAssetsCount"];

  v12 = NSNumber;
  v13 = [(PXSearchTopAssetsResult *)self topAssetsFetchResult];
  v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v13, "count"));
  [v3 setObject:v14 forKeyedSubscript:@"previewAssetsFetchResultCount"];

  return (NSDictionary *)v3;
}

- (unint64_t)numberOfTopAssets
{
  return 8;
}

- (void)_curateThumbnailAssets
{
  v3 = PLPhotosSearchCurationGetLog();
  os_signpost_id_t v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "TotalTimeDuration", "", buf, 2u);
  }

  v7 = [(PXSearchTopAssetsResult *)self priorityAssetUUID];
  if ([v7 length])
  {
    v8 = [(PXSearchTopAssetsResult *)self priorityAssetUUID];
  }
  else
  {
    v8 = 0;
  }

  unint64_t v9 = [(PXSearchTopAssetsResult *)self numberOfTopAssets];
  v10 = [(PXSearchTopAssetsResult *)self assetUUIDs];
  v11 = +[PXSearchTopAssetsResult sampledAssetUUIDsFrom:v10 numberOfTopAssets:v9 maxNumberToSample:160 rangeToSample:20];

  if (v8)
  {
    if (([v11 containsObject:v8] & 1) == 0)
    {
      v12 = [(PXSearchTopAssetsResult *)self assetUUIDs];
      int v13 = [v12 containsObject:v8];

      if (v13)
      {
        uint64_t v14 = [v11 arrayByAddingObject:v8];

        v11 = (void *)v14;
      }
    }
  }
  v15 = +[PXSearchTopAssetsResult _fetchAssetsForAssetUUIDs:v11];
  v16 = PLPhotosSearchCurationGetLog();
  os_signpost_id_t v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "FireAssetFaults", "", v30, 2u);
  }

  v20 = (void *)MEMORY[0x1E4F1C978];
  v21 = [v15 fetchedObjects];
  v22 = [v20 arrayWithArray:v21];

  PLPhotosSearchCurationGetLog();
  v23 = (id)objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_END, v17, "FireAssetFaults", "", v29, 2u);
  }

  v25 = +[PXSearchTopAssetsResult sortedPreviewAssetsFrom:v22 priorityAssetUUID:v8 numberOfTopAssets:v9];
  [(PXSearchTopAssetsResult *)self _filterTopAssets:v25];
  PLPhotosSearchCurationGetLog();
  v26 = (id)objc_claimAutoreleasedReturnValue();
  v27 = v26;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)v28 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v27, OS_SIGNPOST_INTERVAL_END, v4, "TotalTimeDuration", "", v28, 2u);
  }
}

- (unint64_t)itemType
{
  return 2;
}

- (BOOL)_shouldRecurateForChangeDetails:(id)a3
{
  id v4 = a3;
  v5 = [v4 fetchResultBeforeChanges];
  v6 = [v5 fetchedObjects];

  v7 = [v4 fetchResultAfterChanges];
  v8 = [v7 fetchedObjects];

  unint64_t v9 = [(PXSearchTopAssetsResult *)self hiddenObjects];
  if (v9)
  {
    v10 = [(PXSearchTopAssetsResult *)self hiddenObjects];
    id v11 = (id)[v10 mutableCopy];
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }

  if ([v6 count])
  {
    unint64_t v12 = 0;
    char v13 = 0;
    do
    {
      if (v12 >= [v6 count])
      {
        uint64_t v14 = 0;
      }
      else
      {
        uint64_t v14 = [v6 objectAtIndexedSubscript:v12];
      }
      if (v12 >= [v8 count])
      {
        v16 = 0;
      }
      else
      {
        uint64_t v15 = [v8 objectAtIndexedSubscript:v12];
        v16 = (void *)v15;
        if (v14)
        {
          if (v15)
          {
            int v17 = [v14 isHidden];
            if (v17 != [v16 isHidden])
            {
              [v11 addObject:v16];
              char v13 = 1;
            }
          }
        }
      }

      ++v12;
    }
    while (v12 < [v6 count]);
  }
  else
  {
    char v13 = 0;
  }
  v18 = (NSArray *)[v11 copy];
  hiddenObjects = self->_hiddenObjects;
  self->_hiddenObjects = v18;

  return v13 & 1;
}

- (void)_notifyDelegateOfAssetChanges:(id)a3 newCuration:(BOOL)a4
{
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__PXSearchTopAssetsResult__notifyDelegateOfAssetChanges_newCuration___block_invoke;
  block[3] = &unk_1E5DD21E8;
  BOOL v10 = a4;
  block[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __69__PXSearchTopAssetsResult__notifyDelegateOfAssetChanges_newCuration___block_invoke(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 48);
  v3 = [*(id *)(a1 + 32) delegate];
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  if (v2)
  {
    [v3 didChangeThumbnailAssetsForSearchResult:v4];
  }
  else
  {
    v5 = [*(id *)(a1 + 40) changedIndexes];
    [v6 didChangeThumbnailAssetsForSearchResult:v4 atIndexes:v5];
  }
}

- (void)photoLibraryDidChange:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(PXSearchTopAssetsResult *)self topAssetsFetchResult];
  id v6 = [v4 changeDetailsForFetchResult:v5];

  if (v6)
  {
    id v7 = [v6 removedObjects];
    uint64_t v8 = [v7 count];
    if (v8)
    {
      id v9 = [(PXSearchTopAssetsResult *)self removedObjects];
      if (v9)
      {
        BOOL v10 = [(PXSearchTopAssetsResult *)self removedObjects];
        id v11 = (NSArray *)[v10 mutableCopy];
      }
      else
      {
        id v11 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }

      [(NSArray *)v11 addObjectsFromArray:v7];
      removedObjects = self->_removedObjects;
      self->_removedObjects = v11;
    }
    v22 = [v6 changedObjects];
    uint64_t v23 = [v22 count];
    if (v8 || !v23)
    {
      if (!(v8 | v23)) {
        goto LABEL_21;
      }
    }
    else if (![(PXSearchTopAssetsResult *)self _shouldRecurateForChangeDetails:v6])
    {
LABEL_21:
      if ([v22 count])
      {
        v24 = [v6 fetchResultAfterChanges];
        topAssetsFetchResult = self->_topAssetsFetchResult;
        self->_topAssetsFetchResult = v24;
      }
      uint64_t v26 = 0;
      goto LABEL_26;
    }
    [(PXSearchTopAssetsResult *)self _curateThumbnailAssets];
    uint64_t v26 = 1;
LABEL_26:
    if ([v7 count] || objc_msgSend(v22, "count")) {
      [(PXSearchTopAssetsResult *)self _notifyDelegateOfAssetChanges:v6 newCuration:v26];
    }

    goto LABEL_45;
  }
  unint64_t v12 = [(PXSearchTopAssetsResult *)self removedObjects];
  v45 = (void *)[v12 mutableCopy];

  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  v43 = self;
  char v13 = [(PXSearchTopAssetsResult *)self removedObjects];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v51 objects:v56 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    char v46 = 0;
    uint64_t v16 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v52 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v51 + 1) + 8 * i);
        v19 = [v4 changeDetailsForObject:v18];
        v20 = v19;
        if (v19 && ([v19 objectWasDeleted] & 1) == 0)
        {
          [v45 removeObject:v18];
          char v46 = 1;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v51 objects:v56 count:16];
    }
    while (v15);
  }
  else
  {
    char v46 = 0;
  }

  v27 = [(PXSearchTopAssetsResult *)v43 hiddenObjects];
  v44 = (void *)[v27 mutableCopy];

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  v28 = [(PXSearchTopAssetsResult *)v43 hiddenObjects];
  uint64_t v29 = [v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v48;
    do
    {
      for (uint64_t j = 0; j != v30; ++j)
      {
        if (*(void *)v48 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void *)(*((void *)&v47 + 1) + 8 * j);
        v34 = [v4 changeDetailsForObject:v33];
        v35 = v34;
        if (v34)
        {
          v36 = [v34 objectAfterChanges];
          v37 = [v35 objectBeforeChanges];
          int v38 = [v36 isHidden];
          if (v38 != [v37 isHidden])
          {
            [v44 removeObject:v33];
            char v46 = 1;
          }
        }
      }
      uint64_t v30 = [v28 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v30);
  }

  if (v46)
  {
    [(PXSearchTopAssetsResult *)v43 _curateThumbnailAssets];
    [(PXSearchTopAssetsResult *)v43 _notifyDelegateOfAssetChanges:0 newCuration:1];
    uint64_t v39 = [v44 copy];
    hiddenObjects = v43->_hiddenObjects;
    v43->_hiddenObjects = (NSArray *)v39;

    uint64_t v41 = [v45 copy];
    v42 = v43->_removedObjects;
    v43->_removedObjects = (NSArray *)v41;
  }
  id v6 = 0;
LABEL_45:
}

- (void)_filterTopAssets:(id)a3
{
  id v10 = a3;
  id v4 = [(PXSearchTopAssetsResult *)self topAssetFilter];

  if (v4)
  {
    v5 = [(PXSearchTopAssetsResult *)self topAssetFilter];
    uint64_t v6 = ((void (**)(void, id))v5)[2](v5, v10);

    id v7 = (id)v6;
  }
  else
  {
    id v7 = v10;
  }
  id v11 = v7;
  uint64_t v8 = +[PXSearchTopAssetsResult _fetchResultForTopAssets:v7];
  topAssetsFetchResult = self->_topAssetsFetchResult;
  self->_topAssetsFetchResult = v8;
}

- (void)setTopAssetFilter:(id)a3
{
  id v4 = _Block_copy(a3);
  id topAssetFilter = self->_topAssetFilter;
  self->_id topAssetFilter = v4;

  uint64_t v6 = [(PXSearchTopAssetsResult *)self topAssetsFetchResult];

  if (v6)
  {
    id v8 = [(PXSearchTopAssetsResult *)self topAssetsFetchResult];
    id v7 = [v8 fetchedObjects];
    [(PXSearchTopAssetsResult *)self _filterTopAssets:v7];
  }
}

- (void)dealloc
{
  v3 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  [v3 unregisterChangeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PXSearchTopAssetsResult;
  [(PXSearchTopAssetsResult *)&v4 dealloc];
}

- (PXSearchTopAssetsResult)initWithAssetUUIDs:(id)a3 priorityAssetUUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXSearchTopAssetsResult;
  id v8 = [(PXSearchTopAssetsResult *)&v15 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    assetUUIDs = v8->_assetUUIDs;
    v8->_assetUUIDs = (NSArray *)v9;

    uint64_t v11 = [v7 copy];
    priorityAssetUUID = v8->_priorityAssetUUID;
    v8->_priorityAssetUUID = (NSString *)v11;

    [(PXSearchTopAssetsResult *)v8 _curateThumbnailAssets];
    char v13 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    [v13 registerChangeObserver:v8];
  }
  return v8;
}

+ (id)sampledAssetUUIDsFrom:(id)a3 numberOfTopAssets:(int64_t)a4 maxNumberToSample:(int64_t)a5 rangeToSample:(int64_t)a6
{
  id v8 = a3;
  uint64_t v9 = PLPhotosSearchCurationGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  unint64_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "SampleAssets", "", buf, 2u);
  }

  int64_t v13 = [v8 count];
  if (v13 <= a5)
  {
    v25 = (void *)[v8 copy];
  }
  else
  {
    int64_t v14 = v13;
    os_signpost_id_t spid = v10;
    objc_super v15 = objc_opt_new();
    if (v14 >= a4) {
      int64_t v16 = a4;
    }
    else {
      int64_t v16 = v14;
    }
    if (v14 / v16 <= 1) {
      int64_t v17 = 1;
    }
    else {
      int64_t v17 = v14 / v16;
    }
    int64_t v18 = a6;
    if (v17 < a6) {
      int64_t v18 = v17;
    }
    int64_t v28 = v18;
    if (v14 >= 1 && v16 >= 1)
    {
      int64_t v19 = 0;
      for (int64_t i = 0; i < v16; ++i)
      {
        int64_t v21 = v19;
        if (a6 >= 1)
        {
          do
          {
            v22 = objc_msgSend(v8, "objectAtIndexedSubscript:", v21, spid);
            [v15 addObject:v22];

            ++v21;
          }
          while (v21 < v19 + v28);
        }
        v19 += v17;
        if (v19 >= v14) {
          break;
        }
      }
    }
    PLPhotosSearchCurationGetLog();
    uint64_t v23 = (id)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    if (v10 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v23))
    {
      *(_WORD *)uint64_t v30 = 0;
      _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v24, OS_SIGNPOST_INTERVAL_END, spid, "SampleAssets", "", v30, 2u);
    }

    v25 = (void *)[v15 copy];
  }

  return v25;
}

+ (id)sortedPreviewAssetsFrom:(id)a3 priorityAssetUUID:(id)a4 numberOfTopAssets:(int64_t)a5
{
  v69[3] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = PLPhotosSearchCurationGetLog();
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  uint64_t v11 = v9;
  unint64_t v12 = v11;
  unint64_t v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "CurateAssets", "", buf, 2u);
  }

  id v14 = (id)objc_opt_new();
  unint64_t v15 = [v7 count];
  if (v15 <= a5)
  {
    id v39 = v7;
    int v38 = v14;
    id v14 = v39;
  }
  else
  {
    unint64_t v16 = v15;
    unint64_t v47 = v10 - 1;
    os_signpost_id_t v48 = v10;
    uint64_t v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"curationScore" ascending:0];
    uint64_t v18 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"overallAestheticScore" ascending:0];
    uint64_t v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"uuid" ascending:0];
    v45 = (void *)v18;
    char v46 = (void *)v17;
    v69[0] = v17;
    v69[1] = v18;
    v44 = (void *)v19;
    v69[2] = v19;
    long long v51 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:3];
    if (a5)
    {
      uint64_t v20 = 0;
      unint64_t v21 = 0;
      char v55 = 0;
      unint64_t v53 = v16 / a5;
      int64_t v54 = a5;
      unint64_t v52 = v16 % a5;
      long long v49 = v14;
      id v50 = v7;
      do
      {
        if (v21 >= v52) {
          unint64_t v22 = v53;
        }
        else {
          unint64_t v22 = v53 + 1;
        }
        unint64_t v56 = v22;
        uint64_t v23 = [v7 subarrayWithRange:v20];
        uint64_t v57 = v23;
        if (v8 && (v55 & 1) == 0)
        {
          long long v64 = 0u;
          long long v65 = 0u;
          long long v62 = 0u;
          long long v63 = 0u;
          id v24 = v23;
          uint64_t v25 = [v24 countByEnumeratingWithState:&v62 objects:v68 count:16];
          if (v25)
          {
            uint64_t v26 = v25;
            uint64_t v27 = *(void *)v63;
            while (2)
            {
              for (uint64_t i = 0; i != v26; ++i)
              {
                if (*(void *)v63 != v27) {
                  objc_enumerationMutation(v24);
                }
                uint64_t v29 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                uint64_t v30 = [v29 uuid];
                char v31 = [v30 isEqualToString:v8];

                if (v31)
                {
                  id v14 = v49;
                  [v49 addObject:v29];
                  char v55 = 1;
                  id v7 = v50;
                  goto LABEL_34;
                }
              }
              uint64_t v26 = [v24 countByEnumeratingWithState:&v62 objects:v68 count:16];
              if (v26) {
                continue;
              }
              break;
            }
          }

          id v14 = v49;
          id v7 = v50;
          uint64_t v23 = v57;
        }
        v32 = [v23 sortedArrayUsingDescriptors:v51];
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        id v24 = v32;
        uint64_t v33 = [v24 countByEnumeratingWithState:&v58 objects:v67 count:16];
        if (v33)
        {
          uint64_t v34 = v33;
          uint64_t v35 = *(void *)v59;
          while (2)
          {
            for (uint64_t j = 0; j != v34; ++j)
            {
              if (*(void *)v59 != v35) {
                objc_enumerationMutation(v24);
              }
              v37 = *(void **)(*((void *)&v58 + 1) + 8 * j);
              if ([v37 pixelWidth] && objc_msgSend(v37, "pixelHeight"))
              {
                [v14 addObject:v37];
                goto LABEL_32;
              }
            }
            uint64_t v34 = [v24 countByEnumeratingWithState:&v58 objects:v67 count:16];
            if (v34) {
              continue;
            }
            break;
          }
        }
LABEL_32:

LABEL_34:
        v20 += v56;

        ++v21;
      }
      while (v21 != v54);
    }

    unint64_t v13 = v47;
    os_signpost_id_t v10 = v48;
    int v38 = v46;
  }

  PLPhotosSearchCurationGetLog();
  v40 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v41 = v40;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v41, OS_SIGNPOST_INTERVAL_END, v10, "CurateAssets", "", buf, 2u);
  }

  v42 = (void *)[v14 copy];
  return v42;
}

+ (id)_fetchAssetsForAssetUUIDs:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = PLPhotosSearchCurationGetLog();
  os_signpost_id_t v5 = os_signpost_id_generate(v4);
  id v6 = v4;
  id v7 = v6;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v5, "FetchAssets", "", buf, 2u);
  }

  id v8 = objc_msgSend(MEMORY[0x1E4F390A0], "px_searchAssetFetchOptions");
  uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"uuid IN %@", v3];

  [v8 setInternalPredicate:v9];
  os_signpost_id_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"creationDate" ascending:1];
  v17[0] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
  [v8 setSortDescriptors:v11];

  unint64_t v12 = [MEMORY[0x1E4F38EB8] fetchAssetsWithOptions:v8];
  PLPhotosSearchCurationGetLog();
  unint64_t v13 = (id)objc_claimAutoreleasedReturnValue();
  id v14 = v13;
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A9AE7000, v14, OS_SIGNPOST_INTERVAL_END, v5, "FetchAssets", "", buf, 2u);
  }

  return v12;
}

+ (id)_fetchResultForTopAssets:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  PXMap();
}

uint64_t __52__PXSearchTopAssetsResult__fetchResultForTopAssets___block_invoke(uint64_t a1, void *a2)
{
  return [a2 localIdentifier];
}

@end