@interface PUWallpaperShortcutsPlaygroundSettings
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (void)_runActionWithModuleController:(id)a3 photoLibrary:(id)a4;
- (BOOL)previewEnabled;
- (BOOL)smartCropEnabled;
- (BOOL)useAssetURL;
- (NSString)selectedAssetIdentifier;
- (NSString)selectedConfigurationUUID;
- (id)parentSettings;
- (void)_handleLoadFileURL:(id)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)setDefaultValues;
- (void)setPreviewEnabled:(BOOL)a3;
- (void)setSelectedAssetIdentifier:(id)a3;
- (void)setSelectedConfigurationUUID:(id)a3;
- (void)setSmartCropEnabled:(BOOL)a3;
- (void)setUseAssetURL:(BOOL)a3;
@end

@implementation PUWallpaperShortcutsPlaygroundSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PUWallpaperShortcutsPlaygroundSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PUWallpaperShortcutsPlaygroundSettings *)self setSelectedConfigurationUUID:0];
  [(PUWallpaperShortcutsPlaygroundSettings *)self setSelectedAssetIdentifier:0];
  [(PUWallpaperShortcutsPlaygroundSettings *)self setUseAssetURL:0];
  [(PUWallpaperShortcutsPlaygroundSettings *)self setSmartCropEnabled:1];
  [(PUWallpaperShortcutsPlaygroundSettings *)self setPreviewEnabled:0];
}

- (void)setUseAssetURL:(BOOL)a3
{
  self->_useAssetURL = a3;
}

- (void)setSmartCropEnabled:(BOOL)a3
{
  self->_smartCropEnabled = a3;
}

- (void)setSelectedConfigurationUUID:(id)a3
{
}

- (void)setSelectedAssetIdentifier:(id)a3
{
}

- (void)setPreviewEnabled:(BOOL)a3
{
  self->_previewEnabled = a3;
}

- (void)_handleLoadFileURL:(id)a3
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CB10];
  id v4 = a3;
  v5 = NSTemporaryDirectory();
  v6 = [MEMORY[0x1E4F29128] UUID];
  v7 = [v6 UUIDString];
  v8 = [v5 stringByAppendingPathComponent:v7 conformingToType:*MEMORY[0x1E4F44410]];
  v9 = [v3 fileURLWithPath:v8];

  v10 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v12 = 0;
  LODWORD(v6) = [v10 copyItemAtURL:v4 toURL:v9 error:&v12];

  id v11 = v12;
  if (v6) {
    objc_storeStrong((id *)&sAssetURL, v9);
  }
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 firstObject];
  v9 = v8;
  if (v8)
  {
    v10 = [v8 assetIdentifier];
    objc_storeStrong((id *)&sAssetIdentifier, v10);
    id v11 = +[PUWallpaperShortcutsPlaygroundSettings sharedInstance];
    [v11 setSelectedAssetIdentifier:v10];

    objc_initWeak(&location, self);
    id v12 = [v9 itemProvider];
    v13 = [(id)*MEMORY[0x1E4F44400] identifier];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __70__PUWallpaperShortcutsPlaygroundSettings_UI__picker_didFinishPicking___block_invoke;
    v18 = &unk_1E5F2D730;
    objc_copyWeak(&v19, &location);
    id v14 = (id)[v12 loadFileRepresentationForTypeIdentifier:v13 completionHandler:&v15];

    objc_msgSend(v6, "dismissViewControllerAnimated:completion:", 1, 0, v15, v16, v17, v18);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__picker_didFinishPicking___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _handleLoadFileURL:v3];
}

+ (void)_runActionWithModuleController:(id)a3 photoLibrary:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[PUWallpaperShortcutsPlaygroundSettings sharedInstance];
  v8 = [v7 selectedConfigurationUUID];
  uint64_t v30 = MEMORY[0x1E4F143A8];
  uint64_t v31 = 3221225472;
  v32 = __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke;
  v33 = &unk_1E5F22440;
  id v9 = v8;
  id v34 = v9;
  v10 = PXFind();
  id v11 = (void *)MEMORY[0x1E4F8CCF8];
  id v12 = [v10 assetDirectory];
  v13 = [v11 loadFromURL:v12 error:0];

  if (v13)
  {
    [v13 setOptions:8];
    id v14 = [_PUPosterOverrideConfiguration alloc];
    uint64_t v15 = [(_PUPosterOverrideConfiguration *)v14 initWithSettings:v7 assetURL:sAssetURL assetIdentifier:sAssetIdentifier];
    if ([v7 previewEnabled])
    {
      uint64_t v16 = [PUWallpaperPosterEditDebugViewController alloc];
      v17 = [v10 assetDirectory];
      v18 = [(PUWallpaperPosterEditDebugViewController *)v16 initWithExistingConfiguration:v13 assetDirectory:v17 overrideConfiguration:v15 photoLibrary:v6];

      [(PUWallpaperPosterEditDebugViewController *)v18 setModalPresentationStyle:5];
      [v5 presentViewController:v18 animated:1 completion:0];
    }
    else
    {
      id v19 = (void *)MEMORY[0x1E4F1CB10];
      v20 = NSTemporaryDirectory();
      v21 = [v20 stringByAppendingPathComponent:@"PhotosShortcutsUpdateRendering"];
      v22 = [v19 fileURLWithPath:v21];

      v23 = [[PUWallpaperConfigurationUpdater alloc] initWithPhotoLibrary:v6 sourceConfiguration:v13 targetAssetDirectory:v22 overrideConfiguration:v15];
      v24 = (void *)sConfigurationUpdater;
      sConfigurationUpdater = (uint64_t)v23;

      v25 = (void *)sConfigurationUpdater;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke_2;
      v26[3] = &unk_1E5F22468;
      id v27 = v22;
      id v28 = v13;
      id v29 = v5;
      v18 = v22;
      [v25 attemptUpdateWithCompletionBlock:v26];
    }
  }
}

uint64_t __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 serverUUID];
  id v4 = [v3 UUIDString];
  uint64_t v5 = [v4 isEqual:*(void *)(a1 + 32)];

  return v5;
}

void __90__PUWallpaperShortcutsPlaygroundSettings_UI___runActionWithModuleController_photoLibrary___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  v8 = (void *)MEMORY[0x1E4F28CB8];
  id v9 = a5;
  id v10 = a4;
  id v11 = a3;
  id v12 = [v8 defaultManager];
  uint64_t v13 = *(void *)(a1 + 32);
  id v31 = 0;
  [v12 removeItemAtURL:v13 error:&v31];
  id v14 = v31;

  uint64_t v15 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v16 = *(void *)(a1 + 32);
  id v30 = v14;
  [v15 createDirectoryAtURL:v16 withIntermediateDirectories:0 attributes:0 error:&v30];
  id v17 = v30;

  uint64_t v19 = *(void *)(a1 + 32);
  v18 = *(void **)(a1 + 40);
  id v29 = v17;
  [v18 saveToURL:v19 error:&v29];
  id v20 = v29;

  v21 = *(void **)(a1 + 32);
  v22 = [*(id *)(a1 + 40) media];
  v23 = [v22 firstObject];
  v24 = [v23 subpath];
  v25 = [v21 URLByAppendingPathComponent:v24];

  id v28 = v20;
  [MEMORY[0x1E4F8A390] saveSegmentationItem:v9 compoundLayerStack:v11 style:v10 toWallpaperURL:v25 error:&v28];

  id v26 = v28;
  id v27 = [[PUWallpaperPlaygroundViewController alloc] initWithConfiguration:*(void *)(a1 + 40) assetDirectory:*(void *)(a1 + 32)];
  [(PUWallpaperPlaygroundViewController *)v27 presentPlaygroundWithPresentingViewController:*(void *)(a1 + 48)];
}

+ (id)settingsControllerModule
{
  v51[3] = *MEMORY[0x1E4F143B8];
  if (settingsControllerModule_onceToken != -1) {
    dispatch_once(&settingsControllerModule_onceToken, &__block_literal_global_1687);
  }
  v2 = dispatch_group_create();
  dispatch_group_enter(v2);
  id v3 = (void *)sPosterService;
  uint64_t v4 = *MEMORY[0x1E4F91000];
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_2;
  v46[3] = &unk_1E5F299D0;
  v47 = v2;
  v40 = v2;
  [v3 fetchPosterConfigurationsForExtension:v4 completion:v46];
  dispatch_group_wait(v40, 0xFFFFFFFFFFFFFFFFLL);
  id v5 = objc_alloc(MEMORY[0x1E4F39228]);
  id v6 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  id v7 = (void *)[v5 initWithPhotoLibraryURL:v6];

  v8 = (void *)MEMORY[0x1E4F28F60];
  id v9 = NSStringFromSelector(sel_selectedAssetIdentifier);
  id v10 = objc_msgSend(v8, "predicateWithFormat:", @"%K != nil", v9);

  id v11 = (void *)MEMORY[0x1E4F94160];
  id v28 = (id)MEMORY[0x1E4F94160];
  id v12 = (void *)MEMORY[0x1E4F940F8];
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_4;
  v44[3] = &unk_1E5F2C248;
  id v13 = v7;
  id v45 = v13;
  v37 = objc_msgSend(v12, "pu_rowWithTitle:action:", @"Pick Asset", v44);
  v50[0] = v37;
  id v14 = (void *)MEMORY[0x1E4F94108];
  v36 = NSStringFromSelector(sel_selectedConfigurationUUID);
  v35 = [v14 rowWithTitle:@"Configuration" valueKeyPath:v36];
  id v34 = PXMap();
  v33 = objc_msgSend(v35, "pu_possibleValues:", v34);
  v32 = [v33 condition:v10];
  v50[1] = v32;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:2];
  id v30 = [v11 sectionWithRows:v31];
  v51[0] = v30;
  uint64_t v15 = (void *)MEMORY[0x1E4F94160];
  id v27 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Use Asset URL" valueKeyPath:@"useAssetURL"];
  v49[0] = v27;
  uint64_t v16 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Smart Crop" valueKeyPath:@"smartCropEnabled"];
  v49[1] = v16;
  id v17 = [MEMORY[0x1E4F941F0] rowWithTitle:@"Preview" valueKeyPath:@"previewEnabled"];
  v49[2] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
  uint64_t v19 = [v15 sectionWithRows:v18 title:@"Options" condition:v10];
  v51[1] = v19;
  id v20 = (void *)MEMORY[0x1E4F94160];
  v21 = (void *)MEMORY[0x1E4F940F8];
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_6;
  v41[3] = &unk_1E5F2C270;
  id v42 = v13;
  id v43 = a1;
  id v39 = v13;
  v22 = objc_msgSend(v21, "pu_rowWithTitle:action:", @"Run Action", v41);
  v48 = v22;
  v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  v24 = [v20 sectionWithRows:v23 title:0 condition:v10];
  v51[2] = v24;
  v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:3];
  id v29 = [v28 moduleWithTitle:@"Shortcuts Playground" contents:v25];

  return v29;
}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = PXFilter();
  id v3 = (void *)sPosterConfigurations;
  sPosterConfigurations = v2;

  uint64_t v4 = *(NSObject **)(a1 + 32);
  dispatch_group_leave(v4);
}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = (objc_class *)MEMORY[0x1E4F39930];
  id v4 = a2;
  id v8 = (id)[[v3 alloc] initWithPhotoLibrary:*(void *)(a1 + 32)];
  id v5 = [MEMORY[0x1E4F39938] imagesFilter];
  [v8 setFilter:v5];

  id v6 = (void *)[objc_alloc(MEMORY[0x1E4F39948]) initWithConfiguration:v8];
  id v7 = +[PUWallpaperShortcutsPlaygroundSettings sharedInstance];
  [v6 setDelegate:v7];

  [v4 presentViewController:v6 animated:1 completion:0];
}

uint64_t __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_6(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 40) _runActionWithModuleController:a2 photoLibrary:*(void *)(a1 + 32)];
}

id __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 serverUUID];
  id v3 = [v2 UUIDString];

  return v3;
}

BOOL __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v2 = (void *)MEMORY[0x1E4F8CCF8];
  id v3 = [a2 assetDirectory];
  id v4 = [v2 loadFromURL:v3 error:0];

  BOOL v5 = [v4 configurationType] == 0;
  return v5;
}

void __70__PUWallpaperShortcutsPlaygroundSettings_UI__settingsControllerModule__block_invoke()
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2050000000;
  v0 = (void *)getPRSServiceClass_softClass;
  uint64_t v8 = getPRSServiceClass_softClass;
  if (!getPRSServiceClass_softClass)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __getPRSServiceClass_block_invoke;
    v4[3] = &unk_1E5F2E228;
    v4[4] = &v5;
    __getPRSServiceClass_block_invoke((uint64_t)v4);
    v0 = (void *)v6[3];
  }
  v1 = v0;
  _Block_object_dispose(&v5, 8);
  id v2 = objc_alloc_init(v1);
  id v3 = (void *)sPosterService;
  sPosterService = (uint64_t)v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedAssetIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedConfigurationUUID, 0);
}

- (BOOL)previewEnabled
{
  return self->_previewEnabled;
}

- (BOOL)smartCropEnabled
{
  return self->_smartCropEnabled;
}

- (BOOL)useAssetURL
{
  return self->_useAssetURL;
}

- (NSString)selectedAssetIdentifier
{
  return self->_selectedAssetIdentifier;
}

- (NSString)selectedConfigurationUUID
{
  return self->_selectedConfigurationUUID;
}

- (id)parentSettings
{
  return +[PUSuggestionsSettings sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_25775 != -1) {
    dispatch_once(&sharedInstance_onceToken_25775, &__block_literal_global_25776);
  }
  id v2 = (void *)sharedInstance_sharedInstance_25777;
  return v2;
}

void __56__PUWallpaperShortcutsPlaygroundSettings_sharedInstance__block_invoke()
{
  id v2 = +[PUSuggestionsSettings sharedInstance];
  uint64_t v0 = [v2 shortcutsPlaygroundSettings];
  v1 = (void *)sharedInstance_sharedInstance_25777;
  sharedInstance_sharedInstance_25777 = v0;
}

@end