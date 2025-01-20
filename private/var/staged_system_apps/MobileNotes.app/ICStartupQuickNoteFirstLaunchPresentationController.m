@interface ICStartupQuickNoteFirstLaunchPresentationController
- (CGRect)frameOfPresentedViewInContainerView;
- (ICStartupQuickNoteFirstLaunchPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIView)dimmingView;
- (double)transitionDuration:(id)a3;
- (void)animateTransition:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionWillBegin;
- (void)presentationTransitionWillBegin;
- (void)setDimmingView:(id)a3;
@end

@implementation ICStartupQuickNoteFirstLaunchPresentationController

- (ICStartupQuickNoteFirstLaunchPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v10.receiver = self;
  v10.super_class = (Class)ICStartupQuickNoteFirstLaunchPresentationController;
  v4 = [(ICStartupQuickNoteFirstLaunchPresentationController *)&v10 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    id v5 = objc_alloc_init((Class)UIView);
    [(ICStartupQuickNoteFirstLaunchPresentationController *)v4 setDimmingView:v5];

    v6 = +[UIColor blackColor];
    v7 = [v6 colorWithAlphaComponent:0.4];
    v8 = [(ICStartupQuickNoteFirstLaunchPresentationController *)v4 dimmingView];
    [v8 setBackgroundColor:v7];
  }
  return v4;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  v3 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self containerView];
  [v3 frame];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;

  v12 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self presentedView];
  LODWORD(v13) = 1148846080;
  LODWORD(v14) = 1112014848;
  [v12 systemLayoutSizeFittingSize:270.0 withHorizontalFittingPriority:UILayoutFittingCompressedSize.height verticalFittingPriority:v13, v14];
  double v16 = v15;
  double v18 = v17;

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  CGFloat v19 = CGRectGetMidX(v24) - v16 * 0.5;
  v25.origin.x = v5;
  v25.origin.y = v7;
  v25.size.width = v9;
  v25.size.height = v11;
  double v20 = CGRectGetMidY(v25) - v18 * 0.5;
  double v21 = v19;
  double v22 = v16;
  double v23 = v18;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v20;
  result.origin.x = v21;
  return result;
}

- (void)presentationTransitionWillBegin
{
  v9.receiver = self;
  v9.super_class = (Class)ICStartupQuickNoteFirstLaunchPresentationController;
  [(ICStartupQuickNoteFirstLaunchPresentationController *)&v9 presentationTransitionWillBegin];
  v3 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self containerView];
  double v4 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self dimmingView];
  [v3 addSubview:v4];

  CGFloat v5 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self dimmingView];
  [v5 setAlpha:0.0];

  double v6 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self presentedViewController];
  CGFloat v7 = [v6 transitionCoordinator];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000EEF94;
  v8[3] = &unk_100625AC8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

- (void)containerViewWillLayoutSubviews
{
  v3 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self containerView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self dimmingView];
  [v12 setFrame:v5, v7, v9, v11];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000EF0C4;
  v13[3] = &unk_100625AF0;
  v13[4] = self;
  +[UIView animateWithDuration:v13 animations:0.0];
}

- (void)dismissalTransitionWillBegin
{
  v6.receiver = self;
  v6.super_class = (Class)ICStartupQuickNoteFirstLaunchPresentationController;
  [(ICStartupQuickNoteFirstLaunchPresentationController *)&v6 dismissalTransitionWillBegin];
  v3 = [(ICStartupQuickNoteFirstLaunchPresentationController *)self presentedViewController];
  double v4 = [v3 transitionCoordinator];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000EF210;
  v5[3] = &unk_100625AC8;
  v5[4] = self;
  [v4 animateAlongsideTransition:v5 completion:0];
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v4 = a3;
  double v5 = [v4 viewControllerForKey:UITransitionContextFromViewControllerKey];
  objc_super v6 = [v4 viewControllerForKey:UITransitionContextToViewControllerKey];
  double v7 = [v6 view];
  double v8 = [v4 containerView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  double v10 = v5;
  if (isKindOfClass)
  {
    [v8 addSubview:v7];
    double v10 = v6;
  }
  id v11 = v10;
  v12 = [v11 view];
  [v4 finalFrameForViewController:v11];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  [v12 setFrame:v14, v16, v18, v20];
  if (isKindOfClass)
  {
    [v12 setAlpha:0.0];
    [(ICStartupQuickNoteFirstLaunchPresentationController *)self transitionDuration:v4];
    double v22 = v21;
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1000EF564;
    v44[3] = &unk_100625AF0;
    double v23 = &v45;
    v45 = v12;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000EF570;
    v42[3] = &unk_100626580;
    CGRect v24 = &v43;
    id v43 = v4;
    id v25 = v4;
    id v26 = v12;
    v27 = v44;
    v28 = (void ***)v42;
    double v29 = v22;
    uint64_t v30 = 4;
  }
  else
  {
    [(ICStartupQuickNoteFirstLaunchPresentationController *)self transitionDuration:v4];
    double v32 = v31;
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1000EF57C;
    v40[3] = &unk_100625AF0;
    double v23 = &v41;
    v41 = v12;
    v35 = _NSConcreteStackBlock;
    uint64_t v36 = 3221225472;
    v37 = sub_1000EF5BC;
    v38 = &unk_100626580;
    CGRect v24 = &v39;
    id v39 = v4;
    id v33 = v4;
    id v34 = v12;
    v27 = v40;
    v28 = &v35;
    double v29 = v32;
    uint64_t v30 = 65540;
  }
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", v30, v27, v28, v29, 0.0, v35, v36, v37, v38);
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
}

@end