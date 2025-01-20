@interface COSiMessageLoginViewController
+ (BOOL)controllerNeedsToRunForCurrentService;
+ (int64_t)appleIDServiceType;
- (BOOL)allowSkipping;
- (COSiMessageLoginViewController)init;
- (id)account;
- (id)activationHoldActivityIdentifier;
- (id)detailString;
- (id)holdActivityIdentifier;
- (id)localizedWaitScreenDescription;
- (id)performanceMonitorActivityName;
- (id)titleString;
- (id)username;
- (unint64_t)performanceMonitorCATiming;
- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3;
@end

@implementation COSiMessageLoginViewController

- (COSiMessageLoginViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSiMessageLoginViewController;
  v2 = [(COSAppleIDLoginViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[COSiMessageFaceTimeAuthController iMessageAccountInAccountStore];
    account = v2->_account;
    v2->_account = (ACAccount *)v3;
  }
  return v2;
}

- (id)account
{
  return self->_account;
}

- (id)username
{
  v2 = [(COSiMessageLoginViewController *)self account];
  uint64_t v3 = +[COSiMessageFaceTimeAuthController usernameForIDSAccount:v2];

  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"iMESSAGE_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  uint64_t v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"iMESSAGE_WHY_SIGN_IN" value:&stru_100249230 table:@"Localizable"];
  v5 = [(COSAppleIDLoginViewController *)self appendUsernameToDetailText:v4];

  return v5;
}

- (BOOL)allowSkipping
{
  return 0;
}

- (id)performanceMonitorActivityName
{
  return @"COSiMessageLoginEvent";
}

- (unint64_t)performanceMonitorCATiming
{
  return 9;
}

- (id)holdActivityIdentifier
{
  return @"iMessageHoldActivity";
}

- (id)activationHoldActivityIdentifier
{
  return @"iMessageActivationHoldActivity";
}

+ (BOOL)controllerNeedsToRunForCurrentService
{
  v2 = [UIApp setupController];
  uint64_t v3 = [v2 appleIDSignInModel];
  unsigned int v4 = [v3 hasSignedInToiCloud];

  if (!v4) {
    goto LABEL_6;
  }
  v5 = +[COSiCloudAuthController iCloudAccountInAccountStore];
  objc_super v6 = +[COSiMessageFaceTimeAuthController iMessageAccountInAccountStore];
  if (!v5
    || !+[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:", v6, v5)|| ([v2 appleIDSignInModel], v7 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v8 = objc_msgSend(v7, "hasCombinedIDSSignInFailed"), v7, (v8 & 1) != 0))
  {

LABEL_6:
    BOOL v9 = 1;
    goto LABEL_7;
  }
  v11 = pbb_accountsignin_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Skipping iMessage sign in: same as iCloud account", v12, 2u);
  }

  BOOL v9 = 0;
LABEL_7:

  return v9;
}

- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3
{
  v7 = (void (**)(void))a3;
  unsigned int v4 = [UIApp setupController];
  v5 = [v4 appleIDSignInModel];
  [v5 setHasSignedInToiMessage:1];

  objc_super v6 = [v4 appleIDSignInModel];
  [v6 setHasCombinedIDSSignInFailed:0];

  [(COSAppleIDLoginViewController *)self saveiTunesStoreAccountToPairedDeviceIfForSameAppleID];
  if (v7) {
    v7[2]();
  }
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"MESSAGES_ACCOUNT_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

+ (int64_t)appleIDServiceType
{
  return 2;
}

- (void).cxx_destruct
{
}

@end