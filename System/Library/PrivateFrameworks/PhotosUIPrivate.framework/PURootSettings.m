@interface PURootSettings
+ (id)_debugRowsForViewControllerStack:(id)a3;
+ (id)_photoKitSettings;
+ (id)_photosUICoreSettings;
+ (id)_saveScreenshot:(id)a3;
+ (id)currentAsset;
+ (id)photosUITesterRootViewController;
+ (id)settingsControllerModule;
+ (id)sharedInstance;
+ (void)_deleteAllDiagnosticFiles;
+ (void)_presentTapToRadar;
+ (void)_setCurrentAsset:(id)a3;
+ (void)_setDebugRows:(id)a3;
+ (void)configureToastForReminderToQuitAfterLaunch:(id)a3 target:(id)a4;
+ (void)dismissSettingsController;
+ (void)dismissSettingsController:(id)a3;
+ (void)presentSettingsController;
+ (void)setupStatusBarInternalSettingsGestureOnInternalDevices;
- (BOOL)allowIrisUI;
- (BOOL)irisUIEnabled;
- (Class)interfaceThemeClass;
- (NSString)_internal_libraryStateBriefDescription;
- (NSString)_memory_creationStateTitle;
- (PUAirPlaySettings)airPlaySettings;
- (PUAmbientPhotoFrameSettings)ambientPhotoFrameSettings;
- (PUAudioClassificationSettings)audioClassificationSettings;
- (PUCompositeVideoSettings)compositeVideoSettings;
- (PUCurationSettings)curation;
- (PUIrisSettings)irisSettings;
- (PUMedusaSettings)medusaSettings;
- (PUOneUpSettings)oneUpSettings;
- (PUPerformanceDiagnosticsSettings)performanceDiagnosticsSettings;
- (PUPhotoEditProtoSettings)photoEditingSettings;
- (PUPhotosGridSettings)photosGridSettings;
- (PUSceneSettings)sceneSettings;
- (PUSlideshowSettings)slideshowSettings;
- (PUSuggestionsSettings)suggestions;
- (PUTabbedLibrarySettings)tabbedLibrarySettings;
- (PUTilingViewSettings)tilingViewSettings;
- (PUWelcomeSettings)welcomeSettings;
- (PUWorkaroundSettings)workaroundSettings;
- (PXGenerativeStorySettings)generativeStorySettings;
- (PXImportSettings)importSettings;
- (PXSharingSettings)sharingSettings;
- (UIImage)_internal_libraryStateImage;
- (UIImage)_memory_creationStateImage;
- (id)archiveValueForKey:(id)a3;
- (id)favoritesSettings;
- (id)parentSettings;
- (id)reparentedRootSettings;
- (void)_setObservationEnabled:(BOOL)a3;
- (void)applyArchiveValue:(id)a3 forKey:(id)a4;
- (void)createChildren;
- (void)favoritesSettings:(id)a3 loadAccessorySettingsWithCompletionHandler:(id)a4;
- (void)favoritesSettingsDidChangeFavorites:(id)a3;
- (void)restoreDefaultValues;
- (void)setAirPlaySettings:(id)a3;
- (void)setAllowIrisUI:(BOOL)a3;
- (void)setAmbientPhotoFrameSettings:(id)a3;
- (void)setAudioClassificationSettings:(id)a3;
- (void)setCompositeVideoSettings:(id)a3;
- (void)setCuration:(id)a3;
- (void)setDefaultValues;
- (void)setEnforceDisableIrisUI:(BOOL)a3;
- (void)setGenerativeStorySettings:(id)a3;
- (void)setImportSettings:(id)a3;
- (void)setInterfaceThemeClass:(Class)a3;
- (void)setIrisSettings:(id)a3;
- (void)setMedusaSettings:(id)a3;
- (void)setOneUpSettings:(id)a3;
- (void)setPerformanceDiagnosticsSettings:(id)a3;
- (void)setPhotoEditingSettings:(id)a3;
- (void)setPhotosGridSettings:(id)a3;
- (void)setSceneSettings:(id)a3;
- (void)setSharingSettings:(id)a3;
- (void)setSlideshowSettings:(id)a3;
- (void)setSuggestions:(id)a3;
- (void)setTabbedLibrarySettings:(id)a3;
- (void)setTilingViewSettings:(id)a3;
- (void)setWelcomeSettings:(id)a3;
- (void)setWorkaroundSettings:(id)a3;
- (void)set_internal_libraryStateBriefDescription:(id)a3;
- (void)set_internal_libraryStateImage:(id)a3;
- (void)set_memory_creationStateImage:(id)a3;
- (void)set_memory_creationStateTitle:(id)a3;
@end

@implementation PURootSettings

- (void)setDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PURootSettings;
  [(PTSettings *)&v3 setDefaultValues];
  [(PURootSettings *)self setAllowIrisUI:1];
  [(PURootSettings *)self setInterfaceThemeClass:objc_opt_class()];
}

- (void)setInterfaceThemeClass:(Class)a3
{
}

- (void)setAllowIrisUI:(BOOL)a3
{
  self->_allowIrisUI = a3;
}

- (PUTabbedLibrarySettings)tabbedLibrarySettings
{
  return self->_tabbedLibrarySettings;
}

+ (id)sharedInstance
{
  os_unfair_lock_lock(MEMORY[0x1E4F91010]);
  if (!sharedInstance_sharedInstance_79865)
  {
    uint64_t v3 = [a1 createSharedInstance];
    v4 = (void *)sharedInstance_sharedInstance_79865;
    sharedInstance_sharedInstance_79865 = v3;
  }
  os_unfair_lock_unlock(MEMORY[0x1E4F91010]);
  v5 = (void *)sharedInstance_sharedInstance_79865;
  return v5;
}

- (void)createChildren
{
  uint64_t v3 = [(PTSettings *)[PUPhotoEditProtoSettings alloc] initWithDefaultValues];
  photoEditingSettings = self->_photoEditingSettings;
  self->_photoEditingSettings = v3;

  v5 = [(PTSettings *)[PUAudioClassificationSettings alloc] initWithDefaultValues];
  audioClassificationSettings = self->_audioClassificationSettings;
  self->_audioClassificationSettings = v5;

  v7 = [(PTSettings *)[PUAirPlaySettings alloc] initWithDefaultValues];
  airPlaySettings = self->_airPlaySettings;
  self->_airPlaySettings = v7;

  v9 = [(PTSettings *)[PUWelcomeSettings alloc] initWithDefaultValues];
  welcomeSettings = self->_welcomeSettings;
  self->_welcomeSettings = v9;

  v11 = [(PTSettings *)[PUSceneSettings alloc] initWithDefaultValues];
  sceneSettings = self->_sceneSettings;
  self->_sceneSettings = v11;

  v13 = [(PTSettings *)[PUPerformanceDiagnosticsSettings alloc] initWithDefaultValues];
  performanceDiagnosticsSettings = self->_performanceDiagnosticsSettings;
  self->_performanceDiagnosticsSettings = v13;

  v15 = [(PTSettings *)[PUMedusaSettings alloc] initWithDefaultValues];
  medusaSettings = self->_medusaSettings;
  self->_medusaSettings = v15;

  v17 = [(PTSettings *)[PUSlideshowSettings alloc] initWithDefaultValues];
  slideshowSettings = self->_slideshowSettings;
  self->_slideshowSettings = v17;

  v19 = [(PTSettings *)[PUCurationSettings alloc] initWithDefaultValues];
  curation = self->_curation;
  self->_curation = v19;

  v21 = [(PTSettings *)[PUCompositeVideoSettings alloc] initWithDefaultValues];
  compositeVideoSettings = self->_compositeVideoSettings;
  self->_compositeVideoSettings = v21;

  v23 = [(PTSettings *)[PUAmbientPhotoFrameSettings alloc] initWithDefaultValues];
  ambientPhotoFrameSettings = self->_ambientPhotoFrameSettings;
  self->_ambientPhotoFrameSettings = v23;

  v25 = (PXImportSettings *)[objc_alloc(MEMORY[0x1E4F902D0]) initWithDefaultValues];
  importSettings = self->_importSettings;
  self->_importSettings = v25;

  v27 = [(PTSettings *)[PUTabbedLibrarySettings alloc] initWithDefaultValues];
  tabbedLibrarySettings = self->_tabbedLibrarySettings;
  self->_tabbedLibrarySettings = v27;

  v29 = [(PTSettings *)[PUSuggestionsSettings alloc] initWithDefaultValues];
  suggestions = self->_suggestions;
  self->_suggestions = v29;

  v31 = [(PTSettings *)[PUIrisSettings alloc] initWithDefaultValues];
  irisSettings = self->_irisSettings;
  self->_irisSettings = v31;

  v33 = [(PTSettings *)[PUOneUpSettings alloc] initWithDefaultValues];
  oneUpSettings = self->_oneUpSettings;
  self->_oneUpSettings = v33;

  v35 = [(PTSettings *)[PUPhotosGridSettings alloc] initWithDefaultValues];
  photosGridSettings = self->_photosGridSettings;
  self->_photosGridSettings = v35;

  v37 = (PXSharingSettings *)[objc_alloc(MEMORY[0x1E4F906A0]) initWithDefaultValues];
  sharingSettings = self->_sharingSettings;
  self->_sharingSettings = v37;

  v39 = (PXGenerativeStorySettings *)[objc_alloc(MEMORY[0x1E4F90258]) initWithDefaultValues];
  generativeStorySettings = self->_generativeStorySettings;
  self->_generativeStorySettings = v39;

  v41 = [(PTSettings *)[PUTilingViewSettings alloc] initWithDefaultValues];
  tilingViewSettings = self->_tilingViewSettings;
  self->_tilingViewSettings = v41;

  v43 = [(PTSettings *)[PUWorkaroundSettings alloc] initWithDefaultValues];
  workaroundSettings = self->_workaroundSettings;
  self->_workaroundSettings = v43;
}

+ (void)setupStatusBarInternalSettingsGestureOnInternalDevices
{
  v9[1] = *MEMORY[0x1E4F143B8];
  if (MEMORY[0x1B3E7A510](a1, a2))
  {
    if (MEMORY[0x1B3E7A500]())
    {
      uint64_t v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      v8 = @"PUEnableDoubleTapSettings";
      v9[0] = MEMORY[0x1E4F1CC38];
      v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
      [v3 registerDefaults:v4];

      v5 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
      int v6 = [v5 BOOLForKey:@"PUEnableDoubleTapSettings"];

      if (v6)
      {
        v7[0] = MEMORY[0x1E4F143A8];
        v7[1] = 3221225472;
        v7[2] = __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke;
        v7[3] = &__block_descriptor_40_e5_v8__0l;
        v7[4] = a1;
        if (setupStatusBarInternalSettingsGestureOnInternalDevices_onceToken != -1) {
          dispatch_once(&setupStatusBarInternalSettingsGestureOnInternalDevices_onceToken, v7);
        }
      }
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__memory_creationStateImage, 0);
  objc_storeStrong((id *)&self->__memory_creationStateTitle, 0);
  objc_storeStrong((id *)&self->__internal_libraryStateImage, 0);
  objc_storeStrong((id *)&self->__internal_libraryStateBriefDescription, 0);
  objc_storeStrong((id *)&self->_importSettings, 0);
  objc_storeStrong((id *)&self->_performanceDiagnosticsSettings, 0);
  objc_storeStrong((id *)&self->_irisSettings, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_curation, 0);
  objc_storeStrong((id *)&self->_sharingSettings, 0);
  objc_storeStrong((id *)&self->_ambientPhotoFrameSettings, 0);
  objc_storeStrong((id *)&self->_audioClassificationSettings, 0);
  objc_storeStrong((id *)&self->_generativeStorySettings, 0);
  objc_storeStrong((id *)&self->_sceneSettings, 0);
  objc_storeStrong((id *)&self->_workaroundSettings, 0);
  objc_storeStrong((id *)&self->_welcomeSettings, 0);
  objc_storeStrong((id *)&self->_slideshowSettings, 0);
  objc_storeStrong((id *)&self->_airPlaySettings, 0);
  objc_storeStrong((id *)&self->_interfaceThemeClass, 0);
  objc_storeStrong((id *)&self->_tilingViewSettings, 0);
  objc_storeStrong((id *)&self->_oneUpSettings, 0);
  objc_storeStrong((id *)&self->_medusaSettings, 0);
  objc_storeStrong((id *)&self->_photoEditingSettings, 0);
  objc_storeStrong((id *)&self->_photosGridSettings, 0);
  objc_storeStrong((id *)&self->_tabbedLibrarySettings, 0);
  objc_storeStrong((id *)&self->_compositeVideoSettings, 0);
}

- (void)set_memory_creationStateImage:(id)a3
{
}

- (UIImage)_memory_creationStateImage
{
  return self->__memory_creationStateImage;
}

- (void)set_memory_creationStateTitle:(id)a3
{
}

- (NSString)_memory_creationStateTitle
{
  return self->__memory_creationStateTitle;
}

- (void)set_internal_libraryStateImage:(id)a3
{
}

- (UIImage)_internal_libraryStateImage
{
  return self->__internal_libraryStateImage;
}

- (void)set_internal_libraryStateBriefDescription:(id)a3
{
}

- (NSString)_internal_libraryStateBriefDescription
{
  return self->__internal_libraryStateBriefDescription;
}

- (void)setImportSettings:(id)a3
{
}

- (PXImportSettings)importSettings
{
  return self->_importSettings;
}

- (void)setPerformanceDiagnosticsSettings:(id)a3
{
}

- (PUPerformanceDiagnosticsSettings)performanceDiagnosticsSettings
{
  return self->_performanceDiagnosticsSettings;
}

- (void)setIrisSettings:(id)a3
{
}

- (PUIrisSettings)irisSettings
{
  return self->_irisSettings;
}

- (void)setSuggestions:(id)a3
{
}

- (PUSuggestionsSettings)suggestions
{
  return self->_suggestions;
}

- (void)setCuration:(id)a3
{
}

- (PUCurationSettings)curation
{
  return self->_curation;
}

- (void)setSharingSettings:(id)a3
{
}

- (PXSharingSettings)sharingSettings
{
  return self->_sharingSettings;
}

- (void)setAmbientPhotoFrameSettings:(id)a3
{
}

- (PUAmbientPhotoFrameSettings)ambientPhotoFrameSettings
{
  return self->_ambientPhotoFrameSettings;
}

- (void)setAudioClassificationSettings:(id)a3
{
}

- (PUAudioClassificationSettings)audioClassificationSettings
{
  return self->_audioClassificationSettings;
}

- (void)setGenerativeStorySettings:(id)a3
{
}

- (PXGenerativeStorySettings)generativeStorySettings
{
  return self->_generativeStorySettings;
}

- (void)setSceneSettings:(id)a3
{
}

- (PUSceneSettings)sceneSettings
{
  return self->_sceneSettings;
}

- (void)setWorkaroundSettings:(id)a3
{
}

- (PUWorkaroundSettings)workaroundSettings
{
  return self->_workaroundSettings;
}

- (void)setWelcomeSettings:(id)a3
{
}

- (PUWelcomeSettings)welcomeSettings
{
  return self->_welcomeSettings;
}

- (void)setSlideshowSettings:(id)a3
{
}

- (PUSlideshowSettings)slideshowSettings
{
  return self->_slideshowSettings;
}

- (void)setAirPlaySettings:(id)a3
{
}

- (PUAirPlaySettings)airPlaySettings
{
  return self->_airPlaySettings;
}

- (Class)interfaceThemeClass
{
  return self->_interfaceThemeClass;
}

- (void)setTilingViewSettings:(id)a3
{
}

- (PUTilingViewSettings)tilingViewSettings
{
  return self->_tilingViewSettings;
}

- (void)setOneUpSettings:(id)a3
{
}

- (PUOneUpSettings)oneUpSettings
{
  return self->_oneUpSettings;
}

- (void)setMedusaSettings:(id)a3
{
}

- (PUMedusaSettings)medusaSettings
{
  return self->_medusaSettings;
}

- (void)setPhotoEditingSettings:(id)a3
{
}

- (PUPhotoEditProtoSettings)photoEditingSettings
{
  return self->_photoEditingSettings;
}

- (void)setPhotosGridSettings:(id)a3
{
}

- (PUPhotosGridSettings)photosGridSettings
{
  return self->_photosGridSettings;
}

- (void)setTabbedLibrarySettings:(id)a3
{
}

- (void)setCompositeVideoSettings:(id)a3
{
}

- (PUCompositeVideoSettings)compositeVideoSettings
{
  return self->_compositeVideoSettings;
}

- (BOOL)allowIrisUI
{
  return self->_allowIrisUI;
}

- (void)favoritesSettings:(id)a3 loadAccessorySettingsWithCompletionHandler:(id)a4
{
  int v6 = (void (**)(void))a4;
  id v4 = PUTesterRootSettingsLoadIfNecessary(1);
  id v5 = (id)PXSoftLinkedProtoRootSettingsLoadIfNecessary();
  v6[2]();
}

- (void)favoritesSettingsDidChangeFavorites:(id)a3
{
  id v4 = [(PURootSettings *)self valueForKey:@"_internal_libraryStateBriefDescription"];
  id v5 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  int v6 = objc_msgSend(v5, "numberWithDouble:");
  v7 = [v6 description];
  [(PURootSettings *)self setValue:v7 forKey:@"_internal_libraryStateBriefDescription"];

  [(PURootSettings *)self setValue:v4 forKey:@"_internal_libraryStateBriefDescription"];
  id v11 = [(PURootSettings *)self valueForKey:@"_memory_creationStateTitle"];

  v8 = NSNumber;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  v9 = objc_msgSend(v8, "numberWithDouble:");
  v10 = [v9 description];
  [(PURootSettings *)self setValue:v10 forKey:@"_memory_creationStateTitle"];

  [(PURootSettings *)self setValue:v11 forKey:@"_memory_creationStateTitle"];
}

- (void)setEnforceDisableIrisUI:(BOOL)a3
{
  self->_enforceDisableIrisUI = a3;
}

- (BOOL)irisUIEnabled
{
  uint64_t v3 = [MEMORY[0x1E4FB1438] sharedApplication];
  char v4 = [v3 launchedToTest];

  return [(PURootSettings *)self allowIrisUI] | v4;
}

- (void)_setObservationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)PURootSettings;
  -[PTSettings _setObservationEnabled:](&v14, sel__setObservationEnabled_);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(PURootSettings *)self reparentedRootSettings];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) _setObservationEnabled:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
}

- (id)reparentedRootSettings
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _photosUICoreSettings];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

- (id)archiveValueForKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"interfaceThemeClass"])
  {
    uint64_t v5 = NSStringFromClass([(PURootSettings *)self interfaceThemeClass]);
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)PURootSettings;
    uint64_t v5 = [(PXSettings *)&v8 archiveValueForKey:v4];
  }
  uint64_t v6 = (void *)v5;

  return v6;
}

- (void)applyArchiveValue:(id)a3 forKey:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (NSString *)a3;
  if ([v6 isEqualToString:@"interfaceThemeClass"])
  {
    Class v8 = NSClassFromString(v7);

    [(PURootSettings *)self setInterfaceThemeClass:v8];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)PURootSettings;
    [(PXSettings *)&v9 applyArchiveValue:v7 forKey:v6];
  }
}

- (id)favoritesSettings
{
  return (id)[MEMORY[0x1E4F901D8] sharedInstance];
}

- (void)restoreDefaultValues
{
  v3.receiver = self;
  v3.super_class = (Class)PURootSettings;
  [(PXSettings *)&v3 restoreDefaultValues];
  v2 = [(id)objc_opt_class() _photoKitSettings];
  [v2 restoreDefaultValues];
}

- (id)parentSettings
{
  return 0;
}

+ (void)configureToastForReminderToQuitAfterLaunch:(id)a3 target:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc(MEMORY[0x1E4F90828]);
  Class v8 = objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [v8 setMessage:@"Photos usually needs to be quit and relaunched for changes to take effect."];
  objc_initWeak(&location, v6);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke;
  v11[3] = &unk_1E5F2E530;
  objc_copyWeak(&v12, &location);
  [v8 addActionWithTitle:@"Quit" action:v11];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke_2;
  v9[3] = &unk_1E5F2E530;
  objc_copyWeak(&v10, &location);
  [v8 addActionWithTitle:@"Hide" action:v9];
  [v5 setContentView:v8];
  [v5 setAutoDismissalDelay:5.0];
  [v5 setCanSwipeToDismiss:1];
  [v5 setBottomMargin:30.0];
  objc_destroyWeak(&v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained callOnViewDidDisappearBlock];

  exit(0);
}

void __68__PURootSettings_configureToastForReminderToQuitAfterLaunch_target___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _hideToast];
}

+ (void)_deleteAllDiagnosticFiles
{
  id v6 = [MEMORY[0x1E4FB1418] alertControllerWithTitle:@"Delete All Diagnostic Files" message:@"Are you sure? This action cannot be undone." preferredStyle:1];
  v2 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Cancel" style:1 handler:0];
  [v6 addAction:v2];

  objc_super v3 = [MEMORY[0x1E4FB1410] actionWithTitle:@"Delete" style:2 handler:&__block_literal_global_655];
  [v6 addAction:v3];

  id v4 = objc_msgSend(MEMORY[0x1E4FB1EC0], "pu_currentViewControllerStack");
  id v5 = [v4 firstObject];
  [v5 presentViewController:v6 animated:1 completion:0];
}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = objc_alloc_init(MEMORY[0x1E4FB1B40]);
  [v3 setText:@"Deleting…"];
  id v4 = [MEMORY[0x1E4FB1438] sharedApplication];
  id v5 = objc_msgSend(v4, "px_firstKeyWindow");
  [v3 showInView:v5];

  id v6 = [MEMORY[0x1E4F8AA78] systemPhotoLibrary];
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__79414;
  v19[4] = __Block_byref_object_dispose__79415;
  id v20 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  char v18 = 0;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_2;
  v13[3] = &unk_1E5F2B800;
  v15 = v17;
  id v7 = v6;
  id v14 = v7;
  uint64_t v16 = v19;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  void v9[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_3;
  v9[3] = &unk_1E5F2B800;
  long long v11 = v17;
  id v8 = v3;
  id v10 = v8;
  id v12 = v19;
  [v7 performBlock:v13 completionHandler:v9];

  _Block_object_dispose(v17, 8);
  _Block_object_dispose(v19, 8);
}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_2(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 deleteAllDiagnosticFiles:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_3(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_4;
  block[3] = &unk_1E5F2B800;
  long long v3 = *(_OWORD *)(a1 + 32);
  id v2 = (id)v3;
  long long v5 = v3;
  uint64_t v6 = *(void *)(a1 + 48);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_4(uint64_t a1)
{
  uint64_t v3 = a1 + 32;
  id v2 = *(void **)(a1 + 32);
  if (*(unsigned char *)(*(void *)(*(void *)(v3 + 8) + 8) + 24))
  {
    [v2 setText:@"Deleted"];
    [*(id *)(a1 + 32) done];
  }
  else
  {
    [v2 setText:@"Error"];
    NSLog(&cfstr_Error_1.isa, *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40));
  }
  dispatch_time_t v4 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_5;
  block[3] = &unk_1E5F2ED10;
  id v6 = *(id *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x1E4F14428], block);
}

uint64_t __43__PURootSettings__deleteAllDiagnosticFiles__block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) hide];
}

+ (id)_photosUICoreSettings
{
  return (id)[MEMORY[0x1E4F90618] sharedInstance];
}

+ (id)_photoKitSettings
{
  return (id)[MEMORY[0x1E4F8A5C8] sharedSettings];
}

+ (id)photosUITesterRootViewController
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2050000000;
  id v2 = (void *)getPUTesterRootSettingsViewControllerClass_softClass;
  uint64_t v10 = getPUTesterRootSettingsViewControllerClass_softClass;
  if (!getPUTesterRootSettingsViewControllerClass_softClass)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __getPUTesterRootSettingsViewControllerClass_block_invoke;
    v6[3] = &unk_1E5F2E228;
    v6[4] = &v7;
    __getPUTesterRootSettingsViewControllerClass_block_invoke((uint64_t)v6);
    id v2 = (void *)v8[3];
  }
  id v3 = v2;
  _Block_object_dispose(&v7, 8);
  id v4 = objc_alloc_init((Class)v3);
  return v4;
}

+ (void)_setCurrentAsset:(id)a3
{
}

+ (id)currentAsset
{
  return (id)sCurrentAsset;
}

+ (void)_setDebugRows:(id)a3
{
  uint64_t v3 = [a3 copy];
  id v4 = (void *)sDebugRows;
  sDebugRows = v3;
}

+ (id)_debugRowsForViewControllerStack:(id)a3
{
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v60 = a3;
  id v65 = [MEMORY[0x1E4F1CA48] array];
  long long v120 = 0u;
  long long v121 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = [v60 reverseObjectEnumerator];
  uint64_t v64 = [obj countByEnumeratingWithState:&v118 objects:v125 count:16];
  if (v64)
  {
    uint64_t v63 = *(void *)v119;
    do
    {
      for (uint64_t i = 0; i != v64; ++i)
      {
        if (*(void *)v119 != v63) {
          objc_enumerationMutation(obj);
        }
        v72 = *(void **)(*((void *)&v118 + 1) + 8 * i);
        objc_initWeak(&location, v72);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke;
        aBlock[3] = &unk_1E5F2B6E8;
        objc_copyWeak(&v116, &location);
        v73 = (void (**)(void))_Block_copy(aBlock);
        v74 = v73[2]();
        if (v74)
        {
          [a1 _setCurrentAsset:v74];
          uint64_t v3 = (void *)MEMORY[0x1E4F940F8];
          v113[0] = MEMORY[0x1E4F143A8];
          v113[1] = 3221225472;
          v113[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2;
          v113[3] = &unk_1E5F2B710;
          id v4 = v73;
          v114 = v4;
          v70 = objc_msgSend(v3, "pu_rowWithTitle:output:", @"Print Current Asset", v113);
          v124[0] = v70;
          long long v5 = (void *)MEMORY[0x1E4F940F8];
          v111[0] = MEMORY[0x1E4F143A8];
          v111[1] = 3221225472;
          v111[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3;
          v111[3] = &unk_1E5F2B710;
          id v6 = v4;
          v112 = v6;
          v69 = objc_msgSend(v5, "pu_rowWithTitle:output:", @"Print Asset Resources", v111);
          v124[1] = v69;
          uint64_t v7 = (void *)MEMORY[0x1E4F940F8];
          v109[0] = MEMORY[0x1E4F143A8];
          v109[1] = 3221225472;
          v109[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4;
          v109[3] = &unk_1E5F2B710;
          id v8 = v6;
          v110 = v8;
          v68 = objc_msgSend(v7, "pu_rowWithTitle:output:", @"Print Asset Metadata", v109);
          v124[2] = v68;
          uint64_t v9 = (void *)MEMORY[0x1E4F940F8];
          v107[0] = MEMORY[0x1E4F143A8];
          v107[1] = 3221225472;
          v107[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_5;
          v107[3] = &unk_1E5F2B738;
          uint64_t v10 = v8;
          v108 = v10;
          v67 = objc_msgSend(v9, "pu_rowWithTitle:action:", @"Show in Parallax Debug Viewer", v107);
          v124[3] = v67;
          long long v11 = (void *)MEMORY[0x1E4F940F8];
          v105[0] = MEMORY[0x1E4F143A8];
          v105[1] = 3221225472;
          v105[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_6;
          v105[3] = &unk_1E5F2B738;
          id v12 = v10;
          v106 = v12;
          v66 = objc_msgSend(v11, "pu_rowWithTitle:action:", @"Edit as Featured Poster", v105);
          v124[4] = v66;
          long long v13 = (void *)MEMORY[0x1E4F940F8];
          v103[0] = MEMORY[0x1E4F143A8];
          v103[1] = 3221225472;
          v103[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_7;
          v103[3] = &unk_1E5F2B738;
          id v14 = v12;
          v104 = v14;
          v15 = objc_msgSend(v13, "pu_rowWithTitle:action:", @"Create Photos Poster", v103);
          v124[5] = v15;
          uint64_t v16 = (void *)MEMORY[0x1E4F940F8];
          v101[0] = MEMORY[0x1E4F143A8];
          v101[1] = 3221225472;
          v101[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_8;
          v101[3] = &unk_1E5F2B738;
          v17 = v14;
          v102 = v17;
          char v18 = objc_msgSend(v16, "pu_rowWithTitle:action:", @"Create Shuffle Poster", v101);
          v124[6] = v18;
          v19 = (void *)MEMORY[0x1E4F940F8];
          v99[0] = MEMORY[0x1E4F143A8];
          v99[1] = 3221225472;
          v99[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_9;
          v99[3] = &unk_1E5F2B738;
          id v20 = v17;
          v100 = v20;
          v21 = objc_msgSend(v19, "pu_rowWithTitle:action:", @"Create People Poster", v99);
          v124[7] = v21;
          v22 = (void *)MEMORY[0x1E4F940F8];
          v97[0] = MEMORY[0x1E4F143A8];
          v97[1] = 3221225472;
          v97[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_10;
          v97[3] = &unk_1E5F2C248;
          id v98 = v74;
          v23 = objc_msgSend(v22, "pu_rowWithTitle:action:", @"Show as Wallpaper Lockscreen", v97);
          v124[8] = v23;
          v24 = (void *)MEMORY[0x1E4F940F8];
          v95[0] = MEMORY[0x1E4F143A8];
          v95[1] = 3221225472;
          v95[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_11;
          v95[3] = &unk_1E5F2B710;
          v25 = v20;
          id v96 = v25;
          v26 = objc_msgSend(v24, "pu_rowWithTitle:output:", @"Print Adjustment Data", v95);
          v124[9] = v26;
          v27 = (void *)MEMORY[0x1E4F940F8];
          v93[0] = MEMORY[0x1E4F143A8];
          v93[1] = 3221225472;
          v93[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_12;
          v93[3] = &unk_1E5F2E6D8;
          id v28 = v25;
          id v94 = v28;
          v29 = objc_msgSend(v27, "pu_rowWithTitle:asynchronousOutputProducer:", @"Print Story Highlights", v93);
          v124[10] = v29;
          v30 = (void *)MEMORY[0x1E4F940F8];
          v91[0] = MEMORY[0x1E4F143A8];
          v91[1] = 3221225472;
          v91[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_562;
          v91[3] = &unk_1E5F2B788;
          id v31 = v28;
          id v92 = v31;
          v32 = objc_msgSend(v30, "pu_rowWithTitle:settingsProvider:isTransient:", @"Image Manager Tester", v91, 1);
          v124[11] = v32;
          v33 = (void *)MEMORY[0x1E4F940F8];
          v89[0] = MEMORY[0x1E4F143A8];
          v89[1] = 3221225472;
          v89[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_566;
          v89[3] = &unk_1E5F2B738;
          id v34 = v31;
          id v90 = v34;
          v35 = objc_msgSend(v33, "pu_rowWithTitle:action:", @"Reset Suggestion State", v89);
          v124[12] = v35;
          v36 = (void *)MEMORY[0x1E4F940F8];
          v87[0] = MEMORY[0x1E4F143A8];
          v87[1] = 3221225472;
          v87[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_578;
          v87[3] = &unk_1E5F2B738;
          id v88 = v34;
          v37 = objc_msgSend(v36, "pu_rowWithTitle:action:", @"Prune CPL Resource", v87);
          v124[13] = v37;
          v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:v124 count:14];

          [v65 addObjectsFromArray:v38];
        }
        v39 = objc_msgSend(v72, "pu_debugCurrentViewModel");

        if (v39)
        {
          v85[0] = MEMORY[0x1E4F143A8];
          v85[1] = 3221225472;
          v85[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_579;
          v85[3] = &unk_1E5F2B7B0;
          objc_copyWeak(&v86, &location);
          v40 = _Block_copy(v85);
          v41 = (void *)MEMORY[0x1E4F940F8];
          v83[0] = MEMORY[0x1E4F143A8];
          v83[1] = 3221225472;
          v83[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_584;
          v83[3] = &unk_1E5F2B710;
          id v42 = v40;
          id v84 = v42;
          v43 = objc_msgSend(v41, "pu_rowWithTitle:output:", @"Print View Model", v83);
          v123[0] = v43;
          v44 = (void *)MEMORY[0x1E4F940F8];
          v45 = (void *)MEMORY[0x1E4F94190];
          v81[0] = MEMORY[0x1E4F143A8];
          v81[1] = 3221225472;
          v81[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4_589;
          v81[3] = &unk_1E5F2E728;
          id v46 = v42;
          id v82 = v46;
          v47 = [v45 actionWithHandler:v81];
          v48 = [v44 rowWithTitle:@"Log View Model (Continuously)" action:v47];
          v123[1] = v48;
          v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v123 count:2];

          [v65 addObjectsFromArray:v49];
          objc_destroyWeak(&v86);
        }
        if (objc_opt_respondsToSelector())
        {
          v50 = objc_msgSend(v72, "pu_debugRows");
          [v65 addObjectsFromArray:v50];
        }
        objc_destroyWeak(&v116);
        objc_destroyWeak(&location);
      }
      uint64_t v64 = [obj countByEnumeratingWithState:&v118 objects:v125 count:16];
    }
    while (v64);
  }

  v51 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  v52 = [v60 reverseObjectEnumerator];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v77 objects:v122 count:16];
  if (v53)
  {
    uint64_t v54 = *(void *)v78;
    do
    {
      for (uint64_t j = 0; j != v53; ++j)
      {
        if (*(void *)v78 != v54) {
          objc_enumerationMutation(v52);
        }
        [v51 addObject:*(void *)(*((void *)&v77 + 1) + 8 * j)];
      }
      uint64_t v53 = [v52 countByEnumeratingWithState:&v77 objects:v122 count:16];
    }
    while (v53);
  }

  v56 = (void *)MEMORY[0x1E4F940F8];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_603;
  v75[3] = &unk_1E5F2BE60;
  id v76 = v51;
  id v57 = v51;
  v58 = objc_msgSend(v56, "pu_rowWithTitle:output:", @"View Controller Stack", v75);
  [v65 addObject:v58];

  return v65;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_msgSend(WeakRetained, "pu_debugCurrentAsset");

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v3 = v2;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = v3;

  return v4;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 photoLibrary];
  uint64_t v3 = [v2 photoLibrary];

  id v4 = [v1 detailedDebugDescriptionInLibrary:v3];

  return v4;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 resourcesDebugDescription];

  return v2;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 metadataDebugDescription];

  return v2;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_5(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v6 = objc_alloc_init(PUParallaxLayerStackDebugViewController);
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  [(PUParallaxLayerStackDebugViewController *)v6 loadPHAsset:v4];

  long long v5 = [v3 navigationController];

  [v5 pushViewController:v6 animated:1];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_6(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PUWallpaperPosterEditDebugViewController alloc];
  long long v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithAsset:v5 posterType:1];

  [(PUWallpaperPosterEditDebugViewController *)v6 setModalPresentationStyle:5];
  [v3 presentViewController:v6 animated:1 completion:0];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_7(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PUWallpaperPosterEditDebugViewController alloc];
  long long v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = [v5 photoLibrary];
  uint64_t v7 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithPosterType:101 photoLibrary:v6];

  [(PUWallpaperPosterEditDebugViewController *)v7 setModalPresentationStyle:5];
  [v3 presentViewController:v7 animated:1 completion:0];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PUWallpaperPosterEditDebugViewController alloc];
  long long v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = [v5 photoLibrary];
  uint64_t v7 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithPosterType:102 photoLibrary:v6];

  [(PUWallpaperPosterEditDebugViewController *)v7 setModalPresentationStyle:5];
  [v3 presentViewController:v7 animated:1 completion:0];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_9(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [PUWallpaperPosterEditDebugViewController alloc];
  long long v5 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v6 = [v5 photoLibrary];
  uint64_t v7 = [(PUWallpaperPosterEditDebugViewController *)v4 initWithPosterType:103 photoLibrary:v6];

  [(PUWallpaperPosterEditDebugViewController *)v7 setModalPresentationStyle:5];
  [v3 presentViewController:v7 animated:1 completion:0];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_10(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [PUWallpaperPlaygroundViewController alloc];
  long long v5 = v4;
  if (*(void *)(a1 + 32))
  {
    v8[0] = *(void *)(a1 + 32);
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    uint64_t v7 = [(PUWallpaperPlaygroundViewController *)v5 initWithAssets:v6];
  }
  else
  {
    uint64_t v7 = [(PUWallpaperPlaygroundViewController *)v4 initWithAssets:MEMORY[0x1E4F1CBF0]];
  }
  [(PUWallpaperPlaygroundViewController *)v7 presentPlaygroundWithPresentingViewController:v3];
}

__CFString *__51__PURootSettings__debugRowsForViewControllerStack___block_invoke_11(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 adjustmentsDebugMetadata];
  if (v2)
  {
    long long v13 = v1;
    id v3 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F28E78]);
    [(__CFString *)v3 appendString:@"{"];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v4 = [v2 allKeys];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v15 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          uint64_t v10 = [v2 objectForKeyedSubscript:v9];
          long long v11 = [v10 debugDescription];
          [(__CFString *)v3 appendFormat:@"%@ = %@,\n", v9, v11];
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v6);
    }

    [(__CFString *)v3 appendString:@"}"];
    v1 = v13;
  }
  else if ([v1 hasAdjustments])
  {
    id v3 = @"<Unsupported Adjustments. Check console log for more info.>";
  }
  else
  {
    id v3 = @"Asset is not adjusted";
  }

  return v3;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_12(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F907E8]);
    v10[0] = v4;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_13;
    v8[3] = &unk_1E5F2B760;
    id v9 = v3;
    id v7 = (id)[v5 requestAnalysisForAssets:v6 options:3 contexts:MEMORY[0x1E4F1CBF0] resultHandler:v8];
  }
  else
  {
    (*((void (**)(id, __CFString *))v3 + 2))(v3, @"No asset found.");
  }
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_562(uint64_t a1)
{
  id v2 = PUTesterRootSettingsLoadIfNecessary(1);
  id v3 = [v2 imageManagerSettings];
  id v4 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v5 = [v4 localIdentifier];

  [v3 setSelectedAssetLocalIdentifier:v5];
  return v3;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_566(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  if (v1)
  {
    id v2 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    void v8[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_567;
    v8[3] = &unk_1E5F2ED10;
    id v9 = v1;
    id v7 = 0;
    int v3 = [v2 performChangesAndWait:v8 error:&v7];
    id v4 = v7;
    id v5 = PLOneUpGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = @"NO";
      if (v3) {
        uint64_t v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      long long v11 = v6;
      _os_log_impl(&dword_1AE9F8000, v5, OS_LOG_TYPE_DEFAULT, "Reset Suggestion State success: %@", buf, 0xCu);
    }
  }
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_578(uint64_t a1)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = v1;
  if (v1)
  {
    int v3 = [v1 photoLibrary];
    id v4 = [v3 assetsdClient];

    id v5 = [v4 debugClient];
    uint64_t v6 = [v2 uuid];
    v8[0] = v6;
    id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
    [v5 pruneAssets:v7 resourceTypes:0];
  }
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_2_579(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = objc_msgSend(WeakRetained, "pu_debugCurrentViewModel");

  return v2;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_584(uint64_t a1)
{
  v1 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = [v1 debugDetailedDescription];

  return v2;
}

uint64_t __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_4_589(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  objc_initWeak(&location, v7);
  objc_copyWeak(&v9, &location);
  PXIterateAsynchronously();
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);

  return 1;
}

id __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_603(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v3 = [*(id *)(a1 + 32) objectEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = [*(id *)(*((void *)&v13 + 1) + 8 * i) navigationItem];
        id v9 = [v8 title];

        uint64_t v10 = (objc_class *)objc_opt_class();
        long long v11 = NSStringFromClass(v10);
        if ([v9 length]) {
          [v2 appendFormat:@"%@ (%@)", v9, v11];
        }
        else {
          [v2 appendString:v11];
        }
        [v2 appendString:@"\n"];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  [v2 appendString:@"\nFor more details, use:\npo [UIViewController _allDescriptions]"];
  NSLog(&stru_1F06BE098.isa, v2);
  return v2;
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_5_590(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = [WeakRetained debugDetailedDescription];

  if (v5)
  {
    uint64_t v6 = PLOneUpGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v6, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    dispatch_time_t v7 = dispatch_time(0, 2000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_591;
    block[3] = &unk_1E5F2ED10;
    id v9 = v3;
    dispatch_after(v7, MEMORY[0x1E4F14428], block);
  }
  else
  {
    [v3 stop];
  }
}

uint64_t __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_591(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_3_567(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F38ED0] changeRequestForAsset:*(void *)(a1 + 32)];
  for (uint64_t i = 0; i != 4; ++i)
    [v2 setVariationSuggestionStates:0 forVariationType:i];
}

void __51__PURootSettings__debugRowsForViewControllerStack___block_invoke_13(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = [a2 firstObject];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v3])
  {
    id v12 = 0;
    uint64_t v4 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v3 options:0 error:&v12];
    id v5 = v12;
    if (v4)
    {
      uint64_t v6 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
      dispatch_time_t v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      uint64_t v10 = PLUIGetLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        long long v14 = v3;
        _os_log_impl(&dword_1AE9F8000, v10, OS_LOG_TYPE_ERROR, "Unable to generate json data from supposedly valid object: %@", buf, 0xCu);
      }

      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v6 = [v3 description];
      dispatch_time_t v7 = *(void (**)(void))(v11 + 16);
    }
    v7();
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    id v9 = [v3 description];
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
  }
}

+ (void)dismissSettingsController:(id)a3
{
  id v3 = (id)settingsWindow;
  uint64_t v4 = [(id)settingsWindow rootViewController];
  [v4 setToast:0];
  id v5 = [v4 view];
  [v5 frame];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  uint64_t v13 = v12;
  long long v14 = (void *)MEMORY[0x1E4FB1EB0];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __44__PURootSettings_dismissSettingsController___block_invoke;
  v26[3] = &unk_1E5F2E058;
  id v27 = v5;
  uint64_t v28 = v7;
  uint64_t v29 = v9;
  uint64_t v30 = v11;
  uint64_t v31 = v13;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __44__PURootSettings_dismissSettingsController___block_invoke_2;
  v18[3] = &unk_1E5F2B6C0;
  id v19 = v3;
  id v20 = v27;
  uint64_t v22 = v7;
  uint64_t v23 = v9;
  uint64_t v24 = v11;
  uint64_t v25 = v13;
  id v21 = v4;
  id v15 = v4;
  id v16 = v27;
  id v17 = v3;
  [v14 _animateUsingDefaultTimingWithOptions:4 animations:v26 completion:v18];
}

uint64_t __44__PURootSettings_dismissSettingsController___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  CGFloat v3 = -CGRectGetHeight(*(CGRect *)(a1 + 40));
  CGRect v6 = CGRectOffset(*(CGRect *)(a1 + 40), 0.0, v3);
  return objc_msgSend(v2, "setFrame:", v6.origin.x, v6.origin.y, v6.size.width, v6.size.height);
}

uint64_t __44__PURootSettings_dismissSettingsController___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) resignKeyWindow];
  [*(id *)(a1 + 32) setHidden:1];
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  CGFloat v3 = [v2 windows];
  uint64_t v4 = [v3 firstObject];
  [v4 makeKeyWindow];

  objc_msgSend(*(id *)(a1 + 40), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  id v5 = *(void **)(a1 + 48);
  return [v5 callOnViewDidDisappearBlock];
}

+ (void)dismissSettingsController
{
  if (settingsWindow && ([(id)settingsWindow isHidden] & 1) == 0)
  {
    [a1 dismissSettingsController:0];
  }
}

+ (void)presentSettingsController
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  char v72 = 0;
  SBSGetScreenLockStatus();
  if (!settingsWindow || [(id)settingsWindow isHidden])
  {
    uint64_t v4 = objc_msgSend(MEMORY[0x1E4FB1EC0], "pu_currentViewControllerStack");
    v45 = [v4 firstObject];
    if (!v45)
    {
LABEL_20:

      return;
    }
    v44 = [a1 _debugRowsForViewControllerStack:v4];
    +[PURootSettings _setDebugRows:v44];
    id v5 = [a1 sharedInstance];
    [v5 _setObservationEnabled:1];
    uint64_t v66 = 0;
    v67 = (id *)&v66;
    uint64_t v68 = 0x3032000000;
    v69 = __Block_byref_object_copy__79414;
    v70 = __Block_byref_object_dispose__79415;
    id v71 = 0;
    uint64_t v6 = [v4 hash];
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v7 = v4;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v73 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v63 != v9) {
            objc_enumerationMutation(v7);
          }
          v6 ^= [*(id *)(*((void *)&v62 + 1) + 8 * i) hash];
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v62 objects:v73 count:16];
      }
      while (v8);
    }

    if (v6 == presentSettingsController_lastHash)
    {
      objc_storeStrong(v67 + 5, (id)presentSettingsController_lastSettingsViewController);
      uint64_t v11 = [v67[5] viewControllers];
      uint64_t v12 = (void *)[v11 copy];
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __43__PURootSettings_presentSettingsController__block_invoke_467;
      v59[3] = &unk_1E5F2B650;
      v61 = &v66;
      id v13 = v11;
      id v60 = v13;
      [v12 enumerateObjectsUsingBlock:v59];
    }
    id v14 = v67[5];
    if (!v14)
    {
      id v15 = [[_PUSettingsController alloc] initWithRootSettings:v5];
      id v16 = v67[5];
      v67[5] = v15;

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __43__PURootSettings_presentSettingsController__block_invoke_2;
      v58[3] = &__block_descriptor_40_e22___UIBarButtonItem_8__0l;
      v58[4] = a1;
      [v67[5] setDismissButtonFactory:v58];
      id v17 = [v67[5] dismissButtonFactory];
      uint64_t v18 = v17[2]();
      [v67[5] setDismissButton:v18];

      objc_initWeak(&location, v67[5]);
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      v55[2] = __43__PURootSettings_presentSettingsController__block_invoke_3;
      v55[3] = &unk_1E5F2B698;
      objc_copyWeak(&v56, &location);
      [v67[5] setEllipsisBarButtonItemFactory:v55];
      objc_destroyWeak(&v56);
      objc_destroyWeak(&location);
      id v14 = v67[5];
    }
    presentSettingsController_lastHash = v6;
    objc_storeStrong((id *)&presentSettingsController_lastSettingsViewController, v14);
    id v19 = v67[5];
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    v52[2] = __43__PURootSettings_presentSettingsController__block_invoke_4;
    v52[3] = &unk_1E5F2E0A8;
    id v20 = v5;
    id v53 = v20;
    id v54 = a1;
    [v19 setOnViewDidDisappearBlock:v52];
    id v21 = (void *)settingsWindow;
    if (settingsWindow)
    {
LABEL_19:
      [v21 setHidden:0];
      [(id)settingsWindow setRootViewController:v67[5]];
      [(id)settingsWindow makeKeyAndVisible];
      uint64_t v30 = [(id)settingsWindow rootViewController];
      uint64_t v31 = [v30 view];

      [v31 frame];
      CGFloat x = v75.origin.x;
      CGFloat y = v75.origin.y;
      CGFloat width = v75.size.width;
      CGFloat height = v75.size.height;
      CGFloat v36 = -CGRectGetHeight(v75);
      v76.origin.CGFloat x = x;
      v76.origin.CGFloat y = y;
      v76.size.CGFloat width = width;
      v76.size.CGFloat height = height;
      CGRect v77 = CGRectOffset(v76, 0.0, v36);
      objc_msgSend(v31, "setFrame:", v77.origin.x, v77.origin.y, v77.size.width, v77.size.height);
      v37 = (void *)MEMORY[0x1E4FB1EB0];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __43__PURootSettings_presentSettingsController__block_invoke_5;
      v46[3] = &unk_1E5F2E058;
      id v38 = v31;
      id v47 = v38;
      CGFloat v48 = x;
      CGFloat v49 = y;
      CGFloat v50 = width;
      CGFloat v51 = height;
      [v37 _animateUsingDefaultTimingWithOptions:2 animations:v46 completion:0];

      _Block_object_dispose(&v66, 8);
      goto LABEL_20;
    }
    id v22 = objc_alloc(MEMORY[0x1E4FB1F48]);
    uint64_t v23 = [MEMORY[0x1E4FB1438] sharedApplication];
    uint64_t v24 = [v23 connectedScenes];
    uint64_t v25 = [v24 anyObject];

    if (v25)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
LABEL_18:
        uint64_t v26 = [v22 initWithWindowScene:v25];
        id v27 = (void *)settingsWindow;
        settingsWindow = v26;

        id v28 = objc_alloc_init(MEMORY[0x1E4F900C8]);
        uint64_t v29 = (void *)settingsDiagnosticsController;
        settingsDiagnosticsController = (uint64_t)v28;

        [(id)settingsDiagnosticsController setupOnInternalDevicesWithWindow:settingsWindow];
        id v21 = (void *)settingsWindow;
        goto LABEL_19;
      }
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      v41 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v41);
      id v42 = objc_msgSend(v25, "px_descriptionForAssertionMessage");
      [v43 handleFailureInMethod:a2, a1, @"PURootSettings.m", 471, @"%@ should be an instance inheriting from %@, but it is %@", @"UIApplication.sharedApplication.connectedScenes.anyObject", v40, v42 object file lineNumber description];
    }
    else
    {
      v43 = [MEMORY[0x1E4F28B00] currentHandler];
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      [v43 handleFailureInMethod:a2, a1, @"PURootSettings.m", 471, @"%@ should be an instance inheriting from %@, but it is nil", @"UIApplication.sharedApplication.connectedScenes.anyObject", v40 object file lineNumber description];
    }

    goto LABEL_18;
  }
}

uint64_t __43__PURootSettings_presentSettingsController__block_invoke(uint64_t result, int a2)
{
  if (a2) {
    return [*(id *)(result + 32) presentSettingsController];
  }
  return result;
}

void __43__PURootSettings_presentSettingsController__block_invoke_467(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  if (objc_msgSend(a2, "pu_debugIsTransient"))
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v8 = *(void **)(v7 + 40);
    if (a3)
    {
      uint64_t v9 = [*(id *)(a1 + 32) objectAtIndex:a3 - 1];
      id v10 = (id)[v8 popToViewController:v9 animated:0];
      uint64_t v8 = (void *)v9;
    }
    else
    {
      *(void *)(v7 + 40) = 0;
    }

    *a4 = 1;
  }
}

id __43__PURootSettings_presentSettingsController__block_invoke_2(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithBarButtonSystemItem:0 target:*(void *)(a1 + 32) action:sel_dismissSettingsController_];
  return v1;
}

id __43__PURootSettings_presentSettingsController__block_invoke_3(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FB14A8]);
  CGFloat v3 = [MEMORY[0x1E4FB1818] systemImageNamed:@"ellipsis.circle.fill"];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (void *)[v2 initWithImage:v3 style:0 target:WeakRetained action:sel_handleEllipsisBarButtonItem_];

  return v5;
}

void __43__PURootSettings_presentSettingsController__block_invoke_4(uint64_t a1)
{
  +[PURootSettings _setDebugRows:0];
  [*(id *)(a1 + 32) save];
  id v2 = (id)testerRootSettings;
  [v2 save];

  CGFloat v3 = PXSoftLinkedProtoRootSettingsLoadIfNecessary();
  [v3 save];

  id v4 = [(id)objc_opt_class() _photoKitSettings];
  [v4 save];
}

uint64_t __43__PURootSettings_presentSettingsController__block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

+ (void)_presentTapToRadar
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v39 = [MEMORY[0x1E4F90200] defaultDescription];
  id v2 = objc_msgSend(MEMORY[0x1E4FB1EC0], "pu_currentViewControllerStack");
  id v38 = [v2 lastObject];
  CGFloat v3 = [v38 view];
  id v4 = [v3 window];

  [v4 frame];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v4 frame];
  v51.CGFloat width = v13;
  v51.CGFloat height = v14;
  UIGraphicsBeginImageContextWithOptions(v51, 0, 0.0);
  objc_msgSend(v4, "drawViewHierarchyInRect:", v6, v8, v10, v12);
  uint64_t v15 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  v37 = (void *)v15;
  CGFloat v36 = [(id)objc_opt_class() _saveScreenshot:v15];
  id v16 = objc_msgSend(MEMORY[0x1E4F1CB10], "URLWithString:");
  id v17 = objc_msgSend(MEMORY[0x1E4FB1438], "pu_debugCurrentAsset");
  if (v17)
  {
    uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v19 = v17;
    }
    else {
      id v19 = 0;
    }
    [v18 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F56558]];
    id v20 = (objc_class *)objc_opt_class();
    id v21 = NSStringFromClass(v20);
    [v18 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F56560]];

    [MEMORY[0x1E4F56658] sendEvent:*MEMORY[0x1E4F56450] withPayload:v18];
  }
  id v22 = objc_opt_new();
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v23 = v2;
  uint64_t v24 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v44;
    do
    {
      uint64_t v27 = 0;
      do
      {
        if (*(void *)v44 != v26) {
          objc_enumerationMutation(v23);
        }
        id v28 = [*(id *)(*((void *)&v43 + 1) + 8 * v27) debugURLsForDiagnostics];
        [v22 addObjectsFromArray:v28];

        ++v27;
      }
      while (v25 != v27);
      uint64_t v25 = [v23 countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v25);
  }

  uint64_t v29 = [MEMORY[0x1E4F28CB8] defaultManager];
  uint64_t v30 = (void *)MEMORY[0x1E4F90200];
  CGFloat v48 = v16;
  uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
  uint64_t v47 = *MEMORY[0x1E4F90EA8];
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v47 count:1];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __36__PURootSettings__presentTapToRadar__block_invoke;
  v40[3] = &unk_1E5F2E1C0;
  id v41 = v29;
  id v42 = v16;
  id v33 = v16;
  id v34 = v29;
  LOWORD(v35) = 1;
  objc_msgSend(v30, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", @"Photos - [TTR] <Insert Bug Title>", v39, @"Other Bug", @"630529", @"Photos (New Bugs) | iOS", @"all", 0, v31, v22, v35, v32, v40);
}

uint64_t __36__PURootSettings__presentTapToRadar__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeItemAtURL:*(void *)(a1 + 40) error:0];
}

+ (id)_saveScreenshot:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CGFloat v3 = UIImageJPEGRepresentation((UIImage *)a3, 1.0);
  id v4 = NSTemporaryDirectory();
  double v5 = [v4 stringByAppendingPathComponent:@"tapToRadar.jpg"];

  id v9 = 0;
  [v3 writeToFile:v5 options:1 error:&v9];
  id v6 = v9;
  if (v6)
  {
    double v7 = PLUIGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      double v11 = v5;
      _os_log_impl(&dword_1AE9F8000, v7, OS_LOG_TYPE_ERROR, "Unable to write screenshot to temp url: %@", buf, 0xCu);
    }
  }
  return v5;
}

void __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4FB1438] sharedApplication];
  CGFloat v3 = [v2 windows];
  id v4 = [v3 firstObject];
  double v5 = [v4 windowScene];
  id v6 = [v5 statusBarManager];

  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_2;
    v15[3] = &unk_1E5F2E530;
    objc_copyWeak(&v16, &location);
    [v6 setDebugMenuHandler:v15];
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  else
  {
    double v7 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:*(void *)(a1 + 32) action:sel_presentSettingsController];
    [v7 setNumberOfTapsRequired:2];
    double v8 = [MEMORY[0x1E4FB1438] sharedApplication];
    id v9 = [v8 statusBarWindow];
    [v9 addGestureRecognizer:v7];
  }
  objc_initWeak(&location, *(id *)(a1 + 32));
  int out_token = 0;
  double v10 = MEMORY[0x1E4F14428];
  id v11 = MEMORY[0x1E4F14428];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_3;
  v12[3] = &unk_1E5F2B608;
  objc_copyWeak(&v13, &location);
  notify_register_dispatch("ShowPhotosInternalSettings", &out_token, v10, v12);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentSettingsController];
}

void __72__PURootSettings_setupStatusBarInternalSettingsGestureOnInternalDevices__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentSettingsController];
}

+ (id)settingsControllerModule
{
  v137[29] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F904F0]);
  id v4 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
  double v5 = NSStringFromSelector(sel__internal_libraryStateBriefDescription);
  id v6 = NSStringFromSelector(sel__internal_libraryStateImage);
  uint64_t v7 = [v3 initWithPhotoLibrary:v4 titleKeyPath:v5 imageKeyPath:v6];

  double v8 = [MEMORY[0x1E4F1CA48] array];
  v130 = (void *)v7;
  [v8 addObject:v7];
  if (_os_feature_enabled_impl())
  {
    id v9 = objc_alloc(MEMORY[0x1E4F90250]);
    double v10 = objc_msgSend(MEMORY[0x1E4F39228], "px_deprecated_appPhotoLibrary");
    id v11 = NSStringFromSelector(sel__memory_creationStateTitle);
    uint64_t v12 = NSStringFromSelector(sel__memory_creationStateImage);
    id v13 = (void *)[v9 initWithPhotoLibrary:v10 titleKeyPath:v11 imageKeyPath:v12];

    [v8 addObject:v13];
  }
  v129 = [MEMORY[0x1E4F94160] sectionWithRows:v8 title:@"Processing Progress"];
  CGFloat v14 = (void *)MEMORY[0x1E4F901D8];
  uint64_t v15 = NSStringFromSelector(sel_favoritesSettings);
  id v16 = +[PURootSettings sharedInstance];
  v128 = [v14 favoritesSubmoduleWithFavoritesSettingsKeyPath:v15 delegate:v16];

  v131 = [MEMORY[0x1E4F1CA48] array];
  id v17 = (void *)MEMORY[0x1E4F94130];
  v127 = [MEMORY[0x1E4F90618] sharedInstance];
  uint64_t v126 = [v127 lemonadeSettings];
  v125 = objc_msgSend(v17, "pu_rowWithTitle:settings:", @"🍋 Lemonade", v126);
  v137[0] = v125;
  uint64_t v18 = (void *)MEMORY[0x1E4F94130];
  v124 = NSStringFromSelector(sel_tabbedLibrarySettings);
  v123 = [v18 rowWithTitle:@"Tabs & Sidebar" childSettingsKeyPath:v124];
  v137[1] = v123;
  id v19 = (void *)MEMORY[0x1E4F94130];
  v122 = [a1 _photosUICoreSettings];
  long long v121 = objc_msgSend(v19, "pu_rowWithTitle:settings:", @"PhotosUICore", v122);
  v137[2] = v121;
  long long v120 = objc_msgSend(MEMORY[0x1E4F94130], "pu_rowWithTitle:settingsProvider:", @"Tutorials", &__block_literal_global_79715);
  v137[3] = v120;
  id v20 = (void *)MEMORY[0x1E4F94130];
  long long v119 = [a1 _photosUICoreSettings];
  long long v118 = [v119 diagnostics];
  v117 = objc_msgSend(v20, "pu_rowWithTitle:settings:", @"Diagnostics", v118);
  v137[4] = v117;
  id v21 = (void *)MEMORY[0x1E4F94130];
  id v116 = [a1 _photoKitSettings];
  v115 = objc_msgSend(v21, "pu_rowWithTitle:settings:", @"PhotoKit", v116);
  v137[5] = v115;
  id v22 = (void *)MEMORY[0x1E4F94130];
  v114 = NSStringFromSelector(sel_curation);
  v113 = [v22 rowWithTitle:@"Curation" childSettingsKeyPath:v114];
  v137[6] = v113;
  id v23 = (void *)MEMORY[0x1E4F94130];
  v112 = NSStringFromSelector(sel_welcomeSettings);
  v111 = [v23 rowWithTitle:@"Welcome" childSettingsKeyPath:v112];
  v137[7] = v111;
  uint64_t v24 = (void *)MEMORY[0x1E4F94130];
  v110 = NSStringFromSelector(sel_photosGridSettings);
  v109 = [v24 rowWithTitle:@"Photos Grid" childSettingsKeyPath:v110];
  v137[8] = v109;
  uint64_t v25 = (void *)MEMORY[0x1E4F94130];
  v108 = NSStringFromSelector(sel_photoEditingSettings);
  v107 = [v25 rowWithTitle:@"Photo Editing" childSettingsKeyPath:v108];
  v137[9] = v107;
  uint64_t v26 = (void *)MEMORY[0x1E4F94130];
  v105 = NSStringFromSelector(sel_medusaSettings);
  v104 = [v26 rowWithTitle:@"Medusa" childSettingsKeyPath:v105];
  v137[10] = v104;
  uint64_t v27 = (void *)MEMORY[0x1E4F94130];
  v103 = NSStringFromSelector(sel_oneUpSettings);
  v102 = [v27 rowWithTitle:@"One Up" childSettingsKeyPath:v103];
  v137[11] = v102;
  id v28 = (void *)MEMORY[0x1E4F94130];
  v101 = NSStringFromSelector(sel_workaroundSettings);
  v100 = [v28 rowWithTitle:@"Workarounds" childSettingsKeyPath:v101];
  v137[12] = v100;
  uint64_t v29 = (void *)MEMORY[0x1E4F941F0];
  v99 = NSStringFromSelector(sel_allowIrisUI);
  id v98 = [v29 rowWithTitle:@"Iris UI and Playback" valueKeyPath:v99];
  v137[13] = v98;
  uint64_t v30 = (void *)MEMORY[0x1E4F94130];
  v97 = NSStringFromSelector(sel_irisSettings);
  id v96 = [v30 rowWithTitle:@"Iris" childSettingsKeyPath:v97];
  v137[14] = v96;
  uint64_t v31 = (void *)MEMORY[0x1E4F94130];
  v95 = NSStringFromSelector(sel_tilingViewSettings);
  id v94 = [v31 rowWithTitle:@"Tiling View" childSettingsKeyPath:v95];
  v137[15] = v94;
  v32 = (void *)MEMORY[0x1E4F94130];
  v93 = NSStringFromSelector(sel_slideshowSettings);
  id v92 = [v32 rowWithTitle:@"Slideshow" childSettingsKeyPath:v93];
  v137[16] = v92;
  id v33 = (void *)MEMORY[0x1E4F94130];
  id v90 = NSStringFromSelector(sel_sceneSettings);
  v89 = [v33 rowWithTitle:@"Scenes" childSettingsKeyPath:v90];
  v137[17] = v89;
  id v34 = (void *)MEMORY[0x1E4F94130];
  id v88 = NSStringFromSelector(sel_audioClassificationSettings);
  v87 = [v34 rowWithTitle:@"Audio Classification" childSettingsKeyPath:v88];
  v137[18] = v87;
  uint64_t v35 = (void *)MEMORY[0x1E4F94130];
  id v86 = NSStringFromSelector(sel_suggestions);
  v85 = [v35 rowWithTitle:@"Suggestions" childSettingsKeyPath:v86];
  v137[19] = v85;
  CGFloat v36 = (void *)MEMORY[0x1E4F94130];
  id v84 = [a1 _photosUICoreSettings];
  v83 = [v84 sharingSettings];
  id v82 = objc_msgSend(v36, "pu_rowWithTitle:settings:", @"Sharing", v83);
  v137[20] = v82;
  v37 = (void *)MEMORY[0x1E4F94108];
  v81 = NSStringFromSelector(sel_interfaceThemeClass);
  long long v80 = [v37 rowWithTitle:@"Interface Theme" valueKeyPath:v81];
  v136[0] = objc_opt_class();
  v136[1] = objc_opt_class();
  v136[2] = objc_opt_class();
  long long v79 = [MEMORY[0x1E4F1C978] arrayWithObjects:v136 count:3];
  long long v78 = [v80 possibleValues:v79 titles:&unk_1F078B510];
  v137[21] = v78;
  id v38 = (void *)MEMORY[0x1E4F94130];
  CGRect v77 = NSStringFromSelector(sel_airPlaySettings);
  CGRect v76 = [v38 rowWithTitle:@"AirPlay" childSettingsKeyPath:v77];
  v137[22] = v76;
  v39 = (void *)MEMORY[0x1E4F94130];
  CGRect v75 = NSStringFromSelector(sel_performanceDiagnosticsSettings);
  uint64_t v74 = [v39 rowWithTitle:@"Performance Diagnostics" childSettingsKeyPath:v75];
  v137[23] = v74;
  v40 = (void *)MEMORY[0x1E4F94130];
  v73 = [a1 _photosUICoreSettings];
  char v72 = [v73 importSettings];
  id v71 = objc_msgSend(v40, "pu_rowWithTitle:settings:", @"Import", v72);
  v137[24] = v71;
  id v41 = (void *)MEMORY[0x1E4F94130];
  id v42 = NSStringFromSelector(sel_compositeVideoSettings);
  long long v43 = [v41 rowWithTitle:@"Composite Video" childSettingsKeyPath:v42];
  v137[25] = v43;
  long long v44 = (void *)MEMORY[0x1E4F94130];
  NSStringFromSelector(sel_ambientPhotoFrameSettings);
  long long v45 = v106 = v8;
  long long v46 = [v44 rowWithTitle:@"Ambient Photo Frame" childSettingsKeyPath:v45];
  v137[26] = v46;
  uint64_t v47 = (void *)MEMORY[0x1E4F94130];
  CGFloat v48 = [a1 _photosUICoreSettings];
  CGFloat v49 = [v48 generativeStorySettings];
  uint64_t v50 = objc_msgSend(v47, "pu_rowWithTitle:settings:", @"Memory Creation", v49);
  v137[27] = v50;
  CGSize v51 = (void *)MEMORY[0x1E4F940F8];
  v52 = [MEMORY[0x1E4F94170] actionWithSettingsKeyPath:0];
  id v53 = [v51 rowWithTitle:@"Restore All Defaults" action:v52];
  v137[28] = v53;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v137 count:29];
  id v54 = v91 = a1;
  [v131 addObjectsFromArray:v54];

  v55 = [MEMORY[0x1E4F94160] sectionWithRows:v131];
  id v56 = [MEMORY[0x1E4F1CA48] array];
  id v57 = objc_msgSend(MEMORY[0x1E4F94130], "pu_rowWithTitle:settingsProvider:", @"PhotosUI Tester", &__block_literal_global_385_79764);
  v135[0] = v57;
  v58 = objc_msgSend(MEMORY[0x1E4F94130], "pu_rowWithTitle:settingsProvider:", @"PhotosUICore Proto", &__block_literal_global_390);
  v135[1] = v58;
  v59 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:2];
  [v56 addObjectsFromArray:v59];

  [v56 addObjectsFromArray:sDebugRows];
  id v60 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:asynchronousOutputProducer:", @"Print UI State", &__block_literal_global_396);
  v134[0] = v60;
  v61 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:asynchronousOutputProducer:", @"Print iCloud Photo Library Status", &__block_literal_global_403);
  v134[1] = v61;
  long long v62 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:asynchronousOutputProducer:", @"Print Photo Analysis Status", &__block_literal_global_408);
  v134[2] = v62;
  long long v63 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:asynchronousOutputProducer:", @"Print Statistics", &__block_literal_global_413);
  v134[3] = v63;
  v132[0] = MEMORY[0x1E4F143A8];
  v132[1] = 3221225472;
  v132[2] = __42__PURootSettings_settingsControllerModule__block_invoke_12;
  v132[3] = &__block_descriptor_40_e30_v16__0__PTUIModuleController_8l;
  v132[4] = v91;
  long long v64 = objc_msgSend(MEMORY[0x1E4F940F8], "pu_rowWithTitle:action:", @"Delete All Diagnostic Files", v132);
  v134[4] = v64;
  long long v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:5];
  [v56 addObjectsFromArray:v65];

  uint64_t v66 = [MEMORY[0x1E4F94160] sectionWithRows:v56 title:@"Debug"];
  v67 = (void *)MEMORY[0x1E4F94160];
  v133[0] = v128;
  v133[1] = v129;
  v133[2] = v55;
  v133[3] = v66;
  uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:4];
  v69 = [v67 moduleWithTitle:@"Photos" contents:v68];

  return v69;
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_12(uint64_t a1)
{
  return [*(id *)(a1 + 32) _deleteAllDiagnosticFiles];
}

void __42__PURootSettings_settingsControllerModule__block_invoke_10(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PUPhotosDiagnosticsAgent localDiagnosticsAgent];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_11;
  v5[3] = &unk_1E5F2B5C0;
  id v6 = v2;
  id v4 = v2;
  [v3 captureDescriptionOfStatisticsWithResultHandler:v5];
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_11(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__PURootSettings_settingsControllerModule__block_invoke_8(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PUPhotosDiagnosticsAgent localDiagnosticsAgent];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_9;
  v5[3] = &unk_1E5F2B5C0;
  id v6 = v2;
  id v4 = v2;
  [v3 captureDescriptionOfPhotoAnalysisWithResultHandler:v5];
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__PURootSettings_settingsControllerModule__block_invoke_6(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PUPhotosDiagnosticsAgent localDiagnosticsAgent];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_7;
  v5[3] = &unk_1E5F2B5C0;
  id v6 = v2;
  id v4 = v2;
  [v3 captureDescriptionOfCloudPhotoLibraryWithResultHandler:v5];
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __42__PURootSettings_settingsControllerModule__block_invoke_4(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = +[PUPhotosDiagnosticsAgent localDiagnosticsAgent];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __42__PURootSettings_settingsControllerModule__block_invoke_5;
  v5[3] = &unk_1E5F2B5C0;
  id v6 = v2;
  id v4 = v2;
  [v3 captureDescriptionOfUIState:0 resultHandler:v5];
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke_3()
{
  return PXSoftLinkedProtoRootSettingsLoadIfNecessary();
}

id __42__PURootSettings_settingsControllerModule__block_invoke_2()
{
  return PUTesterRootSettingsLoadIfNecessary(1);
}

uint64_t __42__PURootSettings_settingsControllerModule__block_invoke()
{
  return MEMORY[0x1F4143FB8](1);
}

@end