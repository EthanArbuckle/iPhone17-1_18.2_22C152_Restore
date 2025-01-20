@interface PLAssetsdLibraryInternalClient
- (BOOL)backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:(id *)a3;
- (BOOL)checkAssetsArePendingForDuplicateMergeProcessing:(id)a3;
- (BOOL)clearAvailabilityStateWithError:(id *)a3;
- (BOOL)failAvailabilityWithError:(id *)a3;
- (BOOL)invalidateBehavioralScoreOnAllAssetsWithError:(id *)a3;
- (BOOL)invalidateReverseLocationDataOnAllAssetsWithError:(id *)a3;
- (BOOL)processIdenticalDuplicatesWithProcessingType:(unint64_t)a3 error:(id *)a4;
- (BOOL)registerBackgroundJobServiceIfNecessaryOnLibraryPath:(id)a3 error:(id *)a4;
- (BOOL)repairMemoriesWithUUIDs:(id)a3 error:(id *)a4;
- (BOOL)setKeywords:(id)a3 forAssetWithUUID:(id)a4;
- (BOOL)signalAvailabilityStateDidChangeWithError:(id *)a3;
- (BOOL)synchronouslyGetLibrarySizesFromDB:(BOOL)a3 sizes:(id *)a4 error:(id *)a5;
- (BOOL)synchronouslyGetSizeOfResourcesToUploadByCPL:(int64_t *)a3 error:(id *)a4;
- (BOOL)synchronouslyMarkPersonAsNeedingKeyFace:(id)a3 error:(id *)a4;
- (BOOL)waitForSearchIndexExistenceWithError:(id *)a3;
- (id)availabilityStateShouldPersist:(BOOL)a3 error:(id *)a4;
- (id)featureProcessingSnapshotWithError:(id *)a3;
- (id)getBackgroundJobServiceBundlesInQueueDictionaryWithError:(id *)a3;
- (id)getBackgroundJobServiceStatusCenterDumpWithError:(id *)a3;
- (id)metricsForLibraryAtURL:(id)a3 error:(id *)a4;
- (unint64_t)getBackgroundJobServiceStateWithError:(id *)a3;
- (void)applySearchIndexGraphUpdates:(id)a3 supportingData:(id)a4 completionHandler:(id)a5;
- (void)coreAnalyticsLibrarySummaryDataWithCompletionHandler:(id)a3;
- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 completionHandler:(id)a5;
- (void)deleteiTunesSyncedContentWithCompletionHandler:(id)a3;
- (void)forceRunBackgroundJobsOnLibraryPath:(id)a3 criteriaShortCode:(id)a4 completionHandler:(id)a5;
- (void)getAssetCountsWithReply:(id)a3;
- (void)getLibrarySizesFromDB:(BOOL)a3 completionHandler:(id)a4;
- (void)getSearchIndexProgress:(id)a3;
- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completionHandler:(id)a6;
- (void)markPersonAsNeedingKeyFace:(id)a3 completionHandler:(id)a4;
- (void)mergeDuplicateAssetUuidSelection:(id)a3 completionHandler:(id)a4;
- (void)pauseSearchIndexingWithCompletionHandler:(id)a3;
- (void)reloadMomentGenerationOptions;
- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4;
- (void)resumeSearchIndexingWithCompletionHandler:(id)a3;
- (void)setFetchFilterWithAssets:(id)a3 forApplication:(id)a4 withAuditToken:(id *)a5 completionHandler:(id)a6;
- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3 completionHandler:(id)a4;
- (void)updateAssetLocationDataWithUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation PLAssetsdLibraryInternalClient

- (BOOL)signalAvailabilityStateDidChangeWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: signalAvailabilityStateDidChangeWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3520;
  v28 = __Block_byref_object_dispose__3521;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke;
  v17[3] = &unk_1E58A17B8;
  v17[4] = &buf;
  v17[5] = &v18;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke_92;
  v16[3] = &unk_1E58A17E0;
  v16[4] = &v18;
  v16[5] = &buf;
  [v9 signalAvailabilityStateDidChangeWithReply:v16];

  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  int v10 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    v11 = PLRequestGetLog();
    v12 = v11;
    os_signpost_id_t v13 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v10 != 0;
}

void __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    v9 = "-[PLAssetsdLibraryInternalClient signalAvailabilityStateDidChangeWithError:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __76__PLAssetsdLibraryInternalClient_signalAvailabilityStateDidChangeWithError___block_invoke_92(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (BOOL)failAvailabilityWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: failAvailabilityWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3520;
  v28 = __Block_byref_object_dispose__3521;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  int v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __60__PLAssetsdLibraryInternalClient_failAvailabilityWithError___block_invoke;
  v17[3] = &unk_1E58A1C40;
  v17[4] = &buf;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __60__PLAssetsdLibraryInternalClient_failAvailabilityWithError___block_invoke_91;
  v16[3] = &unk_1E58A17E0;
  v16[4] = &buf;
  v16[5] = &v18;
  [v9 failAvailabilityWithReply:v16];

  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  int v10 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    id v11 = PLRequestGetLog();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v24 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v10 != 0;
}

void __60__PLAssetsdLibraryInternalClient_failAvailabilityWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdLibraryInternalClient failAvailabilityWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __60__PLAssetsdLibraryInternalClient_failAvailabilityWithError___block_invoke_91(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)clearAvailabilityStateWithError:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: clearAvailabilityStateWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__3520;
  v28 = __Block_byref_object_dispose__3521;
  id v29 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 1;
  int v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke;
  v17[3] = &unk_1E58A1C40;
  v17[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke_90;
  v16[3] = &unk_1E58A17E0;
  v16[4] = &buf;
  v16[5] = &v18;
  [v9 clearAvailabilityWithReply:v16];

  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  int v10 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    uint64_t v11 = PLRequestGetLog();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v24 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v10 != 0;
}

void __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdLibraryInternalClient clearAvailabilityStateWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __66__PLAssetsdLibraryInternalClient_clearAvailabilityStateWithError___block_invoke_90(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (id)availabilityStateShouldPersist:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v26 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v7;
  if (v7)
  {
    int v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: availabilityStateShouldPersist:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v9 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__3520;
  v32 = __Block_byref_object_dispose__3521;
  id v33 = 0;
  uint64_t v20 = 0;
  char v21 = &v20;
  uint64_t v22 = 0x3032000000;
  long long v23 = __Block_byref_object_copy__3520;
  long long v24 = __Block_byref_object_dispose__3521;
  id v25 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke_89;
  v18[3] = &unk_1E58A00D0;
  v18[4] = &buf;
  v18[5] = &v20;
  [v11 availabilityStateShouldPersist:v5 reply:v18];

  if (a4) {
    *a4 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v12 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    os_signpost_id_t v13 = PLRequestGetLog();
    v14 = v13;
    os_signpost_id_t v15 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v28 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12;
}

void __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdLibraryInternalClient availabilityStateShouldPersist:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __71__PLAssetsdLibraryInternalClient_availabilityStateShouldPersist_error___block_invoke_89(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Failed to produced availability snapshot, error: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = a1 + 32;
  }
  else
  {
    uint64_t v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v9 + 8) + 40), a3);
}

- (id)featureProcessingSnapshotWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: featureProcessingSnapshotWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  id v29 = __Block_byref_object_copy__3520;
  uint64_t v30 = __Block_byref_object_dispose__3521;
  id v31 = 0;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  char v21 = __Block_byref_object_copy__3520;
  uint64_t v22 = __Block_byref_object_dispose__3521;
  id v23 = 0;
  int v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke;
  v17[3] = &unk_1E58A1C40;
  v17[4] = &buf;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke_88;
  v16[3] = &unk_1E58A00D0;
  v16[4] = &buf;
  v16[5] = &v18;
  [v9 featureProcessingSnapshotWithReply:v16];

  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  id v10 = (id)v19[5];
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v11 = PLRequestGetLog();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v10;
}

void __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdLibraryInternalClient featureProcessingSnapshotWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __69__PLAssetsdLibraryInternalClient_featureProcessingSnapshotWithError___block_invoke_88(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  if (v7)
  {
    int v8 = PLPhotoKitGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_ERROR, "Failed to produced processing snapshot, error: %@", (uint8_t *)&v10, 0xCu);
    }

    uint64_t v9 = a1 + 32;
  }
  else
  {
    uint64_t v9 = a1 + 40;
    a3 = a2;
  }
  objc_storeStrong((id *)(*(void *)(*(void *)v9 + 8) + 40), a3);
}

- (void)deleteEmbeddings:(id)a3 assetUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v12;
  if (v12)
  {
    os_signpost_id_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: deleteEmbeddings:assetUUID:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v14 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  os_signpost_id_t v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke;
  v32[3] = &unk_1E58A1BC8;
  id v33 = v11;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke_2;
  v23[3] = &unk_1EEBF5308;
  char v27 = v34;
  id v28 = *((id *)&v34 + 1);
  long long v29 = v35;
  long long v30 = v36;
  SEL v31 = a2;
  id v16 = v9;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  id v18 = v33;
  id v26 = v18;
  [v15 remoteObjectProxyWithErrorHandler:v32 handler:v23];

  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    v19 = PLRequestGetLog();
    uint64_t v20 = v19;
    os_signpost_id_t v21 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v36 + 1));
      *(_DWORD *)long long buf = 136446210;
      v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__PLAssetsdLibraryInternalClient_deleteEmbeddings_assetUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    int v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      int v11 = 138543362;
      BOOL v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 deleteEmbeddings:*(void *)(a1 + 32) assetUUID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)insertEmbeddings:(id)a3 modelType:(unint64_t)a4 assetUUID:(id)a5 completionHandler:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v37) = v14;
  if (v14)
  {
    os_signpost_id_t v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: insertEmbeddings:modelType:assetUUID:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v16 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  id v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke;
  v35[3] = &unk_1E58A1BC8;
  id v36 = v13;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3254779904;
  v25[2] = __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke_2;
  v25[3] = &unk_1EEBF3B20;
  char v29 = v37;
  id v30 = *((id *)&v37 + 1);
  long long v31 = v38;
  long long v32 = v39;
  SEL v33 = a2;
  id v18 = v11;
  id v26 = v18;
  unint64_t v34 = a4;
  id v19 = v12;
  id v27 = v19;
  id v20 = v36;
  id v28 = v20;
  [v17 remoteObjectProxyWithErrorHandler:v35 handler:v25];

  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    os_signpost_id_t v21 = PLRequestGetLog();
    uint64_t v22 = v21;
    os_signpost_id_t v23 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(*((SEL *)&v39 + 1));
      *(_DWORD *)long long buf = 136446210;
      v41 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __89__PLAssetsdLibraryInternalClient_insertEmbeddings_modelType_assetUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    int v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      int v11 = 138543362;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 insertEmbeddings:*(void *)(a1 + 32) modelType:*(void *)(a1 + 112) assetUUID:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (id)metricsForLibraryAtURL:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v33 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v33) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: metricsForLibraryAtURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  int v11 = PLRequestGetLog();
  *((void *)&v35 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v34 = v12;
  id v13 = v11;
  BOOL v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  long long v38 = __Block_byref_object_copy__3520;
  long long v39 = __Block_byref_object_dispose__3521;
  id v40 = 0;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__3520;
  long long v31 = __Block_byref_object_dispose__3521;
  id v32 = 0;
  id v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  id v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v26];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke_2;
  v25[3] = &unk_1E58A00D0;
  void v25[4] = &v27;
  v25[5] = &buf;
  [v17 metricsForLibraryAtURL:v7 reply:v25];

  id v18 = (void *)v28[5];
  if (!v18)
  {
    if (a4)
    {
      *a4 = *(id *)(*((void *)&buf + 1) + 40);
      id v18 = (void *)v28[5];
    }
    else
    {
      id v18 = 0;
    }
  }
  id v19 = v18;
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      os_signpost_id_t v23 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19;
}

void __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke(uint64_t a1, void *a2)
{
}

void __63__PLAssetsdLibraryInternalClient_metricsForLibraryAtURL_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v11 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 40) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
}

- (void)mergeDuplicateAssetUuidSelection:(id)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: mergeDuplicateAssetUuidSelection:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke;
  v21[3] = &unk_1E58A1BC8;
  id v22 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke_2;
  v18[3] = &unk_1E589F930;
  id v12 = v6;
  id v19 = v12;
  id v13 = v22;
  id v20 = v13;
  [v11 remoteObjectProxyWithErrorHandler:v21 handler:v18];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    BOOL v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __85__PLAssetsdLibraryInternalClient_mergeDuplicateAssetUuidSelection_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 mergeDuplicateAssetUuidSelection:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (BOOL)checkAssetsArePendingForDuplicateMergeProcessing:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: checkAssetsArePendingForDuplicateMergeProcessing:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v24 = v10;
  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  BOOL v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_81_3542];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__PLAssetsdLibraryInternalClient_checkAssetsArePendingForDuplicateMergeProcessing___block_invoke_82;
  v22[3] = &unk_1E58A00F8;
  v22[4] = &buf;
  [v15 assetsArePendingForDuplicateMergeProcessing:v5 reply:v22];

  int v16 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    id v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16 != 0;
}

uint64_t __83__PLAssetsdLibraryInternalClient_checkAssetsArePendingForDuplicateMergeProcessing___block_invoke_82(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __83__PLAssetsdLibraryInternalClient_checkAssetsArePendingForDuplicateMergeProcessing___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdLibraryInternalClient checkAssetsArePendingForDuplicateMergeProcessing:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)processIdenticalDuplicatesWithProcessingType:(unint64_t)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: processIdenticalDuplicatesWithProcessingType:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v10 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v11 = PLRequestGetLog();
  *((void *)&v34 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v33 = v12;
  id v13 = v11;
  BOOL v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v34 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__3520;
  long long v38 = __Block_byref_object_dispose__3521;
  id v39 = 0;
  int v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  v27[4] = &buf;
  id v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke_79;
  v26[3] = &unk_1E58A17E0;
  v26[4] = &v28;
  void v26[5] = &buf;
  [v17 processIdenticalDuplicatesWithProcessingType:a3 reply:v26];

  LODWORD(v16) = *((unsigned __int8 *)v29 + 24);
  id v18 = *(id *)(*((void *)&buf + 1) + 40);
  os_signpost_id_t v19 = v18;
  if (!v16 && a4) {
    *a4 = v18;
  }

  int v20 = *((unsigned __int8 *)v29 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v28, 8);
  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    os_signpost_id_t v21 = PLRequestGetLog();
    id v22 = v21;
    os_signpost_id_t v23 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      long long v24 = sel_getName(*((SEL *)&v34 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20 != 0;
}

void __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdLibraryInternalClient processIdenticalDuplicatesWithProcessingType:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __85__PLAssetsdLibraryInternalClient_processIdenticalDuplicatesWithProcessingType_error___block_invoke_79(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (void)coreAnalyticsLibrarySummaryDataWithCompletionHandler:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: coreAnalyticsLibrarySummaryDataWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  int v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  __int16 v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    os_signpost_id_t v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_78_3549];
  [v13 coreAnalyticsLibrarySummaryDataWithCompletionHandler:v5];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    BOOL v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      int v16 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __87__PLAssetsdLibraryInternalClient_coreAnalyticsLibrarySummaryDataWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdLibraryInternalClient coreAnalyticsLibrarySummaryDataWithCompletionHandler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)forceRunBackgroundJobsOnLibraryPath:(id)a3 criteriaShortCode:(id)a4 completionHandler:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v12;
  if (v12)
  {
    *((void *)&v23 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: forceRunBackgroundJobsOnLibraryPath:criteriaShortCode:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v23 + 1), (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  id v13 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  os_signpost_id_t v15 = v13;
  int v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    uint64_t v27 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  long long v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_76_3553];
  [v19 forceRunBackgroundJobsOnLibraryPath:v9 criteriaShortCode:v10 completionHandler:v11];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if (v14)
  {
    int v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      uint64_t v22 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = v22;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __106__PLAssetsdLibraryInternalClient_forceRunBackgroundJobsOnLibraryPath_criteriaShortCode_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdLibraryInternalClient forceRunBackgroundJobsOnLibraryPath:criteriaShortCode:completionHandler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)setWidgetTimelineGeneratedForDisplaySize:(CGSize)a3 completionHandler:(id)a4
{
  CGFloat height = a3.height;
  CGFloat width = a3.width;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setWidgetTimelineGeneratedForDisplaySize:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  BOOL v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3254779904;
  v18[2] = __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke_2;
  v18[3] = &unk_1EEBF50D8;
  char v20 = v29;
  id v21 = *((id *)&v29 + 1);
  long long v22 = v30;
  long long v23 = v31;
  SEL v24 = a2;
  CGFloat v25 = width;
  CGFloat v26 = height;
  id v13 = v28;
  id v19 = v13;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v18];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    os_signpost_id_t v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __93__PLAssetsdLibraryInternalClient_setWidgetTimelineGeneratedForDisplaySize_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      BOOL v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend(v3, "setWidgetTimelineGeneratedForDisplaySize:completionHandler:", *(void *)(a1 + 32), *(double *)(a1 + 96), *(double *)(a1 + 104));
}

- (void)resetLimitedLibraryAccessForApplication:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetLimitedLibraryAccessForApplication:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if (!v7)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 430, @"Invalid parameter not satisfying: %@", @"applicationIdentifier" object file lineNumber description];
  }
  BOOL v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke;
  v28[3] = &unk_1E58A1BC8;
  id v29 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3254779904;
  v20[2] = __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke_2;
  v20[3] = &unk_1EEBF4EA8;
  char v23 = v30;
  id v24 = *((id *)&v30 + 1);
  long long v25 = v31;
  long long v26 = v32;
  SEL v27 = a2;
  id v13 = v7;
  id v21 = v13;
  id v14 = v29;
  id v22 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v28 handler:v20];

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    os_signpost_id_t v16 = v15;
    os_signpost_id_t v17 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __92__PLAssetsdLibraryInternalClient_resetLimitedLibraryAccessForApplication_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      BOOL v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 resetLimitedLibraryAccessForApplication:*(void *)(a1 + 32) completionHandler:*(void *)(a1 + 40)];
}

- (void)setFetchFilterWithAssets:(id)a3 forApplication:(id)a4 withAuditToken:(id *)a5 completionHandler:(id)a6
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v41) = v14;
  if (v14)
  {
    os_signpost_id_t v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setFetchFilterWithAssets:forApplication:withAuditToken:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v16 = (void *)*((void *)&v41 + 1);
    *((void *)&v41 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if (!v11)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 418, @"Invalid parameter not satisfying: %@", @"uuids" object file lineNumber description];
  }
  if (!v12)
  {
    SEL v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 419, @"Invalid parameter not satisfying: %@", @"applicationIdentifier" object file lineNumber description];
  }
  os_signpost_id_t v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke;
  v39[3] = &unk_1E58A1BC8;
  id v40 = v13;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3254779904;
  v28[2] = __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2;
  v28[3] = &unk_1EEBF5570;
  char v32 = v41;
  id v33 = *((id *)&v41 + 1);
  long long v34 = v42;
  long long v35 = v43;
  SEL v36 = a2;
  id v18 = v11;
  id v29 = v18;
  id v19 = v12;
  id v30 = v19;
  long long v20 = *(_OWORD *)&a5->var0[4];
  long long v37 = *(_OWORD *)a5->var0;
  long long v38 = v20;
  id v21 = v40;
  id v31 = v21;
  [v17 remoteObjectProxyWithErrorHandler:v39 handler:v28];

  if ((_BYTE)v41) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if ((void)v42)
  {
    id v22 = PLRequestGetLog();
    char v23 = v22;
    os_signpost_id_t v24 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(*((SEL *)&v43 + 1));
      *(_DWORD *)long long buf = 136446210;
      v45 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __107__PLAssetsdLibraryInternalClient_setFetchFilterWithAssets_forApplication_withAuditToken_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v16 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      LODWORD(v15[0]) = 138543362;
      *(void *)((char *)v15 + 4) = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)v15, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 48);
  long long v14 = *(_OWORD *)(a1 + 128);
  v15[0] = *(_OWORD *)(a1 + 112);
  v15[1] = v14;
  [v3 setFetchFilterWithAssets:v11 forApplication:v12 withAuditToken:v15 completionHandler:v13];
}

- (BOOL)invalidateBehavioralScoreOnAllAssetsWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    __int16 v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: invalidateBehavioralScoreOnAllAssetsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__3520;
  id v29 = __Block_byref_object_dispose__3521;
  id v30 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke;
  v18[3] = &unk_1E58A17B8;
  void v18[4] = &buf;
  v18[5] = &v19;
  BOOL v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke_62;
  v17[3] = &unk_1E58A17E0;
  v17[4] = &buf;
  void v17[5] = &v19;
  [v9 invalidateBehavioralScoreOnAllAssetsWithReply:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  int v11 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    os_signpost_id_t v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11 != 0;
}

void __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    BOOL v9 = "-[PLAssetsdLibraryInternalClient invalidateBehavioralScoreOnAllAssetsWithError:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __80__PLAssetsdLibraryInternalClient_invalidateBehavioralScoreOnAllAssetsWithError___block_invoke_62(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (void)deleteiTunesSyncedContentWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: deleteiTunesSyncedContentWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  BOOL v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  _OWORD v15[2] = __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke_61;
  v15[3] = &unk_1EEBF5778;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v11 = PLRequestGetLog();
    uint64_t v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdLibraryInternalClient deleteiTunesSyncedContentWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__PLAssetsdLibraryInternalClient_deleteiTunesSyncedContentWithCompletionHandler___block_invoke_61(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 deleteiTunesSyncedContentWithCompletionHandler:*(void *)(a1 + 32)];
}

- (BOOL)backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:(id *)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v18) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v7 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__3520;
  long long v24 = __Block_byref_object_dispose__3521;
  id v25 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __94__PLAssetsdLibraryInternalClient_backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet___block_invoke;
  v17[3] = &unk_1E58A1C40;
  v17[4] = &buf;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  [v9 backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet];

  if (a3 && (id v10 = *(void **)(*((void *)&buf + 1) + 40)) != 0)
  {
    BOOL v11 = 0;
    *a3 = v10;
  }
  else
  {
    BOOL v11 = 1;
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    uint64_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11;
}

void __94__PLAssetsdLibraryInternalClient_backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdLibraryInternalClient backgroundJobServiceRemoveAllBundleRecordsFromProcessingSet:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)getBackgroundJobServiceBundlesInQueueDictionaryWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getBackgroundJobServiceBundlesInQueueDictionaryWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__3520;
  uint64_t v31 = __Block_byref_object_dispose__3521;
  id v32 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3520;
  id v23 = __Block_byref_object_dispose__3521;
  id v24 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  void v18[4] = &v19;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke_60;
  v17[3] = &unk_1E589F908;
  v17[4] = &buf;
  [v9 getBackgroundJobServiceBundlesInQueueDictionaryWithReply:v17];

  if (a3)
  {
    id v10 = (void *)v20[5];
    if (v10) {
      *a3 = v10;
    }
  }
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    uint64_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11;
}

void __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdLibraryInternalClient getBackgroundJobServiceBundlesInQueueDictionaryWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __91__PLAssetsdLibraryInternalClient_getBackgroundJobServiceBundlesInQueueDictionaryWithError___block_invoke_60(uint64_t a1, void *a2)
{
}

- (id)getBackgroundJobServiceStatusCenterDumpWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getBackgroundJobServiceStatusCenterDumpWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__3520;
  uint64_t v31 = __Block_byref_object_dispose__3521;
  id v32 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__3520;
  id v23 = __Block_byref_object_dispose__3521;
  id v24 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  void v18[4] = &v19;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke_58;
  v17[3] = &unk_1E589F908;
  v17[4] = &buf;
  [v9 getBackgroundJobServiceStatusCenterDumpWithReply:v17];

  if (a3)
  {
    id v10 = (void *)v20[5];
    if (v10) {
      *a3 = v10;
    }
  }
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    uint64_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11;
}

void __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdLibraryInternalClient getBackgroundJobServiceStatusCenterDumpWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __83__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStatusCenterDumpWithError___block_invoke_58(uint64_t a1, void *a2)
{
}

- (unint64_t)getBackgroundJobServiceStateWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getBackgroundJobServiceStateWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__3520;
  uint64_t v29 = __Block_byref_object_dispose__3521;
  id v30 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  void v18[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke_56;
  v17[3] = &unk_1E58A01C0;
  v17[4] = &v19;
  [v9 getBackgroundJobServiceStateWithReply:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  unint64_t v11 = v20[3];
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11;
}

void __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdLibraryInternalClient getBackgroundJobServiceStateWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __72__PLAssetsdLibraryInternalClient_getBackgroundJobServiceStateWithError___block_invoke_56(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)registerBackgroundJobServiceIfNecessaryOnLibraryPath:(id)a3 error:(id *)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v8;
  if (v8)
  {
    __int16 v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: registerBackgroundJobServiceIfNecessaryOnLibraryPath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if (!v7)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 303, @"Invalid parameter not satisfying: %@", @"libraryPath" object file lineNumber description];
  }
  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__3520;
  uint64_t v33 = __Block_byref_object_dispose__3521;
  id v34 = 0;
  uint64_t v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke;
  v22[3] = &unk_1E58A1C40;
  void v22[4] = &buf;
  uint64_t v12 = [v11 synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke_55;
  v21[3] = &unk_1E58A17E0;
  void v21[4] = &v23;
  v21[5] = &buf;
  [v12 registerBackgroundJobServiceIfNecessaryOnLibraryPath:v7 reply:v21];

  if (a4)
  {
    os_signpost_id_t v13 = *(void **)(*((void *)&buf + 1) + 40);
    if (v13) {
      *a4 = v13;
    }
  }
  int v14 = *((unsigned __int8 *)v24 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v23, 8);
  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v29 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

void __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdLibraryInternalClient registerBackgroundJobServiceIfNecessaryOnLibraryPath:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __93__PLAssetsdLibraryInternalClient_registerBackgroundJobServiceIfNecessaryOnLibraryPath_error___block_invoke_55(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (BOOL)invalidateReverseLocationDataOnAllAssetsWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: invalidateReverseLocationDataOnAllAssetsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__3520;
  long long v29 = __Block_byref_object_dispose__3521;
  id v30 = 0;
  BOOL v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke;
  v18[3] = &unk_1E58A17B8;
  void v18[4] = &buf;
  void v18[5] = &v19;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke_51;
  v17[3] = &unk_1E58A17E0;
  v17[4] = &buf;
  void v17[5] = &v19;
  [v9 invalidateReverseLocationDataOnAllAssetsWithReply:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  int v11 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11 != 0;
}

void __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v8 = 136315394;
    __int16 v9 = "-[PLAssetsdLibraryInternalClient invalidateReverseLocationDataOnAllAssetsWithError:]_block_invoke";
    __int16 v10 = 2112;
    id v11 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v8, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
  id v7 = v3;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
}

void __84__PLAssetsdLibraryInternalClient_invalidateReverseLocationDataOnAllAssetsWithError___block_invoke_51(uint64_t a1, char a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), obj);
  id v6 = obj;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
}

- (BOOL)setKeywords:(id)a3 forAssetWithUUID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v9;
  if (v9)
  {
    __int16 v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setKeywords:forAssetWithUUID:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  uint64_t v12 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  *(void *)&long long v27 = v13;
  os_signpost_id_t v14 = v12;
  os_signpost_id_t v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  os_signpost_id_t v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  long long v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_48_3588];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__PLAssetsdLibraryInternalClient_setKeywords_forAssetWithUUID___block_invoke_49;
  v25[3] = &unk_1E58A00F8;
  void v25[4] = &buf;
  [v18 setAssetKeywords:v7 forAssetUUID:v8 reply:v25];

  int v19 = *(unsigned __int8 *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    long long v20 = PLRequestGetLog();
    uint64_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      long long v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 != 0;
}

uint64_t __63__PLAssetsdLibraryInternalClient_setKeywords_forAssetWithUUID___block_invoke_49(uint64_t result, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __63__PLAssetsdLibraryInternalClient_setKeywords_forAssetWithUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdLibraryInternalClient setKeywords:forAssetWithUUID:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)applySearchIndexGraphUpdates:(id)a3 supportingData:(id)a4 completionHandler:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v40) = v12;
  if (v12)
  {
    os_signpost_id_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: applySearchIndexGraphUpdates:supportingData:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v14 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if (!v9)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 252, @"Invalid parameter not satisfying: %@", @"graphUpdates" object file lineNumber description];
  }
  if (!v11)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 253, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v39 = 0;
  os_signpost_id_t v15 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v39];
  id v16 = (char *)v39;
  if (!v15)
  {
    os_signpost_id_t v17 = PLBackendGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138543362;
      v44 = v16;
      _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_ERROR, "Couldn't archive supportingData dictionary for search graph update with archiver error: %{public}@", buf, 0xCu);
    }
  }
  long long v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke;
  v37[3] = &unk_1E58A1BC8;
  id v38 = v11;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3254779904;
  v28[2] = __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke_2;
  v28[3] = &unk_1EEBF5308;
  char v32 = v40;
  id v33 = *((id *)&v40 + 1);
  long long v34 = v41;
  long long v35 = v42;
  SEL v36 = a2;
  id v19 = v9;
  id v29 = v19;
  id v20 = v15;
  id v30 = v20;
  id v21 = v38;
  id v31 = v21;
  [v18 remoteObjectProxyWithErrorHandler:v37 handler:v28];

  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    os_signpost_id_t v22 = PLRequestGetLog();
    long long v23 = v22;
    os_signpost_id_t v24 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(*((SEL *)&v42 + 1));
      *(_DWORD *)long long buf = 136446210;
      v44 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __96__PLAssetsdLibraryInternalClient_applySearchIndexGraphUpdates_supportingData_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      int v11 = 138543362;
      BOOL v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 applyGraphUpdates:*(void *)(a1 + 32) supportingData:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)pauseSearchIndexingWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: pauseSearchIndexingWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if (!v5)
  {
    os_signpost_id_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 235, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v24 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_40;
  v16[3] = &unk_1EEBF5778;
  char v18 = v25;
  id v19 = *((id *)&v25 + 1);
  long long v20 = v26;
  long long v21 = v27;
  SEL v22 = a2;
  id v10 = v24;
  id v17 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v23 handler:v16];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    int v11 = PLRequestGetLog();
    BOOL v12 = v11;
    os_signpost_id_t v13 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdLibraryInternalClient pauseSearchIndexingWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v15 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      os_signpost_id_t v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_41;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 pauseSearchIndexingWithReply:v11];
}

uint64_t __75__PLAssetsdLibraryInternalClient_pauseSearchIndexingWithCompletionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)resumeSearchIndexingWithCompletionHandler:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v6;
  if (v6)
  {
    __int16 v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resumeSearchIndexingWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if (!v5)
  {
    os_signpost_id_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 220, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v24 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  void v16[2] = __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_38;
  v16[3] = &unk_1EEBF5778;
  char v18 = v25;
  id v19 = *((id *)&v25 + 1);
  long long v20 = v26;
  long long v21 = v27;
  SEL v22 = a2;
  id v10 = v24;
  id v17 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v23 handler:v16];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    int v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdLibraryInternalClient resumeSearchIndexingWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v15 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)long long buf = 138543362;
      os_signpost_id_t v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_39;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 resumeSearchIndexingWithReply:v11];
}

uint64_t __76__PLAssetsdLibraryInternalClient_resumeSearchIndexingWithCompletionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)waitForSearchIndexExistenceWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: waitForSearchIndexExistenceWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__3520;
  id v29 = __Block_byref_object_dispose__3521;
  id v30 = 0;
  uint64_t v19 = 0;
  long long v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  void v18[4] = &buf;
  uint64_t v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke_37;
  v17[3] = &unk_1E58A17E0;
  v17[4] = &buf;
  void v17[5] = &v19;
  [v9 waitForSearchIndexExistenceWithReply:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  int v11 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    id v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    os_signpost_id_t v14 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v25 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11 != 0;
}

void __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdLibraryInternalClient waitForSearchIndexExistenceWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __71__PLAssetsdLibraryInternalClient_waitForSearchIndexExistenceWithError___block_invoke_37(uint64_t a1, char a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  if (v6)
  {
    int v7 = PLSearchBackendIndexStatusGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Error waiting for search index existence: %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (void)getSearchIndexProgress:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getSearchIndexProgress:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if (!v5)
  {
    os_signpost_id_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 182, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  int v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  void v16[2] = __57__PLAssetsdLibraryInternalClient_getSearchIndexProgress___block_invoke_36;
  v16[3] = &unk_1EEBF5778;
  char v18 = v23;
  id v19 = *((id *)&v23 + 1);
  long long v20 = v24;
  long long v21 = *(_OWORD *)sel;
  SEL v22 = a2;
  id v10 = v5;
  id v17 = v10;
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_35 handler:v16];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __57__PLAssetsdLibraryInternalClient_getSearchIndexProgress___block_invoke_36(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    int v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 getSearchIndexProgressWithReply:*(void *)(a1 + 32)];
}

void __57__PLAssetsdLibraryInternalClient_getSearchIndexProgress___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdLibraryInternalClient getSearchIndexProgress:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)synchronouslyMarkPersonAsNeedingKeyFace:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v32 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v8;
  if (v8)
  {
    int v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslyMarkPersonAsNeedingKeyFace:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  int v11 = PLRequestGetLog();
  *((void *)&v34 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v33 = v12;
  os_signpost_id_t v13 = v11;
  os_signpost_id_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v34 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v7)
  {
    long long v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 161, @"Invalid parameter not satisfying: %@", @"personUUID" object file lineNumber description];
  }
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x2020000000;
  char v31 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  long long v37 = __Block_byref_object_copy__3520;
  id v38 = __Block_byref_object_dispose__3521;
  id v39 = 0;
  id v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  void v27[4] = &buf;
  id v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke_2;
  v26[3] = &unk_1E58A17E0;
  v26[4] = &v28;
  void v26[5] = &buf;
  [v17 markPersonAsNeedingKeyFaceWithPersonUUID:v7 reply:v26];

  if (a4)
  {
    char v18 = *(void **)(*((void *)&buf + 1) + 40);
    if (v18) {
      *a4 = v18;
    }
  }
  int v19 = *((unsigned __int8 *)v29 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v28, 8);
  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    long long v20 = PLRequestGetLog();
    long long v21 = v20;
    os_signpost_id_t v22 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      long long v23 = sel_getName(*((SEL *)&v34 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 != 0;
}

void __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke(uint64_t a1, void *a2)
{
}

void __80__PLAssetsdLibraryInternalClient_synchronouslyMarkPersonAsNeedingKeyFace_error___block_invoke_2(uint64_t a1, int a2, void *a3)
{
  id v6 = a3;
  if (a2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  else
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)markPersonAsNeedingKeyFace:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: markPersonAsNeedingKeyFace:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v7)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 147, @"Invalid parameter not satisfying: %@", @"personUUID" object file lineNumber description];
  }
  if (!v8)
  {
    long long v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 148, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke;
  v29[3] = &unk_1E58A1BC8;
  id v30 = v8;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke_2;
  v21[3] = &unk_1EEBF4EA8;
  char v24 = v31;
  id v25 = *((id *)&v31 + 1);
  long long v26 = v32;
  long long v27 = v33;
  SEL v28 = a2;
  id v13 = v7;
  id v22 = v13;
  id v14 = v30;
  id v23 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v29 handler:v21];

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __79__PLAssetsdLibraryInternalClient_markPersonAsNeedingKeyFace_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 markPersonAsNeedingKeyFaceWithPersonUUID:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (void)reloadMomentGenerationOptions
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: reloadMomentGenerationOptions", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  os_signpost_id_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  id v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    int v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  int v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_3626];
  [v11 reloadMomentGenerationOptions];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    id v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __63__PLAssetsdLibraryInternalClient_reloadMomentGenerationOptions__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdLibraryInternalClient reloadMomentGenerationOptions]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)repairMemoriesWithUUIDs:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v8;
  if (v8)
  {
    BOOL v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: repairMemoriesWithUUIDs:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  int v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v30 = v12;
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v7)
  {
    long long v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 120, @"Invalid parameter not satisfying: %@", @"memoryUUIDs" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  long long v34 = __Block_byref_object_copy__3520;
  long long v35 = __Block_byref_object_dispose__3521;
  id v36 = 0;
  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  void v28[4] = &buf;
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke_2;
  v27[3] = &unk_1E58A1C40;
  void v27[4] = &buf;
  [v17 repairMemoriesWithUUIDs:v7 reply:v27];

  uint64_t v18 = *((void *)&buf + 1);
  if (a4)
  {
    int v19 = *(void **)(*((void *)&buf + 1) + 40);
    if (v19)
    {
      *a4 = v19;
      uint64_t v18 = *((void *)&buf + 1);
    }
  }
  uint64_t v20 = *(void *)(v18 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    long long v21 = PLRequestGetLog();
    id v22 = v21;
    os_signpost_id_t v23 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      char v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20 == 0;
}

void __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
}

void __64__PLAssetsdLibraryInternalClient_repairMemoriesWithUUIDs_error___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4)
  {
    id v5 = v4;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v4 = v5;
  }
}

- (void)updateAssetLocationDataWithUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateAssetLocationDataWithUUID:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v7)
  {
    int v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 106, @"Invalid parameter not satisfying: %@", @"uuid" object file lineNumber description];
  }
  if (!v8)
  {
    uint64_t v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 107, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke;
  v29[3] = &unk_1E58A1BC8;
  id v30 = v8;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke_2;
  v21[3] = &unk_1EEBF4EA8;
  char v24 = v31;
  id v25 = *((id *)&v31 + 1);
  long long v26 = v32;
  long long v27 = v33;
  SEL v28 = a2;
  id v13 = v7;
  id v22 = v13;
  id v14 = v30;
  id v23 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v29 handler:v21];

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__PLAssetsdLibraryInternalClient_updateAssetLocationDataWithUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 updateAssetLocationDataWithUUID:*(void *)(a1 + 32) reply:*(void *)(a1 + 40)];
}

- (BOOL)synchronouslyGetSizeOfResourcesToUploadByCPL:(int64_t *)a3 error:(id *)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v37 = 0u;
  *(_OWORD *)sel = 0u;
  long long v36 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v36) = v8;
  if (v8)
  {
    BOOL v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslyGetSizeOfResourcesToUploadByCPL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v36 + 1);
    *((void *)&v36 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v37 + 8));
  }
  int v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v37 = v12;
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a3)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 77, @"Invalid parameter not satisfying: %@", @"size" object file lineNumber description];
  }
  uint64_t v32 = 0;
  long long v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  long long v41 = __Block_byref_object_copy__3520;
  long long v42 = __Block_byref_object_dispose__3521;
  id v43 = 0;
  uint64_t v28 = 0;
  long long v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = -1;
  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  void v27[4] = &buf;
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke_2;
  v26[3] = &unk_1E589F8E0;
  v26[4] = &v28;
  void v26[5] = &v32;
  void v26[6] = &buf;
  [v17 getSizeOfResourcesToUploadByCPLWithReply:v26];

  int v18 = *((unsigned __int8 *)v33 + 24);
  if (*((unsigned char *)v33 + 24)) {
    *a3 = v29[3];
  }
  if (a4)
  {
    int v19 = *(void **)(*((void *)&buf + 1) + 40);
    if (v19)
    {
      *a4 = v19;
      int v18 = *((unsigned __int8 *)v33 + 24);
    }
  }
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v32, 8);
  if ((_BYTE)v36) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v37 + 8));
  }
  if ((void)v37)
  {
    uint64_t v20 = PLRequestGetLog();
    long long v21 = v20;
    os_signpost_id_t v22 = v37;
    if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v18 != 0;
}

void __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__PLAssetsdLibraryInternalClient_synchronouslyGetSizeOfResourcesToUploadByCPL_error___block_invoke_2(void *a1, int a2, uint64_t a3, void *a4)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (a2)
  {
    *(void *)(*(void *)(a1[4] + 8) + 24) = a3;
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    BOOL v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Error getting size of resources to upload by CPL, error: %@", (uint8_t *)&v10, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
}

- (BOOL)synchronouslyGetLibrarySizesFromDB:(BOOL)a3 sizes:(id *)a4 error:(id *)a5
{
  BOOL v7 = a3;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v41) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslyGetLibrarySizesFromDB:sizes:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v12 = (void *)*((void *)&v41 + 1);
    *((void *)&v41 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  id v13 = PLRequestGetLog();
  *((void *)&v43 + 1) = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  *(void *)&long long v42 = v14;
  long long v15 = v13;
  long long v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(*((SEL *)&v43 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a4)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 48, @"Invalid parameter not satisfying: %@", @"sizes" object file lineNumber description];
  }
  uint64_t v37 = 0;
  id v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  uint64_t v46 = __Block_byref_object_copy__3520;
  v47 = __Block_byref_object_dispose__3521;
  id v48 = 0;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__3520;
  char v35 = __Block_byref_object_dispose__3521;
  id v36 = 0;
  int v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke;
  v30[3] = &unk_1E58A1C40;
  v30[4] = &buf;
  int v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke_2;
  v28[3] = &unk_1E589F8B8;
  void v28[4] = &v31;
  void v28[5] = &v37;
  BOOL v29 = v7;
  v28[6] = &buf;
  [v19 getLibrarySizesFromDB:v7 reply:v28];

  if (*((unsigned char *)v38 + 24)) {
    *a4 = (id) v32[5];
  }
  if (a5)
  {
    uint64_t v20 = *(void **)(*((void *)&buf + 1) + 40);
    if (v20) {
      *a5 = v20;
    }
  }
  int v21 = *((unsigned __int8 *)v38 + 24);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v37, 8);
  if ((_BYTE)v41) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if ((void)v42)
  {
    os_signpost_id_t v22 = PLRequestGetLog();
    id v23 = v22;
    os_signpost_id_t v24 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      id v25 = sel_getName(*((SEL *)&v43 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21 != 0;
}

void __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke(uint64_t a1, void *a2)
{
}

void __81__PLAssetsdLibraryInternalClient_synchronouslyGetLibrarySizesFromDB_sizes_error___block_invoke_2(uint64_t a1, int a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    BOOL v10 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = *(unsigned __int8 *)(a1 + 56);
      v12[0] = 67109378;
      v12[1] = v11;
      __int16 v13 = 2112;
      id v14 = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Error getting library sizes fromDB: %d, error: %@", (uint8_t *)v12, 0x12u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a4);
  }
}

- (void)getLibrarySizesFromDB:(BOOL)a3 completionHandler:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v28 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getLibrarySizesFromDB:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if (!v7)
  {
    os_signpost_id_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PLAssetsdLibraryInternalClient.m", 34, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  int v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke;
  v26[3] = &unk_1E58A1BC8;
  id v27 = v7;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3254779904;
  v18[2] = __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke_2;
  v18[3] = &unk_1EEBF5820;
  char v20 = v28;
  id v21 = *((id *)&v28 + 1);
  long long v22 = v29;
  long long v23 = v30;
  SEL v24 = a2;
  BOOL v25 = a3;
  id v12 = v27;
  id v19 = v12;
  [v11 remoteObjectProxyWithErrorHandler:v26 handler:v18];

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    __int16 v13 = PLRequestGetLog();
    id v14 = v13;
    os_signpost_id_t v15 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v30 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __74__PLAssetsdLibraryInternalClient_getLibrarySizesFromDB_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    __int16 v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      BOOL v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 getLibrarySizesFromDB:*(unsigned __int8 *)(a1 + 96) reply:*(void *)(a1 + 32)];
}

- (void)getAssetCountsWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getAssetCountsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  id v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  _OWORD v15[2] = __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke_2;
  v15[3] = &unk_1EEBF5778;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    int v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__PLAssetsdLibraryInternalClient_getAssetCountsWithReply___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      id v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 getAssetCountsWithReply:*(void *)(a1 + 32)];
}

@end