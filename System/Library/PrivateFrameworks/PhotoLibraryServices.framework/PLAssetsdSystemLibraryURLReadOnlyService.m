@interface PLAssetsdSystemLibraryURLReadOnlyService
- (PLAssetsdSystemLibraryURLReadOnlyService)initWithConnectionAuthorization:(id)a3;
- (void)systemPhotoLibraryURL:(id)a3;
@end

@implementation PLAssetsdSystemLibraryURLReadOnlyService

- (void).cxx_destruct
{
}

- (void)systemPhotoLibraryURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, void *, void))a3;
  long long v11 = 0u;
  *(_OWORD *)sel = 0u;
  long long v9 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v9) = v4;
  if (v4)
  {
    *((void *)&v9 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: systemPhotoLibraryURL:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v9 + 1), (os_activity_scope_state_t)((char *)&v11 + 8));
  }
  v5 = objc_msgSend(MEMORY[0x1E4F8B988], "systemLibraryURL", (void)v9);
  v3[2](v3, v5, 0);

  if (v10) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v11 + 8));
  }
  if ((void)v11)
  {
    v6 = PLRequestGetLog();
    v7 = v6;
    if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v14 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v7, OS_SIGNPOST_INTERVAL_END, v11, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdSystemLibraryURLReadOnlyService)initWithConnectionAuthorization:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdSystemLibraryURLReadOnlyService;
  v6 = [(PLAssetsdSystemLibraryURLReadOnlyService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);
  }

  return v7;
}

@end