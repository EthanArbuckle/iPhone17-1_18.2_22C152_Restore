@interface PLAssetsdDemoClient
- (BOOL)cleanupForStoreDemoMode:(id *)a3;
- (BOOL)hasCompletedMomentAnalysis:(BOOL *)a3 error:(id *)a4;
- (BOOL)hasCompletedRestorePostProcessing:(BOOL *)a3 error:(id *)a4;
- (void)cleanupForStoreDemoModeWithCompletion:(id)a3;
@end

@implementation PLAssetsdDemoClient

- (BOOL)hasCompletedMomentAnalysis:(BOOL *)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v8;
  if (v8)
  {
    v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: hasCompletedMomentAnalysis:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v10 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v30 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a3)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdDemoClient.m", 75, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1622;
  v35 = __Block_byref_object_dispose__1623;
  id v36 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  v28[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke_22;
  v27[3] = &__block_descriptor_40_e8_v12__0B8l;
  v27[4] = a3;
  [v17 hasCompletedMomentAnalysisWithReply:v27];

  uint64_t v18 = *((void *)&buf + 1);
  if (a4)
  {
    v19 = *(void **)(*((void *)&buf + 1) + 40);
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
    v21 = PLRequestGetLog();
    v22 = v21;
    os_signpost_id_t v23 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20 == 0;
}

void __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDemoClient hasCompletedMomentAnalysis:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __56__PLAssetsdDemoClient_hasCompletedMomentAnalysis_error___block_invoke_22(uint64_t result, char a2)
{
  **(unsigned char **)(result + 32) = a2;
  return result;
}

- (BOOL)hasCompletedRestorePostProcessing:(BOOL *)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  *(_OWORD *)sel = 0u;
  long long v29 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v8;
  if (v8)
  {
    __int16 v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: hasCompletedRestorePostProcessing:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v30 = v12;
  v13 = v11;
  v14 = v13;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!a3)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdDemoClient.m", 59, @"Invalid parameter not satisfying: %@", @"result" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__1622;
  v35 = __Block_byref_object_dispose__1623;
  id v36 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke;
  v28[3] = &unk_1E58A1C40;
  v28[4] = &buf;
  v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v28];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke_19;
  v27[3] = &__block_descriptor_40_e8_v12__0B8l;
  v27[4] = a3;
  [v17 hasCompletedRestorePostProcessingWithReply:v27];

  uint64_t v18 = *((void *)&buf + 1);
  if (a4)
  {
    v19 = *(void **)(*((void *)&buf + 1) + 40);
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
    v21 = PLRequestGetLog();
    v22 = v21;
    os_signpost_id_t v23 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20 == 0;
}

void __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDemoClient hasCompletedRestorePostProcessing:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __63__PLAssetsdDemoClient_hasCompletedRestorePostProcessing_error___block_invoke_19(uint64_t result, char a2)
{
  **(unsigned char **)(result + 32) = a2;
  return result;
}

- (BOOL)cleanupForStoreDemoMode:(id *)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v5;
  if (v5)
  {
    v6 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cleanupForStoreDemoMode:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v7 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v6;

    os_activity_scope_enter(v6, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x2020000000;
  char v21 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__1622;
  v28 = __Block_byref_object_dispose__1623;
  id v29 = 0;
  BOOL v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke;
  v17[3] = &unk_1E58A17B8;
  v17[4] = &v18;
  v17[5] = &buf;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v17];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke_15;
  v16[3] = &unk_1E58A17E0;
  v16[4] = &v18;
  v16[5] = &buf;
  [v9 cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:v16];

  int v10 = *((unsigned __int8 *)v19 + 24);
  if (a3 && !*((unsigned char *)v19 + 24))
  {
    *a3 = *(id *)(*((void *)&buf + 1) + 40);
    int v10 = *((unsigned __int8 *)v19 + 24);
  }
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v18, 8);
  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    uint64_t v11 = PLRequestGetLog();
    os_signpost_id_t v12 = v11;
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

void __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDemoClient cleanupForStoreDemoMode:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __47__PLAssetsdDemoClient_cleanupForStoreDemoMode___block_invoke_15(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (void)cleanupForStoreDemoModeWithCompletion:(id)a3
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
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cleanupForStoreDemoModeWithCompletion:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    BOOL v8 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdDemoClient.m", 22, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  __int16 v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v24 = v5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_9;
  v16[3] = &unk_1EEBF5698;
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
      id v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdDemoClient cleanupForStoreDemoModeWithCompletion:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_9(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v15 = @"SignpostId";
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
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_12;
  v11[3] = &unk_1E58A1C18;
  id v12 = *(id *)(a1 + 32);
  [v3 cleanupForStoreDemoModeByStagingTemplateOrResettingLibrary:v11];
}

uint64_t __61__PLAssetsdDemoClient_cleanupForStoreDemoModeWithCompletion___block_invoke_12(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end