@interface PLAssetsdLibraryManagementService
- (BOOL)_validateClientPermissionsToCloseLibraryAtURL:(id)a3 delete:(BOOL)a4 error:(id *)a5;
- (PLAssetsdLibraryManagementService)initWithConnectionAuthorization:(id)a3 bundleController:(id)a4;
- (void)_closePhotoLibraryAtURL:(id)a3 delete:(BOOL)a4 reply:(id)a5;
- (void)closeAndDeletePhotoLibraryAtURL:(id)a3 reply:(id)a4;
- (void)closePhotoLibraryAtURL:(id)a3 reply:(id)a4;
- (void)createManagedPhotoLibraryWithOptions:(id)a3 sandboxExtension:(id)a4 reply:(id)a5;
- (void)filesystemSizeForLibraryURL:(id)a3 reply:(id)a4;
- (void)findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 reply:(id)a4;
- (void)getPhotoLibraryIdentifierWithLibraryURL:(id)a3 reply:(id)a4;
- (void)getPhotoLibraryURLsWithLibraryURL:(id)a3 reply:(id)a4;
- (void)resetSyndicationLibraryWithReply:(id)a3;
- (void)setSystemPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 options:(unsigned __int16)a5 reply:(id)a6;
@end

@implementation PLAssetsdLibraryManagementService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleController, 0);
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
}

- (void)createManagedPhotoLibraryWithOptions:(id)a3 sandboxExtension:(id)a4 reply:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, void, PLLibraryOpenerCreationOptions *))a5;
  long long v36 = 0u;
  *(_OWORD *)sel = 0u;
  long long v35 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v35) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: createManagedPhotoLibraryWithOptions:sandboxExtension:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((void *)&v35 + 1);
    *((void *)&v35 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v36 + 8));
  }
  v14 = [v8 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsBundleURLKey"];
  if (!v14)
  {
    v15 = [v8 objectForKeyedSubscript:@"PLPhotoLibraryOpenerOptionsTestOptionsKey"];
    v14 = [v15 objectForKey:*MEMORY[0x1E4F8C4C0]];
  }
  if (v9 && v14)
  {
    v16 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
    id v34 = 0;
    v17 = [v16 URLFromClientLibraryURL:v14 sandboxExtension:v9 error:&v34];
    id v18 = v34;

    if (v17 || !v18)
    {
    }
    else
    {
      v19 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v20 = *MEMORY[0x1E4F28A50];
      uint64_t v40 = *MEMORY[0x1E4F28A50];
      id v41 = v18;
      v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      uint64_t v22 = *MEMORY[0x1E4F8C500];
      v17 = [v19 errorWithDomain:*MEMORY[0x1E4F8C500] code:41027 userInfo:v21];

      if (v17)
      {
        v23 = (void *)MEMORY[0x1E4F28C58];
        v38[0] = *MEMORY[0x1E4F289D0];
        v38[1] = v20;
        v39[0] = 0;
        v39[1] = v17;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
        v25 = [v23 errorWithDomain:v22 code:46018 userInfo:v24];

        v10[2](v10, 0, v25);
        goto LABEL_17;
      }
    }
  }
  else
  {
    v17 = v14;
  }
  v25 = [[PLLibraryOpenerCreationOptions alloc] initWithOptionsDictionary:v8 connectionAuthorization:self->_connectionAuthorization];
  if (v25)
  {
    id v33 = 0;
    v26 = +[PLPhotoLibraryOpener createManagedPhotoLibraryOnFilesystemWithOptions:v25 error:&v33];
    v27 = (PLLibraryOpenerCreationOptions *)v33;
    v28 = [v26 libraryURL];
    ((void (**)(id, void *, PLLibraryOpenerCreationOptions *))v10)[2](v10, v28, v27);
  }
  else
  {
    v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:46018 userInfo:0];
    v10[2](v10, 0, v27);
  }

LABEL_17:
  if ((_BYTE)v35) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v36 + 8));
  }
  if ((void)v36)
  {
    v29 = PLRequestGetLog();
    v30 = v29;
    os_signpost_id_t v31 = v36;
    if ((unint64_t)(v36 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v43 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_END, v31, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 reply:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  long long v19 = 0u;
  *(_OWORD *)sel = 0u;
  long long v18 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v18) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: findPhotoLibraryIdentifiersMatchingSearchCriteria:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v18 + 1);
    *((void *)&v18 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v19 + 8));
  }
  v10 = [[PLPhotoLibraryFinder alloc] initWithSearchCriteria:v5];
  id v17 = 0;
  int v11 = [(PLPhotoLibraryFinder *)v10 findMatchingPhotoLibraryIdentifiersAndReturnError:&v17];
  id v12 = v17;
  v6[2](v6, v11, v12);

  if ((_BYTE)v18) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v19 + 8));
  }
  if ((void)v19)
  {
    v13 = PLRequestGetLog();
    v14 = v13;
    os_signpost_id_t v15 = v19;
    if ((unint64_t)(v19 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v22 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getPhotoLibraryIdentifierWithLibraryURL:(id)a3 reply:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *, id))a4;
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v17) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getPhotoLibraryIdentifierWithLibraryURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v17 + 1);
    *((void *)&v17 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v16 = 0;
  v10 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v5 createIfMissing:1 error:&v16];
  id v11 = v16;
  v6[2](v6, v10, v11);

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    id v12 = PLRequestGetLog();
    v13 = v12;
    os_signpost_id_t v14 = v18;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)filesystemSizeForLibraryURL:(id)a3 reply:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v20 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v19) = v7;
  if (v7)
  {
    id v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: filesystemSizeForLibraryURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v19 + 1);
    *((void *)&v19 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v20 + 8));
  }
  v10 = +[PLPhotoLibraryBundleController sharedBundleController];
  id v11 = [v10 lookupOrCreateBundleForLibraryURL:v5];

  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __71__PLAssetsdLibraryManagementService_filesystemSizeForLibraryURL_reply___block_invoke;
  v17[3] = &unk_1E5874598;
  id v12 = v6;
  id v18 = v12;
  [v11 calculateTotalSizeWithResult:v17];

  if ((_BYTE)v19) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v20 + 8));
  }
  if ((void)v20)
  {
    v13 = PLRequestGetLog();
    os_signpost_id_t v14 = v13;
    os_signpost_id_t v15 = v20;
    if ((unint64_t)(v20 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v23 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v14, OS_SIGNPOST_INTERVAL_END, v15, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __71__PLAssetsdLibraryManagementService_filesystemSizeForLibraryURL_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_closePhotoLibraryAtURL:(id)a3 delete:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  v60[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void, id))a5;
  id v50 = 0;
  BOOL v10 = [(PLAssetsdLibraryManagementService *)self _validateClientPermissionsToCloseLibraryAtURL:v8 delete:v6 error:&v50];
  id v11 = v50;
  if (!v10)
  {
    v9[2](v9, 0, v11);
    goto LABEL_35;
  }
  id v12 = +[PLPhotoLibraryBundleController sharedBundleController];
  v47 = [v12 openBundleAtLibraryURL:v8];
  if (!v47)
  {
    v30 = PLBackendGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v52 = (uint64_t)v8;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_DEFAULT, "_closePhotoLibraryAtURL: No bundle found for libraryURL %@", buf, 0xCu);
    }

    if (!v6)
    {
      v45 = v12;
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v32 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
      [v32 setObject:@"No bundle found for libraryURL" forKeyedSubscript:*MEMORY[0x1E4F28228]];
      uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v32];
      uint64_t v31 = 0;
LABEL_31:

      v29 = (void *)v33;
      id v12 = v45;
      goto LABEL_32;
    }
    id v46 = v8;
    v29 = 0;
    uint64_t v31 = 1;
    goto LABEL_20;
  }
  v13 = [v47 libraryServicesManager];
  os_signpost_id_t v14 = v13;
  id v46 = v8;
  if (v6 && v13)
  {
    id v49 = 0;
    int v15 = [v13 disableiCPLForLibraryDeletionWithError:&v49];
    id v16 = v49;
    long long v17 = v16;
    if (!v15)
    {
      id v28 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v28 setObject:v8 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
      [v28 setObject:@"Couldn't open library" forKeyedSubscript:*MEMORY[0x1E4F28228]];
      [v28 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
      v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v28];
      uint64_t v44 = 0;
      goto LABEL_19;
    }
  }
  if (v6) {
    uint64_t v18 = 41025;
  }
  else {
    uint64_t v18 = 41029;
  }
  long long v19 = (void *)MEMORY[0x1E4F28C58];
  id v20 = v8;
  v21 = v14;
  uint64_t v22 = v9;
  BOOL v23 = v6;
  BOOL v6 = (BOOL)v12;
  uint64_t v24 = self;
  id v25 = v11;
  uint64_t v26 = *MEMORY[0x1E4F8C500];
  uint64_t v59 = *MEMORY[0x1E4F289D0];
  v60[0] = v20;
  uint64_t v44 = 1;
  long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v60 forKeys:&v59 count:1];
  uint64_t v27 = v26;
  id v11 = v25;
  self = v24;
  id v12 = (void *)v6;
  LODWORD(v6) = v23;
  id v9 = v22;
  os_signpost_id_t v14 = v21;
  id v28 = [v19 errorWithDomain:v27 code:v18 userInfo:v17];
  [v12 shutdownBundle:v47 reason:v28];
  v29 = 0;
LABEL_19:

  uint64_t v31 = v44;
  if (!v44)
  {
    id v8 = v46;
    goto LABEL_32;
  }
LABEL_20:
  id v8 = v46;
  if (v6)
  {
    id v43 = v11;
    v45 = v12;
    id v34 = PLBackendGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      int v35 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientProcessIdentifier];
      long long v36 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
      *(_DWORD *)buf = 138412802;
      uint64_t v52 = (uint64_t)v46;
      __int16 v53 = 1024;
      *(_DWORD *)v54 = v35;
      *(_WORD *)&v54[4] = 2114;
      *(void *)&v54[6] = v36;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Deleting photo library from file system at %@, requested by [%d] %{public}@", buf, 0x1Cu);
    }
    id v48 = 0;
    BOOL v37 = +[PLPhotoLibraryOpener deleteLibraryFromFilesystemAtURL:v46 error:&v48];
    id v32 = v48;
    v38 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
    [v38 removeSSBForLibraryURL:v46];

    id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v40 = v39;
    if (v46) {
      [v39 setObject:v46 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
    }
    if (v32) {
      [v40 setObject:v32 forKeyedSubscript:*MEMORY[0x1E4F28A50]];
    }
    id v11 = v43;
    uint64_t v31 = v37;
    if (v37)
    {
      uint64_t v33 = 0;
    }
    else
    {
      uint64_t v33 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41026 userInfo:v40];
    }

    goto LABEL_31;
  }
LABEL_32:
  id v41 = PLPhotosObjectLifecycleGetLog();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v42 = objc_opt_class();
    *(_DWORD *)buf = 138413314;
    uint64_t v52 = v42;
    __int16 v53 = 2048;
    *(void *)v54 = self;
    *(_WORD *)&v54[8] = 2112;
    *(void *)&v54[10] = v8;
    __int16 v55 = 1024;
    BOOL v56 = v6;
    __int16 v57 = 2112;
    v58 = v29;
    _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEBUG, "%@ %p _closePhotoLibraryURL:%@ delete:%d error:%@", buf, 0x30u);
  }

  v9[2](v9, v31, v29);
LABEL_35:
}

- (BOOL)_validateClientPermissionsToCloseLibraryAtURL:(id)a3 delete:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (([MEMORY[0x1E4F8B980] isSystemPhotoLibraryURL:v8] & 1) != 0
    || [MEMORY[0x1E4F8B980] wellKnownPhotoLibraryIdentifierForURL:v8])
  {
    uint64_t v9 = 41005;
  }
  else
  {
    if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientEntitledForPhotoKitOrPrivatePhotosTCC])
    {
      BOOL v12 = 1;
      goto LABEL_7;
    }
    os_signpost_id_t v14 = PLBackendGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      if (v6) {
        int v15 = @"close and delete";
      }
      else {
        int v15 = @"close";
      }
      id v16 = [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization trustedCallerBundleID];
      int v17 = 138543618;
      uint64_t v18 = v15;
      __int16 v19 = 2112;
      id v20 = v16;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "Cannot %{public}@ library, client %@ is missing required entitlements", (uint8_t *)&v17, 0x16u);
    }
    uint64_t v9 = 41009;
  }
  id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:v9 userInfo:0];
  id v11 = v10;
  if (a5) {
    *a5 = v10;
  }

  BOOL v12 = 0;
LABEL_7:

  return v12;
}

- (void)resetSyndicationLibraryWithReply:(id)a3
{
  v30[2] = *(id *)MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v25 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v5 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v23) = v5;
  if (v5)
  {
    BOOL v6 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: resetSyndicationLibraryWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v27 = 0x3032000000;
  id v28 = __Block_byref_object_copy__110144;
  v29 = __Block_byref_object_dispose__110145;
  v30[0] = 0;
  id obj = 0;
  id v8 = (void *)PLCreateShortLivedWellKnownPhotoLibrary(3, (uint64_t)"-[PLAssetsdLibraryManagementService resetSyndicationLibraryWithReply:]", &obj);
  objc_storeStrong(v30, obj);
  if (v8)
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __70__PLAssetsdLibraryManagementService_resetSyndicationLibraryWithReply___block_invoke;
    v13[3] = &unk_1E5874900;
    id v16 = &v19;
    p_long long buf = &buf;
    id v14 = v8;
    int v15 = self;
    [v14 performBlockAndWait:v13];
  }
  (*((void (**)(id, void, void))v4 + 2))(v4, *((unsigned __int8 *)v20 + 24), *(void *)(*((void *)&buf + 1) + 40));

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v19, 8);
  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    uint64_t v9 = PLRequestGetLog();
    id v10 = v9;
    os_signpost_id_t v11 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(*((SEL *)&v25 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v11, "Cleared purgeable flags for %@", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __70__PLAssetsdLibraryManagementService_resetSyndicationLibraryWithReply___block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  v3 = [*(id *)(a1 + 32) pathManager];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v4 + 40);
  char v5 = PLResetSyndicationLibraryWithManagedObjectContext(v2, v3, &obj);
  objc_storeStrong((id *)(v4 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v5;

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    BOOL v6 = *(void **)(*(void *)(a1 + 40) + 16);
    int v7 = [MEMORY[0x1E4F8B980] systemLibraryURL];
    id v8 = [v6 lookupOrCreateBundleForLibraryURL:v7];

    uint64_t v9 = [v8 libraryServicesManager];
    id v10 = [[PLPhotoLibraryOpener alloc] initWithLibraryServicesManager:v9 reportInProgressUpgrades:0];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v24 = *(id *)(v11 + 40);
    BOOL v12 = [(PLPhotoLibraryOpener *)v10 openPhotoLibraryDatabaseWithAutoUpgrade:1 autoCreate:0 error:&v24];
    objc_storeStrong((id *)(v11 + 40), v24);
    if (v12)
    {
      v13 = [v9 databaseContext];
      id v14 = [v13 newShortLivedLibraryWithName:"-[PLAssetsdLibraryManagementService resetSyndicationLibraryWithReply:]_block_invoke"];

      int v15 = [v14 managedObjectContext];
      id v16 = [v14 pathManager];
      int v17 = [NSString stringWithUTF8String:"-[PLAssetsdLibraryManagementService resetSyndicationLibraryWithReply:]_block_invoke"];
      uint64_t v18 = *(void *)(*(void *)(a1 + 56) + 8);
      id v23 = *(id *)(v18 + 40);
      BOOL v19 = PLDeleteGuestAssetsInLibraryWithManagedObjectContext(v15, v16, v17, 0, &v23);
      objc_storeStrong((id *)(v18 + 40), v23);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v19;
    }
    else
    {
      id v14 = PLSyndicationGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
        *(_DWORD *)long long buf = 138412290;
        uint64_t v27 = v21;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "resetSyndicationLibrary: failed to open system photo library %@", buf, 0xCu);
      }
    }

    char v22 = [v9 backgroundJobService];
    [v22 signalBackgroundProcessingNeededOnBundle:v8];
  }
  else
  {
    id v8 = PLSyndicationGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
      *(_DWORD *)long long buf = 138412290;
      uint64_t v27 = v20;
      _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_ERROR, "resetSyndicationLibrary: failed with error %@", buf, 0xCu);
    }
  }
}

- (void)closeAndDeletePhotoLibraryAtURL:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v8;
  if (v8)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: closeAndDeletePhotoLibraryAtURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAssetsdLibraryManagementService _closePhotoLibraryAtURL:delete:reply:](self, "_closePhotoLibraryAtURL:delete:reply:", v6, 1, v7, (void)v12);
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    uint64_t v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)closePhotoLibraryAtURL:(id)a3 reply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v8;
  if (v8)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: closePhotoLibraryAtURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  -[PLAssetsdLibraryManagementService _closePhotoLibraryAtURL:delete:reply:](self, "_closePhotoLibraryAtURL:delete:reply:", v6, 0, v7, (void)v12);
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    uint64_t v9 = PLRequestGetLog();
    id v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      int v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getPhotoLibraryURLsWithLibraryURL:(id)a3 reply:(id)a4
{
  v46[2] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v40 = 0u;
  *(_OWORD *)sel = 0u;
  long long v39 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v39) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getPhotoLibraryURLsWithLibraryURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v39 + 1);
    *((void *)&v39 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  uint64_t v11 = [MEMORY[0x1E4F8B988] systemLibraryURL];
  long long v12 = v11;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v43 = 0x3032000000;
  uint64_t v44 = __Block_byref_object_copy__110144;
  v45 = __Block_byref_object_dispose__110145;
  v46[0] = 0;
  if (v11)
  {
    if ([v11 isEqual:v6])
    {
      char v13 = [(PLPhotoLibraryBundleController *)self->_bundleController libraryBundles];
      uint64_t v33 = MEMORY[0x1E4F143A8];
      uint64_t v34 = 3221225472;
      int v35 = __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke;
      long long v36 = &unk_1E5874570;
      id v37 = v12;
      p_long long buf = &buf;
      [v13 enumerateObjectsUsingBlock:&v33];

      long long v14 = v37;
      goto LABEL_9;
    }
    int v15 = (void **)(*((void *)&buf + 1) + 40);
  }
  else
  {
    int v15 = v46;
  }
  id v16 = v6;
  long long v14 = *v15;
  void *v15 = v16;
LABEL_9:

  if ([(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization isClientAuthorizedForSandboxExtensions])
  {
    int v17 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v12)
    {
      connectionAuthorization = self->_connectionAuthorization;
      if (connectionAuthorization)
      {
        [(PLAssetsdConnectionAuthorization *)connectionAuthorization clientAuditToken];
      }
      else
      {
        long long v31 = 0u;
        long long v32 = 0u;
      }
      uint64_t v20 = [v12 path];
      uint64_t v21 = (void *)[v17 newSandboxExtensionDataForClient:&v31 path:v20 writable:0];

      if (v21) {
        [v18 addObject:v21];
      }
    }
    char v22 = *(void **)(*((void *)&buf + 1) + 40);
    if (v22)
    {
      if (self->_connectionAuthorization)
      {
        [(PLAssetsdConnectionAuthorization *)self->_connectionAuthorization clientAuditToken];
        char v22 = *(void **)(*((void *)&buf + 1) + 40);
      }
      else
      {
        long long v29 = 0u;
        long long v30 = 0u;
      }
      id v23 = objc_msgSend(v22, "path", v29, v30, v31, v32, v33, v34, v35, v36);
      id v24 = (void *)[v17 newSandboxExtensionDataForClient:&v29 path:v23 writable:0];

      if (v24) {
        [v18 addObject:v24];
      }
    }
  }
  else
  {
    id v18 = 0;
  }
  (*((void (**)(id, void *, void, id, void))v7 + 2))(v7, v12, *(void *)(*((void *)&buf + 1) + 40), v18, 0);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v39) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  }
  if ((void)v40)
  {
    long long v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v26, OS_SIGNPOST_INTERVAL_END, v27, "Cleared purgeable flags for %@", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v6 = [a2 boundAssetsdServices];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_2;
  v9[3] = &unk_1E5874548;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 40);
  id v10 = v7;
  uint64_t v11 = v8;
  uint64_t v12 = a4;
  [v6 enumerateObjectsUsingBlock:v9];
}

void __77__PLAssetsdLibraryManagementService_getPhotoLibraryURLsWithLibraryURL_reply___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v10 = a2;
  int v6 = [v10 isPhotosClient];
  id v7 = v10;
  if (v6)
  {
    uint64_t v8 = [v10 libraryURL];
    uint64_t v9 = *(void **)(a1 + 32);
    if (!v9 || ([v9 isEqual:v8] & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), v8);
    }
    *a4 = 1;
    **(unsigned char **)(a1 + 48) = 1;

    id v7 = v10;
  }
}

- (void)setSystemPhotoLibraryURL:(id)a3 sandboxExtension:(id)a4 options:(unsigned __int16)a5 reply:(id)a6
{
  uint64_t v7 = a5;
  v77[1] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v58 = a4;
  id v10 = (void (**)(id, id))a6;
  long long v64 = 0u;
  *(_OWORD *)sel = 0u;
  long long v63 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v63) = v11;
  if (v11)
  {
    uint64_t v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setSystemPhotoLibraryURL:sandboxExtension:options:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    char v13 = (void *)*((void *)&v63 + 1);
    *((void *)&v63 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v64 + 8));
  }
  long long v14 = [MEMORY[0x1E4F8B988] systemLibraryURL];
  if ((v7 & 3) == 2)
  {
    if (!v9)
    {
      uint64_t v59 = [MEMORY[0x1E4F8B988] systemLibraryURL];
      uint64_t v21 = 0;
      int v15 = 0;
      char v56 = 1;
      if (!v14) {
        goto LABEL_32;
      }
LABEL_24:
      uint64_t v26 = [MEMORY[0x1E4F28CB8] defaultManager];
      os_signpost_id_t v27 = [v14 path];
      int v28 = [v26 fileExistsAtPath:v27];

      if (v28)
      {
        if (+[PLCacheDeleteSupport clearPurgeableFlagsForAllResourcesInPhotoLibraryURL:v14])
        {
          long long v29 = PLBackendGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            v67 = (const char *)v14;
            long long v30 = "Cleared purgeable flags for %@";
            long long v31 = v29;
            os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
LABEL_30:
            _os_log_impl(&dword_19B3C7000, v31, v32, v30, buf, 0xCu);
          }
        }
        else
        {
          long long v29 = PLBackendGetLog();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            v67 = (const char *)v14;
            long long v30 = "Failed to clear purgeable flags for %@";
            long long v31 = v29;
            os_log_type_t v32 = OS_LOG_TYPE_ERROR;
            goto LABEL_30;
          }
        }
      }
LABEL_32:
      uint64_t v33 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v72 = *MEMORY[0x1E4F28588];
      v73 = @"User is changing the system photo library";
      uint64_t v34 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v73 forKeys:&v72 count:1];
      char v22 = [v33 errorWithDomain:*MEMORY[0x1E4F8C500] code:41019 userInfo:v34];

      uint64_t v54 = os_transaction_create();
      if (v14)
      {
        int v35 = -[PLPhotoLibraryBundleController openBundleAtLibraryURL:](self->_bundleController, "openBundleAtLibraryURL:", v14, v54);
        [v35 invalidateClientConnectionsWithReason:v22];
        long long v36 = [v35 libraryServicesManager];
        id v61 = 0;
        char v37 = [v36 willBecomeNonSyncablePhotoLibrary:&v61];
        v38 = (char *)v61;

        if ((v37 & 1) == 0)
        {
          long long v39 = PLBackendGetLog();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            v67 = (const char *)v14;
            __int16 v68 = 2112;
            v69 = v38;
            _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEFAULT, "SPL Change: failed to prepare previous SPL %@ to become non-SPL: %@", buf, 0x16u);
          }

          [v35 clearInvalidateClientsReason];
          int v35 = 0;
        }
      }
      else
      {
        int v35 = 0;
      }
      if (v56) {
        goto LABEL_49;
      }
      long long v40 = [(PLPhotoLibraryBundleController *)self->_bundleController bundleForLibraryURL:v21];
      if (v40)
      {
        id v41 = PLBackendGetLog();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          v67 = v21;
          _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEFAULT, "SPL Change: Shutting down library for restart as new SPL at %@", buf, 0xCu);
        }

        [(PLPhotoLibraryBundleController *)self->_bundleController shutdownBundle:v40 reason:v22];
      }

      if (v15
        || (id v60 = 0,
            int v42 = [MEMORY[0x1E4F8B988] setSystemLibraryURL:v21 options:v7 error:&v60],
            int v15 = (char *)v60,
            !v42))
      {
LABEL_49:
        id v46 = objc_msgSend(v35, "libraryServicesManager", v54);
        [v46 didRemainSyncablePhotoLibrary];
        char v47 = 0;
      }
      else
      {
        uint64_t v43 = PLBackendGetLog();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          v67 = v21;
          __int16 v68 = 2112;
          v69 = (const char *)v14;
          _os_log_impl(&dword_19B3C7000, v43, OS_LOG_TYPE_DEFAULT, "SPL Changed to: %@ from: %@", buf, 0x16u);
        }

        uint64_t v44 = (void *)MEMORY[0x1E4F8B988];
        v45 = [v14 path];
        [v44 recordPrevSystemLibraryPath:v45];

        id v46 = [v35 libraryServicesManager];
        [v46 didBecomeNonSyncablePhotoLibrary];
        char v47 = 1;
      }

      if (v59)
      {
        id v48 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
        [v48 removeSSBForLibraryURL:v59];
      }
      if ((v47 & 1) == 0)
      {
        id v49 = PLBackendGetLog();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          v67 = v15;
          __int16 v68 = 2112;
          v69 = v21;
          __int16 v70 = 2112;
          v71 = v14;
          _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_ERROR, "Unable to set the System Photo Library URL (error = %@) to %@ from %@", buf, 0x20u);
        }
      }
      objc_msgSend(v35, "clearInvalidateClientsReason", v54);
      v10[2](v10, v15);

      id v9 = (id)v21;
      goto LABEL_57;
    }
    id v9 = v9;
    int v15 = 0;
    uint64_t v59 = v9;
  }
  else
  {
    if ([MEMORY[0x1E4F8B908] fileURL:v9 isEqualToFileURL:v14])
    {
      v10[2](v10, 0);
      int v15 = 0;
      goto LABEL_58;
    }
    int v15 = 0;
    if (v9 && v58)
    {
      id v16 = [MEMORY[0x1E4F8B950] sharedBookmarkManager];
      id v62 = 0;
      uint64_t v17 = [v16 URLFromClientLibraryURL:v9 sandboxExtension:v58 error:&v62];
      id v18 = v62;

      int v15 = 0;
      if (!v17 && v18)
      {
        BOOL v19 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v76 = *MEMORY[0x1E4F28A50];
        v77[0] = v18;
        uint64_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v77 forKeys:&v76 count:1];
        int v15 = [v19 errorWithDomain:*MEMORY[0x1E4F8C500] code:41027 userInfo:v20];
      }
    }
    else
    {
      uint64_t v17 = (uint64_t)v9;
    }
    uint64_t v21 = 0;
    if (!v17)
    {
      char v56 = 1;
      uint64_t v59 = 0;
      if (!v14) {
        goto LABEL_32;
      }
      goto LABEL_24;
    }
    id v9 = (id)v17;
    uint64_t v59 = 0;
  }
  char v22 = (void *)[objc_alloc(MEMORY[0x1E4F8B980]) initWithLibraryURL:v9];
  if (![v22 isAppLibraryPathManager])
  {

    char v56 = 0;
    uint64_t v21 = (const char *)v9;
    if (!v14) {
      goto LABEL_32;
    }
    goto LABEL_24;
  }
  id v23 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v74 = *MEMORY[0x1E4F28228];
  v75 = @"Cannot set an app library as the SPL";
  id v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v75 forKeys:&v74 count:1];
  uint64_t v25 = [v23 errorWithDomain:*MEMORY[0x1E4F8C500] code:41019 userInfo:v24];

  v10[2](v10, (id)v25);
  int v15 = (char *)v25;
LABEL_57:

LABEL_58:
  if ((_BYTE)v63) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v64 + 8));
  }
  if ((void)v64)
  {
    id v50 = PLRequestGetLog();
    v51 = v50;
    os_signpost_id_t v52 = v64;
    if ((unint64_t)(v64 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v50))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      v67 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v51, OS_SIGNPOST_INTERVAL_END, v52, "Cleared purgeable flags for %@", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdLibraryManagementService)initWithConnectionAuthorization:(id)a3 bundleController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdLibraryManagementService;
  id v9 = [(PLAssetsdLibraryManagementService *)&v12 init];
  id v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionAuthorization, a3);
    objc_storeStrong((id *)&v10->_bundleController, a4);
  }

  return v10;
}

@end