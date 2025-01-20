@interface PLAssetsdDebugService
- (PLAssetsdDebugService)initWithLibraryServicesManager:(id)a3 resourceDownloader:(id)a4 bundleController:(id)a5 connectionAuthorization:(id)a6;
- (id)_persistentStoreCoordinator;
- (id)runAssetContainmentOnAllSocialGroups:(id)a3;
- (id)runAssetContainmentOnSocialGroup:(id)a3 reply:(id)a4;
- (id)updateAndSaveAssetPersonEdgesWithReply:(id)a3;
- (void)archiveComputeCacheWithReply:(id)a3;
- (void)assetContainmentLargeFaceThresholdUserDefault:(id)a3;
- (void)assetContainmentSmallFaceThresholdUserDefault:(id)a3;
- (void)assetContainmentSmallTorsoThresholdUserDefault:(id)a3;
- (void)asynchronousUnloadImageFilesForAssetWithObjectURI:(id)a3 minimumFormat:(unsigned __int16)a4 reply:(id)a5;
- (void)backgroundMigrationWithReply:(id)a3;
- (void)cleanupEmptyHighlightsWithReply:(id)a3;
- (void)clearPrefetchState;
- (void)closeSearchIndexWithReply:(id)a3;
- (void)coalesceJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withChangeJournalOverThreshold:(float)a5 reply:(id)a6;
- (void)computeCacheStatusWithReply:(id)a3;
- (void)debugSidecarURLsWithObjectURI:(id)a3 reply:(id)a4;
- (void)dropSearchIndexWithReply:(id)a3;
- (void)dumpMetadataForMomentsToPath:(id)a3 reply:(id)a4;
- (void)dumpMomentsMetadataToPath:(id)a3 reply:(id)a4;
- (void)enqueuePrefetch;
- (void)getCPLStateForDebug:(BOOL)a3 withReply:(id)a4;
- (void)getTaskConstraintStatusWithReply:(id)a3;
- (void)getXPCTransactionStatusWithReply:(id)a3;
- (void)identifyAssetsWithInconsistentCloudState;
- (void)indexAssetsWithUUIDs:(id)a3 reply:(id)a4;
- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:(id)a3;
- (void)locationOfInterestUpdateWithReply:(id)a3;
- (void)momentGenerationStatusWithReply:(id)a3;
- (void)prefetchResourcesForHighlights:(id)a3 reply:(id)a4;
- (void)prefetchResourcesForMemories:(id)a3 reply:(id)a4;
- (void)prefetchResourcesWithMode:(int64_t)a3 reply:(id)a4;
- (void)privateDownloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 reply:(id)a6;
- (void)processRecentHighlightsWithReply:(id)a3;
- (void)processUnprocessedMomentLocationsWithReply:(id)a3;
- (void)pruneAssetsWithUUID:(id)a3 resourceTypes:(id)a4 reply:(id)a5;
- (void)rebuildAllThumbnails;
- (void)rebuildCloudFeedWithReply:(id)a3;
- (void)rebuildHighlightsDeletingExistingHighlights:(BOOL)a3 reply:(id)a4;
- (void)rebuildMomentsDeletingExistingMoments:(BOOL)a3 reply:(id)a4;
- (void)rebuildSearchIndexWithReply:(id)a3;
- (void)rebuildTableThumbsWithReply:(id)a3;
- (void)recoverAssetsInInconsistentCloudState;
- (void)removeAllThumbnailsForDryRun:(BOOL)a3 reply:(id)a4;
- (void)resetBackgroundMigrationClassName:(id)a3 reply:(id)a4;
- (void)resetComputeCacheWithReply:(id)a3;
- (void)resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:(id)a3;
- (void)resetMaintenanceTasksWithReply:(id)a3;
- (void)restoreComputeCacheWithReply:(id)a3;
- (void)revertToOriginalWithObjectURI:(id)a3 reply:(id)a4;
- (void)runMaintenanceTask:(id)a3 reply:(id)a4;
- (void)searchAttributesForAssetWithUUID:(id)a3 reply:(id)a4;
- (void)setAssetContainmentLargeFaceThreshold:(double)a3;
- (void)setAssetContainmentSmallFaceThreshold:(double)a3;
- (void)setAssetContainmentSmallTorsoThreshold:(double)a3;
- (void)setSearchIndexPaused:(BOOL)a3 reason:(id)a4 reply:(id)a5;
- (void)snapshotJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 reply:(id)a5;
- (void)statusWithReply:(id)a3;
- (void)syndicationIngestMutexStateDescriptionWithReply:(id)a3;
- (void)updateHighlightTitlesWithReply:(id)a3;
- (void)waitForMomentGenerationWithReply:(id)a3;
@end

@implementation PLAssetsdDebugService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_bundleController, 0);
  objc_storeStrong((id *)&self->_resourceDownloader, 0);
}

- (void)runMaintenanceTask:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  v7 = (void (**)(id, uint64_t, void *))a4;
  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v30) = v8;
  if (v8)
  {
    *((void *)&v30 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: runMaintenanceTask:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v30 + 1), (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  v9 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdDebugService runMaintenanceTask:reply:]"];
  if (v6)
  {
    v10 = NSClassFromString(v6);
    Class v11 = NSClassFromString(&cfstr_Plmaintenancet.isa);
    if (v10 && (v12 = v11) != 0)
    {
      id v13 = [v10 alloc];
      if (objc_opt_isKindOfClass())
      {
        v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
        id v15 = v13;
        v16 = [v14 libraryBundle];
        v17 = (void *)[v15 initWithLibraryBundle:v16];

        uint64_t v18 = [v17 runTaskWithTransaction:v9];
        if (v18)
        {
          v19 = 0;
        }
        else
        {
          v25 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v33 = *MEMORY[0x1E4F28228];
          v34 = @"runTaskWithTransaction failed";
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v34 forKeys:&v33 count:1];
          v19 = [v25 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v26];
        }
        v7[2](v7, v18, v19);
      }
      else
      {
        v22 = NSString;
        v23 = NSStringFromClass(v12);
        v14 = [v22 stringWithFormat:@"runMaintenanceTask error: %@ is not a %@", v6, v23];

        v24 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v35 = *MEMORY[0x1E4F28228];
        v36 = v14;
        v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
        v19 = [v24 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v17];
        v7[2](v7, 0, v19);
      }
    }
    else
    {
      id v13 = [NSString stringWithFormat:@"runMaintenanceTask for %@ - class not found", v6];
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v37 = *MEMORY[0x1E4F28228];
      id v38 = v13;
      v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      v17 = [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v14];
      v7[2](v7, 0, v17);
    }
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v39 = *MEMORY[0x1E4F28228];
    v40 = @"runMaintenanceTask for all (nil arg) not supported yet";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    v14 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v13];
    v7[2](v7, 0, v14);
  }

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    v27 = PLRequestGetLog();
    v28 = v27;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)resetMaintenanceTasksWithReply:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, uint64_t, id))a3;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetMaintenanceTasksWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  int v8 = (void *)MEMORY[0x1E4F8B858];
  v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v10 = [v9 libraryURL];
  Class v11 = [v8 appPrivateDataForLibraryURL:v10];

  v12 = [v11 valueForKey:@"PLDeferredCriticalMaintenanceTask"];
  if (v12)
  {
    id v13 = PLBackendGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v12;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_DEFAULT, "Maintenance Task: Removing critical marker: %@", buf, 0xCu);
    }

    id v21 = 0;
    uint64_t v14 = [v11 setValue:0 forKeyPath:@"PLDeferredCriticalMaintenanceTask" error:&v21];
    id v15 = v21;
  }
  else
  {
    v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_INFO, "Maintenance Task: Critical marker doesn't exist. Nothing to remove", buf, 2u);
    }

    id v15 = 0;
    uint64_t v14 = 1;
  }
  v4[2](v4, v14, v15);

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    v17 = PLRequestGetLog();
    uint64_t v18 = v17;
    os_signpost_id_t v19 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, BOOL, void))a3;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v9 = [v8 databaseContext];
  v10 = (void *)[v9 newShortLivedLibraryWithName:"-[PLAssetsdDebugService resetDrawAssetPersonEdgesBackgroundMigrationActionWithReply:]"];

  uint64_t v11 = objc_opt_class();
  v12 = [v10 pathManager];
  id v20 = 0;
  BOOL v13 = +[PLBackgroundModelMigration resetBackgroundActionClass:v11 pathManager:v12 error:&v20];
  id v14 = v20;

  if (v13) {
    id v15 = 0;
  }
  else {
    id v15 = v14;
  }
  ((void (**)(id, BOOL, id))v4)[2](v4, v13, v15);

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    v16 = PLRequestGetLog();
    v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)resetBackgroundMigrationClassName:(id)a3 reply:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  v6 = (NSString *)a3;
  v7 = (void (**)(id, BOOL, id))a4;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetBackgroundMigrationClassName:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForLibraryUpgrade])
  {
    uint64_t v11 = [MEMORY[0x1E4F8B8E0] setupWithLibraryIdentifier:0 type:1];
    v12 = PLMigrationGetLog();
    BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);

    if (v13)
    {
      if (v11)
      {
        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v41 = 0u;
        long long v39 = 0u;
        long long v40 = 0u;
        *(_OWORD *)buf = 0u;
        id v14 = PLMigrationGetLog();
        os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
        id v15 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
        int v36 = 138543362;
        uint64_t v37 = v15;
        LODWORD(v29) = 12;
        v16 = (uint8_t *)_os_log_send_and_compose_impl();

        objc_msgSend(v11, "logWithMessage:fromCodeLocation:type:", v16, "PLAssetsdDebugService.m", 1192, 0, &v36, v29);
        if (v16 != buf) {
          free(v16);
        }
      }
      else
      {
        id v20 = PLMigrationGetLog();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          long long v21 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEFAULT, "Reseting background migration action from client: %{public}@", buf, 0xCu);
        }
      }
    }
    Class v22 = NSClassFromString(v6);
    long long v23 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v24 = [v23 pathManager];
    id v30 = 0;
    BOOL v19 = +[PLBackgroundModelMigration resetBackgroundActionClass:v22 pathManager:v24 error:&v30];
    id v18 = v30;
  }
  else
  {
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    uint64_t v35 = @"Client not authorized to perform library migration";
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    id v18 = [v17 errorWithDomain:*MEMORY[0x1E4F8C500] code:41010 userInfo:v11];
    BOOL v19 = 0;
  }

  v7[2](v7, v19, v18);
  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)backgroundMigrationWithReply:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, BOOL, id))a3;
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v29) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: backgroundMigrationWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForLibraryUpgrade])
  {
    int v8 = [MEMORY[0x1E4F8B8E0] setupWithLibraryIdentifier:0 type:1];
    v9 = PLMigrationGetLog();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);

    if (v10)
    {
      if (v8)
      {
        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v50 = 0u;
        long long v51 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v39 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        *(_OWORD *)buf = 0u;
        uint64_t v11 = PLMigrationGetLog();
        os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
        v12 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
        int v34 = 138543362;
        uint64_t v35 = v12;
        LODWORD(v27) = 12;
        BOOL v13 = (uint8_t *)_os_log_send_and_compose_impl();

        objc_msgSend(v8, "logWithMessage:fromCodeLocation:type:", v13, "PLAssetsdDebugService.m", 1176, 0, &v34, v27);
        if (v13 != buf) {
          free(v13);
        }
      }
      else
      {
        id v18 = PLMigrationGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v19 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
          *(_DWORD *)buf = 138543362;
          *(void *)&uint8_t buf[4] = v19;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Background migration action client: %{public}@", buf, 0xCu);
        }
      }
    }
    id v20 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    long long v21 = [v20 libraryBundle];
    id v28 = 0;
    int64_t v22 = +[PLBackgroundModelMigration migrateBackgroundActionsWithPhotoLibraryBundle:v21 logger:v8 error:&v28 continuationHandler:&__block_literal_global_18245];
    id v16 = v28;

    BOOL v17 = v22 == 1;
  }
  else
  {
    id v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v32 = *MEMORY[0x1E4F28568];
    uint64_t v33 = @"Client not authorized to perform library migration";
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
    id v16 = [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:41010 userInfo:v15];

    BOOL v17 = 0;
  }
  v4[2](v4, v17, v16);

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    long long v23 = PLRequestGetLog();
    v24 = v23;
    os_signpost_id_t v25 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(void *)&uint8_t buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __54__PLAssetsdDebugService_backgroundMigrationWithReply___block_invoke()
{
  return 1;
}

- (void)waitForMomentGenerationWithReply:(id)a3
{
  v4 = (void (**)(id, void))a3;
  int v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v6 = [v5 momentGenerationDataManager];
  v7 = [v6 generator];

  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __58__PLAssetsdDebugService_waitForMomentGenerationWithReply___block_invoke;
  v10[3] = &unk_1E5875CE0;
  dispatch_semaphore_t v11 = v8;
  v9 = v8;
  [v7 generateWithIncrementalDataCompletionHandler:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
  v4[2](v4, 0);
}

intptr_t __58__PLAssetsdDebugService_waitForMomentGenerationWithReply___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)syndicationIngestMutexStateDescriptionWithReply:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void *))a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v17) = v5;
  if (v5)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: syndicationIngestMutexStateDescriptionWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v7 = [v6 databaseContext];

  dispatch_semaphore_t v8 = [v7 syndicationIngestMutex];
  v9 = [v8 syndicationIngestMutexStateDescription];

  if (v9)
  {
    BOOL v10 = 0;
  }
  else
  {
    dispatch_semaphore_t v11 = objc_msgSend(NSString, "stringWithFormat:", @"Unable to get state description. databaseContext = %p", v7);
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    long long v21 = v11;
    BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    BOOL v10 = [v12 errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v13];
  }
  v4[2](v4, v9, v10);

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    id v14 = PLRequestGetLog();
    id v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)computeCacheStatusWithReply:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *, void))a3;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v17) = v5;
  if (v5)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: computeCacheStatusWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v7 = [v6 computeCacheManager];

  if (v7)
  {
    dispatch_semaphore_t v8 = [v7 status];
    v4[2](v4, v8, 0);
  }
  else
  {
    v9 = NSString;
    BOOL v10 = +[PLComputeCacheManager name];
    dispatch_semaphore_t v8 = [v9 stringWithFormat:@"Failed to obtain manager: %@", v10];

    dispatch_semaphore_t v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F28228];
    long long v21 = v8;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    BOOL v13 = [v11 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v12];
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v13);
  }
  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    id v14 = PLRequestGetLog();
    id v15 = v14;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)resetComputeCacheWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, id))a3;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetComputeCacheWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  dispatch_semaphore_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v9 = [v8 computeCacheManager];

  if (v9)
  {
    id v20 = 0;
    [v9 resetComputeCacheWithError:&v20];
    id v10 = v20;
    v4[2](v4, v10);
  }
  else
  {
    dispatch_semaphore_t v11 = NSString;
    v12 = +[PLComputeCacheManager name];
    id v10 = [v11 stringWithFormat:@"Failed to obtain manager: %@", v12];

    BOOL v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    id v25 = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v15 = [v13 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v14];
    v4[2](v4, v15);
  }
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v16 = PLRequestGetLog();
    long long v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)archiveComputeCacheWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, id))a3;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: archiveComputeCacheWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  dispatch_semaphore_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v9 = [v8 computeCacheManager];

  if (v9)
  {
    id v20 = 0;
    [v9 createArchiveWithError:&v20];
    id v10 = v20;
    v4[2](v4, v10);
  }
  else
  {
    dispatch_semaphore_t v11 = NSString;
    v12 = +[PLComputeCacheManager name];
    id v10 = [v11 stringWithFormat:@"Failed to obtain manager: %@", v12];

    BOOL v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    id v25 = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v15 = [v13 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v14];
    v4[2](v4, v15);
  }
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v16 = PLRequestGetLog();
    long long v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (id)updateAndSaveAssetPersonEdgesWithReply:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v30) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateAndSaveAssetPersonEdgesWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  dispatch_semaphore_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v9 = [v8 databaseContext];

  id v10 = (void *)[v9 newShortLivedLibraryWithName:"-[PLAssetsdDebugService updateAndSaveAssetPersonEdgesWithReply:]"];
  dispatch_semaphore_t v11 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__18256;
  int v36 = __Block_byref_object_dispose__18257;
  id v37 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__18256;
  v28[4] = __Block_byref_object_dispose__18257;
  id v29 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __64__PLAssetsdDebugService_updateAndSaveAssetPersonEdgesWithReply___block_invoke;
  v22[3] = &unk_1E586EEA0;
  uint64_t v26 = v28;
  id v12 = v10;
  id v23 = v12;
  p_long long buf = &buf;
  id v13 = v11;
  id v24 = v13;
  id v14 = v4;
  id v25 = v14;
  [v12 performBlock:v22];
  id v15 = v25;
  id v16 = v13;

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    long long v17 = PLRequestGetLog();
    os_signpost_id_t v18 = v17;
    os_signpost_id_t v19 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16;
}

void __64__PLAssetsdDebugService_updateAndSaveAssetPersonEdgesWithReply___block_invoke(uint64_t a1)
{
  v2 = +[PLManagedAsset fetchRequest];
  [v2 setResultType:1];
  v3 = [*(id *)(a1 + 32) managedObjectContext];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  id obj = *(id *)(v4 + 40);
  uint64_t v5 = [v3 executeFetchRequest:v2 error:&obj];
  objc_storeStrong((id *)(v4 + 40), obj);
  uint64_t v6 = *(void *)(*(void *)(a1 + 56) + 8);
  v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  [*(id *)(a1 + 40) becomeCurrentWithPendingUnitCount:1];
  uint64_t v8 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  if (v8)
  {
    v9 = [*(id *)(a1 + 32) managedObjectContext];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    id v11 = *(id *)(v10 + 40);
    +[PLSocialGroupAssetContainment updateAndSaveAssetPersonEdgesForAssetsWithIDs:v8 inContext:v9 error:&v11];
    objc_storeStrong((id *)(v10 + 40), v11);
  }
  [*(id *)(a1 + 40) resignCurrent];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)restoreComputeCacheWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, id))a3;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v21) = v5;
  if (v5)
  {
    uint64_t v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: restoreComputeCacheWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v7 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  uint64_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v9 = [v8 computeCacheManager];

  if (v9)
  {
    id v20 = 0;
    [v9 restoreComputeCacheWithProgress:0 error:&v20];
    id v10 = v20;
    v4[2](v4, v10);
  }
  else
  {
    id v11 = NSString;
    id v12 = +[PLComputeCacheManager name];
    id v10 = [v11 stringWithFormat:@"Failed to obtain manager:  %@", v12];

    id v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    id v25 = v10;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    id v15 = [v13 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v14];
    v4[2](v4, v15);
  }
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v16 = PLRequestGetLog();
    long long v17 = v16;
    os_signpost_id_t v18 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)assetContainmentSmallTorsoThresholdUserDefault:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void))a3;
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: assetContainmentSmallTorsoThresholdUserDefault:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment assetContainmentSmallTorsoThreshold];
  v3[2](v3, 0);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    uint64_t v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setAssetContainmentSmallTorsoThreshold:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setAssetContainmentSmallTorsoThreshold:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment setAssetContainmentSmallTorsoThreshold:](PLSocialGroupAssetContainment, "setAssetContainmentSmallTorsoThreshold:", a3, (void)v8);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    uint64_t v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)assetContainmentLargeFaceThresholdUserDefault:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void))a3;
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: assetContainmentLargeFaceThresholdUserDefault:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment assetContainmentLargeFaceThreshold];
  v3[2](v3, 0);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    uint64_t v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setAssetContainmentLargeFaceThreshold:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setAssetContainmentLargeFaceThreshold:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment setAssetContainmentLargeFaceThreshold:](PLSocialGroupAssetContainment, "setAssetContainmentLargeFaceThreshold:", a3, (void)v8);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    uint64_t v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)assetContainmentSmallFaceThresholdUserDefault:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void))a3;
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: assetContainmentSmallFaceThresholdUserDefault:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment assetContainmentSmallFaceThreshold];
  v3[2](v3, 0);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    uint64_t v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)setAssetContainmentSmallFaceThreshold:(double)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setAssetContainmentSmallFaceThreshold:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  +[PLSocialGroupAssetContainment setAssetContainmentSmallFaceThreshold:](PLSocialGroupAssetContainment, "setAssetContainmentSmallFaceThreshold:", a3, (void)v8);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    uint64_t v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (id)runAssetContainmentOnSocialGroup:(id)a3 reply:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v8;
  if (v8)
  {
    char v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: runAssetContainmentOnSocialGroup:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v10 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  id v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v12 = [v11 databaseContext];
  id v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAssetsdDebugService runAssetContainmentOnSocialGroup:reply:]"];

  uint64_t v14 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __64__PLAssetsdDebugService_runAssetContainmentOnSocialGroup_reply___block_invoke;
  v26[3] = &unk_1E58710F0;
  id v15 = v13;
  id v27 = v15;
  id v16 = v6;
  id v28 = v16;
  id v17 = v7;
  id v30 = v17;
  id v18 = v14;
  id v29 = v18;
  [v15 performBlock:v26];
  os_signpost_id_t v19 = v29;
  id v20 = v18;

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    long long v21 = PLRequestGetLog();
    long long v22 = v21;
    os_signpost_id_t v23 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v20;
}

void __64__PLAssetsdDebugService_runAssetContainmentOnSocialGroup_reply___block_invoke(uint64_t a1)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = +[PLGraphLabel fetchLabelWithCode:1000 inContext:v2];

  int v4 = (void *)MEMORY[0x1E4F1C0D0];
  int v5 = +[PLGraphNode entityName];
  id v6 = [v4 fetchRequestWithEntityName:v5];

  id v7 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@ AND %K == %@", @"primaryLabel", v3, @"uuid", *(void *)(a1 + 40)];
  [v6 setPredicate:v7];

  int v8 = [*(id *)(a1 + 32) managedObjectContext];
  id v22 = 0;
  char v9 = [v8 executeFetchRequest:v6 error:&v22];
  id v10 = v22;
  id v11 = [v9 firstObject];

  if (v11)
  {
    id v12 = +[PLGraphNodeContainer newNodeContainerWithNode:v11];
    if (v10) {
      goto LABEL_9;
    }
  }
  else
  {
    id v13 = [NSString stringWithFormat:@"Can't find node."];
    uint64_t v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v23 = *MEMORY[0x1E4F28228];
    v24[0] = v13;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    uint64_t v17 = [v14 errorWithDomain:v15 code:41003 userInfo:v16];

    id v12 = 0;
    id v10 = (id)v17;
    if (v17) {
      goto LABEL_9;
    }
  }
  [*(id *)(a1 + 48) becomeCurrentWithPendingUnitCount:1];
  id v21 = 0;
  [v12 runAssetContainmentWithError:&v21 assetIDsToUpdate:0];
  id v10 = v21;
  [*(id *)(a1 + 48) resignCurrent];
  id v18 = [*(id *)(a1 + 32) managedObjectContext];
  os_signpost_id_t v19 = v18;
  if (v10)
  {
    [v18 rollback];
  }
  else
  {
    id v20 = 0;
    [v18 save:&v20];
    id v10 = v20;
  }

LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

- (id)runAssetContainmentOnAllSocialGroups:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v27) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: runAssetContainmentOnAllSocialGroups:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  int v8 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
  char v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v10 = [v9 databaseContext];
  id v11 = (void *)[v10 newShortLivedLibraryWithName:"-[PLAssetsdDebugService runAssetContainmentOnAllSocialGroups:]"];

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  long long v32 = __Block_byref_object_copy__18256;
  uint64_t v33 = __Block_byref_object_dispose__18257;
  id v34 = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__PLAssetsdDebugService_runAssetContainmentOnAllSocialGroups___block_invoke;
  v22[3] = &unk_1E58694A8;
  id v12 = v8;
  id v23 = v12;
  id v13 = v11;
  id v24 = v13;
  p_long long buf = &buf;
  id v14 = v4;
  id v25 = v14;
  [v13 performBlock:v22];
  uint64_t v15 = v25;
  id v16 = v12;

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    uint64_t v17 = PLRequestGetLog();
    id v18 = v17;
    os_signpost_id_t v19 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16;
}

uint64_t __62__PLAssetsdDebugService_runAssetContainmentOnAllSocialGroups___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) becomeCurrentWithPendingUnitCount:1];
  v2 = [*(id *)(a1 + 40) managedObjectContext];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v3 + 40);
  +[PLSocialGroup runAssetContainmentOnAllSocialGroupsInContext:v2 error:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);

  [*(id *)(a1 + 32) resignCurrent];
  uint64_t v4 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  int v5 = [*(id *)(a1 + 40) managedObjectContext];
  id v6 = v5;
  if (v4)
  {
    [v5 rollback];
  }
  else
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v9 = *(id *)(v7 + 40);
    [v5 save:&v9];
    objc_storeStrong((id *)(v7 + 40), v9);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)coalesceJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 withChangeJournalOverThreshold:(float)a5 reply:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v13 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v20) = v13;
  if (v13)
  {
    *((void *)&v20 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: coalesceJournalsForManagerName:payloadClassIDs:withChangeJournalOverThreshold:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v15 = [v14 journalManagerForName:v10];

  if (v15)
  {
    *(float *)&double v16 = a5;
    [v15 coalesceJournalsForPayloadClassIDs:v11 withChangeJournalOverThreshold:v12 completionHandler:v16];
  }
  else
  {
    v12[2](v12);
  }

  if (v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    uint64_t v17 = PLRequestGetLog();
    id v18 = v17;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)snapshotJournalsForManagerName:(id)a3 payloadClassIDs:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v26) = v11;
  if (v11)
  {
    id v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: snapshotJournalsForManagerName:payloadClassIDs:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v13 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  id v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v15 = [v14 journalManagerForName:v8];

  if (v15)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __78__PLAssetsdDebugService_snapshotJournalsForManagerName_payloadClassIDs_reply___block_invoke;
    v24[3] = &unk_1E5874D70;
    id v25 = v10;
    [v15 snapshotJournalsForPayloadClassIDs:v9 withCompletionHandler:v24];
    double v16 = v25;
  }
  else
  {
    double v16 = [NSString stringWithFormat:@"Invalid journal manager for name = %@", v8];
    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    id v30 = v16;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    os_signpost_id_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v18];
    (*((void (**)(id, void *))v10 + 2))(v10, v19);
  }
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    long long v20 = PLRequestGetLog();
    char v21 = v20;
    os_signpost_id_t v22 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __78__PLAssetsdDebugService_snapshotJournalsForManagerName_payloadClassIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)privateDownloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 reply:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  int v11 = (void (**)(void))a6;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  int v12 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v32) = v12;
  if (v12)
  {
    int v13 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: privateDownloadCloudPhotoLibraryAsset:resourceType:highPriority:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v15 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService privateDownloadCloudPhotoLibraryAsset:resourceType:highPriority:reply:]");
  double v16 = [v15 managedObjectContext];
  uint64_t v17 = [v16 persistentStoreCoordinator];

  id v18 = [v17 managedObjectIDForURIRepresentation:v10];
  os_signpost_id_t v19 = v18;
  if (v18 && ([v18 isTemporaryID] & 1) == 0)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __95__PLAssetsdDebugService_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_reply___block_invoke;
    v25[3] = &unk_1E5865F30;
    id v26 = v19;
    id v27 = v15;
    long long v28 = self;
    unint64_t v30 = a4;
    BOOL v31 = a5;
    uint64_t v29 = v11;
    [v27 performBlock:v25 withPriority:1];
  }
  else
  {
    long long v20 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "privateDownloadCloudPhotoLibraryAsset: invalid object URI", buf, 2u);
    }

    v11[2](v11);
  }

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    char v21 = PLRequestGetLog();
    os_signpost_id_t v22 = v21;
    os_signpost_id_t v23 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __95__PLAssetsdDebugService_privateDownloadCloudPhotoLibraryAsset_resourceType_highPriority_reply___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2 && ([v2 isDeleted] & 1) == 0)
  {
    int v5 = *(void **)(*(void *)(a1 + 48) + 16);
    uint64_t v6 = *(void *)(a1 + 64);
    uint64_t v7 = *(unsigned __int8 *)(a1 + 72);
    id v12 = 0;
    LOBYTE(v11) = 0;
    id v8 = (id)[v5 startCPLDownloadForAsset:v3 resourceType:v6 masterResourceOnly:0 highPriority:v7 track:0 notify:0 transient:v11 proposedTaskIdentifier:0 doneToken:0 error:&v12];
    id v9 = v12;
    if (v9)
    {
      id v10 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        id v14 = v9;
        _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "privateDownloadCloudPhotoLibraryAsset: error downloading asset. (%@)", buf, 0xCu);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  else
  {
    uint64_t v4 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_ERROR, "privateDownloadCloudPhotoLibraryAsset: invalid asset", buf, 2u);
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)locationOfInterestUpdateWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: locationOfInterestUpdateWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 momentGenerationDataManager];
  id v8 = [v7 generator];

  [v8 locationOfInterestUpdateWithCompletionBlock:v4];
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 momentGenerationDataManager];
  id v8 = [v7 generator];

  [v8 invalidateHighlightSubtitlesAndRegenerateHighlightTitlesWithCompletionBlock:v4];
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)cleanupEmptyHighlightsWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: cleanupEmptyHighlightsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 momentGenerationDataManager];
  id v8 = [v7 generator];

  [v8 cleanupEmptyHighlightsWithCompletionBlock:v4];
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)updateHighlightTitlesWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateHighlightTitlesWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 momentGenerationDataManager];
  id v8 = [v7 generator];

  [v8 updateHighlightTitlesWithCompletionBlock:v4];
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)processUnprocessedMomentLocationsWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: processUnprocessedMomentLocationsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 momentGenerationDataManager];
  id v8 = [v7 generator];

  [v8 processUnprocessedMomentLocationsWithCompletionBlock:v4];
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)processRecentHighlightsWithReply:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: processRecentHighlightsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v7 = [v6 momentGenerationDataManager];
  id v8 = [v7 generator];

  [v8 processRecentHighlightsWithCompletionBlock:v4];
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    id v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)prefetchResourcesWithMode:(int64_t)a3 reply:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: prefetchResourcesWithMode:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v11 = [v10 databaseContext];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke;
  v17[3] = &unk_1E5865F08;
  id v12 = v6;
  id v18 = v12;
  int64_t v19 = a3;
  [v11 perform:v17 withName:"-[PLAssetsdDebugService prefetchResourcesWithMode:reply:]"];

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    char v13 = PLRequestGetLog();
    long long v14 = v13;
    os_signpost_id_t v15 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke(uint64_t a1, void *a2)
{
  v51[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 libraryServicesManager];
  int v5 = [v4 cloudPhotoLibraryManager];

  if (v5)
  {
    id v6 = [PLCloudResourcePrefetchManager alloc];
    int v7 = [v3 libraryServicesManager];
    id v8 = [(PLCloudResourcePrefetchManager *)v6 initWithCPLManager:v5 pruneManager:0 libraryServicesManager:v7];

    id v9 = [PLPrefetchConfiguration alloc];
    id v10 = [v5 cplConfiguration];
    uint64_t v11 = [v10 valueForKey:*MEMORY[0x1E4F59750]];
    uint64_t v12 = [(PLPrefetchConfiguration *)v9 initWithPrefetchDictionary:v11];

    long long v42 = (void *)v12;
    char v13 = [[PLCloudResourcePrefetchPredicateOptions alloc] initWithPrefetchMode:*(void *)(a1 + 40) prefetchOptimizeMode:+[PLPrefetchConfiguration defaultPrefetchOptimizeMode] excludeDynamicResources:0 prefetchConfiguration:v12];
    long long v14 = PLPrefetchGetLog();
    os_signpost_id_t v15 = os_signpost_id_generate(v14);
    uint64_t v16 = *(void *)(a1 + 40);
    uint64_t v17 = v14;
    id v18 = v17;
    unint64_t v19 = v15 - 1;
    if (v16 == 3)
    {
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v15, "predicate", "", buf, 2u);
      }

      long long v20 = +[PLCloudResourcePrefetchPredicates predicatesForThumbnails:v13];
      long long v21 = v18;
      os_signpost_id_t v22 = v21;
      if (v19 > 0xFFFFFFFFFFFFFFFDLL)
      {

        BOOL v31 = v22;
      }
      else
      {
        if (os_signpost_enabled(v21))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v15, "predicate", "", buf, 2u);
        }

        os_signpost_id_t v23 = v22;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v15, "fetch", "", buf, 2u);
        }
      }

      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_93;
      v46[3] = &unk_1E5873370;
      long long v32 = (id *)&v47;
      long long v47 = v22;
      v48[1] = v15;
      long long v33 = (id *)v48;
      v48[0] = *(id *)(a1 + 32);
      id v34 = v22;
      uint64_t v35 = v46;
      uint64_t v36 = v8;
      uint64_t v37 = v20;
      id v38 = v3;
      uint64_t v39 = 0;
    }
    else
    {
      if (v19 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v15, "predicate", "", buf, 2u);
      }

      long long v20 = +[PLCloudResourcePrefetchPredicates predicatesForNonThumbnails:v13 lastCompletePrefetchDate:0];
      long long v28 = v18;
      uint64_t v29 = v28;
      if (v19 > 0xFFFFFFFFFFFFFFFDLL)
      {

        long long v40 = v29;
      }
      else
      {
        if (os_signpost_enabled(v28))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v15, "predicate", "", buf, 2u);
        }

        unint64_t v30 = v29;
        if (os_signpost_enabled(v30))
        {
          *(_WORD *)long long buf = 0;
          _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_BEGIN, v15, "fetch", "", buf, 2u);
        }
      }

      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_94;
      v43[3] = &unk_1E5873370;
      long long v32 = (id *)&v44;
      long long v44 = v29;
      v45[1] = v15;
      long long v33 = (id *)v45;
      v45[0] = *(id *)(a1 + 32);
      long long v41 = v29;
      uint64_t v35 = v43;
      uint64_t v36 = v8;
      uint64_t v37 = v20;
      id v38 = v3;
      uint64_t v39 = 4;
    }
    [(PLCloudResourcePrefetchManager *)v36 prefetchResourcesWithPredicates:v37 photoLibrary:v38 prefetchPhase:v39 completionHandler:v35];
  }
  else
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v25 = *MEMORY[0x1E4F8C500];
    uint64_t v50 = *MEMORY[0x1E4F28568];
    id v26 = [NSString stringWithFormat:@"Could not initialize cloud photo library manager because this library isn't the system library."];
    v51[0] = v26;
    id v27 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:&v50 count:1];
    id v8 = [v24 errorWithDomain:v25 code:41022 userInfo:v27];

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

uint64_t __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_93(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fetch", "", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__PLAssetsdDebugService_prefetchResourcesWithMode_reply___block_invoke_94(uint64_t a1)
{
  v2 = *(id *)(a1 + 32);
  id v3 = v2;
  os_signpost_id_t v4 = *(void *)(a1 + 48);
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
  {
    *(_WORD *)id v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_19B3C7000, v3, OS_SIGNPOST_INTERVAL_END, v4, "fetch", "", v6, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)prefetchResourcesForHighlights:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v22) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: prefetchResourcesForHighlights:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  uint64_t v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v12 = [v11 databaseContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__PLAssetsdDebugService_prefetchResourcesForHighlights_reply___block_invoke;
  v19[3] = &unk_1E5865EE0;
  id v13 = v6;
  id v20 = v13;
  id v14 = v7;
  id v21 = v14;
  [v12 perform:v19 withName:"-[PLAssetsdDebugService prefetchResourcesForHighlights:reply:]"];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __62__PLAssetsdDebugService_prefetchResourcesForHighlights_reply___block_invoke(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = [v3 libraryServicesManager];
  int v5 = [v4 cloudPhotoLibraryManager];

  id v6 = [PLCloudResourcePrefetchManager alloc];
  id v7 = [v3 libraryServicesManager];
  int v8 = [(PLCloudResourcePrefetchManager *)v6 initWithCPLManager:v5 pruneManager:0 libraryServicesManager:v7];

  uint64_t v9 = +[PLCloudResourcePrefetchPredicates predicateToPrefetchHighlightWithUUIDs:*(void *)(a1 + 32) photoLibrary:v3];
  id v10 = (void *)v9;
  if (v9)
  {
    v12[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    [(PLCloudResourcePrefetchManager *)v8 prefetchResourcesWithPredicates:v11 photoLibrary:v3 prefetchPhase:4 completionHandler:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)prefetchResourcesForMemories:(id)a3 reply:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v22) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: prefetchResourcesForMemories:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  uint64_t v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v12 = [v11 databaseContext];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __60__PLAssetsdDebugService_prefetchResourcesForMemories_reply___block_invoke;
  v19[3] = &unk_1E5865EE0;
  id v13 = v6;
  id v20 = v13;
  id v14 = v7;
  id v21 = v14;
  [v12 perform:v19 withName:"-[PLAssetsdDebugService prefetchResourcesForMemories:reply:]"];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    os_signpost_id_t v15 = PLRequestGetLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __60__PLAssetsdDebugService_prefetchResourcesForMemories_reply___block_invoke(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = [v3 libraryServicesManager];
  int v5 = [v4 cloudPhotoLibraryManager];

  if (v5)
  {
    id v6 = [PLCloudResourcePrefetchManager alloc];
    id v7 = [v3 libraryServicesManager];
    int v8 = [(PLCloudResourcePrefetchManager *)v6 initWithCPLManager:v5 pruneManager:0 libraryServicesManager:v7];

    uint64_t v9 = +[PLMemory memoriesWithUUIDs:*(void *)(a1 + 32) inPhotoLibrary:v3];
    id v10 = [PLPrefetchConfiguration alloc];
    uint64_t v11 = [v5 cplConfiguration];
    uint64_t v12 = [v11 valueForKey:*MEMORY[0x1E4F59750]];
    id v13 = [(PLPrefetchConfiguration *)v10 initWithPrefetchDictionary:v12];

    id v14 = [[PLCloudResourcePrefetchPredicateOptions alloc] initWithPrefetchMode:1 prefetchOptimizeMode:+[PLPrefetchConfiguration defaultPrefetchOptimizeMode] excludeDynamicResources:0 prefetchConfiguration:v13];
    uint64_t v15 = +[PLCloudResourcePrefetchPredicates predicateToPrefetchMemories:v9 photoLibrary:v3 options:v14];
    uint64_t v16 = (void *)v15;
    if (v15)
    {
      v18[0] = v15;
      os_signpost_id_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
      [(PLCloudResourcePrefetchManager *)v8 prefetchResourcesWithPredicates:v17 photoLibrary:v3 prefetchPhase:2 completionHandler:0];
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)pruneAssetsWithUUID:(id)a3 resourceTypes:(id)a4 reply:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v11;
  if (v11)
  {
    uint64_t v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: pruneAssetsWithUUID:resourceTypes:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  id v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v15 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v16 = [v15 databaseContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke;
  v25[3] = &unk_1E5865EB8;
  id v17 = v14;
  id v26 = v17;
  id v18 = v8;
  id v27 = v18;
  id v19 = v9;
  id v28 = v19;
  uint64_t v29 = self;
  id v20 = v10;
  id v30 = v20;
  [v16 perform:v25 withName:"-[PLAssetsdDebugService pruneAssetsWithUUID:resourceTypes:reply:]"];

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    id v21 = PLRequestGetLog();
    long long v22 = v21;
    os_signpost_id_t v23 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_signpost_id_t v4 = [*(id *)(a1 + 32) cloudPhotoLibraryManager];
  if (v4)
  {
    id v26 = v4;
    id v27 = [[PLCloudResourcePruneManager alloc] initWithCPLManager:v4 libraryServicesManager:*(void *)(a1 + 32)];
    +[PLManagedAsset assetsWithUUIDs:*(void *)(a1 + 40) options:1 inLibrary:v3];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    int v5 = (PLCloudResourcePruneManager *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [(PLCloudResourcePruneManager *)v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v35 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          int v11 = (void *)MEMORY[0x19F38D3B0]();
          if (v10 && ([v10 isDeleted] & 1) == 0)
          {
            uint64_t v12 = [v10 allCPLResourcesForPruning];
            id v13 = *(void **)(a1 + 48);
            if (v13)
            {
              v32[0] = MEMORY[0x1E4F143A8];
              v32[1] = 3221225472;
              v32[2] = __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke_2;
              v32[3] = &unk_1E5872F48;
              id v33 = v13;
              [v12 indexesOfObjectsPassingTest:v32];
              uint64_t v15 = v14 = v3;
              [v12 objectsAtIndexes:v15];
              v17 = uint64_t v16 = a1;

              id v3 = v14;
              uint64_t v12 = (void *)v17;
              a1 = v16;
            }
            [(PLCloudResourcePruneManager *)v27 pruneResources:v12 inPhotoLibrary:v3];
          }
        }
        uint64_t v7 = [(PLCloudResourcePruneManager *)v5 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v7);
    }

    os_signpost_id_t v4 = v26;
LABEL_24:

    goto LABEL_25;
  }
  id v18 = [*(id *)(a1 + 56) libraryServicesManager];
  uint64_t v19 = [v18 wellKnownPhotoLibraryIdentifier];

  if (v19 == 3)
  {
    +[PLManagedAsset assetsWithUUIDs:*(void *)(a1 + 40) options:1 inLibrary:v3];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    int v5 = (PLCloudResourcePruneManager *)(id)objc_claimAutoreleasedReturnValue();
    uint64_t v20 = [(PLCloudResourcePruneManager *)v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        for (uint64_t j = 0; j != v21; ++j)
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v5);
          }
          id v24 = *(void **)(*((void *)&v28 + 1) + 8 * j);
          uint64_t v25 = (void *)MEMORY[0x19F38D3B0]();
          [v24 purgeSyndicationResourcesOriginalsOnly:0];
        }
        uint64_t v21 = [(PLCloudResourcePruneManager *)v5 countByEnumeratingWithState:&v28 objects:v38 count:16];
      }
      while (v21);
    }
    id v27 = v5;
    goto LABEL_24;
  }
LABEL_25:
  (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
}

uint64_t __65__PLAssetsdDebugService_pruneAssetsWithUUID_resourceTypes_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "cplType"));
  uint64_t v4 = [*(id *)(a1 + 32) containsObject:v3];

  return v4;
}

- (void)debugSidecarURLsWithObjectURI:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: debugSidecarURLsWithObjectURI:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  int v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v12 = [v11 databaseContext];
  id v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAssetsdDebugService debugSidecarURLsWithObjectURI:reply:]"];

  id v14 = [v13 managedObjectContext];
  uint64_t v15 = [v14 persistentStoreCoordinator];
  uint64_t v16 = [v15 managedObjectIDForURIRepresentation:v6];

  if (v16)
  {
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    void v24[2] = __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke;
    v24[3] = &unk_1E5874868;
    id v25 = v14;
    id v26 = v16;
    id v27 = v7;
    [v13 performBlock:v24];

    uint64_t v17 = v25;
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28568];
    long long v32 = @"Invalid objectID value";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v17 = [v18 errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v19];

    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v17);
  }

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    uint64_t v20 = PLRequestGetLog();
    uint64_t v21 = v20;
    os_signpost_id_t v22 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) objectWithID:*(void *)(a1 + 40)];
  v2 = [MEMORY[0x1E4F1CA80] set];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke_2;
  v28[3] = &unk_1E5872C70;
  id v3 = v2;
  id v29 = v3;
  uint64_t v4 = MEMORY[0x19F38D650](v28);
  uint64_t v21 = v1;
  int v5 = [v1 pathForDiagnosticFile];
  uint64_t v19 = (void *)v4;
  (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  os_signpost_id_t v22 = objc_opt_new();
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v25 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void *)(*((void *)&v24 + 1) + 8 * v11);
        unsigned __int8 v23 = 0;
        id v13 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v14 = [v13 fileExistsAtPath:v12 isDirectory:&v23];
        int v15 = v23;

        if (v14) {
          BOOL v16 = v15 == 0;
        }
        else {
          BOOL v16 = 0;
        }
        if (v16)
        {
          objc_msgSend(NSString, "stringWithFormat:", @"debugSidecarFileURL-%i", v9);
          id v17 = objc_claimAutoreleasedReturnValue();
          [v17 cStringUsingEncoding:4];
          id v18 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v12];
          PLDictionarySetSandboxedURL();

          uint64_t v9 = (v9 + 1);
        }
        ++v11;
      }
      while (v8 != v11);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __61__PLAssetsdDebugService_debugSidecarURLsWithObjectURI_reply___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return [*(id *)(result + 32) addObject:a2];
  }
  return result;
}

- (void)revertToOriginalWithObjectURI:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v27) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: revertToOriginalWithObjectURI:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  uint64_t v11 = [(PLAssetsdDebugService *)self _persistentStoreCoordinator];
  uint64_t v12 = [v11 managedObjectIDForURIRepresentation:v6];
  id v13 = v12;
  if (v12 && ([v12 isTemporaryID] & 1) == 0)
  {
    uint64_t v19 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v20 = [v19 databaseContext];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __61__PLAssetsdDebugService_revertToOriginalWithObjectURI_reply___block_invoke;
    v25[3] = &unk_1E5865E90;
    long long v26 = v13;
    [v20 performTransactionSync:v25 withName:"-[PLAssetsdDebugService revertToOriginalWithObjectURI:reply:]"];

    id v18 = 0;
    int v14 = v26;
  }
  else
  {
    int v14 = [NSString stringWithFormat:@"Invalid objectID: %@, isTemporaryID: %d", v13, objc_msgSend(v13, "isTemporaryID")];
    int v15 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v14;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Cannot revert asset with error: %@", buf, 0xCu);
    }

    BOOL v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v30 = *MEMORY[0x1E4F28568];
    uint64_t v31 = v14;
    id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    id v18 = [v16 errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v17];
  }
  v7[2](v7, v18);

  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    uint64_t v21 = PLRequestGetLog();
    os_signpost_id_t v22 = v21;
    os_signpost_id_t v23 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __61__PLAssetsdDebugService_revertToOriginalWithObjectURI_reply___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:a2];
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    int v5 = v2;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_DEFAULT, "Reverting asset %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 revertToOriginal];
}

- (void)enqueuePrefetch
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v3;
  if (v3)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: enqueuePrefetch", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  int v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [v4 cloudPhotoLibraryManager];

  [v5 startAutomaticPrefetchOrPrune];
  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    uint64_t v6 = PLRequestGetLog();
    uint64_t v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)clearPrefetchState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v3;
  if (v3)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: clearPrefetchState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  int v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [v4 cloudPhotoLibraryManager];

  [v5 clearPrefetchState];
  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    uint64_t v6 = PLRequestGetLog();
    uint64_t v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getCPLStateForDebug:(BOOL)a3 withReply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, __CFString *))a4;
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v7 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v7;
  if (v7)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getCPLStateForDebug:withReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v9 = [v8 cloudPhotoLibraryManager];

  if (v9) {
    [v9 getCPLStateForDebug:v4 completionHandler:v6];
  }
  else {
    v6[2](v6, @"No CPL manager configured\n");
  }

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    char v10 = PLRequestGetLog();
    long long v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getTaskConstraintStatusWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getTaskConstraintStatusWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  int v5 = +[PLCameraCaptureTaskConstraintCoordinator taskConstraintStatus];
  v3[2](v3, v5);

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    uint64_t v6 = PLRequestGetLog();
    int v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      char v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getXPCTransactionStatusWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = (void (**)(id, void *))a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getXPCTransactionStatusWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA48], "openXPCTransactionStatus", (void)v9);
  v3[2](v3, v5);

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    uint64_t v6 = PLRequestGetLog();
    int v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      char v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)rebuildTableThumbsWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, __CFString *))a3;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v23) = v5;
  if (v5)
  {
    *((void *)&v23 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rebuildTableThumbsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v23 + 1), (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  uint64_t v6 = [(PLAssetsdDebugService *)self _persistentStoreCoordinator];
  int v7 = [v6 persistentStores];
  int v8 = [v7 firstObject];

  long long v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  char v10 = [v9 modelMigrator];

  long long v11 = [v10 _migrationThumbnailManagerWithStore:v8];
  uint64_t v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v13 = [v12 databaseContext];
  char v14 = (void *)[v13 newShortLivedLibraryWithName:"-[PLAssetsdDebugService rebuildTableThumbsWithReply:]"];

  uint64_t v15 = [v14 managedObjectContext];
  [v11 resetThumbnailsWithResetType:1 deferHintChanges:0 inContext:v15];

  BOOL v16 = (void *)MEMORY[0x1E4F8B9F8];
  id v17 = [v14 pathManager];
  id v18 = [v16 tableThumbnailFormatsForConfigPhase:1 withPathManager:v17];

  uint64_t v19 = objc_alloc_init(PLTableThumbnailMigrator);
  [(PLTableThumbnailMigrator *)v19 migrateAllAssetsPendingTableThumbRebuildInLibrary:v14 toTableFormats:v18 limit:0];
  v4[2](v4, @"done");

  if (v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    uint64_t v20 = PLRequestGetLog();
    uint64_t v21 = v20;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v21, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)removeAllThumbnailsForDryRun:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (void (**)(id, void *, void *))a4;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v7 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v19) = v7;
  if (v7)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: removeAllThumbnailsForDryRun:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  *(void *)long long buf = 0;
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v9 = [v8 databaseContext];
  char v10 = (void *)[v9 newShortLivedLibraryWithName:"-[PLAssetsdDebugService removeAllThumbnailsForDryRun:reply:]"];

  long long v11 = [v10 thumbnailManager];
  uint64_t v12 = [v10 managedObjectContext];
  uint64_t v13 = [v11 removeAllThumbnailsInContextForUrgentCacheDeleteRequest:v12 dryRun:v4 count:buf];

  char v14 = [NSNumber numberWithUnsignedInteger:*(void *)buf];
  uint64_t v15 = [NSNumber numberWithLongLong:v13];
  v6[2](v6, v14, v15);

  if (v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    BOOL v16 = PLRequestGetLog();
    id v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      *(void *)&uint8_t buf[4] = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)rebuildAllThumbnails
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  memset(v11, 0, 32);
  long long v10 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v3;
  if (v3)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rebuildAllThumbnails", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)&v11[0].opaque[1]);
  }
  BOOL v4 = [(PLAssetsdDebugService *)self _persistentStoreCoordinator];
  int v5 = [v4 persistentStores];
  uint64_t v6 = [v5 firstObject];

  int v7 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v8 = [v7 modelMigrator];
  objc_msgSend(v8, "debug_resetThumbnailsAndInitiateRebuildRequestInStore:", v6);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)PLPhotoLibraryForceClientExitNotification, 0, 0, 0);
  sleep(1u);
  exit(1);
}

- (void)rebuildCloudFeedWithReply:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v5;
  if (v5)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rebuildCloudFeedWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  uint64_t v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v7 = [v6 databaseContext];
  int v8 = (void *)[v7 newShortLivedLibraryWithName:"-[PLAssetsdDebugService rebuildCloudFeedWithReply:]"];

  long long v9 = [[PLCloudFeedEntriesManager alloc] initWithPhotoLibrary:v8];
  [(PLCloudFeedEntriesManager *)v9 rebuildAllEntries:v4];

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    long long v10 = PLRequestGetLog();
    long long v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)indexAssetsWithUUIDs:(id)a3 reply:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v9 = [v8 searchIndexingEngine];

  long long v10 = PLGatekeeperXPCGetLog();
  long long v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v6;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Search: Index Assets: %@", buf, 0xCu);
    }

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __52__PLAssetsdDebugService_indexAssetsWithUUIDs_reply___block_invoke;
    v17[3] = &unk_1E586F0F0;
    id v18 = v7;
    [v9 indexAssetsWithUUIDs:v6 partialUpdateMask:3 completion:v17];
    uint64_t v12 = v18;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      long long v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      *(_DWORD *)long long buf = 138412546;
      id v22 = v13;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Failed to get IndexingEngine for libraryServicesManager %@. Unable to index assets: %@", buf, 0x16u);
    }
    char v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v15 = *MEMORY[0x1E4F8C500];
    uint64_t v19 = *MEMORY[0x1E4F28228];
    char v20 = @"No PLSearchIndexingEngine.";
    BOOL v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    uint64_t v12 = [v14 errorWithDomain:v15 code:41008 userInfo:v16];

    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __52__PLAssetsdDebugService_indexAssetsWithUUIDs_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (void)searchAttributesForAssetWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v25 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v25) = v8;
  if (v8)
  {
    long long v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: searchAttributesForAssetWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = __Block_byref_object_copy__18256;
  uint64_t v31 = __Block_byref_object_dispose__18257;
  id v32 = 0;
  id v11 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdDebugService searchAttributesForAssetWithUUID:reply:]");
  uint64_t v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __64__PLAssetsdDebugService_searchAttributesForAssetWithUUID_reply___block_invoke;
  v20[3] = &unk_1E5875368;
  id v13 = v6;
  id v21 = v13;
  id v14 = v11;
  id v22 = v14;
  id v15 = v12;
  id v23 = v15;
  p_long long buf = &buf;
  [v14 performBlockAndWait:v20];
  v7[2](v7, *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    BOOL v16 = PLRequestGetLog();
    id v17 = v16;
    os_signpost_id_t v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __64__PLAssetsdDebugService_searchAttributesForAssetWithUUID_reply___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) managedObjectContext];
  id v12 = +[PLManagedAsset assetWithUUID:v2 inManagedObjectContext:v3];

  uint64_t v4 = [PLSearchIndexConfiguration alloc];
  id v5 = [*(id *)(a1 + 48) pathManager];
  id v6 = [(PLSearchIndexConfiguration *)v4 initWithPathManager:v5];

  uint64_t v7 = [*(id *)(a1 + 48) wellKnownPhotoLibraryIdentifier];
  int v8 = [(PLSearchIndexConfiguration *)v6 indexingContext];
  uint64_t v9 = +[PLSpotlightAssetTranslator _jsonRepresentationFromAsset:v12 libraryIdentifier:v7 graphData:MEMORY[0x1E4F1CC08] indexingContext:v8 includeEmbeddingData:0];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;
}

- (void)rebuildSearchIndexWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(void))a3;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rebuildSearchIndexWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isSearchIndexingEnabled];

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      uint64_t v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v11 = [v10 databaseContext];
      id v12 = (void *)[v11 newShortLivedLibraryWithName:"-[PLAssetsdDebugService rebuildSearchIndexWithReply:]"];

      id v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v14 = [v13 searchIndexingEngine];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __53__PLAssetsdDebugService_rebuildSearchIndexWithReply___block_invoke;
      v21[3] = &unk_1E5875198;
      id v22 = v4;
      [v14 resetSearchIndexWithReason:5 library:v12 dropCompletion:v21 completion:0];

      id v15 = v22;
    }
    else
    {
      id v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v15 = [v12 searchIndexManager];
      [v15 resetSearchIndexWithReason:5 dropCompletion:v4];
    }
  }
  else
  {
    BOOL v16 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v27 = "-[PLAssetsdDebugService rebuildSearchIndexWithReply:]";
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4) {
      v4[2](v4);
    }
  }
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
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __53__PLAssetsdDebugService_rebuildSearchIndexWithReply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setSearchIndexPaused:(BOOL)a3 reason:(id)a4 reply:(id)a5
{
  BOOL v6 = a3;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  int v9 = (void (**)(void))a5;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v10 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v19) = v10;
  if (v10)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setSearchIndexPaused:reason:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  id v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v12 = [v11 isSearchIndexingEnabled];

  if (!v12)
  {
    id v13 = PLGatekeeperXPCGetLog();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    *(_DWORD *)long long buf = 136315138;
    long long v24 = "-[PLAssetsdDebugService setSearchIndexPaused:reason:reply:]";
    id v14 = "Search index manager disabled, unable to perform operation %s";
    goto LABEL_10;
  }
  if (_os_feature_enabled_impl())
  {
    if (v6)
    {
      id v13 = PLGatekeeperXPCGetLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_17;
      }
      *(_DWORD *)long long buf = 136315138;
      long long v24 = "-[PLAssetsdDebugService setSearchIndexPaused:reason:reply:]";
      id v14 = "Pausing search indexing no longer supported for background job indexing %s";
      goto LABEL_10;
    }
    id v13 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v24 = "-[PLAssetsdDebugService setSearchIndexPaused:reason:reply:]";
      id v14 = "Unpausing search indexing no longer supported for background job indexing.  Force run the appropriate backgr"
            "ound job instead %s";
LABEL_10:
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
    }
  }
  else
  {
    id v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    [v13 searchIndexManager];
    if (v6) {
      id v15 = {;
    }
      [v15 pauseIndexingWithReason:v8];
    }
    else {
      id v15 = {;
    }
      [v15 unpauseIndexingWithReason:v8];
    }
  }
LABEL_17:

  if (v9) {
    v9[2](v9);
  }
  if (v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    BOOL v16 = PLRequestGetLog();
    id v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)closeSearchIndexWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: closeSearchIndexWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isSearchIndexingEnabled];

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      int v10 = +[PLConcurrencyLimiter sharedLimiter];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      void v18[2] = __51__PLAssetsdDebugService_closeSearchIndexWithReply___block_invoke;
      v18[3] = &unk_1E58742F0;
      v18[4] = self;
      id v19 = v4;
      [v10 sync:v18 identifyingBlock:0 library:0];
    }
    else
    {
      id v13 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v24 = "-[PLAssetsdDebugService closeSearchIndexWithReply:]";
        _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Closing search index not supported for legacy search indexing %s", buf, 0xCu);
      }
    }
  }
  else
  {
    id v11 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v24 = "-[PLAssetsdDebugService closeSearchIndexWithReply:]";
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
    }

    if (v4)
    {
      int v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
      (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v12);
    }
  }
  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    id v14 = PLRequestGetLog();
    id v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __51__PLAssetsdDebugService_closeSearchIndexWithReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) libraryServicesManager];
  id v3 = [v2 searchIndexingEngine];
  [v3 close];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)dropSearchIndexWithReply:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: dropSearchIndexWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v7 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v9 = [v8 isSearchIndexingEnabled];

  if (v9)
  {
    if (_os_feature_enabled_impl())
    {
      int v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v11 = [v10 searchIndexingEngine];
      int v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", "-[PLAssetsdDebugService dropSearchIndexWithReply:]");
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke;
      v22[3] = &unk_1E586F0F0;
      id v23 = v4;
      [v11 dropSearchIndexWithSourceName:v12 completion:v22];

      id v13 = &v23;
    }
    else
    {
      int v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v11 = [v10 searchIndexManager];
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke_2;
      v20[3] = &unk_1E5875198;
      id v21 = v4;
      [v11 dropSearchIndexWithCompletion:v20];
      id v13 = &v21;
    }

    id v15 = *v13;
    goto LABEL_12;
  }
  id v14 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315138;
    uint64_t v28 = "-[PLAssetsdDebugService dropSearchIndexWithReply:]";
    _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Search index manager disabled, unable to perform operation %s", buf, 0xCu);
  }

  if (v4)
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46309 userInfo:0];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v15);
LABEL_12:
  }
  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    os_signpost_id_t v16 = PLRequestGetLog();
    id v17 = v16;
    os_signpost_id_t v18 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

uint64_t __50__PLAssetsdDebugService_dropSearchIndexWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dumpMomentsMetadataToPath:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  long long v17 = 0u;
  *(_OWORD *)sel = 0u;
  long long v16 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v16) = v8;
  if (v8)
  {
    *((void *)&v16 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: dumpMomentsMetadataToPath:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if (MEMORY[0x19F38BDA0]())
  {
    int v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    int v10 = [v9 momentGenerationDataManager];
    id v11 = [v10 generator];

    int v12 = [v11 allMomentsMetadataWriteToFile:v6];
  }
  else
  {
    int v12 = 0;
  }
  v7[2](v7, v12);

  if ((_BYTE)v16) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if ((void)v17)
  {
    id v13 = PLRequestGetLog();
    id v14 = v13;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)dumpMetadataForMomentsToPath:(id)a3 reply:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void *))a4;
  long long v17 = 0u;
  *(_OWORD *)sel = 0u;
  long long v16 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v16) = v8;
  if (v8)
  {
    *((void *)&v16 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: dumpMetadataForMomentsToPath:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v16 + 1), (os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if (MEMORY[0x19F38BDA0]())
  {
    int v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    int v10 = [v9 momentGenerationDataManager];
    id v11 = [v10 generator];

    int v12 = [v11 allAssetMetadataWriteToFile:v6];
  }
  else
  {
    int v12 = 0;
  }
  v7[2](v7, v12);

  if ((_BYTE)v16) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v17 + 8));
  }
  if ((void)v17)
  {
    id v13 = PLRequestGetLog();
    id v14 = v13;
    if ((unint64_t)(v17 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v20 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)rebuildHighlightsDeletingExistingHighlights:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v7;
  if (v7)
  {
    int v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rebuildHighlightsDeletingExistingHighlights:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v9 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  int v10 = (void *)MEMORY[0x19F38D3B0]();
  id v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v12 = [v11 momentGenerationDataManager];
  id v13 = [v12 generator];

  if (v13)
  {
    uint64_t v29 = PLMomentGenerationShouldDeleteAllHighlightsKey;
    id v14 = [NSNumber numberWithBool:v4];
    uint64_t v30 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __75__PLAssetsdDebugService_rebuildHighlightsDeletingExistingHighlights_reply___block_invoke;
    v22[3] = &unk_1E5875198;
    id v23 = v6;
    [v13 rebuildAllHighlightsWithOptions:v15 completionHandler:v22];
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v28 = @"Failed to obtain moment generator";
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v15 = [v16 errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v17];

    (*((void (**)(id, void *))v6 + 2))(v6, v15);
  }

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    os_signpost_id_t v18 = PLRequestGetLog();
    id v19 = v18;
    os_signpost_id_t v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __75__PLAssetsdDebugService_rebuildHighlightsDeletingExistingHighlights_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)rebuildMomentsDeletingExistingMoments:(BOOL)a3 reply:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v7;
  if (v7)
  {
    int v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: rebuildMomentsDeletingExistingMoments:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v9 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  int v10 = (void *)MEMORY[0x19F38D3B0]();
  id v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v12 = [v11 momentGenerationDataManager];
  id v13 = [v12 generator];

  if (v13)
  {
    uint64_t v29 = PLMomentGenerationShouldDeleteAllMomentsKey;
    id v14 = [NSNumber numberWithBool:v4];
    uint64_t v30 = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];

    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __69__PLAssetsdDebugService_rebuildMomentsDeletingExistingMoments_reply___block_invoke;
    v22[3] = &unk_1E5875198;
    id v23 = v6;
    [v13 rebuildAllMomentsWithOptions:v15 completionHandler:v22];
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v27 = *MEMORY[0x1E4F28568];
    uint64_t v28 = @"Failed to obtain moment generator";
    long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
    id v15 = [v16 errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:v17];

    (*((void (**)(id, void *))v6 + 2))(v6, v15);
  }

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    os_signpost_id_t v18 = PLRequestGetLog();
    id v19 = v18;
    os_signpost_id_t v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __69__PLAssetsdDebugService_rebuildMomentsDeletingExistingMoments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)momentGenerationStatusWithReply:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (void (**)(id, void *))a3;
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v5;
  if (v5)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: momentGenerationStatusWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v7 = [v6 momentGenerationDataManager];
  int v8 = [v7 generator];

  int v9 = [v8 momentGenerationStatus];
  v4[2](v4, v9);

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    int v10 = PLRequestGetLog();
    id v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)recoverAssetsInInconsistentCloudState
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v3;
  if (v3)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: recoverAssetsInInconsistentCloudState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  BOOL v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [v4 cloudPhotoLibraryManager];

  if (v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F8BA48]);
    int v7 = [PLManagedAssetRecoveryManager alloc];
    int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    int v9 = [(PLManagedAssetRecoveryManager *)v7 initWithLibraryServicesManager:v8];

    [(PLManagedAssetRecoveryManager *)v9 startRecoveryUsingCloudPhotoLibraryManager:v5 transaction:v6 shouldIdentifyInconsistentAssets:0];
  }

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    int v10 = PLRequestGetLog();
    id v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)identifyAssetsWithInconsistentCloudState
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  int v3 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v3;
  if (v3)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: identifyAssetsWithInconsistentCloudState", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  BOOL v4 = [PLManagedAssetRecoveryManager alloc];
  int v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v6 = [(PLManagedAssetRecoveryManager *)v4 initWithLibraryServicesManager:v5];

  [(PLManagedAssetRecoveryManager *)v6 identifyAssetsWithInconsistentCloudState];
  if ((_BYTE)v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    int v7 = PLRequestGetLog();
    int v8 = v7;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      char v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asynchronousUnloadImageFilesForAssetWithObjectURI:(id)a3 minimumFormat:(unsigned __int16)a4 reply:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v44 = 0u;
  *(_OWORD *)sel = 0u;
  long long v43 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v43) = v10;
  if (v10)
  {
    long long v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: asynchronousUnloadImageFilesForAssetWithObjectURI:minimumFormat:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v12 = (void *)*((void *)&v43 + 1);
    *((void *)&v43 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v44 + 8));
  }
  uint64_t v39 = 0;
  uint64_t v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  uint64_t v50 = __Block_byref_object_copy__18256;
  long long v51 = __Block_byref_object_dispose__18257;
  id v52 = 0;
  if (MEMORY[0x19F38BDA0]())
  {
    long long v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    char v14 = [v13 databaseContext];
    uint64_t v15 = (void *)[v14 newShortLivedLibraryWithName:"-[PLAssetsdDebugService asynchronousUnloadImageFilesForAssetWithObjectURI:minimumFormat:reply:]"];

    long long v16 = [v15 managedObjectContext];
    long long v17 = [v16 persistentStoreCoordinator];

    os_signpost_id_t v18 = [v17 managedObjectIDForURIRepresentation:v8];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke;
    v33[3] = &unk_1E5873EB0;
    id v19 = v18;
    id v34 = v19;
    id v20 = v15;
    unsigned __int16 v38 = a4;
    id v35 = v20;
    long long v36 = &v39;
    p_long long buf = &buf;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_8;
    v29[3] = &unk_1E5873410;
    id v30 = v9;
    uint64_t v31 = &v39;
    id v32 = &buf;
    [v20 performTransaction:v33 completionHandler:v29];
  }
  else
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    long long v47 = @"Unauthorized access";
    id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v47 forKeys:&v46 count:1];
    uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:41010 userInfo:v22];
    long long v24 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v23;

    (*((void (**)(id, void, void))v9 + 2))(v9, *((unsigned __int8 *)v40 + 24), *(void *)(*((void *)&buf + 1) + 40));
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v39, 8);
  if ((_BYTE)v43) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v44 + 8));
  }
  if ((void)v44)
  {
    long long v25 = PLRequestGetLog();
    long long v26 = v25;
    os_signpost_id_t v27 = v44;
    if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke(uint64_t a1)
{
  context = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  int v32 = [v2 isEditableFromAssetsLibrary];
  char v3 = [v2 hasAdjustments];
  uint64_t v31 = [v2 uuid];
  id v30 = [v2 thumbnailIdentifier];
  uint64_t v4 = [v2 effectiveThumbnailIndex];
  char v5 = [v2 isRAWOnly];
  char v6 = [v2 isRAWPlusJPEG];
  int v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  v79[0] = MEMORY[0x1E4F143A8];
  v79[1] = 3221225472;
  v79[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_2;
  v79[3] = &unk_1E5865DC8;
  id v28 = v7;
  id v80 = v28;
  id v8 = (void *)MEMORY[0x19F38D650](v79);
  uint64_t v75 = 0;
  v76 = &v75;
  uint64_t v77 = 0x2020000000;
  char v78 = 0;
  uint64_t v69 = 0;
  uint64_t v70 = &v69;
  uint64_t v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__18256;
  v73 = __Block_byref_object_dispose__18257;
  id v74 = 0;
  v63[0] = MEMORY[0x1E4F143A8];
  v63[1] = 3221225472;
  v63[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_3;
  v63[3] = &unk_1E5865DF0;
  char v68 = v6;
  long long v66 = &v75;
  id v9 = v8;
  id v65 = v9;
  id v10 = v2;
  id v64 = v10;
  long long v67 = &v69;
  id v34 = (void (**)(void))MEMORY[0x19F38D650](v63);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_4;
  v57[3] = &unk_1E5865DF0;
  char v62 = v5;
  long long v60 = &v75;
  id v11 = v9;
  id v59 = v11;
  id v12 = v10;
  id v58 = v12;
  long long v61 = &v69;
  long long v13 = (void (**)(void))MEMORY[0x19F38D650](v57);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_5;
  v52[3] = &unk_1E5865E18;
  long long v55 = &v75;
  id v14 = v11;
  id v54 = v14;
  id v15 = v12;
  id v53 = v15;
  long long v56 = &v69;
  long long v16 = (void (**)(void))MEMORY[0x19F38D650](v52);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  void v45[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_6;
  v45[3] = &unk_1E5865E40;
  char v50 = v3;
  long long v48 = &v75;
  id v17 = v14;
  id v47 = v17;
  id v18 = v15;
  id v46 = v18;
  uint64_t v49 = &v69;
  char v51 = v5;
  id v19 = (void (**)(void))MEMORY[0x19F38D650](v45);
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_7;
  v35[3] = &unk_1E5865E68;
  char v44 = v3;
  uint64_t v41 = &v75;
  id v20 = v17;
  id v40 = v20;
  id v21 = v18;
  id v36 = v21;
  char v42 = &v69;
  id v37 = *(id *)(a1 + 40);
  id v22 = v30;
  id v38 = v22;
  uint64_t v43 = v4;
  id v23 = v31;
  id v39 = v23;
  long long v24 = (void (**)(void))MEMORY[0x19F38D650](v35);
  if (v32)
  {
    int v25 = *(unsigned __int16 *)(a1 + 64);
    if ((v25 - 9997) >= 2)
    {
      if ((v25 - 9999) <= 1)
      {
        v34[2]();
        v13[2](v13);
        uint64_t v26 = 4;
LABEL_8:
        [v21 setCloudPlaceholderKind:v26];
        goto LABEL_9;
      }
      os_signpost_id_t v27 = objc_msgSend(MEMORY[0x1E4F8B938], "formatWithID:");
      char v33 = [v27 isThumbnail];

      if (v33)
      {
        v34[2]();
        v13[2](v13);
        v16[2](v16);
        v19[2](v19);
        v24[2](v24);
        uint64_t v26 = 2;
        goto LABEL_8;
      }
    }
    v34[2]();
    v13[2](v13);
    v16[2](v16);
    v19[2](v19);
    uint64_t v26 = 3;
    goto LABEL_8;
  }
LABEL_9:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *((unsigned char *)v76 + 24);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), (id)v70[5]);

  _Block_object_dispose(&v69, 8);
  _Block_object_dispose(&v75, 8);
}

uint64_t __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

uint64_t __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([*(id *)(a1 + 32) fileExistsAtPath:v5])
  {
    char v6 = *(void **)(a1 + 32);
    id v10 = 0;
    uint64_t v7 = [v6 removeItemAtPath:v5 error:&v10];
    id v8 = v10;
    if (a3 && !*a3)
    {
      id v8 = v8;
      *a3 = v8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    id v8 = 0;
  }

  return v7;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_3(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = a1 + 32;
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v5 + 8);
  if (v2)
  {
    char v6 = [v3 urlForSideCarImageFile];
    uint64_t v7 = [v6 path];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v8 + 40);
    char v9 = (*(uint64_t (**)(uint64_t, void *, id *))(v4 + 16))(v4, v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v9;
  }
  else
  {
    id v10 = [v3 pathForOriginalFile];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(id *)(v11 + 40);
    char v12 = (*(uint64_t (**)(uint64_t, void *, id *))(v4 + 16))(v4, v10, &v16);
    objc_storeStrong((id *)(v11 + 40), v16);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v12;

    if (![*(id *)(a1 + 32) isPhotoIris]) {
      return;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    char v6 = [*(id *)(a1 + 32) pathForVideoComplementFile];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    id v15 = *(id *)(v14 + 40);
    LOBYTE(v13) = (*(uint64_t (**)(uint64_t, void *, id *))(v13 + 16))(v13, v6, &v15);
    objc_storeStrong((id *)(v14 + 40), v15);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v13;
  }
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_4(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 64);
  uint64_t v5 = a1 + 32;
  char v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(v5 + 8);
  if (v2)
  {
    char v6 = [v3 pathForNonAdjustedFullsizeImageFile];
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    char v9 = *(void **)(v7 + 40);
    uint64_t v8 = (void **)(v7 + 40);
    id v17 = v9;
    char v10 = (*(uint64_t (**)(uint64_t, void *, void **))(v4 + 16))(v4, v6, &v17);
    uint64_t v11 = v17;
  }
  else
  {
    char v6 = [v3 pathForOriginalFile];
    uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    uint64_t v8 = (void **)(v12 + 40);
    id v16 = v13;
    char v10 = (*(uint64_t (**)(uint64_t, void *, void **))(v4 + 16))(v4, v6, &v16);
    uint64_t v11 = v16;
  }
  id v14 = v11;
  id v15 = *v8;
  *uint64_t v8 = v14;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v10;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  char v3 = [*(id *)(a1 + 32) pathForPenultimateFullsizeRenderImageFile];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *, id *))(v2 + 16))(v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v2;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_6(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v2 = *(void *)(a1 + 40);
    char v3 = [*(id *)(a1 + 32) pathForFullsizeRenderImageFile];
    uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v4 + 40);
    LOBYTE(v2) = (*(uint64_t (**)(uint64_t, void *, id *))(v2 + 16))(v2, v3, &obj);
    objc_storeStrong((id *)(v4 + 40), obj);
    uint64_t v5 = a1 + 48;
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v2;

    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [*(id *)(a1 + 32) pathForAdjustedLargeSizeImageFile];
    uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
    id v41 = *(id *)(v8 + 40);
    LOBYTE(v6) = (*(uint64_t (**)(uint64_t, void *, id *))(v6 + 16))(v6, v7, &v41);
    objc_storeStrong((id *)(v8 + 40), v41);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v6;

    uint64_t v9 = *(void *)(a1 + 40);
    char v10 = [*(id *)(a1 + 32) pathForAdjustedLargeThumbnailFile];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v13 = *(void **)(v11 + 40);
    uint64_t v12 = (void **)(v11 + 40);
    id v40 = v13;
    char v14 = (*(uint64_t (**)(uint64_t, void *, void **))(v9 + 16))(v9, v10, &v40);
    id v15 = v40;
  }
  else
  {
    id v16 = *(void **)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v5 = a1 + 48;
    if (*(unsigned char *)(a1 + 65))
    {
      id v18 = [v16 pathForNonAdjustedFullsizeImageFile];
      uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
      id v21 = *(void **)(v19 + 40);
      id v20 = (void **)(v19 + 40);
      id v39 = v21;
      char v22 = (*(uint64_t (**)(uint64_t, void *, void **))(v17 + 16))(v17, v18, &v39);
      id v23 = v39;
    }
    else
    {
      id v18 = [v16 pathForOriginalFile];
      uint64_t v24 = *(void *)(*(void *)(a1 + 56) + 8);
      int v25 = *(void **)(v24 + 40);
      id v20 = (void **)(v24 + 40);
      id v38 = v25;
      char v22 = (*(uint64_t (**)(uint64_t, void *, void **))(v17 + 16))(v17, v18, &v38);
      id v23 = v38;
    }
    id v26 = v23;
    os_signpost_id_t v27 = *v20;
    const char *v20 = v26;

    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v22;
    uint64_t v28 = *(void *)(a1 + 40);
    uint64_t v29 = [*(id *)(a1 + 32) pathForNonAdjustedLargeSizeImageFile];
    uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
    id v37 = *(id *)(v30 + 40);
    LOBYTE(v28) = (*(uint64_t (**)(uint64_t, void *, id *))(v28 + 16))(v28, v29, &v37);
    objc_storeStrong((id *)(v30 + 40), v37);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) |= v28;

    uint64_t v31 = *(void *)(a1 + 40);
    char v10 = [*(id *)(a1 + 32) pathForNonAdjustedLargeThumbnailFile];
    uint64_t v32 = *(void *)(*(void *)(a1 + 56) + 8);
    char v33 = *(void **)(v32 + 40);
    uint64_t v12 = (void **)(v32 + 40);
    id v36 = v33;
    char v14 = (*(uint64_t (**)(uint64_t, void *, void **))(v31 + 16))(v31, v10, &v36);
    id v15 = v36;
  }
  id v34 = v15;
  id v35 = *v12;
  void *v12 = v34;

  *(unsigned char *)(*(void *)(*(void *)v5 + 8) + 24) |= v14;
}

void __95__PLAssetsdDebugService_asynchronousUnloadImageFilesForAssetWithObjectURI_minimumFormat_reply___block_invoke_7(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 96);
  uint64_t v3 = *(void *)(a1 + 64);
  uint64_t v4 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v5 = [v4 pathForAdjustedMediumThumbnailFile];
    uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v8 = *(void **)(v6 + 40);
    uint64_t v7 = (void **)(v6 + 40);
    uint64_t v17 = v8;
    char v9 = (*(uint64_t (**)(uint64_t, void *, void **))(v3 + 16))(v3, v5, &v17);
    char v10 = v17;
  }
  else
  {
    uint64_t v5 = [v4 pathForNonAdjustedMediumThumbnailFile];
    uint64_t v11 = *(void *)(*(void *)(a1 + 80) + 8);
    uint64_t v12 = *(void **)(v11 + 40);
    uint64_t v7 = (void **)(v11 + 40);
    id v16 = v12;
    char v9 = (*(uint64_t (**)(uint64_t, void *, void **))(v3 + 16))(v3, v5, &v16);
    char v10 = v16;
  }
  id v13 = v10;
  char v14 = *v7;
  void *v7 = v13;

  *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) |= v9;
  id v15 = [*(id *)(a1 + 40) thumbnailManager];
  [v15 deleteThumbnailsWithIdentifier:*(void *)(a1 + 48) orIndex:*(void *)(a1 + 88) uuid:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setEffectiveThumbnailIndex:0x7FFFFFFFFFFFFFFFLL];
}

- (void)statusWithReply:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (void (**)(id, void *))a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v12) = v5;
  if (v5)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: statusWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  uint64_t v6 = +[PLPhotoLibrary queueStatusDescription];
  uint64_t v7 = [(PLPhotoLibraryBundleController *)self->_bundleController libraryServicesStatusDescription];
  uint64_t v8 = [NSString stringWithFormat:@"%@\n%@", v6, v7];
  v4[2](v4, v8);

  if ((_BYTE)v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    char v9 = PLRequestGetLog();
    char v10 = v9;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdDebugService)initWithLibraryServicesManager:(id)a3 resourceDownloader:(id)a4 bundleController:(id)a5 connectionAuthorization:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)PLAssetsdDebugService;
  char v14 = [(PLAbstractLibraryServicesManagerService *)&v17 initWithLibraryServicesManager:a3];
  id v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_resourceDownloader, a4);
    objc_storeStrong((id *)&v15->_bundleController, a5);
    objc_storeStrong((id *)&v15->_connectionAuthorization, a6);
  }

  return v15;
}

- (id)_persistentStoreCoordinator
{
  int v2 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v3 = [v2 persistentStoreCoordinator];

  return v3;
}

@end