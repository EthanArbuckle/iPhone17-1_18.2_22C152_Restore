@interface UIKeyboardSceneDelegate
+ (id)activeKeyboardSceneDelegate;
+ (id)applicationConnectedWindowScenes;
+ (id)automaticKeyboardArbiterClient;
+ (int64_t)interfaceOrientation;
+ (void)_pinInputViewsForKeyboardSceneDelegate:(id)a3 onBehalfOfResponder:(id)a4 duringBlock:(id)a5;
+ (void)initialize;
+ (void)logInterfaceOrientation:(int64_t)a3 withDescription:(id)a4;
+ (void)performOnControllers:(id)a3;
+ (void)setInterfaceOrientation:(int64_t)a3;
- (BOOL)_hasPostPinningReloadState;
- (BOOL)_isIgnoringReloadInputViews;
- (BOOL)_isPinningInputViewsOnBehalfOfResponder:(id)a3;
- (BOOL)_isPreservedRestorableResponder:(id)a3;
- (BOOL)_isTrackingResponder:(id)a3;
- (BOOL)_keepInputSession;
- (BOOL)_preserveMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4 reset:(BOOL)a5;
- (BOOL)_restoreInputViewsWithId:(id)a3 animated:(BOOL)a4;
- (BOOL)_restoreMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4;
- (BOOL)_showKeyboardWindowForInputViewSet:(id)a3 placement:(id)a4 windowScene:(id)a5;
- (BOOL)animationsEnabled;
- (BOOL)automaticAppearanceEnabled;
- (BOOL)automaticAppearanceInternalEnabled;
- (BOOL)automaticAppearanceReallyEnabled;
- (BOOL)clearWaitingForInputUIIfNeeded;
- (BOOL)deactivated;
- (BOOL)enhancedWindowingModeIsAvailable;
- (BOOL)enhancedWindowingModeIsEnabled;
- (BOOL)expectedInputModeIsSpecialized;
- (BOOL)expectedInputViewSetIsCustom;
- (BOOL)hasActiveKeyboardResponder;
- (BOOL)hasCustomInputViewController;
- (BOOL)hasDictationKeyboard;
- (BOOL)hasIntegratedAssistantBar;
- (BOOL)hasNullInputView;
- (BOOL)hasVisibleAssistantBar;
- (BOOL)hideSystemInputAssistantView;
- (BOOL)ignoresPinning;
- (BOOL)isKeyboardOnEmbeddedScreen;
- (BOOL)isOnScreen;
- (BOOL)isUndocked;
- (BOOL)isWaitingForInputUI;
- (BOOL)isWaitingForInputUI:(id)a3;
- (BOOL)keyboardVisible;
- (BOOL)loadingLocalKeyboard;
- (BOOL)maximize;
- (BOOL)maximizeWithAnimation:(BOOL)a3;
- (BOOL)maximizeWithAnimationStyle:(id)a3;
- (BOOL)maximizeWithAnimationStyle:(id)a3 force:(BOOL)a4;
- (BOOL)minimize;
- (BOOL)minimizeWithAnimationStyle:(id)a3;
- (BOOL)minimizeWithAnimationStyle:(id)a3 force:(BOOL)a4;
- (BOOL)pinningPreventsInputViews:(id)a3;
- (BOOL)preservingInputViews;
- (BOOL)restoringInputViews;
- (BOOL)restoringInputViewsAndWaitingForInputUI;
- (BOOL)shouldSuppressInputAssistantUpdates;
- (BOOL)showingAccessoryViewOnly;
- (BOOL)showingInAppWindow;
- (BOOL)showingKeyboard;
- (BOOL)showingKeyboardForInputViewSet:(id)a3;
- (BOOL)takingSnapshot;
- (BOOL)textEntryFocusOnExternalDisplay;
- (BOOL)useHostedInstance;
- (BOOL)useVisualModeWindowedUI;
- (BOOL)windowingModeEnabled;
- (CGRect)frameForLayoutGuideInView:(id)a3;
- (CGRect)visibleFrameInView:(id)a3;
- (CGRect)visibleInputViewFrameInView:(id)a3;
- (NSDate)_transitionStartTime;
- (NSString)hardwareKeyboardExclusivityIdentifier;
- (UIInputViewSet)inputViews;
- (UIInputViewSet)transientInputViews;
- (UIInputWindowController)containerRootController;
- (UIInputWindowController)existingContainerRootController;
- (UIKBLocalAuthenticationObserver)localAuthenticationObserver;
- (UIKBRenderConfig)restorableRenderConfig;
- (UIKeyboardSceneDelegate)initWithScene:(id)a3;
- (UIKeyboardVisualModeManager)visualModeManager;
- (UIResponder)responder;
- (UIScene)_scene;
- (UISystemInputAssistantViewController)systemInputAssistantViewController;
- (UITextEffectsWindow)containerWindow;
- (UITextEffectsWindow)existingContainerWindow;
- (UITextFormattingCoordinator)textFormattingCoordinator;
- (UIView)containerView;
- (UIView)preservedKeyboardWindowSnapshot;
- (UIWindow)keyWindowCandidate;
- (UIWindowScene)scene;
- (double)verticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4;
- (id)_delegateAsResponder;
- (id)_inputViewsForResponder:(id)a3;
- (id)_inputViewsForResponder:(id)a3 withAutomaticKeyboard:(BOOL)a4 force:(BOOL)a5;
- (id)_placementForDeactivatedKeyboard:(BOOL)a3 currentPlacement:(id)a4 forSuppressionAssertion:(BOOL)a5 wantsAssistant:(BOOL)a6 keepAccessories:(BOOL)a7;
- (id)_renderConfigForResponder:(id)a3;
- (id)_responderDescriptionForLogging:(id)a3;
- (id)_sessionIdentifier;
- (id)_simpleViewDescriptionForLogging:(id)a3;
- (id)_textInputSessionAnalytics;
- (id)_windowScene;
- (id)containerWindowForViewService:(BOOL)a3;
- (id)forceCreateKeyboardWindow;
- (id)keyboardArbiterClient;
- (id)keyboardScreen;
- (id)keyboardWindow;
- (id)nextAnimationStyle;
- (id)nextAnimationStyle:(BOOL)a3;
- (id)passthroughViews;
- (id)remoteHostInputViewSet:(id)a3;
- (id)remoteInputViewHost;
- (id)requestAnimationAssertionWithDirection:(int)a3;
- (id)requestAnimationAssertionWithDirection:(int)a3 animated:(BOOL)a4;
- (id)systemInputAssistantViewControllerForResponder:(id)a3;
- (id)waitingForInputUI;
- (int)_endIgnoringReloadInputViews;
- (int64_t)_preferredAppearanceForResponder:(id)a3;
- (int64_t)currentState;
- (unint64_t)deactivationCount;
- (void)_beginDisablingAnimations;
- (void)_beginIgnoringReloadInputViews;
- (void)_beginPersistingInputAccessoryViewForResponder:(id)a3 withId:(id)a4;
- (void)_beginPinningInputViewsOnBehalfOfResponder:(id)a3;
- (void)_clearEligibilityToRequestKeyboardFocusWithoutUserInteraction;
- (void)_clearMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4;
- (void)_clearPersistingInputAccessoryView;
- (void)_clearPinningResponders;
- (void)_clearPreservedInputViewsWithId:(id)a3 clearKeyboard:(BOOL)a4;
- (void)_clearPreservedInputViewsWithRestorableResponder:(id)a3;
- (void)_deviceWillLock:(id)a3;
- (void)_endDisablingAnimations;
- (void)_endPersistingInputAccessoryViewWithId:(id)a3;
- (void)_performPostWaitingForInputUIBlocks;
- (void)_preserveInputViewsWithId:(id)a3;
- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4;
- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4 reset:(BOOL)a5;
- (void)_reloadInputViewsForKeyWindowSceneResponder:(id)a3 force:(BOOL)a4 fromBecomeFirstResponder:(BOOL)a5;
- (void)_reloadInputViewsForResponder:(id)a3;
- (void)_reloadInputViewsForResponder:(id)a3 force:(BOOL)a4;
- (void)_reloadInputViewsForResponder:(id)a3 force:(BOOL)a4 fromBecomeFirstResponder:(BOOL)a5;
- (void)_reloadInputViewsForResponder:(id)a3 fromBecomeFirstResponder:(BOOL)a4;
- (void)_reloadInputViewsForWindowSceneResponder:(id)a3 force:(BOOL)a4;
- (void)_removePreservedInputViewSetForInputView:(id)a3;
- (void)_restoreInputAccessoryViewOverrideWithId:(id)a3;
- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5;
- (void)_setIgnoresPinning:(BOOL)a3 allowImmediateReload:(BOOL)a4;
- (void)_setReloadInputViewsForcedIsAllowed:(BOOL)a3;
- (void)_setScene:(id)a3;
- (void)_stopPinningInputViewsOnBehalfOfResponder:(id)a3;
- (void)_updateContainerWindowLevel;
- (void)_updateTextInputSession;
- (void)_updateVisibilityObserversWithReset:(BOOL)a3;
- (void)_windowHostingScene:(id)a3 didMoveFromScreen:(id)a4 toScreen:(id)a5;
- (void)addPostWaitingForInputUIBlock:(id)a3;
- (void)addTrackingElement:(id)a3;
- (void)addVisibilityObserver:(id)a3;
- (void)cleanDeactivation;
- (void)cleanUpWaitingForInputUI;
- (void)clearAnimationStyleForUserDrivenPresentation;
- (void)completeMoveKeyboardForWindow:(id)a3;
- (void)createAutomaticKeyboardIfNeeded;
- (void)dealloc;
- (void)destroyKeyboardWindowIfNecessary;
- (void)disableInterfaceAutorotation:(BOOL)a3;
- (void)firstResponderDidChange:(id)a3;
- (void)forceOrderInAutomaticAnimated:(BOOL)a3;
- (void)forceOrderInAutomaticFromDirection:(int)a3 withDuration:(double)a4;
- (void)forceOrderOutAutomaticAnimated:(BOOL)a3;
- (void)forceOrderOutAutomaticExceptAccessoryView;
- (void)forceOrderOutAutomaticToDirection:(int)a3 withDuration:(double)a4;
- (void)forceReloadInputViews;
- (void)inputModeChangedForRenderConfig:(id)a3;
- (void)keyboardSceneDelegateWillResume:(id)a3;
- (void)keyboardUIDidChange;
- (void)loadLocalKeyboardForHost:(id)a3;
- (void)orderInWithAnimationStyle:(id)a3;
- (void)orderOutWithAnimationStyle:(id)a3;
- (void)performMultipleOperations:(id)a3 withAnimationStyle:(id)a4;
- (void)performWithAllowingNilResponderReload:(id)a3;
- (void)popAnimationStyle;
- (void)popOrRemoveAnimationStyle:(id)a3;
- (void)prepareForAlongsideTransitionWithContext:(id)a3;
- (void)prepareToMoveKeyboardForInputViewSet:(id)a3 animationStyle:(id)a4;
- (void)pushAnimationStyle:(id)a3;
- (void)refreshKeyboardLayoutGuide;
- (void)refreshWithLocalMinimumKeyboardHeight:(double)a3;
- (void)reloadPlacement;
- (void)removeTrackingElement:(id)a3;
- (void)removeVisibilityObserver:(id)a3;
- (void)setAutomaticAppearanceEnabled:(BOOL)a3;
- (void)setAutomaticAppearanceInternalEnabled:(BOOL)a3;
- (void)setDeactivationCount:(unint64_t)a3;
- (void)setHardwareKeyboardExclusivityIdentifier:(id)a3;
- (void)setHasCustomInputViewController:(BOOL)a3;
- (void)setHideSystemInputAssistantView:(BOOL)a3;
- (void)setIgnoresPinning:(BOOL)a3;
- (void)setInputViews:(id)a3;
- (void)setInputViews:(id)a3 animated:(BOOL)a4;
- (void)setInputViews:(id)a3 animationStyle:(id)a4;
- (void)setIsKeyboardOnEmbeddedScreen:(BOOL)a3;
- (void)setKeyWindowCandidate:(id)a3;
- (void)setKeyWindowSceneInputViews:(id)a3 animationStyle:(id)a4;
- (void)setLocalAuthenticationObserver:(id)a3;
- (void)setNextAutomaticOrderInDirection:(int)a3 duration:(double)a4;
- (void)setPreservedKeyboardWindowSnapshot:(id)a3;
- (void)setPreservingInputViews:(BOOL)a3;
- (void)setRestorableRenderConfig:(id)a3;
- (void)setRestoringInputViews:(BOOL)a3;
- (void)setShouldSuppressInputAssistantUpdates:(BOOL)a3;
- (void)setTakingSnapshot:(BOOL)a3;
- (void)setTextEffectsWindowLevelForInputView:(id)a3 responder:(id)a4;
- (void)setUseHostedInstance:(BOOL)a3;
- (void)setWaitingForInputUI:(id)a3;
- (void)setWindowLevel:(double)a3 sceneLevel:(double)a4 forResponder:(id)a5;
- (void)setWindowSceneInputViews:(id)a3 animationStyle:(id)a4;
- (void)traitCollectionDidChange;
- (void)updateArbiterClientWithKeyboardFrame:(CGRect)a3 keyboarFrameWithIAV:(CGRect)a4 isIAVRelevant:(BOOL)a5 showing:(BOOL)a6 notifyRemote:(BOOL)a7 forScene:(id)a8;
- (void)updateLightEffectsBackdropAnimated:(BOOL)a3;
- (void)updateLocalKeyboardChanged:(id)a3;
- (void)updateRemoteKeyboardChanged:(id)a3;
- (void)updateRenderConfigForCurrentResponder;
- (void)updateRenderConfigForResponder:(id)a3;
- (void)updateSystemInputAssistantVisibilityAfterHardwareKeyEvent;
- (void)updateTrackingElementsForOffset:(UIOffset)a3;
- (void)updateTrackingElementsForSize:(CGSize)a3;
- (void)visualModeManager:(id)a3 didChangeToMode:(int)a4;
- (void)visualModeManager:(id)a3 observedEnhancedWindowingModeEnabledDidChange:(BOOL)a4;
- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5;
- (void)windowDidBecomeKey:(id)a3;
@end

@implementation UIKeyboardSceneDelegate

+ (id)activeKeyboardSceneDelegate
{
  v2 = +[UIWindowScene _keyWindowScene]();
  v3 = [v2 keyboardSceneDelegate];

  return v3;
}

- (void)traitCollectionDidChange
{
  [(UIKeyboardSceneDelegate *)self updateRenderConfigForCurrentResponder];
  id v2 = +[UIKeyboardImpl activeInstance];
  [v2 traitCollectionDidChange];
}

- (void)updateRenderConfigForCurrentResponder
{
  id v3 = [(UIKeyboardSceneDelegate *)self responder];
  [(UIKeyboardSceneDelegate *)self updateRenderConfigForResponder:v3];
}

- (void)updateRenderConfigForResponder:(id)a3
{
  id v4 = a3;
  if (([v4 _requiresKeyboardWhenFirstResponder] & 1) != 0
    || [v4 _ownsInputAccessoryView])
  {
    v5 = [(UIKeyboardSceneDelegate *)self _renderConfigForResponder:v4];
    v6 = [MEMORY[0x1E4F1CA48] array];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__UIKeyboardSceneDelegate_updateRenderConfigForResponder___block_invoke;
    aBlock[3] = &unk_1E52EDD70;
    id v7 = v6;
    id v16 = v7;
    v17 = self;
    id v8 = v5;
    id v18 = v8;
    v9 = (void (**)(void *, void *))_Block_copy(aBlock);
    if ([v8 lightKeyboard]) {
      uint64_t v10 = 1;
    }
    else {
      uint64_t v10 = 2;
    }
    v11 = [(UIKeyboardSceneDelegate *)self containerWindow];
    [v11 setOverrideUserInterfaceStyle:v10];

    if (+[_UIRemoteKeyboards enabled]
      && ([(UIKeyboardSceneDelegate *)self scene],
          v12 = objc_claimAutoreleasedReturnValue(),
          int v13 = [v12 _isKeyWindowScene],
          v12,
          v13))
    {
      v14 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      [v14 performOnControllers:v9];
    }
    else
    {
      v14 = [(UIKeyboardSceneDelegate *)self containerRootController];
      v9[2](v9, v14);
    }
  }
}

- (UIResponder)responder
{
  return self->_responder;
}

- (void)_setIgnoresPinning:(BOOL)a3 allowImmediateReload:(BOOL)a4
{
  if (self->_ignoresPinning != a3)
  {
    self->_ignoresPinning = a3;
    if (a3 && a4)
    {
      postPinningReloadState = self->_postPinningReloadState;
      if (postPinningReloadState)
      {
        id v6 = [(UIInputViewPostPinningReloadState *)postPinningReloadState responderToReload];
        [(UIKeyboardSceneDelegate *)self _reloadInputViewsForResponder:v6];
      }
    }
  }
}

- (void)pushAnimationStyle:(id)a3
{
  if (a3) {
    -[NSMutableArray addObject:](self->_animationStyleStack, "addObject:");
  }
}

- (void)popAnimationStyle
{
  if ([(NSMutableArray *)self->_animationStyleStack count])
  {
    animationStyleStack = self->_animationStyleStack;
    [(NSMutableArray *)animationStyleStack removeLastObject];
  }
}

- (void)_endDisablingAnimations
{
  --self->_disableAnimationsCount;
  if (self->_containerWindow)
  {
    id v2 = [(UIKeyboardSceneDelegate *)self containerRootController];
    [v2 popAnimationStyle];
  }
}

- (void)_beginDisablingAnimations
{
  ++self->_disableAnimationsCount;
  if (self->_containerWindow)
  {
    id v3 = [(UIKeyboardSceneDelegate *)self containerRootController];
    id v2 = +[UIInputViewAnimationStyle animationStyleImmediate];
    [v3 pushAnimationStyle:v2];
  }
}

uint64_t __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInputViewSet:*(void *)(a1 + 40)];
}

- (BOOL)_restoreInputViewsWithId:(id)a3 animated:(BOOL)a4
{
  id v6 = a3;
  preservedViewSets = self->_preservedViewSets;
  if (preservedViewSets && [(NSMutableDictionary *)preservedViewSets count])
  {
    id v8 = [(NSMutableDictionary *)self->_preservedViewSets objectForKey:v6];
    if (v8 && ([(NSMutableSet *)self->_keysBeingRestored containsObject:v6] & 1) == 0)
    {
      keysBeingRestored = self->_keysBeingRestored;
      if (!keysBeingRestored)
      {
        uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithCapacity:1];
        v11 = self->_keysBeingRestored;
        self->_keysBeingRestored = v10;

        keysBeingRestored = self->_keysBeingRestored;
      }
      [(NSMutableSet *)keysBeingRestored addObject:v6];
      uint64_t v12 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      if (!v12
        || (int v13 = (void *)v12,
            +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), v14 = objc_claimAutoreleasedReturnValue(), char v15 = [v14 shouldAllowInputViewsRestoredForId:v6], v14, v13, (v15 & 1) != 0))
      {
        if (!a4) {
          [(UIKeyboardSceneDelegate *)self _beginDisablingAnimations];
        }
        id v16 = [v8 accessoryViewNextResponder];

        if (v16)
        {
          v17 = [v8 inputAccessoryView];
          id v18 = [v8 accessoryViewNextResponder];
          [v17 _overrideInputAccessoryViewNextResponderWithResponder:v18];
        }
        v19 = [v8 accessoryControllerNextResponder];

        if (v19)
        {
          v20 = [v8 accessoryViewController];
          v21 = [v8 accessoryControllerNextResponder];
          [v20 _overrideInputAccessoryViewNextResponderWithResponder:v21];
        }
        v22 = [v8 restorableRenderConfig];
        [(UIKeyboardSceneDelegate *)self setRestorableRenderConfig:v22];

        if ([(id)UIApp _isSpringBoard])
        {
          v23 = [v8 keyboard];

          if (v23)
          {
            v24 = +[UIKeyboardImpl activeInstance];
            [v24 updateLayout];
          }
        }
        v25 = [v8 restorableResponder];
        if (v25)
        {
          int v26 = 1;
        }
        else
        {
          v31 = [(UIKeyboardSceneDelegate *)self responder];
          v32 = [v31 inputView];
          if (v32) {
            int v26 = [v8 isCustomInputView];
          }
          else {
            int v26 = 1;
          }
        }
        if ([v8 restoreUsingBecomeFirstResponder])
        {
          v33 = 0;
          v34 = 0;
          goto LABEL_55;
        }
        v33 = 0;
        if ([v8 isEmpty])
        {
          v34 = 0;
          goto LABEL_55;
        }
        v34 = 0;
        if ((v26 ^ 1)) {
          goto LABEL_55;
        }
        v35 = [(UIKeyboardSceneDelegate *)self containerRootController];
        int v36 = [v35 isTransitioning];

        if (v36)
        {
          v37 = [(UIKeyboardSceneDelegate *)self responder];
          if (v37)
          {
            v38 = [(UIKeyboardSceneDelegate *)self responder];
            v33 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v38];

LABEL_42:
            v34 = [(UIKeyboardSceneDelegate *)self responder];
            v41 = [v8 restorableResponder];
            v42 = [v41 inputAccessoryView];

            if (v42)
            {
              self;
              ++__disablePromoteDescendantToFirstResponderCount;
            }
            [(UIKeyboardSceneDelegate *)self setTakingSnapshot:0];
            [(UIKeyboardSceneDelegate *)self setRestoringInputViews:1];
            if (+[UIKeyboard usesInputSystemUI])
            {
              self->_restoringInputViewsAndWaitingForInputUI = 1;
              [(UIKeyboardSceneDelegate *)self setInputViews:v8 animated:0];
            }
            else
            {
              [(UIKeyboardSceneDelegate *)self setInputViews:v8];
            }
            [(UIKeyboardSceneDelegate *)self setRestoringInputViews:0];
            if (v42)
            {
              self;
              if (__disablePromoteDescendantToFirstResponderCount) {
                --__disablePromoteDescendantToFirstResponderCount;
              }
            }
            uint64_t v43 = [v8 accessoryViewNextResponder];
            if (v43)
            {
              v44 = (void *)v43;
              v45 = [v8 inputAccessoryView];
              v46 = [v45 _nextResponderOverride];

              if (!v46)
              {
                v47 = [v8 inputAccessoryView];
                v48 = [v8 accessoryViewNextResponder];
                [v47 _overrideInputAccessoryViewNextResponderWithResponder:v48];
              }
            }
            v49 = [v8 accessoryControllerNextResponder];

            if (v49)
            {
              v50 = [v8 accessoryViewController];
              v51 = [v8 accessoryControllerNextResponder];
              [v50 _overrideInputAccessoryViewNextResponderWithResponder:v51];
            }
LABEL_55:
            v52 = [v8 accessoryViewNextResponder];

            if (v52) {
              [v8 setAccessoryViewNextResponder:0];
            }
            v53 = [v8 restorableResponder];

            if (!v53) {
              goto LABEL_84;
            }
            v54 = [v8 restorableResponder];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            v90 = v34;
            if (isKindOfClass)
            {
              v56 = [v8 restorableResponder];
              if ([v56 clearsOnBeginEditing])
              {
LABEL_62:
                [v56 setClearsOnBeginEditing:0];
                v57 = [v8 restorableResponder];
                char v58 = [v57 _restoreFirstResponder];

                [v56 setClearsOnBeginEditing:1];
                BOOL v88 = [(UIKeyboardSceneDelegate *)self _restoreMultiDocumentTokenIfNecessary:v8 withId:v6];
                v59 = [v8 restorableResponder];
                v60 = [v59 _responderWindow];
                v61 = +[UIWindow _applicationKeyWindow];

                if (v60 == v61)
                {
                  BOOL v87 = 0;
                }
                else
                {
                  v62 = [(UIKeyboardSceneDelegate *)self responder];
                  v63 = [v8 restorableResponder];
                  BOOL v87 = v62 != v63;
                }
                char v64 = v58;
                v65 = [v8 restorableResponder];
                v66 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v65];
                int v86 = [v66 isEqual:v8];

                v67 = [(UIKeyboardSceneDelegate *)self responder];
                v68 = [v67 inputView];
                v89 = v33;
                if (v68)
                {
                  int v69 = 1;
                }
                else
                {
                  v70 = [(UIKeyboardSceneDelegate *)self responder];
                  v71 = [v70 inputViewController];
                  int v69 = v71 != 0;
                }
                v72 = [(UIKeyboardSceneDelegate *)self responder];
                v73 = [v8 restorableResponder];
                if (v72 == v73)
                {
                  BOOL v74 = 0;
                  if ((([v8 isEmpty] | v87) & 1) == 0 && ((v86 ^ 1) & 1) == 0) {
                    BOOL v74 = v69 == [v8 isCustomInputView];
                  }
                }
                else
                {
                  BOOL v74 = 0;
                }

                char v75 = v64;
                char v76 = v64 ^ 1 | v88;
                v34 = v90;
                if ((v76 & 1) != 0
                  || v74
                  || ([v8 restorableResponder],
                      v77 = objc_claimAutoreleasedReturnValue(),
                      int v78 = [v77 isFirstResponder],
                      v77,
                      !v78))
                {
                  v33 = v89;
                  if (v89) {
                    char v80 = v75;
                  }
                  else {
                    char v80 = 1;
                  }
                  if ((v80 & 1) == 0)
                  {
                    v81 = [(UIKeyboardSceneDelegate *)self responder];

                    if (v90 == v81) {
                      [(UIKeyboardSceneDelegate *)self setInputViews:v89];
                    }
                  }
                }
                else
                {
                  v79 = [v8 restorableResponder];
                  [(UIKeyboardSceneDelegate *)self _reloadInputViewsForResponder:v79];

                  v33 = v89;
                }
                [(UIKeyboardSceneDelegate *)self _updateVisibilityObserversWithReset:0];

LABEL_84:
                [(UIKeyboardSceneDelegate *)self setTakingSnapshot:0];

                v82 = [(UIKeyboardSceneDelegate *)self responder];

                if (!v82)
                {
                  v83 = [v8 restorableResponder];
                  [v83 _clearBecomeFirstResponderWhenCapable];

                  v84 = +[UIInputViewSet emptyInputSet];
                  [(UIKeyboardSceneDelegate *)self setInputViews:v84];
                }
                [v8 setRestorableResponder:0];
                [v8 setRestorableRenderConfig:0];
                [(UIKeyboardSceneDelegate *)self setRestorableRenderConfig:0];
                [(NSMutableDictionary *)self->_preservedViewSets removeObjectForKey:v6];
                if (!a4) {
                  [(UIKeyboardSceneDelegate *)self _endDisablingAnimations];
                }
                [(NSMutableSet *)self->_keysBeingRestored removeObject:v6];

                BOOL v27 = 1;
                goto LABEL_89;
              }
            }
            v56 = 0;
            goto LABEL_62;
          }
          id v40 = +[UIInputViewSet emptyInputSet];
        }
        else
        {
          v39 = [(UIKeyboardSceneDelegate *)self inputViews];
          if (!v39)
          {
            v33 = +[UIInputViewSet emptyInputSet];
            v37 = 0;
            goto LABEL_42;
          }
          id v40 = v39;
          v37 = v40;
        }
        v33 = v40;
        goto LABEL_42;
      }
      v28 = [v8 restorableResponder];
      int v29 = [v28 isFirstResponder];

      if (v29)
      {
        v30 = [v8 restorableResponder];
        [v30 resignFirstResponder];
      }
      [(NSMutableSet *)self->_keysBeingRestored removeObject:v6];
    }
    BOOL v27 = 0;
LABEL_89:

    goto LABEL_90;
  }
  BOOL v27 = 0;
LABEL_90:

  return v27;
}

- (void)_reloadInputViewsForResponder:(id)a3 fromBecomeFirstResponder:(BOOL)a4
{
}

- (BOOL)_isTrackingResponder:(id)a3
{
  postPinningReloadState = self->_postPinningReloadState;
  id v5 = a3;
  if (postPinningReloadState) {
    [(UIInputViewPostPinningReloadState *)postPinningReloadState responderToReload];
  }
  else {
  id v6 = [(UIKeyboardSceneDelegate *)self responder];
  }

  return v6 == v5;
}

void __82__UIKeyboardSceneDelegate__scene_willTransitionToActivationState_withReasonsMask___block_invoke(uint64_t a1)
{
  id v2 = +[UIDevice currentDevice];
  int v3 = [v2 _supportsPencil];

  if (v3) {
    id v4 = (id)[*(id *)(a1 + 32) containerWindow];
  }
}

- (BOOL)enhancedWindowingModeIsEnabled
{
  id v2 = [(UIKeyboardSceneDelegate *)self scene];
  char v3 = [v2 _enhancedWindowingEnabled];

  return v3;
}

- (id)containerWindowForViewService:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(UIKeyboardSceneDelegate *)self scene];
  id v6 = [v5 session];
  id v7 = [v6 role];
  char v8 = [v7 isEqualToString:@"_UISceneSessionRoleKeyboard"];

  if (v8)
  {
    v9 = 0;
    goto LABEL_18;
  }
  uint64_t v10 = 16;
  if (v3) {
    uint64_t v10 = 24;
  }
  v11 = (id *)((char *)&self->super.isa + v10);
  id v12 = *(id *)((char *)&self->super.isa + v10);
  if (v12)
  {
    if ([(id)UIApp _isSpringBoard])
    {
      v9 = v12;
      goto LABEL_18;
    }
    if (([v12 _isHostedInAnotherProcess] & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    id v16 = [(UIKeyboardSceneDelegate *)self scene];
    uint64_t v17 = +[UITextEffectsWindow activeTextEffectsWindowForWindowScene:v16 forViewService:v3];
    goto LABEL_12;
  }
  +[UIWindowScene _keyWindowScene]();
  int v13 = (id *)objc_claimAutoreleasedReturnValue();
  v14 = -[UIWindowScene _keyWindow](v13);
  int v15 = [v14 _isHostedInAnotherProcess];

  if (v15) {
    goto LABEL_9;
  }
LABEL_11:
  id v16 = [(UIKeyboardSceneDelegate *)self scene];
  uint64_t v17 = +[UITextEffectsWindow sharedTextEffectsWindowForWindowScene:v16 forViewService:v3];
LABEL_12:
  v9 = (void *)v17;

  [v9 setHidden:0];
  if (!v12 && v9 && self->_disableAnimationsCount >= 1)
  {
    uint64_t v18 = 0;
    do
    {
      v19 = [v9 rootViewController];
      v20 = +[UIInputViewAnimationStyle animationStyleImmediate];
      [v19 pushAnimationStyle:v20];

      ++v18;
    }
    while (v18 < self->_disableAnimationsCount);
  }
  objc_storeStrong(v11, v9);
LABEL_18:
  return v9;
}

- (UIWindowScene)scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIWindowScene *)WeakRetained;
}

- (void)_scene:(id)a3 willTransitionToActivationState:(int64_t)a4 withReasonsMask:(unint64_t)a5
{
  id v7 = a3;
  if (a4 == 2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);

    if (WeakRetained) {
      [(UIKeyboardSceneDelegate *)self setKeyWindowCandidate:0];
    }
  }
  else if (!a4)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__UIKeyboardSceneDelegate__scene_willTransitionToActivationState_withReasonsMask___block_invoke;
    block[3] = &unk_1E52D9F70;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

- (void)setKeyWindowSceneInputViews:(id)a3 animationStyle:(id)a4
{
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  kdebug_trace();
  kac_get_log();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, v8);
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v11 = v10;
    if (os_signpost_enabled(v9))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "setInputViews", "", buf, 2u);
    }
  }

  if (!+[UIDictationController viewMode])
  {
    kdebug_trace();
    kac_get_log();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v15 = os_signpost_id_make_with_pointer(v14, v8);
    if (v15 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_35;
    }
    os_signpost_id_t v16 = v15;
    if (!os_signpost_enabled(v14)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
LABEL_34:
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v14, OS_SIGNPOST_INTERVAL_END, v16, "setInputViews", "", buf, 2u);
LABEL_35:
    v37 = v14;
    id v38 = v8;
    goto LABEL_69;
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    id v12 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    char v13 = [v12 handlingRemoteEvent];
  }
  else
  {
    char v13 = [v8 isInputViewPlaceholder];
  }
  if (![(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled]
    && (v13 & 1) == 0
    && ([v7 force] & 1) == 0)
  {
    BOOL v27 = [(UIKeyboardSceneDelegate *)self inputViews];
    if (v27 && (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      v28 = +[UIKeyboardImpl activeInstance];
      int v29 = [v28 textInputTraits];
      uint64_t v30 = [v29 keyboardType];

      if (v30 == 127) {
        [(UIKeyboardSceneDelegate *)self forceOrderOutAutomaticAnimated:1];
      }
    }
    else
    {
    }
    v33 = [(UIKeyboardSceneDelegate *)self containerRootController];
    int v34 = [v33 isRotating];

    if (v34)
    {
      v93[0] = MEMORY[0x1E4F143A8];
      v93[1] = 3221225472;
      v93[2] = __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke;
      v93[3] = &unk_1E52DCB30;
      v93[4] = self;
      id v94 = v8;
      id v95 = v7;
      v35 = [(UIKeyboardSceneDelegate *)self containerRootController];
      [v35 setPostRotationPendingBlock:v93];
    }
    kdebug_trace();
    kac_get_log();
    v14 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v36 = os_signpost_id_make_with_pointer(v14, v8);
    if (v36 - 1 > 0xFFFFFFFFFFFFFFFDLL) {
      goto LABEL_35;
    }
    os_signpost_id_t v16 = v36;
    if (!os_signpost_enabled(v14)) {
      goto LABEL_35;
    }
    *(_WORD *)buf = 0;
    goto LABEL_34;
  }
  uint64_t v17 = [(UIKeyboardSceneDelegate *)self containerRootController];
  [v17 setPostRotationPendingBlock:0];

  [v8 refreshPresentation];
  [(UIKeyboardSceneDelegate *)self updateRenderConfigForCurrentResponder];
  uint64_t v18 = [(UIKeyboardSceneDelegate *)self responder];
  [(UIKeyboardSceneDelegate *)self setTextEffectsWindowLevelForInputView:v8 responder:v18];

  v19 = [(UIKeyboardSceneDelegate *)self containerRootController];
  if (!+[_UIRemoteKeyboards enabled])
  {
    uint64_t v24 = 0;
    v25 = 0;
    int v26 = v8;
    goto LABEL_65;
  }
  v20 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  if (+[UIKeyboard isInputSystemUI])
  {
    v21 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    if ([v21 keyboardVisible])
    {
      v22 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
      char v23 = [v22 keyboardActive];

      if (v23) {
        goto LABEL_47;
      }
      goto LABEL_45;
    }
LABEL_46:

    goto LABEL_47;
  }
  if (+[UIKeyboard usesInputSystemUI])
  {
    if ([(UIKeyboardSceneDelegate *)self isWaitingForInputUI])
    {
      v31 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle];
      char v32 = [v31 animated];

      if (v32) {
        goto LABEL_47;
      }
LABEL_45:
      +[UIInputViewAnimationStyle animationStyleImmediate];
      v21 = v7;
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_46;
    }
    v39 = [(UIKeyboardSceneDelegate *)self containerRootController];
    id v40 = [v39 placement];
    if ([v40 accessoryViewWillAppear])
    {
      v41 = [(UIKeyboardSceneDelegate *)self containerRootController];
      v42 = [v41 placement];
      int v43 = [v42 showsKeyboard];

      if (!v43) {
        goto LABEL_47;
      }
    }
    else
    {
    }
    v21 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    uint64_t v44 = [v21 currentUIState];
    if (!v44) {
      goto LABEL_46;
    }
    v45 = (void *)v44;
    v46 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    v47 = [v46 currentUIState];
    char v48 = [v47 animated];

    if (v48) {
      goto LABEL_47;
    }
    goto LABEL_45;
  }
  if ([v20 keyboardVisible] && (objc_msgSend(v20, "keyboardActive") & 1) == 0) {
    goto LABEL_45;
  }
LABEL_47:
  int v86 = v19;
  [(UIKeyboardSceneDelegate *)self prepareToMoveKeyboardForInputViewSet:v8 animationStyle:v7];
  v49 = [(UIKeyboardSceneDelegate *)self containerWindow];
  char v50 = objc_opt_respondsToSelector();

  if (v50)
  {
    v51 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v52 = [(UIKeyboardSceneDelegate *)self containerWindow];
    [v51 removeObserver:v52 name:0x1ED160160 object:0];

    v53 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v54 = [(UIKeyboardSceneDelegate *)self containerWindow];
    [v53 addObserver:v54 selector:sel_applicationWindowRotated_ name:0x1ED160160 object:0];
  }
  v55 = [v20 keyboardWindow];
  uint64_t v24 = [v55 rootViewController];

  uint64_t v56 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  uint64_t v57 = v56 | v24;

  if (v57)
  {
    v85 = v20;
    uint64_t v58 = [(UIKeyboardSceneDelegate *)self scene];
    uint64_t v59 = [v8 inputView];
    uint64_t v60 = [v8 inputAccessoryView];
    uint64_t v61 = [v8 inputAssistantView];
    v83 = (void *)v58;
    if (v59 | v61)
    {
      v62 = +[_UIRemoteKeyboardPlaceholderView placeholderWithWidthSizer:&__block_literal_global_607 heightWithScene:v58];
    }
    else
    {
      v62 = 0;
    }
    [v62 setFallbackView:v59];
    [v62 setAssociatedView:v61];
    v68 = (void *)v60;
    uint64_t v84 = +[_UIRemoteKeyboardPlaceholderView placeholderForView:v60];
    unsigned int v79 = [v8 isCustomInputView];
    v82 = [v8 hostedCustomInputView];
    unsigned int v80 = [v8 isRemoteKeyboard];
    unsigned int v81 = [v8 shouldShowDockView];
    int v69 = [(UIKeyboardSceneDelegate *)self visualModeManager];
    int v70 = [v69 shouldShowWithinAppWindow];

    v71 = [(UIKeyboardSceneDelegate *)self visualModeManager];
    v72 = [(id)objc_opt_class() visualModeLog];

    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v97 = v70;
      _os_log_impl(&dword_1853B0000, v72, OS_LOG_TYPE_DEFAULT, "Show keyboard with visual mode windowed (%d)", buf, 8u);
    }

    if (+[UIKeyboard usesLocalKeyboard]
      || (+[_UIRemoteKeyboards sharedRemoteKeyboards],
          v73 = objc_claimAutoreleasedReturnValue(),
          int v74 = [v73 oldPathForSnapshot] | v70,
          v73,
          v74 == 1))
    {
      v25 = +[UIInputViewSet inputSetWithInputView:v62 accessoryView:v84 assistantView:0];
      v66 = v68;
      int v26 = +[UIInputViewSet inputSetWithInputView:v59 accessoryView:v68 assistantView:v61];
    }
    else
    {
      v25 = +[UIInputViewSet inputSetWithInputView:v59 accessoryView:v84 assistantView:v61];
      [v25 inheritNullState:v8];
      v66 = v68;
      int v26 = +[UIInputViewSet inputSetWithInputView:v62 accessoryView:v68 assistantView:0];

      [v26 inheritNullState:v25];
    }
    [v25 setIsCustomInputView:v79];
    [v26 setIsCustomInputView:v79];
    [v26 setHostedCustomInputView:v82];
    [v25 setIsRemoteKeyboard:v80];
    [v26 setIsRemoteKeyboard:v80];
    [v25 setShouldShowDockView:v81];
    [v26 setShouldShowDockView:v81];

    char v64 = v83;
    v67 = (void *)v84;
    goto LABEL_63;
  }
  v63 = [v8 keyboard];

  if (v63)
  {
    v85 = v20;
    char v64 = [v8 inputView];
    uint64_t v59 = +[_UIRemoteKeyboardPlaceholderView placeholderForView:v64];
    uint64_t v65 = [v8 inputAccessoryView];
    uint64_t v61 = [v8 inputAssistantView];
    v66 = (void *)v65;
    v62 = +[_UIRemoteKeyboardPlaceholderView placeholderForView:v61];
    int v26 = +[UIInputViewSet inputSetWithInputView:v59 accessoryView:v66 assistantView:v62];
    v25 = 0;
    v67 = v8;
LABEL_63:

    v20 = v85;
    goto LABEL_64;
  }
  v25 = 0;
  int v26 = v8;
LABEL_64:

  v19 = v86;
LABEL_65:
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_609;
  v90[3] = &unk_1E52D9F98;
  id v91 = (id)v24;
  id v92 = v25;
  v37 = (id)v24;
  v14 = v25;
  [v37 performOperations:v90 withAnimationStyle:v7];
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_2;
  v87[3] = &unk_1E52D9F98;
  id v88 = v19;
  id v38 = v26;
  id v89 = v38;
  id v75 = v19;
  [v75 performOperations:v87 withAnimationStyle:v7];
  kdebug_trace();
  kac_get_log();
  char v76 = (id)objc_claimAutoreleasedReturnValue();
  os_signpost_id_t v77 = os_signpost_id_make_with_pointer(v76, v8);
  if (v77 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    os_signpost_id_t v78 = v77;
    if (os_signpost_enabled(v76))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v76, OS_SIGNPOST_INTERVAL_END, v78, "setInputViews", "", buf, 2u);
    }
  }

LABEL_69:
}

- (UIInputWindowController)containerRootController
{
  id v2 = [(UIKeyboardSceneDelegate *)self containerWindow];
  BOOL v3 = [v2 rootViewController];

  return (UIInputWindowController *)v3;
}

- (UITextEffectsWindow)containerWindow
{
  return (UITextEffectsWindow *)[(UIKeyboardSceneDelegate *)self containerWindowForViewService:0];
}

- (UIInputViewSet)inputViews
{
  if (self->_containerWindow)
  {
    if (+[_UIRemoteKeyboards enabled])
    {
      BOOL v3 = [(UIKeyboardSceneDelegate *)self visualModeManager];
      char v4 = [v3 shouldShowWithinAppWindow];

      if ((v4 & 1) == 0)
      {
        id v5 = [(UIKeyboardSceneDelegate *)self keyboardWindow];
        id v6 = [v5 rootViewController];
        id v7 = [v6 inputViewSet];

        if (v7)
        {
          id v8 = [v7 inputView];
          char v9 = objc_opt_respondsToSelector();

          if ((v9 & 1) == 0)
          {
            os_signpost_id_t v10 = v7;
            goto LABEL_9;
          }
        }
      }
    }
    id v5 = [(UIKeyboardSceneDelegate *)self containerRootController];
    os_signpost_id_t v10 = [v5 inputViewSet];
    id v7 = v10;
LABEL_9:
    os_signpost_id_t v11 = [v10 normalizePlaceholders];

    goto LABEL_11;
  }
  os_signpost_id_t v11 = 0;
LABEL_11:
  return (UIInputViewSet *)v11;
}

- (UIKeyboardVisualModeManager)visualModeManager
{
  return self->_visualModeManager;
}

- (UIKBLocalAuthenticationObserver)localAuthenticationObserver
{
  return self->_localAuthenticationObserver;
}

- (void)_reloadInputViewsForKeyWindowSceneResponder:(id)a3 force:(BOOL)a4 fromBecomeFirstResponder:(BOOL)a5
{
  BOOL v190 = a5;
  BOOL v5 = a4;
  *(void *)((char *)&v200[2] + 4) = *MEMORY[0x1E4F143B8];
  id v8 = (UIResponder *)a3;
  char v9 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(UIKeyboardSceneDelegate *)self _responderDescriptionForLogging:v8];
    *(_DWORD *)buf = 138412546;
    *(void *)v195 = v10;
    *(_WORD *)&v195[8] = 1024;
    *(_DWORD *)v196 = v5;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Reloading input views for: %@ force: %d", buf, 0x12u);
  }
  kdebug_trace();
  kac_get_log();
  os_signpost_id_t v11 = (id)objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v11, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "reload", "", buf, 2u);
  }

  id v12 = [MEMORY[0x1E4F29128] UUID];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke;
  aBlock[3] = &__block_descriptor_40_e5_v8__0l;
  void aBlock[4] = 0xEEEEB0B5B2B2EEEELL;
  char v13 = (void (**)(void))_Block_copy(aBlock);
  v14 = [MEMORY[0x1E4F1C9C8] date];
  transitionStartTime = self->_transitionStartTime;
  self->_transitionStartTime = v14;

  os_signpost_id_t v16 = +[UIDictationView activeInstance];
  int v17 = [v16 visible];

  if (v17)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ![(UIResponder *)v8 _requiresKeyboardWhenFirstResponder])
    {
      self->_blockedReloadInputViewsForDictation = 1;
      goto LABEL_22;
    }
    if (self->_blockedReloadInputViewsForDictation)
    {
      uint64_t v18 = [(UIKeyboardSceneDelegate *)self responder];

      if (v18 == v8)
      {
        self->_blockedReloadInputViewsForDictation = 0;
        goto LABEL_22;
      }
    }
  }
  self->_blockedReloadInputViewsForDictation = 0;
  [(UIKeyboardSceneDelegate *)self disableInterfaceAutorotation:0];
  if (+[UIKeyboard isKeyboardProcess])
  {
    if (v8 && !v5) {
      +[UIKeyboard clearLastKeyboardApplicationIdentifier];
    }
    v19 = [(UIKeyboardSceneDelegate *)self containerRootController];
    int v20 = [v19 isRotating];

    if (v20)
    {
      v21 = [(UIKeyboardSceneDelegate *)self containerRootController];
      [v21 clearRotationState];
    }
  }
  if (!v5)
  {
    if ([(UIResponder *)v8 _requiresKeyboardWhenFirstResponder])
    {
      v22 = [(UIResponder *)v8 inputView];
      if (v22)
      {
      }
      else
      {
        char v23 = [(UIResponder *)v8 inputViewController];

        if (!v23) {
          goto LABEL_25;
        }
      }
    }
    uint64_t v24 = [(UIKeyboardSceneDelegate *)self containerRootController];
    [v24 clearKeyboardSnapshot];
  }
LABEL_25:
  v184 = v13;
  uint64_t v25 = [(UIKeyboardSceneDelegate *)self responder];
  v182 = v12;
  id obj = a3;
  if ((unint64_t)v8 | v25) {
    goto LABEL_30;
  }
  uint64_t v25 = [(UIInputViewPostPinningReloadState *)self->_postPinningReloadState responderToReload];
  if (v25) {
    goto LABEL_30;
  }
  if ([(UIKeyboardSceneDelegate *)self isOnScreen]
    || [(UIKeyboardSceneDelegate *)self isUndocked])
  {
    uint64_t v25 = 0;
LABEL_30:

LABEL_31:
    int v26 = [(UIResponder *)v8 _keyboardResponder];
    BOOL v27 = +[UIKeyboardImpl activeInstance];
    v176 = [v27 delegate];

    v178 = v26;
    BOOL v28 = [(UIKeyboardSceneDelegate *)self isOnScreen];
    if (![(UIResponder *)v8 _requiresKeyboardWhenFirstResponder]
      || ![(UIResponder *)v8 isFirstResponder]
      || v28
      || [(UIKeyboardSceneDelegate *)self isUndocked])
    {
      int v29 = 0;
    }
    else
    {
      uint64_t v60 = +[UIKeyboardImpl activeInstance];
      int v29 = [v60 disableInputBars] ^ 1;
    }
    if ([(UIResponder *)v8 _requiresKeyboardResetOnReload]
      && self->_reloadInputViewsForcedIsAllowed)
    {
      BOOL v30 = v29 && ![(UIKeyboardSceneDelegate *)self isWaitingForInputUI] || v178 != v176;
    }
    else
    {
      BOOL v30 = 0;
    }
    if (+[UIKeyboard usesInputSystemUI] && self->_responder == v8)
    {
      uint64_t v58 = [(UIResponder *)v8 inputView];
      if (v58)
      {
        BOOL v59 = 1;
      }
      else
      {
        os_signpost_id_t v78 = [(UIResponder *)v8 inputViewController];
        BOOL v59 = v78 != 0;
      }
      unsigned int v79 = [(UIRemoteInputViewHost *)self->_remoteInputViewHost inputViewSet];
      int v31 = v59 ^ [v79 isCustomInputView];
    }
    else
    {
      int v31 = 0;
    }
    if ((v30 | v31) == 1)
    {
      char v32 = +[UIKeyboardImpl activeInstance];
      v186 = [v32 textSuggestions];

      v33 = +[UIKeyboardImpl activeInstance];
      [v33 setDelegate:0 force:0 delayEndInputSession:v190];
    }
    else
    {
      v186 = 0;
    }
    BOOL v34 = (!self->_automaticAppearanceEnabled || self->_responderWithoutAutomaticAppearanceEnabled != v8)
       && [(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled];
    v35 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67110146;
      *(_DWORD *)v195 = v8 != 0;
      *(_WORD *)&v195[4] = 1024;
      *(_DWORD *)&v195[6] = v5;
      *(_WORD *)v196 = 1024;
      *(_DWORD *)&v196[2] = v190;
      __int16 v197 = 1024;
      int v198 = v34;
      __int16 v199 = 2112;
      v200[0] = v12;
      _os_log_impl(&dword_1853B0000, v35, OS_LOG_TYPE_DEFAULT, "_reloadInputViewsForKeyWindowSceneResponder: %d force: %d, fromBecomeFirstResponder: %d (automaticKeyboard: %d, reloadIdentifier: %@)", buf, 0x24u);
    }

    v183 = [(UIKeyboardSceneDelegate *)self inputViews];
    BOOL v174 = v34;
    id v36 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v8 withAutomaticKeyboard:v34 force:v5];
    objc_storeStrong((id *)&self->_transientInputViewSet, v36);
    p_responder = &self->_responder;
    responder = self->_responder;
    if (responder)
    {
      id v39 = [(UIResponder *)responder _window];
    }
    else
    {
      id v39 = 0;
    }
    id v185 = v39;
    uint64_t v40 = [v39 screen];
    if (v8)
    {
      id v41 = [(UIResponder *)v8 _window];
    }
    else
    {
      id v41 = 0;
    }
    v181 = v41;
    v189 = [v41 screen];
    v42 = +[UIKeyboard activeKeyboardForScreen:](UIKeyboard, "activeKeyboardForScreen:");
    int v43 = v42;
    if (v42)
    {
      id v188 = v42;
    }
    else
    {
      id v188 = [v36 keyboard];
    }
    if ((void *)v40 != v189 && v40 && v189)
    {
      id v44 = +[UIKeyboard activeKeyboardForScreen:v40];
      v45 = v44;
      if (v44 && v188 && v44 != v188) {
        [v44 deactivate];
      }
    }
    v46 = v188;
    if (v188 && ([v188 isActive] & 1) != 0) {
      goto LABEL_284;
    }
    if ([(UIResponder *)v8 _requiresKeyboardWhenFirstResponder])
    {
      if (v190 && !+[UIKeyboard isInputSystemUI])
      {
        kdebug_trace();
        kac_get_log();
        v47 = (id)objc_claimAutoreleasedReturnValue();
        os_signpost_id_t v48 = os_signpost_id_make_with_pointer(v47, 0);
        if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          os_signpost_id_t v49 = v48;
          if (os_signpost_enabled(v47))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1853B0000, v47, OS_SIGNPOST_INTERVAL_BEGIN, v49, "appBringup", " enableTelemetry=YES ", buf, 2u);
          }
        }

        char v50 = keyboardui_system_get_log_STAGING();
        if (os_signpost_enabled(v50))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1853B0000, v50, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "keyboardUIBringup", "", buf, 2u);
        }

        v51 = _UIKeyboardSceneDelegateLogger();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)v195 = 0xEEEEB0B5B2B2EEEELL;
          _os_log_debug_impl(&dword_1853B0000, v51, OS_LOG_TYPE_DEBUG, "START app and keyboard bringup signpost (first responder); ID: %llu",
            buf,
            0xCu);
        }

        qword_1EB2604E8 = mach_absolute_time();
        v46 = v188;
      }
      _MergedGlobals_1038 = v190;
    }
    if (v46)
    {
LABEL_284:
      if (([v46 isActive] & 1) == 0
        && [(UIResponder *)v8 _requiresKeyboardWhenFirstResponder])
      {
        [v46 activate];
      }
    }
    v52 = +[UIKeyboardInputModeController sharedInputModeController];
    [v52 _trackInputModeIfNecessary:v8];

    v53 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];

    if (v53 != self)
    {
      [(UIRemoteInputViewHost *)self->_remoteInputViewHost setInputViewSet:0];
      goto LABEL_99;
    }
    if (v5)
    {
      v54 = +[UIKeyboardInputModeController sharedInputModeController];
      v55 = [v54 currentInputMode];
      uint64_t v56 = [v55 identifier];
      if ([v56 isEqualToString:@"autofillsignup"])
      {
        BOOL v57 = [(UIRemoteInputViewHost *)self->_remoteInputViewHost shouldShowDockView];

        if (v57)
        {
LABEL_99:
          uint64_t v61 = +[UIKeyboard isKeyboardProcess] | v190;
          v187 = (void *)v40;
          if (![(UIResponder *)v8 _requiresKeyboardWhenFirstResponder])
          {
LABEL_104:
            v67 = +[UIKeyboardImpl activeInstance];
            v68 = [v67 delegate];
            BOOL v69 = v68 != 0;

            [v67 _shouldClearTextSuggestions:v61];
            int v70 = +[UIKeyboardImpl activeInstance];
            BOOL v71 = v190 || [(UIKeyboardSceneDelegate *)self pinningPreventsInputViews:v36];
            [v70 setDelegate:0 force:0 delayEndInputSession:v71];
LABEL_141:

            transientInputViewSet = self->_transientInputViewSet;
            self->_transientInputViewSet = 0;

            if ([(UIKeyboardSceneDelegate *)self pinningPreventsInputViews:v36])
            {
              uint64_t v84 = +[UIInputViewPostPinningReloadState stateWithResponder:v8];
              postPinningReloadState = self->_postPinningReloadState;
              self->_postPinningReloadState = v84;

              int v86 = +[UIKeyboardImpl activeInstance];
              BOOL v87 = +[UIDictationController activeInstance];
              char v88 = [v87 shouldStayInDictationInputMode];

              if ([(UIKeyboardSceneDelegate *)self hasDictationKeyboard] && (v88 & 1) == 0)
              {
                id v89 = +[UIKeyboardInputModeController sharedInputModeController];
                v90 = [v89 currentInputModeInPreference];
                [v86 setKeyboardInputMode:v90 userInitiated:0];
              }
              [(UIKeyboardSceneDelegate *)self setTextEffectsWindowLevelForInputView:v36 responder:v8];
              char v13 = v184;
              v184[2](v184);

              id v91 = v185;
              id v92 = v187;
LABEL_270:

              id v12 = v182;
              goto LABEL_271;
            }
            if ([v189 _userInterfaceIdiom] == 3)
            {
LABEL_159:
              id v91 = v185;
              if (![(UIKeyboardSceneDelegate *)self _isIgnoringReloadInputViews])
              {
                int v102 = [v36 containsResponder:v8];
                selfHostingTrigger = self->_selfHostingTrigger;
                if (!v102)
                {
                  v104 = 0;
                  goto LABEL_164;
                }
                if (!selfHostingTrigger)
                {
                  v104 = [(UIKeyboardSceneDelegate *)self responder];
                  selfHostingTrigger = self->_selfHostingTrigger;
LABEL_164:
                  self->_selfHostingTrigger = v104;
                }
              }
              v105 = *p_responder;
              if (*p_responder && v105 != v8)
              {
                v106 = [(UIResponder *)v105 _responderWindow];
                [v106 _removeWindowLevelChangedObserver:self];
              }
              objc_storeStrong((id *)&self->_responder, obj);
              v107 = self->_postPinningReloadState;
              self->_postPinningReloadState = 0;

              [(UIKeyboardSceneDelegate *)self _updateTextInputSession];
              id v92 = v187;
              if (!v5 && +[UIKeyboard usesInputSystemUI])
              {
                BOOL v108 = [(UIResponder *)v8 isFirstResponder];
                BOOL v109 = [(UIResponder *)v8 _requiresKeyboardWhenFirstResponder];
                unsigned int v110 = [v36 isCustomInputView];
                unsigned int v177 = v110;
                if (v108)
                {
                  v111 = [v36 inputAccessoryView];
                  if (v111 && ([v36 isInputAccessoryViewPlaceholder] & 1) == 0)
                  {
                    uint64_t v112 = [v183 inputAccessoryView];
                    if (v112) {
                      BOOL v113 = 1;
                    }
                    else {
                      BOOL v113 = v185 == 0;
                    }
                    if (v113) {
                      v114 = (void *)v112;
                    }
                    else {
                      v114 = 0;
                    }
                  }
                  BOOL v115 = [(UIKeyboardSceneDelegate *)self showingKeyboardForInputViewSet:v36];
                  int v116 = v69 || v109;
                  if ((((v69 || v109) | v177) & 1) == 0)
                  {
                    if (v115)
                    {
                      int v117 = self->_sessionID == 0;
                      BOOL v115 = 1;
                      goto LABEL_195;
                    }
                    goto LABEL_194;
                  }
                }
                else
                {
                  int v116 = v69 || v109;
                  if ((((v69 || v109) | v110) & 1) == 0)
                  {
LABEL_194:
                    BOOL v115 = 0;
                    int v117 = self->_sessionID != 0;
LABEL_195:
                    int v120 = v108 && !v174;
                    v121 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
                    int v122 = [v121 shouldIgnoreInputDestinationChange:v115 withIAVHeight:0.0];

                    BOOL v179 = v115;
                    if ([(UIKeyboardSceneDelegate *)self isWaitingForInputUI])
                    {
                      int v123 = 1;
                      id v92 = v187;
                    }
                    else
                    {
                      id v92 = v187;
                      if ((v69 | v117) == 1) {
                        int v123 = (v120 | v122) ^ 1;
                      }
                      else {
                        int v123 = 0;
                      }
                    }
                    v124 = _UIKeyboardSceneDelegateLogger();
                    if (os_log_type_enabled(v124, OS_LOG_TYPE_DEFAULT))
                    {
                      BOOL v125 = [(UIKeyboardSceneDelegate *)self isWaitingForInputUI];
                      *(_DWORD *)buf = 67110400;
                      *(_DWORD *)v195 = v125;
                      *(_WORD *)&v195[4] = 1024;
                      *(_DWORD *)&v195[6] = v69;
                      *(_WORD *)v196 = 1024;
                      *(_DWORD *)&v196[2] = v117;
                      __int16 v197 = 1024;
                      int v198 = v120;
                      __int16 v199 = 1024;
                      LODWORD(v200[0]) = v122;
                      WORD2(v200[0]) = 1024;
                      *(_DWORD *)((char *)v200 + 6) = v123;
                      _os_log_impl(&dword_1853B0000, v124, OS_LOG_TYPE_DEFAULT, "shouldUpdateKeyboardArbiter (waitingForInputUI: %d, didSetDelegate: %d, shouldUpdateRTI: %d, showingManualKeyboard: %d, shouldIgnoreInputDestinationChange: %d) -> %d", buf, 0x26u);
                    }

                    char v13 = v184;
                    if (v117)
                    {
                      v126 = _UIKeyboardSceneDelegateLogger();
                      if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_1853B0000, v126, OS_LOG_TYPE_DEFAULT, "Updating RTI manually", buf, 2u);
                      }

                      v127 = +[UIKeyboardImpl activeInstance];
                      if (!v127)
                      {
                        v127 = +[UIKeyboardImpl sharedInstanceForCustomInputView:v177];
                      }
                      if (v179)
                      {
                        [(UIRemoteInputViewHost *)self->_remoteInputViewHost updateInputViewsIfNecessary];
                        v128 = [MEMORY[0x1E4F29128] UUID];
                        sessionID = self->_sessionID;
                        self->_sessionID = v128;

                        v130 = [v127 remoteTextInputPartner];
                        [v130 beginAllowingRemoteTextInput:self->_sessionID];

                        v131 = [v127 remoteTextInputPartner];
                        [v131 beginInputSessionWithIdentifier:self->_sessionID];
                      }
                      else
                      {
                        if (os_variant_has_internal_diagnostics())
                        {
                          v173 = _UIKeyboardExtendedLog();
                          if (os_log_type_enabled(v173, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_1853B0000, v173, OS_LOG_TYPE_DEFAULT, "ending session for shouldShow==NO for non-UIKeyInput", buf, 2u);
                          }

                          char v13 = v184;
                        }
                        v132 = [v127 remoteTextInputPartnerPrivate];
                        [v132 endInputSessionWithIdentifier:self->_sessionID];

                        v133 = [v127 remoteTextInputPartnerPrivate];
                        [v133 endAllowingRemoteTextInput:self->_sessionID];

                        v131 = self->_sessionID;
                        self->_sessionID = 0;
                      }

                      id v92 = v187;
                    }
                    if (!v123)
                    {
                      LOBYTE(v137) = 0;
                      goto LABEL_239;
                    }
                    v134 = [v36 inputAccessoryView];
                    if (v134)
                    {
                      BOOL v135 = v179;
                      if ([v36 isInputAccessoryViewPlaceholder])
                      {
                        BOOL v136 = 0;
                      }
                      else
                      {
                        v141 = [v183 inputAccessoryView];
                        v142 = [v36 inputAccessoryView];
                        if (v141 == v142)
                        {
                          BOOL v136 = 0;
                        }
                        else
                        {
                          v143 = [v36 inputAccessoryView];
                          if ([v143 isFirstResponder])
                          {
                            BOOL v136 = 0;
                          }
                          else
                          {
                            v145 = [v36 inputAccessoryView];
                            v146 = [v145 window];
                            BOOL v136 = v146 == 0;
                          }
                        }
                      }
                    }
                    else
                    {
                      BOOL v136 = 0;
                      BOOL v135 = v179;
                    }

                    [(UIKeyboardSceneDelegate *)self setWaitingForInputUI:v182];
                    v147 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
                    v148 = [(UIKeyboardSceneDelegate *)self scene];
                    int v137 = [v147 inputDestinationDidChange:v135 withIAVHeight:0 isIAVRelevant:1 notifyRemote:v148 forScene:0.0];

                    v149 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
                    v150 = [v149 currentUIState];
                    char v151 = 0;
                    if ([v150 isLocal])
                    {
                      v152 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
                      v153 = [v152 currentUIState];
                      char v151 = [v153 keyboardOnScreen];
                    }
                    if ([v36 isInputViewPlaceholder])
                    {
                      id v92 = v187;
                      if ((v151 & 1) != 0 || !v136)
                      {
                        char v13 = v184;
                        goto LABEL_238;
                      }
                      char v13 = v184;
                      if ((v137 ^ 1))
                      {
LABEL_238:
                        [(UIKeyboardSceneDelegate *)self _updateContainerWindowLevel];
LABEL_239:
                        v156 = _UIKeyboardSceneDelegateLogger();
                        if (os_log_type_enabled(v156, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)buf = 138412290;
                          *(void *)v195 = v36;
                          _os_log_impl(&dword_1853B0000, v156, OS_LOG_TYPE_DEFAULT, "Will set input views %@", buf, 0xCu);
                        }

                        id v91 = v185;
                        if (v137) {
                          goto LABEL_243;
                        }
                        goto LABEL_242;
                      }
                      v154 = [v36 inputAccessoryView];
                      uint64_t v155 = +[UIInputViewSet inputSetWithInputView:0 accessoryView:v154 assistantView:0];

                      id v36 = (id)v155;
                    }
                    else
                    {
                      char v13 = v184;
                    }
                    id v92 = v187;
                    goto LABEL_238;
                  }
                  BOOL v115 = 0;
                }
                int v117 = v116 ^ 1;
                goto LABEL_195;
              }
              if (!self->_sessionID)
              {
                char v13 = v184;
LABEL_242:
                [(UIKeyboardSceneDelegate *)self cleanUpWaitingForInputUI];
LABEL_243:
                if ([(UIKeyboardSceneDelegate *)self _isIgnoringReloadInputViews])
                {
                  ++self->_ignoredReloads;
                  v13[2](v13);
                }
                else
                {
                  v191[0] = MEMORY[0x1E4F143A8];
                  v191[1] = 3221225472;
                  v191[2] = __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_567;
                  v191[3] = &unk_1E52D9F98;
                  v191[4] = self;
                  id v36 = v36;
                  id v192 = v36;
                  v157 = (void (**)(void))_Block_copy(v191);
                  if (qword_1EB2604F0 != -1) {
                    dispatch_once(&qword_1EB2604F0, &__block_literal_global_569);
                  }
                  if (dyld_program_sdk_at_least() && !_UIIsPrivateMainBundle())
                  {
                    int v160 = !+[UIKeyboard usesInputSystemUI];
                  }
                  else
                  {
                    if (qword_1EB260508 != -1) {
                      dispatch_once(&qword_1EB260508, &__block_literal_global_1110);
                    }
                    v158 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
                    v159 = [v158 valueForPreferenceKey:@"NewKeyboardNotificationOrder"];

                    if ([v159 BOOLValue]) {
                      int v160 = !+[UIKeyboard usesInputSystemUI];
                    }
                    else {
                      int v160 = 0;
                    }
                    id v92 = v187;
                  }
                  if (byte_1EB2604D1 || v160)
                  {
                    uint64_t v162 = +[UIKeyboardImpl activeInstance];
                    v163 = [(id)v162 inputDelegateManager];
                    char v164 = [v163 hasAsyncCapableInputDelegate];

                    LOBYTE(v162) = [v36 isEmpty];
                    uint64_t v180 = [(NSMutableArray *)self->_animationStyleStack count];
                    v165 = [(id)UIApp _touchesEvent];
                    v166 = [v165 allTouches];
                    uint64_t v167 = [v166 count];

                    v161 = +[UIPeripheralHost sharedInstance];
                    v168 = [MEMORY[0x1E4F29238] valueWithPointer:self];
                    if ((v162 & 1) == 0
                      && (v164 & 1) == 0
                      && ((v160 & 1) != 0
                       || !v180 && (v167 || [v161 hasDelayedTasksForKey:v168])))
                    {
                      if (byte_1EB2604D1) {
                        [v161 queueDelayedTask:v157 forKey:v168];
                      }
                      else {
                        [v161 queueDelayedTask:v157 forKey:v168 delay:0.01];
                      }
                    }
                    else
                    {
                      [v161 flushDelayedTasksForKey:v168];
                      v157[2](v157);
                    }
                    char v13 = v184;
                    id v92 = v187;
                  }
                  else
                  {
                    v157[2](v157);
                    v161 = self->_transitionStartTime;
                    self->_transitionStartTime = 0;
                  }

                  if (!v190)
                  {
                    v169 = +[UIKeyboardImpl activeInstance];
                    [v169 restoreTextSuggestions];

                    id v92 = v187;
                  }
                  v13[2](v13);

                  id v91 = v185;
                }
                goto LABEL_270;
              }
              char v13 = v184;
              if (![v36 isCustomInputView]
                || [(UIResponder *)v8 _requiresKeyboardWhenFirstResponder])
              {
                goto LABEL_242;
              }
              v118 = +[UIKeyboardImpl activeInstance];
              if (!v118)
              {
                id v92 = v187;
                v118 = +[UIKeyboardImpl sharedInstanceForCustomInputView:](UIKeyboardImpl, "sharedInstanceForCustomInputView:", [v36 isCustomInputView]);
              }
              v119 = [v118 inputDelegate];
              if (!v119)
              {
                v139 = [v118 remoteTextInputPartner];
                v140 = [v139 rtiClient];

                id v92 = v187;
                if (v140) {
                  goto LABEL_220;
                }
                v144 = [v118 remoteTextInputPartner];
                [v144 beginAllowingRemoteTextInput:self->_sessionID];

                id v92 = v187;
                v119 = [v118 remoteTextInputPartner];
                [v119 beginInputSessionWithIdentifier:self->_sessionID];
              }

LABEL_220:
              id v91 = v185;
              goto LABEL_242;
            }
            if (![(UIResponder *)v8 _requiresKeyboardWhenFirstResponder]) {
              goto LABEL_150;
            }
            v93 = +[UIKeyboardInputModeController sharedInputModeController];
            id v94 = [v93 currentInputMode];
            if ([v94 isExtensionInputMode])
            {
              char v95 = [v36 isCustomInputView];

              if (v95)
              {
LABEL_150:
                if ([(UIKeyboardSceneDelegate *)self _isIgnoringReloadInputViews]) {
                  goto LABEL_159;
                }
                v96 = [v183 inputViewController];
                int v97 = [v96 _compatibilityController];
                [v97 setTearingDownInputController];
                goto LABEL_157;
              }
            }
            else
            {
            }
            uint64_t v98 = +[UIKeyboardInputModeController sharedInputModeController];
            v96 = [v98 currentInputMode];

            v99 = [v96 identifier];
            int v100 = [v99 isEqualToString:@"autofillsignup"];

            if (v100)
            {
              if (!+[UIKeyboard usesInputSystemUI])
              {
LABEL_158:

                goto LABEL_159;
              }
              [(UIKeyboardSceneDelegate *)self remoteHostInputViewSet:v36];
              int v97 = v36;
              id v36 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              int v97 = [v36 inputViewController];
              v101 = [v97 _compatibilityController];
              [v101 setInputMode:v96];
            }
LABEL_157:

            goto LABEL_158;
          }
          if (!+[UIKeyboard isInHardwareKeyboardMode])
          {
            v62 = [v36 hostedCustomInputView];
            v63 = v62;
            if (v62 && ([v62 frame], v64 == 0.0))
            {
              uint64_t v65 = [v63 subviews];
              uint64_t v66 = [v65 count];

              if (!v66) {
                goto LABEL_104;
              }
            }
            else
            {
            }
          }
          [(UIKeyboardSceneDelegate *)self updateRenderConfigForResponder:v8];
          v67 = +[UIKeyboardImpl activeInstance];
          if (!v67)
          {
            if ([(UIKeyboardSceneDelegate *)self automaticAppearanceEnabled])
            {
              v72 = [(UIResponder *)v8 inputView];
              BOOL v73 = v72 != 0;
            }
            else
            {
              BOOL v73 = 0;
            }
            v67 = +[UIKeyboardImpl sharedInstanceForCustomInputView:v73];
          }
          int v70 = [(UIResponder *)v8 _keyboardResponder];
          if (+[UIKeyboard usesInputSystemUI]
            && !self->_automaticAppearanceEnabledInternal)
          {
            os_signpost_id_t v77 = [v67 delegate];

            if (v77 == v70)
            {
              [v67 setDelegate:v70];
              BOOL v69 = 1;
            }
            else
            {
              BOOL v69 = 0;
            }
LABEL_140:
            v82 = [v67 geometryDelegate];
            [v82 syncMinimizedStateToHardwareKeyboardAttachedState];

            goto LABEL_141;
          }
          int v74 = [v67 geometryDelegate];
          if (!v74)
          {
            if ([v67 forCustomInputView]) {
              goto LABEL_118;
            }
            int v74 = [v36 keyboard];
            if (v74)
            {
              [v67 setGeometryDelegate:v74];
            }
            else
            {
              v138 = +[UIKeyboardAutomatic sharedInstance];
              [v67 setGeometryDelegate:v138];
            }
          }

LABEL_118:
          if (+[UIKeyboard usesInputSystemUI])
          {
            id v75 = _UIKeyboardSceneDelegateLogger();
            if (os_log_type_enabled(v75, OS_LOG_TYPE_DEFAULT))
            {
              char v76 = [v67 geometryDelegate];
              *(_DWORD *)buf = 138412290;
              *(void *)v195 = v76;
              _os_log_impl(&dword_1853B0000, v75, OS_LOG_TYPE_DEFAULT, "_reloadInputViewsForKeyWindowSceneResponder, updateInputViewsIfNecessary for geometryDelegate: %@", buf, 0xCu);
            }
            [(UIRemoteInputViewHost *)self->_remoteInputViewHost updateInputViewsIfNecessary];
          }
          [v67 _shouldClearTextSuggestions:v61];
          [v67 setDelegate:v70 force:0 delayEndInputSession:v190];
          BOOL v69 = 1;
          if (v178 == v176 && v186) {
            [v67 setSuggestions:v186];
          }
          goto LABEL_140;
        }
      }
      else
      {
      }
    }
    [(UIRemoteInputViewHost *)self->_remoteInputViewHost setInputViewSet:v36];
    [(UIRemoteInputViewHost *)self->_remoteInputViewHost setShouldShowDockView:0];
    goto LABEL_99;
  }
  uint64_t v25 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  if ([(id)v25 keyboardVisible]) {
    goto LABEL_30;
  }
  unsigned int v80 = [(UIKeyboardSceneDelegate *)self inputViews];
  if ([v80 isInputViewPlaceholder])
  {
LABEL_138:

    goto LABEL_30;
  }
  unsigned int v81 = [(UIKeyboardSceneDelegate *)self inputViews];
  if (([v81 isInputAccessoryViewPlaceholder] & 1) != 0 || self->_allowNilResponderReload)
  {

    goto LABEL_138;
  }
  v170 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  [v170 heightForRemoteIAVPlaceholderIfNecessary];
  double v172 = v171;

  id v12 = v182;
  if (v172 != 0.0) {
    goto LABEL_31;
  }
LABEL_22:
  v13[2](v13);
LABEL_271:
}

+ (id)automaticKeyboardArbiterClient
{
  if (+[UIKeyboard inputUIOOP]
    || +[UIKeyboard supportsAutoFillPanel]
    && +[UIKeyboard isKeyboardProcess])
  {
    id v2 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
  }
  else
  {
    id v2 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  }
  return v2;
}

- (id)keyboardWindow
{
  if (+[UIKeyboard inputUIOOP])
  {
    if (+[UIKeyboard isInputSystemUI])
    {
      BOOL v3 = [(UIKeyboardSceneDelegate *)self containerWindow];
    }
    else
    {
      BOOL v3 = 0;
    }
  }
  else
  {
    char v4 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    BOOL v3 = [v4 keyboardWindow];
  }
  return v3;
}

- (BOOL)_isIgnoringReloadInputViews
{
  return self->_ignoringReloadInputViews > 0;
}

- (id)_responderDescriptionForLogging:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v3, "_kb_description");
  }
  else {
  char v4 = [NSString stringWithFormat:@"<%@: %p; >", objc_opt_class(), v3];
  }

  return v4;
}

- (BOOL)pinningPreventsInputViews:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_pinningResponders count] && !self->_ignoresPinning)
  {
    id v6 = [(UIKeyboardSceneDelegate *)self inputViews];
    char v5 = [v6 isStrictSupersetOfViewSet:v4];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke(uint64_t a1)
{
  if (_MergedGlobals_1038)
  {
    *(void *)buf = 0;
    char v9 = buf;
    uint64_t v10 = 0x3032000000;
    os_signpost_id_t v11 = __Block_byref_object_copy__86;
    id v12 = __Block_byref_object_dispose__86;
    id v13 = 0;
    id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_556;
    v7[3] = &unk_1E52EDD98;
    uint64_t v3 = *(void *)(a1 + 32);
    v7[4] = buf;
    v7[5] = v3;
    uint64_t v4 = [v2 addObserverForName:0x1ED149860 object:0 queue:0 usingBlock:v7];
    char v5 = (void *)*((void *)v9 + 5);
    *((void *)v9 + 5) = v4;

    _Block_object_dispose(buf, 8);
  }
  kdebug_trace();
  id v6 = kac_get_log();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1853B0000, v6, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "reload", "", buf, 2u);
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
    char v5 = &selRef_beginDisablingInterfaceAutorotation;
  }
  else
  {
    if (!self->_interfaceAutorotationDisabled) {
      return;
    }
    BOOL v4 = 0;
    char v5 = &selRef_endDisablingInterfaceAutorotation;
  }
  id v6 = [(id)UIApp windows];
  [v6 makeObjectsPerformSelector:*v5];

  self->_interfaceAutorotationDisabled = v4;
}

- (BOOL)automaticAppearanceReallyEnabled
{
  return self->_automaticAppearanceEnabled && self->_automaticAppearanceEnabledInternal;
}

- (void)_updateTextInputSession
{
  uint64_t v3 = +[UIKeyboardImpl activeInstance];
  BOOL v4 = [v3 textInputTraits];
  int v5 = [v4 isSecureTextEntry];

  BOOL v6 = [(UIResponder *)self->_responder _requiresKeyboardWhenFirstResponder];
  if (v5) {
    goto LABEL_16;
  }
  BOOL v7 = v6;
  responder = self->_responder;
  if (responder) {
    BOOL v9 = v7;
  }
  else {
    BOOL v9 = 0;
  }
  sessionAnalytics = self->_sessionAnalytics;
  if (v9)
  {
    if (!sessionAnalytics)
    {
      os_signpost_id_t v11 = objc_alloc_init(UITextInputSessionActionAnalytics);
      id v12 = self->_sessionAnalytics;
      self->_sessionAnalytics = v11;

      [(UITextInputSessionActionAnalytics *)self->_sessionAnalytics setDelegateSource:self];
      id v13 = self->_sessionAnalytics;
      [(UITextInputSessionActionAnalytics *)v13 didBegin];
      return;
    }
    goto LABEL_12;
  }
  if (!sessionAnalytics) {
    return;
  }
  if (responder)
  {
LABEL_12:
    if (_UIResponderRequiresTextInput(responder)) {
      return;
    }
    sessionAnalytics = self->_sessionAnalytics;
  }
  [(UITextInputSessionActionAnalytics *)sessionAnalytics writeAnalytics];
LABEL_16:
  v14 = self->_sessionAnalytics;
  self->_sessionAnalytics = 0;
}

- (BOOL)isUndocked
{
  id v2 = [(UITextEffectsWindow *)self->_containerWindow rootViewController];
  char v3 = [v2 isUndocked];

  return v3;
}

- (int)_endIgnoringReloadInputViews
{
  int v2 = self->_ignoringReloadInputViews - 1;
  self->_ignoringReloadInputViews = v2;
  if (v2) {
    return 0;
  }
  else {
    return self->_ignoredReloads;
  }
}

- (void)_beginIgnoringReloadInputViews
{
  int ignoringReloadInputViews = self->_ignoringReloadInputViews;
  if (!ignoringReloadInputViews) {
    self->_ignoredReloads = 0;
  }
  self->_int ignoringReloadInputViews = ignoringReloadInputViews + 1;
}

- (void)_setScene:(id)a3
{
}

- (UIWindow)keyWindowCandidate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
  return (UIWindow *)WeakRetained;
}

- (BOOL)automaticAppearanceEnabled
{
  return self->_automaticAppearanceEnabled;
}

- (id)nextAnimationStyle:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(NSMutableArray *)self->_animationStyleStack count])
  {
    int v5 = [(NSMutableArray *)self->_animationStyleStack lastObject];
  }
  else if (self->_hasCustomAnimationProperties)
  {
    int v5 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:1 duration:self->_nextAutomaticOrderInDirection outDirection:self->_nextAutomaticOrderInDuration];
  }
  else
  {
    if (v3) {
      +[UIInputViewAnimationStyle animationStyleDefault];
    }
    else {
    int v5 = +[UIInputViewAnimationStyle animationStyleImmediate];
    }
  }
  return v5;
}

- (id)nextAnimationStyle
{
  return [(UIKeyboardSceneDelegate *)self nextAnimationStyle:1];
}

- (void)setAutomaticAppearanceInternalEnabled:(BOOL)a3
{
  self->_automaticAppearanceEnabledInternal = a3;
}

- (NSString)hardwareKeyboardExclusivityIdentifier
{
  return self->_hardwareKeyboardExclusivityIdentifier;
}

- (UISystemInputAssistantViewController)systemInputAssistantViewController
{
  return (UISystemInputAssistantViewController *)[(UIKeyboardSceneDelegate *)self systemInputAssistantViewControllerForResponder:self->_responder];
}

- (id)systemInputAssistantViewControllerForResponder:(id)a3
{
  id v4 = a3;
  int v5 = v4;
  if (!self->_systemInputAssistantViewController)
  {
    BOOL v6 = [v4 _keyboardResponder];
    if ([v6 conformsToProtocol:&unk_1ED42F658])
    {

LABEL_5:
      BOOL v9 = objc_alloc_init(UISystemInputAssistantViewController);
      systemInputAssistantViewController = self->_systemInputAssistantViewController;
      self->_systemInputAssistantViewController = v9;

      os_signpost_id_t v11 = [(UIViewController *)self->_systemInputAssistantViewController view];
      [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

      goto LABEL_6;
    }
    BOOL v7 = [v5 _keyboardResponder];
    int v8 = [v7 conformsToProtocol:&unk_1ED700940];

    if (v8) {
      goto LABEL_5;
    }
  }
LABEL_6:
  id v12 = self->_systemInputAssistantViewController;

  return v12;
}

- (void)prepareToMoveKeyboardForInputViewSet:(id)a3 animationStyle:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  BOOL v7 = [(UIKeyboardSceneDelegate *)self _windowScene];
  uint64_t v8 = [v7 _isKeyWindowScene];
  if (+[UIKeyboard usesInputSystemUI]) {
    uint64_t v8 = v8 & ([v38 isInputAccessoryViewPlaceholder] ^ 1);
  }
  if (+[_UIRemoteKeyboards enabled])
  {
    BOOL v9 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    int v10 = [v9 handlingRemoteEvent];

    uint64_t v8 = v8 & ~v10;
  }
  os_signpost_id_t v11 = [v6 endPlacementForInputViewSet:v38 windowScene:v7];
  BOOL v12 = [(UIKeyboardSceneDelegate *)self _showKeyboardWindowForInputViewSet:v38 placement:v11 windowScene:v7];
  if (+[UIKeyboard inputUIOOP])
  {
    if (+[UIKeyboard usesInputSystemUI]) {
      BOOL v12 = [(UIKeyboardSceneDelegate *)self showingKeyboardForInputViewSet:v38];
    }
    [v11 remoteIntrinsicContentSizeForInputViewInSet:v38 includingIAV:0];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    [v11 remoteIntrinsicContentSizeForInputViewInSet:v38 includingIAV:1];
    -[UIKeyboardSceneDelegate updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:](self, "updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:", v8, v12, v8, v7, v14, v16, v18, v20, v21, v22, v23, v24);
  }
  else
  {
    uint64_t v25 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [v11 remoteIntrinsicContentSizeForInputViewInSet:v38 includingIAV:0];
    double v27 = v26;
    double v29 = v28;
    double v31 = v30;
    double v33 = v32;
    [v11 remoteIntrinsicContentSizeForInputViewInSet:v38 includingIAV:1];
    objc_msgSend(v25, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", objc_msgSend(v38, "isInputAccessoryViewPlaceholder") ^ 1, v12, v8, v7, v27, v29, v31, v33, v34, v35, v36, v37);
  }
}

- (id)_inputViewsForResponder:(id)a3 withAutomaticKeyboard:(BOOL)a4 force:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v158 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  int v10 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [(UIKeyboardSceneDelegate *)self _responderDescriptionForLogging:v9];
    *(_DWORD *)buf = 138412802;
    *(void *)uint64_t v155 = v11;
    *(_WORD *)&v155[8] = 1024;
    *(_DWORD *)&v155[10] = v6;
    *(_WORD *)&v155[14] = 1024;
    *(_DWORD *)&v155[16] = v5;
    _os_log_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder: %@, automaticKeyboard: %d, force: %d", buf, 0x18u);
  }
  if ([v9 _disableAutomaticKeyboardUI])
  {
    BOOL v12 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v12, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, disableAutomaticKeyboardUI return empty", buf, 2u);
    }

    id v13 = +[UIInputViewSet emptyInputSet];
    goto LABEL_159;
  }
  id obj = a3;
  BOOL v144 = v5;
  id v14 = v9;
  id v149 = v9;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && +[_UITextServiceSession textServiceIsDisplaying])
  {
  }
  else
  {
    double v15 = v14;
    if (v14) {
      goto LABEL_16;
    }
  }
  if ([(UIKeyboardSceneDelegate *)self preservingInputViews]
    || ![(NSMutableArray *)self->_persistentInputAccessoryResponderOrder count])
  {
    double v15 = 0;
  }
  else
  {
    persistentInputAccessoryResponders = self->_persistentInputAccessoryResponders;
    double v17 = [(NSMutableArray *)self->_persistentInputAccessoryResponderOrder lastObject];
    double v15 = [(NSMutableDictionary *)persistentInputAccessoryResponders objectForKey:v17];
  }
LABEL_16:
  if (dyld_program_sdk_at_least())
  {
    double v18 = [v14 inputViewController];
    double v19 = v18;
    if (v18)
    {
      double v20 = [v18 nextResponder];

      if (!v20) {
        [v19 _overrideInputViewNextResponderWithResponder:v14];
      }
    }
  }
  else
  {
    double v19 = 0;
  }
  uint64_t v21 = [v14 inputView];
  double v22 = [(id)v21 nextResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    double v22 = 0;
  }
  if (v19 || !v21 || v22)
  {
    if (!v21)
    {
      uint64_t v21 = [v19 view];
    }
  }
  else
  {
    [(id)v21 _overrideInputViewNextResponderWithResponder:v14];
  }
  if (objc_opt_respondsToSelector()) {
    unsigned int v145 = [(id)v21 shouldShowDockView];
  }
  else {
    unsigned int v145 = 0;
  }
  v150 = v19;
  double v23 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    [(UIKeyboardSceneDelegate *)self _simpleViewDescriptionForLogging:v21];
    BOOL v24 = v6;
    id v25 = (id)objc_claimAutoreleasedReturnValue();
    id v26 = [(UIKeyboardSceneDelegate *)self _simpleViewDescriptionForLogging:v150];
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v155 = v25;
    *(_WORD *)&v155[8] = 2112;
    *(void *)&v155[10] = v26;
    _os_log_impl(&dword_1853B0000, v23, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, found custom inputView: %@, customInputViewController: %@", buf, 0x16u);

    BOOL v6 = v24;
  }

  if (dyld_program_sdk_at_least())
  {
    double v27 = [v15 inputAccessoryViewController];
    double v28 = v27;
    if (v27)
    {
      double v29 = [v27 nextResponder];

      if (!v29) {
        [v28 _overrideInputAccessoryViewNextResponderWithResponder:v15];
      }
    }
  }
  else
  {
    double v28 = 0;
  }
  double v30 = [v15 inputAccessoryView];
  double v31 = [v30 nextResponder];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {

    double v31 = 0;
  }
  if (v28 || !v30 || v31)
  {
    if (!v30)
    {
      double v30 = [v28 view];
    }
  }
  else
  {
    [v30 _overrideInputAccessoryViewNextResponderWithResponder:v15];
  }
  char v151 = v28;
  double v32 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    [(UIKeyboardSceneDelegate *)self _simpleViewDescriptionForLogging:v30];
    BOOL v33 = v6;
    id v34 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v155 = v34;
    _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, found inputAccessoryView: %@", buf, 0xCu);

    BOOL v6 = v33;
  }

  [(UIView *)(void *)v21 _clearBecomeFirstResponderWhenCapableOnSubtree];
  [(UIView *)v30 _clearBecomeFirstResponderWhenCapableOnSubtree];
  v153 = v14;
  double v37 = self;
  v146 = v30;
  if (v6)
  {
    BOOL v38 = v6;
    int v39 = [v14 _requiresKeyboardWhenFirstResponder];
  }
  else
  {
    uint64_t v40 = +[UIKeyboardAutomatic activeInstance];
    if (v40 || [(UIKeyboardSceneDelegate *)self isOnScreen])
    {
      BOOL v38 = v6;
      int v39 = [v14 _requiresKeyboardWhenFirstResponder];
    }
    else
    {
      BOOL v38 = v6;
      int v39 = 0;
    }
  }
  BOOL v41 = v21 != 0;
  if (v21) {
    BOOL v42 = 0;
  }
  else {
    BOOL v42 = v39;
  }
  int v43 = _UIKeyboardSceneDelegateLogger();
  v148 = v15;
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    id v44 = +[UIKeyboardAutomatic activeInstance];
    id v45 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v44];
    BOOL v46 = [(UIKeyboardSceneDelegate *)v37 isOnScreen];
    int v47 = [v153 _requiresKeyboardWhenFirstResponder];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)uint64_t v155 = v39;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)&v155[6] = v38;
    *(_WORD *)&v155[10] = 2112;
    *(void *)&v155[12] = v45;
    *(_WORD *)&v155[20] = 1024;
    *(_DWORD *)&v155[22] = v46;
    *(_WORD *)v156 = 1024;
    *(_DWORD *)&v156[2] = v47;
    _os_log_impl(&dword_1853B0000, v43, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, responderRequiresKeyboard %d (automaticKeyboardEnabled: %d, activeInstance: %@, self.isOnScreen: %d, requiresKBWhenFirstResponder: %d)", buf, 0x24u);
  }
  os_signpost_id_t v48 = _UIKeyboardSceneDelegateLogger();
  BOOL v49 = v42;
  if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
  {
    id v50 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v21];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)uint64_t v155 = v42;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)&v155[6] = 1;
    *(_WORD *)&v155[10] = 2112;
    *(void *)&v155[12] = v50;
    *(_WORD *)&v155[20] = 1024;
    *(_DWORD *)&v155[22] = v39;
    _os_log_impl(&dword_1853B0000, v48, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, useKeyboard %d (allowsSystemInputView: %d, !inputView %@, responderRequiresKeyboard %d)", buf, 0x1Eu);
  }
  v51 = v146;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    [(id)v21 frame];
    BOOL v41 = v52 > 0.0;
  }
  if ((v41 | v39) == 1)
  {
    v53 = v153;
    v54 = [(UIKeyboardSceneDelegate *)v37 systemInputAssistantViewControllerForResponder:v153];
    uint64_t v152 = [v54 view];
    id v55 = v54;
    if (![(UIKeyboardSceneDelegate *)v37 shouldSuppressInputAssistantUpdates]
      && !v37->_dontNeedAssistantBar)
    {
      [v55 automaticallySetCenterViewControllerBasedOnInputDelegate:v153];
      [v55 setInputAssistantButtonItemsForResponder:v153];
    }
    uint64_t v56 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
    {
      id v57 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v55];
      BOOL v58 = [(UIKeyboardSceneDelegate *)v37 shouldSuppressInputAssistantUpdates];
      BOOL dontNeedAssistantBar = v37->_dontNeedAssistantBar;
      *(_DWORD *)buf = 138412802;
      *(void *)uint64_t v155 = v57;
      *(_WORD *)&v155[8] = 1024;
      *(_DWORD *)&v155[10] = v58;
      *(_WORD *)&v155[14] = 1024;
      *(_DWORD *)&v155[16] = dontNeedAssistantBar;
      _os_log_impl(&dword_1853B0000, v56, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, found assistantVC: %@ (should suppress: %d, _dontNeed: %d)", buf, 0x18u);
    }
  }
  else
  {
    uint64_t v152 = 0;
    id v55 = 0;
    v53 = v153;
  }
  if (!v37->_automaticAppearanceEnabled) {
    objc_storeStrong((id *)&v37->_responderWithoutAutomaticAppearanceEnabled, obj);
  }
  uint64_t v60 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
  {
    id v61 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v37->_responderWithoutAutomaticAppearanceEnabled];
    BOOL automaticAppearanceEnabled = v37->_automaticAppearanceEnabled;
    *(_DWORD *)buf = 138412546;
    *(void *)uint64_t v155 = v61;
    *(_WORD *)&v155[8] = 1024;
    *(_DWORD *)&v155[10] = automaticAppearanceEnabled;
    _os_log_impl(&dword_1853B0000, v60, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, configuring _responderWithoutAutomaticAppearanceEnabled: %@ (_automaticAppearEnabled: %d)", buf, 0x12u);
  }
  v63 = [(UIInputViewSet *)v37->_inputViewSet inputAccessoryView];
  int v64 = [v63 _containsResponder:v53];

  inputViewSet = v37->_inputViewSet;
  if (v64)
  {
    uint64_t v66 = [(UIInputViewSet *)inputViewSet inputAccessoryView];

    v67 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      id v68 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v66];
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v155 = v68;
      _os_log_impl(&dword_1853B0000, v67, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, updating inputAccessoryView: %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v69 = [(UIInputViewSet *)inputViewSet inputView];
    int v70 = [v69 _containsResponder:v53];

    if (!v70) {
      goto LABEL_87;
    }
    uint64_t v71 = [(UIInputViewSet *)v37->_inputViewSet inputView];

    v72 = [(UIInputViewSet *)v37->_inputViewSet keyboard];
    BOOL v49 = v72 != 0;

    v67 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v73 = v72 == 0;
      BOOL v74 = v72 != 0;
      int v75 = !v73;
      id v76 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v71];
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v155 = v76;
      *(_WORD *)&v155[8] = 1024;
      *(_DWORD *)&v155[10] = v75;
      BOOL v49 = v74;
      _os_log_impl(&dword_1853B0000, v67, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, updating inputView: %@, useKeyboard: %d", buf, 0x12u);
    }
    uint64_t v66 = (uint64_t)v146;
    uint64_t v21 = v71;
  }

  v51 = (void *)v66;
  v53 = v153;
LABEL_87:
  if (!+[UIKeyboard usesInputSystemUI])
  {
    if (v49)
    {
      os_signpost_id_t v77 = +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:v51 assistantView:v152];
      os_signpost_id_t v78 = _UIKeyboardSceneDelegateLogger();
      unsigned int v79 = v150;
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v80 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v77];
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v155 = v80;
        _os_log_impl(&dword_1853B0000, v78, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, useKeyboard ivs: %@", buf, 0xCu);
      }
    }
    else
    {
      unsigned int v79 = v150;
      if (!v21)
      {
        int v86 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
        if ([v86 keyboardActive])
        {
        }
        else
        {
          v121 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
          char v122 = [v121 snapshotting];

          if ((v122 & 1) == 0)
          {
            int v123 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
            if ([v123 keyboardVisible])
            {
              v124 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
              BOOL v125 = [(UIKeyboardSceneDelegate *)v37 scene];
              [v124 intersectionHeightForWindowScene:v125];
              BOOL v127 = v126 > 0.0;
            }
            else
            {
              BOOL v127 = 0;
            }

            if (v51)
            {
              BOOL v128 = 0;
            }
            else
            {
              v129 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
              [v129 heightForRemoteIAVPlaceholderIfNecessary];
              BOOL v128 = v130 != 0.0;
            }
            int v131 = v127 || v128;
            v132 = _UIKeyboardSceneDelegateLogger();
            if (os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109632;
              *(_DWORD *)uint64_t v155 = v127;
              *(_WORD *)&v155[4] = 1024;
              *(_DWORD *)&v155[6] = v128;
              *(_WORD *)&v155[10] = 1024;
              *(_DWORD *)&v155[12] = v127 || v128;
              _os_log_impl(&dword_1853B0000, v132, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsIVPlaceholder: %d, needsIAVPlaceholder: %d, needsInputSetWithPlaceholder: %d", buf, 0x14u);
            }

            unsigned int v79 = v150;
            if (v131)
            {
              os_signpost_id_t v77 = +[UIInputViewSet inputSetWithPlaceholderAndAccessoryView:v51];
              [v77 setIsRemoteKeyboard:1];
              [v77 setShouldShowDockView:v145];
LABEL_153:
              v90 = v151;
              goto LABEL_154;
            }
          }
        }
      }
      os_signpost_id_t v77 = +[UIInputViewSet inputSetWithInputView:v21 accessoryView:v51 assistantView:v152];
      [v77 setInputViewController:v79];
      v133 = [v77 inputView];
      [v77 setIsCustomInputView:v133 != 0];

      [v77 setShouldShowDockView:v145];
      uint64_t v134 = [(UIKeyboardSceneDelegate *)v37 existingContainerWindow];
      if (!v134) {
        goto LABEL_153;
      }
      BOOL v135 = (void *)v134;
      int v136 = [v77 isEmpty];

      if (!v136) {
        goto LABEL_153;
      }
      int v137 = [(UIKeyboardSceneDelegate *)v37 containerRootController];
      os_signpost_id_t v78 = [v137 inputViewSet];

      if (([v78 isEmpty] & 1) == 0
        && [v78 isRemoteKeyboard])
      {
        [v77 setIsRemoteKeyboard:1];
      }
    }

    goto LABEL_153;
  }
  if (v49)
  {
    if (+[UIKeyboard usesLocalKeyboard]) {
      +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:v51 assistantView:v152];
    }
    else {
    os_signpost_id_t v77 = +[UIInputViewSet inputSetWithPlaceholderAndAccessoryView:v51 assistantView:v152];
    }
    BOOL v87 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v88 = +[UIKeyboard usesLocalKeyboard];
      id v89 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v77];
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v155 = 1;
      *(_WORD *)&v155[4] = 1024;
      *(_DWORD *)&v155[6] = v88;
      *(_WORD *)&v155[10] = 2112;
      *(void *)&v155[12] = v89;
      _os_log_impl(&dword_1853B0000, v87, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, useKeyboard: %d, usesLocal: %d, ivs: %@", buf, 0x18u);
    }
    unsigned int v79 = v150;
    v90 = v151;
    goto LABEL_135;
  }
  if (v144)
  {
    unsigned int v81 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    if ([v81 keyboardVisible])
    {
      v82 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      v83 = [(UIKeyboardSceneDelegate *)v37 scene];
      [v82 intersectionHeightForWindowScene:v83];
      BOOL v85 = v84 > 0.0;
    }
    else
    {
      BOOL v85 = 0;
    }
  }
  else
  {
    BOOL v85 = 0;
  }
  id v91 = [(UIKeyboardSceneDelegate *)v37 keyboardArbiterClient];
  id v92 = [v91 currentUIState];
  v93 = [v92 applicationIdentifier];
  id v94 = +[UIKeyboard keyboardBundleIdentifier];
  int v95 = [v93 containsString:v94];

  if (v85 && v21 == 0) {
    int v96 = v85 & ~v95;
  }
  else {
    int v96 = v85;
  }
  int v147 = v96;
  int v97 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v97, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v98 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    int v99 = [v98 keyboardVisible];
    int v100 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    v101 = [(UIKeyboardSceneDelegate *)v37 scene];
    [v100 intersectionHeightForWindowScene:v101];
    *(_DWORD *)buf = 67109888;
    *(_DWORD *)uint64_t v155 = v147;
    *(_WORD *)&v155[4] = 1024;
    *(_DWORD *)&v155[6] = v99;
    *(_WORD *)&v155[10] = 2048;
    *(void *)&v155[12] = v102;
    *(_WORD *)&v155[20] = 1024;
    *(_DWORD *)&v155[22] = v144;
    _os_log_impl(&dword_1853B0000, v97, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsInputViewPlaceholder: %d (visible: %d, height: %f, force: %d)", buf, 0x1Eu);
  }
  if (v51) {
    char v103 = 1;
  }
  else {
    char v103 = v95;
  }
  if (v103)
  {
    BOOL v104 = 0;
  }
  else
  {
    v105 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v105 heightForRemoteIAVPlaceholderIfNecessary];
    BOOL v104 = v106 != 0.0;
  }
  v53 = v153;
  v107 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v107, OS_LOG_TYPE_DEFAULT))
  {
    id v108 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v51];
    BOOL v109 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    [v109 heightForRemoteIAVPlaceholderIfNecessary];
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)uint64_t v155 = v104;
    *(_WORD *)&v155[4] = 2112;
    *(void *)&v155[6] = v108;
    *(_WORD *)&v155[14] = 2048;
    *(void *)&v155[16] = v110;
    *(_WORD *)&v155[24] = 1024;
    *(_DWORD *)v156 = v95;
    _os_log_impl(&dword_1853B0000, v107, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsInputAccessoryViewPlaceholder: %d (%@, %f, %d)", buf, 0x22u);
  }
  if (v21 | v152) {
    int v111 = 1;
  }
  else {
    int v111 = v147;
  }
  int v112 = v111 | v104;
  BOOL v113 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
  {
    id v114 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v21];
    id v115 = [(UIKeyboardSceneDelegate *)v37 _simpleViewDescriptionForLogging:v152];
    *(_DWORD *)buf = 67110146;
    *(_DWORD *)uint64_t v155 = v112;
    *(_WORD *)&v155[4] = 2112;
    *(void *)&v155[6] = v114;
    *(_WORD *)&v155[14] = 2112;
    *(void *)&v155[16] = v115;
    *(_WORD *)&v155[24] = 1024;
    *(_DWORD *)v156 = v147;
    *(_WORD *)&v156[4] = 1024;
    BOOL v157 = v104;
    v53 = v153;
    _os_log_impl(&dword_1853B0000, v113, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder, needsPlaceholder: %d (%@, %@, %d, %d)", buf, 0x28u);
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIKeyboardImpl isFloating])
  {
    unsigned int v79 = v150;
    v90 = v151;
    if (v112)
    {
      uint64_t v116 = v21;
      int v117 = v51;
      uint64_t v118 = v152;
      goto LABEL_132;
    }
LABEL_133:
    v119 = +[UIInputViewSet inputSetWithInputView:0 accessoryView:v51 assistantView:0];
    goto LABEL_134;
  }
  unsigned int v79 = v150;
  v90 = v151;
  if (!v112) {
    goto LABEL_133;
  }
  uint64_t v116 = v21;
  int v117 = v51;
  uint64_t v118 = 0;
LABEL_132:
  v119 = +[UIInputViewSet inputSetWithPlaceholderAndCustomInputView:v116 accessoryView:v117 assistantView:v118];
LABEL_134:
  os_signpost_id_t v77 = v119;
  [v119 setInputViewController:v79];
  int v120 = [v77 hostedCustomInputView];
  [v77 setIsCustomInputView:v120 != 0];

  [v77 setShouldShowDockView:v145];
LABEL_135:
  [v77 setIsRemoteKeyboard:1];
LABEL_154:
  [v77 setAssistantViewController:v55];
  [v77 setAccessoryViewController:v90];
  if (v55)
  {
    v138 = [v53 _keyboardResponder];
    uint64_t v139 = [v55 shouldBeShownForInputDelegate:v138 inputViews:v77] ^ 1;
    v140 = [v55 view];
    [v140 setHidden:v139];

    v90 = v151;
  }
  v141 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v141, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(void *)uint64_t v155 = v77;
    _os_log_impl(&dword_1853B0000, v141, OS_LOG_TYPE_DEFAULT, "_inputViewsForResponder returning: %@", buf, 0xCu);
  }

  id v13 = v77;
  id v9 = v149;
LABEL_159:

  return v13;
}

- (id)_simpleViewDescriptionForLogging:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = NSString;
    BOOL v5 = (objc_class *)objc_opt_class();
    BOOL v6 = NSStringFromClass(v5);
    BOOL v7 = [v3 view];
    [v7 frame];
    uint64_t v8 = NSStringFromCGRect(v17);
    id v9 = [v4 stringWithFormat:@"<%@: %p frame = %@>", v6, v3, v8];;

LABEL_5:
    goto LABEL_7;
  }
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v11 = NSString;
  BOOL v12 = (objc_class *)objc_opt_class();
  uint64_t v13 = NSStringFromClass(v12);
  BOOL v6 = (void *)v13;
  if (isKindOfClass)
  {
    [v3 frame];
    BOOL v7 = NSStringFromCGRect(v18);
    [v3 alpha];
    objc_msgSend(v11, "stringWithFormat:", @"<%@: %p; frame = %@; alpha = %f; isHidden = %d; tAMIC = %d>",
      v6,
      v3,
      v7,
      v14,
      [v3 isHidden],
    id v9 = [v3 translatesAutoresizingMaskIntoConstraints]);
    goto LABEL_5;
  }
  id v9 = [v11 stringWithFormat:@"<%@: %p>", v13, v3];
LABEL_7:

  return v9;
}

- (BOOL)isOnScreen
{
  int v2 = [(UITextEffectsWindow *)self->_containerWindow rootViewController];
  char v3 = [v2 isOnScreen];

  return v3;
}

- (UITextEffectsWindow)existingContainerWindow
{
  return self->_containerWindow;
}

- (id)_windowScene
{
  char v3 = [(UIKeyboardSceneDelegate *)self responder];
  id v4 = [v3 _responderWindow];
  BOOL v5 = [v4 windowScene];
  BOOL v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(UIKeyboardSceneDelegate *)self scene];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)_showKeyboardWindowForInputViewSet:(id)a3 placement:(id)a4 windowScene:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  if (!+[UIKeyboard inputUIOOP])
  {
    int v10 = [v7 inputView];
    if (!v10 || [v7 isInputViewPlaceholder])
    {
      id v11 = [v7 inputAssistantView];
      if (!v11 || ([v7 isInputAssistantViewPlaceholder] & 1) != 0)
      {
        char v12 = [v7 isNullInputView];

        if ((v12 & 1) == 0) {
          goto LABEL_16;
        }
        goto LABEL_11;
      }
    }
LABEL_11:
    if ([v8 showsInputViews]) {
      goto LABEL_15;
    }
    if ([v8 isUndocked]) {
      goto LABEL_15;
    }
    uint64_t v13 = [v7 keyboard];
    if (v13)
    {
      uint64_t v14 = (void *)v13;
      double v15 = [v7 keyboard];
      char v16 = [v15 isMinimized];

      if (v16)
      {
LABEL_15:
        BOOL v9 = 1;
        goto LABEL_17;
      }
    }
LABEL_16:
    BOOL v9 = 0;
    goto LABEL_17;
  }
  BOOL v9 = [(UIKeyboardSceneDelegate *)self showingKeyboardForInputViewSet:v7];
LABEL_17:

  return v9;
}

- (BOOL)preservingInputViews
{
  return self->_preservingInputViews;
}

+ (void)performOnControllers:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  char v3 = (void (**)(id, void))a3;
  id v4 = +[UIScene _scenesIncludingInternal:1];
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v4, "count"));
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = [*(id *)(*((void *)&v21 + 1) + 8 * v10) keyboardSceneDelegate];
        if (v11) {
          [v5 addObject:v11];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v12 = v5;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v18;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v18 != v15) {
          objc_enumerationMutation(v12);
        }
        v3[2](v3, *(void *)(*((void *)&v17 + 1) + 8 * v16++));
      }
      while (v14 != v16);
      uint64_t v14 = [v12 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v14);
  }
}

- (void)_clearEligibilityToRequestKeyboardFocusWithoutUserInteraction
{
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = 0;
}

- (void)setKeyWindowCandidate:(id)a3
{
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = 0;
}

- (void)firstResponderDidChange:(id)a3
{
  id v4 = a3;
  id obj = [v4 object];
  BOOL v5 = [v4 userInfo];

  id v6 = [v5 objectForKey:@"UIWindowFirstResponderUserInfoKey"];

  if (self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
    if (WeakRetained)
    {
    }
    else
    {
      uint64_t v8 = [obj windowScene];
      uint64_t v9 = [(UIKeyboardSceneDelegate *)self scene];
      if (v8 == v9 && ([obj isKeyWindow] & 1) != 0)
      {
        int v10 = [v6 _requiresKeyboardWhenFirstResponder];

        if (v10) {
          objc_storeWeak((id *)&self->_keyWindowCandidate, obj);
        }
      }
      else
      {
      }
    }
  }
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = 0;
}

- (void)_endPersistingInputAccessoryViewWithId:(id)a3
{
  persistentInputAccessoryResponderOrder = self->_persistentInputAccessoryResponderOrder;
  id v5 = a3;
  LODWORD(persistentInputAccessoryResponderOrder) = [(NSMutableArray *)persistentInputAccessoryResponderOrder containsObject:v5];
  [(NSMutableArray *)self->_persistentInputAccessoryResponderOrder removeObject:v5];
  [(NSMutableDictionary *)self->_persistentInputAccessoryResponders removeObjectForKey:v5];

  if (persistentInputAccessoryResponderOrder)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__UIKeyboardSceneDelegate__endPersistingInputAccessoryViewWithId___block_invoke;
    v6[3] = &unk_1E52D9F70;
    v6[4] = self;
    [(UIKeyboardSceneDelegate *)self performWithAllowingNilResponderReload:v6];
  }
}

- (void)_clearPreservedInputViewsWithRestorableResponder:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_preservedViewSets count])
  {
    preservedViewSets = self->_preservedViewSets;
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke;
    v23[3] = &unk_1E52EDE38;
    id v24 = v4;
    id v6 = [(NSMutableDictionary *)preservedViewSets keysOfEntriesPassingTest:v23];
    if ([v6 count])
    {
      uint64_t v7 = self->_preservedViewSets;
      uint64_t v8 = [v6 allObjects];
      [(NSMutableDictionary *)v7 removeObjectsForKeys:v8];
    }
  }
  if (self->_containerWindow)
  {
    uint64_t v9 = [(UIKeyboardSceneDelegate *)self inputViews];
    int v10 = [v9 inputView];
    id v11 = [v10 _nextResponderOverride];

    if (v11 == v4)
    {
      id v12 = [(UIKeyboardSceneDelegate *)self inputViews];
      uint64_t v13 = [v12 inputView];
      [v13 _clearOverrideNextResponder];
    }
    if (self->_containerWindow)
    {
      uint64_t v14 = [(UIKeyboardSceneDelegate *)self inputViews];
      uint64_t v15 = [v14 inputAccessoryView];
      id v16 = [v15 _nextResponderOverride];

      if (v16 == v4)
      {
        long long v17 = [(UIKeyboardSceneDelegate *)self inputViews];
        long long v18 = [v17 inputAccessoryView];
        [v18 _clearOverrideNextResponder];
      }
    }
  }
  long long v19 = self->_preservedViewSets;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke_2;
  v21[3] = &unk_1E52EDE60;
  id v22 = v4;
  id v20 = v4;
  [(NSMutableDictionary *)v19 enumerateKeysAndObjectsUsingBlock:v21];
}

- (void)_clearPreservedInputViewsWithId:(id)a3 clearKeyboard:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v7 = [(NSMutableDictionary *)self->_preservedViewSets objectForKey:v6];
  uint64_t v8 = [v7 restorableResponder];
  if (v4)
  {
    pinningResponders = self->_pinningResponders;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __73__UIKeyboardSceneDelegate__clearPreservedInputViewsWithId_clearKeyboard___block_invoke;
    v11[3] = &unk_1E52EDE10;
    v11[4] = self;
    [(NSMutableSet *)pinningResponders enumerateObjectsUsingBlock:v11];
    if ([(UIKeyboardSceneDelegate *)self isOnScreen])
    {
      if ([(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled])
      {
        int v10 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle:0];
        [(UIKeyboardSceneDelegate *)self orderOutWithAnimationStyle:v10];
      }
    }
  }
  [(UIKeyboardSceneDelegate *)self _clearMultiDocumentTokenIfNecessary:v8 withId:v6];
  if ([(NSMutableDictionary *)self->_preservedViewSets count]) {
    [(NSMutableDictionary *)self->_preservedViewSets removeObjectForKey:v6];
  }
}

- (void)_clearMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4
{
  id v8 = a3;
  id v5 = a4;
  if ([v8 conformsToProtocol:&unk_1ED69F180])
  {
    id v6 = v5;
    id v7 = v8;
    if (objc_opt_respondsToSelector()) {
      [v7 _clearToken:v6];
    }
  }
}

- (BOOL)ignoresPinning
{
  return self->_ignoresPinning;
}

- (void)setIgnoresPinning:(BOOL)a3
{
  self->_ignoresPinning = a3;
}

- (void)updateRemoteKeyboardChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_visibilityObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          [v10 remoteKeyboardChanged:v4];
        }
        else if (objc_opt_respondsToSelector())
        {
          uint64_t v11 = objc_msgSend(v4, "keyboardOnScreen", (void)v13);
          id v12 = [v4 sourceBundleIdentifier];
          [v10 remoteKeyboardVisibilityDidChange:v11 bundleId:v12];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
}

- (UIInputWindowController)existingContainerRootController
{
  return (UIInputWindowController *)[(UITextEffectsWindow *)self->_containerWindow rootViewController];
}

- (void)forceReloadInputViews
{
  char v3 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long v19 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_DEFAULT, "forceReloadInputViews", v19, 2u);
  }

  [(UIKeyboardSceneDelegate *)self clearWaitingForInputUIIfNeeded];
  self->_restoringInputViewsAndWaitingForInputUI = 0;
  if (self->_postPinningReloadState)
  {
    id v4 = [(UIKeyboardSceneDelegate *)self responder];
    if ([v4 _requiresKeyboardWhenFirstResponder])
    {
      id v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      int v6 = [v5 handlingRemoteEvent];

      if (v6)
      {
        uint64_t v7 = [(UIKeyboardSceneDelegate *)self inputViews];
        uint64_t v8 = [(UIKeyboardSceneDelegate *)self responder];
        [(UIKeyboardSceneDelegate *)self setTextEffectsWindowLevelForInputView:v7 responder:v8];

        [(UIKeyboardSceneDelegate *)self _performPostWaitingForInputUIBlocks];
        return;
      }
    }
    else
    {
    }
  }
  uint64_t v9 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  if (![v9 oldPathForSnapshot]) {
    goto LABEL_15;
  }
  int v10 = [(UIKeyboardSceneDelegate *)self inputViews];
  uint64_t v11 = [v10 inputAssistantView];
  if (!v11)
  {
LABEL_14:

LABEL_15:
    goto LABEL_16;
  }
  id v12 = (void *)v11;
  long long v13 = [(UIKeyboardSceneDelegate *)self responder];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_14;
  }
  long long v14 = [(UIKeyboardSceneDelegate *)self responder];
  long long v15 = [(UIKeyboardSceneDelegate *)self inputViews];
  long long v16 = [v15 inputAssistantView];
  char v17 = [v14 isDescendantOfView:v16];

  if ((v17 & 1) == 0)
  {
LABEL_16:
    self->_keepInputSession = 1;
    uint64_t v18 = [(UIKeyboardSceneDelegate *)self responder];
    [(UIKeyboardSceneDelegate *)self _reloadInputViewsForResponder:v18 force:1];

    [(UIKeyboardSceneDelegate *)self _performPostWaitingForInputUIBlocks];
    self->_keepInputSession = 0;
  }
}

- (void)cleanUpWaitingForInputUI
{
  if ([(UIKeyboardSceneDelegate *)self clearWaitingForInputUIIfNeeded])
  {
    [(UIKeyboardSceneDelegate *)self _performPostWaitingForInputUIBlocks];
  }
}

- (BOOL)clearWaitingForInputUIIfNeeded
{
  waitingForInputUI = self->_waitingForInputUI;
  if (waitingForInputUI)
  {
    self->_waitingForInputUI = 0;
  }
  return waitingForInputUI != 0;
}

- (void)_reloadInputViewsForResponder:(id)a3 force:(BOOL)a4
{
}

- (void)_performPostWaitingForInputUIBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(UIKeyboardSceneDelegate *)self isWaitingForInputUI]
    && [(NSMutableArray *)self->_postWaitingForInputUIBlocks count])
  {
    char v3 = (void *)[(NSMutableArray *)self->_postWaitingForInputUIBlocks copy];
    [(NSMutableArray *)self->_postWaitingForInputUIBlocks removeAllObjects];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    id v4 = v3;
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
          (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * v8) + 16))(*(void *)(*((void *)&v9 + 1) + 8 * v8));
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)isWaitingForInputUI
{
  return self->_waitingForInputUI != 0;
}

- (void)windowDidBecomeKey:(id)a3
{
  id v8 = [a3 object];
  id v4 = [v8 windowScene];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
  if (WeakRetained
    || ([(UIKeyboardSceneDelegate *)self scene],
        id WeakRetained = objc_claimAutoreleasedReturnValue(),
        v4 != WeakRetained))
  {

LABEL_4:
    BOOL v6 = 0;
    goto LABEL_5;
  }
  char v7 = [v4 _isConnecting];

  if ((v7 & 1) == 0) {
    goto LABEL_4;
  }
  BOOL v6 = 1;
LABEL_5:
  self->_isEligibleToRequestKeyboardFocusWithoutUserInteraction = v6;
}

+ (void)_pinInputViewsForKeyboardSceneDelegate:(id)a3 onBehalfOfResponder:(id)a4 duringBlock:(id)a5
{
  id v11 = a3;
  id v7 = a4;
  if (v11 && v7)
  {
    id v8 = (void (**)(void))a5;
    [v11 _beginPinningInputViewsOnBehalfOfResponder:v7];
    v8[2](v8);

    [v11 _stopPinningInputViewsOnBehalfOfResponder:v7];
  }
  else
  {
    long long v9 = (void (*)(void))*((void *)a5 + 2);
    id v10 = a5;
    v9();
  }
}

- (void)_beginPinningInputViewsOnBehalfOfResponder:(id)a3
{
  pinningResponders = self->_pinningResponders;
  id v5 = a3;
  [(NSMutableSet *)pinningResponders addObject:v5];
  id v6 = +[UIKeyboardImpl activeInstance];
  [v6 keyboardSceneDelegate:self startedPinningInputViewsOnBehalfOfResponder:v5];
}

- (void)_stopPinningInputViewsOnBehalfOfResponder:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(NSMutableSet *)self->_pinningResponders count];
  id v5 = v13;
  if (v4)
  {
    [(NSMutableSet *)self->_pinningResponders removeObject:v13];
    id v6 = +[UIKeyboardImpl activeInstance];
    [v6 keyboardSceneDelegate:self stoppedPinningInputViewsOnBehalfOfResponder:v13];

    uint64_t v7 = [(NSMutableSet *)self->_pinningResponders count];
    id v5 = v13;
    if (!v7)
    {
      postPinningReloadState = self->_postPinningReloadState;
      if (postPinningReloadState)
      {
        long long v9 = [(UIInputViewPostPinningReloadState *)postPinningReloadState responderToReload];
        id v10 = [(UIKeyboardSceneDelegate *)self waitingForInputUI];
        BOOL v11 = [(UIKeyboardSceneDelegate *)self clearWaitingForInputUIIfNeeded];
        [(UIKeyboardSceneDelegate *)self _reloadInputViewsForResponder:v9];
        if (v11 && v10) {
          [(UIKeyboardSceneDelegate *)self setWaitingForInputUI:v10];
        }
        long long v12 = self->_postPinningReloadState;
        self->_postPinningReloadState = 0;

        id v5 = v13;
      }
    }
  }
}

- (BOOL)_isPreservedRestorableResponder:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = [(NSMutableDictionary *)self->_preservedViewSets allValues];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) restorableResponder];

        if (v9 == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)setTextEffectsWindowLevelForInputView:(id)a3 responder:(id)a4
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 hasNonPlaceholderViews] & 1) != 0
    || +[UIKeyboard usesInputSystemUI]
    && ![v6 isEmpty]
    || (+[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient"), id v8 = objc_claimAutoreleasedReturnValue(), [MEMORY[0x1E4F29238] valueWithPointer:v7], v9 = objc_claimAutoreleasedReturnValue(), v10 = objc_msgSend(v8, "hasWindowHostingCallerID:", v9), v9, v8, v10))
  {
    if (+[UIKeyboard inputUIOOP]
      || ([v6 hasNonPlaceholderViews] & 1) != 0)
    {
      goto LABEL_13;
    }
    long long v11 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    if ([v11 hasAnyHostedViews])
    {
      long long v12 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
      if ([v12 handlingRemoteEvent])
      {
        long long v13 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
        char v14 = [v13 handlingViewServiceEvent];

        if ((v14 & 1) == 0) {
          goto LABEL_32;
        }
LABEL_13:
        long long v15 = [v7 _responderWindow];
        uint64_t v16 = [(UIKeyboardSceneDelegate *)self containerWindow];
        char v17 = [v16 _isHostedInAnotherProcess];

        if (v17)
        {
LABEL_31:

          goto LABEL_32;
        }
        if (!v15
          || ([(UIKeyboardSceneDelegate *)self containerWindow],
              uint64_t v18 = (id *)objc_claimAutoreleasedReturnValue(),
              v18,
              v15 == v18))
        {
          double v29 = [(UIKeyboardSceneDelegate *)self inputViews];
          double v30 = [v29 inputAccessoryView];
          double v31 = [v30 _responderWindow];
          double v32 = [(UIKeyboardSceneDelegate *)self containerWindow];

          if (v31 == v32)
          {
            BOOL v33 = [(UIKeyboardSceneDelegate *)self containerWindow];
            [v33 _restoreWindowLevel];
          }
          goto LABEL_31;
        }
        [v15 level];
        double v20 = v19;
        long long v21 = [v15[100] _FBSScene];
        id v22 = [v21 settings];
        [v22 level];
        double v24 = v23;

        objc_opt_class();
        id v25 = [(UIKeyboardSceneDelegate *)self containerWindowForViewService:objc_opt_isKindOfClass() & 1];
        [v25 _setWindowLevel:v20 + 1.0];

        [v15 _addWindowLevelChangedObserver:self];
        id v26 = [v15 windowScene];
        char v27 = [v26 _isKeyWindowScene];

        double v28 = [v15 windowScene];
        if ([v28 _isKeyWindowScene])
        {

          goto LABEL_22;
        }
        id WeakRetained = (id *)objc_loadWeakRetained((id *)&self->_keyWindowCandidate);

        if (v15 == WeakRetained)
        {
          char v27 = 1;
          if (!+[UIKeyboard inputUIOOP])
          {
            double v35 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
            -[_UIRemoteKeyboards performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:](v35, self);
            goto LABEL_28;
          }
          if (+[UIKeyboard usesInputSystemUI])
          {
            double v35 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
            -[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:](v35, self);
LABEL_28:

            goto LABEL_29;
          }
        }
LABEL_22:
        if ((v27 & 1) == 0) {
          goto LABEL_31;
        }
LABEL_29:
        unint64_t CategoryCachedImpl = __UILogGetCategoryCachedImpl("KeyboardFocus", &setTextEffectsWindowLevelForInputView_responder____s_category);
        if (*(unsigned char *)CategoryCachedImpl)
        {
          double v37 = *(NSObject **)(CategoryCachedImpl + 8);
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            log = v37;
            BOOL v46 = objc_opt_class();
            id v52 = v46;
            id v50 = +[UIWindow _applicationKeyWindow];
            id v45 = objc_opt_class();
            id v51 = v45;
            BOOL v38 = +[UIWindow _applicationKeyWindow];
            id v47 = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
            int v39 = objc_opt_class();
            id v48 = v39;
            id v40 = objc_loadWeakRetained((id *)&self->_keyWindowCandidate);
            BOOL v41 = [(UIKeyboardSceneDelegate *)self _scene];
            id v44 = [(UIKeyboardSceneDelegate *)self _scene];
            BOOL v42 = [v44 _FBSScene];
            int v43 = [v42 identityToken];
            *(_DWORD *)buf = 136317186;
            v54 = "-[UIKeyboardSceneDelegate setTextEffectsWindowLevelForInputView:responder:]";
            __int16 v55 = 2112;
            uint64_t v56 = v46;
            __int16 v57 = 2048;
            BOOL v58 = v15;
            __int16 v59 = 2112;
            uint64_t v60 = v45;
            __int16 v61 = 2048;
            v62 = v38;
            __int16 v63 = 2112;
            int v64 = v39;
            __int16 v65 = 2048;
            id v66 = v40;
            __int16 v67 = 2048;
            id v68 = v41;
            __int16 v69 = 2112;
            int v70 = v43;
            _os_log_impl(&dword_1853B0000, log, OS_LOG_TYPE_ERROR, "%s: Updating required scene for responderWindow: <%@: %p>; keyWindow: <%@: %p>; keyWindowCandidate: <%@: %"
              "p>; windowScene: %p; scene identity: %@",
              buf,
              0x5Cu);
          }
        }
        [(UIKeyboardSceneDelegate *)self setWindowLevel:v7 sceneLevel:v20 + 2.0 forResponder:v24 + 2.0];
        goto LABEL_31;
      }
    }
    goto LABEL_13;
  }
LABEL_32:
}

- (UITextFormattingCoordinator)textFormattingCoordinator
{
  return self->_textFormattingCoordinator;
}

+ (int64_t)interfaceOrientation
{
  if ([(id)UIApp _frontMostAppInterfaceOrientationIsSignificant])
  {
    int64_t v3 = [(id)UIApp _frontMostAppOrientation];
    id v4 = @"Front most app's orientation is significant.";
  }
  else
  {
    if (!__interfaceOrientation || ![(id)UIApp _isWindowServerHostingManaged])
    {
      if ([(id)UIApp _isSpringBoard]) {
        goto LABEL_16;
      }
      id v5 = +[UIWindowScene _keyWindowScene]();
      if (v5)
      {
        id v6 = v5;
        int64_t v3 = [v5 interfaceOrientation];
        [a1 logInterfaceOrientation:v3 withDescription:@"Using key window scene"];
      }
      else
      {
        id v7 = [a1 applicationConnectedWindowScenes];
        if ([v7 count])
        {
          id v6 = [v7 anyObject];
          int64_t v3 = [v6 interfaceOrientation];
          [a1 logInterfaceOrientation:v3 withDescription:@"Available non-key window scene"];
        }
        else
        {
          id v6 = 0;
          int64_t v3 = 0;
        }
      }
      if (!v3) {
        goto LABEL_16;
      }
      return v3;
    }
    int64_t v3 = __interfaceOrientation;
    id v4 = @"Using cache for app with managed window server hosting.";
  }
  [a1 logInterfaceOrientation:v3 withDescription:v4];
  if (!v3)
  {
LABEL_16:
    int64_t v3 = [(id)UIApp activeInterfaceOrientation];
    [a1 logInterfaceOrientation:v3 withDescription:@"Fallback case. Using the app's active interface orientation."];
  }
  return v3;
}

+ (void)logInterfaceOrientation:(int64_t)a3 withDescription:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (__lastLoggedInterfaceOrientation != a3)
  {
    id v6 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = +[UIApplication stringForInterfaceOrientation:__lastLoggedInterfaceOrientation];
      id v8 = +[UIApplication stringForInterfaceOrientation:a3];
      int v9 = 138412802;
      int v10 = v7;
      __int16 v11 = 2112;
      long long v12 = v8;
      __int16 v13 = 2112;
      id v14 = v5;
      _os_log_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEFAULT, "[Interface Orientation] was:%@ now:%@ reason:%@", (uint8_t *)&v9, 0x20u);
    }
    __lastLoggedInterfaceOrientation = a3;
  }
}

- (void)_reloadInputViewsForResponder:(id)a3
{
}

- (CGRect)visibleFrameInView:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardSceneDelegate *)self containerRootController];
  if ([v5 isUndocked])
  {

LABEL_4:
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_5;
  }
  id v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  id v7 = [(id)objc_opt_class() activeKeyboardSceneDelegate];
  int v8 = [v6 remoteKeyboardUndocked:v7 != self];

  if (v8) {
    goto LABEL_4;
  }
  char v17 = [(UIKeyboardSceneDelegate *)self containerRootController];
  [v17 visibleFrame];
  double v9 = v18;
  double v10 = v19;
  double v11 = v20;
  double v12 = v21;

  id v22 = [v4 window];

  if (v22)
  {
    double v23 = [(UIKeyboardSceneDelegate *)self containerRootController];
    double v24 = [v23 _window];
    id v25 = [v24 screen];
    id v26 = [v25 coordinateSpace];
    char v27 = [v4 window];
    double v28 = [v27 windowScene];
    double v29 = [v28 coordinateSpace];
    objc_msgSend(v26, "convertRect:toCoordinateSpace:", v29, v9, v10, v11, v12);
    double v9 = v30;
    double v10 = v31;
    double v11 = v32;
    double v12 = v33;
  }
LABEL_5:

  double v13 = v9;
  double v14 = v10;
  double v15 = v11;
  double v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)keyboardSceneDelegateWillResume:(id)a3
{
  id v29 = a3;
  id v4 = [(UIKeyboardSceneDelegate *)self scene];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_16;
  }
  id v5 = [(UIKeyboardSceneDelegate *)self scene];
  int v6 = [v5 _isKeyWindowScene];

  if (!v6) {
    goto LABEL_17;
  }
  id v7 = +[UIKeyboardAutomatic activeInstance];
  uint64_t v8 = [v7 superview];
  if (v8)
  {
    double v9 = (void *)v8;
  }
  else
  {
    double v10 = [(UIKeyboardSceneDelegate *)self responder];
    int v11 = [v10 _requiresKeyboardWhenFirstResponder];

    if (!v11) {
      goto LABEL_10;
    }
    id v7 = +[UIKeyboardImpl sharedInstance];
    double v12 = [(UIKeyboardSceneDelegate *)self responder];
    double v13 = [v12 _keyboardResponder];
    [v7 setDelegate:v13];

    double v14 = [v7 geometryDelegate];

    if (!v14)
    {
      double v15 = +[UIKeyboard activeKeyboard];
      [v7 setGeometryDelegate:v15];
    }
    double v16 = [(UIKeyboardSceneDelegate *)self inputViews];
    char v17 = [v16 inputViewController];
    double v9 = [v17 _compatibilityController];

    [v9 willResume:v29];
    double v18 = +[UIKeyboardInputModeController sharedInputModeController];
    double v19 = [v18 currentInputMode];
    [v9 setInputMode:v19];
  }
LABEL_10:
  uint64_t v20 = +[UIKeyboard activeKeyboard];
  if (!v20) {
    goto LABEL_17;
  }
  id v4 = (void *)v20;
  uint64_t v21 = [(UIKeyboardSceneDelegate *)self responder];
  if (v21)
  {
    id v22 = (void *)v21;
    double v23 = [(UIKeyboardSceneDelegate *)self responder];
    double v24 = v23;
    if (v23 == self->_responderWithoutAutomaticAppearanceEnabled)
    {
      id v25 = +[UIKeyboard activeKeyboard];
      id v26 = [(UIKeyboardSceneDelegate *)self inputViews];
      char v27 = [v26 inputView];

      if (v25 == v27) {
        goto LABEL_17;
      }
      double v28 = [(UIKeyboardSceneDelegate *)self responder];
      [(UIKeyboardSceneDelegate *)self _reloadInputViewsForResponder:v28];

      id v4 = +[UIKeyboard activeKeyboard];
      [v4 updateLayout];
    }
    else
    {
    }
  }
LABEL_16:

LABEL_17:
}

- (void)setInputViews:(id)a3
{
  id v4 = a3;
  [(UIKeyboardSceneDelegate *)self setInputViews:v4 animated:[(UIKeyboardSceneDelegate *)self animationsEnabled]];
}

- (void)setInputViews:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle:v4];
  [(UIKeyboardSceneDelegate *)self setInputViews:v6 animationStyle:v7];
}

- (BOOL)animationsEnabled
{
  if (+[UIKeyboard usesLocalKeyboard]) {
    return 0;
  }
  BOOL v4 = [(UIKeyboardSceneDelegate *)self scene];
  id v5 = [v4 keyboardSceneDelegate];
  char v6 = [v5 useHostedInstance];

  BOOL result = (v6 & 1) != 0
        || [(id)UIApp applicationState] != 2
        || +[UIWindow _allWindowsKeepContextInBackground];
  if (self->_disableAnimationsCount >= 1) {
    return 0;
  }
  return result;
}

- (BOOL)useHostedInstance
{
  return self->_hostedUseCount != 0;
}

- (void)setInputViews:(id)a3 animationStyle:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  if (self->_containerWindow
    || ![v10 isEmpty]
    || [(UIResponder *)self->_responder _disableAutomaticKeyboardUI])
  {
    id v7 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    char v8 = [v7 handlingRemoteEvent];

    if ((v8 & 1) == 0) {
      [MEMORY[0x1E4F39CF8] setFrameStallSkipRequest:1];
    }
    double v9 = [(UIKeyboardSceneDelegate *)self scene];
    if ([v9 _isKeyWindowScene]) {
      [(UIKeyboardSceneDelegate *)self setKeyWindowSceneInputViews:v10 animationStyle:v6];
    }
    else {
      [(UIKeyboardSceneDelegate *)self setWindowSceneInputViews:v10 animationStyle:v6];
    }
  }
}

- (void)_reloadInputViewsForResponder:(id)a3 force:(BOOL)a4 fromBecomeFirstResponder:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(UIKeyboardSceneDelegate *)self scene];
  if ([v9 _isKeyWindowScene]) {
    [(UIKeyboardSceneDelegate *)self _reloadInputViewsForKeyWindowSceneResponder:v8 force:v6 fromBecomeFirstResponder:v5];
  }
  else {
    [(UIKeyboardSceneDelegate *)self _reloadInputViewsForWindowSceneResponder:v8 force:v6];
  }
}

- (UIKeyboardSceneDelegate)initWithScene:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)UIKeyboardSceneDelegate;
  BOOL v5 = [(UIKeyboardSceneDelegate *)&v25 init];
  BOOL v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_scene, v4);
    id v7 = objc_alloc_init(UIKeyboardVisualModeManager);
    visualModeManager = v6->_visualModeManager;
    v6->_visualModeManager = v7;

    [(UIKeyboardVisualModeManager *)v6->_visualModeManager setDelegate:v6];
    *(_WORD *)&v6->_BOOL automaticAppearanceEnabled = 257;
    id v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    animationStyleStack = v6->_animationStyleStack;
    v6->_animationStyleStack = v9;

    v6->_reloadInputViewsForcedIsAllowed = 1;
    int v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    pinningResponders = v6->_pinningResponders;
    v6->_pinningResponders = v11;

    uint64_t v13 = +[UIInputViewSet emptyInputSet];
    inputViewSet = v6->_inputViewSet;
    v6->_inputViewSet = (UIInputViewSet *)v13;

    double v15 = [[UITextFormattingCoordinator alloc] initWithWindowScene:v4];
    textFormattingCoordinator = v6->_textFormattingCoordinator;
    v6->_textFormattingCoordinator = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA48] array];
    postWaitingForInputUIBlocks = v6->_postWaitingForInputUIBlocks;
    v6->_postWaitingForInputUIBlocks = (NSMutableArray *)v17;

    double v19 = objc_alloc_init(UIKBLocalAuthenticationObserver);
    localAuthenticationObserver = v6->_localAuthenticationObserver;
    v6->_localAuthenticationObserver = v19;

    uint64_t v21 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v21 addObserver:v6 selector:sel_keyboardSceneDelegateWillResume_ name:@"UIApplicationWillEnterForegroundNotification" object:0];
    [v21 addObserver:v6 selector:sel_inputModeChangedForRenderConfig_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
    [v21 addObserver:v6 selector:sel_windowDidBecomeKey_ name:@"UIWindowDidBecomeKeyNotification" object:0];
    [v21 addObserver:v6 selector:sel_firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:0];
    [v21 addObserver:v6 selector:sel__deviceWillLock_ name:@"UIApplicationProtectedDataWillBecomeUnavailable" object:0];
    if (+[UIKeyboard usesInputSystemUI])
    {
      id v22 = objc_alloc_init(UIRemoteInputViewHost);
      remoteInputViewHost = v6->_remoteInputViewHost;
      v6->_remoteInputViewHost = v22;
    }
  }

  return v6;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v3 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_201];
    +[UIScene _registerSceneComponentClass:a1 withKey:@"_UIKeyboardSceneDelegateSceneComponentKey" predicate:v3];
  }
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_2()
{
  int v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"iPhone8,1", @"iPhone8,2", @"iPhone8,4", @"iPad6,7", @"iPad6,8", @"iPad7,1", @"iPad7,2", 0);
  v0 = +[UIDevice currentDevice];
  v1 = [v0 _deviceInfoForKey:@"ProductType"];
  byte_1EB2604D1 = [v2 containsObject:v1];
}

uint64_t __37__UIKeyboardSceneDelegate_initialize__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 role];
  if (v3 == @"UIWindowSceneSessionRoleExternalDisplayNonInteractive")
  {
    uint64_t v5 = 0;
  }
  else
  {
    id v4 = [v2 role];
    uint64_t v5 = [v4 isEqualToString:@"CHWindowSceneSessionRoleAvocado"] ^ 1;
  }
  return v5;
}

- (void)setHardwareKeyboardExclusivityIdentifier:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_hardwareKeyboardExclusivityIdentifier, a3);
  uint64_t v5 = +[UIKeyboardImpl activeInstance];
  [v5 hardwareKeyboardAvailabilityChanged];

  id v6 = (id)UIKeyboardActiveInputModes;
  uint64_t v7 = [v6 indexOfObjectPassingTest:&__block_literal_global_657_0];

  if (v13)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_7;
    }
LABEL_6:
    int v11 = +[UIKeyboardImpl activeInstance];
    [v11 recomputeActiveInputModesWithExtensions:1];

    goto LABEL_7;
  }
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = +[UIKeyboardInputModeController sharedInputModeController];
    id v9 = [v8 activeInputModes];
    uint64_t v10 = [v9 indexOfObjectPassingTest:&__block_literal_global_660];

    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_6;
    }
  }
LABEL_7:
  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"_UIHardwareKeyboardExclusivityIdentifierChangedNotification" object:self];
}

- (void)addTrackingElement:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_trackingElements)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    trackingElements = self->_trackingElements;
    self->_trackingElements = v5;
  }
  uint64_t v7 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v8 = [(NSHashTable *)self->_trackingElements count];
    int v9 = 134218498;
    NSUInteger v10 = v8;
    __int16 v11 = 2112;
    uint64_t v12 = objc_opt_class();
    __int16 v13 = 2048;
    id v14 = v4;
    _os_log_debug_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEBUG, "Tracking elements: Adding new tracking element [%lu current elements]: <%@: %p>", (uint8_t *)&v9, 0x20u);
  }

  [(NSHashTable *)self->_trackingElements addObject:v4];
}

- (void)inputModeChangedForRenderConfig:(id)a3
{
  id v12 = a3;
  if (pthread_main_np())
  {
    uint64_t v5 = [(UIKeyboardSceneDelegate *)self responder];

    if (v5)
    {
      id v6 = [(UIKeyboardSceneDelegate *)self containerRootController];
      uint64_t v7 = [v6 view];
      NSUInteger v8 = [v7 _inheritedRenderConfig];

      int v9 = [(UIKeyboardSceneDelegate *)self responder];
      NSUInteger v10 = [(UIKeyboardSceneDelegate *)self _renderConfigForResponder:v9];

      uint64_t v11 = [v8 backdropStyle];
      if (v11 != [v10 backdropStyle]) {
        [(UIKeyboardSceneDelegate *)self updateRenderConfigForCurrentResponder];
      }
    }
  }
  else
  {
    [(UIKeyboardSceneDelegate *)self performSelectorOnMainThread:a2 withObject:v12 waitUntilDone:0];
  }
}

- (void)_updateVisibilityObserversWithReset:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  preservedViewSets = self->_preservedViewSets;
  if (preservedViewSets) {
    BOOL v6 = [(NSMutableDictionary *)preservedViewSets count] == 0;
  }
  else {
    BOOL v6 = 1;
  }
  uint64_t v7 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  int v8 = [v7 wantsAssistantWhileSuppressingKeyboard];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id obj = self->_visibilityObservers;
  uint64_t v9 = [(NSHashTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = v6 & (v8 ^ 1u);
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v16 + 1) + 8 * v13);
        if (objc_opt_respondsToSelector()) {
          [v14 visibilityDidChange:v11];
        }
        if (objc_opt_respondsToSelector())
        {
          [v14 keyboardSceneDelegate:self inputViewSetVisibilityDidChange:v11 includedReset:v3];
        }
        else if (objc_opt_respondsToSelector())
        {
          [v14 inputResponderController:self inputViewSetVisibilityDidChange:v11 includedReset:v3];
        }
        ++v13;
      }
      while (v10 != v13);
      uint64_t v10 = [(NSHashTable *)obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (BOOL)_preserveMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4 reset:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = [v7 restorableResponder];
  int v10 = [v9 conformsToProtocol:&unk_1ED69F180];

  if (v10)
  {
    id v11 = v8;
    uint64_t v12 = [v7 restorableResponder];
    LOBYTE(v10) = objc_opt_respondsToSelector();
    if (v10) {
      [v12 _preserveFocusWithToken:v11 destructively:v5];
    }
  }
  return v10 & 1;
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4 reset:(BOOL)a5
{
  BOOL v5 = a5;
  id v35 = a3;
  if (![(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled])
  {
    if ([(id)UIApp _isSpringBoard])
    {
      id v8 = +[UIKeyboardImpl activeInstance];
      uint64_t v9 = [v8 textInputTraits];
      uint64_t v10 = [v9 keyboardAppearance];

      if (v10 == 127) {
        goto LABEL_28;
      }
    }
  }
  if (!self->_preservedViewSets)
  {
    id v14 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    preservedViewSets = self->_preservedViewSets;
    self->_preservedViewSets = v14;

    if (a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (!a4) {
LABEL_6:
  }
    [(UIKeyboardSceneDelegate *)self _beginDisablingAnimations];
LABEL_7:
  if (v35)
  {
    id v11 = [(UIKeyboardSceneDelegate *)self inputViews];
    uint64_t v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      id v13 = +[UIInputViewSet emptyInputSet];
    }
    long long v16 = v13;

    long long v17 = [v16 inputView];
    long long v18 = [v17 _inheritedRenderConfig];
    [v16 setRestorableRenderConfig:v18];

    long long v19 = [(UIKeyboardSceneDelegate *)self responder];
    [v16 setRestorableResponder:v19];

    [v16 setRestoreUsingBecomeFirstResponder:v5 ^ 1];
    uint64_t v20 = [(UIKeyboardSceneDelegate *)self responder];
    char v21 = objc_opt_respondsToSelector();

    if (v21)
    {
      id v22 = [(UIKeyboardSceneDelegate *)self responder];
      [v22 _tagAsRestorableResponder];
    }
    [(NSMutableDictionary *)self->_preservedViewSets setObject:v16 forKey:v35];
    double v23 = [v16 restorableResponder];
    responderWithoutAutomaticAppearanceEnabled = self->_responderWithoutAutomaticAppearanceEnabled;

    if (v23 != responderWithoutAutomaticAppearanceEnabled)
    {
      objc_super v25 = self->_responderWithoutAutomaticAppearanceEnabled;
      self->_responderWithoutAutomaticAppearanceEnabled = 0;
    }
    id v26 = [v16 inputAccessoryView];
    uint64_t v27 = [v26 _nextResponderOverride];
    [v16 setAccessoryViewNextResponder:v27];

    double v28 = [v16 accessoryViewNextResponder];
    LOBYTE(v27) = objc_opt_respondsToSelector();

    if (v27)
    {
      id v29 = [v16 accessoryViewNextResponder];
      [v29 _tagAsRestorableResponder];
    }
    double v30 = [v16 accessoryViewController];
    double v31 = [v30 _nextResponderOverride];
    [v16 setAccessoryControllerNextResponder:v31];

    double v32 = [v16 accessoryControllerNextResponder];
    char v33 = objc_opt_respondsToSelector();

    if (v33)
    {
      id v34 = [v16 accessoryViewController];
      [v34 _tagAsRestorableResponder];
    }
    if ([(UIKeyboardSceneDelegate *)self _preserveMultiDocumentTokenIfNecessary:v16 withId:v35 reset:v5])
    {
      [v16 _forceRestoreUsingBecomeFirstResponder:1];
    }
    [(UIKeyboardSceneDelegate *)self _updateVisibilityObserversWithReset:v5];
  }
  if (v5)
  {
    [(UIKeyboardSceneDelegate *)self setPreservingInputViews:1];
    [(UIKeyboardSceneDelegate *)self _reloadInputViewsForResponder:0];
    [(UIKeyboardSceneDelegate *)self setPreservingInputViews:0];
  }
  if (!a4) {
    [(UIKeyboardSceneDelegate *)self _endDisablingAnimations];
  }
LABEL_28:
}

- (void)_preserveInputViewsWithId:(id)a3
{
}

- (void)dealloc
{
  v8[7] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v8[0] = @"UIWindowDidRotateNotification";
  v8[1] = 0x1ED160160;
  v8[2] = @"UIApplicationWillEnterForegroundNotification";
  v8[3] = @"UITextInputCurrentInputModeDidChangeNotification";
  v8[4] = @"UIWindowDidBecomeKeyNotification";
  v8[5] = @"UIWindowFirstResponderDidChangeNotification";
  v8[6] = @"UIApplicationProtectedDataWillBecomeUnavailable";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:7];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  BOOL v5 = +[UIPeripheralHost sharedInstance];
  BOOL v6 = [MEMORY[0x1E4F29238] valueWithPointer:self];
  [v5 flushDelayedTasksForKey:v6];

  v7.receiver = self;
  v7.super_class = (Class)UIKeyboardSceneDelegate;
  [(UIKeyboardSceneDelegate *)&v7 dealloc];
}

- (void)_deviceWillLock:(id)a3
{
  id v3 = [(UIKeyboardSceneDelegate *)self responder];
  [v3 _endWritingTools];
}

+ (id)applicationConnectedWindowScenes
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [(id)UIApp connectedScenes];
  id v3 = [MEMORY[0x1E4F1CA80] set];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v3, "addObject:", v9, (void)v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];
  return v10;
}

+ (void)setInterfaceOrientation:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (__interfaceOrientation != a3)
  {
    id v4 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = +[UIApplication stringForInterfaceOrientation:a3];
      int v6 = 138412290;
      uint64_t v7 = v5;
      _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_DEFAULT, "Interface Orientation: Setting cached interface orientation to: %@", (uint8_t *)&v6, 0xCu);
    }
    __interfaceOrientation = a3;
  }
}

- (void)cleanDeactivation
{
  for (unint64_t i = self->_deactivationCount; i; --i)
  {
    id v4 = +[UIPeripheralHost sharedInstance];
    uint64_t v5 = [(UIKeyboardSceneDelegate *)self scene];
    [v4 setDeactivatedKeyboard:0 forScene:v5];
  }
}

- (BOOL)deactivated
{
  return self->_deactivationCount != 0;
}

- (void)setUseHostedInstance:(BOOL)a3
{
  unint64_t hostedUseCount = self->_hostedUseCount;
  if (a3) {
    unint64_t v4 = hostedUseCount + 1;
  }
  else {
    unint64_t v4 = hostedUseCount - 1;
  }
  self->_unint64_t hostedUseCount = v4;
}

- (void)updateLightEffectsBackdropAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(UIKeyboardSceneDelegate *)self keyboardWindow];
  id v8 = [v5 rootViewController];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [v8 hosting];
    objc_msgSend(v6, "updateCombinedBackdropViewAnimated:forKeyboardUp:", v3, -[UIKeyboardSceneDelegate showingKeyboard](self, "showingKeyboard"));
  }
  else
  {
    int v6 = [(UIKeyboardSceneDelegate *)self containerRootController];
    uint64_t v7 = [v6 hosting];
    objc_msgSend(v7, "updateCombinedBackdropViewAnimated:forKeyboardUp:", v3, -[UIKeyboardSceneDelegate showingKeyboard](self, "showingKeyboard"));
  }
}

- (UIView)containerView
{
  BOOL v3 = [(UIKeyboardSceneDelegate *)self containerRootController];
  unint64_t v4 = [v3 view];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = [(UIKeyboardSceneDelegate *)self containerWindow];
  }
  uint64_t v7 = v6;

  return (UIView *)v7;
}

- (BOOL)hasActiveKeyboardResponder
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  unint64_t v4 = [v3 inputDelegate];

  if (v4)
  {
    uint64_t v5 = [(UIKeyboardSceneDelegate *)self responder];
    BOOL v6 = v4 == v5;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)hasNullInputView
{
  BOOL v3 = [(UIKeyboardSceneDelegate *)self inputViews];
  unint64_t v4 = [(UIKeyboardSceneDelegate *)self transientInputViews];
  uint64_t v5 = v4;
  if (!v4) {
    unint64_t v4 = v3;
  }
  char v6 = [v4 isNullInputView];

  return v6;
}

- (BOOL)automaticAppearanceInternalEnabled
{
  return self->_automaticAppearanceEnabledInternal;
}

- (CGRect)frameForLayoutGuideInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKeyboardSceneDelegate *)self containerRootController];
  [v5 visibleFrame];
  double x = v6;
  double y = v8;
  double width = v10;
  double height = v12;

  if (v4)
  {
    long long v14 = [(UIKeyboardSceneDelegate *)self containerRootController];
    long long v15 = [v14 _window];
    long long v16 = [v15 screen];
    uint64_t v17 = [v16 coordinateSpace];
    long long v18 = [v4 coordinateSpace];
    objc_msgSend(v17, "convertRect:toCoordinateSpace:", v18, x, y, width, height);
    CGFloat v20 = v19;
    CGFloat v22 = v21;
    CGFloat v24 = v23;
    CGFloat v26 = v25;

    [v4 frame];
    v41.origin.double x = v27;
    v41.origin.double y = v28;
    v41.size.double width = v29;
    v41.size.double height = v30;
    v38.origin.double x = v20;
    v38.origin.double y = v22;
    v38.size.double width = v24;
    v38.size.double height = v26;
    CGRect v39 = CGRectIntersection(v38, v41);
    double x = v39.origin.x;
    double y = v39.origin.y;
    double width = v39.size.width;
    double height = v39.size.height;
    if (CGRectIsEmpty(v39))
    {
      [v4 bounds];
      double width = v31;
      double v32 = [v4 window];
      [v32 insetForDismissedKeyboardGuide];
      double height = v33;

      double y = 0.0;
      double x = 0.0;
    }
  }

  double v34 = x;
  double v35 = y;
  double v36 = width;
  double v37 = height;
  result.size.double height = v37;
  result.size.double width = v36;
  result.origin.double y = v35;
  result.origin.double x = v34;
  return result;
}

- (CGRect)visibleInputViewFrameInView:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(UIKeyboardSceneDelegate *)self containerRootController];
  if ([v5 isUndocked])
  {

LABEL_4:
    double v9 = *MEMORY[0x1E4F1DB28];
    double v10 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v11 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v12 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    goto LABEL_5;
  }
  double v6 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  uint64_t v7 = [(id)objc_opt_class() activeKeyboardSceneDelegate];
  int v8 = [v6 remoteKeyboardUndocked:v7 != self];

  if (v8) {
    goto LABEL_4;
  }
  uint64_t v17 = [(UIKeyboardSceneDelegate *)self containerRootController];
  [v17 visibleInputViewFrame];
  double v9 = v18;
  double v10 = v19;
  double v11 = v20;
  double v12 = v21;

  CGFloat v22 = [v4 window];

  if (v22)
  {
    double v23 = [(UIKeyboardSceneDelegate *)self containerRootController];
    CGFloat v24 = [v23 _window];
    double v25 = [v24 screen];
    CGFloat v26 = [v25 coordinateSpace];
    CGFloat v27 = [v4 window];
    CGFloat v28 = [v27 windowScene];
    CGFloat v29 = [v28 coordinateSpace];
    objc_msgSend(v26, "convertRect:toCoordinateSpace:", v29, v9, v10, v11, v12);
    double v9 = v30;
    double v10 = v31;
    double v11 = v32;
    double v12 = v33;
  }
LABEL_5:

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

- (double)verticalOverlapForView:(id)a3 usingKeyboardInfo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = 0.0;
  if (UIKeyboardAutomaticIsOnScreen())
  {
    double v9 = [(UIKeyboardSceneDelegate *)self containerRootController];
    double v10 = [v9 placement];

    double v11 = [(UIKeyboardSceneDelegate *)self containerRootController];
    if ([v11 isUndocked])
    {
LABEL_14:

LABEL_15:
      goto LABEL_16;
    }
    double v12 = [(UIKeyboardSceneDelegate *)self inputViews];
    if ([v12 _inputViewIsSplit])
    {
LABEL_13:

      goto LABEL_14;
    }
    double v13 = [(UIKeyboardSceneDelegate *)self inputViews];
    double v14 = [v13 inputView];
    if (v14 && ![v10 isFloating])
    {
      int v17 = 0;
    }
    else
    {
      double v15 = [(UIKeyboardSceneDelegate *)self inputViews];
      uint64_t v16 = [v15 inputAccessoryView];
      int v17 = 1;
      if (!v16)
      {
        double v23 = 0;
        goto LABEL_21;
      }
      int v95 = (void *)v16;
      int v96 = v15;
    }
    uint64_t v18 = [v6 _window];
    if (v18)
    {
      double v19 = (void *)v18;
      int v97 = v14;
      uint64_t v98 = v10;
      double v20 = [(UIKeyboardSceneDelegate *)self inputViews];
      double v21 = [v20 inputView];
      if (([v6 isDescendantOfView:v21] & 1) == 0)
      {
        id v92 = [(UIKeyboardSceneDelegate *)self inputViews];
        [v92 inputAccessoryView];
        CGFloat v24 = v94 = v13;
        char v93 = v17;
        LOBYTE(v17) = [v6 isDescendantOfView:v24];

        double v13 = v94;
        double v14 = v97;
        double v10 = v98;
        double v23 = v95;
        double v15 = v96;
        if ((v93 & 1) == 0) {
          goto LABEL_22;
        }
        goto LABEL_21;
      }

      double v14 = v97;
      double v10 = v98;
      if ((v17 & 1) == 0)
      {
LABEL_12:

        goto LABEL_13;
      }
    }
    else if (!v17)
    {
      goto LABEL_12;
    }
    LOBYTE(v17) = 1;
    double v23 = v95;
    double v15 = v96;
LABEL_21:

LABEL_22:
    if (v17) {
      goto LABEL_15;
    }
    if (v7)
    {
      double v25 = [v7 objectForKey:@"UIKeyboardFrameEndUserInfoKey"];
      [v25 CGRectValue];
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;
      double v33 = v32;
      double v34 = [(UIKeyboardSceneDelegate *)self scene];
      double v35 = [v34 coordinateSpace];
      double v36 = [(UIKeyboardSceneDelegate *)self scene];
      double v37 = [v36 screen];
      CGRect v38 = [v37 coordinateSpace];
      objc_msgSend(v35, "convertRect:fromCoordinateSpace:", v38, v27, v29, v31, v33);
      double v40 = v39;
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;

      id v47 = [(UIKeyboardSceneDelegate *)self scene];
      id v48 = [v47 coordinateSpace];
      objc_msgSend(v48, "convertRect:toCoordinateSpace:", v6, v40, v42, v44, v46);
      CGFloat v50 = v49;
      CGFloat v52 = v51;
      CGFloat v54 = v53;
      CGFloat v56 = v55;

LABEL_32:
      v102.origin.double x = v50;
      v102.origin.double y = v52;
      v102.size.double width = v54;
      v102.size.double height = v56;
      if (!CGRectIsEmpty(v102))
      {
        [v6 bounds];
        double MaxY = CGRectGetMaxY(v103);
        v104.origin.double x = v50;
        v104.origin.double y = v52;
        v104.size.double width = v54;
        v104.size.double height = v56;
        double v8 = fmax(MaxY - CGRectGetMinY(v104), 0.0);
      }
      goto LABEL_15;
    }
    BOOL v57 = +[UIKeyboard usesInputSystemUI];
    if (v57
      && ([v6 window],
          double v11 = objc_claimAutoreleasedReturnValue(),
          [v11 _isTextEffectsWindow]))
    {
      BOOL v58 = [(UIKeyboardSceneDelegate *)self containerRootController];
      [v58 visibleInputViewFrame];
      double v60 = v59;
      double v62 = v61;
      double v64 = v63;
      double v66 = v65;
    }
    else
    {
      __int16 v67 = [(UIKeyboardSceneDelegate *)self containerRootController];
      [v67 visibleFrame];
      double v60 = v68;
      double v62 = v69;
      double v64 = v70;
      double v66 = v71;

      if (!v57)
      {
LABEL_30:
        v101.origin.double x = v60;
        v101.origin.double y = v62;
        v101.size.double width = v64;
        v101.size.double height = v66;
        if (CGRectGetMinY(v101) == 0.0)
        {
          if (os_variant_has_internal_diagnostics())
          {
            id v91 = __UIFaultDebugAssertLog();
            if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)int v100 = 0;
              _os_log_fault_impl(&dword_1853B0000, v91, OS_LOG_TYPE_FAULT, "Keyboard frame should not be on top of the screen", v100, 2u);
            }
          }
          else
          {
            v90 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &verticalOverlapForView_usingKeyboardInfo____s_category)+ 8);
            if (os_log_type_enabled(v90, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1853B0000, v90, OS_LOG_TYPE_ERROR, "Keyboard frame should not be on top of the screen", buf, 2u);
            }
          }
          goto LABEL_15;
        }
        v72 = [(UIKeyboardSceneDelegate *)self scene];
        BOOL v73 = [v72 coordinateSpace];
        BOOL v74 = [(UIKeyboardSceneDelegate *)self scene];
        int v75 = [v74 screen];
        id v76 = [v75 coordinateSpace];
        objc_msgSend(v73, "convertRect:fromCoordinateSpace:", v76, v60, v62, v64, v66);
        double v78 = v77;
        double v80 = v79;
        double v82 = v81;
        double v84 = v83;

        double v25 = [(UIKeyboardSceneDelegate *)self scene];
        id v47 = [v25 coordinateSpace];
        objc_msgSend(v47, "convertRect:toCoordinateSpace:", v6, v78, v80, v82, v84);
        CGFloat v50 = v85;
        CGFloat v52 = v86;
        CGFloat v54 = v87;
        CGFloat v56 = v88;
        goto LABEL_32;
      }
    }

    goto LABEL_30;
  }
LABEL_16:

  return v8;
}

- (BOOL)hasDictationKeyboard
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 _layout];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_delegateAsResponder
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 delegateAsResponder];

  return v3;
}

- (id)_sessionIdentifier
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 _sessionIdentifier];

  return v3;
}

- (id)_textInputSessionAnalytics
{
  return self->_sessionAnalytics;
}

- (id)keyboardArbiterClient
{
  return +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
}

- (id)remoteInputViewHost
{
  return self->_remoteInputViewHost;
}

- (void)setWindowLevel:(double)a3 sceneLevel:(double)a4 forResponder:(id)a5
{
  id v9 = a5;
  if (+[UIKeyboard inputUIOOP])
  {
    if (!+[UIKeyboard usesInputSystemUI]) {
      goto LABEL_6;
    }
    double v8 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    -[_UIKeyboardArbiterClientInputDestination performRequiredSceneUpdateForKeyWindowCandidateOfSceneDelegate:](v8, self);
    [v8 updateWindowState];
  }
  else
  {
    double v8 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [v8 setWindowLevel:v9 sceneLevel:a3 + 2.0 forResponder:a4 + 2.0];
  }

LABEL_6:
}

- (BOOL)isKeyboardOnEmbeddedScreen
{
  id v2 = [(UIKeyboardSceneDelegate *)self scene];
  BOOL v3 = [v2 screen];
  char v4 = [v3 _isEmbeddedScreen];

  return v4;
}

- (void)updateLocalKeyboardChanged:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = self->_visibilityObservers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "localKeyboardChanged:", v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)prepareForAlongsideTransitionWithContext:(id)a3
{
  id v9 = a3;
  id v4 = [(UIKeyboardSceneDelegate *)self containerWindow];
  [v9 animateAlongsideTransitionInView:v4 animation:&__block_literal_global_516 completion:&__block_literal_global_516];

  if (+[_UIRemoteKeyboards enabled])
  {
    uint64_t v5 = [(UIKeyboardSceneDelegate *)self scene];
    int v6 = [v5 _isKeyWindowScene];

    if (v6)
    {
      uint64_t v7 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      if ([v7 keyboardActive])
      {
        uint64_t v8 = [v7 keyboardWindow];
        [v9 animateAlongsideTransitionInView:v8 animation:&__block_literal_global_516 completion:&__block_literal_global_516];
      }
    }
  }
}

- (id)requestAnimationAssertionWithDirection:(int)a3
{
  return [(UIKeyboardSceneDelegate *)self requestAnimationAssertionWithDirection:*(void *)&a3 animated:1];
}

- (id)requestAnimationAssertionWithDirection:(int)a3 animated:(BOOL)a4
{
  return +[_UIInputViewAnimationAssertion _assertionWithDirection:*(void *)&a3 animated:a4 sceneDelegate:self];
}

- (void)setNextAutomaticOrderInDirection:(int)a3 duration:(double)a4
{
  self->_hasCustomAnimationProperties = 1;
  self->_nextAutomaticOrderInDirection = a3;
  self->_nextAutomaticOrderInDuration = a4;
}

- (void)popOrRemoveAnimationStyle:(id)a3
{
  id v4 = a3;
  if ([(NSMutableArray *)self->_animationStyleStack count]) {
    [(NSMutableArray *)self->_animationStyleStack removeObject:v4];
  }
}

- (void)clearAnimationStyleForUserDrivenPresentation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NSMutableArray *)self->_animationStyleStack indexesOfObjectsPassingTest:&__block_literal_global_520];
  if (-[NSMutableArray count](self->_animationStyleStack, "count") && ![v3 count])
  {
    id v4 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(NSMutableArray *)self->_animationStyleStack description];
      int v9 = 138412290;
      double v10 = v8;
      _os_log_error_impl(&dword_1853B0000, v4, OS_LOG_TYPE_ERROR, "Animation styles expected to be empty on user driven presentation. Actually contains: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v5 = [(NSMutableArray *)self->_animationStyleStack objectsAtIndexes:v3];
  int v6 = (NSMutableArray *)[v5 mutableCopy];
  animationStyleStack = self->_animationStyleStack;
  self->_animationStyleStack = v6;
}

uint64_t __71__UIKeyboardSceneDelegate_clearAnimationStyleForUserDrivenPresentation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 forAssertion];
}

- (void)createAutomaticKeyboardIfNeeded
{
  BOOL v3 = +[UIKeyboardAutomatic activeInstance];

  if (v3)
  {
    if ([(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled])
    {
      id v4 = +[UIKeyboardAutomatic activeInstance];
      uint64_t v5 = [v4 _keyboardOrientation];

      int v6 = +[UIKeyboardAutomatic activeInstance];
      uint64_t v7 = [v6 interfaceOrientation];

      if (v7 != v5)
      {
        id v9 = +[UIKeyboardAutomatic activeInstance];
        [v9 setOrientation:v5];
      }
    }
  }
  else
  {
    id v8 = +[UIKeyboardAutomatic sharedInstance];
  }
}

- (void)window:(id)a3 changedFromLevel:(double)a4 toLevel:(double)a5
{
  id v6 = a3;
  uint64_t v7 = [(UIKeyboardSceneDelegate *)self responder];
  id v8 = [v7 _responderWindow];

  if (v8 == v6)
  {
    [(UIKeyboardSceneDelegate *)self _updateContainerWindowLevel];
  }
}

- (void)_updateContainerWindowLevel
{
  id v4 = [(UIKeyboardSceneDelegate *)self inputViews];
  BOOL v3 = [(UIKeyboardSceneDelegate *)self responder];
  [(UIKeyboardSceneDelegate *)self setTextEffectsWindowLevelForInputView:v4 responder:v3];
}

- (id)_renderConfigForResponder:(id)a3
{
  id v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0 || (uint64_t v5 = [v4 keyboardAppearance]) == 0) {
    uint64_t v5 = [(UIKeyboardSceneDelegate *)self _preferredAppearanceForResponder:v4];
  }
  if ([v4 _isDisplayingWritingToolsSessionInUCB]
    && ([v4 _wantsMagicBackgroundInUCB] & 1) != 0)
  {
    uint64_t v5 = 13;
  }
  else if (!v5)
  {
    id v6 = [v4 _responderWindow];
    uint64_t v7 = [v6 rootViewController];
    id v8 = [v7 traitCollection];
    uint64_t v9 = [v8 userInterfaceStyle];

    if (([v4 _isView] & 1) != 0 || objc_msgSend(v4, "_isViewController"))
    {
      double v10 = [v4 _window];
      char v11 = [v10 _isTextEffectsWindow];

      if ((v11 & 1) == 0)
      {
        long long v12 = [v4 traitCollection];
        if ([v12 userInterfaceStyle]) {
          uint64_t v9 = [v12 userInterfaceStyle];
        }
      }
    }
    if (v9 == 2) {
      uint64_t v5 = 1;
    }
    else {
      uint64_t v5 = 2 * (v9 == 1);
    }
  }
  id v13 = v4;
  id v14 = [(UIKeyboardSceneDelegate *)self responder];
  double v15 = v13;
  if (v14 == v13)
  {
    uint64_t v16 = +[UIKeyboardImpl activeInstance];
    int v17 = [v16 inputDelegateManager];
    uint64_t v18 = [v17 forwardingInputDelegate];

    double v15 = v13;
    if (!v18) {
      goto LABEL_21;
    }
    id v14 = +[UIKeyboardImpl activeInstance];
    double v19 = [v14 inputDelegateManager];
    double v15 = [v19 forwardingInputDelegate];
  }
LABEL_21:
  if (objc_opt_respondsToSelector()) {
    uint64_t v20 = [v15 keyboardType];
  }
  else {
    uint64_t v20 = 0;
  }
  if (TIGetEmojiSearchAlternateBackgroundValue_onceToken != -1) {
    dispatch_once(&TIGetEmojiSearchAlternateBackgroundValue_onceToken, &__block_literal_global_1099);
  }
  double v21 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  CGFloat v22 = [v21 valueForPreferenceKey:@"EmojiSearchAlternateBackground"];

  int v23 = [v22 BOOLValue];
  if ((v5 & 0xFFFFFFFFFFFFFFFDLL) != 0 || !v23)
  {
  }
  else
  {

    if (v20 == 122)
    {
      CGFloat v24 = +[UIKBRenderConfig defaultEmojiConfig];
      goto LABEL_32;
    }
  }
  double v25 = +[UITextInputTraits traitEnvironmentFromTraits:v13];
  double v26 = +[UIKeyboardInputModeController sharedInputModeController];
  double v27 = [v26 currentInputMode];
  CGFloat v24 = +[UIKBRenderConfig configForAppearance:v5 inputMode:v27 traitEnvironment:v25];

LABEL_32:
  return v24;
}

- (int64_t)_preferredAppearanceForResponder:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    uint64_t v5 = 0;
    int64_t v11 = 0;
    goto LABEL_18;
  }
  uint64_t v5 = v3;
  while ([v5 _isViewController])
  {
    uint64_t v6 = [v5 overrideUserInterfaceStyle];
    if (v6)
    {
      uint64_t v7 = v6;
      id v8 = [v5 view];
      char v9 = [v8 _containsResponder:v4];

      if (v9) {
        goto LABEL_15;
      }
    }
LABEL_11:
    int64_t v11 = [v5 nextResponder];

    uint64_t v5 = (void *)v11;
    if (!v11) {
      goto LABEL_18;
    }
  }
  if (![v5 _isView]) {
    goto LABEL_11;
  }
  uint64_t v7 = [v5 overrideUserInterfaceStyle];
  double v10 = [v5 _localOverrideTraitCollection];
  if (!v7 || ([v5 _containsResponder:v4] & 1) == 0)
  {

    goto LABEL_11;
  }

LABEL_15:
  if (v7 == 2) {
    int64_t v11 = 1;
  }
  else {
    int64_t v11 = 2 * (v7 == 1);
  }
LABEL_18:

  return v11;
}

void __58__UIKeyboardSceneDelegate_updateRenderConfigForResponder___block_invoke(uint64_t a1, void *a2)
{
  id v15 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v3 = [v15 owner];

    id v4 = (void *)v3;
  }
  else
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    id v4 = v15;
    if ((isKindOfClass & 1) == 0) {
      goto LABEL_13;
    }
  }
  if (v4)
  {
    id v16 = v4;
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
    {
LABEL_12:
      id v4 = v16;
      goto LABEL_13;
    }
    uint64_t v6 = [*(id *)(a1 + 40) scene];
    uint64_t v7 = [v6 screen];
    uint64_t v8 = [v7 _userInterfaceIdiom];

    if (v8 == 3)
    {
      char v9 = +[UIKeyboard activeKeyboard];
      double v10 = [v9 window];
      int64_t v11 = [v10 windowScene];
      long long v12 = [*(id *)(a1 + 40) scene];

      if (v11 != v12)
      {
LABEL_11:
        [*(id *)(a1 + 32) addObject:v16];
        goto LABEL_12;
      }
      id v13 = +[UIKeyboard activeKeyboard];
    }
    else
    {
      id v13 = [v16 view];
    }
    id v14 = v13;
    [v13 _setRenderConfig:*(void *)(a1 + 48)];

    goto LABEL_11;
  }
LABEL_13:
}

- (NSDate)_transitionStartTime
{
  return self->_transitionStartTime;
}

- (id)passthroughViews
{
  v8[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(UIInputViewSet *)self->_inputViewSet inputViewController];
  uint64_t v4 = [v3 view];
  if (v4)
  {
    uint64_t v5 = (void *)v4;

LABEL_4:
    v8[0] = v5;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];

    goto LABEL_5;
  }
  uint64_t v5 = [(UIInputViewSet *)self->_inputViewSet inputView];

  if (v5) {
    goto LABEL_4;
  }
  uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_5:
  return v6;
}

- (void)_setReloadInputViewsForcedIsAllowed:(BOOL)a3
{
  self->_reloadInputViewsForcedIsAllowed = a3;
}

- (void)keyboardUIDidChange
{
  BOOL reloadInputViewsForcedIsAllowed = self->_reloadInputViewsForcedIsAllowed;
  self->_BOOL reloadInputViewsForcedIsAllowed = 0;
  uint64_t v4 = +[UIKeyboardImpl activeInstance];
  id v13 = [v4 inputDelegate];

  uint64_t v5 = [v13 _responderWindow];
  uint64_t v6 = [v5 screen];
  uint64_t v7 = [(id)v6 _userInterfaceIdiom];

  uint64_t v8 = +[UIDictationController activeInstance];
  LOBYTE(v6) = [v8 resigningFirstResponder];

  if ((v6 & 1) == 0 && v7 != 3)
  {
    char v9 = +[UIKeyboardInputModeController sharedInputModeController];
    double v10 = [v9 currentInputMode];
    int64_t v11 = [v10 identifier];
    if ([v11 isEqualToString:@"autofillsignup"])
    {
      BOOL v12 = [(UIRemoteInputViewHost *)self->_remoteInputViewHost shouldShowDockView];

      if (v12) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    [(UIKeyboardSceneDelegate *)self forceReloadInputViews];
  }
LABEL_8:
  self->_BOOL reloadInputViewsForcedIsAllowed = reloadInputViewsForcedIsAllowed;
}

- (BOOL)isWaitingForInputUI:(id)a3
{
  id v4 = a3;
  if (v4 && (waitingForInputUI = self->_waitingForInputUI) != 0) {
    char v6 = [(NSUUID *)waitingForInputUI isEqual:v4];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (id)waitingForInputUI
{
  return self->_waitingForInputUI;
}

- (void)setWaitingForInputUI:(id)a3
{
}

- (void)addPostWaitingForInputUIBlock:(id)a3
{
  postWaitingForInputUIBlocks = self->_postWaitingForInputUIBlocks;
  id v4 = _Block_copy(a3);
  [(NSMutableArray *)postWaitingForInputUIBlocks addObject:v4];
}

- (BOOL)_keepInputSession
{
  if (self->_keepInputSession)
  {
    LOBYTE(v2) = 1;
  }
  else
  {
    BOOL v2 = +[UIKeyboard usesInputSystemUI];
    if (v2)
    {
      id v4 = [(UIKeyboardSceneDelegate *)self responder];
      BOOL v5 = [(UIKeyboardSceneDelegate *)self _isPinningInputViewsOnBehalfOfResponder:v4];

      LOBYTE(v2) = v5;
    }
  }
  return v2;
}

- (id)remoteHostInputViewSet:(id)a3
{
  id v4 = (UIInputViewSet *)a3;
  if (+[UIKeyboard usesInputSystemUI])
  {
    if ([(UIRemoteInputViewHost *)self->_remoteInputViewHost shouldShowDockView])
    {
      BOOL v5 = [(UIRemoteInputViewHost *)self->_remoteInputViewHost inputViewSet];
    }
    else
    {
      if (!v4)
      {
        transientInputViewSet = self->_transientInputViewSet;
        if (transientInputViewSet)
        {
          uint64_t v7 = transientInputViewSet;
        }
        else
        {
          uint64_t v7 = [(UIKeyboardSceneDelegate *)self inputViews];
        }
        id v4 = v7;
      }
      uint64_t v8 = +[UIKeyboardAutomatic activeInstance];
      char v9 = +[UICompatibilityInputViewController deferredInputModeControllerWithKeyboard:v8];

      double v10 = +[UIKeyboardInputModeController sharedInputModeController];
      int64_t v11 = [v10 currentInputMode];
      [v9 setInputMode:v11];

      BOOL v12 = [v9 view];
      id v13 = [(UIInputViewSet *)v4 inputAccessoryView];
      id v14 = [(UIInputViewSet *)v4 inputAssistantView];
      BOOL v5 = +[UIInputViewSet inputSetWithPlaceholderAndCustomInputView:v12 accessoryView:v13 assistantView:v14];

      [v5 setInputViewController:v9];
      [v5 setIsCustomInputView:1];
      [(UIRemoteInputViewHost *)self->_remoteInputViewHost setInputViewSet:v5];
      [(UIRemoteInputViewHost *)self->_remoteInputViewHost setShouldShowDockView:1];
    }
    [(UIRemoteInputViewHost *)self->_remoteInputViewHost updateInputViewsIfNecessary];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_556(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (+[UIKeyboard isInputSystemUI])
  {
    BOOL v2 = keyboardui_system_get_log_STAGING();
    uint64_t v3 = v2;
    os_signpost_id_t v4 = *(void *)(a1 + 40);
    if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v2))
    {
      LOWORD(v15) = 0;
      _os_signpost_emit_with_name_impl(&dword_1853B0000, v3, OS_SIGNPOST_INTERVAL_END, v4, "keyboardUIBringup", "", (uint8_t *)&v15, 2u);
    }

    BOOL v5 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 134217984;
      uint64_t v16 = v14;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "END keyboard bringup signpost (keyboard task queue empty); ID:%llu",
        (uint8_t *)&v15,
        0xCu);
    }
  }
  else
  {
    uint64_t v6 = mach_absolute_time();
    kdebug_trace();
    kac_get_log();
    uint64_t v7 = (id)objc_claimAutoreleasedReturnValue();
    os_signpost_id_t v8 = os_signpost_id_make_with_pointer(v7, 0);
    if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
    {
      os_signpost_id_t v9 = v8;
      if (os_signpost_enabled(v7))
      {
        LOWORD(v15) = 0;
        _os_signpost_emit_with_name_impl(&dword_1853B0000, v7, OS_SIGNPOST_INTERVAL_END, v9, "appBringup", " enableTelemetry=YES ", (uint8_t *)&v15, 2u);
      }
    }

    double v10 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v15) = 0;
      _os_log_debug_impl(&dword_1853B0000, v10, OS_LOG_TYPE_DEBUG, "END app bringup signpost (keyboard task queue empty)", (uint8_t *)&v15, 2u);
    }

    +[_UIKeyboardDiagnosticCollection _requestTailspinWithDescription:@"KeyboardBringupLatency" startMAT:qword_1EB2604E8 endMAT:v6 ifExceedsThresholdSec:0.3];
  }
  int64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 removeObserver:*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)];

  uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
  id v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = 0;

  _MergedGlobals_1038 = 0;
}

void __102__UIKeyboardSceneDelegate__reloadInputViewsForKeyWindowSceneResponder_force_fromBecomeFirstResponder___block_invoke_567(uint64_t a1)
{
  [*(id *)(a1 + 32) setInputViews:*(void *)(a1 + 40)];
  id v1 = +[UIKeyboardImpl activeInstance];
  [v1 clearKeyboardWindowSnapshot];
}

- (void)_reloadInputViewsForWindowSceneResponder:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = (UIResponder *)a3;
  [(UIKeyboardSceneDelegate *)self disableInterfaceAutorotation:0];
  BOOL v7 = (!self->_automaticAppearanceEnabled || self->_responderWithoutAutomaticAppearanceEnabled != v17)
    && [(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled];
  os_signpost_id_t v8 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v17 withAutomaticKeyboard:v7 force:v4];
  if ([(UIKeyboardSceneDelegate *)self pinningPreventsInputViews:v8])
  {
    os_signpost_id_t v9 = +[UIInputViewPostPinningReloadState stateWithResponder:v17];
    postPinningReloadState = self->_postPinningReloadState;
    self->_postPinningReloadState = v9;

    [(UIKeyboardSceneDelegate *)self setTextEffectsWindowLevelForInputView:v8 responder:v17];
    goto LABEL_19;
  }
  if (![(UIKeyboardSceneDelegate *)self _isIgnoringReloadInputViews])
  {
    int v11 = [v8 containsResponder:v17];
    selfHostingTrigger = self->_selfHostingTrigger;
    if (v11)
    {
      if (selfHostingTrigger) {
        goto LABEL_13;
      }
      id v13 = [(UIKeyboardSceneDelegate *)self responder];
      selfHostingTrigger = self->_selfHostingTrigger;
    }
    else
    {
      id v13 = 0;
    }
    self->_selfHostingTrigger = v13;
  }
LABEL_13:
  responder = self->_responder;
  if (responder && responder != v17)
  {
    int v15 = [(UIResponder *)responder _responderWindow];
    [v15 _removeWindowLevelChangedObserver:self];
  }
  objc_storeStrong((id *)&self->_responder, a3);
  uint64_t v16 = self->_postPinningReloadState;
  self->_postPinningReloadState = 0;

  [(UIKeyboardSceneDelegate *)self _updateTextInputSession];
  if ([(UIKeyboardSceneDelegate *)self _isIgnoringReloadInputViews]) {
    ++self->_ignoredReloads;
  }
  else {
    [(UIKeyboardSceneDelegate *)self setInputViews:v8];
  }
LABEL_19:
}

- (UIInputViewSet)transientInputViews
{
  return self->_transientInputViewSet;
}

- (void)setPreservedKeyboardWindowSnapshot:(id)a3
{
}

- (UIView)preservedKeyboardWindowSnapshot
{
  return self->_preservedKeyboardWindowSnapshot;
}

- (void)loadLocalKeyboardForHost:(id)a3
{
  self->_loadingLocalKeyboard = 1;
  id v4 = a3;
  BOOL v5 = [(UIKeyboardSceneDelegate *)self responder];
  uint64_t v6 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v5];
  [v4 changeToInputViewSet:v6];

  BOOL v7 = +[UIKeyboardImpl activeInstance];
  [v7 recomputeActiveInputModesWithExtensions:1];

  os_signpost_id_t v8 = +[UIKeyboardImpl activeInstance];
  [v8 updateLayout];

  self->_loadingLocalKeyboard = 0;
}

- (BOOL)loadingLocalKeyboard
{
  return self->_loadingLocalKeyboard;
}

- (id)_inputViewsForResponder:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v4 withAutomaticKeyboard:[(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled] force:0];

  return v5;
}

- (void)setHasCustomInputViewController:(BOOL)a3
{
  self->_hasCustomInputViewController = a3;
}

- (BOOL)hasCustomInputViewController
{
  if (!+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v3 = [(UIKeyboardSceneDelegate *)self responder];
    id v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [(UIKeyboardSceneDelegate *)self _delegateAsResponder];
    }
    uint64_t v6 = v5;

    BOOL v7 = [v6 inputViewController];
    self->_hasCustomInputViewController = v7 != 0;
  }
  return self->_hasCustomInputViewController;
}

- (void)setShouldSuppressInputAssistantUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[UIKeyboard isMajelEnabled]
    && self->_shouldSuppressInputAssistantUpdates != v3)
  {
    self->_shouldSuppressInputAssistantUpdates = v3;
    id v5 = _UIKeyboardSceneDelegateLogger();
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "Start suppressing input assistant updates", buf, 2u);
      }

      BOOL v7 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
      [v7 setInputAssistantButtonItemsForResponder:0];
    }
    else
    {
      if (v6)
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEFAULT, "End suppressing input assistant updates", v13, 2u);
      }

      os_signpost_id_t v8 = +[UIKeyboardImpl activeInstance];
      os_signpost_id_t v9 = [v8 inputDelegateManager];
      BOOL v7 = [v9 keyInputDelegate];

      double v10 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
      [v10 automaticallySetCenterViewControllerBasedOnInputDelegate:v7];

      int v11 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
      uint64_t v12 = [(UIKeyboardSceneDelegate *)self responder];
      [v11 setInputAssistantButtonItemsForResponder:v12];
    }
  }
}

- (BOOL)hasVisibleAssistantBar
{
  BOOL v2 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
  char v3 = [v2 shouldBeShownForInputDelegate:0 inputViews:0];

  return v3;
}

- (BOOL)hasIntegratedAssistantBar
{
  BOOL v2 = +[UIKeyboardInputModeController sharedInputModeController];
  char v3 = [v2 currentInputMode];

  LOBYTE(v2) = [v3 isHandwritingInputMode];
  return (char)v2;
}

uint64_t __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setKeyWindowSceneInputViews:*(void *)(a1 + 40) animationStyle:*(void *)(a1 + 48)];
}

double __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_604()
{
  if (+[UIKeyboardImpl isFloating])
  {
    +[UIKeyboardImpl floatingWidth];
  }
  else
  {
    id v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    return v3;
  }
  return result;
}

uint64_t __70__UIKeyboardSceneDelegate_setKeyWindowSceneInputViews_animationStyle___block_invoke_609(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInputViewSet:*(void *)(a1 + 40)];
}

- (void)setWindowSceneInputViews:(id)a3 animationStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 refreshPresentation];
  [(UIKeyboardSceneDelegate *)self updateRenderConfigForCurrentResponder];
  os_signpost_id_t v8 = [(UIKeyboardSceneDelegate *)self responder];
  [(UIKeyboardSceneDelegate *)self setTextEffectsWindowLevelForInputView:v6 responder:v8];

  os_signpost_id_t v9 = [(UIKeyboardSceneDelegate *)self containerRootController];
  double v10 = [(UIKeyboardSceneDelegate *)self scene];
  int v11 = [(UIKeyboardSceneDelegate *)self containerWindow];
  char v12 = objc_opt_respondsToSelector();

  if (v12)
  {
    id v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v14 = [(UIKeyboardSceneDelegate *)self containerWindow];
    [v13 removeObserver:v14 name:0x1ED160160 object:0];

    int v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v16 = [(UIKeyboardSceneDelegate *)self containerWindow];
    [v15 addObserver:v16 selector:sel_applicationWindowRotated_ name:0x1ED160160 object:0];
  }
  if (+[_UIRemoteKeyboards enabled])
  {
    uint64_t v17 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    int v18 = [v17 keyboardVisible];
  }
  else
  {
    int v18 = 0;
  }
  double v19 = [v6 inputView];
  uint64_t v20 = [v6 inputAccessoryView];
  uint64_t v21 = [v6 inputAssistantView];
  CGFloat v22 = (void *)v21;
  if (v19 || v21 || v18)
  {
    int v23 = +[_UIRemoteKeyboardPlaceholderView placeholderWithWidthSizer:&__block_literal_global_611 heightWithScene:v10];
  }
  else
  {
    int v23 = 0;
  }
  [v23 setFallbackView:v19];
  [v23 setAssociatedView:v22];
  CGFloat v24 = +[UIInputViewSet inputSetWithInputView:v23 accessoryView:v20 assistantView:0];
  [v24 inheritNullState:v6];
  objc_msgSend(v24, "setIsCustomInputView:", objc_msgSend(v6, "isCustomInputView"));
  objc_msgSend(v24, "setIsRemoteKeyboard:", objc_msgSend(v6, "isRemoteKeyboard"));
  objc_msgSend(v24, "setShouldShowDockView:", objc_msgSend(v6, "shouldShowDockView"));
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __67__UIKeyboardSceneDelegate_setWindowSceneInputViews_animationStyle___block_invoke_2;
  v27[3] = &unk_1E52D9F98;
  id v28 = v9;
  id v29 = v24;
  id v25 = v24;
  id v26 = v9;
  [v26 performOperations:v27 withAnimationStyle:v7];
}

double __67__UIKeyboardSceneDelegate_setWindowSceneInputViews_animationStyle___block_invoke()
{
  if (+[UIKeyboardImpl isFloating])
  {
    +[UIKeyboardImpl floatingWidth];
  }
  else
  {
    id v1 = +[UIScreen mainScreen];
    [v1 bounds];
    double v3 = v2;

    return v3;
  }
  return result;
}

uint64_t __67__UIKeyboardSceneDelegate_setWindowSceneInputViews_animationStyle___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) setInputViewSet:*(void *)(a1 + 40)];
}

- (void)reloadPlacement
{
  double v3 = [(UIKeyboardSceneDelegate *)self inputViews];
  [(UIKeyboardSceneDelegate *)self setInputViews:v3];

  [(UIKeyboardSceneDelegate *)self refreshKeyboardLayoutGuide];
}

- (void)refreshKeyboardLayoutGuide
{
  id v2 = [(UIKeyboardSceneDelegate *)self containerRootController];
  [v2 refreshKeyboardLayoutGuide];
}

- (void)performMultipleOperations:(id)a3 withAnimationStyle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  os_signpost_id_t v8 = [(UIKeyboardSceneDelegate *)self scene];
  if (+[_UIRemoteKeyboards enabled]
    && [v8 _isKeyWindowScene])
  {
    os_signpost_id_t v9 = [MEMORY[0x1E4F1CA48] array];
    double v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke;
    v22[3] = &unk_1E52EDDC0;
    id v23 = v9;
    id v25 = v6;
    id v24 = v7;
    id v11 = v9;
    [v10 performOnControllers:v22];
  }
  else
  {
    char v12 = [(UIKeyboardSceneDelegate *)self containerRootController];
    id v13 = [v12 inputViewSet];
    uint64_t v14 = [v13 inputView];
    if (v14)
    {
      int v15 = (void *)v14;
      uint64_t v16 = [(UIKeyboardSceneDelegate *)self containerRootController];
      uint64_t v17 = [v16 inputViewSet];
      char v18 = [v17 isCustomInputView];

      if ((v18 & 1) == 0)
      {
        double v19 = [(UIKeyboardSceneDelegate *)self containerRootController];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_3;
        v20[3] = &unk_1E52DB330;
        v20[4] = self;
        id v21 = v6;
        [v19 performOperations:v20 withAnimationStyle:v7];
      }
    }
    else
    {
    }
  }
}

void __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke(uint64_t a1, void *a2)
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
    os_signpost_id_t v8 = __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_2;
    os_signpost_id_t v9 = &unk_1E52DB330;
    id v11 = *(id *)(a1 + 48);
    id v5 = v5;
    id v10 = v5;
    [v5 performOperations:&v6 withAnimationStyle:*(void *)(a1 + 40)];
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5, v6, v7, v8, v9);
  }
LABEL_9:
}

uint64_t __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __72__UIKeyboardSceneDelegate_performMultipleOperations_withAnimationStyle___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) containerRootController];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)updateArbiterClientWithKeyboardFrame:(CGRect)a3 keyboarFrameWithIAV:(CGRect)a4 isIAVRelevant:(BOOL)a5 showing:(BOOL)a6 notifyRemote:(BOOL)a7 forScene:(id)a8
{
  BOOL v8 = a7;
  BOOL v9 = a6;
  BOOL v10 = a5;
  double height = a4.size.height;
  double v12 = a3.size.height;
  id v15 = a8;
  if (+[UIKeyboard isKeyboardProcess])
  {
    uint64_t v14 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    [v14 setShowing:v9];
  }
  else
  {
    uint64_t v14 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    [v14 inputDestinationDidChange:v9 withIAVHeight:v10 isIAVRelevant:v8 notifyRemote:v15 forScene:height - v12];
  }
}

- (BOOL)showingKeyboard
{
  id v2 = self;
  id v3 = [(UIKeyboardSceneDelegate *)self inputViews];
  LOBYTE(v2) = [(UIKeyboardSceneDelegate *)v2 showingKeyboardForInputViewSet:v3];

  return (char)v2;
}

- (BOOL)showingKeyboardForInputViewSet:(id)a3
{
  id v4 = a3;
  id v5 = [(UIKeyboardSceneDelegate *)self responder];
  if ([v5 _requiresKeyboardWhenFirstResponder])
  {
    uint64_t v6 = [(UIKeyboardSceneDelegate *)self responder];
    uint64_t v7 = [v6 _keyboardResponder];
    if (v7) {
      char v8 = 1;
    }
    else {
      char v8 = [v4 isCustomInputView];
    }
  }
  else
  {
    char v8 = [v4 isCustomInputView];
  }

  return v8;
}

- (void)completeMoveKeyboardForWindow:(id)a3
{
  id v7 = a3;
  if (+[UIKeyboard inputUIOOP])
  {
    BOOL v4 = +[UIKeyboard isKeyboardProcess];
    id v5 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
    uint64_t v6 = v5;
    if (v4) {
      [v5 completeKeyboardChange];
    }
    else {
      [v5 completeMoveKeyboard];
    }
  }
  else
  {
    uint64_t v6 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
    [v6 completeMoveKeyboardForWindow:v7];
  }
}

- (id)keyboardScreen
{
  id v2 = [(UIKeyboardSceneDelegate *)self scene];
  id v3 = [v2 screen];

  return v3;
}

- (id)forceCreateKeyboardWindow
{
  id v3 = [(UIKeyboardSceneDelegate *)self keyboardWindow];

  if (!v3)
  {
    BOOL v4 = [(UIKeyboardSceneDelegate *)self _windowScene];
    if (+[UIKeyboard inputUIOOP])
    {
      -[UIKeyboardSceneDelegate updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:](self, "updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 1, 1, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    else
    {
      id v5 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      objc_msgSend(v5, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 1, 1, v4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
  }
  return [(UIKeyboardSceneDelegate *)self keyboardWindow];
}

- (void)destroyKeyboardWindowIfNecessary
{
  id v9 = +[UIInputViewAnimationStyle animationStyleImmediate];
  id v3 = [(UIKeyboardSceneDelegate *)self _windowScene];
  BOOL v4 = [(UIKeyboardSceneDelegate *)self inputViews];
  id v5 = [v9 endPlacementForInputViewSet:v4 windowScene:v3];

  uint64_t v6 = [(UIKeyboardSceneDelegate *)self inputViews];
  BOOL v7 = [(UIKeyboardSceneDelegate *)self _showKeyboardWindowForInputViewSet:v6 placement:v5 windowScene:v3];

  if (!v7)
  {
    if (+[UIKeyboard inputUIOOP])
    {
      -[UIKeyboardSceneDelegate updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:](self, "updateArbiterClientWithKeyboardFrame:keyboarFrameWithIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 0, 1, v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    }
    else
    {
      char v8 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      objc_msgSend(v8, "prepareToMoveKeyboard:withIAV:isIAVRelevant:showing:notifyRemote:forScene:", 0, 0, 1, v3, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24), *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v8 completeMoveKeyboardForWindow:0];
    }
  }
}

- (void)refreshWithLocalMinimumKeyboardHeight:(double)a3
{
  id v7 = [(UIKeyboardSceneDelegate *)self scene];
  id v5 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  int v6 = [v5 refreshWithLocalMinimumKeyboardHeight:v7 forScene:a3];

  if (v6) {
    [(UIKeyboardSceneDelegate *)self forceReloadInputViews];
  }
}

- (BOOL)minimize
{
  id v3 = +[UIInputViewAnimationStyle animationStyleDefault];
  LOBYTE(self) = [(UIKeyboardSceneDelegate *)self minimizeWithAnimationStyle:v3];

  return (char)self;
}

- (BOOL)minimizeWithAnimationStyle:(id)a3
{
  return [(UIKeyboardSceneDelegate *)self minimizeWithAnimationStyle:a3 force:0];
}

- (BOOL)minimizeWithAnimationStyle:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(UIKeyboardSceneDelegate *)self containerRootController];
  if ([v7 isTransitioning])
  {
    char v8 = [(UIKeyboardSceneDelegate *)self responder];
    id v9 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v8];
  }
  else
  {
    id v9 = [(UIKeyboardSceneDelegate *)self inputViews];
  }

  [(UIKeyboardSceneDelegate *)self setKeyWindowSceneInputViews:v9 animationStyle:v6];
  if (v4)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__UIKeyboardSceneDelegate_minimizeWithAnimationStyle_force___block_invoke;
    v12[3] = &unk_1E52EDDE8;
    v12[4] = self;
    [(UIKeyboardSceneDelegate *)self performMultipleOperations:v12 withAnimationStyle:v6];
  }
  if (![(UIKeyboardSceneDelegate *)self shouldSuppressInputAssistantUpdates])
  {
    BOOL v10 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
    [v10 dismissEmojiSearch];
  }
  return 1;
}

void __60__UIKeyboardSceneDelegate_minimizeWithAnimationStyle_force___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  id v3 = +[UIInputViewSetPlacement placement];
  if ([*(id *)(a1 + 32) hideSystemInputAssistantView])
  {
    int v4 = 1;
  }
  else
  {
    id v5 = [*(id *)(a1 + 32) systemInputAssistantViewController];
    int v6 = [v5 shouldBeShownForInputDelegate:0 inputViews:0];

    int v4 = v6 ^ 1;
  }
  id v7 = [v14 inputViewSet];
  char v8 = [v7 isCustomInputView];

  if (v8)
  {
    id v9 = off_1E52D3B80;
  }
  else
  {
    if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      int v10 = v4;
    }
    else {
      int v10 = 1;
    }
    if (v10 == 1)
    {
      id v11 = [v14 inputViewSet];
      double v12 = [v11 inputAccessoryView];

      if (!v12) {
        goto LABEL_14;
      }
      id v9 = off_1E52D3B28;
    }
    else
    {
      id v9 = off_1E52D3B30;
    }
  }
  uint64_t v13 = [(__objc2_class *)*v9 placement];

  id v3 = (void *)v13;
LABEL_14:
  [v14 setPlacement:v3];
}

- (BOOL)maximize
{
  return [(UIKeyboardSceneDelegate *)self maximizeWithAnimation:1];
}

- (BOOL)maximizeWithAnimation:(BOOL)a3
{
  if (a3) {
    +[UIInputViewAnimationStyle animationStyleDefault];
  }
  else {
  int v4 = +[UIInputViewAnimationStyle animationStyleImmediate];
  }
  BOOL v5 = [(UIKeyboardSceneDelegate *)self maximizeWithAnimationStyle:v4];

  return v5;
}

- (BOOL)maximizeWithAnimationStyle:(id)a3
{
  return [(UIKeyboardSceneDelegate *)self maximizeWithAnimationStyle:a3 force:0];
}

- (BOOL)maximizeWithAnimationStyle:(id)a3 force:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(UIKeyboardSceneDelegate *)self setHideSystemInputAssistantView:0];
  id v7 = [(UIKeyboardSceneDelegate *)self containerRootController];
  if ([v7 isTransitioning])
  {
    char v8 = [(UIKeyboardSceneDelegate *)self responder];
    id v9 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v8];
  }
  else
  {
    id v9 = [(UIKeyboardSceneDelegate *)self inputViews];
  }

  [(UIKeyboardSceneDelegate *)self setKeyWindowSceneInputViews:v9 animationStyle:v6];
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __60__UIKeyboardSceneDelegate_maximizeWithAnimationStyle_force___block_invoke;
    v11[3] = &unk_1E52EDDE8;
    v11[4] = self;
    [(UIKeyboardSceneDelegate *)self performMultipleOperations:v11 withAnimationStyle:v6];
  }

  return 1;
}

void __60__UIKeyboardSceneDelegate_maximizeWithAnimationStyle_force___block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v3 = [v7 inputViewSet];
    [v3 refreshPresentation];
  }
  BOOL v4 = [v7 inputViewSet];
  BOOL v5 = [*(id *)(a1 + 32) scene];
  id v6 = +[UIPeripheralHost endPlacementForInputViewSet:v4 windowScene:v5];

  [v7 setRotationAwarePlacement:v6];
}

- (id)_placementForDeactivatedKeyboard:(BOOL)a3 currentPlacement:(id)a4 forSuppressionAssertion:(BOOL)a5 wantsAssistant:(BOOL)a6 keepAccessories:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  BOOL v10 = a3;
  v42[1] = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  uint64_t v13 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle];
  if (v10)
  {
    id v14 = [(UIKeyboardSceneDelegate *)self inputViews];
    id v15 = [v14 inputAccessoryView];

    if (v9 && !v7 || (NSClassFromString(&cfstr_Uiwebformacces.isa), (objc_opt_isKindOfClass() & 1) != 0))
    {

      goto LABEL_6;
    }
    if (!v15)
    {
LABEL_6:
      if ([v12 isFloating])
      {
        uint64_t v16 = [v12 subPlacements];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          char v18 = [v12 subPlacements];
          double v19 = [v18 objectAtIndexedSubscript:0];

          uint64_t v20 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v19];
          v42[0] = v20;
          id v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v42 count:1];
          [v12 setSubPlacements:v21];
        }
        if (!v8)
        {
          uint64_t v22 = +[UIInputViewSetPlacementInvisibleForFloatingTransition placementWithPlacement:v12];
LABEL_22:
          id v29 = (void *)v22;
          goto LABEL_23;
        }
      }
      else if (!v8)
      {
        double v30 = UIInputViewSetPlacementOffScreenDown;
        goto LABEL_21;
      }
      double v30 = UIInputViewSetPlacementAssistantOnScreen;
LABEL_21:
      uint64_t v22 = [(__objc2_class *)v30 placement];
      goto LABEL_22;
    }
    if ([v12 isFloatingAssistantView])
    {
      uint64_t v31 = +[UIInputViewSetPlacementInvisibleForFloatingAssistantTransition placementWithPlacement:v12];
    }
    else
    {
      if (v8) {
        double v34 = UIInputViewSetPlacementAssistantOnScreen;
      }
      else {
        double v34 = UIInputViewSetPlacementAccessoryOnScreen;
      }
      uint64_t v31 = [(__objc2_class *)v34 placement];
    }
    id v29 = (void *)v31;
  }
  else
  {
    id v23 = +[UIWindow _applicationKeyWindow];
    id v24 = [v23 firstResponder];

    if (v9)
    {
      id v25 = [(UIKeyboardSceneDelegate *)self responder];

      if (v25 == v24) {
        [v24 reloadInputViews];
      }
    }
    self->_BOOL dontNeedAssistantBar = 1;
    id v26 = [(UIKeyboardSceneDelegate *)self responder];
    double v27 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v26];

    self->_BOOL dontNeedAssistantBar = 0;
    id v28 = [(UIKeyboardSceneDelegate *)self scene];
    id v29 = [v13 endPlacementForInputViewSet:v27 windowScene:v28];
  }
LABEL_23:
  double v32 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v35[0] = 67109890;
    v35[1] = v10;
    __int16 v36 = 2112;
    id v37 = v12;
    __int16 v38 = 1024;
    BOOL v39 = v9;
    __int16 v40 = 2112;
    double v41 = v29;
    _os_log_impl(&dword_1853B0000, v32, OS_LOG_TYPE_DEFAULT, "_placementForDeactivatedKeyboard, deactivated: %d, curPlacement: %@, forSuppressionAssertion: %d -> %@", (uint8_t *)v35, 0x22u);
  }

  return v29;
}

- (void)forceOrderInAutomaticFromDirection:(int)a3 withDuration:(double)a4
{
  uint64_t v5 = *(void *)&a3;
  [(UIKeyboardSceneDelegate *)self createAutomaticKeyboardIfNeeded];
  id v7 = +[UIInputViewAnimationStyleDirectional animationStyleAnimated:a4 > 0.0 duration:v5 outDirection:a4];
  [v7 setForce:1];
  [(UIKeyboardSceneDelegate *)self orderInWithAnimationStyle:v7];
}

- (void)forceOrderOutAutomaticToDirection:(int)a3 withDuration:(double)a4
{
  +[UIInputViewAnimationStyleDirectional animationStyleAnimated:duration:outDirection:](UIInputViewAnimationStyleDirectional, "animationStyleAnimated:duration:outDirection:", a4 > 0.0, *(void *)&a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setForce:1];
  [(UIKeyboardSceneDelegate *)self orderOutWithAnimationStyle:v5];
}

- (void)forceOrderInAutomaticAnimated:(BOOL)a3
{
  id v4 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle:a3];
  [v4 setForce:1];
  [(UIKeyboardSceneDelegate *)self orderInWithAnimationStyle:v4];
}

- (void)forceOrderOutAutomaticAnimated:(BOOL)a3
{
  id v4 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle:a3];
  [v4 setForce:1];
  [(UIKeyboardSceneDelegate *)self orderOutWithAnimationStyle:v4];
}

- (void)forceOrderOutAutomaticExceptAccessoryView
{
  if ([(UIKeyboardSceneDelegate *)self automaticAppearanceReallyEnabled])
  {
    uint64_t v3 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle:[(UIKeyboardSceneDelegate *)self animationsEnabled]];
    if (!v3)
    {
      uint64_t v3 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle];
    }
    id v11 = (id)v3;
    id v4 = [(UIKeyboardSceneDelegate *)self inputViews];
    id v5 = [v4 inputAccessoryView];

    if (v5)
    {
      id v6 = [(UIKeyboardSceneDelegate *)self inputViews];
      id v7 = [v6 inputAccessoryView];
      BOOL v8 = +[UIInputViewSet inputSetWithInputView:0 accessoryView:v7];

      BOOL v9 = [(UIKeyboardSceneDelegate *)self inputViews];
      BOOL v10 = [v9 accessoryViewController];
      [v8 setAccessoryViewController:v10];
    }
    else
    {
      BOOL v8 = +[UIInputViewSet emptyInputSet];
    }
    [(UIKeyboardSceneDelegate *)self setInputViews:v8 animationStyle:v11];
  }
}

- (void)orderInWithAnimationStyle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle];
  }
  id v23 = v4;
  id v5 = [(UIKeyboardSceneDelegate *)self responder];

  if (v5)
  {
    id v6 = [(UIKeyboardSceneDelegate *)self responder];
    id v7 = [(UIKeyboardSceneDelegate *)self _inputViewsForResponder:v6];
  }
  else
  {
    BOOL v8 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
    BOOL v9 = [v8 view];
    id v7 = +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:0 assistantView:v9];

    id v6 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
    uint64_t v10 = [v6 shouldBeShownForInputDelegate:0 inputViews:v7] ^ 1;
    id v11 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
    id v12 = [v11 view];
    [v12 setHidden:v10];
  }
  uint64_t v13 = [v7 keyboard];

  if (v13)
  {
    id v14 = +[UIKeyboardImpl activeInstance];
    id v15 = [v14 window];
    if (v15)
    {
      uint64_t v16 = [(UIKeyboardSceneDelegate *)self containerWindow];
      if (v15 == (void *)v16)
      {
      }
      else
      {
        uint64_t v17 = (void *)v16;
        char v18 = [(UIKeyboardSceneDelegate *)self keyboardWindow];

        if (v15 != v18)
        {

          goto LABEL_16;
        }
      }
    }
    double v19 = [v14 textInputTraits];
    uint64_t v20 = [v19 keyboardType];

    if (v20 == 127)
    {
      id v21 = [v14 textInputTraits];
      [v21 setKeyboardType:0];
    }
    uint64_t v22 = +[UIKeyboardImpl sharedInstance];
    [v22 updateLayoutIfNeeded];
  }
  [(UIKeyboardSceneDelegate *)self setInputViews:v7 animationStyle:v23];
LABEL_16:
}

- (void)orderOutWithAnimationStyle:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(UIKeyboardSceneDelegate *)self nextAnimationStyle];
  }
  id v6 = v4;
  id v5 = +[UIInputViewSet emptyInputSet];
  [(UIKeyboardSceneDelegate *)self setInputViews:v5 animationStyle:v6];
}

- (void)_clearPinningResponders
{
  [(NSMutableSet *)self->_pinningResponders removeAllObjects];
  postPinningReloadState = self->_postPinningReloadState;
  self->_postPinningReloadState = 0;
}

- (BOOL)_isPinningInputViewsOnBehalfOfResponder:(id)a3
{
  return [(NSMutableSet *)self->_pinningResponders containsObject:a3];
}

- (BOOL)_hasPostPinningReloadState
{
  id v2 = [(UIInputViewPostPinningReloadState *)self->_postPinningReloadState responderToReload];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)removeTrackingElement:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _UIKeyboardSceneDelegateLogger();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    NSUInteger v6 = [(NSHashTable *)self->_trackingElements count];
    int v7 = 134218498;
    NSUInteger v8 = v6;
    __int16 v9 = 2112;
    uint64_t v10 = objc_opt_class();
    __int16 v11 = 2048;
    id v12 = v4;
    _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "Tracking elements: Removing tracking element [%lu current elements]: <%@: %p>", (uint8_t *)&v7, 0x20u);
  }

  [(NSHashTable *)self->_trackingElements removeObject:v4];
}

- (void)updateTrackingElementsForSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_trackingElements count])
  {
    NSUInteger v6 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSUInteger v13 = [(NSHashTable *)self->_trackingElements count];
      v25.double width = width;
      v25.double height = height;
      id v14 = NSStringFromCGSize(v25);
      *(_DWORD *)buf = 134218242;
      NSUInteger v21 = v13;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Tracking elements: Updating %lu elements for size: %@>", buf, 0x16u);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = (void *)[(NSHashTable *)self->_trackingElements copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "keyboardIsChangingSize:", width, height);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)updateTrackingElementsForOffset:(UIOffset)a3
{
  double vertical = a3.vertical;
  double horizontal = a3.horizontal;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if ([(NSHashTable *)self->_trackingElements count])
  {
    NSUInteger v6 = _UIKeyboardSceneDelegateLogger();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      NSUInteger v13 = [(NSHashTable *)self->_trackingElements count];
      v25.double horizontal = horizontal;
      v25.double vertical = vertical;
      id v14 = NSStringFromUIOffset(v25);
      *(_DWORD *)buf = 134218242;
      NSUInteger v21 = v13;
      __int16 v22 = 2112;
      id v23 = v14;
      _os_log_debug_impl(&dword_1853B0000, v6, OS_LOG_TYPE_DEBUG, "Tracking elements: Updating %lu elements for offset: %@>", buf, 0x16u);
    }
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  int v7 = (void *)[(NSHashTable *)self->_trackingElements copy];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v15 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v12, "keyboardIsChangingOffset:", horizontal, vertical);
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

- (void)addVisibilityObserver:(id)a3
{
  id v4 = a3;
  visibilityObservers = self->_visibilityObservers;
  id v8 = v4;
  if (!visibilityObservers)
  {
    NSUInteger v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    int v7 = self->_visibilityObservers;
    self->_visibilityObservers = v6;

    id v4 = v8;
    visibilityObservers = self->_visibilityObservers;
  }
  [(NSHashTable *)visibilityObservers addObject:v4];
}

- (void)removeVisibilityObserver:(id)a3
{
}

- (BOOL)_restoreMultiDocumentTokenIfNecessary:(id)a3 withId:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v20 = 0;
  NSUInteger v21 = &v20;
  uint64_t v22 = 0x2020000000;
  char v23 = 0;
  int v7 = [v5 restorableResponder];
  int v8 = [v7 conformsToProtocol:&unk_1ED69F180];

  if (v8)
  {
    id v9 = v6;
    uint64_t v10 = [v5 restorableResponder];
    if (objc_opt_respondsToSelector())
    {
      char v11 = [v10 _restoreFocusWithToken:v9];
      *((unsigned char *)v21 + 24) = v11;
    }
    else if (objc_opt_respondsToSelector())
    {
      dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __72__UIKeyboardSceneDelegate__restoreMultiDocumentTokenIfNecessary_withId___block_invoke;
      v17[3] = &unk_1E52E5B98;
      double v19 = &v20;
      NSUInteger v13 = v12;
      long long v18 = v13;
      [v10 _restoreFocusWithToken:v9 completion:v17];
      dispatch_time_t v14 = dispatch_time(0, 1000000000);
      dispatch_semaphore_wait(v13, v14);
    }
  }
  char v15 = *((unsigned char *)v21 + 24);
  _Block_object_dispose(&v20, 8);

  return v15;
}

intptr_t __72__UIKeyboardSceneDelegate__restoreMultiDocumentTokenIfNecessary_withId___block_invoke(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_preserveInputViewsWithId:(id)a3 animated:(BOOL)a4
{
}

- (void)_restoreInputAccessoryViewOverrideWithId:(id)a3
{
  id v4 = a3;
  preservedViewSets = self->_preservedViewSets;
  if (preservedViewSets)
  {
    id v15 = v4;
    uint64_t v6 = [(NSMutableDictionary *)preservedViewSets count];
    id v4 = v15;
    if (v6)
    {
      int v7 = [(NSMutableDictionary *)self->_preservedViewSets objectForKey:v15];
      int v8 = v7;
      if (v7)
      {
        id v9 = [v7 accessoryViewNextResponder];

        if (v9)
        {
          uint64_t v10 = [v8 inputAccessoryView];
          char v11 = [v8 accessoryViewNextResponder];
          [v10 _overrideInputAccessoryViewNextResponderWithResponder:v11];
        }
        dispatch_semaphore_t v12 = [v8 accessoryControllerNextResponder];

        if (v12)
        {
          NSUInteger v13 = [v8 accessoryViewController];
          dispatch_time_t v14 = [v8 accessoryControllerNextResponder];
          [v13 _overrideInputAccessoryViewNextResponderWithResponder:v14];
        }
      }

      id v4 = v15;
    }
  }
}

uint64_t __73__UIKeyboardSceneDelegate__clearPreservedInputViewsWithId_clearKeyboard___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _stopPinningInputViewsOnBehalfOfResponder:a2];
}

BOOL __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 restorableResponder];
  uint64_t v6 = *(void **)(a1 + 32);

  if (v5 == v6)
  {
    [v4 setRestorableResponder:0];
    [v4 setAccessoryViewNextResponder:0];
    [v4 setAccessoryControllerNextResponder:0];
  }

  return v5 == v6;
}

void __76__UIKeyboardSceneDelegate__clearPreservedInputViewsWithRestorableResponder___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  id v4 = [v8 accessoryViewNextResponder];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5) {
    [v8 setAccessoryViewNextResponder:0];
  }
  uint64_t v6 = [v8 accessoryControllerNextResponder];
  int v7 = *(void **)(a1 + 32);

  if (v6 == v7) {
    [v8 setAccessoryControllerNextResponder:0];
  }
}

- (void)_removePreservedInputViewSetForInputView:(id)a3
{
  id v4 = a3;
  if ([(NSMutableDictionary *)self->_preservedViewSets count])
  {
    preservedViewSets = self->_preservedViewSets;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __68__UIKeyboardSceneDelegate__removePreservedInputViewSetForInputView___block_invoke;
    v9[3] = &unk_1E52EDE38;
    id v10 = v4;
    uint64_t v6 = [(NSMutableDictionary *)preservedViewSets keysOfEntriesPassingTest:v9];
    if ([v6 count])
    {
      int v7 = self->_preservedViewSets;
      id v8 = [v6 allObjects];
      [(NSMutableDictionary *)v7 removeObjectsForKeys:v8];
    }
  }
}

BOOL __68__UIKeyboardSceneDelegate__removePreservedInputViewSetForInputView___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = [a3 inputView];
  BOOL v5 = v3 == v4;

  return v5;
}

- (void)_beginPersistingInputAccessoryViewForResponder:(id)a3 withId:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_persistentInputAccessoryResponders)
  {
    id v8 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];
    persistentInputAccessoryResponders = self->_persistentInputAccessoryResponders;
    self->_persistentInputAccessoryResponders = v8;
  }
  persistentInputAccessoryResponderOrder = self->_persistentInputAccessoryResponderOrder;
  if (!persistentInputAccessoryResponderOrder)
  {
    char v11 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    dispatch_semaphore_t v12 = self->_persistentInputAccessoryResponderOrder;
    self->_persistentInputAccessoryResponderOrder = v11;

    persistentInputAccessoryResponderOrder = self->_persistentInputAccessoryResponderOrder;
  }
  [(NSMutableArray *)persistentInputAccessoryResponderOrder addObject:v7];
  [(NSMutableDictionary *)self->_persistentInputAccessoryResponders setObject:v6 forKey:v7];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __81__UIKeyboardSceneDelegate__beginPersistingInputAccessoryViewForResponder_withId___block_invoke;
  v13[3] = &unk_1E52D9F70;
  v13[4] = self;
  [(UIKeyboardSceneDelegate *)self performWithAllowingNilResponderReload:v13];
}

void __81__UIKeyboardSceneDelegate__beginPersistingInputAccessoryViewForResponder_withId___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 responder];
  [v1 _reloadInputViewsForResponder:v2];
}

void __66__UIKeyboardSceneDelegate__endPersistingInputAccessoryViewWithId___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 responder];
  [v1 _reloadInputViewsForResponder:v2];
}

- (void)_clearPersistingInputAccessoryView
{
}

- (void)performWithAllowingNilResponderReload:(id)a3
{
  self->_allowNilResponderReload = 1;
  (*((void (**)(id, SEL))a3 + 2))(a3, a2);
  self->_allowNilResponderReload = 0;
}

- (BOOL)useVisualModeWindowedUI
{
  return [(UIKeyboardVisualModeManager *)self->_visualModeManager useVisualModeWindowed];
}

- (BOOL)windowingModeEnabled
{
  return [(UIKeyboardVisualModeManager *)self->_visualModeManager windowingModeEnabled];
}

- (void)updateSystemInputAssistantVisibilityAfterHardwareKeyEvent
{
  if ([(UIKeyboardSceneDelegate *)self hideSystemInputAssistantView])
  {
    BOOL v3 = [(UIKeyboardSceneDelegate *)self systemInputAssistantViewController];
    int v4 = [v3 shouldBeShownForInputDelegate:0 inputViews:0];

    if (v4)
    {
      [(UIKeyboardSceneDelegate *)self setHideSystemInputAssistantView:0];
      [(UIKeyboardSceneDelegate *)self minimize];
    }
  }
}

- (BOOL)enhancedWindowingModeIsAvailable
{
  id v2 = [(UIKeyboardSceneDelegate *)self scene];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)visualModeManager:(id)a3 didChangeToMode:(int)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    id v9 = v6;
    __int16 v10 = 1024;
    int v11 = a4;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "VisualModeManager %@ didChangeToMode %u, reloading keyboard", (uint8_t *)&v8, 0x12u);
  }

  [(UIKeyboardSceneDelegate *)self forceReloadInputViews];
}

- (void)visualModeManager:(id)a3 observedEnhancedWindowingModeEnabledDidChange:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 1024;
    BOOL v15 = v4;
    _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "VisualModeManager %@ observedEnhancedWindowingModeEnabledDidChange %d", (uint8_t *)&v12, 0x12u);
  }

  int v8 = [(UIKeyboardSceneDelegate *)self scene];
  uint64_t v9 = [v8 activationState];

  if (v9 == 1)
  {
    __int16 v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    int v11 = [(UIKeyboardSceneDelegate *)self scene];
    [v10 setKeyboardSceneIdentifierEnteringForegroundForScene:v11];
  }
}

- (BOOL)showingAccessoryViewOnly
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = [(UIKeyboardSceneDelegate *)self containerWindow];
  BOOL v3 = [v2 rootViewController];
  BOOL v4 = [v3 inputViewSet];
  BOOL v5 = [v3 inputViewSet];
  id v6 = [v5 inputAccessoryView];
  if (v6)
  {
    id v7 = [v3 inputViewSet];
    int v8 = [v7 isInputAccessoryViewPlaceholder] ^ 1;
  }
  else
  {
    int v8 = 0;
  }

  uint64_t v9 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  __int16 v10 = [v9 keyboardWindow];

  int v11 = [v10 rootViewController];
  int v12 = [v11 inputViewSet];
  if (v12) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v8;
  }
  __int16 v14 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v16[0] = 67109634;
    v16[1] = v13;
    __int16 v17 = 2112;
    long long v18 = v4;
    __int16 v19 = 2112;
    uint64_t v20 = v12;
    _os_log_debug_impl(&dword_1853B0000, v14, OS_LOG_TYPE_DEBUG, "showingAccessoryViewOnly %d - tewIVS: %@, rkwIVS: %@", (uint8_t *)v16, 0x1Cu);
  }

  return v13;
}

- (BOOL)expectedInputViewSetIsCustom
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIKeyboardSceneDelegate *)self responder];
  BOOL v4 = [v3 inputViewController];
  if (v4)
  {
  }
  else
  {
    BOOL v5 = [(UIKeyboardSceneDelegate *)self responder];
    id v6 = [v5 inputView];
    [v6 frame];
    double v8 = v7;

    if (v8 <= 0.0) {
      return 0;
    }
  }
  uint64_t v9 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    int v11 = [(UIKeyboardSceneDelegate *)self responder];
    int v12 = [v11 inputViewController];
    BOOL v13 = [(UIKeyboardSceneDelegate *)self responder];
    __int16 v14 = [v13 inputView];
    int v15 = 138412546;
    uint64_t v16 = v12;
    __int16 v17 = 2112;
    long long v18 = v14;
    _os_log_debug_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEBUG, "expectedInputViewSetIsCustom: vc: %@ v: %@", (uint8_t *)&v15, 0x16u);
  }
  return 1;
}

- (BOOL)expectedInputModeIsSpecialized
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = +[UIKeyboardInputModeController sharedInputModeController];
  BOOL v3 = [v2 currentInputMode];
  int v4 = [v3 isSpecializedInputMode];

  if (v4)
  {
    BOOL v5 = +[UIKeyboardVisualModeManager visualModeLog];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      double v7 = +[UIKeyboardInputModeController sharedInputModeController];
      double v8 = [v7 currentInputMode];
      int v9 = 138412290;
      __int16 v10 = v8;
      _os_log_debug_impl(&dword_1853B0000, v5, OS_LOG_TYPE_DEBUG, "expectedInputModeIsSpecialized: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (BOOL)textEntryFocusOnExternalDisplay
{
  id v2 = [(UIKeyboardSceneDelegate *)self scene];
  BOOL v3 = [v2 screen];
  char v4 = [v3 _isEmbeddedScreen] ^ 1;

  return v4;
}

- (void)_windowHostingScene:(id)a3 didMoveFromScreen:(id)a4 toScreen:(id)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  int v9 = +[UIKeyboardVisualModeManager visualModeLog];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412546;
    id v11 = v7;
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "Reload for scene: (%@) did move to screen %@", (uint8_t *)&v10, 0x16u);
  }

  [(UIKeyboardSceneDelegate *)self forceReloadInputViews];
}

- (BOOL)showingInAppWindow
{
  id v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  BOOL v3 = [v2 preferencesActions];
  char v4 = [v3 compactAssistantBarPersistentLocation];

  return (v4 & 4) == 0;
}

- (BOOL)keyboardVisible
{
  id v2 = [(UIKeyboardSceneDelegate *)self keyboardArbiterClient];
  char v3 = [v2 keyboardVisible];

  return v3;
}

uint64_t __68__UIKeyboardSceneDelegate_setHardwareKeyboardExclusivityIdentifier___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  char v3 = +[UIKeyboardInputModeController sharedInputModeController];
  char v4 = [v3 inputModeWithIdentifier:v2];

  uint64_t v5 = [v4 isHandwritingInputMode];
  return v5;
}

uint64_t __68__UIKeyboardSceneDelegate_setHardwareKeyboardExclusivityIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isHandwritingInputMode];
}

- (UIScene)_scene
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  return (UIScene *)WeakRetained;
}

- (void)setAutomaticAppearanceEnabled:(BOOL)a3
{
  self->_BOOL automaticAppearanceEnabled = a3;
}

- (BOOL)restoringInputViewsAndWaitingForInputUI
{
  return self->_restoringInputViewsAndWaitingForInputUI;
}

- (BOOL)shouldSuppressInputAssistantUpdates
{
  return self->_shouldSuppressInputAssistantUpdates;
}

- (BOOL)hideSystemInputAssistantView
{
  return self->_hideSystemInputAssistantView;
}

- (void)setHideSystemInputAssistantView:(BOOL)a3
{
  self->_hideSystemInputAssistantView = a3;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (UIKBRenderConfig)restorableRenderConfig
{
  return self->_restorableRenderConfig;
}

- (void)setRestorableRenderConfig:(id)a3
{
}

- (unint64_t)deactivationCount
{
  return self->_deactivationCount;
}

- (void)setDeactivationCount:(unint64_t)a3
{
  self->_deactivationCount = a3;
}

- (void)setPreservingInputViews:(BOOL)a3
{
  self->_preservingInputViews = a3;
}

- (BOOL)restoringInputViews
{
  return self->_restoringInputViews;
}

- (void)setRestoringInputViews:(BOOL)a3
{
  self->_restoringInputViews = a3;
}

- (BOOL)takingSnapshot
{
  return self->_takingSnapshot;
}

- (void)setTakingSnapshot:(BOOL)a3
{
  self->_takingSnapshot = a3;
}

- (void)setIsKeyboardOnEmbeddedScreen:(BOOL)a3
{
  self->_isKeyboardOnEmbeddedScreen = a3;
}

- (void)setLocalAuthenticationObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localAuthenticationObserver, 0);
  objc_storeStrong((id *)&self->_restorableRenderConfig, 0);
  objc_destroyWeak((id *)&self->_keyWindowCandidate);
  objc_storeStrong((id *)&self->_visualModeManager, 0);
  objc_storeStrong((id *)&self->_hardwareKeyboardExclusivityIdentifier, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_sessionID, 0);
  objc_storeStrong((id *)&self->_preservedKeyboardWindowSnapshot, 0);
  objc_storeStrong((id *)&self->_postWaitingForInputUIBlocks, 0);
  objc_storeStrong((id *)&self->_waitingForInputUI, 0);
  objc_storeStrong((id *)&self->_remoteInputViewHost, 0);
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong((id *)&self->_systemInputAssistantViewController, 0);
  objc_storeStrong((id *)&self->_textFormattingCoordinator, 0);
  objc_storeStrong((id *)&self->_transitionStartTime, 0);
  objc_storeStrong((id *)&self->_keysBeingRestored, 0);
  objc_storeStrong((id *)&self->_persistentInputAccessoryResponderOrder, 0);
  objc_storeStrong((id *)&self->_persistentInputAccessoryResponders, 0);
  objc_storeStrong((id *)&self->_pinningResponders, 0);
  objc_storeStrong((id *)&self->_postPinningReloadState, 0);
  objc_storeStrong((id *)&self->_trackingElements, 0);
  objc_storeStrong((id *)&self->_visibilityObservers, 0);
  objc_storeStrong((id *)&self->_animationStyleStack, 0);
  objc_storeStrong((id *)&self->_preservedViewSets, 0);
  objc_storeStrong((id *)&self->_transientInputViewSet, 0);
  objc_storeStrong((id *)&self->_inputViewSet, 0);
  objc_storeStrong((id *)&self->_selfHostingTrigger, 0);
  objc_storeStrong((id *)&self->_responderWithoutAutomaticAppearanceEnabled, 0);
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_containerWindowForViewService, 0);
  objc_storeStrong((id *)&self->_containerWindow, 0);
}

@end