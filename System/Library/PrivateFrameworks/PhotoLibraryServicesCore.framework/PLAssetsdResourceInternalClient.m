@interface PLAssetsdResourceInternalClient
- (BOOL)cancelAllPrewarming:(id *)a3;
- (BOOL)handlePhotoKitIngestJobs:(id)a3 withCompletionHandler:(id)a4;
- (BOOL)prewarmWithCapturePhotoSettings:(id)a3 error:(id *)a4;
- (void)batchSaveAssetsWithJobDictionaries:(id)a3 completionHandler:(id)a4;
- (void)cancelAllPrewarming;
- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3;
- (void)prewarmWithCapturePhotoSettings:(id)a3;
- (void)prewarmWithCapturePhotoSettings:(id)a3 completionHandler:(id)a4;
- (void)requestMasterThumbnailForAssetUUID:(id)a3 completionHandler:(id)a4;
@end

@implementation PLAssetsdResourceInternalClient

- (void)prewarmWithCapturePhotoSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Sending prewarm with PLCapturePhotoSettings: %@", buf, 0xCu);
  }

  v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_25;
  v12[3] = &unk_1E58A1808;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 remoteObjectProxyWithErrorHandler:&__block_literal_global_10979 handler:v12];
}

void __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v9 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_DEBUG, "Sending PLCapturePhotoSettings over proxy: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_26;
  v6[3] = &unk_1E58A1C18;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  [v3 prewarmWithCapturePhotoSettings:v5 reply:v6];
}

- (void)cancelAllPrewarmingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Sending cancel all prewarming", buf, 2u);
  }

  id v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_30;
  v8[3] = &unk_1E58A1830;
  id v9 = v4;
  id v7 = v4;
  [v6 remoteObjectProxyWithErrorHandler:&__block_literal_global_29_10968 handler:v8];
}

void __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_30(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E58A1C18;
  id v4 = *(id *)(a1 + 32);
  [a2 cancelAllPrewarmingWithReply:v3];
}

void __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdResourceInternalClient cancelAllPrewarmingWithCompletionHandler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __76__PLAssetsdResourceInternalClient_cancelAllPrewarmingWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    __int16 v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      id v9 = "-[PLAssetsdResourceInternalClient cancelAllPrewarmingWithCompletionHandler:]_block_invoke_2";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (BOOL)cancelAllPrewarming:(id *)a3
{
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  char v24 = 1;
  uint64_t v15 = 0;
  id v16 = &v15;
  uint64_t v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__10973;
  v19 = __Block_byref_object_dispose__10974;
  id v20 = 0;
  id v5 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19BCFB000, v5, OS_LOG_TYPE_DEFAULT, "Sending cancel all prewarming", buf, 2u);
  }

  __int16 v6 = [(PLAssetsdBaseClient *)self proxyFactory];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke;
  v13[3] = &unk_1E58A17B8;
  v13[4] = &v21;
  v13[5] = &v15;
  uint64_t v7 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v13];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke_27;
  v12[3] = &unk_1E58A17E0;
  void v12[4] = &v21;
  v12[5] = &v15;
  [v7 cancelAllPrewarmingWithReply:v12];

  LODWORD(v7) = *((unsigned __int8 *)v22 + 24);
  id v8 = (id)v16[5];
  id v9 = v8;
  if (!v7 && a3) {
    *a3 = v8;
  }

  char v10 = *((unsigned char *)v22 + 24);
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

void __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdResourceInternalClient cancelAllPrewarming:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  __int16 v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __55__PLAssetsdResourceInternalClient_cancelAllPrewarming___block_invoke_27(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    int v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      __int16 v9 = "-[PLAssetsdResourceInternalClient cancelAllPrewarming:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)cancelAllPrewarming
{
}

void __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    uint64_t v5 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:completionHandler:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

void __85__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_completionHandler___block_invoke_26(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    __int16 v6 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      __int16 v9 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:completionHandler:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v5;
      _os_log_impl(&dword_19BCFB000, v6, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v5);
  }
}

- (BOOL)prewarmWithCapturePhotoSettings:(id)a3 error:(id *)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 1;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = __Block_byref_object_copy__10973;
  id v20 = __Block_byref_object_dispose__10974;
  id v21 = 0;
  uint64_t v7 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v6;
    _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_DEFAULT, "Sending prewarm with PLCapturePhotoSettings: %@", buf, 0xCu);
  }

  int v8 = [(PLAssetsdBaseClient *)self proxyFactory];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke;
  v15[3] = &unk_1E58A17B8;
  v15[4] = &v22;
  v15[5] = &v16;
  __int16 v9 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v15];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke_23;
  v14[3] = &unk_1E58A17E0;
  v14[4] = &v22;
  v14[5] = &v16;
  [v9 prewarmWithCapturePhotoSettings:v6 reply:v14];

  LODWORD(v9) = *((unsigned __int8 *)v23 + 24);
  id v10 = (id)v17[5];
  id v11 = v10;
  if (!v9 && a4) {
    *a4 = v10;
  }

  BOOL v12 = *((unsigned char *)v23 + 24) != 0;
  _Block_object_dispose(&v16, 8);

  _Block_object_dispose(&v22, 8);
  return v12;
}

void __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    int v8 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __73__PLAssetsdResourceInternalClient_prewarmWithCapturePhotoSettings_error___block_invoke_23(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    int v7 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v8 = 136315394;
      __int16 v9 = "-[PLAssetsdResourceInternalClient prewarmWithCapturePhotoSettings:error:]_block_invoke";
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_19BCFB000, v7, OS_LOG_TYPE_ERROR, "Error in reply for %s: %@", (uint8_t *)&v8, 0x16u);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 0;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
}

- (void)prewarmWithCapturePhotoSettings:(id)a3
{
}

- (BOOL)handlePhotoKitIngestJobs:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t, id, void *))a4;
  id v7 = objc_alloc_init(NSClassFromString((NSString *)@"PHAssetCreationRequestBridge"));
  int v8 = v7;
  if (v7)
  {
    __int16 v9 = [v7 executeCreationRequestWithBatchJobDictionaries:v5];
    uint64_t v10 = [v9 isSuccess];
    id v11 = [v9 error];
    v6[2](v6, v10, v5, v11);
  }
  return v8 != 0;
}

- (void)requestMasterThumbnailForAssetUUID:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v30 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v9;
  if (v9)
  {
    uint64_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: requestMasterThumbnailForAssetUUID:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if (!v8)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLAssetsdResourceInternalClient.m", 66, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke;
  v28[3] = &unk_1E58A1BC8;
  id v29 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3254779904;
  v20[2] = __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_2;
  v20[3] = &unk_1EEBF4EE0;
  char v23 = v30;
  id v24 = *((id *)&v30 + 1);
  long long v25 = v31;
  long long v26 = v32;
  SEL v27 = a2;
  id v13 = v7;
  id v21 = v13;
  id v14 = v29;
  id v22 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v28 handler:v20];

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    uint64_t v15 = PLRequestGetLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      *(_DWORD *)buf = 136446210;
      v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    os_signpost_id_t v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      uint64_t v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  id v11 = *(void **)(a1 + 32);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_18;
  v12[3] = &unk_1E58A1790;
  id v13 = v11;
  id v14 = *(id *)(a1 + 40);
  [v3 asynchronousMasterThumbnailForAssetUUID:v13 reply:v12];
}

void __88__PLAssetsdResourceInternalClient_requestMasterThumbnailForAssetUUID_completionHandler___block_invoke_18(uint64_t a1, char a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((a2 & 1) == 0)
  {
    BOOL v9 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412802;
      uint64_t v12 = v10;
      __int16 v13 = 2080;
      id v14 = "-[PLAssetsdResourceInternalClient requestMasterThumbnailForAssetUUID:completionHandler:]_block_invoke";
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_ERROR, "Error getting master thumbnail %@ for %s: %@", (uint8_t *)&v11, 0x20u);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)batchSaveAssetsWithJobDictionaries:(id)a3 completionHandler:(id)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v31 = a4;
  long long v47 = 0u;
  *(_OWORD *)sel = 0u;
  long long v46 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v46) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: batchSaveAssetsWithJobDictionaries:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v8 = (void *)*((void *)&v46 + 1);
    *((void *)&v46 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v47 + 8));
  }
  if (!v31)
  {
    SEL v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdResourceInternalClient.m", 30, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  context = (void *)MEMORY[0x19F38F510]();
  BOOL v9 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v5 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v50 = v10;
    _os_log_impl(&dword_19BCFB000, v9, OS_LOG_TYPE_DEFAULT, "Sending batchSaveAssetsWithJobDictionaries:completionHander: with %d jobs", buf, 8u);
  }

  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v11 = v5;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v12)
  {
    int v13 = 0;
    uint64_t v14 = *(void *)v43;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v43 != v14) {
          objc_enumerationMutation(v11);
        }
        id v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v17 = PLGatekeeperXPCGetLog();
        BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
        if (v13 >= 11)
        {
          if (v18)
          {
            int v21 = [v11 count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v50 = v21 - v13;
            _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_DEFAULT, "  [...and %d more]", buf, 8u);
          }

          goto LABEL_21;
        }
        if (v18)
        {
          v19 = [v16 objectForKeyedSubscript:@"JobType"];
          id v20 = [v16 objectForKeyedSubscript:@"CreatedAssetUUID"];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v50 = v13;
          *(_WORD *)&v50[4] = 2114;
          *(void *)&v50[6] = v19;
          __int16 v51 = 2114;
          v52 = v20;
          _os_log_impl(&dword_19BCFB000, v17, OS_LOG_TYPE_DEFAULT, "  [job-%d] type %{public}@ uuid %{public}@", buf, 0x1Cu);

          ++v13;
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v53 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  pl_dispatch_once(&PLIsCamera_didCheck, &__block_literal_global_83);
  if (!PLIsCamera_isCamera
    || !_os_feature_enabled_impl()
    || ![(PLAssetsdResourceInternalClient *)self handlePhotoKitIngestJobs:v11 withCompletionHandler:v31])
  {
    id v22 = [(PLAssetsdBaseClient *)self proxyFactory];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke;
    v40[3] = &unk_1E58A1BC8;
    id v41 = v31;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3254779904;
    v32[2] = __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_13;
    v32[3] = &unk_1EEBF4EE0;
    char v35 = v46;
    id v36 = *((id *)&v46 + 1);
    long long v37 = v47;
    long long v38 = *(_OWORD *)sel;
    SEL v39 = a2;
    id v33 = v11;
    id v34 = v41;
    [v22 remoteObjectProxyWithErrorHandler:v40 handler:v32];
  }
  if ((_BYTE)v46) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v47 + 8));
  }
  if ((void)v47)
  {
    char v23 = PLRequestGetLog();
    id v24 = v23;
    os_signpost_id_t v25 = v47;
    if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      *(void *)v50 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v11 = "-[PLAssetsdResourceInternalClient batchSaveAssetsWithJobDictionaries:completionHandler:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  id v9 = v3;
  BOOL v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v7 = [v5 errorWithDomain:@"com.apple.photos.error" code:41002 userInfo:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v16 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      int v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      __int16 v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_15;
  v12[3] = &unk_1E58A1998;
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v3 batchSaveAssetJobs:v11 reply:v12];
}

uint64_t __88__PLAssetsdResourceInternalClient_batchSaveAssetsWithJobDictionaries_completionHandler___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end