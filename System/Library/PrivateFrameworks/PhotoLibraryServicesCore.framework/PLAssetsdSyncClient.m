@interface PLAssetsdSyncClient
- (void)finalizeOTARestoreRecreatingAlbums:(BOOL)a3;
- (void)updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5;
@end

@implementation PLAssetsdSyncClient

- (void)updateRestoredAssetWithUUID:(id)a3 paths:(id)a4 fixAddedDate:(BOOL)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateRestoredAssetWithUUID:paths:fixAddedDate:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  v14 = [(PLAssetsdBaseClient *)self proxyFactory];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __70__PLAssetsdSyncClient_updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_7;
  v21[3] = &unk_1EEBF5030;
  char v24 = v30;
  id v25 = *((id *)&v30 + 1);
  long long v26 = v31;
  long long v27 = *(_OWORD *)sel;
  SEL v28 = a2;
  id v15 = v9;
  id v22 = v15;
  id v16 = v10;
  id v23 = v16;
  BOOL v29 = a5;
  [v14 remoteObjectProxyWithErrorHandler:&__block_literal_global_6_1057 handler:v21];

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    v17 = PLRequestGetLog();
    v18 = v17;
    os_signpost_id_t v19 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __70__PLAssetsdSyncClient_updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke_7(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v13 = @"SignpostId";
    v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      int v11 = 138543362;
      v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 updateRestoredAssetWithUUID:*(void *)(a1 + 32) paths:*(void *)(a1 + 40) fixAddedDate:*(unsigned __int8 *)(a1 + 104)];
}

void __70__PLAssetsdSyncClient_updateRestoredAssetWithUUID_paths_fixAddedDate___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdSyncClient updateRestoredAssetWithUUID:paths:fixAddedDate:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)finalizeOTARestoreRecreatingAlbums:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v22 = 0u;
  *(_OWORD *)sel = 0u;
  long long v21 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v21) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: finalizeOTARestoreRecreatingAlbums:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v21 + 1);
    *((void *)&v21 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v22 + 8));
  }
  id v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3254779904;
  void v14[2] = __58__PLAssetsdSyncClient_finalizeOTARestoreRecreatingAlbums___block_invoke_1;
  v14[3] = &__block_descriptor_89_e8_32n18_8_8_t0w1_s8_t16w32_e40_v16__0___PLAssetsdSyncServiceProtocol__8l;
  char v15 = v21;
  id v16 = *((id *)&v21 + 1);
  long long v17 = v22;
  long long v18 = *(_OWORD *)sel;
  SEL v19 = a2;
  BOOL v20 = a3;
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_1070 handler:v14];

  if ((_BYTE)v21) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v22 + 8));
  }
  if ((void)v22)
  {
    id v10 = PLRequestGetLog();
    int v11 = v10;
    os_signpost_id_t v12 = v22;
    if ((unint64_t)(v22 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v25 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v11, OS_SIGNPOST_INTERVAL_END, v12, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __58__PLAssetsdSyncClient_finalizeOTARestoreRecreatingAlbums___block_invoke_1(uint64_t a1, void *a2)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 32))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v13 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v14[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 80));
      int v11 = 138543362;
      os_signpost_id_t v12 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", (uint8_t *)&v11, 0xCu);
    }
  }
  [v3 finalizeOTARestoreRecreatingAlbums:*(unsigned __int8 *)(a1 + 88)];
}

void __58__PLAssetsdSyncClient_finalizeOTARestoreRecreatingAlbums___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    os_signpost_id_t v5 = "-[PLAssetsdSyncClient finalizeOTARestoreRecreatingAlbums:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end