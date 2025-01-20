@interface PLSpotlightDonationOperation
- (CSSearchableIndex)searchableIndex;
- (NSArray)searchableItems;
- (NSString)bundleIdentifier;
- (PLPhotoLibrary)photoLibrary;
- (PLSpotlightDonationManagerSignpostDelegate)signpostDelegate;
- (PLSpotlightDonationOperation)initWithPhotoLibrary:(id)a3 spotlightSearchableIndex:(id)a4 searchableItems:(id)a5 bundleIdentifier:(id)a6;
- (void)main;
- (void)setSignpostDelegate:(id)a3;
@end

@implementation PLSpotlightDonationOperation

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_signpostDelegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_searchableItems, 0);
  objc_storeStrong((id *)&self->_searchableIndex, 0);
}

- (void)setSignpostDelegate:(id)a3
{
}

- (PLSpotlightDonationManagerSignpostDelegate)signpostDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_signpostDelegate);
  return (PLSpotlightDonationManagerSignpostDelegate *)WeakRetained;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (NSArray)searchableItems
{
  return self->_searchableItems;
}

- (CSSearchableIndex)searchableIndex
{
  return self->_searchableIndex;
}

- (void)main
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v3 = [(PLSpotlightDonationOperation *)self photoLibrary];
  v4 = [(PLSpotlightDonationOperation *)self searchableIndex];
  v5 = [(PLSpotlightDonationOperation *)self bundleIdentifier];
  v6 = [(PLSpotlightDonationOperation *)self searchableItems];
  v7 = objc_msgSend(v6, "_pl_map:", &__block_literal_global_3392);
  v8 = PLSearchBackendDonationsGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [(PLSpotlightDonationOperation *)self searchableIndex];
    *(_DWORD *)buf = 138544130;
    v22 = v5;
    __int16 v23 = 2112;
    v24 = v3;
    __int16 v25 = 2112;
    v26 = v9;
    __int16 v27 = 2114;
    v28 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "Donation Operation: [Begin]. BundleIdentifier: %{public}@, PhotoLibrary: %@, Spotlight Index: %@, Items: %{public}@", buf, 0x2Au);
  }
  v10 = [(PLSpotlightDonationOperation *)self signpostDelegate];
  objc_msgSend(v10, "beginSignpostIntervalForOperationType:searchableItemCount:", 1, objc_msgSend(v6, "count"));
  v11 = [v3 pathManager];
  BOOL v12 = +[PLSpotlightProgressManager shouldPerformSpotlightOperationOfType:1 withSearchableItemIdentifiers:v7 photoLibraryPathManager:v11];

  if (v12)
  {
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__PLSpotlightDonationOperation_main__block_invoke_45;
    v14[3] = &unk_1E5862EF8;
    id v15 = v7;
    id v16 = v5;
    id v17 = v3;
    objc_copyWeak(&v20, (id *)buf);
    id v18 = v10;
    id v19 = v6;
    [v4 indexSearchableItems:v19 deleteSearchableItemsWithIdentifiers:0 clientState:0 protectionClass:0 forBundleID:v16 options:0 completionHandler:v14];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v13 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = v7;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Donation Operation: [Cancelled]. ShouldPerformRequest is NO. Aborting request to donate to Spotlight for items: %{public}@", buf, 0xCu);
    }

    [v10 endSignpostIntervalForOperationType:1 searchableItemCount:0];
    [(PLSpotlightAsyncOperation *)self setOperationState:2];
  }
}

void __36__PLSpotlightDonationOperation_main__block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLSearchBackendDonationsGetLog();
  v5 = v4;
  if (v3)
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      goto LABEL_7;
    }
    uint64_t v6 = [*(id *)(a1 + 32) count];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    int v21 = 134349826;
    uint64_t v22 = v6;
    __int16 v23 = 2114;
    uint64_t v24 = v7;
    __int16 v25 = 2114;
    id v26 = v3;
    __int16 v27 = 2114;
    uint64_t v28 = v8;
    v9 = "Donation Operation: [Failed]. Failed to donate %{public}lu searchable items to Spotlight for bundleIdentifier: "
         "%{public}@. Error: %{public}@. Items: %{public}@";
    v10 = v5;
    os_log_type_t v11 = OS_LOG_TYPE_ERROR;
    uint32_t v12 = 42;
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_7;
    }
    uint64_t v13 = [*(id *)(a1 + 32) count];
    id v15 = *(void **)(a1 + 32);
    uint64_t v14 = *(void *)(a1 + 40);
    int v21 = 134349570;
    uint64_t v22 = v13;
    __int16 v23 = 2114;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    id v26 = v15;
    v9 = "Donation Operation: [Success]. Successfully donated %{public}lu items to Spotlight for bundleIdentifier: %{publ"
         "ic}@, items: %{public}@";
    v10 = v5;
    os_log_type_t v11 = OS_LOG_TYPE_DEFAULT;
    uint32_t v12 = 32;
  }
  _os_log_impl(&dword_19B3C7000, v10, v11, v9, (uint8_t *)&v21, v12);
LABEL_7:

  uint64_t v16 = *(void *)(a1 + 32);
  id v17 = [*(id *)(a1 + 48) pathManager];
  BOOL v18 = +[PLSpotlightProgressManager spotlightOperationCompletedForOperationType:1 withSearchableIdentifiers:v16 forPhotoLibraryPathManager:v17 success:v3 == 0];

  if (!v18)
  {
    id v19 = PLSearchBackendDonationsGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "Donation Operation: [Error]. Failed to update progress for Spotlight donations. Progress may not be accurate on disk.", (uint8_t *)&v21, 2u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained setOperationState:2];

  objc_msgSend(*(id *)(a1 + 56), "endSignpostIntervalForOperationType:searchableItemCount:", 1, objc_msgSend(*(id *)(a1 + 64), "count"));
}

uint64_t __36__PLSpotlightDonationOperation_main__block_invoke(uint64_t a1, void *a2)
{
  return [a2 uniqueIdentifier];
}

- (PLSpotlightDonationOperation)initWithPhotoLibrary:(id)a3 spotlightSearchableIndex:(id)a4 searchableItems:(id)a5 bundleIdentifier:(id)a6
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (v12)
  {
    if (v13) {
      goto LABEL_3;
    }
  }
  else
  {
    __int16 v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLSpotlightDonationOperation.m", 32, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];

    if (v13)
    {
LABEL_3:
      if (v14) {
        goto LABEL_4;
      }
LABEL_10:
      __int16 v25 = [MEMORY[0x1E4F28B00] currentHandler];
      [v25 handleFailureInMethod:a2, self, @"PLSpotlightDonationOperation.m", 34, @"Invalid parameter not satisfying: %@", @"searchableItems" object file lineNumber description];

      if (v15) {
        goto LABEL_5;
      }
      goto LABEL_11;
    }
  }
  uint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
  [v24 handleFailureInMethod:a2, self, @"PLSpotlightDonationOperation.m", 33, @"Invalid parameter not satisfying: %@", @"searchableIndex" object file lineNumber description];

  if (!v14) {
    goto LABEL_10;
  }
LABEL_4:
  if (v15) {
    goto LABEL_5;
  }
LABEL_11:
  id v26 = [MEMORY[0x1E4F28B00] currentHandler];
  [v26 handleFailureInMethod:a2, self, @"PLSpotlightDonationOperation.m", 35, @"Invalid parameter not satisfying: %@", @"bundleIdentifier" object file lineNumber description];

LABEL_5:
  v27.receiver = self;
  v27.super_class = (Class)PLSpotlightDonationOperation;
  uint64_t v16 = [(PLSpotlightDonationOperation *)&v27 init];
  id v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_searchableIndex, a4);
    objc_storeStrong((id *)&v17->_photoLibrary, a3);
    uint64_t v18 = [v14 copy];
    searchableItems = v17->_searchableItems;
    v17->_searchableItems = (NSArray *)v18;

    uint64_t v20 = [v15 copy];
    bundleIdentifier = v17->_bundleIdentifier;
    v17->_bundleIdentifier = (NSString *)v20;
  }
  return v17;
}

@end