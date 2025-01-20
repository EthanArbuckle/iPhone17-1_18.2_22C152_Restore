@interface PUWallpaperActivity
- (BOOL)_isWallpaperModificationAllowed;
- (BOOL)_needsUpdateWallpaperModificationAllowed;
- (BOOL)canPerformWithActivityItems:(id)a3;
- (PUWallpaperActivity)init;
- (id)_systemImageName;
- (id)activityTitle;
- (id)activityType;
- (id)activityViewController;
- (void)_restrictionsChanged:(id)a3;
- (void)_setNeedsUpdateWallpaperModificationAllowed:(BOOL)a3;
- (void)_setWallpaperModificationAllowed:(BOOL)a3;
- (void)_updateWallpaperModificationAllowedIfNeeded;
- (void)dealloc;
- (void)inlineEditingViewController:(id)a3 didDismissWithResponse:(id)a4;
- (void)performActivity;
- (void)prepareWithActivityItems:(id)a3;
@end

@implementation PUWallpaperActivity

- (void).cxx_destruct
{
}

- (void)_setNeedsUpdateWallpaperModificationAllowed:(BOOL)a3
{
  self->__needsUpdateWallpaperModificationAllowed = a3;
}

- (BOOL)_needsUpdateWallpaperModificationAllowed
{
  return self->__needsUpdateWallpaperModificationAllowed;
}

- (void)_setWallpaperModificationAllowed:(BOOL)a3
{
  self->__wallpaperModificationAllowed = a3;
}

- (BOOL)_isWallpaperModificationAllowed
{
  return self->__wallpaperModificationAllowed;
}

- (void)inlineEditingViewController:(id)a3 didDismissWithResponse:(id)a4
{
  BOOL v5 = objc_msgSend(a4, "entryPointResult", a3) == 1;
  [(UIActivity *)self activityDidFinish:v5];
}

- (void)_updateWallpaperModificationAllowedIfNeeded
{
  if ([(PUWallpaperActivity *)self _needsUpdateWallpaperModificationAllowed])
  {
    [(PUWallpaperActivity *)self _setNeedsUpdateWallpaperModificationAllowed:0];
    uint64_t v8 = 0;
    v9 = &v8;
    uint64_t v10 = 0x2050000000;
    v3 = (void *)getMCProfileConnectionClass_softClass_100696;
    uint64_t v11 = getMCProfileConnectionClass_softClass_100696;
    if (!getMCProfileConnectionClass_softClass_100696)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __getMCProfileConnectionClass_block_invoke_100697;
      v7[3] = &unk_1E5F2E228;
      v7[4] = &v8;
      __getMCProfileConnectionClass_block_invoke_100697((uint64_t)v7);
      v3 = (void *)v9[3];
    }
    id v4 = v3;
    _Block_object_dispose(&v8, 8);
    BOOL v5 = [v4 sharedConnection];
    uint64_t v6 = [v5 isWallpaperModificationAllowed];

    [(PUWallpaperActivity *)self _setWallpaperModificationAllowed:v6];
  }
}

- (void)_restrictionsChanged:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __44__PUWallpaperActivity__restrictionsChanged___block_invoke;
  block[3] = &unk_1E5F2ED10;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __44__PUWallpaperActivity__restrictionsChanged___block_invoke(uint64_t a1)
{
  int v2 = [*(id *)(a1 + 32) _isWallpaperModificationAllowed];
  [*(id *)(a1 + 32) _setNeedsUpdateWallpaperModificationAllowed:1];
  [*(id *)(a1 + 32) _updateWallpaperModificationAllowedIfNeeded];
  uint64_t result = [*(id *)(a1 + 32) _isWallpaperModificationAllowed];
  if (v2 != result)
  {
    id v4 = *(void **)(a1 + 32);
    return [v4 updateActivityViewControllerVisibleShareActions];
  }
  return result;
}

- (id)activityViewController
{
  return self->_wallpaperActivityViewController;
}

- (void)performActivity
{
}

- (void)prepareWithActivityItems:(id)a3
{
  id v4 = [(PXActivity *)self itemSourceController];
  BOOL v5 = [v4 assets];
  uint64_t v6 = PXMap();
  v7 = PXCreateMutablePosterConfigurationForLockScreenRole();
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F8CCF8]) initWithConfigurationType:0];
  [v8 setOptions:1];
  [v8 setMedia:v6];
  [v7 setDisplayNameLocalizationKey:@"PHOTOS_WALLPAPER_SWITCHER_TITLE_PHOTOS"];
  v9 = [v7 assetDirectory];
  id v14 = 0;
  [v8 saveToURL:v9 error:&v14];
  id v10 = v14;

  uint64_t v11 = PXCreateWallpaperPosterEditingEntryPoint();
  PXCreateWallpaperPosterInlineEditingViewController();
  v12 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  [(UIViewController *)v12 setDelegate:self];
  [(UIViewController *)v12 setModalPresentationStyle:0];
  wallpaperActivityViewController = self->_wallpaperActivityViewController;
  self->_wallpaperActivityViewController = v12;
}

id __48__PUWallpaperActivity_prepareWithActivityItems___block_invoke(uint64_t a1, void *a2)
{
  int v2 = (objc_class *)MEMORY[0x1E4F8CD18];
  id v3 = a2;
  id v4 = [v2 alloc];
  BOOL v5 = [v3 uuid];

  uint64_t v6 = (void *)[v4 initWithAssetUUID:v5];
  return v6;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  if (PLIsEDUMode()) {
    return 0;
  }
  BOOL v5 = [(PXActivity *)self itemSourceController];
  if ([v5 isPreparingIndividualItems])
  {
    if (v5) {
      [v5 requestAssetsMediaTypeCount];
    }
    uint64_t v6 = objc_msgSend(v5, "assets", (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, (unsigned __int128)0, 0);
    uint64_t v7 = [v6 count];

    BOOL v4 = 0;
    if (v7 == 1 && v9 == 1)
    {
      [(PUWallpaperActivity *)self _updateWallpaperModificationAllowedIfNeeded];
      BOOL v4 = [(PUWallpaperActivity *)self _isWallpaperModificationAllowed];
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)_systemImageName
{
  if (_ActivitySystemImageName_onceToken != -1) {
    dispatch_once(&_ActivitySystemImageName_onceToken, &__block_literal_global_125);
  }
  int v2 = (void *)_ActivitySystemImageName_imageName;
  return v2;
}

- (id)activityTitle
{
  return (id)PLLocalizedFrameworkString();
}

- (id)activityType
{
  return (id)*MEMORY[0x1E4F90A60];
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUWallpaperActivity;
  [(PUWallpaperActivity *)&v4 dealloc];
}

- (PUWallpaperActivity)init
{
  v10.receiver = self;
  v10.super_class = (Class)PUWallpaperActivity;
  int v2 = [(UIActivity *)&v10 init];
  if (!v2) {
    return v2;
  }
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  objc_super v4 = (void *)getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr;
  uint64_t v19 = getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr;
  if (!getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr)
  {
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __getMCEffectiveSettingsChangedNotificationSymbolLoc_block_invoke;
    id v14 = &unk_1E5F2E228;
    v15 = &v16;
    BOOL v5 = ManagedConfigurationLibrary_100698();
    uint64_t v6 = dlsym(v5, "MCEffectiveSettingsChangedNotification");
    *(void *)(v15[1] + 24) = v6;
    getMCEffectiveSettingsChangedNotificationSymbolLoc_ptr = *(void *)(v15[1] + 24);
    objc_super v4 = (void *)v17[3];
  }
  _Block_object_dispose(&v16, 8);
  if (v4)
  {
    [v3 addObserver:v2 selector:sel__restrictionsChanged_ name:*v4 object:0];

    [(PUWallpaperActivity *)v2 _setNeedsUpdateWallpaperModificationAllowed:1];
    return v2;
  }
  uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"NSString *getMCEffectiveSettingsChangedNotification(void)"];
  objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"PUWallpaperActivity.m", 35, @"%s", dlerror());

  __break(1u);
  return result;
}

@end