@interface PUPXOneUpPresentationImplementation
+ (id)implementationForOneUpPresentation:(id)a3;
- (BOOL)canStartAnimated:(BOOL)a3;
- (BOOL)canStop;
- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3;
- (BOOL)oneUpPresentationHelperPreventRevealInMomentAction:(id)a3;
- (BOOL)oneUpPresentationHelperShouldAutoPlay:(id)a3;
- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3;
- (BOOL)oneUpPresentationHelperWantsShowInLibraryButton:(id)a3;
- (BOOL)startWithConfigurationHandler:(id)a3;
- (PUOneUpPresentationHelper)_helper;
- (PUPXOneUpPresentationImplementation)init;
- (PXAssetReference)lastViewedAssetReference;
- (PXOneUpPresentation)_oneUpPresentation;
- (id)_initWithOneUpPresentation:(id)a3;
- (id)oneUpPresentationHelper:(id)a3 currentImageForAssetReference:(id)a4;
- (id)oneUpPresentationHelper:(id)a3 presentingScrollViewForAssetReference:(id)a4;
- (id)oneUpPresentationHelper:(id)a3 regionOfInterestForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5;
- (id)oneUpPresentationHelperOriginalViewController:(id)a3;
- (id)oneUpPresentationHelperSearchQueryMatchInfo:(id)a3;
- (id)oneUpPresentationHelperViewController:(id)a3;
- (id)oneUpPresentationHelperViewHostingTilingView:(id)a3;
- (id)previewViewControllerAllowingActions:(BOOL)a3;
- (id)regionOfInterestForAssetReference:(id)a3;
- (id)stateChangeHandler;
- (int64_t)oneUpPresentationOrigin:(id)a3;
- (unint64_t)oneUpPresentationHelperAdditionalOptions:(id)a3;
- (void)commitPreviewViewController:(id)a3;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)invalidatePresentingGeometry;
- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 scrollAssetReferenceToVisible:(id)a4;
- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4;
- (void)oneUpPresentationHelperStateDidChange:(id)a3;
- (void)presentingViewControllerViewDidAppear:(BOOL)a3;
- (void)presentingViewControllerViewDidDisappear:(BOOL)a3;
- (void)presentingViewControllerViewIsAppearing:(BOOL)a3;
- (void)presentingViewControllerViewWillAppear:(BOOL)a3;
- (void)presentingViewControllerViewWillDisappear:(BOOL)a3;
- (void)registerStateChangeHandler:(id)a3;
- (void)setStateChangeHandler:(id)a3;
- (void)stopAnimated:(BOOL)a3;
@end

@implementation PUPXOneUpPresentationImplementation

- (void)presentingViewControllerViewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v4 presentingViewControllerViewIsAppearing:v3];
}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v4 presentingViewControllerViewWillAppear:v3];
}

- (void)registerStateChangeHandler:(id)a3
{
  id v4 = a3;
  v5 = [(PUPXOneUpPresentationImplementation *)self stateChangeHandler];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __66__PUPXOneUpPresentationImplementation_registerStateChangeHandler___block_invoke;
  v8[3] = &unk_1E5F285F0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(PUPXOneUpPresentationImplementation *)self setStateChangeHandler:v8];
}

- (id)stateChangeHandler
{
  return self->_stateChangeHandler;
}

- (void)setStateChangeHandler:(id)a3
{
}

- (id)oneUpPresentationHelperViewController:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  id v4 = [v3 presentingViewController];

  return v4;
}

- (PXOneUpPresentation)_oneUpPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__oneUpPresentation);
  return (PXOneUpPresentation *)WeakRetained;
}

+ (id)implementationForOneUpPresentation:(id)a3
{
  id v3 = a3;
  objc_getAssociatedObject(v3, (const void *)PUImplementationAssociationKey);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    id v4 = [[PUPXOneUpPresentationImplementation alloc] _initWithOneUpPresentation:v3];
    objc_setAssociatedObject(v3, (const void *)PUImplementationAssociationKey, v4, (void *)1);
  }

  return v4;
}

- (void)invalidatePresentingGeometry
{
  id v2 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v2 presentingViewControllerScrollViewDidScroll:0];
}

- (PUOneUpPresentationHelper)_helper
{
  return self->__helper;
}

- (void)presentingViewControllerViewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v4 presentingViewControllerViewDidAppear:v3];
}

- (id)_initWithOneUpPresentation:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PUPXOneUpPresentationImplementation;
  v5 = [(PUPXOneUpPresentationImplementation *)&v17 init];
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    objc_storeWeak((id *)&v5->__oneUpPresentation, v4);
    objc_initWeak(&location, v4);
    id v7 = [PUOneUpPresentationHelper alloc];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __66__PUPXOneUpPresentationImplementation__initWithOneUpPresentation___block_invoke;
    v14 = &unk_1E5F285C8;
    objc_copyWeak(&v15, &location);
    uint64_t v8 = [(PUOneUpPresentationHelper *)v7 initWithBrowsingSessionCreationBlock:&v11];
    id v9 = p_isa[1];
    p_isa[1] = (id)v8;

    objc_msgSend(p_isa[1], "setDelegate:", p_isa, v11, v12, v13, v14);
    [p_isa[1] setAssetDisplayDelegate:p_isa];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return p_isa;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangeHandler, 0);
  objc_destroyWeak((id *)&self->__oneUpPresentation);
  objc_storeStrong((id *)&self->__helper, 0);
}

- (void)oneUpPresentationHelper:(id)a3 shouldHideAssetReferences:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v11), "pxAssetReference", (void)v14);
        [v6 addObject:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v13 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  [v13 setHiddenAssetReferences:v6];
}

- (void)oneUpPresentationHelper:(id)a3 scrollAssetReferenceToVisible:(id)a4
{
  objc_msgSend(a4, "pxAssetReference", a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  [v5 scrollAssetReferenceToVisible:v6];
}

- (id)oneUpPresentationHelper:(id)a3 currentImageForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  id v7 = [v5 pxAssetReference];

  uint64_t v8 = [v6 currentImageForAssetReference:v7];

  return v8;
}

- (id)oneUpPresentationHelper:(id)a3 regionOfInterestForAssetReference:(id)a4 cropInsets:(UIEdgeInsets *)a5
{
  id v6 = objc_msgSend(a4, "pxAssetReference", a3);
  id v7 = [(PUPXOneUpPresentationImplementation *)self regionOfInterestForAssetReference:v6];

  return v7;
}

- (void)oneUpPresentationHelper:(id)a3 didDismissOneUpViewController:(id)a4
{
  id v4 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  [v4 cleanUp];
}

- (id)oneUpPresentationHelperSearchQueryMatchInfo:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  id v4 = [v3 searchQueryMatchInfo];

  return v4;
}

- (BOOL)oneUpPresentationHelperShouldLeaveContentOnSecondScreen:(id)a3
{
  return 1;
}

- (id)oneUpPresentationHelper:(id)a3 presentingScrollViewForAssetReference:(id)a4
{
  id v5 = a4;
  id v6 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  id v7 = [v5 pxAssetReference];

  uint64_t v8 = [v6 presentingScrollViewForAssetReference:v7];

  return v8;
}

- (id)oneUpPresentationHelperViewHostingTilingView:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  id v4 = [v3 originalPresentingViewController];
  id v5 = [v4 viewIfLoaded];

  return v5;
}

- (void)oneUpPresentationHelperStateDidChange:(id)a3
{
  id v7 = a3;
  id v4 = [(PUPXOneUpPresentationImplementation *)self stateChangeHandler];
  if (v4)
  {
    uint64_t v5 = [v7 state];
    if ((unint64_t)(v5 - 1) >= 7) {
      uint64_t v6 = 0;
    }
    else {
      uint64_t v6 = v5;
    }
    v4[2](v4, v6);
  }
}

- (unint64_t)oneUpPresentationHelperAdditionalOptions:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  uint64_t v4 = [v3 actionContext];

  if (v4 > 3)
  {
    unint64_t v8 = 65728;
    if (v4 != 0xFFFF) {
      unint64_t v8 = 0;
    }
    if (v4 == 4) {
      return 133312;
    }
    else {
      return v8;
    }
  }
  else if ((unint64_t)(v4 - 1) >= 2)
  {
    if (v4 == 3) {
      return 224;
    }
    else {
      return 0;
    }
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F90068] sharedInstance];
    int v6 = [v5 disableDetailView];

    if (v6) {
      return 192;
    }
    else {
      return 128;
    }
  }
}

- (BOOL)oneUpPresentationHelperWantsShowInLibraryButton:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  char v4 = [v3 wantsShowInLibraryButton];

  return v4;
}

- (BOOL)oneUpPresentationHelperPreventRevealInMomentAction:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  char v4 = [v3 preventShowInAllPhotosAction];

  return v4;
}

- (BOOL)oneUpPresentationHelperShouldAutoPlay:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  char v4 = [v3 shouldAutoPlay];

  return v4;
}

- (int64_t)oneUpPresentationOrigin:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  int64_t v4 = [v3 origin];

  return v4;
}

- (id)oneUpPresentationHelperOriginalViewController:(id)a3
{
  BOOL v3 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  int64_t v4 = [v3 originalPresentingViewController];

  return v4;
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  int v6 = [v5 regionOfInterestForAssetReference:v4];

  return v6;
}

- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PUPXOneUpPresentationImplementation *)self _helper];
  char v6 = [v5 handlePresentingPinchGestureRecognizer:v4];

  return v6;
}

- (void)stopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PUPXOneUpPresentationImplementation *)self canStop];
  id v6 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v6 dismissOneUpViewControllerForced:!v5 animated:v3];
}

- (BOOL)canStop
{
  id v2 = [(PUPXOneUpPresentationImplementation *)self _helper];
  char v3 = [v2 canDismissOneUpViewController];

  return v3;
}

- (void)commitPreviewViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v5 commitPreviewViewController:v4];
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v7 didDismissPreviewViewController:v6 committing:v4];
}

- (id)previewViewControllerAllowingActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
  id v6 = [v5 initialAssetReference];
  if (!v6) {
    goto LABEL_6;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = [v5 dataSourceManager];
  unint64_t v8 = [v7 dataSource];
  uint64_t v9 = v8;
  if (v8)
  {
    [v8 indexPathForAssetReference:v6];
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
  }

  if ((void)v18 != *MEMORY[0x1E4F91310])
  {
    long long v16 = v18;
    long long v17 = v19;
    uint64_t v10 = PXIndexPathFromSimpleIndexPath();
  }
  else
  {
LABEL_6:
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(PUPXOneUpPresentationImplementation *)self _helper];
  id v12 = [v11 previewViewControllerForItemAtIndexPath:v10 allowingActions:v3];
  v13 = [v5 actionManagerForPreviewing];
  long long v14 = [v11 topmostPresentedViewController];
  [v12 createMenuActionControllerForManagerIfNeeded:v13 withPresentingViewController:v14 regionOfInterestProvider:self];

  return v12;
}

- (BOOL)startWithConfigurationHandler:(id)a3
{
  BOOL v4 = (void (**)(id, void *))a3;
  id v5 = objc_opt_new();
  if (v4) {
    v4[2](v4, v5);
  }
  BOOL v6 = -[PUPXOneUpPresentationImplementation canStartAnimated:](self, "canStartAnimated:", [v5 isAnimated]);
  if (v6)
  {
    id v7 = [(PUPXOneUpPresentationImplementation *)self _oneUpPresentation];
    unint64_t v8 = [v7 initialAssetReference];
    v36 = v7;
    if (!v8) {
      goto LABEL_8;
    }
    uint64_t v9 = [v7 dataSourceManager];
    uint64_t v10 = [v9 dataSource];
    uint64_t v11 = v10;
    if (v10) {
      [v10 indexPathForAssetReference:v8];
    }

    if (!*MEMORY[0x1E4F91310])
    {
LABEL_8:
      id v12 = 0;
LABEL_15:
      v26 = [(PUPXOneUpPresentationImplementation *)self _helper];
      uint64_t v27 = [v5 isAnimated];
      uint64_t v28 = objc_msgSend(v5, "pu_interactiveMode");
      uint64_t v29 = objc_msgSend(v5, "pu_activity");
      v30 = [v5 activityCompletion];
      [v26 presentOneUpViewControllerFromAssetAtIndexPath:v12 animated:v27 interactiveMode:v28 activity:v29 editActivityCompletion:v30];

      goto LABEL_16;
    }
    id v12 = PXIndexPathFromSimpleIndexPath();
    v13 = [(PUPXOneUpPresentationImplementation *)self _helper];
    long long v14 = [v13 browsingSession];
    long long v15 = [v14 viewModel];
    long long v16 = [v15 assetsDataSource];

    uint64_t v17 = [v12 section];
    long long v18 = objc_msgSend(MEMORY[0x1E4F28D58], "pu_rootIndexPath");
    if (v17 >= [v16 numberOfSubItemsAtIndexPath:v18])
    {
    }
    else
    {
      uint64_t v33 = [v12 item];
      long long v19 = objc_msgSend(MEMORY[0x1E4F28D58], "indexPathWithIndex:", objc_msgSend(v12, "section"));
      uint64_t v20 = [v16 numberOfSubItemsAtIndexPath:v19];

      if (v33 < v20) {
        goto LABEL_14;
      }
    }
    v35 = v16;
    v34 = v8;
    v21 = [[PUPXAssetReference alloc] initWithPXAssetReference:v8 dataSourceIdentifier:0];
    v22 = [(PUPXOneUpPresentationImplementation *)self _helper];
    v23 = [v22 browsingSession];
    v24 = [v23 viewModel];
    v25 = [v24 assetsDataSource];
    uint64_t v32 = [v25 indexPathForAssetReference:v21];

    unint64_t v8 = v34;
    long long v16 = v35;
    id v12 = (void *)v32;
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:

  return v6;
}

- (PXAssetReference)lastViewedAssetReference
{
  id v2 = [(PUPXOneUpPresentationImplementation *)self _helper];
  BOOL v3 = [v2 lastViewedAssetReference];

  return (PXAssetReference *)v3;
}

- (BOOL)canStartAnimated:(BOOL)a3
{
  uint64_t v3 = a3;
  BOOL v4 = [(PUPXOneUpPresentationImplementation *)self _helper];
  LOBYTE(v3) = [v4 canPresentOneUpViewControllerAnimated:v3];

  return v3;
}

uint64_t __66__PUPXOneUpPresentationImplementation_registerStateChangeHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3) {
    (*(void (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
  }
  BOOL v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v4 presentingViewControllerViewDidDisappear:v3];
}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(PUPXOneUpPresentationImplementation *)self _helper];
  [v4 presentingViewControllerViewWillDisappear:v3];
}

PUBrowsingSession *__66__PUPXOneUpPresentationImplementation__initWithOneUpPresentation___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (!WeakRetained)
  {
    BOOL v6 = 0;
    goto LABEL_27;
  }
  id v3 = [WeakRetained dataSourceManager];
  objc_opt_class();
  id v4 = v3;
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 currentDataSourceManager];
  }
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    id v5 = [[PUPhotoKitDataSourceManager alloc] initWithAssetsDataSourceManager:v4];
LABEL_9:
    id v7 = v5;
    goto LABEL_11;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [[PUPXAssetsDataSourceManager alloc] initWithUnderlyingDataSourceManager:v4];
    goto LABEL_9;
  }
  unint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
  uint64_t v9 = [NSString stringWithUTF8String:"PUAssetsDataSourceManager *PUAssetsDataSourceManagerFromPXAssetsDataSourceManager(PXAssetsDataSourceManager *__strong)"];
  [v8 handleFailureInFunction:v9, @"PUPXOneUpPresentationImplementation.m", 57, @"unsupported data source manager %@", v4 file lineNumber description];

  id v7 = 0;
LABEL_11:

  id v10 = [v2 mediaProvider];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = objc_alloc_init(PUPhotoKitMediaProvider);
LABEL_15:
    id v12 = v11;
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [[PUPXMediaProvider alloc] initWithUnderlyingMediaProvider:v10];
    goto LABEL_15;
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  long long v14 = [NSString stringWithUTF8String:"PUMediaProvider *PUMediaProviderFromPXMediaProvider(PXMediaProvider *__strong)"];
  [v13 handleFailureInFunction:v14, @"PUPXOneUpPresentationImplementation.m", 70, @"unsupported media provider %@", v10 file lineNumber description];

  id v12 = 0;
LABEL_17:

  id v15 = v2;
  long long v16 = [v15 actionManager];
  if (v16 && [v15 actionContext] != 6)
  {
    id v18 = v16;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v17 = [[PUPXAssetActionManager alloc] initWithUnderlyingActionManager:v18];
    }
    else {
      uint64_t v17 = 0;
    }
  }
  else if ([v15 actionContext] == 6)
  {
    uint64_t v17 = objc_alloc_init(PUPickerActionManager);
  }
  else
  {
    uint64_t v17 = 0;
  }

  long long v19 = [v15 photosDetailsContext];
  uint64_t v20 = [v15 privacyController];
  v21 = [v15 importStatusManager];
  BOOL v6 = [[PUBrowsingSession alloc] initWithDataSourceManager:v7 actionManager:v17 mediaProvider:v12 photosDetailsContext:v19 lowMemoryMode:0 importStatusManager:v21 privacyController:v20];

LABEL_27:
  return v6;
}

- (PUPXOneUpPresentationImplementation)init
{
  return (PUPXOneUpPresentationImplementation *)[(PUPXOneUpPresentationImplementation *)self _initWithOneUpPresentation:0];
}

@end