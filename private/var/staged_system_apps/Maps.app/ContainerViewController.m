@interface ContainerViewController
- (BOOL)_canUpdateContainee:(id)a3 withLayout:(unint64_t)a4;
- (BOOL)_chromeEnabled;
- (BOOL)_isDeferringMapPopovers;
- (BOOL)_updateContaineeIfNeeded:(id)a3 withLayout:(unint64_t)a4;
- (BOOL)allowOnlyStandardStyle;
- (BOOL)allowsDisplayOnLockScreen;
- (BOOL)cardDismissalHelperShouldObserveGestures:(id)a3;
- (BOOL)chromeHidden;
- (BOOL)containeesHidden;
- (BOOL)controllerIsInStack:(id)a3;
- (BOOL)fullscreenMode;
- (BOOL)hasMargin;
- (BOOL)isContaineeStackEmpty;
- (BOOL)isRootContainer;
- (BOOL)isVLFCrowdsourcingPermissionCardActive;
- (BOOL)presentationControllerShouldDismiss:(id)a3;
- (BOOL)presentationStackAppearsCorrectWithInternalStack:(id)a3 uikitStack:(id)a4;
- (BOOL)preventEdgeInsetsUpdate;
- (BOOL)shouldHideCard;
- (BOOL)shouldPassPoint:(CGPoint)a3 withEvent:(id)a4 inView:(id)a5;
- (BOOL)showVLFCrowdsourcingPermissionCardWithContaineeDelegate:(id)a3 delegate:(id)a4 completion:(id)a5;
- (BOOL)stackOnOppositeSide;
- (BOOL)supportsEmptyStack;
- (BOOL)transitioning;
- (BOOL)useBackdrop;
- (BOOL)useBackdropFullScreen;
- (CardAnimation)cardHeightAnimation;
- (CardAnimationManager)animationManager;
- (ContaineeProtocol)currentOrPendingViewController;
- (ContaineeProtocol)currentViewController;
- (ContaineeProtocol)modalPresenter;
- (ContaineeProtocol)rootPresentingViewController;
- (ContainerDelegate)containerDelegate;
- (ContainerStyleManager)containerStyleManager;
- (ContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (IOSBasedChromeContext)chromeContext;
- (IOSBasedChromeViewController)chromeViewController;
- (NSArray)visibleCardViews;
- (NSArray)visibleViewControllers;
- (NSString)blurGroupName;
- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle;
- (StatusBarSupplementaryView)statusBarSupplementaryView;
- (UIEdgeInsets)_calculateMapEdgeInsets;
- (UIEdgeInsets)mapAttributionInsets;
- (UIView)containerView;
- (UIView)passThroughView;
- (double)_cardHeightForComputingBottomMapEdgeInsets;
- (double)attributionVerticalPadding;
- (double)availableHeight;
- (double)availableHeightForViewController:(id)a3;
- (double)bottomEdgeInset;
- (double)bottomEdgePadding;
- (double)bottomSafeOffset;
- (double)dismissalRectTopEdgeForCardDismissalHelper:(id)a3 coordinateSpace:(id)a4;
- (double)edgePadding;
- (double)floatingContainerBottomVerticalPadding;
- (double)leadingEdgePadding;
- (double)leftSafeOffset;
- (double)mapPeek;
- (double)rightSafeOffset;
- (double)statusBarHeight;
- (double)topEdgePadding;
- (double)topLabelEdgeInset;
- (id)cardForViewController:(id)a3;
- (id)cardWithBlur:(BOOL)a3;
- (id)currentContaineeState;
- (id)currentViewControllerWithPresentationStyle:(unint64_t)a3;
- (id)internalStackLessWaitingForPresentation;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (id)uikitPresentationStack;
- (int)currentMapViewTargetForAnalytics;
- (int)currentUITargetForAnalytics;
- (int64_t)VKApplicationUILayoutForStyle:(unint64_t)a3;
- (uint64_t)delaysFirstCardPresentation;
- (unint64_t)containeeLayout;
- (unint64_t)containerStyle;
- (unint64_t)layoutForCurrentViewControllerWithStyle:(unint64_t)a3;
- (unint64_t)layoutModalPresenter;
- (unint64_t)maxLayoutForEdgeInsetsUpdate;
- (unint64_t)originalLayoutForViewController:(id)a3;
- (unint64_t)overriddenLayoutForCurrentController:(unint64_t)a3;
- (unint64_t)transitionFrom:(id)a3 to:(id)a4;
- (void)_completeStateIfNeeded;
- (void)_dismissCurrentMenuViewControllerAnimated:(BOOL)a3;
- (void)_dismissMenuViewController:(id)a3 animated:(BOOL)a4;
- (void)_dismissPopoverViewController:(id)a3 animated:(BOOL)a4;
- (void)_dismissPresentedViewControllersIfNeededForViewController:(id)a3;
- (void)_internal_ensurePresentationsMatchContaineeStackAllowingFault:(BOOL)a3 allowingAnimations:(BOOL)a4 skipUnlock:(BOOL)a5;
- (void)_notifyObserversWithContainerStyle:(unint64_t)a3 value:(double)a4;
- (void)_notifyResizingObserversWithValue:(double)a3 onlyIfDragging:(BOOL)a4;
- (void)_popCurrentPopoverViewControllerAnimated:(BOOL)a3;
- (void)_popPalette:(BOOL)a3 completion:(id)a4;
- (void)_popoverDismissDidFinish;
- (void)_presentCurrentMenuViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentCurrentPopoverAnimated:(BOOL)a3 completion:(id)a4;
- (void)_presentMenuViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_presentPopoverViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_pushPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_sequentiallyPresentViewControllers:(id)a3 allowAnimations:(BOOL)a4;
- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3;
- (void)_statusBarHeightChanged;
- (void)_unlockCardQueue;
- (void)_updateBackdropConstraints;
- (void)_updateContainerMargins;
- (void)_updateOverrideTraitCollectionsForStyle:(unint64_t)a3;
- (void)_updateVisibleContentForLayout:(unint64_t)a3;
- (void)addChildViewController:(id)a3;
- (void)animateAlongsideCardTransition;
- (void)assertPresentationStackAppearsCorrect;
- (void)beginDeferringPresentingMapPopovers;
- (void)containee:(id)a3 didChangeLayout:(unint64_t)a4;
- (void)containee:(id)a3 willChangeLayout:(unint64_t)a4 source:(unint64_t)a5;
- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3;
- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3;
- (void)containerStyleManagerWillChangeStyle:(unint64_t)a3;
- (void)contentHeightUpdatedWithValue:(double)a3;
- (void)controller:(id)a3 wantsLayout:(unint64_t)a4;
- (void)customInit;
- (void)deferPresentingMapPopoversInsideBlock:(id)a3;
- (void)didChangeStyle:(unint64_t)a3;
- (void)didPresentContainee:(id)a3 finished:(BOOL)a4;
- (void)didResignContainee:(id)a3 finished:(BOOL)a4;
- (void)endDeferringPresentingMapPopovers;
- (void)endDeferringPresentingMapPopovers:(id)a3;
- (void)expandContainee:(id)a3;
- (void)macMenuPresentationControllerDidDismiss:(id)a3;
- (void)macMenuPresentationControllerWillDismiss:(id)a3;
- (void)macPopoverPresentationControllerDidDismiss:(id)a3;
- (void)macPopoverPresentationControllerWillDismiss:(id)a3;
- (void)macSetEnableExtendedPresentationStyles:(BOOL)a3;
- (void)macSetPopoverDismissHandler:(id)a3;
- (void)macWillDismissPopoverContaineeController:(id)a3;
- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4;
- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5;
- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)minimizeContainee:(id)a3;
- (void)popLastViewControllerAnimated:(BOOL)a3;
- (void)popLastViewControllerAnimated:(BOOL)a3 useDefaultContaineeLayout:(BOOL)a4;
- (void)popLastViewControllerFromViewController:(id)a3 animated:(BOOL)a4;
- (void)popLastViewControllerFromViewController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5;
- (void)popLastViewControllerWithInitialVelocity:(double)a3;
- (void)presentController:(id)a3;
- (void)presentController:(id)a3 animated:(BOOL)a4;
- (void)presentController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5;
- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)registerResizingObserver:(id)a3 withBlock:(id)a4;
- (void)removeCardforViewController:(id)a3;
- (void)removeChildViewController:(id)a3;
- (void)removeControllerFromStack:(id)a3;
- (void)replaceCurrentWithController:(id)a3;
- (void)replaceCurrentWithController:(id)a3 moveToContaineeDefaultLayout:(BOOL)a4;
- (void)replaceCurrentWithController:(id)a3 moveToContaineeLayout:(unint64_t)a4;
- (void)requestDismissalWithCardDismissalHelper:(id)a3;
- (void)reset;
- (void)resumePropagatingEdgeInsets;
- (void)sceneWillEnterForeground:(id)a3;
- (void)setAllowOnlyStandardStyle:(BOOL)a3;
- (void)setCaptureViewForCardView:(id)a3;
- (void)setChromeContext:(id)a3;
- (void)setChromeHidden:(BOOL)a3;
- (void)setChromeViewController:(id)a3;
- (void)setContaineesHidden:(BOOL)a3;
- (void)setContainerDelegate:(id)a3;
- (void)setContainerView:(id)a3;
- (void)setControllerStack:(id)a3;
- (void)setControllerStack:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)setCurrentViewController:(id)a3;
- (void)setFullscreenMode:(BOOL)a3;
- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4;
- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4 source:(unint64_t)a5;
- (void)setPreventEdgeInsetsUpdate:(BOOL)a3;
- (void)setStackOnOppositeSide:(BOOL)a3;
- (void)setTransitioning:(BOOL)a3;
- (void)setUseBackdropFullScreen:(BOOL)a3;
- (void)shareFromMenuDidSelect:(id)a3;
- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3;
- (void)snapToLayout:(unint64_t)a3;
- (void)suspendPropagatingEdgeInsetsForReason:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transitionEnded;
- (void)updateContaineeStackState;
- (void)updateHeightConstraintWithValue:(double)a3;
- (void)updateLayoutAnimated:(BOOL)a3;
- (void)updateMapEdgeInsets;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewLayoutMarginsDidChange;
- (void)viewSafeAreaInsetsDidChange;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willBeginDisplayingInSecureLockScreen;
- (void)willChangeStyle:(unint64_t)a3;
- (void)willPresentContainee:(id)a3 animated:(BOOL)a4;
- (void)willResignContainee:(id)a3 animated:(BOOL)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation ContainerViewController

- (void)reset
{
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    v3 = objc_alloc_init(ContainerStack);
    containerStack = self->_containerStack;
    self->_containerStack = v3;

    currentViewController = self->_currentViewController;
    self->_currentViewController = 0;
  }
  else
  {
    [(ContainerViewController *)self setControllerStack:&__NSArray0__struct];
  }
}

- (void)willResignContainee:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      [v9 container:self willResignContainee:v6 animated:v4];
    }
    v10 = +[NSNotificationCenter defaultCenter];
    v13[0] = @"ContainerAnimated";
    v11 = +[NSNumber numberWithBool:v4];
    v13[1] = @"ContainerContainee";
    v14[0] = v11;
    v14[1] = v6;
    v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v10 postNotificationName:@"ContainerWillResignContaineeNotification" object:self userInfo:v12];
  }
}

- (unint64_t)originalLayoutForViewController:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (self->_enableMacPresentationStyles)
  {
    id v6 = [(ContainerViewController *)self currentViewController];
    if (v6)
    {
      v7 = [(ContainerViewController *)self currentViewController];
      char v8 = [v7 cardPresentationController];
      unint64_t v9 = (unint64_t)[v8 defaultContaineeLayout];
    }
    else
    {
      v7 = [v5 cardPresentationController];
      unint64_t v9 = (unint64_t)[v7 defaultContaineeLayout];
    }
  }
  else
  {
    id v6 = [v4 cardPresentationController];
    unint64_t v9 = (unint64_t)[v6 defaultContaineeLayout];
  }

  if (!v9)
  {
    if (self->_enableMacPresentationStyles
      && ((id)[(ContainerViewController *)self containerStyle] == (id)5
       || (id)[(ContainerViewController *)self containerStyle] == (id)4))
    {
      unint64_t v9 = 3;
    }
    else
    {
      unint64_t v9 = 2;
    }
  }

  return v9;
}

- (void)_dismissPresentedViewControllersIfNeededForViewController:(id)a3
{
  id v43 = a3;
  id v4 = [(ContainerViewController *)self topMostPresentedViewController];
  v5 = v4;
  if (v4 && v4 != self)
  {
    while (1)
    {
      if ([(ContainerStack *)self->_containerStack indexOfContainee:v5] != 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_47;
      }
      id v6 = sub_1000BF6B8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        break;
      }
LABEL_24:

      int BOOL = GEOConfigGetBOOL();
      v28 = sub_1000BF6B8();
      BOOL v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);
      if (!BOOL)
      {
        if (v29)
        {
          v37 = self;
          v38 = (objc_class *)objc_opt_class();
          v39 = NSStringFromClass(v38);
          if ((objc_opt_respondsToSelector() & 1) == 0) {
            goto LABEL_44;
          }
          v40 = [(ContainerViewController *)v37 performSelector:"accessibilityIdentifier"];
          v41 = v40;
          if (v40 && ![v40 isEqualToString:v39])
          {
            v42 = +[NSString stringWithFormat:@"%@<%p, %@>", v39, v37, v41];
          }
          else
          {

LABEL_44:
            v42 = +[NSString stringWithFormat:@"%@<%p>", v39, v37];
          }

          *(_DWORD *)buf = 138543362;
          id v47 = v42;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}@] Allowing presentation on top of non-containee VC (opted out via config)", buf, 0xCu);
        }
        goto LABEL_47;
      }
      if (v29)
      {
        v30 = self;
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        if ((objc_opt_respondsToSelector() & 1) == 0) {
          goto LABEL_30;
        }
        v33 = [(ContainerViewController *)v30 performSelector:"accessibilityIdentifier"];
        v34 = v33;
        if (v33 && ![v33 isEqualToString:v32])
        {
          v35 = +[NSString stringWithFormat:@"%@<%p, %@>", v32, v30, v34];
        }
        else
        {

LABEL_30:
          v35 = +[NSString stringWithFormat:@"%@<%p>", v32, v30];
        }

        *(_DWORD *)buf = 138543362;
        id v47 = v35;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_INFO, "[%{public}@] Dismissing non-containee VC before presenting new VC", buf, 0xCu);
      }
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_1003CD49C;
      v44[3] = &unk_1012E5D08;
      v45 = v5;
      v36 = v5;
      +[UIViewController _performWithoutDeferringTransitions:v44];

      v5 = [(ContainerViewController *)self topMostPresentedViewController];

      if (!v5 || v5 == self) {
        goto LABEL_47;
      }
    }
    v7 = self;
    char v8 = (objc_class *)objc_opt_class();
    unint64_t v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      v10 = [(ContainerViewController *)v7 performSelector:"accessibilityIdentifier"];
      v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

LABEL_10:
        id v13 = v12;
        id v14 = v43;
        if (!v43)
        {
          v19 = @"<nil>";
LABEL_18:

          v20 = v19;
          v21 = v5;
          v22 = (objc_class *)objc_opt_class();
          v23 = NSStringFromClass(v22);
          if (objc_opt_respondsToSelector())
          {
            v24 = [(ContainerViewController *)v21 performSelector:"accessibilityIdentifier"];
            v25 = v24;
            if (v24 && ![v24 isEqualToString:v23])
            {
              v26 = +[NSString stringWithFormat:@"%@<%p, %@>", v23, v21, v25];

              goto LABEL_23;
            }
          }
          v26 = +[NSString stringWithFormat:@"%@<%p>", v23, v21];
LABEL_23:

          *(_DWORD *)buf = 138543874;
          id v47 = v13;
          __int16 v48 = 2114;
          v49 = v20;
          __int16 v50 = 2114;
          v51 = v26;
          _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "[%{public}@] Attempting to present VC (%{public}@) on top of a non-containee VC (%{public}@)", buf, 0x20u);

          goto LABEL_24;
        }
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        if (objc_opt_respondsToSelector())
        {
          v17 = [v14 performSelector:"accessibilityIdentifier"];
          v18 = v17;
          if (v17 && ![v17 isEqualToString:v16])
          {
            v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

            goto LABEL_16;
          }
        }
        v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_16:

        goto LABEL_18;
      }
    }
    v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
    goto LABEL_10;
  }
LABEL_47:
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  char v8 = (ContaineeProtocol *)a3;
  id v9 = a5;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    if (currentPopoverViewController == v8)
    {
      v13.receiver = self;
      v11 = &v13;
      goto LABEL_6;
    }
    [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:1];
  }
  v12 = self;
  v11 = (objc_super *)&v12;
LABEL_6:
  v11->super_class = (Class)ContainerViewController;
  -[objc_super presentViewController:animated:completion:](v11, "presentViewController:animated:completion:", v8, v6, v9, v12);
}

- (unint64_t)transitionFrom:(id)a3 to:(id)a4
{
  unint64_t v6 = [(ContainerStack *)self->_containerStack indexOfContainee:a4];
  BOOL v7 = a4 == 0;
  if (a4)
  {
    char v8 = (char *)v6;
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      id v9 = [(ContainerStack *)self->_containerStack allObjects];
      BOOL v7 = v8 != (char *)[v9 count] - 1;
    }
  }
  unint64_t v10 = [(ContainerViewController *)self containerStyle];
  unint64_t v11 = 2;
  if (v7) {
    unint64_t v11 = 3;
  }
  if (v10 == 6) {
    return v11;
  }
  else {
    return v7;
  }
}

- (void)suspendPropagatingEdgeInsetsForReason:(id)a3
{
  p_chromeViewController = &self->_chromeViewController;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_chromeViewController);
  BOOL v7 = [WeakRetained acquireMapInsetPropagationSuspensionTokenForReason:v5];

  id mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_id mapInsetPropagationSuspensionToken = v7;
}

- (void)viewSafeAreaInsetsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v3 viewSafeAreaInsetsDidChange];
  [(ContainerViewController *)self snapToLayout:[(ContainerViewController *)self containeeLayout]];
}

- (void)snapToLayout:(unint64_t)a3
{
  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
  {
    self->_shouldEndTransitionWhenAnimationCompletes = 1;
    id v5 = [(ContainerViewController *)self currentViewController];
    [v5 heightForLayout:a3];
    double v7 = v6;

    char v8 = [(ContainerViewController *)self currentViewController];
    id v9 = [v8 cardPresentationController];
    unsigned int v10 = [v9 updateHeightConstraintWithValue:v7];

    if (v10)
    {
      if ((id)[(ContainerViewController *)self layoutModalPresenter] == (id)3)
      {
        unint64_t v11 = [(ContainerViewController *)self currentViewController];
        v12 = [v11 cardPresentationController];
        unsigned int v13 = [v12 presentedModally];

        if (v13)
        {
          id v14 = [(ContainerViewController *)self modalPresenter];
          v15 = [v14 cardPresentationController];
          [v15 updateHeightConstraintWithValue:v7];
        }
      }
      v16 = [(ContainerViewController *)self view];
      [v16 updateConstraintsIfNeeded];

      v17 = [(ContainerViewController *)self animationManager];
      v18 = [v17 cardHeightAnimation];
      v22[0] = _NSConcreteStackBlock;
      v22[1] = 3221225472;
      v22[2] = sub_1003CC060;
      v22[3] = &unk_1012E8160;
      v22[4] = self;
      *(double *)&v22[5] = v7;
      v22[6] = a3;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_1003CC0BC;
      v21[3] = &unk_1012E7D28;
      v21[4] = self;
      [v18 applyWithAnimations:v22 completion:v21];
    }
    else
    {
      v19 = [(ContainerViewController *)self currentViewController];
      v20 = [v19 cardPresentationController];
      [v20 cardHeight];

      [(ContainerViewController *)self _completeStateIfNeeded];
    }
  }
}

- (void)willPresentContainee:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      [v9 container:self willPresentContainee:v6 animated:v4];
    }
    unsigned int v10 = +[NSNotificationCenter defaultCenter];
    v13[0] = @"ContainerAnimated";
    unint64_t v11 = +[NSNumber numberWithBool:v4];
    v13[1] = @"ContainerContainee";
    v14[0] = v11;
    v14[1] = v6;
    v12 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];
    [v10 postNotificationName:@"ContainerWillPresentContaineeNotification" object:self userInfo:v12];
  }
}

- (void)registerResizingObserver:(id)a3 withBlock:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (v11)
  {
    resizingBlocksByObserver = self->_resizingBlocksByObserver;
    if (resizingBlocksByObserver)
    {
      if (v6)
      {
LABEL_4:
        id v8 = [v6 copy];
        [(NSMapTable *)resizingBlocksByObserver setObject:v8 forKey:v11];

        goto LABEL_7;
      }
    }
    else
    {
      id v9 = +[NSMapTable weakToStrongObjectsMapTable];
      unsigned int v10 = self->_resizingBlocksByObserver;
      self->_resizingBlocksByObserver = v9;

      resizingBlocksByObserver = self->_resizingBlocksByObserver;
      if (v6) {
        goto LABEL_4;
      }
    }
    [(NSMapTable *)resizingBlocksByObserver removeObjectForKey:v11];
  }
LABEL_7:
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v3 viewLayoutMarginsDidChange];
  [(ContainerViewController *)self _updateContainerMargins];
}

- (void)sceneWillEnterForeground:(id)a3
{
  BOOL v4 = [a3 object];
  id v5 = [(ContainerViewController *)self chromeViewController];
  id v6 = [v5 _maps_uiScene];

  if (v4 == v6)
  {
    double v7 = sub_1000BF6B8();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v12 = 138412546;
      unsigned int v13 = self;
      __int16 v14 = 2080;
      v15 = "-[ContainerViewController sceneWillEnterForeground:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ %s", (uint8_t *)&v12, 0x16u);
    }

    if (-[ContainerViewController delaysFirstCardPresentation]_0())
    {
      id v8 = [(ContainerViewController *)self view];
      id v9 = [v8 window];
      unsigned int v10 = v9;
      if (v9 && self->_viewHasAppeared)
      {
        unsigned int v11 = [(ContainerViewController *)self isRootContainer];

        if (v11)
        {
          [(ContainerTransitionManager *)self->_transitionManager setContainerReadyToInsert:0];
          [(ContainerViewController *)self _internal_ensurePresentationsMatchContaineeStackAllowingFault:1 allowingAnimations:0 skipUnlock:0];
        }
      }
      else
      {
      }
    }
  }
}

- (void)_sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(ContainerViewController *)self view];
  [v4 setNeedsLayout];

  if ((GEOConfigGetBOOL() & 1) == 0
    && (([v5 _isDragging] & 1) != 0
     || [v5 _isGeneratingAnimations]))
  {
    [(ContainerViewController *)self updateMapEdgeInsets];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillAppear:](&v7, "viewWillAppear:");
  id v5 = [(ContainerViewController *)self currentViewController];
  [v5 willBecomeCurrent:v3];

  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 addObserver:self selector:"sceneWillEnterForeground:" name:UISceneWillEnterForegroundNotification object:0];
}

- (void)setCurrentViewController:(id)a3
{
  id v5 = (ContaineeProtocol *)a3;
  if (self->_currentViewController == v5) {
    goto LABEL_11;
  }
  id v6 = sub_1000BF6B8();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_super v7 = self;
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v10 = [(ContainerViewController *)v7 performSelector:"accessibilityIdentifier"];
      unsigned int v11 = v10;
      if (v10 && ![v10 isEqualToString:v9])
      {
        int v12 = +[NSString stringWithFormat:@"%@<%p, %@>", v9, v7, v11];

        goto LABEL_8;
      }
    }
    int v12 = +[NSString stringWithFormat:@"%@<%p>", v9, v7];
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v15 = v12;
    __int16 v16 = 2114;
    v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] currentViewController is now: %{public}@", buf, 0x16u);
  }
  objc_storeStrong((id *)&self->_currentViewController, a3);
  unsigned int v13 = [(ContaineeProtocol *)v5 parentViewController];

  if (v13 == self) {
    [(ContainerViewController *)self _updateOverrideTraitCollectionsForStyle:[(ContainerViewController *)self containerStyle]];
  }
LABEL_11:
}

- (void)popLastViewControllerFromViewController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = sub_1000BF6B8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    unsigned int v10 = self;
    if (!v10)
    {
      v15 = @"<nil>";
      goto LABEL_10;
    }
    unsigned int v11 = (objc_class *)objc_opt_class();
    int v12 = NSStringFromClass(v11);
    if (objc_opt_respondsToSelector())
    {
      unsigned int v13 = [(ContainerViewController *)v10 performSelector:"accessibilityIdentifier"];
      __int16 v14 = v13;
      if (v13 && ![v13 isEqualToString:v12])
      {
        v15 = +[NSString stringWithFormat:@"%@<%p, %@>", v12, v10, v14];

        goto LABEL_8;
      }
    }
    v15 = +[NSString stringWithFormat:@"%@<%p>", v12, v10];
LABEL_8:

LABEL_10:
    __int16 v16 = v15;
    id v17 = [v8 preferredPresentationStyle];
    containerStack = v10->_containerStack;

    *(_DWORD *)buf = 138544642;
    v31 = v15;
    __int16 v32 = 2112;
    id v33 = v8;
    __int16 v34 = 1024;
    BOOL v35 = v6;
    __int16 v36 = 1024;
    BOOL v37 = v5;
    __int16 v38 = 2048;
    id v39 = v17;
    __int16 v40 = 2112;
    v41 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] popLastViewControllerFromViewController: %@, animated: %d, useDefaultContaineeLayout: %d, preferredStyle: %lu, containerStack: %@", buf, 0x36u);
  }
  if (self->_enableMacPresentationStyles)
  {
    switch((unint64_t)[v8 preferredPresentationStyle])
    {
      case 0uLL:
      case 2uLL:
        v19 = +[UIMenuSystem mainSystem];
        [v19 setNeedsRebuild];

        goto LABEL_14;
      case 1uLL:
        v24 = [(ContainerViewController *)self chromeViewController];
        char v25 = objc_opt_respondsToSelector();

        if ((v25 & 1) == 0) {
          goto LABEL_31;
        }
        v22 = [(ContainerViewController *)self chromeViewController];
        [v22 popSidebarViewController];
        break;
      case 3uLL:
        [(ContainerViewController *)self _dismissPopoverViewController:v8 animated:v6];
        goto LABEL_31;
      case 4uLL:
        [(ContainerViewController *)self _popPalette:v6 completion:0];
        goto LABEL_31;
      case 5uLL:
        [(ContainerViewController *)self _dismissMenuViewController:v8 animated:v6];
        goto LABEL_31;
      case 6uLL:
        v28[0] = _NSConcreteStackBlock;
        v28[1] = 3221225472;
        v28[2] = sub_1003CA740;
        v28[3] = &unk_1012E5D58;
        v28[4] = self;
        id v29 = v8;
        [(ContainerViewController *)self dismissViewControllerAnimated:1 completion:v28];

        goto LABEL_31;
      default:
        goto LABEL_14;
    }
LABEL_24:

    goto LABEL_31;
  }
LABEL_14:
  unint64_t v20 = [(ContainerStack *)self->_containerStack indexOfContainee:v8];
  if (v20)
  {
    if (v20 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v21 = self->_containerStack;
      if (!self->_willBeginDisplayingInLockScreen)
      {
        v26 = [(ContainerStack *)v21 containeeStateAtIndex:v20 - 1];
        v27 = [v26 viewController];
        [(ContainerViewController *)self presentController:v27 animated:v6 useDefaultContaineeLayout:v5];

        goto LABEL_31;
      }
      v22 = [(ContainerStack *)v21 containeeStateAtIndex:v20];
      [(ContainerStack *)v21 removeContaineeState:v22];
      goto LABEL_24;
    }
  }
  else if ([(ContainerViewController *)self supportsEmptyStack])
  {
    if (self->_willBeginDisplayingInLockScreen) {
      id v23 = [(ContainerStack *)self->_containerStack popAll];
    }
    else {
      [(ContainerViewController *)self presentController:0 animated:v6 useDefaultContaineeLayout:v5];
    }
  }
LABEL_31:
}

- (ContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)ContainerViewController;
  BOOL v4 = [(ContainerViewController *)&v7 initWithNibName:a3 bundle:a4];
  BOOL v5 = v4;
  if (v4) {
    [(ContainerViewController *)v4 customInit];
  }
  return v5;
}

- (void)customInit
{
  BOOL v3 = +[NSMapTable strongToStrongObjectsMapTable];
  cards = self->_cards;
  self->_cards = v3;

  self->_containeeLayout = 0;
  BOOL v5 = objc_alloc_init(ContainerStack);
  containerStack = self->_containerStack;
  self->_containerStack = v5;

  objc_super v7 = [[ContainerStyleManager alloc] initWithContainer:self];
  containerStyleManager = self->_containerStyleManager;
  self->_containerStyleManager = v7;

  id v9 = [[ContainerTransitionManager alloc] initWithContainer:self];
  transitionManager = self->_transitionManager;
  self->_transitionManager = v9;

  unsigned int v11 = objc_alloc_init(CardAnimationManager);
  animationManager = self->_animationManager;
  self->_animationManager = v11;

  unsigned int v13 = objc_alloc_init(CardProvider);
  cardProvider = self->_cardProvider;
  self->_cardProvider = v13;
}

- (void)_notifyObserversWithContainerStyle:(unint64_t)a3 value:(double)a4
{
  if ((a3 | 4) != 5)
  {
    double v21 = 0.0;
LABEL_20:
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v24 = [(NSMapTable *)self->_resizingBlocksByObserver objectEnumerator];
    id v25 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v25)
    {
      id v26 = v25;
      uint64_t v27 = *(void *)v30;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(void *)v30 != v27) {
            objc_enumerationMutation(v24);
          }
          (*(void (**)(double, double))(*(void *)(*((void *)&v29 + 1) + 8 * i) + 16))(a4, v21);
        }
        id v26 = [v24 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v26);
    }

    return;
  }
  if (a3 == 5) {
    uint64_t v6 = 1;
  }
  else {
    uint64_t v6 = 2;
  }
  objc_super v7 = [(ContainerViewController *)self currentViewController];
  [v7 heightForLayout:v6];
  double v9 = v8;

  unsigned int v10 = [(ContainerViewController *)self currentViewController];
  [v10 heightForLayout:3];
  double v12 = v11;

  unsigned int v13 = self;
  double v14 = vabdd_f64(v12, v9);
  v15 = [(ContainerViewController *)v13 traitCollection];
  [v15 displayScale];
  double v16 = 1.0;
  if (v17 >= 1.0)
  {
    v18 = [(ContainerViewController *)v13 traitCollection];
    [v18 displayScale];
    double v16 = v19;
  }
  double v20 = 1.0 / v16;

  double v21 = 0.0;
  if (v14 > v20 && v9 < a4)
  {
    double v23 = (a4 - v9) / (v9 * 1.10000002 - v9);
    if (v23 < 0.0) {
      double v23 = 0.0;
    }
    if (v23 <= 1.0) {
      double v21 = v23;
    }
    else {
      double v21 = 1.0;
    }
  }
  if (v14 > v20) {
    goto LABEL_20;
  }
}

- (void)containerStyleManagerConfigureLayoutForStyle:(unint64_t)a3
{
  id v3 = [(ContainerViewController *)self iosBasedChromeViewController];
  [v3 setNeedsUpdateComponent:@"statusBarStyle" animated:0];
}

- (void)viewDidLayoutSubviews
{
  [(ContainerViewController *)self _updateContainerMargins];
  v9.receiver = self;
  v9.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v9 viewDidLayoutSubviews];
  if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0
    && ![(ContainerViewController *)self delaysFirstCardPresentation])
  {
    [(ContainerViewController *)self _unlockCardQueue];
  }
  id v3 = [(ContainerViewController *)self view];
  uint64_t v4 = [v3 superview];
  if (v4)
  {
    BOOL v5 = (void *)v4;
    uint64_t v6 = [(ContainerViewController *)self currentViewController];
    objc_super v7 = [v6 cardPresentationController];
    unsigned int v8 = [v7 usingSheetPresentation];

    if (v8)
    {
      [(ContainerViewController *)self _cardHeightForComputingBottomMapEdgeInsets];
      -[ContainerViewController contentHeightUpdatedWithValue:](self, "contentHeightUpdatedWithValue:");
    }
  }
  else
  {
  }
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v5 viewWillLayoutSubviews];
  id v3 = [(ContainerViewController *)self view];
  uint64_t v4 = [v3 superview];

  if (v4) {
    [(ContainerStyleManager *)self->_containerStyleManager updateLayoutStyle];
  }
}

- (void)_updateContainerMargins
{
  id v3 = [(ContainerViewController *)self view];
  uint64_t v4 = [v3 superview];

  if (v4) {
    [(ContainerStyleManager *)self->_containerStyleManager updateLayoutStyle];
  }

  [(ContainerViewController *)self updateMapEdgeInsets];
}

- (BOOL)fullscreenMode
{
  return self->_fullscreenMode;
}

- (double)topEdgePadding
{
  double v3 = sub_1000BBAF8();
  [(ContainerViewController *)self statusBarHeight];
  return v3 + v4;
}

- (double)edgePadding
{
  if ([(ContainerViewController *)self hasMargin])
  {
    double v3 = [(ContainerViewController *)self view];
    [v3 safeAreaInsets];
    double v5 = v4 + -21.0;

    return v5;
  }
  else
  {
    return sub_1000BBAF8();
  }
}

- (double)statusBarHeight
{
  v2 = [(ContainerViewController *)self iosBasedChromeViewController];
  [v2 statusBarHeight];
  double v4 = v3;

  return v4;
}

- (BOOL)hasMargin
{
  v2 = [(ContainerViewController *)self view];
  [v2 safeAreaInsets];
  BOOL v4 = v3 > 0.0;

  return v4;
}

- (IOSBasedChromeViewController)chromeViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);

  return (IOSBasedChromeViewController *)WeakRetained;
}

- (BOOL)allowOnlyStandardStyle
{
  return [(ContainerStyleManager *)self->_containerStyleManager allowOnlyStandardStyle];
}

- (unint64_t)layoutForCurrentViewControllerWithStyle:(unint64_t)a3
{
  BOOL v4 = [(ContainerViewController *)self currentContaineeState];
  id v5 = [v4 layoutForStyle:a3];

  return (unint64_t)v5;
}

- (id)currentContaineeState
{
  return [(ContainerStack *)self->_containerStack containeeStateForContainee:self->_currentViewController];
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5 completion:(id)a6
{
  int v7 = a5;
  BOOL v8 = a4;
  unsigned int v10 = (ContaineeProtocol *)a3;
  double v11 = (void (**)(id, uint64_t))a6;
  double v12 = sub_1000BF6B8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    v45 = v11;
    BOOL v13 = v8;
    double v14 = self;
    if (!v14)
    {
      double v19 = @"<nil>";
      goto LABEL_10;
    }
    v15 = (objc_class *)objc_opt_class();
    double v16 = NSStringFromClass(v15);
    if (objc_opt_respondsToSelector())
    {
      double v17 = [(ContainerViewController *)v14 performSelector:"accessibilityIdentifier"];
      v18 = v17;
      if (v17 && ![v17 isEqualToString:v16])
      {
        double v19 = +[NSString stringWithFormat:@"%@<%p, %@>", v16, v14, v18];

        goto LABEL_8;
      }
    }
    double v19 = +[NSString stringWithFormat:@"%@<%p>", v16, v14];
LABEL_8:

LABEL_10:
    double v20 = v19;
    id v21 = [(ContaineeProtocol *)v10 preferredPresentationStyle];
    containerStack = v14->_containerStack;

    *(_DWORD *)buf = 138544642;
    v58 = v19;
    __int16 v59 = 2112;
    v60 = v10;
    __int16 v61 = 1024;
    BOOL v8 = v13;
    BOOL v62 = v13;
    __int16 v63 = 1024;
    int v64 = v7;
    __int16 v65 = 2048;
    id v66 = v21;
    __int16 v67 = 2112;
    v68 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%{public}@] presentController: %@, animated: %d, useDefaultContaineeLayout: %d, preferredStyle: %lu, containerStack: %@", buf, 0x36u);

    double v11 = v45;
  }

  if (!self->_enableMacPresentationStyles)
  {
LABEL_14:
    if (self->_currentViewController == v10)
    {
      if (v11) {
        v11[2](v11, 1);
      }
      [(ContainerTransitionManager *)self->_transitionManager dequeueWaitingContainees];
      goto LABEL_33;
    }
    if (qword_10160EAD8 != -1) {
      dispatch_once(&qword_10160EAD8, &stru_1012E8110);
    }
    if (byte_1015DF7E0)
    {
      v24 = [(ContaineeProtocol *)v10 cardPresentationController];
      unsigned int v25 = [v24 alwaysUseDefaultContaineeLayout];

      v7 |= v25;
    }
    self->_containeeLayout = 0;
    BOOL v44 = v8;
    if (v10)
    {
      unint64_t v26 = [(ContainerStack *)self->_containerStack indexOfContainee:v10];
      if (v26 == 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v27 = [[ContaineeState alloc] initWithContainee:v10];
        uint64_t v28 = 0;
        uint64_t v29 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      unint64_t v26 = 0;
    }
    uint64_t v27 = [(ContainerStack *)self->_containerStack containeeStateAtIndex:v26];
    uint64_t v29 = [(ContaineeState *)v27 layoutForStyle:[(ContainerViewController *)self containerStyle]];
    uint64_t v28 = 1;
LABEL_27:
    long long v30 = [(ContainerViewController *)self currentViewController];
    long long v31 = [v30 cardPresentationController];
    unsigned int v32 = [v31 presentedModally] ^ 1;

    if ((v7 & v32 & 1) != 0 || !v29)
    {
      unint64_t v33 = [(ContainerViewController *)self originalLayoutForViewController:v10];
      __int16 v34 = [(ContaineeProtocol *)v10 cardPresentationController];
      unsigned int v35 = [v34 presentedModally];

      if (v35) {
        uint64_t v29 = 5;
      }
      else {
        uint64_t v29 = v33;
      }
    }
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_100107958;
    v50[3] = &unk_1012E8138;
    v50[4] = self;
    __int16 v36 = v10;
    char v53 = v28;
    v51 = v36;
    v52 = v27;
    BOOL v37 = v27;
    __int16 v38 = objc_retainBlock(v50);
    v46[0] = _NSConcreteStackBlock;
    v46[1] = 3221225472;
    v46[2] = sub_1003CB1D4;
    v46[3] = &unk_1012E5CE0;
    char v49 = v28;
    id v39 = v36;
    id v47 = v39;
    __int16 v48 = self;
    __int16 v40 = objc_retainBlock(v46);
    [(ContainerTransitionManager *)self->_transitionManager presentViewController:v39 isAlreadyInStack:v28 layout:v29 animated:v44 preprocess:v38 postprocess:v40 completion:v11];

    goto LABEL_33;
  }
  switch((unint64_t)[(ContaineeProtocol *)v10 preferredPresentationStyle])
  {
    case 0uLL:
    case 2uLL:
      double v23 = +[UIMenuSystem mainSystem];
      [v23 setNeedsRebuild];

      [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:1];
      goto LABEL_14;
    case 1uLL:
      v41 = [(ContainerViewController *)self chromeViewController];
      char v42 = objc_opt_respondsToSelector();

      if (v42)
      {
        id v43 = [(ContainerViewController *)self chromeViewController];
        [v43 pushSidebarViewController:v10];
      }
      break;
    case 3uLL:
      [(ContainerViewController *)self _presentPopoverViewController:v10 animated:v8 completion:v11];
      break;
    case 4uLL:
      [(ContainerViewController *)self _pushPalette:v10 animated:v8 completion:v11];
      break;
    case 5uLL:
      [(ContainerViewController *)self _presentMenuViewController:v10 animated:v8 completion:v11];
      break;
    case 6uLL:
      [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:1];
      [(ContaineeProtocol *)v10 setModalPresentationStyle:2];
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_1003CB16C;
      v54[3] = &unk_1012E80F0;
      v54[4] = self;
      v55 = v10;
      v56 = v11;
      [(ContainerViewController *)self presentViewController:v55 animated:1 completion:v54];

      break;
    default:
      goto LABEL_14;
  }
LABEL_33:
}

- (void)viewDidAppear:(BOOL)a3
{
  v12.receiver = self;
  v12.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v12 viewDidAppear:a3];
  self->_viewHasAppeared = 1;
  if (self->_needToUpdateHeight) {
    [(ContainerViewController *)self snapToLayout:[(ContainerViewController *)self containeeLayout]];
  }
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    BOOL v4 = [(ContainerViewController *)self view];
    id v5 = [v4 window];
    uint64_t v6 = [v5 _rootSheetPresentationController];
    [v6 _setShouldScaleDownBehindDescendantSheets:0];
  }
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    [(ContainerViewController *)self _internal_ensurePresentationsMatchContaineeStackAllowingFault:0 allowingAnimations:1 skipUnlock:0];
  }
  else if ([(ContainerViewController *)self delaysFirstCardPresentation])
  {
    [(ContainerViewController *)self _unlockCardQueue];
  }
  int v7 = [MapGestureCardDismissalHelper alloc];
  BOOL v8 = [(ContainerViewController *)self chromeViewController];
  objc_super v9 = [v8 mapView];
  unsigned int v10 = [(MapGestureCardDismissalHelper *)v7 initWithMapView:v9];
  cardDismissalHelper = self->_cardDismissalHelper;
  self->_cardDismissalHelper = v10;

  [(MapGestureCardDismissalHelper *)self->_cardDismissalHelper setDelegate:self];
}

- (void)_internal_ensurePresentationsMatchContaineeStackAllowingFault:(BOOL)a3 allowingAnimations:(BOOL)a4 skipUnlock:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  objc_super v9 = sub_1000BF6B8();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    unsigned int v35 = self;
    __int16 v36 = 2080;
    BOOL v37 = "-[ContainerViewController _internal_ensurePresentationsMatchContaineeStackAllowingFault:allowingAnimations:skipUnlock:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%@ %s", buf, 0x16u);
  }

  if ([(ContainerViewController *)self allowsDisplayOnLockScreen]) {
    goto LABEL_7;
  }
  unsigned int v10 = [(ContainerViewController *)self view];
  double v11 = [v10 window];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_7:
    BOOL v13 = [(ContainerViewController *)self internalStackLessWaitingForPresentation];
    double v14 = [(ContainerViewController *)self uikitPresentationStack];
    if ([(ContainerViewController *)self presentationStackAppearsCorrectWithInternalStack:v13 uikitStack:v14])
    {
      if (!a5)
      {
        v15 = sub_1000BF6B8();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          unsigned int v35 = self;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "%@ unlocking card queue because presentationStackAppearsCorrect YES", buf, 0xCu);
        }

        if (v6)
        {
          [(ContainerViewController *)self _unlockCardQueue];
        }
        else
        {
          v26[0] = _NSConcreteStackBlock;
          v26[1] = 3221225472;
          v26[2] = sub_1003CD0F4;
          v26[3] = &unk_1012E5D08;
          v26[4] = self;
          +[UIView performWithoutAnimation:v26];
        }
      }
      goto LABEL_30;
    }
    double v16 = [(ContainerViewController *)self chromeViewController];
    double v17 = [v16 presentedViewController];

    if (v17)
    {
      do
      {
        v18 = [v16 presentedViewController];

        double v19 = [v18 presentedViewController];

        double v16 = v18;
      }
      while (v19);
    }
    else
    {
      v18 = v16;
    }
    double v20 = [v18 transitionCoordinator];

    id v21 = sub_1000BF6B8();
    v22 = v21;
    if (v20)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v35 = self;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%@ presentation stack is incorrect but a presentation is occuring. adding completion to try again.", buf, 0xCu);
      }

      double v23 = [v18 transitionCoordinator];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1003CCFFC;
      v30[3] = &unk_1012E81B0;
      v30[4] = self;
      BOOL v31 = v7;
      BOOL v32 = v6;
      BOOL v33 = a5;
      [v23 animateAlongsideTransition:0 completion:v30];
      goto LABEL_29;
    }
    if (v7)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        unsigned int v35 = self;
        v24 = v22;
        os_log_type_t v25 = OS_LOG_TYPE_FAULT;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ Rebuilding because presentationStackAppearsCorrect is incorrect. Starting with dismiss of everything", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      unsigned int v35 = self;
      v24 = v22;
      os_log_type_t v25 = OS_LOG_TYPE_ERROR;
      goto LABEL_27;
    }

    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_1003CD014;
    v27[3] = &unk_1012E5CE0;
    v27[4] = self;
    uint64_t v28 = v13;
    BOOL v29 = v6;
    +[UIViewController _performWithoutDeferringTransitions:v27];
    double v23 = v28;
LABEL_29:

LABEL_30:
    goto LABEL_31;
  }
  BOOL v13 = sub_1000BF6B8();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    unsigned int v35 = self;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "%@ bailing on ensure check because we're on the lock screen, and this container cannot present on lock screen", buf, 0xCu);
  }
LABEL_31:
}

- (id)uikitPresentationStack
{
  double v3 = +[NSMutableArray array];
  BOOL v4 = [(ContainerViewController *)self chromeViewController];
  id v5 = [v4 presentedViewController];

  if (v5)
  {
    do
    {
      [v3 addObject:v5];
      uint64_t v6 = [v5 presentedViewController];

      id v5 = (void *)v6;
    }
    while (v6);
  }
  BOOL v7 = sub_1000BF6B8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412546;
    unsigned int v10 = self;
    __int16 v11 = 2112;
    objc_super v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "%@ UIKitPresentationStack %@", (uint8_t *)&v9, 0x16u);
  }

  return v3;
}

- (BOOL)presentationStackAppearsCorrectWithInternalStack:(id)a3 uikitStack:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = sub_1000BF6B8();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v24 = self;
    __int16 v25 = 2080;
    unint64_t v26 = "-[ContainerViewController presentationStackAppearsCorrectWithInternalStack:uikitStack:]";
    __int16 v27 = 2112;
    id v28 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "%@ %s %@", buf, 0x20u);
  }

  id v9 = [v6 count];
  if (v9 <= [v7 count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unsigned int v10 = v6;
    id v11 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      id v12 = v11;
      uint64_t v13 = *(void *)v19;
      while (2)
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          if ((objc_msgSend(v7, "containsObject:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18) & 1) == 0)
          {
            double v16 = sub_1000BF6B8();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v24 = self;
              _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ presentationStackAppearsCorrect NO containees not in UIKit presentation", buf, 0xCu);
            }

            goto LABEL_18;
          }
        }
        id v12 = [v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
        BOOL v15 = 1;
        if (v12) {
          continue;
        }
        break;
      }
    }
    else
    {
      BOOL v15 = 1;
    }
  }
  else
  {
    unsigned int v10 = sub_1000BF6B8();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = self;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%@ presentationStackAppearsCorrect NO because more containees in stack than UIKit", buf, 0xCu);
    }
LABEL_18:
    BOOL v15 = 0;
  }

  return v15;
}

- (id)internalStackLessWaitingForPresentation
{
  double v3 = +[NSMutableArray array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v4 = [(ContainerStack *)self->_containerStack allObjects];
  id v5 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        unsigned int v10 = [v9 presentingViewController];
        if (v10 && ![v9 isBeingDismissed])
        {

LABEL_11:
          [v3 addObject:v9];
          continue;
        }
        unsigned __int8 v11 = [(ContainerTransitionManager *)self->_transitionManager hasWaitingTransitionForViewController:v9];

        if ((v11 & 1) == 0) {
          goto LABEL_11;
        }
      }
      id v6 = [v4 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v6);
  }

  id v12 = sub_1000BF6B8();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    long long v19 = self;
    __int16 v20 = 2112;
    long long v21 = v3;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "%@ containerStackLessControllersWaitingForPresentation %@", buf, 0x16u);
  }

  return v3;
}

- (void)_unlockCardQueue
{
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000BFF08;
  v25[3] = &unk_1012E5D08;
  v25[4] = self;
  double v3 = objc_retainBlock(v25);
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    BOOL v4 = [(ContainerViewController *)self currentViewController];
    id v5 = [v4 presentedViewController];

    id v6 = [(ContainerViewController *)self currentViewController];
    uint64_t v7 = [v6 presentedViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v9 = [(ContainerViewController *)self currentViewController];
    unsigned int v10 = [v9 presentedViewController];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v11 = 1;
    }
    else
    {
      id v12 = [(ContainerViewController *)self currentViewController];
      uint64_t v13 = [v12 presentedViewController];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
    }
    if ([(ContainerViewController *)self isRootContainer])
    {
      long long v14 = [(ContainerViewController *)self chromeViewController];
      uint64_t v15 = [v14 presentedViewController];
      if (v15)
      {
        long long v16 = (void *)v15;
        long long v17 = [(ContainerViewController *)self chromeViewController];
        long long v18 = [v17 presentedViewController];
        long long v19 = [(ContainerStack *)self->_containerStack containeeStateAtIndex:0];
        [v19 viewController];
        __int16 v20 = v24 = isKindOfClass;

        BOOL v21 = v18 == v20;
        char isKindOfClass = v24;
        if (!v21)
        {
          v22 = [(ContainerViewController *)self chromeViewController];
LABEL_13:
          double v23 = v22;
          [v22 dismissViewControllerAnimated:0 completion:v3];

          goto LABEL_14;
        }
      }
      else
      {
      }
    }
    if (!((v5 == 0 || (isKindOfClass & 1) == 0) | v11 & 1))
    {
      v22 = [(ContainerViewController *)self currentViewController];
      goto LABEL_13;
    }
  }
  ((void (*)(void *))v3[2])(v3);
LABEL_14:
}

- (BOOL)shouldHideCard
{
  return 0;
}

- (void)setContaineesHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_1000BF6B8();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_13;
  }
  id v6 = self;
  if (!v6)
  {
    char v11 = @"<nil>";
    goto LABEL_10;
  }
  uint64_t v7 = (objc_class *)objc_opt_class();
  BOOL v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    id v9 = [(ContainerViewController *)v6 performSelector:"accessibilityIdentifier"];
    unsigned int v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      char v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  char v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  id v12 = @"NO";
  if (v3) {
    id v12 = @"YES";
  }
  *(_DWORD *)buf = 138543874;
  char v24 = v11;
  __int16 v25 = 2080;
  unint64_t v26 = "-[ContainerViewController setContaineesHidden:]";
  __int16 v27 = 2112;
  id v28 = v12;
  uint64_t v13 = v12;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %s: %@", buf, 0x20u);

LABEL_13:
  long long v14 = [(ContainerStack *)self->_containerStack allObjects];
  uint64_t v15 = [v14 firstObject];

  long long v16 = [(ContainerViewController *)self currentViewController];
  if (v15 == v16)
  {
    long long v17 = [v15 presentingViewController];

    if (!v17) {
      goto LABEL_23;
    }
  }
  else
  {
  }
  if (!v15) {
    return;
  }
  while ((objc_opt_respondsToSelector() & 1) != 0)
  {
    id v18 = v15;
    long long v19 = [v18 cardPresentationController];
    unsigned int v20 = [v19 usingSheetPresentation];

    if (v20)
    {
      BOOL v21 = [v18 cardPresentationController];
      [v21 setHidden:v3];
    }
    id v22 = [(ContainerViewController *)self currentViewController];

    if (v18 == v22)
    {

      goto LABEL_25;
    }
    uint64_t v15 = [v18 presentedViewController];

    if (!v15)
    {
      id v18 = 0;
      goto LABEL_25;
    }
  }
LABEL_23:
  id v18 = v15;
LABEL_25:
}

- (void)containerStyleManagerDidChangeStyle:(unint64_t)a3
{
  [(ContainerTransitionManager *)self->_transitionManager styleDidChange];
  [(ContainerViewController *)self didChangeStyle:a3];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = [(ContainerStack *)self->_containerStack allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * (void)v9) didChangeContainerStyle:a3];
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  unsigned int v10 = [(ContainerViewController *)self visibleCardViews];
  id v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      long long v14 = 0;
      do
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * (void)v14) setLayoutStyle:a3];
        long long v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  [WeakRetained setVKApplicationUILayout:[self VKApplicationUILayoutForStyle:a3]];

  [(ContainerTransitionManager *)self->_transitionManager dequeueWaitingContainees];
}

- (NSArray)visibleCardViews
{
  BOOL v3 = [(ContainerViewController *)self visibleViewControllers];
  BOOL v4 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v3 count]);

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(ContainerViewController *)self visibleViewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = [(NSMapTable *)self->_cards objectForKey:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 copy];

  return (NSArray *)v11;
}

- (NSArray)visibleViewControllers
{
  return [(ContainerTransitionManager *)self->_transitionManager visibleViewControllers];
}

- (id)currentViewControllerWithPresentationStyle:(unint64_t)a3
{
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
    case 6uLL:
      BOOL v3 = sub_1005762E4();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136315650;
        unsigned int v10 = "-[ContainerViewController currentViewControllerWithPresentationStyle:]";
        __int16 v11 = 2080;
        id v12 = "ContainerViewController.m";
        __int16 v13 = 1024;
        int v14 = 931;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v9, 0x1Cu);
      }

      if (sub_100BB36BC())
      {
        BOOL v4 = sub_1005762E4();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        {
          id v5 = +[NSThread callStackSymbols];
          int v9 = 138412290;
          unsigned int v10 = v5;
          _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v9, 0xCu);
        }
      }
      id v6 = 0;
      goto LABEL_11;
    case 3uLL:
      uint64_t v7 = 136;
      goto LABEL_10;
    case 5uLL:
      uint64_t v7 = 128;
      goto LABEL_10;
    default:
      uint64_t v7 = 208;
LABEL_10:
      id v6 = *(id *)((char *)&self->super.super.super.super.super.isa + v7);
LABEL_11:
      return v6;
  }
}

- (void)didChangeStyle:(unint64_t)a3
{
  p_containerDelegate = &self->_containerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_containerDelegate);
    [v8 container:self didChangeContainerStyle:[self containerStyle]];
  }
  int v9 = +[NSNotificationCenter defaultCenter];
  CFStringRef v12 = @"ContainerStyle";
  unsigned int v10 = +[NSNumber numberWithUnsignedInteger:a3];
  __int16 v13 = v10;
  __int16 v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"ContainerDidChangeStyleNotification" object:self userInfo:v11];

  +[MapsAnalyticStateProvider updateLayoutInformation:self];
}

- (int64_t)VKApplicationUILayoutForStyle:(unint64_t)a3
{
  if (a3 > 7) {
    return 1;
  }
  else {
    return qword_100F6F230[a3];
  }
}

- (void)containerStyleManagerWillChangeStyle:(unint64_t)a3
{
  -[ContainerViewController willChangeStyle:](self, "willChangeStyle:");
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = [(ContainerStack *)self->_containerStack allObjects];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      int v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) willChangeContainerStyle:a3];
        int v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  [(ContainerViewController *)self _updateOverrideTraitCollectionsForStyle:a3];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ContainerViewController;
  [(MapsThemeViewController *)&v4 traitCollectionDidChange:a3];
  [(ContainerViewController *)self _updateOverrideTraitCollectionsForStyle:[(ContainerViewController *)self containerStyle]];
}

- (void)_updateOverrideTraitCollectionsForStyle:(unint64_t)a3
{
  uint64_t v5 = [(ContainerViewController *)self currentViewController];
  if (v5)
  {
    id v6 = (void *)v5;
    id v7 = [(ContainerViewController *)self currentViewController];
    uint64_t v8 = [v7 parentViewController];

    if (v8 == self)
    {
      if (a3 < 8 && ((0xA3u >> a3) & 1) != 0)
      {
        id v10 = 0;
      }
      else
      {
        id v10 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
      }
      int v9 = [(ContainerViewController *)self currentViewController];
      [(ContainerViewController *)self setOverrideTraitCollection:v10 forChildViewController:v9];
    }
  }
}

- (void)willChangeStyle:(unint64_t)a3
{
  p_containerDelegate = &self->_containerDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = objc_loadWeakRetained((id *)p_containerDelegate);
    [v8 container:self willChangeStyle:[self containerStyle]];
  }
  int v9 = +[NSNotificationCenter defaultCenter];
  CFStringRef v12 = @"ContainerStyle";
  id v10 = +[NSNumber numberWithUnsignedInteger:a3];
  long long v13 = v10;
  long long v11 = +[NSDictionary dictionaryWithObjects:&v13 forKeys:&v12 count:1];
  [v9 postNotificationName:@"ContainerWillChangeStyleNotification" object:self userInfo:v11];
}

- (NSString)blurGroupName
{
  return (NSString *)@"MapsTheme";
}

- (void)updateMapEdgeInsets
{
  uint64_t v3 = [(ContainerViewController *)self viewIfLoaded];
  if (v3)
  {
    objc_super v4 = (void *)v3;
    uint64_t v5 = [(ContainerViewController *)self view];
    id v6 = [v5 superview];

    if (v6)
    {
      [(ContainerViewController *)self _calculateMapEdgeInsets];
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;
      id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
      [(ContainerViewController *)self topLabelEdgeInset];
      [WeakRetained setLabelEdgeInsets:];

      id v16 = objc_loadWeakRetained((id *)&self->_chromeViewController);
      [(ContainerViewController *)self topLabelEdgeInset];
      [v16 setLabelEdgeWidths:];

      uint64_t v17 = [(ContainerViewController *)self chromeContext];
      if (v17)
      {
        long long v18 = (void *)v17;
        long long v19 = [(ContainerViewController *)self currentViewController];
        if (v19 && ![(ContainerViewController *)self containeeLayout])
        {
          int Card = -[ContainerViewController delaysFirstCardPresentation]_0();

          if (!Card) {
            return;
          }
        }
        else
        {
        }
        id v22 = objc_loadWeakRetained((id *)&self->_chromeViewController);
        long long v20 = [(ContainerViewController *)self chromeContext];
        [v22 setMapEdgeInsets:0 animated:v8 forContext:v10, v12, v14];
      }
    }
  }
}

- (unint64_t)containeeLayout
{
  return self->_containeeLayout;
}

- (unint64_t)maxLayoutForEdgeInsetsUpdate
{
  return 2;
}

- (double)availableHeightForViewController:(id)a3
{
  objc_super v4 = [(ContainerViewController *)self view];
  [v4 frame];
  double Height = CGRectGetHeight(v13);

  if (!-[ContainerViewController delaysFirstCardPresentation]_0()
    || (id)[(ContainerViewController *)self containerStyle] != (id)1)
  {
    if (self->_nextHeight != 0.0) {
      double Height = self->_nextHeight;
    }
    if ((id)[(ContainerViewController *)self containerStyle] != (id)7)
    {
      [(ContainerViewController *)self statusBarHeight];
      double Height = Height - v8;
    }
    unint64_t v9 = [(ContainerViewController *)self containerStyle];
    if (v9 - 2 >= 4)
    {
      if (v9 != 6) {
        return Height;
      }
      [(ContainerViewController *)self edgePadding];
      double Height = Height - v11;
      [(ContainerViewController *)self floatingContainerBottomVerticalPadding];
    }
    else
    {
      [(ContainerViewController *)self mapPeek];
    }
    return Height - v10;
  }
  id v6 = [(ContainerViewController *)self view];
  _UISheetMinimumTopInset();
  double Height = Height - v7;

  return Height;
}

- (uint64_t)delaysFirstCardPresentation
{
  if (qword_10160F7A0 != -1) {
    dispatch_once(&qword_10160F7A0, &stru_1012F75D8);
  }
  return byte_10160F798;
}

- (double)bottomEdgePadding
{
  uint64_t v3 = [(ContainerViewController *)self currentViewController];
  objc_super v4 = [v3 cardPresentationController];
  if ([v4 usingSheetPresentation])
  {
    uint64_t v5 = [(ContainerViewController *)self currentViewController];
    id v6 = [v5 cardPresentationController];
    unsigned __int8 v7 = [v6 takesAvailableWidth];
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  unint64_t v8 = [(ContainerViewController *)self containerStyle];
  if (v8 <= 7 && ((1 << v8) & 0xA3) != 0 || (sub_1000BBB44(self) == 5 ? (char v10 = 1) : (char v10 = v7), (v10 & 1) != 0))
  {
    [(ContainerViewController *)self edgePadding];
  }
  else
  {
    [(ContainerViewController *)self floatingContainerBottomVerticalPadding];
  }
  return result;
}

- (double)bottomSafeOffset
{
  double v3 = 0.0;
  if ((id)[(ContainerViewController *)self containerStyle] != (id)6)
  {
    objc_super v4 = [(ContainerViewController *)self view];
    uint64_t v5 = [v4 window];

    if (v5) {
      goto LABEL_3;
    }
    if (-[ContainerViewController delaysFirstCardPresentation]_0())
    {
      unsigned __int8 v7 = [(ContainerViewController *)self currentViewController];
      unint64_t v8 = [v7 view];
      uint64_t v5 = [v8 window];

      if (v5)
      {
LABEL_3:
        [v5 safeAreaInsets];
        double v3 = v6;
      }
    }
  }
  return v3;
}

- (unint64_t)containerStyle
{
  return [(ContainerStyleManager *)self->_containerStyleManager containerStyle];
}

- (BOOL)transitioning
{
  return self->_transitioning;
}

- (double)_cardHeightForComputingBottomMapEdgeInsets
{
  objc_super v4 = [(ContainerViewController *)self currentViewController];
  unsigned __int8 v5 = [v4 isBeingDismissed];
  if ((v5 & 1) == 0)
  {
    v2 = [(ContainerViewController *)self currentViewController];
    if (([v2 isBeingPresented] & 1) == 0)
    {

      double Height = 0.0;
      goto LABEL_9;
    }
  }
  double v6 = [(ContainerViewController *)self currentViewController];
  unsigned __int8 v7 = [v6 presentingViewController];
  unsigned int v8 = sub_1000BBF90((uint64_t)v7, (Protocol *)&OBJC_PROTOCOL___ContaineeProtocol);

  if ((v5 & 1) == 0)
  {

    double Height = 0.0;
    if ((v8 & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_7;
  }

  double Height = 0.0;
  if (v8)
  {
LABEL_7:
    char v10 = [(ContainerViewController *)self currentViewController];
    double v11 = [v10 presentingViewController];
    objc_super v4 = [v11 sheetPresentationController];

    [v4 _currentPresentedViewFrame];
    double Height = CGRectGetHeight(v15);
LABEL_9:
  }
LABEL_10:
  double v12 = [(ContainerViewController *)self currentViewController];
  CGRect v13 = [v12 sheetPresentationController];

  [v13 _currentPresentedViewFrame];
  if (Height <= CGRectGetHeight(v16))
  {
    [v13 _currentPresentedViewFrame];
    double Height = CGRectGetHeight(v17);
  }

  return Height;
}

- (ContaineeProtocol)currentViewController
{
  if (self->_enableMacPresentationStyles)
  {
    currentPopoverViewController = self->_currentPopoverViewController;
    if (currentPopoverViewController) {
      goto LABEL_10;
    }
    uint64_t v4 = [(ContainerViewController *)self presentedViewController];
    if (v4)
    {
      unsigned __int8 v5 = (void *)v4;
      double v6 = [(ContainerViewController *)self presentedViewController];
      unsigned int v7 = [v6 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol];

      if (v7)
      {
        unsigned int v8 = [(ContainerViewController *)self presentedViewController];
        if ([(ContaineeProtocol *)v8 preferredPresentationStyle] == (id)6) {
          goto LABEL_11;
        }
      }
    }
  }
  if (self->_willBeginDisplayingInLockScreen)
  {
    unint64_t v9 = [(ContainerStack *)self->_containerStack lastState];
    unsigned int v8 = [v9 viewController];

    goto LABEL_11;
  }
  currentPopoverViewController = self->_currentViewController;
LABEL_10:
  unsigned int v8 = currentPopoverViewController;
LABEL_11:

  return v8;
}

- (UIEdgeInsets)_calculateMapEdgeInsets
{
  uint64_t v3 = [(ContainerViewController *)self viewIfLoaded];
  if (!v3) {
    goto LABEL_4;
  }
  uint64_t v4 = (void *)v3;
  unsigned __int8 v5 = [(ContainerViewController *)self view];
  double v6 = [v5 superview];

  if (!v6) {
    goto LABEL_4;
  }
  unsigned int v7 = [(ContainerViewController *)self view];
  [v7 bounds];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  [(ContainerViewController *)self topEdgeInset];
  CGFloat top = v16;
  [(ContainerViewController *)self bottomEdgeInset];
  CGFloat bottom = v18;
  [(ContainerViewController *)self leftSafeOffset];
  double left = v20;
  [(ContainerViewController *)self rightSafeOffset];
  if (!self->_chromeHidden)
  {
    double right = v22;
    id v28 = [(ContainerViewController *)self view];
    int v29 = [v28 effectiveUserInterfaceLayoutDirection] == (id)1;

    unsigned int v30 = [(ContainerViewController *)self stackOnOppositeSide];
    uint64_t v31 = sub_1000BBB44(self);
    unsigned int v32 = [(ContainerViewController *)self isContaineeStackEmpty];
    if ((v32 & 1) == 0 && v31 == 5)
    {
      BOOL v33 = [(ContainerViewController *)self currentViewController];
      if (v33)
      {
        __int16 v34 = [(ContainerViewController *)self currentViewController];
        unsigned int v32 = (unint64_t)[v34 preferredPresentationStyle] > 1;
      }
      else
      {
        unsigned int v32 = 1;
      }
    }
    unsigned int v35 = [(ContainerViewController *)self currentViewController];
    __int16 v36 = [v35 cardPresentationController];
    if ([v36 usingSheetPresentation])
    {
      BOOL v37 = [(ContainerViewController *)self currentViewController];
      __int16 v38 = [v37 cardPresentationController];
      unsigned int v39 = [v38 takesAvailableWidth] ^ 1;
    }
    else
    {
      unsigned int v39 = 1;
    }

    if (!self->_chromeHidden)
    {
      unint64_t v40 = [(ContainerViewController *)self containerStyle];
      if ((v40 > 7 || ((1 << v40) & 0xA3) == 0) && (v39 & ~v32) == 1)
      {
        if (v29 != v30)
        {
          v45.origin.x = v9;
          v45.origin.y = v11;
          v45.size.width = v13;
          v45.size.height = v15;
          double MaxX = CGRectGetMaxX(v45);
          [(UIView *)self->_containerView frame];
          double v42 = MaxX - CGRectGetMinX(v46);
          double v43 = left;
          double v44 = v42;
        }
        else
        {
          [(UIView *)self->_containerView frame];
          double v43 = CGRectGetMaxX(v47);
          double v42 = right;
          double v44 = v43;
        }
        if (fabs(v44) > 2.22044605e-16)
        {
          double left = v43;
          double right = v42;
        }
      }
    }
  }
  else
  {
LABEL_4:
    CGFloat top = UIEdgeInsetsZero.top;
    double left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    double right = UIEdgeInsetsZero.right;
  }
  double v24 = top;
  double v25 = left;
  double v26 = bottom;
  double v27 = right;
  result.double right = v27;
  result.CGFloat bottom = v26;
  result.double left = v25;
  result.CGFloat top = v24;
  return result;
}

- (BOOL)stackOnOppositeSide
{
  return [(ContainerStyleManager *)self->_containerStyleManager stackOnOppositeSide];
}

- (double)rightSafeOffset
{
  if (self->_enableMacPresentationStyles
    && ([(ContainerViewController *)self view],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 effectiveUserInterfaceLayoutDirection],
        v3,
        v4 == (id)1)
    && ![(SupplementalStackViewController *)self->_paletteViewController isEmpty])
  {
    double v8 = [(SupplementalStackViewController *)self->_paletteViewController view];
    [v8 frame];
    double Width = CGRectGetWidth(v10);

    return Width;
  }
  else
  {
    unsigned int v5 = [(ContainerViewController *)self hasMargin];
    double result = 0.0;
    if (v5)
    {
      id v7 = [(ContainerViewController *)self interfaceOrientation];
      double result = 0.0;
      if (v7 == (id)4) {
        return 21.0;
      }
    }
  }
  return result;
}

- (double)leftSafeOffset
{
  if (!self->_enableMacPresentationStyles
    || ([(ContainerViewController *)self view],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = [v3 effectiveUserInterfaceLayoutDirection],
        v3,
        v4 == (id)1)
    || [(SupplementalStackViewController *)self->_paletteViewController isEmpty])
  {
    unsigned int v5 = [(ContainerViewController *)self hasMargin];
    double result = 0.0;
    if (v5)
    {
      id v7 = [(ContainerViewController *)self interfaceOrientation];
      double result = 0.0;
      if (v7 == (id)3) {
        return 21.0;
      }
    }
  }
  else
  {
    double v8 = [(SupplementalStackViewController *)self->_paletteViewController view];
    [v8 frame];
    double Width = CGRectGetWidth(v10);

    return Width;
  }
  return result;
}

- (BOOL)isContaineeStackEmpty
{
  return [(ContainerStack *)self->_containerStack count] == 0;
}

- (double)bottomEdgeInset
{
  uint64_t v3 = [(ContainerViewController *)self currentViewController];
  id v4 = [v3 cardPresentationController];
  unsigned int v5 = [v4 usingSheetPresentation];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  void v13[2] = sub_1000D1508;
  v13[3] = &unk_1012E80A0;
  v13[4] = self;
  char v14 = v5;
  double v6 = objc_retainBlock(v13);
  unint64_t v7 = [(ContainerViewController *)self containerStyle];
  double v8 = 0.0;
  if (v7 - 2 < 3)
  {
    if (!v5) {
      goto LABEL_8;
    }
    CGFloat v9 = [(ContainerViewController *)self currentViewController];
    CGRect v10 = [v9 cardPresentationController];
    unsigned int v11 = [v10 takesAvailableWidth];

    if (!v11) {
      goto LABEL_8;
    }
LABEL_7:
    double v8 = ((double (*)(void *))v6[2])(v6);
    goto LABEL_8;
  }
  if (v7 == 1 || v7 == 5) {
    goto LABEL_7;
  }
LABEL_8:

  return v8;
}

- (ContaineeProtocol)currentOrPendingViewController
{
  if (self->_willBeginDisplayingInLockScreen) {
    [(ContainerViewController *)self currentViewController];
  }
  else {
  v2 = [(ContainerTransitionManager *)self->_transitionManager currentOrPendingViewController];
  }

  return (ContaineeProtocol *)v2;
}

- (void)contentHeightUpdatedWithValue:(double)a3
{
  if (self->_transitioning)
  {
    unsigned int v5 = [(ContainerViewController *)self currentViewController];
    double v6 = [v5 cardPresentationController];
    [v6 cardHeight];
    a3 = v7;
  }

  [(ContainerViewController *)self _notifyResizingObserversWithValue:1 onlyIfDragging:a3];
}

- (void)_notifyResizingObserversWithValue:(double)a3 onlyIfDragging:(BOOL)a4
{
  BOOL v4 = a4;
  if (![(NSMapTable *)self->_resizingBlocksByObserver count]) {
    return;
  }
  id v7 = [(ContainerViewController *)self containerStyle];
  double v8 = [(ContainerViewController *)self currentViewController];
  CGFloat v9 = [v8 cardPresentationController];
  unsigned int v10 = [v9 usingSheetPresentation];

  if (v10)
  {
    if (v4 && !self->_transitioning)
    {
      unsigned int v11 = [(ContainerViewController *)self currentViewController];
      double v12 = [v11 sheetPresentationController];
      if ([v12 _isDragging])
      {
      }
      else
      {
        CGFloat v13 = [(ContainerViewController *)self currentViewController];
        char v14 = [v13 sheetPresentationController];
        unsigned __int8 v15 = [v14 _isGeneratingAnimations];

        if ((v15 & 1) == 0)
        {
          if ((sub_1001097B8() & 1) == 0) {
            return;
          }
          goto LABEL_9;
        }
      }
    }
    double v16 = [(ContainerViewController *)self currentViewController];
    CGRect v17 = [v16 cardPresentationController];
    id v7 = [v17 containerStyle];
  }
LABEL_9:

  [(ContainerViewController *)self _notifyObserversWithContainerStyle:v7 value:a3];
}

- (UIEdgeInsets)mapAttributionInsets
{
  uint64_t v3 = [(ContainerViewController *)self view];
  id v4 = [v3 effectiveUserInterfaceLayoutDirection];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  double v6 = [WeakRetained mapView];
  [v6 _attributionInsets];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  id v13 = objc_loadWeakRetained((id *)&self->_chromeViewController);
  char v14 = [v13 mapView];
  [v14 _edgeInsets];
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;

  if ((id)[(ContainerViewController *)self containerStyle] == (id)6)
  {
    if (v4 == (id)1)
    {
      if (v20 >= 0.0)
      {
        [(UIView *)self->_containerView frame];
        double v12 = -CGRectGetWidth(v34);
      }
    }
    else if (v16 >= 0.0)
    {
      [(UIView *)self->_containerView frame];
      double v10 = -CGRectGetWidth(v35);
    }
  }
  else if (v4 == (id)1)
  {
    double v12 = 0.0;
  }
  else
  {
    double v10 = 0.0;
  }
  if ((id)[(ContainerViewController *)self containerStyle] == (id)6)
  {
    [(ContainerViewController *)self floatingContainerBottomVerticalPadding];
    double v22 = v21;
    long long v23 = objc_loadWeakRetained((id *)&self->_chromeViewController);
    double v24 = [v23 mapView];
    [v24 attributionBadgeBounds];
    double v25 = (v22 - CGRectGetHeight(v36)) * 0.5 - _MKAttributionBadgePaddingVertical;

LABEL_14:
    goto LABEL_15;
  }
  double v26 = [(ContainerViewController *)self view];
  [v26 safeAreaInsets];
  double v28 = v27;

  double v25 = 0.0;
  if (v28 > v18)
  {
    long long v23 = [(ContainerViewController *)self view];
    [v23 safeAreaInsets];
    double v25 = v29 - v18;
    goto LABEL_14;
  }
LABEL_15:
  double v30 = v8;
  double v31 = v10;
  double v32 = v25;
  double v33 = v12;
  result.double right = v33;
  result.CGFloat bottom = v32;
  result.double left = v31;
  result.CGFloat top = v30;
  return result;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (IOSBasedChromeContext)chromeContext
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeContext);

  return (IOSBasedChromeContext *)WeakRetained;
}

- (void)viewDidLoad
{
  v59.receiver = self;
  v59.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v59 viewDidLoad];
  uint64_t v3 = [(ContainerViewController *)self view];
  id v4 = [v3 layer];
  [v4 setAllowsGroupOpacity:0];

  unsigned int v5 = +[NSNotificationCenter defaultCenter];
  [v5 addObserver:self selector:"_statusBarHeightChanged" name:@"IOSBasedChromeStatusBarHeightDidUpdateNotification" object:0];

  id v6 = objc_alloc((Class)UIView);
  double v7 = [(ContainerViewController *)self view];
  [v7 bounds];
  double v8 = (UIView *)[v6 initWithFrame:];
  containerView = self->_containerView;
  self->_containerView = v8;

  [(UIView *)self->_containerView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)self->_containerView setUserInteractionEnabled:0];
  double v10 = +[UIColor clearColor];
  [(UIView *)self->_containerView setBackgroundColor:v10];

  LODWORD(v11) = 1148846080;
  [(UIView *)self->_containerView setContentHuggingPriority:1 forAxis:v11];
  LODWORD(v12) = 1148846080;
  [(UIView *)self->_containerView setContentHuggingPriority:0 forAxis:v12];
  id v13 = [(ContainerViewController *)self view];
  [v13 addSubview:self->_containerView];

  char v14 = +[MKSystemController sharedInstance];
  LODWORD(v7) = [v14 isInternalInstall];

  if (v7)
  {
    double v15 = +[NSUserDefaults standardUserDefaults];
    id v16 = [v15 BOOLForKey:@"__internal__DisableChrome"];
    double v17 = [(ContainerViewController *)self view];
    [v17 setHidden:v16];
  }
  if ([(ContainerViewController *)self useBackdrop])
  {
    double v18 = [BackdropView alloc];
    double v19 = [(ContainerViewController *)self view];
    [v19 bounds];
    double v20 = -[BackdropView initWithFrame:](v18, "initWithFrame:");
    backdropView = self->_backdropView;
    self->_backdropView = v20;

    [(BackdropView *)self->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
    double v22 = [(ContainerViewController *)self blurGroupName];
    long long v23 = [(BackdropView *)self->_backdropView captureGroup];
    [v23 setGroupName:v22];

    LODWORD(v24) = 1148846080;
    [(BackdropView *)self->_backdropView setContentHuggingPriority:1 forAxis:v24];
    LODWORD(v25) = 1148846080;
    [(BackdropView *)self->_backdropView setContentHuggingPriority:0 forAxis:v25];
    double v26 = [(ContainerViewController *)self view];
    [v26 insertSubview:self->_backdropView atIndex:0];

    [(ContainerViewController *)self _updateBackdropConstraints];
  }
  if (self->_enableMacPresentationStyles)
  {
    double v27 = objc_alloc_init(SupplementalStackViewController);
    paletteViewController = self->_paletteViewController;
    self->_paletteViewController = v27;

    double v29 = +[UIColor secondarySystemBackgroundColor];
    double v30 = [(SupplementalStackViewController *)self->_paletteViewController view];
    [v30 setBackgroundColor:v29];

    double v31 = [(ContainerViewController *)self view];
    double v32 = [(SupplementalStackViewController *)self->_paletteViewController view];
    [v31 addSubview:v32];

    double v33 = [(SupplementalStackViewController *)self->_paletteViewController view];
    [v33 setTranslatesAutoresizingMaskIntoConstraints:0];

    CGRect v34 = [(SupplementalStackViewController *)self->_paletteViewController view];
    CGRect v35 = [v34 widthAnchor];
    CGRect v36 = [v35 constraintEqualToConstant:0.0];
    paletteWidthConstraint = self->_paletteWidthConstraint;
    self->_paletteWidthConstraint = v36;

    v58 = [(SupplementalStackViewController *)self->_paletteViewController view];
    v56 = [v58 topAnchor];
    v57 = [(ContainerViewController *)self view];
    v55 = [v57 topAnchor];
    v54 = [v56 constraintEqualToAnchor:v55];
    v60[0] = v54;
    char v53 = [(SupplementalStackViewController *)self->_paletteViewController view];
    v51 = [v53 leadingAnchor];
    v52 = [(ContainerViewController *)self view];
    __int16 v38 = [v52 leadingAnchor];
    unsigned int v39 = [v51 constraintEqualToAnchor:v38];
    v60[1] = v39;
    unint64_t v40 = [(SupplementalStackViewController *)self->_paletteViewController view];
    v41 = [v40 bottomAnchor];
    double v42 = [(ContainerViewController *)self view];
    double v43 = [v42 bottomAnchor];
    double v44 = [v41 constraintEqualToAnchor:v43];
    CGRect v45 = self->_paletteWidthConstraint;
    v60[2] = v44;
    v60[3] = v45;
    CGRect v46 = +[NSArray arrayWithObjects:v60 count:4];
    +[NSLayoutConstraint activateConstraints:v46];

    CGRect v47 = +[UIApplication sharedMapsDelegate];
    id v48 = [v47 appKitBundleClass];

    char v49 = +[NSNotificationCenter defaultCenter];
    __int16 v50 = [v48 shareKitPresentationNotificationName];
    [v49 addObserver:self selector:"shareFromMenuDidSelect:" name:v50 object:0];

    [(ContainerViewController *)self addChildViewController:self->_paletteViewController];
    [(SupplementalStackViewController *)self->_paletteViewController didMoveToParentViewController:self];
  }
}

- (BOOL)useBackdrop
{
  return 1;
}

- (void)_updateBackdropConstraints
{
  if (self->_backdropConstraints) {
    +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:");
  }
  if (self->_useBackdropFullScreen)
  {
    uint64_t v3 = [(ContainerViewController *)self view];
  }
  else
  {
    uint64_t v3 = self->_containerView;
  }
  id v4 = v3;
  double v18 = [(BackdropView *)self->_backdropView topAnchor];
  double v17 = [(UIView *)v4 topAnchor];
  id v16 = [v18 constraintEqualToAnchor:v17];
  v19[0] = v16;
  double v15 = [(BackdropView *)self->_backdropView bottomAnchor];
  char v14 = [(UIView *)v4 bottomAnchor];
  unsigned int v5 = [v15 constraintEqualToAnchor:v14];
  v19[1] = v5;
  id v6 = [(BackdropView *)self->_backdropView leadingAnchor];
  double v7 = [(UIView *)v4 leadingAnchor];
  double v8 = [v6 constraintEqualToAnchor:v7];
  v19[2] = v8;
  double v9 = [(BackdropView *)self->_backdropView trailingAnchor];
  double v10 = [(UIView *)v4 trailingAnchor];
  double v11 = [v9 constraintEqualToAnchor:v10];
  v19[3] = v11;
  double v12 = +[NSArray arrayWithObjects:v19 count:4];
  backdropConstraints = self->_backdropConstraints;
  self->_backdropConstraints = v12;

  +[NSLayoutConstraint activateConstraints:self->_backdropConstraints];
}

- (void)setStackOnOppositeSide:(BOOL)a3
{
}

- (void)setChromeViewController:(id)a3
{
}

- (void)setChromeContext:(id)a3
{
}

- (void)setAllowOnlyStandardStyle:(BOOL)a3
{
}

- (void)presentController:(id)a3 animated:(BOOL)a4 useDefaultContaineeLayout:(BOOL)a5
{
}

- (void)presentController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
}

- (void)macSetEnableExtendedPresentationStyles:(BOOL)a3
{
  self->_enableMacPresentationStyles = a3;
}

- (BOOL)isRootContainer
{
  return 0;
}

- (void)endDeferringPresentingMapPopovers
{
}

- (void)endDeferringPresentingMapPopovers:(id)a3
{
  id v4 = a3;
  if (self->_enableMacPresentationStyles)
  {
    int64_t v5 = self->_deferMapPopoverCount - 1;
    self->_deferMapPopoverCount = v5;
    if (!v5)
    {
      deferredPopoverViewController = self->_deferredPopoverViewController;
      if (deferredPopoverViewController)
      {
        id v8 = v4;
        [(ContainerViewController *)self _presentPopoverViewController:deferredPopoverViewController animated:1 completion:v4];
        double v7 = self->_deferredPopoverViewController;
        self->_deferredPopoverViewController = 0;

        id v4 = v8;
      }
    }
  }
}

- (void)beginDeferringPresentingMapPopovers
{
  if (self->_enableMacPresentationStyles) {
    ++self->_deferMapPopoverCount;
  }
}

- (BOOL)allowsDisplayOnLockScreen
{
  return 0;
}

- (void)setUseBackdropFullScreen:(BOOL)a3
{
  if (self->_useBackdropFullScreen != a3)
  {
    self->_useBackdropFullScreen = a3;
    [(ContainerViewController *)self _updateBackdropConstraints];
  }
}

- (void)setCaptureViewForCardView:(id)a3
{
  id v5 = a3;
  id v4 = [(ContainerViewController *)self blurGroupName];
  [v5 setBlurGroupName:v4];

  if ([(ContainerViewController *)self useBackdrop]) {
    [v5 setCaptureView:self->_backdropView];
  }
}

- (id)cardWithBlur:(BOOL)a3
{
  return [(CardProvider *)self->_cardProvider cardWithBlur:a3];
}

- (id)cardForViewController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(NSMapTable *)self->_cards objectForKey:v4];
    if (!v5)
    {
      id v6 = [v4 cardPresentationController];
      id v5 = -[ContainerViewController cardWithBlur:](self, "cardWithBlur:", [v6 blurInCardView]);

      [v5 setLayoutStyle:[self containerStyle]];
      [(ContainerViewController *)self setCaptureViewForCardView:v5];
      [(NSMapTable *)self->_cards setObject:v5 forKey:v4];
    }
    double v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    [v5 setAccessibilityIdentifier:v8];

    double v9 = [v4 cardPresentationController];
    [v9 setCardView:v5 fromContainer:self];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)removeCardforViewController:(id)a3
{
  if (a3)
  {
    cards = self->_cards;
    id v5 = a3;
    id v7 = [(NSMapTable *)cards objectForKey:v5];
    [(NSMapTable *)self->_cards removeObjectForKey:v5];
    id v6 = [v5 cardPresentationController];

    [v6 setCardView:0 fromContainer:0];
    [(CardProvider *)self->_cardProvider recycleCard:v7];
  }
}

- (ContaineeProtocol)rootPresentingViewController
{
  v2 = [(ContainerStack *)self->_containerStack containeeStateAtIndex:0];
  uint64_t v3 = [v2 viewController];
  id v4 = [v3 presentingViewController];

  return (ContaineeProtocol *)v4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6 = a3;
  id v7 = [[CustomContaineePresentationController alloc] initWithPresentedViewController:v6 presentingViewController:self];

  return v7;
}

- (void)updateContaineeStackState
{
  id v5 = [(ContainerViewController *)self currentContaineeState];
  uint64_t v3 = [v5 viewController];
  id v4 = [v3 cardPresentationController];
  [v5 setLayout:[v4 containeeLayout] forStyle:[self containerStyle]];
}

- (unint64_t)layoutModalPresenter
{
  uint64_t v3 = [(ContainerViewController *)self modalPresenter];
  if (v3)
  {
    id v4 = [(ContainerStack *)self->_containerStack containeeStateForContainee:v3];
    id v5 = [v4 layoutForStyle:[self containerStyle]];
  }
  else
  {
    id v5 = 0;
  }

  return (unint64_t)v5;
}

- (ContaineeProtocol)modalPresenter
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v3 = [(ContainerViewController *)self visibleViewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        double v9 = [(ContainerViewController *)self currentViewController];

        if (v8 != v9)
        {
          id v10 = v8;
          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_11:

  return (ContaineeProtocol *)v10;
}

- (BOOL)supportsEmptyStack
{
  return self->_enableMacPresentationStyles;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v6 viewDidDisappear:a3];
  id v4 = [(ContainerViewController *)self currentViewController];
  [v4 didResignCurrent];

  self->_viewHasAppeared = 0;
  [(MapGestureCardDismissalHelper *)self->_cardDismissalHelper setDelegate:0];
  cardDismissalHelper = self->_cardDismissalHelper;
  self->_cardDismissalHelper = 0;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillDisappear:](&v14, "viewWillDisappear:");
  id v5 = sub_1000BF6B8();
  if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
    goto LABEL_11;
  }
  objc_super v6 = self;
  if (!v6)
  {
    double v11 = @"<nil>";
    goto LABEL_10;
  }
  id v7 = (objc_class *)objc_opt_class();
  id v8 = NSStringFromClass(v7);
  if (objc_opt_respondsToSelector())
  {
    double v9 = [(ContainerViewController *)v6 performSelector:"accessibilityIdentifier"];
    id v10 = v9;
    if (v9 && ![v9 isEqualToString:v8])
    {
      double v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

      goto LABEL_8;
    }
  }
  double v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
  *(_DWORD *)buf = 138543618;
  id v16 = v11;
  __int16 v17 = 2080;
  double v18 = "-[ContainerViewController viewWillDisappear:]";
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] %s", buf, 0x16u);

LABEL_11:
  [(ContainerTransitionManager *)self->_transitionManager setContainerReadyToInsert:0];
  long long v12 = [(ContainerViewController *)self currentViewController];
  [v12 willResignCurrent:v3];

  [(ContainerViewController *)self setContaineesHidden:1];
  long long v13 = +[NSNotificationCenter defaultCenter];
  [v13 removeObserver:self name:UISceneWillEnterForegroundNotification object:0];

  if (self->_enableMacPresentationStyles) {
    [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:v3];
  }
}

- (BOOL)containeesHidden
{
  v2 = [(ContainerStack *)self->_containerStack allObjects];
  BOOL v3 = [v2 firstObject];

  if (objc_opt_respondsToSelector())
  {
    id v4 = [v3 cardPresentationController];
    unsigned __int8 v5 = [v4 hidden];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  CGFloat height = a3.height;
  double width = a3.width;
  id v7 = a4;
  id v8 = sub_1000BD86C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v23 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Container viewWillTransitionToSize %@", buf, 0xCu);
  }

  if (self->_enableMacPresentationStyles) {
    [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:1];
  }
  v21.receiver = self;
  v21.super_class = (Class)ContainerViewController;
  -[ContainerViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  self->_nextdouble Height = height;
  self->_needToUpdatedouble Height = !self->_viewHasAppeared;
  double v9 = [(ContainerViewController *)self view];
  [v9 bounds];
  BOOL v12 = v11 == height && v10 == width;

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1003C903C;
  v20[3] = &unk_1012E7F80;
  v20[4] = self;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1003C9228;
  v17[3] = &unk_1012E7FA8;
  v17[4] = self;
  double v18 = objc_retainBlock(v20);
  BOOL v19 = v12;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  void v14[2] = sub_1003C9328;
  v14[3] = &unk_1012E7FA8;
  v14[4] = self;
  id v15 = v18;
  BOOL v16 = v12;
  long long v13 = v18;
  [v7 animateAlongsideTransition:v17 completion:v14];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = sub_1000BD86C();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Container willTransitionToTraitCollection %@", buf, 0xCu);
  }

  v14.receiver = self;
  v14.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v14 willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
  double v9 = [(ContainerViewController *)self traitCollection];
  id v10 = [v9 verticalSizeClass];
  id v11 = [v7 verticalSizeClass];

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1003C9610;
  v12[3] = &unk_1012E7FD0;
  v12[4] = self;
  BOOL v13 = v10 != v11;
  [v6 animateAlongsideTransition:v12 completion:&stru_1012E8010];
}

- (void)addChildViewController:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ContainerViewController;
  id v4 = a3;
  [(ContainerViewController *)&v6 addChildViewController:v4];
  id v5 = [(ContainerViewController *)self currentViewController];

  if (v5 == v4) {
    [(ContainerViewController *)self _updateOverrideTraitCollectionsForStyle:[(ContainerViewController *)self containerStyle]];
  }
}

- (void)removeChildViewController:(id)a3
{
  id v4 = a3;
  [(ContainerViewController *)self setOverrideTraitCollection:0 forChildViewController:v4];
  v5.receiver = self;
  v5.super_class = (Class)ContainerViewController;
  [(ContainerViewController *)&v5 removeChildViewController:v4];
}

- (void)containee:(id)a3 willChangeLayout:(unint64_t)a4 source:(unint64_t)a5
{
  id v8 = a3;
  double v9 = v8;
  if (v8)
  {
    id v10 = [v8 cardPresentationController];
    unsigned int v11 = [v10 usingSheetPresentation];

    if (v11) {
      [v9 willChangeLayout:a4];
    }
    [(ContainerViewController *)self suspendPropagatingEdgeInsetsForReason:@"container view will change layout"];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13)
    {
      id v14 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      [v14 container:self containee:v9 willChangeLayout:a4];
    }
    id v15 = +[NSNotificationCenter defaultCenter];
    v19[0] = @"ContainerLayout";
    id v16 = +[NSNumber numberWithUnsignedInteger:a4];
    v20[0] = v16;
    v20[1] = v9;
    v19[1] = @"ContainerContainee";
    v19[2] = @"ContainerUpdateSource";
    __int16 v17 = +[NSNumber numberWithUnsignedInteger:a5];
    v20[2] = v17;
    double v18 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:3];
    [v15 postNotificationName:@"ContainerWillChangeLayoutNotification" object:self userInfo:v18];
  }
}

- (void)containee:(id)a3 didChangeLayout:(unint64_t)a4
{
  id v6 = a3;
  if (v6)
  {
    [(ContainerViewController *)self resumePropagatingEdgeInsets];
    id v7 = [v6 viewIfLoaded];
    id v8 = [v7 window];

    if (v8)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
      char v10 = objc_opt_respondsToSelector();

      if (v10)
      {
        id v11 = objc_loadWeakRetained((id *)&self->_containerDelegate);
        [v11 container:self containee:v6 didChangeLayout:a4];
      }
      BOOL v12 = [v6 cardPresentationController];
      unsigned int v13 = [v12 usingSheetPresentation];

      if (v13)
      {
        id v14 = [v6 cardPresentationController];
        [v6 didChangeLayout:[v14 containeeLayout]];

        id v15 = [(ContainerStack *)self->_containerStack containeeStateForContainee:v6];
        id v16 = [v15 viewController];
        __int16 v17 = [v16 cardPresentationController];
        [v15 setLayout:[v17 containeeLayout] forStyle:[self containerStyle]];
      }
      double v18 = [(ContainerViewController *)self chromeViewController];
      [v18 setNeedsUpdateComponent:@"lookAroundButton" animated:1];

      BOOL v19 = +[NSNotificationCenter defaultCenter];
      v26[0] = @"ContainerLayout";
      double v20 = +[NSNumber numberWithUnsignedInteger:a4];
      v26[1] = @"ContainerContainee";
      v27[0] = v20;
      v27[1] = v6;
      objc_super v21 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
      [v19 postNotificationName:@"ContainerDidChangeLayoutNotification" object:self userInfo:v21];

      v24[0] = @"ContainerLayout";
      double v22 = +[NSNumber numberWithUnsignedInteger:a4];
      v24[1] = @"ContainerContainee";
      v25[0] = v22;
      v25[1] = v6;
      id v23 = +[NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:2];
      +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayLayoutDidUpdateNotification" object:self userInfo:v23];

      +[MapsAnalyticStateProvider updateLayoutInformation:self];
    }
  }
}

- (void)didPresentContainee:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      [v9 container:self didPresentContainee:v6 finished:v4];
    }
    char v10 = +[NSNotificationCenter defaultCenter];
    v17[0] = @"ContainerFinished";
    id v11 = +[NSNumber numberWithBool:v4];
    v17[1] = @"ContainerContainee";
    v18[0] = v11;
    v18[1] = v6;
    BOOL v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v10 postNotificationName:@"ContainerDidPresentContaineeNotification" object:self userInfo:v12];

    v15[0] = @"ContainerFinished";
    unsigned int v13 = +[NSNumber numberWithBool:v4];
    v15[1] = @"ContainerContainee";
    v16[0] = v13;
    v16[1] = v6;
    id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayDidPresentNotification" object:self userInfo:v14];
  }
}

- (void)didResignContainee:(id)a3 finished:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);
    char v8 = objc_opt_respondsToSelector();

    if (v8)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_containerDelegate);
      [v9 container:self didResignContainee:v6 finished:v4];
    }
    char v10 = +[NSNotificationCenter defaultCenter];
    v17[0] = @"ContainerFinished";
    id v11 = +[NSNumber numberWithBool:v4];
    v17[1] = @"ContainerContainee";
    v18[0] = v11;
    v18[1] = v6;
    BOOL v12 = +[NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:2];
    [v10 postNotificationName:@"ContainerDidResignContaineeNotification" object:self userInfo:v12];

    v15[0] = @"ContainerFinished";
    unsigned int v13 = +[NSNumber numberWithBool:v4];
    v15[1] = @"ContainerContainee";
    v16[0] = v13;
    v16[1] = v6;
    id v14 = +[NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:2];
    +[PPTNotificationCenter postNotificationIfNeededWithName:@"PPTTestTrayDidDismissNotification" object:self userInfo:v14];
  }
}

- (double)topLabelEdgeInset
{
  int BOOL = GEOConfigGetBOOL();
  if (GEOConfigGetBOOL()) {
    BOOL v4 = BOOL == 0;
  }
  else {
    BOOL v4 = 0;
  }
  if (v4) {
    return 0.0;
  }

  [(ContainerViewController *)self statusBarHeight];
  return result;
}

- (double)leadingEdgePadding
{
  if (![(ContainerViewController *)self hasMargin]
    && (id)[(ContainerViewController *)self containerStyle] != (id)6)
  {
    return 8.0;
  }

  [(ContainerViewController *)self edgePadding];
  return result;
}

- (double)floatingContainerBottomVerticalPadding
{
  unint64_t v3 = [(ContainerViewController *)self containerStyle];
  if (v3 > 7 || ((1 << v3) & 0xA3) == 0)
  {
    if (sub_1000BBB44(self)) {
      double v11 = sub_1000BBAF8();
    }
    else {
      double v11 = 3.0;
    }
    BOOL v12 = [(ContainerViewController *)self view];
    [v12 safeAreaInsets];
    double v8 = v11 + v13;
  }
  else
  {
    [(ContainerViewController *)self edgePadding];
    double v6 = v5;
    [(ContainerViewController *)self statusBarHeight];
    double v8 = v6 + v7;
    [(ContainerViewController *)self bottomSafeOffset];
    if (v8 <= v9)
    {
      [(ContainerViewController *)self bottomSafeOffset];
      double v8 = v10;
    }
  }
  [(ContainerViewController *)self attributionVerticalPadding];
  if (v14 > v8)
  {
    [(ContainerViewController *)self attributionVerticalPadding];
    return v8 + v15;
  }
  return v8;
}

- (double)attributionVerticalPadding
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_chromeViewController);
  unint64_t v3 = [WeakRetained mapView];
  unsigned int v4 = [v3 _isShowingAttributionBadge];

  double result = 0.0;
  if (v4) {
    return 10.0;
  }
  return result;
}

- (StatusBarBackgroundViewStyle)statusBarBackgroundViewStyle
{
  return 0;
}

- (StatusBarSupplementaryView)statusBarSupplementaryView
{
  return 0;
}

- (void)_statusBarHeightChanged
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v3 = [(ContainerStack *)self->_containerStack allObjects];
  id v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        double v8 = [*(id *)(*((void *)&v9 + 1) + 8 * (void)v7) cardPresentationController];
        [v8 updateAdditionalTopMargin];

        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(ContainerViewController *)self snapToLayout:[(ContainerViewController *)self containeeLayout]];
}

- (void)resumePropagatingEdgeInsets
{
  id mapInsetPropagationSuspensionToken = self->_mapInsetPropagationSuspensionToken;
  self->_id mapInsetPropagationSuspensionToken = 0;
}

- (void)expandContainee:(id)a3
{
  id v7 = a3;
  if ((id)[(ContainerViewController *)self containeeLayout] == (id)1)
  {
    if ((id)[(ContainerViewController *)self containerStyle] == (id)5) {
      uint64_t v4 = 3;
    }
    else {
      uint64_t v4 = 2;
    }
    id v5 = v7;
  }
  else
  {
    unint64_t v6 = [(ContainerViewController *)self containeeLayout];
    id v5 = v7;
    if (v6 != 2) {
      goto LABEL_9;
    }
    uint64_t v4 = 3;
  }
  [(ContainerViewController *)self controller:v5 wantsLayout:v4];
  id v5 = v7;
LABEL_9:
}

- (void)minimizeContainee:(id)a3
{
  id v7 = a3;
  if ((id)[(ContainerViewController *)self containeeLayout] == (id)3)
  {
    if ((id)[(ContainerViewController *)self containerStyle] == (id)5) {
      uint64_t v4 = 1;
    }
    else {
      uint64_t v4 = 2;
    }
    id v5 = v7;
  }
  else
  {
    unint64_t v6 = [(ContainerViewController *)self containeeLayout];
    id v5 = v7;
    if (v6 != 2) {
      goto LABEL_9;
    }
    uint64_t v4 = 1;
  }
  [(ContainerViewController *)self controller:v5 wantsLayout:v4];
  id v5 = v7;
LABEL_9:
}

- (void)setFullscreenMode:(BOOL)a3
{
  if (self->_fullscreenMode != a3)
  {
    self->_fullscreenMode = a3;
    if ([(ContainerTransitionManager *)self->_transitionManager containerReadyToInsert])
    {
      containerStyleManager = self->_containerStyleManager;
      [(ContainerStyleManager *)containerStyleManager updateLayoutStyle];
    }
  }
}

- (double)availableHeight
{
  unint64_t v3 = [(ContainerViewController *)self currentViewController];
  [(ContainerViewController *)self availableHeightForViewController:v3];
  double v5 = v4;

  return v5;
}

- (void)controller:(id)a3 wantsLayout:(unint64_t)a4
{
  if (self->_currentViewController == a3)
  {
    BOOL v6 = +[UIView areAnimationsEnabled];
    [(ContainerViewController *)self setLayoutIfSupported:a4 animated:v6];
  }
}

- (void)popLastViewControllerWithInitialVelocity:(double)a3
{
  [(ContainerTransitionManager *)self->_transitionManager setInitialVelocity:a3];

  [(ContainerViewController *)self popLastViewControllerAnimated:1 useDefaultContaineeLayout:0];
}

- (void)popLastViewControllerAnimated:(BOOL)a3
{
}

- (void)popLastViewControllerAnimated:(BOOL)a3 useDefaultContaineeLayout:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = [(ContainerViewController *)self currentViewController];
  [(ContainerViewController *)self popLastViewControllerFromViewController:v7 animated:v5 useDefaultContaineeLayout:v4];
}

- (void)popLastViewControllerFromViewController:(id)a3 animated:(BOOL)a4
{
}

- (void)replaceCurrentWithController:(id)a3
{
}

- (void)replaceCurrentWithController:(id)a3 moveToContaineeDefaultLayout:(BOOL)a4
{
  id v5 = a3;
  [(ContainerViewController *)self replaceCurrentWithController:v5 moveToContaineeLayout:[(ContainerViewController *)self originalLayoutForViewController:v5]];
}

- (void)replaceCurrentWithController:(id)a3 moveToContaineeLayout:(unint64_t)a4
{
  BOOL v6 = (ContaineeProtocol *)a3;
  id v7 = sub_1000BF6B8();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = self;
    if (!v8)
    {
      double v13 = @"<nil>";
      goto LABEL_10;
    }
    long long v9 = (objc_class *)objc_opt_class();
    long long v10 = NSStringFromClass(v9);
    if (objc_opt_respondsToSelector())
    {
      long long v11 = [(ContainerViewController *)v8 performSelector:"accessibilityIdentifier"];
      long long v12 = v11;
      if (v11 && ![v11 isEqualToString:v10])
      {
        double v13 = +[NSString stringWithFormat:@"%@<%p, %@>", v10, v8, v12];

        goto LABEL_8;
      }
    }
    double v13 = +[NSString stringWithFormat:@"%@<%p>", v10, v8];
LABEL_8:

LABEL_10:
    containerStack = v8->_containerStack;
    *(_DWORD *)buf = 138544130;
    id v23 = v13;
    __int16 v24 = 2112;
    double v25 = v6;
    __int16 v26 = 2048;
    unint64_t v27 = a4;
    __int16 v28 = 2112;
    double v29 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] replaceCurrentWithController: %@, newContaineeLayout: %lu, containerStack: %@", buf, 0x2Au);
  }
  if (!self->_enableMacPresentationStyles
    || [(ContainerViewController *)self containeeLayout] | a4
    && ([(ContaineeProtocol *)v6 preferredPresentationStyle] == (id)2
     || ![(ContaineeProtocol *)v6 preferredPresentationStyle]))
  {
    if (self->_currentViewController == v6)
    {
      [(ContainerTransitionManager *)self->_transitionManager dequeueWaitingContainees];
    }
    else
    {
      double v15 = [(ContainerStack *)self->_containerStack lastState];
      self->_containeeLayout = 0;
      if ([(ContainerStack *)self->_containerStack indexOfContainee:v6] == 0x7FFFFFFFFFFFFFFFLL)
      {
        v20[0] = _NSConcreteStackBlock;
        v20[1] = 3221225472;
        v20[2] = sub_1003CAB30;
        void v20[3] = &unk_1012E5D58;
        v20[4] = self;
        id v16 = v6;
        objc_super v21 = v16;
        __int16 v17 = objc_retainBlock(v20);
        if (v15) {
          id v18 = [v15 layoutForStyle:[self containerStyle]];
        }
        else {
          id v18 = 0;
        }
        if (a4) {
          unint64_t v19 = a4;
        }
        else {
          unint64_t v19 = (unint64_t)v18;
        }
        [(ContainerTransitionManager *)self->_transitionManager replaceCurrentWithViewController:v16 isAlreadyInStack:0 layout:v19 animated:1 postprocess:v17];
      }
      else
      {
        [(ContainerViewController *)self presentController:v6];
      }
    }
  }
  else
  {
    [(ContainerViewController *)self presentController:v6 animated:1 useDefaultContaineeLayout:1 completion:0];
  }
}

- (BOOL)controllerIsInStack:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(ContainerTransitionManager *)self->_transitionManager hasWaitingTransitionForViewController:v4]|| [(ContainerStack *)self->_containerStack indexOfContainee:v4] != 0x7FFFFFFFFFFFFFFFLL;

  return v5;
}

- (void)setControllerStack:(id)a3
{
}

- (void)setControllerStack:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  long long v9 = (void (**)(id, uint64_t))a5;
  long long v10 = sub_1000BF6B8();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    long long v11 = self;
    if (!v11)
    {
      id v16 = @"<nil>";
      goto LABEL_10;
    }
    long long v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    if (objc_opt_respondsToSelector())
    {
      double v14 = [(ContainerViewController *)v11 performSelector:"accessibilityIdentifier"];
      double v15 = v14;
      if (v14 && ![v14 isEqualToString:v13])
      {
        id v16 = +[NSString stringWithFormat:@"%@<%p, %@>", v13, v11, v15];

        goto LABEL_8;
      }
    }
    id v16 = +[NSString stringWithFormat:@"%@<%p>", v13, v11];
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543874;
    double v32 = v16;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 1024;
    BOOL v36 = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}@] setControllerStack: %@, animated: %d", buf, 0x1Cu);
  }
  p_containerStack = &self->_containerStack;
  id v18 = [(ContainerStack *)self->_containerStack allObjects];
  if ([v18 isEqualToArray:v8])
  {
    if (v9) {
      v9[2](v9, 1);
    }
    goto LABEL_33;
  }
  unint64_t v19 = objc_alloc_init(ContainerStack);
  if ([v8 count])
  {
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    void v26[2] = sub_1003CB03C;
    v26[3] = &unk_1012E80C8;
    v26[4] = self;
    id v8 = v8;
    id v27 = v8;
    __int16 v28 = v19;
    [v8 enumerateObjectsUsingBlock:v26];

    goto LABEL_26;
  }
  double v20 = [(ContainerStack *)*p_containerStack lastState];
  if ([(ContainerViewController *)self supportsEmptyStack]) {
    goto LABEL_23;
  }
  if ([(ContainerStack *)*p_containerStack count] >= 2)
  {
    uint64_t v21 = [(ContainerStack *)*p_containerStack containeeStateAtIndex:0];
    if (v21)
    {
      double v22 = (void *)v21;
      [(ContainerStack *)v19 pushContaineeState:v21];
      uint64_t v25 = [v18 firstObject];
      uint64_t v30 = v25;
      uint64_t v23 = +[NSArray arrayWithObjects:&v30 count:1];

      id v8 = (id)v25;
LABEL_22:

      id v8 = (id)v23;
LABEL_23:
      if (v20) {
        [(ContainerStack *)v19 pushContaineeState:v20];
      }
      goto LABEL_25;
    }
  }
  if (v20)
  {
    double v22 = [v18 lastObject];
    double v29 = v22;
    uint64_t v23 = +[NSArray arrayWithObjects:&v29 count:1];
    goto LABEL_22;
  }
LABEL_25:

LABEL_26:
  objc_storeStrong((id *)&self->_containerStack, v19);
  if (self->_currentPopoverViewController && (objc_msgSend(v8, "containsObject:") & 1) == 0) {
    [(ContainerViewController *)self _dismissPopoverViewController:self->_currentPopoverViewController animated:1];
  }
  if (self->_currentMenuViewController && (objc_msgSend(v8, "containsObject:") & 1) == 0) {
    [(ContainerViewController *)self _dismissMenuViewController:self->_currentMenuViewController animated:1];
  }
  __int16 v24 = [v8 lastObject];
  [(ContainerViewController *)self presentController:v24 animated:v6 useDefaultContaineeLayout:1 completion:v9];

LABEL_33:
}

- (void)presentController:(id)a3
{
}

- (void)presentController:(id)a3 animated:(BOOL)a4
{
}

- (void)removeControllerFromStack:(id)a3
{
  id v4 = a3;
  BOOL v5 = sub_1000BF6B8();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    BOOL v6 = self;
    if (!v6)
    {
      long long v11 = @"<nil>";
      goto LABEL_10;
    }
    id v7 = (objc_class *)objc_opt_class();
    id v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      long long v9 = [(ContainerViewController *)v6 performSelector:"accessibilityIdentifier"];
      long long v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        long long v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_8;
      }
    }
    long long v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_8:

LABEL_10:
    containerStack = v6->_containerStack;
    *(_DWORD *)buf = 138543874;
    id v16 = v11;
    __int16 v17 = 2112;
    id v18 = v4;
    __int16 v19 = 2112;
    double v20 = containerStack;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "[%{public}@] removeControllerFromStack: %@, containerStack: %@", buf, 0x20u);
  }
  unint64_t v13 = [(ContainerStack *)self->_containerStack indexOfContainee:v4];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v14 = [(ContainerStack *)self->_containerStack containeeStateAtIndex:v13];
    if (v14) {
      [(ContainerStack *)self->_containerStack removeContaineeState:v14];
    }
  }
}

- (CardAnimation)cardHeightAnimation
{
  v2 = [(ContainerViewController *)self animationManager];
  unint64_t v3 = [v2 cardHeightAnimation];

  return (CardAnimation *)v3;
}

- (BOOL)_chromeEnabled
{
  v2 = [(ContainerViewController *)self chromeViewController];
  char v3 = [v2 _internal_isChromeDisabled] ^ 1;

  return v3;
}

- (BOOL)shouldPassPoint:(CGPoint)a3 withEvent:(id)a4 inView:(id)a5
{
  double y = a3.y;
  double x = a3.x;
  id v8 = a5;
  long long v9 = [(ContainerViewController *)self currentViewController];
  long long v10 = [v9 view];

  [v10 alpha];
  if (v11 == 0.0)
  {
    LOBYTE(v12) = 1;
  }
  else
  {
    unint64_t v13 = [(ContainerViewController *)self view];
    [v13 convertPoint:v8 fromView:x, y];
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    id v18 = [(ContainerViewController *)self containerView];
    [v18 frame];
    CGFloat v20 = v19;
    double v22 = v21;
    CGFloat v24 = v23;

    v27.origin.double y = v22 + -20.0;
    v27.size.CGFloat height = 20.0;
    v27.origin.double x = v20;
    v27.size.double width = v24;
    v26.double x = v15;
    v26.double y = v17;
    BOOL v12 = !CGRectContainsPoint(v27, v26);
  }

  return v12;
}

- (UIView)passThroughView
{
  return 0;
}

- (void)_updateVisibleContentForLayout:(unint64_t)a3
{
  id v4 = [(ContainerViewController *)self currentViewController];
  id v6 = v4;
  double v5 = 1.0;
  if (a3 == 1) {
    double v5 = 0.0;
  }
  [v4 applyAlphaToContent:v5];
}

- (void)setChromeHidden:(BOOL)a3
{
  if (self->_chromeHidden != a3) {
    self->_chromeHidden = a3;
  }
}

- (double)mapPeek
{
  if ((id)[(ContainerViewController *)self containerStyle] == (id)5) {
    return 32.0;
  }
  if ((id)[(ContainerViewController *)self containerStyle] == (id)3
    || (id)[(ContainerViewController *)self containerStyle] == (id)4)
  {
    [(ContainerViewController *)self edgePadding];
  }
  else
  {
    id v4 = [(ContainerViewController *)self view];
    [v4 safeAreaInsets];
    double v6 = v5;

    double result = 24.0;
    if (v6 != 0.0) {
      return 12.0;
    }
  }
  return result;
}

- (BOOL)_canUpdateContainee:(id)a3 withLayout:(unint64_t)a4
{
  [a3 heightForLayout:a4];
  return v4 != -1.0;
}

- (BOOL)_updateContaineeIfNeeded:(id)a3 withLayout:(unint64_t)a4
{
  id v5 = a3;
  [v5 heightForLayout:a4];
  double v7 = v6;
  if (v6 != -1.0)
  {
    id v8 = [v5 cardPresentationController];
    [v8 updateHeightConstraintWithValue:v7];
  }
  return v7 != -1.0;
}

- (void)updateLayoutAnimated:(BOOL)a3
{
  if (self->_currentViewController)
  {
    BOOL v3 = a3;
    if ((-[ContainerViewController delaysFirstCardPresentation]_0() & 1) == 0)
    {
      if (v3)
      {
        self->_shouldEndTransitionWhenAnimationCompletes = 1;
        id v5 = [(ContainerViewController *)self view];
        [v5 updateConstraintsIfNeeded];

        double v6 = [(ContainerViewController *)self animationManager];
        double v7 = [v6 cardHeightAnimation];
        v12[4] = self;
        v13[0] = _NSConcreteStackBlock;
        v13[1] = 3221225472;
        void v13[2] = sub_1003CBB54;
        v13[3] = &unk_1012E5D08;
        v13[4] = self;
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1003CBBEC;
        v12[3] = &unk_1012E7D28;
        [v7 applyWithAnimations:v13 completion:v12];
      }
      else
      {
        [(ContainerViewController *)self _updateVisibleContentForLayout:self->_containeeLayout];
        if (self->_transitioning)
        {
          id v8 = [(ContainerViewController *)self view];
          [v8 layoutIfNeeded];
        }
        [(ContainerViewController *)self containee:self->_currentViewController didChangeLayout:self->_containeeLayout];
        long long v9 = [(ContainerViewController *)self currentViewController];
        [v9 didChangeLayout:self->_containeeLayout];

        long long v10 = [(ContainerViewController *)self currentViewController];
        [v10 heightForLayout:self->_containeeLayout];
        -[ContainerViewController contentHeightUpdatedWithValue:](self, "contentHeightUpdatedWithValue:");

        [(ContainerViewController *)self updateContaineeStackState];
      }
      double v11 = [(ContainerViewController *)self iosBasedChromeViewController];
      [v11 setNeedsUpdateComponent:@"statusBarStyle" animated:v3];
    }
  }
}

- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4
{
}

- (void)setLayoutIfSupported:(unint64_t)a3 animated:(BOOL)a4 source:(unint64_t)a5
{
  BOOL v6 = a4;
  long long v9 = [(ContainerViewController *)self currentViewController];

  if (!v9) {
    return;
  }
  long long v10 = [(ContainerViewController *)self currentViewController];
  double v11 = [v10 cardPresentationController];
  unsigned int v12 = [v11 usingSheetPresentation];

  if (v12)
  {
    unint64_t v13 = [(ContainerViewController *)self currentViewController];
    double v14 = [v13 cardPresentationController];
    id v15 = [v14 containeeLayout];

    if (v15 == (id)a3)
    {
      self->_incompleteCompletion = 1;
LABEL_17:
      [(ContainerViewController *)self _completeStateIfNeeded];
      return;
    }
    id v19 = [(ContainerViewController *)self currentViewController];
    CGFloat v17 = [v19 cardPresentationController];
    [v17 wantsLayout:a3];
  }
  else
  {
    double v16 = [(ContainerViewController *)self overriddenLayoutForCurrentController:a3];
    if ((void *)[(ContainerViewController *)self containeeLayout] == v16)
    {
      [(ContainerViewController *)self snapToLayout:v16];
    }
    else
    {
      if (![(ContainerViewController *)self _canUpdateContainee:self->_currentViewController withLayout:v16])goto LABEL_17; {
      [(ContainerViewController *)self containee:self->_currentViewController willChangeLayout:v16 source:a5];
      }
      id v18 = [(ContainerViewController *)self currentViewController];
      [v18 willChangeLayout:v16];

      self->_containeeLayout = (unint64_t)v16;
      [(ContainerViewController *)self _updateContaineeIfNeeded:self->_currentViewController withLayout:v16];
      [(ContainerViewController *)self updateLayoutAnimated:v6];
    }
  }
}

- (void)_completeStateIfNeeded
{
  if (self->_incompleteCompletion)
  {
    self->_incompleteCompletion = 0;
    [(ContainerViewController *)self containee:self->_currentViewController didChangeLayout:self->_containeeLayout];
    BOOL v3 = [(ContainerViewController *)self currentViewController];
    [v3 didChangeLayout:self->_containeeLayout];

    [(ContainerViewController *)self transitionEnded];
  }
}

- (void)animateAlongsideCardTransition
{
  id v4 = [(ContainerViewController *)self currentViewController];
  BOOL v3 = [v4 cardPresentationController];
  [v3 cardHeight];
  -[ContainerViewController _notifyResizingObserversWithValue:onlyIfDragging:](self, "_notifyResizingObserversWithValue:onlyIfDragging:", 0);
}

- (void)transitionEnded
{
  self->_transitioning = 0;
  id v2 = [(ContainerViewController *)self _maps_mapsSceneDelegate];
  [v2 setNeedsUserActivityUpdate];
}

- (void)updateHeightConstraintWithValue:(double)a3
{
  id v5 = [(ContaineeProtocol *)self->_currentViewController cardPresentationController];
  unsigned int v6 = [v5 updateHeightConstraintWithValue:a3];

  if (v6)
  {
    self->_shouldEndTransitionWhenAnimationCompletes = 0;
    [(ContainerViewController *)self contentHeightUpdatedWithValue:a3];
  }
}

- (unint64_t)overriddenLayoutForCurrentController:(unint64_t)a3
{
  if ((id)[(ContainerViewController *)self containerStyle] == (id)3) {
    return 4;
  }
  if ((id)[(ContainerViewController *)self containerStyle] != (id)6
    || ([(ContainerViewController *)self currentViewController],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 cardPresentationController],
        unsigned int v6 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v7 = [v6 allowResizeInFloatingStyle],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    if ((id)[(ContainerViewController *)self containerStyle] != (id)6)
    {
      id v8 = [(ContainerViewController *)self currentViewController];
      long long v9 = [v8 cardPresentationController];
      unsigned __int8 v10 = [v9 presentedModally];

      if (v10) {
        return 5;
      }
    }
    if (![(ContainerViewController *)self allowOnlyStandardStyle] && a3 != 5)
    {
      unint64_t v11 = [(ContainerViewController *)self containerStyle];
      if (v11 <= 7)
      {
        if (((1 << v11) & 0xC8) != 0) {
          return 4;
        }
        if (((1 << v11) & 6) != 0)
        {
          if (a3 == 4) {
            return 3;
          }
        }
        else
        {
          unint64_t v12 = 4;
          if (a3 - 1 < 2) {
            unint64_t v12 = 1;
          }
          if (((1 << v11) & 0x30) != 0) {
            return v12;
          }
        }
      }
    }
  }
  return a3;
}

- (int)currentUITargetForAnalytics
{
  BOOL v3 = [(ContainerViewController *)self currentViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(ContainerViewController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentUITargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (int)currentMapViewTargetForAnalytics
{
  BOOL v3 = [(ContainerViewController *)self currentViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___GEOLogContextDelegate];

  if (!v4) {
    return 0;
  }
  id v5 = [(ContainerViewController *)self currentViewController];
  if (objc_opt_respondsToSelector()) {
    int v6 = [v5 currentMapViewTargetForAnalytics];
  }
  else {
    int v6 = 0;
  }

  return v6;
}

- (BOOL)cardDismissalHelperShouldObserveGestures:(id)a3
{
  uint64_t v4 = [(ContainerViewController *)self currentViewController];
  BOOL result = (!v4
         || (id v5 = (void *)v4,
             [(ContainerViewController *)self currentViewController],
             int v6 = objc_claimAutoreleasedReturnValue(),
             unsigned int v7 = [v6 shouldCollapseOnMapGesture],
             v6,
             v5,
             v7))
        && (id)[(ContainerViewController *)self containeeLayout] != (id)1
        && (id)[(ContainerViewController *)self containerStyle] == (id)1;
  return result;
}

- (double)dismissalRectTopEdgeForCardDismissalHelper:(id)a3 coordinateSpace:(id)a4
{
  id v5 = a4;
  int v6 = [(ContainerViewController *)self currentViewController];
  unsigned int v7 = [v6 view];

  [v7 bounds];
  [v7 convertRect:v5 toCoordinateSpace:];
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;
  CGFloat v15 = v14;

  v18.origin.double x = v9;
  v18.origin.double y = v11;
  v18.size.double width = v13;
  v18.size.CGFloat height = v15;
  double MinY = CGRectGetMinY(v18);

  return MinY;
}

- (void)requestDismissalWithCardDismissalHelper:(id)a3
{
  id v4 = [(ContainerViewController *)self currentViewController];
  BOOL v3 = [v4 cardPresentationController];
  [v3 wantsLayout:1];
}

- (void)sheetPresentationControllerDidChangeSelectedDetentIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(ContainerViewController *)self view];
  [v5 setNeedsLayout];

  int v6 = [v4 presentedViewController];
  unsigned int v7 = [v6 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol];

  if (v7)
  {
    double v8 = [(ContainerViewController *)self view];
    CGFloat v9 = [v8 window];
    [v9 endEditing:1];

    double v10 = [v4 presentedViewController];
    CGFloat v11 = [v10 cardPresentationController];
    -[ContainerViewController containee:willChangeLayout:source:](self, "containee:willChangeLayout:source:", v10, [v11 containeeLayout], 0);

    double v12 = [v4 selectedDetentIdentifier];
    CGFloat v13 = [v4 detents];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    void v25[2] = sub_1003CC85C;
    v25[3] = &unk_1012E8188;
    id v26 = v12;
    id v14 = v12;
    id v15 = [v13 indexOfObjectPassingTest:v25];

    if (v15 == (id)0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
    double v16 = [v4 _detentValues];
    id v17 = [v16 count];

    if (v15 >= v17) {
      goto LABEL_6;
    }
    CGRect v18 = [v4 _detentValues];
    id v19 = [v18 objectAtIndexedSubscript:v15];
    [v19 cgFloatValue];
    double v21 = v20;

    if (v21 < 0.0 || v21 == UISheetPresentationControllerDetentInactive)
    {
LABEL_6:
      double v22 = [v10 cardPresentationController];
      [v22 cardHeight];
      double v21 = v23;
    }
    [(ContainerViewController *)self _notifyResizingObserversWithValue:0 onlyIfDragging:v21];
    CGFloat v24 = [v10 cardPresentationController];
    -[ContainerViewController containee:didChangeLayout:](self, "containee:didChangeLayout:", v10, [v24 containeeLayout]);
  }
}

- (BOOL)presentationControllerShouldDismiss:(id)a3
{
  id v4 = [(ContainerViewController *)self currentViewController];
  id v5 = [v4 cardPresentationController];
  if ([v5 usingSheetPresentation])
  {
    int v6 = [(ContainerViewController *)self currentViewController];
    unsigned int v7 = [v6 cardPresentationController];
    unsigned __int8 v8 = [v7 allowsSwipeToDismiss];
  }
  else
  {
    unsigned __int8 v8 = 1;
  }

  return v8;
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  id v5 = [v4 presentedViewController];
  unsigned int v6 = [v5 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol];

  if (v6)
  {
    unsigned int v7 = [v4 presentedViewController];
    unint64_t v8 = [(ContainerStack *)self->_containerStack indexOfContainee:v7];
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_13:

      goto LABEL_14;
    }
    unint64_t v9 = v8;
    [v7 willDismissByGesture];
    if (v9)
    {
      double v10 = [(ContainerStack *)self->_containerStack containeeStateAtIndex:v9 - 1];
      CGFloat v11 = [v10 viewController];
    }
    else
    {
      CGFloat v11 = 0;
    }
    [v11 willBecomeCurrentByGesture];
    uint64_t v12 = [v11 presentedViewController];
    if (v12)
    {
      id v13 = (id)v12;
      uint64_t v14 = [v11 presentedViewController];
      if ((void *)v14 == v7)
      {

        goto LABEL_11;
      }
      id v15 = (void *)v14;
      double v16 = [v11 presentedViewController];
      unsigned int v17 = [v16 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol];

      if (v17)
      {
        CGRect v18 = [v11 presentedViewController];
        id v19 = [v18 cardPresentationController];
        unsigned __int8 v20 = [v19 hidden];

        double v21 = [v7 transitionCoordinator];
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        void v25[2] = sub_1003CCB94;
        v25[3] = &unk_1012E81F8;
        id v26 = v18;
        v22[0] = _NSConcreteStackBlock;
        v22[1] = 3221225472;
        v22[2] = sub_1003CCBDC;
        v22[3] = &unk_1012E7FD0;
        id v23 = v26;
        unsigned __int8 v24 = v20;
        id v13 = v26;
        [v21 animateAlongsideTransition:v25 completion:v22];

LABEL_11:
      }
    }

    goto LABEL_13;
  }
LABEL_14:
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v15 = a3;
  id v4 = [v15 presentedViewController];
  unsigned int v5 = [v4 conformsToProtocol:&OBJC_PROTOCOL___ContaineeProtocol];

  unsigned int v6 = v15;
  if (v5)
  {
    unsigned int v7 = [v15 presentedViewController];
    unint64_t v8 = [(ContainerStack *)self->_containerStack indexOfContainee:v7];
    unint64_t v9 = v8;
    if (v8)
    {
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
      {
LABEL_7:

        unsigned int v6 = v15;
        goto LABEL_8;
      }
      double v10 = [(ContainerStack *)self->_containerStack containeeStateAtIndex:v8 - 1];
      CGFloat v11 = [v10 viewController];
    }
    else
    {
      CGFloat v11 = 0;
    }
    [v7 didDismissByGesture];
    [(ContainerTransitionManager *)self->_transitionManager didPerformUnmanagedDismissOfViewController:v7 revealingViewController:v11];
    containerStack = self->_containerStack;
    id v13 = [(ContainerStack *)containerStack containeeStateAtIndex:v9];
    [(ContainerStack *)containerStack removeContaineeState:v13];

    uint64_t v14 = [v11 cardPresentationController];
    [v14 cardHeight];
    -[ContainerViewController _notifyResizingObserversWithValue:onlyIfDragging:](self, "_notifyResizingObserversWithValue:onlyIfDragging:", 0);

    goto LABEL_7;
  }
LABEL_8:
}

- (void)assertPresentationStackAppearsCorrect
{
  if (-[ContainerViewController delaysFirstCardPresentation]_0())
  {
    BOOL v3 = [(ContainerViewController *)self internalStackLessWaitingForPresentation];
    id v4 = [(ContainerViewController *)self uikitPresentationStack];
    if ([(ContainerViewController *)self presentationStackAppearsCorrectWithInternalStack:v3 uikitStack:v4])
    {
LABEL_14:

      return;
    }
    unsigned int v5 = sub_1000BF6B8();
    if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
    {
LABEL_13:

      goto LABEL_14;
    }
    unsigned int v6 = self;
    if (!v6)
    {
      CGFloat v11 = @"<nil>";
      goto LABEL_12;
    }
    unsigned int v7 = (objc_class *)objc_opt_class();
    unint64_t v8 = NSStringFromClass(v7);
    if (objc_opt_respondsToSelector())
    {
      unint64_t v9 = [(ContainerViewController *)v6 performSelector:"accessibilityIdentifier"];
      double v10 = v9;
      if (v9 && ![v9 isEqualToString:v8])
      {
        CGFloat v11 = +[NSString stringWithFormat:@"%@<%p, %@>", v8, v6, v10];

        goto LABEL_10;
      }
    }
    CGFloat v11 = +[NSString stringWithFormat:@"%@<%p>", v8, v6];
LABEL_10:

LABEL_12:
    *(_DWORD *)buf = 138543874;
    id v13 = v11;
    __int16 v14 = 2112;
    id v15 = v3;
    __int16 v16 = 2112;
    unsigned int v17 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_FAULT, "[%{public}@] presentation stack appears incorrect. internalStack: %@ uikitStack: %@", buf, 0x20u);

    goto LABEL_13;
  }
}

- (void)_sequentiallyPresentViewControllers:(id)a3 allowAnimations:(BOOL)a4
{
  BOOL v4 = a4;
  unint64_t v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  CGFloat v11 = sub_1003CD1C8;
  uint64_t v12 = &unk_1012E5D58;
  id v6 = a3;
  id v13 = v6;
  __int16 v14 = self;
  unsigned int v7 = objc_retainBlock(&v9);
  unint64_t v8 = v7;
  if (v4) {
    ((void (*)(void ***))v7[2])(v7);
  }
  else {
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v7, v9, v10, v11, v12);
  }
}

- (void)willBeginDisplayingInSecureLockScreen
{
  self->_willBeginDisplayingInLockScreen = 1;
  [(ContainerTransitionManager *)self->_transitionManager setContainerReadyToInsert:0];
}

- (void)_pushPalette:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  [(SupplementalStackViewController *)self->_paletteViewController pushContainee:a3 animated:a4 completion:a5];
  paletteWidthConstraint = self->_paletteWidthConstraint;

  [(NSLayoutConstraint *)paletteWidthConstraint setConstant:282.0];
}

- (void)_popPalette:(BOOL)a3 completion:(id)a4
{
  [(SupplementalStackViewController *)self->_paletteViewController popContainee:a3 completion:a4];
  if ([(SupplementalStackViewController *)self->_paletteViewController isEmpty])
  {
    paletteWidthConstraint = self->_paletteWidthConstraint;
    [(NSLayoutConstraint *)paletteWidthConstraint setConstant:0.0];
  }
}

- (void)shareFromMenuDidSelect:(id)a3
{
  id v4 = a3;
  unsigned int v5 = +[UIApplication sharedMapsDelegate];
  id v6 = [v5 appKitBundleClass];

  LODWORD(v5) = [v6 shouldDismissPopoverForShareKitNotification:v4];
  if (v5)
  {
    [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:1];
  }
}

- (void)_presentMenuViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  unint64_t v8 = (ContaineeProtocol *)a3;
  id v10 = a5;
  currentMenuViewController = self->_currentMenuViewController;
  if (currentMenuViewController)
  {
    [(ContainerViewController *)self _dismissCurrentMenuViewControllerAnimated:v6];
    currentMenuViewController = self->_currentMenuViewController;
  }
  self->_currentMenuViewController = v8;

  [(ContainerViewController *)self _presentCurrentMenuViewControllerAnimated:v6 completion:v10];
}

- (void)_presentCurrentMenuViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  currentMenuViewController = self->_currentMenuViewController;
  if (currentMenuViewController)
  {
    unint64_t v8 = [(ContaineeProtocol *)currentMenuViewController macMenuPresentationController];
    if ([v8 isPresented])
    {
    }
    else
    {
      unint64_t v9 = [(ContaineeProtocol *)self->_currentMenuViewController macMenuPresentationController];
      unsigned __int8 v10 = [v9 isDismissing];

      if ((v10 & 1) == 0)
      {
        CGFloat v11 = [(ContaineeProtocol *)self->_currentMenuViewController macMenuPresentationController];
        [v11 addObserver:self];

        uint64_t v12 = [(ContaineeProtocol *)self->_currentMenuViewController macMenuPresentationController];
        id v13 = [(ContainerViewController *)self chromeViewController];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        void v14[2] = sub_1003CD7DC;
        v14[3] = &unk_1012E6EA8;
        id v15 = v6;
        [v12 presentFromViewController:v13 animated:v4 completion:v14];
      }
    }
  }
}

- (void)_dismissMenuViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (ContaineeProtocol *)a3;
  if (v6)
  {
    if (self->_currentMenuViewController == v6)
    {
      self->_currentMenuViewController = 0;
      unsigned __int8 v10 = v6;

      unsigned int v7 = [(ContaineeProtocol *)v10 macMenuPresentationController];
      unsigned int v8 = [v7 isPresented];

      id v6 = v10;
      if (v8)
      {
        unint64_t v9 = [(ContaineeProtocol *)v10 macMenuPresentationController];
        [v9 dismissAnimated:v4 completion:&stru_1012E81D0];

        id v6 = v10;
      }
    }
  }
}

- (void)_dismissCurrentMenuViewControllerAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  currentMenuViewController = self->_currentMenuViewController;
  if (currentMenuViewController) {
    [(ContainerViewController *)self _dismissMenuViewController:currentMenuViewController animated:v3];
  }
}

- (void)macMenuPresentationControllerWillDismiss:(id)a3
{
  currentMenuViewController = self->_currentMenuViewController;
  id v5 = a3;
  id v6 = [(ContaineeProtocol *)currentMenuViewController macMenuPresentationController];

  if (v6 == v5)
  {
    unsigned int v7 = self->_currentMenuViewController;
    self->_currentMenuViewController = 0;
  }
}

- (void)macMenuPresentationControllerDidDismiss:(id)a3
{
  [a3 removeObserver:self];

  [(ContainerViewController *)self _presentCurrentMenuViewControllerAnimated:1 completion:0];
}

- (void)_presentPopoverViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  __int16 v16 = (ContaineeProtocol *)a3;
  unint64_t v9 = (void (**)(id, void))a5;
  unsigned __int8 v10 = [(ContainerViewController *)self view];
  CGFloat v11 = [v10 window];

  if (v11)
  {
    if (![(ContainerViewController *)self _isDeferringMapPopovers])
    {
      currentPopoverViewController = self->_currentPopoverViewController;
      if (currentPopoverViewController)
      {
        id v13 = [(ContaineeProtocol *)self->_currentPopoverViewController macPopoverPresentationController];
        unsigned __int8 v14 = [v13 isPresented];

        if (currentPopoverViewController == v16 && (v14 & 1) != 0) {
          goto LABEL_11;
        }
        [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:v6];
      }
      objc_storeStrong((id *)&self->_currentPopoverViewController, a3);
      id v15 = [(ContaineeProtocol *)self->_currentPopoverViewController macPopoverPresentationController];
      [v15 setDelegate:self];

      [(ContainerViewController *)self _presentCurrentPopoverAnimated:v6 completion:v9];
      goto LABEL_11;
    }
    objc_storeStrong((id *)&self->_deferredPopoverViewController, a3);
  }
  if (v9) {
    v9[2](v9, 0);
  }
LABEL_11:
}

- (void)_presentCurrentPopoverAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    unsigned int v8 = [(ContaineeProtocol *)currentPopoverViewController macPopoverPresentationController];
    if ([v8 isPresented])
    {
LABEL_3:

      goto LABEL_12;
    }
    unint64_t v9 = [(ContaineeProtocol *)self->_currentPopoverViewController macPopoverPresentationController];
    unsigned __int8 v10 = [v9 isDismissing];

    if ((v10 & 1) == 0)
    {
      if (v6)
      {
        id v11 = objc_retainBlock(self->_pendingPopoverPresentationCompletionHandler);
        uint64_t v12 = v11;
        if (v11) {
          (*((void (**)(id, void))v11 + 2))(v11, 0);
        }
        id v13 = [v6 copy];
        id pendingPopoverPresentationCompletionHandler = self->_pendingPopoverPresentationCompletionHandler;
        self->_id pendingPopoverPresentationCompletionHandler = v13;
      }
      if (![(ContainerViewController *)self _isDeferringMapPopovers])
      {
        id v15 = [(ContainerViewController *)self chromeViewController];
        unsigned int v8 = [v15 mapView];

        if (([v8 isRegionChanging] & 1) == 0)
        {
          __int16 v16 = [(ContainerViewController *)self chromeViewController];
          unsigned int v17 = [v16 view];
          double v22 = v17;
          CGRect v18 = +[NSArray arrayWithObjects:&v22 count:1];
          id v19 = [(ContaineeProtocol *)self->_currentPopoverViewController macPopoverPresentationController];
          [v19 setPassthroughViews:v18];

          unsigned __int8 v20 = [(ContaineeProtocol *)self->_currentPopoverViewController macPopoverPresentationController];
          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_1003CDD3C;
          v21[3] = &unk_1012E5D08;
          v21[4] = self;
          [v20 presentFromContainerViewController:self animated:v4 completion:v21];
        }
        goto LABEL_3;
      }
    }
  }
  else if (v6)
  {
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
LABEL_12:
}

- (void)_dismissPopoverViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = (ContaineeProtocol *)a3;
  unsigned int v7 = v6;
  if (self->_deferredPopoverViewController == v6)
  {
    self->_deferredPopoverViewController = 0;
  }
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    unint64_t v9 = [(ContaineeProtocol *)currentPopoverViewController macPopoverPresentationController];
    unsigned int v10 = [v9 isPresented];

    if (v10)
    {
      id v11 = self->_currentPopoverViewController;
      uint64_t v12 = [(ContaineeProtocol *)v11 macPopoverPresentationController];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      void v15[2] = sub_1003CDF08;
      v15[3] = &unk_1012E5D58;
      v15[4] = self;
      __int16 v16 = v11;
      id v13 = v11;
      [v12 dismissAnimated:v4 completion:v15];
    }
    unsigned __int8 v14 = self->_currentPopoverViewController;
    self->_currentPopoverViewController = 0;
  }
}

- (void)_popCurrentPopoverViewControllerAnimated:(BOOL)a3
{
  BOOL v4 = self->_currentPopoverViewController;
  if (v4)
  {
    unint64_t v9 = v4;
    id v5 = [(ContaineeProtocol *)v4 macPopoverPresentationController];
    unsigned int v6 = [v5 isPresented];

    BOOL v4 = v9;
    if (v6)
    {
      id v7 = objc_retainBlock(self->_popoverDismissHandler);
      unsigned int v8 = v7;
      if (v7) {
        (*((void (**)(id, ContaineeProtocol *))v7 + 2))(v7, v9);
      }
      else {
        [(ContaineeProtocol *)v9 handleDismissAction:self];
      }

      BOOL v4 = v9;
    }
  }
}

- (void)macSetPopoverDismissHandler:(id)a3
{
  id v4 = [a3 copy];
  id popoverDismissHandler = self->_popoverDismissHandler;
  self->_id popoverDismissHandler = v4;
}

- (void)_popoverDismissDidFinish
{
  id v6 = objc_retainBlock(self->_pendingPopoverPresentationCompletionHandler);
  id pendingPopoverPresentationCompletionHandler = self->_pendingPopoverPresentationCompletionHandler;
  self->_id pendingPopoverPresentationCompletionHandler = 0;

  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    objc_storeStrong((id *)&self->_deferredPopoverViewController, currentPopoverViewController);
    id v5 = self->_currentPopoverViewController;
    self->_currentPopoverViewController = 0;
  }
  [(ContainerViewController *)self endDeferringPresentingMapPopovers:v6];
}

- (void)macPopoverPresentationControllerWillDismiss:(id)a3
{
  currentPopoverViewController = self->_currentPopoverViewController;
  id v5 = a3;
  id v6 = [(ContaineeProtocol *)currentPopoverViewController macPopoverPresentationController];

  if (v6 == v5)
  {
    id v7 = self->_currentPopoverViewController;
    [(ContainerViewController *)self macWillDismissPopoverContaineeController:v7];
  }
}

- (void)macWillDismissPopoverContaineeController:(id)a3
{
  id v5 = (ContaineeProtocol *)a3;
  [(ContainerViewController *)self beginDeferringPresentingMapPopovers];
  id v4 = v5;
  if (self->_currentPopoverViewController == v5)
  {
    self->_currentPopoverViewController = 0;

    id v4 = v5;
  }
}

- (void)macPopoverPresentationControllerDidDismiss:(id)a3
{
}

- (BOOL)_isDeferringMapPopovers
{
  return self->_deferMapPopoverCount > 0;
}

- (void)deferPresentingMapPopoversInsideBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  [(ContainerViewController *)self beginDeferringPresentingMapPopovers];
  if (v4) {
    v4[2]();
  }
  [(ContainerViewController *)self endDeferringPresentingMapPopovers];
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
}

- (void)mapView:(id)a3 regionDidChangeAnimated:(BOOL)a4
{
  id v5 = a3;
  currentPopoverViewController = self->_currentPopoverViewController;
  if (currentPopoverViewController)
  {
    id v9 = v5;
    id v7 = [(ContaineeProtocol *)currentPopoverViewController macPopoverPresentationController];
    unsigned __int8 v8 = [v7 isPresented];

    id v5 = v9;
    if ((v8 & 1) == 0)
    {
      [(ContainerViewController *)self _presentCurrentPopoverAnimated:1 completion:0];
      id v5 = v9;
    }
  }
}

- (void)mapView:(id)a3 didChangeUserTrackingMode:(int64_t)a4 animated:(BOOL)a5
{
  if ((unint64_t)(a4 - 1) <= 1) {
    [(ContainerViewController *)self _popCurrentPopoverViewControllerAnimated:1];
  }
}

- (void)mapView:(id)a3 didBecomePitched:(BOOL)a4
{
}

- (ContainerDelegate)containerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_containerDelegate);

  return (ContainerDelegate *)WeakRetained;
}

- (void)setContainerDelegate:(id)a3
{
}

- (void)setContainerView:(id)a3
{
}

- (CardAnimationManager)animationManager
{
  return self->_animationManager;
}

- (ContainerStyleManager)containerStyleManager
{
  return self->_containerStyleManager;
}

- (BOOL)chromeHidden
{
  return self->_chromeHidden;
}

- (void)setTransitioning:(BOOL)a3
{
  self->_transitioning = a3;
}

- (BOOL)preventEdgeInsetsUpdate
{
  return self->_preventEdgeInsetsUpdate;
}

- (void)setPreventEdgeInsetsUpdate:(BOOL)a3
{
  self->_preventEdgeInsetsUpdate = a3;
}

- (BOOL)useBackdropFullScreen
{
  return self->_useBackdropFullScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containerStyleManager, 0);
  objc_storeStrong((id *)&self->_animationManager, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_destroyWeak((id *)&self->_chromeViewController);
  objc_destroyWeak((id *)&self->_chromeContext);
  objc_destroyWeak((id *)&self->_containerDelegate);
  objc_storeStrong((id *)&self->_currentViewController, 0);
  objc_storeStrong(&self->_popoverDismissHandler, 0);
  objc_storeStrong((id *)&self->_paletteWidthConstraint, 0);
  objc_storeStrong((id *)&self->_paletteViewController, 0);
  objc_storeStrong(&self->_pendingPopoverPresentationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_deferredPopoverViewController, 0);
  objc_storeStrong((id *)&self->_currentPopoverViewController, 0);
  objc_storeStrong((id *)&self->_currentMenuViewController, 0);
  objc_storeStrong(&self->_mapInsetPropagationSuspensionToken, 0);
  objc_storeStrong((id *)&self->_cardDismissalHelper, 0);
  objc_storeStrong((id *)&self->_resizingBlocksByObserver, 0);
  objc_storeStrong((id *)&self->_backdropConstraints, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_cardProvider, 0);
  objc_storeStrong((id *)&self->_containerStack, 0);
  objc_storeStrong((id *)&self->_transitionManager, 0);

  objc_storeStrong((id *)&self->_cards, 0);
}

- (BOOL)isVLFCrowdsourcingPermissionCardActive
{
  id v2 = [(ContainerViewController *)self currentViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)showVLFCrowdsourcingPermissionCardWithContaineeDelegate:(id)a3 delegate:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (![(ContainerViewController *)self isVLFCrowdsourcingPermissionCardActive])
  {
    unint64_t v18 = [(ContainerViewController *)self containerStyle];
    if (+[VLFCrowdsourcingPermissionContaineeViewController shouldShowPermissionViewController])
    {
      unint64_t v19 = v18 & 0xFFFFFFFFFFFFFFFDLL;
      sub_100A23BEC();
      unsigned __int8 v20 = (VLFCrowdsourcingPermissionContaineeViewController *)objc_claimAutoreleasedReturnValue();
      BOOL v21 = os_log_type_enabled(&v20->super.super.super.super.super.super, OS_LOG_TYPE_INFO);
      if (v19 == 4)
      {
        if (v21)
        {
          double v22 = self;
          if (!v22)
          {
            CGRect v27 = @"<nil>";
            goto LABEL_48;
          }
          id v23 = (objc_class *)objc_opt_class();
          unsigned __int8 v24 = NSStringFromClass(v23);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v25 = [(ContainerViewController *)v22 performSelector:"accessibilityIdentifier"];
            id v26 = v25;
            if (v25 && ![v25 isEqualToString:v24])
            {
              CGRect v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v24, v22, v26];

              goto LABEL_19;
            }
          }
          CGRect v27 = +[NSString stringWithFormat:@"%@<%p>", v24, v22];
LABEL_19:

LABEL_48:
          *(_DWORD *)buf = 138543362;
          CGRect v45 = (const char *)v27;
          double v42 = "[%{public}@] Not showing VLF crowdsourcing permission card because the phone is in landscape";
          goto LABEL_49;
        }
LABEL_50:
        BOOL v41 = 0;
LABEL_51:

        goto LABEL_52;
      }
      if (!v21)
      {
LABEL_55:

        unsigned __int8 v20 = [[VLFCrowdsourcingPermissionContaineeViewController alloc] initWithCompletion:v10];
        [(ContaineeViewController *)v20 setContaineeDelegate:v8];
        [(ControlContaineeViewController *)v20 setDelegate:v9];
        BOOL v41 = 1;
        [(ContainerViewController *)self presentController:v20 animated:1];
        goto LABEL_51;
      }
      __int16 v33 = self;
      if (!v33)
      {
        __int16 v38 = @"<nil>";
        goto LABEL_54;
      }
      id v34 = (objc_class *)objc_opt_class();
      __int16 v35 = NSStringFromClass(v34);
      if (objc_opt_respondsToSelector())
      {
        BOOL v36 = [(ContainerViewController *)v33 performSelector:"accessibilityIdentifier"];
        BOOL v37 = v36;
        if (v36 && ![v36 isEqualToString:v35])
        {
          __int16 v38 = +[NSString stringWithFormat:@"%@<%p, %@>", v35, v33, v37];

          goto LABEL_35;
        }
      }
      __int16 v38 = +[NSString stringWithFormat:@"%@<%p>", v35, v33];
LABEL_35:

LABEL_54:
      *(_DWORD *)buf = 138543362;
      CGRect v45 = (const char *)v38;
      _os_log_impl((void *)&_mh_execute_header, &v20->super.super.super.super.super.super, OS_LOG_TYPE_INFO, "[%{public}@] Showing VLF crowdsourcing permission card", buf, 0xCu);

      goto LABEL_55;
    }
    sub_100A23BEC();
    unsigned __int8 v20 = (VLFCrowdsourcingPermissionContaineeViewController *)objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(&v20->super.super.super.super.super.super, OS_LOG_TYPE_INFO)) {
      goto LABEL_50;
    }
    __int16 v28 = self;
    if (!v28)
    {
      CGRect v27 = @"<nil>";
      goto LABEL_45;
    }
    double v29 = (objc_class *)objc_opt_class();
    uint64_t v30 = NSStringFromClass(v29);
    if (objc_opt_respondsToSelector())
    {
      double v31 = [(ContainerViewController *)v28 performSelector:"accessibilityIdentifier"];
      double v32 = v31;
      if (v31 && ![v31 isEqualToString:v30])
      {
        CGRect v27 = +[NSString stringWithFormat:@"%@<%p, %@>", v30, v28, v32];

        goto LABEL_27;
      }
    }
    CGRect v27 = +[NSString stringWithFormat:@"%@<%p>", v30, v28];
LABEL_27:

LABEL_45:
    *(_DWORD *)buf = 138543362;
    CGRect v45 = (const char *)v27;
    double v42 = "[%{public}@] The VLF crowdsourcing permission card is not eligible to be shown";
LABEL_49:
    _os_log_impl((void *)&_mh_execute_header, &v20->super.super.super.super.super.super, OS_LOG_TYPE_INFO, v42, buf, 0xCu);

    goto LABEL_50;
  }
  id v11 = sub_100A23BEC();
  if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
    goto LABEL_38;
  }
  uint64_t v12 = self;
  if (!v12)
  {
    unsigned int v17 = @"<nil>";
    goto LABEL_37;
  }
  id v13 = (objc_class *)objc_opt_class();
  unsigned __int8 v14 = NSStringFromClass(v13);
  if (objc_opt_respondsToSelector())
  {
    id v15 = [(ContainerViewController *)v12 performSelector:"accessibilityIdentifier"];
    __int16 v16 = v15;
    if (v15 && ![v15 isEqualToString:v14])
    {
      unsigned int v17 = +[NSString stringWithFormat:@"%@<%p, %@>", v14, v12, v16];

      goto LABEL_9;
    }
  }
  unsigned int v17 = +[NSString stringWithFormat:@"%@<%p>", v14, v12];
LABEL_9:

LABEL_37:
  *(_DWORD *)buf = 138543362;
  CGRect v45 = (const char *)v17;
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "[%{public}@] The VLF crowdsourcing card is already visible; can't show twice",
    buf,
    0xCu);

LABEL_38:
  unsigned int v39 = sub_1005762E4();
  if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315650;
    CGRect v45 = "-[ContainerViewController(VLFCrowdsourcing) showVLFCrowdsourcingPermissionCardWithContaineeDelegate:delegate:completion:]";
    __int16 v46 = 2080;
    CGRect v47 = "ContainerViewController+VLFCrowdsourcing.m";
    __int16 v48 = 1024;
    int v49 = 29;
    _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
  }

  if (sub_100BB36BC())
  {
    sub_1005762E4();
    unsigned __int8 v20 = (VLFCrowdsourcingPermissionContaineeViewController *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v20->super.super.super.super.super.super, OS_LOG_TYPE_ERROR))
    {
      unint64_t v40 = +[NSThread callStackSymbols];
      *(_DWORD *)buf = 138412290;
      CGRect v45 = v40;
      _os_log_impl((void *)&_mh_execute_header, &v20->super.super.super.super.super.super, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    goto LABEL_50;
  }
  BOOL v41 = 0;
LABEL_52:

  return v41;
}

@end