@interface WBSBackgroundImageAssetController
+ (NSString)mobileAssetType;
+ (id)mobileAssetBackgroundImageNamesOnDisk;
- (BOOL)_saveAssetAtURL:(id)a3 toURL:(id)a4;
- (NSArray)fileNames;
- (WBSBackgroundImageAssetController)init;
- (WBSBackgroundImageAssetController)initWithMobileAssetController:(id)a3;
- (WBSBackgroundImageAssetControllerDelegate)delegate;
- (int64_t)downloadStateForFileName:(id)a3;
- (void)_sendBackgroundImageThumbnailAssetsToDelegateIfPossible;
- (void)_sendBackgroundImageThumbnailAssetsToDelegateIfPossible:(id)a3;
- (void)downloadMobileAssetBackgroundImage:(id)a3 completionHandler:(id)a4;
- (void)mobileAssetController:(id)a3 didBecomeAvailable:(id)a4 withAttributes:(id)a5;
- (void)mobileAssetController:(id)a3 didFailCatalogDownload:(id)a4;
- (void)mobileAssetController:(id)a3 didFailDownload:(id)a4;
- (void)mobileAssetController:(id)a3 didFailRetrieve:(id)a4;
- (void)mobileAssetController:(id)a3 willPerformQuery:(id)a4;
- (void)savePendingChangesBeforeTermination;
- (void)setDelegate:(id)a3;
@end

@implementation WBSBackgroundImageAssetController

- (WBSBackgroundImageAssetController)init
{
  v3 = [WBSMobileAssetController alloc];
  v4 = [(id)objc_opt_class() mobileAssetType];
  v5 = [(WBSMobileAssetController *)v3 initWithMobileAssetType:v4 updateInterval:604800.0 minimumDelay:180.0];

  if (v5)
  {
    self = [(WBSBackgroundImageAssetController *)self initWithMobileAssetController:v5];
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (NSString)mobileAssetType
{
  return (NSString *)@"com.apple.MobileAsset.SafariBackgroundImage";
}

- (WBSBackgroundImageAssetController)initWithMobileAssetController:(id)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  v50.receiver = self;
  v50.super_class = (Class)WBSBackgroundImageAssetController;
  v5 = [(WBSBackgroundImageAssetController *)&v50 init];
  if (v5)
  {
    id v6 = [NSString stringWithFormat:@"com.apple.Safari.SafariSharedUI.WBSBackgroundImageAssetController.%@.%p._queue", objc_opt_class(), v5];
    v7 = (const char *)[v6 UTF8String];
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create(v7, v8);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v9;

    objc_storeStrong((id *)&v5->_assetController, a3);
    [(WBSMobileAssetControllerProtocol *)v5->_assetController setDelegate:v5];
    uint64_t v11 = [MEMORY[0x1E4F1CA60] dictionary];
    assetURLToAttributes = v5->_assetURLToAttributes;
    v5->_assetURLToAttributes = (NSMutableDictionary *)v11;

    uint64_t v13 = [MEMORY[0x1E4F1CA60] dictionary];
    imageNamesToDownloadStates = v5->_imageNamesToDownloadStates;
    v5->_imageNamesToDownloadStates = (NSMutableDictionary *)v13;

    uint64_t v15 = [MEMORY[0x1E4F1CA48] array];
    fileNames = v5->_fileNames;
    v5->_fileNames = (NSMutableArray *)v15;

    v17 = [MEMORY[0x1E4F28CB8] defaultManager];
    v18 = objc_msgSend(v17, "safari_startPageBackgroundImageThumbnailMobileAssetFolderURL");
    uint64_t v19 = *MEMORY[0x1E4F1C538];
    v54[0] = *MEMORY[0x1E4F1C538];
    v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v54 count:1];
    v21 = [v17 enumeratorAtURL:v18 includingPropertiesForKeys:v20 options:5 errorHandler:0];

    long long v48 = 0u;
    long long v49 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    id v22 = v21;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v53 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v47;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v47 != v24) {
            objc_enumerationMutation(v22);
          }
          v26 = *(void **)(*((void *)&v46 + 1) + 8 * i);
          if (objc_msgSend(v17, "safari_imageExistsAtFileURL:", v26))
          {
            v27 = v5->_fileNames;
            v28 = [v26 lastPathComponent];
            [(NSMutableArray *)v27 addObject:v28];
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v46 objects:v53 count:16];
      }
      while (v23);
    }

    v29 = objc_msgSend(v17, "safari_startPageBackgroundImageMobileAssetFolderURL");
    uint64_t v52 = v19;
    v30 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
    v31 = [v17 enumeratorAtURL:v29 includingPropertiesForKeys:v30 options:5 errorHandler:0];

    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v32 = v31;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v43;
      do
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v43 != v34) {
            objc_enumerationMutation(v32);
          }
          v36 = *(void **)(*((void *)&v42 + 1) + 8 * j);
          if (objc_msgSend(v17, "safari_imageExistsAtFileURL:", v36))
          {
            v37 = v5->_imageNamesToDownloadStates;
            v38 = [v36 lastPathComponent];
            [(NSMutableDictionary *)v37 setObject:&unk_1F03413D0 forKeyedSubscript:v38];
          }
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v42 objects:v51 count:16];
      }
      while (v33);
    }

    v39 = v5;
  }

  return v5;
}

- (void)mobileAssetController:(id)a3 didFailRetrieve:(id)a4
{
  id v5 = a4;
  id v6 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSBackgroundImageAssetController mobileAssetController:didFailRetrieve:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained backgroundImageAssetController:self didFailLoad:v5];
}

- (void)mobileAssetController:didFailRetrieve:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to load mobile asset: %{public}@", v5);
}

- (void)mobileAssetController:(id)a3 willPerformQuery:(id)a4
{
}

void __49__WBSBackgroundImageAssetController_setDelegate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v3 = *(id *)(a1 + 40);

  if (WeakRetained != v3)
  {
    objc_storeWeak((id *)(*(void *)(a1 + 32) + 24), *(id *)(a1 + 40));
    if (*(void *)(a1 + 40))
    {
      os_log_t v4 = *(void **)(a1 + 32);
      objc_msgSend(v4, "_sendBackgroundImageThumbnailAssetsToDelegateIfPossible:");
    }
  }
}

- (void)_sendBackgroundImageThumbnailAssetsToDelegateIfPossible:(id)a3
{
  if ([(NSMutableDictionary *)self->_assetURLToAttributes count])
  {
    assetURLToAttributes = self->_assetURLToAttributes;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __93__WBSBackgroundImageAssetController__sendBackgroundImageThumbnailAssetsToDelegateIfPossible___block_invoke;
    v5[3] = &unk_1E5E407F8;
    v5[4] = self;
    [(NSMutableDictionary *)assetURLToAttributes enumerateKeysAndObjectsUsingBlock:v5];
  }
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__WBSBackgroundImageAssetController_setDelegate___block_invoke;
  v7[3] = &unk_1E5E407D0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

+ (id)mobileAssetBackgroundImageNamesOnDisk
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [MEMORY[0x1E4F1CA80] set];
  id v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = objc_msgSend(v3, "safari_startPageBackgroundImageMobileAssetFolderURL", 0);
  id v5 = [v4 path];
  id v6 = [v3 contentsOfDirectoryAtPath:v5 error:0];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v6);
        }
        [v2 addObject:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  v10 = (void *)[v2 copy];
  return v10;
}

- (void)savePendingChangesBeforeTermination
{
}

- (void)downloadMobileAssetBackgroundImage:(id)a3 completionHandler:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    [(NSMutableDictionary *)self->_imageNamesToDownloadStates setObject:&unk_1F03413E8 forKeyedSubscript:v6];
    assetController = self->_assetController;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __90__WBSBackgroundImageAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke;
    v13[3] = &unk_1E5E40780;
    id v14 = v6;
    long long v15 = self;
    id v16 = v7;
    [(WBSMobileAssetControllerProtocol *)assetController downloadMobileAssetBackgroundImage:v14 completionHandler:v13];

    dispatch_queue_t v9 = v14;
  }
  else
  {
    v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v17 = *MEMORY[0x1E4F28588];
    dispatch_queue_t v9 = _WBSLocalizedString();
    v18[0] = v9;
    uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
    long long v12 = [v10 errorWithDomain:@"com.apple.SafariSharedUI.BackgroundImageAsset.ErrorDomain" code:-1 userInfo:v11];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
  }
}

void __90__WBSBackgroundImageAssetController_downloadMobileAssetBackgroundImage_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v8 = objc_msgSend(v7, "safari_startPageBackgroundImageMobileAssetFolderURL");
  dispatch_queue_t v9 = [v8 URLByAppendingPathComponent:*(void *)(a1 + 32)];

  v10 = [v5 getLocalFileUrl];
  uint64_t v11 = [v10 URLByAppendingPathComponent:*(void *)(a1 + 32)];

  char v12 = [*(id *)(a1 + 40) _saveAssetAtURL:v11 toURL:v9];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(*(void *)(a1 + 40) + 48);
  if (v12)
  {
    [v14 setObject:&unk_1F03413D0 forKeyedSubscript:v13];
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = *(void *)(a1 + 32);
    uint64_t v17 = *(void *)(a1 + 40);
    uint64_t v19 = @"FileName";
    v20[0] = v16;
    v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    [v15 postNotificationName:@"WBSBackgroundImageMobileAssetDidInstallBackgroundImage" object:v17 userInfo:v18];
  }
  else
  {
    [v14 setObject:&unk_1F0341400 forKeyedSubscript:v13];
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (int64_t)downloadStateForFileName:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_imageNamesToDownloadStates objectForKeyedSubscript:a3];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (NSArray)fileNames
{
  uint64_t v2 = [(NSMutableArray *)self->_fileNames sortedArrayUsingSelector:sel_caseInsensitiveCompare_];
  id v3 = [v2 reverseObjectEnumerator];
  int64_t v4 = [v3 allObjects];
  id v5 = (void *)[v4 copy];

  return (NSArray *)v5;
}

- (WBSBackgroundImageAssetControllerDelegate)delegate
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  dispatch_queue_t v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__WBSBackgroundImageAssetController_delegate__block_invoke;
  v5[3] = &unk_1E5E407A8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WBSBackgroundImageAssetControllerDelegate *)v3;
}

void __45__WBSBackgroundImageAssetController_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  int64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

void __93__WBSBackgroundImageAssetController__sendBackgroundImageThumbnailAssetsToDelegateIfPossible___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v13 = a2;
  id v5 = [a3 objectForKeyedSubscript:@"FileName"];
  if ([v5 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v7 = objc_msgSend(v6, "safari_startPageBackgroundImageThumbnailMobileAssetFolderURL");
    uint64_t v8 = [v7 URLByAppendingPathComponent:v5];

    dispatch_queue_t v9 = [v13 URLByAppendingPathComponent:v5];
    if ([*(id *)(a1 + 32) _saveAssetAtURL:v9 toURL:v8])
    {
      v10 = *(void **)(*(void *)(a1 + 32) + 40);
      id v11 = [v8 lastPathComponent];
      [v10 addObject:v11];

      id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
      [WeakRetained backgroundImageAssetController:*(void *)(a1 + 32) didInstallBackgroundImageThumbnailAtURL:v8];
    }
  }
}

- (void)_sendBackgroundImageThumbnailAssetsToDelegateIfPossible
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained) {
    [(WBSBackgroundImageAssetController *)self _sendBackgroundImageThumbnailAssetsToDelegateIfPossible:WeakRetained];
  }
}

- (BOOL)_saveAssetAtURL:(id)a3 toURL:(id)a4
{
  v19[6] = *(id *)MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  MEMORY[0x1AD114B70](v19, @"com.apple.Safari.SafariSharedUI.WBSBackgroundImageAssetController");
  if (v6)
  {
    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    uint64_t v8 = [v5 path];
    char v9 = [v7 isReadableFileAtPath:v8];

    if (v9)
    {
      v10 = [v6 URLByDeletingLastPathComponent];
      id v11 = (id)objc_msgSend(v7, "safari_ensureDirectoryExists:", v10);

      id v18 = 0;
      char v12 = [v7 copyItemAtURL:v5 toURL:v6 error:&v18];
      id v13 = v18;
      if ((v12 & 1) == 0)
      {
        id v14 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v13, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          -[WBSBackgroundImageAssetController _saveAssetAtURL:toURL:]();
        }
      }
    }
    else
    {
      uint64_t v16 = WBS_LOG_CHANNEL_PREFIXMobileAsset();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[WBSBackgroundImageAssetController _saveAssetAtURL:toURL:](v16);
      }
      char v12 = 0;
    }
  }
  else
  {
    long long v15 = WBS_LOG_CHANNEL_PREFIXMobileAsset();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[WBSBackgroundImageAssetController _saveAssetAtURL:toURL:](v15);
    }
    char v12 = 0;
  }
  SafariShared::SuddenTerminationDisabler::~SuddenTerminationDisabler(v19);

  return v12;
}

- (void)mobileAssetController:(id)a3 didBecomeAvailable:(id)a4 withAttributes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __93__WBSBackgroundImageAssetController_mobileAssetController_didBecomeAvailable_withAttributes___block_invoke;
  block[3] = &unk_1E5E40820;
  block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, block);
}

uint64_t __93__WBSBackgroundImageAssetController_mobileAssetController_didBecomeAvailable_withAttributes___block_invoke(void *a1)
{
  [*(id *)(a1[4] + 32) setObject:a1[6] forKeyedSubscript:a1[5]];
  uint64_t v2 = (void *)a1[4];
  return [v2 _sendBackgroundImageThumbnailAssetsToDelegateIfPossible];
}

- (void)mobileAssetController:(id)a3 didFailCatalogDownload:(id)a4
{
  id v5 = a4;
  id v6 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSBackgroundImageAssetController mobileAssetController:didFailCatalogDownload:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained backgroundImageAssetController:self didFailCatalogDownload:v5];
}

- (void)mobileAssetController:(id)a3 didFailDownload:(id)a4
{
  id v5 = a4;
  id v6 = (id)WBS_LOG_CHANNEL_PREFIXMobileAsset();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "safari_privacyPreservingDescription");
    objc_claimAutoreleasedReturnValue();
    -[WBSBackgroundImageAssetController mobileAssetController:didFailDownload:]();
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained backgroundImageAssetController:self didFailDownload:v5];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageNamesToDownloadStates, 0);
  objc_storeStrong((id *)&self->_fileNames, 0);
  objc_storeStrong((id *)&self->_assetURLToAttributes, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetController, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_saveAssetAtURL:(os_log_t)log toURL:.cold.1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Mobile Asset destination URL was not available.", v1, 2u);
}

- (void)_saveAssetAtURL:toURL:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Error while copying a mobile asset. Error description: %{public}@", v5);
}

- (void)_saveAssetAtURL:(os_log_t)log toURL:.cold.3(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1ABB70000, log, OS_LOG_TYPE_ERROR, "Failed to read Safari background images in the Mobile Asset directory.", v1, 2u);
}

- (void)mobileAssetController:didFailCatalogDownload:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to download Safari's background image asset catalog: %{public}@", v5);
}

- (void)mobileAssetController:didFailDownload:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(v1, v2, 5.8381e-34);
  OUTLINED_FUNCTION_0_2(&dword_1ABB70000, v3, v4, "Failed to download mobile asset: %{public}@", v5);
}

@end