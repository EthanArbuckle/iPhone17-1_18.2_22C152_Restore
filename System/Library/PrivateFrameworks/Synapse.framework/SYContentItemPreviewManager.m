@interface SYContentItemPreviewManager
+ (void)_loadPreviewForAppContentItem:(id)a3 completion:(id)a4;
+ (void)_loadPreviewMetadataForItem:(id)a3 fullDetail:(BOOL)a4 completion:(id)a5;
+ (void)_loadPreviewUsingLPForItem:(id)a3 fullDetail:(BOOL)a4 completion:(id)a5;
+ (void)loadPreviewDataForItems:(id)a3 fullDetail:(BOOL)a4 didFinishLoadingPreviewHandler:(id)a5;
@end

@implementation SYContentItemPreviewManager

+ (void)loadPreviewDataForItems:(id)a3 fullDetail:(BOOL)a4 didFinishLoadingPreviewHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        v15 = os_log_create("com.apple.synapse", "ContentItemManager");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v24 = v14;
          __int16 v25 = 1024;
          BOOL v26 = v6;
          _os_log_debug_impl(&dword_1C2C5F000, v15, OS_LOG_TYPE_DEBUG, "Start loading preview for item: %@, fullDetail: %d", buf, 0x12u);
        }

        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke;
        v16[3] = &unk_1E6463558;
        BOOL v18 = v6;
        v16[4] = v14;
        id v17 = v9;
        [a1 _loadPreviewMetadataForItem:v14 fullDetail:v6 completion:v16];

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v11);
  }
}

void __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2;
  v7[3] = &unk_1E6463530;
  char v11 = *(unsigned char *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v4;
  id v10 = v5;
  id v6 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "setLinkPreviewMetadata:loadLevel:");
    v2 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2_cold_1((uint64_t *)(a1 + 40), (unsigned __int8 *)(a1 + 56), v2);
    }
  }
  uint64_t v3 = *(void *)(a1 + 48);
  if (v3) {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, *(void *)(a1 + 40));
  }
  uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"SYContentItemLinkPreviewDidFinishLoading" object:*(void *)(a1 + 40)];
}

+ (void)_loadPreviewMetadataForItem:(id)a3 fullDetail:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [v8 itemURL];
  if ((objc_msgSend(v10, "_lp_isHTTPFamilyURL") & 1) != 0 || objc_msgSend(v10, "isFileURL"))
  {
    objc_initWeak(&location, a1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __81__SYContentItemPreviewManager__loadPreviewMetadataForItem_fullDetail_completion___block_invoke;
    v11[3] = &unk_1E6463580;
    objc_copyWeak(&v14, &location);
    id v12 = v8;
    id v13 = v9;
    [a1 _loadPreviewUsingLPForItem:v12 fullDetail:v6 completion:v11];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [a1 _loadPreviewForAppContentItem:v8 completion:v9];
  }
}

void __81__SYContentItemPreviewManager__loadPreviewMetadataForItem_fullDetail_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _loadPreviewForAppContentItem:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
  }
}

+ (void)_loadPreviewUsingLPForItem:(id)a3 fullDetail:(BOOL)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a5;
  char v11 = [v9 itemURL];
  if (!v11)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:a1 file:@"SYContentItemPreviewManager.m" lineNumber:91 description:@"itemURL cannot be nil"];
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke;
  v16[3] = &unk_1E6463530;
  BOOL v20 = a4;
  id v17 = v11;
  id v18 = v9;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v11;
  dispatch_async(MEMORY[0x1E4F14428], v16);
}

void __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke(uint64_t a1)
{
  uint64_t v10 = 0;
  char v11 = &v10;
  uint64_t v12 = 0x2050000000;
  v2 = (void *)getLPMetadataProviderClass_softClass;
  uint64_t v13 = getLPMetadataProviderClass_softClass;
  if (!getLPMetadataProviderClass_softClass)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __getLPMetadataProviderClass_block_invoke;
    v9[3] = &unk_1E64635F8;
    v9[4] = &v10;
    __getLPMetadataProviderClass_block_invoke((uint64_t)v9);
    v2 = (void *)v11[3];
  }
  uint64_t v3 = v2;
  _Block_object_dispose(&v10, 8);
  id v4 = objc_alloc_init(v3);
  [v4 _setShouldDownloadMediaSubresources:*(unsigned __int8 *)(a1 + 56)];
  [v4 _setShouldDownloadImageSubresources:*(unsigned __int8 *)(a1 + 56)];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2;
  v6[3] = &unk_1E64635A8;
  uint64_t v5 = *(void *)(a1 + 32);
  id v7 = *(id *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v4 startFetchingMetadataForURL:v5 completionHandler:v6];
}

void __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = [*(id *)(a1 + 32) displayTitle];

    if (v7)
    {
      id v8 = [*(id *)(a1 + 32) displayTitle];
      [v5 setTitle:v8];
    }
    id v9 = [v5 dataRepresentation];
  }
  else
  {
    uint64_t v10 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2_cold_1(a1, (uint64_t)v6, v10);
    }

    id v9 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

+ (void)_loadPreviewForAppContentItem:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 sourceIdentifier];
  id v8 = v7;
  if (v7 && ([v7 isEqualToString:@"com.apple.synapse.itemSourceID.web"] & 1) == 0)
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F6F248]) initWithBundleIdentifier:v8];
    if (v10)
    {
      char v11 = [MEMORY[0x1E4F6F258] imageDescriptorNamed:*MEMORY[0x1E4F6F280]];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke;
      v13[3] = &unk_1E64635D0;
      id v14 = v5;
      id v15 = v8;
      id v16 = v6;
      [v10 getImageForImageDescriptor:v11 completion:v13];
    }
    else
    {
      uint64_t v12 = os_log_create("com.apple.synapse", "ContentItemManager");
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        +[SYContentItemPreviewManager _loadPreviewForAppContentItem:completion:](v5);
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
  else
  {
    id v9 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      +[SYContentItemPreviewManager _loadPreviewForAppContentItem:completion:](v5);
    }

    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

void __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3 && ([v3 size], v5 > 0.0) && (objc_msgSend(v4, "size"), v6 > 0.0))
  {
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2050000000;
    id v7 = (void *)getLPLinkMetadataClass_softClass;
    uint64_t v28 = getLPLinkMetadataClass_softClass;
    if (!getLPLinkMetadataClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      long long v22 = __getLPLinkMetadataClass_block_invoke;
      v23 = &unk_1E64635F8;
      uint64_t v24 = &v25;
      __getLPLinkMetadataClass_block_invoke((uint64_t)&v20);
      id v7 = (void *)v26[3];
    }
    id v8 = v7;
    _Block_object_dispose(&v25, 8);
    id v9 = objc_alloc_init(v8);
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v10 = (void *)getUIImageClass_softClass;
    uint64_t v28 = getUIImageClass_softClass;
    if (!getUIImageClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      long long v22 = __getUIImageClass_block_invoke;
      v23 = &unk_1E64635F8;
      uint64_t v24 = &v25;
      __getUIImageClass_block_invoke((uint64_t)&v20);
      uint64_t v10 = (void *)v26[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v25, 8);
    uint64_t v12 = objc_msgSend(v11, "imageWithCGImage:", objc_msgSend(v4, "CGImage"));
    uint64_t v25 = 0;
    BOOL v26 = &v25;
    uint64_t v27 = 0x2050000000;
    uint64_t v13 = (void *)getLPImageClass_softClass;
    uint64_t v28 = getLPImageClass_softClass;
    if (!getLPImageClass_softClass)
    {
      uint64_t v20 = MEMORY[0x1E4F143A8];
      uint64_t v21 = 3221225472;
      long long v22 = __getLPImageClass_block_invoke;
      v23 = &unk_1E64635F8;
      uint64_t v24 = &v25;
      __getLPImageClass_block_invoke((uint64_t)&v20);
      uint64_t v13 = (void *)v26[3];
    }
    id v14 = v13;
    _Block_object_dispose(&v25, 8);
    id v15 = (void *)[[v14 alloc] initWithPlatformImage:v12];
    [v9 setIcon:v15];

    id v16 = [*(id *)(a1 + 32) displayTitle];
    [v9 setTitle:v16];

    id v17 = [*(id *)(a1 + 32) itemURL];
    [v9 setOriginalURL:v17];

    id v18 = [*(id *)(a1 + 32) itemURL];
    [v9 setURL:v18];

    id v19 = [v9 dataRepresentation];
  }
  else
  {
    uint64_t v12 = os_log_create("com.apple.synapse", "ContentItemManager");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke_cold_1(a1, v12);
    }
    id v19 = 0;
    id v9 = v12;
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __97__SYContentItemPreviewManager_loadPreviewDataForItems_fullDetail_didFinishLoadingPreviewHandler___block_invoke_2_cold_1(uint64_t *a1, unsigned __int8 *a2, os_log_t log)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 1024;
  int v8 = v4;
  _os_log_debug_impl(&dword_1C2C5F000, log, OS_LOG_TYPE_DEBUG, "Finished loading preview for item: %@, fullDetail: %d", (uint8_t *)&v5, 0x12u);
}

void __80__SYContentItemPreviewManager__loadPreviewUsingLPForItem_fullDetail_completion___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *(void **)(a1 + 32);
  __int16 v7 = [v6 itemIdentifier];
  int v8 = [v7 UUIDString];
  uint64_t v9 = [*(id *)(a1 + 32) sourceIdentifier];
  int v10 = 138413058;
  id v11 = v6;
  __int16 v12 = 2112;
  uint64_t v13 = v8;
  __int16 v14 = 2112;
  id v15 = v9;
  __int16 v16 = 2112;
  uint64_t v17 = a2;
  _os_log_error_impl(&dword_1C2C5F000, a3, OS_LOG_TYPE_ERROR, "Error fetching LP preview for item: %@, identifier: %@ (%@), error: %@", (uint8_t *)&v10, 0x2Au);
}

+ (void)_loadPreviewForAppContentItem:(void *)a1 completion:.cold.1(void *a1)
{
  v1 = [a1 itemIdentifier];
  v2 = [v1 UUIDString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v3, v4, "Error loading app icon for item %@, invalid bundle ID: %@", v5, v6, v7, v8, v9);
}

+ (void)_loadPreviewForAppContentItem:(void *)a1 completion:.cold.2(void *a1)
{
  v1 = [a1 itemIdentifier];
  v2 = [v1 UUIDString];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1C2C5F000, v3, v4, "Error loading app icon for item %@ (%@)", v5, v6, v7, v8, v9);
}

void __72__SYContentItemPreviewManager__loadPreviewForAppContentItem_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [*(id *)(a1 + 32) itemIdentifier];
  uint64_t v5 = [v4 UUIDString];
  uint64_t v6 = *(void *)(a1 + 40);
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = v6;
  _os_log_error_impl(&dword_1C2C5F000, a2, OS_LOG_TYPE_ERROR, "Error requesting icon image for item %@ (%@)", (uint8_t *)&v7, 0x16u);
}

@end