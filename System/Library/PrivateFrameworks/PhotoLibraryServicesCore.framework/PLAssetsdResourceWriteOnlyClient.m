@interface PLAssetsdResourceWriteOnlyClient
- (void)saveAssetWithJobDictionary:(id)a3 imageSurface:(__IOSurface *)a4 previewImageSurface:(__IOSurface *)a5 completionHandler:(id)a6;
@end

@implementation PLAssetsdResourceWriteOnlyClient

- (void)saveAssetWithJobDictionary:(id)a3 imageSurface:(__IOSurface *)a4 previewImageSurface:(__IOSurface *)a5 completionHandler:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v43 = 0u;
  BOOL v13 = +[PLXPCMessageLogger enabled];
  LOBYTE(v43) = v13;
  if (v13)
  {
    v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v15 = (void *)*((void *)&v43 + 1);
    *((void *)&v43 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v44 + 8));
  }
  if (!v12)
  {
    v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLAssetsdResourceWriteOnlyClient.m", 34, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v16 = (void *)MEMORY[0x19F38F510]();
  v17 = [v11 objectForKey:@"callStack"];
  if (v17)
  {
    v18 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSelector(a2);
      v19 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v19;
      __int16 v48 = 2112;
      v49 = v17;
      _os_log_impl(&dword_19BCFB000, v18, OS_LOG_TYPE_DEFAULT, "##### %@ %@", buf, 0x16u);
    }
    v20 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
    _PLJobLogDictionary(v11, 0, v20);
  }
  if (a4) {
    CFRetain(a4);
  }
  if (a5) {
    CFRetain(a5);
  }
  v21 = [(PLAssetsdBaseClient *)self proxyFactory];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke;
  v39[3] = &unk_1E58A1B70;
  v41 = a4;
  v42 = a5;
  id v40 = v12;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3254779904;
  v29[2] = __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_13;
  v29[3] = &unk_1EEBF5490;
  char v32 = v43;
  id v33 = *((id *)&v43 + 1);
  long long v34 = v44;
  long long v35 = v45;
  SEL v36 = a2;
  id v22 = v11;
  id v30 = v22;
  v37 = a4;
  v38 = a5;
  id v23 = v40;
  id v31 = v23;
  [v21 remoteObjectProxyWithErrorHandler:v39 handler:v29];

  if ((_BYTE)v43) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v44 + 8));
  }
  if ((void)v44)
  {
    v24 = PLRequestGetLog();
    v25 = v24;
    os_signpost_id_t v26 = v44;
    if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      Name = sel_getName(*((SEL *)&v45 + 1));
      *(_DWORD *)buf = 136446210;
      v47 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    v8 = "-[PLAssetsdResourceWriteOnlyClient saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandle"
         "r:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  v5 = (const void *)a1[5];
  v6 = (const void *)a1[6];
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_13(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v20 = @"SignpostId";
    v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v21[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    v8 = v4;
    __int16 v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      v19 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 112);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_16;
  v16[3] = &unk_1E58A1BA0;
  uint64_t v13 = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  [v3 saveAssetWithDataAndPorts:v13 imageSurface:v11 previewImageSurface:v12 reply:v16];
  v14 = *(const void **)(a1 + 104);
  v15 = *(const void **)(a1 + 112);
  if (v14) {
    CFRelease(v14);
  }
  if (v15) {
    CFRelease(v15);
  }
}

void __114__PLAssetsdResourceWriteOnlyClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_16(uint64_t a1, int a2, void *a3, int a4, int a5, void *a6)
{
  id v16 = a3;
  id v11 = a6;
  uint64_t v12 = *(void *)(a1 + 32);
  if (a2)
  {
    (*(void (**)(uint64_t, uint64_t, id, void))(v12 + 16))(v12, 1, v16, 0);
    goto LABEL_9;
  }
  if (a4)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 42001;
LABEL_7:
    v15 = [v13 errorWithDomain:@"com.apple.photos.error" code:v14 userInfo:0];
    (*(void (**)(uint64_t, void, void, void *))(v12 + 16))(v12, 0, 0, v15);

    goto LABEL_9;
  }
  if (a5)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v14 = 42002;
    goto LABEL_7;
  }
  (*(void (**)(uint64_t, void, void, id))(v12 + 16))(v12, 0, 0, v11);
LABEL_9:
}

@end