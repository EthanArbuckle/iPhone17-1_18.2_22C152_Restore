@interface NSManagedObject(IC)
+ (id)ic_existingObjectWithID:()IC context:;
+ (id)ic_objectIDsFromObjects:()IC;
+ (id)ic_objectsFromObjectIDs:()IC relationshipKeyPathsForPrefetching:context:;
+ (id)ic_permanentObjectIDsFromObjects:()IC;
+ (id)ic_resultsMatchingPredicate:()IC sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:;
+ (uint64_t)ic_containsFaultingManagedObjects:()IC;
+ (uint64_t)ic_objectIDsMatchingPredicate:()IC context:;
+ (uint64_t)ic_objectIDsMatchingPredicate:()IC sortDescriptors:context:;
+ (uint64_t)ic_objectIDsMatchingPredicate:()IC sortDescriptors:fetchLimit:context:;
+ (uint64_t)ic_objectsFromObjectIDs:()IC context:;
+ (uint64_t)ic_objectsMatchingPredicate:()IC context:;
+ (uint64_t)ic_objectsMatchingPredicate:()IC sortDescriptors:context:;
+ (uint64_t)ic_objectsMatchingPredicate:()IC sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:;
+ (void)ic_enumerateObjectsMatchingPredicate:()IC sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:;
- (id)ic_postNotificationOnMainThreadAfterSaveWithName:()IC;
- (uint64_t)ic_isTransitioning;
- (uint64_t)ic_obtainPermanentObjectIDIfNecessary;
- (uint64_t)ic_permanentObjectID;
- (void)ic_obtainPermanentObjectIDIfNecessary;
- (void)ic_postNotificationOnMainThreadWithName:()IC;
@end

@implementation NSManagedObject(IC)

+ (uint64_t)ic_objectsMatchingPredicate:()IC context:
{
  return objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:context:", a3, 0, a4);
}

+ (uint64_t)ic_objectsMatchingPredicate:()IC sortDescriptors:context:
{
  return objc_msgSend(a1, "ic_objectsMatchingPredicate:sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:", a3, a4, 0, 0, a5);
}

+ (id)ic_existingObjectWithID:()IC context:
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = objc_opt_class();
    id v15 = 0;
    v8 = [v6 existingObjectWithID:v5 error:&v15];
    v9 = v15;
    v10 = ICDynamicCast(v7, (uint64_t)v8);

    if (!v9) {
      goto LABEL_12;
    }
    uint64_t v11 = [v9 code];
    v12 = os_log_create("com.apple.notes", "CoreData");
    v13 = v12;
    if (v11 == 133000)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        +[NSManagedObject(IC) ic_existingObjectWithID:context:]((uint64_t)v5, v13);
      }
    }
    else if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v5;
      __int16 v18 = 2112;
      v19 = v9;
      _os_log_impl(&dword_20C263000, v13, OS_LOG_TYPE_DEFAULT, "Error finding object from objectID: %@, %@", buf, 0x16u);
    }
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      +[NSManagedObject(IC) ic_existingObjectWithID:context:](v13);
    }
    v10 = 0;
    v9 = v13;
  }

LABEL_12:
  return v10;
}

+ (uint64_t)ic_objectsMatchingPredicate:()IC sortDescriptors:relationshipKeyPathsForPrefetching:fetchLimit:context:
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:", a3, a4, 0, a5, a6, a7);
}

- (uint64_t)ic_permanentObjectID
{
  objc_msgSend(a1, "ic_obtainPermanentObjectIDIfNecessary");
  return [a1 objectID];
}

- (uint64_t)ic_obtainPermanentObjectIDIfNecessary
{
  v11[1] = *MEMORY[0x263EF8340];
  v2 = [a1 objectID];
  int v3 = [v2 isTemporaryID];

  if (!v3) {
    return 1;
  }
  v4 = [a1 managedObjectContext];
  v11[0] = a1;
  id v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v11 count:1];
  id v10 = 0;
  uint64_t v6 = [v4 obtainPermanentIDsForObjects:v5 error:&v10];
  id v7 = v10;

  if ((v6 & 1) == 0)
  {
    v8 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[NSManagedObject(IC) ic_obtainPermanentObjectIDIfNecessary]();
    }
  }
  return v6;
}

- (uint64_t)ic_isTransitioning
{
  if (([a1 _isDeallocating] & 1) != 0 || (objc_msgSend(a1, "faultingState") & 2) != 0) {
    return 1;
  }
  v2 = [a1 managedObjectContext];
  if ([v2 _isDeallocating])
  {
    BOOL v3 = 1;
  }
  else
  {
    v4 = [a1 managedObjectContext];
    id v5 = [v4 persistentStoreCoordinator];
    uint64_t v6 = [v5 persistentStores];
    BOOL v3 = [v6 count] == 0;
  }
  return v3;
}

+ (void)ic_enumerateObjectsMatchingPredicate:()IC sortDescriptors:relationshipKeyPathsForPrefetching:context:batchSize:saveAfterBatch:usingBlock:
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  __int16 v18 = a9;
  v19 = [a1 fetchRequest];
  v45 = v14;
  [v19 setPredicate:v14];
  [v19 setResultType:0];
  v44 = v15;
  [v19 setSortDescriptors:v15];
  v43 = v16;
  [v19 setRelationshipKeyPathsForPrefetching:v16];
  [v19 setReturnsObjectsAsFaults:1];
  [v19 setFetchBatchSize:a7];
  unsigned __int8 v56 = 0;
  id v55 = 0;
  v42 = v19;
  uint64_t v20 = [v17 executeFetchRequest:v19 error:&v55];
  id v40 = v55;
  uint64_t v21 = [v20 count];
  unint64_t v49 = v21;
  if (a7) {
    unint64_t v22 = a7;
  }
  else {
    unint64_t v22 = v21;
  }
  v41 = v20;
  v23 = [v20 objectEnumerator];
  unint64_t v24 = 0;
  if (v22 <= 1) {
    uint64_t v25 = 1;
  }
  else {
    uint64_t v25 = v22;
  }
  uint64_t v46 = v25;
  unint64_t v47 = v22;
  do
  {
    if (v24 >= v49) {
      break;
    }
    v26 = (void *)[objc_alloc(MEMORY[0x263EFF9C0]) initWithCapacity:v47];
    uint64_t v27 = v46;
    unint64_t v50 = v46 + v24;
    while (1)
    {
      v28 = (void *)MEMORY[0x210547E60]();
      v29 = [v23 nextObject];
      if (!v29) {
        break;
      }
      uint64_t v30 = objc_opt_class();
      v31 = ICCheckedDynamicCast(v30, (uint64_t)v29);
      if (v31)
      {
        if (v18) {
          v18[2](v18, v31, &v56);
        }
        [v26 addObject:v31];
      }
      int v32 = v56;

      if (v32) {
        goto LABEL_19;
      }
      ++v24;

      if (!--v27)
      {
        unint64_t v24 = v50;
        goto LABEL_20;
      }
    }
    unsigned __int8 v56 = 1;
LABEL_19:

LABEL_20:
    if (a8) {
      objc_msgSend(v17, "ic_save");
    }
    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v33 = v26;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v52 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (([v38 hasChanges] & 1) == 0) {
            [v17 refreshObject:v38 mergeChanges:0];
          }
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v35);
    }

    [v33 removeAllObjects];
    int v39 = v56;
  }
  while (!v39);
}

+ (id)ic_resultsMatchingPredicate:()IC sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v14 = a3;
  id v15 = a4;
  id v16 = a8;
  id v17 = a6;
  __int16 v18 = [a1 fetchRequest];
  [v18 setPredicate:v14];
  [v18 setResultType:a5];
  [v18 setSortDescriptors:v15];
  [v18 setRelationshipKeyPathsForPrefetching:v17];

  [v18 setFetchLimit:a7];
  id v26 = 0;
  v19 = [v16 executeFetchRequest:v18 error:&v26];
  id v20 = v26;
  if (v20)
  {
    uint64_t v21 = os_log_create("com.apple.notes", "CoreData");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
LABEL_3:

      goto LABEL_5;
    }
    uint64_t v25 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v28 = v25;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v20;
    id v24 = v25;
    _os_log_error_impl(&dword_20C263000, v21, OS_LOG_TYPE_ERROR, "Error fetching %@ (predicate=%@ sortDescriptors=%@): %@", buf, 0x2Au);
LABEL_11:

    goto LABEL_3;
  }
  if (!v19)
  {
    uint64_t v21 = os_log_create("com.apple.notes", "CoreData");
    if (!os_log_type_enabled(v21, OS_LOG_TYPE_INFO)) {
      goto LABEL_3;
    }
    v23 = objc_opt_class();
    *(_DWORD *)buf = 138413058;
    v28 = v23;
    __int16 v29 = 2112;
    id v30 = v14;
    __int16 v31 = 2112;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    id v24 = v23;
    _os_log_impl(&dword_20C263000, v21, OS_LOG_TYPE_INFO, "Nil objects array fetching %@ (predicate=%@ sortDescriptors=%@ context=%@)", buf, 0x2Au);
    goto LABEL_11;
  }
LABEL_5:

  return v19;
}

+ (uint64_t)ic_containsFaultingManagedObjects:()IC
{
  return objc_msgSend(a3, "ic_containsObjectPassingTest:", &__block_literal_global_25);
}

+ (id)ic_objectsFromObjectIDs:()IC relationshipKeyPathsForPrefetching:context:
{
  id v8 = a3;
  v9 = (void *)MEMORY[0x263EFF260];
  id v10 = a5;
  id v11 = a4;
  v12 = [a1 entity];
  v13 = [v12 name];
  id v14 = [v9 fetchRequestWithEntityName:v13];

  [v14 setIncludesSubentities:1];
  id v15 = [MEMORY[0x263F08A98] predicateWithFormat:@"SELF in %@", v8];
  [v14 setPredicate:v15];

  [v14 setRelationshipKeyPathsForPrefetching:v11];
  id v20 = 0;
  id v16 = [v10 executeFetchRequest:v14 error:&v20];

  id v17 = v20;
  if (v17)
  {
    __int16 v18 = os_log_create("com.apple.notes", "CoreData");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      +[NSManagedObject(IC) ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:](v8);
    }
  }
  return v16;
}

+ (uint64_t)ic_objectsFromObjectIDs:()IC context:
{
  return objc_msgSend(a1, "ic_objectsFromObjectIDs:relationshipKeyPathsForPrefetching:context:", a3, 0, a4);
}

+ (id)ic_objectIDsFromObjects:()IC
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263EFF980] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "objectID", (void)v12);
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)ic_permanentObjectIDsFromObjects:()IC
{
  id v4 = a3;
  id v5 = [v4 firstObject];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "ic_objectsPassingTest:", &__block_literal_global_10_2);
    uint64_t v7 = [v5 managedObjectContext];
    id v13 = 0;
    char v8 = [v7 obtainPermanentIDsForObjects:v6 error:&v13];
    id v9 = v13;

    if ((v8 & 1) == 0)
    {
      id v10 = os_log_create("com.apple.notes", "CoreData");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[NSManagedObject(IC) ic_permanentObjectIDsFromObjects:]((uint64_t)v9, v10);
      }
    }
  }
  id v11 = objc_msgSend(a1, "ic_objectIDsFromObjects:", v4);

  return v11;
}

- (void)ic_postNotificationOnMainThreadWithName:()IC
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  long long v14 = __Block_byref_object_copy__8;
  long long v15 = __Block_byref_object_dispose__8;
  id v16 = 0;
  id v5 = [a1 managedObjectContext];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke;
  v9[3] = &unk_2640CE168;
  objc_copyWeak(&v10, &location);
  v9[4] = &v11;
  [v5 performBlockAndWait:v9];

  if (v12[5])
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__NSManagedObject_IC__ic_postNotificationOnMainThreadWithName___block_invoke_2;
    block[3] = &unk_2640CE190;
    id v7 = v4;
    char v8 = &v11;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  objc_destroyWeak(&v10);
  _Block_object_dispose(&v11, 8);

  objc_destroyWeak(&location);
}

- (id)ic_postNotificationOnMainThreadAfterSaveWithName:()IC
{
  id v4 = a3;
  objc_initWeak(&location, a1);
  uint64_t v16 = 0;
  uint64_t v17 = (id *)&v16;
  uint64_t v18 = 0x3042000000;
  v19 = __Block_byref_object_copy__14;
  id v20 = __Block_byref_object_dispose__15;
  id v21 = 0;
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v6 = [a1 managedObjectContext];
  uint64_t v7 = *MEMORY[0x263EFF048];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __72__NSManagedObject_IC__ic_postNotificationOnMainThreadAfterSaveWithName___block_invoke;
  v12[3] = &unk_2640CE1B8;
  objc_copyWeak(&v15, &location);
  id v8 = v4;
  id v13 = v8;
  long long v14 = &v16;
  id v9 = [v5 addObserverForName:v7 object:v6 queue:0 usingBlock:v12];
  objc_storeWeak(v17 + 5, v9);

  id WeakRetained = objc_loadWeakRetained(v17 + 5);
  _Block_object_dispose(&v16, 8);
  objc_destroyWeak(&v21);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return WeakRetained;
}

+ (uint64_t)ic_objectIDsMatchingPredicate:()IC sortDescriptors:context:
{
  return objc_msgSend(a1, "ic_objectIDsMatchingPredicate:sortDescriptors:fetchLimit:context:", a3, a4, 0, a5);
}

+ (uint64_t)ic_objectIDsMatchingPredicate:()IC sortDescriptors:fetchLimit:context:
{
  return objc_msgSend(a1, "ic_resultsMatchingPredicate:sortDescriptors:resultType:relationshipKeyPathsForPrefetching:fetchLimit:context:", a3, a4, 1, 0, a5, a6);
}

+ (uint64_t)ic_objectIDsMatchingPredicate:()IC context:
{
  return objc_msgSend(a1, "ic_objectIDsMatchingPredicate:sortDescriptors:context:", a3, 0, a4);
}

+ (void)ic_existingObjectWithID:()IC context:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2 = [MEMORY[0x263F08B88] callStackSymbols];
  int v3 = 138412290;
  id v4 = v2;
  _os_log_debug_impl(&dword_20C263000, a1, OS_LOG_TYPE_DEBUG, "Trying to get an object from a nil object ID: %@", (uint8_t *)&v3, 0xCu);
}

+ (void)ic_existingObjectWithID:()IC context:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_20C263000, a2, OS_LOG_TYPE_DEBUG, "Unable to find object from objectID: %@", (uint8_t *)&v2, 0xCu);
}

+ (void)ic_objectsFromObjectIDs:()IC relationshipKeyPathsForPrefetching:context:.cold.1(void *a1)
{
  [a1 count];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_1_1(&dword_20C263000, v1, v2, "Error fetching objects from (%ld) object IDs: %@", v3, v4, v5, v6, v7);
}

+ (void)ic_permanentObjectIDsFromObjects:()IC .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_20C263000, a2, OS_LOG_TYPE_ERROR, "Error obtaining permanent object ID for objects with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)ic_obtainPermanentObjectIDIfNecessary
{
  objc_opt_class();
  OUTLINED_FUNCTION_4_0();
  id v1 = v0;
  OUTLINED_FUNCTION_1_1(&dword_20C263000, v2, v3, "Error obtaining permanent object ID for %@: %@", v4, v5, v6, v7, v8);
}

@end