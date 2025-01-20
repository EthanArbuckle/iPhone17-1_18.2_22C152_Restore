@interface ICSEPresentationController
- (BOOL)isLandscape;
- (BOOL)isPortrait;
- (BOOL)isShowingSearchResults;
- (CGRect)adjustFrame:(CGRect)a3 forKeyboardFrame:(CGRect)a4 topLayoutGuideHeight:(double)a5;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)frameOfPresentedViewInContainerView:(id)a3 withKeyboardFrame:(CGRect)a4 topLayoutGuideLength:(double)a5;
- (CGRect)idealFrameForMainViewControllerWithoutKeyboardForContainerView:(id)a3 topLayoutGuideHeight:(double)a4;
- (CGSize)maxSize;
- (ICSEPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (ICSERootViewController)rootViewController;
- (UIView)dimmingView;
- (double)horizontalMargin;
- (double)keyboardMargin;
- (double)verticalMargin;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setDimmingView:(id)a3;
- (void)setIsShowingSearchResults:(BOOL)a3;
- (void)setRootViewController:(id)a3;
@end

@implementation ICSEPresentationController

- (CGRect)frameOfPresentedViewInContainerView:(id)a3 withKeyboardFrame:(CGRect)a4 topLayoutGuideLength:(double)a5
{
  [(ICSEPresentationController *)self idealFrameForMainViewControllerWithoutKeyboardForContainerView:a3 topLayoutGuideHeight:a5];
  -[ICSEPresentationController adjustFrame:forKeyboardFrame:topLayoutGuideHeight:](self, "adjustFrame:forKeyboardFrame:topLayoutGuideHeight:", *(void *)&a5);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)adjustFrame:(CGRect)a3 forKeyboardFrame:(CGRect)a4 topLayoutGuideHeight:(double)a5
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  CGFloat v9 = a3.size.height;
  CGFloat v10 = a3.size.width;
  CGFloat v11 = a3.origin.y;
  CGFloat v12 = a3.origin.x;
  if (![(ICSEPresentationController *)self isShowingSearchResults])
  {
    v25.origin.CGFloat x = x;
    v25.origin.CGFloat y = y;
    v25.size.CGFloat width = width;
    v25.size.CGFloat height = height;
    if (!CGRectIsNull(v25))
    {
      v26.origin.CGFloat x = x;
      v26.origin.CGFloat y = y;
      v26.size.CGFloat width = width;
      v26.size.CGFloat height = height;
      if (!CGRectIsEmpty(v26))
      {
        v27.origin.CGFloat x = v12;
        v27.origin.CGFloat y = v11;
        v27.size.CGFloat width = v10;
        v27.size.CGFloat height = v9;
        double MaxY = CGRectGetMaxY(v27);
        v28.origin.CGFloat x = x;
        v28.origin.CGFloat y = y;
        v28.size.CGFloat width = width;
        v28.size.CGFloat height = height;
        double MinY = CGRectGetMinY(v28);
        [(ICSEPresentationController *)self keyboardMargin];
        if (MaxY > MinY - v15)
        {
          TSDClipRectToMinY();
          CGFloat v12 = v16;
          CGFloat v11 = v17;
          CGFloat v10 = v18;
          CGFloat v9 = v19;
        }
      }
    }
  }
  double v20 = v12;
  double v21 = v11;
  double v22 = v10;
  double v23 = v9;
  result.size.CGFloat height = v23;
  result.size.CGFloat width = v22;
  result.origin.CGFloat y = v21;
  result.origin.CGFloat x = v20;
  return result;
}

- (CGRect)idealFrameForMainViewControllerWithoutKeyboardForContainerView:(id)a3 topLayoutGuideHeight:(double)a4
{
  [a3 bounds];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [(ICSEPresentationController *)self horizontalMargin];
  CGFloat v14 = v13;
  [(ICSEPresentationController *)self verticalMargin];
  CGFloat v16 = v15;
  unsigned int v17 = +[UIDevice ic_isiPad];
  v26.origin.CGFloat x = v6;
  v26.origin.CGFloat y = v8;
  v26.size.CGFloat width = v10;
  v26.size.CGFloat height = v12;
  CGRect v27 = CGRectInset(v26, v14, v16);
  [(ICSEPresentationController *)self maxSize];
  TSDSizeWithMaxSize();
  if (![(ICSEPresentationController *)self isShowingSearchResults]
    && ICAccessibilityAccessibilityLargerTextSizesEnabled()
    && ([(ICSEPresentationController *)self isPortrait] | v17) == 1)
  {
    double v18 = [(ICSEPresentationController *)self rootViewController];
    double v19 = [v18 traitCollection];
    double v20 = [v19 preferredContentSizeCategory];
    ICAccessibilityLinearInterpolatedValueForAccessibilityContentSizeCategory();
  }
  [(ICSEPresentationController *)self isPortrait];
  [(ICSEPresentationController *)self isPortrait];
  TSDCenterOfRect();
  TSDRectWithCenterAndSize();

  TSDClipRectToMinY();
  result.size.CGFloat height = v24;
  result.size.CGFloat width = v23;
  result.origin.CGFloat y = v22;
  result.origin.CGFloat x = v21;
  return result;
}

- (CGSize)maxSize
{
  unsigned int v3 = +[UIDevice ic_isiPad];
  double v4 = 10000.0;
  double v5 = 10000.0;
  if (v3)
  {
    unsigned int v6 = [(ICSEPresentationController *)self isShowingSearchResults];
    double v5 = 686.0;
    if (!v6) {
      double v5 = 250.0;
    }
    double v4 = 536.0;
  }
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

- (double)horizontalMargin
{
  unsigned int v2 = [(ICSEPresentationController *)self isPortrait];
  unsigned int v3 = +[UIDevice ic_isiPad];
  double result = 65.0;
  if (v3 | v2) {
    return 8.0;
  }
  return result;
}

- (double)verticalMargin
{
  unsigned int v2 = [(ICSEPresentationController *)self isPortrait];
  unsigned int v3 = +[UIDevice ic_isiPad];
  double result = 28.0;
  if (v3 | v2) {
    return 8.0;
  }
  return result;
}

- (double)keyboardMargin
{
  unsigned int v2 = [(ICSEPresentationController *)self isPortrait];
  double result = 8.0;
  if (v2) {
    return 28.0;
  }
  return result;
}

- (BOOL)isPortrait
{
  return ![(ICSEPresentationController *)self isLandscape];
}

- (BOOL)isLandscape
{
  unsigned int v2 = [(ICSEPresentationController *)self containerView];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  return v6 < v4;
}

- (ICSEPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ICSEPresentationController;
  double v4 = [(ICSEPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)UIView);
    [(ICSEPresentationController *)v4 setDimmingView:v5];

    double v6 = +[UIColor blackColor];
    double v7 = [v6 colorWithAlphaComponent:0.4];
    CGFloat v8 = [(ICSEPresentationController *)v4 dimmingView];
    [v8 setBackgroundColor:v7];
  }
  return v4;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v3 = [(ICSEPresentationController *)self rootViewController];
  double v4 = [v3 ic_safeAreaLayoutGuide];
  [v4 layoutFrame];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [(ICSEPresentationController *)self containerView];
  CGFloat v14 = [(ICSEPresentationController *)self rootViewController];
  [v14 keyboardFrame];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v22 = v21;
  v35.origin.CGFloat x = v6;
  v35.origin.CGFloat y = v8;
  v35.size.CGFloat width = v10;
  v35.size.CGFloat height = v12;
  -[ICSEPresentationController frameOfPresentedViewInContainerView:withKeyboardFrame:topLayoutGuideLength:](self, "frameOfPresentedViewInContainerView:withKeyboardFrame:topLayoutGuideLength:", v13, v16, v18, v20, v22, CGRectGetMinY(v35));
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;

  double v31 = v24;
  double v32 = v26;
  double v33 = v28;
  double v34 = v30;
  result.size.CGFloat height = v34;
  result.size.CGFloat width = v33;
  result.origin.CGFloat y = v32;
  result.origin.CGFloat x = v31;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v9.receiver = self;
  v9.super_class = (Class)ICSEPresentationController;
  [(ICSEPresentationController *)&v9 presentationTransitionWillBegin];
  double v3 = [(ICSEPresentationController *)self containerView];
  double v4 = [(ICSEPresentationController *)self dimmingView];
  [v3 addSubview:v4];

  double v5 = [(ICSEPresentationController *)self dimmingView];
  [v5 setAlpha:0.0];

  CGFloat v6 = [(ICSEPresentationController *)self presentedViewController];
  double v7 = [v6 transitionCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100030CC4;
  v8[3] = &unk_1000EEDE0;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)containerViewWillLayoutSubviews
{
  double v3 = [(ICSEPresentationController *)self containerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  CGFloat v12 = [(ICSEPresentationController *)self dimmingView];
  [v12 setFrame:v5, v7, v9, v11];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100030DF4;
  v13[3] = &unk_1000EE0C0;
  v13[4] = self;
  +[UIView animateWithDuration:v13 animations:0.0];
}

- (void)dismissalTransitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)ICSEPresentationController;
  [(ICSEPresentationController *)&v6 dismissalTransitionWillBegin];
  double v3 = [(ICSEPresentationController *)self presentedViewController];
  double v4 = [v3 transitionCoordinator];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100030F40;
  v5[3] = &unk_1000EEDE0;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (BOOL)isShowingSearchResults
{
  return self->_isShowingSearchResults;
}

- (void)setIsShowingSearchResults:(BOOL)a3
{
  self->_isShowingSearchResults = a3;
}

- (ICSERootViewController)rootViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_rootViewController);

  return (ICSERootViewController *)WeakRetained;
}

- (void)setRootViewController:(id)a3
{
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);

  objc_destroyWeak((id *)&self->_rootViewController);
}

@end