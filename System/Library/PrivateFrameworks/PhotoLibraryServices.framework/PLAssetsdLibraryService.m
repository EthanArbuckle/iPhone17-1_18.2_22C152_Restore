@interface PLAssetsdLibraryService
+ (int64_t)requiredLibraryServicesStateForURL:(id)a3;
- (PLAssetsdLibraryService)initWithLibraryServicesManager:(id)a3 bundleController:(id)a4 connectionAuthorization:(id)a5 assetsdService:(id)a6;
- (id)_postRunningProgress;
- (id)_preRunningProgress;
- (id)_returnValueForProgress:(id)a3 addTo:(id)a4;
- (id)importFileSystemAssetsWithReason:(id)a3 force:(BOOL)a4 reply:(id)a5;
- (id)libraryBundle;
- (id)newLibraryOpener;
- (id)postOpenProgressWithReply:(id)a3;
- (id)resetPersonsWithReply:(id)a3;
- (id)resetSocialGroupsWithReply:(id)a3;
- (id)sandboxExtensionsByPathForLibraryAccessRole:(int64_t)a3;
- (id)transferAssetsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 reply:(id)a6;
- (id)transferPersonsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 reply:(id)a6;
- (id)upgradePhotoLibraryDatabaseWithOptions:(id)a3 reply:(id)a4;
- (void)_sendClientReply:(id)a3 sandboxExtensionsByPath:(id)a4 error:(id)a5;
- (void)automaticallyDeleteEmptyAlbumWithObjectURI:(id)a3 reply:(id)a4;
- (void)dealloc;
- (void)getCurrentModelVersionWithReply:(id)a3;
- (void)getPhotoLibraryStoreXPCListenerEndpointWithReply:(id)a3;
- (void)isLibraryReadyForImportWithReply:(id)a3;
- (void)launchAssetsd;
- (void)openApplicationOwnedFoldersWithReply:(id)a3;
- (void)openPhotoLibraryDatabaseWithOptions:(id)a3 reply:(id)a4;
- (void)proxyLockFileWithDatabasePath:(id)a3 reply:(id)a4;
- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5;
- (void)recoverFromCrashIfNeeded;
- (void)repairSingletonObjectsWithReply:(id)a3;
- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 withReply:(id)a4;
- (void)searchDonationProgressForTaskIDs:(id)a3 reply:(id)a4;
- (void)updateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 reply:(id)a6;
- (void)validateOrRebuildPhotoLibraryDatabaseWithReply:(id)a3;
@end

@implementation PLAssetsdLibraryService

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_assetsdService);
  objc_storeStrong((id *)&self->_libraryBundleController, 0);
  objc_storeStrong((id *)&self->_postRunningProgressFollowers, 0);
  objc_storeStrong((id *)&self->_preRunningProgressFollowers, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_xpcPhotoLibraryStoreContainer, 0);
}

- (void)searchDonationProgressForTaskIDs:(id)a3 reply:(id)a4
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v50 = 0u;
  *(_OWORD *)sel = 0u;
  long long v49 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v49) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: searchDonationProgressForTaskIDs:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v49 + 1);
    *((void *)&v49 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v50 + 8));
  }
  v11 = dispatch_group_create();
  dispatch_group_enter(v11);
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__106241;
  v57 = __Block_byref_object_dispose__106242;
  id v58 = 0;
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__106241;
  v47 = __Block_byref_object_dispose__106242;
  id v48 = 0;
  uint64_t v12 = [v6 count];
  if (v12)
  {
    if (v12 == 1)
    {
      v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      v14 = [v13 searchDonationProgress];
      v15 = [v6 firstObject];
      uint64_t v16 = [v15 unsignedIntegerValue];
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke;
      v40[3] = &unk_1E58733C0;
      p_long long buf = &buf;
      v41 = v11;
      uint64_t v17 = [v14 donationProgressForMediaProcessingTaskID:v16 completionHandler:v40];
      v18 = (void *)v44[5];
      v44[5] = v17;

      v19 = v41;
    }
    else
    {
      v23 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      v24 = [v23 searchDonationProgress];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_2;
      v36[3] = &unk_1E58733E8;
      v38 = &buf;
      v39 = &v43;
      v37 = v11;
      id v25 = (id)[v24 donationProgressForMediaProcessingTaskIDs:v6 completionHandler:v36];

      v19 = v37;
    }
  }
  else
  {
    dispatch_group_leave(v11);
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v52 = *MEMORY[0x1E4F28228];
    v53 = @"No taskIDs provided";
    v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v53 forKeys:&v52 count:1];
    uint64_t v21 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v19];
    v22 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v21;
  }
  v26 = dispatch_queue_create("-[PLAssetsdLibraryService searchDonationProgressForTaskIDs:reply:]", 0);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_3;
  v32[3] = &unk_1E5873410;
  id v27 = v7;
  id v33 = v27;
  v34 = &buf;
  v35 = &v43;
  dispatch_group_notify(v11, v26, v32);

  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v49) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v50 + 8));
  }
  if ((void)v50)
  {
    v28 = PLRequestGetLog();
    v29 = v28;
    os_signpost_id_t v30 = v50;
    if ((unint64_t)(v50 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke(uint64_t a1, int a2, id obj)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
  id v5 = obj;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  if (!v6)
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v20 = v5;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = 0;
      uint64_t v11 = 0;
      uint64_t v12 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v7);
          }
          v14 = [v7 objectForKeyedSubscript:*(void *)(*((void *)&v21 + 1) + 8 * i)];
          uint64_t v15 = [v14 completedUnitCount];
          if (v15 <= [v14 totalUnitCount]) {
            uint64_t v16 = [v14 completedUnitCount];
          }
          else {
            uint64_t v16 = [v14 totalUnitCount];
          }
          v11 += v16;
          v10 += [v14 totalUnitCount];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v10 = 0;
      uint64_t v11 = 0;
    }

    uint64_t v17 = [MEMORY[0x1E4F28F90] discreteProgressWithTotalUnitCount:v10];
    uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
    v19 = *(void **)(v18 + 40);
    *(void *)(v18 + 40) = v17;

    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setCompletedUnitCount:v11];
    id v5 = v20;
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __66__PLAssetsdLibraryService_searchDonationProgressForTaskIDs_reply___block_invoke_3(void *a1)
{
  uint64_t v2 = a1[4];
  BOOL v3 = *(void *)(*(void *)(a1[5] + 8) + 40) == 0;
  uint64_t v4 = [*(id *)(*(void *)(a1[6] + 8) + 40) completedUnitCount];
  uint64_t v5 = [*(id *)(*(void *)(a1[6] + 8) + 40) totalUnitCount];
  id v6 = *(uint64_t (**)(uint64_t, BOOL, uint64_t, uint64_t, uint64_t))(v2 + 16);
  uint64_t v7 = *(void *)(*(void *)(a1[5] + 8) + 40);
  return v6(v2, v3, v4, v5, v7);
}

- (void)proxyLockFileWithDatabasePath:(id)a3 reply:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F8B908];
  id v6 = (void (**)(id, id))a4;
  id v7 = [v5 proxyLockFilePathForDatabasePath:a3];
  v6[2](v6, v7);
}

- (id)resetSocialGroupsWithReply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v5;
  if (v5)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetSocialGroupsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v7 = [v6 databaseContext];
  uint64_t v8 = (void *)[v7 newShortLivedLibraryWithName:"-[PLAssetsdLibraryService resetSocialGroupsWithReply:]"];

  uint64_t v9 = +[PLSocialGroup resetAllInLibrary:v8 completion:v4];

  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    uint64_t v10 = PLRequestGetLog();
    uint64_t v11 = v10;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v9;
}

- (id)resetPersonsWithReply:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v14 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v14) = v5;
  if (v5)
  {
    *((void *)&v14 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetPersonsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v14 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v7 = [v6 databaseContext];
  uint64_t v8 = (void *)[v7 newShortLivedLibraryWithName:"-[PLAssetsdLibraryService resetPersonsWithReply:]"];

  uint64_t v9 = +[PLPerson resetAllInLibrary:v8 completion:v4];

  if (v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if ((void)v16)
  {
    uint64_t v10 = PLRequestGetLog();
    uint64_t v11 = v10;
    if ((unint64_t)(v16 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v19 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v9;
}

- (id)transferPersonsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 reply:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id))a6;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v14 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v14;
  if (v14)
  {
    char v15 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: transferPersonsWithUuids:fromLibraryURL:transferOptions:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v16 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  uint64_t v17 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
  uint64_t v18 = [v11 url];
  id v30 = 0;
  v19 = [v17 URLFromClientLibraryURL:v18 sandboxExtension:0 error:&v30];
  id v20 = v30;

  if (v19)
  {
    long long v21 = +[PLPhotoLibraryBundleController sharedBundleController];
    long long v22 = [v21 openBundleAtLibraryURL:v19];

    long long v23 = [(PLAssetsdLibraryService *)self libraryBundle];
    long long v24 = [v22 transferPersons:v10 toBundle:v23 options:v12 completion:v13];
  }
  else
  {
    v13[2](v13, v20);
    long long v24 = 0;
  }

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    id v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v24;
}

- (id)transferAssetsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 reply:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v13 = (void (**)(id, id))a6;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v14 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v14;
  if (v14)
  {
    char v15 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: transferAssetsWithUuids:fromLibraryURL:transferOptions:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v16 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  uint64_t v17 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
  uint64_t v18 = [v11 url];
  id v30 = 0;
  v19 = [v17 URLFromClientLibraryURL:v18 sandboxExtension:0 error:&v30];
  id v20 = v30;

  if (v19)
  {
    long long v21 = +[PLPhotoLibraryBundleController sharedBundleController];
    long long v22 = [v21 openBundleAtLibraryURL:v19];

    long long v23 = [(PLAssetsdLibraryService *)self libraryBundle];
    long long v24 = [v22 transferAssets:v10 toBundle:v23 options:v12 completion:v13];
  }
  else
  {
    v13[2](v13, v20);
    long long v24 = 0;
  }

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    id v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v24;
}

- (id)libraryBundle
{
  uint64_t v2 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v3 = [v2 libraryBundle];

  return v3;
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 reply:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(PLAssetsdLibraryService *)self libraryBundle];
  id v13 = [v11 changeHandlingContainer];

  id v12 = [v10 object];

  [v13 publishRemoteChangeEvent:v12 delayedSaveActionsDetail:v9 reply:v8];
}

- (void)automaticallyDeleteEmptyAlbumWithObjectURI:(id)a3 reply:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: automaticallyDeleteEmptyAlbumWithObjectURI:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  id v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v27 = 0;
  char v12 = [v11 awaitLibraryState:7 error:&v27];
  id v13 = v27;

  if (v12)
  {
    int v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    char v15 = [v14 persistentStoreCoordinator];

    long long v16 = [v15 managedObjectIDForURIRepresentation:v6];
    if (v16)
    {
      uint64_t v17 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      uint64_t v18 = [v17 imageWriter];
      [v18 enqueueAutoDeleteEmptyAlbumJobWithAlbumID:v16];

      v7[2](v7, 1, 0);
    }
    else
    {
      id v20 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v31 = *MEMORY[0x1E4F28568];
      long long v32 = @"Invalid album object URI";
      long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
      long long v22 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v21];
      ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v22);
    }
  }
  else
  {
    v19 = PLBackendGetLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v19, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the Running state", buf, 2u);
    }

    ((void (**)(id, uint64_t, id))v7)[2](v7, 0, v13);
  }

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    long long v23 = PLRequestGetLog();
    long long v24 = v23;
    os_signpost_id_t v25 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)updateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 reply:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (void (**)(void))a6;
  long long v38 = 0u;
  *(_OWORD *)sel = 0u;
  long long v37 = 0u;
  int v12 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v37) = v12;
  if (v12)
  {
    id v13 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateThumbnailsForPhotos:assignNewIndex:forceRefresh:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v14 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  char v15 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v36 = 0;
  char v16 = [v15 awaitLibraryState:6 error:&v36];
  id v17 = v36;

  if (v16)
  {
    uint64_t v18 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v19 = [v18 databaseContext];
    id v20 = (void *)[v19 newShortLivedLibraryWithName:"-[PLAssetsdLibraryService updateThumbnailsForPhotos:assignNewIndex:forceRefresh:reply:]"];

    long long v21 = [v20 managedObjectContext];
    long long v22 = [v21 persistentStoreCoordinator];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __87__PLAssetsdLibraryService_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_reply___block_invoke;
    v30[3] = &unk_1E5873398;
    id v31 = v10;
    id v23 = v22;
    id v32 = v23;
    id v24 = v20;
    id v33 = v24;
    BOOL v34 = a5;
    BOOL v35 = a4;
    [v24 performTransaction:v30 completionHandler:v11];
  }
  else
  {
    os_signpost_id_t v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    v11[2](v11);
  }

  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    uint64_t v26 = PLRequestGetLog();
    id v27 = v26;
    os_signpost_id_t v28 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v41 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

void __87__PLAssetsdLibraryService_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_reply___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v39 != v6) {
          objc_enumerationMutation(v3);
        }
        int v8 = [MEMORY[0x1E4F1CB10] URLWithString:*(void *)(*((void *)&v38 + 1) + 8 * i)];
        id v9 = [*(id *)(a1 + 40) managedObjectIDForURIRepresentation:v8];
        if (v9) {
          [v2 addObject:v9];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v38 objects:v46 count:16];
    }
    while (v5);
  }

  id v10 = (void *)MEMORY[0x1E4F1CBF0];
  if (v2) {
    id v10 = v2;
  }
  uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"self IN %@", v10];
  int v12 = (void *)MEMORY[0x1E4F1C0D0];
  id v13 = +[PLManagedAsset entityName];
  int v14 = [v12 fetchRequestWithEntityName:v13];

  [v14 setIncludesPendingChanges:1];
  id v32 = (void *)v11;
  [v14 setPredicate:v11];
  char v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"dateCreated" ascending:0];
  uint64_t v45 = v15;
  char v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
  [v14 setSortDescriptors:v16];

  id v17 = [*(id *)(a1 + 48) managedObjectContext];
  id v37 = 0;
  id v31 = v14;
  uint64_t v18 = [v17 executeFetchRequest:v14 error:&v37];
  id v19 = v37;

  if (v19)
  {
    id v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v44 = v19;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Fetch for repair assets failed with error %@", buf, 0xCu);
    }
  }
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v21 = v18;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v34;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v34 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(void **)(*((void *)&v33 + 1) + 8 * j);
        if (*(unsigned char *)(a1 + 56))
        {
          id v27 = [*(id *)(a1 + 48) managedObjectContext];
          objc_msgSend(v27, "refreshObject:mergeChanges:", v26, objc_msgSend(v26, "hasChanges"));
        }
        os_signpost_id_t v28 = [v26 filename];

        if (v28)
        {
          uint64_t v29 = [v26 effectiveThumbnailIndex];
          if (*(unsigned char *)(a1 + 57) || (unint64_t v30 = v29, v29 == 0x7FFFFFFFFFFFFFFFLL)) {
            unint64_t v30 = +[PLThumbnailIndexes nextAvailableThumbnailIndexInLibrary:*(void *)(a1 + 48)];
          }
          [v26 setEffectiveThumbnailIndex:v30];
          [v26 generateAndUpdateThumbnailsWithPreviewImage:0 thumbnailImage:0 fromImageSource:0 imageData:0 forceSRGBConversion:0];
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v23);
  }
}

- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 withReply:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v29) = v7;
  if (v7)
  {
    int v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetFaceAnalysisWithResetLevel:withReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  id v10 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v28 = 0;
  char v11 = [v10 awaitLibraryState:6 error:&v28];
  id v12 = v28;

  if (v11)
  {
    id v13 = (void *)MEMORY[0x1E4F8B958];
    uint64_t v21 = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    uint64_t v23 = __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke;
    uint64_t v24 = &unk_1E5873370;
    os_signpost_id_t v25 = self;
    int64_t v27 = a3;
    id v26 = v6;
    int v14 = [v13 operationWithName:@"Reset Face Analysis" requiredState:7 parentProgress:0 execution:&v21];
    char v15 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    [v15 enqueueOperation:v14 error:0];
  }
  else
  {
    char v16 = PLBackendGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v16, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    (*((void (**)(id, void, id))v6 + 2))(v6, 0, v12);
  }

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v17 = PLRequestGetLog();
    uint64_t v18 = v17;
    os_signpost_id_t v19 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

void __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) newShortLivedLibraryWithName:"-[PLAssetsdLibraryService resetFaceAnalysisWithResetLevel:withReply:]_block_invoke"];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke_2;
  v6[3] = &unk_1E5873348;
  uint64_t v3 = *(void *)(a1 + 48);
  id v7 = v2;
  uint64_t v8 = v3;
  id v4 = v2;
  [v4 performBlockAndWait:v6];
  (*(void (**)(void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, 0, v5);
}

void __69__PLAssetsdLibraryService_resetFaceAnalysisWithResetLevel_withReply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = [*(id *)(a1 + 32) pathManager];
  uint64_t v3 = [*(id *)(a1 + 32) managedObjectContext];
  +[PLModelMigrator performFaceAnalysisResetWithResetLevel:v2 pathManager:v4 context:v3];
}

- (void)repairSingletonObjectsWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, void))a3;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: repairSingletonObjectsWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  uint64_t v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v19 = 0;
  uint64_t v9 = [v8 awaitLibraryState:6 error:&v19];
  id v10 = v19;

  if (v9)
  {
    char v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v12 = [v11 modelMigrator];
    [v12 repairSingletonObjectsInDatabase];

    if (!v4) {
      goto LABEL_10;
    }
    id v13 = 0;
  }
  else
  {
    int v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    id v13 = v10;
  }
  ((void (**)(id, uint64_t, id))v4)[2](v4, v9, v13);
LABEL_10:

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    char v15 = PLRequestGetLog();
    char v16 = v15;
    os_signpost_id_t v17 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)recoverFromCrashIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  int v3 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v18) = v3;
  if (v3)
  {
    id v4 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: recoverFromCrashIfNeeded", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v5 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v4;

    os_activity_scope_enter(v4, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v17 = 0;
  char v7 = [v6 awaitLibraryState:6 error:&v17];
  id v8 = v17;

  if (v7)
  {
    uint64_t v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v10 = [v9 imageWriter];

    char v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    id v12 = [v11 crashRecoverySupport];

    [v12 recoverFromCrashIfNeededWithImageWriter:v10];
  }
  else
  {
    id v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }
  }

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    id v13 = PLRequestGetLog();
    int v14 = v13;
    os_signpost_id_t v15 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (id)importFileSystemAssetsWithReason:(id)a3 force:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(void))a5;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v32) = v10;
  if (v10)
  {
    char v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: importFileSystemAssetsWithReason:force:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v13 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdLibraryService importFileSystemAssetsWithReason:force:reply:]"];
  int v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v31 = 0;
  char v15 = [v14 awaitLibraryState:6 error:&v31];
  id v16 = v31;

  if (v15)
  {
    id v17 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    objc_msgSend(v17, "becomeCurrentWithPendingUnitCount:", objc_msgSend(v17, "totalUnitCount"));
    if (v6)
    {
      id v18 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdLibraryService importFileSystemAssetsWithReason:force:reply:]");
      long long v19 = [v18 globalValues];
      [v19 setImportFilesystemAssetsState:-1];
    }
    long long v20 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    long long v21 = [v20 modelMigrator];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __72__PLAssetsdLibraryService_importFileSystemAssetsWithReason_force_reply___block_invoke;
    v28[3] = &unk_1E5873320;
    id v29 = v13;
    long long v30 = v9;
    [v21 loadFileSystemDataIntoDatabaseIfNeededWithReason:v8 completionHandler:v28];
  }
  else
  {
    uint64_t v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "LibraryServicesManager cannot get to the PreparingAccessible state", buf, 2u);
    }

    v9[2](v9);
    id v17 = 0;
  }

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    uint64_t v23 = PLRequestGetLog();
    uint64_t v24 = v23;
    os_signpost_id_t v25 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v36 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v17;
}

uint64_t __72__PLAssetsdLibraryService_importFileSystemAssetsWithReason_force_reply___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) stillAlive];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)getPhotoLibraryStoreXPCListenerEndpointWithReply:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *))a3;
  int v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v29 = 0;
  char v6 = [v5 awaitLibraryState:7 error:&v29];
  id v7 = v29;

  if (v6)
  {
    long long v27 = 0u;
    *(_OWORD *)sel = 0u;
    long long v26 = 0u;
    int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
    LOBYTE(v26) = v8;
    if (v8)
    {
      os_activity_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getPhotoLibraryStoreXPCListenerEndpointWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      int v10 = (void *)*((void *)&v26 + 1);
      *((void *)&v26 + 1) = v9;

      os_activity_scope_enter(*((os_activity_t *)&v26 + 1), (os_activity_scope_state_t)((char *)&v27 + 8));
    }
    xpcPhotoLibraryStoreContainer = self->_xpcPhotoLibraryStoreContainer;
    if (!xpcPhotoLibraryStoreContainer)
    {
      id v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      id v13 = [v12 pathManager];
      int v14 = +[PLXPCPhotoLibraryStoreContainer newContainerWithPathManager:v13 connectionAuthorization:self->_connectionAuthorization];
      char v15 = self->_xpcPhotoLibraryStoreContainer;
      self->_xpcPhotoLibraryStoreContainer = v14;

      xpcPhotoLibraryStoreContainer = self->_xpcPhotoLibraryStoreContainer;
    }
    id v16 = [(PLXPCPhotoLibraryStoreContainer *)xpcPhotoLibraryStoreContainer listenerEndpoint];
    id v17 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
      long long v19 = [v18 pathManager];
      long long v20 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
      int v21 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientProcessIdentifier];
      *(_DWORD *)long long buf = 134218754;
      id v31 = v16;
      __int16 v32 = 2112;
      long long v33 = v19;
      __int16 v34 = 2112;
      long long v35 = v20;
      __int16 v36 = 1024;
      int v37 = v21;
      _os_log_impl(&dword_19B3C7000, v17, OS_LOG_TYPE_DEFAULT, "Vending XPC store endpoint %p for %@ to %@[%d]", buf, 0x26u);
    }
    v4[2](v4, v16);

    if ((_BYTE)v26) {
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
    }
    if ((void)v27)
    {
      uint64_t v22 = PLRequestGetLog();
      uint64_t v23 = v22;
      if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
      {
        Name = sel_getName(sel[1]);
        *(_DWORD *)long long buf = 136446210;
        id v31 = Name;
        _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
      }
    }
  }
  else
  {
    os_signpost_id_t v25 = PLBackendGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "LibraryServicesManager is not running", (uint8_t *)&v26, 2u);
    }

    v4[2](v4, 0);
  }
}

- (void)_sendClientReply:(id)a3 sandboxExtensionsByPath:(id)a4 error:(id)a5
{
  id v8 = a5;
  (*((void (**)(id, id, id))a3 + 2))(a3, a4, v8);
  os_activity_t v9 = [MEMORY[0x1E4F1CAD0] setWithArray:&unk_1EEBF23C0];
  id v20 = v8;
  if (v20)
  {
    uint64_t v10 = *MEMORY[0x1E4F8C500];
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    id v12 = v20;
    do
    {
      id v13 = [v12 domain];
      if ([v13 isEqual:v10])
      {
        int v14 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v12, "code"));
        int v15 = [v9 containsObject:v14];

        if (v15)
        {
          id v18 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
          long long v19 = [v18 libraryBundle];

          [(PLPhotoLibraryBundleController *)self->_libraryBundleController shutdownBundle:v19 reason:v20];
          break;
        }
      }
      else
      {
      }
      id v16 = [v12 userInfo];
      uint64_t v17 = [v16 objectForKeyedSubscript:v11];

      id v12 = (void *)v17;
    }
    while (v17);
  }
}

- (id)_returnValueForProgress:(id)a3 addTo:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PLProgressFollower alloc] initWithSourceProgress:v6 progressHandler:0];

  [v5 addObject:v7];
  id v8 = [(PLProgressFollower *)v7 outputProgress];

  return v8;
}

- (id)_postRunningProgress
{
  int v3 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v4 = [v3 postRunningProgress];
  id v5 = [(PLAssetsdLibraryService *)self _returnValueForProgress:v4 addTo:self->_postRunningProgressFollowers];

  return v5;
}

- (id)_preRunningProgress
{
  int v3 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v4 = [v3 preRunningProgress];
  id v5 = [(PLAssetsdLibraryService *)self _returnValueForProgress:v4 addTo:self->_preRunningProgressFollowers];

  return v5;
}

- (id)upgradePhotoLibraryDatabaseWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  long long v59 = 0u;
  *(_OWORD *)sel = 0u;
  long long v58 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v58) = v8;
  if (v8)
  {
    os_activity_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: upgradePhotoLibraryDatabaseWithOptions:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v58 + 1);
    *((void *)&v58 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v59 + 8));
  }
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  char v57 = 0;
  id v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v13 = [v12 pathManager];
  int v14 = [v13 libraryURL];

  int v15 = [v14 path];
  int v16 = [v11 fileExistsAtPath:v15 isDirectory:&v57];
  if (v57) {
    int v17 = v16;
  }
  else {
    int v17 = 0;
  }

  if (!v17)
  {
    long long v27 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      id v28 = [v14 path];
      *(_DWORD *)long long buf = 138412290;
      v68 = v28;
      _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Unable to upgrade photo library because it does not exist at path %@.", buf, 0xCu);
    }
    id v29 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v63 = *MEMORY[0x1E4F28328];
    os_signpost_id_t v25 = [v14 path];
    v64 = v25;
    long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    id v26 = [v29 errorWithDomain:*MEMORY[0x1E4F8C500] code:41015 userInfo:v30];

LABEL_16:
    if (v26) {
      goto LABEL_22;
    }
    goto LABEL_17;
  }
  id v18 = (void *)MEMORY[0x1E4F8B980];
  long long v19 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  LOBYTE(v18) = objc_msgSend(v18, "shouldAutoUpgradeWellKnownPhotoLibraryIdentifier:", objc_msgSend(v19, "wellKnownPhotoLibraryIdentifier"));

  if ((v18 & 1) == 0
    && ![(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForLibraryUpgrade])
  {
    id v20 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
    char v21 = [v20 isEqualToString:@"com.apple.migrationpluginwrapper"];

    if ((v21 & 1) == 0)
    {
      uint64_t v22 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        uint64_t v23 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
        *(_DWORD *)long long buf = 138543362;
        v68 = v23;
        _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Denying upgrade request from %{public}@. Only certain clients are allowed to upgrade the library.", buf, 0xCu);
      }
      uint64_t v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v65 = *MEMORY[0x1E4F289D0];
      v66 = v14;
      os_signpost_id_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F8C500] code:41005 userInfo:v25];
      goto LABEL_16;
    }
  }
LABEL_17:
  id v31 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
  uint64_t v32 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  [(id)v32 setUpgradeClient:v31];

  long long v33 = [v6 objectForKeyedSubscript:@"PLPhotoLibraryCreateOptions"];
  LOBYTE(v32) = [v33 unsignedIntegerValue];

  if ((v32 & 4) != 0)
  {
    long long v40 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    long long v41 = [v40 pathManager];

    [v41 setSqliteErrorForRebuildReason:10 allowsExit:0];
    uint64_t v42 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v43 = [v42 libraryBundle];

    id v44 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v61 = *MEMORY[0x1E4F28568];
    v62 = @"client requested library rebuild";
    uint64_t v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    v46 = [v44 errorWithDomain:*MEMORY[0x1E4F8C500] code:41020 userInfo:v45];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_assetsdService);
    [v43 unbindAssetsdService:WeakRetained];
    [(PLPhotoLibraryBundleController *)self->_libraryBundleController shutdownBundle:v43 reason:v46];
    v7[2](v7, 0, v46);
    [WeakRetained invalidateConnectionWithReason:v46];

    id v26 = 0;
    long long v39 = 0;
    goto LABEL_23;
  }
  __int16 v34 = [[PLLibraryOpenerCreationOptions alloc] initWithOptionsDictionary:v6 connectionAuthorization:self->_connectionAuthorization];
  long long v35 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  [v35 setCreateMode:0 options:v34];

  __int16 v36 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v56 = 0;
  int v37 = [v36 activate:&v56];
  id v26 = v56;

  if (v37)
  {
    objc_initWeak((id *)buf, self);
    uint64_t v38 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __72__PLAssetsdLibraryService_upgradePhotoLibraryDatabaseWithOptions_reply___block_invoke;
    v53[3] = &unk_1E58732F8;
    objc_copyWeak(&v55, (id *)buf);
    v53[4] = self;
    v54 = v7;
    [v38 awaitLibraryState:7 completionHandler:v53];

    objc_destroyWeak(&v55);
    objc_destroyWeak((id *)buf);

    long long v39 = [(PLAssetsdLibraryService *)self _preRunningProgress];
    goto LABEL_23;
  }

LABEL_22:
  [(PLAssetsdLibraryService *)self _sendClientReply:v7 sandboxExtensionsByPath:0 error:v26];
  long long v39 = 0;
LABEL_23:

  if ((_BYTE)v58) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v59 + 8));
  }
  if ((void)v59)
  {
    id v48 = PLRequestGetLog();
    long long v49 = v48;
    os_signpost_id_t v50 = v59;
    if ((unint64_t)(v59 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v48))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v68 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v49, OS_SIGNPOST_INTERVAL_END, v50, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v39;
}

void __72__PLAssetsdLibraryService_upgradePhotoLibraryDatabaseWithOptions_reply___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v6 = WeakRetained;
  if (a2)
  {
    id v7 = [*(id *)(a1 + 32) sandboxExtensionsByPathForLibraryAccessRole:1];
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    [WeakRetained _sendClientReply:*(void *)(a1 + 40) sandboxExtensionsByPath:0 error:v8];
  }
}

- (id)postOpenProgressWithReply:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: postOpenProgressWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  id v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke;
  long long v19 = &unk_1E5874950;
  id v20 = self;
  id v9 = v4;
  id v21 = v9;
  [v8 awaitLibraryState:7 completionHandler:&v16];

  uint64_t v10 = [(PLAssetsdLibraryService *)self _postRunningProgress];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    uint64_t v11 = PLRequestGetLog();
    id v12 = v11;
    os_signpost_id_t v13 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
  return v10;
}

void __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    int v3 = [*(id *)(a1 + 32) libraryServicesManager];
    id v4 = [v3 modelMigrator];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke_2;
    v6[3] = &unk_1E5875198;
    id v7 = *(id *)(a1 + 40);
    [v4 loadFileSystemAssetsNotifyCompleted:v6];
  }
  else
  {
    int v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
}

uint64_t __53__PLAssetsdLibraryService_postOpenProgressWithReply___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openPhotoLibraryDatabaseWithOptions:(id)a3 reply:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v35 = 0u;
  *(_OWORD *)sel = 0u;
  long long v34 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v34) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: openPhotoLibraryDatabaseWithOptions:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  id v11 = [(PLAssetsdLibraryService *)self newLibraryOpener];
  id v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  BOOL v13 = [v12 wellKnownPhotoLibraryIdentifier] == 1;

  id v33 = 0;
  int v14 = [v11 openPhotoLibraryDatabaseWithAutoUpgrade:0 autoCreate:v13 error:&v33];
  id v15 = v33;
  if (v15) {
    int v16 = 0;
  }
  else {
    int v16 = v14;
  }
  if (v16 == 1)
  {
    uint64_t v17 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    char v18 = [v17 createOptions];

    if ((v18 & 0x10) == 0)
    {
      id v15 = 0;
      goto LABEL_15;
    }
    long long v19 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
    int v20 = [v19 isEqualToString:@"com.apple.mediaanalysisd"];

    if (v20)
    {
      id v21 = PLLibraryServicesGetLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        long long v22 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
        *(_DWORD *)long long buf = 138543362;
        uint64_t v42 = v22;
        _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Library createOptions do not allow mediaanalysisd to run. Rejecting connection from %{public}@", buf, 0xCu);
      }
      long long v23 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v39 = *MEMORY[0x1E4F28228];
      uint64_t v24 = NSStringFromPLErrorCode();
      long long v40 = v24;
      os_signpost_id_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
      id v15 = [v23 errorWithDomain:*MEMORY[0x1E4F8C500] code:41005 userInfo:v25];
      id v26 = 0;
      goto LABEL_18;
    }
    id v15 = 0;
  }
  if (!v14)
  {
    id v26 = 0;
    goto LABEL_20;
  }
LABEL_15:
  id v26 = [(PLAssetsdLibraryService *)self sandboxExtensionsByPathForLibraryAccessRole:1];
  if ([v6 libraryInitiator] == 1)
  {
    uint64_t v27 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
    BOOL v28 = [v27 length] == 0;

    if (!v28)
    {
      uint64_t v37 = *MEMORY[0x1E4F8BB30];
      uint64_t v24 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
      uint64_t v38 = v24;
      os_signpost_id_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
      PLSendCoreAnalyticEvent();
LABEL_18:
    }
  }
LABEL_20:
  [(PLAssetsdLibraryService *)self _sendClientReply:v7 sandboxExtensionsByPath:v26 error:v15];

  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    id v29 = PLRequestGetLog();
    long long v30 = v29;
    os_signpost_id_t v31 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)openApplicationOwnedFoldersWithReply:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v20) = v5;
  if (v5)
  {
    *((void *)&v20 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: openApplicationOwnedFoldersWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v20 + 1), (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v6 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v7 = [v6 pathManager];

  int v8 = [MEMORY[0x1E4F8B908] fileManager];
  id v9 = [v7 libraryURL];
  uint64_t v10 = [v9 path];
  int v11 = [v8 fileExistsAtPath:v10];

  if (v11)
  {
    id v12 = [(PLAssetsdLibraryService *)self sandboxExtensionsByPathForLibraryAccessRole:2];
    BOOL v13 = 0;
  }
  else
  {
    int v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v24 = *MEMORY[0x1E4F28228];
    id v15 = NSStringFromPLErrorCode();
    os_signpost_id_t v25 = v15;
    int v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
    BOOL v13 = [v14 errorWithDomain:*MEMORY[0x1E4F8C500] code:41015 userInfo:v16];

    id v12 = 0;
  }
  [(PLAssetsdLibraryService *)self _sendClientReply:v4 sandboxExtensionsByPath:v12 error:v13];

  if (v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    uint64_t v17 = PLRequestGetLog();
    char v18 = v17;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)validateOrRebuildPhotoLibraryDatabaseWithReply:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, id))a3;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: validateOrRebuildPhotoLibraryDatabaseWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  id v8 = [(PLAssetsdLibraryService *)self newLibraryOpener];
  id v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v10 = [v9 openerCreationOptions];

  if (!v10)
  {
    int v11 = [PLLibraryOpenerCreationOptions alloc];
    id v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v10 = -[PLLibraryOpenerCreationOptions initWithWellKnownLibraryIdentifier:](v11, "initWithWellKnownLibraryIdentifier:", [v12 wellKnownPhotoLibraryIdentifier]);
  }
  id v19 = 0;
  uint64_t v13 = [v8 createPhotoLibraryDatabaseWithOptions:v10 error:&v19];
  id v14 = v19;
  v4[2](v4, v13, v14);

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    id v15 = PLRequestGetLog();
    int v16 = v15;
    os_signpost_id_t v17 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (id)sandboxExtensionsByPathForLibraryAccessRole:(int64_t)a3
{
  int v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v6 = [v5 pathManager];

  id v7 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
  id v8 = [v7 sandboxExtensionsByPathForClient:self->_connectionAuthorization pathManager:v6 libraryAccessRole:a3];

  return v8;
}

- (id)newLibraryOpener
{
  int v3 = [PLPhotoLibraryOpener alloc];
  id v4 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  int v5 = [(PLPhotoLibraryOpener *)v3 initWithLibraryServicesManager:v4 reportInProgressUpgrades:[(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForLibraryUpgrade]];

  return v5;
}

- (void)isLibraryReadyForImportWithReply:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, uint64_t, id))a3;
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v18) = v5;
  if (v5)
  {
    id v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: isLibraryReadyForImportWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v7 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  id v8 = [PLPhotoLibraryImportValidation alloc];
  id v9 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v10 = [(PLPhotoLibraryImportValidation *)v8 initWithLibraryManager:v9];

  id v17 = 0;
  uint64_t v11 = [(PLPhotoLibraryImportValidation *)v10 isLibraryValidForImportWithError:&v17];
  id v12 = v17;
  v4[2](v4, v11, v12);

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    uint64_t v13 = PLRequestGetLog();
    id v14 = v13;
    os_signpost_id_t v15 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)getCurrentModelVersionWithReply:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v3 = (void (**)(id, void))a3;
  long long v10 = 0u;
  *(_OWORD *)sel = 0u;
  long long v8 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v8) = v4;
  if (v4)
  {
    *((void *)&v8 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getCurrentModelVersionWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v8 + 1), (os_activity_scope_state_t)((char *)&v10 + 8));
  }
  v3[2](v3, +[PLModelMigrator currentModelVersion]);
  if (v9) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v10 + 8));
  }
  if ((void)v10)
  {
    int v5 = PLRequestGetLog();
    id v6 = v5;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v13 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v6, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)launchAssetsd
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  *(_OWORD *)sel = 0u;
  long long v6 = 0u;
  int v2 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v6) = v2;
  if (v2)
  {
    *((void *)&v6 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: launchAssetsd", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(*((os_activity_t *)&v6 + 1), (os_activity_scope_state_t)((char *)&v7 + 8));
    if ((_BYTE)v6) {
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v7 + 8));
    }
  }
  if ((void)v7)
  {
    int v3 = PLRequestGetLog();
    int v4 = v3;
    if ((unint64_t)(v7 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v10 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v4, OS_SIGNPOST_INTERVAL_END, v7, "PLXPC Sync", "unxpected nil libraryURL setting required state for %@", buf, 0xCu);
    }
  }
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  int v3 = self->_preRunningProgressFollowers;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) invalidate];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v8 = self->_postRunningProgressFollowers;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v12++) invalidate];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  v13.receiver = self;
  v13.super_class = (Class)PLAssetsdLibraryService;
  [(PLAssetsdLibraryService *)&v13 dealloc];
}

- (PLAssetsdLibraryService)initWithLibraryServicesManager:(id)a3 bundleController:(id)a4 connectionAuthorization:(id)a5 assetsdService:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v21.receiver = self;
  v21.super_class = (Class)PLAssetsdLibraryService;
  long long v14 = [(PLAbstractLibraryServicesManagerService *)&v21 initWithLibraryServicesManager:a3];
  long long v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_connectionAuthorization, a5);
    objc_storeStrong((id *)&v15->_libraryBundleController, a4);
    objc_storeWeak((id *)&v15->_assetsdService, v13);
    long long v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    preRunningProgressFollowers = v15->_preRunningProgressFollowers;
    v15->_preRunningProgressFollowers = v16;

    long long v18 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    postRunningProgressFollowers = v15->_postRunningProgressFollowers;
    v15->_postRunningProgressFollowers = v18;
  }
  return v15;
}

+ (int64_t)requiredLibraryServicesStateForURL:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (!v3)
  {
    uint64_t v5 = PLLibraryServicesGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = objc_opt_class();
      _os_log_impl(&dword_19B3C7000, v5, OS_LOG_TYPE_FAULT, "unxpected nil libraryURL setting required state for %@", (uint8_t *)&v7, 0xCu);
    }

    goto LABEL_7;
  }
  if ([MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:v3])
  {
LABEL_7:
    int64_t v4 = 6;
    goto LABEL_8;
  }
  int64_t v4 = 0;
LABEL_8:

  return v4;
}

@end