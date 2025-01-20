@interface SFOverlayProvider
+ (BOOL)alwaysShowOverlayForDebug;
- (BOOL)isAvailable;
- (NSString)bundleIdentifier;
- (NSURL)url;
- (SFOverlayProvider)initWithURL:(id)a3 bundleIdentifier:(id)a4;
- (SFOverlayProviderDelegate)delegate;
- (UIViewController)overlayViewController;
- (_SFPerSitePreferencesVendor)_preferencesVendor;
- (void)_setPreferencesVendor:(id)a3;
- (void)cardViewControllerDidDisappear:(id)a3 clipDidOpen:(BOOL)a4 persistUserSettings:(BOOL)a5;
- (void)hideOverlayAnimated:(BOOL)a3;
- (void)setAvailable:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)showOverlayInScrollView:(id)a3 viewController:(id)a4;
- (void)webViewBackforwardGestureNavigationDidEnd;
- (void)webViewBackforwardGestureNavigationWillBegin;
@end

@implementation SFOverlayProvider

- (SFOverlayProvider)initWithURL:(id)a3 bundleIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SFOverlayProvider;
  v8 = [(SFOverlayProvider *)&v13 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    url = v8->_url;
    v8->_url = (NSURL *)v9;

    objc_storeStrong((id *)&v8->_bundleIdentifier, a4);
    v11 = v8;
  }

  return v8;
}

+ (BOOL)alwaysShowOverlayForDebug
{
  if (alwaysShowOverlayForDebug_onceToken != -1) {
    dispatch_once(&alwaysShowOverlayForDebug_onceToken, &__block_literal_global_47);
  }
  return alwaysShowOverlayForDebug_alwaysShowOverlay;
}

void __46__SFOverlayProvider_alwaysShowOverlayForDebug__block_invoke()
{
  objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  alwaysShowOverlayForDebug_alwaysShowOverlay = [v0 BOOLForKey:@"DebugAlwaysShowAppclipOverlay"];
}

- (UIViewController)overlayViewController
{
  return (UIViewController *)self->_cardViewController;
}

- (void)showOverlayInScrollView:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_available)
  {
    cardViewController = self->_cardViewController;
    if (!cardViewController)
    {
      uint64_t v22 = 0;
      v23 = &v22;
      uint64_t v24 = 0x2050000000;
      uint64_t v9 = (void *)getCPSInlineCardViewControllerClass_softClass;
      uint64_t v25 = getCPSInlineCardViewControllerClass_softClass;
      if (!getCPSInlineCardViewControllerClass_softClass)
      {
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __getCPSInlineCardViewControllerClass_block_invoke;
        v21[3] = &unk_1E54EA8A0;
        v21[4] = &v22;
        __getCPSInlineCardViewControllerClass_block_invoke((uint64_t)v21);
        uint64_t v9 = (void *)v23[3];
      }
      v10 = v9;
      _Block_object_dispose(&v22, 8);
      v11 = (CPSInlineCardViewController *)[[v10 alloc] initWithURL:self->_url];
      v12 = self->_cardViewController;
      self->_cardViewController = v11;

      cardViewController = self->_cardViewController;
    }
    objc_super v13 = [(CPSInlineCardViewController *)cardViewController view];
    [v6 addSubview:v13];

    [v7 addChildViewController:self->_cardViewController];
    [(CPSInlineCardViewController *)self->_cardViewController didMoveToParentViewController:v7];
    v14 = [(CPSInlineCardViewController *)self->_cardViewController view];
    [v14 setAlpha:0.0];
    v15 = (void *)MEMORY[0x1E4FB1EB0];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke;
    v19[3] = &unk_1E54E9858;
    id v20 = v14;
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke_2;
    v17[3] = &unk_1E54E9998;
    id v18 = v6;
    id v16 = v14;
    [v15 _animateUsingDefaultTimingWithOptions:2 animations:v19 completion:v17];
    [(CPSInlineCardViewController *)self->_cardViewController setDelegate:self];
  }
}

uint64_t __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

uint64_t __60__SFOverlayProvider_showOverlayInScrollView_viewController___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setScrollEnabled:0];
}

- (void)hideOverlayAnimated:(BOOL)a3
{
  [(CPSInlineCardViewController *)self->_cardViewController setDelegate:0];
  v5 = [(CPSInlineCardViewController *)self->_cardViewController view];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__SFOverlayProvider_hideOverlayAnimated___block_invoke;
  aBlock[3] = &unk_1E54E9A60;
  id v6 = v5;
  id v15 = v6;
  id v16 = self;
  id v7 = _Block_copy(aBlock);
  v8 = v7;
  if (a3)
  {
    uint64_t v9 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_2;
    v12[3] = &unk_1E54E9858;
    id v13 = v6;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_3;
    v10[3] = &unk_1E54E9D78;
    id v11 = v8;
    [v9 animateWithDuration:v12 animations:v10 completion:0.2];
  }
  else
  {
    (*((void (**)(void *))v7 + 2))(v7);
  }
}

void __41__SFOverlayProvider_hideOverlayAnimated___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) superview];
  if (v4)
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    v2 = [*(id *)(*(void *)(a1 + 40) + 8) parentViewController];
    [v2 removeChildViewController:*(void *)(*(void *)(a1 + 40) + 8)];

    [*(id *)(*(void *)(a1 + 40) + 8) didMoveToParentViewController:0];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 48));
    [WeakRetained overlayDidHide:*(void *)(a1 + 40)];

    [v4 setScrollEnabled:1];
  }
}

uint64_t __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __41__SFOverlayProvider_hideOverlayAnimated___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)webViewBackforwardGestureNavigationWillBegin
{
  v3 = [(CPSInlineCardViewController *)self->_cardViewController parentViewController];
  cachedOwningViewController = self->_cachedOwningViewController;
  self->_cachedOwningViewController = v3;

  [(UIViewController *)self->_cachedOwningViewController removeChildViewController:self->_cardViewController];
  cardViewController = self->_cardViewController;

  [(CPSInlineCardViewController *)cardViewController didMoveToParentViewController:0];
}

- (void)webViewBackforwardGestureNavigationDidEnd
{
  [(UIViewController *)self->_cachedOwningViewController addChildViewController:self->_cardViewController];
  [(CPSInlineCardViewController *)self->_cardViewController didMoveToParentViewController:self->_cachedOwningViewController];
  cachedOwningViewController = self->_cachedOwningViewController;
  self->_cachedOwningViewController = 0;
}

- (void)cardViewControllerDidDisappear:(id)a3 clipDidOpen:(BOOL)a4 persistUserSettings:(BOOL)a5
{
  BOOL v5 = a5;
  v8 = (CPSInlineCardViewController *)a3;
  if (self->_cardViewController == v8)
  {
    self->_available = 0;
    if (v5 && !a4)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBanners();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_18C354000, v10, OS_LOG_TYPE_INFO, "User cancelled app clip card by tapping the close button", v11, 2u);
      }
      if (objc_opt_respondsToSelector()) {
        [(SFOverlayProvider *)self _updateAppClipOverlayPreferenceHook];
      }
    }
    [(SFOverlayProvider *)self hideOverlayAnimated:1];
  }
  else
  {
    uint64_t v9 = WBS_LOG_CHANNEL_PREFIXBanners();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SFOverlayProvider cardViewControllerDidDisappear:clipDidOpen:persistUserSettings:](v9);
    }
  }
}

- (NSURL)url
{
  return self->_url;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (SFOverlayProviderDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFOverlayProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isAvailable
{
  return self->_available;
}

- (void)setAvailable:(BOOL)a3
{
  self->_available = a3;
}

- (_SFPerSitePreferencesVendor)_preferencesVendor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__preferencesVendor);

  return (_SFPerSitePreferencesVendor *)WeakRetained;
}

- (void)_setPreferencesVendor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->__preferencesVendor);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_cachedOwningViewController, 0);

  objc_storeStrong((id *)&self->_cardViewController, 0);
}

- (void)cardViewControllerDidDisappear:(os_log_t)log clipDidOpen:persistUserSettings:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18C354000, log, OS_LOG_TYPE_ERROR, "Try to hide an overlay view controller that is not in heirarchy.", v1, 2u);
}

@end