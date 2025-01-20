@interface PKCompactNavigationWrapperViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasExplicitTargetNavigationHeight;
- (BOOL)needsInitialLayout;
- (CGRect)_wrappedViewControllerFrameForBounds:(CGRect)a3 navigationBarHeight:(double)a4;
- (PKCompactNavigationWrapperViewController)initWithWrappedViewController:(id)a3 parentNavigationController:(id)a4;
- (PKCompactNavigationWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (double)targetNavigationHeight;
- (void)didMoveToParentViewController:(id)a3;
- (void)loadView;
- (void)setTargetNavigationHeight:(double)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillLayoutSubviews;
@end

@implementation PKCompactNavigationWrapperViewController

- (PKCompactNavigationWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4
{
  return 0;
}

- (PKCompactNavigationWrapperViewController)initWithWrappedViewController:(id)a3 parentNavigationController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PKCompactNavigationWrapperViewController;
  v7 = [(PKWrapperViewController *)&v10 initWithWrappedViewController:a3 type:1];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_parentNavigationController, v6);
    v8->_needsInitialLayout = 1;
  }

  return v8;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v7.receiver = self;
  v7.super_class = (Class)PKCompactNavigationWrapperViewController;
  [(PKWrapperViewController *)&v7 loadView];
  v3 = [(PKCompactNavigationWrapperViewController *)self view];
  [v3 setAutoresizesSubviews:0];

  v4 = [(PKWrapperViewController *)self wrappedViewController];
  v5 = [v4 view];
  id v6 = [v5 layer];
  objc_msgSend(v6, "setAnchorPoint:", 0.5, 0.0);
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(PKWrapperViewController *)self wrappedViewController];
  if (v7 != v6)
  {

LABEL_3:
    v27.receiver = self;
    v27.super_class = (Class)PKCompactNavigationWrapperViewController;
    [(PKCompactNavigationWrapperViewController *)&v27 _edgeInsetsForChildViewController:v6 insetsAreAbsolute:a4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    goto LABEL_12;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNavigationController);

  if (!WeakRetained) {
    goto LABEL_3;
  }
  if (a4) {
    *a4 = 1;
  }
  v17 = (double *)MEMORY[0x1E4FB2848];
  double v9 = *MEMORY[0x1E4FB2848];
  v18 = [(PKCompactNavigationWrapperViewController *)self viewIfLoaded];
  v19 = v18;
  if (v18)
  {
    [v18 safeAreaInsets];
    double v9 = fmax(v20, v9);
  }
  double v13 = v17[2];
  v21 = [WeakRetained viewIfLoaded];

  if (v21)
  {
    [v21 safeAreaInsets];
    double v13 = fmax(v22, v13);
  }
  double v11 = v17[1];
  double v15 = v17[3];

LABEL_12:
  double v23 = v9;
  double v24 = v11;
  double v25 = v13;
  double v26 = v15;
  result.right = v26;
  result.bottom = v25;
  result.left = v24;
  result.top = v23;
  return result;
}

- (void)viewWillLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)PKCompactNavigationWrapperViewController;
  [(PKWrapperViewController *)&v17 viewWillLayoutSubviews];
  v3 = [(PKCompactNavigationWrapperViewController *)self view];
  v4 = [(PKWrapperViewController *)self wrappedViewController];
  v5 = [v4 view];

  [v3 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(PKCompactNavigationWrapperViewController *)self navigationController];
  double v15 = [v14 navigationBar];
  [v15 frame];
  self->_navigationBarHeight = v16;

  -[PKCompactNavigationWrapperViewController _wrappedViewControllerFrameForBounds:navigationBarHeight:](self, "_wrappedViewControllerFrameForBounds:navigationBarHeight:", v7, v9, v11, v13, self->_navigationBarHeight);
  objc_msgSend(v5, "setFrame:");
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PKCompactNavigationWrapperViewController;
  [(PKCompactNavigationWrapperViewController *)&v3 viewDidLayoutSubviews];
  if (self->_hasExplicitTargetNavigationHeight) {
    self->_needsInitialLayout = 0;
  }
}

- (void)didMoveToParentViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PKCompactNavigationWrapperViewController;
  -[PKCompactNavigationWrapperViewController didMoveToParentViewController:](&v6, sel_didMoveToParentViewController_);
  if (a3)
  {
    v5 = [(PKCompactNavigationWrapperViewController *)self viewIfLoaded];
    [v5 setNeedsLayout];
  }
}

- (void)setTargetNavigationHeight:(double)a3
{
  if (!self->_hasExplicitTargetNavigationHeight) {
    goto LABEL_4;
  }
  if (self->_targetNavigationHeight != a3) {
    goto LABEL_4;
  }
  double navigationBarHeight = self->_navigationBarHeight;
  objc_super v6 = [(PKCompactNavigationWrapperViewController *)self navigationController];
  double v7 = [v6 navigationBar];
  [v7 frame];
  double v9 = v8;

  if (navigationBarHeight != v9)
  {
LABEL_4:
    self->_targetNavigationHeight = a3;
    self->_hasExplicitTargetNavigationHeight = 1;
    id v10 = [(PKCompactNavigationWrapperViewController *)self viewIfLoaded];
    [v10 setNeedsLayout];
  }
}

- (CGRect)_wrappedViewControllerFrameForBounds:(CGRect)a3 navigationBarHeight:(double)a4
{
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  char v9 = [(PKWrapperViewController *)self edgesForExtendedLayout];
  if (self->_hasExplicitTargetNavigationHeight)
  {
    double targetNavigationHeight = self->_targetNavigationHeight;
    if ((v9 & 1) == 0) {
      double targetNavigationHeight = fmax(targetNavigationHeight - a4, 0.0);
    }
  }
  else if (v9)
  {
    double targetNavigationHeight = a4;
  }
  else
  {
    double targetNavigationHeight = 0.0;
  }
  double v11 = x;
  double v12 = y;
  double v13 = width;
  result.size.height = targetNavigationHeight;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (BOOL)needsInitialLayout
{
  return self->_needsInitialLayout;
}

- (BOOL)hasExplicitTargetNavigationHeight
{
  return self->_hasExplicitTargetNavigationHeight;
}

- (double)targetNavigationHeight
{
  return self->_targetNavigationHeight;
}

- (void).cxx_destruct
{
}

@end