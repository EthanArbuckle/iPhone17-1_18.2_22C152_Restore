@interface PLAssetsdResourceService
- (BOOL)_allowSandboxExtensionForAsset:(id)a3;
- (BOOL)_allowSandboxExtensionForSessionIdentifier:(id)a3 captureSessionState:(id)a4;
- (BOOL)_consolidateResource:(id)a3 assetUUID:(id)a4 bundleScope:(unsigned __int16)a5 error:(id *)a6;
- (PLAssetsdResourceService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4 resourceDownloader:(id)a5;
- (id)_typeFromPathConstrainedToImageOrMovie:(id)a3;
- (id)consolidateAssets:(id)a3 reply:(id)a4;
- (void)addAssetGroupWithName:(id)a3 reply:(id)a4;
- (void)addAssetWithURL:(id)a3 toAlbum:(id)a4 reply:(id)a5;
- (void)asynchronousAdjustmentDataForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 reply:(id)a5;
- (void)downloadCloudSharedAsset:(id)a3 wantedPlaceholderkind:(signed __int16)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6 reply:(id)a7;
- (void)estimatedFileLengthOfVideo:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6 reply:(id)a7;
- (void)fileDescriptorForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5;
- (void)filePathForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5;
- (void)getSandboxExtensionForFileSystemBookmark:(id)a3 reply:(id)a4;
- (void)getSandboxExtensionsForAssetWithUUID:(id)a3 reply:(id)a4;
- (void)imageDataForAssetWithObjectURI:(id)a3 formatID:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 reply:(id)a9;
- (void)projectExtensionDataForProjectUuid:(id)a3 reply:(id)a4;
- (void)sandboxExtensionURLForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5;
- (void)saveAssetWithDataAndPorts:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 reply:(id)a6;
- (void)translatePersistentURL:(id)a3 withAdjustments:(BOOL)a4 handler:(id)a5;
- (void)updateInternalResourcePath:(id)a3 objectURI:(id)a4 sandboxExtension:(id)a5 reply:(id)a6;
@end

@implementation PLAssetsdResourceService

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceDownloader, 0);
  objc_storeStrong((id *)&self->_asyncImageDataQueue, 0);
}

- (void)projectExtensionDataForProjectUuid:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService projectExtensionDataForProjectUuid:reply:]");
  v9 = v8;
  if (v8)
  {
    v24[0] = 0;
    v24[1] = v24;
    v24[2] = 0x3032000000;
    v24[3] = __Block_byref_object_copy__62306;
    v24[4] = __Block_byref_object_dispose__62307;
    id v25 = 0;
    v22[0] = 0;
    v22[1] = v22;
    v22[2] = 0x3032000000;
    v22[3] = __Block_byref_object_copy__62306;
    v22[4] = __Block_byref_object_dispose__62307;
    id v23 = 0;
    v10 = [v8 managedObjectContext];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke;
    v17[3] = &unk_1E5874900;
    id v18 = v6;
    id v11 = v10;
    id v19 = v11;
    v20 = v24;
    v21 = v22;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke_2;
    v13[3] = &unk_1E5873410;
    id v14 = v7;
    v15 = v24;
    v16 = v22;
    [v9 performBlock:v17 completionHandler:v13];

    _Block_object_dispose(v22, 8);
    _Block_object_dispose(v24, 8);
  }
  else
  {
    v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41012 userInfo:0];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke(void *a1)
{
  v18[1] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1C0D0];
  v3 = +[PLProjectAlbum entityName];
  v4 = [v2 fetchRequestWithEntityName:v3];

  v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"uuid", a1[4]];
  [v4 setPredicate:v5];

  [v4 setFetchLimit:1];
  v18[0] = @"projectData";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  [v4 setPropertiesToFetch:v6];

  [v4 setResultType:2];
  id v7 = (void *)a1[5];
  id v17 = 0;
  id v8 = [v7 executeFetchRequest:v4 error:&v17];
  id v9 = v17;
  v10 = v9;
  if (v8)
  {
    id v11 = [v8 firstObject];
    uint64_t v12 = [v11 objectForKeyedSubscript:@"projectData"];
    uint64_t v13 = *(void *)(a1[6] + 8);
    id v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    uint64_t v15 = *(void *)(a1[7] + 8);
    id v16 = v9;
    id v11 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v16;
  }
}

uint64_t __69__PLAssetsdResourceService_projectExtensionDataForProjectUuid_reply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)updateInternalResourcePath:(id)a3 objectURI:(id)a4 sandboxExtension:(id)a5 reply:(id)a6
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v13 = (void (**)(id, void, void *))a6;
  long long v38 = 0u;
  *(_OWORD *)sel = 0u;
  long long v37 = 0u;
  int v14 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v37) = v14;
  if (v14)
  {
    uint64_t v15 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: updateInternalResourcePath:objectURI:sandboxExtension:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v16 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  id v17 = v12;
  [v17 bytes];
  uint64_t v18 = sandbox_extension_consume();
  if (v18 == -1)
  {
    uint64_t v22 = *__error();
    id v23 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v20 = v23;
    if (v10) {
      [v23 setObject:v10 forKeyedSubscript:*MEMORY[0x1E4F28328]];
    }
    v21 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:v22 userInfo:v20];
    v24 = PLBackendGetLog();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v43 = v21;
      _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "sandbox_extension_consume failed with error %@", buf, 0xCu);
    }

    v13[2](v13, 0, v21);
  }
  else
  {
    id v19 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v20 = [v19 databaseContext];

    if (v20)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __88__PLAssetsdResourceService_updateInternalResourcePath_objectURI_sandboxExtension_reply___block_invoke;
      v32[3] = &unk_1E586C808;
      v33 = (char *)v11;
      id v34 = v10;
      uint64_t v36 = v18;
      v35 = v13;
      [v20 perform:v32 withName:"-[PLAssetsdResourceService updateInternalResourcePath:objectURI:sandboxExtension:reply:]"];

      v21 = v33;
    }
    else
    {
      sandbox_extension_release();
      id v25 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      v41 = @"No database context";
      v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      v21 = [v25 errorWithDomain:*MEMORY[0x1E4F8C500] code:41003 userInfo:v26];

      v27 = PLBackendGetLog();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v43 = v21;
        _os_log_impl(&dword_19B3C7000, v27, OS_LOG_TYPE_ERROR, "Error updating internal resource: %@", buf, 0xCu);
      }

      v13[2](v13, 0, v21);
      v20 = 0;
    }
  }

  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    v28 = PLRequestGetLog();
    v29 = v28;
    os_signpost_id_t v30 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      v43 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v29, OS_SIGNPOST_INTERVAL_END, v30, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __88__PLAssetsdResourceService_updateInternalResourcePath_objectURI_sandboxExtension_reply___block_invoke(uint64_t a1, void *a2)
{
  v46[1] = *MEMORY[0x1E4F143B8];
  v3 = [a2 managedObjectContext];
  v4 = [v3 persistentStoreCoordinator];
  v5 = [v4 managedObjectIDForURIRepresentation:*(void *)(a1 + 32)];
  id v40 = 0;
  id v6 = [v3 existingObjectWithID:v5 error:&v40];
  id v7 = v40;
  if (!v6)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v19 = [NSString stringWithFormat:@"Cannot find internal resource with URI %@", *(void *)(a1 + 32)];
    [v9 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F28588]];

    id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:v9];
    goto LABEL_20;
  }
  uint64_t v8 = [v6 dataLength];
  id v9 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 40)];
  id v39 = 0;
  uint64_t v10 = *MEMORY[0x1E4F1C5F8];
  id v38 = 0;
  int v11 = [v9 getResourceValue:&v39 forKey:v10 error:&v38];
  id v12 = v39;
  id v37 = v38;
  if (!v11)
  {
    v20 = PLBackendGetLog();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v9;
      __int16 v43 = 2112;
      id v44 = v37;
      _os_log_impl(&dword_19B3C7000, v20, OS_LOG_TYPE_ERROR, "Get file size for %@ failed with error %@", buf, 0x16u);
    }

    id v18 = v37;
    if (v18) {
      goto LABEL_19;
    }
    goto LABEL_10;
  }
  if (v8 == [v12 longLongValue]) {
    goto LABEL_10;
  }
  v35 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v13 = *MEMORY[0x1E4F8C500];
  uint64_t v45 = *MEMORY[0x1E4F28228];
  v46[0] = @"Reconnect attempt failed because file size does not match";
  [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:&v45 count:1];
  int v14 = v5;
  id v15 = v12;
  v17 = id v16 = v7;
  id v18 = [v35 errorWithDomain:v13 code:47013 userInfo:v17];

  id v7 = v16;
  id v12 = v15;
  v5 = v14;
  if (!v18)
  {
LABEL_10:
    id v34 = v7;
    uint64_t v36 = v4;
    v21 = +[PLFileSystemBookmark fileSystemBookmarkFromURL:v9 context:v3];
    uint64_t v22 = +[PLFileSystemVolume volumeForURL:v9 context:v3];
    id v23 = (void *)v22;
    if (v21 && v22)
    {
      [v6 setFileSystemVolume:v22];
      v24 = [v6 fileSystemBookmark];
      [v6 setFileSystemBookmark:v21];
      id v25 = [*(id *)(a1 + 40) stringByDeletingLastPathComponent];
      [v6 asset];
      v26 = id v33 = v12;
      [v26 setDirectory:v25];

      v27 = -[PLPrimaryResourceDataStoreReferenceFileKey initWithResourceType:]([PLPrimaryResourceDataStoreReferenceFileKey alloc], "initWithResourceType:", [v6 resourceType]);
      v28 = [(PLPrimaryResourceDataStoreReferenceFileKey *)v27 keyData];
      [v6 setDataStoreKeyData:v28];

      v29 = [v24 managedObjectContext];
      [v29 deleteObject:v24];

      id v12 = v33;
      id v18 = 0;
    }
    else
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v24 = v30;
      uint64_t v31 = *(void *)(a1 + 40);
      if (v31) {
        [v30 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F28328]];
      }
      if (v9) {
        [v24 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
      }
      [v24 setObject:@"Unable to create bookmark and volume" forKeyedSubscript:*MEMORY[0x1E4F28588]];
      id v18 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41014 userInfo:v24];
    }

    id v7 = v34;
    v4 = v36;
  }
LABEL_19:

LABEL_20:
  if (v18)
  {
    v32 = PLBackendGetLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v18;
      _os_log_impl(&dword_19B3C7000, v32, OS_LOG_TYPE_ERROR, "Unable to update internal resource. Error: %@", buf, 0xCu);
    }
  }
  else
  {
    MOCSaveAndReturnError(v3);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  sandbox_extension_release();
  (*(void (**)(void, BOOL, id))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48), v18 == 0, v18);
}

- (id)consolidateAssets:(id)a3 reply:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v41 = 0u;
  *(_OWORD *)sel = 0u;
  long long v40 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v40) = v8;
  if (v8)
  {
    id v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: consolidateAssets:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v40 + 1);
    *((void *)&v40 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v41 + 8));
  }
  int v11 = objc_msgSend(MEMORY[0x1E4F28F90], "discreteProgressWithTotalUnitCount:", objc_msgSend(v6, "count"));
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v13 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService consolidateAssets:reply:]");
  if (v13)
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __52__PLAssetsdResourceService_consolidateAssets_reply___block_invoke;
    v29[3] = &unk_1E58751C0;
    id v30 = v6;
    id v31 = v13;
    id v14 = v11;
    id v32 = v14;
    id v33 = self;
    id v34 = v12;
    id v35 = v7;
    [v31 performBlock:v29];
    id v15 = v14;

    id v16 = v30;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41012 userInfo:0];
    id v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v6, "count"));
    v28 = (void (**)(void, void *))v7;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v18 = v6;
    uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v43 count:16];
    if (v19)
    {
      uint64_t v20 = *(void *)v37;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v37 != v20) {
            objc_enumerationMutation(v18);
          }
          [v17 setObject:v16 forKeyedSubscript:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          objc_msgSend(v11, "setCompletedUnitCount:", objc_msgSend(v11, "completedUnitCount") + 1);
        }
        uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v43 count:16];
      }
      while (v19);
    }

    id v7 = v28;
    v28[2](v28, v17);
    id v22 = v11;
  }
  if ((_BYTE)v40) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v41 + 8));
  }
  if ((void)v41)
  {
    id v23 = PLRequestGetLog();
    v24 = v23;
    os_signpost_id_t v25 = v41;
    if ((unint64_t)(v41 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)buf = 136446210;
      uint64_t v45 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v24, OS_SIGNPOST_INTERVAL_END, v25, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
  return v11;
}

void __52__PLAssetsdResourceService_consolidateAssets_reply___block_invoke(uint64_t a1)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  +[PLManagedAsset assetsWithUUIDs:*(void *)(a1 + 32) options:0 inLibrary:*(void *)(a1 + 40)];
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
  if (v1)
  {
    uint64_t v3 = v1;
    uint64_t v4 = *(void *)v54;
    uint64_t v42 = *MEMORY[0x1E4F8C500];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    *(void *)&long long v2 = 138543362;
    long long v37 = v2;
    uint64_t v39 = *(void *)v54;
    do
    {
      uint64_t v5 = 0;
      uint64_t v40 = v3;
      do
      {
        if (*(void *)v54 != v4) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v53 + 1) + 8 * v5);
        id v7 = (void *)MEMORY[0x19F38D3B0]();
        uint64_t v45 = v6;
        if ([*(id *)(a1 + 48) isCancelled])
        {
          int v8 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v59 = v38;
          v60 = @"Consolidate operation cancelled";
          id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
          uint64_t v10 = [v8 errorWithDomain:v42 code:41001 userInfo:v9];
          uint64_t v46 = 0;
        }
        else
        {
          __int16 v43 = v7;
          uint64_t v44 = v5;
          int v11 = [v6 modernResources];
          long long v49 = 0u;
          long long v50 = 0u;
          long long v51 = 0u;
          long long v52 = 0u;
          id v9 = v11;
          uint64_t v12 = [v9 countByEnumeratingWithState:&v49 objects:v61 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v10 = 0;
            uint64_t v46 = 0;
            uint64_t v14 = *(void *)v50;
            while (2)
            {
              for (uint64_t i = 0; i != v13; ++i)
              {
                if (*(void *)v50 != v14) {
                  objc_enumerationMutation(v9);
                }
                id v16 = *(void **)(*((void *)&v49 + 1) + 8 * i);
                id v17 = (void *)MEMORY[0x19F38D3B0]();
                id v18 = [v16 fileSystemBookmark];

                if (v18)
                {
                  uint64_t v19 = *(void **)(a1 + 56);
                  uint64_t v20 = [v45 uuid];
                  uint64_t v21 = [v45 bundleScope];
                  id v48 = v10;
                  int v22 = [v19 _consolidateResource:v16 assetUUID:v20 bundleScope:v21 error:&v48];
                  id v23 = v48;

                  if (!v22)
                  {
                    uint64_t v10 = v23;
                    goto LABEL_23;
                  }
                  if ([v16 cplType] == 1)
                  {
                    id v24 = v16;

                    uint64_t v10 = v23;
                    uint64_t v46 = v24;
                  }
                  else
                  {
                    uint64_t v10 = v23;
                  }
                }
              }
              uint64_t v13 = [v9 countByEnumeratingWithState:&v49 objects:v61 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
          else
          {
            uint64_t v10 = 0;
            uint64_t v46 = 0;
          }
LABEL_23:

          objc_msgSend(*(id *)(a1 + 48), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 48), "completedUnitCount") + 1);
          uint64_t v4 = v39;
          uint64_t v3 = v40;
          id v7 = v43;
          uint64_t v5 = v44;
        }

        if (v10)
        {
LABEL_32:
          id v35 = *(void **)(a1 + 64);
          long long v36 = objc_msgSend(v45, "uuid", v37);
          [v35 setObject:v10 forKeyedSubscript:v36];

          goto LABEL_33;
        }
        uint64_t v25 = [v46 fileURL];
        if (v25)
        {
          v26 = (void *)v25;
          v27 = [*(id *)(a1 + 40) pathManager];
          v28 = [v26 path];
          v29 = [v28 stringByDeletingLastPathComponent];
          id v30 = objc_msgSend(v27, "assetAbbreviatedMetadataDirectoryForDirectory:type:bundleScope:", v29, 31, objc_msgSend(v45, "bundleScope"));

          id v31 = [v26 lastPathComponent];
          [v45 setDirectory:v30];
          [v45 setFilename:v31];
          objc_msgSend(v45, "setSavedAssetType:", objc_msgSend(MEMORY[0x1E4F8BA10], "defaultSavedAssetTypeForConsolidatedAssets"));
          [v45 recalculateImageRequestHints];
          [v45 persistMetadataToFilesystem];
        }
        else
        {
          id v33 = PLBackendGetLog();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
          {
            id v34 = [v45 uuid];
            *(_DWORD *)buf = v37;
            v58 = v34;
            _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "No mainFileURL for asset %{public}@", buf, 0xCu);
          }
          uint64_t v10 = [MEMORY[0x1E4F28C58] errorWithDomain:v42 code:41004 userInfo:0];
          if (v10) {
            goto LABEL_32;
          }
        }
        id v32 = objc_msgSend(*(id *)(a1 + 40), "managedObjectContext", v37);
        uint64_t v10 = MOCSaveAndReturnError(v32);

        if (v10) {
          goto LABEL_32;
        }
LABEL_33:

        ++v5;
      }
      while (v5 != v3);
      uint64_t v3 = [obj countByEnumeratingWithState:&v53 objects:v62 count:16];
    }
    while (v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
}

- (BOOL)_consolidateResource:(id)a3 assetUUID:(id)a4 bundleScope:(unsigned __int16)a5 error:(id *)a6
{
  uint64_t v6 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v29 = a4;
  uint64_t v37 = 0;
  uint64_t v38 = &v37;
  uint64_t v39 = 0x3032000000;
  uint64_t v40 = __Block_byref_object_copy__62306;
  long long v41 = __Block_byref_object_dispose__62307;
  id v42 = 0;
  uint64_t v10 = [v9 fileSystemBookmark];
  int v11 = [v10 fileSystemURL];

  if (v11)
  {
    uint64_t v12 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    v27 = [v12 pathManager];

    id v13 = objc_alloc(MEMORY[0x1E4F8B978]);
    uint64_t v14 = [v9 uniformTypeIdentifier];
    id v15 = [v14 identifier];
    uint64_t v16 = [v9 version];
    uint64_t v17 = [v9 resourceType];
    uint64_t v18 = [v9 recipeID];
    uint64_t v19 = [v11 lastPathComponent];
    uint64_t v20 = (void *)[v13 initWithAssetUuid:v29 bundleScope:v6 uti:v15 resourceVersion:v16 resourceType:v17 recipeID:v18 originalFilename:v19];

    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __77__PLAssetsdResourceService__consolidateResource_assetUUID_bundleScope_error___block_invoke;
    v30[3] = &unk_1E586C7E0;
    id v31 = v11;
    id v32 = v9;
    __int16 v36 = v6;
    id v21 = v27;
    id v33 = v21;
    id v35 = &v37;
    id v34 = v29;
    [v21 obtainAccessAndWaitWithFileWithIdentifier:v20 mode:2 toURLWithHandler:v30];
  }
  else
  {
    int v22 = PLBackendGetLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      id v23 = [v9 objectID];
      *(_DWORD *)buf = 138543618;
      uint64_t v44 = v23;
      __int16 v45 = 2114;
      id v46 = v29;
      _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_DEFAULT, "No source URL for internal resource %{public}@ for asset uuid %{public}@", buf, 0x16u);
    }
    uint64_t v24 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:41004 userInfo:MEMORY[0x1E4F1CC08]];
    id v21 = (id)v38[5];
    v38[5] = v24;
  }

  uint64_t v25 = (void *)v38[5];
  if (a6 && v25) {
    *a6 = v25;
  }

  _Block_object_dispose(&v37, 8);
  return v25 == 0;
}

void __77__PLAssetsdResourceService__consolidateResource_assetUUID_bundleScope_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = (const char *)[*(id *)(a1 + 32) fileSystemRepresentation];
    id v8 = v5;
    if (copyfile(v7, (const char *)[v8 fileSystemRepresentation], 0, 0x1000000u))
    {
      uint64_t v9 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:*__error() userInfo:0];
      uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
      int v11 = *(void **)(v10 + 40);
      *(void *)(v10 + 40) = v9;
    }
    else
    {
      id v15 = [*(id *)(a1 + 40) fileSystemBookmark];
      uint64_t v16 = [v15 managedObjectContext];
      [v16 deleteObject:v15];

      [*(id *)(a1 + 40) setFileSystemBookmark:0];
      [*(id *)(a1 + 40) setFileSystemVolume:0];
      uint64_t v17 = [PLPrimaryResourceDataStoreUniformFileKey alloc];
      uint64_t v18 = [v8 path];
      uint64_t v19 = -[PLPrimaryResourceDataStoreUniformFileKey initWithFilePath:resourceVersion:resourceType:recipeID:bundleScope:pathManager:](v17, "initWithFilePath:resourceVersion:resourceType:recipeID:bundleScope:pathManager:", v18, [*(id *)(a1 + 40) version], objc_msgSend(*(id *)(a1 + 40), "resourceType"), objc_msgSend(*(id *)(a1 + 40), "recipeID"), *(unsigned __int16 *)(a1 + 72), *(void *)(a1 + 48));

      uint64_t v20 = [(PLPrimaryResourceDataStoreUniformFileKey *)v19 keyData];
      [*(id *)(a1 + 40) setDataStoreKeyData:v20];
    }
  }
  else
  {
    uint64_t v12 = PLBackendGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      id v13 = [*(id *)(a1 + 40) objectID];
      uint64_t v14 = *(void *)(a1 + 56);
      int v21 = 138543618;
      int v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = v14;
      _os_log_impl(&dword_19B3C7000, v12, OS_LOG_TYPE_ERROR, "Error obtaining write URL for internal resource %{public}@ for asset UUID %@", (uint8_t *)&v21, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a3);
  }
}

- (void)translatePersistentURL:(id)a3 withAdjustments:(BOOL)a4 handler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = (void (**)(void, void))v9;
  if (!v8) {
    (*((void (**)(id, void))v9 + 2))(v9, 0);
  }
  int v11 = [v8 scheme];
  if (([v11 isEqualToString:@"ipod-library"] & 1) == 0)
  {

    goto LABEL_8;
  }
  uint64_t v12 = [getMPMediaLibraryClass() defaultMediaLibrary];
  int v13 = [v12 isValidAssetURL:v8];

  if (!v13)
  {
LABEL_8:
    uint64_t v17 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    uint64_t v18 = [v17 databaseContext];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__PLAssetsdResourceService_translatePersistentURL_withAdjustments_handler___block_invoke;
    v19[3] = &unk_1E586C7B8;
    BOOL v22 = a4;
    id v20 = v8;
    int v21 = v10;
    [v18 perform:v19 withName:"-[PLAssetsdResourceService translatePersistentURL:withAdjustments:handler:]"];

    goto LABEL_11;
  }
  uint64_t v14 = [getMPMediaLibraryClass() defaultMediaLibrary];
  id v15 = [v14 pathForAssetURL:v8];

  if (v15)
  {
    uint64_t v16 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15 isDirectory:0];
  }
  else
  {
    uint64_t v16 = 0;
  }
  ((void (**)(void, void *))v10)[2](v10, v16);

LABEL_11:
}

void __75__PLAssetsdResourceService_translatePersistentURL_withAdjustments_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (!*(unsigned char *)(a1 + 48)) {
    goto LABEL_10;
  }
  uint64_t v4 = +[PLManagedAsset photoFromAssetURL:*(void *)(a1 + 32) photoLibrary:v3];
  if ([v4 isPhoto])
  {
    id v9 = 0;
    id v5 = +[PLResourceChooser fileReservationForLargeDisplayableImageFileForAsset:v4 format:0 allowMetadataSnapshot:0 forceLarge:1 outFilePath:&v9 outImageType:0];
    id v6 = v9;
  }
  else
  {
    if (![v4 isVideo])
    {
LABEL_9:

LABEL_10:
      id v8 = +[PLManagedAsset fileURLFromAssetURL:*(void *)(a1 + 32) photoLibrary:v3];
      goto LABEL_11;
    }
    id v6 = [v4 pathForVideoFile];
  }
  id v7 = v6;
  if (!v6) {
    goto LABEL_9;
  }
  id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v6 isDirectory:0];

  if (!v8) {
    goto LABEL_10;
  }
LABEL_11:
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)_typeFromPathConstrainedToImageOrMovie:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = [v3 pathExtension];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v6 = *MEMORY[0x1E4F44448];
    v19[0] = *MEMORY[0x1E4F44400];
    v19[1] = v6;
    id v7 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", v19, 2, 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
LABEL_4:
      uint64_t v11 = 0;
      while (1)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = [MEMORY[0x1E4F442D8] typeWithFilenameExtension:v5 conformingToType:*(void *)(*((void *)&v15 + 1) + 8 * v11)];
        int v13 = v12;
        if (v12)
        {
          if (![v12 isDynamic]) {
            break;
          }
        }

        if (v9 == ++v11)
        {
          uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v20 count:16];
          if (v9) {
            goto LABEL_4;
          }
          goto LABEL_11;
        }
      }
    }
    else
    {
LABEL_11:
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
  }

  return v13;
}

- (void)downloadCloudSharedAsset:(id)a3 wantedPlaceholderkind:(signed __int16)a4 shouldPrioritize:(BOOL)a5 shouldExtendTimer:(BOOL)a6 reply:(id)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  long long v40 = 0u;
  *(_OWORD *)sel = 0u;
  long long v39 = 0u;
  int v14 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v39) = v14;
  if (v14)
  {
    long long v15 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: downloadCloudSharedAsset:wantedPlaceholderkind:shouldPrioritize:shouldExtendTimer:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v16 = (void *)*((void *)&v39 + 1);
    *((void *)&v39 + 1) = v15;

    os_activity_scope_enter(v15, (os_activity_scope_state_t)((char *)&v40 + 8));
  }
  long long v17 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  long long v18 = [v17 persistentStoreCoordinator];

  uint64_t v19 = [v18 managedObjectIDForURIRepresentation:v12];
  id v20 = v19;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  if (v19 && ([v19 isTemporaryID] & 1) == 0)
  {
    uint64_t v21 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
    BOOL v22 = [v21 databaseContext];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke;
    v31[3] = &unk_1E586C790;
    id v32 = v20;
    p_long long buf = &buf;
    signed __int16 v36 = a4;
    id v33 = self;
    id v34 = v13;
    BOOL v37 = a5;
    BOOL v38 = a6;
    [v22 performSync:v31 withName:"-[PLAssetsdResourceService downloadCloudSharedAsset:wantedPlaceholderkind:shouldPrioritize:shouldExtendTimer:reply:]"];
  }
  if (!*(unsigned char *)(*((void *)&buf + 1) + 24))
  {
    __int16 v23 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    uint64_t v24 = [NSString stringWithFormat:@"Invalid cloud shared asset for download"];
    __int16 v43 = v24;
    uint64_t v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v43 forKeys:&v42 count:1];
    v26 = [v23 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v25];

    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v26);
  }
  _Block_object_dispose(&buf, 8);

  if ((_BYTE)v39) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v40 + 8));
  }
  if ((void)v40)
  {
    v27 = PLRequestGetLog();
    v28 = v27;
    os_signpost_id_t v29 = v40;
    if ((unint64_t)(v40 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v28, OS_SIGNPOST_INTERVAL_END, v29, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke(uint64_t a1, void *a2)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[PLManagedAsset assetWithObjectID:*(void *)(a1 + 32) inLibrary:v3];
  id v5 = v4;
  if (v4 && ([v4 isDeleted] & 1) == 0 && objc_msgSend(v5, "isCloudSharedAsset"))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    unsigned int v6 = *(unsigned __int16 *)(a1 + 64);
    uint64_t v7 = (__int16)v6;
    if (v6 <= 9 && ((1 << v6) & 0x3B8) != 0)
    {
      id v8 = [v5 cloudSharedAssetPathForPlaceholderKind:v7];
      if (v8)
      {
        uint64_t v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        int v10 = [v9 fileExistsAtPath:v8];

        if (v10)
        {
          uint64_t v11 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v8 isDirectory:0];
          (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_11:
          goto LABEL_12;
        }
      }
    }
    else
    {
      id v12 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v32 = *MEMORY[0x1E4F28568];
      id v13 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid placeholderKind %d to request cloud shared asset download", v7);
      v33[0] = v13;
      int v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
      long long v15 = [v12 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v14];

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      id v8 = 0;
    }
    pl_dispatch_once();
    long long v16 = [v5 uuid];
    long long v17 = +[PLPhotoSharingHelper downloadNotificationForAssetwithUUID:v16 cloudPlaceholderKind:*(__int16 *)(a1 + 64)];

    int v31 = 0;
    uint64_t v25 = 0;
    v26 = &v25;
    uint64_t v27 = 0x3032000000;
    v28 = __Block_byref_object_copy__62306;
    os_signpost_id_t v29 = __Block_byref_object_dispose__62307;
    dispatch_group_t v30 = dispatch_group_create();
    dispatch_group_enter((dispatch_group_t)v26[5]);
    long long v18 = v26[5];
    uint64_t v19 = PLResourceModelValidationErrorUserInfoTableEntryIndex_block_invoke_mediaStreamDownloadQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_3;
    block[3] = &unk_1E58742F0;
    id v8 = v8;
    id v23 = v8;
    id v24 = *(id *)(a1 + 48);
    dispatch_group_notify(v18, v19, block);
    id v20 = v17;
    [v20 UTF8String];
    id v21 = v20;
    pl_notify_register_dispatch();
    dispatch_time(0, 300000000000);
    pl_dispatch_after();
    +[PLPhotoSharingHelper downloadAsset:v5 cloudPlaceholderKind:*(__int16 *)(a1 + 64) shouldPrioritize:*(unsigned __int8 *)(a1 + 66) shouldExtendTimer:*(unsigned __int8 *)(a1 + 67)];

    _Block_object_dispose(&v25, 8);
    goto LABEL_11;
  }
LABEL_12:
}

void __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32)
    && ([MEMORY[0x1E4F28CB8] defaultManager],
        long long v2 = objc_claimAutoreleasedReturnValue(),
        int v3 = [v2 fileExistsAtPath:*(void *)(a1 + 32)],
        v2,
        v3))
  {
    uint64_t v4 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(a1 + 32) isDirectory:0];
  }
  else
  {
    uint64_t v4 = 0;
  }
  id v5 = (id)v4;
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_4(void *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = PLBackendGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = a1[4];
    uint64_t v6 = a1[5];
    int v11 = 138412546;
    uint64_t v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEFAULT, "%@: Notified from assetsd for shared asset download notification %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v7 = *(void *)(a1[6] + 8);
  id v8 = *(NSObject **)(v7 + 40);
  if (v8)
  {
    dispatch_group_leave(v8);
    uint64_t v7 = *(void *)(a1[6] + 8);
    uint64_t v9 = *(void **)(v7 + 40);
  }
  else
  {
    uint64_t v9 = 0;
  }
  *(void *)(v7 + 40) = 0;

  return notify_cancel(a2);
}

uint64_t __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_106(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
  int v3 = *(NSObject **)(v2 + 40);
  if (v3)
  {
    dispatch_group_leave(v3);
    uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 8);
    uint64_t v4 = *(void **)(v2 + 40);
  }
  else
  {
    uint64_t v4 = 0;
  }
  *(void *)(v2 + 40) = 0;

  int v5 = *(_DWORD *)(a1 + 40);
  return notify_cancel(v5);
}

void __116__PLAssetsdResourceService_downloadCloudSharedAsset_wantedPlaceholderkind_shouldPrioritize_shouldExtendTimer_reply___block_invoke_2()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.assetsd.mediastreamdownloadqueue", 0);
  uint64_t v1 = (void *)PLResourceModelValidationErrorUserInfoTableEntryIndex_block_invoke_mediaStreamDownloadQueue;
  PLResourceModelValidationErrorUserInfoTableEntryIndex_block_invoke_mediaStreamDownloadQueue = (uint64_t)v0;
}

- (void)estimatedFileLengthOfVideo:(id)a3 fallbackFilePath:(id)a4 exportPreset:(id)a5 exportProperties:(id)a6 reply:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  long long v16 = (void (**)(id, int64_t))a7;
  long long v26 = 0u;
  *(_OWORD *)sel = 0u;
  long long v24 = 0u;
  int v17 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v24) = v17;
  if (v17)
  {
    *((void *)&v24 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: estimatedFileLengthOfVideo:fallbackFilePath:exportPreset:exportProperties:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v24 + 1), (os_activity_scope_state_t)((char *)&v26 + 8));
  }
  long long v18 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v19 = [v18 databaseContext];
  id v20 = (void *)[v19 newShortLivedLibraryWithName:"-[PLAssetsdResourceService estimatedFileLengthOfVideo:fallbackFilePath:exportPreset:exportProperties:reply:]"];

  v16[2](v16, +[PLAssetSharingUtilities estimatedOutputFileLengthForVideoURL:v12 library:v20 fallbackFilePath:v13 exportPreset:v14 exportProperties:v15]);
  if (v25) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v26 + 8));
  }
  if ((void)v26)
  {
    id v21 = PLRequestGetLog();
    BOOL v22 = v21;
    if ((unint64_t)(v26 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      os_signpost_id_t v29 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v26, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (void)asynchronousAdjustmentDataForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 reply:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v27 = 0u;
  *(_OWORD *)sel = 0u;
  long long v26 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v26) = v10;
  if (v10)
  {
    int v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: asynchronousAdjustmentDataForAsset:networkAccessAllowed:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v12 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  id v13 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v14 = [v13 databaseContext];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke;
  v21[3] = &unk_1E586C718;
  id v15 = v8;
  BOOL v25 = a4;
  id v22 = v15;
  id v23 = self;
  id v16 = v9;
  id v24 = v16;
  [v14 perform:v21 withName:"-[PLAssetsdResourceService asynchronousAdjustmentDataForAsset:networkAccessAllowed:reply:]"];

  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    int v17 = PLRequestGetLog();
    long long v18 = v17;
    os_signpost_id_t v19 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v30 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v18, OS_SIGNPOST_INTERVAL_END, v19, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = (void *)MEMORY[0x19F38D3B0]();
  int v5 = [v3 managedObjectContext];
  uint64_t v6 = [v5 persistentStoreCoordinator];

  uint64_t v7 = [v6 managedObjectIDForURIRepresentation:*(void *)(a1 + 32)];
  id v8 = [v3 libraryServicesManager];
  id v9 = [v8 cloudPhotoLibraryManager];

  char v10 = 0;
  if (*(unsigned char *)(a1 + 56) && v9)
  {
    int v11 = [*(id *)(a1 + 40) libraryServicesManager];
    char v10 = [v11 isCloudPhotoLibraryEnabled];
  }
  id v12 = +[PLManagedAsset assetWithObjectID:v7 inLibrary:v3];
  id v13 = [v12 uuid];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  void v19[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_2;
  v19[3] = &unk_1E586C6F0;
  id v14 = *(id *)(a1 + 48);
  id v20 = v13;
  id v21 = v9;
  uint64_t v15 = *(void *)(a1 + 40);
  id v22 = v12;
  uint64_t v23 = v15;
  id v24 = v14;
  char v25 = v10;
  id v16 = v12;
  id v17 = v9;
  id v18 = v13;
  [v16 synchronouslyFetchAdjustmentDataWithCompletionHandler:v19];
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4, uint64_t a5, void *a6, uint64_t a7, void *a8, void *a9)
{
  uint64_t v141 = *MEMORY[0x1E4F143B8];
  id v15 = a2;
  id v16 = a3;
  id v17 = a4;
  id v77 = a6;
  id v75 = a8;
  id v76 = a9;
  uint64_t v133 = 0;
  v134 = &v133;
  uint64_t v135 = 0x2020000000;
  char v136 = 0;
  v131[0] = 0;
  v131[1] = v131;
  v131[2] = 0x3032000000;
  v131[3] = __Block_byref_object_copy__62306;
  v131[4] = __Block_byref_object_dispose__62307;
  id v18 = v15;
  id v132 = v18;
  v129[0] = 0;
  v129[1] = v129;
  v129[2] = 0x3032000000;
  v129[3] = __Block_byref_object_copy__62306;
  v129[4] = __Block_byref_object_dispose__62307;
  id v78 = v16;
  id v130 = v78;
  v127[0] = 0;
  v127[1] = v127;
  v127[2] = 0x3032000000;
  v127[3] = __Block_byref_object_copy__62306;
  v127[4] = __Block_byref_object_dispose__62307;
  id v19 = v17;
  id v128 = v19;
  uint64_t v121 = 0;
  v122 = &v121;
  uint64_t v123 = 0x3032000000;
  v124 = __Block_byref_object_copy__62306;
  v125 = __Block_byref_object_dispose__62307;
  id v126 = 0;
  uint64_t v115 = 0;
  v116 = &v115;
  uint64_t v117 = 0x3032000000;
  v118 = __Block_byref_object_copy__62306;
  v119 = __Block_byref_object_dispose__62307;
  id v120 = 0;
  v113[0] = 0;
  v113[1] = v113;
  v113[2] = 0x3032000000;
  v113[3] = __Block_byref_object_copy__62306;
  v113[4] = __Block_byref_object_dispose__62307;
  id v114 = 0;
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3;
  v103[3] = &unk_1E586C630;
  id v104 = *(id *)(a1 + 64);
  v105 = v131;
  v106 = v129;
  v107 = v127;
  uint64_t v20 = a5;
  v111 = v113;
  uint64_t v112 = a5;
  v108 = &v133;
  v109 = &v121;
  id v21 = v77;
  v110 = &v115;
  id v22 = v19;
  uint64_t v23 = (void (**)(void))MEMORY[0x19F38D650](v103);
  uint64_t v99 = 0;
  v100 = &v99;
  uint64_t v101 = 0x2020000000;
  char v102 = 0;
  if ([v77 length])
  {
    id v24 = v77;
    int v25 = open((const char *)[v24 fileSystemRepresentation], 0);
    if ((v25 & 0x80000000) == 0)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F8BA28]);
      xpc_object_t v27 = xpc_fd_create(v25);
      uint64_t v28 = [v26 initWithXPCObject:v27];
      os_signpost_id_t v29 = (void *)v122[5];
      v122[5] = v28;

      close(v25);
      *((unsigned char *)v100 + 24) = 1;
      goto LABEL_38;
    }
    context = (void *)MEMORY[0x19F38D3B0]();
    uint64_t v30 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v138 = v31;
      _os_log_impl(&dword_19B3C7000, v30, OS_LOG_TYPE_ERROR, "Couldn't open adjustment file for asset %{public}@", buf, 0xCu);
    }

    if (!*(void *)(a1 + 40)
      || ([*(id *)(a1 + 48) photoLibrary],
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          int v33 = [v32 isCloudPhotoLibraryEnabled],
          v32,
          !v33))
    {
LABEL_21:
      if (!*((unsigned char *)v100 + 24))
      {
        if ([*(id *)(a1 + 48) isVideo])
        {
          if (([*(id *)(a1 + 48) migrateLegacyVideoAdjustments] & 1) == 0)
          {
            long long v49 = PLGatekeeperXPCGetLog();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v50 = *(void *)(a1 + 32);
              *(_DWORD *)long long buf = 138543618;
              uint64_t v138 = v50;
              __int16 v139 = 2112;
              v140 = @"NO";
              _os_log_impl(&dword_19B3C7000, v49, OS_LOG_TYPE_DEFAULT, "Set default adjustments for asset %{public}@: %@", buf, 0x16u);
            }

            if (![*(id *)(a1 + 48) setDefaultAdjustmentsIfNecessaryWithMainFileMetadata:0])goto LABEL_37; {
          }
            }
          long long v51 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v52 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138543362;
            uint64_t v138 = v52;
            _os_log_impl(&dword_19B3C7000, v51, OS_LOG_TYPE_DEFAULT, "Recovered adjustment for %{public}@", buf, 0xCu);
          }

          int v53 = open((const char *)[v24 fileSystemRepresentation], 0);
          if ((v53 & 0x80000000) == 0)
          {
            id v54 = objc_alloc(MEMORY[0x1E4F8BA28]);
            xpc_object_t v55 = xpc_fd_create(v53);
            uint64_t v56 = [v54 initWithXPCObject:v55];
            v57 = (void *)v122[5];
            v122[5] = v56;

            close(v53);
            *((unsigned char *)v100 + 24) = 1;
            goto LABEL_37;
          }
          v58 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Couldn't open adjustment file from recovered adjustment", buf, 2u);
          }
        }
        else
        {
          v58 = PLGatekeeperXPCGetLog();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
          {
            uint64_t v59 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138543362;
            uint64_t v138 = v59;
            _os_log_impl(&dword_19B3C7000, v58, OS_LOG_TYPE_ERROR, "Unsupported asset %{public}@ to recover adjustment", buf, 0xCu);
          }
        }
      }
LABEL_37:
      goto LABEL_38;
    }
    id v34 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v35 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v138 = v35;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_DEFAULT, "Trying to recover adjustment from CPL for for asset %{public}@", buf, 0xCu);
    }

    dispatch_semaphore_t v36 = dispatch_semaphore_create(0);
    BOOL v38 = *(void **)(a1 + 40);
    uint64_t v37 = *(void *)(a1 + 48);
    v87[0] = MEMORY[0x1E4F143A8];
    v87[1] = 3221225472;
    v87[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_87;
    v87[3] = &unk_1E586C658;
    id v88 = v18;
    v93 = v131;
    id v89 = v78;
    v94 = v129;
    id v90 = v22;
    v95 = v127;
    uint64_t v98 = v20;
    id v91 = v24;
    v96 = &v121;
    v97 = &v99;
    long long v39 = v36;
    v92 = v39;
    [v38 fetchAdjustmentDataForAsset:v37 completionHandler:v87];
    dispatch_time_t v40 = dispatch_time(0, 10000000000);
    intptr_t v41 = dispatch_semaphore_wait(v39, v40);
    if (*((unsigned char *)v100 + 24))
    {
      uint64_t v42 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v43 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543362;
        uint64_t v138 = v43;
        uint64_t v44 = "Recovered adjustment from CPL for for asset %{public}@";
        uint64_t v45 = v42;
        os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
LABEL_19:
        _os_log_impl(&dword_19B3C7000, v45, v46, v44, buf, 0xCu);
      }
LABEL_20:

      goto LABEL_21;
    }
    if (v41)
    {
      uint64_t v42 = PLGatekeeperXPCGetLog();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      uint64_t v47 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v138 = v47;
      uint64_t v44 = "Timed out waiting for CPL to recover adjustment data for asset %{public}@";
    }
    else
    {
      uint64_t v42 = PLGatekeeperXPCGetLog();
      if (!os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        goto LABEL_20;
      }
      uint64_t v48 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v138 = v48;
      uint64_t v44 = "Couldn't open adjustment file fetched from CPL for asset %{public}@";
    }
    uint64_t v45 = v42;
    os_log_type_t v46 = OS_LOG_TYPE_ERROR;
    goto LABEL_19;
  }
LABEL_38:
  if ([v77 length])
  {
    v60 = [*(id *)(a1 + 48) assetResourceForCPLType:13];
    if (!v60
      || ([*(id *)(a1 + 56) libraryServicesManager],
          v61 = objc_claimAutoreleasedReturnValue(),
          int v62 = [v61 isCloudPhotoLibraryEnabled],
          v61,
          !v62))
    {
      v23[2](v23);
LABEL_51:

      goto LABEL_52;
    }
    *((unsigned char *)v134 + 24) = 1;
    uint64_t v63 = [*(id *)(a1 + 48) pathForAdjustmentDataFile];
    v64 = v63;
    if (v63)
    {
      id v65 = v63;
      int v66 = open((const char *)[v65 fileSystemRepresentation], 0);
      if (v66 < 0)
      {
        if (*(unsigned char *)(a1 + 72))
        {
          v71 = *(void **)(a1 + 40);
          uint64_t v73 = *(void *)(a1 + 48);
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_90;
          v84[3] = &unk_1E586C680;
          v86 = v113;
          v85 = v23;
          v79[0] = MEMORY[0x1E4F143A8];
          v79[1] = 3221225472;
          v79[2] = __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3_94;
          v79[3] = &unk_1E586C6C8;
          v82 = v113;
          id v80 = v65;
          v83 = &v115;
          v81 = v85;
          id v21 = v77;
          [v71 downloadAsset:v73 resourceType:13 masterResourceOnly:0 highPriority:1 clientBundleID:0 proposedTaskIdentifier:0 taskDidBeginHandler:v84 progressBlock:&__block_literal_global_62410 completionHandler:v79];

          goto LABEL_50;
        }
        v72 = (void *)v122[5];
        v122[5] = 0;
      }
      else
      {
        id v67 = objc_alloc(MEMORY[0x1E4F8BA28]);
        xpc_object_t v68 = xpc_fd_create(v66);
        uint64_t v69 = [v67 initWithXPCObject:v68];
        v70 = (void *)v116[5];
        v116[5] = v69;

        close(v66);
      }
    }
    v23[2](v23);
LABEL_50:

    goto LABEL_51;
  }
  v23[2](v23);
LABEL_52:
  _Block_object_dispose(&v99, 8);

  _Block_object_dispose(v113, 8);
  _Block_object_dispose(&v115, 8);

  _Block_object_dispose(&v121, 8);
  _Block_object_dispose(v127, 8);

  _Block_object_dispose(v129, 8);
  _Block_object_dispose(v131, 8);

  _Block_object_dispose(&v133, 8);
}

uint64_t __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void, void, void, void))(a1[4] + 16))(a1[4], *(void *)(*(void *)(a1[5] + 8) + 40), *(void *)(*(void *)(a1[6] + 8) + 40), *(void *)(*(void *)(a1[7] + 8) + 40), a1[12], *(unsigned __int8 *)(*(void *)(a1[8] + 8) + 24), *(void *)(*(void *)(a1[9] + 8) + 40), *(void *)(*(void *)(a1[10] + 8) + 40), *(void *)(*(void *)(a1[11] + 8) + 40));
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_87(uint64_t a1, void *a2, void *a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v26 = a3;
  uint64_t v6 = PLGatekeeperXPCGetLog();
  uint64_t v7 = v6;
  if (!v5 || v26)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v28 = v26;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_ERROR, "Couldn't fetch adjustment from CPL: %@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [v5 adjustmentSimpleDescription];
      *(_DWORD *)long long buf = 138412290;
      id v28 = v8;
      _os_log_impl(&dword_19B3C7000, v7, OS_LOG_TYPE_DEFAULT, "Recovered adjustments %@ from CPL.", buf, 0xCu);
    }
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    id obj = [v5 adjustmentType];
    if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:") & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), obj);
    }
    [v7 setObject:obj forKey:*MEMORY[0x1E4F8BA68]];
    id v9 = [v5 adjustmentCompoundVersion];
    if (([*(id *)(a1 + 40) isEqualToString:v9] & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v9);
    }
    [v7 setObject:v9 forKey:*MEMORY[0x1E4F8BA70]];
    char v10 = [v5 adjustmentCreatorCode];
    if (([v10 isEqualToString:*(void *)(a1 + 48)] & 1) == 0) {
      objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 88) + 8) + 40), v10);
    }
    if (v10) {
      [v7 setObject:v10 forKey:*MEMORY[0x1E4F8BA60]];
    }
    int v11 = [v5 adjustmentTimestamp];
    if (v11) {
      [v7 setObject:v11 forKey:*MEMORY[0x1E4F8BA80]];
    }
    id v12 = [NSNumber numberWithInteger:*(void *)(a1 + 112)];
    [v7 setObject:v12 forKey:*MEMORY[0x1E4F8BA50]];

    uint64_t v13 = [v5 simpleAdjustmentData];
    if (v13) {
      [v7 setObject:v13 forKey:*MEMORY[0x1E4F8BA58]];
    }
    id v24 = (void *)v13;
    id v14 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v7 format:100 options:0 error:0];
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v16 = [*(id *)(a1 + 56) stringByDeletingLastPathComponent];
    [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:0];

    if (v14) {
      [v14 writeToFile:*(void *)(a1 + 56) options:1073741825 error:0];
    }
    int v17 = open((const char *)[*(id *)(a1 + 56) fileSystemRepresentation], 0);
    if ((v17 & 0x80000000) == 0)
    {
      int v18 = v17;
      id v19 = objc_alloc(MEMORY[0x1E4F8BA28]);
      xpc_object_t v20 = xpc_fd_create(v18);
      uint64_t v21 = [v19 initWithXPCObject:v20];
      uint64_t v22 = *(void *)(*(void *)(a1 + 96) + 8);
      uint64_t v23 = *(void **)(v22 + 40);
      *(void *)(v22 + 40) = v21;

      close(v18);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 104) + 8) + 24) = 1;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 64));
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_90(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  if (v6)
  {
    id v7 = v6;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a4);
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    id v6 = v7;
  }
}

void __90__PLAssetsdResourceService_asynchronousAdjustmentDataForAsset_networkAccessAllowed_reply___block_invoke_3_94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v14 = a5;
  if (v14)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a5);
  }
  else
  {
    int v7 = open((const char *)[*(id *)(a1 + 32) fileSystemRepresentation], 0);
    if ((v7 & 0x80000000) == 0)
    {
      int v8 = v7;
      id v9 = objc_alloc(MEMORY[0x1E4F8BA28]);
      xpc_object_t v10 = xpc_fd_create(v8);
      uint64_t v11 = [v9 initWithXPCObject:v10];
      uint64_t v12 = *(void *)(*(void *)(a1 + 56) + 8);
      uint64_t v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      close(v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)getSandboxExtensionForFileSystemBookmark:(id)a3 reply:(id)a4
{
  v44[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void (**)(id, BOOL, uint64_t, void *, uint64_t))a4;
  uint64_t v35 = 0;
  dispatch_semaphore_t v36 = &v35;
  uint64_t v37 = 0x3032000000;
  BOOL v38 = __Block_byref_object_copy__62306;
  long long v39 = __Block_byref_object_dispose__62307;
  id v40 = 0;
  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = __Block_byref_object_copy__62306;
  int v33 = __Block_byref_object_dispose__62307;
  id v34 = 0;
  int v8 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v9 = [v8 databaseContext];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __75__PLAssetsdResourceService_getSandboxExtensionForFileSystemBookmark_reply___block_invoke;
  v25[3] = &unk_1E586C608;
  id v10 = v6;
  id v26 = v10;
  xpc_object_t v27 = &v29;
  id v28 = &v35;
  [v9 performSync:v25 withName:"-[PLAssetsdResourceService getSandboxExtensionForFileSystemBookmark:reply:]"];

  uint64_t v11 = (void *)v30[5];
  if (!v11)
  {
    if (!v36[5])
    {
      id v15 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v41 = *MEMORY[0x1E4F28568];
      uint64_t v42 = @"Unable to resolve bookmark URL";
      id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v42 forKeys:&v41 count:1];
      uint64_t v17 = [v15 errorWithDomain:*MEMORY[0x1E4F8C500] code:41014 userInfo:v16];
      int v18 = (void *)v36[5];
      v36[5] = v17;
    }
    goto LABEL_9;
  }
  id v12 = [v11 path];
  [v12 fileSystemRepresentation];
  uint64_t v13 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
  id v14 = v13;
  if (v13) {
    [v13 clientAuditToken];
  }
  id v19 = (void *)sandbox_extension_issue_file_to_process();

  if (!v19)
  {
    uint64_t v21 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v43 = *MEMORY[0x1E4F28568];
    v44[0] = @"Unable to extend sandbox for bookmark URL";
    uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v44 forKeys:&v43 count:1];
    uint64_t v23 = [v21 errorWithDomain:*MEMORY[0x1E4F8C500] code:41010 userInfo:v22];
    id v24 = (void *)v36[5];
    v36[5] = v23;

LABEL_9:
    xpc_object_t v20 = 0;
    goto LABEL_10;
  }
  xpc_object_t v20 = [NSString stringWithUTF8String:v19];
  free(v19);
LABEL_10:
  v7[2](v7, v20 != 0, v30[5], v20, v36[5]);

  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v35, 8);
}

void __75__PLAssetsdResourceService_getSandboxExtensionForFileSystemBookmark_reply___block_invoke(void *a1, void *a2)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [v3 managedObjectContext];
  id v5 = [v4 persistentStoreCoordinator];

  id v6 = [v5 managedObjectIDForURIRepresentation:a1[4]];
  if (v6)
  {
    int v7 = [v3 managedObjectContext];
    int v8 = [v7 objectWithID:v6];

    uint64_t v9 = [v8 fileSystemURL];
    uint64_t v10 = *(void *)(a1[5] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    id v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    id v14 = [NSString stringWithFormat:@"objectID is null for FileSystemBookmark objectURI %@", a1[4], *MEMORY[0x1E4F28568]];
    v20[0] = v14;
    id v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    uint64_t v16 = [v12 errorWithDomain:v13 code:41014 userInfo:v15];
    uint64_t v17 = *(void *)(a1[6] + 8);
    int v18 = *(void **)(v17 + 40);
    *(void *)(v17 + 40) = v16;
  }
}

- (BOOL)_allowSandboxExtensionForSessionIdentifier:(id)a3 captureSessionState:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  char v7 = 1;
  switch([v6 type])
  {
    case 0:
      goto LABEL_13;
    case 1:
    case 3:
      goto LABEL_14;
    case 2:
      uint64_t v8 = objc_opt_class();
      id v9 = v6;
      if (!v9) {
        goto LABEL_8;
      }
      if (objc_opt_isKindOfClass()) {
        uint64_t v10 = v9;
      }
      else {
        uint64_t v10 = 0;
      }
      id v11 = v10;
      if (!v11)
      {
        id v12 = [MEMORY[0x1E4F28B00] currentHandler];
        uint64_t v13 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable _PLAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nullable __strong)");
        [v12 handleFailureInFunction:v13, @"PLHelperExtension.h", 78, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];

LABEL_8:
        id v11 = 0;
      }

      id v14 = [v11 sessionIdentifier];
      char v7 = [v14 isEqual:v5];

LABEL_14:
      return v7;
    default:
      id v15 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v18 = v6;
        _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Capture Session: Unexpected state for sandbox extensions: %{public}@", buf, 0xCu);
      }

LABEL_13:
      char v7 = 0;
      goto LABEL_14;
  }
}

- (BOOL)_allowSandboxExtensionForAsset:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
    id v6 = [v5 captureSessionState];

    if (v6)
    {
      char v7 = [v4 captureSessionIdentifier];
      BOOL v8 = [(PLAssetsdResourceService *)self _allowSandboxExtensionForSessionIdentifier:v7 captureSessionState:v6];
    }
    else
    {
      id v9 = PLGatekeeperXPCGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_19B3C7000, v9, OS_LOG_TYPE_ERROR, "Capture Session: State is unexpectedly nil, disallowing sandbox extensions for resources", v11, 2u);
      }

      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)getSandboxExtensionsForAssetWithUUID:(id)a3 reply:(id)a4
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v42 = (void (**)(id, uint64_t, void *, void))a4;
  long long v67 = 0u;
  *(_OWORD *)sel = 0u;
  long long v66 = 0u;
  int v7 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v66) = v7;
  if (v7)
  {
    BOOL v8 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: getSandboxExtensionsForAssetWithUUID:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v9 = (void *)*((void *)&v66 + 1);
    *((void *)&v66 + 1) = v8;

    os_activity_scope_enter(v8, (os_activity_scope_state_t)((char *)&v67 + 8));
  }
  uint64_t v62 = 0;
  uint64_t v63 = &v62;
  uint64_t v64 = 0x2020000000;
  char v65 = 0;
  *(void *)&long long v76 = 0;
  *((void *)&v76 + 1) = &v76;
  uint64_t v77 = 0x3032000000;
  id v78 = __Block_byref_object_copy__62306;
  v79 = __Block_byref_object_dispose__62307;
  id v80 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  uint64_t v59 = __Block_byref_object_copy__62306;
  v60 = __Block_byref_object_dispose__62307;
  id v61 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v10 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
  id v11 = [v10 fetchFilterIdentifier];

  id v12 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
  char v13 = [v12 isClientInFullLibraryMode];

  id v14 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  id v15 = [v14 databaseContext];
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = __71__PLAssetsdResourceService_getSandboxExtensionsForAssetWithUUID_reply___block_invoke;
  v48[3] = &unk_1E586C5E0;
  char v55 = v13;
  id v41 = v11;
  id v49 = v41;
  id v40 = v6;
  id v50 = v40;
  long long v51 = self;
  uint64_t v52 = &v76;
  int v53 = &v56;
  id v54 = &v62;
  [v15 performSync:v48 withName:"-[PLAssetsdResourceService getSandboxExtensionsForAssetWithUUID:reply:]"];

  if (*((unsigned char *)v63 + 24))
  {
    uint64_t v16 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v17 = (id)v57[5];
    uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v75 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v45;
      do
      {
        uint64_t v20 = 0;
        uint64_t v43 = v18;
        do
        {
          if (*(void *)v45 != v19) {
            objc_enumerationMutation(v17);
          }
          uint64_t v21 = *(void **)(*((void *)&v44 + 1) + 8 * v20);
          uint64_t v22 = [v21 path];
          uint64_t v23 = PLGetSandboxExtensionToken();

          if (v23)
          {
            id v24 = [v21 path];
            [v16 setObject:v23 forKey:v24];
          }
          else
          {
            int v25 = [MEMORY[0x1E4F28CB8] defaultManager];
            id v26 = [v21 path];
            int v27 = [v25 fileExistsAtPath:v26];

            id v24 = PLGatekeeperXPCGetLog();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v28 = v19;
              id v29 = v17;
              uint64_t v30 = v16;
              if (v27) {
                uint64_t v31 = @"YES";
              }
              else {
                uint64_t v31 = @"NO";
              }
              uint64_t v32 = (void *)MEMORY[0x1E4F8B908];
              int v33 = [v21 path];
              id v34 = [v32 redactedDescriptionForPath:v33];
              uint64_t v35 = [v21 path];
              *(_DWORD *)long long buf = 138543874;
              v70 = v31;
              __int16 v71 = 2114;
              id v72 = v34;
              __int16 v73 = 2112;
              v74 = v35;
              _os_log_impl(&dword_19B3C7000, v24, OS_LOG_TYPE_ERROR, "No sandbox extension (fileExists=%{public}@) for %{public}@ (%@)", buf, 0x20u);

              uint64_t v16 = v30;
              id v17 = v29;
              uint64_t v19 = v28;
              uint64_t v18 = v43;
            }
          }

          ++v20;
        }
        while (v18 != v20);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v44 objects:v75 count:16];
      }
      while (v18);
    }

    v42[2](v42, 1, v16, 0);
  }
  else
  {
    v42[2](v42, 0, 0, *(void *)(*((void *)&v76 + 1) + 40));
  }

  _Block_object_dispose(&v56, 8);
  _Block_object_dispose(&v76, 8);

  _Block_object_dispose(&v62, 8);
  if ((_BYTE)v66) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v67 + 8));
  }
  if ((void)v67)
  {
    dispatch_semaphore_t v36 = PLRequestGetLog();
    uint64_t v37 = v36;
    os_signpost_id_t v38 = v67;
    if ((unint64_t)(v67 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      Name = sel_getName(sel[1]);
      LODWORD(v76) = 136446210;
      *(void *)((char *)&v76 + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v37, OS_SIGNPOST_INTERVAL_END, v38, "PLXPC Sync", "%{public}s", (uint8_t *)&v76, 0xCu);
    }
  }
}

void __71__PLAssetsdResourceService_getSandboxExtensionsForAssetWithUUID_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 80))
  {
    id v5 = 0;
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = [v3 managedObjectContext];
    id v5 = +[PLLimitedLibraryFetchFilter fetchLimitedLibraryFetchFilterWithApplicationIdentifier:v6 inManagedObjectContext:v7];

    if (!*(unsigned char *)(a1 + 80) && ![v5 containsAssetWithUUID:*(void *)(a1 + 40)])
    {
      int v27 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F8C500];
      uint64_t v36 = *MEMORY[0x1E4F28568];
      uint64_t v37 = @"Invalid asset uuid for client";
      BOOL v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v37 forKeys:&v36 count:1];
      uint64_t v29 = [v27 errorWithDomain:v28 code:41008 userInfo:v8];
      uint64_t v30 = *(void *)(*(void *)(a1 + 56) + 8);
      id v13 = *(id *)(v30 + 40);
      *(void *)(v30 + 40) = v29;
      goto LABEL_18;
    }
  }
  BOOL v8 = +[PLManagedAsset assetWithUUID:*(void *)(a1 + 40) inLibrary:v4];
  if ([*(id *)(a1 + 48) _allowSandboxExtensionForAsset:v8])
  {
    id v9 = [v8 objectID];
    uint64_t v10 = [v4 managedObjectContext];
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id obj = *(id *)(v11 + 40);
    id v12 = +[PLManagedAsset fetchResourcesForAssetWithObjectID:v9 inContext:v10 versions:0 includeVirtualResources:1 allowDerivatives:1 excludeDynamicCPLResources:0 additionalPredicate:0 relationshipKeyPathsForPrefetching:0 error:&obj];
    objc_storeStrong((id *)(v11 + 40), obj);

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v13 = v12;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          if ((int)[v18 localAvailability] >= 1)
          {
            uint64_t v19 = [v18 fileURL];

            if (v19)
            {
              uint64_t v20 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
              uint64_t v21 = [v18 fileURL];
              [v20 addObject:v21];
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v31 objects:v40 count:16];
      }
      while (v15);
    }

    *(unsigned char *)(*(void *)(*(void *)(a1 + 72) + 8) + 24) = 1;
  }
  else
  {
    uint64_t v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F8C500];
    uint64_t v38 = *MEMORY[0x1E4F28568];
    long long v39 = @"Invalid asset uuid";
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    uint64_t v24 = [v22 errorWithDomain:v23 code:41008 userInfo:v13];
    uint64_t v25 = *(void *)(*(void *)(a1 + 56) + 8);
    id v26 = *(void **)(v25 + 40);
    *(void *)(v25 + 40) = v24;
  }
LABEL_18:
}

- (void)imageDataForAssetWithObjectURI:(id)a3 formatID:(unsigned __int16)a4 allowPlaceholder:(BOOL)a5 wantURLOnly:(BOOL)a6 networkAccessAllowed:(BOOL)a7 trackCPLDownload:(BOOL)a8 reply:(id)a9
{
  uint64_t v13 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v15 = a9;
  long long v49 = 0u;
  *(_OWORD *)sel = 0u;
  long long v48 = 0u;
  int v16 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v48) = v16;
  if (v16)
  {
    id v17 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v18 = (void *)*((void *)&v48 + 1);
    *((void *)&v48 + 1) = v17;

    os_activity_scope_enter(v17, (os_activity_scope_state_t)((char *)&v49 + 8));
  }
  uint64_t v19 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v36 = [v19 persistentStoreCoordinator];

  long long v33 = v15;
  BOOL v34 = a6;
  uint64_t v20 = [v36 managedObjectIDForURIRepresentation:v35];
  BOOL v21 = a8;
  uint64_t v22 = [MEMORY[0x1E4F8B938] formatWithID:v13];
  char v23 = [v22 isThumbnail];
  uint64_t v24 = [(PLAbstractLibraryServicesManagerService *)self libraryServicesManager];
  uint64_t v25 = [v24 databaseContext];
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke;
  v37[3] = &unk_1E586C5B8;
  id v26 = v20;
  __int16 v42 = v13;
  id v38 = v26;
  long long v39 = self;
  id v27 = v22;
  id v40 = v27;
  char v43 = v23;
  BOOL v44 = a5;
  BOOL v45 = v34;
  BOOL v46 = a7;
  BOOL v47 = v21;
  id v28 = v33;
  id v41 = v28;
  [v25 perform:v37 withName:"-[PLAssetsdResourceService imageDataForAssetWithObjectURI:formatID:allowPlaceholder:wantURLOnly:networkAccessAllowed:trackCPLDownload:reply:]"];

  if ((_BYTE)v48) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v49 + 8));
  }
  if ((void)v49)
  {
    uint64_t v29 = PLRequestGetLog();
    uint64_t v30 = v29;
    os_signpost_id_t v31 = v49;
    if ((unint64_t)(v49 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v52 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v30, OS_SIGNPOST_INTERVAL_END, v31, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v91 = *MEMORY[0x1E4F143B8];
  id v62 = a2;
  id v3 = +[PLManagedAsset assetWithObjectID:inLibrary:](PLManagedAsset, "assetWithObjectID:inLibrary:", *(void *)(a1 + 32));
  int v65 = [v3 isCloudSharedAsset];
  __int16 v61 = *(_WORD *)(a1 + 64);
  if ([v3 isVideo] && objc_msgSend(v3, "isCloudSharedAsset"))
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = [v3 pathForOriginalFile];
    uint64_t v6 = [v4 _typeFromPathConstrainedToImageOrMovie:v5];

    if ([v6 conformsToType:*MEMORY[0x1E4F44448]])
    {
      int v7 = [v3 originalAsset];

      if (v7)
      {
        BOOL v8 = PLImageManagerGetLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          id v9 = [v3 uuid];
          uint64_t v10 = [v3 originalAsset];
          uint64_t v11 = [v10 uuid];
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v9;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v11;
          _os_log_impl(&dword_19B3C7000, v8, OS_LOG_TYPE_DEBUG, "A cloud shared video (uuid: %@) does not have an image file, redirecting to original asset (uuid: %@)", buf, 0x16u);
        }
        uint64_t v12 = [v3 originalAsset];

        id v3 = (void *)v12;
      }
    }
  }
  uint64_t v81 = 0;
  if (([v62 isCloudPhotoLibraryEnabled] ^ 1 | v65))
  {
    id v13 = 0;
    unint64_t v14 = 0;
    LOBYTE(v64) = 0;
    goto LABEL_30;
  }
  uint64_t v15 = *(void *)(a1 + 48);
  id v80 = 0;
  unint64_t v14 = +[PLResourceChooser cloudResourceTypeForAsset:v3 format:v15 filePath:&v80 imageType:&v81];
  id v16 = v80;
  id v13 = v16;
  if (!v14)
  {
    uint64_t v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = [v3 uuid];
      uint64_t v20 = *(void *)(a1 + 48);
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v19;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Cloud photos is enabled, but unable to find a cloud resource type for asset (uuid: %@) format %@", buf, 0x16u);
    }
    goto LABEL_18;
  }
  unint64_t v17 = v14;
  if (v14 == 5 && !v16)
  {
    if (![v3 hasMasterThumb])
    {
      id v13 = 0;
      goto LABEL_20;
    }
    uint64_t v18 = [v62 thumbnailManager];
    id v13 = [v18 thumbnailJPEGPathForPhoto:v3];
LABEL_18:

LABEL_20:
    unint64_t v17 = v14;
  }
  if (v17) {
    BOOL v21 = v13 == 0;
  }
  else {
    BOOL v21 = 0;
  }
  int v22 = v21;
  int v64 = v22;
  char v23 = PLImageManagerGetLog();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v24 = [*(id *)(a1 + 48) shortDescription];
    uint64_t v25 = [v3 uuid];
    id v26 = +[PLCloudPhotoLibraryManager descriptionForResourceType:v14];
    id v27 = [NSNumber numberWithInt:v64 ^ 1u];
    *(_DWORD *)long long buf = 138413058;
    *(void *)&uint8_t buf[4] = v24;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2112;
    v84 = v26;
    LOWORD(v85) = 2112;
    *(void *)((char *)&v85 + 2) = v27;
    _os_log_impl(&dword_19B3C7000, v23, OS_LOG_TYPE_DEBUG, "Async image data for format: %@, asset: %@ Found cloud resource type: %@, is locally available: %@", buf, 0x2Au);
  }
LABEL_30:
  int v28 = v65;
  if (v13) {
    int v28 = 0;
  }
  unint64_t v60 = v14;
  if (v28 == 1)
  {
    if (!*(unsigned char *)(a1 + 66))
    {
      if ([v3 isVideo]) {
        uint64_t v29 = 7;
      }
      else {
        uint64_t v29 = 4;
      }
      id v13 = [v3 cloudSharedAssetPathForPlaceholderKind:v29];
      if (v13) {
        goto LABEL_45;
      }
      goto LABEL_36;
    }
    id v13 = 0;
  }
  if (v13) {
    goto LABEL_45;
  }
LABEL_36:
  if (!v14)
  {
    if (*(unsigned char *)(a1 + 66))
    {
      id v13 = 0;
    }
    else
    {
      uint64_t v30 = *(void *)(a1 + 48);
      id v79 = 0;
      id v31 = +[PLResourceChooser fileReservationForImageFileForAsset:v3 format:v30 outFilePath:&v79 outImageType:&v81];
      id v13 = v79;
    }
  }
LABEL_45:
  uint64_t v32 = v81;
  if (v81 == 1)
  {
    if ([v3 isVideo] && (objc_msgSend(v3, "isCloudSharedAsset") & 1) == 0)
    {
      uint64_t v37 = PLImageManagerGetLog();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        id v38 = [v3 uuid];
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v38;
        _os_log_impl(&dword_19B3C7000, v37, OS_LOG_TYPE_ERROR, "Resource chooser selected original resource for a video, which is invalid, for asset (uuid: %@)", buf, 0xCu);
      }
      id v13 = 0;
      uint64_t v81 = 0;
LABEL_65:
      uint64_t v35 = 1;
      if (!v13) {
        goto LABEL_58;
      }
      goto LABEL_66;
    }
    uint64_t v32 = v81;
    if (v81 == 1)
    {
      char v33 = [*(id *)(a1 + 48) refersToLatestVersion];
      uint64_t v32 = v81;
      if (v33)
      {
        __int16 v61 = 9999;
        goto LABEL_56;
      }
    }
  }
  switch(v32)
  {
    case 7:
      __int16 v34 = 9988;
LABEL_61:
      __int16 v61 = v34;
      goto LABEL_65;
    case 9:
      __int16 v34 = 3039;
      goto LABEL_61;
    case 8:
      if (*(_WORD *)(a1 + 64) != 9998) {
        goto LABEL_65;
      }
      __int16 v34 = 4007;
      goto LABEL_61;
  }
LABEL_56:
  if (v32 != 1) {
    goto LABEL_65;
  }
  [v3 originalImageOrientation];
  uint64_t v35 = (int)PLExifOrientationFromImageOrientation();
  if (!v13)
  {
LABEL_58:
    uint64_t v36 = 0;
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v36 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v13 isDirectory:0];
LABEL_67:
  long long v39 = *(void **)(a1 + 40);
  id v40 = [v36 path];
  id v41 = [v39 _typeFromPathConstrainedToImageOrMovie:v40];
  __int16 v42 = [v41 identifier];

  id v43 = 0;
  if (*(unsigned char *)(a1 + 67)) {
    BOOL v44 = 1;
  }
  else {
    BOOL v44 = v81 == 0;
  }
  if (v44) {
    char v45 = v64;
  }
  else {
    char v45 = 0;
  }
  if (!v36 && (v45 & 1) == 0) {
    id v43 = +[PLImageLoadingUtilities newSynchronousImageForAsset:v3 withFormat:*(unsigned __int16 *)(a1 + 64) allowPlaceholder:*(unsigned __int8 *)(a1 + 67) != 0 outImageProperties:0 outDeliveredPlaceholder:0];
  }
  uint64_t v59 = v13;
  BOOL v46 = *(void **)(*(void *)(a1 + 40) + 24);
  char v47 = *(unsigned char *)(a1 + 68);
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_57;
  v67[3] = &unk_1E586C590;
  char v75 = v65;
  char v76 = v47;
  id v63 = v62;
  id v68 = v63;
  id v48 = v3;
  char v77 = v64;
  __int16 v78 = *(_WORD *)(a1 + 69);
  __int16 v74 = *(_WORD *)(a1 + 64);
  uint64_t v49 = *(void *)(a1 + 40);
  id v66 = v48;
  id v69 = v48;
  uint64_t v70 = v49;
  unint64_t v73 = v60;
  id v72 = *(id *)(a1 + 56);
  id v50 = v42;
  id v71 = v50;
  id v51 = v46;
  id v52 = v36;
  id v53 = v43;
  id v54 = v67;
  char v55 = _os_activity_create(&dword_19B3C7000, "asyncImageDataFromAsset", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v55, &state);
  *(void *)long long buf = MEMORY[0x1E4F143A8];
  *(void *)&buf[8] = 3221225472;
  *(void *)&buf[16] = __asyncImageDataFromAsset_block_invoke;
  v84 = &unk_1E586D2D0;
  id v56 = v52;
  *(void *)&long long v85 = v56;
  v57 = v54;
  __int16 v88 = v61;
  id v86 = v57;
  uint64_t v87 = v35;
  char v89 = v47;
  char v90 = v45;
  id v58 = v53;
  *((void *)&v85 + 1) = v58;
  pl_dispatch_async();

  os_activity_scope_leave(&state);
}

void __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_57(uint64_t a1, void *a2, void *a3, void *a4, unsigned int a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  if ([v11 isFileURL])
  {
    uint64_t v12 = [v11 path];
    uint64_t v13 = PLGetSandboxExtensionToken();
  }
  else
  {
    uint64_t v13 = 0;
  }
  if (*(unsigned char *)(a1 + 82) && (v9 || v11 && *(unsigned char *)(a1 + 83)))
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_2;
    v29[3] = &unk_1E5875CE0;
    unint64_t v14 = *(void **)(a1 + 32);
    id v30 = *(id *)(a1 + 40);
    [v14 performBlock:v29];
  }
  id v27 = (void *)v13;
  if (*(unsigned char *)(a1 + 84) && *(unsigned char *)(a1 + 85))
  {
    uint64_t v15 = v10;
    BOOL v16 = *(unsigned __int16 *)(a1 + 80) - 9999 < 2;
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v18 = *(void **)(*(void *)(a1 + 48) + 32);
    uint64_t v19 = *(void *)(a1 + 72);
    uint64_t v20 = *(unsigned __int8 *)(a1 + 86);
    id v28 = 0;
    LOBYTE(v26) = 0;
    BOOL v21 = [v18 startCPLDownloadForAsset:v17 resourceType:v19 masterResourceOnly:v16 highPriority:1 track:v20 notify:v20 transient:v26 proposedTaskIdentifier:0 doneToken:0 error:&v28];
    id v22 = v28;
    if (*(unsigned char *)(a1 + 86))
    {
      id v23 = v21;
      uint64_t v24 = +[PLCloudPhotoLibraryManager descriptionForResourceType:*(void *)(a1 + 72)];
    }
    else
    {
      id v23 = 0;
      uint64_t v24 = 0;
    }

    if (!v9) {
      goto LABEL_18;
    }
  }
  else
  {
    uint64_t v15 = v10;
    id v22 = 0;
    id v23 = 0;
    uint64_t v24 = 0;
    if (!v9)
    {
LABEL_18:
      uint64_t v25 = 0;
      goto LABEL_19;
    }
  }
  uint64_t v25 = (void *)[objc_alloc(MEMORY[0x1E4F8BA30]) initWithXPCObject:v9];
LABEL_19:
  (*(void (**)(void, void *, void *, void))(*(void *)(a1 + 64) + 16))(*(void *)(a1 + 64), v25, v15, a5);
}

uint64_t __141__PLAssetsdResourceService_imageDataForAssetWithObjectURI_formatID_allowPlaceholder_wantURLOnly_networkAccessAllowed_trackCPLDownload_reply___block_invoke_2(uint64_t a1)
{
  return +[PLManagedAsset markAssetAsRecentlyUsed:*(void *)(a1 + 32)];
}

- (void)fileDescriptorForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: fileDescriptorForPersistentURL:withAdjustments:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v12 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __81__PLAssetsdResourceService_fileDescriptorForPersistentURL_withAdjustments_reply___block_invoke;
  v18[3] = &unk_1E586C540;
  id v13 = v9;
  id v19 = v13;
  [(PLAssetsdResourceService *)self translatePersistentURL:v8 withAdjustments:v6 handler:v18];

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    unint64_t v14 = PLRequestGetLog();
    uint64_t v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __81__PLAssetsdResourceService_fileDescriptorForPersistentURL_withAdjustments_reply___block_invoke(uint64_t a1, void *a2)
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v13 = *MEMORY[0x1E4F8C500];
    uint64_t v20 = *MEMORY[0x1E4F28568];
    long long v21 = @"Couldn't translate asset URL";
    unint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    id v11 = [v12 errorWithDomain:v13 code:41003 userInfo:v14];

    uint64_t v15 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v11;
LABEL_8:
      _os_log_impl(&dword_19B3C7000, v15, OS_LOG_TYPE_ERROR, "Error: %@", buf, 0xCu);
    }
LABEL_9:

    int v10 = 0;
    id v9 = 0;
    goto LABEL_10;
  }
  id v5 = [v3 path];
  int v6 = open((const char *)[v5 fileSystemRepresentation], 0);

  if (v6 < 0)
  {
    os_signpost_id_t v16 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F8C500];
    uint64_t v24 = *MEMORY[0x1E4F28568];
    uint64_t v18 = [NSString stringWithFormat:@"Couldn't open file at url: %@", v4];
    v25[0] = v18;
    id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:&v24 count:1];
    id v11 = [v16 errorWithDomain:v17 code:41006 userInfo:v19];

    uint64_t v15 = PLGatekeeperXPCGetLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v23 = v11;
      goto LABEL_8;
    }
    goto LABEL_9;
  }
  id v7 = objc_alloc(MEMORY[0x1E4F8BA28]);
  xpc_object_t v8 = xpc_fd_create(v6);
  id v9 = (void *)[v7 initWithXPCObject:v8];

  close(v6);
  int v10 = [v4 pathExtension];
  id v11 = 0;
LABEL_10:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)sandboxExtensionURLForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: sandboxExtensionURLForPersistentURL:withAdjustments:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v12 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __86__PLAssetsdResourceService_sandboxExtensionURLForPersistentURL_withAdjustments_reply___block_invoke;
  v18[3] = &unk_1E586C568;
  void v18[4] = self;
  id v13 = v9;
  id v19 = v13;
  [(PLAssetsdResourceService *)self translatePersistentURL:v8 withAdjustments:v6 handler:v18];

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    unint64_t v14 = PLRequestGetLog();
    uint64_t v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

void __86__PLAssetsdResourceService_sandboxExtensionURLForPersistentURL_withAdjustments_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 path];
  id v5 = [*(id *)(a1 + 32) connectionAuthorization];
  BOOL v6 = v5;
  if (v5)
  {
    [v5 clientAuditToken];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v7 = PLGetSandboxExtensionTokenForProcess();
  id v8 = PLSandboxExtensionTokenAsData();

  if (v8)
  {
    (*(void (**)(void, uint64_t, id, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, v3, v8);
  }
  else
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v9 setObject:@"Sandbox extension create failed" forKeyedSubscript:*MEMORY[0x1E4F28228]];
    if (v3) {
      [v9 setObject:v3 forKeyedSubscript:*MEMORY[0x1E4F289D0]];
    }
    uint64_t v10 = *(void *)(a1 + 40);
    id v11 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", *MEMORY[0x1E4F8C500], 41028, v9, v12, v13);
    (*(void (**)(uint64_t, void, void, void, void *))(v10 + 16))(v10, 0, 0, 0, v11);
  }
}

- (void)filePathForPersistentURL:(id)a3 withAdjustments:(BOOL)a4 reply:(id)a5
{
  BOOL v6 = a4;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v20 = 0u;
  int v10 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v20) = v10;
  if (v10)
  {
    id v11 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: filePathForPersistentURL:withAdjustments:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    long long v12 = (void *)*((void *)&v20 + 1);
    *((void *)&v20 + 1) = v11;

    os_activity_scope_enter(v11, (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __75__PLAssetsdResourceService_filePathForPersistentURL_withAdjustments_reply___block_invoke;
  v18[3] = &unk_1E586C540;
  id v13 = v9;
  id v19 = v13;
  [(PLAssetsdResourceService *)self translatePersistentURL:v8 withAdjustments:v6 handler:v18];

  if ((_BYTE)v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    unint64_t v14 = PLRequestGetLog();
    uint64_t v15 = v14;
    os_signpost_id_t v16 = v21;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      uint64_t v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v15, OS_SIGNPOST_INTERVAL_END, v16, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

uint64_t __75__PLAssetsdResourceService_filePathForPersistentURL_withAdjustments_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addAssetWithURL:(id)a3 toAlbum:(id)a4 reply:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = (void (**)(id, uint64_t, void))a5;
  long long v38 = 0u;
  *(_OWORD *)sel = 0u;
  long long v37 = 0u;
  int v11 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v37) = v11;
  if (v11)
  {
    long long v12 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: addAssetWithURL:toAlbum:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    id v13 = (void *)*((void *)&v37 + 1);
    *((void *)&v37 + 1) = v12;

    os_activity_scope_enter(v12, (os_activity_scope_state_t)((char *)&v38 + 8));
  }
  unint64_t v14 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
  int v15 = [v14 isClientInLimitedLibraryMode];

  if (v15)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    id v16 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService addAssetWithURL:toAlbum:reply:]");
    uint64_t v17 = v16;
    if (v8 && v9)
    {
      v35[0] = 0;
      v35[1] = v35;
      v35[2] = 0x2020000000;
      char v36 = 0;
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v43 = 0x3032000000;
      BOOL v44 = __Block_byref_object_copy__62306;
      char v45 = __Block_byref_object_dispose__62307;
      id v46 = 0;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke;
      v29[3] = &unk_1E586C518;
      id v30 = v16;
      id v31 = v9;
      id v32 = v8;
      char v33 = v35;
      p_long long buf = &buf;
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke_2;
      v25[3] = &unk_1E5873410;
      uint64_t v26 = v10;
      id v27 = v35;
      id v28 = &buf;
      [v30 performTransaction:v29 completionHandler:v25];

      _Block_object_dispose(&buf, 8);
      _Block_object_dispose(v35, 8);
    }
    else
    {
      uint64_t v18 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v40 = *MEMORY[0x1E4F28568];
      id v41 = @"Invalid assetURL or album UUID";
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];
      long long v20 = [v18 errorWithDomain:*MEMORY[0x1E4F8C500] code:41008 userInfo:v19];

      ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v20);
    }
  }
  if ((_BYTE)v37) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v38 + 8));
  }
  if ((void)v38)
  {
    long long v21 = PLRequestGetLog();
    id v22 = v21;
    os_signpost_id_t v23 = v38;
    if ((unint64_t)(v38 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
    {
      Name = sel_getName(sel[1]);
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v22, OS_SIGNPOST_INTERVAL_END, v23, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) albumWithUuid:*(void *)(a1 + 40)];
  uint64_t v3 = [*(id *)(a1 + 32) photoFromAssetURL:*(void *)(a1 + 48)];
  id v4 = (void *)v3;
  if (v2) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    BOOL v6 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v7 = *MEMORY[0x1E4F8C500];
    uint64_t v13 = *MEMORY[0x1E4F28568];
    v14[0] = @"Error fetching album or asset";
    id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    uint64_t v9 = [v6 errorWithDomain:v7 code:41008 userInfo:v8];
    uint64_t v10 = *(void *)(*(void *)(a1 + 64) + 8);
    int v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;
  }
  else
  {
    long long v12 = [v2 mutableAssets];
    [v12 addObject:v4];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
}

uint64_t __58__PLAssetsdResourceService_addAssetWithURL_toAlbum_reply___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[4] + 16))(a1[4], *(unsigned __int8 *)(*(void *)(a1[5] + 8) + 24), *(void *)(*(void *)(a1[6] + 8) + 40));
}

- (void)addAssetGroupWithName:(id)a3 reply:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (void (**)(id, uint64_t, void))a4;
  long long v28 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int v8 = [MEMORY[0x1E4F8BA38] enabled];
  LOBYTE(v26) = v8;
  if (v8)
  {
    uint64_t v9 = _os_activity_create(&dword_19B3C7000, "PLXPC Service: addAssetGroupWithName:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    uint64_t v10 = (void *)*((void *)&v26 + 1);
    *((void *)&v26 + 1) = v9;

    os_activity_scope_enter(v9, (os_activity_scope_state_t)((char *)&v27 + 8));
  }
  int v11 = [(PLAssetsdResourceWriteOnlyService *)self connectionAuthorization];
  int v12 = [v11 isClientInLimitedLibraryMode];

  if (v12)
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v30 = 0x3032000000;
    id v31 = __Block_byref_object_copy__62306;
    id v32 = __Block_byref_object_dispose__62307;
    id v33 = 0;
    id v13 = -[PLAbstractLibraryServicesManagerService newShortLivedLibraryWithName:](self, "newShortLivedLibraryWithName:", "-[PLAssetsdResourceService addAssetGroupWithName:reply:]");
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke;
    v22[3] = &unk_1E5875340;
    id v23 = v6;
    id v14 = v13;
    id v24 = v14;
    p_long long buf = &buf;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    void v19[2] = __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke_2;
    v19[3] = &unk_1E5870D98;
    long long v21 = &buf;
    long long v20 = v7;
    [v14 performTransaction:v22 completionHandler:v19];

    _Block_object_dispose(&buf, 8);
  }
  if ((_BYTE)v26) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v27 + 8));
  }
  if ((void)v27)
  {
    int v15 = PLRequestGetLog();
    id v16 = v15;
    os_signpost_id_t v17 = v27;
    if ((unint64_t)(v27 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      Name = sel_getName(*((SEL *)&v28 + 1));
      LODWORD(buf) = 136446210;
      *(void *)((char *)&buf + 4) = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v16, OS_SIGNPOST_INTERVAL_END, v17, "PLXPC Sync", "%{public}s", (uint8_t *)&buf, 0xCu);
    }
  }
}

void __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke(void *a1)
{
  uint64_t v2 = +[PLGenericAlbum albumWithName:a1[4] inLibrary:a1[5]];

  if (!v2)
  {
    uint64_t v3 = +[PLGenericAlbum insertNewAlbumWithTitle:a1[4] intoLibrary:a1[5]];
    uint64_t v4 = *(void *)(a1[6] + 8);
    BOOL v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

void __56__PLAssetsdResourceService_addAssetGroupWithName_reply___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(void *)(v2 + 40) && ([*(id *)(v2 + 40) isInserted] & 1) == 0)
  {
    uint64_t v3 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) groupURL];
  }
  else
  {
    uint64_t v3 = 0;
  }
  id v4 = (id)v3;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)saveAssetWithDataAndPorts:(id)a3 imageSurface:(id)a4 previewImageSurface:(id)a5 reply:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v21 = 0u;
  *(_OWORD *)sel = 0u;
  long long v19 = 0u;
  int v14 = objc_msgSend(MEMORY[0x1E4F8BA38], "enabled", 0);
  LOBYTE(v19) = v14;
  if (v14)
  {
    *((void *)&v19 + 1) = _os_activity_create(&dword_19B3C7000, "PLXPC Service: saveAssetWithDataAndPorts:imageSurface:previewImageSurface:reply:", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);

    os_activity_scope_enter(*((os_activity_t *)&v19 + 1), (os_activity_scope_state_t)((char *)&v21 + 8));
  }
  int v15 = objc_msgSend(MEMORY[0x1E4F29268], "currentConnection", (void)v19);
  [(PLAssetsdResourceWriteOnlyService *)self saveAssetWithDataAndPorts:v10 clientConnection:v15 imageSurface:v11 previewImageSurface:v12 reply:v13];

  if (v20) {
    os_activity_scope_leave((os_activity_scope_state_t)((char *)&v21 + 8));
  }
  if ((void)v21)
  {
    id v16 = PLRequestGetLog();
    os_signpost_id_t v17 = v16;
    if ((unint64_t)(v21 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      Name = sel_getName(sel[1]);
      *(_DWORD *)long long buf = 136446210;
      id v24 = Name;
      _os_signpost_emit_with_name_impl(&dword_19B3C7000, v17, OS_SIGNPOST_INTERVAL_END, v21, "PLXPC Sync", "%{public}s", buf, 0xCu);
    }
  }
}

- (PLAssetsdResourceService)initWithLibraryServicesManager:(id)a3 connectionAuthorization:(id)a4 resourceDownloader:(id)a5
{
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLAssetsdResourceService;
  id v10 = [(PLAssetsdResourceWriteOnlyService *)&v16 initWithLibraryServicesManager:a3 connectionAuthorization:a4];
  id v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_resourceDownloader, a5);
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.photos.backend.resourceService.imageDataQueue", v12);
    asyncImageDataQueue = v11->_asyncImageDataQueue;
    v11->_asyncImageDataQueue = (OS_dispatch_queue *)v13;
  }
  return v11;
}

@end