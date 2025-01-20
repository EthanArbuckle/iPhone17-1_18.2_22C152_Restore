@interface UIKeyboard
+ (BOOL)assistantBarShouldBeIncludedInSizeForDelegate:(id)a3;
+ (BOOL)candidateDisplayIsExtended;
+ (BOOL)doesSpacebarAcceptFullInlineTextCompletion;
+ (BOOL)doesSpacebarAcceptInlineTextCompletion;
+ (BOOL)hasInputOrAssistantViewsOnScreen;
+ (BOOL)inputUIOOP;
+ (BOOL)isAlwaysAllowedAutoFillPanelClient;
+ (BOOL)isAlwaysBlockedAutoFillPanelClient;
+ (BOOL)isAutoFillPanelInAppsEnabled;
+ (BOOL)isAutoFillPanelUIEnabled;
+ (BOOL)isInHardwareKeyboardMode;
+ (BOOL)isInlineDictationGlowEffectEnabled;
+ (BOOL)isInlineTextCompletionEducationUIEnabled;
+ (BOOL)isInlineTextCompletionUIEnabled;
+ (BOOL)isInlineTextCompletionUISupported;
+ (BOOL)isInputUIProcess;
+ (BOOL)isLanguageIndicatorEnabled;
+ (BOOL)isMajelEnabled;
+ (BOOL)isMajelSupported;
+ (BOOL)isModelessActive;
+ (BOOL)isOnScreen;
+ (BOOL)isRedesignedTextCursorEnabled;
+ (BOOL)isRemoteEmojiCollectionViewEnabled;
+ (BOOL)isSafari;
+ (BOOL)isShowingEmojiSearch;
+ (BOOL)isSpotlight;
+ (BOOL)platformSupportsKeyboardServiceRole:(unint64_t)a3;
+ (BOOL)predictionViewPrewarmsPredictiveCandidates;
+ (BOOL)presentsInlineTextCompletionAsMarkedText;
+ (BOOL)resizable;
+ (BOOL)respondsToProxGesture;
+ (BOOL)shouldExtendKeyboardInputUI;
+ (BOOL)shouldMinimizeForHardwareKeyboard;
+ (BOOL)shouldSuppressSoftwareKeyboardForResponder:(id)a3;
+ (BOOL)splitKeyboardEnabled;
+ (BOOL)supportsAutoFillPanel;
+ (BOOL)useAutoFillUIRTIInterfaceForIphone;
+ (BOOL)usesInputSystemUI;
+ (BOOL)usesInputSystemUIForAutoFillOnly;
+ (BOOL)usesInputSystemUIForAutoFillOnlyWithRTI;
+ (BOOL)usesLocalKeyboard;
+ (BOOL)usingEndInputSessionCompletion;
+ (CGRect)defaultFrameForInterfaceOrientation:(int64_t)a3;
+ (CGSize)defaultSize;
+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3;
+ (CGSize)keyboardSizeForInterfaceOrientation:(int64_t)a3;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4 inputDelegate:(id)a5;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 includingAssistantBar:(BOOL)a4 ignoreInputView:(BOOL)a5;
+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 inputDelegate:(id)a4;
+ (UIEdgeInsets)_keyboardFocusGuideMargins;
+ (UIEdgeInsets)keyplanePadding;
+ (double)predictionViewHeightForCurrentInputMode;
+ (id)activeKeyboard;
+ (id)activeKeyboardForScreen:(id)a3;
+ (id)currentDocumentState;
+ (id)homeGestureExclusionZones;
+ (id)keyboardApplicationIdentifier;
+ (id)keyboardBundleIdentifier;
+ (id)obtainHideDisambiguationCandidatesAssertionForReason:(id)a3;
+ (id)obtainHideInlineCandidatesAssertionForReason:(id)a3;
+ (id)snapshotViewForOptions:(unint64_t)a3;
+ (id)snapshotViewForPredictionViewTransition;
+ (id)suppressionPolicyDelegate;
+ (int)keyboardProcessId;
+ (unint64_t)serviceRole;
+ (void)_clearActiveKeyboard;
+ (void)clearActiveForScreen:(id)a3;
+ (void)clearLastKeyboardApplicationIdentifier;
+ (void)forceKeyboardAlpha:(double)a3;
+ (void)initImplementationNow;
+ (void)makeKeyboardActive:(id)a3 forScreen:(id)a4;
+ (void)removeAllDynamicDictionaries;
+ (void)resetServiceRole;
+ (void)setKeyboardAlpha:(double)a3;
+ (void)setKeyboardAlpha:(double)a3 remote:(BOOL)a4 force:(BOOL)a5 processId:(int)a6;
+ (void)setPredictionViewPrewarmsPredictiveCandidates:(BOOL)a3;
+ (void)setResizable:(BOOL)a3;
+ (void)setServiceRole:(unint64_t)a3;
+ (void)setSuppressionPolicyDelegate:(id)a3;
- (BOOL)_disableTouchInput;
- (BOOL)_hasCandidates;
- (BOOL)_isAutomaticKeyboard;
- (BOOL)_isDictationCurrentView;
- (BOOL)_touchesInsideShouldHideCalloutBar;
- (BOOL)_useLinearLayout;
- (BOOL)_useRecentsAlert;
- (BOOL)allowExternalChangeForFocusHeading:(unint64_t)a3 cursorLocation:(unint64_t)a4;
- (BOOL)canBecomeFocused;
- (BOOL)canDismiss;
- (BOOL)canHandleEvent:(id)a3;
- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4;
- (BOOL)caretBlinks;
- (BOOL)caretVisible;
- (BOOL)disableInteraction;
- (BOOL)gestureRecognizerShouldBegin:(id)a3;
- (BOOL)hasAutocorrectPrompt;
- (BOOL)hasImpendingCursorLocation;
- (BOOL)isActive;
- (BOOL)isActivePerScreen;
- (BOOL)isAutomatic;
- (BOOL)isMinimized;
- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (BOOL)returnKeyEnabled;
- (BOOL)shouldSaveMinimizationState;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (BOOL)shouldUpdateLayoutAutomatically;
- (BOOL)showPredictionBar;
- (BOOL)showsCandidatesInline;
- (BOOL)typingEnabled;
- (CGRect)_floatingKeyboardDraggableRect;
- (CGRect)_focusCastingFrameForHeading:(unint64_t)a3 inCoordinateSpace:(id)a4;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)unfocusedFocusGuideOutsets;
- (UIKeyboard)initWithDefaultSize;
- (UIKeyboard)initWithFrame:(CGRect)a3;
- (UIKeyboard)initWithRequestedInteractionModel:(unint64_t)a3;
- (UIPeripheralAnimationGeometry)geometryForImplHeightDelta:(SEL)a3;
- (UIPeripheralAnimationGeometry)geometryForMinimize:(SEL)a3;
- (UITextCursorAssertionController)_activeAssertionController;
- (id)_baseKeyForRepresentedString:(id)a3;
- (id)_getAutocorrection;
- (id)_getCurrentKeyboardName;
- (id)_getCurrentKeyplaneName;
- (id)_getLocalizedInputMode;
- (id)_initWithFrame:(CGRect)a3 lazily:(BOOL)a4;
- (id)_keyplaneForKey:(id)a3;
- (id)_keyplaneNamed:(id)a3;
- (id)_overrideTextInputTraits;
- (id)_systemDefaultFocusGroupIdentifier;
- (id)_touchPoint:(CGPoint)a3;
- (id)_typeCharacter:(id)a3 withError:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6;
- (id)createPathEffectViewIfNecessary;
- (id)defaultTextInputTraits;
- (id)delegate;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (id)initLazily;
- (id)targetWindow;
- (id)window;
- (int)textEffectsVisibilityLevel;
- (int64_t)_focusTouchSensitivityStyle;
- (int64_t)_focusedSound;
- (int64_t)_positionInCandidateList:(id)a3;
- (int64_t)_rotaryFocusMovementAxis;
- (int64_t)interfaceOrientation;
- (int64_t)keyboardIdiom;
- (unint64_t)cursorLocation;
- (unint64_t)impendingCursorLocation;
- (unint64_t)requestedInteractionModel;
- (void)_acceptCurrentCandidate;
- (void)_changeToKeyplane:(id)a3;
- (void)_deactivateForBackgrounding;
- (void)_didChangeKeyplaneWithContext:(id)a3;
- (void)_setAutocorrects:(BOOL)a3;
- (void)_setDisableTouchInput:(BOOL)a3;
- (void)_setDisableUpdateMaskForSecureTextEntry:(BOOL)a3;
- (void)_setInputMode:(id)a3;
- (void)_setPasscodeOutlineAlpha:(double)a3;
- (void)_setPreferredHeight:(double)a3;
- (void)_setRenderConfig:(id)a3;
- (void)_setSplit:(BOOL)a3;
- (void)_setUndocked:(BOOL)a3;
- (void)_setUseLinearLayout:(BOOL)a3;
- (void)_setUseRecentsAlert:(BOOL)a3;
- (void)_showAutofillExtras;
- (void)_toggleMenuGestureRecognizer:(BOOL)a3;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)acceptAutocorrection;
- (void)acceptAutocorrectionWithCompletionHandler:(id)a3;
- (void)activate;
- (void)activateIfNeeded;
- (void)autoAdjustOrientation;
- (void)clearActivePerScreenIfNeeded;
- (void)clearSnapshot;
- (void)deactivate;
- (void)dealloc;
- (void)didFocusGuideWithHeading:(unint64_t)a3;
- (void)didMoveToWindow;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)displayLayer:(id)a3;
- (void)geometryChangeDone:(BOOL)a3;
- (void)implBoundsHeightChangeDone:(double)a3 suppressNotification:(BOOL)a4;
- (void)keyboardMinMaximized:(BOOL)a3;
- (void)layoutSubviews;
- (void)manualKeyboardWasOrderedIn;
- (void)manualKeyboardWasOrderedOut;
- (void)manualKeyboardWillBeOrderedIn;
- (void)manualKeyboardWillBeOrderedOut;
- (void)maximize;
- (void)minimize;
- (void)prepareForGeometryChange;
- (void)prepareForImplBoundsHeightChange:(double)a3 suppressNotification:(BOOL)a4;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesChanged:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)remoteControlReceivedWithEvent:(id)a3;
- (void)removeAutocorrectPrompt;
- (void)responseContextDidChange;
- (void)setBounds:(CGRect)a3;
- (void)setCaretBlinks:(BOOL)a3;
- (void)setCaretVisible:(BOOL)a3;
- (void)setCorrectionLearningAllowed:(BOOL)a3;
- (void)setCursorLocation:(unint64_t)a3;
- (void)setDefaultTextInputTraits:(id)a3;
- (void)setDisableInteraction:(BOOL)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHasImpendingCursorLocation:(BOOL)a3;
- (void)setImpendingCursorLocation:(unint64_t)a3;
- (void)setKeyboardIdiom:(int64_t)a3;
- (void)setMinimized:(BOOL)a3;
- (void)setNeedsDisplay;
- (void)setOrientation:(int64_t)a3;
- (void)setRequestedInteractionModel:(unint64_t)a3;
- (void)setReturnKeyEnabled:(BOOL)a3;
- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3;
- (void)setShowsCandidatesInline:(BOOL)a3;
- (void)setTypingEnabled:(BOOL)a3;
- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3;
- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3 fromView:(id)a4;
- (void)set_overrideTextInputTraits:(id)a3;
- (void)setupKeyFocusGuides;
- (void)syncMinimizedStateToHardwareKeyboardAttachedState;
- (void)takeSnapshot;
- (void)textInputTraitsDidChange;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
- (void)updateFocusMarginsUpToView:(id)a3;
- (void)updateKeyFocusGuides;
- (void)updateLayout;
- (void)willMoveToWindow:(id)a3;
@end

@implementation UIKeyboard

+ (id)keyboardBundleIdentifier
{
  if (![a1 isKeyboardProcess]) {
    goto LABEL_3;
  }
  v2 = +[UIKeyboardImpl activeInstance];
  v3 = [v2 inputSystemSourceSession];
  v4 = [v3 documentTraits];
  v5 = [v4 bundleId];

  if (!v5)
  {
LABEL_3:
    v5 = _UIMainBundleIdentifier();
  }
  return v5;
}

+ (BOOL)usesLocalKeyboard
{
  if (TIGetUsesLocalKeyboardValue_onceToken != -1) {
    dispatch_once(&TIGetUsesLocalKeyboardValue_onceToken, &__block_literal_global_1468_0);
  }
  v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  v3 = [v2 valueForPreferenceKey:@"UsesLocalKeyboard"];

  LODWORD(v2) = [v3 BOOLValue];
  if (v2 && +[UIKeyboard usesInputSystemUI])
  {
    v4 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
    char v5 = [v4 snapshotting];
    if ((v5 & 1) != 0
      || (+[UIKeyboardSceneDelegate activeKeyboardSceneDelegate](UIKeyboardSceneDelegate, "activeKeyboardSceneDelegate"), v3 = objc_claimAutoreleasedReturnValue(), [v3 loadingLocalKeyboard]))
    {
      v6 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      char v7 = [v6 sceneIsFullScreen];

      if (v5) {
        goto LABEL_12;
      }
    }
    else
    {
      char v7 = 0;
    }

LABEL_12:
    return v7;
  }
  return 0;
}

+ (BOOL)isInputUIProcess
{
  if (qword_1EB25C428 != -1) {
    dispatch_once(&qword_1EB25C428, &__block_literal_global_1000);
  }
  return byte_1EB25C401;
}

+ (BOOL)usesInputSystemUI
{
  int v3 = [a1 inputUIOOP];
  if (v3) {
    LOBYTE(v3) = [a1 isKeyboardProcess] ^ 1;
  }
  return v3;
}

+ (BOOL)inputUIOOP
{
  if (qword_1EB25C420 != -1) {
    dispatch_once(&qword_1EB25C420, &__block_literal_global_990);
  }
  return _MergedGlobals_29_3;
}

+ (BOOL)supportsAutoFillPanel
{
  if (qword_1EB25C478 != -1) {
    dispatch_once(&qword_1EB25C478, &__block_literal_global_1048);
  }
  return byte_1EB25C40B;
}

+ (BOOL)isRemoteEmojiCollectionViewEnabled
{
  if (_UIApplicationIsFirstPartyStickers() & 1) != 0 || (_UIApplicationIsStickerPickerService()) {
    return 0;
  }
  if (TIGetRemoteEmojiValue_onceToken != -1) {
    dispatch_once(&TIGetRemoteEmojiValue_onceToken, &__block_literal_global_1473_0);
  }
  v2 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  int v3 = [v2 valueForPreferenceKey:@"RemoteEmoji"];

  LODWORD(v2) = [v3 BOOLValue];
  if (!v2) {
    return 0;
  }
  v4 = +[UIDevice currentDevice];
  [v4 userInterfaceIdiom];

  return _os_feature_enabled_impl();
}

+ (BOOL)presentsInlineTextCompletionAsMarkedText
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UIKeyboard_presentsInlineTextCompletionAsMarkedText__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C450 != -1) {
    dispatch_once(&qword_1EB25C450, block);
  }
  return byte_1EB25C406;
}

+ (BOOL)isInlineTextCompletionUIEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__UIKeyboard_isInlineTextCompletionUIEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C448 != -1) {
    dispatch_once(&qword_1EB25C448, block);
  }
  return byte_1EB25C405;
}

+ (BOOL)isInHardwareKeyboardMode
{
  v2 = +[UIKeyboardImpl activeInstance];
  int v3 = v2;
  if (v2)
  {
    char v4 = [v2 isInHardwareKeyboardMode];
  }
  else
  {
    char v5 = +[UIDevice currentDevice];
    char v4 = [v5 _isHardwareKeyboardAvailable];
  }
  return v4;
}

+ (id)activeKeyboardForScreen:(id)a3
{
  id v3 = a3;
  id v4 = (id)activeKeyboardsPerScreen;
  objc_sync_enter(v4);
  char v5 = (void *)activeKeyboardsPerScreen;
  v6 = [v3 _name];
  char v7 = [v5 objectForKey:v6];

  objc_sync_exit(v4);
  return v7;
}

+ (BOOL)isRedesignedTextCursorEnabled
{
  if (qword_1EB25C470 != -1) {
    dispatch_once(&qword_1EB25C470, &__block_literal_global_1035);
  }
  return byte_1EB25C40A;
}

void __24__UIKeyboard_inputUIOOP__block_invoke()
{
  uint64_t v0 = _UIDeviceNativeUserInterfaceIdiomIgnoringClassic();
  int v1 = _os_feature_enabled_impl();
  if (v0 == 1) {
    int v1 = _os_feature_enabled_impl();
  }
  int v2 = v1;
  if (_os_feature_enabled_impl() && v2)
  {
    if (qword_1EB25C4C8 != -1) {
      dispatch_once(&qword_1EB25C4C8, &__block_literal_global_1447);
    }
    id v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
    id v4 = [v3 valueForPreferenceKey:@"KeyboardOOP"];

    _MergedGlobals_29_3 = [v4 BOOLValue];
  }
  else
  {
    _MergedGlobals_29_3 = 0;
  }
}

+ (id)activeKeyboard
{
  return (id)activeKeyboard;
}

void __30__UIKeyboard_isInputUIProcess__block_invoke()
{
  uint64_t v0 = _UIMainBundleIdentifier();
  int v1 = [v0 isEqualToString:@"com.apple.InputUI"];

  if (v1) {
    byte_1EB25C401 = 1;
  }
}

uint64_t __43__UIKeyboard_isRedesignedTextCursorEnabled__block_invoke()
{
  uint64_t result = _os_feature_enabled_impl();
  byte_1EB25C40A = result;
  return result;
}

void __35__UIKeyboard_supportsAutoFillPanel__block_invoke()
{
  if (_os_feature_enabled_impl()) {
    char v0 = 1;
  }
  else {
    char v0 = _os_feature_enabled_impl();
  }
  byte_1EB25C40B = v0;
  int v1 = +[UIDevice currentDevice];
  uint64_t v2 = [v1 userInterfaceIdiom];

  if (v2 == 1)
  {
    if (_os_feature_enabled_impl()) {
      char v3 = 1;
    }
    else {
      char v3 = _os_feature_enabled_impl();
    }
    byte_1EB25C40B = v3;
  }
}

+ (BOOL)isModelessActive
{
  int v2 = [(id)objc_opt_class() isMajelEnabled];
  if (v2)
  {
    char v3 = +[UIKeyboardInputMode dictationInputMode];
    char v4 = [v3 usingTypeAndTalk];

    LOBYTE(v2) = v4;
  }
  return v2;
}

+ (BOOL)isMajelEnabled
{
  if (qword_1EB25C438 != -1) {
    dispatch_once(&qword_1EB25C438, &__block_literal_global_1019);
  }
  if (byte_1EB25C403 && os_variant_has_internal_diagnostics())
  {
    char v3 = _UIKitUserDefaults();
    byte_1EB25C403 = [v3 BOOLForKey:@"UIDictationControllerDisableTypeAndTalk"] ^ 1;
  }
  return byte_1EB25C403;
}

+ (BOOL)usesInputSystemUIForAutoFillOnly
{
  if ([a1 isKeyboardProcess] & 1) != 0 || (objc_msgSend(a1, "inputUIOOP")) {
    return 0;
  }
  return [a1 supportsAutoFillPanel];
}

+ (BOOL)isOnScreen
{
  int v2 = isOnScreen_token;
  if (!isOnScreen_token)
  {
    notify_register_check("com.apple.keyboard.isOnScreen", &isOnScreen_token);
    int v2 = isOnScreen_token;
  }
  uint64_t state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

uint64_t __28__UIKeyboard_isMajelEnabled__block_invoke()
{
  uint64_t result = +[UIKeyboard isMajelSupported];
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  byte_1EB25C403 = result;
  return result;
}

+ (BOOL)isMajelSupported
{
  if (qword_1EB25C440 != -1) {
    dispatch_once(&qword_1EB25C440, &__block_literal_global_1026);
  }
  return byte_1EB25C404;
}

void __30__UIKeyboard_isMajelSupported__block_invoke()
{
  id v1 = +[UIDevice currentDevice];
  if ([v1 userInterfaceIdiom])
  {
    char v0 = +[UIDevice currentDevice];
    byte_1EB25C404 = [v0 userInterfaceIdiom] == 1;
  }
  else
  {
    byte_1EB25C404 = 1;
  }
}

- (void)autoAdjustOrientation
{
  if (!self->m_hasExplicitOrientation) {
    self->m_orientation = [(UIView *)self _keyboardOrientation];
  }
}

- (id)_initWithFrame:(CGRect)a3 lazily:(BOOL)a4
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboard;
  char v7 = -[UIView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v8 = v7;
  if (v7)
  {
    v7->_shouldUpdateLayoutAutomatically = 1;
    [(UIView *)v7 setAutoresizingMask:0];
    v8->m_orientation = 0;
    if (!a4)
    {
      if (!activeKeyboard) {
        objc_storeStrong((id *)&activeKeyboard, v8);
      }
      v9 = +[UIKeyboardImpl activeInstance];
      -[UIView setOpaque:](v8, "setOpaque:", [v9 keyboardDrawsOpaque]);

      v10 = +[UIKeyboardImpl sharedInstance];
      v11 = v10;
      if ((UIKeyboard *)activeKeyboard == v8) {
        [v10 setGeometryDelegate:v8];
      }
      if ([(UIKeyboard *)v8 isAutomatic]
        && (([v11 _shouldMinimizeForHardwareKeyboard] & 1) != 0
         || [v11 _shouldSuppressSoftwareKeyboard]))
      {
        v8->m_minimized = 1;
      }
      v8->m_respondingToImplGeometryChange = 0;
      CGSize v12 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
      v8->_forcedFrame.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
      v8->_forcedFrame.size = v12;
      v8->_preferredSize.CGFloat width = width;
      v8->_preferredSize.CGFloat height = height;
    }
  }
  return v8;
}

- (UIKeyboard)initWithFrame:(CGRect)a3
{
  return (UIKeyboard *)-[UIKeyboard _initWithFrame:lazily:](self, "_initWithFrame:lazily:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (UIKeyboard)initWithDefaultSize
{
  double v3 = *MEMORY[0x1E4F1DAD8];
  double v4 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  +[UIKeyboard defaultSizeForInterfaceOrientation:1];
  return -[UIKeyboard initWithFrame:](self, "initWithFrame:", v3, v4, v5, v6);
}

- (UIKeyboard)initWithRequestedInteractionModel:(unint64_t)a3
{
  double v5 = *MEMORY[0x1E4F1DAD8];
  double v6 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
  +[UIKeyboard defaultSizeForInterfaceOrientation:1];
  uint64_t result = -[UIKeyboard _initWithFrame:lazily:](self, "_initWithFrame:lazily:", 0, v5, v6, v7, v8);
  if (result) {
    result->_requestedInteractionModel = a3;
  }
  return result;
}

- (id)initLazily
{
  return -[UIKeyboard _initWithFrame:lazily:](self, "_initWithFrame:lazily:", 1, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
}

- (void)dealloc
{
  if ((UIKeyboard *)activeKeyboard == self)
  {
    activeKeyboard = 0;

    double v3 = +[UIKeyboardImpl activeInstance];
    [v3 setGeometryDelegate:0];

    double v4 = +[UIKeyboardImpl activeInstance];
    [v4 setRequestedInteractionModel:0];
  }
  [(UIKeyboard *)self clearActivePerScreenIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)UIKeyboard;
  [(UIView *)&v5 dealloc];
}

- (id)window
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboard;
  int v2 = [(UIView *)&v4 window];
  return v2;
}

+ (void)_clearActiveKeyboard
{
  int v2 = (void *)activeKeyboard;
  activeKeyboard = 0;
}

+ (void)makeKeyboardActive:(id)a3 forScreen:(id)a4
{
  id v11 = a3;
  id v5 = a4;
  if (v5)
  {
    id v6 = (id)activeKeyboardsPerScreen;
    objc_sync_enter(v6);
    double v7 = (void *)activeKeyboardsPerScreen;
    if (!activeKeyboardsPerScreen)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v9 = (void *)activeKeyboardsPerScreen;
      activeKeyboardsPerScreen = (uint64_t)v8;

      double v7 = (void *)activeKeyboardsPerScreen;
    }
    v10 = [v5 _name];
    [v7 setObject:v11 forKey:v10];

    objc_sync_exit(v6);
  }
}

+ (void)clearActiveForScreen:(id)a3
{
  id v6 = a3;
  id v3 = (id)activeKeyboardsPerScreen;
  objc_sync_enter(v3);
  objc_super v4 = (void *)activeKeyboardsPerScreen;
  id v5 = [v6 _name];
  [v4 removeObjectForKey:v5];

  objc_sync_exit(v3);
}

+ (UIEdgeInsets)_keyboardFocusGuideMargins
{
  double v2 = -60.0;
  double v3 = -60.0;
  double v4 = -60.0;
  double v5 = -60.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (BOOL)isActivePerScreen
{
  double v3 = objc_opt_class();
  double v4 = [(UIKeyboard *)self window];
  double v5 = [v4 screen];
  id v6 = [v3 activeKeyboardForScreen:v5];
  LOBYTE(v3) = v6 != 0;

  return (char)v3;
}

- (void)clearActivePerScreenIfNeeded
{
  if ([(UIKeyboard *)self isActivePerScreen])
  {
    double v3 = objc_opt_class();
    id v5 = [(UIKeyboard *)self window];
    double v4 = [v5 screen];
    [v3 clearActiveForScreen:v4];
  }
}

+ (void)initImplementationNow
{
  id v2 = +[UIKeyboardImpl sharedInstance];
}

+ (void)removeAllDynamicDictionaries
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  [v2 removeAllDynamicDictionaries];
}

+ (CGSize)defaultSize
{
  +[UIKeyboardImpl defaultSizeForInterfaceOrientation:1];
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

+ (CGSize)defaultSizeForInterfaceOrientation:(int64_t)a3
{
  +[UIKeyboardImpl defaultSizeForInterfaceOrientation:a3];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

+ (CGRect)defaultFrameForInterfaceOrientation:(int64_t)a3
{
  +[UIKeyboard defaultSizeForInterfaceOrientation:](UIKeyboard, "defaultSizeForInterfaceOrientation:");
  double v5 = v4;
  double v7 = v6;
  BOOL v8 = _UIAppUseModernRotationAndPresentationBehaviors();
  v9 = +[UIScreen mainScreen];
  v10 = v9;
  if (v8)
  {
    [v9 _boundsForInterfaceOrientation:a3];
    double v12 = v11;

    double v13 = v12 - v7;
    double v14 = 0.0;
LABEL_3:
    double v15 = v5;
    double v5 = v7;
  }
  else
  {
    [v9 bounds];
    double v18 = v17;
    double v20 = v19;

    double v13 = 0.0;
    double v14 = 0.0;
    double v15 = v7;
    switch(a3)
    {
      case 1:
        double v13 = v20 - v7;
        goto LABEL_3;
      case 2:
        goto LABEL_3;
      case 3:
        break;
      case 4:
        double v14 = v18 - v7;
        double v15 = v7;
        break;
      default:
        double v14 = *MEMORY[0x1E4F1DB28];
        double v13 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
        double v15 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
        double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
        break;
    }
  }
  double v16 = v5;
  result.size.CGFloat height = v16;
  result.size.CGFloat width = v15;
  result.origin.y = v13;
  result.origin.x = v14;
  return result;
}

+ (BOOL)respondsToProxGesture
{
  int v2 = respondsToProxGesture_token;
  if (!respondsToProxGesture_token)
  {
    notify_register_check("com.apple.keyboard.proxGestureEnabled", &respondsToProxGesture_token);
    int v2 = respondsToProxGesture_token;
  }
  uint64_t state64 = 0;
  notify_get_state(v2, &state64);
  return state64 & 1;
}

+ (BOOL)shouldMinimizeForHardwareKeyboard
{
  int v2 = +[UIDevice currentDevice];
  if ([v2 _isHardwareKeyboardAvailable])
  {
    double v3 = +[UIKeyboardImpl activeInstance];
    char v4 = [v3 automaticMinimizationEnabled];
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

+ (BOOL)hasInputOrAssistantViewsOnScreen
{
  int v2 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v3 = [v2 containerRootController];

  LOBYTE(v2) = [v3 hasInputOrAssistantViewsOnScreen];
  return (char)v2;
}

+ (id)suppressionPolicyDelegate
{
  return (id)_suppressionPolicyDelegate;
}

+ (void)setSuppressionPolicyDelegate:(id)a3
{
}

+ (BOOL)shouldSuppressSoftwareKeyboardForResponder:(id)a3
{
  id v3 = a3;
  if (!v3)
  {
    char v4 = +[UIKeyboardImpl activeInstance];
    id v3 = [v4 delegateAsResponder];
  }
  double v5 = +[UIKeyboardImpl sharedInstance];
  char v6 = [v5 _shouldSuppressSoftwareKeyboardForResponder:v3 ignoringPolicyDelegate:0];

  return v6;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3
{
  [a1 sizeForInterfaceOrientation:a3 ignoreInputView:0];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 inputDelegate:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if ([a1 usesInputSystemUI])
  {
    double v7 = +[_UIKeyboardArbiterClient automaticSharedArbiterClient];
    BOOL v8 = [v7 currentUIState];
    char v9 = [v8 resizing];

    if ((v9 & 1) == 0)
    {
      v10 = +[UIKeyboardImpl sharedInstance];
      [v10 setInputModeFromPreferences];
    }
  }
  [a1 sizeForInterfaceOrientation:a3 ignoreInputView:1 inputDelegate:v6];
  CGFloat v12 = v11;
  double v14 = v13;
  if (!+[UIKeyboard inputUIOOP])
  {
    if ([(id)UIApp _isSpringBoard])
    {
      double v15 = (objc_class *)objc_opt_class();
      double v16 = NSStringFromClass(v15);
      int v17 = [v16 isEqualToString:@"SPUIProxySearchField"];

      if (v17)
      {
        double v18 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
        double v19 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
        double v20 = [v19 scene];
        [v18 intersectionHeightForWindowScene:v20];
        double v22 = v21;

        if (v22 > 0.0)
        {
          v23 = +[UIKeyboardInputModeController sharedInputModeController];
          v24 = [v23 currentInputMode];

          +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:a3 inputMode:v24];
          double v26 = v25;
          double v28 = v27;
          +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:a3 inputMode:v24];
          double v31 = v22 + v26 - v29 + v28 - v30;
          if (v14 < v31) {
            double v14 = v31;
          }
        }
      }
    }
  }
  if (os_variant_has_internal_diagnostics())
  {
    v34 = _UIKeyboardExtendedLog();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      v39.CGFloat width = v12;
      v39.CGFloat height = v14;
      v35 = NSStringFromSize(v39);
      int v36 = 138412290;
      v37 = v35;
      _os_log_impl(&dword_1853B0000, v34, OS_LOG_TYPE_DEFAULT, "keyboard size lookup ahead SPI: %@", (uint8_t *)&v36, 0xCu);
    }
  }

  double v32 = v12;
  double v33 = v14;
  result.CGFloat height = v33;
  result.CGFloat width = v32;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4
{
  [a1 sizeForInterfaceOrientation:a3 ignoreInputView:a4 inputDelegate:0];
  result.CGFloat height = v5;
  result.CGFloat width = v4;
  return result;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 ignoreInputView:(BOOL)a4 inputDelegate:(id)a5
{
  BOOL v5 = a4;
  id v7 = a5;
  BOOL v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  char v9 = [v8 inputViews];
  v10 = v9;
  if (!v7 || v9 && ![v9 isEmpty] || objc_msgSend(v10, "isCustomInputView"))
  {
    double v11 = [v10 keyboard];
    if (!v11)
    {
      if (!v5 && ([v10 isCustomInputView] & 1) != 0) {
        goto LABEL_10;
      }
      uint64_t v12 = +[UIInputViewSet inputSetWithKeyboardAndAccessoryView:0];
      double v11 = v10;
      v10 = (void *)v12;
    }

LABEL_10:
    double v13 = [v8 systemInputAssistantViewController];
    double v14 = v13;
    if (v13) {
      double v15 = v13;
    }
    else {
      double v15 = objc_alloc_init(UISystemInputAssistantViewController);
    }
    double v16 = v15;

    BOOL v17 = [(UISystemInputAssistantViewController *)v16 shouldBeShownForInputDelegate:v7 inputViews:v10];
    if (v17) {
      goto LABEL_14;
    }
    goto LABEL_16;
  }
  if ([(id)objc_opt_class() assistantBarShouldBeIncludedInSizeForDelegate:v7])
  {
LABEL_14:
    BOOL v18 = 1;
    goto LABEL_20;
  }
LABEL_16:
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIKeyboardImpl isFloating])
  {
    double v19 = [v8 responder];
    double v20 = [v19 inputViewController];
    BOOL v18 = v20 != 0;
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_20:
  [(id)objc_opt_class() sizeForInterfaceOrientation:a3 includingAssistantBar:v18 ignoreInputView:v5];
  double v22 = v21;
  double v24 = v23;

  double v25 = v22;
  double v26 = v24;
  result.CGFloat height = v26;
  result.CGFloat width = v25;
  return result;
}

+ (BOOL)assistantBarShouldBeIncludedInSizeForDelegate:(id)a3
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (os_variant_has_internal_diagnostics())
  {
    if (!v3)
    {
      double v23 = __UIFaultDebugAssertLog();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)double v25 = 0;
        _os_log_fault_impl(&dword_1853B0000, v23, OS_LOG_TYPE_FAULT, "assistantBarShouldBeIncludedInSizeForDelegate:inputMode: should only be used with a valid inputDelegate", v25, 2u);
      }
    }
  }
  else if (!v3)
  {
    double v24 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &assistantBarShouldBeIncludedInSizeForDelegate____s_category)+ 8);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v25 = 0;
      _os_log_impl(&dword_1853B0000, v24, OS_LOG_TYPE_ERROR, "assistantBarShouldBeIncludedInSizeForDelegate:inputMode: should only be used with a valid inputDelegate", v25, 2u);
    }
  }
  double v4 = +[UIKeyboardImpl activeInstance];
  BOOL v5 = [v4 textInputTraits];

  if ([v3 conformsToProtocolCached:&unk_1ED431E48])
  {
    id v6 = [v3 textInputTraits];
    uint64_t v7 = +[UITextInputTraits traitsByAdoptingTraits:v6];

    BOOL v5 = (void *)v7;
  }
  if (!v5)
  {
    if (!+[UIKBInputDelegateManager isAsyncTextInputEnabled](UIKBInputDelegateManager, "isAsyncTextInputEnabled")|| ![v3 conformsToProtocolCached:&unk_1ED700940]|| (+[UITextInputTraits traitsByAdoptingTraits:](UITextInputTraits, "traitsByAdoptingTraits:", v3), (BOOL v5 = objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ([v3 conformsToProtocolCached:&unk_1ED42F658])
      {
        BOOL v5 = +[UITextInputTraits traitsByAdoptingTraits:v3];
      }
      else
      {
        BOOL v5 = 0;
      }
    }
  }
  BOOL v8 = +[UIKeyboardInputModeController sharedInputModeController];
  char v9 = [v8 currentInputMode];
  v10 = [v9 identifier];

  if (objc_opt_respondsToSelector())
  {
    double v11 = [v3 textInputMode];
    uint64_t v12 = v11;
    if (v11)
    {
      uint64_t v13 = [v11 identifier];

      v10 = (void *)v13;
    }
  }
  if (UIKeyboardAlwaysShowCandidateBarForInputMode())
  {
    if (([v5 disableInputBars] & 1) == 0)
    {
      int v14 = [v5 hidePrediction] ^ 1;
      goto LABEL_28;
    }
LABEL_27:
    LOBYTE(v14) = 0;
    goto LABEL_28;
  }
  if ([v5 autocorrectionType] == 1)
  {
    double v15 = +[UIKeyboardImpl activeInstance];
    BOOL v16 = [v15 autocorrectionPreferenceForTraits] != 2;
  }
  else
  {
    BOOL v16 = 0;
  }
  if ([v5 disablePrediction] & 1) != 0 || (objc_msgSend(v5, "hidePrediction")) {
    goto LABEL_27;
  }
  BOOL v17 = +[UIKeyboardImpl activeInstance];
  if (([v17 disableInputBars] | v16) == 1)
  {

    goto LABEL_27;
  }
  char v18 = [v5 isSecureTextEntry];

  if (v18) {
    goto LABEL_27;
  }
  v26[0] = v10;
  double v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
  if (UIKeyboardPredictionEnabledForInputModes(v20))
  {
    double v21 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v22 = [v21 preferencesActions];
    LOBYTE(v14) = [v22 predictionEnabled];
  }
  else
  {
    LOBYTE(v14) = 0;
  }

LABEL_28:
  return v14;
}

+ (CGSize)sizeForInterfaceOrientation:(int64_t)a3 includingAssistantBar:(BOOL)a4 ignoreInputView:(BOOL)a5
{
  BOOL v5 = a4;
  +[UIKeyboardImpl sizeForInterfaceOrientation:a3 ignoreInputView:a5];
  double v8 = v7;
  double v10 = v9;
  double v11 = +[UIKeyboardInputModeController sharedInputModeController];
  uint64_t v12 = [v11 currentInputMode];

  +[UIKeyboardImpl deviceSpecificPaddingForInterfaceOrientation:a3 inputMode:v12];
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  +[UIKeyboardImpl deviceSpecificStaticHitBufferForInterfaceOrientation:a3 inputMode:v12];
  double v22 = v21;
  double v24 = v23;
  double v27 = v10 + v14 - v25 + v18 - v26;
  if (v5)
  {
    double v28 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v29 = [v28 systemInputAssistantViewController];
    double v30 = v29;
    if (v29) {
      double v31 = v29;
    }
    else {
      double v31 = objc_alloc_init(UISystemInputAssistantViewController);
    }
    double v32 = v31;

    double v33 = [(UIViewController *)v32 traitCollection];
    v34 = v33;
    if (v33)
    {
      id v35 = v33;
    }
    else
    {
      int v36 = [v28 containerWindow];
      id v35 = [v36 traitCollection];
    }
    [(UISystemInputAssistantViewController *)v32 preferredHeightForTraitCollection:v35 orientation:a3];
    double v27 = v27 + v37;
  }
  double v38 = v8 + v16 - v22 + v20 - v24;
  double v39 = v27;
  result.CGFloat height = v39;
  result.CGFloat width = v38;
  return result;
}

+ (CGSize)keyboardSizeForInterfaceOrientation:(int64_t)a3
{
  +[UIKeyboardImpl keyboardSizeForInterfaceOrientation:a3];
  result.CGFloat height = v4;
  result.CGFloat width = v3;
  return result;
}

- (BOOL)_isAutomaticKeyboard
{
  return 0;
}

- (void)willMoveToWindow:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(UIKeyboard *)self window];
  id v6 = [v5 screen];
  double v7 = [v4 screen];

  if (v6 != v7)
  {
    [(UIKeyboard *)self clearActivePerScreenIfNeeded];
  }
}

- (void)didMoveToWindow
{
  double v3 = (UIKeyboard *)activeKeyboard;
  id v4 = [(UIKeyboard *)self window];

  if (!v4)
  {
    self->m_hasExplicitOrientation = 0;
    if (v3 != self) {
      goto LABEL_14;
    }
    double v14 = +[UIKeyboardImpl activeInstance];
    [v14 clearExcessKeyboardMemory];

    goto LABEL_12;
  }
  BOOL v5 = +[UIPeripheralHost sharedInstance];
  id v6 = [v5 containerWindow];
  [v6 orderFront:0];

  double v7 = [(UIView *)self subviews];
  double v8 = +[UIKeyboardImpl activeInstance];
  char v9 = [v7 containsObject:v8];

  if ((v9 & 1) == 0) {
    [(UIKeyboard *)self activate];
  }
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1
    && !+[UIDevice _hasHomeButton]
    && self->m_minimized)
  {
    +[UIKeyboardImpl additionalInstanceHeight];
    double v11 = v10;
    uint64_t v12 = +[UIKeyboardImpl activeInstance];
    double v13 = [v12 _layout];
    objc_msgSend(v13, "setFrameOrigin:", 0.0, v11);
  }
  if (v3 == self)
  {
LABEL_12:
    double v15 = [(UIKeyboard *)self window];

    if (v15)
    {
      double v16 = objc_opt_class();
      double v17 = [(UIKeyboard *)self window];
      double v18 = [v17 screen];
      [v16 makeKeyboardActive:self forScreen:v18];
    }
  }
LABEL_14:
  [(UIKeyboard *)self setupKeyFocusGuides];
}

- (CGSize)intrinsicContentSize
{
  BOOL v3 = +[UIKeyboard resizable];
  double width = -1.0;
  double height = -1.0;
  if (!v3)
  {
    id v6 = +[UIKeyboardPreferencesController sharedPreferencesController];
    double v7 = [v6 preferencesActions];
    int v8 = [v7 currentInputModeSupportsCrescendo];

    if (v8)
    {
      double width = self->_preferredSize.width;
      double height = self->_preferredSize.height;
    }
    else
    {
      [(UIView *)self bounds];
      double width = v9;
      double height = v10;
    }
  }
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(UIView *)self bounds];
  if (v9 == width && v8 == height) {
    goto LABEL_8;
  }
  double v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v12 = [v11 preferencesActions];
  if ([v12 currentInputModeSupportsCrescendo])
  {

LABEL_8:
    v20.receiver = self;
    v20.super_class = (Class)UIKeyboard;
    -[UIView setBounds:](&v20, sel_setBounds_, x, y, width, height);
    return;
  }
  BOOL v13 = +[UIKeyboard resizable];

  if (v13) {
    goto LABEL_8;
  }
  double v14 = +[UIKeyboardImpl activeInstance];
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
    || ([v14 textInputTraits],
        double v15 = objc_claimAutoreleasedReturnValue(),
        uint64_t v16 = [v15 keyboardType],
        v15,
        v16 != 127))
  {
    [(UIKeyboard *)self autoAdjustOrientation];
    self->m_hasExplicitOrientation = 0;
    +[UIKeyboardImpl sizeForInterfaceOrientation:self->m_orientation ignoreInputView:1];
    double width = v17;
    double height = v18;
  }
  v19.receiver = self;
  v19.super_class = (Class)UIKeyboard;
  -[UIView setBounds:](&v19, sel_setBounds_, x, y, width, height);
  if (!self->m_respondingToImplGeometryChange) {
    [(UIKeyboard *)self activate];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)layoutSubviews
{
  v2.receiver = self;
  v2.super_class = (Class)UIKeyboard;
  [(UIView *)&v2 layoutSubviews];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  self->_preferredSize.double width = a3.size.width;
  self->_preferredSize.double height = a3.size.height;
  [(UIView *)self bounds];
  if (v9 == width && v8 == height) {
    goto LABEL_8;
  }
  double v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
  uint64_t v12 = [v11 preferencesActions];
  if ([v12 currentInputModeSupportsCrescendo])
  {

LABEL_8:
    v17.receiver = self;
    v17.super_class = (Class)UIKeyboard;
    -[UIView setFrame:](&v17, sel_setFrame_, x, y, width, height);
    return;
  }
  BOOL v13 = +[UIKeyboard resizable];

  if (v13) {
    goto LABEL_8;
  }
  [(UIKeyboard *)self autoAdjustOrientation];
  self->m_hasExplicitOrientation = 0;
  +[UIKeyboardImpl sizeForInterfaceOrientation:self->m_orientation ignoreInputView:1];
  v16.receiver = self;
  v16.super_class = (Class)UIKeyboard;
  -[UIView setFrame:](&v16, sel_setFrame_, x, y, v14, v15);
  if (!self->m_respondingToImplGeometryChange
    && ([(UIKeyboard *)self isAutomatic]
     || (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) != 1
     || [(id)UIApp _isSpringBoard]))
  {
    [(UIKeyboard *)self activate];
  }
  [(UIView *)self invalidateIntrinsicContentSize];
}

- (void)updateLayout
{
  [(UIKeyboard *)self activate];
  objc_super v2 = +[UIKeyboardInputModeController sharedInputModeController];
  id v6 = [v2 currentInputMode];

  if (([v6 isExtensionInputMode] & 1) == 0)
  {
    BOOL v3 = [v6 normalizedIdentifier];
    char v4 = [v3 isEqualToString:@"emoji"];

    if ((v4 & 1) == 0)
    {
      BOOL v5 = +[UIKeyboardImpl sharedInstance];
      [v5 updateLayout];
    }
  }
}

- (int64_t)interfaceOrientation
{
  return self->m_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->m_orientation = a3;
  self->m_hasExplicitOrientation = 1;
}

+ (void)setResizable:(BOOL)a3
{
  __resizable = a3;
}

+ (BOOL)resizable
{
  return __resizable;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (self->m_typingDisabled)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIKeyboard;
    if (-[UIView pointInside:withEvent:](&v18, sel_pointInside_withEvent_, v7, x, y))
    {
      double v8 = self;
      goto LABEL_9;
    }
  }
  double v9 = +[UIKeyboardImpl sharedInstance];
  double v10 = [v9 candidateController];
  double v11 = [v10 candidateBar];

  uint64_t v12 = [v11 window];
  BOOL v13 = [(UIKeyboard *)self window];
  if (v12 == v13 && ([v11 isHidden] & 1) == 0)
  {
    BOOL v16 = -[UIKeyboard pointInside:forEvent:](self, "pointInside:forEvent:", [v7 _gsEvent], x, y);

    if (!v16)
    {
      -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
      uint64_t v14 = objc_msgSend(v11, "hitTest:withEvent:", v7);
      goto LABEL_8;
    }
  }
  else
  {
  }
  v17.receiver = self;
  v17.super_class = (Class)UIKeyboard;
  uint64_t v14 = -[UIView hitTest:withEvent:](&v17, sel_hitTest_withEvent_, v7, x, y);
LABEL_8:
  double v8 = (UIKeyboard *)v14;

LABEL_9:
  return v8;
}

- (BOOL)pointInside:(CGPoint)a3 forEvent:(__GSEvent *)a4
{
  double y = a3.y;
  double x = a3.x;
  double v8 = +[UIKeyboardImpl sharedInstance];
  double v9 = [v8 superview];
  if (v9 == self)
  {
    -[UIView convertPoint:toView:](self, "convertPoint:toView:", v8, x, y);
    char v10 = objc_msgSend(v8, "pointInside:forEvent:", a4);
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  id v7 = a4;
  if (!-[UIKeyboard pointInside:forEvent:](self, "pointInside:forEvent:", [v7 _gsEvent], x, y))
  {
    double v9 = +[UIKeyboardImpl sharedInstance];
    char v10 = [v9 candidateController];
    double v11 = [v10 candidateBar];

    uint64_t v12 = [v11 window];
    BOOL v13 = [(UIKeyboard *)self window];
    if (v12 == v13 && ([v11 isHiddenOrHasHiddenAncestor] & 1) == 0)
    {
      BOOL HasAlphaHittable = -[UIView _isAlphaHittableAndHasAlphaHittableAncestors]((uint64_t)v11);

      if (HasAlphaHittable)
      {
        -[UIView convertPoint:toView:](self, "convertPoint:toView:", v11, x, y);
        char v8 = objc_msgSend(v11, "pointInside:withEvent:", v7);
        goto LABEL_7;
      }
    }
    else
    {
    }
    char v8 = 0;
LABEL_7:

    goto LABEL_8;
  }
  char v8 = 1;
LABEL_8:

  return v8;
}

- (BOOL)_touchesInsideShouldHideCalloutBar
{
  return 0;
}

- (void)prepareForGeometryChange
{
  [(UIKeyboard *)self activate];
  id v2 = +[UIKeyboardImpl sharedInstance];
  [v2 prepareForGeometryChange];
}

- (void)geometryChangeDone:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(UIKeyboard *)self activate];
  }
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 geometryChangeDone:v3];
}

- (void)removeAutocorrectPrompt
{
  [(UIKeyboard *)self activate];
  id v2 = +[UIKeyboardImpl sharedInstance];
  [v2 removeAutocorrectPromptAndCandidateList];
}

- (void)acceptAutocorrection
{
  [(UIKeyboard *)self activate];
  id v5 = +[UIKeyboardImpl sharedInstance];
  id v2 = [v5 textInputTraits];
  uint64_t v3 = [v2 keyboardType];

  if (v3 == 126)
  {
    id v4 = +[UIDictationController sharedInstance];
    [v4 stopDictationIgnoreFinalizePhrases];
  }
  [v5 acceptAutocorrection];
}

- (void)acceptAutocorrectionWithCompletionHandler:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(UIKeyboard *)self activate];
  id v5 = +[UIKeyboardImpl sharedInstance];
  id v6 = [v5 textInputTraits];
  uint64_t v7 = [v6 keyboardType];

  if (v7 == 126)
  {
    char v8 = +[UIDictationController sharedInstance];
    [v8 stopDictationIgnoreFinalizePhrases];

    +[UITextChecker performFinalGrammarChecking];
  }
  double v9 = _UIKeyboardLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v14 = "-[UIKeyboard acceptAutocorrectionWithCompletionHandler:]";
    _os_log_impl(&dword_1853B0000, v9, OS_LOG_TYPE_DEFAULT, "%s Initiating accept autocorrection", buf, 0xCu);
  }

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__UIKeyboard_acceptAutocorrectionWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E52D9FE8;
  id v12 = v4;
  id v10 = v4;
  [v5 acceptAutocorrectionWithCompletionHandler:v11];
}

uint64_t __56__UIKeyboard_acceptAutocorrectionWithCompletionHandler___block_invoke(uint64_t result)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (*(void *)(result + 32))
  {
    uint64_t v1 = result;
    id v2 = _UIKeyboardLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 136315138;
      id v4 = "-[UIKeyboard acceptAutocorrectionWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "%s Completed accept autocorrection", (uint8_t *)&v3, 0xCu);
    }

    return (*(uint64_t (**)(void))(*(void *)(v1 + 32) + 16))();
  }
  return result;
}

- (BOOL)hasAutocorrectPrompt
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  int v3 = [v2 autocorrectPrompt];
  BOOL v4 = v3 != 0;

  return v4;
}

- (UITextCursorAssertionController)_activeAssertionController
{
  [(UIKeyboard *)self activate];
  id v2 = +[UIKeyboardImpl sharedInstance];
  int v3 = [v2 _activeAssertionController];

  return (UITextCursorAssertionController *)v3;
}

- (void)setCaretBlinks:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIKeyboard *)self activate];
  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 setCaretBlinks:v3];
}

- (BOOL)caretBlinks
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  char v3 = [v2 caretBlinks];

  return v3;
}

- (void)setCaretVisible:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIKeyboard *)self activate];
  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 setCaretVisible:v3];
}

- (BOOL)caretVisible
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  char v3 = [v2 caretVisible];

  return v3;
}

- (BOOL)returnKeyEnabled
{
  [(UIKeyboard *)self activateIfNeeded];
  id v2 = +[UIKeyboardImpl sharedInstance];
  char v3 = [v2 returnKeyEnabled];

  return v3;
}

- (void)setReturnKeyEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(UIKeyboard *)self activateIfNeeded];
  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 setReturnKeyEnabled:v3];
}

- (id)defaultTextInputTraits
{
  [(UIKeyboard *)self activate];
  m_defaultTraits = self->m_defaultTraits;
  if (!m_defaultTraits)
  {
    id v4 = objc_alloc_init(UITextInputTraits);
    uint64_t v5 = self->m_defaultTraits;
    self->m_defaultTraits = v4;

    m_defaultTraits = self->m_defaultTraits;
  }
  return m_defaultTraits;
}

- (void)setDefaultTextInputTraits:(id)a3
{
  id v4 = (UITextInputTraits *)a3;
  [(UIKeyboard *)self activate];
  m_defaultTraits = self->m_defaultTraits;
  self->m_defaultTraits = v4;
  id v6 = v4;

  id v7 = +[UIKeyboardImpl sharedInstance];
  [v7 setDefaultTextInputTraits:self->m_defaultTraits];
}

- (id)_overrideTextInputTraits
{
  return self->m_overrideTraits;
}

- (void)set_overrideTextInputTraits:(id)a3
{
  id v7 = (UITextInputTraits *)a3;
  [(UIKeyboard *)self activate];
  p_m_overrideTraits = &self->m_overrideTraits;
  if (*p_m_overrideTraits != v7)
  {
    objc_storeStrong((id *)p_m_overrideTraits, a3);
    id v6 = +[UIKeyboardImpl sharedInstance];
    [v6 setOverrideTextInputTraits:*p_m_overrideTraits];
  }
}

- (id)delegate
{
  [(UIKeyboard *)self activate];
  id v2 = +[UIKeyboardImpl sharedInstance];
  BOOL v3 = [v2 delegate];

  return v3;
}

- (void)clearSnapshot
{
  [(UIView *)self->m_snapshot removeFromSuperview];
  m_snapshot = self->m_snapshot;
  self->m_snapshot = 0;
}

- (void)takeSnapshot
{
  if (([(id)objc_opt_class() isSpotlight] & 1) == 0)
  {
    [(UIKeyboard *)self clearSnapshot];
    id v5 = +[UIKeyboardImpl sharedInstance];
    BOOL v3 = [v5 snapshotViewAfterScreenUpdates:0];
    m_snapshot = self->m_snapshot;
    self->m_snapshot = v3;

    [(UIView *)self insertSubview:self->m_snapshot atIndex:0];
    [(UIKeyboard *)self setNeedsDisplay];
  }
}

- (BOOL)typingEnabled
{
  return !self->m_typingDisabled;
}

- (void)setTypingEnabled:(BOOL)a3
{
  self->m_typingDisabled = !a3;
}

- (void)activateIfNeeded
{
  if ((UIKeyboard *)activeKeyboard != self) {
    [(UIKeyboard *)self activate];
  }
}

- (void)activate
{
  v58[4] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(UIView *)self superview];

  if (v3)
  {
    if ((UIKeyboard *)activeKeyboard == self)
    {
      uint64_t v24 = +[UIKeyboardImpl activeInstance];
      if (v24)
      {
        double v9 = (UIKeyboard *)v24;
        double v25 = [(UIView *)self traitCollection];
        if ([v25 userInterfaceIdiom] == 3)
        {
          unint64_t v26 = [(UIKeyboard *)self requestedInteractionModel];

          if (v26) {
            [(UIKeyboard *)v9 setRequestedInteractionModel:[(UIKeyboard *)self requestedInteractionModel]];
          }
        }
        else
        {
        }
        [(UIKeyboard *)v9 setGeometryDelegate:self];
        double v27 = [(UIView *)v9 superview];
        if (v27) {
          double v28 = self;
        }
        else {
          double v28 = v9;
        }
        [(UIView *)v28 bounds];
        double v30 = v29;
        double v32 = v31;

        [(UIKeyboard *)self autoAdjustOrientation];
        [(UIKeyboard *)v9 setShouldUpdateLayoutAutomatically:[(UIKeyboard *)self shouldUpdateLayoutAutomatically]];
        -[UIKeyboard setFrame:](v9, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v30, v32);
        double v33 = [(UIView *)v9 superview];

        if (!v33)
        {
          [(UIView *)self addSubview:v9];
          [(UIKeyboard *)v9 setDefaultTextInputTraits:self->m_defaultTraits];
          [(UIKeyboard *)v9 setOverrideTextInputTraits:self->m_overrideTraits];
          if (self->_implConstraints) {
            objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
          }
          v34 = +[UIKeyboardPreferencesController sharedPreferencesController];
          id v35 = [v34 preferencesActions];
          int v36 = [v35 crescendoEnabled];

          if (v36)
          {
            [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
            id v56 = [(UIView *)v9 topAnchor];
            v53 = [(UIView *)self topAnchor];
            v51 = [v56 constraintEqualToAnchor:v53];
            v58[0] = v51;
            v49 = [(UIView *)v9 leadingAnchor];
            v47 = [(UIView *)self leadingAnchor];
            double v37 = [v49 constraintEqualToAnchor:v47];
            v58[1] = v37;
            double v38 = [(UIView *)self bottomAnchor];
            double v39 = [(UIView *)v9 bottomAnchor];
            v40 = [v38 constraintEqualToAnchor:v39];
            v58[2] = v40;
            v41 = [(UIView *)self trailingAnchor];
            v42 = [(UIView *)v9 trailingAnchor];
            v43 = [v41 constraintEqualToAnchor:v42];
            v58[3] = v43;
            v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
            implConstraints = self->_implConstraints;
            self->_implConstraints = v44;

            [MEMORY[0x1E4F5B268] activateConstraints:self->_implConstraints];
          }
        }
        [(UIKeyboard *)self setupKeyFocusGuides];
        [(UIKeyboard *)self clearSnapshot];
        [(UIKeyboard *)self setNeedsDisplay];
        goto LABEL_40;
      }
    }
    else
    {
      [(id)activeKeyboard takeSnapshot];
    }
    [(UIKeyboard *)self clearSnapshot];
    if (([(id)activeKeyboard isAutomatic] & 1) == 0 && -[UIKeyboard isAutomatic](self, "isAutomatic")) {
      [(id)activeKeyboard removeFromSuperview];
    }
    objc_storeStrong((id *)&activeKeyboard, self);
    id v4 = [(UIKeyboard *)self window];

    if (v4)
    {
      id v5 = objc_opt_class();
      id v6 = [(UIKeyboard *)self window];
      id v7 = [v6 screen];
      [v5 makeKeyboardActive:self forScreen:v7];
    }
    char v8 = +[UIKeyboardImpl activeInstance];
    -[UIView setOpaque:](self, "setOpaque:", [v8 keyboardDrawsOpaque]);

    double v9 = +[UIKeyboardImpl sharedInstance];
    [(UIKeyboard *)v9 setGeometryDelegate:self];
    [(UIView *)v9 removeFromSuperview];
    [(UIView *)self bounds];
    -[UIKeyboard setFrame:](v9, "setFrame:");
    [(UIView *)self addSubview:v9];
    if (self->_implConstraints)
    {
      objc_msgSend(MEMORY[0x1E4F5B268], "deactivateConstraints:");
      id v10 = self->_implConstraints;
      self->_implConstraints = 0;
    }
    double v11 = +[UIKeyboardPreferencesController sharedPreferencesController];
    id v12 = [v11 preferencesActions];
    if ([v12 crescendoEnabled])
    {
    }
    else
    {
      BOOL v14 = +[UIKeyboard resizable];

      if (!v14)
      {
        [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:1];
        goto LABEL_29;
      }
    }
    [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    id v55 = [(UIView *)v9 topAnchor];
    v52 = [(UIView *)self topAnchor];
    v50 = [v55 constraintEqualToAnchor:v52];
    v57[0] = v50;
    v48 = [(UIView *)v9 leadingAnchor];
    v46 = [(UIView *)self leadingAnchor];
    uint64_t v15 = [v48 constraintEqualToAnchor:v46];
    v57[1] = v15;
    BOOL v16 = [(UIView *)self bottomAnchor];
    objc_super v17 = [(UIView *)v9 bottomAnchor];
    objc_super v18 = [v16 constraintEqualToAnchor:v17];
    v57[2] = v18;
    objc_super v19 = [(UIView *)self trailingAnchor];
    objc_super v20 = [(UIView *)v9 trailingAnchor];
    double v21 = [v19 constraintEqualToAnchor:v20];
    v57[3] = v21;
    double v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v57 count:4];
    double v23 = self->_implConstraints;
    self->_implConstraints = v22;

    [MEMORY[0x1E4F5B268] activateConstraints:self->_implConstraints];
LABEL_29:
    [(UIKeyboard *)self setupKeyFocusGuides];
    [(UIKeyboard *)v9 setDefaultTextInputTraits:self->m_defaultTraits];
    [(UIKeyboard *)v9 setOverrideTextInputTraits:self->m_overrideTraits];
LABEL_40:

    return;
  }
  if (+[UIKeyboard usesInputSystemUI]) {
    BOOL v13 = activeKeyboard == (void)self;
  }
  else {
    BOOL v13 = 0;
  }
  if (v13 && [(UITextInputTraits *)self->m_overrideTraits forceFloatingKeyboard])
  {
    id v54 = +[UIKeyboardImpl activeInstance];
    [v54 setOverrideTextInputTraits:self->m_overrideTraits];
  }
}

- (BOOL)isActive
{
  return activeKeyboard == (void)self;
}

- (BOOL)isAutomatic
{
  return 0;
}

- (void)deactivate
{
  if ((UIKeyboard *)activeKeyboard == self)
  {
    BOOL v3 = [(UIView *)self superview];

    if (v3)
    {
      [(UIKeyboard *)self takeSnapshot];
      [(UIKeyboard *)self setNeedsDisplay];
    }
    id v6 = +[UIKeyboardImpl activeInstance];
    id v4 = [v6 superview];

    if (v4)
    {
      [v6 removeFromSuperview];
      [v6 setDefaultTextInputTraits:0];
      [v6 setOverrideTextInputTraits:0];
    }
    [v6 setGeometryDelegate:0];
    id v5 = (void *)activeKeyboard;
    activeKeyboard = 0;

    [(UIKeyboard *)self setupKeyFocusGuides];
  }
}

- (void)_deactivateForBackgrounding
{
  if ((UIKeyboard *)activeKeyboard == self)
  {
    BOOL v3 = [(UIView *)self superview];

    if (v3)
    {
      [(UIKeyboard *)self takeSnapshot];
      [(UIKeyboard *)self setNeedsDisplay];
    }
    id v5 = +[UIKeyboardImpl activeInstance];
    id v4 = [v5 superview];

    if (v4) {
      [v5 removeFromSuperview];
    }
  }
}

- (void)setNeedsDisplay
{
  id v2 = [(UIView *)self layer];
  [v2 setNeedsDisplay];
}

- (void)displayLayer:(id)a3
{
  if ((UIKeyboard *)activeKeyboard == self)
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    if (v4)
    {
    }
    else if ([(id)UIApp applicationState] != 2)
    {
      [(UIKeyboard *)self activate];
    }
  }
}

- (int)textEffectsVisibilityLevel
{
  return 10;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 updateIdleDetection:0];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 updateIdleDetection:0];
}

- (BOOL)canHandleEvent:(id)a3
{
  return [(UIKeyboard *)self canHandlePresses:0 withEvent:a3];
}

- (BOOL)canHandlePresses:(id)a3 withEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = +[UIKeyboardImpl activeInstance];
  char v8 = [v7 canHandlePresses:v6 withEvent:v5];

  return v8;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboard *)self canHandlePresses:v6 withEvent:v7])
  {
    char v8 = +[UIKeyboardImpl activeInstance];
    double v9 = [v8 _layout];
    [v9 pressesBegan:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    [(UIResponder *)&v10 pressesBegan:v6 withEvent:v7];
  }
}

- (void)pressesChanged:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboard *)self canHandlePresses:v6 withEvent:v7])
  {
    char v8 = +[UIKeyboardImpl activeInstance];
    double v9 = [v8 _layout];
    [v9 pressesChanged:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    [(UIResponder *)&v10 pressesChanged:v6 withEvent:v7];
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboard *)self canHandlePresses:v6 withEvent:v7])
  {
    char v8 = +[UIKeyboardImpl activeInstance];
    double v9 = [v8 _layout];
    [v9 pressesEnded:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    [(UIResponder *)&v10 pressesEnded:v6 withEvent:v7];
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(UIKeyboard *)self canHandlePresses:v6 withEvent:v7])
  {
    char v8 = +[UIKeyboardImpl activeInstance];
    double v9 = [v8 _layout];
    [v9 pressesCancelled:v6 withEvent:v7];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKeyboard;
    [(UIResponder *)&v10 pressesCancelled:v6 withEvent:v7];
  }
}

- (void)remoteControlReceivedWithEvent:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 remoteControlReceivedWithEvent:v3];
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([(UIView *)self isFocused])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    [v5 _wheelChangedWithEvent:v4];
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKeyboard;
    [(UIResponder *)&v6 _wheelChangedWithEvent:v4];
  }
}

- (BOOL)canBecomeFocused
{
  id v3 = [(UIView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if (v4 == 3)
  {
    if (![(UIKeyboard *)self requestedInteractionModel])
    {
      objc_super v6 = [(UIView *)self traitCollection];
      BOOL v5 = [v6 primaryInteractionModel] != 1;

      return v5;
    }
    if ([(UIKeyboard *)self requestedInteractionModel] != 2) {
      return [(UIKeyboard *)self requestedInteractionModel] == 8;
    }
  }
  return 1;
}

- (id)_systemDefaultFocusGroupIdentifier
{
  id v3 = [(UIView *)self _focusBehavior];
  __int16 v4 = [v3 focusGroupContainmentBehavior];

  if ((v4 & 0x100) != 0)
  {
    BOOL v5 = _UIFocusGroupIdentifierForInstance(self);
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKeyboard;
    BOOL v5 = [(UIView *)&v7 _systemDefaultFocusGroupIdentifier];
  }
  return v5;
}

- (int64_t)_focusTouchSensitivityStyle
{
  return 2;
}

- (int64_t)_rotaryFocusMovementAxis
{
  return 3;
}

- (int64_t)_focusedSound
{
  return 4;
}

- (void)setImpendingCursorLocation:(unint64_t)a3
{
  self->_impendingCursorLocation = a3;
  [(UIKeyboard *)self setHasImpendingCursorLocation:1];
}

- (CGRect)_focusCastingFrameForHeading:(unint64_t)a3 inCoordinateSpace:(id)a4
{
  id v4 = a4;
  BOOL v5 = +[UIKeyboardImpl sharedInstance];
  objc_super v6 = [v5 currentKey];

  if (v6 && [v6 state] != 16)
  {
    double v11 = +[UIKeyboardImpl sharedInstance];
    [v6 frame];
    objc_msgSend(v11, "convertRect:toCoordinateSpace:", v4);
    double v7 = v12;
    double v8 = v13;
    double v9 = v14;
    double v10 = v15;
  }
  else
  {
    double v7 = *MEMORY[0x1E4F1DB20];
    double v8 = *(double *)(MEMORY[0x1E4F1DB20] + 8);
    double v9 = *(double *)(MEMORY[0x1E4F1DB20] + 16);
    double v10 = *(double *)(MEMORY[0x1E4F1DB20] + 24);
  }

  double v16 = v7;
  double v17 = v8;
  double v18 = v9;
  double v19 = v10;
  result.size.double height = v19;
  result.size.double width = v18;
  result.origin.double y = v17;
  result.origin.double x = v16;
  return result;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UIKeyboard;
  [(UIView *)&v8 didUpdateFocusInContext:a3 withAnimationCoordinator:a4];
  if ([(UIKeyboard *)self hasImpendingCursorLocation])
  {
    [(UIKeyboard *)self setCursorLocation:[(UIKeyboard *)self impendingCursorLocation]];
    [(UIKeyboard *)self setHasImpendingCursorLocation:0];
LABEL_7:
    [(UIKeyboard *)self updateFocusMarginsUpToView:0];
    goto LABEL_8;
  }
  if (![(UIView *)self isFocused] && [(UIKeyboard *)self cursorLocation])
  {
    [(UIKeyboard *)self updateFocusMarginsUpToView:0];
    uint64_t v5 = 0;
LABEL_12:
    [(UIKeyboard *)self setCursorLocation:v5];
    goto LABEL_13;
  }
  if ([(UIView *)self isFocused]) {
    goto LABEL_7;
  }
  objc_super v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  [(UIKeyboard *)self updateFocusMarginsUpToView:0];
  uint64_t v5 = 0;
  if (v7 == 3) {
    goto LABEL_12;
  }
LABEL_8:
  if ([(UIView *)self isFocused] && ![(UIKeyboard *)self cursorLocation])
  {
    uint64_t v5 = 2;
    goto LABEL_12;
  }
LABEL_13:
  if ([(UIView *)self isFocused] && [(UIKeyboard *)self disableInteraction]) {
    [(UIKeyboard *)self setDisableInteraction:0];
  }
  [(UIKeyboard *)self updateKeyFocusGuides];
}

- (BOOL)allowExternalChangeForFocusHeading:(unint64_t)a3 cursorLocation:(unint64_t)a4
{
  if (a3 == 1 && (a4 & 8) != 0)
  {
    char v4 = 1;
  }
  else
  {
    int64x2_t v5 = vdupq_n_s64(a3);
    int8x16_t v6 = (int8x16_t)vdupq_n_s64(a4);
    char v4 = vmaxv_u16((uint16x4_t)vmovn_s32((int32x4_t)vbicq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_s64(v5, (int64x2_t)xmmword_186B94020), (int32x4_t)vceqq_s64(v5, (int64x2_t)xmmword_186B9A990)), (int8x16_t)vuzp1q_s32((int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v6, (int8x16_t)xmmword_186B9A9A0)), (int32x4_t)vceqzq_s64((int64x2_t)vandq_s8(v6, (int8x16_t)xmmword_186B9A9B0)))))) | (a3 == 32) & a4;
  }
  return v4 & 1;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  int64x2_t v5 = [v4 nextFocusedItem];
  uint64_t v6 = [v4 focusHeading];

  if (![(UIView *)self isFocused] || ![(UIKeyboard *)self canBecomeFocused])
  {
    if (v5 == self)
    {
      double v16 = self;
      uint64_t v17 = 2;
      goto LABEL_20;
    }
LABEL_18:
    double v16 = self;
    uint64_t v17 = 0;
LABEL_20:
    [(UIKeyboard *)v16 setImpendingCursorLocation:v17];
LABEL_21:
    char v8 = 1;
    goto LABEL_22;
  }
  unint64_t v7 = [(UIKeyboard *)self cursorLocation];
  char v8 = v5 == self;
  if (!v7)
  {
    if (v5 == self)
    {
      char v8 = 1;
      [(UIKeyboard *)self setImpendingCursorLocation:1];
      goto LABEL_22;
    }
    goto LABEL_24;
  }
  char v9 = v7;
  BOOL v10 = [(UIKeyboard *)self allowExternalChangeForFocusHeading:v6 cursorLocation:v7];
  BOOL v11 = (v9 & 0x80) == 0 && v10;
  BOOL v12 = v5 == self && v10;
  BOOL v13 = v5 != self && v11;
  double v14 = [(UIView *)self traitCollection];
  uint64_t v15 = [v14 userInterfaceIdiom];

  if (v15 == 3)
  {
    if ((v9 & 0x20) != 0 && v6 == 4 || (v9 & 0x40) != 0 && v6 == 8)
    {
      char v8 = 0;
      goto LABEL_22;
    }
    if (!v13)
    {
      [(UIKeyboard *)self setHasImpendingCursorLocation:0];
      goto LABEL_22;
    }
    goto LABEL_18;
  }
  if (v15 != 2)
  {
LABEL_24:
    [(UIKeyboard *)self setHasImpendingCursorLocation:0];
    goto LABEL_21;
  }
  if (v13) {
    [(UIKeyboard *)self setImpendingCursorLocation:0];
  }
  else {
    [(UIKeyboard *)self setHasImpendingCursorLocation:0];
  }
  char v8 = !v12;
LABEL_22:

  return v8;
}

- (unint64_t)cursorLocation
{
  id v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 _layout];
  unint64_t v4 = [v3 cursorLocation];

  return v4;
}

- (void)setCursorLocation:(unint64_t)a3
{
  id v5 = +[UIKeyboardImpl activeInstance];
  unint64_t v4 = [v5 _layout];
  [v4 setCursorLocation:a3];
}

- (void)setupKeyFocusGuides
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v3 = [(UIView *)self focusGuides];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v3);
        }
        char v8 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        char v9 = [v8 owningView];
        [v9 removeLayoutGuide:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v5);
  }

  [(NSMutableDictionary *)self->m_focusGuides removeAllObjects];
  if ([(UIKeyboard *)self isActive] && [(UIKeyboard *)self canBecomeFocused])
  {
    if (!self->m_focusGuides)
    {
      BOOL v10 = (NSMutableDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:4];
      m_focusGuides = self->m_focusGuides;
      self->m_focusGuides = v10;

      *(_OWORD *)&self->m_unfocusedFocusGuideOutsets.top = 0u;
      *(_OWORD *)&self->m_unfocusedFocusGuideOutsets.bottom = 0u;
    }
    BOOL v12 = [(UIView *)self traitCollection];
    uint64_t v13 = [v12 userInterfaceIdiom];

    double v14 = &unk_1ED3F0850;
    if (v13 != 3) {
      double v14 = 0;
    }
    if (v13 == 2) {
      uint64_t v15 = &unk_1ED3F0838;
    }
    else {
      uint64_t v15 = v14;
    }
    uint64_t v16 = [(id)UIApp userInterfaceLayoutDirection];
    if ([v15 count])
    {
      unint64_t v17 = 0;
      uint64_t v18 = 32;
      if (v16 == 1) {
        uint64_t v19 = 16;
      }
      else {
        uint64_t v19 = 32;
      }
      if (v16 != 1) {
        uint64_t v18 = 16;
      }
      uint64_t v31 = v18;
      uint64_t v32 = v19;
      do
      {
        objc_super v20 = objc_msgSend(v15, "objectAtIndex:", v17, v31);
        uint64_t v21 = [v20 integerValue];

        double v22 = objc_alloc_init(UIKBFocusGuide);
        [(UIKBFocusGuide *)v22 setKeyboardDelegate:self];
        double v37 = self;
        double v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
        [(UIFocusGuide *)v22 setPreferredFocusEnvironments:v23];

        [(UIKBFocusGuide *)v22 setFocusHeading:v21];
        [(UIView *)self bounds];
        switch(v21)
        {
          case 1:
            double v27 = 60.0;
            double v25 = -60.0;
            break;
          case 4:
            goto LABEL_30;
          case 2:
            double v25 = v27;
            double v27 = 60.0;
            break;
          default:
            if (v21 != v32)
            {
              if (v21 == 8 || v21 == v31)
              {
                double v24 = v26;
                double v26 = 60.0;
              }
              break;
            }
LABEL_30:
            double v26 = 60.0;
            double v24 = -60.0;
            break;
        }
        -[UILayoutGuide _setManualLayoutFrame:](v22, "_setManualLayoutFrame:", v24, v25, v26, v27);
        [(UIView *)self addLayoutGuide:v22];
        double v29 = self->m_focusGuides;
        double v30 = [NSNumber numberWithUnsignedInteger:v21];
        [(NSMutableDictionary *)v29 setObject:v22 forKey:v30];

        ++v17;
      }
      while (v17 < [v15 count]);
    }
    [(UIKeyboard *)self updateKeyFocusGuides];
  }
}

- (void)updateKeyFocusGuides
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(NSMutableDictionary *)self->m_focusGuides count])
  {
    unint64_t v3 = [(UIKeyboard *)self cursorLocation];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v4 = [(UIView *)self layoutGuides];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v12;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v12 != v7) {
            objc_enumerationMutation(v4);
          }
          char v9 = *(void **)(*((void *)&v11 + 1) + 8 * v8);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            if ([(UIView *)self isFocused]) {
              uint64_t v10 = -[UIKeyboard allowExternalChangeForFocusHeading:cursorLocation:](self, "allowExternalChangeForFocusHeading:cursorLocation:", [v9 focusHeading], v3) ^ 1;
            }
            else {
              uint64_t v10 = 0;
            }
            [v9 setEnabled:v10];
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v6);
    }
  }
}

- (void)didFocusGuideWithHeading:(unint64_t)a3
{
  id v9 = [(UIEvent *)[UIMoveEvent alloc] _init];
  [v9 _setFocusHeading:a3];
  uint64_t v5 = +[UIKeyboardImpl activeInstance];
  [v5 _moveWithEvent:v9];

  [(UIKeyboard *)self updateKeyFocusGuides];
  uint64_t v6 = [(UIView *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if (v7 == 2)
  {
    uint64_t v8 = +[UIDictationController sharedInstance];
    [v8 updateHelperMessageDisplayIfNeeded];
  }
}

- (UIEdgeInsets)unfocusedFocusGuideOutsets
{
  double top = self->m_unfocusedFocusGuideOutsets.top;
  double left = self->m_unfocusedFocusGuideOutsets.left;
  double bottom = self->m_unfocusedFocusGuideOutsets.bottom;
  double right = self->m_unfocusedFocusGuideOutsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3
{
}

- (void)setUnfocusedFocusGuideOutsets:(UIEdgeInsets)a3 fromView:(id)a4
{
  self->m_unfocusedFocusGuideOutsets = a3;
  [(UIKeyboard *)self updateFocusMarginsUpToView:a4];
}

- (void)updateFocusMarginsUpToView:(id)a3
{
  id v19 = a3;
  [(UIKeyboard *)self unfocusedFocusGuideOutsets];
  if (v7 != 0.0 || v4 != 0.0 || v6 != 0.0 || v5 != 0.0)
  {
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    double v11 = 0.0;
    if (![(UIView *)self isFocused])
    {
      [(UIKeyboard *)self unfocusedFocusGuideOutsets];
      double v11 = v12;
      double v10 = v13;
      double v9 = v14;
      double v8 = v15;
    }
    uint64_t v16 = self;
    unint64_t v17 = [v19 superview];
    do
    {
      uint64_t v18 = v16;
      -[UIView _setFocusableContentMargins:](v16, "_setFocusableContentMargins:", v11, v10, v9, v8);
      uint64_t v16 = [(UIView *)v16 superview];
    }
    while (v16 && v17 && v16 != v17);
  }
}

- (void)_toggleMenuGestureRecognizer:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3 && !self->_menuGestureRecognizer)
  {
    double v5 = [[UITapGestureRecognizer alloc] initWithTarget:self action:0];
    menuGestureRecognizer = self->_menuGestureRecognizer;
    self->_menuGestureRecognizer = v5;

    [(UITapGestureRecognizer *)self->_menuGestureRecognizer setAllowedPressTypes:&unk_1ED3F0868];
    [(UIGestureRecognizer *)self->_menuGestureRecognizer setDelegate:self];
    [(UIView *)self addGestureRecognizer:self->_menuGestureRecognizer];
  }
  double v7 = self->_menuGestureRecognizer;
  [(UIGestureRecognizer *)v7 setEnabled:v3];
}

- (BOOL)disableInteraction
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 _layout];
  char v4 = [v3 disableInteraction];

  return v4;
}

- (void)setDisableInteraction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UIKeyboardImpl activeInstance];
  char v4 = [v5 _layout];
  [v4 setDisableInteraction:v3];
}

- (void)_setPreferredHeight:(double)a3
{
  id v5 = +[UIKeyboardImpl activeInstance];
  char v4 = [v5 _layout];
  [v4 setPreferredHeight:a3];
}

- (BOOL)showPredictionBar
{
  id v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 isPredictionViewControllerVisible];

  return v3;
}

- (void)_showAutofillExtras
{
  char v3 = +[UIKeyboard activeKeyboard];

  if (v3 == self)
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    [v4 _showAutofillExtras];
  }
}

- (void)setShouldUpdateLayoutAutomatically:(BOOL)a3
{
  BOOL v3 = a3;
  self->_shouldUpdateLayoutAutomaticalldouble y = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 setShouldUpdateLayoutAutomatically:v3];
}

+ (void)clearLastKeyboardApplicationIdentifier
{
  id v2 = (void *)qword_1EB25C418;
  qword_1EB25C418 = 0;

  dword_1EB25C410 = 0;
}

+ (id)keyboardApplicationIdentifier
{
  if (([a1 isKeyboardProcess] & 1) == 0)
  {
    double v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2 object:a1 file:@"UIKeyboard.m" lineNumber:1690 description:@"keyboardApplicationIdentifier can only be called from keyboard process"];
  }
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 inputSystemSourceSession];
  double v6 = [v5 documentTraits];

  id v7 = [v6 appId];
  if (v7) {
    goto LABEL_7;
  }
  uint64_t v8 = [v6 bundleId];
  double v9 = (void *)v8;
  double v10 = (void *)qword_1EB25C418;
  if (v8) {
    double v10 = (void *)v8;
  }
  id v7 = v10;

  if (v7) {
LABEL_7:
  }
    objc_storeStrong((id *)&qword_1EB25C418, v7);

  return v7;
}

+ (int)keyboardProcessId
{
  if (([a1 isKeyboardProcess] & 1) == 0)
  {
    double v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:a1 file:@"UIKeyboard.m" lineNumber:1702 description:@"keyboardProcessId can only be called from keyboard process"];
  }
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 inputSystemSourceSession];
  double v6 = [v5 documentTraits];

  int v7 = [v6 processId];
  if (v7) {
    int v8 = v7;
  }
  else {
    int v8 = dword_1EB25C410;
  }
  if (v8) {
    dword_1EB25C410 = v8;
  }

  return v8;
}

+ (BOOL)isSpotlight
{
  id v2 = [a1 keyboardBundleIdentifier];
  char v3 = [v2 isEqualToString:@"com.apple.Spotlight"];

  return v3;
}

+ (id)currentDocumentState
{
  if ([a1 isKeyboardProcess])
  {
    id v2 = +[UIKeyboardImpl activeInstance];
    char v3 = [v2 inputSystemSourceSession];
    id v4 = [v3 documentState];
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

+ (BOOL)usesInputSystemUIForAutoFillOnlyWithRTI
{
  int v2 = [a1 usesInputSystemUIForAutoFillOnly];
  if (v2)
  {
    LOBYTE(v2) = _os_feature_enabled_impl();
  }
  return v2;
}

+ (BOOL)useAutoFillUIRTIInterfaceForIphone
{
  return _os_feature_enabled_impl();
}

+ (BOOL)usingEndInputSessionCompletion
{
  if (qword_1EB25C430 != -1) {
    dispatch_once(&qword_1EB25C430, &__block_literal_global_1005);
  }
  return byte_1EB25C402;
}

void __44__UIKeyboard_usingEndInputSessionCompletion__block_invoke()
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  Class v0 = NSClassFromString(&cfstr_Rtiinputsystem.isa);
  int v1 = [(objc_class *)v0 instancesRespondToSelector:sel_endRemoteTextInputSessionWithID_options_completion_];
  if (v1)
  {
    int v1 = [(objc_class *)v0 instancesRespondToSelector:sel_endAllowingRemoteTextInput_completion_];
    if (v1)
    {
      int v1 = [(objc_class *)v0 instancesRespondToSelector:sel_setEnvironmentOptions_withReason_completion_];
      if (v1)
      {
        int v1 = +[UIKeyboard inputUIOOP];
        if (v1) {
          LOBYTE(v1) = _os_feature_enabled_impl();
        }
      }
    }
  }
  byte_1EB25C402 = v1;
  if (os_variant_has_internal_diagnostics())
  {
    id v4 = TIGetKeyboardOOPUsingEndInputSessionCompletionValue();
    char v5 = [v4 BOOLValue];

    int v6 = byte_1EB25C402;
    if (byte_1EB25C402 && (v5 & 1) == 0)
    {
      int v7 = _UIKeyboardInputSessionChangeLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1853B0000, v7, OS_LOG_TYPE_DEFAULT, "endInputSession completion is available for this configuration, but is disabled by defaults override", (uint8_t *)&v9, 2u);
      }

      int v6 = byte_1EB25C402;
    }
    if (v6) {
      char v8 = v5;
    }
    else {
      char v8 = 0;
    }
    byte_1EB25C402 = v8;
  }
  int v2 = _UIKeyboardInputSessionChangeLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (byte_1EB25C402) {
      char v3 = "enabled";
    }
    else {
      char v3 = "disabled";
    }
    int v9 = 136315138;
    double v10 = v3;
    _os_log_impl(&dword_1853B0000, v2, OS_LOG_TYPE_DEFAULT, "endInputSession completion is %s", (uint8_t *)&v9, 0xCu);
  }
}

+ (BOOL)shouldExtendKeyboardInputUI
{
  if (TIGetExtendInputUIValue_onceToken != -1) {
    dispatch_once(&TIGetExtendInputUIValue_onceToken, &__block_literal_global_1463);
  }
  char v3 = [MEMORY[0x1E4FAE3D8] sharedPreferencesController];
  id v4 = [v3 valueForPreferenceKey:@"ExtendInputUI"];

  if ([v4 BOOLValue]) {
    int v5 = [a1 isSpotlight] ^ 1;
  }
  else {
    LOBYTE(v5) = 0;
  }

  return v5;
}

+ (BOOL)isInlineTextCompletionUISupported
{
  return 1;
}

uint64_t __45__UIKeyboard_isInlineTextCompletionUIEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInlineTextCompletionUISupported];
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  byte_1EB25C405 = result;
  return result;
}

uint64_t __54__UIKeyboard_presentsInlineTextCompletionAsMarkedText__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInlineTextCompletionUIEnabled];
  if (result)
  {
    uint64_t result = _os_feature_enabled_impl();
    char v2 = result ^ 1;
  }
  else
  {
    char v2 = 0;
  }
  byte_1EB25C406 = v2;
  return result;
}

+ (BOOL)doesSpacebarAcceptInlineTextCompletion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__UIKeyboard_doesSpacebarAcceptInlineTextCompletion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C458 != -1) {
    dispatch_once(&qword_1EB25C458, block);
  }
  return byte_1EB25C407;
}

uint64_t __52__UIKeyboard_doesSpacebarAcceptInlineTextCompletion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInlineTextCompletionUIEnabled];
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  byte_1EB25C407 = result;
  return result;
}

+ (BOOL)isInlineTextCompletionEducationUIEnabled
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__UIKeyboard_isInlineTextCompletionEducationUIEnabled__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C460 != -1) {
    dispatch_once(&qword_1EB25C460, block);
  }
  return byte_1EB25C408;
}

uint64_t __54__UIKeyboard_isInlineTextCompletionEducationUIEnabled__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isInlineTextCompletionUIEnabled];
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  byte_1EB25C408 = result;
  return result;
}

+ (BOOL)doesSpacebarAcceptFullInlineTextCompletion
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__UIKeyboard_doesSpacebarAcceptFullInlineTextCompletion__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C468 != -1) {
    dispatch_once(&qword_1EB25C468, block);
  }
  return byte_1EB25C409;
}

uint64_t __56__UIKeyboard_doesSpacebarAcceptFullInlineTextCompletion__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) doesSpacebarAcceptInlineTextCompletion];
  if (result) {
    uint64_t result = _os_feature_enabled_impl();
  }
  byte_1EB25C409 = result;
  return result;
}

+ (BOOL)isShowingEmojiSearch
{
  char v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 showingEmojiSearch];

  return v3;
}

+ (BOOL)isLanguageIndicatorEnabled
{
  char v2 = +[UIKeyboardPreferencesController sharedPreferencesController];
  char v3 = [v2 keyboardLanguageIndicatorEnabled];

  return v3;
}

+ (BOOL)isInlineDictationGlowEffectEnabled
{
  if (![a1 isRedesignedTextCursorEnabled] || !_os_feature_enabled_impl()) {
    return 0;
  }
  char v2 = +[_UIDictationSettingsDomain rootSettings];
  char v3 = [v2 glowEffectEnabled];

  return v3;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  if (self->_menuGestureRecognizer != a3) {
    return 1;
  }
  unint64_t v5 = ([(UIKeyboard *)self cursorLocation] >> 7) & 1;
  return v5 | [(UIKeyboard *)self _isDictationCurrentView];
}

- (BOOL)_isDictationCurrentView
{
  char v2 = +[UIKeyboardImpl sharedInstance];
  char v3 = [v2 _getCurrentKeyplaneName];
  [v3 rangeOfString:@"Dictation"];
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)shouldSaveMinimizationState
{
  return 1;
}

- (BOOL)isMinimized
{
  return self->m_minimized;
}

- (void)syncMinimizedStateToHardwareKeyboardAttachedState
{
  if ([(UIKeyboard *)self isAutomatic])
  {
    id v4 = +[UIKeyboardImpl sharedInstance];
    if ([v4 _shouldMinimizeForHardwareKeyboard]) {
      char v3 = 1;
    }
    else {
      char v3 = [v4 _shouldSuppressSoftwareKeyboard];
    }
    self->m_minimized = v3;
    [v4 notifyInputSourceStateChangeIfNeeded];
  }
}

- (UIPeripheralAnimationGeometry)geometryForMinimize:(SEL)a3
{
  BOOL v4 = a4;
  retstr->targetFrameHeightDelta = 0.0;
  *(_OWORD *)&retstr->transform.c = 0u;
  *(_OWORD *)&retstr->transform.tdouble x = 0u;
  retstr->bounds.size = 0u;
  *(_OWORD *)&retstr->transform.a = 0u;
  retstr->bounds.origin = 0u;
  retstr->outPosition = 0u;
  retstr->inPosition = 0u;
  p_inPosition = &retstr->inPosition;
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  retstr->bounds.origin.double x = v12;
  retstr->bounds.origin.double y = v13;
  retstr->bounds.size.double width = v8;
  retstr->bounds.size.double height = v10;
  unint64_t v14 = [(UIView *)self _keyboardOrientation] - 3;
  double v15 = +[UIScreen mainScreen];
  [v15 bounds];
  double v17 = v16;
  double v19 = v18;

  if (v14 >= 2) {
    double v21 = v19;
  }
  else {
    double v21 = v17;
  }
  float v22 = v9 * 0.5;
  float v23 = v21 - v11 * 0.5;
  CGFloat v24 = v23;
  p_inPosition->double x = v22;
  retstr->inPosition.double y = v24;
  *(float *)&CGFloat v24 = v11 + v24;
  retstr->outPosition.double x = v22;
  retstr->outPosition.double y = *(float *)&v24;
  if (v4)
  {
    CGPoint v25 = *p_inPosition;
    CGPoint *p_inPosition = retstr->outPosition;
    retstr->outPosition = v25;
  }
  uint64_t v26 = MEMORY[0x1E4F1DAB8];
  long long v27 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->transform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->transform.c = v27;
  *(_OWORD *)&retstr->transform.tdouble x = *(_OWORD *)(v26 + 32);
  return result;
}

- (void)setCorrectionLearningAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 setCorrectionLearningAllowed:v3];
}

- (void)responseContextDidChange
{
  id v2 = +[UIKeyboardImpl activeInstance];
  [v2 responseContextDidChange];
}

- (void)textInputTraitsDidChange
{
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  [v3 takeTextInputTraitsFromDelegate];

  if (+[UIKeyboard usesInputSystemUI])
  {
    id v9 = +[UIKeyboardImpl activeInstance];
    id v4 = [v9 remoteTextInputPartner];
    [v4 documentTraitsChanged];
  }
  else
  {
    id v9 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    BOOL v5 = [v9 responder];
    int v6 = [v5 inputAccessoryView];
    int v7 = [v9 inputViews];
    CGFloat v8 = [v7 inputAccessoryView];

    if (v6 != v8) {
      goto LABEL_6;
    }
    id v4 = +[UIKBKeyplaneChangeContext keyplaneChangeContext];
    [v4 setUpdateAssistantView:1];
    [(UIKeyboard *)self _didChangeKeyplaneWithContext:v4];
  }

LABEL_6:
}

- (id)targetWindow
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 inputDelegate];
  id v4 = [v3 textInputView];
  BOOL v5 = [v4 window];

  return v5;
}

- (void)_setRenderConfig:(id)a3
{
  id v9 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  BOOL v5 = [v4 superview];

  if (v5 == self)
  {
    int v6 = +[UIKeyboardImpl activeInstance];
    [v6 setLayoutRenderConfig:v9];

    int v7 = +[UIKeyboardImpl activeInstance];
    CGFloat v8 = [v7 candidateController];
    [v8 _setRenderConfig:v9];
  }
}

- (void)_setPasscodeOutlineAlpha:(double)a3
{
  if ([(UIKeyboard *)self isActive])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    id v4 = [v5 _layout];
    [v4 setPasscodeOutlineAlpha:a3];
  }
}

- (void)_setDisableUpdateMaskForSecureTextEntry:(BOOL)a3
{
  BOOL v3 = a3;
  passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
  if (v3)
  {
    if (!passcodeObscuringInteraction)
    {
      int v6 = objc_alloc_init(_UIKeyboardPasscodeObscuringInteraction);
      int v7 = self->_passcodeObscuringInteraction;
      self->_passcodeObscuringInteraction = v6;

      passcodeObscuringInteraction = self->_passcodeObscuringInteraction;
    }
    [(UIView *)self addInteraction:passcodeObscuringInteraction];
  }
  else if (passcodeObscuringInteraction)
  {
    -[UIView removeInteraction:](self, "removeInteraction:");
    CGFloat v8 = self->_passcodeObscuringInteraction;
    self->_passcodeObscuringInteraction = 0;
  }
}

- (BOOL)_disableTouchInput
{
  return self->m_disableTouchInput;
}

- (void)_setDisableTouchInput:(BOOL)a3
{
  BOOL v3 = a3;
  self->m_disableTouchInput = a3;
  if ([(UIKeyboard *)self isActive])
  {
    id v5 = +[UIKeyboardImpl activeInstance];
    id v4 = [v5 _layout];
    [v4 setDisableTouchInput:v3];
  }
}

- (BOOL)_useLinearLayout
{
  return self->m_useLinearLayout;
}

- (void)_setUseLinearLayout:(BOOL)a3
{
  self->m_useLinearLayout = a3;
}

- (BOOL)_useRecentsAlert
{
  return self->m_useRecentsAlert;
}

- (void)_setUseRecentsAlert:(BOOL)a3
{
  self->m_useRecentsAlert = a3;
}

- (void)minimize
{
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  [(UIKeyboard *)self geometryForMinimize:1];
  BOOL v3 = [(UIView *)self superview];

  if (v3)
  {
    id v4 = +[UIPeripheralHost sharedInstance];
    v15[4] = v21;
    v15[5] = v22;
    v15[6] = v23;
    uint64_t v16 = v24;
    v15[0] = v17;
    v15[1] = v18;
    v15[2] = v19;
    v15[3] = v20;
    [v4 postWillShowNotificationForGeometry:v15 duration:0.25];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    long long v11 = v21;
    long long v12 = v22;
    long long v13 = v23;
    long long v7 = v17;
    long long v8 = v18;
    long long v9 = v19;
    v6[2] = __22__UIKeyboard_minimize__block_invoke;
    v6[3] = &unk_1E52FC420;
    v6[4] = self;
    uint64_t v14 = v24;
    long long v10 = v20;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __22__UIKeyboard_minimize__block_invoke_2;
    v5[3] = &unk_1E52DC3A0;
    v5[4] = self;
    +[UIView animateWithDuration:0 delay:v6 options:v5 animations:0.25 completion:0.0];
  }
  else
  {
    [(UIView *)self setCenter:v18];
  }
}

uint64_t __22__UIKeyboard_minimize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __22__UIKeyboard_minimize__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyboardMinMaximized:1];
}

- (void)maximize
{
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = 0u;
  [(UIKeyboard *)self geometryForMinimize:0];
  BOOL v3 = [(UIView *)self superview];

  if (v3)
  {
    id v4 = +[UIPeripheralHost sharedInstance];
    v15[4] = v21;
    v15[5] = v22;
    v15[6] = v23;
    uint64_t v16 = v24;
    v15[0] = v17;
    v15[1] = v18;
    v15[2] = v19;
    v15[3] = v20;
    [v4 postWillShowNotificationForGeometry:v15 duration:0.25];

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    long long v11 = v21;
    long long v12 = v22;
    long long v13 = v23;
    long long v7 = v17;
    long long v8 = v18;
    long long v9 = v19;
    v6[2] = __22__UIKeyboard_maximize__block_invoke;
    v6[3] = &unk_1E52FC420;
    v6[4] = self;
    uint64_t v14 = v24;
    long long v10 = v20;
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __22__UIKeyboard_maximize__block_invoke_2;
    v5[3] = &unk_1E52DC3A0;
    v5[4] = self;
    +[UIView animateWithDuration:0 delay:v6 options:v5 animations:0.25 completion:0.0];
  }
  else
  {
    [(UIView *)self setCenter:v18];
  }
}

uint64_t __22__UIKeyboard_maximize__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __22__UIKeyboard_maximize__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) keyboardMinMaximized:0];
}

- (void)setMinimized:(BOOL)a3
{
  if ([(UIKeyboard *)self isAutomatic])
  {
    id v10 = +[UIKeyboardImpl sharedInstance];
    id v5 = [v10 textInputTraits];
    uint64_t v6 = [v5 keyboardAppearance];

    BOOL v7 = v6 != 127 && a3;
    self->m_minimized = v7;
    [v10 notifyInputSourceStateChangeIfNeeded];
    if (self->m_minimized)
    {
      [(UIKeyboard *)self minimize];
    }
    else
    {
      long long v8 = +[UIDictationController activeInstance];
      char v9 = [v8 resigningFirstResponder];

      if ((v9 & 1) == 0) {
        [(UIKeyboard *)self maximize];
      }
    }
  }
}

- (void)keyboardMinMaximized:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[UIPeripheralHost sharedInstance];
  [(UIKeyboard *)self geometryForMinimize:v3];
  [v5 postDidShowNotificationForGeometry:v6];

  if (v3) {
    [(UIKeyboard *)self geometryChangeDone:0];
  }
}

- (UIPeripheralAnimationGeometry)geometryForImplHeightDelta:(SEL)a3
{
  retstr->targetFrameHeightDelta = 0.0;
  *(_OWORD *)&retstr->transform.c = 0u;
  *(_OWORD *)&retstr->transform.tdouble x = 0u;
  retstr->bounds.size = 0u;
  *(_OWORD *)&retstr->transform.a = 0u;
  retstr->bounds.origin = 0u;
  retstr->outPosition = 0u;
  retstr->inPosition = 0u;
  p_inPosition = &retstr->inPosition;
  int64_t v7 = [(UIView *)self _keyboardOrientation];
  retstr->bounds.origin.double x = 0.0;
  retstr->bounds.origin.double y = 0.0;
  +[UIKeyboard defaultSizeForInterfaceOrientation:v7];
  double v10 = v9;
  double v11 = -0.0;
  if (a4 >= 0.0) {
    double v11 = a4;
  }
  double v12 = v11 + v8;
  retstr->bounds.size.double width = v10;
  retstr->bounds.size.double height = v11 + v8;
  unint64_t v13 = v7 - 3;
  uint64_t v14 = +[UIScreen mainScreen];
  [v14 bounds];
  double v16 = v15;
  double v18 = v17;

  if (v13 >= 2) {
    double v20 = v18;
  }
  else {
    double v20 = v16;
  }
  CGFloat v21 = v20 - v12 * 0.5;
  p_inPosition->double x = v10 * 0.5;
  retstr->inPosition.double y = v21;
  double v22 = fabs(a4);
  retstr->outPosition.double x = v10 * 0.5;
  retstr->outPosition.double y = v22 + v21;
  if (a4 < 0.0)
  {
    CGPoint v23 = *p_inPosition;
    CGPoint *p_inPosition = retstr->outPosition;
    retstr->outPosition = v23;
    retstr->inPosition.double y = retstr->inPosition.y - v22;
    retstr->outPosition.double y = retstr->outPosition.y - v22;
  }
  uint64_t v24 = MEMORY[0x1E4F1DAB8];
  long long v25 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  *(_OWORD *)&retstr->transform.a = *MEMORY[0x1E4F1DAB8];
  *(_OWORD *)&retstr->transform.c = v25;
  *(_OWORD *)&retstr->transform.tdouble x = *(_OWORD *)(v24 + 32);
  retstr->targetFrameHeightDelta = 0.0;
  return result;
}

- (void)prepareForImplBoundsHeightChange:(double)a3 suppressNotification:(BOOL)a4
{
  if (!a4)
  {
    uint64_t v14 = 0;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    long long v7 = 0u;
    [(UIKeyboard *)self geometryForImplHeightDelta:a3];
    id v4 = +[UIPeripheralHost sharedInstance];
    v5[4] = v11;
    void v5[5] = v12;
    v5[6] = v13;
    uint64_t v6 = v14;
    v5[0] = v7;
    v5[1] = v8;
    v5[2] = v9;
    v5[3] = v10;
    [v4 postWillShowNotificationForGeometry:v5 duration:0.0];
  }
}

- (void)implBoundsHeightChangeDone:(double)a3 suppressNotification:(BOOL)a4
{
  self->m_respondingToImplGeometryChange = 1;
  [(UIView *)self frame];
  -[UIKeyboard setFrame:](self, "setFrame:");
  self->m_respondingToImplGeometryChange = 0;
  if (!a4)
  {
    uint64_t v17 = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v10 = 0u;
    [(UIKeyboard *)self geometryForImplHeightDelta:a3];
    long long v7 = +[UIPeripheralHost sharedInstance];
    v8[4] = v14;
    v8[5] = v15;
    v8[6] = v16;
    uint64_t v9 = v17;
    v8[0] = v10;
    v8[1] = v11;
    v8[2] = v12;
    v8[3] = v13;
    [v7 postDidShowNotificationForGeometry:v8];
  }
}

- (BOOL)canDismiss
{
  return 1;
}

- (BOOL)showsCandidatesInline
{
  id v2 = +[UIKeyboardImpl activeInstance];
  char v3 = [v2 showsCandidateInline];

  return v3;
}

- (void)setShowsCandidatesInline:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 setShowsCandidateInline:v3];
}

+ (BOOL)splitKeyboardEnabled
{
  return +[UIKeyboardImpl rivenPreference];
}

- (void)_didChangeKeyplaneWithContext:(id)a3
{
  id v4 = a3;
  [(UIKeyboard *)self updateKeyFocusGuides];
  [(UIKeyboard *)self _toggleMenuGestureRecognizer:([(UIKeyboard *)self cursorLocation] >> 7) & 1 | [(UIKeyboard *)self _isDictationCurrentView]];
  id v5 = +[UIPeripheralHost sharedInstance];
  int v6 = [v5 automaticAppearanceEnabled];

  if (v6)
  {
    if ([v4 sizeDidChange])
    {
      [v4 size];
      self->_preferredSize.double width = v7;
      self->_preferredSize.double height = v8;
      if (([v4 isDynamicLayout] & 1) != 0
        || +[UIKeyboard resizable])
      {
        [(UIView *)self invalidateIntrinsicContentSize];
      }
      else
      {
        [(UIView *)self frame];
        double v10 = v9;
        [v4 size];
        double v12 = v11;
        [v4 size];
        -[UIKeyboard setFrame:](self, "setFrame:", 0.0, v10, v12, v13);
      }
    }
    v14.receiver = self;
    v14.super_class = (Class)UIKeyboard;
    [(UIView *)&v14 _didChangeKeyplaneWithContext:v4];
  }
}

+ (BOOL)isSafari
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __22__UIKeyboard_isSafari__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C480 != -1) {
    dispatch_once(&qword_1EB25C480, block);
  }
  return byte_1EB25C40C;
}

void __22__UIKeyboard_isSafari__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) keyboardBundleIdentifier];
  byte_1EB25C40C = [&unk_1ED3F0880 containsObject:v1];
}

+ (BOOL)isAutoFillPanelInAppsEnabled
{
  UIKeyboardGetSafeDeviceIdiom();
  return _os_feature_enabled_impl();
}

+ (BOOL)isAutoFillPanelUIEnabled
{
  UIKeyboardGetSafeDeviceIdiom();
  return _os_feature_enabled_impl();
}

+ (BOOL)isAlwaysAllowedAutoFillPanelClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIKeyboard_isAlwaysAllowedAutoFillPanelClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C488 != -1) {
    dispatch_once(&qword_1EB25C488, block);
  }
  return byte_1EB25C40D;
}

void __48__UIKeyboard_isAlwaysAllowedAutoFillPanelClient__block_invoke(uint64_t a1)
{
  BOOL v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.quicklook", @"com.apple.quicklook.extension.previewUI", @"com.apple.quicklook.UIExtension", @"com.apple.mobilenotes", 0);
  id v2 = [*(id *)(a1 + 32) keyboardBundleIdentifier];
  byte_1EB25C40D = [v3 containsObject:v2];
}

+ (BOOL)isAlwaysBlockedAutoFillPanelClient
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__UIKeyboard_isAlwaysBlockedAutoFillPanelClient__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C490 != -1) {
    dispatch_once(&qword_1EB25C490, block);
  }
  return byte_1EB25C40E;
}

void __48__UIKeyboard_isAlwaysBlockedAutoFillPanelClient__block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"com.apple.mobilesafari", @"com.apple.SafariViewService", 0);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = [*(id *)(a1 + 32) keyboardBundleIdentifier];
  byte_1EB25C40E = [v3 containsObject:v2];
}

- (int64_t)keyboardIdiom
{
  return self->m_idiom;
}

- (void)setKeyboardIdiom:(int64_t)a3
{
  self->m_idiom = a3;
}

- (BOOL)shouldUpdateLayoutAutomatically
{
  return self->_shouldUpdateLayoutAutomatically;
}

- (BOOL)hasImpendingCursorLocation
{
  return self->_hasImpendingCursorLocation;
}

- (void)setHasImpendingCursorLocation:(BOOL)a3
{
  self->_hasImpendingCursorLocation = a3;
}

- (unint64_t)impendingCursorLocation
{
  return self->_impendingCursorLocation;
}

- (unint64_t)requestedInteractionModel
{
  return self->_requestedInteractionModel;
}

- (void)setRequestedInteractionModel:(unint64_t)a3
{
  self->_requestedInteractionModel = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_implConstraints, 0);
  objc_storeStrong((id *)&self->_menuGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_passcodeObscuringInteraction, 0);
  objc_storeStrong((id *)&self->m_focusGuides, 0);
  objc_storeStrong((id *)&self->m_overrideTraits, 0);
  objc_storeStrong((id *)&self->m_defaultTraits, 0);
  objc_storeStrong((id *)&self->m_snapshot, 0);
}

- (id)createPathEffectViewIfNecessary
{
  id v2 = +[UIKeyboardImpl activeInstance];
  id v3 = [v2 _layout];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v5 = [v4 pathEffectView];

    if (v5)
    {
      int v6 = [v4 pathEffectView];
    }
    else
    {
      uint64_t v12 = 0;
      double v13 = &v12;
      uint64_t v14 = 0x2050000000;
      CGFloat v7 = (void *)qword_1EB25C4D0;
      uint64_t v15 = qword_1EB25C4D0;
      if (!qword_1EB25C4D0)
      {
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __getTUIKeyboardPathEffectViewClass_block_invoke_0;
        v11[3] = &unk_1E52D9900;
        void v11[4] = &v12;
        __getTUIKeyboardPathEffectViewClass_block_invoke_0((uint64_t)v11);
        CGFloat v7 = (void *)v13[3];
      }
      CGFloat v8 = v7;
      _Block_object_dispose(&v12, 8);
      id v9 = [v8 alloc];
      int v6 = objc_msgSend(v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
      [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v6 setAlpha:0.0];
      [v4 setPathEffectView:v6];
    }
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

+ (BOOL)platformSupportsKeyboardServiceRole:(unint64_t)a3
{
  return 1;
}

+ (unint64_t)serviceRole
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__UIKeyboard_OutOfProcessSupport__serviceRole__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (qword_1EB25C498 != -1) {
    dispatch_once(&qword_1EB25C498, block);
  }
  return qword_1EB25C4A0;
}

uint64_t __46__UIKeyboard_OutOfProcessSupport__serviceRole__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) usesInputSystemUI];
  if ((result & 1) != 0
    || (uint64_t result = [*(id *)(a1 + 32) usesInputSystemUIForAutoFillOnlyWithRTI], result))
  {
    qword_1EB25C4A0 = 1;
  }
  return result;
}

+ (void)setServiceRole:(unint64_t)a3
{
  if (objc_msgSend(a1, "platformSupportsKeyboardServiceRole:"))
  {
    [a1 serviceRole];
    qword_1EB25C4A0 = a3;
    id v5 = +[UIKeyboardImpl activeInstance];
    [v5 setServiceRole:a3];
  }
}

+ (void)resetServiceRole
{
  if ([a1 usesInputSystemUI]) {
    uint64_t v3 = 1;
  }
  else {
    uint64_t v3 = [a1 usesInputSystemUIForAutoFillOnly];
  }
  [a1 setServiceRole:v3];
}

- (void)manualKeyboardWillBeOrderedIn
{
  id v3 = +[UIPeripheralHost sharedInstance];
  [v3 manualKeyboardWillBeOrderedIn:self];
}

- (void)manualKeyboardWasOrderedIn
{
  id v3 = +[UIPeripheralHost sharedInstance];
  [v3 manualKeyboardWasOrderedIn:self];
}

- (void)manualKeyboardWillBeOrderedOut
{
  id v3 = +[UIPeripheralHost sharedInstance];
  [v3 manualKeyboardWillBeOrderedOut:self];
}

- (void)manualKeyboardWasOrderedOut
{
  id v3 = +[UIPeripheralHost sharedInstance];
  [v3 manualKeyboardWasOrderedOut:self];
}

+ (id)homeGestureExclusionZones
{
  if ([(id)objc_opt_class() isOnScreen])
  {
    id v2 = +[UIKeyboardDockView dockViewHomeGestureExclusionZones];
  }
  else
  {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

- (id)_getCurrentKeyplaneName
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  id v3 = [v2 _getCurrentKeyplaneName];

  return v3;
}

- (id)_getCurrentKeyboardName
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  id v3 = [v2 _getCurrentKeyboardName];

  return v3;
}

- (id)_getLocalizedInputMode
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  id v3 = [v2 _getLocalizedInputMode];

  return v3;
}

- (id)_baseKeyForRepresentedString:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 _layout];
  int v6 = [v5 canProduceString:v3];

  if (v6)
  {
    CGFloat v7 = +[UIKeyboardImpl activeInstance];
    CGFloat v8 = [v7 _layout];
    id v9 = [v8 baseKeyForString:v3];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (id)_keyplaneForKey:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 _layout];
  int v6 = [v5 keyplaneForKey:v3];

  return v6;
}

- (id)_keyplaneNamed:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  id v5 = [v4 _layout];
  int v6 = [v5 keyplaneNamed:v3];

  return v6;
}

- (void)_changeToKeyplane:(id)a3
{
  id v3 = a3;
  id v5 = +[UIKeyboardImpl activeInstance];
  id v4 = [v5 _layout];
  [v4 changeToKeyplane:v3];
}

- (void)_setUndocked:(BOOL)a3
{
}

- (void)_setSplit:(BOOL)a3
{
}

- (id)_touchPoint:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  id v5 = +[UIKeyboardImpl activeInstance];
  [v5 _setNeedsCandidates:1];

  int v6 = +[UIKeyboardImpl activeInstance];
  CGFloat v7 = [v6 _layout];
  CGFloat v8 = objc_msgSend(v7, "simulateTouch:", x, y);

  return v8;
}

- (id)_typeCharacter:(id)a3 withError:(CGPoint)a4 shouldTypeVariants:(BOOL)a5 baseKeyForVariants:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  double y = a4.y;
  double x = a4.x;
  id v10 = a3;
  double v11 = +[UIKeyboardImpl activeInstance];
  [v11 _setNeedsCandidates:1];

  uint64_t v12 = +[UIKeyboardImpl activeInstance];
  double v13 = [v12 _layout];
  uint64_t v14 = objc_msgSend(v13, "simulateTouchForCharacter:errorVector:shouldTypeVariants:baseKeyForVariants:", v10, v7, v6, x, y);

  return v14;
}

- (void)_setInputMode:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 setInputMode:v3];
}

- (void)_setAutocorrects:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  [v4 _setAutocorrects:v3];
}

- (id)_getAutocorrection
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 _getAutocorrection];

  return v3;
}

- (void)_acceptCurrentCandidate
{
  id v3 = +[UIKeyboardImpl activeInstance];
  id v2 = (id)[v3 acceptCurrentCandidate];
}

- (BOOL)_hasCandidates
{
  id v2 = +[UIKeyboardImpl activeInstance];
  if ([v2 _needsCandidates])
  {
    char v3 = 0;
  }
  else
  {
    id v4 = +[UIKeyboardImpl activeInstance];
    char v3 = [v4 _hasCandidates];
  }
  return v3;
}

- (int64_t)_positionInCandidateList:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  int64_t v5 = [v4 _positionInCandidateList:v3];

  return v5;
}

- (CGRect)_floatingKeyboardDraggableRect
{
  double v3 = *MEMORY[0x1E4F1DB28];
  double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
  double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
  double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  if (+[UIKeyboardImpl isFloating])
  {
    BOOL v7 = [(UIView *)self _rootInputWindowController];
    CGFloat v8 = [v7 hosting];
    id v9 = [v8 itemForPurpose:0];

    id v10 = [v9 applicator];
    double v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 draggableView];
      double v13 = [v12 superview];
      [v12 frame];
      objc_msgSend(v13, "convertRect:toView:", self);
      double v3 = v14;
      double v4 = v15;
      double v5 = v16;
      double v6 = v17;
    }
  }
  double v18 = v3;
  double v19 = v4;
  double v20 = v5;
  double v21 = v6;
  result.size.double height = v21;
  result.size.double width = v20;
  result.origin.double y = v19;
  result.origin.double x = v18;
  return result;
}

+ (double)predictionViewHeightForCurrentInputMode
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  int v3 = [v2 usesCandidateSelection];

  double v4 = +[UIKeyboardImpl sharedInstance];
  double v5 = v4;
  if (v3)
  {
    double v6 = [v4 candidateController];
    BOOL v7 = +[UIKeyboard activeKeyboard];
    objc_msgSend(v6, "candidateBarHeightForOrientation:", objc_msgSend(v7, "interfaceOrientation"));
    double v9 = v8;
    id v10 = v5;
  }
  else
  {
    id v10 = [v4 traitCollection];

    double v6 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    double v11 = [v6 systemInputAssistantViewController];
    BOOL v7 = v11;
    if (v11 && ([v11 isEmojiSearchResultsVisible] & 1) == 0) {
      [v7 preferredHeightForTraitCollection:v10];
    }
    else {
      +[UISystemInputAssistantViewController _defaultPreferredHeightForTraitCollection:v10];
    }
    double v9 = v12;
  }

  return v9;
}

+ (UIEdgeInsets)keyplanePadding
{
  id v2 = +[UIKeyboardImpl activeInstance];
  int v3 = [v2 _layout];

  [v3 keyplanePadding];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.double right = v15;
  result.double bottom = v14;
  result.double left = v13;
  result.double top = v12;
  return result;
}

+ (id)snapshotViewForPredictionViewTransition
{
  if ([a1 usesInputSystemUI])
  {
    id v2 = +[UIKeyboardUIClient sharedInstance];
    int v3 = [v2 snapshotViewForOptions:2];
LABEL_8:
    double v10 = v3;
    goto LABEL_12;
  }
  double v4 = +[UIKeyboardImpl sharedInstance];
  int v5 = [v4 usesCandidateSelection];

  if (v5)
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      id v2 = +[UIKeyboardImpl activeInstance];
      double v6 = [v2 candidateController];
      [v6 candidateBar];
    }
    else
    {
      id v2 = +[UIKeyboardImpl sharedInstance];
      double v6 = [v2 candidateController];
      [v6 snapshot];
    }
    double v10 = (UIView *)objc_claimAutoreleasedReturnValue();

    goto LABEL_12;
  }
  double v7 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  double v8 = [v7 systemInputAssistantViewController];
  double v9 = [v8 view];

  if (+[UIKeyboard isKeyboardProcess])
  {
    int v3 = v9;
    id v2 = v3;
    goto LABEL_8;
  }
  id v2 = [v9 snapshotView];

  double v11 = [UIView alloc];
  [v2 bounds];
  double v10 = -[UIView initWithFrame:](v11, "initWithFrame:");
  [(UIView *)v10 setClipsToBounds:1];
  [(UIView *)v10 addSubview:v2];
LABEL_12:

  return v10;
}

+ (id)snapshotViewForOptions:(unint64_t)a3
{
  if (!+[UIKeyboard usesInputSystemUI])
  {
    double v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:a1 file:@"UIKeyboard.m" lineNumber:2948 description:@"snapshotViewForOptions only supports OOP keyboard"];
  }
  double v6 = +[UIKeyboardUIClient sharedInstance];
  double v7 = [v6 snapshotViewForOptions:a3];

  return v7;
}

+ (void)forceKeyboardAlpha:(double)a3
{
  if ([a1 usesInputSystemUI])
  {
    id v4 = +[UIKeyboardUIClient sharedInstance];
    [v4 setKeyboardAlpha:1 force:a3];
  }
}

+ (void)setKeyboardAlpha:(double)a3
{
}

+ (void)setKeyboardAlpha:(double)a3 remote:(BOOL)a4 force:(BOOL)a5 processId:(int)a6
{
  uint64_t v6 = *(void *)&a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([a1 usesInputSystemUI])
  {
    double v11 = _UIKeyboardLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&uint8_t buf[4] = a3;
      _os_log_impl(&dword_1853B0000, v11, OS_LOG_TYPE_DEFAULT, "Setting keyboard alpha: %f", buf, 0xCu);
    }

    double v12 = +[UIKeyboardUIClient sharedInstance];
    [v12 setKeyboardAlpha:v7 force:a3];
  }
  else
  {
    if (qword_1EB25C4B0 != -1) {
      dispatch_once(&qword_1EB25C4B0, &__block_literal_global_1376);
    }
    uint64_t v37 = 0;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    *(_OWORD *)buf = 0u;
    long long v30 = 0u;
    if (proc_pidinfo(v6, 3, 0, buf, 136) > 0x87)
    {
      uint64_t v14 = *((void *)&v36 + 1);
    }
    else
    {
      double v13 = _UIKeyboardLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        long long v25 = __error();
        uint64_t v26 = strerror(*v25);
        *(_DWORD *)long long v27 = 67109378;
        *(_DWORD *)double v28 = v6;
        *(_WORD *)&v28[4] = 2080;
        *(void *)&v28[6] = v26;
        _os_log_error_impl(&dword_1853B0000, v13, OS_LOG_TYPE_ERROR, "Failed to get pid info for pid %d: %s", v27, 0x12u);
      }

      uint64_t v14 = 0;
    }
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%d:%llu", v6, v14);
    double v16 = (void *)v15;
    if (v15 && v8 && !v7)
    {
      if (a3 == 0.0) {
        [(id)qword_1EB25C4A8 addObject:v15];
      }
      else {
        [(id)qword_1EB25C4A8 removeObject:v15];
      }
    }
    else if (v15 && !v7 && [(id)qword_1EB25C4A8 containsObject:v15])
    {
      a3 = 0.0;
    }
    double v17 = _UIKeyboardLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long v27 = 134218242;
      *(double *)double v28 = a3;
      *(_WORD *)&v28[8] = 2112;
      *(void *)&v28[10] = v16;
      _os_log_impl(&dword_1853B0000, v17, OS_LOG_TYPE_DEFAULT, "Setting keyboard alpha: %f, key=%@", v27, 0x16u);
    }

    if (([a1 isKeyboardProcess] & 1) == 0)
    {
      double v18 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
      double v19 = [v18 keyboardWindow];

      double v20 = [v19 rootViewController];
      double v21 = [v20 view];
      [v21 setAlpha:a3];
    }
    double v22 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    CGPoint v23 = [v22 containerRootController];
    uint64_t v24 = [v23 view];

    [v24 setAlpha:a3];
  }
}

void __70__UIKeyboard_TestingSupport__setKeyboardAlpha_remote_force_processId___block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F1CA80] set];
  id v1 = (void *)qword_1EB25C4A8;
  qword_1EB25C4A8 = v0;
}

+ (BOOL)predictionViewPrewarmsPredictiveCandidates
{
  id v2 = +[UIKeyboardImpl sharedInstance];
  char v3 = [v2 prewarmsPredictiveCandidates];

  return v3;
}

+ (void)setPredictionViewPrewarmsPredictiveCandidates:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[UIKeyboardImpl sharedInstance];
  [v4 setPrewarmsPredictiveCandidates:v3];
}

+ (BOOL)candidateDisplayIsExtended
{
  id v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 candidateController];

  LOBYTE(v2) = [v3 isExtended];
  return (char)v2;
}

+ (id)obtainHideDisambiguationCandidatesAssertionForReason:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 candidateController];

  uint64_t v6 = [v5 obtainHideDisambiguationCandidatesAssertionForReason:v3];

  return v6;
}

+ (id)obtainHideInlineCandidatesAssertionForReason:(id)a3
{
  id v3 = a3;
  id v4 = +[UIKeyboardImpl activeInstance];
  int v5 = [v4 obtainHideInlineCandidatesAssertionForReason:v3];

  return v5;
}

@end