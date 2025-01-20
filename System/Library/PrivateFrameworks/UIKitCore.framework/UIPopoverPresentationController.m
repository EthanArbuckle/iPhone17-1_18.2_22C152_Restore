@interface UIPopoverPresentationController
+ (BOOL)_alwaysAllowPopoverPresentations;
+ (BOOL)_forceAttemptsToAvoidKeyboard;
+ (BOOL)_showTargetRectPref;
+ (Class)_popoverViewClass;
+ (UIEdgeInsets)_defaultPopoverLayoutMarginsForPopoverControllerStyle:(int64_t)a3 andContentViewController:(id)a4;
+ (id)_platformHostManagerForController:(id)a3;
+ (void)_setAlwaysAllowPopoverPresentations:(BOOL)a3;
- (BOOL)_allowDismissalTapsToPassThrough;
- (BOOL)_allowsFocusInPresentingViewController;
- (BOOL)_allowsSourceViewInDifferentWindowThanInitialPresentationViewController;
- (BOOL)_attemptDismissalWithCompletion:(id)a3;
- (BOOL)_attemptsToAvoidKeyboard;
- (BOOL)_backgroundBlurDisabled;
- (BOOL)_centersPopoverIfSourceViewNotSet;
- (BOOL)_embedsInView;
- (BOOL)_fallbackShouldDismiss;
- (BOOL)_focusedItemFrameIntersectsSufficientlyWithPresentedView:(id)a3;
- (BOOL)_forcesPreferredAnimationControllers;
- (BOOL)_ignoreBarButtonItemSiblings;
- (BOOL)_ignoresKeyboardNotifications;
- (BOOL)_isAdaptivityEnabled;
- (BOOL)_isDismissing;
- (BOOL)_isPresenting;
- (BOOL)_isShimmingPopoverControllerPresentation;
- (BOOL)_manuallyHandlesContentViewControllerAppearanceCalls;
- (BOOL)_overrideAllowsHitTestingOnBackgroundViews;
- (BOOL)_popoverIsDismissingBecauseDismissInteractionOccurred;
- (BOOL)_presentationPotentiallyUnderlapsStatusBar;
- (BOOL)_retainsSelfWhilePresented;
- (BOOL)_shouldAutoDismissOnFocusedItemIntersection;
- (BOOL)_shouldConvertToScene;
- (BOOL)_shouldDimPresentingViewTint;
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldHideArrow;
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)_shouldOccludeDuringPresentation;
- (BOOL)_shouldPopoverContentExtendOverArrowForViewController:(id)a3 backgroundViewClass:(Class)a4;
- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop;
- (BOOL)_shouldPreserveFirstResponder;
- (BOOL)_shouldUseNewPopoverAnimations;
- (BOOL)_softAssertWhenNoSourceViewOrBarButtonItemSpecified;
- (BOOL)canOverlapSourceViewRect;
- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4;
- (BOOL)dismissesOnRotation;
- (BOOL)isPopoverVisible;
- (BOOL)isPresentingOrDismissing;
- (BOOL)popoverDimmingViewDidReceiveDismissalInteraction:(id)a3;
- (BOOL)popoverDimmingViewShouldAllowInteraction:(id)a3;
- (BOOL)shouldPresentInFullscreen;
- (BOOL)showsOrientationMarker;
- (BOOL)showsPresentationArea;
- (BOOL)showsTargetRect;
- (CGPoint)_centerPointForScale:(double)a3 frame:(CGRect)a4 anchor:(CGPoint)a5;
- (CGRect)_containingFrame;
- (CGRect)_sourceRectInContainerView;
- (CGRect)_sourceRectInCoordinateSpace:(id)a3;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGSize)_currentPopoverContentSize;
- (CGSize)_defaultPopoverSize;
- (CGSize)_defaultPopoverSizeOverride;
- (CGSize)_proposedSize;
- (CGSize)popoverContentSize;
- (Class)_defaultChromeViewClass;
- (Class)_popoverLayoutInfoForChromeClass:(Class)a3;
- (NSArray)_sourceOverlayViewConstraints;
- (NSArray)passthroughViews;
- (UIColor)backgroundColor;
- (UIDimmingView)dimmingView;
- (UIEdgeInsets)_additionalSafeAreaInsets;
- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4;
- (UIEdgeInsets)_containingFrameInsets;
- (UIEdgeInsets)popoverLayoutMargins;
- (UIPopoverArrowDirection)arrowDirection;
- (UIPopoverArrowDirection)permittedArrowDirections;
- (UIPopoverPresentationController)init;
- (UIPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UIPopoverPresentationController)retainedSelf;
- (UISheetPresentationController)adaptiveSheetPresentationController;
- (UIView)_presentingView;
- (UIView)_sourceOverlayView;
- (UIView)_targetRectView;
- (_UIPopoverLayoutInfo)preferredLayoutInfo;
- (double)_arrowOffset;
- (double)_cornerRadius;
- (double)_dimmingViewTopEdgeInset;
- (double)_presentationAnimationDuration;
- (id)_adaptiveFormSheetPresentationController;
- (id)_backgroundView;
- (id)_completionBlockForDismissalWhenNotifyingDelegate:(BOOL)a3;
- (id)_createHostManagerPopoverWithConfiguration:(id)a3;
- (id)_createVisualStyleForProvider:(id)a3;
- (id)_dimmingView;
- (id)_exceptionStringForNilSourceViewOrBarButtonItem;
- (id)_hostManagerPopoverCloseConfiguration;
- (id)_hostManagerPopoverCreationConfiguration;
- (id)_hostManagerPopoverUpdateConfiguration;
- (id)_initialPresentationViewControllerForViewController:(id)a3;
- (id)_layoutInfoForCurrentKeyboardState;
- (id)_layoutInfoForCurrentKeyboardStateAndHostingWindow:(id)a3;
- (id)_layoutInfoFromLayoutInfo:(id)a3 forCurrentKeyboardStateAndHostingWindow:(id)a4;
- (id)_lowerWindowDismissalGestureViews;
- (id)_metrics;
- (id)_popoverHostingWindow;
- (id)_preferredAnimationControllerForDismissal;
- (id)_preferredAnimationControllerForPresentation;
- (id)_presentationView;
- (id)arrowBackgroundColor;
- (id)popoverBackgroundViewClass;
- (id)popoverView;
- (id)presentedView;
- (id)shadowView;
- (int)_presentationState;
- (int64_t)_backgroundBlurEffectStyle;
- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3;
- (int64_t)_popoverBackgroundStyle;
- (int64_t)_popoverControllerStyle;
- (int64_t)_preferredHorizontalAlignment;
- (int64_t)presentationStyle;
- (unint64_t)_presentationEdge;
- (unint64_t)_slideTransitionCount;
- (unint64_t)popoverArrowDirection;
- (void)_autoDismissIfFocusedItemSufficientlyIntersectsPresentedView;
- (void)_cancelDelayedFocusAutoDismiss;
- (void)_clearCachedPopoverContentSize;
- (void)_closeScene;
- (void)_convertToSceneFromPresentingViewController:(id)a3;
- (void)_createHostManagerIfNeeded;
- (void)_handlePan:(id)a3;
- (void)_incrementSlideTransitionCount:(BOOL)a3;
- (void)_invalidateLayoutInfo;
- (void)_keyboardDidHide:(id)a3;
- (void)_keyboardWillShow:(id)a3;
- (void)_moveAwayFromTheKeyboard:(id)a3 showing:(BOOL)a4;
- (void)_observeFocusDidUpdateNotification:(id)a3;
- (void)_performHierarchyCheckOnViewController:(id)a3;
- (void)_postludeForDismissal;
- (void)_prepareForWindowDeallocRecursively:(BOOL)a3;
- (void)_presentedViewControllerUserInterfaceStyleChanged;
- (void)_presentingViewControllerWindowSceneDidUpdateEffectiveGeometry:(id)a3;
- (void)_realSourceViewDidChangeFromView:(id)a3 toView:(id)a4;
- (void)_realSourceViewGeometryDidChange;
- (void)_resetSlideTransitionCount;
- (void)_scrollViewDidEndDragging:(id)a3;
- (void)_scrollViewWillBeginDragging:(id)a3;
- (void)_sendDelegateWillRepositionToRect;
- (void)_sendFallbackDidDismiss;
- (void)_sendFallbackWillDismiss;
- (void)_setAdaptivityEnabled:(BOOL)a3;
- (void)_setAllowDismissalTapsToPassThrough:(BOOL)a3;
- (void)_setAllowsFocusInPresentingViewController:(BOOL)a3;
- (void)_setAllowsSourceViewInDifferentWindowThanInitialPresentationViewController:(BOOL)a3;
- (void)_setArrowOffset:(double)a3;
- (void)_setBackgroundBlurDisabled:(BOOL)a3;
- (void)_setBackgroundBlurEffectStyle:(int64_t)a3;
- (void)_setCentersPopoverIfSourceViewNotSet:(BOOL)a3;
- (void)_setContentViewController:(id)a3 animated:(BOOL)a4;
- (void)_setContentViewController:(id)a3 backgroundStyle:(int64_t)a4 animated:(BOOL)a5;
- (void)_setCornerRadius:(double)a3;
- (void)_setDimmingViewTopEdgeInset:(double)a3;
- (void)_setGesturesEnabled:(BOOL)a3;
- (void)_setIgnoreBarButtonItemSiblings:(BOOL)a3;
- (void)_setIgnoresKeyboardNotifications:(BOOL)a3;
- (void)_setLowerWindowDismissalGestureViews:(id)a3;
- (void)_setOverrideAllowsHitTestingOnBackgroundViews:(BOOL)a3;
- (void)_setPopoverBackgroundStyle:(int64_t)a3;
- (void)_setPopoverFrame:(CGRect)a3 animated:(BOOL)a4 coordinator:(id)a5;
- (void)_setPopoverView:(id)a3;
- (void)_setPreferredHorizontalAlignment:(int64_t)a3;
- (void)_setPresentationEdge:(unint64_t)a3;
- (void)_setPresentationState:(int)a3;
- (void)_setPresentingView:(id)a3;
- (void)_setRetainsSelfWhilePresented:(BOOL)a3;
- (void)_setShouldDimPresentingViewTint:(BOOL)a3;
- (void)_setShouldDisableInteractionDuringTransitions:(BOOL)a3;
- (void)_setShouldHideArrow:(BOOL)a3;
- (void)_setShouldPreserveFirstResponder:(BOOL)a3;
- (void)_setSoftAssertWhenNoSourceViewOrBarButtonItemSpecified:(BOOL)a3;
- (void)_setSourceOverlayView:(id)a3;
- (void)_setSourceOverlayViewConstraints:(id)a3;
- (void)_setTargetRectView:(id)a3;
- (void)_startWatchingForKeyboardNotificationsIfNecessary;
- (void)_startWatchingForScrollViewNotifications;
- (void)_stopWatchingForKeyboardNotifications;
- (void)_stopWatchingForNotifications;
- (void)_stopWatchingForScrollViewNotifications;
- (void)_transitionFromDidEnd;
- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5;
- (void)_transitionFromWillBegin;
- (void)_transitionToDidEnd;
- (void)_transitionToWillBegin;
- (void)_updateShouldObserveFocusUpdateNotification:(BOOL)a3;
- (void)_updateSourceOverlayViewConstraints;
- (void)containerViewWillLayoutSubviews;
- (void)dealloc;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setArrowBackgroundColor:(id)a3;
- (void)setBackgroundColor:(UIColor *)backgroundColor;
- (void)setCanOverlapSourceViewRect:(BOOL)canOverlapSourceViewRect;
- (void)setDimmingView:(id)a3;
- (void)setDismissesOnRotation:(BOOL)a3;
- (void)setPassthroughViews:(NSArray *)passthroughViews;
- (void)setPermittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections;
- (void)setPopoverArrowDirection:(unint64_t)a3;
- (void)setPopoverBackgroundViewClass:(id)popoverBackgroundViewClass;
- (void)setPopoverContentSize:(CGSize)a3;
- (void)setPopoverContentSize:(CGSize)a3 animated:(BOOL)a4;
- (void)setPopoverFrame:(CGRect)a3 animated:(BOOL)a4;
- (void)setPopoverLayoutMargins:(UIEdgeInsets)popoverLayoutMargins;
- (void)setPreferredLayoutInfo:(id)a3;
- (void)setRetainedSelf:(id)a3;
- (void)setShowsOrientationMarker:(BOOL)a3;
- (void)setShowsPresentationArea:(BOOL)a3;
- (void)setShowsTargetRect:(BOOL)a3;
- (void)set_defaultPopoverSizeOverride:(CGSize)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIPopoverPresentationController

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (BOOL)_shouldUseNewPopoverAnimations
{
  if ([(UIPopoverPresentationController *)self popoverBackgroundViewClass])
  {
    id v3 = [(UIPopoverPresentationController *)self popoverBackgroundViewClass];
    BOOL v4 = v3 == +[_UIPopoverStandardChromeView standardChromeViewClass];
  }
  else
  {
    BOOL v4 = 1;
  }
  if ([(UIPopoverPresentationController *)self _shouldHideArrow]
    || ![(UIPopoverPresentationController *)self arrowDirection])
  {
    BOOL v4 = 0;
  }
  else if ([(UIPopoverPresentationController *)self _centersPopoverIfSourceViewNotSet])
  {
    v5 = [(UIPresentationController *)self _realSourceView];

    if (!v5) {
      BOOL v4 = 0;
    }
  }
  char v6 = _UIInternalPreferenceUsesDefault(&_UIInternalPreference_UseNewPopoverAnimations, @"UseNewPopoverAnimations", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool);
  if (byte_1E8FD5064) {
    char v7 = 1;
  }
  else {
    char v7 = v6;
  }
  return v7 & v4;
}

- (id)popoverBackgroundViewClass
{
  return self->_popoverBackgroundViewClass;
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  v17.receiver = self;
  v17.super_class = (Class)UIPopoverPresentationController;
  [(UIPresentationController *)&v17 _baseContentInsetsWithLeftMargin:a3 rightMargin:a4];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  if (![(_UIPopoverView *)self->_popoverView contentExtendsOverArrow])
  {
    double v12 = 0.0;
    double v10 = 0.0;
    double v8 = 0.0;
    double v6 = 0.0;
  }
  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.right = v16;
  result.bottom = v15;
  result.left = v14;
  result.top = v13;
  return result;
}

- (id)presentedView
{
  return self->_popoverView;
}

- (UIEdgeInsets)_additionalSafeAreaInsets
{
  [(_UIPopoverView *)self->_popoverView safeAreaInsetsForContentView];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIPopoverArrowDirection)arrowDirection
{
  popoverView = self->_popoverView;
  if (popoverView)
  {
    return [(_UIPopoverView *)popoverView arrowDirection];
  }
  else if (self->_popoverIdentifier && self->_hostManager && (objc_opt_respondsToSelector() & 1) != 0)
  {
    hostManager = self->_hostManager;
    popoverIdentifier = self->_popoverIdentifier;
    return [(_UIPopoverHostManager *)hostManager arrowDirectionForPopoverWithIdentifier:popoverIdentifier];
  }
  else
  {
    return -1;
  }
}

- (BOOL)_shouldHideArrow
{
  return self->__shouldHideArrow;
}

- (BOOL)_centersPopoverIfSourceViewNotSet
{
  return self->__centersPopoverIfSourceViewNotSet;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIPresentationController *)self presentedViewController];
  if ((id)v5 == v4)
  {
  }
  else
  {
    double v6 = (void *)v5;
    id v7 = [(UIPresentationController *)self _childPresentationController];

    if (v7 != v4) {
      goto LABEL_37;
    }
  }
  [v4 preferredContentSize];
  double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  BOOL v11 = v10 == *MEMORY[0x1E4F1DB30] && v8 == v9;
  if (!v11
    || (self->_popoverContentSize.width == *MEMORY[0x1E4F1DB30]
      ? (BOOL v12 = self->_popoverContentSize.height == v9)
      : (BOOL v12 = 0),
        v12))
  {
    [(UIPopoverPresentationController *)self _defaultPopoverSize];
    double v14 = v13;
    double v16 = v15;
    [v4 preferredContentSize];
    double v19 = v17;
    double v20 = v18;
    if (v17 <= 0.0 || v18 <= 0.0)
    {
      if (v17 <= 0.0) {
        double v19 = v14;
      }
      if (v18 <= 0.0) {
        double v20 = v16;
      }
    }
    if (v19 != self->_popoverContentSize.width || v20 != self->_popoverContentSize.height)
    {
      v22 = objc_alloc_init(_UIViewControllerNullAnimationTransitionCoordinator);
      v23 = [(UIPresentationController *)self _childPresentationController];
      v24 = v23;
      if (v23)
      {
        id v25 = v23;
      }
      else
      {
        id v25 = [(UIPresentationController *)self presentedViewController];
      }
      v26 = v25;

      objc_msgSend(v26, "viewWillTransitionToSize:withTransitionCoordinator:", v22, v19, v20);
      self->_popoverContentSize.width = v19;
      self->_popoverContentSize.height = v20;
      preferredLayoutInfo = self->_preferredLayoutInfo;
      v40[0] = MEMORY[0x1E4F143A8];
      v40[1] = 3221225472;
      v40[2] = __89__UIPopoverPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke;
      v40[3] = &unk_1E52DD178;
      v40[4] = self;
      *(double *)&v40[5] = v19;
      *(double *)&v40[6] = v20;
      [(_UIPopoverLayoutInfo *)preferredLayoutInfo updateProperties:v40];
      v28 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];
      v29 = v28;
      if (self->_hostManager)
      {
        if (self->_popoverIdentifier)
        {
          v30 = [(UIPopoverPresentationController *)self _hostManagerPopoverUpdateConfiguration];
          [(UIPopoverPresentationController *)self _sourceRectInContainerView];
          objc_msgSend(v30, "setSourceRectInParentUIWindow:");
          [(_UIPopoverHostManager *)self->_hostManager updatePopoverWithIdentifier:self->_popoverIdentifier configuration:v30];
        }
        [(_UIViewControllerNullAnimationTransitionCoordinator *)v22 _runAlongsideAnimations];
        [(_UIViewControllerNullAnimationTransitionCoordinator *)v22 _runAlongsideCompletionsAfterCommit];
      }
      else
      {
        [v28 frame];
        double v32 = v31;
        double v34 = v33;
        double v36 = v35;
        double v38 = v37;
        if ([(UIPresentationController *)self presented]) {
          BOOL v39 = +[UIView areAnimationsEnabled];
        }
        else {
          BOOL v39 = 0;
        }
        -[UIPopoverPresentationController _setPopoverFrame:animated:coordinator:](self, "_setPopoverFrame:animated:coordinator:", v39, v22, v32, v34, v36, v38);
      }
    }
  }
LABEL_37:
}

- (void)_setPopoverFrame:(CGRect)a3 animated:(BOOL)a4 coordinator:(id)a5
{
  BOOL v5 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v11 = a5;
  BOOL v12 = self->_popoverView;
  double v13 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];
  [v13 offset];
  uint64_t v15 = v14;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke;
  aBlock[3] = &unk_1E52E7998;
  CGFloat v33 = x;
  CGFloat v34 = y;
  CGFloat v35 = width;
  CGFloat v36 = height;
  aBlock[4] = self;
  double v16 = v12;
  double v32 = v16;
  uint64_t v37 = v15;
  double v17 = _Block_copy(aBlock);
  double v18 = v17;
  if (v5)
  {
    double v19 = [(UIPresentationController *)self presentedViewController];
    double v20 = [v19 _transitionCoordinator];

    if (v20)
    {
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_2;
      v29[3] = &unk_1E52E79C0;
      v29[4] = self;
      id v30 = v18;
      [v20 animateAlongsideTransition:0 completion:v29];
      [v11 _runAlongsideAnimations];
      [v11 _runAlongsideCompletionsAfterCommit];
      v21 = v30;
    }
    else
    {
      [(UIPopoverPresentationController *)self _presentationAnimationDuration];
      double v23 = v22;
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_3;
      v26[3] = &unk_1E52DB330;
      id v28 = v18;
      id v27 = v11;
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_4;
      v24[3] = &unk_1E52DC3A0;
      id v25 = v27;
      +[UIView animateWithDuration:132 delay:v26 options:v24 animations:v23 completion:0.0];

      v21 = v28;
    }
  }
  else
  {
    (*((void (**)(void *))v17 + 2))(v17);
    [v11 _runAlongsideAnimations];
    [v11 _runAlongsideCompletionsAfterCommit];
  }
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke(double *a1)
{
  double v3 = a1[6];
  double v2 = a1[7];
  double v5 = a1[8];
  double v4 = a1[9];
  uint64_t v6 = *((void *)a1 + 4);
  if ((*(_WORD *)(v6 + 656) & 0x10) != 0)
  {
    id v7 = *(void **)(v6 + 384);
    if (v7)
    {
      double v8 = [*(id *)(v6 + 360) superview];
      objc_msgSend(v7, "convertRect:toView:", v8, v3, v2, v5, v4);
      double v3 = v9;
      double v2 = v10;
      double v5 = v11;
      double v4 = v12;
    }
  }
  double v13 = (void *)*((void *)a1 + 5);
  double v14 = a1[10];
  return objc_msgSend(v13, "_setFrame:arrowOffset:", v3, v2, v5, v4, v14);
}

- (CGSize)_defaultPopoverSize
{
  [(UIPopoverPresentationController *)self _defaultPopoverSizeOverride];
  if (v4 == *MEMORY[0x1E4F1DB30] && v3 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    if (self->_hostManager)
    {
      double v8 = [(UIPopoverPresentationController *)self _metrics];
      [v8 defaultPreferredSmallContentSize];
      double v10 = v9;
      double v12 = v11;
    }
    else
    {
      double v8 = [(UIPresentationController *)self _currentPresentationSuperview];
      [v8 bounds];
      double v14 = v13;
      uint64_t v15 = [(UIPopoverPresentationController *)self _metrics];
      double v16 = v15;
      if (v14 < 1024.0) {
        [v15 defaultPreferredSmallContentSize];
      }
      else {
        [v15 defaultPreferredLargeContentSize];
      }
      double v10 = v17;
      double v12 = v18;
    }
    double v6 = v10;
    double v7 = v12;
  }
  else
  {
    [(UIPopoverPresentationController *)self _defaultPopoverSizeOverride];
  }
  result.CGFloat height = v7;
  result.CGFloat width = v6;
  return result;
}

- (id)_metrics
{
  double v3 = [(UIPresentationController *)self _visualStyle];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    double v5 = [(UIPresentationController *)self _visualStyle];
    double v6 = [v5 metrics];
  }
  else
  {
    double v6 = +[_UIPopoverPresentationMetrics defaultPopoverMetrics];
  }
  return v6;
}

- (CGSize)_defaultPopoverSizeOverride
{
  double width = self->__defaultPopoverSizeOverride.width;
  double height = self->__defaultPopoverSizeOverride.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (UIPopoverPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v32.receiver = self;
  v32.super_class = (Class)UIPopoverPresentationController;
  char v4 = [(UIPresentationController *)&v32 initWithPresentedViewController:a3 presentingViewController:a4];
  double v5 = v4;
  if (v4)
  {
    v4->_adaptivityEnabled = 1;
    v4->_popoverControllerStyle = 0;
    v4->_currentArrowDirection = -1;
    v4->_permittedArrowDirections = 15;
    v4->_presentationState = 4;
    v4->_retainsSelfWhilePresented = 0;
    double v6 = [_UIPopoverDimmingView alloc];
    uint64_t v7 = -[UIDimmingView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    dimmingView = v5->_dimmingView;
    v5->_dimmingView = (_UIPopoverDimmingView *)v7;

    v5->_canOverlapSourceViewRect = 0;
    [(objc_class *)+[_UIPopoverStandardChromeView standardChromeViewClass] cornerRadius];
    v5->_cornerRadius = v9;
    v5->_shouldDisableInteractionDuringTransitions = dyld_program_sdk_at_least() ^ 1;
    if (dyld_program_sdk_at_least())
    {
      v31.receiver = v5;
      v31.super_class = (Class)UIPopoverPresentationController;
      v5->_shouldPreserveFirstResponder = [(UIPresentationController *)&v31 _shouldPreserveFirstResponder];
    }
    else
    {
      v5->_shouldPreserveFirstResponder = 0;
    }
    popoverBackgroundViewClass = v5->_popoverBackgroundViewClass;
    if (!popoverBackgroundViewClass) {
      popoverBackgroundViewClass = [(UIPopoverPresentationController *)v5 _defaultChromeViewClass];
    }
    double v11 = [(UIPopoverPresentationController *)v5 _popoverHostingWindow];
    double v12 = [(UIPopoverPresentationController *)v5 _layoutInfoForCurrentKeyboardStateAndHostingWindow:v11];
    -[objc_class _contentViewCornerRadiusForArrowDirection:](popoverBackgroundViewClass, "_contentViewCornerRadiusForArrowDirection:", [v12 arrowDirection]);
    double v14 = [[_UIRoundedRectShadowView alloc] initWithCornerRadius:v13];
    shadowView = v5->_shadowView;
    v5->_shadowView = v14;

    [(UIView *)v5->_shadowView setUserInteractionEnabled:0];
    if ((_UIInternalPreferenceUsesDefault(&_UIInternalPreference_UseAutoLayoutToPositionPopover, @"UseAutoLayoutToPositionPopover", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateBool) & 1) == 0&& byte_1EB256F7C&& dyld_program_sdk_at_least())
    {
      double v16 = objc_alloc_init(UIView);
      sourceOverlayView = v5->_sourceOverlayView;
      v5->_sourceOverlayView = v16;

      [(UIView *)v5->_sourceOverlayView setTranslatesAutoresizingMaskIntoConstraints:0];
      [(UIView *)v5->_sourceOverlayView setUserInteractionEnabled:0];
    }
    if (dyld_program_sdk_at_least()) {
      -[UIPresentationController setSourceRect:](v5, "setSourceRect:", *MEMORY[0x1E4F1DB20], *(double *)(MEMORY[0x1E4F1DB20] + 8), *(double *)(MEMORY[0x1E4F1DB20] + 16), *(double *)(MEMORY[0x1E4F1DB20] + 24));
    }
    double v18 = [(UIPresentationController *)v5 _internalTraitOverrides];
    [v18 setHorizontalSizeClass:1];

    double v19 = [(UIPresentationController *)v5 _internalTraitOverrides];
    [v19 _setNSIntegerValue:3 forTraitToken:0x1ED3F5C10];

    int v20 = [(id)objc_opt_class() _showTargetRectPref];
    v5->_showsTargetRect = v20;
    if (v20)
    {
      v21 = +[UIColor redColor];
      double v22 = [v21 colorWithAlphaComponent:0.2];
      [(UIView *)v5->_sourceOverlayView setBackgroundColor:v22];

      [(UIView *)v5->_sourceOverlayView _setContinuousCornerRadius:4.0];
      double v23 = objc_alloc_init(UIView);
      targetRectView = v5->_targetRectView;
      v5->_targetRectView = v23;

      [(UIView *)v5->_targetRectView setUserInteractionEnabled:0];
      id v25 = +[UIColor redColor];
      uint64_t v26 = [v25 CGColor];
      id v27 = [(UIView *)v5->_targetRectView layer];
      [v27 setBorderColor:v26];

      id v28 = [(UIView *)v5->_targetRectView layer];
      [v28 setBorderWidth:2.0];

      [(UIView *)v5->_targetRectView _setContinuousCornerRadius:4.0];
    }
    v29 = [(UIPopoverPresentationController *)v5 _metrics];
    v5->__shouldHideArrow = [v29 shouldHideArrow];

    v5->__ignoreBarButtonItemSiblings = dyld_program_sdk_at_least();
    v5->__defaultPopoverSizeOverride = (CGSize)*MEMORY[0x1E4F1DB30];
    v5->_backgroundBlurEffectStyle = 1000;
    v5->_shouldDimPresentingViewTint = 1;
  }
  return v5;
}

- (id)_layoutInfoForCurrentKeyboardState
{
  double v3 = [(UIView *)self->_popoverView window];
  char v4 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardStateAndHostingWindow:v3];

  return v4;
}

- (id)_layoutInfoFromLayoutInfo:(id)a3 forCurrentKeyboardStateAndHostingWindow:(id)a4
{
  id v6 = a4;
  uint64_t v7 = (void *)[a3 copy];
  if ([v6 _isRemoteInputHostWindow]) {
    [v7 setPreferredArrowDirections:2];
  }
  if ([(UIPopoverPresentationController *)self _attemptsToAvoidKeyboard])
  {
    double v8 = [v6 windowScene];
    double v9 = [v8 keyboardSceneDelegate];

    [v9 visibleFrameInView:0];
    double x = v91.origin.x;
    double y = v91.origin.y;
    double width = v91.size.width;
    double height = v91.size.height;
    if (!CGRectIsEmpty(v91))
    {
      [(UIPopoverPresentationController *)self _sourceRectInContainerView];
      v100.origin.double x = v14;
      v100.origin.double y = v15;
      v100.size.double width = v16;
      v100.size.double height = v17;
      v92.origin.double x = x;
      v92.origin.double y = y;
      v92.size.double width = width;
      v92.size.double height = height;
      if (CGRectContainsRect(v92, v100))
      {
        double v18 = [v9 inputViews];
        double v19 = [(UIPresentationController *)self sourceView];
        int v20 = [v18 hierarchyContainsView:v19];

        if (v20)
        {
          [v9 visibleInputViewFrameInView:0];
          double x = v21;
          double y = v22;
          double width = v23;
          double height = v24;
        }
      }
      id v25 = +[UIKeyboard activeKeyboard];
      char v26 = [v25 isDescendantOfView:self->_popoverView];

      if ((v26 & 1) == 0)
      {
        if (![(id)UIApp _isSpringBoard]
          || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), id v27 = objc_claimAutoreleasedReturnValue(), v28 = [v27 keyboardActive], v27, v28))
        {
          long long v88 = 0u;
          long long v89 = 0u;
          long long v87 = 0u;
          dimmingView = self->_dimmingView;
          if (dimmingView) {
            [(UIView *)dimmingView transform];
          }
          objc_msgSend(v6, "convertRect:fromWindow:", 0, x, y, width, height);
          objc_msgSend(v6, "convertRect:toView:", self->_dimmingView);
          CGFloat v31 = v30;
          CGFloat v33 = v32;
          CGFloat v35 = v34;
          CGFloat v37 = v36;
          [(UIView *)self->_dimmingView frame];
          CGFloat v39 = v38;
          CGFloat v41 = v40;
          CGFloat v43 = v42;
          CGFloat v45 = v44;
          if (dyld_program_sdk_at_least())
          {
            [(UIPopoverPresentationController *)self _containingFrame];
            CGFloat v39 = v46;
            CGFloat v41 = v47;
            CGFloat v43 = v48;
            CGFloat v45 = v49;
          }
          v93.origin.double x = v31;
          v93.origin.double y = v33;
          v93.size.double width = v35;
          v93.size.double height = v37;
          v101.origin.double x = v39;
          v101.origin.double y = v41;
          v101.size.double width = v43;
          v101.size.double height = v45;
          CGRect v94 = CGRectIntersection(v93, v101);
          double v50 = v94.size.height;
          [(UIPopoverPresentationController *)self _containingFrameInsets];
          double v52 = v51;
          double v54 = v53;
          double v56 = v55;
          double v58 = v57 + v50;
          v59 = self->_dimmingView;
          v86[0] = v87;
          v86[1] = v88;
          v86[2] = v89;
          [(UIView *)v59 setTransform:v86];
          objc_msgSend(v7, "setContainingFrameInsets:", v52, v54, v58, v56);
          [v7 frame];
          IsEmptdouble y = CGRectIsEmpty(v95);
          [v7 sourceViewRect];
          double v62 = v61;
          double v64 = v63;
          double v66 = v65;
          CGFloat v68 = v67;
          [v7 containingFrame];
          double v70 = v69;
          double v72 = v71;
          double v74 = v73;
          double v76 = v75;
          [v7 containingFrameInsets];
          double v78 = v70 + v77;
          double v80 = v72 + v79;
          double v82 = v74 - (v77 + v81);
          double v84 = v76 - (v79 + v83);
          if (IsEmpty) {
            goto LABEL_18;
          }
          v96.origin.double x = v78;
          v96.origin.double y = v80;
          v96.size.double width = v82;
          v96.size.double height = v84;
          v102.origin.double x = v62;
          v102.origin.double y = v64;
          v102.size.double width = v66;
          v102.size.double height = v68;
          CGRect v97 = CGRectIntersection(v96, v102);
          if (CGRectIsEmpty(v97))
          {
            v98.origin.double x = v78;
            v98.origin.double y = v80;
            v98.size.double width = v82;
            v98.size.double height = v84;
            if (CGRectGetMaxY(v98) < v64)
            {
LABEL_18:
              v99.origin.double x = v78;
              v99.origin.double y = v80;
              v99.size.double width = v82;
              v99.size.double height = v84;
              objc_msgSend(v7, "setSourceViewRect:", v62, CGRectGetMaxY(v99), v66, 1.0);
            }
          }
        }
      }
    }
  }
  return v7;
}

- (BOOL)_attemptsToAvoidKeyboard
{
  if (self->_ignoresKeyboardNotifications) {
    return 0;
  }
  if (!self->_popoverControllerStyle || (*(_WORD *)&self->_popoverControllerFlags & 0x10) == 0) {
    return 1;
  }
  double v3 = objc_opt_class();
  return [v3 _forceAttemptsToAvoidKeyboard];
}

- (id)_layoutInfoForCurrentKeyboardStateAndHostingWindow:(id)a3
{
  return [(UIPopoverPresentationController *)self _layoutInfoFromLayoutInfo:self->_preferredLayoutInfo forCurrentKeyboardStateAndHostingWindow:a3];
}

- (id)_popoverHostingWindow
{
  double v2 = [(UIPresentationController *)self containerView];
  double v3 = [v2 window];

  return v3;
}

- (Class)_defaultChromeViewClass
{
  int64_t popoverControllerStyle = self->_popoverControllerStyle;
  if (popoverControllerStyle == 1)
  {
    double v5 = (objc_class *)objc_opt_class();
    if (v5) {
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  if (popoverControllerStyle
    || (double v5 = +[_UIPopoverStandardChromeView standardChromeViewClass]) == 0)
  {
LABEL_8:
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:a2 object:self file:@"UIPopoverPresentationController.m" lineNumber:719 description:@"Failed to determine chrome view class"];

    double v5 = 0;
  }
LABEL_4:
  return v5;
}

+ (BOOL)_showTargetRectPref
{
  if (qword_1EB25D770 != -1) {
    dispatch_once(&qword_1EB25D770, &__block_literal_global_124);
  }
  return _MergedGlobals_27;
}

- (NSArray)passthroughViews
{
  return [(UIDimmingView *)self->_dimmingView passthroughViews];
}

- (BOOL)canOverlapSourceViewRect
{
  return self->_canOverlapSourceViewRect;
}

- (CGRect)_sourceRectInContainerView
{
  double v3 = [(UIPresentationController *)self containerView];
  [(UIPopoverPresentationController *)self _sourceRectInCoordinateSpace:v3];
  CGFloat x = v4;
  CGFloat y = v6;
  CGFloat width = v8;
  CGFloat height = v10;

  v18.origin.CGFloat x = x;
  v18.origin.CGFloat y = y;
  v18.size.CGFloat width = width;
  v18.size.CGFloat height = height;
  BOOL v12 = CGRectEqualToRect(v18, *MEMORY[0x1E4F1DB28]);
  p_lastSourceRectInContainerView = &self->_lastSourceRectInContainerView;
  if (v12)
  {
    CGFloat x = p_lastSourceRectInContainerView->origin.x;
    CGFloat y = self->_lastSourceRectInContainerView.origin.y;
    CGFloat width = self->_lastSourceRectInContainerView.size.width;
    CGFloat height = self->_lastSourceRectInContainerView.size.height;
  }
  else
  {
    p_lastSourceRectInContainerView->origin.CGFloat x = x;
    self->_lastSourceRectInContainerView.origin.CGFloat y = y;
    self->_lastSourceRectInContainerView.size.CGFloat width = width;
    self->_lastSourceRectInContainerView.size.CGFloat height = height;
  }
  double v14 = x;
  double v15 = y;
  double v16 = width;
  double v17 = height;
  result.size.CGFloat height = v17;
  result.size.CGFloat width = v16;
  result.origin.CGFloat y = v15;
  result.origin.CGFloat x = v14;
  return result;
}

- (CGRect)_sourceRectInCoordinateSpace:(id)a3
{
  id v4 = a3;
  [(UIPresentationController *)self sourceRect];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v13 = [(UIPresentationController *)self sourceItem];
  double v14 = _UIPopoverPresentationControllerSourceItemUpCast(v13);

  if (v14)
  {
    double v15 = [(UIPresentationController *)self containerView];
    double v16 = [v15 _window];
    [v14 _sourceRectForPresentationInWindow:v16];
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;

    v59.origin.CGFloat x = v18;
    v59.origin.CGFloat y = v20;
    v59.size.CGFloat width = v22;
    v59.size.CGFloat height = v24;
    if (!CGRectIsNull(v59))
    {
      double v12 = v24;
      double v10 = v22;
      double v8 = v20;
      double v6 = v18;
    }
  }
  id v25 = [(UIPresentationController *)self _realSourceView];
  v60.origin.CGFloat x = v6;
  v60.origin.CGFloat y = v8;
  v60.size.CGFloat width = v10;
  v60.size.CGFloat height = v12;
  if (CGRectIsNull(v60))
  {
    char v26 = [(UIPopoverPresentationController *)self _sourceOverlayView];
    id v27 = v26;
    if (!v26) {
      char v26 = v25;
    }
    [v26 bounds];
    double v6 = v28;
    double v8 = v29;
    double v10 = v30;
    double v12 = v31;
  }
  double v32 = [(UIPopoverPresentationController *)self _sourceOverlayView];

  if (v32)
  {
    CGFloat v33 = [(UIPopoverPresentationController *)self _sourceOverlayView];
    [v25 bounds];
    CGFloat v35 = -v34;
    [v25 bounds];
    CGFloat v37 = -v36;
    v61.origin.CGFloat x = v6;
    v61.origin.CGFloat y = v8;
    v61.size.CGFloat width = v10;
    v61.size.CGFloat height = v12;
    CGRect v62 = CGRectOffset(v61, v35, v37);
    objc_msgSend(v33, "convertRect:toCoordinateSpace:", v4, v62.origin.x, v62.origin.y, v62.size.width, v62.size.height);
    double v39 = v38;
    double v41 = v40;
    double v43 = v42;
    double v45 = v44;
  }
  else
  {
    CGFloat v33 = [(UIPresentationController *)self containerView];
    double v46 = [v25 _window];
    double v47 = [v33 _window];
    BOOL v48 = [(UIPopoverPresentationController *)self _shouldConvertToScene];
    if (v46
      && (v48
       || ([v46 screen],
           double v49 = objc_claimAutoreleasedReturnValue(),
           [v47 screen],
           double v50 = objc_claimAutoreleasedReturnValue(),
           v50,
           v49,
           v49 == v50)))
    {
      objc_msgSend(v25, "convertRect:toCoordinateSpace:", v4, v6, v8, v10, v12);
      double v39 = v51;
      double v41 = v52;
      double v43 = v53;
      double v45 = v54;
    }
    else
    {
      double v39 = *MEMORY[0x1E4F1DB28];
      double v41 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      double v43 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
      double v45 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    }
  }
  double v55 = v39;
  double v56 = v41;
  double v57 = v43;
  double v58 = v45;
  result.size.CGFloat height = v58;
  result.size.CGFloat width = v57;
  result.origin.CGFloat y = v56;
  result.origin.CGFloat x = v55;
  return result;
}

- (UIView)_sourceOverlayView
{
  return self->_sourceOverlayView;
}

- (BOOL)_shouldConvertToScene
{
  [(UIPopoverPresentationController *)self _createHostManagerIfNeeded];
  if (!self->_hostManager) {
    return 0;
  }
  double v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(UIPresentationController *)self delegate];
    char v5 = [v4 _popoverPresentationControllerShouldConvertToScene:self];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (void)_createHostManagerIfNeeded
{
  if (!self->_hostManager)
  {
    double v3 = +[UIPopoverPresentationController _platformHostManagerForController:self];
    hostManager = self->_hostManager;
    self->_hostManager = v3;
  }
}

+ (id)_platformHostManagerForController:(id)a3
{
  return +[_UIPopoverHostManagerProviderMac managerForPresentationController:a3];
}

- (id)_createVisualStyleForProvider:(id)a3
{
  id v4 = a3;
  char v5 = [v4 styleForPopoverPresentationController:self];
  if (!v5)
  {
    v7.receiver = self;
    v7.super_class = (Class)UIPopoverPresentationController;
    char v5 = [(UIPresentationController *)&v7 _createVisualStyleForProvider:v4];
  }

  return v5;
}

void __54__UIPopoverPresentationController__showTargetRectPref__block_invoke()
{
  _UIKitPreferencesOnce();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 objectForKey:@"UIPopoverControllerPaintsTargetRect"];
  _MergedGlobals_27 = [v0 BOOLValue];
}

- (void)containerViewWillLayoutSubviews
{
  if ((*(_WORD *)&self->_popoverControllerFlags & 0x40) == 0)
  {
    double v3 = [(UIPresentationController *)self _realSourceView];
    if (os_variant_has_internal_diagnostics())
    {
      if (!v3)
      {
        double v51 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v51, OS_LOG_TYPE_FAULT, "Assuming sourceView is not nil", buf, 2u);
        }
      }
    }
    else if (!v3)
    {
      double v52 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &containerViewWillLayoutSubviews___s_category) + 8);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v52, OS_LOG_TYPE_ERROR, "Assuming sourceView is not nil", buf, 2u);
      }
    }
    if (self->_useSourceViewBoundsAsSourceRect)
    {
      [v3 bounds];
      -[UIPresentationController setSourceRect:](self, "setSourceRect:");
    }
    [(UIPopoverPresentationController *)self _sourceRectInContainerView];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    if ([(UIPopoverPresentationController *)self showsTargetRect])
    {
      double v12 = [(UIPopoverPresentationController *)self _targetRectView];
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
    }
    [(UIPopoverPresentationController *)self _containingFrame];
    v59.origin.CGFloat x = v13;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v53 = v13;
    v59.origin.CGFloat y = v14;
    v59.size.CGFloat width = v16;
    v59.size.CGFloat height = v18;
    BOOL v20 = CGRectEqualToRect(self->_previousContainerViewRect, v59);
    if (!v20) {
      [(UIPopoverPresentationController *)self _sendDelegateWillRepositionToRect];
    }
    preferredLayoutInfo = self->_preferredLayoutInfo;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke;
    v56[3] = &unk_1E52E7B00;
    v56[4] = self;
    *(CGFloat *)&v56[5] = v53;
    *(CGFloat *)&v56[6] = v15;
    *(CGFloat *)&v56[7] = v17;
    *(CGFloat *)&v56[8] = v19;
    *(double *)&v56[9] = v5;
    *(double *)&v56[10] = v7;
    *(double *)&v56[11] = v9;
    *(double *)&v56[12] = v11;
    BOOL v57 = v20;
    -[_UIPopoverLayoutInfo updateProperties:](preferredLayoutInfo, "updateProperties:", v56, *(void *)&v53);
    CGFloat v22 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];
    double v23 = v22;
    if (v20)
    {
      [v22 frame];
      if (v24 >= 100.0 && ([v23 frame], v25 >= 100.0))
      {
        uint64_t v50 = [v23 arrowDirection];
        BOOL v28 = v50 != [(UIPopoverPresentationController *)self arrowDirection];
      }
      else
      {
        char v26 = self->_preferredLayoutInfo;
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke_2;
        v55[3] = &unk_1E52D9F70;
        v55[4] = self;
        [(_UIPopoverLayoutInfo *)v26 updateProperties:v55];
        uint64_t v27 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];

        BOOL v28 = 1;
        double v23 = (void *)v27;
      }
    }
    else
    {
      -[_UIPopoverLayoutInfo setPreferredArrowDirections:](self->_preferredLayoutInfo, "setPreferredArrowDirections:", [v22 arrowDirection]);
      BOOL v28 = 1;
    }
    [v23 frame];
    if (self->_hostManager)
    {
      if (self->_popoverIdentifier)
      {
        CGFloat v33 = [(UIPopoverPresentationController *)self _hostManagerPopoverUpdateConfiguration];
        [(UIPopoverPresentationController *)self _sourceRectInContainerView];
        objc_msgSend(v33, "setSourceRectInParentUIWindow:");
        [(_UIPopoverHostManager *)self->_hostManager updatePopoverWithIdentifier:self->_popoverIdentifier configuration:v33];
      }
      if (!v28) {
        goto LABEL_27;
      }
    }
    else
    {
      double v34 = v29;
      double v35 = v30;
      double v36 = v31;
      double v37 = v32;
      popoverView = self->_popoverView;
      [v23 offset];
      -[_UIPopoverView _setFrame:arrowOffset:](popoverView, "_setFrame:arrowOffset:", v34, v35, v36, v37, v39);
      if (!v28)
      {
LABEL_27:

        return;
      }
    }
    double v40 = self->_popoverView;
    if ([(UIPopoverPresentationController *)self _shouldHideArrow]) {
      uint64_t v41 = 0;
    }
    else {
      uint64_t v41 = [v23 arrowDirection];
    }
    [(_UIPopoverView *)v40 setArrowDirection:v41];
    double v42 = [(UIPresentationController *)self presentedViewController];
    [v42 _updateContentOverlayInsetsFromParentIfNecessary];

    double v43 = self->_popoverView;
    [(_UIPopoverView *)v43 safeAreaInsetsForContentView];
    -[UIView _setSafeAreaInsets:updateSubviewsDuringNextLayoutPass:]((double *)v43, 1, v44, v45, v46, v47);
    if (!self->_popoverBackgroundViewClass) {
      [(UIPopoverPresentationController *)self _defaultChromeViewClass];
    }
    BOOL v48 = self->_popoverView;
    [(UIPopoverPresentationController *)self _cornerRadius];
    -[_UIPopoverView _setCustomCornerRadius:](v48, "_setCustomCornerRadius:");
    double v49 = self->_popoverView;
    [v23 offset];
    -[_UIPopoverView setArrowOffset:](v49, "setArrowOffset:");
    self->_previousContainerViewRect.origin.CGFloat x = v54;
    self->_previousContainerViewRect.origin.CGFloat y = v15;
    self->_previousContainerViewRect.size.CGFloat width = v17;
    self->_previousContainerViewRect.size.CGFloat height = v19;
    [(UIView *)self->_popoverView setNeedsLayout];
    goto LABEL_27;
  }
}

- (CGRect)_containingFrame
{
  double v2 = [(UIPresentationController *)self containerView];
  double v3 = [v2 _window];
  double v4 = -[UIWindow _fbsScene](v3);

  [v2 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [v2 safeAreaInsets];
  double v14 = v6 + v13;
  double v16 = v8 + v15;
  double v18 = v10 - (v13 + v17);
  double v20 = v12 - (v15 + v19);
  if (v4)
  {
    double v21 = [v4 settings];
    [v21 bounds];
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v30 = [v2 _window];
    double v31 = _UIConvertSceneRectToWindow(v4, v30, v23, v25, v27, v29);
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;

    objc_msgSend(v2, "convertRect:fromView:", 0, v31, v33, v35, v37);
    v49.origin.double x = v14;
    v49.origin.double y = v16;
    v49.size.double width = v18;
    v49.size.double height = v20;
    CGRect v47 = CGRectIntersection(v46, v49);
    double x = v47.origin.x;
    double y = v47.origin.y;
    double width = v47.size.width;
    double height = v47.size.height;
    if (!CGRectIsEmpty(v47))
    {
      double v20 = height;
      double v18 = width;
      double v16 = y;
      double v14 = x;
    }
  }

  double v42 = v14;
  double v43 = v16;
  double v44 = v18;
  double v45 = v20;
  result.size.double height = v45;
  result.size.double width = v44;
  result.origin.double y = v43;
  result.origin.double x = v42;
  return result;
}

- (void)presentationTransitionWillBegin
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  [(UIPopoverPresentationController *)self _createHostManagerIfNeeded];
  double v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 prepareForPopoverPresentation:self];
  }
  self->_presentationState = 1;
  double v4 = [(UIPresentationController *)self presentedViewController];
  contentViewController = self->_contentViewController;
  self->_contentViewController = v4;

  if ([(UIPopoverPresentationController *)self _centersPopoverIfSourceViewNotSet])
  {
    double v6 = [(UIPresentationController *)self _realSourceView];

    if (!v6)
    {
      double v7 = [(UIPresentationController *)self containerView];
      [(UIPresentationController *)self setSourceView:v7];

      self->_permittedArrowDirections = 0;
      self->_useSourceViewBoundsAsSourceRect = 1;
      if ([(UIPopoverPresentationController *)self _softAssertWhenNoSourceViewOrBarButtonItemSpecified])
      {
        if (os_variant_has_internal_diagnostics())
        {
          double v9 = __UIFaultDebugAssertLog();
          if (!os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
            goto LABEL_10;
          }
          double v10 = [(UIPresentationController *)self presentedViewController];
          double v11 = [(UIPresentationController *)self presentingViewController];
          *(_DWORD *)buf = 138412546;
          long long v89 = v10;
          __int16 v90 = 2112;
          CGRect v91 = v11;
          _os_log_fault_impl(&dword_1853B0000, v9, OS_LOG_TYPE_FAULT, "Tried to present %@ from %@ as a popover without setting a sourceView or barButtonItem.", buf, 0x16u);
        }
        else
        {
          double v8 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &presentationTransitionWillBegin___s_category) + 8);
          if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
            goto LABEL_11;
          }
          double v9 = v8;
          double v10 = [(UIPresentationController *)self presentedViewController];
          double v11 = [(UIPresentationController *)self presentingViewController];
          *(_DWORD *)buf = 138412546;
          long long v89 = v10;
          __int16 v90 = 2112;
          CGRect v91 = v11;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Tried to present %@ from %@ as a popover without setting a sourceView or barButtonItem.", buf, 0x16u);
        }

LABEL_10:
      }
    }
  }
LABEL_11:
  double v72 = [(UIPresentationController *)self _realSourceView];
  if (!v72)
  {
    double v67 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v68 = *MEMORY[0x1E4F1C3A8];
    double v69 = [(UIPopoverPresentationController *)self _exceptionStringForNilSourceViewOrBarButtonItem];
    id v70 = [v67 exceptionWithName:v68 reason:v69 userInfo:0];

    objc_exception_throw(v70);
  }
  double v12 = [(UIPresentationController *)self barButtonItem];
  uint64_t v13 = [v12 view];
  if (v13)
  {
    double v14 = (void *)v13;
    BOOL v15 = [(UIPopoverPresentationController *)self _ignoreBarButtonItemSiblings];

    if (!v15)
    {
      double v71 = v3;
      double v16 = [v12 view];
      double v17 = [v16 superview];
      double v18 = [v17 subviews];
      double v19 = [v12 view];
      long long v87 = v19;
      double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v87 count:1];
      double v21 = [v18 arrayByExcludingObjectsInArray:v20];

      if ([v21 count])
      {
        double v22 = [(UIPopoverPresentationController *)self passthroughViews];
        uint64_t v23 = [v22 count];

        if (v23)
        {
          double v24 = [(UIPopoverPresentationController *)self passthroughViews];
          double v25 = (void *)[v24 mutableCopy];

          long long v82 = 0u;
          long long v83 = 0u;
          long long v80 = 0u;
          long long v81 = 0u;
          id v26 = v21;
          uint64_t v27 = [v26 countByEnumeratingWithState:&v80 objects:v86 count:16];
          if (v27)
          {
            uint64_t v28 = v27;
            uint64_t v29 = *(void *)v81;
            do
            {
              for (uint64_t i = 0; i != v28; ++i)
              {
                if (*(void *)v81 != v29) {
                  objc_enumerationMutation(v26);
                }
                uint64_t v31 = *(void *)(*((void *)&v80 + 1) + 8 * i);
                if (([v25 containsObject:v31] & 1) == 0) {
                  [v25 addObject:v31];
                }
              }
              uint64_t v28 = [v26 countByEnumeratingWithState:&v80 objects:v86 count:16];
            }
            while (v28);
          }

          [(UIPopoverPresentationController *)self setPassthroughViews:v25];
        }
        else
        {
          [(UIPopoverPresentationController *)self setPassthroughViews:v21];
        }
      }
      self->_permittedArrowDirections &= 3uLL;

      double v3 = v71;
    }
  }
  double v32 = [(UIPresentationController *)self containerView];
  double v33 = [v32 _focusBehavior];
  char v34 = [v33 supportsViewTransparency];

  if ((v34 & 1) == 0)
  {
    double v35 = [(UIPresentationController *)self containerView];
    objc_msgSend(v35, "_setFocusInteractionEnabled:", -[UIPopoverPresentationController _allowsFocusInPresentingViewController](self, "_allowsFocusInPresentingViewController") ^ 1);
  }
  [(UIPopoverPresentationController *)self _transitionFromViewController:0 toViewController:self->_contentViewController animated:0];
  dimmingView = self->_dimmingView;
  double v37 = [(UIPresentationController *)self containerView];
  [v37 bounds];
  -[UIView setFrame:](dimmingView, "setFrame:");

  [(UIView *)self->_dimmingView setTintAdjustmentMode:1];
  [(UIView *)self->_dimmingView setAutoresizingMask:18];
  [(UIDimmingView *)self->_dimmingView setDelegate:self];
  double v38 = self->_dimmingView;
  double v39 = [(UIPresentationController *)self containerView];
  [(_UIPopoverDimmingView *)v38 setTransitionContainerView:v39];

  [(UIView *)self->_dimmingView setUserInteractionEnabled:1];
  if (dyld_program_sdk_at_least())
  {
    double v40 = [(UIPresentationController *)self containerView];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      double v42 = [(UIPresentationController *)self containerView];
      [v42 setIgnoreDirectTouchEvents:1];
    }
  }
  double v43 = [(UIPopoverPresentationController *)self _popoverHostingWindow];
  if ([v43 _isTextEffectsWindow]) {
    *(_WORD *)&self->_popoverControllerFlags |= 8u;
  }
  double v44 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v44 postNotificationName:@"_UIAlertWillAppearNotification" object:self userInfo:0];
  double v84 = @"UIPopoverControllerPresentingWindowKey";
  v85 = v43;
  double v45 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v85 forKeys:&v84 count:1];
  [v44 postNotificationName:@"UIPopoverControllerWillPresentPopoverNotification" object:self userInfo:v45];

  if (self->_retainsSelfWhilePresented) {
    objc_storeStrong((id *)&self->_retainedSelf, self);
  }
  CGRect v46 = [(UIPresentationController *)self containerView];
  [v46 addSubview:self->_dimmingView];

  CGRect v47 = [(UIPopoverPresentationController *)self _sourceOverlayView];

  if (v47)
  {
    BOOL v48 = [(UIPresentationController *)self containerView];
    CGRect v49 = [(UIPopoverPresentationController *)self _sourceOverlayView];
    [v48 addSubview:v49];

    [(UIPopoverPresentationController *)self _updateSourceOverlayViewConstraints];
  }
  if ([(UIPopoverPresentationController *)self showsTargetRect])
  {
    uint64_t v50 = [(UIPresentationController *)self containerView];
    double v51 = [(UIPopoverPresentationController *)self _targetRectView];
    [v50 addSubview:v51];
  }
  popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
  if (!popoverBackgroundViewClass) {
    popoverBackgroundViewClass = [(UIPopoverPresentationController *)self _defaultChromeViewClass];
  }
  CGFloat v53 = (_UIPopoverLayoutInfo *)objc_alloc_init([(UIPopoverPresentationController *)self _popoverLayoutInfoForChromeClass:popoverBackgroundViewClass]);
  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = v53;

  double v55 = self->_preferredLayoutInfo;
  v77[0] = MEMORY[0x1E4F143A8];
  v77[1] = 3221225472;
  v77[2] = __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke;
  v77[3] = &unk_1E52E7A88;
  v77[4] = self;
  double v79 = popoverBackgroundViewClass;
  id v56 = v43;
  id v78 = v56;
  [(_UIPopoverLayoutInfo *)v55 updateProperties:v77];
  BOOL v57 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardStateAndHostingWindow:v56];
  double v58 = v57;
  CGSize v59 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_previousContainerViewRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_previousContainerViewRect.size = v59;
  if (self->_hostManager)
  {
    CGRect v60 = [(UIPopoverPresentationController *)self _hostManagerPopoverCreationConfiguration];
    [(UIPopoverPresentationController *)self _sourceRectInContainerView];
    objc_msgSend(v60, "setSourceRectInParentUIWindow:");
    [v60 setCompletionBlock:0];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v61 = [v58 arrowDirection];
    }
    else {
      uint64_t v61 = [(UIPopoverPresentationController *)self permittedArrowDirections];
    }
    [v60 setPermittedArrowDirections:v61];
    CGRect v62 = [(UIPopoverPresentationController *)self _createHostManagerPopoverWithConfiguration:v60];
    popoverIdentifier = self->_popoverIdentifier;
    self->_popoverIdentifier = v62;
  }
  else
  {
    v74[0] = MEMORY[0x1E4F143A8];
    v74[1] = 3221225472;
    v74[2] = __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2;
    v74[3] = &unk_1E52E7AB0;
    v74[4] = self;
    id v75 = v57;
    double v76 = popoverBackgroundViewClass;
    +[UIView performWithoutAnimation:v74];
  }
  [(UIPopoverPresentationController *)self _transitionFromViewController:0 toViewController:self->_contentViewController animated:0];
  [(UIPopoverPresentationController *)self _startWatchingForKeyboardNotificationsIfNecessary];
  if (![(UIPopoverPresentationController *)self _shouldUseNewPopoverAnimations])
  {
    [(_UIPopoverView *)self->_popoverView setChromeHidden:1];
    double v64 = [(UIPresentationController *)self presentingViewController];
    double v65 = [v64 _transitionCoordinator];

    if (v65)
    {
      v73[0] = MEMORY[0x1E4F143A8];
      v73[1] = 3221225472;
      v73[2] = __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_3;
      v73[3] = &unk_1E52DA598;
      v73[4] = self;
      [v65 animateAlongsideTransition:v73 completion:0];
    }
    else
    {
      [(_UIPopoverView *)self->_popoverView setChromeHidden:0];
    }
    [(UIView *)self->_shadowView setAlpha:1.0];
  }
  double v66 = [(UIView *)self->_popoverView layer];
  [v66 setAllowsGroupOpacity:0];

  [(UIPopoverPresentationController *)self _startWatchingForScrollViewNotifications];
}

- (void)_transitionFromViewController:(id)a3 toViewController:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = a4;
  id v10 = (id)[v9 view];
  p_popoverContentSize = &self->_popoverContentSize;
  if (self->_popoverContentSize.width == *MEMORY[0x1E4F1DB30]
    && self->_popoverContentSize.height == *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    [v9 _resolvedPreferredContentSize];
    p_popoverContentSize->double width = v13;
    self->_popoverContentSize.double height = v14;
  }
  popoverView = self->_popoverView;
  if (popoverView)
  {
    BOOL v34 = v5;
    double v16 = [(_UIPopoverView *)popoverView contentView];
    double v17 = [v9 view];
    double v18 = [v8 view];
    [v16 bounds];
    objc_msgSend(v17, "setFrame:");
    double v19 = -[UIViewController _parentViewController]((id *)v9);

    if (v19)
    {
      double v20 = [v9 _existingView];
      double v21 = [v20 window];

      if (v9)
      {
        __int16 v22 = v9[192];
        v9[192] = v22 | 0x100;
        [v9 setParentViewController:0];
        v9[192] = v9[192] & 0xFEFF | v22 & 0x100;
      }
      objc_msgSend(v9, "_setNavigationControllerContentInsetAdjustment:", 0.0, 0.0, 0.0, 0.0);
      if (v21)
      {
        [v9 setPerformingModalTransition:1];
        uint64_t v23 = [v9 _existingView];
        [v23 removeFromSuperview];

        [v9 setPerformingModalTransition:0];
      }
    }
    double height = self->_popoverContentSize.height;
    BOOL v25 = height == 1100.0;
    if (height == 1137.0) {
      BOOL v25 = 1;
    }
    if (p_popoverContentSize->width == 320.0 && v25)
    {
      [(UIViewController *)self->_contentViewController _resolvedPreferredContentSize];
      p_popoverContentSize->double width = v27;
      self->_popoverContentSize.double height = v28;
    }
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke;
    v40[3] = &unk_1E52D9F98;
    uint64_t v29 = v9;
    id v41 = v29;
    double v42 = self;
    +[UIView performWithoutAnimation:v40];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_2;
    aBlock[3] = &unk_1E52D9F98;
    double v38 = v29;
    id v30 = v18;
    id v39 = v30;
    uint64_t v31 = (void (**)(void))_Block_copy(aBlock);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_3;
    v35[3] = &unk_1E52DC3A0;
    id v32 = v30;
    id v36 = v32;
    double v33 = (void (**)(void *, uint64_t))_Block_copy(v35);
    if (v34)
    {
      [(UIPopoverPresentationController *)self _presentationAnimationDuration];
      +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v31, v33);
    }
    else
    {
      v31[2](v31);
      v33[2](v33, 1);
    }
  }
}

uint64_t __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

uint64_t __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:1.0];

  double v3 = *(void **)(a1 + 40);
  return [v3 setAlpha:0.0];
}

void __91__UIPopoverPresentationController__transitionFromViewController_toViewController_animated___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  double v3 = *(void **)(a1 + 32);
  double v4 = *(void **)(*(void *)(a1 + 40) + 360);
  id v5 = [v3 view];
  [v4 _setPopoverContentView:v5];
}

uint64_t __89__UIPopoverPresentationController_preferredContentSizeDidChangeForChildContentContainer___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setPreferredContentSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_2(uint64_t a1)
{
  v28[1] = *MEMORY[0x1E4F143B8];
  double v2 = *(void **)(a1 + 32);
  id v3 = objc_alloc((Class)[(id)objc_opt_class() _popoverViewClass]);
  [*(id *)(a1 + 40) frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = *(void *)(a1 + 48);
  CGFloat v13 = *(void **)(a1 + 32);
  CGFloat v14 = [v13 presentedViewController];
  BOOL v15 = objc_msgSend(v3, "initWithFrame:backgroundViewClass:embeddedInView:contentExtendsOverArrow:", v12, 0, objc_msgSend(v13, "_shouldPopoverContentExtendOverArrowForViewController:backgroundViewClass:", v14, *(void *)(a1 + 48)), v5, v7, v9, v11);
  [v2 _setPopoverView:v15];

  double v16 = [*(id *)(*(void *)(a1 + 32) + 360) backgroundView];
  objc_msgSend(v16, "_setChromeHidden:", objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurDisabled"));

  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 360), "setBackgroundBlurEffectStyle:", objc_msgSend(*(id *)(a1 + 32), "_backgroundBlurEffectStyle"));
  [*(id *)(*(void *)(a1 + 32) + 360) setShadowView:*(void *)(*(void *)(a1 + 32) + 376)];
  double v17 = [*(id *)(a1 + 32) presentedViewController];
  double v18 = *(void **)(*(void *)(a1 + 32) + 360);
  double v19 = [v17 traitCollection];
  objc_msgSend(v18, "setOverrideUserInterfaceStyle:", objc_msgSend(v19, "userInterfaceStyle"));

  v28[0] = 0x1ED3F5A48;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
  id v21 = (id)[v17 _registerForTraitTokenChanges:v20 withTarget:*(void *)(a1 + 32) action:sel__presentedViewControllerUserInterfaceStyleChanged];

  __int16 v22 = *(void **)(*(void *)(a1 + 32) + 360);
  [*(id *)(a1 + 40) offset];
  objc_msgSend(v22, "setArrowOffset:");
  uint64_t v23 = *(void **)(a1 + 32);
  double v24 = (void *)v23[45];
  if ([v23 _shouldHideArrow]) {
    uint64_t v25 = 0;
  }
  else {
    uint64_t v25 = [*(id *)(a1 + 40) arrowDirection];
  }
  [v24 setArrowDirection:v25];
  id v26 = *(void **)(a1 + 32);
  CGFloat v27 = (void *)v26[45];
  [v26 _cornerRadius];
  objc_msgSend(v27, "_setCustomCornerRadius:");
  [*(id *)(a1 + 32) _setPopoverBackgroundStyle:*(void *)(*(void *)(a1 + 32) + 440)];
  [*(id *)(*(void *)(a1 + 32) + 360) setPopoverBackgroundColor:*(void *)(*(void *)(a1 + 32) + 448)];
  [*(id *)(*(void *)(a1 + 32) + 360) setArrowBackgroundColor:*(void *)(*(void *)(a1 + 32) + 456)];
}

void __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke(id *a1)
{
  double v2 = (void *)*((void *)a1[4] + 58);
  [a1[6] contentViewInsets];
  objc_msgSend(v2, "setContentInset:");
  id v3 = (void *)*((void *)a1[4] + 58);
  [a1[6] arrowHeight];
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*((id *)a1[4] + 58), "setPreferredContentSize:", *((double *)a1[4] + 60), *((double *)a1[4] + 61));
  [*((id *)a1[4] + 58) setPreferredArrowDirections:*((void *)a1[4] + 91)];
  double v4 = a1[4];
  double v5 = (void *)v4[58];
  [v4 _containingFrame];
  objc_msgSend(v5, "setContainingFrame:");
  double v6 = a1[4];
  double v7 = (void *)v6[58];
  [v6 _containingFrameInsets];
  objc_msgSend(v7, "setContainingFrameInsets:");
  double v8 = a1[4];
  double v9 = (void *)v8[58];
  [v8 _sourceRectInContainerView];
  objc_msgSend(v9, "setSourceViewRect:");
  double v10 = (void *)*((void *)a1[4] + 58);
  double v11 = [a1[5] windowScene];
  objc_msgSend(v10, "setPreferLandscapeOrientations:", (unint64_t)(objc_msgSend(v11, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL);

  [*((id *)a1[4] + 58) setCanOverlapSourceViewRect:*((unsigned __int8 *)a1[4] + 537)];
  objc_msgSend(*((id *)a1[4] + 58), "setPreferredHorizontalAlignment:", objc_msgSend(a1[4], "_preferredHorizontalAlignment"));
  id v12 = [a1[4] containerView];
  objc_msgSend(*((id *)a1[4] + 58), "setIsRTL:", objc_msgSend(v12, "effectiveUserInterfaceLayoutDirection") == 1);
}

uint64_t __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setContainingFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  uint64_t result = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setSourceViewRect:", *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88), *(double *)(a1 + 96));
  if (!*(unsigned char *)(a1 + 104))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    double v4 = *(void **)(v3 + 464);
    uint64_t v5 = *(void *)(v3 + 728);
    return [v4 setPreferredArrowDirections:v5];
  }
  return result;
}

- (BOOL)showsTargetRect
{
  return self->_showsTargetRect;
}

- (void)setPopoverLayoutMargins:(UIEdgeInsets)popoverLayoutMargins
{
  if (self->_popoverLayoutMargins.left != popoverLayoutMargins.left
    || self->_popoverLayoutMargins.top != popoverLayoutMargins.top
    || self->_popoverLayoutMargins.right != popoverLayoutMargins.right
    || self->_popoverLayoutMargins.bottom != popoverLayoutMargins.bottom)
  {
    self->_popoverLayoutMargins = popoverLayoutMargins;
    preferredLayoutInfo = self->_preferredLayoutInfo;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__UIPopoverPresentationController_setPopoverLayoutMargins___block_invoke;
    v9[3] = &unk_1E52D9F70;
    v9[4] = self;
    [(_UIPopoverLayoutInfo *)preferredLayoutInfo updateProperties:v9];
    double v8 = [(UIPresentationController *)self containerView];
    [v8 setNeedsLayout];
  }
}

- (void)setPopoverBackgroundViewClass:(id)popoverBackgroundViewClass
{
}

- (void)setPermittedArrowDirections:(UIPopoverArrowDirection)permittedArrowDirections
{
  self->_permittedArrowDirections = permittedArrowDirections;
}

- (void)setPassthroughViews:(NSArray *)passthroughViews
{
}

- (void)setCanOverlapSourceViewRect:(BOOL)canOverlapSourceViewRect
{
  self->_canOverlapSourceViewRect = canOverlapSourceViewRect;
}

- (int64_t)presentationStyle
{
  return 7;
}

- (UIEdgeInsets)popoverLayoutMargins
{
  double top = self->_popoverLayoutMargins.top;
  double left = self->_popoverLayoutMargins.left;
  double bottom = self->_popoverLayoutMargins.bottom;
  double right = self->_popoverLayoutMargins.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  [(UIView *)self->_popoverView _frameIgnoringLayerTransform];
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)_startWatchingForScrollViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__scrollViewWillBeginDragging_ name:@"_UIScrollViewWillBeginDraggingNotification" object:0];
  [v3 addObserver:self selector:sel__scrollViewDidEndDragging_ name:@"_UIScrollViewDidEndDraggingNotification" object:0];
}

- (void)_startWatchingForKeyboardNotificationsIfNecessary
{
  if ([(UIPopoverPresentationController *)self _attemptsToAvoidKeyboard])
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__keyboardWillShow_ name:@"UIKeyboardWillShowNotification" object:0];
    [v3 addObserver:self selector:sel__keyboardDidHide_ name:@"UIKeyboardDidHideNotification" object:0];
  }
}

- (BOOL)_shouldPreserveFirstResponder
{
  return self->_shouldPreserveFirstResponder;
}

- (BOOL)_shouldPopoverContentExtendOverArrowForViewController:(id)a3 backgroundViewClass:(Class)a4
{
  id v5 = a3;
  BOOL v6 = dyld_program_sdk_at_least()
    && ([(id)UIApp _isSpringBoard] & 1) == 0
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
    && +[_UIPopoverStandardChromeView standardChromeViewClass] == a4;

  return v6;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  int v3 = [(UIPopoverPresentationController *)self _shouldDimPresentingViewTint];
  if (v3)
  {
    hostManager = self->_hostManager;
    if (hostManager)
    {
      popoverIdentifier = self->_popoverIdentifier;
      LOBYTE(v3) = [(_UIPopoverHostManager *)hostManager shouldOccludeDuringPresentationForPopoverWithIdentifier:popoverIdentifier];
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 0;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return self->_shouldDisableInteractionDuringTransitions;
}

- (BOOL)_shouldDimPresentingViewTint
{
  return self->_shouldDimPresentingViewTint;
}

- (void)_setPopoverView:(id)a3
{
  id v5 = (_UIPopoverView *)a3;
  if (self->_popoverView != v5)
  {
    BOOL v6 = v5;
    objc_storeStrong((id *)&self->_popoverView, a3);
    id v5 = v6;
  }
}

- (void)_setPopoverBackgroundStyle:(int64_t)a3
{
  self->_popoverBackgroundStyle = a3;
  popoverView = self->_popoverView;
  if (popoverView) {
    -[_UIPopoverView setBackgroundStyle:](popoverView, "setBackgroundStyle:");
  }
}

- (void)_sendDelegateWillRepositionToRect
{
  double v4 = [(UIPresentationController *)self delegate];
  if ((*(_WORD *)&self->_popoverControllerFlags & 0x80) != 0)
  {
    if (!dyld_program_sdk_at_least()) {
      goto LABEL_7;
    }
    id v5 = [MEMORY[0x1E4F28B00] currentHandler];
    [v5 handleFailureInMethod:a2 object:self file:@"UIPopoverPresentationController.m" lineNumber:2120 description:@"Trying to layout popover in the delegate callback popoverPresentationController:willRepositionPopoverToRect:inView: will lead to recursion. Do not force the popover's container view or an ancestor to layout in this callback."];
  }
  if (objc_opt_respondsToSelector())
  {
    BOOL v6 = [(UIPresentationController *)self barButtonItem];

    if (!v6)
    {
      double v7 = [(UIPresentationController *)self sourceView];
      [(UIPresentationController *)self sourceRect];
      double v15 = v8;
      double v16 = v9;
      double v17 = v10;
      double v18 = v11;
      *(_WORD *)&self->_popoverControllerFlags |= 0x80u;
      id v14 = v7;
      [v4 popoverPresentationController:self willRepositionPopoverToRect:&v15 inView:&v14];
      id v12 = v14;

      *(_WORD *)&self->_popoverControllerFlags &= ~0x80u;
      [(UIPresentationController *)self setSourceView:v12];
      -[UIPresentationController setSourceRect:](self, "setSourceRect:", v15, v16, v17, v18);
      preferredLayoutInfo = self->_preferredLayoutInfo;
      [(UIPopoverPresentationController *)self _sourceRectInContainerView];
      -[_UIPopoverLayoutInfo setSourceViewRect:](preferredLayoutInfo, "setSourceViewRect:");
    }
  }
LABEL_7:
}

- (void)_realSourceViewDidChangeFromView:(id)a3 toView:(id)a4
{
  id v5 = [(UIPopoverPresentationController *)self _sourceOverlayView];

  if (v5) {
    [(UIPopoverPresentationController *)self _updateSourceOverlayViewConstraints];
  }
  CGSize v6 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  self->_previousContainerViewRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  self->_previousContainerViewRect.size = v6;
  id v7 = [(UIPresentationController *)self containerView];
  [v7 setNeedsLayout];
}

- (int64_t)_preferredHorizontalAlignment
{
  return self->__preferredHorizontalAlignment;
}

- (id)_preferredAnimationControllerForPresentation
{
  [(UIPopoverPresentationController *)self _createHostManagerIfNeeded];
  int v3 = [(UIPopoverPresentationController *)self _metrics];
  int v4 = [v3 shouldUseVisualStyleAnimationControllerForPresentation];

  if (v4)
  {
    id v5 = [(UIPresentationController *)self _visualStyle];
    CGSize v6 = [v5 preferredAnimationControllerForPresentation:1];
  }
  else if ([(_UIPopoverHostManager *)self->_hostManager useDefaultPreferredAnimationControllerForPresentationWithPopoverWithIdentifier:self->_popoverIdentifier])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPopoverPresentationController;
    CGSize v6 = [(UIPresentationController *)&v8 _preferredAnimationControllerForPresentation];
  }
  else
  {
    CGSize v6 = objc_alloc_init(_UIModernPopoverAnimationController);
    [(_UIModernPopoverAnimationController *)v6 setPopoverPresentationController:self];
    [(_UIModernPopoverAnimationController *)v6 setPresenting:1];
  }
  return v6;
}

- (Class)_popoverLayoutInfoForChromeClass:(Class)a3
{
  objc_opt_class();
  int v3 = objc_opt_class();
  return (Class)v3;
}

- (id)_initialPresentationViewControllerForViewController:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least()
    && ![(UIPopoverPresentationController *)self _allowsSourceViewInDifferentWindowThanInitialPresentationViewController])
  {
    CGSize v6 = [(UIPresentationController *)self _realSourceView];
    id v7 = [v6 window];
    uint64_t v8 = [v4 _window];
    double v9 = (void *)v8;
    double v10 = 0;
    if (v8 && v7 && v7 != (void *)v8)
    {
      double v10 = [v6 _viewControllerForAncestor];
    }
    if (v10) {
      double v11 = v10;
    }
    else {
      double v11 = v4;
    }
    id v5 = v11;
  }
  else
  {
    id v5 = v4;
  }

  return v5;
}

- (BOOL)_forcesPreferredAnimationControllers
{
  return 1;
}

- (double)_cornerRadius
{
  return self->_cornerRadius;
}

- (UIEdgeInsets)_containingFrameInsets
{
  [(UIPopoverPresentationController *)self popoverLayoutMargins];
  double v6 = v3;
  double v8 = v7;
  double v9 = v4;
  double v10 = v5;
  if (v7 == 0.0 && v3 == 0.0 && v5 == 0.0 && v4 == 0.0)
  {
    [(id)objc_opt_class() _defaultPopoverLayoutMarginsForPopoverControllerStyle:self->_popoverControllerStyle andContentViewController:self->_contentViewController];
    double v6 = v11;
    double v8 = v12;
    double v9 = v13;
    double v10 = v14;
    double v15 = [(UIPopoverPresentationController *)self _popoverHostingWindow];
    int v16 = [v15 _isRemoteInputHostWindow];

    if (v16)
    {
      +[UIKeyboardImpl persistentOffset];
      double v18 = 0.0;
      if (v17 < 0.0)
      {
        double v19 = v17;
        double v20 = -v17;
        BOOL v21 = +[UIKeyboardImpl isSplit];
        double v18 = -100.0 - v19;
        if (!v21) {
          double v18 = v20;
        }
        if (v18 >= 200.0) {
          double v18 = 200.0;
        }
      }
      double v6 = v6 + v18;
    }
  }
  double v22 = v6;
  double v23 = v8;
  double v24 = v9;
  double v25 = v10;
  result.double right = v25;
  result.double bottom = v24;
  result.double left = v23;
  result.double top = v22;
  return result;
}

- (int64_t)_backgroundBlurEffectStyle
{
  return self->_backgroundBlurEffectStyle;
}

- (BOOL)_backgroundBlurDisabled
{
  return self->_backgroundBlurDisabled;
}

- (BOOL)_allowsSourceViewInDifferentWindowThanInitialPresentationViewController
{
  return self->__allowsSourceViewInDifferentWindowThanInitialPresentationViewController;
}

- (BOOL)_allowsFocusInPresentingViewController
{
  return self->__allowsFocusInPresentingViewController;
}

+ (Class)_popoverViewClass
{
  return (Class)objc_opt_class();
}

+ (UIEdgeInsets)_defaultPopoverLayoutMarginsForPopoverControllerStyle:(int64_t)a3 andContentViewController:(id)a4
{
  id v5 = a4;
  double v6 = v5;
  if (a3)
  {
    if (a3 == 1)
    {
      double v7 = [v5 view];
      [v7 bounds];
      double v8 = -CGRectGetWidth(v18);

      double v9 = [v6 view];
      int v10 = [v9 _shouldReverseLayoutDirection];

      if (v10) {
        double v11 = -1.0;
      }
      else {
        double v11 = v8;
      }
      if (!v10) {
        double v8 = -1.0;
      }
      double v12 = 0.0;
    }
    else
    {
      double v8 = 0.0;
      double v12 = 0.0;
      double v11 = 0.0;
    }
    double v13 = 0.0;
  }
  else
  {
    double v13 = 30.0;
    double v12 = 10.0;
    double v8 = 19.0;
    double v11 = 19.0;
  }

  double v14 = v13;
  double v15 = v11;
  double v16 = v12;
  double v17 = v8;
  result.double right = v17;
  result.double bottom = v16;
  result.double left = v15;
  result.double top = v14;
  return result;
}

- (UIPopoverPresentationController)init
{
  return 0;
}

- (void)dealloc
{
  v10[5] = *MEMORY[0x1E4F143B8];
  double v3 = (void *)MEMORY[0x18C108260](self, a2);
  double v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v10[0] = @"UIKeyboardWillShowNotification";
  v10[1] = @"UIKeyboardDidHideNotification";
  v10[2] = @"_UIScrollViewWillBeginDraggingNotification";
  v10[3] = @"_UIScrollViewDidEndDraggingNotification";
  v10[4] = @"UIFocusDidUpdateNotification";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:5];
  -[NSNotificationCenter _uiRemoveObserver:names:](v4, self, v5);

  [(_UIPopoverView *)self->_popoverView setPopoverController:0];
  [(UIDimmingView *)self->_dimmingView setDelegate:0];
  double v6 = [(UIGestureRecognizer *)self->_vendedGestureRecognizer view];
  [v6 removeGestureRecognizer:self->_vendedGestureRecognizer];

  [(UIGestureRecognizer *)self->_vendedGestureRecognizer removeTarget:self action:sel__swipe_];
  double v7 = [(UIGestureRecognizer *)self->_dimmingViewGestureRecognizer view];
  [v7 removeGestureRecognizer:self->_dimmingViewGestureRecognizer];

  [(UIGestureRecognizer *)self->_dimmingViewGestureRecognizer removeTarget:self action:sel__swipe_];
  [(UIPopoverPresentationController *)self _cancelDelayedFocusAutoDismiss];
  hostManager = self->_hostManager;
  self->_hostManager = 0;

  v9.receiver = self;
  v9.super_class = (Class)UIPopoverPresentationController;
  [(UIPresentationController *)&v9 dealloc];
}

- (void)_prepareForWindowDeallocRecursively:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UIPopoverPresentationController;
  [(UIPresentationController *)&v4 _prepareForWindowDeallocRecursively:a3];
  if (self->_hostManager)
  {
    if (objc_opt_respondsToSelector()) {
      [(_UIPopoverHostManager *)self->_hostManager dismissPopoverWithIdentifier:self->_popoverIdentifier];
    }
  }
}

- (void)setPopoverFrame:(CGRect)a3 animated:(BOOL)a4
{
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _presentationAnimationDuration];
  uint64_t v2 = *(void *)(a1 + 40);
  return +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 132, v2, 0);
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void **)(a1 + 32);
  return [v2 _runAlongsideAnimations];
}

uint64_t __73__UIPopoverPresentationController__setPopoverFrame_animated_coordinator___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _runAlongsideCompletionsAfterCommit];
}

- (CGSize)popoverContentSize
{
  double width = self->_popoverContentSize.width;
  double height = self->_popoverContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_clearCachedPopoverContentSize
{
  if (self->_popoverContentSize.width != *MEMORY[0x1E4F1DB30]
    || self->_popoverContentSize.height != *(double *)(MEMORY[0x1E4F1DB30] + 8))
  {
    -[UIPopoverPresentationController setPopoverContentSize:animated:](self, "setPopoverContentSize:animated:", 0);
  }
}

- (void)setPopoverContentSize:(CGSize)a3
{
}

- (void)setPopoverContentSize:(CGSize)a3 animated:(BOOL)a4
{
  if (!self->_popoverControllerStyle)
  {
    BOOL v4 = a4;
    double height = a3.height;
    double width = a3.width;
    self->_popoverContentSize = a3;
    double v8 = (void *)[(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo copy];
    objc_msgSend(v8, "setPreferredContentSize:", width, height);
    if ((*(_WORD *)&self->_popoverControllerFlags & 0x10) != 0 && self->_layoutConstraintView)
    {
      objc_super v9 = [(UIView *)self->_popoverView superview];
      objc_msgSend(v9, "convertRect:toView:", self->_layoutConstraintView, self->_targetRectInEmbeddingView.origin.x, self->_targetRectInEmbeddingView.origin.y, self->_targetRectInEmbeddingView.size.width, self->_targetRectInEmbeddingView.size.height);
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;
      double v17 = v16;

      objc_msgSend(v8, "setSourceViewRect:", v11, v13, v15, v17);
    }
    CGRect v18 = [(_UIPopoverView *)self->_popoverView backgroundView];
    double v19 = v18;
    if (v18)
    {
      [v18 _contentViewInsets];
      objc_msgSend(v8, "setContentInset:");
    }
    [(UIPopoverPresentationController *)self setPreferredLayoutInfo:v8];
    if ([(UIPopoverPresentationController *)self isPopoverVisible]
      || [(UIPopoverPresentationController *)self _isPresenting])
    {
      double v20 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];
      [v20 frame];
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;
      CGFloat v28 = v27;

      [(UIView *)self->_popoverView frame];
      v42.origin.double x = v29;
      v42.origin.double y = v30;
      v42.size.double width = v31;
      v42.size.double height = v32;
      v41.origin.double x = v22;
      v41.origin.double y = v24;
      v41.size.double width = v26;
      v41.size.double height = v28;
      if (!CGRectEqualToRect(v41, v42))
      {
        if (v4) {
          int v33 = ![(UIPopoverPresentationController *)self _isPresenting];
        }
        else {
          int v33 = 0;
        }
        v39[0] = 0;
        v39[1] = v39;
        v39[2] = 0x3032000000;
        v39[3] = __Block_byref_object_copy__52;
        v39[4] = __Block_byref_object_dispose__52;
        BOOL v34 = self;
        double v40 = v34;
        v37[0] = MEMORY[0x1E4F143A8];
        v37[1] = 3221225472;
        v37[2] = __66__UIPopoverPresentationController_setPopoverContentSize_animated___block_invoke;
        v37[3] = &unk_1E52E79E8;
        v37[4] = v39;
        *(CGFloat *)&v37[5] = v22;
        *(CGFloat *)&v37[6] = v24;
        *(CGFloat *)&v37[7] = v26;
        *(CGFloat *)&v37[8] = v28;
        char v38 = v33;
        double v35 = _Block_copy(v37);
        id v36 = v35;
        if (v33)
        {
          [(UIView *)self->_popoverView layoutBelowIfNeeded];
          [(UIPopoverPresentationController *)v34 _presentationAnimationDuration];
          +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0, v36, 0);
        }
        else
        {
          (*((void (**)(void *))v35 + 2))(v35);
        }

        _Block_object_dispose(v39, 8);
      }
    }
  }
}

uint64_t __66__UIPopoverPresentationController_setPopoverContentSize_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), "setPopoverFrame:animated:", *(unsigned __int8 *)(a1 + 72), *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (BOOL)isPopoverVisible
{
  return ![(UIPresentationController *)self dismissed];
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(UIColor *)backgroundColor
{
  id v5 = backgroundColor;
  if (self->_backgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_backgroundColor, backgroundColor);
    [(_UIPopoverView *)self->_popoverView setPopoverBackgroundColor:v5];
  }
}

- (void)_setBackgroundBlurDisabled:(BOOL)a3
{
  if (self->_backgroundBlurDisabled != a3)
  {
    self->_backgroundBlurDisabled = a3;
    id v4 = [(_UIPopoverView *)self->_popoverView backgroundView];
    [v4 _setChromeHidden:self->_backgroundBlurDisabled];
  }
}

- (void)_setBackgroundBlurEffectStyle:(int64_t)a3
{
  if (self->_backgroundBlurEffectStyle != a3)
  {
    self->_backgroundBlurEffectStyle = a3;
    -[_UIPopoverView setBackgroundBlurEffectStyle:](self->_popoverView, "setBackgroundBlurEffectStyle:");
  }
}

- (UIDimmingView)dimmingView
{
  return (UIDimmingView *)self->_dimmingView;
}

- (int)_presentationState
{
  return self->_presentationState;
}

- (void)_setPresentationState:(int)a3
{
  self->_presentationState = a3;
}

- (unint64_t)_slideTransitionCount
{
  return self->_slideTransitionCount;
}

- (void)_incrementSlideTransitionCount:(BOOL)a3
{
  if (a3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    if (!self->_slideTransitionCount)
    {
      double v6 = [MEMORY[0x1E4F28B00] currentHandler];
      [v6 handleFailureInMethod:a2 object:self file:@"UIPopoverPresentationController.m" lineNumber:736 description:@"About to overflow slide transition count"];
    }
    uint64_t v4 = -1;
  }
  self->_slideTransitionCount += v4;
}

- (void)_resetSlideTransitionCount
{
  self->_slideTransitionCount = 0;
}

- (void)_invalidateLayoutInfo
{
  preferredLayoutInfo = self->_preferredLayoutInfo;
  self->_preferredLayoutInfo = 0;
}

- (CGPoint)_centerPointForScale:(double)a3 frame:(CGRect)a4 anchor:(CGPoint)a5
{
  double v5 = round(a4.origin.x + a4.size.width * 0.5 * a3 - (a3 + -1.0) * a5.x);
  double v6 = a4.size.height * 0.5 * a3 + round(a4.origin.y - (a3 + -1.0) * a5.y);
  double v7 = v5;
  result.double y = v6;
  result.double x = v7;
  return result;
}

- (id)popoverView
{
  return self->_popoverView;
}

- (id)shadowView
{
  return self->_shadowView;
}

- (id)_backgroundView
{
  return [(_UIPopoverView *)self->_popoverView backgroundView];
}

- (BOOL)_isShimmingPopoverControllerPresentation
{
  uint64_t v2 = [(UIPresentationController *)self delegate];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)_arrowOffset
{
  [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo arrowOffset];
  return result;
}

- (void)_setArrowOffset:(double)a3
{
  -[_UIPopoverLayoutInfo setArrowOffset:](self->_preferredLayoutInfo, "setArrowOffset:");
  popoverView = self->_popoverView;
  [(_UIPopoverView *)popoverView setArrowOffset:a3];
}

- (CGSize)_currentPopoverContentSize
{
  popoverView = self->_popoverView;
  if (popoverView)
  {
    double v3 = [(_UIPopoverView *)popoverView contentView];
    [v3 bounds];
    double v5 = v4;
    double v7 = v6;
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v7 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v8 = v5;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (double)_presentationAnimationDuration
{
  return dbl_186B94100[self->_popoverControllerStyle == 1];
}

- (void)_performHierarchyCheckOnViewController:(id)a3
{
  double v6 = (id *)a3;
  double v4 = -[UIViewController _parentViewController](v6);
  if (v4)
  {
    double v3 = -[UIViewController _parentViewController](v6);
    if (([v3 _optsOutOfPopoverControllerHierarchyCheck] & 1) == 0)
    {

LABEL_7:
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3A8] format:@"The content view controller argument must be the root of its associated view controller hierarchy."];
      goto LABEL_8;
    }
  }
  double v5 = [v6 _parentModalViewController];

  if (v4)
  {
  }
  if (v5) {
    goto LABEL_7;
  }
LABEL_8:
}

- (int64_t)_popoverControllerStyle
{
  return self->_popoverControllerStyle;
}

- (BOOL)_manuallyHandlesContentViewControllerAppearanceCalls
{
  return self->_popoverControllerStyle == 1;
}

- (id)arrowBackgroundColor
{
  return self->_arrowBackgroundColor;
}

- (void)setArrowBackgroundColor:(id)a3
{
  double v5 = (UIColor *)a3;
  if (self->_arrowBackgroundColor != v5)
  {
    objc_storeStrong((id *)&self->_arrowBackgroundColor, a3);
    [(_UIPopoverView *)self->_popoverView setArrowBackgroundColor:v5];
  }
}

- (id)_lowerWindowDismissalGestureViews
{
  return [(UIDimmingView *)self->_dimmingView lowerWindowDismissalGestureViews];
}

- (void)_setLowerWindowDismissalGestureViews:(id)a3
{
}

- (void)_setCornerRadius:(double)a3
{
  if (self->_cornerRadius != a3)
  {
    self->_cornerRadius = a3;
    -[_UIPopoverView _setCustomCornerRadius:](self->_popoverView, "_setCustomCornerRadius:");
  }
}

- (void)_setAllowDismissalTapsToPassThrough:(BOOL)a3
{
  if (self->_allowDismissalTapsToPassThrough != a3)
  {
    self->_allowDismissalTapsToPassThrough = a3;
    -[_UIPopoverDimmingView setPassThroughDismissalTaps:](self->_dimmingView, "setPassThroughDismissalTaps:");
  }
}

- (int64_t)_popoverBackgroundStyle
{
  return self->_popoverBackgroundStyle;
}

- (void)_setContentViewController:(id)a3 backgroundStyle:(int64_t)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  self->_popoverBackgroundStyle = a4;
  uint64_t v12 = 0;
  double v13 = &v12;
  uint64_t v14 = 0x3032000000;
  double v15 = __Block_byref_object_copy__52;
  double v16 = __Block_byref_object_dispose__52;
  double v9 = self;
  double v17 = v9;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__UIPopoverPresentationController__setContentViewController_backgroundStyle_animated___block_invoke;
  v11[3] = &unk_1E52E7A10;
  v11[4] = &v12;
  v11[5] = a4;
  double v10 = (void (**)(void))_Block_copy(v11);
  [(id)v13[5] _setContentViewController:v8 animated:v5];
  if (v5)
  {
    [(UIPopoverPresentationController *)v9 _presentationAnimationDuration];
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 4, v10, 0);
  }
  else
  {
    v10[2](v10);
  }

  _Block_object_dispose(&v12, 8);
}

uint64_t __86__UIPopoverPresentationController__setContentViewController_backgroundStyle_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) _setPopoverBackgroundStyle:*(void *)(a1 + 40)];
}

- (void)_presentedViewControllerUserInterfaceStyleChanged
{
  double v3 = [(UIPresentationController *)self presentedViewController];
  popoverView = self->_popoverView;
  id v8 = v3;
  BOOL v5 = [v3 traitCollection];
  -[UIView setOverrideUserInterfaceStyle:](popoverView, "setOverrideUserInterfaceStyle:", [v5 userInterfaceStyle]);

  if (self->_popoverIdentifier && self->_hostManager && (objc_opt_respondsToSelector() & 1) != 0)
  {
    hostManager = self->_hostManager;
    double v7 = [v8 traitCollection];
    -[_UIPopoverHostManager updateUserInterfaceStyle:forPopoverWithIdentifier:](hostManager, "updateUserInterfaceStyle:forPopoverWithIdentifier:", [v7 userInterfaceStyle], self->_popoverIdentifier);
  }
}

- (id)_completionBlockForDismissalWhenNotifyingDelegate:(BOOL)a3
{
  BOOL v5 = self->_dimmingView;
  double v6 = self->_dimmingViewGestureRecognizer;
  double v7 = self->_popoverView;
  id v8 = self;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__UIPopoverPresentationController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke;
  aBlock[3] = &unk_1E52E7A38;
  double v17 = v6;
  CGRect v18 = v5;
  BOOL v21 = a3;
  double v19 = v7;
  double v20 = v8;
  double v9 = v8;
  double v10 = v7;
  double v11 = v5;
  uint64_t v12 = v6;
  double v13 = _Block_copy(aBlock);
  uint64_t v14 = _Block_copy(v13);

  return v14;
}

void __85__UIPopoverPresentationController__completionBlockForDismissalWhenNotifyingDelegate___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (!v2 || [v2 state] != 1 && objc_msgSend(*(id *)(a1 + 32), "state") != 2) {
    [*(id *)(a1 + 40) removeFromSuperview];
  }
  [*(id *)(a1 + 48) removeFromSuperview];
  if (*(unsigned char *)(a1 + 64)) {
    [*(id *)(a1 + 56) _sendDidDismiss];
  }
  [*(id *)(a1 + 56) _setPresentationState:4];
  [*(id *)(a1 + 56) _setPopoverView:0];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIAlertDidDisappearNotification" object:*(void *)(a1 + 56) userInfo:0];
  [v3 postNotificationName:@"UIPopoverControllerDidDismissPopoverNotification" object:*(void *)(a1 + 56) userInfo:0];
}

- (void)_postludeForDismissal
{
  [(UIPopoverPresentationController *)self setPreferredLayoutInfo:0];
  [(UIPopoverPresentationController *)self _stopWatchingForNotifications];
  if (self->_showsTargetRect)
  {
    id v3 = [(UIPopoverPresentationController *)self _targetRectView];
    [v3 removeFromSuperview];
  }
  if (self->_showsOrientationMarker)
  {
    double v4 = [(UIView *)self->_dimmingView viewWithTag:4277268722];
    [v4 removeFromSuperview];
  }
  if (self->_showsPresentationArea)
  {
    BOOL v5 = [(UIView *)self->_dimmingView viewWithTag:4277268723];
    [v5 removeFromSuperview];
  }
  *(_WORD *)&self->_popoverControllerFlags &= ~8u;
  if (self->_retainsSelfWhilePresented)
  {
    retainedSelf = self->_retainedSelf;
    self->_retainedSelf = 0;
  }
}

- (BOOL)_popoverIsDismissingBecauseDismissInteractionOccurred
{
  return self->_shouldSendDidDismiss;
}

- (BOOL)dimmingViewWasTapped:(id)a3 withDismissCompletion:(id)a4
{
  return [(UIPopoverPresentationController *)self _attemptDismissalWithCompletion:a4];
}

- (void)_setAllowsFocusInPresentingViewController:(BOOL)a3
{
  BOOL v3 = a3;
  self->__allowsFocusInPresentingViewController = a3;
  BOOL v5 = [(UIPresentationController *)self containerView];
  id v7 = [v5 _focusBehavior];

  if (([v7 supportsViewTransparency] & 1) == 0)
  {
    double v6 = [(UIPresentationController *)self containerView];
    [v6 _setFocusInteractionEnabled:v3 ^ 1];
  }
  if ([v7 autoDismissesPopoverControllersOnFocusIntersection])
  {
    [(UIPopoverPresentationController *)self _updateShouldObserveFocusUpdateNotification:v3];
    if (v3) {
      [(UIPopoverPresentationController *)self _autoDismissIfFocusedItemSufficientlyIntersectsPresentedView];
    }
  }
}

- (void)_updateShouldObserveFocusUpdateNotification:(BOOL)a3
{
  if (a3)
  {
    if ((*(_WORD *)&self->_popoverControllerFlags & 0x100) != 0) {
      return;
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:self selector:sel__observeFocusDidUpdateNotification_ name:@"UIFocusDidUpdateNotification" object:0];
  }
  else
  {
    if ((*(_WORD *)&self->_popoverControllerFlags & 0x100) == 0) {
      return;
    }
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self name:@"UIFocusDidUpdateNotification" object:0];
  }
}

- (void)_observeFocusDidUpdateNotification:(id)a3
{
  id v11 = a3;
  [(UIPopoverPresentationController *)self _cancelDelayedFocusAutoDismiss];
  BOOL v4 = [(UIPopoverPresentationController *)self _shouldAutoDismissOnFocusedItemIntersection];
  BOOL v5 = v11;
  if (v4)
  {
    double v6 = [v11 userInfo];
    id v7 = [v6 objectForKeyedSubscript:@"UIFocusUpdateContextKey"];

    id v8 = [v7 nextFocusedItem];
    if ([(UIPopoverPresentationController *)self _focusedItemFrameIntersectsSufficientlyWithPresentedView:v8])
    {
      int v9 = _UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusPopoverAutoDismissDelay, @"FocusPopoverAutoDismissDelay", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble);
      double v10 = *(double *)&qword_1E8FD5080;
      if (v9) {
        double v10 = 0.3;
      }
      [(UIPopoverPresentationController *)self performSelector:sel__autoDismissIfFocusedItemSufficientlyIntersectsPresentedView withObject:0 afterDelay:v10];
    }

    BOOL v5 = v11;
  }
}

- (void)_cancelDelayedFocusAutoDismiss
{
  BOOL v3 = objc_opt_class();
  [v3 cancelPreviousPerformRequestsWithTarget:self selector:sel__autoDismissIfFocusedItemSufficientlyIntersectsPresentedView object:0];
}

- (void)_autoDismissIfFocusedItemSufficientlyIntersectsPresentedView
{
  [(UIPopoverPresentationController *)self _cancelDelayedFocusAutoDismiss];
  if ([(UIPopoverPresentationController *)self _shouldAutoDismissOnFocusedItemIntersection])
  {
    BOOL v3 = +[UIFocusSystem focusSystemForEnvironment:self];
    id v5 = [v3 focusedItem];

    if ([(UIPopoverPresentationController *)self _focusedItemFrameIntersectsSufficientlyWithPresentedView:v5]&& [(UIPresentationController *)self _shouldDismiss])
    {
      BOOL v4 = [(UIPresentationController *)self presentedViewController];
      [v4 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

- (BOOL)_shouldAutoDismissOnFocusedItemIntersection
{
  BOOL v3 = [(UIPopoverPresentationController *)self _allowsFocusInPresentingViewController];
  if (v3)
  {
    LOBYTE(v3) = [(UIPresentationController *)self presented];
  }
  return v3;
}

- (BOOL)_focusedItemFrameIntersectsSufficientlyWithPresentedView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(UIPresentationController *)self presentedViewController];
    double v6 = [v5 _existingView];

    if (!v6) {
      goto LABEL_13;
    }
    double v7 = _UIFocusItemFrameInCoordinateSpace(v4, v6);
    CGFloat v9 = v8;
    double v11 = v10;
    double v13 = v12;
    [v6 bounds];
    v29.origin.CGFloat x = v14;
    v29.origin.CGFloat y = v15;
    v29.size.double width = v16;
    v29.size.double height = v17;
    v26.origin.CGFloat x = v7;
    v26.origin.CGFloat y = v9;
    v26.size.double width = v11;
    v26.size.double height = v13;
    CGRect v27 = CGRectIntersection(v26, v29);
    CGFloat x = v27.origin.x;
    CGFloat y = v27.origin.y;
    double width = v27.size.width;
    double height = v27.size.height;
    if (_UIInternalPreferenceUsesDefault((int *)&_UIInternalPreference_FocusPopoverAutoDismissIntersectionThreshold, @"FocusPopoverAutoDismissIntersectionThreshold", (uint64_t (*)(_DWORD *))_UIInternalPreferenceUpdateDouble))double v22 = 5.0; {
    else
    }
      double v22 = *(double *)&qword_1E8FD5070;
    if (v13 >= v22) {
      double v13 = v22;
    }
    v28.origin.CGFloat x = x;
    v28.origin.CGFloat y = y;
    v28.size.double width = width;
    v28.size.double height = height;
    if (!CGRectIsNull(v28) && (v11 >= v22 ? (double v23 = v22) : (double v23 = v11), width >= v23)) {
      BOOL v24 = height >= v13;
    }
    else {
LABEL_13:
    }
      BOOL v24 = 0;
  }
  else
  {
    BOOL v24 = 0;
  }

  return v24;
}

- (BOOL)popoverDimmingViewShouldAllowInteraction:(id)a3
{
  uint64_t v4 = [(UIPresentationController *)self _childPresentationController];
  if (v4)
  {
    id v5 = (void *)v4;
    while (([v5 shouldPresentInFullscreen] & 1) == 0)
    {
      uint64_t v6 = [v5 _childPresentationController];

      id v5 = (void *)v6;
      if (!v6) {
        goto LABEL_5;
      }
    }

    return 0;
  }
  else
  {
LABEL_5:
    return [(UIPresentationController *)self presented];
  }
}

- (BOOL)popoverDimmingViewDidReceiveDismissalInteraction:(id)a3
{
  return [(UIPopoverPresentationController *)self dimmingViewWasTapped:a3 withDismissCompletion:0];
}

- (void)_setGesturesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  -[UIGestureRecognizer setEnabled:](self->_vendedGestureRecognizer, "setEnabled:");
  dimmingViewGestureRecognizer = self->_dimmingViewGestureRecognizer;
  [(UIGestureRecognizer *)dimmingViewGestureRecognizer setEnabled:v3];
}

+ (BOOL)_forceAttemptsToAvoidKeyboard
{
  if (qword_1EB25D778 != -1) {
    dispatch_once(&qword_1EB25D778, &__block_literal_global_63_0);
  }
  return byte_1EB25D769;
}

void __64__UIPopoverPresentationController__forceAttemptsToAvoidKeyboard__block_invoke()
{
  _UIKitPreferencesOnce();
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = [v1 objectForKey:@"UIPopoverControllerForceAttemptsToAvoidKeyboard"];
  byte_1EB25D769 = [v0 BOOLValue];
}

uint64_t __59__UIPopoverPresentationController_setPopoverLayoutMargins___block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)v1[58];
  [v1 _containingFrameInsets];
  return objc_msgSend(v2, "setContainingFrameInsets:");
}

- (void)_moveAwayFromTheKeyboard:(id)a3 showing:(BOOL)a4
{
  if ((*(_WORD *)&self->_popoverControllerFlags & 0x40) == 0)
  {
    BOOL v4 = a4;
    popoverView = self->_popoverView;
    id v7 = a3;
    [(UIView *)popoverView layoutIfNeeded];
    double v8 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];
    CGFloat v9 = [v7 objectForKey:@"UIKeyboardAnimationDurationUserInfoKey"];

    if (v9)
    {
      [v9 doubleValue];
      double v11 = v10;
    }
    else
    {
      double v11 = 0.0;
    }
    double v12 = [(UIPresentationController *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      [v8 frame];
      if ([v12 _popoverPresentationController:self shouldRecalculateArrowDirectionOnKeyboardVisibilityChange:v4 proposedHeight:v13])
      {
        CGSize v14 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
        self->_previousContainerViewRect.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
        self->_previousContainerViewRect.size = v14;
        if (v11 == 0.0)
        {
          [(UIPopoverPresentationController *)self _presentationAnimationDuration];
          double v11 = v15;
        }
        [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo setPreferredArrowDirections:self->_permittedArrowDirections];
        uint64_t v16 = [(UIPopoverPresentationController *)self _layoutInfoForCurrentKeyboardState];

        double v8 = (void *)v16;
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke;
    aBlock[3] = &unk_1E52E7A60;
    double v23 = v11;
    void aBlock[4] = self;
    id v22 = v8;
    id v17 = v8;
    CGRect v18 = (void (**)(void *, void))_Block_copy(aBlock);
    double v19 = [(UIPresentationController *)self presentedViewController];
    double v20 = [v19 _transitionCoordinator];

    if (v20)
    {
      if ([v20 isInteractive]) {
        [v20 notifyWhenInteractionChangesUsingBlock:v18];
      }
      else {
        [v20 animateAlongsideTransition:0 completion:v18];
      }
    }
    else
    {
      v18[2](v18, 0);
    }
  }
}

void __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke(double *a1)
{
  double v1 = a1[6];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke_2;
  v3[3] = &unk_1E52D9F98;
  uint64_t v2 = (void *)*((void *)a1 + 5);
  *(double *)&v3[4] = a1[4];
  id v4 = v2;
  +[UIView animateWithDuration:132 delay:v3 options:0 animations:v1 completion:0.0];
}

uint64_t __68__UIPopoverPresentationController__moveAwayFromTheKeyboard_showing___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  BOOL v3 = (void *)v2[45];
  if ([v2 _shouldHideArrow]) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = [*(id *)(a1 + 40) arrowDirection];
  }
  [v3 setArrowDirection:v4];
  id v5 = *(void **)(*(void *)(a1 + 32) + 360);
  [*(id *)(a1 + 40) frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  [*(id *)(a1 + 40) offset];
  return objc_msgSend(v5, "_setFrame:arrowOffset:", v7, v9, v11, v13, v14);
}

- (void)_keyboardWillShow:(id)a3
{
  id v4 = a3;
  [(UIPopoverPresentationController *)self _sendDelegateWillRepositionToRect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __53__UIPopoverPresentationController__keyboardWillShow___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __53__UIPopoverPresentationController__keyboardWillShow___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  [v1 _moveAwayFromTheKeyboard:v2 showing:1];
}

- (void)_keyboardDidHide:(id)a3
{
  id v4 = a3;
  [(UIPopoverPresentationController *)self _sendDelegateWillRepositionToRect];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __52__UIPopoverPresentationController__keyboardDidHide___block_invoke;
  v6[3] = &unk_1E52D9F98;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __52__UIPopoverPresentationController__keyboardDidHide___block_invoke(uint64_t a1)
{
  double v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) userInfo];
  [v1 _moveAwayFromTheKeyboard:v2 showing:0];
}

- (void)_stopWatchingForKeyboardNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"UIKeyboardWillShowNotification" object:0];
  [v3 removeObserver:self name:@"UIKeyboardDidHideNotification" object:0];
}

- (void)_scrollViewWillBeginDragging:(id)a3
{
  popoverView = self->_popoverView;
  id v5 = [a3 object];
  if (popoverView)
  {
    id v9 = v5;
    int v6 = [v5 isDescendantOfView:popoverView];

    if (v6)
    {
      unsigned int draggingChildScrollViewCount = self->draggingChildScrollViewCount;
      if (!draggingChildScrollViewCount)
      {
        if ([(UIDimmingView *)self->_dimmingView ignoresTouches]) {
          __int16 v8 = 4;
        }
        else {
          __int16 v8 = 0;
        }
        *(_WORD *)&self->_popoverControllerFlags = *(_WORD *)&self->_popoverControllerFlags & 0xFFFB | v8;
        [(UIDimmingView *)self->_dimmingView setIgnoresTouches:1];
        unsigned int draggingChildScrollViewCount = self->draggingChildScrollViewCount;
      }
      self->unsigned int draggingChildScrollViewCount = draggingChildScrollViewCount + 1;
    }
  }
  else
  {
  }
}

- (void)_scrollViewDidEndDragging:(id)a3
{
  id v4 = [a3 object];
  id v5 = v4;
  if (self->_popoverView)
  {
    __int16 v8 = v4;
    int v6 = objc_msgSend(v4, "isDescendantOfView:");
    id v5 = v8;
    if (v6)
    {
      unsigned int v7 = self->draggingChildScrollViewCount - 1;
      self->unsigned int draggingChildScrollViewCount = v7;
      if (!v7)
      {
        [(UIDimmingView *)self->_dimmingView setIgnoresTouches:(*(_WORD *)&self->_popoverControllerFlags >> 2) & 1];
        id v5 = v8;
      }
    }
  }
}

- (void)_stopWatchingForScrollViewNotifications
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self name:@"_UIScrollViewWillBeginDraggingNotification" object:0];
  [v3 removeObserver:self name:@"_UIScrollViewDidEndDraggingNotification" object:0];
}

- (UISheetPresentationController)adaptiveSheetPresentationController
{
  adaptiveSheetPresentationController = self->_adaptiveSheetPresentationController;
  if (!adaptiveSheetPresentationController)
  {
    id v4 = [_UIFormSheetPresentationController alloc];
    id v5 = [(UIPresentationController *)self presentedViewController];
    int v6 = [(UIPresentationController *)self presentingViewController];
    unsigned int v7 = [(UISheetPresentationController *)v4 initWithPresentedViewController:v5 presentingViewController:v6];
    __int16 v8 = self->_adaptiveSheetPresentationController;
    self->_adaptiveSheetPresentationController = v7;

    adaptiveSheetPresentationController = self->_adaptiveSheetPresentationController;
  }
  return adaptiveSheetPresentationController;
}

- (id)_adaptiveFormSheetPresentationController
{
  return self->_adaptiveSheetPresentationController;
}

- (BOOL)_ignoresKeyboardNotifications
{
  return self->_ignoresKeyboardNotifications;
}

- (void)_setIgnoresKeyboardNotifications:(BOOL)a3
{
  if (self->_ignoresKeyboardNotifications != a3)
  {
    self->_ignoresKeyboardNotifications = a3;
    if (a3)
    {
      [(UIPopoverPresentationController *)self _stopWatchingForKeyboardNotifications];
      if (UIKeyboardAutomaticIsOnScreen())
      {
        popoverView = self->_popoverView;
        [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo frame];
        double v6 = v5;
        double v8 = v7;
        double v10 = v9;
        double v12 = v11;
        [(_UIPopoverLayoutInfo *)self->_preferredLayoutInfo offset];
        -[_UIPopoverView _setFrame:arrowOffset:](popoverView, "_setFrame:arrowOffset:", v6, v8, v10, v12, v13);
      }
    }
    else if ([(UIPopoverPresentationController *)self _attemptsToAvoidKeyboard])
    {
      [(UIPopoverPresentationController *)self _startWatchingForKeyboardNotificationsIfNecessary];
      if (UIKeyboardAutomaticIsOnScreen())
      {
        [(UIPopoverPresentationController *)self _moveAwayFromTheKeyboard:0 showing:0];
      }
    }
  }
}

- (BOOL)_overrideAllowsHitTestingOnBackgroundViews
{
  return self->_overrideAllowsHitTestingOnBackgroundViews;
}

- (void)_setOverrideAllowsHitTestingOnBackgroundViews:(BOOL)a3
{
  BOOL v3 = a3;
  self->_BOOL overrideAllowsHitTestingOnBackgroundViews = a3;
  double v5 = [(UIView *)self->_dimmingView layer];
  [v5 setAllowsHitTesting:v3];

  BOOL overrideAllowsHitTestingOnBackgroundViews = self->_overrideAllowsHitTestingOnBackgroundViews;
  double v7 = [(UIView *)self->_shadowView layer];
  [v7 setAllowsHitTesting:overrideAllowsHitTestingOnBackgroundViews];

  dimmingView = self->_dimmingView;
  BOOL v9 = self->_overrideAllowsHitTestingOnBackgroundViews;
  [(_UIPopoverDimmingView *)dimmingView _setOverrideAllowsHitTestingOnTouchFallbackView:v9];
}

- (void)_stopWatchingForNotifications
{
  [(UIPopoverPresentationController *)self _stopWatchingForKeyboardNotifications];
  [(UIPopoverPresentationController *)self _stopWatchingForScrollViewNotifications];
}

- (BOOL)_fallbackShouldDismiss
{
  BOOL v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if ([(UIPresentationController *)self presented]
      && ![(UIPresentationController *)self dismissing])
    {
      char v4 = [v3 popoverPresentationControllerShouldDismissPopover:self];
    }
    else
    {
      char v4 = 0;
    }
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (void)_sendFallbackWillDismiss
{
  id v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 popoverPresentationControllerWillDismissPopover:self];
  }
}

- (void)_sendFallbackDidDismiss
{
  id v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 popoverPresentationControllerDidDismissPopover:self];
  }
}

- (BOOL)_isPresenting
{
  return self->_presentationState == 1;
}

- (BOOL)_isDismissing
{
  return self->_presentationState == 3;
}

- (BOOL)isPresentingOrDismissing
{
  if ([(UIPopoverPresentationController *)self _isPresenting]) {
    return 1;
  }
  return [(UIPopoverPresentationController *)self _isDismissing];
}

- (BOOL)_embedsInView
{
  return (*(_WORD *)&self->_popoverControllerFlags >> 4) & 1;
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  return 0;
}

- (id)_dimmingView
{
  return self->_dimmingView;
}

- (id)_presentationView
{
  if ([(_UIPopoverHostManager *)self->_hostManager useDefaultPresentationViewForPopoverWithIdentifier:self->_popoverIdentifier])
  {
    v6.receiver = self;
    v6.super_class = (Class)UIPopoverPresentationController;
    id v3 = [(UIPresentationController *)&v6 _presentationView];
  }
  else
  {
    popoverView = self->_popoverView;
    if (popoverView) {
      id v3 = popoverView->_contentView;
    }
    else {
      id v3 = 0;
    }
  }
  return v3;
}

- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop
{
  id v2 = [(UIPopoverPresentationController *)self _passthroughViews];
  BOOL v3 = [v2 count] == 0;

  return v3;
}

- (id)_exceptionStringForNilSourceViewOrBarButtonItem
{
  return (id)[NSString stringWithFormat:@"UIPopoverPresentationController (%@) should have a non-nil sourceView or barButtonItem set before the presentation occurs.", self];
}

uint64_t __66__UIPopoverPresentationController_presentationTransitionWillBegin__block_invoke_3(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 360) setChromeHidden:0];
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  char v4 = [(UIView *)self->_popoverView layer];
  [v4 setAllowsGroupOpacity:1];

  self->_presentationState = 2;
  if (objc_opt_respondsToSelector())
  {
    hostManager = self->_hostManager;
    popoverIdentifier = self->_popoverIdentifier;
    [(_UIPopoverHostManager *)hostManager transitionDidEnd:1 popoverIdentifier:popoverIdentifier];
  }
}

- (void)dismissalTransitionWillBegin
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(UIPopoverPresentationController *)self _createHostManagerIfNeeded];
  BOOL shouldSendDidDismiss = self->_shouldSendDidDismiss;
  targetBarButtonItem = self->_targetBarButtonItem;
  if (targetBarButtonItem)
  {
    self->_targetBarButtonItem = 0;
  }
  layoutConstraintView = self->_layoutConstraintView;
  if (layoutConstraintView)
  {
    self->_layoutConstraintView = 0;
  }
  if (self->_hostManager)
  {
    double v7 = [(UIPopoverPresentationController *)self _hostManagerPopoverCloseConfiguration];
    double v8 = [(UIPresentationController *)self presentingViewController];
    BOOL v9 = [v8 _transitionCoordinator];
    [v7 setTransitionCoordinator:v9];

    [(_UIPopoverHostManager *)self->_hostManager closePopoverWithIdentifier:self->_popoverIdentifier configuration:v7];
    double v10 = [v7 transitionCoordinator];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke;
    v35[3] = &unk_1E52E7B28;
    void v35[4] = self;
    BOOL v36 = shouldSendDidDismiss;
    [v10 animateAlongsideTransition:0 completion:v35];
  }
  else if (self->_popoverView)
  {
    self->_presentationState = 3;
    objc_initWeak(&location, self->_popoverView);
    double v11 = [(UIView *)self->_popoverView window];
    if (os_variant_has_internal_diagnostics())
    {
      if (!v11)
      {
        id v22 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
        {
          popoverView = self->_popoverView;
          *(_DWORD *)buf = 138412290;
          char v38 = popoverView;
          _os_log_fault_impl(&dword_1853B0000, v22, OS_LOG_TYPE_FAULT, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
        }
      }
    }
    else if (!v11)
    {
      double v23 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &dismissalTransitionWillBegin___s_category) + 8);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        BOOL v24 = self->_popoverView;
        *(_DWORD *)buf = 138412290;
        char v38 = v24;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Expected window when dismissing popover view in order to set rasterization scale. Using mainScreen scale instead. popoverView = %@", buf, 0xCu);
      }
    }
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_108;
    aBlock[3] = &unk_1E52D9F70;
    void aBlock[4] = self;
    double v12 = _Block_copy(aBlock);
    [(UIView *)self->_dimmingView setUserInteractionEnabled:0];
    double v13 = [(UIPopoverPresentationController *)self _completionBlockForDismissalWhenNotifyingDelegate:shouldSendDidDismiss];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2;
    v31[3] = &unk_1E52DA110;
    id v14 = v13;
    id v32 = v14;
    double v15 = _Block_copy(v31);
    uint64_t v16 = [(UIView *)self->_popoverView layer];
    if (v11)
    {
      id v17 = [v11 screen];
      [v17 scale];
    }
    else
    {
      id v17 = [(UIPresentationController *)self presentedViewController];
      id v2 = [v17 _screen];
      [v2 scale];
    }
    objc_msgSend(v16, "setRasterizationScale:");
    if (!v11) {

    }
    CGRect v18 = [(UIPresentationController *)self presentingViewController];
    double v19 = [v18 _definiteTransitionCoordinator];
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    CGRect v28 = __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_3;
    CGRect v29 = &unk_1E52DA110;
    id v20 = v12;
    id v30 = v20;
    [v19 animateAlongsideTransition:&v26 completion:v15];

    BOOL v21 = [(UIView *)self->_popoverView layer];
    [v21 setAllowsGroupOpacity:0];

    objc_destroyWeak(&location);
  }
}

void __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = a1;
  uint64_t v3 = *(void *)(a1 + 32);
  char v4 = *(void **)(v3 + 664);
  *(void *)(v3 + 664) = 0;
  id v5 = a2;

  objc_super v6 = [*(id *)(v2 + 32) _completionBlockForDismissalWhenNotifyingDelegate:*(unsigned __int8 *)(v2 + 40)];
  LODWORD(v2) = [v5 isCancelled];

  v6[2](v6, v2 ^ 1);
}

void __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_108(uint64_t a1)
{
  double v1 = *(void **)(*(void *)(a1 + 32) + 368);
  id v2 = +[UIColor clearColor];
  [v1 setBackgroundColor:v2];
}

uint64_t __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = [a2 isCancelled] ^ 1;
  char v4 = *(uint64_t (**)(uint64_t, uint64_t))(v2 + 16);
  return v4(v2, v3);
}

uint64_t __63__UIPopoverPresentationController_dismissalTransitionWillBegin__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  if (self->_useSourceViewBoundsAsSourceRect)
  {
    self->_useSourceViewBoundsAsSourceRect = 0;
    [(UIPresentationController *)self setSourceView:0];
  }
  if (objc_opt_respondsToSelector()) {
    [(_UIPopoverHostManager *)self->_hostManager transitionDidEnd:0 popoverIdentifier:self->_popoverIdentifier];
  }
  [(UIPopoverPresentationController *)self _postludeForDismissal];
  [(UIPopoverPresentationController *)self _setPopoverView:0];
  self->_BOOL shouldSendDidDismiss = 0;
}

- (void)_transitionFromWillBegin
{
  *(_WORD *)&self->_popoverControllerFlags |= 0x40u;
  [(UIPopoverPresentationController *)self dismissalTransitionWillBegin];
}

- (void)_transitionFromDidEnd
{
  *(_WORD *)&self->_popoverControllerFlags &= ~0x40u;
  [(UIPopoverPresentationController *)self dismissalTransitionDidEnd:1];
}

- (void)_transitionToWillBegin
{
  *(_WORD *)&self->_popoverControllerFlags |= 0x40u;
  [(UIPopoverPresentationController *)self _sendDelegateWillRepositionToRect];
  [(UIPopoverPresentationController *)self presentationTransitionWillBegin];
}

- (void)_transitionToDidEnd
{
  uint64_t v3 = [(UIPresentationController *)self containerView];
  [v3 setNeedsLayout];

  *(_WORD *)&self->_popoverControllerFlags &= ~0x40u;
  [(UIPresentationController *)self _updateRealSourceView];
}

- (BOOL)_attemptDismissalWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(UIPresentationController *)self presented]
    && !self->_shouldSendDidDismiss
    && [(UIPresentationController *)self _shouldDismiss]
    && (self->_BOOL shouldSendDidDismiss = 1, [(UIPresentationController *)self presented]))
  {
    id v5 = [(UIPresentationController *)self presentingViewController];
    BOOL v6 = 1;
    [v5 dismissViewControllerAnimated:1 completion:v4];

    [(UIPresentationController *)self _sendWillDismiss];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_presentingViewControllerWindowSceneDidUpdateEffectiveGeometry:(id)a3
{
  id v4 = a3;
  if (self->_hostManager)
  {
    id v7 = v4;
    char v5 = objc_opt_respondsToSelector();
    id v4 = v7;
    if (v5)
    {
      int v6 = [(_UIPopoverHostManager *)self->_hostManager popoverWithIdentifier:self->_popoverIdentifier shouldAttemptDismissWhenWindowSceneUpdatesEffectiveGeometry:v7];
      id v4 = v7;
      if (v6)
      {
        [(UIPopoverPresentationController *)self _dismissWithCompletion:0];
        id v4 = v7;
      }
    }
  }
}

- (CGSize)_proposedSize
{
  uint64_t v3 = [(UIPresentationController *)self presentedViewController];
  id v4 = [v3 traitCollection];
  uint64_t v5 = [v4 userInterfaceIdiom];

  if (v5 == 6)
  {
    [(UIPopoverPresentationController *)self _defaultPopoverSize];
  }
  else
  {
    popoverBackgroundViewClass = self->_popoverBackgroundViewClass;
    if (!popoverBackgroundViewClass) {
      popoverBackgroundViewClass = [(UIPopoverPresentationController *)self _defaultChromeViewClass];
    }
    id v9 = objc_alloc_init([(UIPopoverPresentationController *)self _popoverLayoutInfoForChromeClass:popoverBackgroundViewClass]);
    [(UIPopoverPresentationController *)self _defaultPopoverSize];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __48__UIPopoverPresentationController__proposedSize__block_invoke;
    v17[3] = &unk_1E52E7AD8;
    double v19 = self;
    id v20 = popoverBackgroundViewClass;
    uint64_t v21 = v10;
    uint64_t v22 = v11;
    id v18 = v9;
    id v12 = v9;
    [v12 updateProperties:v17];
    [v12 frame];
    double v14 = v13;
    double v16 = v15;

    double v6 = v14;
    double v7 = v16;
  }
  result.double height = v7;
  result.double width = v6;
  return result;
}

void __48__UIPopoverPresentationController__proposedSize__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) contentViewInsets];
  objc_msgSend(v2, "setContentInset:");
  uint64_t v3 = *(void **)(a1 + 32);
  [*(id *)(a1 + 48) arrowHeight];
  objc_msgSend(v3, "setArrowHeight:");
  objc_msgSend(*(id *)(a1 + 32), "setPreferredContentSize:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  [*(id *)(a1 + 32) setPreferredArrowDirections:*(void *)(*(void *)(a1 + 40) + 728)];
  id v4 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _containingFrame];
  objc_msgSend(v4, "setContainingFrame:");
  uint64_t v5 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _containingFrameInsets];
  objc_msgSend(v5, "setContainingFrameInsets:");
  double v6 = *(void **)(a1 + 32);
  [*(id *)(a1 + 40) _sourceRectInContainerView];
  objc_msgSend(v6, "setSourceViewRect:");
  double v7 = *(void **)(a1 + 32);
  double v8 = [*(id *)(a1 + 40) _popoverHostingWindow];
  id v9 = [v8 windowScene];
  objc_msgSend(v7, "setPreferLandscapeOrientations:", (unint64_t)(objc_msgSend(v9, "interfaceOrientation") - 3) < 0xFFFFFFFFFFFFFFFELL);

  [*(id *)(a1 + 32) setCanOverlapSourceViewRect:*(unsigned __int8 *)(*(void *)(a1 + 40) + 537)];
  objc_msgSend(*(id *)(a1 + 32), "setPreferredHorizontalAlignment:", objc_msgSend(*(id *)(a1 + 40), "_preferredHorizontalAlignment"));
  uint64_t v10 = *(void **)(a1 + 32);
  id v11 = [*(id *)(a1 + 40) containerView];
  objc_msgSend(v10, "setIsRTL:", objc_msgSend(v11, "effectiveUserInterfaceLayoutDirection") == 1);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  v10.receiver = self;
  v10.super_class = (Class)UIPopoverPresentationController;
  -[UIPresentationController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  *(_WORD *)&self->_popoverControllerFlags |= 0x40u;
  if ([v7 isAnimated])
  {
    double v8 = [(UIView *)self->_popoverView layer];
    [v8 setAllowsGroupOpacity:0];

    [(_UIPopoverView *)self->_popoverView setChromeHiddenForSizeTransition:1];
    [(UIView *)self->_shadowView setAlpha:0.0];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E52DA598;
  v9[4] = self;
  [v7 animateAlongsideTransition:0 completion:v9];
}

void __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  *(_WORD *)(*(void *)(a1 + 32) + 656) &= ~0x40u;
  uint64_t v3 = (_OWORD *)(*(void *)(a1 + 32) + 560);
  long long v4 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
  *uint64_t v3 = *MEMORY[0x1E4F1DB28];
  v3[1] = v4;
  if ([a2 isAnimated])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v9[3] = &unk_1E52D9F70;
    uint64_t v10 = *(void *)(a1 + 32);
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3;
    v8[3] = &unk_1E52DC3A0;
    v8[4] = v10;
    +[UIView animateWithDuration:v9 animations:v8 completion:0.25];
  }
  [*(id *)(a1 + 32) _sendDelegateWillRepositionToRect];
  uint64_t v5 = [*(id *)(a1 + 32) containerView];
  [v5 setNeedsLayout];

  double v6 = *(void **)(a1 + 32);
  id v7 = [v6 presentedViewController];
  [v6 preferredContentSizeDidChangeForChildContentContainer:v7];
}

uint64_t __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 360) setChromeHiddenForSizeTransition:0];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 376);
  return [v2 setAlpha:1.0];
}

void __86__UIPopoverPresentationController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 360) layer];
  [v1 setAllowsGroupOpacity:1];
}

- (void)_updateSourceOverlayViewConstraints
{
  v27[4] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIPopoverPresentationController *)self _sourceOverlayViewConstraints];

  if (v3)
  {
    long long v4 = (void *)MEMORY[0x1E4F5B268];
    uint64_t v5 = [(UIPopoverPresentationController *)self _sourceOverlayViewConstraints];
    [v4 deactivateConstraints:v5];
  }
  double v6 = [(UIPresentationController *)self _realSourceView];
  uint64_t v7 = [(UIPopoverPresentationController *)self _sourceOverlayView];
  double v8 = (void *)v7;
  if (v6)
  {
    if (v7)
    {
      id v9 = [v6 window];
      uint64_t v10 = [v8 window];
      int v11 = [v9 isEqual:v10];

      if (v11)
      {
        uint64_t v26 = [v6 leftAnchor];
        double v25 = [v8 leftAnchor];
        BOOL v24 = [v26 constraintEqualToAnchor:v25];
        v27[0] = v24;
        double v23 = [v6 rightAnchor];
        uint64_t v22 = [v8 rightAnchor];
        uint64_t v21 = [v23 constraintEqualToAnchor:v22];
        v27[1] = v21;
        id v12 = [v6 topAnchor];
        double v13 = [v8 topAnchor];
        double v14 = [v12 constraintEqualToAnchor:v13];
        v27[2] = v14;
        double v15 = [v6 bottomAnchor];
        double v16 = [v8 bottomAnchor];
        id v17 = [v15 constraintEqualToAnchor:v16];
        v27[3] = v17;
        id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:4];
        [(UIPopoverPresentationController *)self _setSourceOverlayViewConstraints:v18];

        double v19 = (void *)MEMORY[0x1E4F5B268];
        id v20 = [(UIPopoverPresentationController *)self _sourceOverlayViewConstraints];
        [v19 activateConstraints:v20];
      }
    }
  }
}

uint64_t __66__UIPopoverPresentationController_containerViewWillLayoutSubviews__block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 464) setPreferredArrowDirections:*(void *)(*(void *)(a1 + 32) + 728)];
}

+ (BOOL)_alwaysAllowPopoverPresentations
{
  return _AlwaysAllowPopoverPresentations;
}

+ (void)_setAlwaysAllowPopoverPresentations:(BOOL)a3
{
  _AlwaysAllowPopoverPresentations = a3;
}

- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_hostManager)
  {
LABEL_2:
    int64_t v6 = -1;
    goto LABEL_3;
  }
  if ([v4 horizontalSizeClass] != 1)
  {
    if ([v5 horizontalSizeClass] == 2
      && [v5 verticalSizeClass] == 1
      && !_AlwaysAllowPopoverPresentations)
    {
      int64_t v6 = 2;
      goto LABEL_3;
    }
    goto LABEL_2;
  }
  double v8 = _UIMainBundleIdentifier();
  id v9 = v8;
  if (_AlwaysAllowPopoverPresentations
    || !self->_adaptivityEnabled
    || ([v8 isEqualToString:@"com.apple.itunesu"] & 1) != 0)
  {
    int64_t v6 = -1;
  }
  else
  {
    uint64_t v10 = [(UIPresentationController *)self presentedViewController];
    if (_UISheetPresentationControllerStylesSheetsAsCards(v10)) {
      int64_t v6 = 2;
    }
    else {
      int64_t v6 = 0;
    }
  }
LABEL_3:

  return v6;
}

- (id)_preferredAnimationControllerForDismissal
{
  [(UIPopoverPresentationController *)self _createHostManagerIfNeeded];
  uint64_t v3 = [(UIPopoverPresentationController *)self _metrics];
  int v4 = [v3 shouldUseVisualStyleAnimationControllerForDismissal];

  if (v4)
  {
    uint64_t v5 = [(UIPresentationController *)self _visualStyle];
    int64_t v6 = [v5 preferredAnimationControllerForPresentation:0];
  }
  else if ([(_UIPopoverHostManager *)self->_hostManager useDefaultPreferredAnimationControllerForDismissalWithPopoverWithIdentifier:self->_popoverIdentifier])
  {
    v8.receiver = self;
    v8.super_class = (Class)UIPopoverPresentationController;
    int64_t v6 = [(UIPresentationController *)&v8 _preferredAnimationControllerForDismissal];
  }
  else
  {
    int64_t v6 = objc_alloc_init(_UIModernPopoverAnimationController);
    [(_UIModernPopoverAnimationController *)v6 setPopoverPresentationController:self];
    [(_UIModernPopoverAnimationController *)v6 setPresenting:0];
  }
  return v6;
}

- (void)_setContentViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (![(UIPresentationController *)self presented]) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"-[UIPopoverController setContentViewController:animated:] can only be called after the popover has been presented."];
  }
  uint64_t v7 = [(UIPresentationController *)self presentedViewController];
  objc_super v8 = [v7 view];

  id v9 = [v6 view];
  [v8 frame];
  objc_msgSend(v9, "setFrame:");

  uint64_t v10 = [v8 superview];

  if (v10)
  {
    int v11 = [v8 superview];
    id v12 = [v6 view];
    [v11 insertSubview:v12 above:v8];

    if (v4)
    {
      double v13 = [v6 view];
      [v13 setAlpha:0.0];

      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke;
      v27[3] = &unk_1E52D9F70;
      id v28 = v6;
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_2;
      v23[3] = &unk_1E52DAF68;
      id v24 = v8;
      id v25 = v28;
      uint64_t v26 = self;
      +[UIView animateWithDuration:v27 animations:v23 completion:0.4];

      id v14 = v28;
LABEL_8:

      goto LABEL_9;
    }
    [v8 removeFromSuperview];
    double v15 = [v6 childModalViewController];

    if (!v15)
    {
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      double v19 = __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_3;
      id v20 = &unk_1E52D9F98;
      uint64_t v21 = self;
      id v22 = v6;
      +[UIView performWithoutAnimation:&v17];
      id v14 = v22;
      goto LABEL_8;
    }
  }
LABEL_9:
  double v16 = [(UIPresentationController *)self presentedViewController];
  [v6 _replaceViewControllerInPresentationHierarchy:v16];

  [(UIPresentationController *)self _setPresentedViewController:v6];
}

void __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setAlpha:1.0];
}

void __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) removeFromSuperview];
  uint64_t v2 = [*(id *)(a1 + 40) childModalViewController];

  if (!v2)
  {
    uint64_t v4 = *(void *)(a1 + 40);
    uint64_t v3 = *(void **)(a1 + 48);
    [v3 preferredContentSizeDidChangeForChildContentContainer:v4];
  }
}

uint64_t __70__UIPopoverPresentationController__setContentViewController_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) preferredContentSizeDidChangeForChildContentContainer:*(void *)(a1 + 40)];
}

- (id)_hostManagerPopoverCreationConfiguration
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(UIPresentationController *)self presentedViewController];
  [v3 setContentViewController:v4];
  uint64_t v5 = [(UIPresentationController *)self _realSourceView];
  [v3 setSourceView:v5];

  [(UIPopoverPresentationController *)self popoverContentSize];
  objc_msgSend(v3, "setContentSize:");
  objc_msgSend(v3, "setShowsArrow:", -[UIPopoverPresentationController _shouldHideArrow](self, "_shouldHideArrow") ^ 1);
  id v6 = [v4 traitCollection];
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "userInterfaceStyle"));

  v10[0] = 0x1ED3F5A48;
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  id v8 = (id)[v4 _registerForTraitTokenChanges:v7 withTarget:self action:sel__presentedViewControllerUserInterfaceStyleChanged];

  return v3;
}

- (id)_hostManagerPopoverUpdateConfiguration
{
  uint64_t v3 = objc_opt_new();
  [(UIPopoverPresentationController *)self popoverContentSize];
  objc_msgSend(v3, "setContentSize:");
  objc_msgSend(v3, "setPreferredHorizontalAlignment:", -[UIPopoverPresentationController _preferredHorizontalAlignment](self, "_preferredHorizontalAlignment"));
  objc_msgSend(v3, "setShowsArrow:", -[UIPopoverPresentationController _shouldHideArrow](self, "_shouldHideArrow") ^ 1);
  uint64_t v4 = [(UIPresentationController *)self containerView];
  objc_msgSend(v3, "setIsRTL:", objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection") == 1);

  return v3;
}

- (id)_hostManagerPopoverCloseConfiguration
{
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = [(UIPresentationController *)self presentedViewController];
  uint64_t v5 = [v4 _window];
  [v3 setPopoverWindow:v5];

  id v6 = [(UIPresentationController *)self _realSourceView];
  uint64_t v7 = [v6 window];
  [v3 setParentWindow:v7];

  [v3 setTransitionCoordinator:0];
  return v3;
}

- (void)_realSourceViewGeometryDidChange
{
  v5.receiver = self;
  v5.super_class = (Class)UIPopoverPresentationController;
  [(UIPresentationController *)&v5 _realSourceViewGeometryDidChange];
  if ((*(_WORD *)&self->_popoverControllerFlags & 0x40) == 0)
  {
    [(UIPopoverPresentationController *)self _containingFrame];
    p_previousContainerViewRect = &self->_previousContainerViewRect;
    if (!CGRectEqualToRect(v6, *p_previousContainerViewRect))
    {
      CGSize v4 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      p_previousContainerViewRect->origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      p_previousContainerViewRect->size = v4;
    }
  }
}

- (void)_convertToSceneFromPresentingViewController:(id)a3
{
  CGSize v4 = [(UIPresentationController *)self _realSourceView];
  objc_super v5 = [(UIPresentationController *)self presentedViewController];
  [(UIPopoverPresentationController *)self preferredContentSizeDidChangeForChildContentContainer:v5];

  CGRect v6 = [(UIPopoverPresentationController *)self _hostManagerPopoverCreationConfiguration];
  uint64_t v7 = [v4 window];
  id v8 = [v7 windowScene];
  id v9 = [v8 coordinateSpace];
  [(UIPopoverPresentationController *)self _sourceRectInCoordinateSpace:v9];
  objc_msgSend(v6, "setSourceRectInParentUIWindow:");

  objc_msgSend(v6, "setPermittedArrowDirections:", -[UIPopoverPresentationController permittedArrowDirections](self, "permittedArrowDirections"));
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __79__UIPopoverPresentationController__convertToSceneFromPresentingViewController___block_invoke;
  v12[3] = &unk_1E52D9F70;
  v12[4] = self;
  [v6 setCompletionBlock:v12];
  uint64_t v10 = [(UIPopoverPresentationController *)self _createHostManagerPopoverWithConfiguration:v6];
  popoverIdentifier = self->_popoverIdentifier;
  self->_popoverIdentifier = v10;
}

void __79__UIPopoverPresentationController__convertToSceneFromPresentingViewController___block_invoke(uint64_t a1)
{
  id v17 = [*(id *)(a1 + 32) _hostManagerPopoverUpdateConfiguration];
  uint64_t v2 = [*(id *)(a1 + 32) _realSourceView];
  uint64_t v3 = *(void **)(a1 + 32);
  CGSize v4 = [v2 window];
  objc_super v5 = [v4 windowScene];
  CGRect v6 = [v5 coordinateSpace];
  [v3 _sourceRectInCoordinateSpace:v6];
  objc_msgSend(v17, "setSourceRectInParentUIWindow:");

  [*(id *)(*(void *)(a1 + 32) + 672) updatePopoverWithIdentifier:*(void *)(*(void *)(a1 + 32) + 664) configuration:v17];
  uint64_t v7 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void *)(v8 + 664);
      id v10 = *(id *)(v8 + 672);
      int v11 = [v10 popoverSceneForPopoverWithIdentifier:v9];
      [v7 _popoverPresentationController:*(void *)(a1 + 32) didConvertToScene:v11];
    }
  }
  id v12 = [[UIPanGestureRecognizer alloc] initWithTarget:*(void *)(a1 + 32) action:sel__handlePan_];
  uint64_t v13 = *(void *)(a1 + 32);
  id v14 = *(void **)(v13 + 680);
  *(void *)(v13 + 680) = v12;

  double v15 = [*(id *)(a1 + 32) presentedViewController];
  double v16 = [v15 _window];
  [v16 addGestureRecognizer:*(void *)(*(void *)(a1 + 32) + 680)];
}

- (id)_createHostManagerPopoverWithConfiguration:(id)a3
{
  hostManager = self->_hostManager;
  id v5 = a3;
  CGRect v6 = [(_UIPopoverHostManager *)hostManager createPopoverWithConfiguration:v5];
  uint64_t v7 = [v5 contentViewController];

  uint64_t v8 = [v7 _window];
  [v8 _setOverrideParentTraitEnvironment:self];

  return v6;
}

- (void)_closeScene
{
  if (self->_popoverIdentifier && self->_hostManager)
  {
    id v3 = [(UIPopoverPresentationController *)self _hostManagerPopoverCloseConfiguration];
    [(_UIPopoverHostManager *)self->_hostManager closePopoverWithIdentifier:self->_popoverIdentifier configuration:v3];
  }
}

- (void)_handlePan:(id)a3
{
  id v4 = a3;
  id v5 = [v4 view];
  [v4 translationInView:v5];
  if (!self->_wasDetached)
  {
    double v8 = v6;
    double v9 = v7;
    if ([v4 state] == 1)
    {
      [v4 locationInView:v5];
      double v11 = v10 - v8;
      double v13 = v12 - v9;
      id v14 = [(UIPresentationController *)self presentedViewController];
      double v15 = [v14 _window];
      double v16 = [v15 windowScene];
      id v17 = [v16 coordinateSpace];
      objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v17, v11, v13);
      double v19 = v18;
      double v21 = v20;

      id v22 = [(UIPresentationController *)self presentedViewController];
      double v23 = [v22 _window];
      id v24 = [v23 windowScene];

      id v25 = [(UIPresentationController *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [v25 _popoverPresentationController:self shouldDetachScene:v24])
      {
        if (objc_opt_respondsToSelector()) {
          [(_UIPopoverHostManager *)self->_hostManager updateSupportsDetach:1 forPopoverWithIdentifier:self->_popoverIdentifier];
        }
        if (objc_opt_respondsToSelector())
        {
          hostManager = self->_hostManager;
          popoverIdentifier = self->_popoverIdentifier;
          v28[0] = MEMORY[0x1E4F143A8];
          v28[1] = 3221225472;
          void v28[2] = __46__UIPopoverPresentationController__handlePan___block_invoke;
          v28[3] = &unk_1E52DCB30;
          id v29 = v25;
          id v30 = self;
          id v31 = v24;
          -[_UIPopoverHostManager detachPopoverWithIdentifier:fromPoint:withCompletionCallback:](hostManager, "detachPopoverWithIdentifier:fromPoint:withCompletionCallback:", popoverIdentifier, v28, v19, v21);
        }
      }
    }
  }
}

void __46__UIPopoverPresentationController__handlePan___block_invoke(uint64_t a1)
{
  if (objc_opt_respondsToSelector()) {
    [*(id *)(a1 + 32) _popoverPresentationController:*(void *)(a1 + 40) didDetachScene:*(void *)(a1 + 48)];
  }
  uint64_t v2 = [*(id *)(*(void *)(a1 + 40) + 680) view];
  [v2 removeGestureRecognizer:*(void *)(*(void *)(a1 + 40) + 680)];

  *(unsigned char *)(*(void *)(a1 + 40) + 688) = 1;
}

- (void)setDimmingView:(id)a3
{
}

- (BOOL)dismissesOnRotation
{
  return self->_dismissesOnRotation;
}

- (void)setDismissesOnRotation:(BOOL)a3
{
  self->_dismissesOnRotation = a3;
}

- (void)setShowsTargetRect:(BOOL)a3
{
  self->_showsTargetRect = a3;
}

- (BOOL)showsOrientationMarker
{
  return self->_showsOrientationMarker;
}

- (void)setShowsOrientationMarker:(BOOL)a3
{
  self->_showsOrientationMarker = a3;
}

- (BOOL)showsPresentationArea
{
  return self->_showsPresentationArea;
}

- (void)setShowsPresentationArea:(BOOL)a3
{
  self->_showsPresentationArea = a3;
}

- (BOOL)_retainsSelfWhilePresented
{
  return self->_retainsSelfWhilePresented;
}

- (void)_setRetainsSelfWhilePresented:(BOOL)a3
{
  self->_retainsSelfWhilePresented = a3;
}

- (_UIPopoverLayoutInfo)preferredLayoutInfo
{
  return self->_preferredLayoutInfo;
}

- (void)setPreferredLayoutInfo:(id)a3
{
}

- (UIView)_presentingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  return (UIView *)WeakRetained;
}

- (void)_setPresentingView:(id)a3
{
}

- (unint64_t)_presentationEdge
{
  return self->_presentationEdge;
}

- (void)_setPresentationEdge:(unint64_t)a3
{
  self->_presentationEdge = a3;
}

- (void)_setShouldDimPresentingViewTint:(BOOL)a3
{
  self->_shouldDimPresentingViewTint = a3;
}

- (BOOL)_allowDismissalTapsToPassThrough
{
  return self->_allowDismissalTapsToPassThrough;
}

- (UIPopoverArrowDirection)permittedArrowDirections
{
  return self->_permittedArrowDirections;
}

- (unint64_t)popoverArrowDirection
{
  return self->_popoverArrowDirection;
}

- (void)setPopoverArrowDirection:(unint64_t)a3
{
  self->_popoverArrowDirection = a3;
}

- (void)_setCentersPopoverIfSourceViewNotSet:(BOOL)a3
{
  self->__centersPopoverIfSourceViewNotSet = a3;
}

- (void)_setSourceOverlayView:(id)a3
{
}

- (NSArray)_sourceOverlayViewConstraints
{
  return self->_sourceOverlayViewConstraints;
}

- (void)_setSourceOverlayViewConstraints:(id)a3
{
}

- (UIView)_targetRectView
{
  return self->_targetRectView;
}

- (void)_setTargetRectView:(id)a3
{
}

- (UIPopoverPresentationController)retainedSelf
{
  return self->_retainedSelf;
}

- (void)setRetainedSelf:(id)a3
{
}

- (void)_setShouldHideArrow:(BOOL)a3
{
  self->__shouldHideArrow = a3;
}

- (double)_dimmingViewTopEdgeInset
{
  return self->__dimmingViewTopEdgeInset;
}

- (void)_setDimmingViewTopEdgeInset:(double)a3
{
  self->__dimmingViewTopEdgeInset = a3;
}

- (void)_setShouldDisableInteractionDuringTransitions:(BOOL)a3
{
  self->_shouldDisableInteractionDuringTransitions = a3;
}

- (BOOL)_ignoreBarButtonItemSiblings
{
  return self->__ignoreBarButtonItemSiblings;
}

- (void)_setIgnoreBarButtonItemSiblings:(BOOL)a3
{
  self->__ignoreBarButtonItemSiblings = a3;
}

- (BOOL)_softAssertWhenNoSourceViewOrBarButtonItemSpecified
{
  return self->__softAssertWhenNoSourceViewOrBarButtonItemSpecified;
}

- (void)_setSoftAssertWhenNoSourceViewOrBarButtonItemSpecified:(BOOL)a3
{
  self->__softAssertWhenNoSourceViewOrBarButtonItemSpecified = a3;
}

- (void)_setAllowsSourceViewInDifferentWindowThanInitialPresentationViewController:(BOOL)a3
{
  self->__allowsSourceViewInDifferentWindowThanInitialPresentationViewController = a3;
}

- (void)_setShouldPreserveFirstResponder:(BOOL)a3
{
  self->_shouldPreserveFirstResponder = a3;
}

- (BOOL)_isAdaptivityEnabled
{
  return self->_adaptivityEnabled;
}

- (void)_setAdaptivityEnabled:(BOOL)a3
{
  self->_adaptivityEnabled = a3;
}

- (void)set_defaultPopoverSizeOverride:(CGSize)a3
{
  self->__defaultPopoverSizeOverride = a3;
}

- (void)_setPreferredHorizontalAlignment:(int64_t)a3
{
  self->__preferredHorizontalAlignment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retainedSelf, 0);
  objc_storeStrong((id *)&self->_targetRectView, 0);
  objc_storeStrong((id *)&self->_sourceOverlayViewConstraints, 0);
  objc_storeStrong((id *)&self->_sourceOverlayView, 0);
  objc_storeStrong((id *)&self->_adaptiveSheetPresentationController, 0);
  objc_storeStrong((id *)&self->_detachGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_hostManager, 0);
  objc_storeStrong((id *)&self->_popoverIdentifier, 0);
  objc_storeStrong((id *)&self->_dimmingViewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_vendedGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_storeStrong((id *)&self->_popoverBackgroundViewClass, 0);
  objc_storeStrong((id *)&self->_preferredLayoutInfo, 0);
  objc_storeStrong((id *)&self->_arrowBackgroundColor, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_targetBarButtonItem, 0);
  objc_storeStrong((id *)&self->_layoutConstraintView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_popoverView, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
}

@end