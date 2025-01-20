@interface COSAppleIDSkippedBenefitsViewController
+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3;
+ (void)runPostAppleIDSignInOrSkippedTasks;
- (BOOL)autoTryToLoginToMessages;
- (BOOL)controllerAllowsNavigatingBackTo;
- (BOOL)iCloudAppleIDLoggedIn;
- (BOOL)iCloudAppleIDSuccess;
- (BOOL)iMessageAppleIDLoggedIn;
- (BOOL)iMessageAppleIDSuccess;
- (BOOL)shouldShowMessagesLogIn;
- (BOOL)usesDarkTheme;
- (BOOL)wantsDefaultImageResource;
- (BOOL)wantsInternalFPOLabel;
- (COSAppleIDSkippedBenefitsViewController)init;
- (id)detailString;
- (id)detailTitleString;
- (id)okayButtonTitle;
- (id)suggestedButtonTitle;
- (id)titleString;
- (void)okayButtonPressed:(id)a3;
- (void)presentLoginViewController;
- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5;
- (void)signInControllerDidCancel:(id)a3;
- (void)suggestedButtonPressed:(id)a3;
- (void)updateLoginStatus;
- (void)updateUIFromLoginStatus;
@end

@implementation COSAppleIDSkippedBenefitsViewController

+ (BOOL)controllerNeedsToRunForBuddyControllerDelegate:(id)a3
{
  v3 = [UIApp setupController:a3];
  v4 = [v3 appleIDSignInModel];
  unsigned int v5 = [v4 benefitsControllerPresented];

  if (v5)
  {
    v6 = pbb_accountsignin_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User already visited sign in benefits. Ignoring", buf, 2u);
    }

LABEL_20:
    BOOL v14 = 0;
    goto LABEL_21;
  }
  v7 = [UIApp activeWatch];
  id v8 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"4AA3FF3B-3224-42E6-995E-481F49AE9260"];
  unsigned __int8 v9 = [v7 supportsCapability:v8];

  if ((v9 & 1) == 0)
  {
    v16 = pbb_accountsignin_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Skipping iCloud/iMessage sign in benefits: watch not cellular capable", v19, 2u);
    }

    [(id)objc_opt_class() runPostAppleIDSignInOrSkippedTasks];
    goto LABEL_20;
  }
  v10 = +[COSiCloudAuthController iCloudAccountInAccountStore];
  uint64_t v11 = +[COSiMessageFaceTimeAuthController iMessageAccountInAccountStore];
  v12 = (void *)v11;
  if (v10) {
    BOOL v13 = v11 == 0;
  }
  else {
    BOOL v13 = 1;
  }
  BOOL v14 = v13;
  if (!v13)
  {
    v15 = pbb_accountsignin_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Skipping iCloud/iMessage sign in benefits: already has primary iCloud and iMessage accounts", v18, 2u);
    }

    [(id)objc_opt_class() runPostAppleIDSignInOrSkippedTasks];
  }

LABEL_21:
  return v14;
}

- (COSAppleIDSkippedBenefitsViewController)init
{
  v5.receiver = self;
  v5.super_class = (Class)COSAppleIDSkippedBenefitsViewController;
  v2 = [(COSOptinViewController *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(COSAppleIDSkippedBenefitsViewController *)v2 setStyle:98];
    [(COSAppleIDSkippedBenefitsViewController *)v3 updateLoginStatus];
  }
  return v3;
}

- (void)updateLoginStatus
{
  v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 136315138;
    BOOL v13 = "-[COSAppleIDSkippedBenefitsViewController updateLoginStatus]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v12, 0xCu);
  }

  if (self->_iCloudAppleIDSuccess)
  {
    p_iCloudAppleIDLoggedIn = (unsigned __int8 *)&self->_iCloudAppleIDLoggedIn;
    self->_iCloudAppleIDLoggedIn = 1;
  }
  else
  {
    objc_super v5 = +[COSiCloudAuthController iCloudAccountInAccountStore];
    p_iCloudAppleIDLoggedIn = (unsigned __int8 *)&self->_iCloudAppleIDLoggedIn;
    self->_iCloudAppleIDLoggedIn = v5 != 0;
  }
  if (self->_iMessageAppleIDSuccess)
  {
    p_iMessageAppleIDLoggedIn = (unsigned __int8 *)&self->_iMessageAppleIDLoggedIn;
    self->_iMessageAppleIDLoggedIn = 1;
  }
  else
  {
    v7 = +[COSiMessageFaceTimeAuthController iMessageAccountInAccountStore];
    p_iMessageAppleIDLoggedIn = (unsigned __int8 *)&self->_iMessageAppleIDLoggedIn;
    self->_iMessageAppleIDLoggedIn = v7 != 0;
  }
  char v8 = *p_iCloudAppleIDLoggedIn;
  if (*p_iCloudAppleIDLoggedIn) {
    char v8 = *p_iMessageAppleIDLoggedIn == 0;
  }
  self->_shouldShowMessagesLogIn = v8;
  unsigned __int8 v9 = pbb_accountsignin_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = +[NSNumber numberWithBool:*p_iCloudAppleIDLoggedIn];
    uint64_t v11 = +[NSNumber numberWithBool:*p_iMessageAppleIDLoggedIn];
    int v12 = 138412546;
    BOOL v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "iCloudAppleIDLoggedIn:%@ iMessageAppleIDLoggedIn:%@", (uint8_t *)&v12, 0x16u);
  }
}

- (void)updateUIFromLoginStatus
{
  [(COSAppleIDSkippedBenefitsViewController *)self updateLoginStatus];
  v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    v6 = "-[COSAppleIDSkippedBenefitsViewController updateUIFromLoginStatus]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  if (self->_iCloudAppleIDLoggedIn)
  {
    if (self->_iMessageAppleIDLoggedIn)
    {
      v4 = [(COSAppleIDSkippedBenefitsViewController *)self delegate];
      [v4 buddyControllerDone:self];

      [(id)objc_opt_class() runPostAppleIDSignInOrSkippedTasks];
    }
    else if (self->_autoTryToLoginToMessages)
    {
      [(COSAppleIDSkippedBenefitsViewController *)self presentLoginViewController];
    }
  }
}

- (id)titleString
{
  if (self->_shouldShowMessagesLogIn) {
    v2 = @"APPLEID_BENEFITS_TITLE_ALTERNATE";
  }
  else {
    v2 = @"APPLEID_BENEFITS_TITLE";
  }
  v3 = v2;
  v4 = +[NSBundle mainBundle];
  int v5 = [v4 localizedStringForKey:v3 value:&stru_100249230 table:@"Localizable"];

  return v5;
}

- (id)detailString
{
  if (self->_shouldShowMessagesLogIn) {
    v2 = @"APPLEID_BENEFITS_DETAIL_ALTERNATE";
  }
  else {
    v2 = @"APPLEID_BENEFITS_DETAIL";
  }
  v3 = v2;
  v4 = +[NSBundle mainBundle];
  int v5 = [v4 localizedStringForKey:v3 value:&stru_100249230 table:@"Localizable"];

  return v5;
}

- (BOOL)wantsInternalFPOLabel
{
  return 1;
}

- (BOOL)wantsDefaultImageResource
{
  return 1;
}

- (id)suggestedButtonTitle
{
  if (self->_shouldShowMessagesLogIn) {
    v2 = @"APPLEID_BENEFITS_SIGN_IN_ALTERNATE";
  }
  else {
    v2 = @"APPLEID_BENEFITS_SIGN_IN";
  }
  v3 = v2;
  v4 = +[NSBundle mainBundle];
  int v5 = [v4 localizedStringForKey:v3 value:&stru_100249230 table:@"Localizable"];

  return v5;
}

- (id)okayButtonTitle
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"APPLEID_BENEFITS_NEXT" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailTitleString
{
  v2 = +[NSBundle mainBundle];
  v3 = [v2 localizedStringForKey:@"APPLEID_BENEFITS_DETAIL_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)suggestedButtonPressed:(id)a3
{
  [UIApp setupController:a3];
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v5 appleIDSignInModel];
  [v4 setBenefitsControllerPresented:1];

  [(COSAppleIDSkippedBenefitsViewController *)self presentLoginViewController];
}

- (void)presentLoginViewController
{
  v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(void *)((char *)&buf + 4) = "-[COSAppleIDSkippedBenefitsViewController presentLoginViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&buf, 0xCu);
  }

  self->_autoTryToLoginToMessages = 0;
  v4 = [(COSAppleIDSkippedBenefitsViewController *)self view];
  [v4 setUserInteractionEnabled:0];

  uint64_t v12 = 0;
  BOOL v13 = &v12;
  uint64_t v14 = 0x2050000000;
  id v5 = (void *)qword_10029AEF0;
  uint64_t v15 = qword_10029AEF0;
  if (!qword_10029AEF0)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v17 = sub_10002B44C;
    v18 = &unk_1002436A8;
    v19 = &v12;
    sub_10002B44C((uint64_t)&buf);
    id v5 = (void *)v13[3];
  }
  v6 = v5;
  _Block_object_dispose(&v12, 8);
  id v7 = objc_alloc_init(v6);
  [v7 setDelegate:self];
  if (self->_iCloudAppleIDLoggedIn)
  {
    char v8 = sub_10002AAD4();
    [v7 setServiceType:v8];
  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10002ABB8;
  v10[3] = &unk_100243DE0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v9 prepareInViewController:self completion:v10];
}

- (void)okayButtonPressed:(id)a3
{
  [UIApp setupController:a3];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v4 = [v6 appleIDSignInModel];
  [v4 setBenefitsControllerPresented:1];

  id v5 = [(COSAppleIDSkippedBenefitsViewController *)self delegate];
  [v5 buddyControllerDone:self];

  [(id)objc_opt_class() runPostAppleIDSignInOrSkippedTasks];
}

- (void)signInController:(id)a3 didCompleteWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = pbb_accountsignin_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v20 = v11;
    __int16 v21 = 2112;
    id v22 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "COSAppleIDSkippedBenefitsViewController signInController:didCompleteWithSuccess:%@ error:%@", buf, 0x16u);
  }

  if (v6)
  {
    uint64_t v12 = sub_10002AAD4();
    BOOL v13 = [v8 serviceType];
    unsigned int v14 = [v12 isEqualToString:v13];

    if (v14)
    {
      self->_iMessageAppleIDSuccess = 1;
    }
    else
    {
      self->_iCloudAppleIDSuccess = 1;
      self->_autoTryToLoginToMessages = 1;
      uint64_t v15 = [UIApp setupController];
      v16 = [v15 appleIDSignInModel];
      [v16 setCdpRepairRequiredOnBenefitsController:1];
    }
  }
  v17 = [(COSAppleIDSkippedBenefitsViewController *)self view];
  [v17 setUserInteractionEnabled:1];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002B050;
  v18[3] = &unk_1002438A0;
  v18[4] = self;
  [(COSAppleIDSkippedBenefitsViewController *)self dismissViewControllerAnimated:1 completion:v18];
}

- (void)signInControllerDidCancel:(id)a3
{
  v4 = pbb_accountsignin_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "COSAppleIDSkippedBenefitsViewController signInControllerDidCancel:", buf, 2u);
  }

  id v5 = [(COSAppleIDSkippedBenefitsViewController *)self view];
  [v5 setUserInteractionEnabled:1];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10002B248;
  v6[3] = &unk_1002438A0;
  v6[4] = self;
  [(COSAppleIDSkippedBenefitsViewController *)self dismissViewControllerAnimated:1 completion:v6];
}

+ (void)runPostAppleIDSignInOrSkippedTasks
{
}

- (BOOL)controllerAllowsNavigatingBackTo
{
  return !self->_iCloudAppleIDLoggedIn || !self->_iMessageAppleIDLoggedIn;
}

- (BOOL)iCloudAppleIDLoggedIn
{
  return self->_iCloudAppleIDLoggedIn;
}

- (BOOL)iMessageAppleIDLoggedIn
{
  return self->_iMessageAppleIDLoggedIn;
}

- (BOOL)shouldShowMessagesLogIn
{
  return self->_shouldShowMessagesLogIn;
}

- (BOOL)iCloudAppleIDSuccess
{
  return self->_iCloudAppleIDSuccess;
}

- (BOOL)iMessageAppleIDSuccess
{
  return self->_iMessageAppleIDSuccess;
}

- (BOOL)autoTryToLoginToMessages
{
  return self->_autoTryToLoginToMessages;
}

- (BOOL)usesDarkTheme
{
  return self->_usesDarkTheme;
}

@end