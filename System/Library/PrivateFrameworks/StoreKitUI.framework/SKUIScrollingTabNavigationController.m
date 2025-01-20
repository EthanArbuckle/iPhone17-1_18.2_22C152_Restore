@interface SKUIScrollingTabNavigationController
- (BOOL)isShowingNavigationStackRootContent;
- (SKUINavigationStackObserver)navigationStackObserver;
- (SKUIScrollingTabNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)_scrollViewBottomContentInsetForViewController:(id)a3;
- (void)_observedNavigationStackDidChange;
- (void)didShowViewController:(id)a3 animated:(BOOL)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)popToNavigationStackRootContentAnimated:(BOOL)a3 withBehavior:(int64_t)a4;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)scrollingTabBarBottomInsetAdjustmentDidChange;
- (void)setNavigationStackObserver:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation SKUIScrollingTabNavigationController

- (SKUIScrollingTabNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIScrollingTabNavigationController initWithNibName:bundle:]();
  }
  v10.receiver = self;
  v10.super_class = (Class)SKUIScrollingTabNavigationController;
  v8 = [(SUNavigationController *)&v10 initWithNibName:v6 bundle:v7];
  if (v8) {
    [(SKUIScrollingTabNavigationController *)v8 setNavigationBarClass:objc_opt_class()];
  }

  return v8;
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __81__SKUIScrollingTabNavigationController_dismissViewControllerAnimated_completion___block_invoke;
  v9[3] = &unk_1E6423A78;
  v9[4] = self;
  id v10 = v6;
  v8.receiver = self;
  v8.super_class = (Class)SKUIScrollingTabNavigationController;
  id v7 = v6;
  [(SKUIScrollingTabNavigationController *)&v8 dismissViewControllerAnimated:v4 completion:v9];
}

uint64_t __81__SKUIScrollingTabNavigationController_dismissViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 _observedNavigationStackDidChange];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  v6.receiver = self;
  v6.super_class = (Class)SKUIScrollingTabNavigationController;
  [(SKUIScrollingTabNavigationController *)&v6 presentViewController:a3 animated:a4 completion:a5];
  [(SKUIScrollingTabNavigationController *)self _observedNavigationStackDidChange];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SKUIScrollingTabNavigationController;
  [(SKUIScrollingTabNavigationController *)&v4 viewDidAppear:a3];
  [(SKUIScrollingTabNavigationController *)self _observedNavigationStackDidChange];
}

- (void)didShowViewController:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)SKUIScrollingTabNavigationController;
  [(SKUINavigationController *)&v5 didShowViewController:a3 animated:a4];
  [(SKUIScrollingTabNavigationController *)self _observedNavigationStackDidChange];
}

- (double)_scrollViewBottomContentInsetForViewController:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(UIViewController *)self scrollingTabBarController];
  objc_super v6 = v5;
  if (v5)
  {
    [v5 contentViewControllerBottomInsetAdjustment];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)SKUIScrollingTabNavigationController;
    [(SKUIScrollingTabNavigationController *)&v10 _scrollViewBottomContentInsetForViewController:v4];
  }
  double v8 = v7;

  return v8;
}

- (BOOL)isShowingNavigationStackRootContent
{
  v3 = [(SKUIScrollingTabNavigationController *)self viewControllers];
  unint64_t v4 = [v3 count];

  if (v4 > 1) {
    return 0;
  }
  objc_super v5 = [(SKUIScrollingTabNavigationController *)self presentedViewController];
  BOOL v6 = v5 == 0;

  return v6;
}

- (void)popToNavigationStackRootContentAnimated:(BOOL)a3 withBehavior:(int64_t)a4
{
  BOOL v5 = a3;
  double v7 = [(SKUIScrollingTabNavigationController *)self presentedViewController];
  double v8 = v7;
  if (!v7)
  {
    objc_super v10 = self;
    BOOL v11 = v5;
    goto LABEL_13;
  }
  if (a4 == 1)
  {
    if (v5)
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __93__SKUIScrollingTabNavigationController_popToNavigationStackRootContentAnimated_withBehavior___block_invoke;
      v16[3] = &unk_1E6422020;
      v16[4] = self;
      v12 = v16;
      v13 = self;
      uint64_t v14 = 1;
LABEL_11:
      [(SKUIScrollingTabNavigationController *)v13 dismissViewControllerAnimated:v14 completion:v12];
      goto LABEL_14;
    }
    [(SKUIScrollingTabNavigationController *)self dismissViewControllerAnimated:0 completion:0];
    objc_super v10 = self;
    BOOL v11 = 0;
LABEL_13:
    id v15 = [(SKUINavigationController *)v10 popToRootViewControllerAnimated:v11];
    goto LABEL_14;
  }
  if (a4) {
    goto LABEL_14;
  }
  if (![v7 conformsToProtocol:&unk_1F1E20968])
  {
    v13 = self;
    uint64_t v14 = v5;
    v12 = 0;
    goto LABEL_11;
  }
  id v9 = v8;
  if ([v9 isShowingNavigationStackRootContent]) {
    [(SKUIScrollingTabNavigationController *)self dismissViewControllerAnimated:v5 completion:0];
  }
  else {
    [v9 popToNavigationStackRootContentAnimated:v5 withBehavior:0];
  }

LABEL_14:
}

id __93__SKUIScrollingTabNavigationController_popToNavigationStackRootContentAnimated_withBehavior___block_invoke(uint64_t a1)
{
  return (id)[*(id *)(a1 + 32) popToRootViewControllerAnimated:1];
}

- (void)scrollingTabBarBottomInsetAdjustmentDidChange
{
  if (objc_opt_respondsToSelector())
  {
    v3 = [(SKUIScrollingTabNavigationController *)self topViewController];
    [(SKUIScrollingTabNavigationController *)self _computeAndApplyScrollContentInsetDeltaForViewController:v3];
  }
  if ([(SKUIScrollingTabNavigationController *)self isViewLoaded])
  {
    id v4 = [(SKUIScrollingTabNavigationController *)self view];
    [v4 setNeedsLayout];
  }
}

- (void)_observedNavigationStackDidChange
{
  id v3 = [(SKUIScrollingTabNavigationController *)self navigationStackObserver];
  [v3 observedNavigationStackDidChange:self];
}

- (SKUINavigationStackObserver)navigationStackObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationStackObserver);

  return (SKUINavigationStackObserver *)WeakRetained;
}

- (void)setNavigationStackObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithNibName:bundle:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIScrollingTabNavigationController initWithNibName:bundle:]";
}

@end