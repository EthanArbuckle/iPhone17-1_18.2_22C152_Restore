@interface PLAssetsdResourceAvailabilityClient
- (id)sendMakeResourceAvailableRequest:(id)a3 reply:(id)a4;
- (id)sendResourceRepairRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)sendResourceRepairRequestForAsset:(id)a3 errorCodes:(id)a4 reply:(id)a5;
- (id)sendVideoRequest:(id)a3 reply:(id)a4;
- (void)sendMakeResourceUnavailableRequest:(id)a3;
- (void)setSharedMemoryForCacheMetricsCollector:(id)a3;
@end

@implementation PLAssetsdResourceAvailabilityClient

- (void)setSharedMemoryForCacheMetricsCollector:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v24 = 0u;
  *(_OWORD *)sel = 0u;
  long long v23 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v23) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setSharedMemoryForCacheMetricsCollector:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((void *)&v23 + 1);
    *((void *)&v23 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if (!v5)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"PLAssetsdResourceAvailabilityClient.m", 66, @"Invalid parameter not satisfying: %@", @"sharedData" object file lineNumber description];
  }
  v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3254779904;
  v16[2] = __79__PLAssetsdResourceAvailabilityClient_setSharedMemoryForCacheMetricsCollector___block_invoke_16;
  v16[3] = &unk_1EEBF57E8;
  char v18 = v23;
  id v19 = *((id *)&v23 + 1);
  long long v20 = v24;
  long long v21 = *(_OWORD *)sel;
  SEL v22 = a2;
  id v10 = v5;
  id v17 = v10;
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_1674 handler:v16];

  if ((_BYTE)v23) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v24 + 8));
  }
  if ((void)v24)
  {
    v11 = PLRequestGetLog();
    v12 = v11;
    os_signpost_id_t v13 = v24;
    if ((unint64_t)(v24 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v27 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __79__PLAssetsdResourceAvailabilityClient_setSharedMemoryForCacheMetricsCollector___block_invoke_16(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      int v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 initializeSharedMemoryForCacheMetricsCollector:*(void *)(a1 + 32)];
}

void __79__PLAssetsdResourceAvailabilityClient_setSharedMemoryForCacheMetricsCollector___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdResourceAvailabilityClient setSharedMemoryForCacheMetricsCollector:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  v4 = PLCacheMetricsCollectorGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdResourceAvailabilityClient setSharedMemoryForCacheMetricsCollector:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v2;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }
}

- (id)sendResourceRepairRequestForAsset:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v28) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendResourceRepairRequestForAsset:errorCodes:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v13 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke;
  v26[3] = &unk_1E58A1BC8;
  id v15 = v10;
  id v27 = v15;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke_7;
  v24[3] = &unk_1E58A1C18;
  id v17 = v15;
  id v25 = v17;
  char v18 = [v16 appyCorrectionsToAssetWithRequest:v8 errorCodes:v9 reply:v24];

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    id v19 = PLRequestGetLog();
    long long v20 = v19;
    os_signpost_id_t v21 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v18;
}

void __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdResourceAvailabilityClient sendResourceRepairRequestForAsset:errorCodes:reply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __90__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequestForAsset_errorCodes_reply___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sendResourceRepairRequest:(id)a3 errorCodes:(id)a4 reply:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v28) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendResourceRepairRequest:errorCodes:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_signpost_id_t v13 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke;
  v26[3] = &unk_1E58A1BC8;
  id v15 = v10;
  id v27 = v15;
  v16 = [v14 remoteObjectProxyWithErrorHandler:v26];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke_5;
  v24[3] = &unk_1E58A1C18;
  id v17 = v15;
  id v25 = v17;
  char v18 = [v16 appyCorrectionsToResourceWithRequest:v8 errorCodes:v9 reply:v24];

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    id v19 = PLRequestGetLog();
    long long v20 = v19;
    os_signpost_id_t v21 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v18;
}

void __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdResourceAvailabilityClient sendResourceRepairRequest:errorCodes:reply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__PLAssetsdResourceAvailabilityClient_sendResourceRepairRequest_errorCodes_reply___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)sendVideoRequest:(id)a3 reply:(id)a4
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
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendVideoRequest:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  BOOL v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v12 = v7;
  id v24 = v12;
  os_signpost_id_t v13 = [v11 remoteObjectProxyWithErrorHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke_3;
  v21[3] = &unk_1E589F280;
  id v14 = v12;
  id v22 = v14;
  id v15 = [v13 runVideoRequest:v6 reply:v21];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    v16 = PLRequestGetLog();
    id v17 = v16;
    os_signpost_id_t v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v15;
}

void __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdResourceAvailabilityClient sendVideoRequest:reply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__PLAssetsdResourceAvailabilityClient_sendVideoRequest_reply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sendMakeResourceUnavailableRequest:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  *(_OWORD *)sel = 0u;
  long long v11 = 0u;
  BOOL v5 = +[PLXPCMessageLogger enabled];
  LOBYTE(v11) = v5;
  if (v5)
  {
    *((void *)&v11 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendMakeResourceUnavailableRequest:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  id v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  __int16 v7 = [v6 _unboostingRemoteObjectProxy];
  [v7 makeResourceUnavailableWithRequest:v4];

  if (v12) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v13 + 8));
  }
  if ((void)v13)
  {
    id v8 = PLRequestGetLog();
    uint64_t v9 = v8;
    if ((unint64_t)(v13 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v16 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (id)sendMakeResourceAvailableRequest:(id)a3 reply:(id)a4
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
    uint64_t v9 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sendMakeResourceAvailableRequest:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v25 + 1);
    *((void *)&v25 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  long long v11 = [(PLAssetsdBaseClient *)self proxyFactory];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke;
  v23[3] = &unk_1E58A1BC8;
  id v12 = v7;
  id v24 = v12;
  long long v13 = [v11 remoteObjectProxyWithErrorHandler:v23];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke_1;
  v21[3] = &unk_1E589F258;
  id v14 = v12;
  id v22 = v14;
  id v15 = [v13 makeResourceAvailableWithRequest:v6 reply:v21];

  if ((_BYTE)v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    v16 = PLRequestGetLog();
    uint64_t v17 = v16;
    os_signpost_id_t v18 = v26;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      long long v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v17, OS_SIGNPOST_INTERVAL_END, v18, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v15;
}

void __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdResourceAvailabilityClient sendMakeResourceAvailableRequest:reply:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __78__PLAssetsdResourceAvailabilityClient_sendMakeResourceAvailableRequest_reply___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end