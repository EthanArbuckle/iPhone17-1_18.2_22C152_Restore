@interface PLSpotlightDeletionOperation
- (CSSearchableIndex)searchableIndex;
- (NSArray)searchableItemIdentifiers;
- (PLPhotoLibrary)photoLibrary;
- (PLSpotlightDeletionOperation)initWithPhotoLibrary:(id)a3 spotlightSearchableIndex:(id)a4 searchableItemIdentifiers:(id)a5;
- (void)main;
@end

@implementation PLSpotlightDeletionOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_searchableItemIdentifiers, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)searchableItemIdentifiers
{
  return self->_searchableItemIdentifiers;
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)main
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(PLSpotlightDeletionOperation *)self photoLibrary];
  v4 = [(PLSpotlightDeletionOperation *)self searchableIndex];
  v5 = [(PLSpotlightDeletionOperation *)self searchableItemIdentifiers];
  v6 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [(PLSpotlightDeletionOperation *)self searchableIndex];
    *(_DWORD *)buf = 138412802;
    v17 = v3;
    __int16 v18 = 2112;
    v19 = v7;
    __int16 v20 = 2114;
    v21 = v5;
    _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Deletion Operation: [Begin]. PhotoLibrary: %@, Spotlight Index: %@, Items: %{public}@", buf, 0x20u);
  }
  v8 = [v3 pathManager];
  BOOL v9 = +[PLSpotlightProgressManager shouldPerformSpotlightOperationOfType:2 withSearchableItemIdentifiers:v5 photoLibraryPathManager:v8];

  if (v9)
  {
    v10 = +[PLSpotlightDonationUtilities photosBundleIdentifier];
    objc_initWeak((id *)buf, self);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __36__PLSpotlightDeletionOperation_main__block_invoke;
    v12[3] = &unk_1E58660B8;
    id v13 = v5;
    id v14 = v3;
    objc_copyWeak(&v15, (id *)buf);
    [v4 indexSearchableItems:0 deleteSearchableItemsWithIdentifiers:v13 clientState:0 protectionClass:0 forBundleID:v10 options:0 completionHandler:v12];
    objc_destroyWeak(&v15);

    objc_destroyWeak((id *)buf);
  }
  else
  {
    v11 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v17 = v5;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Deletion Operation: [Cancelled]. ShouldPerformRequest is NO. Aborting request to delete from Spotlight for items: %{public}@", buf, 0xCu);
    }

    [(PLSpotlightAsyncOperation *)self setOperationState:2];
  }
}

void __36__PLSpotlightDeletionOperation_main__block_invoke(id *a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLSearchBackendDonationsGetLog();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v6 = [a1[4] count];
    id v7 = a1[4];
    int v19 = 134349570;
    uint64_t v20 = v6;
    __int16 v21 = 2114;
    id v22 = v3;
    __int16 v23 = 2114;
    id v24 = v7;
    v8 = "Deletion Operation: [Failed]. Failed to delete %{public}lu searchable items from Spotlight. Error: %{public}@. "
         "Items: %{public}@";
    BOOL v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_ERROR;
    uint32_t v11 = 32;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v12 = [a1[4] count];
    id v13 = a1[4];
    int v19 = 134349314;
    uint64_t v20 = v12;
    __int16 v21 = 2114;
    id v22 = v13;
    v8 = "Deletion Operation: [Success]. Successfully deleted %{public}ld items from Spotlight. Items: %{public}@";
    BOOL v9 = v5;
    os_log_type_t v10 = OS_LOG_TYPE_DEFAULT;
    uint32_t v11 = 22;
  }
  _os_log_impl(&dword_19B3C7000, v9, v10, v8, (uint8_t *)&v19, v11);
LABEL_7:

  id v14 = a1[4];
  id v15 = [a1[5] pathManager];
  BOOL v16 = +[PLSpotlightProgressManager spotlightOperationCompletedForOperationType:2 withSearchableIdentifiers:v14 forPhotoLibraryPathManager:v15 success:v3 == 0];

  if (!v16)
  {
    v17 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Deletion Operation: [Error]. Failed to update progress for Spotlight deletions. Progress may not be accurate on disk.", (uint8_t *)&v19, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setOperationState:2];
}

- (PLSpotlightDeletionOperation)initWithPhotoLibrary:(id)a3 spotlightSearchableIndex:(id)a4 searchableItemIdentifiers:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLSpotlightDeletionOperation.m", 31, @"Invalid parameter not satisfying: %@", @"searchableIndex" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  __int16 v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PLSpotlightDeletionOperation.m", 30, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PLSpotlightDeletionOperation.m", 32, @"Invalid parameter not satisfying: %@", @"searchableItemIdentifiers" object file lineNumber description];

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PLSpotlightDeletionOperation;
  id v13 = [(PLSpotlightDeletionOperation *)&v21 init];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_searchableIndex, a4);
    uint64_t v15 = [v12 copy];
    searchableItemIdentifiers = v14->_searchableItemIdentifiers;
    v14->_searchableItemIdentifiers = (NSArray *)v15;

    objc_storeStrong((id *)&v14->_photoLibrary, a3);
  }

  return v14;
}

@end