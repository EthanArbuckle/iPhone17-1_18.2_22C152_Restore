@interface PLKeywordManager
+ (id)_keywordsForAsset:(id)a3;
+ (id)keywordsForAssetWithUUID:(id)a3 managedObjectContext:(id)a4;
+ (id)keywordsForAssets:(id)a3;
- (BOOL)_setKeyword:(id)a3 forAssets:(id)a4 managedObjectContext:(id)a5;
- (BOOL)_setKeywords:(id)a3 forAsset:(id)a4 managedObjectContext:(id)a5;
- (BOOL)setKeyword:(id)a3 forAssets:(id)a4 managedObjectContext:(id)a5;
- (BOOL)setKeyword:(id)a3 managedObjectContext:(id)a4;
- (BOOL)setKeywords:(id)a3 forAsset:(id)a4;
- (BOOL)setKeywords:(id)a3 forAssetUUID:(id)a4 managedObjectContext:(id)a5;
- (PLKeywordManager)initWithPathManager:(id)a3;
- (id)_inq_keywordObjectsForKeywords:(id)a3 managedObjectContext:(id)a4;
- (id)createOrLookupKeywordForTitle:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
- (void)_inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext:(id)a3;
- (void)_invalidateKeywordCache;
@end

@implementation PLKeywordManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keywordCache, 0);
  objc_storeStrong((id *)&self->_writeQueue, 0);
  objc_storeStrong((id *)&self->_pathManager, 0);
}

- (BOOL)_setKeyword:(id)a3 forAssets:(id)a4 managedObjectContext:(id)a5
{
  v34[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = v11;
  if (v9)
  {
    if (v11) {
      goto LABEL_3;
    }
  }
  else
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLKeywordManager.m", 228, @"Invalid parameter not satisfying: %@", @"keyword" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
  }
  v27 = [MEMORY[0x1E4F28B00] currentHandler];
  [v27 handleFailureInMethod:a2, self, @"PLKeywordManager.m", 229, @"Invalid parameter not satisfying: %@", @"moc" object file lineNumber description];

LABEL_3:
  v13 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  v14 = [v12 pathManager];
  v15 = [v14 libraryURL];
  char v16 = [v13 isEqual:v15];

  if ((v16 & 1) == 0)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    v29 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
    v30 = [v12 pathManager];
    v31 = [v30 libraryURL];
    [v28 handleFailureInMethod:a2, self, @"PLKeywordManager.m", 234, @"KeywordManager libraryURL and moc libraryURL mismatch: %@ != %@", v29, v31 object file lineNumber description];
  }
  pl_dispatch_sync();
  v34[0] = v9;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  v18 = [(PLKeywordManager *)self _inq_keywordObjectsForKeywords:v17 managedObjectContext:v12];

  uint64_t v19 = [v18 count];
  if (!v19)
  {
    v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v33 = v9;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to fetch existing keyword %@", buf, 0xCu);
    }
    goto LABEL_10;
  }
  if ([v10 count])
  {
    v20 = [v18 firstObject];
    id v21 = objc_alloc(MEMORY[0x1E4F1CA80]);
    v22 = [v20 assetAttributes];
    v23 = (void *)[v21 initWithSet:v22];

    v24 = [v10 valueForKeyPath:@"additionalAttributes"];
    [v23 addObjectsFromArray:v24];

    [v20 setAssetAttributes:v23];
LABEL_10:
  }
  dispatch_resume((dispatch_object_t)self->_writeQueue);

  return v19 != 0;
}

void __63__PLKeywordManager__setKeyword_forAssets_managedObjectContext___block_invoke(uint64_t a1)
{
}

- (BOOL)_setKeywords:(id)a3 forAsset:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
  v13 = [v11 pathManager];
  v14 = [v13 libraryURL];
  char v15 = [v12 isEqual:v14];

  if ((v15 & 1) == 0)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    v30 = [(PLPhotoLibraryPathManager *)self->_pathManager libraryURL];
    v31 = [v11 pathManager];
    v32 = [v31 libraryURL];
    [v29 handleFailureInMethod:a2, self, @"PLKeywordManager.m", 199, @"KeywordManager libraryURL and moc libraryURL mismatch: %@ != %@", v30, v32 object file lineNumber description];
  }
  pl_dispatch_sync();
  char v16 = PLBackendGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [v10 uuid];
    *(_DWORD *)buf = 138543362;
    v34 = v17;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "Setting keywords for asset: %{public}@", buf, 0xCu);
  }
  v18 = PLBackendGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138543362;
    v34 = v9;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEBUG, "Keywords: %{public}@", buf, 0xCu);
  }

  if ([v9 count])
  {
    uint64_t v19 = [v9 allObjects];
    v20 = [(PLKeywordManager *)self _inq_keywordObjectsForKeywords:v19 managedObjectContext:v11];

    if (v20)
    {
      id v21 = [v10 additionalAttributes];
      v22 = [v21 mutableSetValueForKey:@"keywords"];

      v23 = [MEMORY[0x1E4F1CAD0] setWithArray:v20];
      [v22 setSet:v23];

      v24 = PLBackendGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138543362;
        v34 = v22;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_DEBUG, "asset keywords now contains: %{public}@", buf, 0xCu);
      }

      int v25 = 1;
    }
    else
    {
      v22 = PLBackendGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v27 = [v10 uuid];
        *(_DWORD *)buf = 138412290;
        v34 = v27;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to fetch existing keywords for asset %@", buf, 0xCu);
      }
      int v25 = 0;
    }
  }
  else
  {
    v26 = PLBackendGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEBUG, "Setting keywords to nil", buf, 2u);
    }

    v20 = [v10 additionalAttributes];
    [v20 setKeywords:0];
    int v25 = 1;
  }

  dispatch_resume((dispatch_object_t)self->_writeQueue);
  return v25 != 0;
}

void __63__PLKeywordManager__setKeywords_forAsset_managedObjectContext___block_invoke(uint64_t a1)
{
}

- (id)_inq_keywordObjectsForKeywords:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v46 = v7;
  [(PLKeywordManager *)self _inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext:v7];
  v47 = self;
  if (self->_keywordCache)
  {
    v45 = v8;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v44 = v6;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v58 objects:v68 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v59;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v59 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v58 + 1) + 8 * i);
          char v15 = [(NSMutableDictionary *)v47->_keywordCache objectForKeyedSubscript:v14];
          if (v15)
          {
            id v57 = 0;
            char v16 = [v46 existingObjectWithID:v15 error:&v57];
            id v17 = v57;
            if (v16
              && ([v16 title],
                  v18 = objc_claimAutoreleasedReturnValue(),
                  int v19 = [v14 isEqualToString:v18],
                  v18,
                  v19))
            {
              [v45 setObject:v16 forKey:v14];
            }
            else
            {
              v20 = PLBackendGetLog();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                v65 = v15;
                __int16 v66 = 2112;
                id v67 = v17;
                _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "keyword cache miss for %{public}@. Error: %@", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v58 objects:v68 count:16];
      }
      while (v11);
    }

    id v21 = [MEMORY[0x1E4F1CA48] array];
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v22 = v9;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v24; ++j)
        {
          if (*(void *)v54 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          v28 = [v45 objectForKey:v27];

          if (!v28)
          {
            v29 = +[PLManagedKeyword entityName];
            v30 = PLSafeInsertNewObjectForEntityForNameInManagedObjectContext((uint64_t)v29, (uint64_t)v46, 0);

            if (!v30) {
              goto LABEL_27;
            }
            [v30 setTitle:v27];
            [v45 setObject:v30 forKey:v27];
            [v21 addObject:v30];
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v24);
    }
LABEL_27:

    if ([v21 count])
    {
      id v52 = 0;
      int v31 = [v46 obtainPermanentIDsForObjects:v21 error:&v52];
      id v32 = v52;
      if (v31)
      {
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        id v33 = v21;
        uint64_t v34 = [v33 countByEnumeratingWithState:&v48 objects:v62 count:16];
        if (v34)
        {
          uint64_t v35 = v34;
          uint64_t v36 = *(void *)v49;
          do
          {
            for (uint64_t k = 0; k != v35; ++k)
            {
              if (*(void *)v49 != v36) {
                objc_enumerationMutation(v33);
              }
              v38 = *(void **)(*((void *)&v48 + 1) + 8 * k);
              keywordCache = v47->_keywordCache;
              v40 = [v38 objectID];
              v41 = [v38 title];
              [(NSMutableDictionary *)keywordCache setObject:v40 forKey:v41];
            }
            uint64_t v35 = [v33 countByEnumeratingWithState:&v48 objects:v62 count:16];
          }
          while (v35);
        }
      }
    }
    v8 = v45;
    v42 = [v45 allValues];
    id v6 = v44;
  }
  else
  {
    id v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to fetch keywords.", buf, 2u);
    }
    v42 = 0;
  }

  return v42;
}

- (void)_invalidateKeywordCache
{
}

void __43__PLKeywordManager__invalidateKeywordCache__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  v2 = *(void **)(v1 + 24);
  *(void *)(v1 + 24) = 0;
}

- (void)_inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext:(id)a3
{
  id v5 = a3;
  if (!self->_keywordCache)
  {
    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    keywordCache = self->_keywordCache;
    self->_keywordCache = v6;

    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __83__PLKeywordManager__inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext___block_invoke;
    v8[3] = &unk_1E5875E40;
    uint64_t v10 = self;
    SEL v11 = a2;
    id v9 = v5;
    [v9 performBlockAndWait:v8];
  }
}

void __83__PLKeywordManager__inq_loadKeywordsUsingContextIfNecessaryInManagedObjectContext___block_invoke(void *a1)
{
  v32[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLManagedKeyword entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  v32[0] = @"title";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v32 count:1];
  [v4 setPropertiesToFetch:v5];

  [v4 setReturnsObjectsAsFaults:0];
  id v6 = (void *)a1[4];
  id v28 = 0;
  id v7 = [v6 executeFetchRequest:v4 error:&v28];
  id v8 = v28;
  if (v8)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a1[6], a1[5], @"PLKeywordManager.m", 128, @"Failed to fetch existing keywords: %@", v8 object file lineNumber description];
  }
  id v9 = (void *)a1[4];
  id v27 = v8;
  int v10 = [v9 obtainPermanentIDsForObjects:v7 error:&v27];
  id v11 = v27;

  if (v10)
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v12 = v7;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      id v22 = v11;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          v18 = [v17 title];
          int v19 = *(void **)(a1[5] + 24);
          v20 = [v17 objectID];
          [v19 setObject:v20 forKey:v18];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v14);
      id v11 = v22;
    }
  }
  else
  {
    uint64_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v11;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Failed to get permanent IDs for keywords: %@", buf, 0xCu);
    }
  }
}

- (id)createOrLookupKeywordForTitle:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x3032000000;
  int v31 = __Block_byref_object_copy__58253;
  id v32 = __Block_byref_object_dispose__58254;
  id v33 = 0;
  uint64_t v22 = 0;
  long long v23 = &v22;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__58253;
  long long v26 = __Block_byref_object_dispose__58254;
  id v27 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__PLKeywordManager_createOrLookupKeywordForTitle_photoLibrary_error___block_invoke;
  v17[3] = &unk_1E586C518;
  v17[4] = self;
  id v10 = v8;
  id v18 = v10;
  id v11 = v9;
  id v19 = v11;
  v20 = &v28;
  id v21 = &v22;
  [v11 performBlockAndWait:v17];
  uint64_t v12 = v29[5];
  id v13 = (id)v23[5];
  uint64_t v14 = v13;
  if (!v12 && a5) {
    *a5 = v13;
  }

  id v15 = (id)v29[5];
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v15;
}

void __69__PLKeywordManager_createOrLookupKeywordForTitle_photoLibrary_error___block_invoke(uint64_t a1)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  v4 = [*(id *)(a1 + 48) managedObjectContext];
  LODWORD(v2) = [v2 setKeyword:v3 managedObjectContext:v4];

  if (v2)
  {
    uint64_t v5 = *(void *)(a1 + 40);
    id v15 = [*(id *)(a1 + 48) managedObjectContext];
    uint64_t v6 = +[PLManagedKeyword keywordForTitle:context:](PLManagedKeyword, "keywordForTitle:context:", v5);
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"Failed to create keyword";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    uint64_t v12 = [v9 errorWithDomain:v10 code:41003 userInfo:v11];
    uint64_t v13 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
}

- (BOOL)setKeyword:(id)a3 managedObjectContext:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if ((PLIsAssetsd() & 1) == 0)
  {
    id v11 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLKeywordManager.m", 97, @"%s must be called in assetsd", "-[PLKeywordManager setKeyword:managedObjectContext:]");
  }
  BOOL v9 = [(PLKeywordManager *)self _setKeyword:v7 forAssets:0 managedObjectContext:v8];

  return v9;
}

- (BOOL)setKeyword:(id)a3 forAssets:(id)a4 managedObjectContext:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((PLIsAssetsd() & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLKeywordManager.m", 92, @"%s must be called in assetsd", "-[PLKeywordManager setKeyword:forAssets:managedObjectContext:]");
  }
  BOOL v12 = [(PLKeywordManager *)self _setKeyword:v9 forAssets:v10 managedObjectContext:v11];

  return v12;
}

- (BOOL)setKeywords:(id)a3 forAsset:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLKeywordManager.m", 87, @"%s must be called in assetsd", "-[PLKeywordManager setKeywords:forAsset:]");
  }
  id v9 = [v7 managedObjectContext];
  BOOL v10 = [(PLKeywordManager *)self _setKeywords:v8 forAsset:v7 managedObjectContext:v9];

  return v10;
}

- (BOOL)setKeywords:(id)a3 forAssetUUID:(id)a4 managedObjectContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PLKeywordManager.m", 76, @"%s must be called in assetsd", "-[PLKeywordManager setKeywords:forAssetUUID:managedObjectContext:]");
  }
  BOOL v12 = +[PLManagedAsset assetWithUUID:v10 inManagedObjectContext:v11];
  if (v12)
  {
    BOOL v13 = [(PLKeywordManager *)self _setKeywords:v9 forAsset:v12 managedObjectContext:v11];
  }
  else
  {
    uint64_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v10;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Asset with uuid %@ cannot be found.", buf, 0xCu);
    }

    BOOL v13 = 0;
  }

  return v13;
}

- (PLKeywordManager)initWithPathManager:(id)a3
{
  id v6 = a3;
  if ((PLIsAssetsd() & 1) == 0 && (MEMORY[0x19F38C0C0]() & 1) == 0)
  {
    BOOL v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:self file:@"PLKeywordManager.m" lineNumber:34 description:@"PLKeywordManager must be initialized in assetsd"];
  }
  v13.receiver = self;
  v13.super_class = (Class)PLKeywordManager;
  id v7 = [(PLKeywordManager *)&v13 init];
  id v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_pathManager, a3);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.photos.assetsd.keywordWrites", 0);
    writeQueue = v8->_writeQueue;
    v8->_writeQueue = (OS_dispatch_queue *)v9;
  }
  return v8;
}

+ (id)_keywordsForAsset:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a3 additionalAttributes];
  v4 = [v3 keywords];
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "title", (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (id)keywordsForAssets:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
        BOOL v12 = (void *)MEMORY[0x19F38D3B0](v7);
        long long v13 = objc_msgSend(a1, "_keywordsForAsset:", v11, (void)v15);
        [v5 addObject:v13];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

+ (id)keywordsForAssetWithUUID:(id)a3 managedObjectContext:(id)a4
{
  uint64_t v5 = +[PLManagedAsset assetWithUUID:a3 inManagedObjectContext:a4];
  id v6 = [a1 _keywordsForAsset:v5];

  return v6;
}

@end