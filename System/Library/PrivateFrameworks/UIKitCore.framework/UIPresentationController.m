@interface UIPresentationController
+ (BOOL)_allowsDeferredTransitions;
+ (BOOL)_preventsAppearanceProxyCustomization;
+ (BOOL)_shouldDeferTransitions;
+ (UIEdgeInsets)_statusBarOverlapAndMarginInfoForView:(id)a3 inWindow:(id)a4;
+ (void)_scheduleTransition:(id)a3;
+ (void)initialize;
- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair;
- (BOOL)_allowsFocusInPresentingViewController;
- (BOOL)_canPresentInSeparateScene;
- (BOOL)_changedPresentingViewControllerDuringAdaptation;
- (BOOL)_containerIgnoresDirectTouchEvents;
- (BOOL)_containerViewShouldIgnoreDirectTouchEvents;
- (BOOL)_fallbackShouldDismiss;
- (BOOL)_forcePresentationInPresenterScene;
- (BOOL)_forcesPreferredAnimationControllers;
- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)_gestureRecognizerShouldBegin:(id)a3;
- (BOOL)_handlesKeyboardAvoidance;
- (BOOL)_ignoresLeftAndRightSafeAreaInsets;
- (BOOL)_inheritsPresentingViewControllerThemeLevel;
- (BOOL)_isAdapted;
- (BOOL)_isModal;
- (BOOL)_isPresentedInFullScreen;
- (BOOL)_isPresentedViewControllerStoredWeakly;
- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions;
- (BOOL)_mayChildGrabPresentedViewControllerView;
- (BOOL)_monitorsSystemLayoutFittingSize;
- (BOOL)_presentationPotentiallyUnderlapsStatusBar;
- (BOOL)_presentedViewControllerProvidesContentScrollView;
- (BOOL)_presentingOrPresented;
- (BOOL)_preserveResponderAcrossWindows;
- (BOOL)_requiresDeferralToCoordinateWithNavigationTransitionAnimated:(BOOL)a3;
- (BOOL)_shouldAdaptFromTraitCollection:(id)a3 toTraitCollection:(id)a4;
- (BOOL)_shouldAnimateReenablingOfAutorotation;
- (BOOL)_shouldCallAppearanceCallbacksFor:(id)a3;
- (BOOL)_shouldContinueTouchesOnTargetViewController;
- (BOOL)_shouldConvertToScene;
- (BOOL)_shouldDisableAppearanceCallbacksForPresentedViewController;
- (BOOL)_shouldDisableInteractionDuringTransitions;
- (BOOL)_shouldDisablePresentersAppearanceCallbacks;
- (BOOL)_shouldDismiss;
- (BOOL)_shouldDismissWithNavigationPop;
- (BOOL)_shouldGrabPresentersView;
- (BOOL)_shouldKeepCurrentFirstResponder;
- (BOOL)_shouldMakePresentedViewControllerFirstResponder;
- (BOOL)_shouldOccludeDuringPresentation;
- (BOOL)_shouldPerformWillTransitionToTraitCollectionForParent:(id)a3;
- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance;
- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop;
- (BOOL)_shouldPreserveFirstResponder;
- (BOOL)_shouldRespectDefinesPresentationContext;
- (BOOL)_shouldRestoreFirstResponder;
- (BOOL)_shouldSavePresentedViewControllerForStateRestoration;
- (BOOL)_transitioningFrom;
- (BOOL)_transitioningTo;
- (BOOL)_wantsAutomaticFirstResponderWhenPresentingRemoteViewController;
- (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing;
- (BOOL)dismissed;
- (BOOL)dismissing;
- (BOOL)isCurrentStateCancelled;
- (BOOL)presented;
- (BOOL)presenting;
- (BOOL)shouldPresentInFullscreen;
- (BOOL)shouldRemovePresentersView;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3;
- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3 inWindow:(id)a4;
- (CGRect)_frameOfPresentedViewControllerViewInSuperview;
- (CGRect)frameOfPresentedViewInContainerView;
- (CGRect)sourceRect;
- (CGSize)_preferredContentSize;
- (CGSize)preferredContentSize;
- (Class)_appearanceGuideClass;
- (NSArray)preferredFocusEnvironments;
- (UIBarButtonItem)barButtonItem;
- (UIEdgeInsets)_additionalSafeAreaInsets;
- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4;
- (UIFocusEnvironment)parentFocusEnvironment;
- (UIFocusItemContainer)focusItemContainer;
- (UIModalPresentationStyle)adaptivePresentationStyle;
- (UIModalPresentationStyle)adaptivePresentationStyleForTraitCollection:(UITraitCollection *)traitCollection;
- (UIModalPresentationStyle)presentationStyle;
- (UIPopoverPresentationControllerSourceItem)sourceItem;
- (UIPresentationController)init;
- (UIPresentationController)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController;
- (UITraitCollection)_internalOverrideTraitCollection;
- (UITraitCollection)overrideTraitCollection;
- (UITraitCollection)traitCollection;
- (UIView)_currentPresentationSuperview;
- (UIView)_customViewForTouchContinuation;
- (UIView)_presentationView;
- (UIView)_presentedViewForOverrideTraits;
- (UIView)_realSourceView;
- (UIView)_viewForRemoteTextEffectsWindowMatchAnimation;
- (UIView)containerView;
- (UIView)preferredFocusedView;
- (UIView)presentedView;
- (UIView)sourceView;
- (UIViewController)_sourceViewController;
- (UIViewController)presentedViewController;
- (UIViewController)presentingViewController;
- (UIViewControllerAnimatedTransitioning)_currentTransitionController;
- (UIViewControllerInteractiveTransitioning)_currentInteractionController;
- (UIViewControllerTransitionCoordinator)_adaptiveTransitionCoordinator;
- (UIViewControllerTransitionCoordinator)_definiteTransitionCoordinator;
- (UIViewControllerTransitionCoordinator)_transitionCoordinator;
- (UIViewControllerTransitionCoordinatorContext)_adaptiveTransitionContext;
- (_UIFormSheetPresentationController)_adaptiveFormSheetPresentationController;
- (_UIPresentationControllerVisualStyle)_visualStyle;
- (_UITraitOverrides)_internalTraitOverrides;
- (_UIViewControllerTransitionContext)_transitionContext;
- (id)_activePresentationController;
- (id)_adaptiveWillTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
- (id)_animatorForContainmentTransition;
- (id)_appearanceContainer;
- (id)_childPresentationController;
- (id)_compatibleParentTraitEnvironment;
- (id)_computeToEndFrameForCurrentTransition;
- (id)_containerSuperviewForCurrentTransition;
- (id)_createVisualStyleForProvider:(id)a3;
- (id)_currentContextPresentationSuperview;
- (id)_currentTransitionDidComplete;
- (id)_customFromViewForCurrentTransition;
- (id)_customToViewForCurrentTransition;
- (id)_descriptionForPrintingViewControllerHierarchy;
- (id)_firstCurrentContextChildInWindow;
- (id)_fromViewForCurrentTransition;
- (id)_fullscreenPresentationSuperview;
- (id)_initialPresentationViewControllerForViewController:(id)a3;
- (id)_parentPresentationController;
- (id)_parentPresentationControllerImmediate:(BOOL)a3;
- (id)_parentTraitCollection;
- (id)_parentTraitEnvironment;
- (id)_passthroughViews;
- (id)_pendingFocusEnvironmentUnlock;
- (id)_preferredAnimationControllerForDismissal;
- (id)_preferredAnimationControllerForPresentation;
- (id)_preferredInteractionControllerForDismissal:(id)a3;
- (id)_preferredInteractionControllerForPresentation:(id)a3;
- (id)_presentationControllerForTraitCollection:(id)a3;
- (id)_presentedViewControllerForPresentationController:(id)a3 traitCollection:(id)a4;
- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4;
- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5;
- (id)_rootPresentingViewControllerForNestedPresentation;
- (id)_toViewForCurrentTransition;
- (id)_traitTrace;
- (id)_traitTrace:(id)a3;
- (id)_transitionViewForCurrentTransition;
- (id)_ui_observationTrackingDictionary;
- (id)_viewToIgnoreLayerTransformForViewFrameInWindowContentOverlayInsetsCalculation;
- (id)_viewsParticipatingInNavigationControllerTransition;
- (id)delegate;
- (id)presentedContentContainer;
- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4;
- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4;
- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5;
- (id)traitOverrides;
- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3;
- (int64_t)_preferredContainerBackgroundStyle;
- (int64_t)_subclassPreferredFocusedViewPrioritizationType;
- (int64_t)state;
- (void)_beginOcclusionIfNecessary:(BOOL)a3;
- (void)_cleanup;
- (void)_collectExistingTraitCollectionsForTraitTracking:(id)a3;
- (void)_compatibleUpdateTraitsIfNecessary;
- (void)_containedViewControllerModalStateChanged;
- (void)_containerViewDidLayoutSubviewsWithObservationTracking;
- (void)_containerViewWillLayoutSubviews;
- (void)_containerViewWillLayoutSubviewsWithObservationTracking;
- (void)_coverWithSnapshot;
- (void)_disableMenuPressForBackGesture;
- (void)_dismissWithAnimationController:(id)a3 interactionController:(id)a4 animated:(BOOL)a5 handoffData:(id)a6;
- (void)_enableOcclusion:(BOOL)a3;
- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4;
- (void)_initViewHierarchyForPresentationSuperview:(id)a3;
- (void)_initViewHierarchyForPresentationSuperview:(id)a3 inWindow:(id)a4;
- (void)_invalidateContainerViewLayout;
- (void)_parent:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_performBackGesture:(id)a3;
- (void)_populateInitialTraitCollection;
- (void)_prepareForWindowDeallocRecursively:(BOOL)a3;
- (void)_presentWithAnimationController:(id)a3 inWindow:(id)a4 interactionController:(id)a5 animated:(BOOL)a6 handoffData:(id)a7;
- (void)_recordTraitUsage:(unint64_t)a3 insideMethod:(const char *)a4 withInvalidationAction:;
- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3;
- (void)_releaseSnapshot;
- (void)_sendDelegateWillPresentWithAdaptiveStyle:(int64_t)a3 transitionCoordinator:(id)a4;
- (void)_sendDidAttemptToDismiss;
- (void)_sendDidDismiss;
- (void)_sendDismissalsAsNeeded;
- (void)_sendPresentationControllerNotification:(id)a3 userInfo:(id)a4;
- (void)_sendWillDismiss;
- (void)_setAdaptiveTransitionContext:(id)a3;
- (void)_setAdaptiveTransitionCoordinator:(id)a3;
- (void)_setChangedPresentingViewControllerDuringAdaptation:(BOOL)a3;
- (void)_setContainerIgnoresDirectTouchEvents:(BOOL)a3;
- (void)_setContainerView:(id)a3;
- (void)_setCurrentInteractionController:(id)a3;
- (void)_setCurrentPresentationSuperview:(id)a3;
- (void)_setCurrentTransitionController:(id)a3;
- (void)_setCustomViewForTouchContinuation:(id)a3;
- (void)_setForcePresentationInPresenterScene:(BOOL)a3;
- (void)_setInternalOverrideTraitCollection:(id)a3;
- (void)_setPendingFocusEnvironmentUnlock:(id)a3;
- (void)_setPreferredContentSize:(CGSize)a3;
- (void)_setPresentationView:(id)a3;
- (void)_setPresentedViewController:(id)a3;
- (void)_setPresentedViewControllerStoredWeakly:(BOOL)a3;
- (void)_setPresentingViewController:(id)a3;
- (void)_setRealSourceView:(id)a3;
- (void)_setShouldContinueTouchesOnTargetViewController:(BOOL)a3;
- (void)_setSourceViewController:(id)a3;
- (void)_traitOverridesDidChange:(id)a3;
- (void)_transitionFromDidEnd;
- (void)_transitionToDidEnd;
- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4;
- (void)_transplantView:(id)a3 toSuperview:(id)a4;
- (void)_transplantView:(id)a3 toSuperview:(id)a4 atIndex:(unint64_t)a5;
- (void)_ui_setObservationTrackingDictionary:(id)a3;
- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3;
- (void)_updateAuxiliaryChildTraitEnvironmentsIfNeeded;
- (void)_updateRealSourceView;
- (void)_updateTraitsIfNecessary;
- (void)_updateTraitsIfNecessaryInitiatingPropagation:(BOOL)a3;
- (void)_window:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5;
- (void)_windowSceneDidUpdateEffectiveGeometry:(id)a3;
- (void)completeCurrentTransitionImmediately;
- (void)dealloc;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)runTransitionForCurrentStateAnimated:(BOOL)a3 handoffData:(id)a4;
- (void)setDelegate:(id)delegate;
- (void)setIsCurrentStateCancelled:(BOOL)a3;
- (void)setNeedsFocusUpdate;
- (void)setOverrideTraitCollection:(UITraitCollection *)overrideTraitCollection;
- (void)setSourceItem:(id)a3;
- (void)setSourceRect:(CGRect)a3;
- (void)setSourceView:(id)a3;
- (void)setState:(int64_t)a3;
- (void)set_computeToEndFrameForCurrentTransition:(id)a3;
- (void)set_containerSuperviewForCurrentTransition:(id)a3;
- (void)set_currentTransitionDidComplete:(id)a3;
- (void)set_customFromViewForCurrentTransition:(id)a3;
- (void)set_customToViewForCurrentTransition:(id)a3;
- (void)set_fromViewForCurrentTransition:(id)a3;
- (void)set_toViewForCurrentTransition:(id)a3;
- (void)set_transitionViewForCurrentTransition:(id)a3;
- (void)transitionDidFinish:(BOOL)a3;
- (void)transitionDidStart;
- (void)unregisterForTraitChanges:(id)a3;
- (void)updateFocusIfNeeded;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation UIPresentationController

- (void)_recordTraitUsage:(unint64_t)a3 insideMethod:(const char *)a4 withInvalidationAction:
{
  if (a1)
  {
    if (!a1[4] && _UITraitTokenSetCount(a2))
    {
      v8 = objc_alloc_init(_UITraitChangeRegistry);
      v9 = (void *)a1[4];
      a1[4] = v8;
    }
    uint64_t v10 = a1[4];
    -[_UITraitChangeRegistry recordTraitUsage:forTraitEnvironment:insideMethod:withInvalidationAction:](v10, a2, a1, a3, a4);
  }
}

- (void)_collectExistingTraitCollectionsForTraitTracking:(id)a3
{
  if (self->_lastNotifiedTraitCollection) {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (UIViewController)presentedViewController
{
  if (self->__presentedViewControllerStoredWeakly) {
    WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_weakPresentedViewController);
  }
  else {
    WeakRetained = self->_presentedViewController;
  }
  return WeakRetained;
}

- (UITraitCollection)traitCollection
{
  TraitCollectionTSD = GetTraitCollectionTSD();
  char v4 = TraitCollectionTSD[9];
  TraitCollectionTSD[9] = 1;
  v5 = [(UIPresentationController *)self _parentTraitCollection];
  if ([(UIPresentationController *)self _inheritsPresentingViewControllerThemeLevel])
  {
    uint64_t v6 = -[UITraitCollection _traitCollectionWithIncrementedBackgroundLevel](v5);

    v5 = (void *)v6;
  }
  id v7 = v5;
  traitOverrides = self->_traitOverrides;
  v9 = v7;
  if (traitOverrides)
  {
    v9 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:]((void **)&traitOverrides->super.isa, v7);
  }
  *((unsigned char *)GetTraitCollectionTSD() + 9) = v4;
  _UITraitEnvironmentGeneratedTraitCollection((uint64_t)self, (unint64_t)v9);

  return (UITraitCollection *)v9;
}

- (id)_parentTraitCollection
{
  v3 = [(UIPresentationController *)self _parentTraitEnvironment];
  char v4 = v3;
  if (v3)
  {
    v5 = [v3 traitCollection];
  }
  else if (dyld_program_sdk_at_least())
  {
    v5 = self->_lastNotifiedTraitCollection;
  }
  else
  {
    +[UITraitCollection _defaultTraitCollection]();
    v5 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v6 = v5;

  return v6;
}

- (id)_parentTraitEnvironment
{
  if (_UIPresentationControllersInheritTraitsFromViewHierarchy()) {
    [(UIPresentationController *)self containerView];
  }
  else {
  v3 = [(UIPresentationController *)self _compatibleParentTraitEnvironment];
  }
  return v3;
}

- (BOOL)_inheritsPresentingViewControllerThemeLevel
{
  return 1;
}

- (BOOL)_isAdapted
{
  v2 = self;
  v3 = [(UIPresentationController *)self presentingViewController];
  char v4 = [v3 _presentationController];
  LOBYTE(v2) = v4 != v2;

  return (char)v2;
}

- (BOOL)_wantsContentOverlayInsetsUpdatesWhileDismissing
{
  return 0;
}

- (BOOL)_isPresentedInFullScreen
{
  v3 = [(UIPresentationController *)self containerView];
  char v4 = [v3 superview];
  v5 = [(UIPresentationController *)self containerView];
  uint64_t v6 = [v5 window];
  BOOL v7 = v4 == v6;

  return v7;
}

- (UIView)containerView
{
  return self->_containerView;
}

- (id)_viewToIgnoreLayerTransformForViewFrameInWindowContentOverlayInsetsCalculation
{
  return 0;
}

- (BOOL)presenting
{
  return self->_state == 1;
}

- (BOOL)dismissing
{
  return self->_state == 3;
}

- (_UITraitOverrides)_internalTraitOverrides
{
  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    char v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return (_UITraitOverrides *)-[_UITraitOverrides _overridesAppliedBefore](traitOverrides);
}

- (void)_containerViewWillLayoutSubviews
{
  if (![(UIPresentationController *)self dismissing]
    && ![(UIPresentationController *)self _transitioningFrom])
  {
    if (!self->_didUpdateLayoutForStatusBarAndInterfaceOrientation)
    {
      self->_didUpdateLayoutForStatusBarAndInterfaceOrientation = 1;
      v3 = [(UIPresentationController *)self presentedViewController];
      [v3 _updateLayoutForStatusBarAndInterfaceOrientation];
    }
    [(UIPresentationController *)self containerViewWillLayoutSubviews];
  }
}

- (BOOL)_transitioningFrom
{
  return self->_state == 4;
}

+ (void)initialize
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if ((id)objc_opt_class() != a1)
  {
    v3 = self;
    [v3 instanceMethodForSelector:sel_traitCollection];
    uint64_t v4 = dyld_image_header_containing_address();
    [a1 instanceMethodForSelector:sel_traitCollection];
    uint64_t v5 = dyld_image_header_containing_address();

    if (v4 != v5)
    {
      uint64_t v6 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollection", &initialize___s_category_0) + 8);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        BOOL v7 = v6;
        v8 = NSStringFromClass((Class)a1);
        int v9 = 138412290;
        uint64_t v10 = v8;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_ERROR, "Class %@ overrides the -traitCollection getter, which is not supported. If you're trying to override traits, you must use the appropriate API.", (uint8_t *)&v9, 0xCu);
      }
    }
  }
}

void __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_112(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  [*(id *)(a1 + 32) setIsCurrentStateCancelled:a3 ^ 1];
  [*(id *)(a1 + 40) setContext:0];
  [*(id *)(a1 + 48) popAnimationStyle];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  if (WeakRetained && [*(id *)(a1 + 32) _shouldDisableInteractionDuringTransitions])
  {
    int v7 = *(unsigned __int8 *)(a1 + 88);

    if (v7) {
      goto LABEL_6;
    }
    v8 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p> completing transition for presentation", *(void *)(a1 + 80), *(void *)(a1 + 32));
    int v9 = NSString;
    id WeakRetained = v8;
    uint64_t v10 = objc_msgSend(v9, "stringWithFormat:", @"%s %s", objc_msgSend(WeakRetained, "UTF8String"), objc_msgSend(*(id *)(a1 + 56), "UTF8String"));
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
    [v11 _endIgnoringInteractionEventsForReason:v10];

    objc_storeWeak((id *)(*(void *)(a1 + 32) + 80), 0);
  }

LABEL_6:
  uint64_t v12 = [*(id *)(a1 + 32) _shouldAnimateReenablingOfAutorotation];
  if (dyld_program_sdk_at_least())
  {
    [*(id *)(a1 + 64) endDisablingInterfaceAutorotationAnimated:v12];
    id v13 = objc_loadWeakRetained((id *)(a1 + 72));
    [v13 endDisablingInterfaceAutorotationAnimated:v12];

    [*(id *)(a1 + 32) transitionDidFinish:a3];
  }
  else
  {
    [*(id *)(a1 + 32) transitionDidFinish:a3];
    [*(id *)(a1 + 64) endDisablingInterfaceAutorotationAnimated:v12];
    id v14 = objc_loadWeakRetained((id *)(a1 + 72));
    [v14 endDisablingInterfaceAutorotationAnimated:v12];
  }
  id v17 = v5;
  v15 = [v17 _postInteractiveCompletionHandler];

  if (v15)
  {
    v16 = [v17 _postInteractiveCompletionHandler];
    v16[2]();

    [v17 _setPostInteractiveCompletionHandler:0];
  }
  if (objc_opt_respondsToSelector()) {
    [*(id *)(*(void *)(a1 + 32) + 160) animationEnded:a3];
  }
  [v17 _setTransitionIsInFlight:0];
  [v17 _setInteractor:0];
  [v17 _setAnimator:0];
}

- (void)setIsCurrentStateCancelled:(BOOL)a3
{
  self->_isCurrentStateCancelled = a3;
}

- (BOOL)_shouldAnimateReenablingOfAutorotation
{
  return 1;
}

- (BOOL)presented
{
  return self->_state == 2;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)_updateTraitsIfNecessaryInitiatingPropagation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  p_lastNotifiedTraitCollection = &self->_lastNotifiedTraitCollection;
  uint64_t v6 = self->_lastNotifiedTraitCollection;
  int v7 = [(UIPresentationController *)self traitCollection];
  v8 = v7;
  if (v6 != v7 && ![(UITraitCollection *)v7 isEqual:v6])
  {
    objc_storeStrong((id *)p_lastNotifiedTraitCollection, v8);
    int v9 = (void *)_UISetCurrentFallbackEnvironment(self);
    uint64_t v10 = +[UITraitCollection _currentTraitCollectionIfExists]();
    +[UITraitCollection setCurrentTraitCollection:v8];
    if (v6)
    {
      *(void *)v27 = 0;
      memset(v26, 0, sizeof(v26));
      [(UITraitCollection *)(uint64_t)v6 _createTraitTokenSetForChangesFromTraitCollection:(uint64_t)v26];
      -[_UITraitChangeRegistry traitsDidChange:forTraitEnvironment:withPreviousTraitCollection:]((uint64_t)self->_traitChangeRegistry, (uint64_t *)v26, self, v6);
      if (*(void *)&v26[0]) {
    }
      }
    id v11 = self;
    BOOL v12 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v11, (uint64_t)self, (uint64_t)sel_traitCollectionDidChange_);

    if (v12)
    {
      v22 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &_updateTraitsIfNecessaryInitiatingPropagation____s_category)+ 8);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = v22;
        v24 = NSStringFromSelector(sel_traitCollectionDidChange_);
        v25 = +[UITraitCollection _descriptionForChangeFromTraitCollection:v6 toTraitCollection:v8];
        LODWORD(v26[0]) = 138413314;
        *(void *)((char *)v26 + 4) = v24;
        WORD6(v26[0]) = 2112;
        *(void *)((char *)v26 + 14) = self;
        WORD3(v26[1]) = 2112;
        *((void *)&v26[1] + 1) = v25;
        *(_WORD *)v27 = 2112;
        *(void *)&v27[2] = v6;
        __int16 v28 = 2112;
        v29 = v8;
        _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► previous: %@\n\t► current: %@", (uint8_t *)v26, 0x34u);
      }
    }
    [(UIPresentationController *)self traitCollectionDidChange:v6];
    +[UITraitCollection setCurrentTraitCollection:v10];
    _UIRestorePreviousFallbackEnvironment(v9);
    if (!_UIPresentationControllersInheritTraitsFromViewHierarchy()) {
      goto LABEL_27;
    }
    uint64_t v13 = [(UIPresentationController *)self _presentedViewForOverrideTraits];
    id v14 = (void *)v13;
    if (v13) {
      _UIViewInvalidateTraitCollectionAndSchedulePropagation(v13, 0);
    }
    v15 = [(UIPresentationController *)self presentedViewController];
    uint64_t v16 = [v15 _existingView];
    id v17 = (void *)v16;
    if (v16)
    {
      unsigned int v18 = !v3;
      if (!v14) {
        unsigned int v18 = 0;
      }
      if ((void *)v16 == v14) {
        uint64_t v19 = 0;
      }
      else {
        uint64_t v19 = v18;
      }
      _UIViewInvalidateTraitCollectionAndSchedulePropagation(v16, v19);
      if (!v3) {
        goto LABEL_26;
      }
    }
    else
    {
      -[UIViewController _updateTraitsIfNecessarySchedulingPropagation:]((uint64_t)v15, 0);
      if (!v3)
      {
LABEL_26:

LABEL_27:
        goto LABEL_28;
      }
    }
    if (v14)
    {
      v20 = [v14 _window];

      if (v20) {
        -[UIView _updateTraitsIfNeededWithBehavior:]((uint64_t)v14, 0);
      }
    }
    if (v17)
    {
      if (v17 != v14)
      {
        v21 = [v17 _window];

        if (v21) {
          -[UIView _updateTraitsIfNeededWithBehavior:]((uint64_t)v17, 0);
        }
      }
    }
    goto LABEL_26;
  }
LABEL_28:
}

- (UIView)_presentedViewForOverrideTraits
{
  if (dyld_program_sdk_at_least())
  {
    BOOL v3 = [(UIPresentationController *)self presentedViewController];
    uint64_t v4 = [v3 viewIfLoaded];

    if (v4)
    {
      uint64_t v5 = [(UIPresentationController *)self presentedView];
      uint64_t v6 = (void *)v5;
      if ((void *)v5 == v4) {
        int v7 = 0;
      }
      else {
        int v7 = (void *)v5;
      }
      id v8 = v7;
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  return (UIView *)v8;
}

void __48__UIPresentationController_transitionDidFinish___block_invoke(uint64_t a1)
{
  _UIQOSExcludeCommitFromGlitchTrackingIfUnmanaged();
  if ([*(id *)(a1 + 32) _shouldCallAppearanceCallbacksFor:*(void *)(a1 + 40)])
  {
    v2 = *(void **)(a1 + 40);
    if (v2 == *(void **)(a1 + 48))
    {
      objc_msgSend(v2, "setInAnimatedVCTransition:", objc_msgSend(*(id *)(a1 + 56), "isAnimated"));
      v2 = *(void **)(a1 + 40);
    }
    [v2 setFinishingModalTransition:1];
    BOOL v3 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 72))
    {
      [v3 endAppearanceTransition];
      [*(id *)(a1 + 40) setAppearanceTransitionsAreDisabled:0];
    }
    else
    {
      [v3 cancelBeginAppearanceTransition];
    }
    [*(id *)(a1 + 40) setFinishingModalTransition:0];
  }
  if ([*(id *)(a1 + 32) _shouldCallAppearanceCallbacksFor:*(void *)(a1 + 64)])
  {
    uint64_t v4 = *(void **)(a1 + 64);
    if (v4 == *(void **)(a1 + 48))
    {
      objc_msgSend(v4, "setInAnimatedVCTransition:", objc_msgSend(*(id *)(a1 + 56), "isAnimated"));
      uint64_t v4 = *(void **)(a1 + 64);
    }
    if (*(unsigned char *)(a1 + 72)) {
      [v4 endAppearanceTransition];
    }
    else {
      [v4 cancelBeginAppearanceTransition];
    }
  }
  [*(id *)(a1 + 64) setPerformingModalTransition:0];
  [*(id *)(a1 + 40) setPerformingModalTransition:0];
  if (*(void *)(*(void *)(a1 + 32) + 128))
  {
    if (*(unsigned char *)(a1 + 73))
    {
      uint64_t v5 = *(void **)(a1 + 40);
      if (*(unsigned char *)(a1 + 72))
      {
        [v5 _presentingViewControllerDidChange:*(void *)(a1 + 64)];
        -[UIViewController _modalPreservedFirstResponder](*(id **)(a1 + 64));
        id v8 = (id)objc_claimAutoreleasedReturnValue();
        [v8 _becomeFirstResponderWhenPossible];

        return;
      }
      [v5 _presentingViewControllerWillChange:0];
      uint64_t v6 = *(void **)(a1 + 40);
    }
    else
    {
      uint64_t v6 = *(void **)(a1 + 64);
      if (!*(unsigned char *)(a1 + 72))
      {
        [v6 _presentingViewControllerWillChange:*(void *)(a1 + 40)];
        uint64_t v6 = *(void **)(a1 + 64);
        uint64_t v7 = *(void *)(a1 + 40);
LABEL_25:
        [v6 _presentingViewControllerDidChange:v7];
        return;
      }
    }
    uint64_t v7 = 0;
    goto LABEL_25;
  }
}

void __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_3(uint64_t a1)
{
  uint64_t v115 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [*(id *)(a1 + 32) _transitionViewForCurrentTransition];

  if (!v3)
  {
    NSLog(&cfstr_NullTransition_0.isa);
    return;
  }
  v102 = (void *)_UISetCurrentFallbackEnvironment(*(void **)(a1 + 32));
  int v4 = [*(id *)(a1 + 32) presenting];
  uint64_t v5 = *(void **)(a1 + 32);
  if (v4)
  {
    uint64_t v6 = [*(id *)(a1 + 32) presentedViewController];
    [v5 preferredContentSizeDidChangeForChildContentContainer:v6];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) _parentPresentationController];
    uint64_t v6 = v7;
    if (v7 && !v7[5])
    {
      id v8 = [v7 presentedViewController];
      [v6 preferredContentSizeDidChangeForChildContentContainer:v8];
    }
  }

  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  uint64_t v10 = [*(id *)(a1 + 32) _transitionViewForCurrentTransition];

  if (has_internal_diagnostics)
  {
    if (!v10)
    {
      v93 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v93, OS_LOG_TYPE_FAULT))
      {
        uint64_t v100 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v114 = v100;
        _os_log_fault_impl(&dword_1853B0000, v93, OS_LOG_TYPE_FAULT, "transitionViewForCurrentTransition is not set, presentation controller was dismissed during the presentation? (%@)", buf, 0xCu);
      }
    }
  }
  else if (!v10)
  {
    v94 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FF68) + 8);
    if (os_log_type_enabled(v94, OS_LOG_TYPE_ERROR))
    {
      uint64_t v95 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v114 = v95;
      _os_log_impl(&dword_1853B0000, v94, OS_LOG_TYPE_ERROR, "transitionViewForCurrentTransition is not set, presentation controller was dismissed during the presentation? (%@)", buf, 0xCu);
    }
  }
  id v11 = [*(id *)(a1 + 32) _transitionViewForCurrentTransition];
  v105 = v11[2]();

  BOOL v12 = [*(id *)(a1 + 32) _fromViewForCurrentTransition];

  if (v12)
  {
    uint64_t v13 = *(void **)(a1 + 40);
    id v14 = [*(id *)(a1 + 32) _fromViewForCurrentTransition];
    v15 = v14[2]();
    [v13 _setFromView:v15];
  }
  uint64_t v16 = [*(id *)(a1 + 32) _toViewForCurrentTransition];

  if (v16)
  {
    id v17 = *(void **)(a1 + 40);
    unsigned int v18 = [*(id *)(a1 + 32) _toViewForCurrentTransition];
    uint64_t v19 = v18[2]();
    [v17 _setToView:v19];
  }
  v104 = [*(id *)(a1 + 48) windowScene];
  v20 = [v104 keyboardSceneDelegate];
  if (v20)
  {
    v21 = +[_UIViewControllerKeyboardAnimationStyle animationStyleWithContext:*(void *)(a1 + 40) useCustomTransition:1];
    [v20 pushAnimationStyle:v21];
  }
  else
  {
    v21 = 0;
  }
  if (dyld_program_sdk_at_least()) {
    uint64_t v22 = [*(id *)(a1 + 40) isAnimated];
  }
  else {
    uint64_t v22 = +[UIView areAnimationsEnabled];
  }
  uint64_t v23 = v22;
  if ([*(id *)(a1 + 32) _shouldCallAppearanceCallbacksFor:*(void *)(a1 + 56)]) {
    [*(id *)(a1 + 56) beginAppearanceTransition:0 animated:v23];
  }
  v24 = [*(id *)(a1 + 64) _popoverController];
  if (v24)
  {
    v25 = [*(id *)(a1 + 64) _popoverController];
    uint64_t v26 = [v25 _isDismissing];
  }
  else
  {
    uint64_t v26 = 0;
  }

  [*(id *)(a1 + 64) setAppearanceTransitionsAreDisabled:v26];
  if ([*(id *)(a1 + 32) _shouldCallAppearanceCallbacksFor:*(void *)(a1 + 64)])
  {
    v27 = [v105 window];
    [*(id *)(a1 + 64) _setExpectedWindow:v27];
    [*(id *)(a1 + 64) beginAppearanceTransition:1 animated:v23];
    [*(id *)(a1 + 64) _setExpectedWindow:0];
  }
  if (!*(unsigned char *)(a1 + 104)) {
    [*(id *)(a1 + 40) _setCompletionCurve:7];
  }
  __int16 v28 = [*(id *)(a1 + 32) presentedViewController];
  int v29 = _UISheetPresentationControllerStylesSheetsAsCards(v28);

  if (v29)
  {
    [*(id *)(a1 + 32) frameOfPresentedViewInContainerView];
    double v31 = v30;
    double v33 = v32;
    double v35 = v34;
    double v37 = v36;
  }
  else
  {
    v38 = [*(id *)(a1 + 56) view];
    [v38 frame];
    double v31 = v39;
    double v33 = v40;
    double v35 = v41;
    double v37 = v42;
  }
  [*(id *)(a1 + 40) _setContainerView:v105];
  objc_msgSend(*(id *)(a1 + 40), "_setFromStartFrame:", v31, v33, v35, v37);
  v43 = *(void **)(a1 + 40);
  int v44 = [*(id *)(a1 + 32) _shouldGrabPresentersView];
  v45 = (double *)MEMORY[0x1E4F1DB28];
  if (v44 && [*(id *)(a1 + 32) presenting])
  {
    int v46 = 0;
    double v47 = *v45;
    double v48 = v45[1];
    double v49 = v45[2];
    double v50 = v45[3];
  }
  else
  {
    v1 = [*(id *)(a1 + 56) view];
    [v1 frame];
    int v46 = 1;
  }
  objc_msgSend(v43, "_setFromEndFrame:", v47, v48, v49, v50);
  if (v46) {

  }
  v106[0] = MEMORY[0x1E4F143A8];
  v106[1] = 3221225472;
  v106[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_112;
  v106[3] = &unk_1E52E7C48;
  v51 = *(void **)(a1 + 40);
  v106[4] = *(void *)(a1 + 32);
  id v103 = v21;
  id v107 = v103;
  id v52 = v20;
  char v112 = *(unsigned char *)(a1 + 105);
  v53 = *(void **)(a1 + 96);
  id v101 = v52;
  id v108 = v52;
  v111[1] = v53;
  id v109 = *(id *)(a1 + 72);
  id v110 = *(id *)(a1 + 48);
  objc_copyWeak(v111, (id *)(a1 + 88));
  [v51 _setCompletionHandler:v106];
  if (+[UIViewPropertyAnimator _canEnableTrackingAnimationsWithAnimators])
  {
    BOOL v54 = +[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled];
    if (!v54) {
      id v55 = +[UIViewPropertyAnimator _startTrackingAnimations];
    }
    uint64_t v56 = +[UIViewPropertyAnimator _currentTrackedAnimationsUUID];
    int v57 = !v54;
    uint64_t v58 = *(void *)(a1 + 32);
    v59 = *(void **)(v58 + 56);
    *(void *)(v58 + 56) = v56;
  }
  else
  {
    uint64_t v60 = +[UIView _startAnimationTracking];
    uint64_t v61 = *(void *)(a1 + 32);
    v59 = *(void **)(v61 + 56);
    *(void *)(v61 + 56) = v60;
    int v57 = 1;
  }

  v62 = [*(id *)(a1 + 32) _computeToEndFrameForCurrentTransition];
  double v63 = v62[2]();
  double v65 = v64;
  double v67 = v66;
  double v69 = v68;

  objc_msgSend(*(id *)(a1 + 40), "_setToEndFrame:", v63, v65, v67, v69);
  objc_msgSend(*(id *)(a1 + 40), "_setToStartFrame:", *v45, v45[1], v45[2], v45[3]);
  [*(id *)(*(void *)(a1 + 32) + 160) transitionDuration:*(void *)(a1 + 40)];
  objc_msgSend(*(id *)(a1 + 40), "_setDuration:");
  if (*(unsigned char *)(a1 + 104)) {
    [*(id *)(a1 + 32) transitionDidStart];
  }
  v70 = *(void **)(*(void *)(a1 + 32) + 120);
  int v71 = *(unsigned __int8 *)(a1 + 106);
  v72 = [*(id *)(a1 + 40) _transitionCoordinator];
  [v70 runAlongsidePresentation:v71 != 0 transitionCoordinator:v72];

  v73 = *(void **)(*(void *)(a1 + 32) + 120);
  int v74 = *(unsigned __int8 *)(a1 + 106);
  v75 = [*(id *)(a1 + 40) _transitionCoordinator];
  v76 = [*(id *)(a1 + 40) fromViewController];
  v77 = [v76 _window];
  v78 = [*(id *)(a1 + 40) toViewController];
  v79 = [v78 _window];
  [v73 runAlongsidePresentation:v74 != 0 transitionCoordinator:v75 fromViewControllerWindow:v77 toViewControllerWindow:v79];

  v80 = [_UIViewControllerTransitionRequest alloc];
  uint64_t v81 = *(void *)(a1 + 40);
  v82 = [*(id *)(a1 + 32) _currentTransitionController];
  v83 = [*(id *)(a1 + 32) _currentInteractionController];
  v84 = -[_UIViewControllerTransitionRequest initWithTransitionContext:animator:interactor:interactiveUpdateHandler:keyboardShouldAnimateAlongsideForInteractiveTransitions:keyboardAnimationStyle:pinningInputViewsResponder:extraPinningInputViewsBlock:handoffData:](v80, "initWithTransitionContext:animator:interactor:interactiveUpdateHandler:keyboardShouldAnimateAlongsideForInteractiveTransitions:keyboardAnimationStyle:pinningInputViewsResponder:extraPinningInputViewsBlock:handoffData:", v81, v82, v83, &__block_literal_global_125, [*(id *)(a1 + 32) _keyboardShouldAnimateAlongsideForInteractiveTransitions], v103, *(void *)(a1 + 64), 0, *(void *)(a1 + 80));

  _UIViewControllerTransitioningRunCustomTransitionWithRequest(v84);
  if (v57)
  {
    if (+[UIViewPropertyAnimator _trackingAnimationsCurrentlyEnabled])
    {
      +[UIViewPropertyAnimator _finishTrackingAnimations];
    }
    else
    {
      +[UIView _finishAnimationTracking];
    }
  }
  uint64_t v85 = [*(id *)(a1 + 40) _state];
  v86 = [*(id *)(a1 + 40) _animator];
  BOOL v87 = v86 == 0;

  if (!v87) {
    [*(id *)(a1 + 40) _setTransitionIsInFlight:1];
  }
  if (v85 == 3)
  {
    v88 = [*(id *)(a1 + 40) _interactor];
    if (os_variant_has_internal_diagnostics())
    {
      if (!v88)
      {
        v97 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v97, OS_LOG_TYPE_FAULT, "Got a deferred interactive finish when we don't have an interactor", buf, 2u);
        }
      }
    }
    else if (!v88)
    {
      v99 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FF78) + 8);
      if (os_log_type_enabled(v99, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v99, OS_LOG_TYPE_ERROR, "Got a deferred interactive finish when we don't have an interactor", buf, 2u);
      }
    }
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v92 = v88;
    if ((isKindOfClass & 1) == 0) {
      v92 = *(void **)(a1 + 40);
    }
    [v92 finishInteractiveTransition];
    goto LABEL_63;
  }
  if (v85 == 2)
  {
    v88 = [*(id *)(a1 + 40) _interactor];
    if (os_variant_has_internal_diagnostics())
    {
      if (!v88)
      {
        v96 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1853B0000, v96, OS_LOG_TYPE_FAULT, "Got a deferred interactive cancellation when we don't have an interactor", buf, 2u);
        }
      }
    }
    else if (!v88)
    {
      v98 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FF70) + 8);
      if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v98, OS_LOG_TYPE_ERROR, "Got a deferred interactive cancellation when we don't have an interactor", buf, 2u);
      }
    }
    objc_opt_class();
    char v89 = objc_opt_isKindOfClass();
    v90 = v88;
    if ((v89 & 1) == 0) {
      v90 = *(void **)(a1 + 40);
    }
    [v90 cancelInteractiveTransition];
LABEL_63:
  }
  _UIRestorePreviousFallbackEnvironment(v102);

  objc_destroyWeak(v111);
}

- (BOOL)_shouldCallAppearanceCallbacksFor:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPresentationController *)self presentedViewController];

  if (v5 == v4)
  {
    BOOL v8 = [(UIPresentationController *)self _shouldDisableAppearanceCallbacksForPresentedViewController];
LABEL_6:
    BOOL v7 = !v8;
    goto LABEL_7;
  }
  id v6 = [(UIPresentationController *)self presentingViewController];

  if (v6 == v4)
  {
    BOOL v8 = [(UIPresentationController *)self _shouldDisablePresentersAppearanceCallbacks];
    goto LABEL_6;
  }
  BOOL v7 = 0;
LABEL_7:

  return v7;
}

- (id)_transitionViewForCurrentTransition
{
  return self->__transitionViewForCurrentTransition;
}

- (id)_toViewForCurrentTransition
{
  return self->__toViewForCurrentTransition;
}

- (id)_fromViewForCurrentTransition
{
  return self->__fromViewForCurrentTransition;
}

- (BOOL)_shouldDisablePresentersAppearanceCallbacks
{
  return ![(UIPresentationController *)self shouldRemovePresentersView];
}

- (BOOL)_shouldGrabPresentersView
{
  char v3 = [(UIPresentationController *)self shouldRemovePresentersView];
  if (dyld_program_sdk_at_least())
  {
    id v4 = [(UIPresentationController *)self presentingViewController];
    id v5 = [v4 _existingPresentationControllerImmediate:1 effective:1 includesRoot:1];

    if (v5 && [(UIPresentationController *)self shouldPresentInFullscreen])
    {
      int v6 = [v5 _mayChildGrabPresentedViewControllerView];
      if (v6) {
        LOBYTE(v6) = [v5 shouldPresentInFullscreen];
      }
      v3 &= v6;
    }
  }
  return v3;
}

- (UIViewController)presentingViewController
{
  return self->_presentingViewController;
}

- (BOOL)shouldRemovePresentersView
{
  return 0;
}

- (_UIViewControllerTransitionContext)_transitionContext
{
  v2 = [(UIPresentationController *)self _currentTransitionController];
  if (v2)
  {
    char v3 = +[_UIViewControllerTransitionContext _associatedTransitionContextForAnimationController:v2];
  }
  else
  {
    char v3 = 0;
  }

  return (_UIViewControllerTransitionContext *)v3;
}

- (UIViewControllerAnimatedTransitioning)_currentTransitionController
{
  return self->_currentTransitionController;
}

void __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _unlockEnvironment:*(void *)(a1 + 32)];
  [WeakRetained _unlockEnvironment:*(void *)(a1 + 40)];
}

id __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained dismissing])
  {
    if ([WeakRetained _shouldGrabPresentersView]) {
      char v3 = *(void **)(a1 + 32);
    }
    else {
      char v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = [WeakRetained presentedView];
  }
  id v5 = v4;

  return v5;
}

id __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained presenting])
  {
    if ([WeakRetained _shouldGrabPresentersView]) {
      char v3 = *(void **)(a1 + 32);
    }
    else {
      char v3 = 0;
    }
    id v4 = v3;
  }
  else
  {
    id v4 = [WeakRetained presentedView];
  }
  id v5 = v4;

  return v5;
}

- (BOOL)_keyboardShouldAnimateAlongsideForInteractiveTransitions
{
  return 1;
}

- (id)_computeToEndFrameForCurrentTransition
{
  return self->__computeToEndFrameForCurrentTransition;
}

- (BOOL)_shouldDisableAppearanceCallbacksForPresentedViewController
{
  return 0;
}

uint64_t __48__UIPresentationController_transitionDidFinish___block_invoke_2(uint64_t a1)
{
  return [(id)UIApp _performAfterCATransactionCommitsWithLegacyRunloopObserverBasedTiming:*(unsigned __int8 *)(a1 + 40) block:*(void *)(a1 + 32)];
}

- (id)_parentPresentationController
{
  return [(UIPresentationController *)self _parentPresentationControllerImmediate:0];
}

- (id)_parentPresentationControllerImmediate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIPresentationController *)self presentingViewController];
  id v5 = [v4 _existingPresentationControllerImmediate:v3 effective:1 includesRoot:1];

  return v5;
}

- (UIPresentationController)initWithPresentedViewController:(UIViewController *)presentedViewController presentingViewController:(UIViewController *)presentingViewController
{
  int v6 = presentedViewController;
  BOOL v7 = presentingViewController;
  v16.receiver = self;
  v16.super_class = (Class)UIPresentationController;
  BOOL v8 = [(UIPresentationController *)&v16 init];
  int v9 = v8;
  if (v8)
  {
    [(UIPresentationController *)v8 _populateInitialTraitCollection];
    [(UIPresentationController *)v9 _setPresentingViewController:v7];
    [(UIPresentationController *)v9 _setPresentedViewController:v6];
    uint64_t v10 = +[_UIPresentationControllerDefaultVisualStyleProvider sharedInstance];
    uint64_t v11 = [(UIPresentationController *)v9 _createVisualStyleForProvider:v10];
    visualStyle = v9->_visualStyle;
    v9->_visualStyle = (_UIPresentationControllerVisualStyle *)v11;

    v9->_isDisconnectedRoot = 0;
    uint64_t v13 = __systemLayoutFittingSizeCallbackIMP;
    if (!__systemLayoutFittingSizeCallbackIMP)
    {
      uint64_t v13 = +[UIPresentationController instanceMethodForSelector:sel_systemLayoutFittingSizeDidChangeForChildContentContainer_];
      __systemLayoutFittingSizeCallbackIMP = v13;
    }
    if (v13 != [(id)objc_opt_class() instanceMethodForSelector:sel_systemLayoutFittingSizeDidChangeForChildContentContainer_])v9->_monitorsSystemLayoutFittingSize = 1; {
    id v14 = v9;
    }
  }

  return v9;
}

- (void)_setPresentingViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  if (self->_presentingViewController != v5)
  {
    int v6 = v5;
    objc_storeStrong((id *)&self->_presentingViewController, a3);
    [(UIPresentationController *)self _updateTraitsIfNecessary];
    id v5 = v6;
  }
}

- (void)_setPresentedViewController:(id)a3
{
  id v5 = a3;
  id v6 = v5;
  if (self->__presentedViewControllerStoredWeakly) {
    objc_storeWeak((id *)&self->_weakPresentedViewController, v5);
  }
  else {
    objc_storeStrong((id *)&self->_presentedViewController, a3);
  }
}

- (void)_populateInitialTraitCollection
{
  if (dyld_program_sdk_at_least())
  {
    +[UITraitCollection _fallbackTraitCollection]();
    BOOL v3 = (UITraitCollection *)objc_claimAutoreleasedReturnValue();
    lastNotifiedTraitCollection = self->_lastNotifiedTraitCollection;
    self->_lastNotifiedTraitCollection = v3;
  }
  self->_traitInitializationComplete = 1;
}

- (BOOL)_transitioningTo
{
  return self->_state == 5;
}

- (UIViewControllerTransitionCoordinator)_definiteTransitionCoordinator
{
  BOOL v3 = [(UIPresentationController *)self _transitionCoordinator];
  if (!v3)
  {
    id v4 = [_UIViewControllerImmediateAnimationTransitionCoordinator alloc];
    id v5 = [(UIPresentationController *)self containerView];
    BOOL v3 = [(_UIViewControllerImmediateAnimationTransitionCoordinator *)v4 initWithContainerView:v5];
  }
  return (UIViewControllerTransitionCoordinator *)v3;
}

- (void)_traitOverridesDidChange:(id)a3
{
  id v4 = a3;
  if (self->_traitInitializationComplete)
  {
    id v5 = v4;
    if (_UIPresentationControllersInheritTraitsFromViewHierarchy()) {
      [(UIPresentationController *)self _updateTraitsIfNecessary];
    }
    else {
      [(UIPresentationController *)self _compatibleUpdateTraitsIfNecessary];
    }
    id v4 = v5;
  }
}

- (void)_updateTraitsIfNecessary
{
}

- (void)_cleanup
{
  self->_state = 0;
  [(UIPresentationController *)self _setCurrentPresentationSuperview:0];
  [(UIPresentationController *)self _setPresentationView:0];
  [(UIPresentationController *)self set_transitionViewForCurrentTransition:0];
  [(UIPresentationController *)self _setPendingFocusEnvironmentUnlock:0];
  [(UIPresentationController *)self set_computeToEndFrameForCurrentTransition:0];
  [(UIPresentationController *)self set_currentTransitionDidComplete:0];
  [(UIPresentationController *)self set_fromViewForCurrentTransition:0];
  [(UIPresentationController *)self set_toViewForCurrentTransition:0];
  [(UIPresentationController *)self set_customFromViewForCurrentTransition:0];
  [(UIPresentationController *)self set_customToViewForCurrentTransition:0];
  [(UIPresentationController *)self _setAdaptiveTransitionContext:0];
  [(UIPresentationController *)self _setAdaptiveTransitionCoordinator:0];
  self->_didUpdateLayoutForStatusBarAndInterfaceOrientation = 0;
}

- (void)_presentWithAnimationController:(id)a3 inWindow:(id)a4 interactionController:(id)a5 animated:(BOOL)a6 handoffData:(id)a7
{
  BOOL v33 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v31 = a4;
  id v13 = a5;
  id v14 = a7;
  uint64_t v15 = objc_opt_class();
  if (v15 == objc_opt_class()) {
    [v12 setDelegate:self];
  }
  -[UIPresentationController _setCurrentTransitionController:](self, "_setCurrentTransitionController:", v12, v31);
  [(UIPresentationController *)self _setCurrentInteractionController:v13];
  if (self->_state)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v30 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        double v35 = self;
        _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "Trying to present the presentation controller while transitioning already. (%@)", buf, 0xCu);
      }
    }
    else
    {
      __int16 v28 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_presentWithAnimationController_inWindow_interactionController_animated_handoffData____s_category)+ 8);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        double v35 = self;
        _os_log_impl(&dword_1853B0000, v28, OS_LOG_TYPE_ERROR, "Trying to present the presentation controller while transitioning already. (%@)", buf, 0xCu);
      }
    }
  }
  self->_state = 1;
  if ([(UIPresentationController *)self shouldPresentInFullscreen]) {
    [(UIPresentationController *)self _fullscreenPresentationSuperview];
  }
  else {
  objc_super v16 = [(UIPresentationController *)self _currentContextPresentationSuperview];
  }
  if ([(UIPresentationController *)self _shouldRespectDefinesPresentationContext])
  {
    id v17 = [(UIPresentationController *)self presentingViewController];
    if (v17)
    {
      do
      {
        if ([v17 definesPresentationContext]) {
          break;
        }
        uint64_t v18 = [v17 parentViewController];

        id v17 = (void *)v18;
      }
      while (v18);
    }
    if ([v17 definesPresentationContext])
    {
      uint64_t v19 = [v17 view];
      v20 = [v19 superview];

      if (!v20)
      {
        int v29 = [MEMORY[0x1E4F28B00] currentHandler];
        [v29 handleFailureInMethod:a2 object:self file:@"UIPresentationController.m" lineNumber:800 description:@"The view defining presentation context doesn't have a superview"];
      }
      v21 = [v17 view];
      uint64_t v22 = [v21 superview];

      objc_super v16 = (void *)v22;
    }
  }
  [(UIPresentationController *)self _setCurrentPresentationSuperview:v16];
  uint64_t v23 = [(UIPresentationController *)self presentingViewController];
  v24 = [v23 _existingView];
  v25 = [v24 window];
  uint64_t v26 = [(UIPresentationController *)self presentedViewController];
  v27 = [(UIPresentationController *)self presentingViewController];
  [(UIPresentationController *)self _adjustOrientationIfNecessaryInWindow:v25 forViewController:v26 preservingViewController:v27];

  [(UIPresentationController *)self _initViewHierarchyForPresentationSuperview:v16 inWindow:v32];
  [(UIPresentationController *)self runTransitionForCurrentStateAnimated:v33 handoffData:v14];
}

- (void)transitionDidFinish:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(UIPresentationController *)self presenting];
  BOOL v6 = [(UIPresentationController *)self dismissing];
  BOOL v7 = [(UIPresentationController *)self presentingViewController];
  uint64_t v8 = [(UIPresentationController *)self presentedViewController];
  if (v5) {
    int v9 = (void *)v8;
  }
  else {
    int v9 = v7;
  }
  BOOL v33 = (void *)v8;
  if (v5) {
    uint64_t v10 = v7;
  }
  else {
    uint64_t v10 = (void *)v8;
  }
  id v11 = v9;
  id v12 = v10;
  id v13 = [(UIPresentationController *)self _transitionContext];
  uint64_t v14 = [(UIPresentationController *)self _currentTransitionDidComplete];
  uint64_t v31 = v14;
  if (v14)
  {
    (*(void (**)(uint64_t, BOOL))(v14 + 16))(v14, v3);
    if (!v3) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
  if (os_variant_has_internal_diagnostics())
  {
    double v30 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v45 = self;
      __int16 v46 = 2112;
      double v47 = v33;
      __int16 v48 = 2112;
      double v49 = v7;
      _os_log_fault_impl(&dword_1853B0000, v30, OS_LOG_TYPE_FAULT, "self._currentTransitionDidComplete is nil! for self: %@; presentedViewController: %@; presentingViewController: %@",
        buf,
        0x20u);
    }

    if (v3) {
      goto LABEL_14;
    }
  }
  else
  {
    uint64_t v15 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_MergedGlobals_1002) + 8);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v45 = self;
      __int16 v46 = 2112;
      double v47 = v33;
      __int16 v48 = 2112;
      double v49 = v7;
      _os_log_impl(&dword_1853B0000, v15, OS_LOG_TYPE_ERROR, "self._currentTransitionDidComplete is nil! for self: %@; presentedViewController: %@; presentingViewController: %@",
        buf,
        0x20u);
    }
    if (v3)
    {
LABEL_14:
      if (v5)
      {
        objc_super v16 = objc_msgSend(v33, "view", v31);
        id v17 = [v16 superview];
        [(UIPresentationController *)self _setPresentationView:v17];
      }
      else if (v6)
      {
        -[UIPresentationController _setPresentationView:](self, "_setPresentationView:", 0, v31);
      }
    }
  }
LABEL_18:
  objc_msgSend(v13, "_setContainerView:", 0, v31);
  [(UIPresentationController *)self _setCurrentInteractionController:0];
  uint64_t v18 = [v7 _completionBlock];
  if (v7)
  {
    if (v3)
    {
      if (v5) {
        [v7 _didFinishPresentTransition];
      }
      else {
        [v7 _didFinishDismissTransition];
      }
    }
    else if (v5)
    {
      [v7 _didCancelPresentTransition:v13];
    }
    else
    {
      [v7 _didCancelDismissTransition:v13];
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIPresentationController_transitionDidFinish___block_invoke;
  aBlock[3] = &unk_1E52E7BD0;
  aBlock[4] = self;
  id v19 = v11;
  id v38 = v19;
  id v20 = v7;
  id v39 = v20;
  id v21 = v13;
  id v40 = v21;
  BOOL v42 = v3;
  id v22 = v12;
  id v41 = v22;
  BOOL v43 = v5;
  uint64_t v23 = (void (**)(void))_Block_copy(aBlock);
  if (([(id)objc_opt_class() _allowsDeferredTransitions] & 1) != 0
    || !+[UIApplication _isCertainCheckpointInAppLaunchReached])
  {
    v23[2](v23);
    if (!v18) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
  char v24 = dyld_program_sdk_at_least();
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIPresentationController_transitionDidFinish___block_invoke_2;
  block[3] = &unk_1E52E7D78;
  char v36 = v24 ^ 1;
  double v35 = v23;
  dispatch_async(MEMORY[0x1E4F14428], block);

  if (v18) {
LABEL_31:
  }
    v18[2](v18, v3);
LABEL_32:
  [(UIPresentationController *)self executeTransitionCompletionBlock];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v25 = 0;
    if ([(UIPresentationController *)self dismissing] && v3) {
      goto LABEL_43;
    }
LABEL_38:
    if (![(UIPresentationController *)self presenting] || v3) {
      goto LABEL_43;
    }
    goto LABEL_40;
  }
  v25 = [(UIPresentationController *)self forcePresentationControllerDelegate];
  if (![(UIPresentationController *)self dismissing] || !v3) {
    goto LABEL_38;
  }
LABEL_40:
  if (v25 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v25 forcePresentationControllerDidDismiss:self];
  }
LABEL_43:
  [(UIPresentationController *)self _setCurrentTransitionController:0];
  if ([(UIPresentationController *)self dismissing] && v3
    || [(UIPresentationController *)self presenting] && !v3)
  {
    [(UIPresentationController *)self _cleanup];
  }
  else
  {
    self->_state = 2;
    [v22 setNeedsFocusUpdate];
    [(UIPresentationController *)self setNeedsFocusUpdate];
  }
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIPresentationController", &qword_1EB25FF40);
  v27 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v28 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v29 = v28;
    if (os_signpost_enabled(v27))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v27, OS_SIGNPOST_INTERVAL_END, v29, "ModalTransition", " enableTelemetry=YES ", buf, 2u);
    }
  }
}

- (void)_setCurrentTransitionController:(id)a3
{
}

- (void)_setCurrentInteractionController:(id)a3
{
}

- (UIViewControllerTransitionCoordinator)_transitionCoordinator
{
  v2 = [(UIPresentationController *)self _transitionContext];
  BOOL v3 = [v2 _transitionCoordinator];

  return (UIViewControllerTransitionCoordinator *)v3;
}

- (void)_setPresentationView:(id)a3
{
}

- (id)_currentTransitionDidComplete
{
  return self->__currentTransitionDidComplete;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  int v3 = dyld_program_sdk_at_least();
  if (v3) {
    LOBYTE(v3) = ![(UIPresentationController *)self shouldPresentInFullscreen];
  }
  return v3;
}

- (BOOL)shouldPresentInFullscreen
{
  return 1;
}

- (void)_setCurrentPresentationSuperview:(id)a3
{
}

- (void)_initViewHierarchyForPresentationSuperview:(id)a3 inWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(UIPresentationController *)self presentingViewController];
  int v9 = [v8 view];

  uint64_t v10 = [v9 superview];
  id v11 = [v10 subviews];
  v25 = (void *)[v11 indexOfObjectIdenticalTo:v9];

  id v12 = [UITransitionView alloc];
  char v24 = v6;
  [(UIPresentationController *)self _frameForTransitionViewInPresentationSuperview:v6 inWindow:v7];
  id v13 = -[UITransitionView initWithFrame:](v12, "initWithFrame:");
  [(UITransitionView *)v13 setDelegate:self];
  [(UIView *)v13 setAutoresizingMask:18];
  [(UITransitionView *)v13 setIgnoreDirectTouchEvents:[(UIPresentationController *)self _containerIgnoresDirectTouchEvents]];
  [(UIView *)v13 setClipsToBounds:0];
  [(UIView *)v13 _setCanBeParentTraitEnvironment:0];
  uint64_t v23 = v7;
  objc_initWeak(location, v7);
  objc_initWeak(&from, self);
  objc_initWeak(&v32, v10);
  uint64_t v14 = NSString;
  uint64_t v15 = [(UIPresentationController *)self description];
  objc_super v16 = [(UIPresentationController *)self presentedViewController];
  id v17 = [v16 description];
  uint64_t v18 = [(UIPresentationController *)self presentingViewController];
  id v19 = [v18 description];
  id v20 = [v14 stringWithFormat:@"presentationController : %@ presentedViewController : %@ presentingViewController : %@", v15, v17, v19];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  _OWORD v26[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke;
  v26[3] = &unk_1E52E7D30;
  objc_copyWeak(&v29, &from);
  objc_copyWeak(&v30, &v32);
  id v21 = v13;
  v27 = v21;
  id v22 = v20;
  id v28 = v22;
  v31[1] = v25;
  objc_copyWeak(v31, location);
  [(UIPresentationController *)self set_transitionViewForCurrentTransition:v26];
  objc_destroyWeak(v31);

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v29);

  objc_destroyWeak(&v32);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

id __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke(uint64_t a1)
{
  uint64_t v114 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v86 = a1;
  id from = (id *)(a1 + 56);
  id v79 = objc_loadWeakRetained((id *)(a1 + 56));
  id v4 = [WeakRetained presentingViewController];
  BOOL v5 = [WeakRetained presentedViewController];
  uint64_t v85 = [v4 view];
  v78 = [v5 view];
  if ([WeakRetained presenting])
  {
    int v6 = 1;
    id v7 = v5;
    uint64_t v8 = v4;
  }
  else
  {
    int v9 = [WeakRetained _transitioningTo];
    int v6 = v9;
    if (v9) {
      id v7 = v5;
    }
    else {
      id v7 = v4;
    }
    if (v9) {
      uint64_t v8 = v4;
    }
    else {
      uint64_t v8 = v5;
    }
  }
  id v83 = v7;
  id v77 = v8;
  v82 = [v77 view];
  uint64_t v81 = [v83 view];
  [WeakRetained _setContainerView:*(void *)(v86 + 32)];
  if ([WeakRetained dismissing]
    && [WeakRetained shouldRemovePresentersView])
  {
    int v10 = [WeakRetained _shouldGrabPresentersView] ^ 1;
  }
  else
  {
    int v10 = 0;
  }
  if (([WeakRetained _transitioningFrom] & 1) != 0 || v10)
  {
    id v11 = [WeakRetained _parentPresentationController];
    int has_internal_diagnostics = os_variant_has_internal_diagnostics();
    id v13 = [WeakRetained _computeToEndFrameForCurrentTransition];

    if (has_internal_diagnostics)
    {
      if (!v13)
      {
        int v71 = __UIFaultDebugAssertLog();
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
        {
          uint64_t v74 = *(void *)(v86 + 40);
          *(_DWORD *)location = 138412546;
          *(void *)&location[4] = WeakRetained;
          __int16 v112 = 2112;
          uint64_t v113 = v74;
          _os_log_fault_impl(&dword_1853B0000, v71, OS_LOG_TYPE_FAULT, "The _computeToEndFrameForCurrentTransition block is nil inside the _transitionViewForCurrentTransition block, value of outerStrongSelf currently : %@. This most likely indicates that an adaptation is happening after a transtion cleared out _computeToEndFrameForCurrentTransition. Captured debug information outside block: %@", location, 0x16u);
        }
      }
    }
    else if (!v13)
    {
      v72 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &UIPresentationControllerInstallGlassInDropShadowViewKey_block_invoke_3___s_category)+ 8);
      if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
      {
        uint64_t v73 = *(void *)(v86 + 40);
        *(_DWORD *)location = 138412546;
        *(void *)&location[4] = WeakRetained;
        __int16 v112 = 2112;
        uint64_t v113 = v73;
        _os_log_impl(&dword_1853B0000, v72, OS_LOG_TYPE_ERROR, "The _computeToEndFrameForCurrentTransition block is nil inside the _transitionViewForCurrentTransition block, value of outerStrongSelf currently : %@. This most likely indicates that an adaptation is happening after a transtion cleared out _computeToEndFrameForCurrentTransition. Captured debug information outside block: %@", location, 0x16u);
      }
    }
    uint64_t v14 = [WeakRetained _computeToEndFrameForCurrentTransition];
    BOOL v15 = v14 == 0;

    if (!v15)
    {
      objc_super v16 = [WeakRetained _computeToEndFrameForCurrentTransition];
      double v17 = v16[2]();
      _setFrameIgnoringLayerTransformOnOrAfterYukon(v85, v17, v18, v19, v20);
    }
    if (v11)
    {
      id v21 = [v11 _presentationView];
      [WeakRetained _transplantView:v85 toSuperview:v21];

      [v11 _frameOfPresentedViewControllerViewInSuperview];
      _setFrameIgnoringLayerTransformOnOrAfterYukon(v85, v22, v23, v24, v25);
    }
    else
    {
      [WeakRetained _transplantView:v85 toSuperview:v79 atIndex:*(void *)(v86 + 72)];
    }
    if ([WeakRetained _transitioningFrom])
    {
      uint64_t v26 = [WeakRetained _childPresentationController];
      if (v26)
      {
        v27 = [WeakRetained _childPresentationController];
        id v28 = [v27 containerView];
      }
      else
      {
        id v28 = v78;
      }

      id v29 = [WeakRetained _presentationView];
      id v30 = [v28 snapshotViewAfterScreenUpdates:0];
      v107[0] = MEMORY[0x1E4F143A8];
      v107[1] = 3221225472;
      v107[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_137;
      v107[3] = &unk_1E52DCB30;
      id v80 = v30;
      id v108 = v80;
      id v109 = v28;
      id v110 = v29;
      id v31 = v29;
      id v32 = v28;
      +[UIView performWithoutAnimation:v107];
      [v31 addSubview:v80];
    }
    else
    {
      id v80 = 0;
    }
  }
  else
  {
    id v80 = 0;
  }
  if (v6)
  {
    BOOL v33 = [WeakRetained containerView];
    [v33 _setPresentationControllerToNotifyOnLayoutSubviews:WeakRetained];

    double v34 = [WeakRetained _currentPresentationSuperview];
    double v35 = [*(id *)(v86 + 32) superview];
    BOOL v36 = v35 == 0;

    if (v36)
    {
      id v37 = objc_loadWeakRetained((id *)(v86 + 64));
      [WeakRetained _frameForTransitionViewInPresentationSuperview:v34 inWindow:v37];
      double v39 = v38;
      double v41 = v40;
      double v43 = v42;
      double v45 = v44;

      _setFrameIgnoringLayerTransformOnOrAfterYukon(*(void **)(v86 + 32), v39, v41, v43, v45);
    }
    __int16 v46 = [v85 superview];
    BOOL v47 = v46 == v34;

    if (v47)
    {
      [v34 insertSubview:*(void *)(v86 + 32) aboveSubview:v85];
    }
    else
    {
      __int16 v48 = [WeakRetained _childPresentationController];
      if (!v48) {
        goto LABEL_36;
      }
      double v49 = [WeakRetained _childPresentationController];
      uint64_t v50 = [v49 containerView];
      v51 = [v50 superview];
      BOOL v52 = v51 == v34;

      if (v52)
      {
        uint64_t v53 = *(void *)(v86 + 32);
        BOOL v54 = [WeakRetained _childPresentationController];
        id v55 = [v54 containerView];
        [v34 insertSubview:v53 belowSubview:v55];
      }
      else
      {
LABEL_36:
        [v34 addSubview:*(void *)(v86 + 32)];
      }
    }
    if ([WeakRetained presenting]
      && [WeakRetained _shouldGrabPresentersView])
    {
      [WeakRetained _transplantView:v85 toSuperview:*(void *)(v86 + 32)];
    }
  }
  v104[0] = MEMORY[0x1E4F143A8];
  v104[1] = 3221225472;
  v104[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_2;
  v104[3] = &unk_1E52E7CB8;
  objc_copyWeak(&v105, v2);
  objc_copyWeak(&v106, from);
  objc_msgSend(WeakRetained, "set_computeToEndFrameForCurrentTransition:", v104);
  uint64_t v56 = [WeakRetained _customFromViewForCurrentTransition];

  if (v56)
  {
    int v57 = [WeakRetained _customFromViewForCurrentTransition];
    objc_msgSend(WeakRetained, "set_fromViewForCurrentTransition:", v57);
  }
  else
  {
    v101[0] = MEMORY[0x1E4F143A8];
    v101[1] = 3221225472;
    v101[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_3;
    v101[3] = &unk_1E52E7CE0;
    objc_copyWeak(&v103, v2);
    id v102 = v82;
    objc_msgSend(WeakRetained, "set_fromViewForCurrentTransition:", v101);

    objc_destroyWeak(&v103);
  }
  uint64_t v58 = [WeakRetained _customToViewForCurrentTransition];

  if (v58)
  {
    v59 = [WeakRetained _customToViewForCurrentTransition];
    objc_msgSend(WeakRetained, "set_toViewForCurrentTransition:", v59);
  }
  else
  {
    v98[0] = MEMORY[0x1E4F143A8];
    v98[1] = 3221225472;
    v98[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_4;
    v98[3] = &unk_1E52E7CE0;
    objc_copyWeak(&v100, v2);
    id v99 = v81;
    objc_msgSend(WeakRetained, "set_toViewForCurrentTransition:", v98);

    objc_destroyWeak(&v100);
  }
  uint64_t v60 = [v4 _focusSystem];
  [v60 _lockEnvironment:v5];
  [v60 _lockEnvironment:v4];
  objc_initWeak((id *)location, v60);
  v94[0] = MEMORY[0x1E4F143A8];
  v94[1] = 3221225472;
  v94[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_5;
  v94[3] = &unk_1E52DF708;
  objc_copyWeak(&v97, (id *)location);
  id v76 = v5;
  id v95 = v76;
  id v75 = v4;
  id v96 = v75;
  [WeakRetained _setPendingFocusEnvironmentUnlock:v94];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_6;
  v87[3] = &unk_1E52E7D08;
  objc_copyWeak(&v92, v2);
  objc_copyWeak(v93, from);
  id v61 = v80;
  id v88 = v61;
  id v62 = v78;
  id v89 = v62;
  id v63 = v85;
  double v64 = *(void **)(v86 + 72);
  id v90 = v63;
  v93[1] = v64;
  id v91 = *(id *)(v86 + 32);
  objc_msgSend(WeakRetained, "set_currentTransitionDidComplete:", v87);
  if (![WeakRetained presenting])
  {
    if ([WeakRetained dismissing])
    {
      [WeakRetained dismissalTransitionWillBegin];
      [WeakRetained _sendPresentationControllerNotification:@"UIPresentationControllerDismissalTransitionWillBeginNotification" userInfo:0];
    }
    else
    {
      if (![WeakRetained _transitioningFrom])
      {
        if (![WeakRetained _transitioningTo]) {
          goto LABEL_58;
        }
        [WeakRetained _transitionToWillBegin];
        goto LABEL_51;
      }
      [WeakRetained _transitionFromWillBegin];
    }
    uint64_t v65 = 0;
    goto LABEL_57;
  }
  [WeakRetained presentationTransitionWillBegin];
  [WeakRetained _sendPresentationControllerNotification:@"UIPresentationControllerPresentationTransitionWillBeginNotification" userInfo:0];
LABEL_51:
  uint64_t v65 = 1;
LABEL_57:
  [WeakRetained _beginOcclusionIfNecessary:v65];
LABEL_58:
  if ([WeakRetained _shouldContinueTouchesOnTargetViewController]
    && [WeakRetained presenting])
  {
    double v66 = [WeakRetained _customViewForTouchContinuation];
    double v67 = [v66 window];

    if (v67)
    {
      double v68 = [(id)UIApp _gestureEnvironment];
      -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v68, v66);
    }
  }
  id v69 = *(id *)(v86 + 32);

  objc_destroyWeak(v93);
  objc_destroyWeak(&v92);

  objc_destroyWeak(&v97);
  objc_destroyWeak((id *)location);

  objc_destroyWeak(&v106);
  objc_destroyWeak(&v105);

  return v69;
}

- (void)_setPendingFocusEnvironmentUnlock:(id)a3
{
  id aBlock = a3;
  pendingFocusEnvironmentUnlock = (void (**)(void))self->__pendingFocusEnvironmentUnlock;
  if (pendingFocusEnvironmentUnlock) {
    pendingFocusEnvironmentUnlock[2]();
  }
  BOOL v5 = _Block_copy(aBlock);
  id v6 = self->__pendingFocusEnvironmentUnlock;
  self->__pendingFocusEnvironmentUnlock = v5;
}

- (void)_sendPresentationControllerNotification:(id)a3 userInfo:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F28EB8];
  id v7 = a4;
  id v8 = a3;
  id v10 = [v6 defaultCenter];
  int v9 = [(UIPresentationController *)self presentedViewController];
  [v10 postNotificationName:v8 object:v9 userInfo:v7];
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3 inWindow:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  objc_super v16 = [(UIPresentationController *)self presentedViewController];
  if ([v16 _preferredStatusBarVisibility] != 1)
  {
    double v17 = v7;
    if (!v7)
    {
      double v17 = [v6 window];
    }
    double v18 = __UIStatusBarManagerForWindow(v17);
    [v18 isStatusBarHidden];

    if (!v7) {
  }
    }

  id v19 = v7;
  double v20 = v9;
  double v21 = v11;
  double v22 = v13;
  double v23 = v15;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)set_currentTransitionDidComplete:(id)a3
{
}

- (void)set_computeToEndFrameForCurrentTransition:(id)a3
{
}

- (void)set_toViewForCurrentTransition:(id)a3
{
}

- (void)set_fromViewForCurrentTransition:(id)a3
{
}

- (void)_setContainerView:(id)a3
{
}

- (BOOL)_shouldContinueTouchesOnTargetViewController
{
  return self->_shouldContinueTouchesOnTargetViewController;
}

- (id)_customToViewForCurrentTransition
{
  return self->__customToViewForCurrentTransition;
}

- (id)_customFromViewForCurrentTransition
{
  return self->__customFromViewForCurrentTransition;
}

- (void)_beginOcclusionIfNecessary:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIPresentationController *)self _shouldOccludeDuringPresentation])
  {
    BOOL v5 = [(UIPresentationController *)self presentingViewController];
    id v6 = [v5 _transitionCoordinator];

    if (v6)
    {
      id v7 = [(UIPresentationController *)self presentingViewController];
      double v8 = [v7 view];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke;
      v11[3] = &unk_1E52E7B28;
      v11[4] = self;
      BOOL v12 = v3;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke_2;
      v9[3] = &unk_1E52E7B28;
      v9[4] = self;
      BOOL v10 = v3;
      [v6 animateAlongsideTransitionInView:v8 animation:v11 completion:v9];
    }
    else
    {
      [(UIPresentationController *)self _enableOcclusion:v3];
    }
  }
}

void __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_6(uint64_t a1, uint64_t a2)
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  id v5 = objc_loadWeakRetained((id *)(a1 + 72));
  if ([WeakRetained presenting])
  {
    [WeakRetained presentationTransitionDidEnd:a2];
    id v32 = @"UIPresentationControllerPresentationTransitionDidEndCompletedKey";
    id v6 = [NSNumber numberWithBool:a2];
    v33[0] = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v33 forKeys:&v32 count:1];
    double v8 = @"UIPresentationControllerPresentationTransitionDidEndNotification";
LABEL_5:
    [WeakRetained _sendPresentationControllerNotification:v8 userInfo:v7];

    goto LABEL_6;
  }
  if ([WeakRetained dismissing])
  {
    [WeakRetained dismissalTransitionDidEnd:a2];
    id v30 = @"UIPresentationControllerDismissalTransitionDidEndCompletedKey";
    id v6 = [NSNumber numberWithBool:a2];
    id v31 = v6;
    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];
    double v8 = @"UIPresentationControllerDismissalTransitionDidEndNotification";
    goto LABEL_5;
  }
  if ([WeakRetained _transitioningTo])
  {
    [WeakRetained _transitionToDidEnd];
  }
  else if ([WeakRetained _transitioningFrom])
  {
    [*(id *)(a1 + 32) removeFromSuperview];
    [WeakRetained _transitionFromDidEnd];
  }
LABEL_6:
  [WeakRetained _setPendingFocusEnvironmentUnlock:0];
  if ([WeakRetained dismissing] && (a2 & 1) != 0
    || [WeakRetained presenting] && (a2 & 1) == 0)
  {
    double v9 = [WeakRetained containerView];
    [v9 _setPresentationControllerToNotifyOnLayoutSubviews:0];

    [*(id *)(a1 + 40) removeFromSuperview];
    if ([WeakRetained _shouldGrabPresentersView])
    {
      BOOL v10 = [WeakRetained _parentPresentationController];
      if (v10
        && ([WeakRetained presentingViewController],
            double v11 = objc_claimAutoreleasedReturnValue(),
            [v10 presentedViewController],
            BOOL v12 = objc_claimAutoreleasedReturnValue(),
            v12,
            v11,
            v11 == v12))
      {
        uint64_t v17 = *(void *)(a1 + 48);
        double v18 = [v10 _presentationView];
        [WeakRetained _transplantView:v17 toSuperview:v18];

        char v19 = objc_opt_respondsToSelector();
        double v20 = *(void **)(a1 + 48);
        if (v19)
        {
          double v21 = [WeakRetained presentingViewController];
          [v10 _frameForChildContentContainer:v21];
          _setFrameIgnoringLayerTransformOnOrAfterYukon(v20, v22, v23, v24, v25);
        }
        else
        {
          [v10 _frameOfPresentedViewControllerViewInSuperview];
          _setFrameIgnoringLayerTransformOnOrAfterYukon(v20, v26, v27, v28, v29);
        }
      }
      else
      {
        [WeakRetained _transplantView:*(void *)(a1 + 48) toSuperview:v5 atIndex:*(void *)(a1 + 80)];
      }
    }
    [WeakRetained _releaseSnapshot];
    [*(id *)(a1 + 56) removeFromSuperview];
    [WeakRetained[23] removeFromSuperview];
    double v13 = [WeakRetained containerView];
    [v13 _setPresentationControllerToNotifyOnLayoutSubviews:0];

    [WeakRetained _setContainerView:0];
    [WeakRetained[17] removeFromSuperview];
    objc_msgSend(WeakRetained, "set_computeToEndFrameForCurrentTransition:", 0);
    objc_msgSend(WeakRetained, "set_currentTransitionDidComplete:", 0);
    goto LABEL_16;
  }
  if ([WeakRetained presenting])
  {
    if (!a2) {
      goto LABEL_28;
    }
LABEL_26:
    if ([WeakRetained shouldRemovePresentersView])
    {
      [*(id *)(a1 + 48) removeFromSuperview];
      goto LABEL_16;
    }
    goto LABEL_28;
  }
  if [WeakRetained _transitioningTo] && (a2) {
    goto LABEL_26;
  }
LABEL_28:
  if ([WeakRetained _transitioningFrom])
  {
    double v14 = [WeakRetained _presentationView];
    double v15 = *(void **)(a1 + 40);

    if (v14 != v15) {
      [WeakRetained[23] removeFromSuperview];
    }
    objc_super v16 = [WeakRetained containerView];
    [v16 _setPresentationControllerToNotifyOnLayoutSubviews:0];

    [WeakRetained[17] removeFromSuperview];
    [WeakRetained _setContainerView:0];
  }
LABEL_16:
}

- (void)set_transitionViewForCurrentTransition:(id)a3
{
}

- (UIView)_currentPresentationSuperview
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__currentPresentationSuperview);
  return (UIView *)WeakRetained;
}

- (id)_childPresentationController
{
  v2 = [(UIPresentationController *)self presentedViewController];
  BOOL v3 = [v2 _presentationController];

  return v3;
}

- (BOOL)_containerIgnoresDirectTouchEvents
{
  return self->_containerIgnoresDirectTouchEvents;
}

- (void)setNeedsFocusUpdate
{
  id v3 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v3 requestFocusUpdateToEnvironment:self];
}

+ (BOOL)_allowsDeferredTransitions
{
  return 1;
}

- (void)set_customToViewForCurrentTransition:(id)a3
{
}

- (void)set_customFromViewForCurrentTransition:(id)a3
{
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  p_windowSceneIgnoringEvents = &self->_windowSceneIgnoringEvents;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);

  if (WeakRetained)
  {
    id v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    id v7 = [(UIPresentationController *)self presentingViewController];
    double v8 = (objc_class *)objc_opt_class();
    class_getName(v8);

    double v9 = [(UIPresentationController *)self presentedViewController];
    BOOL v10 = (objc_class *)objc_opt_class();
    class_getName(v10);

    double v11 = objc_msgSend(NSString, "stringWithFormat:", @"Invalid state: deallocating presentation controller while still ignoring interaction events: <%s: %p>", Name, self);
    BOOL v12 = *(NSObject **)(__UILogGetCategoryCachedImpl("Presentation", &dealloc___s_category_3) + 8);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      objc_super v16 = v11;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }
    id v13 = objc_loadWeakRetained((id *)p_windowSceneIgnoringEvents);
    [v13 _endIgnoringInteractionEventsForReason:v11];

    objc_storeWeak((id *)p_windowSceneIgnoringEvents, 0);
  }
  [(UIPresentationController *)self _releaseSnapshot];
  [(UIPresentationController *)self _setPendingFocusEnvironmentUnlock:0];
  v14.receiver = self;
  v14.super_class = (Class)UIPresentationController;
  [(UIPresentationController *)&v14 dealloc];
}

- (void)_releaseSnapshot
{
  [(UIView *)self->_snapshotOverlayView removeFromSuperview];
  snapshotOverlayView = self->_snapshotOverlayView;
  self->_snapshotOverlayView = 0;
}

- (void)_setAdaptiveTransitionCoordinator:(id)a3
{
}

- (void)_setAdaptiveTransitionContext:(id)a3
{
}

- (id)_fullscreenPresentationSuperview
{
  id v3 = [(UIPresentationController *)self _containerSuperviewForCurrentTransition];

  if (!v3
    || ([(UIPresentationController *)self _containerSuperviewForCurrentTransition], id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue(), v4[2](), v5 = objc_claimAutoreleasedReturnValue(), v4, !v5))
  {
    id v6 = [(UIPresentationController *)self presentingViewController];
    id v7 = [v6 view];
    id v5 = [v7 window];
  }
  return v5;
}

- (id)_containerSuperviewForCurrentTransition
{
  return self->__containerSuperviewForCurrentTransition;
}

- (void)runTransitionForCurrentStateAnimated:(BOOL)a3 handoffData:(id)a4
{
  BOOL v4 = a3;
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v58 = a4;
  if ((self->_state & 0xFFFFFFFFFFFFFFFDLL) == 0)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v56 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v84 = self;
        _os_log_fault_impl(&dword_1853B0000, v56, OS_LOG_TYPE_FAULT, "Presentation controller state was changed while the transition was in progress. (%@)", buf, 0xCu);
      }
    }
    else
    {
      id v55 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FF58) + 8);
      if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v84 = self;
        _os_log_impl(&dword_1853B0000, v55, OS_LOG_TYPE_ERROR, "Presentation controller state was changed while the transition was in progress. (%@)", buf, 0xCu);
      }
    }
  }
  id v6 = [(UIPresentationController *)self presentedViewController];
  id v7 = v6;
  int64_t state = self->_state;
  BOOL v57 = state == 1;
  if (state == 1)
  {
    id v63 = v6;
    presentingViewController = self->_presentingViewController;
  }
  else
  {
    id v63 = self->_presentingViewController;
    presentingViewController = v7;
  }
  double v64 = presentingViewController;
  unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("UIPresentationController", &qword_1EB25FF60);
  double v11 = *(id *)(CategoryCachedImpl + 8);
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(*(os_log_t *)(CategoryCachedImpl + 8), self);
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v13 = v12;
    if (os_signpost_enabled(v11))
    {
      objc_super v14 = (objc_class *)objc_opt_class();
      Name = class_getName(v14);
      objc_super v16 = (objc_class *)objc_opt_class();
      uint64_t v17 = class_getName(v16);
      *(_DWORD *)buf = 67240706;
      *(_DWORD *)v84 = 1;
      *(_WORD *)&v84[4] = 2082;
      *(void *)&v84[6] = Name;
      __int16 v85 = 2082;
      uint64_t v86 = v17;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ModalTransition", " enableTelemetry=YES  isAnimation=YES custom=%{signpost.telemetry:number1,signpost.description:attribute,public}u, from=%{signpost.telemetry:string1,public}s to=%{signpost.telemetry:string2,public}s", buf, 0x1Cu);
    }
  }

  uint64_t v62 = objc_opt_class();
  uint64_t v61 = objc_opt_class();
  if (v62 == v61) {
    [(UIViewControllerAnimatedTransitioning *)self->_currentTransitionController setDelegate:self];
  }
  uint64_t v65 = [(UIViewController *)v64 _window];
  uint64_t v60 = [v65 _delegateViewController];
  if (state != 1)
  {
    if (!self->_isDisconnectedRoot) {
      goto LABEL_27;
    }
    if (v60 == v7)
    {
      double v20 = -[UIViewController _previousRootViewController]((id *)&v7->super.super.isa);
      [v65 _removeRotationViewController:v20];
      [v65 _setDelegateViewController:v20];
      v20[47] |= 0x100uLL;
    }
    if (v7) {
      objc_storeWeak((id *)&v7->_previousRootViewController, 0);
    }
    unint64_t v21 = *(void *)&v7->_viewControllerFlags & 0xFFFFFFFFFFFFFEFFLL;
    goto LABEL_19;
  }
  double v18 = [(UIViewController *)self->_presentingViewController presentingViewController];
  if (v18)
  {
    self->_isDisconnectedRoot = 0;
    p_isDisconnectedRoot = &self->_isDisconnectedRoot;
  }
  else
  {
    double v22 = [(UIViewController *)self->_presentingViewController _rootAncestorViewController];
    if (v60 == v22)
    {
      char isKindOfClass = 0;
    }
    else
    {
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
    }
    self->_isDisconnectedRoot = isKindOfClass & 1;
    p_isDisconnectedRoot = &self->_isDisconnectedRoot;
  }
  if (!*p_isDisconnectedRoot) {
    goto LABEL_27;
  }
  double v24 = [(UIViewController *)v7 splitViewController];
  BOOL v25 = v24 == 0;

  if (!v25)
  {
    BOOL *p_isDisconnectedRoot = 0;
    goto LABEL_27;
  }
  if (*p_isDisconnectedRoot)
  {
    BOOL v54 = v60;
    [v65 _addRotationViewController:v54];
    if (v7) {
      objc_storeWeak((id *)&v7->_previousRootViewController, v54);
    }
    [v65 _setDelegateViewController:v7];
    *(void *)&v54->_viewControllerFlags &= ~0x100uLL;

    unint64_t v21 = *(void *)&v7->_viewControllerFlags | 0x100;
LABEL_19:
    *(void *)&v7->_viewControllerFlags = v21;
  }
LABEL_27:
  double v26 = objc_alloc_init(_UIViewControllerOneToOneTransitionContext);
  [(_UIViewControllerTransitionContext *)v26 _setAnimator:self->_currentTransitionController];
  [(_UIViewControllerTransitionContext *)v26 _setIsAnimated:v4];
  [(_UIViewControllerOneToOneTransitionContext *)v26 _setFromViewController:v64];
  [(_UIViewControllerOneToOneTransitionContext *)v26 _setToViewController:v63];
  double v27 = [(UIPresentationController *)self _currentInteractionController];
  [(_UIViewControllerTransitionContext *)v26 _setInteractor:v27];

  [(_UIViewControllerTransitionContext *)v26 _setPresentationStyle:[(UIPresentationController *)self presentationStyle]];
  -[_UIViewControllerOneToOneTransitionContext _setIsDeferred:](v26, "_setIsDeferred:", [(id)objc_opt_class() _shouldDeferTransitions]);
  double v28 = [(UIPresentationController *)self _currentInteractionController];
  BOOL v29 = v28 != 0;

  id v30 = (objc_class *)objc_opt_class();
  v59 = class_getName(v30);
  if (![(UIPresentationController *)self _shouldDisableInteractionDuringTransitions]|| v29)
  {
    id v31 = 0;
  }
  else
  {
    id v32 = [v65 windowScene];
    objc_storeWeak((id *)&self->_windowSceneIgnoringEvents, v32);

    BOOL v33 = (objc_class *)objc_opt_class();
    double v34 = class_getName(v33);
    double v35 = (objc_class *)objc_opt_class();
    BOOL v36 = class_getName(v35);
    id v37 = objc_msgSend(NSString, "stringWithFormat:", @"<%s: %p> beginning transition for presentation", v59, self);
    double v38 = objc_msgSend(NSString, "stringWithFormat:", @"from: <%s: %p> to: <%s: %p>", v34, v64, v36, v63);;
    double v39 = NSString;
    id v40 = v37;
    uint64_t v41 = [v40 UTF8String];
    id v31 = v38;
    double v42 = objc_msgSend(v39, "stringWithFormat:", @"%s %s", v41, objc_msgSend(v31, "UTF8String"));
    id WeakRetained = objc_loadWeakRetained((id *)&self->_windowSceneIgnoringEvents);
    [WeakRetained _beginIgnoringInteractionEventsForReason:v42];
  }
  [v65 beginDisablingInterfaceAutorotation];
  double v44 = [v65 windowScene];
  double v45 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v44];

  [v45 beginDisablingInterfaceAutorotation];
  objc_initWeak((id *)buf, v45);
  [(UIPresentationController *)self _willRunTransitionForCurrentStateDeferred:[(_UIViewControllerOneToOneTransitionContext *)v26 _isDeferred]];
  if ([(UIPresentationController *)self dismissing]
    && [(UIPresentationController *)self _shouldRestoreFirstResponder])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke;
    aBlock[3] = &unk_1E52D9F98;
    aBlock[4] = self;
    v82 = v64;
    __int16 v46 = (void (**)(void))_Block_copy(aBlock);
    if ([(_UIViewControllerTransitionContext *)v26 isInteractive])
    {
      BOOL v47 = [(_UIViewControllerTransitionContext *)v26 _transitionCoordinator];
      v78[0] = MEMORY[0x1E4F143A8];
      v78[1] = 3221225472;
      v78[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_2;
      v78[3] = &unk_1E52E79C0;
      id v79 = v26;
      id v80 = v46;
      [v47 notifyWhenInteractionChangesUsingBlock:v78];
    }
    else
    {
      v46[2](v46);
    }
  }
  __int16 v48 = objc_opt_class();
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_3;
  v67[3] = &unk_1E52E7C90;
  v67[4] = self;
  double v49 = v26;
  double v68 = v49;
  id v50 = v65;
  id v69 = v50;
  v51 = v64;
  v70 = v51;
  BOOL v75 = v62 != v61;
  BOOL v76 = v29;
  double v66 = v63;
  int v71 = v66;
  v74[1] = (id)v59;
  id v52 = v31;
  id v72 = v52;
  objc_copyWeak(v74, (id *)buf);
  BOOL v77 = v57;
  id v53 = v58;
  id v73 = v53;
  [v48 _scheduleTransition:v67];

  objc_destroyWeak(v74);
  objc_destroyWeak((id *)buf);
}

- (UIViewControllerInteractiveTransitioning)_currentInteractionController
{
  return self->_currentInteractionController;
}

- (BOOL)_shouldDisableInteractionDuringTransitions
{
  return (fluidPresentationTransitionsEnabled & 1) == 0;
}

+ (void)_scheduleTransition:(id)a3
{
  BOOL v4 = (void (**)(void))a3;
  if ([a1 _shouldDeferTransitions]) {
    +[UIViewController _scheduleTransition:v4];
  }
  else {
    v4[2]();
  }
}

+ (BOOL)_shouldDeferTransitions
{
  int v3 = +[UIViewController _shouldDeferTransitions];
  if (v3)
  {
    LOBYTE(v3) = [a1 _allowsDeferredTransitions];
  }
  return v3;
}

- (BOOL)_shouldRestoreFirstResponder
{
  return 1;
}

- (void)_setContainerIgnoresDirectTouchEvents:(BOOL)a3
{
  if (self->_containerIgnoresDirectTouchEvents != a3)
  {
    self->_BOOL containerIgnoresDirectTouchEvents = a3;
    if (self->_containerView)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL containerIgnoresDirectTouchEvents = self->_containerIgnoresDirectTouchEvents;
        containerView = self->_containerView;
        [(UIView *)containerView setIgnoreDirectTouchEvents:containerIgnoresDirectTouchEvents];
      }
    }
  }
}

- (void)_dismissWithAnimationController:(id)a3 interactionController:(id)a4 animated:(BOOL)a5 handoffData:(id)a6
{
  BOOL v7 = a5;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  id v12 = a4;
  if (objc_opt_respondsToSelector())
  {
    os_signpost_id_t v13 = [(UIPresentationController *)self forcePresentationControllerDelegate];
    if (v13 && (objc_opt_respondsToSelector() & 1) != 0) {
      [v13 forcePresentationControllerWillDismiss:self];
    }
  }
  else
  {
    os_signpost_id_t v13 = 0;
  }
  uint64_t v14 = objc_opt_class();
  if (v14 == objc_opt_class()) {
    [v10 setDelegate:self];
  }
  [(UIPresentationController *)self _setCurrentTransitionController:v10];
  [(UIPresentationController *)self _setCurrentInteractionController:v12];

  if (self->_state != 2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      unint64_t v21 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        int v22 = 138412290;
        double v23 = self;
        _os_log_fault_impl(&dword_1853B0000, v21, OS_LOG_TYPE_FAULT, "Trying to dismiss the presentation controller while transitioning already. (%@)", (uint8_t *)&v22, 0xCu);
      }
    }
    else
    {
      double v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_dismissWithAnimationController_interactionController_animated_handoffData____s_category)+ 8);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        int v22 = 138412290;
        double v23 = self;
        _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_ERROR, "Trying to dismiss the presentation controller while transitioning already. (%@)", (uint8_t *)&v22, 0xCu);
      }
    }
  }
  self->_int64_t state = 3;
  double v15 = [(UIPresentationController *)self presentedViewController];
  objc_super v16 = [v15 _existingView];
  uint64_t v17 = [v16 window];
  double v18 = [(UIPresentationController *)self presentingViewController];
  char v19 = [(UIPresentationController *)self presentedViewController];
  [(UIPresentationController *)self _adjustOrientationIfNecessaryInWindow:v17 forViewController:v18 preservingViewController:v19];

  [(UIPresentationController *)self runTransitionForCurrentStateAnimated:v7 handoffData:v11];
}

- (UIEdgeInsets)_baseContentInsetsWithLeftMargin:(double *)a3 rightMargin:(double *)a4
{
  BOOL v7 = [(UIPresentationController *)self _rootPresentingViewControllerForNestedPresentation];
  if ([v7 _providesCustomBasePresentationInsets])
  {
    id v8 = v7;
  }
  else
  {
    id v8 = [(UIPresentationController *)self presentedViewController];
  }
  double v9 = v8;
  id v10 = [(UIPresentationController *)self presentedView];
  id v11 = [v10 window];
  id v12 = v11;
  if (v11)
  {
    id v13 = v11;
  }
  else
  {
    uint64_t v14 = [(UIPresentationController *)self presentingViewController];
    id v13 = [v14 _window];
  }
  double v15 = _UIPresentationControllerBaseContentInsetsForControllersAndViewInWindow(self, v9, v10, v13, a3, a4);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  if ([(UIPresentationController *)self _ignoresLeftAndRightSafeAreaInsets])
  {
    double v17 = 0.0;
    double v21 = 0.0;
  }
  [(UIPresentationController *)self _additionalSafeAreaInsets];
  double v23 = v15 + v22;
  double v25 = v17 + v24;
  double v27 = v19 + v26;
  double v29 = v21 + v28;

  double v30 = v23;
  double v31 = v25;
  double v32 = v27;
  double v33 = v29;
  result.right = v33;
  result.bottom = v32;
  result.left = v31;
  result.top = v30;
  return result;
}

+ (UIEdgeInsets)_statusBarOverlapAndMarginInfoForView:(id)a3 inWindow:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 traitCollection];
  uint64_t v8 = [v7 userInterfaceIdiom];

  if (v6)
  {
    double v9 = *(double *)&__SplashBoardOverrideStatusBarHeight;
    if (*(double *)&__SplashBoardOverrideStatusBarHeight != 1.79769313e308) {
      goto LABEL_24;
    }
  }
  else
  {
    char v10 = [(id)UIApp _appAdoptsUISceneLifecycle];
    if (*(double *)&__SplashBoardOverrideStatusBarHeight == 1.79769313e308) {
      double v9 = 0.0;
    }
    else {
      double v9 = *(double *)&__SplashBoardOverrideStatusBarHeight;
    }
    if (*(double *)&__SplashBoardOverrideStatusBarHeight != 1.79769313e308 || (v10 & 1) != 0) {
      goto LABEL_24;
    }
  }
  double v9 = 0.0;
  if (([(id)UIApp _isStatusBarEffectivelyHiddenForContentOverlayInsetsForWindow:v6] & 1) == 0
    && v8 != 3)
  {
    id v11 = -[UIView __viewDelegate]((id *)v5);
    id v12 = v11;
    if (v11)
    {
      [v11 _viewFrameInWindowForContentOverlayInsetsCalculation];
    }
    else
    {
      [v5 bounds];
      objc_msgSend(v5, "convertRect:toView:", v6);
    }
    CGFloat v17 = v13;
    CGFloat v18 = v14;
    CGFloat v19 = v15;
    CGFloat v20 = v16;
    if (_UIViewControllerModernContentOverlayInsetsPropagation())
    {
      double v21 = __UIStatusBarManagerForWindow(v6);
      [v21 statusBarHeight];
      double v23 = v22;

      v42.origin.x = v17;
      v42.origin.y = v18;
      v42.size.width = v19;
      v42.size.height = v20;
      double v9 = fmax(fmin(v23 - CGRectGetMinY(v42), v23), 0.0);
    }
    else
    {
      v43.origin.x = v17;
      v43.origin.y = v18;
      v43.size.width = v19;
      v43.size.height = v20;
      double MinY = CGRectGetMinY(v43);
      [v6 bounds];
      if (MinY >= CGRectGetMinY(v44))
      {
        v45.origin.x = v17;
        v45.origin.y = v18;
        v45.size.width = v19;
        v45.size.height = v20;
        double MaxY = CGRectGetMaxY(v45);
        [v6 bounds];
        if (MaxY <= CGRectGetMaxY(v46))
        {
          double v26 = __UIStatusBarManagerForWindow(v6);
          [v26 defaultStatusBarHeightInOrientation:1];
          double v28 = v27;

          double v29 = __UIStatusBarManagerForWindow(v6);
          char v30 = [v29 isStatusBarHidden];

          double v31 = 0.0;
          if ((v30 & 1) == 0)
          {
            double v32 = __UIStatusBarManagerForWindow(v6);
            [v32 statusBarHeight];
            double v34 = v33;

            double v31 = v34 - v28;
          }
          v47.origin.x = v17;
          v47.origin.y = v18;
          v47.size.width = v19;
          v47.size.height = v20;
          double v35 = v28 - (CGRectGetMinY(v47) - v31);
          if (v35 >= 0.0) {
            double v9 = v35;
          }
          else {
            double v9 = 0.0;
          }
        }
      }
    }
  }
LABEL_24:
  +[UIViewController _horizontalContentMarginForView:v5];
  double v37 = v36;

  double v38 = 0.0;
  double v39 = v9;
  double v40 = v37;
  double v41 = v37;
  result.right = v41;
  result.bottom = v38;
  result.left = v40;
  result.top = v39;
  return result;
}

- (id)_rootPresentingViewControllerForNestedPresentation
{
  int v3 = self->_presentingViewController;
  uint64_t v4 = [(UIViewController *)self->_presentingViewController _existingPresentationControllerImmediate:0 effective:1];
  if (v4)
  {
    id v5 = (void *)v4;
    do
    {
      id v6 = [v5 presentingViewController];

      uint64_t v7 = [(UIViewController *)v6 _existingPresentationControllerImmediate:0 effective:1];

      id v5 = (void *)v7;
      int v3 = v6;
    }
    while (v7);
  }
  else
  {
    id v6 = v3;
  }
  return v6;
}

- (BOOL)_ignoresLeftAndRightSafeAreaInsets
{
  return 0;
}

- (UIEdgeInsets)_additionalSafeAreaInsets
{
  int v3 = [(UIPresentationController *)self _parentPresentationController];
  double v4 = 0.0;
  if (v3)
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
    if (![(UIPresentationController *)self shouldPresentInFullscreen])
    {
      [v3 _additionalSafeAreaInsets];
      double v7 = v8;
      double v6 = v9;
      double v5 = v10;
      double v4 = v11;
    }
  }
  else
  {
    double v5 = 0.0;
    double v6 = 0.0;
    double v7 = 0.0;
  }

  double v12 = v7;
  double v13 = v6;
  double v14 = v5;
  double v15 = v4;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (_UIPresentationControllerVisualStyle)_visualStyle
{
  return self->_visualStyle;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (BOOL)_shouldPreserveFirstResponder
{
  return 1;
}

- (void)setDelegate:(id)delegate
{
}

- (void)_setPresentedViewControllerStoredWeakly:(BOOL)a3
{
  if (self->__presentedViewControllerStoredWeakly != a3)
  {
    self->__presentedViewControllerStoredWeakly = a3;
    if (a3)
    {
      objc_storeWeak((id *)&self->_weakPresentedViewController, self->_presentedViewController);
      presentedViewController = self->_presentedViewController;
      self->_presentedViewController = 0;
    }
    else
    {
      id WeakRetained = (UIViewController *)objc_loadWeakRetained((id *)&self->_weakPresentedViewController);
      double v6 = self->_presentedViewController;
      self->_presentedViewController = WeakRetained;

      objc_storeWeak((id *)&self->_weakPresentedViewController, 0);
    }
  }
}

- (BOOL)_shouldConvertToScene
{
  return 0;
}

- (void)_setSourceViewController:(id)a3
{
}

- (void)_sendDelegateWillPresentWithAdaptiveStyle:(int64_t)a3 transitionCoordinator:(id)a4
{
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained presentationController:self willPresentWithAdaptiveStyle:a3 transitionCoordinator:v7];
  }
}

- (id)_presentationControllerForTraitCollection:(id)a3
{
  id v4 = a3;
  if (dyld_program_sdk_at_least())
  {
    UIModalPresentationStyle v5 = [(UIPresentationController *)self adaptivePresentationStyleForTraitCollection:v4];
  }
  else
  {
    uint64_t v6 = [v4 horizontalSizeClass];

    if (v6 != 1)
    {
LABEL_25:
      id v7 = self;
      goto LABEL_26;
    }
    UIModalPresentationStyle v5 = [(UIPresentationController *)self adaptivePresentationStyle];
  }
  if (v5 == UIModalPresentationNone
    || [(UIPresentationController *)self presentationStyle] == UIModalPresentationFullScreen
    || [(UIPresentationController *)self presentationStyle] == UIModalPresentationOverFullScreen
    || [(UIPresentationController *)self presentationStyle] == 17)
  {
    goto LABEL_25;
  }
  id v7 = 0;
  if (v5 > UIModalPresentationCustom)
  {
    if (v5 != UIModalPresentationOverFullScreen && v5 != 17) {
      goto LABEL_24;
    }
    double v12 = _UIOverFullscreenPresentationController;
    goto LABEL_18;
  }
  if (v5 == UIModalPresentationFullScreen)
  {
    double v12 = _UIFullscreenPresentationController;
LABEL_18:
    id v13 = [v12 alloc];
    double v14 = [(UIPresentationController *)self presentedViewController];
    double v15 = [(UIPresentationController *)self presentingViewController];
    id v7 = (UIPresentationController *)[v13 initWithPresentedViewController:v14 presentingViewController:v15];
    goto LABEL_19;
  }
  if (v5 != UIModalPresentationFormSheet) {
    goto LABEL_24;
  }
  uint64_t v8 = [(UIPresentationController *)self _adaptiveFormSheetPresentationController];
  if (!v8)
  {
    double v22 = [_UIFormSheetPresentationController alloc];
    double v15 = [(UIPresentationController *)self presentedViewController];
    double v23 = [(UIPresentationController *)self presentingViewController];
    id v7 = [(UISheetPresentationController *)v22 initWithPresentedViewController:v15 presentingViewController:v23];

    double v14 = 0;
LABEL_19:

    if (v7) {
      goto LABEL_20;
    }
LABEL_24:

    goto LABEL_25;
  }
  double v9 = (void *)v8;
  double v10 = [(UIPresentationController *)self presentingViewController];
  [v9 _setPresentingViewController:v10];

  double v11 = [(UIPresentationController *)self presentedViewController];
  [v9 _setPresentedViewController:v11];

  id v7 = v9;
LABEL_20:
  BOOL v16 = [(UIPresentationController *)self shouldPresentInFullscreen];
  if (v16 != [(UIPresentationController *)v7 shouldPresentInFullscreen]) {
    goto LABEL_24;
  }
  uint64_t v17 = objc_opt_class();
  if (v17 == objc_opt_class()) {
    goto LABEL_24;
  }
  CGFloat v18 = [(UIPresentationController *)self _sourceViewController];
  [(UIPresentationController *)v7 _setSourceViewController:v18];

  CGFloat v19 = [(UIPresentationController *)self delegate];
  [(UIPresentationController *)v7 setDelegate:v19];
  CGFloat v20 = [(UIPresentationController *)self presentedViewController];
  [v20 _presentationController:self prepareAdaptivePresentationController:v7];

  if (objc_opt_respondsToSelector())
  {
    [v19 presentationController:self prepareAdaptivePresentationController:v7];
  }
  else if (objc_opt_respondsToSelector())
  {
    [v19 _presentationController:self prepareAdaptivePresentationController:v7];
  }

LABEL_26:
  return v7;
}

- (UIModalPresentationStyle)adaptivePresentationStyleForTraitCollection:(UITraitCollection *)traitCollection
{
  id v4 = traitCollection;
  UIModalPresentationStyle v5 = [(UIPresentationController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    unint64_t v6 = [v5 adaptivePresentationStyleForPresentationController:self traitCollection:v4] + 1;
    if (v6 < 7 && ((0x4Bu >> v6) & 1) != 0)
    {
      UIModalPresentationStyle v7 = qword_186B94118[v6];
      goto LABEL_10;
    }
LABEL_9:
    UIModalPresentationStyle v7 = [(UIPresentationController *)self _defaultPresentationStyleForTraitCollection:v4];
    goto LABEL_10;
  }
  if ([(UITraitCollection *)v4 horizontalSizeClass] != UIUserInterfaceSizeClassCompact) {
    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_9;
  }
  uint64_t v8 = [v5 adaptivePresentationStyleForPresentationController:self];
  if ((unint64_t)(v8 + 1) > 6) {
    goto LABEL_9;
  }
  UIModalPresentationStyle v7 = v8;
  if (((1 << (v8 + 1)) & 0x43) == 0) {
    goto LABEL_9;
  }
LABEL_10:

  return v7;
}

- (id)_initialPresentationViewControllerForViewController:(id)a3
{
  id v3 = a3;
  return v3;
}

- (void)_containedViewControllerModalStateChanged
{
  id v2 = [(UIPresentationController *)self _parentPresentationController];
  [v2 _containedViewControllerModalStateChanged];
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)__sizeClassPair
{
  id v3 = [(UIPresentationController *)self presentingViewController];
  id v4 = [v3 view];
  UIModalPresentationStyle v5 = [v4 window];

  if (v5)
  {
    id v3 = [(UIPresentationController *)self presentingViewController];
    uint64_t v6 = [v5 rootViewController];
    if (v3 != (void *)v6)
    {
      UIModalPresentationStyle v7 = (void *)v6;
      uint64_t v8 = objc_msgSend(v5, "__sizeClassPair");
      int64_t v10 = v9;
LABEL_5:

      goto LABEL_6;
    }
  }
  double v11 = [(UIPresentationController *)self presentingViewController];
  uint64_t v8 = objc_msgSend(v11, "__sizeClassPair");
  int64_t v10 = v12;

  UIModalPresentationStyle v7 = v3;
  if (v5) {
    goto LABEL_5;
  }
LABEL_6:

  int64_t v13 = v8;
  int64_t v14 = v10;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (int64_t)_defaultPresentationStyleForTraitCollection:(id)a3
{
  return -1;
}

- (void)_enableOcclusion:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  UIModalPresentationStyle v5 = [(UIPresentationController *)self presentedViewController];
  uint64_t v6 = [v5 view];

  UIModalPresentationStyle v7 = [(UIPresentationController *)self presentingViewController];
  uint64_t v8 = [v7 view];

  int64_t v9 = [(UIPresentationController *)self _parentPresentationController];
  int64_t v10 = [v9 presentingViewController];

  if (v10)
  {
    [v8 setTintAdjustmentMode:!v3];
    double v11 = +[_UIHDRUsageCoordinator sharedInstance]();
    -[_UIHDRUsageCoordinator enableHDRSuppression:inViewHierarchy:]((uint64_t)v11, v3, v8);
  }
  else if (v3)
  {
    [v8 _beginOcclusion:self];
  }
  else
  {
    [v8 _endOcclusion:self];
  }
  [v6 setTintAdjustmentMode:v3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  int64_t v12 = [(UIPresentationController *)self _passthroughViews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v17 + 1) + 8 * i) setTintAdjustmentMode:v3];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v14);
  }
}

- (void)_setForcePresentationInPresenterScene:(BOOL)a3
{
  self->_forcePresentationInPresenterScene = a3;
}

- (UIBarButtonItem)barButtonItem
{
  id v2 = [(UIPresentationController *)self sourceItem];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return (UIBarButtonItem *)v3;
}

- (CGRect)sourceRect
{
  double x = self->_sourceRect.origin.x;
  double y = self->_sourceRect.origin.y;
  double width = self->_sourceRect.size.width;
  double height = self->_sourceRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (UIView)_realSourceView
{
  id v3 = [(UIPresentationController *)self sourceItem];
  id v4 = _UIPopoverPresentationControllerSourceItemUpCast(v3);

  if (v4)
  {
    UIModalPresentationStyle v5 = [(UIPresentationController *)self containerView];
    uint64_t v6 = [v5 _window];
    UIModalPresentationStyle v7 = [v4 _sourceViewForPresentationInWindow:v6];

    if (v7 != self->_observedRealSourceView) {
      [(UIPresentationController *)self _updateRealSourceView];
    }
  }
  uint64_t v8 = self->_observedRealSourceView;

  return v8;
}

- (UIPopoverPresentationControllerSourceItem)sourceItem
{
  return self->_sourceItem;
}

void __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) presentingViewController];
  [v2 _restoreInputViewsForPresentation];

  id v3 = [*(id *)(a1 + 40) view];
  [v3 endEditing:1];
}

- (id)_createVisualStyleForProvider:(id)a3
{
  return (id)[a3 defaultStyleForPresentationController:self];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customViewForTouchContinuation, 0);
  objc_destroyWeak((id *)&self->__viewForRemoteTextEffectsWindowMatchAnimation);
  objc_storeStrong(&self->__currentTransitionDidComplete, 0);
  objc_storeStrong(&self->__computeToEndFrameForCurrentTransition, 0);
  objc_storeStrong(&self->__customToViewForCurrentTransition, 0);
  objc_storeStrong(&self->__customFromViewForCurrentTransition, 0);
  objc_storeStrong(&self->__toViewForCurrentTransition, 0);
  objc_storeStrong(&self->__fromViewForCurrentTransition, 0);
  objc_storeStrong(&self->__containerSuperviewForCurrentTransition, 0);
  objc_storeStrong(&self->__transitionViewForCurrentTransition, 0);
  objc_storeStrong((id *)&self->_adaptiveTransitionContext, 0);
  objc_storeStrong((id *)&self->_adaptiveTransitionCoordinator, 0);
  objc_destroyWeak((id *)&self->__currentPresentationSuperview);
  objc_storeStrong((id *)&self->_presentationView, 0);
  objc_destroyWeak((id *)&self->__sourceViewController);
  objc_storeStrong((id *)&self->_currentInteractionController, 0);
  objc_storeStrong((id *)&self->_currentTransitionController, 0);
  objc_storeStrong(&self->__pendingFocusEnvironmentUnlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_presentingViewController, 0);
  objc_storeStrong((id *)&self->_visualStyle, 0);
  objc_storeStrong((id *)&self->_sourceItem, 0);
  objc_storeStrong((id *)&self->_sourceView, 0);
  objc_storeStrong((id *)&self->_presentedViewController, 0);
  objc_destroyWeak((id *)&self->_windowSceneIgnoringEvents);
  objc_destroyWeak((id *)&self->_weakPresentedViewController);
  objc_storeStrong((id *)&self->_observedRealSourceView, 0);
  objc_storeStrong((id *)&self->_currentRunningAnimationsUUID, 0);
  objc_storeStrong((id *)&self->_backGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_snapshotOverlayView, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistry, 0);
  objc_storeStrong((id *)&self->_traitOverrides, 0);
  objc_storeStrong((id *)&self->_lastNotifiedTraitCollection, 0);
}

uint64_t __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enableOcclusion:*(unsigned __int8 *)(a1 + 40)];
}

- (void)transitionDidStart
{
  id v3 = [(UIPresentationController *)self presentedViewController];
  if (-[UIPresentationController _shouldMakePresentedViewControllerFirstResponder](self, "_shouldMakePresentedViewControllerFirstResponder")&& ([v3 _containsFirstResponder] & 1) == 0)
  {
    [v3 becomeFirstResponder];
  }
}

- (UIView)sourceView
{
  return self->_sourceView;
}

- (void)setSourceView:(id)a3
{
  uint64_t v6 = (UIView *)a3;
  int64_t v9 = v6;
  if (v6)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    uint64_t v6 = v9;
    if ((isKindOfClass & 1) == 0)
    {
      uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"UIPresentationController.m", 186, @"Tried to set %@ as sourceView of %@, even though it is not a kind of UIView.", v9, self object file lineNumber description];

      uint64_t v6 = v9;
    }
  }
  if (self->_sourceView != v6)
  {
    objc_storeStrong((id *)&self->_sourceView, a3);
    [(UIPresentationController *)self _updateRealSourceView];
    uint64_t v6 = v9;
  }
}

- (void)setSourceItem:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v9 = _UIPopoverPresentationControllerSourceItemUpCast(v5);

    UIModalPresentationStyle v7 = (UIPopoverPresentationControllerSourceItem *)v9;
    if (v9) {
      goto LABEL_5;
    }
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"UIPresentationController.m", 201, @"Tried to set %@ as sourceItem of %@, which is not a supported class", 0, self object file lineNumber description];
  }
  UIModalPresentationStyle v7 = 0;
LABEL_5:
  if (self->_sourceItem != v7)
  {
    int64_t v10 = v7;
    objc_storeStrong((id *)&self->_sourceItem, v7);
    [(UIPresentationController *)self _updateRealSourceView];
    UIModalPresentationStyle v7 = v10;
  }
}

- (void)_updateRealSourceView
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(UIPresentationController *)self sourceItem];
  id v4 = _UIPopoverPresentationControllerSourceItemUpCast(v3);

  if (v4)
  {
    id v5 = [(UIPresentationController *)self containerView];
    uint64_t v6 = [v5 _window];

    UIModalPresentationStyle v7 = [v4 _sourceViewForPresentationInWindow:v6];
    if (v6)
    {
      if (os_variant_has_internal_diagnostics())
      {
        if (!v7)
        {
          uint64_t v8 = __UIFaultDebugAssertLog();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
          {
            int v10 = 138412290;
            double v11 = v4;
            _os_log_fault_impl(&dword_1853B0000, v8, OS_LOG_TYPE_FAULT, "Assuming %@'s view exists", (uint8_t *)&v10, 0xCu);
          }
        }
      }
      else if (!v7)
      {
        uint64_t v9 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_updateRealSourceView___s_category) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v10 = 138412290;
          double v11 = v4;
          _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_ERROR, "Assuming %@'s view exists", (uint8_t *)&v10, 0xCu);
        }
      }
    }
  }
  else
  {
    UIModalPresentationStyle v7 = [(UIPresentationController *)self sourceView];
  }
  [(UIPresentationController *)self _setRealSourceView:v7];
}

- (BOOL)_shouldMakePresentedViewControllerFirstResponder
{
  return 1;
}

- (void)_setRealSourceView:(id)a3
{
  id v5 = (UIView *)a3;
  p_observedRealSourceView = &self->_observedRealSourceView;
  observedRealSourceView = self->_observedRealSourceView;
  if (observedRealSourceView != v5)
  {
    int v10 = v5;
    uint64_t v8 = observedRealSourceView;
    objc_storeStrong((id *)&self->_observedRealSourceView, a3);
    if (v8) {
      -[UIView _removeGeometryChangeObserver:](v8, self);
    }
    if (*p_observedRealSourceView)
    {
      -[UIView _addGeometryChangeObserver:](*p_observedRealSourceView, self);
      uint64_t v9 = self->_observedRealSourceView;
    }
    else
    {
      uint64_t v9 = 0;
    }
    [(UIPresentationController *)self _realSourceViewDidChangeFromView:v8 toView:v9];

    id v5 = v10;
  }
}

- (id)_preferredInteractionControllerForPresentation:(id)a3
{
  return 0;
}

- (void)_containerViewWillLayoutSubviewsWithObservationTracking
{
  id v2 = self;
  sub_185A8B794();
}

- (void)_containerViewDidLayoutSubviewsWithObservationTracking
{
  id v2 = self;
  sub_185A8BCDC();
}

- (void)_ui_setObservationTrackingDictionary:(id)a3
{
  self->_hasObservationTrackingDictionardouble y = a3 != 0;
  v3.receiver = self;
  v3.super_class = (Class)UIPresentationController;
  -[NSObject _ui_setObservationTrackingDictionary:](&v3, sel__ui_setObservationTrackingDictionary_);
}

- (id)_ui_observationTrackingDictionary
{
  if (self->_hasObservationTrackingDictionary)
  {
    v4.receiver = self;
    v4.super_class = (Class)UIPresentationController;
    id v2 = [&v4 _ui_observationTrackingDictionary];
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

- (void)_geometryChanged:(id *)a3 forAncestor:(id)a4
{
  id v5 = [(UIPresentationController *)self containerView];
  [v5 setNeedsLayout];

  [(UIPresentationController *)self _realSourceViewGeometryDidChange];
}

- (UIPresentationController)init
{
  objc_super v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  id v5 = [NSString stringWithUTF8String:"-[UIPresentationController init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (void)_transplantView:(id)a3 toSuperview:(id)a4 atIndex:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__UIPresentationController__transplantView_toSuperview_atIndex___block_invoke;
  v13[3] = &unk_1E52E7B80;
  id v14 = v7;
  id v15 = v8;
  unint64_t v16 = a5;
  id v9 = v8;
  id v10 = v7;
  double v11 = [v10 _window];
  uint64_t v12 = [v11 windowScene];
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, v13, v12);
}

uint64_t __64__UIPresentationController__transplantView_toSuperview_atIndex___block_invoke(uint64_t a1)
{
  double v2 = _frameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32));
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = [*(id *)(a1 + 32) superview];
  objc_msgSend(v9, "convertPoint:toView:", *(void *)(a1 + 40), v2, v4);
  double v11 = v10;
  double v13 = v12;

  _setFrameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32), v11, v13, v6, v8);
  [*(id *)(a1 + 40) insertSubview:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
  return 0;
}

- (void)_transplantView:(id)a3 toSuperview:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  id v12 = v5;
  id v13 = v6;
  id v7 = v6;
  id v8 = v5;
  id v9 = objc_msgSend(v8, "_window", v11, 3221225472, __56__UIPresentationController__transplantView_toSuperview___block_invoke, &unk_1E52E7BA8);
  double v10 = [v9 windowScene];
  +[UIView _performBlockDelayingTriggeringResponderEvents:forScene:]((uint64_t)UIView, &v11, v10);
}

uint64_t __56__UIPresentationController__transplantView_toSuperview___block_invoke(uint64_t a1)
{
  double v2 = _frameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32));
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  id v9 = [*(id *)(a1 + 32) superview];
  objc_msgSend(v9, "convertPoint:toView:", *(void *)(a1 + 40), v2, v4);
  double v11 = v10;
  double v13 = v12;

  _setFrameIgnoringLayerTransformOnOrAfterYukon(*(void **)(a1 + 32), v11, v13, v6, v8);
  [*(id *)(a1 + 40) addSubview:*(void *)(a1 + 32)];
  return 0;
}

- (BOOL)dismissed
{
  return self->_state == 0;
}

- (BOOL)_presentingOrPresented
{
  if ([(UIPresentationController *)self presenting]) {
    return 1;
  }
  return [(UIPresentationController *)self presented];
}

- (id)_activePresentationController
{
  double v2 = [(UIPresentationController *)self presentingViewController];
  double v3 = [v2 _presentationController];

  return v3;
}

- (BOOL)_shouldPresentedViewControllerControlStatusBarAppearance
{
  if ([(UIPresentationController *)self shouldPresentInFullscreen]
    || ([(UIPresentationController *)self presentingViewController],
        double v3 = objc_claimAutoreleasedReturnValue(),
        [v3 _existingPresentationControllerImmediate:0 effective:1 includesRoot:1],
        double v4 = objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    return [(UIPresentationController *)self shouldRemovePresentersView];
  }
  else
  {
    char v5 = [v4 _shouldPresentedViewControllerControlStatusBarAppearance];

    return v5;
  }
}

- (BOOL)_shouldPresentedViewControllerServeAsBaseForScrollToTop
{
  return 1;
}

- (BOOL)_shouldDismissWithNavigationPop
{
  return 0;
}

- (BOOL)_shouldKeepCurrentFirstResponder
{
  return 1;
}

- (BOOL)_preserveResponderAcrossWindows
{
  return 1;
}

- (BOOL)_wantsAutomaticFirstResponderWhenPresentingRemoteViewController
{
  return 1;
}

- (void)_prepareForWindowDeallocRecursively:(BOOL)a3
{
  BOOL v3 = a3;
  id v9 = [(UIPresentationController *)self presentedViewController];
  char v5 = [(UIPresentationController *)self containerView];
  if (v3) {
    [v9 _prepareForWindowDealloc];
  }
  if (v9 && ((v9[94] >> 1) & 3u) - 1 <= 1)
  {
    [v9 beginAppearanceTransition:0 animated:0];
    double v6 = [v9 view];
    [v6 removeFromSuperview];

    [v9 endAppearanceTransition];
  }
  double v7 = [(UIPresentationController *)self presentingViewController];
  double v8 = [v7 _originalPresentationController];
  [v8 _setPresentingViewController:0];

  [(UIPresentationController *)self _setPresentingViewController:0];
}

- (BOOL)_presentationPotentiallyUnderlapsStatusBar
{
  return 1;
}

- (UIView)_presentationView
{
  return self->_presentationView;
}

- (void)_transitionToPresentationController:(id)a3 withTransitionCoordinator:(id)a4
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  [(UIPresentationController *)self completeCurrentTransitionImmediately];
  if (!self->_state) {
    goto LABEL_47;
  }
  double v49 = v8;
  self->_int64_t state = 4;
  id v9 = [(UIPresentationController *)self presentedViewController];
  double v10 = [v7 presentedViewController];

  uint64_t v11 = [(UIPresentationController *)self _changedPresentingViewControllerDuringAdaptation];
  [(UIPresentationController *)self _setChangedPresentingViewControllerDuringAdaptation:0];
  if (v11)
  {
    if (([v7 shouldRemovePresentersView] & 1) == 0)
    {
      double v12 = [(UIPresentationController *)self presentingViewController];
      uint64_t v11 = (uint64_t)v12;
      uint64_t v13 = 1;
LABEL_7:
      [v12 beginAppearanceTransition:v13 animated:1];

      char v47 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v11 = [(UIPresentationController *)self shouldRemovePresentersView];
    if (v11 != [v7 shouldRemovePresentersView])
    {
      uint64_t v11 = [(UIPresentationController *)self presentingViewController];
      uint64_t v13 = [v7 shouldRemovePresentersView] ^ 1;
      double v12 = (void *)v11;
      goto LABEL_7;
    }
  }
  char v47 = 0;
LABEL_9:
  if (v9 == v10)
  {
    LOBYTE(v48) = 0;
    char v17 = 0;
    BOOL v18 = 0;
    BOOL v19 = 0;
    goto LABEL_38;
  }
  id v14 = [(UIPresentationController *)self presentedViewController];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    double v10 = [(UIPresentationController *)self presentedViewController];
    uint64_t v11 = [v10 topViewController];
    id v15 = [v7 presentedViewController];
    BOOL v16 = v11 == (void)v15;
  }
  else
  {
    BOOL v16 = 0;
  }

  long long v20 = [v7 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v48 = v16;
  if (isKindOfClass)
  {
    double v10 = [v7 presentedViewController];
    uint64_t v11 = [v10 topViewController];
    uint64_t v22 = [(UIPresentationController *)self presentedViewController];
    if (v11 == v22)
    {

      goto LABEL_27;
    }
    double v4 = (void *)v22;
  }
  double v23 = [(UIPresentationController *)self presentedViewController];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    if (isKindOfClass)
    {
    }
    char v17 = 0;
LABEL_28:

    if (!v16) {
      goto LABEL_30;
    }
    goto LABEL_29;
  }
  double v24 = [(UIPresentationController *)self presentedViewController];
  double v25 = [v24 topViewController];

  if (isKindOfClass)
  {
  }
  if (!v25)
  {
LABEL_27:
    long long v20 = [v7 presentedViewController];
    char v17 = 1;
    [v20 _setIsWrappingDuringAdaptation:1];
    BOOL v16 = v48;
    goto LABEL_28;
  }
  char v17 = 0;
  LOBYTE(v16) = v48;
  if (v48)
  {
LABEL_29:
    double v26 = [(UIPresentationController *)self presentedViewController];
    [v26 _setIsWrappingDuringAdaptation:1];
  }
LABEL_30:
  double v27 = [(UIPresentationController *)self _childPresentationController];

  BOOL v18 = v27 != 0;
  if (v27)
  {
    double v28 = [(UIPresentationController *)self _childPresentationController];
    [v28 _setChangedPresentingViewControllerDuringAdaptation:1];
LABEL_35:
    BOOL v19 = v27 == 0;

    goto LABEL_36;
  }
  if (!v16)
  {
    double v28 = [v7 presentedViewController];
    [v28 beginAppearanceTransition:1 animated:1];
    goto LABEL_35;
  }
  BOOL v19 = 0;
LABEL_36:
  uint64_t v29 = [(UIPresentationController *)self _childPresentationController];
  if (!v29
    || (char v30 = (void *)v29,
        [(UIPresentationController *)self _childPresentationController],
        double v31 = objc_claimAutoreleasedReturnValue(),
        char v32 = [v31 shouldRemovePresentersView],
        v31,
        v30,
        (v32 & 1) == 0))
  {
    if (v17)
    {
      char v33 = 0;
      char v17 = 1;
    }
    else
    {
      double v34 = [(UIPresentationController *)self presentedViewController];
      char v33 = 1;
      [v34 beginAppearanceTransition:0 animated:1];

      char v17 = 0;
    }
    goto LABEL_42;
  }
LABEL_38:
  char v33 = 0;
LABEL_42:
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  double v36 = [(UIPresentationController *)self _transitionViewForCurrentTransition];

  if (has_internal_diagnostics)
  {
    if (!v36)
    {
      CGRect v45 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = self;
        _os_log_fault_impl(&dword_1853B0000, v45, OS_LOG_TYPE_FAULT, "transitionViewForCurrentTransition is not set! (%@)", buf, 0xCu);
      }
    }
  }
  else if (!v36)
  {
    CGRect v46 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &_transitionToPresentationController_withTransitionCoordinator____s_category)+ 8);
    if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = self;
      _os_log_impl(&dword_1853B0000, v46, OS_LOG_TYPE_ERROR, "transitionViewForCurrentTransition is not set! (%@)", buf, 0xCu);
    }
  }
  double v37 = [(UIPresentationController *)self _transitionViewForCurrentTransition];

  if (v37)
  {
    double v38 = [(UIPresentationController *)self _transitionViewForCurrentTransition];
    id v39 = (id)v38[2]();

    [v7 setState:5];
    double v40 = [(UIPresentationController *)self _currentPresentationSuperview];
    [v7 _setCurrentPresentationSuperview:v40];
    v62[0] = MEMORY[0x1E4F143A8];
    v62[1] = 3221225472;
    v62[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke;
    v62[3] = &unk_1E52DAD98;
    id v41 = v7;
    id v63 = v41;
    id v42 = v40;
    BOOL v66 = v18;
    BOOL v67 = v48;
    id v64 = v42;
    uint64_t v65 = self;
    +[UIView performWithoutAnimation:v62];
    id v8 = v49;
    [(_UIPresentationControllerVisualStyle *)self->_visualStyle runAlongsideTransitionToPresentationController:v41 transitionCoordinator:v49];
    CGRect v43 = [v41 _visualStyle];
    [v43 runAlongsideTransitionFromPresentationController:self transitionCoordinator:v49];

    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_2;
    v58[3] = &unk_1E52E7BF8;
    id v59 = v41;
    id v60 = v42;
    uint64_t v61 = self;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_4;
    v50[3] = &unk_1E52E7C20;
    id v51 = v59;
    id v52 = self;
    BOOL v53 = v19;
    char v54 = v33;
    char v55 = v47;
    char v56 = v17;
    BOOL v57 = v48;
    id v44 = v42;
    [v49 _animateAlongsideTransitionInView:0 systemAnimation:0 systemCompletion:1 animation:v58 completion:v50];
  }
  else
  {
    NSLog(&cfstr_NullTransition.isa, "-[UIPresentationController _transitionToPresentationController:withTransitionCoordinator:]");
    id v8 = v49;
  }
LABEL_47:
}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _initViewHierarchyForPresentationSuperview:*(void *)(a1 + 40)];
  double v2 = [*(id *)(a1 + 32) _transitionViewForCurrentTransition];
  id v3 = (id)v2[2]();

  double v4 = [*(id *)(a1 + 32) _toViewForCurrentTransition];
  v4[2]();
  id v30 = (id)objc_claimAutoreleasedReturnValue();

  char v5 = [*(id *)(a1 + 32) _computeToEndFrameForCurrentTransition];
  double v6 = v5[2]();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  _setFrameIgnoringLayerTransformOnOrAfterYukon(v30, v6, v8, v10, v12);
  if (*(unsigned char *)(a1 + 56) || *(unsigned char *)(a1 + 57))
  {
    uint64_t v13 = [*(id *)(a1 + 32) presentedViewController];
    [v13 setPerformingModalTransition:1];
  }
  id v14 = [*(id *)(a1 + 32) containerView];
  [v14 addSubview:v30];

  id v15 = [*(id *)(a1 + 48) _childPresentationController];
  BOOL v16 = *(void **)(a1 + 32);
  char v17 = [v16 presentedViewController];
  BOOL v18 = [v17 view];
  BOOL v19 = [v18 superview];
  [v16 _setPresentationView:v19];

  if (v15 && ([v15 shouldPresentInFullscreen] & 1) == 0)
  {
    long long v20 = [v15 containerView];
    double v21 = [*(id *)(a1 + 32) _presentationView];
    [v21 bounds];
    _setFrameIgnoringLayerTransformOnOrAfterYukon(v20, v22, v23, v24, v25);

    double v26 = [*(id *)(a1 + 32) _presentationView];
    double v27 = [v15 containerView];
    [v26 addSubview:v27];
  }
  if (*(unsigned char *)(a1 + 56))
  {
    double v28 = [*(id *)(a1 + 32) presentedViewController];
    [v28 setPerformingModalTransition:0];
  }
  uint64_t v29 = [*(id *)(a1 + 32) containerView];
  [v29 setAlpha:0.0];
}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _frameForTransitionViewInPresentationSuperview:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  uint64_t v5 = v4;
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_3;
  v12[3] = &unk_1E52DA520;
  id v13 = *(id *)(a1 + 32);
  uint64_t v14 = v3;
  uint64_t v15 = v5;
  uint64_t v16 = v7;
  uint64_t v17 = v9;
  +[UIView performWithoutAnimation:v12];
  double v10 = [*(id *)(a1 + 32) containerView];
  [v10 setAlpha:1.0];

  double v11 = [*(id *)(a1 + 48) containerView];
  [v11 setAlpha:0.0];
}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_3(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  uint64_t v6 = [*(id *)(a1 + 32) containerView];
  objc_msgSend(v6, "setFrame:", v2, v3, v4, v5);

  id v7 = [*(id *)(a1 + 32) containerView];
  [v7 layoutBelowIfNeeded];
}

void __90__UIPresentationController__transitionToPresentationController_withTransitionCoordinator___block_invoke_4(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) _currentTransitionDidComplete];

  if (!v2)
  {
    if (os_variant_has_internal_diagnostics())
    {
      uint64_t v17 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
        goto LABEL_21;
      }
      uint64_t v27 = *(void *)(a1 + 32);
      double v26 = *(void **)(a1 + 40);
      BOOL v18 = [v26 presentedViewController];
      BOOL v19 = [*(id *)(a1 + 40) presentingViewController];
      int v30 = 138413058;
      uint64_t v31 = v27;
      __int16 v32 = 2112;
      char v33 = v26;
      __int16 v34 = 2112;
      double v35 = v18;
      __int16 v36 = 2112;
      double v37 = v19;
      _os_log_fault_impl(&dword_1853B0000, v17, OS_LOG_TYPE_FAULT, "toPresentationController._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@, presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v30, 0x2Au);
    }
    else
    {
      uint64_t v14 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FF48) + 8);
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_2;
      }
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v15 = *(void **)(a1 + 40);
      uint64_t v17 = v14;
      BOOL v18 = [v15 presentedViewController];
      BOOL v19 = [*(id *)(a1 + 40) presentingViewController];
      int v30 = 138413058;
      uint64_t v31 = v16;
      __int16 v32 = 2112;
      char v33 = v15;
      __int16 v34 = 2112;
      double v35 = v18;
      __int16 v36 = 2112;
      double v37 = v19;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_ERROR, "toPresentationController._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@, presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v30, 0x2Au);
    }

LABEL_21:
  }
LABEL_2:
  double v3 = [*(id *)(a1 + 40) _currentTransitionDidComplete];

  if (!v3)
  {
    if (os_variant_has_internal_diagnostics())
    {
      double v23 = __UIFaultDebugAssertLog();
      if (!os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        goto LABEL_26;
      }
      uint64_t v29 = *(void *)(a1 + 32);
      double v28 = *(void **)(a1 + 40);
      double v24 = [v28 presentedViewController];
      double v25 = [*(id *)(a1 + 40) presentingViewController];
      int v30 = 138413058;
      uint64_t v31 = v29;
      __int16 v32 = 2112;
      char v33 = v28;
      __int16 v34 = 2112;
      double v35 = v24;
      __int16 v36 = 2112;
      double v37 = v25;
      _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "self._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@ presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v30, 0x2Au);
    }
    else
    {
      long long v20 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &qword_1EB25FF50) + 8);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        goto LABEL_3;
      }
      uint64_t v22 = *(void *)(a1 + 32);
      double v21 = *(void **)(a1 + 40);
      double v23 = v20;
      double v24 = [v21 presentedViewController];
      double v25 = [*(id *)(a1 + 40) presentingViewController];
      int v30 = 138413058;
      uint64_t v31 = v22;
      __int16 v32 = 2112;
      char v33 = v21;
      __int16 v34 = 2112;
      double v35 = v24;
      __int16 v36 = 2112;
      double v37 = v25;
      _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_ERROR, "self._currentTransitionDidComplete is nil! for toPresentationController : %@, self : %@ presentedViewController : %@, presentingViewController : %@", (uint8_t *)&v30, 0x2Au);
    }

LABEL_26:
  }
LABEL_3:
  double v4 = [*(id *)(a1 + 32) _currentTransitionDidComplete];

  if (v4)
  {
    double v5 = [*(id *)(a1 + 40) _currentTransitionDidComplete];

    if (v5)
    {
      uint64_t v6 = [*(id *)(a1 + 32) _currentTransitionDidComplete];
      v6[2](v6, 1);

      id v7 = [*(id *)(a1 + 40) _currentTransitionDidComplete];
      v7[2](v7, 1);

      if (*(unsigned char *)(a1 + 48))
      {
        uint64_t v8 = [*(id *)(a1 + 32) presentedViewController];
        [v8 endAppearanceTransition];
      }
      if (*(unsigned char *)(a1 + 49))
      {
        uint64_t v9 = [*(id *)(a1 + 40) presentedViewController];
        [v9 endAppearanceTransition];
      }
      if (*(unsigned char *)(a1 + 50))
      {
        double v10 = [*(id *)(a1 + 40) presentingViewController];
        [v10 endAppearanceTransition];
      }
      if (*(unsigned char *)(a1 + 51))
      {
        double v11 = [*(id *)(a1 + 32) presentedViewController];
        [v11 _setIsWrappingDuringAdaptation:0];
      }
      if (*(unsigned char *)(a1 + 52))
      {
        double v12 = [*(id *)(a1 + 40) presentedViewController];
        [v12 _setIsWrappingDuringAdaptation:0];
      }
      id v13 = [*(id *)(a1 + 32) presentedViewController];
      [v13 setPerformingModalTransition:0];

      [*(id *)(a1 + 32) setState:2];
      [*(id *)(a1 + 40) _cleanup];
      [*(id *)(a1 + 32) _setAdaptiveTransitionCoordinator:0];
      [*(id *)(a1 + 32) _setAdaptiveTransitionContext:0];
    }
  }
}

- (id)_firstCurrentContextChildInWindow
{
  return 0;
}

- (BOOL)_presentedViewControllerProvidesContentScrollView
{
  double v3 = [(UIPresentationController *)self presentedViewController];
  char v4 = [v3 _isTVSearchControllerContainer];

  if (v4)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = _UIBarsApplyChromelessEverywhere();
    if (v5)
    {
      if ([(UIPresentationController *)self shouldPresentInFullscreen])
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        LOBYTE(v5) = [(UIPresentationController *)self _shouldRespectDefinesPresentationContext];
      }
    }
  }
  return v5;
}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 0;
}

- (void)_windowSceneDidUpdateEffectiveGeometry:(id)a3
{
  id v18 = a3;
  char v4 = [v18 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = v18;
  if (isKindOfClass)
  {
    id v7 = [v18 object];
    uint64_t v8 = [(UIPresentationController *)self presentingViewController];
    if ([v8 isViewLoaded])
    {
      uint64_t v9 = [(UIPresentationController *)self presentingViewController];
      double v10 = [v9 view];
      double v11 = [v10 _window];
      double v12 = [v11 windowScene];

      if (v12 == v7) {
        [(UIPresentationController *)self _presentingViewControllerWindowSceneDidUpdateEffectiveGeometry:v7];
      }
    }
    else
    {
    }
    id v13 = [(UIPresentationController *)self presentedViewController];
    if ([v13 isViewLoaded])
    {
      uint64_t v14 = [(UIPresentationController *)self presentedViewController];
      uint64_t v15 = [v14 view];
      uint64_t v16 = [v15 _window];
      uint64_t v17 = [v16 windowScene];

      if (v17 == v7) {
        [(UIPresentationController *)self _presentedViewControllerWindowSceneDidUpdateEffectiveGeometry:v7];
      }
    }
    else
    {
    }
    uint64_t v6 = v18;
  }
}

- (id)_currentContextPresentationSuperview
{
  double v3 = [(UIPresentationController *)self _parentPresentationController];
  char v4 = v3;
  if (v3) {
    [v3 _presentationView];
  }
  else {
  int v5 = [(UIPresentationController *)self _fullscreenPresentationSuperview];
  }

  return v5;
}

uint64_t __77__UIPresentationController_runTransitionForCurrentStateAnimated_handoffData___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) transitionWasCancelled];
  if ((result & 1) == 0)
  {
    double v3 = (void *)UIApp;
    uint64_t v4 = *(void *)(a1 + 40);
    return [v3 _performBlockAfterCATransactionCommits:v4];
  }
  return result;
}

- (void)completeCurrentTransitionImmediately
{
  if ([(UIPresentationController *)self presenting]
    || [(UIPresentationController *)self dismissing])
  {
    BOOL v3 = +[UIViewPropertyAnimator _containsAnimatorForTrackedAnimationsUUID:self->_currentRunningAnimationsUUID];
    currentRunningAnimationsUUID = self->_currentRunningAnimationsUUID;
    if (v3)
    {
      int v5 = +[UIViewPropertyAnimator _animatorForTrackedAnimationsUUID:currentRunningAnimationsUUID];
      [v5 stopAnimation:0];
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __64__UIPresentationController_completeCurrentTransitionImmediately__block_invoke;
      v8[3] = &unk_1E52D9F70;
      id v9 = v5;
      id v6 = v5;
      +[UIViewController _performWithoutDeferringTransitions:v8];
    }
    else
    {
      +[UIView _stopAnimationWithUUID:currentRunningAnimationsUUID];
      id v7 = self->_currentRunningAnimationsUUID;
      +[UIView _finalizeStoppedAnimationWithUUID:v7 reverseAnimation:0 state:0 performCompletionsImmediately:1];
    }
  }
}

uint64_t __64__UIPresentationController_completeCurrentTransitionImmediately__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) finishAnimationAtPosition:0];
}

- (id)_descriptionForPrintingViewControllerHierarchy
{
  double v2 = (void *)MEMORY[0x1E4F28E78];
  if (self)
  {
    BOOL v3 = NSString;
    uint64_t v4 = self;
    int v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    id v7 = [v3 stringWithFormat:@"<%@: %p>", v6, v4];
  }
  else
  {
    id v7 = @"(nil)";
  }
  uint64_t v8 = [v2 stringWithString:v7];

  return v8;
}

- (BOOL)_shouldOccludeDuringPresentation
{
  return 0;
}

- (id)_passthroughViews
{
  return 0;
}

uint64_t __55__UIPresentationController__beginOcclusionIfNecessary___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if (result)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    BOOL v5 = *(unsigned char *)(a1 + 40) == 0;
    return [v4 _enableOcclusion:v5];
  }
  return result;
}

- (void)_coverWithSnapshot
{
  BOOL v3 = [(UIPresentationController *)self _presentationView];
  uint64_t v4 = [v3 snapshotViewAfterScreenUpdates:0];
  snapshotOverlayView = self->_snapshotOverlayView;
  self->_snapshotOverlayView = v4;

  id v6 = [(UIPresentationController *)self _presentationView];
  [v6 addSubview:self->_snapshotOverlayView];
}

- (CGRect)_frameForTransitionViewInPresentationSuperview:(id)a3
{
  [(UIPresentationController *)self _frameForTransitionViewInPresentationSuperview:a3 inWindow:0];
  result.size.double height = v6;
  result.size.double width = v5;
  result.origin.double y = v4;
  result.origin.double x = v3;
  return result;
}

- (void)_initViewHierarchyForPresentationSuperview:(id)a3
{
}

uint64_t __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_137(void *a1)
{
  double v2 = (void *)a1[5];
  [v2 bounds];
  objc_msgSend(v2, "convertRect:toView:", a1[6]);
  double v3 = (void *)a1[4];
  return objc_msgSend(v3, "setFrame:");
}

double __80__UIPresentationController__initViewHierarchyForPresentationSuperview_inWindow___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  if (([WeakRetained presenting] & 1) == 0
    && ![WeakRetained _transitioningTo])
  {
    if ((([WeakRetained dismissing] & 1) != 0
       || [WeakRetained _transitioningFrom])
      && [WeakRetained _shouldGrabPresentersView])
    {
      double v6 = [WeakRetained _parentPresentationControllerImmediate:1];
      if (v6) {
        goto LABEL_10;
      }
      id v7 = [WeakRetained presentingViewController];
      double v6 = [v7 parentViewController];

      if (v6) {
        goto LABEL_10;
      }
      uint64_t v8 = [WeakRetained presentingViewController];
      id v9 = [v8 _popoverController];
      double v6 = [v9 _managingSplitViewController];

      if (v6)
      {
LABEL_10:
        if (objc_opt_respondsToSelector())
        {
          double v10 = [WeakRetained presentingViewController];
          [v6 _frameForChildContentContainer:v10];
          double v12 = v11;
          double v14 = v13;
          double v16 = v15;
          double v18 = v17;

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = [v6 _presentationView];
          }
          else
          {
            id v19 = v3;
          }
          uint64_t v22 = v19;
          double v23 = [WeakRetained containerView];
          objc_msgSend(v22, "convertRect:toView:", v23, v12, v14, v16, v18);
          double v5 = v24;

          goto LABEL_15;
        }
      }
    }
    double v6 = [WeakRetained containerView];
    [v6 bounds];
    double v5 = v20;
LABEL_15:

    goto LABEL_16;
  }
  [WeakRetained frameOfPresentedViewInContainerView];
  double v5 = v4;
LABEL_16:

  return v5;
}

- (BOOL)_containerViewShouldIgnoreDirectTouchEvents
{
  id v3 = [(UIPresentationController *)self _transitionContext];
  double v4 = [v3 _animator];
  if ((objc_opt_respondsToSelector() & 1) != 0
    && [v4 prefersPreemptionEnabledForPresentations]
    && [(UIPresentationController *)self dismissing]
    && ([v3 isInteractive] & 1) == 0)
  {
    int v5 = [v3 transitionWasCancelled] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)_transitionToDidEnd
{
}

- (void)_transitionFromDidEnd
{
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double v2 = [(UIPresentationController *)self containerView];
  [v2 bounds];
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

- (CGRect)_frameOfPresentedViewControllerViewInSuperview
{
  double v2 = [(UIPresentationController *)self _presentationView];
  [v2 bounds];
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

- (UIView)presentedView
{
  double v2 = [(UIPresentationController *)self presentedViewController];
  double v3 = [v2 view];

  return (UIView *)v3;
}

- (BOOL)_forcesPreferredAnimationControllers
{
  return 0;
}

- (id)_preferredAnimationControllerForPresentation
{
  double v2 = [(UIPresentationController *)self _visualStyle];
  double v3 = [v2 preferredAnimationControllerForPresentation:1];

  return v3;
}

- (id)_preferredAnimationControllerForDismissal
{
  double v2 = [(UIPresentationController *)self _visualStyle];
  double v3 = [v2 preferredAnimationControllerForPresentation:0];

  return v3;
}

- (id)_preferredInteractionControllerForDismissal:(id)a3
{
  return 0;
}

- (UIModalPresentationStyle)presentationStyle
{
  double v2 = [(UIPresentationController *)self presentedViewController];
  double v3 = v2;
  if (v2) {
    UIModalPresentationStyle v4 = [v2 modalPresentationStyle];
  }
  else {
    UIModalPresentationStyle v4 = UIModalPresentationNone;
  }

  return v4;
}

- (UIModalPresentationStyle)adaptivePresentationStyle
{
  double v3 = [(UIPresentationController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0
    || ((UIModalPresentationStyle v4 = [v3 adaptivePresentationStyleForPresentationController:self],
         (unint64_t)(v4 + 1) <= 6)
      ? (BOOL v5 = ((1 << (v4 + 1)) & 0x43) == 0)
      : (BOOL v5 = 1),
        v5))
  {
    double v6 = [(UIPresentationController *)self traitCollection];
    double v7 = [v6 traitCollectionByModifyingTraits:&__block_literal_global_151];

    UIModalPresentationStyle v4 = [(UIPresentationController *)self _defaultPresentationStyleForTraitCollection:v7];
  }

  return v4;
}

void __53__UIPresentationController_adaptivePresentationStyle__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setHorizontalSizeClass:1];
  [v2 setVerticalSizeClass:2];
}

- (BOOL)_shouldAdaptFromTraitCollection:(id)a3 toTraitCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (dyld_program_sdk_at_least())
  {
    UIModalPresentationStyle v8 = [(UIPresentationController *)self adaptivePresentationStyleForTraitCollection:v7];
    if (((v8 != UIModalPresentationNone) ^ [(UIPresentationController *)self _isAdapted]))
    {
      BOOL v9 = 1;
    }
    else
    {
      double v11 = [(UIPresentationController *)self _activePresentationController];
      BOOL v9 = v8 != [v11 presentationStyle];
    }
  }
  else
  {
    uint64_t v10 = [v6 horizontalSizeClass];
    BOOL v9 = v10 != [v7 horizontalSizeClass];
  }

  return v9;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v19 = a4;
  uint64_t v7 = [(UIPresentationController *)self presentedViewController];
  UIModalPresentationStyle v8 = (void *)v7;
  if ((*(void *)(v7 + 376) & 0x40000000000000) != 0)
  {
    double v11 = [(id)v7 _existingView];
    [v11 frame];
    double v9 = v12;
    double v10 = v13;
  }
  else
  {
    double v9 = *(double *)(v7 + 440);
    double v10 = *(double *)(v7 + 448);
  }
  -[UIPresentationController sizeForChildContentContainer:withParentContainerSize:](self, "sizeForChildContentContainer:withParentContainerSize:", v8, width, height);
  double v16 = v15;
  double v17 = v14;
  if (v9 != v15 || v10 != v14) {
    goto LABEL_13;
  }
  if (v19) {
    [v19 targetTransform];
  }
  else {
    memset(&v20, 0, sizeof(v20));
  }
  if (!CGAffineTransformIsIdentity(&v20))
  {
LABEL_13:
    objc_msgSend(v8, "viewWillTransitionToSize:withTransitionCoordinator:", v19, v16, v17);
    *((double *)v8 + 55) = v16;
    *((double *)v8 + 56) = v17;
  }
}

- (void)_setPreferredContentSize:(CGSize)a3
{
  if (self->_preferredContentSize.width != a3.width || self->_preferredContentSize.height != a3.height)
  {
    self->_preferredContentSize = a3;
    BOOL v5 = [(UIPresentationController *)self _parentPresentationController];
    if (v5)
    {
      uint64_t v7 = v5;
      BOOL v6 = [(UIPresentationController *)self shouldPresentInFullscreen];
      BOOL v5 = v7;
      if (!v6)
      {
        [v7 preferredContentSizeDidChangeForChildContentContainer:self];
        BOOL v5 = v7;
      }
    }
  }
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  UIModalPresentationStyle v4 = [(UIPresentationController *)self presentedContentContainer];
  [v4 preferredContentSize];
  double v6 = v5;
  double v8 = v7;

  if (![(UIPresentationController *)self shouldRemovePresentersView])
  {
    double v9 = [(UIPresentationController *)self presentingViewController];
    [v9 preferredContentSize];
    double v11 = v10;
    double v13 = v12;

    if (v11 == *MEMORY[0x1E4F1DB30] && v13 == *(double *)(MEMORY[0x1E4F1DB30] + 8))
    {
      double v15 = [(UIPresentationController *)self presentingViewController];
      double v16 = [v15 view];
      [v16 bounds];
      double v18 = v17;
      double v20 = v19;

      [(UIPresentationController *)self _additionalSafeAreaInsets];
      double v13 = v20 - (v22 + v21);
      double v11 = v18 - (v23 + v24);
    }
    if (v6 < v11) {
      double v6 = v11;
    }
    if (v8 < v13) {
      double v8 = v13;
    }
  }
  -[UIPresentationController _setPreferredContentSize:](self, "_setPreferredContentSize:", v6, v8);
}

- (id)presentedContentContainer
{
  double v3 = [(UIPresentationController *)self _childPresentationController];
  UIModalPresentationStyle v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIPresentationController *)self presentedViewController];
  }
  double v6 = v5;

  return v6;
}

- (CGSize)preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_monitorsSystemLayoutFittingSize
{
  return self->_monitorsSystemLayoutFittingSize;
}

- (_UIFormSheetPresentationController)_adaptiveFormSheetPresentationController
{
  return 0;
}

- (id)_presentedViewControllerForPresentationController:(id)a3 traitCollection:(id)a4
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(WeakRetained, "presentationController:viewControllerForAdaptivePresentationStyle:", self, objc_msgSend(v5, "presentationStyle")), (double v7 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    double v7 = [(UIPresentationController *)self presentedViewController];
  }

  return v7;
}

- (id)_appearanceContainer
{
  if ([(UIPresentationController *)self shouldPresentInFullscreen])
  {
    double v3 = [(UIPresentationController *)self containerView];
    UIModalPresentationStyle v4 = [v3 _window];
  }
  else
  {
    UIModalPresentationStyle v4 = [(UIPresentationController *)self presentingViewController];
  }
  return v4;
}

- (Class)_appearanceGuideClass
{
  return 0;
}

+ (BOOL)_preventsAppearanceProxyCustomization
{
  return 0;
}

- (id)_traitTrace:(id)a3
{
  return _UITraitTraceForTraitEnvironmentAndQueryString(self, a3);
}

- (id)_traitTrace
{
  return [(UIPresentationController *)self _traitTrace:0];
}

- (id)_compatibleParentTraitEnvironment
{
  if ([(UIPresentationController *)self shouldPresentInFullscreen])
  {
    double v3 = [(UIPresentationController *)self presentedViewController];
    UIModalPresentationStyle v4 = [v3 _window];
  }
  else
  {
    UIModalPresentationStyle v4 = [(UIPresentationController *)self presentingViewController];
  }
  return v4;
}

- (id)traitOverrides
{
  traitOverrides = self->_traitOverrides;
  if (!traitOverrides)
  {
    UIModalPresentationStyle v4 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
    id v5 = self->_traitOverrides;
    self->_traitOverrides = v4;

    traitOverrides = self->_traitOverrides;
  }
  return traitOverrides;
}

- (void)_invalidateContainerViewLayout
{
}

- (id)registerForTraitChanges:(id)a3 withHandler:(id)a4
{
  id v6 = a4;
  double v7 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  double v8 = [(UIPresentationController *)self _registerForTraitTokenChanges:v7 withHandler:v6];

  return v8;
}

- (id)registerForTraitChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a4;
  double v9 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  double v10 = [(UIPresentationController *)self _registerForTraitTokenChanges:v9 withTarget:v8 action:a5];

  return v10;
}

- (id)registerForTraitChanges:(id)a3 withAction:(SEL)a4
{
  id v6 = +[UITraitCollection _traitTokensIncludingPlaceholdersForTraits:]((uint64_t)UITraitCollection, a3);
  double v7 = [(UIPresentationController *)self _registerForTraitTokenChanges:v6 withTarget:self action:a4];

  return v7;
}

- (id)_registerForTraitTokenChanges:(id)a3 withHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  traitChangeRegistrdouble y = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    double v9 = objc_alloc_init(_UITraitChangeRegistry);
    double v10 = self->_traitChangeRegistry;
    self->_traitChangeRegistrdouble y = v9;

    traitChangeRegistrdouble y = self->_traitChangeRegistry;
  }
  double v11 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withHandler:]((uint64_t)traitChangeRegistry, v6, v7);

  return v11;
}

- (id)_registerForTraitTokenChanges:(id)a3 withTarget:(id)a4 action:(SEL)a5
{
  id v8 = a3;
  double v9 = (UIPresentationController *)a4;
  traitChangeRegistrdouble y = self->_traitChangeRegistry;
  if (!traitChangeRegistry)
  {
    double v11 = objc_alloc_init(_UITraitChangeRegistry);
    double v12 = self->_traitChangeRegistry;
    self->_traitChangeRegistrdouble y = v11;

    traitChangeRegistrdouble y = self->_traitChangeRegistry;
  }
  double v13 = -[_UITraitChangeRegistry registerForTraitTokenChanges:withTarget:action:targetIsSender:]((uint64_t)traitChangeRegistry, v8, v9, a5, v9 == self);

  return v13;
}

- (void)unregisterForTraitChanges:(id)a3
{
}

- (void)_registerAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
  id v4 = a3;
  traitChangeRegistrdouble y = self->_traitChangeRegistry;
  id v8 = v4;
  if (!traitChangeRegistry)
  {
    id v6 = objc_alloc_init(_UITraitChangeRegistry);
    id v7 = self->_traitChangeRegistry;
    self->_traitChangeRegistrdouble y = v6;

    id v4 = v8;
    traitChangeRegistrdouble y = self->_traitChangeRegistry;
  }
  -[_UITraitChangeRegistry registerAuxiliaryChildEnvironmentForTraitInvalidations:]((uint64_t)traitChangeRegistry, v4);
}

- (void)_unregisterAuxiliaryChildEnvironmentForTraitInvalidations:(id)a3
{
}

- (void)_updateAuxiliaryChildTraitEnvironmentsIfNeeded
{
}

- (void)_compatibleUpdateTraitsIfNecessary
{
  id v5 = [(UIPresentationController *)self presentedViewController];
  if (v5 && dyld_program_sdk_at_least())
  {
    double v3 = [(UIPresentationController *)self _presentedViewForOverrideTraits];
    -[UIView _invalidateTraitCollectionAsRoot]((uint64_t)v3);

    id v4 = v5;
  }
  else
  {
    id v4 = self;
  }
  [(UIPresentationController *)v4 _updateTraitsIfNecessary];
}

- (void)setOverrideTraitCollection:(UITraitCollection *)overrideTraitCollection
{
  id v4 = overrideTraitCollection;
  traitOverrides = self->_traitOverrides;
  id v8 = v4;
  if (v4)
  {
    if (!traitOverrides)
    {
      id v6 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
      id v7 = self->_traitOverrides;
      self->_traitOverrides = v6;

      traitOverrides = self->_traitOverrides;
    }
  }
  else if (!traitOverrides)
  {
    goto LABEL_6;
  }
  -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)traitOverrides, v8);
  id v4 = v8;
LABEL_6:
}

- (UITraitCollection)overrideTraitCollection
{
  return (UITraitCollection *)-[UIBarButtonItemGroup _items]((id *)&self->_traitOverrides->super.isa);
}

- (void)_setInternalOverrideTraitCollection:(id)a3
{
  id v4 = a3;
  traitOverrides = self->_traitOverrides;
  id v9 = v4;
  if (v4)
  {
    if (!traitOverrides)
    {
      id v6 = (_UITraitOverrides *)-[_UITraitOverrides initWithDelegate:]([_UITraitOverrides alloc], self);
      id v7 = self->_traitOverrides;
      self->_traitOverrides = v6;

      traitOverrides = self->_traitOverrides;
    }
  }
  else if (!traitOverrides)
  {
    goto LABEL_6;
  }
  id v8 = -[_UITraitOverrides _overridesAppliedBefore](traitOverrides);
  -[_UITraitOverrides _replaceOverrideTraitCollection:]((uint64_t)v8, v9);

LABEL_6:
}

- (UITraitCollection)_internalOverrideTraitCollection
{
  -[_UITraitOverrides _overridesAppliedBefore](&self->_traitOverrides->super.isa);
  id v2 = (id *)objc_claimAutoreleasedReturnValue();
  double v3 = -[UIBarButtonItemGroup _items](v2);

  return (UITraitCollection *)v3;
}

- (BOOL)_shouldPerformWillTransitionToTraitCollectionForParent:(id)a3
{
  id v4 = a3;
  id v5 = [(UIPresentationController *)self _parentTraitEnvironment];

  if (v5 == v4)
  {
    BOOL v7 = 1;
  }
  else if (_UIPresentationControllersInheritTraitsFromViewHierarchy())
  {
    id v6 = [(UIPresentationController *)self _compatibleParentTraitEnvironment];
    BOOL v7 = v6 == v4;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)_parent:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v10 = a4;
  id v8 = a5;
  if ([(UIPresentationController *)self _shouldPerformWillTransitionToTraitCollectionForParent:a3])
  {
    id v9 = [(UIPresentationController *)self _adaptiveWillTransitionToTraitCollection:v10 withTransitionCoordinator:v8];
  }
}

- (void)_window:(id)a3 willTransitionToTraitCollection:(id)a4 withTransitionCoordinator:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  if ([(UIPresentationController *)self _shouldPerformWillTransitionToTraitCollectionForParent:v10])
  {
    [(UIPresentationController *)self _adaptiveWillTransitionToTraitCollection:v9 withTransitionCoordinator:v8];
  }
  else
  {
    [(UIPresentationController *)self _childPresentationController];
  }
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  [v11 _window:v10 willTransitionToTraitCollection:v9 withTransitionCoordinator:v8];
}

- (id)_adaptiveWillTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(UIPresentationController *)self traitCollection];
  id v9 = [(UIPresentationController *)self presentingViewController];
  id v10 = [v9 _adaptedPresentationControllerForTraitCollection:v6 withTransitionCoordinator:v7];

  if (v10) {
    id v11 = v10;
  }
  else {
    id v11 = self;
  }
  double v12 = v11;
  id v13 = v6;
  traitOverrides = self->_traitOverrides;
  double v15 = v13;
  if (traitOverrides)
  {
    double v15 = -[_UITraitOverrides _traitCollectionByApplyingOverridesToTraitCollection:](v12[3], v13);
  }
  if (v15 != v8 && ([v8 isEqual:v15] & 1) == 0)
  {
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    double v20 = __95__UIPresentationController__adaptiveWillTransitionToTraitCollection_withTransitionCoordinator___block_invoke;
    double v21 = &unk_1E52DD450;
    double v22 = v12;
    id v23 = v8;
    id v24 = v15;
    id v25 = v7;
    +[UIViewController _performWithoutDeferringTransitions:&v18];
  }
  double v16 = objc_msgSend(v12, "presentedViewController", v18, v19, v20, v21);

  return v16;
}

uint64_t __95__UIPresentationController__adaptiveWillTransitionToTraitCollection_withTransitionCoordinator___block_invoke(uint64_t *a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v2 = self;
  BOOL v3 = _UIShouldLogTraitCollectionChangeForInstanceAndMethod(v2, a1[4], (uint64_t)sel_willTransitionToTraitCollection_withTransitionCoordinator_);

  if (v3)
  {
    id v5 = *(NSObject **)(__UILogGetCategoryCachedImpl("TraitCollectionChange", &_UIInternalPreference_PresentationControllersInheritTraitsFromViewHierarchy_block_invoke_4___s_category)+ 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = v5;
      id v7 = NSStringFromSelector(sel_willTransitionToTraitCollection_withTransitionCoordinator_);
      uint64_t v8 = a1[4];
      id v9 = +[UITraitCollection _descriptionForChangeFromTraitCollection:a1[5] toTraitCollection:a1[6]];
      uint64_t v10 = a1[5];
      uint64_t v11 = a1[6];
      int v12 = 138413314;
      id v13 = v7;
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      __int16 v16 = 2112;
      double v17 = v9;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      __int16 v20 = 2112;
      uint64_t v21 = v11;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_ERROR, "Sending -%@ to %@\n\t► trait changes: %@\n\t► current: %@\n\t► new: %@", (uint8_t *)&v12, 0x34u);
    }
  }
  return [(id)a1[4] willTransitionToTraitCollection:a1[6] withTransitionCoordinator:a1[7]];
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(UIPresentationController *)self presentedViewController];
  [v8 _parent:self willTransitionToTraitCollection:v7 withTransitionCoordinator:v6];
}

- (id)_viewsParticipatingInNavigationControllerTransition
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = [(UIPresentationController *)self presentedViewController];
  BOOL v3 = [v2 view];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (id)_animatorForContainmentTransition
{
  return 0;
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  id v2 = [(UIPresentationController *)self containerView];
  BOOL v3 = [v2 superview];

  return (UIFocusEnvironment *)v3;
}

- (UIFocusItemContainer)focusItemContainer
{
  id v2 = [(UIPresentationController *)self containerView];
  BOOL v3 = [v2 superview];

  return (UIFocusItemContainer *)v3;
}

- (UIView)preferredFocusedView
{
  id v2 = [(UIPresentationController *)self presentedViewController];
  BOOL v3 = [v2 preferredFocusedView];

  return (UIView *)v3;
}

- (int64_t)_subclassPreferredFocusedViewPrioritizationType
{
  if (!qword_1EB25FF80)
  {
    qword_1EB25FF80 = +[UIPresentationController instanceMethodForSelector:sel_preferredFocusedView];
    qword_1EB25FF88 = +[UIPresentationController instanceMethodForSelector:sel_preferredFocusEnvironments];
  }
  uint64_t v3 = [(UIPresentationController *)self methodForSelector:sel_preferredFocusedView];
  uint64_t v4 = [(UIPresentationController *)self methodForSelector:sel_preferredFocusEnvironments];
  if (v3) {
    BOOL v5 = v3 == qword_1EB25FF80;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5) {
    return 0;
  }
  if (v4) {
    BOOL v7 = v4 == qword_1EB25FF88;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 1;
  }
  else {
    return 2;
  }
}

- (NSArray)preferredFocusEnvironments
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIPresentationController *)self presentedViewController];
  uint64_t v4 = (void *)v3;
  if (v3)
  {
    v8[0] = v3;
    BOOL v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = _UIFocusEnvironmentCombinedPreferredFocusEnvironments(self, v5, [(UIPresentationController *)self _subclassPreferredFocusedViewPrioritizationType]);

  return (NSArray *)v6;
}

- (void)updateFocusIfNeeded
{
  id v2 = +[UIFocusSystem focusSystemForEnvironment:self];
  [v2 updateFocusIfNeeded];
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (BOOL)_gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6 = (UITapGestureRecognizer *)a3;
  id v7 = a4;
  id v8 = v7;
  BOOL v9 = self->_backGestureRecognizer == v6 && ([v7 _isGestureType:8] & 1) != 0;

  return v9;
}

- (BOOL)_gestureRecognizerShouldBegin:(id)a3
{
  return self->_backGestureRecognizer != a3 || [(UIPresentationController *)self presented];
}

- (void)_performBackGesture:(id)a3
{
  uint64_t v4 = [(UIPresentationController *)self containerView];
  BOOL v5 = [v4 _window];
  id v8 = [v5 _focusResponder];

  id v6 = [(UIPresentationController *)self presentedViewController];
  LODWORD(v5) = [v6 _containsResponder:v8];

  if (v5)
  {
    id v7 = [(UIPresentationController *)self presentedViewController];
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_disableMenuPressForBackGesture
{
  uint64_t v3 = [(UIGestureRecognizer *)self->_backGestureRecognizer view];
  [v3 removeGestureRecognizer:self->_backGestureRecognizer];

  backGestureRecognizer = self->_backGestureRecognizer;
  self->_backGestureRecognizer = 0;
}

- (BOOL)_isModal
{
  uint64_t v3 = [(UIPresentationController *)self _childPresentationController];
  uint64_t v4 = v3;
  if (!v3 || ![v3 _presentingOrPresented])
  {
    id v6 = [(UIPresentationController *)self presentedViewController];
LABEL_6:
    id v7 = v6;
    char v5 = [v6 isModalInPresentation];

    goto LABEL_7;
  }
  if (([v4 _isModal] & 1) == 0)
  {
    if ([(UIPresentationController *)self shouldRemovePresentersView])
    {
      char v5 = 0;
      goto LABEL_7;
    }
    id v6 = [(UIPresentationController *)self presentingViewController];
    goto LABEL_6;
  }
  char v5 = 1;
LABEL_7:

  return v5;
}

- (void)_sendDismissalsAsNeeded
{
  [(UIPresentationController *)self _sendWillDismiss];
  uint64_t v3 = [(UIPresentationController *)self _definiteTransitionCoordinator];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__UIPresentationController__sendDismissalsAsNeeded__block_invoke;
  v4[3] = &unk_1E52DA598;
  v4[4] = self;
  [v3 animateAlongsideTransition:0 completion:v4];
}

uint64_t __51__UIPresentationController__sendDismissalsAsNeeded__block_invoke(uint64_t a1, void *a2)
{
  uint64_t result = [a2 isCancelled];
  if ((result & 1) == 0)
  {
    uint64_t v4 = *(void **)(a1 + 32);
    return [v4 _sendDidDismiss];
  }
  return result;
}

- (BOOL)_shouldDismiss
{
  if ([(UIPresentationController *)self _isModal]) {
    return 0;
  }
  uint64_t v4 = [(UIPresentationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIPresentationController *)self delegate];
    char v7 = [v6 presentationControllerShouldDismiss:self];

    return v7;
  }
  else
  {
    return [(UIPresentationController *)self _fallbackShouldDismiss];
  }
}

- (void)_sendWillDismiss
{
  uint64_t v3 = [(UIPresentationController *)self presentedViewController];
  [v3 _presentationControllerWillDismiss:self];

  uint64_t v4 = [(UIPresentationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIPresentationController *)self delegate];
    [v6 presentationControllerWillDismiss:self];
  }
  else
  {
    [(UIPresentationController *)self _sendFallbackWillDismiss];
  }
}

- (void)_sendDidDismiss
{
  uint64_t v3 = [(UIPresentationController *)self presentedViewController];
  [v3 _presentationControllerDidDismiss:self];

  uint64_t v4 = [(UIPresentationController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(UIPresentationController *)self delegate];
    [v6 presentationControllerDidDismiss:self];
  }
  else
  {
    [(UIPresentationController *)self _sendFallbackDidDismiss];
  }
}

- (void)_sendDidAttemptToDismiss
{
  uint64_t v3 = [(UIPresentationController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(UIPresentationController *)self delegate];
    [v5 presentationControllerDidAttemptToDismiss:self];
  }
}

- (BOOL)_fallbackShouldDismiss
{
  return 1;
}

- (BOOL)_shouldSavePresentedViewControllerForStateRestoration
{
  return 1;
}

- (BOOL)_requiresDeferralToCoordinateWithNavigationTransitionAnimated:(BOOL)a3
{
  return 0;
}

- (BOOL)_canPresentInSeparateScene
{
  if (_UIApplicationIsExtension()) {
    return 0;
  }
  else {
    return ![(UIPresentationController *)self _forcePresentationInPresenterScene];
  }
}

- (BOOL)_handlesKeyboardAvoidance
{
  return 0;
}

- (BOOL)_allowsFocusInPresentingViewController
{
  return 0;
}

- (int64_t)_preferredContainerBackgroundStyle
{
  return 2;
}

- (CGSize)_preferredContentSize
{
  double width = self->_preferredContentSize.width;
  double height = self->_preferredContentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)_forcePresentationInPresenterScene
{
  return self->_forcePresentationInPresenterScene;
}

- (id)_pendingFocusEnvironmentUnlock
{
  return self->__pendingFocusEnvironmentUnlock;
}

- (UIViewController)_sourceViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__sourceViewController);
  return (UIViewController *)WeakRetained;
}

- (BOOL)_isPresentedViewControllerStoredWeakly
{
  return self->__presentedViewControllerStoredWeakly;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_int64_t state = a3;
}

- (UIViewControllerTransitionCoordinator)_adaptiveTransitionCoordinator
{
  return self->_adaptiveTransitionCoordinator;
}

- (UIViewControllerTransitionCoordinatorContext)_adaptiveTransitionContext
{
  return self->_adaptiveTransitionContext;
}

- (BOOL)_changedPresentingViewControllerDuringAdaptation
{
  return self->_changedPresentingViewControllerDuringAdaptation;
}

- (void)_setChangedPresentingViewControllerDuringAdaptation:(BOOL)a3
{
  self->_changedPresentingViewControllerDuringAdaptation = a3;
}

- (void)set_containerSuperviewForCurrentTransition:(id)a3
{
}

- (UIView)_viewForRemoteTextEffectsWindowMatchAnimation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__viewForRemoteTextEffectsWindowMatchAnimation);
  return (UIView *)WeakRetained;
}

- (void)_setShouldContinueTouchesOnTargetViewController:(BOOL)a3
{
  self->_shouldContinueTouchesOnTargetViewController = a3;
}

- (UIView)_customViewForTouchContinuation
{
  return self->_customViewForTouchContinuation;
}

- (void)_setCustomViewForTouchContinuation:(id)a3
{
}

- (BOOL)isCurrentStateCancelled
{
  return self->_isCurrentStateCancelled;
}

@end