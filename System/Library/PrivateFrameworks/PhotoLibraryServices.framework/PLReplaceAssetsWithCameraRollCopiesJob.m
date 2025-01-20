@interface PLReplaceAssetsWithCameraRollCopiesJob
+ (void)replaceAssets:(id)a3 withCameraRollCopiesInAlbum:(id)a4;
- (NSArray)assets;
- (NSPersistentStoreCoordinator)coordinator;
- (PLManagedAlbum)album;
- (PLManagedObjectContext)managedObjectContext;
- (PLPhotoLibrary)photoLibrary;
- (PLReplaceAssetsWithCameraRollCopiesJob)initWithPhotoLibrary:(id)a3;
- (id)_cameraRollAssetDerivedFromAsset:(id)a3;
- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4;
- (int64_t)daemonOperation;
- (void)dealloc;
- (void)encodeToXPCObject:(id)a3;
- (void)run;
- (void)runDaemonSide;
- (void)setAlbum:(id)a3;
- (void)setAssets:(id)a3;
- (void)setPhotoLibrary:(id)a3;
@end

@implementation PLReplaceAssetsWithCameraRollCopiesJob

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_album, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

- (void)setPhotoLibrary:(id)a3
{
}

- (PLPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setAlbum:(id)a3
{
}

- (PLManagedAlbum)album
{
  return self->_album;
}

- (void)setAssets:(id)a3
{
}

- (NSArray)assets
{
  return self->_assets;
}

- (id)_cameraRollAssetDerivedFromAsset:(id)a3
{
  v19[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 managedObjectContext];
  v5 = (void *)MEMORY[0x1E4F1C0D0];
  v6 = +[PLManagedAsset entityName];
  v7 = [v5 fetchRequestWithEntityName:v6];

  [v7 setFetchLimit:1];
  v8 = (void *)MEMORY[0x1E4F28BA0];
  v9 = objc_msgSend(MEMORY[0x1E4F8BA10], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E4F8BA10], "maskForCameraAsset"), 1);
  v19[0] = v9;
  v10 = (void *)MEMORY[0x1E4F28F60];
  v11 = [v3 dateCreated];

  v12 = [v10 predicateWithFormat:@"%K == %@", @"dateCreated", v11];
  v19[1] = v12;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:2];
  v14 = [v8 andPredicateWithSubpredicates:v13];

  [v7 setPredicate:v14];
  uint64_t v18 = 0;
  v15 = [v4 executeFetchRequest:v7 error:&v18];
  if ([v15 count])
  {
    v16 = [v15 lastObject];
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (void)runDaemonSide
{
  id v3 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self photoLibrary];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke;
  v6[3] = &unk_1E5875E18;
  id v7 = v3;
  v8 = self;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_53;
  v5[3] = &unk_1E5875CE0;
  v5[4] = self;
  id v4 = v3;
  [v4 performTransaction:v6 completionHandler:v5];
}

void __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke(uint64_t a1)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  v1 = [*(id *)(a1 + 32) pathManager];
  int v2 = [v1 isUBF];

  int v40 = v2;
  if (v2)
  {
    v39 = 0;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) pathManager];
    v39 = [v3 simpleDCIMDirectory];
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v57[0] = MEMORY[0x1E4F143A8];
  v57[1] = 3221225472;
  v57[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_2;
  v57[3] = &unk_1E586E318;
  id v38 = v4;
  id v58 = v38;
  v41 = (uint64_t (**)(void, void, void))MEMORY[0x19F38D650](v57);
  v5 = [*(id *)(a1 + 40) album];
  v44 = [v5 mutableAssets];

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id obj = [*(id *)(a1 + 40) assets];
  uint64_t v45 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
  if (v45)
  {
    uint64_t v43 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v45; ++i)
      {
        if (*(void *)v54 != v43) {
          objc_enumerationMutation(obj);
        }
        id v7 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        v8 = (void *)MEMORY[0x19F38D3B0]();
        v9 = [*(id *)(a1 + 40) _cameraRollAssetDerivedFromAsset:v7];
        if (v9) {
          goto LABEL_10;
        }
        v13 = [v7 mainFileURL];
        if (v13)
        {
          v14 = [MEMORY[0x1E4F29128] UUID];
          v15 = [v14 UUIDString];

          *(void *)buf = 0;
          *(void *)&buf[8] = buf;
          *(void *)&buf[16] = 0x3032000000;
          v62 = __Block_byref_object_copy__69821;
          v63 = __Block_byref_object_dispose__69822;
          id v64 = 0;
          if (v40)
          {
            *(void *)v59 = 0;
            *(void *)&v59[8] = v59;
            *(void *)&v59[16] = 0x2020000000;
            char v60 = 0;
            id v16 = objc_alloc(MEMORY[0x1E4F8B978]);
            v17 = [v7 uniformTypeIdentifier];
            uint64_t v18 = [v7 originalFilename];
            v19 = (void *)[v16 initWithAssetUuid:v15 bundleScope:0 uti:v17 resourceVersion:0 resourceType:31 recipeID:0 originalFilename:v18];

            uint64_t v20 = [*(id *)(a1 + 32) pathManager];
            v48[0] = MEMORY[0x1E4F143A8];
            v48[1] = 3221225472;
            v48[2] = __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_49;
            v48[3] = &unk_1E586E340;
            v51 = buf;
            v52 = v59;
            v50 = v41;
            id v49 = v13;
            [(id)v20 obtainAccessAndWaitWithFileWithIdentifier:v19 mode:2 toURLWithHandler:v48];

            LOBYTE(v20) = *(unsigned char *)(*(void *)&v59[8] + 24) == 0;
            _Block_object_dispose(v59, 8);
            if ((v20 & 1) == 0)
            {
LABEL_17:
              if ([v7 isPhotoStreamPhoto]
                && [v7 visibilityState] != 2)
              {
                v21 = [v7 publicGlobalUUID];
              }
              else
              {
                v21 = 0;
              }
              LOBYTE(v37) = 0;
              LOBYTE(v36) = 0;
              v9 = objc_msgSend(*(id *)(a1 + 32), "addDCIMEntryAtFileURL:mainFileMetadata:previewImage:thumbnailImage:savedAssetType:replacementUUID:publicGlobalUUID:extendedInfo:withUUID:isPlaceholder:placeholderFileURL:forFinalCameraImage:", *(void *)(*(void *)&buf[8] + 40), 0, 0, 0, objc_msgSend(MEMORY[0x1E4F8BA10], "savedAssetTypeForCameraAsset"), 0, v21, 0, v15, v36, 0, v37);
              if (v9)
              {
                v27 = [v7 dateCreated];
                [v9 setDateCreated:v27];

                v28 = [v9 dateCreated];
                [v28 timeIntervalSinceReferenceDate];
                objc_msgSend(v9, "setSortToken:");

                if ([v7 isPhotoStreamPhoto])
                {
                  v29 = [v7 originalHash];
                  if (v29) {
                    [v9 setOriginalHash:v29];
                  }
                  if ([v7 visibilityState] != 2) {
                    [v7 setVisibilityState:2];
                  }
                }
                id v30 = v9;
                id v47 = 0;
                BOOL v31 = +[PLResourceInstaller installInternalResourcesForExistingAsset:v30 assumeNoExistingResources:0 referencedResourceURLs:0 error:&v47];
                id v32 = v47;
                if (!v31)
                {
                  v33 = PLBackendGetLog();
                  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)v59 = 138412546;
                    *(void *)&v59[4] = v30;
                    *(_WORD *)&v59[12] = 2112;
                    *(void *)&v59[14] = v32;
                    _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "Failed to install resources for asset: %@, reason: %@", v59, 0x16u);
                  }
                }
              }
              else
              {
                v34 = PLBackendGetLog();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
                {
                  v35 = [*(id *)(*(void *)&buf[8] + 40) path];
                  *(_DWORD *)v59 = 138412290;
                  *(void *)&v59[4] = v35;
                  _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "Failed to add file \"%@\" to camera roll.", v59, 0xCu);
                }
                [v38 removeItemAtURL:*(void *)(*(void *)&buf[8] + 40) error:0];
              }

              char v26 = 1;
LABEL_43:
              _Block_object_dispose(buf, 8);

              if ((v26 & 1) == 0 || !v9) {
                goto LABEL_45;
              }
LABEL_10:
              uint64_t v10 = [v44 indexOfObject:v7];
              if (v10 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v11 = PLBackendGetLog();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
                {
                  v12 = [*(id *)(a1 + 40) album];
                  *(_DWORD *)buf = 138412546;
                  *(void *)&buf[4] = v7;
                  *(_WORD *)&buf[12] = 2112;
                  *(void *)&buf[14] = v12;
                  _os_log_impl(&dword_19B3C7000, v11, OS_LOG_TYPE_ERROR, "Asset to replace not found in album. Asset: %@\nAlbum: %@", buf, 0x16u);
                }
              }
              else
              {
                [v44 replaceObjectAtIndex:v10 withObject:v9];
              }
              goto LABEL_45;
            }
          }
          else
          {
            v23 = [v13 pathExtension];
            uint64_t v24 = [v39 nextAvailableFileURLWithExtension:v23];
            v25 = *(void **)(*(void *)&buf[8] + 40);
            *(void *)(*(void *)&buf[8] + 40) = v24;

            if (((uint64_t (**)(void, void *, void))v41)[2](v41, v13, *(void *)(*(void *)&buf[8] + 40)))goto LABEL_17; {
          }
            }
          char v26 = 0;
          v9 = 0;
          goto LABEL_43;
        }
        v22 = PLBackendGetLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v7;
          _os_log_impl(&dword_19B3C7000, v22, OS_LOG_TYPE_ERROR, "Cannot copy asset to Camera Roll because it doesn't have a file URL. %@", buf, 0xCu);
        }

        v9 = 0;
LABEL_45:
      }
      uint64_t v45 = [obj countByEnumeratingWithState:&v53 objects:v65 count:16];
    }
    while (v45);
  }
}

id __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_53(uint64_t a1)
{
  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  return objc_msgSendSuper2(&v2, sel_runDaemonSide);
}

uint64_t __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  id v14 = 0;
  uint64_t v8 = [v7 copyItemAtURL:v5 toURL:v6 error:&v14];
  id v9 = v14;
  if ((v8 & 1) == 0)
  {
    uint64_t v10 = PLBackendGetLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = [v5 path];
      v12 = [v6 path];
      *(_DWORD *)buf = 138412802;
      id v16 = v11;
      __int16 v17 = 2112;
      uint64_t v18 = v12;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_19B3C7000, v10, OS_LOG_TYPE_ERROR, "Failed to copy file \"%@\" to \"%@\": %@", buf, 0x20u);
    }
  }

  return v8;
}

void __55__PLReplaceAssetsWithCameraRollCopiesJob_runDaemonSide__block_invoke_49(void *a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), a2);
  id v4 = a2;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (id)initFromXPCObject:(id)a3 libraryServicesManager:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v24.receiver = self;
  v24.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  id v7 = [(PLDaemonJob *)&v24 initFromXPCObject:v6 libraryServicesManager:a4];
  uint64_t v8 = v7;
  if (!v7) {
    goto LABEL_5;
  }
  id v9 = [v7 libraryServicesManager];
  uint64_t v10 = [v9 databaseContext];
  uint64_t v11 = [v10 newShortLivedLibraryWithName:"-[PLReplaceAssetsWithCameraRollCopiesJob initFromXPCObject:libraryServicesManager:]"];
  v12 = (void *)v8[10];
  v8[10] = v11;

  v13 = xpc_dictionary_get_value(v6, "assetsIDs");
  uint64_t v14 = xpc_dictionary_get_value(v6, "albumID");
  v15 = (void *)v14;
  if (v13 && v14)
  {
    id v16 = (void *)v8[10];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke;
    v20[3] = &unk_1E5873A50;
    uint64_t v21 = v8;
    v22 = v13;
    v23 = v15;
    [v16 performBlock:v20];

LABEL_5:
    __int16 v17 = v8;
    goto LABEL_9;
  }
  uint64_t v18 = PLBackendGetLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134218240;
    char v26 = v15;
    __int16 v27 = 2048;
    v28 = v13;
    _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "Error initializing job object. AlbumID: %p, AssetIDs %p", buf, 0x16u);
  }

  __int16 v17 = 0;
LABEL_9:

  return v17;
}

void __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke(uint64_t a1)
{
  objc_super v2 = [*(id *)(a1 + 32) coordinator];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  applier[0] = MEMORY[0x1E4F143A8];
  applier[1] = 3221225472;
  applier[2] = __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke_2;
  applier[3] = &unk_1E586E2F0;
  id v11 = v2;
  id v4 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v13 = v3;
  id v5 = v3;
  id v6 = v2;
  xpc_array_apply(v4, applier);
  [*(id *)(a1 + 32) setAssets:v5];
  id v7 = PLManagedObjectIDFromXPCValue();
  uint64_t v8 = [*(id *)(a1 + 32) managedObjectContext];
  id v9 = [v8 objectWithID:v7];

  [*(id *)(a1 + 32) setAlbum:v9];
}

uint64_t __83__PLReplaceAssetsWithCameraRollCopiesJob_initFromXPCObject_libraryServicesManager___block_invoke_2(uint64_t a1)
{
  objc_super v2 = PLManagedObjectIDFromXPCValue();
  if (v2)
  {
    id v3 = [*(id *)(a1 + 40) managedObjectContext];
    id v4 = [v3 objectWithID:v2];

    if (v4) {
      [*(id *)(a1 + 48) addObject:v4];
    }
  }
  return 1;
}

- (void)encodeToXPCObject:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  [(PLDaemonJob *)&v18 encodeToXPCObject:v4];
  xpc_object_t v5 = xpc_array_create(0, 0);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self assets];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v14 + 1) + 8 * v10) objectID];
        PLXPCArrayAppendManagedObjectID();

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v19 count:16];
    }
    while (v8);
  }

  xpc_dictionary_set_value(v4, "assetsIDs", v5);
  id v12 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self album];
  id v13 = [v12 objectID];
  PLXPCDictionarySetManagedObjectID();
}

- (void)run
{
  id v7 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self assets];
  id v4 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self album];
  if (v7)
  {
    if (v4) {
      goto LABEL_3;
    }
  }
  else
  {
    xpc_object_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"PLReplaceAssetsWithCameraRollCopiesJob.m" lineNumber:102 description:@"assets cannot be nil when starting the job"];

    if (v4) {
      goto LABEL_3;
    }
  }
  id v6 = [MEMORY[0x1E4F28B00] currentHandler];
  [v6 handleFailureInMethod:a2 object:self file:@"PLReplaceAssetsWithCameraRollCopiesJob.m" lineNumber:103 description:@"album cannot be nil when starting the job"];

LABEL_3:
  [(PLDaemonJob *)self sendToAssetsd];
}

- (NSPersistentStoreCoordinator)coordinator
{
  objc_super v2 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self managedObjectContext];
  id v3 = [v2 persistentStoreCoordinator];

  return (NSPersistentStoreCoordinator *)v3;
}

- (PLManagedObjectContext)managedObjectContext
{
  objc_super v2 = [(PLReplaceAssetsWithCameraRollCopiesJob *)self photoLibrary];
  id v3 = [v2 managedObjectContext];

  return (PLManagedObjectContext *)v3;
}

- (int64_t)daemonOperation
{
  return 1;
}

- (void)dealloc
{
  assets = self->_assets;
  self->_assets = 0;

  album = self->_album;
  self->_album = 0;

  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = 0;

  v6.receiver = self;
  v6.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  [(PLReplaceAssetsWithCameraRollCopiesJob *)&v6 dealloc];
}

- (PLReplaceAssetsWithCameraRollCopiesJob)initWithPhotoLibrary:(id)a3
{
  id v4 = [a3 libraryBundle];
  xpc_object_t v5 = [v4 assetsdClient];
  v8.receiver = self;
  v8.super_class = (Class)PLReplaceAssetsWithCameraRollCopiesJob;
  objc_super v6 = [(PLDaemonJob *)&v8 initWithAssetsdClient:v5];

  return v6;
}

+ (void)replaceAssets:(id)a3 withCameraRollCopiesInAlbum:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  uint64_t v7 = [v11 count];
  if (v6 && v7)
  {
    id v8 = objc_alloc((Class)a1);
    uint64_t v9 = [v6 photoLibrary];
    uint64_t v10 = (void *)[v8 initWithPhotoLibrary:v9];

    [v10 setAlbum:v6];
    [v10 setAssets:v11];
    [v10 run];
  }
}

@end