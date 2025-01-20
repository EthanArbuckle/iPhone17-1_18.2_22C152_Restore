@interface BKMainFlowController
- (BCCoverAnimatingSource)endOfBookCoverAnimationSource;
- (BKContentOpenAnimating)bookOpenAnimator;
- (BKContentOpenAnimationHelper)bookOpenAnimationHelper;
- (BKContentOpenStatusBarStyling)statusBarStyling;
- (BKLibraryAssetProvider)libraryAssetProvider;
- (BKMainFlowController)initWithLibraryAssetProvider:(id)a3;
- (BKMainFlowControllerDelegate)delegate;
- (BKMainFlowControllerDockingDelegate)dockingDelegate;
- (BKMainFlowControllerNavigationDelegate)navigationDelegate;
- (BKRootBarCoordinating)rootBarCoordinator;
- (BOOL)_closeToCurrentBookWithAssetPresenter:(id)a3 opening:(BOOL)a4;
- (BOOL)_currentlySelectedTabIsStore;
- (BOOL)_doesPreviousViewControllerSupportCurrentOrientation;
- (BOOL)_hasOpenAssets;
- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3;
- (BOOL)_welcomePresenterIsPresentingWelcome;
- (BOOL)coverEffectsNightMode;
- (BOOL)isBookCurrentlyOpen;
- (BOOL)presenterCanShowStoreProductOnCurrentContent;
- (BOOL)presenterIsShowingLibrary;
- (BOOL)presenterIsShowingStore;
- (BOOL)presenterShouldOpenBookUsingLargeCover;
- (UIViewController)transitionPreviousTopViewController;
- (UIViewControllerAnimatedTransitioning)animator;
- (id)_animatorFromViewController:(id)a3 toViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6;
- (id)_bookAndCoverAnimatorFrom:(id)a3 to:(id)a4 operation:(int64_t)a5;
- (id)_bookWithAssetPermanentOrTemporaryAssetID:(id)a3;
- (id)_coverImageForAssetID:(id)a3 toViewController:(id)a4 forAssetViewController:(id)a5 source:(id)a6 coverImage:(id)a7;
- (id)_coverSourceFromHost:(id)a3 assetPresenter:(id)a4 book:(id)a5 opening:(BOOL)a6;
- (id)_coverViewForPresenter:(id)a3 assetPresenter:(id)a4 includePresented:(BOOL)a5;
- (id)_minibarRevealAnimatorWithViewController:(id)a3 opening:(BOOL)a4;
- (id)_refIdFromAssetPresenter:(id)a3 closeToCurrentBook:(BOOL)a4;
- (id)_refInstanceFromAssetPresenter:(id)a3 closeToCurrentBook:(BOOL)a4;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)coverEffectRTLOverride;
- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6;
- (id)navigationControllerWithIdentifier:(id)a3;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)presenterFirstVisibleChildConformingToProtocol:(id)a3;
- (id)presenterModalPresentingViewController;
- (id)presenterSceneController;
- (id)presenterViewControllersConformingToProtocol:(id)a3;
- (id)selectedNavigationController;
- (id)viewControllerForStatusBarHidden;
- (id)viewControllerForStatusBarStyle;
- (unint64_t)coverEffectsContent;
- (unint64_t)viewType;
- (void)_fixInterfaceOrientationForEndOfBookTransitionForDismissingViewController:(id)a3 completion:(id)a4;
- (void)_forceOrientationToPortrait:(id)a3;
- (void)_navigationController:(id)a3 transitionCompletion:(id)a4;
- (void)_transition:(id)a3 animator:(id)a4 completion:(id)a5;
- (void)_transition:(id)a3 navigationController:(id)a4 animator:(id)a5 completion:(id)a6;
- (void)_updateReadingNowFeedWithAssetPresenter:(id)a3 completion:(id)a4;
- (void)_updateReadingNowFeedWithPerformantForReadingExperience:(BOOL)a3 for:(id)a4;
- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4;
- (void)im_navigationController:(id)a3 dismissChildViewController:(id)a4 animated:(BOOL)a5;
- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5;
- (void)presenterDidEndReadingExperienceWithAssetPresenter:(id)a3;
- (void)presenterDidStartReadingExperienceWithAssetPresenter:(id)a3;
- (void)presenterDismissAllModalControllersAnimated:(BOOL)a3 completion:(id)a4;
- (void)presenterDismissModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presenterEnsureCanOpenBookInCurrentContext:(BOOL)a3;
- (void)presenterFinishModalTransitionsWithCompletion:(id)a3;
- (void)presenterFixInterfaceOrientationIfNeededWithAssetPresenter:(id)a3 completion:(id)a4;
- (void)presenterPopToRootAnimated:(BOOL)a3 completion:(id)a4;
- (void)presenterPopToRootWithAnimator:(id)a3 completion:(id)a4;
- (void)presenterPrepareEndOfBookExperienceWithAssetPresenter:(id)a3 completion:(id)a4;
- (void)presenterSelectLibraryAllCollection;
- (void)presenterSelectTabWithIdentifier:(id)a3;
- (void)presenterShowAlertController:(id)a3 animated:(BOOL)a4;
- (void)presenterShowModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presenterUpdateReadingNowAssetVisibility:(BOOL)a3 assetPresenter:(id)a4;
- (void)presenterVisibleViewControllerDidChangeAnimated:(BOOL)a3;
- (void)presenterVisibleViewControllerWillChangeAnimated:(BOOL)a3;
- (void)presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:(id)a3;
- (void)saveStateClosing:(BOOL)a3;
- (void)setAnimator:(id)a3;
- (void)setBookOpenAnimationHelper:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDockingDelegate:(id)a3;
- (void)setEndOfBookCoverAnimationSource:(id)a3;
- (void)setNavigationDelegate:(id)a3;
- (void)setRootBarCoordinator:(id)a3;
- (void)setStatusBarStyling:(id)a3;
- (void)setTransitionPreviousTopViewController:(id)a3;
- (void)setViewType:(unint64_t)a3;
- (void)showLibraryAnimated:(BOOL)a3 assetID:(id)a4 completion:(id)a5;
- (void)showLibraryAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation BKMainFlowController

- (BKMainFlowControllerNavigationDelegate)navigationDelegate
{
  v2 = self;
  v3 = (void *)BKMainFlowController.navigationDelegate.getter();

  return (BKMainFlowControllerNavigationDelegate *)v3;
}

- (id)viewControllerForStatusBarStyle
{
  v3 = [(BKMainFlowController *)self statusBarStyling];
  if (v3)
  {
    v4 = [(BKMainFlowController *)self statusBarStyling];
    v5 = [v4 viewControllerForStatusBarStyle];
  }
  else
  {
    v5 = [(BKMainFlowController *)self selectedNavigationController];
  }

  return v5;
}

- (id)viewControllerForStatusBarHidden
{
  v3 = [(BKMainFlowController *)self statusBarStyling];
  if (v3)
  {
    v4 = [(BKMainFlowController *)self statusBarStyling];
    v5 = [v4 viewControllerForStatusBarHidden];
  }
  else
  {
    v5 = [(BKMainFlowController *)self selectedNavigationController];
  }

  return v5;
}

- (BKContentOpenStatusBarStyling)statusBarStyling
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_statusBarStyling);

  return (BKContentOpenStatusBarStyling *)WeakRetained;
}

- (id)selectedNavigationController
{
  v2 = [(BKMainFlowController *)self rootBarCoordinator];
  v3 = [v2 selectedNavigationController];

  return v3;
}

- (BKRootBarCoordinating)rootBarCoordinator
{
  v2 = self;
  v3 = (void *)BKMainFlowController.rootBarCoordinator.getter();

  return (BKRootBarCoordinating *)v3;
}

- (id)presenterFirstVisibleChildConformingToProtocol:(id)a3
{
  id v4 = a3;
  v5 = [(BKMainFlowController *)self delegate];
  v6 = [v5 rootViewController];
  v7 = [v6 im_firstVisibleChildConformingToProtocol:v4 includePresented:1];

  return v7;
}

- (BKMainFlowControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKMainFlowControllerDelegate *)WeakRetained;
}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v42 = a3;
  id v8 = a4;
  v9 = [v42 transitionCoordinator];
  v10 = [v9 viewControllerForKey:UITransitionContextFromViewControllerKey];
  id v11 = [v10 navigationController];

  v12 = v42;
  if (v11 != v42)
  {

    v12 = v42;
    v10 = 0;
  }
  BOOL v41 = v5;
  if (v5) {
    v13 = v9;
  }
  else {
    v13 = 0;
  }
  double v14 = BCNavBarVisibilityDuration;
  if (!v5) {
    double v14 = 0.0;
  }
  [v12 bc_updateNavBarVisibleWithTransitionCoordinator:v13 duration:v14];
  v15 = [v42 disappearingViewController];
  v16 = [(BKMainFlowController *)self rootBarCoordinator];
  v17 = [v16 selectedItem];
  v18 = [v17 identifier];
  v19 = +[BKRootBarItemsProvider LibraryAllIdentifier];
  unsigned int v20 = [v18 isEqualToString:v19];

  if (v20 && v15)
  {
    v21 = [v42 viewControllers];
    if ([v21 indexOfObjectIdenticalTo:v15] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
    }
    else
    {
      v22 = [v15 im_effectiveViewControllerForTabBarVisibility];
      unsigned __int8 v23 = [v22 im_tabBarVisible];

      if ((v23 & 1) == 0)
      {
        [v8 setHidesBottomBarWhenPushed:1];
        [v8 im_setTabBarVisible:0];
      }
    }
  }
  v24 = [v42 view];
  [v24 bounds];
  double v26 = v25;
  double v28 = v27;
  double v30 = v29;
  double v32 = v31;

  v33 = [v8 view];
  [v33 frame];
  v45.origin.x = v26;
  v45.origin.y = v28;
  v45.size.width = v30;
  v45.size.height = v32;
  BOOL v34 = CGRectEqualToRect(v44, v45);

  if (!v34)
  {
    id v35 = objc_alloc_init((Class)objc_opt_class());
    v36 = [v42 view];
    [v35 setContainerView:v36];

    [v8 viewWillTransitionToSize:v35 withTransitionCoordinator:v30, v32];
    v37 = [v8 view];
    [v37 setFrame:v26, v28, v30, v32];

    [v35 _runAlongsideAnimations];
    [v35 _runAlongsideCompletionsAfterCommit];
  }
  v38 = +[BCLightLevelController sharedInstance];
  id v39 = [v38 currentLightLevel];

  [v8 bc_notifyLightLevelDidChange:v39];
  [(BKMainFlowController *)self presenterVisibleViewControllerWillChangeAnimated:v41];
  v40 = [(BKMainFlowController *)self navigationDelegate];
  [v40 navigationController:v42 willShowViewController:v8];
}

- (void)setRootBarCoordinator:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (void)presenterVisibleViewControllerWillChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[BKAppDelegate delegate];
  BOOL v5 = [v4 sceneManager];
  id v6 = [v5 minifiedFlowController];

  [v6 visibleViewControllersUpdatedPreTranstionAnimated:v3];
}

- (id)presenterViewControllersConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = [(BKMainFlowController *)self delegate];
  v7 = [v6 rootViewController];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001D8DC4;
  v10[3] = &unk_100A46328;
  id v8 = v5;
  id v11 = v8;
  [v7 im_enumerateChildrenConformingToProtocol:v4 block:v10];

  return v8;
}

- (BKMainFlowController)initWithLibraryAssetProvider:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)BKMainFlowController;
  id v5 = [(BKMainFlowController *)&v8 init];
  id v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_libraryAssetProvider, v4);
  }

  return v6;
}

- (id)presenterSceneController
{
  v2 = [(BKMainFlowController *)self delegate];
  BOOL v3 = [v2 rootViewController];
  id v4 = +[BKAppDelegate sceneControllerForViewController:v3];

  return v4;
}

- (id)navigationControllerWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMainFlowController *)self rootBarCoordinator];
  id v6 = [v5 navigationControllerForIdentifier:v4];

  return v6;
}

- (void)_transition:(id)a3 navigationController:(id)a4 animator:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  [(BKMainFlowController *)self setAnimator:v12];
  double v14 = [v11 topViewController];
  [(BKMainFlowController *)self setTransitionPreviousTopViewController:v14];

  id v15 = objc_retainBlock(v10);
  v16 = v15;
  if (v15) {
    (*((void (**)(id, id))v15 + 2))(v15, v11);
  }

  objc_initWeak(&location, self);
  v17 = [v11 tabBarController];
  v18 = [v11 transitionCoordinator];
  [v17 im_updateTabBarVisibleWithTransitionCoordinator:v18];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1001D76B8;
  v20[3] = &unk_100A4ABC0;
  objc_copyWeak(&v22, &location);
  id v19 = v13;
  id v21 = v19;
  [(BKMainFlowController *)self _navigationController:v11 transitionCompletion:v20];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

- (void)_transition:(id)a3 animator:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(BKMainFlowController *)self selectedNavigationController];
  [(BKMainFlowController *)self _transition:v10 navigationController:v11 animator:v9 completion:v8];
}

- (void)_navigationController:(id)a3 transitionCompletion:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    id v6 = [a3 transitionCoordinator];
    if (v6)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1001D78B0;
      v7[3] = &unk_100A4ABE8;
      id v8 = v5;
      [v6 animateAlongsideTransition:0 completion:v7];
    }
    else
    {
      (*((void (**)(id, uint64_t))v5 + 2))(v5, 1);
    }
  }
}

- (BKContentOpenAnimating)bookOpenAnimator
{
  v2 = [(BKMainFlowController *)self animator];
  BOOL v3 = BUProtocolCast();

  return (BKContentOpenAnimating *)v3;
}

- (void)presenterPopToRootAnimated:(BOOL)a3 completion:(id)a4
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1001D79C8;
  v4[3] = &unk_100A4AC08;
  BOOL v5 = a3;
  [(BKMainFlowController *)self _transition:v4 animator:0 completion:a4];
}

- (void)presenterPopToRootWithAnimator:(id)a3 completion:(id)a4
{
}

- (BOOL)_hasOpenAssets
{
  v2 = [(BKMainFlowController *)self presenterViewControllersConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_welcomePresenterIsPresentingWelcome
{
  v2 = +[BKAppDelegate sceneManager];
  unsigned __int8 v3 = [v2 isPresentingWelcome];

  return v3;
}

- (BOOL)presenterIsShowingLibrary
{
  unsigned __int8 v3 = [(BKMainFlowController *)self rootBarCoordinator];
  id v4 = [v3 selectedItem];
  if ([v4 isDefaultCollection]
    && ![(BKMainFlowController *)self _hasOpenAssets])
  {
    unsigned int v5 = ![(BKMainFlowController *)self _welcomePresenterIsPresentingWelcome];
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (BOOL)presenterIsShowingStore
{
  unsigned __int8 v3 = [(BKMainFlowController *)self rootBarCoordinator];
  id v4 = [v3 selectedItem];

  unsigned __int8 v5 = [v4 isStoreOnly];
  if ((v5 & 1) == 0)
  {
    unsigned __int8 v3 = [v4 identifier];
    uint64_t v6 = +[BKRootBarItemsProvider HomeIdentifier];
    if (v3 != (void *)v6)
    {
      v7 = (void *)v6;
      id v8 = [v4 identifier];
      id v9 = +[BKRootBarItemsProvider SearchIdentifier];
      if (v8 == v9)
      {
        if ([(BKMainFlowController *)self _hasOpenAssets]) {
          LOBYTE(v10) = 0;
        }
        else {
          unsigned int v10 = ![(BKMainFlowController *)self _welcomePresenterIsPresentingWelcome];
        }
        id v9 = v8;
      }
      else
      {
        LOBYTE(v10) = 0;
      }

      goto LABEL_15;
    }
  }
  if ([(BKMainFlowController *)self _hasOpenAssets]) {
    LOBYTE(v10) = 0;
  }
  else {
    unsigned int v10 = ![(BKMainFlowController *)self _welcomePresenterIsPresentingWelcome];
  }
  v7 = v3;
  if ((v5 & 1) == 0)
  {
LABEL_15:
  }
  return v10;
}

- (void)presenterShowAlertController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v8 = [(BKMainFlowController *)self delegate];
  v7 = [v8 rootViewController];
  [v7 presentViewController:v6 animated:v4 completion:0];
}

- (id)presenterModalPresentingViewController
{
  v2 = [(BKMainFlowController *)self delegate];
  unsigned __int8 v3 = [v2 flowControllerModalPresentingViewController];

  return v3;
}

- (void)presenterShowModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [v8 setTransitioningDelegate:self];
  [(BKMainFlowController *)self presenterModalPresentingViewController];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1001D7F04;
  v28[3] = &unk_100A4AC70;
  id v31 = v9;
  v28[4] = self;
  BOOL v32 = v6;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  id v29 = v10;
  id v11 = v8;
  id v30 = v11;
  id v12 = v9;
  id v19 = _NSConcreteStackBlock;
  uint64_t v20 = 3221225472;
  id v21 = sub_1001D8058;
  id v22 = &unk_100A4ACC0;
  BOOL v27 = v6;
  unsigned __int8 v23 = self;
  id v24 = v11;
  double v26 = objc_retainBlock(v28);
  id v13 = v10;
  id v25 = v13;
  double v14 = v26;
  id v15 = v11;
  v16 = objc_retainBlock(&v19);
  v17 = [v13 bc_descendentPresentedViewController:v19, v20, v21, v22, v23];

  if (v17)
  {
    v18 = [v13 bc_descendentPresentedViewController];
    [v18 dismissViewControllerAnimated:v6 completion:v16];
  }
  else
  {
    ((void (*)(void ***))v16[2])(v16);
  }
}

- (id)_coverViewForPresenter:(id)a3 assetPresenter:(id)a4 includePresented:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = [a3 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost stopIfDescendentConformsToProtocol:&OBJC_PROTOCOL___BCCoverNonAnimating includePresented:v5];
  id v10 = [v8 assetPresenterAssetID];
  id v11 = [(BKMainFlowController *)self _bookWithAssetPermanentOrTemporaryAssetID:v10];

  id v12 = [(BKMainFlowController *)self _coverSourceFromHost:v9 assetPresenter:v8 book:v11 opening:1];
  LODWORD(v10) = [v8 stateDismissInProgress];

  if (v10) {
    [v9 coverAnimationHostScrollToMakeVisible:v12];
  }
  id v13 = [v12 coverAnimationSourceView];
  if (!v13)
  {
    double v14 = sub_1001D7384();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1007EF8AC(v11, v14);
    }
  }

  return v13;
}

- (void)presenterDismissModalController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(BKMainFlowController *)self presenterVisibleViewControllerWillChangeAnimated:v6];
  double v14 = _NSConcreteStackBlock;
  uint64_t v15 = 3221225472;
  v16 = sub_1001D899C;
  v17 = &unk_100A43E00;
  id v10 = v8;
  BOOL v21 = v6;
  id v19 = self;
  id v20 = v9;
  id v18 = v10;
  id v11 = v9;
  id v12 = objc_retainBlock(&v14);
  id v13 = [v10 bc_descendentPresentedViewController:v14, v15, v16, v17];
  if (v13) {
    [(BKMainFlowController *)self presenterDismissModalController:v13 animated:v6 completion:v12];
  }
  else {
    ((void (*)(void ***))v12[2])(v12);
  }
}

- (void)presenterDismissAllModalControllersAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [(BKMainFlowController *)self delegate];
  id v8 = [v7 rootViewController];
  id v9 = [v8 bc_descendentPresentedViewController];

  if (v9)
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1001D8BBC;
    v12[3] = &unk_100A43E28;
    v12[4] = self;
    BOOL v14 = v4;
    id v13 = v6;
    [(BKMainFlowController *)self presenterDismissModalController:v9 animated:v4 completion:v12];
  }
  else
  {
    id v10 = objc_retainBlock(v6);
    id v11 = v10;
    if (v10) {
      (*((void (**)(id))v10 + 2))(v10);
    }
  }
}

- (BOOL)presenterCanShowStoreProductOnCurrentContent
{
  return 1;
}

- (void)presenterFinishModalTransitionsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKMainFlowController *)self delegate];
  unsigned int v6 = [v5 isHostingRootBar];

  if (v6)
  {
    v7 = [(BKMainFlowController *)self selectedNavigationController];
    if (v7)
    {
      v11[0] = _NSConcreteStackBlock;
      v11[1] = 3221225472;
      v11[2] = sub_1001D8CF4;
      v11[3] = &unk_100A442B8;
      id v12 = v4;
      [v7 im_finishOngoingModalTransitionAnimations:v11];
    }
    else
    {
      id v9 = objc_retainBlock(v4);
      id v10 = v9;
      if (v9) {
        (*((void (**)(id))v9 + 2))(v9);
      }
    }
  }
  else
  {
    id v8 = objc_retainBlock(v4);
    v7 = v8;
    if (v8) {
      (*((void (**)(id))v8 + 2))(v8);
    }
  }
}

- (void)presenterVisibleViewControllerDidChangeAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[BKAppDelegate delegate];
  BOOL v5 = [v4 sceneManager];
  id v6 = [v5 minifiedFlowController];

  [v6 visibleViewControllersUpdatedPostTranstionAnimated:v3];
}

- (void)presenterSelectLibraryAllCollection
{
  id v3 = [(BKMainFlowController *)self rootBarCoordinator];
  v2 = +[BKRootBarItemsProvider LibraryAllIdentifier];
  [v3 selectWithIdentifier:v2 isUserAction:1];
}

- (void)presenterFixInterfaceOrientationIfNeededWithAssetPresenter:(id)a3 completion:(id)a4
{
}

- (void)presenterPrepareEndOfBookExperienceWithAssetPresenter:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = [v7 presentationController];
  BUDynamicCast();
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  id v9 = [(BKMainFlowController *)self selectedNavigationController];
  id v10 = +[BKRootBarItemsProvider HomeIdentifier];
  id v11 = [(BKMainFlowController *)self navigationControllerWithIdentifier:v10];

  [v12 setUseEndOfBookExperience:v9 == v11];
  [(BKMainFlowController *)self _updateReadingNowFeedWithAssetPresenter:v7 completion:v6];
}

- (void)presenterUpdateReadingNowAssetVisibility:(BOOL)a3 assetPresenter:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(BKMainFlowController *)self _closeToCurrentBookWithAssetPresenter:v6 opening:0];
  id v12 = [(BKMainFlowController *)self _refIdFromAssetPresenter:v6 closeToCurrentBook:v7];
  id v8 = [(BKMainFlowController *)self _refInstanceFromAssetPresenter:v6 closeToCurrentBook:v7];
  id v9 = [v6 assetPresenterAssetViewController];

  id v10 = [v9 presentingViewController];
  id v11 = [v10 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost stopIfDescendentConformsToProtocol:&OBJC_PROTOCOL___BCCoverNonAnimating includePresented:1];

  if (objc_opt_respondsToSelector()) {
    [v11 coverAnimationHostUpdateItemVisibility:v4 refId:v12 refInstance:v8];
  }
}

- (void)presenterDidStartReadingExperienceWithAssetPresenter:(id)a3
{
}

- (void)presenterDidEndReadingExperienceWithAssetPresenter:(id)a3
{
  [(BKMainFlowController *)self _updateReadingNowFeedWithPerformantForReadingExperience:0 for:a3];
  BOOL v4 = [(BKMainFlowController *)self presenterModalPresentingViewController];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  BOOL v5 = [v4 childViewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = [*(id *)(*((void *)&v11 + 1) + 8 * (void)v9) view];
        [v10 setAccessibilityElementsHidden:0];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)presenterEnsureCanOpenBookInCurrentContext:(BOOL)a3
{
  BOOL v5 = [(BKMainFlowController *)self delegate];
  unsigned int v6 = [v5 isHostingRootBar];

  if (v6 && ![(BKMainFlowController *)self presenterIsShowingLibrary] && !a3)
  {
    [(BKMainFlowController *)self presenterSelectLibraryAllCollection];
  }
}

- (BOOL)isBookCurrentlyOpen
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v3 = [WeakRetained rootViewController];
  BOOL v4 = [v3 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting includePresented:1];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)presenterShouldOpenBookUsingLargeCover
{
  id v3 = [(BKMainFlowController *)self presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
  if (v3)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    BOOL v5 = [(BKMainFlowController *)self delegate];
    if (![v5 isHostingRootBar]
      || [(BKMainFlowController *)self presenterIsShowingLibrary]
      || [(BKMainFlowController *)self presenterIsShowingStore])
    {
      unsigned int v6 = +[BKAppDelegate delegate];
      id v7 = [v6 appLaunchCoordinator];
      unsigned int v4 = [v7 appLaunchCoordinatorHasAppLaunched] ^ 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (void)showLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = +[BUAccountsProvider sharedProvider];
  unsigned int v8 = [v7 isUserSignedInToiTunes];

  if (v8)
  {
    id v9 = +[BDSJaliscoDAAPClient sharedClient];
    [v9 updatePolitely:1 reason:4 completion:0];
  }
  [(BKMainFlowController *)self presenterSelectLibraryAllCollection];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1001D9440;
  v10[3] = &unk_100A4AC08;
  BOOL v11 = a3;
  [(BKMainFlowController *)self _transition:v10 animator:0 completion:v6];
}

- (void)showLibraryAnimated:(BOOL)a3 assetID:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = +[BUAccountsProvider sharedProvider];
  unsigned int v11 = [v10 isUserSignedInToiTunes];

  if (v11)
  {
    long long v12 = +[BDSJaliscoDAAPClient sharedClient];
    [v12 updatePolitely:1 reason:4 completion:0];
  }
  [(BKMainFlowController *)self presenterSelectLibraryAllCollection];
  long long v13 = [(BKMainFlowController *)self rootBarCoordinator];
  long long v14 = +[BKRootBarItemsProvider LibraryAllIdentifier];
  uint64_t v15 = [v13 navigationControllerForIdentifier:v14];

  id v16 = [v15 popToRootViewControllerAnimated:0];
  objc_opt_class();
  v17 = [v15 topViewController];
  id v18 = BUDynamicCast();

  [v18 scrollToMakeLibraryAssetIDVisible:v9];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001D961C;
  v19[3] = &unk_100A4AC08;
  BOOL v20 = a3;
  [(BKMainFlowController *)self _transition:v19 animator:0 completion:v8];
}

- (id)_bookWithAssetPermanentOrTemporaryAssetID:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKMainFlowController *)self libraryAssetProvider];
  id v6 = [v5 libraryAssetOnMainQueueWithPermanentOrTemporaryAssetID:v4];

  return v6;
}

- (id)_coverImageForAssetID:(id)a3 toViewController:(id)a4 forAssetViewController:(id)a5 source:(id)a6 coverImage:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if (!v16)
  {
    if (v15)
    {
      id v16 = [v15 coverAnimationSourceImage];
    }
    else
    {
      v17 = [v13 view];
      [v17 bounds];
      double v19 = v18;
      double v21 = v20;

      id v22 = [(BKMainFlowController *)self _bookWithAssetPermanentOrTemporaryAssetID:v12];
      if (!v22
        || (BCReportAssertionFailureWithMessage(),
            +[BKLibraryManager fetchImageForAsset:size:includeSpine:coverEffectsEnvironment:](BKLibraryManager, "fetchImageForAsset:size:includeSpine:coverEffectsEnvironment:", v22, 1, self, v19, v21), unsigned __int8 v23 = objc_claimAutoreleasedReturnValue(), +[UIImage imageWithCGImage:](UIImage, "imageWithCGImage:", [v23 CGImage]), v24 = objc_claimAutoreleasedReturnValue(), v23, !v24))
      {
        [v22 isRightToLeft];
        id v25 = +[UIScreen mainScreen];
        [v25 scale];
        [v22 isPreorderBook];
        [v22 isAudiobook];

        CGSizeScale();
        if (v22 || (uint64_t ImageWithStyle = BKGenericBookCoverCreateImageWithStyle()) == 0)
        {
          uint64_t Image = BKGenericBookCoverCreateImage();
          id v24 = +[UIImage imageWithCGImage:Image];
          BOOL v27 = (CGImage *)Image;
        }
        else
        {
          id v29 = (CGImage *)ImageWithStyle;
          id v24 = +[UIImage imageWithCGImage:ImageWithStyle];
          BOOL v27 = v29;
        }
        CGImageRelease(v27);
      }
      id v16 = v24;
    }
  }

  return v16;
}

- (id)_minibarRevealAnimatorWithViewController:(id)a3 opening:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = BUProtocolCast();
  id v6 = +[BKAppDelegate delegate];
  id v7 = [v6 sceneManager];
  id v8 = [v7 minifiedFlowController];

  if (v5
    && ([v5 assetPresenterAssetID],
        id v9 = objc_claimAutoreleasedReturnValue(),
        unsigned int v10 = [v8 shouldAnimateAssetWithAssetIDFromMinibar:v9],
        v9,
        v10))
  {
    unsigned int v11 = [[BKMinibarRevealAnimator alloc] initWithOpening:v4];
  }
  else
  {
    unsigned int v11 = 0;
  }

  return v11;
}

- (id)_bookAndCoverAnimatorFrom:(id)a3 to:(id)a4 operation:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  unsigned int v10 = [v8 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost stopIfDescendentConformsToProtocol:&OBJC_PROTOCOL___BCCoverNonAnimating includePresented:1];
  unsigned int v11 = [v8 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting includePresented:0];
  BOOL v12 = v11 == 0;

  uint64_t v13 = [v9 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting includePresented:v12];
  id v14 = (void *)v13;
  if (v10) {
    BOOL v15 = v13 == 0;
  }
  else {
    BOOL v15 = 1;
  }
  int v16 = !v15;
  if (!v15)
  {
    if (a5 == 1)
    {
      id v17 = (id)v13;
      id v18 = v10;
      goto LABEL_10;
    }
LABEL_18:

    endOfBookCoverAnimationSource = self->_endOfBookCoverAnimationSource;
    self->_endOfBookCoverAnimationSource = 0;

    id v20 = 0;
    id v17 = 0;
    id v18 = 0;
    id v22 = 0;
    goto LABEL_24;
  }
  if (a5 != 2) {
    goto LABEL_18;
  }
  [v8 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  double v21 = [v17 assetPresenterPermanentOrTemporaryAssetID];
  id v20 = [(BKMainFlowController *)self _bookWithAssetPermanentOrTemporaryAssetID:v21];

  [v9 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost stopIfDescendentConformsToProtocol:&OBJC_PROTOCOL___BCCoverNonAnimating includePresented:1 validateItem:v20];
  id v18 = (id)objc_claimAutoreleasedReturnValue();

  id v22 = 0;
  BOOL v23 = v17 != 0;
  if (v18 && v17)
  {
    if (v20)
    {
LABEL_15:
      id v24 = self->_endOfBookCoverAnimationSource;
      if (v24)
      {
        id v25 = v24;
LABEL_17:
        double v26 = v25;
LABEL_20:
        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_1001D9EF8;
        v48[3] = &unk_100A4AD10;
        id v17 = v17;
        id v49 = v17;
        id v20 = v20;
        char v56 = v16;
        id v50 = v20;
        id v51 = v26;
        id v18 = v18;
        id v52 = v18;
        v53 = self;
        id v54 = v9;
        id v55 = v8;
        id v28 = v26;
        id v29 = objc_retainBlock(v48);
        id v22 = ((void (*)(void *, void))v29[2])(v29, 0);

        BOOL v23 = 1;
        goto LABEL_21;
      }
      double v26 = [v17 assetPresenterCoverAnimationSource];
      if (v26) {
        goto LABEL_20;
      }
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {
        double v26 = 0;
        goto LABEL_40;
      }
      if (v16)
      {
        BOOL v32 = [v17 openOptions];
      }
      else
      {
        objc_opt_class();
        objc_opt_class();
        uint64_t v33 = BUDynamicCast();
        BOOL v34 = [(id)v33 presentationController];
        id v35 = BUDynamicCast();

        LOBYTE(v33) = [v35 useEndOfBookExperience];
        uint64_t v36 = [v17 openOptions];
        BOOL v32 = (void *)v36;
        if (v33)
        {
          v46 = (void *)v36;
          [v17 assetPresenterAssetID];
          uint64_t v44 = v47 = 0;
          CGRect v45 = @"currentBook";
LABEL_39:
          v43 = (void *)v44;
          double v26 = [v18 coverAnimationHostSourceForUUID:0 uid:v47 refId:v45 refInstance:v44];

LABEL_40:
          if (v26 || !v20) {
            goto LABEL_20;
          }
          id v25 = [v18 coverAnimationHostSourceForItem:v20];
          goto LABEL_17;
        }
      }
      v47 = [v32 objectForKeyedSubscript:@"BKBookPresentingAnimateFromUid"];
      uint64_t v37 = [v32 objectForKeyedSubscript:@"BKBookPresentingAnimateFromRefId"];
      v38 = (void *)v37;
      id v39 = @"cover";
      if (v37) {
        id v39 = (__CFString *)v37;
      }
      CGRect v45 = v39;

      v46 = v32;
      v40 = [v32 objectForKeyedSubscript:@"BKBookPresentingAnimateFromRefInstance"];
      BOOL v41 = v40;
      if (v40)
      {
        id v42 = v40;
      }
      else
      {
        id v42 = [v17 assetPresenterAssetID];
      }
      uint64_t v44 = (uint64_t)v42;

      goto LABEL_39;
    }
LABEL_10:
    double v19 = [v17 assetPresenterPermanentOrTemporaryAssetID];
    id v20 = [(BKMainFlowController *)self _bookWithAssetPermanentOrTemporaryAssetID:v19];

    goto LABEL_15;
  }
LABEL_21:
  id v30 = self->_endOfBookCoverAnimationSource;
  self->_endOfBookCoverAnimationSource = 0;

  if (!v22 && v23)
  {
    id v22 = +[BKCrossFadeTransition transitionWithDuration:0.25];
  }
LABEL_24:

  return v22;
}

- (id)_coverSourceFromHost:(id)a3 assetPresenter:(id)a4 book:(id)a5 opening:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  endOfBookCoverAnimationSource = self->_endOfBookCoverAnimationSource;
  if (endOfBookCoverAnimationSource)
  {
    id v14 = endOfBookCoverAnimationSource;
LABEL_3:
    BOOL v15 = v14;
    goto LABEL_5;
  }
  BOOL v15 = [v11 assetPresenterCoverAnimationSource];
  if (!v15)
  {
    if ((objc_opt_respondsToSelector() & 1) == 0) {
      goto LABEL_17;
    }
    BOOL v17 = [(BKMainFlowController *)self _closeToCurrentBookWithAssetPresenter:v11 opening:v6];
    id v18 = [v11 openOptions];
    double v19 = v18;
    if (v17)
    {
      id v20 = 0;
    }
    else
    {
      id v20 = [v18 objectForKeyedSubscript:@"BKBookPresentingAnimateFromUid"];
    }
    double v21 = [(BKMainFlowController *)self _refIdFromAssetPresenter:v11 closeToCurrentBook:v17];
    id v22 = [(BKMainFlowController *)self _refInstanceFromAssetPresenter:v11 closeToCurrentBook:v17];
    BOOL v15 = [v10 coverAnimationHostSourceForUUID:0 uid:v20 refId:v21 refInstance:v22];

    if (!v15)
    {
LABEL_17:
      id v14 = [v10 coverAnimationHostSourceForItem:v12];
      goto LABEL_3;
    }
  }
LABEL_5:
  if (!v6 && v15 && [v10 coverAnimationHostWantsScrollOnClose]) {
    [v10 coverAnimationHostScrollToMakeVisible:v15];
  }

  return v15;
}

- (BOOL)_closeToCurrentBookWithAssetPresenter:(id)a3 opening:(BOOL)a4
{
  if (a4) {
    return 0;
  }
  id v5 = a3;
  objc_opt_class();
  objc_opt_class();
  BOOL v6 = BUDynamicCast();

  id v7 = [v6 presentationController];
  id v8 = BUDynamicCast();

  LOBYTE(v7) = [v8 useEndOfBookExperience];
  return (char)v7;
}

- (id)_refIdFromAssetPresenter:(id)a3 closeToCurrentBook:(BOOL)a4
{
  id v5 = [a3 openOptions];
  BOOL v6 = v5;
  if (a4)
  {
    id v7 = @"currentBook";
  }
  else
  {
    uint64_t v8 = [v5 objectForKeyedSubscript:@"BKBookPresentingAnimateFromRefId"];
    id v9 = (void *)v8;
    id v10 = @"cover";
    if (v8) {
      id v10 = (__CFString *)v8;
    }
    id v7 = v10;
  }

  return v7;
}

- (id)_refInstanceFromAssetPresenter:(id)a3 closeToCurrentBook:(BOOL)a4
{
  id v5 = a3;
  BOOL v6 = [v5 openOptions];
  id v7 = v6;
  if (a4)
  {
    uint64_t v8 = [v5 assetPresenterAssetID];
  }
  else
  {
    id v9 = [v6 objectForKeyedSubscript:@"BKBookPresentingAnimateFromRefInstance"];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [v5 assetPresenterAssetID];
    }
    uint64_t v8 = v11;
  }

  return v8;
}

- (BOOL)_navigationControllerShouldUseBuiltinInteractionController:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMainFlowController *)self selectedNavigationController];
  BOOL v6 = [v5 topViewController];
  id v7 = BUProtocolCast();

  if (v7 || [(BKMainFlowController *)self presenterIsShowingLibrary])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [v4 viewControllers];
    BOOL v8 = (unint64_t)[v9 count] > 1;
  }
  return v8;
}

- (void)presenterWaitForAssetPresenterTransitionsToFinishIfNeededWithCompletion:(id)a3
{
  id v4 = a3;
  id v6 = [(BKMainFlowController *)self delegate];
  id v5 = [v6 rootViewController];
  [v5 im_finishOngoingModalTransitionAnimations:v4];
}

- (void)presenterSelectTabWithIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(BKMainFlowController *)self rootBarCoordinator];
  [v5 selectWithIdentifier:v4 isUserAction:1];
}

- (id)_animatorFromViewController:(id)a3 toViewController:(id)a4 operation:(int64_t)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = 0;
  if (v10 != v11 && v6)
  {
    id v12 = [(BKMainFlowController *)self animator];
    if (!v12)
    {
      id v12 = [(BKMainFlowController *)self _minibarRevealAnimatorWithViewController:v11 opening:1];
      if (!v12)
      {
        id v12 = [(BKMainFlowController *)self _minibarRevealAnimatorWithViewController:v10 opening:0];
        if (!v12)
        {
          id v12 = [(BKMainFlowController *)self _bookAndCoverAnimatorFrom:v10 to:v11 operation:a5];
        }
      }
    }
  }

  return v12;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(BKMainFlowController *)self animator];
  if (v12)
  {
    uint64_t v13 = BUProtocolCast();
    [(BKMainFlowController *)self setStatusBarStyling:v13];

    id v14 = [(BKMainFlowController *)self statusBarStyling];
    [v14 configureWithFromViewController:v10 toViewController:v11];

    [v9 setNeedsStatusBarAppearanceUpdate];
  }

  return v12;
}

- (void)im_navigationController:(id)a3 dismissChildViewController:(id)a4 animated:(BOOL)a5
{
}

- (void)_fixInterfaceOrientationForEndOfBookTransitionForDismissingViewController:(id)a3 completion:(id)a4
{
  id v18 = a4;
  id v6 = a3;
  id v7 = +[BKRootBarItemsProvider HomeIdentifier];
  BOOL v8 = [(BKMainFlowController *)self navigationControllerWithIdentifier:v7];

  objc_opt_class();
  id v9 = [v8 viewControllers];
  id v10 = [v9 firstObject];
  id v11 = BUDynamicCast();

  id v12 = [v6 bc_windowForViewController];

  uint64_t v13 = [v12 windowScene];
  id v14 = (char *)[v13 interfaceOrientation];

  unsigned int v15 = [v11 supportedInterfaceOrientationsForSelf];
  if ((unint64_t)(v14 - 3) > 1 || (v15 & (1 << (char)v14)) != 0)
  {
    id v16 = objc_retainBlock(v18);
    BOOL v17 = v16;
    if (v16) {
      (*((void (**)(id, void))v16 + 2))(v16, 0);
    }
  }
  else
  {
    [(BKMainFlowController *)self _forceOrientationToPortrait:v18];
  }
}

- (void)_updateReadingNowFeedWithAssetPresenter:(id)a3 completion:(id)a4
{
  id v17 = a3;
  id v6 = a4;
  if (v17)
  {
    id v7 = +[BKRootBarItemsProvider HomeIdentifier];
    BOOL v8 = [(BKMainFlowController *)self navigationControllerWithIdentifier:v7];

    objc_opt_class();
    id v9 = [v8 viewControllers];
    id v10 = [v9 firstObject];
    id v11 = BUDynamicCast();

    id v12 = [v11 viewIfLoaded];
    uint64_t v13 = [v12 window];

    if (v13)
    {
      id v14 = [v17 viewIfLoaded];
      unsigned int v15 = [v14 window];

      if (v15 == v13) {
        [v11 updateFeedContentWithCompletion:v6];
      }
    }
  }
  else
  {
    id v16 = objc_retainBlock(v6);
    BOOL v8 = v16;
    if (v16) {
      (*((void (**)(id))v16 + 2))(v16);
    }
  }
}

- (void)_updateReadingNowFeedWithPerformantForReadingExperience:(BOOL)a3 for:(id)a4
{
  BOOL v4 = a3;
  id v15 = a4;
  id v6 = +[BKRootBarItemsProvider HomeIdentifier];
  id v7 = [(BKMainFlowController *)self navigationControllerWithIdentifier:v6];

  objc_opt_class();
  BOOL v8 = [v7 viewControllers];
  id v9 = [v8 firstObject];
  id v10 = BUDynamicCast();

  id v11 = [v10 viewIfLoaded];
  id v12 = [v11 window];

  if (v12)
  {
    uint64_t v13 = [v15 viewIfLoaded];
    id v14 = [v13 window];

    if (v14 == v12) {
      [v10 setPerformantForReadingExperience:v4];
    }
  }
}

- (BOOL)_currentlySelectedTabIsStore
{
  v2 = [(BKMainFlowController *)self rootBarCoordinator];
  id v3 = [v2 selectedItem];
  BOOL v4 = [v3 identifier];

  LOBYTE(v2) = +[BKRootBarItemsProvider isStoreOnlyFor:v4];
  return (char)v2;
}

- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(BKMainFlowController *)self selectedNavigationController];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1001DAFEC;
  v9[3] = &unk_100A44818;
  v9[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  [v7 im_finishOngoingModalTransitionAnimations:v9];
}

- (BOOL)_doesPreviousViewControllerSupportCurrentOrientation
{
  return 1;
}

- (void)_forceOrientationToPortrait:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = [(BKMainFlowController *)self delegate];
  id v6 = [v5 rootViewController];
  id v7 = [v6 bc_windowForViewController];
  id v8 = [v7 windowScene];
  id v9 = BUDynamicCast();

  if (v9)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001DB470;
    v13[3] = &unk_100A46A58;
    id v14 = v4;
    [v9 attemptRotateToPortraitWithCompletion:v13];
    id v10 = v14;
  }
  else
  {
    BOOL v11 = sub_1001D7384();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1007EF944(v11);
    }

    id v12 = objc_retainBlock(v4);
    id v10 = v12;
    if (v12) {
      (*((void (**)(id, void))v12 + 2))(v12, 0);
    }
  }
}

- (unint64_t)coverEffectsContent
{
  return 0;
}

- (BOOL)coverEffectsNightMode
{
  v2 = [(BKMainFlowController *)self presenterFirstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCUCoverEffectsEnvironment];
  unsigned __int8 v3 = [v2 coverEffectsNightMode];

  return v3;
}

- (id)coverEffectRTLOverride
{
  return 0;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  id v9 = BUDynamicCast();
  if (+[BKUIPFeatures useUIPFluidBookOpenTransition]
    && ![v9 useLegacyAnimation])
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [(BKMainFlowController *)self _animatorFromViewController:v8 toViewController:v7 operation:1 animated:1];
  }

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();
  if (+[BKUIPFeatures useUIPFluidBookOpenTransition]
    && ![v5 useLegacyAnimation])
  {
    id v17 = 0;
  }
  else
  {
    id v6 = [v4 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BKAssetPresenting];
    id v7 = [v6 assetPresenterAssetViewController];
    id v8 = [v6 assetPresenterAssetID];
    id v9 = [(BKMainFlowController *)self _bookWithAssetPermanentOrTemporaryAssetID:v8];

    id v10 = [v7 readerType];
    BOOL v11 = [v4 presentingViewController];
    id v12 = v11;
    if (v10 == (id)6)
    {
      id v29 = v5;
      uint64_t v13 = [v11 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___BCCoverAnimatingHost stopIfDescendentConformsToProtocol:&OBJC_PROTOCOL___BCCoverNonAnimating includePresented:1];

      id v30 = [v6 assetPresenterAssetViewController];
      BOOL v27 = (void *)v13;
      id v28 = v9;
      id v14 = [(BKMainFlowController *)self _coverSourceFromHost:v13 assetPresenter:v6 book:v9 opening:0];
      id v15 = [BKCloseBookAnimator alloc];
      id v16 = [(BKMainFlowController *)self bookOpenAnimationHelper];
      id v17 = [(BKCloseBookAnimator *)v15 initWithContentHelper:v16 coverSource:v14];

      objc_initWeak(location, self);
      v33[0] = _NSConcreteStackBlock;
      v33[1] = 3221225472;
      v33[2] = sub_1001DB9BC;
      v33[3] = &unk_100A47A50;
      objc_copyWeak(&v35, location);
      id v18 = v6;
      id v34 = v18;
      [(BKCloseBookAnimator *)v17 setAnimationComplete:v33];
      double v19 = BUProtocolCast();
      id v20 = [v19 coverAnimationSourceCurrentBookWidgetInfo];
      unsigned __int8 v21 = [v20 isCover];
      if (v19) {
        char v22 = v21;
      }
      else {
        char v22 = 1;
      }
      if (v22)
      {
        BOOL v23 = [v18 assetPresenterAssetID];
        id v24 = [v18 assetPresenterCoverImage];
        id v25 = [(BKMainFlowController *)self _coverImageForAssetID:v23 toViewController:v4 forAssetViewController:v30 source:v14 coverImage:v24];
        [(BKCloseBookAnimator *)v17 setCoverImage:v25];
      }
      else
      {
        v31[0] = _NSConcreteStackBlock;
        v31[1] = 3221225472;
        v31[2] = sub_1001DBA10;
        v31[3] = &unk_100A4AD88;
        id v32 = v19;
        [(BKCloseBookAnimator *)v17 setSpreadSnapshot:v31];
        BOOL v23 = v32;
      }

      objc_destroyWeak(&v35);
      objc_destroyWeak(location);

      id v9 = v28;
      id v5 = v29;
    }
    else
    {
      id v17 = [(BKMainFlowController *)self _animatorFromViewController:v4 toViewController:v11 operation:2 animated:1];
    }
  }

  return v17;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  BUProtocolCast();
  id v8 = (BKAssetPresentationController *)objc_claimAutoreleasedReturnValue();

  if (v8) {
    id v8 = [[BKAssetPresentationController alloc] initWithPresentedViewController:v6 presentingViewController:v7];
  }

  return v8;
}

- (void)saveStateClosing:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKMainFlowController *)self delegate];
  id v5 = [v4 rootViewController];
  id v6 = [v5 im_firstVisibleChildConformingToProtocol:&OBJC_PROTOCOL___AEAssetViewController];

  [v6 saveStateClosing:v3];
  id v7 = +[BKAppDelegate delegate];
  id v8 = [v7 sceneManager];
  id v9 = [v8 minifiedFlowController];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v10 = [v9 minifiedAssetPresenters];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v15 minifiedAssetPresenterIsAudiobook]) {
          [v15 minifiedAssetPresenterSaveStateClosing:v3];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }
}

- (BKLibraryAssetProvider)libraryAssetProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_libraryAssetProvider);

  return (BKLibraryAssetProvider *)WeakRetained;
}

- (UIViewControllerAnimatedTransitioning)animator
{
  return self->_animator;
}

- (void)setAnimator:(id)a3
{
}

- (void)setStatusBarStyling:(id)a3
{
}

- (UIViewController)transitionPreviousTopViewController
{
  return self->_transitionPreviousTopViewController;
}

- (void)setTransitionPreviousTopViewController:(id)a3
{
}

- (unint64_t)viewType
{
  return self->_viewType;
}

- (void)setViewType:(unint64_t)a3
{
  self->_viewType = a3;
}

- (BCCoverAnimatingSource)endOfBookCoverAnimationSource
{
  return self->_endOfBookCoverAnimationSource;
}

- (void)setEndOfBookCoverAnimationSource:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endOfBookCoverAnimationSource, 0);
  objc_storeStrong((id *)&self->_transitionPreviousTopViewController, 0);
  objc_destroyWeak((id *)&self->_statusBarStyling);
  objc_storeStrong((id *)&self->_animator, 0);
  objc_destroyWeak((id *)&self->_libraryAssetProvider);

  objc_destroyWeak((id *)&self->_delegate);
}

- (BKContentOpenAnimationHelper)bookOpenAnimationHelper
{
  v2 = self;
  BOOL v3 = (void *)BKMainFlowController.bookOpenAnimationHelper.getter();

  return (BKContentOpenAnimationHelper *)v3;
}

- (void)setBookOpenAnimationHelper:(id)a3
{
}

- (BKMainFlowControllerDockingDelegate)dockingDelegate
{
  v2 = self;
  BOOL v3 = (void *)BKMainFlowController.dockingDelegate.getter();

  return (BKMainFlowControllerDockingDelegate *)v3;
}

- (void)setDockingDelegate:(id)a3
{
}

- (void)setNavigationDelegate:(id)a3
{
}

@end