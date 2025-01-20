@interface ACMExternalAppleConnectImpl
+ (void)initialize;
- (ACC2SVControllerProtocol)twoSVController;
- (ACMAppleConnectImplComponents)components;
- (ACMExternalAppleConnectDelegate)delegate;
- (ACMExternalAppleConnectImpl)initWithMasterObject:(id)a3;
- (ACMExternalAuthenticationController)authenticationController;
- (ACMExternalAuthenticationRequestImpl)currentRequest;
- (ACMExternalUIControllerProtocol)uiController;
- (BOOL)canHideSignInDialog;
- (BOOL)isWidgetShown;
- (BOOL)shouldReleaseOnMemoryWarning;
- (BOOL)signInAnimated;
- (id)hideAppleConnectSignInDialog;
- (id)masterObject;
- (id)parentViewController;
- (int64_t)appleConnectState;
- (int64_t)logLevel;
- (unint64_t)signInDialogContentStyle;
- (void)applicationDidEnterBackground:(id)a3;
- (void)authenticateRunningOnMainThreadWithRequest:(id)a3;
- (void)authenticateWithRequest:(id)a3 password:(id)a4;
- (void)authenticationController:(id)a3 perform2StepVerificationWithRequest:(id)a4 completion:(id)a5;
- (void)authenticationController:(id)a3 scheduleHandler:(id)a4 withCompletion:(id)a5;
- (void)cancelRequests;
- (void)dealloc;
- (void)hideSignIn;
- (void)onManageAppleIDForRealm:(id)a3;
- (void)reportError:(id)a3;
- (void)returnError:(id)a3 withSelector:(SEL)a4 withResponseClass:(Class)a5;
- (void)returnResponse:(id)a3 withSelector:(SEL)a4;
- (void)setAppleConnectState:(int64_t)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogLevel:(int64_t)a3;
- (void)setMasterObject:(id)a3;
- (void)setTwoSVController:(id)a3;
- (void)showSignInDialog;
- (void)showSignInWithRequest:(id)a3;
- (void)signInDialogDidHide;
- (void)signInDialogWillHide;
- (void)twoSVController:(id)a3 openMyAppleConnectForRealm:(id)a4;
- (void)twoSVController:(id)a3 prepareUIWithCompletion:(id)a4;
- (void)twoSVControllerEnterCredentials:(id)a3;
- (void)twoSVControllerWillClose:(id)a3;
- (void)twoSVTransportController:(id)a3 fetchImageWithHandler:(id)a4 completion:(id)a5;
- (void)twoSVTransportController:(id)a3 scheduleHandler:(id)a4 withCompletion:(id)a5;
- (void)twoSVTransportControllerCancelFetchingImages:(id)a3;
- (void)uiControllerDidDisableSignInDialog:(id)a3;
- (void)uiControllerDidEnableSignInDialog:(id)a3;
- (void)uiControllerOnSignIForgot:(id)a3;
- (void)uiControllerOnSignIn:(id)a3 withPassword:(id)a4;
- (void)uiControllerOnSignInCancel:(id)a3;
- (void)uiControllerWillDisableSignInDialog:(id)a3;
- (void)uiControllerWillEnableSignInDialog:(id)a3;
- (void)verifyServiceTicket:(id)a3;
@end

@implementation ACMExternalAppleConnectImpl

+ (void)initialize
{
  +[ACMLocale initResources];

  +[ACMExternalTicketManager initialize];
}

- (ACMExternalAppleConnectImpl)initWithMasterObject:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ACMExternalAppleConnectImpl;
  v4 = [(ACMAppleConnectImpl *)&v9 init];
  v5 = v4;
  if (v4)
  {
    [(ACMExternalAppleConnectImpl *)v4 setMasterObject:a3];
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACMExternalAppleConnectImpl initWithMasterObject:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 79, 0, "Creating instance...");
    }
    [[[MEMORY[0x263F1C5C0] currentDevice] systemVersion] doubleValue];
    if (v6 >= 4.0)
    {
      v7 = (void *)[MEMORY[0x263F08A00] defaultCenter];
      [v7 addObserver:v5 selector:sel_applicationDidEnterBackground_ name:*MEMORY[0x263F1D050] object:0];
    }
    [(ACMExternalAppleConnectImpl *)v5 setAppleConnectState:0];
  }
  return v5;
}

- (ACC2SVControllerProtocol)twoSVController
{
  result = self->_twoSVController;
  if (!result)
  {
    v4 = [(ACMAppleConnectImplComponents *)[(ACMExternalAppleConnectImpl *)self components] twoSVController];
    self->_twoSVController = v4;
    [(ACC2SVControllerProtocol *)v4 setDelegate:self];
    [(ACC2SVControllerProtocol *)self->_twoSVController setSecondFactorAuthUIController:[[ACM2SVAuthenticationUIController alloc] initWithParentViewController:[(ACMExternalAppleConnectImpl *)self parentViewController]]];
    id v5 = (id)objc_opt_new();
    [v5 setDelegate:self];
    [(ACC2SVControllerProtocol *)self->_twoSVController setTransportController:v5];
    return self->_twoSVController;
  }
  return result;
}

- (void)dealloc
{
  [(ACMExternalAppleConnectImpl *)self setMasterObject:0];
  [objc_msgSend(objc_msgSend(objc_msgSend(MEMORY[0x263F1C5C0], "currentDevice"), "systemVersion"), "floatValue"];
  if (v3 >= 4.0)
  {
    v4 = (void *)[MEMORY[0x263F08A00] defaultCenter];
    [v4 removeObserver:self name:*MEMORY[0x263F1D050] object:0];
  }
  [(ACMExternalAuthenticationController *)[(ACMExternalAppleConnectImpl *)self authenticationController] setDelegate:0];
  [(ACMExternalAppleConnectImpl *)self setAuthenticationController:0];
  v5.receiver = self;
  v5.super_class = (Class)ACMExternalAppleConnectImpl;
  [(ACMAppleConnectImpl *)&v5 dealloc];
}

- (ACMExternalUIControllerProtocol)uiController
{
  v2 = [(ACMExternalAppleConnectImpl *)self components];

  return [(ACMAppleConnectImplComponents *)v2 uiController];
}

- (ACMAppleConnectImplComponents)components
{
  return (ACMAppleConnectImplComponents *)+[ACMExternalAppleConnectImplComponents components];
}

- (ACMExternalAuthenticationController)authenticationController
{
  result = self->_authenticationController;
  if (!result)
  {
    v4 = (ACMExternalAuthenticationController *)objc_opt_new();
    self->_authenticationController = v4;
    [(ACMExternalAuthenticationController *)v4 setDelegate:self];
    return self->_authenticationController;
  }
  return result;
}

- (BOOL)isWidgetShown
{
  int v3 = [(ACMAppleConnectImplComponents *)[(ACMExternalAppleConnectImpl *)self components] uiControllerLoaded];
  if (v3)
  {
    v4 = [(ACMExternalAppleConnectImpl *)self uiController];
    LOBYTE(v3) = [(ACMExternalUIControllerProtocol *)v4 isWidgetShown];
  }
  return v3;
}

- (void)setDelegate:(id)a3
{
  if (a3 && ![a3 conformsToProtocol:&unk_26F290A10]) {
    objc_exception_throw((id)[MEMORY[0x263EFF940] exceptionWithName:@"InvalidDelegateException" reason:@"Delegate does not conform to ACMExternalAppleConnectDelegate protocol" userInfo:0]);
  }
  self->_delegate = (ACMExternalAppleConnectDelegate *)a3;
}

- (BOOL)signInAnimated
{
  [(ACMExternalAppleConnectImpl *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 1;
  }
  int v3 = [(ACMExternalAppleConnectImpl *)self delegate];
  id v4 = [(ACMExternalAppleConnectImpl *)self masterObject];

  return [(ACMExternalAppleConnectDelegate *)v3 appleConnectSignInAnimated:v4];
}

- (id)parentViewController
{
  int v3 = [(ACMExternalAppleConnectImpl *)self delegate];
  id v4 = [(ACMExternalAppleConnectImpl *)self masterObject];

  return (id)[(ACMExternalAppleConnectDelegate *)v3 appleConnectParentViewController:v4];
}

- (id)hideAppleConnectSignInDialog
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl hideAppleConnectSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 173, 0, "Client application tries hide AppleConnect SignIn dialog manually");
  }
  if ([(ACMExternalAppleConnectImpl *)self appleConnectState] == 1)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
        ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl hideAppleConnectSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 177, 0, "AppleConnect in proper state and will hide  SignIn dialog manually");
      }
    }
    [(ACMExternalAppleConnectImpl *)self hideSignIn];
    [(ACMExternalAppleConnectImpl *)self setAppleConnectState:0];
    return 0;
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl hideAppleConnectSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 183, 0, "AppleConnect is not in proper state. SignIn dialog won't be hidden manually. Returning error!");
    }
    id v4 = (void *)MEMORY[0x263F087E8];
    objc_super v5 = NSDictionary;
    id v6 = +[ACMBaseLocale localizedString:@"Improper call of the method. AppleConnect SignIn dialog cannot be hidden."];
    uint64_t v7 = [v5 dictionaryWithObjectsAndKeys:v6, *MEMORY[0x263F08338], 0];
    return (id)[v4 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-600181 userInfo:v7];
  }
}

- (void)showSignInWithRequest:(id)a3
{
  if ([(ACMExternalAppleConnectImpl *)self appleConnectState] == 1
    && [(ACMExternalAppleConnectImpl *)self isWidgetShown])
  {
    [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setWidgetEnabled:1];
    [(ACMExternalAppleConnectImpl *)self setAppleConnectState:0];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl showSignInWithRequest:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 198, 0, "AppleConnect will show SignIn dialog and inform delegate");
    }
    [(ACMExternalAppleConnectImpl *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectWillShowSignInDialog:[(ACMExternalAppleConnectImpl *)self masterObject]];
    }
    [(ACMExternalAppleConnectImpl *)self setCurrentRequest:a3];
    [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setRequest:[(ACMExternalAppleConnectImpl *)self currentRequest]];
    if ([a3 useAlertView])
    {
      uint64_t v5 = 0;
    }
    else
    {
      [(ACMExternalAppleConnectImpl *)self delegate];
      if ((objc_opt_respondsToSelector() & 1) != 0
        && [(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectUseCustomAppearance:[(ACMExternalAppleConnectImpl *)self masterObject]])
      {
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          [(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectWidgetPosition:[(ACMExternalAppleConnectImpl *)self masterObject]];
          -[ACMExternalUIControllerProtocol setWidgetPosition:]([(ACMExternalAppleConnectImpl *)self uiController], "setWidgetPosition:", v6, v7);
        }
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setWidgetAccountLabel:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectAccountLabel:[(ACMExternalAppleConnectImpl *)self masterObject]]];
        }
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setWidgetPasswordReturnKeyType:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectPasswordFieldsReturnKeyType:[(ACMExternalAppleConnectImpl *)self masterObject]]];
        }
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector())
        {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setSignInButton:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectSignInButton:[(ACMExternalAppleConnectImpl *)self masterObject]]];
          [(ACMExternalAppleConnectImpl *)self delegate];
          if (objc_opt_respondsToSelector()) {
            [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setShouldAuthenticateOnUserInput:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectShouldAuthenticateOnUserInput:[(ACMExternalAppleConnectImpl *)self masterObject]]];
          }
        }
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setCancelButton:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectCancelButton:[(ACMExternalAppleConnectImpl *)self masterObject]]];
        }
        uint64_t v5 = 2;
      }
      else
      {
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setLogoImage:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectStandardLogoImage:[(ACMExternalAppleConnectImpl *)self masterObject]]];
        }
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setBackgroundColor:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectStandardBackgroundColor:[(ACMExternalAppleConnectImpl *)self masterObject]]];
        }
        [(ACMExternalAppleConnectImpl *)self delegate];
        if (objc_opt_respondsToSelector()) {
          [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setAccountNameFieldPlaceholder:[(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectStandardAccountNameFieldPlaceholder:[(ACMExternalAppleConnectImpl *)self masterObject]]];
        }
        uint64_t v5 = 1;
      }
    }
    [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setSignInStyle:v5];
    v8 = [(ACMExternalAppleConnectImpl *)self uiController];
    id v9 = [(ACMExternalAppleConnectImpl *)self parentViewController];
    BOOL v10 = [(ACMExternalAppleConnectImpl *)self signInAnimated];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__ACMExternalAppleConnectImpl_showSignInWithRequest___block_invoke;
    v11[3] = &unk_265043B90;
    v11[4] = self;
    [(ACMExternalUIControllerProtocol *)v8 showSignInWidgetWithParentViewController:v9 animated:v10 completion:v11];
  }
}

uint64_t __53__ACMExternalAppleConnectImpl_showSignInWithRequest___block_invoke(uint64_t a1)
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl showSignInWithRequest:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 261, 0, "AppleConnect has shown SignIn dialog and would inform delegate");
  }
  [*(id *)(a1 + 32) delegate];
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    int v3 = (void *)[*(id *)(a1 + 32) delegate];
    uint64_t v4 = [*(id *)(a1 + 32) masterObject];
    return [v3 appleConnectDidShowSignInDialog:v4];
  }
  return result;
}

- (void)hideSignIn
{
  if ([(ACMExternalAppleConnectImpl *)self isWidgetShown])
  {
    [(ACMExternalAppleConnectImpl *)self signInDialogWillHide];
    int v3 = [(ACMExternalAppleConnectImpl *)self uiController];
    id v4 = [(ACMExternalAppleConnectImpl *)self parentViewController];
    BOOL v5 = [(ACMExternalAppleConnectImpl *)self signInAnimated];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __41__ACMExternalAppleConnectImpl_hideSignIn__block_invoke;
    v6[3] = &unk_265043B90;
    v6[4] = self;
    [(ACMExternalUIControllerProtocol *)v3 hideSignInWidgetWithParentViewController:v4 animated:v5 completion:v6];
  }
}

uint64_t __41__ACMExternalAppleConnectImpl_hideSignIn__block_invoke(uint64_t a1)
{
  [objc_msgSend(*(id *)(a1 + 32), "components") unloadUIController];
  v2 = *(void **)(a1 + 32);

  return [v2 signInDialogDidHide];
}

- (void)authenticateRunningOnMainThreadWithRequest:(id)a3
{
  id v5 = (id)[a3 copy];
  if (objc_msgSend((id)objc_msgSend(v5, "realm"), "length")
    && objc_msgSend((id)objc_msgSend(v5, "appID"), "unsignedLongLongValue")
    && objc_msgSend((id)objc_msgSend(v5, "appIDKey"), "length")
    || (id v6 = +[ACMBaseLocale localizedString:@"Invalid Parameters. Some of input parameters are set incorrectly."]) == 0)
  {
    [(ACMExternalAppleConnectImpl *)self delegate];
    if ((objc_opt_respondsToSelector() & 1) != 0
      && [(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectUseCustomAppearance:[(ACMExternalAppleConnectImpl *)self masterObject]])
    {
      [(ACMExternalAppleConnectImpl *)self showSignInWithRequest:a3];
      char v9 = 1;
    }
    else
    {
      char v9 = 0;
    }
    BOOL v10 = [(ACMExternalAppleConnectImpl *)self authenticationController];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __74__ACMExternalAppleConnectImpl_authenticateRunningOnMainThreadWithRequest___block_invoke;
    v11[3] = &unk_265043BE0;
    v11[4] = self;
    void v11[5] = a3;
    v11[6] = v5;
    char v12 = v9;
    [(ACMExternalAuthenticationController *)v10 evaluateSSOWithRequest:v5 completion:v11];
  }
  else
  {
    uint64_t v7 = [MEMORY[0x263F087E8] errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200190 userInfo:[NSDictionary dictionaryWithObject:v6 forKey:@"ACCAppleConnectErrorDomain"]];
    uint64_t v8 = objc_opt_class();
    [(ACMExternalAppleConnectImpl *)self returnError:v7 withSelector:sel_appleConnect_authenticationDidEndWithResponse_ withResponseClass:v8];
  }
}

uint64_t __74__ACMExternalAppleConnectImpl_authenticateRunningOnMainThreadWithRequest___block_invoke(uint64_t a1, void *a2, void *a3)
{
  if (a2 || !a3)
  {
    if ([a2 code] == -200050)
    {
      BOOL v10 = *(void **)(a1 + 32);
      return [v10 reportError:a2];
    }
    else
    {
      uint64_t result = [[*(id *)(a1 + 40) userName] length];
      if (a3)
      {
        if (!result)
        {
          uint64_t result = [*(id *)(a1 + 48) useAlertView];
          if ((result & 1) == 0) {
            uint64_t result = [*(id *)(a1 + 40) setUserName:[objc_msgSend((id)objc_msgSend(a3, "principal"), "userName")];
          }
        }
      }
      if (!*(unsigned char *)(a1 + 56))
      {
        v11 = *(void **)(a1 + 32);
        uint64_t v12 = *(void *)(a1 + 40);
        return [v11 showSignInWithRequest:v12];
      }
    }
  }
  else
  {
    uint64_t v6 = [[[*(id *)(a1 + 32) components] ticketManager] serviceTicketStringWithRequest:*(void *)(a1 + 48) ssoToken:a3];
    id v7 = +[ACMAuthenticationResponseImpl authenticationResponse];
    [v7 setToken:v6];
    [v7 setUserName:[objc_msgSend((id)objc_msgSend(a3, "principal"), "userName")];
    [v7 setGeneratedWithTouchID:1];
    uint64_t v8 = *(void **)(a1 + 32);
    return [v8 returnResponse:v7 withSelector:sel_appleConnect_authenticationDidEndWithResponse_];
  }
  return result;
}

- (void)authenticateWithRequest:(id)a3 password:(id)a4
{
  [a3 setUserName:[((id)objc_msgSend(a3, "userName")) lowercaseString]];
  id v7 = [(ACMExternalAppleConnectImpl *)self authenticationController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __64__ACMExternalAppleConnectImpl_authenticateWithRequest_password___block_invoke;
  v8[3] = &unk_265043C08;
  v8[4] = self;
  v8[5] = a3;
  [(ACMExternalAuthenticationController *)v7 authenticateWithRequest:a3 password:a4 completion:v8];
}

uint64_t __64__ACMExternalAppleConnectImpl_authenticateWithRequest_password___block_invoke(uint64_t result, uint64_t a2, void *a3)
{
  uint64_t v3 = result;
  if (a2)
  {
    id v4 = *(void **)(result + 32);
    return [v4 reportError:a2];
  }
  else if (a3)
  {
    uint64_t v6 = [[[*(id *)(result + 32) components] ticketManager] serviceTicketStringWithRequest:*(void *)(result + 40) ssoToken:a3];
    id v7 = +[ACMAuthenticationResponseImpl authenticationResponse];
    [v7 setToken:v6];
    [v7 setUserName:[objc_msgSend((id)objc_msgSend(a3, "principal"), "userName")];
    uint64_t v8 = *(void **)(v3 + 32);
    return [v8 returnResponse:v7 withSelector:sel_appleConnect_authenticationDidEndWithResponse_];
  }
  return result;
}

- (void)verifyServiceTicket:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl verifyServiceTicket:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 366, 0, "Verifying service ticket...");
  }
  id v5 = objc_opt_new();
  uint64_t v6 = [(ACMExternalAppleConnectImpl *)self authenticationController];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __51__ACMExternalAppleConnectImpl_verifyServiceTicket___block_invoke;
  v7[3] = &unk_265043C30;
  v7[4] = self;
  [(ACMExternalAuthenticationController *)v6 verifyServiceTicketWithRequest:a3 completion:v7];
  [v5 drain];
}

uint64_t __51__ACMExternalAppleConnectImpl_verifyServiceTicket___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v5 = objc_opt_class();
    return [v3 returnError:a2 withSelector:sel_appleConnect_ticketVerificationDidEndWithResponse_ withResponseClass:v5];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    return [v7 returnResponse:a3 withSelector:sel_appleConnect_ticketVerificationDidEndWithResponse_];
  }
}

- (int64_t)logLevel
{
  return [(ACMAppleConnectPreferences *)[(ACMAppleConnectImplComponents *)[(ACMExternalAppleConnectImpl *)self components] preferences] logLevel];
}

- (void)setLogLevel:(int64_t)a3
{
  id v4 = [(ACMAppleConnectImplComponents *)[(ACMExternalAppleConnectImpl *)self components] preferences];

  [(ACMAppleConnectPreferences *)v4 setLogLevel:a3];
}

- (BOOL)shouldReleaseOnMemoryWarning
{
  return 0;
}

- (void)cancelRequests
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl cancelRequests]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 414, 0, "Sign in cancelled");
  }
  uint64_t v3 = (void *)[MEMORY[0x263F08A00] defaultCenter];
  [v3 postNotification:[MEMORY[0x263F089F8] notificationWithName:@"CancelRequests" object:self]];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  uint64_t v5 = __45__ACMExternalAppleConnectImpl_cancelRequests__block_invoke;
  uint64_t v6 = &unk_265043B90;
  id v7 = self;
  if ([(ACMExternalAppleConnectImpl *)self isWidgetShown])
  {
    [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] cancelSignInWidget];
    [(ACMExternalAppleConnectImpl *)self setAppleConnectState:0];
    [(ACC2SVControllerProtocol *)[(ACMExternalAppleConnectImpl *)self twoSVController] cancelWithCompletion:v4];
  }
  else
  {
    v5((uint64_t)v4);
  }
}

uint64_t __45__ACMExternalAppleConnectImpl_cancelRequests__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = NSDictionary;
  id v4 = +[ACMBaseLocale localizedString:@"Authentication was canceled by application"];
  uint64_t v5 = [v2 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200060 userInfo:[v3 dictionaryWithObject:v4 forKey:MEMORY[0x263F08320]]];
  uint64_t v6 = objc_opt_class();

  return [v1 returnError:v5 withSelector:sel_appleConnect_authenticationDidEndWithResponse_ withResponseClass:v6];
}

- (void)reportError:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl reportError:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 438, 0, "Reporting about error %@", a3);
  }
  uint64_t v5 = [a3 code];
  if (a3)
  {
    uint64_t v6 = v5;
    if ([(ACMExternalAppleConnectImpl *)self isWidgetShown])
    {
      id v7 = +[ACMBaseLocale localizedString:@"OK"];
      if (v6 > -100401)
      {
        if (v6 > -100119)
        {
          if (v6 == -100118 || v6 == -100102 || v6 == -100104)
          {
            uint64_t v8 = [NSString stringWithFormat:@"%@", [a3 localizedDescription]];
            id v7 = +[ACMBaseLocale localizedString:@"iForgot…"];
            id v9 = +[ACMBaseLocale localizedString:@"OK"];
            uint64_t v6 = -100102;
            if (!v8) {
              return;
            }
LABEL_32:
            v18 = [(ACMExternalAppleConnectImpl *)self uiController];
            [(ACMExternalUIControllerProtocol *)v18 showAlertWithAlertMessage:v8 buttonTitle:v9 cancelButtonTitle:v7 errorTag:v6];
            return;
          }
          goto LABEL_30;
        }
        if (v6 == -100400 || v6 == -100125)
        {
LABEL_23:
          id v16 = (id)[NSString stringWithFormat:@"%@", [a3 localizedDescription]];
          goto LABEL_31;
        }
LABEL_30:
        id v16 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
LABEL_31:
        uint64_t v8 = (uint64_t)v16;
        id v9 = 0;
        if (!v16) {
          return;
        }
        goto LABEL_32;
      }
      if (v6 > -200061)
      {
        if (v6 == -200060)
        {
LABEL_27:
          uint64_t v17 = objc_opt_class();
          [(ACMExternalAppleConnectImpl *)self returnError:a3 withSelector:sel_appleConnect_authenticationDidEndWithResponse_ withResponseClass:v17];
          return;
        }
        uint64_t v15 = -3442;
      }
      else
      {
        if (v6 == -200210) {
          goto LABEL_23;
        }
        uint64_t v15 = -3582;
      }
      if (v6 != (v15 & 0xFFFFFFFF0000FFFFLL | 0xFFFC0000)) {
        goto LABEL_30;
      }
      goto LABEL_27;
    }
    if (v6 == -200200)
    {
      BOOL v10 = (void *)MEMORY[0x263F087E8];
      v11 = NSDictionary;
      uint64_t v12 = *MEMORY[0x263F08608];
      id v13 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
      a3 = (id)[v10 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:objc_msgSend(v11, "dictionaryWithObjectsAndKeys:", a3, v12, v13, *MEMORY[0x263F08320], 0)];
    }
  }
  id v14 = +[ACMAuthenticationResponseImpl authenticationResponse];
  [v14 setError:a3];

  [(ACMExternalAppleConnectImpl *)self returnResponse:v14 withSelector:sel_appleConnect_authenticationDidEndWithResponse_];
}

- (void)returnError:(id)a3 withSelector:(SEL)a4 withResponseClass:(Class)a5
{
  objc_opt_class();
  id v8 = (id)objc_opt_new();
  [v8 setError:a3];

  [(ACMExternalAppleConnectImpl *)self returnResponse:v8 withSelector:a4];
}

- (BOOL)canHideSignInDialog
{
  if ([(ACMExternalAppleConnectImpl *)self isWidgetShown]
    && ![(ACMMessage *)[(ACMExternalAppleConnectImpl *)self currentRequest] useAlertView]&& ([(ACMExternalAppleConnectImpl *)self delegate], (objc_opt_respondsToSelector() & 1) != 0))
  {
    int v3 = [(ACMExternalAppleConnectDelegate *)[(ACMExternalAppleConnectImpl *)self delegate] appleConnectCanHideSignInDialog:[(ACMExternalAppleConnectImpl *)self masterObject]];
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0)
    {
      id v4 = @"can not";
      if (v3) {
        id v4 = @"can";
      }
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl canHideSignInDialog]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 509, 0, "Delegate told that SignIn dialog %@ be hidden immediately", v4);
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void)returnResponse:(id)a3 withSelector:(SEL)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_12;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 519, 0, "Try ask delegate for permission to hide SignIn dialog");
  }
  if ([a3 error])
  {
    [(ACMExternalAppleConnectImpl *)self setAppleConnectState:0];
    goto LABEL_8;
  }
  BOOL v7 = [(ACMExternalAppleConnectImpl *)self canHideSignInDialog];
  BOOL v8 = v7;
  [(ACMExternalAppleConnectImpl *)self setAppleConnectState:!v7];
  if (v8)
  {
LABEL_8:
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 524, 0, "AppleConnect will hide SignIn dialog immediately");
    }
    [(ACMExternalAppleConnectImpl *)self hideSignIn];
    goto LABEL_12;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 529, 0, "AppleConnect will not hide SignIn dialog immediately. It would be hidden by clien application manually");
  }
LABEL_12:
  if (self->_twoSVController)
  {
    [(-[ACC2SVControllerProtocol transportController](-[ACMExternalAppleConnectImpl twoSVController](self, "twoSVController"), "transportController")) setDelegate:0];
    [(ACC2SVControllerProtocol *)[(ACMExternalAppleConnectImpl *)self twoSVController] setTransportController:0];
    [(ACC2SVControllerProtocol *)[(ACMExternalAppleConnectImpl *)self twoSVController] setSecondFactorAuthUIController:0];
    [(ACC2SVControllerProtocol *)[(ACMExternalAppleConnectImpl *)self twoSVController] setDelegate:0];
    [(ACMExternalAppleConnectImpl *)self setTwoSVController:0];
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 542, 0, "Try inform delegate about result");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl returnResponse:withSelector:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 545, 0, "Inform delegate about result");
    }
    id v9 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v10 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v9 performSelector:a4 withObject:v10 withObject:a3];
  }
}

- (void)applicationDidEnterBackground:(id)a3
{
  if ([(ACMExternalAppleConnectImpl *)self isWidgetShown]
    && [(ACMMessage *)[(ACMExternalAppleConnectImpl *)self currentRequest] automaticallyCancelWhenSwitchingToBackground])
  {
    [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] cancelSignInWidget];
    [(ACC2SVControllerProtocol *)[(ACMExternalAppleConnectImpl *)self twoSVController] cancelWithCompletion:0];
    [(ACMExternalAppleConnectImpl *)self hideSignIn];
    [(ACMExternalAppleConnectImpl *)self setAppleConnectState:0];
    id v4 = (void *)MEMORY[0x263F087E8];
    uint64_t v5 = NSDictionary;
    id v6 = +[ACMBaseLocale localizedString:@"Authentication was canceled by user"];
    uint64_t v7 = [v4 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200050 userInfo:[v5 dictionaryWithObject:v6 forKey:@"ACCAppleConnectErrorDomain"]];
    uint64_t v8 = objc_opt_class();
    [(ACMExternalAppleConnectImpl *)self returnError:v7 withSelector:sel_appleConnect_authenticationDidEndWithResponse_ withResponseClass:v8];
  }
}

- (void)showSignInDialog
{
  [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setPassword:0];
  [(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] setWidgetEnabled:1];
  int v3 = [(ACMExternalAppleConnectImpl *)self uiController];
  id v4 = [(ACMExternalAppleConnectImpl *)self parentViewController];
  BOOL v5 = [(ACMExternalAppleConnectImpl *)self signInAnimated];

  [(ACMExternalUIControllerProtocol *)v3 showSignInWidgetWithParentViewController:v4 animated:v5 completion:&__block_literal_global];
}

- (void)onManageAppleIDForRealm:(id)a3
{
  BOOL v5 = (void *)[MEMORY[0x263F1C408] sharedApplication];
  uint64_t v6 = [NSURL URLWithString:[-[ACMAppleConnectPreferences environmentPreferencesWithRealm:](-[ACMAppleConnectImplComponents preferences](-[ACMExternalAppleConnectImpl components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", a3) myAppleIDURL]];

  [v5 openURL:v6];
}

- (void)uiControllerOnSignIn:(id)a3 withPassword:(id)a4
{
  if (objc_msgSend(-[ACMMessage userName](-[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest", a3), "userName"), "length"))
  {
    if ([a4 length]) {
      goto LABEL_9;
    }
    uint64_t v6 = @"Password field is empty";
  }
  else
  {
    uint64_t v6 = @"Apple ID field is empty";
  }
  uint64_t v7 = (void *)MEMORY[0x263F087E8];
  uint64_t v8 = NSDictionary;
  id v9 = +[ACMBaseLocale localizedString:v6];
  uint64_t v10 = [v7 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v8 dictionaryWithObject:v9 forKey:MEMORY[0x263F08320]]];
  if (v10)
  {
    [(ACMExternalAppleConnectImpl *)self reportError:v10];
    return;
  }
LABEL_9:
  [(ACMExternalAppleConnectImpl *)self authenticateWithRequest:[(ACMExternalAppleConnectImpl *)self currentRequest] password:a4];
  v11 = [(ACMExternalAppleConnectImpl *)self uiController];

  [(ACMExternalUIControllerProtocol *)v11 setWidgetEnabled:0];
}

- (void)uiControllerOnSignInCancel:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerOnSignInCancel:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 612, 0, "Sign in cancelled");
  }
  id v4 = (void *)MEMORY[0x263F087E8];
  BOOL v5 = NSDictionary;
  id v6 = +[ACMBaseLocale localizedString:@"Authentication was canceled by user"];
  uint64_t v7 = [v4 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200050 userInfo:[v5 dictionaryWithObject:v6 forKey:@"ACCAppleConnectErrorDomain"]];
  uint64_t v8 = objc_opt_class();

  [(ACMExternalAppleConnectImpl *)self returnError:v7 withSelector:sel_appleConnect_authenticationDidEndWithResponse_ withResponseClass:v8];
}

- (void)uiControllerOnSignIForgot:(id)a3
{
  id v4 = [MEMORY[0x263F1C408] sharedApplication:a3];
  uint64_t v5 = [NSURL URLWithString:[-[ACMAppleConnectPreferences environmentPreferencesWithRealm:](-[ACMAppleConnectImplComponents preferences](-[ACMExternalAppleConnectImpl components](self, "components"), "preferences"), "environmentPreferencesWithRealm:", -[ACMMessage realm](-[ACMExternalAppleConnectImpl currentRequest](self, "currentRequest"), "realm")) iForgotURL]];

  [v4 openURL:v5];
}

- (void)uiControllerWillEnableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 624, 0, "AppleConnect will try inform delegate that SignIn will become enabled");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 627, 0, "Inform delegate that SignIn will become enabled");
    }
    id v4 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v5 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v4 appleConnectSignInDialogWillBecomeEnabled:v5];
  }
}

- (void)uiControllerDidEnableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 634, 0, "AppleConnect will try inform delegate that SignIn did become enabled");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidEnableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 637, 0, "Inform delegate that SignIn did become enabled");
    }
    id v4 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v5 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v4 appleConnectSignInDialogDidBecomeEnabled:v5];
  }
}

- (void)uiControllerWillDisableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 644, 0, "AppleConnect will try inform delegate that SignIn will become disabled");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerWillDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 647, 0, "Inform delegate that SignIn will become disabled");
    }
    id v4 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v5 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v4 appleConnectSignInDialogWillBecomeDisabled:v5];
  }
}

- (void)uiControllerDidDisableSignInDialog:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 654, 0, "AppleConnect will try inform delegate that SignIn did become disabled");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl uiControllerDidDisableSignInDialog:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 657, 0, "Inform delegate that SignIn did become disabled");
    }
    id v4 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v5 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v4 appleConnectSignInDialogDidBecomeDisabled:v5];
  }
}

- (unint64_t)signInDialogContentStyle
{
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v3 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v4 = [(ACMExternalAppleConnectImpl *)self masterObject];
    if (v4) {
      id v5 = v4;
    }
    else {
      id v5 = self;
    }
    return [(ACMExternalAppleConnectDelegate *)v3 appleConnectSignInDialogContentStyle:v5];
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)ACMExternalAppleConnectImpl;
    return [(ACMAppleConnectImpl *)&v7 signInDialogContentStyle];
  }
}

- (void)signInDialogWillHide
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl signInDialogWillHide]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 673, 0, "AppleConnect will hide SignIn dialog and inform delegate");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v3 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v4 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v3 appleConnectWillHideSignInDialog:v4];
  }
}

- (void)signInDialogDidHide
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl signInDialogDidHide]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 682, 0, "AppleConnect has hidden SignIn dialog and would inform delegate");
  }
  [(ACMExternalAppleConnectImpl *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    int v3 = [(ACMExternalAppleConnectImpl *)self delegate];
    id v4 = [(ACMExternalAppleConnectImpl *)self masterObject];
    [(ACMExternalAppleConnectDelegate *)v3 appleConnectDidHideSignInDialog:v4];
  }
}

- (void)twoSVController:(id)a3 openMyAppleConnectForRealm:(id)a4
{
}

- (void)twoSVControllerEnterCredentials:(id)a3
{
  id v4 = [(ACMExternalAppleConnectImpl *)self twoSVController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__ACMExternalAppleConnectImpl_twoSVControllerEnterCredentials___block_invoke;
  v5[3] = &unk_265043B90;
  v5[4] = self;
  [(ACC2SVControllerProtocol *)v4 cancelWithCompletion:v5];
}

uint64_t __63__ACMExternalAppleConnectImpl_twoSVControllerEnterCredentials___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) showSignInDialog];
}

- (void)twoSVController:(id)a3 prepareUIWithCompletion:(id)a4
{
  id v5 = [(id)[a4 copy:a3]];
  if ([(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] signInStyle] == 2)
  {
    if (v5)
    {
      id v6 = (void (*)(void *))v5[2];
      v6(v5);
    }
  }
  else
  {
    objc_super v7 = [(ACMExternalAppleConnectImpl *)self uiController];
    id v8 = [(ACMExternalAppleConnectImpl *)self parentViewController];
    BOOL v9 = [(ACMExternalAppleConnectImpl *)self signInAnimated];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __71__ACMExternalAppleConnectImpl_twoSVController_prepareUIWithCompletion___block_invoke;
    v10[3] = &unk_265043C78;
    v10[4] = self;
    v10[5] = v5;
    [(ACMExternalUIControllerProtocol *)v7 hideSignInWidgetWithParentViewController:v8 animated:v9 completion:v10];
  }
}

uint64_t __71__ACMExternalAppleConnectImpl_twoSVController_prepareUIWithCompletion___block_invoke(uint64_t a1)
{
  if (objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiController"), "isWidgetShown"))
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      int v3 = *(uint64_t (**)(void))(result + 16);
      return v3();
    }
  }
  else
  {
    [objc_msgSend(*(id *)(a1 + 32), "components") unloadUIController];
    [objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "twoSVController"), "transportController"), "setDelegate:", 0);
    [objc_msgSend(*(id *)(a1 + 32), "twoSVController") setTransportController:0];
    [objc_msgSend(*(id *)(a1 + 32), "twoSVController") setSecondFactorAuthUIController:0];
    [objc_msgSend(*(id *)(a1 + 32), "twoSVController") setDelegate:0];
    id v4 = *(void **)(a1 + 32);
    return [v4 setTwoSVController:0];
  }
  return result;
}

- (void)twoSVControllerWillClose:(id)a3
{
  if ([(ACMExternalUIControllerProtocol *)[(ACMExternalAppleConnectImpl *)self uiController] signInStyle] != 2)
  {
    [(ACMExternalAppleConnectImpl *)self signInDialogWillHide];
  }
}

- (void)twoSVTransportController:(id)a3 scheduleHandler:(id)a4 withCompletion:(id)a5
{
  id v7 = [(id)[a5 copy:a3]];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __87__ACMExternalAppleConnectImpl_twoSVTransportController_scheduleHandler_withCompletion___block_invoke;
  v8[3] = &unk_265043CA0;
  v8[4] = v7;
  [(ACMAppleConnectImpl *)self scheduleHandler:a4 withCompletionBlock:v8];
}

uint64_t __87__ACMExternalAppleConnectImpl_twoSVTransportController_scheduleHandler_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)twoSVTransportController:(id)a3 fetchImageWithHandler:(id)a4 completion:(id)a5
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAppleConnectImpl twoSVTransportController:fetchImageWithHandler:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 765, 0, "Scheduling image download HTTP handler %p for address %@", a4, [objc_msgSend((id)objc_msgSend(a4, "transport"), "requestURLTemplate")]);
  }
  objc_sync_enter(self);
  if (a4)
  {
    if (![(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] count]) {
      [((id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication")) setNetworkActivityIndicatorVisible:1];
    }
    [(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] addObject:a4];
    [a4 downloadImageWithCompletionBlock:a5];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __89__ACMExternalAppleConnectImpl_twoSVTransportController_fetchImageWithHandler_completion___block_invoke;
    v8[3] = &unk_265043CC8;
    v8[4] = self;
    void v8[5] = a4;
    [a4 setFinalizeBlock:v8];
  }
  else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
  {
    ACFLog(3, (uint64_t)"-[ACMExternalAppleConnectImpl twoSVTransportController:fetchImageWithHandler:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 783, 0, "Trying to schedule nil handler");
  }
  objc_sync_exit(self);
}

uint64_t __89__ACMExternalAppleConnectImpl_twoSVTransportController_fetchImageWithHandler_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) unscheduleHandler:*(void *)(a1 + 40)];
}

- (void)twoSVTransportControllerCancelFetchingImages:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = (void *)[(NSMutableSet *)[(ACMAppleConnectImpl *)self handlers] objectsPassingTest:&__block_literal_global_207];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        [v9 cancelRequest];
        [(ACMAppleConnectImpl *)self unscheduleHandler:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

uint64_t __76__ACMExternalAppleConnectImpl_twoSVTransportControllerCancelFetchingImages___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

- (void)authenticationController:(id)a3 scheduleHandler:(id)a4 withCompletion:(id)a5
{
}

- (void)authenticationController:(id)a3 perform2StepVerificationWithRequest:(id)a4 completion:(id)a5
{
  if (!a5) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler", a3)) handleFailureInMethod:a2 object:self file:@"ACMExternalAppleConnectImpl.m" lineNumber:819 description:@"Invalid parameter"];
  }
  if ([(ACMExternalAppleConnectImpl *)self isWidgetShown])
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACMExternalAppleConnectImpl authenticationController:perform2StepVerificationWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 822, 0, "Two-step verification required");
      }
    }
    id v8 = (id)[a5 copy];
    BOOL v9 = [(ACMExternalAppleConnectImpl *)self twoSVController];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __103__ACMExternalAppleConnectImpl_authenticationController_perform2StepVerificationWithRequest_completion___block_invoke;
    v15[3] = &unk_265043D10;
    v15[4] = self;
    v15[5] = v8;
    [(ACC2SVControllerProtocol *)v9 perform2StepVerificationWithRequest:a4 completion:v15];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACMExternalAppleConnectImpl authenticationController:perform2StepVerificationWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAppleConnectImpl.m", 839, 0, "Two-step verification required but UI can't be shown.");
    }
    long long v10 = (void *)MEMORY[0x263F087E8];
    long long v11 = NSDictionary;
    id v12 = +[ACMBaseLocale localizedString:@"Two-step verification required, but user interaction is not allowed."];
    uint64_t v13 = [v10 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200320 userInfo:[v11 dictionaryWithObject:v12 forKey:MEMORY[0x263F08320]]];
    id v14 = (void (*)(id, uint64_t, void))*((void *)a5 + 2);
    v14(a5, v13, 0);
  }
}

uint64_t __103__ACMExternalAppleConnectImpl_authenticationController_perform2StepVerificationWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2 && a3 && objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "uiController"), "signInStyle") != 2)
  {
    [objc_msgSend(*(id *)(a1 + 32), "components") unloadUIController];
    [*(id *)(a1 + 32) signInDialogDidHide];
  }
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (ACMExternalAuthenticationRequestImpl)currentRequest
{
  return self->_currentRequest;
}

- (void)setCurrentRequest:(id)a3
{
}

- (int64_t)appleConnectState
{
  return self->_appleConnectState;
}

- (void)setAppleConnectState:(int64_t)a3
{
  self->_appleConnectState = a3;
}

- (id)masterObject
{
  return self->_masterObject;
}

- (void)setMasterObject:(id)a3
{
  self->_masterObject = a3;
}

- (ACMExternalAppleConnectDelegate)delegate
{
  return self->_delegate;
}

- (void)setTwoSVController:(id)a3
{
}

- (void)setAuthenticationController:(id)a3
{
}

@end