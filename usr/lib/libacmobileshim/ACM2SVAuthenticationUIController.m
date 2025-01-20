@interface ACM2SVAuthenticationUIController
- (ACC2SVAuthenticationUIControllerDelegate)delegate;
- (ACM2SVAuthenticationUIController)initWithParentViewController:(id)a3;
- (ACM2SVCodeVerificationViewController)codeVerificationViewController;
- (ACM2SVTrustedDevicesViewController)trustedDevicesViewController;
- (UIColor)backgroundColor;
- (UIColor)labelTextColor;
- (UIColor)textColor;
- (UIColor)tintColor;
- (UIViewController)parentViewController;
- (int64_t)keyboardAppearance;
- (int64_t)statusBarStyle;
- (void)cancelInProgressImageDownloads;
- (void)chooseTrustedDeviceWithDeviceList:(id)a3 completion:(id)a4;
- (void)codeVerificationViewControllerNeedsResendCode:(id)a3;
- (void)dealloc;
- (void)downloadImageWithURL:(id)a3 completionBlock:(id)a4;
- (void)enterVerificationCodeWithLength:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5;
- (void)handleFailoverWithCompletion:(id)a3;
- (void)hideEnterVerificationCodeViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)hideTrustedDevicesViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)hideUIAnimated:(BOOL)a3 withCompletion:(id)a4;
- (void)resetCodeVerificationViewController;
- (void)resetTrustedDevicesViewControllerWithDeviceList:(id)a3;
- (void)setCodeVerificationViewController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setTrustedDevicesViewController:(id)a3;
- (void)showAlertWithError:(id)a3 completion:(id)a4;
- (void)trustedDevicesViewControllerDidSelectUnableReceiveMessages:(id)a3;
- (void)trustedDevicesViewControllerNeedsRefresh:(id)a3;
@end

@implementation ACM2SVAuthenticationUIController

- (ACM2SVAuthenticationUIController)initWithParentViewController:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ACM2SVAuthenticationUIController;
  v4 = [(ACM2SVAuthenticationUIController *)&v7 init];
  v5 = v4;
  if (v4) {
    [(ACM2SVAuthenticationUIController *)v4 setParentViewController:a3];
  }
  return v5;
}

- (void)dealloc
{
  if (self->_trustedDevicesViewController)
  {
    [(ACM2SVTrustedDevicesViewController *)[(ACM2SVAuthenticationUIController *)self trustedDevicesViewController] setDelegate:0];
    [(ACM2SVAuthenticationUIController *)self setTrustedDevicesViewController:0];
  }
  if (self->_codeVerificationViewController)
  {
    [(ACM2SVCodeVerificationViewController *)[(ACM2SVAuthenticationUIController *)self codeVerificationViewController] setDelegate:0];
    [(ACM2SVAuthenticationUIController *)self setCodeVerificationViewController:0];
  }
  [(ACM2SVAuthenticationUIController *)self setDelegate:0];
  [(ACM2SVAuthenticationUIController *)self setParentViewController:0];
  v3.receiver = self;
  v3.super_class = (Class)ACM2SVAuthenticationUIController;
  [(ACM2SVAuthenticationUIController *)&v3 dealloc];
}

- (void)hideUIAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  id v6 = (id)[a4 copy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__ACM2SVAuthenticationUIController_hideUIAnimated_withCompletion___block_invoke;
  v7[3] = &unk_265043EC0;
  BOOL v8 = v4;
  v7[4] = self;
  v7[5] = v6;
  [(ACM2SVAuthenticationUIController *)self hideTrustedDevicesViewControllerAnimated:v4 withCompletion:v7];
}

uint64_t __66__ACM2SVAuthenticationUIController_hideUIAnimated_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideEnterVerificationCodeViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
}

- (void)handleFailoverWithCompletion:(id)a3
{
}

- (int64_t)statusBarStyle
{
  if (floor(*MEMORY[0x263F080F8]) <= 993.0) {
    return 0;
  }
  v2 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  return [v2 statusBarStyle];
}

- (UIColor)textColor
{
  int64_t v2 = [(ACM2SVAuthenticationUIController *)self statusBarStyle];
  objc_super v3 = (void *)MEMORY[0x263F1C550];
  if (v2)
  {
    return (UIColor *)[v3 whiteColor];
  }
  else
  {
    return (UIColor *)[v3 blackColor];
  }
}

- (UIColor)labelTextColor
{
  int64_t v2 = [(ACM2SVAuthenticationUIController *)self statusBarStyle];
  objc_super v3 = (void *)MEMORY[0x263F1C550];
  if (v2)
  {
    return (UIColor *)[v3 lightGrayColor];
  }
  else
  {
    return (UIColor *)[v3 blackColor];
  }
}

- (UIColor)backgroundColor
{
  int64_t v2 = [(ACM2SVAuthenticationUIController *)self statusBarStyle];
  objc_super v3 = (void *)MEMORY[0x263F1C550];
  if (v2)
  {
    return (UIColor *)[v3 blackColor];
  }
  else
  {
    return (UIColor *)[v3 whiteColor];
  }
}

- (int64_t)keyboardAppearance
{
  return [(ACM2SVAuthenticationUIController *)self statusBarStyle] != 0;
}

- (UIColor)tintColor
{
  return 0;
}

- (ACM2SVTrustedDevicesViewController)trustedDevicesViewController
{
  trustedDevicesViewController = self->_trustedDevicesViewController;
  if (!trustedDevicesViewController)
  {
    self->_trustedDevicesViewController = [[ACM2SVTrustedDevicesViewController alloc] initWithDelegate:self];
    [(ACM2SVTrustedDevicesViewController *)self->_trustedDevicesViewController setTextColor:[(ACM2SVAuthenticationUIController *)self textColor]];
    [(ACM2SVTrustedDevicesViewController *)self->_trustedDevicesViewController setBackgroundColor:[(ACM2SVAuthenticationUIController *)self backgroundColor]];
    [(ACM2SVTrustedDevicesViewController *)self->_trustedDevicesViewController setLabelTextColor:[(ACM2SVAuthenticationUIController *)self labelTextColor]];
    [(ACM2SVTrustedDevicesViewController *)self->_trustedDevicesViewController setSuggestedStatusBarStyle:[(ACM2SVAuthenticationUIController *)self statusBarStyle]];
    [(ACM2SVTrustedDevicesViewController *)self->_trustedDevicesViewController view];
    if (objc_opt_respondsToSelector()) {
      [((id)-[ACM2SVTrustedDevicesViewController view](self->_trustedDevicesViewController, "view")) setTintColor: -[ACM2SVAuthenticationUIController tintColor](self, "tintColor")];
    }
    [[MEMORY[0x263F1C920] mainScreen] applicationFrame];
    [(-[ACM2SVTrustedDevicesViewController view](self->_trustedDevicesViewController, "view")) setFrame:v4, v5, v6, v7];
    trustedDevicesViewController = self->_trustedDevicesViewController;
  }
  BOOL v8 = trustedDevicesViewController;

  return v8;
}

- (ACM2SVCodeVerificationViewController)codeVerificationViewController
{
  codeVerificationViewController = self->_codeVerificationViewController;
  if (!codeVerificationViewController)
  {
    self->_codeVerificationViewController = [[ACM2SVCodeVerificationViewController alloc] initWithDelegate:self];
    [(ACM2SVCodeVerificationViewController *)self->_codeVerificationViewController setSuggestedStatusBarStyle:[(ACM2SVAuthenticationUIController *)self statusBarStyle]];
    [(ACM2SVCodeVerificationViewController *)self->_codeVerificationViewController setBackgroundColor:[(ACM2SVAuthenticationUIController *)self backgroundColor]];
    [(ACM2SVCodeVerificationViewController *)self->_codeVerificationViewController setTextColor:[(ACM2SVAuthenticationUIController *)self textColor]];
    [(ACM2SVCodeVerificationViewController *)self->_codeVerificationViewController setKeyboardAppearance:[(ACM2SVAuthenticationUIController *)self keyboardAppearance]];
    [(-[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view")) setBackgroundColor:-[ACM2SVAuthenticationUIController backgroundColor](self, "backgroundColor")];
    [(ACM2SVCodeVerificationViewController *)self->_codeVerificationViewController view];
    if (objc_opt_respondsToSelector()) {
      [((id)-[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view")) setTintColor: -[ACM2SVAuthenticationUIController tintColor](self, "tintColor")];
    }
    [[MEMORY[0x263F1C920] mainScreen] applicationFrame];
    [((id)-[ACM2SVCodeVerificationViewController view](self->_codeVerificationViewController, "view")) setFrame:v4, v5, v6, v7];
    codeVerificationViewController = self->_codeVerificationViewController;
  }
  BOOL v8 = codeVerificationViewController;

  return v8;
}

- (void)resetTrustedDevicesViewControllerWithDeviceList:(id)a3
{
  double v4 = [(ACM2SVAuthenticationUIController *)self trustedDevicesViewController];

  [(ACM2SVTrustedDevicesViewController *)v4 resetWithDeviceList:a3];
}

- (void)resetCodeVerificationViewController
{
  int64_t v2 = [(ACM2SVAuthenticationUIController *)self codeVerificationViewController];

  [(ACM2SVCodeVerificationViewController *)v2 reset];
}

- (void)chooseTrustedDeviceWithDeviceList:(id)a3 completion:(id)a4
{
  id v6 = (id)[a4 copy];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke;
  v7[3] = &unk_265043F10;
  v7[4] = self;
  v7[5] = a3;
  void v7[6] = v6;
  [(ACM2SVAuthenticationUIController *)self hideEnterVerificationCodeViewControllerAnimated:1 withCompletion:v7];
}

uint64_t __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke(uint64_t a1)
{
  int64_t v2 = (void *)[*(id *)(a1 + 32) trustedDevicesViewController];
  uint64_t v3 = [*(id *)(a1 + 32) parentViewController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke_2;
  v6[3] = &unk_265043EE8;
  uint64_t v4 = *(void *)(a1 + 40);
  v6[4] = *(void *)(a1 + 48);
  return [v2 presentWithParentViewController:v3 deviceList:v4 completion:v6];
}

uint64_t __81__ACM2SVAuthenticationUIController_chooseTrustedDeviceWithDeviceList_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2 && ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACM2SVAuthenticationUIController chooseTrustedDeviceWithDeviceList:completion:]_block_invoke_2", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVAuthenticationUIController.m", 177, 0, "Ask delegate to send code");
  }
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)enterVerificationCodeWithLength:(unint64_t)a3 forDevice:(id)a4 completion:(id)a5
{
  id v8 = (id)[a5 copy];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __89__ACM2SVAuthenticationUIController_enterVerificationCodeWithLength_forDevice_completion___block_invoke;
  v9[3] = &unk_265043F38;
  v9[4] = self;
  v9[5] = a4;
  v9[6] = v8;
  v9[7] = a3;
  [(ACM2SVAuthenticationUIController *)self hideTrustedDevicesViewControllerAnimated:1 withCompletion:v9];
}

uint64_t __89__ACM2SVAuthenticationUIController_enterVerificationCodeWithLength_forDevice_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 56)) {
    [objc_msgSend(*(id *)(a1 + 32), "codeVerificationViewController") setPasscodeLength:*(void *)(a1 + 56)];
  }
  [objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "codeVerificationViewController"), "setCanResendTheCode:", objc_msgSend(*(id *)(a1 + 40), "isTOTPDevice") ^ 1)];
  int64_t v2 = (void *)[*(id *)(a1 + 32) codeVerificationViewController];
  uint64_t v3 = [*(id *)(a1 + 32) parentViewController];
  uint64_t v4 = *(void *)(a1 + 48);

  return [v2 presentWithParentViewController:v3 completion:v4];
}

- (void)hideTrustedDevicesViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v5 = a3;
  if ([(ACM2SVTrustedDevicesViewController *)[(ACM2SVAuthenticationUIController *)self trustedDevicesViewController] isBeingPresented])
  {
    id v7 = (id)[a4 copy];
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __92__ACM2SVAuthenticationUIController_hideTrustedDevicesViewControllerAnimated_withCompletion___block_invoke;
    block[3] = &unk_265043EC0;
    BOOL v12 = v5;
    block[4] = self;
    block[5] = v7;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
  }
  else if ([(ACM2SVTrustedDevicesViewController *)[(ACM2SVAuthenticationUIController *)self trustedDevicesViewController] presentingViewController]&& ([(ACM2SVTrustedDevicesViewController *)[(ACM2SVAuthenticationUIController *)self trustedDevicesViewController] isBeingDismissed] & 1) == 0)
  {
    v10 = [(ACM2SVAuthenticationUIController *)self trustedDevicesViewController];
    [(ACM2SVTrustedDevicesViewController *)v10 hideAnimated:v5 withCompletion:a4];
  }
  else if (a4)
  {
    v9 = (void (*)(id))*((void *)a4 + 2);
    v9(a4);
  }
}

uint64_t __92__ACM2SVAuthenticationUIController_hideTrustedDevicesViewControllerAnimated_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideTrustedDevicesViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
}

- (void)hideEnterVerificationCodeViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  if ([(ACM2SVCodeVerificationViewController *)[(ACM2SVAuthenticationUIController *)self codeVerificationViewController] isBeingPresented])
  {
    id v7 = (id)[a4 copy];
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __99__ACM2SVAuthenticationUIController_hideEnterVerificationCodeViewControllerAnimated_withCompletion___block_invoke;
    block[3] = &unk_265043EC0;
    BOOL v12 = a3;
    block[4] = self;
    block[5] = v7;
    dispatch_after(v8, MEMORY[0x263EF83A0], block);
  }
  else if ([(ACM2SVCodeVerificationViewController *)[(ACM2SVAuthenticationUIController *)self codeVerificationViewController] presentingViewController]&& ([(ACM2SVCodeVerificationViewController *)[(ACM2SVAuthenticationUIController *)self codeVerificationViewController] isBeingDismissed] & 1) == 0)
  {
    v10 = [(ACM2SVAuthenticationUIController *)self codeVerificationViewController];
    [(ACM2SVCodeVerificationViewController *)v10 hideAnimated:1 withCompletion:a4];
  }
  else if (a4)
  {
    v9 = (void (*)(id))*((void *)a4 + 2);
    v9(a4);
  }
}

uint64_t __99__ACM2SVAuthenticationUIController_hideEnterVerificationCodeViewControllerAnimated_withCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) hideEnterVerificationCodeViewControllerAnimated:*(unsigned __int8 *)(a1 + 48) withCompletion:*(void *)(a1 + 40)];
}

- (void)showAlertWithError:(id)a3 completion:(id)a4
{
  id v5 = (id)[a4 copy];
  id v6 = -[ACMAlertView initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:]([ACMAlertView alloc], "initWithTitle:message:delegate:cancelButtonTitle:otherButtonTitles:", &stru_26F261788, [a3 localizedDescription], 0, 0, +[ACMBaseLocale localizedString:](ACMBaseLocale, "localizedString:", @"OK"), 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__ACM2SVAuthenticationUIController_showAlertWithError_completion___block_invoke;
  v7[3] = &unk_265043F60;
  v7[4] = v6;
  v7[5] = v5;
  [(ACMAlertView *)v6 showWithCompletionBlock:v7];
}

uint64_t __66__ACM2SVAuthenticationUIController_showAlertWithError_completion___block_invoke(uint64_t result)
{
  if (*(void *)(result + 40))
  {
    uint64_t v1 = result;
    [*(id *)(result + 32) cancelButtonIndex];
    int64_t v2 = *(uint64_t (**)(void))(*(void *)(v1 + 40) + 16);
    return v2();
  }
  return result;
}

- (void)trustedDevicesViewControllerDidSelectUnableReceiveMessages:(id)a3
{
  uint64_t v4 = [(ACM2SVAuthenticationUIController *)self delegate];

  [(ACC2SVAuthenticationUIControllerDelegate *)v4 uiControllerUserIsUnableToReceiveVerificationCode:self];
}

- (void)trustedDevicesViewControllerNeedsRefresh:(id)a3
{
  uint64_t v4 = [(ACM2SVAuthenticationUIController *)self delegate];

  [(ACC2SVAuthenticationUIControllerDelegate *)v4 uiControllerRefreshDeviceList:self];
}

- (void)downloadImageWithURL:(id)a3 completionBlock:(id)a4
{
  id v7 = [(ACM2SVAuthenticationUIController *)self delegate];

  [(ACC2SVAuthenticationUIControllerDelegate *)v7 uiController:self getImageWithURL:a3 completion:a4];
}

- (void)cancelInProgressImageDownloads
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACM2SVAuthenticationUIController cancelInProgressImageDownloads]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVAuthenticationUIController.m", 277, 0, "Ask delegate to cancel image downloads");
  }
  uint64_t v3 = [(ACM2SVAuthenticationUIController *)self delegate];

  [(ACC2SVAuthenticationUIControllerDelegate *)v3 uiControllerCancelGettingImages:self];
}

- (void)codeVerificationViewControllerNeedsResendCode:(id)a3
{
  if (ACFLog && (ACFLogSettingsGetLevelMask() & 0x40) != 0) {
    ACFLog(6, (uint64_t)"-[ACM2SVAuthenticationUIController codeVerificationViewControllerNeedsResendCode:]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACM2SVAuthenticationUIController.m", 285, 0, "Ask delegate to resend code");
  }
  uint64_t v4 = [(ACM2SVAuthenticationUIController *)self delegate];

  [(ACC2SVAuthenticationUIControllerDelegate *)v4 uiController:self resendVerificationCodeWithCompletion:0];
}

- (ACC2SVAuthenticationUIControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACC2SVAuthenticationUIControllerDelegate *)a3;
}

- (UIViewController)parentViewController
{
  return self->_parentViewController;
}

- (void)setParentViewController:(id)a3
{
}

- (void)setTrustedDevicesViewController:(id)a3
{
}

- (void)setCodeVerificationViewController:(id)a3
{
}

@end