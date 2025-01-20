@interface SBTransientOverlayViewController
- (BOOL)_isKeyboardVisibleForSpringBoard;
- (BOOL)allowsStackingOverlayContentAbove;
- (BOOL)canBecomeLocalFirstResponder;
- (BOOL)dismissesForCoverSheetPresentation;
- (BOOL)dismissesSiriForPresentation;
- (BOOL)handleDoubleHeightStatusBarTap;
- (BOOL)handleHeadsetButtonPress:(BOOL)a3;
- (BOOL)handleHomeButtonDoublePress;
- (BOOL)handleHomeButtonLongPress;
- (BOOL)handleHomeButtonPress;
- (BOOL)handleLockButtonPress;
- (BOOL)handleVoiceCommandButtonPress;
- (BOOL)handleVolumeDownButtonPress;
- (BOOL)handleVolumeUpButtonPress;
- (BOOL)hasVisibleStatusBar;
- (BOOL)hidEventDeferringDisabled;
- (BOOL)isAttachedToWindowedAccessory;
- (BOOL)isContentOpaque;
- (BOOL)isDisplayLayoutElementActive;
- (BOOL)isIgnoringAppearanceUpdates;
- (BOOL)isIgnoringContentOverlayInsetUpdates;
- (BOOL)isPresentedByBundleIdentifier:(id)a3;
- (BOOL)isPresentedByProcess:(id)a3;
- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3;
- (BOOL)prefersContinuityDisplayPresentation;
- (BOOL)prefersEmbeddedDisplayPresentation;
- (BOOL)prefersProximityDetectionEnabled;
- (BOOL)prefersStatusBarActivityItemVisible;
- (BOOL)prefersWindowHitTestingDisabled;
- (BOOL)presentationAllowsHomeGrabberAutoHide;
- (BOOL)presentationDimmingViewHidden;
- (BOOL)presentationPrefersStatusBarHidden;
- (BOOL)preservesAppSwitcherDuringPresentationAndDismissal;
- (BOOL)preventsClippingToBounds;
- (BOOL)preventsDismissalOnLockForInactiveScreen;
- (BOOL)preventsSystemApertureSuppressionFromBelow;
- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3;
- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3;
- (BOOL)shouldAutorotate;
- (BOOL)shouldDisableBanners;
- (BOOL)shouldDisableControlCenter;
- (BOOL)shouldDisableInteractiveScreenshotGesture;
- (BOOL)shouldDisableOrientationUpdates;
- (BOOL)shouldDisableReachability;
- (BOOL)shouldDisableSiri;
- (BOOL)shouldPendAlertItems;
- (BOOL)shouldPreventDragAndDrop;
- (BOOL)shouldUseSceneBasedKeyboardFocus;
- (BOOL)supportsAlwaysOnDisplay;
- (CGAffineTransform)presentationContentTransform;
- (CGAffineTransform)presentationHomeGrabberTransform;
- (CGRect)_currentStatusBarFrameForStyle:(int64_t)a3;
- (CGRect)windowedAccessoryCutoutFrameInScreen;
- (FBScene)sceneForClientSettings;
- (NSNumber)preferredSceneDeactivationReasonValue;
- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture;
- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture;
- (NSSet)audioCategoriesDisablingVolumeHUD;
- (NSSet)preferredBackgroundActivitiesToSuppress;
- (NSString)description;
- (NSString)preferredDisplayLayoutElementIdentifier;
- (SBDisplayItem)representedDisplayItem;
- (SBHomeGrabberView)grabberView;
- (SBIdleTimerCoordinating)idleTimerCoordinator;
- (SBSDisplayLayoutElement)_displayLayoutElement;
- (SBTransientOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (SBTransientOverlayViewControllerDelegate)transientOverlayDelegate;
- (UIColor)presentationDimmingViewColor;
- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4;
- (UIStatusBarStyleRequest)currentStatusBarStyleRequest;
- (UIView)backgroundView;
- (UIView)contentView;
- (_UILegibilitySettings)preferredStatusBarLegibilitySettings;
- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3;
- (double)presentationContentCornerRadius;
- (double)presentationDimmingAlpha;
- (double)presentationHomeGrabberAdditionalEdgeSpacing;
- (double)presentationHomeGrabberAlpha;
- (id)_newHomeGrabberViewWithFrame:(CGRect)a3;
- (id)coordinatorRequestedIdleTimerBehavior:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)hostedSceneIdentityTokens;
- (id)keyboardFocusTarget;
- (id)newTransientOverlayDismissalTransitionCoordinator;
- (id)newTransientOverlayPresentationTransitionCoordinator;
- (id)sceneDeactivationPredicate;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (int)pictureInPictureProcessIdentifier;
- (int64_t)containerOrientation;
- (int64_t)homeAffordanceSuppression;
- (int64_t)idleTimerDuration;
- (int64_t)idleTimerMode;
- (int64_t)idleWarnMode;
- (int64_t)preferredInterfaceOrientationForPresentation;
- (int64_t)preferredLockedGestureDismissalStyle;
- (int64_t)preferredUnlockedGestureDismissalStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_applyStatusBarStyleRequestWithInitialStatusBarSettings:(id)a3;
- (void)_invalidateKeyboardHomeAffordanceAssertion;
- (void)_keyboardWillHideNotification:(id)a3;
- (void)_keyboardWillShowNotification:(id)a3;
- (void)_updateGrabberViewConfiguration;
- (void)_updateGrabberViewHiddenConfigurationAnimated:(BOOL)a3;
- (void)addPresentationBackgroundView:(id)a3;
- (void)beginIgnoringAppearanceUpdates;
- (void)beginIgnoringContentOverlayInsetUpdates;
- (void)dealloc;
- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4;
- (void)endIgnoringAppearanceUpdates;
- (void)endIgnoringContentOverlayInsetUpdates;
- (void)preserveInputViewsAnimated:(BOOL)a3;
- (void)removePresentationBackgroundView:(id)a3;
- (void)restoreInputViewsAnimated:(BOOL)a3;
- (void)setContainerOrientation:(int64_t)a3;
- (void)setDisplayLayoutElementActive:(BOOL)a3;
- (void)setGrabberView:(id)a3;
- (void)setHomeGrabberPointerClickDelegate:(id)a3;
- (void)setIdleTimerCoordinator:(id)a3;
- (void)setNeedsAudioCategoriesDisablingVolumeHUDUpdate;
- (void)setNeedsContentOpaqueUpdate;
- (void)setNeedsFeaturePolicyUpdate;
- (void)setNeedsGestureDismissalStyleUpdate;
- (void)setNeedsHIDEventDeferringDisabledUpdate;
- (void)setNeedsIdleTimerReset;
- (void)setNeedsOrientationUpdatesDisabledUpdate;
- (void)setNeedsProximityDetectionUpdate;
- (void)setNeedsSceneDeactivationUpdate;
- (void)setNeedsStatusBarAppearanceUpdate;
- (void)setNeedsUpdateOfSupportedInterfaceOrientations;
- (void)setNeedsWhitePointAdaptivityStyleUpdate;
- (void)setNeedsWindowHitTestingUpdate;
- (void)setPresentationAllowsHomeGrabberAutoHide:(BOOL)a3;
- (void)setPresentationContentCornerRadius:(double)a3;
- (void)setPresentationContentTransform:(CGAffineTransform *)a3;
- (void)setPresentationDimmingAlpha:(double)a3;
- (void)setPresentationDimmingViewHidden:(BOOL)a3;
- (void)setPresentationHomeGrabberAdditionalEdgeSpacing:(double)a3;
- (void)setPresentationHomeGrabberAlpha:(double)a3;
- (void)setPresentationHomeGrabberTransform:(CGAffineTransform *)a3;
- (void)setPresentationPrefersHomeGrabberHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setPresentationPrefersStatusBarHidden:(BOOL)a3;
- (void)setPresentationPrefersStatusBarHidden:(BOOL)a3 initialStatusBarSettings:(id)a4;
- (void)setTransientOverlayDelegate:(id)a3;
- (void)updateDisplayLayoutElementWithBuilder:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation SBTransientOverlayViewController

- (SBTransientOverlayViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v13.receiver = self;
  v13.super_class = (Class)SBTransientOverlayViewController;
  v4 = [(SBTransientOverlayViewController *)&v13 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    uint64_t v5 = [MEMORY[0x1E4FA5F28] rootSettings];
    v6 = (void *)*((void *)v4 + 127);
    *((void *)v4 + 127) = v5;

    *((void *)v4 + 157) = 0x3FF0000000000000;
    v7 = (long long *)MEMORY[0x1E4F1DAB8];
    long long v8 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    *(_OWORD *)(v4 + 1336) = v8;
    long long v10 = *v7;
    long long v9 = v7[1];
    *(_OWORD *)(v4 + 1304) = *v7;
    *(_OWORD *)(v4 + 1320) = v9;
    *(_OWORD *)(v4 + 1352) = v10;
    *(_OWORD *)(v4 + 1368) = v9;
    *(_OWORD *)(v4 + 1384) = v8;
    *((void *)v4 + 134) = 0x7FFFFFFFFFFFFFFFLL;
    *((void *)v4 + 132) = 0x7FFFFFFFFFFFFFFFLL;
    v4[1109] = 1;
    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v4 selector:sel__keyboardWillHideNotification_ name:*MEMORY[0x1E4F43B80] object:0];
    [v11 addObserver:v4 selector:sel__keyboardWillShowNotification_ name:*MEMORY[0x1E4F43B88] object:0];
    [v4 setPresentationDimmingViewHidden:1];
  }
  return (SBTransientOverlayViewController *)v4;
}

- (void)dealloc
{
  if (self->_statusBar)
  {
    v3 = [(UIViewController *)self _sbWindowScene];
    v4 = [v3 statusBarManager];
    uint64_t v5 = [v4 reusePool];
    [v5 recycleStatusBar:self->_statusBar];
  }
  [(SBTransientOverlayViewController *)self _invalidateKeyboardHomeAffordanceAssertion];
  [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
  v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v6 removeObserver:self name:*MEMORY[0x1E4F43B80] object:0];
  [v6 removeObserver:self name:*MEMORY[0x1E4F43B88] object:0];

  v7.receiver = self;
  v7.super_class = (Class)SBTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v7 dealloc];
}

- (NSString)description
{
  return (NSString *)[(SBTransientOverlayViewController *)self descriptionWithMultilinePrefix:0];
}

- (id)succinctDescription
{
  v2 = [(SBTransientOverlayViewController *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(SBTransientOverlayViewController *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (BOOL)handleHeadsetButtonPress:(BOOL)a3
{
  return 0;
}

- (BOOL)handleHomeButtonPress
{
  return 1;
}

- (BOOL)handleHomeButtonDoublePress
{
  return 0;
}

- (BOOL)handleHomeButtonLongPress
{
  return 1;
}

- (BOOL)handleLockButtonPress
{
  return 0;
}

- (BOOL)handleVoiceCommandButtonPress
{
  return 0;
}

- (BOOL)handleVolumeUpButtonPress
{
  return 0;
}

- (BOOL)handleVolumeDownButtonPress
{
  return 0;
}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  return self->_presentationHomeGrabberAdditionalEdgeSpacing;
}

- (BOOL)shouldAllowThinStyleForHomeGrabberView:(id)a3
{
  return 1;
}

- (BOOL)shouldAllowAutoHideForHomeGrabberView:(id)a3
{
  return self->_presentationAllowsHomeGrabberAutoHide;
}

- (int64_t)idleTimerDuration
{
  return 12;
}

- (int64_t)idleTimerMode
{
  return 1;
}

- (int64_t)idleWarnMode
{
  return 2;
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior behaviorForBehaviorProvider:self];
}

- (SBSDisplayLayoutElement)_displayLayoutElement
{
  displayLayoutElement = self->_displayLayoutElement;
  if (!displayLayoutElement)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FA6A68]);
    uint64_t v5 = [(SBTransientOverlayViewController *)self preferredDisplayLayoutElementIdentifier];
    v6 = (SBSDisplayLayoutElement *)[v4 initWithIdentifier:v5];
    objc_super v7 = self->_displayLayoutElement;
    self->_displayLayoutElement = v6;

    displayLayoutElement = self->_displayLayoutElement;
  }
  return displayLayoutElement;
}

- (void)updateDisplayLayoutElementWithBuilder:(id)a3
{
  v16 = (void (**)(id, void *))a3;
  uint64_t v5 = [(SBTransientOverlayViewController *)self _displayLayoutElement];
  if (self->_displayLayoutElementAssertion)
  {
    v6 = [(UIViewController *)self _sbWindowScene];
    if (!v6)
    {
      v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBTransientOverlayViewController.m", 220, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    objc_super v7 = [v6 displayLayoutPublisher];
    if (!v7)
    {
      v15 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTransientOverlayViewController.m", 220, @"No publisher for window scene: %@; self: %@",
        v6,
        self);
    }
    long long v8 = (objc_class *)objc_opt_class();
    long long v9 = NSStringFromClass(v8);
    long long v10 = [v7 transitionAssertionWithReason:v9];

    [(BSInvalidatable *)self->_displayLayoutElementAssertion invalidate];
    displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;

    v16[2](v16, v5);
    v12 = [v7 addElement:v5];
    objc_super v13 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v12;

    [v10 invalidate];
  }
  else
  {
    v16[2](v16, v5);
  }
}

- (void)setDisplayLayoutElementActive:(BOOL)a3
{
  displayLayoutElementAssertion = self->_displayLayoutElementAssertion;
  if (a3)
  {
    if (displayLayoutElementAssertion) {
      return;
    }
    uint64_t v13 = [(SBTransientOverlayViewController *)self _displayLayoutElement];
    v6 = [(UIViewController *)self _sbWindowScene];
    if (!v6)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, self, @"SBTransientOverlayViewController.m", 242, @"No window scene to get a publisher: %@", self object file lineNumber description];
    }
    objc_super v7 = [v6 displayLayoutPublisher];
    if (!v7)
    {
      v12 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SBTransientOverlayViewController.m", 242, @"No publisher for window scene: %@; self: %@",
        v6,
        self);
    }
    long long v8 = [v7 addElement:v13];
    long long v9 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = v8;

    long long v10 = (BSInvalidatable *)v13;
  }
  else
  {
    if (!displayLayoutElementAssertion) {
      return;
    }
    [(BSInvalidatable *)displayLayoutElementAssertion invalidate];
    long long v10 = self->_displayLayoutElementAssertion;
    self->_displayLayoutElementAssertion = 0;
  }
}

- (BOOL)isDisplayLayoutElementActive
{
  return self->_displayLayoutElementAssertion != 0;
}

- (int64_t)preferredInterfaceOrientationForPresentation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  int64_t v4 = [WeakRetained defaultPreferredInterfaceOrientationForPresentationForTransientOverlayViewController:self];

  return v4;
}

- (void)setNeedsStatusBarAppearanceUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsStatusBarAppearanceUpdate:self];

  [(SBTransientOverlayViewController *)self _applyStatusBarStyleRequestWithInitialStatusBarSettings:0];
}

- (void)setNeedsWhitePointAdaptivityStyleUpdate
{
  id v3 = [(SBTransientOverlayViewController *)self transientOverlayDelegate];
  [v3 transientOverlayViewControllerNeedsWhitePointAdaptivityStyleUpdate:self];
}

- (unint64_t)supportedInterfaceOrientations
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  unint64_t v4 = [WeakRetained defaultSupportedInterfaceOrientationsForTransientOverlayViewController:self];

  return v4;
}

- (BOOL)shouldAutorotate
{
  if (SBTraitsArbiterOrientationActuationEnabledForRole(@"SBTraitsParticipantRoleTransientOverlay")) {
    return 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  char v5 = [WeakRetained defaultShouldAutorotateForTransientOverlayViewController:self];

  return v5;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 viewDidAppear:a3];
  if (![(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates]) {
    [(SBTransientOverlayViewController *)self setDisplayLayoutElementActive:1];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v4 viewDidDisappear:a3];
  if (![(SBTransientOverlayViewController *)self isIgnoringAppearanceUpdates]) {
    [(SBTransientOverlayViewController *)self setDisplayLayoutElementActive:0];
  }
}

- (void)viewDidLayoutSubviews
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)SBTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v25 viewDidLayoutSubviews];
  id v3 = [(SBTransientOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  -[UIView setFrame:](self->_backgroundView, "setFrame:");
  -[UIView setFrame:](self->_presentationBackgroundView, "setFrame:", v5, v7, v9, v11);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v12 = [(UIView *)self->_presentationBackgroundView subviews];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        [(UIView *)self->_presentationBackgroundView bounds];
        objc_msgSend(v17, "setFrame:");
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v14);
  }

  -[UIView sb_setBoundsAndPositionFromFrame:](self->_contentContainerView, "sb_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  -[UIView sb_setBoundsAndPositionFromFrame:](self->_homeGrabberContainerView, "sb_setBoundsAndPositionFromFrame:", v5, v7, v9, v11);
  contentView = self->_contentView;
  [(UIView *)self->_contentContainerView bounds];
  -[UIView setFrame:](contentView, "setFrame:");
  grabberView = self->_grabberView;
  [(UIView *)self->_homeGrabberContainerView bounds];
  -[SBHomeGrabberView setFrame:](grabberView, "setFrame:");
  statusBar = self->_statusBar;
  [(SBTransientOverlayViewController *)self _currentStatusBarFrameForStyle:[(UIStatusBar *)statusBar currentStyle]];
  -[UIStatusBar setFrame:](statusBar, "setFrame:");
  -[UIView setFrame:](self->_dimmingView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  v30.receiver = self;
  v30.super_class = (Class)SBTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v30 viewDidLoad];
  id v3 = [(SBTransientOverlayViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  v12 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v4, v6, v8, v10);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v12;

  [v3 addSubview:self->_backgroundView];
  if ([(SBTransientOverlayViewController *)self preventsClippingToBounds]) {
    uint64_t v14 = 0;
  }
  else {
    uint64_t v14 = BSFloatGreaterThanFloat();
  }
  uint64_t v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
  contentContainerView = self->_contentContainerView;
  self->_contentContainerView = v15;

  [(UIView *)self->_contentContainerView _setContinuousCornerRadius:self->_presentationContentCornerRadius];
  [(UIView *)self->_contentContainerView setClipsToBounds:v14];
  v17 = self->_contentContainerView;
  long long v18 = *(_OWORD *)&self->_presentationContentTransform.c;
  long long v27 = *(_OWORD *)&self->_presentationContentTransform.a;
  long long v28 = v18;
  long long v29 = *(_OWORD *)&self->_presentationContentTransform.tx;
  [(UIView *)v17 setTransform:&v27];
  [v3 addSubview:self->_contentContainerView];
  v19 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA6028]), "initWithFrame:", v5, v7, v9, v11);
  homeGrabberContainerView = self->_homeGrabberContainerView;
  self->_homeGrabberContainerView = v19;

  [(UIView *)self->_homeGrabberContainerView _setContinuousCornerRadius:self->_presentationContentCornerRadius];
  [(UIView *)self->_homeGrabberContainerView setClipsToBounds:v14];
  long long v21 = self->_homeGrabberContainerView;
  long long v22 = *(_OWORD *)&self->_presentationHomeGrabberTransform.c;
  long long v27 = *(_OWORD *)&self->_presentationHomeGrabberTransform.a;
  long long v28 = v22;
  long long v29 = *(_OWORD *)&self->_presentationHomeGrabberTransform.tx;
  [(UIView *)v21 setTransform:&v27];
  [v3 addSubview:self->_homeGrabberContainerView];
  long long v23 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v7, v9, v11);
  contentView = self->_contentView;
  self->_contentView = v23;

  [(UIView *)self->_contentContainerView addSubview:self->_contentView];
  if (self->_statusBar) {
    -[UIView addSubview:](self->_contentContainerView, "addSubview:");
  }
  if (SBFEffectiveHomeButtonType() == 2)
  {
    objc_super v25 = -[SBTransientOverlayViewController _newHomeGrabberViewWithFrame:](self, "_newHomeGrabberViewWithFrame:", v5, v7, v9, v11);
    grabberView = self->_grabberView;
    self->_grabberView = v25;

    [(SBHomeGrabberView *)self->_grabberView setDelegate:self];
    [(SBHomeGrabberView *)self->_grabberView setHidden:1 forReason:@"_SBTransientOverlayViewControllerHomeGrabberHiddenReason" withAnimationSettings:0];
    [(SBHomeGrabberView *)self->_grabberView setAlpha:self->_presentationHomeGrabberAlpha];
    [(UIView *)self->_homeGrabberContainerView addSubview:self->_grabberView];
    [(SBTransientOverlayViewController *)self _updateGrabberViewConfiguration];
  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v7 = a4;
  double v8 = SBFWindowForViewControllerTransition();
  uint64_t v9 = [v8 _toWindowOrientation];
  int v10 = [v8 isRotating];
  v13.receiver = self;
  v13.super_class = (Class)SBTransientOverlayViewController;
  -[SBTransientOverlayViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  if (v10)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v12[3] = &unk_1E6B08270;
    v12[4] = self;
    v12[5] = v9;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
    v11[3] = &unk_1E6AF53F8;
    v11[4] = self;
    [v7 animateAlongsideTransition:v12 completion:v11];
  }
}

void __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1224));
  [WeakRetained transientOverlayViewControllerWillBeginRotation:*(void *)(a1 + 32) toInterfaceOrientation:*(void *)(a1 + 40)];
}

void __87__SBTransientOverlayViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1224));
  [WeakRetained transientOverlayViewControllerDidEndRotation:*(void *)(a1 + 32)];
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (UIWindow *)a3;
  v12.receiver = self;
  v12.super_class = (Class)SBTransientOverlayViewController;
  [(SBTransientOverlayViewController *)&v12 viewDidMoveToWindow:v7 shouldAppearOrDisappear:v4];
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  if (keyboardHomeAffordanceAssertion && self->_keyboardHomeAffordanceAssertionWindow != v7)
  {
    uint64_t v9 = keyboardHomeAffordanceAssertion;
    int v10 = +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:v7];
    double v11 = self->_keyboardHomeAffordanceAssertion;
    self->_keyboardHomeAffordanceAssertion = v10;

    objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertionWindow, a3);
    [(SBKeyboardHomeAffordanceAssertion *)v9 invalidate];
  }
}

- (UIEdgeInsets)_edgeInsetsForChildViewController:(id)a3 insetsAreAbsolute:(BOOL *)a4
{
  double v6 = objc_msgSend(MEMORY[0x1E4FB33B0], "sb_thisDeviceDisplayEdgeInfo", a3);
  BOOL v7 = [(SBTransientOverlayViewController *)self hasVisibleStatusBar];
  double v8 = 0.0;
  if (v7) {
    [(UIStatusBar *)self->_statusBar currentHeight];
  }
  uint64_t v9 = objc_msgSend(v6, "sb_displayEdgeInfoWithSafeAreaInsetsForStatusBarHeight:", v8);

  int64_t v10 = [(SBTransientOverlayViewController *)self containerOrientation];
  double v11 = [(SBTransientOverlayViewController *)self traitCollection];
  objc_msgSend(v9, "sb_orientedEdgeInsetsForInterfaceOrientation:traitCollection:", v10, v11);
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;

  if (a4) {
    *a4 = 1;
  }

  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  double v23 = v19;
  result.right = v23;
  result.bottom = v22;
  result.left = v21;
  result.top = v20;
  return result;
}

- (UIView)contentView
{
  [(SBTransientOverlayViewController *)self loadViewIfNeeded];
  contentView = self->_contentView;
  return contentView;
}

- (id)hostedSceneIdentityTokens
{
  return 0;
}

- (BOOL)hasVisibleStatusBar
{
  [(UIStatusBar *)self->_statusBar alpha];
  return BSFloatGreaterThanFloat();
}

- (BOOL)isIgnoringAppearanceUpdates
{
  return self->_appearanceUpdateIgnoreCount > 0;
}

- (BOOL)isIgnoringContentOverlayInsetUpdates
{
  return self->_contentOverlayInsetUpdateIgnoreCount > 0;
}

- (NSString)preferredDisplayLayoutElementIdentifier
{
  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (NSNumber)preferredSceneDeactivationReasonValue
{
  return (NSNumber *)&unk_1F334B720;
}

- (id)sceneDeactivationPredicate
{
  return 0;
}

- (void)setContainerOrientation:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_containerOrientation != a3)
  {
    self->_containerOrientation = a3;
    -[UIStatusBar setOrientation:](self->_statusBar, "setOrientation:");
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    BOOL v4 = [(SBTransientOverlayViewController *)self childViewControllers];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          [*(id *)(*((void *)&v9 + 1) + 8 * v8++) _updateContentOverlayInsetsFromParentIfNecessary];
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)setPresentationContentCornerRadius:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_presentationContentCornerRadius = a3;
    [(UIView *)self->_contentView _setContinuousCornerRadius:a3];
    if ([(SBTransientOverlayViewController *)self preventsClippingToBounds]) {
      uint64_t v5 = 0;
    }
    else {
      uint64_t v5 = BSFloatGreaterThanFloat();
    }
    contentView = self->_contentView;
    [(UIView *)contentView setClipsToBounds:v5];
  }
}

- (void)setPresentationContentTransform:(CGAffineTransform *)a3
{
  p_presentationContentTransform = &self->_presentationContentTransform;
  long long v6 = *(_OWORD *)&self->_presentationContentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_presentationContentTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_presentationContentTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_presentationContentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_presentationContentTransform->tx = v9;
    *(_OWORD *)&p_presentationContentTransform->a = v8;
    contentContainerView = self->_contentContainerView;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    [(UIView *)contentContainerView setTransform:&t1];
  }
}

- (void)setPresentationHomeGrabberTransform:(CGAffineTransform *)a3
{
  p_presentationHomeGrabberTransform = &self->_presentationHomeGrabberTransform;
  long long v6 = *(_OWORD *)&self->_presentationHomeGrabberTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_presentationHomeGrabberTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_presentationHomeGrabberTransform.tx;
  long long v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v12.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v12.c = v7;
  *(_OWORD *)&v12.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v12))
  {
    long long v8 = *(_OWORD *)&a3->a;
    long long v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_presentationHomeGrabberTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_presentationHomeGrabberTransform->tx = v9;
    *(_OWORD *)&p_presentationHomeGrabberTransform->a = v8;
    homeGrabberContainerView = self->_homeGrabberContainerView;
    long long v11 = *(_OWORD *)&a3->c;
    *(_OWORD *)&t1.a = *(_OWORD *)&a3->a;
    *(_OWORD *)&t1.c = v11;
    *(_OWORD *)&t1.tx = *(_OWORD *)&a3->tx;
    [(UIView *)homeGrabberContainerView setTransform:&t1];
  }
}

- (void)setPresentationHomeGrabberAdditionalEdgeSpacing:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_presentationHomeGrabberAdditionalEdgeSpacing = a3;
    [(SBHomeGrabberView *)self->_grabberView setNeedsLayout];
    grabberView = self->_grabberView;
    [(SBHomeGrabberView *)grabberView layoutIfNeeded];
  }
}

- (void)setPresentationDimmingViewHidden:(BOOL)a3
{
  if (self->_presentationDimmingViewHidden != a3)
  {
    self->_presentationDimmingViewHidden = a3;
    dimmingView = self->_dimmingView;
    if (a3)
    {
      if (dimmingView)
      {
        [(SBTransientOverlayViewController *)self removePresentationBackgroundView:self->_dimmingView];
        uint64_t v5 = self->_dimmingView;
        self->_dimmingView = 0;
      }
    }
    else if (!dimmingView)
    {
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __69__SBTransientOverlayViewController_setPresentationDimmingViewHidden___block_invoke;
      v6[3] = &unk_1E6AF4AC0;
      v6[4] = self;
      [MEMORY[0x1E4F42FF0] _performWithoutRetargetingAnimations:v6];
    }
  }
}

uint64_t __69__SBTransientOverlayViewController_setPresentationDimmingViewHidden___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc(MEMORY[0x1E4FA6028]);
  id v3 = [*(id *)(a1 + 32) view];
  [v3 bounds];
  uint64_t v4 = objc_msgSend(v2, "initWithFrame:");
  uint64_t v5 = *(void *)(a1 + 32);
  long long v6 = *(void **)(v5 + 1000);
  *(void *)(v5 + 1000) = v4;

  long long v7 = *(void **)(a1 + 32);
  long long v8 = (void *)v7[125];
  long long v9 = [v7 presentationDimmingViewColor];
  [v8 setBackgroundColor:v9];

  [*(id *)(a1 + 32) setPresentationDimmingAlpha:0.0];
  long long v10 = *(void **)(a1 + 32);
  uint64_t v11 = v10[125];
  return [v10 addPresentationBackgroundView:v11];
}

- (void)setPresentationDimmingAlpha:(double)a3
{
}

- (double)presentationDimmingAlpha
{
  [(UIView *)self->_dimmingView alpha];
  return result;
}

- (void)setPresentationHomeGrabberAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_presentationHomeGrabberAlpha = a3;
    grabberView = self->_grabberView;
    [(SBHomeGrabberView *)grabberView setAlpha:a3];
  }
}

- (int64_t)homeAffordanceSuppression
{
  return 0;
}

- (BOOL)preservesAppSwitcherDuringPresentationAndDismissal
{
  return 0;
}

- (UIColor)presentationDimmingViewColor
{
  return (UIColor *)[MEMORY[0x1E4F428B8] colorWithWhite:0.0 alpha:0.5];
}

- (BOOL)preventsClippingToBounds
{
  return 0;
}

- (BOOL)isPresentedByProcess:(id)a3
{
  return 0;
}

- (BOOL)isPresentedByBundleIdentifier:(id)a3
{
  return 0;
}

- (void)beginIgnoringAppearanceUpdates
{
}

- (void)endIgnoringAppearanceUpdates
{
  int64_t appearanceUpdateIgnoreCount = self->_appearanceUpdateIgnoreCount;
  BOOL v3 = appearanceUpdateIgnoreCount == 1;
  BOOL v4 = appearanceUpdateIgnoreCount < 1;
  int64_t v5 = appearanceUpdateIgnoreCount - 1;
  if (!v4)
  {
    self->_int64_t appearanceUpdateIgnoreCount = v5;
    if (v3)
    {
      BOOL v7 = [(SBTransientOverlayViewController *)self _appearState] == 2;
      [(SBTransientOverlayViewController *)self setDisplayLayoutElementActive:v7];
    }
  }
}

- (void)beginIgnoringContentOverlayInsetUpdates
{
}

- (void)endIgnoringContentOverlayInsetUpdates
{
  int64_t contentOverlayInsetUpdateIgnoreCount = self->_contentOverlayInsetUpdateIgnoreCount;
  BOOL v3 = contentOverlayInsetUpdateIgnoreCount < 1;
  int64_t v4 = contentOverlayInsetUpdateIgnoreCount - 1;
  if (!v3) {
    self->_int64_t contentOverlayInsetUpdateIgnoreCount = v4;
  }
}

- (BOOL)handleDoubleHeightStatusBarTap
{
  return 0;
}

- (id)newTransientOverlayDismissalTransitionCoordinator
{
  id v2 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  [(SBTransientOverlayBlockTransitionCoordinator *)v2 setStartTransitionHandler:&__block_literal_global_411];
  return v2;
}

void __85__SBTransientOverlayViewController_newTransientOverlayDismissalTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 performAlongsideTransitions];
  [v2 completeTransition:1];
}

- (id)newTransientOverlayPresentationTransitionCoordinator
{
  id v2 = objc_alloc_init(SBTransientOverlayBlockTransitionCoordinator);
  [(SBTransientOverlayBlockTransitionCoordinator *)v2 setStartTransitionHandler:&__block_literal_global_44_2];
  return v2;
}

void __88__SBTransientOverlayViewController_newTransientOverlayPresentationTransitionCoordinator__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 performAlongsideTransitions];
  [v2 completeTransition:1];
}

- (void)preserveInputViewsAnimated:(BOOL)a3
{
  if (!self->_hasPreservedInputViews)
  {
    BOOL v3 = a3;
    self->_hasPreservedInputViews = 1;
    id v6 = [MEMORY[0x1E4F42C68] sharedInstance];
    int64_t v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v6 _preserveInputViewsWithId:v5 animated:v3];
  }
}

- (void)restoreInputViewsAnimated:(BOOL)a3
{
  if (self->_hasPreservedInputViews)
  {
    BOOL v3 = a3;
    self->_hasPreservedInputViews = 0;
    id v6 = [MEMORY[0x1E4F42C68] sharedInstance];
    int64_t v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v6 _restoreInputViewsWithId:v5 animated:v3];
  }
}

- (_UILegibilitySettings)preferredStatusBarLegibilitySettings
{
  uint64_t v3 = [(SBTransientOverlayViewController *)self preferredStatusBarStyle];
  if (v3 == -1)
  {
    BOOL v7 = 0;
  }
  else
  {
    if (!v3)
    {
      int64_t v4 = [(SBTransientOverlayViewController *)self traitCollection];
      uint64_t v5 = [v4 userInterfaceStyle];

      if (v5 == 2) {
        uint64_t v3 = 1;
      }
      else {
        uint64_t v3 = 3;
      }
    }
    if (v3 == 3) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    BOOL v7 = (void *)[objc_alloc(MEMORY[0x1E4F43228]) initWithStyle:v6];
  }
  return (_UILegibilitySettings *)v7;
}

- (void)setNeedsContentOpaqueUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsContentOpaqueUpdate:self];
}

- (void)setNeedsFeaturePolicyUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsFeaturePolicyUpdate:self];
}

- (void)setNeedsGestureDismissalStyleUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsGestureDismissalStyleUpdate:self];
}

- (void)setNeedsIdleTimerReset
{
  id v2 = +[SBIdleTimerGlobalCoordinator sharedInstance];
  [v2 resetIdleTimerForReason:@"TransientOverlay"];
}

- (void)setNeedsUpdateOfSupportedInterfaceOrientations
{
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayViewController;
  [(UIViewController *)&v4 setNeedsUpdateOfSupportedInterfaceOrientations];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayDidUpdateSupportedInterfaceOrientations:self];
}

- (void)setNeedsOrientationUpdatesDisabledUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsOrientationUpdatesDisabledUpdate:self];
}

- (void)setNeedsProximityDetectionUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsProximityDetectionUpdate:self];
}

- (void)setNeedsAudioCategoriesDisablingVolumeHUDUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewController:self requestZStackParticipantPreferencesUpdateWithReason:@"AudioCategoriesDisablingVolumeHUD Updated"];
}

- (void)setNeedsSceneDeactivationUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsSceneDeactivationUpdate:self];
}

- (void)setPresentationPrefersHomeGrabberHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  int64_t presentationPrefersHomeGrabberHidden = self->_presentationPrefersHomeGrabberHidden;
  if (presentationPrefersHomeGrabberHidden == 0x7FFFFFFFFFFFFFFFLL
    || presentationPrefersHomeGrabberHidden != BSSettingFlagForBool())
  {
    self->_int64_t presentationPrefersHomeGrabberHidden = BSSettingFlagForBool();
    [(SBTransientOverlayViewController *)self _updateGrabberViewHiddenConfigurationAnimated:v4];
  }
}

- (void)setHomeGrabberPointerClickDelegate:(id)a3
{
}

- (void)setPresentationPrefersStatusBarHidden:(BOOL)a3 initialStatusBarSettings:(id)a4
{
  int v4 = a3;
  id v6 = a4;
  int presentationPrefersStatusBarHidden = self->_presentationPrefersStatusBarHidden;
  id v10 = v6;
  if (v6 || (long long v8 = 0, presentationPrefersStatusBarHidden != v4))
  {
    self->_int presentationPrefersStatusBarHidden = v4;
    [(SBTransientOverlayViewController *)self _applyStatusBarStyleRequestWithInitialStatusBarSettings:v6];
    long long v8 = v10;
  }
  if (presentationPrefersStatusBarHidden != v4)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
    [WeakRetained transientOverlayViewControllerDidUpdatePresentationPrefersStatusBarHidden:self];

    long long v8 = v10;
  }
}

- (void)setPresentationPrefersStatusBarHidden:(BOOL)a3
{
}

- (void)setNeedsWindowHitTestingUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerNeedsWindowHitTestingUpdate:self];
}

- (BOOL)dismissesSiriForPresentation
{
  return 1;
}

- (void)didTransitionToAttachedToWindowedAccessory:(BOOL)a3 windowedAccessoryCutoutFrameInScreen:(CGRect)a4
{
  self->_attachedToWindowedAccessory = a3;
  self->_windowedAccessoryCutoutFrameInScreen = a4;
}

- (BOOL)isPresentedFromSceneWithIdentityTokenString:(id)a3
{
  return 0;
}

- (id)keyboardFocusTarget
{
  return 0;
}

- (void)setNeedsHIDEventDeferringDisabledUpdate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  [WeakRetained transientOverlayViewControllerDidUpdateHIDEventDeferringDisabled:self];
}

- (void)addPresentationBackgroundView:(id)a3
{
  id v4 = a3;
  presentationBackgroundView = self->_presentationBackgroundView;
  id v10 = v4;
  if (!presentationBackgroundView)
  {
    id v6 = [(SBTransientOverlayViewController *)self view];
    id v7 = objc_alloc(MEMORY[0x1E4F42FF0]);
    [v6 bounds];
    long long v8 = (UIView *)objc_msgSend(v7, "initWithFrame:");
    long long v9 = self->_presentationBackgroundView;
    self->_presentationBackgroundView = v8;

    [v6 insertSubview:self->_presentationBackgroundView belowSubview:self->_backgroundView];
    id v4 = v10;
    presentationBackgroundView = self->_presentationBackgroundView;
  }
  [(UIView *)presentationBackgroundView addSubview:v4];
  [(UIView *)self->_presentationBackgroundView bounds];
  objc_msgSend(v10, "setFrame:");
}

- (void)removePresentationBackgroundView:(id)a3
{
  id v9 = a3;
  id v4 = [v9 superview];
  presentationBackgroundView = self->_presentationBackgroundView;

  if (v4 == presentationBackgroundView) {
    [v9 removeFromSuperview];
  }
  id v6 = [(UIView *)self->_presentationBackgroundView subviews];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    [(UIView *)self->_presentationBackgroundView removeFromSuperview];
    long long v8 = self->_presentationBackgroundView;
    self->_presentationBackgroundView = 0;
  }
}

- (void)_keyboardWillHideNotification:(id)a3
{
  if (self->_keyboardVisible)
  {
    self->_keyboardVisible = 0;
    [(SBTransientOverlayViewController *)self _updateGrabberViewHiddenConfigurationAnimated:1];
  }
  [(SBTransientOverlayViewController *)self handleWillShowKeyboard:0];
}

- (void)_keyboardWillShowNotification:(id)a3
{
  if ([(SBTransientOverlayViewController *)self _isKeyboardVisibleForSpringBoard])
  {
    if (self->_keyboardVisible != 1)
    {
      self->_keyboardVisible = 1;
      [(SBTransientOverlayViewController *)self _updateGrabberViewHiddenConfigurationAnimated:1];
    }
  }
  else
  {
    self->_keyboardVisible = 0x7FFFFFFFFFFFFFFFLL;
  }
  [(SBTransientOverlayViewController *)self handleWillShowKeyboard:1];
}

- (BOOL)_isKeyboardVisibleForSpringBoard
{
  id v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  LOBYTE(v2) = [WeakRetained isKeyboardVisibleForSpringBoardForTransientOverlayViewController:v2];

  return (char)v2;
}

- (id)_newHomeGrabberViewWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  uint64_t v7 = [SBHomeGrabberView alloc];
  return -[SBHomeGrabberView initWithFrame:](v7, "initWithFrame:", x, y, width, height);
}

- (void)_applyStatusBarStyleRequestWithInitialStatusBarSettings:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [(SBTransientOverlayViewController *)self _preferredStatusBarVisibility];
  if (self->_presentationPrefersStatusBarHidden || v5 == 0)
  {
    [(UIStatusBar *)self->_statusBar setAlpha:0.0];
  }
  else
  {
    int v7 = v5;
    uint64_t v8 = [(SBTransientOverlayViewController *)self preferredStatusBarStyle];
    id v9 = [(UIViewController *)self _sbWindowScene];
    id v10 = [v9 statusBarManager];

    uint64_t v11 = [v10 reusePool];
    CGAffineTransform v12 = [v10 assertionManager];
    if (!self->_statusBar)
    {
      [(SBTransientOverlayViewController *)self _currentStatusBarFrameForStyle:v8];
      objc_msgSend(v11, "getReusableStatusBarWithReason:withFrame:", @"TransientOverlay");
      double v13 = (UIStatusBar *)objc_claimAutoreleasedReturnValue();
      statusBar = self->_statusBar;
      self->_statusBar = v13;

      [(UIView *)self->_contentContainerView addSubview:self->_statusBar];
    }
    if (v4)
    {
      double v15 = [v12 effectiveStatusBarStyleRequestWithSettings:v4];
      objc_storeStrong((id *)&self->_currentStatusBarStyleRequest, v15);
      double v16 = (void *)MEMORY[0x1E4F42FF0];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __92__SBTransientOverlayViewController__applyStatusBarStyleRequestWithInitialStatusBarSettings___block_invoke;
      v33[3] = &unk_1E6AF4E00;
      v33[4] = self;
      id v34 = v15;
      id v35 = v4;
      id v17 = v15;
      [v16 performWithoutAnimation:v33];
    }
    double v18 = objc_alloc_init(SBMutableStatusBarSettings);
    double v19 = v18;
    if (v7 == 2) {
      double v20 = 1.0;
    }
    else {
      double v20 = 0.0;
    }
    [(SBMutableStatusBarSettings *)v18 setStyle:v8];
    double v21 = [(SBTransientOverlayViewController *)self preferredStatusBarLegibilitySettings];
    [(SBMutableStatusBarSettings *)v19 setLegibilitySettings:v21];

    double v22 = [(SBTransientOverlayViewController *)self preferredBackgroundActivitiesToSuppress];
    [(SBMutableStatusBarSettings *)v19 setBackgroundActivitiesToSuppress:v22];

    double v23 = [v12 effectiveStatusBarStyleRequestWithSettings:v19];
    objc_storeStrong((id *)&self->_currentStatusBarStyleRequest, v23);
    [(UIStatusBar *)self->_statusBar setAlpha:v20];
    if (BSFloatGreaterThanFloat()) {
      [(UIStatusBar *)self->_statusBar setStyleRequest:v23];
    }
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v24 = [(SBTransientOverlayViewController *)self childViewControllers];
  uint64_t v25 = [v24 countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v30 != v27) {
          objc_enumerationMutation(v24);
        }
        [*(id *)(*((void *)&v29 + 1) + 8 * i) _updateContentOverlayInsetsFromParentIfNecessary];
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v26);
  }
}

void __92__SBTransientOverlayViewController__applyStatusBarStyleRequestWithInitialStatusBarSettings___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1064) setStyleRequest:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1064);
  id v4 = [*(id *)(a1 + 48) alpha];
  [v4 floatValue];
  [v2 setAlpha:v3];
}

- (CGRect)_currentStatusBarFrameForStyle:(int64_t)a3
{
  [(UIView *)self->_contentContainerView bounds];
  CGRectGetWidth(v10);
  objc_msgSend(MEMORY[0x1E4F42E28], "heightForStyle:orientation:", a3, -[SBTransientOverlayViewController containerOrientation](self, "containerOrientation"));
  BSRectWithSize();
  result.size.double height = v8;
  result.size.double width = v7;
  result.origin.double y = v6;
  result.origin.double x = v5;
  return result;
}

- (void)_invalidateKeyboardHomeAffordanceAssertion
{
  [(SBKeyboardHomeAffordanceAssertion *)self->_keyboardHomeAffordanceAssertion invalidate];
  keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
  self->_keyboardHomeAffordanceAssertion = 0;

  keyboardHomeAffordanceAssertionWindow = self->_keyboardHomeAffordanceAssertionWindow;
  self->_keyboardHomeAffordanceAssertionWindow = 0;
}

- (void)_updateGrabberViewConfiguration
{
  float v3 = [(SBTransientOverlayViewController *)self childViewControllerForHomeIndicatorAutoHidden];
  id v4 = v3;
  if (!v3) {
    float v3 = self;
  }
  int v5 = [v3 prefersHomeIndicatorAutoHidden];

  grabberView = self->_grabberView;
  grabberSettings = self->_grabberSettings;
  if (v5)
  {
    [(SBFHomeGrabberSettings *)grabberSettings autoHideTimeOnAppRequest];
    -[SBHomeGrabberView turnOnAutoHideWithInitialDelay:](grabberView, "turnOnAutoHideWithInitialDelay:");
  }
  else
  {
    [(SBFHomeGrabberSettings *)grabberSettings delayForUnhideOnAppRequest];
    -[SBHomeGrabberView turnOffAutoHideWithDelay:](grabberView, "turnOffAutoHideWithDelay:");
  }
  double v8 = [(SBTransientOverlayViewController *)self childViewControllerForScreenEdgesDeferringSystemGestures];
  id v9 = v8;
  if (!v8) {
    double v8 = self;
  }
  unint64_t v10 = [v8 preferredScreenEdgesDeferringSystemGestures];

  [(SBHomeGrabberView *)self->_grabberView setEdgeProtectEnabled:(v10 >> 2) & 1];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  uint64_t v12 = [WeakRetained transientOverlayViewControllerIsForegroundActive:self];

  double v13 = self->_grabberView;
  [(SBHomeGrabberView *)v13 setHomeAffordanceInteractionEnabled:v12];
}

- (void)_updateGrabberViewHiddenConfigurationAnimated:(BOOL)a3
{
  if (self->_presentationPrefersHomeGrabberHidden == 0x7FFFFFFFFFFFFFFFLL || SBFEffectiveHomeButtonType() != 2) {
    return;
  }
  if (self->_keyboardVisible == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(SBTransientOverlayViewController *)self _isKeyboardVisibleForSpringBoard];
    self->_keyboardVisible = BSSettingFlagForBool();
  }
  [(SBTransientOverlayViewController *)self loadViewIfNeeded];
  if (self->_presentationPrefersHomeGrabberHidden)
  {
    [(SBTransientOverlayViewController *)self _invalidateKeyboardHomeAffordanceAssertion];
    grabberView = self->_grabberView;
    if (a3)
    {
      id obj = [(SBFHomeGrabberSettings *)self->_grabberSettings hideAnimationSettings];
      double v6 = [obj BSAnimationSettings];
      double v7 = grabberView;
      uint64_t v8 = 1;
LABEL_18:
      [(SBHomeGrabberView *)v7 setHidden:v8 forReason:@"_SBTransientOverlayViewControllerHomeGrabberHiddenReason" withAnimationSettings:v6];
      goto LABEL_19;
    }
    uint64_t v14 = self->_grabberView;
    uint64_t v15 = 1;
  }
  else
  {
    if (self->_keyboardVisible == 1)
    {
      id v9 = [(SBTransientOverlayViewController *)self view];
      id obj = [v9 window];

      if (obj && !self->_keyboardHomeAffordanceAssertion)
      {
        unint64_t v10 = +[SBKeyboardHomeAffordanceAssertion assertionForGestureWindow:obj];
        keyboardHomeAffordanceAssertion = self->_keyboardHomeAffordanceAssertion;
        self->_keyboardHomeAffordanceAssertion = v10;

        objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertionWindow, obj);
      }
      uint64_t v12 = self->_grabberView;
      if (!a3)
      {
        [(SBHomeGrabberView *)self->_grabberView setHidden:1 forReason:@"_SBTransientOverlayViewControllerHomeGrabberHiddenReason" withAnimationSettings:0];
        goto LABEL_20;
      }
      double v6 = [(SBFHomeGrabberSettings *)self->_grabberSettings hideAnimationSettings];
      double v13 = [v6 BSAnimationSettings];
      [(SBHomeGrabberView *)v12 setHidden:1 forReason:@"_SBTransientOverlayViewControllerHomeGrabberHiddenReason" withAnimationSettings:v13];

LABEL_19:
LABEL_20:

      return;
    }
    [(SBTransientOverlayViewController *)self _invalidateKeyboardHomeAffordanceAssertion];
    double v16 = self->_grabberView;
    if (a3)
    {
      id obj = [(SBFHomeGrabberSettings *)self->_grabberSettings unhideAnimationSettings];
      double v6 = [obj BSAnimationSettings];
      double v7 = v16;
      uint64_t v8 = 0;
      goto LABEL_18;
    }
    uint64_t v14 = self->_grabberView;
    uint64_t v15 = 0;
  }
  [(SBHomeGrabberView *)v14 setHidden:v15 forReason:@"_SBTransientOverlayViewControllerHomeGrabberHiddenReason" withAnimationSettings:0];
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (BOOL)prefersEmbeddedDisplayPresentation
{
  return self->_prefersEmbeddedDisplayPresentation;
}

- (BOOL)prefersContinuityDisplayPresentation
{
  return self->_prefersContinuityDisplayPresentation;
}

- (BOOL)allowsStackingOverlayContentAbove
{
  return self->_allowsStackingOverlayContentAbove;
}

- (BOOL)isContentOpaque
{
  return self->_contentOpaque;
}

- (FBScene)sceneForClientSettings
{
  return self->_sceneForClientSettings;
}

- (BOOL)prefersProximityDetectionEnabled
{
  return self->_prefersProximityDetectionEnabled;
}

- (NSSet)audioCategoriesDisablingVolumeHUD
{
  return self->_audioCategoriesDisablingVolumeHUD;
}

- (NSSet)preferredBackgroundActivitiesToSuppress
{
  return self->_preferredBackgroundActivitiesToSuppress;
}

- (BOOL)prefersStatusBarActivityItemVisible
{
  return self->_prefersStatusBarActivityItemVisible;
}

- (BOOL)shouldDisableBanners
{
  return self->_shouldDisableBanners;
}

- (BOOL)shouldDisableControlCenter
{
  return self->_shouldDisableControlCenter;
}

- (BOOL)shouldDisableReachability
{
  return self->_shouldDisableReachability;
}

- (BOOL)shouldDisableInteractiveScreenshotGesture
{
  return self->_shouldDisableInteractiveScreenshotGesture;
}

- (BOOL)shouldDisableSiri
{
  return self->_shouldDisableSiri;
}

- (BOOL)shouldPendAlertItems
{
  return self->_shouldPendAlertItems;
}

- (BOOL)shouldUseSceneBasedKeyboardFocus
{
  return self->_shouldUseSceneBasedKeyboardFocus;
}

- (BOOL)shouldPreventDragAndDrop
{
  return self->_shouldPreventDragAndDrop;
}

- (BOOL)supportsAlwaysOnDisplay
{
  return self->_supportsAlwaysOnDisplay;
}

- (SBIdleTimerCoordinating)idleTimerCoordinator
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_idleTimerCoordinator);
  return (SBIdleTimerCoordinating *)WeakRetained;
}

- (void)setIdleTimerCoordinator:(id)a3
{
}

- (int64_t)containerOrientation
{
  return self->_containerOrientation;
}

- (BOOL)shouldDisableOrientationUpdates
{
  return self->_shouldDisableOrientationUpdates;
}

- (int64_t)preferredLockedGestureDismissalStyle
{
  return self->_preferredLockedGestureDismissalStyle;
}

- (int64_t)preferredUnlockedGestureDismissalStyle
{
  return self->_preferredUnlockedGestureDismissalStyle;
}

- (SBDisplayItem)representedDisplayItem
{
  return self->_representedDisplayItem;
}

- (int)pictureInPictureProcessIdentifier
{
  return self->_pictureInPictureProcessIdentifier;
}

- (BOOL)prefersWindowHitTestingDisabled
{
  return self->_prefersWindowHitTestingDisabled;
}

- (BOOL)isAttachedToWindowedAccessory
{
  return self->_attachedToWindowedAccessory;
}

- (CGRect)windowedAccessoryCutoutFrameInScreen
{
  double x = self->_windowedAccessoryCutoutFrameInScreen.origin.x;
  double y = self->_windowedAccessoryCutoutFrameInScreen.origin.y;
  double width = self->_windowedAccessoryCutoutFrameInScreen.size.width;
  double height = self->_windowedAccessoryCutoutFrameInScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (BOOL)canBecomeLocalFirstResponder
{
  return self->_canBecomeLocalFirstResponder;
}

- (BOOL)hidEventDeferringDisabled
{
  return self->_hidEventDeferringDisabled;
}

- (BOOL)preventsSystemApertureSuppressionFromBelow
{
  return self->_preventsSystemApertureSuppressionFromBelow;
}

- (NSSet)associatedBundleIdentifiersToSuppressInSystemAperture
{
  return self->_associatedBundleIdentifiersToSuppressInSystemAperture;
}

- (NSSet)associatedSceneIdentifiersToSuppressInSystemAperture
{
  return self->_associatedSceneIdentifiersToSuppressInSystemAperture;
}

- (SBTransientOverlayViewControllerDelegate)transientOverlayDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_transientOverlayDelegate);
  return (SBTransientOverlayViewControllerDelegate *)WeakRetained;
}

- (void)setTransientOverlayDelegate:(id)a3
{
}

- (UIStatusBarStyleRequest)currentStatusBarStyleRequest
{
  return self->_currentStatusBarStyleRequest;
}

- (SBHomeGrabberView)grabberView
{
  return self->_grabberView;
}

- (void)setGrabberView:(id)a3
{
}

- (BOOL)presentationAllowsHomeGrabberAutoHide
{
  return self->_presentationAllowsHomeGrabberAutoHide;
}

- (void)setPresentationAllowsHomeGrabberAutoHide:(BOOL)a3
{
  self->_presentationAllowsHomeGrabberAutoHide = a3;
}

- (double)presentationContentCornerRadius
{
  return self->_presentationContentCornerRadius;
}

- (CGAffineTransform)presentationContentTransform
{
  long long v3 = *(_OWORD *)&self[27].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[27].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[27].ty;
  return self;
}

- (CGAffineTransform)presentationHomeGrabberTransform
{
  long long v3 = *(_OWORD *)&self[28].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[28].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tdouble x = *(_OWORD *)&self[28].ty;
  return self;
}

- (double)presentationHomeGrabberAlpha
{
  return self->_presentationHomeGrabberAlpha;
}

- (double)presentationHomeGrabberAdditionalEdgeSpacing
{
  return self->_presentationHomeGrabberAdditionalEdgeSpacing;
}

- (BOOL)presentationDimmingViewHidden
{
  return self->_presentationDimmingViewHidden;
}

- (BOOL)presentationPrefersStatusBarHidden
{
  return self->_presentationPrefersStatusBarHidden;
}

- (BOOL)dismissesForCoverSheetPresentation
{
  return self->_dismissesForCoverSheetPresentation;
}

- (BOOL)preventsDismissalOnLockForInactiveScreen
{
  return self->_preventsDismissalOnLockForInactiveScreen;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_grabberView, 0);
  objc_storeStrong((id *)&self->_currentStatusBarStyleRequest, 0);
  objc_destroyWeak((id *)&self->_transientOverlayDelegate);
  objc_storeStrong((id *)&self->_associatedSceneIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_associatedBundleIdentifiersToSuppressInSystemAperture, 0);
  objc_storeStrong((id *)&self->_representedDisplayItem, 0);
  objc_destroyWeak((id *)&self->_idleTimerCoordinator);
  objc_storeStrong((id *)&self->_preferredBackgroundActivitiesToSuppress, 0);
  objc_storeStrong((id *)&self->_audioCategoriesDisablingVolumeHUD, 0);
  objc_storeStrong((id *)&self->_sceneForClientSettings, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_displayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutElement, 0);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_presentationBackgroundView, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertionWindow, 0);
  objc_storeStrong((id *)&self->_keyboardHomeAffordanceAssertion, 0);
  objc_storeStrong((id *)&self->_grabberSettings, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_homeGrabberContainerView, 0);
  objc_storeStrong((id *)&self->_contentContainerView, 0);
}

@end