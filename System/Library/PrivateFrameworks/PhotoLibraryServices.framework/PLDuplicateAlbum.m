@interface PLDuplicateAlbum
+ (id)albumSupportsAssetOrderKeysPredicate;
+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3;
+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3 predicate:(id)a4;
+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3 type:(signed __int16)a4;
+ (id)entityName;
+ (id)insertIntoPhotoLibrary:(id)a3;
- (BOOL)hasDuplicateAssetVisibilityStateVisibleAssets:(id)a3;
- (BOOL)supportsAssetOrderKeys;
- (id)albumAssetsFetchRequestForDuplicateSort;
- (id)duplicateAssetsFromCollection;
- (id)mutableMetadataMatchingAssets;
- (id)mutablePerceptualMatchingAssets;
- (void)awakeFromInsert;
- (void)cleanupAlbumForDeletedDuplicateAsset;
- (void)removeAssetsAtIndexes:(id)a3;
- (void)removeInternalAssets:(id)a3;
- (void)sortAssets;
- (void)updateAlbumType;
- (void)updateDuplicateAssetVisibilityStatePropertyForAsset:(id)a3 duplicateAssetVisibilityState:(signed __int16)a4;
- (void)updateDuplicateAssetVisibilityStateWithDuplicateAssets:(id)a3;
@end

@implementation PLDuplicateAlbum

- (void)cleanupAlbumForDeletedDuplicateAsset
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (([(PLDuplicateAlbum *)self isDeleted] & 1) == 0
    && [(PLGenericAlbum *)self isDuplicateAlbum]
    && [(PLManagedAlbum *)self assetsCount] <= 1)
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    v3 = [(PLDuplicateAlbum *)self assets];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
          if (([v8 isDeleted] & 1) == 0) {
            [v8 setDuplicateAssetVisibilityState:0];
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }

    [(PLGenericAlbum *)self delete];
  }
}

- (void)removeAssetsAtIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLDuplicateAlbum *)self assets];
  uint64_t v6 = [v5 objectsAtIndexes:v4];

  v7.receiver = self;
  v7.super_class = (Class)PLDuplicateAlbum;
  [(PLManagedAlbum *)&v7 removeAssetsAtIndexes:v4];

  [(PLDuplicateAlbum *)self cleanupAlbumForDeletedDuplicateAsset];
  if (([(PLDuplicateAlbum *)self isDeleted] & 1) == 0) {
    [(PLDuplicateAlbum *)self removeInternalAssets:v6];
  }
}

- (id)albumAssetsFetchRequestForDuplicateSort
{
  v3 = (void *)MEMORY[0x1E4F1C0D0];
  id v4 = +[PLManagedAsset entityName];
  uint64_t v5 = [v3 fetchRequestWithEntityName:v4];

  uint64_t v6 = (void *)MEMORY[0x1E4F28F60];
  objc_super v7 = [(PLDuplicateAlbum *)self objectIDsForRelationshipNamed:@"assets"];
  v8 = [v6 predicateWithFormat:@"self IN %@", v7];
  [v5 setPredicate:v8];

  long long v9 = +[PLDuplicateAsset relationshipKeyPathsForPrefetching];
  [v5 setRelationshipKeyPathsForPrefetching:v9];

  return v5;
}

- (void)updateDuplicateAssetVisibilityStateWithDuplicateAssets:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    BOOL v20 = [(PLDuplicateAlbum *)self hasDuplicateAssetVisibilityStateVisibleAssets:v4];
    uint64_t v5 = [(PLDuplicateAlbum *)self assets];
    uint64_t v6 = [v5 firstObject];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v4;
    id obj = v4;
    uint64_t v7 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v22 != v9) {
            objc_enumerationMutation(obj);
          }
          long long v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
          long long v12 = [v11 asset];
          int v13 = [v11 duplicateAssetVisibilityState];
          uint64_t v14 = [v12 objectID];
          v15 = [v6 objectID];
          int v16 = [v14 isEqual:v15];

          if (v16)
          {
            if (v20)
            {
              if (v13 == 100) {
                __int16 v17 = 100;
              }
              else {
                __int16 v17 = 2;
              }
            }
            else
            {
              __int16 v17 = 2;
            }
          }
          else if (v20)
          {
            __int16 v17 = v13;
          }
          else
          {
            __int16 v17 = 1;
          }
          [(PLDuplicateAlbum *)self updateDuplicateAssetVisibilityStatePropertyForAsset:v12 duplicateAssetVisibilityState:v17];
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v8);
    }

    id v4 = v18;
  }
}

- (void)updateDuplicateAssetVisibilityStatePropertyForAsset:(id)a3 duplicateAssetVisibilityState:(signed __int16)a4
{
  uint64_t v4 = a4;
  id v7 = a3;
  if ([v7 duplicateAssetVisibilityState] != v4)
  {
    uint64_t v5 = v7;
    if (v4 != 100 && v4 != 1) {
      goto LABEL_11;
    }
    uint64_t v6 = [v7 libraryScopeShareState];
    if (v6 > 65537)
    {
      uint64_t v5 = v7;
      if (v6 != 65552 && v6 != 65538) {
        goto LABEL_11;
      }
    }
    else
    {
      uint64_t v5 = v7;
      if (v6 != 2 && v6 != 16) {
        goto LABEL_11;
      }
    }
    PLLibraryScopeAssetRemoveSuggestedByClientType(v5);
    uint64_t v5 = v7;
LABEL_11:
    [v5 setDuplicateAssetVisibilityState:v4];
  }
}

- (BOOL)hasDuplicateAssetVisibilityStateVisibleAssets:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![v5 count])
  {
    long long v11 = [MEMORY[0x1E4F28B00] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"PLDuplicateAlbum.m", 210, @"Invalid parameter not satisfying: %@", @"duplicateAssets.count > 0" object file lineNumber description];
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v12 + 1) + 8 * i) duplicateAssetVisibilityState] == 1)
        {
          LOBYTE(v7) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v7;
}

- (void)sortAssets
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = [(PLDuplicateAlbum *)self assets];
  unint64_t v4 = [v3 count];

  if (v4 >= 2)
  {
    id v5 = [(PLDuplicateAlbum *)self duplicateAssetsFromCollection];
    if ((unint64_t)[v5 count] < 2)
    {
      long long v12 = PLBackendGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        int v13 = 134217984;
        uint64_t v14 = [v5 count];
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Duplicate asset count unexpected. Asset count: %td", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      id v6 = [v5 sortedArrayUsingComparator:&__block_literal_global_95345];
      id v7 = objc_alloc(MEMORY[0x1E4F1CAA0]);
      uint64_t v8 = [v6 valueForKey:@"asset"];
      uint64_t v9 = (void *)[v7 initWithArray:v8];

      long long v10 = [(PLDuplicateAlbum *)self assets];
      char v11 = [v10 isEqualToOrderedSet:v9];

      if ((v11 & 1) == 0) {
        [(PLDuplicateAlbum *)self setAssets:v9];
      }
      [(PLDuplicateAlbum *)self updateDuplicateAssetVisibilityStateWithDuplicateAssets:v5];
    }
  }
}

uint64_t __30__PLDuplicateAlbum_sortAssets__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (id)duplicateAssetsFromCollection
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v3 = [(PLDuplicateAlbum *)self albumAssetsFetchRequestForDuplicateSort];
  unint64_t v4 = (void *)MEMORY[0x1E4F8B9B0];
  id v5 = [(PLGenericAlbum *)self photoLibrary];
  id v6 = [v5 managedObjectContext];
  id v7 = [v4 startedQueryStatsWithContext:v6];

  uint64_t v8 = [(PLDuplicateAlbum *)self managedObjectContext];
  id v28 = 0;
  uint64_t v9 = [v8 executeFetchRequest:v3 error:&v28];
  id v10 = v28;

  char v11 = objc_msgSend(v7, "stopRecordingDescriptionWithFetchCount:", objc_msgSend(v9, "count"));
  if (v11)
  {
    long long v12 = PLDuplicateDetectionGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138412802;
      id v31 = v14;
      __int16 v32 = 2112;
      v33 = @"Duplicate Album: Assets from collection";
      __int16 v34 = 2112;
      v35 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "[QUERY STATS]:[%@] %@: %@ ", buf, 0x20u);
    }
  }

  if (v9)
  {
    uint64_t v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    int v16 = v9;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      id v23 = v10;
      uint64_t v19 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          long long v21 = [[PLDuplicateAsset alloc] initWithAsset:*(void *)(*((void *)&v24 + 1) + 8 * i)];
          [v15 addObject:v21];
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v29 count:16];
      }
      while (v18);
      id v10 = v23;
    }
  }
  else
  {
    int v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v10;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Failed to fetch assets for duplicate sorting. Error: %@", buf, 0xCu);
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (BOOL)supportsAssetOrderKeys
{
  return 1;
}

- (void)updateAlbumType
{
  v3 = [(PLDuplicateAlbum *)self metadataMatchingAssets];
  uint64_t v4 = [v3 count];

  id v5 = [(PLDuplicateAlbum *)self perceptualMatchingAssets];
  uint64_t v6 = [v5 count];

  if (v4)
  {
    if (v6)
    {
      id v7 = [(PLDuplicateAlbum *)self assets];
      uint64_t v8 = [v7 count];

      uint64_t v9 = [(PLDuplicateAlbum *)self assets];
      id v10 = (void *)MEMORY[0x1E4F28F60];
      char v11 = [(PLDuplicateAlbum *)self metadataMatchingAssets];
      long long v12 = [v10 predicateWithFormat:@"self in %@", v11];
      int v13 = [v9 filteredOrderedSetUsingPredicate:v12];
      uint64_t v14 = [v13 count];

      if (v8 == v14) {
        uint64_t v15 = 1;
      }
      else {
        uint64_t v15 = 256;
      }
    }
    else
    {
      uint64_t v15 = 1;
    }
  }
  else
  {
    if (!v6) {
      return;
    }
    uint64_t v15 = 2;
  }
  if (v15 != [(PLDuplicateAlbum *)self duplicateType])
  {
    [(PLDuplicateAlbum *)self setDuplicateType:v15];
  }
}

- (void)removeInternalAssets:(id)a3
{
  id v8 = a3;
  if ([v8 count])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v8];
    id v5 = [(PLDuplicateAlbum *)self mutableMetadataMatchingAssets];
    [v5 minusSet:v4];

    uint64_t v6 = [(PLDuplicateAlbum *)self mutablePerceptualMatchingAssets];
    [v6 minusSet:v4];

    [(PLDuplicateAlbum *)self updateAlbumType];
    [(PLDuplicateAlbum *)self setProcessingVersion:[(PLDuplicateAlbum *)self processingVersion] + 1];
    id v7 = [(PLGenericAlbum *)self photoLibrary];
    +[PLDuplicateProcessor signalBackgroundJobServiceDuplicateProcessingWithLibrary:v7];
  }
}

- (id)mutablePerceptualMatchingAssets
{
  return (id)[(PLDuplicateAlbum *)self mutableSetValueForKey:@"perceptualMatchingAssets"];
}

- (id)mutableMetadataMatchingAssets
{
  return (id)[(PLDuplicateAlbum *)self mutableSetValueForKey:@"metadataMatchingAssets"];
}

- (void)awakeFromInsert
{
  v3.receiver = self;
  v3.super_class = (Class)PLDuplicateAlbum;
  [(PLGenericAlbum *)&v3 awakeFromInsert];
  [(PLGenericAlbum *)self setKindValue:1510];
}

+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3 predicate:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1C0D0];
  id v6 = a4;
  id v7 = a3;
  id v8 = +[PLDuplicateAlbum entityName];
  uint64_t v9 = [v5 fetchRequestWithEntityName:v8];

  [v9 setPredicate:v6];
  id v14 = 0;
  id v10 = [v7 executeFetchRequest:v9 error:&v14];

  id v11 = v14;
  if (!v10)
  {
    long long v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to fetch duplicate albums. Error: %@", buf, 0xCu);
    }
  }
  return v10;
}

+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3 type:(signed __int16)a4
{
  int v4 = a4;
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a3;
  id v8 = objc_msgSend(v6, "predicateWithFormat:", @"%K = %d", @"duplicateType", v4);
  uint64_t v9 = [a1 duplicateAlbumsInCurrentManagedObjectContext:v7 predicate:v8];

  return v9;
}

+ (id)duplicateAlbumsInCurrentManagedObjectContext:(id)a3
{
  return (id)[a1 duplicateAlbumsInCurrentManagedObjectContext:a3 predicate:0];
}

+ (id)albumSupportsAssetOrderKeysPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"kind == %d", 1510);
}

+ (id)insertIntoPhotoLibrary:(id)a3
{
  objc_super v3 = [a3 managedObjectContext];
  int v4 = +[PLManagedObject insertInManagedObjectContext:v3];

  if (v4) {
    [v4 setDuplicateType:0];
  }
  return v4;
}

+ (id)entityName
{
  return @"DuplicateAlbum";
}

@end