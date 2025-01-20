@interface PLAssetsdMigrationClient
- (void)cleanupModelForDataMigrationForRestoreType:(int64_t)a3;
- (void)dataMigrationWillFinish;
@end

@implementation PLAssetsdMigrationClient

- (void)dataMigrationWillFinish
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  *(_OWORD *)sel = 0u;
  long long v15 = 0u;
  BOOL v4 = +[PLXPCMessageLogger enabled];
  LOBYTE(v15) = v4;
  if (v4)
  {
    *((void *)&v15 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: dataMigrationWillFinish", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v15 + 1), (os_activity_scope_state_t)((char *)&v16 + 8));
  }
  v5 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v19 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v10 = [(PLAssetsdBaseClient *)self proxyFactory];
  v11 = [v10 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6_6586];
  [v11 dataMigrationWillFinishWithReply:&__block_literal_global_9_6587];

  if ((_BYTE)v15) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v16 + 8));
  }
  if (v6)
  {
    v12 = PLRequestGetLog();
    v13 = v12;
    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      v14 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v19 = v14;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v13, OS_SIGNPOST_INTERVAL_END, v6, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __51__PLAssetsdMigrationClient_dataMigrationWillFinish__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdMigrationClient dataMigrationWillFinish]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)cleanupModelForDataMigrationForRestoreType:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  *(_OWORD *)sel = 0u;
  long long v17 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v17) = v6;
  if (v6)
  {
    *((void *)&v17 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cleanupModelForDataMigrationForRestoreType:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v17 + 1), (os_activity_scope_state_t)((char *)&v18 + 8));
  }
  id v7 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    Name = sel_getName(sel[1]);
    *(_DWORD *)buf = 136446210;
    v21 = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
  }

  v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13 = [v12 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_6596];
  [v13 cleanupModelForDataMigrationForRestoreType:a3 reply:&__block_literal_global_4_6597];

  if ((_BYTE)v17) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v18 + 8));
  }
  if (v8)
  {
    v14 = PLRequestGetLog();
    long long v15 = v14;
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      long long v16 = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v21 = v16;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __71__PLAssetsdMigrationClient_cleanupModelForDataMigrationForRestoreType___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdMigrationClient cleanupModelForDataMigrationForRestoreType:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

@end