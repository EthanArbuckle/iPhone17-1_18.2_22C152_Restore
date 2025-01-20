@interface UIViewController
+ (id)bc_presentingViewController;
- (BCCardStackViewController)cardStackViewController;
- (BCEngagementProvider)bc_effectiveEngagementProvider;
- (BCEngagementProvider)bc_engagementProvider;
- (BCEngagementProviderSource)bc_engagementProviderSource;
- (BOOL)_bc_analyticsComputeVisibility;
- (BOOL)_bc_analyticsIsObscuredByPresentedViewController;
- (BOOL)_bc_analyticsNotifiedWillDisappear;
- (BOOL)_overridesShouldAutorotate;
- (BOOL)_overridesSupportedInterfaceOrientations;
- (BOOL)bc_alwaysUseCoverTransitionForCardPresenting;
- (BOOL)bc_analyticsVisibility;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented;
- (BOOL)bc_analyticsVisibilityIsObscuredWhenSubtreePresented;
- (BOOL)bc_analyticsVisibilityOfChild:(id)a3;
- (BOOL)bc_analyticsVisibilityOfSelf;
- (BOOL)bc_canCloseAsset;
- (BOOL)bc_isModelTransitioning;
- (BOOL)bc_isPresentedInCardViewController;
- (BOOL)bc_isPresentingCardStack;
- (BOOL)bc_navBarVisible;
- (BOOL)im_firstVisibleChildValidateWithItem:(id)a3;
- (BOOL)im_hasValidWidthAndHeightTraitCollection;
- (BOOL)im_isAncestorOfChildViewController:(id)a3;
- (BOOL)im_isCompactHeight;
- (BOOL)im_isCompactWidth;
- (BOOL)im_tabBarVisible;
- (BOOL)isSupportedInterfaceOrientation:(int64_t)a3;
- (BOOL)usesBrightonAutorotationAPI;
- (CGRect)im_frameEnvironmentBounds;
- (CGRect)im_frameEnvironmentFrame;
- (UIEdgeInsets)im_frameEnvironmentSafeAreaInsets;
- (_TtC13BookAnalytics9BATracker)ba_analyticsTracker;
- (_TtC13BookAnalytics9BATracker)ba_effectiveAnalyticsTracker;
- (_TtC13BookAnalytics9BATracker)ba_overrideParentAnalyticsTracker;
- (id)_ba_effectiveViewControllerForAnalyticsTrackingIgnoringViewController:(id)a3;
- (id)_ba_effectiveViewControllerForEngagementProviderIgnoringViewController:(id)a3;
- (id)_bc_analyticsAncestorPresentedViewController;
- (id)ba_effectiveViewControllerForAnalyticsTracking;
- (id)ba_effectiveViewControllerForEngagementProvider;
- (id)ba_setupNewAnalyticsTrackerWithName:(id)a3;
- (id)bc_ancestorFullScreenPresentingViewController;
- (id)bc_ancestorOverrideCardPresentingViewController;
- (id)bc_ancestorViewControllerOfClass:(Class)a3 allowPresentingParent:(BOOL)a4;
- (id)bc_childCardPresentingViewController;
- (id)bc_childPresentedViewController;
- (id)bc_childViewControllerForNavBarVisibility;
- (id)bc_contextualPresentedViewController;
- (id)bc_contextualPresentingViewController;
- (id)bc_deepestPresentedViewController;
- (id)bc_deepestVisibleChildViewControllerIncludePresented:(BOOL)a3;
- (id)bc_descendentPresentedViewController;
- (id)bc_effectiveAncestorOverrideCardPresentingViewController;
- (id)bc_effectiveCardPresentingViewController;
- (id)bc_effectiveViewControllerForNavBarVisibility;
- (id)bc_firstVisibleChildViewControllerOfClass:(Class)a3 includePresented:(BOOL)a4;
- (id)bc_overrideAncestorViewControllerForNavBarVisibility;
- (id)bc_windowForViewController;
- (id)im_ancestorConfigurationConformingToProtocol:(id)a3;
- (id)im_ancestorConformingToProtocol:(id)a3;
- (id)im_ancestorFlowControllerConformingToProtocol:(id)a3;
- (id)im_ancestorValueForKey:(id)a3 conformingToProtocol:(id)a4 fromViewControllersConformingToProtocol:(id)a5;
- (id)im_ancestorViewControllerConformingToProtocol:(id)a3;
- (id)im_ancestorViewControllerConformingToProtocol:(id)a3 includePresenting:(BOOL)a4;
- (id)im_bookshelfTheme;
- (id)im_childFlowControllerConformingToProtocol:(id)a3;
- (id)im_childValueForKey:(id)a3 conformingToProtocol:(id)a4 fromViewControllersConformingToProtocol:(id)a5;
- (id)im_childViewControllerForTabBarVisibility;
- (id)im_effectiveViewControllerForTabBarVisibility;
- (id)im_firstVisibleChildConformingToProtocol:(id)a3;
- (id)im_firstVisibleChildConformingToProtocol:(id)a3 includePresented:(BOOL)a4;
- (id)im_firstVisibleChildConformingToProtocol:(id)a3 stopIfDescendentConformsToProtocol:(id)a4 includePresented:(BOOL)a5;
- (id)im_firstVisibleChildConformingToProtocol:(id)a3 stopIfDescendentConformsToProtocol:(id)a4 includePresented:(BOOL)a5 validateItem:(id)a6;
- (id)im_overrideAncestorViewControllerForTabBarVisibility;
- (id)im_recursiveDescriptionVisibleTree:(BOOL)a3;
- (id)im_theme;
- (id)im_traitCollectionAdjustedForMedusaLevels:(id)a3;
- (id)im_visibleViewControllersConfirmingToProtocol:(id)a3;
- (id)rasterizedImage;
- (id)recursiveDescription;
- (int64_t)IMDeviceOrientation;
- (int64_t)preferredInterfaceOrientationGivenOrientation:(int64_t)a3;
- (unint64_t)bc_currentLifeCycleState;
- (void)__im_enumerateChildrenConformingToProtocol:(id)a3 stop:(BOOL *)a4 block:(id)a5;
- (void)__im_enumerateVisibleChildrenConformingToProtocol:(id)a3 stop:(BOOL *)a4 block:(id)a5;
- (void)_bc_analyticsSetVisibility:(BOOL)a3;
- (void)_bc_analyticsUpdateVisibilityOfDescendants;
- (void)_bc_analyticsUpdateVisibilityOfSelf;
- (void)_bc_analyticsUpdateVisibilityOfSelfWithParent:(id)a3 parentVisibility:(BOOL)a4;
- (void)_setNotifiedAnalyticsVisibilityWillDisappear:(BOOL)a3;
- (void)ba_setAnalyticsTracker:(id)a3;
- (void)ba_setOverrideParentAnalyticsTracker:(id)a3;
- (void)bc_analyticsSubtreeForceEndSession;
- (void)bc_analyticsVisibilityDidAppear;
- (void)bc_analyticsVisibilityDidDisappear;
- (void)bc_analyticsVisibilitySubtreeDidDisappear;
- (void)bc_analyticsVisibilitySubtreeWillDisappear;
- (void)bc_analyticsVisibilityUpdateSubtree;
- (void)bc_analyticsVisibilityWillDisappear;
- (void)bc_closeAssetWithCardStackViewController:(id)a3 completion:(id)a4;
- (void)bc_closeToAssetWithCardStackViewController:(id)a3 completion:(id)a4;
- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)bc_dismissIfSafeAnimated:(BOOL)a3;
- (void)bc_notifyLightLevelDidChange:(int64_t)a3;
- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)bc_presentViewController:(id)a3 animated:(BOOL)a4 tintColor:(id)a5 completion:(id)a6;
- (void)bc_setCurrentLifeCycleState:(unint64_t)a3;
- (void)bc_setNavBarVisible:(BOOL)a3;
- (void)cleanupAfterTransition:(id)a3;
- (void)im_dismissAnimated:(BOOL)a3;
- (void)im_dismissAnimated:(BOOL)a3 immediate:(BOOL)a4;
- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4;
- (void)im_enumerateChildrenConformingToProtocol:(id)a3 block:(id)a4;
- (void)im_enumerateVisibleChildrenConformingToProtocol:(id)a3 block:(id)a4;
- (void)im_finishOngoingModalTransitionAnimations:(id)a3;
- (void)im_notifyThemeDidChange;
- (void)im_setTabBarVisible:(BOOL)a3;
- (void)prepareForTransition:(id)a3;
- (void)refreshStatusBarAppearance;
- (void)setBc_engagementProvider:(id)a3;
- (void)setBc_engagementProviderSource:(id)a3;
- (void)setBc_isPresentingCardStack:(BOOL)a3;
@end

@implementation UIViewController

- (unint64_t)bc_currentLifeCycleState
{
  v2 = objc_getAssociatedObject(self, off_340370);
  id v3 = [v2 unsignedIntegerValue];

  return (unint64_t)v3;
}

- (void)bc_setCurrentLifeCycleState:(unint64_t)a3
{
  NSStringFromSelector("bc_currentLifeCycleState");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(UIViewController *)self willChangeValueForKey:v7];
  v5 = off_340370;
  v6 = +[NSNumber numberWithUnsignedInteger:a3];
  objc_setAssociatedObject(self, v5, v6, (char *)&def_7D91C + 1);

  [(UIViewController *)self didChangeValueForKey:v7];
}

- (BOOL)bc_analyticsVisibility
{
  id v3 = objc_getAssociatedObject(self, off_340378);
  if (!v3)
  {
    id v3 = &__kCFBooleanFalse;
    objc_setAssociatedObject(self, off_340378, &__kCFBooleanFalse, (char *)&def_7D91C + 1);
  }
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)bc_analyticsVisibilityUpdateSubtree
{
  [(UIViewController *)self _bc_analyticsUpdateVisibilityOfSelf];

  [(UIViewController *)self _bc_analyticsUpdateVisibilityOfDescendants];
}

- (void)bc_analyticsVisibilitySubtreeWillDisappear
{
  id v3 = [(UIViewController *)self bc_childPresentedViewController];
  [v3 bc_analyticsVisibilitySubtreeWillDisappear];
  if ([(UIViewController *)self bc_analyticsVisibility]
    && ![(UIViewController *)self _bc_analyticsNotifiedWillDisappear])
  {
    [(UIViewController *)self _setNotifiedAnalyticsVisibilityWillDisappear:1];
    [(UIViewController *)self bc_analyticsVisibilityWillDisappear];
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v4 = [(UIViewController *)self childViewControllers];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [v9 bc_analyticsVisibilitySubtreeWillDisappear];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)bc_analyticsVisibilitySubtreeDidDisappear
{
  [(UIViewController *)self _bc_analyticsSetVisibility:0];
  id v3 = [(UIViewController *)self bc_childPresentedViewController];
  [v3 bc_analyticsVisibilitySubtreeDidDisappear];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v4 = [(UIViewController *)self childViewControllers];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) bc_analyticsVisibilitySubtreeDidDisappear];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)bc_analyticsSubtreeForceEndSession
{
  [(UIViewController *)self bc_analyticsForceEndSession];
  id v3 = [(UIViewController *)self bc_childPresentedViewController];
  [v3 bc_analyticsSubtreeForceEndSession];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  unsigned __int8 v4 = [(UIViewController *)self childViewControllers];
  id v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * (void)v8) bc_analyticsSubtreeForceEndSession];
        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenSubtreePresented
{
  if ([(UIViewController *)self bc_analyticsVisibilityIsObscuredWhenPresented])
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    unsigned __int8 v4 = [(UIViewController *)self childViewControllers];
    id v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v3)
    {
      uint64_t v5 = *(void *)v9;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v9 != v5) {
            objc_enumerationMutation(v4);
          }
          if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "bc_analyticsVisibilityIsObscuredWhenSubtreePresented"))
          {
            LOBYTE(v3) = 1;
            goto LABEL_13;
          }
        }
        id v3 = [v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  return (char)v3;
}

- (BOOL)bc_analyticsVisibilityOfSelf
{
  return 1;
}

- (BOOL)bc_analyticsVisibilityOfChild:(id)a3
{
  return 1;
}

- (BOOL)bc_analyticsVisibilityIsObscuredWhenPresented
{
  return 0;
}

- (void)bc_analyticsVisibilityDidAppear
{
}

- (void)bc_analyticsVisibilityWillDisappear
{
}

- (void)bc_analyticsVisibilityDidDisappear
{
}

- (void)_bc_analyticsSetVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIViewController *)self bc_analyticsVisibility] != a3)
  {
    uint64_t v5 = off_340378;
    id v6 = +[NSNumber numberWithBool:v3];
    objc_setAssociatedObject(self, v5, v6, (char *)&def_7D91C + 1);

    if (v3)
    {
      [(UIViewController *)self _setNotifiedAnalyticsVisibilityWillDisappear:0];
      [(UIViewController *)self bc_analyticsVisibilityDidAppear];
    }
    else
    {
      [(UIViewController *)self bc_analyticsVisibilityDidDisappear];
    }
  }
}

- (BOOL)_bc_analyticsNotifiedWillDisappear
{
  BOOL v3 = objc_getAssociatedObject(self, off_340380);
  if (!v3)
  {
    BOOL v3 = &__kCFBooleanFalse;
    objc_setAssociatedObject(self, off_340380, &__kCFBooleanFalse, (char *)&def_7D91C + 1);
  }
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (void)_setNotifiedAnalyticsVisibilityWillDisappear:(BOOL)a3
{
  unsigned __int8 v4 = off_340380;
  id v5 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, v4, v5, (char *)&def_7D91C + 1);
}

- (BOOL)_bc_analyticsComputeVisibility
{
  BOOL v3 = [(UIViewController *)self viewIfLoaded];
  unsigned __int8 v4 = [v3 window];
  if (!v4
    || ([v3 isHidden] & 1) != 0
    || ![(UIViewController *)self bc_analyticsVisibilityOfSelf])
  {
    goto LABEL_9;
  }
  unsigned __int8 v5 = [(UIViewController *)self _bc_analyticsIsObscuredByPresentedViewController];

  if ((v5 & 1) == 0)
  {
    uint64_t v7 = [(UIViewController *)self parentViewController];
    unsigned __int8 v4 = v7;
    if (!v7)
    {
      long long v9 = [(UIViewController *)self presentingViewController];
      long long v10 = [v9 presentedViewController];

      if (v10 == self)
      {
        unsigned __int8 v6 = 1;
      }
      else
      {
        long long v11 = [v3 window];
        long long v12 = [v11 rootViewController];

        unsigned __int8 v6 = v12 == self;
      }
      goto LABEL_10;
    }
    if (objc_msgSend(v7, "bc_analyticsVisibilityOfChild:", self))
    {
      unsigned __int8 v6 = [v4 _bc_analyticsComputeVisibility];
LABEL_10:

      goto LABEL_11;
    }
LABEL_9:
    unsigned __int8 v6 = 0;
    goto LABEL_10;
  }
  unsigned __int8 v6 = 0;
LABEL_11:

  return v6;
}

- (BOOL)_bc_analyticsIsObscuredByPresentedViewController
{
  BOOL v3 = [(UIViewController *)self presentedViewController];
  if (!v3)
  {
    BOOL v3 = [(UIViewController *)self _bc_analyticsAncestorPresentedViewController];
  }
  unsigned __int8 v4 = [v3 bc_analyticsVisibilityIsObscuredWhenPresented];

  return v4;
}

- (id)_bc_analyticsAncestorPresentedViewController
{
  BOOL v3 = [(UIViewController *)self parentViewController];
  unsigned __int8 v4 = [v3 presentedViewController];
  if (!v4)
  {
    unsigned __int8 v5 = [(UIViewController *)self presentingViewController];
    unsigned __int8 v4 = [v5 _bc_analyticsAncestorPresentedViewController];
  }

  return v4;
}

- (void)_bc_analyticsUpdateVisibilityOfSelf
{
  BOOL v3 = [(UIViewController *)self _bc_analyticsComputeVisibility];

  [(UIViewController *)self _bc_analyticsSetVisibility:v3];
}

- (void)_bc_analyticsUpdateVisibilityOfSelfWithParent:(id)a3 parentVisibility:(BOOL)a4
{
  if (a4 && objc_msgSend(a3, "bc_analyticsVisibilityOfChild:", self))
  {
    unsigned __int8 v5 = [(UIViewController *)self viewIfLoaded];
    unsigned __int8 v6 = [v5 window];
    if (v6
      && ([v5 isHidden] & 1) == 0
      && [(UIViewController *)self bc_analyticsVisibilityOfSelf])
    {
      uint64_t v7 = [(UIViewController *)self _bc_analyticsIsObscuredByPresentedViewController] ^ 1;
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  [(UIViewController *)self _bc_analyticsSetVisibility:v7];
}

- (void)_bc_analyticsUpdateVisibilityOfDescendants
{
  BOOL v3 = [(UIViewController *)self bc_childPresentedViewController];
  [v3 bc_analyticsVisibilityUpdateSubtree];
  BOOL v4 = [(UIViewController *)self bc_analyticsVisibility];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  unsigned __int8 v5 = [(UIViewController *)self childViewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        long long v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        [v10 _bc_analyticsUpdateVisibilityOfSelfWithParent:self parentVisibility:v4];
        [v10 _bc_analyticsUpdateVisibilityOfDescendants];
      }
      id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)prepareForTransition:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned __int8 v5 = [(UIViewController *)self childViewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) prepareForTransition:v4];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)cleanupAfterTransition:(id)a3
{
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unsigned __int8 v5 = [(UIViewController *)self childViewControllers];
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      long long v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * (void)v9) cleanupAfterTransition:v4];
        long long v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int64_t)IMDeviceOrientation
{
  UIInterfaceOrientation v2 = [(UIViewController *)self interfaceOrientation];
  BOOL v3 = +[UIDevice currentDevice];
  id v4 = (char *)[v3 orientation];

  if ((unint64_t)(v4 - 1) >= 4) {
    return v2;
  }
  else {
    return (int64_t)v4;
  }
}

- (BOOL)bc_isPresentedInCardViewController
{
  UIInterfaceOrientation v2 = [(UIViewController *)self parentViewController];
  unsigned __int8 v3 = [v2 bc_isPresentedInCardViewController];

  return v3;
}

- (BOOL)isSupportedInterfaceOrientation:(int64_t)a3
{
  char v3 = a3;
  UIInterfaceOrientationMask v4 = [(UIViewController *)self supportedInterfaceOrientations];
  return (v4 & (1 << v3)) != 0 || v4 == 0;
}

- (BOOL)_overridesShouldAutorotate
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  UIInterfaceOrientation v2 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v2, "shouldAutorotate");
  UIInterfaceOrientationMask v4 = (objc_class *)objc_opt_class();
  return InstanceMethod != class_getInstanceMethod(v4, "shouldAutorotate");
}

- (BOOL)_overridesSupportedInterfaceOrientations
{
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  UIInterfaceOrientation v2 = (objc_class *)objc_opt_class();
  Method InstanceMethod = class_getInstanceMethod(v2, "supportedInterfaceOrientations");
  UIInterfaceOrientationMask v4 = (objc_class *)objc_opt_class();
  return InstanceMethod != class_getInstanceMethod(v4, "supportedInterfaceOrientations");
}

- (BOOL)usesBrightonAutorotationAPI
{
  if ([(UIViewController *)self _overridesShouldAutorotate]) {
    return 1;
  }

  return [(UIViewController *)self _overridesSupportedInterfaceOrientations];
}

- (int64_t)preferredInterfaceOrientationGivenOrientation:(int64_t)a3
{
  if (!-[UIViewController isSupportedInterfaceOrientation:](self, "isSupportedInterfaceOrientation:"))
  {
    a3 = [(UIViewController *)self IMDeviceOrientation];
    if (![(UIViewController *)self isSupportedInterfaceOrientation:a3])
    {
      a3 = 1;
      if (![(UIViewController *)self isSupportedInterfaceOrientation:1])
      {
        a3 = 3;
        if (![(UIViewController *)self isSupportedInterfaceOrientation:3])
        {
          a3 = 4;
          if (![(UIViewController *)self isSupportedInterfaceOrientation:4])
          {
            if ([(UIViewController *)self isSupportedInterfaceOrientation:2]) {
              return 2;
            }
            else {
              return 1;
            }
          }
        }
      }
    }
  }
  return a3;
}

- (void)refreshStatusBarAppearance
{
  id v4 = [(UIViewController *)self view];
  UIInterfaceOrientation v2 = [v4 window];
  char v3 = [v2 rootViewController];
  [v3 setNeedsStatusBarAppearanceUpdate];
}

- (id)im_recursiveDescriptionVisibleTree:(BOOL)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_676C8;
  v5[3] = &unk_2C6018;
  BOOL v6 = a3;
  char v3 = [(UIViewController *)self im_recursiveDescriptionChildrenBlock:v5];

  return v3;
}

- (id)recursiveDescription
{
  return [(UIViewController *)self im_recursiveDescriptionVisibleTree:0];
}

- (id)rasterizedImage
{
  char v3 = [(UIViewController *)self view];
  [v3 bounds];
  v12.width = v4;
  v12.height = v5;
  UIGraphicsBeginImageContextWithOptions(v12, 1, 0.0);

  CGContextRef CurrentContext = UIGraphicsGetCurrentContext();
  id v7 = [(UIViewController *)self view];
  uint64_t v8 = [v7 layer];
  [v8 renderInContext:CurrentContext];

  long long v9 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();

  return v9;
}

- (BOOL)im_hasValidWidthAndHeightTraitCollection
{
  UIInterfaceOrientation v2 = [(UIViewController *)self traitCollection];
  char v3 = (char *)[v2 horizontalSizeClass];
  CGFloat v4 = (char *)[v2 horizontalSizeClass];
  CGFloat v5 = (char *)[v2 verticalSizeClass];
  BOOL v6 = (char *)[v2 verticalSizeClass];
  BOOL v7 = (v3 == (unsigned char *)&def_7D91C + 1 || v4 == (unsigned char *)&def_7D91C + 2)
    && (v5 == (unsigned char *)&def_7D91C + 1 || v6 == (unsigned char *)&def_7D91C + 2);

  return v7;
}

- (BOOL)im_isCompactWidth
{
  UIInterfaceOrientation v2 = [(UIViewController *)self traitCollection];
  char v3 = (char *)[v2 horizontalSizeClass];
  CGFloat v4 = (char *)[v2 horizontalSizeClass];
  if (v3 != (unsigned char *)&def_7D91C + 1 && v4 != (unsigned char *)&def_7D91C + 2)
  {
    CGFloat v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 175, (uint64_t)"-[UIViewController(IMAdditions) im_isCompactWidth]", (uint64_t)"NO", @"<%@: %p> has no trait information.", v7, v8, v9, (uint64_t)v6);
  }
  return v3 == (unsigned char *)&def_7D91C + 1;
}

- (BOOL)im_isCompactHeight
{
  UIInterfaceOrientation v2 = [(UIViewController *)self traitCollection];
  char v3 = (char *)[v2 verticalSizeClass];
  CGFloat v4 = (char *)[v2 verticalSizeClass];
  if (v3 != (unsigned char *)&def_7D91C + 1 && v4 != (unsigned char *)&def_7D91C + 2)
  {
    CGFloat v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 195, (uint64_t)"-[UIViewController(IMAdditions) im_isCompactHeight]", (uint64_t)"NO", @"<%@: %p> has no trait information.", v7, v8, v9, (uint64_t)v6);
  }
  return v3 == (unsigned char *)&def_7D91C + 1;
}

- (void)im_dismissAnimated:(BOOL)a3 immediate:(BOOL)a4
{
  BOOL v4 = a3;
  BOOL v6 = [(UIViewController *)self parentViewController];

  if (v6)
  {
    id v9 = [(UIViewController *)self parentViewController];
    [v9 im_dismissChildViewController:self animated:v4];
  }
  else
  {
    uint64_t v7 = [(UIViewController *)self presentingViewController];
    uint64_t v8 = [v7 presentedViewController];

    if (v8 == self)
    {
      [(UIViewController *)self dismissViewControllerAnimated:v4 completion:0];
    }
  }
}

- (void)im_dismissAnimated:(BOOL)a3
{
}

- (void)im_dismissChildViewController:(id)a3 animated:(BOOL)a4
{
}

- (id)bc_contextualPresentingViewController
{
  char v3 = [(UIViewController *)self parentViewController];
  if (v3
    || ([(UIViewController *)self presentingViewController],
        (char v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    [v3 bc_contextualPresentingViewController];
    BOOL v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v4 = self;
  }

  return v4;
}

- (id)bc_contextualPresentedViewController
{
  char v3 = [(UIViewController *)self presentedViewController];
  BOOL v4 = [(UIViewController *)self bc_contextualPresentingViewController];
  CGFloat v5 = v4;
  if (v3)
  {
    if (objc_msgSend(v4, "im_isAncestorOfChildViewController:", v3)) {
      BOOL v6 = v3;
    }
    else {
      BOOL v6 = 0;
    }
  }
  else
  {
    BOOL v6 = 0;
  }
  id v7 = v6;

  return v7;
}

- (id)bc_descendentPresentedViewController
{
  char v3 = [(UIViewController *)self presentedViewController];
  BOOL v4 = v3;
  if (v3)
  {
    if ([(UIViewController *)self im_isAncestorOfChildViewController:v3]) {
      char v3 = v4;
    }
    else {
      char v3 = 0;
    }
  }
  id v5 = v3;

  return v5;
}

- (id)bc_childPresentedViewController
{
  char v3 = [(UIViewController *)self presentedViewController];
  BOOL v4 = [v3 presentingViewController];
  if (v4 == self) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (BOOL)im_isAncestorOfChildViewController:(id)a3
{
  BOOL v4 = (UIViewController *)a3;
  id v5 = v4;
  BOOL v6 = 0;
  if (v4 != self && v4)
  {
    while (1)
    {
      id v7 = [(UIViewController *)v5 parentViewController];
      uint64_t v8 = v7;
      if (v7)
      {
        id v9 = v7;
      }
      else
      {
        id v9 = [(UIViewController *)v5 presentingViewController];
      }
      long long v10 = v9;

      if (v10 == self) {
        break;
      }

      id v5 = v10;
      if (!v10)
      {
        BOOL v6 = 0;
        goto LABEL_10;
      }
    }

    BOOL v6 = 1;
  }
LABEL_10:

  return v6;
}

- (id)im_childValueForKey:(id)a3 conformingToProtocol:(id)a4 fromViewControllersConformingToProtocol:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UIViewController *)self conformsToProtocol:v10])
  {
    [(UIViewController *)self valueForKey:v8];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v30;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v29 + 1) + 8 * v15);
        if ([v16 conformsToProtocol:v9]) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v29 objects:v34 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v17 = v16;

      if (v17) {
        goto LABEL_22;
      }
    }
    else
    {
LABEL_10:
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = [(UIViewController *)self bc_childViewControllersForProtocolConformance];
  id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v19)
  {
    id v20 = v19;
    uint64_t v21 = *(void *)v26;
LABEL_14:
    uint64_t v22 = 0;
    while (1)
    {
      if (*(void *)v26 != v21) {
        objc_enumerationMutation(v18);
      }
      uint64_t v23 = [*(id *)(*((void *)&v25 + 1) + 8 * v22) im_childValueForKey:v8 conformingToProtocol:v9 fromViewControllersConformingToProtocol:v10];
      if (v23) {
        break;
      }
      if (v20 == (id)++v22)
      {
        id v20 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v20) {
          goto LABEL_14;
        }
        goto LABEL_20;
      }
    }
  }
  else
  {
LABEL_20:

    v18 = [(UIViewController *)self bc_childPresentedViewController];
    uint64_t v23 = [v18 im_ancestorValueForKey:v8 conformingToProtocol:v9 fromViewControllersConformingToProtocol:v10];
  }
  id v17 = (id)v23;

LABEL_22:

  return v17;
}

- (id)im_ancestorValueForKey:(id)a3 conformingToProtocol:(id)a4 fromViewControllersConformingToProtocol:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(UIViewController *)self conformsToProtocol:v10])
  {
    [(UIViewController *)self valueForKey:v8];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    id v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v22;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        v16 = *(void **)(*((void *)&v21 + 1) + 8 * v15);
        if (objc_msgSend(v16, "conformsToProtocol:", v9, (void)v21)) {
          break;
        }
        if (v13 == (id)++v15)
        {
          id v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v13) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      id v17 = v16;

      if (v17) {
        goto LABEL_14;
      }
    }
    else
    {
LABEL_10:
    }
  }
  v18 = [(UIViewController *)self parentViewController];
  [v18 im_ancestorValueForKey:v8 conformingToProtocol:v9 fromViewControllersConformingToProtocol:v10];
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    id v19 = [(UIViewController *)self presentingViewController];
    [v19 im_ancestorValueForKey:v8 conformingToProtocol:v9 fromViewControllersConformingToProtocol:v10];
    id v17 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_14:

  return v17;
}

- (id)im_ancestorViewControllerConformingToProtocol:(id)a3
{
  return [(UIViewController *)self im_ancestorViewControllerConformingToProtocol:a3 includePresenting:1];
}

- (id)im_ancestorViewControllerConformingToProtocol:(id)a3 includePresenting:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([(UIViewController *)self conformsToProtocol:v6])
  {
    id v7 = self;
    goto LABEL_10;
  }
  id v8 = [(UIViewController *)self parentViewController];
  if (v8)
  {
    id v9 = v8;
    id v10 = v6;
    uint64_t v11 = v4;
LABEL_5:
    [v8 im_ancestorViewControllerConformingToProtocol:v10 includePresenting:v11];
    id v7 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  if (v4)
  {
    id v8 = [(UIViewController *)self presentingViewController];
    if (v8)
    {
      id v9 = v8;
      id v10 = v6;
      uint64_t v11 = 1;
      goto LABEL_5;
    }
  }
  id v7 = 0;
LABEL_10:

  return v7;
}

- (id)im_ancestorConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = self;
  id v6 = [(UIViewController *)v5 parentViewController];
  id v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(UIViewController *)v5 presentingViewController];
  }
  id v9 = v8;

  id v10 = 0;
  if (v5)
  {
    do
    {
      if ([(UIViewController *)v5 conformsToProtocol:v4])
      {
        long long v23 = v5;
        id v20 = v23;
        goto LABEL_21;
      }
      uint64_t v11 = [(UIViewController *)v5 viewIfLoaded];
      id v12 = [v11 window];

      if (v12)
      {
        id v13 = [(UIViewController *)v5 viewIfLoaded];
        uint64_t v14 = [v13 window];

        id v10 = (void *)v14;
      }
      uint64_t v15 = v9;

      v16 = [(UIViewController *)v15 parentViewController];
      id v17 = v16;
      if (v16)
      {
        id v18 = v16;
      }
      else
      {
        id v18 = [(UIViewController *)v15 presentingViewController];
      }
      id v9 = v18;

      id v5 = v15;
    }
    while (v15);
    if (v10)
    {
      uint64_t v19 = [v10 im_ancestorConformingToProtocol:v4];
      if (v19)
      {
        id v20 = (id)v19;
        goto LABEL_20;
      }
    }
  }
  long long v21 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  long long v22 = [v21 delegate];

  if ([v22 conformsToProtocol:v4]) {
    id v20 = v22;
  }
  else {
    id v20 = 0;
  }

LABEL_20:
  long long v23 = 0;
LABEL_21:
  id v24 = v20;

  return v24;
}

- (id)im_ancestorFlowControllerConformingToProtocol:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self im_ancestorValueForKey:@"flowControllers" conformingToProtocol:v4 fromViewControllersConformingToProtocol:&OBJC_PROTOCOL___IMFlowControllerHosting];
  if (!v5)
  {
    id v6 = [(UIViewController *)self viewIfLoaded];
    id v7 = [v6 window];

    id v8 = [v7 windowScene];
    id v9 = [v8 delegate];
    objc_opt_class();
    v38 = BUDynamicCast();
    if ([v38 conformsToProtocol:&OBJC_PROTOCOL___IMFlowControllerHosting])
    {
      v34 = v8;
      v36 = v9;
      [v38 valueForKey:@"flowControllers"];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      id v11 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v48;
LABEL_5:
        uint64_t v14 = v7;
        uint64_t v15 = 0;
        while (1)
        {
          if (*(void *)v48 != v13) {
            objc_enumerationMutation(v10);
          }
          v16 = *(void **)(*((void *)&v47 + 1) + 8 * v15);
          if ([v16 conformsToProtocol:v4]) {
            break;
          }
          if (v12 == (id)++v15)
          {
            id v12 = [v10 countByEnumeratingWithState:&v47 objects:v53 count:16];
            id v7 = v14;
            if (v12) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v5 = v16;

        id v7 = v14;
        id v8 = v34;
        id v9 = v36;
        if (v5) {
          goto LABEL_28;
        }
      }
      else
      {
LABEL_11:

        id v8 = v34;
        id v9 = v36;
      }
    }
    objc_opt_class();
    id v17 = BUDynamicCast();
    id v18 = [v17 controller];
    objc_opt_class();
    uint64_t v19 = BUDynamicCast();
    if ([v19 conformsToProtocol:&OBJC_PROTOCOL___IMFlowControllerHosting])
    {
      [v19 valueForKey:@"flowControllers"];
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      id v5 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v5)
      {
        v35 = v7;
        v37 = v9;
        uint64_t v21 = *(void *)v44;
        while (2)
        {
          for (i = 0; i != v5; i = (char *)i + 1)
          {
            if (*(void *)v44 != v21) {
              objc_enumerationMutation(v20);
            }
            long long v23 = *(void **)(*((void *)&v43 + 1) + 8 * i);
            if ([v23 conformsToProtocol:v4])
            {
              id v5 = v23;
              goto LABEL_25;
            }
          }
          id v5 = [v20 countByEnumeratingWithState:&v43 objects:v52 count:16];
          if (v5) {
            continue;
          }
          break;
        }
LABEL_25:
        id v7 = v35;
        id v9 = v37;
      }
    }
    else
    {
      id v5 = 0;
    }

LABEL_28:
    if (!v5)
    {
      id v24 = +[UIApplication jsa_sharedApplicationIfNotExtension];
      long long v25 = [v24 delegate];

      objc_opt_class();
      long long v26 = BUDynamicCast();
      if ([v26 conformsToProtocol:&OBJC_PROTOCOL___IMFlowControllerHosting])
      {
        [v26 valueForKey:@"flowControllers"];
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v27 = (id)objc_claimAutoreleasedReturnValue();
        id v28 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v40;
          while (2)
          {
            for (j = 0; j != v29; j = (char *)j + 1)
            {
              if (*(void *)v40 != v30) {
                objc_enumerationMutation(v27);
              }
              long long v32 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
              if ([v32 conformsToProtocol:v4])
              {
                id v5 = v32;
                goto LABEL_41;
              }
            }
            id v29 = [v27 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v29) {
              continue;
            }
            break;
          }
        }
        id v5 = 0;
LABEL_41:
      }
      else
      {
        id v5 = 0;
      }
    }
  }

  return v5;
}

- (BOOL)im_firstVisibleChildValidateWithItem:(id)a3
{
  return 1;
}

- (id)im_childFlowControllerConformingToProtocol:(id)a3
{
  return [(UIViewController *)self im_childValueForKey:@"flowControllers" conformingToProtocol:a3 fromViewControllersConformingToProtocol:&OBJC_PROTOCOL___IMFlowControllerHosting];
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3 includePresented:(BOOL)a4
{
  return [(UIViewController *)self im_firstVisibleChildConformingToProtocol:a3 stopIfDescendentConformsToProtocol:0 includePresented:a4 validateItem:0];
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3 stopIfDescendentConformsToProtocol:(id)a4 includePresented:(BOOL)a5
{
  return [(UIViewController *)self im_firstVisibleChildConformingToProtocol:a3 stopIfDescendentConformsToProtocol:0 includePresented:a5 validateItem:0];
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3 stopIfDescendentConformsToProtocol:(id)a4 includePresented:(BOOL)a5 validateItem:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (v11 && ([(UIViewController *)self conformsToProtocol:v11] & 1) != 0)
  {
    uint64_t v13 = 0;
  }
  else
  {
    if (!v7) {
      goto LABEL_27;
    }
    uint64_t v14 = [(UIViewController *)self bc_childPresentedViewController];

    if (!v14
      || ([(UIViewController *)self bc_childPresentedViewController],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v15, "im_firstVisibleChildConformingToProtocol:stopIfDescendentConformsToProtocol:includePresented:validateItem:", v10, v11, 1, v12), uint64_t v13 = (UIViewController *)objc_claimAutoreleasedReturnValue(), v15, !v13))
    {
LABEL_27:
      if (![(UIViewController *)self conformsToProtocol:v10]
        || v12
        && ![(UIViewController *)self im_firstVisibleChildValidateWithItem:v12]|| (uint64_t v13 = self) == 0)
      {
        long long v25 = 0u;
        long long v26 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        v16 = [(UIViewController *)self im_visibleChildViewControllers];
        id v17 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v17)
        {
          id v18 = v17;
          uint64_t v19 = *(void *)v24;
          while (2)
          {
            for (i = 0; i != v18; i = (char *)i + 1)
            {
              if (*(void *)v24 != v19) {
                objc_enumerationMutation(v16);
              }
              uint64_t v21 = [*(id *)(*((void *)&v23 + 1) + 8 * i) im_firstVisibleChildConformingToProtocol:v10 stopIfDescendentConformsToProtocol:v11 includePresented:v7 validateItem:v12];
              if (v21)
              {
                uint64_t v13 = (UIViewController *)v21;
                goto LABEL_21;
              }
            }
            id v18 = [v16 countByEnumeratingWithState:&v23 objects:v27 count:16];
            if (v18) {
              continue;
            }
            break;
          }
        }
        uint64_t v13 = 0;
LABEL_21:
      }
    }
  }

  return v13;
}

- (id)bc_firstVisibleChildViewControllerOfClass:(Class)a3 includePresented:(BOOL)a4
{
  BOOL v4 = a4;
  if (!a4) {
    goto LABEL_22;
  }
  BOOL v7 = [(UIViewController *)self bc_childPresentedViewController];

  if (!v7
    || ([(UIViewController *)self bc_childPresentedViewController],
        id v8 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v8, "bc_firstVisibleChildViewControllerOfClass:includePresented:", a3, 1),
        id v9 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
        v8,
        !v9))
  {
LABEL_22:
    if ((objc_opt_isKindOfClass() & 1) == 0 || (id v9 = self) == 0)
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v10 = [(UIViewController *)self im_visibleChildViewControllers];
      id v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v11)
      {
        id v12 = v11;
        uint64_t v13 = *(void *)v18;
        while (2)
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(void *)v18 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) bc_firstVisibleChildViewControllerOfClass:a3 includePresented:v4];
            if (v15)
            {
              id v9 = (UIViewController *)v15;
              goto LABEL_16;
            }
          }
          id v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }
      id v9 = 0;
LABEL_16:
    }
  }

  return v9;
}

- (id)bc_deepestVisibleChildViewControllerIncludePresented:(BOOL)a3
{
  BOOL v3 = a3;
  if (!a3) {
    goto LABEL_4;
  }
  id v5 = [(UIViewController *)self bc_childPresentedViewController];

  if (!v5
    || ([(UIViewController *)self bc_childPresentedViewController],
        id v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v6, "bc_deepestVisibleChildViewControllerIncludePresented:", 1),
        BOOL v7 = (UIViewController *)objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
LABEL_4:
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v8 = [(UIViewController *)self im_visibleChildViewControllers];
    id v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      while (2)
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) bc_deepestVisibleChildViewControllerIncludePresented:v3];
          if (v13)
          {
            BOOL v7 = (UIViewController *)v13;

            goto LABEL_14;
          }
        }
        id v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    BOOL v7 = self;
  }
LABEL_14:

  return v7;
}

+ (id)bc_presentingViewController
{
  UIInterfaceOrientation v2 = +[UIApplication jsa_sharedApplicationIfNotExtension];
  BOOL v3 = [v2 connectedScenes];
  BOOL v4 = [v3 allObjects];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v26;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v26 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (![v10 activationState])
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v11 = [v10 windows];
            long long v21 = 0u;
            long long v22 = 0u;
            long long v23 = 0u;
            long long v24 = 0u;
            id v12 = v11;
            id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v13)
            {
              id v14 = v13;
              uint64_t v15 = *(void *)v22;
              while (2)
              {
                for (j = 0; j != v14; j = (char *)j + 1)
                {
                  if (*(void *)v22 != v15) {
                    objc_enumerationMutation(v12);
                  }
                  long long v17 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
                  if ([v17 isKeyWindow])
                  {
                    long long v19 = [v17 rootViewController];
                    long long v18 = [v19 bc_deepestPresentedViewController];

                    goto LABEL_22;
                  }
                }
                id v14 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
                if (v14) {
                  continue;
                }
                break;
              }
            }
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v25 objects:v30 count:16];
      long long v18 = 0;
    }
    while (v7);
  }
  else
  {
    long long v18 = 0;
  }
LABEL_22:

  return v18;
}

- (id)bc_deepestPresentedViewController
{
  BOOL v3 = [(UIViewController *)self presentedViewController];
  BOOL v4 = self;
  id v5 = v4;
  if (v3)
  {
    do
    {
      id v6 = v3;

      BOOL v3 = [(UIViewController *)v6 presentedViewController];

      id v5 = v6;
    }
    while (v3);
  }
  else
  {
    id v6 = v4;
  }

  return v6;
}

- (id)im_firstVisibleChildConformingToProtocol:(id)a3
{
  return [(UIViewController *)self im_firstVisibleChildConformingToProtocol:a3 includePresented:1];
}

- (id)im_visibleViewControllersConfirmingToProtocol:(id)a3
{
  id v4 = a3;
  char v9 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_690D0;
  v7[3] = &unk_2C6040;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v8 = v5;
  [(UIViewController *)self __im_enumerateVisibleChildrenConformingToProtocol:v4 stop:&v9 block:v7];

  return v5;
}

- (void)im_enumerateVisibleChildrenConformingToProtocol:(id)a3 block:(id)a4
{
  if (a4)
  {
    char v4 = 0;
    [(UIViewController *)self __im_enumerateVisibleChildrenConformingToProtocol:a3 stop:&v4 block:a4];
  }
}

- (void)im_enumerateChildrenConformingToProtocol:(id)a3 block:(id)a4
{
  if (a4)
  {
    char v4 = 0;
    [(UIViewController *)self __im_enumerateChildrenConformingToProtocol:a3 stop:&v4 block:a4];
  }
}

- (void)__im_enumerateVisibleChildrenConformingToProtocol:(id)a3 stop:(BOOL *)a4 block:(id)a5
{
  id v8 = a3;
  id v12 = (void (**)(id, UIViewController *, BOOL *))a5;
  if (a4)
  {
    if (!v8)
    {
LABEL_4:
      v12[2](v12, self, a4);
      goto LABEL_5;
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 652, (uint64_t)"-[UIViewController(IMAdditions) __im_enumerateVisibleChildrenConformingToProtocol:stop:block:]", (uint64_t)"stop", 0, v9, v10, v11, v19);
    if (!v8) {
      goto LABEL_4;
    }
  }
  if ([(UIViewController *)self conformsToProtocol:v8]) {
    goto LABEL_4;
  }
LABEL_5:
  if (!*a4)
  {
    id v13 = [(UIViewController *)self bc_childPresentedViewController];
    [v13 __im_enumerateVisibleChildrenConformingToProtocol:v8 stop:a4 block:v12];

    if (!*a4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v14 = [(UIViewController *)self im_visibleChildViewControllers];
      id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v20;
LABEL_9:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v18) __im_enumerateVisibleChildrenConformingToProtocol:v8 stop:a4 block:v12];
          if (*a4) {
            break;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v16) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
    }
  }
}

- (id)bc_ancestorFullScreenPresentingViewController
{
  UIInterfaceOrientation v2 = [(UIViewController *)self presentingViewController];
  BOOL v3 = (char *)[v2 modalPresentationStyle];
  char v4 = [v2 presentingViewController];

  if (v4 && (unint64_t)(v3 - 3) > 0xFFFFFFFFFFFFFFFDLL)
  {
    [v2 bc_ancestorFullScreenPresentingViewController];
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v5 = v2;
  }
  id v6 = v5;

  return v6;
}

- (void)__im_enumerateChildrenConformingToProtocol:(id)a3 stop:(BOOL *)a4 block:(id)a5
{
  id v8 = a3;
  id v12 = (void (**)(id, UIViewController *, BOOL *))a5;
  if (a4)
  {
    if (!v8)
    {
LABEL_4:
      v12[2](v12, self, a4);
      goto LABEL_5;
    }
  }
  else
  {
    BCReportAssertionFailureWithMessage((uint64_t)"/Library/Caches/com.apple.xbs/Sources/Alder/frameworks/BookCore/BookCore/ViewControllers/UIViewController+BCAdditions.m", 695, (uint64_t)"-[UIViewController(IMAdditions) __im_enumerateChildrenConformingToProtocol:stop:block:]", (uint64_t)"stop", 0, v9, v10, v11, v19);
    if (!v8) {
      goto LABEL_4;
    }
  }
  if ([(UIViewController *)self conformsToProtocol:v8]) {
    goto LABEL_4;
  }
LABEL_5:
  if (!*a4)
  {
    id v13 = [(UIViewController *)self bc_childPresentedViewController];
    [v13 __im_enumerateChildrenConformingToProtocol:v8 stop:a4 block:v12];

    if (!*a4)
    {
      long long v21 = 0u;
      long long v22 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      id v14 = [(UIViewController *)self bc_childViewControllersForProtocolConformance];
      id v15 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v15)
      {
        id v16 = v15;
        uint64_t v17 = *(void *)v20;
LABEL_9:
        uint64_t v18 = 0;
        while (1)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v19 + 1) + 8 * v18) __im_enumerateChildrenConformingToProtocol:v8 stop:a4 block:v12];
          if (*a4) {
            break;
          }
          if (v16 == (id)++v18)
          {
            id v16 = [v14 countByEnumeratingWithState:&v19 objects:v23 count:16];
            if (v16) {
              goto LABEL_9;
            }
            break;
          }
        }
      }
    }
  }
}

- (void)im_finishOngoingModalTransitionAnimations:(id)a3
{
  char v4 = (void (**)(void))a3;
  if (v4)
  {
    id v5 = [(UIViewController *)self presentedViewController];
    if ([v5 isBeingDismissed])
    {
    }
    else
    {
      id v6 = [(UIViewController *)self presentedViewController];
      unsigned int v7 = [v6 isBeingPresented];

      if (!v7)
      {
        v4[2](v4);
        goto LABEL_7;
      }
    }
    id v8 = [(UIViewController *)self presentedViewController];
    uint64_t v9 = [v8 transitionCoordinator];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_69684;
    v10[3] = &unk_2C6088;
    uint64_t v11 = v4;
    [v9 animateAlongsideTransition:&stru_2C6060 completion:v10];
  }
LABEL_7:
}

- (BOOL)bc_isModelTransitioning
{
  if ([(UIViewController *)self isBeingDismissed]
    || [(UIViewController *)self isBeingPresented])
  {
    return 1;
  }
  char v4 = [(UIViewController *)self presentationController];
  if (objc_opt_respondsToSelector() & 1) != 0 && ([v4 _transitioningTo])
  {
    unsigned __int8 v3 = 1;
  }
  else if (objc_opt_respondsToSelector())
  {
    unsigned __int8 v3 = [v4 _transitioningFrom];
  }
  else
  {
    unsigned __int8 v3 = 0;
  }

  return v3;
}

- (id)bc_windowForViewController
{
  unsigned __int8 v3 = [(UIViewController *)self viewIfLoaded];
  char v4 = [v3 window];

  if (!v4)
  {
    id v5 = self;
    uint64_t v6 = [(UIViewController *)v5 parentViewController];
    uint64_t v7 = [(UIViewController *)v5 presentingViewController];
    BOOL v8 = v6 != 0;
    if (v6 | v7)
    {
      uint64_t v9 = (void *)v7;
      do
      {
        if (v8) {
          uint64_t v10 = (void *)v6;
        }
        else {
          uint64_t v10 = v9;
        }
        uint64_t v11 = v10;

        uint64_t v12 = [(UIViewController *)v11 parentViewController];

        uint64_t v13 = [(UIViewController *)v11 presentingViewController];

        BOOL v8 = v12 != 0;
        uint64_t v9 = (void *)v13;
        uint64_t v6 = v12;
        id v5 = v11;
      }
      while (v12 | v13);
    }
    else
    {
      uint64_t v11 = v5;
    }
    id v14 = [(UIViewController *)v11 viewIfLoaded];
    char v4 = [v14 window];

    if (v4)
    {
      id v15 = v11;
    }
    else
    {
      uint64_t v16 = [(UIViewController *)v11 presentedViewController];
      if (v16)
      {
        uint64_t v17 = (void *)v16;
        do
        {
          id v15 = v17;

          uint64_t v17 = [(UIViewController *)v15 presentedViewController];

          uint64_t v11 = v15;
        }
        while (v17);
      }
      else
      {
        id v15 = v11;
      }
      uint64_t v18 = [(UIViewController *)v15 viewIfLoaded];
      char v4 = [v18 window];

      if (!v4)
      {
        long long v19 = BCSceneLog();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v21[0] = 0;
          _os_log_impl(&def_7D91C, v19, OS_LOG_TYPE_INFO, "No window in view hierarchy, falling back to use UIApplication keyWindow", (uint8_t *)v21, 2u);
        }

        char v4 = +[UIWindow _applicationKeyWindow];
      }
    }
  }

  return v4;
}

- (void)bc_presentViewController:(id)a3 animated:(BOOL)a4 tintColor:(id)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [(UIViewController *)self bc_windowForViewController];
  id v14 = [v13 tintColor];
  [v13 setTintColor:v11];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_69A54;
  v18[3] = &unk_2C3A40;
  id v19 = v13;
  id v20 = v14;
  id v21 = v10;
  id v15 = v10;
  id v16 = v14;
  id v17 = v13;
  [(UIViewController *)self presentViewController:v12 animated:v7 completion:v18];
}

- (id)im_theme
{
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ([(UIViewController *)self theme], (unsigned __int8 v3 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    char v4 = [(UIViewController *)self parentViewController];
    id v5 = v4;
    if (v4) {
      [v4 im_theme];
    }
    else {
    unsigned __int8 v3 = +[IMTheme themeWithIdentifier:kIMThemeIdentifierDefaultPageTheme[0]];
    }
  }

  return v3;
}

- (id)im_bookshelfTheme
{
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_6:
    char v4 = [(UIViewController *)self parentViewController];
    id v5 = v4;
    if (v4) {
      [v4 im_bookshelfTheme];
    }
    else {
    unsigned __int8 v3 = +[IMTheme themeWithIdentifier:kIMThemeIdentifierBookshelfTheme[0]];
    }

    goto LABEL_10;
  }
  unsigned __int8 v3 = [(UIViewController *)self theme];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_6;
  }
  if (!v3) {
    goto LABEL_6;
  }
LABEL_10:

  return v3;
}

- (void)im_notifyThemeDidChange
{
  [(UIViewController *)self im_themeDidChange];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  unsigned __int8 v3 = [(UIViewController *)self childViewControllers];
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      BOOL v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) im_notifyThemeDidChange];
        BOOL v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (id)im_traitCollectionAdjustedForMedusaLevels:(id)a3
{
  id v4 = [a3 traitCollectionByModifyingTraits:&stru_2C6FA8];
  if (isPad())
  {
    id v5 = [(UIViewController *)self bc_windowForViewController];
    uint64_t v6 = v5;
    if (v5)
    {
      [v5 bounds];
      CGFloat v8 = v7;
      CGFloat v10 = v9;
      CGFloat v12 = v11;
      CGFloat v14 = v13;
      id v15 = +[UIScreen mainScreen];
      [v15 bounds];
      v25.origin.x = v16;
      v25.origin.y = v17;
      v25.size.width = v18;
      v25.size.height = v19;
      v24.origin.x = v8;
      v24.origin.y = v10;
      v24.size.width = v12;
      v24.size.height = v14;
      BOOL v20 = CGRectEqualToRect(v24, v25);

      if (!v20)
      {
        uint64_t v21 = [v4 traitCollectionByModifyingTraits:&stru_2C6FC8];

        id v4 = (void *)v21;
      }
    }
  }

  return v4;
}

- (void)bc_notifyLightLevelDidChange:(int64_t)a3
{
  id v5 = BUProtocolCast();
  uint64_t v6 = v5;
  if (v5) {
    [v5 lightLevelDidChange:a3];
  }
  double v7 = [(UIViewController *)self presentedViewController];

  if (v7)
  {
    CGFloat v8 = [(UIViewController *)self presentedViewController];
    [v8 bc_notifyLightLevelDidChange:a3];
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v9 = [(UIViewController *)self childViewControllers];
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      double v13 = 0;
      do
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * (void)v13) bc_notifyLightLevelDidChange:a3];
        double v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (void)setBc_engagementProviderSource:(id)a3
{
}

- (BCEngagementProviderSource)bc_engagementProviderSource
{
  return (BCEngagementProviderSource *)objc_getAssociatedObject(self, off_341898);
}

- (void)setBc_engagementProvider:(id)a3
{
}

- (BCEngagementProvider)bc_engagementProvider
{
  unsigned __int8 v3 = objc_getAssociatedObject(self, off_3418A0);
  if (!v3)
  {
    unsigned __int8 v3 = [(UIViewController *)self bc_engagementProviderSource];

    if (v3)
    {
      id v4 = [(UIViewController *)self bc_engagementProviderSource];
      unsigned __int8 v3 = [v4 bc_engagementProvider];
    }
  }

  return (BCEngagementProvider *)v3;
}

- (BCEngagementProvider)bc_effectiveEngagementProvider
{
  UIInterfaceOrientation v2 = [(UIViewController *)self ba_effectiveViewControllerForEngagementProvider];
  unsigned __int8 v3 = [v2 bc_engagementProvider];

  return (BCEngagementProvider *)v3;
}

- (id)ba_effectiveViewControllerForEngagementProvider
{
  unsigned __int8 v3 = [(UIViewController *)self bc_engagementProvider];

  if (v3)
  {
    id v4 = self;
    goto LABEL_15;
  }
  id v5 = [(UIViewController *)self parentViewController];

  if (v5)
  {
    uint64_t v6 = [(UIViewController *)self parentViewController];
    [v6 _ba_effectiveViewControllerForEngagementProviderIgnoringViewController:self];
    id v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v7 = [(UIViewController *)self presentingViewController];

    if (!v7)
    {
      id v4 = 0;
      goto LABEL_15;
    }
    CGFloat v8 = [(UIViewController *)self presentingViewController];
    double v9 = [v8 bc_deepestVisibleChildViewControllerIncludePresented:0];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      id v11 = [(UIViewController *)self presentingViewController];
    }
    uint64_t v6 = v11;

    objc_opt_class();
    uint64_t v12 = [v6 presentedViewController];
    BUDynamicCast();
    double v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (v13 == self) {
      goto LABEL_12;
    }
    long long v14 = [(UIViewController *)v13 topCardSetViewController];
    long long v15 = [v14 currentCardViewController];
    long long v16 = [v15 topContentViewController];

    [v16 _ba_effectiveViewControllerForEngagementProviderIgnoringViewController:self];
    id v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
LABEL_12:
      [v6 _ba_effectiveViewControllerForEngagementProviderIgnoringViewController:self];
      id v4 = (UIViewController *)objc_claimAutoreleasedReturnValue();
    }
  }
LABEL_15:

  return v4;
}

- (id)_ba_effectiveViewControllerForEngagementProviderIgnoringViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [(UIViewController *)self viewControllers];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v6 = [(UIViewController *)v5 reverseObjectEnumerator];
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v12 = [v11 bc_engagementProvider];

          if (v11 != v4 && v12 != 0)
          {
            id v23 = v11;
            goto LABEL_30;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = self;
    long long v14 = (char *)[(UIViewController *)v5 lastNavigationType];
    if (!v14)
    {
      id v23 = 0;
      goto LABEL_31;
    }
    long long v15 = v14;
    if (v14 == (unsigned char *)&def_7D91C + 1)
    {
      uint64_t v6 = [(UIViewController *)v5 cardStackViewController];
      long long v16 = [v6 childViewControllers];
      long long v17 = (char *)[v16 indexOfObject:v5];

      if (!v17)
      {
LABEL_22:
        id v23 = 0;
LABEL_30:

LABEL_31:
        if (v23) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      objc_opt_class();
      CGFloat v18 = [v6 childViewControllers];
      CGFloat v19 = [v18 objectAtIndexedSubscript:v17 - 1];
      BUDynamicCast();
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v21 = [v20 currentCardViewController];
      long long v22 = [v21 topContentViewController];

      [v22 bc_engagementProvider];
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23) {
        id v23 = v22;
      }
    }
    else
    {
      CGRect v24 = (char *)[(UIViewController *)v5 focusedIndex];
      if (v15 == (unsigned char *)&def_7D91C + 2) {
        CGRect v25 = v24 + 1;
      }
      else {
        CGRect v25 = v24 - 1;
      }
      uint64_t v6 = [(UIViewController *)v5 cardViewControllerAtIndex:v25];
      id v20 = [v6 topContentViewController];
      [v20 bc_engagementProvider];
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        id v20 = v20;
        id v23 = v20;
      }
    }

    goto LABEL_30;
  }
LABEL_32:
  id v23 = [(UIViewController *)self ba_effectiveViewControllerForEngagementProvider];
LABEL_33:

  return v23;
}

- (CGRect)im_frameEnvironmentBounds
{
  if ([(UIViewController *)self isViewLoaded]) {
    [(UIViewController *)self view];
  }
  else {
  unsigned __int8 v3 = +[UIScreen mainScreen];
  }
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)im_frameEnvironmentFrame
{
  if ([(UIViewController *)self isViewLoaded])
  {
    unsigned __int8 v3 = [(UIViewController *)self view];
    [v3 frame];
  }
  else
  {
    unsigned __int8 v3 = +[UIScreen mainScreen];
    [v3 bounds];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (UIEdgeInsets)im_frameEnvironmentSafeAreaInsets
{
  if ([(UIViewController *)self isViewLoaded])
  {
    unsigned __int8 v3 = [(UIViewController *)self view];
    [v3 safeAreaInsets];
    CGFloat top = v4;
    CGFloat left = v6;
    CGFloat bottom = v8;
    CGFloat right = v10;
  }
  else
  {
    CGFloat top = UIEdgeInsetsZero.top;
    CGFloat left = UIEdgeInsetsZero.left;
    CGFloat bottom = UIEdgeInsetsZero.bottom;
    CGFloat right = UIEdgeInsetsZero.right;
  }
  double v12 = top;
  double v13 = left;
  double v14 = bottom;
  double v15 = right;
  result.CGFloat right = v15;
  result.CGFloat bottom = v14;
  result.CGFloat left = v13;
  result.CGFloat top = v12;
  return result;
}

- (void)ba_setOverrideParentAnalyticsTracker:(id)a3
{
}

- (_TtC13BookAnalytics9BATracker)ba_overrideParentAnalyticsTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_getAssociatedObject(self, off_341FA0);
}

- (void)ba_setAnalyticsTracker:(id)a3
{
}

- (_TtC13BookAnalytics9BATracker)ba_analyticsTracker
{
  return (_TtC13BookAnalytics9BATracker *)objc_getAssociatedObject(self, off_341FA8);
}

- (_TtC13BookAnalytics9BATracker)ba_effectiveAnalyticsTracker
{
  UIInterfaceOrientation v2 = [(UIViewController *)self ba_effectiveViewControllerForAnalyticsTracking];
  unsigned __int8 v3 = [v2 ba_analyticsTracker];

  return (_TtC13BookAnalytics9BATracker *)v3;
}

- (id)ba_effectiveViewControllerForAnalyticsTracking
{
  uint64_t v13 = 0;
  double v14 = &v13;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_131E70;
  long long v17 = sub_131E80;
  id v18 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_131E88;
  v10[3] = &unk_2C3AD0;
  double v12 = &v13;
  void v10[4] = self;
  UIInterfaceOrientation v2 = dispatch_semaphore_create(0);
  double v11 = v2;
  unsigned __int8 v3 = objc_retainBlock(v10);
  if (v3)
  {
    if (+[NSThread isMainThread])
    {
      ((void (*)(void *))v3[2])(v3);
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_132088;
      v8[3] = &unk_2C4280;
      double v9 = v3;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);
    }
  }

  dispatch_time_t v4 = dispatch_time(0, 300000000);
  if (dispatch_semaphore_wait(v2, v4))
  {
    double v5 = BALog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1EE200(v5);
    }
  }
  id v6 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (id)_ba_effectiveViewControllerForAnalyticsTrackingIgnoringViewController:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = [(UIViewController *)self viewControllers];
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v6 = [(UIViewController *)v5 reverseObjectEnumerator];
    id v7 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v28;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v28 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(id *)(*((void *)&v27 + 1) + 8 * i);
          double v12 = [v11 ba_analyticsTracker];

          if (v11 != v4 && v12 != 0)
          {
            id v23 = v11;
            goto LABEL_30;
          }
        }
        id v8 = [v6 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v8);
    }
    goto LABEL_22;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v5 = self;
    double v14 = (char *)[(UIViewController *)v5 lastNavigationType];
    if (!v14)
    {
      id v23 = 0;
      goto LABEL_31;
    }
    uint64_t v15 = v14;
    if (v14 == (unsigned char *)&def_7D91C + 1)
    {
      id v6 = [(UIViewController *)v5 cardStackViewController];
      long long v16 = [v6 childViewControllers];
      long long v17 = (char *)[v16 indexOfObject:v5];

      if (!v17)
      {
LABEL_22:
        id v23 = 0;
LABEL_30:

LABEL_31:
        if (v23) {
          goto LABEL_33;
        }
        goto LABEL_32;
      }
      objc_opt_class();
      id v18 = [v6 childViewControllers];
      CGFloat v19 = [v18 objectAtIndexedSubscript:v17 - 1];
      BUDynamicCast();
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      uint64_t v21 = [v20 currentCardViewController];
      long long v22 = [v21 topContentViewController];

      [v22 ba_analyticsTracker];
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23) {
        id v23 = v22;
      }
    }
    else
    {
      CGRect v24 = (char *)[(UIViewController *)v5 focusedIndex];
      if (v15 == (unsigned char *)&def_7D91C + 2) {
        CGRect v25 = v24 + 1;
      }
      else {
        CGRect v25 = v24 - 1;
      }
      id v6 = [(UIViewController *)v5 cardViewControllerAtIndex:v25];
      id v20 = [v6 topContentViewController];
      [v20 ba_analyticsTracker];
      id v23 = (id)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        id v20 = v20;
        id v23 = v20;
      }
    }

    goto LABEL_30;
  }
LABEL_32:
  id v23 = [(UIViewController *)self ba_effectiveViewControllerForAnalyticsTracking];
LABEL_33:

  return v23;
}

- (id)ba_setupNewAnalyticsTrackerWithName:(id)a3
{
  id v4 = a3;
  double v5 = [(UIViewController *)self ba_analyticsTracker];
  if (v5)
  {
    id v6 = BALog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v5 name];
      int v12 = 138412546;
      uint64_t v13 = v7;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&def_7D91C, v6, OS_LOG_TYPE_INFO, "\"ba_setupAnalyticsTrackerWithName: replacing existing tracker: %@ with: %@\"", (uint8_t *)&v12, 0x16u);
    }
  }
  id v8 = [(UIViewController *)self ba_overrideParentAnalyticsTracker];
  if (!v8)
  {
    id v8 = [(UIViewController *)self ba_effectiveAnalyticsTracker];
    if (!v8)
    {
      uint64_t v9 = BALog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1EE244(v9);
      }

      id v8 = 0;
    }
  }
  double v10 = [v8 chainWithName:v4];

  [(UIViewController *)self ba_setAnalyticsTracker:v10];

  return v10;
}

- (id)bc_childViewControllerForNavBarVisibility
{
  return 0;
}

- (id)bc_overrideAncestorViewControllerForNavBarVisibility
{
  return 0;
}

- (id)bc_effectiveViewControllerForNavBarVisibility
{
  objc_opt_class();
  unsigned __int8 v3 = BUDynamicCast();
  id v4 = v3;
  if (v3)
  {
    double v5 = v3;
  }
  else
  {
    double v5 = [(UIViewController *)self navigationController];
  }
  id v6 = v5;

  id v7 = self;
  id v8 = v7;
  uint64_t v9 = (uint64_t)v7;
  if (!v7 || (uint64_t v9 = (uint64_t)v7, v6 == v7))
  {
LABEL_10:
    int v12 = [(UIViewController *)v8 bc_childViewControllerForNavBarVisibility];
    [v12 bc_effectiveViewControllerForNavBarVisibility];
    uint64_t v13 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v13) {
      uint64_t v13 = v8;
    }
    double v10 = (void *)v9;
  }
  else
  {
    double v10 = v7;
    while (1)
    {
      uint64_t v11 = [v10 bc_overrideAncestorViewControllerForNavBarVisibility];
      if (v11) {
        break;
      }
      uint64_t v9 = [v10 parentViewController];

      if (v9)
      {
        double v10 = (void *)v9;
        if ((UIViewController *)v9 != v6) {
          continue;
        }
      }
      goto LABEL_10;
    }
    uint64_t v13 = (UIViewController *)v11;
  }

  return v13;
}

- (BOOL)bc_navBarVisible
{
  UIInterfaceOrientation v2 = objc_getAssociatedObject(self, &off_2C9A10);
  unsigned __int8 v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)bc_setNavBarVisible:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &off_2C9A10, v4, (char *)&def_7D91C + 1);
}

- (id)im_ancestorConfigurationConformingToProtocol:(id)a3
{
  return [(UIViewController *)self im_ancestorValueForKey:@"configurations" conformingToProtocol:a3 fromViewControllersConformingToProtocol:&OBJC_PROTOCOL___IMConfigurationHosting];
}

- (BCCardStackViewController)cardStackViewController
{
  uint64_t v3 = objc_opt_class();

  return (BCCardStackViewController *)[(UIViewController *)self bc_ancestorViewControllerOfClass:v3 allowPresentingParent:1];
}

- (id)bc_ancestorViewControllerOfClass:(Class)a3 allowPresentingParent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v7 = [(UIViewController *)self parentViewController];
  id v8 = (void *)v7;
  if (!v4 || v7)
  {
    if (!v4)
    {
      uint64_t v9 = [(UIViewController *)self presentingViewController];

      if (v8 == v9)
      {
        uint64_t v10 = [(UIViewController *)self presentingViewController];

        id v8 = (void *)v10;
      }
    }
  }
  else
  {
    id v8 = [(UIViewController *)self presentingViewController];
  }
  if (objc_opt_isKindOfClass())
  {
    id v11 = v8;
  }
  else
  {
    [v8 bc_ancestorViewControllerOfClass:a3 allowPresentingParent:v4];
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  int v12 = v11;

  return v12;
}

- (id)im_childViewControllerForTabBarVisibility
{
  return 0;
}

- (id)im_overrideAncestorViewControllerForTabBarVisibility
{
  return 0;
}

- (id)im_effectiveViewControllerForTabBarVisibility
{
  UIInterfaceOrientation v2 = self;
  uint64_t v3 = v2;
  if (v2)
  {
    BOOL v4 = v2;
    while (1)
    {
      uint64_t v5 = [v4 im_overrideAncestorViewControllerForTabBarVisibility];
      if (v5) {
        break;
      }
      uint64_t v6 = [v4 parentViewController];

      BOOL v4 = (void *)v6;
      if (!v6) {
        goto LABEL_5;
      }
    }
    id v8 = (UIViewController *)v5;
  }
  else
  {
LABEL_5:
    uint64_t v7 = [(UIViewController *)v3 im_childViewControllerForTabBarVisibility];
    [v7 im_effectiveViewControllerForTabBarVisibility];
    id v8 = (UIViewController *)objc_claimAutoreleasedReturnValue();

    if (!v8) {
      id v8 = v3;
    }
  }

  return v8;
}

- (BOOL)im_tabBarVisible
{
  UIInterfaceOrientation v2 = objc_getAssociatedObject(self, &off_2CA500);
  uint64_t v3 = v2;
  if (v2) {
    unsigned __int8 v4 = [v2 BOOLValue];
  }
  else {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

- (void)im_setTabBarVisible:(BOOL)a3
{
  id v4 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, &off_2CA500, v4, (char *)&def_7D91C + 1);
}

- (id)bc_effectiveCardPresentingViewController
{
  uint64_t v3 = [(UIViewController *)self bc_effectiveAncestorOverrideCardPresentingViewController];
  if (!v3) {
    uint64_t v3 = self;
  }
  uint64_t v4 = [(UIViewController *)v3 bc_childCardPresentingViewController];
  uint64_t v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = (void *)v4;
  }
  else {
    uint64_t v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (id)bc_childCardPresentingViewController
{
  return 0;
}

- (id)bc_effectiveAncestorOverrideCardPresentingViewController
{
  uint64_t v3 = [(UIViewController *)self parentViewController];

  if (v3)
  {
    uint64_t v4 = [(UIViewController *)self parentViewController];
    goto LABEL_5;
  }
  uint64_t v5 = [(UIViewController *)self presentingViewController];

  if (v5)
  {
    uint64_t v4 = [(UIViewController *)self presentingViewController];
LABEL_5:
    uint64_t v6 = v4;
    id v7 = [v4 bc_effectiveAncestorOverrideCardPresentingViewController];

    if (v7) {
      goto LABEL_7;
    }
  }
  id v7 = [(UIViewController *)self bc_ancestorOverrideCardPresentingViewController];
LABEL_7:

  return v7;
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  return 0;
}

- (BOOL)bc_alwaysUseCoverTransitionForCardPresenting
{
  return 0;
}

- (void)bc_presentCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  long long v16 = _NSConcreteStackBlock;
  uint64_t v17 = 3221225472;
  id v18 = sub_17D894;
  CGFloat v19 = &unk_2C85E0;
  id v20 = self;
  id v21 = a3;
  BOOL v23 = v6;
  id v22 = a5;
  id v8 = v22;
  id v9 = v21;
  uint64_t v10 = objc_retainBlock(&v16);
  id v11 = [(UIViewController *)self presentedViewController];
  int v12 = [v11 presentingViewController];

  if (v12 == self)
  {
    uint64_t v13 = [(UIViewController *)self presentedViewController];
    [v13 dismissViewControllerAnimated:v6 completion:v10];
  }
  else
  {
    ((void (*)(void ***))v10[2])(v10);
  }
  __int16 v14 = [(UIViewController *)self presentingViewController];
  id v15 = [v14 view];
  [v15 setAccessibilityElementsHidden:1];
}

- (void)bc_dismissCardViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  id v9 = a3;
  [(UIViewController *)self setValue:&__kCFBooleanFalse forKey:@"bc_isPresentingCardStack"];
  uint64_t v10 = [(UIViewController *)self presentingViewController];
  id v11 = [v10 view];
  [v11 setAccessibilityElementsHidden:0];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_17D9EC;
  v13[3] = &unk_2C4280;
  id v14 = v8;
  id v12 = v8;
  [v9 dismissViewControllerAnimated:v5 completion:v13];
}

- (BOOL)bc_canCloseAsset
{
  return 0;
}

- (void)bc_closeToAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  uint64_t v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    BOOL v5 = v4;
    v4[2]();
    uint64_t v4 = v5;
  }
}

- (void)bc_closeAssetWithCardStackViewController:(id)a3 completion:(id)a4
{
  uint64_t v4 = (void (**)(void))objc_retainBlock(a4);
  if (v4)
  {
    BOOL v5 = v4;
    v4[2]();
    uint64_t v4 = v5;
  }
}

- (BOOL)bc_isPresentingCardStack
{
  objc_opt_class();
  uint64_t v3 = objc_getAssociatedObject(self, off_342998);
  uint64_t v4 = BUDynamicCast();
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (void)setBc_isPresentingCardStack:(BOOL)a3
{
  uint64_t v4 = off_342998;
  id v5 = +[NSNumber numberWithBool:a3];
  objc_setAssociatedObject(self, v4, v5, (char *)&def_7D91C + 1);
}

- (void)bc_dismissIfSafeAnimated:(BOOL)a3
{
  uint64_t v4 = self;
  UIViewController.dismissIfSafe(animated:)(a3);
}

@end