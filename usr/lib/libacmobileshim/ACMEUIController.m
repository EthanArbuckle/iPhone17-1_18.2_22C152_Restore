@interface ACMEUIController
- (ACMAppleConnectImplComponents)components;
- (ACMBaseAuthenticationRequest)request;
- (ACMEUIController)init;
- (ACMSignInDialogProtocol)signInDialog;
- (ACMUIControllerDelegate)delegate;
- (BOOL)isWidgetEnabled;
- (BOOL)isWidgetShown;
- (BOOL)shouldAuthenticateOnUserInput;
- (BOOL)useAlertView;
- (BOOL)useCustomWidget;
- (CGPoint)widgetPosition;
- (Class)customSignInClass;
- (Class)iTunesSignInClass;
- (Class)signInWidgetClass;
- (Class)standardSignInClass;
- (NSMutableSet)shownAlerts;
- (NSString)accountNameFieldPlaceholder;
- (NSString)password;
- (NSString)widgetAccountLabel;
- (UIColor)backgroundColor;
- (UIImage)logoImage;
- (UIView)managerApprovalDialogSummaryView;
- (id)cancelButton;
- (id)createAlertDialog;
- (id)createCustomWidget;
- (id)createStandardWidget;
- (id)signInButton;
- (int64_t)widgetPasswordReturnKeyType;
- (unint64_t)signInDialogContentStyle;
- (unint64_t)signInStyle;
- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4;
- (void)cancelSignInWidget;
- (void)dealloc;
- (void)hideSignInWidgetWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)onIForgot:(id)a3;
- (void)onManageAppleID:(id)a3;
- (void)onSignIn:(id)a3;
- (void)onSignInCancel:(id)a3;
- (void)setAccountNameFieldPlaceholder:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLogoImage:(id)a3;
- (void)setPassword:(id)a3;
- (void)setRequest:(id)a3;
- (void)setShouldAuthenticateOnUserInput:(BOOL)a3;
- (void)setShownAlerts:(id)a3;
- (void)setSignInButton:(id)a3;
- (void)setSignInDialog:(id)a3;
- (void)setSignInStyle:(unint64_t)a3;
- (void)setWidgetAccountLabel:(id)a3;
- (void)setWidgetEnabled:(BOOL)a3;
- (void)setWidgetPasswordReturnKeyType:(int64_t)a3;
- (void)setWidgetPosition:(CGPoint)a3;
- (void)showAlertWithAlertMessage:(id)a3 buttonTitle:(id)a4 cancelButtonTitle:(id)a5 errorTag:(int64_t)a6;
- (void)showSignInWidgetWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)signInDialogDidBecomeDisabled;
- (void)signInDialogDidBecomeEnabled;
- (void)signInDialogWillBecomeDisabled;
- (void)signInDialogWillBecomeEnabled;
@end

@implementation ACMEUIController

- (ACMEUIController)init
{
  v4.receiver = self;
  v4.super_class = (Class)ACMEUIController;
  v2 = [(ACMEUIController *)&v4 init];
  if (v2) {
    [(ACMEUIController *)v2 setShownAlerts:(id)objc_opt_new()];
  }
  return v2;
}

- (void)dealloc
{
  [(ACMSignInDialogProtocol *)[(ACMEUIController *)self signInDialog] setDelegate:0];
  [(ACMEUIController *)self setSignInDialog:0];
  [(ACMEUIController *)self setShownAlerts:0];
  [(ACMEUIController *)self setRequest:0];
  [(ACMEUIController *)self setLogoImage:0];
  [(ACMEUIController *)self setBackgroundColor:0];
  [(ACMEUIController *)self setAccountNameFieldPlaceholder:0];
  [(ACMEUIController *)self setWidgetAccountLabel:0];
  [(ACMEUIController *)self setSignInButton:0];
  [(ACMEUIController *)self setCancelButton:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMEUIController;
  [(ACMEUIController *)&v3 dealloc];
}

- (ACMAppleConnectImplComponents)components
{
  return (ACMAppleConnectImplComponents *)+[ACMAppleConnectImplComponents components];
}

- (void)setWidgetEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  self->_widgetEnabled = a3;
  objc_super v4 = [(ACMEUIController *)self signInDialog];

  [(ACMSignInDialogProtocol *)v4 disableControls:!v3];
}

- (BOOL)isWidgetShown
{
  return self->_signInDialog != 0;
}

- (BOOL)useAlertView
{
  return [(ACMEUIController *)self signInStyle] == 0;
}

- (BOOL)useCustomWidget
{
  return [(ACMEUIController *)self signInStyle] == 2;
}

- (NSString)password
{
  v2 = [(ACMEUIController *)self signInDialog];

  return (NSString *)[(ACMSignInDialogProtocol *)v2 passwordString];
}

- (void)setPassword:(id)a3
{
  objc_super v4 = [(ACMEUIController *)self signInDialog];

  [(ACMSignInDialogProtocol *)v4 setPasswordString:a3];
}

- (Class)standardSignInClass
{
  return 0;
}

- (Class)customSignInClass
{
  return 0;
}

- (Class)iTunesSignInClass
{
  return 0;
}

- (Class)signInWidgetClass
{
  return 0;
}

- (id)createAlertDialog
{
  BOOL v3 = [(ACMEUIController *)self request];
  [(ACMEUIController *)self iTunesSignInClass];
  id v4 = (id)objc_opt_new();
  [v4 setDelegate:self];
  [v4 setIsUserNameEditable:([v3 userName].length == 0)];
  [v4 setAlertViewPrompt:-[ACMBaseAuthenticationRequest alertViewPrompt](v3, "alertViewPrompt")];
  return v4;
}

- (id)createStandardWidget
{
  [(ACMEUIController *)self standardSignInClass];
  id v3 = (id)objc_opt_new();
  [v3 setDelegate:self];
  [v3 setLogo:-[ACMEUIController logoImage](self, "logoImage")];
  [v3 setBackgroundColor:-[ACMEUIController backgroundColor](self, "backgroundColor")];
  [v3 setAccountNameFieldPlaceholder:-[ACMEUIController accountNameFieldPlaceholder](self, "accountNameFieldPlaceholder")];
  return v3;
}

- (id)createCustomWidget
{
  [(ACMEUIController *)self customSignInClass];
  id v3 = (id)objc_opt_new();
  [v3 setDelegate:self];
  if (![v3 widgetClass]) {
    [v3 setWidgetClass:-[ACMEUIController signInWidgetClass](self, "signInWidgetClass")];
  }
  [(ACMEUIController *)self widgetPosition];
  [v3 setWidgetPosition:];
  [v3 setWidgetPasswordReturnKeyType:[ACMEUIController widgetPasswordReturnKeyType](self, "widgetPasswordReturnKeyType")];
  if ([(NSString *)[(ACMEUIController *)self widgetAccountLabel] length]) {
    [v3 setWidgetAccountLabel:-[ACMEUIController widgetAccountLabel](self, "widgetAccountLabel")];
  }
  id v4 = [(ACMEUIController *)self signInButton];
  if (v4)
  {
    id v5 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 setSignInBarButton:v5];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 setSignInButton:v5];
      }
    }
    [v3 setShouldAuthenticateOnUserInput:-[ACMEUIController shouldAuthenticateOnUserInput](self, "shouldAuthenticateOnUserInput")];
  }
  id v6 = [(ACMEUIController *)self cancelButton];
  if (v6)
  {
    id v7 = v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v3 setCancelBarButton:v7];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v3 setCancelButton:v7];
      }
    }
  }
  [v3 setUserNameFieldEditable:-[ACMBaseAuthenticationRequest userNameFieldEditable](-[ACMEUIController request](self, "request"), "userNameFieldEditable"]);
  [v3 setBackgroundColor:[ACMEUIController backgroundColor](self, "backgroundColor")];
  return v3;
}

- (ACMSignInDialogProtocol)signInDialog
{
  result = self->_signInDialog;
  if (!result)
  {
    if ([(ACMEUIController *)self useAlertView])
    {
      id v4 = [(ACMEUIController *)self createAlertDialog];
    }
    else if ([(ACMEUIController *)self useCustomWidget])
    {
      id v4 = [(ACMEUIController *)self createCustomWidget];
    }
    else
    {
      id v4 = [(ACMEUIController *)self createStandardWidget];
    }
    self->_signInDialog = (ACMSignInDialogProtocol *)v4;
    [(ACMSignInDialogProtocol *)self->_signInDialog setRequestedUserName:[(ACMBaseAuthenticationRequest *)[(ACMEUIController *)self request] userName]];
    return self->_signInDialog;
  }
  return result;
}

- (void)showSignInWidgetWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v8 = [(ACMEUIController *)self signInDialog];

  [(ACMSignInDialogProtocol *)v8 showWithParentViewController:a3 animated:v6 completion:a5];
}

- (void)hideSignInWidgetWithParentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  v8 = [(ACMEUIController *)self signInDialog];

  [(ACMSignInDialogProtocol *)v8 hideWithParentViewController:a3 animated:v6 completion:a5];
}

- (void)cancelSignInWidget
{
  while ([(NSMutableSet *)[(ACMEUIController *)self shownAlerts] count])
  {
    id v3 = (void *)[(NSMutableSet *)[(ACMEUIController *)self shownAlerts] anyObject];
    [v3 dismissWithClickedButtonIndex:objc_msgSend(v3, "tag") == -100102 ? 0 : 1, animated:0];
    [(NSMutableSet *)[(ACMEUIController *)self shownAlerts] removeObject:v3];
  }
  id v4 = [(ACMEUIController *)self signInDialog];

  [(ACMSignInDialogProtocol *)v4 cancel];
}

- (void)showAlertWithAlertMessage:(id)a3 buttonTitle:(id)a4 cancelButtonTitle:(id)a5 errorTag:(int64_t)a6
{
  id v8 = [(id)[objc_alloc(MEMORY[0x263F1C400]) initWithTitle:&stru_26F261788 message:a3 delegate:self cancelButtonTitle:a5 otherButtonTitles:a4];
  [v8 setTag:a6];
  [(ACMEUIController *)self setWidgetEnabled:0];
  [(NSMutableSet *)[(ACMEUIController *)self shownAlerts] addObject:v8];
  [v8 show];
}

- (void)alertView:(id)a3 didDismissWithButtonIndex:(int64_t)a4
{
  if ([a3 cancelButtonIndex] == a4 && objc_msgSend(a3, "tag") == -100102) {
    [(ACMEUIController *)self onIForgot:self];
  }
  [(NSMutableSet *)[(ACMEUIController *)self shownAlerts] removeObject:a3];

  [(ACMEUIController *)self setWidgetEnabled:1];
}

- (unint64_t)signInDialogContentStyle
{
  [(ACMEUIController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(ACMEUIController *)self delegate];

  return [(ACMUIControllerDelegate *)v3 uiControllerSignInDialogContentStyle:self];
}

- (UIView)managerApprovalDialogSummaryView
{
  [(ACMEUIController *)self delegate];
  if ((objc_opt_respondsToSelector() & 1) == 0) {
    return 0;
  }
  id v3 = [(ACMEUIController *)self delegate];

  return (UIView *)[(ACMUIControllerDelegate *)v3 uiControllerManagerApprovalDialogSummaryView:self];
}

- (void)onSignIn:(id)a3
{
  id v4 = (void *)[(ACMSignInDialogProtocol *)[(ACMEUIController *)self signInDialog] userNameString];
  [-[ACMEUIController request](self, "request") setUserName:[objc_msgSend((id)objc_msgSend(v4, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x263F08708], "whitespaceCharacterSet")), "lowercaseString")];
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(ACMEUIController *)self delegate];
    uint64_t v6 = [(ACMSignInDialogProtocol *)[(ACMEUIController *)self signInDialog] passwordString];
    [(ACMUIControllerDelegate *)v5 uiControllerOnSignIn:self withPassword:v6];
  }
}

- (void)onSignInCancel:(id)a3
{
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(ACMEUIController *)self delegate];
    [(ACMUIControllerDelegate *)v4 uiControllerOnSignInCancel:self];
  }
}

- (void)onIForgot:(id)a3
{
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = [(ACMEUIController *)self delegate];
    [(ACMUIControllerDelegate *)v4 uiControllerOnSignIForgot:self];
  }
}

- (void)onManageAppleID:(id)a3
{
  id v4 = [(ACMEUIController *)self delegate];
  uint64_t v5 = [(ACMBaseAuthenticationRequest *)[(ACMEUIController *)self request] realm];

  [(ACMUIControllerDelegate *)v4 onManageAppleIDForRealm:v5];
}

- (void)signInDialogWillBecomeEnabled
{
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(ACMEUIController *)self delegate];
    [(ACMUIControllerDelegate *)v3 uiControllerWillEnableSignInDialog:self];
  }
}

- (void)signInDialogDidBecomeEnabled
{
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(ACMEUIController *)self delegate];
    [(ACMUIControllerDelegate *)v3 uiControllerDidEnableSignInDialog:self];
  }
}

- (void)signInDialogWillBecomeDisabled
{
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(ACMEUIController *)self delegate];
    [(ACMUIControllerDelegate *)v3 uiControllerWillDisableSignInDialog:self];
  }
}

- (void)signInDialogDidBecomeDisabled
{
  [(ACMEUIController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(ACMEUIController *)self delegate];
    [(ACMUIControllerDelegate *)v3 uiControllerDidDisableSignInDialog:self];
  }
}

- (ACMUIControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (ACMUIControllerDelegate *)a3;
}

- (NSMutableSet)shownAlerts
{
  return self->_shownAlerts;
}

- (void)setShownAlerts:(id)a3
{
}

- (BOOL)isWidgetEnabled
{
  return self->_widgetEnabled;
}

- (ACMBaseAuthenticationRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (unint64_t)signInStyle
{
  return self->_signInStyle;
}

- (void)setSignInStyle:(unint64_t)a3
{
  self->_signInStyle = a3;
}

- (UIImage)logoImage
{
  return self->_logoImage;
}

- (void)setLogoImage:(id)a3
{
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
}

- (NSString)accountNameFieldPlaceholder
{
  return self->_accountNameFieldPlaceholder;
}

- (void)setAccountNameFieldPlaceholder:(id)a3
{
}

- (CGPoint)widgetPosition
{
  double x = self->_widgetPosition.x;
  double y = self->_widgetPosition.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setWidgetPosition:(CGPoint)a3
{
  self->_widgetPosition = a3;
}

- (NSString)widgetAccountLabel
{
  return self->_widgetAccountLabel;
}

- (void)setWidgetAccountLabel:(id)a3
{
}

- (id)signInButton
{
  return self->_signInButton;
}

- (void)setSignInButton:(id)a3
{
}

- (id)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (int64_t)widgetPasswordReturnKeyType
{
  return self->_widgetPasswordReturnKeyType;
}

- (void)setWidgetPasswordReturnKeyType:(int64_t)a3
{
  self->_widgetPasswordReturnKeyType = a3;
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return self->_shouldAuthenticateOnUserInput;
}

- (void)setShouldAuthenticateOnUserInput:(BOOL)a3
{
  self->_shouldAuthenticateOnUserInput = a3;
}

- (void)setSignInDialog:(id)a3
{
}

@end