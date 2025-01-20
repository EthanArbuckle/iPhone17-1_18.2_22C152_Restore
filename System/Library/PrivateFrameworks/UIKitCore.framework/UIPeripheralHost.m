@interface UIPeripheralHost
+ (BOOL)inputViewSetContainsView:(id)a3;
+ (BOOL)pointIsWithinKeyboardContent:(CGPoint)a3;
+ (CGPoint)adjustedFloatingOffsetForKeyboardSize:(CGSize)a3;
+ (CGPoint)defaultUndockedOffset;
+ (CGRect)screenBoundsInAppOrientation;
+ (CGRect)visibleInputViewFrame;
+ (CGRect)visiblePeripheralFrame;
+ (Class)floatingAssistantBarPlacementClassSupportingCompactStyle:(BOOL)a3;
+ (Class)hostViewClass;
+ (UIEdgeInsets)floatingChromeBuffer;
+ (double)gridViewRubberBandValueForValue:(double)result target:(double)a4 timeInterval:(double)a5 velocity:(double *)a6;
+ (id)activeInstance;
+ (id)allVisiblePeripheralFrames;
+ (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4;
+ (id)passthroughViews;
+ (id)sharedInstance;
+ (void)_releaseSharedInstance;
+ (void)adjustFloatingPersistentOffsetForKeyboardSize:(CGSize)a3;
+ (void)setFloating:(BOOL)a3 onCompletion:(id)a4;
+ (void)setKeyboardOnScreenNotifyKey:(BOOL)a3;
- (BOOL)_isCoordinatingWithSystemGestures;
- (BOOL)_isSuppressedByManualKeyboard;
- (BOOL)_isTransitioning;
- (BOOL)_restoreInputViewsWithId:(id)a3 animated:(BOOL)a4;
- (BOOL)_shouldDelayRotationForWindow:(id)a3;
- (BOOL)animationFencingEnabled;
- (BOOL)animationsEnabled;
- (BOOL)automaticAppearanceEnabled;
- (BOOL)automaticAppearanceInternalEnabled;
- (BOOL)automaticAppearanceReallyEnabled;
- (BOOL)hasCustomInputView;
- (BOOL)hasDelayedTasksForKey:(id)a3;
- (BOOL)hasDictationKeyboard;
- (BOOL)isOffScreen;
- (BOOL)isOnScreen;
- (BOOL)isRotating;
- (BOOL)isTranslating;
- (BOOL)isUndocked;
- (BOOL)keyClicksEnabled;
- (BOOL)maximize;
- (BOOL)maximizeWithAnimation:(BOOL)a3;
- (BOOL)minimize;
- (BOOL)shouldUseHideNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3;
- (BOOL)userInfoContainsActualGeometryChange:(id)a3;
- (CGPoint)adjustedPersistentOffset;
- (CGPoint)offHostPointForPoint:(CGPoint)a3;
- (CGRect)_inputViewRectToAvoid;
- (CGRect)screenRectFromBounds:(CGRect)a3 atCenter:(CGPoint)a4 applyingSourceHeightDelta:(double)a5;
- (CGRect)transitioningFrame;
- (CGRect)visiblePeripheralFrame:(BOOL)a3;
- (CGSize)sizeOfInputViewForInputViewSet:(id)a3 withInterfaceOrientation:(int64_t)a4;
- (CGSize)totalPeripheralSizeForOrientation:(int64_t)a3;
- (UIInputViewSet)_inputViews;
- (UIInputViewSet)_transientInputViews;
- (UIInputViewSet)inputViews;
- (UIInputViewSet)loadAwareInputViews;
- (UIKeyboardRotationState)rotationState;
- (UIPeripheralHost)init;
- (UIPeripheralHostState)targetState;
- (UIResponder)responder;
- (UITextInputMode)documentInputMode;
- (UIView)view;
- (double)ambiguousControlCenterActivationMargin;
- (double)getVerticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4;
- (double)minimumOffsetForBuffer:(double)a3;
- (id)_currentInputView;
- (id)_inheritedRenderConfig;
- (id)_renderConfigForCurrentResponder;
- (id)_renderConfigForResponder:(id)a3;
- (id)_sceneForFirstResponder:(id)a3;
- (id)_screenForFirstResponder:(id)a3;
- (id)containerRootController;
- (id)containerTextEffectsWindow;
- (id)containerTextEffectsWindowAboveStatusBar;
- (id)containerWindow;
- (id)existingContainerRootController;
- (id)lastUsedInputModeForCurrentContext;
- (id)transformedContainerView;
- (id)transitioningView;
- (id)userInfoFromGeometry:(UIPeripheralAnimationGeometry *)a3 duration:(double)a4 forWill:(BOOL)a5 forShow:(BOOL)a6;
- (int)_isKeyboardDeactivated;
- (int)currentState;
- (unint64_t)_clipCornersOfView:(id)a3;
- (void)_beginDisablingAnimations;
- (void)_clearPreservedInputViewsWithId:(id)a3 clearKeyboard:(BOOL)a4;
- (void)_clearPreservedInputViewsWithRestorableResponder:(id)a3;
- (void)_endDisablingAnimations;
- (void)_preserveInputViewsWithId:(id)a3;
- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4;
- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4 reset:(BOOL)a5;
- (void)_restoreInputAccessoryViewOverrideWithId:(id)a3;
- (void)_updateContainerWindowLevel;
- (void)dealloc;
- (void)disableInterfaceAutorotation:(BOOL)a3;
- (void)enableKeyboardTyping;
- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4;
- (void)finishRotation;
- (void)finishRotationOfKeyboard:(id)a3;
- (void)flushDelayedTasks;
- (void)flushDelayedTasksForKey:(id)a3;
- (void)forceOrderInAutomatic;
- (void)forceOrderInAutomaticAnimated:(BOOL)a3;
- (void)forceOrderInAutomaticFromDirection:(int)a3 withDuration:(double)a4;
- (void)forceOrderOutAutomatic;
- (void)forceOrderOutAutomaticAnimated:(BOOL)a3;
- (void)forceOrderOutAutomaticToDirection:(int)a3 withDuration:(double)a4;
- (void)forceReloadInputViews;
- (void)moveToPersistentOffset;
- (void)orderInAutomatic;
- (void)orderInAutomaticFromDirection:(int)a3 withDuration:(double)a4;
- (void)orderInAutomaticSkippingAnimation;
- (void)orderOutAutomatic;
- (void)orderOutAutomaticSkippingAnimation;
- (void)orderOutAutomaticToDirection:(int)a3 withDuration:(double)a4;
- (void)performMultipleOperations:(id)a3 withAnimationStyle:(id)a4;
- (void)performWithoutDeactivation:(id)a3;
- (void)peripheralHostWillResume:(id)a3;
- (void)postDidShowNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3;
- (void)postKeyboardFrameChangeNotification:(id)a3 withInfo:(id)a4;
- (void)postWillShowNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3 duration:(double)a4;
- (void)prepareForRotationOfKeyboard:(id)a3 toOrientation:(int64_t)a4;
- (void)prepareForRotationToOrientation:(int64_t)a3;
- (void)queueDelayedTask:(id)a3;
- (void)queueDelayedTask:(id)a3 forKey:(id)a4;
- (void)queueDelayedTask:(id)a3 forKey:(id)a4 delay:(double)a5;
- (void)removePreservedInputViewSetForInputView:(id)a3;
- (void)rotateKeyboard:(id)a3 toOrientation:(int64_t)a4;
- (void)rotateToOrientation:(int64_t)a3;
- (void)scrollView:(id)a3 didFinishPanGesture:(id)a4;
- (void)scrollView:(id)a3 didPanWithGesture:(id)a4;
- (void)setAmbiguousControlCenterActivationMargin:(double)a3;
- (void)setAnimationFencingEnabled:(BOOL)a3;
- (void)setAutomaticAppearanceEnabled:(BOOL)a3;
- (void)setAutomaticAppearanceInternalEnabled:(BOOL)a3;
- (void)setCurrentState:(int)a3;
- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4;
- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5;
- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5 updatePlacement:(BOOL)a6;
- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5 updatePlacement:(BOOL)a6 wantsAssistant:(BOOL)a7 keepAccessories:(BOOL)a8;
- (void)setDocumentInputMode:(id)a3;
- (void)setInputViewsHidden:(BOOL)a3;
- (void)setKeyboardFencingEnabled:(BOOL)a3;
- (void)setKeyboardOnScreenNotifyKey:(BOOL)a3;
- (void)setResponder:(id)a3;
- (void)setRotationState:(id)a3;
- (void)setTargetState:(id)a3;
- (void)setTextEffectsWindowLevelForInputView:(id)a3 responder:(id)a4;
- (void)setUndockedWithOffset:(CGPoint)a3 animated:(BOOL)a4;
- (void)set_inputViews:(id)a3;
- (void)set_transientInputViews:(id)a3;
- (void)textEffectsWindowDidRotate:(id)a3;
- (void)updateInputAccessoryViewVisibility:(BOOL)a3 withDuration:(double)a4;
- (void)updatePlacementForDeactivatedKeyboard:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 wantsAssistant:(BOOL)a5 keepAccessories:(BOOL)a6 animationStyle:(id)a7;
- (void)updateToPlacement:(id)a3 withNormalAnimationsAndNotifications:(BOOL)a4;
@end

@implementation UIPeripheralHost

+ (id)endPlacementForInputViewSet:(id)a3 windowScene:(id)a4
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v67 = a4;
  v6 = _UIPeripheralHostLogger();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(void *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v67;
    _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet: %@ windowScene: %@", buf, 0x16u);
  }

  v68 = +[UIKeyboardImpl activeInstance];
  v65 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v69 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  v70 = [v69 systemInputAssistantViewController];
  v7 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  int v63 = [v7 hasLocalMinimumKeyboardHeightForScene:v67];
  char v8 = [v5 isCustomInputView];
  if (v68) {
    char v9 = v8;
  }
  else {
    char v9 = 1;
  }
  if (v9) {
    int v64 = 0;
  }
  else {
    int v64 = [v68 isMinimized];
  }
  if ([v7 wantsAssistantWhileSuppressingKeyboard]) {
    int v10 = [v7 disableBecomeFirstResponder];
  }
  else {
    int v10 = 0;
  }
  if (![v5 isRemoteKeyboard]
    || +[UIKeyboard usesLocalKeyboard])
  {
    goto LABEL_14;
  }
  if ([v65 snapshotting])
  {
    BOOL v11 = 1;
  }
  else
  {
    if ([v65 keyboardActive])
    {
LABEL_14:
      BOOL v11 = 0;
      goto LABEL_15;
    }
    v34 = [v5 inputAccessoryView];
    BOOL v11 = v34 != 0;
  }
LABEL_15:
  v12 = [v69 hardwareKeyboardExclusivityIdentifier];
  if (v12)
  {
    v13 = [v70 centerViewController];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    int isKindOfClass = 0;
  }

  BOOL v14 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1;
  if (+[UIKeyboard usesInputSystemUI]
    || ![v5 isRemoteKeyboard])
  {
    int v62 = +[UIKeyboardImpl isFloating];
  }
  else
  {
    v15 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    int v62 = [v15 isFloating];
  }
  int v16 = [v70 shouldBeShownForInputDelegate:0 inputViews:v5];
  unsigned int v60 = [v70 supportsCompactStyle];
  if ([v5 isRemoteKeyboard]) {
    int v17 = [v7 assistantBarVisible];
  }
  else {
    int v17 = 0;
  }
  v18 = [v5 inputView];
  v66 = [v5 inputAssistantView];
  if ([v5 isInputViewPlaceholder])
  {
    id v19 = v18;
    v20 = [v19 associatedView];

    if (v20)
    {
      v18 = [v19 fallbackView];

      uint64_t v21 = [v19 associatedView];

      v66 = (void *)v21;
    }
    else
    {
      v18 = v19;
    }
  }
  if (v18) {
    char v22 = v10;
  }
  else {
    char v22 = 1;
  }
  if ((v22 & 1) == 0 && (v63 | v64 ^ 1 | v11) == 1)
  {
    v23 = buf;
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v84 = __Block_byref_object_copy__136;
    v85 = __Block_byref_object_dispose__136;
    id v86 = 0;
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke;
    v73[3] = &unk_1E52FD1D0;
    char v78 = v62;
    id v74 = v65;
    v76 = buf;
    id v75 = v68;
    id v77 = a1;
    char v79 = v60;
    +[UIKeyboardImpl performWithoutFloatingLock:v73];
    uint64_t v24 = *(void *)(*(void *)&buf[8] + 40);
    if (v24)
    {
      v25 = _UIPeripheralHostLogger();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v26 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v81 = 138412290;
        uint64_t v82 = v26;
        _os_log_impl(&dword_1853B0000, v25, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, early return -> %@", v81, 0xCu);
      }

      v23 = *(id *)(*(void *)&buf[8] + 40);
      v27 = 0;
    }
    else
    {
      [v5 inputAccessoryView];

      v27 = objc_opt_class();
    }

    _Block_object_dispose(buf, 8);
    if (v24) {
      goto LABEL_70;
    }
    goto LABEL_64;
  }
  if ((v16 | v17) == 1 && ([v68 _shouldSuppressSoftwareKeyboardAndAssistantView] & 1) == 0)
  {
    if (v66
      || (([v5 inputView], (v28 = objc_claimAutoreleasedReturnValue()) != 0)
        ? (int v29 = v64)
        : (int v29 = 0),
          v28,
          v29 | v10))
    {
      if ((v14 | isKindOfClass))
      {
        int v30 = [v70 shouldUseCustomBackground:0];
        v31 = [v67 screen];
        v32 = +[UIKeyboardMotionSupport supportForScreen:v31];

        if (v30)
        {
          uint64_t v33 = objc_opt_class();
        }
        else
        {
          v35 = [v32 remotePlacement];

          if (v35)
          {
            v36 = [v32 remotePlacement];
            v27 = objc_opt_class();

LABEL_63:
LABEL_64:
            if (v27)
            {
LABEL_67:
              v39 = _UIPeripheralHostLogger();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = [v27 placement];
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v40;
                _os_log_impl(&dword_1853B0000, v39, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, returning -> %@", buf, 0xCu);
              }
              v23 = [v27 placement];
              goto LABEL_70;
            }
            goto LABEL_65;
          }
          uint64_t v33 = [a1 floatingAssistantBarPlacementClassSupportingCompactStyle:v60];
        }
        v27 = (void *)v33;
        goto LABEL_63;
      }
      if (v64 && [v70 isVisibleWhenMinimized])
      {
        v27 = objc_opt_class();
        goto LABEL_64;
      }
    }
  }
LABEL_65:
  v37 = [v5 inputAccessoryView];
  BOOL v38 = v37 == 0;

  if (!v38)
  {
    v27 = objc_opt_class();
    goto LABEL_67;
  }
  if ((v62 ^ 1 | v64))
  {
    v71[0] = MEMORY[0x1E4F143A8];
    v71[1] = 3221225472;
    v71[2] = __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke_356;
    v71[3] = &unk_1E52FD1F8;
    id v72 = v7;
    v23 = +[UIInputViewSetPlacement deactivatedKeyboardPlacementWithCurrentPlacement:v71];
  }
  else
  {
    +[UIKeyboardImpl normalizedPersistentOffset];
    double v43 = v42;
    double v45 = v44;
    +[UIPeripheralHost floatingChromeBuffer];
    double v47 = v46;
    double v49 = v48;
    double v51 = v50;
    double v53 = v52;
    +[UIKeyboardImpl floatingWidth];
    v55 = +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v43, v45, v47, v49, v51, v53, v54);
    if (+[UIKeyboard isModelessActive]
      && +[UIKeyboardImpl isFloatingForced]
      && ([v68 _shouldSuppressAssistantBar] & 1) == 0)
    {
      v56 = objc_msgSend((id)objc_msgSend(a1, "floatingAssistantBarPlacementClassSupportingCompactStyle:", v60), "placement");
      v80 = v56;
      v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v80 count:1];
      [v55 setSubPlacements:v57];
    }
    v58 = _UIPeripheralHostLogger();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&buf[4] = v55;
      _os_log_impl(&dword_1853B0000, v58, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, invisible return -> %@", buf, 0xCu);
    }

    v23 = +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:v55];
  }
LABEL_70:

  return v23;
}

- (void)textEffectsWindowDidRotate:(id)a3
{
  id v4 = a3;
  id v12 = [(UIPeripheralHost *)self view];
  id v5 = [v12 window];
  v6 = [v4 object];

  if (v5 == v6)
  {
    v7 = [(UIPeripheralHost *)self containerWindow];
    char v8 = [v7 _isHostedInAnotherProcess];

    if (v8) {
      return;
    }
    id v12 = [(UIPeripheralHost *)self containerWindow];
    uint64_t v9 = [v12 interfaceOrientation];
    id v5 = [(UIPeripheralHost *)self inputViews];
    v6 = [v5 keyboard];
    if (v9 == [v6 interfaceOrientation]) {
      double v10 = 1.0;
    }
    else {
      double v10 = 0.0;
    }
    BOOL v11 = [(UIPeripheralHost *)self view];
    [v11 setAlpha:v10];
  }
}

- (UIView)view
{
  return 0;
}

+ (CGRect)visiblePeripheralFrame
{
  v2 = +[UIPeripheralHost sharedInstance];
  if ([v2 isUndocked])
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    v7 = [v2 containerRootController];
    [v7 visibleFrame];
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
  }
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)isUndocked
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v3 = [v2 existingContainerWindow];

  if (v3)
  {
    double v4 = [v2 existingContainerRootController];
    LOBYTE(v3) = [v4 isUndocked];
  }
  return (char)v3;
}

- (id)containerRootController
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v3 = [v2 containerRootController];

  return v3;
}

+ (id)sharedInstance
{
  v2 = (void *)SharedPeripheralHost;
  if (!SharedPeripheralHost)
  {
    double v3 = objc_alloc_init(UIPeripheralHost);
    double v4 = (void *)SharedPeripheralHost;
    SharedPeripheralHost = (uint64_t)v3;

    v2 = (void *)SharedPeripheralHost;
  }
  return v2;
}

- (void)setAmbiguousControlCenterActivationMargin:(double)a3
{
  self->_ambiguousControlCenterActivationMargin = a3;
}

- (UIPeripheralHost)init
{
  v13.receiver = self;
  v13.super_class = (Class)UIPeripheralHost;
  v2 = [(UIPeripheralHost *)&v13 init];
  double v3 = (UIPeripheralHost *)v2;
  if (v2)
  {
    *((_WORD *)v2 + 8) = 257;
    *((_DWORD *)v2 + 6) = 0;
    long long v4 = *MEMORY[0x1E4F1DB28];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DB28] + 16);
    *(_OWORD *)(v2 + 152) = *MEMORY[0x1E4F1DB28];
    *(_OWORD *)(v2 + 168) = v5;
    *(_OWORD *)(v2 + 184) = v4;
    *(_OWORD *)(v2 + 200) = v5;
    double v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    targetStateStack = v3->_targetStateStack;
    v3->_targetStateStack = v6;

    double v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    deferredTransitionTasks = v3->_deferredTransitionTasks;
    v3->_deferredTransitionTasks = v8;

    v3->_animationFencingEnabled = 1;
    double v10 = +[UIInputViewSet emptyInputSet];
    [(UIPeripheralHost *)v3 set_inputViews:v10];

    double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v3 selector:sel_peripheralHostWillResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v11 addObserver:v3 selector:sel_textEffectsWindowDidRotate_ name:@"UITextEffectsWindowDidRotateNotification" object:0];
  }
  return v3;
}

- (void)set_inputViews:(id)a3
{
}

+ (CGRect)screenBoundsInAppOrientation
{
  v2 = +[UIScreen mainScreen];
  [v2 bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  int64_t v11 = +[UIKeyboardSceneDelegate interfaceOrientation];
  if ((unint64_t)(v11 - 3) >= 2) {
    double v12 = v10;
  }
  else {
    double v12 = v8;
  }
  if ((unint64_t)(v11 - 3) >= 2) {
    double v13 = v8;
  }
  else {
    double v13 = v10;
  }
  double v14 = v4;
  double v15 = v6;
  result.size.height = v12;
  result.size.width = v13;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)automaticAppearanceReallyEnabled
{
  return self->_automaticAppearanceEnabled && self->_automaticAppearanceEnabledInternal;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIApplicationWillEnterForegroundNotification";
  v6[1] = @"UITextEffectsWindowDidRotateNotification";
  double v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  [(UIPeripheralHost *)self set_inputViews:0];
  [(UIPeripheralHost *)self set_transientInputViews:0];
  [(UIPeripheralHost *)self setResponder:0];
  v5.receiver = self;
  v5.super_class = (Class)UIPeripheralHost;
  [(UIPeripheralHost *)&v5 dealloc];
}

- (BOOL)hasDictationKeyboard
{
  v2 = +[UIKeyboardImpl activeInstance];
  double v3 = [v2 _layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)peripheralHostWillResume:(id)a3
{
  double v4 = [(UIPeripheralHost *)self responder];
  int v5 = [v4 _requiresKeyboardWhenFirstResponder];

  if (v5)
  {
    double v6 = +[UIKeyboardImpl sharedInstance];
    double v7 = [(UIPeripheralHost *)self responder];
    double v8 = [v7 _keyboardResponder];
    [v6 setDelegate:v8];

    double v9 = [v6 geometryDelegate];

    if (!v9)
    {
      double v10 = +[UIKeyboard activeKeyboard];
      [v6 setGeometryDelegate:v10];
    }
    int64_t v11 = [(UIPeripheralHost *)self inputViews];
    double v12 = [v11 inputViewController];
    double v13 = [v12 _compatibilityController];
    double v14 = +[UIKeyboardInputModeController sharedInputModeController];
    double v15 = [v14 currentInputMode];
    [v13 setInputMode:v15];
  }
  [(UIPeripheralHost *)self flushDelayedTasks];
}

- (CGSize)sizeOfInputViewForInputViewSet:(id)a3 withInterfaceOrientation:(int64_t)a4
{
  id v5 = a3;
  if (([v5 isEmpty] & 1) != 0
    || ([v5 keyboard], double v6 = objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    +[UIKeyboardImpl sizeForInterfaceOrientation:a4];
  }
  else
  {
    +[UIKeyboardImpl defaultSizeForInterfaceOrientation:a4];
  }
  double v9 = v7;
  double v10 = v8;

  double v11 = v9;
  double v12 = v10;
  result.height = v12;
  result.width = v11;
  return result;
}

- (id)_renderConfigForCurrentResponder
{
  double v3 = [(UIPeripheralHost *)self responder];
  double v4 = [(UIPeripheralHost *)self _renderConfigForResponder:v3];

  return v4;
}

- (id)_renderConfigForResponder:(id)a3
{
  id v3 = a3;
  double v4 = +[UITextInputTraits traitEnvironmentFromTraits:v3];
  if (objc_opt_respondsToSelector()) {
    uint64_t v5 = [v3 keyboardAppearance];
  }
  else {
    uint64_t v5 = 0;
  }
  int64_t v6 = +[UITextInputTraits configuredAppearanceForAppearance:v5 withTraitEnvironment:v4];
  double v7 = +[UIKeyboardInputModeController sharedInputModeController];
  double v8 = [v7 currentInputMode];
  double v9 = +[UIKBRenderConfig configForAppearance:v6 inputMode:v8 traitEnvironment:v4];

  return v9;
}

+ (id)activeInstance
{
  return (id)SharedPeripheralHost;
}

+ (void)_releaseSharedInstance
{
  v2 = [(id)SharedPeripheralHost view];
  id v3 = [v2 layer];
  [v3 removeAllAnimations];

  double v4 = (void *)SharedPeripheralHost;
  SharedPeripheralHost = 0;
}

+ (void)setKeyboardOnScreenNotifyKey:(BOOL)a3
{
  _MergedGlobals_1145 = a3;
  int v3 = dword_1EB261C34;
  if (!dword_1EB261C34)
  {
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke_2;
    handler[3] = &unk_1E52FD220;
    id v5 = &__block_literal_global_360;
    notify_register_dispatch("com.apple.keyboard.isOnScreen", &dword_1EB261C34, MEMORY[0x1E4F14428], handler);

    int v3 = dword_1EB261C34;
  }
  __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke((int)a1, v3);
}

uint64_t __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke(int a1, int token)
{
  uint64_t state64 = 0;
  uint64_t result = notify_get_state(token, &state64);
  if (result || (state64 & 1) != _MergedGlobals_1145)
  {
    uint64_t state64 = _MergedGlobals_1145;
    notify_set_state(token, _MergedGlobals_1145);
    return notify_post("com.apple.keyboard.isOnScreen");
  }
  return result;
}

void __49__UIPeripheralHost_setKeyboardOnScreenNotifyKey___block_invoke_2(uint64_t a1)
{
  if (_MergedGlobals_1145)
  {
    if (![(id)UIApp isSuspended]
      || (+[UIKeyboard activeKeyboard],
          v2 = objc_claimAutoreleasedReturnValue(),
          [v2 window],
          int v3 = objc_claimAutoreleasedReturnValue(),
          int v4 = [v3 _isHostedInAnotherProcess],
          v3,
          v2,
          v4))
    {
      id v5 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
      v5();
    }
  }
}

- (void)setKeyboardOnScreenNotifyKey:(BOOL)a3
{
  [(id)objc_opt_class() setKeyboardOnScreenNotifyKey:a3];
  +[UIDictationController keyboardDidUpdateOnScreenStatus];
}

- (int)currentState
{
  v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([(id)UIApp _isSpringBoard]) {
    [v2 containerWindow];
  }
  else {
  int v3 = [v2 existingContainerWindow];
  }
  int v4 = v3;
  if (v3)
  {
    id v5 = [v3 rootViewController];
    int v6 = [v5 isChangingPlacement];
    int v7 = [v5 isOnScreen];
    if (v6) {
      int v8 = 2;
    }
    else {
      int v8 = 3;
    }
    if (v7) {
      int v9 = v6 ^ 1;
    }
    else {
      int v9 = v8;
    }
  }
  else
  {
    id v5 = +[UIKeyboard activeKeyboard];
    double v10 = [v5 window];
    if (v10) {
      int v9 = 1;
    }
    else {
      int v9 = 3;
    }
  }
  return v9;
}

- (void)setKeyboardFencingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v4 setShouldFence:v3];
}

- (BOOL)isOnScreen
{
  return [(UIPeripheralHost *)self currentState] < 2;
}

- (BOOL)isOffScreen
{
  return [(UIPeripheralHost *)self currentState] == 3;
}

- (UIPeripheralHostState)targetState
{
  BOOL v3 = (void *)[(NSMutableArray *)self->_targetStateStack count];
  if (v3)
  {
    BOOL v3 = [(NSMutableArray *)self->_targetStateStack lastObject];
  }
  return (UIPeripheralHostState *)v3;
}

- (void)setTargetState:(id)a3
{
  targetStateStack = self->_targetStateStack;
  if (a3)
  {
    -[NSMutableArray addObject:](targetStateStack, "addObject:");
  }
  else if ([(NSMutableArray *)targetStateStack count])
  {
    id v5 = self->_targetStateStack;
    [(NSMutableArray *)v5 removeLastObject];
  }
}

- (void)postKeyboardFrameChangeNotification:(id)a3 withInfo:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  if (!self->_isTranslating || ([v11 _containsSubstring:@"ChangeFrameNotification"] & 1) == 0)
  {
    if ([v11 isEqualToString:@"UIKeyboardWillChangeFrameNotification"])
    {
      int v7 = UIKeyboardPrivateWillChangeFrameNotification;
    }
    else
    {
      if (![v11 isEqualToString:@"UIKeyboardDidChangeFrameNotification"])
      {
        int v8 = 0;
        goto LABEL_9;
      }
      int v7 = UIKeyboardPrivateDidChangeFrameNotification;
    }
    int v8 = *v7;
LABEL_9:
    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v10 = [(UIPeripheralHost *)self _screenForFirstResponder:self->_responder];
    [v9 postNotificationName:v8 object:v10 userInfo:v6];

    [v9 postNotificationName:v11 object:0 userInfo:v6];
  }
}

- (void)disableInterfaceAutorotation:(BOOL)a3
{
  if (a3)
  {
    if (self->_interfaceAutorotationDisabled) {
      return;
    }
    BOOL v4 = 1;
    id v5 = &selRef_beginDisablingInterfaceAutorotation;
  }
  else
  {
    if (!self->_interfaceAutorotationDisabled) {
      return;
    }
    BOOL v4 = 0;
    id v5 = &selRef_endDisablingInterfaceAutorotation;
  }
  id v6 = [(id)UIApp windows];
  [v6 makeObjectsPerformSelector:*v5];

  self->_interfaceAutorotationDisabled = v4;
}

- (void)prepareForRotationToOrientation:(int64_t)a3
{
  id v6 = [(UIPeripheralHost *)self inputViews];
  id v5 = [v6 keyboard];
  [(UIPeripheralHost *)self prepareForRotationOfKeyboard:v5 toOrientation:a3];
}

- (void)rotateToOrientation:(int64_t)a3
{
  id v6 = [(UIPeripheralHost *)self inputViews];
  id v5 = [v6 keyboard];
  [(UIPeripheralHost *)self rotateKeyboard:v5 toOrientation:a3];
}

- (void)finishRotation
{
  id v4 = [(UIPeripheralHost *)self inputViews];
  BOOL v3 = [v4 keyboard];
  [(UIPeripheralHost *)self finishRotationOfKeyboard:v3];
}

- (void)prepareForRotationOfKeyboard:(id)a3 toOrientation:(int64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (v6)
  {
    v31 = v6;
    int v8 = [v6 window];
    char v9 = [v8 _isTextEffectsWindow];

    int v7 = v31;
    if ((v9 & 1) == 0)
    {
      if ([(id)UIApp _isSpringBoard])
      {
        double v10 = [v31 window];
        [v10 bounds];
        CGFloat v12 = v11;
        CGFloat v14 = v13;
        CGFloat v16 = v15;
        CGFloat v18 = v17;
        [v31 bounds];
        objc_msgSend(v31, "convertRect:toView:", 0);
        v34.origin.x = v19;
        v34.origin.y = v20;
        v34.size.width = v21;
        v34.size.height = v22;
        v33.origin.x = v12;
        v33.origin.y = v14;
        v33.size.width = v16;
        v33.size.height = v18;
        BOOL v23 = CGRectContainsRect(v33, v34);

        if (!v23) {
          [v31 setHidden:1];
        }
      }
      uint64_t v24 = [v31 window];
      [v24 _rotationDuration];
      double v26 = v25;

      v27 = [(UIPeripheralHost *)self containerRootController];
      [v27 _prepareForRotationToOrientation:a4 duration:v26];

      BOOL v28 = +[_UIRemoteKeyboards enabled];
      int v7 = v31;
      if (v28)
      {
        int v29 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        int v30 = [v29 inputWindowRootViewController];

        [v30 _prepareForRotationToOrientation:a4 duration:v26];
        int v7 = v31;
      }
    }
  }
}

- (void)rotateKeyboard:(id)a3 toOrientation:(int64_t)a4
{
  id v6 = a3;
  int v7 = v6;
  if (v6)
  {
    double v17 = v6;
    int v8 = [v6 window];
    char v9 = [v8 _isTextEffectsWindow];

    int v7 = v17;
    if ((v9 & 1) == 0)
    {
      double v10 = [v17 window];
      [v10 _rotationDuration];
      double v12 = v11;

      double v13 = [(UIPeripheralHost *)self containerRootController];
      [v13 _rotateToOrientation:a4 duration:v12];

      BOOL v14 = +[_UIRemoteKeyboards enabled];
      int v7 = v17;
      if (v14)
      {
        double v15 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        CGFloat v16 = [v15 inputWindowRootViewController];

        [v16 _rotateToOrientation:a4 duration:v12];
        int v7 = v17;
      }
    }
  }
}

- (void)finishRotationOfKeyboard:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    double v12 = v4;
    id v6 = [v4 window];
    char v7 = [v6 _isTextEffectsWindow];

    id v5 = v12;
    if ((v7 & 1) == 0)
    {
      if ([(id)UIApp _isSpringBoard]) {
        [v12 setHidden:0];
      }
      int v8 = [(UIPeripheralHost *)self containerRootController];
      [v8 _finishRotationFromInterfaceOrientation:0];

      BOOL v9 = +[_UIRemoteKeyboards enabled];
      id v5 = v12;
      if (v9)
      {
        double v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        double v11 = [v10 inputWindowRootViewController];

        [v11 _finishRotationFromInterfaceOrientation:0];
        id v5 = v12;
      }
    }
  }
}

- (id)_sceneForFirstResponder:(id)a3
{
  BOOL v3 = [a3 _responderWindow];
  id v4 = [v3 windowScene];

  return v4;
}

- (BOOL)animationsEnabled
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 responder];
  id v5 = [(UIPeripheralHost *)self _sceneForFirstResponder:v4];
  id v6 = +[UITextEffectsHostingInfo hostingInfoForWindowScene:v5];
  char v7 = [v6 useHostedInstance];

  BOOL v8 = (v7 & 1) != 0 || [(id)UIApp applicationState] != 2;
  BOOL v9 = self->_disableAnimationsCount < 1 && v8;

  return v9;
}

- (void)forceOrderInAutomatic
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 forceOrderInAutomaticAnimated:1];
}

- (void)forceOrderOutAutomatic
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 forceOrderOutAutomaticAnimated:1];
}

- (void)forceOrderInAutomaticAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 forceOrderInAutomaticAnimated:v3];
}

- (void)forceOrderOutAutomaticAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 forceOrderOutAutomaticAnimated:v3];
}

- (void)forceOrderInAutomaticFromDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v6 forceOrderInAutomaticFromDirection:v5 withDuration:a4];
}

- (void)forceOrderOutAutomaticToDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v6 forceOrderOutAutomaticToDirection:v5 withDuration:a4];
}

- (void)orderInAutomatic
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v4 automaticAppearanceReallyEnabled])
  {
    id v2 = [v4 nextAnimationStyle];
    BOOL v3 = [v2 legacyAnimationCopy];

    [v4 orderInWithAnimationStyle:v3];
  }
}

- (void)orderInAutomaticSkippingAnimation
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v4 automaticAppearanceReallyEnabled])
  {
    id v2 = [v4 nextAnimationStyle];
    BOOL v3 = [v2 legacyAnimationCopy];

    [v3 setAnimated:0];
    [v4 orderInWithAnimationStyle:v3];
  }
}

- (void)orderInAutomaticFromDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v7 automaticAppearanceReallyEnabled])
  {
    id v6 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:a4 > 0.0 duration:v5 outDirection:a4];
    [v7 orderInWithAnimationStyle:v6];
  }
}

- (void)orderOutAutomatic
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v4 automaticAppearanceReallyEnabled])
  {
    id v2 = [v4 nextAnimationStyle];
    BOOL v3 = [v2 legacyAnimationCopy];

    [v4 orderOutWithAnimationStyle:v3];
  }
}

- (void)orderOutAutomaticSkippingAnimation
{
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v4 automaticAppearanceReallyEnabled])
  {
    id v2 = [v4 nextAnimationStyle];
    BOOL v3 = [v2 legacyAnimationCopy];

    [v3 setAnimated:0];
    [v4 orderOutWithAnimationStyle:v3];
  }
}

- (void)orderOutAutomaticToDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  if ([v7 automaticAppearanceReallyEnabled])
  {
    id v6 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:a4 > 0.0 duration:v5 outDirection:a4];
    [v7 orderOutWithAnimationStyle:v6];
  }
}

- (void)setDocumentInputMode:(id)a3
{
  id v6 = [a3 primaryLanguage];
  id v4 = +[UIKeyboardInputMode keyboardInputModeWithIdentifier:v6];
  documentInputMode = self->_documentInputMode;
  self->_documentInputMode = v4;
}

- (BOOL)automaticAppearanceEnabled
{
  return self->_automaticAppearanceEnabled;
}

- (void)setAutomaticAppearanceEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabled = a3;
}

- (UIKeyboardRotationState)rotationState
{
  return self->_rotationState;
}

- (void)setRotationState:(id)a3
{
}

- (UIResponder)responder
{
  return self->_responder;
}

- (void)setResponder:(id)a3
{
}

- (BOOL)animationFencingEnabled
{
  return self->_animationFencingEnabled;
}

- (void)setAnimationFencingEnabled:(BOOL)a3
{
  self->_animationFencingEnabled = a3;
}

- (UIInputViewSet)_inputViews
{
  return self->_inputViewSet;
}

- (UIInputViewSet)_transientInputViews
{
  return self->_transientInputViewSet;
}

- (void)set_transientInputViews:(id)a3
{
}

- (UITextInputMode)documentInputMode
{
  return self->_documentInputMode;
}

- (void)setCurrentState:(int)a3
{
  self->_currentState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentInputMode, 0);
  objc_storeStrong((id *)&self->_transientInputViewSet, 0);
  objc_storeStrong((id *)&self->_rotationState, 0);
  objc_storeStrong((id *)&self->_deferredTransitionTasks, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_targetStateStack, 0);
  objc_storeStrong((id *)&self->_displayLink, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
}

- (BOOL)hasCustomInputView
{
  BOOL v3 = [(UIPeripheralHost *)self inputViews];
  id v4 = [v3 inputView];
  if (v4)
  {
    uint64_t v5 = [(UIPeripheralHost *)self inputViews];
    id v6 = [v5 keyboard];
    BOOL v7 = v6 == 0;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (CGSize)totalPeripheralSizeForOrientation:(int64_t)a3
{
  uint64_t v5 = [(UIPeripheralHost *)self inputViews];
  [(UIPeripheralHost *)self sizeOfInputViewForInputViewSet:v5 withInterfaceOrientation:a3];
  double v7 = v6;
  double v9 = v8;

  if ([(UIPeripheralHost *)self hasCustomInputView])
  {
    double v10 = [(UIPeripheralHost *)self inputViews];
    [v10 inputViewBounds];
    double v9 = v11;
  }
  double v12 = [(UIPeripheralHost *)self inputViews];
  double v13 = [v12 inputAccessoryView];

  if (v13)
  {
    BOOL v14 = [(UIPeripheralHost *)self inputViews];
    double v15 = [v14 inputView];

    if (!v15) {
      double v9 = 0.0;
    }
    CGFloat v16 = [(UIPeripheralHost *)self inputViews];
    [v16 inputAccessoryViewBounds];
    double v9 = v9 + v17;
  }
  CGFloat v18 = [(UIPeripheralHost *)self inputViews];
  [v18 keyboard];

  double v19 = v7;
  double v20 = v9;
  result.height = v20;
  result.width = v19;
  return result;
}

- (BOOL)userInfoContainsActualGeometryChange:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKey:@"UIKeyboardFrameBeginUserInfoKey"];
  [v4 CGRectValue];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;

  double v13 = [v3 objectForKey:@"UIKeyboardFrameEndUserInfoKey"];

  [v13 CGRectValue];
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;

  v23.origin.x = v6;
  v23.origin.y = v8;
  v23.size.width = v10;
  v23.size.height = v12;
  v24.origin.x = v15;
  v24.origin.y = v17;
  v24.size.width = v19;
  v24.size.height = v21;
  return !CGRectEqualToRect(v23, v24);
}

- (CGRect)screenRectFromBounds:(CGRect)a3 atCenter:(CGPoint)a4 applyingSourceHeightDelta:(double)a5
{
  double x = a4.x;
  double width = a3.size.width;
  double y = a3.origin.y;
  double v8 = a3.origin.x;
  CGFloat v10 = a3.size.height + a5;
  CGFloat v11 = a4.y + a5 * 0.5;
  CGFloat v12 = [(UIPeripheralHost *)self containerWindow];
  objc_msgSend(v12, "convertRect:toWindow:", 0, v8, y, width, v10);
  double v14 = v13;
  double v16 = v15;

  CGFloat v17 = [(UIPeripheralHost *)self containerWindow];
  objc_msgSend(v17, "convertPoint:toWindow:", 0, x, v11);
  double v19 = v18;
  double v21 = v20;

  double v22 = v19 - v14 * 0.5;
  double v23 = v21 - v16 * 0.5;
  double v24 = v14;
  double v25 = v16;
  result.size.height = v25;
  result.size.double width = v24;
  result.origin.double y = v23;
  result.origin.double x = v22;
  return result;
}

- (id)userInfoFromGeometry:(UIPeripheralAnimationGeometry *)a3 duration:(double)a4 forWill:(BOOL)a5 forShow:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v10 = 24;
  if (a6) {
    uint64_t v10 = 8;
  }
  uint64_t v11 = 16;
  if (a6) {
    uint64_t v11 = 0;
  }
  double v12 = *(double *)((char *)&a3->outPosition.x + v11);
  double v13 = *(double *)((char *)&a3->outPosition.x + v10);
  if (a6 && ![(UIPeripheralHost *)self isUndocked])
  {
    double v16 = [(UIPeripheralHost *)self inputViews];
    int v17 = [v16 isSplit];
    uint64_t v18 = 16;
    if (v17)
    {
      uint64_t v18 = 0;
      p_inPosition = a3;
    }
    else
    {
      p_inPosition = (UIPeripheralAnimationGeometry *)&a3->inPosition;
    }
    double x = *(double *)((char *)&a3->outPosition.x + v18);
    double y = p_inPosition->outPosition.y;
  }
  else
  {
    double x = a3->outPosition.x;
    double y = a3->outPosition.y;
  }
  if (v7)
  {
    -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, v12, v13, -a3->targetFrameHeightDelta);
    double v82 = v21;
    double v83 = v20;
    double v80 = v23;
    double v81 = v22;
    -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, x, y, 0.0);
    double v25 = v24;
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    uint64_t v32 = 7;
  }
  else
  {
    CGRect v33 = [(UIPeripheralHost *)self targetState];
    CGRect v34 = [v33 screenGeometry];
    v35 = [v34 objectForKey:@"UIKeyboardFrameBeginUserInfoKey"];
    [v35 CGRectValue];
    double v82 = v37;
    double v83 = v36;
    double v80 = v39;
    double v81 = v38;

    v40 = [(UIPeripheralHost *)self targetState];
    v41 = [v40 screenGeometry];
    double v42 = [v41 objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
    [v42 CGRectValue];
    double v25 = v43;
    double v27 = v44;
    double v29 = v45;
    double v31 = v46;

    uint64_t v32 = 5;
  }
  if ([(UIPeripheralHost *)self isUndocked])
  {
    double v47 = [(UIPeripheralHost *)self inputViews];
    double v48 = [v47 inputView];

    if (v48)
    {
      if (v6)
      {
        tdouble x = a3->transform.tx;
        tdouble y = a3->transform.ty;
        double v51 = x + tx;
        double v52 = y + ty;
        -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, v12 + tx, v13 + ty, -a3->targetFrameHeightDelta);
        double v82 = v54;
        double v83 = v53;
        double v80 = v56;
        double v81 = v55;
        -[UIPeripheralHost screenRectFromBounds:atCenter:applyingSourceHeightDelta:](self, "screenRectFromBounds:atCenter:applyingSourceHeightDelta:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height, v51, v52, -a3->targetFrameHeightDelta);
        double v25 = v57;
        double v27 = v58;
        double v29 = v59;
        double v31 = v60;
      }
    }
  }
  v61 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:v32];
  int v62 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v83, v82, v81, v80);
  [v61 setObject:v62 forKey:@"UIKeyboardFrameBeginUserInfoKey"];

  int v63 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v25, v27, v29, v31);
  [v61 setObject:v63 forKey:@"UIKeyboardFrameEndUserInfoKey"];

  int v64 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", v12, v13);
  [v61 setObject:v64 forKey:@"UIKeyboardCenterBeginUserInfoKey"];

  v65 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGPoint:", x, y);
  [v61 setObject:v65 forKey:@"UIKeyboardCenterEndUserInfoKey"];

  v66 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", a3->bounds.origin.x, a3->bounds.origin.y, a3->bounds.size.width, a3->bounds.size.height);
  [v61 setObject:v66 forKey:@"UIKeyboardBoundsUserInfoKey"];

  id v67 = NSNumber;
  v68 = +[UIKeyboardImpl activeInstance];
  v69 = objc_msgSend(v67, "numberWithBool:", objc_msgSend(v68, "splitTransitionInProgress"));
  [v61 setObject:v69 forKey:@"UIKeyboardFrameChangedByUserInteraction"];

  if (v7)
  {
    v70 = [NSNumber numberWithDouble:a4];
    [v61 setObject:v70 forKey:@"UIKeyboardAnimationDurationUserInfoKey"];

    v71 = [NSNumber numberWithInteger:7];
    [v61 setObject:v71 forKey:@"UIKeyboardAnimationCurveUserInfoKey"];

    id v72 = [(UIPeripheralHost *)self targetState];

    if (v72)
    {
      v73 = (void *)MEMORY[0x1E4F1C9E8];
      id v74 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v83, v82, v81, v80);
      id v75 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", v25, v27, v29, v31);
      v76 = objc_msgSend(v73, "dictionaryWithObjectsAndKeys:", v74, @"UIKeyboardFrameBeginUserInfoKey", v75, @"UIKeyboardFrameEndUserInfoKey", 0);
      id v77 = [(UIPeripheralHost *)self targetState];
      [v77 setScreenGeometry:v76];
    }
  }
  return v61;
}

- (id)transitioningView
{
  id v2 = [(UIPeripheralHost *)self view];
  id v3 = [v2 superview];

  return v3;
}

- (CGRect)transitioningFrame
{
  id v2 = [(UIPeripheralHost *)self containerRootController];
  [v2 transitioningFrame];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;

  double v11 = v4;
  double v12 = v6;
  double v13 = v8;
  double v14 = v10;
  result.size.height = v14;
  result.size.double width = v13;
  result.origin.double y = v12;
  result.origin.double x = v11;
  return result;
}

- (void)updateToPlacement:(id)a3 withNormalAnimationsAndNotifications:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIPeripheralHost *)self containerRootController];
  [v7 updateToPlacement:v6 withNormalAnimationsAndNotifications:v4];
}

- (void)setInputViewsHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(UIPeripheralHost *)self containerRootController];
  [v4 setInputViewsHidden:v3];
}

- (id)_screenForFirstResponder:(id)a3
{
  BOOL v3 = [a3 _responderWindow];
  id v4 = [v3 screen];

  if ([v4 _userInterfaceIdiom] == 3)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = +[UIScreen mainScreen];
  }
  id v6 = v5;

  return v6;
}

- (id)containerWindow
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v3 = [v2 containerWindow];

  return v3;
}

- (id)existingContainerRootController
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v3 = [v2 existingContainerRootController];

  return v3;
}

- (id)transformedContainerView
{
  BOOL v3 = [(UIPeripheralHost *)self existingContainerRootController];
  id v4 = [v3 view];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIPeripheralHost *)self containerWindow];
  }
  id v7 = v6;

  return v7;
}

- (void)queueDelayedTask:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F29238];
  id v5 = a3;
  id v6 = [v4 valueWithPointer:self];
  [(UIPeripheralHost *)self queueDelayedTask:v5 forKey:v6];
}

- (void)queueDelayedTask:(id)a3 forKey:(id)a4
{
}

- (void)queueDelayedTask:(id)a3 forKey:(id)a4 delay:(double)a5
{
  double v8 = (void (**)(void))a3;
  id v9 = a4;
  double v10 = [(NSMutableDictionary *)self->_deferredTransitionTasks objectForKey:v9];
  if (v10)
  {
    double v11 = v10;
    double v12 = _Block_copy(v10);
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    double v25 = __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke_2;
    double v26 = &unk_1E52DE9A0;
    id v27 = v12;
    double v28 = v8;
    id v13 = v12;
    double v14 = (void *)[&v23 copy];

    deferredTransitionTasks = self->_deferredTransitionTasks;
    double v16 = _Block_copy(v14);
    -[NSMutableDictionary setObject:forKey:](deferredTransitionTasks, "setObject:forKey:", v16, v9, v23, v24, v25, v26);
  }
  else
  {
    int v17 = [(UIPeripheralHost *)self existingContainerRootController];
    int v18 = [v17 isTransitionStarted];

    if (v18)
    {
      v8[2](v8);
    }
    else
    {
      double v19 = (void *)[v8 copy];
      double v20 = self->_deferredTransitionTasks;
      double v21 = _Block_copy(v19);
      [(NSMutableDictionary *)v20 setObject:v21 forKey:v9];

      dispatch_time_t v22 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke;
      block[3] = &unk_1E52D9F98;
      block[4] = self;
      id v30 = v9;
      dispatch_after(v22, MEMORY[0x1E4F14428], block);
    }
  }
}

void __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 264) objectForKey:*(void *)(a1 + 40)];
  if (v2)
  {
    id v7 = v2;
    [*(id *)(*(void *)(a1 + 32) + 264) removeObjectForKey:*(void *)(a1 + 40)];
    BOOL v3 = [*(id *)(a1 + 32) existingContainerRootController];
    if ([v3 isTransitioning])
    {
      id v4 = [*(id *)(a1 + 32) existingContainerRootController];
      int v5 = [v4 isTransitionStarted];

      id v6 = v7;
      if (!v5)
      {
        [*(id *)(a1 + 32) queueDelayedTask:v7 forKey:*(void *)(a1 + 40)];
LABEL_7:
        id v2 = v7;
        goto LABEL_8;
      }
    }
    else
    {

      id v6 = v7;
    }
    v6[2]();
    goto LABEL_7;
  }
LABEL_8:
}

uint64_t __65__UIPeripheralHost_UIKitInternal__queueDelayedTask_forKey_delay___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)flushDelayedTasks
{
  id v3 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [(UIPeripheralHost *)self flushDelayedTasksForKey:v3];
}

- (void)flushDelayedTasksForKey:(id)a3
{
  id v5 = a3;
  -[NSMutableDictionary objectForKey:](self->_deferredTransitionTasks, "objectForKey:");
  id v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    [(NSMutableDictionary *)self->_deferredTransitionTasks removeObjectForKey:v5];
    v4[2](v4);
  }
}

- (BOOL)hasDelayedTasksForKey:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_deferredTransitionTasks objectForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)containerTextEffectsWindow
{
  id v2 = [(UIPeripheralHost *)self containerWindow];
  if ([v2 _isTextEffectsWindow]) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (id)containerTextEffectsWindowAboveStatusBar
{
  id v2 = [(UIPeripheralHost *)self containerTextEffectsWindow];
  id v3 = [v2 aboveStatusBarWindow];

  return v3;
}

- (void)_updateContainerWindowLevel
{
  id v4 = [(UIPeripheralHost *)self inputViews];
  id v3 = [(UIPeripheralHost *)self responder];
  [(UIPeripheralHost *)self setTextEffectsWindowLevelForInputView:v4 responder:v3];
}

- (void)setTextEffectsWindowLevelForInputView:(id)a3 responder:(id)a4
{
  id v24 = a4;
  if (![a3 isEmpty]
    || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), id v6 = objc_claimAutoreleasedReturnValue(), v7 = [v6 hasAnyHostedViews], v6, v7))
  {
    uint64_t v8 = [v24 _responderWindow];
    if (v8)
    {
      id v9 = (void *)v8;
      double v10 = [v24 _responderWindow];
      double v11 = [(UIPeripheralHost *)self containerTextEffectsWindow];

      if (v10 != v11)
      {
        double v12 = [(UIPeripheralHost *)self containerTextEffectsWindow];
        char v13 = [v12 _isHostedInAnotherProcess];

        if ((v13 & 1) == 0)
        {
          double v14 = [v24 _responderWindow];
          [v14 level];
          double v16 = v15;

          int v17 = [v24 _responderWindow];
          int v18 = -[UIWindow _fbsScene](v17);
          double v19 = [v18 settings];
          [v19 level];
          double v21 = v20;

          dispatch_time_t v22 = [(UIPeripheralHost *)self containerTextEffectsWindow];
          [v22 _setWindowLevel:v16 + 1.0];

          uint64_t v23 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
          [v23 setWindowLevel:v24 sceneLevel:v16 + 2.0 forResponder:v21 + 2.0];
        }
      }
    }
  }
}

- (void)forceReloadInputViews
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v2 = [v3 responder];
  [v3 _reloadInputViewsForResponder:v2];
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4
{
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5
{
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5 updatePlacement:(BOOL)a6
{
}

- (void)setDeactivatedKeyboard:(BOOL)a3 forScene:(id)a4 forSuppressionAssertion:(BOOL)a5 updatePlacement:(BOOL)a6 wantsAssistant:(BOOL)a7 keepAccessories:(BOOL)a8
{
  BOOL v30 = a8;
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  BOOL v11 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  double v14 = _UIPeripheralHostLogger();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)&buf[4] = v11;
    LOWORD(v39) = 2112;
    *(void *)((char *)&v39 + 2) = v13;
    WORD5(v39) = 1024;
    HIDWORD(v39) = v10;
    _os_log_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEFAULT, "setDeactivatedKeyboard: %d forScene: %@ forSuppressionAssertion: %d", buf, 0x18u);
  }

  if (!v13)
  {
    double v15 = [(UIPeripheralHost *)self containerWindow];
    double v16 = [v15 screen];
    id v13 = +[_UISceneLifecycleMultiplexer mostActiveWindowSceneOnScreen:v16];

    if (!v13)
    {
      int v17 = [(UIPeripheralHost *)self containerWindow];
      id v13 = [v17 windowScene];
    }
  }
  *(void *)buf = 0;
  *(void *)&long long v39 = buf;
  *((void *)&v39 + 1) = 0x3032000000;
  v40 = __Block_byref_object_copy__136;
  v41 = __Block_byref_object_dispose__136;
  id v42 = 0;
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __138__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant_keepAccessories___block_invoke;
  v33[3] = &unk_1E52FD118;
  id v18 = v13;
  id v34 = v18;
  v35 = buf;
  +[UIKeyboardSceneDelegate performOnControllers:v33];
  double v19 = *(void **)(v39 + 40);
  if (v19 || !v11)
  {
    double v20 = [v19 containerRootController];
    double v21 = [*(id *)(v39 + 40) nextAnimationStyle];
    dispatch_time_t v22 = *(void **)(v39 + 40);
    if (v11)
    {
      uint64_t v23 = [*(id *)(v39 + 40) deactivationCount];
      [v22 setDeactivationCount:v23 + 1];
      if (v23)
      {
        BOOL v24 = 0;
      }
      else
      {
        double v25 = +[UIKeyboardImpl activeInstance];
        int v26 = [v25 showsCandidateBar];

        if (v26)
        {
          id v27 = +[UIKeyboardImpl activeInstance];
          double v28 = [v27 candidateController];
          [v28 collapse];
        }
        BOOL v24 = 1;
      }
    }
    else
    {
      if ([*(id *)(v39 + 40) deactivationCount]) {
        objc_msgSend(*(id *)(v39 + 40), "setDeactivationCount:", objc_msgSend(*(id *)(v39 + 40), "deactivationCount") - 1);
      }
      BOOL v24 = [*(id *)(v39 + 40) deactivationCount] == 0;
    }
    double v29 = _UIPeripheralHostLogger();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)double v36 = 67109120;
      BOOL v37 = v24;
      _os_log_impl(&dword_1853B0000, v29, OS_LOG_TYPE_DEFAULT, "setDeactivatedKeyboard, shouldUpdatePlacement: %d", v36, 8u);
    }

    if (v24)
    {
      if (v9)
      {
        [(UIPeripheralHost *)self updatePlacementForDeactivatedKeyboard:v11 forSuppressionAssertion:v10 wantsAssistant:v8 keepAccessories:v30 animationStyle:v21];
      }
      else
      {
        v31[0] = MEMORY[0x1E4F143A8];
        v31[1] = 3221225472;
        v31[2] = __138__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant_keepAccessories___block_invoke_321;
        v31[3] = &__block_descriptor_33_e33_v16__0__UIInputWindowController_8l;
        BOOL v32 = v11;
        [(UIPeripheralHost *)self performMultipleOperations:v31 withAnimationStyle:v21];
      }
    }
  }
  _Block_object_dispose(buf, 8);
}

void __138__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant_keepAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v4 = [v6 scene];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  }
}

void __138__UIPeripheralHost_UIKitInternal__setDeactivatedKeyboard_forScene_forSuppressionAssertion_updatePlacement_wantsAssistant_keepAccessories___block_invoke_321(uint64_t a1, void *a2)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 32);
  id v3 = a2;
  id v4 = [v3 placement];
  [v3 setPlacementChangeDisabled:v2 withPlacement:v4];
}

- (void)updatePlacementForDeactivatedKeyboard:(BOOL)a3 forSuppressionAssertion:(BOOL)a4 wantsAssistant:(BOOL)a5 keepAccessories:(BOOL)a6 animationStyle:(id)a7
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __143__UIPeripheralHost_UIKitInternal__updatePlacementForDeactivatedKeyboard_forSuppressionAssertion_wantsAssistant_keepAccessories_animationStyle___block_invoke;
  v7[3] = &__block_descriptor_36_e33_v16__0__UIInputWindowController_8l;
  BOOL v8 = a3;
  BOOL v9 = a4;
  BOOL v10 = a5;
  BOOL v11 = a6;
  [(UIPeripheralHost *)self performMultipleOperations:v7 withAnimationStyle:a7];
}

void __143__UIPeripheralHost_UIKitInternal__updatePlacementForDeactivatedKeyboard_forSuppressionAssertion_wantsAssistant_keepAccessories_animationStyle___block_invoke(unsigned __int8 *a1, void *a2)
{
  id v3 = a2;
  id v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  uint64_t v4 = a1[32];
  id v5 = [v3 placement];
  id v6 = [v7 _placementForDeactivatedKeyboard:v4 currentPlacement:v5 forSuppressionAssertion:a1[33] wantsAssistant:a1[34] keepAccessories:a1[35]];

  [v3 setPlacementChangeDisabled:a1[32] withPlacement:v6];
}

- (int)_isKeyboardDeactivated
{
  uint64_t v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v3 = [v2 deactivationCount];

  return v3;
}

- (void)performWithoutDeactivation:(id)a3
{
  BOOL v8 = (void (**)(void))a3;
  uint64_t v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v5 = [v4 deactivationCount];
  if (v5)
  {
    [v4 setDeactivationCount:1];
    id v6 = [v4 scene];
    [(UIPeripheralHost *)self setDeactivatedKeyboard:0 forScene:v6];

    v8[2]();
    id v7 = [v4 scene];
    [(UIPeripheralHost *)self setDeactivatedKeyboard:1 forScene:v7];

    objc_msgSend(v4, "setDeactivationCount:", objc_msgSend(v4, "deactivationCount") + v5 - 1);
  }
  else
  {
    v8[2]();
  }
}

- (id)lastUsedInputModeForCurrentContext
{
  uint64_t v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  int v3 = [v2 responder];

  uint64_t v4 = [v3 textInputContextIdentifier];

  if (v4)
  {
    int v5 = +[UIKeyboardInputModeController sharedInputModeController];
    id v6 = [v3 textInputMode];
    uint64_t v4 = [v5 lastUsedInputModeForTextInputMode:v6];
  }
  return v4;
}

+ (Class)hostViewClass
{
  return (Class)objc_opt_class();
}

- (BOOL)automaticAppearanceInternalEnabled
{
  return self->_automaticAppearanceEnabledInternal;
}

- (void)setAutomaticAppearanceInternalEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabledInternal = a3;
}

- (CGRect)visiblePeripheralFrame:(BOOL)a3
{
  BOOL v3 = a3;
  int v5 = [(UIPeripheralHost *)self targetState];

  if (v5 && v3)
  {
    id v6 = [(UIPeripheralHost *)self targetState];
    id v7 = v6;
    if (v6)
    {
      [v6 geometry];
      double v8 = v66;
      double v9 = v65;
    }
    else
    {
      double v8 = 0.0;
      double v9 = 0.0;
    }

    BOOL v30 = [(UIPeripheralHost *)self targetState];
    int v31 = [v30 inPositionIsDestination];
    BOOL v32 = [(UIPeripheralHost *)self targetState];
    CGRect v33 = v32;
    if (v31)
    {
      if (v32)
      {
        [v32 geometry];
        double v34 = v64;
        double v35 = v63;
      }
      else
      {
        double v35 = 0.0;
        double v34 = 0.0;
      }
    }
    else if (v32)
    {
      [v32 geometry];
      double v34 = *((double *)&v55 + 1);
      double v35 = *(double *)&v55;
    }
    else
    {
      uint64_t v62 = 0;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      double v35 = 0.0;
      double v34 = 0.0;
      long long v55 = 0u;
    }

    double v36 = [(UIPeripheralHost *)self view];
    BOOL v37 = [v36 window];
    +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v37, v35 - v9 * 0.5, v34 - v8 * 0.5, v9, v8);
    CGFloat v23 = v38;
    CGFloat v25 = v39;
    CGFloat v27 = v40;
    CGFloat v29 = v41;
  }
  else
  {
    BOOL v10 = [(UIPeripheralHost *)self view];
    BOOL v11 = [v10 superview];

    if (v11)
    {
      double v12 = [(UIPeripheralHost *)self view];
      [v12 bounds];
      double v14 = v13;
      double v16 = v15;
      double v18 = v17;
      double v20 = v19;
      double v21 = [(UIPeripheralHost *)self view];
      +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v21, v14, v16, v18, v20);
      CGFloat v23 = v22;
      CGFloat v25 = v24;
      CGFloat v27 = v26;
      CGFloat v29 = v28;
    }
    else
    {
      CGFloat v23 = *MEMORY[0x1E4F1DB20];
      CGFloat v25 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
      CGFloat v27 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
      CGFloat v29 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
    }
  }
  id v42 = +[UIScreen mainScreen];
  [v42 bounds];
  v70.origin.CGFloat x = v43;
  v70.origin.CGFloat y = v44;
  v70.size.CGFloat width = v45;
  v70.size.CGFloat height = v46;
  v67.origin.CGFloat x = v23;
  v67.origin.CGFloat y = v25;
  v67.size.CGFloat width = v27;
  v67.size.CGFloat height = v29;
  CGRect v68 = CGRectIntersection(v67, v70);
  CGFloat x = v68.origin.x;
  CGFloat y = v68.origin.y;
  CGFloat width = v68.size.width;
  CGFloat height = v68.size.height;

  double v51 = x;
  double v52 = y;
  double v53 = width;
  double v54 = height;
  result.size.CGFloat height = v54;
  result.size.CGFloat width = v53;
  result.origin.CGFloat y = v52;
  result.origin.CGFloat x = v51;
  return result;
}

+ (BOOL)inputViewSetContainsView:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[UIPeripheralHost sharedInstance];
  int v5 = [v4 containerRootController];
  char v6 = [v5 inputViewSetContainsView:v3];

  return v6;
}

+ (CGRect)visibleInputViewFrame
{
  uint64_t v2 = +[UIPeripheralHost sharedInstance];
  if ([v2 isUndocked])
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    id v7 = [v2 containerRootController];
    [v7 visibleInputViewFrame];
    double v3 = v8;
    double v4 = v9;
    double v5 = v10;
    double v6 = v11;
  }
  double v12 = v3;
  double v13 = v4;
  double v14 = v5;
  double v15 = v6;
  result.size.CGFloat height = v15;
  result.size.CGFloat width = v14;
  result.origin.CGFloat y = v13;
  result.origin.CGFloat x = v12;
  return result;
}

+ (id)allVisiblePeripheralFrames
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [a1 sharedInstance];
  double v3 = [v2 containerRootController];
  if (v3)
  {
    double v17 = v2;
    double v4 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke;
    aBlock[3] = &unk_1E52FD180;
    id v16 = v4;
    id v25 = v16;
    double v5 = _Block_copy(aBlock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    double v6 = [v3 hosting];
    id v7 = [v6 allHostingItems];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v21 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke_2;
          v18[3] = &unk_1E52FD1A8;
          id v13 = v5;
          v18[4] = v12;
          id v19 = v13;
          objc_msgSend(v12, "enumerateBoundingRects:", v18, v16);
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v9);
    }

    id v14 = v16;
    uint64_t v2 = v17;
  }
  else
  {
    id v14 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v14;
}

void __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke(uint64_t a1, void *a2, double a3, double a4, double a5, double a6)
{
  id v39 = [a2 hostView];
  objc_msgSend(v39, "convertRect:toView:", 0, a3, a4, a5, a6);
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [v39 window];
  objc_msgSend(v19, "convertRect:toWindow:", 0, v12, v14, v16, v18);
  CGFloat v21 = v20;
  CGFloat v23 = v22;
  CGFloat v25 = v24;
  CGFloat v27 = v26;

  double v28 = +[UIScreen mainScreen];
  [v28 bounds];
  v44.origin.double x = v29;
  v44.origin.double y = v30;
  v44.size.double width = v31;
  v44.size.double height = v32;
  v41.origin.double x = v21;
  v41.origin.double y = v23;
  v41.size.double width = v25;
  v41.size.double height = v27;
  CGRect v42 = CGRectIntersection(v41, v44);
  double x = v42.origin.x;
  double y = v42.origin.y;
  double width = v42.size.width;
  double height = v42.size.height;

  v43.origin.double x = x;
  v43.origin.double y = y;
  v43.size.double width = width;
  v43.size.double height = height;
  if (!CGRectIsEmpty(v43))
  {
    BOOL v37 = *(void **)(a1 + 32);
    double v38 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGRect:", x, y, width, height);
    [v37 addObject:v38];
  }
}

uint64_t __61__UIPeripheralHost_UIKitInternal__allVisiblePeripheralFrames__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

+ (BOOL)pointIsWithinKeyboardContent:(CGPoint)a3
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  double v5 = +[UIScreen mainScreen];
  double v6 = [v5 coordinateSpace];
  id v7 = [v5 fixedCoordinateSpace];
  uint64_t v8 = +[UIPeripheralHost sharedInstance];
  uint64_t v9 = [v8 containerRootController];

  uint64_t v10 = [v9 inputViewSet];
  double v11 = [v10 inputView];

  if (v11)
  {
    [v9 visibleFrame];
    objc_msgSend(v7, "convertRect:fromCoordinateSpace:", v6);
    v14.CGFloat x = x;
    v14.CGFloat y = y;
    BOOL v12 = CGRectContainsPoint(v15, v14);
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

- (double)minimumOffsetForBuffer:(double)a3
{
  double v3 = a3;
  if (a3 == 0.0)
  {
    double v5 = [(UIPeripheralHost *)self containerWindow];
    double v6 = __UIStatusBarManagerForWindow(v5);
    [v6 statusBarHeight];
    double v3 = v7;
  }
  uint64_t v8 = [(UIPeripheralHost *)self containerWindow];
  [v8 bounds];
  double v10 = v9;

  [(UIPeripheralHost *)self totalPeripheralSizeForOrientation:+[UIKeyboardSceneDelegate interfaceOrientation]];
  return -(v10 - v11 - v3);
}

- (CGPoint)adjustedPersistentOffset
{
  if (+[UIKeyboardImpl rivenTranslationPreference])
  {
    +[UIKeyboardImpl persistentOffset];
    double v4 = v3;
    [(UIPeripheralHost *)self minimumOffsetForBuffer:92.0];
    if (v4 >= v5) {
      double v6 = v4;
    }
    else {
      double v6 = v5;
    }
    double v7 = 0.0;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DAD8];
    double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  result.CGFloat y = v6;
  result.CGFloat x = v7;
  return result;
}

- (void)setUndockedWithOffset:(CGPoint)a3 animated:(BOOL)a4
{
  LODWORD(v4) = a4;
  double y = a3.y;
  double x = a3.x;
  int v8 = 1;
  if (!+[UIKeyboardImpl isFloating])
  {
    double v9 = [(UIPeripheralHost *)self inputViews];
    int v10 = [v9 _inputViewIsSplit];
    if (y < 0.0) {
      int v8 = 1;
    }
    else {
      int v8 = v10;
    }
  }
  +[UIKeyboardImpl persistentOffset];
  if (y == v11) {
    uint64_t v4 = 0;
  }
  else {
    uint64_t v4 = v4;
  }
  self->_isTranslating = 1;
  +[UIKeyboardImpl setPersistentOffset:](UIKeyboardImpl, "setPersistentOffset:", x, y);
  BOOL v12 = [(UIPeripheralHost *)self containerWindow];
  [v12 frame];
  double v14 = v13;
  CGRect v15 = [(UIPeripheralHost *)self containerWindow];
  [v15 frame];
  double v17 = v16;

  if (v8)
  {
    double v18 = x / v14;
    double v19 = -y / v17;
    if (+[UIKeyboardImpl isFloating])
    {
      +[UIPeripheralHost floatingChromeBuffer];
      double v21 = v20;
      double v23 = v22;
      double v25 = v24;
      double v27 = v26;
      +[UIKeyboardImpl floatingWidth];
      +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v18, v19, v21, v23, v25, v27, v28);
    }
    else
    {
      +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", v18, v19, 92.0, 0.0, 0.0, 0.0);
    }
    id v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    CGFloat v29 = [(UIPeripheralHost *)self inputViews];
    id v36 = +[UIPeripheralHost endPlacementForInputViewSet:v29 windowScene:0];
  }
  CGFloat v30 = [(UIPeripheralHost *)self containerWindow];
  CGFloat v31 = [v30 screen];
  CGFloat v32 = +[UIKeyboardMotionSupport supportForScreen:v31];
  [v32 translateToPlacement:v36 animated:v4];

  CGRect v33 = +[UIKeyboardInputModeController sharedInputModeController];
  double v34 = [v33 currentInputMode];

  if ([v34 isExtensionInputMode] && (objc_msgSend(v34, "isDisplayed") & 1) == 0)
  {
    double v35 = +[UIKeyboardImpl activeInstance];
    [v35 postInputViewControllerShouldUpdateNotification:v34];
  }
}

+ (UIEdgeInsets)floatingChromeBuffer
{
  uint64_t v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v3 = [v2 inputViews];
  uint64_t v4 = [v3 inputAccessoryView];
  [v4 bounds];
  double v6 = v5;

  double v7 = [v2 containerWindow];
  int v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v9 = [v8 visualModeManager];
  char v10 = [v9 windowingModeEnabled];

  if (v10)
  {
    double v11 = 140.0;
  }
  else
  {
    [v7 slideOverWindowVerticalOffset];
    double v6 = v6 + v12;
    double v11 = 30.0;
  }
  double v13 = fmax(v11, v6);
  +[UIKeyboardImpl requestedFloatingInsets];
  double v15 = fmax(v14, 92.0);
  double v17 = fmax(v16, 0.0);
  double v19 = fmax(v13, v18);
  double v21 = fmax(v20, 0.0);

  double v22 = v15;
  double v23 = v17;
  double v24 = v19;
  double v25 = v21;
  result.right = v25;
  result.bottom = v24;
  result.left = v23;
  result.top = v22;
  return result;
}

+ (void)adjustFloatingPersistentOffsetForKeyboardSize:(CGSize)a3
{
  +[UIPeripheralHost adjustedFloatingOffsetForKeyboardSize:](UIPeripheralHost, "adjustedFloatingOffsetForKeyboardSize:", a3.width, a3.height);
  +[UIKeyboardImpl setFloatingPersistentOffset:](UIKeyboardImpl, "setFloatingPersistentOffset:");
}

+ (CGPoint)adjustedFloatingOffsetForKeyboardSize:(CGSize)a3
{
  double height = a3.height;
  +[UIKeyboardImpl floatingWidth];
  double v5 = v4;
  +[UIKeyboardImpl floatingPersistentOffset];
  double v7 = v6;
  double v43 = v8;
  double v44 = v6;
  double v9 = v8;
  char v10 = +[UIScreen mainScreen];
  [v10 bounds];
  double v12 = v11;
  double v14 = v13;

  +[UIInputViewSetPlacementFloating frameAtOffset:keyboardSize:screenSize:](UIInputViewSetPlacementFloating, "frameAtOffset:keyboardSize:screenSize:", v7, v9, v5, height, v12, v14);
  double v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  double v23 = +[UIScreen mainScreen];
  [v23 bounds];
  double v25 = v24;
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  +[UIPeripheralHost floatingChromeBuffer];
  CGFloat v33 = v25 + v32;
  CGFloat v35 = v27 + v34;
  CGFloat v37 = v29 - (v32 + v36);
  CGFloat v39 = v31 - (v34 + v38);

  double v41 = v44 + UIRectContainInRect(v16, v18, v20, v22, v33, v35, v37, v39) - v16;
  double v42 = v43 + v40 - v18;
  result.double y = v42;
  result.double x = v41;
  return result;
}

+ (CGPoint)defaultUndockedOffset
{
  BOOL v2 = +[UIKeyboardImpl isFloating];
  +[UIKeyboardImpl defaultUndockedOffsetForFloating:v2];
  result.double y = v4;
  result.double x = v3;
  return result;
}

+ (void)setFloating:(BOOL)a3 onCompletion:(id)a4
{
  BOOL v4 = a3;
  id v8 = a4;
  uint64_t v5 = +[UIKeyboardImpl isFloating] ^ v4;
  if (v5 == 1)
  {
    +[UIKeyboardImpl setFloating:v4];
    double v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v6 reloadPlacement];
  }
  double v7 = v8;
  if (v8)
  {
    (*((void (**)(id, uint64_t))v8 + 2))(v8, v5);
    double v7 = v8;
  }
}

- (void)moveToPersistentOffset
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    double v3 = [(UIPeripheralHost *)self inputViews];
    BOOL v4 = [v3 keyboard];
    char v5 = [v4 isMinimized];

    if ((v5 & 1) == 0)
    {
      +[UIKeyboardImpl persistentOffset];
      -[UIPeripheralHost setUndockedWithOffset:animated:](self, "setUndockedWithOffset:animated:", 0);
    }
  }
}

- (unint64_t)_clipCornersOfView:(id)a3
{
  BOOL v4 = [(UIPeripheralHost *)self _transientInputViews];
  char v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIPeripheralHost *)self inputViews];
  }
  double v7 = v6;

  id v8 = [v7 _splittableInputAccessoryView];
  double v9 = [v7 inputAccessoryView];

  if (v9)
  {
    if (v8)
    {
      [v8 leftContentViewSize];
      if (v10 == 0.0) {
        unint64_t v11 = 14;
      }
      else {
        unint64_t v11 = 12;
      }
      [v8 rightContentViewSize];
      if (v12 == 0.0) {
        v11 |= 1uLL;
      }
    }
    else
    {
      unint64_t v11 = 12;
    }
  }
  else
  {
    unint64_t v11 = 15;
  }

  return v11;
}

- (CGRect)_inputViewRectToAvoid
{
  if ([(UIPeripheralHost *)self _isSuppressedByManualKeyboard])
  {
    +[UIPeripheralHost visiblePeripheralFrame];
    CGFloat x = v3;
    CGFloat y = v5;
    CGFloat width = v7;
    CGFloat height = v9;
  }
  else
  {
    unint64_t v11 = [(UIPeripheralHost *)self inputViews];
    [v11 inputViewBounds];
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    CGFloat v20 = [(UIPeripheralHost *)self inputViews];
    double v21 = [v20 inputView];
    +[UIScreen convertRect:fromView:](UIScreen, "convertRect:fromView:", v21, v13, v15, v17, v19);
    CGFloat v23 = v22;
    CGFloat v25 = v24;
    CGFloat v27 = v26;
    CGFloat v29 = v28;

    double v30 = [(UIPeripheralHost *)self containerWindow];
    [v30 hostedFrame];
    v42.origin.CGFloat x = v31;
    v42.origin.CGFloat y = v32;
    v42.size.CGFloat width = v33;
    v42.size.CGFloat height = v34;
    v39.origin.CGFloat x = v23;
    v39.origin.CGFloat y = v25;
    v39.size.CGFloat width = v27;
    v39.size.CGFloat height = v29;
    CGRect v40 = CGRectIntersection(v39, v42);
    CGFloat x = v40.origin.x;
    CGFloat y = v40.origin.y;
    CGFloat width = v40.size.width;
    CGFloat height = v40.size.height;
  }
  double v35 = x;
  double v36 = y;
  double v37 = width;
  double v38 = height;
  result.size.CGFloat height = v38;
  result.size.CGFloat width = v37;
  result.origin.CGFloat y = v36;
  result.origin.CGFloat x = v35;
  return result;
}

- (double)ambiguousControlCenterActivationMargin
{
  return self->_ambiguousControlCenterActivationMargin;
}

- (BOOL)_isCoordinatingWithSystemGestures
{
  if (_UIApplicationIsExtension())
  {
    double v3 = +[UIWindowScene _keyWindowScene]();
    BOOL v4 = [v3 _topVisibleWindowPassingTest:&__block_literal_global_334_0];

    if (v4) {
      return 0;
    }
  }
  [(UIPeripheralHost *)self ambiguousControlCenterActivationMargin];
  if (v5 <= 0.0) {
    return 0;
  }
  return [(UIPeripheralHost *)self isOnScreen];
}

uint64_t __68__UIPeripheralHost_UIKitInternal___isCoordinatingWithSystemGestures__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 rootViewController];
  double v3 = [(id)v2 childViewControllers];
  BOOL v4 = [v3 firstObject];

  objc_opt_class();
  LOBYTE(v2) = objc_opt_isKindOfClass();

  return v2 & 1;
}

- (CGPoint)offHostPointForPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ([(UIPeripheralHost *)self isOnScreen])
  {
    [(UIPeripheralHost *)self _inputViewRectToAvoid];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    double v14 = [(UIPeripheralHost *)self transformedContainerView];
    +[UIScreen convertRect:toView:](UIScreen, "convertRect:toView:", v14, v7, v9, v11, v13);
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    v34.origin.double x = v16;
    v34.origin.double y = v18;
    v34.size.CGFloat width = v20;
    v34.size.CGFloat height = v22;
    v33.double x = x;
    v33.double y = y;
    if (CGRectContainsPoint(v34, v33))
    {
      CGFloat v23 = [(UIPeripheralHost *)self inputViews];
      int v24 = [v23 isSplit];

      if (v24)
      {
        CGFloat v25 = [(UIPeripheralHost *)self inputViews];
        [v25 _leftInputViewSetFrame];
        if (x <= CGRectGetWidth(v35))
        {
        }
        else
        {
          v36.origin.double x = v16;
          v36.origin.double y = v18;
          v36.size.CGFloat width = v20;
          v36.size.CGFloat height = v22;
          double Width = CGRectGetWidth(v36);
          CGFloat v27 = [(UIPeripheralHost *)self inputViews];
          [v27 _rightInputViewSetFrame];
          double v28 = Width - CGRectGetWidth(v37);

          if (x < v28) {
            goto LABEL_13;
          }
        }
      }
      if ([(UIPeripheralHost *)self isUndocked]
        && (v38.origin.double x = v16, v38.origin.y = v18, v38.size.width = v20, v38.size.height = v22, y >= CGRectGetMidY(v38)))
      {
        v40.origin.double x = v16;
        v40.origin.double y = v18;
        v40.size.CGFloat width = v20;
        v40.size.CGFloat height = v22;
        double MaxY = CGRectGetMaxY(v40);
      }
      else
      {
        v39.origin.double x = v16;
        v39.origin.double y = v18;
        v39.size.CGFloat width = v20;
        v39.size.CGFloat height = v22;
        double MaxY = CGRectGetMinY(v39);
      }
      double y = MaxY;
    }
  }
LABEL_13:
  double v30 = x;
  double v31 = y;
  result.double y = v31;
  result.double x = v30;
  return result;
}

- (double)getVerticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  if ([(UIPeripheralHost *)self isOnScreen] && ![(UIPeripheralHost *)self isUndocked])
  {
    double v9 = [(UIPeripheralHost *)self inputViews];
    if ([v9 _inputViewIsSplit]) {
      goto LABEL_7;
    }
    uint64_t v10 = [v6 window];
    if (!v10) {
      goto LABEL_7;
    }
    double v11 = (void *)v10;
    double v12 = [(UIPeripheralHost *)self inputViews];
    double v13 = [v12 inputView];
    if ([v6 isDescendantOfView:v13])
    {

LABEL_7:
      goto LABEL_8;
    }
    double v15 = [(UIPeripheralHost *)self inputViews];
    CGFloat v16 = [v15 inputAccessoryView];
    char v17 = [v6 isDescendantOfView:v16];

    if ((v17 & 1) == 0)
    {
      if (v7)
      {
        CGFloat v18 = [v7 objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
        [v18 CGRectValue];
      }
      else
      {
        CGFloat v18 = [(UIPeripheralHost *)self containerRootController];
        [v18 visibleFrame];
      }
      +[UIScreen convertRect:toView:](UIScreen, "convertRect:toView:", v6);
      CGFloat v20 = v19;
      CGFloat v22 = v21;
      CGFloat v24 = v23;
      CGFloat v26 = v25;

      v28.origin.double x = v20;
      v28.origin.double y = v22;
      v28.size.CGFloat width = v24;
      v28.size.CGFloat height = v26;
      if (!CGRectIsEmpty(v28))
      {
        [v6 bounds];
        double MaxY = CGRectGetMaxY(v29);
        v30.origin.double x = v20;
        v30.origin.double y = v22;
        v30.size.CGFloat width = v24;
        v30.size.CGFloat height = v26;
        double v8 = fmax(MaxY - CGRectGetMinY(v30), 0.0);
      }
    }
  }
LABEL_8:

  return v8;
}

- (BOOL)shouldUseHideNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3
{
  double v5 = [(UIPeripheralHost *)self containerWindow];
  [v5 bounds];
  double v7 = v6;

  double v8 = [(UIPeripheralHost *)self inputViews];
  double v9 = [v8 inputAccessoryView];
  if (v9) {
    BOOL v10 = 0;
  }
  else {
    BOOL v10 = a3->inPosition.y + a3->bounds.size.height * -0.5 >= v7;
  }

  return v10;
}

- (void)postWillShowNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3 duration:(double)a4
{
  long long v7 = *(_OWORD *)&a3->transform.c;
  long long v29 = *(_OWORD *)&a3->transform.a;
  long long v30 = v7;
  long long v31 = *(_OWORD *)&a3->transform.tx;
  double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  CGPoint inPosition = a3->inPosition;
  CGPoint outPosition = a3->outPosition;
  CGPoint v26 = inPosition;
  CGSize size = a3->bounds.size;
  CGPoint origin = a3->bounds.origin;
  CGSize v28 = size;
  BOOL v10 = +[UIPeripheralHostState stateWithGeometry:&outPosition inPositionIsDestination:1];
  [(UIPeripheralHost *)self setTargetState:v10];

  long long v11 = *(_OWORD *)&a3->transform.c;
  long long v29 = *(_OWORD *)&a3->transform.a;
  long long v30 = v11;
  long long v31 = *(_OWORD *)&a3->transform.tx;
  double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  CGPoint v12 = a3->inPosition;
  CGPoint outPosition = a3->outPosition;
  CGPoint v26 = v12;
  CGSize v13 = a3->bounds.size;
  CGPoint origin = a3->bounds.origin;
  CGSize v28 = v13;
  double v14 = [(UIPeripheralHost *)self userInfoFromGeometry:&outPosition duration:1 forWill:1 forShow:a4];
  BOOL v15 = [(UIPeripheralHost *)self userInfoContainsActualGeometryChange:v14];
  CGFloat v16 = @"UIKeyboardPrivateWillShowNotification";
  char v17 = @"UIKeyboardWillShowNotification";
  long long v18 = *(_OWORD *)&a3->transform.c;
  long long v29 = *(_OWORD *)&a3->transform.a;
  long long v30 = v18;
  long long v31 = *(_OWORD *)&a3->transform.tx;
  double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  CGPoint v19 = a3->inPosition;
  CGPoint outPosition = a3->outPosition;
  CGPoint v26 = v19;
  CGSize v20 = a3->bounds.size;
  CGPoint origin = a3->bounds.origin;
  CGSize v28 = v20;
  if ([(UIPeripheralHost *)self shouldUseHideNotificationForGeometry:&outPosition])
  {
    double v21 = @"UIKeyboardPrivateWillHideNotification";

    CGFloat v22 = @"UIKeyboardWillHideNotification";
    CGFloat v16 = v21;
    char v17 = v22;
  }
  [(UIPeripheralHost *)self postKeyboardFrameChangeNotification:@"UIKeyboardWillChangeFrameNotification" withInfo:v14];
  if (v15 && ![(UIPeripheralHost *)self isUndocked])
  {
    double v23 = [MEMORY[0x1E4F28EB8] defaultCenter];
    CGFloat v24 = [(UIPeripheralHost *)self _screenForFirstResponder:self->_responder];
    [v23 postNotificationName:v16 object:v24 userInfo:v14];

    [v23 postNotificationName:v17 object:0 userInfo:v14];
  }
}

- (void)postDidShowNotificationForGeometry:(UIPeripheralAnimationGeometry *)a3
{
  long long v5 = *(_OWORD *)&a3->transform.c;
  long long v23 = *(_OWORD *)&a3->transform.a;
  long long v24 = v5;
  long long v25 = *(_OWORD *)&a3->transform.tx;
  double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  CGPoint inPosition = a3->inPosition;
  CGPoint outPosition = a3->outPosition;
  CGPoint v20 = inPosition;
  CGSize size = a3->bounds.size;
  CGPoint origin = a3->bounds.origin;
  CGSize v22 = size;
  double v8 = [(UIPeripheralHost *)self userInfoFromGeometry:&outPosition duration:0 forWill:1 forShow:0.0];
  BOOL v9 = [(UIPeripheralHost *)self userInfoContainsActualGeometryChange:v8];
  BOOL v10 = @"UIKeyboardDidShowNotification";
  long long v11 = @"UIKeyboardPrivateDidShowNotification";
  long long v12 = *(_OWORD *)&a3->transform.c;
  long long v23 = *(_OWORD *)&a3->transform.a;
  long long v24 = v12;
  long long v25 = *(_OWORD *)&a3->transform.tx;
  double targetFrameHeightDelta = a3->targetFrameHeightDelta;
  CGPoint v13 = a3->inPosition;
  CGPoint outPosition = a3->outPosition;
  CGPoint v20 = v13;
  CGSize v14 = a3->bounds.size;
  CGPoint origin = a3->bounds.origin;
  CGSize v22 = v14;
  if ([(UIPeripheralHost *)self shouldUseHideNotificationForGeometry:&outPosition])
  {
    BOOL v15 = @"UIKeyboardDidHideNotification";

    CGFloat v16 = @"UIKeyboardPrivateDidHideNotification";
    BOOL v10 = v15;
    long long v11 = v16;
  }
  [(UIPeripheralHost *)self postKeyboardFrameChangeNotification:@"UIKeyboardDidChangeFrameNotification" withInfo:v8];
  if (v9 && ![(UIPeripheralHost *)self isUndocked])
  {
    char v17 = [MEMORY[0x1E4F28EB8] defaultCenter];
    long long v18 = [(UIPeripheralHost *)self _screenForFirstResponder:self->_responder];
    [v17 postNotificationName:v11 object:v18 userInfo:v8];

    [v17 postNotificationName:v10 object:0 userInfo:v8];
  }
  [(UIPeripheralHost *)self setTargetState:0];
}

- (void)performMultipleOperations:(id)a3 withAnimationStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[_UIRemoteKeyboards enabled])
  {
    double v8 = [MEMORY[0x1E4F1CA48] array];
    BOOL v9 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke;
    v21[3] = &unk_1E52EDDC0;
    id v22 = v8;
    id v24 = v6;
    id v23 = v7;
    id v10 = v8;
    [v9 performOnControllers:v21];
  }
  else
  {
    long long v11 = [(UIPeripheralHost *)self containerRootController];
    long long v12 = [v11 inputViewSet];
    uint64_t v13 = [v12 inputView];
    if (v13)
    {
      CGSize v14 = (void *)v13;
      BOOL v15 = [(UIPeripheralHost *)self containerRootController];
      CGFloat v16 = [v15 inputViewSet];
      char v17 = [v16 isCustomInputView];

      if ((v17 & 1) == 0)
      {
        long long v18 = [(UIPeripheralHost *)self containerRootController];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_3;
        v19[3] = &unk_1E52DB330;
        v19[4] = self;
        id v20 = v6;
        [v18 performOperations:v19 withAnimationStyle:v7];
      }
    }
    else
    {
    }
  }
}

void __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v5 = 0;
      goto LABEL_9;
    }
    id v4 = [v3 owner];
  }
  id v5 = v4;
  if (v4 && ([*(id *)(a1 + 32) containsObject:v4] & 1) == 0)
  {
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    double v8 = __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_2;
    BOOL v9 = &unk_1E52DB330;
    id v11 = *(id *)(a1 + 48);
    id v5 = v5;
    id v10 = v5;
    [v5 performOperations:&v6 withAnimationStyle:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5, v6, v7, v8, v9);
  }
LABEL_9:
}

uint64_t __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __80__UIPeripheralHost_UIKitInternal__performMultipleOperations_withAnimationStyle___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) containerRootController];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (BOOL)minimize
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 minimize];

  return 1;
}

- (BOOL)maximize
{
  return [(UIPeripheralHost *)self maximizeWithAnimation:1];
}

- (BOOL)maximizeWithAnimation:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 maximizeWithAnimation:v3];

  return 1;
}

- (UIInputViewSet)inputViews
{
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  BOOL v3 = [v2 inputViews];

  return (UIInputViewSet *)v3;
}

- (UIInputViewSet)loadAwareInputViews
{
  BOOL v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v4 = [v3 transientInputViews];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIPeripheralHost *)self inputViews];
  }
  uint64_t v7 = v6;

  return (UIInputViewSet *)v7;
}

- (void)enableKeyboardTyping
{
  id v3 = [(UIPeripheralHost *)self inputViews];
  id v2 = [v3 keyboard];
  [v2 setTypingEnabled:1];
}

- (id)_currentInputView
{
  id v2 = [(UIPeripheralHost *)self inputViews];
  id v3 = [v2 inputView];

  return v3;
}

- (BOOL)_isSuppressedByManualKeyboard
{
  id v3 = [(UIPeripheralHost *)self view];
  uint64_t v4 = [v3 superview];
  if (v4)
  {
    id v5 = (void *)v4;
    id v6 = [(UIPeripheralHost *)self view];
    int v7 = [v6 isHidden];

    if (!v7)
    {
      LOBYTE(v8) = 0;
      return v8;
    }
  }
  else
  {
  }
  BOOL v9 = +[UIKeyboard activeKeyboard];
  id v10 = v9;
  if (v9) {
    int v8 = [v9 _isAutomaticKeyboard] ^ 1;
  }
  else {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)keyClicksEnabled
{
  if (_UIApplicationIsExtension())
  {
    id v3 = +[UIWindowScene _keyWindowScene]();
    uint64_t v4 = [v3 _topVisibleWindowPassingTest:&__block_literal_global_340];

    char v5 = v4 != 0;
  }
  else
  {
    if (![(UIPeripheralHost *)self isOnScreen]) {
      return 0;
    }
    uint64_t v4 = [(UIPeripheralHost *)self inputViews];
    char v5 = [v4 usesKeyClicks];
  }

  return v5;
}

uint64_t __51__UIPeripheralHost_UIKitInternal__keyClicksEnabled__block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 rootViewController];
  id v3 = [v2 childViewControllers];
  uint64_t v4 = [v3 firstObject];

  if (v4 && ((v4[94] >> 1) & 3u) - 1 <= 1)
  {
    char v5 = [v4 view];
    if (objc_opt_respondsToSelector())
    {
      id v6 = [v4 view];
      uint64_t v7 = [v6 enableInputClicksWhenVisible];
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

  return v7;
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4 reset:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v9 = a3;
  if (![(UIPeripheralHost *)self _isKeyboardDeactivated])
  {
    int v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    [v8 _preserveInputViewsWithId:v9 animated:v6 reset:v5];
  }
}

- (void)_preserveInputViewsWithId:(id)a3
{
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4
{
}

- (void)_restoreInputAccessoryViewOverrideWithId:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 _restoreInputAccessoryViewOverrideWithId:v3];
}

- (BOOL)_restoreInputViewsWithId:(id)a3 animated:(BOOL)a4
{
  uint64_t v4 = a4;
  id v5 = a3;
  BOOL v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  LOBYTE(v4) = [v6 _restoreInputViewsWithId:v5 animated:v4];

  return v4;
}

- (void)_clearPreservedInputViewsWithId:(id)a3 clearKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v6 _clearPreservedInputViewsWithId:v5 clearKeyboard:v4];
}

- (void)_clearPreservedInputViewsWithRestorableResponder:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 _clearPreservedInputViewsWithRestorableResponder:v3];
}

- (void)removePreservedInputViewSetForInputView:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v4 _removePreservedInputViewSetForInputView:v3];
}

- (void)_beginDisablingAnimations
{
  id v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v3 _beginDisablingAnimations];

  ++self->_disableAnimationsCount;
}

- (void)_endDisablingAnimations
{
  --self->_disableAnimationsCount;
  id v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  [v2 _endDisablingAnimations];
}

- (BOOL)isRotating
{
  id v2 = [(UIPeripheralHost *)self containerRootController];
  char v3 = [v2 isRotating];

  return v3;
}

- (BOOL)isTranslating
{
  id v2 = [(UIPeripheralHost *)self containerRootController];
  char v3 = [v2 isTranslating];

  return v3;
}

- (void)extendKeyboardBackdropHeight:(double)a3 withDuration:(double)a4
{
  id v6 = [(UIPeripheralHost *)self containerRootController];
  [v6 extendKeyboardBackdropHeight:a3 withDuration:a4];
}

- (void)updateInputAccessoryViewVisibility:(BOOL)a3 withDuration:(double)a4
{
  BOOL v5 = a3;
  id v6 = [(UIPeripheralHost *)self containerRootController];
  [v6 animateAccessoryViewVisibility:v5 withDuration:a4];
}

+ (double)gridViewRubberBandValueForValue:(double)result target:(double)a4 timeInterval:(double)a5 velocity:(double *)a6
{
  uint64_t v6 = (uint64_t)a5;
  double v7 = *a6;
  if (v6 >= 1)
  {
    do
    {
      double v7 = (v7 + (a4 - result) * 0.00014) * 0.98;
      CGPoint result = result + v7;
      --v6;
    }
    while (v6);
  }
  *a6 = v7;
  return result;
}

+ (id)passthroughViews
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[UIPeripheralHost sharedInstance];
  char v3 = [v2 _inputViews];

  id v4 = [v3 inputViewController];
  uint64_t v5 = [v4 view];
  if (v5)
  {
    uint64_t v6 = (void *)v5;

LABEL_4:
    v9[0] = v6;
    double v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];

    goto LABEL_5;
  }
  uint64_t v6 = [v3 inputView];

  if (v6) {
    goto LABEL_4;
  }
  double v7 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_5:

  return v7;
}

- (id)_inheritedRenderConfig
{
  return 0;
}

- (BOOL)_isTransitioning
{
  id v2 = [(UIPeripheralHost *)self existingContainerRootController];
  char v3 = [v2 isTransitioning];

  return v3;
}

- (BOOL)_shouldDelayRotationForWindow:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v6 = [v5 existingContainerWindow];

  BOOL v7 = v6 == v4
    && [(UIPeripheralHost *)self currentState] == 2
    && [(UIPeripheralHost *)self isRotating];

  return v7;
}

- (void)scrollView:(id)a3 didPanWithGesture:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v6 window];
  BOOL v7 = [v9 screen];
  int v8 = +[UIKeyboardMotionSupport supportForScreen:v7];
  [v8 scrollView:v6 didPanWithGesture:v5];
}

- (void)scrollView:(id)a3 didFinishPanGesture:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [v6 window];
  BOOL v7 = [v9 screen];
  int v8 = +[UIKeyboardMotionSupport supportForScreen:v7];
  [v8 scrollView:v6 didFinishPanGesture:v5];
}

+ (Class)floatingAssistantBarPlacementClassSupportingCompactStyle:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = objc_opt_class();
  if (v3)
  {
    id v5 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v6 = [v5 preferencesActions];
    uint64_t v7 = [v6 compactAssistantBarPersistentLocation];

    if (v7 == 4)
    {
      int v8 = +[UIKeyboardImpl activeInstance];
      id v9 = [v8 inputDelegate];
      id v10 = [v9 textInputView];
      [v10 _shouldReverseLayoutDirection];
      id v4 = objc_opt_class();
    }
    else if (v7 == 5 || v7 == 6)
    {
      id v4 = objc_opt_class();
    }
  }
  return (Class)v4;
}

void __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke(uint64_t a1)
{
  v23[1] = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) handlingRemoteEvent]
    || *(unsigned char *)(a1 + 64)
    || ([*(id *)(a1 + 32) remoteKeyboardUndocked] & 1) != 0)
  {
    +[UIKeyboardImpl normalizedPersistentOffset];
    double v3 = v2;
    double v5 = v4;
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DAD8];
    double v5 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  }
  if (*(unsigned char *)(a1 + 64))
  {
    +[UIPeripheralHost floatingChromeBuffer];
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;
    +[UIKeyboardImpl floatingWidth];
    uint64_t v15 = +[UIInputViewSetPlacementFloating placementWithUndockedOffset:chromeBuffer:floatingWidth:](UIInputViewSetPlacementFloating, "placementWithUndockedOffset:chromeBuffer:floatingWidth:", v3, v5, v7, v9, v11, v13, v14);
    uint64_t v16 = *(void *)(*(void *)(a1 + 48) + 8);
    char v17 = *(void **)(v16 + 40);
    *(void *)(v16 + 40) = v15;

    if (+[UIKeyboard isMajelEnabled]
      && +[UIKeyboardImpl isFloatingForced]
      && ([*(id *)(a1 + 40) _shouldSuppressAssistantBar] & 1) == 0)
    {
      long long v18 = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 56), "floatingAssistantBarPlacementClassSupportingCompactStyle:", *(unsigned __int8 *)(a1 + 65)), "placement");
      v23[0] = v18;
      CGPoint v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
      [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) setSubPlacements:v19];
    }
  }
  else if ((+[UIKeyboardImpl rivenTranslationPreference] {
          || [*(id *)(a1 + 32) remoteKeyboardUndocked])
  }
         && (fabs(v5) > 0.01 || +[UIKeyboardImpl isSplit]))
  {
    uint64_t v20 = +[UIInputViewSetPlacementUndocked placementWithUndockedOffset:chromeBuffer:](UIInputViewSetPlacementUndocked, "placementWithUndockedOffset:chromeBuffer:", v3, v5, 92.0, 0.0, 0.0, 0.0);
    uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
    id v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;
  }
}

id __75__UIPeripheralHost_UIKitInternal__endPlacementForInputViewSet_windowScene___block_invoke_356(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = [*(id *)(a1 + 32) keyboardWindow];
  double v2 = [v1 rootViewController];

  if (!v2)
  {
    double v3 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v2 = [v3 containerRootController];
  }
  double v4 = _UIPeripheralHostLogger();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    double v5 = [v2 placement];
    int v8 = 138412290;
    double v9 = v5;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "endPlacementForInputViewSet, deactivated return -> %@", (uint8_t *)&v8, 0xCu);
  }
  double v6 = [v2 placement];

  return v6;
}

@end