@interface COSiTunesStoreLoginViewController
+ (BOOL)controllerNeedsToRunForCurrentService;
+ (int64_t)appleIDServiceType;
- (BOOL)allowSkipping;
- (COSiTunesStoreLoginViewController)init;
- (id)account;
- (id)activationHoldActivityIdentifier;
- (id)detailString;
- (id)followUpActions;
- (id)followUpIdentifier;
- (id)holdActivityIdentifier;
- (id)localizedInformativeText;
- (id)localizedTitle;
- (id)localizedWaitScreenDescription;
- (id)performanceMonitorActivityName;
- (id)titleString;
- (id)username;
- (unint64_t)performanceMonitorCATiming;
- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3;
- (void)tappedSkipButton:(id)a3;
@end

@implementation COSiTunesStoreLoginViewController

- (COSiTunesStoreLoginViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSiTunesStoreLoginViewController;
  v2 = [(COSAppleIDLoginViewController *)&v6 init];
  if (v2)
  {
    uint64_t v3 = +[COSiTunesStoreAuthController iTunesStoreAccountInAccountStore];
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
  v2 = [(COSiTunesStoreLoginViewController *)self account];
  uint64_t v3 = +[COSiTunesStoreAuthController usernameForiTunesStoreAccount:v2];

  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"ITUNESSTORE_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)detailString
{
  uint64_t v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:@"ITUNESSTORE_WHY_SIGN_IN" value:&stru_100249230 table:@"Localizable"];
  v5 = [(COSAppleIDLoginViewController *)self appendUsernameToDetailText:v4];

  return v5;
}

- (BOOL)allowSkipping
{
  return 1;
}

- (void)tappedSkipButton:(id)a3
{
  id v4 = a3;
  v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v10 = self;
    __int16 v11 = 2080;
    v12 = "-[COSiTunesStoreLoginViewController tappedSkipButton:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  [(COSiTunesStoreLoginViewController *)self addFollowUpForPageWithCompletion:&stru_100247258];
  objc_super v6 = [UIApp setupController];
  v7 = [v6 pairingReportManager];

  [v7 addPairingTimeEventToPairingReportPlist:29 withValue:&__kCFBooleanTrue withError:0];
  v8.receiver = self;
  v8.super_class = (Class)COSiTunesStoreLoginViewController;
  [(COSAppleIDLoginViewController *)&v8 tappedSkipButton:v4];
}

- (id)performanceMonitorActivityName
{
  return @"COSiTunesStoreLoginEvent";
}

- (unint64_t)performanceMonitorCATiming
{
  return 9;
}

- (id)holdActivityIdentifier
{
  return @"iTunesStoreHoldActivity";
}

- (id)activationHoldActivityIdentifier
{
  return @"iTunesStoreActivationHoldActivity";
}

+ (BOOL)controllerNeedsToRunForCurrentService
{
  v2 = [UIApp activeWatch];
  id v3 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1F1097A5-5A0B-4795-9FBE-B206DB49FA1D"];
  unsigned __int8 v4 = [v2 supportsCapability:v3];

  if ((v4 & 1) == 0)
  {
    v5 = pbb_accountsignin_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Skipping iTunesStore sign in: Watch does not have iTunesStore capability", v7, 2u);
    }
  }
  return v4;
}

- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3
{
  unsigned __int8 v4 = (void (**)(void))a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100100B40;
  v7[3] = &unk_100243878;
  v7[4] = self;
  [(COSiTunesStoreLoginViewController *)self removeFollowupForPageWithCompletion:v7];
  v5 = [UIApp setupController];
  objc_super v6 = [v5 appleIDSignInModel];
  [v6 setHasSignedInToiTunesStore:1];

  if (v4) {
    v4[2](v4);
  }
}

- (id)localizedWaitScreenDescription
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"ITUNES_ACCOUNT_HOLD_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)followUpIdentifier
{
  return @"AppleID-FollowUp";
}

- (id)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"APPLEID_FOLLOWUP_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)localizedInformativeText
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"APPLEID_FOLLOWUP_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)followUpActions
{
  v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"SIGNIN_APPLE_ID" value:&stru_100249230 table:@"Localizable"];
  v7 = v3;
  unsigned __int8 v4 = +[NSURL URLWithString:@"bridge:FOLLOWUP=com.apple.Bridge.AppleID-FollowUp"];
  objc_super v8 = v4;
  v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

+ (int64_t)appleIDServiceType
{
  return 1;
}

- (void).cxx_destruct
{
}

@end