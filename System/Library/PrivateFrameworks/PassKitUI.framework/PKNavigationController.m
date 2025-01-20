@interface PKNavigationController
- (BOOL)_canShowWhileLocked;
- (PKNavigationController)init;
- (PKNavigationController)initWithCoder:(id)a3;
- (PKNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (PKNavigationController)initWithRootViewController:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_updateBarAppearanceForViewController:(id)a3 animated:(BOOL)a4;
- (void)_updateWithWallpaperImage:(id)a3;
- (void)dealloc;
- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)promptAppStoreReviewForTrigger:(unint64_t)a3;
- (void)setCustomFormSheetPresentationStyleForiPad;
- (void)setNeedsNavigationBarUpdate;
- (void)setPageSheetPresentation;
- (void)setSupportedInterfaceOrientations:(unint64_t)a3;
- (void)setupBackgroundViewWithBlurEffect:(int64_t)a3;
- (void)setupWallpaper;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation PKNavigationController

- (PKNavigationController)init
{
  v4.receiver = self;
  v4.super_class = (Class)PKNavigationController;
  v2 = [(PKNavigationController *)&v4 initWithNibName:0 bundle:0];
  if (v2)
  {
    [(PKNavigationController *)v2 setNavigationBarClass:objc_opt_class()];
    [(PKNavigationController *)v2 setDelegate:v2];
  }
  return v2;
}

- (PKNavigationController)initWithRootViewController:(id)a3
{
  id v4 = a3;
  v5 = [(PKNavigationController *)self init];
  v6 = v5;
  if (v5) {
    [(PKNavigationController *)v5 pushViewController:v4 animated:0];
  }

  return v6;
}

- (PKNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  return 0;
}

- (PKNavigationController)initWithCoder:(id)a3
{
  return 0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)PKNavigationController;
  [(PKNavigationController *)&v2 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  uint64_t v3 = objc_opt_class();

  return [(PKNavigationController *)self isMemberOfClass:v3];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PKNavigationController;
  [(PKNavigationController *)&v5 viewDidLoad];
  if (self->_backgroundView)
  {
    uint64_t v3 = [(PKNavigationController *)self view];
    [v3 insertSubview:self->_backgroundView atIndex:0];
  }
  id v4 = [(PKNavigationController *)self topViewController];
  [(PKNavigationController *)self _updateBarAppearanceForViewController:v4 animated:0];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PKNavigationController;
  [(PKNavigationController *)&v12 viewWillLayoutSubviews];
  uint64_t v3 = [(PKNavigationController *)self view];
  [v3 bounds];
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  [(UIView *)self->_backgroundView bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[UIVisualEffectView setFrame:](self->_blurView, "setFrame:");
  -[UIImageView setFrame:](self->_wallpaperView, "setFrame:", v5, v7, v9, v11);
}

- (int64_t)preferredStatusBarStyle
{
  if (self->_hasStatusBarStyleOverride) {
    return self->_statusBarStyleOverride;
  }
  v3.receiver = self;
  v3.super_class = (Class)PKNavigationController;
  return [(PKNavigationController *)&v3 preferredStatusBarStyle];
}

- (void)_updateBarAppearanceForViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  if (objc_opt_respondsToSelector())
  {
    char v6 = objc_msgSend(v14, "pkui_navigationStatusBarStyleDescriptor");
    unint64_t v8 = v7;
    int v9 = v6 & 1;
  }
  else
  {
    unint64_t v8 = 0;
    int v9 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v10 = objc_msgSend(v14, "pkui_navigationBarHidden");
  }
  else {
    uint64_t v10 = 0;
  }
  if (v8 > 3 || v8 == 2 || !v9)
  {
    if (!self->_hasStatusBarStyleOverride) {
      goto LABEL_22;
    }
    self->_hasStatusBarStyleOverride = 0;
LABEL_15:
    if (v8 == 3)
    {
      uint64_t v11 = [MEMORY[0x1E4FB1618] blackColor];
    }
    else
    {
      if (v8 != 1)
      {
        objc_super v12 = 0;
        goto LABEL_21;
      }
      uint64_t v11 = [MEMORY[0x1E4FB1618] whiteColor];
    }
    objc_super v12 = (void *)v11;
LABEL_21:
    v13 = [(PKNavigationController *)self navigationBar];
    [v13 setTintColor:v12];

    [(PKNavigationController *)self setNeedsStatusBarAppearanceUpdate];
    goto LABEL_22;
  }
  if (!self->_hasStatusBarStyleOverride || self->_statusBarStyleOverride != v8)
  {
    self->_hasStatusBarStyleOverride = 1;
    self->_statusBarStyleOverride = v8;
    goto LABEL_15;
  }
LABEL_22:
  if (v10 != [(PKNavigationController *)self isNavigationBarHidden]) {
    [(PKNavigationController *)self setNavigationBarHidden:v10 animated:v4];
  }
}

- (void)promptAppStoreReviewForTrigger:(unint64_t)a3
{
  if (!self->_reviewPromptHelper)
  {
    double v5 = objc_alloc_init(PKStoreKitReviewPromptHelper);
    reviewPromptHelper = self->_reviewPromptHelper;
    self->_reviewPromptHelper = v5;
  }
  unint64_t v7 = [(PKNavigationController *)self view];
  unint64_t v8 = [v7 window];
  id v9 = [v8 windowScene];

  [(PKStoreKitReviewPromptHelper *)self->_reviewPromptHelper requestReviewInSceneIfEligible:v9 trigger:a3];
}

- (void)setupBackgroundViewWithBlurEffect:(int64_t)a3
{
  if (!self->_backgroundView && !self->_blurView)
  {
    [(PKNavigationController *)self _setBuiltinTransitionStyle:1];
    double v5 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    backgroundView = self->_backgroundView;
    self->_backgroundView = v5;

    id v7 = objc_alloc(MEMORY[0x1E4FB1F00]);
    unint64_t v8 = [MEMORY[0x1E4FB14C8] effectWithStyle:a3];
    id v9 = (UIVisualEffectView *)[v7 initWithEffect:v8];
    blurView = self->_blurView;
    self->_blurView = v9;

    [(UIView *)self->_backgroundView addSubview:self->_blurView];
    uint64_t v11 = [(PKNavigationController *)self viewIfLoaded];
    if (v11)
    {
      id v12 = v11;
      [v11 insertSubview:self->_backgroundView atIndex:0];
      [v12 setNeedsLayout];
      uint64_t v11 = v12;
    }
  }
}

- (void)setupWallpaper
{
  if (!self->_wallpaperView)
  {
    [(PKNavigationController *)self _beginDelayingPresentation:0 cancellationHandler:0.2];
    id v3 = objc_alloc_init(MEMORY[0x1E4FA6CB0]);
    objc_initWeak(&location, self);
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __40__PKNavigationController_setupWallpaper__block_invoke;
    v5[3] = &unk_1E59D2968;
    id v4 = v3;
    id v6 = v4;
    objc_copyWeak(&v7, &location);
    [v4 fetchThumbnailForVariant:1 completionHandler:v5];
    objc_destroyWeak(&v7);

    objc_destroyWeak(&location);
  }
}

void __40__PKNavigationController_setupWallpaper__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(a1 + 32) invalidate];
  if (v3)
  {
    id v4 = [MEMORY[0x1E4FB1818] imageWithData:v3];
  }
  else
  {
    id v4 = 0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__PKNavigationController_setupWallpaper__block_invoke_2;
  v6[3] = &unk_1E59CB010;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);

  objc_destroyWeak(&v8);
}

void __40__PKNavigationController_setupWallpaper__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    if (*(void *)(a1 + 32)) {
      objc_msgSend(WeakRetained, "_updateWithWallpaperImage:");
    }
    [v3 _endDelayingPresentation];
    id WeakRetained = v3;
  }
}

- (void)setNeedsNavigationBarUpdate
{
  id v3 = [(PKNavigationController *)self topViewController];
  if (v3)
  {
    id v4 = v3;
    [(PKNavigationController *)self _updateBarAppearanceForViewController:v3 animated:0];
    id v3 = v4;
  }
}

- (void)setCustomFormSheetPresentationStyleForiPad
{
  if ([(UIViewController *)self pkui_userInterfaceIdiomSupportsLargeLayouts])
  {
    [(PKNavigationController *)self setModalPresentationStyle:16];
    id v3 = [(PKNavigationController *)self view];
    id v4 = [v3 layer];
    [v4 setMasksToBounds:1];

    id v6 = [(PKNavigationController *)self view];
    id v5 = [v6 layer];
    [v5 setCornerRadius:6.0];
  }
}

- (void)setPageSheetPresentation
{
  [(PKNavigationController *)self setModalPresentationStyle:1];

  [(PKNavigationController *)self setModalTransitionStyle:0];
}

- (void)_updateWithWallpaperImage:(id)a3
{
  wallpaperView = self->_wallpaperView;
  if (wallpaperView)
  {
    id v5 = a3;
    [(UIImageView *)wallpaperView setImage:v5];
  }
  else
  {
    id v6 = (objc_class *)MEMORY[0x1E4FB1838];
    id v7 = a3;
    id v8 = (UIImageView *)[[v6 alloc] initWithImage:v7];

    id v9 = self->_wallpaperView;
    self->_wallpaperView = v8;

    [(UIView *)self->_backgroundView insertSubview:self->_wallpaperView belowSubview:self->_blurView];
  }
  id v10 = [(PKNavigationController *)self view];
  [v10 setNeedsLayout];
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  if (!self->_hasExplicitlyDefinedSupportedInterfaceOrientations)
  {
    self->_hasExplicitlyDefinedSupportedInterfaceOrientations = 1;
    self->_unint64_t explicitlyDefinedSupportedInterfaceOrientations = a3;
    goto LABEL_5;
  }
  unint64_t explicitlyDefinedSupportedInterfaceOrientations = self->_explicitlyDefinedSupportedInterfaceOrientations;
  self->_hasExplicitlyDefinedSupportedInterfaceOrientations = 1;
  self->_unint64_t explicitlyDefinedSupportedInterfaceOrientations = a3;
  if (explicitlyDefinedSupportedInterfaceOrientations != a3) {
LABEL_5:
  }
    [(PKNavigationController *)self setNeedsUpdateOfSupportedInterfaceOrientations];
}

- (unint64_t)supportedInterfaceOrientations
{
  if (self->_hasExplicitlyDefinedSupportedInterfaceOrientations) {
    return self->_explicitlyDefinedSupportedInterfaceOrientations;
  }
  v3.receiver = self;
  v3.super_class = (Class)PKNavigationController;
  return [(PKNavigationController *)&v3 supportedInterfaceOrientations];
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 transitionCoordinator];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = [v9 transitionCoordinator];
  }
  v13 = v12;

  id v14 = [v13 viewControllerForKey:*MEMORY[0x1E4FB30B8]];
  v15 = v14;
  if (v14 != self)
  {
    if (v13 && v14)
    {
      objc_initWeak(&location, self);
      if (v5)
      {
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke;
        v28[3] = &unk_1E59D2990;
        v16 = &v30;
        objc_copyWeak(&v30, &location);
        id v29 = v9;
        BOOL v31 = v5;
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_2;
        v24[3] = &unk_1E59D2990;
        objc_copyWeak(&v26, &location);
        v25 = v15;
        BOOL v27 = v5;
        [v13 animateAlongsideTransition:v28 completion:v24];
        v17 = &v29;

        objc_destroyWeak(&v26);
      }
      else
      {
        [(PKNavigationController *)self _updateBarAppearanceForViewController:v9 animated:0];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_3;
        v20[3] = &unk_1E59D2990;
        v16 = &v22;
        objc_copyWeak(&v22, &location);
        v21 = v15;
        char v23 = 0;
        [v13 notifyWhenInteractionChangesUsingBlock:v20];
        v17 = (id *)&v21;
      }

      objc_destroyWeak(v16);
      objc_destroyWeak(&location);
    }
    else
    {
      v18 = [v8 interactivePopGestureRecognizer];
      unint64_t v19 = [v18 state];

      if (v19 <= 5 && ((1 << v19) & 0x31) != 0) {
        [(PKNavigationController *)self _updateBarAppearanceForViewController:v9 animated:v5];
      }
    }
  }
}

void __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _updateBarAppearanceForViewController:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
}

void __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_2(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  LODWORD(v3) = [v4 isCancelled];

  if (v3) {
    [WeakRetained _updateBarAppearanceForViewController:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

void __79__PKNavigationController_navigationController_willShowViewController_animated___block_invoke_3(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  LODWORD(v3) = [v4 isCancelled];

  if (v3) {
    [WeakRetained _updateBarAppearanceForViewController:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = v7;
  if (v5)
  {
    id v9 = (void *)MEMORY[0x1E4FB1EB0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __78__PKNavigationController_navigationController_didShowViewController_animated___block_invoke;
    v10[3] = &unk_1E59CD7B0;
    v10[4] = self;
    id v11 = v7;
    char v12 = 1;
    [v9 animateWithDuration:4 delay:v10 options:0 animations:0.25 completion:0.0];
  }
  else
  {
    [(PKNavigationController *)self _updateBarAppearanceForViewController:v7 animated:0];
  }
}

uint64_t __78__PKNavigationController_navigationController_didShowViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateBarAppearanceForViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reviewPromptHelper, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end