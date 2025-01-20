@interface CustomContaineePresentationController
- (BOOL)containeeViewControllerConformsToCustomPresentationContaineeViewController;
- (BOOL)containerViewControllerSupportsUpdateViewsForCustomDismissalTransition;
- (BOOL)containerViewControllerSupportsUpdateViewsForCustomPresentationTransition;
- (ContaineeViewController)containeeViewController;
- (ContainerViewController)containerViewController;
- (CustomContaineePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (int64_t)adaptivePresentationStyleForTraitCollection:(id)a3;
- (void)containerViewWillLayoutSubviews;
- (void)dismissContaineeViewController;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationTransitionWillBegin;
- (void)setContaineeViewController:(id)a3;
- (void)setContaineeViewControllerConformsToCustomPresentationContaineeViewController:(BOOL)a3;
- (void)setContainerViewController:(id)a3;
- (void)setContainerViewControllerSupportsUpdateViewsForCustomDismissalTransition:(BOOL)a3;
- (void)setContainerViewControllerSupportsUpdateViewsForCustomPresentationTransition:(BOOL)a3;
@end

@implementation CustomContaineePresentationController

- (CustomContaineePresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CustomContaineePresentationController;
  v8 = [(CustomContaineePresentationController *)&v19 initWithPresentedViewController:v6 presentingViewController:v7];
  v9 = v8;
  if (v8)
  {
    [(CustomContaineePresentationController *)v8 setDelegate:v8];
    objc_storeWeak((id *)&v9->_containeeViewController, v6);
    objc_storeWeak((id *)&v9->_containerViewController, v7);
    v9->_containeeViewControllerConformsToCustomPresentationContaineeViewController = [v6 conformsToProtocol:&OBJC_PROTOCOL___CustomPresentationContaineeViewController];
    v9->_containerViewControllerSupportsUpdateViewsForCustomPresentationTransition = objc_opt_respondsToSelector() & 1;
    v9->_containerViewControllerSupportsUpdateViewsForCustomDismissalTransition = objc_opt_respondsToSelector() & 1;
    objc_initWeak(&location, v9);
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3221225472;
    v15 = sub_100A161C8;
    v16 = &unk_101314708;
    objc_copyWeak(&v17, &location);
    v10 = +[_UISheetDetent _detentWithContainerViewBlock:&v13];
    v20 = v10;
    v11 = +[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v20, 1, v13, v14, v15, v16);
    [(CustomContaineePresentationController *)v9 _setDetents:v11];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

- (int64_t)adaptivePresentationStyleForTraitCollection:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
  unsigned int v6 = [WeakRetained allowOnlyStandardStyle];

  id v7 = [v4 horizontalSizeClass];
  if (v6)
  {
    if (v7 == (id)2 && [v4 verticalSizeClass] == (id)1
      || [v4 horizontalSizeClass] == (id)2 && objc_msgSend(v4, "verticalSizeClass") == (id)2)
    {
      int64_t v8 = 2;
      goto LABEL_13;
    }
LABEL_9:
    int64_t v8 = 4;
    goto LABEL_13;
  }
  if (v7 == (id)1 && [v4 verticalSizeClass] == (id)2) {
    goto LABEL_9;
  }
  if ([v4 verticalSizeClass] == (id)1) {
    int64_t v8 = 5;
  }
  else {
    int64_t v8 = 2;
  }
LABEL_13:
  self->_presentationStyle = v8;

  return v8;
}

- (void)containerViewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)CustomContaineePresentationController;
  [(CustomContaineePresentationController *)&v12 containerViewWillLayoutSubviews];
  if (self->_presentationStyle == 4)
  {
    [(CustomContaineePresentationController *)self frameOfPresentedViewInContainerView];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    v11 = [(CustomContaineePresentationController *)self presentedView];
    [v11 setFrame:v4, v6, v8, v10];
  }
}

- (void)presentationTransitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)CustomContaineePresentationController;
  [(CustomContaineePresentationController *)&v11 presentationTransitionWillBegin];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A16510;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  double v3 = objc_retainBlock(v10);
  double v4 = [(CustomContaineePresentationController *)self presentedViewController];
  double v5 = [v4 transitionCoordinator];

  if (v5)
  {
    double v6 = [(CustomContaineePresentationController *)self presentedViewController];
    double v7 = [v6 transitionCoordinator];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A16578;
    v8[3] = &unk_1012FEC60;
    double v9 = v3;
    [v7 animateAlongsideTransition:v8 completion:0];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)dismissalTransitionWillBegin
{
  v11.receiver = self;
  v11.super_class = (Class)CustomContaineePresentationController;
  [(CustomContaineePresentationController *)&v11 dismissalTransitionWillBegin];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100A166F4;
  v10[3] = &unk_1012E5D08;
  v10[4] = self;
  double v3 = objc_retainBlock(v10);
  double v4 = [(CustomContaineePresentationController *)self presentedViewController];
  double v5 = [v4 transitionCoordinator];

  if (v5)
  {
    double v6 = [(CustomContaineePresentationController *)self presentedViewController];
    double v7 = [v6 transitionCoordinator];
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100A16760;
    v8[3] = &unk_1012FEC60;
    double v9 = v3;
    [v7 animateAlongsideTransition:v8 completion:&stru_101314728];
  }
  else
  {
    ((void (*)(void *))v3[2])(v3);
  }
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CustomContaineePresentationController;
  [(CustomContaineePresentationController *)&v5 dismissalTransitionDidEnd:a3];
  if (!self->_containerContentShown)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);
    [WeakRetained updateViewsForCustomDismissalTransition];
  }
}

- (void)presentationControllerDidDismiss:(id)a3
{
}

- (void)dismissContaineeViewController
{
  if (self->_containeeViewControllerConformsToCustomPresentationContaineeViewController)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);
    [WeakRetained dismissCustomPresentationContainee];
  }
}

- (ContaineeViewController)containeeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containeeViewController);

  return (ContaineeViewController *)WeakRetained;
}

- (void)setContaineeViewController:(id)a3
{
}

- (ContainerViewController)containerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerViewController);

  return (ContainerViewController *)WeakRetained;
}

- (void)setContainerViewController:(id)a3
{
}

- (BOOL)containeeViewControllerConformsToCustomPresentationContaineeViewController
{
  return self->_containeeViewControllerConformsToCustomPresentationContaineeViewController;
}

- (void)setContaineeViewControllerConformsToCustomPresentationContaineeViewController:(BOOL)a3
{
  self->_containeeViewControllerConformsToCustomPresentationContaineeViewController = a3;
}

- (BOOL)containerViewControllerSupportsUpdateViewsForCustomPresentationTransition
{
  return self->_containerViewControllerSupportsUpdateViewsForCustomPresentationTransition;
}

- (void)setContainerViewControllerSupportsUpdateViewsForCustomPresentationTransition:(BOOL)a3
{
  self->_containerViewControllerSupportsUpdateViewsForCustomPresentationTransition = a3;
}

- (BOOL)containerViewControllerSupportsUpdateViewsForCustomDismissalTransition
{
  return self->_containerViewControllerSupportsUpdateViewsForCustomDismissalTransition;
}

- (void)setContainerViewControllerSupportsUpdateViewsForCustomDismissalTransition:(BOOL)a3
{
  self->_containerViewControllerSupportsUpdateViewsForCustomDismissalTransition = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_containerViewController);

  objc_destroyWeak((id *)&self->_containeeViewController);
}

@end