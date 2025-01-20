@interface PLAssetsdResourceInternalService
- (PLAssetsdResourceInternalService)initWithLibraryServicesManager:(id)a3 trustedCallerBundleID:(id)a4;
- (void)asynchronousMasterThumbnailForAssetUUID:(id)a3 reply:(id)a4;
- (void)batchSaveAssetJobs:(id)a3 reply:(id)a4;
- (void)cancelAllPrewarmingWithReply:(id)a3;
- (void)prewarmWithCapturePhotoSettings:(id)a3 reply:(id)a4;
@end

@implementation PLAssetsdResourceInternalService

- (PLAssetsdResourceInternalService)initWithLibraryServicesManager:(id)a3 trustedCallerBundleID:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdResourceInternalService;
  v8 = [(PLAbstractLibraryServicesManagerService *)&v11 initWithLibraryServicesManager:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_trustedCallerBundleID, a4);
  }

  return v9;
}

- (void)prewarmWithCapturePhotoSettings:(id)a3 reply:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v9 = [v8 deferredProcessingServicerHandler];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __74__PLAssetsdResourceInternalService_prewarmWithCapturePhotoSettings_reply___block_invoke;
  v11[3] = &unk_1E586F0F0;
  id v12 = v6;
  id v10 = v6;
  [v9 prewarmWithCapturePhotoSettings:v7 completionHandler:v11];
}

- (void).cxx_destruct
{
}

- (void)cancelAllPrewarmingWithReply:(id)a3
{
  id v4 = a3;
  v5 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v6 = [v5 deferredProcessingServicerHandler];

  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__PLAssetsdResourceInternalService_cancelAllPrewarmingWithReply___block_invoke;
  v8[3] = &unk_1E586F0F0;
  id v9 = v4;
  id v7 = v4;
  [v6 cancelAllPrewarmingWithCompletion:v8];
}

void __65__PLAssetsdResourceInternalService_cancelAllPrewarmingWithReply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

void __74__PLAssetsdResourceInternalService_prewarmWithCapturePhotoSettings_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [v3 isSuccess];
  id v5 = [v3 error];

  (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
}

- (void)asynchronousMasterThumbnailForAssetUUID:(id)a3 reply:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v29 = 0u;
  *(_OWORD *)sel = 0u;
  long long v28 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v28) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: asynchronousMasterThumbnailForAssetUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v10 = (void *)*((void *)&v28 + 1);
    *((void *)&v28 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v29 + 8));
  }
  objc_super v11 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v12 = [v11 databaseContext];
  v13 = (void *)[v12 newShortLivedLibraryWithName:"-[PLAssetsdResourceInternalService asynchronousMasterThumbnailForAssetUUID:reply:]"];

  v14 = [v13 thumbnailManager];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __82__PLAssetsdResourceInternalService_asynchronousMasterThumbnailForAssetUUID_reply___block_invoke;
  v23[3] = &unk_1E58710F0;
  id v15 = v6;
  id v24 = v15;
  id v16 = v13;
  id v25 = v16;
  id v17 = v14;
  id v26 = v17;
  id v18 = v7;
  id v27 = v18;
  [v16 performBlockAndWait:v23];

  if ((_BYTE)v28) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v29 + 8));
  }
  if ((void)v29)
  {
    v19 = PLRequestGetLog();
    v20 = v19;
    os_signpost_id_t v21 = v29;
    if ((unint64_t)(v29 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v32 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v20, OS_SIGNPOST_INTERVAL_END, v21, "Received batchSaveAssets:reply: with %d jobs", "%{public}s", buf, 0xCu);
    }
  }
}

void __82__PLAssetsdResourceInternalService_asynchronousMasterThumbnailForAssetUUID_reply___block_invoke(void *a1)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithUUID:a1[4] inLibrary:a1[5]];
  if (v2)
  {
    id v3 = (void *)a1[6];
    uint64_t v4 = [MEMORY[0x1E4F8B918] defaultFormatChooser];
    id v5 = [v4 masterThumbnailFormat];
    id v6 = objc_msgSend(v3, "dataForPhoto:format:allowPlaceholder:width:height:bytesPerRow:dataWidth:dataHeight:imageDataOffset:", v2, objc_msgSend(v5, "formatID"), 0, 0, 0, 0, 0, 0, 0);
  }
  else
  {
    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = *MEMORY[0x1E4F8C500];
    uint64_t v10 = *MEMORY[0x1E4F28568];
    v11[0] = @"Asset not found";
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    id v6 = [v7 errorWithDomain:v8 code:41003 userInfo:v9];
  }
  (*(void (**)(void))(a1[7] + 16))();
}

- (void)batchSaveAssetJobs:(id)a3 reply:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v45 = a4;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v58 = 0u;
  int v6 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v58) = v6;
  if (v6)
  {
    id v7 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: batchSaveAssetJobs:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v8 = (void *)*((void *)&v58 + 1);
    *((void *)&v58 + 1) = v7;

    os_activity_scope_enter(v7, (os_activity_scope_state_t)((char *)&v59 + 8));
  }
  id v9 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v5 count];
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v62 = v10;
    _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEFAULT, "Received batchSaveAssets:reply: with %d jobs", buf, 8u);
  }

  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = *(void *)v55;
    uint64_t v14 = *MEMORY[0x1E4F8C970];
    uint64_t v15 = *MEMORY[0x1E4F8C8F0];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v55 != v13) {
          objc_enumerationMutation(obj);
        }
        if (v12 >= 11)
        {
          os_signpost_id_t v21 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            int v22 = [obj count];
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)v62 = v22 - v12;
            _os_log_impl(&dword_19B3C7000, v21, OS_LOG_TYPE_DEFAULT, "  [...and %d more]", buf, 8u);
          }

          goto LABEL_19;
        }
        id v17 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        id v18 = PLGatekeeperXPCGetLog();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = [v17 objectForKeyedSubscript:v14];
          v20 = [v17 objectForKeyedSubscript:v15];
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v62 = v12;
          *(_WORD *)&v62[4] = 2114;
          *(void *)&v62[6] = v19;
          *(_WORD *)&v62[14] = 2114;
          *(void *)&v62[16] = v20;
          _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "  [job-%d] type %{public}@ uuid %{public}@", buf, 0x1Cu);

          ++v12;
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_19:

  v23 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Begin batchSaveAssetJobs", buf, 2u);
  }

  id v24 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v25 = [v24 imageWriter];

  id v26 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(obj, "count"));
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke;
  v51[3] = &unk_1E5863EA8;
  v51[4] = self;
  id v27 = v25;
  id v52 = v27;
  id v28 = v26;
  id v53 = v28;
  [obj enumerateObjectsUsingBlock:v51];
  long long v29 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v30 = *MEMORY[0x1E4F8C990];
  [v29 setObject:*MEMORY[0x1E4F8C990] forKey:*MEMORY[0x1E4F8C970]];
  [v29 setObject:v28 forKey:*MEMORY[0x1E4F8C8A8]];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke_2;
  v48[3] = &unk_1E5863ED8;
  id v31 = v28;
  id v49 = v31;
  id v32 = v45;
  id v50 = v32;
  uint64_t v33 = (void *)MEMORY[0x19F38D650](v48);
  v34 = (void *)[v33 copy];
  v35 = (void *)MEMORY[0x19F38D650]();
  [v29 setObject:v35 forKey:@"completionBlock"];

  v36 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    int v38 = [v31 count];
    *(_DWORD *)buf = 138412802;
    *(void *)v62 = v37;
    *(_WORD *)&v62[8] = 2112;
    *(void *)&v62[10] = v30;
    *(_WORD *)&v62[18] = 1024;
    *(_DWORD *)&v62[20] = v38;
    _os_log_impl(&dword_19B3C7000, v36, OS_LOG_TYPE_DEFAULT, "[%@] enqueuing batch save job %@ with %d jobs", buf, 0x1Cu);
  }
  [v27 enqueueJob:v29];
  v39 = PLGatekeeperXPCGetLog();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v39, OS_LOG_TYPE_DEBUG, "End batchSaveAssetJobs", buf, 2u);
  }

  if ((_BYTE)v58) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v59 + 8));
  }
  if ((void)v59)
  {
    v40 = PLRequestGetLog();
    v41 = v40;
    os_signpost_id_t v42 = v59;
    if ((unint64_t)(v59 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v40))
    {
      Name = sel_getName(*((SEL *)&v60 + 1));
      *(_DWORD *)buf = 136446210;
      *(void *)v62 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v41, OS_SIGNPOST_INTERVAL_END, v42, "Received batchSaveAssets:reply: with %d jobs", "%{public}s", buf, 0xCu);
    }
  }
}

void __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke(id *a1, void *a2)
{
  id v17 = a2;
  id v3 = (void *)MEMORY[0x19F38D3B0]();
  uint64_t v4 = [a1[4] libraryServicesManager];
  id v5 = [v4 imageWriter];
  int v6 = [MEMORY[0x1E4F29268] currentConnection];
  int v7 = [v5 imageWriterJob:v17 hasValidPathsWithConnection:v6];

  if (v7)
  {
    if ([v17 count])
    {
      uint64_t v8 = [v17 objectForKey:*MEMORY[0x1E4F8C970]];
      id v9 = [v17 objectForKey:*MEMORY[0x1E4F8C930]];
      if ([v8 isEqualToString:*MEMORY[0x1E4F8C9B8]])
      {
        uint64_t v10 = *MEMORY[0x1E4F8CA28];
        uint64_t v11 = [v17 objectForKey:*MEMORY[0x1E4F8CA28]];
        if (![v11 length])
        {
          if (![v9 length])
          {
            uint64_t v12 = [MEMORY[0x1E4F8B850] defaultFileExtensionForAssetType:0];

            id v9 = (void *)v12;
          }
          uint64_t v13 = [v17 objectForKey:*MEMORY[0x1E4F8C8E8]];

          if (!v13)
          {
            uint64_t v14 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F8C8F0]];
            if (!v14)
            {
              uint64_t v14 = [v17 objectForKeyedSubscript:*MEMORY[0x1E4F8C918]];
              if (!v14)
              {
                uint64_t v15 = [MEMORY[0x1E4F29128] UUID];
                uint64_t v14 = [v15 UUIDString];
              }
            }
            uint64_t v16 = [a1[5] cameraAssetPathForNewAssetWithExtension:v9 assetUUID:v14];

            uint64_t v11 = (void *)v16;
          }
          if (v11) {
            [v17 setObject:v11 forKey:v10];
          }
        }
      }
      else
      {
        uint64_t v11 = 0;
      }
    }
    [a1[6] addObject:v17];
  }
}

void __61__PLAssetsdResourceInternalService_batchSaveAssetJobs_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  [v3 removeObjectForKey:@"completionBlock"];
  PLImageWriterRemovePrivateKeysFromJobDictionary(v3);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        objc_msgSend(v9, "removeObjectForKey:", @"completionBlock", (void)v10);
        PLImageWriterRemovePrivateKeysFromJobDictionary(v9);
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

@end