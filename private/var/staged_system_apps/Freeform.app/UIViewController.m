@interface UIViewController
- (BOOL)crl_canBeDismissed;
- (BOOL)crl_preserveEditorSelection;
- (BOOL)crl_shouldUpdateNavigationContentSizeWithPreferredContentSize;
- (BOOL)crl_updateContentSizePreservingPreviousWidthWithSize:(CGSize)a3;
- (BOOL)crl_updateContentSizePreservingPreviousWidthWithSize:(CGSize)a3 validateSize:(id)a4;
- (CRLiOSWindowWrapper)crl_windowWrapper;
- (void)crl_adjustScrollIndicatorInsetsForTableView:(id)a3;
@end

@implementation UIViewController

- (CRLiOSWindowWrapper)crl_windowWrapper
{
  v2 = [(UIViewController *)self view];
  v3 = [v2 crl_windowWrapper];

  return (CRLiOSWindowWrapper *)v3;
}

- (BOOL)crl_preserveEditorSelection
{
  return 0;
}

- (void)crl_adjustScrollIndicatorInsetsForTableView:(id)a3
{
  id v24 = a3;
  if (+[UIDevice crl_phoneUI])
  {
    [v24 horizontalScrollIndicatorInsets];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    [v24 verticalScrollIndicatorInsets];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    BOOL v15 = !+[UIScreen crl_screenClassPhoneUIRegularOrLarge](UIScreen, "crl_screenClassPhoneUIRegularOrLarge")&& (id)+[UIScreen crl_screenClass] != (id)2;
    if (!+[UIScreen crl_deviceIsLandscape] || v15)
    {
      double v14 = UITableViewAutomaticDimension;
      double v23 = UITableViewAutomaticDimension;
      double v12 = UITableViewAutomaticDimension;
      double v8 = UITableViewAutomaticDimension;
      double v20 = UITableViewAutomaticDimension;
      double v6 = UITableViewAutomaticDimension;
      v21 = v24;
    }
    else
    {
      v16 = [v24 superview];
      [v16 safeAreaInsets];
      double v18 = v17;

      +[UIScreen crl_screenZoomScale];
      double v20 = floor(v18 / v19);
      +[UIScreen crl_screenZoomScale];
      v21 = v24;
      double v23 = floor(v18 / v22);
    }
    [v21 setHorizontalScrollIndicatorInsets:v4, v6, v20, v8];
    [v24 setVerticalScrollIndicatorInsets:v10, v12, v23, v14];
  }
}

- (BOOL)crl_shouldUpdateNavigationContentSizeWithPreferredContentSize
{
  double v3 = [(UIViewController *)self navigationController];
  if (v3)
  {
    uint64_t v4 = objc_opt_class();
    double v5 = [(UIViewController *)self parentViewController];
    double v6 = sub_1002469D0(v4, v5);

    double v7 = [v3 topViewController];
    if (v6) {
      BOOL v8 = v7 == self;
    }
    else {
      BOOL v8 = 0;
    }
    BOOL v9 = v8;
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)crl_updateContentSizePreservingPreviousWidthWithSize:(CGSize)a3
{
  return -[UIViewController crl_updateContentSizePreservingPreviousWidthWithSize:validateSize:](self, "crl_updateContentSizePreservingPreviousWidthWithSize:validateSize:", 0, a3.width, a3.height);
}

- (BOOL)crl_updateContentSizePreservingPreviousWidthWithSize:(CGSize)a3 validateSize:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  double v7 = (double (**)(void, double, double))a4;
  [(UIViewController *)self preferredContentSize];
  BOOL v10 = height != CGSizeZero.height || width != CGSizeZero.width;
  BOOL v11 = height != v9 || width != v8;
  double v12 = [(UIViewController *)self navigationController];
  if (v12)
  {
    double v13 = [(UIViewController *)self navigationController];
    [v13 preferredContentSize];
    BOOL v16 = height != v15 || width != v14;
  }
  else
  {
    BOOL v16 = 0;
  }

  int v17 = v10 && (v11 || v16);
  if (v17 == 1)
  {
    double v18 = [(UIViewController *)self navigationController];
    if (v18)
    {
      double v19 = [(UIViewController *)self navigationController];
      [v19 preferredContentSize];
      double width = v20;
    }
    if (v7)
    {
      double width = v7[2](v7, width, height);
      double height = v21;
    }
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1002AEBB0;
    v24[3] = &unk_1014CD898;
    v24[4] = self;
    *(double *)&v24[5] = width;
    *(double *)&v24[6] = height;
    double v22 = objc_retainBlock(v24);
    +[UIView performWithoutAnimation:v22];
  }
  return v17;
}

- (BOOL)crl_canBeDismissed
{
  return 1;
}

@end