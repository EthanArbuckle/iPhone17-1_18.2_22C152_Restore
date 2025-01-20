@interface PLAssetsdNonBindingDebugService
+ (void)setPhotosXPCEndpoint:(id)a3;
- (PLAssetsdNonBindingDebugService)initWithConnectionAuthorization:(id)a3 bundleController:(id)a4;
- (void)getActivePhotoLibrariesWithReply:(id)a3;
- (void)getBoundServicesForLibrary:(id)a3 reply:(id)a4;
- (void)getExistingPhotoLibraryIdentifierWithLibraryURL:(id)a3 reply:(id)a4;
- (void)getPhotosXPCEndpointWithReply:(id)a3;
@end

@implementation PLAssetsdNonBindingDebugService

+ (void)setPhotosXPCEndpoint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionAuthorization, 0);
  objc_storeStrong((id *)&self->_bundleController, 0);
}

- (void)getPhotosXPCEndpointWithReply:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, uint64_t, id, void))a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v4;
  if (v4)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getPhotosXPCEndpointWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if (PLPhotosXPCEndpoint)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F292A0]);
    [v5 _setEndpoint:PLPhotosXPCEndpoint];
  }
  else
  {
    v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to get photos XPC endpoint when it's not set", buf, 2u);
    }

    id v5 = 0;
  }
  v3[2](v3, 1, v5, 0);

  if ((_BYTE)v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    v7 = PLRequestGetLog();
    v8 = v7;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getExistingPhotoLibraryIdentifierWithLibraryURL:(id)a3 reply:(id)a4
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
    v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getExistingPhotoLibraryIdentifierWithLibraryURL:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v9 = (void *)*((void *)&v17 + 1);
    *((void *)&v17 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v16 = 0;
  long long v10 = +[PLPhotoLibraryIdentifier photoLibraryIdentifierWithPhotoLibraryURL:v5 createIfMissing:0 error:&v16];
  id v11 = v16;
  v6[2](v6, v10, v11);

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if ((void)v18)
  {
    v12 = PLRequestGetLog();
    v13 = v12;
    os_signpost_id_t v14 = v18;
    if ((unint64_t)(v18 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v13, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)getBoundServicesForLibrary:(id)a3 reply:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, id, void *))a4;
  long long v25 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v24) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getBoundServicesForLibrary:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v10 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  id v11 = [(PLPhotoLibraryBundleController *)self->_bundleController bundleForLibraryURL:v6];
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v13 = [v11 boundAssetsdServices];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__PLAssetsdNonBindingDebugService_getBoundServicesForLibrary_reply___block_invoke;
    v22[3] = &unk_1E5869E30;
    id v14 = v12;
    id v23 = v14;
    [v13 enumerateObjectsUsingBlock:v22];

    uint64_t v15 = 0;
    id v16 = v23;
  }
  else
  {
    uint64_t v17 = *MEMORY[0x1E4F28228];
    v27[0] = *MEMORY[0x1E4F289D0];
    v27[1] = v17;
    v28[0] = v6;
    v28[1] = @"No bundle found for libraryURL";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];
    uint64_t v15 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v16];
    id v14 = 0;
  }

  v7[2](v7, v14, v15);
  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    long long v18 = PLRequestGetLog();
    v19 = v18;
    os_signpost_id_t v20 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __68__PLAssetsdNonBindingDebugService_getBoundServicesForLibrary_reply___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = [a2 connectionDescription];
  [v2 addObject:v3];
}

- (void)getActivePhotoLibrariesWithReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  int v4 = (void (**)(id, void *, void))a3;
  long long v12 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v5;
  if (v5)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getActivePhotoLibrariesWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  id v6 = [(PLPhotoLibraryBundleController *)self->_bundleController libraryBundlePaths];
  v4[2](v4, v6, 0);

  if (v11) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  }
  if ((void)v12)
  {
    int v7 = PLRequestGetLog();
    int v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdNonBindingDebugService)initWithConnectionAuthorization:(id)a3 bundleController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PLAssetsdNonBindingDebugService;
  v9 = [(PLAssetsdNonBindingDebugService *)&v12 init];
  long long v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_connectionAuthorization, a3);
    objc_storeStrong((id *)&v10->_bundleController, a4);
  }

  return v10;
}

@end