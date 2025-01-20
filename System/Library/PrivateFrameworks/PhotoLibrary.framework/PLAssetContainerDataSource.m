@interface PLAssetContainerDataSource
- (BOOL)hasAssetAtIndexPath:(id)a3;
- (NSString)description;
- (PHFetchResult)assetCollectionsFetchResult;
- (PLAssetContainerDataSource)initWithAssetCollectionsFetchResult:(id)a3 collectionsAssetsFetchResults:(id)a4;
- (id)assetAtGlobalIndex:(unint64_t)a3;
- (id)assetAtIndexPath:(id)a3;
- (id)assetContainerAtIndex:(unint64_t)a3;
- (id)assetContainerForAsset:(id)a3;
- (id)assetContainerForAssetGlobalIndex:(unint64_t)a3;
- (id)assetInAssetContainer:(id)a3 atIndex:(unint64_t)a4;
- (id)assetWithObjectID:(id)a3;
- (id)assetsInAssetCollection:(id)a3;
- (id)assetsInAssetCollectionAtIndex:(unint64_t)a3;
- (id)decrementAssetIndexPath:(id)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5;
- (id)findNearestIndexPath:(id)a3 preferNext:(BOOL)a4;
- (id)firstAssetIndexPath;
- (id)incrementAssetIndexPath:(id)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5;
- (id)indexPathForGlobalIndex:(unint64_t)a3;
- (id)indexPathOfAsset:(id)a3;
- (id)lastAssetIndexPath;
- (id)newAssetsFetchResults;
- (id)pl_fetchAllAssets;
- (unint64_t)_indexOfNextNonEmptyAssetContainerAfterContainerIndex:(unint64_t)a3 wrap:(BOOL)a4;
- (unint64_t)_indexOfPreviousNonEmptyAssetContainerBeforeContainerIndex:(unint64_t)a3 wrap:(BOOL)a4;
- (unint64_t)allAssetsCount;
- (unint64_t)assetCountForContainer:(id)a3;
- (unint64_t)assetCountForContainerAtIndex:(unint64_t)a3;
- (unint64_t)decrementGlobalIndex:(unint64_t)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5;
- (unint64_t)globalIndexForIndexPath:(id)a3;
- (unint64_t)globalIndexOfAsset:(id)a3;
- (unint64_t)incrementGlobalIndex:(unint64_t)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5;
- (unint64_t)indexOfContainer:(id)a3;
- (unint64_t)indexOffsetForAssetContainerAtAssetIndex:(unint64_t)a3;
- (void)_updateCachedCount:(unint64_t)a3 forContainerAtContainerIndex:(unint64_t)a4;
- (void)_updateCachedValues;
- (void)dealloc;
- (void)viewControllerPhotoLibraryDidChange:(id)a3;
@end

@implementation PLAssetContainerDataSource

- (PHFetchResult)assetCollectionsFetchResult
{
  return self->_assetCollectionsFetchResult;
}

- (NSString)description
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PLAssetContainerDataSource;
  id v3 = (id)[(NSString *)[(PLAssetContainerDataSource *)&v16 description] mutableCopy];
  objc_msgSend(v3, "appendFormat:", @" containing %ld containers with %ld total assets (last container index %ld)", -[PHFetchResult count](self->_assetCollectionsFetchResult, "count"), self->_allAssetsCount, self->_lastAssetCollectionIndex);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  uint64_t v5 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v12 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      uint64_t v10 = v7;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(assetCollectionsFetchResult);
        }
        uint64_t v7 = v10 + 1;
        [v3 appendFormat:@"\n%@: %ld assets [%ld]", *(void *)(*((void *)&v12 + 1) + 8 * v9), objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(void *)(*((void *)&v12 + 1) + 8 * v9)), "count"), self->_containerCounts[v10]];
        ++v9;
        ++v10;
      }
      while (v6 != v9);
      uint64_t v6 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v12 objects:v17 count:16];
    }
    while (v6);
  }
  return (NSString *)(id)[v3 copy];
}

- (void)viewControllerPhotoLibraryDidChange:(id)a3
{
  v4 = self;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(a3, "changeDetailsForFetchResult:", -[PLAssetContainerDataSource assetCollectionsFetchResult](self, "assetCollectionsFetchResult"));
  BOOL v6 = v5 != 0;
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = (void *)[v5 fetchResultAfterChanges];
    uint64_t v9 = (void *)[v7 insertedObjects];
    uint64_t v10 = (void *)[v7 removedObjects];
    v30 = v8;
    if ([v9 count] || objc_msgSend(v10, "count"))
    {
      v11 = (NSMutableDictionary *)[(NSMutableDictionary *)v4->_assetsFetchResultByAssetCollection mutableCopy];
      [(NSMutableDictionary *)v11 removeObjectsForKeys:v10];
      long long v12 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v9, "firstObject"), "photoLibrary"), "librarySpecificFetchOptions");
      [v12 setIncludeHiddenAssets:1];
      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      uint64_t v13 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v40;
        do
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v40 != v15) {
              objc_enumerationMutation(v9);
            }
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v39 + 1) + 8 * i) options:v12], *(void *)(*((void *)&v39 + 1) + 8 * i));
          }
          uint64_t v14 = [v9 countByEnumeratingWithState:&v39 objects:v45 count:16];
        }
        while (v14);
      }
      v4 = v29;
      if (v11) {
        goto LABEL_15;
      }
    }
    else if (([v7 hasIncrementalChanges] & 1) == 0)
    {
      v11 = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v8, "count"));
      v24 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(v8, "firstObject"), "photoLibrary"), "librarySpecificFetchOptions");
      [v24 setIncludeHiddenAssets:1];
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v25 = [v8 countByEnumeratingWithState:&v35 objects:v44 count:16];
      if (v25)
      {
        uint64_t v26 = v25;
        uint64_t v27 = *(void *)v36;
        do
        {
          for (uint64_t j = 0; j != v26; ++j)
          {
            if (*(void *)v36 != v27) {
              objc_enumerationMutation(v8);
            }
            -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", [MEMORY[0x1E4F38EB8] fetchAssetsInAssetCollection:*(void *)(*((void *)&v35 + 1) + 8 * j) options:v24], *(void *)(*((void *)&v35 + 1) + 8 * j));
          }
          uint64_t v26 = [v8 countByEnumeratingWithState:&v35 objects:v44 count:16];
        }
        while (v26);
      }
      goto LABEL_26;
    }
  }
  else
  {
    v30 = 0;
  }
  v11 = (NSMutableDictionary *)[(NSMutableDictionary *)v4->_assetsFetchResultByAssetCollection mutableCopy];
LABEL_15:
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  v17 = (void *)[(NSMutableDictionary *)v11 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v32 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v31 + 1) + 8 * k);
        v23 = objc_msgSend(a3, "changeDetailsForFetchResult:", -[NSMutableDictionary objectForKey:](v11, "objectForKey:", v22));
        if (v23)
        {
          -[NSMutableDictionary setObject:forKey:](v11, "setObject:forKey:", [v23 fetchResultAfterChanges], v22);
          BOOL v6 = 1;
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v31 objects:v43 count:16];
    }
    while (v19);
  }
  if (!v6)
  {

    return;
  }
  uint64_t v8 = v30;
LABEL_26:
  if (v11)
  {

    v4->_assetsFetchResultByAssetCollection = v11;
  }
  if (v8)
  {

    v4->_assetCollectionsFetchResult = (PHFetchResult *)v8;
  }
  [(PLAssetContainerDataSource *)v4 _updateCachedValues];
}

- (id)pl_fetchAllAssets
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  id v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  uint64_t v5 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(assetCollectionsFetchResult);
        }
        uint64_t v9 = [(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection objectForKey:*(void *)(*((void *)&v11 + 1) + 8 * i)];
        objc_msgSend(v3, "addObjectsFromArray:", objc_msgSend(MEMORY[0x1E4F38EB8], "pl_managedAssetsForAssets:", v9));
      }
      uint64_t v6 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  return v3;
}

- (id)assetInAssetContainer:(id)a3 atIndex:(unint64_t)a4
{
  uint64_t v5 = (void *)[(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection objectForKey:a3];
  if ([v5 count] <= a4) {
    return 0;
  }
  return (id)[v5 objectAtIndexedSubscript:a4];
}

- (unint64_t)assetCountForContainerAtIndex:(unint64_t)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  return self->_containerCounts[a3];
}

- (unint64_t)assetCountForContainer:(id)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  unint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
  {
    NSUInteger v6 = [(PHFetchResult *)self->_assetCollectionsFetchResult indexOfObject:a3];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL) {
      return self->_containerCounts[v6];
    }
  }
  return v5;
}

- (id)decrementAssetIndexPath:(id)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  uint64_t v9 = [a3 section];
  if ([a3 item]) {
    uint64_t v10 = [a3 item] - 1;
  }
  else {
    uint64_t v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v11 = [(PLAssetContainerDataSource *)self assetCountForContainerAtIndex:v9];
  if (!v6)
  {
    if ([(PLAssetContainerDataSource *)self allAssetsCount])
    {
      if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_17;
      }
      unint64_t v12 = [(PLAssetContainerDataSource *)self _indexOfPreviousNonEmptyAssetContainerBeforeContainerIndex:v9 wrap:v5];
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v9 = v12;
        unint64_t v11 = [(PLAssetContainerDataSource *)self assetCountForContainerAtIndex:v12];
        goto LABEL_15;
      }
    }
    return 0;
  }
  if (!v11) {
    return 0;
  }
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_17;
  }
  if (!v5) {
    return 0;
  }
LABEL_15:
  uint64_t v10 = v11 - 1;
  if (v11 == 0x8000000000000000) {
    return 0;
  }
LABEL_17:
  long long v14 = (void *)MEMORY[0x1E4F28D58];
  return (id)[v14 indexPathForItem:v10 inSection:v9];
}

- (id)incrementAssetIndexPath:(id)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  uint64_t v9 = [a3 section];
  unint64_t v10 = [a3 item] + 1;
  unint64_t v11 = [(PLAssetContainerDataSource *)self assetCountForContainerAtIndex:v9];
  unint64_t v12 = v11;
  if (v6)
  {
    if (!v11) {
      return 0;
    }
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (v5) {
      uint64_t v13 = 0;
    }
    if (v10 >= v11) {
      unint64_t v10 = v13;
    }
LABEL_12:
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_17;
    }
    return 0;
  }
  if (![(PLAssetContainerDataSource *)self allAssetsCount]) {
    return 0;
  }
  if (v10 < v12) {
    goto LABEL_12;
  }
  unint64_t v14 = [(PLAssetContainerDataSource *)self _indexOfNextNonEmptyAssetContainerAfterContainerIndex:v9 wrap:v5];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v9 = v14;
  unint64_t v10 = 0;
LABEL_17:
  uint64_t v16 = (void *)MEMORY[0x1E4F28D58];
  return (id)[v16 indexPathForItem:v10 inSection:v9];
}

- (unint64_t)_indexOfPreviousNonEmptyAssetContainerBeforeContainerIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v7 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (v7 >= 2)
  {
    NSUInteger v8 = v7;
    unint64_t v9 = a3 - 1;
    for (unint64_t i = 1; v8 != i; ++i)
    {
      NSUInteger v11 = i >= a3 ? v8 : 0;
      if (v11 + v9 > a3 && !v4) {
        break;
      }
      if (-[PLAssetContainerDataSource assetCountForContainerAtIndex:](self, "assetCountForContainerAtIndex:")) {
        return v11 + v9;
      }
      --v9;
    }
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)_indexOfNextNonEmptyAssetContainerAfterContainerIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  BOOL v4 = a4;
  NSUInteger v7 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (v7 >= 2)
  {
    NSUInteger v8 = v7;
    unint64_t v9 = a3 + 1;
    NSUInteger v10 = v7 - 1;
    do
    {
      unint64_t v11 = v9 % v8;
      if (v9 % v8 < a3 && !v4) {
        break;
      }
      if ([(PLAssetContainerDataSource *)self assetCountForContainerAtIndex:v9 % v8]) {
        return v11;
      }
      ++v9;
      --v10;
    }
    while (v10);
  }
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)findNearestIndexPath:(id)a3 preferNext:(BOOL)a4
{
  BOOL v4 = a4;
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  id result = 0;
  if (!a3 || !self->_allAssetsCount) {
    return result;
  }
  unint64_t v8 = [a3 section];
  if (v8 >= [(PHFetchResult *)self->_assetCollectionsFetchResult count])
  {
    id result = [(PLAssetContainerDataSource *)self lastAssetIndexPath];
    if (result) {
      return result;
    }
    goto LABEL_14;
  }
  if ([a3 row] < self->_containerCounts[v8]) {
    return a3;
  }
  if (!v4
    || (id result = [(PLAssetContainerDataSource *)self incrementAssetIndexPath:a3 insideCurrentAssetContainer:0 andWrap:0]) == 0)
  {
    id result = [(PLAssetContainerDataSource *)self decrementAssetIndexPath:a3 insideCurrentAssetContainer:0 andWrap:0];
    if (!result)
    {
LABEL_14:
      return [(PLAssetContainerDataSource *)self firstAssetIndexPath];
    }
  }
  return result;
}

- (BOOL)hasAssetAtIndexPath:(id)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  BOOL result = 0;
  if (a3 && self->_allAssetsCount)
  {
    unint64_t v6 = [a3 section];
    return v6 < [(PHFetchResult *)self->_assetCollectionsFetchResult count]
        && [a3 row] < self->_containerCounts[v6];
  }
  return result;
}

- (id)lastAssetIndexPath
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  if (!self->_allAssetsCount) {
    return 0;
  }
  NSUInteger v3 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (!v3) {
    return 0;
  }
  NSUInteger v4 = v3 - 1;
  while (1)
  {
    unint64_t v5 = self->_containerCounts[v4];
    if (v5) {
      break;
    }
    if (--v4 == -1) {
      return 0;
    }
  }
  NSUInteger v7 = (void *)MEMORY[0x1E4F28D58];
  return (id)objc_msgSend(v7, "indexPathForItem:inSection:", v5 - 1);
}

- (id)firstAssetIndexPath
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  if (!self->_allAssetsCount) {
    return 0;
  }
  NSUInteger v3 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (!v3) {
    return 0;
  }
  uint64_t v4 = 0;
  while (!self->_containerCounts[v4])
  {
    if (v3 == ++v4) {
      return 0;
    }
  }
  unint64_t v6 = (void *)MEMORY[0x1E4F28D58];
  return (id)objc_msgSend(v6, "indexPathForItem:inSection:", 0);
}

- (unint64_t)indexOfContainer:(id)a3
{
  return [(PHFetchResult *)self->_assetCollectionsFetchResult indexOfObject:a3];
}

- (id)assetContainerAtIndex:(unint64_t)a3
{
  return [(PHFetchResult *)self->_assetCollectionsFetchResult objectAtIndex:a3];
}

- (id)indexPathOfAsset:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  id result = [(PLAssetContainerDataSource *)self allAssetsCount];
  if (result)
  {
    if (self->_lastAssetCollectionIndex == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_15;
    }
    uint64_t v6 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:")), "indexOfObject:", a3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL
      || (id result = (id)[MEMORY[0x1E4F28D58] indexPathForItem:v6 inSection:self->_lastAssetCollectionIndex]) == 0)
    {
      unint64_t lastAssetCollectionIndex = self->_lastAssetCollectionIndex;
      if (lastAssetCollectionIndex)
      {
        unint64_t v8 = lastAssetCollectionIndex - 1;
        uint64_t v9 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", lastAssetCollectionIndex - 1)), "indexOfObject:", a3);
        if (v9 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v8 = self->_lastAssetCollectionIndex;
        }
        else
        {
          id result = (id)[MEMORY[0x1E4F28D58] indexPathForItem:v9 inSection:v8];
          self->_unint64_t lastAssetCollectionIndex = v8;
          if (result) {
            return result;
          }
        }
      }
      else
      {
        unint64_t v8 = 0;
      }
      if (v8 >= [(PHFetchResult *)self->_assetCollectionsFetchResult count] - 1
        || (unint64_t v10 = self->_lastAssetCollectionIndex + 1,
            uint64_t v11 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", v10)), "indexOfObject:", a3), v11 == 0x7FFFFFFFFFFFFFFFLL)|| (result = (id)objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v11, v10), self->_lastAssetCollectionIndex = v10, !result))
      {
LABEL_15:
        long long v21 = 0u;
        long long v22 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
        id result = (id)[(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (result)
        {
          uint64_t v13 = (char *)result;
          unint64_t v14 = 0;
          uint64_t v15 = *(void *)v20;
          while (2)
          {
            uint64_t v16 = 0;
            v17 = &v13[(void)v14];
            do
            {
              if (*(void *)v20 != v15) {
                objc_enumerationMutation(assetCollectionsFetchResult);
              }
              uint64_t v18 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(void *)(*((void *)&v19 + 1) + 8 * (void)v16)), "indexOfObject:", a3);
              if (v18 != 0x7FFFFFFFFFFFFFFFLL)
              {
                id result = (id)[MEMORY[0x1E4F28D58] indexPathForItem:v18 inSection:&v16[(void)v14]];
                self->_unint64_t lastAssetCollectionIndex = (unint64_t)&v16[(void)v14];
                return result;
              }
              ++v16;
            }
            while (v13 != v16);
            uint64_t v13 = (char *)[(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v19 objects:v23 count:16];
            id result = 0;
            unint64_t v14 = v17;
            if (v13) {
              continue;
            }
            break;
          }
        }
      }
    }
  }
  return result;
}

- (id)assetAtIndexPath:(id)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  id v5 = -[PHFetchResult objectAtIndex:](self->_assetCollectionsFetchResult, "objectAtIndex:", [a3 section]);
  uint64_t v6 = [a3 item];
  return [(PLAssetContainerDataSource *)self assetInAssetContainer:v5 atIndex:v6];
}

- (id)assetsInAssetCollection:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection objectForKey:a3];
}

- (id)newAssetsFetchResults
{
  return (id)[(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection copy];
}

- (id)assetsInAssetCollectionAtIndex:(unint64_t)a3
{
  id v4 = [(PHFetchResult *)self->_assetCollectionsFetchResult objectAtIndex:a3];
  assetsFetchResultByAssetCollection = self->_assetsFetchResultByAssetCollection;
  return (id)[(NSMutableDictionary *)assetsFetchResultByAssetCollection objectForKey:v4];
}

- (id)assetWithObjectID:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  v7[0] = a3;
  id result = (id)objc_msgSend((id)objc_msgSend((id)pl_appPhotoLibrary(), "fetchPHObjectsForOIDs:", objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v7, 1)), "lastObject");
  if (result)
  {
    id v6 = result;
    if ([(PLAssetContainerDataSource *)self assetContainerForAsset:result]) {
      return v6;
    }
    else {
      return 0;
    }
  }
  return result;
}

- (unint64_t)indexOffsetForAssetContainerAtAssetIndex:(unint64_t)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  NSUInteger v5 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (!v5) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v6 = v5;
  unint64_t result = 0;
  containerCounts = self->_containerCounts;
  while (1)
  {
    uint64_t v9 = *containerCounts++;
    unint64_t v10 = v9 + result;
    if (v9 + result > a3) {
      break;
    }
    unint64_t result = v10;
    if (!--v6) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return result;
}

- (unint64_t)globalIndexOfAsset:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  unint64_t v5 = [(PLAssetContainerDataSource *)self allAssetsCount];
  unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
  if (v5)
  {
    if (self->_lastAssetCollectionIndex == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_15;
    }
    uint64_t v7 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:")), "indexOfObject:", a3);
    if (v7 == 0x7FFFFFFFFFFFFFFFLL
      || (unint64_t result = -[PLAssetContainerDataSource globalIndexForIndexPath:](self, "globalIndexForIndexPath:", [MEMORY[0x1E4F28D58] indexPathForItem:v7 inSection:self->_lastAssetCollectionIndex]), result == 0x7FFFFFFFFFFFFFFFLL))
    {
      unint64_t lastAssetCollectionIndex = self->_lastAssetCollectionIndex;
      if (lastAssetCollectionIndex)
      {
        unint64_t v9 = lastAssetCollectionIndex - 1;
        uint64_t v10 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", lastAssetCollectionIndex - 1)), "indexOfObject:", a3);
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          unint64_t v9 = self->_lastAssetCollectionIndex;
        }
        else
        {
          unint64_t result = -[PLAssetContainerDataSource globalIndexForIndexPath:](self, "globalIndexForIndexPath:", [MEMORY[0x1E4F28D58] indexPathForItem:v10 inSection:v9]);
          self->_unint64_t lastAssetCollectionIndex = v9;
          if (result != 0x7FFFFFFFFFFFFFFFLL) {
            return result;
          }
        }
      }
      else
      {
        unint64_t v9 = 0;
      }
      if (v9 >= [(PHFetchResult *)self->_assetCollectionsFetchResult count] - 1
        || (unint64_t v11 = self->_lastAssetCollectionIndex + 1,
            uint64_t v12 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", -[PHFetchResult objectAtIndexedSubscript:](self->_assetCollectionsFetchResult, "objectAtIndexedSubscript:", v11)), "indexOfObject:", a3), v12 == 0x7FFFFFFFFFFFFFFFLL)|| (result = -[PLAssetContainerDataSource globalIndexForIndexPath:](self, "globalIndexForIndexPath:", objc_msgSend(MEMORY[0x1E4F28D58], "indexPathForItem:inSection:", v12, v11)), self->_lastAssetCollectionIndex = v11, result == 0x7FFFFFFFFFFFFFFFLL))
      {
LABEL_15:
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
        uint64_t v14 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          unint64_t v16 = 0;
          uint64_t v17 = 0;
          uint64_t v18 = *(void *)v24;
          while (2)
          {
            uint64_t v19 = 0;
            unint64_t v20 = v16;
            v16 += v15;
            do
            {
              if (*(void *)v24 != v18) {
                objc_enumerationMutation(assetCollectionsFetchResult);
              }
              uint64_t v21 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(void *)(*((void *)&v23 + 1) + 8 * v19)), "indexOfObject:", a3);
              if (v21 != 0x7FFFFFFFFFFFFFFFLL)
              {
                unint64_t result = v21 + v17;
                self->_unint64_t lastAssetCollectionIndex = v20;
                return result;
              }
              unint64_t v22 = self->_containerCounts[v20++];
              v17 += v22;
              ++v19;
            }
            while (v15 != v19);
            uint64_t v15 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v23 objects:v27 count:16];
            unint64_t result = 0x7FFFFFFFFFFFFFFFLL;
            if (v15) {
              continue;
            }
            break;
          }
        }
        else
        {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
    }
  }
  return result;
}

- (id)assetAtGlobalIndex:(unint64_t)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  unint64_t v5 = [(PLAssetContainerDataSource *)self allAssetsCount];
  if (!v5) {
    return 0;
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (v5 <= a3) {
    return 0;
  }
  id v6 = [(PLAssetContainerDataSource *)self assetContainerForAssetGlobalIndex:a3];
  unint64_t v7 = [(PLAssetContainerDataSource *)self indexOffsetForAssetContainerAtAssetIndex:a3];
  if (!v6) {
    return 0;
  }
  return [(PLAssetContainerDataSource *)self assetInAssetContainer:v6 atIndex:a3 - v7];
}

- (unint64_t)decrementGlobalIndex:(unint64_t)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  unint64_t v9 = (void *)[(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection objectForKey:[(PLAssetContainerDataSource *)self assetContainerForAssetGlobalIndex:a3]];
  if (v6)
  {
    uint64_t v10 = [v9 count];
    if (v10)
    {
      uint64_t v11 = v10;
      unint64_t v12 = [(PLAssetContainerDataSource *)self indexOffsetForAssetContainerAtAssetIndex:a3];
      unint64_t v13 = v12 + v11;
      if (v12 == a3)
      {
        unint64_t v14 = v13 - 1;
        if (v5) {
          return v14;
        }
        else {
          return 0x7FFFFFFFFFFFFFFFLL;
        }
      }
      else if (v13 <= a3)
      {
        return v13 - 1;
      }
      else
      {
        return a3 - 1;
      }
    }
    else
    {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    unint64_t v16 = [(PLAssetContainerDataSource *)self allAssetsCount];
    unint64_t v17 = a3 - 1;
    uint64_t v18 = v16 - 1;
    if (v16 <= a3) {
      unint64_t v17 = v16 - 1;
    }
    if (!v5) {
      uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (!a3) {
      unint64_t v17 = v18;
    }
    if (v16) {
      return v17;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
}

- (unint64_t)incrementGlobalIndex:(unint64_t)a3 insideCurrentAssetContainer:(BOOL)a4 andWrap:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  unint64_t v9 = a3 + 1;
  uint64_t v10 = (void *)[(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection objectForKey:[(PLAssetContainerDataSource *)self assetContainerForAssetGlobalIndex:a3]];
  if (v6)
  {
    uint64_t v11 = [v10 count];
    unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
    if (v11)
    {
      uint64_t v13 = v11;
      unint64_t v14 = [(PLAssetContainerDataSource *)self indexOffsetForAssetContainerAtAssetIndex:a3];
      if (v5) {
        unint64_t v15 = v14;
      }
      else {
        unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      if (v9 >= v14 + v13) {
        return v15;
      }
      else {
        return a3 + 1;
      }
    }
  }
  else
  {
    unint64_t v16 = [(PLAssetContainerDataSource *)self allAssetsCount];
    if (v5) {
      unint64_t v17 = 0;
    }
    else {
      unint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v9 < v16) {
      unint64_t v17 = a3 + 1;
    }
    if (v16) {
      return v17;
    }
    else {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v12;
}

- (id)indexPathForGlobalIndex:(unint64_t)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  if (self->_allAssetsCount <= a3) {
    return 0;
  }
  NSUInteger v5 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (!v5) {
    return 0;
  }
  uint64_t v6 = 0;
  unint64_t v7 = 0;
  while (1)
  {
    unint64_t v8 = self->_containerCounts[v6] + v7;
    if (v8 > a3) {
      break;
    }
    ++v6;
    unint64_t v7 = v8;
    if (v5 == v6) {
      return 0;
    }
  }
  uint64_t v10 = (void *)MEMORY[0x1E4F28D58];
  return (id)objc_msgSend(v10, "indexPathForItem:inSection:", a3 - v7);
}

- (unint64_t)globalIndexForIndexPath:(id)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  if (!a3) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  unint64_t v5 = [a3 section];
  unint64_t v6 = [a3 item];
  if (v5 >= [(PHFetchResult *)self->_assetCollectionsFetchResult count]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  containerCounts = self->_containerCounts;
  if (v6 >= containerCounts[v5]) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  for (; v5; --v5)
  {
    uint64_t v8 = *containerCounts++;
    v6 += v8;
  }
  return v6;
}

- (id)assetContainerForAssetGlobalIndex:(unint64_t)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection count];
  if (a3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }
  uint64_t v6 = v5;
  if (!v5 || [(PLAssetContainerDataSource *)self allAssetsCount] <= a3) {
    return 0;
  }
  uint64_t v7 = 0;
  unint64_t v8 = 0;
  while (1)
  {
    v8 += self->_containerCounts[v7];
    if (v8 > a3) {
      break;
    }
    if (v6 == ++v7) {
      return 0;
    }
  }
  assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
  return -[PHFetchResult objectAtIndex:](assetCollectionsFetchResult, "objectAtIndex:");
}

- (id)assetContainerForAsset:(id)a3
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  uint64_t v5 = [(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection count];
  id result = 0;
  if (a3 && v5)
  {
    if (v5 == 1)
    {
      id v7 = [(PHFetchResult *)self->_assetCollectionsFetchResult objectAtIndex:0];
      if (objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", v7), "indexOfObject:", a3) == 0x7FFFFFFFFFFFFFFFLL)return 0; {
      else
      }
        return v7;
    }
    else
    {
      unint64_t v8 = [(PLAssetContainerDataSource *)self globalIndexOfAsset:a3];
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
        return 0;
      }
      else
      {
        return [(PLAssetContainerDataSource *)self assetContainerForAssetGlobalIndex:v8];
      }
    }
  }
  return result;
}

- (unint64_t)allAssetsCount
{
  if (self->_cachedValuesNeedUpdate) {
    [(PLAssetContainerDataSource *)self _updateCachedValues];
  }
  return self->_allAssetsCount;
}

- (void)_updateCachedCount:(unint64_t)a3 forContainerAtContainerIndex:(unint64_t)a4
{
  containerCounts = self->_containerCounts;
  unint64_t v5 = a3 - containerCounts[a4];
  containerCounts[a4] = a3;
  self->_allAssetsCount += v5;
}

- (void)_updateCachedValues
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  self->_allAssetsCount = 0;
  unint64_t v4 = [(PHFetchResult *)self->_assetCollectionsFetchResult count];
  if (v4 != [(NSMutableDictionary *)self->_assetsFetchResultByAssetCollection count]) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLAssetContainerDataSource.m", 102, @"Mismatched asset collections and asset fetch results");
  }
  containerCounts = self->_containerCounts;
  if (!containerCounts)
  {
    if (v4)
    {
      uint64_t v6 = (unint64_t *)malloc_type_malloc(8 * v4, 0x100004000313F17uLL);
      goto LABEL_8;
    }
LABEL_19:
    unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_20;
  }
  if (!v4)
  {
    free(containerCounts);
    self->_containerCounts = 0;
    goto LABEL_19;
  }
  uint64_t v6 = (unint64_t *)malloc_type_realloc(containerCounts, 8 * v4, 0x100004000313F17uLL);
LABEL_8:
  self->_containerCounts = v6;
  if (v6)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    assetCollectionsFetchResult = self->_assetCollectionsFetchResult;
    uint64_t v8 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        uint64_t v13 = v10;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(assetCollectionsFetchResult);
          }
          uint64_t v14 = objc_msgSend((id)-[NSMutableDictionary objectForKey:](self->_assetsFetchResultByAssetCollection, "objectForKey:", *(void *)(*((void *)&v16 + 1) + 8 * v12)), "count");
          uint64_t v10 = v13 + 1;
          self->_containerCounts[v13] = v14;
          self->_allAssetsCount += v14;
          ++v12;
          ++v13;
        }
        while (v9 != v12);
        uint64_t v9 = [(PHFetchResult *)assetCollectionsFetchResult countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v9);
    }
  }
  if (self->_lastAssetCollectionIndex >= v4)
  {
    unint64_t v15 = v4 - 1;
LABEL_20:
    self->_unint64_t lastAssetCollectionIndex = v15;
  }
  self->_cachedValuesNeedUpdate = 0;
}

- (void)dealloc
{
  containerCounts = self->_containerCounts;
  if (containerCounts) {
    free(containerCounts);
  }
  v4.receiver = self;
  v4.super_class = (Class)PLAssetContainerDataSource;
  [(PLAssetContainerDataSource *)&v4 dealloc];
}

- (PLAssetContainerDataSource)initWithAssetCollectionsFetchResult:(id)a3 collectionsAssetsFetchResults:(id)a4
{
  v14.receiver = self;
  v14.super_class = (Class)PLAssetContainerDataSource;
  id v7 = [(PLAssetContainerDataSource *)&v14 init];
  if (v7)
  {
    uint64_t v8 = [a3 count];
    if (v8 != [a4 count]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"PLAssetContainerDataSource.m", 68, @"Mismatched asset collections and asset fetch results");
    }
    v7->_assetCollectionsFetchResult = (PHFetchResult *)a3;
    v7->_assetsFetchResultByAssetCollection = (NSMutableDictionary *)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(a4, "count"));
    uint64_t v9 = [(PHFetchResult *)v7->_assetCollectionsFetchResult count];
    if (v9)
    {
      uint64_t v10 = v9;
      for (uint64_t i = 0; i != v10; ++i)
        -[NSMutableDictionary setObject:forKey:](v7->_assetsFetchResultByAssetCollection, "setObject:forKey:", [a4 objectAtIndex:i], -[PHFetchResult objectAtIndex:](v7->_assetCollectionsFetchResult, "objectAtIndex:", i));
    }
    uint64_t v12 = [(NSMutableDictionary *)v7->_assetsFetchResultByAssetCollection count];
    if (v12 != [(PHFetchResult *)v7->_assetCollectionsFetchResult count]) {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, @"PLAssetContainerDataSource.m", 79, @"Mismatched asset collections and asset fetch results");
    }
    v7->_allAssetsCount = 0x7FFFFFFFFFFFFFFFLL;
    v7->_cachedValuesNeedUpdate = 1;
  }
  return v7;
}

@end