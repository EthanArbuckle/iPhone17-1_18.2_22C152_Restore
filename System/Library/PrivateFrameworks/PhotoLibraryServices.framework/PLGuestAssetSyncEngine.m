@interface PLGuestAssetSyncEngine
+ (BOOL)_guestAssetSyncStatusIsSet:(int64_t)a3 inLibrary:(id)a4;
+ (BOOL)didIngestGuestAssetsInLibrary:(id)a3;
+ (id)_resumeMarkerObjectIDInGlobalValuesOfLibrary:(id)a3 storedInLibrary:(id)a4;
+ (void)_setGuestAssetSyncStatus:(int64_t)a3 inLibrary:(id)a4;
+ (void)setDidIngestGuestAssetsInLibrary:(id)a3;
- (BOOL)_deleteAssetWithUuid:(id)a3 syndicationIdentifier:(id)a4 fromLibrary:(id)a5;
- (BOOL)_inTransaction_deleteAssetWithUuid:(id)a3 syndicationIdentifier:(id)a4 fromLibrary:(id)a5;
- (PLGuestAssetSyncEngine)initWithDelegate:(id)a3;
- (PLGuestAssetSyncEngineDelegate)delegate;
- (id)_assetWithUUID:(id)a3 orSyndicationIdentifier:(id)a4 inLibrary:(id)a5;
- (id)workItemObjectIDsInLibrary:(id)a3 error:(id *)a4;
- (void)_deleteAllWorkItemsInSourceLibrary:(id)a3;
- (void)_finishProcessingWorkItemManagedObjectID:(id)a3 library:(id)a4 error:(id)a5 completion:(id)a6;
- (void)_initialSyncTransferNextAssetFromSourceLibrary:(id)a3 targetLibrary:(id)a4 iterator:(id)a5 completion:(id)a6;
- (void)_markAsWasGuestAssetOnAssetWithSyndicationIdentifier:(id)a3 inLibrary:(id)a4;
- (void)_processSyndicationLibraryAsset:(id)a3 targetLibrary:(id)a4 completion:(id)a5;
- (void)_syncAsset:(id)a3 toLibrary:(id)a4 completion:(id)a5;
- (void)performInitialSyncWithSourceLibrary:(id)a3 targetLibrary:(id)a4 completion:(id)a5;
- (void)processWorkItemObjectID:(id)a3 sourceLibrary:(id)a4 targetLibrary:(id)a5 completion:(id)a6;
- (void)setDelegate:(id)a3;
@end

@implementation PLGuestAssetSyncEngine

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (PLGuestAssetSyncEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLGuestAssetSyncEngineDelegate *)WeakRetained;
}

- (void)performInitialSyncWithSourceLibrary:(id)a3 targetLibrary:(id)a4 completion:(id)a5
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (([(id)objc_opt_class() _guestAssetSyncStatusIsSet:1 inLibrary:v8] & 1) == 0)
  {
    v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Detected syndication library rebuild, dropping initial sync resume markers and starting over", buf, 2u);
    }

    [(id)objc_opt_class() _setGuestAssetSyncStatus:1 inLibrary:v8];
    [(id)objc_opt_class() _setGuestAssetSyncStatus:0 inLibrary:v9];
    v12 = [v9 globalValues];
    [v12 setGuestAssetInitialSyncResumeMarker:0];
  }
  int v13 = [(id)objc_opt_class() _guestAssetSyncStatusIsSet:2 inLibrary:v9];
  v14 = objc_opt_class();
  if (v13) {
    id v15 = v8;
  }
  else {
    id v15 = v9;
  }
  uint64_t v16 = [v14 _resumeMarkerObjectIDInGlobalValuesOfLibrary:v9 storedInLibrary:v15];
  if ((v13 & 1) == 0)
  {
    v17 = PLSyndicationGetLog();
    BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
    id v48 = v10;
    if (v16)
    {
      if (v18)
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = v16;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Starting initial sync, verifying SPL guest assets from resume token: %@", buf, 0xCu);
      }
    }
    else
    {
      if (v18)
      {
        v19 = [v9 libraryID];
        *(_DWORD *)buf = 138412290;
        uint64_t v60 = (uint64_t)v19;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Starting initial sync for library: %@, no resume token found, deleting all queued work items in syndication library", buf, 0xCu);
      }
      [(PLGuestAssetSyncEngine *)self _deleteAllWorkItemsInSourceLibrary:v8];
    }
    v20 = [PLManagedObjectPagingIterator alloc];
    v21 = +[PLManagedAsset entityName];
    v22 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
    v47 = (void *)v16;
    v23 = [(PLManagedObjectPagingIterator *)v20 initWithEntityName:v21 resultType:0 resumeObjectID:v16 additionalPredicate:v22];

    v24 = [v9 managedObjectContext];
    v25 = [(PLManagedObjectPagingIterator *)v23 nextObjectWithManagedObjectContext:v24];

    v26 = [(PLGuestAssetSyncEngine *)self delegate];
    LOBYTE(v16) = [v26 guestAssetSyncManagerShouldCancel:self];

    v49 = v23;
    if ([v25 isSuccess] && (v16 & 1) == 0)
    {
      do
      {
        uint64_t v16 = (uint64_t)v25;
        v27 = [v25 result];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke;
        v54[3] = &unk_1E5875BF8;
        id v55 = v27;
        id v28 = v8;
        id v56 = v8;
        v57 = self;
        id v29 = v9;
        id v58 = v29;
        id v30 = v27;
        [v29 performTransactionAndWait:v54];
        v31 = [v30 objectID];
        v32 = [v31 URIRepresentation];
        v33 = [v32 absoluteString];
        v34 = [v29 globalValues];
        [v34 setGuestAssetInitialSyncResumeMarker:v33];

        v35 = [v29 managedObjectContext];
        v25 = [(PLManagedObjectPagingIterator *)v49 nextObjectWithManagedObjectContext:v35];

        v36 = [(PLGuestAssetSyncEngine *)self delegate];
        LODWORD(v16) = [v36 guestAssetSyncManagerShouldCancel:self];

        id v8 = v28;
      }
      while ([v25 isSuccess] && !v16);
    }
    if ([v25 isFailure])
    {
      v37 = [v25 error];
      id v10 = v48;
      (*((void (**)(id, void, void *))v48 + 2))(v48, 0, v37);

      v38 = v49;
LABEL_24:
      uint64_t v16 = (uint64_t)v47;
      goto LABEL_31;
    }
    v38 = v49;
    if (v16)
    {
      v39 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
      id v10 = v48;
      (*((void (**)(id, void, void *))v48 + 2))(v48, 0, v39);

      goto LABEL_24;
    }
    v40 = PLSyndicationGetLog();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = [v9 libraryID];
      *(_DWORD *)buf = 138412290;
      uint64_t v60 = (uint64_t)v41;
      _os_log_impl(&dword_19B3C7000, v40, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Initial sync, verify SPL Guest assets complete for library: %@", buf, 0xCu);
    }
    v42 = [v9 globalValues];
    [v42 setGuestAssetInitialSyncResumeMarker:0];

    [(id)objc_opt_class() _setGuestAssetSyncStatus:2 inLibrary:v9];
    uint64_t v16 = 0;
    id v10 = v48;
  }
  v43 = PLSyndicationGetLog();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v60 = v16;
    _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Initial sync, transfering Syndication guest assets from resume token: %@", buf, 0xCu);
  }

  v44 = [PLManagedObjectPagingIterator alloc];
  v45 = +[PLManagedAsset entityName];
  v46 = +[PLManagedAsset predicateForShouldSyncToSPL];
  v38 = [(PLManagedObjectPagingIterator *)v44 initWithEntityName:v45 resultType:1 resumeObjectID:v16 additionalPredicate:v46];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_65;
  v50[3] = &unk_1E5875C20;
  id v51 = v9;
  v52 = self;
  id v53 = v10;
  [(PLGuestAssetSyncEngine *)self _initialSyncTransferNextAssetFromSourceLibrary:v8 targetLibrary:v51 iterator:v38 completion:v50];

  v25 = v51;
LABEL_31:
}

void __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) uuid];
  v3 = [*(id *)(a1 + 32) additionalAttributes];
  v4 = [v3 syndicationIdentifier];

  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_2;
  v8[3] = &unk_1E5875BD0;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(void *)(a1 + 48);
  id v6 = v2;
  id v9 = v6;
  id v7 = v4;
  id v10 = v7;
  id v11 = *(id *)(a1 + 40);
  v12 = &v13;
  [v5 performBlockAndWait:v8];
  if (*((unsigned char *)v14 + 24)) {
    objc_msgSend(*(id *)(a1 + 48), "_inTransaction_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", v6, v7, *(void *)(a1 + 56));
  }
  else {
    [(id)objc_opt_class() setDidIngestGuestAssetsInLibrary:*(void *)(a1 + 56)];
  }

  _Block_object_dispose(&v13, 8);
}

void __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_65(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    id v6 = PLSyndicationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [*(id *)(a1 + 32) libraryID];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Initial sync complete for library: %@", (uint8_t *)&v9, 0xCu);
    }
    id v8 = [*(id *)(a1 + 32) globalValues];
    [v8 setGuestAssetInitialSyncResumeMarker:0];

    [(id)objc_opt_class() _setGuestAssetSyncStatus:4 inLibrary:*(void *)(a1 + 32)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __87__PLGuestAssetSyncEngine_performInitialSyncWithSourceLibrary_targetLibrary_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) _assetWithUUID:*(void *)(a1 + 40) orSyndicationIdentifier:*(void *)(a1 + 48) inLibrary:*(void *)(a1 + 56)];
  v3 = v2;
  if (v2)
  {
    int v4 = [v2 shouldSyncToSPL];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = v4 ^ 1;
    id v5 = PLSyndicationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v3 uuid];
      id v7 = (void *)v6;
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = @"don't";
      if (v4) {
        int v9 = @"do";
      }
      int v13 = 138544130;
      uint64_t v14 = v6;
      char v16 = v9;
      id v10 = @"keep";
      __int16 v15 = 2114;
      __int16 v17 = 2114;
      if (!v4) {
        id v10 = @"delete";
      }
      BOOL v18 = v10;
      __int16 v19 = 2114;
      uint64_t v20 = v8;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: Asset %{public}@ in syndication library says %{public}@ sync to SPL, will %{public}@ corresponding guest asset %{public}@ in SPL", (uint8_t *)&v13, 0x2Au);
    }
  }
  else
  {
    id v5 = PLSyndicationGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(__CFString **)(a1 + 40);
      v12 = *(__CFString **)(a1 + 48);
      int v13 = 138543874;
      uint64_t v14 = (uint64_t)v11;
      __int16 v15 = 2114;
      char v16 = v12;
      __int16 v17 = 2114;
      BOOL v18 = v11;
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: Unable to find asset %{public}@/%{public}@ in syndication library, will delete corresponding guest asset %{public}@ in SPL", (uint8_t *)&v13, 0x20u);
    }
  }
}

- (void)_initialSyncTransferNextAssetFromSourceLibrary:(id)a3 targetLibrary:(id)a4 iterator:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void, void *))a6;
  uint64_t v14 = [(PLGuestAssetSyncEngine *)self delegate];
  int v15 = [v14 guestAssetSyncManagerShouldCancel:self];

  if (v15)
  {
    char v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3072 userInfo:0];
    v13[2](v13, 0, v16);
  }
  else
  {
    __int16 v17 = [v10 managedObjectContext];
    char v16 = [v12 nextObjectWithManagedObjectContext:v17];

    if (v16)
    {
      if ([v16 isSuccess])
      {
        BOOL v18 = [v16 result];
        uint64_t v30 = 0;
        v31 = &v30;
        uint64_t v32 = 0x2020000000;
        char v33 = 0;
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke;
        v22[3] = &unk_1E5875BA8;
        id v23 = v10;
        id v19 = v18;
        id v29 = &v30;
        id v24 = v19;
        v25 = self;
        id v26 = v11;
        uint64_t v20 = v13;
        id v28 = v20;
        id v27 = v12;
        [v23 performBlockAndWait:v22];
        if (!*((unsigned char *)v31 + 24)) {
          v20[2](v20, 1, 0);
        }

        _Block_object_dispose(&v30, 8);
      }
      else
      {
        uint64_t v21 = [v16 error];
        v13[2](v13, 0, v21);
      }
    }
    else
    {
      v13[2](v13, 1, 0);
    }
  }
}

void __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  id v19 = 0;
  int v4 = [v2 existingObjectWithID:v3 error:&v19];
  id v5 = v19;

  if (v4)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
    uint64_t v6 = PLSyndicationGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v4 uuid];
      *(_DWORD *)buf = 138543362;
      uint64_t v21 = v7;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_INFO, "GuestAssetSync: Initial sync transfering syndication library guest asset: %{public}@ to SPL", buf, 0xCu);
    }
    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke_51;
    v12[3] = &unk_1E5875B80;
    id v18 = *(id *)(a1 + 72);
    id v13 = *(id *)(a1 + 56);
    id v10 = *(id *)(a1 + 40);
    uint64_t v11 = *(void *)(a1 + 48);
    id v14 = v10;
    uint64_t v15 = v11;
    id v16 = *(id *)(a1 + 32);
    id v17 = *(id *)(a1 + 64);
    [v8 _syncAsset:v4 toLibrary:v9 completion:v12];
  }
}

uint64_t __107__PLGuestAssetSyncEngine__initialSyncTransferNextAssetFromSourceLibrary_targetLibrary_iterator_completion___block_invoke_51(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
    return v3();
  }
  else
  {
    id v5 = [*(id *)(a1 + 40) URIRepresentation];
    uint64_t v6 = [v5 absoluteString];
    id v7 = [*(id *)(a1 + 32) globalValues];
    [v7 setGuestAssetInitialSyncResumeMarker:v6];

    uint64_t v8 = *(void **)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    uint64_t v10 = *(void *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 72);
    return [v8 _initialSyncTransferNextAssetFromSourceLibrary:v9 targetLibrary:v10 iterator:v11 completion:v12];
  }
}

- (void)_deleteAllWorkItemsInSourceLibrary:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke;
  v6[3] = &unk_1E5875E18;
  id v7 = v4;
  uint64_t v8 = self;
  id v5 = v4;
  [v5 performTransactionAndWait:v6];
}

void __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLBackgroundJobWorkItem entityName];
  id v4 = [v2 fetchRequestWithEntityName:v3];

  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"jobType", 0);
  [v4 setPredicate:v5];
  uint64_t v6 = [*(id *)(a1 + 32) managedObjectContext];
  id v7 = [v6 executeFetchRequest:v4 error:0];

  uint64_t v8 = [*(id *)(a1 + 32) managedObjectContext];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke_2;
  v12[3] = &unk_1E5875B58;
  id v9 = *(id *)(a1 + 32);
  uint64_t v10 = *(void *)(a1 + 40);
  id v13 = v9;
  uint64_t v14 = v10;
  id v11 = (id)[v8 enumerateWithIncrementalSaveUsingObjects:v7 withBlock:v12];
}

void __61__PLGuestAssetSyncEngine__deleteAllWorkItemsInSourceLibrary___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = a1;
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = a2;
  uint64_t v8 = [v6 managedObjectContext];
  [v8 deleteObject:v7];

  id v9 = [*(id *)(v5 + 40) delegate];
  LODWORD(v5) = [v9 guestAssetSyncManagerShouldCancel:*(void *)(v5 + 40)];

  if (v5) {
    *a4 = 1;
  }
}

- (void)_syncAsset:(id)a3 toLibrary:(id)a4 completion:(id)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v8 uuid];
  uint64_t v12 = [v8 additionalAttributes];
  char v33 = [v12 syndicationIdentifier];

  char v13 = [v8 shouldSyncToSPL];
  uint64_t v14 = PLSyndicationGetLog();
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_INFO);
  if (v13)
  {
    if (v15)
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v33;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "GuestAssetSync: _syncAsset %{public}@ / %{public}@ begin", buf, 0x16u);
    }

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v59) = 0;
    uint64_t v50 = 0;
    id v51 = &v50;
    uint64_t v52 = 0x2020000000;
    char v53 = 0;
    uint64_t v46 = 0;
    v47 = &v46;
    uint64_t v48 = 0x2020000000;
    char v49 = 0;
    unsigned int v16 = [v8 syndicationState];
    char v17 = v16;
    int v18 = (v16 >> 1) & 1;
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke;
    v38[3] = &unk_1E5875B08;
    id v19 = v33;
    id v39 = v19;
    id v20 = v9;
    id v40 = v20;
    v42 = buf;
    char v45 = v18;
    id v21 = v11;
    id v41 = v21;
    v43 = &v46;
    v44 = &v50;
    [v20 performBlockAndWait:v38];
    if (*((unsigned char *)v47 + 24)) {
      [v8 updateSyndicationStateWithSavedToLibrary:(v17 & 2) == 0];
    }
    if (*(unsigned char *)(*(void *)&buf[8] + 24) || (v17 & 2) == 0)
    {
      if (!*((unsigned char *)v51 + 24))
      {
        uint64_t v32 = [(PLGuestAssetSyncEngine *)self delegate];
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        v34[2] = __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke_47;
        v34[3] = &unk_1E5875B30;
        v34[4] = self;
        id v35 = v20;
        id v36 = v10;
        [v32 guestAssetSyncManager:self isTransferingAsset:v8 toLibrary:v35 completion:v34];

LABEL_24:
        _Block_object_dispose(&v46, 8);
        _Block_object_dispose(&v50, 8);
        _Block_object_dispose(buf, 8);
        goto LABEL_25;
      }
    }
    else
    {
      uint64_t v22 = PLSyndicationGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v54 = 138543618;
        id v55 = v21;
        __int16 v56 = 2114;
        id v57 = v19;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_INFO, "GuestAssetSync: no existing asset in SPL. Resetting savedToLibrary for source asset %{public}@ / %{public}@, skipping this sync pass", v54, 0x16u);
      }

      [v8 updateSyndicationStateWithSavedToLibrary:0];
      *((unsigned char *)v51 + 24) = 1;
    }
    id v26 = [v8 managedObjectContext];
    int v27 = [v26 hasChanges];

    if (v27)
    {
      id v28 = [v8 managedObjectContext];
      id v37 = 0;
      char v29 = [v28 save:&v37];
      id v30 = v37;

      if ((v29 & 1) == 0)
      {
        v31 = PLSyndicationGetLog();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v54 = 138412290;
          id v55 = v30;
          _os_log_impl(&dword_19B3C7000, v31, OS_LOG_TYPE_ERROR, "GuestAssetSync: failed to save syndication photo library changes to syndicationState, error: %@", v54, 0xCu);
        }
      }
    }
    else
    {
      id v30 = 0;
    }
    (*((void (**)(id, id))v10 + 2))(v10, v30);

    goto LABEL_24;
  }
  if (v15)
  {
    id v23 = [v8 uuid];
    [v8 savedAssetType];
    id v24 = PLValidatedSavedAssetTypeDescription();
    v25 = PLManagedAssetSyndicationStateDescription([v8 syndicationState]);
    *(_DWORD *)buf = 138544130;
    *(void *)&uint8_t buf[4] = v23;
    *(_WORD *)&buf[12] = 2114;
    *(void *)&buf[14] = v33;
    *(_WORD *)&buf[22] = 2114;
    v59 = v24;
    __int16 v60 = 2114;
    uint64_t v61 = v25;
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_INFO, "GuestAssetSync: _syncAsset %{public}@ / %{public}@ (%{public}@) syndicationState %{public}@ says don't sync to SPL", buf, 0x2Au);
  }
  [(PLGuestAssetSyncEngine *)self _deleteAssetWithUuid:v11 syndicationIdentifier:v33 fromLibrary:v9];
  [MEMORY[0x1E4F8BA10] maskForGuestAsset];
  [v8 savedAssetType];
  if (PLValidatedSavedAssetTypeApplies()) {
    [(PLGuestAssetSyncEngine *)self _markAsWasGuestAssetOnAssetWithSyndicationIdentifier:v33 inLibrary:v9];
  }
  (*((void (**)(id, void))v10 + 2))(v10, 0);
LABEL_25:
}

void __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset assetWithSyndicationIdentifier:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v2 != 0;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24))
  {
    [MEMORY[0x1E4F8BA10] maskForUserLibrary];
    [v2 savedAssetType];
    int v3 = PLValidatedSavedAssetTypeApplies();
    if (*(unsigned __int8 *)(a1 + 80) != v3)
    {
      int v4 = v3;
      uint64_t v5 = PLSyndicationGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v6 = *(void *)(a1 + 48);
        uint64_t v7 = *(void *)(a1 + 32);
        v8[0] = 67109634;
        v8[1] = v4;
        __int16 v9 = 2114;
        uint64_t v10 = v6;
        __int16 v11 = 2114;
        uint64_t v12 = v7;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_INFO, "GuestAssetSync: setting savedToLibrary %d for source asset %{public}@ / %{public}@, skipping this sync pass", (uint8_t *)v8, 0x1Cu);
      }

      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
      *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
    }
  }
}

void __58__PLGuestAssetSyncEngine__syncAsset_toLibrary_completion___block_invoke_47(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!v3) {
    [(id)objc_opt_class() setDidIngestGuestAssetsInLibrary:*(void *)(a1 + 40)];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_markAsWasGuestAssetOnAssetWithSyndicationIdentifier:(id)a3 inLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__PLGuestAssetSyncEngine__markAsWasGuestAssetOnAssetWithSyndicationIdentifier_inLibrary___block_invoke;
  v9[3] = &unk_1E5875E18;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  [v7 performTransactionAndWait:v9];
}

void __89__PLGuestAssetSyncEngine__markAsWasGuestAssetOnAssetWithSyndicationIdentifier_inLibrary___block_invoke(uint64_t a1)
{
  v1 = +[PLManagedAsset assetWithSyndicationIdentifier:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  if (v1)
  {
    id v2 = v1;
    [v1 setWasGuestAsset:1];
    v1 = v2;
  }
}

- (BOOL)_deleteAssetWithUuid:(id)a3 syndicationIdentifier:(id)a4 fromLibrary:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v20 = 0;
  id v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __81__PLGuestAssetSyncEngine__deleteAssetWithUuid_syndicationIdentifier_fromLibrary___block_invoke;
  v15[3] = &unk_1E5875BD0;
  id v19 = &v20;
  v15[4] = self;
  id v11 = v8;
  id v16 = v11;
  id v12 = v9;
  id v17 = v12;
  id v13 = v10;
  id v18 = v13;
  [v13 performTransactionAndWait:v15];
  LOBYTE(v8) = *((unsigned char *)v21 + 24);

  _Block_object_dispose(&v20, 8);
  return (char)v8;
}

uint64_t __81__PLGuestAssetSyncEngine__deleteAssetWithUuid_syndicationIdentifier_fromLibrary___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_inTransaction_deleteAssetWithUuid:syndicationIdentifier:fromLibrary:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = result;
  return result;
}

- (BOOL)_inTransaction_deleteAssetWithUuid:(id)a3 syndicationIdentifier:(id)a4 fromLibrary:(id)a5
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = [(PLGuestAssetSyncEngine *)self _assetWithUUID:v8 orSyndicationIdentifier:a4 inLibrary:a5];
  if (!v9)
  {
    id v12 = PLSyndicationGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEBUG, "GuestAssetSync: Unable to delete guest asset with uuid %@, does not exist", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_10;
  }
  [MEMORY[0x1E4F8BA10] maskForGuestAsset];
  [v9 savedAssetType];
  int v10 = PLValidatedSavedAssetTypeApplies();
  id v11 = PLSyndicationGetLog();
  id v12 = v11;
  if (!v10)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      [v9 savedAssetType];
      uint64_t v14 = PLValidatedSavedAssetTypeDescription();
      int v16 = 138543618;
      id v17 = v14;
      __int16 v18 = 2114;
      id v19 = v8;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: Not deleting %{public}@ asset in system library with uuid %{public}@", (uint8_t *)&v16, 0x16u);
    }
LABEL_10:
    BOOL v13 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138543362;
    id v17 = v8;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Deleting guest asset from system library with uuid %{public}@", (uint8_t *)&v16, 0xCu);
  }

  id v12 = +[PLAssetTransactionReason transactionReason:@"Syndication Guest Asset Sync"];
  [v9 deleteWithReason:v12];
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (id)_assetWithUUID:(id)a3 orSyndicationIdentifier:(id)a4 inLibrary:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = +[PLManagedAsset assetWithUUID:v7 inLibrary:v9];
  id v11 = (void *)v10;
  if (v8)
  {
    if (!v10)
    {
      id v11 = +[PLManagedAsset assetWithSyndicationIdentifier:v8 inLibrary:v9];
      if (v11)
      {
        id v12 = PLSyndicationGetLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v13 = [v11 uuid];
          int v15 = 138543874;
          id v16 = v8;
          __int16 v17 = 2114;
          id v18 = v7;
          __int16 v19 = 2112;
          uint64_t v20 = v13;
          _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "GuestAssetSync: Found asset by looking up syndicationIdentifier %{public}@ uuid %{public}@ did not match asset uuid %{public%}@", (uint8_t *)&v15, 0x20u);
        }
      }
    }
  }

  return v11;
}

- (void)processWorkItemObjectID:(id)a3 sourceLibrary:(id)a4 targetLibrary:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x3032000000;
  v26[3] = __Block_byref_object_copy__115322;
  v26[4] = __Block_byref_object_dispose__115323;
  id v27 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke;
  v18[3] = &unk_1E5875AE0;
  id v14 = v11;
  id v19 = v14;
  id v15 = v10;
  id v24 = v26;
  id v20 = v15;
  uint64_t v21 = self;
  id v16 = v12;
  id v22 = v16;
  v25 = &v28;
  id v17 = v13;
  id v23 = v17;
  [v14 performBlockAndWait:v18];
  if (!*((unsigned char *)v29 + 24)) {
    [(PLGuestAssetSyncEngine *)self _finishProcessingWorkItemManagedObjectID:v15 library:v14 error:0 completion:v17];
  }

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v28, 8);
}

void __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  id obj = *(id *)(v4 + 40);
  id v5 = [v2 existingObjectWithID:v3 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);

  if (!v5)
  {
    id v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      id v15 = *(void **)(a1 + 40);
      uint64_t v16 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      id v37 = v15;
      __int16 v38 = 2112;
      uint64_t v39 = v16;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to fetch work item with objectID: %{public}@, error: %@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  int v6 = [v5 jobFlags];
  int v7 = v6;
  if ((v6 & 2) == 0)
  {
    if (v6)
    {
      id v23 = [v5 identifier];
      id v11 = +[PLManagedAsset assetWithUUID:v23 inLibrary:*(void *)(a1 + 32)];

      if (v11)
      {
        *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
        id v24 = *(void **)(a1 + 48);
        uint64_t v25 = *(void *)(a1 + 56);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke_36;
        v29[3] = &unk_1E5875AB8;
        v29[4] = v24;
        id v30 = *(id *)(a1 + 40);
        id v31 = *(id *)(a1 + 32);
        id v32 = *(id *)(a1 + 64);
        [v24 _processSyndicationLibraryAsset:v11 targetLibrary:v25 completion:v29];
      }
      else
      {
        id v26 = PLSyndicationGetLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          id v27 = [v5 identifier];
          uint64_t v28 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40);
          *(_DWORD *)buf = 138543618;
          id v37 = v27;
          __int16 v38 = 2112;
          uint64_t v39 = v28;
          _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "GuestAssetSync: Unable to fetch asset with uuid: %{public}@, error: %@", buf, 0x16u);
        }
        id v11 = 0;
      }
    }
    else
    {
      id v8 = PLSyndicationGetLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v37) = v7;
        _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "GuestAssetSync: Invalid job flags for work item: %X", buf, 8u);
      }

      id v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4F8C500];
      uint64_t v34 = *MEMORY[0x1E4F28228];
      id v35 = @"Invalid job flags for guest asset sync work item";
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      uint64_t v12 = [v9 errorWithDomain:v10 code:46309 userInfo:v11];
      uint64_t v13 = *(void *)(*(void *)(a1 + 72) + 8);
      id v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;
    }
LABEL_19:

    goto LABEL_20;
  }
  id v17 = PLSyndicationGetLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    id v18 = [v5 identifier];
    *(_DWORD *)buf = 138543362;
    id v37 = v18;
    _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "GuestAssetSync: attempting to delete asset with uuid: %{public}@", buf, 0xCu);
  }
  id v19 = *(void **)(a1 + 48);
  id v20 = [v5 identifier];
  int v21 = [v19 _deleteAssetWithUuid:v20 syndicationIdentifier:0 fromLibrary:*(void *)(a1 + 56)];

  if (v21)
  {
    id v11 = PLSyndicationGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v22 = [v5 identifier];
      *(_DWORD *)buf = 138543362;
      id v37 = v22;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "GuestAssetSync: deleted asset with uuid: %{public}@", buf, 0xCu);
    }
    goto LABEL_19;
  }
LABEL_20:
}

uint64_t __89__PLGuestAssetSyncEngine_processWorkItemObjectID_sourceLibrary_targetLibrary_completion___block_invoke_36(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _finishProcessingWorkItemManagedObjectID:*(void *)(a1 + 40) library:*(void *)(a1 + 48) error:a2 completion:*(void *)(a1 + 56)];
}

- (void)_processSyndicationLibraryAsset:(id)a3 targetLibrary:(id)a4 completion:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(id, void))a5;
  int v11 = [v8 shouldSyncToSPL];
  uint64_t v12 = PLSyndicationGetLog();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);
  if (v11)
  {
    if (v13)
    {
      id v14 = [v8 uuid];
      id v15 = [v8 additionalAttributes];
      uint64_t v16 = [v15 syndicationIdentifier];
      [v8 savedAssetType];
      id v17 = PLValidatedSavedAssetTypeDescription();
      id v18 = PLManagedAssetSyndicationStateDescription([v8 syndicationState]);
      int v29 = 138544130;
      id v30 = v14;
      __int16 v31 = 2114;
      id v32 = v16;
      __int16 v33 = 2114;
      uint64_t v34 = v17;
      __int16 v35 = 2114;
      id v36 = v18;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: %{public}@ / %{public}@ (%{public}@) syndicationState %{public}@ says sync to SPL", (uint8_t *)&v29, 0x2Au);
    }
    [(PLGuestAssetSyncEngine *)self _syncAsset:v8 toLibrary:v9 completion:v10];
  }
  else
  {
    if (v13)
    {
      id v19 = [v8 uuid];
      id v20 = [v8 additionalAttributes];
      int v21 = [v20 syndicationIdentifier];
      [v8 savedAssetType];
      id v22 = PLValidatedSavedAssetTypeDescription();
      id v23 = PLManagedAssetSyndicationStateDescription([v8 syndicationState]);
      int v29 = 138544130;
      id v30 = v19;
      __int16 v31 = 2114;
      id v32 = v21;
      __int16 v33 = 2114;
      uint64_t v34 = v22;
      __int16 v35 = 2114;
      id v36 = v23;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "GuestAssetSync: %{public}@ / %{public}@ (%{public}@) syndicationState %{public}@ says don't sync to SPL", (uint8_t *)&v29, 0x2Au);
    }
    id v24 = [v8 uuid];
    uint64_t v25 = [v8 additionalAttributes];
    id v26 = [v25 syndicationIdentifier];
    [(PLGuestAssetSyncEngine *)self _deleteAssetWithUuid:v24 syndicationIdentifier:v26 fromLibrary:v9];

    [MEMORY[0x1E4F8BA10] maskForGuestAsset];
    [v8 savedAssetType];
    if (PLValidatedSavedAssetTypeApplies())
    {
      id v27 = [v8 additionalAttributes];
      uint64_t v28 = [v27 syndicationIdentifier];
      [(PLGuestAssetSyncEngine *)self _markAsWasGuestAssetOnAssetWithSyndicationIdentifier:v28 inLibrary:v9];
    }
    v10[2](v10, 0);
  }
}

- (void)_finishProcessingWorkItemManagedObjectID:(id)a3 library:(id)a4 error:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __92__PLGuestAssetSyncEngine__finishProcessingWorkItemManagedObjectID_library_error_completion___block_invoke;
  v15[3] = &unk_1E5875E18;
  id v16 = v9;
  id v17 = v10;
  id v11 = v10;
  id v12 = v9;
  BOOL v13 = (void (**)(id, id))a6;
  id v14 = a5;
  [v11 performTransactionAndWait:v15];
  v13[2](v13, v14);
}

void __92__PLGuestAssetSyncEngine__finishProcessingWorkItemManagedObjectID_library_error_completion___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = PLSyndicationGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v7 = 138412290;
    uint64_t v8 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "GuestAssetSync: Finishing performWork and deleting job item: %@", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v4 = [*(id *)(a1 + 40) managedObjectContext];
  id v5 = [v4 existingObjectWithID:*(void *)(a1 + 32) error:0];

  if (v5)
  {
    int v6 = [*(id *)(a1 + 40) managedObjectContext];
    [v6 deleteObject:v5];
  }
}

- (id)workItemObjectIDsInLibrary:(id)a3 error:(id *)a4
{
  id v5 = a3;
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  uint64_t v25 = __Block_byref_object_copy__115322;
  id v26 = __Block_byref_object_dispose__115323;
  id v27 = 0;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = __Block_byref_object_copy__115322;
  id v20 = __Block_byref_object_dispose__115323;
  id v21 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __59__PLGuestAssetSyncEngine_workItemObjectIDsInLibrary_error___block_invoke;
  v12[3] = &unk_1E5875A90;
  id v14 = &v22;
  id v6 = v5;
  id v13 = v6;
  id v15 = &v16;
  [v6 performBlockAndWait:v12];
  uint64_t v7 = v23[5];
  id v8 = (id)v17[5];
  uint64_t v9 = v8;
  if (!v7 && a4) {
    *a4 = v8;
  }

  id v10 = (id)v23[5];
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v10;
}

void __59__PLGuestAssetSyncEngine_workItemObjectIDsInLibrary_error___block_invoke(uint64_t a1)
{
  id v2 = (void *)MEMORY[0x1E4F1C0D0];
  uint64_t v3 = +[PLBackgroundJobWorkItem entityName];
  uint64_t v4 = [v2 fetchRequestWithEntityName:v3];

  [v4 setResultType:1];
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"jobType", 0);
  [v4 setPredicate:v5];
  [v4 setFetchLimit:100];
  id v6 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v7 + 40);
  uint64_t v8 = [v6 executeFetchRequest:v4 error:&obj];
  objc_storeStrong((id *)(v7 + 40), obj);
  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

- (PLGuestAssetSyncEngine)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PLGuestAssetSyncEngine;
  id v5 = [(PLGuestAssetSyncEngine *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

+ (id)_resumeMarkerObjectIDInGlobalValuesOfLibrary:(id)a3 storedInLibrary:(id)a4
{
  id v5 = a4;
  id v6 = [a3 globalValues];
  uint64_t v7 = [v6 guestAssetInitialSyncResumeMarker];

  if (v7)
  {
    objc_super v8 = [v5 managedObjectContext];
    uint64_t v9 = [v8 persistentStoreCoordinator];
    id v10 = [MEMORY[0x1E4F1CB10] URLWithString:v7];
    id v11 = [v9 managedObjectIDForURIRepresentation:v10];
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

+ (void)setDidIngestGuestAssetsInLibrary:(id)a3
{
}

+ (BOOL)didIngestGuestAssetsInLibrary:(id)a3
{
  return [a1 _guestAssetSyncStatusIsSet:8 inLibrary:a3];
}

+ (void)_setGuestAssetSyncStatus:(int64_t)a3 inLibrary:(id)a4
{
  id v10 = a4;
  id v5 = [v10 globalValues];
  id v6 = [v5 guestAssetSyncStatus];

  if (!v6 || (uint64_t v7 = [v6 integerValue], a3 |= v7, a3 != v7))
  {
    objc_super v8 = [NSNumber numberWithInteger:a3];
    uint64_t v9 = [v10 globalValues];
    [v9 setGuestAssetSyncStatus:v8];
  }
}

+ (BOOL)_guestAssetSyncStatusIsSet:(int64_t)a3 inLibrary:(id)a4
{
  id v5 = [a4 globalValues];
  id v6 = [v5 guestAssetSyncStatus];

  if (v6) {
    BOOL v7 = (a3 & ~[v6 integerValue]) == 0;
  }
  else {
    BOOL v7 = 0;
  }

  return v7;
}

@end