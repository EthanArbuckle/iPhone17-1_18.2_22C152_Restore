@interface SKUITabBarController
+ (Class)_moreNavigationControllerClass;
- (BOOL)containsTransientViewControllerOnly;
- (BOOL)sizeTransitionInProgress;
- (SKUITabBarController)init;
- (id)floatingOverlayViewController;
- (id)moreNavigationController;
- (id)traitCollection;
- (int64_t)forcedUserInterfaceStyle;
- (void)_layoutFloatingOverlayView;
- (void)_setSelectedViewController:(id)a3;
- (void)cancelTransientViewController:(id)a3;
- (void)init;
- (void)moreNavigationController:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4;
- (void)setForcedUserInterfaceStyle:(int64_t)a3;
- (void)setSizeTransitionInProgress:(BOOL)a3;
- (void)setTransientViewController:(id)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SKUITabBarController

- (SKUITabBarController)init
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUITabBarController init]();
  }
  v7.receiver = self;
  v7.super_class = (Class)SKUITabBarController;
  v3 = [(SKUITabBarController *)&v7 init];
  v4 = v3;
  if (v3)
  {
    v5 = [(SKUITabBarController *)v3 tabBar];
    [v5 setSemanticContentAttribute:storeSemanticContentAttribute()];
  }
  return v4;
}

- (BOOL)containsTransientViewControllerOnly
{
  v3 = [(SKUITabBarController *)self transientViewController];
  if (v3)
  {
    v4 = [(SKUITabBarController *)self viewControllers];
    if ([v4 count] == 1)
    {
      v5 = [(SKUITabBarController *)self viewControllers];
      v6 = [v5 firstObject];
      BOOL v7 = v6 == v3;
    }
    else
    {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)setFloatingOverlayViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v7 = (UIViewController *)a3;
  v8 = v7;
  p_floatingOverlayViewController = &self->_floatingOverlayViewController;
  floatingOverlayViewController = self->_floatingOverlayViewController;
  if (floatingOverlayViewController != v7)
  {
    if (v7 && floatingOverlayViewController)
    {
      objc_storeStrong((id *)&self->_floatingOverlayViewController, a3);
      floatingOverlayView = self->_floatingOverlayView;
      v12 = [(UIViewController *)*p_floatingOverlayViewController view];
      [(SKUIFloatingOverlayView *)floatingOverlayView setContentView:v12];

      [(SKUITabBarController *)self _layoutFloatingOverlayView];
    }
    else if (v7)
    {
      objc_storeStrong((id *)&self->_floatingOverlayViewController, a3);
      v13 = objc_alloc_init(SKUIFloatingOverlayView);
      v14 = self->_floatingOverlayView;
      self->_floatingOverlayView = v13;

      -[SKUIFloatingOverlayView setContentInset:](self->_floatingOverlayView, "setContentInset:", 6.0, 0.0, 6.0, 0.0);
      v15 = self->_floatingOverlayView;
      v16 = [(UIViewController *)*p_floatingOverlayViewController view];
      [(SKUIFloatingOverlayView *)v15 setContentView:v16];

      v17 = [(SKUITabBarController *)self view];
      [v17 addSubview:self->_floatingOverlayView];

      [(SKUITabBarController *)self _layoutFloatingOverlayView];
      if (v4)
      {
        [(SKUIFloatingOverlayView *)self->_floatingOverlayView setAlpha:0.0];
        v18 = self->_floatingOverlayView;
        v19 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        v20 = [v19 colorWithAlphaComponent:0.8];
        [(SKUIFloatingOverlayView *)v18 setBackgroundColor:v20];

        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_3;
        v27[3] = &unk_1E6422020;
        v27[4] = self;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_4;
        v26[3] = &unk_1E64223D0;
        v26[4] = self;
        [MEMORY[0x1E4FB1EB0] animateWithDuration:v27 animations:v26 completion:0.3];
      }
    }
    else
    {
      *p_floatingOverlayViewController = 0;

      v21 = self->_floatingOverlayView;
      v22 = self->_floatingOverlayView;
      self->_floatingOverlayView = 0;

      if (v4)
      {
        v23 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
        v24 = [v23 colorWithAlphaComponent:0.8];
        [(SKUIFloatingOverlayView *)v21 setBackgroundColor:v24];

        v25 = (void *)MEMORY[0x1E4FB1EB0];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke;
        v30[3] = &unk_1E6422020;
        v31 = v21;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_2;
        v28[3] = &unk_1E64223D0;
        v29 = v31;
        [v25 animateWithDuration:v30 animations:v28 completion:0.3];
      }
      else
      {
        [(SKUIFloatingOverlayView *)v21 removeFromSuperview];
      }
    }
  }
}

uint64_t __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

uint64_t __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1216) setAlpha:1.0];
}

void __66__SKUITabBarController_setFloatingOverlayViewController_animated___block_invoke_4(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 1216);
  id v2 = [MEMORY[0x1E4FB1618] clearColor];
  [v1 setBackgroundColor:v2];
}

- (void)cancelTransientViewController:(id)a3
{
}

+ (Class)_moreNavigationControllerClass
{
  return (Class)objc_opt_class();
}

- (id)moreNavigationController
{
  v8.receiver = self;
  v8.super_class = (Class)SKUITabBarController;
  v3 = [(SKUITabBarController *)&v8 moreNavigationController];
  [v3 setStoreKitDelegate:self];
  uint64_t v4 = storeSemanticContentAttribute();
  v5 = [v3 view];
  [v5 setSemanticContentAttribute:v4];

  v6 = [v3 navigationBar];
  [v6 setSemanticContentAttribute:v4];

  return v3;
}

- (void)_setSelectedViewController:(id)a3
{
  id v4 = a3;
  v5 = [(SKUITabBarController *)self selectedViewController];
  v8.receiver = self;
  v8.super_class = (Class)SKUITabBarController;
  [(SKUITabBarController *)&v8 _setSelectedViewController:v4];

  v6 = [(SKUITabBarController *)self selectedViewController];
  if (v5 == v6)
  {
    BOOL v7 = [(SKUITabBarController *)self delegate];
    if (![(SKUITabBarController *)self sizeTransitionInProgress]
      && (objc_opt_respondsToSelector() & 1) != 0)
    {
      [v7 tabBarController:self didReselectViewController:v5];
    }
  }
}

- (void)setTransientViewController:(id)a3 animated:(BOOL)a4
{
  v4.receiver = self;
  v4.super_class = (Class)SKUITabBarController;
  [(SKUITabBarController *)&v4 setTransientViewController:a3 animated:0];
}

- (void)viewDidLayoutSubviews
{
  if (self->_floatingOverlayView) {
    [(SKUITabBarController *)self _layoutFloatingOverlayView];
  }
  v3.receiver = self;
  v3.super_class = (Class)SKUITabBarController;
  [(SKUITabBarController *)&v3 viewDidLayoutSubviews];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  [(SKUITabBarController *)self setSizeTransitionInProgress:1];
  objc_super v8 = [(SKUITabBarController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v8, "tabBarController:willTransitionToSize:withTransitionCoordinator:", self, v7, width, height);
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUITabBarController;
  -[SKUITabBarController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  [(SKUITabBarController *)self setSizeTransitionInProgress:0];
}

- (id)traitCollection
{
  v13[2] = *MEMORY[0x1E4F143B8];
  v12.receiver = self;
  v12.super_class = (Class)SKUITabBarController;
  objc_super v3 = [(SKUITabBarController *)&v12 traitCollection];
  objc_super v4 = [(SKUITabBarController *)self view];
  [v4 bounds];
  double Width = CGRectGetWidth(v15);
  double v6 = SKUICompactThreshold();

  if (Width <= v6)
  {
    id v10 = v3;
  }
  else
  {
    id v7 = [MEMORY[0x1E4FB1E20] traitCollectionWithHorizontalSizeClass:2];
    objc_super v8 = (void *)MEMORY[0x1E4FB1E20];
    v13[0] = v3;
    v13[1] = v7;
    objc_super v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
    id v10 = [v8 traitCollectionWithTraitsFromCollections:v9];
  }

  return v10;
}

- (void)moreNavigationController:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  id v6 = [(SKUITabBarController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    v5 = [(SKUITabBarController *)self selectedViewController];
    [v6 tabBarController:self didSelectViewController:v5];
  }
}

- (void)_layoutFloatingOverlayView
{
  id v29 = [(SKUITabBarController *)self view];
  [v29 bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  -[SKUIFloatingOverlayView sizeThatFits:](self->_floatingOverlayView, "sizeThatFits:", 320.0, 1.79769313e308);
  double v12 = v11;
  double v14 = v13;
  v31.origin.x = v4;
  v31.origin.y = v6;
  v31.size.double width = v8;
  v31.size.double height = v10;
  double Width = CGRectGetWidth(v31);
  v16 = SKUITabBarControllerGetActiveNavigationController(self);
  v17 = [v16 navigationBar];
  v18 = v17;
  if (v17)
  {
    [v17 bounds];
    objc_msgSend(v18, "convertRect:toView:", v29);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    v23 = [MEMORY[0x1E4FB1438] sharedApplication];
    objc_msgSend(v18, "defaultSizeForOrientation:", objc_msgSend(v23, "statusBarOrientation"));
    CGFloat v25 = v24;
    CGFloat v27 = v26;

    v32.origin.x = v20;
    v32.origin.y = v22;
    v32.size.double width = v25;
    v32.size.double height = v27;
    double v28 = CGRectGetMaxY(v32) + 15.0;
  }
  else
  {
    double v28 = 35.0;
  }
  -[SKUIFloatingOverlayView setFrame:](self->_floatingOverlayView, "setFrame:", Width - v12 + -15.0, v28, v12, v14);
  [v29 bringSubviewToFront:self->_floatingOverlayView];
}

- (id)floatingOverlayViewController
{
  return self->_floatingOverlayViewController;
}

- (int64_t)forcedUserInterfaceStyle
{
  return self->_forcedUserInterfaceStyle;
}

- (void)setForcedUserInterfaceStyle:(int64_t)a3
{
  self->_forcedUserInterfaceStyle = a3;
}

- (BOOL)sizeTransitionInProgress
{
  return self->_sizeTransitionInProgress;
}

- (void)setSizeTransitionInProgress:(BOOL)a3
{
  self->_sizeTransitionInProgress = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_floatingOverlayViewController, 0);

  objc_storeStrong((id *)&self->_floatingOverlayView, 0);
}

- (void)init
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUITabBarController init]";
}

@end