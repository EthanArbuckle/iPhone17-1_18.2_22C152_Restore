@interface PHFetchResult(PhotosUICore)
- (PXAssetSortByDatesFetchResult)px_fetchAssetSortDatesWithDateRangeEliminationBlock:()PhotosUICore;
- (id)px_fetchedObjectIDsSortedByLocalIdentifiers:()PhotosUICore;
- (id)px_fetchedObjectIDsSortedByUUIDs:()PhotosUICore;
- (id)px_opaqueIdentifiers;
- (id)px_sortByDatePropertySetClass;
- (id)px_subfetchResultWithObjectsAtIndexes:()PhotosUICore objectClass:;
- (uint64_t)px_indexOfSortedAssetNearestToAsset:()PhotosUICore;
- (uint64_t)px_sortOrder;
- (void)px_safelyPrefetchObjectAtIndex:()PhotosUICore;
- (void)px_safelyPrefetchThumbnailAssetAtIndex:()PhotosUICore;
@end

@implementation PHFetchResult(PhotosUICore)

- (void)px_safelyPrefetchObjectAtIndex:()PhotosUICore
{
  unint64_t v5 = [a1 count];
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
    [a1 prefetchObjectsAtIndexes:v6];
  }
}

- (id)px_opaqueIdentifiers
{
  v2 = [a1 fetchedObjects];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 oids];
  }
  else
  {
    v4 = [a1 fetchedObjects];
    uint64_t v5 = [v4 valueForKeyPath:@"px_opaqueIdentifier"];
    id v6 = (void *)v5;
    v7 = (void *)MEMORY[0x1E4F1CBF0];
    if (v5) {
      v7 = (void *)v5;
    }
    id v3 = v7;
  }
  return v3;
}

- (uint64_t)px_sortOrder
{
  uint64_t v1 = objc_msgSend(a1, "px_sortByDatePropertySetClass");
  if (v1 == objc_opt_class()) {
    return 1;
  }
  else {
    return 2 * (v1 == objc_opt_class());
  }
}

- (id)px_sortByDatePropertySetClass
{
  uint64_t v1 = [a1 fetchSortDescriptors];
  v2 = [v1 firstObject];

  id v3 = [v2 key];
  v4 = [MEMORY[0x1E4F38EC8] propertiesToFetch];
  uint64_t v5 = [v4 firstObject];
  char v6 = [v3 isEqualToString:v5];

  if (v6) {
    goto LABEL_3;
  }
  v7 = [v2 key];
  v8 = [MEMORY[0x1E4F38F10] propertiesToFetch];
  v9 = [v8 firstObject];
  int v10 = [v7 isEqualToString:v9];

  if (v10) {
LABEL_3:
  }
    v11 = objc_opt_class();
  else {
    v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (PXAssetSortByDatesFetchResult)px_fetchAssetSortDatesWithDateRangeEliminationBlock:()PhotosUICore
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  v44 = a1;
  uint64_t v4 = objc_msgSend(a1, "px_sortByDatePropertySetClass");
  if (v4 == objc_opt_class())
  {
    uint64_t v5 = &__block_literal_global_258789;
  }
  else
  {
    if (v4 != objc_opt_class())
    {
LABEL_22:
      v22 = 0;
      goto LABEL_29;
    }
    uint64_t v5 = &__block_literal_global_196_258790;
  }
  v39 = v5;
  if (!v4) {
    goto LABEL_22;
  }
  aClass = (objc_class *)v4;
  v37 = [MEMORY[0x1E4F1C9C8] now];
  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  char v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", 0, objc_msgSend(v44, "count"));
  id v41 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v40 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  uint64_t v8 = 0;
  if ([v6 count])
  {
    while (1)
    {
      v9 = (void *)MEMORY[0x1AD10CB00]();
      [v7 removeAllIndexes];
      if ((unint64_t)[v6 count] >= 3)
      {
        objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "firstIndex"));
        objc_msgSend(v7, "addIndex:", objc_msgSend(v6, "lastIndex"));
        [v6 removeIndexes:v7];
      }
      if ((unint64_t)[v7 count] <= 0x3E7)
      {
        do
        {
          if (![v6 count]) {
            break;
          }
          uint64_t v10 = [v6 count];
          if ((unint64_t)([v7 count] + v10) > 0x3E7)
          {
            v54[0] = MEMORY[0x1E4F143A8];
            v54[1] = 3221225472;
            v54[2] = __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_3;
            v54[3] = &unk_1E5DCD248;
            id v55 = v7;
            [v6 enumerateRangesUsingBlock:v54];
          }
          else
          {
            [v7 addIndexes:v6];
          }
          [v6 removeIndexes:v7];
        }
        while ((unint64_t)[v7 count] < 0x3E8);
      }
      v11 = PLUIGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v12 = (objc_class *)objc_opt_class();
        v13 = NSStringFromClass(v12);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v13;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1A9AE7000, v11, OS_LOG_TYPE_DEBUG, "%@ batchedBinarySearch fetchItems:%@", buf, 0x16u);
      }
      v14 = [v44 fetchPropertiesForPropertySetClass:aClass forObjectsAtIndexes:v7];
      if (!v14) {
        break;
      }
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&buf[16] = 0x2020000000;
      uint64_t v57 = 0;
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_201;
      v49[3] = &unk_1E5DCD270;
      id v15 = v42;
      id v50 = v15;
      id v52 = v39;
      id v16 = v14;
      id v51 = v16;
      v53 = buf;
      [v7 enumerateIndexesUsingBlock:v49];
      [v41 addIndexes:v7];

      _Block_object_dispose(buf, 8);
      id v17 = objc_alloc_init(MEMORY[0x1E4F28E60]);
      v45[0] = MEMORY[0x1E4F143A8];
      v45[1] = 3221225472;
      v45[2] = __83__PHFetchResult_PhotosUICore__px_fetchAssetSortDatesWithDateRangeEliminationBlock___block_invoke_2_204;
      v45[3] = &unk_1E5DCD298;
      id v46 = v15;
      id v48 = v43;
      id v18 = v17;
      id v47 = v18;
      [v6 enumerateRangesUsingBlock:v45];
      v19 = PLUIGetLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        v20 = (objc_class *)objc_opt_class();
        v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v21;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v18;
        _os_log_impl(&dword_1A9AE7000, v19, OS_LOG_TYPE_DEBUG, "%@ batchedBinarySearch eliminated ranges:%@", buf, 0x16u);
      }
      [v6 removeIndexes:v18];
      [v40 addIndexes:v18];

      ++v8;
      if (![v6 count]) {
        goto LABEL_26;
      }
    }
    v23 = PLUIGetLog();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = NSStringFromClass(aClass);
      *(_DWORD *)buf = 138412802;
      *(void *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2112;
      uint64_t v57 = (uint64_t)v24;
      _os_log_impl(&dword_1A9AE7000, v23, OS_LOG_TYPE_DEFAULT, "%@ unable to fetch properties from %@ for propertySetClass %@", buf, 0x20u);
    }
  }
LABEL_26:
  v25 = [PXAssetSortByDatesFetchResult alloc];
  v26 = [v44 fetchSortDescriptors];
  v27 = [v26 firstObject];
  v22 = [(PXAssetSortByDatesFetchResult *)v25 initWithSortDescriptor:v27 fetchedIndexes:v41 dateByIndex:v42];

  v28 = [MEMORY[0x1E4F1C9C8] now];
  [v28 timeIntervalSinceDate:v37];
  uint64_t v30 = v29;

  v31 = PLUIGetLog();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
  {
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    uint64_t v34 = [v40 count];
    uint64_t v35 = [v42 count];
    *(_DWORD *)buf = 138413314;
    *(void *)&buf[4] = v33;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v34;
    *(_WORD *)&buf[22] = 2048;
    uint64_t v57 = v35;
    __int16 v58 = 2048;
    uint64_t v59 = v8;
    __int16 v60 = 2048;
    uint64_t v61 = v30;
    _os_log_impl(&dword_1A9AE7000, v31, OS_LOG_TYPE_DEBUG, "%@ batchedBinarySearch skippedItems:%lu fetchedItems:%lu fetchesDone:%ld duration:%.3fs", buf, 0x34u);
  }
LABEL_29:

  return v22;
}

- (id)px_subfetchResultWithObjectsAtIndexes:()PhotosUICore objectClass:
{
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [a1 fetchedObjectIDs];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __81__PHFetchResult_PhotosUICore__px_subfetchResultWithObjectsAtIndexes_objectClass___block_invoke;
  v19 = &unk_1E5DCD2C0;
  id v20 = v6;
  id v21 = v7;
  id v9 = v7;
  id v10 = v6;
  [v8 enumerateObjectsUsingBlock:&v16];

  id v11 = objc_alloc(MEMORY[0x1E4F39150]);
  id v12 = objc_msgSend(a1, "photoLibrary", v16, v17, v18, v19);
  v13 = [a4 fetchType];
  v14 = (void *)[v11 initWithOids:v9 photoLibrary:v12 fetchType:v13 fetchPropertySets:0 identifier:0 registerIfNeeded:1];

  return v14;
}

- (void)px_safelyPrefetchThumbnailAssetAtIndex:()PhotosUICore
{
  unint64_t v5 = [a1 count];
  if ((a3 & 0x8000000000000000) == 0 && v5 > a3)
  {
    id v6 = (id)[objc_alloc(MEMORY[0x1E4F28D60]) initWithIndex:a3];
    [a1 prefetchThumbnailAssetsAtIndexes:v6];
  }
}

- (id)px_fetchedObjectIDsSortedByUUIDs:()PhotosUICore
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = NSNumber;
        v13 = objc_msgSend(v11, "uuid", (void)v18);
        v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexOfObject:", v13));
        id v15 = [v11 objectID];
        [v5 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [v5 keysSortedByValueUsingComparator:&__block_literal_global_210_258785];

  return v16;
}

- (id)px_fetchedObjectIDsSortedByLocalIdentifiers:()PhotosUICore
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a1;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        id v12 = NSNumber;
        v13 = objc_msgSend(v11, "localIdentifier", (void)v18);
        v14 = objc_msgSend(v12, "numberWithUnsignedInteger:", objc_msgSend(v4, "indexOfObject:", v13));
        id v15 = [v11 objectID];
        [v5 setObject:v14 forKeyedSubscript:v15];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  uint64_t v16 = [v5 keysSortedByValueUsingComparator:&__block_literal_global_208_258787];

  return v16;
}

- (uint64_t)px_indexOfSortedAssetNearestToAsset:()PhotosUICore
{
  id v4 = a3;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v5 = objc_msgSend(a1, "px_sortByDatePropertySetClass");
  if (v5 == objc_opt_class())
  {
    [v4 fetchPropertySetsIfNeeded];
    uint64_t v7 = [v4 curationProperties];
    id v6 = [v7 addedDate];

    if (!v6) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
  if (v5 == objc_opt_class())
  {
    id v6 = [v4 creationDate];
    if (!v6) {
      goto LABEL_8;
    }
LABEL_7:
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke;
    v17[3] = &unk_1E5DCD1B8;
    id v8 = v6;
    id v18 = v8;
    uint64_t v9 = objc_msgSend(a1, "px_fetchAssetSortDatesWithDateRangeEliminationBlock:", v17);
    v16[0] = 0;
    v16[1] = v16;
    v16[2] = 0x2020000000;
    v16[3] = 0x7FEFFFFFFFFFFFFFLL;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __67__PHFetchResult_PhotosUICore__px_indexOfSortedAssetNearestToAsset___block_invoke_2;
    v12[3] = &unk_1E5DCD1E0;
    id v6 = v8;
    id v13 = v6;
    v14 = v16;
    id v15 = &v19;
    [v9 enumerateFetchedItemsUsingBlock:v12];

    _Block_object_dispose(v16, 8);
    goto LABEL_8;
  }
  id v6 = 0;
LABEL_8:
  uint64_t v10 = v20[3];

  _Block_object_dispose(&v19, 8);
  return v10;
}

@end