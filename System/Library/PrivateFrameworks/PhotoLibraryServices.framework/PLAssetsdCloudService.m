@interface PLAssetsdCloudService
- (PLAssetsdCloudService)initWithLibraryServicesManager:(id)a3 lazyResourceDownloader:(id)a4;
- (id)resourceDownloader;
- (void)asynchronousStartPreheatingCPLDownloadForAssets:(id)a3 doneTokens:(id)a4 format:(unint64_t)a5 reply:(id)a6;
- (void)asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:(id)a3 reply:(id)a4;
- (void)cancelCPLDownloadTaskWithIdentifier:(id)a3 reply:(id)a4;
- (void)computeFingerPrintsOfAssetWithObjectURI:(id)a3 synchronously:(BOOL)a4 reply:(id)a5;
- (void)downloadCloudPhotoLibraryAssetWithObjectURI:(id)a3 taskIdentifier:(id)a4 resourceType:(unint64_t)a5 HighPriority:(BOOL)a6 trackCPLDownload:(BOOL)a7 downloadIsTransient:(BOOL)a8 reply:(id)a9;
- (void)requestVideoPlaybackURLForCloudSharedAsset:(id)a3 mediaAssetType:(unint64_t)a4 reply:(id)a5;
@end

@implementation PLAssetsdCloudService

- (void).cxx_destruct
{
}

- (void)computeFingerPrintsOfAssetWithObjectURI:(id)a3 synchronously:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v32 = 0u;
  *(_OWORD *)sel = 0u;
  long long v31 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v31) = v10;
  if (v10)
  {
    v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: computeFingerPrintsOfAssetWithObjectURI:synchronously:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    v12 = (void *)*((void *)&v31 + 1);
    *((void *)&v31 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v32 + 8));
  }
  v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  v14 = [v13 databaseContext];
  v15 = (void *)[v14 newShortLivedLibraryWithName:"-[PLAssetsdCloudService computeFingerPrintsOfAssetWithObjectURI:synchronously:reply:]"];

  v16 = [v15 managedObjectContext];
  v17 = [v16 persistentStoreCoordinator];
  v18 = [v17 managedObjectIDForURIRepresentation:v8];

  if (v18)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __85__PLAssetsdCloudService_computeFingerPrintsOfAssetWithObjectURI_synchronously_reply___block_invoke;
    v27[3] = &unk_1E5874868;
    id v28 = v16;
    id v29 = v18;
    id v30 = v9;
    v19 = (void *)MEMORY[0x19F38D650](v27);
    if (v6) {
      [v15 performBlockAndWait:v19];
    }
    else {
      [v15 performBlock:v19];
    }

    v22 = v28;
  }
  else
  {
    v20 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35 = @"Invalid objectID value";
    v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    v22 = [v20 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v21];

    (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v22);
  }

  if ((_BYTE)v31) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v32 + 8));
  }
  if ((void)v32)
  {
    v23 = PLRequestGetLog();
    v24 = v23;
    os_signpost_id_t v25 = v32;
    if ((unint64_t)(v32 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v37 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __85__PLAssetsdCloudService_computeFingerPrintsOfAssetWithObjectURI_synchronously_reply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) objectWithID:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2)
  {
    id v7 = 0;
    id v8 = 0;
    uint64_t v4 = [v2 masterFingerPrintCacheIfNecessaryAndAdjustedFingerPrint:&v8 error:&v7];
    id v5 = v8;
    uint64_t v6 = (uint64_t)v7;
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:0];
    uint64_t v4 = 0;
    id v5 = 0;
  }
  if (!(v4 | v6))
  {
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41001 userInfo:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v8;
  if (v8)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: asynchronousStopPreheatingCPLDownloadForAssetsWithTaskIdentifiers:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  id v9 = [(PLAssetsdCloudService *)self resourceDownloader];
  [v9 cancelCPLDownloadTasks:v6 completionHandler:v7];

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    int v10 = PLRequestGetLog();
    v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asynchronousStartPreheatingCPLDownloadForAssets:(id)a3 doneTokens:(id)a4 format:(unint64_t)a5 reply:(id)a6
{
  unsigned __int16 v7 = a5;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  v12 = (void (**)(id, uint64_t, void *, void))a6;
  long long v43 = 0u;
  *(_OWORD *)sel = 0u;
  long long v42 = 0u;
  int v13 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v42) = v13;
  if (v13)
  {
    char v14 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: asynchronousStartPreheatingCPLDownloadForAssets:doneTokens:format:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v15 = (void *)*((void *)&v42 + 1);
    *((void *)&v42 + 1) = v14;

    os_activity_scope_enter(v14, (os_activity_scope_state_t)((char *)&v43 + 8));
  }
  v16 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  char v17 = [v16 isCloudPhotoLibraryEnabled];

  uint64_t v18 = [v10 count];
  if (v18 == [v11 count])
  {
    uint64_t v19 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v18];
    if (v18)
    {
      uint64_t v20 = v18;
      do
      {
        [v19 addObject:&stru_1EEB2EB80];
        --v20;
      }
      while (v20);
    }
    if ((v17 & 1) == 0) {
      v12[2](v12, 1, v19, 0);
    }
    v21 = [MEMORY[0x1E4F8B938] formatWithID:v7];
    id v22 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService asynchronousStartPreheatingCPLDownloadForAssets:doneTokens:format:reply:]");
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __97__PLAssetsdCloudService_asynchronousStartPreheatingCPLDownloadForAssets_doneTokens_format_reply___block_invoke;
    v33[3] = &unk_1E5868730;
    uint64_t v41 = v18;
    id v34 = v10;
    id v35 = v11;
    id v23 = v22;
    id v36 = v23;
    id v24 = v21;
    id v37 = v24;
    uint64_t v38 = self;
    id v25 = v19;
    id v39 = v25;
    v40 = v12;
    [v23 performBlock:v33 withPriority:1];
  }
  else
  {
    id v25 = [NSString stringWithFormat:@"Mismatch between the number of asset uuids and tokens, assetUUIDs count: %tu, doneTokens count: %tu", v18, objc_msgSend(v11, "count")];
    v26 = PLImageManagerGetLog();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v48 = (const char *)v25;
      _os_log_impl(&dword_19B3C7000, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    v27 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v45 = *MEMORY[0x1E4F28568];
    id v46 = v25;
    id v28 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v46 forKeys:&v45 count:1];
    id v24 = [v27 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v28];

    ((void (**)(id, uint64_t, void *, id))v12)[2](v12, 0, 0, v24);
  }

  if ((_BYTE)v42) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v43 + 8));
  }
  if ((void)v43)
  {
    id v29 = PLRequestGetLog();
    id v30 = v29;
    os_signpost_id_t v31 = v43;
    if ((unint64_t)(v43 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v48 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __97__PLAssetsdCloudService_asynchronousStartPreheatingCPLDownloadForAssets_doneTokens_format_reply___block_invoke(uint64_t a1)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 88))
  {
    uint64_t v2 = 0;
    v3 = off_1E585E000;
    while (1)
    {
      uint64_t v4 = [*(id *)(a1 + 32) objectAtIndexedSubscript:v2];
      id v5 = [*(id *)(a1 + 40) objectAtIndexedSubscript:v2];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        id v6 = PLImageManagerGetLog();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          long long v15 = (objc_class *)objc_opt_class();
          v16 = NSStringFromClass(v15);
          char v17 = (objc_class *)objc_opt_class();
          uint64_t v18 = NSStringFromClass(v17);
          *(_DWORD *)buf = 138412546;
          id v25 = v16;
          __int16 v26 = 2112;
          v27 = v18;
          _os_log_impl(&dword_19B3C7000, v6, OS_LOG_TYPE_ERROR, "Received Non-NSString element over xpc, assetuuid: %@, doneToken: %@", buf, 0x16u);
        }
        goto LABEL_19;
      }
      id v6 = [(__objc2_class *)v3[401] assetWithUUID:v4 inLibrary:*(void *)(a1 + 48)];
      if (([v6 isCloudSharedAsset] & 1) == 0) {
        break;
      }
LABEL_19:

      if ((unint64_t)++v2 >= *(void *)(a1 + 88)) {
        return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
      }
    }
    uint64_t v7 = *(void *)(a1 + 56);
    id v23 = 0;
    unint64_t v8 = +[PLResourceChooser cloudResourceTypeForAsset:v6 format:v7 filePath:&v23 imageType:0];
    id v22 = v23;
    id v9 = PLImageManagerGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      [*(id *)(a1 + 56) shortDescription];
      id v10 = v21 = v8;
      id v11 = +[PLCloudPhotoLibraryManager descriptionForResourceType:v21];
      v12 = [NSNumber numberWithInt:v22 != 0];
      *(_DWORD *)buf = 138413058;
      id v25 = v4;
      __int16 v26 = 2112;
      v27 = v10;
      __int16 v28 = 2112;
      id v29 = v11;
      __int16 v30 = 2112;
      os_signpost_id_t v31 = v12;
      _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_DEBUG, "Preheated an asset (uuid: %@) for format (%@), resulting cloud resource type: %@, image is on disk: %@", buf, 0x2Au);

      v3 = off_1E585E000;
      unint64_t v8 = v21;
    }

    if (v8)
    {
      if (v22)
      {
LABEL_18:

        goto LABEL_19;
      }
      int v13 = [*(id *)(a1 + 64) resourceDownloader];
      LOBYTE(v20) = 0;
      char v14 = [v13 startCPLDownloadForAsset:v6 resourceType:v8 masterResourceOnly:0 highPriority:1 track:1 notify:0 transient:v20 proposedTaskIdentifier:0 doneToken:v5 error:0];

      if (v14) {
        [*(id *)(a1 + 72) replaceObjectAtIndex:v2 withObject:v14];
      }
    }
    else
    {
      char v14 = PLImageManagerGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v4;
        _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_ERROR, "During preheating, expected to find cloud resource for asset (uuid: %@) but found nothing", buf, 0xCu);
      }
    }

    goto LABEL_18;
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 80) + 16))();
}

- (void)downloadCloudPhotoLibraryAssetWithObjectURI:(id)a3 taskIdentifier:(id)a4 resourceType:(unint64_t)a5 HighPriority:(BOOL)a6 trackCPLDownload:(BOOL)a7 downloadIsTransient:(BOOL)a8 reply:(id)a9
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v32 = a4;
  id v16 = a9;
  long long v45 = 0u;
  *(_OWORD *)sel = 0u;
  long long v44 = 0u;
  int v17 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v44) = v17;
  if (v17)
  {
    uint64_t v18 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: downloadCloudPhotoLibraryAssetWithObjectURI:taskIdentifier:resourceType:HighPriority:trackCPLDownload:downloadIsTransient:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v19 = (void *)*((void *)&v44 + 1);
    *((void *)&v44 + 1) = v18;

    os_activity_scope_enter(v18, (os_activity_scope_state_t)((char *)&v45 + 8));
  }
  uint64_t v20 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  unint64_t v21 = [v20 persistentStoreCoordinator];

  id v22 = [v21 managedObjectIDForURIRepresentation:v15];
  id v23 = v22;
  if (v22 && ([v22 isTemporaryID] & 1) == 0)
  {
    id v27 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService downloadCloudPhotoLibraryAssetWithObjectURI:taskIdentifier:resourceType:HighPriority:trackCPLDownload:downloadIsTransient:reply:]");
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __153__PLAssetsdCloudService_downloadCloudPhotoLibraryAssetWithObjectURI_taskIdentifier_resourceType_HighPriority_trackCPLDownload_downloadIsTransient_reply___block_invoke;
    v34[3] = &unk_1E5868708;
    id v35 = v23;
    id v26 = v27;
    id v36 = v26;
    id v37 = self;
    unint64_t v40 = a5;
    BOOL v41 = a6;
    BOOL v42 = a7;
    BOOL v43 = a8;
    id v38 = v33;
    id v39 = v16;
    [v26 performBlock:v34 withPriority:1];
  }
  else
  {
    id v24 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v47 = *MEMORY[0x1E4F28568];
    v48 = @"Invalid object URI";
    id v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    id v26 = [v24 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v25];

    (*((void (**)(id, void, void, void, id))v16 + 2))(v16, 0, 0, 0, v26);
  }

  if ((_BYTE)v44) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v45 + 8));
  }
  if ((void)v45)
  {
    __int16 v28 = PLRequestGetLog();
    id v29 = v28;
    os_signpost_id_t v30 = v45;
    if ((unint64_t)(v45 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v50 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __153__PLAssetsdCloudService_downloadCloudPhotoLibraryAssetWithObjectURI_taskIdentifier_resourceType_HighPriority_trackCPLDownload_downloadIsTransient_reply___block_invoke(uint64_t a1)
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2 && ([v2 isDeleted] & 1) == 0)
  {
    unint64_t v8 = [*(id *)(a1 + 48) resourceDownloader];
    uint64_t v9 = *(void *)(a1 + 72);
    uint64_t v10 = *(unsigned __int8 *)(a1 + 80);
    uint64_t v11 = *(unsigned __int8 *)(a1 + 81);
    char v12 = *(unsigned char *)(a1 + 82);
    uint64_t v13 = *(void *)(a1 + 56);
    id v17 = 0;
    LOBYTE(v16) = v12;
    char v14 = [v8 startCPLDownloadForAsset:v3 resourceType:v9 masterResourceOnly:0 highPriority:v10 track:v11 notify:v11 transient:v16 proposedTaskIdentifier:v13 doneToken:0 error:&v17];
    id v7 = v17;

    if (*(unsigned char *)(a1 + 81))
    {
      id v15 = +[PLCloudPhotoLibraryManager descriptionForResourceType:*(void *)(a1 + 72)];
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F8C500];
    uint64_t v18 = *MEMORY[0x1E4F28568];
    v19[0] = @"Asset is invalid.";
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
    id v7 = [v4 errorWithDomain:v5 code:41008 userInfo:v6];

    (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
  }
}

- (void)cancelCPLDownloadTaskWithIdentifier:(id)a3 reply:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v15 = 0u;
  *(_OWORD *)sel = 0u;
  long long v13 = 0u;
  int v8 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v13) = v8;
  if (v8)
  {
    *((void *)&v13 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: cancelCPLDownloadTaskWithIdentifier:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v13 + 1), (os_activity_scope_state_t)((char *)&v15 + 8));
  }
  uint64_t v9 = [(PLAssetsdCloudService *)self resourceDownloader];
  [v9 cancelCPLDownloadTaskWithIdentifier:v6 completionHandler:v7];

  if (v14) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v15 + 8));
  }
  if ((void)v15)
  {
    uint64_t v10 = PLRequestGetLog();
    uint64_t v11 = v10;
    if ((unint64_t)(v15 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v18 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v11, OS_SIGNPOST_INTERVAL_END, v15, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)requestVideoPlaybackURLForCloudSharedAsset:(id)a3 mediaAssetType:(unint64_t)a4 reply:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  long long v33 = 0u;
  *(_OWORD *)sel = 0u;
  long long v32 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v32) = v11;
  if (v11)
  {
    char v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v13 = (void *)*((void *)&v32 + 1);
    *((void *)&v32 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if (!v9)
  {
    id v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PLAssetsdCloudService.m", 55, @"Invalid parameter not satisfying: %@", @"objectURI" object file lineNumber description];
  }
  char v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v15 = [v14 persistentStoreCoordinator];

  uint64_t v16 = [v15 managedObjectIDForURIRepresentation:v9];
  id v17 = v16;
  if (v16 && ([v16 isTemporaryID] & 1) == 0)
  {
    id v21 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdCloudService requestVideoPlaybackURLForCloudSharedAsset:mediaAssetType:reply:]");
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke;
    v27[3] = &unk_1E5873510;
    id v28 = v17;
    id v20 = v21;
    id v29 = v20;
    unint64_t v31 = a4;
    id v30 = v10;
    [v20 performBlockAndWait:v27];
  }
  else
  {
    uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v35 = *MEMORY[0x1E4F28568];
    id v36 = @"Invalid object URI";
    uint64_t v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v36 forKeys:&v35 count:1];
    id v20 = [v18 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v19];

    (*((void (**)(id, void, void, id))v10 + 2))(v10, 0, 0, v20);
  }

  if ((_BYTE)v32) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v33 + 8));
  }
  if ((void)v33)
  {
    id v22 = PLRequestGetLog();
    id v23 = v22;
    os_signpost_id_t v24 = v33;
    if ((unint64_t)(v33 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      id v38 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v23, OS_SIGNPOST_INTERVAL_END, v24, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke(uint64_t a1)
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:*(void *)(a1 + 40)];
  v3 = v2;
  if (v2 && ([v2 isDeleted] & 1) == 0 && objc_msgSend(v3, "isCloudSharedAsset"))
  {
    uint64_t v4 = *(void *)(a1 + 56);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke_2;
    v9[3] = &unk_1E58742F0;
    id v10 = v3;
    id v11 = *(id *)(a1 + 48);
    +[PLPhotoSharingHelper requestVideoPlaybackURLForAsset:v10 videoType:v4 completion:v9];

    uint64_t v5 = v10;
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v12 = *MEMORY[0x1E4F28568];
    v13[0] = @"Invalid asset to request streaming video URL";
    int v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1];
    uint64_t v5 = [v6 errorWithDomain:v7 code:41003 userInfo:v8];

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __89__PLAssetsdCloudService_requestVideoPlaybackURLForCloudSharedAsset_mediaAssetType_reply___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) cachedNonPersistedVideoPlaybackURL];
  uint64_t v2 = [*(id *)(a1 + 32) cachedNonPersistedVideoPlaybackURLError];
  (*(void (**)(void, BOOL, id, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v2 == 0, v3, v2);
}

- (id)resourceDownloader
{
  return (id)[(PLLazyObject *)self->_lazyResourceDownloader objectValue];
}

- (PLAssetsdCloudService)initWithLibraryServicesManager:(id)a3 lazyResourceDownloader:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)PLAssetsdCloudService;
  int v8 = [(PLAbstractLibraryServicesManagerService *)&v11 initWithLibraryServicesManager:a3];
  id v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_lazyResourceDownloader, a4);
  }

  return v9;
}

@end