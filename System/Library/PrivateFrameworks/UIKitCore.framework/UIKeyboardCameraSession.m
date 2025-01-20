@interface UIKeyboardCameraSession
+ (BOOL)isEnabled;
+ (BOOL)shouldShowTextSuggestionForResponder:(id)a3;
+ (BOOL)updatesGuideDuringRotation;
+ (UIKeyboardCameraSession)activeSession;
+ (UIKeyboardCameraSession)sharedSession;
+ (id)_textContentTypesForDataDetection;
+ (id)keyboardCameraContentTypeForResponder:(id)a3;
- (BOOL)isDismissing;
- (BOOL)isPresented;
- (BOOL)isPresenting;
- (BOOL)shouldSuppressSoftwareKeyboard;
- (UIKeyInput)responder;
- (UITextInputSessionActionAnalytics)sessionAnalytics;
- (id)_delegateAsResponder;
- (id)_sessionIdentifier;
- (id)_textInputResponder;
- (id)animationControllerForDismissedController:(id)a3;
- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5;
- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5;
- (int64_t)_overrideTextInputSource;
- (void)_addObservers;
- (void)_cleanupKeyboardCameraAndShouldInsertText:(BOOL)a3;
- (void)_dismissKeyboardCamera;
- (void)_firstResponderDidChange:(id)a3;
- (void)_keyboardAboutToHide:(id)a3;
- (void)_keyboardCameraPreparationDidComplete;
- (void)_makeResponderEditableIfNecessary;
- (void)_show;
- (void)_updatePreviewWithString:(id)a3;
- (void)dealloc;
- (void)endActiveSession;
- (void)keyboardCameraDidAccept;
- (void)keyboardCameraDidCancel;
- (void)keyboardCameraDidUpdateString:(id)a3;
- (void)presentationControllerDidDismiss:(id)a3;
- (void)setShouldSuppressSoftwareKeyboard:(BOOL)a3;
- (void)showForResponder:(id)a3 sender:(id)a4 rtiConfiguration:(id)a5;
@end

@implementation UIKeyboardCameraSession

+ (UIKeyboardCameraSession)sharedSession
{
  v2 = (void *)_activeSession;
  if (!_activeSession)
  {
    v3 = objc_alloc_init(UIKeyboardCameraSession);
    v4 = (void *)_activeSession;
    _activeSession = (uint64_t)v3;

    v2 = (void *)_activeSession;
  }
  return (UIKeyboardCameraSession *)v2;
}

+ (UIKeyboardCameraSession)activeSession
{
  return (UIKeyboardCameraSession *)(id)_activeSession;
}

+ (BOOL)isEnabled
{
  return +[UIKeyboardCameraViewController isEnabled];
}

+ (BOOL)updatesGuideDuringRotation
{
  v2 = +[_UIRemoteKeyboards sharedRemoteKeyboards];
  v3 = [v2 keyboardWindow];
  v4 = [v3 rootViewController];

  v5 = [v4 presentedViewController];
  v6 = [v5 presentationController];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v7 = [v6 updatesGuideDuringRotation];
  }
  else {
    char v7 = 0;
  }

  return v7;
}

+ (id)_textContentTypesForDataDetection
{
  if (qword_1EB261B90 != -1) {
    dispatch_once(&qword_1EB261B90, &__block_literal_global_348);
  }
  v2 = (void *)_MergedGlobals_1136;
  return v2;
}

void __60__UIKeyboardCameraSession__textContentTypesForDataDetection__block_invoke()
{
  v2[7] = *MEMORY[0x1E4F143B8];
  v2[0] = @"tel";
  v2[1] = @"street-address";
  v2[2] = @"url";
  v2[3] = @"email";
  v2[4] = @"flight-number";
  v2[5] = @"shipment-tracking-number";
  v2[6] = @"date-time";
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:7];
  v1 = (void *)_MergedGlobals_1136;
  _MergedGlobals_1136 = v0;
}

+ (id)keyboardCameraContentTypeForResponder:(id)a3
{
  id v4 = a3;
  v5 = &stru_1ED0E84C0;
  if (objc_opt_respondsToSelector())
  {
    v6 = [v4 textContentType];

    if (v6) {
      goto LABEL_14;
    }
  }
  else
  {
    v6 = v5;
    if (v5) {
      goto LABEL_14;
    }
  }
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v7 = [v4 keyboardType];
  if (v7 == 3)
  {
    v8 = (id *)&UITextContentTypeURL;
    goto LABEL_13;
  }
  if (v7 == 5)
  {
    v8 = (id *)&UITextContentTypeTelephoneNumber;
    goto LABEL_13;
  }
  if (v7 != 7)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_14;
  }
  v8 = (id *)&UITextContentTypeEmailAddress;
LABEL_13:
  v6 = (__CFString *)*v8;
LABEL_14:
  v9 = [a1 _textContentTypesForDataDetection];
  if ([v9 containsObject:v6]) {
    v10 = v6;
  }
  else {
    v10 = v5;
  }
  v11 = v10;

  return v11;
}

+ (BOOL)shouldShowTextSuggestionForResponder:(id)a3
{
  return 0;
}

- (void)showForResponder:(id)a3 sender:(id)a4 rtiConfiguration:(id)a5
{
  id v21 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [(UIViewController *)self->_keyboardCameraViewController presentingViewController];

  if (v11) {
    goto LABEL_26;
  }
  id v12 = v21;
  if ([v12 conformsToProtocol:&unk_1ED431E48])
  {
    if (v12)
    {
      v13 = [v12 textInputTraits];
      id v14 = v12;
LABEL_10:

      goto LABEL_11;
    }
  }
  else
  {
  }
  id v14 = v12;
  if (![v14 conformsToProtocol:&unk_1ED42EEC0])
  {
    v13 = 0;
    goto LABEL_10;
  }
  if (v14)
  {
    v13 = +[UITextInputTraits traitsByAdoptingTraits:v14];
    goto LABEL_10;
  }
  v13 = 0;
LABEL_11:

  objc_storeStrong((id *)&self->_responder, a3);
  if (([v12 conformsToProtocol:&unk_1ED700D60] & 1) != 0
    || ([v12 conformsToProtocol:&unk_1ED7009A0] & 1) != 0)
  {
    char v15 = 1;
  }
  else
  {
    char v15 = [v12 conformsToProtocol:&unk_1ED700940];
  }
  self->_isWebResponder = v15;
  self->_isTextInputResponder = [v12 conformsToProtocol:&unk_1ED42F658];
  self->_respondsToKeyboardInputShouldInsertText = objc_opt_respondsToSelector() & 1;
  if (([v13 isSingleLineDocument] & 1) != 0 || objc_msgSend(v13, "returnKeyType"))
  {
    char isKindOfClass = 1;
  }
  else
  {
    NSClassFromString(&cfstr_Mfcomposesubje_0.isa);
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  self->_isSingleLineDocument = isKindOfClass & 1;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v17 = [v13 isSecureTextEntry];
  }
  else {
    char v17 = 0;
  }
  self->_isSecureFieldEditor = v17;
  objc_storeStrong(&self->_sender, a4);
  if (v10)
  {
    self->_isWebResponder = [v10 isWebKitInteractionView];
    self->_isSingleLineDocument = [v10 isSingleLineDocument];
    self->_shouldSuppressSoftwareKeyboard = [v10 shouldSuppressKeyboard];
  }
  [(UIKeyboardCameraSession *)self _show];
  v18 = [(UIKeyboardCameraSession *)self sessionAnalytics];
  [v18 didBegin];

  v19 = +[UIKeyboard activeKeyboard];
  [v19 acceptAutocorrectionWithCompletionHandler:0];

  if (self->_isSecureFieldEditor)
  {
    v20 = [v12 _inputController];
    [v20 clearText];
  }
LABEL_26:
}

- (void)dealloc
{
  v6[5] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIWindowFirstResponderDidChangeNotification";
  v6[1] = @"UITextInputCurrentInputModeDidChangeNotification";
  v6[2] = @"UIApplicationDidEnterBackgroundNotification";
  v6[3] = @"UIApplicationWillResignActiveNotification";
  v6[4] = @"UIKeyboardPrivateWillHideNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:5];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIKeyboardCameraSession;
  [(UIKeyboardCameraSession *)&v5 dealloc];
}

- (BOOL)isPresented
{
  return [(UIPresentationController *)self->_presentationController state] == 2;
}

- (BOOL)isPresenting
{
  return [(UIPresentationController *)self->_presentationController state] == 1;
}

- (BOOL)isDismissing
{
  return [(UIPresentationController *)self->_presentationController state] == 3;
}

- (UITextInputSessionActionAnalytics)sessionAnalytics
{
  sessionAnalytics = self->_sessionAnalytics;
  if (!sessionAnalytics)
  {
    id v4 = objc_alloc_init(UITextInputSessionActionAnalytics);
    objc_super v5 = self->_sessionAnalytics;
    self->_sessionAnalytics = v4;

    [(UITextInputSessionActionAnalytics *)self->_sessionAnalytics setDelegateSource:self];
    sessionAnalytics = self->_sessionAnalytics;
  }
  return sessionAnalytics;
}

- (void)_makeResponderEditableIfNecessary
{
  v3 = [(UIKeyboardCameraSession *)self responder];
  char v4 = [v3 isFirstResponder];

  objc_super v5 = [(UIKeyboardCameraSession *)self responder];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
LABEL_6:
    if (v4) {
      return;
    }
    goto LABEL_7;
  }
  uint64_t v7 = [(UIKeyboardCameraSession *)self responder];
  if (([v7 isEditable] & 1) != 0 || !objc_msgSend(v7, "_shouldBecomeEditableUponFocus"))
  {

    goto LABEL_6;
  }
  [v7 setEditable:1];

LABEL_7:
  v8 = [(UIKeyboardCameraSession *)self responder];
  int v9 = [v8 canBecomeFirstResponder];

  if (v9)
  {
    *(_WORD *)&self->_shouldSuppressSoftwareKeyboard = 257;
    id v10 = [(UIKeyboardCameraSession *)self responder];
    [v10 becomeFirstResponder];
  }
}

- (void)_show
{
  if (+[UIKeyboard usesInputSystemUI])
  {
    [(UIKeyboardCameraSession *)self _makeResponderEditableIfNecessary];
    v13 = objc_alloc_init(UIKeyboardCameraSessionRTIConfiguration);
    [(UIKeyboardCameraSessionRTIConfiguration *)v13 setIsWebKitInteractionView:self->_isWebResponder];
    [(UIKeyboardCameraSessionRTIConfiguration *)v13 setIsSingleLineDocument:self->_isSingleLineDocument];
    [(UIKeyboardCameraSessionRTIConfiguration *)v13 setShouldSuppressKeyboard:self->_shouldSuppressSoftwareKeyboard];
    v3 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v3, "forwardKeyboardCameraEvent_startCameraInput:", v13);

    char v4 = [(UIKeyboardCameraSession *)self _textInputResponder];
    objc_super v5 = v4;
    if (v4 && self->_isSecureFieldEditor)
    {
      v6 = [v4 _inputController];
      [v6 clearText];

      uint64_t v7 = [v5 textField];
      [v7 setDisplaySecureTextUsingPlainText:1];
    }
    [(UIKeyboardCameraSession *)self _addObservers];
  }
  else if (+[UIKeyboardCameraViewController isEnabled])
  {
    v8 = objc_alloc_init(UIKeyboardCameraViewController);
    keyboardCameraViewController = self->_keyboardCameraViewController;
    self->_keyboardCameraViewController = v8;

    [(UIKeyboardCameraViewController *)self->_keyboardCameraViewController setDelegate:self];
    id v10 = [(UIKeyboardCameraSession *)self responder];
    v11 = +[UIKeyboardCameraSession keyboardCameraContentTypeForResponder:v10];
    [(UIKeyboardCameraViewController *)self->_keyboardCameraViewController setTextContentType:v11];

    [(UIViewController *)self->_keyboardCameraViewController setModalPresentationStyle:4];
    [(UIViewController *)self->_keyboardCameraViewController setTransitioningDelegate:self];
    objc_initWeak(&location, self);
    id v12 = self->_keyboardCameraViewController;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __32__UIKeyboardCameraSession__show__block_invoke;
    v14[3] = &unk_1E52DC888;
    objc_copyWeak(&v15, &location);
    [(UIKeyboardCameraViewController *)v12 prepareWithCompletion:v14];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

void __32__UIKeyboardCameraSession__show__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      id v3 = WeakRetained;
      [WeakRetained _keyboardCameraPreparationDidComplete];
      id WeakRetained = v3;
    }
  }
}

- (void)_keyboardCameraPreparationDidComplete
{
  if (!+[_UIRemoteKeyboards enabled])
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2 object:self file:@"UIKeyboardCameraSession.m" lineNumber:367 description:@"Keyboard Camera is being used without remote keyboards enabled"];
  }
  char v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"_UIKeyboardCameraSessionWillPresent" object:self];

  [(UIPresentationController *)self->_presentationController setDelegate:self];
  objc_super v5 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v6 = [v5 inputWindowRootViewController];

  uint64_t v7 = [v6 placement];
  self->_presentingOverKeyboard = [v7 showsKeyboard];

  if (!self->_presentingOverKeyboard)
  {
    v8 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v9 = (id)[v8 forceCreateKeyboardWindow];
  }
  id v10 = +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient];
  v11 = [v10 inputWindowRootViewController];

  BOOL v12 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || !self->_presentingOverKeyboard;
  objc_initWeak(&location, self);
  keyboardCameraViewController = self->_keyboardCameraViewController;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __64__UIKeyboardCameraSession__keyboardCameraPreparationDidComplete__block_invoke;
  v15[3] = &unk_1E52DC308;
  objc_copyWeak(&v16, &location);
  [v11 presentViewController:keyboardCameraViewController animated:v12 completion:v15];
  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __64__UIKeyboardCameraSession__keyboardCameraPreparationDidComplete__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"_UIKeyboardCameraSessionDidPresent" object:WeakRetained];

  v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _addObservers];
    v2 = WeakRetained;
  }
}

- (void)_keyboardAboutToHide:(id)a3
{
  char v4 = [a3 userInfo];
  objc_super v5 = [v4 objectForKeyedSubscript:@"UIKeyboardOriginatedFromRotationUserInfoKey"];
  char v6 = [v5 BOOLValue];

  if ((v6 & 1) == 0)
  {
    [(UIKeyboardCameraSession *)self keyboardCameraDidCancel];
  }
}

- (void)_firstResponderDidChange:(id)a3
{
  char v4 = [a3 userInfo];
  id v5 = [v4 objectForKeyedSubscript:@"UIWindowFirstResponderUserInfoKey"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [(UIKeyboardCameraSession *)self keyboardCameraDidCancel];
  }
}

- (void)_addObservers
{
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v3 = +[UIWindow _applicationKeyWindow];
  [v4 addObserver:self selector:sel__firstResponderDidChange_ name:@"UIWindowFirstResponderDidChangeNotification" object:v3];

  [v4 addObserver:self selector:sel__inputModeDidChange_ name:@"UITextInputCurrentInputModeDidChangeNotification" object:0];
  [v4 addObserver:self selector:sel__didEnterBackground_ name:@"UIApplicationDidEnterBackgroundNotification" object:UIApp];
  [v4 addObserver:self selector:sel__didEnterBackground_ name:@"UIApplicationWillResignActiveNotification" object:UIApp];
  [v4 addObserver:self selector:sel__keyboardAboutToHide_ name:@"UIKeyboardPrivateWillHideNotification" object:0];
}

- (id)_textInputResponder
{
  if (self->_isTextInputResponder) {
    responder = self->_responder;
  }
  else {
    responder = 0;
  }
  id v3 = responder;
  return v3;
}

- (void)_updatePreviewWithString:(id)a3
{
  id v6 = a3;
  id v4 = [(UIKeyboardCameraSession *)self _textInputResponder];
  if (v4)
  {
    if (!self->_respondsToKeyboardInputShouldInsertText
      || [(UIKeyInput *)self->_responder keyboardInput:self->_responder shouldInsertText:v6 isMarkedText:1])
    {
      objc_msgSend(v4, "setMarkedText:selectedRange:", v6, objc_msgSend(v6, "length"), 0);
    }
    if (+[UIKeyboard isInputSystemUI])
    {
      id v5 = +[UIKeyboardImpl activeInstance];
      objc_msgSend(v5, "forwardKeyboardCameraEvent_updatePreviewText:asMarkedText:", v6, 1);
    }
  }
}

- (void)_cleanupKeyboardCameraAndShouldInsertText:(BOOL)a3
{
  if (!self->_didCleanup)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self];

    uint64_t v6 = [(UIKeyboardCameraSession *)self _textInputResponder];
    uint64_t v7 = (void *)v6;
    if (a3)
    {
      NSUInteger v8 = [(NSString *)self->_keyboardCameraCandidateString length];
      BOOL v9 = v8 != 0;
      if (v7 && v8)
      {
        id v10 = [v7 inputDelegate];
        [v10 textWillChange:v7];

        BOOL v9 = 1;
      }
      else if (!v7)
      {
        char v13 = 1;
        if (!v8) {
          goto LABEL_22;
        }
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v9 = 0;
      uint64_t v11 = 0;
      if (!v6) {
        goto LABEL_27;
      }
    }
    if (!self->_isWebResponder || self->_isSingleLineDocument)
    {
      if (v9)
      {
        [v7 unmarkText];
        if (+[UIKeyboard isInputSystemUI])
        {
          BOOL v12 = +[UIKeyboardImpl activeInstance];
          objc_msgSend(v12, "forwardKeyboardCameraEvent_updatePreviewText:asMarkedText:", self->_keyboardCameraCandidateString, 0);
        }
        if (self->_isSecureFieldEditor) {
          [v7 _obscureAllText];
        }
LABEL_25:
        v18 = objc_msgSend(v7, "inputDelegate", v23, v24, v25, v26);
        [v18 textDidChange:v7];

LABEL_26:
        v19 = [(UIKeyboardCameraSession *)self sessionAnalytics];
        objc_msgSend(v19, "didInsertText:relativeRangeBefore:", self->_keyboardCameraCandidateString, 0, 0);

        uint64_t v11 = 1;
        goto LABEL_27;
      }
      [(UIKeyboardCameraSession *)self _updatePreviewWithString:&stru_1ED0E84C0];
      [v7 unmarkText];
      if (self->_isSecureFieldEditor) {
        [v7 _obscureAllText];
      }
LABEL_22:
      uint64_t v11 = 0;
LABEL_27:
      v20 = [(UIKeyboardCameraSession *)self sessionAnalytics];
      [v20 writeAnalytics];

      id v21 = [(UIKeyboardCameraViewController *)self->_keyboardCameraViewController textContentType];
      +[UIKBAnalyticsDispatcher keyboardCameraSessionEndedForTextContentType:v21 didFindText:self->_didFindText didInsertText:v11 sender:self->_sender];
      self->_shouldSuppressSoftwareKeyboard = 0;
      keyboardCameraCandidateString = self->_keyboardCameraCandidateString;
      self->_keyboardCameraCandidateString = 0;

      self->_didCleanup = 1;
      return;
    }
    char v13 = 0;
    if (!v9) {
      goto LABEL_22;
    }
LABEL_19:
    if (+[UIKeyboard isInputSystemUI])
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4FAE370]);
      [v14 insertText:self->_keyboardCameraCandidateString];
      id v15 = +[UIKeyboardImpl activeInstance];
      uint64_t v23 = MEMORY[0x1E4F143A8];
      uint64_t v24 = 3221225472;
      v25 = __69__UIKeyboardCameraSession__cleanupKeyboardCameraAndShouldInsertText___block_invoke;
      v26 = &unk_1E52D9F98;
      id v27 = v15;
      id v28 = v14;
      id v16 = v14;
      id v17 = v15;
      [v17 performOperations:&v23 withTextInputSource:7];
    }
    else
    {
      [(UIKeyInput *)self->_responder insertText:self->_keyboardCameraCandidateString];
    }
    if (v13) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
}

uint64_t __69__UIKeyboardCameraSession__cleanupKeyboardCameraAndShouldInsertText___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) performKeyboardOutput:*(void *)(a1 + 40)];
}

- (void)_dismissKeyboardCamera
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 postNotificationName:@"_UIKeyboardCameraSessionWillDismiss" object:self];

  objc_initWeak(&location, self);
  id v4 = [(UIViewController *)self->_keyboardCameraViewController presentingViewController];
  BOOL v5 = (UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1 || !self->_presentingOverKeyboard;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  BOOL v9 = __49__UIKeyboardCameraSession__dismissKeyboardCamera__block_invoke;
  id v10 = &unk_1E52DC308;
  objc_copyWeak(&v11, &location);
  [v4 dismissViewControllerAnimated:v5 completion:&v7];
  if (+[UIKeyboard isInputSystemUI])
  {
    uint64_t v6 = +[UIKeyboardImpl activeInstance];
    objc_msgSend(v6, "forwardKeyboardCameraEvent_selfDestruct");
  }
  objc_destroyWeak(&v11);

  objc_destroyWeak(&location);
}

void __49__UIKeyboardCameraSession__dismissKeyboardCamera__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v1 postNotificationName:@"_UIKeyboardCameraSessionDidDismiss" object:WeakRetained];

  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[1];
    WeakRetained[1] = 0;
  }
  id v3 = (void *)_activeSession;
  _activeSession = 0;
}

- (void)keyboardCameraDidUpdateString:(id)a3
{
  id obj = a3;
  if ([obj length]) {
    self->_didFindText = 1;
  }
  if (self->_isSingleLineDocument)
  {
    id v4 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
    BOOL v5 = [obj componentsSeparatedByCharactersInSet:v4];
    uint64_t v6 = [v5 componentsJoinedByString:@" "];

    uint64_t v7 = (void *)v6;
  }
  else
  {
    uint64_t v7 = obj;
  }
  id obja = v7;
  objc_storeStrong((id *)&self->_keyboardCameraCandidateString, v7);
  uint64_t v8 = [(UIKeyboardCameraSession *)self _textInputResponder];
  if (v8)
  {
    if (self->_isWebResponder)
    {
      if (!self->_isSingleLineDocument) {
        goto LABEL_13;
      }
      BOOL v9 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      id v10 = [obja componentsSeparatedByCharactersInSet:v9];
      id v11 = [v10 componentsJoinedByString:@" "];

      objc_storeStrong((id *)&self->_keyboardCameraCandidateString, v11);
      id v12 = v11;
    }
    else
    {
      id v12 = obja;
    }
    id obja = v12;
    -[UIKeyboardCameraSession _updatePreviewWithString:](self, "_updatePreviewWithString:");
    if (self->_isSecureFieldEditor) {
      [v8 _unobscureAllText];
    }
  }
LABEL_13:
}

- (void)keyboardCameraDidAccept
{
  [(UIKeyboardCameraSession *)self _cleanupKeyboardCameraAndShouldInsertText:1];
  [(UIKeyboardCameraSession *)self _dismissKeyboardCamera];
}

- (void)keyboardCameraDidCancel
{
  BOOL v3 = +[UIKeyboard usesInputSystemUI];
  [(UIKeyboardCameraSession *)self _cleanupKeyboardCameraAndShouldInsertText:0];
  if (v3)
  {
    [(UIKeyboardCameraSession *)self endActiveSession];
  }
  else
  {
    [(UIKeyboardCameraSession *)self _dismissKeyboardCamera];
  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    animationController = self->_animationController;
  }
  else {
    animationController = 0;
  }
  return animationController;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    animationController = self->_animationController;
  }
  else {
    animationController = 0;
  }
  return animationController;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7 = a4;
  id v8 = a3;
  if ((UIKeyboardGetSafeDeviceIdiom() & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    BOOL v9 = [(UIPresentationController *)[UIKeyboardCameraPadPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

    [(UIKeyboardCameraPadPresentationController *)v9 setDimmingViewDelegate:self];
    objc_storeStrong((id *)&self->_presentationController, v9);
    animationController = self->_animationController;
    self->_animationController = (UIViewControllerAnimatedTransitioning *)v9;
  }
  else
  {
    id v11 = [(UIPresentationController *)[UIKeyboardCameraOverlayPresentationController alloc] initWithPresentedViewController:v8 presentingViewController:v7];

    animationController = self->_presentationController;
    self->_presentationController = &v11->super;
  }

  [(UIKeyboardCameraBasePresentationController *)self->_presentationController setPresentingOverKeyboard:self->_presentingOverKeyboard];
  presentationController = self->_presentationController;
  return presentationController;
}

- (void)presentationControllerDidDismiss:(id)a3
{
  id v4 = [a3 presentedViewController];
  keyboardCameraViewController = self->_keyboardCameraViewController;

  if (v4 == keyboardCameraViewController)
  {
    [(UIKeyboardCameraSession *)self _cleanupKeyboardCameraAndShouldInsertText:0];
    uint64_t v6 = self->_keyboardCameraViewController;
    self->_keyboardCameraViewController = 0;
  }
}

- (id)_delegateAsResponder
{
  return self->_responder;
}

- (id)_sessionIdentifier
{
  v2 = +[UIKeyboardImpl activeInstance];
  BOOL v3 = [v2 _sessionIdentifier];

  return v3;
}

- (int64_t)_overrideTextInputSource
{
  return 7;
}

- (void)endActiveSession
{
  BOOL v3 = [(UIKeyboardCameraSession *)self _textInputResponder];
  id v7 = v3;
  if (v3 && self->_isSecureFieldEditor)
  {
    id v4 = [v3 textField];
    [v4 setDisplaySecureTextUsingPlainText:0];

    [v7 _obscureAllText];
  }
  if (self->_shouldResignFirstResponderWhenDone && [v7 isFirstResponder]) {
    [v7 resignFirstResponder];
  }
  self->_shouldResignFirstResponderWhenDone = 0;
  keyboardCameraViewController = self->_keyboardCameraViewController;
  self->_keyboardCameraViewController = 0;

  self->_shouldSuppressSoftwareKeyboard = 0;
  uint64_t v6 = (void *)_activeSession;
  _activeSession = 0;
}

- (BOOL)shouldSuppressSoftwareKeyboard
{
  return self->_shouldSuppressSoftwareKeyboard;
}

- (void)setShouldSuppressSoftwareKeyboard:(BOOL)a3
{
  self->_shouldSuppressSoftwareKeyboard = a3;
}

- (UIKeyInput)responder
{
  return self->_responder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responder, 0);
  objc_storeStrong((id *)&self->_sessionAnalytics, 0);
  objc_storeStrong(&self->_sender, 0);
  objc_storeStrong((id *)&self->_keyboardCameraCandidateString, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_presentationController, 0);
  objc_storeStrong((id *)&self->_keyboardCameraViewController, 0);
}

@end