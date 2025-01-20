@interface PLSyndicationDeleteEngine
- (BOOL)_deleteConversationWithBundleID:(id)a3 syndicationIdentifiers:(id)a4;
- (BOOL)_deleteSyndicationAssetsWithBundleID:(id)a3 syndicationIdentifiers:(id)a4 deleteCount:(int64_t *)a5;
- (BOOL)_processDeletesForBundleID:(id)a3 unprefixedIdentifiers:(id)a4;
- (NSString)logPrefix;
- (PLSyndicationDeleteEngine)initWithDelegate:(id)a3 path:(id)a4 logPrefix:(id)a5;
- (PLSyndicationDeleteEngine)initWithLibraryServicesManager:(id)a3;
- (PLSyndicationDeleteEngineDelegate)delegate;
- (void)_inqueueProcessDeletesForBundleID:(id)a3 identifiers:(id)a4;
- (void)processDeletesForBundleID:(id)a3 identifiers:(id)a4 completion:(id)a5;
@end

@implementation PLSyndicationDeleteEngine

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (PLSyndicationDeleteEngineDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PLSyndicationDeleteEngineDelegate *)WeakRetained;
}

- (void)processDeletesForBundleID:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F8BA48];
  v12 = [NSNumber numberWithInteger:self->_wellKnownPhotoLibraryIdentifier];
  v13 = [v12 stringValue];
  id v14 = [@"PLSyndicationDeleteEngine-processDeletes-" stringByAppendingString:v13];
  v15 = objc_msgSend(v11, "transaction:", objc_msgSend(v14, "UTF8String"));

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__PLSyndicationDeleteEngine_processDeletesForBundleID_identifiers_completion___block_invoke;
  block[3] = &unk_1E5874818;
  block[4] = self;
  id v22 = v8;
  id v24 = v15;
  id v25 = v10;
  id v23 = v9;
  id v17 = v15;
  id v18 = v10;
  id v19 = v9;
  id v20 = v8;
  dispatch_async(queue, block);
}

uint64_t __78__PLSyndicationDeleteEngine_processDeletesForBundleID_identifiers_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _inqueueProcessDeletesForBundleID:*(void *)(a1 + 40) identifiers:*(void *)(a1 + 48)];
  uint64_t v2 = *(void *)(a1 + 64);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 56);
  return [v3 stillAlive];
}

- (void)_inqueueProcessDeletesForBundleID:(id)a3 identifiers:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = PLSyndicationGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [(PLSyndicationDeleteEngine *)self logPrefix];
    int v10 = 138543874;
    v11 = v9;
    __int16 v12 = 2048;
    uint64_t v13 = [v7 count];
    __int16 v14 = 2114;
    id v15 = v7;
    _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Going to delete %lu items with identifiers: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  [(PLSyndicationDeleteEngine *)self _processDeletesForBundleID:v6 unprefixedIdentifiers:v7];
  if ([v6 isEqualToString:@"com.apple.MobileSMS"]) {
    [(PLSyndicationDeleteEngine *)self _deleteConversationWithBundleID:v6 syndicationIdentifiers:v7];
  }
}

- (BOOL)_deleteConversationWithBundleID:(id)a3 syndicationIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(PLSyndicationDeleteEngine *)self delegate];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke;
  v12[3] = &unk_1E5871710;
  id v13 = v7;
  __int16 v14 = self;
  id v15 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performTransactionForSyndicationDeleteManager:self name:"-[PLSyndicationDeleteEngine _deleteConversationWithBundleID:syndicationIdentifiers:]" transaction:v12];

  return 0;
}

void __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1C0D0];
  v5 = +[PLConversation entityName];
  id v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K in %@", @"importSessionID", *(void *)(a1 + 32)];
  [v6 setPredicate:v7];
  uint64_t v19 = 0;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke_2;
  v17[3] = &unk_1E5871760;
  id v8 = v3;
  id v18 = v8;
  id v9 = (id)[v8 enumerateObjectsFromFetchRequest:v6 count:&v19 usingDefaultBatchSizeWithBlock:v17];
  if (*(void *)(*(void *)(a1 + 40) + 24) == 3) {
    id v10 = @"syndicationLibrary";
  }
  else {
    id v10 = @"SPL";
  }
  v11 = v10;
  __int16 v12 = PLSyndicationGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = [*(id *)(a1 + 40) logPrefix];
    uint64_t v14 = v19;
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
    *(_DWORD *)buf = 138544386;
    v21 = v13;
    __int16 v22 = 2048;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    id v25 = v11;
    __int16 v26 = 2114;
    uint64_t v27 = v15;
    __int16 v28 = 2114;
    v29 = v16;
    _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleted %lu conversation(s) in %@ for bundleID: %{public}@, identifiers: %{public}@", buf, 0x34u);
  }
}

uint64_t __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (BOOL)_deleteSyndicationAssetsWithBundleID:(id)a3 syndicationIdentifiers:(id)a4 deleteCount:(int64_t *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(PLSyndicationDeleteEngine *)self delegate];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke;
  v14[3] = &unk_1E5871738;
  id v15 = v9;
  id v16 = v8;
  id v17 = self;
  id v18 = a5;
  id v11 = v8;
  id v12 = v9;
  [v10 performTransactionForSyndicationDeleteManager:self name:"-[PLSyndicationDeleteEngine _deleteSyndicationAssetsWithBundleID:syndicationIdentifiers:deleteCount:]" transaction:v14];

  return 0;
}

void __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke(uint64_t a1, void *a2)
{
  v40[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1C0D0];
  v5 = +[PLManagedAsset entityName];
  id v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = +[PLManagedAsset predicateForSyndicatedAssetIdentifiers:*(void *)(a1 + 32) includeRejected:1];
  v40[0] = v8;
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"additionalAttributes.importedByBundleIdentifier", *(void *)(a1 + 40)];
  v40[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
  id v11 = [v7 andPredicateWithSubpredicates:v10];

  if (*(void *)(*(void *)(a1 + 48) + 24) != 3)
  {
    id v12 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForGuestAsset"), 1);
    id v13 = (void *)MEMORY[0x1E4F28BA0];
    v39[0] = v11;
    v39[1] = v12;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v39 count:2];
    uint64_t v15 = [v13 andPredicateWithSubpredicates:v14];

    id v11 = (void *)v15;
  }
  [v6 setPredicate:v11];
  uint64_t v28 = 0;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke_2;
  v26[3] = &unk_1E5872990;
  id v16 = v3;
  id v27 = v16;
  id v17 = (id)[v16 enumerateObjectsFromFetchRequest:v6 count:&v28 usingDefaultBatchSizeWithBlock:v26];
  if (*(void *)(*(void *)(a1 + 48) + 24) == 3) {
    id v18 = @"syndicationLibrary";
  }
  else {
    id v18 = @"SPL";
  }
  uint64_t v19 = v18;
  id v20 = PLSyndicationGetLog();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    v21 = [*(id *)(a1 + 48) logPrefix];
    uint64_t v22 = v28;
    uint64_t v23 = *(void *)(a1 + 40);
    __int16 v24 = [*(id *)(a1 + 32) componentsJoinedByString:@","];
    *(_DWORD *)buf = 138544386;
    uint64_t v30 = v21;
    __int16 v31 = 2048;
    uint64_t v32 = v22;
    __int16 v33 = 2112;
    v34 = v19;
    __int16 v35 = 2114;
    uint64_t v36 = v23;
    __int16 v37 = 2114;
    v38 = v24;
    _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleted %lu syndication guest asset(s) in %@ for bundleID: %{public}@, identifiers: %{public}@", buf, 0x34u);
  }
  id v25 = *(void **)(a1 + 56);
  if (v25) {
    *id v25 = v28;
  }
}

uint64_t __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) deleteObject:a2];
}

- (BOOL)_processDeletesForBundleID:(id)a3 unprefixedIdentifiers:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = [(PLSyndicationDeleteEngine *)self delegate];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __78__PLSyndicationDeleteEngine__processDeletesForBundleID_unprefixedIdentifiers___block_invoke;
  v19[3] = &unk_1E5871710;
  id v10 = v7;
  id v20 = v10;
  id v21 = v6;
  id v11 = v8;
  id v22 = v11;
  id v12 = v6;
  [v9 performTransactionForSyndicationDeleteManager:self name:"-[PLSyndicationDeleteEngine _processDeletesForBundleID:unprefixedIdentifiers:]" transaction:v19];

  uint64_t v18 = 0;
  id v13 = PLSyndicationGetLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    uint64_t v14 = [v11 count];
    uint64_t v15 = [v10 componentsJoinedByString:@","];
    *(_DWORD *)buf = 134218242;
    uint64_t v24 = v14;
    __int16 v25 = 2114;
    __int16 v26 = v15;
    _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_INFO, "Found %tu asset(s) for deletion using unprefixed identifiers: %{public}@", buf, 0x16u);
  }
  [(PLSyndicationDeleteEngine *)self _deleteSyndicationAssetsWithBundleID:v12 syndicationIdentifiers:v11 deleteCount:&v18];
  BOOL v16 = v18 > 0;

  return v16;
}

void __78__PLSyndicationDeleteEngine__processDeletesForBundleID_unprefixedIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = (void *)MEMORY[0x1E4F1C0D0];
  v5 = +[PLManagedAsset entityName];
  id v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = +[PLManagedAsset predicateForSyndicatedAssetIdentifiersSuffix:*(void *)(a1 + 32)];
  v35[0] = v8;
  id v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"additionalAttributes.importedByBundleIdentifier", *(void *)(a1 + 40)];
  v35[1] = v9;
  id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
  uint64_t v11 = [v7 andPredicateWithSubpredicates:v10];

  __int16 v25 = (void *)v11;
  [v6 setPredicate:v11];
  v34 = @"additionalAttributes";
  id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v34 count:1];
  [v6 setRelationshipKeyPathsForPrefetching:v12];

  id v30 = 0;
  id v13 = [v3 executeFetchRequest:v6 error:&v30];
  id v24 = v30;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v14 = v13;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v20 = [v19 additionalAttributes];
        id v21 = [v20 syndicationIdentifier];

        if (v21)
        {
          [*(id *)(a1 + 48) addObject:v21];
        }
        else
        {
          id v22 = PLSyndicationGetLog();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            uint64_t v23 = [v19 uuid];
            *(_DWORD *)buf = 138543362;
            uint64_t v32 = v23;
            _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Unexpected nil syndicationIdentifier on asset %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v33 count:16];
    }
    while (v16);
  }
}

- (PLSyndicationDeleteEngine)initWithLibraryServicesManager:(id)a3
{
  id v4 = a3;
  v5 = [v4 pathManager];
  id v6 = [v5 photoDirectoryWithType:5];
  id v7 = [v6 stringByAppendingPathComponent:@"SyndicationDeleteJournal"];

  id v8 = objc_msgSend(NSString, "stringWithFormat:", @"[sync.delete] L%td", objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier"));
  id v9 = [(PLSyndicationDeleteEngine *)self initWithDelegate:v4 path:v7 logPrefix:v8];

  return v9;
}

- (PLSyndicationDeleteEngine)initWithDelegate:(id)a3 path:(id)a4 logPrefix:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLSyndicationDeleteEngine;
  uint64_t v11 = [(PLSyndicationDeleteEngine *)&v16 init];
  id v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_logPrefix, a5);
    objc_storeStrong((id *)&v12->_path, a4);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.syndicationDeleteManager", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_wellKnownPhotoLibraryIdentifier = [v8 wellKnownPhotoLibraryIdentifier];
  }

  return v12;
}

@end