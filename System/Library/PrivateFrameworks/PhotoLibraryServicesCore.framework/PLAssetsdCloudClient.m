@interface PLAssetsdCloudClient
- (void)cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)cancelCPLDownloadWithContext:(id)a3 completionHandler:(id)a4;
- (void)computeFingerPrintsOfAsset:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)downloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 trackCPLDownload:(BOOL)a6 downloadIsTransient:(BOOL)a7 proposedTaskIdentifier:(id)a8 completionHandler:(id)a9;
- (void)requestCPLDownloadImageDataForAssets:(id)a3 format:(unint64_t)a4 doneTokens:(id)a5 completionHandler:(id)a6;
- (void)requestVideoPlaybackURLForCloudSharedAsset:(id)a3 mediaAssetType:(unint64_t)a4 completionHandler:(id)a5;
@end

@implementation PLAssetsdCloudClient

- (void)computeFingerPrintsOfAsset:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v41 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v41) = v11;
  if (v11)
  {
    v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: computeFingerPrintsOfAsset:synchronously:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v13 = (void *)*((void *)&v41 + 1);
    *((void *)&v41 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if (!v10)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 124, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v14 = [v9 URIRepresentation];
  [(PLAssetsdBaseClient *)self proxyFactory];
  if (v6) {
    v15 = {;
  }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke;
    v39[3] = &unk_1E58A1BC8;
    id v16 = v10;
    id v40 = v16;
    v17 = [v15 synchronousRemoteObjectProxyWithErrorHandler:v39];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_37;
    v37[3] = &unk_1E58A19C0;
    id v38 = v16;
    [v17 computeFingerPrintsOfAssetWithObjectURI:v14 synchronously:1 reply:v37];

    v18 = &v40;
    v19 = &v38;
  }
  else {
    v20 = {;
  }
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_39;
    v35[3] = &unk_1E58A1BC8;
    id v36 = v10;
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3254779904;
    v26[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_40;
    v26[3] = &unk_1EEBF4F88;
    char v29 = v41;
    id v30 = *((id *)&v41 + 1);
    long long v31 = v42;
    long long v32 = v43;
    SEL v33 = a2;
    id v27 = v14;
    char v34 = 0;
    id v28 = v36;
    [v20 remoteObjectProxyWithErrorHandler:v35 handler:v26];

    v18 = &v36;
    v19 = &v30;
    v15 = v27;
  }

  if ((_BYTE)v41) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v42 + 8));
  }
  if ((void)v42)
  {
    v21 = PLRequestGetLog();
    v22 = v21;
    os_signpost_id_t v23 = v42;
    if ((unint64_t)(v42 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(*((SEL *)&v43 + 1));
      *(_DWORD *)buf = 136446210;
      v45 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudClient computeFingerPrintsOfAsset:synchronously:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_37(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Unable to get asset fingerprints because XPC service returned an error. (%@)", (uint8_t *)&v11, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_39(uint64_t a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v5 = 136315394;
    BOOL v6 = "-[PLAssetsdCloudClient computeFingerPrintsOfAsset:synchronously:completionHandler:]_block_invoke";
    __int16 v7 = 2112;
    id v8 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v5, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_40(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    v17 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    __int16 v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    uint64_t v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(unsigned __int8 *)(a1 + 104);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_41;
  v13[3] = &unk_1E58A19C0;
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v3 computeFingerPrintsOfAssetWithObjectURI:v12 synchronously:v11 reply:v13];
}

void __83__PLAssetsdCloudClient_computeFingerPrintsOfAsset_synchronously_completionHandler___block_invoke_41(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v9)
  {
    id v10 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_19BCFB000, v10, OS_LOG_TYPE_ERROR, "Unable to get asset fingerprints because XPC service returned an error. (%@)", (uint8_t *)&v11, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v31 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v31) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cancelCPLDownloadImageDataWithVirtualTaskIdentifiers:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    int v11 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if (!v7)
  {
    v19 = [MEMORY[0x1E4F28B00] currentHandler];
    [v19 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 107, @"Invalid parameter not satisfying: %@", @"virtualTaskIdentifiers" object file lineNumber description];
  }
  if (!v8)
  {
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 108, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke;
  v29[3] = &unk_1E58A1BC8;
  id v30 = v8;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3254779904;
  v21[2] = __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_2;
  v21[3] = &unk_1EEBF4D90;
  char v24 = v31;
  id v25 = *((id *)&v31 + 1);
  long long v26 = v32;
  long long v27 = v33;
  SEL v28 = a2;
  id v13 = v7;
  id v22 = v13;
  id v14 = v30;
  id v23 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v29 handler:v21];

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v33 + 1));
      *(_DWORD *)buf = 136446210;
      v35 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v16 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_35;
  v12[3] = &unk_1E58A1998;
  uint64_t v11 = *(void *)(a1 + 32);
  id v13 = *(id *)(a1 + 40);
  [v3 asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:v11 reply:v12];
}

uint64_t __95__PLAssetsdCloudClient_cancelCPLDownloadImageDataWithVirtualTaskIdentifiers_completionHandler___block_invoke_35(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)requestCPLDownloadImageDataForAssets:(id)a3 format:(unint64_t)a4 doneTokens:(id)a5 completionHandler:(id)a6
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v38 = 0u;
  BOOL v14 = +[PLXPCMessageLogger enabled];
  LOBYTE(v38) = v14;
  if (v14)
  {
    v15 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: requestCPLDownloadImageDataForAssets:format:doneTokens:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v16 = (void *)*((void *)&v38 + 1);
    *((void *)&v38 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v39 + 8));
  }
  if (!v13)
  {
    id v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 92, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  os_signpost_id_t v17 = [(PLAssetsdBaseClient *)self proxyFactory];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke;
  v36[3] = &unk_1E58A1BC8;
  id v37 = v13;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3254779904;
  v26[2] = __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_2;
  v26[3] = &unk_1EEBF54C8;
  char v30 = v38;
  id v31 = *((id *)&v38 + 1);
  long long v32 = v39;
  long long v33 = v40;
  SEL v34 = a2;
  id v18 = v11;
  id v27 = v18;
  id v19 = v12;
  id v28 = v19;
  unint64_t v35 = a4;
  id v20 = v37;
  id v29 = v20;
  [v17 remoteObjectProxyWithErrorHandler:v36 handler:v26];

  if ((_BYTE)v38) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v39 + 8));
  }
  if ((void)v39)
  {
    v21 = PLRequestGetLog();
    id v22 = v21;
    os_signpost_id_t v23 = v39;
    if ((unint64_t)(v39 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(*((SEL *)&v40 + 1));
      *(_DWORD *)buf = 136446210;
      long long v42 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v18 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v19[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)buf = 138543362;
      os_signpost_id_t v17 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 112);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_27;
  v14[3] = &unk_1E58A1970;
  id v15 = *(id *)(a1 + 48);
  [v3 asynchronousStartPreheatingCPLDownloadForAssets:v11 doneTokens:v12 format:v13 reply:v14];
}

uint64_t __97__PLAssetsdCloudClient_requestCPLDownloadImageDataForAssets_format_doneTokens_completionHandler___block_invoke_27(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)downloadCloudPhotoLibraryAsset:(id)a3 resourceType:(unint64_t)a4 highPriority:(BOOL)a5 trackCPLDownload:(BOOL)a6 downloadIsTransient:(BOOL)a7 proposedTaskIdentifier:(id)a8 completionHandler:(id)a9
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a8;
  id v17 = a9;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v48 = 0u;
  BOOL v18 = +[PLXPCMessageLogger enabled];
  LOBYTE(v48) = v18;
  if (v18)
  {
    id v19 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: downloadCloudPhotoLibraryAsset:resourceType:highPriority:trackCPLDownload:downloadIsTransient:proposedTaskIdentifier:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v20 = (void *)*((void *)&v48 + 1);
    *((void *)&v48 + 1) = v19;

    os_activity_scope_enter(v19, (os_activity_scope_state_t)((char *)&v49 + 8));
  }
  if (!v15)
  {
    char v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 63, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  if (!v17)
  {
    id v31 = [MEMORY[0x1E4F28B00] currentHandler];
    [v31 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 64, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];
  }
  v21 = [v15 URIRepresentation];
  id v22 = [(PLAssetsdBaseClient *)self proxyFactory];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke;
  v46[3] = &unk_1E58A1BC8;
  id v47 = v17;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3254779904;
  v33[2] = __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_2;
  v33[3] = &unk_1EEBF5500;
  char v37 = v48;
  id v38 = *((id *)&v48 + 1);
  long long v39 = v49;
  long long v40 = v50;
  SEL v41 = a2;
  id v23 = v21;
  id v34 = v23;
  id v24 = v16;
  id v35 = v24;
  unint64_t v42 = a4;
  BOOL v43 = a5;
  BOOL v44 = a6;
  BOOL v45 = a7;
  id v25 = v47;
  id v36 = v25;
  [v22 remoteObjectProxyWithErrorHandler:v46 handler:v33];

  if ((_BYTE)v48) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v49 + 8));
  }
  if ((void)v49)
  {
    long long v26 = PLRequestGetLog();
    id v27 = v26;
    os_signpost_id_t v28 = v49;
    if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
    {
      Name = sel_getName(*((SEL *)&v50 + 1));
      *(_DWORD *)buf = 136446210;
      v52 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v27, OS_SIGNPOST_INTERVAL_END, v28, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 56))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v23 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v24[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 104));
      *(_DWORD *)buf = 138543362;
      id v22 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v12 = *(void *)(a1 + 32);
  uint64_t v11 = *(void **)(a1 + 40);
  uint64_t v13 = *(void *)(a1 + 112);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 120);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 121);
  uint64_t v16 = *(unsigned __int8 *)(a1 + 122);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  void v17[2] = __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_23;
  v17[3] = &unk_1E58A1948;
  char v20 = v15;
  id v18 = v11;
  id v19 = *(id *)(a1 + 48);
  [v3 downloadCloudPhotoLibraryAssetWithObjectURI:v12 taskIdentifier:v18 resourceType:v13 HighPriority:v14 trackCPLDownload:v15 downloadIsTransient:v16 reply:v17];
}

void __159__PLAssetsdCloudClient_downloadCloudPhotoLibraryAsset_resourceType_highPriority_trackCPLDownload_downloadIsTransient_proposedTaskIdentifier_completionHandler___block_invoke_23(uint64_t a1, int a2, void *a3, void *a4, void *a5)
{
  id v12 = a3;
  id v9 = a4;
  id v10 = a5;
  if (a2)
  {
    if (*(unsigned char *)(a1 + 48))
    {
      uint64_t v11 = objc_alloc_init(PLCPLDownloadContext);
      [(PLCPLDownloadContext *)v11 setTaskIdentifier:*(void *)(a1 + 32)];
      [(PLCPLDownloadContext *)v11 setResourceTypeDescription:v9];
    }
    else
    {
      uint64_t v11 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)cancelCPLDownloadWithContext:(id)a3 completionHandler:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v29 = 0u;
  BOOL v9 = +[PLXPCMessageLogger enabled];
  LOBYTE(v29) = v9;
  if (v9)
  {
    id v10 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: cancelCPLDownloadWithContext:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v11 = (void *)*((void *)&v29 + 1);
    *((void *)&v29 + 1) = v10;

    os_activity_scope_enter(v10, (os_activity_scope_state_t)((char *)&v30 + 8));
  }
  id v12 = [(PLAssetsdBaseClient *)self proxyFactory];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke;
  v27[3] = &unk_1E58A1BC8;
  id v28 = v8;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3254779904;
  void v19[2] = __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_2;
  v19[3] = &unk_1EEBF4D90;
  char v22 = v29;
  id v23 = *((id *)&v29 + 1);
  long long v24 = v30;
  long long v25 = v31;
  SEL v26 = a2;
  id v13 = v7;
  id v20 = v13;
  id v14 = v28;
  id v21 = v14;
  [v12 remoteObjectProxyWithErrorHandler:v27 handler:v19];

  if ((_BYTE)v29) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v30 + 8));
  }
  if ((void)v30)
  {
    uint64_t v15 = PLRequestGetLog();
    uint64_t v16 = v15;
    os_signpost_id_t v17 = v30;
    if ((unint64_t)(v30 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v31 + 1));
      *(_DWORD *)buf = 136446210;
      long long v33 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    uint64_t v16 = @"SignpostId";
    BOOL v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v17[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    id v8 = v4;
    BOOL v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      id v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      uint64_t v15 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = [*(id *)(a1 + 32) taskIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_15;
  v12[3] = &unk_1E58A1920;
  id v13 = *(id *)(a1 + 40);
  [v3 cancelCPLDownloadTaskWithIdentifier:v11 reply:v12];
}

uint64_t __71__PLAssetsdCloudClient_cancelCPLDownloadWithContext_completionHandler___block_invoke_15(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, 0);
  }
  return result;
}

- (void)requestVideoPlaybackURLForCloudSharedAsset:(id)a3 mediaAssetType:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v34 = 0u;
  BOOL v11 = +[PLXPCMessageLogger enabled];
  LOBYTE(v34) = v11;
  if (v11)
  {
    id v12 = _os_activity_create(&dword_19BCFB000, "PLXPC Client: requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:completionHandler:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v34 + 1);
    *((void *)&v34 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if (!v9)
  {
    char v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"PLAssetsdCloudClient.m", 27, @"Invalid parameter not satisfying: %@", @"objectID" object file lineNumber description];
  }
  id v14 = [v9 URIRepresentation];
  uint64_t v15 = [(PLAssetsdBaseClient *)self proxyFactory];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke;
  v32[3] = &unk_1E58A1BC8;
  id v33 = v10;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3254779904;
  v23[2] = __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_9;
  v23[3] = &unk_1EEBF5110;
  char v26 = v34;
  id v27 = *((id *)&v34 + 1);
  long long v28 = v35;
  long long v29 = v36;
  SEL v30 = a2;
  id v16 = v14;
  id v24 = v16;
  unint64_t v31 = a4;
  id v17 = v33;
  id v25 = v17;
  [v15 remoteObjectProxyWithErrorHandler:v32 handler:v23];

  if ((_BYTE)v34) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v35 + 8));
  }
  if ((void)v35)
  {
    id v18 = PLRequestGetLog();
    id v19 = v18;
    os_signpost_id_t v20 = v35;
    if ((unint64_t)(v35 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      Name = sel_getName(*((SEL *)&v36 + 1));
      *(_DWORD *)buf = 136446210;
      id v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v19, OS_SIGNPOST_INTERVAL_END, v20, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[PLAssetsdCloudClient requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:completionHandler:]_block_invoke";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19BCFB000, v4, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v6, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

void __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_9(uint64_t a1, void *a2)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(unsigned char *)(a1 + 48))
  {
    v4 = PLRequestGetLog();
    os_signpost_id_t v5 = os_signpost_id_generate(v4);
    id v17 = @"SignpostId";
    int v6 = [MEMORY[0x1E4F28ED0] numberWithUnsignedLongLong:v5];
    v18[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    objc_msgSend(v3, "set_userInfo:", v7);

    __int16 v8 = v4;
    id v9 = v8;
    if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
    {
      uint64_t v10 = NSStringFromSelector(*(SEL *)(a1 + 96));
      *(_DWORD *)buf = 138543362;
      id v16 = v10;
      _os_signpost_emit_with_name_impl(&dword_19BCFB000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v5, "PLXPC Async", "%{public}@", buf, 0xCu);
    }
  }
  uint64_t v11 = *(void *)(a1 + 104);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_12;
  v13[3] = &unk_1E58A1DD8;
  uint64_t v12 = *(void *)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  [v3 requestVideoPlaybackURLForCloudSharedAsset:v12 mediaAssetType:v11 reply:v13];
}

uint64_t __100__PLAssetsdCloudClient_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_completionHandler___block_invoke_12(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

@end