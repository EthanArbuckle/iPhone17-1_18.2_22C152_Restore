@interface PLAssetsdPrivacySupportClient
- (void)presentLimitedLibraryPickerRepromptWithCompletionHandler:(id)a3;
- (void)setClientPrivacyOptions:(id)a3;
@end

@implementation PLAssetsdPrivacySupportClient

- (void)setClientPrivacyOptions:(id)a3
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
    *((void *)&v11 + 1) = _os_activity_create(&dword_19BCFB000, "PLXPC Client: setClientPrivacyOptions:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v11 + 1), (os_activity_scope_state_t)((char *)&v13 + 8));
  }
  v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_11321];
  [v7 setClientPrivacyOptions:v4 reply:&__block_literal_global_9_11322];

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
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __57__PLAssetsdPrivacySupportClient_setClientPrivacyOptions___block_invoke_7(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error setting client privacy options (%@)", (uint8_t *)&v4, 0xCu);
  }
}

void __57__PLAssetsdPrivacySupportClient_setClientPrivacyOptions___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy (%@)", (uint8_t *)&v4, 0xCu);
  }
}

- (void)presentLimitedLibraryPickerRepromptWithCompletionHandler:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v24 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v24) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: presentLimitedLibraryPickerRepromptWithCompletionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((void *)&v24 + 1);
    *((void *)&v24 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v25 + 8));
  }
  v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __90__PLAssetsdPrivacySupportClient_presentLimitedLibraryPickerRepromptWithCompletionHandler___block_invoke;
  v22[3] = &unk_1E58A1BC8;
  id v23 = v5;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3254779904;
  v15[2] = __90__PLAssetsdPrivacySupportClient_presentLimitedLibraryPickerRepromptWithCompletionHandler___block_invoke_1;
  v15[3] = &unk_1EEBF5740;
  char v17 = v24;
  id v18 = *((id *)&v24 + 1);
  long long v19 = v25;
  long long v20 = v26;
  SEL v21 = a2;
  id v10 = v23;
  id v16 = v10;
  [v9 remoteObjectProxyWithErrorHandler:v22 handler:v15];

  if ((_BYTE)v24) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v25 + 8));
  }
  if ((void)v25)
  {
    long long v11 = PLRequestGetLog();
    char v12 = v11;
    os_signpost_id_t v13 = v25;
    if ((unint64_t)(v25 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      Name = sel_getName(*((SEL *)&v26 + 1));
      *(_DWORD *)buf = 136446210;
      v28 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v12, OS_SIGNPOST_INTERVAL_END, v13, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __90__PLAssetsdPrivacySupportClient_presentLimitedLibraryPickerRepromptWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 138412290;
    id v7 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy (%@)", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __90__PLAssetsdPrivacySupportClient_presentLimitedLibraryPickerRepromptWithCompletionHandler___block_invoke_1(uint64_t a1, void *a2)
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 40))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v15 = @"SignpostId";
    int v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v16[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 88));
      *(_DWORD *)buf = 138543362;
      v14 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __90__PLAssetsdPrivacySupportClient_presentLimitedLibraryPickerRepromptWithCompletionHandler___block_invoke_4;
  v11[3] = &unk_1E58A18F8;
  id v12 = *(id *)(a1 + 32);
  [v3 presentLimitedLibraryPickerReprompt:v11];
}

uint64_t __90__PLAssetsdPrivacySupportClient_presentLimitedLibraryPickerRepromptWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end