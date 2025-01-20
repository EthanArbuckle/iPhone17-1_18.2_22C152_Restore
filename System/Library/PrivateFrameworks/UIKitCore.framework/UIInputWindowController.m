@interface UIInputWindowController
+ (BOOL)_isSecureForRemoteViewService;
- (BOOL)_allowsSkippingLayout;
- (BOOL)_canShowWhileLocked;
- (BOOL)_isSecure;
- (BOOL)_shouldPresentViewController:(id)a3 withPresentationController:(id)a4;
- (BOOL)_useLiveRotation;
- (BOOL)crescendoEnabled;
- (BOOL)currentControllerShouldUpdateKeyboardLayoutGuide;
- (BOOL)disablePlacementChanges;
- (BOOL)dontDismissKeyboardOnScrolling;
- (BOOL)dontDismissReachability;
- (BOOL)externalTrackingUpdateInProgress;
- (BOOL)forceAccessoryViewToBottomOfHostView;
- (BOOL)hasInputOrAssistantViewsOnScreen;
- (BOOL)inhibitRotationAnimation;
- (BOOL)inputViewSetContainsView:(id)a3;
- (BOOL)isChangingInputViews;
- (BOOL)isChangingPlacement;
- (BOOL)isDragging;
- (BOOL)isHostingView:(id)a3;
- (BOOL)isInputViewsHidden;
- (BOOL)isOnScreen;
- (BOOL)isOnScreenRotating;
- (BOOL)isRotating;
- (BOOL)isSnapshotting;
- (BOOL)isSplitting;
- (BOOL)isTransitionStarted;
- (BOOL)isTransitioning;
- (BOOL)isTransitioningBetweenFloatingStates;
- (BOOL)isTransitioningBetweenKeyboardStates;
- (BOOL)isTranslating;
- (BOOL)isUndocked;
- (BOOL)isViewLandscape;
- (BOOL)keyboardControlsNotifications;
- (BOOL)layoutGuideNeedsUpdate;
- (BOOL)mergeTransitionIfNecessaryWithTransition:(id)a3;
- (BOOL)needsConvertToSceneCoordinates;
- (BOOL)shouldBeginTransitionForController:(id)a3;
- (BOOL)shouldNotifyRemoteKeyboards;
- (BOOL)shouldPostNotification:(unint64_t)a3 withInfo:(id)a4;
- (BOOL)sizesWindowToScene;
- (BOOL)trackingElementsShouldUseActualFrame;
- (BOOL)updateGuideBackdropRenderConfig:(id)a3 animated:(BOOL)a4;
- (CGPoint)_centerForOrientation:(int64_t)a3;
- (CGRect)_boundsForOrientation:(int64_t)a3;
- (CGRect)_defaultInitialViewFrame;
- (CGRect)_viewFrameInWindowForContentOverlayInsetsCalculation;
- (CGRect)_visibleFrame;
- (CGRect)_visibleInputViewFrame;
- (CGRect)convertRectFromContainerCoordinateSpaceToScreenSpace:(CGRect)a3;
- (CGRect)transitioningFrame;
- (CGRect)visibleFrame;
- (CGRect)visibleInputViewFrame;
- (CGSize)keyboardSizeFromExternalUpdate;
- (CGSize)sizeForInputViewController:(id)a3 inputView:(id)a4;
- (CGSize)sizeForInputViewController:(id)a3 inputView:(id)a4 includeAssistantBar:(BOOL)a5;
- (NSLayoutConstraint)accessoryViewHeightConstraint;
- (NSLayoutConstraint)assistantViewHeightConstraint;
- (NSLayoutConstraint)inputViewHeightConstraint;
- (UIEdgeInsets)_inputViewPadding;
- (UIEdgeInsets)_viewSafeAreaInsetsFromScene;
- (UIInputViewController)_inputAccessoryViewController;
- (UIInputViewController)_inputAssistantViewController;
- (UIInputViewController)_inputViewController;
- (UIInputViewPlacementTransition)currentTransition;
- (UIInputViewSet)inputViewSet;
- (UIInputViewSet)postRotationInputViewSet;
- (UIInputViewSet)transientInputViewSet;
- (UIInputViewSetNotificationInfo)externalTrackingInfo;
- (UIInputViewSetNotificationInfo)notificationInfoWaitingForInputUI;
- (UIInputViewSetNotificationInfo)postRotationInputViewNotificationInfo;
- (UIInputViewSetNotificationInfo)templateNotificationInfo;
- (UIInputViewSetPlacement)animationAwarePlacement;
- (UIInputViewSetPlacement)expectedPlacement;
- (UIInputViewSetPlacement)placement;
- (UIInputViewSetPlacement)placementDuringAnimation;
- (UIInputViewSetPlacement)placementIgnoringRotation;
- (UIInputViewSetPlacement)postRotationPlacement;
- (UIInputWindowController)initWithNibName:(id)a3 bundle:(id)a4;
- (UIInputWindowControllerHosting)hosting;
- (UIKeyboardPathEffectView)_pathEffectView;
- (UITraitCollection)sizeClassCollectionOverride;
- (UIView)_inputAccessoryView;
- (UIView)_inputAssistantView;
- (UIView)_inputView;
- (UIView)bottomEdgeView;
- (id)_infoForBackdropMatchMoveForLayer:(id)a3;
- (id)_screenCoordinateSpace;
- (id)convertUserInfo:(id)a3;
- (id)currentPresentationPlacement;
- (id)initialNotificationInfo;
- (id)inputViewSnapshotOfView:(id)a3 afterScreenUpdates:(BOOL)a4;
- (id)nextAnimationStyle;
- (id)postRotationPendingBlock;
- (id)screenSnapshotOfView:(id)a3;
- (id)transitionGuideBackdrop:(BOOL)a3;
- (id)viewForTransitionScreenSnapshot;
- (int)appearStateForChild:(unint64_t)a3 placement:(id)a4 start:(BOOL)a5;
- (int)hiddenCount;
- (int64_t)keyboardOrientation;
- (int64_t)overrideUserInterfaceStyle;
- (unint64_t)_clipCornersOfView:(id)a3;
- (unint64_t)changeToInputViewSet:(id)a3;
- (unint64_t)supportedInterfaceOrientations;
- (void)_collectTransitionTimeStatistics:(unint64_t)a3 withStart:(id)a4;
- (void)_forcePreLayoutHostViewFrame;
- (void)_getRotationContentSettings:(id *)a3;
- (void)_updateContentOverlayInsetsForSelfAndChildren;
- (void)_updatePlacementWithPlacement:(id)a3;
- (void)addPendingActivity:(id)a3;
- (void)animateAccessoryViewVisibility:(BOOL)a3 withDuration:(double)a4;
- (void)animateKeyboardTrackingElementsWithNotificationInfo:(id)a3 notificationType:(unint64_t)a4 updateForStart:(BOOL)a5 updateForEnd:(BOOL)a6;
- (void)beginFloatingTransitionFromPanGestureRecognizer:(id)a3;
- (void)cancelCurrentTransition;
- (void)candidateBarWillChangeHeight:(double)a3 withDuration:(double)a4;
- (void)chainPlacementsIfNecessaryFrom:(id)a3 toPlacement:(id)a4 transition:(id)a5 completion:(id)a6;
- (void)changeChild:(unint64_t)a3 toAppearState:(int)a4 animated:(BOOL)a5;
- (void)changeGuideAnimationOptions:(unint64_t)a3 duration:(double)a4;
- (void)changeGuideAnimationState:(BOOL)a3;
- (void)checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:(BOOL)a3 layoutSubviews:(BOOL)a4;
- (void)clearKeyboardSnapshot;
- (void)clearRotationState;
- (void)dealloc;
- (void)didEndIndirectSelectionGesture;
- (void)didEndTransitionWithController:(id)a3;
- (void)didReceiveMemoryWarning;
- (void)didRotateFromInterfaceOrientation:(int64_t)a3;
- (void)didSnapshot;
- (void)didSuspend:(id)a3;
- (void)dismissViewController:(id)a3;
- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4;
- (void)finishSplitTransition;
- (void)flushPendingActivities;
- (void)generateNotificationsForCompactAssistantFlickGestureCompletion:(id)a3;
- (void)generateNotificationsForStart:(BOOL)a3;
- (void)hideGuideBackdrop:(BOOL)a3;
- (void)hostAppSceneBoundsChanged;
- (void)hostViewDidEnterBackground;
- (void)hostViewWillDisappear;
- (void)hostViewWillenterForeground;
- (void)hostedOriginDidUpdate;
- (void)ignoreLayoutNotifications:(id)a3;
- (void)invalidateInputAccessoryView;
- (void)invalidateInputAssistantView;
- (void)invalidateInputView;
- (void)keyboardDismissWithInfo:(id)a3;
- (void)keyboardIsDocking:(BOOL)a3;
- (void)keyboardMoveOfType:(unint64_t)a3 info:(id)a4;
- (void)keyboardMoveWithInfo:(id)a3;
- (void)keyboardMovedToScreenPosition:(CGRect)a3 animated:(BOOL)a4;
- (void)loadView;
- (void)moveFromPlacement:(id)a3 toPlacement:(id)a4 starting:(id)a5 completion:(id)a6;
- (void)moveKeyboardLayoutGuideOffscreen;
- (void)performOperations:(id)a3 withAnimationStyle:(id)a4;
- (void)performOperations:(id)a3 withTemplateNotificationInfo:(id)a4;
- (void)performWithSafeTransitionFrames:(id)a3;
- (void)performWithoutAppearanceCallbacks:(id)a3;
- (void)performWithoutCallbacksOrNotifications:(id)a3;
- (void)popAnimationStyle;
- (void)postEndNotifications:(unint64_t)a3 withInfo:(id)a4;
- (void)postNotificationName:(id)a3 userInfo:(id)a4;
- (void)postStartNotifications:(unint64_t)a3 withInfo:(id)a4;
- (void)postTransitionEndNotification;
- (void)postValidatedEndNotifications:(unint64_t)a3 withInfo:(id)a4;
- (void)postValidatedStartNotifications:(unint64_t)a3 withInfo:(id)a4;
- (void)prepareForInputAssistant:(id)a3 animated:(BOOL)a4;
- (void)prepareForSplitTransition;
- (void)presentViewController:(id)a3;
- (void)presentationTransitionDidEnd:(id)a3;
- (void)presentationTransitionWillBegin:(id)a3;
- (void)pushAnimationStyle:(id)a3;
- (void)refreshKeyboardLayoutGuide;
- (void)refreshKeyboardLayoutGuideForce:(BOOL)a3;
- (void)registerPowerLogEvent:(BOOL)a3;
- (void)resetBackdropHeight;
- (void)setAccessoryViewHeightConstraint:(id)a3;
- (void)setAssistantViewHeightConstraint:(id)a3;
- (void)setCurrentTransition:(id)a3;
- (void)setDisableUpdateMaskForSecureTextEntry:(BOOL)a3;
- (void)setDontDismissKeyboardOnScrolling:(BOOL)a3;
- (void)setDontDismissReachability:(BOOL)a3;
- (void)setExclusiveTouch:(BOOL)a3;
- (void)setExternalTrackingInfo:(id)a3;
- (void)setExternalTrackingUpdateInProgress:(BOOL)a3;
- (void)setForceAccessoryViewToBottomOfHostView:(BOOL)a3;
- (void)setFullScreenPresentationAssertion:(id)a3;
- (void)setHiddenCount:(int)a3;
- (void)setHostingNeedsLayout;
- (void)setInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5;
- (void)setInputViewHeightConstraint:(id)a3;
- (void)setInputViewSet:(id)a3;
- (void)setInputViewSet:(id)a3 forKeyboardAssistantBar:(id)a4;
- (void)setInputViewsHidden:(BOOL)a3;
- (void)setInterfaceAutorotationDisabled:(BOOL)a3;
- (void)setKeyboardWindowSnapshotOn:(BOOL)a3;
- (void)setLayoutGuideNeedsUpdate:(BOOL)a3;
- (void)setNotificationInfoWaitingForInputUI:(id)a3;
- (void)setPlacement:(id)a3;
- (void)setPlacement:(id)a3 completion:(id)a4;
- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6;
- (void)setPlacement:(id)a3 starting:(id)a4 completion:(id)a5;
- (void)setPlacementChangeDisabled:(BOOL)a3 withPlacement:(id)a4;
- (void)setPlacementDuringAnimation:(id)a3;
- (void)setPostRotationInputViewNotificationInfo:(id)a3;
- (void)setPostRotationInputViewSet:(id)a3;
- (void)setPostRotationPendingBlock:(id)a3;
- (void)setPostRotationPlacement:(id)a3;
- (void)setRotationAwarePlacement:(id)a3;
- (void)setShouldNotifyRemoteKeyboards:(BOOL)a3;
- (void)setSizeClassCollectionOverride:(id)a3;
- (void)setTemplateNotificationInfo:(id)a3;
- (void)setTransientInputViewSet:(id)a3;
- (void)set_inputAccessoryViewController:(id)a3;
- (void)set_inputAssistantViewController:(id)a3;
- (void)set_inputViewController:(id)a3;
- (void)syncToExistingAnimations;
- (void)takeKeyboardSnapshotIgnoringSpotlightCheck:(BOOL)a3;
- (void)transferActiveNotificationInfoToInfo:(id)a3;
- (void)transferPlacementStateToInputWindowController:(id)a3;
- (void)updateAmbiguousControlCenterActivationMargin:(unint64_t)a3 withInfo:(id)a4;
- (void)updateAppearStatesForPlacement:(id)a3 start:(BOOL)a4 animated:(BOOL)a5;
- (void)updateBackdropRenderConfig:(id)a3;
- (void)updateForKeyplaneChangeWithContext:(id)a3;
- (void)updateGestureRecognizers;
- (void)updateGuideForOffscreenRotationWithDuration:(double)a3;
- (void)updateInputAssistantView:(id)a3;
- (void)updateInputAssistantViewForInputViewSet:(id)a3;
- (void)updateKeyboardDockViewVisibility;
- (void)updateKeyboardLayoutGuideForRefreshedPlaceholder;
- (void)updateKeyboardLayoutGuideForRotationOrientation:(int64_t)a3;
- (void)updateKeyboardLayoutGuideWithFrame:(CGRect)a3 layoutViews:(BOOL)a4;
- (void)updateKeyboardPlacementForGuide:(id)a3;
- (void)updateKeyboardSizeClass;
- (void)updateOffscreenKeyboardLayoutGuide;
- (void)updateSizingFromRemoteChange;
- (void)updateSupportsDockViewController;
- (void)updateToPlacement:(id)a3 withNormalAnimationsAndNotifications:(BOOL)a4;
- (void)updateTrackingElementsWithOffset:(UIOffset)a3;
- (void)updateTrackingElementsWithSize:(CGSize)a3;
- (void)updateViewConstraints;
- (void)updateViewSizingConstraints;
- (void)updateVisibilityConstraintsForPlacement:(id)a3;
- (void)validateInputView;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willBeginIndirectSelectionGesture;
- (void)willBeginTransitionWithController:(id)a3;
- (void)willResume:(id)a3;
- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4;
- (void)willSnapshot;
@end

@implementation UIInputWindowController

- (int64_t)overrideUserInterfaceStyle
{
  if (dyld_program_sdk_at_least())
  {
    v7.receiver = self;
    v7.super_class = (Class)UIInputWindowController;
    return [(UIViewController *)&v7 overrideUserInterfaceStyle];
  }
  else
  {
    v4 = [(UIViewController *)self view];
    v5 = [v4 _inheritedRenderConfig];
    if ([v5 lightKeyboard]) {
      int64_t v3 = 1;
    }
    else {
      int64_t v3 = 2;
    }
  }
  return v3;
}

- (void)loadView
{
  int64_t v3 = [UIInputSetContainerView alloc];
  v4 = -[UIInputSetContainerView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(UIViewController *)self setView:v4];

  v5 = [(UIViewController *)self view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v6 = [(UIViewController *)self view];
  [v6 setClipsToBounds:1];
}

- (void)performOperations:(id)a3 withAnimationStyle:(id)a4
{
  if (a3)
  {
    id v6 = (void (**)(void))a3;
    [(UIInputWindowController *)self pushAnimationStyle:a4];
    v6[2](v6);

    [(UIInputWindowController *)self popAnimationStyle];
  }
}

- (void)pushAnimationStyle:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_animationStyleStack, "addObject:");
  }
}

- (BOOL)_allowsSkippingLayout
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  int64_t v3 = +[UIWindow _applicationKeyWindow];
  v4 = [v3 windowScene];
  v5 = v4;
  if (v4 && [v4 activationState] == -1
    || ([v3 _orientationTransactionToken],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    unint64_t v7 = 30;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIInputWindowController;
    unint64_t v7 = [(UIApplicationRotationFollowingController *)&v9 supportedInterfaceOrientations];
  }

  return v7;
}

- (int64_t)keyboardOrientation
{
  v2 = [(UIViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  if (v4 <= v6) {
    return 1;
  }
  else {
    return 4;
  }
}

- (UIInputViewSet)inputViewSet
{
  return self->_inputViewSet;
}

- (void)popAnimationStyle
{
  if ([(NSMutableArray *)self->_animationStyleStack count])
  {
    animationStyleStack = self->_animationStyleStack;
    [(NSMutableArray *)animationStyleStack removeLastObject];
  }
}

- (void)setPostRotationPendingBlock:(id)a3
{
}

- (void)setDontDismissReachability:(BOOL)a3
{
  self->_dontDismissReachability = a3;
}

- (BOOL)isOnScreenRotating
{
  double v3 = [(UIInputWindowController *)self postRotationPlacement];
  if (v3)
  {
    double v4 = [(UIInputWindowController *)self postRotationPlacement];
    char v5 = [v4 showsInputViews];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)isSnapshotting
{
  return self->_isSnapshotting;
}

- (UIView)_inputView
{
  v2 = [(UIInputWindowController *)self inputViewSet];
  double v3 = [v2 inputView];

  return (UIView *)v3;
}

- (UIView)_inputAssistantView
{
  v2 = [(UIInputWindowController *)self inputViewSet];
  double v3 = [v2 inputAssistantView];

  return (UIView *)v3;
}

- (BOOL)isOnScreen
{
  v2 = [(UIInputWindowController *)self placement];
  char v3 = [v2 showsInputViews];

  return v3;
}

- (UIInputViewSetPlacement)placement
{
  return self->_placement;
}

- (UIView)_inputAccessoryView
{
  v2 = [(UIInputWindowController *)self inputViewSet];
  char v3 = [v2 inputAccessoryView];

  return (UIView *)v3;
}

- (BOOL)shouldNotifyRemoteKeyboards
{
  return self->_shouldNotifyRemoteKeyboards;
}

- (void)_updateContentOverlayInsetsForSelfAndChildren
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v3 _updateContentOverlayInsetsForSelfAndChildren];
  [(UIInputWindowController *)self updateSupportsDockViewController];
}

- (void)updateSupportsDockViewController
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL supportsDockViewController = self->_supportsDockViewController;
  self->_BOOL supportsDockViewController = +[UIKeyboardImpl showsGlobeAndDictationKeysExternally];
  double v4 = +[UIKeyboardImpl activeInstance];
  char v5 = [v4 window];
  if (v5)
  {
  }
  else
  {
    double v6 = +[UIKeyboardInputModeController sharedInputModeController];
    unint64_t v7 = [v6 currentInputMode];
    int v8 = [v7 isExtensionInputMode];

    if (!v8) {
      goto LABEL_14;
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  objc_super v9 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(*((void *)&v16 + 1) + 8 * v13++) updateSupportsDockViewController];
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  if (supportsDockViewController != self->_supportsDockViewController)
  {
    [(UIInputWindowController *)self updateKeyboardDockViewVisibility];
    v14 = [(UIViewController *)self view];
    int v15 = [v4 isDescendantOfView:v14];

    if (v15) {
      [v4 updateLayout];
    }
  }
LABEL_14:
}

- (void)clearKeyboardSnapshot
{
  keyboardSnapshot = self->_keyboardSnapshot;
  if (keyboardSnapshot)
  {
    double v4 = [(UIView *)keyboardSnapshot superview];
    [v4 removeFromSuperview];

    [(UIView *)self->_keyboardSnapshot removeFromSuperview];
    char v5 = self->_keyboardSnapshot;
    self->_keyboardSnapshot = 0;

    double v6 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unint64_t v7 = 0;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Keyboard Snapshot cleared", v7, 2u);
    }
  }
}

- (UIView)bottomEdgeView
{
  v2 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:4];
  objc_super v3 = [v2 hostView];

  return (UIView *)v3;
}

void __52__UIInputWindowController_updateInputAssistantView___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:102];
  [v1 updateInputAssistantBackdropView];
}

- (CGRect)_visibleFrame
{
  objc_super v3 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
  [v3 notificationsFrame];
  double x = v47.origin.x;
  double y = v47.origin.y;
  double width = v47.size.width;
  double height = v47.size.height;
  if (CGRectGetHeight(v47) == 0.0
    && +[UIKeyboard isInputUIProcess]
    && !+[UIKeyboard inputUIOOP])
  {
    int v8 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    if ([v8 keyboardVisible]
      && ([v8 remoteKeyboardUndocked] & 1) == 0
      && ![v8 isFloating])
    {
      [v8 keyboardPosition];
      CGFloat v35 = v34;
      CGFloat v37 = v36;
      CGFloat v39 = v38;
      CGFloat v41 = v40;
      v42 = [(UIViewController *)self _window];
      [v42 frame];
      double v44 = v43;
      [v8 keyboardPosition];
      CGFloat v46 = v44 - v45;
      v51.origin.double x = v35;
      v51.origin.double y = v37;
      v51.size.double width = v39;
      v51.size.double height = v41;
      CGRect v52 = CGRectOffset(v51, 0.0, v46);
      CGFloat v28 = v52.origin.x;
      CGFloat v27 = v52.origin.y;
      CGFloat v25 = v52.size.width;
      CGFloat v29 = v52.size.height;

      goto LABEL_11;
    }
  }
  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", x, y, width, height);
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  long long v17 = [(UIViewController *)self view];
  long long v18 = [v17 window];
  long long v19 = [v18 screen];
  [v19 bounds];
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  v48.origin.double x = v10;
  v48.origin.double y = v12;
  v48.size.double width = v14;
  v48.size.double height = v16;
  v54.origin.double x = v21;
  v54.origin.double y = v23;
  v54.size.double width = v25;
  v54.size.double height = v27;
  if (CGRectIntersectsRect(v48, v54))
  {
    v49.origin.double x = v10;
    v49.origin.double y = v12;
    v49.size.double width = v14;
    v49.size.double height = v16;
    v55.origin.double x = v21;
    v55.origin.double y = v23;
    v55.size.double width = v25;
    v55.size.double height = v27;
    CGRect v50 = CGRectIntersection(v49, v55);
    CGFloat v28 = v50.origin.x;
    CGFloat v27 = v50.origin.y;
    CGFloat v25 = v50.size.width;
    CGFloat v29 = v50.size.height;
  }
  else
  {
    CGFloat v28 = 0.0;
    CGFloat v29 = 0.0;
  }
LABEL_11:

  double v30 = v28;
  double v31 = v27;
  double v32 = v25;
  double v33 = v29;
  result.size.double height = v33;
  result.size.double width = v32;
  result.origin.double y = v31;
  result.origin.double x = v30;
  return result;
}

- (void)viewWillLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v8 viewWillLayoutSubviews];
  if (!self->_didOverridePreLayoutHostViewFrame)
  {
    objc_super v3 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
    [v3 notificationsFrame];
    self->_preLayoutHostViewFrame.origin.double x = v4;
    self->_preLayoutHostViewFrame.origin.double y = v5;
    self->_preLayoutHostViewFrame.size.double width = v6;
    self->_preLayoutHostViewFrame.size.double height = v7;
  }
  self->_didOverridePreLayoutHostViewFrame = 0;
}

- (BOOL)isTranslating
{
  v2 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:2];
  objc_super v3 = [v2 splitKeyboardController];
  char v4 = [v3 isTranslating];

  return v4;
}

void __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  [v3 someViewDidLayoutSubviews];
  if (([*(id *)(a1 + 32) isTranslating] & 1) == 0
    && ([*(id *)(a1 + 32) isDragging] & 1) == 0)
  {
    [v3 refreshApplicator];
  }
}

- (BOOL)isDragging
{
  v2 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:3];
  char v3 = [v2 scrollKeyboardActive];

  return v3;
}

- (CGRect)convertRectFromContainerCoordinateSpaceToScreenSpace:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v8 = [(UIViewController *)self view];
  objc_msgSend(v8, "convertRect:toView:", 0, x, y, width, height);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  if ([(id)UIApp _isSpringBoard]) {
    goto LABEL_2;
  }
  double v26 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  CGFloat v27 = [v26 visualModeManager];
  char v28 = [v27 windowingModeEnabled];

  if (v28)
  {
LABEL_8:
    long long v17 = [(UIViewController *)self _window];
    double v32 = [v17 windowScene];
    double v33 = [v32 coordinateSpace];
    double v34 = [(UIViewController *)self _window];
    CGFloat v35 = [v34 screen];
    double v36 = [v35 coordinateSpace];
    objc_msgSend(v33, "convertRect:toCoordinateSpace:", v36, v10, v12, v14, v16);
    double v19 = v37;
    double v21 = v38;
    double v23 = v39;
    double v25 = v40;

    goto LABEL_9;
  }
  CGFloat v29 = [(UIViewController *)self _window];
  if (([v29 _isTextEffectsWindow] & 1) == 0)
  {

    goto LABEL_8;
  }
  double v30 = [(UIViewController *)self _window];
  int v31 = [v30 _isHostedInAnotherProcess];

  if (!v31) {
    goto LABEL_8;
  }
LABEL_2:
  long long v17 = [(UIViewController *)self _window];
  objc_msgSend(v17, "convertRect:toWindow:", 0, v10, v12, v14, v16);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
LABEL_9:

  double v41 = v19;
  double v42 = v21;
  double v43 = v23;
  double v44 = v25;
  result.size.double height = v44;
  result.size.double width = v43;
  result.origin.double y = v42;
  result.origin.double x = v41;
  return result;
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v8 viewDidLoad];
  if (!self->_hosting)
  {
    char v3 = [(UIViewController *)self _window];
    if (objc_opt_respondsToSelector())
    {
      char v4 = [(UIViewController *)self _window];
      char v5 = [v4 isForViewService];

      if (v5) {
        return;
      }
    }
    else
    {
    }
    CGFloat v6 = [[UIInputWindowControllerHosting alloc] initWithHost:self];
    hosting = self->_hosting;
    self->_hosting = v6;
  }
}

- (UIEdgeInsets)_viewSafeAreaInsetsFromScene
{
  char v3 = [(UIViewController *)self _window];
  if ([v3 _isTextEffectsWindow]
    && ([v3 _isHostedInAnotherProcess] & 1) != 0)
  {
    [v3 hostedSafeInsets];
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)UIInputWindowController;
    [(UIViewController *)&v16 _viewSafeAreaInsetsFromScene];
  }
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;

  double v12 = v8;
  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  result.right = v15;
  result.bottom = v14;
  result.left = v13;
  result.top = v12;
  return result;
}

- (CGRect)_viewFrameInWindowForContentOverlayInsetsCalculation
{
  char v3 = [(UIViewController *)self _existingView];
  double v4 = [v3 window];

  if (v4
    && [(UIInputViewSetPlacement *)self->_placement requiresWindowBasedSafeAreaInsets])
  {
    [v4 bounds];
  }
  else
  {
    v17.receiver = self;
    v17.super_class = (Class)UIInputWindowController;
    [(UIViewController *)&v17 _viewFrameInWindowForContentOverlayInsetsCalculation];
  }
  double v9 = v5;
  double v10 = v6;
  double v11 = v7;
  double v12 = v8;

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.double height = v16;
  result.size.double width = v15;
  result.origin.double y = v14;
  result.origin.double x = v13;
  return result;
}

- (CGRect)visibleFrame
{
  char v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v4 = [v3 containerRootController];

  if (v4 == self)
  {
    [(UIInputWindowController *)self _visibleFrame];
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }
  else
  {
    double v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v6 = [v5 containerRootController];
    [v6 _visibleFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.double height = v22;
  result.size.double width = v21;
  result.origin.double y = v20;
  result.origin.double x = v19;
  return result;
}

- (BOOL)isUndocked
{
  v2 = [(UIInputWindowController *)self placement];
  char v3 = [v2 isUndocked];

  return v3;
}

- (BOOL)isRotating
{
  v2 = [(UIInputWindowController *)self postRotationPlacement];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)setInputViewSet:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIInputWindowController *)self updateKeyboardSizeClass];
  double v5 = [(UIInputWindowController *)self postRotationPlacement];

  if (!v5)
  {
    double v8 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    if ([v8 handlingRemoteEvent])
    {
      double v9 = [(UIInputWindowController *)self currentTransition];
      double v10 = [v9 fromPlacement];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass) {
        goto LABEL_69;
      }
    }
    else
    {
    }
    if ([v4 isEmpty])
    {
      if (!self->_inputViewSet) {
        goto LABEL_69;
      }
    }
    else
    {
      +[UIInputView _setupAppearanceIfNecessary];
    }
    double v12 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v4;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "Setting input views: %@", buf, 0xCu);
    }

    [(UIInputWindowController *)self updateInputAssistantViewForInputViewSet:v4];
    BOOL v13 = [(UIInputViewSet *)self->_inputViewSet isEqual:v4];
    if (v13)
    {
      uint64_t v44 = 0;
    }
    else
    {
      LODWORD(v44) = ([v4 isInputViewPlaceholder] & 1) != 0
                  || [(UIInputViewSet *)self->_inputViewSet isInputViewPlaceholder];
      if ([v4 isInputViewPlaceholder]) {
        HIDWORD(v44) = ![(UIInputWindowController *)self shouldNotifyRemoteKeyboards];
      }
      else {
        HIDWORD(v44) = 0;
      }
      if ([(UIInputViewSet *)self->_inputViewSet isCustomInputView])
      {
        int v43 = [v4 isCustomInputView] ^ 1;
LABEL_24:
        int v14 = !v13;
        if (+[UIKeyboard usesInputSystemUI]
          && [(UIInputViewSet *)self->_inputViewSet isInputViewPlaceholder])
        {
          double v15 = [(UIInputViewSet *)self->_inputViewSet inputView];
          [v15 fixedSize];
          double v17 = v16;
          [v15 refreshPlaceholder];
          [v15 fixedSize];
          double v19 = v18;
          if (v17 != v18)
          {
            double v20 = _UIInputWindowControllerLogger();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 134218240;
              *(double *)&buf[4] = v17;
              *(_WORD *)&buf[12] = 2048;
              *(double *)&buf[14] = v19;
              _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "Remote keyboard height changed from %.1f to %.1f", buf, 0x16u);
            }

            int v14 = 1;
          }
        }
        double v21 = [(UIInputWindowController *)self nextAnimationStyle];
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        v68 = __Block_byref_object_copy__131;
        v69 = __Block_byref_object_dispose__131;
        id v70 = [(UIInputWindowController *)self currentPresentationPlacement];
        double v22 = [(UIViewController *)self _window];
        double v45 = [v22 windowScene];

        double v23 = [v21 startPlacementForInputViewSet:v4 currentPlacement:*(void *)(*(void *)&buf[8] + 40) windowScene:v45];
        double v24 = [v21 endPlacementForInputViewSet:v4 windowScene:v45];
        [v23 setOtherPlacement:v24];
        [v24 setOtherPlacement:v23];
        double v25 = [(UIInputWindowController *)self currentTransition];
        double v26 = [v25 toPlacement];
        int v27 = [v24 isEqual:v26];

        int v28 = v14 | v27 ^ 1;
        if ((v28 & 1) == 0)
        {
          CGFloat v29 = [(UIInputWindowController *)self currentTransition];
          double v30 = [v29 animationStyle];
          int v31 = [v21 isEqual:v30];

          if (v31)
          {
            double v32 = _UIInputWindowControllerLogger();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v62[0]) = 0;
              _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEFAULT, "Skipping changing input views", (uint8_t *)v62, 2u);
            }

            goto LABEL_68;
          }
        }
        if ([*(id *)(*(void *)&buf[8] + 40) isUndocked]
          && ([v24 isUndocked] & 1) == 0)
        {
          int v33 = [v24 showsInputViews] ^ 1;
        }
        else
        {
          int v33 = 0;
        }
        if (![(UIInputViewSet *)self->_inputViewSet isEqual:v4]
          && ([*(id *)(*(void *)&buf[8] + 40) isEqual:v23] & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
          {
            v63[0] = MEMORY[0x1E4F143A8];
            v63[1] = 3221225472;
            v63[2] = __43__UIInputWindowController_setInputViewSet___block_invoke;
            v63[3] = &unk_1E52E53D0;
            v63[4] = self;
            id v64 = v4;
            v66 = buf;
            id v65 = v23;
            +[UIView performWithoutAnimation:v63];
            [(UIInputWindowControllerHosting *)self->_hosting setRequiresConstraintUpdate:1];

            int v28 = 1;
          }
        }
        objc_initWeak(v62, self);
        [(UIInputWindowController *)self setTransientInputViewSet:v4];
        uint64_t v34 = [*(id *)(*(void *)&buf[8] + 40) notificationsForTransitionToPlacement:v24];
        if (v34 == 3) {
          int v35 = 1;
        }
        else {
          int v35 = HIDWORD(v44);
        }
        if ((v35 | v33) == 1)
        {
          if (HIDWORD(v44)) {
            [v24 setDirty];
          }
          v59[0] = MEMORY[0x1E4F143A8];
          v59[1] = 3221225472;
          v59[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_3;
          v59[3] = &unk_1E52D9960;
          objc_copyWeak(&v61, v62);
          id v60 = v4;
          [(UIInputWindowController *)self setPlacement:v24 starting:0 completion:v59];

          objc_destroyWeak(&v61);
          goto LABEL_67;
        }
        if (v34 != 1)
        {
          if (v34 == 2)
          {
            if (([(UIInputViewSet *)self->_inputViewSet isCustomInputView]
               || ([*(id *)(*(void *)&buf[8] + 40) isFloating] & 1) != 0
               || [v23 showsInputOrAssistantViews])
              && ([v4 isNullInputView] & 1) == 0
              && ([v24 showsKeyboard] & 1) == 0)
            {
              double v39 = [(UIInputWindowController *)self currentTransition];
              double v40 = [v39 toPlacement];
              char v41 = [v40 isEqual:v24];

              char v36 = v41 | v43;
            }
            else
            {
              char v36 = 1;
            }
            v55[0] = MEMORY[0x1E4F143A8];
            v55[1] = 3221225472;
            v55[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_4;
            v55[3] = &unk_1E52EAD18;
            char v58 = v36;
            objc_copyWeak(&v57, v62);
            id v42 = v4;
            id v56 = v42;
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_5;
            v51[3] = &unk_1E52EAD18;
            objc_copyWeak(&v53, v62);
            char v54 = v36;
            id v52 = v42;
            [(UIInputWindowController *)self setPlacement:v24 starting:v55 completion:v51];

            objc_destroyWeak(&v53);
            objc_destroyWeak(&v57);
            goto LABEL_67;
          }
          if (!v28)
          {
            [(UIInputWindowController *)self setTransientInputViewSet:0];
LABEL_67:
            objc_destroyWeak(v62);
LABEL_68:

            _Block_object_dispose(buf, 8);
            goto LABEL_69;
          }
        }
        double v37 = +[UIInputViewSetNotificationInfo info];
        [(UIInputWindowController *)self transferActiveNotificationInfoToInfo:v37];
        [v37 addKeyboardNotificationDebuggingInfo:@"setInputViewSet:"];
        if (v44)
        {
          [v37 forceNotification];
          [v37 setForceNotification:1];
        }
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_7;
        v46[3] = &unk_1E52FC0A8;
        objc_copyWeak(&v50, v62);
        id v47 = v24;
        id v48 = v4;
        id v38 = v37;
        id v49 = v38;
        [(UIInputWindowController *)self performOperations:v46 withTemplateNotificationInfo:v38];

        objc_destroyWeak(&v50);
        goto LABEL_67;
      }
    }
    LOBYTE(v43) = 0;
    goto LABEL_24;
  }
  [(UIInputWindowController *)self setPostRotationInputViewSet:v4];
  double v6 = [(UIInputWindowController *)self initialNotificationInfo];
  [(UIInputWindowController *)self setPostRotationInputViewNotificationInfo:v6];

  double v7 = [(UIInputWindowController *)self postRotationInputViewNotificationInfo];
  [v7 setShouldSendInClient:1];

LABEL_69:
}

- (UIInputViewSetPlacement)postRotationPlacement
{
  return self->_postRotationPlacement;
}

- (void)updateKeyboardSizeClass
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    if (+[UIKeyboardImpl isFloating])
    {
      BOOL v3 = +[UITraitCollection traitCollectionWithHorizontalSizeClass:1];
    }
    else
    {
      BOOL v3 = 0;
    }
    id v4 = [(UIInputWindowController *)self _inputViewController];
    [(UIViewController *)self setOverrideTraitCollection:v3 forChildViewController:v4];

    double v5 = [(UIInputWindowController *)self _inputAssistantViewController];
    [(UIViewController *)self setOverrideTraitCollection:v3 forChildViewController:v5];

    sizeClassCollectionOverride = self->_sizeClassCollectionOverride;
    self->_sizeClassCollectionOverride = v3;
  }
}

- (void)viewDidLayoutSubviews
{
  v20.receiver = self;
  v20.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v20 viewDidLayoutSubviews];
  BOOL v3 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke;
  v19[3] = &unk_1E52FBF00;
  v19[4] = self;
  [v3 enumerateObjectsUsingBlock:v19];

  id v4 = [(UIInputWindowController *)self currentTransition];
  BOOL v5 = v4 != 0;

  if (v4)
  {
    double v6 = [(UIInputWindowController *)self currentTransition];
    BOOL v7 = [v6 notifications] == 0;
  }
  else
  {
    BOOL v7 = 0;
  }
  if ([(UIInputWindowController *)self isOnScreen])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_2;
    v16[3] = &unk_1E52DF220;
    v16[4] = self;
    BOOL v17 = v5;
    BOOL v18 = v7;
    [(UIInputWindowController *)self performWithSafeTransitionFrames:v16];
  }
  else
  {
    double v8 = [(UIInputWindowController *)self currentTransition];
    uint64_t v9 = [v8 notifications];
    double v10 = [(UIInputWindowController *)self currentTransition];
    double v11 = [v10 notificationInfo];
    [(UIInputWindowController *)self updateAmbiguousControlCenterActivationMargin:v9 withInfo:v11];
  }
  if ([(UIInputViewSetNotificationInfo *)self->_rotationInfo forceNotification])
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_3;
    v15[3] = &unk_1E52D9F70;
    v15[4] = self;
    [(UIInputWindowController *)self performWithSafeTransitionFrames:v15];
    double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    BOOL v13 = [(UIInputViewSetNotificationInfo *)self->_rotationInfo rotationUserInfo];
    [v12 postNotificationName:@"_UIKeyboardInternalWillRotateNotification" object:self userInfo:v13];

    rotationInfo = self->_rotationInfo;
    self->_rotationInfo = 0;
  }
}

- (UIInputViewPlacementTransition)currentTransition
{
  return self->_currentTransition;
}

- (void)updateAmbiguousControlCenterActivationMargin:(unint64_t)a3 withInfo:(id)a4
{
  id v15 = a4;
  BOOL v7 = +[UIDevice _hasHomeButton];
  if (!v7)
  {
    id v4 = +[UIDevice currentDevice];
    if ((unint64_t)([v4 orientation] - 3) >= 2)
    {

LABEL_10:
      double v12 = +[UIPeripheralHost sharedInstance];
      BOOL v13 = v12;
      double v14 = 0.0;
      goto LABEL_11;
    }
  }
  double v8 = [(UIInputWindowController *)self placement];
  char v9 = [v8 isUndocked];

  if (!v7) {
  if (v9)
  }
    goto LABEL_10;
  double v10 = 0.0;
  if (a3 != 3)
  {
    [v15 endFrame];
    double v10 = v11;
  }
  double v12 = +[UIPeripheralHost sharedInstance];
  BOOL v13 = v12;
  double v14 = v10;
LABEL_11:
  [v12 setAmbiguousControlCenterActivationMargin:v14];
}

- (BOOL)sizesWindowToScene
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v3 = [v2 visualModeManager];
  char v4 = [v3 windowingModeEnabled];

  return v4;
}

- (void)presentViewController:(id)a3
{
  id v19 = a3;
  char v4 = [(UIInputWindowController *)self inputViewSet];

  if (!v4) {
    [(UIInputWindowController *)self updateViewConstraints];
  }
  BOOL v5 = [(UIViewController *)self childViewControllers];
  int v6 = [v5 containsObject:v19];

  if (v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ already contains %@", self, v19 format];
  }
  [(UIViewController *)self addChildViewController:v19];
  BOOL v7 = [(UIViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v16 = [v19 view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  BOOL v17 = [(UIViewController *)self view];
  BOOL v18 = [v19 view];
  [v17 addSubview:v18];

  [v19 didMoveToParentViewController:self];
}

- (UIInputWindowController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)UIInputWindowController;
  char v4 = [(UIApplicationRotationFollowingController *)&v11 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    BOOL v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    animationStyleStack = v4->_animationStyleStack;
    v4->_animationStyleStack = v5;

    uint64_t v7 = +[UIInputViewSetPlacement placement];
    placement = v4->_placement;
    v4->_placement = (UIInputViewSetPlacement *)v7;

    v4->_shouldNotifyRemoteKeyboards = 1;
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 addObserver:v4 selector:sel_willResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v9 addObserver:v4 selector:sel_didSuspend_ name:@"UIApplicationDidEnterBackgroundNotification" object:0];
    [v9 addObserver:v4 selector:sel_hostViewWillDisappear name:0x1ED1803C0 object:0];
    [v9 addObserver:v4 selector:sel_hostViewDidEnterBackground name:0x1ED1802E0 object:0];
    [v9 addObserver:v4 selector:sel_hostViewWillenterForeground name:0x1ED180300 object:0];
    [v9 addObserver:v4 selector:sel_updateKeyboardDockViewVisibility name:@"UITextInputNextInputModeInputModeDidChangeNotification" object:0];
    [v9 addObserver:v4 selector:sel_updateKeyboardDockViewVisibility name:@"UIKeyboardNeedsUpdatingKeyboardDockViewVisibilityNotification" object:0];
    [v9 addObserver:v4 selector:sel_willBeginIndirectSelectionGesture name:@"UIKeyboardWillBeginIndirectSelectionGestureNotification" object:0];
    [v9 addObserver:v4 selector:sel_didEndIndirectSelectionGesture name:@"UIKeyboardDidEndIndirectSelectionGestureNotification" object:0];
    [v9 addObserver:v4 selector:sel_presentationTransitionWillBegin_ name:@"UIPresentationControllerPresentationTransitionWillBeginNotification" object:0];
    [v9 addObserver:v4 selector:sel_presentationTransitionDidEnd_ name:@"UIPresentationControllerDismissalTransitionDidEndNotification" object:0];
  }
  return v4;
}

- (unint64_t)changeToInputViewSet:(id)a3
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  BOOL v5 = (UIInputViewSet *)a3;
  int v6 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    inputViewSet = self->_inputViewSet;
    *(_DWORD *)buf = 138412290;
    v112 = inputViewSet;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "Change from input view set: %@", buf, 0xCu);
  }

  double v8 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v112 = v5;
    _os_log_impl(&dword_1853B0000, v8, OS_LOG_TYPE_DEFAULT, "Change to input view set: %@", buf, 0xCu);
  }

  p_inputViewSet = &self->_inputViewSet;
  double v10 = self->_inputViewSet;
  objc_storeStrong((id *)&self->_inputViewSet, a3);
  [(UIInputWindowController *)self setTransientInputViewSet:0];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke;
  aBlock[3] = &unk_1E52FC080;
  aBlock[4] = self;
  objc_super v11 = v5;
  v110 = v11;
  v105 = _Block_copy(aBlock);
  [(UIInputWindowControllerHosting *)self->_hosting initializeTranslateGestureRecognizerIfNecessary];
  self->_isChangingInputViews = 1;
  double v12 = [(UIInputWindowController *)self _inputViewController];
  double v13 = [v12 view];
  double v14 = [(UIInputViewSet *)v11 inputView];

  hosting = self->_hosting;
  if (v13 == v14)
  {
    id v38 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:100];
    [v38 updateInputBackdropViewVisibility];

    unint64_t v37 = 0;
  }
  else
  {
    double v16 = [(UIInputViewSet *)v11 inputView];
    [(UIInputWindowControllerHosting *)hosting disableViewSizingConstraints:1 forNewView:v16];

    BOOL v17 = [(UIInputWindowController *)self _inputViewController];
    BOOL v18 = v17;
    if (!v17) {
      BOOL v17 = self;
    }
    uint64_t v19 = [v17 _appearState];

    [(UIInputWindowController *)self invalidateInputView];
    objc_super v20 = [(UIInputViewSet *)*p_inputViewSet inputView];

    if (v20)
    {
      if ([(UIInputViewSet *)*p_inputViewSet isInputViewPlaceholder])
      {
        double v21 = [(UIInputViewSet *)*p_inputViewSet inputView];
        [v21 refreshPlaceholder];

        [(UIInputWindowController *)self updateKeyboardLayoutGuideForRefreshedPlaceholder];
      }
      *(void *)&self->super.super.super._viewControllerFlags |= 0x200000uLL;
      double v22 = [(UIInputViewSet *)*p_inputViewSet inputViewController];
      [(UIInputWindowController *)self set_inputViewController:v22];

      double v23 = [(UIInputWindowController *)self _inputViewController];
      double v24 = [v23 parentViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        double v26 = [(UIInputWindowController *)self _inputViewController];
        int v27 = [v26 parentViewController];
        [v27 invalidateInputView];
      }
      int v28 = [(UIInputWindowController *)self _inputViewController];
      [(UIViewController *)self _addChildViewController:v28 performHierarchyCheck:dyld_program_sdk_at_least() notifyWillMove:1];

      CGFloat v29 = [(UIInputWindowController *)self _inputViewController];
      double v30 = [v29 view];
      int v31 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:100];
      [v31 setInputView:v30];

      double v32 = [(UIInputWindowController *)self _inputViewController];
      [v32 didMoveToParentViewController:self];

      [(UIInputWindowController *)self changeChild:1 toAppearState:v19 animated:0];
      *(void *)&self->super.super.super._viewControllerFlags &= ~0x200000uLL;
      int v33 = [(UIInputWindowController *)self _inputViewController];
      uint64_t v34 = [v33 view];
      int v35 = [(UIViewController *)self view];
      char v36 = [v35 _inheritedRenderConfig];
      [v34 _setRenderConfig:v36];

      p_inputViewSet = &self->_inputViewSet;
    }
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke_2;
    v108[3] = &unk_1E52D9F70;
    v108[4] = self;
    +[UIView performWithoutAnimation:v108];
    unint64_t v37 = 1;
  }
  double v39 = [(UIInputWindowController *)self _inputAssistantViewController];
  double v40 = [v39 view];
  char v41 = [(UIInputViewSet *)v11 inputAssistantView];
  if (v40 == v41)
  {
    [(UIViewController *)self _window];
    int v43 = v42 = p_inputViewSet;
    [(UIInputViewSet *)v11 inputAssistantView];
    v45 = uint64_t v44 = v10;
    CGFloat v46 = [v45 window];

    double v10 = v44;
    BOOL v47 = v43 == v46;
    p_inputViewSet = v42;
    if (v47) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  [(UIInputWindowController *)self updateInputAssistantView:v11];
  v37 |= 2uLL;
LABEL_20:
  id v48 = [(UIInputWindowController *)self _inputAccessoryViewController];
  id v49 = [v48 view];
  id v50 = [(UIInputViewSet *)v11 inputAccessoryView];

  if (v49 == v50)
  {
    v80 = [(UIInputWindowController *)self _inputAccessoryViewController];
    uint64_t v81 = [v80 view];
    if (v81)
    {
      v82 = (void *)v81;
      v104 = p_inputViewSet;
      v102 = v10;
      v83 = [(UIInputWindowController *)self _inputAccessoryViewController];
      v84 = [v83 view];
      v85 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:101];
      v86 = [v85 hostView];
      char v87 = [v84 isDescendantOfView:v86];

      if ((v87 & 1) == 0)
      {
        v88 = [(UIInputWindowController *)self _inputAccessoryViewController];
        v89 = [v88 view];
        v90 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:101];
        [v90 setInputAccessoryView:v89];

        v106[0] = MEMORY[0x1E4F143A8];
        v106[1] = 3221225472;
        v106[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke_4;
        v106[3] = &unk_1E52D9F70;
        v106[4] = self;
        +[UIView performWithoutAnimation:v106];
      }
      double v10 = v102;
      p_inputViewSet = v104;
      v79 = v105;
    }
    else
    {

      v79 = v105;
    }
    goto LABEL_40;
  }
  CGRect v51 = self->_hosting;
  id v52 = [(UIInputViewSet *)v11 inputAccessoryView];
  [(UIInputWindowControllerHosting *)v51 disableViewSizingConstraints:4 forNewView:v52];

  id v53 = [(UIInputWindowController *)self _inputAccessoryViewController];
  char v54 = v53;
  if (!v53) {
    id v53 = self;
  }
  unsigned int v55 = [v53 _appearState];

  [(UIInputWindowController *)self invalidateInputAccessoryView];
  if (!(*((unsigned int (**)(void))v105 + 2))()) {
    goto LABEL_38;
  }
  id v56 = [(UIInputViewSet *)*p_inputViewSet inputAccessoryView];

  if (v56)
  {
    *(void *)&self->super.super.super._viewControllerFlags |= 0x200000uLL;
    v103 = p_inputViewSet;
    id v57 = [(UIInputViewSet *)*p_inputViewSet accessoryViewController];
    [(UIInputWindowController *)self set_inputAccessoryViewController:v57];

    char v58 = [(UIInputWindowController *)self _inputAccessoryViewController];
    v59 = [v58 parentViewController];

    if (!v59) {
      goto LABEL_32;
    }
    v101 = v10;
    id v60 = [(UIInputWindowController *)self _inputAccessoryViewController];
    id v61 = [v60 view];
    v62 = [v61 _responderWindow];
    v63 = [v62 _firstResponder];

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || ([(UIInputWindowController *)self _inputAccessoryViewController],
          id v64 = objc_claimAutoreleasedReturnValue(),
          [v64 view],
          id v65 = objc_claimAutoreleasedReturnValue(),
          char v66 = [v65 containsView:v63],
          v65,
          v64,
          (v66 & 1) == 0))
    {

      v63 = 0;
    }
    v67 = [(UIInputWindowController *)self _inputAccessoryViewController];
    v68 = [v67 parentViewController];

    objc_opt_class();
    double v10 = v101;
    if (objc_opt_isKindOfClass()) {
      [v68 invalidateInputAccessoryView];
    }
    [v63 _becomeFirstResponderWhenPossible];
    int v69 = (*((uint64_t (**)(void *))v105 + 2))(v105);

    if (v69)
    {
LABEL_32:
      id v70 = [(UIInputWindowController *)self _inputAccessoryViewController];
      [(UIViewController *)self _addChildViewController:v70 performHierarchyCheck:dyld_program_sdk_at_least() notifyWillMove:1];

      uint64_t v71 = [(UIInputWindowController *)self _inputAccessoryViewController];
      v72 = [v71 view];
      v73 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:101];
      [v73 setInputAccessoryView:v72];

      v74 = [(UIInputWindowController *)self _inputAccessoryViewController];
      [v74 didMoveToParentViewController:self];

      [(UIInputWindowController *)self changeChild:4 toAppearState:v55 animated:0];
      *(void *)&self->super.super.super._viewControllerFlags &= ~0x200000uLL;
      v75 = [(UIInputWindowController *)self _inputAccessoryViewController];
      v76 = [v75 view];
      v77 = [(UIViewController *)self view];
      v78 = [v77 _inheritedRenderConfig];
      [v76 _setRenderConfig:v78];

      p_inputViewSet = v103;
      goto LABEL_33;
    }
LABEL_38:
    unint64_t v37 = 0;
    v79 = v105;
    goto LABEL_49;
  }
LABEL_33:
  v37 |= 4uLL;
  v107[0] = MEMORY[0x1E4F143A8];
  v107[1] = 3221225472;
  v107[2] = __48__UIInputWindowController_changeToInputViewSet___block_invoke_3;
  v107[3] = &unk_1E52D9F70;
  v107[4] = self;
  +[UIView performWithoutAnimation:v107];
  v79 = v105;
LABEL_40:
  self->_isChangingInputViews = 0;
  [(UIInputWindowController *)self updateInputAssistantViewForInputViewSet:*p_inputViewSet];
  [(UIInputWindowController *)self updateKeyboardDockViewVisibility];
  if (v37 || [(UIInputWindowControllerHosting *)self->_hosting requiresConstraintUpdate]) {
    [(UIInputWindowController *)self updateViewConstraints];
  }
  [(UIInputWindowController *)self updateGestureRecognizers];
  v91 = [(UIInputViewSet *)v10 inputView];
  v92 = [v91 superview];

  if (!v92)
  {
    v93 = [(UIInputViewSet *)v10 inputView];
    [v93 _clearOverrideNextResponder];
  }
  v94 = [(UIInputViewSet *)v10 inputAssistantView];
  v95 = [v94 superview];

  if (!v95)
  {
    v96 = [(UIInputViewSet *)v10 inputAssistantView];
    [v96 _clearOverrideNextResponder];
  }
  v97 = [(UIInputViewSet *)v10 inputAccessoryView];
  v98 = [v97 superview];

  if (!v98)
  {
    v99 = [(UIInputViewSet *)v10 inputAccessoryView];
    [v99 _clearOverrideNextResponder];
  }
LABEL_49:

  return v37;
}

- (UIInputViewController)_inputAccessoryViewController
{
  return self->_inputAccessoryViewController;
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v3 updateViewConstraints];
  if (!self->_suppressUpdateViewConstraints) {
    [(UIInputWindowControllerHosting *)self->_hosting updateViewConstraints];
  }
}

- (void)updateKeyboardDockViewVisibility
{
  id v2 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_614];
}

- (void)updateInputAssistantViewForInputViewSet:(id)a3
{
  id v41 = a3;
  if (![(UIInputWindowController *)self isRotating])
  {
    char v4 = v41;
    if (!v41)
    {
      char v4 = [(UIInputWindowController *)self inputViewSet];
    }
    id v41 = v4;
    if (([v4 isEmpty] & 1) == 0 && (objc_msgSend(v41, "isRemoteKeyboard") & 1) == 0)
    {
      BOOL v5 = [v41 inputAssistantView];

      if (!v5
        || ([v41 assistantViewController],
            int v6 = objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            char isKindOfClass = objc_opt_isKindOfClass(),
            v6,
            (isKindOfClass & 1) == 0))
      {
LABEL_25:
        [(UIInputWindowController *)self updateViewConstraints];
        goto LABEL_26;
      }
      double v8 = [v41 assistantViewController];
      double v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v10 = [v9 responder];

      objc_super v11 = [v10 _window];
      double v12 = [v11 windowScene];
      double v13 = [v12 keyboardSceneDelegate];

      double v40 = v13;
      uint64_t v14 = [v13 systemInputAssistantViewController];
      if ((void *)v14 == v8)
      {
      }
      else
      {
        double v15 = (void *)v14;
        double v16 = [v10 _window];
        int v17 = [v16 _isRemoteKeyboardWindow];

        if (!v17) {
          goto LABEL_13;
        }
      }
      [v8 automaticallySetCenterViewControllerBasedOnInputDelegate:v10];
LABEL_13:
      int v18 = [v8 shouldBeShownForInputDelegate:0 inputViews:v41];
      uint64_t v19 = [v41 inputAssistantView];
      objc_super v20 = [v19 window];
      double v21 = v20;
      double v22 = off_1E52D4000;
      if (v20)
      {
        id v23 = v20;
      }
      else
      {
        double v24 = [v41 inputView];
        id v23 = [v24 window];
      }
      double v25 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v26 = [v25 visualModeManager];
      if ([v26 windowingModeEnabled])
      {
        +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        v28 = int v27 = v10;
        [v28 visualModeManager];
        v30 = id v29 = v23;
        int v31 = [v30 shouldShowWithinAppWindow];

        id v23 = v29;
        double v10 = v27;
        double v22 = off_1E52D4000;
      }
      else
      {
        int v31 = 0;
      }

      [v23 windowScene];
      v33 = double v32 = v23;
      uint64_t v34 = [(__objc2_class *)v22[21] activeKeyboardSceneDelegate];
      int v35 = [v34 scene];

      if (v33 == v35) {
        int v36 = v18;
      }
      else {
        int v36 = 0;
      }
      if (!v31) {
        int v36 = v18;
      }
      uint64_t v37 = v36 ^ 1u;
      id v38 = [v8 view];
      [v38 setHidden:v37];

      [v8 updateCenterViewVisibilityStateForInputDelegate:0];
      double v39 = [(UIInputWindowController *)self placement];
      [(UIInputWindowController *)self updateVisibilityConstraintsForPlacement:v39];

      goto LABEL_25;
    }
  }
LABEL_26:
}

- (void)updateInputAssistantView:(id)a3
{
  id v4 = a3;
  if (!+[UIKeyboard usesInputSystemUI]
    || +[UIKeyboard usesLocalKeyboard])
  {
    uint64_t v5 = [(UIViewController *)self _window];
    if (v5)
    {
      int v6 = (void *)v5;
      uint64_t v7 = [(UIInputWindowController *)self _inputAssistantViewController];
      double v8 = [v7 view];
      double v9 = [v4 inputAssistantView];
      if (v8 != v9)
      {

        goto LABEL_7;
      }
      double v10 = [(UIViewController *)self _window];
      objc_super v11 = [v4 inputAssistantView];
      double v12 = [v11 window];

      if (v10 != v12)
      {
LABEL_7:
        double v13 = [(UIInputWindowController *)self _inputAssistantViewController];
        uint64_t v14 = v13;
        if (!v13) {
          double v13 = self;
        }
        uint64_t v15 = [v13 _appearState];

        hosting = self->_hosting;
        int v17 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];
        [(UIInputWindowControllerHosting *)hosting disableViewSizingConstraints:2 forNewView:v17];

        [(UIInputWindowController *)self invalidateInputAssistantView];
        int v18 = [(UIInputViewSet *)self->_inputViewSet inputAssistantView];

        if (!v18) {
          goto LABEL_17;
        }
        *(void *)&self->super.super.super._viewControllerFlags |= 0x200000uLL;
        uint64_t v19 = [(UIInputViewSet *)self->_inputViewSet assistantViewController];
        [(UIInputWindowController *)self set_inputAssistantViewController:v19];

        objc_super v20 = [(UIInputWindowController *)self _inputAssistantViewController];
        uint64_t v21 = [v20 parentViewController];
        if (v21)
        {
          double v22 = (void *)v21;
          BOOL v23 = +[UIKeyboard usesLocalKeyboard];

          if (v23)
          {
LABEL_14:
            double v25 = [(UIInputWindowController *)self _inputAssistantViewController];
            [(UIViewController *)self _addChildViewController:v25 performHierarchyCheck:dyld_program_sdk_at_least() notifyWillMove:1];

            sizeClassCollectionOverride = self->_sizeClassCollectionOverride;
            if (sizeClassCollectionOverride)
            {
              int v27 = [(UIInputWindowController *)self _inputAssistantViewController];
              [(UIViewController *)self setOverrideTraitCollection:sizeClassCollectionOverride forChildViewController:v27];
            }
            int v28 = [(UIInputWindowController *)self _inputAssistantViewController];
            id v29 = [v28 view];
            double v30 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:102];
            [v30 setInputAssistantView:v29];

            int v31 = [(UIInputWindowController *)self _inputAssistantViewController];
            [v31 didMoveToParentViewController:self];

            [(UIInputWindowController *)self changeChild:2 toAppearState:v15 animated:0];
            *(void *)&self->super.super.super._viewControllerFlags &= ~0x200000uLL;
            double v32 = [(UIInputWindowController *)self _inputAssistantViewController];
            int v33 = [v32 view];
            uint64_t v34 = [(UIViewController *)self view];
            int v35 = [v34 _inheritedRenderConfig];
            [v33 _setRenderConfig:v35];

LABEL_17:
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __52__UIInputWindowController_updateInputAssistantView___block_invoke;
            v36[3] = &unk_1E52D9F70;
            v36[4] = self;
            +[UIView performWithoutAnimation:v36];
            goto LABEL_18;
          }
          objc_super v20 = [(UIInputWindowController *)self _inputAssistantViewController];
          double v24 = [v20 parentViewController];
          [v24 invalidateInputAssistantView];
        }
        goto LABEL_14;
      }
    }
  }
LABEL_18:
}

- (UIInputViewController)_inputAssistantViewController
{
  return self->_inputAssistantViewController;
}

- (void)updateGestureRecognizers
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1) {
    return;
  }
  objc_super v3 = [(UIInputWindowController *)self inputViewSet];
  uint64_t v4 = [v3 inputView];
  if (!v4)
  {

    goto LABEL_8;
  }
  uint64_t v5 = (void *)v4;
  int v6 = [(UIInputWindowController *)self inputViewSet];
  char v7 = [v6 isInputViewPlaceholder];

  if (v7)
  {
LABEL_8:
    floatingTransitionController = self->_floatingTransitionController;
    if (!floatingTransitionController) {
      return;
    }
    [(UIKeyboardFloatingTransitionController *)floatingTransitionController setDelegate:0];
    [(UIKeyboardFloatingTransitionController *)self->_floatingTransitionController removeGestureRecognizers];
    double v12 = self->_floatingTransitionController;
    self->_floatingTransitionController = 0;
    goto LABEL_10;
  }
  double v8 = self->_floatingTransitionController;
  if (!v8)
  {
    double v9 = objc_alloc_init(UIKeyboardFloatingTransitionController);
    double v10 = self->_floatingTransitionController;
    self->_floatingTransitionController = v9;

    double v8 = self->_floatingTransitionController;
  }
  [(UIKeyboardFloatingTransitionController *)v8 setDelegate:self];
  objc_super v11 = self->_floatingTransitionController;
  uint64_t v14 = [(UIViewController *)self view];
  [(UIKeyboardFloatingTransitionController *)v11 addGestureRecognizersToView:v14];
  double v12 = (UIKeyboardFloatingTransitionController *)v14;
LABEL_10:
}

- (void)setTransientInputViewSet:(id)a3
{
}

- (BOOL)isChangingInputViews
{
  return self->_isChangingInputViews;
}

- (void)invalidateInputAssistantView
{
  objc_super v3 = [(UIInputWindowController *)self _inputAssistantViewController];
  uint64_t v4 = [v3 view];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__UIInputWindowController_invalidateInputAssistantView__block_invoke;
  v5[3] = &unk_1E52D9F70;
  v5[4] = self;
  [v4 _preserveResponderOverridesWhilePerforming:v5];
}

- (UIInputViewController)_inputViewController
{
  return self->_inputViewController;
}

- (CGRect)_defaultInitialViewFrame
{
  id v2 = [(UIViewController *)self _screen];
  if (!__SplashBoardOverrideStatusBarOrientation) {
    [(id)UIApp _safeInterfaceOrientationForNoWindow];
  }
  objc_msgSend(v2, "_boundsForInterfaceOrientation:");
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

- (void)willResume:(id)a3
{
  double v4 = [(UIInputWindowController *)self placement];
  if ([v4 showsKeyboard])
  {
    double v5 = [(UIInputWindowController *)self inputViewSet];
    double v6 = [v5 keyboard];
    [(UIInputWindowController *)self registerPowerLogEvent:v6 != 0];
  }
  else
  {
    [(UIInputWindowController *)self registerPowerLogEvent:0];
  }

  if (![(UIInputWindowController *)self shouldNotifyRemoteKeyboards]
    && self->_keyboardShowTimestamp)
  {
    double v7 = [MEMORY[0x1E4F1C9C8] date];
    keyboardShowTimestamp = self->_keyboardShowTimestamp;
    self->_keyboardShowTimestamp = v7;
  }
  keyboardSnapshot = self->_keyboardSnapshot;
  if (keyboardSnapshot)
  {
    [(UIView *)keyboardSnapshot frame];
    double v11 = v10;
    double v12 = [(UIViewController *)self view];
    [v12 frame];
    double v14 = v13;

    if (v11 != v14)
    {
      [(UIInputWindowController *)self clearKeyboardSnapshot];
    }
  }
}

- (void)registerPowerLogEvent:(BOOL)a3
{
  BOOL v3 = a3;
  v12[4] = *MEMORY[0x1E4F143B8];
  if (a3 || self->_wasOnScreen)
  {
    double v5 = +[UIKeyboardInputModeController sharedInputModeController];
    double v6 = [v5 currentInputMode];

    if ([v6 isExtensionInputMode])
    {
      double v7 = [v6 identifier];
    }
    else
    {
      double v7 = @"System";
    }
    if (v7 != (__CFString *)self->_lastKeyboardID || self->_wasOnScreen != v3)
    {
      v11[0] = @"Process-ID";
      double v8 = [NSNumber numberWithInt:getpid()];
      v12[0] = v8;
      v12[1] = v7;
      v11[1] = @"Keyboard-ID";
      v11[2] = @"Status";
      double v9 = [NSNumber numberWithBool:v3];
      v12[2] = v9;
      v11[3] = @"Timestamp";
      double v10 = [MEMORY[0x1E4F1C9C8] date];
      v12[3] = v10;
      [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:4];
      PLLogRegisteredEvent();

      self->_wasOnScreen = v3;
      objc_storeStrong((id *)&self->_lastKeyboardID, v7);
    }
  }
}

- (void)presentationTransitionWillBegin:(id)a3
{
  id v4 = a3;
  double v5 = [v4 object];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_initWeak(&location, self);
    double v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v7 = [v6 visualModeManager];

    double v8 = [v5 presentingViewController];
    if (v8 == self && [v7 windowingModeEnabled])
    {
      char v9 = [v7 shouldShowWithinAppWindow];

      if ((v9 & 1) == 0
        && SpringBoardServicesLibraryCore()
        && getSBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc())
      {
        double v10 = dispatch_get_global_queue(25, 0);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke;
        v11[3] = &unk_1E52DC308;
        objc_copyWeak(&v12, &location);
        dispatch_async(v10, v11);

        objc_destroyWeak(&v12);
      }
    }
    else
    {
    }
    objc_destroyWeak(&location);
  }
}

- (void)dealloc
{
  v6[11] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationWillEnterForegroundNotification";
  v6[1] = @"UIApplicationDidEnterBackgroundNotification";
  v6[2] = 0x1ED1803C0;
  v6[3] = 0x1ED1802E0;
  v6[4] = 0x1ED180300;
  v6[5] = @"UITextInputNextInputModeInputModeDidChangeNotification";
  v6[6] = @"UIKeyboardNeedsUpdatingKeyboardDockViewVisibilityNotification";
  v6[7] = @"UIKeyboardWillBeginIndirectSelectionGestureNotification";
  v6[8] = @"UIKeyboardDidEndIndirectSelectionGestureNotification";
  v6[9] = @"UIPresentationControllerPresentationTransitionWillBeginNotification";
  v6[10] = @"UIPresentationControllerDismissalTransitionDidEndNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:11];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(UIInputWindowController *)self setFullScreenPresentationAssertion:0];
  v5.receiver = self;
  v5.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v5 dealloc];
}

- (BOOL)_isSecure
{
  return 1;
}

- (void)_updatePlacementWithPlacement:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  double v6 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v5;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "updatePlacementWithPlacement: %@", buf, 0xCu);
  }

  [(UIInputWindowController *)self updateKeyboardPlacementForGuide:v5];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  objc_opt_class();
  char v8 = objc_opt_isKindOfClass();
  if ([(UIInputViewSetPlacement *)self->_placement isHiddenForFloatingTransition]) {
    BOOL v9 = [(UIInputViewSetPlacement *)self->_placement applicatorClassForKeyboard:1] == 0;
  }
  else {
    BOOL v9 = 0;
  }
  [(UIInputWindowControllerHosting *)self->_hosting unloadForPlacement];
  objc_storeStrong((id *)&self->_placement, a3);
  hosting = self->_hosting;
  double v11 = [(UIInputWindowController *)self transientInputViewSet];
  if (v11)
  {
    [(UIInputWindowControllerHosting *)hosting reloadForPlacementForInputViewSet:v11];
  }
  else
  {
    id v12 = [(UIInputWindowController *)self inputViewSet];
    [(UIInputWindowControllerHosting *)hosting reloadForPlacementForInputViewSet:v12];
  }
  char v13 = isKindOfClass ^ v8;

  if (v9)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __57__UIInputWindowController__updatePlacementWithPlacement___block_invoke;
    v18[3] = &unk_1E52D9F70;
    v18[4] = self;
    +[UIView performWithoutAnimation:v18];
  }
  if ((v13 & 1) != 0
    && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIDevice _hasHomeButton])
  {
    [(UIInputWindowControllerHosting *)self->_hosting updateViewSizingConstraints];
  }
  double v14 = [(UIInputWindowController *)self inputViewSet];
  uint64_t v15 = [v14 assistantViewController];
  uint64_t v16 = [v15 assistantBarStyle];

  if (v16 == 1 && ([v5 isFloatingAssistantView] & 1) == 0)
  {
    int v17 = [(UIInputWindowController *)self inputViewSet];
    [(UIInputWindowController *)self updateInputAssistantViewForInputViewSet:v17];
  }
}

void __57__UIInputWindowController__updatePlacementWithPlacement___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 layoutIfNeeded];
}

- (void)didReceiveMemoryWarning
{
  v2.receiver = self;
  v2.super_class = (Class)UIInputWindowController;
  [(UIViewController *)&v2 didReceiveMemoryWarning];
}

+ (BOOL)_isSecureForRemoteViewService
{
  return 1;
}

- (BOOL)crescendoEnabled
{
  objc_super v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v3 = [v2 crescendoEnabled];

  return v3;
}

- (void)setExclusiveTouch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = [*(id *)(*((void *)&v10 + 1) + 8 * v8) hostView];
        [v9 setExclusiveTouch:v3];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)setInputViewSet:(id)a3 forKeyboardAssistantBar:(id)a4
{
  id v8 = a3;
  [v8 setKeyboardAssistantBar:a4];
  id v6 = [(UIInputWindowController *)self inputViewSet];

  uint64_t v7 = v8;
  if (v6 == v8)
  {
    [(UIInputWindowController *)self updateInputAssistantView:v8];
    [(UIInputWindowController *)self updateViewConstraints];
    uint64_t v7 = v8;
  }
}

- (void)prepareForInputAssistant:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v14 = a3;
  id v6 = [(UIInputWindowController *)self inputViewSet];
  uint64_t v7 = [v6 inputAssistantView];
  id v8 = [v7 window];
  int v9 = [v8 _isTextEffectsWindow];

  if (([v6 isEmpty] & 1) == 0 && (objc_msgSend(v6, "isRemoteKeyboard") & v9 & 1) == 0)
  {
    long long v10 = [v6 inputAssistantView];

    if (v10)
    {
      long long v11 = [v6 assistantViewController];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        long long v13 = [v6 assistantViewController];
        [v13 prepareTransition:v14 animated:v4];
      }
    }
  }
}

- (void)didSuspend:(id)a3
{
  if (![(UIInputWindowController *)self shouldNotifyRemoteKeyboards]
    && self->_keyboardShowTimestamp)
  {
    BOOL v4 = [MEMORY[0x1E4F1C9C8] date];
    [v4 timeIntervalSinceDate:self->_keyboardShowTimestamp];
    double v6 = v5;

    +[_UIKeyboardUsageTracking keyboardTotalOnScreenTime:[(UIInputWindowController *)self keyboardOrientation] orientation:v6];
  }
  [(UIInputWindowController *)self registerPowerLogEvent:0];
}

- (void)hostViewWillDisappear
{
  BOOL v3 = [(UIInputWindowController *)self postRotationInputViewSet];
  if (v3
    || ([(UIInputWindowController *)self postRotationPlacement],
        (BOOL v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

LABEL_4:
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __48__UIInputWindowController_hostViewWillDisappear__block_invoke;
    v5[3] = &unk_1E52D9F70;
    v5[4] = self;
    +[UIView performWithoutAnimation:v5];
    return;
  }
  BOOL v4 = [(UIInputWindowController *)self postRotationPendingBlock];

  if (v4) {
    goto LABEL_4;
  }
}

uint64_t __48__UIInputWindowController_hostViewWillDisappear__block_invoke(uint64_t a1)
{
  id v1 = *(void **)(a1 + 32);
  uint64_t v2 = [v1 keyboardOrientation];
  return [v1 didRotateFromInterfaceOrientation:v2];
}

- (void)hostViewDidEnterBackground
{
  uint64_t v2 = [(UIViewController *)self _window];
  int v3 = [v2 _isRemoteKeyboardWindow];

  if (v3)
  {
    id v4 = +[UIPeripheralHost sharedInstance];
    [v4 setKeyboardOnScreenNotifyKey:0];
  }
}

- (void)hostViewWillenterForeground
{
  int v3 = [(UIViewController *)self _window];
  int v4 = [v3 _isRemoteKeyboardWindow];

  if (v4)
  {
    double v5 = [(UIInputWindowController *)self inputViewSet];
    double v6 = [v5 keyboard];
    if (v6)
    {
      if ([(UIInputWindowController *)self isOnScreen])
      {
        uint64_t v7 = [(UIInputWindowController *)self placement];
        BOOL v8 = ([v7 showsKeyboard] & 1) != 0 || -[UIInputWindowController isUndocked](self, "isUndocked");
      }
      else
      {
        BOOL v8 = [(UIInputWindowController *)self isUndocked];
      }
    }
    else
    {
      BOOL v8 = 0;
    }

    id v9 = +[UIPeripheralHost sharedInstance];
    [v9 setKeyboardOnScreenNotifyKey:v8];
  }
}

- (UIKeyboardPathEffectView)_pathEffectView
{
  pathEffectView = self->_pathEffectView;
  if (!pathEffectView)
  {
    if ([MEMORY[0x1E4F22448] isCurrentProcessAnApplicationExtension])
    {
      int v4 = (objc_class *)objc_opt_class();
    }
    else
    {
      uint64_t v12 = 0;
      long long v13 = &v12;
      uint64_t v14 = 0x2050000000;
      double v5 = (void *)qword_1EB25C3E0;
      uint64_t v15 = qword_1EB25C3E0;
      if (!qword_1EB25C3E0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __getTUIKeyboardPathEffectViewClass_block_invoke;
        v11[3] = &unk_1E52D9900;
        void v11[4] = &v12;
        __getTUIKeyboardPathEffectViewClass_block_invoke((uint64_t)v11);
        double v5 = (void *)v13[3];
      }
      int v4 = v5;
      _Block_object_dispose(&v12, 8);
    }
    id v6 = [v4 alloc];
    uint64_t v7 = (UIKeyboardPathEffectView *)objc_msgSend(v6, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    BOOL v8 = self->_pathEffectView;
    self->_pathEffectView = v7;

    [(UIView *)self->_pathEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_pathEffectView setAlpha:0.0];
    id v9 = [(UIViewController *)self view];
    [v9 addSubview:self->_pathEffectView];

    pathEffectView = self->_pathEffectView;
  }
  return pathEffectView;
}

- (void)performWithoutAppearanceCallbacks:(id)a3
{
}

- (void)performWithoutCallbacksOrNotifications:(id)a3
{
}

- (void)performOperations:(id)a3 withTemplateNotificationInfo:(id)a4
{
  id v6 = (void (**)(void))a3;
  [(UIInputWindowController *)self setTemplateNotificationInfo:a4];
  v6[2](v6);

  [(UIInputWindowController *)self setTemplateNotificationInfo:0];
}

- (void)performWithSafeTransitionFrames:(id)a3
{
  if (self->_inhibitingHiding)
  {
    int v3 = (void (*)(void))*((void *)a3 + 2);
    id v9 = a3;
    v3();
  }
  else
  {
    int hiddenCount = self->_hiddenCount;
    id v6 = (void (**)(void))a3;
    uint64_t v7 = [(UIInputWindowController *)self inputSetContainerView];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke;
    v12[3] = &unk_1E52E7FF0;
    int v13 = hiddenCount;
    v12[4] = self;
    [v7 performWithoutGeometryObserverNotifications:v12];

    self->_inhibitingHiding = 1;
    v6[2](v6);

    LODWORD(v7) = self->_hiddenCount + hiddenCount;
    self->_int hiddenCount = 0;
    self->_inhibitingHiding = 0;
    BOOL v8 = [(UIInputWindowController *)self inputSetContainerView];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke_2;
    v10[3] = &unk_1E52E7FF0;
    int v11 = (int)v7;
    v10[4] = self;
    [v8 performWithoutGeometryObserverNotifications:v10];
  }
}

uint64_t __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke(uint64_t result)
{
  if (*(int *)(result + 40) >= 1)
  {
    uint64_t v1 = result;
    int v2 = 0;
    do
    {
      CGRect result = [*(id *)(v1 + 32) setInputViewsHidden:0];
      ++v2;
    }
    while (v2 < *(_DWORD *)(v1 + 40));
  }
  return result;
}

uint64_t __59__UIInputWindowController_performWithSafeTransitionFrames___block_invoke_2(uint64_t result)
{
  if (*(int *)(result + 40) >= 1)
  {
    uint64_t v1 = result;
    int v2 = 0;
    do
    {
      CGRect result = [*(id *)(v1 + 32) setInputViewsHidden:1];
      ++v2;
    }
    while (v2 < *(_DWORD *)(v1 + 40));
  }
  return result;
}

- (CGPoint)_centerForOrientation:(int64_t)a3
{
  double v5 = [(UIViewController *)self _screen];
  [v5 _boundsForInterfaceOrientation:a3];
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  CGFloat v11 = v10;
  CGFloat v13 = v12;

  v21.origin.double x = v7;
  v21.origin.double y = v9;
  v21.size.double width = v11;
  v21.size.double height = v13;
  double MidX = CGRectGetMidX(v21);
  v22.origin.double x = v7;
  v22.origin.double y = v9;
  v22.size.double width = v11;
  v22.size.double height = v13;
  double MidY = CGRectGetMidY(v22);
  uint64_t v16 = [(UIViewController *)self _window];
  if ([(id)objc_opt_class() _transformLayerRotationsAreEnabled])
  {

    double v17 = MidX;
  }
  else
  {
    unint64_t v18 = a3 - 3;

    if (v18 >= 2) {
      double v17 = MidX;
    }
    else {
      double v17 = MidY;
    }
    if (v18 < 2) {
      double MidY = MidX;
    }
  }
  double v19 = MidY;
  result.double y = v19;
  result.double x = v17;
  return result;
}

- (CGRect)_boundsForOrientation:(int64_t)a3
{
  int v4 = [(UIViewController *)self _screen];
  [v4 _boundsForInterfaceOrientation:a3];
  double v6 = v5;
  double v8 = v7;

  double v9 = *MEMORY[0x1E4F1DAD8];
  double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  double v11 = v6;
  double v12 = v8;
  result.size.double height = v12;
  result.size.double width = v11;
  result.origin.double y = v10;
  result.origin.double x = v9;
  return result;
}

- (void)ignoreLayoutNotifications:(id)a3
{
  int v4 = (void (**)(void))a3;
  if (+[_UIRemoteKeyboards enabled])
  {
    int v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v3 ignoreLayoutNotifications:v4];
  }
  else
  {
    v4[2]();
  }
}

- (void)dismissViewController:(id)a3
{
  id v7 = a3;
  int v4 = [(UIViewController *)self childViewControllers];
  char v5 = [v4 containsObject:v7];

  if ((v5 & 1) == 0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ does not contain %@", self, v7 format];
  }
  [v7 willMoveToParentViewController:0];
  double v6 = [v7 view];
  [v6 removeFromSuperview];

  [v7 removeFromParentViewController];
}

- (void)willBeginTransitionWithController:(id)a3
{
  int v4 = +[UIKeyboardImpl activeInstance];
  [v4 prepareForFloatingTransition:1];

  [(UIInputWindowController *)self setInterfaceAutorotationDisabled:1];
}

- (void)didEndTransitionWithController:(id)a3
{
  int v4 = +[UIKeyboardImpl activeInstance];
  [v4 prepareForFloatingTransition:0];

  [(UIInputWindowController *)self setInterfaceAutorotationDisabled:0];
  char v5 = +[UIKeyboardImpl activeInstance];
  [v5 geometryChangeDone:1];

  id v16 = [(UIInputWindowController *)self initialNotificationInfo];
  double v6 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:0];
  [v6 notificationsFrame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;

  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v8, v10, v12, v14);
  objc_msgSend(v16, "populateEndInfoWithFrame:");
  [v16 addKeyboardNotificationDebuggingInfo:@"didEndTransitionWithController:"];
  if (+[UIKeyboardImpl isFloating]) {
    uint64_t v15 = 3;
  }
  else {
    uint64_t v15 = 2;
  }
  [(UIInputWindowController *)self postValidatedStartNotifications:v15 withInfo:v16];
  [(UIInputWindowController *)self postValidatedEndNotifications:v15 withInfo:v16];
  [(UIInputWindowController *)self keyboardMoveOfType:1 info:v16];
  [(UIInputWindowControllerHosting *)self->_hosting updateCombinedBackdropViewAnimated:0 forKeyboardUp:1];
  [(UIInputWindowController *)self updateKeyboardSizeClass];
}

- (BOOL)shouldBeginTransitionForController:(id)a3
{
  int v4 = +[UIKeyboardImpl activeInstance];
  if (!+[UIKeyboardImpl supportsFloating]
    || ([v4 isMinimized] & 1) != 0
    || ([v4 isTrackpadMode] & 1) != 0)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    double v7 = [(UIInputWindowController *)self inputViewSet];
    int v5 = [v7 isCustomInputView] ^ 1;
  }
  return v5;
}

- (BOOL)isViewLandscape
{
  int v2 = [(UIViewController *)self view];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;

  return v4 > v6;
}

- (BOOL)_shouldPresentViewController:(id)a3 withPresentationController:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        NSLog(&cfstr_KeyboardCannot.isa, v5);
      }
    }
  }

  return 1;
}

- (void)updateViewSizingConstraints
{
}

- (UIEdgeInsets)_inputViewPadding
{
  [(UIInputWindowControllerHosting *)self->_hosting _inputViewPadding];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)updateVisibilityConstraintsForPlacement:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_suppressUpdateVisibilityConstraints) {
    goto LABEL_19;
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  double v5 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    CGRect v21 = self;
    id obj = v5;
    int v8 = 0;
    char v9 = 0;
    uint64_t v10 = *(void *)v24;
    while (1)
    {
      uint64_t v11 = 0;
      uint64_t v12 = v8;
      do
      {
        if (*(void *)v24 != v10) {
          objc_enumerationMutation(obj);
        }
        double v13 = *(void **)(*((void *)&v23 + 1) + 8 * v11);
        char v14 = objc_msgSend(v4, "accessoryViewWillAppear", v21);
        if (v12 + v11)
        {
          uint64_t v15 = [v4 subPlacements];
          id v16 = [v15 objectAtIndexedSubscript:v12 + v11 - 1];

          if (!v16) {
            goto LABEL_10;
          }
LABEL_9:
          [v13 updateVisibilityConstraintsForPlacement:v16];
          goto LABEL_10;
        }
        id v16 = v4;
        if (v16) {
          goto LABEL_9;
        }
LABEL_10:
        v9 |= v14;

        ++v11;
      }
      while (v7 != v11);
      uint64_t v17 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
      uint64_t v7 = v17;
      int v8 = v12 + v11;
      if (!v17)
      {

        unint64_t v18 = [(UIViewController *)v21 view];
        [v18 setNeedsLayout];

        if (v9)
        {
          double v19 = [(UIInputWindowController *)v21 _inputAccessoryView];
          goto LABEL_18;
        }
        goto LABEL_19;
      }
    }
  }

  double v19 = [(UIViewController *)self view];
LABEL_18:
  id v20 = v19;
  [v19 setNeedsLayout];

LABEL_19:
}

- (void)hostAppSceneBoundsChanged
{
  [(UIInputWindowControllerHosting *)self->_hosting updateConstraintInsets];
  if ([(UIInputWindowController *)self shouldNotifyRemoteKeyboards])
  {
    double v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v3 sceneUpdated];
  }
  if (self->_shouldNotifyRemoteKeyboards) {
    NotifyVC(self);
  }
  id v4 = [(UIViewController *)self _window];
  int v5 = [v4 _isHostedInAnotherProcess];

  uint64_t v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v7 = [v6 visualModeManager];
  char v8 = [v7 windowingModeEnabled];

  if ((v8 & 1) != 0 || v5)
  {
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __52__UIInputWindowController_hostAppSceneBoundsChanged__block_invoke;
    v25[3] = &unk_1E52D9FC0;
    char v26 = v5;
    v25[4] = self;
    [(UIInputWindowController *)self performWithoutCallbacksOrNotifications:v25];
  }
  if (+[UIKeyboardImpl isFloating])
  {
    char v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v10 = [v9 visualModeManager];
    int v11 = [v10 windowingModeEnabled];

    if (v11)
    {
      +[UIKeyboardImpl floatingPersistentOffset];
      double v13 = v12;
      double v15 = v14;
      id v16 = [(UIInputWindowController *)self inputViewSet];
      [v16 inputViewBounds];
      +[UIPeripheralHost adjustedFloatingOffsetForKeyboardSize:](UIPeripheralHost, "adjustedFloatingOffsetForKeyboardSize:", v17, v18);
      double v20 = v19;
      double v22 = v21;

      if (v13 != v20 || v15 != v22)
      {
        long long v23 = +[UIPeripheralHost sharedInstance];
        objc_msgSend(v23, "setUndockedWithOffset:animated:", 1, v20, v22);
      }
    }
  }
  long long v24 = +[UIKeyboardImpl activeInstance];
  [v24 dismissEmojiPopoverIfNecessaryWithCompletion:0];
}

uint64_t __52__UIInputWindowController_hostAppSceneBoundsChanged__block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:0 layoutSubviews:0];
  }
  double v2 = *(void **)(a1 + 32);
  return [v2 refreshKeyboardLayoutGuide];
}

- (void)takeKeyboardSnapshotIgnoringSpotlightCheck:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[UIKeyboard usesInputSystemUI] || self->_keyboardSnapshot) {
    return;
  }
  id v30 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
  int v5 = [v30 currentUIState];
  uint64_t v6 = [v5 bundleIdentifier];
  uint64_t v7 = _UIMainBundleIdentifier();
  if (![v6 isEqualToString:v7]) {
    goto LABEL_13;
  }
  char v8 = +[UIKeyboardImpl activeInstance];
  uint64_t v9 = [v8 inputDelegate];
  if (!v9)
  {
LABEL_12:

LABEL_13:

    return;
  }
  uint64_t v10 = (void *)v9;
  int v11 = [(UIInputWindowController *)self inputViewSet];
  if ([v11 isCustomInputView])
  {
LABEL_11:

    goto LABEL_12;
  }
  id v29 = [(UIInputWindowController *)self inputViewSet];
  uint64_t v28 = [v29 inputView];
  [v28 frame];
  if (v12 <= 0.0 || +[UIKeyboard isSpotlight] && !v3)
  {

    goto LABEL_11;
  }
  char v13 = [(id)UIApp _isSpringBoard];

  if ((v13 & 1) == 0)
  {
    double v14 = +[UIKeyboard snapshotViewForOptions:1];
    keyboardSnapshot = self->_keyboardSnapshot;
    self->_keyboardSnapshot = v14;

    id v16 = [(UIInputWindowController *)self inputViewSet];
    double v17 = [v16 inputView];
    double v18 = [v17 superview];

    double v19 = [(UIViewController *)self view];
    objc_msgSend(v19, "convertPoint:fromView:", v18, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    double v21 = v20;
    double v23 = v22;

    [(UIView *)self->_keyboardSnapshot frame];
    CGRect v34 = CGRectOffset(v33, 0.0, -v23);
    -[UIView setFrame:](self->_keyboardSnapshot, "setFrame:", v34.origin.x, v34.origin.y, v34.size.width, v34.size.height);
    long long v24 = [UIView alloc];
    [v18 frame];
    long long v25 = -[UIView initWithFrame:](v24, "initWithFrame:", v21, v23);
    [(UIView *)v25 setClipsToBounds:1];
    [(UIView *)v25 addSubview:self->_keyboardSnapshot];
    char v26 = [(UIViewController *)self view];
    [v26 addSubview:v25];

    int v27 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v27, OS_LOG_TYPE_DEFAULT, "Keyboard Snapshot taken", buf, 2u);
    }
  }
}

- (void)willSnapshot
{
  self->_isSnapshotting = 1;
  if ([(UIInputWindowController *)self shouldNotifyRemoteKeyboards])
  {
    id v2 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v2 setSnapshotting:1];
  }
}

- (void)didSnapshot
{
  if ([(UIInputWindowController *)self shouldNotifyRemoteKeyboards])
  {
    BOOL v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v3 setSnapshotting:0];
  }
  self->_isSnapshotting = 0;
}

- (BOOL)trackingElementsShouldUseActualFrame
{
  BOOL v3 = [(UIInputWindowController *)self placement];
  if ([v3 isUndocked])
  {
    char v4 = 1;
  }
  else
  {
    int v5 = [(UIInputWindowController *)self placement];
    if ([v5 isFloating])
    {
      char v4 = 1;
    }
    else
    {
      uint64_t v6 = [(UIInputWindowController *)self placement];
      if ([v6 isCompactAssistantView])
      {
        char v4 = 1;
      }
      else
      {
        uint64_t v7 = [(UIInputWindowController *)self placement];
        char v4 = [v7 isHiddenForFloatingTransition];
      }
    }
  }
  return v4 ^ 1;
}

- (void)updateTrackingElementsWithSize:(CGSize)a3
{
  double height = a3.height;
  CGFloat width = a3.width;
  if (![(UIInputWindowController *)self trackingElementsShouldUseActualFrame]
    && height > 0.0)
  {
    uint64_t v6 = [(UIViewController *)self _window];
    [v6 bounds];
    CGFloat width = v7;

    double height = 0.0;
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__UIInputWindowController_updateTrackingElementsWithSize___block_invoke;
  v8[3] = &__block_descriptor_48_e33_v16__0__UIKeyboardSceneDelegate_8l;
  *(CGFloat *)&v8[4] = width;
  *(double *)&v8[5] = height;
  +[UIKeyboardSceneDelegate performOnControllers:v8];
}

uint64_t __58__UIInputWindowController_updateTrackingElementsWithSize___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForSize:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (void)updateTrackingElementsWithOffset:(UIOffset)a3
{
  v3[1] = 3221225472;
  if (a3.vertical != 0.0) {
    a3.horizontal = 0.0;
  }
  v3[0] = MEMORY[0x1E4F143A8];
  v3[2] = __60__UIInputWindowController_updateTrackingElementsWithOffset___block_invoke;
  v3[3] = &__block_descriptor_48_e33_v16__0__UIKeyboardSceneDelegate_8l;
  if (a3.vertical != 0.0) {
    a3.vertical = 0.0;
  }
  UIOffset v4 = a3;
  +[UIKeyboardSceneDelegate performOnControllers:v3];
}

uint64_t __60__UIInputWindowController_updateTrackingElementsWithOffset___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "updateTrackingElementsForOffset:", *(double *)(a1 + 32), *(double *)(a1 + 40));
}

- (BOOL)currentControllerShouldUpdateKeyboardLayoutGuide
{
  BOOL v3 = [(UIViewController *)self _window];
  UIOffset v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  int v5 = [v4 showsInvisibleKeyboardBehindWTUI];

  if (v5)
  {
    char v6 = [v3 _isRemoteKeyboardWindow];
LABEL_13:
    char v9 = v6 ^ 1;
    goto LABEL_14;
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    int v7 = 1;
  }
  else
  {
    char v8 = [(UIViewController *)self _window];
    if ([v8 _isRemoteKeyboardWindow]) {
      int v7 = [v3 _isHostedInAnotherProcess];
    }
    else {
      int v7 = 1;
    }
  }
  if (([v3 _isTextEffectsWindowNotificationOwner] & 1) != 0 || !v7)
  {
    char v6 = [v3 isForViewService];
    goto LABEL_13;
  }
  char v9 = 0;
LABEL_14:

  return v9;
}

- (void)hostedOriginDidUpdate
{
  BOOL v3 = [(UIInputWindowController *)self inputViewSet];
  int v4 = [v3 isInputViewPlaceholder];

  if (v4)
  {
    int v5 = [(UIInputWindowController *)self inputViewSet];
    char v6 = [v5 inputView];
    [v6 refreshPlaceholder];

    [(UIInputWindowController *)self refreshKeyboardLayoutGuideForce:1];
  }
}

- (void)refreshKeyboardLayoutGuide
{
}

- (void)refreshKeyboardLayoutGuideForce:(BOOL)a3
{
  BOOL v3 = a3;
  if (+[UIKeyboard isInputSystemUI]) {
    return;
  }
  if (![(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])return; {
  int v5 = [(UIInputWindowController *)self postRotationPlacement];
  }

  if (v5)
  {
    if (!v3) {
      return;
    }
  }
  char v6 = [(UIInputWindowController *)self currentTransition];

  if (v6)
  {
    if (!v3)
    {
      int v7 = [(UIInputWindowController *)self currentTransition];
      char v8 = [v7 fromPlacement];
      objc_opt_class();
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0) {
        return;
      }
    }
  }
  uint64_t v10 = [(UIInputWindowController *)self placement];
  if ([v10 showsInputOrAssistantViews]) {
    goto LABEL_11;
  }
  int v11 = [(UIInputWindowController *)self placement];
  if ([v11 isFloatingAssistantView])
  {

LABEL_11:
    goto LABEL_12;
  }
  int v27 = [(UIInputWindowController *)self inputViewSet];
  uint64_t v28 = [v27 inputAccessoryView];

  if (v28)
  {
LABEL_12:
    double v12 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:0];
    [v12 notificationsFrame];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      double v21 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      int v22 = [v21 hasActiveKeyboardResponder];

      if (v22)
      {
        -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v14, v16, v18, v20);
        double v14 = v23;
        double v16 = v24;
        double v18 = v25;
        double v20 = v26;
      }
    }
    -[UIInputWindowController keyboardMovedToScreenPosition:animated:](self, "keyboardMovedToScreenPosition:animated:", 0, v14, v16, v18, v20);
    return;
  }
  [(UIInputWindowController *)self updateOffscreenKeyboardLayoutGuide];
}

- (void)changeGuideAnimationOptions:(unint64_t)a3 duration:(double)a4
{
  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __64__UIInputWindowController_changeGuideAnimationOptions_duration___block_invoke;
    v6[3] = &__block_descriptor_48_e22_v24__0__UIWindow_8_B16l;
    *(double *)&v6[4] = a4;
    v6[5] = a3;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v6];
  }
}

void __64__UIInputWindowController_changeGuideAnimationOptions_duration___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isTrackingKeyboard])
  {
    BOOL v3 = [v4 _primaryKeyboardTrackingGuide];
    [v3 updateAnimationDuration:*(void *)(a1 + 40) options:*(double *)(a1 + 32)];
  }
}

- (void)changeGuideAnimationState:(BOOL)a3
{
  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__UIInputWindowController_changeGuideAnimationState___block_invoke;
    v4[3] = &__block_descriptor_33_e22_v24__0__UIWindow_8_B16l;
    BOOL v5 = a3;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v4];
  }
}

void __53__UIInputWindowController_changeGuideAnimationState___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isTrackingKeyboard])
  {
    BOOL v3 = [v4 _primaryKeyboardTrackingGuide];
    [v3 enableAnimations:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void)hideGuideBackdrop:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__UIInputWindowController_hideGuideBackdrop___block_invoke;
  v3[3] = &__block_descriptor_33_e22_v24__0__UIWindow_8_B16l;
  BOOL v4 = a3;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v3];
}

void __45__UIInputWindowController_hideGuideBackdrop___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isTrackingKeyboard])
  {
    BOOL v3 = [v4 _primaryKeyboardTrackingGuide];
    [v3 hideLightEffectsView:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (id)transitionGuideBackdrop:(BOOL)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  double v12 = __Block_byref_object_copy__131;
  double v13 = __Block_byref_object_dispose__131;
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__UIInputWindowController_transitionGuideBackdrop___block_invoke;
  v7[3] = &unk_1E52FBE60;
  BOOL v8 = a3;
  v7[4] = self;
  v7[5] = &v9;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v7];
  if ([(id)v10[5] count])
  {
    [(id)v10[5] setObject:MEMORY[0x1E4F1CC38] forKey:0x1ED149E40];
    id v5 = (id)v10[5];
  }
  else
  {
    id v5 = 0;
  }
  _Block_object_dispose(&v9, 8);

  return v5;
}

void __51__UIInputWindowController_transitionGuideBackdrop___block_invoke(uint64_t a1, void *a2)
{
  id v11 = a2;
  int v3 = [v11 isTrackingKeyboard];
  id v4 = v11;
  if (v3)
  {
    id v5 = [v11 _primaryKeyboardTrackingGuide];
    [v5 transitionBackdropForAnimationStart:*(unsigned __int8 *)(a1 + 48)];

    char v6 = [v11 _primaryKeyboardTrackingGuide];
    int v7 = [v6 guideBackdropMatchLayer];

    if (v7)
    {
      BOOL v8 = *(void **)(a1 + 32);
      uint64_t v9 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
      uint64_t v10 = [v8 _infoForBackdropMatchMoveForLayer:v7];
      [v9 setObject:v10 forKey:0x1ED149E60];
    }
    id v4 = v11;
  }
}

- (BOOL)updateGuideBackdropRenderConfig:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __68__UIInputWindowController_updateGuideBackdropRenderConfig_animated___block_invoke;
  v9[3] = &unk_1E52FBE60;
  id v11 = &v13;
  id v6 = v5;
  id v10 = v6;
  BOOL v12 = a4;
  +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v9];
  char v7 = *((unsigned char *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return v7;
}

void __68__UIInputWindowController_updateGuideBackdropRenderConfig_animated___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isTrackingKeyboard])
  {
    int v3 = [v4 _primaryKeyboardTrackingGuide];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 updateLightEffectsRenderConfig:*(void *)(a1 + 32) animated:*(unsigned __int8 *)(a1 + 48)];
  }
}

- (void)keyboardIsDocking:(BOOL)a3
{
  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __45__UIInputWindowController_keyboardIsDocking___block_invoke;
    v4[3] = &__block_descriptor_33_e22_v24__0__UIWindow_8_B16l;
    BOOL v5 = a3;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v4];
  }
}

void __45__UIInputWindowController_keyboardIsDocking___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 isTrackingKeyboard])
  {
    int v3 = [v4 _primaryKeyboardTrackingGuide];
    [v3 setDocked:*(unsigned __int8 *)(a1 + 32)];
  }
}

- (void)updateKeyboardPlacementForGuide:(id)a3
{
  id v4 = a3;
  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __59__UIInputWindowController_updateKeyboardPlacementForGuide___block_invoke;
    v5[3] = &unk_1E52DAE18;
    id v6 = v4;
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v5];
  }
}

void __59__UIInputWindowController_updateKeyboardPlacementForGuide___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 isTrackingKeyboard]) {
    [v3 updateGuideForKeyboardPlacement:*(void *)(a1 + 32)];
  }
}

- (void)keyboardMoveOfType:(unint64_t)a3 info:(id)a4
{
  id v12 = a4;
  if (([v12 dueToRotation] & 1) == 0)
  {
    id v6 = [(UIInputWindowController *)self postRotationPlacement];

    if (a3 != 4 && !v6 && !+[UIKeyboard isInputSystemUI])
    {
      switch(a3)
      {
        case 0uLL:
          char v7 = [(UIInputWindowController *)self placement];
          if (![v7 isFloating]) {
            goto LABEL_13;
          }
          int v8 = [v12 wasCausedRemotely];

          if (v8) {
            goto LABEL_16;
          }
          break;
        case 1uLL:
          char v7 = [(UIInputWindowController *)self placement];
          if ([v7 isFloating])
          {
LABEL_13:
          }
          else
          {
            id v10 = [(UIInputWindowController *)self placement];
            char v11 = [v10 isFloatingAssistantView];

            if ((v11 & 1) == 0) {
              goto LABEL_18;
            }
          }
          break;
        case 2uLL:
LABEL_18:
          [(UIInputWindowController *)self keyboardMoveWithInfo:v12];
          break;
        case 3uLL:
          if (([v12 dueToRotation] & 1) == 0)
          {
            uint64_t v9 = [(UIInputWindowController *)self postRotationPlacement];

            if (!v9) {
LABEL_16:
            }
              [(UIInputWindowController *)self keyboardDismissWithInfo:v12];
          }
          break;
        default:
          break;
      }
    }
  }
}

- (void)keyboardDismissWithInfo:(id)a3
{
  id v4 = a3;
  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    if (([v4 dueToRotation] & 1) == 0)
    {
      BOOL v5 = [(UIInputWindowController *)self postRotationPlacement];

      if (!v5)
      {
        id v6 = [(UIViewController *)self _window];
        [v6 bounds];
        -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v7, 0.0);

        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __51__UIInputWindowController_keyboardDismissWithInfo___block_invoke;
        v8[3] = &unk_1E52DAE18;
        id v9 = v4;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v8];
      }
    }
  }
}

void __51__UIInputWindowController_keyboardDismissWithInfo___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  if ([v15 isTrackingKeyboard])
  {
    [*(id *)(a1 + 32) beginFrame];
    double v4 = v3;
    double v6 = v5;
    [*(id *)(a1 + 32) endFrame];
    double v9 = vabdd_f64(v4, v7);
    uint64_t v10 = 4;
    uint64_t v11 = 2;
    uint64_t v12 = 4;
    if (v7 > v4) {
      uint64_t v12 = 8;
    }
    if (v4 <= v7) {
      uint64_t v11 = v12;
    }
    if (v9 > 5.0) {
      uint64_t v10 = v11;
    }
    if (v6 == v8) {
      uint64_t v13 = v10;
    }
    else {
      uint64_t v13 = 4;
    }
    [*(id *)(a1 + 32) duration];
    [v15 moveKeyboardLayoutGuideOverEdge:v13 layoutViews:v14 > 0.0];
  }
}

- (void)moveKeyboardLayoutGuideOffscreen
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    [(UIInputWindowController *)self updateOffscreenKeyboardLayoutGuide];
  }
}

- (void)updateOffscreenKeyboardLayoutGuide
{
  double v3 = [(UIViewController *)self _window];
  [v3 bounds];
  -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v4, 0.0);

  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:&__block_literal_global_349];
  }
}

void __61__UIInputWindowController_updateOffscreenKeyboardLayoutGuide__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ([v7 isTrackingKeyboard])
  {
    id v2 = [v7 _primaryKeyboardTrackingGuide];
    [v7 bounds];
    double v4 = v3;
    [v7 insetForDismissedKeyboardGuide];
    int v6 = objc_msgSend(v2, "changeSizingConstants:", v4, v5);

    if (v6) {
      [v7 layoutViewsForTrackedGuides];
    }
  }
}

- (void)updateGuideForOffscreenRotationWithDuration:(double)a3
{
  id v6 = [(UIInputWindowController *)self placement];
  if ([v6 isFloating])
  {
LABEL_4:

    return;
  }
  double v4 = [(UIInputWindowController *)self placement];
  if ([v4 isFloatingAssistantView])
  {

    goto LABEL_4;
  }
  BOOL v5 = +[UIKeyboardCameraSession updatesGuideDuringRotation];

  if (!v5)
  {
    [(UIInputWindowController *)self updateOffscreenKeyboardLayoutGuide];
  }
}

- (void)updateKeyboardLayoutGuideWithFrame:(CGRect)a3 layoutViews:(BOOL)a4
{
  double height = a3.size.height;
  double width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if (UIRectIsDiscrete(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height))
  {
    v36.origin.CGFloat x = x;
    v36.origin.CGFloat y = y;
    v36.size.double width = width;
    v36.size.double height = height;
    if (!CGRectIsNull(v36))
    {
      -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", width, height);
      v37.origin.CGFloat x = x;
      v37.origin.CGFloat y = y;
      v37.size.double width = width;
      v37.size.double height = height;
      double MaxY = CGRectGetMaxY(v37);
      uint64_t v11 = [(UIViewController *)self _window];
      [v11 frame];
      double v12 = CGRectGetMaxY(v38);

      if (MaxY < v12)
      {
        v39.origin.CGFloat x = x;
        v39.origin.CGFloat y = y;
        v39.size.double width = width;
        v39.size.double height = height;
        double MinX = CGRectGetMinX(v39);
        double v14 = [(UIViewController *)self _window];
        [v14 frame];
        double v15 = CGRectGetMaxY(v40);
        v41.origin.CGFloat x = x;
        v41.origin.CGFloat y = y;
        v41.size.double width = width;
        v41.size.double height = height;
        -[UIInputWindowController updateTrackingElementsWithOffset:](self, "updateTrackingElementsWithOffset:", MinX, v15 - CGRectGetMaxY(v41));
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke;
      aBlock[3] = &unk_1E52FBE88;
      *(CGFloat *)&void aBlock[5] = x;
      *(CGFloat *)&aBlock[6] = y;
      *(double *)&aBlock[7] = width;
      *(double *)&aBlock[8] = height;
      aBlock[4] = self;
      BOOL v33 = a4;
      char v16 = _Block_copy(aBlock);
      double v17 = [(UIViewController *)self _window];
      int v18 = [v17 _isHostedInAnotherProcess];

      if (v18)
      {
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke_2;
        v30[3] = &unk_1E52FBEB0;
        id v31 = v16;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v30];
        double v19 = v31;
      }
      else
      {
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        double v20 = [(UIViewController *)self _window];
        double v21 = [v20 windowScene];
        double v19 = [v21 windows];

        uint64_t v22 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v22)
        {
          uint64_t v23 = v22;
          uint64_t v24 = *(void *)v27;
          do
          {
            uint64_t v25 = 0;
            do
            {
              if (*(void *)v27 != v24) {
                objc_enumerationMutation(v19);
              }
              (*((void (**)(void *, void))v16 + 2))(v16, *(void *)(*((void *)&v26 + 1) + 8 * v25++));
            }
            while (v23 != v25);
            uint64_t v23 = [v19 countByEnumeratingWithState:&v26 objects:v34 count:16];
          }
          while (v23);
        }
      }
    }
  }
}

void __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke(uint64_t a1, void *a2)
{
  id v54 = a2;
  if ([v54 isTrackingKeyboard])
  {
    [v54 frame];
    double v4 = v3;
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    uint64_t v11 = [*(id *)(a1 + 32) _window];
    double v12 = [v11 screen];
    uint64_t v13 = [v12 coordinateSpace];
    double v14 = [*(id *)(a1 + 32) _window];
    double v15 = [v14 coordinateSpace];
    objc_msgSend(v13, "convertRect:toCoordinateSpace:", v15, *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;

    uint64_t v24 = [*(id *)(a1 + 32) _window];
    uint64_t v25 = [v24 coordinateSpace];
    long long v26 = [v54 coordinateSpace];
    objc_msgSend(v25, "convertRect:fromCoordinateSpace:", v26, v4, v6, v8, v10);

    v56.origin.double x = v4;
    v56.origin.double y = v6;
    v56.size.double width = v8;
    v56.size.double height = v10;
    v62.origin.double x = v17;
    v62.origin.double y = v19;
    v62.size.double width = v21;
    v62.size.double height = v23;
    CGRect v57 = CGRectIntersection(v56, v62);
    double x = v57.origin.x;
    double y = v57.origin.y;
    double width = v57.size.width;
    double height = v57.size.height;
    if (CGRectIsNull(v57))
    {
      [v54 frame];
      CGFloat MaxY = CGRectGetMaxY(v58);
      [v54 frame];
      double v33 = v32;
      [v54 insetForDismissedKeyboardGuide];
      double v35 = v34;
      CGFloat v36 = 0.0;
    }
    else
    {
      CGRect v37 = [*(id *)(a1 + 32) _window];
      CGRect v38 = [v37 coordinateSpace];
      CGRect v39 = [v54 coordinateSpace];
      objc_msgSend(v38, "convertRect:toCoordinateSpace:", v39, x, y, width, height);
      CGFloat v36 = v40;
      CGFloat MaxY = v41;
      double v33 = v42;
      double v35 = v43;
    }
    [v54 insetForDismissedKeyboardGuide];
    if (v35 < v44)
    {
      [v54 insetForDismissedKeyboardGuide];
      double v35 = v45;
    }
    [v54 frame];
    double v46 = CGRectGetMaxY(v59);
    v60.origin.double x = v36;
    v60.origin.double y = MaxY;
    v60.size.double width = v33;
    v60.size.double height = v35;
    double v47 = v46 - CGRectGetMaxY(v60);
    if (!*(unsigned char *)(a1 + 72))
    {
      id v48 = [v54 _primaryKeyboardTrackingGuide];
      [v48 enableAnimations:0];
    }
    id v49 = [v54 _primaryKeyboardTrackingGuide];
    v61.origin.double x = v36;
    v61.origin.double y = MaxY;
    v61.size.double width = v33;
    v61.size.double height = v35;
    char v50 = objc_msgSend(v49, "changeOffsetConstants:", CGRectGetMinX(v61), v47);

    CGRect v51 = [v54 _primaryKeyboardTrackingGuide];
    int v52 = objc_msgSend(v51, "changeSizingConstants:", v33, v35);

    if (((v50 & 1) != 0 || v52) && *(unsigned char *)(a1 + 72)) {
      [v54 layoutViewsForTrackedGuides];
    }
    id v53 = [v54 _primaryKeyboardTrackingGuide];
    [v53 enableAnimations:1];
  }
}

uint64_t __74__UIInputWindowController_updateKeyboardLayoutGuideWithFrame_layoutViews___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)keyboardMoveWithInfo:(id)a3
{
  id v30 = a3;
  BOOL v4 = [(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide];
  double v5 = v30;
  if (v4)
  {
    [v30 endFrame];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(UIViewController *)self _window];
    int v15 = [v14 _isHostedInAnotherProcess];

    double v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    int v17 = [v16 hasActiveKeyboardResponder];

    v32.origin.double x = v7;
    v32.origin.double y = v9;
    v32.size.double width = v11;
    v32.size.double height = v13;
    if (!CGRectIsEmpty(v32))
    {
      BOOL v23 = ((v15 | v17 ^ 1) & 1) != 0 || +[UIKeyboard usesInputSystemUI];
      uint64_t v24 = [(UIViewController *)self _window];
      int v25 = [v24 _isRemoteKeyboardWindow];

      long long v26 = [(UIInputWindowController *)self inputViewSet];
      int v27 = [v26 isInputViewPlaceholder];

      char v28 = [v30 forWritingToolsSheet];
      double v5 = v30;
      if ((v28 & 1) == 0 && v27 && (v23 & ~v25) == 0) {
        goto LABEL_14;
      }
      [v30 duration];
      -[UIInputWindowController keyboardMovedToScreenPosition:animated:](self, "keyboardMovedToScreenPosition:animated:", v29 > 0.0, v7, v9, v11, v13);
      goto LABEL_13;
    }
    uint64_t v18 = [(UIInputWindowController *)self currentTransition];
    if (!v18) {
      goto LABEL_5;
    }
    CGFloat v19 = (void *)v18;
    double v20 = [(UIInputWindowController *)self currentTransition];
    CGFloat v21 = [v20 toPlacement];
    char v22 = [v21 showsInputOrAssistantViews];

    double v5 = v30;
    if ((v22 & 1) == 0)
    {
LABEL_5:
      [(UIInputWindowController *)self keyboardDismissWithInfo:v30];
LABEL_13:
      double v5 = v30;
    }
  }
LABEL_14:
}

- (void)keyboardMovedToScreenPosition:(CGRect)a3 animated:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  if ([(UIInputWindowController *)self currentControllerShouldUpdateKeyboardLayoutGuide])
  {
    double v10 = [(UIViewController *)self _window];
    int v11 = [v10 _isHostedInAnotherProcess];

    double v12 = [(UIViewController *)self _window];
    double v13 = [v12 screen];
    double v14 = [v13 coordinateSpace];

    int v15 = [(UIViewController *)self _window];
    [v15 hostedViewOrigin];

    double v16 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    int v17 = [v16 hasActiveKeyboardResponder];

    uint64_t v18 = [(UIInputWindowController *)self placement];
    if ([v18 isUndocked])
    {
      char v19 = 1;
    }
    else
    {
      double v20 = [(UIInputWindowController *)self placement];
      if ([v20 isFloating])
      {
        char v19 = 1;
      }
      else
      {
        CGFloat v21 = [(UIInputWindowController *)self placement];
        if ([v21 isFloatingAssistantView])
        {
          char v19 = 1;
        }
        else
        {
          char v22 = [(UIInputWindowController *)self placement];
          char v19 = [v22 isHiddenForFloatingTransition];
        }
      }
    }
    BOOL v23 = [(UIInputWindowController *)self placement];
    if ([v23 isFloatingAssistantView])
    {
      char v24 = 1;
    }
    else
    {
      int v25 = [(UIInputWindowController *)self placement];
      char v24 = [v25 isCompactAssistantView];
    }
    v54.origin.CGFloat x = x;
    v54.origin.CGFloat y = y;
    v54.size.CGFloat width = width;
    v54.size.CGFloat height = height;
    if (!CGRectIsEmpty(v54))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke;
      aBlock[3] = &unk_1E52FBED8;
      CGFloat v44 = x;
      CGFloat v45 = y;
      CGFloat v46 = width;
      CGFloat v47 = height;
      char v48 = v24;
      id v42 = v14;
      double v43 = self;
      char v49 = v19;
      char v50 = v11;
      BOOL v51 = a4;
      long long v26 = _Block_copy(aBlock);
      int v27 = (void (**)(void, void))v26;
      if ((v17 | v11) == 1)
      {
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke_2;
        v39[3] = &unk_1E52FBEB0;
        id v40 = v26;
        +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v39];
        char v28 = v40;
      }
      else
      {
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        double v29 = [(UIViewController *)self _window];
        id v30 = [v29 windowScene];
        char v28 = [v30 windows];

        uint64_t v31 = [v28 countByEnumeratingWithState:&v35 objects:v52 count:16];
        if (v31)
        {
          uint64_t v32 = v31;
          uint64_t v33 = *(void *)v36;
          do
          {
            uint64_t v34 = 0;
            do
            {
              if (*(void *)v36 != v33) {
                objc_enumerationMutation(v28);
              }
              v27[2](v27, *(void *)(*((void *)&v35 + 1) + 8 * v34++));
            }
            while (v32 != v34);
            uint64_t v32 = [v28 countByEnumeratingWithState:&v35 objects:v52 count:16];
          }
          while (v32);
        }
      }
    }
  }
}

void __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke(uint64_t a1, void *a2)
{
  id v89 = a2;
  if (([v89 _isTextEffectsWindow] & 1) == 0)
  {
    double v3 = *(void **)(a1 + 32);
    uint64_t v4 = [v89 windowScene];
    double v5 = [(id)v4 coordinateSpace];
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v5, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
    CGFloat x = v6;
    CGFloat y = v8;
    double width = v10;
    double height = v12;

    [v89 bounds];
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    char v22 = [v89 screen];
    [v22 bounds];
    v108.origin.CGFloat x = v23;
    v108.origin.CGFloat y = v24;
    v108.size.double width = v25;
    v108.size.double height = v26;
    v91.origin.CGFloat x = v15;
    v91.origin.CGFloat y = v17;
    v91.size.double width = v19;
    v91.size.double height = v21;
    LOBYTE(v4) = CGRectEqualToRect(v91, v108);

    if ((v4 & 1) == 0)
    {
      [v89 bounds];
      v109.origin.CGFloat x = x;
      v109.origin.CGFloat y = y;
      v109.size.double width = width;
      v109.size.double height = height;
      CGRect v93 = CGRectIntersection(v92, v109);
      CGFloat x = v93.origin.x;
      CGFloat y = v93.origin.y;
      double width = v93.size.width;
      double height = v93.size.height;
    }
    if (*(unsigned char *)(a1 + 80))
    {
      [v89 safeAreaInsets];
      double height = height + v27;
    }
    objc_msgSend(*(id *)(a1 + 40), "updateTrackingElementsWithSize:", width, height);
    v94.origin.CGFloat x = x;
    v94.origin.CGFloat y = y;
    v94.size.double width = width;
    v94.size.double height = height;
    double MaxY = CGRectGetMaxY(v94);
    [v89 frame];
    if (MaxY < CGRectGetMaxY(v95))
    {
      double v29 = *(void **)(a1 + 40);
      v96.origin.CGFloat x = x;
      v96.origin.CGFloat y = y;
      v96.size.double width = width;
      v96.size.double height = height;
      double MinX = CGRectGetMinX(v96);
      [v89 frame];
      double v31 = CGRectGetMaxY(v97);
      v98.origin.CGFloat x = x;
      v98.origin.CGFloat y = y;
      v98.size.double width = width;
      v98.size.double height = height;
      objc_msgSend(v29, "updateTrackingElementsWithOffset:", MinX, v31 - CGRectGetMaxY(v98));
    }
  }
  if ([v89 isTrackingKeyboard])
  {
    uint64_t v32 = [v89 _primaryKeyboardTrackingGuide];
    [v32 setDocked:*(unsigned char *)(a1 + 81) == 0];

    if (*(unsigned char *)(a1 + 80))
    {
      uint64_t v33 = [v89 _primaryKeyboardTrackingGuide];
      [v33 setAddsHeightWhenUndocked:1];
    }
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || *(unsigned char *)(a1 + 82))
    {
      uint64_t v34 = *(void **)(a1 + 32);
      long long v35 = [v89 windowScene];
      long long v36 = [v35 coordinateSpace];
      objc_msgSend(v34, "convertRect:toCoordinateSpace:", v36, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
      CGFloat v38 = v37;
      CGFloat v40 = v39;
      double v42 = v41;
      double v44 = v43;

      if (!*(unsigned char *)(a1 + 82) || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        [v89 frame];
        v110.origin.CGFloat x = v45;
        v110.origin.CGFloat y = v46;
        v110.size.double width = v47;
        v110.size.double height = v48;
        v99.origin.CGFloat x = v38;
        v99.origin.CGFloat y = v40;
        v99.size.double width = v42;
        v99.size.double height = v44;
        CGRect v100 = CGRectIntersection(v99, v110);
        CGFloat v38 = v100.origin.x;
        CGFloat v40 = v100.origin.y;
        double v42 = v100.size.width;
        double v44 = v100.size.height;
      }
      v101.origin.CGFloat x = v38;
      v101.origin.CGFloat y = v40;
      v101.size.double width = v42;
      v101.size.double height = v44;
      if (!CGRectIsEmpty(v101)) {
        goto LABEL_20;
      }
    }
    else
    {
      [v89 frame];
      double v50 = v49;
      double v52 = v51;
      double v54 = v53;
      double v56 = v55;
      CGRect v57 = [*(id *)(a1 + 40) _window];
      objc_msgSend(v57, "convertRect:fromWindow:", v89, v50, v52, v54, v56);
      CGFloat v59 = v58;
      CGFloat v61 = v60;
      CGFloat v63 = v62;
      CGFloat v65 = v64;

      v102.origin.CGFloat x = v59;
      v102.origin.CGFloat y = v61;
      v102.size.double width = v63;
      v102.size.double height = v65;
      CGRect v103 = CGRectIntersection(v102, *(CGRect *)(a1 + 48));
      double v66 = v103.origin.x;
      double v67 = v103.origin.y;
      double v68 = v103.size.width;
      double v69 = v103.size.height;
      if (!CGRectIsNull(v103))
      {
        v84 = [*(id *)(a1 + 40) _window];
        objc_msgSend(v84, "convertRect:toWindow:", v89, v66, v67, v68, v69);
        CGFloat v38 = v85;
        CGFloat v40 = v86;
        double v42 = v87;
        double v44 = v88;

        goto LABEL_20;
      }
    }
    [v89 frame];
    CGFloat v40 = CGRectGetMaxY(v104);
    [v89 frame];
    double v42 = v70;
    [v89 insetForDismissedKeyboardGuide];
    double v44 = v71;
    CGFloat v38 = 0.0;
LABEL_20:
    [v89 insetForDismissedKeyboardGuide];
    if (v44 < v72)
    {
      [v89 insetForDismissedKeyboardGuide];
      double v44 = v73;
    }
    [v89 frame];
    double v74 = CGRectGetMaxY(v105);
    v106.origin.CGFloat x = v38;
    v106.origin.CGFloat y = v40;
    v106.size.double width = v42;
    v106.size.double height = v44;
    double v75 = v74 - CGRectGetMaxY(v106);
    if (v75 > 0.0 && !*(unsigned char *)(a1 + 81)) {
      double v75 = 0.0;
    }
    v76 = v89;
    if (!*(unsigned char *)(a1 + 83))
    {
      v77 = [v89 _primaryKeyboardTrackingGuide];
      [v77 enableAnimations:0];

      v76 = v89;
    }
    v78 = [v76 _primaryKeyboardTrackingGuide];
    v107.origin.CGFloat x = v38;
    v107.origin.CGFloat y = v40;
    v107.size.double width = v42;
    v107.size.double height = v44;
    char v79 = objc_msgSend(v78, "changeOffsetConstants:", CGRectGetMinX(v107), v75);

    v80 = [v89 _primaryKeyboardTrackingGuide];
    int v81 = objc_msgSend(v80, "changeSizingConstants:", v42, v44);

    if (((v79 & 1) != 0 || v81) && *(unsigned char *)(a1 + 83)) {
      [v89 layoutViewsForTrackedGuides];
    }
    v82 = [v89 _primaryKeyboardTrackingGuide];
    [v82 setAddsHeightWhenUndocked:0];

    v83 = [v89 _primaryKeyboardTrackingGuide];
    [v83 enableAnimations:1];
  }
}

uint64_t __66__UIInputWindowController_keyboardMovedToScreenPosition_animated___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)updateKeyboardLayoutGuideForRefreshedPlaceholder
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v53 = [(UIInputWindowController *)self inputViewSet];
    if ([v53 isInputViewPlaceholder])
    {
      BOOL externalTrackingUpdateInProgress = self->_externalTrackingUpdateInProgress;

      if (!externalTrackingUpdateInProgress)
      {
        uint64_t v4 = [(UIInputWindowController *)self inputViewSet];
        double v5 = [v4 inputView];
        [v5 fixedSize];
        double v7 = v6;
        double v9 = v8;

        if (v9 > 0.0)
        {
          double v10 = [(UIInputWindowController *)self hosting];
          [v10 _inputViewPadding];
          double v9 = v9 + fabs(v11);
        }
        double v12 = [(UIViewController *)self _window];
        [v12 bounds];
        double v14 = v13;

        CGFloat v15 = [(UIViewController *)self _window];
        double v16 = [v15 screen];
        CGFloat v17 = [v16 coordinateSpace];

        double v18 = [(UIViewController *)self _window];
        char v19 = [v18 _isHostedInAnotherProcess];
        double v20 = [(UIViewController *)self _window];
        CGFloat v21 = [v20 windowScene];
        char v22 = v21;
        if (v19) {
          [v21 _allWindows];
        }
        else {
        CGFloat v23 = [v21 windows];
        }

        long long v56 = 0u;
        long long v57 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        id v24 = v23;
        uint64_t v25 = [v24 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v25)
        {
          uint64_t v26 = v25;
          double v27 = v14 - v9;
          uint64_t v28 = *(void *)v55;
          do
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v55 != v28) {
                objc_enumerationMutation(v24);
              }
              id v30 = *(void **)(*((void *)&v54 + 1) + 8 * i);
              double width = v7;
              double height = v9;
              if (([v30 _isTextEffectsWindow] & 1) == 0)
              {
                [v30 bounds];
                double v34 = v33;
                long long v35 = [(UIViewController *)self _window];
                [v35 bounds];
                double v37 = v36;

                BOOL v38 = v34 == v37;
                double width = v7;
                double height = v9;
                if (!v38)
                {
                  double v39 = [v30 windowScene];
                  CGFloat v40 = [v39 coordinateSpace];
                  objc_msgSend(v17, "convertRect:toCoordinateSpace:", v40, 0.0, v27, v7, v9);
                  CGFloat v42 = v41;
                  CGFloat v44 = v43;
                  CGFloat v46 = v45;
                  CGFloat v48 = v47;

                  [v30 frame];
                  v63.origin.CGFloat x = v42;
                  v63.origin.CGFloat y = v44;
                  v63.size.double width = v46;
                  v63.size.double height = v48;
                  CGRect v62 = CGRectIntersection(v61, v63);
                  double width = v62.size.width;
                  double height = v62.size.height;
                }
                -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", width, height);
              }
              if ([v30 isTrackingKeyboard])
              {
                [v30 insetForDismissedKeyboardGuide];
                if (height < v49)
                {
                  [v30 insetForDismissedKeyboardGuide];
                  double height = v50;
                }
                double v51 = [v30 _primaryKeyboardTrackingGuide];
                int v52 = objc_msgSend(v51, "changeSizingConstants:", width, height);

                if (v52) {
                  [v30 layoutViewsForTrackedGuides];
                }
              }
            }
            uint64_t v26 = [v24 countByEnumeratingWithState:&v54 objects:v58 count:16];
          }
          while (v26);
        }
      }
    }
    else
    {
    }
  }
}

- (id)_infoForBackdropMatchMoveForLayer:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionary];
  if (v3)
  {
    double v5 = [v3 context];
    uint64_t v6 = [v5 contextId];

    uint64_t RenderId = CALayerGetRenderId();
    v12[0] = 0x1ED149E80;
    double v8 = [NSNumber numberWithUnsignedInteger:v6];
    v12[1] = 0x1ED149EA0;
    v13[0] = v8;
    double v9 = [NSNumber numberWithUnsignedInteger:RenderId];
    v13[1] = v9;
    uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:2];

    uint64_t v4 = (void *)v10;
  }

  return v4;
}

- (id)initialNotificationInfo
{
  id v2 = [(UIInputWindowController *)self templateNotificationInfo];
  id v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = +[UIInputViewSetNotificationInfo info];
  }
  double v5 = v4;

  return v5;
}

- (BOOL)keyboardControlsNotifications
{
  if (TIGetNotificationsFromKeyboardValue_onceToken != -1) {
    dispatch_once(&TIGetNotificationsFromKeyboardValue_onceToken, &__block_literal_global_1095);
  }
  id v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v3 = [v2 valueForPreferenceKey:@"NotificationsFromKeyboard"];

  if (v3)
  {
    [v3 integerValue];
    char v4 = [v3 BOOLValue];
  }
  else
  {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)needsConvertToSceneCoordinates
{
  if (qword_1EB25C3C8 != -1) {
    dispatch_once(&qword_1EB25C3C8, &__block_literal_global_440);
  }
  if (!_MergedGlobals_29_2) {
    return 0;
  }
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v3 = [v2 visualModeManager];
  char v4 = [v3 windowingModeEnabled];

  return v4;
}

void __57__UIInputWindowController_needsConvertToSceneCoordinates__block_invoke()
{
  if (qword_1EB25C3F0 != -1) {
    dispatch_once(&qword_1EB25C3F0, &__block_literal_global_1106);
  }
  v0 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  uint64_t v1 = [v0 valueForPreferenceKey:@"AlwaysConvertToSceneCoordinates"];

  _MergedGlobals_29_2 = [v1 BOOLValue];
  if (!_MergedGlobals_29_2)
  {
    _UIMainBundleIdentifier();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_29_2 = objc_msgSend(&unk_1ED3F07D8, "containsObject:");
    if (_MergedGlobals_29_2) {
      goto LABEL_9;
    }
    int v2 = dyld_program_sdk_at_least();
    int v3 = [&unk_1ED3F07F0 containsObject:v6];
    _MergedGlobals_29_2 = v3;
    if (v3 && v2)
    {
      _MergedGlobals_29_2 = 0;
      NSLog(&cfstr_WarningKeyboar.isa);
      int v3 = _MergedGlobals_29_2;
    }
    if (v3)
    {
LABEL_9:
      if (qword_1EB25C3F8 != -1) {
        dispatch_once(&qword_1EB25C3F8, &__block_literal_global_1111);
      }
      char v4 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
      double v5 = [v4 valueForPreferenceKey:@"AlwaysNotConvertToSceneCoordinates"];

      LODWORD(v4) = [v5 BOOLValue];
      if (v4) {
        _MergedGlobals_29_2 = 0;
      }
    }
  }
}

- (id)convertUserInfo:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = (void *)[v3 mutableCopy];
  double v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v6 = [v5 keyboardWindow];

  long long v57 = (void *)v6;
  if (v6)
  {
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    v62[0] = @"UIKeyboardFrameBeginUserInfoKey";
    v62[1] = @"UIKeyboardFrameEndUserInfoKey";
    id v62[2] = @"UIKeyboardCenterBeginUserInfoKey";
    v62[3] = @"UIKeyboardCenterEndUserInfoKey";
    id obj = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:4];
    uint64_t v7 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
    if (!v7) {
      goto LABEL_14;
    }
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v59;
    long long v54 = v4;
    id v55 = v3;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v59 != v9) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v58 + 1) + 8 * i);
        id v12 = [v3 objectForKeyedSubscript:v11];
        double v13 = (const char *)[v12 objCType];
        if (!strcmp("{CGRect={CGPoint=dd}{CGSize=dd}}", v13))
        {
          [v12 CGRectValue];
          double v29 = v28;
          double v31 = v30;
          double v33 = v32;
          double v35 = v34;
          double v36 = [v57 windowScene];
          double v37 = [v36 coordinateSpace];
          BOOL v38 = [(UIViewController *)self _window];
          double v39 = [v38 windowScene];
          CGFloat v40 = [v39 coordinateSpace];
          objc_msgSend(v37, "convertRect:toCoordinateSpace:", v40, v29, v31, v33, v35);
          double v42 = v41;
          double v44 = v43;
          double v46 = v45;
          double v48 = v47;

          uint64_t v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v42, v44, v46, v48);
        }
        else
        {
          if (strcmp("{CGPoint=dd}", v13)) {
            goto LABEL_12;
          }
          [v12 CGPointValue];
          double v15 = v14;
          double v17 = v16;
          double v18 = [v57 windowScene];
          char v19 = [v18 coordinateSpace];
          double v20 = [(UIViewController *)self _window];
          CGFloat v21 = [v20 windowScene];
          char v22 = [v21 coordinateSpace];
          objc_msgSend(v19, "convertPoint:toCoordinateSpace:", v22, v15, v17);
          double v24 = v23;
          double v26 = v25;

          uint64_t v27 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v24, v26);
        }
        double v49 = (void *)v27;
        char v4 = v54;
        [v54 setObject:v27 forKeyedSubscript:v11];

        id v3 = v55;
LABEL_12:
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v58 objects:v63 count:16];
      if (!v8)
      {
LABEL_14:

        id v50 = (id)[v4 copy];
        goto LABEL_16;
      }
    }
  }
  id v50 = v3;
LABEL_16:
  double v51 = v50;

  return v51;
}

- (void)postNotificationName:(id)a3 userInfo:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
  uint64_t v9 = [(UIViewController *)self view];
  uint64_t v10 = [v9 window];
  uint64_t v11 = [v10 windowScene];
  id v12 = [v11 screen];
  double v13 = v12;
  if (v12)
  {
    id v14 = v12;
  }
  else
  {
    [(UIViewController *)self view];
    double v23 = v8;
    id v15 = v6;
    v17 = id v16 = v7;
    double v18 = [v17 window];
    id v14 = [v18 screen];

    id v7 = v16;
    id v6 = v15;
    uint64_t v8 = v23;
  }

  if ([(UIInputWindowController *)self needsConvertToSceneCoordinates])
  {
    char v19 = [(UIInputWindowController *)self convertUserInfo:v7];
    [v8 postNotificationName:v6 object:v14 userInfo:v19];
    double v20 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      CGFloat v21 = [(UIViewController *)self _window];
      char v22 = [v21 windowScene];
      *(_DWORD *)buf = 138412802;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v19;
      __int16 v28 = 2112;
      double v29 = v22;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "Posting converted notifications: %@ %@ for scene %@", buf, 0x20u);
    }
  }
  else
  {
    [v8 postNotificationName:v6 object:v14 userInfo:v7];
  }
}

- (BOOL)shouldPostNotification:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  if (![(UIInputWindowController *)self shouldNotifyRemoteKeyboards]) {
    goto LABEL_14;
  }
  int v7 = 1;
  if (!a3 || self->_suppressedNotifications || ![v6 containsChange]) {
    goto LABEL_15;
  }
  uint64_t v8 = [(UIViewController *)self _window];
  if (![v8 _isTextEffectsWindowNotificationOwner]
    || [(id)UIApp isSuspended] && self->_isSnapshotting
    || [(UIInputWindowController *)self isTransitioningBetweenFloatingStates])
  {
    goto LABEL_13;
  }
  uint64_t v9 = [(UIInputWindowController *)self inputViewSet];
  char v10 = [v9 isCustomInputView];
  if (a3 == 2 && (v10 & 1) == 0)
  {
    [v6 endFrame];
    if (v11 == 0.0)
    {

LABEL_13:
LABEL_14:
      int v7 = 1;
LABEL_15:
      int v12 = v7 & ([v6 nonKeyboardOverride] ^ 1);
      goto LABEL_16;
    }
  }
  BOOL v14 = +[UIKeyboard usesLocalKeyboard];

  if (v14) {
    goto LABEL_14;
  }
  if (!self->_externalTrackingUpdateInProgress)
  {
    int v7 = 0;
    goto LABEL_15;
  }
  int v12 = [v6 nonKeyboardOverride] ^ 1;
LABEL_16:
  if ([v6 waitingForInputUI])
  {
    [(UIInputWindowController *)self setNotificationInfoWaitingForInputUI:v6];
    LOBYTE(v12) = 1;
  }

  return v12 ^ 1;
}

- (void)postStartNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  if (-[UIInputWindowController shouldPostNotification:withInfo:](self, "shouldPostNotification:withInfo:", a3)) {
    [(UIInputWindowController *)self postValidatedStartNotifications:a3 withInfo:v6];
  }
}

- (void)postValidatedStartNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__UIInputWindowController_postValidatedStartNotifications_withInfo___block_invoke;
  aBlock[3] = &unk_1E52DA070;
  unint64_t v13 = a3;
  void aBlock[4] = self;
  id v7 = v6;
  id v12 = v7;
  uint64_t v8 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v9 = +[UIKeyboardImpl activeInstance];
  if ([v9 layoutIsResizing])
  {
  }
  else
  {
    BOOL v10 = [(UIInputWindowController *)self isTransitioningBetweenFloatingStates];

    if (!v10)
    {
      v8[2](v8);
      goto LABEL_6;
    }
  }
  +[UIView performWithoutAnimation:v8];
LABEL_6:
}

void __68__UIInputWindowController_postValidatedStartNotifications_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  switch(*(void *)(a1 + 48))
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v35 = 0;
          double v5 = "notificationWill.none";
          goto LABEL_20;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v7;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v35 = 0;
          double v5 = "notificationWill.frameChange";
          goto LABEL_20;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v8;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v35 = 0;
          double v5 = "notificationWill.show";
          goto LABEL_20;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v9;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v35 = 0;
          double v5 = "notificationWill.hide";
          goto LABEL_20;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v10;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v35 = 0;
          double v5 = "notificationWill.rotate";
          goto LABEL_20;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v6;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v35 = 0;
          double v5 = "notificationWill.unknown";
LABEL_20:
          _os_signpost_emit_with_name_impl(&dword_1853B0000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, v5, "", v35, 2u);
        }
      }
      break;
  }

  if (!+[UIKeyboard usesInputSystemUI])
  {
    double v11 = *(void **)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) inputViewSet];
    objc_msgSend(v11, "setWasCausedRemotely:", objc_msgSend(v12, "isRemoteKeyboard") | objc_msgSend(v11, "wasCausedRemotely"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "keyboardControlsNotifications", *(void *)v35))
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      if (([*(id *)(a1 + 40) shouldSendInClient] & 1) == 0
        && ([*(id *)(a1 + 32) isRotating] & 1) == 0)
      {
        unint64_t v13 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        [v13 keyboardSendNotification:*(void *)(a1 + 48) withInfo:*(void *)(a1 + 40) isStart:1];
LABEL_32:
      }
    }
    else if (+[UIKeyboard usesInputSystemUI] {
           && ([(id)UIApp _isSpringBoard] & 1) == 0)
    }
    {
      unint64_t v13 = [*(id *)(a1 + 32) placementIgnoringRotation];
      if (([v13 accessoryViewWillAppear] & 1) != 0
        || ([*(id *)(a1 + 40) shouldSendInClient] & 1) != 0)
      {
        goto LABEL_32;
      }
      char v34 = [*(id *)(a1 + 32) isRotating];

      if ((v34 & 1) == 0) {
        return;
      }
    }
  }
  BOOL v14 = [*(id *)(a1 + 40) userInfo];
  id v15 = [*(id *)(a1 + 32) placement];
  objc_opt_class();
  [*(id *)(a1 + 40) setAssistantOnScreenOnly:objc_opt_isKindOfClass() & 1];

  id v16 = [*(id *)(a1 + 40) privateUserInfo];
  double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [*(id *)(a1 + 32) postNotificationName:@"UIKeyboardWillChangeFrameNotification" userInfo:v14];
  [*(id *)(a1 + 32) postNotificationName:@"UIKeyboardPrivateWillChangeFrameNotification" userInfo:v16];
  uint64_t v18 = *(void *)(a1 + 48);
  if (v18 == 2)
  {
    char v19 = &UIKeyboardPrivateWillShowNotification;
    double v20 = (id *)&UIKeyboardWillShowNotification;
    goto LABEL_37;
  }
  if (v18 == 3)
  {
    char v19 = &UIKeyboardPrivateWillHideNotification;
    double v20 = (id *)&UIKeyboardWillHideNotification;
LABEL_37:
    id v21 = *v20;
    char v22 = *v19;
    if (v21) {
      [*(id *)(a1 + 32) postNotificationName:v21 userInfo:v14];
    }
    if (v22) {
      [*(id *)(a1 + 32) postNotificationName:v22 userInfo:v16];
    }
    uint64_t v18 = *(void *)(a1 + 48);
    goto LABEL_43;
  }
  id v21 = 0;
  char v22 = 0;
LABEL_43:
  switch(v18)
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      double v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v24 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v24;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)double v35 = 0;
          __int16 v26 = "notificationWill.none";
          goto LABEL_62;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      double v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v28 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v28 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v28;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)double v35 = 0;
          __int16 v26 = "notificationWill.frameChange";
          goto LABEL_62;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      double v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v29 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v29 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v29;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)double v35 = 0;
          __int16 v26 = "notificationWill.show";
          goto LABEL_62;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      double v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v30 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v30;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)double v35 = 0;
          __int16 v26 = "notificationWill.hide";
          goto LABEL_62;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      double v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v31 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v31 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v31;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)double v35 = 0;
          __int16 v26 = "notificationWill.rotate";
          goto LABEL_62;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      double v23 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v27 = os_signpost_id_make_with_pointer(v23, *(const void **)(a1 + 32));
      if (v27 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v25 = v27;
        if (os_signpost_enabled(v23))
        {
          *(_WORD *)double v35 = 0;
          __int16 v26 = "notificationWill.unknown";
LABEL_62:
          _os_signpost_emit_with_name_impl(&dword_1853B0000, v23, OS_SIGNPOST_INTERVAL_END, v25, v26, "", v35, 2u);
        }
      }
      break;
  }

  double v32 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = *(void *)(a1 + 40);
    *(_DWORD *)double v35 = 138412546;
    *(void *)&v35[4] = v21;
    __int16 v36 = 2112;
    uint64_t v37 = v33;
    _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEFAULT, "Posted notifications (start): %@ %@", v35, 0x16u);
  }
}

- (void)postEndNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  if (-[UIInputWindowController shouldPostNotification:withInfo:](self, "shouldPostNotification:withInfo:", a3)) {
    [(UIInputWindowController *)self postValidatedEndNotifications:a3 withInfo:v6];
  }
}

- (void)postValidatedEndNotifications:(unint64_t)a3 withInfo:(id)a4
{
  id v6 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__UIInputWindowController_postValidatedEndNotifications_withInfo___block_invoke;
  aBlock[3] = &unk_1E52DA070;
  unint64_t v13 = a3;
  void aBlock[4] = self;
  id v7 = v6;
  id v12 = v7;
  os_signpost_id_t v8 = (void (**)(void))_Block_copy(aBlock);
  os_signpost_id_t v9 = +[UIKeyboardImpl activeInstance];
  if ([v9 layoutIsResizing])
  {
  }
  else
  {
    BOOL v10 = [(UIInputWindowController *)self isTransitioningBetweenFloatingStates];

    if (!v10)
    {
      v8[2](v8);
      goto LABEL_6;
    }
  }
  +[UIView performWithoutAnimation:v8];
LABEL_6:
}

void __66__UIInputWindowController_postValidatedEndNotifications_withInfo___block_invoke(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  switch(*(void *)(a1 + 48))
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v3;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v44 = 0;
          double v5 = "notificationDid.none";
          goto LABEL_20;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v7 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v7;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v44 = 0;
          double v5 = "notificationDid.frameChange";
          goto LABEL_20;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v8;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v44 = 0;
          double v5 = "notificationDid.show";
          goto LABEL_20;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v9;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v44 = 0;
          double v5 = "notificationDid.hide";
          goto LABEL_20;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v10;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v44 = 0;
          double v5 = "notificationDid.rotate";
          goto LABEL_20;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      int v2 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v2, *(const void **)(a1 + 32));
      if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v4 = v6;
        if (os_signpost_enabled(v2))
        {
          *(_WORD *)double v44 = 0;
          double v5 = "notificationDid.unknown";
LABEL_20:
          _os_signpost_emit_with_name_impl(&dword_1853B0000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, v5, "", v44, 2u);
        }
      }
      break;
  }

  if (!+[UIKeyboard usesInputSystemUI])
  {
    double v11 = *(void **)(a1 + 40);
    id v12 = [*(id *)(a1 + 32) inputViewSet];
    objc_msgSend(v11, "setWasCausedRemotely:", objc_msgSend(v12, "isRemoteKeyboard") | objc_msgSend(v11, "wasCausedRemotely"));
  }
  if (objc_msgSend(*(id *)(a1 + 32), "keyboardControlsNotifications", *(void *)v44))
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      if (([*(id *)(a1 + 40) shouldSendInClient] & 1) == 0
        && ([*(id *)(a1 + 32) isRotating] & 1) == 0)
      {
        unint64_t v13 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        [v13 keyboardSendNotification:*(void *)(a1 + 48) withInfo:*(void *)(a1 + 40) isStart:0];
LABEL_32:
      }
    }
    else if (+[UIKeyboard usesInputSystemUI] {
           && ([(id)UIApp _isSpringBoard] & 1) == 0)
    }
    {
      unint64_t v13 = [*(id *)(a1 + 32) placementIgnoringRotation];
      if (([v13 accessoryViewWillAppear] & 1) != 0
        || ([*(id *)(a1 + 40) shouldSendInClient] & 1) != 0)
      {
        goto LABEL_32;
      }
      char v43 = [*(id *)(a1 + 32) isRotating];

      if ((v43 & 1) == 0) {
        return;
      }
    }
  }
  BOOL v14 = [*(id *)(a1 + 40) userInfo];
  id v15 = [*(id *)(a1 + 32) placement];
  objc_opt_class();
  [*(id *)(a1 + 40) setAssistantOnScreenOnly:objc_opt_isKindOfClass() & 1];

  id v16 = [*(id *)(a1 + 40) privateUserInfo];
  double v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [*(id *)(a1 + 32) postNotificationName:@"UIKeyboardDidChangeFrameNotification" userInfo:v14];
  [*(id *)(a1 + 32) postNotificationName:@"UIKeyboardPrivateDidChangeFrameNotification" userInfo:v16];
  [*(id *)(a1 + 32) updateAmbiguousControlCenterActivationMargin:*(void *)(a1 + 48) withInfo:*(void *)(a1 + 40)];
  if (![(id)UIApp isSuspended]
    || ([*(id *)(a1 + 32) _window],
        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
        int v19 = [v18 _isHostedInAnotherProcess],
        v18,
        v19))
  {
    double v20 = [*(id *)(a1 + 32) inputViewSet];
    id v21 = [v20 keyboard];
    if (v21)
    {
      int v22 = [*(id *)(a1 + 32) isOnScreen];
      double v23 = *(void **)(a1 + 32);
      if (v22)
      {
        os_signpost_id_t v24 = [v23 placement];
        if ([v24 showsKeyboard]) {
          uint64_t v25 = 1;
        }
        else {
          uint64_t v25 = [*(id *)(a1 + 32) isUndocked];
        }
      }
      else
      {
        uint64_t v25 = [v23 isUndocked];
      }
    }
    else
    {
      uint64_t v25 = 0;
    }

    __int16 v26 = +[UIPeripheralHost sharedInstance];
    [v26 setKeyboardOnScreenNotifyKey:v25];
  }
  uint64_t v27 = *(void *)(a1 + 48);
  if (v27 == 2)
  {
    os_signpost_id_t v28 = UIKeyboardPrivateDidShowNotification;
    os_signpost_id_t v29 = (id *)&UIKeyboardDidShowNotification;
    goto LABEL_48;
  }
  if (v27 == 3)
  {
    os_signpost_id_t v28 = UIKeyboardPrivateDidHideNotification;
    os_signpost_id_t v29 = (id *)&UIKeyboardDidHideNotification;
LABEL_48:
    id v30 = *v29;
    os_signpost_id_t v31 = *v28;
    if (v30) {
      [*(id *)(a1 + 32) postNotificationName:v30 userInfo:v14];
    }
    if (v31) {
      [*(id *)(a1 + 32) postNotificationName:v31 userInfo:v16];
    }
    uint64_t v27 = *(void *)(a1 + 48);
    goto LABEL_54;
  }
  id v30 = 0;
  os_signpost_id_t v31 = 0;
LABEL_54:
  switch(v27)
  {
    case 0:
      kdebug_trace();
      kac_get_log();
      double v32 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v33 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v33 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v33;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)double v44 = 0;
          double v35 = "notificationDid.none";
          goto LABEL_73;
        }
      }
      break;
    case 1:
      kdebug_trace();
      kac_get_log();
      double v32 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v37 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v37;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)double v44 = 0;
          double v35 = "notificationDid.frameChange";
          goto LABEL_73;
        }
      }
      break;
    case 2:
      kdebug_trace();
      kac_get_log();
      double v32 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v38 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v38 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v38;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)double v44 = 0;
          double v35 = "notificationDid.show";
          goto LABEL_73;
        }
      }
      break;
    case 3:
      kdebug_trace();
      kac_get_log();
      double v32 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v39 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v39 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v39;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)double v44 = 0;
          double v35 = "notificationDid.hide";
          goto LABEL_73;
        }
      }
      break;
    case 4:
      kdebug_trace();
      kac_get_log();
      double v32 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v40 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v40 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v40;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)double v44 = 0;
          double v35 = "notificationDid.rotate";
          goto LABEL_73;
        }
      }
      break;
    default:
      kdebug_trace();
      kac_get_log();
      double v32 = (id)objc_claimAutoreleasedReturnValue();
      os_signpost_id_t v36 = os_signpost_id_make_with_pointer(v32, *(const void **)(a1 + 32));
      if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
      {
        os_signpost_id_t v34 = v36;
        if (os_signpost_enabled(v32))
        {
          *(_WORD *)double v44 = 0;
          double v35 = "notificationDid.unknown";
LABEL_73:
          _os_signpost_emit_with_name_impl(&dword_1853B0000, v32, OS_SIGNPOST_INTERVAL_END, v34, v35, "", v44, 2u);
        }
      }
      break;
  }

  double v41 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v42 = *(void *)(a1 + 40);
    *(_DWORD *)double v44 = 138412546;
    *(void *)&v44[4] = v30;
    __int16 v45 = 2112;
    uint64_t v46 = v42;
    _os_log_impl(&dword_1853B0000, v41, OS_LOG_TYPE_DEFAULT, "Posted notifications (end): %@ %@", v44, 0x16u);
  }
}

- (int)appearStateForChild:(unint64_t)a3 placement:(id)a4 start:(BOOL)a5
{
  BOOL v5 = a5;
  if (a3 == 4) {
    int v6 = [a4 accessoryViewWillAppear];
  }
  else {
    int v6 = [a4 inputViewWillAppear];
  }
  if (v5) {
    int v7 = 1;
  }
  else {
    int v7 = 2;
  }
  if (v5) {
    int v8 = 3;
  }
  else {
    int v8 = 0;
  }
  if (v6) {
    return v7;
  }
  else {
    return v8;
  }
}

- (void)changeChild:(unint64_t)a3 toAppearState:(int)a4 animated:(BOOL)a5
{
  if (self->_suppressedCallbacks) {
    return;
  }
  BOOL v5 = a5;
  if (a3 == 2)
  {
    int v7 = [(UIInputWindowController *)self _inputAssistantViewController];
  }
  else
  {
    if (a3 == 4) {
      [(UIInputWindowController *)self _inputAccessoryViewController];
    }
    else {
    int v7 = [(UIInputWindowController *)self _inputViewController];
    }
  }
  id v10 = v7;
  int v8 = a4 | (16 * [v7 _appearState]);
  if (v8 > 31)
  {
    if (v8 > 47)
    {
      if (v8 != 48)
      {
        os_signpost_id_t v9 = v10;
        if (v8 != 49) {
          goto LABEL_29;
        }
        -[UIViewController __viewDidDisappear:]((uint64_t)v10, v5);
LABEL_24:
        objc_msgSend(v10, "__viewWillAppear:", v5);
        goto LABEL_28;
      }
    }
    else
    {
      if (v8 != 32)
      {
        os_signpost_id_t v9 = v10;
        if (v8 != 35) {
          goto LABEL_29;
        }
        goto LABEL_20;
      }
      -[UIViewController __viewWillDisappear:]((uint64_t)v10, v5);
    }
    -[UIViewController __viewDidDisappear:]((uint64_t)v10, v5);
    goto LABEL_28;
  }
  if (v8 <= 17)
  {
    if (v8 != 1)
    {
      os_signpost_id_t v9 = v10;
      if (v8 == 2)
      {
        objc_msgSend(v10, "__viewWillAppear:", v5);
LABEL_25:
        objc_msgSend(v10, "__viewDidAppear:", v5);
        goto LABEL_28;
      }
      goto LABEL_29;
    }
    goto LABEL_24;
  }
  if (v8 == 18) {
    goto LABEL_25;
  }
  os_signpost_id_t v9 = v10;
  if (v8 == 19)
  {
    objc_msgSend(v10, "__viewDidAppear:", v5);
LABEL_20:
    -[UIViewController __viewWillDisappear:]((uint64_t)v10, v5);
LABEL_28:
    os_signpost_id_t v9 = v10;
  }
LABEL_29:
}

- (void)updateAppearStatesForPlacement:(id)a3 start:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  for (uint64_t i = 0; i != 3; ++i)
    [(UIInputWindowController *)self changeChild:(1 << i) toAppearState:[(UIInputWindowController *)self appearStateForChild:(1 << i) placement:a3 start:v6] animated:v5];
}

- (void)_forcePreLayoutHostViewFrame
{
  p_preLayoutHostViewFrame = &self->_preLayoutHostViewFrame;
  os_signpost_id_t v4 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
  [v4 notificationsFrame];
  p_preLayoutHostViewFrame->origin.CGFloat x = v5;
  p_preLayoutHostViewFrame->origin.CGFloat y = v6;
  p_preLayoutHostViewFrame->size.double width = v7;
  p_preLayoutHostViewFrame->size.double height = v8;

  self->_didOverridePreLayoutHostViewFrame = 1;
}

- (void)setHostingNeedsLayout
{
}

- (void)transferActiveNotificationInfoToInfo:(id)a3
{
  id v7 = a3;
  os_signpost_id_t v4 = [(UIInputWindowController *)self templateNotificationInfo];
  CGFloat v5 = [NSString stringWithFormat:@"transferActiveNotificationInfoToInfo:"];
  [v7 addKeyboardNotificationDebuggingInfo:v5];

  if (!v4)
  {
    if (![(UIInputWindowController *)self isRotating]) {
      goto LABEL_7;
    }
    CGFloat v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    objc_msgSend(v7, "setWasCausedRemotely:", objc_msgSend(v6, "keyboardActive") ^ 1);

    [v7 setDueToRotation:1];
    goto LABEL_6;
  }
  objc_msgSend(v7, "setWasCausedRemotely:", objc_msgSend(v4, "wasCausedRemotely"));
  objc_msgSend(v7, "setDueToRotation:", objc_msgSend(v4, "dueToRotation"));
  objc_msgSend(v7, "setWaitingForInputUI:", objc_msgSend(v4, "waitingForInputUI"));
  if ([v7 dueToRotation]) {
LABEL_6:
  }
    [v7 setShouldSendInClient:1];
LABEL_7:
}

- (id)_screenCoordinateSpace
{
  int v2 = [(UIViewController *)self _window];
  os_signpost_id_t v3 = [v2 screen];
  os_signpost_id_t v4 = [v3 coordinateSpace];

  return v4;
}

void __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", *(double *)(*(void *)(a1 + 32) + 1256), *(double *)(*(void *)(a1 + 32) + 1264), *(double *)(*(void *)(a1 + 32) + 1272), *(double *)(*(void *)(a1 + 32) + 1280));
  double v63 = v2;
  double v64 = v3;
  double v65 = v4;
  double v66 = v5;
  BOOL v6 = 1;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v7 notificationsFrame];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v9, v11, v13, v15);
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  os_signpost_id_t v24 = [*(id *)(a1 + 32) view];
  uint64_t v25 = [v24 window];
  __int16 v26 = [v25 screen];
  [v26 scale];
  double v28 = v27;

  os_signpost_id_t v29 = *(double **)(a1 + 32);
  if (v29[159] == v21) {
    BOOL v6 = round(v28 * v29[160]) != round(v23 * v28);
  }
  id v30 = [v29 inputViewSet];
  [v30 inputAccessoryViewBounds];
  CGFloat v32 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  CGFloat v38 = v37;

  v67.origin.CGFloat x = v32;
  v67.origin.CGFloat y = v34;
  v67.size.double width = v36;
  v67.size.double height = v38;
  BOOL v39 = CGRectEqualToRect(v67, *(CGRect *)(*(void *)(a1 + 32) + 1288));
  BOOL v40 = +[UIKeyboard usesInputSystemUI];
  if (v40 && v39)
  {
    v68.origin.CGFloat x = v32;
    v68.origin.CGFloat y = v34;
    v68.size.double width = v36;
    v68.size.double height = v38;
    BOOL v40 = !CGRectIsEmpty(v68);
  }
  if (*(unsigned char *)(a1 + 40) && !*(unsigned char *)(a1 + 41))
  {
    if (v6)
    {
      int v52 = *(unsigned char **)(a1 + 32);
      if (v52[1000])
      {
        id v53 = [v52 currentTransition];
        char v43 = [v53 notificationInfo];

        [v43 addKeyboardNotificationDebuggingInfo:@"viewDidLayoutSubviews hasTransition, hostViewDidChangeSize, _isChangingPlacement"];
        if (v40) {
          [v43 setShouldSendInClient:1];
        }
        long long v54 = *(void **)(a1 + 32);
        id v55 = [v54 currentTransition];
        objc_msgSend(v54, "postEndNotifications:withInfo:", objc_msgSend(v55, "notifications"), v43);

        objc_msgSend(v43, "populateStartInfoWithFrame:", v63, v64, v65, v66);
        objc_msgSend(v43, "populateEndInfoWithFrame:", v17, v19, v21, v23);
        long long v56 = [*(id *)(a1 + 32) currentTransition];
        uint64_t v57 = [v56 notifications];

        if (v57) {
          [*(id *)(a1 + 32) keyboardMoveOfType:1 info:v43];
        }
        long long v58 = *(void **)(a1 + 32);
        id v50 = [v58 currentTransition];
        objc_msgSend(v58, "postStartNotifications:withInfo:", objc_msgSend(v50, "notifications"), v43);
        goto LABEL_38;
      }
    }
  }
  else
  {
    double v41 = *(void **)(*(void *)(a1 + 32) + 1328);
    if (v41)
    {
      [v41 addKeyboardNotificationDebuggingInfo:@"viewDidLayoutSubviews update _keyboardHeightChangeNotificationInfo"];
      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1328), "populateEndInfoWithFrame:", v17, v19, v21, v23);
      goto LABEL_39;
    }
    if (*(unsigned char *)(a1 + 41)) {
      int v42 = 1;
    }
    else {
      int v42 = v6;
    }
    if (v42 == 1)
    {
      char v43 = +[UIInputViewSetNotificationInfo info];
      [v43 setForceNotification:1];
      [*(id *)(a1 + 32) transferActiveNotificationInfoToInfo:v43];
      double v44 = +[UIInputViewAnimationStyle animationStyleImmediate];
      [v43 populateWithAnimationStyle:v44];

      objc_msgSend(v43, "populateStartInfoWithFrame:", v63, v64, v65, v66);
      objc_msgSend(v43, "populateEndInfoWithFrame:", v17, v19, v21, v23);
      if (*(unsigned char *)(a1 + 41)) {
        __int16 v45 = @" transitionRequiresImplicitNotifications";
      }
      else {
        __int16 v45 = &stru_1ED0E84C0;
      }
      uint64_t v46 = @" hostViewDidChangeSize";
      if (!v6) {
        uint64_t v46 = &stru_1ED0E84C0;
      }
      uint64_t v47 = [NSString stringWithFormat:@"viewDidLayoutSubviews%@%@", v45, v46];
      [v43 addKeyboardNotificationDebuggingInfo:v47];

      double v48 = *(unsigned char **)(a1 + 32);
      if (v6 && v48[1418])
      {
        [v48 keyboardMoveOfType:1 info:v43];
        *(unsigned char *)(*(void *)(a1 + 32) + 1418) = 0;
        double v48 = *(unsigned char **)(a1 + 32);
      }
      double v49 = [v48 _screen];
      id v50 = +[UIKeyboardMotionSupport supportForScreen:v49];

      double v51 = [*(id *)(a1 + 32) placement];
      if ([v51 isFloating])
      {
      }
      else
      {
        char v59 = [v50 handlingFlickGesture];

        if ((v59 & 1) == 0)
        {
          if (v40) {
            [v43 setShouldSendInClient:1];
          }
          if (!+[UIKeyboard usesInputSystemUI])
          {
            long long v60 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
            int v61 = [v60 isWaitingForInputUI];

            if (v61) {
              [v43 setWaitingForInputUI:1];
            }
          }
          [*(id *)(a1 + 32) postStartNotifications:2 withInfo:v43];
          [*(id *)(a1 + 32) postEndNotifications:2 withInfo:v43];
        }
      }
LABEL_38:
    }
  }
LABEL_39:
  CGRect v62 = (CGFloat *)(*(void *)(a1 + 32) + 1288);
  CGFloat *v62 = v32;
  v62[1] = v34;
  id v62[2] = v36;
  v62[3] = v38;
}

uint64_t __48__UIInputWindowController_viewDidLayoutSubviews__block_invoke_3(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v2 notificationsFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1248), "populateEndInfoWithFrame:");
  double v11 = *(void **)(*(void *)(a1 + 32) + 1248);
  return [v11 addKeyboardNotificationDebuggingInfo:@"viewDidLayoutSubviews _rotationInfo updated"];
}

- (void)checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:(BOOL)a3 layoutSubviews:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  double v7 = [(UIInputWindowController *)self inputViewSet];
  int v8 = [v7 isInputViewPlaceholder];

  if (v8)
  {
    BOOL externalTrackingUpdateInProgress = self->_externalTrackingUpdateInProgress;
    double v10 = [(UIInputWindowController *)self inputViewSet];
    double v11 = [v10 inputView];
    double v12 = v11;
    if (externalTrackingUpdateInProgress)
    {
      [v11 invalidateIntrinsicContentSize];
      uint64_t v13 = 1;
    }
    else
    {
      uint64_t v13 = [v11 refreshPlaceholder];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  double v14 = [(UIInputWindowController *)self inputViewSet];
  int v15 = [v14 isInputAssistantViewPlaceholder];

  if (v15)
  {
    double v16 = [(UIInputWindowController *)self inputViewSet];
    double v17 = [v16 inputAssistantView];
    uint64_t v13 = v13 | [v17 refreshPlaceholder];
  }
  double v18 = [(UIInputWindowController *)self inputViewSet];
  int v19 = [v18 isInputAccessoryViewPlaceholder];

  if (v19)
  {
    double v20 = [(UIInputWindowController *)self inputViewSet];
    double v21 = [v20 inputAccessoryView];
    uint64_t v13 = v13 | [v21 refreshPlaceholder];

    if ((v13 & 1) == 0) {
      return;
    }
  }
  else if (!v13)
  {
    return;
  }
  if (v5
    || v4
    || ([(UIInputWindowController *)self postRotationPlacement],
        (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    double v22 = [(UIInputWindowController *)self inputViewSet];
    if ([v22 isInputViewPlaceholder])
    {
      BOOL v23 = self->_externalTrackingUpdateInProgress;

      if (!v5 && !v4) {
      if (!v23)
      }
        [(UIInputWindowController *)self updateKeyboardLayoutGuideForRefreshedPlaceholder];
    }
    else
    {

      if (!v5 && !v4) {
    }
      }
  }
  if (v5) {
    [(UIInputWindowController *)self updateViewConstraints];
  }
  os_signpost_id_t v24 = [(UIViewController *)self view];
  id v25 = v24;
  if (v4) {
    [v24 layoutIfNeeded];
  }
  else {
    [v24 setNeedsLayout];
  }
}

- (void)setDisableUpdateMaskForSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
  double v6 = [v5 preferencesActions];
  char v7 = [v6 BOOLForPreferenceKey:@"ShowPasswordKeyboardInVideo"];

  if ((v7 & 1) == 0)
  {
    id v14 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:100];
    int v8 = [v14 hostView];
    double v9 = v8;
    if (v8)
    {
      passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
      if (v3)
      {
        if (!passcodeObscuringInteraction)
        {
          double v11 = objc_alloc_init(_UIKeyboardPasscodeObscuringInteraction);
          double v12 = self->_passcodeObscuringInteraction;
          self->_passcodeObscuringInteraction = v11;

          passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
        }
        [v9 addInteraction:passcodeObscuringInteraction];
      }
      else if (passcodeObscuringInteraction)
      {
        objc_msgSend(v8, "removeInteraction:");
        uint64_t v13 = self->_passcodeObscuringInteraction;
        self->_passcodeObscuringInteraction = 0;
      }
    }
  }
}

- (void)updateForKeyplaneChangeWithContext:(id)a3
{
  id v4 = a3;
  if (!self->_isChangingInputViews)
  {
    double v22 = v4;
    BOOL v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v6 = [v5 transientInputViews];
    char v7 = [v6 isEmpty];

    id v4 = v22;
    if ((v7 & 1) == 0)
    {
      if ([v22 updateAssistantView])
      {
        int v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v9 = [v8 hardwareKeyboardExclusivityIdentifier];

        if (v9)
        {
          double v10 = [v8 systemInputAssistantViewController];
          double v11 = [(UIInputWindowController *)self inputViewSet];
          int v12 = [v10 shouldBeShownForInputDelegate:0 inputViews:v11];

          uint64_t v13 = [(UIInputWindowController *)self placement];
          objc_opt_class();
          LODWORD(v11) = objc_opt_isKindOfClass() & 1;

          if (v12 != v11)
          {
            id v14 = [(UIInputWindowController *)self inputViewSet];
            uint64_t v15 = [(UIViewController *)self _window];
            double v16 = [(id)v15 windowScene];
            double v17 = +[UIPeripheralHost endPlacementForInputViewSet:v14 windowScene:v16];

            double v18 = [(UIInputWindowController *)self placement];
            LOBYTE(v15) = [v18 isEqual:v17];

            if ((v15 & 1) == 0) {
              [(UIInputWindowController *)self setPlacement:v17];
            }
          }
        }
        [(UIInputWindowControllerHosting *)self->_hosting clearInputViewEdgeConstraints];
        [(UIInputWindowController *)self updateKeyboardSizeClass];
        self->_layoutGuideNeedsUpdate = 1;
        if (([v22 selfSizingChanged] & 1) == 0 && objc_msgSend(v22, "sizeDidChange")) {
          self->_suppressUpdateViewConstraints = 1;
        }
        [(UIInputWindowController *)self updateInputAssistantViewForInputViewSet:0];
        self->_suppressUpdateViewConstraints = 0;
      }
      else if ([v22 sizeDidChange])
      {
        self->_layoutGuideNeedsUpdate = 1;
      }
      if ([v22 selfSizingChanged])
      {
        [(UIInputWindowController *)self updateViewSizingConstraints];
      }
      else
      {
        if (([v22 sizeDidChange] & 1) == 0)
        {
          int v19 = [v22 updateAssistantView];
          id v4 = v22;
          if (!v19) {
            goto LABEL_22;
          }
        }
        [(UIInputWindowController *)self resetBackdropHeight];
        [(UIInputWindowController *)self updateViewConstraints];
        int v20 = [v22 splitWidthsChanged];
        id v4 = v22;
        if (!v20) {
          goto LABEL_22;
        }
        double v21 = [(UIInputWindowController *)self inputViewSet];
        [v21 refreshPresentation];

        [(UIInputWindowControllerHosting *)self->_hosting _updateBackdropViews];
      }
      id v4 = v22;
    }
  }
LABEL_22:
}

- (void)_collectTransitionTimeStatistics:(unint64_t)a3 withStart:(id)a4
{
  id v6 = a4;
  if (v6
    && ![(UIInputWindowController *)self shouldNotifyRemoteKeyboards]
    && ([(id)UIApp launchedToTest] & 1) == 0)
  {
    char v7 = [MEMORY[0x1E4F1C9C8] date];
    [v7 timeIntervalSinceDate:v6];
    uint64_t v9 = v8;
    double v10 = +[UIKeyboard activeKeyboard];
    double v11 = [(UIViewController *)self view];
    if ([v10 isDescendantOfView:v11])
    {

      if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        kdebug_trace();
        int v12 = dispatch_get_global_queue(-2, 0);
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __70__UIInputWindowController__collectTransitionTimeStatistics_withStart___block_invoke;
        void v13[3] = &__block_descriptor_48_e5_v8__0l;
        v13[4] = a3;
        v13[5] = v9;
        dispatch_async(v12, v13);
      }
    }
    else
    {
    }
  }
}

void __70__UIInputWindowController__collectTransitionTimeStatistics_withStart___block_invoke(uint64_t a1)
{
  if (_UIIsPrivateMainBundle())
  {
    double v2 = +[UIApplication displayIdentifier];
  }
  else
  {
    double v2 = @"thirdpartyapp";
  }
  uint64_t v3 = *(void *)(a1 + 32);
  if (v3 == 3)
  {
    id v4 = (void *)MEMORY[0x1E4FAECF8];
  }
  else
  {
    if (v3 != 2) {
      goto LABEL_9;
    }
    id v4 = (void *)MEMORY[0x1E4FAED00];
  }
  char v7 = v2;
  BOOL v5 = [NSString stringWithFormat:@"%@.%@", *v4, v2];
  id v6 = TIStatisticGetKey();
  TIStatisticDistributionPushValue();

  double v2 = v7;
LABEL_9:
}

- (id)nextAnimationStyle
{
  if ([(NSMutableArray *)self->_animationStyleStack count]) {
    [(NSMutableArray *)self->_animationStyleStack lastObject];
  }
  else {
  uint64_t v3 = +[UIInputViewAnimationStyle animationStyleDefault];
  }
  return v3;
}

- (BOOL)mergeTransitionIfNecessaryWithTransition:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(UIInputWindowController *)self currentTransition];
  id v6 = v5;
  if (!v5 || ([v5 cancelled] & 1) != 0) {
    goto LABEL_15;
  }
  char v7 = [v6 toPlacement];
  uint64_t v8 = [v4 toPlacement];
  if (([v7 isEqual:v8] & 1) == 0)
  {

LABEL_7:
    uint64_t v13 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v29 = 138412546;
      id v30 = v6;
      __int16 v31 = 2112;
      id v32 = v4;
      _os_log_impl(&dword_1853B0000, v13, OS_LOG_TYPE_DEFAULT, "Merging transitions: %@ into %@", (uint8_t *)&v29, 0x16u);
    }

    [v6 setCancelled:1];
    id v14 = [v6 animationStyle];
    [v14 cancelInterruptibleAnimations];

    uint64_t v15 = [v6 notifications];
    double v16 = [v6 notificationInfo];
    [(UIInputWindowController *)self postEndNotifications:v15 withInfo:v16];

    double v17 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
    [v17 enumerateObjectsUsingBlock:&__block_literal_global_510];

    if ([v6 animationState] > 2) {
      goto LABEL_15;
    }
    [(UIInputWindowControllerHosting *)self->_hosting removeAllAnimations];
    double v18 = [v6 fromPlacement];
    [v4 setFromPlacement:v18];

    int v19 = [v4 fromPlacement];
    int v20 = [v19 showsInputViews];
    double v21 = [v4 toPlacement];
    if (v20 == [v21 showsInputViews])
    {
      double v22 = [v4 fromPlacement];
      int v23 = [v22 showsKeyboard];
      os_signpost_id_t v24 = [v4 toPlacement];
      if (v23 == [v24 showsKeyboard])
      {
        __int16 v26 = [v4 animationStyle];
        char v27 = [v26 dontMerge];

        if (v27) {
          goto LABEL_15;
        }
        double v28 = [v4 animationStyle];
        int v19 = (void *)[v28 copy];

        [v19 setAnimated:0];
        [v4 setAnimationStyle:v19];
LABEL_14:

LABEL_15:
        BOOL v12 = 0;
        goto LABEL_16;
      }
    }
    goto LABEL_14;
  }
  uint64_t v9 = [v6 animationStyle];
  double v10 = [v4 animationStyle];
  char v11 = [v9 isEqual:v10];

  if ((v11 & 1) == 0) {
    goto LABEL_7;
  }
  BOOL v12 = 1;
LABEL_16:

  return v12;
}

uint64_t __68__UIInputWindowController_mergeTransitionIfNecessaryWithTransition___block_invoke(uint64_t a1, void *a2)
{
  return [a2 clearInteractiveTransitionStateIfNecessary];
}

- (void)addPendingActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = _Block_copy(self->_pendingTransitionActivity);
  id v6 = v5;
  if (v5)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__UIInputWindowController_addPendingActivity___block_invoke;
    v11[3] = &unk_1E52DE9A0;
    id v12 = v5;
    id v13 = v4;
    char v7 = (void *)[v11 copy];
    pendingTransitionActivitCGFloat y = self->_pendingTransitionActivity;
    self->_pendingTransitionActivitCGFloat y = v7;

    id v9 = v12;
  }
  else
  {
    double v10 = (void *)[v4 copy];
    id v9 = self->_pendingTransitionActivity;
    self->_pendingTransitionActivitCGFloat y = v10;
  }
}

uint64_t __46__UIInputWindowController_addPendingActivity___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  double v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)flushPendingActivities
{
  id v4 = (void (**)(void))_Block_copy(self->_pendingTransitionActivity);
  if (v4)
  {
    pendingTransitionActivitCGFloat y = self->_pendingTransitionActivity;
    self->_pendingTransitionActivitCGFloat y = 0;

    v4[2]();
  }
}

- (void)animateKeyboardTrackingElementsWithNotificationInfo:(id)a3 notificationType:(unint64_t)a4 updateForStart:(BOOL)a5 updateForEnd:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = @"for start";
    if (v6) {
      id v12 = @"using keyboard animation";
    }
    if (!v7) {
      id v12 = @"for end";
    }
    *(_DWORD *)buf = 138412546;
    CGRect v62 = v12;
    __int16 v63 = 2112;
    id v64 = v10;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Updating keyboard tracking elements %@ with notificationInfo:\n%@", buf, 0x16u);
  }

  id v13 = [(UIViewController *)self _window];
  char v14 = [v13 _isRemoteKeyboardWindow];

  if ((v14 & 1) == 0)
  {
    uint64_t v15 = [(UIInputWindowController *)self currentTransition];
    [v15 setCancelled:1];

    double v16 = [(UIInputWindowController *)self currentTransition];
    double v17 = [v16 animationStyle];
    [v17 cancelInterruptibleAnimations];

    [(UIInputWindowController *)self setCurrentTransition:0];
    [(UIInputWindowControllerHosting *)self->_hosting removeAllAnimations];
  }
  self->_BOOL externalTrackingUpdateInProgress = 1;
  objc_msgSend(v10, "duration", 1419);
  if (v18 <= 0.0)
  {
    +[UIInputViewAnimationStyle animationStyleImmediate];
  }
  else
  {
    [v10 duration];
    +[UIInputViewAnimationStyle animationStyleAnimated:duration:](UIInputViewAnimationStyle, "animationStyleAnimated:duration:", 1);
  int v19 = };
  [v10 setNonKeyboardOverride:1];
  [v10 endFrame];
  uint64_t v21 = v20;
  uint64_t v23 = v22;
  uint64_t v25 = v24;
  uint64_t v27 = v26;
  double v28 = [(UIInputWindowController *)self inputViewSet];
  uint64_t v29 = [v28 inputAccessoryView];
  if (v29)
  {
    id v30 = (void *)v29;
    BOOL v31 = v6;
    id v32 = [(UIInputWindowController *)self inputViewSet];
    int v33 = [v32 isInputViewPlaceholder];

    if (v33)
    {
      CGFloat v34 = +[UIInputViewSetNotificationInfo info];
      externalTrackingInfo = self->_externalTrackingInfo;
      self->_externalTrackingInfo = v34;

      CGFloat v36 = self->_externalTrackingInfo;
      [v10 endFrame];
      -[UIInputViewSetNotificationInfo populateEndInfoWithFrame:](v36, "populateEndInfoWithFrame:");
      char v37 = 1;
    }
    else
    {
      char v37 = 0;
    }
    BOOL v6 = v31;
  }
  else
  {

    char v37 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke;
  aBlock[3] = &unk_1E52FBD40;
  void aBlock[4] = self;
  uint64_t v55 = v21;
  uint64_t v56 = v23;
  uint64_t v57 = v25;
  uint64_t v58 = v27;
  char v60 = v37;
  id v38 = v10;
  id v53 = v38;
  id v39 = v19;
  id v54 = v39;
  unint64_t v59 = a4;
  BOOL v40 = (void (**)(void))_Block_copy(aBlock);
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_3;
  v44[3] = &unk_1E52FBF48;
  uint64_t v46 = v21;
  uint64_t v47 = v23;
  uint64_t v48 = v25;
  uint64_t v49 = v27;
  v44[4] = self;
  id v45 = v38;
  BOOL v51 = v7;
  unint64_t v50 = a4;
  id v41 = v38;
  int v42 = (void (**)(void *, uint64_t))_Block_copy(v44);
  if (v7 && v6)
  {
    [v39 launchAnimation:v40 afterStarted:0 completion:v42 forHost:self fromCurrentPosition:0];
  }
  else
  {
    if (v7) {
      v40[2](v40);
    }
    if (v6) {
      v42[2](v42, 1);
    }
    else {
      *((unsigned char *)&self->super.super.super.super.super.isa + v43) = 0;
    }
  }
}

void __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_2;
  v6[3] = &unk_1E52FBD40;
  long long v3 = *(_OWORD *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 56);
  long long v10 = v3;
  char v12 = *(unsigned char *)(a1 + 96);
  v6[4] = v2;
  id v7 = *(id *)(a1 + 40);
  id v4 = *(id *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 88);
  id v8 = v4;
  uint64_t v11 = v5;
  [v2 performWithSafeTransitionFrames:v6];
}

uint64_t __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 96))
  {
    double v2 = [*(id *)(a1 + 32) inputViewSet];
    int v3 = [v2 isInputViewPlaceholder];

    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) inputViewSet];
      uint64_t v5 = [v4 inputView];
      objc_msgSend(v5, "setFixedSize:", *(double *)(a1 + 72), *(double *)(a1 + 80));
    }
    BOOL v6 = [*(id *)(a1 + 32) _window];
    id v7 = [*(id *)(a1 + 32) inputViewSet];
    id v8 = [v7 inputAccessoryView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;
    double v17 = [*(id *)(a1 + 32) inputViewSet];
    double v18 = [v17 inputAccessoryView];
    int v19 = [v18 superview];
    objc_msgSend(v6, "convertRect:fromView:", v19, v10, v12, v14, v16);
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;

    objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v21, v23, v25, v27);
    v42.origin.double x = v28;
    v42.origin.double y = v29;
    v42.size.double width = v30;
    v42.size.double height = v31;
    CGRect v41 = CGRectUnion(*(CGRect *)(a1 + 56), v42);
    double x = v41.origin.x;
    double y = v41.origin.y;
    double width = v41.size.width;
    double height = v41.size.height;
    objc_msgSend(*(id *)(a1 + 40), "populateEndInfoWithFrame:");
  }
  else
  {
    double width = *(double *)(a1 + 72);
    double height = *(double *)(a1 + 80);
    double x = *(double *)(a1 + 56);
    double y = *(double *)(a1 + 64);
  }
  objc_msgSend(*(id *)(a1 + 32), "updateKeyboardLayoutGuideWithFrame:layoutViews:", objc_msgSend(*(id *)(a1 + 48), "animated"), x, y, width, height);
  uint64_t v36 = *(void *)(a1 + 88);
  char v37 = *(void **)(a1 + 32);
  uint64_t v38 = *(void *)(a1 + 40);
  return [v37 postStartNotifications:v36 withInfo:v38];
}

void __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_3(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_4;
  v6[3] = &unk_1E52E91C0;
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v3;
  v6[4] = v2;
  id v4 = *(id *)(a1 + 40);
  char v11 = *(unsigned char *)(a1 + 88);
  uint64_t v5 = *(void *)(a1 + 80);
  id v7 = v4;
  uint64_t v10 = v5;
  [v2 performWithSafeTransitionFrames:v6];
  *(unsigned char *)(*(void *)(a1 + 32) + 1419) = 0;
}

uint64_t __124__UIInputWindowController_animateKeyboardTrackingElementsWithNotificationInfo_notificationType_updateForStart_updateForEnd___block_invoke_4(uint64_t a1)
{
  double x = *(double *)(a1 + 48);
  double y = *(double *)(a1 + 56);
  double width = *(double *)(a1 + 64);
  double height = *(double *)(a1 + 72);
  BOOL v6 = [*(id *)(a1 + 32) inputViewSet];
  id v7 = [v6 inputAccessoryView];

  if (v7)
  {
    long long v8 = [*(id *)(a1 + 32) inputViewSet];
    int v9 = [v8 isInputViewPlaceholder];

    if (v9)
    {
      uint64_t v10 = [*(id *)(a1 + 32) inputViewSet];
      char v11 = [v10 inputView];
      objc_msgSend(v11, "setFixedSize:", *(double *)(a1 + 64), *(double *)(a1 + 72));
    }
    double v12 = [*(id *)(a1 + 32) _window];
    double v13 = [*(id *)(a1 + 32) inputViewSet];
    double v14 = [v13 inputAccessoryView];
    [v14 frame];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;
    double v23 = [*(id *)(a1 + 32) inputViewSet];
    double v24 = [v23 inputAccessoryView];
    double v25 = [v24 superview];
    objc_msgSend(v12, "convertRect:fromView:", v25, v16, v18, v20, v22);
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;

    objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v27, v29, v31, v33);
    v44.origin.double x = v34;
    v44.origin.double y = v35;
    v44.size.double width = v36;
    v44.size.double height = v37;
    CGRect v43 = CGRectUnion(*(CGRect *)(a1 + 48), v44);
    double x = v43.origin.x;
    double y = v43.origin.y;
    double width = v43.size.width;
    double height = v43.size.height;
    objc_msgSend(*(id *)(a1 + 40), "populateEndInfoWithFrame:");
  }
  objc_msgSend(*(id *)(a1 + 32), "updateKeyboardLayoutGuideWithFrame:layoutViews:", *(unsigned __int8 *)(a1 + 88), x, y, width, height);
  uint64_t v38 = *(void *)(a1 + 80);
  id v39 = *(void **)(a1 + 32);
  uint64_t v40 = *(void *)(a1 + 40);
  return [v39 postEndNotifications:v38 withInfo:v40];
}

- (CGSize)keyboardSizeFromExternalUpdate
{
  externalTrackingInfo = self->_externalTrackingInfo;
  if (externalTrackingInfo)
  {
    [(UIInputViewSetNotificationInfo *)externalTrackingInfo endFrame];
    double v4 = v3;
    double v6 = v5;
  }
  else
  {
    double v4 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v6;
  result.double width = v4;
  return result;
}

- (void)updateSizingFromRemoteChange
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard usesInputSystemUI])
  {
    double v3 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      placement = self->_placement;
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = placement;
      _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "Updating sizing for existing placement %@", (uint8_t *)&buf, 0xCu);
    }

    double v5 = [(UIInputWindowController *)self currentTransition];
    double v6 = [v5 animationStyle];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      id v8 = [(UIInputWindowController *)self nextAnimationStyle];
    }
    int v9 = v8;

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v47 = 0x3032000000;
    uint64_t v48 = __Block_byref_object_copy__131;
    uint64_t v49 = __Block_byref_object_dispose__131;
    uint64_t v10 = [(UIInputWindowController *)self placement];
    id v50 = +[UIInputViewPlacementTransition transitionForExistingPlacement:v10 animationStyle:v9];

    char v11 = [(UIInputWindowController *)self currentTransition];
    double v12 = v11;
    uint64_t v40 = 0;
    CGRect v41 = &v40;
    uint64_t v42 = 0x3032000000;
    CGRect v43 = __Block_byref_object_copy__131;
    CGRect v44 = __Block_byref_object_dispose__131;
    id v45 = 0;
    if (v11 && ([v11 cancelled] & 1) == 0)
    {
      double v13 = [(UIInputWindowController *)self currentTransition];
      uint64_t v14 = [v13 notificationInfo];
      double v15 = (void *)v41[5];
      v41[5] = v14;

      double v16 = [v12 fromPlacement];
      [*(id *)(*((void *)&buf + 1) + 40) setFromPlacement:v16];

      [v12 setCancelled:1];
      double v17 = [v12 animationStyle];
      [v17 cancelInterruptibleAnimations];

      [(UIInputWindowControllerHosting *)self->_hosting removeAllAnimations];
    }
    uint64_t v18 = v41[5];
    if (!v18)
    {
      double v19 = [(UIInputWindowController *)self notificationInfoWaitingForInputUI];

      if (v19)
      {
        uint64_t v20 = [(UIInputWindowController *)self notificationInfoWaitingForInputUI];
        double v21 = (void *)v41[5];
        v41[5] = v20;

        [(UIInputWindowController *)self setNotificationInfoWaitingForInputUI:0];
      }
      else
      {
        uint64_t v22 = [(UIInputWindowController *)self initialNotificationInfo];
        double v23 = (void *)v41[5];
        v41[5] = v22;

        double v24 = (void *)v41[5];
        double v25 = [*(id *)(*((void *)&buf + 1) + 40) animationStyle];
        [v24 populateWithAnimationStyle:v25];
      }
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke;
      v39[3] = &unk_1E52E4728;
      void v39[4] = self;
      v39[5] = &v40;
      [(UIInputWindowController *)self performWithSafeTransitionFrames:v39];
      uint64_t v18 = v41[5];
    }
    [*(id *)(*((void *)&buf + 1) + 40) setNotificationInfo:v18];
    double v26 = [*(id *)(*((void *)&buf + 1) + 40) animationStyle];
    objc_msgSend(v26, "setExtraOptions:", objc_msgSend(v26, "extraOptions") & 0xFFFFFFFFFFFFFFFDLL);

    [(UIInputWindowController *)self setCurrentTransition:*(void *)(*((void *)&buf + 1) + 40)];
    v38[0] = 0;
    v38[1] = v38;
    v38[2] = 0x2020000000;
    v38[3] = 2;
    [*(id *)(*((void *)&buf + 1) + 40) didAdvanceAnimationToState:1];
    double v27 = [*(id *)(*((void *)&buf + 1) + 40) notificationInfo];
    [v27 setWaitingForInputUI:0];

    double v28 = [*(id *)(*((void *)&buf + 1) + 40) notificationInfo];
    double v29 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    double v30 = [v29 currentUIState];
    objc_msgSend(v28, "setWasCausedRemotely:", objc_msgSend(v28, "wasCausedRemotely") | objc_msgSend(v30, "isLocal") ^ 1);

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_2;
    aBlock[3] = &unk_1E52EB218;
    void aBlock[4] = self;
    void aBlock[5] = &buf;
    aBlock[6] = v38;
    double v31 = _Block_copy(aBlock);
    v36[0] = MEMORY[0x1E4F143A8];
    v36[1] = 3221225472;
    v36[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_6;
    v36[3] = &unk_1E52D9900;
    v36[4] = &buf;
    double v32 = _Block_copy(v36);
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_7;
    v35[3] = &unk_1E52FBF98;
    v35[4] = self;
    v35[5] = &buf;
    v35[6] = v38;
    double v33 = _Block_copy(v35);
    CGFloat v34 = [*(id *)(*((void *)&buf + 1) + 40) animationStyle];
    [v34 launchAnimation:v31 afterStarted:v32 completion:v33 forHost:self fromCurrentPosition:0];

    _Block_object_dispose(v38, 8);
    _Block_object_dispose(&v40, 8);

    _Block_object_dispose(&buf, 8);
  }
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v2 notificationsFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  char v11 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  return objc_msgSend(v11, "populateStartInfoWithFrame:");
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_2(void *a1)
{
  if ([*(id *)(*(void *)(a1[5] + 8) + 40) didAdvanceAnimationToState:2])
  {
    double v2 = (void *)a1[4];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_3;
    v9[3] = &unk_1E52D9F70;
    void v9[4] = v2;
    [v2 performWithoutCallbacksOrNotifications:v9];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_4;
    v6[3] = &unk_1E52FBF70;
    long long v7 = *((_OWORD *)a1 + 2);
    uint64_t v8 = a1[6];
    [(id)v7 performWithSafeTransitionFrames:v6];
    uint64_t v3 = *(void *)(*(void *)(a1[6] + 8) + 24);
    double v4 = (void *)a1[4];
    double v5 = [*(id *)(*(void *)(a1[5] + 8) + 40) notificationInfo];
    [v4 postStartNotifications:v3 withInfo:v5];
  }
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:0 layoutSubviews:1];
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_4(uint64_t a1)
{
  double v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v2 notificationsFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v19 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) notificationInfo];
  objc_msgSend(v19, "populateEndInfoWithFrame:", v12, v14, v16, v18);

  uint64_t v20 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) notificationInfo];
  double v21 = NSString;
  v28.origin.double x = v12;
  v28.origin.double y = v14;
  v28.size.double width = v16;
  v28.size.double height = v18;
  uint64_t v22 = NSStringFromCGRect(v28);
  double v23 = [v21 stringWithFormat:@"updatePlaceholders to %@", v22];
  [v20 addKeyboardNotificationDebuggingInfo:v23];

  if (v18 == 0.0) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 3;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_5;
  aBlock[3] = &unk_1E52FBF70;
  void aBlock[4] = *(void *)(a1 + 32);
  int8x16_t v27 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  double v24 = _Block_copy(aBlock);
  double v25 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) animationStyle];
  [v25 addAnimationToCurrentAnimations:v24];
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_5(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 24);
  id v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) notificationInfo];
  [v1 keyboardMoveOfType:v2 info:v3];
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) didAdvanceAnimationToState:3];
}

uint64_t __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_7(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) currentTransition];
  id v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);

  if (v2 == v3) {
    [*(id *)(a1 + 32) setCurrentTransition:0];
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1000) = 0;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) didAdvanceAnimationToState:4];
  if (v2 == v3)
  {
    double v4 = *(void **)(a1 + 32);
    double v5 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) toPlacement];
    [v4 updateAppearStatesForPlacement:v5 start:0 animated:1];

    double v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v7 = [*(id *)(a1 + 32) view];
    double v8 = [v7 _window];
    [v6 completeMoveKeyboardForWindow:v8];
  }
  double v9 = *(void **)(a1 + 32);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_8;
  v14[3] = &unk_1E52FBF70;
  v14[4] = v9;
  int8x16_t v15 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  [v9 performWithSafeTransitionFrames:v14];
  double v10 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) animationController];
  uint64_t v11 = *(void *)(a1 + 32);
  double v12 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) animationContext];
  [v10 completeAnimationWithHost:v11 context:v12];

  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setAnimationContext:0];
}

void __55__UIInputWindowController_updateSizingFromRemoteChange__block_invoke_8(void *a1)
{
  uint64_t v1 = (void *)a1[4];
  uint64_t v2 = *(void *)(*(void *)(a1[5] + 8) + 24);
  id v3 = [*(id *)(*(void *)(a1[6] + 8) + 40) notificationInfo];
  [v1 postEndNotifications:v2 withInfo:v3];
}

- (void)moveFromPlacement:(id)a3 toPlacement:(id)a4 starting:(id)a5 completion:(id)a6
{
  uint64_t v148 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v108 = a4;
  CGRect v107 = (void (**)(void))a5;
  id v105 = a6;
  uint64_t v11 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    placement = self->_placement;
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v108;
    *(_WORD *)&buf[22] = 2112;
    v145 = placement;
    _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Moving from placement: %@ to placement: %@ (currentPlacement: %@)", buf, 0x20u);
  }

  kdebug_trace();
  kac_get_log();
  double v13 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v14 = os_signpost_id_make_with_pointer(v13, self);
  if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v15 = v14;
    if (os_signpost_enabled(v13))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v15, "animationPreparing", "", buf, 2u);
    }
  }

  if (self->_disablePlacementChanges)
  {
    if ([v108 showsKeyboard])
    {
      double v16 = [(UIInputWindowController *)self inputViewSet];
      double v17 = [v16 inputAccessoryView];
      double v18 = off_1E52D3B58;
      if (v17) {
        double v18 = off_1E52D3B28;
      }
      uint64_t v19 = [(__objc2_class *)*v18 placement];

      id v108 = (id)v19;
    }
    uint64_t v20 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      double v21 = [(UIInputWindowController *)self inputViewSet];
      uint64_t v22 = [v21 inputAccessoryView];
      *(_DWORD *)long long buf = 67109378;
      *(_DWORD *)&uint8_t buf[4] = v22 != 0;
      *(_WORD *)&buf[8] = 2112;
      *(void *)&buf[10] = v108;
      _os_log_impl(&dword_1853B0000, v20, OS_LOG_TYPE_DEFAULT, "_disablePlacementChanges = YES, (iav: %d) new placement: %@", buf, 0x12u);
    }
  }
  if (([v108 showsInputOrAssistantViews] & 1) != 0 || objc_msgSend(v108, "showsKeyboard"))
  {
    self->_BOOL externalTrackingUpdateInProgress = 0;
    externalTrackingInfo = self->_externalTrackingInfo;
    self->_externalTrackingInfo = 0;
  }
  CGRect v106 = [(UIInputWindowController *)self nextAnimationStyle];
  double v24 = +[UIInputViewPlacementTransition transitionFromPlacement:v10 toPlacement:v108 withAnimationStyle:v106];
  if ([(UIInputWindowController *)self mergeTransitionIfNecessaryWithTransition:v24])
  {
    if (v107) {
      [(UIInputWindowController *)self addPendingActivity:v107];
    }
    if (v105) {
      -[UIInputWindowController addPendingActivity:](self, "addPendingActivity:");
    }
    goto LABEL_87;
  }
  [(UIInputWindowController *)self flushPendingActivities];
  id v25 = v10;
  double v26 = [(UIInputWindowController *)self currentTransition];
  CGRect v103 = v25;
  if (v26)
  {
    if ([(UIInputWindowController *)self isRotating])
    {
      int8x16_t v27 = [(UIInputWindowController *)self currentTransition];
      char v28 = [v27 cancelled];

      CGRect v103 = v25;
      if (v28) {
        goto LABEL_28;
      }
    }
    else
    {
    }
    CGRect v103 = [v24 fromPlacement];
  }
LABEL_28:
  double v29 = [v24 fromPlacement];

  int v30 = [v29 isEqual:v108];
  double v31 = [v24 animationStyle];
  unint64_t v32 = [v31 extraOptions] & 0xFFFFFFFFFFFFFFFDLL;
  uint64_t v33 = 2;
  if (!v30) {
    uint64_t v33 = 0;
  }
  [v31 setExtraOptions:v32 | v33];

  [(UIInputWindowController *)self setCurrentTransition:v24];
  if (v107) {
    v107[2]();
  }
  if ([v29 isEqual:v108])
  {
    CGFloat v34 = +[UIInputViewAnimationStyle animationStyleImmediate];
    [v24 setAnimationStyle:v34];
  }
  CGFloat v35 = [(UIInputWindowController *)self initialNotificationInfo];
  [v24 setNotificationInfo:v35];

  CGFloat v36 = [v24 notificationInfo];
  CGFloat v37 = [v24 animationStyle];
  [v36 populateWithAnimationStyle:v37];

  objc_msgSend(v24, "setNotifications:", objc_msgSend(v103, "notificationsForTransitionToPlacement:", v108));
  if ([v24 notifications])
  {
    if ([v24 notifications] != 1)
    {
      uint64_t v38 = [v24 notificationInfo];
      [v38 setForceNotification:1];
    }
  }
  else
  {
    id v39 = [v24 notificationInfo];
    int v40 = [v39 forceNotification];

    if (v40)
    {
      if ([v108 showsInputViews])
      {
        uint64_t v41 = 2;
      }
      else if ([v108 inputViewWillAppear])
      {
        uint64_t v41 = 1;
      }
      else
      {
        uint64_t v41 = 3;
      }
      [v24 setNotifications:v41];
    }
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    if ([v108 accessoryViewWillAppear]) {
      unsigned int v42 = [v108 inputViewWillAppear] ^ 1;
    }
    else {
      unsigned int v42 = 0;
    }
    if ([v29 accessoryViewWillAppear]
      && ([v29 inputViewWillAppear] & 1) == 0)
    {
      int v43 = [v108 accessoryViewWillAppear] ^ 1;
    }
    else
    {
      int v43 = 0;
    }
    CGRect v44 = [v24 notificationInfo];
    [v44 setShouldSendInClient:v43 | v42];
  }
  *(void *)long long buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x4010000000;
  v145 = (UIInputViewSetPlacement *)&unk_186D7DBA7;
  long long v146 = 0u;
  long long v147 = 0u;
  v139[0] = MEMORY[0x1E4F143A8];
  v139[1] = 3221225472;
  v139[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke;
  v139[3] = &unk_1E52E3210;
  v139[5] = buf;
  v139[4] = self;
  [(UIInputWindowController *)self performWithSafeTransitionFrames:v139];
  [v24 didAdvanceAnimationToState:1];
  [(UIInputWindowController *)self updateAppearStatesForPlacement:v108 start:1 animated:1];
  if (([v29 isEqual:self->_placement] & 1) == 0)
  {
    id v45 = [(UIViewController *)self view];
    [v45 frame];
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    id v54 = [(UIViewController *)self view];
    uint64_t v55 = [v54 window];
    [v55 bounds];
    v150.origin.double x = v56;
    v150.origin.double y = v57;
    v150.size.double width = v58;
    v150.size.double height = v59;
    v149.origin.double x = v47;
    v149.origin.double y = v49;
    v149.size.double width = v51;
    v149.size.double height = v53;
    if (CGRectEqualToRect(v149, v150))
    {
    }
    else
    {
      int v60 = [v29 requiresWindowBasedSafeAreaInsets];
      int v61 = [v108 requiresWindowBasedSafeAreaInsets];

      if (v60 != v61) {
        -[UIViewController _recursiveUpdateContentOverlayInsetsFromParentIfNecessary](self);
      }
    }
  }
  CGRect v62 = [v24 animationStyle];
  __int16 v63 = [v62 controllerForStartPlacement:v29 endPlacement:v108];
  [v24 setAnimationController:v63];

  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2;
  v135[3] = &unk_1E52E53D0;
  v135[4] = self;
  id v64 = v24;
  id v136 = v64;
  v138 = buf;
  id v65 = v108;
  id v137 = v65;
  [(UIInputWindowController *)self performWithSafeTransitionFrames:v135];
  if (([v29 isInteractive] & 1) == 0)
  {
    v130[0] = MEMORY[0x1E4F143A8];
    v130[1] = 3221225472;
    v130[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3;
    v130[3] = &unk_1E52DD450;
    id v131 = v64;
    v132 = self;
    id v133 = v29;
    id v134 = v65;
    [(UIInputWindowController *)self ignoreLayoutNotifications:v130];
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    double v66 = [v64 notificationInfo];
    CGRect v67 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    CGRect v68 = [v67 currentUIState];
    objc_msgSend(v66, "setWasCausedRemotely:", objc_msgSend(v66, "wasCausedRemotely") | objc_msgSend(v68, "isLocal") ^ 1);
  }
  else
  {
    double v66 = [v64 notificationInfo];
    CGRect v67 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    objc_msgSend(v66, "setWasCausedRemotely:", objc_msgSend(v67, "handlingRemoteEvent") | objc_msgSend(v66, "wasCausedRemotely"));
  }

  double v69 = [v64 animationStyle];
  if (([v69 animated] & 1) == 0)
  {

    goto LABEL_67;
  }
  BOOL v70 = +[UIViewPropertyAnimator _trackedAnimationsStartPaused];

  if (!v70)
  {
LABEL_67:
    char v102 = 0;
    goto LABEL_68;
  }
  +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:0];
  char v102 = 1;
LABEL_68:
  uint64_t v71 = [v29 assistantView];
  double v72 = (void *)v71;
  if (v71) {
    double v73 = (void *)v71;
  }
  else {
    double v73 = v29;
  }
  id v104 = v73;

  uint64_t v74 = [v65 assistantView];
  double v75 = (void *)v74;
  if (v74) {
    v76 = (void *)v74;
  }
  else {
    v76 = v65;
  }
  id v77 = v76;

  if (![v104 isEqual:v29] || (objc_msgSend(v77, "isEqual:", v65) & 1) == 0)
  {
    v78 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v140 = 138412546;
      id v141 = v104;
      __int16 v142 = 2112;
      id v143 = v77;
      _os_log_impl(&dword_1853B0000, v78, OS_LOG_TYPE_DEFAULT, "moveFromPlacement, updated placements from: %@, to: %@", v140, 0x16u);
    }
  }
  if (([v104 isFloatingAssistantView] & 1) != 0
    || [v77 isFloatingAssistantView])
  {
    char v79 = [v104 isCompactAssistantView];
    char v80 = v79 ^ [v77 isCompactAssistantView];
  }
  else
  {
    char v80 = 0;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_529;
  aBlock[3] = &unk_1E52DD450;
  void aBlock[4] = self;
  id v81 = v64;
  id v127 = v81;
  id v82 = v65;
  id v128 = v82;
  id v83 = v29;
  id v129 = v83;
  v84 = _Block_copy(aBlock);
  v121[0] = MEMORY[0x1E4F143A8];
  v121[1] = 3221225472;
  v121[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_535;
  v121[3] = &unk_1E52DAD98;
  v121[4] = self;
  id v85 = v81;
  id v122 = v85;
  char v124 = v80;
  id v101 = v77;
  id v123 = v101;
  char v125 = v102;
  double v86 = _Block_copy(v121);
  double v87 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v88 = [v87 _transitionStartTime];

  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_536;
  v115[3] = &unk_1E52FBFC0;
  v115[4] = self;
  id v89 = v85;
  id v116 = v89;
  id v90 = v82;
  id v117 = v90;
  id v91 = v88;
  id v118 = v91;
  id v10 = v83;
  id v119 = v10;
  id v120 = v105;
  CGRect v92 = _Block_copy(v115);
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_557;
  v109[3] = &unk_1E52FBFE8;
  id v93 = v89;
  id v110 = v93;
  id v94 = v84;
  id v112 = v94;
  id v95 = v86;
  id v113 = v95;
  id v96 = v92;
  id v114 = v96;
  v111 = self;
  CGRect v97 = _Block_copy(v109);
  [(UIInputWindowController *)self chainPlacementsIfNecessaryFrom:v10 toPlacement:v90 transition:v93 completion:v97];
  kdebug_trace();
  kac_get_log();
  CGRect v98 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v99 = os_signpost_id_make_with_pointer(v98, self);
  if (v99 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v100 = v99;
    if (os_signpost_enabled(v98))
    {
      *(_WORD *)v140 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v98, OS_SIGNPOST_INTERVAL_END, v100, "animationPreparing", "", v140, 2u);
    }
  }

  _Block_object_dispose(buf, 8);
LABEL_87:
}

uint64_t __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v2 notificationsFrame];
  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  void v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;

  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 32), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 48), *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 56));
  double v9 = *(void **)(*(void *)(a1 + 40) + 8);
  void v9[4] = v10;
  void v9[5] = v11;
  v9[6] = v12;
  v9[7] = v13;
  return result;
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v2 notificationsFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  uint64_t v19 = [*(id *)(a1 + 40) notificationInfo];
  objc_msgSend(v19, "populateStartInfoWithFrame:", v12, v14, v16, v18);

  uint64_t v20 = [*(id *)(a1 + 40) notificationInfo];
  CGRect v23 = *(CGRect *)(*(void *)(*(void *)(a1 + 56) + 8) + 32);
  v24.origin.double x = v12;
  v24.origin.double y = v14;
  v24.size.double width = v16;
  v24.size.double height = v18;
  objc_msgSend(v20, "setForceNotification:", objc_msgSend(v20, "forceNotification") | !CGRectEqualToRect(v23, v24));

  id v21 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v21 isWaitingForInputUI]
    && [*(id *)(a1 + 48) showsKeyboard])
  {

    if (v18 != 0.0) {
      return;
    }
    id v21 = [*(id *)(a1 + 40) notificationInfo];
    [v21 setWaitingForInputUI:1];
  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) animationController];
  uint64_t v2 = [v3 prepareAnimationWithHost:*(void *)(a1 + 40) startPlacement:*(void *)(a1 + 48) endPlacement:*(void *)(a1 + 56)];
  [*(id *)(a1 + 32) setAnimationContext:v2];
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_529(id *a1)
{
  kdebug_trace();
  kac_get_log();
  uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, (const void *)((unint64_t)a1[5] ^ (unint64_t)a1[4]));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "animationAnimating", "", buf, 2u);
    }
  }

  if ([a1[5] didAdvanceAnimationToState:2])
  {
    if ([a1[6] showsKeyboard] && (objc_msgSend(a1[4], "dontDismissReachability") & 1) == 0) {
      [(id)UIApp _deactivateReachability];
    }
    double v5 = [*((id *)a1[4] + 130) itemForPurpose:2];
    [v5 prepareTranslationFromPlacement:a1[7] to:a1[6]];

    [a1[4] _updatePlacementWithPlacement:a1[6]];
    [a1[4] updateVisibilityConstraintsForPlacement:a1[6]];
    double v6 = [a1[5] animationController];
    id v7 = a1[4];
    double v8 = [a1[5] animationContext];
    [v6 performAnimationWithHost:v7 context:v8];

    id v9 = a1[4];
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    double v26 = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_530;
    int8x16_t v27 = &unk_1E52DD450;
    id v28 = v9;
    id v29 = a1[5];
    id v30 = a1[7];
    id v31 = a1[6];
    [v9 performWithSafeTransitionFrames:&v24];
    *((unsigned char *)a1[4] + 1000) = 1;
    double v10 = objc_msgSend(*((id *)a1[4] + 130), "itemForPurpose:", 2, v24, v25, v26, v27, v28);
    [v10 willBeginTranslationFromPlacement:a1[7] to:a1[6]];

    id v11 = a1[4];
    uint64_t v12 = [a1[5] notifications];
    double v13 = [a1[5] notificationInfo];
    [v11 postStartNotifications:v12 withInfo:v13];

    id v14 = a1[4];
    double v15 = [v14 placement];
    if ([v15 showsKeyboard])
    {
      double v16 = [a1[4] inputViewSet];
      double v17 = [v16 keyboard];
      [v14 registerPowerLogEvent:v17 != 0];
    }
    else
    {
      [v14 registerPowerLogEvent:0];
    }

    kdebug_trace();
    kac_get_log();
    id v21 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v22 = os_signpost_id_make_with_pointer(v21, (const void *)((unint64_t)a1[5] ^ (unint64_t)a1[4]));
    if (v22 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v23 = v22;
      if (os_signpost_enabled(v21))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v21, OS_SIGNPOST_INTERVAL_END, v23, "animationAnimating", "", buf, 2u);
      }
    }
  }
  else
  {
    kdebug_trace();
    kac_get_log();
    double v18 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v19 = os_signpost_id_make_with_pointer(v18, (const void *)((unint64_t)a1[5] ^ (unint64_t)a1[4]));
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v20 = v19;
      if (os_signpost_enabled(v18))
      {
        *(_WORD *)long long buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v18, OS_SIGNPOST_INTERVAL_END, v20, "animationAnimating", "", buf, 2u);
      }
    }
  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_530(id *a1)
{
  uint64_t v2 = [*((id *)a1[4] + 130) itemForPurpose:1];
  [v2 notificationsFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(a1[4], "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  os_signpost_id_t v19 = [a1[5] notificationInfo];
  int v20 = [v19 waitingForInputUI];

  if (v20 && v18 > 0.0)
  {
    id v21 = [a1[5] notificationInfo];
    [v21 setWaitingForInputUI:0];
  }
  os_signpost_id_t v22 = [a1[5] notificationInfo];
  objc_msgSend(v22, "populateEndInfoWithFrame:", v12, v14, v16, v18);

  os_signpost_id_t v23 = [a1[5] notificationInfo];
  uint64_t v24 = NSString;
  uint64_t v25 = [a1[5] fromPlacement];
  uint64_t v26 = objc_opt_class();
  int8x16_t v27 = [a1[5] toPlacement];
  id v28 = [v24 stringWithFormat:@"moveFromPlacement: %@ toPlacement: %@", v26, objc_opt_class()];
  [v23 addKeyboardNotificationDebuggingInfo:v28];

  if ((([a1[6] isCompactAssistantView] & 1) == 0
     && ([a1[6] isFloating] & 1) == 0
     && ![a1[7] isFloating]
     || [a1[5] notifications] != 1)
    && ([a1[6] isInteractive] & 1) == 0
    && ([a1[7] isUndocked] & 1) == 0)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_534;
    aBlock[3] = &unk_1E52DD450;
    id v34 = a1[5];
    id v29 = a1[7];
    id v30 = a1[4];
    id v35 = v29;
    id v36 = v30;
    id v37 = a1[6];
    id v31 = _Block_copy(aBlock);
    unint64_t v32 = [a1[5] animationStyle];
    [v32 addAnimationToCurrentAnimations:v31];
  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_534(id *a1)
{
  uint64_t v2 = [a1[4] notifications];
  if (v2 || ([a1[5] isFloatingAssistantView] & 1) != 0)
  {
    if ([a1[7] isUndocked]
      && ![a1[5] showsInputOrAssistantViews])
    {
      uint64_t v2 = 3;
    }
    if ([a1[5] isFloatingAssistantView])
    {
      double v3 = [a1[6] inputViewSet];
      double v4 = [v3 assistantViewController];

      if (v4)
      {
        double v5 = [a1[6] inputViewSet];
        [v5 assistantViewController];
      }
      else
      {
        double v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        [v5 systemInputAssistantViewController];
      double v10 = };

      [v10 barFrame];
      double v12 = v11;
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      os_signpost_id_t v19 = [v10 view];
      int v20 = [v19 superview];

      id v21 = [a1[6] _window];
      os_signpost_id_t v22 = v21;
      if (v20)
      {
        os_signpost_id_t v23 = [v10 view];
        objc_msgSend(v22, "convertRect:fromView:", v23, v12, v14, v16, v18);
        double v12 = v24;
        double v14 = v25;
        double v16 = v26;
        double v18 = v27;
      }
      else
      {
        uint64_t v28 = [v21 _isRemoteKeyboardWindow];

        if ((v28 & 1) == 0)
        {
          id v29 = [a1[6] _window];
          id v30 = [*((id *)a1[6] + 130) itemForPurpose:0];
          id v31 = [v30 hostView];
          objc_msgSend(v29, "convertRect:fromView:", v31, v12, v14, v16, v18);
          double v12 = v32;
          double v34 = v33;
          double v16 = v35;
          double v18 = v36;

          double v14 = v34 - *(double *)&UIFloatingAssistantBottomMargin;
        }
      }
      v50.origin.double x = v12;
      v50.origin.double y = v14;
      v50.size.double width = v16;
      v50.size.double height = v18;
      if (!CGRectIsEmpty(v50))
      {
        objc_msgSend(a1[6], "convertRectFromContainerCoordinateSpaceToScreenSpace:", v12, v14, v16, v18);
        double v38 = v37;
        double v40 = v39;
        double v42 = v41;
        double v44 = v43;
        id v45 = a1[6];
        double v46 = [a1[4] animationStyle];
        objc_msgSend(v45, "keyboardMovedToScreenPosition:animated:", objc_msgSend(v46, "animated"), v38, v40, v42, v44);
      }
      uint64_t v2 = 0;
    }
    id v47 = a1[6];
    uint64_t v7 = [a1[4] notificationInfo];
    id v48 = (id)v7;
    double v8 = v47;
    uint64_t v9 = v2;
  }
  else
  {
    if (![a1[5] showsInputViews]) {
      return;
    }
    id v6 = a1[6];
    uint64_t v7 = [a1[4] notificationInfo];
    id v48 = (id)v7;
    double v8 = v6;
    uint64_t v9 = 1;
  }
  [v8 keyboardMoveOfType:v9 info:v7];
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_535(uint64_t a1)
{
  kdebug_trace();
  kac_get_log();
  uint64_t v2 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v3 = os_signpost_id_make_with_pointer(v2, (const void *)(*(void *)(a1 + 40) ^ *(void *)(a1 + 32)));
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v4 = v3;
    if (os_signpost_enabled(v2))
    {
      *(_WORD *)long long buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v2, OS_SIGNPOST_INTERVAL_BEGIN, v4, "animationStarted", "", buf, 2u);
    }
  }

  [*(id *)(a1 + 40) didAdvanceAnimationToState:3];
  if (([*(id *)(a1 + 32) shouldNotifyRemoteKeyboards] & 1) == 0)
  {
    double v5 = [*(id *)(a1 + 40) animationStyle];
    if ([v5 animated])
    {
      id v6 = [*(id *)(a1 + 40) animationStyle];
      [v6 duration];
      double v8 = v7;

      if (v8 <= 0.0) {
        goto LABEL_9;
      }
      double v5 = +[UIPeripheralHost sharedInstance];
      [v5 flushDelayedTasks];
    }
  }
LABEL_9:
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v9 = *(void *)(a1 + 48);
    double v10 = *(void **)(a1 + 32);
    double v11 = [*(id *)(a1 + 40) animationStyle];
    objc_msgSend(v10, "prepareForInputAssistant:animated:", v9, objc_msgSend(v11, "animated"));

    [*(id *)(*(void *)(a1 + 32) + 1040) initializeTranslateGestureRecognizerIfNecessary];
  }
  kdebug_trace();
  kac_get_log();
  double v12 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v13 = os_signpost_id_make_with_pointer(v12, (const void *)(*(void *)(a1 + 40) ^ *(void *)(a1 + 32)));
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v14 = v13;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)double v15 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v12, OS_SIGNPOST_INTERVAL_END, v14, "animationStarted", "", v15, 2u);
    }
  }

  if (*(unsigned char *)(a1 + 57)) {
    +[UIViewPropertyAnimator _setTrackedAnimationsStartPaused:1];
  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_536(uint64_t a1, BOOL a2)
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v4 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, (const void *)(*(void *)(a1 + 40) ^ *(void *)(a1 + 32)));
  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_DWORD *)long long buf = 67109376;
      BOOL v60 = a2;
      __int16 v61 = 1024;
      int v62 = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "animationDone", " finished=%{signpost.description:attribute}d started=%{signpost.description}d", buf, 0xEu);
    }
  }

  [*(id *)(a1 + 32) setPlacementDuringAnimation:*(void *)(a1 + 48)];
  double v7 = [*(id *)(a1 + 32) currentTransition];
  double v8 = *(void **)(a1 + 40);

  if (v7 != v8) {
    goto LABEL_23;
  }
  [*(id *)(a1 + 32) setCurrentTransition:0];
  if ([*(id *)(a1 + 32) shouldNotifyRemoteKeyboards]) {
    goto LABEL_23;
  }
  uint64_t v9 = [*(id *)(a1 + 40) fromPlacement];
  if (([v9 showsKeyboard] & 1) == 0
    && [*(id *)(*(void *)(a1 + 32) + 1432) showsKeyboard])
  {

LABEL_12:
    uint64_t v12 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v13 = *(void *)(a1 + 32);
    os_signpost_id_t v14 = *(void **)(v13 + 1352);
    *(void *)(v13 + 1352) = v12;
LABEL_22:

    goto LABEL_23;
  }
  double v10 = [*(id *)(a1 + 40) fromPlacement];
  if ([v10 isUndocked])
  {
  }
  else
  {
    int v11 = [*(id *)(*(void *)(a1 + 32) + 1432) isUndocked];

    if (v11) {
      goto LABEL_12;
    }
  }
  os_signpost_id_t v14 = [*(id *)(a1 + 40) fromPlacement];
  if ([v14 showsKeyboard]
    && ([*(id *)(*(void *)(a1 + 32) + 1432) showsKeyboard] & 1) == 0)
  {

    goto LABEL_20;
  }
  double v15 = [*(id *)(a1 + 40) fromPlacement];
  if (([v15 isUndocked] & 1) == 0)
  {

    goto LABEL_22;
  }
  char v16 = [*(id *)(*(void *)(a1 + 32) + 1432) isUndocked];

  if ((v16 & 1) == 0)
  {
LABEL_20:
    if (!*(void *)(*(void *)(a1 + 32) + 1352)) {
      goto LABEL_23;
    }
    double v17 = [MEMORY[0x1E4F1C9C8] date];
    [v17 timeIntervalSinceDate:*(void *)(*(void *)(a1 + 32) + 1352)];
    double v19 = v18;

    +[_UIKeyboardUsageTracking keyboardTotalOnScreenTime:orientation:](_UIKeyboardUsageTracking, "keyboardTotalOnScreenTime:orientation:", [*(id *)(a1 + 32) keyboardOrientation], v19);
    uint64_t v20 = *(void *)(a1 + 32);
    os_signpost_id_t v14 = *(void **)(v20 + 1352);
    *(void *)(v20 + 1352) = 0;
    goto LABEL_22;
  }
LABEL_23:
  if ([*(id *)(a1 + 40) didAdvanceAnimationToState:4])
  {
    objc_msgSend(*(id *)(a1 + 32), "_collectTransitionTimeStatistics:withStart:", objc_msgSend(*(id *)(a1 + 40), "notifications"), *(void *)(a1 + 56));
    int v21 = 1;
  }
  else
  {
    int v21 = [*(id *)(a1 + 40) didAdvanceAnimationToState:3];
  }
  if (v7 == v8)
  {
    [*(id *)(a1 + 32) updateAppearStatesForPlacement:*(void *)(a1 + 48) start:0 animated:1];
    os_signpost_id_t v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    os_signpost_id_t v23 = [*(id *)(a1 + 32) view];
    double v24 = [v23 _window];
    [v22 completeMoveKeyboardForWindow:v24];

    if (+[UIKeyboard usesInputSystemUI])
    {
      double v25 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v26 = [v25 remoteInputViewHost];

      [v26 updateInputViewsIfNecessary];
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 1000) = 0;
    double v27 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:2];
    [v27 didFinishTranslationFromPlacement:*(void *)(a1 + 64) to:*(void *)(a1 + 48)];

    uint64_t v28 = *(void *)(a1 + 72);
    if (v28) {
      (*(void (**)(void))(v28 + 16))();
    }
    [*(id *)(a1 + 32) flushPendingActivities];
  }
  if (v21)
  {
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_537;
    v54[3] = &unk_1E52DD450;
    id v29 = *(void **)(a1 + 32);
    id v55 = *(id *)(a1 + 40);
    id v56 = *(id *)(a1 + 64);
    id v30 = *(id *)(a1 + 48);
    uint64_t v31 = *(void *)(a1 + 32);
    id v57 = v30;
    uint64_t v58 = v31;
    [v29 performWithSafeTransitionFrames:v54];
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_553;
  aBlock[3] = &unk_1E52D9F98;
  id v32 = *(id *)(a1 + 40);
  uint64_t v33 = *(void *)(a1 + 32);
  id v52 = v32;
  uint64_t v53 = v33;
  double v34 = (void (**)(void))_Block_copy(aBlock);
  double v35 = v34;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 1360))
  {
    double v36 = _Block_copy(v34);
    uint64_t v37 = *(void *)(a1 + 32);
    double v38 = *(void **)(v37 + 1368);
    *(void *)(v37 + 1368) = v36;

    dispatch_time_t v39 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3_554;
    block[3] = &unk_1E52D9F70;
    block[4] = *(void *)(a1 + 32);
    dispatch_after(v39, MEMORY[0x1E4F14428], block);
  }
  else
  {
    v34[2](v34);
  }
  if (+[UIKeyboard isKeyboardProcess]
    && [*(id *)(a1 + 48) showsInputViews])
  {
    double v40 = +[UIKeyboardImpl activeInstance];
    double v41 = [v40 remoteTextInputPartner];
    [v41 forwardKeyboardOperation:sel_clearKeyboardSnapshot object:0];
  }
  if (([*(id *)(a1 + 32) shouldNotifyRemoteKeyboards] & 1) == 0)
  {
    double v42 = [*(id *)(a1 + 40) animationStyle];
    if (![v42 animated])
    {
LABEL_44:

      goto LABEL_45;
    }
    double v43 = [*(id *)(a1 + 40) animationStyle];
    [v43 duration];
    double v45 = v44;

    if (v45 > 0.0)
    {
      double v42 = +[UIPeripheralHost sharedInstance];
      [v42 flushDelayedTasks];
      goto LABEL_44;
    }
  }
LABEL_45:
  double v46 = +[UIKeyboardImpl sharedInstance];
  [v46 flushDelayedTasks];

  kdebug_trace();
  kac_get_log();
  id v47 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v48 = os_signpost_id_make_with_pointer(v47, (const void *)(*(void *)(a1 + 40) ^ *(void *)(a1 + 32)));
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v49 = v48;
    if (os_signpost_enabled(v47))
    {
      *(_DWORD *)long long buf = 67109376;
      BOOL v60 = v7 == v8;
      __int16 v61 = 1024;
      int v62 = v21;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v47, OS_SIGNPOST_INTERVAL_END, v49, "animationDone", " finished=%{signpost.description:attribute}d started=%{signpost.description}d", buf, 0xEu);
    }
  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_537(id *a1)
{
  uint64_t v2 = [a1[4] notificationInfo];
  os_signpost_id_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  os_signpost_id_t v5 = [v3 stringWithFormat:@"moveFromPlacement: %@ toPlacement: %@ [didStart]", v4, objc_opt_class()];
  [v2 addKeyboardNotificationDebuggingInfo:v5];

  id v6 = a1[7];
  uint64_t v7 = [a1[4] notifications];
  double v8 = [a1[4] notificationInfo];
  [v6 postEndNotifications:v7 withInfo:v8];

  if (([a1[6] isUndocked] & 1) != 0 || objc_msgSend(a1[6], "showsInputViews"))
  {
    id v41 = +[UIInputViewSetNotificationInfo info];
    uint64_t v9 = [*((id *)a1[7] + 130) itemForPurpose:1];
    [v9 notificationsFrame];
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;

    objc_msgSend(a1[7], "convertRectFromContainerCoordinateSpaceToScreenSpace:", v11, v13, v15, v17);
    objc_msgSend(v41, "populateEndInfoWithFrame:");
    [v41 endFrame];
    CGFloat v19 = v18;
    CGFloat v21 = v20;
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    double v26 = [a1[4] notificationInfo];
    [v26 endFrame];
    v44.origin.double x = v27;
    v44.origin.double y = v28;
    v44.size.double width = v29;
    v44.size.double height = v30;
    v43.origin.double x = v19;
    v43.origin.double y = v21;
    v43.size.double width = v23;
    v43.size.double height = v25;
    BOOL v31 = CGRectEqualToRect(v43, v44);

    if (!v31)
    {
      id v32 = NSString;
      if ([a1[6] isUndocked]) {
        uint64_t v33 = @"isUndocked ";
      }
      else {
        uint64_t v33 = &stru_1ED0E84C0;
      }
      int v34 = [a1[6] showsInputViews];
      double v35 = @"showsInputViews";
      if (!v34) {
        double v35 = &stru_1ED0E84C0;
      }
      double v36 = [v32 stringWithFormat:@"%@%@", v33, v35];
      uint64_t v37 = NSString;
      uint64_t v38 = objc_opt_class();
      dispatch_time_t v39 = [v37 stringWithFormat:@"moveFromPlacement: %@ toPlacement: %@ [%@]", v38, objc_opt_class(), v36];
      [v41 addKeyboardNotificationDebuggingInfo:v39];

      double v40 = [a1[4] notificationInfo];
      [v40 endFrame];
      objc_msgSend(v41, "populateStartInfoWithFrame:");

      if (([a1[5] isInteractive] & 1) == 0) {
        [a1[7] keyboardMoveOfType:2 info:v41];
      }
      [a1[7] postStartNotifications:1 withInfo:v41];
      [a1[7] postEndNotifications:1 withInfo:v41];
    }
  }
}

uint64_t __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_2_553(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) animationController];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = [*(id *)(a1 + 32) animationContext];
  [v2 completeAnimationWithHost:v3 context:v4];

  [*(id *)(a1 + 32) setAnimationContext:0];
  os_signpost_id_t v5 = *(void **)(a1 + 40);
  return [v5 setPlacementDuringAnimation:0];
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_3_554(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1368);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void **)(v3 + 1368);
    *(void *)(v3 + 1368) = 0;
  }
}

void __77__UIInputWindowController_moveFromPlacement_toPlacement_starting_completion___block_invoke_557(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) animationStyle];
  [v2 launchAnimation:*(void *)(a1 + 48) afterStarted:*(void *)(a1 + 56) completion:*(void *)(a1 + 64) forHost:*(void *)(a1 + 40) fromCurrentPosition:0];
}

- (void)chainPlacementsIfNecessaryFrom:(id)a3 toPlacement:(id)a4 transition:(id)a5 completion:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  double v13 = (void (**)(void))a6;
  double v14 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    id v75 = v12;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "chainPlacementsIfNecessaryFrom, from: %@, to: %@ transition: %@", buf, 0x20u);
  }

  if ([v10 isEqual:v11]) {
    goto LABEL_41;
  }
  double v15 = [v12 animationStyle];
  if (![v15 animated]) {
    goto LABEL_40;
  }
  BOOL v16 = [(UIInputWindowController *)self isTransitioningBetweenFloatingStates];

  if (v16) {
    goto LABEL_41;
  }
  if ([v11 isFloating] && objc_msgSend(v10, "isVisible"))
  {
    if ([v10 isFloatingAssistantView])
    {
      id v54 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v10];
      uint64_t v17 = [v12 animationStyle];
    }
    else if ([v10 showsInputOrAssistantViews])
    {
      CGFloat v25 = [(UIInputWindowController *)self inputViewSet];
      double v26 = [v25 inputAccessoryView];

      CGFloat v27 = off_1E52D3B58;
      if (v26) {
        CGFloat v27 = off_1E52D3B28;
      }
      id v54 = [(__objc2_class *)*v27 placement];
      uint64_t v17 = [v12 animationStyle];
    }
    else
    {
      id v54 = +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:v10];
      uint64_t v17 = +[UIInputViewAnimationStyle animationStyleImmediate];
    }
    double v18 = (void *)v17;
    id v23 = +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:v11];
    uint64_t v24 = +[UIInputViewAnimationStyle animationStyleImmediate];
    goto LABEL_56;
  }
  if ([v11 isVisible] && objc_msgSend(v10, "isFloating"))
  {
    id v54 = +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:forFloatingAssistantViewTransition:](UIInputViewSetPlacementInvisibleForFloatingTransition, "placementWithPlacement:forFloatingAssistantViewTransition:", v10, [v11 isFloatingAssistantView]);
    double v18 = [v12 animationStyle];
    if ([v11 showsInputOrAssistantViews])
    {
      if ([v11 isFloatingAssistantView])
      {
        uint64_t v19 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v11];
      }
      else
      {
        double v36 = [(UIInputWindowController *)self inputViewSet];
        uint64_t v37 = [v36 inputAccessoryView];

        if (v37) {
          +[UIInputViewSetPlacement placement];
        }
        else {
        uint64_t v19 = +[UIInputViewSetPlacement placement];
        }
      }
      id v23 = (id)v19;
      uint64_t v24 = +[UIInputViewAnimationStyle animationStyleImmediate];
      goto LABEL_56;
    }
    goto LABEL_30;
  }
  if ([v11 isFloatingAssistantView]
    && [v10 isVisible]
    && ([v10 isFloatingAssistantView] & 1) == 0)
  {
    if ([v10 accessoryViewWillAppear] && (objc_msgSend(v10, "showsKeyboard") & 1) == 0)
    {
      id v54 = +[UIInputViewSetPlacementInvisibleAssistantBar placementWithPlacement:v11];
      double v18 = +[UIInputViewAnimationStyle animationStyleImmediate];
      goto LABEL_53;
    }
    id v54 = +[UIInputViewSetPlacementOffScreenDownForFloatingAssistant placement];
    double v18 = [v12 animationStyle];
    id v23 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v11];
    uint64_t v24 = +[UIInputViewAnimationStyle animationStyleImmediate];
LABEL_56:
    id v32 = (id)v24;
    goto LABEL_57;
  }
  if (![v11 isVisible]
    || ![v10 isFloatingAssistantView]
    || ([v11 isFloatingAssistantView] & 1) != 0)
  {
    if ([v10 isFloatingAssistantView])
    {
      if ([v11 isFloatingAssistantView])
      {
        if (([v11 isInteractive] & 1) == 0)
        {
          double v20 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          CGFloat v21 = [v20 visualModeManager];
          int v22 = [v21 windowingModeEnabled];

          if (v22)
          {
            id v54 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v10];
            double v18 = [v12 animationStyle];
            id v23 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v11];
            uint64_t v24 = +[UIInputViewAnimationStyle animationStyleImmediate];
            goto LABEL_56;
          }
        }
      }
    }
LABEL_41:
    id v23 = 0;
    id v32 = 0;
    double v18 = 0;
    goto LABEL_42;
  }
  if ([v11 accessoryViewWillAppear])
  {
    if (([v11 showsKeyboard] & 1) == 0)
    {
      CGFloat v29 = [(UIInputWindowController *)self inputViewSet];
      CGFloat v30 = [v29 inputAccessoryView];
      BOOL v31 = v30 == 0;

      if (!v31)
      {
        double v15 = +[UIInputViewAnimationStyle animationStyleImmediate];
        [v12 setAnimationStyle:v15];
LABEL_40:

        goto LABEL_41;
      }
    }
  }
  id v54 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v10];
  double v18 = [v12 animationStyle];
  if (![v11 showsInputOrAssistantViews])
  {
LABEL_30:
    CGFloat v28 = +[UIInputViewAnimationStyle animationStyleImmediate];
    [v12 setAnimationStyle:v28];

LABEL_53:
    id v32 = 0;
    id v23 = 0;
    goto LABEL_57;
  }
  int v33 = [v11 accessoryViewWillAppear];
  int v34 = off_1E52D3B28;
  if (!v33) {
    int v34 = off_1E52D3B58;
  }
  id v23 = [(__objc2_class *)*v34 placement];
  uint64_t v35 = +[UIInputViewAnimationStyle animationStyleImmediate];

  id v32 = [v12 animationStyle];
  double v18 = (void *)v35;
LABEL_57:
  if (v54)
  {
    uint64_t v38 = _UIInputWindowControllerLogger();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v54;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_impl(&dword_1853B0000, v38, OS_LOG_TYPE_DEFAULT, "chainPlacementsIfNecessaryFrom, intermediate 1: %@, intermediate 2: %@", buf, 0x16u);
    }

    [(UIInputWindowController *)self setPlacementDuringAnimation:v54];
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v75) = 0;
    if (!+[UIKeyboard isInputSystemUI])
    {
      double v45 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v46 = [v45 visualModeManager];
      int v53 = [v46 shouldShowWithinAppWindow];

      if (v53)
      {
        id v47 = [(UIViewController *)self _window];
        char v48 = [v47 _isRemoteKeyboardWindow];

        if (v48) {
          goto LABEL_62;
        }
      }
      else
      {
        os_signpost_id_t v49 = [(UIViewController *)self _window];
        int v50 = [v49 _isRemoteKeyboardWindow];

        if (!v50) {
          goto LABEL_62;
        }
      }
    }
    dispatch_time_t v39 = +[UIKeyboardImpl activeInstance];
    [v39 setLockFloating:1];

    double v40 = +[UIKeyboardImpl activeInstance];
    [v40 setSuppressUpdateLayout:1];

    id v41 = +[UIKeyboardImpl activeInstance];
    [v41 setSuppressUpdateShiftState:1];

    *(unsigned char *)(*(void *)&buf[8] + 24) = 1;
LABEL_62:
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke;
    aBlock[3] = &unk_1E52E1B98;
    double v73 = buf;
    void aBlock[4] = self;
    id v42 = v10;
    id v72 = v42;
    id v52 = _Block_copy(aBlock);
    CGRect v43 = +[_UIWeakReference weakReferenceWrappingObject:self];
    v65[0] = MEMORY[0x1E4F143A8];
    v65[1] = 3221225472;
    v65[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_2;
    v65[3] = &unk_1E52DF078;
    id v66 = v43;
    id v51 = v54;
    id v67 = v51;
    id v68 = v42;
    id v69 = v11;
    BOOL v70 = self;
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_3;
    v56[3] = &unk_1E52FC038;
    id v57 = v12;
    id v55 = v52;
    id v63 = v55;
    uint64_t v58 = self;
    id v23 = v23;
    id v59 = v23;
    id v44 = v66;
    id v60 = v44;
    id v32 = v32;
    id v61 = v32;
    id v62 = v69;
    id v64 = v13;
    [v18 launchAnimation:v65 afterStarted:0 completion:v56 forHost:self fromCurrentPosition:0];

    _Block_object_dispose(buf, 8);
    goto LABEL_43;
  }
LABEL_42:
  v13[2](v13);
LABEL_43:
}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    id v2 = +[UIKeyboardImpl activeInstance];
    [v2 setLockFloating:0];

    uint64_t v3 = +[UIKeyboardImpl activeInstance];
    [v3 setSuppressUpdateLayout:0];

    uint64_t v4 = +[UIKeyboardImpl activeInstance];
    [v4 setSuppressUpdateShiftState:0];

    os_signpost_id_t v5 = +[UIKeyboardImpl activeInstance];
    [v5 updateLayout];

    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 updateShiftState];

    uint64_t v7 = +[UIKeyboardImpl activeInstance];
    [v7 generateCandidatesWithOptions:16];

    double v8 = [*(id *)(a1 + 32) placement];
    if ([v8 isFloatingAssistantView])
    {
    }
    else
    {
      char v9 = [*(id *)(a1 + 40) isFloatingAssistantView];

      if ((v9 & 1) == 0) {
        return;
      }
    }
    id v10 = *(void **)(*(void *)(a1 + 32) + 1040);
    [v10 initializeTranslateGestureRecognizerIfNecessary];
  }
}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [v2 _updatePlacementWithPlacement:*(void *)(a1 + 40)];
  [v2 updateToPlacement:*(void *)(a1 + 40) withNormalAnimationsAndNotifications:1];
  if ([*(id *)(a1 + 48) isFloatingAssistantView]
    && ([*(id *)(a1 + 56) showsInputOrAssistantViews] & 1) == 0)
  {
    [*(id *)(a1 + 64) updateOffscreenKeyboardLayoutGuide];
  }
}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_3(uint64_t a1)
{
  if ([*(id *)(a1 + 32) cancelled])
  {
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    id v2 = *(void **)(a1 + 40);
    [v2 setPlacementDuringAnimation:0];
  }
  else if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 40), "setPlacementDuringAnimation:");
    uint64_t v3 = [*(id *)(a1 + 56) object];
    if (v3)
    {
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_4;
      v10[3] = &unk_1E52D9F98;
      uint64_t v4 = *(void **)(a1 + 64);
      id v11 = *(id *)(a1 + 56);
      id v12 = *(id *)(a1 + 48);
      v6[0] = MEMORY[0x1E4F143A8];
      v6[1] = 3221225472;
      v6[2] = __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_5;
      v6[3] = &unk_1E52FC010;
      void v6[4] = *(void *)(a1 + 40);
      id v7 = *(id *)(a1 + 72);
      id v8 = *(id *)(a1 + 80);
      id v9 = *(id *)(a1 + 88);
      [v4 launchAnimation:v10 afterStarted:0 completion:v6 forHost:v3 fromCurrentPosition:0];
    }
    else
    {
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    }
  }
  else
  {
    [*(id *)(a1 + 40) setPlacementDuringAnimation:*(void *)(a1 + 72)];
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
    os_signpost_id_t v5 = *(void (**)(void))(*(void *)(a1 + 88) + 16);
    v5();
  }
}

void __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) object];
  [v2 _updatePlacementWithPlacement:*(void *)(a1 + 40)];
  [v2 updateToPlacement:*(void *)(a1 + 40) withNormalAnimationsAndNotifications:0];
}

uint64_t __92__UIInputWindowController_chainPlacementsIfNecessaryFrom_toPlacement_transition_completion___block_invoke_5(uint64_t a1)
{
  [*(id *)(a1 + 32) setPlacementDuringAnimation:*(void *)(a1 + 40)];
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);
  return v2();
}

- (void)syncToExistingAnimations
{
  id v7 = +[UIWindow _applicationKeyWindow];
  uint64_t v3 = [(UIViewController *)self view];
  id v4 = [v3 window];

  if (v7) {
    BOOL v5 = v4 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  BOOL v6 = v5 || v7 == v4;
  if (!v6 && [v7 _requiresKeyboardPresentationFence]) {
    +[UIWindow _synchronizeDrawing];
  }
}

- (id)viewForTransitionScreenSnapshot
{
  id v2 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
  uint64_t v3 = [v2 hostView];

  return v3;
}

- (CGRect)transitioningFrame
{
  id v2 = [(UIViewController *)self view];
  [v2 frame];
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

- (void)updateToPlacement:(id)a3 withNormalAnimationsAndNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke;
  aBlock[3] = &unk_1E52D9F98;
  void aBlock[4] = self;
  id v7 = v6;
  id v13 = v7;
  double v8 = (void (**)(void))_Block_copy(aBlock);
  double v9 = v8;
  if (v4)
  {
    v8[2](v8);
  }
  else
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke_3;
    v10[3] = &unk_1E52DA040;
    double v11 = v8;
    [(UIInputWindowController *)self performWithoutCallbacksOrNotifications:v10];
  }
}

void __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateVisibilityConstraintsForPlacement:*(void *)(a1 + 40)];
  id v2 = [*(id *)(a1 + 32) inputViewSet];
  if ([v2 isInputAccessoryViewPlaceholder])
  {

LABEL_5:
    id v9 = 0;
    double v5 = 0.0;
    char v6 = 1;
    goto LABEL_6;
  }
  double v3 = [*(id *)(a1 + 32) inputViewSet];
  id v9 = [v3 inputAccessoryView];

  if (!v9) {
    goto LABEL_5;
  }
  [v9 frame];
  double v5 = v4;
  char v6 = 0;
LABEL_6:
  *(unsigned char *)(*(void *)(a1 + 32) + 1026) = 1;
  id v7 = [*(id *)(a1 + 32) view];
  [v7 layoutIfNeeded];

  *(unsigned char *)(*(void *)(a1 + 32) + 1026) = 0;
  if ((v6 & 1) == 0)
  {
    [v9 frame];
    if (v5 != v8) {
      +[UIView performWithoutAnimation:&__block_literal_global_564_0];
    }
  }
}

void __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke_2()
{
  v0 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  id v1 = [v0 inputWindowRootViewController];

  [v1 checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:1 layoutSubviews:1];
}

uint64_t __82__UIInputWindowController_updateToPlacement_withNormalAnimationsAndNotifications___block_invoke_3(uint64_t a1)
{
  return +[UIView performWithoutAnimation:*(void *)(a1 + 32)];
}

- (BOOL)isInputViewsHidden
{
  return self->_hiddenCount > 0;
}

- (void)setKeyboardWindowSnapshotOn:(BOOL)a3
{
  if (self->_keyboardWindowSnapshotOn)
  {
    pendingCompleteAnimation = (void (**)(id, SEL))self->_pendingCompleteAnimation;
    if (pendingCompleteAnimation)
    {
      pendingCompleteAnimation[2](pendingCompleteAnimation, a2);
      id v6 = self->_pendingCompleteAnimation;
      self->_pendingCompleteAnimation = 0;
    }
  }
  self->_keyboardWindowSnapshotOn = a3;
}

- (void)setInputViewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  v14[1] = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard usesInputSystemUI])
  {
    double v5 = +[UIKeyboardImpl activeInstance];
    id v6 = [v5 remoteTextInputPartner];
    id v13 = @"hidden";
    id v7 = [NSNumber numberWithBool:v3];
    v14[0] = v7;
    double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
    [v6 forwardApplicationOperation:sel_setInputViewsHidden_ object:v8];
  }
  if (self->_inhibitingHiding)
  {
    int hiddenCount = self->_hiddenCount;
    if (v3) {
      int v10 = hiddenCount + 1;
    }
    else {
      int v10 = hiddenCount - 1;
    }
    self->_int hiddenCount = v10;
  }
  else
  {
    [(UIInputWindowControllerHosting *)self->_hosting removeAllAnimations];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __47__UIInputWindowController_setInputViewsHidden___block_invoke;
    v11[3] = &unk_1E52D9FC0;
    void v11[4] = self;
    BOOL v12 = v3;
    +[UIView performWithoutAnimation:v11];
  }
}

_DWORD *__47__UIInputWindowController_setInputViewsHidden___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 1004);
  int v4 = *(unsigned __int8 *)(a1 + 40);
  if (*(unsigned char *)(a1 + 40)) {
    int v5 = v3 + 1;
  }
  else {
    int v5 = v3 - 1;
  }
  *(_DWORD *)(v2 + 1004) = v5;
  CGRect result = *(_DWORD **)(a1 + 32);
  int v7 = result[251];
  if (v4) {
    BOOL v8 = v7 == 1;
  }
  else {
    BOOL v8 = 0;
  }
  if (v8)
  {
    id v9 = [result view];
    objc_msgSend(v9, "setOffsetOrigin:", 0.0, 4000.0);

    CGRect result = *(_DWORD **)(a1 + 32);
    int v7 = result[251];
  }
  if (v7)
  {
    if ((v7 & 0x80000000) == 0) {
      return result;
    }
    goto LABEL_12;
  }
  if (!*(unsigned char *)(a1 + 40))
  {
    int v10 = [result view];
    objc_msgSend(v10, "setOffsetOrigin:", 0.0, 0.0);

    CGRect result = *(_DWORD **)(a1 + 32);
    if ((result[251] & 0x80000000) != 0) {
LABEL_12:
    }
      result[251] = 0;
  }
  return result;
}

- (int)hiddenCount
{
  return self->_hiddenCount;
}

- (void)setHiddenCount:(int)a3
{
  if (a3) {
    int v5 = 4000;
  }
  else {
    int v5 = 0;
  }
  double v6 = (double)v5;
  int v7 = [(UIViewController *)self view];
  objc_msgSend(v7, "setOffsetOrigin:", 0.0, v6);

  self->_int hiddenCount = a3;
}

- (void)prepareForSplitTransition
{
  id v3 = [(UIInputWindowController *)self inputViewSet];
  [(UIInputWindowController *)self updateInputAssistantViewForInputViewSet:v3];
}

- (void)finishSplitTransition
{
  id v3 = [(UIInputWindowController *)self inputViewSet];
  [(UIInputWindowController *)self updateInputAssistantViewForInputViewSet:v3];
}

- (void)updateKeyboardLayoutGuideForRotationOrientation:(int64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v33 = [(UIInputWindowController *)self placementIgnoringRotation];
  if ([v33 isFloating]) {
    goto LABEL_4;
  }
  int v5 = [(UIInputWindowController *)self placement];
  if ([v5 isFloatingAssistantView])
  {

LABEL_4:
    double v6 = v33;
LABEL_5:

    return;
  }
  int v7 = [(UIInputWindowController *)self placement];
  int v8 = [v7 showsKeyboard];

  if (!v8) {
    return;
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v9 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    int v10 = [v9 currentUIState];

    if ([v10 assistantBarVisible]) {
      uint64_t v11 = 1;
    }
    else {
      uint64_t v11 = [v10 requiresHeightForIntegratedAssistantBar];
    }
    if ((unint64_t)(a3 - 3) >= 2) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = 4;
    }
    +[UIKeyboard sizeForInterfaceOrientation:v12 includingAssistantBar:v11 ignoreInputView:0];
    double v14 = v13;
    double v16 = v15;

    goto LABEL_21;
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    +[UIKeyboard sizeForInterfaceOrientation:a3 ignoreInputView:0];
    double v14 = v17;
    double v16 = v18;
LABEL_21:
    -[UIInputWindowController updateTrackingElementsWithSize:](self, "updateTrackingElementsWithSize:", v14, v16);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke;
    aBlock[3] = &__block_descriptor_48_e18_v16__0__UIWindow_8l;
    *(double *)&void aBlock[4] = v14;
    *(double *)&void aBlock[5] = v16;
    uint64_t v19 = _Block_copy(aBlock);
    double v20 = [(UIViewController *)self _window];
    int v21 = [v20 _isHostedInAnotherProcess];

    int v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    char v23 = [v22 hasActiveKeyboardResponder];

    if ((v23 & 1) != 0 || v21)
    {
      v39[0] = MEMORY[0x1E4F143A8];
      v39[1] = 3221225472;
      v39[2] = __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke_2;
      v39[3] = &unk_1E52FBEB0;
      id v40 = v19;
      +[UIWindow _enumerateWindowsIncludingInternalWindows:1 onlyVisibleWindows:1 allowMutation:0 withBlock:v39];
      double v26 = v40;
    }
    else
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      uint64_t v24 = [(UIViewController *)self _window];
      CGFloat v25 = [v24 windowScene];
      double v26 = [v25 windows];

      uint64_t v27 = [v26 countByEnumeratingWithState:&v35 objects:v42 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v36 != v29) {
              objc_enumerationMutation(v26);
            }
            (*((void (**)(void *, void))v19 + 2))(v19, *(void *)(*((void *)&v35 + 1) + 8 * i));
          }
          uint64_t v28 = [v26 countByEnumeratingWithState:&v35 objects:v42 count:16];
        }
        while (v28);
      }
    }

    return;
  }
  id v34 = [(UIViewController *)self _window];
  if ([v34 _isRemoteKeyboardWindow])
  {
    double v6 = v34;
    goto LABEL_5;
  }
  BOOL v31 = [(UIInputWindowController *)self inputViewSet];
  int v32 = [v31 isInputViewPlaceholder];

  if (v32)
  {
    [(UIInputWindowController *)self updateKeyboardLayoutGuideForRefreshedPlaceholder];
  }
}

void __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v9 = a2;
  if ([v9 isTrackingKeyboard])
  {
    double v3 = *(double *)(a1 + 32);
    double v4 = *(double *)(a1 + 40);
    [v9 insetForDismissedKeyboardGuide];
    if (v4 < v5)
    {
      [v9 insetForDismissedKeyboardGuide];
      double v4 = v6;
    }
    int v7 = [v9 _primaryKeyboardTrackingGuide];
    int v8 = objc_msgSend(v7, "changeSizingConstants:", v3, v4);

    if (v8) {
      [v9 layoutViewsForTrackedGuides];
    }
  }
}

uint64_t __75__UIInputWindowController_updateKeyboardLayoutGuideForRotationOrientation___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_getRotationContentSettings:(id *)a3
{
  a3->var6 = 0;
  a3->var4 = 1;
}

- (BOOL)_useLiveRotation
{
  uint64_t v2 = [(UIInputWindowController *)self inputViewSet];
  char v3 = [v2 isSplit] ^ 1;

  return v3;
}

- (void)willRotateToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  if (+[_UIRemoteKeyboards enabled] && !self->_rotationState)
  {
    self->_rotationState = 1;
    BOOL v7 = [(UIInputWindowController *)self shouldNotifyRemoteKeyboards];
    if (v7)
    {
      int v8 = +[UIInputViewSetNotificationInfo info];
    }
    else
    {
      int v8 = 0;
    }
    p_rotationInfo = &self->_rotationInfo;
    objc_storeStrong((id *)&self->_rotationInfo, v8);
    if (v7) {

    }
    if (*p_rotationInfo)
    {
      v86[0] = MEMORY[0x1E4F143A8];
      v86[1] = 3221225472;
      v86[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke;
      v86[3] = &unk_1E52D9F70;
      v86[4] = self;
      [(UIInputWindowController *)self performWithSafeTransitionFrames:v86];
      [(UIInputViewSetNotificationInfo *)*p_rotationInfo addKeyboardNotificationDebuggingInfo:@"willRotateToInterfaceOrientation: update _rotationInfo"];
      int v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      -[UIInputViewSetNotificationInfo setWasCausedRemotely:](*p_rotationInfo, "setWasCausedRemotely:", [v10 keyboardActive] ^ 1);
    }
    preRotationSnapshot = self->_preRotationSnapshot;
    if (preRotationSnapshot)
    {
      [(UIView *)preRotationSnapshot removeFromSuperview];
      uint64_t v12 = self->_preRotationSnapshot;
      self->_preRotationSnapshot = 0;
    }
    double v13 = [(UIInputWindowController *)self placement];
    if ([v13 showsKeyboard])
    {
    }
    else
    {
      double v14 = [(UIInputWindowController *)self placement];
      double v15 = +[UIInputViewSetPlacement placement];
      char v16 = [v14 isEqual:v15];

      if ((v16 & 1) == 0) {
        [(UIInputWindowController *)self updateGuideForOffscreenRotationWithDuration:a4];
      }
    }
    BOOL v17 = +[UIKeyboardImpl isFloating];
    hosting = self->_hosting;
    if (v17)
    {
      uint64_t v19 = [(UIInputWindowControllerHosting *)hosting itemForPurpose:2];
      double v20 = [v19 splitKeyboardController];
      [v20 cancelGestureRecognizers];
    }
    else
    {
      int v21 = [(UIInputWindowControllerHosting *)hosting itemForPurpose:1];
      int v22 = [v21 hostView];
      [v22 bounds];
      double v24 = v23;
      double v26 = v25;

      if (v24 > 0.0 && v26 > 0.0)
      {
        uint64_t v27 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
        uint64_t v28 = [v27 hostView];
        uint64_t v29 = [v28 snapshotViewAfterScreenUpdates:0];
        CGFloat v30 = self->_preRotationSnapshot;
        self->_preRotationSnapshot = v29;

        [(UIView *)self->_preRotationSnapshot setTranslatesAutoresizingMaskIntoConstraints:0];
        v85[0] = MEMORY[0x1E4F143A8];
        v85[1] = 3221225472;
        v85[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_2;
        v85[3] = &unk_1E52D9F70;
        v85[4] = self;
        +[UIView performWithoutAnimation:v85];
        BOOL v31 = [(UIInputWindowController *)self inputViewSet];
        LODWORD(v28) = [v31 isSplit];

        if (v28)
        {
          [(UIView *)self->_preRotationSnapshot bounds];
          if (v32 <= 0.0)
          {
            double v41 = 0.2;
            double v40 = 0.4;
          }
          else
          {
            double v33 = v32;
            id v34 = [(UIInputWindowController *)self inputViewSet];
            [v34 _rightInputViewSetFrame];
            double v36 = v35;

            long long v37 = [(UIInputWindowController *)self inputViewSet];
            [v37 _leftInputViewSetFrame];
            double v39 = v38;

            double v40 = v39 / v33;
            double v41 = (v33 - v39 - v36) / v33;
          }
          id v42 = [(UIView *)self->_preRotationSnapshot layer];
          objc_msgSend(v42, "setContentsCenter:", v40, 0.0, v41, 1.0);
        }
      }
      uint64_t v43 = [(UIInputWindowController *)self currentTransition];
      if (v43)
      {
        id v44 = (void *)v43;
        double v45 = [(UIInputWindowController *)self transientInputViewSet];

        if (v45)
        {
          double v46 = [(UIInputWindowController *)self transientInputViewSet];
          [(UIInputWindowController *)self changeToInputViewSet:v46];
        }
      }
      id v47 = [(UIInputWindowController *)self currentTransition];
      char v48 = [v47 toPlacement];
      if (v48)
      {
        [(UIInputWindowController *)self setPostRotationPlacement:v48];
      }
      else
      {
        os_signpost_id_t v49 = [(UIInputWindowController *)self placement];
        [(UIInputWindowController *)self setPostRotationPlacement:v49];
      }
      [(UIInputWindowController *)self setPostRotationPendingBlock:0];
      int v50 = +[UIInputViewAnimationStyle animationStyleImmediate];
      [(UIInputWindowController *)self pushAnimationStyle:v50];

      v84[0] = MEMORY[0x1E4F143A8];
      v84[1] = 3221225472;
      v84[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_3;
      v84[3] = &unk_1E52D9CD0;
      v84[4] = self;
      v84[5] = a3;
      [(UIInputWindowController *)self performWithoutAppearanceCallbacks:v84];
      if (self->_preRotationSnapshot)
      {
        id v51 = [(UIViewController *)self view];
        [v51 addSubview:self->_preRotationSnapshot];
      }
      id v52 = [(UIInputWindowController *)self _inputView];
      [v52 bounds];
      self->_preRotationInputViewSize.double width = v53;
      self->_preRotationInputViewSize.double height = v54;

      p_preRotationInputAssistantViewSize = &self->_preRotationInputAssistantViewSize;
      id v56 = [(UIInputWindowController *)self _inputAssistantView];
      if (v56)
      {
        id v57 = [(UIInputWindowController *)self _inputAssistantView];
        [v57 bounds];
        p_preRotationInputAssistantViewSize->double width = v58;
        self->_preRotationInputAssistantViewSize.double height = v59;
      }
      else
      {
        CGSize *p_preRotationInputAssistantViewSize = *(CGSize *)MEMORY[0x1E4F1DB30];
      }

      p_preRotationInputAccessoryViewSize = &self->_preRotationInputAccessoryViewSize;
      id v61 = [(UIInputWindowController *)self _inputAccessoryView];
      if (v61)
      {
        id v62 = [(UIInputWindowController *)self _inputAccessoryView];
        [v62 bounds];
        p_preRotationInputAccessoryViewSize->double width = v63;
        self->_preRotationInputAccessoryViewSize.double height = v64;
      }
      else
      {
        CGSize *p_preRotationInputAccessoryViewSize = *(CGSize *)MEMORY[0x1E4F1DB30];
      }

      id v65 = [(UIInputWindowController *)self _inputView];
      id v66 = v65;
      if (v65)
      {
        [v65 transform];
      }
      else
      {
        long long v82 = 0u;
        long long v83 = 0u;
        long long v81 = 0u;
      }
      *(_OWORD *)&self->_preRotationInputViewTransform.a = v81;
      *(_OWORD *)&self->_preRotationInputViewTransform.c = v82;
      *(_OWORD *)&self->_preRotationInputViewTransform.tdouble x = v83;

      p_preRotationInputAssistantViewTransform = &self->_preRotationInputAssistantViewTransform;
      id v68 = [(UIInputWindowController *)self _inputAssistantView];
      if (v68)
      {
        id v69 = [(UIInputWindowController *)self _inputAssistantView];
        BOOL v70 = v69;
        if (v69)
        {
          [v69 transform];
        }
        else
        {
          long long v82 = 0u;
          long long v83 = 0u;
          long long v81 = 0u;
        }
        *(_OWORD *)&p_preRotationInputAssistantViewTransform->a = v81;
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.c = v82;
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.tdouble x = v83;
      }
      else
      {
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.c = 0u;
        *(_OWORD *)&self->_preRotationInputAssistantViewTransform.tdouble x = 0u;
        *(_OWORD *)&p_preRotationInputAssistantViewTransform->a = 0u;
      }

      p_preRotationInputAccessoryViewTransform = &self->_preRotationInputAccessoryViewTransform;
      id v72 = [(UIInputWindowController *)self _inputAccessoryView];
      if (v72)
      {
        double v73 = [(UIInputWindowController *)self _inputAccessoryView];
        uint64_t v74 = v73;
        if (v73)
        {
          [v73 transform];
        }
        else
        {
          long long v82 = 0u;
          long long v83 = 0u;
          long long v81 = 0u;
        }
        *(_OWORD *)&p_preRotationInputAccessoryViewTransform->a = v81;
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.c = v82;
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.tdouble x = v83;
      }
      else
      {
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.c = 0u;
        *(_OWORD *)&self->_preRotationInputAccessoryViewTransform.tdouble x = 0u;
        *(_OWORD *)&p_preRotationInputAccessoryViewTransform->a = 0u;
      }

      id v75 = [(UIInputWindowController *)self _inputView];
      [v75 setAlpha:0.0];

      uint64_t v76 = [(UIInputWindowController *)self _inputView];
      id v77 = [v76 layer];
      [v77 setAllowsGroupOpacity:0];

      v78 = [(UIInputWindowController *)self _inputAssistantView];
      char v79 = [v78 layer];
      [v79 setAllowsGroupOpacity:0];

      char v80 = [(UIInputWindowController *)self _inputAccessoryView];
      [v80 setAlpha:0.0];

      uint64_t v19 = [(UIInputWindowController *)self _inputAssistantView];
      [v19 setAlpha:0.0];
    }
  }
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  char v3 = *(void **)(v2 + 1248);
  id v13 = [*(id *)(v2 + 1040) itemForPurpose:1];
  [v13 notificationsFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 32) view];
  +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v12, v5, v7, v9, v11);
  objc_msgSend(v3, "populateStartInfoWithFrame:");
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  char v3 = [v2 hostView];
  [v3 bounds];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "setBounds:");

  id v5 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  double v4 = [v5 hostView];
  [v4 center];
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1048), "setCenter:");
}

uint64_t __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_4;
  v3[3] = &unk_1E52D9CD0;
  uint64_t v1 = *(void *)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  v3[5] = v1;
  return +[UIView performWithoutAnimation:v3];
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = +[UIInputViewSetNotificationInfo info];
  [v2 setDueToRotation:1];
  [v2 setShouldSendInClient:1];
  char v3 = objc_msgSend(NSString, "stringWithFormat:", @"willRotateToInterfaceOrientation: %li", *(void *)(a1 + 40));
  [v2 addKeyboardNotificationDebuggingInfo:v3];

  double v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  objc_msgSend(v2, "setWasCausedRemotely:", objc_msgSend(v4, "keyboardActive") ^ 1);

  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_5;
  v6[3] = &unk_1E52D9F70;
  void v6[4] = v5;
  [v5 performOperations:v6 withTemplateNotificationInfo:v2];
}

void __69__UIInputWindowController_willRotateToInterfaceOrientation_duration___block_invoke_5(uint64_t a1)
{
  id v2 = +[UIInputViewSetPlacement placement];
  [*(id *)(a1 + 32) setPlacement:v2];
}

- (void)willAnimateRotationToInterfaceOrientation:(int64_t)a3 duration:(double)a4
{
  v41[1] = *MEMORY[0x1E4F143B8];
  if (self->_rotationState == 1)
  {
    self->_rotationState = 2;
    if (+[UIKeyboardImpl isFloating])
    {
      BOOL v7 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_2;
      v37[3] = &unk_1E52D9F70;
      v37[4] = self;
      +[UIView conditionallyAnimate:v7 withAnimation:&__block_literal_global_580 layout:v37 completion:0];
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v40 = @"UITextEffectsWindow_toOrientation";
      id v9 = [NSNumber numberWithInteger:a3];
      v41[0] = v9;
      id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v41 forKeys:&v40 count:1];
      [v8 postNotificationName:@"UITextEffectsWindowViewControllerWillRotateNotification" object:self userInfo:v10];
    }
    else
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_3;
      v36[3] = &unk_1E52D9F70;
      v36[4] = self;
      [(UIInputWindowController *)self performWithoutCallbacksOrNotifications:v36];
      double v11 = [(UIViewController *)self view];
      [v11 setNeedsUpdateConstraints];

      uint64_t v12 = [(UIInputWindowController *)self _inputView];
      id v13 = [(UIInputWindowController *)self _inputAssistantView];
      double v14 = [(UIInputWindowController *)self _inputAccessoryView];
      if ([(UIInputWindowController *)self _useLiveRotation])
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_5;
        v31[3] = &unk_1E52DD450;
        id v15 = v12;
        id v32 = v15;
        id v16 = v13;
        id v33 = v16;
        id v17 = v14;
        id v34 = v17;
        double v35 = self;
        +[UIView performWithoutAnimation:v31];
        [v15 setAlpha:1.0];
        [v16 setAlpha:1.0];
        [v17 setAlpha:1.0];
        [(UIView *)self->_preRotationSnapshot setAlpha:0.0];
      }
      double v18 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
      uint64_t v19 = [v18 hostView];
      [v19 bounds];
      -[UIView setBounds:](self->_preRotationSnapshot, "setBounds:");

      double v20 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
      int v21 = [v20 hostView];
      [v21 center];
      -[UIView setCenter:](self->_preRotationSnapshot, "setCenter:");

      BOOL v22 = +[UIView _isInAnimationBlockWithAnimationsEnabled];
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_7;
      v26[3] = &unk_1E52DAD48;
      v26[4] = self;
      id v27 = v12;
      id v28 = v13;
      id v29 = v14;
      int64_t v30 = a3;
      id v10 = v14;
      id v9 = v13;
      id v8 = v12;
      +[UIView conditionallyAnimate:v22 withAnimation:&__block_literal_global_585 layout:v26 completion:0];
      +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
      double v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
      double v38 = @"UITextEffectsWindow_toOrientation";
      double v24 = [NSNumber numberWithInteger:a3];
      double v39 = v24;
      double v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
      [v23 postNotificationName:@"UITextEffectsWindowViewControllerWillRotateNotification" object:self userInfo:v25];

      [(UIInputViewSetNotificationInfo *)self->_rotationInfo setDuration:a4];
      [(UIInputViewSetNotificationInfo *)self->_rotationInfo setForceNotification:1];
      [(UIInputViewSetNotificationInfo *)self->_rotationInfo setShouldSendInClient:1];
    }
  }
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0 delay:a2 options:a3 animations:0.0 completion:0.0];
}

void __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) placement];
  [*(id *)(a1 + 32) setPlacement:v2];
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_3(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_4;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

void __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) postRotationPlacement];
  [*(id *)(a1 + 32) setPlacement:v2];
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  [v2 removeAnimationForKey:@"bounds"];

  char v3 = [*(id *)(a1 + 40) layer];
  [v3 removeAnimationForKey:@"bounds"];

  double v4 = [*(id *)(a1 + 48) layer];
  [v4 removeAnimationForKey:@"bounds"];

  [*(id *)(a1 + 32) bounds];
  if (!CGRectIsEmpty(v45))
  {
    id v5 = (double *)(*(void *)(a1 + 56) + 1056);
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v7 = *v5;
    if (*MEMORY[0x1E4F1DB30] != *v5 || v6 != *(double *)(*(void *)(a1 + 56) + 1064))
    {
      id v9 = *(void **)(a1 + 32);
      if (v9)
      {
        objc_msgSend(v9, "transform", *MEMORY[0x1E4F1DB30], v6);
        double v7 = *(double *)(*(void *)(a1 + 56) + 1056);
        id v9 = *(void **)(a1 + 32);
      }
      else
      {
        memset(&v43, 0, sizeof(v43));
      }
      [v9 bounds];
      double v10 = *(double *)(*(void *)(a1 + 56) + 1064);
      CGFloat v12 = v7 / v11;
      [*(id *)(a1 + 32) bounds];
      CGAffineTransformScale(&v44, &v43, v12, v10 / v13);
      double v14 = *(void **)(a1 + 32);
      CGAffineTransform v42 = v44;
      [v14 setTransform:&v42];
    }
  }
  [*(id *)(a1 + 40) bounds];
  if (!CGRectIsEmpty(v46))
  {
    id v15 = (double *)(*(void *)(a1 + 56) + 1072);
    double v16 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v17 = *v15;
    if (*MEMORY[0x1E4F1DB30] != *v15 || v16 != *(double *)(*(void *)(a1 + 56) + 1080))
    {
      uint64_t v19 = *(void **)(a1 + 40);
      if (v19)
      {
        objc_msgSend(v19, "transform", *MEMORY[0x1E4F1DB30], v16);
        double v17 = *(double *)(*(void *)(a1 + 56) + 1072);
        uint64_t v19 = *(void **)(a1 + 40);
      }
      else
      {
        memset(&v40, 0, sizeof(v40));
      }
      [v19 bounds];
      double v20 = *(double *)(*(void *)(a1 + 56) + 1080);
      CGFloat v22 = v17 / v21;
      [*(id *)(a1 + 40) bounds];
      CGAffineTransformScale(&v41, &v40, v22, v20 / v23);
      double v24 = *(void **)(a1 + 40);
      CGAffineTransform v39 = v41;
      [v24 setTransform:&v39];
    }
  }
  [*(id *)(a1 + 48) bounds];
  uint64_t result = CGRectIsEmpty(v47);
  if ((result & 1) == 0)
  {
    double v26 = (double *)(*(void *)(a1 + 56) + 1088);
    double v27 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    double v28 = *v26;
    if (*MEMORY[0x1E4F1DB30] != *v26 || v27 != *(double *)(*(void *)(a1 + 56) + 1096))
    {
      int64_t v30 = *(void **)(a1 + 48);
      if (v30)
      {
        objc_msgSend(v30, "transform", *MEMORY[0x1E4F1DB30], v27);
        int64_t v30 = *(void **)(a1 + 48);
        double v28 = *(double *)(*(void *)(a1 + 56) + 1088);
      }
      else
      {
        memset(&v37, 0, sizeof(v37));
      }
      [v30 bounds];
      double v31 = *(double *)(*(void *)(a1 + 56) + 1096);
      CGFloat v33 = v28 / v32;
      [*(id *)(a1 + 48) bounds];
      CGAffineTransformScale(&v38, &v37, v33, v31 / v34);
      double v35 = *(void **)(a1 + 48);
      CGAffineTransform v36 = v38;
      return [v35 setTransform:&v36];
    }
  }
  return result;
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:0 delay:a2 options:a3 animations:0.0 completion:0.0];
}

uint64_t __78__UIInputWindowController_willAnimateRotationToInterfaceOrientation_duration___block_invoke_7(void *a1)
{
  id v2 = (_OWORD *)a1[4];
  memset(&t1, 0, sizeof(t1));
  long long v3 = v2[69];
  long long v4 = v2[71];
  *(_OWORD *)&t2.c = v2[70];
  *(_OWORD *)&t2.tdouble x = v4;
  *(_OWORD *)&t2.a = v3;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    id v5 = (void *)a1[5];
    long long v7 = v2[70];
    long long v6 = v2[71];
    v21[0] = v2[69];
    v21[1] = v7;
    v21[2] = v6;
    [v5 setTransform:v21];
    id v2 = (_OWORD *)a1[4];
  }
  memset(&t1, 0, sizeof(t1));
  long long v8 = v2[72];
  long long v9 = v2[74];
  *(_OWORD *)&t2.c = v2[73];
  *(_OWORD *)&t2.tdouble x = v9;
  *(_OWORD *)&t2.a = v8;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    double v10 = (void *)a1[6];
    long long v12 = v2[73];
    long long v11 = v2[74];
    v20[0] = v2[72];
    v20[1] = v12;
    v20[2] = v11;
    [v10 setTransform:v20];
    id v2 = (_OWORD *)a1[4];
  }
  memset(&t1, 0, sizeof(t1));
  long long v13 = v2[75];
  long long v14 = v2[77];
  *(_OWORD *)&t2.c = v2[76];
  *(_OWORD *)&t2.tdouble x = v14;
  *(_OWORD *)&t2.a = v13;
  if (!CGAffineTransformEqualToTransform(&t1, &t2))
  {
    id v15 = (void *)a1[7];
    long long v17 = v2[76];
    long long v16 = v2[77];
    v19[0] = v2[75];
    v19[1] = v17;
    v19[2] = v16;
    [v15 setTransform:v19];
    id v2 = (_OWORD *)a1[4];
  }
  return [v2 updateKeyboardLayoutGuideForRotationOrientation:a1[8]];
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  v54[1] = *MEMORY[0x1E4F143B8];
  if (self->_rotationState == 2)
  {
    self->_rotationState = 0;
    [(UIInputWindowController *)self _updateContentOverlayInsetsForSelfAndChildren];
    id v5 = [(UIInputWindowController *)self inputViewSet];
    long long v6 = [v5 inputView];
    [v6 setAlpha:1.0];

    long long v7 = [(UIInputWindowController *)self inputViewSet];
    long long v8 = [v7 inputView];
    long long v9 = [v8 layer];
    [v9 setAllowsGroupOpacity:1];

    double v10 = [(UIInputWindowController *)self inputViewSet];
    long long v11 = [v10 inputAssistantView];
    long long v12 = [v11 layer];
    [v12 setAllowsGroupOpacity:1];

    long long v13 = [(UIInputWindowController *)self inputViewSet];
    long long v14 = [v13 inputAssistantView];
    [v14 setAlpha:1.0];

    id v15 = [(UIInputWindowController *)self inputViewSet];
    long long v16 = [v15 inputAccessoryView];
    [v16 setAlpha:1.0];

    [(UIView *)self->_preRotationSnapshot removeFromSuperview];
    preRotationSnapshot = self->_preRotationSnapshot;
    self->_preRotationSnapshot = 0;

    double v18 = [(UIInputWindowController *)self postRotationPlacement];

    if (v18)
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke;
      v48[3] = &unk_1E52D9F70;
      v48[4] = self;
      [(UIInputWindowController *)self performWithoutCallbacksOrNotifications:v48];
      v47[0] = MEMORY[0x1E4F143A8];
      v47[1] = 3221225472;
      v47[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_3;
      v47[3] = &unk_1E52D9CD0;
      v47[4] = self;
      v47[5] = a3;
      [(UIInputWindowController *)self performWithoutAppearanceCallbacks:v47];
      [(UIInputWindowController *)self popAnimationStyle];
      uint64_t v19 = [(UIInputWindowController *)self postRotationInputViewSet];
      double v20 = [(UIInputWindowController *)self postRotationInputViewNotificationInfo];
      [v20 setDueToRotation:1];
      [v20 setShouldSendInClient:1];
      if (+[UIKeyboard usesInputSystemUI]) {
        [v20 setWaitingForInputUI:1];
      }
      [(UIInputWindowController *)self setPostRotationPlacement:0];
      [(UIInputWindowController *)self setPostRotationInputViewSet:0];
      [(UIInputWindowController *)self setPostRotationInputViewNotificationInfo:0];
      double v21 = [(UIInputWindowController *)self postRotationPendingBlock];

      if (v21)
      {

        CGFloat v22 = [NSString stringWithFormat:@"didRotateFromInterfaceOrientation: has postRotationPendingBlock"];
        [v20 addKeyboardNotificationDebuggingInfo:v22];

        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_6;
        v46[3] = &unk_1E52D9F70;
        void v46[4] = self;
        [(UIInputWindowController *)self performOperations:v46 withTemplateNotificationInfo:v20];
        uint64_t v19 = 0;
      }
      double v23 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
      double v24 = [(UIViewController *)self _window];
      [v23 completeMoveKeyboardForWindow:v24];

      if (v19)
      {
        double v25 = [NSString stringWithFormat:@"didRotateFromInterfaceOrientation: has pending inputViewSet"];
        [v20 addKeyboardNotificationDebuggingInfo:v25];

        v44[0] = MEMORY[0x1E4F143A8];
        v44[1] = 3221225472;
        v44[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_7;
        v44[3] = &unk_1E52D9F98;
        v44[4] = self;
        id v45 = v19;
        [(UIInputWindowController *)self performOperations:v44 withTemplateNotificationInfo:v20];
      }
      double v26 = [(UIInputWindowController *)self inputViewSet];
      if (![v26 isInputViewPlaceholder])
      {
        double v27 = +[UIKeyboardInputModeController sharedInputModeController];
        double v28 = [v27 currentInputMode];
        if ([v28 isExtensionInputMode])
        {
          id v29 = [(UIInputWindowController *)self _inputViewController];
          char v30 = objc_opt_respondsToSelector();

          if (v30)
          {
            double v31 = [(UIInputWindowController *)self _inputViewController];
            [v31 takeSnapshotView];

            [(UIInputWindowController *)self updateKeyboardLayoutGuideForRotationOrientation:[(UIViewController *)self interfaceOrientation]];
          }
          goto LABEL_21;
        }
      }
LABEL_21:
      CGAffineTransform v39 = +[UIKeyboardImpl activeInstance];
      CGAffineTransform v40 = [v39 remoteTextInputPartner];
      [v40 documentStateChanged];

      +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
      CGAffineTransform v41 = [MEMORY[0x1E4F28EB8] defaultCenter];
      os_signpost_id_t v49 = @"UITextEffectsWindow_fromOrientation";
      CGAffineTransform v42 = [NSNumber numberWithInteger:a3];
      int v50 = v42;
      CGAffineTransform v43 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v50 forKeys:&v49 count:1];
      [v41 postNotificationName:@"UITextEffectsWindowViewControllerDidRotateNotification" object:self userInfo:v43];

      return;
    }
    if (+[UIKeyboardImpl isFloating])
    {
      if (self->_isChangingPlacement)
      {
        double v32 = [(UIInputWindowController *)self placement];
        [(UIInputWindowController *)self updateVisibilityConstraintsForPlacement:v32];
      }
      CGFloat v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      CGFloat v53 = @"UITextEffectsWindow_fromOrientation";
      double v34 = [NSNumber numberWithInteger:a3];
      v54[0] = v34;
      double v35 = (void *)MEMORY[0x1E4F1C9E8];
      CGAffineTransform v36 = (void **)v54;
      CGAffineTransform v37 = &v53;
    }
    else
    {
      CGFloat v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
      id v51 = @"UITextEffectsWindow_fromOrientation";
      double v34 = [NSNumber numberWithInteger:a3];
      id v52 = v34;
      double v35 = (void *)MEMORY[0x1E4F1C9E8];
      CGAffineTransform v36 = &v52;
      CGAffineTransform v37 = &v51;
    }
    CGAffineTransform v38 = [v35 dictionaryWithObjects:v36 forKeys:v37 count:1];
    [v33 postNotificationName:@"UITextEffectsWindowViewControllerDidRotateNotification" object:self userInfo:v38];
  }
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_2;
  v2[3] = &unk_1E52D9F70;
  v2[4] = *(void *)(a1 + 32);
  return +[UIView performWithoutAnimation:v2];
}

void __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_2(uint64_t a1)
{
  id v2 = +[UIInputViewSetPlacement placement];
  [*(id *)(a1 + 32) setPlacement:v2];
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_3(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_4;
  v3[3] = &unk_1E52D9CD0;
  uint64_t v1 = *(void *)(a1 + 40);
  void v3[4] = *(void *)(a1 + 32);
  v3[5] = v1;
  return +[UIView performWithoutAnimation:v3];
}

void __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_4(uint64_t a1)
{
  id v2 = +[UIInputViewSetNotificationInfo info];
  [v2 setDueToRotation:1];
  long long v3 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  objc_msgSend(v2, "setWasCausedRemotely:", objc_msgSend(v3, "keyboardActive") ^ 1);

  [v2 setShouldSendInClient:1];
  long long v4 = objc_msgSend(NSString, "stringWithFormat:", @"didRotateFromInterfaceOrientation: %li", *(void *)(a1 + 40));
  [v2 addKeyboardNotificationDebuggingInfo:v4];

  id v5 = *(void **)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_5;
  v6[3] = &unk_1E52D9F70;
  void v6[4] = v5;
  [v5 performOperations:v6 withTemplateNotificationInfo:v2];
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_5(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inputViewSet];
  if ([v2 isInputViewPlaceholder])
  {
    long long v3 = [*(id *)(a1 + 32) inputViewSet];
    long long v4 = [v3 inputView];
    [v4 frame];
    double v6 = v5;

    if (v6 == 0.0) {
      [*(id *)(a1 + 32) checkPlaceholdersForRemoteKeyboardsAndForceConstraintsUpdate:0 layoutSubviews:1];
    }
  }
  else
  {
  }
  long long v7 = [*(id *)(a1 + 32) postRotationPlacement];
  [*(id *)(a1 + 32) setPlacement:v7];

  long long v8 = *(void **)(*(void *)(a1 + 32) + 1040);
  return [v8 initializeTranslateGestureRecognizerIfNecessary];
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_6(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) postRotationPendingBlock];
  v2[2]();

  long long v3 = *(void **)(a1 + 32);
  return [v3 setPostRotationPendingBlock:0];
}

uint64_t __61__UIInputWindowController_didRotateFromInterfaceOrientation___block_invoke_7(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInputViewSet:*(void *)(a1 + 40)];
}

- (void)clearRotationState
{
  unint64_t rotationState = self->_rotationState;
  if (rotationState == 1)
  {
    [(UIInputWindowController *)self willAnimateRotationToInterfaceOrientation:+[UIKeyboardSceneDelegate interfaceOrientation] duration:0.0];
    unint64_t rotationState = self->_rotationState;
  }
  if (rotationState == 2) {
    [(UIInputWindowController *)self didRotateFromInterfaceOrientation:+[UIKeyboardSceneDelegate interfaceOrientation]];
  }
  hosting = self->_hosting;
  [(UIInputWindowControllerHosting *)hosting removeAllAnimations];
}

- (UIInputViewSetPlacement)placementIgnoringRotation
{
  if ([(UIInputWindowController *)self isRotating]) {
    [(UIInputWindowController *)self postRotationPlacement];
  }
  else {
  long long v3 = [(UIInputWindowController *)self placement];
  }
  return (UIInputViewSetPlacement *)v3;
}

- (CGSize)sizeForInputViewController:(id)a3 inputView:(id)a4 includeAssistantBar:(BOOL)a5
{
  +[UIKeyboard sizeForInterfaceOrientation:[(UIInputWindowController *)self keyboardOrientation] includingAssistantBar:a5 ignoreInputView:1];
  double v7 = v6;
  double v9 = v8;
  [(UIInputWindowController *)self _inputViewPadding];
  double v12 = v9 + v11 + v10;
  double v13 = v7;
  result.double height = v12;
  result.double width = v13;
  return result;
}

- (CGSize)sizeForInputViewController:(id)a3 inputView:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = ([v6 _autosizeToCurrentKeyboard] & 1) != 0
    || (dyld_program_sdk_at_least() & 1) != 0
    || SubviewAutoSizesWithPredictionBar(v7);
  [(UIInputWindowController *)self sizeForInputViewController:v6 inputView:v7 includeAssistantBar:v8];
  double v10 = v9;
  double v12 = v11;

  double v13 = v10;
  double v14 = v12;
  result.double height = v14;
  result.double width = v13;
  return result;
}

- (BOOL)isHostingView:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  double v5 = [(UIInputWindowControllerHosting *)self->_hosting allHostingItems];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        double v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) hostView];
        char v10 = [v4 isEqual:v9];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  id v4 = [(UIInputViewSet *)self->_inputViewSet _splittableInputAccessoryView];
  double v5 = [(UIInputViewSet *)self->_inputViewSet inputAccessoryView];

  if (v5)
  {
    if (v4)
    {
      [v4 leftContentViewSize];
      if (v6 == 0.0) {
        unint64_t v7 = 14;
      }
      else {
        unint64_t v7 = 12;
      }
      [v4 rightContentViewSize];
      if (v8 == 0.0) {
        v7 |= 1uLL;
      }
    }
    else
    {
      unint64_t v7 = 12;
    }
  }
  else
  {
    unint64_t v7 = 15;
  }

  return v7;
}

- (void)postTransitionEndNotification
{
  if ([(UIInputWindowController *)self shouldNotifyRemoteKeyboards])
  {
    long long v3 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:2];
    [v3 notificationsFrame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    id v17 = [(UIInputWindowController *)self initialNotificationInfo];
    if ([(UIInputWindowController *)self isOnScreen])
    {
      long long v12 = [(UIViewController *)self view];
      [v12 size];
      double v14 = v13 - v11;

      long long v15 = @"postTransitionEndNotification (isOnScreen)";
      uint64_t v16 = 2;
    }
    else
    {
      double v14 = v7 + v11;
      long long v15 = @"postTransitionEndNotification (!isOnScreen)";
      uint64_t v16 = 3;
    }
    -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v5, v14, v9, v11);
    objc_msgSend(v17, "populateEndInfoWithFrame:");
    [v17 addKeyboardNotificationDebuggingInfo:v15];
    [(UIInputWindowController *)self postStartNotifications:v16 withInfo:v17];
    [(UIInputWindowController *)self postEndNotifications:v16 withInfo:v17];
  }
}

- (void)generateNotificationsForStart:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIInputWindowController *)self shouldNotifyRemoteKeyboards])
  {
    double v5 = [(UIInputWindowController *)self initialNotificationInfo];
    if (v3)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__UIInputWindowController_generateNotificationsForStart___block_invoke;
      v17[3] = &unk_1E52D9F98;
      v17[4] = self;
      id v18 = v5;
      id v6 = v5;
      [(UIInputWindowController *)self performWithSafeTransitionFrames:v17];
    }
    else
    {
      id v16 = v5;
      double v7 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
      [v7 notificationsFrame];
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      double v15 = v14;

      -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v9, v11, v13, v15);
      objc_msgSend(v16, "populateEndInfoWithFrame:");
      [v16 addKeyboardNotificationDebuggingInfo:@"generateNotificationsForStart:0"];
      [(UIInputWindowController *)self postEndNotifications:1 withInfo:v16];
    }
  }
}

uint64_t __57__UIInputWindowController_generateNotificationsForStart___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:1];
  [v2 notificationsFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  objc_msgSend(*(id *)(a1 + 32), "convertRectFromContainerCoordinateSpaceToScreenSpace:", v4, v6, v8, v10);
  objc_msgSend(*(id *)(a1 + 40), "populateStartInfoWithFrame:");
  [*(id *)(a1 + 40) addKeyboardNotificationDebuggingInfo:@"generateNotificationsForStart:1"];
  double v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(void *)(a1 + 40);
  return [v11 postStartNotifications:1 withInfo:v12];
}

- (void)generateNotificationsForCompactAssistantFlickGestureCompletion:(id)a3
{
  id v4 = a3;
  double v21 = objc_alloc_init(UIInputViewSetNotificationInfo);
  double v5 = [v4 objectForKeyedSubscript:0x1ED149F00];
  [v5 CGRectValue];
  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:");
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;

  double v14 = [v4 objectForKeyedSubscript:0x1ED149F20];

  -[UIInputViewSetNotificationInfo setAssistantPosition:](v21, "setAssistantPosition:", (int)[v14 intValue]);
  -[UIInputViewSetNotificationInfo setAssistantFrame:](v21, "setAssistantFrame:", v7, v9, v11, v13);
  [(UIInputViewSetNotificationInfo *)v21 setForceNotification:1];
  double v15 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v16 = [v15 visualModeManager];
  unsigned int v17 = [v16 windowingModeEnabled];

  if (v17)
  {
    id v18 = [(UIInputWindowController *)self inputViewSet];
    uint64_t v19 = [v18 inputAccessoryView];

    if (!v19)
    {
      -[UIInputViewSetNotificationInfo populateStartInfoWithFrame:](v21, "populateStartInfoWithFrame:", v7, v9, v11, v13);
      -[UIInputViewSetNotificationInfo populateEndInfoWithFrame:](v21, "populateEndInfoWithFrame:", v7, v9, v11, v13);
    }
  }
  double v20 = objc_msgSend(NSString, "stringWithFormat:", @"generateNotificationsForCompactAssistantFlickGestureCompletion (stageManager active: %d)", v17);
  [(UIInputViewSetNotificationInfo *)v21 addKeyboardNotificationDebuggingInfo:v20];

  [(UIInputWindowController *)self postStartNotifications:2 withInfo:v21];
  [(UIInputWindowController *)self postEndNotifications:2 withInfo:v21];
}

- (void)setPlacement:(id)a3 quietly:(BOOL)a4 animated:(BOOL)a5 generateSplitNotification:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  double v11 = [(UIViewController *)self _window];

  if (v11)
  {
    if (a5)
    {
      if (v8)
      {
        [(UIInputWindowController *)self _updatePlacementWithPlacement:v10];
        [(UIInputWindowController *)self updateToPlacement:v10 withNormalAnimationsAndNotifications:0];
        if (!v6) {
          goto LABEL_9;
        }
        goto LABEL_8;
      }
      [(UIInputWindowController *)self setPlacement:v10];
      if (v6) {
LABEL_8:
      }
        [(UIInputWindowController *)self postTransitionEndNotification];
    }
    else
    {
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      void v12[2] = __83__UIInputWindowController_setPlacement_quietly_animated_generateSplitNotification___block_invoke;
      v12[3] = &unk_1E52DD128;
      v12[4] = self;
      id v13 = v10;
      BOOL v14 = v8;
      BOOL v15 = v6;
      +[UIView performWithoutAnimation:v12];
    }
  }
LABEL_9:
}

uint64_t __83__UIInputWindowController_setPlacement_quietly_animated_generateSplitNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlacement:*(void *)(a1 + 40) quietly:*(unsigned __int8 *)(a1 + 48) animated:1 generateSplitNotification:*(unsigned __int8 *)(a1 + 49)];
}

uint64_t __59__UIInputWindowController_updateKeyboardDockViewVisibility__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateKeyboardDockViewVisibility];
}

- (void)invalidateInputView
{
  double v3 = [(UIInputWindowController *)self _inputViewController];
  id v4 = [v3 view];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__UIInputWindowController_invalidateInputView__block_invoke;
  v5[3] = &unk_1E52D9F70;
  void v5[4] = self;
  [v4 _preserveResponderOverridesWhilePerforming:v5];
}

uint64_t __46__UIInputWindowController_invalidateInputView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _existingView];
  double v3 = [*(id *)(a1 + 32) _inputViewController];
  id v4 = [v3 view];
  double v5 = [v4 superview];
  int v6 = [v2 containsView:v5];

  if (v6)
  {
    double v7 = [*(id *)(a1 + 32) _inputViewController];
    BOOL v8 = [v7 view];
    [v8 removeFromSuperview];

    [*(id *)(*(void *)(a1 + 32) + 1040) clearInputViewEdgeConstraints];
    [*(id *)(*(void *)(a1 + 32) + 1040) resetInputViewVisibility];
  }
  double v9 = [*(id *)(a1 + 32) _inputViewController];
  id v10 = [v9 parentViewController];
  double v11 = *(void **)(a1 + 32);

  if (v10 == v11)
  {
    double v12 = [*(id *)(a1 + 32) _inputViewController];
    [v12 removeFromParentViewController];
  }
  id v13 = *(void **)(a1 + 32);
  return objc_msgSend(v13, "set_inputViewController:", 0);
}

- (void)validateInputView
{
  double v3 = [(UIInputWindowController *)self _inputViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(UIInputWindowController *)self _inputViewController];
    [v5 validateInputModeIsDisplayed];
  }
}

uint64_t __55__UIInputWindowController_invalidateInputAssistantView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _existingView];
  double v3 = [*(id *)(a1 + 32) _inputAssistantViewController];
  id v4 = [v3 view];
  id v5 = [v4 superview];
  if ([v2 containsView:v5])
  {
  }
  else
  {
    BOOL v6 = +[UIKeyboard usesLocalKeyboard];

    if (!v6) {
      goto LABEL_5;
    }
  }
  double v7 = [*(id *)(a1 + 32) _inputAssistantViewController];
  BOOL v8 = [v7 view];
  [v8 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 1040) removeInputAssistantHostView];
  [*(id *)(*(void *)(a1 + 32) + 1040) clearInputAssistantViewEdgeConstraints];
  [*(id *)(*(void *)(a1 + 32) + 1040) clearInputAccessoryViewEdgeConstraints];
  [*(id *)(*(void *)(a1 + 32) + 1040) clearInputViewEdgeConstraints];
LABEL_5:
  double v9 = [*(id *)(a1 + 32) _inputAssistantViewController];
  id v10 = [v9 parentViewController];
  double v11 = *(void **)(a1 + 32);

  if (v10 == v11)
  {
    double v12 = [*(id *)(a1 + 32) _inputAssistantViewController];
    [v12 removeFromParentViewController];
  }
  id v13 = *(void **)(a1 + 32);
  return objc_msgSend(v13, "set_inputAssistantViewController:", 0);
}

- (void)invalidateInputAccessoryView
{
  double v3 = [(UIInputWindowController *)self _inputAccessoryViewController];
  id v4 = [v3 view];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__UIInputWindowController_invalidateInputAccessoryView__block_invoke;
  v5[3] = &unk_1E52D9F70;
  void v5[4] = self;
  [v4 _preserveResponderOverridesWhilePerforming:v5];
}

uint64_t __55__UIInputWindowController_invalidateInputAccessoryView__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _existingView];
  double v3 = [*(id *)(a1 + 32) _inputAccessoryViewController];
  id v4 = [v3 view];
  if ([v2 containsView:v4])
  {
  }
  else
  {
    BOOL v5 = +[UIKeyboard usesLocalKeyboard];

    if (!v5) {
      goto LABEL_5;
    }
  }
  BOOL v6 = [*(id *)(a1 + 32) _inputAccessoryViewController];
  double v7 = [v6 view];
  [v7 removeFromSuperview];

  [*(id *)(*(void *)(a1 + 32) + 1040) clearInputAccessoryViewEdgeConstraints];
LABEL_5:
  BOOL v8 = [*(id *)(a1 + 32) _inputAccessoryViewController];
  double v9 = [v8 parentViewController];
  id v10 = *(void **)(a1 + 32);

  if (v9 == v10)
  {
    double v11 = [*(id *)(a1 + 32) _inputAccessoryViewController];
    [v11 removeFromParentViewController];
  }
  double v12 = *(void **)(a1 + 32);
  id v13 = [v12 _inputAccessoryViewController];
  BOOL v14 = [v12 overrideTraitCollectionForChildViewController:v13];

  if (v14)
  {
    BOOL v15 = *(void **)(a1 + 32);
    id v16 = [v15 _inputAccessoryViewController];
    [v15 setOverrideTraitCollection:0 forChildViewController:v16];
  }
  unsigned int v17 = *(void **)(a1 + 32);
  return objc_msgSend(v17, "set_inputAccessoryViewController:", 0);
}

- (void)updateBackdropRenderConfig:(id)a3
{
  hosting = self->_hosting;
  id v4 = a3;
  id v5 = [(UIInputWindowControllerHosting *)hosting itemForPurpose:100];
  [v5 updateRenderConfigForCombinedBackdrop:v4];
}

uint64_t __48__UIInputWindowController_changeToInputViewSet___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1424) inputAccessoryView];
  if (v2)
  {
    double v3 = (void *)v2;
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1424) inputAccessoryView];
    id v5 = [v4 superview];

    if (!v5) {
      return 1;
    }
  }
  uint64_t v6 = *(void *)(a1 + 40);
  double v7 = *(void **)(*(void *)(a1 + 32) + 1424);
  return [v7 isEqual:v6];
}

void __48__UIInputWindowController_changeToInputViewSet___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:100];
  [v1 updateInputBackdropView];
}

void __48__UIInputWindowController_changeToInputViewSet___block_invoke_3(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:101];
  [v1 updateInputAccessoryBackdropView];
}

void __48__UIInputWindowController_changeToInputViewSet___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1040) itemForPurpose:101];
  [v1 updateInputAccessoryBackdropView];
}

- (id)currentPresentationPlacement
{
  double v3 = [(UIInputWindowController *)self currentTransition];
  unsigned int v4 = [v3 animationState];

  if (v4 < 3)
  {
    uint64_t v6 = [(UIInputWindowController *)self currentTransition];
    id v5 = [v6 fromPlacement];

    if (!v5 || [v5 showsInputViews])
    {
      uint64_t v7 = [(UIInputWindowController *)self placement];

      id v5 = (void *)v7;
    }
  }
  else
  {
    id v5 = [(UIInputWindowController *)self placement];
  }
  return v5;
}

void __43__UIInputWindowController_setInputViewSet___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) changeToInputViewSet:*(void *)(a1 + 40)];
  id v2 = *(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v3 = [*(id *)(a1 + 32) currentPresentationPlacement];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (([*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) isEqual:*(void *)(a1 + 48)] & 1) == 0) {
    [*(id *)(a1 + 32) _updatePlacementWithPlacement:*(void *)(a1 + 48)];
  }
  uint64_t v6 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_2;
  v7[3] = &unk_1E52D9F70;
  v7[4] = v6;
  [v6 ignoreLayoutNotifications:v7];
  [*(id *)(*(void *)(a1 + 32) + 1040) _updateBackdropViews];
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _window];
  [v1 layoutIfNeeded];
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained changeToInputViewSet:*(void *)(a1 + 32)];
  if ([*(id *)(a1 + 32) isNullInputView])
  {
    id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    uint64_t v3 = [WeakRetained _window];
    [v2 completeMoveKeyboardForWindow:v3];
  }
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained changeToInputViewSet:*(void *)(a1 + 32)];
  }
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_5(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = WeakRetained;
  if (*(unsigned char *)(a1 + 48)) {
    [WeakRetained[130] initializeTranslateGestureRecognizerIfNecessary];
  }
  else {
    [WeakRetained changeToInputViewSet:*(void *)(a1 + 32)];
  }
  [v3[130] updateEmptyHeightConstraint];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_6;
  v4[3] = &unk_1E52D9F70;
  void v4[4] = v3;
  +[UIView performWithoutAnimation:v4];
}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_6(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1040) _updateBackdropViews];
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_7(id *a1)
{
  id v2 = a1 + 7;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v4 = a1[4];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_8;
  v7[3] = &unk_1E52DF708;
  objc_copyWeak(&v10, v2);
  id v8 = a1[5];
  id v9 = a1[6];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_10;
  v5[3] = &unk_1E52D9F70;
  id v6 = a1[4];
  [WeakRetained setPlacement:v4 starting:v7 completion:v5];

  objc_destroyWeak(&v10);
}

void __43__UIInputWindowController_setInputViewSet___block_invoke_8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 40), "setChangedAccessoryOnly:", objc_msgSend(WeakRetained, "changeToInputViewSet:", *(void *)(a1 + 32)) == 4);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__UIInputWindowController_setInputViewSet___block_invoke_9;
  v3[3] = &unk_1E52D9F98;
  id v4 = *(id *)(a1 + 40);
  id v5 = WeakRetained;
  +[UIView performWithoutAnimation:v3];
}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_9(uint64_t a1)
{
  if ([*(id *)(a1 + 32) changedAccessoryOnly])
  {
    id v2 = [*(id *)(a1 + 40) view];
    [v2 layoutIfNeeded];
  }
  uint64_t v3 = *(void **)(*(void *)(a1 + 40) + 1040);
  return [v3 _updateBackdropViews];
}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_10(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isFloating];
  if ((result & 1) == 0)
  {
    return +[UIView performWithoutAnimation:&__block_literal_global_625];
  }
  return result;
}

uint64_t __43__UIInputWindowController_setInputViewSet___block_invoke_11()
{
  return +[UIAssistantBarButtonItemProvider updateFloatingAssistantBarIfNeeded];
}

- (void)setPlacement:(id)a3 starting:(id)a4 completion:(id)a5
{
}

- (void)setPlacement:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__UIInputWindowController_setPlacement___block_invoke;
  v5[3] = &unk_1E52DC308;
  objc_copyWeak(&v6, &location);
  [(UIInputWindowController *)self setPlacement:v4 starting:v5 completion:0];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __40__UIInputWindowController_setPlacement___block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = [WeakRetained[130] allHostingItems];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __40__UIInputWindowController_setPlacement___block_invoke_2;
  v4[3] = &unk_1E52FC0D0;
  objc_copyWeak(&v5, v1);
  [v3 enumerateObjectsUsingBlock:v4];

  objc_destroyWeak(&v5);
}

void __40__UIInputWindowController_setPlacement___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 dockView];

  if (v3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained updateViewConstraints];
    [WeakRetained updateKeyboardDockViewVisibility];
  }
}

- (void)setPlacement:(id)a3 completion:(id)a4
{
}

- (void)setRotationAwarePlacement:(id)a3
{
  id v5 = a3;
  id v4 = [(UIInputWindowController *)self postRotationPlacement];

  if (v4) {
    [(UIInputWindowController *)self setPostRotationPlacement:v5];
  }
  else {
    [(UIInputWindowController *)self setPlacement:v5];
  }
}

- (void)setInputView:(id)a3 accessoryView:(id)a4 assistantView:(id)a5
{
  id v6 = +[UIInputViewSet inputSetWithInputView:a3 accessoryView:a4 assistantView:a5];
  [(UIInputWindowController *)self setInputViewSet:v6];
}

- (id)inputViewSnapshotOfView:(id)a3 afterScreenUpdates:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(UIViewController *)self view];
  [v6 bounds];
  objc_msgSend(v7, "convertRect:fromView:", v6);
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;

  id v16 = [(UIViewController *)self view];
  unsigned int v17 = objc_msgSend(v16, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", v4, v9, v11, v13, v15, 0.0, 0.0, 0.0, 0.0);

  [v17 setUserInteractionEnabled:0];
  id v18 = [(UIViewController *)self view];
  uint64_t v19 = [v18 window];
  double v20 = [v19 screen];
  [v20 scale];
  objc_msgSend(v17, "setContentScaleFactor:");

  return v17;
}

- (id)screenSnapshotOfView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIViewController *)self view];
  id v6 = [v5 window];
  uint64_t v7 = [v6 screen];
  double v8 = [v7 snapshotViewAfterScreenUpdates:0];

  double v9 = [(UIViewController *)self view];
  double v10 = [v9 window];
  [v4 bounds];
  objc_msgSend(v10, "convertRect:fromView:", v4);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;

  uint64_t v19 = [(UIViewController *)self view];
  double v20 = [v19 window];
  objc_msgSend(v20, "convertRect:toWindow:", 0, v12, v14, v16, v18);
  double v22 = v21;
  double v24 = v23;
  double v26 = v25;
  double v28 = v27;

  id v29 = objc_msgSend(v8, "resizableSnapshotViewFromRect:afterScreenUpdates:withCapInsets:", 0, v22, v24, v26, v28, 0.0, 0.0, 0.0, 0.0);
  [v29 setUserInteractionEnabled:0];
  char v30 = [(UIViewController *)self view];
  double v31 = [v30 window];
  double v32 = [v31 screen];
  [v32 scale];
  objc_msgSend(v29, "setContentScaleFactor:");

  return v29;
}

- (CGRect)_visibleInputViewFrame
{
  uint64_t v3 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:1];
  [v3 fullInputViewAndAssistantFrame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIInputWindowController convertRectFromContainerCoordinateSpaceToScreenSpace:](self, "convertRectFromContainerCoordinateSpaceToScreenSpace:", v5, v7, v9, v11);
  CGFloat v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v20 = [(UIViewController *)self view];
  double v21 = [v20 window];
  double v22 = [v21 screen];
  [v22 bounds];
  CGFloat v24 = v23;
  CGFloat v26 = v25;
  CGFloat width = v27;
  CGFloat y = v29;

  v33.origin.double x = v13;
  v33.origin.CGFloat y = v15;
  v33.size.CGFloat width = v17;
  v33.size.double height = v19;
  v36.origin.double x = v24;
  v36.origin.CGFloat y = v26;
  v36.size.CGFloat width = width;
  v36.size.double height = y;
  if (CGRectIntersectsRect(v33, v36))
  {
    v34.origin.double x = v13;
    v34.origin.CGFloat y = v15;
    v34.size.CGFloat width = v17;
    v34.size.double height = v19;
    v37.origin.double x = v24;
    v37.origin.CGFloat y = v26;
    v37.size.CGFloat width = width;
    v37.size.double height = y;
    CGRect result = CGRectIntersection(v34, v37);
    CGFloat y = result.origin.y;
    CGFloat width = result.size.width;
  }
  else
  {
    result.origin.double x = 0.0;
    result.size.double height = 0.0;
  }
  double v31 = y;
  double v32 = width;
  result.size.CGFloat width = v32;
  result.origin.CGFloat y = v31;
  return result;
}

- (CGRect)visibleInputViewFrame
{
  uint64_t v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v4 = [v3 containerRootController];

  if (v4 == self)
  {
    [(UIInputWindowController *)self _visibleInputViewFrame];
    double v8 = v15;
    double v10 = v16;
    double v12 = v17;
    double v14 = v18;
  }
  else
  {
    double v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v6 = [v5 containerRootController];
    [v6 _visibleInputViewFrame];
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
  }
  double v19 = v8;
  double v20 = v10;
  double v21 = v12;
  double v22 = v14;
  result.size.double height = v22;
  result.size.CGFloat width = v21;
  result.origin.CGFloat y = v20;
  result.origin.double x = v19;
  return result;
}

- (BOOL)inputViewSetContainsView:(id)a3
{
  id v4 = a3;
  double v5 = [(UIInputWindowController *)self inputViewSet];
  char v6 = [v5 hierarchyContainsView:v4];

  return v6;
}

- (BOOL)hasInputOrAssistantViewsOnScreen
{
  uint64_t v3 = [(UIInputWindowController *)self inputViewSet];
  id v4 = [v3 inputView];
  [v4 bounds];
  if (v5 <= 0.0)
  {

    char v8 = 0;
LABEL_6:

    return v8;
  }
  char v6 = [(UIInputWindowController *)self inputViewSet];
  char v7 = [v6 isLocalMinimumHeightInputView];

  if ((v7 & 1) == 0)
  {
    uint64_t v3 = [(UIInputWindowController *)self placement];
    char v8 = [v3 showsInputOrAssistantViews];
    goto LABEL_6;
  }
  return 0;
}

- (BOOL)isChangingPlacement
{
  return self->_isChangingPlacement;
}

- (BOOL)isSplitting
{
  id v2 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:2];
  uint64_t v3 = [v2 splitKeyboardController];
  char v4 = [v3 isSplitting];

  return v4;
}

- (void)animateAccessoryViewVisibility:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  char v7 = [(UIInputWindowController *)self _inputAccessoryView];
  char v8 = v7;
  if (v7)
  {
    if (v5) {
      double v9 = 1.0;
    }
    else {
      double v9 = 0.0;
    }
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke;
    v10[3] = &unk_1E52DA070;
    double v13 = v9;
    id v11 = v7;
    double v12 = self;
    +[UIView animateWithDuration:50331648 delay:v10 options:0 animations:a4 completion:0.0];
  }
}

uint64_t __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setAlpha:*(double *)(a1 + 48)];
  id v2 = *(void **)(*(void *)(a1 + 40) + 1040);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke_2;
  v4[3] = &__block_descriptor_40_e31_v16__0__UIKBInputBackdropView_8l;
  void v4[4] = *(void *)(a1 + 48);
  return [v2 performForInputAccessoryBackdropViews:v4];
}

uint64_t __71__UIInputWindowController_animateAccessoryViewVisibility_withDuration___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setAlpha:*(double *)(a1 + 32)];
}

- (void)resetBackdropHeight
{
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
}

- (void)willBeginIndirectSelectionGesture
{
}

- (void)didEndIndirectSelectionGesture
{
}

- (void)setFullScreenPresentationAssertion:(id)a3
{
  char v4 = (SBSAssertion *)a3;
  fullScreenPresentationAssertion = self->_fullScreenPresentationAssertion;
  if (fullScreenPresentationAssertion) {
    BOOL v6 = fullScreenPresentationAssertion == v4;
  }
  else {
    BOOL v6 = 1;
  }
  if (!v6)
  {
    [(SBSAssertion *)fullScreenPresentationAssertion invalidate];
    fullScreenPresentationAssertion = self->_fullScreenPresentationAssertion;
  }
  self->_fullScreenPresentationAssertion = v4;
}

void __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke(uint64_t a1)
{
  uint64_t v5 = MEMORY[0x1E4F143A8];
  uint64_t v6 = 3221225472;
  char v7 = __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_2;
  char v8 = &unk_1E52FC118;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  id v1 = &v5;
  SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc = (void (*)(__CFString *, uint64_t *))getSBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc();
  if (SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc)
  {
    SBSAcquireFocusPreventingFullScreenPresentationAssertionSymbolLoc(@"Presenting in keyboard window outside app scene", v1);

    objc_destroyWeak(&v9);
  }
  else
  {
    uint64_t v3 = [MEMORY[0x1E4F28B00] currentHandler];
    char v4 = objc_msgSend(NSString, "stringWithUTF8String:", "void UIKBSBSAcquireFocusPreventingFullScreenPresentationAssertion(NSString *__strong, __strong _AssertionHandlerBlock)");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, @"UIInputWindowController.m", 84, @"%s", dlerror(), v5, v6, v7, v8);

    __break(1u);
  }
}

void __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_3;
  v5[3] = &unk_1E52D9960;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v5);

  objc_destroyWeak(&v7);
}

void __59__UIInputWindowController_presentationTransitionWillBegin___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = *(void **)(a1 + 32);
  id v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setFullScreenPresentationAssertion:v3];
  }
  else {
    [v3 invalidate];
  }
}

- (void)presentationTransitionDidEnd:(id)a3
{
}

- (void)setInterfaceAutorotationDisabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIViewController *)self view];
  id v6 = [v5 window];
  id v7 = v6;
  if (v3) {
    [v6 beginDisablingInterfaceAutorotation];
  }
  else {
    [v6 endDisablingInterfaceAutorotation];
  }

  id v8 = [(UIInputWindowControllerHosting *)self->_hosting itemForPurpose:3];
  [v8 setInterfaceAutorotationDisabled:v3];
}

- (BOOL)disablePlacementChanges
{
  return self->_disablePlacementChanges;
}

- (void)setPlacementChangeDisabled:(BOOL)a3 withPlacement:(id)a4
{
  BOOL v4 = a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = _UIInputWindowControllerLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109634;
    BOOL v15 = v4;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    double v19 = self;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "setPlacementChangeDisabled: %d, placement: %@ (self: %@)", buf, 0x1Cu);
  }

  if (!v4) {
    self->_disablePlacementChanges = 0;
  }
  if (![(UIInputWindowController *)self isRotating])
  {
    if (self->_disableInRotating)
    {
      uint64_t v8 = MEMORY[0x1E4F143A8];
      uint64_t v9 = 3221225472;
      double v10 = __68__UIInputWindowController_setPlacementChangeDisabled_withPlacement___block_invoke;
      id v11 = &unk_1E52D9F98;
      double v12 = self;
      id v13 = v6;
      +[UIView performWithoutAnimation:&v8];

      if (v4) {
        goto LABEL_10;
      }
    }
    else
    {
      [(UIInputWindowController *)self setPlacement:v6];
      if (v4) {
        goto LABEL_10;
      }
    }
LABEL_12:
    self->_disableInRotating = 0;
    goto LABEL_13;
  }
  [(UIInputWindowController *)self setPostRotationPlacement:v6];
  if (!v4) {
    goto LABEL_12;
  }
LABEL_10:
  self->_disablePlacementChanges = 1;
  self->_disableInRotating = [(UIInputWindowController *)self isRotating];
LABEL_13:
}

uint64_t __68__UIInputWindowController_setPlacementChangeDisabled_withPlacement___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setPlacement:*(void *)(a1 + 40)];
}

- (void)transferPlacementStateToInputWindowController:(id)a3
{
  id v20 = a3;
  BOOL v4 = self->_inputViewSet;
  uint64_t v5 = self->_placement;
  if ([(UIInputWindowController *)self isTransitioning])
  {
    uint64_t v6 = [(UIInputWindowController *)self transientInputViewSet];

    id v7 = [(UIInputWindowController *)self currentTransition];
    uint64_t v8 = [v7 fromPlacement];

    uint64_t v5 = (UIInputViewSetPlacement *)v8;
    BOOL v4 = (UIInputViewSet *)v6;
  }
  if ([(UIInputViewSet *)v4 isInputViewPlaceholder])
  {
    uint64_t v9 = [(UIInputViewSet *)v4 inputView];
    double v10 = [v9 fallbackView];
    id v11 = [(UIInputViewSet *)v4 inputAccessoryView];
    double v12 = +[_UIRemoteKeyboardPlaceholderView placeholderForView:v11];
    id v13 = [v9 fallbackView];
    if (v13)
    {
      double v14 = [v9 associatedView];
    }
    else
    {
      double v14 = 0;
    }
    __int16 v18 = +[UIInputViewSet inputSetWithInputView:v10 accessoryView:v12 assistantView:v14];

    if (v13) {
    BOOL v15 = [(UIViewController *)self _window];
    }
    __int16 v16 = [v15 windowScene];
    +[UIPeripheralHost endPlacementForInputViewSet:v18 windowScene:v16];
    id v17 = v5;
    uint64_t v5 = (UIInputViewSetPlacement *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v9 = [(UIInputViewSet *)v4 inputView];
    BOOL v15 = +[_UIRemoteKeyboardPlaceholderView placeholderForView:v9];
    __int16 v16 = [(UIInputViewSet *)v4 inputAccessoryView];
    id v17 = +[_UIRemoteKeyboardPlaceholderView placeholderForView:v16];
    __int16 v18 = +[UIInputViewSet inputSetWithInputView:v15 accessoryView:v17];
  }
  [v20 changeToInputViewSet:v18];
  [v20 setPlacement:v5 quietly:1 animated:0 generateSplitNotification:0];
  if (self->_disablePlacementChanges)
  {
    if ([(UIInputWindowController *)self isRotating]) {
      [(UIInputWindowController *)self postRotationPlacement];
    }
    else {
    double v19 = [(UIInputWindowController *)self placement];
    }
    [v20 setPlacementChangeDisabled:1 withPlacement:v19];
  }
}

- (BOOL)inhibitRotationAnimation
{
  return self->_disablePlacementChanges;
}

- (void)candidateBarWillChangeHeight:(double)a3 withDuration:(double)a4
{
  id v7 = [(UIInputWindowController *)self placement];
  int v8 = [v7 isUndocked];

  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __69__UIInputWindowController_candidateBarWillChangeHeight_withDuration___block_invoke;
    v9[3] = &unk_1E52D9CD0;
    void v9[4] = self;
    *(double *)&void v9[5] = a3;
    +[UIView animateWithDuration:50331648 delay:v9 options:&__block_literal_global_636 animations:a4 completion:0.0];
  }
}

void __69__UIInputWindowController_candidateBarWillChangeHeight_withDuration___block_invoke(uint64_t a1)
{
  double v2 = -*(double *)(a1 + 40);
  BOOL v3 = [*(id *)(a1 + 32) placement];
  [v3 setExtendedHeight:v2];

  BOOL v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v4 placement];
  [v4 updateVisibilityConstraintsForPlacement:v5];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

- (void)cancelCurrentTransition
{
  BOOL v3 = [(UIInputWindowController *)self currentTransition];

  if (v3)
  {
    [(UIInputWindowController *)self setInputViewsHidden:1];
    BOOL v4 = [(UIInputWindowController *)self currentTransition];
    [v4 setCancelled:1];

    uint64_t v5 = [(UIInputWindowController *)self currentTransition];
    id v6 = [v5 animationStyle];
    [v6 cancelInterruptibleAnimations];

    id v7 = [(UIInputWindowController *)self currentTransition];
    int v8 = [v7 fromPlacement];
    [(UIInputWindowController *)self updateToPlacement:v8 withNormalAnimationsAndNotifications:0];

    [(UIInputWindowController *)self setInputViewsHidden:0];
  }
}

- (BOOL)isTransitioning
{
  double v2 = [(UIInputWindowController *)self currentTransition];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isTransitionStarted
{
  BOOL v3 = [(UIInputWindowController *)self currentTransition];
  if (v3)
  {
    BOOL v4 = [(UIInputWindowController *)self currentTransition];
    BOOL v5 = [v4 animationState] > 2;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)isTransitioningBetweenKeyboardStates
{
  double v2 = [(UIInputWindowController *)self currentTransition];
  BOOL v3 = [v2 fromPlacement];
  char v4 = [v3 showsKeyboard];
  BOOL v5 = [v2 toPlacement];
  char v6 = v4 ^ [v5 showsKeyboard];

  return v6;
}

- (BOOL)isTransitioningBetweenFloatingStates
{
  BOOL v3 = [(UIKeyboardFloatingTransitionController *)self->_floatingTransitionController isTransitioning];
  if (!self->_floatingTransitionController)
  {
    if (+[_UIRemoteKeyboards enabled])
    {
      char v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v4 inputWindowRootViewController];
    }
    else
    {
      char v4 = +[UIKeyboardImpl activeInstance];
      [v4 _rootInputWindowController];
    }
    BOOL v5 = (UIInputWindowController *)objc_claimAutoreleasedReturnValue();

    if (v5) {
      BOOL v6 = v5 == self;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6) {
      BOOL v3 = [(UIInputWindowController *)v5 isTransitioningBetweenFloatingStates];
    }
  }
  return v3;
}

- (UIInputViewSetPlacement)expectedPlacement
{
  BOOL v3 = [(UIInputWindowController *)self currentTransition];
  if (v3)
  {
    char v4 = [(UIInputWindowController *)self currentTransition];
    BOOL v5 = [v4 toPlacement];
  }
  else
  {
    BOOL v5 = [(UIInputWindowController *)self placement];
  }

  return (UIInputViewSetPlacement *)v5;
}

- (UIInputViewSetPlacement)animationAwarePlacement
{
  BOOL v3 = [(UIInputWindowController *)self placementDuringAnimation];
  char v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [(UIInputWindowController *)self placementIgnoringRotation];
  }
  BOOL v6 = v5;

  return (UIInputViewSetPlacement *)v6;
}

- (void)beginFloatingTransitionFromPanGestureRecognizer:(id)a3
{
}

- (void)set_inputViewController:(id)a3
{
}

- (void)set_inputAssistantViewController:(id)a3
{
}

- (void)set_inputAccessoryViewController:(id)a3
{
}

- (void)setPostRotationPlacement:(id)a3
{
}

- (UIInputViewSet)postRotationInputViewSet
{
  return self->_postRotationInputViewSet;
}

- (void)setPostRotationInputViewSet:(id)a3
{
}

- (id)postRotationPendingBlock
{
  return self->_postRotationPendingBlock;
}

- (UIInputViewSetNotificationInfo)postRotationInputViewNotificationInfo
{
  return self->_postRotationInputViewNotificationInfo;
}

- (void)setPostRotationInputViewNotificationInfo:(id)a3
{
}

- (UIInputViewSetNotificationInfo)templateNotificationInfo
{
  return self->_templateNotificationInfo;
}

- (void)setTemplateNotificationInfo:(id)a3
{
}

- (void)setCurrentTransition:(id)a3
{
}

- (void)setShouldNotifyRemoteKeyboards:(BOOL)a3
{
  self->_shouldNotifyRemoteKeyboards = a3;
}

- (UIInputWindowControllerHosting)hosting
{
  return self->_hosting;
}

- (BOOL)forceAccessoryViewToBottomOfHostView
{
  return self->_forceAccessoryViewToBottomOfHostView;
}

- (void)setForceAccessoryViewToBottomOfHostView:(BOOL)a3
{
  self->_forceAccessoryViewToBottomOfHostView = a3;
}

- (NSLayoutConstraint)inputViewHeightConstraint
{
  return self->_inputViewHeightConstraint;
}

- (void)setInputViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)assistantViewHeightConstraint
{
  return self->_assistantViewHeightConstraint;
}

- (void)setAssistantViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewHeightConstraint
{
  return self->_accessoryViewHeightConstraint;
}

- (void)setAccessoryViewHeightConstraint:(id)a3
{
}

- (UIInputViewSetNotificationInfo)notificationInfoWaitingForInputUI
{
  return self->_notificationInfoWaitingForInputUI;
}

- (void)setNotificationInfoWaitingForInputUI:(id)a3
{
}

- (UIInputViewSet)transientInputViewSet
{
  return self->_transientInputViewSet;
}

- (UIInputViewSetPlacement)placementDuringAnimation
{
  return self->_placementDuringAnimation;
}

- (void)setPlacementDuringAnimation:(id)a3
{
}

- (BOOL)layoutGuideNeedsUpdate
{
  return self->_layoutGuideNeedsUpdate;
}

- (void)setLayoutGuideNeedsUpdate:(BOOL)a3
{
  self->_layoutGuideNeedsUpdate = a3;
}

- (BOOL)externalTrackingUpdateInProgress
{
  return self->_externalTrackingUpdateInProgress;
}

- (void)setExternalTrackingUpdateInProgress:(BOOL)a3
{
  self->_BOOL externalTrackingUpdateInProgress = a3;
}

- (UIInputViewSetNotificationInfo)externalTrackingInfo
{
  return self->_externalTrackingInfo;
}

- (void)setExternalTrackingInfo:(id)a3
{
}

- (UITraitCollection)sizeClassCollectionOverride
{
  return self->_sizeClassCollectionOverride;
}

- (void)setSizeClassCollectionOverride:(id)a3
{
}

- (BOOL)dontDismissKeyboardOnScrolling
{
  return self->_dontDismissKeyboardOnScrolling;
}

- (void)setDontDismissKeyboardOnScrolling:(BOOL)a3
{
  self->_dontDismissKeyboardOnScrolling = a3;
}

- (BOOL)dontDismissReachability
{
  return self->_dontDismissReachability;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sizeClassCollectionOverride, 0);
  objc_storeStrong((id *)&self->_externalTrackingInfo, 0);
  objc_storeStrong((id *)&self->_placementDuringAnimation, 0);
  objc_storeStrong((id *)&self->_transientInputViewSet, 0);
  objc_storeStrong((id *)&self->_notificationInfoWaitingForInputUI, 0);
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_assistantViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_inputViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_pathEffectView, 0);
  objc_storeStrong((id *)&self->_currentTransition, 0);
  objc_storeStrong((id *)&self->_templateNotificationInfo, 0);
  objc_storeStrong((id *)&self->_postRotationInputViewNotificationInfo, 0);
  objc_storeStrong(&self->_postRotationPendingBlock, 0);
  objc_storeStrong((id *)&self->_postRotationInputViewSet, 0);
  objc_storeStrong((id *)&self->_postRotationPlacement, 0);
  objc_storeStrong((id *)&self->_inputAccessoryViewController, 0);
  objc_storeStrong((id *)&self->_inputAssistantViewController, 0);
  objc_storeStrong((id *)&self->_inputViewController, 0);
  objc_storeStrong((id *)&self->_placement, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_fullScreenPresentationAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardSnapshot, 0);
  objc_storeStrong((id *)&self->_passcodeObscuringInteraction, 0);
  objc_storeStrong((id *)&self->_floatingTransitionController, 0);
  objc_storeStrong(&self->_pendingCompleteAnimation, 0);
  objc_storeStrong((id *)&self->_keyboardShowTimestamp, 0);
  objc_storeStrong((id *)&self->_lastKeyboardID, 0);
  objc_storeStrong((id *)&self->_keyboardHeightChangeNotificationInfo, 0);
  objc_storeStrong((id *)&self->_rotationInfo, 0);
  objc_storeStrong((id *)&self->_preRotationSnapshot, 0);
  objc_storeStrong((id *)&self->_hosting, 0);
  objc_storeStrong(&self->_pendingTransitionActivity, 0);
  objc_storeStrong((id *)&self->_animationStyleStack, 0);
}

@end