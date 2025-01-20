@interface PLResourceDataStoreManager
+ (id)storeExternalResources:(id)a3 forAsset:(id)a4 forLifecycleEvent:(unsigned int)a5 error:(id *)a6;
+ (id)storeForExternalResource:(id)a3 inLibraryWithID:(id)a4;
+ (id)storesForLibraryID:(id)a3;
+ (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4;
@end

@implementation PLResourceDataStoreManager

+ (id)storeExternalResources:(id)a3 forAsset:(id)a4 forLifecycleEvent:(unsigned int)a5 error:(id *)a6
{
  uint64_t v7 = *(void *)&a5;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = v11;
  if (!v10)
  {
    v54 = [MEMORY[0x1E4F28B00] currentHandler];
    [v54 handleFailureInMethod:a2, a1, @"PLResourceDataStoreManager.m", 192, @"Invalid parameter not satisfying: %@", @"externalResources" object file lineNumber description];

    if (v12) {
      goto LABEL_3;
    }
LABEL_50:
    v55 = [MEMORY[0x1E4F28B00] currentHandler];
    [v55 handleFailureInMethod:a2, a1, @"PLResourceDataStoreManager.m", 193, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];

    goto LABEL_3;
  }
  if (!v11) {
    goto LABEL_50;
  }
LABEL_3:
  v13 = [MEMORY[0x1E4F1CA80] set];
  v14 = [v12 assetID];
  v15 = [v14 libraryID];

  context = (void *)MEMORY[0x19F38D3B0]();
  v16 = PLImageManagerGetLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    v17 = [v12 uuid];
    *(_DWORD *)buf = 138412290;
    v84 = v17;
    _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_DEBUG, "[RM]: Storing external resources for asset: %@", buf, 0xCu);
  }
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id v18 = v10;
  v19 = &off_19BA99000;
  uint64_t v62 = [v18 countByEnumeratingWithState:&v74 objects:v87 count:16];
  v63 = v15;
  id v60 = v18;
  if (!v62)
  {

    goto LABEL_33;
  }
  v56 = a6;
  id v20 = 0;
  uint64_t v61 = *(void *)v75;
  uint64_t v59 = *MEMORY[0x1E4F8C520];
  uint64_t v58 = *MEMORY[0x1E4F28568];
  v21 = v18;
  while (2)
  {
    v64 = v20;
    for (uint64_t i = 0; i != v62; ++i)
    {
      if (*(void *)v75 != v61) {
        objc_enumerationMutation(v21);
      }
      v23 = *(void **)(*((void *)&v74 + 1) + 8 * i);
      uint64_t v24 = [a1 storeForExternalResource:v23 inLibraryWithID:v15];
      if (!v24)
      {
        v41 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v79 = v58;
        v80 = @"Failed to find a store for a resource.";
        v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v80 forKeys:&v79 count:1];
        uint64_t v43 = [v41 errorWithDomain:v59 code:2 userInfo:v42];

        id v20 = (id)v43;
        goto LABEL_30;
      }
      v25 = (void *)v24;
      v26 = objc_alloc_init(PLResourceDataStoreOptions);
      v27 = v26;
      if (v7 == 1)
      {
        uint64_t v28 = 1;
      }
      else
      {
        if (v7 != 2) {
          goto LABEL_16;
        }
        uint64_t v28 = 0;
      }
      [(PLResourceDataStoreOptions *)v26 setAssumeNoExistingResources:v28];
LABEL_16:
      v29 = PLImageManagerGetLog();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v84 = v23;
        __int16 v85 = 2112;
        v86 = v25;
        _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "[RM]: Storing external resource: %@ in store: %@...", buf, 0x16u);
      }

      v30 = PLImageManagerGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        [v23 fileURL];
        v31 = v21;
        v33 = v32 = v27;
        *(_DWORD *)buf = 138412290;
        v84 = v33;
        _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEBUG, "[RM]:   resource url: %@", buf, 0xCu);

        v27 = v32;
        v21 = v31;
        v15 = v63;
      }

      id v72 = 0;
      id v73 = 0;
      v66 = v27;
      int v34 = [v25 storeExternalResource:v23 forAsset:v12 options:v27 error:&v73 resultingResource:&v72];
      id v35 = v73;
      id v36 = v72;
      v37 = v36;
      if (v34)
      {
        [v36 setAsset:v12];
        [v13 addObject:v37];
      }
      else
      {
        v38 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v81 = v58;
        v82 = @"Failed while storing a resource.";
        uint64_t v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v82 forKeys:&v81 count:1];
        uint64_t v40 = [v38 errorWithDomain:v59 code:3 userInfo:v39];

        v37 = (void *)v39;
        v21 = v60;
        v64 = (void *)v40;
        v15 = v63;
      }

      if (!v34)
      {
        id v20 = v64;
        goto LABEL_30;
      }
    }
    id v20 = v64;
    uint64_t v62 = [v21 countByEnumeratingWithState:&v74 objects:v87 count:16];
    if (v62) {
      continue;
    }
    break;
  }
LABEL_30:

  v19 = &off_19BA99000;
  if (v20)
  {
    if (v56)
    {
      id v20 = v20;
      id v44 = 0;
      id *v56 = v20;
    }
    else
    {
      id v44 = 0;
    }
    goto LABEL_45;
  }
LABEL_33:
  long long v70 = 0u;
  long long v71 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  v45 = [a1 storesForLibraryID:v15];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v68 objects:v78 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v69;
    int v67 = *((void *)v19 + 80);
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v69 != v48) {
          objc_enumerationMutation(v45);
        }
        v50 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        v51 = [v50 updateDerivativeResourcesForAsset:v12 forLifecycleEvent:v7];
        [v13 unionSet:v51];
        if ([v51 count])
        {
          v52 = PLImageManagerGetLog();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v67;
            v84 = v51;
            __int16 v85 = 2112;
            v86 = v50;
            _os_log_impl(&dword_19B3C7000, v52, OS_LOG_TYPE_DEBUG, "[RM]: Produced derivative resources: %@ for store: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v47 = [v45 countByEnumeratingWithState:&v68 objects:v78 count:16];
    }
    while (v47);
  }

  id v44 = v13;
  id v20 = 0;
  v15 = v63;
  v21 = v60;
LABEL_45:

  return v44;
}

+ (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    id v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, a1, @"PLResourceDataStoreManager.m", 176, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  v8 = [MEMORY[0x1E4F1CA80] set];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v9 = [v7 assetID];
  id v10 = [v9 libraryID];
  id v11 = [a1 storesForLibraryID:v10];

  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = [*(id *)(*((void *)&v19 + 1) + 8 * i) updateDerivativeResourcesForAsset:v7 forLifecycleEvent:v4];
        [v8 unionSet:v16];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v13);
  }

  return v8;
}

+ (id)storeForExternalResource:(id)a3 inLibraryWithID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLResourceDataStoreManager.m", 160, @"Invalid parameter not satisfying: %@", @"resource" object file lineNumber description];
  }
  [a1 storesForLibraryID:v8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  id v10 = (id)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 canStoreExternalResource:v7])
        {
          id v10 = v13;
          goto LABEL_13;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v10;
}

+ (id)storesForLibraryID:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  os_unfair_lock_lock((os_unfair_lock_t)&s_lock);
  if (!storesForLibraryID__defaultStoreClassIDs)
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", &unk_1EEBED398, &unk_1EEBED3B0, &unk_1EEBED3C8, &unk_1EEBED3E0, 0);
    v5 = (void *)storesForLibraryID__defaultStoreClassIDs;
    storesForLibraryID__defaultStoreClassIDs = v4;
  }
  v6 = [(id)s_dataStoresByClassIDByLibraryID objectForKeyedSubscript:v3];
  id v7 = [v6 allValues];
  os_unfair_lock_unlock((os_unfair_lock_t)&s_lock);
  unint64_t v8 = [v7 count];
  if (v8 < [(id)storesForLibraryID__defaultStoreClassIDs count])
  {
    if (!v7) {
      id v7 = (id)MEMORY[0x1E4F1CBF0];
    }
    id v9 = (void *)[(id)storesForLibraryID__defaultStoreClassIDs mutableCopy];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v7 = v7;
    uint64_t v10 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v7);
          }
          uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend((id)objc_opt_class(), "storeClassID"));
          [v9 removeObject:v14];
        }
        uint64_t v11 = [v7 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v11);
    }

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v15 = v9;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v24 != v18) {
            objc_enumerationMutation(v15);
          }
          long long v20 = PLDataStoreForClassIDAndLibraryID((unsigned __int16)[*(id *)(*((void *)&v23 + 1) + 8 * j) integerValue], v3);
          if (v20)
          {
            uint64_t v21 = [v7 arrayByAddingObject:v20];

            id v7 = (id)v21;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v17);
    }
  }
  return v7;
}

@end