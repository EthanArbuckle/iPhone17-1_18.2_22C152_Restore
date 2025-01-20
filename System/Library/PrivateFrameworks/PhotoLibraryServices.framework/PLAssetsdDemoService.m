@interface PLAssetsdDemoService
- (PLAssetsdDemoService)initWithConnectionAuthorization:(id)a3;
- (void)cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:(id)a3;
- (void)hasCompletedMomentAnalysisWithReply:(id)a3;
- (void)hasCompletedRestorePostProcessingWithReply:(id)a3;
@end

@implementation PLAssetsdDemoService

- (void).cxx_destruct
{
}

- (void)hasCompletedMomentAnalysisWithReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, uint64_t))a3;
  long long v12 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v4;
  if (v4)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: hasCompletedMomentAnalysisWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  v5 = objc_msgSend(MEMORY[0x1E4F8B980], "systemLibraryURL", (void)v10);
  id v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLAssetsdDemoService hasCompletedMomentAnalysisWithReply:]", v5, 0, 0);

  v3[2](v3, [v6 hasCompletedMomentAnalysis]);
  if (v11) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  }
  if ((void)v12)
  {
    v7 = PLRequestGetLog();
    v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Cleanup for store demo mode [requested by SpringBoard]", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)hasCompletedRestorePostProcessingWithReply:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, uint64_t))a3;
  long long v12 = 0u;
  *(_OWORD *)sel = 0u;
  long long v10 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v10) = v4;
  if (v4)
  {
    *((void *)&v10 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: hasCompletedRestorePostProcessingWithReply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v10 + 1), (os_activity_scope_state_t)((char *)&v12 + 8));
  }
  v5 = objc_msgSend(MEMORY[0x1E4F8B980], "systemLibraryURL", (void)v10);
  id v6 = +[PLPhotoLibrary newPhotoLibraryWithName:loadedFromURL:options:error:](PLPhotoLibrary, "newPhotoLibraryWithName:loadedFromURL:options:error:", "-[PLAssetsdDemoService hasCompletedRestorePostProcessingWithReply:]", v5, 0, 0);

  v3[2](v3, [v6 hasCompletedRestorePostProcessing]);
  if (v11) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v12 + 8));
  }
  if ((void)v12)
  {
    v7 = PLRequestGetLog();
    v8 = v7;
    if ((unint64_t)(v12 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v15 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v8, OS_SIGNPOST_INTERVAL_END, v12, "Cleanup for store demo mode [requested by SpringBoard]", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  v3 = (void (**)(id, uint64_t, void *))a3;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  int v4 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v26) = v4;
  if (v4)
  {
    *((void *)&v26 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v26 + 1), (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  v5 = (void *)MEMORY[0x19F38D3B0]();
  id v6 = +[PLDemoModeUtilities newDemoModeUtilitiesWithDefaultSystemPaths];
  v7 = PLStoreDemoModeGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Cleanup for store demo mode [requested by SpringBoard]", buf, 2u);
  }

  v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  v9 = [v6 demoContentPhotoLibraryTemplatePath];
  int v10 = [v8 fileExistsAtPath:v9];

  if (v10)
  {
    char v11 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      long long v12 = [v6 demoContentPhotoLibraryTemplatePath];
      *(_DWORD *)buf = 138543362;
      v34 = v12;
      _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_DEFAULT, "Found demo content template, staging photo library from %{public}@", buf, 0xCu);
    }
    if ([v6 prepareForStoreDemoModeByStagingDemoLibraryContentFromTemplate])
    {
      int v13 = 0;
      v14 = 0;
LABEL_14:
      uint64_t v16 = 1;
      goto LABEL_18;
    }
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v31 = *MEMORY[0x1E4F28228];
    v32 = @"unable to stage demo library content from template";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
    uint64_t v19 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v18];
  }
  else
  {
    v15 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_DEFAULT, "No demo content template found, performing legacy demo library content cleanup by resetting library", buf, 2u);
    }

    if ([v6 cleanupForStoreDemoModeByRemovingNonDemoContentFromTargetLibrary])
    {
      v14 = 0;
      int v13 = 1;
      goto LABEL_14;
    }
    v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28228];
    v30 = @"unable to remove non-demo content";
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v19 = [v17 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v18];
  }
  v14 = (char *)v19;

  uint64_t v16 = 0;
  int v13 = 1;
LABEL_18:

  if ((v16 & 1) == 0)
  {
    v21 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v14;
      _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_ERROR, "Failed to cleanup demo library, %{public}@", buf, 0xCu);
    }
  }
  v3[2](v3, v16, v14);
  if (((v13 | v16 ^ 1) & 1) == 0)
  {
    v22 = PLStoreDemoModeGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "Cleanup for store demo mode force exiting photos clients to kickstart staged library installation", buf, 2u);
    }

    [v6 kickstartStagedDemoContentInstallationByKillingAllClients];
  }

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    v23 = PLRequestGetLog();
    v24 = v23;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v27, "Cleanup for store demo mode [requested by SpringBoard]", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdDemoService)initWithConnectionAuthorization:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdDemoService;
  id v6 = [(PLAssetsdDemoService *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_connectionAuthorization, a3);
  }

  return v7;
}

@end