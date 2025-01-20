@interface SFScreenTimeOverlayViewController
- (SFScreenTimeOverlayViewControllerDelegate)delegate;
- (double)additionalVerticalSafeAreaMargin;
- (id)showBlockingViewControllerForURL:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5;
- (void)_updateCurrentLockViewControllerInsetsHorizontalForSizeClass:(int64_t)a3;
- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3;
- (void)setAdditionalVerticalSafeAreaMargin:(double)a3;
- (void)setDelegate:(id)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SFScreenTimeOverlayViewController

- (id)showBlockingViewControllerForURL:(id)a3 withPolicy:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  blockingViewController = self->_blockingViewController;
  if (!blockingViewController)
  {
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2050000000;
    v10 = (void *)getSTBlockingViewControllerClass_softClass;
    uint64_t v45 = getSTBlockingViewControllerClass_softClass;
    if (!getSTBlockingViewControllerClass_softClass)
    {
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      v39 = __getSTBlockingViewControllerClass_block_invoke;
      v40 = &unk_1E54EA8A0;
      v41 = &v42;
      __getSTBlockingViewControllerClass_block_invoke((uint64_t)&v37);
      v10 = (void *)v43[3];
    }
    id v11 = v10;
    _Block_object_dispose(&v42, 8);
    v12 = (STBlockingViewController *)[v11 newTranslucentBlockingViewController];
    v13 = self->_blockingViewController;
    self->_blockingViewController = v12;

    v14 = [(STBlockingViewController *)self->_blockingViewController view];
    [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v42 = 0;
    v43 = &v42;
    uint64_t v44 = 0x2020000000;
    v16 = (void *)getSTBlockingViewDidHideNotificationSymbolLoc_ptr;
    uint64_t v45 = getSTBlockingViewDidHideNotificationSymbolLoc_ptr;
    if (!getSTBlockingViewDidHideNotificationSymbolLoc_ptr)
    {
      uint64_t v37 = MEMORY[0x1E4F143A8];
      uint64_t v38 = 3221225472;
      v39 = __getSTBlockingViewDidHideNotificationSymbolLoc_block_invoke;
      v40 = &unk_1E54EA8A0;
      v41 = &v42;
      v17 = (void *)ScreenTimeUILibrary();
      v18 = dlsym(v17, "STBlockingViewDidHideNotification");
      *(void *)(v41[1] + 24) = v18;
      getSTBlockingViewDidHideNotificationSymbolLoc_ptr = *(void *)(v41[1] + 24);
      v16 = (void *)v43[3];
    }
    _Block_object_dispose(&v42, 8);
    if (!v16)
    {
      v35 = (_Unwind_Exception *)-[SFScreenTimeOverlayViewController showBlockingViewControllerForURL:withPolicy:animated:]();
      _Block_object_dispose(&v42, 8);
      _Unwind_Resume(v35);
    }
    [v15 addObserver:self selector:sel__blockingViewDidHide_ name:*v16 object:self->_blockingViewController];

    blockingViewController = self->_blockingViewController;
  }
  [(STBlockingViewController *)blockingViewController updateAppearanceUsingPolicy:a4 forWebpageURL:v8];
  v19 = [(SFScreenTimeOverlayViewController *)self childViewControllers];
  char v20 = [v19 containsObject:self->_blockingViewController];

  if ((v20 & 1) == 0)
  {
    [(STBlockingViewController *)self->_blockingViewController beginAppearanceTransition:1 animated:v5];
    [(SFScreenTimeOverlayViewController *)self addChildViewController:self->_blockingViewController];
    v36 = [(SFScreenTimeOverlayViewController *)self view];
    v21 = [(STBlockingViewController *)self->_blockingViewController view];
    [v36 addSubview:v21];
    v22 = _NSDictionaryOfVariableBindings(&cfstr_Blockingview.isa, v21, 0);
    BOOL v23 = v5;
    id v24 = v8;
    v25 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"H:|[blockingView]|" options:0 metrics:0 views:v22];
    v26 = [MEMORY[0x1E4F28DC8] constraintsWithVisualFormat:@"V:|[blockingView]|" options:0 metrics:0 views:v22];
    v27 = (void *)MEMORY[0x1E4F28DC8];
    v28 = [v25 arrayByAddingObjectsFromArray:v26];
    v29 = v27;
    id v8 = v24;
    [v29 activateConstraints:v28];

    [(STBlockingViewController *)self->_blockingViewController didMoveToParentViewController:self];
    [(STBlockingViewController *)self->_blockingViewController endAppearanceTransition];
    [(STBlockingViewController *)self->_blockingViewController showWithAnimation:v23 completionHandler:0];
  }
  v30 = [(STBlockingViewController *)self->_blockingViewController view];
  [v30 bounds];
  double Width = CGRectGetWidth(v46);
  uint64_t v32 = _SFSizeClassForWidth(Width);

  [(SFScreenTimeOverlayViewController *)self _updateCurrentLockViewControllerInsetsHorizontalForSizeClass:v32];
  v33 = self->_blockingViewController;

  return v33;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double width = a3.width;
  v6.receiver = self;
  v6.super_class = (Class)SFScreenTimeOverlayViewController;
  -[SFScreenTimeOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v6, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(SFScreenTimeOverlayViewController *)self _updateCurrentLockViewControllerInsetsHorizontalForSizeClass:_SFSizeClassForWidth(width)];
}

- (void)_updateCurrentLockViewControllerInsetsHorizontalForSizeClass:(int64_t)a3
{
  blockingViewController = self->_blockingViewController;
  if (blockingViewController)
  {
    double additionalVerticalSafeAreaMargin = self->_additionalVerticalSafeAreaMargin;
    double v6 = additionalVerticalSafeAreaMargin + 46.0;
    if (a3 == 1) {
      double v7 = additionalVerticalSafeAreaMargin + 46.0;
    }
    else {
      double v7 = additionalVerticalSafeAreaMargin + 94.0;
    }
    if (a3 != 1) {
      double v6 = 0.0;
    }
    -[STBlockingViewController setAdditionalSafeAreaInsets:](blockingViewController, "setAdditionalSafeAreaInsets:", v7, 0.0, v6, 0.0);
  }
}

- (void)hideBlockingViewControllerWithCompletionHandler:(id)a3
{
  id v4 = a3;
  [(STBlockingViewController *)self->_blockingViewController beginAppearanceTransition:0 animated:1];
  [(STBlockingViewController *)self->_blockingViewController willMoveToParentViewController:0];
  blockingViewController = self->_blockingViewController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__SFScreenTimeOverlayViewController_hideBlockingViewControllerWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E54E9D50;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(STBlockingViewController *)blockingViewController hideWithAnimation:1 completionHandler:v7];
}

uint64_t __85__SFScreenTimeOverlayViewController_hideBlockingViewControllerWithCompletionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 984) view];
  [v2 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 984) removeFromParentViewController];
  [*(id *)(*(void *)(a1 + 32) + 984) endAppearanceTransition];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)setAdditionalVerticalSafeAreaMargin:(double)a3
{
  if (self->_additionalVerticalSafeAreaMargin != a3)
  {
    self->_double additionalVerticalSafeAreaMargin = a3;
    id v4 = [(STBlockingViewController *)self->_blockingViewController view];
    [v4 bounds];
    double Width = CGRectGetWidth(v8);
    uint64_t v6 = _SFSizeClassForWidth(Width);

    [(SFScreenTimeOverlayViewController *)self _updateCurrentLockViewControllerInsetsHorizontalForSizeClass:v6];
  }
}

- (SFScreenTimeOverlayViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (SFScreenTimeOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (double)additionalVerticalSafeAreaMargin
{
  return self->_additionalVerticalSafeAreaMargin;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_blockingViewController, 0);

  objc_storeStrong((id *)&self->_url, 0);
}

- (uint64_t)showBlockingViewControllerForURL:withPolicy:animated:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return __getSTBlockingViewControllerClass_block_invoke_cold_1(v0);
}

@end