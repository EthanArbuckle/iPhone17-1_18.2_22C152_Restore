@interface UIDebuggingInformationOverlayViewController
- (BOOL)isFullscreen;
- (CGPoint)offset;
- (UIDebuggingInformationOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIDebuggingInformationRootTableViewController)rootTableViewController;
- (UIView)containerView;
- (void)didReceiveGesture:(id)a3;
- (void)setIsFullscreen:(BOOL)a3;
- (void)setOffset:(CGPoint)a3;
- (void)setRootTableViewController:(id)a3;
- (void)toggleFullscreen;
- (void)viewDidLayoutSubviews;
@end

@implementation UIDebuggingInformationOverlayViewController

- (UIView)containerView
{
  return (UIView *)self->_shadowContainer;
}

- (UIDebuggingInformationOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v24.receiver = self;
  v24.super_class = (Class)UIDebuggingInformationOverlayViewController;
  v4 = [(UIViewController *)&v24 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    v5 = [[UIDebuggingInformationRootTableViewController alloc] initWithStyle:0];
    rootTableViewController = v4->_rootTableViewController;
    v4->_rootTableViewController = v5;

    v7 = [[UINavigationController alloc] initWithRootViewController:v4->_rootTableViewController];
    v8 = [(UIViewController *)v7 view];
    v9 = [v8 layer];
    [v9 setCornerRadius:23.0];

    v10 = [(UIViewController *)v7 view];
    v11 = [v10 layer];
    [v11 setMasksToBounds:1];

    navController = v4->_navController;
    v4->_navController = v7;
    v13 = v7;

    v14 = objc_alloc_init(UIDebuggingInformationContainerView);
    v15 = [(UIViewController *)v13 view];
    [(UIView *)v14 addSubview:v15];

    shadowContainer = v4->_shadowContainer;
    v4->_shadowContainer = v14;
    v17 = v14;

    v18 = +[UIColor clearColor];
    v19 = [(UIViewController *)v4 view];
    [v19 setBackgroundColor:v18];

    [(UIViewController *)v4 addChildViewController:v13];
    v20 = [(UIViewController *)v4 view];
    [v20 addSubview:v17];

    [(UINavigationController *)v13 didMoveToParentViewController:v4];
    v21 = [[UIPanGestureRecognizer alloc] initWithTarget:v4 action:sel_didReceiveGesture_];

    [(UIPanGestureRecognizer *)v21 setMaximumNumberOfTouches:1];
    [(UIPanGestureRecognizer *)v21 setMinimumNumberOfTouches:1];
    v22 = [(UINavigationController *)v13 navigationBar];

    [v22 addGestureRecognizer:v21];
  }
  return v4;
}

- (void)viewDidLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)UIDebuggingInformationOverlayViewController;
  [(UIViewController *)&v34 viewDidLayoutSubviews];
  BOOL v3 = [(UIDebuggingInformationOverlayViewController *)self isFullscreen];
  v4 = [(UIViewController *)self view];
  v5 = v4;
  if (v3)
  {
    [v4 bounds];
    double x = v6;
    double y = v8;
    double v11 = v10;
    double height = v12;

    double v14 = height;
    double v15 = v11;
    double v16 = y;
    double v17 = x;
  }
  else
  {
    [v4 safeAreaInsets];
    double v17 = v18;
    v19 = [(UIViewController *)self view];
    [v19 bounds];
    double MidY = CGRectGetMidY(v35);
    v21 = [(UIViewController *)self view];
    [v21 bounds];
    double v16 = MidY + CGRectGetHeight(v36) * -0.25;
    v22 = [(UIViewController *)self view];
    [v22 bounds];
    double Width = CGRectGetWidth(v37);
    objc_super v24 = [(UIViewController *)self view];
    [v24 safeAreaInsets];
    double v26 = Width - v25;
    v27 = [(UIViewController *)self view];
    [v27 safeAreaInsets];
    double v15 = v26 - v28;
    v29 = [(UIViewController *)self view];
    [v29 bounds];
    double v14 = CGRectGetHeight(v38) * 0.5;

    v39.origin.double x = *(CGFloat *)MEMORY[0x1E4F1DAD8];
    v39.origin.double y = *(CGFloat *)(MEMORY[0x1E4F1DAD8] + 8);
    v39.size.width = v15;
    v39.size.double height = v14;
    CGRect v40 = CGRectInset(v39, 10.0, 10.0);
    double x = v40.origin.x;
    double y = v40.origin.y;
    double v11 = v40.size.width;
    double height = v40.size.height;
  }
  -[UIView setFrame:](self->_shadowContainer, "setFrame:", v17, v16, v15, v14);
  v30 = [(UIViewController *)self->_navController view];
  objc_msgSend(v30, "setFrame:", x, y, v11, height);

  if ([(UIDebuggingInformationOverlayViewController *)self isFullscreen]) {
    double v31 = 0.0;
  }
  else {
    double v31 = 23.0;
  }
  v32 = [(UIViewController *)self->_navController view];
  v33 = [v32 layer];
  [v33 setCornerRadius:v31];
}

- (void)toggleFullscreen
{
  [(UIDebuggingInformationOverlayViewController *)self setIsFullscreen:[(UIDebuggingInformationOverlayViewController *)self isFullscreen] ^ 1];
  BOOL v3 = [(UIViewController *)self view];
  [v3 setNeedsLayout];

  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __63__UIDebuggingInformationOverlayViewController_toggleFullscreen__block_invoke;
  v4[3] = &unk_1E52D9F70;
  v4[4] = self;
  +[UIView animateWithDuration:v4 animations:0.5];
}

void __63__UIDebuggingInformationOverlayViewController_toggleFullscreen__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 976), "setShadowHidden:", objc_msgSend(*(id *)(a1 + 32), "isFullscreen"));
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (void)didReceiveGesture:(id)a3
{
  id v31 = a3;
  v4 = [(UIViewController *)self view];
  [v31 locationInView:v4];
  double v6 = v5;
  double v8 = v7;

  if ([v31 state] == 1)
  {
    v9 = [(UIDebuggingInformationOverlayViewController *)self containerView];
    [v9 center];
    double v11 = v10;
    double v13 = v12;

    -[UIDebuggingInformationOverlayViewController setOffset:](self, "setOffset:", v6 - v11, v8 - v13);
  }
  else if ([v31 state] == 2)
  {
    double v14 = [(UIViewController *)self view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;

    v19 = [(UIDebuggingInformationOverlayViewController *)self containerView];
    [v19 bounds];
    double v21 = v20;
    double v23 = v22;

    [(UIDebuggingInformationOverlayViewController *)self offset];
    double v25 = v6 - v24;
    [(UIDebuggingInformationOverlayViewController *)self offset];
    double v27 = v8 - v26;
    double v28 = fmin(v16 - v21 * 0.5, fmax(v21 * 0.5, v25));
    double v29 = fmin(v18 - v23 * 0.5, fmax(v23 * 0.5, v27));
    v30 = [(UIDebuggingInformationOverlayViewController *)self containerView];
    objc_msgSend(v30, "setCenter:", v28, v29);
  }
}

- (UIDebuggingInformationRootTableViewController)rootTableViewController
{
  return self->_rootTableViewController;
}

- (void)setRootTableViewController:(id)a3
{
}

- (BOOL)isFullscreen
{
  return self->_isFullscreen;
}

- (void)setIsFullscreen:(BOOL)a3
{
  self->_isFullscreen = a3;
}

- (CGPoint)offset
{
  objc_copyStruct(v4, &self->_offset, 16, 1, 0);
  double v2 = *(double *)v4;
  double v3 = *(double *)&v4[1];
  result.double y = v3;
  result.double x = v2;
  return result;
}

- (void)setOffset:(CGPoint)a3
{
  CGPoint v3 = a3;
  objc_copyStruct(&self->_offset, &v3, 16, 1, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootTableViewController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_shadowContainer, 0);
}

@end