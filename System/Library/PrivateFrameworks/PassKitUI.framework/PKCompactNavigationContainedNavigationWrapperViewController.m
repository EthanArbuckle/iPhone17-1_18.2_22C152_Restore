@interface PKCompactNavigationContainedNavigationWrapperViewController
- (BOOL)useParentSafeAreaInsets;
- (PKCompactNavigationContainedNavigationWrapperViewController)initWithWrappedViewController:(id)a3 parentViewController:(id)a4;
- (PKCompactNavigationContainedNavigationWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (void)setUseParentSafeAreaInsets:(BOOL)a3;
@end

@implementation PKCompactNavigationContainedNavigationWrapperViewController

- (PKCompactNavigationContainedNavigationWrapperViewController)initWithWrappedViewController:(id)a3 type:(int64_t)a4
{
  return 0;
}

- (PKCompactNavigationContainedNavigationWrapperViewController)initWithWrappedViewController:(id)a3 parentViewController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)PKCompactNavigationContainedNavigationWrapperViewController;
  v7 = [(PKWrapperViewController *)&v10 initWithWrappedViewController:a3 type:1];
  v8 = v7;
  if (v7) {
    objc_storeWeak((id *)&v7->_parentViewController, v6);
  }

  return v8;
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [(PKWrapperViewController *)self wrappedViewController];
  if (v7 != v6)
  {

LABEL_3:
    v24.receiver = self;
    v24.super_class = (Class)PKCompactNavigationContainedNavigationWrapperViewController;
    [(PKCompactNavigationContainedNavigationWrapperViewController *)&v24 _edgeInsetsForChildViewController:v6 insetsAreAbsolute:a4];
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    id WeakRetained = 0;
    goto LABEL_4;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);

  if (!WeakRetained) {
    goto LABEL_3;
  }
  if (a4) {
    *a4 = 1;
  }
  double v9 = *MEMORY[0x1E4FB2848];
  double v11 = *(double *)(MEMORY[0x1E4FB2848] + 8);
  double v13 = *(double *)(MEMORY[0x1E4FB2848] + 16);
  double v15 = *(double *)(MEMORY[0x1E4FB2848] + 24);
  if (self->_useParentSafeAreaInsets)
  {
    v21 = [WeakRetained viewIfLoaded];
    v22 = v21;
    if (v21)
    {
      [v21 safeAreaInsets];
      double v13 = fmax(v23, v13);
    }
  }
LABEL_4:

  double v17 = v9;
  double v18 = v11;
  double v19 = v13;
  double v20 = v15;
  result.right = v20;
  result.bottom = v19;
  result.left = v18;
  result.top = v17;
  return result;
}

- (BOOL)useParentSafeAreaInsets
{
  return self->_useParentSafeAreaInsets;
}

- (void)setUseParentSafeAreaInsets:(BOOL)a3
{
  self->_useParentSafeAreaInsets = a3;
}

- (void).cxx_destruct
{
}

@end