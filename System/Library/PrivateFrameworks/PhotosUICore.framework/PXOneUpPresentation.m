@interface PXOneUpPresentation
+ (id)_sharedDefaultImplementationDelegate;
+ (void)viewController:(id)a3 willPresentOneUpInViewController:(id)a4;
- (BOOL)canStart;
- (BOOL)canStartAnimated:(BOOL)a3;
- (BOOL)canStop;
- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3;
- (BOOL)isContextMenuInteractionActive;
- (BOOL)isEnabled;
- (BOOL)preventShowInAllPhotosAction;
- (BOOL)shouldAutoPlay;
- (BOOL)startWithConfigurationHandler:(id)a3;
- (BOOL)wantsShowInLibraryButton;
- (NSMapTable)contextMenuStateByConfiguration;
- (PXAssetActionManager)actionManager;
- (PXAssetActionManager)actionManagerForPreviewing;
- (PXAssetImportStatusManager)importStatusManager;
- (PXAssetReference)initialAssetReference;
- (PXAssetReference)lastViewedAssetReference;
- (PXAssetsDataSourceManager)dataSourceManager;
- (PXContentPrivacyController)privacyController;
- (PXOneUpPresentation)init;
- (PXOneUpPresentation)initWithPresentingViewController:(id)a3;
- (PXOneUpPresentationDelegate)delegate;
- (PXOneUpPresentationDelegate)strongDelegate;
- (PXOneUpPresentationImplementationDelegate)_implementationDelegate;
- (PXOneUpPresentationImplementationDelegate)implementationDelegate;
- (PXPhotosDetailsContext)photosDetailsContext;
- (PXSearchQueryMatchInfo)searchQueryMatchInfo;
- (PXUIMediaProvider)mediaProvider;
- (UIContextMenuInteraction)contextMenuInteraction;
- (UITargetedPreview)interactionTargetedPreview;
- (UIViewController)currentPreviewViewController;
- (UIViewController)originalPresentingViewController;
- (UIViewController)presentingViewController;
- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4;
- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)currentImageForAssetReference:(id)a3;
- (id)presentingScrollViewForAssetReference:(id)a3;
- (id)previewViewControllerAllowingActions:(BOOL)a3;
- (id)regionOfInterestForAssetReference:(id)a3;
- (int64_t)actionContext;
- (int64_t)origin;
- (int64_t)state;
- (void)_setImplementationDelegate:(id)a3;
- (void)_updateImplementationDelegate;
- (void)cleanUp;
- (void)commitPreviewViewController:(id)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5;
- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4;
- (void)invalidatePresentingGeometry;
- (void)presentingViewControllerViewDidAppear:(BOOL)a3;
- (void)presentingViewControllerViewDidDisappear:(BOOL)a3;
- (void)presentingViewControllerViewIsAppearing:(BOOL)a3;
- (void)presentingViewControllerViewWillAppear:(BOOL)a3;
- (void)presentingViewControllerViewWillDisappear:(BOOL)a3;
- (void)preventTargetedContextMenuDismissalAnimation;
- (void)scrollAssetReferenceToVisible:(id)a3;
- (void)setContextMenuStateByConfiguration:(id)a3;
- (void)setCurrentPreviewViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setHiddenAssetReferences:(id)a3;
- (void)setImplementationDelegate:(id)a3;
- (void)setInteractionTargetedPreview:(id)a3;
- (void)setOriginalPresentingViewController:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStrongDelegate:(id)a3;
- (void)stopAnimated:(BOOL)a3;
- (void)waitForTransitionToFinishWithTimeout:(double)a3 completionHandler:(id)a4;
- (void)waitUntilPresentationCanStartAnimated:(BOOL)a3 completionHandler:(id)a4;
@end

@implementation PXOneUpPresentation

- (void)invalidatePresentingGeometry
{
  if ([(PXOneUpPresentation *)self isEnabled]
    && self->_implementationDelegateFlags.respondsToInvalidatePresentingGeometry)
  {
    id v3 = [(PXOneUpPresentation *)self _implementationDelegate];
    [v3 oneUpPresentationInvalidatePresentingGeometry:self];
  }
}

- (PXOneUpPresentationImplementationDelegate)_implementationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__implementationDelegate);
  return (PXOneUpPresentationImplementationDelegate *)WeakRetained;
}

- (void)presentingViewControllerViewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXOneUpPresentation *)self isEnabled]
    && self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidAppear)
  {
    id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
    [v5 oneUpPresentation:self presentingViewControllerViewDidAppear:v3];
  }
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_updateImplementationDelegate
{
  BOOL v3 = [(PXOneUpPresentation *)self presentingViewController];
  v4 = objc_msgSend(v3, "px_oneUpPresentation");
  id v9 = [v4 implementationDelegate];

  uint64_t v5 = (uint64_t)v9;
  if (!v9)
  {
    do
    {
      uint64_t v8 = [v3 parentViewController];
      if (!v8)
      {
        uint64_t v5 = +[PXOneUpPresentation _sharedDefaultImplementationDelegate];
        goto LABEL_7;
      }
      v6 = (void *)v8;

      v7 = objc_msgSend(v6, "px_oneUpPresentation");
      id v10 = [v7 implementationDelegate];

      uint64_t v5 = (uint64_t)v10;
      BOOL v3 = v6;
    }
    while (!v10);
    BOOL v3 = v6;
  }
LABEL_7:
  id v11 = (id)v5;
  [(PXOneUpPresentation *)self _setImplementationDelegate:v5];
}

- (PXOneUpPresentationImplementationDelegate)implementationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_implementationDelegate);
  return (PXOneUpPresentationImplementationDelegate *)WeakRetained;
}

- (PXOneUpPresentation)initWithPresentingViewController:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXOneUpPresentation;
  uint64_t v5 = [(PXOneUpPresentation *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_presentingViewController, v4);
    uint64_t v7 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    contextMenuStateByConfiguration = v6->_contextMenuStateByConfiguration;
    v6->_contextMenuStateByConfiguration = (NSMapTable *)v7;
  }
  return v6;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)_setImplementationDelegate:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->__implementationDelegate);

  if (WeakRetained != v5)
  {
    id v7 = objc_loadWeakRetained((id *)&self->__implementationDelegate);

    if (v7)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      id v9 = objc_loadWeakRetained((id *)&self->__implementationDelegate);
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXOneUpPresentation.m", 610, @"not supporting change of implementation delegate (old: %@; new: %@)",
        v9,
        v5);
    }
    objc_storeWeak((id *)&self->__implementationDelegate, v5);
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillAppear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewIsAppearing = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidAppear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillDisappear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidDisappear = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToCanStart = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToLastViewedAssetReference = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToCanStop = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToInvalidatePresentingGeometry = objc_opt_respondsToSelector() & 1;
    self->_implementationDelegateFlags.respondsToHandlePresentingPinchGestureRecognizer = objc_opt_respondsToSelector() & 1;
    objc_initWeak(&location, self);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __50__PXOneUpPresentation__setImplementationDelegate___block_invoke;
    v10[3] = &unk_1E5DC4F20;
    objc_copyWeak(&v11, &location);
    [v5 oneUpPresentation:self registerStateChangeHandler:v10];
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

+ (id)_sharedDefaultImplementationDelegate
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PXOneUpPresentation__sharedDefaultImplementationDelegate__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sharedDefaultImplementationDelegate_onceToken_207268 != -1) {
    dispatch_once(&_sharedDefaultImplementationDelegate_onceToken_207268, block);
  }
  v2 = (void *)_sharedDefaultImplementationDelegate_defaultImplementationDelegate_207269;
  return v2;
}

- (void)presentingViewControllerViewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXOneUpPresentation *)self isEnabled])
  {
    [(PXOneUpPresentation *)self _updateImplementationDelegate];
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillAppear)
    {
      id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
      [v5 oneUpPresentation:self presentingViewControllerViewWillAppear:v3];
    }
  }
}

- (void)presentingViewControllerViewIsAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXOneUpPresentation *)self isEnabled])
  {
    [(PXOneUpPresentation *)self _updateImplementationDelegate];
    if (self->_implementationDelegateFlags.respondsToPresentingViewControllerViewIsAppearing)
    {
      id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
      [v5 oneUpPresentation:self presentingViewControllerViewIsAppearing:v3];
    }
  }
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateFlags = &self->_delegateFlags;
    p_delegateFlags->respondsToPhotosDetailsContext = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToPrivacyController = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToInitialAssetReference = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCanStartPreviewingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAllowsActionsForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAllowsMultiSelectMenuForInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAllowsPreviewCommittingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCommitPreviewForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillStartPreviewingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToWillEndPreviewingForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAccessoriesForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToSecondaryIdentifiersForConfiguration = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToStyleForContextMenuInteraction = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToCurrentImageForAssetReference = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToRegionOfInterestForAssetReference = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToScrollAssetReferenceToVisible = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToSetHiddenAssetReferences = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToShouldAutoPlay = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToPreventShowInAllPhotos = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToActionManager = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToActionManagerForPreviewing = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToActionContext = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToImportStatusManager = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToOrigin = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToScrollView = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToSearchContext = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedSceneIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedAudioIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedHumanActionIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedPersonLocalIdentifiers = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToAssetUUIDsAllowedToHighlight = objc_opt_respondsToSelector() & 1;
    p_delegateFlags->respondsToMatchedQueryStrings = objc_opt_respondsToSelector() & 1;
  }
}

- (UIContextMenuInteraction)contextMenuInteraction
{
  contextMenuInteraction = self->_contextMenuInteraction;
  if (!contextMenuInteraction)
  {
    id v4 = (UIContextMenuInteraction *)[objc_alloc(MEMORY[0x1E4FB1680]) initWithDelegate:self];
    id v5 = self->_contextMenuInteraction;
    self->_contextMenuInteraction = v4;

    contextMenuInteraction = self->_contextMenuInteraction;
  }
  return contextMenuInteraction;
}

void __59__PXOneUpPresentation__sharedDefaultImplementationDelegate__block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector())
  {
    uint64_t v2 = [*(id *)(a1 + 32) defaultImplementationDelegate];
    BOOL v3 = (void *)_sharedDefaultImplementationDelegate_defaultImplementationDelegate_207269;
    _sharedDefaultImplementationDelegate_defaultImplementationDelegate_207269 = v2;
  }
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_implementationDelegate);
  objc_destroyWeak((id *)&self->_originalPresentingViewController);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_contextMenuStateByConfiguration, 0);
  objc_storeStrong((id *)&self->_interactionTargetedPreview, 0);
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_storeStrong((id *)&self->_strongDelegate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contextMenuInteraction, 0);
  objc_destroyWeak((id *)&self->__implementationDelegate);
}

- (void)setImplementationDelegate:(id)a3
{
}

- (void)setOriginalPresentingViewController:(id)a3
{
}

- (UIViewController)originalPresentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originalPresentingViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setContextMenuStateByConfiguration:(id)a3
{
}

- (NSMapTable)contextMenuStateByConfiguration
{
  return self->_contextMenuStateByConfiguration;
}

- (void)setInteractionTargetedPreview:(id)a3
{
}

- (UITargetedPreview)interactionTargetedPreview
{
  return self->_interactionTargetedPreview;
}

- (void)setCurrentPreviewViewController:(id)a3
{
}

- (UIViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (int64_t)state
{
  return self->_state;
}

- (PXOneUpPresentationDelegate)strongDelegate
{
  return self->_strongDelegate;
}

- (PXOneUpPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXOneUpPresentationDelegate *)WeakRetained;
}

- (id)_contextMenuInteraction:(id)a3 styleForMenuWithConfiguration:(id)a4
{
  if (self->_delegateFlags.respondsToStyleForContextMenuInteraction)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [(PXOneUpPresentation *)self delegate];
    id v9 = [v8 oneUpPresentation:self styleForContextMenuInteraction:v7 configuration:v6];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)_contextMenuInteraction:(id)a3 accessoriesForMenuWithConfiguration:(id)a4
{
  if (self->_delegateFlags.respondsToAccessoriesForContextMenuInteraction)
  {
    id v6 = a4;
    id v7 = a3;
    uint64_t v8 = [(PXOneUpPresentation *)self delegate];
    id v9 = [v8 oneUpPresentation:self accessoriesForContextMenuInteraction:v7 configuration:v6];
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(PXOneUpPresentation *)self contextMenuStateByConfiguration];
  v12 = [v11 objectForKey:v9];

  v13 = [(PXOneUpPresentation *)self currentPreviewViewController];
  [(PXOneUpPresentation *)self setCurrentPreviewViewController:0];
  v14 = [(PXOneUpPresentation *)self dataSourceManager];
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__207137;
  v30[4] = __Block_byref_object_dispose__207138;
  id v31 = 0;
  if (v10)
  {
    v15 = [(PXOneUpPresentation *)self interactionTargetedPreview];

    if (v15)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke;
      v29[3] = &unk_1E5DD1368;
      v29[4] = v30;
      [v14 performChanges:v29];
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2;
  aBlock[3] = &unk_1E5DC7710;
  aBlock[4] = self;
  id v16 = v12;
  id v23 = v16;
  id v17 = v13;
  id v24 = v17;
  id v18 = v8;
  id v25 = v18;
  id v19 = v9;
  id v26 = v19;
  v28 = v30;
  id v20 = v14;
  id v27 = v20;
  v21 = (void (**)(void))_Block_copy(aBlock);
  if (v10 && !UIAccessibilityIsReduceMotionEnabled()) {
    [v10 addCompletion:v21];
  }
  else {
    v21[2](v21);
  }

  _Block_object_dispose(v30, 8);
}

void __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 pauseChangeDeliveryWithTimeout:@"PXOneUpPresentation.contextMenuWillEndAnimation" identifier:1.0];
  uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

void __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setInteractionTargetedPreview:0];
  if ([*(id *)(a1 + 40) interactionAppearance] != 2) {
    [*(id *)(a1 + 32) setHiddenAssetReferences:0];
  }
  uint64_t v2 = *(void *)(a1 + 48);
  if (v2) {
    objc_msgSend(*(id *)(a1 + 32), "didDismissPreviewViewController:committing:", v2, objc_msgSend(*(id *)(a1 + 40), "isPreviewCommitting"));
  }
  uint64_t v3 = *(unsigned char **)(a1 + 32);
  if (v3[105])
  {
    uint64_t v4 = [v3 delegate];
    [v4 oneUpPresentation:*(void *)(a1 + 32) willEndPreviewingForContextMenuInteraction:*(void *)(a1 + 56) configuration:*(void *)(a1 + 64)];

    uint64_t v3 = *(unsigned char **)(a1 + 32);
  }
  id v5 = [v3 contextMenuStateByConfiguration];
  [v5 removeObjectForKey:*(void *)(a1 + 64)];

  uint64_t v6 = *(void *)(a1 + 80);
  if (*(void *)(*(void *)(v6 + 8) + 40))
  {
    id v7 = *(void **)(a1 + 72);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3;
    v8[3] = &unk_1E5DD1368;
    v8[4] = v6;
    [v7 performChanges:v8];
  }
}

uint64_t __79__PXOneUpPresentation_contextMenuInteraction_willEndForConfiguration_animator___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 resumeChangeDeliveryAndBackgroundLoading:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 dismissalPreviewForItemWithIdentifier:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = [(PXOneUpPresentation *)self interactionTargetedPreview];
  if (v9
    && ([v7 secondaryItemIdentifiers],
        id v10 = objc_claimAutoreleasedReturnValue(),
        int v11 = [v10 containsObject:v8],
        v10,
        v11))
  {
    v12 = [(PXOneUpPresentation *)self delegate];
    v13 = [v12 oneUpPresentation:self previewForDismissingToSecondaryItemWithIdentifier:v8 configuration:v7];
  }
  else
  {
    v12 = [(PXOneUpPresentation *)self initialAssetReference];
    v14 = [(PXOneUpPresentation *)self presentingScrollViewForAssetReference:v12];
    v15 = v14;
    if (v9
      && v12
      && ([v14 window], id v16 = objc_claimAutoreleasedReturnValue(), v16, v16))
    {
      id v17 = [(PXOneUpPresentation *)self regionOfInterestForAssetReference:v12];
      if (v17)
      {
        id v18 = [v15 coordinateSpace];
        [v17 rectInCoordinateSpace:v18];

        id v19 = objc_alloc(MEMORY[0x1E4FB1B38]);
        PXRectGetCenter();
      }

      id v9 = 0;
    }
    else
    {
      [(PXOneUpPresentation *)self setHiddenAssetReferences:0];
    }
    id v9 = v9;

    v13 = v9;
  }

  return v13;
}

- (void)contextMenuInteraction:(id)a3 willPerformPreviewActionForMenuWithConfiguration:(id)a4 animator:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!self->_delegateFlags.respondsToAllowsPreviewCommittingForContextMenuInteraction
    || ([(PXOneUpPresentation *)self delegate],
        int v11 = objc_claimAutoreleasedReturnValue(),
        int v12 = [v11 oneUpPresentation:self allowsPreviewCommittingForContextMenuInteraction:v8],
        v11,
        v12))
  {
    v13 = [(PXOneUpPresentation *)self contextMenuStateByConfiguration];
    v14 = [v13 objectForKey:v9];

    if ([v14 actionsAllowedForContextMenuInteraction])
    {
      if (!self->_delegateFlags.respondsToCommitPreviewForContextMenuInteraction
        || ([(PXOneUpPresentation *)self delegate],
            v15 = objc_claimAutoreleasedReturnValue(),
            char v16 = [v15 oneUpPresentation:self commitPreviewForContextMenuInteraction:v8],
            v15,
            (v16 & 1) == 0))
      {
        id v17 = [(PXOneUpPresentation *)self currentPreviewViewController];
        if (v17)
        {
          [v14 setIsPreviewCommitting:1];
          [v10 setPreferredCommitStyle:1];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __104__PXOneUpPresentation_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke;
          v18[3] = &unk_1E5DD32A8;
          v18[4] = self;
          id v19 = v17;
          [v10 addCompletion:v18];
        }
      }
    }
  }
}

uint64_t __104__PXOneUpPresentation_contextMenuInteraction_willPerformPreviewActionForMenuWithConfiguration_animator___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) commitPreviewViewController:*(void *)(a1 + 40)];
}

- (id)contextMenuInteraction:(id)a3 configuration:(id)a4 highlightPreviewForItemWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = a4;
  int v11 = [v10 secondaryItemIdentifiers];
  LODWORD(a4) = [v11 containsObject:v9];

  if (!a4)
  {
    uint64_t v14 = [(PXOneUpPresentation *)self initialAssetReference];
    v15 = [(PXOneUpPresentation *)self currentImageForAssetReference:v14];
    char v16 = [(PXOneUpPresentation *)self regionOfInterestForAssetReference:v14];
    [(PXOneUpPresentation *)self presentingScrollViewForAssetReference:v14];
    id v17 = [(id)objc_claimAutoreleasedReturnValue() coordinateSpace];
    [v16 rectInCoordinateSpace:v17];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;

    id v26 = [v16 placeholderViewFactory];

    if (v26)
    {
      id v27 = [v16 placeholderViewFactory];
      ((void (**)(void, void *))v27)[2](v27, v16);
    }
    else
    {
      PXPreviewImageViewForImage(v15, v16, v19, v21, v23, v25);
      objc_claimAutoreleasedReturnValue();
    }
    id v28 = objc_alloc(MEMORY[0x1E4FB1B38]);
    PXRectGetCenter();
  }
  int v12 = [(PXOneUpPresentation *)self delegate];
  v13 = [v12 oneUpPresentation:self previewForHighlightingSecondaryItemWithIdentifier:v9 configuration:v10];

  return v13;
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  id v5 = a3;
  uint64_t v6 = +[PXPhotosGridSettings sharedInstance];
  int v7 = [v6 enableMultiSelectMenu];

  if (self->_delegateFlags.respondsToCanStartPreviewingForContextMenuInteraction)
  {
    id v8 = [(PXOneUpPresentation *)self delegate];
    int v9 = [v8 oneUpPresentation:self canStartPreviewingForContextMenuInteraction:v5];
  }
  else
  {
    int v9 = 0;
  }
  if (self->_delegateFlags.respondsToAllowsActionsForContextMenuInteraction)
  {
    id v10 = [(PXOneUpPresentation *)self delegate];
    uint64_t v11 = [v10 oneUpPresentation:self allowsActionsForContextMenuInteraction:v5];
  }
  else
  {
    uint64_t v11 = 1;
  }
  if (!self->_delegateFlags.respondsToAllowsMultiSelectMenuForInteraction)
  {
    int v13 = 0;
    if (v9) {
      goto LABEL_9;
    }
LABEL_14:
    double v18 = 0;
    goto LABEL_21;
  }
  int v12 = [(PXOneUpPresentation *)self delegate];
  int v13 = [v12 oneUpPresentation:self allowsMultiSelectMenuForInteraction:v5];

  if (!v9) {
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v14 = [(PXOneUpPresentation *)self previewViewControllerAllowingActions:v11];
  v15 = v14;
  if (v11)
  {
    if (v7 && (v13 & 1) != 0)
    {
      char v16 = [(PXOneUpPresentation *)self actionManagerForPreviewing];
      id v17 = +[PXAssetActionMenuBuilder menuElementsForActionManager:v16];
    }
    else
    {
      id v17 = objc_msgSend(v14, "px_previewActionMenus");
    }
    double v19 = [MEMORY[0x1E4FB1970] menuWithTitle:&stru_1F00B0030 children:v17];
  }
  else
  {
    double v19 = 0;
  }
  double v20 = (void *)MEMORY[0x1E4FB1678];
  uint64_t v33 = MEMORY[0x1E4F143A8];
  uint64_t v34 = 3221225472;
  v35 = __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v36 = &unk_1E5DC4F48;
  id v37 = v15;
  uint64_t v28 = MEMORY[0x1E4F143A8];
  uint64_t v29 = 3221225472;
  v30 = __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2;
  id v31 = &unk_1E5DC4F70;
  id v32 = v19;
  id v21 = v19;
  id v22 = v15;
  double v18 = [v20 configurationWithIdentifier:0 previewProvider:&v33 actionProvider:&v28];
  if ((v7 & v13) == 1)
  {
    double v23 = [(PXOneUpPresentation *)self delegate];
    double v24 = [v23 oneUpPresentation:self secondaryIdentifiersForConfiguration:v18];
    [v18 setSecondaryItemIdentifiers:v24];
  }
  -[PXOneUpPresentation setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", v22, v28, v29, v30, v31);
  double v25 = objc_alloc_init(_PXContextMenuConfigurationState);
  [(_PXContextMenuConfigurationState *)v25 setIsContextMenuInteractionActive:1];
  [(_PXContextMenuConfigurationState *)v25 setActionsAllowedForContextMenuInteraction:v11];
  -[_PXContextMenuConfigurationState setInteractionAppearance:](v25, "setInteractionAppearance:", [v5 menuAppearance]);
  id v26 = [(PXOneUpPresentation *)self contextMenuStateByConfiguration];
  [v26 setObject:v25 forKey:v18];

LABEL_21:
  return v18;
}

id __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

id __77__PXOneUpPresentation_contextMenuInteraction_configurationForMenuAtLocation___block_invoke_2(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)isContextMenuInteractionActive
{
  uint64_t v2 = [(PXOneUpPresentation *)self contextMenuStateByConfiguration];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

void __50__PXOneUpPresentation__setImplementationDelegate___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setState:a2];
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  p_delegateFlags = &self->_delegateFlags;
  if (self->_delegateFlags.respondsToSearchContext)
  {
    uint64_t v4 = [(PXOneUpPresentation *)self delegate];
    id v5 = [v4 oneUpPresentationSearchQueryMatchInfo:self];

    uint64_t v6 = PLOneUpGetLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v52 = v5;
      _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided search query info: %@", buf, 0xCu);
    }
  }
  else
  {
    int v7 = (PXSearchQueryMatchInfo *)MEMORY[0x1E4F1CBF0];
    if (self->_delegateFlags.respondsToMatchedSceneIdentifiers)
    {
      id v8 = [(PXOneUpPresentation *)self delegate];
      uint64_t v9 = [v8 oneUpPresentationMatchedSceneIdentifiers:self];
      id v10 = (void *)v9;
      if (v9) {
        uint64_t v11 = (void *)v9;
      }
      else {
        uint64_t v11 = v7;
      }
      int v7 = v11;

      int v12 = PLOneUpGetLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v7;
        _os_log_impl(&dword_1A9AE7000, v12, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched scene identifiers: %@", buf, 0xCu);
      }
    }
    int v13 = (PXSearchQueryMatchInfo *)MEMORY[0x1E4F1CBF0];
    if (p_delegateFlags->respondsToMatchedAudioIdentifiers)
    {
      uint64_t v14 = [(PXOneUpPresentation *)self delegate];
      uint64_t v15 = [v14 oneUpPresentationMatchedAudioIdentifiers:self];
      char v16 = (void *)v15;
      if (v15) {
        id v17 = (void *)v15;
      }
      else {
        id v17 = v13;
      }
      int v13 = v17;

      double v18 = PLOneUpGetLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v13;
        _os_log_impl(&dword_1A9AE7000, v18, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched audio identifiers: %@", buf, 0xCu);
      }
    }
    double v19 = (PXSearchQueryMatchInfo *)MEMORY[0x1E4F1CBF0];
    if (p_delegateFlags->respondsToMatchedHumanActionIdentifiers)
    {
      double v20 = [(PXOneUpPresentation *)self delegate];
      uint64_t v21 = [v20 oneUpPresentationMatchedHumanActionIdentifiers:self];
      id v22 = (void *)v21;
      if (v21) {
        double v23 = (void *)v21;
      }
      else {
        double v23 = v19;
      }
      double v19 = v23;

      double v24 = PLOneUpGetLog();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v19;
        _os_log_impl(&dword_1A9AE7000, v24, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched human action identifiers: %@", buf, 0xCu);
      }
    }
    double v25 = (PXSearchQueryMatchInfo *)MEMORY[0x1E4F1CBF0];
    if (p_delegateFlags->respondsToMatchedPersonLocalIdentifiers)
    {
      id v26 = [(PXOneUpPresentation *)self delegate];
      uint64_t v27 = [v26 oneUpPresentationMatchedPersonLocalIdentifiers:self];
      uint64_t v28 = (void *)v27;
      if (v27) {
        uint64_t v29 = (void *)v27;
      }
      else {
        uint64_t v29 = v25;
      }
      double v25 = v29;

      v30 = PLOneUpGetLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v25;
        _os_log_impl(&dword_1A9AE7000, v30, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided matched person identifiers: %@", buf, 0xCu);
      }
    }
    id v31 = (id)MEMORY[0x1E4F1CBF0];
    if (p_delegateFlags->respondsToMatchedQueryStrings)
    {
      id v32 = [(PXOneUpPresentation *)self delegate];
      uint64_t v33 = [v32 oneUpPresentationMatchedQueryStrings:self];
      uint64_t v34 = (void *)v33;
      if (v33) {
        v35 = (void *)v33;
      }
      else {
        v35 = v31;
      }
      id v31 = v35;
    }
    v36 = (PXSearchQueryMatchInfo *)MEMORY[0x1E4F1CBF0];
    if (p_delegateFlags->respondsToAssetUUIDsAllowedToHighlight)
    {
      id v37 = [(PXOneUpPresentation *)self delegate];
      uint64_t v38 = [v37 oneUpPresentationAssetUUIDsAllowedToHighlightText:self];
      v39 = (void *)v38;
      if (v38) {
        v40 = (void *)v38;
      }
      else {
        v40 = v36;
      }
      v36 = v40;

      v41 = PLOneUpGetLog();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v52 = v36;
        _os_log_impl(&dword_1A9AE7000, v41, OS_LOG_TYPE_DEFAULT, "PUOneUpPresentation: Delegate provided asset UUIDs to highlight in 1up: %@", buf, 0xCu);
      }
      v42 = v19;
    }
    else
    {
      v42 = v19;
    }
    v43 = [PXSearchQueryMatchInfo alloc];
    v44 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v7];
    v45 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v25];
    p_super = &v7->super;
    v46 = v13;
    v47 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v13];
    v48 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v42];
    id v5 = [(PXSearchQueryMatchInfo *)v43 initWithLocalizedQueryString:0 matchedSceneIdentifiers:v44 personLocalIdentifiers:v45 audioIdentifiers:v47 humanActionIdentifiers:v48 ocrTexts:v31 ocrAssetUUIDS:v36 queryEmbedding:0 countOfQueryTerms:0];

    uint64_t v6 = p_super;
  }

  return v5;
}

- (id)presentingScrollViewForAssetReference:(id)a3
{
  if (self->_delegateFlags.respondsToScrollView)
  {
    id v4 = a3;
    id v5 = [(PXOneUpPresentation *)self delegate];
    uint64_t v6 = [v5 oneUpPresentation:self presentingScrollViewForAssetReference:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)setHiddenAssetReferences:(id)a3
{
  if (self->_delegateFlags.respondsToSetHiddenAssetReferences)
  {
    id v4 = a3;
    id v5 = [(PXOneUpPresentation *)self delegate];
    [v5 oneUpPresentation:self setHiddenAssetReferences:v4];
  }
}

- (void)scrollAssetReferenceToVisible:(id)a3
{
  if (self->_delegateFlags.respondsToScrollAssetReferenceToVisible)
  {
    id v4 = a3;
    id v5 = [(PXOneUpPresentation *)self delegate];
    [v5 oneUpPresentation:self scrollAssetReferenceToVisible:v4];
  }
}

- (id)regionOfInterestForAssetReference:(id)a3
{
  if (self->_delegateFlags.respondsToRegionOfInterestForAssetReference)
  {
    id v4 = a3;
    id v5 = [(PXOneUpPresentation *)self delegate];
    uint64_t v6 = [v5 oneUpPresentation:self regionOfInterestForAssetReference:v4];
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (id)currentImageForAssetReference:(id)a3
{
  BOOL respondsToCurrentImageForAssetReference = self->_delegateFlags.respondsToCurrentImageForAssetReference;
  id v5 = a3;
  if (respondsToCurrentImageForAssetReference)
  {
    uint64_t v6 = [(PXOneUpPresentation *)self delegate];
    [v6 oneUpPresentation:self currentImageForAssetReference:v5];
  }
  else
  {
    uint64_t v6 = [(PXOneUpPresentation *)self regionOfInterestForAssetReference:v5];

    id v5 = [v6 imageRequester];
    [v5 image];
  int v7 = };

  return v7;
}

- (BOOL)wantsShowInLibraryButton
{
  BOOL v3 = [(PXOneUpPresentation *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 oneUpPresentationWantsShowInLibraryButton:self];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)preventShowInAllPhotosAction
{
  if (!self->_delegateFlags.respondsToPreventShowInAllPhotos) {
    return 0;
  }
  uint64_t v2 = self;
  BOOL v3 = [(PXOneUpPresentation *)self delegate];
  LOBYTE(v2) = [v3 oneUpPresentationShouldPreventShowInAllPhotosAction:v2];

  return (char)v2;
}

- (BOOL)shouldAutoPlay
{
  if (!self->_delegateFlags.respondsToShouldAutoPlay) {
    return 0;
  }
  uint64_t v2 = self;
  BOOL v3 = [(PXOneUpPresentation *)self delegate];
  LOBYTE(v2) = [v3 oneUpPresentationShouldAutoPlay:v2];

  return (char)v2;
}

- (PXAssetImportStatusManager)importStatusManager
{
  if (self->_delegateFlags.respondsToImportStatusManager)
  {
    BOOL v3 = [(PXOneUpPresentation *)self delegate];
    char v4 = [v3 oneUpPresentationImportStatusManager:self];
  }
  else
  {
    char v4 = 0;
  }
  return (PXAssetImportStatusManager *)v4;
}

- (int64_t)actionContext
{
  if (!self->_delegateFlags.respondsToActionContext) {
    return 0;
  }
  BOOL v3 = [(PXOneUpPresentation *)self delegate];
  int64_t v4 = [v3 oneUpPresentationActionContext:self];

  return v4;
}

- (PXAssetActionManager)actionManagerForPreviewing
{
  if (self->_delegateFlags.respondsToActionManagerForPreviewing)
  {
    BOOL v3 = [(PXOneUpPresentation *)self delegate];
    int64_t v4 = [v3 oneUpPresentationActionManagerForPreviewing:self];
  }
  else
  {
    int64_t v4 = 0;
  }
  return (PXAssetActionManager *)v4;
}

- (PXAssetActionManager)actionManager
{
  if (self->_delegateFlags.respondsToActionManager)
  {
    BOOL v3 = [(PXOneUpPresentation *)self delegate];
    int64_t v4 = [v3 oneUpPresentationActionManager:self];
  }
  else
  {
    int64_t v4 = 0;
  }
  return (PXAssetActionManager *)v4;
}

- (PXAssetReference)initialAssetReference
{
  if (self->_delegateFlags.respondsToInitialAssetReference)
  {
    BOOL v3 = [(PXOneUpPresentation *)self delegate];
    int64_t v4 = [v3 oneUpPresentationInitialAssetReference:self];
  }
  else
  {
    int64_t v4 = 0;
  }
  return (PXAssetReference *)v4;
}

- (PXContentPrivacyController)privacyController
{
  if (self->_delegateFlags.respondsToPrivacyController)
  {
    BOOL v3 = [(PXOneUpPresentation *)self delegate];
    int64_t v4 = [v3 oneUpPresentationPrivacyController:self];
  }
  else
  {
    int64_t v4 = 0;
  }
  return (PXContentPrivacyController *)v4;
}

- (PXPhotosDetailsContext)photosDetailsContext
{
  if (self->_delegateFlags.respondsToPhotosDetailsContext)
  {
    BOOL v3 = [(PXOneUpPresentation *)self delegate];
    int64_t v4 = [v3 oneUpPresentationPhotosDetailsContext:self];
  }
  else
  {
    int64_t v4 = 0;
  }
  return (PXPhotosDetailsContext *)v4;
}

- (int64_t)origin
{
  if (!self->_delegateFlags.respondsToOrigin) {
    return 0;
  }
  BOOL v3 = [(PXOneUpPresentation *)self delegate];
  int64_t v4 = [v3 oneUpPresentationOrigin:self];

  return v4;
}

- (PXUIMediaProvider)mediaProvider
{
  int64_t v4 = [(PXOneUpPresentation *)self delegate];
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"PXOneUpPresentation.m", 402, @"Delegate must be set before %@ is called.", v8 object file lineNumber description];
  }
  id v5 = [v4 oneUpPresentationMediaProvider:self];

  return (PXUIMediaProvider *)v5;
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  int64_t v4 = [(PXOneUpPresentation *)self delegate];
  if (!v4)
  {
    int v7 = [MEMORY[0x1E4F28B00] currentHandler];
    id v8 = NSStringFromSelector(a2);
    [v7 handleFailureInMethod:a2, self, @"PXOneUpPresentation.m", 394, @"Delegate must be set before %@ is called.", v8 object file lineNumber description];
  }
  id v5 = [v4 oneUpPresentationDataSourceManager:self];

  return (PXAssetsDataSourceManager *)v5;
}

- (BOOL)handlePresentingPinchGestureRecognizer:(id)a3
{
  id v4 = a3;
  if ([(PXOneUpPresentation *)self isEnabled]
    && self->_implementationDelegateFlags.respondsToHandlePresentingPinchGestureRecognizer)
  {
    id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
    char v6 = [v5 oneUpPresentation:self handlePresentingPinchGestureRecognizer:v4];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)preventTargetedContextMenuDismissalAnimation
{
}

- (void)stopAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXOneUpPresentation *)self isEnabled])
  {
    id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
    [v5 oneUpPresentation:self stopAnimated:v3];
  }
}

- (BOOL)canStop
{
  BOOL v3 = [(PXOneUpPresentation *)self isEnabled];
  if (v3)
  {
    if (self->_implementationDelegateFlags.respondsToCanStop)
    {
      id v4 = [(PXOneUpPresentation *)self _implementationDelegate];
      char v5 = [v4 oneUpPresentationCanStop:self];

      LOBYTE(v3) = v5;
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (void)commitPreviewViewController:(id)a3
{
  id v4 = a3;
  id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
  [v5 oneUpPresentation:self commitPreviewViewController:v4];
}

- (void)didDismissPreviewViewController:(id)a3 committing:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(PXOneUpPresentation *)self _implementationDelegate];
  [v7 oneUpPresentation:self didDismissPreviewViewController:v6 committing:v4];
}

- (id)previewViewControllerAllowingActions:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
  id v6 = [v5 previewViewControllerForOneUpPresentation:self allowingActions:v3];

  return v6;
}

- (void)waitForTransitionToFinishWithTimeout:(double)a3 completionHandler:(id)a4
{
  id v5 = (void (**)(id, uint64_t))a4;
  if ([(PXOneUpPresentation *)self state] == 3)
  {
    if (v5) {
      v5[2](v5, 1);
    }
  }
  else if (v5)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x2020000000;
    char v7 = 0;
    v5;
    PXIterateAsynchronously();
  }
}

void __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) state] == 3)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    [v3 stop];
  }
  else
  {
    dispatch_time_t v4 = dispatch_time(0, 250000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke_2;
    block[3] = &unk_1E5DD36F8;
    id v6 = v3;
    dispatch_after(v4, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

uint64_t __78__PXOneUpPresentation_waitForTransitionToFinishWithTimeout_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

- (BOOL)startWithConfigurationHandler:(id)a3
{
  id v4 = a3;
  if ([(PXOneUpPresentation *)self isEnabled]
    && ([(PXOneUpPresentation *)self _implementationDelegate],
        id v5 = objc_claimAutoreleasedReturnValue(),
        char v6 = [v5 oneUpPresentation:self startWithConfigurationHandler:v4],
        v5,
        (v6 & 1) != 0))
  {
    BOOL v7 = 1;
  }
  else
  {
    [(PXOneUpPresentation *)self cleanUp];
    BOOL v7 = 0;
  }

  return v7;
}

- (void)waitUntilPresentationCanStartAnimated:(BOOL)a3 completionHandler:(id)a4
{
  id v4 = a4;
  PXIterateAsynchronously();
}

void __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) canStartAnimated:*(unsigned __int8 *)(a1 + 40)])
  {
    [v3 stop];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke_2;
    block[3] = &unk_1E5DD36F8;
    id v5 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  uint64_t v2 = [*(id *)(a1 + 32) canStartAnimated:*(unsigned __int8 *)(a1 + 48)];
  id v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

uint64_t __79__PXOneUpPresentation_waitUntilPresentationCanStartAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) next];
}

- (PXAssetReference)lastViewedAssetReference
{
  if ([(PXOneUpPresentation *)self isEnabled]
    && self->_implementationDelegateFlags.respondsToLastViewedAssetReference)
  {
    id v3 = [(PXOneUpPresentation *)self _implementationDelegate];
    id v4 = [v3 oneUpPresentationLastViewedAssetReference:self];
  }
  else
  {
    id v4 = 0;
  }
  return (PXAssetReference *)v4;
}

- (BOOL)canStartAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXOneUpPresentation *)self isEnabled];
  if (v5)
  {
    if ([(PXOneUpPresentation *)self state] == 3 || !self->_implementationDelegateFlags.respondsToCanStart)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      char v6 = [(PXOneUpPresentation *)self _implementationDelegate];
      char v7 = [v6 oneUpPresentation:self canStartAnimated:v3];

      LOBYTE(v5) = v7;
    }
  }
  return v5;
}

- (BOOL)canStart
{
  return [(PXOneUpPresentation *)self canStartAnimated:1];
}

- (void)presentingViewControllerViewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXOneUpPresentation *)self isEnabled]
    && self->_implementationDelegateFlags.respondsToPresentingViewControllerViewDidDisappear)
  {
    id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
    [v5 oneUpPresentation:self presentingViewControllerViewDidDisappear:v3];
  }
}

- (void)presentingViewControllerViewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(PXOneUpPresentation *)self isEnabled]
    && self->_implementationDelegateFlags.respondsToPresentingViewControllerViewWillDisappear)
  {
    id v5 = [(PXOneUpPresentation *)self _implementationDelegate];
    [v5 oneUpPresentation:self presentingViewControllerViewWillDisappear:v3];
  }
}

- (void)setState:(int64_t)a3
{
  if (self->_state != a3)
  {
    self->_state = a3;
    v3[0] = MEMORY[0x1E4F143A8];
    v3[1] = 3221225472;
    v3[2] = __32__PXOneUpPresentation_setState___block_invoke;
    v3[3] = &unk_1E5DD0FA8;
    v3[4] = self;
    [(PXOneUpPresentation *)self performChanges:v3];
  }
}

uint64_t __32__PXOneUpPresentation_setState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) signalChange:1];
}

- (void)cleanUp
{
  BOOL v3 = [(PXOneUpPresentation *)self strongDelegate];

  if (v3)
  {
    [(PXOneUpPresentation *)self setStrongDelegate:0];
  }
}

- (void)setStrongDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_strongDelegate, a3);
  id v5 = a3;
  [(PXOneUpPresentation *)self setDelegate:v5];
}

- (PXOneUpPresentation)init
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXOneUpPresentation.m" lineNumber:121 description:@"unavailable initializer"];

  return 0;
}

+ (void)viewController:(id)a3 willPresentOneUpInViewController:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  char v6 = +[PXWorkaroundSettings sharedInstance];
  int v7 = [v6 shouldWorkAround104295292];

  if (v7)
  {
    id v8 = [v10 presentedViewController];
    if (v8
      && [v10 _mayForwardPresentationsToPresentedViewController]
      && ![v5 modalPresentationStyle])
    {
      uint64_t v9 = objc_msgSend(v10, "px_oneUpPresentation");
      objc_msgSend(v8, "px_setOneUpPresentationProxy:", v9);
    }
  }
}

@end