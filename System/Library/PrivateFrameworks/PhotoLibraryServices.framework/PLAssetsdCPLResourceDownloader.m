@interface PLAssetsdCPLResourceDownloader
- (PLAssetsdCPLResourceDownloader)initWithPhotoLibrary:(id)a3 trustedCallerBundleID:(id)a4 clientConnection:(id)a5;
- (id)startCPLDownloadForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 highPriority:(BOOL)a6 track:(BOOL)a7 notify:(BOOL)a8 transient:(BOOL)a9 proposedTaskIdentifier:(id)a10 doneToken:(id)a11 error:(id *)a12;
- (void)_handleInvalidation;
- (void)cancelCPLDownloadTaskWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)cancelCPLDownloadTasks:(id)a3 completionHandler:(id)a4;
- (void)handleInvalidation;
- (void)sendClientCPLStatusWithVirtualTaskIdentifier:(id)a3 downloadContext:(id)a4;
@end

@implementation PLAssetsdCPLResourceDownloader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingCPLDownloads, 0);
  objc_storeStrong((id *)&self->_pendingCPLDownloadsIsolationQueue, 0);
  objc_destroyWeak((id *)&self->_clientConnection);
  objc_storeStrong((id *)&self->_trustedCallerBundleID, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

- (void)sendClientCPLStatusWithVirtualTaskIdentifier:(id)a3 downloadContext:(id)a4
{
  id v25 = a4;
  id v6 = a3;
  v7 = [v25 objectForKeyedSubscript:@"taskIdentifier"];
  v8 = [v25 objectForKeyedSubscript:@"pending"];
  char v9 = [v8 BOOLValue];

  if (v9)
  {
    char v10 = 0;
  }
  else if (v7)
  {
    v11 = [(PLPhotoLibrary *)self->_photoLibrary libraryServicesManager];
    v12 = [v11 cloudPhotoLibraryManager];
    char v13 = [v12 isResourceTransferTaskAliveWithTaskWithIdentifier:v7];

    char v10 = v13 ^ 1;
  }
  else
  {
    char v10 = 1;
  }
  v14 = [v25 objectForKeyedSubscript:@"progress"];
  if (v14)
  {
    v15 = [v25 objectForKeyedSubscript:@"progress"];
    [v15 doubleValue];
    double v17 = v16;
  }
  else
  {
    double v17 = -1.0;
  }

  if (v10)
  {
    uint64_t v18 = 1;
  }
  else
  {
    v19 = [v25 objectForKeyedSubscript:@"completed"];
    if (v19)
    {
      v20 = [v25 objectForKeyedSubscript:@"completed"];
      uint64_t v18 = [v20 BOOLValue];
    }
    else
    {
      uint64_t v18 = 0;
    }
  }
  v21 = [v25 objectForKeyedSubscript:@"error"];
  v22 = [v25 objectForKeyedSubscript:@"data"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_clientConnection);
  v24 = [WeakRetained remoteObjectProxyWithErrorHandler:&__block_literal_global_89983];
  [v24 downloadStatusForIdentifier:v6 progress:v18 completed:v22 data:v21 error:v17];
}

void __95__PLAssetsdCPLResourceDownloader_sendClientCPLStatusWithVirtualTaskIdentifier_downloadContext___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    int v4 = 136315394;
    v5 = "-[PLAssetsdCPLResourceDownloader sendClientCPLStatusWithVirtualTaskIdentifier:downloadContext:]_block_invoke";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_19B3C7000, v3, OS_LOG_TYPE_ERROR, "Error getting remote object proxy for %s: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)cancelCPLDownloadTasks:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(PLPhotoLibrary *)self->_photoLibrary libraryServicesManager];
  char v9 = [v8 cloudPhotoLibraryManager];

  if (v6 && v9)
  {
    pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke;
    v11[3] = &unk_1E58710F0;
    id v12 = v6;
    char v13 = self;
    id v14 = v9;
    id v15 = v7;
    dispatch_async(pendingCPLDownloadsIsolationQueue, v11);
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

void __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) count];
  uint64_t v15 = 0;
  double v16 = &v15;
  uint64_t v17 = 0x2020000000;
  uint64_t v18 = 0;
  if (!v2) {
    goto LABEL_9;
  }
  uint64_t v3 = v2;
  char v4 = 0;
  for (uint64_t i = 0; i != v3; ++i)
  {
    id v6 = [*(id *)(a1 + 32) objectAtIndexedSubscript:i];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKey:v6];
      uint64_t v8 = [v7 objectForKeyedSubscript:@"taskIdentifier"];
      if (v8)
      {
        ++v16[3];
        v10[0] = MEMORY[0x1E4F143A8];
        v10[1] = 3221225472;
        v10[2] = __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_2;
        v10[3] = &unk_1E5871140;
        char v9 = *(void **)(a1 + 48);
        v10[4] = *(void *)(a1 + 40);
        id v11 = v6;
        id v14 = &v15;
        id v13 = *(id *)(a1 + 56);
        id v12 = *(id *)(a1 + 32);
        [v9 cancelResourceTransferTaskWithIdentifier:v8 completion:v10];

        char v4 = 1;
      }
    }
  }
  if ((v4 & 1) == 0) {
LABEL_9:
  }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  _Block_object_dispose(&v15, 8);
}

void __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_2(uint64_t a1, char a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(NSObject **)(v3 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_3;
  block[3] = &unk_1E5871118;
  char v11 = a2;
  block[4] = v3;
  id v8 = *(id *)(a1 + 40);
  long long v6 = *(_OWORD *)(a1 + 56);
  id v5 = (id)v6;
  long long v10 = v6;
  id v9 = *(id *)(a1 + 48);
  dispatch_async(v4, block);
}

uint64_t __75__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTasks_completionHandler___block_invoke_3(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(result + 72)) {
    result = [*(id *)(*(void *)(result + 32) + 40) removeObjectForKey:*(void *)(result + 40)];
  }
  if (!--*(void *)(*(void *)(*(void *)(v1 + 64) + 8) + 24))
  {
    uint64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 56) + 16);
    return v2();
  }
  return result;
}

- (void)cancelCPLDownloadTaskWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [(PLPhotoLibrary *)self->_photoLibrary libraryServicesManager];
  id v9 = [v8 cloudPhotoLibraryManager];

  if (v6 && v9)
  {
    pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke;
    v11[3] = &unk_1E58710F0;
    void v11[4] = self;
    id v12 = v6;
    id v13 = v9;
    id v14 = v7;
    dispatch_async(pendingCPLDownloadsIsolationQueue, v11);
  }
  else
  {
    v7[2](v7);
  }
}

void __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    char v4 = [v2 objectForKeyedSubscript:@"taskIdentifier"];
    if (v4)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_2;
      v7[3] = &unk_1E58710C8;
      id v5 = *(void **)(a1 + 40);
      id v6 = *(void **)(a1 + 48);
      v7[4] = *(void *)(a1 + 32);
      id v8 = v5;
      id v9 = *(id *)(a1 + 56);
      [v6 cancelResourceTransferTaskWithIdentifier:v4 completion:v7];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(NSObject **)(v6 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_3;
    v9[3] = &unk_1E5875E18;
    v9[4] = v6;
    id v10 = *(id *)(a1 + 40);
    dispatch_async(v7, v9);
  }
  return (*(uint64_t (**)(void, uint64_t, uint64_t, uint64_t, uint64_t))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), a2, a3, a4, a5);
}

uint64_t __88__PLAssetsdCPLResourceDownloader_cancelCPLDownloadTaskWithIdentifier_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)startCPLDownloadForAsset:(id)a3 resourceType:(unint64_t)a4 masterResourceOnly:(BOOL)a5 highPriority:(BOOL)a6 track:(BOOL)a7 notify:(BOOL)a8 transient:(BOOL)a9 proposedTaskIdentifier:(id)a10 doneToken:(id)a11 error:(id *)a12
{
  BOOL v12 = a8;
  BOOL v14 = a6;
  BOOL v15 = a5;
  v83[1] = *MEMORY[0x1E4F143B8];
  id v46 = a3;
  id v44 = a10;
  id v45 = a11;
  uint64_t v18 = [(PLPhotoLibrary *)self->_photoLibrary libraryServicesManager];
  v47 = [v18 cloudPhotoLibraryManager];

  if (v47)
  {
    uint64_t v74 = 0;
    v75 = &v74;
    uint64_t v76 = 0x3032000000;
    v77 = __Block_byref_object_copy__90004;
    v78 = __Block_byref_object_dispose__90005;
    id v79 = 0;
    v19 = [v46 photoLibrary];
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke;
    v71[3] = &unk_1E5875E68;
    v73 = &v74;
    id v43 = v46;
    id v72 = v43;
    [v19 performBlockAndWait:v71];

    v20 = PLImageManagerGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = v75[5];
      *(_DWORD *)buf = 138412290;
      uint64_t v81 = v21;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_DEBUG, "Starting CPL download with asset uuid: %@", buf, 0xCu);
    }

    v22 = [MEMORY[0x1E4F8BA48] transaction:"-[PLAssetsdCPLResourceDownloader startCPLDownloadForAsset:resourceType:masterResourceOnly:highPriority:track:notify:transient:proposedTaskIdentifier:doneToken:error:]"];
    if (a7 || v12)
    {
      if ([v44 length])
      {
        id v27 = v44;
      }
      else
      {
        v28 = [MEMORY[0x1E4F29128] UUID];
        id v27 = [v28 UUIDString];
      }
      pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_44;
      block[3] = &unk_1E58735D8;
      unint64_t v70 = a4;
      block[4] = self;
      id v23 = v27;
      id v68 = v23;
      id v69 = v22;
      dispatch_async(pendingCPLDownloadsIsolationQueue, block);
    }
    else
    {
      id v23 = 0;
    }
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2;
    v62[3] = &unk_1E5870FB0;
    id v30 = v23;
    id v63 = v30;
    v64 = self;
    BOOL v66 = v12;
    id v31 = v22;
    id v65 = v31;
    v32 = (void *)MEMORY[0x19F38D650](v62);
    if (a9)
    {
      if (v14)
      {
        v33 = PLBackendGetLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Requesting high priority in-memory resource download not supported, download will take place with default priority", buf, 2u);
        }
      }
      trustedCallerBundleID = self->_trustedCallerBundleID;
      v57[0] = MEMORY[0x1E4F143A8];
      v57[1] = 3221225472;
      v57[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_59;
      v57[3] = &unk_1E5871000;
      id v35 = v30;
      BOOL v36 = v12;
      id v37 = v35;
      v58[0] = v35;
      v58[1] = self;
      BOOL v61 = v36;
      id v59 = v45;
      id v60 = v31;
      [v47 downloadResourceInMemoryForAsset:v43 resourceType:a4 masterResourceOnly:v15 clientBundleID:trustedCallerBundleID proposedTaskIdentifier:v37 taskDidBeginHandler:v32 completionHandler:v57];
      v38 = (id *)v58;
      v39 = &v59;
      v40 = &v60;
    }
    else
    {
      v42 = self->_trustedCallerBundleID;
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_71;
      v53[3] = &unk_1E5871050;
      v54[0] = v30;
      v54[1] = self;
      BOOL v56 = v12;
      id v55 = v31;
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3_74;
      v48[3] = &unk_1E58710A0;
      v49[0] = v54[0];
      v49[1] = self;
      BOOL v52 = v12;
      id v50 = v45;
      id v51 = v55;
      [v47 downloadAsset:v43 resourceType:a4 masterResourceOnly:v15 highPriority:v14 clientBundleID:v42 proposedTaskIdentifier:v49[0] taskDidBeginHandler:v32 progressBlock:v53 completionHandler:v48];

      v38 = v54;
      v39 = &v55;
      v40 = (id *)v49;
    }

    id v26 = v30;
    _Block_object_dispose(&v74, 8);
  }
  else
  {
    if (a12)
    {
      v24 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v82 = *MEMORY[0x1E4F28568];
      v83[0] = @"PLCloudPhotoLibraryManager is not available";
      id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v83 forKeys:&v82 count:1];
      *a12 = [v24 errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v25];
    }
    id v26 = 0;
  }

  return v26;
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) uuid];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  char v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_44(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v3 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 56)];
  id v4 = [v2 dictionaryWithObject:v3 forKey:@"resourceType"];

  [v4 setObject:MEMORY[0x1E4F1CC38] forKey:@"pending"];
  [*(id *)(*(void *)(a1 + 32) + 40) setObject:v4 forKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 48) stillAlive];
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  unint64_t v6 = a2;
  unint64_t v7 = a4;
  [*(id *)(a1 + 32) hash];
  [(id)v6 hash];
  kdebug_trace();
  if (v6 | v7)
  {
    id v8 = *(void **)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(NSObject **)(v9 + 32);
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3;
      v11[3] = &unk_1E5870F88;
      void v11[4] = v9;
      id v12 = v8;
      id v13 = (id)v6;
      id v14 = (id)v7;
      char v16 = *(unsigned char *)(a1 + 56);
      id v15 = *(id *)(a1 + 48);
      dispatch_async(v10, v11);
    }
  }
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_59(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [*(id *)(a1 + 32) hash];
  [v7 hash];
  kdebug_trace();
  if (v7)
  {
    id v10 = *(void **)(a1 + 32);
    if (v10)
    {
      uint64_t v11 = *(void *)(a1 + 40);
      id v12 = *(NSObject **)(v11 + 32);
      uint64_t v13 = MEMORY[0x1E4F143A8];
      uint64_t v14 = 3221225472;
      id v15 = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_60;
      char v16 = &unk_1E5870FD8;
      uint64_t v17 = v11;
      id v18 = v10;
      id v19 = v9;
      id v20 = v8;
      char v24 = *(unsigned char *)(a1 + 64);
      id v21 = v7;
      id v22 = *(id *)(a1 + 48);
      id v23 = *(id *)(a1 + 56);
      dispatch_async(v12, &v13);
    }
  }
  objc_msgSend(*(id *)(a1 + 56), "stillAlive", v13, v14, v15, v16, v17);
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_71(uint64_t a1, void *a2, float a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) hash];
  [v5 hash];
  kdebug_trace();
  if (v5)
  {
    unint64_t v6 = *(void **)(a1 + 32);
    if (v6)
    {
      uint64_t v7 = *(void *)(a1 + 40);
      id v8 = *(NSObject **)(v7 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_72;
      block[3] = &unk_1E5871028;
      block[4] = v7;
      id v10 = v6;
      float v13 = a3;
      char v14 = *(unsigned char *)(a1 + 56);
      id v11 = v5;
      id v12 = *(id *)(a1 + 48);
      dispatch_async(v8, block);
    }
  }
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3_74(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v7 = a2;
  id v8 = a5;
  [*(id *)(a1 + 32) hash];
  [v7 hash];
  kdebug_trace();
  if (v7)
  {
    id v9 = *(void **)(a1 + 32);
    if (v9)
    {
      uint64_t v10 = *(void *)(a1 + 40);
      id v11 = *(NSObject **)(v10 + 32);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_4;
      block[3] = &unk_1E5871078;
      block[4] = v10;
      id v13 = v9;
      id v14 = v8;
      char v18 = *(unsigned char *)(a1 + 64);
      id v15 = v7;
      id v16 = *(id *)(a1 + 48);
      id v17 = *(id *)(a1 + 56);
      dispatch_async(v11, block);
    }
  }
  [*(id *)(a1 + 56) stillAlive];
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_4(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = [NSNumber numberWithBool:1];
  [v5 setObject:v2 forKey:@"completed"];

  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    [v5 setObject:v3 forKey:@"error"];
  }
  if (*(unsigned char *)(a1 + 80))
  {
    [*(id *)(a1 + 40) hash];
    [*(id *)(a1 + 56) hash];
    kdebug_trace();
    [*(id *)(a1 + 32) sendClientCPLStatusWithVirtualTaskIdentifier:*(void *)(a1 + 40) downloadContext:v5];
  }
  id v4 = *(void **)(a1 + 64);
  if (v4)
  {
    [v4 hash];
    kdebug_trace();
    notify_post((const char *)[*(id *)(a1 + 64) UTF8String]);
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 72) stillAlive];
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_72(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  LODWORD(v2) = *(_DWORD *)(a1 + 64);
  uint64_t v3 = [NSNumber numberWithFloat:v2];
  [v4 setObject:v3 forKey:@"progress"];

  if (*(unsigned char *)(a1 + 68))
  {
    [*(id *)(a1 + 40) hash];
    [*(id *)(a1 + 48) hash];
    kdebug_trace();
    [*(id *)(a1 + 32) sendClientCPLStatusWithVirtualTaskIdentifier:*(void *)(a1 + 40) downloadContext:v4];
  }
  [*(id *)(a1 + 56) stillAlive];
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_2_60(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  [v5 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"completed"];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    [v5 setObject:v2 forKeyedSubscript:@"error"];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3)
  {
    [v5 setObject:v3 forKeyedSubscript:@"data"];
    [v5 setObject:&unk_1EEBF2720 forKeyedSubscript:@"progress"];
  }
  if (*(unsigned char *)(a1 + 88))
  {
    [*(id *)(a1 + 40) hash];
    [*(id *)(a1 + 64) hash];
    kdebug_trace();
    [*(id *)(a1 + 32) sendClientCPLStatusWithVirtualTaskIdentifier:*(void *)(a1 + 40) downloadContext:v5];
  }
  id v4 = *(void **)(a1 + 72);
  if (v4)
  {
    [v4 hash];
    kdebug_trace();
    notify_post((const char *)[*(id *)(a1 + 72) UTF8String]);
  }
  [*(id *)(*(void *)(a1 + 32) + 40) removeObjectForKey:*(void *)(a1 + 40)];
  [*(id *)(a1 + 80) stillAlive];
}

void __166__PLAssetsdCPLResourceDownloader_startCPLDownloadForAsset_resourceType_masterResourceOnly_highPriority_track_notify_transient_proposedTaskIdentifier_doneToken_error___block_invoke_3(uint64_t a1)
{
  id v4 = [*(id *)(*(void *)(a1 + 32) + 40) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    [v4 setObject:v2 forKey:@"taskIdentifier"];
  }
  uint64_t v3 = *(void *)(a1 + 56);
  if (v3) {
    [v4 setObject:v3 forKey:@"error"];
  }
  if (*(unsigned char *)(a1 + 72))
  {
    [*(id *)(a1 + 40) hash];
    [*(id *)(a1 + 48) hash];
    kdebug_trace();
    [*(id *)(a1 + 32) sendClientCPLStatusWithVirtualTaskIdentifier:*(void *)(a1 + 40) downloadContext:v4];
  }
  [*(id *)(a1 + 64) stillAlive];
  [v4 removeObjectForKey:@"pending"];
}

- (void)handleInvalidation
{
  objc_initWeak(&location, self);
  pendingCPLDownloadsIsolationQueue = self->_pendingCPLDownloadsIsolationQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __52__PLAssetsdCPLResourceDownloader_handleInvalidation__block_invoke;
  v4[3] = &unk_1E5875F08;
  objc_copyWeak(&v5, &location);
  dispatch_async(pendingCPLDownloadsIsolationQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __52__PLAssetsdCPLResourceDownloader_handleInvalidation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleInvalidation];
}

- (void)_handleInvalidation
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_pendingCPLDownloadsIsolationQueue);
  if ([(NSMutableDictionary *)self->_pendingCPLDownloads count])
  {
    uint64_t v3 = [(PLPhotoLibrary *)self->_photoLibrary libraryServicesManager];
    id v4 = [v3 cloudPhotoLibraryManager];

    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    id v5 = [(NSMutableDictionary *)self->_pendingCPLDownloads allKeys];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [v4 cancelResourceTransferTaskWithIdentifier:*(void *)(*((void *)&v10 + 1) + 8 * v9++) completion:0];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    [(NSMutableDictionary *)self->_pendingCPLDownloads removeAllObjects];
  }
}

- (PLAssetsdCPLResourceDownloader)initWithPhotoLibrary:(id)a3 trustedCallerBundleID:(id)a4 clientConnection:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  objc_initWeak(&location, a5);
  if (!v10)
  {
    id v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PLAssetsdCPLResourceDownloader.m", 44, @"Invalid parameter not satisfying: %@", @"photoLibrary" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)PLAssetsdCPLResourceDownloader;
  long long v12 = [(PLAssetsdCPLResourceDownloader *)&v22 init];
  long long v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoLibrary, a3);
    objc_storeStrong((id *)&v13->_trustedCallerBundleID, a4);
    id v14 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v13->_clientConnection, v14);

    uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingCPLDownloads = v13->_pendingCPLDownloads;
    v13->_pendingCPLDownloads = v15;

    id v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v18 = dispatch_queue_create("com.apple.assetsd.pendingCPLDownloadsIsolation", v17);
    pendingCPLDownloadsIsolationQueue = v13->_pendingCPLDownloadsIsolationQueue;
    v13->_pendingCPLDownloadsIsolationQueue = (OS_dispatch_queue *)v18;
  }
  objc_destroyWeak(&location);

  return v13;
}

@end