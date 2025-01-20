@interface UIKBLocalAuthenticationObserver
- (BOOL)_applicationStateIsActive;
- (BOOL)inputUIResuming;
- (BOOL)isRestoringInputViews;
- (BOOL)isRestoringPreLocalAuthenticationDelegate;
- (BOOL)localAuthenticationPresented;
- (BOOL)localAuthenticationPresentedOrBeingRecoveredFrom;
- (NSUUID)uuidOfDelegateResignedDuringLocalAuthentication;
- (NSUUID)uuidOfSessionEndedDuringLocalAuthentication;
- (UIKBLocalAuthenticationObserver)init;
- (UIKeyInput)delegateResignedDuringLocalAuthentication;
- (id)sessionIDForInputDelegate:(id)a3;
- (void)_applicationResumed:(id)a3;
- (void)_localAuthenticationDismissed;
- (void)_localAuthenticationPresented;
- (void)_startListeningForLAUINotificationsIfNeeded;
- (void)_stopListeningForLAUINotifications;
- (void)dealloc;
- (void)didTryToBecomeFirstResponder:(id)a3;
- (void)inputDelegateWillTeardown:(id)a3 sessionUUID:(id)a4;
- (void)setDelegateResignedDuringLocalAuthentication:(id)a3;
- (void)setInputUIResuming:(BOOL)a3;
- (void)setIsRestoringInputViews:(BOOL)a3;
- (void)setIsRestoringPreLocalAuthenticationDelegate:(BOOL)a3;
- (void)setLocalAuthenticationPresented:(BOOL)a3;
- (void)setUuidOfDelegateResignedDuringLocalAuthentication:(id)a3;
- (void)setUuidOfSessionEndedDuringLocalAuthentication:(id)a3;
- (void)willTryToBecomeFirstResponder:(id)a3;
@end

@implementation UIKBLocalAuthenticationObserver

- (void)willTryToBecomeFirstResponder:(id)a3
{
  id v8 = a3;
  if (+[UIKeyboard isInputSystemUI]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [v8 _rtiSourceSession];
    v5 = [(UIKBLocalAuthenticationObserver *)self uuidOfSessionEndedDuringLocalAuthentication];
    v6 = [v4 uuid];
    int v7 = [v5 isEqual:v6];

    if (v7) {
      [(UIKBLocalAuthenticationObserver *)self setIsRestoringPreLocalAuthenticationDelegate:1];
    }
  }
}

- (void)didTryToBecomeFirstResponder:(id)a3
{
  id v8 = a3;
  if (+[UIKeyboard isInputSystemUI]
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = [v8 _rtiSourceSession];
    v5 = [(UIKBLocalAuthenticationObserver *)self uuidOfSessionEndedDuringLocalAuthentication];
    v6 = [v4 uuid];
    int v7 = [v5 isEqual:v6];

    if (v7) {
      [(UIKBLocalAuthenticationObserver *)self setIsRestoringPreLocalAuthenticationDelegate:0];
    }
  }
}

- (UIKBLocalAuthenticationObserver)init
{
  v6.receiver = self;
  v6.super_class = (Class)UIKBLocalAuthenticationObserver;
  v2 = [(UIKBLocalAuthenticationObserver *)&v6 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__startListeningForLAUINotificationsIfNeeded name:@"UIApplicationDidBecomeActiveNotification" object:0];

    v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v2 selector:sel__stopListeningForLAUINotifications name:@"UIApplicationDidEnterBackgroundNotification" object:0];

    [(UIKBLocalAuthenticationObserver *)v2 _startListeningForLAUINotificationsIfNeeded];
  }
  return v2;
}

- (void)_startListeningForLAUINotificationsIfNeeded
{
  if (!self->_isListeningForLAUINotifications)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)UIKBLADarwinUIPresented_0, @"com.apple.LocalAuthentication.ui.presented", 0, (CFNotificationSuspensionBehavior)0);
    v4 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v4, self, (CFNotificationCallback)UIKBLADarwinUIDismissed_0, @"com.apple.LocalAuthentication.ui.dismissed", 0, (CFNotificationSuspensionBehavior)0);
    self->_isListeningForLAUINotifications = 1;
  }
}

- (void)dealloc
{
  [(UIKBLocalAuthenticationObserver *)self _stopListeningForLAUINotifications];
  v3.receiver = self;
  v3.super_class = (Class)UIKBLocalAuthenticationObserver;
  [(UIKBLocalAuthenticationObserver *)&v3 dealloc];
}

- (id)sessionIDForInputDelegate:(id)a3
{
  id v4 = a3;
  if (!+[UIKeyboard isInputSystemUI]
    && ([(UIKBLocalAuthenticationObserver *)self delegateResignedDuringLocalAuthentication], id v5 = (id)objc_claimAutoreleasedReturnValue(), v5, v5 == v4))
  {
    objc_super v6 = [(UIKBLocalAuthenticationObserver *)self uuidOfDelegateResignedDuringLocalAuthentication];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)inputDelegateWillTeardown:(id)a3 sessionUUID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  BOOL v7 = +[UIKeyboard isInputSystemUI];
  BOOL v8 = [(UIKBLocalAuthenticationObserver *)self localAuthenticationPresented];
  if (v7)
  {
    if (v8) {
      [(UIKBLocalAuthenticationObserver *)self setUuidOfSessionEndedDuringLocalAuthentication:v6];
    }
  }
  else if (v8)
  {
    [(UIKBLocalAuthenticationObserver *)self setDelegateResignedDuringLocalAuthentication:v9];
    [(UIKBLocalAuthenticationObserver *)self setUuidOfDelegateResignedDuringLocalAuthentication:v6];
  }
}

- (BOOL)_applicationStateIsActive
{
  if (![(id)UIApp applicationState]) {
    return 1;
  }
  v2 = +[UIWindow _applicationKeyWindow];
  char v3 = [v2 _isHostedInAnotherProcess];

  return v3;
}

- (void)_localAuthenticationPresented
{
  [(UIKBLocalAuthenticationObserver *)self setLocalAuthenticationPresented:1];
  id v5 = +[UIKeyboardImpl activeInstance];
  if ([v5 textInputTraitsNeedAutofill]
    && [(UIKBLocalAuthenticationObserver *)self _applicationStateIsActive])
  {
    if (+[UIKeyboard isKeyboardProcess])
    {
      BOOL v3 = +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI];

      if (!v3) {
        return;
      }
    }
    else
    {
    }
    id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v4 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v5 _preserveInputViewsWithId:v4 animated:1 reset:0];
  }
}

- (void)_localAuthenticationDismissed
{
  [(UIKBLocalAuthenticationObserver *)self setLocalAuthenticationPresented:0];
  if (+[UIKeyboard isInputSystemUI]
    && ![(UIKBLocalAuthenticationObserver *)self _applicationStateIsActive])
  {
    [(UIKBLocalAuthenticationObserver *)self setInputUIResuming:1];
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:self selector:sel__applicationResumed_ name:@"UIApplicationResumedNotification" object:UIApp];
  }
  if (!+[UIKeyboard isKeyboardProcess]
    || +[UIKeyboard usesInputSystemUIForAutoFillOnlyWithRTI])
  {
    [(UIKBLocalAuthenticationObserver *)self setIsRestoringInputViews:1];
    id v4 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
    id v5 = [MEMORY[0x1E4F29238] valueWithPointer:self];
    [v4 _restoreInputViewsWithId:v5 animated:1];

    [(UIKBLocalAuthenticationObserver *)self setIsRestoringInputViews:0];
  }
}

- (void)_applicationResumed:(id)a3
{
  [(UIKBLocalAuthenticationObserver *)self setInputUIResuming:0];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:@"UIApplicationResumedNotification" object:0];
}

- (BOOL)localAuthenticationPresentedOrBeingRecoveredFrom
{
  if ([(UIKBLocalAuthenticationObserver *)self localAuthenticationPresented]
    || [(UIKBLocalAuthenticationObserver *)self isRestoringPreLocalAuthenticationDelegate]|| [(UIKBLocalAuthenticationObserver *)self isRestoringInputViews])
  {
    return 1;
  }
  return [(UIKBLocalAuthenticationObserver *)self inputUIResuming];
}

- (void)_stopListeningForLAUINotifications
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.LocalAuthentication.ui.presented", 0);
  id v4 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v4, self, @"com.apple.LocalAuthentication.ui.dismissed", 0);
  self->_isListeningForLAUINotifications = 0;
}

- (BOOL)localAuthenticationPresented
{
  return self->_localAuthenticationPresented;
}

- (void)setLocalAuthenticationPresented:(BOOL)a3
{
  self->_localAuthenticationPresented = a3;
}

- (UIKeyInput)delegateResignedDuringLocalAuthentication
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateResignedDuringLocalAuthentication);
  return (UIKeyInput *)WeakRetained;
}

- (void)setDelegateResignedDuringLocalAuthentication:(id)a3
{
}

- (NSUUID)uuidOfDelegateResignedDuringLocalAuthentication
{
  return self->_uuidOfDelegateResignedDuringLocalAuthentication;
}

- (void)setUuidOfDelegateResignedDuringLocalAuthentication:(id)a3
{
}

- (NSUUID)uuidOfSessionEndedDuringLocalAuthentication
{
  return self->_uuidOfSessionEndedDuringLocalAuthentication;
}

- (void)setUuidOfSessionEndedDuringLocalAuthentication:(id)a3
{
}

- (BOOL)isRestoringPreLocalAuthenticationDelegate
{
  return self->_isRestoringPreLocalAuthenticationDelegate;
}

- (void)setIsRestoringPreLocalAuthenticationDelegate:(BOOL)a3
{
  self->_isRestoringPreLocalAuthenticationDelegate = a3;
}

- (BOOL)inputUIResuming
{
  return self->_inputUIResuming;
}

- (void)setInputUIResuming:(BOOL)a3
{
  self->_inputUIResuming = a3;
}

- (BOOL)isRestoringInputViews
{
  return self->_isRestoringInputViews;
}

- (void)setIsRestoringInputViews:(BOOL)a3
{
  self->_isRestoringInputViews = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uuidOfSessionEndedDuringLocalAuthentication, 0);
  objc_storeStrong((id *)&self->_uuidOfDelegateResignedDuringLocalAuthentication, 0);
  objc_destroyWeak((id *)&self->_delegateResignedDuringLocalAuthentication);
}

@end