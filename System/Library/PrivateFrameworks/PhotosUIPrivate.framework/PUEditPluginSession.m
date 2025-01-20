@interface PUEditPluginSession
- (BOOL)isAvailable;
- (BOOL)markupIsAvailable;
- (PUEditPlugin)currentPlugin;
- (PUEditPluginSession)init;
- (PUEditPluginSessionDataSource)dataSource;
- (PUEditPluginSessionDelegate)delegate;
- (PUEditableAsset)asset;
- (UIViewController)hostViewController;
- (id)_linkPresentationImage;
- (id)_localizedEditorListTitle;
- (int64_t)adjustmentType;
- (unint64_t)pluginManagerMediaType;
- (void)_beginMarkupSessionWithAsset:(id)a3 fromViewController:(id)a4;
- (void)_beginSessionWithAsset:(id)a3 fromViewController:(id)a4 sourceElement:(id)a5 includeMarkupInList:(BOOL)a6;
- (void)_launchPlugin:(id)a3 afterDismissingViewController:(id)a4;
- (void)_unlockScreenIfNeededWithCompletionHandler:(id)a3;
- (void)beginMarkupSessionWithAsset:(id)a3 fromViewController:(id)a4;
- (void)beginSessionWithAsset:(id)a3 fromViewController:(id)a4 sourceElement:(id)a5 includeMarkupInList:(BOOL)a6;
- (void)dealloc;
- (void)editExtensionActivityViewController:(id)a3 didSelectActivity:(id)a4;
- (void)editPluginHostViewController:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5;
- (void)editPluginHostViewController:(id)a3 didFinishWithCompletionType:(unint64_t)a4;
- (void)editPluginHostViewController:(id)a3 loadItemProviderWithHandler:(id)a4;
- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4;
- (void)presentAlertController:(id)a3;
- (void)setAdjustmentType:(int64_t)a3;
- (void)setAsset:(id)a3;
- (void)setCurrentPlugin:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHostViewController:(id)a3;
- (void)setIsAvailable:(BOOL)a3;
- (void)shouldLaunchPlugin:(id)a3 completion:(id)a4;
- (void)updateAvailability;
- (void)updatePluginManager;
@end

@implementation PUEditPluginSession

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_hostViewController);
  objc_storeStrong((id *)&self->_currentPlugin, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_pluginNavigationController, 0);
  objc_storeStrong((id *)&self->_pluginManager, 0);
}

- (void)setHostViewController:(id)a3
{
}

- (UIViewController)hostViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setCurrentPlugin:(id)a3
{
}

- (PUEditPlugin)currentPlugin
{
  return self->_currentPlugin;
}

- (void)setAdjustmentType:(int64_t)a3
{
  self->_adjustmentType = a3;
}

- (int64_t)adjustmentType
{
  return self->_adjustmentType;
}

- (void)setAsset:(id)a3
{
}

- (PUEditableAsset)asset
{
  return self->_asset;
}

- (BOOL)isAvailable
{
  return self->_isAvailable;
}

- (void)setDelegate:(id)a3
{
}

- (PUEditPluginSessionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PUEditPluginSessionDelegate *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (PUEditPluginSessionDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (PUEditPluginSessionDataSource *)WeakRetained;
}

- (void)editPluginHostViewController:(id)a3 didFinishWithCompletionType:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(PUEditPluginSession *)self hostViewController];
  if (!v7)
  {
    v7 = [v6 presentingViewController];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __80__PUEditPluginSession_editPluginHostViewController_didFinishWithCompletionType___block_invoke;
  v8[3] = &unk_1E5F2E0A8;
  v8[4] = self;
  v8[5] = a4;
  [v7 dismissViewControllerAnimated:1 completion:v8];
}

void __80__PUEditPluginSession_editPluginHostViewController_didFinishWithCompletionType___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) currentPlugin];
  uint64_t v3 = [v2 extension];
  id v6 = [(id)v3 identifier];

  [*(id *)(a1 + 32) setCurrentPlugin:0];
  v4 = [*(id *)(a1 + 32) delegate];
  LOBYTE(v3) = objc_opt_respondsToSelector();

  if (v3)
  {
    v5 = [*(id *)(a1 + 32) delegate];
    [v5 editPluginSession:*(void *)(a1 + 32) didEndWithCompletionType:*(void *)(a1 + 40) forPluginIdentifier:v6];
  }
}

- (void)editPluginHostViewController:(id)a3 commitContentEditingOutput:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [(PUEditPluginSession *)self dataSource];
  [v9 editPluginSession:self commitContentEditingOutput:v8 withCompletionHandler:v7];
}

- (void)editPluginHostViewController:(id)a3 loadItemProviderWithHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUEditPluginSession *)self currentPlugin];

  if (!v9)
  {
    v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:483 description:@"no current plugin"];
  }
  v10 = [(PUEditPluginSession *)self dataSource];

  if (!v10)
  {
    v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:484 description:@"data source missing"];
  }
  v11 = [(PUEditPluginSession *)self dataSource];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke;
  v16[3] = &unk_1E5F250A8;
  id v17 = v7;
  v18 = self;
  id v19 = v8;
  id v12 = v8;
  id v13 = v7;
  [v11 editPluginSession:self loadAdjustmentDataWithHandler:v16];
}

void __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = dispatch_group_create();
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  if (![v3 isOpaque])
  {
    if (v3)
    {
      dispatch_group_enter(v4);
      v5 = *(void **)(a1 + 32);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_2;
      v14[3] = &unk_1E5F2C7A0;
      v16 = &v17;
      v15 = v4;
      [v5 queryHandlingCapabilityForAdjustmentData:v3 withResponseHandler:v14 timeout:10.0];

      goto LABEL_6;
    }
    id v6 = [*(id *)(a1 + 40) asset];
    int v7 = [v6 isAdjusted];

    if (!v7) {
      goto LABEL_6;
    }
  }
  v18[3] = 2;
LABEL_6:
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_3;
  v10[3] = &unk_1E5F25080;
  id v13 = &v17;
  id v8 = *(void **)(a1 + 48);
  v10[4] = *(void *)(a1 + 40);
  id v11 = v3;
  id v12 = v8;
  id v9 = v3;
  dispatch_group_notify(v4, MEMORY[0x1E4F14428], v10);

  _Block_object_dispose(&v17, 8);
}

void __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2 = 1;
  if (!a2) {
    uint64_t v2 = 2;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v2;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __80__PUEditPluginSession_editPluginHostViewController_loadItemProviderWithHandler___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setAdjustmentType:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)];
  uint64_t v2 = *(void **)(a1 + 32);
  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) == 1) {
    uint64_t v3 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = *(void *)(a1 + 48);
  return [v2 loadItemProviderWithSupportedAdjustmentData:v3 loadHandler:v4];
}

- (void)_launchPlugin:(id)a3 afterDismissingViewController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(PUEditPluginSession *)self currentPlugin];

  if (v9)
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:422 description:@"previous plugin selected"];
  }
  [(PUEditPluginSession *)self setCurrentPlugin:v7];
  v10 = [(PUEditPluginSession *)self delegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    id v12 = [(PUEditPluginSession *)self delegate];
    [v12 editPluginSessionWillBegin:self];
  }
  id v13 = dispatch_group_create();
  v14 = [[PUEditPluginHostViewController alloc] initWithPlugin:v7];
  [(PUEditPluginHostViewController *)v14 setDataSource:self];
  [(PUEditPluginHostViewController *)v14 setDelegate:self];
  dispatch_group_enter(v13);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke;
  v34[3] = &unk_1E5F25058;
  v15 = v13;
  v35 = v15;
  [(PUEditPluginHostViewController *)v14 loadRemoteViewControllerWithCompletionHandler:v34];
  if (v8)
  {
    dispatch_group_enter(v15);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_2;
    aBlock[3] = &unk_1E5F2ECC8;
    id v16 = v8;
    id v32 = v16;
    v33 = v15;
    uint64_t v17 = (void (**)(void))_Block_copy(aBlock);
    v18 = [v16 presentedViewController];

    if (v18)
    {
      uint64_t v19 = [v16 presentedViewController];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_4;
      v29[3] = &unk_1E5F2EBA0;
      v30 = v17;
      [v19 dismissViewControllerAnimated:0 completion:v29];
    }
    else
    {
      v17[2](v17);
    }
  }
  uint64_t v20 = [(PUEditPluginSession *)self hostViewController];
  v21 = [v20 view];

  v22 = [[PUProgressView alloc] initWithStyle:0];
  [(PUProgressView *)v22 showInView:v21 animated:1 afterDelay:2.0];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_5;
  block[3] = &unk_1E5F2E908;
  block[4] = self;
  v27 = v14;
  v28 = v22;
  v23 = v22;
  v24 = v14;
  dispatch_group_notify(v15, MEMORY[0x1E4F14428], block);
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke(uint64_t a1)
{
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_3;
  v2[3] = &unk_1E5F2ED10;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 dismissViewControllerAnimated:1 completion:v2];
}

uint64_t __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_5(uint64_t a1)
{
  uint64_t v2 = [objc_alloc(MEMORY[0x1E4FB19E8]) initWithRootViewController:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 16);
  *(void *)(v3 + 16) = v2;

  v5 = [*(id *)(*(void *)(a1 + 32) + 16) navigationBar];
  uint64_t v6 = [v5 standardAppearance];
  id v7 = [*(id *)(*(void *)(a1 + 32) + 16) navigationBar];
  [v7 setScrollEdgeAppearance:v6];

  id v8 = +[PUInterfaceManager currentTheme];
  [v8 configureEditPluginNavigationController:*(void *)(*(void *)(a1 + 32) + 16)];

  [*(id *)(*(void *)(a1 + 32) + 16) setModalPresentationStyle:5];
  [*(id *)(*(void *)(a1 + 32) + 16) setModalTransitionStyle:2];
  id v9 = +[PUPhotoEditProtoSettings sharedInstance];
  LOBYTE(v6) = [v9 lightModeEditor];

  if ((v6 & 1) == 0) {
    [*(id *)(*(void *)(a1 + 32) + 16) setOverrideUserInterfaceStyle:2];
  }
  v10 = [*(id *)(a1 + 32) hostViewController];
  uint64_t v11 = *(void *)(*(void *)(a1 + 32) + 16);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_6;
  v12[3] = &unk_1E5F2ED10;
  id v13 = *(id *)(a1 + 48);
  [v10 presentViewController:v11 animated:1 completion:v12];
}

uint64_t __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideAnimated:0];
}

void __67__PUEditPluginSession__launchPlugin_afterDismissingViewController___block_invoke_3(uint64_t a1)
{
}

- (void)presentAlertController:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(PUEditPluginSession *)self hostViewController];
  v5 = [v4 presentedViewController];

  if (v5)
  {
    do
    {
      uint64_t v6 = [v4 presentedViewController];

      id v7 = [v6 presentedViewController];

      uint64_t v4 = v6;
    }
    while (v7);
  }
  else
  {
    uint64_t v6 = v4;
  }
  [v6 presentViewController:v8 animated:1 completion:0];
}

- (void)shouldLaunchPlugin:(id)a3 completion:(id)a4
{
}

- (void)editExtensionActivityViewController:(id)a3 didSelectActivity:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v8 plugin];
    if (!v9)
    {
      id v13 = [MEMORY[0x1E4F28B00] currentHandler];
      [v13 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:390 description:@"no plugin selected"];
    }
    v10 = [(PUEditPluginSession *)self currentPlugin];

    if (v10)
    {
      uint64_t v11 = PXAssertGetLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "previous plugin selected", (uint8_t *)location, 2u);
      }
    }
    id v12 = [(PUEditPluginSession *)self currentPlugin];

    if (!v12)
    {
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __77__PUEditPluginSession_editExtensionActivityViewController_didSelectActivity___block_invoke;
      v14[3] = &unk_1E5F25030;
      objc_copyWeak(&v17, location);
      id v15 = v9;
      id v16 = v7;
      [(PUEditPluginSession *)self shouldLaunchPlugin:v15 completion:v14];

      objc_destroyWeak(&v17);
      objc_destroyWeak(location);
    }
  }
}

void __77__PUEditPluginSession_editExtensionActivityViewController_didSelectActivity___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained _launchPlugin:*(void *)(a1 + 32) afterDismissingViewController:*(void *)(a1 + 40)];
  }
}

- (id)_localizedEditorListTitle
{
  unint64_t v2 = [(PUEditPluginSession *)self pluginManagerMediaType];
  if (v2 > 3)
  {
    uint64_t v3 = 0;
  }
  else
  {
    uint64_t v3 = PULocalizedString(off_1E5F250E0[v2]);
  }
  return v3;
}

- (void)_beginSessionWithAsset:(id)a3 fromViewController:(id)a4 sourceElement:(id)a5 includeMarkupInList:(BOOL)a6
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v11 = a5;
  id v12 = a4;
  [(PUEditPluginSession *)self setAsset:a3];
  [(PUEditPluginSession *)self setHostViewController:v12];

  pluginManager = self->_pluginManager;
  if (a6) {
    [(PUEditPluginManager *)pluginManager pluginActivities];
  }
  else {
  v14 = [(PUEditPluginManager *)pluginManager pluginActivitiesExceptMarkup];
  }
  id v15 = [(PUEditPluginSession *)self dataSource];
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = [(PUEditPluginSession *)self dataSource];
    v18 = [v17 pluginActivitiesForEditPluginSession:self];

    uint64_t v19 = [v14 arrayByAddingObjectsFromArray:v18];

    v14 = (void *)v19;
  }
  id v20 = objc_alloc(MEMORY[0x1E4F1CB18]);
  v21 = [(id)CPSharedResourcesDirectory() stringByAppendingPathComponent:@"/Library/Preferences/com.apple.mobileslideshow"];
  v22 = (void *)[v20 initWithSuiteName:v21];

  v23 = [[PUEditExtensionActivityViewController alloc] initWithUserDefaults:v22 userDefaultsIdentifier:@"com.apple.photos.photo-editors" applicationActivities:v14];
  [(PUEditExtensionActivityViewController *)v23 setConfigureForPhotosEdit:1];
  [(PUEditExtensionActivityViewController *)v23 setEditExtensionActivityViewControllerDelegate:self];
  v46[0] = *MEMORY[0x1E4F9F348];
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  [(PUEditExtensionActivityViewController *)v23 setExcludedActivityTypes:v24];

  id v25 = objc_alloc_init(MEMORY[0x1E4F30A78]);
  id v26 = objc_alloc_init(MEMORY[0x1E4F30A28]);
  v27 = [(PUEditPluginSession *)self _linkPresentationImage];
  [v26 setThumbnail:v27];

  v28 = +[PUPhotoEditProtoSettings sharedInstance];
  int v29 = [v28 editMenuEnabled];
  v30 = @"PLUGIN_LIST_ACTIONSHEET_TITLE_LEGACY";
  if (v29) {
    v30 = @"PLUGIN_LIST_ACTIONSHEET_TITLE";
  }
  v31 = v30;

  id v32 = PULocalizedString(v31);

  [v26 setName:v32];
  [v25 setSpecialization:v26];
  [(PUEditExtensionActivityViewController *)v23 setPhotosHeaderMetadata:v25];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v45 = [MEMORY[0x1E4F28B00] currentHandler];
    [v45 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:350 description:@"source element is not a UIView"];
  }
  id v33 = v11;
  v34 = [(PUEditExtensionActivityViewController *)v23 popoverPresentationController];
  [v34 setSourceView:v33];

  [v33 bounds];
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  double v42 = v41;

  v43 = [(PUEditExtensionActivityViewController *)v23 popoverPresentationController];
  objc_msgSend(v43, "setSourceRect:", v36, v38, v40, v42);

  v44 = [(PUEditPluginSession *)self hostViewController];
  [v44 presentViewController:v23 animated:1 completion:0];
}

- (void)beginSessionWithAsset:(id)a3 fromViewController:(id)a4 sourceElement:(id)a5 includeMarkupInList:(BOOL)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __98__PUEditPluginSession_beginSessionWithAsset_fromViewController_sourceElement_includeMarkupInList___block_invoke;
  v16[3] = &unk_1E5F25008;
  void v16[4] = self;
  id v17 = v10;
  id v18 = v11;
  id v19 = v12;
  BOOL v20 = a6;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  [(PUEditPluginSession *)self _unlockScreenIfNeededWithCompletionHandler:v16];
}

uint64_t __98__PUEditPluginSession_beginSessionWithAsset_fromViewController_sourceElement_includeMarkupInList___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginSessionWithAsset:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48) sourceElement:*(void *)(a1 + 56) includeMarkupInList:*(unsigned __int8 *)(a1 + 64)];
}

- (id)_linkPresentationImage
{
  uint64_t v3 = [(PUEditPluginSession *)self asset];

  if (v3)
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F28D78]);
    uint64_t v5 = objc_opt_class();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __45__PUEditPluginSession__linkPresentationImage__block_invoke;
    v8[3] = &unk_1E5F253E8;
    v8[4] = self;
    [v4 registerObjectOfClass:v5 visibility:0 loadHandler:v8];
    uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F30A38]) initWithItemProvider:v4 properties:0 placeholderImage:0];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

uint64_t __45__PUEditPluginSession__linkPresentationImage__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) dataSource];
  uint64_t v5 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __45__PUEditPluginSession__linkPresentationImage__block_invoke_2;
  v8[3] = &unk_1E5F24FE0;
  id v9 = v3;
  id v6 = v3;
  objc_msgSend(v4, "editPluginSession:loadThumbnailImageWithSize:loadHandler:", v5, v8, 40.0, 40.0);

  return 0;
}

void __45__PUEditPluginSession__linkPresentationImage__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v5 imageOrientation];
  [v5 size];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  _Q0 = 0uLL;
  CGFloat v13 = -1.0;
  CGFloat v14 = -1.0;
  switch(v7)
  {
    case 1:
      break;
    case 2:
      _Q0 = xmmword_1AEFF7B70;
      CGFloat v14 = 0.0;
      CGFloat v13 = 0.0;
      goto LABEL_9;
    case 3:
      _Q0 = xmmword_1AEFF7B60;
      CGFloat v14 = 0.0;
      CGFloat v13 = 0.0;
      CGFloat v9 = 0.0;
      break;
    case 4:
      CGFloat v11 = 0.0;
      CGFloat v13 = 1.0;
      break;
    case 5:
      CGFloat v9 = 0.0;
      CGFloat v14 = 1.0;
      break;
    case 6:
      __asm { FMOV            V0.2D, #-1.0; jumptable 00000001AEC97DA8 case 6 }
      CGFloat v14 = 0.0;
      CGFloat v13 = 0.0;
      break;
    case 7:
      __asm { FMOV            V0.2D, #1.0; jumptable 00000001AEC97DA8 case 7 }
      CGFloat v14 = 0.0;
      CGFloat v13 = 0.0;
      CGFloat v9 = 0.0;
LABEL_9:
      CGFloat v11 = 0.0;
      break;
    default:
      CGFloat v14 = *MEMORY[0x1E4F1DAB8];
      _Q0 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 8);
      CGFloat v13 = *(double *)(MEMORY[0x1E4F1DAB8] + 24);
      CGFloat v9 = *(double *)(MEMORY[0x1E4F1DAB8] + 32);
      CGFloat v11 = *(double *)(MEMORY[0x1E4F1DAB8] + 40);
      break;
  }
  v32.a = v14;
  long long v31 = _Q0;
  *(_OWORD *)&v32.b = _Q0;
  v32.d = v13;
  v32.tx = v9;
  v32.ty = v11;
  if (!CGAffineTransformIsIdentity(&v32))
  {
    id v19 = [v5 CIImage];
    if (!v19)
    {
      id v19 = objc_msgSend(MEMORY[0x1E4F1E050], "imageWithCGImage:", objc_msgSend(v5, "CGImage"));
    }
    v32.a = v14;
    *(_OWORD *)&v32.b = v31;
    v32.d = v13;
    v32.tx = v9;
    v32.ty = v11;
    BOOL v20 = objc_msgSend(v19, "imageByApplyingTransform:", &v32, v31);

    uint64_t v21 = [MEMORY[0x1E4FB1818] imageWithCIImage:v20];

    id v5 = (id)v21;
  }
  objc_msgSend(v5, "size", v31);
  double v23 = v22;
  [v5 size];
  double v25 = v24;
  if ((PXFloatEqualToFloatWithTolerance() & 1) == 0)
  {
    if (v23 >= v25) {
      double v26 = v25;
    }
    else {
      double v26 = v23;
    }
    id v5 = v5;
    v27 = (CGImage *)[v5 CGImage];
    v33.origin.x = v23 * 0.5 - v26 * 0.5;
    v33.origin.y = v25 * 0.5 - v26 * 0.5;
    v33.size.width = v26;
    v33.size.height = v26;
    CGImageRef v28 = CGImageCreateWithImageInRect(v27, v33);
    if (v28)
    {
      int v29 = v28;
      uint64_t v30 = objc_msgSend(MEMORY[0x1E4FB1818], "imageWithCGImage:scale:orientation:", v28, objc_msgSend(v5, "imageOrientation"), 1.0);

      CGImageRelease(v29);
      id v5 = (id)v30;
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_beginMarkupSessionWithAsset:(id)a3 fromViewController:(id)a4
{
  location[3] = *(id *)MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(PUEditPluginSession *)self setAsset:v6];
  [(PUEditPluginSession *)self setHostViewController:v7];
  double v8 = (void *)MEMORY[0x1E4F28C70];
  CGFloat v9 = +[PUEditPlugin pu_defaultMarkupExtensionIdentifier];
  id v20 = 0;
  double v10 = [v8 extensionWithIdentifier:v9 error:&v20];
  id v11 = v20;

  if (v10)
  {
    id v12 = [[PUEditPlugin alloc] initWithExtension:v10 pluginCategoryType:0];
    CGFloat v13 = [(PUEditPluginSession *)self currentPlugin];
    BOOL v14 = v13 == 0;

    if (!v14)
    {
      id v15 = PXAssertGetLog();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        LOWORD(location[0]) = 0;
        _os_log_error_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "previous plugin selected", (uint8_t *)location, 2u);
      }
    }
    objc_initWeak(location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __71__PUEditPluginSession__beginMarkupSessionWithAsset_fromViewController___block_invoke;
    v17[3] = &unk_1E5F27D48;
    objc_copyWeak(&v19, location);
    char v16 = v12;
    id v18 = v16;
    [(PUEditPluginSession *)self shouldLaunchPlugin:v16 completion:v17];

    objc_destroyWeak(&v19);
    objc_destroyWeak(location);
  }
  else
  {
    char v16 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v11;
      _os_log_impl(&dword_1AE9F8000, v16, OS_LOG_TYPE_DEFAULT, "Error fetching markup extension:%@", (uint8_t *)location, 0xCu);
    }
  }
}

void __71__PUEditPluginSession__beginMarkupSessionWithAsset_fromViewController___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained _launchPlugin:*(void *)(a1 + 32) afterDismissingViewController:0];
  }
}

- (void)beginMarkupSessionWithAsset:(id)a3 fromViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = [(PUEditPluginSession *)self currentPlugin];

  if (!v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __70__PUEditPluginSession_beginMarkupSessionWithAsset_fromViewController___block_invoke;
    v9[3] = &unk_1E5F2E908;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(PUEditPluginSession *)self _unlockScreenIfNeededWithCompletionHandler:v9];
  }
}

uint64_t __70__PUEditPluginSession_beginMarkupSessionWithAsset_fromViewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginMarkupSessionWithAsset:*(void *)(a1 + 40) fromViewController:*(void *)(a1 + 48)];
}

- (void)_unlockScreenIfNeededWithCompletionHandler:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = (void (**)(void))a3;
  __int16 v25 = 0;
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  id v4 = (uint64_t (*)(void))getSBSSpringBoardServerPortSymbolLoc_ptr;
  int v29 = getSBSSpringBoardServerPortSymbolLoc_ptr;
  if (!getSBSSpringBoardServerPortSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    CGAffineTransform v32 = __getSBSSpringBoardServerPortSymbolLoc_block_invoke;
    CGRect v33 = &unk_1E5F2E228;
    v34 = &v26;
    id v5 = SpringBoardServicesLibrary();
    id v6 = dlsym(v5, "SBSSpringBoardServerPort");
    *(void *)(v34[1] + 24) = v6;
    getSBSSpringBoardServerPortSymbolLoc_ptr = *(_UNKNOWN **)(v34[1] + 24);
    id v4 = (uint64_t (*)(void))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v4)
  {
    id v17 = [MEMORY[0x1E4F28B00] currentHandler];
    id v18 = [NSString stringWithUTF8String:"mach_port_t PUSBSSpringBoardServerPort(void)"];
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, @"PUEditPluginSession.m", 48, @"%s", dlerror());

    goto LABEL_24;
  }
  uint64_t v7 = v4();
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2020000000;
  double v8 = (unsigned int (*)(uint64_t, char *, __int16 *))getSBGetScreenLockStatusSymbolLoc_ptr;
  int v29 = getSBGetScreenLockStatusSymbolLoc_ptr;
  if (!getSBGetScreenLockStatusSymbolLoc_ptr)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    uint64_t v31 = 3221225472;
    CGAffineTransform v32 = __getSBGetScreenLockStatusSymbolLoc_block_invoke;
    CGRect v33 = &unk_1E5F2E228;
    v34 = &v26;
    CGFloat v9 = SpringBoardServicesLibrary();
    id v10 = dlsym(v9, "SBGetScreenLockStatus");
    *(void *)(v34[1] + 24) = v10;
    getSBGetScreenLockStatusSymbolLoc_ptr = *(_UNKNOWN **)(v34[1] + 24);
    double v8 = (unsigned int (*)(uint64_t, char *, __int16 *))v27[3];
  }
  _Block_object_dispose(&v26, 8);
  if (!v8)
  {
    id v19 = [MEMORY[0x1E4F28B00] currentHandler];
    id v20 = objc_msgSend(NSString, "stringWithUTF8String:", "kern_return_t PUSBGetScreenLockStatus(mach_port_t, uint8_t *, uint8_t *)");
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, @"PUEditPluginSession.m", 47, @"%s", dlerror());

    goto LABEL_24;
  }
  if (v8(v7, (char *)&v25 + 1, &v25))
  {
    id v11 = PLPhotoEditGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE9F8000, v11, OS_LOG_TYPE_ERROR, "Unable to determine current lock screen state, functioning as if screen is locked.", buf, 2u);
    }

    __int16 v25 = 257;
  }
  id v12 = PLPhotoEditGetLog();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = HIBYTE(v25);
    LOWORD(v31) = 1024;
    *(_DWORD *)((char *)&v31 + 2) = v25;
    _os_log_impl(&dword_1AE9F8000, v12, OS_LOG_TYPE_DEFAULT, "Got Springboard lock status: %d %d", buf, 0xEu);
  }

  if ((_BYTE)v25)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __66__PUEditPluginSession__unlockScreenIfNeededWithCompletionHandler___block_invoke;
    v23[3] = &unk_1E5F24FB8;
    double v24 = v3;
    CGFloat v13 = v23;
    uint64_t v26 = 0;
    v27 = &v26;
    uint64_t v28 = 0x2020000000;
    BOOL v14 = (void (*)(void *))getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    int v29 = getSBSRequestPasscodeUnlockUISymbolLoc_ptr;
    if (!getSBSRequestPasscodeUnlockUISymbolLoc_ptr)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      uint64_t v31 = 3221225472;
      CGAffineTransform v32 = __getSBSRequestPasscodeUnlockUISymbolLoc_block_invoke;
      CGRect v33 = &unk_1E5F2E228;
      v34 = &v26;
      id v15 = SpringBoardServicesLibrary();
      char v16 = dlsym(v15, "SBSRequestPasscodeUnlockUI");
      *(void *)(v34[1] + 24) = v16;
      getSBSRequestPasscodeUnlockUISymbolLoc_ptr = *(_UNKNOWN **)(v34[1] + 24);
      BOOL v14 = (void (*)(void *))v27[3];
    }
    _Block_object_dispose(&v26, 8);
    if (v14)
    {
      v14(v13);

      goto LABEL_20;
    }
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    double v22 = [NSString stringWithUTF8String:"void PUSBSRequestPasscodeUnlockUI(void (^__strong)(Boolean))"];
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, @"PUEditPluginSession.m", 46, @"%s", dlerror());

LABEL_24:
    __break(1u);
  }
  if (v3) {
    v3[2](v3);
  }
LABEL_20:
}

uint64_t __66__PUEditPluginSession__unlockScreenIfNeededWithCompletionHandler___block_invoke(uint64_t result, int a2)
{
  if (a2)
  {
    result = *(void *)(result + 32);
    if (result) {
      return (*(uint64_t (**)(void))(result + 16))();
    }
  }
  return result;
}

- (BOOL)markupIsAvailable
{
  return [(PUEditPluginManager *)self->_pluginManager hasMarkupPlugin];
}

- (void)setIsAvailable:(BOOL)a3
{
  if (self->_isAvailable != a3)
  {
    self->_isAvailable = a3;
    id v4 = [(PUEditPluginSession *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(PUEditPluginSession *)self delegate];
      [v6 editPluginSessionAvailabilityDidChange:self];
    }
  }
}

- (void)updateAvailability
{
  BOOL v3 = [(PUEditPluginManager *)self->_pluginManager hasNonMarkupPlugins];
  id v4 = [(PUEditPluginSession *)self dataSource];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(PUEditPluginSession *)self dataSource];
    id v8 = [v6 pluginActivitiesForEditPluginSession:self];
  }
  else
  {
    id v8 = 0;
  }
  if ([v8 count]) {
    uint64_t v7 = 1;
  }
  else {
    uint64_t v7 = v3;
  }
  [(PUEditPluginSession *)self setIsAvailable:v7];
}

- (void)loadItemProviderWithSupportedAdjustmentData:(id)a3 loadHandler:(id)a4
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:177 description:@"subclass to implement"];
}

- (unint64_t)pluginManagerMediaType
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PUEditPluginSession.m" lineNumber:172 description:@"subclass to implement"];

  return 0;
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PUEditPluginSession;
  [(PUEditPluginSession *)&v4 dealloc];
}

- (void)updatePluginManager
{
  BOOL v3 = +[PUEditPluginManager sharedManagerForMediaType:[(PUEditPluginSession *)self pluginManagerMediaType]];
  pluginManager = self->_pluginManager;
  self->_pluginManager = v3;

  char v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 addObserver:self selector:sel__pluginManagerPluginsDidChange_ name:@"PUEditPluginManagerPluginsDidChangeNotification" object:self->_pluginManager];

  [(PUEditPluginManager *)self->_pluginManager rediscoverAvailablePlugins];
  [(PUEditPluginSession *)self updateAvailability];
}

- (PUEditPluginSession)init
{
  v5.receiver = self;
  v5.super_class = (Class)PUEditPluginSession;
  unint64_t v2 = [(PUEditPluginSession *)&v5 init];
  BOOL v3 = v2;
  if (v2) {
    [(PUEditPluginSession *)v2 updatePluginManager];
  }
  return v3;
}

@end