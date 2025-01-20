@interface ACC2SVController
- (ACC2SVAuthenticationUIControllerProtocol)secondFactorAuthUIController;
- (ACC2SVControllerDelegate)delegate;
- (ACC2SVTransportControllerProtocol)transportController;
- (ACC2SVTrustedDeviceObject)currentDevice;
- (ACCTicketManagerProtocol)ticketManager;
- (ACFMessage)authRequest;
- (Class)deviceObjectClass;
- (id)completionBlock;
- (id)createCancelError;
- (id)createTrustedDeviceWithDictionary:(id)a3;
- (id)ssoTokenWithResponse:(id)a3 context:(id)a4;
- (id)trustedDevicesFromResponse:(id)a3 withContext:(id)a4;
- (id)uiControllerRealm:(id)a3;
- (id)uiControllerTitle:(id)a3;
- (unint64_t)passcodeLengthFromEncryptedContent:(id)a3 withHmac:(id)a4 context:(id)a5;
- (void)cancel2SVAuthentication;
- (void)cancelWithCompletion:(id)a3;
- (void)dealloc;
- (void)enterAndVerifySecureCodeOfLength:(unint64_t)a3;
- (void)enterCredentials;
- (void)generateAndSendSecCodeToDevice:(id)a3 withCompletion:(id)a4;
- (void)goBackToTrustedDevices;
- (void)handleErrorOnGetTrustedDevices:(id)a3;
- (void)handleErrorOnResendSecurityCode:(id)a3 alertCancelled:(BOOL)a4;
- (void)handleErrorOnSendSecurityCode:(id)a3 alertCancelled:(BOOL)a4;
- (void)hideUIAndReturnError:(id)a3;
- (void)hideUIWithCompletion:(id)a3;
- (void)perform2StepVerificationWithRequest:(id)a3 completion:(id)a4;
- (void)refreshTrustedDevicesList;
- (void)reportError:(id)a3 completionBlock:(id)a4;
- (void)sendVerificationCodeToDevice:(id)a3;
- (void)setAuthRequest:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setCurrentDevice:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setSecondFactorAuthUIController:(id)a3;
- (void)setTransportController:(id)a3;
- (void)start2StepVerificationWithRequest:(id)a3;
- (void)uiController:(id)a3 getImageWithURL:(id)a4 completion:(id)a5;
- (void)uiController:(id)a3 resendVerificationCodeWithCompletion:(id)a4;
- (void)uiControllerCancelGettingImages:(id)a3;
- (void)uiControllerHideViewAnimated:(id)a3;
- (void)uiControllerSetup:(id)a3;
- (void)uiControllerUserIsUnableToReceiveVerificationCode:(id)a3;
- (void)verifySecureCode:(id)a3 withCompletion:(id)a4;
- (void)verifySecurityCodeDidFailWithError:(id)a3;
- (void)verifySecurityCodeDidFinishWithToken:(id)a3;
@end

@implementation ACC2SVController

- (void)dealloc
{
  [(ACC2SVController *)self setSecondFactorAuthUIController:0];
  [(ACC2SVController *)self setDelegate:0];
  [(ACC2SVController *)self setAuthRequest:0];
  [(ACC2SVController *)self setCurrentDevice:0];
  [(ACC2SVController *)self setCompletionBlock:0];
  [(ACC2SVController *)self setTransportController:0];
  v3.receiver = self;
  v3.super_class = (Class)ACC2SVController;
  [(ACC2SVController *)&v3 dealloc];
}

- (void)setSecondFactorAuthUIController:(id)a3
{
  secondFactorAuthUIController = self->_secondFactorAuthUIController;
  if (secondFactorAuthUIController != a3)
  {
    [(ACC2SVAuthenticationUIControllerProtocol *)secondFactorAuthUIController setDelegate:0];

    v6 = (ACC2SVAuthenticationUIControllerProtocol *)a3;
    self->_secondFactorAuthUIController = v6;
    [(ACC2SVAuthenticationUIControllerProtocol *)v6 setDelegate:self];
  }
}

- (ACCTicketManagerProtocol)ticketManager
{
  id v2 = +[ACCComponents components];

  return (ACCTicketManagerProtocol *)[v2 ticketManager];
}

- (void)perform2StepVerificationWithRequest:(id)a3 completion:(id)a4
{
  [(ACC2SVController *)self setCompletionBlock:a4];

  [(ACC2SVController *)self start2StepVerificationWithRequest:a3];
}

- (void)cancelWithCompletion:(id)a3
{
  if ([(ACC2SVController *)self completionBlock])
  {
    id v5 = (id)[a3 copy];
    v6 = [(ACC2SVController *)self secondFactorAuthUIController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __41__ACC2SVController_cancelWithCompletion___block_invoke;
    v8[3] = &unk_265043C78;
    v8[4] = self;
    v8[5] = v5;
    [(ACC2SVAuthenticationUIControllerProtocol *)v6 hideUIAnimated:0 withCompletion:v8];
  }
  else if (a3)
  {
    v7 = (void (*)(id))*((void *)a3 + 2);
    v7(a3);
  }
}

uint64_t __41__ACC2SVController_cancelWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) completionBlock];
  (*(void (**)(uint64_t, void, void))(v2 + 16))(v2, 0, 0);
  [*(id *)(a1 + 32) setCompletionBlock:0];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)hideUIWithCompletion:(id)a3
{
  [(ACC2SVControllerDelegate *)[(ACC2SVController *)self delegate] twoSVControllerWillClose:self];
  id v5 = [(ACC2SVController *)self secondFactorAuthUIController];

  [(ACC2SVAuthenticationUIControllerProtocol *)v5 hideUIAnimated:1 withCompletion:a3];
}

- (void)enterCredentials
{
  objc_super v3 = [(ACC2SVController *)self secondFactorAuthUIController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __36__ACC2SVController_enterCredentials__block_invoke;
  v4[3] = &unk_265043B90;
  v4[4] = self;
  [(ACC2SVAuthenticationUIControllerProtocol *)v3 handleFailoverWithCompletion:v4];
}

uint64_t __36__ACC2SVController_enterCredentials__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[*(id *)(a1 + 32) delegate];
  uint64_t v3 = *(void *)(a1 + 32);

  return [v2 twoSVControllerEnterCredentials:v3];
}

- (void)enterAndVerifySecureCodeOfLength:(unint64_t)a3
{
  id v5 = [(ACC2SVController *)self secondFactorAuthUIController];
  v6 = [(ACC2SVController *)self currentDevice];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke;
  v7[3] = &unk_265044020;
  v7[4] = self;
  [(ACC2SVAuthenticationUIControllerProtocol *)v5 enterVerificationCodeWithLength:a3 forDevice:v6 completion:v7];
}

uint64_t __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4 = [a2 length];
  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_2;
    v7[3] = &unk_265043FF8;
    v7[4] = v5;
    return [v5 verifySecureCode:a2 withCompletion:v7];
  }
  else
  {
    return [v5 goBackToTrustedDevices];
  }
}

uint64_t __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACC2SVController enterAndVerifySecureCodeOfLength:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 132, 0, "Error %@ occurred while verifying security code.", a3);
    }
    id v5 = *(void **)(a1 + 32);
    return [v5 verifySecurityCodeDidFailWithError:a3];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController enterAndVerifySecureCodeOfLength:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 124, 0, "Verify sec code finished successfully.");
    }
    v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_3;
    v9[3] = &unk_265043CC8;
    v9[4] = v8;
    v9[5] = a2;
    return [v8 hideUIWithCompletion:v9];
  }
}

uint64_t __53__ACC2SVController_enterAndVerifySecureCodeOfLength___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) verifySecurityCodeDidFinishWithToken:*(void *)(a1 + 40)];
}

- (void)sendVerificationCodeToDevice:(id)a3
{
  if (a3)
  {
    if ([a3 isTOTPDevice])
    {
      [(ACC2SVController *)self setCurrentDevice:a3];
      [(ACC2SVController *)self enterAndVerifySecureCodeOfLength:6];
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
        ACFLog(6, (uint64_t)"-[ACC2SVController sendVerificationCodeToDevice:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 155, 0, "Send code to device %@.", [a3 deviceDisplayDescription]);
      }
      v5[0] = MEMORY[0x263EF8330];
      v5[1] = 3221225472;
      v5[2] = __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke;
      v5[3] = &unk_265044070;
      v5[4] = self;
      [(ACC2SVController *)self generateAndSendSecCodeToDevice:a3 withCompletion:v5];
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController sendVerificationCodeToDevice:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 176, 0, "2SV authentication is cancelled.");
    }
    [(ACC2SVController *)self cancel2SVAuthentication];
  }
}

uint64_t __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController sendVerificationCodeToDevice:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 164, 0, "Error %@ occurred while sending security code.", a3);
      }
    }
    id v5 = *(void **)(a1 + 32);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke_2;
    v8[3] = &unk_265044048;
    v8[4] = v5;
    v8[5] = a3;
    return [v5 reportError:a3 completionBlock:v8];
  }
  else
  {
    v7 = *(void **)(a1 + 32);
    return [v7 enterAndVerifySecureCodeOfLength:a2];
  }
}

uint64_t __49__ACC2SVController_sendVerificationCodeToDevice___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleErrorOnSendSecurityCode:*(void *)(a1 + 40) alertCancelled:a2];
}

- (void)goBackToTrustedDevices
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACC2SVController goBackToTrustedDevices]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 183, 0, "Go back to trusted devices");
  }
  uint64_t v3 = [(ACC2SVController *)self secondFactorAuthUIController];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __42__ACC2SVController_goBackToTrustedDevices__block_invoke;
  v4[3] = &unk_265044098;
  v4[4] = self;
  [(ACC2SVAuthenticationUIControllerProtocol *)v3 chooseTrustedDeviceWithDeviceList:0 completion:v4];
}

uint64_t __42__ACC2SVController_goBackToTrustedDevices__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendVerificationCodeToDevice:a2];
}

- (id)createCancelError
{
  uint64_t v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = NSDictionary;
  id v4 = +[ACMBaseLocale localizedString:@"Authentication was canceled by user"];
  uint64_t v5 = [v3 dictionaryWithObject:v4 forKey:*MEMORY[0x263F08320]];

  return (id)[v2 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200050 userInfo:v5];
}

- (void)cancel2SVAuthentication
{
  id v3 = [(ACC2SVController *)self createCancelError];

  [(ACC2SVController *)self hideUIAndReturnError:v3];
}

- (void)hideUIAndReturnError:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __41__ACC2SVController_hideUIAndReturnError___block_invoke;
  v3[3] = &unk_265043CC8;
  v3[4] = self;
  v3[5] = a3;
  [(ACC2SVController *)self hideUIWithCompletion:v3];
}

uint64_t __41__ACC2SVController_hideUIAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) completionBlock];
  if (result)
  {
    uint64_t v3 = [*(id *)(a1 + 32) completionBlock];
    (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, *(void *)(a1 + 40), 0);
    id v4 = *(void **)(a1 + 32);
    return [v4 setCompletionBlock:0];
  }
  return result;
}

- (unint64_t)passcodeLengthFromEncryptedContent:(id)a3 withHmac:(id)a4 context:(id)a5
{
  if ([a3 length] && objc_msgSend(a4, "length"))
  {
    uint64_t v9 = [(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] decryptEncryptedContent:a3 withHmac:a4 context:a5];
    if (v9)
    {
      uint64_t v12 = 100;
      return [[[MEMORY[0x263F08AC0] propertyListWithData:v9 options:0 format:&v12 error:0] objectForKey:@"sl"] unsignedIntegerValue];
    }
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 229, 0, "Decrypted data is empty");
      }
    }
    return 0;
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 234, 0, "Invalid Parameters");
  }
  if (![a3 length] && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 238, 0, "Encrypted data is empty");
  }
  uint64_t v11 = [a4 length];
  unint64_t result = 0;
  if (!v11 && ACFLog)
  {
    if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACC2SVController passcodeLengthFromEncryptedContent:withHmac:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 242, 0, "Encrypted content hmac is empty");
    }
    return 0;
  }
  return result;
}

- (Class)deviceObjectClass
{
  return (Class)objc_opt_class();
}

- (void)generateAndSendSecCodeToDevice:(id)a3 withCompletion:(id)a4
{
  -[ACC2SVController setCurrentDevice:](self, "setCurrentDevice:");
  v7 = (void *)[(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] authContextWithRequest:[(ACC2SVController *)self authRequest] sessionToken:[(ACFMessage *)[(ACC2SVController *)self authRequest] sessionToken]];
  [v7 setPersonID:-[ACFMessage personId](-[ACC2SVController authRequest](self, "authRequest"), "personId"]];
  [v7 setSelectedDeviceId:[a3 deviceID]];
  [v7 setSelectedDeviceType:[a3 deviceType]];
  id v8 = (id)[a4 copy];
  uint64_t v9 = [(ACC2SVController *)self transportController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __66__ACC2SVController_generateAndSendSecCodeToDevice_withCompletion___block_invoke;
  v10[3] = &unk_2650440C0;
  v10[4] = self;
  v10[5] = v7;
  v10[6] = v8;
  [(ACC2SVTransportControllerProtocol *)v9 generateAndSendSecCodeWithContext:v7 completion:v10];
}

uint64_t __66__ACC2SVController_generateAndSendSecCodeToDevice_withCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  if (a3)
  {
    id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController generateAndSendSecCodeToDevice:withCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 270, 0, "Sec code sent successfully. Close Trusted devices screen and show verify code.");
    }
    if ([a2 objectForKey:@"end"]
      && [a2 objectForKey:@"enh"]
      && objc_msgSend(*(id *)(a1 + 32), "passcodeLengthFromEncryptedContent:withHmac:context:", objc_msgSend(a2, "objectForKey:", @"end"), objc_msgSend(a2, "objectForKey:", @"enh"), *(void *)(a1 + 40)))
    {
      id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    }
    else
    {
      uint64_t v6 = *(void *)(a1 + 48);
      v7 = (void *)MEMORY[0x263F087E8];
      id v8 = NSDictionary;
      id v9 = +[ACMBaseLocale localizedString:@"Invalid passcode length"];
      [v7 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-101212 userInfo:[v8 dictionaryWithObject:v9 forKey:MEMORY[0x263F08320]]];
      id v4 = *(uint64_t (**)(void))(v6 + 16);
    }
  }

  return v4();
}

- (void)verifySecureCode:(id)a3 withCompletion:(id)a4
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACC2SVController verifySecureCode:withCompletion:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 295, 0, "Verify security code.");
  }
  v7 = (void *)[(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] authContextWithRequest:[(ACC2SVController *)self authRequest] sessionToken:[(ACFMessage *)[(ACC2SVController *)self authRequest] sessionToken]];
  [v7 setPersonID:-[ACFMessage personId](-[ACC2SVController authRequest](self, "authRequest"), "personId"]];
  [v7 setSelectedDeviceId:-[ACC2SVTrustedDeviceObject deviceID](-[ACC2SVController currentDevice](self, "currentDevice"), "deviceID"]];
  [v7 setSelectedDeviceType:-[ACC2SVTrustedDeviceObject deviceType](-[ACC2SVController currentDevice](self, "currentDevice"), "deviceType")];
  [v7 setTwoStepVerificationCode:a3];
  id v8 = [(ACC2SVController *)self transportController];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __52__ACC2SVController_verifySecureCode_withCompletion___block_invoke;
  v9[3] = &unk_2650440C0;
  v9[4] = self;
  v9[5] = v7;
  void v9[6] = a4;
  [(ACC2SVTransportControllerProtocol *)v8 verifySecureCodeWithContext:v7 completion:v9];
}

uint64_t __52__ACC2SVController_verifySecureCode_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  if (![a3 code])
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController verifySecureCode:withCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 306, 0, "Verify sec code finished successfully.");
    }
    if (![*(id *)(a1 + 32) ssoTokenWithResponse:a2 context:*(void *)(a1 + 40)])
    {
      v7 = (void *)MEMORY[0x263F087E8];
      id v8 = NSDictionary;
      id v9 = +[ACMBaseLocale localizedString:@"Failed to create valid service ticket"];
      [v7 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v8 dictionaryWithObject:v9 forKey:*MEMORY[0x263F08320]]];
    }
  }
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v6 = *(uint64_t (**)(void))(result + 16);
    return v6();
  }
  return result;
}

- (void)start2StepVerificationWithRequest:(id)a3
{
  [(ACC2SVController *)self setAuthRequest:a3];
  id v4 = (void *)[(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] authContextWithRequest:[(ACC2SVController *)self authRequest] sessionToken:[(ACFMessage *)[(ACC2SVController *)self authRequest] sessionToken]];
  [v4 setPersonID:-[ACFMessage personID](-[ACC2SVController authRequest](self, "authRequest"), "personID"]];
  uint64_t v5 = [(ACC2SVController *)self transportController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke;
  v6[3] = &unk_265044110;
  v6[4] = self;
  v6[5] = v4;
  [(ACC2SVTransportControllerProtocol *)v5 loadTrustedDevicesWithContext:v4 completion:v6];
}

uint64_t __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACC2SVController start2StepVerificationWithRequest:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 351, 0, "Error %@ occurred while getting trusted devices.", a3);
    }
    uint64_t v5 = *(void **)(a1 + 32);
    return [v5 handleErrorOnGetTrustedDevices:a3];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController start2StepVerificationWithRequest:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 331, 0, "Show trusted devices list screen.");
    }
    return [((id)objc_msgSend(*(id *)(a1 + 32), "delegate")) twoSVController:prepareUIWithCompletion:];
  }
}

uint64_t __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke_2(uint64_t a1)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v2 = (void *)[*(id *)(a1 + 32) trustedDevicesFromResponse:*(void *)(a1 + 40) withContext:*(void *)(a1 + 48)];
  if ([v2 count])
  {
    uint64_t v3 = (void *)[*(id *)(a1 + 32) secondFactorAuthUIController];
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke_3;
    v7[3] = &unk_265044098;
    v7[4] = *(void *)(a1 + 32);
    return [v3 chooseTrustedDeviceWithDeviceList:v2 completion:v7];
  }
  else
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController start2StepVerificationWithRequest:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 344, 0, "Devices list is empty..");
      }
    }
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = *MEMORY[0x263F08320];
    v9[0] = +[ACMBaseLocale localizedString:@"Device list is empty."];
    return [v5 hideUIAndReturnError:[v6 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-101112 userInfo:[NSDictionary dictionaryWithObjects:v9 forKeys:&v8 count:1]]];
  }
}

uint64_t __54__ACC2SVController_start2StepVerificationWithRequest___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) sendVerificationCodeToDevice:a2];
}

- (void)handleErrorOnGetTrustedDevices:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __51__ACC2SVController_handleErrorOnGetTrustedDevices___block_invoke;
  v3[3] = &unk_265044138;
  v3[4] = self;
  [(ACC2SVController *)self reportError:a3 completionBlock:v3];
}

uint64_t __51__ACC2SVController_handleErrorOnGetTrustedDevices___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) enterCredentials];
}

- (void)refreshTrustedDevicesList
{
  uint64_t v3 = (void *)[(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] authContextWithRequest:[(ACC2SVController *)self authRequest] sessionToken:[(ACFMessage *)[(ACC2SVController *)self authRequest] sessionToken]];
  [v3 setPersonID:-[ACFMessage personID](-[ACC2SVController authRequest](self, "authRequest"), "personID"]];
  id v4 = [(ACC2SVController *)self transportController];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __45__ACC2SVController_refreshTrustedDevicesList__block_invoke;
  v5[3] = &unk_265044110;
  v5[4] = self;
  void v5[5] = v3;
  [(ACC2SVTransportControllerProtocol *)v4 loadTrustedDevicesWithContext:v3 completion:v5];
}

void __45__ACC2SVController_refreshTrustedDevicesList__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog)
    {
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController refreshTrustedDevicesList]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 381, 0, "Error %@ occurred while refreshing trusted devices. No need to do anything", a3);
      }
    }
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController refreshTrustedDevicesList]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 374, 0, "Refresh the trusted devices list.");
    }
    uint64_t v6 = [*(id *)(a1 + 32) trustedDevicesFromResponse:a2 withContext:*(void *)(a1 + 40)];
    v7 = (void *)[*(id *)(a1 + 32) secondFactorAuthUIController];
    [v7 resetTrustedDevicesViewControllerWithDeviceList:v6];
  }
}

- (id)createTrustedDeviceWithDictionary:(id)a3
{
  uint64_t v3 = [objc_alloc(-[ACC2SVController deviceObjectClass](self, "deviceObjectClass")) initWithDictionary:a3];

  return v3;
}

- (id)trustedDevicesFromResponse:(id)a3 withContext:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (a3)
  {
    v7 = (void *)[a3 objectForKey:@"end"];
    uint64_t v8 = (void *)[a3 objectForKey:@"enh"];
    if ([v7 length] && objc_msgSend(v8, "length"))
    {
      id v9 = (void *)[(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] decryptEncryptedContent:v7 withHmac:v8 context:a4];
      if ([v9 length])
      {
        uint64_t v24 = 100;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        v10 = [[objc_msgSend(MEMORY[0x263F08AC0], "propertyListWithData:options:format:error:", v9, 0, &v24, 0) objectForKey:@"td"];
        uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          v13 = 0;
          uint64_t v14 = *(void *)v21;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v21 != v14) {
                objc_enumerationMutation(v10);
              }
              uint64_t v16 = *(void *)(*((void *)&v20 + 1) + 8 * i);
              if (!v13) {
                v13 = (void *)[MEMORY[0x263EFF980] array];
              }
              [v13 addObject:-[ACC2SVController createTrustedDeviceWithDictionary:](self, "createTrustedDeviceWithDictionary:", v16)];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v20 objects:v25 count:16];
          }
          while (v12);
          goto LABEL_34;
        }
      }
      else if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0)
      {
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 422, 0, "Decrypted data is empty");
      }
    }
    else
    {
      if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 427, 0, "Invalid Parameters");
      }
      if (![v7 length] && ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 431, 0, "Devices encrypted data is empty");
      }
      uint64_t v17 = [v8 length];
      v13 = 0;
      if (v17 || !ACFLog) {
        goto LABEL_34;
      }
      if ((ACFLogSettingsGetLevelMask() & 8) != 0) {
        ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 435, 0, "Device data hmac is empty");
      }
    }
    v13 = 0;
LABEL_34:
    uint64_t v19 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"lastUseDate" ascending:0];
    return (id)[v13 sortedArrayUsingDescriptors:[MEMORY[0x263EFF8C0] arrayWithObject:v19]];
  }
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
    ACFLog(3, (uint64_t)"-[ACC2SVController trustedDevicesFromResponse:withContext:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 445, 0, "Trusted Devices Response is empty");
  }
  return 0;
}

- (id)ssoTokenWithResponse:(id)a3 context:(id)a4
{
  uint64_t v5 = (void *)[[-[ACC2SVController ticketManager](self, "ticketManager") createSSOTokenWithContent:context:](-[ACC2SVController ticketManager](self, "ticketManager"), "createSSOTokenWithContent:context:", -[ACCTicketManagerProtocol decryptEncryptedContent:withHmac:context:](-[ACC2SVController ticketManager](self, "ticketManager"), "decryptEncryptedContent:withHmac:context:", [a3 objectForKey:@"pt"], objc_msgSend(a3, "objectForKey:", @"ph"), a4), a4);
  uint64_t v6 = [(ACCTicketManagerProtocol *)[(ACC2SVController *)self ticketManager] serviceTicketStringWithRequest:[(ACC2SVController *)self authRequest] ssoToken:v5];
  if (v6)
  {
    [(ACC2SVController *)self updateSSOToken:v5 withServiceTicket:v6 request:[(ACC2SVController *)self authRequest]];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACC2SVController ssoTokenWithResponse:context:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 461, 0, "Failed to create valid serviceTicket");
    }
    return 0;
  }
  return v5;
}

- (void)handleErrorOnSendSecurityCode:(id)a3 alertCancelled:(BOOL)a4
{
  unint64_t v5 = [a3 code] + 200270;
  if (v5 > 0x3C) {
    goto LABEL_16;
  }
  if (((1 << v5) & 0x1004000000000001) != 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnSendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 478, 0, "Session expired. Ask user to sign in again.");
    }
    [(ACC2SVController *)self enterCredentials];
    return;
  }
  if (((1 << v5) & 0x10040000000) != 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnSendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 485, 0, "Device not available. Refresh list of trusted devices");
    }
    [(ACC2SVController *)self refreshTrustedDevicesList];
  }
  else
  {
LABEL_16:
    uint64_t v6 = [(ACC2SVController *)self secondFactorAuthUIController];
    [(ACC2SVAuthenticationUIControllerProtocol *)v6 resetTrustedDevicesViewControllerWithDeviceList:0];
  }
}

- (void)handleErrorOnResendSecurityCode:(id)a3 alertCancelled:(BOOL)a4
{
  unint64_t v5 = [a3 code] + 200270;
  if (v5 > 0x3C) {
    goto LABEL_14;
  }
  if (((1 << v5) & 0x1004000000000001) != 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnResendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 502, 0, "Session expired on resend code. Ask user to sign in again.");
    }
    [(ACC2SVController *)self enterCredentials];
    return;
  }
  if (((1 << v5) & 0x10040000000) != 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController handleErrorOnResendSecurityCode:alertCancelled:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 509, 0, "Device not available on resend code. Show trusted devices");
    }
    uint64_t v6 = [(ACC2SVController *)self secondFactorAuthUIController];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __67__ACC2SVController_handleErrorOnResendSecurityCode_alertCancelled___block_invoke;
    v8[3] = &unk_265043B90;
    v8[4] = self;
    [(ACC2SVAuthenticationUIControllerProtocol *)v6 handleFailoverWithCompletion:v8];
  }
  else
  {
LABEL_14:
    v7 = [(ACC2SVController *)self secondFactorAuthUIController];
    [(ACC2SVAuthenticationUIControllerProtocol *)v7 resetCodeVerificationViewController];
  }
}

uint64_t __67__ACC2SVController_handleErrorOnResendSecurityCode_alertCancelled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) goBackToTrustedDevices];
}

- (void)verifySecurityCodeDidFinishWithToken:(id)a3
{
  if (a3)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = (void *)MEMORY[0x263F087E8];
    v7 = NSDictionary;
    id v8 = +[ACMBaseLocale localizedString:@"Two-step verification response is empty."];
    uint64_t v5 = [v6 errorWithDomain:@"ACCAppleConnectErrorDomain" code:-200200 userInfo:[v7 dictionaryWithObject:v8 forKey:MEMORY[0x263F08320]]];
  }
  if ([(ACC2SVController *)self completionBlock])
  {
    id v9 = [(ACC2SVController *)self completionBlock];
    v9[2](v9, v5, a3);
    [(ACC2SVController *)self setCompletionBlock:0];
  }
}

- (void)verifySecurityCodeDidFailWithError:(id)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __55__ACC2SVController_verifySecurityCodeDidFailWithError___block_invoke;
  v3[3] = &unk_265044048;
  v3[4] = a3;
  void v3[5] = self;
  [(ACC2SVController *)self reportError:a3 completionBlock:v3];
}

uint64_t __55__ACC2SVController_verifySecurityCodeDidFailWithError___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) code] + 200270;
  if (v2 > 0x3C) {
    goto LABEL_16;
  }
  if (((1 << v2) & 0x1004000000000001) != 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController verifySecurityCodeDidFailWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 547, 0, "Session expired on verify code. Ask user to sign in again.");
    }
    uint64_t v3 = *(void **)(a1 + 40);
    return [v3 enterCredentials];
  }
  if (((1 << v2) & 0x10000000400) != 0)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController verifySecurityCodeDidFailWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 554, 0, "Device not available on verify code. Show list of trusted devices");
    }
    uint64_t v5 = *(void **)(a1 + 40);
    return [v5 goBackToTrustedDevices];
  }
  else
  {
LABEL_16:
    uint64_t v6 = (void *)[*(id *)(a1 + 40) secondFactorAuthUIController];
    return [v6 resetCodeVerificationViewController];
  }
}

- (void)reportError:(id)a3 completionBlock:(id)a4
{
  id v5 = a3;
  if ([a3 code] == -200240
    && ![(ACC2SVTrustedDeviceObject *)[(ACC2SVController *)self currentDevice] isTOTPDevice]&& ![(ACC2SVTrustedDeviceObject *)[(ACC2SVController *)self currentDevice] isSMSDevice])
  {
    id v7 = [(id)[(id)objc_msgSend(v5, "userInfo") mutableCopy]];
    id v8 = +[ACMBaseLocale localizedString:@"You have sent too many codes to verify your device. Please try again later."];
    [v7 setObject:v8 forKeyedSubscript:*MEMORY[0x263F08320]];
    id v5 = (id)[MEMORY[0x263F087E8] errorWithDomain:[v5 domain] code:[v5 code] userInfo:v7];
  }
  id v9 = [(ACC2SVController *)self secondFactorAuthUIController];

  [(ACC2SVAuthenticationUIControllerProtocol *)v9 showAlertWithError:v5 completion:a4];
}

- (void)uiController:(id)a3 resendVerificationCodeWithCompletion:(id)a4
{
  if ([(ACC2SVController *)self currentDevice])
  {
    id v6 = (id)[a4 copy];
    id v7 = [(ACC2SVController *)self currentDevice];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    void v9[2] = __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke;
    v9[3] = &unk_265044160;
    v9[4] = self;
    v9[5] = v6;
    [(ACC2SVController *)self generateAndSendSecCodeToDevice:v7 withCompletion:v9];
  }
  else if (a4)
  {
    id v8 = (void (*)(id, void))*((void *)a4 + 2);
    v8(a4, 0);
  }
}

uint64_t __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 8) != 0) {
      ACFLog(3, (uint64_t)"-[ACC2SVController uiController:resendVerificationCodeWithCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 601, 0, "Error %@ occurred while resend security code.", a3);
    }
    id v5 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke_2;
    v7[3] = &unk_265044048;
    v7[4] = v5;
    void v7[5] = a3;
    [v5 reportError:a3 completionBlock:v7];
  }
  else
  {
    if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
      ACFLog(6, (uint64_t)"-[ACC2SVController uiController:resendVerificationCodeWithCompletion:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Framework/SubProjects/Core/Sources/ACC2SVController.m", 596, 0, "Sec code resent successfully. Reset code verify screen.");
    }
    [objc_msgSend(*(id *)(a1 + 32), "secondFactorAuthUIController") resetCodeVerificationViewController];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, BOOL))(result + 16))(result, a3 == 0);
  }
  return result;
}

uint64_t __70__ACC2SVController_uiController_resendVerificationCodeWithCompletion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleErrorOnResendSecurityCode:*(void *)(a1 + 40) alertCancelled:a2];
}

- (void)uiControllerUserIsUnableToReceiveVerificationCode:(id)a3
{
  id v4 = [(ACC2SVController *)self delegate];
  uint64_t v5 = [(ACFMessage *)[(ACC2SVController *)self authRequest] realm];

  [(ACC2SVControllerDelegate *)v4 twoSVController:self openMyAppleConnectForRealm:v5];
}

- (void)uiController:(id)a3 getImageWithURL:(id)a4 completion:(id)a5
{
  id v7 = [(ACC2SVController *)self transportController];

  [(ACC2SVTransportControllerProtocol *)v7 getImageWithURL:a4 completion:a5];
}

- (void)uiControllerCancelGettingImages:(id)a3
{
  uint64_t v3 = [(ACC2SVController *)self transportController];

  [(ACC2SVTransportControllerProtocol *)v3 cancelImageFetching];
}

- (void)uiControllerHideViewAnimated:(id)a3
{
  id v4 = [(ACC2SVController *)self delegate];

  [(ACC2SVControllerDelegate *)v4 twoSVControllerWillClose:self];
}

- (void)uiControllerSetup:(id)a3
{
  id v4 = [(ACC2SVController *)self delegate];
  uint64_t v5 = [(ACFMessage *)[(ACC2SVController *)self authRequest] realm];

  [(ACC2SVControllerDelegate *)v4 twoSVController:self openMyAppleConnectForRealm:v5];
}

- (id)uiControllerTitle:(id)a3
{
  if (![(ACFMessage *)[(ACC2SVController *)self authRequest] applicationName]) {
    return &stru_26F261788;
  }
  id v4 = [(ACC2SVController *)self authRequest];

  return (id)[(ACFMessage *)v4 applicationName];
}

- (id)uiControllerRealm:(id)a3
{
  uint64_t v3 = [(ACC2SVController *)self authRequest];

  return (id)[(ACFMessage *)v3 realm];
}

- (ACC2SVControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACC2SVControllerDelegate *)a3;
}

- (ACC2SVAuthenticationUIControllerProtocol)secondFactorAuthUIController
{
  return self->_secondFactorAuthUIController;
}

- (ACFMessage)authRequest
{
  return self->_authRequest;
}

- (void)setAuthRequest:(id)a3
{
}

- (ACC2SVTrustedDeviceObject)currentDevice
{
  return self->_currentDevice;
}

- (void)setCurrentDevice:(id)a3
{
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (ACC2SVTransportControllerProtocol)transportController
{
  return self->_transportController;
}

- (void)setTransportController:(id)a3
{
}

@end