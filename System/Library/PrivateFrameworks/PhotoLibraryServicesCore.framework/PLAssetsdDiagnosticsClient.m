@interface PLAssetsdDiagnosticsClient
- (BOOL)incompleteRestoreProcesses:(id *)a3 error:(id *)a4;
- (void)setPhotosXPCEndpoint:(id)a3 completionHandler:(id)a4;
@end

@implementation PLAssetsdDiagnosticsClient

- (void)setPhotosXPCEndpoint:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v37 = 0u;
  *(_OWORD *)sel = 0u;
  long long v36 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v36) = v9;
  if (v9)
  {
    v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setPhotosXPCEndpoint:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v11 = (void *)*((void *)&v36 + 1);
    *((void *)&v36 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v37 + 8));
  }
  v12 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v13 = os_signpost_id_generate(v12);
  *(void *)&long long v37 = v13;
  v14 = v12;
  v15 = v14;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v40 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  if (!v7)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdDiagnosticsClient.m", 44, @"Invalid parameter not satisfying: %@", @"endpoint" object file lineNumber description];
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F292A0]);
  [v17 _setEndpoint:v7];
  v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke;
  v34[3] = &unk_1E58A1BC8;
  id v35 = v8;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3254779904;
  v26[2] = __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_15;
  v26[3] = &unk_1EEBF4E38;
  char v29 = v36;
  id v30 = *((id *)&v36 + 1);
  long long v31 = v37;
  long long v32 = *(_OWORD *)sel;
  SEL v33 = a2;
  id v19 = v17;
  id v27 = v19;
  id v20 = v35;
  id v28 = v20;
  [v18 remoteObjectProxyWithErrorHandler:v34 handler:v26];

  if ((_BYTE)v36) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v37 + 8));
  }
  if ((void)v37)
  {
    v21 = PLRequestGetLog();
    v22 = v21;
    os_signpost_id_t v23 = v37;
    if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      v24 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v40 = v24;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_18(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Error setting photos XPC endpoint: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

void __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_15(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v16 = @"SignpostId";
    v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    int v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke_18;
  v12[3] = &unk_1E58A1C18;
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v3 setPhotosXPCEndpoint:v11 withReply:v12];
}

void __69__PLAssetsdDiagnosticsClient_setPhotosXPCEndpoint_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    uint64_t v7 = "-[PLAssetsdDiagnosticsClient setPhotosXPCEndpoint:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (BOOL)incompleteRestoreProcesses:(id *)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  long long v35 = 0u;
  *(_OWORD *)sel = 0u;
  long long v34 = 0u;
  BOOL v8 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: incompleteRestoreProcesses:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  uint64_t v11 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v12 = os_signpost_id_generate(v11);
  *(void *)&long long v35 = v12;
  id v13 = v11;
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
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdDiagnosticsClient.m", 23, @"Invalid parameter not satisfying: %@", @"processes" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__11803;
  v40 = __Block_byref_object_dispose__11804;
  id v41 = 0;
  uint64_t v28 = 0;
  char v29 = &v28;
  uint64_t v30 = 0x3032000000;
  long long v31 = __Block_byref_object_copy__11803;
  long long v32 = __Block_byref_object_dispose__11804;
  id v33 = 0;
  v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke;
  v27[3] = &unk_1E58A1C40;
  v27[4] = &buf;
  id v17 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v27];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke_9;
  v26[3] = &unk_1E58A1B28;
  void v26[4] = &v28;
  [v17 incompleteRestoreProcessesWithReply:v26];

  v18 = (void *)v29[5];
  if (v18 || a4 && (v18 = *(void **)(*((void *)&buf + 1) + 40), a3 = a4, v18)) {
    *a3 = v18;
  }
  uint64_t v19 = v29[5];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    id v20 = PLRequestGetLog();
    v21 = v20;
    os_signpost_id_t v22 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      os_signpost_id_t v23 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v23;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v21, OS_SIGNPOST_INTERVAL_END, v22, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v19 != 0;
}

void __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdDiagnosticsClient incompleteRestoreProcesses:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __63__PLAssetsdDiagnosticsClient_incompleteRestoreProcesses_error___block_invoke_9(uint64_t a1, void *a2)
{
}

@end