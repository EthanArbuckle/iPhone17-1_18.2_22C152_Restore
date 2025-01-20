@interface UISheetPresentationController
+ (id)_platformHostManagerForController:(id)a3;
+ (int64_t)_initialMode;
+ (void)_registerPlatformHostProvider:(Class)a3 forIdiom:(int64_t)a4;
- (BOOL)_allowsAsymmetricVerticalMargins;
- (BOOL)_allowsFocusInPresentingViewController;
- (BOOL)_allowsInteractiveDismissWhenFullScreen;
- (BOOL)_allowsTearOff;
- (BOOL)_didAttemptToStartDismiss;
- (BOOL)_didExpand;
- (BOOL)_didTearOff;
- (BOOL)_dismissingHorizontallyAlongsideNavigationPop;
- (BOOL)_exteriorPanGestureRecognizerShouldBeginWithEvent:(id)a3;
- (BOOL)_exteriorPanGestureRecognizerShouldInteractWithView:(id)a3;
- (BOOL)_forceSheetSemanticContext;
- (BOOL)_hasRegisteredForKeyboardNotifications;
- (BOOL)_inheritsPresentingViewControllerThemeLevel;
- (BOOL)_insetsPresentedViewForGrabber;
- (BOOL)_isDimmingAlwaysVisible;
- (BOOL)_isDimmingViewTapDismissing;
- (BOOL)_isDragging;
- (BOOL)_isDraggingAndTransitioning;
- (BOOL)_isExteriorPanGestureEnabled;
- (BOOL)_isGeneratingAnimations;
- (BOOL)_isGrabberBlurEnabled;
- (BOOL)_isHidden;
- (BOOL)_isHosting;
- (BOOL)_isKeyboardShown;
- (BOOL)_isOcclusionEnabled;
- (BOOL)_isPresentedRemotely;
- (BOOL)_isRemoteDismissing;
- (BOOL)_isRootPresentation;
- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4;
- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4;
- (BOOL)_peeksWhenFloating;
- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown;
- (BOOL)_presentsWithGesture;
- (BOOL)_remoteContainsFirstResponder;
- (BOOL)_remoteFirstResponderRequiresKeyboard;
- (BOOL)_shouldAdjustDetentsToAvoidKeyboard;
- (BOOL)_shouldDismissByDragging;
- (BOOL)_shouldDismissWhenTappedOutside;
- (BOOL)_shouldDismissWithNavigationPop;
- (BOOL)_shouldOccludeDuringPresentation;
- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance;
- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop;
- (BOOL)_shouldPreserveFirstResponder;
- (BOOL)_shouldScaleDownBehindDescendantSheets;
- (BOOL)_tucksIntoUnsafeAreaInCompactHeight;
- (BOOL)_wantsBottomAttached;
- (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing;
- (BOOL)_wantsFloatingInRegularWidthCompactHeight;
- (BOOL)_wantsFullScreen;
- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)prefersEdgeAttachedInCompactHeight;
- (BOOL)prefersGrabberVisible;
- (BOOL)prefersPageSizing;
- (BOOL)prefersScrollingExpandsWhenScrolledToEdge;
- (BOOL)sheetInteraction:(id)a3 shouldAllowVerticalRubberBandingWithEvent:(id)a4;
- (BOOL)sheetInteraction:(id)a3 shouldBeginHorizontalRubberBandingWithGestureRecognizer:(id)a4;
- (BOOL)sheetInteractionShouldInteractWithQuicklyScrollingDescendentScrollView:(id)a3;
- (BOOL)widthFollowsPreferredContentSizeWhenEdgeAttached;
- (CGFloat)preferredCornerRadius;
- (CGPoint)_initialTearOffPoint;
- (CGPoint)_remoteInterruptedOffset;
- (CGPoint)offsetForInterruptedAnimationInSheetInteraction:(id)a3;
- (CGRect)_currentPresentedViewFrame;
- (CGRect)_frameOfPresentedViewControllerViewInSuperview;
- (CGRect)_occludedFrameOfPresentedViewInContainerView;
- (CGRect)_remoteKeyboardFrame;
- (CGRect)frameOfPresentedViewInContainerView;
- (NSArray)_detentValues;
- (NSArray)detents;
- (NSString)_hiddenAncestorSheetID;
- (NSString)_largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight;
- (NSString)_largestUndimmedDetentIdentifierWhenFloating;
- (NSString)_sheetID;
- (NSUserActivity)_tearOffActivity;
- (UIDimmingView)_confinedDimmingView;
- (UIDimmingView)dimmingView;
- (UIDragInteraction)_tearOffInteraction;
- (UIDropShadowView)dropShadowView;
- (UIPanGestureRecognizer)_exteriorPanGestureRecognizer;
- (UIPercentDrivenInteractiveTransition)_interactionController;
- (UISheetPresentationController)_childSheetPresentationController;
- (UISheetPresentationController)_parentSheetPresentationController;
- (UISheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4;
- (UISheetPresentationControllerDetentIdentifier)largestUndimmedDetentIdentifier;
- (UISheetPresentationControllerDetentIdentifier)selectedDetentIdentifier;
- (_UIRemoteSheet)_connectedRemoteSheet;
- (_UIRemoteSheet)_expectedRemoteSheet;
- (_UISheetAnimationController)_animationController;
- (_UISheetHostManager)_hostManager;
- (_UISheetHostManager)_hostManagerIfLoaded;
- (_UISheetInteraction)_sheetInteraction;
- (_UISheetInteraction)_sheetInteractionIfLoaded;
- (_UISheetLayoutInfo)_layoutInfo;
- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance;
- (_UISheetPresentationControllerAppearance)_floatingAppearance;
- (_UISheetPresentationControllerAppearance)_standardAppearance;
- (_UISheetPresentationControllerClientRemotePresentationDelegate)_clientRemotePresentationDelegate;
- (_UISheetPresentationControllerConfiguration)_configuration;
- (_UISheetPresentationControllerConfiguration)_lastConfiguration;
- (_UISheetPresentationControllerVisualStyling)_sheetVisualStyle;
- (double)_additionalMinimumTopInset;
- (double)_cornerRadiusForPresentationAndDismissal;
- (double)_exteriorDismissPadding;
- (double)_exteriorPanStartLocationY;
- (double)_grabberTopSpacing;
- (double)_marginInCompactHeight;
- (double)_marginInRegularWidthRegularHeight;
- (double)_preferredShadowOpacity;
- (double)_remoteProposedDepthLevel;
- (double)_shadowRadius;
- (double)_velocity;
- (id)_createVisualStyleForProvider:(id)a3;
- (id)_preferredAnimationControllerForDismissal;
- (id)_preferredAnimationControllerForPresentation;
- (id)_preferredAnimationControllerForTransition:(BOOL)a3;
- (id)_preferredInteractionControllerForDismissal:(id)a3;
- (id)_preferredInteractionControllerForPresentation:(id)a3;
- (id)_preferredInteractionControllerForTransition:(BOOL)a3 animator:(id)a4;
- (id)_presentationTransitionWillBegin;
- (id)_sheetMetrics;
- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4;
- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5;
- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5;
- (id)presentedView;
- (int64_t)_detentDirectionWhenFloating;
- (int64_t)_horizontalAlignment;
- (int64_t)_indexOfCurrentDetent;
- (int64_t)_indexOfLastUndimmedDetent;
- (int64_t)_indexOfLastUndimmedDetentWhenEdgeAttachedInCompactHeight;
- (int64_t)_indexOfLastUndimmedDetentWhenFloating;
- (int64_t)_mode;
- (int64_t)presentationStyle;
- (void)_accessibilityReduceMotionStatusDidChange;
- (void)_animateChanges:(id)a3 completion:(id)a4;
- (void)_completeInteractiveTransition:(BOOL)a3 duration:(double)a4 timingCurve:(id)a5;
- (void)_configureHostWindow:(id)a3;
- (void)_configureRootPresentationControllerForHostWindow:(id)a3;
- (void)_containerViewBoundsDidChange;
- (void)_containerViewLayoutSubviews;
- (void)_containerViewScreenDidChangeToScreen:(id)a3;
- (void)_dismissFromGrabberOrDimmingViewIfPossible;
- (void)_dropShadowViewGrabberDidTriggerPrimaryAction:(id)a3;
- (void)_firstResponderDidChange:(id)a3;
- (void)_handleExteriorPan:(id)a3;
- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4;
- (void)_hostSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3;
- (void)_hostSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5;
- (void)_hostSheetInteractionDraggingDidEnd;
- (void)_keyboardAboutToChangeFrame:(id)a3;
- (void)_keyboardAboutToHide:(id)a3;
- (void)_keyboardAboutToShow:(id)a3;
- (void)_prepareForWindowDeallocRecursively:(BOOL)a3;
- (void)_realSourceViewGeometryDidChange;
- (void)_registerForKeyboardNotificationsIfNecessary;
- (void)_remoteSheetGrabberDidTriggerPrimaryAction;
- (void)_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5;
- (void)_remoteSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6;
- (void)_remoteSheetInteractionDraggingDidEnd;
- (void)_resetRemoteDismissing;
- (void)_sendDidChangeSelectedDetentIdentifier;
- (void)_sendDidInvalidateDetentValues;
- (void)_sendDidInvalidateUntransformedFrame;
- (void)_sendPerformLayout;
- (void)_setAdditionalMinimumTopInset:(double)a3;
- (void)_setAllowsAsymmetricVerticalMargins:(BOOL)a3;
- (void)_setAllowsInteractiveDismissWhenFullScreen:(BOOL)a3;
- (void)_setAllowsTearOff:(BOOL)a3;
- (void)_setAnimatedTransition:(id)a3;
- (void)_setClientRemotePresentationDelegate:(id)a3;
- (void)_setConfiguration:(id)a3;
- (void)_setCornerRadiusForPresentationAndDismissal:(double)a3;
- (void)_setDetentDirectionWhenFloating:(int64_t)a3;
- (void)_setDidAttemptToStartDismiss:(BOOL)a3;
- (void)_setDidExpand:(BOOL)a3;
- (void)_setDidTearOff:(BOOL)a3;
- (void)_setDimmingViewTapDismissing:(BOOL)a3;
- (void)_setDraggingAndTransitioning:(BOOL)a3;
- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3;
- (void)_setExteriorDismissPadding:(double)a3;
- (void)_setExteriorPanGestureEnabled:(BOOL)a3;
- (void)_setFloatingAppearance:(id)a3;
- (void)_setGrabberBlurEnabled:(BOOL)a3;
- (void)_setGrabberTopSpacing:(double)a3;
- (void)_setHasRegisteredForKeyboardNotifications:(BOOL)a3;
- (void)_setHidden:(BOOL)a3;
- (void)_setHiddenAncestorSheetID:(id)a3;
- (void)_setHorizontalAlignment:(int64_t)a3;
- (void)_setIndexOfCurrentDetent:(int64_t)a3;
- (void)_setIndexOfLastUndimmedDetent:(int64_t)a3;
- (void)_setIndexOfLastUndimmedDetentWhenEdgeAttachedInCompactHeight:(int64_t)a3;
- (void)_setIndexOfLastUndimmedDetentWhenFloating:(int64_t)a3;
- (void)_setInitialTearOffPoint:(CGPoint)a3;
- (void)_setInsetsPresentedViewForGrabber:(BOOL)a3;
- (void)_setInteractiveTransition:(id)a3;
- (void)_setIsRemote:(BOOL)a3;
- (void)_setKeyboardShown:(BOOL)a3;
- (void)_setLargestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight:(id)a3;
- (void)_setLargestUndimmedDetentIdentifierWhenFloating:(id)a3;
- (void)_setMarginInCompactHeight:(double)a3;
- (void)_setMarginInRegularWidthRegularHeight:(double)a3;
- (void)_setMode:(int64_t)a3;
- (void)_setOcclusionEnabled:(BOOL)a3;
- (void)_setPeeksWhenFloating:(BOOL)a3;
- (void)_setPreferredShadowOpacity:(double)a3;
- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3;
- (void)_setPresentsWithGesture:(BOOL)a3;
- (void)_setRemoteClientConfiguration:(id)a3;
- (void)_setRemoteContainsFirstResponder:(BOOL)a3;
- (void)_setRemoteDismissing:(BOOL)a3;
- (void)_setRemoteFirstResponderRequiresKeyboard:(BOOL)a3;
- (void)_setRemoteInterruptedOffset:(CGPoint)a3;
- (void)_setRemoteKeyboardFrame:(CGRect)a3;
- (void)_setRemoteProposedDepthLevel:(double)a3;
- (void)_setShadowRadius:(double)a3;
- (void)_setSheetID:(id)a3;
- (void)_setShouldAdjustDetentsToAvoidKeyboard:(BOOL)a3;
- (void)_setShouldDismissWhenTappedOutside:(BOOL)a3;
- (void)_setShouldPresentedViewControllerControlStatusBarAppearance:(BOOL)a3;
- (void)_setShouldScaleDownBehindDescendantSheets:(BOOL)a3;
- (void)_setStandardAppearance:(id)a3;
- (void)_setTearOffActivity:(id)a3;
- (void)_setTucksIntoUnsafeAreaInCompactHeight:(BOOL)a3;
- (void)_setWantsBottomAttached:(BOOL)a3;
- (void)_setWantsFloatingInRegularWidthCompactHeight:(BOOL)a3;
- (void)_setWantsFullScreen:(BOOL)a3;
- (void)_sheetInteractionDraggingBegan:(id)a3 withRubberBandCoefficient:(double)a4;
- (void)_sheetInteractionDraggingChanged:(id)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5 animateChange:(BOOL)a6;
- (void)_sheetInteractionDraggingEnded:(id)a3;
- (void)_sheetLayoutInfoDidInvalidateDetentValues:(id)a3;
- (void)_sheetLayoutInfoDidInvalidateOutput:(id)a3;
- (void)_sheetLayoutInfoLayout:(id)a3;
- (void)_startInteractiveTransitionWithProgress:(double)a3;
- (void)_startInteractiveTransitionWithProgress:(double)a3 fromViewController:(id)a4 completion:(id)a5;
- (void)_transitionDidEnd:(BOOL)a3 completed:(BOOL)a4;
- (void)_transitionWillBegin:(BOOL)a3;
- (void)_tryToConnectToRemoteSheet:(id)a3;
- (void)_updateAnimationController;
- (void)_updateInteractiveTransitionWithProgress:(double)a3;
- (void)_updateLayoutInfoContainerSafeAreaInsets;
- (void)_updateLayoutInfoContainerTraitCollection;
- (void)_updatePresentedViewFrame;
- (void)_updateShouldPresentedViewControllerControlStatusBarAppearance;
- (void)animateChanges:(void *)changes;
- (void)containerViewDidLayoutSubviews;
- (void)containerViewWillLayoutSubviews;
- (void)dismissalTransitionDidEnd:(BOOL)a3;
- (void)dismissalTransitionWillBegin;
- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5;
- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5;
- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4;
- (void)executeTransitionCompletionBlock;
- (void)invalidateDetents;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationTransitionDidEnd:(BOOL)a3;
- (void)presentationTransitionWillBegin;
- (void)setDetents:(NSArray *)detents;
- (void)setFrameOfPresentedViewInContainerView:(CGRect)a3;
- (void)setLargestUndimmedDetentIdentifier:(UISheetPresentationControllerDetentIdentifier)largestUndimmedDetentIdentifier;
- (void)setPreferredCornerRadius:(CGFloat)preferredCornerRadius;
- (void)setPrefersEdgeAttachedInCompactHeight:(BOOL)prefersEdgeAttachedInCompactHeight;
- (void)setPrefersGrabberVisible:(BOOL)prefersGrabberVisible;
- (void)setPrefersPageSizing:(BOOL)prefersPageSizing;
- (void)setPrefersScrollingExpandsWhenScrolledToEdge:(BOOL)prefersScrollingExpandsWhenScrolledToEdge;
- (void)setSelectedDetentIdentifier:(UISheetPresentationControllerDetentIdentifier)selectedDetentIdentifier;
- (void)setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)widthFollowsPreferredContentSizeWhenEdgeAttached;
- (void)set_dismissingHorizontallyAlongsideNavigationPop:(BOOL)a3;
- (void)set_exteriorPanStartLocationY:(double)a3;
- (void)set_forceSheetSemanticContext:(BOOL)a3;
- (void)set_hostManager:(id)a3;
- (void)set_presentationTransitionWillBegin:(id)a3;
- (void)sheetInteraction:(id)a3 didChangeOffset:(CGPoint)a4;
@end

@implementation UISheetPresentationController

- (void)containerViewWillLayoutSubviews
{
  v3 = [(UIPresentationController *)self presentedViewController];
  char v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if ((v4 & 1) == 0)
  {
    v5 = [(UIPresentationController *)self containerView];
    [v5 bounds];
    double v7 = v6;
    double v9 = v8;

    v10 = [(UIPresentationController *)self presentedViewController];
    v11 = [(UIPresentationController *)self containerView];
    v12 = [v11 _screen];
    [v12 bounds];
    [v10 _formSheetSizeForWindowWithSize:v7 screenSize:v9];
    double v14 = v13;
    double v16 = v15;

    [(UIView *)self->_dropShadowView bounds];
    double v18 = v17;
    double v20 = v19;
    double v21 = *MEMORY[0x1E4F1DAD8];
    double v22 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    dropShadowView = self->_dropShadowView;
    [(UIView *)dropShadowView bounds];
    -[UIDropShadowView willBeginRotationWithOriginalBounds:newBounds:](dropShadowView, "willBeginRotationWithOriginalBounds:newBounds:");
    if (v14 != v18 || v16 != v20) {
      -[UIView setBounds:](self->_dropShadowView, "setBounds:", v21, v22, v14, v16);
    }
    v25 = [(UISheetPresentationController *)self _hostManager];

    if (!v25)
    {
      v26 = [(UIPresentationController *)self presentedViewController];
      v27 = [v26 view];
      [(UISheetPresentationController *)self _frameOfPresentedViewControllerViewInSuperview];
      objc_msgSend(v27, "setFrame:");

      id v28 = [(UISheetPresentationController *)self presentedView];
      [(UISheetPresentationController *)self frameOfPresentedViewInContainerView];
      objc_msgSend(v28, "setFrame:");
    }
  }
}

- (void)containerViewDidLayoutSubviews
{
  v3 = [(UIPresentationController *)self presentedViewController];
  char v4 = _UISheetPresentationControllerStylesSheetsAsCards(v3);

  if ((v4 & 1) == 0)
  {
    dropShadowView = self->_dropShadowView;
    [(UIDropShadowView *)dropShadowView didFinishRotation];
  }
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  return self->__shouldPresentedViewControllerControlStatusBarAppearance;
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  v3 = [(UISheetPresentationController *)self _hostManagerIfLoaded];
  if (objc_opt_respondsToSelector())
  {
    LOBYTE(v4) = [v3 inheritsPresentingViewControllerThemeLevel];
  }
  else
  {
    v5 = [(UISheetPresentationController *)self _layoutInfo];
    int v4 = [v5 _wantsFullScreen] ^ 1;
  }
  return v4;
}

- (_UISheetLayoutInfo)_layoutInfo
{
  return self->__layoutInfo;
}

- (_UISheetHostManager)_hostManagerIfLoaded
{
  return self->__hostManager;
}

- (BOOL)_isPresentedRemotely
{
  v2 = [(UISheetPresentationController *)self _clientRemotePresentationDelegate];
  BOOL v3 = v2 != 0;

  return v3;
}

- (_UISheetPresentationControllerClientRemotePresentationDelegate)_clientRemotePresentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__clientRemotePresentationDelegate);
  return (_UISheetPresentationControllerClientRemotePresentationDelegate *)WeakRetained;
}

- (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return self->_wantsContentOverlayInsetsUpdatesWhileDismissing
      || [(UISheetPresentationController *)self _isPresentedRemotely];
}

- (id)presentedView
{
  return self->_dropShadowView;
}

- (void)_updateLayoutInfoContainerSafeAreaInsets
{
  BOOL v3 = [(UIPresentationController *)self containerView];
  [v3 safeAreaInsets];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(UIPresentationController *)self containerView];
  double v13 = [v12 traitCollection];
  uint64_t v14 = [v13 verticalSizeClass];

  if (v14 == 2)
  {
    double v15 = [(UIPresentationController *)self containerView];
    double v16 = [v15 window];
    uint64_t v17 = [v16 _interfaceOrientationForSceneSafeAreaInsetsIncludingStatusBar:1];

    double v18 = [(UIPresentationController *)self containerView];
    double v19 = [v18 window];
    double v20 = __UIStatusBarManagerForWindow(v19);
    [v20 defaultStatusBarHeightInOrientation:v17];
    double v22 = v21;

    double v5 = fmax(v5, v22);
  }
  id v23 = [(UISheetPresentationController *)self _layoutInfo];
  objc_msgSend(v23, "_setContainerSafeAreaInsets:", v5, v7, v9, v11);
}

- (UIDropShadowView)dropShadowView
{
  return self->_dropShadowView;
}

- (void)_sheetLayoutInfoDidInvalidateOutput:(id)a3
{
  id v3 = [(UIPresentationController *)self containerView];
  [v3 setNeedsLayout];
}

- (BOOL)_wantsBottomAttached
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _wantsEdgeAttached];

  return v3;
}

- (BOOL)widthFollowsPreferredContentSizeWhenEdgeAttached
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _widthFollowsPreferredContentSizeWhenEdgeAttached];

  return v3;
}

- (CGFloat)preferredCornerRadius
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _preferredCornerRadius];
  double v4 = v3;

  return v4;
}

- (double)_cornerRadiusForPresentationAndDismissal
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _dismissCornerRadius];
  double v4 = v3;

  return v4;
}

- (void)_containerViewLayoutSubviews
{
  v43.receiver = self;
  v43.super_class = (Class)UISheetPresentationController;
  [(UIPresentationController *)&v43 _containerViewLayoutSubviews];
  double v3 = [(UISheetPresentationController *)self _layoutInfo];
  double v4 = [(UISheetPresentationController *)self dropShadowView];
  if ([v3 _mode] != 1
    || ([v3 _isFunctionallyFullScreen] & 1) != 0
    || ([v3 _isHosting] & 1) != 0)
  {
    goto LABEL_4;
  }
  [v3 _untransformedFrame];
  double Width = CGRectGetWidth(v44);
  [v3 _screenSize];
  +[UIViewController defaultFormSheetSizeForScreenSize:](UIViewController, "defaultFormSheetSizeForScreenSize:");
  if (Width <= v29) {
    goto LABEL_43;
  }
  if (qword_1EB25AEC0 != -1) {
    dispatch_once(&qword_1EB25AEC0, &__block_literal_global_551);
  }
  if (!_MergedGlobals_41_0
    || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_DisableWorkaroundFor88706066, @"DisableWorkaroundFor88706066") & 1) == 0&& byte_1E8FD54E4)
  {
LABEL_4:
    double v5 = [(UIPresentationController *)self _internalTraitOverrides];
    [v5 _removeTraitToken:0x1ED3F5A90];
  }
  else
  {
LABEL_43:
    double v5 = [(UIPresentationController *)self _internalTraitOverrides];
    [v5 setHorizontalSizeClass:1];
  }

  if ([(UISheetPresentationController *)self _forceSheetSemanticContext]
    || ([v3 _isFunctionallyFullScreen] & 1) == 0
    && ([v3 _isHosting] & 1) == 0
    && ([(UIPresentationController *)self presentedViewController],
        double v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = _UISheetPresentationControllerStylesSheetsAsCards(v7),
        v7,
        v8))
  {
    double v6 = [(UIPresentationController *)self _internalTraitOverrides];
    [v6 _setNSIntegerValue:2 forTraitToken:0x1ED3F5C10];
  }
  else
  {
    double v6 = [(UIPresentationController *)self _internalTraitOverrides];
    [v6 _removeTraitToken:0x1ED3F5C10];
  }

  double v9 = [(UISheetPresentationController *)self _sheetMetrics];
  [v9 configureDropShadowView:v4 state:v3 presentationController:self];

  double v10 = [(UIPresentationController *)self presentedViewController];
  int v11 = _UISheetPresentationControllerStylesSheetsAsCards(v10);

  if (v11)
  {
    v12 = [(UISheetPresentationController *)self _sheetInteractionIfLoaded];
    double v13 = [(UISheetPresentationController *)self dimmingView];
    uint64_t v14 = [(UISheetPresentationController *)self _confinedDimmingView];
    if (v12)
    {
      objc_msgSend(v12, "setScrollingExpandsToLargerDetentWhenScrolledToEdge:", objc_msgSend(v3, "_prefersScrollingExpandsToLargerDetentWhenScrolledToEdge"));
      if ([v3 _isInteractionEnabled]) {
        uint64_t v15 = [(UISheetPresentationController *)self _isHosting] ^ 1;
      }
      else {
        uint64_t v15 = 0;
      }
      [v12 setEnabled:v15];
      objc_msgSend(v12, "setScrollInteractionEnabled:", objc_msgSend(v3, "_isScrollInteractionEnabled"));
    }
    if ([v3 _isInteractionEnabled]) {
      uint64_t v16 = [(UISheetPresentationController *)self _isPresentedRemotely] ^ 1;
    }
    else {
      uint64_t v16 = 0;
    }
    uint64_t v17 = [(UISheetPresentationController *)self _exteriorPanGestureRecognizer];
    [v17 setEnabled:v16];

    [v3 _hostedFrameOfPresentedViewInContainerView];
    -[UISheetPresentationController setFrameOfPresentedViewInContainerView:](self, "setFrameOfPresentedViewInContainerView:");
    objc_msgSend(v13, "setIgnoresTouches:", objc_msgSend(v3, "_shouldDimmingIgnoreTouches"));
    objc_msgSend(v14, "setIgnoresTouches:", objc_msgSend(v3, "_shouldDimmingIgnoreTouches"));
    objc_msgSend(v13, "setUserInteractionEnabled:", objc_msgSend(v3, "_isDimmingEnabled"));
    objc_msgSend(v14, "setUserInteractionEnabled:", objc_msgSend(v3, "_isDimmingEnabled"));
    [v3 _percentDimmed];
    objc_msgSend(v13, "setPercentDisplayed:");
    [v3 _magicShadowOpacity];
    objc_msgSend(v4, "setMagicShadowAlpha:");
    [v3 _confinedPercentDimmed];
    objc_msgSend(v14, "setPercentDisplayed:");
    [v3 _confinedPercentLightened];
    objc_msgSend(v14, "setPercentLightened:");
    if ([v3 _wantsGrabber]) {
      uint64_t v18 = [v3 _isHosting] ^ 1;
    }
    else {
      uint64_t v18 = 0;
    }
    [v4 _setHasGrabber:v18];
    [v3 _grabberSpacing];
    objc_msgSend(v4, "_setGrabberSpacing:");
    objc_msgSend(v4, "_setGrabberEdge:", objc_msgSend(v3, "_isInverted"));
    [v3 _grabberAlpha];
    objc_msgSend(v4, "_setGrabberAlpha:");
    objc_msgSend(v4, "_setInsetsContentViewForGrabber:", objc_msgSend(v3, "_insetsContentViewForGrabber"));
    objc_msgSend(v4, "_setGrabberBlurEnabled:", objc_msgSend(v3, "_isGrabberBlurEnabled"));
    [v3 _shadowOpacity];
    float v20 = v19;
    double v21 = [v4 layer];
    *(float *)&double v22 = v20;
    [v21 setShadowOpacity:v22];

    [v3 _shadowRadius];
    double v24 = v23;
    v25 = [v4 layer];
    [v25 setShadowRadius:v24];

    if ((!-[UIPresentationController presenting](self, "presenting") || [v3 _isPresented])
      && ![(UIPresentationController *)self dismissing]
      && ![(UIPresentationController *)self _transitioningFrom]
      && ![(UISheetPresentationController *)self _isDraggingAndTransitioning]
      && ![(UISheetPresentationController *)self _isRemoteDismissing]
      && ![(UISheetPresentationController *)self _didTearOff])
    {
      [(UISheetPresentationController *)self _updatePresentedViewFrame];
      [v3 _alpha];
      objc_msgSend(v4, "setAlpha:");
    }
    [v3 _touchInsets];
    objc_msgSend(v4, "setContentTouchInsets:");
    [v3 _hostedCornerRadii];
    objc_msgSend(v4, "setEnvironmentMatchingCornerRadii:");
    self;
    if (fluidPresentationTransitionsEnabled == 1
      && ([(UIPresentationController *)self presentedViewController],
          v26 = objc_claimAutoreleasedReturnValue(),
          uint64_t v27 = [v26 modalTransitionStyle],
          v26,
          v27 != 1)
      || ![(UIPresentationController *)self presenting]
      && ![(UIPresentationController *)self dismissing])
    {
      if (v3)
      {
        [v3 _transform];
      }
      else
      {
        long long v41 = 0u;
        long long v42 = 0u;
        long long v40 = 0u;
      }
      v39[0] = v40;
      v39[1] = v41;
      v39[2] = v42;
      [v4 setTransform:v39];
    }
    [(UISheetPresentationController *)self _updateShouldPresentedViewControllerControlStatusBarAppearance];
    v30 = [(UISheetPresentationController *)self _configuration];
    v31 = [(UISheetPresentationController *)self _connectedRemoteSheet];
    [v31 _setSheetConfiguration:v30];

    char v32 = [v3 _wantsFullScreen];
    if ([(UISheetPresentationController *)self _isPresentedRemotely] && (v32 & 1) == 0)
    {
      v33 = [(UISheetPresentationController *)self _clientRemotePresentationDelegate];
      if (objc_opt_respondsToSelector())
      {
        uint64_t v34 = [v3 _containsFirstResponder];
        uint64_t v35 = [v3 _firstResponderRequiresKeyboard];
        [v3 _keyboardFrame];
        objc_msgSend(v33, "_sheetPresentationControllerDidChangeContainsFirstResponder:firstResponderRequiresKeyboard:keyboardFrame:", v34, v35);
      }
      else
      {
        v36 = objc_alloc_init(_UISheetPresentationControllerClientConfiguration);
        -[_UISheetPresentationControllerClientConfiguration setContainsFirstResponder:](v36, "setContainsFirstResponder:", [v3 _containsFirstResponder]);
        -[_UISheetPresentationControllerClientConfiguration setFirstResponderRequiresKeyboard:](v36, "setFirstResponderRequiresKeyboard:", [v3 _firstResponderRequiresKeyboard]);
        [v3 _keyboardFrame];
        -[_UISheetPresentationControllerClientConfiguration setKeyboardFrame:](v36, "setKeyboardFrame:");
        [v3 _proposedDepthLevel];
        -[_UISheetPresentationControllerClientConfiguration setProposedDepthLevel:](v36, "setProposedDepthLevel:");
        [v33 _sheetPresentationControllerClientConfigurationDidChange:v36];
      }
    }
    v37 = [(UISheetPresentationController *)self _hostManager];
    if (objc_opt_respondsToSelector())
    {
      uint64_t v38 = [v37 shouldOccludeDuringPresentation];
    }
    else if ([v3 _isModelDimmingEnabled])
    {
      uint64_t v38 = [(UISheetPresentationController *)self _isRootPresentation] ^ 1;
    }
    else
    {
      uint64_t v38 = 0;
    }
    [(UISheetPresentationController *)self _setOcclusionEnabled:v38];
  }
}

- (BOOL)_isGeneratingAnimations
{
  v2 = [(UISheetPresentationController *)self _sheetInteractionIfLoaded];
  char v3 = [v2 isGeneratingAnimations];

  return v3;
}

- (_UISheetInteraction)_sheetInteractionIfLoaded
{
  return self->__sheetInteraction;
}

- (_UISheetHostManager)_hostManager
{
  if (!self->__hostManager && ![(UISheetPresentationController *)self _isRootPresentation])
  {
    char v3 = +[UISheetPresentationController _platformHostManagerForController:self];
    hostManager = self->__hostManager;
    self->__hostManager = v3;
  }
  double v5 = self->__hostManager;
  return v5;
}

- (UIDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (_UIRemoteSheet)_connectedRemoteSheet
{
  return self->__connectedRemoteSheet;
}

- (UIDimmingView)_confinedDimmingView
{
  return self->__confinedDimmingView;
}

- (id)_sheetMetrics
{
  v2 = [(UISheetPresentationController *)self _sheetVisualStyle];
  char v3 = [v2 metrics];
  double v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    _UIFallbackSheetMetrics();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  double v6 = v5;

  return v6;
}

- (_UISheetPresentationControllerVisualStyling)_sheetVisualStyle
{
  return self->__sheetVisualStyle;
}

- (void)_updateShouldPresentedViewControllerControlStatusBarAppearance
{
  id v3 = [(UISheetPresentationController *)self _layoutInfo];
  -[UISheetPresentationController _setShouldPresentedViewControllerControlStatusBarAppearance:](self, "_setShouldPresentedViewControllerControlStatusBarAppearance:", [v3 _shouldPresentedViewControllerControlStatusBarAppearance]);
}

- (void)_setShouldPresentedViewControllerControlStatusBarAppearance:(BOOL)a3
{
  if (self->__shouldPresentedViewControllerControlStatusBarAppearance != a3)
  {
    self->__shouldPresentedViewControllerControlStatusBarAppearance = a3;
    double v4 = [(UISheetPresentationController *)self _layoutInfo];
    int v5 = [v4 _isAnyDescendantDragging];

    if (v5)
    {
      double v7 = [[UIStatusBarStyleAnimationParameters alloc] initWithDefaultParameters];
      [(UIStatusBarAnimationParameters *)v7 setSkipFencing:1];
      double v6 = [(UIPresentationController *)self presentedViewController];
      [v6 _setNeedsStatusBarAppearanceUpdateWithAnimationParameters:v7];
    }
    else
    {
      double v7 = [(UIPresentationController *)self presentedViewController];
      [(UIStatusBarStyleAnimationParameters *)v7 setNeedsStatusBarAppearanceUpdate];
    }
  }
}

- (UIPanGestureRecognizer)_exteriorPanGestureRecognizer
{
  return self->__exteriorPanGestureRecognizer;
}

- (void)_setOcclusionEnabled:(BOOL)a3
{
  if (self->__occlusionEnabled != a3)
  {
    BOOL v3 = a3;
    self->__occlusionEnabled = a3;
    int v5 = [(UISheetPresentationController *)self _sheetInteractionIfLoaded];
    int v6 = [v5 isGeneratingAnimations];

    if (v6)
    {
      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __54__UISheetPresentationController__setOcclusionEnabled___block_invoke;
      v7[3] = &unk_1E52D9FC0;
      v7[4] = self;
      BOOL v8 = v3;
      [(id)UIApp _performBlockAfterCATransactionCommits:v7];
    }
    else
    {
      [(UIPresentationController *)self _enableOcclusion:v3];
    }
  }
}

- (void)setFrameOfPresentedViewInContainerView:(CGRect)a3
{
  self->_frameOfPresentedViewInContainerView = a3;
}

- (BOOL)prefersGrabberVisible
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _wantsGrabber];

  return v3;
}

- (double)_grabberTopSpacing
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _grabberSpacing];
  double v4 = v3;

  return v4;
}

- (BOOL)_forceSheetSemanticContext
{
  return self->__forceSheetSemanticContext;
}

- (_UISheetPresentationControllerConfiguration)_configuration
{
  double v3 = [(UISheetPresentationController *)self _layoutInfo];
  double v4 = [(UISheetPresentationController *)self detents];
  int v5 = (void *)[v4 mutableCopy];

  if ([v5 count])
  {
    unint64_t v6 = 0;
    do
    {
      double v7 = [v5 objectAtIndexedSubscript:v6];
      if (![v7 _type])
      {
        BOOL v8 = [v7 identifier];
        [v7 resolvedValueInContext:v3];
        double v9 = +[UISheetPresentationControllerDetent _detentWithIdentifier:constant:](UISheetPresentationControllerDetent, "_detentWithIdentifier:constant:", v8);
        [v5 setObject:v9 atIndexedSubscript:v6];
      }
      ++v6;
    }
    while (v6 < [v5 count]);
  }
  double v10 = objc_alloc_init(_UISheetPresentationControllerConfiguration);
  [(_UISheetPresentationControllerConfiguration *)v10 _setShouldScaleDownBehindDescendantSheets:[(UISheetPresentationController *)self _shouldScaleDownBehindDescendantSheets]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setPeeksWhenFloating:[(UISheetPresentationController *)self _peeksWhenFloating]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setWantsFullScreen:[(UISheetPresentationController *)self _wantsFullScreen]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setWantsBottomAttached:[(UISheetPresentationController *)self _wantsBottomAttached]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setWantsEdgeAttachedInCompactHeight:[(UISheetPresentationController *)self prefersEdgeAttachedInCompactHeight]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setWidthFollowsPreferredContentSizeWhenEdgeAttached:[(UISheetPresentationController *)self widthFollowsPreferredContentSizeWhenEdgeAttached]];
  [(_UISheetPresentationControllerConfiguration *)v10 _prefersGrabberVisible:[(UISheetPresentationController *)self prefersGrabberVisible]];
  [(UISheetPresentationController *)self _grabberTopSpacing];
  -[_UISheetPresentationControllerConfiguration _setGrabberTopSpacing:](v10, "_setGrabberTopSpacing:");
  [(UISheetPresentationController *)self _additionalMinimumTopInset];
  -[_UISheetPresentationControllerConfiguration _setAdditionalMinimumTopInset:](v10, "_setAdditionalMinimumTopInset:");
  [(_UISheetPresentationControllerConfiguration *)v10 _setInsetsPresentedViewForGrabber:[(UISheetPresentationController *)self _insetsPresentedViewForGrabber]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setMode:[(UISheetPresentationController *)self _mode]];
  [(UISheetPresentationController *)self _cornerRadiusForPresentationAndDismissal];
  -[_UISheetPresentationControllerConfiguration _setCornerRadiusForPresentationAndDismissal:](v10, "_setCornerRadiusForPresentationAndDismissal:");
  [(UISheetPresentationController *)self preferredCornerRadius];
  -[_UISheetPresentationControllerConfiguration _setPreferredCornerRadius:](v10, "_setPreferredCornerRadius:");
  [(UISheetPresentationController *)self _preferredShadowOpacity];
  -[_UISheetPresentationControllerConfiguration _setPreferredShadowOpacity:](v10, "_setPreferredShadowOpacity:");
  [(UISheetPresentationController *)self _shadowRadius];
  -[_UISheetPresentationControllerConfiguration _setShadowRadius:](v10, "_setShadowRadius:");
  [(_UISheetPresentationControllerConfiguration *)v10 _setDetents:v5];
  int v11 = [(UISheetPresentationController *)self selectedDetentIdentifier];
  [(_UISheetPresentationControllerConfiguration *)v10 _setSelectedDetentIdentifier:v11];

  v12 = [(UISheetPresentationController *)self _standardAppearance];
  [(_UISheetPresentationControllerConfiguration *)v10 _setStandardAppearance:v12];

  double v13 = [(UISheetPresentationController *)self _edgeAttachedCompactHeightAppearance];
  [(_UISheetPresentationControllerConfiguration *)v10 _setEdgeAttachedCompactHeightAppearance:v13];

  uint64_t v14 = [(UISheetPresentationController *)self _floatingAppearance];
  [(_UISheetPresentationControllerConfiguration *)v10 _setFloatingAppearance:v14];

  [(_UISheetPresentationControllerConfiguration *)v10 _setDetentDirectionWhenFloating:[(UISheetPresentationController *)self _detentDirectionWhenFloating]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setPrefersScrollingResizesWhenDetentDirectionIsDown:[(UISheetPresentationController *)self _prefersScrollingResizesWhenDetentDirectionIsDown]];
  [(_UISheetPresentationControllerConfiguration *)v10 _setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:[(UISheetPresentationController *)self prefersScrollingExpandsWhenScrolledToEdge]];
  uint64_t v15 = [v3 _parentLayoutInfo];
  if (v15)
  {
    uint64_t v16 = [(UIPresentationController *)self presentedViewController];
    NSClassFromString(&cfstr_Uiactivityview.isa);
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0)
    {
      [v15 _depthLevel];
      -[_UISheetPresentationControllerConfiguration _setHostParentDepthLevel:](v10, "_setHostParentDepthLevel:");
      [v15 _stackAlignmentFrame];
      -[_UISheetPresentationControllerConfiguration _setHostParentStackAlignmentFrame:](v10, "_setHostParentStackAlignmentFrame:");
      [v15 _fullHeightUntransformedFrameForDepthLevel];
      -[_UISheetPresentationControllerConfiguration _setHostParentFullHeightUntransformedFrameForDepthLevel:](v10, "_setHostParentFullHeightUntransformedFrameForDepthLevel:");
    }
  }

  return v10;
}

- (int64_t)_mode
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  int64_t v3 = [v2 _mode];

  return v3;
}

- (_UISheetPresentationControllerAppearance)_standardAppearance
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  int64_t v3 = [v2 _standardAppearance];

  return (_UISheetPresentationControllerAppearance *)v3;
}

- (_UISheetPresentationControllerAppearance)_floatingAppearance
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  int64_t v3 = [v2 _floatingAppearance];

  return (_UISheetPresentationControllerAppearance *)v3;
}

- (_UISheetPresentationControllerAppearance)_edgeAttachedCompactHeightAppearance
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  int64_t v3 = [v2 _edgeAttachedCompactHeightAppearance];

  return (_UISheetPresentationControllerAppearance *)v3;
}

- (BOOL)prefersScrollingExpandsWhenScrolledToEdge
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge];

  return v3;
}

- (BOOL)prefersEdgeAttachedInCompactHeight
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _wantsEdgeAttachedInCompactHeight];

  return v3;
}

- (BOOL)_wantsFullScreen
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _wantsFullScreen];

  return v3;
}

- (double)_shadowRadius
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _shadowRadius];
  double v4 = v3;

  return v4;
}

- (BOOL)_prefersScrollingResizesWhenDetentDirectionIsDown
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _prefersScrollingResizesWhenDetentDirectionIsDown];

  return v3;
}

- (double)_preferredShadowOpacity
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _preferredShadowOpacity];
  double v4 = v3;

  return v4;
}

- (BOOL)_peeksWhenFloating
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _peeksWhenFloating];

  return v3;
}

- (BOOL)_insetsPresentedViewForGrabber
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _insetsContentViewForGrabber];

  return v3;
}

- (int64_t)_detentDirectionWhenFloating
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  int64_t v3 = [v2 _wantsInvertedWhenFloating];

  return v3;
}

- (double)_additionalMinimumTopInset
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _additionalMinimumTopInset];
  double v4 = v3;

  return v4;
}

- (BOOL)_isRemoteDismissing
{
  return self->__remoteDismissing;
}

- (BOOL)_didTearOff
{
  return self->__didTearOff;
}

+ (id)_platformHostManagerForController:(id)a3
{
  id v3 = a3;
  double v4 = (void *)__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses;
  int v5 = NSNumber;
  unint64_t v6 = [v3 traitCollection];
  double v7 = objc_msgSend(v5, "numberWithInteger:", objc_msgSend(v6, "userInterfaceIdiom"));
  BOOL v8 = (void *)[v4 objectForKey:v7];

  if (v8)
  {
    BOOL v8 = [v8 managerForPresentationController:v3];
  }

  return v8;
}

- (BOOL)_allowsInteractiveDismissWhenFullScreen
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _allowsInteractiveDismissWhenFullScreen];

  return v3;
}

- (void)_containerViewScreenDidChangeToScreen:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UISheetPresentationController;
  id v4 = a3;
  [(UIPresentationController *)&v10 _containerViewScreenDidChangeToScreen:v4];
  objc_msgSend(v4, "bounds", v10.receiver, v10.super_class);
  double v6 = v5;
  double v8 = v7;

  double v9 = [(UISheetPresentationController *)self _layoutInfo];
  objc_msgSend(v9, "_setScreenSize:", v6, v8);
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _layoutInfo];
  [v1 _layout];
}

- (void)_sheetLayoutInfoLayout:(id)a3
{
  id v4 = [(UIPresentationController *)self containerView];
  [v4 layoutIfNeeded];

  [(UISheetPresentationController *)self _sendPerformLayout];
}

- (void)_sendPerformLayout
{
  id v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _sheetPresentationControllerPerformLayout:self];
  }
}

- (void)_updateLayoutInfoContainerTraitCollection
{
  id v5 = [(UIPresentationController *)self containerView];
  id v3 = [v5 traitCollection];
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setContainerTraitCollection:v3];
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained _layoutInfo];
  id v5 = [v4 _activeDetents];
  double v6 = [v5 objectAtIndexedSubscript:a2];
  [v6 _value];
  double v8 = v7;

  return v8;
}

- (BOOL)_shouldScaleDownBehindDescendantSheets
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _shouldScaleDownBehindDescendants];

  return v3;
}

- (UISheetPresentationControllerDetentIdentifier)selectedDetentIdentifier
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _selectedDetentIdentifier];

  return (UISheetPresentationControllerDetentIdentifier)v3;
}

- (NSArray)detents
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _detents];

  return (NSArray *)v3;
}

- (void)_sendDidInvalidateUntransformedFrame
{
  id v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _sheetPresentationControllerDidInvalidateCurrentPresentedViewFrame:self];
  }
}

- (void)_sheetLayoutInfoDidInvalidateDetentValues:(id)a3
{
  id v4 = [(UISheetPresentationController *)self _sheetInteractionIfLoaded];
  [v4 invalidateDetents];

  [(UISheetPresentationController *)self _sendDidInvalidateDetentValues];
}

- (void)_sendDidInvalidateDetentValues
{
  id v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 _sheetPresentationControllerDidInvalidateDetentValues:self];
  }
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _sheetInteractionIfLoaded];
  [v2 currentOffset];
  double v4 = v3;

  return v4;
}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_7(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _sheetInteractionIfLoaded];
  [v1 invalidateIndexOfCurrentDetent];
}

uint64_t __50__UISheetPresentationController__sheetInteraction__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _layoutInfo];
  uint64_t v3 = [v2 _indexOfCurrentActiveOrDismissDetent];

  return v3;
}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained _layoutInfo];
  [v1 _invalidateCurrentOffset];
}

uint64_t __50__UISheetPresentationController__sheetInteraction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained _layoutInfo];
  uint64_t v3 = [v2 _activeDetents];
  uint64_t v4 = [v3 count];

  return v4;
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double x = self->_frameOfPresentedViewInContainerView.origin.x;
  double y = self->_frameOfPresentedViewInContainerView.origin.y;
  double width = self->_frameOfPresentedViewInContainerView.size.width;
  double height = self->_frameOfPresentedViewInContainerView.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  uint64_t v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _invalidatePreferredSize];

  id v5 = [(UISheetPresentationController *)self _hostManagerIfLoaded];
  if (v5)
  {
    id v6 = v5;
    [v5 preferredContentSizeDidChange];
    id v5 = v6;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__layoutInfo, 0);
  objc_storeStrong(&self->__presentationTransitionWillBegin, 0);
  objc_destroyWeak((id *)&self->__clientRemotePresentationDelegate);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_dropShadowView, 0);
  objc_storeStrong((id *)&self->__exteriorPanGestureRecognizer, 0);
  objc_storeStrong((id *)&self->__lastConfiguration, 0);
  objc_storeStrong((id *)&self->__connectedRemoteSheet, 0);
  objc_storeStrong((id *)&self->__tearOffActivity, 0);
  objc_storeStrong((id *)&self->__tearOffInteraction, 0);
  objc_storeStrong((id *)&self->__interactionController, 0);
  objc_storeStrong((id *)&self->__animationController, 0);
  objc_storeStrong((id *)&self->__confinedDimmingView, 0);
  objc_storeStrong((id *)&self->__sheetVisualStyle, 0);
  objc_storeStrong((id *)&self->__sheetInteraction, 0);
  objc_storeStrong((id *)&self->__hostManager, 0);
}

- (void)presentationTransitionWillBegin
{
  uint64_t v3 = [(UIPresentationController *)self containerView];
  uint64_t v4 = [v3 window];
  id v5 = [(UIPresentationController *)self presentedViewController];
  id v6 = [v5 _backgroundColorForModalFormSheet];

  double v7 = [(UISheetPresentationController *)self dimmingView];
  [v7 setDimmingColor:v6];

  double v8 = [(UISheetPresentationController *)self _confinedDimmingView];
  [v8 setDimmingColor:v6];

  double v9 = [(UIPresentationController *)self presentedViewController];
  char v10 = _UISheetPresentationControllerStylesSheetsAsCards(v9);

  if ((v10 & 1) == 0)
  {
    uint64_t v11 = [(UISheetPresentationController *)self _shouldDismissWhenTappedOutside] ^ 1;
    v12 = [(UISheetPresentationController *)self dimmingView];
    [v12 setIgnoresTouches:v11];

    double v13 = [(UISheetPresentationController *)self _confinedDimmingView];
    [v13 setIgnoresTouches:v11];
  }
  if ([(UISheetPresentationController *)self _isRootPresentation]) {
    BOOL v14 = [(UISheetPresentationController *)self _isPresentedRemotely];
  }
  else {
    BOOL v14 = 1;
  }
  uint64_t v15 = [(UIPresentationController *)self presentedViewController];
  if ((_UISheetPresentationControllerStylesSheetsAsCards(v15) & 1) == 0)
  {

    goto LABEL_17;
  }
  uint64_t v16 = [(UISheetPresentationController *)self _hostManager];

  if (v16)
  {
LABEL_17:
    BOOL v24 = 0;
    uint64_t v23 = 0;
    goto LABEL_18;
  }
  uint64_t v17 = [v3 traitCollection];
  if ([v17 userInterfaceIdiom] == 1)
  {
    uint64_t v18 = [v4 screen];
    [v18 _displayCornerRadius];
    double v20 = v19;

    uint64_t v21 = 3;
    if (!v14) {
      uint64_t v21 = 1;
    }
    uint64_t v22 = 2;
    if (!v14) {
      uint64_t v22 = 0;
    }
    if (v20 == 0.0) {
      uint64_t v23 = v22;
    }
    else {
      uint64_t v23 = v21;
    }
  }
  else
  {

    if (v14) {
      uint64_t v23 = 2;
    }
    else {
      uint64_t v23 = 0;
    }
  }
  BOOL v24 = v14;
LABEL_18:
  v25 = [UIDropShadowView alloc];
  v26 = [(UIPresentationController *)self presentedViewController];
  uint64_t v27 = -[UIDropShadowView initWithFrame:independentCorners:supportsShadow:stylesSheetsAsCards:](v25, "initWithFrame:independentCorners:supportsShadow:stylesSheetsAsCards:", v23, v24, _UISheetPresentationControllerStylesSheetsAsCards(v26), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  dropShadowView = self->_dropShadowView;
  self->_dropShadowView = v27;

  [(UIDropShadowView *)self->_dropShadowView set_delegate:self];
  double v29 = [(UIPresentationController *)self presentingViewController];
  v30 = [(UISheetPresentationController *)self _layoutInfo];
  [v30 _setPresentingViewController:v29];

  v31 = [(UIPresentationController *)self presentedViewController];
  char v32 = [(UISheetPresentationController *)self _layoutInfo];
  [v32 _setPresentedViewController:v31];

  v33 = [(UISheetPresentationController *)self _layoutInfo];
  [v33 _setContainerView:v3];

  uint64_t v34 = [(UISheetPresentationController *)self _parentSheetPresentationController];
  uint64_t v35 = [v34 _layoutInfo];
  v36 = [(UISheetPresentationController *)self _layoutInfo];
  [v36 _setParentSheetLayoutInfo:v35];

  v37 = [(UISheetPresentationController *)self _layoutInfo];
  uint64_t v38 = [v34 _layoutInfo];
  [v38 _setChildSheetLayoutInfo:v37];

  [(UISheetPresentationController *)self _updateLayoutInfoContainerSafeAreaInsets];
  [(UISheetPresentationController *)self _updateLayoutInfoContainerTraitCollection];
  v39 = [(UIPresentationController *)self presentedViewController];
  LODWORD(v38) = _UISheetPresentationControllerStylesSheetsAsCards(v39);

  if (v38)
  {
    if (((byte_1EB25792C == 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_CardsDismissableWithGesture, @"CardsDismissableWithGesture")) == 0&& v14)
    {
      long long v40 = [(UISheetPresentationController *)self dropShadowView];
      long long v41 = [(UISheetPresentationController *)self _sheetInteraction];
      [v40 addInteraction:v41];

      long long v42 = [[UIPanGestureRecognizer alloc] initWithTarget:self action:sel__handleExteriorPan_];
      exteriorPanGestureRecognizer = self->__exteriorPanGestureRecognizer;
      self->__exteriorPanGestureRecognizer = v42;

      [(UIGestureRecognizer *)self->__exteriorPanGestureRecognizer setName:@"com.apple.UIKit.UISheetPresentationControllerExteriorPanGesture"];
      [(UIPanGestureRecognizer *)self->__exteriorPanGestureRecognizer setDelegate:self];
      [v4 addGestureRecognizer:self->__exteriorPanGestureRecognizer];
      if ([(UISheetPresentationController *)self _allowsTearOff])
      {
        CGRect v44 = [(UISheetPresentationController *)self _tearOffInteraction];

        if (v44)
        {
          v45 = [(UISheetPresentationController *)self dropShadowView];
          v46 = [(UISheetPresentationController *)self _tearOffInteraction];
          [v45 addInteraction:v46];
        }
      }
    }
    v47 = [(UISheetPresentationController *)self _expectedRemoteSheet];
    [(UISheetPresentationController *)self _tryToConnectToRemoteSheet:v47];
  }
  [v3 layoutIfNeeded];
  v48 = [(UISheetPresentationController *)self _layoutInfo];
  [v48 _hostedFrameOfPresentedViewInContainerView];
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v57 = [(UISheetPresentationController *)self presentedView];
  objc_msgSend(v57, "_setFrameIgnoringLayerTransform:", v50, v52, v54, v56);

  LODWORD(v57) = os_variant_has_internal_diagnostics();
  v58 = [(UISheetPresentationController *)self dropShadowView];
  [v58 bounds];
  IsEmptdouble y = CGRectIsEmpty(v77);
  if (v57)
  {
    if (IsEmpty)
    {
      v63 = [(UIPresentationController *)self containerView];
      [v63 bounds];
      BOOL v64 = CGRectIsEmpty(v79);

      if (v64) {
        goto LABEL_39;
      }
      v58 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1853B0000, v58, OS_LOG_TYPE_FAULT, "dropShadowView bounds should not be empty!", buf, 2u);
      }
    }
    goto LABEL_38;
  }
  if (!IsEmpty)
  {
LABEL_38:

    goto LABEL_39;
  }
  v60 = [(UIPresentationController *)self containerView];
  [v60 bounds];
  BOOL v61 = CGRectIsEmpty(v78);

  if (!v61)
  {
    v62 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &presentationTransitionWillBegin___s_category_0) + 8);
    if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v75 = 0;
      _os_log_impl(&dword_1853B0000, v62, OS_LOG_TYPE_ERROR, "dropShadowView bounds should not be empty!", v75, 2u);
    }
  }
LABEL_39:
  v65 = [(UISheetPresentationController *)self _hostManager];

  if (!v65)
  {
    v66 = [(UIPresentationController *)self presentedViewController];
    v67 = [v66 view];
    v68 = [(UISheetPresentationController *)self dropShadowView];
    [v68 setContentView:v67];

    v69 = [(UISheetPresentationController *)self dropShadowView];
    v70 = [(UIPresentationController *)self presentedViewController];
    [v70 setDropShadowView:v69];
  }
  if ([(UISheetPresentationController *)self _isRootPresentation])
  {
    v71 = [(UISheetPresentationController *)self dropShadowView];
    [v71 setAutoresizingMask:18];
  }
  [(UISheetPresentationController *)self _registerForKeyboardNotificationsIfNecessary];
  [(UISheetPresentationController *)self _transitionWillBegin:1];
  uint64_t v72 = [(UISheetPresentationController *)self _presentationTransitionWillBegin];
  v73 = (void *)v72;
  if (v72) {
    (*(void (**)(uint64_t))(v72 + 16))(v72);
  }
  [(UISheetPresentationController *)self set_presentationTransitionWillBegin:0];
  v74 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v74 postNotificationName:@"_UISheetWillAppearNotification" object:0];
}

- (UISheetPresentationController)_parentSheetPresentationController
{
  uint64_t v3 = [(UIPresentationController *)self _parentPresentationController];
  if (v3)
  {
    do
    {
      if ([v3 _isPresentedInFullScreen]) {
        break;
      }
      uint64_t v4 = [v3 _parentPresentationController];

      uint64_t v3 = (void *)v4;
    }
    while (v4);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (int v5 = [(UIPresentationController *)self shouldPresentInFullscreen],
        v5 == [v3 shouldPresentInFullscreen]))
  {
    id v6 = v3;
  }
  else
  {
    id v6 = 0;
  }

  return (UISheetPresentationController *)v6;
}

- (void)_updatePresentedViewFrame
{
  id v12 = [(UISheetPresentationController *)self _layoutInfo];
  [v12 _hostedUntransformedFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(UISheetPresentationController *)self presentedView];
  objc_msgSend(v11, "_setFrameIgnoringLayerTransform:", v4, v6, v8, v10);
}

- (void)_tryToConnectToRemoteSheet:(id)a3
{
  id v14 = a3;
  id v4 = [(UISheetPresentationController *)self _expectedRemoteSheet];
  if (v4 != v14)
  {

LABEL_4:
    double v6 = 0;
    goto LABEL_5;
  }
  double v5 = [(UISheetPresentationController *)self _hostManager];

  if (v5) {
    goto LABEL_4;
  }
  double v6 = (_UIRemoteSheet *)v14;
LABEL_5:
  p_connectedRemoteSheet = &self->__connectedRemoteSheet;
  connectedRemoteSheet = self->__connectedRemoteSheet;
  if (connectedRemoteSheet != v6)
  {
    if (connectedRemoteSheet)
    {
      double v9 = +[_UISheetPresentationControllerConfiguration _fullScreenConfiguration];
      [(_UIRemoteSheet *)*p_connectedRemoteSheet _setSheetConfiguration:v9];

      [(_UIRemoteSheet *)*p_connectedRemoteSheet _setViewClipsToBounds:1];
    }
    objc_storeStrong((id *)&self->__connectedRemoteSheet, v6);
    BOOL v10 = [(UISheetPresentationController *)self _isHosting];
    uint64_t v11 = [(UISheetPresentationController *)self _layoutInfo];
    [v11 _setHosting:v10];

    if (*p_connectedRemoteSheet)
    {
      id v12 = [(UISheetPresentationController *)self _configuration];
      [(_UIRemoteSheet *)*p_connectedRemoteSheet _setSheetConfiguration:v12];

      [(_UIRemoteSheet *)*p_connectedRemoteSheet _setViewClipsToBounds:0];
    }
    double v13 = [(UIPresentationController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v13 _sheetPresentationControllerDidChangeHosting:self];
    }
  }
}

- (_UIRemoteSheet)_expectedRemoteSheet
{
  v2 = [(UIPresentationController *)self presentedViewController];
  int v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || !v3
    || ([v2 _containedRemoteViewController], (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_ForceSheetHosting, @"ForceSheetHosting") & 1) != 0|| !byte_1EB25793C|| (v5 = objc_opt_class(), _UISheetPresentationControllerFindViewControllerOfClass(v2, v5), (id v4 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      uint64_t v6 = objc_opt_class();
      double v7 = _UISheetPresentationControllerFindViewControllerOfClass(v2, v6);
      id v4 = [v7 _remoteSheet];

      if (!v4)
      {
        if ((objc_opt_respondsToSelector() & v3) == 1)
        {
          id v4 = [v2 _remoteSheet];
        }
        else
        {
          id v4 = 0;
        }
      }
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0 && ![v4 _allowsConnection]) {
    id v8 = 0;
  }
  else {
    id v8 = v4;
  }

  return (_UIRemoteSheet *)v8;
}

- (void)set_presentationTransitionWillBegin:(id)a3
{
}

- (void)_registerForKeyboardNotificationsIfNecessary
{
  if ([(UISheetPresentationController *)self _isRootPresentation]) {
    char v3 = ![(UISheetPresentationController *)self _isPresentedRemotely];
  }
  else {
    char v3 = 0;
  }
  if (![(UISheetPresentationController *)self _hasRegisteredForKeyboardNotifications]&& (v3 & 1) == 0)
  {
    id v4 = [(UIPresentationController *)self presentedViewController];
    int v5 = _UISheetPresentationControllerStylesSheetsAsCards(v4);

    if (v5)
    {
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 addObserver:self selector:sel__keyboardAboutToShow_ name:@"UIKeyboardPrivateWillShowNotification" object:0];
      [v8 addObserver:self selector:sel__keyboardAboutToHide_ name:@"UIKeyboardPrivateWillHideNotification" object:0];
      [v8 addObserver:self selector:sel__keyboardAboutToChangeFrame_ name:@"UIKeyboardPrivateWillChangeFrameNotification" object:0];
      uint64_t v6 = [(UIPresentationController *)self containerView];
      double v7 = [v6 window];
      [v8 addObserver:self selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:v7];

      [(UISheetPresentationController *)self _setHasRegisteredForKeyboardNotifications:1];
    }
  }
}

- (id)_presentationTransitionWillBegin
{
  return self->__presentationTransitionWillBegin;
}

- (BOOL)_hasRegisteredForKeyboardNotifications
{
  return self->__hasRegisteredForKeyboardNotifications;
}

- (void)_containerViewBoundsDidChange
{
  id v12 = [(UIPresentationController *)self containerView];
  [v12 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  uint64_t v11 = [(UISheetPresentationController *)self _layoutInfo];
  objc_msgSend(v11, "_setContainerBounds:", v4, v6, v8, v10);
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _layoutInfo];
  [v1 _setTransitioning:0];
}

- (void)_transitionWillBegin:(BOOL)a3
{
  BOOL v3 = a3;
  v58[4] = *MEMORY[0x1E4F143B8];
  double v5 = [(UIPresentationController *)self _definiteTransitionCoordinator];
  double v6 = [(UISheetPresentationController *)self _hostManager];
  if (v6)
  {
    double v7 = [(UISheetPresentationController *)self _layoutInfo];
    [v7 _setPresented:v3];

    [v6 transitionWillBegin:v3];
    goto LABEL_32;
  }
  if (![(UISheetPresentationController *)self _isRootPresentation])
  {
    double v8 = [(UISheetPresentationController *)self _parentSheetPresentationController];
    if (v8
      && ([(UIPresentationController *)self presentedViewController],
          double v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = _UISheetPresentationControllerStylesSheetsAsCards(v9),
          v9,
          v10))
    {
      if (!v3)
      {
        v56[0] = MEMORY[0x1E4F143A8];
        v56[1] = 3221225472;
        v56[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke;
        v56[3] = &unk_1E52DA598;
        id v57 = v8;
        [v5 animateAlongsideTransition:0 completion:v56];
        uint64_t v21 = v57;
        goto LABEL_11;
      }
      uint64_t v11 = [(UISheetPresentationController *)self _confinedDimmingView];
      id v12 = [v8 dropShadowView];
      [v12 setOverlayView:v11];
    }
    else if (!v3)
    {
LABEL_12:

      goto LABEL_13;
    }
    double v13 = [(UIPresentationController *)self containerView];
    id v14 = [(UISheetPresentationController *)self dimmingView];
    [v13 addSubview:v14];

    v36 = (void *)MEMORY[0x1E4F5B268];
    v45 = [(UISheetPresentationController *)self dimmingView];
    objc_super v43 = [v45 centerXAnchor];
    CGRect v44 = [(UIPresentationController *)self containerView];
    long long v42 = [v44 centerXAnchor];
    long long v41 = [v43 constraintEqualToAnchor:v42];
    v58[0] = v41;
    long long v40 = [(UISheetPresentationController *)self dimmingView];
    uint64_t v38 = [v40 centerYAnchor];
    v39 = [(UIPresentationController *)self containerView];
    v37 = [v39 centerYAnchor];
    uint64_t v35 = [v38 constraintEqualToAnchor:v37];
    v58[1] = v35;
    uint64_t v34 = [(UISheetPresentationController *)self dimmingView];
    char v32 = [v34 widthAnchor];
    v33 = [(UIPresentationController *)self containerView];
    v31 = [v33 widthAnchor];
    v30 = [v32 constraintEqualToAnchor:v31 multiplier:3.0];
    v58[2] = v30;
    uint64_t v15 = [(UISheetPresentationController *)self dimmingView];
    [v15 heightAnchor];
    uint64_t v16 = v46 = v8;
    uint64_t v17 = [(UIPresentationController *)self containerView];
    uint64_t v18 = [v17 heightAnchor];
    double v19 = [v16 constraintEqualToAnchor:v18 multiplier:3.0];
    v58[3] = v19;
    double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
    [v36 activateConstraints:v20];

    double v8 = v46;
    uint64_t v21 = v45;
LABEL_11:

    goto LABEL_12;
  }
LABEL_13:
  uint64_t v22 = [(UIPresentationController *)self presentedViewController];
  if (_UISheetPresentationControllerStylesSheetsAsCards(v22))
  {

LABEL_16:
    BOOL v24 = [(UISheetPresentationController *)self _layoutInfo];
    [v24 _setTransitioning:1];

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_2;
    v54[3] = &unk_1E52E7B28;
    v54[4] = self;
    BOOL v55 = v3;
    v53[0] = MEMORY[0x1E4F143A8];
    v53[1] = 3221225472;
    v53[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_4;
    v53[3] = &unk_1E52DA598;
    v53[4] = self;
    if (([v5 animateAlongsideTransition:v54 completion:v53] & 1) == 0)
    {
      v25 = [(UISheetPresentationController *)self _layoutInfo];
      [v25 _setPresented:v3];
    }
    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_5;
    v51[3] = &unk_1E52E7B28;
    v51[4] = self;
    BOOL v52 = v3;
    [v5 notifyWhenInteractionChangesUsingBlock:v51];
    goto LABEL_20;
  }
  BOOL v23 = [(UISheetPresentationController *)self _isRootPresentation];

  if (v23) {
    goto LABEL_16;
  }
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_6;
  v49[3] = &unk_1E52E7B28;
  v49[4] = self;
  BOOL v50 = v3;
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_7;
  v47[3] = &unk_1E52E7B28;
  v47[4] = self;
  BOOL v48 = v3;
  [v5 animateAlongsideTransition:v49 completion:v47];
LABEL_20:
  v26 = [(UIPresentationController *)self presentedViewController];
  int v27 = _UISheetPresentationControllerStylesSheetsAsCards(v26);

  if (v27)
  {
    if ([(UISheetPresentationController *)self _isHosting]
      && ([(UIPresentationController *)self _transitioningFrom]
       || [(UIPresentationController *)self dismissing]
       && ![(UISheetPresentationController *)self _isDraggingAndTransitioning])
      && ![(UISheetPresentationController *)self _dismissingHorizontallyAlongsideNavigationPop])
    {
      [(UISheetPresentationController *)self _tryToConnectToRemoteSheet:0];
      self->_wantsContentOverlayInsetsUpdatesWhileDismissing = 1;
      if ([(UIPresentationController *)self dismissing])
      {
        double v29 = [(UISheetPresentationController *)self _layoutInfo];
        [v29 _layout];

        [(UISheetPresentationController *)self _updatePresentedViewFrame];
      }
    }
    else if ([(UIPresentationController *)self _transitioningTo])
    {
      id v28 = [(UISheetPresentationController *)self _expectedRemoteSheet];
      [(UISheetPresentationController *)self _tryToConnectToRemoteSheet:v28];
    }
  }
  if (!v3
    && ([(UISheetPresentationController *)self _isDraggingAndTransitioning]
     || [(UISheetPresentationController *)self _isDimmingViewTapDismissing]))
  {
    [(UIPresentationController *)self _sendDismissalsAsNeeded];
  }
LABEL_32:
}

- (BOOL)_isHosting
{
  v2 = [(UISheetPresentationController *)self _connectedRemoteSheet];
  BOOL v3 = v2 != 0;

  return v3;
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  double v4 = [*(id *)(a1 + 32) _animationController];
  if (v4 && ([*(id *)(a1 + 32) _isHosting] & 1) == 0)
  {
    [v4 sourceFrame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v13 = [*(id *)(a1 + 32) _layoutInfo];
    objc_msgSend(v13, "_setDismissSourceFrame:", v6, v8, v10, v12);
  }
  BOOL v14 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
  if (v14)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __54__UISheetPresentationController__transitionWillBegin___block_invoke_3;
    v18[3] = &unk_1E52D9F70;
    v18[4] = *(void *)(a1 + 32);
    +[UIView performWithoutAnimation:v18];
  }
  if (([v3 isInteractive] & 1) == 0)
  {
    uint64_t v15 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v16 = [*(id *)(a1 + 32) _layoutInfo];
    [v16 _setPresented:v15];
  }
  if (v14)
  {
    uint64_t v17 = [*(id *)(a1 + 32) _layoutInfo];
    [v17 _layout];
  }
}

- (_UISheetAnimationController)_animationController
{
  return self->__animationController;
}

- (void)_setHasRegisteredForKeyboardNotifications:(BOOL)a3
{
  self->__hasRegisteredForKeyboardNotifications = a3;
}

- (BOOL)_isDimmingViewTapDismissing
{
  return self->__dimmingViewTapDismissing;
}

- (BOOL)_allowsTearOff
{
  return self->__allowsTearOff;
}

- (void)executeTransitionCompletionBlock
{
  v4.receiver = self;
  v4.super_class = (Class)UISheetPresentationController;
  [(UIPresentationController *)&v4 executeTransitionCompletionBlock];
  id v3 = [(UISheetPresentationController *)self _hostManager];
  if (objc_opt_respondsToSelector()) {
    [v3 executeTransitionCompletionBlock];
  }
}

- (BOOL)_shouldOccludeDuringPresentation
{
  v2 = [(UIPresentationController *)self presentedViewController];
  char v3 = _UISheetPresentationControllerStylesSheetsAsCards(v2) ^ 1;

  return v3;
}

- (void)presentationTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(UISheetPresentationController *)self _transitionDidEnd:1 completed:a3];
  if (v3)
  {
    double v9 = [(UIPresentationController *)self delegate];
    char v5 = objc_opt_respondsToSelector();
    double v6 = v9;
    if (v5)
    {
      double v7 = [v9 _sheetPresentationControllerViewForTouchContinuation:self];
      if (v7)
      {
        double v8 = [(id)UIApp _gestureEnvironment];
        -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v8, v7);
      }
      double v6 = v9;
    }
  }
}

- (void)_transitionDidEnd:(BOOL)a3 completed:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(UISheetPresentationController *)self _setAnimatedTransition:0];
  [(UISheetPresentationController *)self _setInteractiveTransition:0];
  if (v4)
  {
    double v7 = [(UISheetPresentationController *)self dropShadowView];
    [v7 _setGrabberLumaTrackingEnabled:v5];
  }
  id v8 = [(UISheetPresentationController *)self _hostManager];
  if (objc_opt_respondsToSelector()) {
    [v8 transitionDidEnd:v5];
  }
}

- (void)_setInteractiveTransition:(id)a3
{
}

- (void)_setAnimatedTransition:(id)a3
{
}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  BOOL v3 = a3;
  [(UISheetPresentationController *)self _transitionDidEnd:0 completed:a3];
  if (v3)
  {
    [(UISheetPresentationController *)self _setPresentsWithGesture:0];
    [(UISheetPresentationController *)self _setOcclusionEnabled:0];
    BOOL v5 = [(UIPresentationController *)self presentedViewController];
    [v5 setDropShadowView:0];

    double v6 = [(UISheetPresentationController *)self dropShadowView];
    [v6 setContentView:0];

    id v13 = [(UISheetPresentationController *)self _exteriorPanGestureRecognizer];
    if (v13)
    {
      double v7 = [v13 view];
      [v7 removeGestureRecognizer:v13];
    }
    id v8 = [(UISheetPresentationController *)self _parentSheetPresentationController];
    double v9 = [(UISheetPresentationController *)self _layoutInfo];
    [v9 _setParentSheetLayoutInfo:0];

    double v10 = [v8 _layoutInfo];
    [v10 _setChildSheetLayoutInfo:0];

    [(UISheetPresentationController *)self _tryToConnectToRemoteSheet:0];
    self->_wantsContentOverlayInsetsUpdatesWhileDismissing = 0;
    double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 postNotificationName:@"_UISheetDidDisappearNotification" object:0];

    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 removeObserver:self name:@"UIKeyboardPrivateWillShowNotification" object:0];
    [v12 removeObserver:self name:@"UIKeyboardPrivateWillHideNotification" object:0];
    [v12 removeObserver:self name:@"UIKeyboardPrivateWillChangeFrameNotification" object:0];
    [v12 removeObserver:self name:@"UIWindowFirstResponderDidChangeNotification" object:0];
  }
}

- (void)_setPresentsWithGesture:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setPresentsWithGesture:v3];
}

- (int64_t)presentationStyle
{
  if ([(UISheetPresentationController *)self _mode]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (UISheetPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  v15.receiver = self;
  v15.super_class = (Class)UISheetPresentationController;
  id v4 = [(UIPresentationController *)&v15 initWithPresentedViewController:a3 presentingViewController:a4];
  if (v4)
  {
    BOOL v5 = [_UISheetLayoutInfo alloc];
    double v6 = [(UISheetPresentationController *)v4 _sheetMetrics];
    uint64_t v7 = [(_UISheetLayoutInfo *)v5 initWithMetrics:v6];
    layoutInfo = v4->__layoutInfo;
    v4->__layoutInfo = (_UISheetLayoutInfo *)v7;

    [(_UISheetLayoutInfo *)v4->__layoutInfo _setDelegate:v4];
    [(_UISheetLayoutInfo *)v4->__layoutInfo _setAlwaysAllowsEdgeAttached:[(UISheetPresentationController *)v4 _isRootPresentation]];
    v4->__allowsTearOff = (byte_1EB257934 != 0) & ~_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_MakeAllSheetsTearable, @"MakeAllSheetsTearable");
    double v9 = objc_alloc_init(UIDimmingView);
    dimmingView = v4->_dimmingView;
    v4->_dimmingView = v9;

    [(UIView *)v4->_dimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDimmingView *)v4->_dimmingView setSuppressesBackdrops:1];
    [(UIDimmingView *)v4->_dimmingView setHitTestsAsOpaque:0];
    [(UIDimmingView *)v4->_dimmingView setDelegate:v4];
    double v11 = objc_alloc_init(UIDimmingView);
    confinedDimmingView = v4->__confinedDimmingView;
    v4->__confinedDimmingView = v11;

    [(UIView *)v4->__confinedDimmingView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIDimmingView *)v4->__confinedDimmingView setSuppressesBackdrops:1];
    [(UIDimmingView *)v4->__confinedDimmingView setHitTestsAsOpaque:0];
    [(UIDimmingView *)v4->__confinedDimmingView setDelegate:v4];
    v4->__exteriorPanGestureEnabled = 1;
    -[UISheetPresentationController _setMode:](v4, "_setMode:", [(id)objc_opt_class() _initialMode]);
    [(UIPresentationController *)v4 _setContainerIgnoresDirectTouchEvents:1];
    v4->__shouldPresentedViewControllerControlStatusBarAppearance = [(UISheetPresentationController *)v4 _isRootPresentation];
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v13 addObserver:v4 selector:sel__accessibilityReduceMotionStatusDidChange name:@"UIAccessibilityReduceMotionStatusDidChangeNotification" object:0];
  }
  return v4;
}

- (BOOL)_isRootPresentation
{
  return 0;
}

- (void)_setMode:(int64_t)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setMode:a3];
}

- (void)_setWantsFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWantsFullScreen:v3];
}

+ (int64_t)_initialMode
{
  v2 = _UIFallbackSheetMetrics();
  int64_t v3 = [v2 defaultMode];

  return v3;
}

- (BOOL)_tucksIntoUnsafeAreaInCompactHeight
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _tucksIntoUnsafeAreaInCompactHeight];

  return v3;
}

- (CGRect)_currentPresentedViewFrame
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _untransformedFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)_setShouldScaleDownBehindDescendantSheets:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setShouldScaleDownBehindDescendants:v3];
}

- (BOOL)_shouldPreserveFirstResponder
{
  BOOL v3 = [(UISheetPresentationController *)self _hostManager];
  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 shouldPreserveFirstResponder];
  }
  else {
    char v4 = [(UISheetPresentationController *)self _isDimmingAlwaysVisible];
  }
  BOOL v5 = v4;

  return v5;
}

- (id)_preferredInteractionControllerForTransition:(BOOL)a3 animator:(id)a4
{
  id v5 = a4;
  double v6 = [(UIPresentationController *)self presentedViewController];
  int v7 = _UISheetPresentationControllerStylesSheetsAsCards(v6);

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(UISheetPresentationController *)self _setAnimatedTransition:v5];
      objc_initWeak(&location, self);
      uint64_t v19 = MEMORY[0x1E4F143A8];
      objc_copyWeak(&v20, &location);
      double v8 = [(UISheetPresentationController *)self _animationController];
      [v8 setDefaultSourceFrameProvider:&v19];

      double v9 = [(UISheetPresentationController *)self _sheetInteraction];
      [v9 attachmentPoint];
      double v11 = v10;
      double v13 = v12;
      double v14 = [(UISheetPresentationController *)self _animationController];
      objc_msgSend(v14, "setAttachmentPoint:", v11, v13);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    objc_super v15 = [(UISheetPresentationController *)self _interactionController];
    if (!v15)
    {
      if (![(UISheetPresentationController *)self _isDraggingAndTransitioning])
      {
LABEL_8:
        uint64_t v17 = [(UISheetPresentationController *)self _interactionController];
        goto LABEL_10;
      }
      uint64_t v16 = objc_alloc_init(UIPercentDrivenInteractiveTransition);
      [(UISheetPresentationController *)self _setInteractiveTransition:v16];

      objc_super v15 = [(UISheetPresentationController *)self _interactionController];
      [v15 setWantsInteractiveStart:1];
    }

    goto LABEL_8;
  }
  uint64_t v17 = 0;
LABEL_10:

  return v17;
}

- (UIPercentDrivenInteractiveTransition)_interactionController
{
  return self->__interactionController;
}

- (void)dismissalTransitionWillBegin
{
  if (![(UISheetPresentationController *)self _isDraggingAndTransitioning])
  {
    BOOL v3 = [(UISheetPresentationController *)self _sheetInteractionIfLoaded];
    char v4 = v3;
    if (v3 && [v3 isEnabled])
    {
      [v4 setEnabled:0];
      [v4 setEnabled:1];
    }
    id v5 = [(UISheetPresentationController *)self _exteriorPanGestureRecognizer];
    double v6 = v5;
    if (v5 && [v5 isEnabled])
    {
      [v6 setEnabled:0];
      [v6 setEnabled:1];
    }
  }
  [(UISheetPresentationController *)self _transitionWillBegin:0];
}

- (BOOL)_isDraggingAndTransitioning
{
  return self->__draggingAndTransitioning;
}

- (id)_preferredInteractionControllerForPresentation:(id)a3
{
  return [(UISheetPresentationController *)self _preferredInteractionControllerForTransition:1 animator:a3];
}

- (BOOL)_isDimmingAlwaysVisible
{
  BOOL v3 = [(UISheetPresentationController *)self _standardAppearance];
  int v4 = [v3 _isDimmingAlwaysVisible];

  id v5 = [(UISheetPresentationController *)self _edgeAttachedCompactHeightAppearance];
  double v6 = v5;
  if (v5) {
    int v7 = 0;
  }
  else {
    int v7 = v4;
  }
  if (v5 && v4) {
    int v7 = [v5 _isDimmingAlwaysVisible];
  }
  double v8 = [(UISheetPresentationController *)self _floatingAppearance];
  double v9 = v8;
  if (v8) {
    char v10 = 0;
  }
  else {
    char v10 = v7;
  }
  if (v8 && v7) {
    char v10 = [v8 _isDimmingAlwaysVisible];
  }

  return v10;
}

- (void)setPrefersGrabberVisible:(BOOL)prefersGrabberVisible
{
  BOOL v3 = prefersGrabberVisible;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWantsGrabber:v3];
}

- (NSArray)_detentValues
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  BOOL v3 = [v2 _detentValues];
  id v4 = (void *)[v3 copy];

  return (NSArray *)v4;
}

- (void)setPrefersPageSizing:(BOOL)prefersPageSizing
{
}

- (id)_createVisualStyleForProvider:(id)a3
{
  id v4 = a3;
  id v5 = [v4 styleForSheetPresentationController:self];
  sheetVisualStyle = self->__sheetVisualStyle;
  self->__sheetVisualStyle = v5;

  int v7 = self->__sheetVisualStyle;
  if (v7)
  {
    double v8 = v7;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)UISheetPresentationController;
    double v8 = [(UIPresentationController *)&v11 _createVisualStyleForProvider:v4];
  }
  double v9 = v8;

  return v9;
}

- (_UISheetInteraction)_sheetInteraction
{
  sheetInteraction = self->__sheetInteraction;
  if (!sheetInteraction)
  {
    id v4 = objc_alloc_init(_UISheetInteraction);
    id v5 = self->__sheetInteraction;
    self->__sheetInteraction = v4;

    [(_UISheetInteraction *)self->__sheetInteraction setDelegate:self];
    objc_initWeak(location, self);
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke;
    v25[3] = &unk_1E530A108;
    objc_copyWeak(&v26, location);
    [(_UISheetInteraction *)self->__sheetInteraction setNumberOfDetentsGetter:v25];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_2;
    v23[3] = &unk_1E530A130;
    objc_copyWeak(&v24, location);
    [(_UISheetInteraction *)self->__sheetInteraction setDetentGetter:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_3;
    v21[3] = &unk_1E530A158;
    objc_copyWeak(&v22, location);
    [(_UISheetInteraction *)self->__sheetInteraction setIndexOfCurrentDetentGetter:v21];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_4;
    v19[3] = &unk_1E530A180;
    objc_copyWeak(&v20, location);
    [(_UISheetInteraction *)self->__sheetInteraction setRubberBandExtentBeyondMinimumOffsetGetter:v19];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_5;
    v17[3] = &unk_1E530A180;
    objc_copyWeak(&v18, location);
    [(_UISheetInteraction *)self->__sheetInteraction setRubberBandExtentBeyondMaximumOffsetGetter:v17];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_6;
    v15[3] = &unk_1E52DC308;
    objc_copyWeak(&v16, location);
    [(_UISheetInteraction *)self->__sheetInteraction setCurrentOffsetWasInvalidated:v15];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_7;
    v13[3] = &unk_1E52DC308;
    objc_copyWeak(&v14, location);
    [(_UISheetLayoutInfo *)self->__layoutInfo set_indexOfCurrentActiveOrDismissDetentWasInvalidated:v13];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_8;
    v11[3] = &unk_1E52DC308;
    objc_copyWeak(&v12, location);
    [(_UISheetLayoutInfo *)self->__layoutInfo set_rubberBandExtentBeyondMinimumOffsetWasInvalidated:v11];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_9;
    v9[3] = &unk_1E52DC308;
    objc_copyWeak(&v10, location);
    [(_UISheetLayoutInfo *)self->__layoutInfo set_rubberBandExtentBeyondMaximumOffsetWasInvalidated:v9];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50__UISheetPresentationController__sheetInteraction__block_invoke_10;
    v7[3] = &unk_1E530A1A8;
    objc_copyWeak(&v8, location);
    [(_UISheetLayoutInfo *)self->__layoutInfo _setCurrentOffsetGetter:v7];
    objc_destroyWeak(&v8);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(location);
    sheetInteraction = self->__sheetInteraction;
  }
  return sheetInteraction;
}

- (void)_setWantsBottomAttached:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWantsEdgeAttached:v3];
}

- (void)_setAllowsInteractiveDismissWhenFullScreen:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setAllowsInteractiveDismissWhenFullScreen:v3];
}

- (void)setDetents:(NSArray *)detents
{
  id v8 = detents;
  if ([(NSArray *)v8 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [(NSArray *)v8 objectAtIndexedSubscript:v4];
      if ([v5 _createdWithDeprecatedInitializer])
      {
        double v6 = objc_msgSend(NSString, "stringWithFormat:", @"com.apple.UIKit.deprecated-%lu", v4);
        [v5 _setIdentifier:v6];
      }
      ++v4;
    }
    while (v4 < [(NSArray *)v8 count]);
  }
  int v7 = [(UISheetPresentationController *)self _layoutInfo];
  [v7 _setDetents:v8];
}

- (void)setSelectedDetentIdentifier:(UISheetPresentationControllerDetentIdentifier)selectedDetentIdentifier
{
  unint64_t v4 = selectedDetentIdentifier;
  id v5 = [(UISheetPresentationController *)self _layoutInfo];
  [v5 _setSelectedDetentIdentifier:v4];
}

- (void)_setDetentDirectionWhenFloating:(int64_t)a3
{
  BOOL v3 = a3 == 1;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWantsInvertedWhenFloating:v3];
}

- (void)setWidthFollowsPreferredContentSizeWhenEdgeAttached:(BOOL)widthFollowsPreferredContentSizeWhenEdgeAttached
{
  BOOL v3 = widthFollowsPreferredContentSizeWhenEdgeAttached;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWidthFollowsPreferredContentSizeWhenEdgeAttached:v3];
}

- (void)setPrefersEdgeAttachedInCompactHeight:(BOOL)prefersEdgeAttachedInCompactHeight
{
  BOOL v3 = prefersEdgeAttachedInCompactHeight;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWantsEdgeAttachedInCompactHeight:v3];
}

- (void)_setPrefersScrollingResizesWhenDetentDirectionIsDown:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setPrefersScrollingResizesWhenDetentDirectionIsDown:v3];
}

- (void)_setPeeksWhenFloating:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setPeeksWhenFloating:v3];
}

- (void)_setAdditionalMinimumTopInset:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setAdditionalMinimumTopInset:a3];
}

- (void)_setWantsFloatingInRegularWidthCompactHeight:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setWantsFloatingInRegularWidthCompactHeight:v3];
}

- (void)_setMarginInRegularWidthRegularHeight:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setMarginInRegularWidthRegularHeight:a3];
}

- (void)_setMarginInCompactHeight:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setMarginInCompactHeight:a3];
}

- (void)_setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setHidden:v3];
}

- (void)_setAllowsAsymmetricVerticalMargins:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setAllowsAsymmetricVerticalMargins:v3];
}

- (void)_setHorizontalAlignment:(int64_t)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setHorizontalAlignment:a3];
}

- (void)_setTucksIntoUnsafeAreaInCompactHeight:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setTucksIntoUnsafeAreaInCompactHeight:v3];
}

- (void)_setSheetID:(id)a3
{
  id v4 = a3;
  id v5 = [(UISheetPresentationController *)self _layoutInfo];
  [v5 _setSheetID:v4];
}

- (void)_setGrabberTopSpacing:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setGrabberSpacing:a3];
}

- (void)_setGrabberBlurEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setGrabberBlurEnabled:v3];
}

- (void)_setFloatingAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(UISheetPresentationController *)self _layoutInfo];
  [v5 _setFloatingAppearance:v4];
}

- (void)_setStandardAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(UISheetPresentationController *)self _layoutInfo];
  [v5 _setStandardAppearance:v4];
}

- (BOOL)_isDragging
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _isDragging];

  return v3;
}

+ (void)_registerPlatformHostProvider:(Class)a3 forIdiom:(int64_t)a4
{
  if (!__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    double v9 = (void *)__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses;
    __UISheetPresentationControllerIdiomsToPlatformHostProviderClasses = v8;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    objc_super v11 = [MEMORY[0x1E4F28B00] currentHandler];
    id v12 = NSStringFromClass(a3);
    [v11 handleFailureInMethod:a2, a1, @"UISheetPresentationController.m", 392, @"platformHostProvider of type %@ does not conform to _UISheetHostManagerProvider.", v12 object file lineNumber description];
  }
  id v10 = (void *)__UISheetPresentationControllerIdiomsToPlatformHostProviderClasses;
  id v13 = [NSNumber numberWithInteger:a4];
  [v10 setObject:a3 forKey:v13];
}

- (void)_configureHostWindow:(id)a3
{
  id v12 = a3;
  [v12 _setOverrideParentTraitEnvironment:self];
  id v4 = [v12 _rootPresentationController];
  objc_msgSend(v4, "set_forceSheetSemanticContext:", 1);

  id v5 = [(UIPresentationController *)self _realSourceView];
  double v6 = [v5 window];
  int v7 = v6;
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    double v9 = [(UIPresentationController *)self presentingViewController];
    id v10 = [v9 view];
    id v8 = [v10 window];
  }
  objc_super v11 = [v8 _normalInheritedTintColor];
  [v12 setTintColor:v11];

  [v12 makeKeyWindow];
}

- (void)_configureRootPresentationControllerForHostWindow:(id)a3
{
  id v3 = [a3 _rootPresentationController];
  objc_msgSend(v3, "set_shouldDisableAppearanceCallbacksForPresentedViewController:", 1);
}

- (int64_t)_horizontalAlignment
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  int64_t v3 = [v2 _horizontalAlignment];

  return v3;
}

- (double)_marginInCompactHeight
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _marginInCompactHeight];
  double v4 = v3;

  return v4;
}

- (double)_marginInRegularWidthRegularHeight
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _marginInRegularWidthRegularHeight];
  double v4 = v3;

  return v4;
}

- (BOOL)_allowsAsymmetricVerticalMargins
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _allowsAsymmetricVerticalMargins];

  return v3;
}

- (void)_accessibilityReduceMotionStatusDidChange
{
  BOOL v3 = _AXSReduceMotionEnabled() != 0;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setReduceMotionEnabled:v3];
}

- (BOOL)_shouldAdjustDetentsToAvoidKeyboard
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _shouldAdjustDetentsToAvoidKeyboard];

  return v3;
}

- (void)_setShouldAdjustDetentsToAvoidKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setShouldAdjustDetentsToAvoidKeyboard:v3];
}

- (BOOL)_wantsFloatingInRegularWidthCompactHeight
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _wantsFloatingInRegularWidthCompactHeight];

  return v3;
}

- (void)_setInsetsPresentedViewForGrabber:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setInsetsContentViewForGrabber:v3];
}

- (BOOL)_isGrabberBlurEnabled
{
  v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _isGrabberBlurEnabled];

  return v3;
}

- (void)_setCornerRadiusForPresentationAndDismissal:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setDismissCornerRadius:a3];
}

- (void)setPreferredCornerRadius:(CGFloat)preferredCornerRadius
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setPreferredCornerRadius:preferredCornerRadius];
}

- (void)_setPreferredShadowOpacity:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setPreferredShadowOpacity:a3];
}

- (void)_setShadowRadius:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setShadowRadius:a3];
}

- (void)invalidateDetents
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _invalidateDetents];
}

- (int64_t)_indexOfCurrentDetent
{
  char v3 = [(UISheetPresentationController *)self detents];
  id v4 = [(UISheetPresentationController *)self selectedDetentIdentifier];
  int64_t v5 = _UISheetIndexOfDetentWithIdentifier(v3, v4, 0);

  return v5;
}

- (void)_setIndexOfCurrentDetent:(int64_t)a3
{
  id v7 = [(UISheetPresentationController *)self detents];
  int64_t v5 = [v7 objectAtIndexedSubscript:a3];
  double v6 = [v5 _identifier];
  [(UISheetPresentationController *)self setSelectedDetentIdentifier:v6];
}

- (void)_setEdgeAttachedCompactHeightAppearance:(id)a3
{
  id v4 = a3;
  id v5 = [(UISheetPresentationController *)self _layoutInfo];
  [v5 _setEdgeAttachedCompactHeightAppearance:v4];
}

- (UISheetPresentationControllerDetentIdentifier)largestUndimmedDetentIdentifier
{
  id v2 = [(UISheetPresentationController *)self _standardAppearance];
  char v3 = [v2 _largestUndimmedDetentIdentifier];

  return (UISheetPresentationControllerDetentIdentifier)v3;
}

- (void)setLargestUndimmedDetentIdentifier:(UISheetPresentationControllerDetentIdentifier)largestUndimmedDetentIdentifier
{
  id v4 = +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:largestUndimmedDetentIdentifier];
  [(UISheetPresentationController *)self _setStandardAppearance:v4];
}

- (NSString)_largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight
{
  id v2 = [(UISheetPresentationController *)self _edgeAttachedCompactHeightAppearance];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 _largestUndimmedDetentIdentifier];
  }
  else
  {
    id v4 = @"com.apple.UIKit.unspecified";
  }

  return (NSString *)v4;
}

- (void)_setLargestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight:(id)a3
{
  id v4 = (__CFString *)a3;
  id v8 = v4;
  if (v4 == @"com.apple.UIKit.unspecified") {
    goto LABEL_4;
  }
  if (v4)
  {
    int v5 = [(__CFString *)v4 isEqual:@"com.apple.UIKit.unspecified"];

    if (v5)
    {
LABEL_4:
      [(UISheetPresentationController *)self _setEdgeAttachedCompactHeightAppearance:0];
      goto LABEL_8;
    }
    uint64_t v6 = +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:v8];
  }
  else
  {
    uint64_t v6 = +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:1];
  }
  id v7 = (void *)v6;
  [(UISheetPresentationController *)self _setEdgeAttachedCompactHeightAppearance:v6];

LABEL_8:
}

- (NSString)_largestUndimmedDetentIdentifierWhenFloating
{
  id v2 = [(UISheetPresentationController *)self _floatingAppearance];
  char v3 = v2;
  if (v2)
  {
    id v4 = [v2 _largestUndimmedDetentIdentifier];
  }
  else
  {
    id v4 = @"com.apple.UIKit.unspecified";
  }

  return (NSString *)v4;
}

- (void)_setLargestUndimmedDetentIdentifierWhenFloating:(id)a3
{
  id v4 = (__CFString *)a3;
  id v8 = v4;
  if (v4 == @"com.apple.UIKit.unspecified") {
    goto LABEL_4;
  }
  if (v4)
  {
    int v5 = [(__CFString *)v4 isEqual:@"com.apple.UIKit.unspecified"];

    if (v5)
    {
LABEL_4:
      [(UISheetPresentationController *)self _setFloatingAppearance:0];
      goto LABEL_8;
    }
    uint64_t v6 = +[_UISheetPresentationControllerAppearance appearanceWithLargestUndimmedDetentIdentifier:v8];
  }
  else
  {
    uint64_t v6 = +[_UISheetPresentationControllerAppearance appearancePreferringDimmingVisible:1];
  }
  id v7 = (void *)v6;
  [(UISheetPresentationController *)self _setFloatingAppearance:v6];

LABEL_8:
}

- (int64_t)_indexOfLastUndimmedDetent
{
  char v3 = [(UISheetPresentationController *)self detents];
  id v4 = [(UISheetPresentationController *)self largestUndimmedDetentIdentifier];
  int64_t v5 = _UISheetIndexOfDetentWithIdentifier(v3, v4, -1);

  return v5;
}

- (void)_setIndexOfLastUndimmedDetent:(int64_t)a3
{
  if (a3 == -1)
  {
    [(UISheetPresentationController *)self setLargestUndimmedDetentIdentifier:0];
  }
  else
  {
    id v7 = [(UISheetPresentationController *)self detents];
    int64_t v5 = [v7 objectAtIndexedSubscript:a3];
    uint64_t v6 = [v5 _identifier];
    [(UISheetPresentationController *)self setLargestUndimmedDetentIdentifier:v6];
  }
}

- (int64_t)_indexOfLastUndimmedDetentWhenEdgeAttachedInCompactHeight
{
  char v3 = [(UISheetPresentationController *)self _largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight];
  if (v3 == @"com.apple.UIKit.unspecified") {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = v3;
  if (v3)
  {
    char v5 = [(__CFString *)v3 isEqual:@"com.apple.UIKit.unspecified"];

    if (v5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  id v7 = [(UISheetPresentationController *)self detents];
  id v8 = [(UISheetPresentationController *)self _largestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight];
  int64_t v9 = _UISheetIndexOfDetentWithIdentifier(v7, v8, -1);

  return v9;
}

- (void)_setIndexOfLastUndimmedDetentWhenEdgeAttachedInCompactHeight:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v5 = @"com.apple.UIKit.unspecified";
  }
  else if (a3 == -1)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [(UISheetPresentationController *)self detents];
    id v7 = [v6 objectAtIndexedSubscript:a3];
    id v8 = [v7 _identifier];

    char v5 = v8;
  }
  int64_t v9 = v5;
  [(UISheetPresentationController *)self _setLargestUndimmedDetentIdentifierWhenEdgeAttachedInCompactHeight:v5];
}

- (int64_t)_indexOfLastUndimmedDetentWhenFloating
{
  char v3 = [(UISheetPresentationController *)self _largestUndimmedDetentIdentifierWhenFloating];
  if (v3 == @"com.apple.UIKit.unspecified") {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  id v4 = v3;
  if (v3)
  {
    char v5 = [(__CFString *)v3 isEqual:@"com.apple.UIKit.unspecified"];

    if (v5) {
      return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  id v7 = [(UISheetPresentationController *)self detents];
  id v8 = [(UISheetPresentationController *)self _largestUndimmedDetentIdentifierWhenFloating];
  int64_t v9 = _UISheetIndexOfDetentWithIdentifier(v7, v8, -1);

  return v9;
}

- (void)_setIndexOfLastUndimmedDetentWhenFloating:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    char v5 = @"com.apple.UIKit.unspecified";
  }
  else if (a3 == -1)
  {
    char v5 = 0;
  }
  else
  {
    uint64_t v6 = [(UISheetPresentationController *)self detents];
    id v7 = [v6 objectAtIndexedSubscript:a3];
    id v8 = [v7 _identifier];

    char v5 = v8;
  }
  int64_t v9 = v5;
  [(UISheetPresentationController *)self _setLargestUndimmedDetentIdentifierWhenFloating:v5];
}

- (NSString)_sheetID
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _sheetID];

  return (NSString *)v3;
}

- (NSString)_hiddenAncestorSheetID
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _hiddenAncestorSheetID];

  return (NSString *)v3;
}

- (void)_setHiddenAncestorSheetID:(id)a3
{
  id v4 = a3;
  id v5 = [(UISheetPresentationController *)self _layoutInfo];
  [v5 _setHiddenAncestorSheetID:v4];
}

- (BOOL)_isHidden
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _isHidden];

  return v3;
}

- (BOOL)_presentsWithGesture
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _presentsWithGesture];

  return v3;
}

- (BOOL)_shouldDismissWhenTappedOutside
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _shouldDismissWhenTappedOutside];

  return v3;
}

- (void)_setShouldDismissWhenTappedOutside:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setShouldDismissWhenTappedOutside:v3];
}

- (void)setPrefersScrollingExpandsWhenScrolledToEdge:(BOOL)prefersScrollingExpandsWhenScrolledToEdge
{
  BOOL v3 = prefersScrollingExpandsWhenScrolledToEdge;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setPrefersScrollingExpandsToLargerDetentWhenScrolledToEdge:v3];
}

- (void)_realSourceViewGeometryDidChange
{
  id v4 = [(UIPresentationController *)self _realSourceView];
  id v15 = v4;
  if (v4)
  {
    id v2 = [v4 window];
    [v15 bounds];
    objc_msgSend(v2, "convertRect:fromView:", v15);
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
  }
  else
  {
    double v6 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  id v13 = [(UISheetPresentationController *)self _layoutInfo];
  objc_msgSend(v13, "_setSourceFrame:", v6, v8, v10, v12);

  id v14 = v15;
  if (v15)
  {

    id v14 = v15;
  }
}

- (BOOL)prefersPageSizing
{
  return [(UISheetPresentationController *)self _mode] == 0;
}

- (double)_velocity
{
  id v2 = [(UISheetPresentationController *)self _sheetInteractionIfLoaded];
  [v2 currentVelocity];
  double v4 = v3;

  return v4;
}

- (void)_setConfiguration:(id)a3
{
  id v117 = a3;
  p_lastConfiguration = (id *)&self->__lastConfiguration;
  lastConfiguration = self->__lastConfiguration;
  if (!lastConfiguration
    || (int v7 = -[_UISheetPresentationControllerConfiguration _shouldScaleDownBehindDescendantSheets](lastConfiguration, "_shouldScaleDownBehindDescendantSheets"), v7 != [v117 _shouldScaleDownBehindDescendantSheets]))
  {
    -[UISheetPresentationController _setShouldScaleDownBehindDescendantSheets:](self, "_setShouldScaleDownBehindDescendantSheets:", [v117 _shouldScaleDownBehindDescendantSheets]);
  }
  if (!*p_lastConfiguration
    || (int v8 = [*p_lastConfiguration _peeksWhenFloating],
        v8 != [v117 _peeksWhenFloating]))
  {
    -[UISheetPresentationController _setPeeksWhenFloating:](self, "_setPeeksWhenFloating:", [v117 _peeksWhenFloating]);
  }
  if (!*p_lastConfiguration
    || (int v9 = [*p_lastConfiguration _wantsFullScreen],
        v9 != [v117 _wantsFullScreen]))
  {
    -[UISheetPresentationController _setWantsFullScreen:](self, "_setWantsFullScreen:", [v117 _wantsFullScreen]);
  }
  if (!*p_lastConfiguration
    || (int v10 = [*p_lastConfiguration _wantsBottomAttached],
        v10 != [v117 _wantsBottomAttached]))
  {
    uint64_t v11 = [v117 _wantsBottomAttached];
    double v12 = [(UISheetPresentationController *)self _layoutInfo];
    [v12 _setWantsEdgeAttached:v11];
  }
  if (!*p_lastConfiguration
    || (int v13 = [*p_lastConfiguration _wantsEdgeAttachedInCompactHeight],
        v13 != [v117 _wantsEdgeAttachedInCompactHeight]))
  {
    -[UISheetPresentationController setPrefersEdgeAttachedInCompactHeight:](self, "setPrefersEdgeAttachedInCompactHeight:", [v117 _wantsEdgeAttachedInCompactHeight]);
  }
  if (!*p_lastConfiguration
    || (int v14 = [*p_lastConfiguration _widthFollowsPreferredContentSizeWhenEdgeAttached],
        v14 != [v117 _widthFollowsPreferredContentSizeWhenEdgeAttached]))
  {
    -[UISheetPresentationController setWidthFollowsPreferredContentSizeWhenEdgeAttached:](self, "setWidthFollowsPreferredContentSizeWhenEdgeAttached:", [v117 _widthFollowsPreferredContentSizeWhenEdgeAttached]);
  }
  if (!*p_lastConfiguration
    || (int v15 = [*p_lastConfiguration _prefersGrabberVisible],
        v15 != [v117 _prefersGrabberVisible]))
  {
    -[UISheetPresentationController setPrefersGrabberVisible:](self, "setPrefersGrabberVisible:", [v117 _prefersGrabberVisible]);
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _grabberTopSpacing],
        double v17 = v16,
        [v117 _grabberTopSpacing],
        v17 != v18))
  {
    [v117 _grabberTopSpacing];
    -[UISheetPresentationController _setGrabberTopSpacing:](self, "_setGrabberTopSpacing:");
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _additionalMinimumTopInset],
        double v20 = v19,
        [v117 _additionalMinimumTopInset],
        v20 != v21))
  {
    [v117 _additionalMinimumTopInset];
    -[UISheetPresentationController _setAdditionalMinimumTopInset:](self, "_setAdditionalMinimumTopInset:");
  }
  if (!*p_lastConfiguration
    || (int v22 = [*p_lastConfiguration _insetsPresentedViewForGrabber],
        v22 != [v117 _insetsPresentedViewForGrabber]))
  {
    -[UISheetPresentationController _setInsetsPresentedViewForGrabber:](self, "_setInsetsPresentedViewForGrabber:", [v117 _insetsPresentedViewForGrabber]);
  }
  if (!*p_lastConfiguration || (uint64_t v23 = [*p_lastConfiguration _mode], v23 != objc_msgSend(v117, "_mode"))) {
    -[UISheetPresentationController _setMode:](self, "_setMode:", [v117 _mode]);
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _cornerRadiusForPresentationAndDismissal],
        double v25 = v24,
        [v117 _cornerRadiusForPresentationAndDismissal],
        v25 != v26))
  {
    [v117 _cornerRadiusForPresentationAndDismissal];
    -[UISheetPresentationController _setCornerRadiusForPresentationAndDismissal:](self, "_setCornerRadiusForPresentationAndDismissal:");
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _preferredCornerRadius],
        double v28 = v27,
        [v117 _preferredCornerRadius],
        v28 != v29))
  {
    [v117 _preferredCornerRadius];
    -[UISheetPresentationController setPreferredCornerRadius:](self, "setPreferredCornerRadius:");
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _preferredShadowOpacity],
        double v31 = v30,
        [v117 _preferredShadowOpacity],
        v31 != v32))
  {
    [v117 _preferredShadowOpacity];
    -[UISheetPresentationController _setPreferredShadowOpacity:](self, "_setPreferredShadowOpacity:");
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _shadowRadius], double v34 = v33, objc_msgSend(v117, "_shadowRadius"), v34 != v35))
  {
    [v117 _shadowRadius];
    -[UISheetPresentationController _setShadowRadius:](self, "_setShadowRadius:");
  }
  if (!*p_lastConfiguration)
  {
LABEL_54:
    id v38 = [v117 _detents];
    [(UISheetPresentationController *)self setDetents:v38];
    goto LABEL_55;
  }
  v36 = [*p_lastConfiguration _detents];
  v37 = [v117 _detents];
  id v38 = v36;
  id v39 = v37;
  if (v38 != v39)
  {
    long long v40 = v39;
    if (v38 && v39)
    {
      char v41 = [v38 isEqual:v39];

      if (v41) {
        goto LABEL_56;
      }
    }
    else
    {
    }
    goto LABEL_54;
  }

LABEL_55:
LABEL_56:
  if (!*p_lastConfiguration) {
    goto LABEL_64;
  }
  long long v42 = [*p_lastConfiguration _selectedDetentIdentifier];
  objc_super v43 = [v117 _selectedDetentIdentifier];
  id v44 = v42;
  id v45 = v43;
  if (v44 == v45)
  {

LABEL_65:
    goto LABEL_66;
  }
  v46 = v45;
  if (!v44 || !v45)
  {

    goto LABEL_64;
  }
  char v47 = [v44 isEqual:v45];

  if ((v47 & 1) == 0)
  {
LABEL_64:
    id v44 = [v117 _selectedDetentIdentifier];
    [(UISheetPresentationController *)self setSelectedDetentIdentifier:v44];
    goto LABEL_65;
  }
LABEL_66:
  if (!*p_lastConfiguration)
  {
LABEL_74:
    id v50 = [v117 _standardAppearance];
    [(UISheetPresentationController *)self _setStandardAppearance:v50];
    goto LABEL_75;
  }
  BOOL v48 = [*p_lastConfiguration _standardAppearance];
  double v49 = [v117 _standardAppearance];
  id v50 = v48;
  id v51 = v49;
  if (v50 != v51)
  {
    BOOL v52 = v51;
    if (v50 && v51)
    {
      char v53 = [v50 isEqual:v51];

      if (v53) {
        goto LABEL_76;
      }
    }
    else
    {
    }
    goto LABEL_74;
  }

LABEL_75:
LABEL_76:
  if (!*p_lastConfiguration) {
    goto LABEL_84;
  }
  double v54 = [*p_lastConfiguration _edgeAttachedCompactHeightAppearance];
  BOOL v55 = [v117 _edgeAttachedCompactHeightAppearance];
  id v56 = v54;
  id v57 = v55;
  if (v56 == v57)
  {

LABEL_85:
    goto LABEL_86;
  }
  v58 = v57;
  if (!v56 || !v57)
  {

    goto LABEL_84;
  }
  char v59 = [v56 isEqual:v57];

  if ((v59 & 1) == 0)
  {
LABEL_84:
    id v56 = [v117 _edgeAttachedCompactHeightAppearance];
    [(UISheetPresentationController *)self _setEdgeAttachedCompactHeightAppearance:v56];
    goto LABEL_85;
  }
LABEL_86:
  if (!*p_lastConfiguration)
  {
LABEL_94:
    id v62 = [v117 _floatingAppearance];
    [(UISheetPresentationController *)self _setFloatingAppearance:v62];
    goto LABEL_95;
  }
  v60 = [*p_lastConfiguration _floatingAppearance];
  BOOL v61 = [v117 _floatingAppearance];
  id v62 = v60;
  id v63 = v61;
  if (v62 != v63)
  {
    BOOL v64 = v63;
    if (v62 && v63)
    {
      char v65 = [v62 isEqual:v63];

      if (v65) {
        goto LABEL_96;
      }
    }
    else
    {
    }
    goto LABEL_94;
  }

LABEL_95:
LABEL_96:
  if (!*p_lastConfiguration
    || (uint64_t v66 = [*p_lastConfiguration _detentDirectionWhenFloating],
        v66 != [v117 _detentDirectionWhenFloating]))
  {
    -[UISheetPresentationController _setDetentDirectionWhenFloating:](self, "_setDetentDirectionWhenFloating:", [v117 _detentDirectionWhenFloating]);
  }
  if (!*p_lastConfiguration
    || (int v67 = [*p_lastConfiguration _prefersScrollingResizesWhenDetentDirectionIsDown],
        v67 != [v117 _prefersScrollingResizesWhenDetentDirectionIsDown]))
  {
    -[UISheetPresentationController _setPrefersScrollingResizesWhenDetentDirectionIsDown:](self, "_setPrefersScrollingResizesWhenDetentDirectionIsDown:", [v117 _prefersScrollingResizesWhenDetentDirectionIsDown]);
  }
  if (!*p_lastConfiguration
    || (int v68 = [*p_lastConfiguration _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge],
        v68 != [v117 _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge]))
  {
    -[UISheetPresentationController setPrefersScrollingExpandsWhenScrolledToEdge:](self, "setPrefersScrollingExpandsWhenScrolledToEdge:", [v117 _prefersScrollingExpandsToLargerDetentWhenScrolledToEdge]);
  }
  if (!*p_lastConfiguration
    || ([*p_lastConfiguration _hostParentDepthLevel],
        double v70 = v69,
        [v117 _hostParentDepthLevel],
        v70 != v71))
  {
    [v117 _hostParentDepthLevel];
    double v73 = v72;
    v74 = [(UISheetPresentationController *)self _layoutInfo];
    [v74 _setHostParentDepthLevel:v73];
  }
  if (!*p_lastConfiguration) {
    goto LABEL_110;
  }
  [*p_lastConfiguration _hostParentStackAlignmentFrame];
  CGFloat v76 = v75;
  CGFloat v78 = v77;
  CGFloat v80 = v79;
  CGFloat v82 = v81;
  [v117 _hostParentStackAlignmentFrame];
  v121.origin.double x = v83;
  v121.origin.double y = v84;
  v121.size.double width = v85;
  v121.size.double height = v86;
  v119.origin.double x = v76;
  v119.origin.double y = v78;
  v119.size.double width = v80;
  v119.size.double height = v82;
  if (!CGRectEqualToRect(v119, v121))
  {
LABEL_110:
    [v117 _hostParentStackAlignmentFrame];
    double v88 = v87;
    double v90 = v89;
    double v92 = v91;
    double v94 = v93;
    v95 = [(UISheetPresentationController *)self _layoutInfo];
    objc_msgSend(v95, "_setHostParentStackAlignmentFrame:", v88, v90, v92, v94);
  }
  if (!*p_lastConfiguration) {
    goto LABEL_113;
  }
  [*p_lastConfiguration _hostParentFullHeightUntransformedFrameForDepthLevel];
  CGFloat v97 = v96;
  CGFloat v99 = v98;
  CGFloat v101 = v100;
  CGFloat v103 = v102;
  [v117 _hostParentFullHeightUntransformedFrameForDepthLevel];
  v122.origin.double x = v104;
  v122.origin.double y = v105;
  v122.size.double width = v106;
  v122.size.double height = v107;
  v120.origin.double x = v97;
  v120.origin.double y = v99;
  v120.size.double width = v101;
  v120.size.double height = v103;
  if (!CGRectEqualToRect(v120, v122))
  {
LABEL_113:
    [v117 _hostParentFullHeightUntransformedFrameForDepthLevel];
    double v109 = v108;
    double v111 = v110;
    double v113 = v112;
    double v115 = v114;
    v116 = [(UISheetPresentationController *)self _layoutInfo];
    objc_msgSend(v116, "_setHostParentFullHeightUntransformedFrameForDepthLevel:", v109, v111, v113, v115);
  }
  objc_storeStrong(p_lastConfiguration, a3);
}

- (void)_prepareForWindowDeallocRecursively:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UISheetPresentationController;
  [(UIPresentationController *)&v4 _prepareForWindowDeallocRecursively:a3];
  if (objc_opt_respondsToSelector()) {
    [(_UISheetHostManager *)self->__hostManager tearDownSheet];
  }
}

- (void)animateChanges:(void *)changes
{
}

- (void)_animateChanges:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__UISheetPresentationController__animateChanges_completion___block_invoke;
  v8[3] = &unk_1E52DA160;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  _UISheetAnimateWithCompletion(v8, a4);
}

void __60__UISheetPresentationController__animateChanges_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _layoutInfo];
  uint64_t v3 = [v2 _indexOfCurrentActiveDetent];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  BOOL v4 = v3 != [v2 _indexOfCurrentActiveDetent];
  CAFrameRateRange v14 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v14.minimum;
  float maximum = v14.maximum;
  float preferred = v14.preferred;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__UISheetPresentationController__animateChanges_completion___block_invoke_2;
  v12[3] = &unk_1E52D9F70;
  id v13 = v2;
  id v8 = v2;
  *(float *)&double v9 = minimum;
  *(float *)&double v10 = maximum;
  *(float *)&double v11 = preferred;
  +[UIView _conditionallyModifyAnimations:withPreferredFrameRateRange:updateReason:animations:](UIView, "_conditionallyModifyAnimations:withPreferredFrameRateRange:updateReason:animations:", v4, 1048612, v12, v9, v10, v11);
}

uint64_t __60__UISheetPresentationController__animateChanges_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layout];
}

- (CGRect)_occludedFrameOfPresentedViewInContainerView
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _frameOfPresentedViewInContainerView];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (CGRect)_remoteKeyboardFrame
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _remoteKeyboardFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)_setRemoteKeyboardFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(UISheetPresentationController *)self _layoutInfo];
  objc_msgSend(v7, "_setRemoteKeyboardFrame:", x, y, width, height);
}

- (BOOL)_remoteContainsFirstResponder
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _remoteContainsFirstResponder];

  return v3;
}

- (void)_setRemoteContainsFirstResponder:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setRemoteContainsFirstResponder:v3];
}

- (BOOL)_remoteFirstResponderRequiresKeyboard
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _remoteFirstResponderRequiresKeyboard];

  return v3;
}

- (void)_setRemoteFirstResponderRequiresKeyboard:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setRemoteFirstResponderRequiresKeyboard:v3];
}

- (double)_remoteProposedDepthLevel
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  [v2 _remoteProposedDepthLevel];
  double v4 = v3;

  return v4;
}

- (void)_setRemoteProposedDepthLevel:(double)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  [v4 _setRemoteProposedDepthLevel:a3];
}

- (void)_setRemoteClientConfiguration:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 containsFirstResponder];
  double v6 = [(UISheetPresentationController *)self _layoutInfo];
  [v6 _setRemoteContainsFirstResponder:v5];

  uint64_t v7 = [v4 firstResponderRequiresKeyboard];
  double v8 = [(UISheetPresentationController *)self _layoutInfo];
  [v8 _setRemoteFirstResponderRequiresKeyboard:v7];

  [v4 keyboardFrame];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v17 = [(UISheetPresentationController *)self _layoutInfo];
  objc_msgSend(v17, "_setRemoteKeyboardFrame:", v10, v12, v14, v16);

  [v4 proposedDepthLevel];
  double v19 = v18;

  id v20 = [(UISheetPresentationController *)self _layoutInfo];
  [v20 _setRemoteProposedDepthLevel:v19];
}

- (void)_setRemoteDismissing:(BOOL)a3
{
  if (self->__remoteDismissing != a3)
  {
    self->__remoteDismissing = a3;
    id v3 = [(UIPresentationController *)self containerView];
    [v3 setNeedsLayout];
  }
}

- (void)_resetRemoteDismissing
{
  [(UISheetPresentationController *)self _setRemoteDismissing:0];
  id v3 = [(UISheetPresentationController *)self _layoutInfo];
  [v3 _setPresented:1];
}

- (UISheetPresentationController)_childSheetPresentationController
{
  id v2 = [(UIPresentationController *)self _childPresentationController];
  if (v2)
  {
    do
    {
      if ([v2 _isPresentedInFullScreen]) {
        break;
      }
      uint64_t v3 = [v2 _childPresentationController];

      id v2 = (void *)v3;
    }
    while (v3);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v2;
  }
  else {
    id v4 = 0;
  }

  return (UISheetPresentationController *)v4;
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke(uint64_t a1, void *a2)
{
  if (([a2 isCancelled] & 1) == 0)
  {
    id v3 = [*(id *)(a1 + 32) dropShadowView];
    [v3 setOverlayView:0];
  }
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_5(uint64_t a1, void *a2)
{
  id v6 = a2;
  if (([v6 isInteractive] & 1) == 0)
  {
    BOOL v3 = [v6 isCancelled] ? *(unsigned char *)(a1 + 40) == 0 : *(unsigned char *)(a1 + 40) != 0;
    id v4 = [*(id *)(a1 + 32) _layoutInfo];
    [v4 _setPresented:v3];

    if (+[UIView _isInAnimationBlockWithAnimationsEnabled])
    {
      uint64_t v5 = [*(id *)(a1 + 32) _layoutInfo];
      [v5 _layout];
    }
  }
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dimmingView];
  [v2 display:*(unsigned __int8 *)(a1 + 40)];
}

void __54__UISheetPresentationController__transitionWillBegin___block_invoke_7(uint64_t a1, void *a2)
{
  if ([a2 isCancelled])
  {
    id v3 = [*(id *)(a1 + 32) dimmingView];
    [v3 display:*(unsigned char *)(a1 + 40) == 0];
  }
}

- (void)_dropShadowViewGrabberDidTriggerPrimaryAction:(id)a3
{
  id v4 = [(UISheetPresentationController *)self _layoutInfo];
  uint64_t v5 = [v4 _grabberAction];
  if ((unint64_t)(v5 - 2) < 2)
  {
    uint64_t v9 = MEMORY[0x1E4F143A8];
    uint64_t v10 = 3221225472;
    double v11 = __79__UISheetPresentationController__dropShadowViewGrabberDidTriggerPrimaryAction___block_invoke;
    double v12 = &unk_1E52D9F98;
    id v13 = v4;
    double v14 = self;
    [(UISheetPresentationController *)self animateChanges:&v9];
  }
  else if (v5 == 1)
  {
    [(UISheetPresentationController *)self _dismissFromGrabberOrDimmingViewIfPossible];
  }
  else if (!v5)
  {
    id v6 = [(UIPresentationController *)self presentedViewController];
    uint64_t v7 = [v6 view];
    [v7 endEditing:1];
  }
  if ([(UISheetPresentationController *)self _isPresentedRemotely])
  {
    double v8 = [(UISheetPresentationController *)self _clientRemotePresentationDelegate];
    [v8 _sheetGrabberDidTriggerPrimaryAction];
  }
}

uint64_t __79__UISheetPresentationController__dropShadowViewGrabberDidTriggerPrimaryAction___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _activeDetents];
  id v3 = objc_msgSend(v2, "objectAtIndexedSubscript:", objc_msgSend(*(id *)(a1 + 32), "_indexOfActiveDetentForTappingGrabber"));
  id v4 = [v3 _identifier];
  [*(id *)(a1 + 32) _setSelectedDetentIdentifier:v4];

  uint64_t v5 = *(void **)(a1 + 40);
  return [v5 _sendDidChangeSelectedDetentIdentifier];
}

- (void)_dismissFromGrabberOrDimmingViewIfPossible
{
  id v3 = [(UISheetPresentationController *)self _layoutInfo];
  uint64_t v4 = [v3 _indexOfActiveDimmingDetent];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL || (uint64_t v5 = v4 + 1, v4 + 1 >= [v3 _numberOfActiveNonDismissDetents]))
  {
    if (![(UIPresentationController *)self _shouldDismiss]) {
      goto LABEL_13;
    }
    double v8 = 0;
LABEL_8:
    [(UISheetPresentationController *)self _setDimmingViewTapDismissing:1];
    if (dyld_program_sdk_at_least()) {
      [(UIPresentationController *)self presentingViewController];
    }
    else {
    uint64_t v9 = [(UIPresentationController *)self presentedViewController];
    }
    [v9 dismissViewControllerAnimated:1 completion:0];

    goto LABEL_12;
  }
  id v6 = [v3 _activeDetents];
  uint64_t v7 = [v6 objectAtIndexedSubscript:v5];
  double v8 = [v7 _identifier];

  if ([(UIPresentationController *)self _shouldDismiss]) {
    goto LABEL_8;
  }
  if (v8)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __75__UISheetPresentationController__dismissFromGrabberOrDimmingViewIfPossible__block_invoke;
    v10[3] = &unk_1E52DCB30;
    id v11 = v3;
    double v12 = v8;
    id v13 = self;
    [(UISheetPresentationController *)self animateChanges:v10];

LABEL_12:
  }
LABEL_13:
}

uint64_t __75__UISheetPresentationController__dismissFromGrabberOrDimmingViewIfPossible__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _setSelectedDetentIdentifier:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 48);
  return [v2 _sendDidChangeSelectedDetentIdentifier];
}

- (CGRect)_frameOfPresentedViewControllerViewInSuperview
{
  id v2 = [(UISheetPresentationController *)self dropShadowView];
  [v2 _contentViewFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.double height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _isDimmingEnabled];

  return v3;
}

- (BOOL)_shouldDismissWithNavigationPop
{
  id v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _isDimmingEnabled] ^ 1;

  return v3;
}

void __54__UISheetPresentationController__setOcclusionEnabled___block_invoke(uint64_t a1)
{
  id v2 = [UIViewPropertyAnimator alloc];
  char v3 = _UISheetTransitionTimingCurve();
  double v4 = [(UIViewPropertyAnimator *)v2 initWithDuration:v3 timingParameters:0.0];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__UISheetPresentationController__setOcclusionEnabled___block_invoke_2;
  v5[3] = &unk_1E52D9FC0;
  v5[4] = *(void *)(a1 + 32);
  char v6 = *(unsigned char *)(a1 + 40);
  [(UIViewPropertyAnimator *)v4 addAnimations:v5];
  [(UIViewPropertyAnimator *)v4 startAnimation];
}

uint64_t __54__UISheetPresentationController__setOcclusionEnabled___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableOcclusion:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_handleKeyboardNotification:(id)a3 aboutToHide:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  double v7 = [(UIPresentationController *)self containerView];
  double v8 = [(UISheetPresentationController *)self _layoutInfo];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke;
  v28[3] = &unk_1E52D9F70;
  id v9 = v8;
  id v29 = v9;
  +[UIView performWithoutAnimation:v28];
  if (v4)
  {
    double v10 = *MEMORY[0x1E4F1DB20];
    double v11 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v12 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v13 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }
  else
  {
    +[_UIKeyboardLayoutAlignmentView _endFrameForNotification:v6 inView:v7];
  }
  objc_msgSend(v9, "_setKeyboardFrame:", v10, v11, v12, v13);
  double v14 = [v7 window];
  double v15 = [v14 _firstResponder];
  objc_msgSend(v9, "_setFirstResponderRequiresKeyboard:", objc_msgSend(v15, "_requiresKeyboardWhenFirstResponder"));

  double v16 = [v6 userInfo];
  double v17 = [v16 objectForKeyedSubscript:@"UIKeyboardAnimationDurationUserInfoKey"];
  [v17 doubleValue];
  uint64_t v19 = v18;

  id v20 = [v6 userInfo];
  double v21 = [v20 objectForKeyedSubscript:@"UIKeyboardAnimationCurveUserInfoKey"];
  uint64_t v22 = [v21 integerValue];

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_2;
  v24[3] = &unk_1E52DD178;
  uint64_t v26 = v19;
  uint64_t v27 = v22;
  id v25 = v9;
  id v23 = v9;
  +[UIView _performWithAnimation:v24];
}

uint64_t __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layout];
}

void __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_2(uint64_t a1)
{
  double v1 = *(double *)(a1 + 40);
  uint64_t v2 = *(void *)(a1 + 48) << 16;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_3;
  v3[3] = &unk_1E52D9F70;
  id v4 = *(id *)(a1 + 32);
  +[UIView animateWithDuration:v2 delay:v3 options:0 animations:v1 completion:0.0];
}

uint64_t __73__UISheetPresentationController__handleKeyboardNotification_aboutToHide___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _layout];
}

- (void)_keyboardAboutToShow:(id)a3
{
  id v11 = a3;
  id v4 = [v11 object];
  double v5 = [(UIPresentationController *)self containerView];
  id v6 = [v5 window];
  double v7 = [v6 screen];

  if (v4 == v7)
  {
    double v8 = [v11 userInfo];
    id v9 = [v8 objectForKeyedSubscript:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0)
    {
      [(UISheetPresentationController *)self _setKeyboardShown:1];
      [(UISheetPresentationController *)self _handleKeyboardNotification:v11 aboutToHide:0];
    }
  }
}

- (void)_keyboardAboutToChangeFrame:(id)a3
{
  id v10 = a3;
  id v4 = [v10 object];
  double v5 = [(UIPresentationController *)self containerView];
  id v6 = [v5 window];
  double v7 = [v6 screen];

  if (v4 == v7)
  {
    if ([(UISheetPresentationController *)self _isKeyboardShown])
    {
      double v8 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      char v9 = [v8 hasActiveKeyboardSuppressionAssertionsForReason:@"com.apple.UIKit._UIRapidClickPresentationAssistant"];

      if ((v9 & 1) == 0) {
        [(UISheetPresentationController *)self _handleKeyboardNotification:v10 aboutToHide:0];
      }
    }
  }
}

- (void)_keyboardAboutToHide:(id)a3
{
  id v13 = a3;
  id v4 = [v13 object];
  double v5 = [(UIPresentationController *)self containerView];
  id v6 = [v5 window];
  double v7 = [v6 screen];

  if (v4 == v7)
  {
    double v8 = [v13 userInfo];
    char v9 = [v8 objectForKeyedSubscript:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
    char v10 = [v9 BOOLValue];

    if ((v10 & 1) == 0)
    {
      id v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      char v12 = [v11 hasActiveKeyboardSuppressionAssertionsForReason:@"com.apple.UIKit._UIRapidClickPresentationAssistant"];

      if ((v12 & 1) == 0)
      {
        [(UISheetPresentationController *)self _setKeyboardShown:0];
        [(UISheetPresentationController *)self _handleKeyboardNotification:v13 aboutToHide:1];
      }
    }
  }
}

- (void)_firstResponderDidChange:(id)a3
{
  id v7 = [(UIPresentationController *)self presentedViewController];
  id v4 = [v7 view];
  uint64_t v5 = [v4 _isAncestorOfFirstResponder];
  id v6 = [(UISheetPresentationController *)self _layoutInfo];
  [v6 _setContainsFirstResponder:v5];
}

- (BOOL)_allowsFocusInPresentingViewController
{
  uint64_t v2 = [(UISheetPresentationController *)self _layoutInfo];
  char v3 = [v2 _isDimmingEnabled] ^ 1;

  return v3;
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _layoutInfo];
  [v2 _rubberBandExtentBeyondMinimumOffset];
  double v4 = v3;

  return v4;
}

double __50__UISheetPresentationController__sheetInteraction__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _layoutInfo];
  [v2 _rubberBandExtentBeyondMaximumOffset];
  double v4 = v3;

  return v4;
}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained _sheetInteractionIfLoaded];
  [v1 invalidateRubberBandExtentBeyondMinimumOffset];
}

void __50__UISheetPresentationController__sheetInteraction__block_invoke_9(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v1 = [WeakRetained _sheetInteractionIfLoaded];
  [v1 invalidateRubberBandExtentBeyondMaximumOffset];
}

- (id)_preferredAnimationControllerForPresentation
{
  return [(UISheetPresentationController *)self _preferredAnimationControllerForTransition:1];
}

- (id)_preferredAnimationControllerForDismissal
{
  return [(UISheetPresentationController *)self _preferredAnimationControllerForTransition:0];
}

- (id)_preferredAnimationControllerForTransition:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UISheetPresentationController *)self _hostManager];
  id v6 = v5;
  if (v5)
  {
    uint64_t v7 = [v5 preferredAnimationControllerForTransition:v3];
LABEL_3:
    double v8 = (_UISheetAnimationController *)v7;
    goto LABEL_14;
  }
  char v9 = [(UIPresentationController *)self presentedViewController];
  int v10 = _UISheetPresentationControllerStylesSheetsAsCards(v9);

  if (v10)
  {
    if (![(UISheetPresentationController *)self _isDraggingAndTransitioning])
    {
      if (v3) {
        [(UIPresentationController *)&v17 _preferredAnimationControllerForPresentation];
      }
      else {
      uint64_t v7 = [(UIPresentationController *)&v16 _preferredAnimationControllerForDismissal];
      }
      goto LABEL_3;
    }
    id v11 = [(UISheetPresentationController *)self _sheetVisualStyle];
    char v12 = objc_opt_respondsToSelector();

    if ((v12 & 1) == 0
      || ([(UISheetPresentationController *)self _sheetVisualStyle],
          id v13 = objc_claimAutoreleasedReturnValue(),
          [v13 preferredInteractiveAnimationControllerForSheetPresentation:v3],
          double v8 = (_UISheetAnimationController *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v8))
    {
      double v8 = objc_alloc_init(_UISheetAnimationController);
    }
    [(_UISheetAnimationController *)v8 setIsReversed:v3 ^ 1];
    if (!v3)
    {
      double v14 = [(UISheetPresentationController *)self presentedView];
      [v14 _frameIgnoringLayerTransform];
      -[_UISheetAnimationController setInteractiveFrame:](v8, "setInteractiveFrame:");
    }
    if ([(UISheetPresentationController *)self _isHosting])
    {
      [(UISheetPresentationController *)self frameOfPresentedViewInContainerView];
      -[_UISheetAnimationController setSourceFrame:](v8, "setSourceFrame:");
    }
  }
  else
  {
    double v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)_preferredInteractionControllerForDismissal:(id)a3
{
  return [(UISheetPresentationController *)self _preferredInteractionControllerForTransition:0 animator:a3];
}

double __87__UISheetPresentationController__preferredInteractionControllerForTransition_animator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained _layoutInfo];
  [v2 _hostedDismissFrame];
  double v4 = v3;

  return v4;
}

- (void)_updateAnimationController
{
  BOOL v3 = [(UISheetPresentationController *)self _isPresentedRemotely];
  id v14 = [(UISheetPresentationController *)self _layoutInfo];
  [v14 _hostedUntransformedFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if (v3)
  {
    char v12 = [(UISheetPresentationController *)self presentedView];
    objc_msgSend(v12, "_setFrameIgnoringLayerTransform:", v5, v7, v9, v11);
  }
  else
  {
    id v13 = [(UISheetPresentationController *)self _animationController];
    objc_msgSend(v13, "setInteractiveFrame:", v5, v7, v9, v11);

    id v14 = [(UISheetPresentationController *)self _animationController];
    [v14 layoutTransitionViews];
  }
}

- (void)_startInteractiveTransitionWithProgress:(double)a3
{
}

- (void)_startInteractiveTransitionWithProgress:(double)a3 fromViewController:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  [(UISheetPresentationController *)self _setDraggingAndTransitioning:1];
  if (![(UISheetPresentationController *)self _isHosting])
  {
    double v10 = [(UIPresentationController *)self containerView];
    [v10 layoutIfNeeded];
  }
  if ([(UISheetPresentationController *)self _isPresentedRemotely])
  {
    [(UISheetPresentationController *)self _setRemoteDismissing:1];
  }
  else
  {
    double v11 = [(UISheetPresentationController *)self _interactionController];

    if (v11)
    {
      char v12 = [(UISheetPresentationController *)self _interactionController];
      [v12 pauseInteractiveTransition];
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __103__UISheetPresentationController__startInteractiveTransitionWithProgress_fromViewController_completion___block_invoke;
      v13[3] = &unk_1E52E3298;
      id v14 = v8;
      double v15 = self;
      id v16 = v9;
      +[UIViewController _performWithoutDeferringTransitionsAllowingAnimation:actions:]((uint64_t)UIViewController, 1, v13);
    }
  }
  [(UISheetPresentationController *)self _updateInteractiveTransitionWithProgress:a3];
}

void __103__UISheetPresentationController__startInteractiveTransitionWithProgress_fromViewController_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  double v1 = *(void **)(a1 + 40);
  if (v2)
  {
    id v3 = [v1 presentedViewController];
    objc_msgSend(v2, "presentViewController:animated:completion:");
  }
  else
  {
    id v3 = [v1 presentingViewController];
    [v3 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_updateInteractiveTransitionWithProgress:(double)a3
{
  [(UISheetPresentationController *)self _updateAnimationController];
  if (![(UISheetPresentationController *)self _isPresentedRemotely])
  {
    id v5 = [(UISheetPresentationController *)self _interactionController];
    objc_msgSend(v5, "updateInteractiveTransition:", fmin(a3, 0.99));
  }
}

- (void)_completeInteractiveTransition:(BOOL)a3 duration:(double)a4 timingCurve:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  if ([(UIPresentationController *)self presented]
    || (BOOL v9 = v6, [(UIPresentationController *)self dismissing]))
  {
    BOOL v9 = v6 ^ 1;
  }
  double v10 = [(UISheetPresentationController *)self _layoutInfo];
  [v10 _setPresented:v9];

  [(UISheetPresentationController *)self _setDraggingAndTransitioning:0];
  if (a4 != 0.0)
  {
    int v11 = dyld_program_sdk_at_least() ^ 1 | v6;
    char v12 = [(UISheetPresentationController *)self _interactionController];
    [v12 percentComplete];
    double v14 = v13;

    if (v11) {
      double v14 = 1.0 - v14;
    }
    double v15 = [(UISheetPresentationController *)self _interactionController];
    [v15 duration];
    double v17 = v14 * v16;

    uint64_t v18 = [(UISheetPresentationController *)self _interactionController];
    [v18 setCompletionSpeed:v17 / a4];

    uint64_t v19 = [(UISheetPresentationController *)self _interactionController];
    [v19 setTimingCurve:v8];
  }
  if ([(UISheetPresentationController *)self _isPresentedRemotely])
  {
    if (!v6) {
      [(UISheetPresentationController *)self _setRemoteDismissing:0];
    }
  }
  else
  {
    id v20 = [(UISheetPresentationController *)self _interactionController];
    double v21 = v20;
    if (v6)
    {
      [v20 finishInteractiveTransition];

      uint64_t v22 = [UIViewPropertyAnimator alloc];
      id v23 = _UISheetTransitionTimingCurve();
      double v24 = [(UIViewPropertyAnimator *)v22 initWithDuration:v23 timingParameters:0.0];

      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke;
      v31[3] = &unk_1E52D9F70;
      v31[4] = self;
      [(UIViewPropertyAnimator *)v24 addAnimations:v31];
      [(UIViewPropertyAnimator *)v24 startAnimation];
    }
    else
    {
      [v20 cancelInteractiveTransition];
    }
  }
  if (![(UISheetPresentationController *)self _didTearOff])
  {
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke_2;
    v30[3] = &unk_1E52D9F70;
    v30[4] = self;
    id v25 = (void (**)(void))_Block_copy(v30);
    uint64_t v26 = [(UISheetPresentationController *)self _sheetInteraction];
    int v27 = [v26 isDragging];

    if (v27)
    {
      v25[2](v25);
    }
    else
    {
      double v28 = [(UISheetPresentationController *)self _sheetInteraction];
      id v29 = _UISheetTransitionSpringParametersHighSpeed(0);
      [v28 _animateWithParameters:v29 animations:v25];
    }
  }
}

void __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _animationController];
  [v1 runNoninteractiveAnimationsIfPossible];
}

uint64_t __85__UISheetPresentationController__completeInteractiveTransition_duration_timingCurve___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _layoutInfo];
  int v3 = [v2 _isPresented];

  double v4 = *(void **)(a1 + 32);
  if (v3)
  {
    id v5 = [v4 _layoutInfo];
    [v5 _layout];

    BOOL v6 = *(void **)(a1 + 32);
    return [v6 _updatePresentedViewFrame];
  }
  else
  {
    return [v4 _updateAnimationController];
  }
}

- (void)_sendDidChangeSelectedDetentIdentifier
{
  id v3 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 sheetPresentationControllerDidChangeSelectedDetentIdentifier:self];
  }
}

- (BOOL)_shouldDismissByDragging
{
  id v3 = [(UIPresentationController *)self presentedViewController];
  uint64_t v4 = [v3 presentedViewController];
  id v5 = (void *)v4;
  BOOL v6 = (!v4 || ((*(_DWORD *)(v4 + 376) >> 1) & 3u) - 1 >= 2)
    && [(UIPresentationController *)self _shouldDismiss];

  return v6;
}

- (BOOL)sheetInteractionShouldInteractWithQuicklyScrollingDescendentScrollView:(id)a3
{
  return ![(UISheetPresentationController *)self _shouldDismissByDragging];
}

- (void)sheetInteraction:(id)a3 didChangeOffset:(CGPoint)a4
{
  double y = a4.y;
  CGFloat x = a4.x;
  id v7 = a3;
  uint64_t v8 = [v7 isDragging];
  uint64_t v9 = [v7 indexOfCurrentDetent];

  double v10 = [(UISheetPresentationController *)self _layoutInfo];
  uint64_t v11 = [v10 _isInverted];
  id v51 = [v10 _activeDetents];
  [v10 _smallestNonDismissDetentOffset];
  double v13 = v12;
  uint64_t v14 = [v10 _numberOfActiveNonDismissDetents];
  int v15 = [v10 _isDragging];
  [v10 _setDragging:v8];
  if (!v15 || (v8 & 1) != 0) {
    goto LABEL_23;
  }
  [v10 _setLatestUserChosenOffset:y];
  if (v9 == v14)
  {
    if ([(UISheetPresentationController *)self _isHosting]) {
      char v17 = [v10 _isDismissible];
    }
    else {
      char v17 = [(UISheetPresentationController *)self _shouldDismissByDragging];
    }
    uint64_t v16 = v9;
    if ((v17 & 1) == 0) {
      uint64_t v16 = v9 - 1;
    }
  }
  else
  {
    uint64_t v16 = v9;
  }
  uint64_t v18 = [v51 objectAtIndexedSubscript:v16];
  uint64_t v19 = [v18 _identifier];

  if (v19)
  {
    id v20 = [(UISheetPresentationController *)self _layoutInfo];
    uint64_t v21 = [v20 _adjustedIndexOfCurrentActiveDetentForContainedFirstResponder];

    if (v21 != 0x7FFFFFFFFFFFFFFFLL && v21 != v16)
    {
      uint64_t v22 = [(UIPresentationController *)self presentedViewController];
      id v23 = [v22 view];
      [v23 endEditing:1];
    }
    double v24 = [v10 _selectedDetentIdentifier];
    [v10 _setSelectedDetentIdentifier:v19];
    id v25 = v24;
    id v26 = v19;
    int v27 = v26;
    if (v25 == v26)
    {
    }
    else
    {
      if (v25)
      {
        char v28 = [v25 isEqual:v26];

        if (v28) {
          goto LABEL_21;
        }
      }
      else
      {
      }
      [(UISheetPresentationController *)self _sendDidChangeSelectedDetentIdentifier];
    }
LABEL_21:
  }
LABEL_23:
  if (v11) {
    BOOL v29 = y < v13;
  }
  else {
    BOOL v29 = y > v13;
  }
  if (v8 && ![(UISheetPresentationController *)self _didTearOff])
  {
    double v31 = [(UISheetPresentationController *)self _sheetInteraction];
    if ([v31 isUnconstrainedOffsetBeyondSideOrTopExtentInverted:v11])
    {
      double v32 = [(UISheetPresentationController *)self _tearOffActivity];
      BOOL v30 = v32 != 0;
    }
    else
    {
      BOOL v30 = 0;
    }
  }
  else
  {
    BOOL v30 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke;
  aBlock[3] = &unk_1E530A1F8;
  aBlock[4] = self;
  char v62 = v11;
  *(CGFloat *)&aBlock[5] = x;
  *(double *)&aBlock[6] = y;
  *(double *)&aBlock[7] = v13;
  double v33 = (void (**)(void))_Block_copy(aBlock);
  if (v30)
  {
    double v34 = [(UIPresentationController *)self containerView];
    double v35 = [v34 window];

    v36 = objc_msgSend((id)objc_msgSend((id)UIApp, "_touchesEventForWindow:", v35), "touchesForWindow:", v35);
    v37 = [v36 anyObject];

    id v38 = [(UISheetPresentationController *)self _tearOffInteraction];
    v60[0] = MEMORY[0x1E4F143A8];
    v60[1] = 3221225472;
    v60[2] = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_2;
    v60[3] = &unk_1E52DC3A0;
    v60[4] = self;
    [v38 _immediatelyBeginDragWithTouch:v37 completion:v60];

    goto LABEL_63;
  }
  int v39 = v8 & v29;
  BOOL v40 = [(UISheetPresentationController *)self _didTearOff];
  BOOL v41 = [(UISheetPresentationController *)self _isDraggingAndTransitioning];
  if (v40)
  {
    if ((!v41 | v39)) {
      goto LABEL_63;
    }
    double v42 = _UISheetTransitionDuration();
    objc_super v43 = _UISheetTransitionTimingCurve();
    id v44 = self;
    BOOL v45 = 0;
    goto LABEL_61;
  }
  if (((v41 | v39 ^ 1) & 1) == 0
    && ![(UISheetPresentationController *)self _didAttemptToStartDismiss])
  {
    if (![(UISheetPresentationController *)self _isHosting]) {
      objc_msgSend(v10, "_setDismissible:", -[UISheetPresentationController _shouldDismissByDragging](self, "_shouldDismissByDragging"));
    }
    if ([v10 _isDismissible])
    {
      v33[2](v33);
      -[UISheetPresentationController _startInteractiveTransitionWithProgress:](self, "_startInteractiveTransitionWithProgress:");
      goto LABEL_63;
    }
    [(UISheetPresentationController *)self _setDidAttemptToStartDismiss:1];
    objc_super v43 = [(UIPresentationController *)self containerView];
    [v43 setNeedsLayout];
LABEL_62:

    goto LABEL_63;
  }
  if (([(UISheetPresentationController *)self _isDraggingAndTransitioning] & v39) == 1)
  {
    v33[2](v33);
    -[UISheetPresentationController _updateInteractiveTransitionWithProgress:](self, "_updateInteractiveTransitionWithProgress:");
    goto LABEL_63;
  }
  if (((![(UISheetPresentationController *)self _isDraggingAndTransitioning] | v39) & 1) == 0)
  {
    BOOL v48 = v9 != v14;
    if ([(UIPresentationController *)self presented]
      || [(UIPresentationController *)self dismissing])
    {
      BOOL v48 = v9 == v14;
    }
    double v42 = _UISheetTransitionDuration();
    objc_super v43 = _UISheetTransitionTimingCurve();
    id v44 = self;
    BOOL v45 = v48;
LABEL_61:
    [(UISheetPresentationController *)v44 _completeInteractiveTransition:v45 duration:v43 timingCurve:v42];
    goto LABEL_62;
  }
  if (![(UISheetPresentationController *)self _isDraggingAndTransitioning])
  {
    if (((v8 ^ 1 | v29) & 1) == 0) {
      [(UISheetPresentationController *)self _setDidAttemptToStartDismiss:0];
    }
    if ((v8 & 1) == 0 && [(UISheetPresentationController *)self _didAttemptToStartDismiss])
    {
      [(UISheetPresentationController *)self _setDidAttemptToStartDismiss:0];
      double v46 = v11 ? v13 - y : y - v13;
      if (v11) {
        [v10 _rubberBandExtentBeyondMinimumOffset];
      }
      else {
        [v10 _rubberBandExtentBeyondMaximumOffset];
      }
      if (v46 > v47 * 0.25)
      {
        objc_initWeak(&location, self);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_3;
        block[3] = &unk_1E52DC308;
        objc_copyWeak(&v58, &location);
        dispatch_async(MEMORY[0x1E4F14428], block);
        objc_destroyWeak(&v58);
        objc_destroyWeak(&location);
      }
    }
    v52[0] = MEMORY[0x1E4F143A8];
    v52[1] = 3221225472;
    char v53 = __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_4;
    double v54 = &unk_1E52D9F98;
    id v49 = v10;
    id v55 = v49;
    id v56 = self;
    int v50 = [(UISheetPresentationController *)self _didExpand];
    if (v50 == [v49 _isExpanded]
      || (-[UISheetPresentationController _setDidExpand:](self, "_setDidExpand:", [v49 _isExpanded]),
          +[UIView _isInAnimationBlockWithAnimationsEnabled]))
    {
      v53((uint64_t)v52);
    }
    else
    {
      _UISheetAnimateWithCompletion(v52, 0);
    }
  }
LABEL_63:
}

double __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) containerView];
  [v2 bounds];
  double v7 = _UISheetDismissOffset(*(unsigned __int8 *)(a1 + 64), v3, v4, v5, v6, *MEMORY[0x1E4F1DB20], *(CGFloat *)(MEMORY[0x1E4F1DB20] + 8), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 16), *(CGFloat *)(MEMORY[0x1E4F1DB20] + 24));

  double v8 = (*(double *)(a1 + 48) - *(double *)(a1 + 56)) / (v7 - *(double *)(a1 + 56));
  if (([*(id *)(a1 + 32) presented] & 1) == 0
    && ![*(id *)(a1 + 32) dismissing])
  {
    return 1.0 - v8;
  }
  return v8;
}

void __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_2(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) _setDidTearOff:a2];
  CGFloat v5 = [*(id *)(a1 + 32) delegate];
  char v3 = objc_opt_respondsToSelector();
  CGFloat v4 = v5;
  if (v3)
  {
    if (qword_1EB25AEC8 != -1) {
      dispatch_once(&qword_1EB25AEC8, &__block_literal_global_1202);
    }
    CGFloat v4 = v5;
    if (!byte_1EB25AEB9)
    {
      [v5 _sheetPresentationControllerDidTearOff:*(void *)(a1 + 32)];
      CGFloat v4 = v5;
    }
  }
}

void __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _sendDidAttemptToDismiss];
}

uint64_t __66__UISheetPresentationController_sheetInteraction_didChangeOffset___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) _layout];
  uint64_t v2 = *(void **)(a1 + 40);
  return [v2 _updatePresentedViewFrame];
}

- (CGPoint)offsetForInterruptedAnimationInSheetInteraction:(id)a3
{
  if ([(UISheetPresentationController *)self _isHosting])
  {
    [(UISheetPresentationController *)self _remoteInterruptedOffset];
  }
  else
  {
    CGFloat v6 = [(UISheetPresentationController *)self presentedView];
    [v6 _frameIgnoringLayerTransform];
    double v8 = v7;
    uint64_t v10 = v9;
    uint64_t v12 = v11;
    uint64_t v14 = v13;

    [(UISheetPresentationController *)self frameOfPresentedViewInContainerView];
    double v16 = v8 - v15;
    char v17 = [(UISheetPresentationController *)self _layoutInfo];
    int v18 = [v17 _isInverted];
    double v19 = v8;
    uint64_t v20 = v10;
    uint64_t v21 = v12;
    uint64_t v22 = v14;
    if (v18) {
      double MaxY = CGRectGetMaxY(*(CGRect *)&v19);
    }
    else {
      double MaxY = CGRectGetMinY(*(CGRect *)&v19);
    }
    double v24 = MaxY;

    double v4 = v16;
    double v5 = v24;
  }
  result.double y = v5;
  result.CGFloat x = v4;
  return result;
}

- (void)_sheetInteractionDraggingBegan:(id)a3 withRubberBandCoefficient:(double)a4
{
  id v11 = a3;
  if ([(UISheetPresentationController *)self _isPresentedRemotely])
  {
    BOOL v6 = [(UISheetPresentationController *)self _shouldDismissByDragging];
    double v7 = [(UISheetPresentationController *)self _layoutInfo];
    [v7 _setDismissible:v6];

    double v8 = [(UISheetPresentationController *)self _clientRemotePresentationDelegate];
    [(UISheetPresentationController *)self offsetForInterruptedAnimationInSheetInteraction:v11];
    objc_msgSend(v8, "_sheetInteractionDraggingDidBeginWithRubberBandCoefficient:dismissible:interruptedOffset:", v6, a4, v9, v10);
  }
}

- (void)_sheetInteractionDraggingChanged:(id)a3 withTranslation:(CGPoint)a4 velocity:(CGPoint)a5 animateChange:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a5.y;
  double x = a5.x;
  double v9 = a4.y;
  double v10 = a4.x;
  if ([(UISheetPresentationController *)self _isPresentedRemotely])
  {
    id v13 = [(UISheetPresentationController *)self _clientRemotePresentationDelegate];
    uint64_t v12 = [(UISheetPresentationController *)self _layoutInfo];
    objc_msgSend(v13, "_sheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:dismissible:", v6, objc_msgSend(v12, "_isDismissible"), v10, v9, x, y);
  }
}

- (void)_sheetInteractionDraggingEnded:(id)a3
{
  if ([(UISheetPresentationController *)self _isPresentedRemotely])
  {
    id v4 = [(UISheetPresentationController *)self _clientRemotePresentationDelegate];
    [v4 _sheetInteractionDraggingDidEnd];
  }
}

- (void)_setIsRemote:(BOOL)a3
{
  id v4 = [(UIPresentationController *)self presentedViewController];
  [(UISheetPresentationController *)self _setClientRemotePresentationDelegate:v4];
}

- (void)_setClientRemotePresentationDelegate:(id)a3
{
  id obj = a3;
  if (obj)
  {
    id v4 = [(UISheetPresentationController *)self dropShadowView];
    double v5 = [v4 interactions];
    uint64_t v6 = [v5 count];

    if (!v6)
    {
      double v7 = [(UISheetPresentationController *)self dropShadowView];
      double v8 = [(UISheetPresentationController *)self _sheetInteraction];
      [v7 addInteraction:v8];
    }
  }
  objc_storeWeak((id *)&self->__clientRemotePresentationDelegate, obj);
  [(UISheetPresentationController *)self _registerForKeyboardNotificationsIfNecessary];
}

- (void)_remoteSheetGrabberDidTriggerPrimaryAction
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(UISheetPresentationController *)self _isHosting])
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v5 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      uint64_t v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v9 = v6;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }
    else
    {
      id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_remoteSheetGrabberDidTriggerPrimaryAction___s_category)+ 8);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        return;
      }
      double v5 = v4;
      uint64_t v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v9 = v6;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }

LABEL_9:
    return;
  }
  id v7 = [(UISheetPresentationController *)self dropShadowView];
  -[UISheetPresentationController _dropShadowViewGrabberDidTriggerPrimaryAction:](self, "_dropShadowViewGrabberDidTriggerPrimaryAction:");
}

- (void)_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3 dismissible:(BOOL)a4 interruptedOffset:(CGPoint)a5
{
  double y = a5.y;
  double x = a5.x;
  BOOL v7 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (![(UISheetPresentationController *)self _isHosting])
  {
    if (os_variant_has_internal_diagnostics())
    {
      id v13 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      char v17 = v14;
      _os_log_fault_impl(&dword_1853B0000, v13, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }
    else
    {
      uint64_t v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_remoteSheetInteractionDraggingDidBeginWithRubberBandCoefficient_dismissible_interruptedOffset____s_category)+ 8);
      if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        return;
      }
      id v13 = v12;
      uint64_t v14 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      char v17 = v14;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }

LABEL_9:
    return;
  }
  id v11 = [(UISheetPresentationController *)self _layoutInfo];
  [v11 _setDismissible:v7];

  -[UISheetPresentationController _setRemoteInterruptedOffset:](self, "_setRemoteInterruptedOffset:", x, y);
  id v15 = [(UISheetPresentationController *)self _sheetInteraction];
  [v15 draggingBeganFromSource:self withRubberBandCoefficient:a3];
}

- (void)_remoteSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5 dismissible:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  double v10 = a3.y;
  double v11 = a3.x;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (![(UISheetPresentationController *)self _isHosting])
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v16 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      char v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v17;
      _os_log_fault_impl(&dword_1853B0000, v16, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }
    else
    {
      id v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_remoteSheetInteractionDraggingDidChangeWithTranslation_velocity_animateChange_dismissible____s_category)+ 8);
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        return;
      }
      double v16 = v15;
      char v17 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = v17;
      _os_log_impl(&dword_1853B0000, v16, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }

LABEL_9:
    return;
  }
  uint64_t v14 = [(UISheetPresentationController *)self _layoutInfo];
  [v14 _setDismissible:v6];

  id v18 = [(UISheetPresentationController *)self _sheetInteraction];
  objc_msgSend(v18, "draggingChangedInSource:withTranslation:velocity:animateChange:", self, v7, v11, v10, x, y);
}

- (void)_remoteSheetInteractionDraggingDidEnd
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (![(UISheetPresentationController *)self _isHosting])
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v5 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
        goto LABEL_9;
      }
      BOOL v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v9 = v6;
      _os_log_fault_impl(&dword_1853B0000, v5, OS_LOG_TYPE_FAULT, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }
    else
    {
      id v4 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_remoteSheetInteractionDraggingDidEnd___s_category) + 8);
      if (!os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        return;
      }
      double v5 = v4;
      BOOL v6 = NSStringFromSelector(a2);
      *(_DWORD *)buf = 138412290;
      double v9 = v6;
      _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_ERROR, "%@ may only be called on a _UISheetPresentationController that is hosting.", buf, 0xCu);
    }

LABEL_9:
    return;
  }
  id v7 = [(UISheetPresentationController *)self _sheetInteraction];
  [v7 draggingEndedInSource:self];
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginHorizontallyWithEvent:(id)a4
{
  return self->__exteriorPanGestureRecognizer != a3
      || [(UISheetPresentationController *)self _exteriorPanGestureRecognizerShouldBeginWithEvent:a4];
}

- (BOOL)_panGestureRecognizer:(id)a3 shouldTryToBeginVerticallyWithEvent:(id)a4
{
  return self->__exteriorPanGestureRecognizer != a3
      || [(UISheetPresentationController *)self _exteriorPanGestureRecognizerShouldBeginWithEvent:a4];
}

- (BOOL)_exteriorPanGestureRecognizerShouldBeginWithEvent:(id)a3
{
  id v4 = a3;
  BOOL v7 = ([v4 type]
     || ([v4 allTouches],
         uint64_t v5 = objc_claimAutoreleasedReturnValue(),
         [(id)v5 anyObject],
         BOOL v6 = objc_claimAutoreleasedReturnValue(),
         (id)v5,
         LOBYTE(v5) = [v6 _isPointerTouch],
         v6,
         (v5 & 1) == 0))
    && [(UISheetPresentationController *)self _isExteriorPanGestureEnabled];

  return v7;
}

- (BOOL)_exteriorPanGestureRecognizerShouldInteractWithView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UISheetPresentationController *)self dropShadowView];
  char v6 = [v4 isDescendantOfView:v5];

  if (v6)
  {
    BOOL v7 = 0;
  }
  else
  {
    double v8 = [(UIPresentationController *)self containerView];
    BOOL v7 = -[UIView _viewOrderRelativeToView:requireIntersection:](v4, v8, 0) != -2;
  }
  return v7;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v6 = a4;
  BOOL v7 = [a3 view];
  [v6 locationInView:v7];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [(UISheetPresentationController *)self _layoutInfo];
  [v12 _frameOfPresentedViewInContainerView];
  CGFloat x = v25.origin.x;
  CGFloat y = v25.origin.y;
  CGFloat width = v25.size.width;
  CGFloat height = v25.size.height;
  if (v9 < CGRectGetMinX(v25)) {
    goto LABEL_5;
  }
  v26.origin.CGFloat x = x;
  v26.origin.CGFloat y = y;
  v26.size.CGFloat width = width;
  v26.size.CGFloat height = height;
  if (v9 > CGRectGetMaxX(v26)) {
    goto LABEL_5;
  }
  int v17 = [v12 _isInverted];
  CGFloat v18 = x;
  CGFloat v19 = y;
  CGFloat v20 = width;
  CGFloat v21 = height;
  if (!v17)
  {
    if (v11 > CGRectGetMinY(*(CGRect *)&v18)) {
      goto LABEL_5;
    }
LABEL_8:
    double v24 = [v6 view];
    BOOL v22 = [(UISheetPresentationController *)self _exteriorPanGestureRecognizerShouldInteractWithView:v24];

    goto LABEL_6;
  }
  if (v11 >= CGRectGetMaxY(*(CGRect *)&v18)) {
    goto LABEL_8;
  }
LABEL_5:
  BOOL v22 = 0;
LABEL_6:

  return v22;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  uint64_t v5 = objc_msgSend(a4, "view", a3);
  LOBYTE(self) = [(UISheetPresentationController *)self _exteriorPanGestureRecognizerShouldInteractWithView:v5];

  return (char)self;
}

- (void)_handleExteriorPan:(id)a3
{
  id v42 = a3;
  id v4 = [v42 view];
  [v42 locationInView:v4];
  double v6 = v5;

  uint64_t v7 = [v42 state];
  if ((unint64_t)(v7 - 3) >= 2)
  {
    if (v7 != 2)
    {
      if (v7 != 1) {
        goto LABEL_38;
      }
      double v8 = [(UIPresentationController *)self _childPresentationController];

      if (v8)
      {
        [v42 setEnabled:0];
        [v42 setEnabled:1];
        goto LABEL_38;
      }
      uint64_t v29 = -[UIPanGestureRecognizer _scrollDeviceCategory](v42);
      double v30 = _UIScrollViewRubberBandCoefficient(v29);
      if ([(UISheetPresentationController *)self _isHosting])
      {
        double v31 = [(UISheetPresentationController *)self _connectedRemoteSheet];
        char v32 = objc_opt_respondsToSelector();

        if ((v32 & 1) == 0)
        {
LABEL_37:
          [(UISheetPresentationController *)self set_exteriorPanStartLocationY:v6];
          goto LABEL_38;
        }
        double v33 = [(UISheetPresentationController *)self _connectedRemoteSheet];
        [v33 _sheetInteractionDraggingDidBeginWithRubberBandCoefficient:v30];
      }
      else
      {
        double v33 = [(UISheetPresentationController *)self _sheetInteraction];
        [v33 draggingBeganFromSource:v42 withRubberBandCoefficient:v30];
      }

      goto LABEL_37;
    }
    uint64_t v12 = [(UISheetPresentationController *)self _layoutInfo];
    int v13 = [v12 _isInverted];
    uint64_t v14 = [v42 _activeEventOfType:10];
    id v15 = v14;
    if (v14 && [v14 _scrollType] == 1)
    {
      [(UISheetPresentationController *)self _exteriorPanStartLocationY];
      double v17 = v6 - v16;
      if (!v13) {
        goto LABEL_27;
      }
    }
    else
    {
      [v12 _frameOfPresentedViewInContainerView];
      if (!v13)
      {
        double MinY = CGRectGetMinY(*(CGRect *)&v18);
        [(UISheetPresentationController *)self _exteriorDismissPadding];
        double v36 = MinY - v35;
        [(UISheetPresentationController *)self _exteriorPanStartLocationY];
        if (v36 >= v37) {
          double v37 = v36;
        }
        double v17 = v6 - v37;
LABEL_27:
        CGRect v26 = v42;
        if (v17 > 0.0) {
          goto LABEL_28;
        }
        goto LABEL_20;
      }
      double MaxY = CGRectGetMaxY(*(CGRect *)&v18);
      [(UISheetPresentationController *)self _exteriorDismissPadding];
      double v24 = MaxY + v23;
      [(UISheetPresentationController *)self _exteriorPanStartLocationY];
      if (v24 < v25) {
        double v25 = v24;
      }
      double v17 = v6 - v25;
    }
    CGRect v26 = v42;
    if (v17 < 0.0)
    {
LABEL_28:
      [v26 velocityInView:0];
      double v28 = v38;
      double v27 = 0.0;
LABEL_29:
      if ([(UISheetPresentationController *)self _isHosting])
      {
        int v39 = [(UISheetPresentationController *)self _connectedRemoteSheet];
        char v40 = objc_opt_respondsToSelector();

        if ((v40 & 1) == 0)
        {
LABEL_34:

          goto LABEL_38;
        }
        BOOL v41 = [(UISheetPresentationController *)self _connectedRemoteSheet];
        objc_msgSend(v41, "_sheetInteractionDraggingDidChangeWithTranslation:velocity:animateChange:", 0, v27, v17, v27, v28);
      }
      else
      {
        BOOL v41 = [(UISheetPresentationController *)self _sheetInteraction];
        objc_msgSend(v41, "draggingChangedInSource:withTranslation:velocity:animateChange:", v42, 0, v27, v17, v27, v28);
      }

      goto LABEL_34;
    }
LABEL_20:
    double v27 = *MEMORY[0x1E4F1DAD8];
    double v17 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    double v28 = v17;
    goto LABEL_29;
  }
  if ([(UISheetPresentationController *)self _isHosting])
  {
    double v9 = [(UISheetPresentationController *)self _connectedRemoteSheet];
    char v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) == 0) {
      goto LABEL_38;
    }
    double v11 = [(UISheetPresentationController *)self _connectedRemoteSheet];
    [v11 _sheetInteractionDraggingDidEnd];
  }
  else
  {
    double v11 = [(UISheetPresentationController *)self _sheetInteraction];
    [v11 draggingEndedInSource:v42];
  }

LABEL_38:
}

- (void)_hostSheetInteractionDraggingDidBeginWithRubberBandCoefficient:(double)a3
{
  id v5 = [(UISheetPresentationController *)self _sheetInteraction];
  [v5 draggingBeganFromSource:self withRubberBandCoefficient:a3];
}

- (void)_hostSheetInteractionDraggingDidChangeWithTranslation:(CGPoint)a3 velocity:(CGPoint)a4 animateChange:(BOOL)a5
{
  double y = a4.y;
  double x = a4.x;
  double v7 = a3.y;
  double v8 = a3.x;
  id v10 = [(UISheetPresentationController *)self _sheetInteraction];
  objc_msgSend(v10, "draggingChangedInSource:withTranslation:velocity:animateChange:", self, 0, v8, v7, x, y);
}

- (void)_hostSheetInteractionDraggingDidEnd
{
  id v3 = [(UISheetPresentationController *)self _sheetInteraction];
  [v3 draggingEndedInSource:self];
}

- (void)_setAllowsTearOff:(BOOL)a3
{
  if (self->__allowsTearOff != a3)
  {
    self->__allowsTearOff = a3;
    if (a3)
    {
      id v4 = [[UIDragInteraction alloc] initWithDelegate:self];
      tearOffInteraction = self->__tearOffInteraction;
      self->__tearOffInteraction = v4;

      [(UIDragInteraction *)self->__tearOffInteraction setEnabled:0];
      double v8 = [(UISheetPresentationController *)self dropShadowView];
      [(UIDragInteraction *)v8 addInteraction:self->__tearOffInteraction];
      double v6 = v8;
    }
    else
    {
      double v7 = [(UISheetPresentationController *)self dropShadowView];
      [v7 removeInteraction:self->__tearOffInteraction];

      double v6 = self->__tearOffInteraction;
      self->__tearOffInteraction = 0;
    }
  }
}

- (BOOL)sheetInteraction:(id)a3 shouldBeginHorizontalRubberBandingWithGestureRecognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(UISheetPresentationController *)self _setTearOffActivity:0];
  if ([(UISheetPresentationController *)self _allowsTearOff]
    && _UISystemShellAllowsSceneRequests()
    && (-[UIGestureRecognizer _activeTouchesEvent](v7),
        double v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    double v9 = [v7 _allActiveTouches];
    id v10 = [v9 anyObject];

    if (![v10 _isPointerTouch]
      || (dropShadowView = self->_dropShadowView,
          [v10 view],
          double v11 = objc_claimAutoreleasedReturnValue(),
          LODWORD(dropShadowView) = [dropShadowView _isGrabber:v11],
          v11,
          dropShadowView))
    {
      int v13 = [v6 view];
      [v7 locationInView:v13];
      double v15 = v14;
      double v17 = v16;

      -[UISheetPresentationController _setInitialTearOffPoint:](self, "_setInitialTearOffPoint:", v15, v17);
      if (v17 <= 60.0)
      {
        CGFloat v19 = [(UIPresentationController *)self delegate];
        char v20 = objc_opt_respondsToSelector();

        if (v20)
        {
          CGFloat v21 = [(UIPresentationController *)self delegate];
          [v21 _sheetPresentationControllerUserActivityForTearOff:self];
        }
        else
        {
          CGFloat v21 = [(UIPresentationController *)self presentedViewController];
          [v21 userActivity];
        dropShadowView = };

        if (dropShadowView
          || (_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_MakeAllSheetsTearable, @"MakeAllSheetsTearable") & 1) == 0&& byte_1EB257934&& (id v22 = objc_alloc(MEMORY[0x1E4F29230]), (dropShadowView = (void *)[v22 initWithActivityType:*MEMORY[0x1E4F28AC0]]) != 0))
        {
          [(UISheetPresentationController *)self _setTearOffActivity:dropShadowView];
          _UIInitializeDraggingSystem();

          LOBYTE(dropShadowView) = 1;
        }
      }
      else
      {
        LOBYTE(dropShadowView) = 0;
      }
    }
  }
  else
  {
    LOBYTE(dropShadowView) = 0;
  }

  return (char)dropShadowView;
}

- (BOOL)sheetInteraction:(id)a3 shouldAllowVerticalRubberBandingWithEvent:(id)a4
{
  id v5 = a4;
  if ([v5 type])
  {
    char v6 = 1;
  }
  else
  {
    id v7 = [v5 allTouches];
    double v8 = [v7 anyObject];

    if ([v8 _isPointerTouch])
    {
      dropShadowView = self->_dropShadowView;
      id v10 = [v8 view];
      char v6 = [(UIDropShadowView *)dropShadowView _isGrabber:v10];
    }
    else
    {
      char v6 = 1;
    }
  }
  return v6;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F28D78]);
  char v6 = [(UISheetPresentationController *)self _tearOffActivity];
  id v7 = (void *)[v5 initWithObject:v6];

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __74__UISheetPresentationController_dragInteraction_itemsForBeginningSession___block_invoke;
  v16[3] = &unk_1E52DD3E0;
  v16[4] = self;
  [v7 registerDataRepresentationForTypeIdentifier:@"com.apple.uikit.scene" visibility:1 loadHandler:v16];
  double v8 = objc_alloc_init(UIDraggingSystemSceneMetadata);
  double v9 = [(UISheetPresentationController *)self _tearOffActivity];
  id v10 = [v9 activityType];
  [(UIDraggingSystemSceneMetadata *)v8 setActivityType:v10];

  double v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v8 requiringSecureCoding:1 error:0];
  [v7 setTeamData:v11];

  if ((_UIInternalPreferenceUsesDefault_0(&_UIInternalPreference_MakeAllSheetsTearable, @"MakeAllSheetsTearable") & 1) == 0&& byte_1EB257934)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CB10] URLWithString:@"https://apple.com"];
    [v7 registerObject:v12 visibility:0];
  }
  int v13 = [[UIDragItem alloc] initWithItemProvider:v7];
  v17[0] = v13;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];

  return v14;
}

id __74__UISheetPresentationController_dragInteraction_itemsForBeginningSession___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 _tearOffActivity];
  id v5 = [v4 loadDataWithTypeIdentifier:@"com.apple.uikit.scene" forItemProviderCompletionHandler:v3];

  return v5;
}

- (BOOL)dragInteraction:(id)a3 prefersFullSizePreviewsForSession:(id)a4
{
  return 1;
}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v4 = [(UISheetPresentationController *)self dropShadowView];
  [v4 setAlpha:0.0];
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  char v6 = objc_opt_new();
  [v6 _setPreviewMode:2];
  [(UIView *)self->_dropShadowView bounds];
  id v7 = +[UIBezierPath bezierPathWithRoundedRect:cornerRadius:](UIBezierPath, "bezierPathWithRoundedRect:cornerRadius:");
  [v6 setVisiblePath:v7];

  double v8 = [UIDragPreviewTarget alloc];
  double v9 = [(UIView *)self->_dropShadowView superview];
  [(UIView *)self->_dropShadowView center];
  long long v10 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v14[0] = *MEMORY[0x1E4F1DAB8];
  v14[1] = v10;
  v14[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  double v11 = -[UIPreviewTarget initWithContainer:center:transform:](v8, "initWithContainer:center:transform:", v9, v14);

  uint64_t v12 = [[UITargetedDragPreview alloc] initWithView:self->_dropShadowView parameters:v6 target:v11];
  [(UISheetPresentationController *)self _initialTearOffPoint];
  -[UITargetedDragPreview setLiftAnchorPoint:](v12, "setLiftAnchorPoint:");

  return v12;
}

- (void)dragInteraction:(id)a3 session:(id)a4 didEndWithOperation:(unint64_t)a5
{
  if ((a5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    char v6 = [(UIPresentationController *)self presentingViewController];
    id v7 = [v6 presentedViewController];
    double v8 = [(UIPresentationController *)self presentedViewController];

    if (v7 == v8)
    {
      double v9 = [(UIPresentationController *)self presentingViewController];
      [v9 dismissViewControllerAnimated:1 completion:0];
    }
    int v13 = [(UIPresentationController *)self delegate];
    char v10 = objc_opt_respondsToSelector();
    double v11 = v13;
    if (v10)
    {
      if (qword_1EB25AEC8 != -1) {
        dispatch_once(&qword_1EB25AEC8, &__block_literal_global_1202);
      }
      double v11 = v13;
      if (byte_1EB25AEB9)
      {
        [v13 _sheetPresentationControllerDidTearOff:self];
        double v11 = v13;
      }
    }
  }
  else
  {
    [(UISheetPresentationController *)self _updatePresentedViewFrame];
    uint64_t v12 = [(UISheetPresentationController *)self dropShadowView];
    [v12 setAlpha:1.0];

    [(UISheetPresentationController *)self _setDidTearOff:0];
  }
}

- (void)dragInteraction:(id)a3 item:(id)a4 willAnimateCancelWithAnimator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__UISheetPresentationController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke;
  v5[3] = &unk_1E52DC698;
  v5[4] = self;
  objc_msgSend(a5, "addCompletion:", v5, a4);
}

void __84__UISheetPresentationController_dragInteraction_item_willAnimateCancelWithAnimator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePresentedViewFrame];
  id v2 = [*(id *)(a1 + 32) dropShadowView];
  [v2 setAlpha:1.0];
}

- (id)dragInteraction:(id)a3 previewForCancellingItem:(id)a4 withDefault:(id)a5
{
  char v6 = objc_opt_new();
  [v6 _setPreviewMode:2];
  id v7 = [UITargetedDragPreview alloc];
  double v8 = [(UISheetPresentationController *)self presentedView];
  double v9 = [UIDragPreviewTarget alloc];
  char v10 = [(UIPresentationController *)self containerView];
  [(UISheetPresentationController *)self frameOfPresentedViewInContainerView];
  double v15 = -[UIPreviewTarget initWithContainer:center:](v9, "initWithContainer:center:", v10, v12 + v11 * 0.5, v14 + v13 * 0.5);
  double v16 = [(UITargetedDragPreview *)v7 initWithView:v8 parameters:v6 target:v15];

  return v16;
}

- (void)set_hostManager:(id)a3
{
}

- (void)_setDraggingAndTransitioning:(BOOL)a3
{
  self->__draggingAndTransitioning = a3;
}

- (BOOL)_didAttemptToStartDismiss
{
  return self->__didAttemptToStartDismiss;
}

- (void)_setDidAttemptToStartDismiss:(BOOL)a3
{
  self->__didAttemptToStartDismiss = a3;
}

- (UIDragInteraction)_tearOffInteraction
{
  return self->__tearOffInteraction;
}

- (void)_setDidTearOff:(BOOL)a3
{
  self->__didTearOff = a3;
}

- (BOOL)_didExpand
{
  return self->__didExpand;
}

- (void)_setDidExpand:(BOOL)a3
{
  self->__didExpand = a3;
}

- (CGPoint)_initialTearOffPoint
{
  double x = self->__initialTearOffPoint.x;
  double y = self->__initialTearOffPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setInitialTearOffPoint:(CGPoint)a3
{
  self->__initialTearOffPoint = a3;
}

- (NSUserActivity)_tearOffActivity
{
  return self->__tearOffActivity;
}

- (void)_setTearOffActivity:(id)a3
{
}

- (CGPoint)_remoteInterruptedOffset
{
  double x = self->__remoteInterruptedOffset.x;
  double y = self->__remoteInterruptedOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)_setRemoteInterruptedOffset:(CGPoint)a3
{
  self->__remoteInterruptedOffset = a3;
}

- (void)_setDimmingViewTapDismissing:(BOOL)a3
{
  self->__dimmingViewTapDismissing = a3;
}

- (BOOL)_isKeyboardShown
{
  return self->__keyboardShown;
}

- (void)_setKeyboardShown:(BOOL)a3
{
  self->__keyboardShown = a3;
}

- (BOOL)_isOcclusionEnabled
{
  return self->__occlusionEnabled;
}

- (_UISheetPresentationControllerConfiguration)_lastConfiguration
{
  return self->__lastConfiguration;
}

- (double)_exteriorPanStartLocationY
{
  return self->__exteriorPanStartLocationY;
}

- (void)set_exteriorPanStartLocationY:(double)a3
{
  self->__exteriorPanStartLocationY = a3;
}

- (BOOL)_isExteriorPanGestureEnabled
{
  return self->__exteriorPanGestureEnabled;
}

- (void)_setExteriorPanGestureEnabled:(BOOL)a3
{
  self->__exteriorPanGestureEnabled = a3;
}

- (BOOL)_dismissingHorizontallyAlongsideNavigationPop
{
  return self->__dismissingHorizontallyAlongsideNavigationPop;
}

- (void)set_dismissingHorizontallyAlongsideNavigationPop:(BOOL)a3
{
  self->__dismissingHorizontallyAlongsideNavigationPop = a3;
}

- (void)set_forceSheetSemanticContext:(BOOL)a3
{
  self->__forceSheetSemanticContext = a3;
}

- (double)_exteriorDismissPadding
{
  return self->__exteriorDismissPadding;
}

- (void)_setExteriorDismissPadding:(double)a3
{
  self->__exteriorDismissPadding = a3;
}

@end