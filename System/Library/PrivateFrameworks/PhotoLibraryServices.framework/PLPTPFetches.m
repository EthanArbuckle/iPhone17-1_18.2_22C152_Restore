@interface PLPTPFetches
+ (id)fetchAssetIdsToExcludeFromPTPInContext:(id)a3 isCloudPhotoLibraryEnabled:(BOOL)a4;
+ (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3 inLibrary:(id)a4;
+ (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3 inLibrary:(id)a4 isCloudPhotoLibraryEnabled:(BOOL)a5;
+ (id)predicateForAssetsExposedByPHPTPExcludingObjectIDs:(id)a3;
@end

@implementation PLPTPFetches

+ (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3 inLibrary:(id)a4 isCloudPhotoLibraryEnabled:(BOOL)a5
{
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"PLPTPFetches.m", 93, @"Invalid parameter not satisfying: %@", @"photoLibrary != nil" object file lineNumber description];
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__14625;
  v25 = __Block_byref_object_dispose__14626;
  id v26 = 0;
  v11 = [v10 managedObjectContext];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __102__PLPTPFetches_fetchObjectIDsForAssetsExposedToPTPFromObjectIDs_inLibrary_isCloudPhotoLibraryEnabled___block_invoke;
  v16[3] = &unk_1E5865378;
  id v19 = a1;
  id v12 = v11;
  BOOL v20 = a5;
  id v17 = v12;
  v18 = &v21;
  [v12 performBlockAndWait:v16];
  id v13 = (id)v22[5];

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __102__PLPTPFetches_fetchObjectIDsForAssetsExposedToPTPFromObjectIDs_inLibrary_isCloudPhotoLibraryEnabled___block_invoke(uint64_t a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x19F38D3B0]();
  v3 = [*(id *)(a1 + 48) fetchAssetIdsToExcludeFromPTPInContext:*(void *)(a1 + 32) isCloudPhotoLibraryEnabled:*(unsigned __int8 *)(a1 + 56)];
  v4 = [*(id *)(a1 + 48) predicateForAssetsExposedByPHPTPExcludingObjectIDs:v3];
  v5 = +[PLManagedAsset entityName];
  v6 = +[PLFetchRequest fetchRequestWithEntityName:v5];

  [v6 setPredicate:v4];
  [v6 setResultType:1];
  v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:1];
  v18[0] = v7;
  v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v6 setSortDescriptors:v8];

  id v9 = *(void **)(a1 + 32);
  id v15 = 0;
  uint64_t v10 = [v9 executeFetchRequest:v6 error:&v15];
  id v11 = v15;
  uint64_t v12 = *(void *)(*(void *)(a1 + 40) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v10;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    v14 = PLPTPGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v11;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Error fetching assets from the database: %@", buf, 0xCu);
    }
  }
}

+ (id)predicateForAssetsExposedByPHPTPExcludingObjectIDs:(id)a3
{
  v25[4] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  v3 = (void *)MEMORY[0x1E4F28BA0];
  BOOL v20 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"noindex:(%K) == %d", @"visibilityState", 0);
  v23[0] = v20;
  id v19 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForUserLibrary"), 0);
  v23[1] = v19;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v5 = [v3 andPredicateWithSubpredicates:v4];
  v24[0] = v5;
  v6 = +[PLManagedAsset predicateForAvalancheKindAssetsWithKind:1];
  v24[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  v8 = [v3 orPredicateWithSubpredicates:v7];
  v25[0] = v8;
  id v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 0);
  v25[1] = v9;
  uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != 0", @"complete");
  v25[2] = v10;
  id v11 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForSuppressPtpInfo"), 0);
  v25[3] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  id v13 = [v3 andPredicateWithSubpredicates:v12];

  if ([v21 count])
  {
    v14 = (void *)MEMORY[0x1E4F28BA0];
    v22[0] = v13;
    id v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT self IN %@", v21];
    v22[1] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
    uint64_t v17 = [v14 andPredicateWithSubpredicates:v16];

    id v13 = (void *)v17;
  }

  return v13;
}

+ (id)fetchAssetIdsToExcludeFromPTPInContext:(id)a3 isCloudPhotoLibraryEnabled:(BOOL)a4
{
  v34[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    id v4 = a3;
    v5 = +[PLInternalResource entityName];
    v6 = +[PLFetchRequest fetchRequestWithEntityName:v5];

    v34[0] = @"asset";
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
    [v6 setPropertiesToGroupBy:v7];

    v33 = @"asset";
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v33 count:1];
    [v6 setPropertiesToFetch:v8];

    [v6 setResultType:2];
    v32 = @"asset";
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    [v6 setRelationshipKeyPathsForPrefetching:v9];

    objc_msgSend(v6, "setPl_importantFetchName:", @"fetchAllObjectIDsForAssetsExposedToPTP");
    uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
    id v11 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"dataStoreClassID", 0);
    v31[0] = v11;
    uint64_t v12 = (void *)MEMORY[0x1E4F28F60];
    id v13 = +[PLInternalResource originalCPLResourceTypesForMaster];
    v14 = [v12 predicateWithFormat:@"%K IN %@", @"dataStoreSubtype", v13];
    v31[1] = v14;
    id v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"version", 0);
    v31[2] = v15;
    v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K <= %d", @"localAvailability", 0xFFFFFFFFLL);
    v31[3] = v16;
    uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];
    v18 = [v10 andPredicateWithSubpredicates:v17];

    [v6 setPredicate:v18];
    id v28 = 0;
    id v19 = [v4 executeFetchRequest:v6 error:&v28];

    id v20 = v28;
    if (v19)
    {
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __82__PLPTPFetches_fetchAssetIdsToExcludeFromPTPInContext_isCloudPhotoLibraryEnabled___block_invoke;
      v26[3] = &unk_1E5865350;
      v27 = @"asset";
      id v21 = objc_msgSend(v19, "_pl_map:", v26);
      v22 = v27;
    }
    else
    {
      v22 = PLPTPGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v20;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Error fetching assets from the database: %@", buf, 0xCu);
      }
      id v21 = 0;
    }
  }
  else
  {
    id v21 = 0;
  }
  if (v21) {
    uint64_t v23 = v21;
  }
  else {
    uint64_t v23 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v24 = v23;

  return v24;
}

uint64_t __82__PLPTPFetches_fetchAssetIdsToExcludeFromPTPInContext_isCloudPhotoLibraryEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 objectForKeyedSubscript:*(void *)(a1 + 32)];
}

+ (id)fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:(id)a3 inLibrary:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_msgSend(a1, "fetchObjectIDsForAssetsExposedToPTPFromObjectIDs:inLibrary:isCloudPhotoLibraryEnabled:", v7, v6, objc_msgSend(v6, "isCloudPhotoLibraryEnabled"));

  return v8;
}

@end