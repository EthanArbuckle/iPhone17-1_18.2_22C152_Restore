@interface IMAAppPresenter
+ (id)logHandle;
+ (void)disableAutomaticAppDiscovery;
+ (void)loadAppWithIdentifierIfNeeded:(id)a3;
- (BOOL)addSwitcher;
- (BOOL)alwaysPresentAppsExpanded;
- (BOOL)browserTransitionCoordinatorShouldDismissOnDragSuccess:(id)a3;
- (BOOL)hidesCompactAppForStickerDrag;
- (BOOL)isAppCardsEnabled;
- (BOOL)isAppCompact;
- (BOOL)isSwitcherOffscreen;
- (BOOL)presentsStickerPickerInPopover;
- (BOOL)shouldAlwaysShowAppTitle;
- (BOOL)shouldPresentAppCardInSendMenuWithTraitCollection:(id)a3;
- (BOOL)switcherViewControllerShouldShowIconAndTitleWhenCompact:(id)a3;
- (CGRect)alwaysExpandedAppViewControllerFrame;
- (CGSize)browserTransitionCoordinator:(id)a3 preferredSizeForBrowser:(id)a4;
- (CKAppCardPresentationOverseer)appCardPresentationOverseer;
- (CKBrowserSwitcherViewController)switcherViewController;
- (IMAAppPresenter)init;
- (IMAAppPresenterDelegate)delegate;
- (IMAStickerPickerPresentationContext)savedStickerPresentationContext;
- (UIViewController)currentAppViewController;
- (double)compactHeight;
- (double)switcherHeight;
- (id)activeSendMenuPresentationForAppCardOverseer;
- (id)appViewControllerPresenter;
- (id)convertStickerToIMASticker:(id)a3;
- (id)currentStickerViewController;
- (id)logHandle;
- (id)transitionsPresentationViewController;
- (int)dragManager:(id)a3 dropAreaForDragTarget:(id)a4;
- (void)_hideAppCardAnimated:(BOOL)a3 completion:(id)a4;
- (void)_hideCompactBrowserAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentAppCardWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)_presentAppCardWithBundleIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)_presentAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)animateSwitcherOffscreen:(BOOL)a3 completion:(id)a4;
- (void)appCardOverseerDidDismissAppCard;
- (void)appPresenterDidSelectAppWithIdentifier:(id)a3;
- (void)appPresenterDidSelectAppWithIdentifier:(id)a3 type:(id)a4;
- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4;
- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4;
- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4;
- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4;
- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5;
- (void)convertIMSticker:(id)a3 bakeInEffect:(BOOL)a4 completion:(id)a5;
- (void)dealloc;
- (void)dismiss;
- (void)dismissAndReloadInputViews:(BOOL)a3;
- (void)dismissAndReloadInputViews:(BOOL)a3 forPlugin:(id)a4;
- (void)dragManager:(id)a3 draggedItemWithTarget:(id)a4;
- (void)dragManager:(id)a3 overrideDropPointForTarget:(id)a4 completion:(id)a5;
- (void)dragManagerDidBeginDragging:(id)a3;
- (void)dragManagerDidEndDragging:(id)a3;
- (void)hideAppViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)notifyDelegateOfSelectedPlugin:(id)a3;
- (void)notifyDelegateOfSelectedPlugin:(id)a3 type:(id)a4;
- (void)positionSwitcherOffscreen:(BOOL)a3;
- (void)presentAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)presentFullScreenModalAppWithBundleIdentifier:(id)a3 completion:(id)a4;
- (void)presentPopoverAppWithBundleIdentifier:(id)a3 sourceRect:(CGRect)a4 inView:(id)a5 completion:(id)a6;
- (void)requestPresentationStyleExpanded:(BOOL)a3;
- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 preferredContentSize:(CGSize)a4;
- (void)setAlwaysPresentAppsExpanded:(BOOL)a3;
- (void)setAppCardPresentationOverseer:(id)a3;
- (void)setCompactHeight:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setHidesCompactAppForStickerDrag:(BOOL)a3;
- (void)setSavedStickerPresentationContext:(id)a3;
- (void)setSwitcherViewController:(id)a3;
- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5;
- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4;
- (void)stickerDruidDragEndedWithIMSticker:(id)a3;
- (void)stickerDruidDragStarted;
- (void)switcherViewControllerDidFinishSwitching:(id)a3 toViewController:(id)a4;
- (void)updateAppFrameForRotation;
- (void)updatePopoverWindowLocation:(CGRect)a3 inView:(id)a4 completion:(id)a5;
- (void)updateSwitcherViewFrame;
@end

@implementation IMAAppPresenter

+ (id)logHandle
{
  if (logHandle_onceToken != -1) {
    dispatch_once(&logHandle_onceToken, &__block_literal_global);
  }
  v2 = (void *)logHandle_sLogHandle;
  return v2;
}

uint64_t __28__IMAAppPresenter_logHandle__block_invoke()
{
  logHandle_sLogHandle = (uint64_t)os_log_create("com.apple.Messages", "iMessageAppsViewService");
  return MEMORY[0x270F9A758]();
}

- (id)logHandle
{
  v2 = objc_opt_class();
  return (id)[v2 logHandle];
}

- (IMAAppPresenter)init
{
  v8.receiver = self;
  v8.super_class = (Class)IMAAppPresenter;
  v2 = [(IMAAppPresenter *)&v8 init];
  if (v2)
  {
    id v3 = (id)[MEMORY[0x263F31A18] sharedInstance];
    uint64_t v4 = MEMORY[0x230F453F0](@"CKPluginExtensionStateObserver", @"ChatKit");
    if (v4)
    {
      v5 = (void *)v4;
      if (objc_opt_respondsToSelector()) {
        id v6 = (id)[v5 sharedInstance];
      }
    }
  }
  return v2;
}

- (void)dealloc
{
  id v3 = [MEMORY[0x263F31A18] sharedInstance];
  [v3 invalidateAllActivePlugins];

  uint64_t v4 = [MEMORY[0x263F31A18] sharedInstance];
  [v4 forceKillRemoteExtensionsWithDelay:0];

  v5.receiver = self;
  v5.super_class = (Class)IMAAppPresenter;
  [(IMAAppPresenter *)&v5 dealloc];
}

- (void)appPresenterDidSelectAppWithIdentifier:(id)a3 type:(id)a4
{
  id v6 = (void *)MEMORY[0x263F4A538];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 sharedInstance];
  id v10 = [v9 balloonPluginForBundleID:v8];

  [(IMAAppPresenter *)self notifyDelegateOfSelectedPlugin:v10 type:v7];
}

- (void)appPresenterDidSelectAppWithIdentifier:(id)a3
{
  uint64_t v4 = (void *)MEMORY[0x263F4A538];
  id v5 = a3;
  id v6 = [v4 sharedInstance];
  id v7 = [v6 balloonPluginForBundleID:v5];

  [(IMAAppPresenter *)self notifyDelegateOfSelectedPlugin:v7];
}

- (void)notifyDelegateOfSelectedPlugin:(id)a3 type:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = [v12 extension];
    if (v7)
    {
      if (_os_feature_enabled_impl()) {
        id v8 = v12;
      }
      else {
        id v8 = v7;
      }
      v9 = [v8 identifier];
    }
    else
    {
      id v10 = [v12 appBundle];
      v9 = [v10 bundleIdentifier];
    }
  }
  else
  {
    v9 = [v12 identifier];
  }
  v11 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v11 didSelectAppWithBundleIdentifier:v9 type:v6];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v11 didSelectAppWithBundleIdentifier:v9];
  }
}

- (void)notifyDelegateOfSelectedPlugin:(id)a3
{
}

- (BOOL)isAppCardsEnabled
{
  return MEMORY[0x270F15BF8](self, a2);
}

- (void)presentAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  if ([(IMAAppPresenter *)self isAppCardsEnabled]) {
    [(IMAAppPresenter *)self _presentAppCardWithBundleIdentifier:v7 completion:v6];
  }
  else {
    [(IMAAppPresenter *)self _presentAppWithBundleIdentifier:v7 completion:v6];
  }
}

- (void)_presentAppCardWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(IMAAppPresenter *)self _presentAppCardWithBundleIdentifier:v7 style:[(IMAAppPresenter *)self alwaysPresentAppsExpanded] completion:v6];
}

- (void)_presentAppCardWithBundleIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [(IMAAppPresenter *)self appCardPresentationOverseer];
  v11 = [MEMORY[0x263F4A538] sharedInstance];
  id v12 = [v11 balloonPluginForBundleID:v9];

  v13 = [v10 updateCurrentBrowserForPlugin:v12 dataSource:0 pluginContext:0];
  v14 = [v13 view];
  [v14 setNeedsLayout];
  [v14 layoutIfNeeded];
  objc_storeStrong((id *)&self->_currentBalloonPlugin, v12);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __72__IMAAppPresenter__presentAppCardWithBundleIdentifier_style_completion___block_invoke;
  v17[3] = &unk_264893960;
  v17[4] = self;
  id v18 = v12;
  id v19 = v8;
  id v15 = v8;
  id v16 = v12;
  [v10 presentCardWithStyle:a4 animated:1 completion:v17];
}

uint64_t __72__IMAAppPresenter__presentAppCardWithBundleIdentifier_style_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyDelegateOfSelectedPlugin:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)_presentAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x263F4A538];
  id v8 = a3;
  id v9 = [v7 sharedInstance];
  id v10 = [v9 balloonPluginForBundleID:v8];

  v11 = [(IMAAppPresenter *)self delegate];
  if ([(IMAAppPresenter *)self alwaysPresentAppsExpanded]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    transitionCoordinator = self->_transitionCoordinator;
    if (!transitionCoordinator)
    {
      v13 = (CKBrowserTransitionCoordinator *)objc_alloc_init(MEMORY[0x263F31A50]);
      v14 = self->_transitionCoordinator;
      self->_transitionCoordinator = v13;

      [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator setSendDelegate:self];
      id v15 = self->_transitionCoordinator;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v17 = [WeakRetained dockPresentationViewController];
      [(CKBrowserTransitionCoordinator *)v15 setPresentingViewController:v17];

      [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator setDelegate:self];
      [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator setExpanded:1 withReason:2];
      transitionCoordinator = self->_transitionCoordinator;
    }
    [(CKBrowserTransitionCoordinator *)transitionCoordinator releaseOwnershipOfBrowserForConsumer:2];
    [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator updateBrowserSessionForPlugin:v10 datasource:0];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke;
    v43[3] = &unk_264893960;
    v43[4] = self;
    id v18 = v10;
    id v44 = v18;
    id v45 = v6;
    id v19 = (void (**)(void))MEMORY[0x230F45670](v43);
    v20 = [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator requestOwnershipOfBrowserForConsumer:2];
    expandedAppViewController = self->_expandedAppViewController;
    if (expandedAppViewController)
    {
      [(CKExpandedAppViewController *)expandedAppViewController setContentViewController:v20];
      v19[2](v19);
    }
    else
    {
      v27 = (CKExpandedAppViewController *)[objc_alloc(MEMORY[0x263F31A70]) initWithConversation:0 plugin:v18];
      v28 = self->_expandedAppViewController;
      self->_expandedAppViewController = v27;

      [(CKExpandedAppViewController *)self->_expandedAppViewController setDelegate:self];
      [(CKExpandedAppViewController *)self->_expandedAppViewController setAddsVerticalPaddingForStatusBar:0];
      [(CKExpandedAppViewController *)self->_expandedAppViewController setUsesDimmingView:0];
      [(CKExpandedAppViewController *)self->_expandedAppViewController setFadesOutDuringStickerDrag:1];
      [(IMAAppPresenter *)self alwaysExpandedAppViewControllerFrame];
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
      double v36 = v35;
      v37 = [(CKExpandedAppViewController *)self->_expandedAppViewController view];
      objc_msgSend(v37, "setFrame:", v30, v32, v34, v36);

      v38 = [(CKExpandedAppViewController *)self->_expandedAppViewController view];
      [v38 setClipsToBounds:1];

      v39 = [(CKExpandedAppViewController *)self->_expandedAppViewController view];
      v40 = [v39 layer];
      [v40 setCornerRadius:12.0];

      [(CKExpandedAppViewController *)self->_expandedAppViewController addNewGrabberView];
      [(CKExpandedAppViewController *)self->_expandedAppViewController setContentViewController:v20];
      [v11 presentExpandedAppViewController:self->_expandedAppViewController animated:1 completion:v19];
    }

    v25 = v44;
    goto LABEL_12;
  }
  if ([(IMAAppPresenter *)self addSwitcher])
  {
    [(IMAAppPresenter *)self positionSwitcherOffscreen:1];
    v22 = [(IMAAppPresenter *)self switcherViewController];
    v23 = [v22 view];

    [v23 setNeedsLayout];
    [v23 layoutIfNeeded];

    v24 = [(IMAAppPresenter *)self switcherViewController];
    [v24 showBrowserInSwitcherForPlugin:v10 datasource:0 reloadData:0];

    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke_2;
    v41[3] = &unk_264893988;
    id v42 = v6;
    [(IMAAppPresenter *)self animateSwitcherOffscreen:0 completion:v41];
    v25 = v42;
LABEL_12:

    goto LABEL_13;
  }
  v26 = [(IMAAppPresenter *)self switcherViewController];
  [v26 showBrowserInSwitcherForPlugin:v10 datasource:0 reloadData:0];

LABEL_13:
}

uint64_t __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) notifyDelegateOfSelectedPlugin:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

uint64_t __62__IMAAppPresenter__presentAppWithBundleIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)presentFullScreenModalAppWithBundleIdentifier:(id)a3 completion:(id)a4
{
  id v6 = (void *)MEMORY[0x263F4A538];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedInstance];
  id v12 = [v9 balloonPluginForBundleID:v8];

  id v10 = (CKBrowserTransitionCoordinator *)objc_alloc_init(MEMORY[0x263F31A50]);
  transitionCoordinator = self->_transitionCoordinator;
  self->_transitionCoordinator = v10;

  [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator setSendDelegate:self];
  [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator setDelegate:self];
  -[CKBrowserTransitionCoordinator presentPluginFullScreenModal:preferredContentSize:animated:completion:](self->_transitionCoordinator, "presentPluginFullScreenModal:preferredContentSize:animated:completion:", v12, 1, v7, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)presentPopoverAppWithBundleIdentifier:(id)a3 sourceRect:(CGRect)a4 inView:(id)a5 completion:(id)a6
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(IMAAppPresenter *)self appCardPresentationOverseer];
  v17 = [MEMORY[0x263F4A538] sharedInstance];
  id v18 = [v17 balloonPluginForBundleID:v15];

  id v19 = [v16 updateCurrentBrowserForPlugin:v18 dataSource:0 pluginContext:0];
  v20 = [v19 view];
  [v20 setNeedsLayout];
  [v20 layoutIfNeeded];
  objc_storeStrong((id *)&self->_currentBalloonPlugin, v18);
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __86__IMAAppPresenter_presentPopoverAppWithBundleIdentifier_sourceRect_inView_completion___block_invoke;
  v23[3] = &unk_264893960;
  v23[4] = self;
  id v24 = v18;
  id v25 = v13;
  id v21 = v13;
  id v22 = v18;
  objc_msgSend(v16, "presentPopoverFromView:sourceRect:completion:", v14, v23, x, y, width, height);
}

uint64_t __86__IMAAppPresenter_presentPopoverAppWithBundleIdentifier_sourceRect_inView_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) notifyDelegateOfSelectedPlugin:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)updatePopoverWindowLocation:(CGRect)a3 inView:(id)a4 completion:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v10 = a5;
  id v11 = [(IMAAppPresenter *)self appCardPresentationOverseer];
  objc_msgSend(v11, "updatePopoverLocation:completion:", v10, x, y, width, height);
}

- (UIViewController)currentAppViewController
{
  v2 = self->_currentBalloonPlugin;
  if (v2
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([(IMBalloonPlugin *)v2 extension],
        id v3 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v3))
  {
    id v6 = [MEMORY[0x263F31A18] sharedInstance];
    id v7 = [(IMBalloonPlugin *)v2 identifier];
    id v8 = [v6 existingViewControllerForPluginIdentifier:v7];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v4 = [v8 remoteViewController];
    }
    else
    {
      uint64_t v4 = 0;
    }
  }
  else
  {
    uint64_t v4 = 0;
  }

  return (UIViewController *)v4;
}

- (void)hideAppViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke;
  v13[3] = &unk_2648939B0;
  v13[4] = self;
  id v7 = v6;
  id v14 = v7;
  id v8 = (void *)MEMORY[0x230F45670](v13);
  if ([(IMAAppPresenter *)self alwaysPresentAppsExpanded])
  {
    id v9 = [(IMAAppPresenter *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      expandedAppViewController = self->_expandedAppViewController;
      v11[0] = MEMORY[0x263EF8330];
      v11[1] = 3221225472;
      v11[2] = __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke_2;
      v11[3] = &unk_2648939B0;
      v11[4] = self;
      id v12 = v8;
      [v9 dismissExpandedAppViewController:expandedAppViewController animated:v4 completion:v11];
    }
    else
    {
      _IMWarn();
    }
  }
  else if ([(CKBrowserTransitionCoordinator *)self->_transitionCoordinator currentConsumer] == 2)
  {
    [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator dismissCurrentExpandedBrowserAnimated:v4 completion:v8];
  }
  else if ([(IMAAppPresenter *)self isAppCardsEnabled])
  {
    [(IMAAppPresenter *)self _hideAppCardAnimated:v4 completion:v8];
  }
  else
  {
    [(IMAAppPresenter *)self _hideCompactBrowserAnimated:v4 completion:v8];
  }
}

uint64_t __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  [*(id *)(a1 + 32) notifyDelegateOfSelectedPlugin:*(void *)(*(void *)(a1 + 32) + 16)];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

uint64_t __60__IMAAppPresenter_hideAppViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 32) releaseOwnershipOfBrowserForConsumer:2];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  BOOL v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

- (void)_hideCompactBrowserAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(IMAAppPresenter *)self switcherViewController];
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  id v14 = __58__IMAAppPresenter__hideCompactBrowserAnimated_completion___block_invoke;
  id v15 = &unk_2648939D8;
  id v16 = v7;
  id v17 = v6;
  id v8 = v6;
  id v9 = v7;
  uint64_t v10 = MEMORY[0x230F45670](&v12);
  id v11 = (void *)v10;
  if (v4) {
    -[IMAAppPresenter animateSwitcherOffscreen:completion:](self, "animateSwitcherOffscreen:completion:", 1, v10, v12, v13, v14, v15, v16, v17);
  }
  else {
    (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
  }
}

void __58__IMAAppPresenter__hideCompactBrowserAnimated_completion___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) view];
  [v3 setNeedsLayout];
  [*(id *)(a1 + 32) willMoveToParentViewController:0];
  [v3 removeFromSuperview];
  [*(id *)(a1 + 32) removeFromParentViewController];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
}

- (void)_hideAppCardAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(IMAAppPresenter *)self appCardPresentationOverseer];
  [v7 dismissCardAnimated:v4 completion:v6];
}

- (void)updateAppFrameForRotation
{
  [(IMAAppPresenter *)self updateSwitcherViewFrame];
  id v4 = [(IMAAppPresenter *)self switcherViewController];
  id v3 = [v4 view];
  [v3 layoutIfNeeded];
}

- (id)appViewControllerPresenter
{
  uint64_t v2 = [(IMAAppPresenter *)self delegate];
  id v3 = [v2 dockPresentationViewController];

  return v3;
}

- (double)switcherHeight
{
  [(IMAAppPresenter *)self compactHeight];
  if (v3 != 0.0) {
    return v3;
  }
  id v4 = [MEMORY[0x263F31AB0] sharedBehaviors];
  [v4 browserSwitcherExpandedGrabberHeaderHeight];
  double v6 = v5 + 159.0;

  id v7 = [MEMORY[0x263F1C920] mainScreen];
  [v7 _referenceBounds];
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = v9 == 414.0 && v11 == 896.0;
  if (v12 || v9 == 428.0 && v11 == 926.0) {
    double v6 = v6 + 23.0;
  }
  if ([(IMAAppPresenter *)self isAppCardsEnabled])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v14 = [WeakRetained dockPresentationViewController];
    id v15 = [v14 view];
    [v15 safeAreaInsets];
    double v6 = v6 - v16;
  }
  return v6;
}

- (CKBrowserSwitcherViewController)switcherViewController
{
  switcherViewController = self->_switcherViewController;
  if (!switcherViewController)
  {
    id v4 = objc_alloc(MEMORY[0x263F31A48]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v6 = [WeakRetained dockPresentationViewController];
    id v7 = (CKBrowserSwitcherViewController *)[v4 initWithConversation:0 sendDelegate:self presentingViewController:v6];
    double v8 = self->_switcherViewController;
    self->_switcherViewController = v7;

    [(CKBrowserSwitcherViewController *)self->_switcherViewController setDelegate:self];
    double v9 = [(CKBrowserSwitcherViewController *)self->_switcherViewController transitionCoordinator];
    transitionCoordinator = self->_transitionCoordinator;
    self->_transitionCoordinator = v9;

    switcherViewController = self->_switcherViewController;
  }
  return switcherViewController;
}

- (CKAppCardPresentationOverseer)appCardPresentationOverseer
{
  appCardPresentationOverseer = self->_appCardPresentationOverseer;
  if (!appCardPresentationOverseer)
  {
    id v4 = objc_alloc(MEMORY[0x263F31A08]);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    double v6 = [WeakRetained dockPresentationViewController];
    id v7 = (CKAppCardPresentationOverseer *)[v4 initWithPresentingViewController:v6 sendDelegate:self];
    double v8 = self->_appCardPresentationOverseer;
    self->_appCardPresentationOverseer = v7;

    [(CKAppCardPresentationOverseer *)self->_appCardPresentationOverseer setDelegate:self];
    appCardPresentationOverseer = self->_appCardPresentationOverseer;
  }
  return appCardPresentationOverseer;
}

- (BOOL)addSwitcher
{
  double v3 = [(IMAAppPresenter *)self switcherViewController];
  id v4 = [v3 parentViewController];

  if (!v4)
  {
    double v5 = [(IMAAppPresenter *)self appViewControllerPresenter];
    [v5 addChildViewController:v3];

    double v6 = [v3 view];
    [v6 setBackgroundColor:0];

    id v7 = [v3 contentView];
    [v7 setBackgroundColor:0];

    double v8 = [v3 view];
    double v9 = [(IMAAppPresenter *)self appViewControllerPresenter];
    double v10 = [v9 view];
    [v10 addSubview:v8];

    [(IMAAppPresenter *)self updateSwitcherViewFrame];
    double v11 = [(IMAAppPresenter *)self appViewControllerPresenter];
    [v3 didMoveToParentViewController:v11];
  }
  return v4 == 0;
}

- (void)updateSwitcherViewFrame
{
  if (![(IMAAppPresenter *)self isAppCardsEnabled])
  {
    double v3 = [(IMAAppPresenter *)self appViewControllerPresenter];
    id v4 = [v3 view];
    [v4 bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;

    [(IMAAppPresenter *)self switcherHeight];
    double v14 = v13;
    v20.origin.double x = v6;
    v20.origin.double y = v8;
    v20.size.double width = v10;
    v20.size.double height = v12;
    CGFloat v15 = CGRectGetMaxY(v20) - v14;
    v21.origin.double x = v6;
    v21.origin.double y = v8;
    v21.size.double width = v10;
    v21.size.double height = v12;
    double Width = CGRectGetWidth(v21);
    id v18 = [(IMAAppPresenter *)self switcherViewController];
    id v17 = [v18 view];
    objc_msgSend(v17, "setFrame:", 0.0, v15, Width, v14);
  }
}

- (void)animateSwitcherOffscreen:(BOOL)a3 completion:(id)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__IMAAppPresenter_animateSwitcherOffscreen_completion___block_invoke;
  v4[3] = &unk_264893A00;
  v4[4] = self;
  BOOL v5 = a3;
  [MEMORY[0x263F1CB60] animateWithDuration:0 delay:v4 usingSpringWithDamping:a4 initialSpringVelocity:0.3 options:0.3 animations:1.0 completion:0.0];
}

uint64_t __55__IMAAppPresenter_animateSwitcherOffscreen_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) positionSwitcherOffscreen:*(unsigned __int8 *)(a1 + 40)];
}

- (void)positionSwitcherOffscreen:(BOOL)a3
{
  double v4 = 0.0;
  if (!a3)
  {
    [(IMAAppPresenter *)self switcherHeight];
    double v4 = v5;
  }
  CGFloat v6 = [(IMAAppPresenter *)self switcherViewController];
  double v7 = [v6 view];
  [v7 frame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [(IMAAppPresenter *)self appViewControllerPresenter];
  CGFloat v15 = [v14 view];
  [v15 bounds];
  CGFloat v16 = CGRectGetMaxY(v20) - v4;

  id v18 = [(IMAAppPresenter *)self switcherViewController];
  id v17 = [v18 view];
  objc_msgSend(v17, "setFrame:", v9, v16, v11, v13);
}

- (BOOL)isAppCompact
{
  return [(CKBrowserTransitionCoordinator *)self->_transitionCoordinator currentConsumer] == 1;
}

- (BOOL)isSwitcherOffscreen
{
  if (![(IMAAppPresenter *)self isAppCompact]) {
    return 0;
  }
  double v3 = [(IMAAppPresenter *)self switcherViewController];
  double v4 = [v3 view];
  [v4 frame];
  double MinY = CGRectGetMinY(v10);
  CGFloat v6 = [(IMAAppPresenter *)self appViewControllerPresenter];
  double v7 = [v6 view];
  [v7 bounds];
  BOOL v8 = MinY >= CGRectGetMaxY(v11);

  return v8;
}

- (void)startEditingPayload:(id)a3 dismiss:(BOOL)a4
{
  id v7 = [a3 fileURL];
  if (v7)
  {
    double v5 = [[IMASticker alloc] initWithFileURL:v7 stickerName:0 accessibilityLabel:0 representations:0];
    CGFloat v6 = [(IMAAppPresenter *)self delegate];
    [v6 addSticker:v5];
  }
}

- (void)dismissAndReloadInputViews:(BOOL)a3
{
}

- (void)dismissAndReloadInputViews:(BOOL)a3 forPlugin:(id)a4
{
  double v5 = [(IMAAppPresenter *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  BOOL v7 = [(IMAAppPresenter *)self isAppCardsEnabled];
  transitionCoordinator = self->_transitionCoordinator;
  if (!v7 || transitionCoordinator)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke_2;
    v9[3] = &unk_264893A00;
    char v10 = v6 & 1;
    v9[4] = self;
    [(CKBrowserTransitionCoordinator *)transitionCoordinator dismissCurrentFullScreenModalAnimated:1 completion:v9];
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke;
    v11[3] = &unk_264893A00;
    char v12 = v6 & 1;
    v11[4] = self;
    [(IMAAppPresenter *)self _hideAppCardAnimated:1 completion:v11];
  }
}

void __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 appPresenterCardDidDismiss:*(void *)(a1 + 32)];
  }
}

void __56__IMAAppPresenter_dismissAndReloadInputViews_forPlugin___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40))
  {
    id v2 = [*(id *)(a1 + 32) delegate];
    [v2 appPresenterDidDismissFullscreenModal:*(void *)(a1 + 32)];
  }
  uint64_t v3 = *(void *)(a1 + 32);
  double v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;

  uint64_t v5 = *(void *)(a1 + 32);
  char v6 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = 0;
}

- (void)dismiss
{
}

- (void)requestPresentationStyleExpanded:(BOOL)a3
{
  BOOL v3 = a3;
  if (![(IMAAppPresenter *)self alwaysPresentAppsExpanded])
  {
    if ([(IMAAppPresenter *)self isAppCardsEnabled])
    {
      id v5 = [(IMAAppPresenter *)self appCardPresentationOverseer];
      [v5 requestPresentationStyle:v3];
    }
    else if (v3)
    {
      id v5 = [(IMAAppPresenter *)self switcherViewController];
      [v5 transitionToFullscreen];
    }
    else
    {
      [(IMAAppPresenter *)self addSwitcher];
      id v5 = [(IMAAppPresenter *)self switcherViewController];
      [v5 transitionToCollapsed];
    }
  }
}

- (void)requestPresentationStyleFullScreenModalForPlugin:(id)a3 preferredContentSize:(CGSize)a4
{
  id v5 = (void *)MEMORY[0x263F4A538];
  id v6 = a3;
  BOOL v7 = [v5 sharedInstance];
  id v9 = [v7 balloonPluginForBundleID:v6];

  BOOL v8 = [(IMAAppPresenter *)self switcherViewController];
  objc_msgSend(v8, "showBrowserFullscreenModalForPlugin:datasource:preferredContentSize:", v9, 0, *MEMORY[0x263F001B0], *(double *)(MEMORY[0x263F001B0] + 8));
}

- (void)commitSticker:(id)a3 stickerFrame:(CGRect)a4
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__IMAAppPresenter_commitSticker_stickerFrame___block_invoke;
  v4[3] = &unk_264893A28;
  v4[4] = self;
  [(IMAAppPresenter *)self convertIMSticker:a3 bakeInEffect:1 completion:v4];
}

void __46__IMAAppPresenter_commitSticker_stickerFrame___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 delegate];
  [v4 addSticker:v3];
}

- (void)commitSticker:(id)a3 withDragTarget:(id)a4 draggedSticker:(id)a5
{
  id v7 = a4;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __63__IMAAppPresenter_commitSticker_withDragTarget_draggedSticker___block_invoke;
  v9[3] = &unk_264893A50;
  id v10 = v7;
  CGRect v11 = self;
  id v8 = v7;
  [(IMAAppPresenter *)self convertIMSticker:a3 bakeInEffect:0 completion:v9];
}

void __63__IMAAppPresenter_commitSticker_withDragTarget_draggedSticker___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [IMADropTarget alloc];
  [*(id *)(a1 + 32) screenCoordinate];
  double v6 = v5;
  double v8 = v7;
  [*(id *)(a1 + 32) initialSize];
  double v10 = v9;
  double v12 = v11;
  [*(id *)(a1 + 32) scale];
  double v14 = v13;
  [*(id *)(a1 + 32) meshScaleFactor];
  double v16 = v15;
  [*(id *)(a1 + 32) rotation];
  id v19 = -[IMADropTarget initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:](v4, "initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:", v6, v8, v10, v12, v14, v16, v17);
  id v18 = [*(id *)(a1 + 40) delegate];
  [v18 addSticker:v3 atDropTarget:v19];
}

- (void)convertIMSticker:(id)a3 bakeInEffect:(BOOL)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  double v10 = [v8 representations];
  dispatch_group_t v11 = dispatch_group_create();
  double v12 = dispatch_get_global_queue(2, 0);
  uint64_t v13 = [v8 stickerEffectType];
  if (v13)
  {
    double v14 = [MEMORY[0x263F847F8] effectWithType:v13];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke;
    block[3] = &unk_264893AC8;
    BOOL v23 = a4;
    id v17 = v10;
    id v18 = v11;
    id v19 = v14;
    CGRect v20 = self;
    id v21 = v8;
    id v22 = v9;
    id v15 = v14;
    dispatch_async(v12, block);
  }
  else
  {
    id v15 = [(IMAAppPresenter *)self convertStickerToIMASticker:v8];
    (*((void (**)(id, id))v9 + 2))(v9, v15);
  }
}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 80))
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_2;
    v8[3] = &unk_264893AA0;
    id v2 = *(void **)(a1 + 32);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    [v2 enumerateObjectsUsingBlock:v8];
  }
  id v3 = *(NSObject **)(a1 + 40);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_4;
  block[3] = &unk_264893960;
  id v4 = *(void **)(a1 + 64);
  void block[4] = *(void *)(a1 + 56);
  id v6 = v4;
  id v7 = *(id *)(a1 + 72);
  dispatch_group_notify(v3, MEMORY[0x263EF83A0], block);
}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 role];
  int v5 = [v4 isEqualToString:@"com.apple.stickers.role.still"];

  if (v5)
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    id v6 = objc_alloc(MEMORY[0x263F1C6B0]);
    id v7 = [v3 data];
    id v8 = (void *)[v6 initWithData:v7];

    id v9 = [v3 type];
    id v10 = [(id)*MEMORY[0x263F1DC08] identifier];
    char v11 = [v9 isEqualToString:v10];

    double v12 = *(void **)(a1 + 40);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_3;
    v13[3] = &unk_264893A78;
    id v14 = v3;
    char v16 = v11;
    id v15 = *(id *)(a1 + 32);
    [v12 applyToImage:v8 completion:v13];
  }
}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_3(uint64_t a1, void *a2)
{
  if (*(unsigned char *)(a1 + 48)) {
    objc_msgSend(a2, "__ck_pngImageData");
  }
  else {
  id v3 = objc_msgSend(a2, "__ck_heicsImageData");
  }
  [*(id *)(a1 + 32) setData:v3];

  id v4 = *(NSObject **)(a1 + 40);
  dispatch_group_leave(v4);
}

void __60__IMAAppPresenter_convertIMSticker_bakeInEffect_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) convertStickerToIMASticker:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)convertStickerToIMASticker:(id)a3
{
  id v3 = a3;
  id v4 = [IMASticker alloc];
  id v19 = [v3 stickerGUID];
  id v18 = [v3 fileURL];
  id v17 = [v3 representations];
  uint64_t v15 = [v3 stickerEffectType];
  if (v15 == -1)
  {
    char v16 = 0;
  }
  else
  {
    char v16 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "stickerEffectType"));
  }
  int v5 = [v3 externalURI];
  id v6 = [v3 stickerName];
  id v7 = [v3 accessibilityLabel];
  id v8 = [v3 accessibilityName];
  id v9 = [v3 searchText];
  id v10 = [v3 sanitizedPrompt];
  char v11 = [v3 metadata];
  double v12 = [v3 attributionInfo];
  uint64_t v13 = [(IMASticker *)v4 initWithStickerIdentifier:v19 fileURL:v18 representations:v17 effectType:v16 externalURI:v5 stickerName:v6 accessibilityLabel:v7 accessibilityName:v8 searchText:v9 sanitizedPrompt:v10 metadata:v11 ckAttributionInfo:v12];

  if (v15 != -1) {
  return v13;
  }
}

- (BOOL)presentsStickerPickerInPopover
{
  id v3 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [(IMAAppPresenter *)self delegate];
  }
  else {
  id v4 = [MEMORY[0x263F1C920] mainScreen];
  }
  int v5 = [v4 traitCollection];

  id v6 = [MEMORY[0x263F1C5C0] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  BOOL v8 = (v7 & 0xFFFFFFFFFFFFFFFBLL) == 1 && [v5 horizontalSizeClass] != 1;
  return v8;
}

- (void)stickerDruidDragStarted
{
}

- (void)stickerDruidDragEndedWithIMSticker:(id)a3
{
  id v4 = a3;
  int v5 = [(IMAAppPresenter *)self appCardPresentationOverseer];
  if ([v5 isPresentingCard])
  {
    id v6 = [(IMAAppPresenter *)self savedStickerPresentationContext];
    [v6 setStickerForDeferredRePresentation:v4];

    uint64_t v7 = [(IMAAppPresenter *)self savedStickerPresentationContext];
    [v7 setDeferredPresentation:1];

    goto LABEL_15;
  }
  [MEMORY[0x263F31A58] donateStickerToRecents:v4];
  BOOL v8 = IMStickersExtensionIdentifier();
  id v9 = IMBalloonExtensionIDWithSuffix();

  id v10 = [(IMAAppPresenter *)self savedStickerPresentationContext];
  [v10 setStickerPickerContainer:0];

  BOOL v11 = [(IMAAppPresenter *)self presentsStickerPickerInPopover];
  double v12 = [(IMAAppPresenter *)self savedStickerPresentationContext];
  uint64_t v13 = v12;
  if (!v11)
  {
    [(IMAAppPresenter *)self _presentAppCardWithBundleIdentifier:v9 style:[v12 style] completion:&__block_literal_global_189];
LABEL_9:

    goto LABEL_10;
  }
  id v14 = [v12 sourceView];

  if (!v14)
  {
    uint64_t v13 = [(IMAAppPresenter *)self logHandle];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[IMAAppPresenter stickerDruidDragEndedWithIMSticker:](v13, v26, v27, v28, v29, v30, v31, v32);
    }
    goto LABEL_9;
  }
  uint64_t v15 = [(IMAAppPresenter *)self savedStickerPresentationContext];
  char v16 = [v15 sourceView];

  id v17 = [(IMAAppPresenter *)self savedStickerPresentationContext];
  [v17 sourceRect];
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;

  -[IMAAppPresenter presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:](self, "presentPopoverAppWithBundleIdentifier:sourceRect:inView:completion:", v9, v16, &__block_literal_global_187, v19, v21, v23, v25);
LABEL_10:
  id v33 = *(id *)MEMORY[0x230F45400]("CKPluginExtensionStateObserverStickerDragEnded", @"ChatKit");
  if (v33)
  {
    double v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 postNotificationName:v33 object:self];
  }
  else
  {
    double v34 = [(IMAAppPresenter *)self logHandle];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      -[IMAAppPresenter stickerDruidDragEndedWithIMSticker:](v34, v35, v36, v37, v38, v39, v40, v41);
    }
  }

LABEL_15:
}

- (void)canShowBrowserForPluginIdentifier:(id)a3 completion:(id)a4
{
}

- (void)showBrowserForPluginIdentifier:(id)a3 style:(unint64_t)a4 completion:(id)a5
{
  id v9 = a5;
  if ([a3 isEqualToString:*MEMORY[0x263F4A9D0]])
  {
    id v6 = (void *)[objc_alloc(NSURL) initWithString:@"itms-appss://apps.apple.com/genre/ios-stickers/id6025"];
    uint64_t v7 = [MEMORY[0x263F1C408] sharedApplication];
    [v7 openURL:v6];
  }
  BOOL v8 = v9;
  if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
    BOOL v8 = v9;
  }
}

- (void)dragManagerDidBeginDragging:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F31A80], "sharedTimer", a3);
  [v4 setShouldStopWhenBackgrounded:0];

  if ([(IMAAppPresenter *)self hidesCompactAppForStickerDrag]
    && [(IMAAppPresenter *)self isAppCompact])
  {
    [(IMAAppPresenter *)self animateSwitcherOffscreen:1 completion:0];
  }
  id v5 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didBeginDraggingSticker];
  }
}

- (void)dragManager:(id)a3 draggedItemWithTarget:(id)a4
{
  id v36 = a3;
  id v6 = a4;
  uint64_t v7 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v8 = [IMADropTarget alloc];
    [v6 screenCoordinate];
    double v10 = v9;
    double v12 = v11;
    [v6 initialSize];
    double v14 = v13;
    double v16 = v15;
    [v6 scale];
    double v18 = v17;
    [v6 meshScaleFactor];
    double v20 = v19;
    [v6 rotation];
    double v22 = -[IMADropTarget initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:](v8, "initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:", v10, v12, v14, v16, v18, v20, v21);
    double v23 = [(IMAAppPresenter *)self switcherViewController];
    double v24 = [v23 view];
    [v24 frame];
    CGFloat v26 = v25;
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    [v6 screenCoordinate];
    v38.double x = v33;
    v38.double y = v34;
    v39.origin.double x = v26;
    v39.origin.double y = v28;
    v39.size.double width = v30;
    v39.size.double height = v32;
    BOOL v35 = CGRectContainsPoint(v39, v38);

    [v7 didDragStickerToTarget:v22 outsideSwitcher:v35 ^ 1];
    [v36 setPlusButtonHidden:v35];
  }
}

- (void)dragManagerDidEndDragging:(id)a3
{
  id v4 = objc_msgSend(MEMORY[0x263F31A80], "sharedTimer", a3);
  [v4 setShouldStopWhenBackgrounded:1];

  if ([(IMAAppPresenter *)self hidesCompactAppForStickerDrag]
    && [(IMAAppPresenter *)self isSwitcherOffscreen])
  {
    [(IMAAppPresenter *)self animateSwitcherOffscreen:0 completion:0];
  }
  id v5 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 didEndDraggingSticker];
  }
}

- (int)dragManager:(id)a3 dropAreaForDragTarget:(id)a4
{
  id v5 = a4;
  if (![(IMAAppPresenter *)self isAppCompact]) {
    goto LABEL_5;
  }
  if ([(IMAAppPresenter *)self isSwitcherOffscreen]) {
    goto LABEL_5;
  }
  id v6 = [(IMAAppPresenter *)self switcherViewController];
  uint64_t v7 = [v6 view];

  uint64_t v8 = [v7 superview];
  [v7 frame];
  objc_msgSend((id)v8, "convertRect:toView:", 0);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  [v5 screenCoordinate];
  v37.double x = v17;
  v37.double y = v18;
  v38.origin.double x = v10;
  v38.origin.double y = v12;
  v38.size.double width = v14;
  v38.size.double height = v16;
  LOBYTE(v8) = CGRectContainsPoint(v38, v37);

  if (v8)
  {
    int v19 = 3;
  }
  else
  {
LABEL_5:
    double v20 = [IMADropTarget alloc];
    [v5 screenCoordinate];
    double v22 = v21;
    double v24 = v23;
    [v5 initialSize];
    double v26 = v25;
    double v28 = v27;
    [v5 scale];
    double v30 = v29;
    [v5 meshScaleFactor];
    double v32 = v31;
    [v5 rotation];
    CGFloat v34 = -[IMADropTarget initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:](v20, "initWithScreenCoordinate:initialSize:scale:meshScaleFactor:rotation:", v22, v24, v26, v28, v30, v32, v33);
    BOOL v35 = [(IMAAppPresenter *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v35 isDropTargetValid:v34] & 1) == 0)
    {
      if ([(IMAAppPresenter *)self hidesCompactAppForStickerDrag]
        && [(IMAAppPresenter *)self isAppCompact])
      {
        [(IMAAppPresenter *)self animateSwitcherOffscreen:0 completion:0];
      }
      int v19 = 1;
    }
    else
    {
      int v19 = 5;
    }
  }
  return v19;
}

- (void)dragManager:(id)a3 overrideDropPointForTarget:(id)a4 completion:(id)a5
{
  id v9 = a4;
  uint64_t v7 = (void (**)(void))a5;
  uint64_t v8 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v8 overrideDropPointWithCompletion:v7];
  }
  else
  {
    [v9 screenCoordinate];
    v7[2](v7);
  }
}

- (void)browserTransitionCoordinatorWillTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 1;
}

- (void)browserTransitionCoordinatorDidTransitionOrPresentToFullscreen:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 0;
  [(IMAAppPresenter *)self _hideCompactBrowserAnimated:0 completion:0];
}

- (void)browserTransitionCoordinatorWillCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 1;
}

- (void)browserTransitionCoordinatorDidCollapseOrDismiss:(id)a3 withReason:(int64_t)a4
{
  self->_isTransitioningPresentationStyles = 0;
}

- (CGSize)browserTransitionCoordinator:(id)a3 preferredSizeForBrowser:(id)a4
{
  if ([(IMAAppPresenter *)self alwaysPresentAppsExpanded])
  {
    [(IMAAppPresenter *)self alwaysExpandedAppViewControllerFrame];
    double v6 = v5;
    double v8 = v7;
    id v9 = [MEMORY[0x263F31AB0] sharedBehaviors];
    [v9 browserSwitcherExpandedGrabberHeaderHeight];
    double v11 = v8 - v10;
  }
  else
  {
    double v6 = *MEMORY[0x263F001B0];
    double v11 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v12 = v6;
  double v13 = v11;
  result.double height = v13;
  result.double width = v12;
  return result;
}

- (BOOL)browserTransitionCoordinatorShouldDismissOnDragSuccess:(id)a3
{
  id v3 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 expandedAppShouldDismissOnDragSuccess];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)shouldAlwaysShowAppTitle
{
  return 1;
}

- (id)transitionsPresentationViewController
{
  id v2 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [v2 dockPresentationViewController];
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

- (BOOL)shouldPresentAppCardInSendMenuWithTraitCollection:(id)a3
{
  return 0;
}

- (id)activeSendMenuPresentationForAppCardOverseer
{
  return 0;
}

- (void)appCardOverseerDidDismissAppCard
{
  id v3 = [(IMAAppPresenter *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 appPresenterCardDidDismiss:self];
  }
  char v4 = [(IMAAppPresenter *)self savedStickerPresentationContext];
  double v5 = [v4 stickerForDeferredRePresentation];

  double v6 = [(IMAAppPresenter *)self savedStickerPresentationContext];
  int v7 = [v6 deferredPresentation];

  if (v7)
  {
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    double v12 = __51__IMAAppPresenter_appCardOverseerDidDismissAppCard__block_invoke;
    double v13 = &unk_264893AF0;
    CGFloat v14 = self;
    id v15 = v5;
    dispatch_async(MEMORY[0x263EF83A0], &v10);
    double v8 = [(IMAAppPresenter *)self savedStickerPresentationContext];
    [v8 setStickerForDeferredRePresentation:0];

    id v9 = [(IMAAppPresenter *)self savedStickerPresentationContext];
    [v9 setDeferredPresentation:0];
  }
}

uint64_t __51__IMAAppPresenter_appCardOverseerDidDismissAppCard__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) stickerDruidDragEndedWithIMSticker:*(void *)(a1 + 40)];
}

- (CGRect)alwaysExpandedAppViewControllerFrame
{
  if (![(IMAAppPresenter *)self alwaysPresentAppsExpanded]) {
    goto LABEL_5;
  }
  id v3 = [(IMAAppPresenter *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_5:
    double v9 = *MEMORY[0x263F001A8];
    double v8 = *(double *)(MEMORY[0x263F001A8] + 8);
    double v5 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
    goto LABEL_6;
  }
  [v3 expandedAppViewControllerSize];
  double v5 = v4;
  double v7 = v6;

  double v8 = 0.0;
  double v9 = 0.0;
LABEL_6:
  double v10 = v5;
  double v11 = v7;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.double y = v8;
  result.origin.double x = v9;
  return result;
}

- (void)switcherViewControllerDidFinishSwitching:(id)a3 toViewController:(id)a4
{
  objc_msgSend(a4, "balloonPlugin", a3);
  p_currentBalloonPlugin = (id *)objc_claimAutoreleasedReturnValue();
  double v6 = (IMBalloonPlugin *)p_currentBalloonPlugin;
  if (!self->_isTransitioningPresentationStyles)
  {
    p_currentBalloonPlugin = (id *)&self->_currentBalloonPlugin;
    if (self->_currentBalloonPlugin != v6)
    {
      double v7 = v6;
      objc_storeStrong(p_currentBalloonPlugin, v6);
      p_currentBalloonPlugin = (id *)[(IMAAppPresenter *)self notifyDelegateOfSelectedPlugin:self->_currentBalloonPlugin];
      double v6 = v7;
    }
  }
  MEMORY[0x270F9A758](p_currentBalloonPlugin, v6);
}

- (BOOL)switcherViewControllerShouldShowIconAndTitleWhenCompact:(id)a3
{
  return CKIsRunningInMessages() == 0;
}

- (IMAAppPresenterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (IMAAppPresenterDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)compactHeight
{
  return self->_compactHeight;
}

- (void)setCompactHeight:(double)a3
{
  self->_compactHeight = a3;
}

- (BOOL)alwaysPresentAppsExpanded
{
  return self->_alwaysPresentAppsExpanded;
}

- (void)setAlwaysPresentAppsExpanded:(BOOL)a3
{
  self->_alwaysPresentAppsExpanded = a3;
}

- (BOOL)hidesCompactAppForStickerDrag
{
  return self->_hidesCompactAppForStickerDrag;
}

- (void)setHidesCompactAppForStickerDrag:(BOOL)a3
{
  self->_hidesCompactAppForStickerDrag = a3;
}

- (void)setSwitcherViewController:(id)a3
{
}

- (void)setAppCardPresentationOverseer:(id)a3
{
}

- (IMAStickerPickerPresentationContext)savedStickerPresentationContext
{
  return self->_savedStickerPresentationContext;
}

- (void)setSavedStickerPresentationContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_savedStickerPresentationContext, 0);
  objc_storeStrong((id *)&self->_appCardPresentationOverseer, 0);
  objc_storeStrong((id *)&self->_switcherViewController, 0);
  objc_storeStrong((id *)&self->_transitionCoordinator, 0);
  objc_storeStrong((id *)&self->_expandedAppViewController, 0);
  objc_storeStrong((id *)&self->_currentBalloonPlugin, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

+ (void)disableAutomaticAppDiscovery
{
}

+ (void)loadAppWithIdentifierIfNeeded:(id)a3
{
  id v3 = (void *)MEMORY[0x263F4A538];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 loadExtensionWithIdentifierIfNeeded:v4];
}

- (id)currentStickerViewController
{
  if ([(IMAAppPresenter *)self isAppCardsEnabled])
  {
    id v3 = [(IMAAppPresenter *)self appCardPresentationOverseer];
    uint64_t v4 = [v3 browserViewController];
  }
  else
  {
    if ([(IMAAppPresenter *)self alwaysPresentAppsExpanded])
    {
      id v5 = [(CKExpandedAppViewController *)self->_expandedAppViewController contentViewController];
      goto LABEL_7;
    }
    id v3 = [(IMAAppPresenter *)self switcherViewController];
    uint64_t v4 = [v3 currentViewController];
  }
  id v5 = (void *)v4;

LABEL_7:
  return v5;
}

- (void)stickerDruidDragEndedWithIMSticker:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)stickerDruidDragEndedWithIMSticker:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end