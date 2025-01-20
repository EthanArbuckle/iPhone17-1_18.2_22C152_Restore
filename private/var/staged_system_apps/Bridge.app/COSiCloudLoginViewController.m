@interface COSiCloudLoginViewController
+ (int64_t)appleIDServiceType;
- (BOOL)allowSkipping;
- (BOOL)completedCustomHoldActivities;
- (BOOL)holdBeforeDisplaying;
- (COSiCloudLoginViewController)init;
- (id)account;
- (id)activationHoldActivityIdentifier;
- (id)detailString;
- (id)detailTextKeyForActivationLockEnabled:(BOOL)a3 findMyWatchSupported:(BOOL)a4 stockholmSupported:(BOOL)a5;
- (id)followUpActions;
- (id)followUpIdentifier;
- (id)holdActivityIdentifier;
- (id)localizedInformativeText;
- (id)localizedTitle;
- (id)localizedWaitScreenDescription;
- (id)performanceMonitorActivityName;
- (id)primeBuysOnWatchCompletion;
- (id)titleString;
- (id)username;
- (unint64_t)performanceMonitorCATiming;
- (void)_signInToAccountWithPassword:(id)a3;
- (void)_successfullySignedIn;
- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3;
- (void)setPrimeBuysOnWatchCompletion:(id)a3;
- (void)signInFailedWithError:(id)a3;
- (void)stockholmSupportedInGizmoRegion:(BOOL)a3;
- (void)tappedSkipButton:(id)a3;
- (void)updateAppleAccountProperties;
- (void)updatedAppleAccountPropertiesWithAuthenticated:(BOOL)a3 error:(id)a4;
@end

@implementation COSiCloudLoginViewController

- (COSiCloudLoginViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)COSiCloudLoginViewController;
  v2 = [(COSAppleIDLoginViewController *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[COSiCloudAuthController iCloudAccountInAccountStore];
    account = v2->_account;
    v2->_account = (ACAccount *)v3;

    [(COSiCloudLoginViewController *)v2 stockholmSupportedInGizmoRegion:1];
    objc_initWeak(&location, v2);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019BEC;
    v7[3] = &unk_100243810;
    objc_copyWeak(&v8, &location);
    v5 = objc_retainBlock(v7);
    BPSStockholmSupportedInGizmoRegion();

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  return v2;
}

- (id)account
{
  return self->_account;
}

- (id)username
{
  v2 = [(COSiCloudLoginViewController *)self account];
  uint64_t v3 = +[COSiCloudAuthController usernameForiCloudAccount:v2];

  return v3;
}

- (id)titleString
{
  v2 = +[NSBundle mainBundle];
  uint64_t v3 = [v2 localizedStringForKey:@"APPLEID_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (void)stockholmSupportedInGizmoRegion:(BOOL)a3
{
  BOOL v3 = a3;
  if (sub_1000325D0()) {
    BOOL v5 = +[COSFindMyController isDeviceLocatorEnabled];
  }
  else {
    BOOL v5 = 0;
  }
  v6 = [UIApp activeWatch];
  uint64_t HasCapabilityForString = BPSDeviceHasCapabilityForString();

  id v8 = [(COSiCloudLoginViewController *)self detailTextKeyForActivationLockEnabled:v5 findMyWatchSupported:HasCapabilityForString stockholmSupported:v3];
  detailTextKey = self->_detailTextKey;
  self->_detailTextKey = v8;

  self->_hasCheckedStockholm = 1;

  [(COSAppleIDLoginViewController *)self checkAndReleaseHold];
}

- (id)detailTextKeyForActivationLockEnabled:(BOOL)a3 findMyWatchSupported:(BOOL)a4 stockholmSupported:(BOOL)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v8 = +[NSMutableString stringWithString:@"APPLEID_WHY_SIGN_IN"];
  v9 = v8;
  if (v6)
  {
    [v8 appendFormat:@"_FIND_MY_VARIANT"];
  }
  else if (v7)
  {
    [v8 appendString:@"_ACTIVATION_LOCK_VARIANT"];
  }
  if (!a5) {
    [v9 appendString:@"_NO_APPLE_PAY"];
  }

  return v9;
}

- (id)detailString
{
  BOOL v3 = +[NSBundle mainBundle];
  v4 = [v3 localizedStringForKey:self->_detailTextKey value:&stru_100249230 table:@"Localizable"];
  BOOL v5 = [(COSAppleIDLoginViewController *)self appendUsernameToDetailText:v4];

  return v5;
}

- (BOOL)allowSkipping
{
  return 1;
}

- (void)tappedSkipButton:(id)a3
{
  id v4 = a3;
  BOOL v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    objc_super v10 = self;
    __int16 v11 = 2080;
    v12 = "-[COSiCloudLoginViewController tappedSkipButton:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ %s", buf, 0x16u);
  }

  +[PBBridgeCAReporter recordSigninEventPair:2];
  [(COSiCloudLoginViewController *)self addFollowUpForPageWithCompletion:&stru_100243850];
  BOOL v6 = [UIApp setupController];
  BOOL v7 = [v6 pairingReportManager];

  [v7 addPairingTimeEventToPairingReportPlist:24 withValue:&__kCFBooleanTrue withError:0];
  v8.receiver = self;
  v8.super_class = (Class)COSiCloudLoginViewController;
  [(COSAppleIDLoginViewController *)&v8 tappedSkipButton:v4];
}

- (id)performanceMonitorActivityName
{
  return @"COSAppleIDLoginEvent";
}

- (unint64_t)performanceMonitorCATiming
{
  return 8;
}

- (id)holdActivityIdentifier
{
  return @"iCloudHoldActivity";
}

- (id)activationHoldActivityIdentifier
{
  return @"iCloudActivationHoldActivity";
}

- (void)loggedInSuccessfullyWithBuddyControllerDoneBlock:(id)a3
{
  id v4 = (void (**)(void))a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A298;
  v7[3] = &unk_100243878;
  void v7[4] = self;
  [(COSiCloudLoginViewController *)self removeFollowupForPageWithCompletion:v7];
  +[PBBridgeCAReporter recordSigninEventPair:1];
  BOOL v5 = [UIApp setupController];
  BOOL v6 = [v5 appleIDSignInModel];
  [v6 setHasSignedInToiCloud:1];

  [(COSAppleIDLoginViewController *)self saveiTunesStoreAccountToPairedDeviceIfForSameAppleID];
  if (sub_1000325D0()
    && +[COSFindMyController isDeviceLocatorEnabled])
  {
    +[COSFindMyController recordShowingActivationLockDetailsForPairingDevice];
  }
  if (v4) {
    v4[2](v4);
  }
}

- (void)signInFailedWithError:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 domain];
  if (![v5 isEqualToString:@"com.apple.appleaccount"])
  {

    goto LABEL_5;
  }
  id v6 = [v4 code];

  if (v6 != (id)-6)
  {
LABEL_5:
    v9.receiver = self;
    v9.super_class = (Class)COSiCloudLoginViewController;
    [(COSAppleIDLoginViewController *)&v9 signInFailedWithError:v4];
    goto LABEL_6;
  }
  BOOL v7 = [UIApp setupController];
  objc_super v8 = [v7 appleIDSignInModel];
  [v8 setHasCombinedIDSSignInFailed:1];

  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001A460;
  v10[3] = &unk_1002438A0;
  v10[4] = self;
  [(COSiCloudLoginViewController *)self loggedInSuccessfullyWithBuddyControllerDoneBlock:v10];

LABEL_6:
}

- (id)localizedWaitScreenDescription
{
  v2 = +[UIApplication sharedApplication];
  unsigned int v3 = [v2 isActivated];
  id v4 = +[NSBundle mainBundle];
  BOOL v5 = v4;
  if (v3) {
    CFStringRef v6 = @"APPLEID_ACCOUNT_HOLD_DESCRIPTION";
  }
  else {
    CFStringRef v6 = @"ACTIVATION_TIME";
  }
  BOOL v7 = [v4 localizedStringForKey:v6 value:&stru_100249230 table:@"Localizable"];

  return v7;
}

- (id)followUpIdentifier
{
  return @"AppleID-FollowUp";
}

- (id)localizedTitle
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"APPLEID_FOLLOWUP_TITLE" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)localizedInformativeText
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"APPLEID_FOLLOWUP_DESCRIPTION" value:&stru_100249230 table:@"Localizable"];

  return v3;
}

- (id)followUpActions
{
  v2 = +[NSBundle mainBundle];
  unsigned int v3 = [v2 localizedStringForKey:@"SIGNIN_APPLE_ID" value:&stru_100249230 table:@"Localizable"];
  BOOL v7 = v3;
  id v4 = +[NSURL URLWithString:@"bridge:FOLLOWUP=com.apple.Bridge.AppleID-FollowUp"];
  objc_super v8 = v4;
  BOOL v5 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];

  return v5;
}

- (void)_signInToAccountWithPassword:(id)a3
{
  objc_super v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  objc_super v10 = sub_10001A7E8;
  __int16 v11 = &unk_100243908;
  v12 = self;
  id v13 = a3;
  id v4 = v13;
  BOOL v5 = objc_retainBlock(&v8);
  id v6 = [v5 copy:v8, v9, v10, v11, v12];
  id primeBuysOnWatchCompletion = self->_primeBuysOnWatchCompletion;
  self->_id primeBuysOnWatchCompletion = v6;
}

- (void)_successfullySignedIn
{
  id primeBuysOnWatchCompletion = (void (**)(id, SEL))self->_primeBuysOnWatchCompletion;
  if (primeBuysOnWatchCompletion)
  {
    primeBuysOnWatchCompletion[2](primeBuysOnWatchCompletion, a2);
    id v4 = self->_primeBuysOnWatchCompletion;
    self->_id primeBuysOnWatchCompletion = 0;
  }
}

+ (int64_t)appleIDServiceType
{
  return 0;
}

- (BOOL)holdBeforeDisplaying
{
  v10.receiver = self;
  v10.super_class = (Class)COSiCloudLoginViewController;
  BOOL v3 = [(COSAppleIDLoginViewController *)&v10 holdBeforeDisplaying];
  id v4 = [(id)objc_opt_class() appleIDServiceState];
  unsigned __int8 v5 = [v4 silentSignInSuccessful];

  if ((v5 & 1) == 0)
  {
    id v6 = pbb_accountsignin_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      objc_super v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Holding (%@) for Apple ID bag refresh", buf, 0xCu);
    }
    [(COSiCloudLoginViewController *)self updateAppleAccountProperties];
  }
  return v3;
}

- (void)updateAppleAccountProperties
{
  objc_initWeak(&location, self);
  BOOL v3 = [(COSiCloudLoginViewController *)self account];
  id v4 = pbb_accountsignin_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v5 = (objc_class *)objc_opt_class();
    id v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138412546;
    v12 = v6;
    __int16 v13 = 2112;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "[%@] Updating properties for account: (%@)", buf, 0x16u);
  }
  BOOL v7 = [(COSAppleIDLoginViewController *)self accountStore];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10001ACD0;
  v8[3] = &unk_100243958;
  objc_copyWeak(&v9, &location);
  [v7 aa_updatePropertiesForAppleAccount:v3 completion:v8];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)updatedAppleAccountPropertiesWithAuthenticated:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(COSiCloudLoginViewController *)self account];
  objc_super v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = (objc_class *)objc_opt_class();
    objc_super v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138413058;
    v15 = v10;
    __int16 v16 = 2112;
    v17 = v7;
    __int16 v18 = 1024;
    BOOL v19 = v4;
    __int16 v20 = 2112;
    id v21 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "[%@] Updated account properties for account: (%@); authenticated: (%d); error: (%@)",
      buf,
      0x26u);
  }
  if (!v6)
  {
    __int16 v11 = [(COSAppleIDLoginViewController *)self accountStore];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10001AF8C;
    v12[3] = &unk_100243878;
    id v13 = v7;
    [v11 saveVerifiedAccount:v13 withCompletionHandler:v12];
  }
  self->_hasUpdatedAppleAccountProperties = 1;
  [(COSAppleIDLoginViewController *)self checkAndReleaseHold];
}

- (BOOL)completedCustomHoldActivities
{
  return self->_hasUpdatedAppleAccountProperties && self->_hasCheckedStockholm;
}

- (id)primeBuysOnWatchCompletion
{
  return self->_primeBuysOnWatchCompletion;
}

- (void)setPrimeBuysOnWatchCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_primeBuysOnWatchCompletion, 0);
  objc_storeStrong((id *)&self->_detailTextKey, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end