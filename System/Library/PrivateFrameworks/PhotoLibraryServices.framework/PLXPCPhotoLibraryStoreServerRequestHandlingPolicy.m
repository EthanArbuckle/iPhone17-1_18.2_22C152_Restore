@interface PLXPCPhotoLibraryStoreServerRequestHandlingPolicy
- (BOOL)_restrictedLockedContentAccessAllowedForContext:(id)a3;
- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3;
- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3;
- (PLXPCPhotoLibraryStoreServerRequestHandlingPolicy)init;
- (PLXPCPhotoLibraryStoreServerRequestHandlingPolicy)initWithConnectionAuthorization:(id)a3;
- (id)_assetFilterPredicateWithClientContext:(id)a3;
- (id)_captureSessionPredicateForEntityName:(id)a3;
- (id)_entityNamesAllowedByRestrictedDataEntitlements:(id)a3;
- (id)_filterPredicateForEntityName:(id)a3 withClientContext:(id)a4;
- (id)_internalResourceFilterPredicate;
- (id)_limitedLibraryFilterPredicateForEntityName:(id)a3 withClientContext:(id)a4;
- (id)_lockedCaptureSessionPredicateForEntityName:(id)a3 sessionIdentifier:(id)a4;
- (id)_predicateForEntityName:(id)a3 captureSessionState:(id)a4;
- (id)_restrictedEntityNamesAllowedForContext:(id)a3;
- (id)allowableClassesForClientWithContext:(id)a3;
- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6;
- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5;
- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4;
- (void)clearCrashLogMessage;
- (void)dealloc;
- (void)limitedLibraryFetchFiltersUpdated:(id)a3;
- (void)setCrashLogMessageForRequest:(id)a3 context:(id)a4;
@end

@implementation PLXPCPhotoLibraryStoreServerRequestHandlingPolicy

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedAccessLock_lockedContentAccessAllowed, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilter, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilterEnabledStatus, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilterEntityNameToPredicateMap, 0);
  objc_storeStrong((id *)&self->_fetchFilterLock_fetchFilterClientIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

- (void)clearCrashLogMessage
{
  if (MEMORY[0x19F38BDA0](self, a2))
  {
    PLRunWithUnfairLock();
  }
}

void __73__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy_clearCrashLogMessage__block_invoke()
{
  qword_1E93E3018 = 0;
}

- (void)setCrashLogMessageForRequest:(id)a3 context:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (MEMORY[0x19F38BDA0]())
  {
    if (v6) {
      [v6 auditToken];
    }
    v7 = PLClientApplicationIdentifierFromAuditToken();
    v9 = [NSString stringWithFormat:@"XPC [%@] %@", v7, v5];
    id v8 = v9;
    PLRunWithUnfairLock();
  }
}

size_t __90__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy_setCrashLogMessageForRequest_context___block_invoke(uint64_t a1)
{
  size_t result = strlcpy((char *)(*(void *)(a1 + 32) + 60), (const char *)[*(id *)(a1 + 40) UTF8String], 0x800uLL);
  qword_1E93E3018 = *(void *)(a1 + 32) + 60;
  return result;
}

- (id)processRequest:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self setCrashLogMessageForRequest:v8 context:v9];
  if ([v8 requestType] != 1) {
    goto LABEL_6;
  }
  v10 = [v8 entityName];
  v11 = +[PLPhotosHighlight entityName];
  int v12 = [v10 isEqualToString:v11];

  if (!v12) {
    goto LABEL_6;
  }
  v13 = v8;
  v14 = (void *)MEMORY[0x1E4F1CAD0];
  v15 = [v13 propertiesToFetch];
  v16 = [v14 setWithArray:v15];

  v17 = +[PLPhotosHighlight allowedPropertiesForMomentList];
  char v18 = [v16 isSubsetOfSet:v17];

  if ([v13 resultType] && (v18 & 1) != 0)
  {

LABEL_6:
    PLBackendGetLog();
    v19 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v20 = os_signpost_id_generate(v19);

    v21 = v19;
    v22 = v21;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = [v8 requestType];
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_BEGIN, v20, "XPCStoreRequest", "type: %lu", buf, 0xCu);
    }

    v27.receiver = self;
    v27.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
    v23 = [(NSXPCStoreServerRequestHandlingPolicy *)&v27 processRequest:v8 fromClientWithContext:v9 error:a5];
    v24 = v22;
    v16 = v24;
    if (v20 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v20, "XPCStoreRequest", "", buf, 2u);
    }
    v13 = v16;
    goto LABEL_13;
  }
  v26 = PLBackendGetLog();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    uint64_t v29 = (uint64_t)v13;
    _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_DEFAULT, "Disallowed PhotosHighlight store request: %{public}@", buf, 0xCu);
  }

  v23 = 0;
LABEL_13:

  [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self clearCrashLogMessage];
  return v23;
}

- (id)_lockedCaptureSessionPredicateForEntityName:(id)a3 sessionIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  id v8 = +[PLManagedAsset entityName];
  int v9 = [v5 isEqual:v8];

  if (v9)
  {
    uint64_t v10 = +[PLManagedAsset predicateToLimitToCaptureSessionIdentifier:v6];
LABEL_6:
    v15 = (void *)v10;

    v7 = v15;
    goto LABEL_7;
  }
  v11 = +[PLAdditionalAssetAttributes entityName];
  int v12 = [v5 isEqual:v11];

  if (v12
    || (+[PLInternalResource entityName],
        v13 = objc_claimAutoreleasedReturnValue(),
        int v14 = [v5 isEqual:v13],
        v13,
        v14))
  {
    uint64_t v10 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", @"asset.captureSessionIdentifier", v6];
    goto LABEL_6;
  }
LABEL_7:

  return v7;
}

- (id)_predicateForEntityName:(id)a3 captureSessionState:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = 0;
  switch([v7 type])
  {
    case 0:
      int v9 = PLBackendGetLog();
      if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO)) {
        goto LABEL_7;
      }
      connectionAuthorization = self->_connectionAuthorization;
      *(_DWORD *)buf = 138543362;
      v25 = connectionAuthorization;
      v11 = "Capture Session: [client %{public}@] Blocking XPC store access due to unknown state";
      int v12 = v9;
      os_log_type_t v13 = OS_LOG_TYPE_INFO;
      uint32_t v14 = 12;
      goto LABEL_6;
    case 1:
    case 3:
      goto LABEL_16;
    case 2:
      uint64_t v16 = objc_opt_class();
      id v17 = v7;
      if (!v17) {
        goto LABEL_14;
      }
      if (objc_opt_isKindOfClass()) {
        char v18 = v17;
      }
      else {
        char v18 = 0;
      }
      id v19 = v18;
      if (!v19)
      {
        os_signpost_id_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
        v21 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
        [v20 handleFailureInFunction:v21, @"PLHelperExtension.h", 78, @"Expected class of %@ but was %@", v16, objc_opt_class() file lineNumber description];

LABEL_14:
        id v19 = 0;
      }

      v22 = [v19 sessionIdentifier];
      id v8 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _lockedCaptureSessionPredicateForEntityName:v6 sessionIdentifier:v22];

LABEL_16:
      return v8;
    default:
      int v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v15 = self->_connectionAuthorization;
        *(_DWORD *)buf = 138543618;
        v25 = v15;
        __int16 v26 = 2114;
        id v27 = v7;
        v11 = "Capture Session: [client %{public}@] Unexpected state for XPC store predicate: %{public}@";
        int v12 = v9;
        os_log_type_t v13 = OS_LOG_TYPE_ERROR;
        uint32_t v14 = 22;
LABEL_6:
        _os_log_impl(&dword_19B3C7000, v12, v13, v11, buf, v14);
      }
LABEL_7:

      id v8 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
      goto LABEL_16;
  }
}

- (id)_captureSessionPredicateForEntityName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization captureSessionState];
  if (v5)
  {
    uint64_t v6 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _predicateForEntityName:v4 captureSessionState:v5];
  }
  else
  {
    id v7 = PLBackendGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      connectionAuthorization = self->_connectionAuthorization;
      int v13 = 138543362;
      uint32_t v14 = connectionAuthorization;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Capture Session: [client %{public}@] State is unexpectedly nil, blocking XPC store access", (uint8_t *)&v13, 0xCu);
    }

    uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithValue:0];
  }
  int v9 = (void *)v6;
  uint64_t v10 = PLBackendGetLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = self->_connectionAuthorization;
    int v13 = 138543874;
    uint32_t v14 = v11;
    __int16 v15 = 2114;
    id v16 = v4;
    __int16 v17 = 2112;
    char v18 = v9;
    _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_INFO, "Capture Session: [client %{public}@] Predicate for entity %{public}@: %@", (uint8_t *)&v13, 0x20u);
  }

  return v9;
}

- (void)limitedLibraryFetchFiltersUpdated:(id)a3
{
}

void __87__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy_limitedLibraryFetchFiltersUpdated___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 48))
  {
    v2 = PLBackendGetLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(*(void *)(a1 + 32) + 24);
      int v8 = 138543362;
      uint64_t v9 = v3;
      _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEFAULT, "Clearing Fetch Filter for connection with client: %{public}@", (uint8_t *)&v8, 0xCu);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    id v5 = *(void **)(v4 + 48);
    *(void *)(v4 + 48) = 0;

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 32);
    *(void *)(v6 + 32) = 0;
  }
}

- (id)_limitedLibraryFilterPredicateForEntityName:(id)a3 withClientContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (PLPlatformLimitedLibrarySupported())
  {
    uint64_t v11 = 0;
    int v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint32_t v14 = __Block_byref_object_copy__32985;
    __int16 v15 = __Block_byref_object_dispose__32986;
    id v16 = 0;
    id v9 = v6;
    id v10 = v5;
    PLSafeRunWithUnfairLock();
    id v7 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __115__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__limitedLibraryFilterPredicateForEntityName_withClientContext___block_invoke(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) trustedCallerBundleID];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F8B998] sharedInstance];
    id v5 = *(void **)(a1 + 40);
    if (v5)
    {
      [v5 auditToken];
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
    }
    uint64_t v6 = [v4 photosAccessAllowedWithScope:7 auditToken:&v43 clientAuthorization:*(void *)(*(void *)(a1 + 32) + 8)];

    uint64_t v7 = *(void *)(a1 + 32);
    int v8 = *(void **)(v7 + 40);
    if (v6 == 4)
    {
      *(void *)(v7 + 40) = MEMORY[0x1E4F1CC38];

      id v9 = PLBackendGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v46 = v2;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Enabled limited library fetch filter on xpc store connection from: %{public}@", buf, 0xCu);
      }

      int v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:*(void *)(a1 + 32) selector:sel_limitedLibraryFetchFiltersUpdated_ name:@"PLLimitedLibraryFetchFiltersUpdatedNotification" object:0];
    }
    else
    {
      *(void *)(v7 + 40) = MEMORY[0x1E4F1CC28];
    }

    uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  }
  if (!objc_msgSend(v3, "BOOLValue", v43, v44)) {
    goto LABEL_33;
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 48)) {
    goto LABEL_18;
  }
  uint64_t v11 = [*(id *)(v10 + 8) fetchFilterIdentifier];
  int v12 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v13 = +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:v11 inManagedObjectContext:v12];
  uint64_t v14 = *(void *)(a1 + 32);
  __int16 v15 = *(void **)(v14 + 48);
  *(void *)(v14 + 48) = v13;

  uint64_t v16 = *(void *)(a1 + 32);
  if (*(void *)(v16 + 48))
  {
    objc_storeStrong((id *)(v16 + 24), v2);
    __int16 v17 = [*(id *)(*(void *)(a1 + 32) + 48) fetchFilterData];
    uint64_t v18 = +[PLLimitedLibraryFetchFilter entityNameToPredicateMapFromFetchFilterData:v17 withApplicationIdentifier:*(void *)(*(void *)(a1 + 32) + 24)];
    uint64_t v19 = *(void *)(a1 + 32);
    os_signpost_id_t v20 = *(void **)(v19 + 32);
    *(void *)(v19 + 32) = v18;

    v21 = PLBackendGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = *(void *)(a1 + 32);
      v23 = *(void **)(v22 + 24);
      uint64_t v24 = *(void *)(v22 + 48);
      *(_DWORD *)buf = 138543618;
      v46 = v23;
      __int16 v47 = 2112;
      uint64_t v48 = v24;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "Using Fetch Filter for connection with client: %{public}@ -- %@", buf, 0x16u);
    }
  }
  uint64_t v10 = *(void *)(a1 + 32);
  if (*(void *)(v10 + 48))
  {
LABEL_18:
    v25 = *(void **)(v10 + 32);
    if (!v25) {
      goto LABEL_21;
    }
    uint64_t v26 = [v25 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v27 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v28 = *(void **)(v27 + 40);
    *(void *)(v27 + 40) = v26;
    goto LABEL_20;
  }
  if (!*(void *)(v10 + 32) && [v2 length])
  {
    uint64_t v28 = +[PLLimitedLibraryFetchFilter entityNameToPredicateMapWithApplicationIdentifier:v2];
    uint64_t v35 = [v28 objectForKeyedSubscript:*(void *)(a1 + 48)];
    uint64_t v36 = *(void *)(*(void *)(a1 + 56) + 8);
    v37 = *(void **)(v36 + 40);
    *(void *)(v36 + 40) = v35;

LABEL_20:
  }
LABEL_21:
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v29 = *(void **)(a1 + 48);
    uint64_t v30 = +[PLCloudMaster entityName];
    if ([v29 isEqualToString:v30])
    {
    }
    else
    {
      v31 = *(void **)(a1 + 48);
      v32 = +[PLCloudMasterMediaMetadata entityName];
      LODWORD(v31) = [v31 isEqualToString:v32];

      if (!v31)
      {
        v38 = PLBackendGetLog();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
        {
          v39 = *(void **)(a1 + 48);
          *(_DWORD *)buf = 138543362;
          v46 = v39;
          _os_log_impl(&dword_19B3C7000, v38, OS_LOG_TYPE_DEFAULT, "Limited library fetch filter denying access to entity: %{public}@", buf, 0xCu);
        }

        v33 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v34 = 0;
        goto LABEL_32;
      }
    }
    v33 = (void *)MEMORY[0x1E4F28F60];
    uint64_t v34 = 1;
LABEL_32:
    uint64_t v40 = [v33 predicateWithValue:v34];
    uint64_t v41 = *(void *)(*(void *)(a1 + 56) + 8);
    v42 = *(void **)(v41 + 40);
    *(void *)(v41 + 40) = v40;
  }
LABEL_33:
}

- (id)_internalResourceFilterPredicate
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K == %d", @"trashedState", 0);
}

- (id)_assetFilterPredicateWithClientContext:(id)a3
{
  id v4 = a3;
  if (PLIsContentPrivacyEnabled()
    && ![(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _restrictedLockedContentAccessAllowedForContext:v4])
  {
    id v5 = +[PLManagedAsset predicateToExcludeRestrictedLockedAssets];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_filterPredicateForEntityName:(id)a3 withClientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[PLManagedAsset entityName];
  int v9 = [v6 isEqualToString:v8];

  if (v9)
  {
    uint64_t v10 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _assetFilterPredicateWithClientContext:v7];
LABEL_5:
    uint64_t v13 = (void *)v10;
    goto LABEL_7;
  }
  uint64_t v11 = +[PLInternalResource entityName];
  int v12 = [v6 isEqualToString:v11];

  if (v12)
  {
    uint64_t v10 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _internalResourceFilterPredicate];
    goto LABEL_5;
  }
  uint64_t v13 = 0;
LABEL_7:

  return v13;
}

- (id)restrictingReadPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a3 name];
  int v8 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _restrictedEntityNamesAllowedForContext:v6];
  id v9 = v7;
  uint64_t v10 = PLXPCStoreAllowedEntityNames();
  char v11 = [v10 containsObject:v9];

  if ((v11 & 1) != 0 || [v8 containsObject:v9])
  {
    int v12 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _limitedLibraryFilterPredicateForEntityName:v9 withClientContext:v6];
    uint64_t v13 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _captureSessionPredicateForEntityName:v9];
    uint64_t v14 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self _filterPredicateForEntityName:v9 withClientContext:v6];
    id v15 = objc_alloc_init(MEMORY[0x1E4F8B8B8]);
    [v15 addPredicate:v12];
    [v15 addPredicate:v13];
    [v15 addPredicate:v14];
    uint64_t v16 = [v15 buildAndPredicate];
    __int16 v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      connectionAuthorization = self->_connectionAuthorization;
      int v25 = 138543618;
      uint64_t v26 = connectionAuthorization;
      __int16 v27 = 2112;
      uint64_t v28 = v16;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEBUG, "[client %{public}@] XPC store fetchFilterPredicate: %@", (uint8_t *)&v25, 0x16u);
    }
  }
  else
  {
    os_signpost_id_t v20 = (PLAssetsdConnectionAuthorization *)v9;
    v21 = PLXPCStoreDeniedEntityNames();
    int v22 = [v21 containsObject:v20];

    v23 = PLBackendGetLog();
    uint64_t v24 = v23;
    if (v22)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        int v25 = 138543362;
        uint64_t v26 = v20;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "Attempted to fetch disallowed entity: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      uint64_t v16 = 0;
    }
    else
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        int v25 = 138543362;
        uint64_t v26 = v20;
        _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_FAULT, "Attempted to fetch unexpected entity: %{public}@", (uint8_t *)&v25, 0xCu);
      }

      uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
    }
  }

  return v16;
}

- (BOOL)_restrictedLockedContentAccessAllowedForContext:(id)a3
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  id v5 = a3;
  PLSafeRunWithUnfairLock();
  char v3 = *((unsigned char *)v7 + 24);

  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __101__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__restrictedLockedContentAccessAllowedForContext___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(*(void *)(a1 + 32) + 2112);
  if (!v2)
  {
    char v3 = [*(id *)(a1 + 40) entitlements];
    id v4 = [v3 objectForKeyedSubscript:@"com.apple.private.assetsd.xpcstore_restricted.access"];

    if ([v4 containsObject:@"photos.locked"])
    {
      id v5 = PLBackendGetLog();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 8) trustedCallerBundleID];
        int v7 = [*(id *)(*(void *)(a1 + 32) + 8) clientProcessIdentifier];
        int v12 = 138543618;
        uint64_t v13 = v6;
        __int16 v14 = 1024;
        int v15 = v7;
        _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_DEFAULT, "Client %{public}@ [%d] has entitlement access to locked content", (uint8_t *)&v12, 0x12u);
      }
      uint64_t v8 = *(void *)(a1 + 32);
      char v9 = *(void **)(v8 + 2112);
      uint64_t v10 = MEMORY[0x1E4F1CC38];
    }
    else
    {
      uint64_t v8 = *(void *)(a1 + 32);
      char v9 = *(void **)(v8 + 2112);
      uint64_t v10 = MEMORY[0x1E4F1CC28];
    }
    *(void *)(v8 + 2112) = v10;

    v2 = *(void **)(*(void *)(a1 + 32) + 2112);
  }
  uint64_t result = [v2 BOOLValue];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_restrictedEntityNamesAllowedForContext:(id)a3
{
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x3032000000;
  char v9 = __Block_byref_object_copy__32985;
  uint64_t v10 = __Block_byref_object_dispose__32986;
  id v11 = 0;
  id v5 = a3;
  PLSafeRunWithUnfairLock();
  id v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __93__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__restrictedEntityNamesAllowedForContext___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v5 = [*(id *)(a1 + 32) entitlements];
    id v9 = [v5 objectForKeyedSubscript:@"com.apple.private.assetsd.xpcstore_restricted.access"];

    uint64_t v6 = [*(id *)(a1 + 40) _entityNamesAllowedByRestrictedDataEntitlements:v9];
    uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    [*(id *)(a1 + 32) setUserInfo:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
  }
}

- (id)_entityNamesAllowedByRestrictedDataEntitlements:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  pl_dispatch_once();
  id v4 = (id)_entityNamesAllowedByRestrictedDataEntitlements__pl_once_object_17;
  id v5 = [MEMORY[0x1E4F1CA80] set];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v3;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = objc_msgSend(v4, "objectForKey:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13);
          [v5 addObjectsFromArray:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v5;
}

void __101__PLXPCPhotoLibraryStoreServerRequestHandlingPolicy__entityNamesAllowedByRestrictedDataEntitlements___block_invoke()
{
  v29[6] = *MEMORY[0x1E4F143B8];
  v28[0] = @"photos.person";
  v21 = +[PLPerson entityName];
  v27[0] = v21;
  os_signpost_id_t v20 = +[PLPersonReference entityName];
  v27[1] = v20;
  uint64_t v19 = +[PLUserFeedback entityName];
  v27[2] = v19;
  uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:3];
  v29[0] = v18;
  v28[1] = @"photos.memory";
  __int16 v17 = +[PLMemory entityName];
  v26[0] = v17;
  long long v16 = +[PLUserFeedback entityName];
  v26[1] = v16;
  long long v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v29[1] = v15;
  v28[2] = @"photos.face";
  long long v14 = +[PLDetectedFace entityName];
  v25[0] = v14;
  long long v13 = +[PLDetectedFaceprint entityName];
  v25[1] = v13;
  int v12 = +[PLDetectedFaceGroup entityName];
  v25[2] = v12;
  v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:3];
  v29[2] = v0;
  v28[3] = @"photos.scene";
  v1 = +[PLSceneClassification entityName];
  v24[0] = v1;
  uint64_t v2 = +[PLMediaAnalysisAssetAttributes entityName];
  v24[1] = v2;
  id v3 = +[PLComputeSyncAttributes entityName];
  v24[2] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:3];
  v29[3] = v4;
  v28[4] = @"photos.suggestion";
  id v5 = +[PLSuggestion entityName];
  v23 = v5;
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
  v29[4] = v6;
  v28[5] = @"photos.curation";
  uint64_t v7 = +[PLComputedAssetAttributes entityName];
  int v22 = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  v29[5] = v8;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:6];
  uint64_t v10 = [v9 copy];
  id v11 = (void *)_entityNamesAllowedByRestrictedDataEntitlements__pl_once_object_17;
  _entityNamesAllowedByRestrictedDataEntitlements__pl_once_object_17 = v10;
}

- (id)processFaultForRelationshipWithName:(id)a3 onObjectWithID:(id)a4 fromClientWithContext:(id)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v31 = a5;
  int v12 = [v11 entity];
  long long v13 = [v12 relationshipsByName];
  long long v14 = [v13 objectForKeyedSubscript:v10];

  long long v15 = [v14 destinationEntity];
  long long v16 = [v12 name];
  __int16 v17 = +[PLPhotosHighlight entityName];
  if ([v16 isEqualToString:v17])
  {
  }
  else
  {
    uint64_t v29 = self;
    [v15 name];
    uint64_t v30 = v14;
    uint64_t v18 = v15;
    id v19 = v11;
    id v20 = v10;
    int v22 = v21 = a6;
    v23 = +[PLPhotosHighlight entityName];
    int v24 = [v22 isEqualToString:v23];

    a6 = v21;
    id v10 = v20;
    id v11 = v19;
    long long v15 = v18;
    long long v14 = v30;

    if (!v24)
    {
      v32.receiver = v29;
      v32.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
      int v25 = v31;
      a6 = [(NSXPCStoreServerRequestHandlingPolicy *)&v32 processFaultForRelationshipWithName:v10 onObjectWithID:v11 fromClientWithContext:v31 error:a6];
      goto LABEL_7;
    }
  }
  int v25 = v31;
  if (a6)
  {
    id v26 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
    __int16 v27 = a6;
    a6 = 0;
    *__int16 v27 = v26;
  }
LABEL_7:

  return a6;
}

- (id)processFaultForObjectWithID:(id)a3 fromClientWithContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 entity];
  id v11 = [v10 name];
  int v12 = +[PLPhotosHighlight entityName];
  int v13 = [v11 isEqualToString:v12];

  if (v13)
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:3328 userInfo:0];
      long long v14 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      long long v14 = 0;
    }
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
    long long v14 = [(NSXPCStoreServerRequestHandlingPolicy *)&v16 processFaultForObjectWithID:v8 fromClientWithContext:v9 error:a5];
  }

  return v14;
}

- (BOOL)shouldAcceptConnectionsFromClientWithContext:(id)a3
{
  return 1;
}

- (id)restrictingPullChangeHistoryPredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithValue:", 0, a4);
}

- (id)restrictingWritePredicateForEntity:(id)a3 fromClientWithContext:(id)a4
{
  return 0;
}

- (BOOL)shouldAcceptMetadataChangesFromClientWithContext:(id)a3
{
  return 0;
}

- (id)allowableClassesForClientWithContext:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  return (id)[v3 setWithObject:v4];
}

- (void)dealloc
{
  if ([(NSNumber *)self->_fetchFilterLock_fetchFilterEnabledStatus BOOLValue])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self];
  }
  v4.receiver = self;
  v4.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
  [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)&v4 dealloc];
}

- (PLXPCPhotoLibraryStoreServerRequestHandlingPolicy)initWithConnectionAuthorization:(id)a3
{
  id v5 = a3;
  id v6 = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)self init];
  uint64_t v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);
  }

  return v7;
}

- (PLXPCPhotoLibraryStoreServerRequestHandlingPolicy)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLXPCPhotoLibraryStoreServerRequestHandlingPolicy;
  uint64_t result = [(PLXPCPhotoLibraryStoreServerRequestHandlingPolicy *)&v3 init];
  if (result)
  {
    result->_fetchFilterLock._os_unfair_lock_opaque = 0;
    result->_crashLogMessageLock._os_unfair_lock_opaque = 0;
    result->_restrictedAccessLock._os_unfair_lock_opaque = 0;
  }
  return result;
}

@end