@interface PGCurationCache
+ (id)defaultCacheName;
- (id)_curatedAssetIdentifiersforMomentUUID:(id)a3 options:(id)a4;
- (id)_curatedKeyAssetIdentifierforMomentUUID:(id)a3 options:(id)a4;
- (id)_fetchCurationObjectForEntityName:(id)a3 predicate:(id)a4;
- (id)curatedAssetIdentifiersForMoment:(id)a3 options:(id)a4;
- (id)curatedKeyAssetIdentifierForMoment:(id)a3 options:(id)a4;
- (id)dataModelName;
- (void)_invalidateCacheForMomentWithUUID:(id)a3;
- (void)_invalidateCacheForMomentsWithUUIDs:(id)a3;
- (void)_setCuratedAssets:(id)a3 forMomentUUID:(id)a4 options:(id)a5;
- (void)_setCuratedKeyAsset:(id)a3 forMomentUUID:(id)a4 options:(id)a5;
- (void)_setProperties:(id)a3 forCurationObjectWithEntityName:(id)a4 momentUUID:(id)a5 predicate:(id)a6;
- (void)setCuratedAssets:(id)a3 forMoment:(id)a4 options:(id)a5;
- (void)setCuratedKeyAsset:(id)a3 forMoment:(id)a4 options:(id)a5;
@end

@implementation PGCurationCache

+ (id)defaultCacheName
{
  return @"PGCurationCache.sqlite";
}

- (void)_invalidateCacheForMomentsWithUUIDs:(id)a3
{
  id v4 = a3;
  v5 = [(CLSDBCache *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__PGCurationCache__invalidateCacheForMomentsWithUUIDs___block_invoke;
  v7[3] = &unk_1E68EED30;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __55__PGCurationCache__invalidateCacheForMomentsWithUUIDs___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Moment"];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier IN %@", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C018]) initWithFetchRequest:v2];
  v5 = [*(id *)(a1 + 40) managedObjectContext];
  id v11 = 0;
  id v6 = (id)[v5 executeRequest:v4 error:&v11];
  id v7 = v11;

  [*(id *)(a1 + 40) _save];
  if (v7)
  {
    id v8 = +[PGLogging sharedLogging];
    v9 = [v8 loggingConnection];

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v9, OS_LOG_TYPE_ERROR, "Failed to invalidate curation cache for multiple moments.", buf, 2u);
    }
  }
}

- (void)_invalidateCacheForMomentWithUUID:(id)a3
{
  id v4 = a3;
  v5 = [(CLSDBCache *)self managedObjectContext];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__PGCurationCache__invalidateCacheForMomentWithUUID___block_invoke;
  v7[3] = &unk_1E68EED30;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [v5 performBlockAndWait:v7];
}

void __53__PGCurationCache__invalidateCacheForMomentWithUUID___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Moment"];
  v3 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(identifier == %@)", *(void *)(a1 + 32)];
  [v2 setPredicate:v3];
  id v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v22 = 0;
  v5 = [v4 executeFetchRequest:v2 error:&v22];
  id v6 = v22;

  if (v5)
  {
    id v16 = v6;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v18 + 1) + 8 * v11);
          v13 = [*(id *)(a1 + 40) managedObjectContext];
          [v13 deleteObject:v12];

          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v9);
    }

    [*(id *)(a1 + 40) _save];
    id v6 = v16;
  }
  else if (v6)
  {
    v14 = +[PGLogging sharedLogging];
    v15 = [v14 loggingConnection];

    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1805000, v15, OS_LOG_TYPE_ERROR, "Failed to invalidate curation cache for moment", buf, 2u);
    }
  }
}

- (void)_setProperties:(id)a3 forCurationObjectWithEntityName:(id)a4 momentUUID:(id)a5 predicate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v14 = [(CLSDBCache *)self managedObjectContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke;
  v19[3] = &unk_1E68E8610;
  v19[4] = self;
  id v20 = v12;
  id v21 = v11;
  id v22 = v13;
  id v23 = v10;
  id v15 = v10;
  id v16 = v13;
  id v17 = v11;
  id v18 = v12;
  [v14 performBlockAndWait:v19];
}

void __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke(uint64_t a1)
{
  v26[2] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:@"Moment"];
  id v4 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"identifier == %@", *(void *)(a1 + 40)];
  [v3 setFetchLimit:1];
  [v3 setPredicate:v4];
  id v25 = 0;
  v5 = [v2 executeFetchRequest:v3 error:&v25];
  id v6 = v25;
  if (v5 && [v5 count] == 1)
  {
    id v7 = [v5 objectAtIndex:0];
    uint64_t v8 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 48)];
    [v8 setFetchLimit:1];
    uint64_t v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"moment == %@", v7];
    id v10 = (void *)MEMORY[0x1E4F28BA0];
    uint64_t v11 = *(void *)(a1 + 56);
    id v21 = (void *)v9;
    v26[0] = v9;
    v26[1] = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
    uint64_t v13 = [v10 andPredicateWithSubpredicates:v12];

    id v20 = (void *)v13;
    [v8 setPredicate:v13];
    id v24 = v6;
    v14 = [v2 executeFetchRequest:v8 error:&v24];
    id v19 = v24;

    if (v14 && [v14 count] == 1)
    {
      uint64_t v15 = [v14 objectAtIndex:0];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:*(void *)(a1 + 48) inManagedObjectContext:v2];
    }
    id v16 = (void *)v15;

    id v6 = v19;
  }
  else
  {
    id v7 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:@"Moment" inManagedObjectContext:v2];
    [v7 setValue:*(void *)(a1 + 40) forKey:@"identifier"];
    id v16 = [MEMORY[0x1E4F1C0A8] insertNewObjectForEntityForName:*(void *)(a1 + 48) inManagedObjectContext:v2];
  }
  [v16 setValue:v7 forKey:@"moment"];
  id v17 = *(void **)(a1 + 64);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke_2;
  v22[3] = &unk_1E68E7D70;
  id v23 = v16;
  id v18 = v16;
  [v17 enumerateKeysAndObjectsUsingBlock:v22];
  [*(id *)(a1 + 32) _save];
}

void __87__PGCurationCache__setProperties_forCurationObjectWithEntityName_momentUUID_predicate___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v9 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA98];
  id v6 = a2;
  id v7 = [v5 null];

  if (v7 == v9) {
    id v8 = 0;
  }
  else {
    id v8 = v9;
  }
  [*(id *)(a1 + 32) setValue:v8 forKey:v6];
}

- (id)_fetchCurationObjectForEntityName:(id)a3 predicate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v18 = 0;
  id v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = __Block_byref_object_copy__5468;
  id v22 = __Block_byref_object_dispose__5469;
  id v23 = 0;
  id v8 = [(CLSDBCache *)self managedObjectContext];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __63__PGCurationCache__fetchCurationObjectForEntityName_predicate___block_invoke;
  v13[3] = &unk_1E68E54F0;
  id v9 = v6;
  id v14 = v9;
  id v10 = v7;
  id v15 = v10;
  id v16 = self;
  id v17 = &v18;
  [v8 performBlockAndWait:v13];

  id v11 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  return v11;
}

void __63__PGCurationCache__fetchCurationObjectForEntityName_predicate___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x1E4F1C0D0] fetchRequestWithEntityName:*(void *)(a1 + 32)];
  [v2 setFetchLimit:1];
  [v2 setPredicate:*(void *)(a1 + 40)];
  v3 = [*(id *)(a1 + 48) managedObjectContext];
  id v9 = 0;
  id v4 = [v3 executeFetchRequest:v2 error:&v9];
  id v5 = v9;

  if (v4 && [v4 count] == 1)
  {
    uint64_t v6 = [v4 objectAtIndex:0];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
}

- (void)_setCuratedKeyAsset:(id)a3 forMomentUUID:(id)a4 options:(id)a5
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v45 = a4;
  id v8 = a3;
  id v9 = [v7 referenceAsset];
  id v10 = v9;
  if (v9)
  {
    id v11 = [v9 localIdentifier];
  }
  else
  {
    id v11 = @"base";
  }

  id v12 = [v7 referenceLocation];
  [v12 coordinate];
  if (v12)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", v13, v14);
    id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v15 = @"base";
  }

  id v16 = [v7 referencePersonLocalIdentifiers];
  id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_compare_];
  v50[0] = v17;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  id v19 = [v16 sortedArrayUsingDescriptors:v18];

  if ([v19 count])
  {
    uint64_t v20 = [v19 componentsJoinedByString:@"_"];
  }
  else
  {
    uint64_t v20 = @"base";
  }

  v48[0] = @"referenceAsset";
  v48[1] = @"referenceLocation";
  v46 = v11;
  v49[0] = v11;
  v49[1] = v15;
  v43 = v20;
  v44 = v15;
  v49[2] = v20;
  v48[2] = @"referencePeople";
  v48[3] = @"complete";
  id v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "complete"));
  v49[3] = v21;
  v48[4] = @"focusOnPeople";
  id v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "focusOnPeople"));
  v49[4] = v22;
  v48[5] = @"useSummarizer";
  id v23 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "useSummarizer"));
  v49[5] = v23;
  v48[6] = @"useContextualCurationOnly";
  id v24 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "useContextualCurationOnly"));
  v49[6] = v24;
  v48[7] = @"prefilterAssetsWithFaces";
  id v25 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v7, "prefilterAssetsWithFaces"));
  v49[7] = v25;
  v48[8] = @"curatedKeyAsset";
  v26 = [v8 localIdentifier];

  v27 = v26;
  if (!v26)
  {
    v27 = [MEMORY[0x1E4F1CA98] null];
  }
  v49[8] = v27;
  v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v49 forKeys:v48 count:9];
  if (!v26) {

  }
  id v29 = v7;
  v30 = [v29 referenceAsset];
  v31 = v30;
  if (v30)
  {
    v32 = [v30 localIdentifier];
  }
  else
  {
    v32 = @"base";
  }

  v33 = [v29 referenceLocation];
  [v33 coordinate];
  if (v33)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", v34, v35);
    v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v36 = @"base";
  }

  v37 = [v29 referencePersonLocalIdentifiers];
  v38 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_compare_];
  v50[0] = v38;
  v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
  v40 = [v37 sortedArrayUsingDescriptors:v39];

  if ([v40 count])
  {
    v41 = [v40 componentsJoinedByString:@"_"];
  }
  else
  {
    v41 = @"base";
  }

  v42 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(complete == %d) AND \t\t\t\t\t\t\t  (focusOnPeople == %d) AND \t\t\t\t\t\t\t  (useSummarizer == %d) AND \t\t\t\t\t\t\t  (prefilterAssetsWithFaces == %d) AND \t\t\t\t\t\t\t  (referenceAsset == %@) AND \t\t\t\t\t\t\t  (referenceLocation == %@) AND \t\t\t\t\t\t\t  (referencePeople == %@) AND \t\t\t\t\t\t\t  (useContextualCurationOnly == %d)", objc_msgSend(v29, "complete"), objc_msgSend(v29, "focusOnPeople"), objc_msgSend(v29, "useSummarizer"), objc_msgSend(v29, "prefilterAssetsWithFaces"), v32, v36, v41, objc_msgSend(v29, "useContextualCurationOnly")];

  [(PGCurationCache *)self _setProperties:v28 forCurationObjectWithEntityName:@"CuratedKeyAsset" momentUUID:v45 predicate:v42];
}

- (id)_curatedKeyAssetIdentifierforMomentUUID:(id)a3 options:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v5 = a4;
  uint64_t v6 = [v5 referenceAsset];
  id v7 = v6;
  if (v6)
  {
    id v8 = [v6 localIdentifier];
  }
  else
  {
    id v8 = @"base";
  }

  id v9 = [v5 referenceLocation];
  [v9 coordinate];
  if (v9)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%f,%f", v10, v11);
    id v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v12 = @"base";
  }

  uint64_t v13 = [v5 referencePersonLocalIdentifiers];
  uint64_t v14 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:0 ascending:1 selector:sel_compare_];
  v32 = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
  id v16 = [v13 sortedArrayUsingDescriptors:v15];

  if ([v16 count])
  {
    id v17 = [v16 componentsJoinedByString:@"_"];
  }
  else
  {
    id v17 = @"base";
  }

  uint64_t v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(complete == %d) AND \t\t\t\t\t\t\t  (focusOnPeople == %d) AND \t\t\t\t\t\t\t  (useSummarizer == %d) AND \t\t\t\t\t\t\t  (prefilterAssetsWithFaces == %d) AND \t\t\t\t\t\t\t  (referenceAsset == %@) AND \t\t\t\t\t\t\t  (referenceLocation == %@) AND \t\t\t\t\t\t\t  (referencePeople == %@) AND \t\t\t\t\t\t\t  (useContextualCurationOnly == %d)", objc_msgSend(v5, "complete"), objc_msgSend(v5, "focusOnPeople"), objc_msgSend(v5, "useSummarizer"), objc_msgSend(v5, "prefilterAssetsWithFaces"), v8, v12, v17, objc_msgSend(v5, "useContextualCurationOnly")];

  id v19 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(moment.identifier == %@)", v28];
  uint64_t v20 = (void *)MEMORY[0x1E4F28BA0];
  v38[0] = v19;
  v38[1] = v18;
  id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
  id v22 = [v20 andPredicateWithSubpredicates:v21];

  v32 = 0;
  v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__5468;
  v36 = __Block_byref_object_dispose__5469;
  id v37 = 0;
  id v23 = [(CLSDBCache *)self managedObjectContext];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __67__PGCurationCache__curatedKeyAssetIdentifierforMomentUUID_options___block_invoke;
  v29[3] = &unk_1E68E54C8;
  v29[4] = self;
  id v24 = v22;
  id v30 = v24;
  v31 = &v32;
  [v23 performBlockAndWait:v29];

  id v25 = v33[5];
  _Block_object_dispose(&v32, 8);

  return v25;
}

void __67__PGCurationCache__curatedKeyAssetIdentifierforMomentUUID_options___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _fetchCurationObjectForEntityName:@"CuratedKeyAsset" predicate:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 valueForKey:@"curatedKeyAsset"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setCuratedAssets:(id)a3 forMomentUUID:(id)a4 options:(id)a5
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a4;
  uint64_t v10 = [a3 valueForKey:@"uuid"];
  uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:0];
  v16[0] = @"duration";
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "duration"));
  v16[1] = @"curatedAssets";
  v17[0] = v12;
  uint64_t v13 = v11;
  if (!v11)
  {
    uint64_t v13 = [MEMORY[0x1E4F1CA98] null];
  }
  v17[1] = v13;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  if (!v11) {

  }
  id v15 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"duration == %lld", objc_msgSend(v8, "duration"));
  [(PGCurationCache *)self _setProperties:v14 forCurationObjectWithEntityName:@"CuratedAssets" momentUUID:v9 predicate:v15];
}

- (id)_curatedAssetIdentifiersforMomentUUID:(id)a3 options:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v23 = 0;
  id v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__5468;
  v27 = __Block_byref_object_dispose__5469;
  id v28 = 0;
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"(moment.identifier == %@) AND (duration == %lld)", v6, objc_msgSend(v7, "duration")];
  id v9 = [(CLSDBCache *)self managedObjectContext];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__PGCurationCache__curatedAssetIdentifiersforMomentUUID_options___block_invoke;
  v20[3] = &unk_1E68E54C8;
  v20[4] = self;
  id v10 = v8;
  id v21 = v10;
  id v22 = &v23;
  [v9 performBlockAndWait:v20];

  if (v24[5])
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F28DC0];
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_msgSend(v12, "setWithObjects:", v13, objc_opt_class(), 0);
    uint64_t v15 = v24[5];
    id v19 = 0;
    id v16 = [v11 unarchivedObjectOfClasses:v14 fromData:v15 error:&v19];
    id v17 = v19;

    if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v17;
      _os_log_error_impl(&dword_1D1805000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving blobIdentifiers: %@", buf, 0xCu);
    }
  }
  else
  {
    id v16 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v16;
}

void __65__PGCurationCache__curatedAssetIdentifiersforMomentUUID_options___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) _fetchCurationObjectForEntityName:@"CuratedAssets" predicate:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 valueForKey:@"curatedAssets"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)curatedKeyAssetIdentifierForMoment:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 assetCollectionType] == 3)
  {
    id v8 = [v6 uuid];
    id v9 = [(PGCurationCache *)self _curatedKeyAssetIdentifierforMomentUUID:v8 options:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)curatedAssetIdentifiersForMoment:(id)a3 options:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 assetCollectionType] == 3)
  {
    id v8 = [v6 uuid];
    id v9 = [(PGCurationCache *)self _curatedAssetIdentifiersforMomentUUID:v8 options:v7];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)setCuratedAssets:(id)a3 forMoment:(id)a4 options:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 assetCollectionType] == 3)
  {
    id v10 = [v8 uuid];
    [(PGCurationCache *)self _setCuratedAssets:v11 forMomentUUID:v10 options:v9];
  }
}

- (void)setCuratedKeyAsset:(id)a3 forMoment:(id)a4 options:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 assetCollectionType] == 3)
  {
    id v10 = [v8 uuid];
    [(PGCurationCache *)self _setCuratedKeyAsset:v11 forMomentUUID:v10 options:v9];
  }
}

- (id)dataModelName
{
  return @"PGCurationCache";
}

@end