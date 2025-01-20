@interface VUIMediaLibraryApplicationController
+ (id)defaultController;
- (BOOL)isCellularDataForPlaybackEnabled;
- (BOOL)shouldWarnAboutPlaybackQualityForRentalMediaItem:(id)a3;
- (VUIMediaLibraryApplicationControllerDelegate)delegate;
- (id)settingsURL;
- (unint64_t)assetTypeForRentalMediaItem:(id)a3;
- (void)clearCellularPlaybackQualityOverrides;
- (void)isCellularDataForPlaybackEnabled;
- (void)overrideCellularPlaybackQuality:(unint64_t)a3 forMediaItem:(id)a4;
- (void)removeRentalMediaItem:(id)a3 withCompletion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)settingsURL;
@end

@implementation VUIMediaLibraryApplicationController

+ (id)defaultController
{
  if (defaultController___once_0 != -1) {
    dispatch_once(&defaultController___once_0, &__block_literal_global_59);
  }
  v2 = (void *)defaultController___defaultController_0;
  return v2;
}

void __57__VUIMediaLibraryApplicationController_defaultController__block_invoke()
{
  v0 = objc_alloc_init(VUIMediaLibraryApplicationController);
  v1 = (void *)defaultController___defaultController_0;
  defaultController___defaultController_0 = (uint64_t)v0;
}

- (id)settingsURL
{
  v3 = [(VUIMediaLibraryApplicationController *)self delegate];
  v4 = v3;
  if (v3)
  {
    v5 = [v3 settingsURLForMediaLibraryApplicationController:self];
  }
  else
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController settingsURL]();
    }

    v5 = 0;
  }

  return v5;
}

- (BOOL)isCellularDataForPlaybackEnabled
{
  v3 = [(VUIMediaLibraryApplicationController *)self delegate];
  v4 = v3;
  if (v3)
  {
    char v5 = [v3 isCellularDataPlaybackEnabledForMediaLibraryApplicationController:self];
  }
  else
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController isCellularDataForPlaybackEnabled]();
    }

    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldWarnAboutPlaybackQualityForRentalMediaItem:(id)a3
{
  id v4 = a3;
  char v5 = [(VUIMediaLibraryApplicationController *)self delegate];
  if (!v5)
  {
    v6 = VUIDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController shouldWarnAboutPlaybackQualityForRentalMediaItem:]();
    }
    goto LABEL_9;
  }
  v6 = [v4 mediaPlayerMediaItem];
  if (!v6)
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController shouldWarnAboutPlaybackQualityForRentalMediaItem:]();
    }

LABEL_9:
    char v7 = 0;
    goto LABEL_10;
  }
  char v7 = [v5 mediaLibraryApplicationController:self shouldWarnAboutPlaybackQualityForRentalMediaItem:v6];
LABEL_10:

  return v7;
}

- (void)clearCellularPlaybackQualityOverrides
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No delegate has been registered! -clearCellularPlaybackQualityOverrides will be a NO-OP", v2, v3, v4, v5, v6);
}

- (void)overrideCellularPlaybackQuality:(unint64_t)a3 forMediaItem:(id)a4
{
  id v6 = a4;
  char v7 = [(VUIMediaLibraryApplicationController *)self delegate];
  if (v7)
  {
    v8 = [v6 mediaPlayerMediaItem];
    if (v8)
    {
      [v7 mediaLibraryApplicationController:self overrideCellularPlaybackQuality:a3 forMediaItem:v8];
    }
    else
    {
      v9 = VUIDefaultLogObject();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[VUIMediaLibraryApplicationController overrideCellularPlaybackQuality:forMediaItem:]();
      }
    }
  }
  else
  {
    v8 = VUIDefaultLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController shouldWarnAboutPlaybackQualityForRentalMediaItem:]();
    }
  }
}

- (unint64_t)assetTypeForRentalMediaItem:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VUIMediaLibraryApplicationController *)self delegate];
  id v6 = v5;
  if (v5)
  {
    [v5 mediaLibraryApplicationController:self assetTypeForRentalMediaItem:v4];
  }
  else
  {
    char v7 = VUIDefaultLogObject();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController assetTypeForRentalMediaItem:]();
    }
  }
  return 0;
}

- (void)removeRentalMediaItem:(id)a3 withCompletion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke;
  aBlock[3] = &unk_1E6DF49E8;
  id v14 = v7;
  id v8 = v7;
  v9 = _Block_copy(aBlock);
  v10 = [(VUIMediaLibraryApplicationController *)self delegate];
  v11 = v10;
  if (v10)
  {
    [v10 mediaLibraryApplicationController:self removeRentalMediaItem:v6 withCompletion:v9];
  }
  else
  {
    (*((void (**)(void *, void, void))v9 + 2))(v9, 0, 0);
    v12 = VUIDefaultLogObject();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[VUIMediaLibraryApplicationController removeRentalMediaItem:withCompletion:]();
    }
  }
}

void __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = *(void **)(a1 + 32);
  if (v6)
  {
    id v7 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke_2;
    block[3] = &unk_1E6DF7A98;
    id v10 = v6;
    char v11 = a2;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

uint64_t __77__VUIMediaLibraryApplicationController_removeRentalMediaItem_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (VUIMediaLibraryApplicationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)settingsURL
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No delegate has been registered! -settingsURL will return nil", v2, v3, v4, v5, v6);
}

- (void)isCellularDataForPlaybackEnabled
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No delegate has been registered! -isCellularDataForPlaybackEnabled will return NO", v2, v3, v4, v5, v6);
}

- (void)shouldWarnAboutPlaybackQualityForRentalMediaItem:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No delegate has been registered! -shouldWarnAboutPlaybackSettingsForMediaIten: will return NO", v2, v3, v4, v5, v6);
}

- (void)shouldWarnAboutPlaybackQualityForRentalMediaItem:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No MPMediaItem found! Unable to check if need to warn about playback settings", v2, v3, v4, v5, v6);
}

- (void)overrideCellularPlaybackQuality:forMediaItem:.cold.2()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No MPMediaItem found! Unable to override cellular playback quality", v2, v3, v4, v5, v6);
}

- (void)assetTypeForRentalMediaItem:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No delegate has been registered! -rentalAssetTypeForMediaItem: will return VUIMediaEntityAssetTypeUndefined", v2, v3, v4, v5, v6);
}

- (void)removeRentalMediaItem:withCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_13(&dword_1E2BD7000, v0, v1, "No delegate has been registered! -removeRentalMediaItem:withCompletion will be a no-op", v2, v3, v4, v5, v6);
}

@end