@interface ACMExternalAuthenticationController
- (ACCComponents)components;
- (ACCTicketManagerProtocol)ticketManager;
- (ACFKeychainManagerProtocol)keychainManager;
- (ACFLocalAuthenticationContextProtocol)localAuthenticationContext;
- (ACMExternalAuthenticationControllerDelegate)delegate;
- (BOOL)isCriticalError:(id)a3;
- (BOOL)isValidToken:(id)a3 duration:(double)a4;
- (id)convertLAError:(id)a3;
- (id)localizedReasonForUsername:(id)a3;
- (id)tgtStoragePolicy;
- (id)tokenWithRequest:(id)a3;
- (void)authenticate2SVWithSSOTokenIfRequired:(id)a3 request:(id)a4 completion:(id)a5;
- (void)authenticateWithRequest:(id)a3 password:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)evaluateSSOWithRequest:(id)a3 completion:(id)a4;
- (void)evaluateTouchIDIfNeededWithSSOToken:(id)a3 request:(id)a4 completion:(id)a5;
- (void)evaluateTouchIDWithToken:(id)a3 request:(id)a4 completion:(id)a5;
- (void)saveSSOIfNeeded:(id)a3 withRequest:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setLocalAuthenticationContext:(id)a3;
- (void)updateAuthContext:(id)a3;
- (void)verifyServiceTicketWithRequest:(id)a3 completion:(id)a4;
- (void)verifyToken:(id)a3 withRequest:(id)a4 completion:(id)a5;
@end

@implementation ACMExternalAuthenticationController

- (void)dealloc
{
  [(ACMExternalAuthenticationController *)self setLocalAuthenticationContext:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMExternalAuthenticationController;
  [(ACMExternalAuthenticationController *)&v3 dealloc];
}

- (ACCComponents)components
{
  return (ACCComponents *)+[ACCComponents components];
}

- (ACFKeychainManagerProtocol)keychainManager
{
  v2 = [(ACMExternalAuthenticationController *)self components];

  return [(ACFComponents *)v2 keychainManager];
}

- (ACCTicketManagerProtocol)ticketManager
{
  v2 = [(ACMExternalAuthenticationController *)self components];

  return [(ACCComponents *)v2 ticketManager];
}

- (ACFLocalAuthenticationContextProtocol)localAuthenticationContext
{
  result = self->_localAuthenticationContext;
  if (!result)
  {
    result = (ACFLocalAuthenticationContextProtocol *)[(ACFComponents *)[(ACMExternalAuthenticationController *)self components] createLocalAuthenticationContext];
    self->_localAuthenticationContext = result;
  }
  return result;
}

- (id)tgtStoragePolicy
{
  v2 = [(ACMExternalAuthenticationController *)self components];

  return [(ACCComponents *)v2 tgtStoragePolicy];
}

- (id)localizedReasonForUsername:(id)a3
{
  return (id)[NSString stringWithFormat:+[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"Authenticate as %@ with Touch ID", a3];
}

- (void)evaluateTouchIDWithToken:(id)a3 request:(id)a4 completion:(id)a5
{
  v9 = [(ACMExternalAuthenticationController *)self localAuthenticationContext];
  -[ACFLocalAuthenticationContextProtocol setLocalizedReason:](v9, "setLocalizedReason:", -[ACMExternalAuthenticationController localizedReasonForUsername:](self, "localizedReasonForUsername:", [objc_msgSend((id)objc_msgSend(a3, "principal"), "userName")]);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __83__ACMExternalAuthenticationController_evaluateTouchIDWithToken_request_completion___block_invoke;
  v10[3] = &unk_265044248;
  v10[4] = self;
  v10[5] = v9;
  v10[7] = a3;
  v10[8] = a5;
  v10[6] = a4;
  [(ACFLocalAuthenticationContextProtocol *)v9 evaluatePolicy:1 completion:v10];
}

uint64_t __83__ACMExternalAuthenticationController_evaluateTouchIDWithToken_request_completion___block_invoke(uint64_t a1, char a2)
{
  if (a2) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) convertLAError:];
  }
  [*(id *)(a1 + 40) reset];
  if ([*(id *)(a1 + 32) isCriticalError:v3]) {
    [*(id *)(a1 + 32) cleanSSOStorageWithRequest:*(void *)(a1 + 48)];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);

  return v4();
}

- (void)evaluateTouchIDIfNeededWithSSOToken:(id)a3 request:(id)a4 completion:(id)a5
{
  id v8 = (id)[a5 copy];
  id v9 = (id)[a4 copy];
  [v9 setPrincipal:[a3 principal]];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke;
  v10[3] = &unk_265044298;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = v9;
  v10[7] = v8;
  [(ACMExternalAuthenticationController *)self verifyToken:a3 withRequest:v9 completion:v10];
}

uint64_t __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke(uint64_t a1, void *a2)
{
  if (objc_msgSend((id)objc_msgSend(a2, "personDSID"), "longLongValue")) {
    return [*(id *)(a1 + 32) evaluateTouchIDWithToken:*(void *)(a1 + 40) request:MEMORY[0x263EF8330] completion:__94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke_2];
  }
  v5 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v5();
}

uint64_t __94__ACMExternalAuthenticationController_evaluateTouchIDIfNeededWithSSOToken_request_completion___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  if (objc_msgSend(*(id *)(a1 + 32), "isValidToken:duration:", 0.0)
    && !objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", *(void *)(a1 + 40), a3), "length"))
  {
    v6 = (void *)MEMORY[0x263F087E8];
    v7 = NSDictionary;
    id v8 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
    a2 = [v6 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v7 dictionaryWithObjectsAndKeys:v8, *MEMORY[0x263F08320], 0]];
  }
  if (a3 && !a2)
  {
    id v9 = [[*(id *)(a1 + 48) userInfo] objectForKey:@"op"];
    if ([v9 length])
    {
      [a3 setSessionToken:v9];
      v10 = (void *)MEMORY[0x263EFF910];
      [[[*(id *)(a1 + 48) userInfo] objectForKey:@"e"] doubleValue];
      [a3 setExpirationDate:[v10 dateWithTimeIntervalSince1970:v11 / 1000.0]];
      [objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "components"), "tgtStoragePolicy"), "updateToken:", a3];
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
    {
      ACFLog(3, (uint64_t)"-[ACMExternalAuthenticationController evaluateTouchIDIfNeededWithSSOToken:request:completion:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 137, 0, "Server did not return new session");
    }
  }
  v12 = *(uint64_t (**)(void))(*(void *)(a1 + 56) + 16);

  return v12();
}

- (void)authenticate2SVWithSSOTokenIfRequired:(id)a3 request:(id)a4 completion:(id)a5
{
  if (objc_msgSend((id)objc_msgSend(a3, "isTwoStepVerificationRequired"), "BOOLValue"))
  {
    [a4 setPersonID:[a3 personID]];
    [a4 setSessionToken:[a3 sessionToken]];
    char v9 = [a3 longLiveSession];
    v10 = [(ACMExternalAuthenticationController *)self delegate];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __96__ACMExternalAuthenticationController_authenticate2SVWithSSOTokenIfRequired_request_completion___block_invoke;
    v12[3] = &unk_2650442C0;
    char v13 = v9;
    v12[4] = a5;
    [(ACMExternalAuthenticationControllerDelegate *)v10 authenticationController:self perform2StepVerificationWithRequest:a4 completion:v12];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACMExternalAuthenticationController authenticate2SVWithSSOTokenIfRequired:request:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 166, 0, "Two-step verification is not required");
    }
    double v11 = (void (*)(id, void, id))*((void *)a5 + 2);
    v11(a5, 0, a3);
  }
}

uint64_t __96__ACMExternalAuthenticationController_authenticate2SVWithSSOTokenIfRequired_request_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  [a3 setLongLiveSession:*(unsigned __int8 *)(a1 + 40)];
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v4();
}

- (void)verifyToken:(id)a3 withRequest:(id)a4 completion:(id)a5
{
  if (!a5) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACMExternalAuthenticationController.m" lineNumber:173 description:@"Invalid parameter"];
  }
  id v9 = +[ACFMessage message];
  [v9 setUserName:[objc_msgSend((id)objc_msgSend(a3, "principal"), "userName")];
  [v9 setRealm:[a4 realm]];
  [v9 setAppID:[a4 appID]];
  [v9 setAppIDKey:[a4 appIDKey]];
  [v9 setToken:-[ACCTicketManagerProtocol serviceTicketStringWithRequest:ssoToken:](-[ACCComponents ticketManager](-[ACMExternalAuthenticationController components](self, "components"), "ticketManager"), "serviceTicketStringWithRequest:ssoToken:", a4, a3)];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __74__ACMExternalAuthenticationController_verifyToken_withRequest_completion___block_invoke;
  v10[3] = &unk_2650442E8;
  v10[4] = self;
  v10[5] = a4;
  v10[6] = a5;
  [(ACMExternalAuthenticationController *)self verifyServiceTicketWithRequest:v9 completion:v10];
}

uint64_t __74__ACMExternalAuthenticationController_verifyToken_withRequest_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2 && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 0x10) != 0) {
      ACFLog(4, (uint64_t)"-[ACMExternalAuthenticationController verifyToken:withRequest:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 186, 0, "Error: ", a2);
    }
  }
  else if (!a2)
  {
    goto LABEL_8;
  }
  if ([*(id *)(a1 + 32) isCriticalError:a2]) {
    [*(id *)(a1 + 32) cleanSSOStorageWithRequest:*(void *)(a1 + 40)];
  }
LABEL_8:
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

- (void)evaluateSSOWithRequest:(id)a3 completion:(id)a4
{
  if (!a4) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACMExternalAuthenticationController.m" lineNumber:200 description:@"Invalid parameter"];
  }
  if ([a3 canUseTouchID])
  {
    uint64_t v10 = 0;
    if ([(ACFLocalAuthenticationContextProtocol *)[(ACMExternalAuthenticationController *)self localAuthenticationContext] canEvaluatePolicy:1 error:&v10])
    {
      id v7 = [(ACMExternalAuthenticationController *)self tokenWithRequest:a3];
      if ([(ACMExternalAuthenticationController *)self isValidToken:v7 duration:60.0])
      {
        v9[0] = MEMORY[0x263EF8330];
        v9[1] = 3221225472;
        v9[2] = __73__ACMExternalAuthenticationController_evaluateSSOWithRequest_completion___block_invoke;
        v9[3] = &unk_265043D10;
        v9[4] = a3;
        v9[5] = a4;
        [(ACMExternalAuthenticationController *)self evaluateTouchIDIfNeededWithSSOToken:v7 request:a3 completion:v9];
        return;
      }
      if (v7) {
        [(ACMExternalAuthenticationController *)self cleanSSOStorageWithRequest:a3];
      }
    }
    else if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x10) != 0)
    {
      ACFLog(4, (uint64_t)"-[ACMExternalAuthenticationController evaluateSSOWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 229, 0, "Local Authentication error: %@", v10);
    }
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
  }
  else
  {
    id v8 = (void (*)(id, void, void))*((void *)a4 + 2);
    v8(a4, 0, 0);
  }
}

uint64_t __73__ACMExternalAuthenticationController_evaluateSSOWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (a3) {
    [*(id *)(a1 + 32) setPrincipal:[a3 principal]];
  }
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

- (void)authenticateWithRequest:(id)a3 password:(id)a4 completion:(id)a5
{
  if (!a5) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACMExternalAuthenticationController.m" lineNumber:241 description:@"Invalid parameter!"];
  }
  uint64_t v9 = [(ACCTicketManagerProtocol *)[(ACCComponents *)[(ACMExternalAuthenticationController *)self components] ticketManager] authContextWithRequest:a3 keyCode:a4 authenticationType:0];
  [(ACMExternalAuthenticationController *)self updateAuthContext:v9];
  [(ACCTicketManagerProtocol *)[(ACCComponents *)[(ACMExternalAuthenticationController *)self components] ticketManager] updateContextWithClientSecretIfAny:v9];
  id v10 = [(ACCComponents *)[(ACMExternalAuthenticationController *)self components] createHandlerWithClass:objc_opt_class() context:v9];
  if ([a3 serverResponseTimeout])
  {
    [objc_msgSend(objc_msgSend(a3, "serverResponseTimeout"), "floatValue")];
    [objc_msgSend((id)objc_msgSend(v10, "transport"), "setTimeout:", v11);
  }
  v12 = [(ACCComponents *)[(ACMExternalAuthenticationController *)self components] ticketManager];
  id v13 = (id)[a5 copy];
  v14 = [(ACMExternalAuthenticationController *)self delegate];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke;
  v15[3] = &unk_265044338;
  v15[4] = v12;
  v15[5] = v9;
  v15[6] = self;
  v15[7] = a3;
  v15[8] = v13;
  [(ACMExternalAuthenticationControllerDelegate *)v14 authenticationController:self scheduleHandler:v10 withCompletion:v15];
}

uint64_t __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACMExternalAuthenticationController authenticateWithRequest:password:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 278, 0, "Did receive authentication error: %@", a3);
    }
LABEL_11:
    id v13 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
    return v13();
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACMExternalAuthenticationController authenticateWithRequest:password:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 260, 0, "Did receive authentication response");
  }
  uint64_t v6 = [*(id *)(a1 + 32) createSSOTokenWithContent:[*(id *)(a1 + 32) decryptEncryptedContent:withHmac:context:objc_msgSend(a2, "objectForKey:", @"pt"), objc_msgSend(a2, "objectForKey:", @"ph"), *(void *)(a1 + 40)] context:*(void *)(a1 + 40)];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = *(void **)(a1 + 48);
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke_2;
    v14[3] = &unk_265044310;
    v14[4] = v8;
    return [v8 authenticate2SVWithSSOTokenIfRequired:v7 request:*(void *)(a1 + 56) completion:v14];
  }
  id v10 = (void *)MEMORY[0x263F087E8];
  float v11 = NSDictionary;
  id v12 = +[ACMBaseLocale localizedString:@"Failed to create valid SSO token"];
  uint64_t result = [v10 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v11 dictionaryWithObject:v12 forKey:MEMORY[0x263F08320]]];
  if (result) {
    goto LABEL_11;
  }
  return result;
}

uint64_t __83__ACMExternalAuthenticationController_authenticateWithRequest_password_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) saveSSOIfNeeded:a3 withRequest:*(void *)(a1 + 40)];
  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v4();
}

- (void)updateAuthContext:(id)a3
{
  if ([(ACFLocalAuthenticationContextProtocol *)[(ACMExternalAuthenticationController *)self localAuthenticationContext] canEvaluatePolicy:1 error:0])
  {
    uint64_t v4 = MEMORY[0x263EFFA88];
    [a3 setTouchIDSupport:v4];
  }
}

- (void)verifyServiceTicketWithRequest:(id)a3 completion:(id)a4
{
  if (!a4) {
    [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACMExternalAuthenticationController.m" lineNumber:298 description:@"Invalid parameter"];
  }
  if ([a3 appID] && objc_msgSend((id)objc_msgSend(a3, "appIDKey"), "length"))
  {
    if (objc_msgSend((id)objc_msgSend(a3, "token"), "length")) {
      goto LABEL_15;
    }
    uint64_t v7 = @"Invalid Data Token. Data Token for verify is not valid.";
  }
  else
  {
    uint64_t v7 = @"Invalid Parameters. Some of input parameters are set incorrectly.";
  }
  id v8 = (void *)MEMORY[0x263F087E8];
  uint64_t v9 = NSDictionary;
  id v10 = +[ACMBaseLocale localizedString:v7];
  uint64_t v11 = [v8 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200190 userInfo:[v9 dictionaryWithObject:v10 forKey:MEMORY[0x263F08320]]];
  if (v11)
  {
    uint64_t v12 = v11;
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
      ACFLog(7, (uint64_t)"-[ACMExternalAuthenticationController verifyServiceTicketWithRequest:completion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 312, 0, "Reporting delegate about error %@", v12);
    }
    id v13 = (void (*)(id, uint64_t, void))*((void *)a4 + 2);
    v13(a4, v12, 0);
    return;
  }
LABEL_15:
  uint64_t v14 = [(ACCTicketManagerProtocol *)[(ACCComponents *)[(ACMExternalAuthenticationController *)self components] ticketManager] authContextWithRequest:a3];
  [(ACMExternalAuthenticationController *)self updateAuthContext:v14];
  id v15 = [(ACCComponents *)[(ACMExternalAuthenticationController *)self components] createHandlerWithClass:objc_opt_class() context:v14];
  if ([a3 serverResponseTimeout])
  {
    [objc_msgSend(objc_msgSend(a3, "serverResponseTimeout"), "floatValue");
    [objc_msgSend((id)objc_msgSend(v15, "transport"), "setTimeout:", v16);
  }
  v17 = [(ACMExternalAuthenticationController *)self delegate];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __81__ACMExternalAuthenticationController_verifyServiceTicketWithRequest_completion___block_invoke;
  v18[3] = &unk_265043CA0;
  v18[4] = a4;
  [(ACMExternalAuthenticationControllerDelegate *)v17 authenticationController:self scheduleHandler:v15 withCompletion:v18];
}

uint64_t __81__ACMExternalAuthenticationController_verifyServiceTicketWithRequest_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x80) != 0) {
    ACFLog(7, (uint64_t)"-[ACMExternalAuthenticationController verifyServiceTicketWithRequest:completion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 327, 0, "Response is received");
  }
  if (a3)
  {
    if ([a3 code] == -200200)
    {
      uint64_t v6 = (void *)MEMORY[0x263F087E8];
      uint64_t v7 = NSDictionary;
      uint64_t v8 = *MEMORY[0x263F08608];
      id v9 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
      [v6 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v7 dictionaryWithObjectsAndKeys:a3, v8, v9, *MEMORY[0x263F08320], 0]];
    }
  }
  else
  {
    id v10 = (id)objc_opt_new();
    [v10 setRawResponseData:a2];
    [v10 setUserInfo:a2];
  }
  uint64_t v11 = *(uint64_t (**)(void))(*(void *)(a1 + 32) + 16);

  return v11();
}

- (BOOL)isValidToken:(id)a3 duration:(double)a4
{
  if (!a3) {
    return 0;
  }
  [objc_msgSend((id)objc_msgSend(a3, "expirationDate"), "timeIntervalSinceNow")
  return v5 - a4 > 0.0;
}

- (id)convertLAError:(id)a3
{
  uint64_t v4 = [a3 code];
  switch(v4)
  {
    case -4:
      double v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = NSDictionary;
      uint64_t v7 = @"Authentication was canceled by system";
      goto LABEL_6;
    case -3:
      id v10 = (void *)MEMORY[0x263F087E8];
      uint64_t v11 = -600182;
      uint64_t v9 = 0;
      break;
    case -2:
      double v5 = (void *)MEMORY[0x263F087E8];
      uint64_t v6 = NSDictionary;
      uint64_t v7 = @"Authentication was canceled by user";
LABEL_6:
      id v8 = +[ACMBaseLocale localizedString:v7];
      uint64_t v9 = [v6 dictionaryWithObject:v8 forKey:*MEMORY[0x263F08320]];
      id v10 = v5;
      uint64_t v11 = -200050;
      break;
    default:
      uint64_t v12 = (void *)MEMORY[0x263F087E8];
      id v13 = NSDictionary;
      uint64_t v14 = *MEMORY[0x263F08608];
      id v15 = +[ACMBaseLocale localizedString:@"Oops, an error occurred. Thanks for your patience, please try again later."];
      uint64_t v9 = [v13 dictionaryWithObjectsAndKeys:a3, v14, v15, *MEMORY[0x263F08320], 0];
      uint64_t v11 = -200200;
      id v10 = v12;
      break;
  }

  return (id)[v10 errorWithDomain:@"ACCAppleConnectErrorDomain" code:v11 userInfo:v9];
}

- (BOOL)isCriticalError:(id)a3
{
  if (!a3) {
    return 0;
  }
  uint64_t v3 = [a3 code];
  BOOL result = 1;
  if (v3 > -100402)
  {
    if ((unint64_t)(v3 + 100401) >= 2 && v3) {
      return result;
    }
    return 0;
  }
  if (v3 == -600182 || v3 == -200050) {
    return 0;
  }
  return result;
}

- (id)tokenWithRequest:(id)a3
{
  uint64_t v3 = (void *)-[ACCTicketManagerProtocol fetchSSOTokenForPrincipal:](-[ACMExternalAuthenticationController ticketManager](self, "ticketManager"), "fetchSSOTokenForPrincipal:", [a3 principal]);
  [v3 setLongLiveSession:1];
  return v3;
}

- (void)saveSSOIfNeeded:(id)a3 withRequest:(id)a4
{
  if (a3 && [a3 longLiveSession])
  {
    if (![(ACMExternalAuthenticationController *)self localAuthenticationContext]) {
      [((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler")) handleFailureInMethod:a2 object:self file:@"ACMExternalAuthenticationController.m" lineNumber:426 description:@"Invalid configuration"];
    }
    uint64_t v8 = 0;
    if ([(ACFLocalAuthenticationContextProtocol *)[(ACMExternalAuthenticationController *)self localAuthenticationContext] canEvaluatePolicy:1 error:&v8])
    {
      if (objc_msgSend((id)objc_msgSend((id)objc_msgSend(a3, "principal"), "userName"), "length")) {
        [(ACCTicketManagerProtocol *)[(ACMExternalAuthenticationController *)self ticketManager] storeSSOToken:a3];
      }
    }
    else
    {
      if (v8 && ACFLog && (ACFLogSettingsGetLevelMask() & 0x10) != 0) {
        ACFLog(4, (uint64_t)"-[ACMExternalAuthenticationController saveSSOIfNeeded:withRequest:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/External/Sources/ACMExternalAuthenticationController.m", 439, 0, "Local Authentication error: %@", v8);
      }
      [(ACMExternalAuthenticationController *)self cleanSSOStorageWithRequest:a4];
    }
  }
}

- (ACMExternalAuthenticationControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMExternalAuthenticationControllerDelegate *)a3;
}

- (void)setLocalAuthenticationContext:(id)a3
{
}

@end