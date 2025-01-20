@interface PLBackgroundJobSharedAssetContainerUpdateWorker
+ (BOOL)_isTokenInvalidError:(id)a3;
+ (BOOL)_updateSharingCompositionForMemoriesContainingAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (BOOL)_updateSharingCompositionForSuggestionsContainingAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (BOOL)performWorkOnAllItemsInContext:(id)a3 withError:(id *)a4;
+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3;
+ (id)_lastProcessingTokenFromLibrary:(id)a3;
+ (id)_memoriesContainingAssetIds:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_suggestionsContainingAssetIds:(id)a3 inContext:(id)a4 error:(id *)a5;
+ (id)_transactionIteratorSinceTokenIfValid:(id)a3 library:(id)a4 error:(id *)a5;
+ (void)_setLastProcessingToken:(id)a3 library:(id)a4;
- (id)workItemsNeedingProcessingInLibrary:(id)a3;
- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5;
@end

@implementation PLBackgroundJobSharedAssetContainerUpdateWorker

+ (BOOL)performWorkOnAllItemsInContext:(id)a3 withError:(id *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!v7)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, a1, @"PLBackgroundJobSharedAssetContainerUpdateWorker.m", 300, @"Invalid parameter not satisfying: %@", @"context" object file lineNumber description];
  }
  id v22 = 0;
  char v8 = [(id)objc_opt_class() _updateSharingCompositionForMemoriesContainingAssetIDs:0 inContext:v7 error:&v22];
  id v9 = v22;
  if ((v8 & 1) == 0)
  {
    v17 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v9;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Memories with error: %@, not advancing token.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  id v21 = v9;
  char v10 = [(id)objc_opt_class() _updateSharingCompositionForSuggestionsContainingAssetIDs:0 inContext:v7 error:&v21];
  id v11 = v21;

  if ((v10 & 1) == 0)
  {
    v17 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v11;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Suggestions with error: %@, not advancing token.", buf, 0xCu);
    }
    id v9 = v11;
LABEL_13:

    id v18 = v9;
    id v15 = v18;
    if (a4)
    {
      id v15 = v18;
      BOOL v16 = 0;
      *a4 = v15;
    }
    else
    {
      BOOL v16 = 0;
    }
    goto LABEL_16;
  }
  v12 = [v7 persistentStoreCoordinator];
  v13 = [v12 currentPersistentHistoryTokenFromStores:0];

  if (v13)
  {
    v14 = [[PLGlobalValues alloc] initWithManagedObjectContext:v7];
    [(PLGlobalValues *)v14 setLastSharedAssetContainerProcessingToken:v13];
  }
  id v15 = v11;
  BOOL v16 = 1;
LABEL_16:

  return v16;
}

+ (BOOL)supportsWellKnownPhotoLibraryIdentifier:(int64_t)a3
{
  return a3 == 1;
}

+ (void)_setLastProcessingToken:(id)a3 library:(id)a4
{
  id v5 = a3;
  id v6 = [a4 globalValues];
  [v6 setLastSharedAssetContainerProcessingToken:v5];
}

+ (id)_lastProcessingTokenFromLibrary:(id)a3
{
  v3 = [a3 globalValues];
  v4 = [v3 lastSharedAssetContainerProcessingToken];

  return v4;
}

+ (id)_transactionIteratorSinceTokenIfValid:(id)a3 library:(id)a4 error:(id *)a5
{
  id v7 = a3;
  char v8 = [a4 managedObjectContext];
  id v15 = 0;
  id v9 = +[PLPersistentHistoryTransactionIterator iteratorSinceToken:v7 withManagedObjectObjectContext:v8 error:&v15];

  id v10 = v15;
  id v11 = v10;
  v12 = v11;
  if (v9) {
    BOOL v13 = 1;
  }
  else {
    BOOL v13 = a5 == 0;
  }
  if (!v13) {
    *a5 = v11;
  }

  return v9;
}

+ (BOOL)_isTokenInvalidError:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  BOOL v6 = v5 == 134501 || v5 == 134301;
  if (v6
    && ([v4 domain],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isEqualToString:*MEMORY[0x1E4F281F8]],
        v7,
        (v8 & 1) != 0))
  {
    BOOL v9 = 1;
  }
  else
  {
    if (v4)
    {
      id v10 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        id v11 = NSStringFromClass((Class)a1);
        int v13 = 138543618;
        v14 = v11;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Persistent history transaction iterator error was unrecognized: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    BOOL v9 = 0;
  }

  return v9;
}

+ (BOOL)_updateSharingCompositionForSuggestionsContainingAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromClass((Class)a1);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sharingComposition for Suggestions...", buf, 0xCu);
  }
  id v23 = 0;
  v12 = [(id)objc_opt_class() _suggestionsContainingAssetIds:v9 inContext:v8 error:&v23];

  id v13 = v23;
  v14 = v13;
  if (v12)
  {
    __int16 v15 = +[PLSuggestion predicateForPrivateOnlyCollectionsWithinSubset:v12];
    id v16 = +[PLSuggestion predicateForSharedOnlyCollectionsWithinSubset:v12];
    id v22 = v14;
    BOOL v17 = PLUpdateSharingCompositionForSharedAssetContainers(v12, &v22, v15, v16);
    id v18 = v22;

    id v19 = v18;
    if (v17)
    {
      BOOL v20 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = v13;
  }
  if (a5)
  {
    id v19 = v19;
    BOOL v20 = 0;
    *a5 = v19;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_10:

  return v20;
}

+ (id)_suggestionsContainingAssetIds:(id)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = +[PLSuggestion entityName];
  id v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setFetchBatchSize:100];
  v19[0] = @"sharingComposition";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v11 setPropertiesToFetch:v12];

  [v11 setResultType:0];
  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@ OR ANY %K IN %@", @"keyAssets", v7, @"representativeAssets", v7];
    [v11 setPredicate:v13];
  }
  id v18 = 0;
  v14 = [v8 executeFetchRequest:v11 error:&v18];
  id v15 = v18;
  id v16 = v15;
  if (!v14 && a5) {
    *a5 = v15;
  }

  return v14;
}

+ (BOOL)_updateSharingCompositionForMemoriesContainingAssetIDs:(id)a3 inContext:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = NSStringFromClass((Class)a1);
    *(_DWORD *)buf = 138543362;
    uint64_t v25 = v11;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Updating sharingComposition for Memories...", buf, 0xCu);
  }
  id v23 = 0;
  v12 = [(id)objc_opt_class() _memoriesContainingAssetIds:v9 inContext:v8 error:&v23];

  id v13 = v23;
  v14 = v13;
  if (v12)
  {
    id v15 = +[PLMemory predicateForPrivateOnlyCollectionsWithinSubset:v12];
    id v16 = +[PLMemory predicateForSharedOnlyCollectionsWithinSubset:v12];
    id v22 = v14;
    BOOL v17 = PLUpdateSharingCompositionForSharedAssetContainers(v12, &v22, v15, v16);
    id v18 = v22;

    id v19 = v18;
    if (v17)
    {
      BOOL v20 = 1;
      goto LABEL_10;
    }
  }
  else
  {
    id v19 = v13;
  }
  if (a5)
  {
    id v19 = v19;
    BOOL v20 = 0;
    *a5 = v19;
  }
  else
  {
    BOOL v20 = 0;
  }
LABEL_10:

  return v20;
}

+ (id)_memoriesContainingAssetIds:(id)a3 inContext:(id)a4 error:(id *)a5
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E4F1C0D0];
  id v10 = +[PLMemory entityName];
  id v11 = [v9 fetchRequestWithEntityName:v10];

  [v11 setFetchBatchSize:100];
  v19[0] = @"sharingComposition";
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:1];
  [v11 setPropertiesToFetch:v12];

  [v11 setResultType:0];
  if (v7)
  {
    id v13 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"ANY %K IN %@ OR ANY %K IN %@", @"extendedCuratedAssets", v7, @"userCuratedAssets", v7];
    [v11 setPredicate:v13];
  }
  id v18 = 0;
  v14 = [v8 executeFetchRequest:v11 error:&v18];
  id v15 = v18;
  id v16 = v15;
  if (!v14 && a5) {
    *a5 = v15;
  }

  return v14;
}

- (void)performWorkOnItem:(id)a3 inLibrary:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (!v10)
  {
    id v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLBackgroundJobSharedAssetContainerUpdateWorker.m", 188, @"Invalid parameter not satisfying: %@", @"library" object file lineNumber description];
  }
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x3032000000;
  v24[3] = __Block_byref_object_copy__51815;
  v24[4] = __Block_byref_object_dispose__51816;
  id v25 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke;
  v19[3] = &unk_1E5875368;
  id v12 = v10;
  id v20 = v12;
  id v13 = v9;
  id v21 = v13;
  id v22 = self;
  id v23 = v24;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_75;
  v16[3] = &unk_1E5870D98;
  id v14 = v11;
  id v17 = v14;
  id v18 = v24;
  [v12 performTransaction:v19 completionHandler:v16];

  _Block_object_dispose(v24, 8);
}

void __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = 0;
    goto LABEL_8;
  }
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = *(void *)(a1 + 32);
  id v65 = 0;
  v3 = [v5 _transactionIteratorSinceTokenIfValid:v4 library:v6 error:&v65];
  id v7 = v65;
  if (v3 && ![(id)objc_opt_class() _isTokenInvalidError:v7])
  {

    v27 = (void *)MEMORY[0x1E4F1C0A8];
    v28 = +[PLManagedAsset entityName];
    v29 = [*(id *)(a1 + 32) managedObjectContext];
    id v17 = [v27 entityForName:v28 inManagedObjectContext:v29];

    v30 = [v17 relationshipsByName];
    id v18 = [v30 objectForKeyedSubscript:@"libraryScope"];

    v31 = [MEMORY[0x1E4F1CA80] set];
    if (!v18)
    {
      v43 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F8C500];
      uint64_t v66 = *MEMORY[0x1E4F28228];
      v67 = @"Unable to find libraryScope property on Asset entity.";
      v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v67 forKeys:&v66 count:1];
      uint64_t v46 = [v43 errorWithDomain:v44 code:41003 userInfo:v45];
      uint64_t v47 = *(void *)(*(void *)(a1 + 56) + 8);
      v48 = *(void **)(v47 + 40);
      *(void *)(v47 + 40) = v46;

      v49 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
      {
        v50 = (objc_class *)objc_opt_class();
        v51 = NSStringFromClass(v50);
        uint64_t v52 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v69 = v51;
        __int16 v70 = 2112;
        uint64_t v71 = v52;
        _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "%{public}@: Unable to read asset entity or libraryScope property from schema in library: %@", buf, 0x16u);
      }
      id v19 = 0;
      goto LABEL_34;
    }
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v59[2] = __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_67;
    v59[3] = &unk_1E5873498;
    v60 = v17;
    id v61 = v18;
    id v32 = v31;
    id v62 = v32;
    [v3 enumerateRemainingTransactionsWithBlock:v59];
    if (![v32 count]) {
      goto LABEL_25;
    }
    v33 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      v34 = (objc_class *)objc_opt_class();
      v35 = NSStringFromClass(v34);
      uint64_t v36 = [v32 count];
      *(_DWORD *)buf = 138543618;
      v69 = v35;
      __int16 v70 = 2048;
      uint64_t v71 = v36;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: updating shared asset container properties from changes (%tu)...", buf, 0x16u);
    }
    v37 = objc_opt_class();
    uint64_t v38 = *(void *)(*(void *)(a1 + 56) + 8);
    id v58 = *(id *)(v38 + 40);
    char v39 = [v37 _updateSharingCompositionForMemoriesContainingAssetIDs:v32 inContext:v2 error:&v58];
    objc_storeStrong((id *)(v38 + 40), v58);
    if (v39)
    {
      v40 = objc_opt_class();
      uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
      id v57 = *(id *)(v41 + 40);
      int v42 = [v40 _updateSharingCompositionForSuggestionsContainingAssetIDs:v32 inContext:v2 error:&v57];
      objc_storeStrong((id *)(v41 + 40), v57);
      if (v42)
      {
LABEL_25:
        id v19 = [v3 lastIteratedToken];
LABEL_33:

        v49 = v60;
LABEL_34:

        goto LABEL_35;
      }
    }
    else
    {
      v53 = PLBackgroundJobServiceGetLog();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        v55 = NSStringFromClass(v54);
        uint64_t v56 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)buf = 138543618;
        v69 = v55;
        __int16 v70 = 2112;
        uint64_t v71 = v56;
        _os_log_impl(&dword_19B3C7000, v53, OS_LOG_TYPE_ERROR, "%{public}@: failed to update sharing composition for Suggestions with error: %@, not advancing token.", buf, 0x16u);
      }
    }
    id v19 = 0;
    goto LABEL_33;
  }
  id v8 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    id v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543618;
    v69 = v10;
    __int16 v70 = 2112;
    uint64_t v71 = (uint64_t)v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "%{public}@: unable to build valid transaction iterator, reprocessing entire library (error: %@)", buf, 0x16u);
  }
LABEL_8:
  id v11 = objc_opt_class();
  uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v12 + 40);
  char v13 = [v11 _updateSharingCompositionForMemoriesContainingAssetIDs:0 inContext:v2 error:&obj];
  objc_storeStrong((id *)(v12 + 40), obj);
  if (v13)
  {
    id v14 = objc_opt_class();
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v63 = *(id *)(v15 + 40);
    char v16 = [v14 _updateSharingCompositionForSuggestionsContainingAssetIDs:0 inContext:v2 error:&v63];
    objc_storeStrong((id *)(v15 + 40), v63);
    if (v16)
    {
      id v17 = [*(id *)(a1 + 32) managedObjectContext];
      id v18 = [v17 persistentStoreCoordinator];
      id v19 = [v18 currentPersistentHistoryTokenFromStores:0];
LABEL_35:

      goto LABEL_36;
    }
  }
  else
  {
    id v20 = PLBackgroundJobServiceGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      id v21 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)buf = 138412290;
      v69 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Memories with error: %@, not advancing token.", buf, 0xCu);
    }
  }
  id v22 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v69 = v23;
    _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Failed to update sharing composition for all Suggestions with error: %@, not advancing token.", buf, 0xCu);
  }

  id v17 = PLBackgroundJobServiceGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    id v24 = (objc_class *)objc_opt_class();
    id v25 = NSStringFromClass(v24);
    uint64_t v26 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
    *(_DWORD *)buf = 138543618;
    v69 = v25;
    __int16 v70 = 2112;
    uint64_t v71 = v26;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "%{public}@: failed to update sharing composition for all memories with error: %@, not advancing token.", buf, 0x16u);
  }
  id v19 = 0;
LABEL_36:

  [(id)objc_opt_class() _setLastProcessingToken:v19 library:*(void *)(a1 + 32)];
}

uint64_t __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_75(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

void __90__PLBackgroundJobSharedAssetContainerUpdateWorker_performWorkOnItem_inLibrary_completion___block_invoke_67(uint64_t a1, void *a2, unsigned char *a3)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v16 = a2;
  [v16 changes];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v17 + 1) + 8 * v8);
        id v10 = (void *)MEMORY[0x19F38D3B0]();
        id v11 = [v9 changedObjectID];
        uint64_t v12 = [v11 entity];
        if ([v12 isEqual:*(void *)(a1 + 32)] && objc_msgSend(v9, "changeType") == 1)
        {
          char v13 = [v9 updatedProperties];
          int v14 = [v13 containsObject:*(void *)(a1 + 40)];

          if (v14) {
            [*(id *)(a1 + 48) addObject:v11];
          }
        }
        else
        {
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  if ((unint64_t)[*(id *)(a1 + 48) count] >= 0x3E8) {
    *a3 = 1;
  }
}

- (id)workItemsNeedingProcessingInLibrary:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[PLBackgroundJobCriteria criteriaForDiscretionaryResourceWorker];
  uint64_t v5 = [(id)objc_opt_class() _lastProcessingTokenFromLibrary:v3];
  uint64_t v6 = [(id)objc_opt_class() _transactionIteratorSinceTokenIfValid:v5 library:v3 error:0];

  if (!v6) {
    goto LABEL_5;
  }
  if ([v6 count])
  {
    if (!v5) {
      goto LABEL_5;
    }
    uint64_t v7 = [PLBackgroundJobWorkerPendingWorkItems alloc];
    v15[0] = v5;
    uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v9 = [(PLBackgroundJobWorkerPendingWorkItems *)v7 initWithCriteria:v4 workItemsNeedingProcessing:v8];

    if (!v9) {
      goto LABEL_5;
    }
  }
  else
  {
    id v9 = [[PLBackgroundJobWorkerPendingWorkItems alloc] initWithZeroWorkItems];
    if (!v9)
    {
LABEL_5:
      id v10 = [PLBackgroundJobWorkerPendingWorkItems alloc];
      id v11 = [MEMORY[0x1E4F1CA98] null];
      int v14 = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
      id v9 = [(PLBackgroundJobWorkerPendingWorkItems *)v10 initWithCriteria:v4 workItemsNeedingProcessing:v12];
    }
  }

  return v9;
}

@end