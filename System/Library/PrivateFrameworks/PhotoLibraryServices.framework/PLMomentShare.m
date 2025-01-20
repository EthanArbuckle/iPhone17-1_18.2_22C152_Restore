@interface PLMomentShare
+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5;
+ (BOOL)supportsCPLScopeType:(int64_t)a3;
+ (PLMomentShare)momentShareWithOriginatingScopeIdentifier:(id)a3 inManagedObjectContext:(id)a4;
+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 inPhotoLibrary:(id)a6;
+ (id)entityName;
+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4;
+ (id)listOfSyncedProperties;
+ (id)momentSharesReferencedInUploadBatchContainer:(id)a3 inPhotoLibrary:(id)a4;
+ (id)scopeIdentifierPrefix;
+ (void)forceSyncMomentShares:(id)a3 photoLibrary:(id)a4;
- (BOOL)_isOwnerInContacts;
- (BOOL)_shouldAutoAccept;
- (BOOL)isSyncableChange;
- (BOOL)supportsCloudUpload;
- (id)_contactStore;
- (id)cplScopeChange;
- (unint64_t)estimateUploadSize;
- (void)_updateWithScopeChange:(id)a3;
- (void)autoAcceptShareIfNecessary;
- (void)calculatePropertyValues;
- (void)computeUploadedAssetCountsUsingAssetRelationship;
- (void)prepareForDeletion;
- (void)publishWithCompletionHandler:(id)a3;
- (void)trash;
- (void)willSave;
@end

@implementation PLMomentShare

+ (id)momentSharesReferencedInUploadBatchContainer:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v22 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  v6 = [v5 batch];
  v7 = [v6 records];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v36 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          v12 = [v11 scopedIdentifier];
          v13 = [v12 scopeIdentifier];
          v14 = [(id)objc_opt_class() scopeIdentifierPrefix];
          int v15 = [v13 hasPrefix:v14];

          if (v15)
          {
            v16 = [v12 scopeIdentifier];
            [v23 addObject:v16];
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v8);
  }

  uint64_t v29 = 0;
  v30 = &v29;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy__85462;
  v33 = __Block_byref_object_dispose__85463;
  id v34 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __77__PLMomentShare_momentSharesReferencedInUploadBatchContainer_inPhotoLibrary___block_invoke;
  v24[3] = &unk_1E5875368;
  id v17 = v23;
  id v25 = v17;
  v28 = &v29;
  id v18 = v5;
  id v26 = v18;
  id v19 = v22;
  id v27 = v19;
  [v19 performBlockAndWait:v24];
  id v20 = (id)v30[5];

  _Block_object_dispose(&v29, 8);
  return v20;
}

void __77__PLMomentShare_momentSharesReferencedInUploadBatchContainer_inPhotoLibrary___block_invoke(uint64_t a1)
{
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"scopeIdentifier IN %@", *(void *)(a1 + 32)];
  v2 = [*(id *)(a1 + 40) batch];
  uint64_t v3 = [v2 count];
  v4 = [*(id *)(a1 + 48) managedObjectContext];
  uint64_t v5 = +[PLShare sharesWithPredicate:v8 fetchLimit:v3 inManagedObjectContext:v4];
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (unint64_t)estimateUploadSize
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v3 = [(PLMomentShare *)self momentShareAssets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) fetchSourceAssetForDuplicationIfExists];
        v10 = v9;
        if (v9)
        {
          uint64_t v11 = [v9 master];
          if (v11)
          {
            v12 = (void *)v11;
            v13 = [v10 master];
            int v14 = [v13 cloudLocalState];

            if (v14 != 3) {
              v6 += [v10 originalFilesize];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  int v15 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    v16 = [(PLShare *)self compactDescription];
    *(_DWORD *)buf = 138412546;
    id v23 = v16;
    __int16 v24 = 2048;
    unint64_t v25 = v6;
    _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Estimate upload size for moment share %@: %lld", buf, 0x16u);
  }
  return v6;
}

- (BOOL)_isOwnerInContacts
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(PLShare *)self owner];
  uint64_t v4 = [v3 emailAddress];
  uint64_t v5 = [v3 phoneNumber];
  unint64_t v6 = [(PLMomentShare *)self _contactStore];
  unint64_t v7 = 0x1E4F1B000uLL;
  if ([v4 length])
  {
    id v8 = [MEMORY[0x1E4F1B8F8] predicateForContactsMatchingEmailAddress:v4];
    id v31 = 0;
    uint64_t v9 = [v6 unifiedContactsMatchingPredicate:v8 keysToFetch:MEMORY[0x1E4F1CBF0] error:&v31];
    id v10 = v31;
    uint64_t v11 = v10;
    if (v9) {
      BOOL v12 = 1;
    }
    else {
      BOOL v12 = v10 == 0;
    }
    if (v12)
    {
      uint64_t v29 = v6;
      uint64_t v13 = [v9 count];
      id v17 = PLBackendSharingGetLog();
      BOOL v14 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (!v14)
        {
          BOOL v16 = 1;
LABEL_30:
          unint64_t v6 = v29;

          goto LABEL_31;
        }
        int v15 = [(PLShare *)self compactDescription];
        *(_DWORD *)buf = 138412546;
        v33 = v15;
        __int16 v34 = 2112;
        long long v35 = v8;
        BOOL v16 = 1;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Found local contact matching predicate [email=%@]", buf, 0x16u);
        goto LABEL_29;
      }
      if (v14)
      {
        long long v21 = [(PLShare *)self compactDescription];
        *(_DWORD *)buf = 138412546;
        v33 = v21;
        __int16 v34 = 2112;
        long long v35 = v8;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Did not find local contact matching predicate [email=%@", buf, 0x16u);
      }
      unint64_t v6 = v29;
    }
    else
    {
      id v17 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        [(PLShare *)self compactDescription];
        v20 = long long v19 = v6;
        *(_DWORD *)buf = 138412802;
        v33 = v20;
        __int16 v34 = 2112;
        long long v35 = v4;
        __int16 v36 = 2112;
        long long v37 = v11;
        _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_ERROR, "Auto Accept CMM: %@, Error attempting to fetch all unified contacts matching predicate [email=%@] : %@", buf, 0x20u);

        unint64_t v6 = v19;
        unint64_t v7 = 0x1E4F1B000;
      }
    }
  }
  if ([v5 length])
  {
    id v8 = [MEMORY[0x1E4F1BA70] phoneNumberWithStringValue:v5];
    uint64_t v11 = [*(id *)(v7 + 2296) predicateForContactsMatchingPhoneNumber:v8];
    id v30 = 0;
    uint64_t v29 = v6;
    id v17 = [v6 unifiedContactsMatchingPredicate:v11 keysToFetch:MEMORY[0x1E4F1CBF0] error:&v30];
    id v22 = v30;
    uint64_t v9 = v22;
    if (v17 || !v22)
    {
      uint64_t v24 = [v17 count];
      int v15 = PLBackendSharingGetLog();
      BOOL v25 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v24)
      {
        if (v25)
        {
          id v26 = [(PLShare *)self compactDescription];
          *(_DWORD *)buf = 138412546;
          v33 = v26;
          __int16 v34 = 2112;
          long long v35 = v11;
          BOOL v16 = 1;
          _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Found local contact matching predicate [phone=%@]", buf, 0x16u);
        }
        else
        {
          BOOL v16 = 1;
        }
        goto LABEL_29;
      }
      if (v25)
      {
        uint64_t v27 = [(PLShare *)self compactDescription];
        *(_DWORD *)buf = 138412546;
        v33 = v27;
        __int16 v34 = 2112;
        long long v35 = v11;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_INFO, "Auto Accept CMM: %@, Did not find local contact matching predicate [phone=%@", buf, 0x16u);
      }
    }
    else
    {
      int v15 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        id v23 = [(PLShare *)self compactDescription];
        *(_DWORD *)buf = 138412802;
        v33 = v23;
        __int16 v34 = 2112;
        long long v35 = v5;
        __int16 v36 = 2112;
        long long v37 = v9;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Auto Accept CMM: %@, Error attempting to fetch all unified contacts matching predicate [phone=%@] : %@", buf, 0x20u);
      }
    }
    BOOL v16 = 0;
LABEL_29:

    goto LABEL_30;
  }
  BOOL v16 = 0;
LABEL_31:

  return v16;
}

- (id)_contactStore
{
  if (_contactStore_onceToken != -1) {
    dispatch_once(&_contactStore_onceToken, &__block_literal_global_85532);
  }
  v2 = (void *)_contactStore_contactStore;
  return v2;
}

void __30__PLMomentShare__contactStore__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1B980]);
  v1 = (void *)_contactStore_contactStore;
  _contactStore_contactStore = (uint64_t)v0;
}

- (void)trash
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)PLMomentShare;
  [(PLShare *)&v15 trash];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v3 = [(PLMomentShare *)self momentShareAssets];
  uint64_t v4 = (void *)[v3 copy];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
        [MEMORY[0x1E4F8BA10] maskForAutoDeleteAssetsUponMomentShareTrash];
        [v9 savedAssetType];
        if (PLValidatedSavedAssetTypeApplies())
        {
          id v10 = +[PLAssetTransactionReason transactionReason:@"Deleting asset as moment share was trashed"];
          [v9 deleteWithReason:v10];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BOOL)_shouldAutoAccept
{
  int v3 = [(PLMomentShare *)self status];
  if (v3 != 1) {
    LOBYTE(v3) = [(PLMomentShare *)self assetCount] <= 0x1F3
  }
              && [(PLMomentShare *)self _isOwnerInContacts];
  return v3;
}

- (void)autoAcceptShareIfNecessary
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if ([(PLMomentShare *)self _shouldAutoAccept])
  {
    int v3 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = [(PLShare *)self compactDescription];
      *(_DWORD *)buf = 138412290;
      uint64_t v7 = v4;
      _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_INFO, "Auto-accept moment share %@", buf, 0xCu);
    }
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __43__PLMomentShare_autoAcceptShareIfNecessary__block_invoke;
    v5[3] = &unk_1E5873440;
    v5[4] = self;
    [(PLShare *)self acceptWithCompletionHandler:v5];
  }
}

void __43__PLMomentShare_autoAcceptShareIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v5 = [*(id *)(a1 + 32) compactDescription];
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "Failed to auto accept moment share %@: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)publishWithCompletionHandler:(id)a3
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(PLManagedObject *)self photoLibrary];
  int v6 = [v5 libraryServicesManager];
  uint64_t v7 = [v6 cloudPhotoLibraryManager];

  if (v7)
  {
    [(PLMomentShare *)self setLocalPublishState:1];
    __int16 v8 = [(PLMomentShare *)self cplScopeChange];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __46__PLMomentShare_publishWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E5870640;
    id v13 = v5;
    long long v14 = self;
    id v15 = v4;
    [v7 publishCPLScopeChange:v8 completionHandler:v12];

    id v9 = v13;
  }
  else
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F8C500];
    uint64_t v16 = *MEMORY[0x1E4F28568];
    v17[0] = @"PLCloudPhotoLibraryManager is not available";
    __int16 v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    id v9 = [v10 errorWithDomain:v11 code:41004 userInfo:v8];
    (*((void (**)(id, void, void, void *))v4 + 2))(v4, 0, 0, v9);
  }
}

void __46__PLMomentShare_publishWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 share];
  __int16 v8 = [v7 URL];
  id v9 = *(void **)(a1 + 32);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __46__PLMomentShare_publishWithCompletionHandler___block_invoke_2;
  v21[3] = &unk_1E5870618;
  id v10 = v6;
  uint64_t v11 = *(void *)(a1 + 40);
  id v22 = v10;
  uint64_t v23 = v11;
  id v24 = v8;
  id v25 = v5;
  id v26 = *(id *)(a1 + 32);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __46__PLMomentShare_publishWithCompletionHandler___block_invoke_80;
  v16[3] = &unk_1E58710F0;
  id v12 = *(id *)(a1 + 48);
  id v17 = v24;
  id v18 = v25;
  id v19 = v10;
  id v20 = v12;
  id v13 = v10;
  id v14 = v25;
  id v15 = v24;
  [v9 performTransaction:v21 completionHandler:v16 withPriority:1];
}

void __46__PLMomentShare_publishWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (!*(void *)(a1 + 32))
  {
    if (*(void *)(a1 + 48))
    {
      objc_msgSend(*(id *)(a1 + 40), "setShareURL:");
    }
    else
    {
      id v5 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        id v6 = [*(id *)(a1 + 40) compactDescription];
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_ERROR, "Missing moment shareURL after publishing share %@", (uint8_t *)&v16, 0xCu);
      }
    }
    [*(id *)(a1 + 40) setLocalPublishState:2];
    uint64_t v7 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      __int16 v8 = [*(id *)(a1 + 40) compactDescription];
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Published moment share %@", (uint8_t *)&v16, 0xCu);
    }
    v2 = *(id *)(a1 + 56);
    id v3 = [v2 expiryDate];
    if (v3)
    {
      [*(id *)(a1 + 40) setExpiryDate:v3];
    }
    else
    {
      id v9 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        id v10 = [*(id *)(a1 + 40) compactDescription];
        int v16 = 138412290;
        id v17 = v10;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Missing expiryDate after publishing moment share %@", (uint8_t *)&v16, 0xCu);
      }
    }
    if ([*(id *)(a1 + 40) shouldIgnoreBudgets])
    {
      uint64_t v11 = [*(id *)(a1 + 40) scopeIdentifier];
      id v12 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [*(id *)(a1 + 40) compactDescription];
        int v16 = 138412290;
        id v17 = v13;
        _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Boosting priority for moment share %@ after publish", (uint8_t *)&v16, 0xCu);
      }
      id v14 = [*(id *)(a1 + 64) libraryServicesManager];
      id v15 = [v14 cloudPhotoLibraryManager];
      [v15 boostPriorityForMomentShareWithScopeIdentifier:v11 completionHandler:0];
    }
    goto LABEL_20;
  }
  [*(id *)(a1 + 40) setLocalPublishState:3];
  v2 = PLBackendSharingGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    id v3 = [*(id *)(a1 + 40) compactDescription];
    uint64_t v4 = *(void *)(a1 + 32);
    int v16 = 138412546;
    id v17 = v3;
    __int16 v18 = 2112;
    uint64_t v19 = v4;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_ERROR, "Failed to publish moment share %@: %@", (uint8_t *)&v16, 0x16u);
LABEL_20:
  }
}

uint64_t __46__PLMomentShare_publishWithCompletionHandler___block_invoke_80(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6]);
}

- (id)cplScopeChange
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PLMomentShare *)self scopeIdentifier];
  if (!v4)
  {
    long long v35 = [MEMORY[0x1E4F28B00] currentHandler];
    [v35 handleFailureInMethod:a2 object:self file:@"PLMomentShare.m" lineNumber:305 description:@"Missing scope identifier for moment share"];
  }
  v39 = (void *)v4;
  id v5 = objc_msgSend(MEMORY[0x1E4F598E8], "newScopeChangeWithScopeIdentifier:type:", v4, -[PLShare scopeType](self, "scopeType"));
  id v6 = [(PLMomentShare *)self title];
  [v5 setTitle:v6];

  uint64_t v7 = [(PLMomentShare *)self creationDate];
  [v5 setCreationDate:v7];

  __int16 v8 = [(PLMomentShare *)self startDate];
  [v5 setStartDate:v8];

  id v9 = [(PLMomentShare *)self endDate];
  [v5 setEndDate:v9];

  objc_msgSend(v5, "setPromisedAssetCount:", (int)-[PLMomentShare assetCount](self, "assetCount"));
  objc_msgSend(v5, "setPromisedPhotosCount:", (int)-[PLMomentShare photosCount](self, "photosCount"));
  objc_msgSend(v5, "setPromisedVideosCount:", (int)-[PLMomentShare videosCount](self, "videosCount"));
  id v10 = [(PLMomentShare *)self originatingScopeIdentifier];
  [v5 setOriginatingScopeIdentifier:v10];

  uint64_t v11 = [(PLMomentShare *)self thumbnailImageData];
  unint64_t v12 = [v11 length];
  long long v37 = v11;
  if (v12 <= [MEMORY[0x1E4F59910] maxInlineDataSize])
  {
    [v5 setThumbnailImageData:v11];
  }
  else
  {
    id v13 = NSString;
    uint64_t v14 = [MEMORY[0x1E4F59910] maxInlineDataSize];
    id v15 = [(PLMomentShare *)self scopeIdentifier];
    int v16 = [v13 stringWithFormat:@"Setting thumbnail image data that is more than %ld bytes to moment share %@, it will not be synced", v14, v15];

    PLSimulateCrash();
  }
  id v17 = [(PLMomentShare *)self previewData];
  uint64_t v38 = v5;
  [v5 setPreviewImageData:v17];

  id v18 = objc_alloc_init(MEMORY[0x1E4F59970]);
  uint64_t v19 = [(PLMomentShare *)self shareURL];
  [v18 setURL:v19];

  __int16 v36 = v18;
  objc_msgSend(v18, "setPublicPermission:", -[PLShare publicPermission](self, "publicPermission"));
  uint64_t v20 = (void *)MEMORY[0x1E4F1CA48];
  long long v21 = [(PLMomentShare *)self participants];
  id v22 = objc_msgSend(v20, "arrayWithCapacity:", objc_msgSend(v21, "count"));

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v23 = [(PLMomentShare *)self participants];
  uint64_t v24 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v41 != v26) {
          objc_enumerationMutation(v23);
        }
        v28 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v29 = objc_alloc(MEMORY[0x1E4F59978]);
        id v30 = [v28 emailAddress];
        id v31 = (void *)[v29 initWithEmail:v30];

        v32 = [v28 phoneNumber];
        [v31 setPhoneNumber:v32];

        objc_msgSend(v31, "setPermission:", objc_msgSend(v28, "permission"));
        [v22 addObject:v31];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v25);
  }

  [v36 setParticipants:v22];
  v33 = [(PLMomentShare *)self expiryDate];
  [v38 setExpiryDate:v33];

  [v38 setShare:v36];
  return v38;
}

- (BOOL)isSyncableChange
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v2 = [(PLMomentShare *)self changedValues];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend((id)objc_opt_class(), "listOfSyncedProperties", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = [v2 objectForKey:*(void *)(*((void *)&v9 + 1) + 8 * i)];

        if (v7)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)supportsCloudUpload
{
  return 1;
}

- (void)calculatePropertyValues
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(PLMomentShare *)self momentShareAssets];
  uint64_t v2 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    LODWORD(v4) = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    __int16 v8 = 0;
    uint64_t v9 = *(void *)v19;
    do
    {
      int v16 = v4;
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        long long v12 = [v11 dateCreated];
        if (!v8 || [v8 compare:v12] == 1)
        {
          id v13 = v12;

          __int16 v8 = v13;
        }
        if (!v7 || [v7 compare:v12] == -1)
        {
          id v14 = v12;

          uint64_t v7 = v14;
        }
        if ([v11 isPhoto]) {
          uint64_t v5 = (v5 + 1);
        }
        else {
          uint64_t v6 = v6 + [v11 isVideo];
        }
      }
      uint64_t v4 = (v16 + v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    __int16 v8 = 0;
  }

  [(PLMomentShare *)self setStartDate:v8];
  [(PLMomentShare *)self setEndDate:v7];
  [(PLMomentShare *)self setAssetCount:v4];
  [(PLMomentShare *)self setPhotosCount:v5];
  [(PLMomentShare *)self setVideosCount:v6];
}

- (void)willSave
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)PLMomentShare;
  [(PLManagedObject *)&v11 willSave];
  uint64_t v3 = [(PLMomentShare *)self changedValues];
  if ([(PLMomentShare *)self isUpdated])
  {
    uint64_t v4 = [v3 objectForKey:@"shouldIgnoreBudgets"];
    int v5 = [v4 BOOLValue];

    if (v5)
    {
      uint64_t v6 = [(PLMomentShare *)self scopeIdentifier];
      uint64_t v7 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v6;
        _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_INFO, "Should ignore budgets flag is updated for moment share %@, boosting its priority", buf, 0xCu);
      }

      __int16 v8 = [(PLManagedObject *)self photoLibrary];
      uint64_t v9 = [v8 libraryServicesManager];
      long long v10 = [v9 cloudPhotoLibraryManager];

      [v10 boostPriorityForMomentShareWithScopeIdentifier:v6 completionHandler:0];
    }
  }
}

- (void)prepareForDeletion
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PLMomentShare;
  [(PLShare *)&v16 prepareForDeletion];
  uint64_t v3 = [(PLMomentShare *)self managedObjectContext];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && ([v3 mergingChanges] & 1) == 0)
  {
    uint64_t v4 = [(PLManagedObject *)self pathManager];
    int v5 = [v4 isDCIM];

    if (v5)
    {
      uint64_t v6 = [MEMORY[0x1E4F8B980] systemLibraryPathManager];
      uint64_t v7 = [v6 privateDirectoryWithSubType:7];

      __int16 v8 = [(PLMomentShare *)self uuid];
      uint64_t v9 = [v7 stringByAppendingPathComponent:v8];

      long long v10 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v18 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Deleting CMMAsset subdirectory: %@", buf, 0xCu);
      }

      objc_super v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      id v15 = 0;
      char v12 = [v11 removeItemAtPath:v9 error:&v15];
      id v13 = v15;

      if ((v12 & 1) == 0)
      {
        uint64_t v14 = PLBackendSharingGetLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          long long v18 = v9;
          __int16 v19 = 2112;
          id v20 = v13;
          _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Failed to delete CMMAsset subdirectory: %@, %@", buf, 0x16u);
        }
      }
    }
  }
}

- (void)computeUploadedAssetCountsUsingAssetRelationship
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v3 = [(PLMomentShare *)self momentShareAssets];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v3);
        }
        long long v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [MEMORY[0x1E4F8BA10] maskForMomentSharedAsset];
        [v10 savedAssetType];
        if (PLValidatedSavedAssetTypeApplies())
        {
          objc_super v11 = [v10 master];

          if (v11)
          {
            if ([v10 isPhoto]) {
              uint64_t v7 = (v7 + 1);
            }
            else {
              uint64_t v6 = v6 + [v10 isVideo];
            }
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v5);
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v7 = 0;
  }

  if ((int)v7 <= (int)[(PLMomentShare *)self uploadedPhotosCount])
  {
    char v12 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v13 = [(PLMomentShare *)self uploadedPhotosCount];
      *(_DWORD *)buf = 67109376;
      int v21 = v13;
      __int16 v22 = 1024;
      int v23 = v7;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Dropping uploadedPhotosCount in computeUploadedAssetCountsUsingAssetRelationship. Persisted count: %d, pending count: %d", buf, 0xEu);
    }
  }
  else
  {
    [(PLMomentShare *)self setUploadedPhotosCount:v7];
  }
  if ((int)v6 <= (int)[(PLMomentShare *)self uploadedVideosCount])
  {
    uint64_t v14 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      int v15 = [(PLMomentShare *)self uploadedVideosCount];
      *(_DWORD *)buf = 67109376;
      int v21 = v15;
      __int16 v22 = 1024;
      int v23 = v6;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Dropping uploadedVideosCount in computeUploadedAssetCountsUsingAssetRelationship. Persisted count: %d, pending count: %d", buf, 0xEu);
    }
  }
  else
  {
    [(PLMomentShare *)self setUploadedVideosCount:v6];
  }
}

- (void)_updateWithScopeChange:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [v4 scopeType];
  if (v5 > 6)
  {
LABEL_6:
    uint64_t v7 = 0;
    goto LABEL_8;
  }
  if (((1 << v5) & 0x73) != 0)
  {
    uint64_t v6 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Unexpected scopeType for moment share from scopeChange %@", (uint8_t *)&buf, 0xCu);
    }

    goto LABEL_6;
  }
  uint64_t v7 = 2;
LABEL_8:
  [(PLMomentShare *)self setLocalPublishState:v7];
  if ([(PLMomentShare *)self status] != 1)
  {
    uint64_t v8 = [v4 assetCountPerType];
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x2020000000;
    int v16 = 0;
    uint64_t v10 = 0;
    objc_super v11 = &v10;
    uint64_t v12 = 0x2020000000;
    int v13 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __40__PLMomentShare__updateWithScopeChange___block_invoke;
    v9[3] = &unk_1E58705F0;
    v9[4] = &buf;
    v9[5] = &v10;
    [v8 enumerateKeysAndObjectsUsingBlock:v9];
    [(PLMomentShare *)self setUploadedPhotosCount:*(unsigned int *)(*((void *)&buf + 1) + 24)];
    [(PLMomentShare *)self setUploadedVideosCount:*((unsigned int *)v11 + 6)];
    _Block_object_dispose(&v10, 8);
    _Block_object_dispose(&buf, 8);
  }
}

void __40__PLMomentShare__updateWithScopeChange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  unint64_t v5 = [MEMORY[0x1E4F442D8] typeWithIdentifier:a2];
  if ([v5 conformsToType:*MEMORY[0x1E4F44400]])
  {
    int v6 = [v8 integerValue];
    uint64_t v7 = a1 + 32;
  }
  else
  {
    if (![v5 conformsToType:*MEMORY[0x1E4F44448]]) {
      goto LABEL_6;
    }
    int v6 = [v8 integerValue];
    uint64_t v7 = a1 + 40;
  }
  *(_DWORD *)(*(void *)(*(void *)v7 + 8) + 24) += v6;
LABEL_6:
}

+ (BOOL)supportsCPLScopeType:(int64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

+ (void)forceSyncMomentShares:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  long long v19 = __Block_byref_object_copy__85462;
  id v20 = __Block_byref_object_dispose__85463;
  id v21 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  uint64_t v12 = __52__PLMomentShare_forceSyncMomentShares_photoLibrary___block_invoke;
  int v13 = &unk_1E5875E68;
  id v7 = v5;
  id v14 = v7;
  uint64_t v15 = &v16;
  [v6 performTransactionAndWait:&v10];
  if (objc_msgSend((id)v17[5], "count", v10, v11, v12, v13))
  {
    id v8 = [v6 libraryServicesManager];
    uint64_t v9 = [v8 cloudPhotoLibraryManager];

    [v9 forceSyncMomentSharesWithScopeIdentifiers:v17[5]];
  }

  _Block_object_dispose(&v16, 8);
}

void __52__PLMomentShare_forceSyncMomentShares_photoLibrary___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        id v8 = objc_msgSend(v7, "scopeIdentifier", (void)v11);

        if (v8)
        {
          uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
          uint64_t v10 = [v7 scopeIdentifier];
          [v9 addObject:v10];
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v4);
  }
}

+ (id)listOfSyncedProperties
{
  pl_dispatch_once();
  id v2 = (void *)listOfSyncedProperties_result_85589;
  return v2;
}

void __39__PLMomentShare_listOfSyncedProperties__block_invoke()
{
  uint64_t v0 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C978]), "initWithObjects:", @"shareURL", @"trashedState", @"localPublishState", 0);
  v1 = (void *)listOfSyncedProperties_result_85589;
  listOfSyncedProperties_result_85589 = v0;
}

+ (BOOL)shouldAllowFetchURLWithScopeChange:(id)a3 photoLibrary:(id)a4 error:(id *)a5
{
  return 1;
}

+ (PLMomentShare)momentShareWithOriginatingScopeIdentifier:(id)a3 inManagedObjectContext:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28F60];
  id v7 = a4;
  id v8 = [v6 predicateWithFormat:@"%K == %@", @"originatingScopeIdentifier", a3];
  uint64_t v9 = [a1 sharesWithPredicate:v8 fetchLimit:1 inManagedObjectContext:v7];

  uint64_t v10 = [v9 firstObject];

  return (PLMomentShare *)v10;
}

+ (id)entityName
{
  return @"MomentShare";
}

+ (id)scopeIdentifierPrefix
{
  return (id)*MEMORY[0x1E4F59818];
}

+ (id)insertOrUpdateShareWithCPLScopeChange:(id)a3 inPhotoLibrary:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 scopeIdentifier];
  if ([a1 validateCPLScopeChange:v6])
  {
    uint64_t v9 = [v7 managedObjectContext];
    uint64_t v10 = [a1 shareWithScopeIdentifier:v8 includeTrashed:1 inManagedObjectContext:v9];

    if (!v10)
    {
      long long v11 = PLBackendSharingGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        uint64_t v25 = v8;
        _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_INFO, "Creating moment share with scope identifier %@", (uint8_t *)&v24, 0xCu);
      }

      uint64_t v10 = [a1 insertInPhotoLibrary:v7];
      [v10 setStatus:2];
      [v10 setScopeIdentifier:v8];
    }
    long long v12 = PLBackendSharingGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      long long v13 = [v10 compactDescription];
      int v24 = 138412546;
      uint64_t v25 = v13;
      __int16 v26 = 2112;
      id v27 = v6;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_INFO, "Updating moment share %@ with CPLMomentShareScopeChange %@", (uint8_t *)&v24, 0x16u);
    }
    long long v14 = [v6 creationDate];
    [v10 setCreationDate:v14];

    uint64_t v15 = [v6 title];
    [v10 setTitle:v15];

    uint64_t v16 = [v6 startDate];
    [v10 setStartDate:v16];

    uint64_t v17 = [v6 endDate];
    [v10 setEndDate:v17];

    uint64_t v18 = [v6 expiryDate];
    [v10 setExpiryDate:v18];

    objc_msgSend(v10, "setAssetCount:", objc_msgSend(v6, "promisedAssetCount"));
    objc_msgSend(v10, "setPhotosCount:", objc_msgSend(v6, "promisedPhotosCount"));
    objc_msgSend(v10, "setVideosCount:", objc_msgSend(v6, "promisedVideosCount"));
    long long v19 = [v6 originatingScopeIdentifier];
    [v10 setOriginatingScopeIdentifier:v19];

    id v20 = [v6 thumbnailImageData];
    [v10 setThumbnailImageData:v20];

    id v21 = [v6 previewImageData];
    [v10 setPreviewData:v21];

    objc_msgSend(v10, "setScopeType:", objc_msgSend(v6, "scopeType"));
    __int16 v22 = [v6 share];
    [v10 updateShareWithCPLShare:v22 inPhotoLibrary:v7];
    [v10 _updateWithScopeChange:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

+ (id)createOwnedShareWithUUID:(id)a3 creationDate:(id)a4 title:(id)a5 inPhotoLibrary:(id)a6
{
  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS___PLMomentShare;
  id v6 = objc_msgSendSuper2(&v8, sel_createOwnedShareWithUUID_creationDate_title_inPhotoLibrary_, a3, a4, a5, a6);
  [v6 setScopeType:2];
  return v6;
}

@end