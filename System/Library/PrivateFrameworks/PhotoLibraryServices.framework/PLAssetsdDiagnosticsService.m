@interface PLAssetsdDiagnosticsService
- (void)incompleteRestoreProcessesWithReply:(id)a3;
- (void)setPhotosXPCEndpoint:(id)a3 withReply:(id)a4;
@end

@implementation PLAssetsdDiagnosticsService

- (void)setPhotosXPCEndpoint:(id)a3 withReply:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, uint64_t, void))a4;
  long long v14 = 0u;
  *(_OWORD *)sel = 0u;
  long long v12 = 0u;
  int v7 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v12) = v7;
  if (v7)
  {
    *((void *)&v12 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: setPhotosXPCEndpoint:withReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v12 + 1), (os_activity_scope_state_t)((char *)&v14 + 8));
  }
  v8 = objc_msgSend(v5, "_endpoint", (void)v12);
  +[PLAssetsdNonBindingDebugService setPhotosXPCEndpoint:v8];

  v6[2](v6, 1, 0);
  if (v13) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v14 + 8));
  }
  if ((void)v14)
  {
    v9 = PLRequestGetLog();
    v10 = v9;
    if ((unint64_t)(v14 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v17 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v10, OS_SIGNPOST_INTERVAL_END, v14, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)incompleteRestoreProcessesWithReply:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v4 = (void (**)(id, void *))a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  int v5 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: incompleteRestoreProcessesWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  id v6 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdDiagnosticsService incompleteRestoreProcessesWithReply:]", (void)v11);
  int v7 = [v6 incompleteRestoreProcesses];
  v4[2](v4, v7);

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    v8 = PLRequestGetLog();
    v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

@end