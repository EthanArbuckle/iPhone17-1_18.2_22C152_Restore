@interface PLLibraryScopeRuleManager
- (BOOL)_shouldTryToPropagateResultsToMomentWithInclusiveMatchedConditions:(id)a3;
- (BOOL)evaluateAssetObjectIDs:(id)a3 simulate:(BOOL)a4 predicateToFetchAssetsToEvaluate:(id)a5 withResultEnumerationBlock:(id)a6;
- (BOOL)evaluateAssetObjectIDs:(id)a3 simulate:(BOOL)a4 withResultEnumerationBlock:(id)a5;
- (BOOL)evaluateAssetObjectIDs:(id)a3 withResultEnumerationBlock:(id)a4;
- (BOOL)evaluateFaceObjectIDs:(id)a3 simulate:(BOOL)a4 withResultEnumerationBlock:(id)a5;
- (BOOL)evaluateFaceObjectIDs:(id)a3 withResultEnumerationBlock:(id)a4;
- (PLLibraryScope)libraryScope;
- (PLLibraryScopeRuleEvaluator)ruleEvaluator;
- (PLLibraryScopeRuleManager)initWithLibraryScope:(id)a3;
- (PLManagedAssetRuleInterpreter)interpreter;
- (id)_fetchAssetObjectIDsContainedInMomentObjectIDs:(id)a3 excludingAssetObjectIDs:(id)a4 inManagedObjectContext:(id)a5 predicateToFetchAssetsToEvaluate:(id)a6;
- (id)_fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId:(id)a3 inManagedObjectContext:(id)a4;
- (id)_personUUIDsUsedInRules;
- (id)_predicateToIncludeAssetsCapturedByCamera;
- (id)_predicateToIncludeAssetsSuggestedByCamera;
- (void)setInterpreter:(id)a3;
- (void)setLibraryScope:(id)a3;
- (void)setRuleEvaluator:(id)a3;
@end

@implementation PLLibraryScopeRuleManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interpreter, 0);
  objc_storeStrong((id *)&self->_ruleEvaluator, 0);
  objc_storeStrong((id *)&self->_libraryScope, 0);
}

- (void)setInterpreter:(id)a3
{
}

- (PLManagedAssetRuleInterpreter)interpreter
{
  return self->_interpreter;
}

- (void)setRuleEvaluator:(id)a3
{
}

- (PLLibraryScopeRuleEvaluator)ruleEvaluator
{
  return self->_ruleEvaluator;
}

- (void)setLibraryScope:(id)a3
{
}

- (PLLibraryScope)libraryScope
{
  return self->_libraryScope;
}

- (id)_predicateToIncludeAssetsCapturedByCamera
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d OR %K = %d", @"additionalAttributes.importedBy", 1, @"additionalAttributes.importedBy", 2);
}

- (id)_predicateToIncludeAssetsSuggestedByCamera
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND (%K & %i) != 0", @"activeLibraryScopeParticipationState", 1, @"libraryScopeShareState", 12, 12);
}

- (BOOL)_shouldTryToPropagateResultsToMomentWithInclusiveMatchedConditions:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "type", (void)v8) == 2)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (id)_fetchAssetObjectIDsContainedInMomentObjectIDs:(id)a3 excludingAssetObjectIDs:(id)a4 inManagedObjectContext:(id)a5 predicateToFetchAssetsToEvaluate:(id)a6
{
  v30[3] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  long long v11 = (void *)MEMORY[0x1E4F1C0D0];
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  v15 = +[PLManagedAsset entityName];
  v16 = [v11 fetchRequestWithEntityName:v15];

  [v16 setResultType:1];
  v17 = (void *)MEMORY[0x1E4F28BA0];
  v18 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@ AND NOT self IN %@", @"moment", v14, v13];

  v30[0] = v18;
  v30[1] = v10;
  v19 = [(PLLibraryScopeRuleManager *)self _predicateToIncludeAssetsCapturedByCamera];
  v30[2] = v19;
  v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:3];
  v21 = [v17 andPredicateWithSubpredicates:v20];
  [v16 setPredicate:v21];

  id v27 = 0;
  v22 = [v12 executeFetchRequest:v16 error:&v27];

  id v23 = v27;
  if (v22)
  {
    v24 = [MEMORY[0x1E4F1CAD0] setWithArray:v22];
  }
  else
  {
    v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v23;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Unable to fetch assetObjectIDs contained in momentObjectIDs: %@", buf, 0xCu);
    }

    v24 = 0;
  }

  return v24;
}

- (id)_fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId:(id)a3 inManagedObjectContext:(id)a4
{
  v50[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E4F1C0D0];
  id v40 = a4;
  v7 = +[PLManagedAsset entityName];
  long long v8 = [v6 fetchRequestWithEntityName:v7];

  long long v9 = (void *)MEMORY[0x1E4F28BA0];
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"activeLibraryScopeParticipationState", 1);
  v49[0] = v10;
  long long v11 = +[PLManagedAsset predicateToIncludeSharedLibrarySharingSuggestionsAssets];
  v49[1] = v11;
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:2];
  id v13 = [v9 orPredicateWithSubpredicates:v12];
  v50[0] = v13;
  id v14 = (void *)MEMORY[0x1E4F28F60];
  v41 = v5;
  v15 = [v5 allValues];
  v16 = [v14 predicateWithFormat:@"moment in %@", v15];
  v50[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  v18 = [v9 andPredicateWithSubpredicates:v17];
  [v8 setPredicate:v18];

  v19 = v8;
  [v8 setRelationshipKeyPathsForPrefetching:&unk_1EEBF1C40];
  id v45 = 0;
  v20 = [v40 executeFetchRequest:v8 error:&v45];

  id v21 = v45;
  if (v20)
  {
    if ([v20 count])
    {
      v22 = (void *)MEMORY[0x1E4F28BA0];
      id v23 = [(PLLibraryScopeRuleManager *)self _predicateToIncludeAssetsSuggestedByCamera];
      v46[0] = v23;
      v24 = PLManagedAssetPredicateToFetchAssetsSuggestedForSharing();
      v46[1] = v24;
      v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
      v26 = [v22 orPredicateWithSubpredicates:v25];

      id v27 = objc_alloc(MEMORY[0x1E4F1CA80]);
      v28 = [v20 filteredArrayUsingPredicate:v26];
      id v29 = objc_msgSend(v28, "_pl_map:", &__block_literal_global_76_31533);
      v30 = (void *)[v27 initWithArray:v29];

      v31 = [MEMORY[0x1E4F1CA80] set];
      v42[0] = MEMORY[0x1E4F143A8];
      v42[1] = 3221225472;
      v42[2] = __122__PLLibraryScopeRuleManager__fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId_inManagedObjectContext___block_invoke_2;
      v42[3] = &unk_1E58685E0;
      id v43 = v30;
      id v32 = v31;
      id v44 = v32;
      id v33 = v30;
      v34 = v41;
      [v41 enumerateKeysAndObjectsUsingBlock:v42];
      v35 = v44;
      id v36 = v32;

      goto LABEL_9;
    }
    id v36 = [MEMORY[0x1E4F1CAD0] set];
  }
  else
  {
    v37 = PLBackendGetLog();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v48 = v21;
      _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Failed to fetch assets to validate: %@", buf, 0xCu);
    }

    id v36 = 0;
  }
  v34 = v41;
LABEL_9:

  return v36;
}

void __122__PLLibraryScopeRuleManager__fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId_inManagedObjectContext___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) containsObject:a3]) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

id __122__PLLibraryScopeRuleManager__fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  v2 = [a2 moment];
  id v3 = [v2 objectID];

  return v3;
}

- (id)_personUUIDsUsedInRules
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = [(PLLibraryScopeRuleManager *)self ruleEvaluator];
  id v5 = [v4 rules];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v14 + 1) + 8 * i) personCondition];
        long long v11 = v10;
        if (v10)
        {
          id v12 = [v10 personUUIDs];
          [v3 addObjectsFromArray:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v3;
}

- (BOOL)evaluateFaceObjectIDs:(id)a3 simulate:(BOOL)a4 withResultEnumerationBlock:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(PLLibraryScopeRuleManager *)self _personUUIDsUsedInRules];
  BOOL v11 = 1;
  if ([v10 count])
  {
    uint64_t v26 = 0;
    id v27 = &v26;
    uint64_t v28 = 0x3032000000;
    id v29 = __Block_byref_object_copy__31543;
    v30 = __Block_byref_object_dispose__31544;
    id v31 = 0;
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 1;
    id v12 = [(PLLibraryScopeRuleManager *)self libraryScope];
    id v13 = [v12 photoLibrary];

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __87__PLLibraryScopeRuleManager_evaluateFaceObjectIDs_simulate_withResultEnumerationBlock___block_invoke;
    v16[3] = &unk_1E586C518;
    id v14 = v13;
    id v17 = v14;
    id v18 = v8;
    id v19 = v10;
    v20 = &v22;
    id v21 = &v26;
    [v14 performBlockAndWait:v16];
    if ([(id)v27[5] count]) {
      BOOL v11 = [(PLLibraryScopeRuleManager *)self evaluateAssetObjectIDs:v27[5] simulate:v6 withResultEnumerationBlock:v9];
    }
    else {
      BOOL v11 = *((unsigned char *)v23 + 24) != 0;
    }

    _Block_object_dispose(&v22, 8);
    _Block_object_dispose(&v26, 8);
  }
  return v11;
}

void __87__PLLibraryScopeRuleManager_evaluateFaceObjectIDs_simulate_withResultEnumerationBlock___block_invoke(uint64_t a1)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v3 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v4 = +[PLDetectedFace entityName];
  id v5 = [v3 fetchRequestWithEntityName:v4];

  [v5 setResultType:1];
  BOOL v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@ AND %K IN %@", *(void *)(a1 + 40), @"personForFace.personUUID", *(void *)(a1 + 48)];
  [v5 setPredicate:v6];

  id v20 = 0;
  uint64_t v7 = [v2 executeFetchRequest:v5 error:&v20];
  id v8 = v20;
  if (v7)
  {
    if ([v7 count])
    {
      id v9 = (void *)MEMORY[0x1E4F1C0D0];
      id v10 = +[PLManagedAsset entityName];
      BOOL v11 = [v9 fetchRequestWithEntityName:v10];

      [v11 setResultType:1];
      id v12 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@", @"detectedFaces", v7];
      [v11 setPredicate:v12];

      id v19 = v8;
      uint64_t v13 = [v2 executeFetchRequest:v11 error:&v19];
      id v14 = v19;

      uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
      long long v16 = *(void **)(v15 + 40);
      *(void *)(v15 + 40) = v13;

      if (!*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
      {
        id v17 = PLBackendGetLog();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          id v22 = v14;
          _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Unable to fetch assetObjectIDs containing in faces: %@", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
      }

      id v8 = v14;
    }
  }
  else
  {
    id v18 = PLBackendGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Unable to fetch assetObjectIDs containing in faces: %@", buf, 0xCu);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 0;
  }
}

- (BOOL)evaluateFaceObjectIDs:(id)a3 withResultEnumerationBlock:(id)a4
{
  return [(PLLibraryScopeRuleManager *)self evaluateFaceObjectIDs:a3 simulate:0 withResultEnumerationBlock:a4];
}

- (BOOL)evaluateAssetObjectIDs:(id)a3 simulate:(BOOL)a4 predicateToFetchAssetsToEvaluate:(id)a5 withResultEnumerationBlock:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [v10 count];
  if (v13)
  {
    uint64_t v14 = v13;
    *(void *)buf = 0;
    id v31 = buf;
    uint64_t v32 = 0x2020000000;
    char v33 = 1;
    uint64_t v15 = [(PLLibraryScopeRuleManager *)self libraryScope];
    long long v16 = [v15 photoLibrary];

    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke;
    v21[3] = &unk_1E5868598;
    id v17 = v16;
    id v22 = v17;
    uint64_t v28 = v14;
    id v23 = v10;
    uint64_t v24 = self;
    id v25 = v11;
    BOOL v29 = a4;
    id v26 = v12;
    id v27 = buf;
    [v17 performTransactionAndWait:v21];
    BOOL v18 = v31[24] != 0;

    _Block_object_dispose(buf, 8);
  }
  else
  {
    id v19 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Evaluation called on an empty array of assets.", buf, 2u);
    }

    BOOL v18 = 0;
  }

  return v18;
}

void __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke(uint64_t a1)
{
  v129[2] = *MEMORY[0x1E4F143B8];
  v96 = [*(id *)(a1 + 32) managedObjectContext];
  v87 = [MEMORY[0x1E4F1CA80] set];
  v85 = [MEMORY[0x1E4F1CA80] set];
  v84 = [MEMORY[0x1E4F1CA80] set];
  if (*(void *)(a1 + 80))
  {
    unint64_t v2 = 0;
    v83 = v113;
    do
    {
      uint64_t v90 = MEMORY[0x19F38D3B0]();
      if (*(void *)(a1 + 80) - v2 >= 0x3E8) {
        uint64_t v3 = 1000;
      }
      else {
        uint64_t v3 = *(void *)(a1 + 80) - v2;
      }
      uint64_t v86 = v3;
      uint64_t v4 = [*(id *)(a1 + 40) subarrayWithRange:v2];
      v95 = [MEMORY[0x1E4F1CA80] set];
      v97 = [MEMORY[0x1E4F1CA80] set];
      uint64_t v88 = MEMORY[0x19F38D3B0]();
      id v5 = (void *)MEMORY[0x1E4F28BA0];
      BOOL v6 = [*(id *)(a1 + 48) _predicateToIncludeAssetsCapturedByCamera];
      v129[0] = v6;
      uint64_t v7 = (void *)MEMORY[0x1E4F28BA0];
      id v8 = *(void **)(a1 + 48);
      v128[0] = *(void *)(a1 + 56);
      id v9 = [v8 _predicateToIncludeAssetsSuggestedByCamera];
      v128[1] = v9;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v128 count:2];
      id v11 = [v7 orPredicateWithSubpredicates:v10];
      v129[1] = v11;
      id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v129 count:2];
      uint64_t v13 = v5;
      uint64_t v14 = (void *)v4;
      uint64_t v15 = [v13 andPredicateWithSubpredicates:v12];

      id v119 = 0;
      long long v16 = +[PLMoment batchFetchMomentObjectIDsByAssetObjectIDsWithAssetObjectIDs:v14 andAssetPredicate:v15 inManagedObjectContext:v96 error:&v119];
      id v17 = v119;
      v94 = v16;
      if (v16)
      {
        if (![v16 count])
        {
          uint64_t v28 = (void *)v88;
          goto LABEL_23;
        }
        BOOL v18 = [*(id *)(a1 + 48) _fetchAssetObjectIDsContainedInMomentsToPropagateForMomentIdByAssetId:v16 inManagedObjectContext:v96];
        if ([v18 count])
        {
          if (*(void *)(a1 + 64))
          {
            v92 = v14;
            long long v117 = 0u;
            long long v118 = 0u;
            long long v115 = 0u;
            long long v116 = 0u;
            id v19 = v18;
            uint64_t v20 = [v19 countByEnumeratingWithState:&v115 objects:v127 count:16];
            if (v20)
            {
              uint64_t v21 = v20;
              uint64_t v22 = *(void *)v116;
              do
              {
                for (uint64_t i = 0; i != v21; ++i)
                {
                  if (*(void *)v116 != v22) {
                    objc_enumerationMutation(v19);
                  }
                  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
                }
                uint64_t v21 = [v19 countByEnumeratingWithState:&v115 objects:v127 count:16];
              }
              while (v21);
            }

            uint64_t v14 = v92;
          }
          uint64_t v24 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"NOT self IN %@", v18, v83];
          uint64_t v25 = [v14 filteredArrayUsingPredicate:v24];

          [v87 unionSet:v18];
          id v26 = [v18 allObjects];
          v112[0] = MEMORY[0x1E4F143A8];
          v112[1] = 3221225472;
          v113[0] = __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_35;
          v113[1] = &unk_1E5868548;
          id v114 = v94;
          id v27 = objc_msgSend(v26, "_pl_map:", v112);
          [v95 addObjectsFromArray:v27];

          [v97 unionSet:v18];
          uint64_t v14 = (void *)v25;
        }
      }
      else
      {
        BOOL v18 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = (uint64_t)v17;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Failed to fetch moments with error: %@", buf, 0xCu);
        }
      }
      uint64_t v28 = (void *)v88;

LABEL_23:
      v93 = v14;
      BOOL v29 = (void *)[v14 mutableCopy];
      v30 = [v87 allObjects];
      [v29 removeObjectsInArray:v30];

      id v31 = (void *)MEMORY[0x1E4F1C0D0];
      uint64_t v32 = +[PLManagedAsset entityName];
      char v33 = [v31 fetchRequestWithEntityName:v32];

      v34 = (void *)MEMORY[0x1E4F28BA0];
      v89 = v29;
      v35 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v29];
      v126[0] = v35;
      id v36 = [*(id *)(a1 + 48) _predicateToIncludeAssetsCapturedByCamera];
      uint64_t v37 = *(void *)(a1 + 56);
      v126[1] = v36;
      v126[2] = v37;
      v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v126 count:3];
      v39 = [v34 andPredicateWithSubpredicates:v38];
      [v33 setPredicate:v39];

      id v111 = v17;
      id v40 = [v96 executeFetchRequest:v33 error:&v111];
      id v41 = v111;

      if ([v40 count])
      {
        v42 = [*(id *)(a1 + 48) ruleEvaluator];
        id v43 = [MEMORY[0x1E4F1CAD0] setWithArray:v40];
        v102[0] = MEMORY[0x1E4F143A8];
        v102[1] = 3221225472;
        v102[2] = __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_43;
        v102[3] = &unk_1E5868570;
        v110 = *(id *)(a1 + 64);
        id v44 = v87;
        uint64_t v45 = *(void *)(a1 + 48);
        id v103 = v44;
        uint64_t v104 = v45;
        id v105 = v94;
        v46 = v95;
        id v106 = v95;
        id v107 = v97;
        id v108 = v85;
        id v109 = v84;
        id v47 = (id)[v42 evaluateObjects:v43 withResultEnumerationBlock:v102];

        id v48 = v110;
      }
      else
      {
        id v48 = PLBackendSharingGetLog();
        v46 = v95;
        if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
        {
          uint64_t v49 = *(void *)(a1 + 40);
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = v49;
          _os_log_impl(&dword_19B3C7000, v48, OS_LOG_TYPE_INFO, "No assets available for this batch: %@", buf, 0xCu);
        }
      }
      v50 = (void *)v90;

      if ([v46 count])
      {
        v91 = v33;
        v51 = v50;
        id v52 = v41;
        v53 = [*(id *)(a1 + 48) _fetchAssetObjectIDsContainedInMomentObjectIDs:v46 excludingAssetObjectIDs:v97 inManagedObjectContext:v96 predicateToFetchAssetsToEvaluate:*(void *)(a1 + 56)];
        v54 = v53;
        if (*(void *)(a1 + 64))
        {
          long long v100 = 0u;
          long long v101 = 0u;
          long long v98 = 0u;
          long long v99 = 0u;
          uint64_t v55 = [v53 countByEnumeratingWithState:&v98 objects:v125 count:16];
          if (v55)
          {
            uint64_t v56 = v55;
            uint64_t v57 = *(void *)v99;
            do
            {
              for (uint64_t j = 0; j != v56; ++j)
              {
                if (*(void *)v99 != v57) {
                  objc_enumerationMutation(v54);
                }
                (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
              }
              uint64_t v56 = [v54 countByEnumeratingWithState:&v98 objects:v125 count:16];
            }
            while (v56);
          }
        }
        [v87 unionSet:v54];

        v46 = v95;
        id v41 = v52;
        v50 = v51;
        char v33 = v91;
      }
      v59 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        v60 = *(void **)(a1 + 80);
        *(_DWORD *)buf = 134218240;
        uint64_t v122 = v86 + v2;
        __int16 v123 = 2048;
        v124 = v60;
        _os_log_impl(&dword_19B3C7000, v59, OS_LOG_TYPE_INFO, "Evaluated %lu assets out of %lu\n", buf, 0x16u);
      }

      v2 += 1000;
    }
    while (v2 < *(void *)(a1 + 80));
  }
  v61 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
  {
    uint64_t v62 = [v87 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v122 = v62;
    _os_log_impl(&dword_19B3C7000, v61, OS_LOG_TYPE_INFO, "\t%lu assets matched inclusive rule(s).\n", buf, 0xCu);
  }

  v63 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
  {
    uint64_t v64 = [v85 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v122 = v64;
    _os_log_impl(&dword_19B3C7000, v63, OS_LOG_TYPE_INFO, "\t%lu assets matched exclusive rule(s).\n", buf, 0xCu);
  }

  v65 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
  {
    uint64_t v66 = [v84 count];
    *(_DWORD *)buf = 134217984;
    uint64_t v122 = v66;
    _os_log_impl(&dword_19B3C7000, v65, OS_LOG_TYPE_INFO, "\t%lu assets did not match any rule(s).\n", buf, 0xCu);
  }

  uint64_t v67 = [v87 count];
  if (!*(unsigned char *)(a1 + 88))
  {
    uint64_t v68 = v67;
    if (v67)
    {
      v69 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        v70 = [*(id *)(a1 + 48) libraryScope];
        *(_DWORD *)buf = 134218242;
        uint64_t v122 = v68;
        __int16 v123 = 2112;
        v124 = v70;
        _os_log_impl(&dword_19B3C7000, v69, OS_LOG_TYPE_INFO, "Contributing %lu assets to library scope %@.", buf, 0x16u);
      }
      v71 = (void *)MEMORY[0x1E4F1C0D0];
      v72 = +[PLManagedAsset entityName];
      v73 = [v71 fetchRequestWithEntityName:v72];

      v74 = (void *)MEMORY[0x1E4F28BA0];
      v75 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v87];
      v76 = *(void **)(a1 + 48);
      uint64_t v77 = *(void *)(a1 + 56);
      v120[0] = v75;
      v120[1] = v77;
      v78 = [v76 _predicateToIncludeAssetsCapturedByCamera];
      v120[2] = v78;
      v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v120 count:3];
      v80 = [v74 andPredicateWithSubpredicates:v79];
      [v73 setPredicate:v80];

      v81 = [v96 enumerateObjectsFromFetchRequest:v73 count:0 usingDefaultBatchSizeWithBlock:&__block_literal_global_31572];
      if (v81)
      {
        v82 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v122 = (uint64_t)v81;
          _os_log_impl(&dword_19B3C7000, v82, OS_LOG_TYPE_ERROR, "Failed to fetch moments with error: %@", buf, 0xCu);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 0;
      }
    }
  }
}

uint64_t __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_35(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
}

void __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_43(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a4;
  id v9 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v10 = [v7 uuid];
    int v17 = 138412546;
    BOOL v18 = v10;
    __int16 v19 = 2112;
    id v20 = v8;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Asset %@ have been matched with %@.", (uint8_t *)&v17, 0x16u);
  }
  uint64_t v11 = *(void *)(a1 + 88);
  if (v11)
  {
    id v12 = [v7 objectID];
    (*(void (**)(uint64_t, void *, uint64_t, id))(v11 + 16))(v11, v12, a3, v8);
  }
  uint64_t v13 = [v7 objectID];
  switch(a3)
  {
    case 0:
      uint64_t v15 = *(void **)(a1 + 80);
LABEL_13:
      [v15 addObject:v13];
      break;
    case 2:
      uint64_t v15 = *(void **)(a1 + 72);
      goto LABEL_13;
    case 1:
      [*(id *)(a1 + 32) addObject:v13];
      if ([*(id *)(a1 + 40) _shouldTryToPropagateResultsToMomentWithInclusiveMatchedConditions:v8])
      {
        uint64_t v14 = [*(id *)(a1 + 48) objectForKeyedSubscript:v13];
        if (v14)
        {
          [*(id *)(a1 + 56) addObject:v14];
          [*(id *)(a1 + 64) addObject:v13];
        }
        else
        {
          long long v16 = PLBackendSharingGetLog();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            int v17 = 138412290;
            BOOL v18 = v13;
            _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Couldn't find moment for asset objectID: %@", (uint8_t *)&v17, 0xCu);
          }
        }
      }
      break;
  }
}

void __121__PLLibraryScopeRuleManager_evaluateAssetObjectIDs_simulate_predicateToFetchAssetsToEvaluate_withResultEnumerationBlock___block_invoke_45(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (!+[PLSceneClassification isUtilityAssetForSharedLibrary:](PLSceneClassification, "isUtilityAssetForSharedLibrary:"))
  {
    PLLibraryScopeAssetRemoveSuggestedByClientType(v4);
    id v2 = v4;
    objc_msgSend(v2, "setLibraryScopeShareState:", objc_msgSend(v2, "libraryScopeShareState") & 0xFFFFFFFFFF7FFFFFLL);

    id v3 = v2;
    objc_msgSend(v3, "setLibraryScopeShareState:", objc_msgSend(v3, "libraryScopeShareState") | 2);
  }
}

- (BOOL)evaluateAssetObjectIDs:(id)a3 simulate:(BOOL)a4 withResultEnumerationBlock:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d AND (%K == %i OR %K == %i)", @"activeLibraryScopeParticipationState", 0, @"libraryScopeShareState", 0, @"libraryScopeShareState", 0x10000);
  LOBYTE(v5) = [(PLLibraryScopeRuleManager *)self evaluateAssetObjectIDs:v9 simulate:v5 predicateToFetchAssetsToEvaluate:v10 withResultEnumerationBlock:v8];

  return v5;
}

- (BOOL)evaluateAssetObjectIDs:(id)a3 withResultEnumerationBlock:(id)a4
{
  return [(PLLibraryScopeRuleManager *)self evaluateAssetObjectIDs:a3 simulate:0 withResultEnumerationBlock:a4];
}

- (PLLibraryScopeRuleManager)initWithLibraryScope:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)PLLibraryScopeRuleManager;
  BOOL v5 = [(PLLibraryScopeRuleManager *)&v14 init];
  BOOL v6 = v5;
  if (v5)
  {
    [(PLLibraryScopeRuleManager *)v5 setLibraryScope:v4];
    id v7 = [v4 rulesData];
    id v8 = +[PLLibraryScopeRule libraryScopeRulesForLibraryScopeRulesData:v7];

    if ([v8 count])
    {
      id v9 = objc_alloc_init(PLManagedAssetRuleInterpreter);
      [(PLLibraryScopeRuleManager *)v6 setInterpreter:v9];

      id v10 = [PLLibraryScopeRuleEvaluator alloc];
      uint64_t v11 = [(PLLibraryScopeRuleManager *)v6 interpreter];
      id v12 = [(PLLibraryScopeRuleEvaluator *)v10 initWithRules:v8 andInterpreter:v11];
      [(PLLibraryScopeRuleManager *)v6 setRuleEvaluator:v12];
    }
    else
    {
      uint64_t v11 = PLBackendSharingGetLog();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
LABEL_7:

        goto LABEL_8;
      }
      id v12 = [(PLLibraryScopeRuleManager *)v6 libraryScope];
      *(_DWORD *)buf = 138412290;
      long long v16 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Library scope %@ do not contain any rules.", buf, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_8:

  return v6;
}

@end