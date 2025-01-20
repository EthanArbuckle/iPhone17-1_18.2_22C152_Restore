@interface PLAssetsdResourceClient
- (BOOL)estimatedOutputFileLengthForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6 outFileLength:(int64_t *)a7 error:(id *)a8;
- (BOOL)fileDescriptorForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileExtension:(id *)a5 fileDescriptor:(int *)a6 error:(id *)a7;
- (BOOL)fileURLForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileURL:(id *)a5 error:(id *)a6;
- (BOOL)imageDataForAsset:(id)a3 format:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 outImageData:(id *)a9 outImageDataInfo:(id *)a10 outCPLDownloadContext:(id *)a11 error:(id *)a12;
- (BOOL)sandboxExtensionFileURLForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileURL:(id *)a5 error:(id *)a6;
- (BOOL)sandboxExtensionForFileSystemBookmark:(id)a3 bookmarkURL:(id *)a4 sandboxExtensionToken:(id *)a5 error:(id *)a6;
- (BOOL)sandboxExtensionsForAssetWithUUID:(id)a3 sandboxExtensionTokens:(id *)a4 error:(id *)a5;
- (BOOL)updateInternalResourcePath:(id)a3 objectURI:(id)a4 error:(id *)a5;
- (PLAssetsdResourceClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5;
- (id)consolidateAssets:(id)a3 completionHandler:(id)a4;
- (id)projectExtensionDataForProjectUuid:(id)a3;
- (void)addAssetWithURL:(id)a3 toAlbumWithUUID:(id)a4 completionHandler:(id)a5;
- (void)addGroupWithName:(id)a3 completionHandler:(id)a4;
- (void)adjustmentDataForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 trackCPLDownload:(BOOL)a5 completionHandler:(id)a6;
- (void)downloadCloudSharedAsset:(id)a3 withCloudPlaceholderKind:(unint64_t)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6 completionHandler:(id)a7;
- (void)imageDataForAsset:(id)a3 format:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 completionHandler:(id)a9;
- (void)saveAssetWithJobDictionary:(id)a3 imageSurface:(__IOSurface *)a4 previewImageSurface:(__IOSurface *)a5 completionHandler:(id)a6;
@end

@implementation PLAssetsdResourceClient

- (void).cxx_destruct
{
}

- (id)projectExtensionDataForProjectUuid:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v23 = 0u;
  *(_OWORD *)sel = 0u;
  long long v22 = 0u;
  BOOL v6 = +[PLXPCMessageLogger enabled];
  LOBYTE(v22) = v6;
  if (v6)
  {
    v7 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: projectExtensionDataForProjectUuid:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v8 = (void *)*((void *)&v22 + 1);
    *((void *)&v22 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if (!v5)
  {
    v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 622, @"Invalid parameter not satisfying: %@", @"projectUuid" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v26 = 0x3032000000;
  v27 = __Block_byref_object_copy__11858;
  v28 = __Block_byref_object_dispose__11859;
  id v29 = 0;
  v9 = [(PLAssetsdBaseClient *)self proxyFactory];
  v10 = [v9 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_11860];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__PLAssetsdResourceClient_projectExtensionDataForProjectUuid___block_invoke_124;
  v19[3] = &unk_1E58A1E78;
  p_long long buf = &buf;
  id v11 = v5;
  id v20 = v11;
  [v10 projectExtensionDataForProjectUuid:v11 reply:v19];

  id v12 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v22) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v23 + 8));
  }
  if ((void)v23)
  {
    v13 = PLRequestGetLog();
    v14 = v13;
    os_signpost_id_t v15 = v23;
    if ((unint64_t)(v23 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v14, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v12;
}

void __62__PLAssetsdResourceClient_projectExtensionDataForProjectUuid___block_invoke_124(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  if (v7)
  {
    v8 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void *)(a1 + 32);
      v10 = [v7 localizedDescription];
      int v11 = 138412546;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      v14 = v10;
      _os_log_impl(&dword_19BCFB000, v8, OS_LOG_TYPE_DEFAULT, "Error getting projectExtensionDataForProjectUuid = %@: %@", (uint8_t *)&v11, 0x16u);
    }
  }
}

void __62__PLAssetsdResourceClient_projectExtensionDataForProjectUuid___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    id v5 = "-[PLAssetsdResourceClient projectExtensionDataForProjectUuid:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19BCFB000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (BOOL)updateInternalResourcePath:(id)a3 objectURI:(id)a4 error:(id *)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  long long v35 = 0u;
  *(_OWORD *)sel = 0u;
  long long v34 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v11;
  if (v11)
  {
    uint64_t v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: updateInternalResourcePath:objectURI:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    __int16 v13 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if (!v10)
  {
    uint64_t v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 581, @"Invalid parameter not satisfying: %@", @"resourceURI" object file lineNumber description];
  }
  if (!v9)
  {
    v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 582, @"Invalid parameter not satisfying: %@", @"path" object file lineNumber description];
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v40 = 0x3032000000;
  v41 = __Block_byref_object_copy__11858;
  v42 = __Block_byref_object_dispose__11859;
  id v43 = 0;
  v14 = PLGetSandboxExtensionTokenWithFlags(v9, *MEMORY[0x1E4F14000], *MEMORY[0x1E4F14120], 0);
  uint64_t v15 = v14;
  if (v14)
  {
    v16 = PLSandboxExtensionTokenAsData(v14);
    v17 = [(PLAssetsdBaseClient *)self proxyFactory];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke;
    v33[3] = &unk_1E58A1C40;
    v33[4] = &buf;
    v18 = [v17 synchronousRemoteObjectProxyWithErrorHandler:v33];
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke_120;
    v32[3] = &unk_1E58A1E50;
    v32[4] = &buf;
    [v18 updateInternalResourcePath:v9 objectURI:v10 sandboxExtension:v16 reply:v32];

    v19 = *(void **)(*((void *)&buf + 1) + 40);
    BOOL v20 = v19 == 0;
    if (a5 && v19) {
      *a5 = v19;
    }
  }
  else
  {
    v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v37 = *MEMORY[0x1E4F28328];
    id v38 = v9;
    long long v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v38 forKeys:&v37 count:1];
    uint64_t v23 = [v21 errorWithDomain:@"com.apple.photos.error" code:44004 userInfo:v22];
    v24 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v23;

    BOOL v20 = 0;
    if (a5) {
      *a5 = *(id *)(*((void *)&buf + 1) + 40);
    }
  }

  _Block_object_dispose(&buf, 8);
  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    v25 = PLRequestGetLog();
    uint64_t v26 = v25;
    os_signpost_id_t v27 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v20;
}

void __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    __int16 v13 = "-[PLAssetsdResourceClient updateInternalResourcePath:objectURI:error:]_block_invoke";
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v10 = *MEMORY[0x1E4F28A50];
  id v11 = v3;
  __int16 v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.photos.error" code:41002 userInfo:v6];
  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;
}

void __70__PLAssetsdResourceClient_updateInternalResourcePath_objectURI_error___block_invoke_120(uint64_t a1, char a2, void *a3)
{
  id v6 = a3;
  if ((a2 & 1) == 0)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a3);
    id v6 = v7;
  }
}

- (id)consolidateAssets:(id)a3 completionHandler:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v31 = 0u;
  *(_OWORD *)sel = 0u;
  long long v30 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v30) = v9;
  if (v9)
  {
    uint64_t v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: consolidateAssets:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v11 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if (!v7)
  {
    uint64_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 557, @"Invalid parameter not satisfying: %@", @"assetUUIDs" object file lineNumber description];
  }
  if (!v8)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 558, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1E00;
  id v13 = v7;
  id v28 = v13;
  id v14 = v8;
  id v29 = v14;
  id v15 = [v12 remoteObjectProxyWithErrorHandler:v27];

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke_112;
  v25[3] = &unk_1E58A1E28;
  id v16 = v14;
  id v26 = v16;
  v17 = [v15 consolidateAssets:v13 reply:v25];

  if ((_BYTE)v30) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if ((void)v31)
  {
    v18 = PLRequestGetLog();
    v19 = v18;
    os_signpost_id_t v20 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      long long v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v17;
}

void __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    v17 = "-[PLAssetsdResourceClient consolidateAssets:completionHandler:]_block_invoke";
    __int16 v18 = 2112;
    id v19 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = *(id *)(a1 + 32);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, *(void *)(*((void *)&v11 + 1) + 8 * v10++), (void)v11);
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __63__PLAssetsdResourceClient_consolidateAssets_completionHandler___block_invoke_112(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadCloudSharedAsset:(id)a3 withCloudPlaceholderKind:(unint64_t)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6 completionHandler:(id)a7
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a7;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v40 = 0u;
  BOOL v15 = +[PLXPCMessageLogger enabled];
  LOBYTE(v40) = v15;
  if (v15)
  {
    id v16 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: downloadCloudSharedAsset:withCloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v17 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v16;

    os_activity_scope_enter(v16, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if (!v13)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 537, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  __int16 v18 = [v13 URIRepresentation];
  id v19 = [(PLAssetsdBaseClient *)self proxyFactory];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke;
  v38[3] = &unk_1E58A1BC8;
  id v39 = v14;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3254779904;
  v27[2] = __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_103;
  v27[3] = &unk_1EEBF53B0;
  char v30 = v40;
  id v31 = *((id *)&v40 + 1);
  long long v32 = v41;
  long long v33 = v42;
  SEL v34 = a2;
  id v20 = v18;
  id v28 = v20;
  unint64_t v35 = a4;
  BOOL v36 = a5;
  BOOL v37 = a6;
  id v21 = v39;
  id v29 = v21;
  [v19 remoteObjectProxyWithErrorHandler:v38 handler:v27];

  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    long long v22 = PLRequestGetLog();
    uint64_t v23 = v22;
    os_signpost_id_t v24 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(*((SEL *)&v42 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v44 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    long long v11 = "-[PLAssetsdResourceClient downloadCloudSharedAsset:withCloudPlaceholderKind:shouldPrioritize:shouldExtendTimer"
          ":completionHandler:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  id v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  id v9 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  uint64_t v7 = [v5 errorWithDomain:@"com.apple.photos.error" code:41002 userInfo:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_103(uint64_t a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v19 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v20[0] = v6;
    uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      __int16 v18 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(__int16 *)(a1 + 104);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 112);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 113);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_104;
  v15[3] = &unk_1E58A1DD8;
  uint64_t v14 = *(void *)(a1 + 32);
  id v16 = *(id *)(a1 + 40);
  [v3 downloadCloudSharedAsset:v14 wantedPlaceholderkind:v11 shouldPrioritize:v12 shouldExtendTimer:v13 reply:v15];
}

uint64_t __130__PLAssetsdResourceClient_downloadCloudSharedAsset_withCloudPlaceholderKind_shouldPrioritize_shouldExtendTimer_completionHandler___block_invoke_104(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)estimatedOutputFileLengthForVideoURL:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6 outFileLength:(int64_t *)a7 error:(id *)a8
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  long long v47 = 0u;
  *(_OWORD *)sel = 0u;
  long long v46 = 0u;
  BOOL v19 = +[PLXPCMessageLogger enabled];
  LOBYTE(v46) = v19;
  if (v19)
  {
    id v20 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: estimatedOutputFileLengthForVideoURL:fallbackFilePath:exportPreset:exportProperties:outFileLength:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v21 = (void *)*((void *)&v46 + 1);
    *((void *)&v46 + 1) = v20;

    os_activity_scope_enter(v20, (os_activity_scope_state_t)((char *)&v47 + 8));
  }
  long long v22 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v23 = os_signpost_id_generate(v22);
  *(void *)&long long v47 = v23;
  os_signpost_id_t v24 = v22;
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v15)
  {
    BOOL v37 = [MEMORY[0x1E4F28B00] currentHandler];
    [v37 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 510, @"Invalid parameter not satisfying: %@", @"videoURL" object file lineNumber description];
  }
  if (!a7)
  {
    id v38 = [MEMORY[0x1E4F28B00] currentHandler];
    [v38 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 511, @"Invalid parameter not satisfying: %@", @"outFileLength" object file lineNumber description];
  }
  if (!a8)
  {
    id v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 512, @"Invalid parameter not satisfying: %@", @"error" object file lineNumber description];
  }
  uint64_t v42 = 0;
  id v43 = &v42;
  uint64_t v44 = 0x2020000000;
  uint64_t v45 = -1;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v50 = 0x3032000000;
  v51 = __Block_byref_object_copy__11858;
  v52 = __Block_byref_object_dispose__11859;
  id v53 = 0;
  os_signpost_id_t v27 = [(PLAssetsdBaseClient *)self proxyFactory];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke;
  v41[3] = &unk_1E58A1C40;
  v41[4] = &buf;
  id v28 = [v27 synchronousRemoteObjectProxyWithErrorHandler:v41];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke_101;
  v40[3] = &unk_1E58A1DB0;
  v40[4] = &v42;
  [v28 estimatedFileLengthOfVideo:v15 fallbackFilePath:v16 exportPreset:v17 exportProperties:v18 reply:v40];

  if (a7) {
    *a7 = v43[3];
  }
  uint64_t v29 = *((void *)&buf + 1);
  if (a8)
  {
    char v30 = *(void **)(*((void *)&buf + 1) + 40);
    if (v30)
    {
      *a8 = v30;
      uint64_t v29 = *((void *)&buf + 1);
    }
  }
  uint64_t v31 = *(void *)(v29 + 40);
  _Block_object_dispose(&buf, 8);

  _Block_object_dispose(&v42, 8);
  if ((_BYTE)v46) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v47 + 8));
  }
  if ((void)v47)
  {
    long long v32 = PLRequestGetLog();
    long long v33 = v32;
    os_signpost_id_t v34 = v47;
    if ((unint64_t)(v47 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      unint64_t v35 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v35;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, v34, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v31 == 0;
}

void __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdResourceClient estimatedOutputFileLengthForVideoURL:fallbackFilePath:exportPreset:exportProperties:o"
         "utFileLength:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

uint64_t __131__PLAssetsdResourceClient_estimatedOutputFileLengthForVideoURL_fallbackFilePath_exportPreset_exportProperties_outFileLength_error___block_invoke_101(uint64_t result, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2;
  return result;
}

- (void)adjustmentDataForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 trackCPLDownload:(BOOL)a5 completionHandler:(id)a6
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v36 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v36) = v12;
  if (v12)
  {
    uint64_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v14 = (void *)*((void *)&v36 + 1);
    *((void *)&v36 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v37 + 8));
  }
  if (!v10)
  {
    os_signpost_id_t v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 446, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  if (!v11)
  {
    os_signpost_id_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 447, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v15 = [v10 URIRepresentation];
  id v16 = [(PLAssetsdBaseClient *)self proxyFactory];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke;
  v34[3] = &unk_1E58A1BC8;
  id v35 = v11;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3254779904;
  v25[2] = __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_85;
  v25[3] = &unk_1EEBF4FC0;
  char v28 = v36;
  id v29 = *((id *)&v36 + 1);
  long long v30 = v37;
  long long v31 = v38;
  SEL v32 = a2;
  id v17 = v15;
  id v26 = v17;
  BOOL v33 = a4;
  id v18 = v35;
  id v27 = v18;
  [v16 remoteObjectProxyWithErrorHandler:v34 handler:v25];

  if ((_BYTE)v36) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v37 + 8));
  }
  if ((void)v37)
  {
    BOOL v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v37;
    if ((unint64_t)(v37 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v38 + 1));
      *(_DWORD *)long long buf = 136446210;
      long long v40 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdResourceClient adjustmentDataForAsset:networkAccessAllowed:trackCPLDownload:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_85(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v18 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v19[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(unsigned __int8 *)(a1 + 104);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_86;
  v13[3] = &unk_1E58A1D88;
  char v15 = v11;
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v3 asynchronousAdjustmentDataForAsset:v12 networkAccessAllowed:v11 reply:v13];
}

void __106__PLAssetsdResourceClient_adjustmentDataForAsset_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_86(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, uint64_t a6, void *a7, void *a8, void *a9)
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v14 = a2;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  if (v17)
  {
    id v20 = [v17 object];
    int v21 = xpc_fd_dup(v20);

    if ((v21 & 0x80000000) == 0)
    {
      long long v22 = dataWithMappedContentsOfFileDescriptor(v21);
      if (!v22)
      {
        v25 = 0;
LABEL_29:
        close(v21);

        goto LABEL_30;
      }
      id v39 = v18;
      id v42 = 0;
      os_signpost_id_t v23 = [MEMORY[0x1E4F28F98] propertyListWithData:v22 options:0 format:0 error:&v42];
      id v41 = v42;
      os_signpost_id_t v24 = [v23 objectForKeyedSubscript:@"adjustmentData"];
      v25 = v24;
      long long v40 = v23;
      if (!v23)
      {
        *(void *)long long v37 = v22;
        id v27 = PLGatekeeperXPCGetLog();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412290;
          id v44 = v41;
          _os_log_impl(&dword_19BCFB000, v27, OS_LOG_TYPE_ERROR, "Failed to serialize adjustments property list: %@", buf, 0xCu);
        }

        long long v22 = *(void **)v37;
        id v18 = v39;
        goto LABEL_28;
      }
      if (v24)
      {
        id v18 = v39;
        if (![v24 length])
        {
          *(void *)long long v36 = v22;
          id v26 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19BCFB000, v26, OS_LOG_TYPE_ERROR, "Adjustments property list contains an empty data blob", buf, 2u);
          }

          long long v22 = *(void **)v36;
        }
        goto LABEL_28;
      }
      id v18 = v39;
      if (v39)
      {
        char v28 = [v39 object];
        int v38 = xpc_fd_dup(v28);

        if ((v38 & 0x80000000) == 0)
        {
          v25 = dataWithMappedContentsOfFileDescriptor(v38);
          id v29 = PLGatekeeperXPCGetLog();
          os_log_t log = v29;
          if (v25)
          {
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              long long v30 = "Fetched adjustments data from file";
              long long v31 = log;
              os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
LABEL_26:
              _os_log_impl(&dword_19BCFB000, v31, v32, v30, buf, 2u);
            }
          }
          else if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            long long v30 = "Adjustments data file does not contain a data blob";
            long long v31 = log;
            os_log_type_t v32 = OS_LOG_TYPE_ERROR;
            goto LABEL_26;
          }

          close(v38);
          goto LABEL_28;
        }
      }
      else
      {
        BOOL v33 = PLGatekeeperXPCGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_19BCFB000, v33, OS_LOG_TYPE_ERROR, "Adjustments property list does not contain a data blob", buf, 2u);
        }
      }
      v25 = 0;
LABEL_28:

      goto LABEL_29;
    }
  }
  v25 = 0;
LABEL_30:
  os_signpost_id_t v34 = 0;
  if (v19 && *(unsigned char *)(a1 + 40))
  {
    os_signpost_id_t v34 = objc_alloc_init(PLCPLDownloadContext);
    [(PLCPLDownloadContext *)v34 setError:v19];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)sandboxExtensionForFileSystemBookmark:(id)a3 bookmarkURL:(id *)a4 sandboxExtensionToken:(id *)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v51) = v12;
  if (v12)
  {
    uint64_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sandboxExtensionForFileSystemBookmark:bookmarkURL:sandboxExtensionToken:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v51 + 1);
    *((void *)&v51 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v52 + 8));
  }
  id v15 = PLRequestGetLog();
  *((void *)&v53 + 1) = a2;
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  *(void *)&long long v52 = v16;
  id v17 = v15;
  id v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(*((SEL *)&v53 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v11)
  {
    long long v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 409, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  if (!a4)
  {
    long long v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 410, @"Invalid parameter not satisfying: %@", @"bookmarkURL" object file lineNumber description];
  }
  if (!a5)
  {
    os_log_type_t v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 411, @"Invalid parameter not satisfying: %@", @"token" object file lineNumber description];
  }
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  char v50 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__11858;
  v57 = __Block_byref_object_dispose__11859;
  id v58 = 0;
  uint64_t v41 = 0;
  id v42 = &v41;
  uint64_t v43 = 0x3032000000;
  id v44 = __Block_byref_object_copy__11858;
  uint64_t v45 = __Block_byref_object_dispose__11859;
  id v46 = 0;
  uint64_t v35 = 0;
  long long v36 = &v35;
  uint64_t v37 = 0x3032000000;
  int v38 = __Block_byref_object_copy__11858;
  id v39 = __Block_byref_object_dispose__11859;
  id v40 = 0;
  id v20 = [v11 URIRepresentation];
  int v21 = [(PLAssetsdBaseClient *)self proxyFactory];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke;
  v34[3] = &unk_1E58A1C40;
  void v34[4] = &buf;
  long long v22 = [v21 synchronousRemoteObjectProxyWithErrorHandler:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke_83;
  v33[3] = &unk_1E58A1D58;
  v33[4] = &v41;
  void v33[5] = &v35;
  v33[6] = &v47;
  v33[7] = &buf;
  [v22 getSandboxExtensionForFileSystemBookmark:v20 reply:v33];

  if (*((unsigned char *)v48 + 24))
  {
    *a5 = (id) v36[5];
    *a4 = (id) v42[5];
  }
  if (a6)
  {
    os_signpost_id_t v23 = *(void **)(*((void *)&buf + 1) + 40);
    if (v23) {
      *a6 = v23;
    }
  }
  int v24 = *((unsigned __int8 *)v48 + 24);

  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v41, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v47, 8);
  if ((_BYTE)v51) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v52 + 8));
  }
  if ((void)v52)
  {
    v25 = PLRequestGetLog();
    id v26 = v25;
    os_signpost_id_t v27 = v52;
    if ((unint64_t)(v52 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      char v28 = sel_getName(*((SEL *)&v53 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v28;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v24 != 0;
}

void __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdResourceClient sandboxExtensionForFileSystemBookmark:bookmarkURL:sandboxExtensionToken:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __105__PLAssetsdResourceClient_sandboxExtensionForFileSystemBookmark_bookmarkURL_sandboxExtensionToken_error___block_invoke_83(void *a1, int a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v10 = a4;
  id v11 = a5;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
    objc_storeStrong((id *)(*(void *)(a1[5] + 8) + 40), a4);
    *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[7] + 8) + 40), a5);
  }
}

- (BOOL)sandboxExtensionsForAssetWithUUID:(id)a3 sandboxExtensionTokens:(id *)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  long long v42 = 0u;
  *(_OWORD *)sel = 0u;
  long long v41 = 0u;
  BOOL v10 = +[PLXPCMessageLogger enabled];
  LOBYTE(v41) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v41 + 1);
    *((void *)&v41 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  uint64_t v13 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v14 = os_signpost_id_generate(v13);
  *(void *)&long long v42 = v14;
  id v15 = v13;
  os_signpost_id_t v16 = v15;
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v9)
  {
    os_signpost_id_t v27 = [MEMORY[0x1E4F28B00] currentHandler];
    [v27 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 377, @"Invalid parameter not satisfying: %@", @"assetUUID" object file lineNumber description];
  }
  if (!a4)
  {
    char v28 = [MEMORY[0x1E4F28B00] currentHandler];
    [v28 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 378, @"Invalid parameter not satisfying: %@", @"pathToTokenMap" object file lineNumber description];
  }
  uint64_t v37 = 0;
  int v38 = &v37;
  uint64_t v39 = 0x2020000000;
  char v40 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x3032000000;
  id v46 = __Block_byref_object_copy__11858;
  uint64_t v47 = __Block_byref_object_dispose__11859;
  id v48 = 0;
  uint64_t v31 = 0;
  os_log_type_t v32 = &v31;
  uint64_t v33 = 0x3032000000;
  os_signpost_id_t v34 = __Block_byref_object_copy__11858;
  uint64_t v35 = __Block_byref_object_dispose__11859;
  id v36 = 0;
  id v18 = [(PLAssetsdBaseClient *)self proxyFactory];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke;
  v30[3] = &unk_1E58A1C40;
  v30[4] = &buf;
  id v19 = [v18 synchronousRemoteObjectProxyWithErrorHandler:v30];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke_72;
  v29[3] = &unk_1E58A1D30;
  v29[4] = &v31;
  v29[5] = &v37;
  v29[6] = &buf;
  [v19 getSandboxExtensionsForAssetWithUUID:v9 reply:v29];

  if (*((unsigned char *)v38 + 24)) {
    *a4 = (id) v32[5];
  }
  if (a5)
  {
    id v20 = *(void **)(*((void *)&buf + 1) + 40);
    if (v20) {
      *a5 = v20;
    }
  }
  int v21 = *((unsigned __int8 *)v38 + 24);
  _Block_object_dispose(&v31, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v37, 8);
  if ((_BYTE)v41) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if ((void)v42)
  {
    long long v22 = PLRequestGetLog();
    os_signpost_id_t v23 = v22;
    os_signpost_id_t v24 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      v25 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v25;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v21 != 0;
}

void __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdResourceClient sandboxExtensionsForAssetWithUUID:sandboxExtensionTokens:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __90__PLAssetsdResourceClient_sandboxExtensionsForAssetWithUUID_sandboxExtensionTokens_error___block_invoke_72(void *a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
}

- (void)imageDataForAsset:(id)a3 format:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 completionHandler:(id)a9
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a9;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v44 = 0u;
  BOOL v18 = +[PLXPCMessageLogger enabled];
  LOBYTE(v44) = v18;
  if (v18)
  {
    id v19 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v20 = (void *)*((void *)&v44 + 1);
    *((void *)&v44 + 1) = v19;

    os_activity_scope_enter(v19, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  int v21 = [v16 URIRepresentation];
  long long v22 = [(PLAssetsdBaseClient *)self proxyFactory];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke;
  v42[3] = &unk_1E58A1BC8;
  id v43 = v17;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3254779904;
  v29[2] = __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_61;
  v29[3] = &unk_1EEBF5148;
  char v32 = v44;
  id v33 = *((id *)&v44 + 1);
  long long v34 = v45;
  long long v35 = v46;
  SEL v36 = a2;
  id v23 = v21;
  id v30 = v23;
  int v37 = a4;
  BOOL v38 = a5;
  BOOL v39 = a6;
  BOOL v40 = a7;
  BOOL v41 = a8;
  id v24 = v43;
  id v31 = v24;
  [v22 remoteObjectProxyWithErrorHandler:v42 handler:v29];

  if ((_BYTE)v44) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  }
  if ((void)v45)
  {
    v25 = PLRequestGetLog();
    id v26 = v25;
    os_signpost_id_t v27 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
    {
      Name = sel_getName(*((SEL *)&v46 + 1));
      *(_DWORD *)long long buf = 136446210;
      id v48 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v26, OS_SIGNPOST_INTERVAL_END, v27, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    id v6 = "-[PLAssetsdResourceClient imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDo"
         "wnload:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_61(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v23 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v24[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      long long v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(unsigned __int16 *)(a1 + 104);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 108);
  uint64_t v13 = *(unsigned __int8 *)(a1 + 109);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 110);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 111);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_62;
  v17[3] = &unk_1E58A1D08;
  char v19 = v14;
  char v20 = v15;
  uint64_t v16 = *(void *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  [v3 imageDataForAssetWithObjectURI:v16 formatID:v11 allowPlaceholder:v12 wantURLOnly:v13 networkAccessAllowed:v14 trackCPLDownload:v15 reply:v17];
}

void __137__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_completionHandler___block_invoke_62(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  id v34 = a2;
  unint64_t v33 = a10;
  id v32 = a11;
  unint64_t v31 = a12;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a3;
  id v23 = objc_alloc_init(PLImageDataInfo);
  [(PLImageDataInfo *)v23 setDeliveredFormat:a4];
  [(PLImageDataInfo *)v23 setCanDownloadFromCloud:a5];
  [(PLImageDataInfo *)v23 setURL:v21];

  [(PLImageDataInfo *)v23 setSandboxExtensionToken:v20];
  [(PLImageDataInfo *)v23 setUTI:v19];

  [(PLImageDataInfo *)v23 setEXIFOrientation:a9];
  if (*(unsigned char *)(a1 + 40) && *(unsigned char *)(a1 + 41))
  {
    v25 = v32;
    id v24 = (void *)v33;
    id v26 = (void *)v31;
    if (v33 | v31)
    {
      os_signpost_id_t v27 = objc_alloc_init(PLCPLDownloadContext);
      [(PLCPLDownloadContext *)v27 setTaskIdentifier:v33];
      [(PLCPLDownloadContext *)v27 setResourceTypeDescription:v32];
      [(PLCPLDownloadContext *)v27 setError:v31];
    }
    else
    {
      os_signpost_id_t v27 = 0;
    }
  }
  else
  {
    os_signpost_id_t v27 = 0;
    v25 = v32;
    id v24 = (void *)v33;
    id v26 = (void *)v31;
  }
  char v28 = [v34 object];
  uint64_t v29 = [v22 longLongValue];

  id v30 = PLDataFromXPCDataObject(v28, v29);

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)imageDataForAsset:(id)a3 format:(int)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 outImageData:(id *)a9 outImageDataInfo:(id *)a10 outCPLDownloadContext:(id *)a11 error:(id *)a12
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  unsigned __int16 v44 = a4;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v59 = 0u;
  BOOL v19 = +[PLXPCMessageLogger enabled];
  LOBYTE(v59) = v19;
  if (v19)
  {
    id v20 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:outImageData:outImageDataInfo:outCPLDownloadContext:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v21 = (void *)*((void *)&v59 + 1);
    *((void *)&v59 + 1) = v20;

    os_activity_scope_enter(v20, (os_activity_scope_state_t)((char *)&v60 + 8));
  }
  id v22 = PLRequestGetLog();
  *((void *)&v61 + 1) = a2;
  os_signpost_id_t v23 = os_signpost_id_generate(v22);
  *(void *)&long long v60 = v23;
  id v24 = v22;
  v25 = v24;
  if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    Name = sel_getName(*((SEL *)&v61 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }
  BOOL v43 = v15;

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v63 = 0x3032000000;
  v64 = __Block_byref_object_copy__11858;
  v65 = __Block_byref_object_dispose__11859;
  id v66 = 0;
  os_signpost_id_t v27 = [v18 URIRepresentation];
  BOOL v42 = v14;
  uint64_t v53 = 0;
  uint64_t v54 = &v53;
  uint64_t v55 = 0x3032000000;
  v56 = __Block_byref_object_copy__11858;
  v57 = __Block_byref_object_dispose__11859;
  id v58 = 0;
  if (a10) {
    char v28 = objc_alloc_init(PLImageDataInfo);
  }
  else {
    char v28 = 0;
  }
  if (a11) {
    uint64_t v29 = objc_alloc_init(PLCPLDownloadContext);
  }
  else {
    uint64_t v29 = 0;
  }
  id v30 = [(PLAssetsdBaseClient *)self proxyFactory];
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke;
  v52[3] = &unk_1E58A1C40;
  v52[4] = &buf;
  unint64_t v31 = [v30 synchronousRemoteObjectProxyWithErrorHandler:v52];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke_59;
  v45[3] = &unk_1E58A1CE0;
  id v32 = v28;
  long long v46 = v32;
  unint64_t v33 = v29;
  BOOL v49 = a7;
  BOOL v50 = a8;
  BOOL v51 = a9 != 0;
  uint64_t v47 = v33;
  id v48 = &v53;
  objc_msgSend(v31, "imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:", v27, v44, v43, v42, v45);

  if (!*(void *)(*((void *)&buf + 1) + 40))
  {
    if (a9) {
      *a9 = (id) v54[5];
    }
    if (a10) {
      *a10 = v32;
    }
    if (a11) {
      *a11 = v33;
    }
  }
  uint64_t v34 = *((void *)&buf + 1);
  if (a12)
  {
    long long v35 = *(void **)(*((void *)&buf + 1) + 40);
    if (v35)
    {
      *a12 = v35;
      uint64_t v34 = *((void *)&buf + 1);
    }
  }
  uint64_t v36 = *(void *)(v34 + 40);

  _Block_object_dispose(&v53, 8);
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v59) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v60 + 8));
  }
  if ((void)v60)
  {
    int v37 = PLRequestGetLog();
    BOOL v38 = v37;
    os_signpost_id_t v39 = v60;
    if ((unint64_t)(v60 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
    {
      BOOL v40 = sel_getName(*((SEL *)&v61 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v40;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v38, OS_SIGNPOST_INTERVAL_END, v39, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v36 == 0;
}

void __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdResourceClient imageDataForAsset:format:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDo"
         "wnload:outImageData:outImageDataInfo:outCPLDownloadContext:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __177__PLAssetsdResourceClient_imageDataForAsset_format_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_outImageData_outImageDataInfo_outCPLDownloadContext_error___block_invoke_59(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, void *a6, void *a7, void *a8, uint64_t a9, void *a10, void *a11, void *a12)
{
  id v32 = a2;
  id v31 = a3;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  unint64_t v22 = a10;
  id v23 = a11;
  unint64_t v24 = a12;
  v25 = *(void **)(a1 + 32);
  if (v25)
  {
    [v25 setDeliveredFormat:a4];
    [*(id *)(a1 + 32) setCanDownloadFromCloud:a5];
    [*(id *)(a1 + 32) setURL:v19];
    [*(id *)(a1 + 32) setSandboxExtensionToken:v20];
    [*(id *)(a1 + 32) setUTI:v21];
    [*(id *)(a1 + 32) setEXIFOrientation:a9];
  }
  id v26 = *(void **)(a1 + 40);
  if (v26 && *(unsigned char *)(a1 + 56) && *(unsigned char *)(a1 + 57) && v22 | v24)
  {
    [v26 setTaskIdentifier:v22];
    [*(id *)(a1 + 40) setResourceTypeDescription:v23];
    [*(id *)(a1 + 40) setError:v24];
  }
  if (*(unsigned char *)(a1 + 58))
  {
    os_signpost_id_t v27 = [v32 object];
    uint64_t v28 = PLDataFromXPCDataObject(v27, [v31 longLongValue]);
    uint64_t v29 = *(void *)(*(void *)(a1 + 48) + 8);
    id v30 = *(void **)(v29 + 40);
    *(void *)(v29 + 40) = v28;
  }
}

- (BOOL)fileDescriptorForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileExtension:(id *)a5 fileDescriptor:(int *)a6 error:(id *)a7
{
  BOOL v10 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v45 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v45) = v14;
  if (v14)
  {
    BOOL v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: fileDescriptorForAssetURL:withAdjustments:fileExtension:fileDescriptor:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v16 = (void *)*((void *)&v45 + 1);
    *((void *)&v45 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v46 + 8));
  }
  id v17 = PLRequestGetLog();
  *((void *)&v47 + 1) = a2;
  os_signpost_id_t v18 = os_signpost_id_generate(v17);
  *(void *)&long long v46 = v18;
  id v19 = v17;
  id v20 = v19;
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    Name = sel_getName(*((SEL *)&v47 + 1));
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_BEGIN, v18, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v13)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 256, @"Invalid parameter not satisfying: %@", @"assetURL" object file lineNumber description];
  }
  if (!a6)
  {
    id v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 257, @"Invalid parameter not satisfying: %@", @"outFileDescriptor" object file lineNumber description];
  }
  uint64_t v41 = 0;
  BOOL v42 = &v41;
  uint64_t v43 = 0x2020000000;
  char v44 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v49 = 0x3032000000;
  BOOL v50 = __Block_byref_object_copy__11858;
  BOOL v51 = __Block_byref_object_dispose__11859;
  id v52 = 0;
  uint64_t v35 = 0;
  uint64_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  BOOL v38 = __Block_byref_object_copy__11858;
  os_signpost_id_t v39 = __Block_byref_object_dispose__11859;
  id v40 = 0;
  unint64_t v22 = [(PLAssetsdBaseClient *)self proxyFactory];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke;
  v34[3] = &unk_1E58A1C40;
  void v34[4] = &buf;
  id v23 = [v22 synchronousRemoteObjectProxyWithErrorHandler:v34];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke_55;
  v33[3] = &unk_1E58A1CB8;
  v33[4] = &v35;
  void v33[5] = &v41;
  v33[6] = &buf;
  v33[7] = a6;
  [v23 fileDescriptorForPersistentURL:v13 withAdjustments:v10 reply:v33];

  if (a5 && *((unsigned char *)v42 + 24)) {
    *a5 = (id) v36[5];
  }
  if (a7)
  {
    unint64_t v24 = *(void **)(*((void *)&buf + 1) + 40);
    if (v24) {
      *a7 = v24;
    }
  }
  int v25 = *((unsigned __int8 *)v42 + 24);
  _Block_object_dispose(&v35, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v41, 8);
  if ((_BYTE)v45) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v46 + 8));
  }
  if ((void)v46)
  {
    id v26 = PLRequestGetLog();
    os_signpost_id_t v27 = v26;
    os_signpost_id_t v28 = v46;
    if ((unint64_t)(v46 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      uint64_t v29 = sel_getName(*((SEL *)&v47 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v29;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v25 != 0;
}

void __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    id v8 = "-[PLAssetsdResourceClient fileDescriptorForAssetURL:withAdjustments:fileExtension:fileDescriptor:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __104__PLAssetsdResourceClient_fileDescriptorForAssetURL_withAdjustments_fileExtension_fileDescriptor_error___block_invoke_55(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v15 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (a2)
  {
    uint64_t v12 = [a3 object];
    **(_DWORD **)(a1 + 56) = xpc_fd_dup(v12);
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a4);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
    id v14 = v10;
    uint64_t v12 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v14;
  }
}

- (BOOL)sandboxExtensionFileURLForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileURL:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v44 = 0u;
  *(_OWORD *)sel = 0u;
  long long v43 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v43) = v12;
  if (v12)
  {
    uint64_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: sandboxExtensionFileURLForAssetURL:withAdjustments:fileURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v43 + 1);
    *((void *)&v43 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v44 + 8));
  }
  id v15 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  *(void *)&long long v44 = v16;
  id v17 = v15;
  os_signpost_id_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v8)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 222, @"Invalid parameter not satisfying: %@", @"withAdjustments" object file lineNumber description];
  }
  if (!a5)
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 223, @"Invalid parameter not satisfying: %@", @"outFileURL" object file lineNumber description];
  }
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__11858;
  uint64_t v49 = __Block_byref_object_dispose__11859;
  id v50 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__11858;
  uint64_t v37 = __Block_byref_object_dispose__11859;
  id v38 = 0;
  id v20 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke;
  v32[3] = &unk_1E58A1C40;
  v32[4] = &buf;
  id v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_49;
  v31[3] = &unk_1E58A1C90;
  v31[4] = &v33;
  v31[5] = &v39;
  v31[6] = &buf;
  [v21 sandboxExtensionURLForPersistentURL:v11 withAdjustments:v8 reply:v31];

  if (*((unsigned char *)v40 + 24)) {
    *a5 = (id) v34[5];
  }
  if (a6)
  {
    unint64_t v22 = *(void **)(*((void *)&buf + 1) + 40);
    if (v22) {
      *a6 = v22;
    }
  }
  int v23 = *((unsigned __int8 *)v40 + 24);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v39, 8);
  if ((_BYTE)v43) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v44 + 8));
  }
  if ((void)v44)
  {
    unint64_t v24 = PLRequestGetLog();
    int v25 = v24;
    os_signpost_id_t v26 = v44;
    if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      os_signpost_id_t v27 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v27;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v23 != 0;
}

void __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdResourceClient sandboxExtensionFileURLForAssetURL:withAdjustments:fileURL:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __92__PLAssetsdResourceClient_sandboxExtensionFileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_49(void *a1, int a2, void *a3, void *a4, void *a5)
{
  id v15 = a4;
  id v9 = a5;
  if (a2)
  {
    id v10 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v11 = [a3 path];
    uint64_t v12 = [v10 fileURLWithPath:v11];
    uint64_t v13 = *(void *)(a1[4] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    MEMORY[0x19F38EE60](*(void *)(*(void *)(a1[4] + 8) + 40), v15);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a5);
  }
}

- (BOOL)fileURLForAssetURL:(id)a3 withAdjustments:(BOOL)a4 fileURL:(id *)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  long long v44 = 0u;
  *(_OWORD *)sel = 0u;
  long long v43 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v43) = v12;
  if (v12)
  {
    uint64_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: fileURLForAssetURL:withAdjustments:fileURL:error:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v43 + 1);
    *((void *)&v43 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v44 + 8));
  }
  id v15 = PLRequestGetLog();
  sel[1] = a2;
  os_signpost_id_t v16 = os_signpost_id_generate(v15);
  *(void *)&long long v44 = v16;
  id v17 = v15;
  os_signpost_id_t v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    Name = sel_getName(sel[1]);
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = Name;
    _os_signpost_emit_with_name_impl(&dword_19BCFB000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
  }

  if (!v8)
  {
    uint64_t v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 190, @"Invalid parameter not satisfying: %@", @"withAdjustments" object file lineNumber description];
  }
  if (!a5)
  {
    id v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 191, @"Invalid parameter not satisfying: %@", @"outFileURL" object file lineNumber description];
  }
  uint64_t v39 = 0;
  id v40 = &v39;
  uint64_t v41 = 0x2020000000;
  char v42 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v47 = 0x3032000000;
  id v48 = __Block_byref_object_copy__11858;
  uint64_t v49 = __Block_byref_object_dispose__11859;
  id v50 = 0;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x3032000000;
  uint64_t v36 = __Block_byref_object_copy__11858;
  uint64_t v37 = __Block_byref_object_dispose__11859;
  id v38 = 0;
  id v20 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke;
  v32[3] = &unk_1E58A1C40;
  v32[4] = &buf;
  id v21 = [v20 synchronousRemoteObjectProxyWithErrorHandler:v32];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_47;
  v31[3] = &unk_1E58A1C68;
  v31[4] = &v33;
  v31[5] = &v39;
  v31[6] = &buf;
  [v21 filePathForPersistentURL:v11 withAdjustments:v8 reply:v31];

  if (*((unsigned char *)v40 + 24)) {
    *a5 = (id) v34[5];
  }
  if (a6)
  {
    unint64_t v22 = *(void **)(*((void *)&buf + 1) + 40);
    if (v22) {
      *a6 = v22;
    }
  }
  int v23 = *((unsigned __int8 *)v40 + 24);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v39, 8);
  if ((_BYTE)v43) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v44 + 8));
  }
  if ((void)v44)
  {
    unint64_t v24 = PLRequestGetLog();
    int v25 = v24;
    os_signpost_id_t v26 = v44;
    if ((unint64_t)(v44 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      os_signpost_id_t v27 = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = v27;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v25, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
  return v23 != 0;
}

void __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    BOOL v8 = "-[PLAssetsdResourceClient fileURLForAssetURL:withAdjustments:fileURL:error:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

void __76__PLAssetsdResourceClient_fileURLForAssetURL_withAdjustments_fileURL_error___block_invoke_47(void *a1, int a2, void *a3, void *a4)
{
  id v9 = a3;
  id v8 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(a1[4] + 8) + 40), a3);
    *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = 1;
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a4);
  }
}

- (void)addAssetWithURL:(id)a3 toAlbumWithUUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v37 = 0u;
  BOOL v12 = +[PLXPCMessageLogger enabled];
  LOBYTE(v37) = v12;
  if (v12)
  {
    uint64_t v13 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: addAssetWithURL:toAlbumWithUUID:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v14 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v13;

    os_activity_scope_enter(v13, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if (!v9)
  {
    int v23 = [MEMORY[0x1E4F28B00] currentHandler];
    [v23 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 167, @"Invalid parameter not satisfying: %@", @"assetURL" object file lineNumber description];
  }
  if (!v10)
  {
    unint64_t v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 168, @"Invalid parameter not satisfying: %@", @"albumUUID" object file lineNumber description];
  }
  if (!v11)
  {
    int v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 169, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke;
  v35[3] = &unk_1E58A1BC8;
  id v36 = v11;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3254779904;
  v26[2] = __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_37;
  v26[3] = &unk_1EEBF5260;
  char v30 = v37;
  id v31 = *((id *)&v37 + 1);
  long long v32 = v38;
  long long v33 = v39;
  SEL v34 = a2;
  id v16 = v9;
  id v27 = v16;
  id v17 = v10;
  id v28 = v17;
  id v18 = v36;
  id v29 = v18;
  [v15 remoteObjectProxyWithErrorHandler:v35 handler:v26];

  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    id v19 = PLRequestGetLog();
    id v20 = v19;
    os_signpost_id_t v21 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(*((SEL *)&v39 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v41 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v20, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v11 = "-[PLAssetsdResourceClient addAssetWithURL:toAlbumWithUUID:completionHandler:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  id v9 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  int v7 = [v5 errorWithDomain:@"com.apple.photos.error" code:41002 userInfo:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_37(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v17 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)long long buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_38;
  v13[3] = &unk_1E58A1C18;
  id v14 = *(id *)(a1 + 48);
  [v3 addAssetWithURL:v11 toAlbum:v12 reply:v13];
}

uint64_t __77__PLAssetsdResourceClient_addAssetWithURL_toAlbumWithUUID_completionHandler___block_invoke_38(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addGroupWithName:(id)a3 completionHandler:(id)a4
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
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: addGroupWithName:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v30 + 1);
    *((void *)&v30 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v31 + 8));
  }
  if (!v8)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 139, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  uint64_t v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke;
  v28[3] = &unk_1E58A1BC8;
  id v29 = v8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3254779904;
  void v20[2] = __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_25;
  v20[3] = &unk_1EEBF4E00;
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
    id v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v31;
    if ((unint64_t)(v31 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v32 + 1));
      *(_DWORD *)long long buf = 136446210;
      SEL v34 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    uint64_t v11 = "-[PLAssetsdResourceClient addGroupWithName:completionHandler:]_block_invoke";
    __int16 v12 = 2112;
    id v13 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", buf, 0x16u);
  }

  os_signpost_id_t v5 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v8 = *MEMORY[0x1E4F28A50];
  id v9 = v3;
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v9 forKeys:&v8 count:1];
  id v7 = [v5 errorWithDomain:@"com.apple.photos.error" code:41002 userInfo:v6];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_25(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v16 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      id v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_26;
  v12[3] = &unk_1E58A1BF0;
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v3 addAssetGroupWithName:v11 reply:v12];
}

void __62__PLAssetsdResourceClient_addGroupWithName_completionHandler___block_invoke_26(uint64_t a1, char a2, void *a3)
{
  os_signpost_id_t v5 = 0;
  id v6 = a3;
  if (!v6 && (a2 & 1) == 0)
  {
    os_signpost_id_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.photos.error" code:41007 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveAssetWithJobDictionary:(id)a3 imageSurface:(__IOSurface *)a4 previewImageSurface:(__IOSurface *)a5 completionHandler:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v51 = 0u;
  BOOL v13 = +[PLXPCMessageLogger enabled];
  LOBYTE(v51) = v13;
  if (v13)
  {
    uint64_t v14 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v15 = (void *)*((void *)&v51 + 1);
    *((void *)&v51 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v52 + 8));
  }
  if (!v12)
  {
    id v36 = [MEMORY[0x1E4F28B00] currentHandler];
    [v36 handleFailureInMethod:a2, self, @"PLAssetsdResourceClient.m", 83, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v16 = (void *)MEMORY[0x19F38F510]();
  os_signpost_id_t v17 = [v11 objectForKeyedSubscript:@"kPLImageWriterPhotoIrisMediaGroupUUID"];
  if (v17)
  {
    id v18 = [v11 objectForKeyedSubscript:@"JobType"];
    char v19 = [v18 isEqualToString:@"VideoJob"];
  }
  else
  {
    char v19 = 0;
  }

  creationRequestBridge = self->_creationRequestBridge;
  if (creationRequestBridge) {
    char v21 = v19;
  }
  else {
    char v21 = 1;
  }
  if (v21)
  {
    id v22 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      char v23 = [v11 objectForKeyedSubscript:@"JobType"];
      id v24 = [v11 objectForKeyedSubscript:@"CreatedAssetUUID"];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v55 = v23;
      __int16 v56 = 2114;
      v57 = v24;
      _os_log_impl(&dword_19BCFB000, v22, OS_LOG_TYPE_DEFAULT, "Sending saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHander: with job type %{public}@ uuid %{public}@", buf, 0x16u);
    }
    long long v25 = [v11 objectForKey:@"callStack"];
    if (v25)
    {
      long long v26 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        NSStringFromSelector(a2);
        SEL v27 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)long long buf = 138412546;
        uint64_t v55 = v27;
        __int16 v56 = 2112;
        v57 = v25;
        _os_log_impl(&dword_19BCFB000, v26, OS_LOG_TYPE_DEFAULT, "##### %@ %@", buf, 0x16u);
      }
      id v28 = [MEMORY[0x1E4F1CAD0] setWithObject:@"callStack"];
      _PLJobLogDictionary(v11, 0, v28);
    }
    if (a4) {
      CFRetain(a4);
    }
    if (a5) {
      CFRetain(a5);
    }
    id v29 = [(PLAssetsdBaseClient *)self proxyFactory];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke;
    v47[3] = &unk_1E58A1B70;
    uint64_t v49 = a4;
    id v50 = a5;
    id v48 = v12;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3254779904;
    int v37[2] = __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_18;
    v37[3] = &unk_1EEBF5420;
    char v40 = v51;
    id v41 = *((id *)&v51 + 1);
    long long v42 = v52;
    long long v43 = v53;
    SEL v44 = a2;
    id v38 = v11;
    long long v45 = a4;
    long long v46 = a5;
    id v39 = v48;
    [v29 remoteObjectProxyWithErrorHandler:v47 handler:v37];

    id v30 = v48;
  }
  else
  {
    long long v25 = [(PLAssetJobExecutor *)creationRequestBridge executeCreationRequestWithJobDict:v11 previewImageSurface:a5];
    uint64_t v31 = [v25 isSuccess];
    id v30 = [v25 error];
    (*((void (**)(id, uint64_t, id, id))v12 + 2))(v12, v31, v11, v30);
  }

  if ((_BYTE)v51) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v52 + 8));
  }
  if ((void)v52)
  {
    long long v32 = PLRequestGetLog();
    long long v33 = v32;
    os_signpost_id_t v34 = v52;
    if ((unint64_t)(v52 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      Name = sel_getName(*((SEL *)&v53 + 1));
      *(_DWORD *)long long buf = 136446210;
      uint64_t v55 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v33, OS_SIGNPOST_INTERVAL_END, v34, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[PLAssetsdResourceClient saveAssetWithJobDictionary:imageSurface:previewImageSurface:completionHandler:]_block_invoke";
    __int16 v9 = 2112;
    id v10 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v7, 0x16u);
  }

  os_signpost_id_t v5 = (const void *)a1[5];
  id v6 = (const void *)a1[6];
  if (v5) {
    CFRelease(v5);
  }
  if (v6) {
    CFRelease(v6);
  }
  (*(void (**)(void))(a1[4] + 16))();
}

void __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_18(uint64_t a1, void *a2)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    int v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v20 = @"SignpostId";
    id v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v21[0] = v6;
    int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    uint64_t v8 = v4;
    __int16 v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)long long buf = 138543362;
      char v19 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 104);
  uint64_t v12 = *(void *)(a1 + 112);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_21;
  v16[3] = &unk_1E58A1BA0;
  uint64_t v13 = *(void *)(a1 + 32);
  id v17 = *(id *)(a1 + 40);
  [v3 saveAssetWithDataAndPorts:v13 imageSurface:v11 previewImageSurface:v12 reply:v16];
  uint64_t v14 = *(const void **)(a1 + 104);
  id v15 = *(const void **)(a1 + 112);
  if (v14) {
    CFRelease(v14);
  }
  if (v15) {
    CFRelease(v15);
  }
}

void __105__PLAssetsdResourceClient_saveAssetWithJobDictionary_imageSurface_previewImageSurface_completionHandler___block_invoke_21(uint64_t a1, int a2, void *a3, int a4, int a5, void *a6)
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
    id v15 = [v13 errorWithDomain:@"com.apple.photos.error" code:v14 userInfo:0];
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

- (PLAssetsdResourceClient)initWithQueue:(id)a3 proxyCreating:(id)a4 proxyGetter:(SEL)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PLAssetsdResourceClient;
  os_signpost_id_t v5 = [(PLAssetsdBaseClient *)&v9 initWithQueue:a3 proxyCreating:a4 proxyGetter:a5];
  if (v5)
  {
    pl_dispatch_once(&PLIsCamera_didCheck, &__block_literal_global_83);
    if (PLIsCamera_isCamera
      || (pl_dispatch_once(&PLIsNebulad_didCheck, &__block_literal_global_138_3881), PLIsNebulad_isNebulad))
    {
      if (_os_feature_enabled_impl())
      {
        id v6 = (PLAssetJobExecutor *)objc_alloc_init(NSClassFromString((NSString *)@"PHAssetCreationRequestBridge"));
        creationRequestBridge = v5->_creationRequestBridge;
        v5->_creationRequestBridge = v6;
      }
    }
  }
  return v5;
}

@end