@interface PLAssetsdLibraryClient
- (BOOL)_consumeSandboxExtensions:(id)a3;
- (BOOL)isLibraryReadyForImportWithError:(id *)a3;
- (BOOL)isOpened;
- (BOOL)openApplicationOwnedFoldersWithError:(id *)a3;
- (BOOL)openPhotoLibraryDatabaseWithPostOpenProgress:(id *)a3 error:(id *)a4;
- (BOOL)openPhotoLibraryDatabaseWithPostOpenProgress:(id *)a3 options:(id)a4 error:(id *)a5;
- (BOOL)openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:(id)a3 error:(id *)a4;
- (BOOL)synchronouslyImportFileSystemAssetsForce:(BOOL)a3 withError:(id *)a4;
- (BOOL)synchronouslyRepairSingletonObjectsWithError:(id *)a3;
- (BOOL)synchronouslyUpdateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 error:(id *)a6;
- (BOOL)validateOrRebuildPhotoLibraryDatabaseWithError:(id *)a3;
- (PLAssetsdLibraryClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5 sandboxExtensions:(id)a6;
- (id)_assetURIStringsForPhotos:(id)a3;
- (id)getPhotoLibraryStoreXPCListenerEndpoint;
- (id)importFileSystemAssetsForce:(BOOL)a3 withCompletionHandler:(id)a4;
- (id)proxyLockFileWithDatabasePath:(id)a3 error:(id *)a4;
- (id)resetPersonsWithCompletionHandler:(id)a3;
- (id)resetSocialGroupsWithCompletionHandler:(id)a3;
- (id)transferAssetsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 completionHandler:(id)a6;
- (id)transferPersonsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 completionHandler:(id)a6;
- (id)upgradePhotoLibraryDatabaseWithOptions:(id)a3 completion:(id)a4;
- (int64_t)getCurrentModelVersion;
- (void)automaticallyDeleteEmptyAlbumWithObjectID:(id)a3 completionHandler:(id)a4;
- (void)launchAssetsd;
- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 completionHandler:(id)a5;
- (void)recoverFromCrashIfNeeded;
- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 completionHandler:(id)a4;
- (void)searchDonationProgressForTaskIDs:(id)a3 completionHandler:(id)a4;
- (void)updateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 completionHandler:(id)a6;
@end

@implementation PLAssetsdLibraryClient

- (void).cxx_destruct
{
}

- (BOOL)_consumeSandboxExtensions:(id)a3
{
  atomic_store([(PLAssetsdClientSandboxExtensions *)self->_sandboxExtensions consumeSandboxExtensions:a3], (unsigned __int8 *)&self->_isOpen);
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isOpen);
  return v4 & 1;
}

- (void)searchDonationProgressForTaskIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: searchDonationProgressForTaskIDs:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  v32 = __Block_byref_object_copy_;
  v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke;
  v26[3] = &unk_1E58A1C40;
  v26[4] = &buf;
  v12 = [v11 remoteObjectProxyWithErrorHandler:v26];

  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke_2;
  v24 = &unk_1E589EED0;
  id v13 = v7;
  id v25 = v13;
  [v12 searchDonationProgressForTaskIDs:v6 reply:&v21];
  if (v13 && !v12)
  {
    uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
    if (!v14)
    {
      uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"com.apple.photos.error", 46502, v21, v22, v23, v24);
      v16 = *(void **)(*((void *)&buf + 1) + 40);
      *(void *)(*((void *)&buf + 1) + 40) = v15;

      uint64_t v14 = *(void *)(*((void *)&buf + 1) + 40);
    }
    (*((void (**)(id, void, void, void, uint64_t))v13 + 2))(v13, 0, 0, 0, v14);
  }

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    v17 = PLRequestGetLog();
    v18 = v17;
    os_signpost_id_t v19 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke(uint64_t a1, void *a2)
{
}

uint64_t __77__PLAssetsdLibraryClient_searchDonationProgressForTaskIDs_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)proxyLockFileWithDatabasePath:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v7;
  if (v7)
  {
    BOOL v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: proxyLockFileWithDatabasePath:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy_;
  uint64_t v35 = __Block_byref_object_dispose_;
  id v36 = 0;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  long long v27 = __Block_byref_object_dispose_;
  id v28 = 0;
  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke;
  v22[3] = &unk_1E58A1C40;
  v22[4] = &v23;
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v22];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke_56;
  v21[3] = &unk_1E589F2B8;
  v21[4] = &buf;
  [v11 proxyLockFileWithDatabasePath:v6 reply:v21];

  uint64_t v12 = *(void *)(*((void *)&buf + 1) + 40);
  id v13 = (id)v24[5];
  uint64_t v14 = v13;
  if (!v12 && a4) {
    *a4 = v13;
  }

  id v15 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    v16 = PLRequestGetLog();
    v17 = v16;
    os_signpost_id_t v18 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v15;
}

void __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned __int8 v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdLibraryClient proxyLockFileWithDatabasePath:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __62__PLAssetsdLibraryClient_proxyLockFileWithDatabasePath_error___block_invoke_56(uint64_t a1, void *a2)
{
}

- (id)transferPersonsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v14;
  if (v14)
  {
    id v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: transferPersonsWithUuids:fromLibraryURL:transferOptions:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __100__PLAssetsdLibraryClient_transferPersonsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v18 = v13;
  id v28 = v18;
  os_signpost_id_t v19 = [v17 remoteObjectProxyWithErrorHandler:v27];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v11];
  uint64_t v21 = [v19 transferPersonsWithUuids:v10 fromLibraryURL:v20 transferOptions:v12 reply:v18];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    uint64_t v22 = PLRequestGetLog();
    uint64_t v23 = v22;
    os_signpost_id_t v24 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v21;
}

uint64_t __100__PLAssetsdLibraryClient_transferPersonsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)transferAssetsWithUuids:(id)a3 fromLibraryURL:(id)a4 transferOptions:(id)a5 completionHandler:(id)a6
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v14;
  if (v14)
  {
    id v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: transferAssetsWithUuids:fromLibraryURL:transferOptions:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v16 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __99__PLAssetsdLibraryClient_transferAssetsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v18 = v13;
  id v28 = v18;
  os_signpost_id_t v19 = [v17 remoteObjectProxyWithErrorHandler:v27];

  v20 = (void *)[objc_alloc(MEMORY[0x1E4F28FF8]) initWithURL:v11];
  uint64_t v21 = [v19 transferAssetsWithUuids:v10 fromLibraryURL:v20 transferOptions:v12 reply:v18];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    uint64_t v22 = PLRequestGetLog();
    uint64_t v23 = v22;
    os_signpost_id_t v24 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v21;
}

uint64_t __99__PLAssetsdLibraryClient_transferAssetsWithUuids_fromLibraryURL_transferOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)publishRemoteChangeEvent:(id)a3 delayedSaveActionsDetail:(id)a4 completionHandler:(id)a5
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
    id v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: publishRemoteChangeEvent:delayedSaveActionsDetail:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v14 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  id v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke;
  v32[3] = &unk_1E58A1BC8;
  id v33 = v11;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke_2;
  v23[3] = &unk_1EEBF5228;
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
    os_signpost_id_t v19 = PLRequestGetLog();
    v20 = v19;
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

uint64_t __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __94__PLAssetsdLibraryClient_publishRemoteChangeEvent_delayedSaveActionsDetail_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    unsigned __int8 v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      int v11 = 138543362;
      BOOL v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 publishRemoteChangeEvent:*(void *)(a1 + 32) delayedSaveActionsDetail:*(void *)(a1 + 40) reply:*(void *)(a1 + 48)];
}

- (void)automaticallyDeleteEmptyAlbumWithObjectID:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: automaticallyDeleteEmptyAlbumWithObjectID:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  BOOL v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  v19[2] = __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_2;
  v19[3] = &unk_1EEBF4DC8;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    unsigned __int8 v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v16 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  int v11 = [*(id *)(a1 + 32) URIRepresentation];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_50;
  v12[3] = &unk_1E58A1C18;
  id v13 = *(id *)(a1 + 40);
  [v3 automaticallyDeleteEmptyAlbumWithObjectURI:v11 reply:v12];
}

uint64_t __86__PLAssetsdLibraryClient_automaticallyDeleteEmptyAlbumWithObjectID_completionHandler___block_invoke_50(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)synchronouslyUpdateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v12;
  if (v12)
  {
    id v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslyUpdateThumbnailsForPhotos:assignNewIndex:forceRefresh:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v15 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  *(void *)&long long v33 = v16;
  os_signpost_id_t v17 = v15;
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v36 = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  id v39 = 0;
  id v20 = [(PLAssetsdLibraryClient *)self _assetURIStringsForPhotos:v11];
  id v21 = [(PLAssetsdBaseClient *)self proxyFactory];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __99__PLAssetsdLibraryClient_synchronouslyUpdateThumbnailsForPhotos_assignNewIndex_forceRefresh_error___block_invoke;
  v31[3] = &unk_1E58A1C40;
  v31[4] = &buf;
  char v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v31];
  [v22 updateThumbnailsForPhotos:v20 assignNewIndex:v8 forceRefresh:v7 reply:&__block_literal_global_49];

  uint64_t v23 = *((void *)&buf + 1);
  if (a6)
  {
    long long v24 = *(void **)(*((void *)&buf + 1) + 40);
    if (v24)
    {
      *a6 = v24;
      uint64_t v23 = *((void *)&buf + 1);
    }
  }
  uint64_t v25 = *(void *)(v23 + 40);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    SEL v26 = PLRequestGetLog();
    char v27 = v26;
    os_signpost_id_t v28 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      long long v29 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v29;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v25 == 0;
}

void __99__PLAssetsdLibraryClient_synchronouslyUpdateThumbnailsForPhotos_assignNewIndex_forceRefresh_error___block_invoke(uint64_t a1, void *a2)
{
}

- (void)updateThumbnailsForPhotos:(id)a3 assignNewIndex:(BOOL)a4 forceRefresh:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  if ([v11 count])
  {
    long long v36 = 0u;
    long long v37 = 0u;
    long long v35 = 0u;
    BOOL v13 = +[PLXPCMessageLogger enabled];
    LOBYTE(v35) = v13;
    if (v13)
    {
      id v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateThumbnailsForPhotos:assignNewIndex:forceRefresh:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
      id v15 = (void *)*((void *)&v35 + 1);
      *((void *)&v35 + 1) = v14;

      os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v36 + 8));
    }
    os_signpost_id_t v16 = [(PLAssetsdLibraryClient *)self _assetURIStringsForPhotos:v11];
    os_signpost_id_t v17 = [(PLAssetsdBaseClient *)self proxyFactory];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke;
    v33[3] = &unk_1E58A1BC8;
    id v34 = v12;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3254779904;
    v23[2] = __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_2;
    v23[3] = &unk_1EEBF5068;
    char v26 = v35;
    id v27 = *((id *)&v35 + 1);
    long long v28 = v36;
    long long v29 = v37;
    SEL v30 = a2;
    id v18 = v16;
    id v24 = v18;
    BOOL v31 = a4;
    BOOL v32 = a5;
    id v25 = v34;
    [v17 remoteObjectProxyWithErrorHandler:v33 handler:v23];

    if ((_BYTE)v35) {
      os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
    }
    if ((void)v36)
    {
      os_signpost_id_t v19 = PLRequestGetLog();
      id v20 = v19;
      os_signpost_id_t v21 = v36;
      if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        Name = sel_getName(*((SEL *)&v37 + 1));
        *(_DWORD *)long long buf = 136446210;
        id v39 = Name;
        _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
      }
    }
  }
}

uint64_t __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    unsigned __int8 v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v18 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v19[0] = v6;
    BOOL v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      os_signpost_id_t v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(unsigned __int8 *)(a1 + 104);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 105);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  void v14[2] = __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_46;
  v14[3] = &unk_1E58A1920;
  uint64_t v13 = *(void *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  [v3 updateThumbnailsForPhotos:v13 assignNewIndex:v11 forceRefresh:v12 reply:v14];
}

uint64_t __98__PLAssetsdLibraryClient_updateThumbnailsForPhotos_assignNewIndex_forceRefresh_completionHandler___block_invoke_46(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)_assetURIStringsForPhotos:(id)a3
{
  id v3 = [a3 valueForKey:@"objectID"];
  unsigned __int8 v4 = [v3 valueForKey:@"URIRepresentation"];
  os_signpost_id_t v5 = [v4 valueForKey:@"absoluteString"];

  return v5;
}

- (BOOL)synchronouslyRepairSingletonObjectsWithError:(id *)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v26) = v6;
  if (v6)
  {
    BOOL v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslyRepairSingletonObjectsWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v8 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  BOOL v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v27 = v10;
  uint64_t v11 = v9;
  uint64_t v12 = v11;
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
  BOOL v31 = __Block_byref_object_copy_;
  BOOL v32 = __Block_byref_object_dispose_;
  id v33 = 0;
  id v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke;
  v25[3] = &unk_1E58A1C40;
  v25[4] = &buf;
  id v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v25];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke_2;
  v24[3] = &unk_1E58A1E50;
  v24[4] = &buf;
  [v15 repairSingletonObjectsWithReply:v24];

  uint64_t v16 = *((void *)&buf + 1);
  if (a3)
  {
    os_signpost_id_t v17 = *(void **)(*((void *)&buf + 1) + 40);
    if (v17)
    {
      *a3 = v17;
      uint64_t v16 = *((void *)&buf + 1);
    }
  }
  uint64_t v18 = *(void *)(v16 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    os_signpost_id_t v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      char v22 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v22;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v18 == 0;
}

void __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __71__PLAssetsdLibraryClient_synchronouslyRepairSingletonObjectsWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)recoverFromCrashIfNeeded
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v18) = v4;
  if (v4)
  {
    os_signpost_id_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: recoverFromCrashIfNeeded", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v6 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  id v7 = [(PLAssetsdBaseClient *)self proxyFactory];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3254779904;
  v12[2] = __50__PLAssetsdLibraryClient_recoverFromCrashIfNeeded__block_invoke_2;
  v12[3] = &__block_descriptor_88_e8_32n18_8_8_t0w1_s8_t16w32_e43_v16__0___PLAssetsdLibraryServiceProtocol__8l;
  char v13 = v18;
  id v14 = *((id *)&v18 + 1);
  long long v15 = v19;
  long long v16 = *(_OWORD *)sel;
  SEL v17 = a2;
  [v7 remoteObjectProxyWithErrorHandler:&__block_literal_global_34 handler:v12];

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    BOOL v8 = PLRequestGetLog();
    BOOL v9 = v8;
    os_signpost_id_t v10 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      char v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_END, v10, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __50__PLAssetsdLibraryClient_recoverFromCrashIfNeeded__block_invoke_2(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    BOOL v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    char v13 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    BOOL v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      os_signpost_id_t v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v11 = 138543362;
      uint64_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 recoverFromCrashIfNeeded];
}

- (id)importFileSystemAssetsForce:(BOOL)a3 withCompletionHandler:(id)a4
{
  BOOL v4 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v7;
  if (v7)
  {
    BOOL v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: importFileSystemAssetsForce:withCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v9 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  os_signpost_id_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v11 = v6;
  id v23 = v11;
  uint64_t v12 = [v10 remoteObjectProxyWithErrorHandler:v22];

  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke_2;
  v20[3] = &unk_1E58A1920;
  id v13 = v11;
  id v21 = v13;
  id v14 = objc_msgSend(v12, "importFileSystemAssetsWithReason:force:reply:", @"import file system assets handler (async, from client)"), v4, v20);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v14;
}

uint64_t __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __76__PLAssetsdLibraryClient_importFileSystemAssetsForce_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (BOOL)synchronouslyImportFileSystemAssetsForce:(BOOL)a3 withError:(id *)a4
{
  BOOL v5 = a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    BOOL v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: synchronouslyImportFileSystemAssetsForce:withError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  id v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v29 = v12;
  id v13 = v11;
  id v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v32 = 0x3032000000;
  id v33 = __Block_byref_object_copy_;
  uint64_t v34 = __Block_byref_object_dispose_;
  id v35 = 0;
  long long v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __77__PLAssetsdLibraryClient_synchronouslyImportFileSystemAssetsForce_withError___block_invoke;
  v27[3] = &unk_1E58A1C40;
  void v27[4] = &buf;
  os_signpost_id_t v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  id v18 = (id)[v17 importFileSystemAssetsWithReason:@"import file sytem assets handler (from client)" force:v5 reply:&__block_literal_global_29];

  uint64_t v19 = *((void *)&buf + 1);
  if (a4)
  {
    id v20 = *(void **)(*((void *)&buf + 1) + 40);
    if (v20)
    {
      *a4 = v20;
      uint64_t v19 = *((void *)&buf + 1);
    }
  }
  uint64_t v21 = *(void *)(v19 + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    char v22 = PLRequestGetLog();
    id v23 = v22;
    os_signpost_id_t v24 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      long long v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21 == 0;
}

void __77__PLAssetsdLibraryClient_synchronouslyImportFileSystemAssetsForce_withError___block_invoke(uint64_t a1, void *a2)
{
}

- (id)getPhotoLibraryStoreXPCListenerEndpoint
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = __Block_byref_object_copy_;
  long long v28 = __Block_byref_object_dispose_;
  id v29 = 0;
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    os_activity_t v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getPhotoLibraryStoreXPCListenerEndpoint", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(*((os_activity_t *)&v21 + 1), (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  BOOL v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  BOOL v9 = v7;
  os_signpost_id_t v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)long long buf = 136446210;
    BOOL v31 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  os_signpost_id_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  id v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __65__PLAssetsdLibraryClient_getPhotoLibraryStoreXPCListenerEndpoint__block_invoke_2;
  v20[3] = &unk_1E589EEA8;
  void v20[4] = &v24;
  [v13 getPhotoLibraryStoreXPCListenerEndpointWithReply:v20];

  id v14 = (id)v25[5];
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    long long v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      id v18 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      BOOL v31 = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  _Block_object_dispose(&v24, 8);

  return v14;
}

void __65__PLAssetsdLibraryClient_getPhotoLibraryStoreXPCListenerEndpoint__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  BOOL v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 134217984;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEFAULT, "Received XPC store endpoint %p", (uint8_t *)&v7, 0xCu);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (id)resetSocialGroupsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E58A1BC8;
  id v6 = v4;
  id v14 = v6;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E58A1C18;
  id v12 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 resetSocialGroupsWithReply:v11];

  return v9;
}

uint64_t __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __65__PLAssetsdLibraryClient_resetSocialGroupsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)resetPersonsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke;
  v13[3] = &unk_1E58A1BC8;
  id v6 = v4;
  id v14 = v6;
  int v7 = [v5 remoteObjectProxyWithErrorHandler:v13];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E58A1C18;
  id v12 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 resetPersonsWithReply:v11];

  return v9;
}

uint64_t __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __60__PLAssetsdLibraryClient_resetPersonsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)resetFaceAnalysisWithResetLevel:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v7 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: resetFaceAnalysisWithResetLevel:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v9 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  os_signpost_id_t v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke;
  v20[3] = &unk_1E58A1BC8;
  id v11 = v6;
  id v21 = v11;
  id v12 = [v10 remoteObjectProxyWithErrorHandler:v20];

  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke_2;
  v18[3] = &unk_1E58A1C18;
  id v13 = v11;
  id v19 = v13;
  [v12 resetFaceAnalysisWithResetLevel:a3 withReply:v18];

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    id v14 = PLRequestGetLog();
    long long v15 = v14;
    os_signpost_id_t v16 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v26 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL, uint64_t))(result + 16))(result, a2 == 0, a2);
  }
  return result;
}

uint64_t __76__PLAssetsdLibraryClient_resetFaceAnalysisWithResetLevel_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (id)upgradePhotoLibraryDatabaseWithOptions:(id)a3 completion:(id)a4
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
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: upgradePhotoLibraryDatabaseWithOptions:completion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  id v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v12 = v7;
  id v24 = v12;
  id v13 = [v11 remoteObjectProxyWithErrorHandler:v23];

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke_2;
  v21[3] = &unk_1E589EE80;
  v21[4] = self;
  id v14 = v12;
  id v22 = v14;
  long long v15 = [v13 upgradePhotoLibraryDatabaseWithOptions:v6 reply:v21];

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
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v15;
}

uint64_t __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __76__PLAssetsdLibraryClient_upgradePhotoLibraryDatabaseWithOptions_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v5 && !v6)
  {
    if ([*(id *)(a1 + 32) _consumeSandboxExtensions:v5])
    {
      id v7 = 0;
    }
    else
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:44003 userInfo:0];
    }
  }
  BOOL v8 = [v7 domain];
  if ([v8 isEqualToString:@"com.apple.photos.error"])
  {
    uint64_t v9 = [v7 code];

    if (v9 != 43002) {
      goto LABEL_13;
    }
    os_signpost_id_t v10 = [v7 userInfo];
    uint64_t v11 = *MEMORY[0x1E4F28A50];
    BOOL v8 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F28A50]];

    id v12 = [v8 domain];
    if ([v12 isEqualToString:*MEMORY[0x1E4F281F8]])
    {
      uint64_t v13 = [v8 code];

      if (v13 == 4097)
      {
        id v14 = (void *)MEMORY[0x1E4F28C58];
        v20[0] = *MEMORY[0x1E4F28228];
        v20[1] = v11;
        v21[0] = @"migration interrupted";
        v21[1] = v8;
        long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
        uint64_t v16 = [v14 errorWithDomain:@"com.apple.photos.error" code:46008 userInfo:v15];

        id v7 = (void *)v16;
      }
    }
    else
    {
    }
  }

LABEL_13:
  if (v7)
  {
    os_signpost_id_t v17 = 0;
  }
  else
  {
    os_signpost_id_t v18 = [*(id *)(a1 + 32) proxyFactory];
    id v19 = [v18 remoteObjectProxyWithErrorHandler:&__block_literal_global_18];
    os_signpost_id_t v17 = [v19 postOpenProgressWithReply:&__block_literal_global_20];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (BOOL)openPhotoLibraryDatabaseWithoutProgressIfNeededWithOptions:(id)a3 error:(id *)a4
{
  unsigned __int8 v4 = atomic_load((unsigned __int8 *)&self->_isOpen);
  if (v4)
  {
    BOOL v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)os_signpost_id_t v10 = 0;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEBUG, "openPhotoLibraryDatabase: Photo library is already open", v10, 2u);
    }
    BOOL v6 = 1;
  }
  else
  {
    id v11 = 0;
    BOOL v6 = [(PLAssetsdLibraryClient *)self openPhotoLibraryDatabaseWithPostOpenProgress:0 options:a3 error:&v11];
    id v7 = v11;
    BOOL v8 = v7;
    if (a4 && !v6)
    {
      BOOL v8 = v7;
      BOOL v6 = 0;
      *a4 = v8;
    }
  }

  return v6;
}

- (BOOL)openPhotoLibraryDatabaseWithPostOpenProgress:(id *)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  long long v40 = 0u;
  *(_OWORD *)sel = 0u;
  long long v39 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v39) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: openPhotoLibraryDatabaseWithPostOpenProgress:options:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v39 + 1);
    *((void *)&v39 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  uint64_t v13 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  *(void *)&long long v40 = v14;
  long long v15 = v13;
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
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  id v48 = 0;
  os_signpost_id_t v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke;
  v38[3] = &unk_1E58A1C40;
  v38[4] = &buf;
  id v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v38];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke_2;
  v37[3] = &unk_1E589EE58;
  v37[4] = self;
  v37[5] = &buf;
  [v19 openPhotoLibraryDatabaseWithOptions:v9 reply:v37];

  id v20 = *(void **)(*((void *)&buf + 1) + 40);
  if (a5 && v20)
  {
    *a5 = v20;
    id v20 = *(void **)(*((void *)&buf + 1) + 40);
  }
  if (a3 && !v20)
  {
    id v21 = [(PLAssetsdBaseClient *)self proxyFactory];
    id v22 = [v21 remoteObjectProxyWithErrorHandler:&__block_literal_global_12];
    long long v23 = [v22 postOpenProgressWithReply:&__block_literal_global_14];

    if (v23) {
      *a3 = v23;
    }

    id v20 = *(void **)(*((void *)&buf + 1) + 40);
  }
  id v24 = PLGatekeeperXPCGetLog();
  long long v25 = v24;
  if (v20)
  {
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    uint64_t v26 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)v42 = 138412290;
    uint64_t v43 = v26;
    uint64_t v27 = "openPhotoLibraryDatabase failed with error %@";
    long long v28 = v25;
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    uint32_t v30 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_20;
    }
    *(_WORD *)v42 = 0;
    uint64_t v27 = "openPhotoLibraryDatabase succeeded";
    long long v28 = v25;
    os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
    uint32_t v30 = 2;
  }
  _os_log_impl(&dword_19BCFB000, v28, v29, v27, v42, v30);
LABEL_20:

  uint64_t v31 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v39) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  }
  if ((void)v40)
  {
    uint64_t v32 = PLRequestGetLog();
    id v33 = v32;
    os_signpost_id_t v34 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      id v35 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v35;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, v34, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v31 == 0;
}

void __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke(uint64_t a1, void *a2)
{
}

void __85__PLAssetsdLibraryClient_openPhotoLibraryDatabaseWithPostOpenProgress_options_error___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  BOOL v6 = v5;
  if (v12)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_consumeSandboxExtensions:")) {
      goto LABEL_6;
    }
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:44003 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = v5;
    id v9 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

LABEL_6:
}

- (BOOL)openPhotoLibraryDatabaseWithPostOpenProgress:(id *)a3 error:(id *)a4
{
  return [(PLAssetsdLibraryClient *)self openPhotoLibraryDatabaseWithPostOpenProgress:a3 options:0 error:a4];
}

- (BOOL)openApplicationOwnedFoldersWithError:(id *)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v32) = v6;
  if (v6)
  {
    uint64_t v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: openApplicationOwnedFoldersWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  id v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v33 = v10;
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
  uint64_t v38 = 0x3032000000;
  long long v39 = __Block_byref_object_copy_;
  long long v40 = __Block_byref_object_dispose_;
  id v41 = 0;
  os_signpost_id_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke;
  v31[3] = &unk_1E58A1C40;
  v31[4] = &buf;
  long long v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v31];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke_2;
  v30[3] = &unk_1E589EE58;
  v30[4] = self;
  v30[5] = &buf;
  [v15 openApplicationOwnedFoldersWithReply:v30];

  uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
  if (a3 && v16)
  {
    *a3 = v16;
    uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
  }
  os_signpost_id_t v17 = PLGatekeeperXPCGetLog();
  os_signpost_id_t v18 = v17;
  if (v16)
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      goto LABEL_15;
    }
    uint64_t v19 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)id v35 = 138412290;
    uint64_t v36 = v19;
    id v20 = "openApplicationOwnedFoldersWithError failed with error %@";
    id v21 = v18;
    os_log_type_t v22 = OS_LOG_TYPE_ERROR;
    uint32_t v23 = 12;
  }
  else
  {
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_15;
    }
    *(_WORD *)id v35 = 0;
    id v20 = "openApplicationOwnedFoldersWithError succeeded";
    id v21 = v18;
    os_log_type_t v22 = OS_LOG_TYPE_DEFAULT;
    uint32_t v23 = 2;
  }
  _os_log_impl(&dword_19BCFB000, v21, v22, v20, v35, v23);
LABEL_15:

  uint64_t v24 = *(void *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    long long v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      long long v28 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v28;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v24 == 0;
}

void __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __63__PLAssetsdLibraryClient_openApplicationOwnedFoldersWithError___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  BOOL v6 = v5;
  if (v12)
  {
    if (objc_msgSend(*(id *)(a1 + 32), "_consumeSandboxExtensions:")) {
      goto LABEL_6;
    }
    uint64_t v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:44003 userInfo:0];
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    id v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  else
  {
    uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
    id v11 = v5;
    id v9 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v11;
  }

LABEL_6:
}

- (BOOL)validateOrRebuildPhotoLibraryDatabaseWithError:(id *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    uint64_t v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: validateOrRebuildPhotoLibraryDatabaseWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  id v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v25 = v10;
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
  uint64_t v28 = 0x3032000000;
  os_log_type_t v29 = __Block_byref_object_copy_;
  uint32_t v30 = __Block_byref_object_dispose_;
  id v31 = 0;
  os_signpost_id_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke;
  v23[3] = &unk_1E58A1C40;
  void v23[4] = &buf;
  long long v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:v23];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke_2;
  v22[3] = &unk_1E58A1E50;
  void v22[4] = &buf;
  [v15 validateOrRebuildPhotoLibraryDatabaseWithReply:v22];

  uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
  if (a3 && v16)
  {
    *a3 = v16;
    uint64_t v16 = *(void **)(*((void *)&buf + 1) + 40);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    os_signpost_id_t v17 = PLRequestGetLog();
    os_signpost_id_t v18 = v17;
    os_signpost_id_t v19 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16 == 0;
}

void __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke(uint64_t a1, void *a2)
{
}

void __73__PLAssetsdLibraryClient_validateOrRebuildPhotoLibraryDatabaseWithError___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (BOOL)isLibraryReadyForImportWithError:(id *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v28 = 0u;
  *(_OWORD *)sel = 0u;
  long long v27 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v27) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: isLibraryReadyForImportWithError:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v27 + 1);
    *((void *)&v27 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v28 + 8));
  }
  id v9 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v10 = os_signpost_id_generate(v9);
  *(void *)&long long v28 = v10;
  id v11 = v9;
  id v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  uint64_t v23 = 0;
  long long v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy_;
  long long v33 = __Block_byref_object_dispose_;
  id v34 = 0;
  os_signpost_id_t v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  long long v15 = [v14 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __59__PLAssetsdLibraryClient_isLibraryReadyForImportWithError___block_invoke_7;
  v22[3] = &unk_1E58A17E0;
  void v22[4] = &v23;
  void v22[5] = &buf;
  [v15 isLibraryReadyForImportWithReply:v22];

  if (a3) {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
  }
  int v16 = *((unsigned __int8 *)v24 + 24);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v23, 8);
  if ((_BYTE)v27) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v28 + 8));
  }
  if ((void)v28)
  {
    os_signpost_id_t v17 = PLRequestGetLog();
    os_signpost_id_t v18 = v17;
    os_signpost_id_t v19 = v28;
    if ((unint64_t)(v28 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      id v20 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v20;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v16 != 0;
}

void __59__PLAssetsdLibraryClient_isLibraryReadyForImportWithError___block_invoke_7(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void __59__PLAssetsdLibraryClient_isLibraryReadyForImportWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    id v5 = "-[PLAssetsdLibraryClient isLibraryReadyForImportWithError:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %{public}s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (int64_t)getCurrentModelVersion
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v4;
  if (v4)
  {
    id v5 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: getCurrentModelVersion", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v6 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v5;

    os_activity_scope_enter(v5, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  *(void *)&long long v22 = v8;
  id v9 = v7;
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
  uint64_t v25 = 0x2020000000;
  uint64_t v26 = -1;
  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  uint64_t v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_2];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = __48__PLAssetsdLibraryClient_getCurrentModelVersion__block_invoke_3;
  v20[3] = &unk_1E58A01C0;
  void v20[4] = &buf;
  [v13 getCurrentModelVersionWithReply:v20];

  int64_t v14 = *(void *)(*((void *)&buf + 1) + 24);
  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    long long v15 = PLRequestGetLog();
    int v16 = v15;
    os_signpost_id_t v17 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      os_signpost_id_t v18 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v18;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v14;
}

uint64_t __48__PLAssetsdLibraryClient_getCurrentModelVersion__block_invoke_3(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

void __48__PLAssetsdLibraryClient_getCurrentModelVersion__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136446466;
    id v5 = "-[PLAssetsdLibraryClient getCurrentModelVersion]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %{public}s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)launchAssetsd
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: launchAssetsd", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  id v5 = PLRequestGetLog();
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
  id v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_398];
  [v11 launchAssetsd];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    id v12 = PLRequestGetLog();
    uint64_t v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      int64_t v14 = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __39__PLAssetsdLibraryClient_launchAssetsd__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (PLAssetsdLibraryClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5 sandboxExtensions:(id)a6
{
  id v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PLAssetsdLibraryClient;
  id v12 = [(PLAssetsdBaseClient *)&v15 initWithQueue:a3 proxyCreating:a4 proxyGetter:a5];
  uint64_t v13 = v12;
  if (v12) {
    objc_storeStrong((id *)&v12->_sandboxExtensions, a6);
  }

  return v13;
}

- (BOOL)isOpened
{
  unsigned __int8 v2 = atomic_load((unsigned __int8 *)&self->_isOpen);
  return v2 & 1;
}

@end