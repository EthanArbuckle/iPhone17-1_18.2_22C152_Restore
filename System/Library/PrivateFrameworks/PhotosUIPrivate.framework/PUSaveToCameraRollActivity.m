@interface PUSaveToCameraRollActivity
- (BOOL)_itemIsVideoAtURL:(id)a3;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PXActivityItemSourceController)itemSourceController;
- (void)performActivity;
- (void)setItemSourceController:(id)a3;
@end

@implementation PUSaveToCameraRollActivity

- (void).cxx_destruct
{
}

- (void)setItemSourceController:(id)a3
{
}

- (PXActivityItemSourceController)itemSourceController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_itemSourceController);
  return (PXActivityItemSourceController *)WeakRetained;
}

- (BOOL)_itemIsVideoAtURL:(id)a3
{
  id v3 = a3;
  char v13 = 0;
  v4 = [MEMORY[0x1E4F28CB8] defaultManager];
  v5 = [v3 path];
  int v6 = [v4 fileExistsAtPath:v5 isDirectory:&v13];

  char v7 = 0;
  if (v6) {
    BOOL v8 = v13 == 0;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    v9 = (void *)MEMORY[0x1E4F442D8];
    v10 = [v3 pathExtension];
    v11 = [v9 typeWithFilenameExtension:v10];

    if (v11) {
      char v7 = [v11 conformsToType:*MEMORY[0x1E4F44448]];
    }
    else {
      char v7 = 0;
    }
  }
  return v7;
}

- (void)performActivity
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  v39 = [(PUSaveToCameraRollActivity *)self itemSourceController];
  v52 = [v39 activityViewController];
  v51 = [(UISaveToCameraRollActivity *)self activityType];
  v2 = [v39 assetItemSources];
  id v3 = dispatch_group_create();
  v42 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v76 = 0u;
  long long v77 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v2;
  uint64_t v4 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v75;
    uint64_t v41 = *MEMORY[0x1E4F15758];
    uint64_t v40 = *MEMORY[0x1E4F15AB0];
    *(void *)&long long v5 = 138412546;
    long long v38 = v5;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v75 != v6) {
          objc_enumerationMutation(obj);
        }
        BOOL v8 = *(void **)(*((void *)&v74 + 1) + 8 * v7);
        v9 = objc_msgSend(v8, "asset", v38);
        if (v9)
        {
          dispatch_group_enter(v3);
          char v10 = [v9 isStreamedVideo];
          v11 = [v8 activityViewController:v52 itemForActivityType:v51];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
          if (v10)
          {
            if ((isKindOfClass & 1) != 0
              && [(PUSaveToCameraRollActivity *)self _itemIsVideoAtURL:v11])
            {
              *(void *)buf = 0;
              v64 = buf;
              uint64_t v65 = 0x3032000000;
              v66 = __Block_byref_object_copy__80120;
              v67 = __Block_byref_object_dispose__80121;
              id v13 = v11;
              id v68 = v13;
              v14 = dispatch_group_create();
              dispatch_group_enter(v14);
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_196;
              block[3] = &unk_1E5F2E200;
              v62 = buf;
              v61 = v3;
              dispatch_group_t group = v14;
              dispatch_group_notify(v14, MEMORY[0x1E4F14428], block);
              if ([v9 sourceType] == 2 && objc_msgSend(v9, "playbackStyle") == 5)
              {
                id v15 = v13;
                v44 = [v15 lastPathComponent];
                v43 = v15;
                v16 = [v15 URLByDeletingLastPathComponent];
                v45 = [v16 URLByAppendingPathComponent:@"transcoded"];

                v47 = [v45 URLByAppendingPathComponent:v44];
                v17 = [v47 path];
                int v18 = [v42 fileExistsAtPath:v17];

                if (v18)
                {
                  id v59 = 0;
                  char v19 = [v42 removeItemAtURL:v47 error:&v59];
                  id v20 = v59;
                  if ((v19 & 1) == 0)
                  {
                    v21 = PLUIGetLog();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v78 = v38;
                      v79 = v47;
                      __int16 v80 = 2112;
                      id v81 = v20;
                      v22 = v21;
                      v23 = "Share Sheet: failed to delete already-existing transcoded video at url: %@, reason: %@";
                      goto LABEL_29;
                    }
                    goto LABEL_30;
                  }
                }
                else
                {
                  id v58 = 0;
                  int v29 = [v42 createDirectoryAtURL:v45 withIntermediateDirectories:1 attributes:0 error:&v58];
                  id v20 = v58;
                  if ((v29 & 1) == 0)
                  {
                    v21 = PLUIGetLog();
                    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)v78 = v38;
                      v79 = v45;
                      __int16 v80 = 2112;
                      id v81 = v20;
                      v22 = v21;
                      v23 = "Share Sheet: failed to create transcode directory at url: %@, reason: %@";
LABEL_29:
                      _os_log_impl(&dword_1AE9F8000, v22, OS_LOG_TYPE_ERROR, v23, v78, 0x16u);
                    }
LABEL_30:
                  }
                }

                v46 = [MEMORY[0x1E4F16330] assetWithURL:v43];
                v30 = [MEMORY[0x1E4F1CA48] array];
                v31 = (void *)MEMORY[0x1E4F8CC50];
                v32 = [MEMORY[0x1E4F8CC48] playbackVariationMetadataIdentifier];
                v33 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", objc_msgSend(v9, "playbackVariation"));
                [v31 addQuickTimeMetadataItemsWithIdentifier:v32 value:v33 toItems:v30];

                v34 = [v46 metadata];
                [v30 addObjectsFromArray:v34];

                v35 = (void *)MEMORY[0x1E4F8AC98];
                v54[0] = MEMORY[0x1E4F143A8];
                v54[1] = 3221225472;
                v54[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_208;
                v54[3] = &unk_1E5F2B8A0;
                v57 = buf;
                id v36 = v43;
                id v55 = v36;
                v56 = group;
                [v35 transcodeVideo:v46 outputURL:v47 presetName:v41 outputFileType:v40 metadata:v30 completionHandler:v54];
              }
              else
              {
                dispatch_group_leave(v14);
              }

              _Block_object_dispose(buf, 8);
LABEL_22:

              goto LABEL_23;
            }
          }
          else
          {
            if (isKindOfClass)
            {
              v24 = (void *)[objc_alloc(MEMORY[0x1E4F8CE20]) initWithBundleAtURL:v11];
              v25 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
              uint64_t v26 = MEMORY[0x1E4F143A8];
              v71[0] = MEMORY[0x1E4F143A8];
              v71[1] = 3221225472;
              v71[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke;
              v71[3] = &unk_1E5F2ECC8;
              id v72 = v24;
              id v73 = v11;
              v69[0] = v26;
              v69[1] = 3221225472;
              v69[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2;
              v69[3] = &unk_1E5F2E3B8;
              v70 = v3;
              id v27 = v24;
              [v25 performChanges:v71 completionHandler:v69];

              goto LABEL_22;
            }
            v28 = PLUIGetLog();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AE9F8000, v28, OS_LOG_TYPE_ERROR, "Share Sheet: did not get a URL for an in-app save", buf, 2u);
            }
          }
          dispatch_group_leave(v3);
          goto LABEL_22;
        }
LABEL_23:

        ++v7;
      }
      while (v4 != v7);
      uint64_t v37 = [obj countByEnumeratingWithState:&v74 objects:v82 count:16];
      uint64_t v4 = v37;
    }
    while (v37);
  }

  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_210;
  v53[3] = &unk_1E5F2ED10;
  v53[4] = self;
  dispatch_group_notify(v3, MEMORY[0x1E4F14428], v53);
}

id __45__PUSaveToCameraRollActivity_performActivity__block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    return (id)objc_msgSend(MEMORY[0x1E4F38F28], "creationRequestForAssetFromVideoComplementBundle:");
  }
  else {
    return (id)[MEMORY[0x1E4F38F28] creationRequestForAssetFromImageAtFileURL:*(void *)(a1 + 40)];
  }
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    uint64_t v6 = PLUIGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_ERROR, "Share Sheet: failed to save cloud shared asset to library with error: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_196(uint64_t a1)
{
  v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2_197;
  v3[3] = &unk_1E5F2E228;
  v3[4] = *(void *)(a1 + 40);
  [v2 performChangesAndWait:v3 error:0];

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_208(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = v7;
  if (!v6 || v7)
  {
    uint64_t v9 = PLUIGetLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      uint64_t v10 = *(void *)(a1 + 32);
      int v11 = 138412546;
      uint64_t v12 = v10;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1AE9F8000, v9, OS_LOG_TYPE_ERROR, "Share Sheet: failed to passthrough-transcode shared video at url: %@, reason: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __45__PUSaveToCameraRollActivity_performActivity__block_invoke_210(uint64_t a1)
{
  return [*(id *)(a1 + 32) activityDidFinish:1];
}

void __45__PUSaveToCameraRollActivity_performActivity__block_invoke_2_197(uint64_t a1)
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F38F70]);
  [v3 setShouldMoveFile:1];
  v2 = [MEMORY[0x1E4F38F28] creationRequestForAsset];
  [v2 addResourceWithType:2 fileURL:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) options:v3];
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v16.receiver = self;
  v16.super_class = (Class)PUSaveToCameraRollActivity;
  if ([(UISaveToCameraRollActivity *)&v16 canPerformWithActivityItems:a3])
  {
    uint64_t v4 = [(PUSaveToCameraRollActivity *)self itemSourceController];
    id v5 = [v4 assets];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if ((objc_msgSend(v10, "isPhotoStreamPhoto", (void)v12) & 1) == 0
            && ![v10 isCloudSharedAsset])
          {
            LOBYTE(v7) = 0;
            goto LABEL_14;
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v7) {
          continue;
        }
        break;
      }
      LOBYTE(v7) = 1;
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v7) = 0;
  }
  return v7;
}

@end