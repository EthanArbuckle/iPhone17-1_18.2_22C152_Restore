@interface PLAssetsdDebugClient
- (BOOL)allMomentsMetadataWithOutputPath:(id)a3 metadataDictionary:(id *)a4 error:(id *)a5;
- (BOOL)archiveComputeCacheWithError:(id *)a3;
- (BOOL)backgroundMigrationWithError:(id *)a3;
- (BOOL)cleanupEmptyHighlightsWithError:(id *)a3;
- (BOOL)debugSidecarFileURLsForAsset:(id)a3 debugSidecarFileURLs:(id *)a4 error:(id *)a5;
- (BOOL)dumpMetadataForMomentsWithOutputPath:(id)a3 metadataDirectory:(id *)a4 error:(id *)a5;
- (BOOL)indexAssetsWithUUIDs:(id)a3 error:(id *)a4;
- (BOOL)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError:(id *)a3;
- (BOOL)locationOfInterestUpdateWithError:(id *)a3;
- (BOOL)processRecentHighlightsWithError:(id *)a3;
- (BOOL)processUnprocessedMomentLocationsWithError:(id *)a3;
- (BOOL)rebuildHighlightsDeletingExistingHighlights:(BOOL)a3 error:(id *)a4;
- (BOOL)rebuildMomentsDeletingExistingMoments:(BOOL)a3 error:(id *)a4;
- (BOOL)rebuildSearchIndexWithError:(id *)a3;
- (BOOL)resetBackgroundMigrationClassName:(id)a3 error:(id *)a4;
- (BOOL)resetComputeCacheWithError:(id *)a3;
- (BOOL)resetDrawAssetPersonEdgesBackgroundMigrationActionWithError:(id *)a3;
- (BOOL)resetMaintenanceTasksWithError:(id *)a3;
- (BOOL)restoreComputeCacheWithError:(id *)a3;
- (BOOL)revertToOriginalForAsset:(id)a3 error:(id *)a4;
- (BOOL)runMaintenanceTask:(id)a3 error:(id *)a4;
- (BOOL)setAssetContainmentLargeFaceThreshold:(double)a3 error:(id *)a4;
- (BOOL)setAssetContainmentSmallFaceThreshold:(double)a3 error:(id *)a4;
- (BOOL)setAssetContainmentSmallTorsoThreshold:(double)a3 error:(id *)a4;
- (BOOL)synchronouslySetSearchIndexPaused:(BOOL)a3 reason:(id)a4 error:(id *)a5;
- (BOOL)updateHighlightTitlesWithError:(id *)a3;
- (id)assetContainmentLargeFaceThresholdUserDefaultWithError:(id *)a3;
- (id)assetContainmentSmallFaceThresholdUserDefaultWithError:(id *)a3;
- (id)assetContainmentSmallTorsoThresholdUserDefaultWithError:(id *)a3;
- (id)computeCacheStatusWithError:(id *)a3;
- (id)getCPLStateForDebug:(BOOL)a3;
- (id)getStatus;
- (id)getTaskConstraintStatus;
- (id)getXPCTransactionStatus;
- (id)momentGenerationStatus;
- (id)requestSearchDebugInformationForAssetUUID:(id)a3 error:(id *)a4;
- (id)runAssetContainmentOnAllSocialGroupsWithCompletion:(id)a3;
- (id)runAssetContainmentOnSocialGroupWithUUID:(id)a3 withCompletion:(id)a4;
- (id)syndicationIngestMutexStateDescriptionWithError:(id *)a3;
- (id)updateAndSaveAssetPersonEdgesWithCompletion:(id)a3;
- (int64_t)removeAllThumbnailsForDryRun:(BOOL)a3 count:(unint64_t *)a4;
- (void)clearPrefetchState;
- (void)closeSearchIndexWithCompletionHandler:(id)a3;
- (void)coalesceJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withChangeJournalOverThreshold:(float)a5 completionHandler:(id)a6;
- (void)dropSearchIndexWithCompletionHandler:(id)a3;
- (void)enqueuePrefetch;
- (void)identifyAssetsWithInconsistentCloudState;
- (void)prefetchResourcesForHighlights:(id)a3;
- (void)prefetchResourcesForMemories:(id)a3;
- (void)prefetchResourcesWithMode:(int64_t)a3;
- (void)privateDownloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 completionHandler:(id)a6;
- (void)pruneAssets:(id)a3 resourceTypes:(id)a4;
- (void)rebuildAllThumbnails;
- (void)rebuildCloudFeed;
- (void)rebuildTableThumbs;
- (void)recoverAssetsInInconsistentCloudState;
- (void)snapshotJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withCompletionHandler:(id)a5;
- (void)unloadImageFilesForAsset:(id)a3 minimumFormat:(int)a4 completionHandler:(id)a5;
- (void)waitForMomentGeneration;
@end

@implementation PLAssetsdDebugClient

- (BOOL)runMaintenanceTask:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v7;
  if (v7)
  {
    v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: runMaintenanceTask:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1897;
  v31 = __Block_byref_object_dispose__1898;
  id v32 = 0;
  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_187];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__PLAssetsdDebugClient_runMaintenanceTask_error___block_invoke_188;
  v20[3] = &unk_1E58A17E0;
  v20[4] = &v21;
  v20[5] = &buf;
  [v11 runMaintenanceTask:v6 reply:v20];

  LODWORD(v11) = *((unsigned __int8 *)v22 + 24);
  id v12 = *(id *)(*((void *)&buf + 1) + 40);
  v13 = v12;
  if (!v11 && a4) {
    *a4 = v12;
  }

  int v14 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v21, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    v15 = PLRequestGetLog();
    v16 = v15;
    os_signpost_id_t v17 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

void __49__PLAssetsdDebugClient_runMaintenanceTask_error___block_invoke_188(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __49__PLAssetsdDebugClient_runMaintenanceTask_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdDebugClient runMaintenanceTask:error:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)resetMaintenanceTasksWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    __int16 v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetMaintenanceTasksWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1897;
  uint64_t v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_184];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __55__PLAssetsdDebugClient_resetMaintenanceTasksWithError___block_invoke_185;
  v18[3] = &unk_1E58A17E0;
  v18[4] = &v19;
  v18[5] = &buf;
  [v9 resetMaintenanceTasksWithReply:v18];

  LODWORD(v9) = *((unsigned __int8 *)v20 + 24);
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  v11 = v10;
  if (!v9 && a3) {
    *a3 = v10;
  }

  int v12 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    v13 = PLRequestGetLog();
    int v14 = v13;
    os_signpost_id_t v15 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12 != 0;
}

void __55__PLAssetsdDebugClient_resetMaintenanceTasksWithError___block_invoke_185(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __55__PLAssetsdDebugClient_resetMaintenanceTasksWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdDebugClient resetMaintenanceTasksWithError:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)resetDrawAssetPersonEdgesBackgroundMigrationActionWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    __int16 v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetDrawAssetPersonEdgesBackgroundMigrationActionWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1897;
  uint64_t v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_181];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __84__PLAssetsdDebugClient_resetDrawAssetPersonEdgesBackgroundMigrationActionWithError___block_invoke_182;
  v18[3] = &unk_1E58A17E0;
  v18[4] = &v19;
  v18[5] = &buf;
  [v9 resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:v18];

  LODWORD(v9) = *((unsigned __int8 *)v20 + 24);
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  v11 = v10;
  if (!v9 && a3) {
    *a3 = v10;
  }

  int v12 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    v13 = PLRequestGetLog();
    int v14 = v13;
    os_signpost_id_t v15 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12 != 0;
}

void __84__PLAssetsdDebugClient_resetDrawAssetPersonEdgesBackgroundMigrationActionWithError___block_invoke_182(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __84__PLAssetsdDebugClient_resetDrawAssetPersonEdgesBackgroundMigrationActionWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdDebugClient resetDrawAssetPersonEdgesBackgroundMigrationActionWithError:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)resetBackgroundMigrationClassName:(id)a3 error:(id *)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v7;
  if (v7)
  {
    uint64_t v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetBackgroundMigrationClassName:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__1897;
  uint64_t v31 = __Block_byref_object_dispose__1898;
  id v32 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_178];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__PLAssetsdDebugClient_resetBackgroundMigrationClassName_error___block_invoke_179;
  v20[3] = &unk_1E58A17E0;
  v20[4] = &v21;
  v20[5] = &buf;
  [v11 resetBackgroundMigrationClassName:v6 reply:v20];

  LODWORD(v11) = *((unsigned __int8 *)v22 + 24);
  id v12 = *(id *)(*((void *)&buf + 1) + 40);
  v13 = v12;
  if (!v11 && a4) {
    *a4 = v12;
  }

  int v14 = *((unsigned __int8 *)v22 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v21, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    v16 = v15;
    os_signpost_id_t v17 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14 != 0;
}

void __64__PLAssetsdDebugClient_resetBackgroundMigrationClassName_error___block_invoke_179(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __64__PLAssetsdDebugClient_resetBackgroundMigrationClassName_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdDebugClient resetBackgroundMigrationClassName:error:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)backgroundMigrationWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    __int16 v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: backgroundMigrationWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__1897;
  uint64_t v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_175];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__PLAssetsdDebugClient_backgroundMigrationWithError___block_invoke_176;
  v18[3] = &unk_1E58A17E0;
  v18[4] = &v19;
  v18[5] = &buf;
  [v9 backgroundMigrationWithReply:v18];

  LODWORD(v9) = *((unsigned __int8 *)v20 + 24);
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  v11 = v10;
  if (!v9 && a3) {
    *a3 = v10;
  }

  int v12 = *((unsigned __int8 *)v20 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    v13 = PLRequestGetLog();
    int v14 = v13;
    os_signpost_id_t v15 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12 != 0;
}

void __53__PLAssetsdDebugClient_backgroundMigrationWithError___block_invoke_176(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __53__PLAssetsdDebugClient_backgroundMigrationWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdDebugClient backgroundMigrationWithError:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)waitForMomentGeneration
{
  id v3 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v2 = [v3 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_170];
  [v2 waitForMomentGenerationWithReply:&__block_literal_global_173];
}

void __47__PLAssetsdDebugClient_waitForMomentGeneration__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    BOOL v5 = "-[PLAssetsdDebugClient waitForMomentGeneration]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)syndicationIngestMutexStateDescriptionWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v5;
  if (v5)
  {
    __int16 v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: syndicationIngestMutexStateDescriptionWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  id v30 = __Block_byref_object_copy__1897;
  uint64_t v31 = __Block_byref_object_dispose__1898;
  id v32 = 0;
  uint64_t v19 = 0;
  v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__1897;
  long long v23 = __Block_byref_object_dispose__1898;
  id v24 = 0;
  uint64_t v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__PLAssetsdDebugClient_syndicationIngestMutexStateDescriptionWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  v18[4] = &v19;
  v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __72__PLAssetsdDebugClient_syndicationIngestMutexStateDescriptionWithError___block_invoke_167;
  v17[3] = &unk_1E58A00A8;
  v17[4] = &buf;
  v17[5] = &v19;
  [v9 syndicationIngestMutexStateDescriptionWithReply:v17];

  id v10 = *(void **)(*((void *)&buf + 1) + 40);
  if (!v10)
  {
    if (a3)
    {
      *a3 = (id) v20[5];
      id v10 = *(void **)(*((void *)&buf + 1) + 40);
    }
    else
    {
      id v10 = 0;
    }
  }
  id v11 = v10;
  _Block_object_dispose(&v19, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    int v12 = PLRequestGetLog();
    v13 = v12;
    os_signpost_id_t v14 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v11;
}

void __72__PLAssetsdDebugClient_syndicationIngestMutexStateDescriptionWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient syndicationIngestMutexStateDescriptionWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __72__PLAssetsdDebugClient_syndicationIngestMutexStateDescriptionWithError___block_invoke_167(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (!v7) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (id)computeCacheStatusWithError:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v27 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: computeCacheStatusWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  id v32 = __Block_byref_object_copy__1897;
  uint64_t v33 = __Block_byref_object_dispose__1898;
  id v34 = 0;
  uint64_t v21 = 0;
  char v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__1897;
  long long v25 = __Block_byref_object_dispose__1898;
  id v26 = 0;
  uint64_t v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __52__PLAssetsdDebugClient_computeCacheStatusWithError___block_invoke;
  v20[3] = &unk_1E58A1C40;
  v20[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v20];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __52__PLAssetsdDebugClient_computeCacheStatusWithError___block_invoke_165;
  v19[3] = &unk_1E58A00D0;
  v19[4] = &buf;
  v19[5] = &v21;
  [v9 computeCacheStatusWithReply:v19];

  uint64_t v10 = v22[5];
  id v11 = *(id *)(*((void *)&buf + 1) + 40);
  int v12 = v11;
  if (!v10 && a3) {
    *a3 = v11;
  }

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    os_signpost_id_t v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(*((SEL *)&v29 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v13;
}

void __52__PLAssetsdDebugClient_computeCacheStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient computeCacheStatusWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __52__PLAssetsdDebugClient_computeCacheStatusWithError___block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
  id v8 = a3;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  int v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (BOOL)resetComputeCacheWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetComputeCacheWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1897;
  id v30 = __Block_byref_object_dispose__1898;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__PLAssetsdDebugClient_resetComputeCacheWithError___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __51__PLAssetsdDebugClient_resetComputeCacheWithError___block_invoke_164;
  v18[3] = &unk_1E58A17B8;
  v18[4] = &buf;
  void v18[5] = &v20;
  [v9 resetComputeCacheWithReply:v18];

  LODWORD(v9) = *((unsigned __int8 *)v21 + 24);
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = v10;
  if (!v9 && a3) {
    *a3 = v10;
  }

  int v12 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    os_signpost_id_t v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12 != 0;
}

void __51__PLAssetsdDebugClient_resetComputeCacheWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient resetComputeCacheWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __51__PLAssetsdDebugClient_resetComputeCacheWithError___block_invoke_164(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)archiveComputeCacheWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: archiveComputeCacheWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1897;
  id v30 = __Block_byref_object_dispose__1898;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__PLAssetsdDebugClient_archiveComputeCacheWithError___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__PLAssetsdDebugClient_archiveComputeCacheWithError___block_invoke_163;
  v18[3] = &unk_1E58A17B8;
  v18[4] = &buf;
  void v18[5] = &v20;
  [v9 archiveComputeCacheWithReply:v18];

  LODWORD(v9) = *((unsigned __int8 *)v21 + 24);
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = v10;
  if (!v9 && a3) {
    *a3 = v10;
  }

  int v12 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    os_signpost_id_t v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12 != 0;
}

void __53__PLAssetsdDebugClient_archiveComputeCacheWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient archiveComputeCacheWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __53__PLAssetsdDebugClient_archiveComputeCacheWithError___block_invoke_163(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (BOOL)restoreComputeCacheWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: restoreComputeCacheWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v28 = 0x3032000000;
  long long v29 = __Block_byref_object_copy__1897;
  id v30 = __Block_byref_object_dispose__1898;
  id v31 = 0;
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 1;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __53__PLAssetsdDebugClient_restoreComputeCacheWithError___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v19];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __53__PLAssetsdDebugClient_restoreComputeCacheWithError___block_invoke_162;
  v18[3] = &unk_1E58A17B8;
  v18[4] = &buf;
  void v18[5] = &v20;
  [v9 restoreComputeCacheWithReply:v18];

  LODWORD(v9) = *((unsigned __int8 *)v21 + 24);
  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  uint64_t v11 = v10;
  if (!v9 && a3) {
    *a3 = v10;
  }

  int v12 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    id v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    os_signpost_id_t v15 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12 != 0;
}

void __53__PLAssetsdDebugClient_restoreComputeCacheWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient restoreComputeCacheWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __53__PLAssetsdDebugClient_restoreComputeCacheWithError___block_invoke_162(uint64_t a1, void *a2)
{
  id v4 = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

- (id)assetContainmentSmallTorsoThresholdUserDefaultWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: assetContainmentSmallTorsoThresholdUserDefaultWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__1897;
  long long v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v19 = 0;
  uint64_t v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __80__PLAssetsdDebugClient_assetContainmentSmallTorsoThresholdUserDefaultWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  v18[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __80__PLAssetsdDebugClient_assetContainmentSmallTorsoThresholdUserDefaultWithError___block_invoke_161;
  v17[3] = &unk_1E589F370;
  v17[4] = &v19;
  [v9 assetContainmentSmallTorsoThresholdUserDefault:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20[3]];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    int v12 = PLRequestGetLog();
    id v13 = v12;
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

void __80__PLAssetsdDebugClient_assetContainmentSmallTorsoThresholdUserDefaultWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient assetContainmentSmallTorsoThresholdUserDefaultWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __80__PLAssetsdDebugClient_assetContainmentSmallTorsoThresholdUserDefaultWithError___block_invoke_161(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)setAssetContainmentSmallTorsoThreshold:(double)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v20) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setAssetContainmentSmallTorsoThreshold:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v9 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__1897;
  long long v26 = __Block_byref_object_dispose__1898;
  id v27 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __69__PLAssetsdDebugClient_setAssetContainmentSmallTorsoThreshold_error___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
  [v11 setAssetContainmentSmallTorsoThreshold:a3];

  if (a4 && (int v12 = *(void **)(*((void *)&buf + 1) + 40)) != 0)
  {
    BOOL v13 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v13 = 1;
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    os_signpost_id_t v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v13;
}

void __69__PLAssetsdDebugClient_setAssetContainmentSmallTorsoThreshold_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient setAssetContainmentSmallTorsoThreshold:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)assetContainmentLargeFaceThresholdUserDefaultWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: assetContainmentLargeFaceThresholdUserDefaultWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__1897;
  long long v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v19 = 0;
  long long v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__PLAssetsdDebugClient_assetContainmentLargeFaceThresholdUserDefaultWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  v18[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PLAssetsdDebugClient_assetContainmentLargeFaceThresholdUserDefaultWithError___block_invoke_160;
  v17[3] = &unk_1E589F370;
  v17[4] = &v19;
  [v9 assetContainmentLargeFaceThresholdUserDefault:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20[3]];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    int v12 = PLRequestGetLog();
    BOOL v13 = v12;
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

void __79__PLAssetsdDebugClient_assetContainmentLargeFaceThresholdUserDefaultWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient assetContainmentLargeFaceThresholdUserDefaultWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __79__PLAssetsdDebugClient_assetContainmentLargeFaceThresholdUserDefaultWithError___block_invoke_160(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)setAssetContainmentLargeFaceThreshold:(double)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v20) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setAssetContainmentLargeFaceThreshold:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v9 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__1897;
  long long v26 = __Block_byref_object_dispose__1898;
  id v27 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PLAssetsdDebugClient_setAssetContainmentLargeFaceThreshold_error___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
  [v11 setAssetContainmentLargeFaceThreshold:a3];

  if (a4 && (int v12 = *(void **)(*((void *)&buf + 1) + 40)) != 0)
  {
    BOOL v13 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v13 = 1;
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    os_signpost_id_t v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v13;
}

void __68__PLAssetsdDebugClient_setAssetContainmentLargeFaceThreshold_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient setAssetContainmentLargeFaceThreshold:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)assetContainmentSmallFaceThresholdUserDefaultWithError:(id *)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: assetContainmentSmallFaceThresholdUserDefaultWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__1897;
  long long v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v19 = 0;
  long long v20 = (double *)&v19;
  uint64_t v21 = 0x2020000000;
  uint64_t v22 = 0;
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __79__PLAssetsdDebugClient_assetContainmentSmallFaceThresholdUserDefaultWithError___block_invoke;
  v18[3] = &unk_1E58A1C40;
  v18[4] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v18];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __79__PLAssetsdDebugClient_assetContainmentSmallFaceThresholdUserDefaultWithError___block_invoke_158;
  v17[3] = &unk_1E589F370;
  v17[4] = &v19;
  [v9 assetContainmentSmallFaceThresholdUserDefault:v17];

  if (a3)
  {
    id v10 = *(void **)(*((void *)&buf + 1) + 40);
    if (v10) {
      *a3 = v10;
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28ED0] numberWithDouble:v20[3]];
  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    int v12 = PLRequestGetLog();
    BOOL v13 = v12;
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

void __79__PLAssetsdDebugClient_assetContainmentSmallFaceThresholdUserDefaultWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient assetContainmentSmallFaceThresholdUserDefaultWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __79__PLAssetsdDebugClient_assetContainmentSmallFaceThresholdUserDefaultWithError___block_invoke_158(uint64_t result, double a2)
{
  *(double *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (BOOL)setAssetContainmentSmallFaceThreshold:(double)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v20) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setAssetContainmentSmallFaceThreshold:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v9 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v24 = 0x3032000000;
  long long v25 = __Block_byref_object_copy__1897;
  long long v26 = __Block_byref_object_dispose__1898;
  id v27 = 0;
  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__PLAssetsdDebugClient_setAssetContainmentSmallFaceThreshold_error___block_invoke;
  v19[3] = &unk_1E58A1C40;
  v19[4] = &buf;
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v19];
  [v11 setAssetContainmentSmallFaceThreshold:a3];

  if (a4 && (int v12 = *(void **)(*((void *)&buf + 1) + 40)) != 0)
  {
    BOOL v13 = 0;
    *a4 = v12;
  }
  else
  {
    BOOL v13 = 1;
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    os_signpost_id_t v14 = PLRequestGetLog();
    os_signpost_id_t v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v13;
}

void __68__PLAssetsdDebugClient_setAssetContainmentSmallFaceThreshold_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient setAssetContainmentSmallFaceThreshold:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)updateAndSaveAssetPersonEdgesWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateAndSaveAssetPersonEdgesWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  id v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __68__PLAssetsdDebugClient_updateAndSaveAssetPersonEdgesWithCompletion___block_invoke;
  v20[3] = &unk_1E58A1BC8;
  id v9 = v4;
  id v21 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __68__PLAssetsdDebugClient_updateAndSaveAssetPersonEdgesWithCompletion___block_invoke_157;
  v18[3] = &unk_1E58A1BC8;
  id v11 = v9;
  id v19 = v11;
  int v12 = [v10 updateAndSaveAssetPersonEdgesWithReply:v18];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    BOOL v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    os_signpost_id_t v15 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v12;
}

void __68__PLAssetsdDebugClient_updateAndSaveAssetPersonEdgesWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    uint64_t v6 = "-[PLAssetsdDebugClient updateAndSaveAssetPersonEdgesWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__PLAssetsdDebugClient_updateAndSaveAssetPersonEdgesWithCompletion___block_invoke_157(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Received error udpating asset person edges, error: %@", (uint8_t *)&v6, 0xCu);
    }

    int v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (id)runAssetContainmentOnSocialGroupWithUUID:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: runAssetContainmentOnSocialGroupWithUUID:withCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  id v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __80__PLAssetsdDebugClient_runAssetContainmentOnSocialGroupWithUUID_withCompletion___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v12 = v7;
  id v24 = v12;
  BOOL v13 = [v11 remoteObjectProxyWithErrorHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __80__PLAssetsdDebugClient_runAssetContainmentOnSocialGroupWithUUID_withCompletion___block_invoke_156;
  v21[3] = &unk_1E58A1BC8;
  id v14 = v12;
  id v22 = v14;
  os_signpost_id_t v15 = [v13 runAssetContainmentOnSocialGroup:v6 reply:v21];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    os_signpost_id_t v16 = PLRequestGetLog();
    os_signpost_id_t v17 = v16;
    os_signpost_id_t v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v15;
}

void __80__PLAssetsdDebugClient_runAssetContainmentOnSocialGroupWithUUID_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdDebugClient runAssetContainmentOnSocialGroupWithUUID:withCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __80__PLAssetsdDebugClient_runAssetContainmentOnSocialGroupWithUUID_withCompletion___block_invoke_156(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Received error running asset containment, error: %@", (uint8_t *)&v6, 0xCu);
    }

    int v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (id)runAssetContainmentOnAllSocialGroupsWithCompletion:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    int v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: runAssetContainmentOnAllSocialGroupsWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  uint64_t v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __75__PLAssetsdDebugClient_runAssetContainmentOnAllSocialGroupsWithCompletion___block_invoke;
  v20[3] = &unk_1E58A1BC8;
  id v9 = v4;
  id v21 = v9;
  id v10 = [v8 remoteObjectProxyWithErrorHandler:v20];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __75__PLAssetsdDebugClient_runAssetContainmentOnAllSocialGroupsWithCompletion___block_invoke_155;
  v18[3] = &unk_1E58A1BC8;
  id v11 = v9;
  id v19 = v11;
  id v12 = [v10 runAssetContainmentOnAllSocialGroups:v18];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    BOOL v13 = PLRequestGetLog();
    id v14 = v13;
    os_signpost_id_t v15 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v12;
}

void __75__PLAssetsdDebugClient_runAssetContainmentOnAllSocialGroupsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    int v6 = "-[PLAssetsdDebugClient runAssetContainmentOnAllSocialGroupsWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __75__PLAssetsdDebugClient_runAssetContainmentOnAllSocialGroupsWithCompletion___block_invoke_155(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Received error running asset containment, error: %@", (uint8_t *)&v6, 0xCu);
    }

    int v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  else
  {
    int v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
  }
  v5();
}

- (void)coalesceJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withChangeJournalOverThreshold:(float)a5 completionHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v35 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v35) = v14;
  if (v14)
  {
    os_signpost_id_t v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: coalesceJournalsForManagerName:payloadClassIDs:withChangeJournalOverThreshold:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v16 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  os_signpost_id_t v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3254779904;
  v25[2] = __120__PLAssetsdDebugClient_coalesceJournalsForManagerName_payloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke_150;
  v25[3] = &unk_1EEBF53E8;
  char v29 = v35;
  id v30 = *((id *)&v35 + 1);
  long long v31 = v36;
  long long v32 = v37;
  SEL v33 = a2;
  id v18 = v11;
  id v26 = v18;
  id v19 = v12;
  id v27 = v19;
  float v34 = a5;
  id v20 = v13;
  id v28 = v20;
  [v17 remoteObjectProxyWithErrorHandler:&__block_literal_global_149 handler:v25];

  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    id v21 = PLRequestGetLog();
    long long v22 = v21;
    os_signpost_id_t v23 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(*((SEL *)&v37 + 1));
      *(_DWORD *)long long buf = 136446210;
      v39 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __120__PLAssetsdDebugClient_coalesceJournalsForManagerName_payloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke_150(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    id v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v19 = @"SignpostId";
    int v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v20[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      id v18 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  int v13 = *(_DWORD *)(a1 + 112);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __120__PLAssetsdDebugClient_coalesceJournalsForManagerName_payloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke_151;
  v15[3] = &unk_1E58A1920;
  id v16 = *(id *)(a1 + 48);
  LODWORD(v14) = v13;
  [v3 coalesceJournalsForManagerName:v11 payloadClassIDs:v12 withChangeJournalOverThreshold:v15 reply:v14];
}

void __120__PLAssetsdDebugClient_coalesceJournalsForManagerName_payloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdDebugClient coalesceJournalsForManagerName:payloadClassIDs:withChangeJournalOverThreshold:completion"
         "Handler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __120__PLAssetsdDebugClient_coalesceJournalsForManagerName_payloadClassIDs_withChangeJournalOverThreshold_completionHandler___block_invoke_151(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)snapshotJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withCompletionHandler:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v12;
  if (v12)
  {
    int v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: snapshotJournalsForManagerName:payloadClassIDs:withCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    double v14 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  os_signpost_id_t v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __93__PLAssetsdDebugClient_snapshotJournalsForManagerName_payloadClassIDs_withCompletionHandler___block_invoke_145;
  v23[3] = &unk_1EEBF51F0;
  char v27 = v32;
  id v28 = *((id *)&v32 + 1);
  long long v29 = v33;
  long long v30 = *(_OWORD *)sel;
  SEL v31 = a2;
  id v16 = v9;
  id v24 = v16;
  id v17 = v10;
  id v25 = v17;
  id v18 = v11;
  id v26 = v18;
  [v15 remoteObjectProxyWithErrorHandler:&__block_literal_global_144 handler:v23];

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    id v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __93__PLAssetsdDebugClient_snapshotJournalsForManagerName_payloadClassIDs_withCompletionHandler___block_invoke_145(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v17 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __93__PLAssetsdDebugClient_snapshotJournalsForManagerName_payloadClassIDs_withCompletionHandler___block_invoke_146;
  v13[3] = &unk_1E58A1BC8;
  id v14 = *(id *)(a1 + 48);
  [v3 snapshotJournalsForManagerName:v11 payloadClassIDs:v12 reply:v13];
}

void __93__PLAssetsdDebugClient_snapshotJournalsForManagerName_payloadClassIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdDebugClient snapshotJournalsForManagerName:payloadClassIDs:withCompletionHandler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

uint64_t __93__PLAssetsdDebugClient_snapshotJournalsForManagerName_payloadClassIDs_withCompletionHandler___block_invoke_146(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)privateDownloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if (v11)
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v31 = 0u;
    BOOL v13 = +[PLXPCMessageLogger enabled];
    LOBYTE(v31) = v13;
    if (v13)
    {
      id v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: privateDownloadCloudPhotoLibraryAsset:resourceType:highPriority:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      os_signpost_id_t v15 = (void *)*((void *)&v31 + 1);
      *((void *)&v31 + 1) = v14;

      os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v32 + 8));
    }
    id v16 = [(PLAssetsdBaseClient *)self proxyFactory];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3254779904;
    v21[2] = __106__PLAssetsdDebugClient_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_completionHandler___block_invoke_139;
    v21[3] = &unk_1EEBF5340;
    char v24 = v31;
    id v25 = *((id *)&v31 + 1);
    long long v26 = v32;
    long long v27 = v33;
    SEL v28 = a2;
    id v22 = v11;
    unint64_t v29 = a4;
    BOOL v30 = a5;
    id v23 = v12;
    [v16 remoteObjectProxyWithErrorHandler:&__block_literal_global_138 handler:v21];

    if ((_BYTE)v31) {
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
    }
    if ((void)v32)
    {
      id v17 = PLRequestGetLog();
      id v18 = v17;
      os_signpost_id_t v19 = v32;
      if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        Name = sel_getName(*((SEL *)&v33 + 1));
        *(_DWORD *)long long buf = 136446210;
        long long v35 = Name;
        _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
      }
    }
  }
}

void __106__PLAssetsdDebugClient_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_completionHandler___block_invoke_139(uint64_t a1, void *a2)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v14 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v15[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v12 = 138543362;
      BOOL v13 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v12, 0xCu);
    }
  }
  id v11 = [*(id *)(a1 + 32) URIRepresentation];
  [v3 privateDownloadCloudPhotoLibraryAsset:v11 resourceType:*(void *)(a1 + 104) highPriority:*(unsigned __int8 *)(a1 + 112) reply:*(void *)(a1 + 40)];
}

void __106__PLAssetsdDebugClient_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdDebugClient privateDownloadCloudPhotoLibraryAsset:resourceType:highPriority:completionHandler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)locationOfInterestUpdateWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: locationOfInterestUpdateWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  id v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  id v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1897;
  long long v32 = __Block_byref_object_dispose__1898;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __58__PLAssetsdDebugClient_locationOfInterestUpdateWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  [v15 locationOfInterestUpdateWithReply:&__block_literal_global_136];

  id v16 = *(void **)(*((void *)&buf + 1) + 40);
  id v17 = v16;
  id v18 = v17;
  if (v16 && a3) {
    *a3 = v17;
  }

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __58__PLAssetsdDebugClient_locationOfInterestUpdateWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient locationOfInterestUpdateWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  uint64_t v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1897;
  long long v32 = __Block_byref_object_dispose__1898;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __90__PLAssetsdDebugClient_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  [v15 invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:&__block_literal_global_133];

  id v16 = *(void **)(*((void *)&buf + 1) + 40);
  id v17 = v16;
  id v18 = v17;
  if (v16 && a3) {
    *a3 = v17;
  }

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __90__PLAssetsdDebugClient_invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)cleanupEmptyHighlightsWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cleanupEmptyHighlightsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  uint64_t v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1897;
  long long v32 = __Block_byref_object_dispose__1898;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __56__PLAssetsdDebugClient_cleanupEmptyHighlightsWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  [v15 cleanupEmptyHighlightsWithReply:&__block_literal_global_130];

  id v16 = *(void **)(*((void *)&buf + 1) + 40);
  id v17 = v16;
  id v18 = v17;
  if (v16 && a3) {
    *a3 = v17;
  }

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __56__PLAssetsdDebugClient_cleanupEmptyHighlightsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient cleanupEmptyHighlightsWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)updateHighlightTitlesWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateHighlightTitlesWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  uint64_t v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1897;
  long long v32 = __Block_byref_object_dispose__1898;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __55__PLAssetsdDebugClient_updateHighlightTitlesWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  [v15 updateHighlightTitlesWithReply:&__block_literal_global_127];

  id v16 = *(void **)(*((void *)&buf + 1) + 40);
  id v17 = v16;
  id v18 = v17;
  if (v16 && a3) {
    *a3 = v17;
  }

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __55__PLAssetsdDebugClient_updateHighlightTitlesWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient updateHighlightTitlesWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)processUnprocessedMomentLocationsWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: processUnprocessedMomentLocationsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  uint64_t v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1897;
  long long v32 = __Block_byref_object_dispose__1898;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __67__PLAssetsdDebugClient_processUnprocessedMomentLocationsWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  [v15 processUnprocessedMomentLocationsWithReply:&__block_literal_global_124];

  id v16 = *(void **)(*((void *)&buf + 1) + 40);
  id v17 = v16;
  id v18 = v17;
  if (v16 && a3) {
    *a3 = v17;
  }

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __67__PLAssetsdDebugClient_processUnprocessedMomentLocationsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient processUnprocessedMomentLocationsWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)processRecentHighlightsWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: processRecentHighlightsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  uint64_t v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__1897;
  long long v32 = __Block_byref_object_dispose__1898;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __57__PLAssetsdDebugClient_processRecentHighlightsWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  void v25[4] = &buf;
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  [v15 processRecentHighlightsWithReply:&__block_literal_global_121];

  id v16 = *(void **)(*((void *)&buf + 1) + 40);
  id v17 = v16;
  id v18 = v17;
  if (v16 && a3) {
    *a3 = v17;
  }

  uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    id v20 = PLRequestGetLog();
    os_signpost_id_t v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      id v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 == 0;
}

void __57__PLAssetsdDebugClient_processRecentHighlightsWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient processRecentHighlightsWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)prefetchResourcesWithMode:(int64_t)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: prefetchResourcesWithMode:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v22 = v10;
  uint64_t v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    id v25 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_116];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __50__PLAssetsdDebugClient_prefetchResourcesWithMode___block_invoke_117;
  v20[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  void v20[4] = a3;
  [v15 prefetchResourcesWithMode:a3 reply:v20];

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v16 = PLRequestGetLog();
    id v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      uint64_t v19 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v25 = v19;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __50__PLAssetsdDebugClient_prefetchResourcesWithMode___block_invoke_117(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  uint64_t v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136315394;
      int v12 = "-[PLAssetsdDebugClient prefetchResourcesWithMode:]_block_invoke";
      __int16 v13 = 2112;
      id v14 = v3;
      BOOL v6 = "Error prefetching resources: %s %@";
      int v7 = v5;
      os_log_type_t v8 = OS_LOG_TYPE_ERROR;
      uint32_t v9 = 22;
LABEL_6:
      _os_log_impl(&dword_19BCFB000, v7, v8, v6, (uint8_t *)&v11, v9);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    os_signpost_id_t v10 = *(const char **)(a1 + 32);
    int v11 = 134217984;
    int v12 = v10;
    BOOL v6 = "Prefetched resources: %ld";
    int v7 = v5;
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    uint32_t v9 = 12;
    goto LABEL_6;
  }
}

void __50__PLAssetsdDebugClient_prefetchResourcesWithMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient prefetchResourcesWithMode:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)prefetchResourcesForHighlights:(id)a3
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
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: prefetchResourcesForHighlights:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint32_t v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v24 = v10;
  int v11 = v9;
  int v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v27 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_113];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__PLAssetsdDebugClient_prefetchResourcesForHighlights___block_invoke_114;
  v21[3] = &unk_1E58A1EC0;
  id v16 = v5;
  id v22 = v16;
  [v15 prefetchResourcesForHighlights:v16 reply:v21];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    id v17 = PLRequestGetLog();
    os_signpost_id_t v18 = v17;
    os_signpost_id_t v19 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v20 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __55__PLAssetsdDebugClient_prefetchResourcesForHighlights___block_invoke_114(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_19BCFB000, v2, OS_LOG_TYPE_DEFAULT, "Prefetching resources for highlights %@", (uint8_t *)&v4, 0xCu);
  }
}

void __55__PLAssetsdDebugClient_prefetchResourcesForHighlights___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient prefetchResourcesForHighlights:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)prefetchResourcesForMemories:(id)a3
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
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: prefetchResourcesForMemories:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  uint32_t v9 = v7;
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  int v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  __int16 v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_108];
  [v13 prefetchResourcesForMemories:v5 reply:&__block_literal_global_111_1911];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    id v14 = PLRequestGetLog();
    uint64_t v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      id v16 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __53__PLAssetsdDebugClient_prefetchResourcesForMemories___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdDebugClient prefetchResourcesForMemories:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)pruneAssets:(id)a3 resourceTypes:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v20) = v9;
  if (v9)
  {
    *((void *)&v20 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: pruneAssets:resourceTypes:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  os_signpost_id_t v10 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v11 = os_signpost_id_generate(v10);
  int v12 = v10;
  __int16 v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v24 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  uint64_t v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v16 = [v15 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_103];
  [v16 pruneAssetsWithUUID:v7 resourceTypes:v8 reply:&__block_literal_global_106];

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if (v11)
  {
    long long v17 = PLRequestGetLog();
    long long v18 = v17;
    if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      os_signpost_id_t v19 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v24 = v19;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __50__PLAssetsdDebugClient_pruneAssets_resourceTypes___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  uint64_t v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdDebugClient pruneAssets:resourceTypes:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)debugSidecarFileURLsForAsset:(id)a3 debugSidecarFileURLs:(id *)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  long long v42 = 0u;
  *(_OWORD *)sel = 0u;
  long long v41 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v41) = v9;
  if (v9)
  {
    os_signpost_id_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: debugSidecarFileURLsForAsset:debugSidecarFileURLs:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v11 = (void *)*((void *)&v41 + 1);
    *((void *)&v41 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  int v12 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  *(void *)&long long v42 = v13;
  id v14 = v12;
  uint64_t v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v8)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 395, @"Invalid parameter not satisfying: %@", @"asset" object file lineNumber description];
  }
  if (!a4)
  {
    uint64_t v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 396, @"Invalid parameter not satisfying: %@", @"sidecarFileURLs" object file lineNumber description];
  }
  uint64_t v37 = 0;
  v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__1897;
  v47 = __Block_byref_object_dispose__1898;
  id v48 = 0;
  uint64_t v31 = 0;
  long long v32 = &v31;
  uint64_t v33 = 0x3032000000;
  uint64_t v34 = __Block_byref_object_copy__1897;
  long long v35 = __Block_byref_object_dispose__1898;
  id v36 = 0;
  long long v17 = [v8 objectID];
  long long v18 = [v17 URIRepresentation];

  os_signpost_id_t v19 = [(PLAssetsdBaseClient *)self proxyFactory];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __80__PLAssetsdDebugClient_debugSidecarFileURLsForAsset_debugSidecarFileURLs_error___block_invoke;
  v30[3] = &unk_1E58A1C40;
  v30[4] = &buf;
  long long v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v30];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __80__PLAssetsdDebugClient_debugSidecarFileURLsForAsset_debugSidecarFileURLs_error___block_invoke_95;
  v29[3] = &unk_1E58A1D30;
  v29[4] = &v31;
  v29[5] = &v37;
  v29[6] = &buf;
  [v20 debugSidecarURLsWithObjectURI:v18 reply:v29];

  if (*((unsigned char *)v38 + 24))
  {
    *a4 = (id) v32[5];
    int v21 = *((unsigned __int8 *)v38 + 24);
  }
  else
  {
    int v21 = 0;
  }

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v37, 8);
  if ((_BYTE)v41) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if ((void)v42)
  {
    uint64_t v22 = PLRequestGetLog();
    long long v23 = v22;
    os_signpost_id_t v24 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      uint64_t v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21 != 0;
}

void __80__PLAssetsdDebugClient_debugSidecarFileURLsForAsset_debugSidecarFileURLs_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient debugSidecarFileURLsForAsset:debugSidecarFileURLs:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __80__PLAssetsdDebugClient_debugSidecarFileURLsForAsset_debugSidecarFileURLs_error___block_invoke_95(void *a1, int a2, void *a3, void *a4)
{
  id v18 = a3;
  id v7 = a4;
  id v8 = v7;
  if (a2)
  {
    __int16 v9 = [MEMORY[0x1E4F1CA48] array];
    if ([v18 count])
    {
      unint64_t v10 = 0;
      do
      {
        objc_msgSend(NSString, "stringWithFormat:", @"debugSidecarFileURL-%i", v10);
        id v11 = objc_claimAutoreleasedReturnValue();
        int v12 = PLSandboxedURLFromDictionary(v18, [v11 cStringUsingEncoding:4]);

        if (!v12) {
          break;
        }
        [v9 addObject:v12];

        ++v10;
      }
      while ([v18 count] > v10);
    }
    uint64_t v13 = [v9 copy];
    uint64_t v14 = *(void *)(a1[4] + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;

    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    uint64_t v16 = *(void *)(a1[6] + 8);
    id v17 = v7;
    __int16 v9 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v17;
  }
}

- (BOOL)revertToOriginalForAsset:(id)a3 error:(id *)a4
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
    __int16 v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: revertToOriginalForAsset:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    unint64_t v10 = (void *)*((void *)&v33 + 1);
    *((void *)&v33 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v34 + 8));
  }
  id v11 = PLRequestGetLog();
  *((void *)&v35 + 1) = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v34 = v12;
  uint64_t v13 = v11;
  uint64_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(*((SEL *)&v35 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v7)
  {
    uint64_t v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 369, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v37 = 0x3032000000;
  v38 = __Block_byref_object_copy__1897;
  uint64_t v39 = __Block_byref_object_dispose__1898;
  id v40 = 0;
  uint64_t v16 = [v7 URIRepresentation];
  id v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __55__PLAssetsdDebugClient_revertToOriginalForAsset_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  v28[4] = &buf;
  id v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __55__PLAssetsdDebugClient_revertToOriginalForAsset_error___block_invoke_88;
  v27[3] = &unk_1E58A17B8;
  v27[4] = &buf;
  v27[5] = &v29;
  [v18 revertToOriginalWithObjectURI:v16 reply:v27];

  if (a4)
  {
    os_signpost_id_t v19 = *(void **)(*((void *)&buf + 1) + 40);
    if (v19) {
      *a4 = v19;
    }
  }
  int v20 = *((unsigned __int8 *)v30 + 24);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v29, 8);
  if ((_BYTE)v33) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v34 + 8));
  }
  if ((void)v34)
  {
    int v21 = PLRequestGetLog();
    uint64_t v22 = v21;
    os_signpost_id_t v23 = v34;
    if ((unint64_t)(v34 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      os_signpost_id_t v24 = sel_getName(*((SEL *)&v35 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20 != 0;
}

void __55__PLAssetsdDebugClient_revertToOriginalForAsset_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDebugClient revertToOriginalForAsset:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __55__PLAssetsdDebugClient_revertToOriginalForAsset_error___block_invoke_88(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Unable to revert to original for asset with error: %@", (uint8_t *)&v6, 0xCu);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (void)enqueuePrefetch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: enqueuePrefetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    os_signpost_id_t v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_84];
  [v11 enqueuePrefetch];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      uint64_t v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __39__PLAssetsdDebugClient_enqueuePrefetch__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient enqueuePrefetch]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)clearPrefetchState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: clearPrefetchState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    os_signpost_id_t v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  id v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_82];
  [v11 clearPrefetchState];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      uint64_t v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __42__PLAssetsdDebugClient_clearPrefetchState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient clearPrefetchState]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)getCPLStateForDebug:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getCPLStateForDebug:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v24 = v10;
  uint64_t v11 = v9;
  os_signpost_id_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  uint64_t v28 = __Block_byref_object_copy__1897;
  uint64_t v29 = __Block_byref_object_dispose__1898;
  id v30 = 0;
  uint64_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  long long v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_79];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __44__PLAssetsdDebugClient_getCPLStateForDebug___block_invoke_80;
  v22[3] = &unk_1E589F2B8;
  v22[4] = &buf;
  [v15 getCPLStateForDebug:v3 withReply:v22];

  id v16 = *(id *)(*((void *)&buf + 1) + 40);
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
      uint64_t v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16;
}

void __44__PLAssetsdDebugClient_getCPLStateForDebug___block_invoke_80(uint64_t a1, void *a2)
{
}

void __44__PLAssetsdDebugClient_getCPLStateForDebug___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient getCPLStateForDebug:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)getTaskConstraintStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getTaskConstraintStatus", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  __int16 v9 = v7;
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__1897;
  uint64_t v27 = __Block_byref_object_dispose__1898;
  id v28 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_76];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __47__PLAssetsdDebugClient_getTaskConstraintStatus__block_invoke_77;
  v20[3] = &unk_1E589F2B8;
  void v20[4] = &buf;
  [v13 getTaskConstraintStatusWithReply:v20];

  id v14 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      id v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14;
}

void __47__PLAssetsdDebugClient_getTaskConstraintStatus__block_invoke_77(uint64_t a1, void *a2)
{
}

void __47__PLAssetsdDebugClient_getTaskConstraintStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient getTaskConstraintStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (id)getXPCTransactionStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getXPCTransactionStatus", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  __int16 v9 = v7;
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = __Block_byref_object_copy__1897;
  uint64_t v27 = __Block_byref_object_dispose__1898;
  id v28 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_73];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __47__PLAssetsdDebugClient_getXPCTransactionStatus__block_invoke_74;
  v20[3] = &unk_1E589F2B8;
  void v20[4] = &buf;
  [v13 getXPCTransactionStatusWithReply:v20];

  id v14 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      id v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14;
}

void __47__PLAssetsdDebugClient_getXPCTransactionStatus__block_invoke_74(uint64_t a1, void *a2)
{
}

void __47__PLAssetsdDebugClient_getXPCTransactionStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient getXPCTransactionStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)rebuildTableThumbs
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rebuildTableThumbs", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    os_signpost_id_t v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_68];
  [v11 rebuildTableThumbsWithReply:&__block_literal_global_71];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __42__PLAssetsdDebugClient_rebuildTableThumbs__block_invoke_69(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    int v4 = 138412546;
    id v5 = v2;
    __int16 v6 = 2080;
    id v7 = "-[PLAssetsdDebugClient rebuildTableThumbs]_block_invoke";
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_DEBUG, "Finished table thumb rebuild with status: %@, for %s", (uint8_t *)&v4, 0x16u);
  }
}

void __42__PLAssetsdDebugClient_rebuildTableThumbs__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdDebugClient rebuildTableThumbs]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (int64_t)removeAllThumbnailsForDryRun:(BOOL)a3 count:(unint64_t *)a4
{
  BOOL v5 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x2020000000;
  uint64_t v31 = 0;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v8;
  if (v8)
  {
    os_activity_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: removeAllThumbnailsForDryRun:count:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(*((os_activity_t *)&v25 + 1), (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v26 = v12;
  uint64_t v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    long long v33 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_64];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __59__PLAssetsdDebugClient_removeAllThumbnailsForDryRun_count___block_invoke_65;
  v24[3] = &unk_1E589F308;
  v24[4] = &v28;
  v24[5] = a4;
  [v17 removeAllThumbnailsForDryRun:v5 reply:v24];

  int64_t v18 = v29[3];
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    os_signpost_id_t v19 = PLRequestGetLog();
    uint64_t v20 = v19;
    os_signpost_id_t v21 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      long long v22 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v33 = v22;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v28, 8);
  return v18;
}

void __59__PLAssetsdDebugClient_removeAllThumbnailsForDryRun_count___block_invoke_65(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  uint64_t v5 = [a3 longLongValue];
  uint64_t v6 = *(void *)(a1 + 40);
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  if (v6) {
    **(void **)(a1 + 40) = [v7 unsignedIntegerValue];
  }
}

void __59__PLAssetsdDebugClient_removeAllThumbnailsForDryRun_count___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient removeAllThumbnailsForDryRun:count:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)rebuildAllThumbnails
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rebuildAllThumbnails", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    os_signpost_id_t v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_62];
  [v11 rebuildAllThumbnails];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __44__PLAssetsdDebugClient_rebuildAllThumbnails__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient rebuildAllThumbnails]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)rebuildCloudFeed
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rebuildCloudFeed", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    os_signpost_id_t v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_57];
  [v11 rebuildCloudFeedWithReply:&__block_literal_global_60];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __40__PLAssetsdDebugClient_rebuildCloudFeed__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  BOOL v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient rebuildCloudFeed]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)indexAssetsWithUUIDs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v18 = 0;
  os_signpost_id_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  os_signpost_id_t v21 = __Block_byref_object_copy__1897;
  long long v22 = __Block_byref_object_dispose__1898;
  id v23 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  id v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__PLAssetsdDebugClient_indexAssetsWithUUIDs_error___block_invoke;
  v13[3] = &unk_1E58A1C40;
  void v13[4] = &v18;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__PLAssetsdDebugClient_indexAssetsWithUUIDs_error___block_invoke_55;
  v12[3] = &unk_1E58A17E0;
  v12[4] = &v14;
  v12[5] = &v18;
  [v8 indexAssetsWithUUIDs:v6 reply:v12];

  if (a4)
  {
    os_activity_t v9 = (void *)v19[5];
    if (v9) {
      *a4 = v9;
    }
  }
  char v10 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v10;
}

void __51__PLAssetsdDebugClient_indexAssetsWithUUIDs_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient indexAssetsWithUUIDs:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __51__PLAssetsdDebugClient_indexAssetsWithUUIDs_error___block_invoke_55(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

- (id)requestSearchDebugInformationForAssetUUID:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v20 = 0;
  os_signpost_id_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = __Block_byref_object_copy__1897;
  long long v24 = __Block_byref_object_dispose__1898;
  id v25 = 0;
  uint64_t v14 = 0;
  long long v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = __Block_byref_object_copy__1897;
  uint64_t v18 = __Block_byref_object_dispose__1898;
  id v19 = 0;
  int v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__PLAssetsdDebugClient_requestSearchDebugInformationForAssetUUID_error___block_invoke;
  v13[3] = &unk_1E58A1C40;
  void v13[4] = &v14;
  uint64_t v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PLAssetsdDebugClient_requestSearchDebugInformationForAssetUUID_error___block_invoke_54;
  v12[3] = &unk_1E589F908;
  v12[4] = &v20;
  [v8 searchAttributesForAssetWithUUID:v6 reply:v12];

  if (a4)
  {
    __int16 v9 = (void *)v15[5];
    if (v9) {
      *a4 = v9;
    }
  }
  id v10 = (id)v21[5];
  _Block_object_dispose(&v14, 8);

  _Block_object_dispose(&v20, 8);
  return v10;
}

void __72__PLAssetsdDebugClient_requestSearchDebugInformationForAssetUUID_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient requestSearchDebugInformationForAssetUUID:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __72__PLAssetsdDebugClient_requestSearchDebugInformationForAssetUUID_error___block_invoke_54(uint64_t a1, void *a2)
{
}

- (BOOL)rebuildSearchIndexWithError:(id *)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v25) = v6;
  if (v6)
  {
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rebuildSearchIndexWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  __int16 v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v26 = v10;
  uint64_t v11 = v9;
  os_signpost_id_t v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__1897;
  uint64_t v31 = __Block_byref_object_dispose__1898;
  id v32 = 0;
  uint64_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __52__PLAssetsdDebugClient_rebuildSearchIndexWithError___block_invoke;
  v24[3] = &unk_1E58A1C40;
  v24[4] = &buf;
  long long v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v24];
  [v15 rebuildSearchIndexWithReply:&__block_literal_global_53];

  uint64_t v16 = *((void *)&buf + 1);
  if (a3)
  {
    char v17 = *(void **)(*((void *)&buf + 1) + 40);
    if (v17)
    {
      *a3 = v17;
      uint64_t v16 = *((void *)&buf + 1);
    }
  }
  uint64_t v18 = *(void *)(v16 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    id v19 = PLRequestGetLog();
    uint64_t v20 = v19;
    os_signpost_id_t v21 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      uint64_t v22 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v22;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v18 == 0;
}

void __52__PLAssetsdDebugClient_rebuildSearchIndexWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient rebuildSearchIndexWithError:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)synchronouslySetSearchIndexPaused:(BOOL)a3 reason:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  if (_os_feature_enabled_impl())
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 204, @"Pausing search indexing no longer supported.  To signal that there may be search indexing work that needs to be done, register the background job service using registerBackgroundJobServiceIfNecessaryOnLibraryPath.  To force search indexing, use forceRunBackgroundJobsOnLibraryPath" object file lineNumber description];
  }
  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v11;
  if (v11)
  {
    os_signpost_id_t v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslySetSearchIndexPaused:reason:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v13 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  uint64_t v14 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v15 = os_signpost_id_generate(v14);
  *(void *)&long long v31 = v15;
  uint64_t v16 = v14;
  char v17 = v16;
  if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  long long v35 = __Block_byref_object_copy__1897;
  id v36 = __Block_byref_object_dispose__1898;
  id v37 = 0;
  id v19 = [(PLAssetsdBaseClient *)self proxyFactory];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __71__PLAssetsdDebugClient_synchronouslySetSearchIndexPaused_reason_error___block_invoke;
  v29[3] = &unk_1E58A1C40;
  v29[4] = &buf;
  uint64_t v20 = [v19 synchronousRemoteObjectProxyWithErrorHandler:v29];
  [v20 setSearchIndexPaused:v6 reason:v9 reply:&__block_literal_global_50_1931];

  uint64_t v21 = *((void *)&buf + 1);
  if (a5)
  {
    uint64_t v22 = *(void **)(*((void *)&buf + 1) + 40);
    if (v22)
    {
      *a5 = v22;
      uint64_t v21 = *((void *)&buf + 1);
    }
  }
  uint64_t v23 = *(void *)(v21 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    long long v24 = PLRequestGetLog();
    long long v25 = v24;
    os_signpost_id_t v26 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      uint64_t v27 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v27;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v23 == 0;
}

void __71__PLAssetsdDebugClient_synchronouslySetSearchIndexPaused_reason_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdDebugClient synchronouslySetSearchIndexPaused:reason:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (void)closeSearchIndexWithCompletionHandler:(id)a3
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
    int v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: closeSearchIndexWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if (!v5)
  {
    os_signpost_id_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 187, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  __int16 v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__PLAssetsdDebugClient_closeSearchIndexWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v24 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __62__PLAssetsdDebugClient_closeSearchIndexWithCompletionHandler___block_invoke_40;
  v16[3] = &unk_1EEBF56D0;
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
    uint64_t v11 = PLRequestGetLog();
    os_signpost_id_t v12 = v11;
    os_signpost_id_t v13 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __62__PLAssetsdDebugClient_closeSearchIndexWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdDebugClient closeSearchIndexWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PLAssetsdDebugClient_closeSearchIndexWithCompletionHandler___block_invoke_40(uint64_t a1, void *a2)
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
      uint64_t v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__PLAssetsdDebugClient_closeSearchIndexWithCompletionHandler___block_invoke_41;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 closeSearchIndexWithReply:v11];
}

uint64_t __62__PLAssetsdDebugClient_closeSearchIndexWithCompletionHandler___block_invoke_41(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dropSearchIndexWithCompletionHandler:(id)a3
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
    __int16 v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: dropSearchIndexWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if (!v5)
  {
    os_signpost_id_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 172, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__PLAssetsdDebugClient_dropSearchIndexWithCompletionHandler___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v24 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  void v16[2] = __61__PLAssetsdDebugClient_dropSearchIndexWithCompletionHandler___block_invoke_36;
  v16[3] = &unk_1EEBF56D0;
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
    uint64_t v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v27 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __61__PLAssetsdDebugClient_dropSearchIndexWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdDebugClient dropSearchIndexWithCompletionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__PLAssetsdDebugClient_dropSearchIndexWithCompletionHandler___block_invoke_36(uint64_t a1, void *a2)
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
      uint64_t v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PLAssetsdDebugClient_dropSearchIndexWithCompletionHandler___block_invoke_37;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 dropSearchIndexWithReply:v11];
}

uint64_t __61__PLAssetsdDebugClient_dropSearchIndexWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)allMomentsMetadataWithOutputPath:(id)a3 metadataDictionary:(id *)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v37 = 0u;
  *(_OWORD *)sel = 0u;
  long long v36 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v36) = v10;
  if (v10)
  {
    uint64_t v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: allMomentsMetadataWithOutputPath:metadataDictionary:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v36 + 1);
    *((void *)&v36 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v37 + 8));
  }
  os_signpost_id_t v13 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  *(void *)&long long v37 = v14;
  os_signpost_id_t v15 = v13;
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a4)
  {
    long long v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 153, @"Invalid parameter not satisfying: %@", @"metadataDictionary" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  uint64_t v41 = __Block_byref_object_copy__1897;
  long long v42 = __Block_byref_object_dispose__1898;
  id v43 = 0;
  uint64_t v30 = 0;
  long long v31 = &v30;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__1897;
  uint64_t v34 = __Block_byref_object_dispose__1898;
  id v35 = 0;
  char v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __82__PLAssetsdDebugClient_allMomentsMetadataWithOutputPath_metadataDictionary_error___block_invoke;
  v29[3] = &unk_1E58A1C40;
  v29[4] = &buf;
  id v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v29];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __82__PLAssetsdDebugClient_allMomentsMetadataWithOutputPath_metadataDictionary_error___block_invoke_35;
  v28[3] = &unk_1E589F908;
  v28[4] = &v30;
  [v19 dumpMomentsMetadataToPath:v9 reply:v28];

  if (a5)
  {
    long long v20 = *(void **)(*((void *)&buf + 1) + 40);
    if (v20) {
      *a5 = v20;
    }
  }
  *a4 = (id) v31[5];
  uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v36) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v37 + 8));
  }
  if ((void)v37)
  {
    SEL v22 = PLRequestGetLog();
    uint64_t v23 = v22;
    os_signpost_id_t v24 = v37;
    if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      long long v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21 == 0;
}

void __82__PLAssetsdDebugClient_allMomentsMetadataWithOutputPath_metadataDictionary_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient allMomentsMetadataWithOutputPath:metadataDictionary:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __82__PLAssetsdDebugClient_allMomentsMetadataWithOutputPath_metadataDictionary_error___block_invoke_35(uint64_t a1, void *a2)
{
}

- (BOOL)dumpMetadataForMomentsWithOutputPath:(id)a3 metadataDirectory:(id *)a4 error:(id *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v36 = 0u;
  *(_OWORD *)sel = 0u;
  long long v35 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v35) = v10;
  if (v10)
  {
    uint64_t v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: dumpMetadataForMomentsWithOutputPath:metadataDirectory:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  os_signpost_id_t v13 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  *(void *)&long long v36 = v14;
  os_signpost_id_t v15 = v13;
  uint64_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__1897;
  uint64_t v41 = __Block_byref_object_dispose__1898;
  id v42 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__1897;
  uint64_t v33 = __Block_byref_object_dispose__1898;
  id v34 = 0;
  char v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __85__PLAssetsdDebugClient_dumpMetadataForMomentsWithOutputPath_metadataDirectory_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  v28[4] = &buf;
  id v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __85__PLAssetsdDebugClient_dumpMetadataForMomentsWithOutputPath_metadataDirectory_error___block_invoke_30;
  v27[3] = &unk_1E589F908;
  v27[4] = &v29;
  [v19 dumpMetadataForMomentsToPath:v9 reply:v27];

  if (a5)
  {
    long long v20 = *(void **)(*((void *)&buf + 1) + 40);
    if (v20) {
      *a5 = v20;
    }
  }
  if (a4) {
    *a4 = (id) v30[5];
  }
  uint64_t v21 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v29, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    SEL v22 = PLRequestGetLog();
    uint64_t v23 = v22;
    os_signpost_id_t v24 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      long long v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21 == 0;
}

void __85__PLAssetsdDebugClient_dumpMetadataForMomentsWithOutputPath_metadataDirectory_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdDebugClient dumpMetadataForMomentsWithOutputPath:metadataDirectory:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __85__PLAssetsdDebugClient_dumpMetadataForMomentsWithOutputPath_metadataDirectory_error___block_invoke_30(uint64_t a1, void *a2)
{
}

- (BOOL)rebuildHighlightsDeletingExistingHighlights:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v8;
  if (v8)
  {
    __int16 v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rebuildHighlightsDeletingExistingHighlights:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v33 = v12;
  os_signpost_id_t v13 = v11;
  os_signpost_id_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
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
  long long v37 = __Block_byref_object_copy__1897;
  uint64_t v38 = __Block_byref_object_dispose__1898;
  id v39 = 0;
  uint64_t v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __74__PLAssetsdDebugClient_rebuildHighlightsDeletingExistingHighlights_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  v27[4] = &buf;
  id v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __74__PLAssetsdDebugClient_rebuildHighlightsDeletingExistingHighlights_error___block_invoke_29;
  v25[3] = &unk_1E589F2E0;
  BOOL v26 = v5;
  void v25[4] = &buf;
  void v25[5] = &v28;
  [v17 rebuildHighlightsDeletingExistingHighlights:v5 reply:v25];

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
    uint64_t v21 = v20;
    os_signpost_id_t v22 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      uint64_t v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 != 0;
}

void __74__PLAssetsdDebugClient_rebuildHighlightsDeletingExistingHighlights_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDebugClient rebuildHighlightsDeletingExistingHighlights:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  BOOL v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __74__PLAssetsdDebugClient_rebuildHighlightsDeletingExistingHighlights_error___block_invoke_29(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = 67109378;
      v7[1] = v6;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Error synchronously rebuilding moments and delete existing ones before: %d, error: %@", (uint8_t *)v7, 0x12u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (BOOL)rebuildMomentsDeletingExistingMoments:(BOOL)a3 error:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: rebuildMomentsDeletingExistingMoments:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v33 = v12;
  os_signpost_id_t v13 = v11;
  os_signpost_id_t v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
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
  long long v37 = __Block_byref_object_copy__1897;
  uint64_t v38 = __Block_byref_object_dispose__1898;
  id v39 = 0;
  uint64_t v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __68__PLAssetsdDebugClient_rebuildMomentsDeletingExistingMoments_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  v27[4] = &buf;
  id v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __68__PLAssetsdDebugClient_rebuildMomentsDeletingExistingMoments_error___block_invoke_28;
  v25[3] = &unk_1E589F2E0;
  BOOL v26 = v5;
  void v25[4] = &buf;
  void v25[5] = &v28;
  [v17 rebuildMomentsDeletingExistingMoments:v5 reply:v25];

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
    uint64_t v21 = v20;
    os_signpost_id_t v22 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      uint64_t v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 != 0;
}

void __68__PLAssetsdDebugClient_rebuildMomentsDeletingExistingMoments_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDebugClient rebuildMomentsDeletingExistingMoments:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __68__PLAssetsdDebugClient_rebuildMomentsDeletingExistingMoments_error___block_invoke_28(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    uint64_t v5 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = *(unsigned __int8 *)(a1 + 48);
      v7[0] = 67109378;
      v7[1] = v6;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_ERROR, "Error synchronously rebuilding moments and delete existing ones before: %d, error: %@", (uint8_t *)v7, 0x12u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)momentGenerationStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    uint64_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: momentGenerationStatus", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  int v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  id v9 = v7;
  uint64_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  BOOL v26 = __Block_byref_object_copy__1897;
  long long v27 = __Block_byref_object_dispose__1898;
  id v28 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_26];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __46__PLAssetsdDebugClient_momentGenerationStatus__block_invoke_27;
  v20[3] = &unk_1E589F2B8;
  void v20[4] = &buf;
  [v13 momentGenerationStatusWithReply:v20];

  id v14 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      char v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14;
}

void __46__PLAssetsdDebugClient_momentGenerationStatus__block_invoke_27(uint64_t a1, void *a2)
{
}

void __46__PLAssetsdDebugClient_momentGenerationStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient momentGenerationStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)recoverAssetsInInconsistentCloudState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: recoverAssetsInInconsistentCloudState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    int v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  uint64_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_24];
  [v11 recoverAssetsInInconsistentCloudState];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __61__PLAssetsdDebugClient_recoverAssetsInInconsistentCloudState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient recoverAssetsInInconsistentCloudState]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)identifyAssetsWithInconsistentCloudState
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: identifyAssetsWithInconsistentCloudState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  uint64_t v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  id v7 = v5;
  uint64_t v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    int v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  uint64_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22_1967];
  [v11 identifyAssetsWithInconsistentCloudState];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    os_signpost_id_t v12 = PLRequestGetLog();
    os_signpost_id_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      id v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __64__PLAssetsdDebugClient_identifyAssetsWithInconsistentCloudState__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdDebugClient identifyAssetsWithInconsistentCloudState]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)unloadImageFilesForAsset:(id)a3 minimumFormat:(int)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v11;
  if (v11)
  {
    os_signpost_id_t v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: unloadImageFilesForAsset:minimumFormat:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v13 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if (!v10)
  {
    long long v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PLAssetsdDebugClient.m", 43, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v14 = [v9 URIRepresentation];
  long long v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __81__PLAssetsdDebugClient_unloadImageFilesForAsset_minimumFormat_completionHandler___block_invoke;
  v32[3] = &unk_1E58A1BC8;
  id v33 = v10;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __81__PLAssetsdDebugClient_unloadImageFilesForAsset_minimumFormat_completionHandler___block_invoke_17;
  v23[3] = &unk_1EEBF50A0;
  char v26 = v34;
  id v27 = *((id *)&v34 + 1);
  long long v28 = v35;
  long long v29 = v36;
  SEL v30 = a2;
  id v16 = v14;
  id v24 = v16;
  int v31 = a4;
  id v17 = v33;
  id v25 = v17;
  [v15 remoteObjectProxyWithErrorHandler:v32 handler:v23];

  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    char v18 = PLRequestGetLog();
    int v19 = v18;
    os_signpost_id_t v20 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(*((SEL *)&v36 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __81__PLAssetsdDebugClient_unloadImageFilesForAsset_minimumFormat_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    __int16 v6 = "-[PLAssetsdDebugClient unloadImageFilesForAsset:minimumFormat:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __81__PLAssetsdDebugClient_unloadImageFilesForAsset_minimumFormat_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    __int16 v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 asynchronousUnloadImageFilesForAssetWithObjectURI:*(void *)(a1 + 32) minimumFormat:*(unsigned __int16 *)(a1 + 104) reply:*(void *)(a1 + 40)];
}

- (id)getStatus
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    os_signpost_id_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getStatus", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  __int16 v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  uint64_t v9 = v7;
  id v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v25 = 0x3032000000;
  char v26 = __Block_byref_object_copy__1897;
  id v27 = __Block_byref_object_dispose__1898;
  id v28 = 0;
  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  os_signpost_id_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1980];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __33__PLAssetsdDebugClient_getStatus__block_invoke_5;
  v20[3] = &unk_1E589F2B8;
  void v20[4] = &buf;
  [v13 statusWithReply:v20];

  id v14 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      char v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14;
}

void __33__PLAssetsdDebugClient_getStatus__block_invoke_5(uint64_t a1, void *a2)
{
}

void __33__PLAssetsdDebugClient_getStatus__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdDebugClient getStatus]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end