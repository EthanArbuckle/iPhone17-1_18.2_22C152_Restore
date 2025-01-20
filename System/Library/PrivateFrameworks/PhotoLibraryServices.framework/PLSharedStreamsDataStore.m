@interface PLSharedStreamsDataStore
+ (id)supportedRecipes;
+ (unsigned)_masterThumbRecipeID;
+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3;
+ (unsigned)storeClassID;
- (BOOL)_isDerivativeForSharedStreamsType:(unsigned int)a3;
- (BOOL)canStoreExternalResource:(id)a3;
- (BOOL)canStreamResource:(id)a3;
- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3;
- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7;
- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4;
- (id)_sharedStreamsExternalResourceForAsset:(id)a3 album:(id)a4 type:(unsigned int)a5;
- (id)_utiStringForAsset:(id)a3 type:(unsigned int)a4;
- (id)descriptionForSubtype:(int64_t)a3;
- (id)expectedFileURLForResource:(id)a3 asset:(id)a4;
- (id)keyFromKeyStruct:(const void *)a3;
- (id)name;
- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6;
- (id)requiredExternalResourcesForMigratingOrImportingAsset:(id)a3;
- (id)resourceDataForKey:(id)a3 assetID:(id)a4;
- (id)resourceURLForKey:(id)a3 assetID:(id)a4;
- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4;
- (id)virtualResourcesForAsset:(id)a3;
- (signed)_cloudSharedAssetPlaceholderKindFromSharedStreamsResourceType:(unsigned int)a3;
- (signed)_localAvailabilityForAsset:(id)a3 album:(id)a4 type:(unsigned int)a5;
- (signed)_remoteAvailabilityForType:(unsigned int)a3;
- (unsigned)_mainResourceTypeForAsset:(id)a3;
- (void)_prepareForDownloadNotification:(id)a3 atFileURL:(id)a4 completion:(id)a5;
- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10;
@end

@implementation PLSharedStreamsDataStore

+ (id)supportedRecipes
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (unsigned)keyLengthWithDataPreview:(unsigned __int8)a3
{
  return +[PLSharedStreamsDataStoreKey dataLengthFromPreviewByte:a3];
}

+ (unsigned)storeClassID
{
  return 2;
}

+ (unsigned)_masterThumbRecipeID
{
  return 272155;
}

- (id)requiredExternalResourcesForMigratingOrImportingAsset:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v4 isCloudSharedAsset])
  {
    v6 = [v4 albums];
    v7 = [v6 anyObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
      v9 = [(PLSharedStreamsDataStore *)self _sharedStreamsExternalResourceForAsset:v4 album:v8 type:[(PLSharedStreamsDataStore *)self _mainResourceTypeForAsset:v4]];
      [v5 addObject:v9];
      if ([v4 isPhotoIris])
      {
        v10 = [(PLSharedStreamsDataStore *)self _sharedStreamsExternalResourceForAsset:v4 album:v8 type:6];
        [v5 addObject:v10];
      }
    }
  }
  return v5;
}

- (void)requestStreamingURLForResource:(id)a3 asset:(id)a4 intent:(unint64_t)a5 timeRange:(id *)a6 streamingHints:(id)a7 inContext:(id)a8 clientBundleID:(id)a9 completion:(id)a10
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a10;
  v14 = [v12 mainFileURL];
  v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  v16 = [v14 path];
  int v17 = [v15 fileExistsAtPath:v16];

  if (v17)
  {
    v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = [v12 cloudAssetGUID];
      *(_DWORD *)buf = 138412546;
      v29 = v14;
      __int16 v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_DEFAULT, "Using local file URL %@ for asset %@", buf, 0x16u);
    }
    v20 = [MEMORY[0x1E4F1C9C8] now];
    v21 = [v20 dateByAddingTimeInterval:600.0];
    (*((void (**)(id, void *, void, void *, void, void))v13 + 2))(v13, v14, 0, v21, 0, 0);

    goto LABEL_10;
  }
  if ([v11 dataStoreSubtype] == 7)
  {
    uint64_t v22 = 6;
LABEL_9:
    v20 = +[PLPhotoSharingHelper sharingPersonID];
    v23 = [v12 cloudAssetGUID];
    v24 = [MEMORY[0x1E4F77A58] sharedConnection];
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __133__PLSharedStreamsDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke;
    v26[3] = &unk_1E5865B20;
    id v27 = v13;
    [v24 videoURLsForAssetCollectionWithGUID:v23 forMediaAssetType:v22 personID:v20 completionBlock:v26];

LABEL_10:
    goto LABEL_11;
  }
  if ([v11 dataStoreSubtype] == 8)
  {
    uint64_t v22 = 7;
    goto LABEL_9;
  }
  v25 = PLImageManagerGetLog();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B3C7000, v25, OS_LOG_TYPE_ERROR, "Resource does not support streaming URL", buf, 2u);
  }

  (*((void (**)(id, void, void, void, void, void))v13 + 2))(v13, 0, 0, 0, 0, 0);
LABEL_11:
}

void __133__PLSharedStreamsDataStore_requestStreamingURLForResource_asset_intent_timeRange_streamingHints_inContext_clientBundleID_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a4;
  id v8 = a2;
  id v9 = [a3 firstObject];
  (*(void (**)(uint64_t, id, void, id, void, id))(v6 + 16))(v6, v9, 0, v7, 0, v8);
}

- (BOOL)canStreamResource:(id)a3
{
  id v3 = a3;
  int v4 = [v3 dataStoreSubtype];
  id v5 = [v3 uniformTypeIdentifier];

  char v6 = [v5 conformsToMovie];
  if (v4 == 2) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }
  BOOL v8 = v4 != 6 && v7;

  return v8;
}

- (BOOL)videoResource:(id)a3 matchesOrExceedsQualityLevel:(unsigned int)a4
{
  int v5 = [a3 dataStoreSubtype];
  BOOL v6 = a4 == 3;
  if (v5 != 7) {
    BOOL v6 = 0;
  }
  if (v5 == 8) {
    BOOL v6 = 1;
  }
  return v5 == 6 || v6;
}

- (BOOL)dataStoreSubtypeIsDownloadable:(int64_t)a3
{
  return (unint64_t)(a3 - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (id)requestLocalAvailabilityChange:(signed __int16)a3 forResource:(id)a4 options:(id)a5 completion:(id)a6
{
  int v8 = a3;
  v84[1] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = [v10 asset];
  uint64_t v14 = [v10 dataStoreSubtype];
  v59 = [v10 objectID];
  v15 = [v13 albums];
  v16 = [v15 anyObject];

  v60 = [v13 assetID];
  v58 = [v16 photoLibrary];
  if ([v11 isTransient])
  {
    int v17 = [NSString stringWithFormat:@"Transient downloads not supported for shared streams"];
    v18 = PLImageManagerGetLog();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v17;
      _os_log_impl(&dword_19B3C7000, v18, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C520];
    uint64_t v83 = *MEMORY[0x1E4F28568];
    v84[0] = v17;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v22 = (id *)v84;
    v23 = &v83;
LABEL_19:
    v25 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:1];
    v26 = [v19 errorWithDomain:v20 code:47001 userInfo:v25];
    (*((void (**)(id, void *, void, void))v12 + 2))(v12, v26, 0, 0);
    goto LABEL_20;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v31 = NSString;
    uint64_t v32 = [v16 objectID];
    int v17 = [v31 stringWithFormat:@"Shared stream downloads are only supported for shared albums, album: %@", v32];

    v33 = PLImageManagerGetLog();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v17;
      _os_log_impl(&dword_19B3C7000, v33, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C520];
    uint64_t v81 = *MEMORY[0x1E4F28568];
    v82 = v17;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v22 = (id *)&v82;
    v23 = &v81;
    goto LABEL_19;
  }
  v24 = [v16 photoLibrary];

  if (!v24)
  {
    int v17 = [NSString stringWithFormat:@"Shared stream download requires photo library to be set on album."];
    v34 = PLImageManagerGetLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v74 = v17;
      _os_log_impl(&dword_19B3C7000, v34, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
    }

    v19 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v20 = *MEMORY[0x1E4F8C520];
    uint64_t v79 = *MEMORY[0x1E4F28568];
    v80 = v17;
    v21 = (void *)MEMORY[0x1E4F1C9E8];
    uint64_t v22 = (id *)&v80;
    v23 = &v79;
    goto LABEL_19;
  }
  v54 = self;
  int v17 = v16;
  v25 = [[PLSharedStreamsDataStoreKey alloc] initWithAsset:v13 album:v17 type:v14];
  v26 = [(PLSharedStreamsDataStoreKey *)v25 fileURLForAssetID:v60];
  if (v25)
  {
    v70[0] = MEMORY[0x1E4F143A8];
    v70[1] = 3221225472;
    v70[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke;
    v70[3] = &unk_1E5865AD0;
    id v52 = v12;
    id v72 = v52;
    id v71 = v10;
    v57 = (void (**)(void, void, void, void))MEMORY[0x19F38D650](v70);
    if (v8 < 1)
    {
      v41 = PLImageManagerGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B3C7000, v41, OS_LOG_TYPE_DEBUG, "[RM] This business is totally not supported yet", buf, 2u);
      }
    }
    else
    {
      v55 = v11;
      id v27 = [MEMORY[0x1E4F28CB8] defaultManager];
      v28 = [v26 path];
      int v50 = [v27 fileExistsAtPath:v28];

      if (v50)
      {
        v29 = PLImageManagerGetLog();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          if (v14 > 9) {
            __int16 v30 = @"vid-post-frame";
          }
          else {
            __int16 v30 = off_1E5874498[v14];
          }
          v48 = v30;
          *(_DWORD *)buf = 138412290;
          v74 = v48;
          _os_log_impl(&dword_19B3C7000, v29, OS_LOG_TYPE_DEBUG, "[RM] Shared streams resource: %@ already on disk, skipping download and marking as locally available", buf, 0xCu);
        }
        v41 = [(PLSharedStreamsDataStoreKey *)v25 keyData];
        ((void (**)(void, void *, NSObject *, void *))v57)[2](v57, v59, v41, v58);
        id v11 = v55;
      }
      else
      {
        uint64_t v42 = [(PLSharedStreamsDataStore *)v54 _cloudSharedAssetPlaceholderKindFromSharedStreamsResourceType:v14];
        v43 = [v13 uuid];
        unsigned int v51 = v42;
        v44 = +[PLPhotoSharingHelper downloadNotificationForAssetwithUUID:v43 cloudPlaceholderKind:v42];

        v45 = [v13 uuid];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_78;
        v61[3] = &unk_1E5865AF8;
        v41 = v44;
        int v69 = v14;
        v62 = v41;
        id v63 = v45;
        id v67 = v52;
        v68 = v57;
        id v64 = v59;
        v65 = v25;
        id v66 = v58;
        id v53 = v45;
        [(PLSharedStreamsDataStore *)v54 _prepareForDownloadNotification:v41 atFileURL:v26 completion:v61];
        v46 = PLImageManagerGetLog();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
        {
          if (v14 > 9) {
            v47 = @"vid-post-frame";
          }
          else {
            v47 = off_1E5874498[v14];
          }
          v49 = v47;
          *(_DWORD *)buf = 138412546;
          v74 = v49;
          __int16 v75 = 2112;
          v76 = v41;
          _os_log_impl(&dword_19B3C7000, v46, OS_LOG_TYPE_DEBUG, "[RM] Starting download for shared streams resource: %@ with notification: %@", buf, 0x16u);
        }
        id v11 = v55;
        +[PLPhotoSharingHelper downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:](PLPhotoSharingHelper, "downloadAsset:cloudPlaceholderKind:shouldPrioritize:shouldExtendTimer:", v13, v51, [v55 shouldPrioritize], objc_msgSend(v55, "shouldPrioritize"));
      }
    }

    v40 = v72;
  }
  else
  {
    v36 = (void *)MEMORY[0x1E4F28C58];
    id v56 = v11;
    uint64_t v37 = *MEMORY[0x1E4F8C520];
    uint64_t v77 = *MEMORY[0x1E4F28568];
    v78 = @"Unable to generate a shared stream key.";
    v38 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v78 forKeys:&v77 count:1];
    uint64_t v39 = v37;
    id v11 = v56;
    v40 = [v36 errorWithDomain:v39 code:5 userInfo:v38];

    (*((void (**)(id, void *, void, void))v12 + 2))(v12, v40, 0, 0);
  }

LABEL_20:
  return 0;
}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_2;
  v17[3] = &unk_1E5873A50;
  id v18 = v9;
  id v19 = v7;
  id v20 = v8;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_3;
  v13[3] = &unk_1E5874868;
  id v14 = v18;
  id v16 = *(id *)(a1 + 40);
  id v15 = *(id *)(a1 + 32);
  id v10 = v18;
  id v11 = v8;
  id v12 = v7;
  [v10 performTransaction:v17 completionHandler:v13];
}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_78(uint64_t a1, int a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v4 = PLImageManagerGetLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = @"NO";
    BOOL v6 = *(__CFString **)(a1 + 32);
    if (a2) {
      int v5 = @"YES";
    }
    *(_DWORD *)buf = 138412546;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v5;
    _os_log_impl(&dword_19B3C7000, v4, OS_LOG_TYPE_DEBUG, "[RM] Download notification received: %@, file present: %@", buf, 0x16u);
  }

  if (a2)
  {
    uint64_t v7 = *(void *)(a1 + 80);
    uint64_t v8 = *(void *)(a1 + 48);
    id v9 = [*(id *)(a1 + 56) keyData];
    (*(void (**)(uint64_t, uint64_t, void *, void))(v7 + 16))(v7, v8, v9, *(void *)(a1 + 64));
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F59778];
    uint64_t v18 = *MEMORY[0x1E4F28228];
    id v19 = @"Shared stream resource download request failed.";
    id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    id v9 = [v10 errorWithDomain:v11 code:81 userInfo:v12];

    id v13 = PLImageManagerGetLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v14 = *(unsigned int *)(a1 + 88);
      if (v14 > 9) {
        id v15 = @"vid-post-frame";
      }
      else {
        id v15 = off_1E5874498[v14];
      }
      id v16 = v15;
      int v17 = *(__CFString **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v21 = v16;
      __int16 v22 = 2112;
      v23 = v17;
      _os_log_impl(&dword_19B3C7000, v13, OS_LOG_TYPE_ERROR, "Failed to download shared streams resource: %@ for asset: %@", buf, 0x16u);
    }
    (*(void (**)(void, void *, void, void))(*(void *)(a1 + 72) + 16))(*(void *)(a1 + 72), v9, 0, 0);
  }
}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) managedObjectContext];
  id v4 = [v2 objectWithID:*(void *)(a1 + 40)];

  [v4 setLocalAvailability:1];
  [v4 setDataStoreKeyData:*(void *)(a1 + 48)];
  id v3 = [v4 asset];
  [v3 recalculateImageRequestHints];
}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_3(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_4;
  v3[3] = &unk_1E58742F0;
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  [v2 performBlock:v3];
}

void __90__PLSharedStreamsDataStore_requestLocalAvailabilityChange_forResource_options_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) fileURL];
  (*(void (**)(uint64_t, void, void, id))(v1 + 16))(v1, 0, 0, v2);
}

- (BOOL)storeExternalResource:(id)a3 forAsset:(id)a4 options:(id)a5 error:(id *)a6 resultingResource:(id *)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = [v10 uniformTypeIdentifier];

  if (!v12)
  {
    id v13 = -[PLResourceDataStore guessUTIForExternalResource:forAssetKind:](self, "guessUTIForExternalResource:forAssetKind:", v10, [v11 kind]);
    [v10 setUniformTypeIdentifier:v13];

    uint64_t v14 = PLImageManagerGetLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = [v11 uuid];
      *(_DWORD *)buf = 138543618;
      id v29 = v10;
      __int16 v30 = 2114;
      v31 = v15;
      _os_log_impl(&dword_19B3C7000, v14, OS_LOG_TYPE_DEFAULT, "[RM] guessed UTI for external resource: %{public}@ for asset uuid: %{public}@", buf, 0x16u);
    }
  }
  if ([(PLSharedStreamsDataStore *)self canStoreExternalResource:v10]
    && [v11 isCloudSharedAsset])
  {
    id v16 = v10;
    int v17 = [v11 albums];
    uint64_t v18 = [v17 anyObject];

    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass)
    {
      id v20 = v18;
      v21 = [v11 fetchOrCreateResourceWithIdentity:v16];
      objc_msgSend(v21, "setDataStoreClassID:", (__int16)objc_msgSend((id)objc_opt_class(), "storeClassID"));
      objc_msgSend(v21, "setRecipeID:", objc_msgSend(v16, "recipeID"));
      objc_msgSend(v21, "setDataStoreSubtype:", objc_msgSend(v16, "sharedStreamsType"));
      __int16 v22 = [v16 codecFourCharCode];

      if (v22)
      {
        v23 = [v16 codecFourCharCode];
        [v21 setCodecFourCharCodeName:v23];
      }
      objc_msgSend(v21, "setUnorientedWidth:", objc_msgSend(v16, "unorientedWidth"));
      objc_msgSend(v21, "setUnorientedHeight:", objc_msgSend(v16, "unorientedHeight"));
      objc_msgSend(v21, "setLocalAvailability:", -[PLSharedStreamsDataStore _localAvailabilityForAsset:album:type:](self, "_localAvailabilityForAsset:album:type:", v11, v20, objc_msgSend(v16, "sharedStreamsType")));
      id v27 = v20;
      if ([v21 localAvailability] == 1)
      {
        uint64_t v24 = -[PLSharedStreamsDataStoreKey initWithAsset:album:type:]([PLSharedStreamsDataStoreKey alloc], "initWithAsset:album:type:", v11, v20, [v16 sharedStreamsType]);
        v25 = [(PLSharedStreamsDataStoreKey *)v24 keyData];
        [v21 setDataStoreKeyData:v25];
      }
      else
      {
        [v21 setDataStoreKeyData:0];
      }
      objc_msgSend(v21, "setRemoteAvailability:", -[PLSharedStreamsDataStore _remoteAvailabilityForType:](self, "_remoteAvailabilityForType:", objc_msgSend(v16, "sharedStreamsType")));
      if (a7) {
        *a7 = v21;
      }
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (BOOL)canStoreExternalResource:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)updateDerivativeResourcesForAsset:(id)a3 forLifecycleEvent:(unsigned int)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = [MEMORY[0x1E4F1CA80] set];
  if (a4 <= 2 && [v6 isCloudSharedAsset])
  {
    id v9 = [v6 albums];
    id v10 = [v9 anyObject];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = v10;
      if (![v6 kind])
      {
        id v12 = [(PLSharedStreamsDataStore *)self _sharedStreamsExternalResourceForAsset:v6 album:v11 type:4];
        [v7 addObject:v12];
      }
      if ([v6 kind] == 1)
      {
        id v13 = [(PLSharedStreamsDataStore *)self _sharedStreamsExternalResourceForAsset:v6 album:v11 type:7];
        [v7 addObject:v13];
        uint64_t v14 = [(PLSharedStreamsDataStore *)self _sharedStreamsExternalResourceForAsset:v6 album:v11 type:8];
        [v7 addObject:v14];
      }
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v7;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        id v25 = 0;
        id v26 = 0;
        [(PLSharedStreamsDataStore *)self storeExternalResource:v20 forAsset:v6 options:0 error:&v26 resultingResource:&v25];
        id v21 = v26;
        id v22 = v25;
        v23 = v22;
        if (v22)
        {
          [v22 setAsset:v6];
          [v8 addObject:v23];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v17);
  }

  return v8;
}

- (id)virtualResourcesForAsset:(id)a3
{
  return (id)MEMORY[0x1E4F1CBF0];
}

- (id)expectedFileURLForResource:(id)a3 asset:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 albums];
  uint64_t v8 = [v7 anyObject];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v8;
    id v10 = -[PLSharedStreamsDataStoreKey initWithAsset:album:type:]([PLSharedStreamsDataStoreKey alloc], "initWithAsset:album:type:", v6, v9, [v5 dataStoreSubtype]);

    id v11 = [v6 assetID];
    id v12 = [(PLSharedStreamsDataStoreKey *)v10 fileURLForAssetID:v11];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

- (id)resourceURLForKey:(id)a3 assetID:(id)a4
{
  return (id)[a3 fileURLForAssetID:a4];
}

- (id)resourceDataForKey:(id)a3 assetID:(id)a4
{
  id v4 = [a3 fileURLForAssetID:a4];
  if (v4)
  {
    id v5 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v4];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)keyFromKeyStruct:(const void *)a3
{
  id v3 = [[PLSharedStreamsDataStoreKey alloc] initWithKeyStruct:a3];
  return v3;
}

- (id)descriptionForSubtype:(int64_t)a3
{
  if (a3 > 9) {
    return @"vid-post-frame";
  }
  else {
    return off_1E5874498[a3];
  }
}

- (id)name
{
  return @"SharedStreams";
}

- (unsigned)_mainResourceTypeForAsset:(id)a3
{
  if ([a3 kind]) {
    return 5;
  }
  else {
    return 3;
  }
}

- (signed)_remoteAvailabilityForType:(unsigned int)a3
{
  return a3 - 3 < 6;
}

- (signed)_localAvailabilityForAsset:(id)a3 album:(id)a4 type:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v10 = [v7 assetID];
  switch((int)v5)
  {
    case 1:
    case 2:
      id v11 = [v7 mainFileURL];
      id v12 = [v11 path];

      BOOL v13 = [v9 fileExistsAtPath:v12] == 0;
      goto LABEL_11;
    case 3:
      if ([v7 cloudPlaceholderKind] != 4) {
        goto LABEL_5;
      }
      uint64_t v14 = [PLSharedStreamsDataStoreKey alloc];
      id v15 = v7;
      id v16 = v8;
      uint64_t v17 = 3;
      goto LABEL_9;
    case 4:
      if ([v7 cloudPlaceholderKind] != 3) {
        goto LABEL_14;
      }
      uint64_t v14 = [PLSharedStreamsDataStoreKey alloc];
      id v15 = v7;
      id v16 = v8;
      uint64_t v17 = 4;
      goto LABEL_9;
    case 5:
      uint64_t v14 = [PLSharedStreamsDataStoreKey alloc];
      id v15 = v7;
      id v16 = v8;
      uint64_t v17 = 5;
      goto LABEL_9;
    case 6:
LABEL_5:
      uint64_t v14 = [PLSharedStreamsDataStoreKey alloc];
      id v15 = v7;
      id v16 = v8;
      uint64_t v17 = v5;
LABEL_9:
      uint64_t v18 = [(PLSharedStreamsDataStoreKey *)v14 initWithAsset:v15 album:v16 type:v17];
      id v12 = v18;
      if (v18)
      {
        id v19 = [(PLSharedStreamsDataStoreKey *)v18 fileURLForAssetID:v10];
        uint64_t v20 = [v19 path];
        int v21 = [v9 fileExistsAtPath:v20];

        BOOL v13 = v21 == 0;
LABEL_11:
        if (v13) {
          signed __int16 v22 = -1;
        }
        else {
          signed __int16 v22 = 1;
        }
      }
      else
      {
        signed __int16 v22 = -1;
      }

      break;
    default:
LABEL_14:
      signed __int16 v22 = -1;
      break;
  }

  return v22;
}

- (id)_sharedStreamsExternalResourceForAsset:(id)a3 album:(id)a4 type:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v7 = a3;
  id v8 = objc_alloc_init(PLSharedStreamsValidatedExternalResource);
  [(PLSharedStreamsValidatedExternalResource *)v8 setSharedStreamsType:v5];
  [(PLValidatedExternalResource *)v8 setVersion:0];
  id v9 = [(PLSharedStreamsDataStore *)self _utiStringForAsset:v7 type:v5];
  if (v9)
  {
    id v10 = +[PLUniformTypeIdentifier utiWithIdentifier:v9];
    [(PLValidatedExternalResource *)v8 setUniformTypeIdentifier:v10];
  }
  if (v5 > 9) {
    uint64_t v11 = 3;
  }
  else {
    uint64_t v11 = dword_19BA9A914[v5];
  }
  [(PLValidatedExternalResource *)v8 setResourceType:v11];
  switch((int)v5)
  {
    case 3:
      -[PLValidatedExternalResource setUnorientedWidth:](v8, "setUnorientedWidth:", [v7 originalWidth]);
      uint64_t v12 = [v7 originalHeight];
      goto LABEL_19;
    case 4:
      +[PLPhotoSharingHelper derivedAssetSizeForMasterSizeWidth:height:derivativeType:withSpecificationInfo:](PLPhotoSharingHelper, "derivedAssetSizeForMasterSizeWidth:height:derivativeType:withSpecificationInfo:", 1, 0, (double)[v7 originalWidth], (double)objc_msgSend(v7, "originalHeight"));
      goto LABEL_17;
    case 5:
      +[PLPhotoSharingHelper videoPosterFrameDimension];
      double v16 = v15;
      double v18 = v17;
      double v19 = (double)[v7 width];
      double v20 = (double)[v7 height];
      if (v16 <= v18) {
        double v21 = v18;
      }
      else {
        double v21 = v16;
      }
      int v22 = (int)v21;
      float v23 = v19 / v20;
      double v13 = (double)(int)v21;
      double v24 = v23;
      if (v19 <= v20)
      {
        double v25 = (double)v22;
        double v13 = rint(v24 * v13);
      }
      else
      {
        double v25 = rint(v13 / v24);
      }
      goto LABEL_18;
    case 7:
      double v26 = (double)[v7 width];
      double v27 = (double)[v7 height];
      double v28 = 360.0;
      goto LABEL_16;
    case 8:
      double v26 = (double)[v7 width];
      double v27 = (double)[v7 height];
      double v28 = 720.0;
LABEL_16:
      +[PLPrimaryResourceDataStoreImageRecipe scaleOriginalSize:toShortSideTarget:maxLongSideLength:](PLPrimaryResourceDataStoreImageRecipe, "scaleOriginalSize:toShortSideTarget:maxLongSideLength:", v26, v27, v28, 0.0);
LABEL_17:
      double v25 = v14;
LABEL_18:
      [(PLValidatedExternalResource *)v8 setUnorientedWidth:(uint64_t)v13];
      uint64_t v12 = (uint64_t)v25;
LABEL_19:
      [(PLValidatedExternalResource *)v8 setUnorientedHeight:v12];
      break;
    default:
      break;
  }

  return v8;
}

- (BOOL)_isDerivativeForSharedStreamsType:(unsigned int)a3
{
  return (a3 < 0xA) & (0x3B1u >> a3);
}

- (id)_utiStringForAsset:(id)a3 type:(unsigned int)a4
{
  id v5 = a3;
  id v6 = v5;
  switch(a4)
  {
    case 1u:
    case 2u:
      uint64_t v8 = [v5 originalUniformTypeIdentifier];
      goto LABEL_8;
    case 3u:
    case 4u:
    case 5u:
      id v7 = (id *)MEMORY[0x1E4F44410];
      goto LABEL_7;
    case 6u:
      id v7 = (id *)MEMORY[0x1E4F44490];
      goto LABEL_7;
    case 7u:
    case 8u:
      id v7 = (id *)MEMORY[0x1E4F44438];
LABEL_7:
      uint64_t v8 = [*v7 identifier];
LABEL_8:
      id v9 = (void *)v8;
      break;
    default:
      id v9 = 0;
      break;
  }

  return v9;
}

- (void)_prepareForDownloadNotification:(id)a3 atFileURL:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_prepareForDownloadNotification_atFileURL_completion__onceToken != -1) {
    dispatch_once(&_prepareForDownloadNotification_atFileURL_completion__onceToken, &__block_literal_global_16917);
  }
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__16918;
  uint64_t v37 = __Block_byref_object_dispose__16919;
  dispatch_group_t v38 = dispatch_group_create();
  dispatch_group_enter((dispatch_group_t)v34[5]);
  uint64_t v11 = v34[5];
  uint64_t v12 = _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_47;
  block[3] = &unk_1E58742F0;
  id v13 = v9;
  id v31 = v13;
  id v14 = v10;
  id v32 = v14;
  dispatch_group_notify(v11, v12, block);
  int out_token = 0;
  id v15 = v8;
  double v16 = (const char *)[v15 UTF8String];
  double v17 = _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_2;
  handler[3] = &unk_1E586C740;
  handler[4] = self;
  id v18 = v15;
  id v27 = v18;
  double v28 = &v33;
  notify_register_dispatch(v16, &out_token, v17, handler);
  dispatch_time_t v19 = dispatch_time(0, 300000000000);
  double v20 = _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_50;
  v22[3] = &unk_1E5865AA8;
  id v23 = v18;
  double v24 = &v33;
  int v25 = out_token;
  id v21 = v18;
  dispatch_after(v19, v20, v22);

  _Block_object_dispose(&v33, 8);
}

uint64_t __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_47(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v3 = [*(id *)(a1 + 32) path];
  [v2 fileExistsAtPath:v3];

  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

uint64_t __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_2(void *a1, int a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = PLBackendGetLog();
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
    id v9 = *(void **)(v7 + 40);
  }
  else
  {
    id v9 = 0;
  }
  *(void *)(v7 + 40) = 0;

  return notify_cancel(a2);
}

uint64_t __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke_50(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v2 = PLImageManagerGetLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_19B3C7000, v2, OS_LOG_TYPE_DEBUG, "[RM] Shared streams download timed out for notification: %@", (uint8_t *)&v8, 0xCu);
  }

  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v5 = *(NSObject **)(v4 + 40);
  if (v5)
  {
    dispatch_group_leave(v5);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void **)(v4 + 40);
  }
  else
  {
    uint64_t v6 = 0;
  }
  *(void *)(v4 + 40) = 0;

  return notify_cancel(*(_DWORD *)(a1 + 48));
}

void __81__PLSharedStreamsDataStore__prepareForDownloadNotification_atFileURL_completion___block_invoke()
{
  id v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.assetsd.mediastreamdownloadqueue", v2);
  uint64_t v1 = (void *)_prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue;
  _prepareForDownloadNotification_atFileURL_completion__mediaStreamDownloadQueue = (uint64_t)v0;
}

- (signed)_cloudSharedAssetPlaceholderKindFromSharedStreamsResourceType:(unsigned int)a3
{
  if (a3 > 9) {
    return 3;
  }
  else {
    return word_19BA9A900[a3];
  }
}

@end