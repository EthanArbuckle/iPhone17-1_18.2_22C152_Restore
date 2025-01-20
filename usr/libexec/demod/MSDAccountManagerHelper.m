@interface MSDAccountManagerHelper
- (ACAccount)iCloudAccount;
- (ACAccount)iTunesAccount;
- (ACAccountStore)accountStore;
- (AIDAServiceOwnersManager)serviceOwnersManager;
- (BOOL)_isAllowListedAccount:(id)a3 withAuthResults:(id)a4;
- (BOOL)forceiCloudKeychainToSyncWithServerAndError:(id *)a3;
- (BOOL)performiCloudAccountSignInWithContext:(id)a3 outError:(id *)a4;
- (BOOL)performiCloudAccountSignOutWithContext:(id)a3 outError:(id *)a4;
- (BOOL)performiTunesAccountSignInWithContext:(id)a3 outError:(id *)a4;
- (BOOL)performiTunesAccountSignOutWithContext:(id)a3 outError:(id *)a4;
- (CDPContext)cdpContext;
- (MSDAccountManagerHelper)init;
- (id)_createTempAppleAccountFromAuthResults:(id)a3;
- (id)fetchiTunesiCloudAccountsInfo;
- (id)generateiCloudAccountRecoveryKeyWithError:(id *)a3;
- (void)_acceptiCloudTermsWithAuthResults:(id)a3 completionHandler:(id)a4;
- (void)_authenticateAccountWithContext:(id)a3 forService:(int64_t)a4 completionHandler:(id)a5;
- (void)_configureiCloudAccountFeatures:(id)a3 completionHandler:(id)a4;
- (void)_disableFindMyServiceUsingContext:(id)a3 completionHandler:(id)a4;
- (void)_enableFindMyServiceAndSendLastLocation:(BOOL)a3 completionHandler:(id)a4;
- (void)_forceIDSToSyncWithServer;
- (void)_forceiCloudKeychainToSyncWithServerAndCompletion:(id)a3;
- (void)_markiCloudAccountAsManagedAccount:(BOOL)a3 completionHandler:(id)a4;
- (void)_signInToAppleIDWithContext:(id)a3 forServices:(id)a4 usingAuthResults:(id)a5 completionHandler:(id)a6;
- (void)_signOutAppleIDForServices:(id)a3 completionHandler:(id)a4;
- (void)_waitForIDSOperationToQuiesceForAccount:(id)a3 forSignOut:(BOOL)a4;
- (void)setAccountStore:(id)a3;
- (void)setCdpContext:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5;
- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6;
- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5;
@end

@implementation MSDAccountManagerHelper

- (MSDAccountManagerHelper)init
{
  v8.receiver = self;
  v8.super_class = (Class)MSDAccountManagerHelper;
  v2 = [(MSDAccountManagerHelper *)&v8 init];
  if (v2)
  {
    v3 = +[ACAccountStore defaultStore];
    [(MSDAccountManagerHelper *)v2 setAccountStore:v3];

    id v4 = objc_alloc((Class)AIDAServiceOwnersManager);
    v5 = [(MSDAccountManagerHelper *)v2 accountStore];
    id v6 = [v4 initWithAccountStore:v5];
    [(MSDAccountManagerHelper *)v2 setServiceOwnersManager:v6];
  }
  return v2;
}

- (ACAccount)iCloudAccount
{
  v2 = [(MSDAccountManagerHelper *)self serviceOwnersManager];
  v3 = [v2 accountForService:AIDAServiceTypeCloud];

  return (ACAccount *)v3;
}

- (ACAccount)iTunesAccount
{
  v2 = [(MSDAccountManagerHelper *)self serviceOwnersManager];
  v3 = [v2 accountForService:AIDAServiceTypeStore];

  return (ACAccount *)v3;
}

- (id)fetchiTunesiCloudAccountsInfo
{
  v3 = +[NSMutableDictionary dictionaryWithCapacity:0];
  id v4 = [(MSDAccountManagerHelper *)self iCloudAccount];
  if (!v4) {
    goto LABEL_10;
  }
  id v5 = [[MSDCDPStateController alloc] initForPrimaryiCloudAccount];
  id v6 = [v4 username];
  [v3 setObject:v6 forKey:@"iCloud"];

  if (![v5 isCDPEnabled])
  {
    v10 = &off_100161F40;
LABEL_6:
    [v3 setObject:v10 forKey:@"iCloudCDPState"];
    goto LABEL_7;
  }
  id v16 = 0;
  unsigned int v7 = [v5 isRecoveryKeyAvailable:&v16];
  id v8 = v16;
  if (!v8)
  {
    if (v7) {
      v10 = &off_100161F10;
    }
    else {
      v10 = &off_100161F28;
    }
    goto LABEL_6;
  }
  v9 = v8;
  [v3 setObject:&off_100161EF8 forKey:@"iCloudCDPState"];

LABEL_7:
  if (([v5 isCDPManateeAvailable] & 1) == 0) {
    [v3 setObject:&__kCFBooleanTrue forKey:@"iCloudCDPRepairNeeded"];
  }

LABEL_10:
  v11 = [(MSDAccountManagerHelper *)self iTunesAccount];
  v12 = v11;
  if (v11)
  {
    v13 = [v11 username];
    [v3 setObject:v13 forKey:@"iTunes"];
  }
  v14 = +[NSDictionary dictionaryWithDictionary:v3];

  return v14;
}

- (BOOL)performiCloudAccountSignInWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v60 = 0;
  v61 = &v60;
  uint64_t v62 = 0x3032000000;
  v63 = sub_10000EEA0;
  v64 = sub_10000EEB0;
  dispatch_semaphore_t v65 = dispatch_semaphore_create(0);
  uint64_t v54 = 0;
  v55 = &v54;
  uint64_t v56 = 0x3032000000;
  v57 = sub_10000EEA0;
  v58 = sub_10000EEB0;
  id v59 = 0;
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x3032000000;
  v51 = sub_10000EEA0;
  v52 = sub_10000EEB0;
  id v53 = 0;
  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_10000EEB8;
  v47[3] = &unk_100151C90;
  v47[4] = &v54;
  v47[5] = &v48;
  v47[6] = &v60;
  [(MSDAccountManagerHelper *)self _authenticateAccountWithContext:v6 forService:1 completionHandler:v47];
  unsigned int v7 = v61[5];
  dispatch_time_t v8 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v39 = sub_100068600();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
      sub_1000C7070();
    }

    sub_1000C3188(a4, 3727741043, @"Failed to authenticate account with server.", @"Operation timed out");
    v14 = 0;
    v10 = 0;
    goto LABEL_43;
  }
  v9 = (void *)v49[5];
  if (v9)
  {
    v36 = [v9 localizedDescription];
    sub_1000C3188(a4, 3727741043, @"Failed to authenticate account with server.", (uint64_t)v36);
    v14 = 0;
    v10 = 0;
    goto LABEL_21;
  }
  v10 = +[NSMutableArray arrayWithObject:AIDAServiceTypeCloud];
  v11 = [v6 features];
  v12 = [v11 objectForKey:@"com.apple.mobilestoredemo.FaceTime"];

  if (v12 && [v12 BOOLValue]) {
    [v10 addObject:AIDAServiceTypeFaceTime];
  }
  v13 = [v6 features];
  v14 = [v13 objectForKey:@"com.apple.mobilestoredemo.iMessage"];

  if (v14 && [v14 BOOLValue]) {
    [v10 addObject:AIDAServiceTypeMessages];
  }
  uint64_t v15 = v55[5];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  v46[2] = sub_10000EF5C;
  v46[3] = &unk_100151CB8;
  v46[4] = &v48;
  v46[5] = &v60;
  [(MSDAccountManagerHelper *)self _signInToAppleIDWithContext:v6 forServices:v10 usingAuthResults:v15 completionHandler:v46];
  id v16 = v61[5];
  dispatch_time_t v17 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    v40 = sub_100068600();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000C703C();
    }
    uint64_t v41 = 3727741046;
    CFStringRef v42 = @"Failed to sign in account service.";
    goto LABEL_42;
  }
  v18 = (void *)v49[5];
  if (v18)
  {
    if (!objc_msgSend(v18, "aa_isAASignInErrorWithCode:", -8010))
    {
      v36 = [(id)v49[5] localizedDescription];
      sub_1000C3188(a4, 3727741046, @"Failed to sign in account service.", (uint64_t)v36);
      goto LABEL_21;
    }
    uint64_t v19 = v55[5];
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_10000EFC4;
    v45[3] = &unk_100151CB8;
    v45[4] = &v48;
    v45[5] = &v60;
    [(MSDAccountManagerHelper *)self _acceptiCloudTermsWithAuthResults:v19 completionHandler:v45];
    v20 = v61[5];
    dispatch_time_t v21 = dispatch_time(0, 200000000000);
    if (dispatch_semaphore_wait(v20, v21))
    {
      v40 = sub_100068600();
      uint64_t v41 = 3727741048;
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_1000C703C();
      }
      CFStringRef v42 = @"Failed to accept account terms.";
      goto LABEL_42;
    }
    v22 = (void *)v49[5];
    if (v22)
    {
      v36 = [v22 localizedDescription];
      sub_1000C3188(a4, 3727741048, @"Failed to accept account terms.", (uint64_t)v36);
      goto LABEL_21;
    }
  }
  v23 = [v6 features];
  v44[0] = _NSConcreteStackBlock;
  v44[1] = 3221225472;
  v44[2] = sub_10000F02C;
  v44[3] = &unk_100151CB8;
  v44[4] = &v48;
  v44[5] = &v60;
  [(MSDAccountManagerHelper *)self _configureiCloudAccountFeatures:v23 completionHandler:v44];

  v24 = v61[5];
  dispatch_time_t v25 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v24, v25))
  {
    v40 = sub_100068600();
    uint64_t v41 = 3727741049;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000C7008();
    }
    CFStringRef v42 = @"Failed to configure account features.";
LABEL_42:

    sub_1000C3188(a4, v41, (uint64_t)v42, @"Operation timed out");
LABEL_43:
    BOOL v37 = 0;
    goto LABEL_23;
  }
  v26 = (void *)v49[5];
  if (v26)
  {
    v36 = [v26 localizedDescription];
    sub_1000C3188(a4, 3727741049, @"Failed to configure account features.", (uint64_t)v36);
    goto LABEL_21;
  }
  v27 = [v6 features];
  v28 = [v27 objectForKey:@"com.apple.mobilestoredemo.FindMyiPhone"];
  unsigned int v29 = [v28 BOOLValue];

  v30 = [v6 features];
  v31 = [v30 objectForKey:@"com.apple.mobilestoredemo.SendLastLocation"];
  id v32 = [v31 BOOLValue];

  if (v29)
  {
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_10000F094;
    v43[3] = &unk_100151CB8;
    v43[4] = &v48;
    v43[5] = &v60;
    [(MSDAccountManagerHelper *)self _enableFindMyServiceAndSendLastLocation:v32 completionHandler:v43];
    v33 = v61[5];
    dispatch_time_t v34 = dispatch_time(0, 200000000000);
    if (!dispatch_semaphore_wait(v33, v34))
    {
      v35 = (void *)v49[5];
      if (!v35) {
        goto LABEL_19;
      }
      v36 = [v35 localizedDescription];
      sub_1000C3188(a4, 3727741042, @"Cannot turn on Find My iPhone.", (uint64_t)v36);
LABEL_21:
      BOOL v37 = 0;
      goto LABEL_22;
    }
    v40 = sub_100068600();
    uint64_t v41 = 3727741042;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
      sub_1000C6FD4();
    }
    CFStringRef v42 = @"Cannot turn on Find My iPhone.";
    goto LABEL_42;
  }
LABEL_19:
  v36 = [v6 username];
  [(MSDAccountManagerHelper *)self _waitForIDSOperationToQuiesceForAccount:v36 forSignOut:0];
  BOOL v37 = 1;
LABEL_22:

LABEL_23:
  _Block_object_dispose(&v48, 8);

  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v60, 8);

  return v37;
}

- (BOOL)performiTunesAccountSignInWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v36 = 0;
  BOOL v37 = &v36;
  uint64_t v38 = 0x3032000000;
  v39 = sub_10000EEA0;
  v40 = sub_10000EEB0;
  dispatch_semaphore_t v41 = dispatch_semaphore_create(0);
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10000EEA0;
  dispatch_time_t v34 = sub_10000EEB0;
  id v35 = 0;
  uint64_t v24 = 0;
  dispatch_time_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  v27 = sub_10000EEA0;
  v28 = sub_10000EEB0;
  id v29 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10000F534;
  v23[3] = &unk_100151C90;
  v23[4] = &v30;
  v23[5] = &v24;
  v23[6] = &v36;
  [(MSDAccountManagerHelper *)self _authenticateAccountWithContext:v6 forService:2 completionHandler:v23];
  unsigned int v7 = v37[5];
  dispatch_time_t v8 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v18 = sub_100068600();
    uint64_t v19 = 3727741043;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000C7070();
    }
    CFStringRef v20 = @"Failed to authenticate account with server.";
    goto LABEL_14;
  }
  v9 = (void *)v25[5];
  if (v9)
  {
    dispatch_time_t v21 = [v9 localizedDescription];
    sub_1000C3188(a4, 3727741043, @"Failed to authenticate account with server.", (uint64_t)v21);
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v42 = AIDAServiceTypeStore;
  v10 = +[NSArray arrayWithObjects:&v42 count:1];
  uint64_t v11 = v31[5];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000F5D8;
  v22[3] = &unk_100151CB8;
  v22[4] = &v24;
  v22[5] = &v36;
  [(MSDAccountManagerHelper *)self _signInToAppleIDWithContext:v6 forServices:v10 usingAuthResults:v11 completionHandler:v22];

  v12 = v37[5];
  dispatch_time_t v13 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v18 = sub_100068600();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1000C70A4();
    }
    uint64_t v19 = 3727741046;
    CFStringRef v20 = @"Failed to sign in account service.";
LABEL_14:

    sub_1000C3188(a4, v19, (uint64_t)v20, @"Operation timed out");
LABEL_17:
    id v15 = 0;
    BOOL v16 = 0;
    goto LABEL_6;
  }
  v14 = (void *)v25[5];
  if (v14)
  {
    dispatch_time_t v21 = [v14 localizedDescription];
    sub_1000C3188(a4, 3727741046, @"Failed to sign in account service.", (uint64_t)v21);
    goto LABEL_16;
  }
  id v15 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.MobileStore"];
  [v15 setBool:1 forKey:@"SKUIFamilySetupDisplayed"];
  [v15 synchronize];
  BOOL v16 = 1;
LABEL_6:
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
  _Block_object_dispose(&v36, 8);

  return v16;
}

- (BOOL)performiCloudAccountSignOutWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  unsigned int v7 = [(MSDAccountManagerHelper *)self iCloudAccount];
  dispatch_time_t v8 = [v7 username];

  uint64_t v29 = 0;
  uint64_t v30 = &v29;
  uint64_t v31 = 0x3032000000;
  uint64_t v32 = sub_10000EEA0;
  v33 = sub_10000EEB0;
  dispatch_semaphore_t v34 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_10000EEA0;
  v27 = sub_10000EEB0;
  id v28 = 0;
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10000F9B4;
  v22[3] = &unk_100151CB8;
  v22[4] = &v23;
  v22[5] = &v29;
  [(MSDAccountManagerHelper *)self _disableFindMyServiceUsingContext:v6 completionHandler:v22];
  v9 = v30[5];
  dispatch_time_t v10 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    dispatch_time_t v17 = sub_100068600();
    uint64_t v18 = 3727741042;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000C710C();
    }
    CFStringRef v19 = @"Cannot turn off Find My iPhone.";
    goto LABEL_14;
  }
  uint64_t v11 = (void *)v24[5];
  if (v11)
  {
    CFStringRef v20 = [v11 localizedDescription];
    sub_1000C3188(a4, 3727741042, @"Cannot turn off Find My iPhone.", (uint64_t)v20);
LABEL_16:

    goto LABEL_17;
  }
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_10000FA1C;
  v21[3] = &unk_100151CB8;
  v21[4] = &v23;
  v21[5] = &v29;
  [(MSDAccountManagerHelper *)self _signOutAppleIDForServices:0 completionHandler:v21];
  v12 = v30[5];
  dispatch_time_t v13 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    dispatch_time_t v17 = sub_100068600();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1000C70D8();
    }
    uint64_t v18 = 3727741047;
    CFStringRef v19 = @"Failed to sign out account service.";
LABEL_14:

    sub_1000C3188(a4, v18, (uint64_t)v19, @"Operation timed out");
LABEL_17:
    BOOL v15 = 0;
    goto LABEL_6;
  }
  v14 = (void *)v24[5];
  if (v14)
  {
    CFStringRef v20 = [v14 localizedDescription];
    sub_1000C3188(a4, 3727741047, @"Failed to sign out account service.", (uint64_t)v20);
    goto LABEL_16;
  }
  BOOL v15 = 1;
  [(MSDAccountManagerHelper *)self _waitForIDSOperationToQuiesceForAccount:v8 forSignOut:1];
LABEL_6:
  _Block_object_dispose(&v23, 8);

  _Block_object_dispose(&v29, 8);
  return v15;
}

- (BOOL)performiTunesAccountSignOutWithContext:(id)a3 outError:(id *)a4
{
  id v6 = a3;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  uint64_t v24 = sub_10000EEA0;
  uint64_t v25 = sub_10000EEB0;
  dispatch_semaphore_t v26 = dispatch_semaphore_create(0);
  uint64_t v15 = 0;
  BOOL v16 = &v15;
  uint64_t v17 = 0x3032000000;
  uint64_t v18 = sub_10000EEA0;
  CFStringRef v19 = sub_10000EEB0;
  id v20 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10000FCB0;
  v14[3] = &unk_100151CB8;
  v14[4] = &v15;
  v14[5] = &v21;
  [(MSDAccountManagerHelper *)self _signOutAppleIDForServices:0 completionHandler:v14];
  unsigned int v7 = v22[5];
  dispatch_time_t v8 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v7, v8))
  {
    v12 = sub_100068600();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1000C7140();
    }

    sub_1000C3188(a4, 3727741047, @"Failed to sign out account service.", @"Operation timed out");
    goto LABEL_9;
  }
  v9 = (void *)v16[5];
  if (v9)
  {
    dispatch_time_t v13 = [v9 localizedDescription];
    sub_1000C3188(a4, 3727741047, @"Failed to sign out account service.", (uint64_t)v13);

LABEL_9:
    BOOL v10 = 0;
    goto LABEL_4;
  }
  BOOL v10 = 1;
LABEL_4:
  _Block_object_dispose(&v15, 8);

  _Block_object_dispose(&v21, 8);
  return v10;
}

- (id)generateiCloudAccountRecoveryKeyWithError:(id *)a3
{
  id v4 = [[MSDCDPStateController alloc] initForPrimaryiCloudAccount];
  id v5 = v4;
  if (!v4)
  {
    uint64_t v11 = sub_100068600();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1000C7174();
    }

    sub_1000C3140(a3, 3727741051, @"Failed to setup recovery key for iCloud account.");
    goto LABEL_11;
  }
  if ([v4 isRecoveryKeyAvailable:0])
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "iCloud account already has recovery key created before!", buf, 2u);
    }
  }
  id v13 = 0;
  unsigned int v7 = [v5 generateRecoveryKeyWithError:&v13];
  id v8 = v13;
  if (v8)
  {
    v9 = v8;
    BOOL v10 = [v8 localizedDescription];
    sub_1000C3188(a3, 3727741051, @"Failed to setup recovery key for iCloud account.", (uint64_t)v10);

LABEL_11:
    unsigned int v7 = 0;
  }

  return v7;
}

- (BOOL)forceiCloudKeychainToSyncWithServerAndError:(id *)a3
{
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = sub_10000EEA0;
  uint64_t v23 = sub_10000EEB0;
  id v24 = 0;
  [(MSDAccountManagerHelper *)self _forceIDSToSyncWithServer];
  id v13 = _NSConcreteStackBlock;
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_100010050;
  BOOL v16 = &unk_100151CE0;
  uint64_t v18 = &v19;
  id v6 = v5;
  uint64_t v17 = v6;
  [(MSDAccountManagerHelper *)self _forceiCloudKeychainToSyncWithServerAndCompletion:&v13];
  dispatch_time_t v7 = dispatch_time(0, 200000000000);
  if (dispatch_semaphore_wait(v6, v7))
  {
    id v8 = sub_100068600();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1000C71A8();
    }

    sub_1000C3188(a3, 3727741050, @"Failed to synchronize account data with server.", @"Operation timed out");
  }
  else
  {
    v9 = (void *)v20[5];
    if (!v9)
    {
      BOOL v11 = 1;
      goto LABEL_8;
    }
    BOOL v10 = [v9 localizedDescription:v13, v14, v15, v16];
    sub_1000C3188(a3, 3727741050, @"Failed to synchronize account data with server.", (uint64_t)v10);
  }
  BOOL v11 = 0;
LABEL_8:

  _Block_object_dispose(&v19, 8);
  return v11;
}

- (void)_authenticateAccountWithContext:(id)a3 forService:(int64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  BOOL v10 = [v8 username];
  BOOL v11 = [v8 password];
  v12 = sub_100068600();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v21 = v10;
    __int16 v22 = 2048;
    int64_t v23 = a4;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Authenticating account: %{public}@ for service: %ld", buf, 0x16u);
  }

  if (v9)
  {
    id v13 = objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    [v13 setUsername:v10];
    [v13 setIsUsernameEditable:0];
    [v13 _setPassword:v11];
    [v13 setServiceType:a4];
    [v13 setAuthenticationType:0];
    uint64_t v14 = [v8 recoveryKey];
    [v13 _setMasterKey:v14];

    id v15 = objc_alloc_init((Class)AKAppleIDAuthenticationController);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000102CC;
    v16[3] = &unk_100151D08;
    v16[4] = self;
    id v17 = v10;
    id v18 = v11;
    id v19 = v9;
    [v15 authenticateWithContext:v13 completion:v16];
  }
}

- (void)_signInToAppleIDWithContext:(id)a3 forServices:(id)a4 usingAuthResults:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x3032000000;
  uint64_t v30 = sub_10000EEA0;
  uint64_t v31 = sub_10000EEB0;
  id v32 = 0;
  uint64_t v14 = sub_100068600();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Signing in to Apple ID for services: %{public}@", buf, 0xCu);
  }

  if (v13)
  {
    id v15 = objc_alloc_init(MSDCDPFakeUIProvider);
    BOOL v16 = (void *)v28[5];
    v28[5] = (uint64_t)v15;

    id v17 = [v10 localSecret];
    [(id)v28[5] setLocalSecret:v17];

    id v18 = [v10 recoveryKey];
    [(id)v28[5] setRecoveryKey:v18];

    id v19 = objc_alloc_init((Class)AIDAMutableServiceContext);
    [v19 setAuthenticationResults:v12];
    [v19 setCdpUiProvider:v28[5]];
    id v20 = [objc_alloc((Class)CDPContext) initWithAuthenticationResults:v12];
    [(MSDAccountManagerHelper *)self setCdpContext:v20];

    if ([v10 resetCDP])
    {
      uint64_t v21 = [(MSDAccountManagerHelper *)self cdpContext];
      [v21 set_forceReset:1];
    }
    uint64_t v33 = AIDAServiceTypeCloud;
    dispatch_semaphore_t v34 = self;
    __int16 v22 = +[NSDictionary dictionaryWithObjects:&v34 forKeys:&v33 count:1];
    [v19 setSignInContexts:v22];

    int64_t v23 = [(MSDAccountManagerHelper *)self serviceOwnersManager];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100010788;
    v24[3] = &unk_100151D30;
    id v25 = v13;
    dispatch_semaphore_t v26 = &v27;
    [v23 signInToServices:v11 usingContext:v19 completion:v24];
  }
  _Block_object_dispose(&v27, 8);
}

- (id)_createTempAppleAccountFromAuthResults:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc((Class)ACAccount);
  id v6 = [(MSDAccountManagerHelper *)self accountStore];
  dispatch_time_t v7 = [v6 aa_appleAccountType];
  id v8 = [v5 initWithAccountType:v7];

  id v9 = [v4 objectForKeyedSubscript:AKAuthenticationUsernameKey];
  id v10 = [v4 objectForKeyedSubscript:AKAuthenticationDSIDKey];
  id v11 = [v10 stringValue];

  [v8 setUsername:v9];
  [v8 setAccountProperty:v11 forKey:@"personID"];
  id v12 = [v4 objectForKeyedSubscript:AKAuthenticationPasswordKey];
  id v13 = [v4 objectForKeyedSubscript:AKAuthenticationRawPasswordKey];

  uint64_t v14 = +[ACAccountCredential credentialWithPassword:v12];
  [v8 setCredential:v14];
  [v8 _aa_setRawPassword:v13];

  return v8;
}

- (void)_acceptiCloudTermsWithAuthResults:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", AATermsEntryDevice, AATermsEntryWarranty, AATermsEntryPrivacy, AATermsEntryiCloud, AATermsEntryiTunes, AATermsEntryGameCenter, 0);
  id v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Accepting iCloud terms...", buf, 2u);
  }

  if (v7)
  {
    uint64_t v10 = [(MSDAccountManagerHelper *)self _createTempAppleAccountFromAuthResults:v6];
    if (v10)
    {
      id v11 = (void *)v10;
      id v12 = [objc_alloc((Class)AAiCloudTermsStringRequest) initWithAccount:v10 termsEntries:v8 preferPassword:1];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_100010CF8;
      v15[3] = &unk_100151D80;
      id v16 = v11;
      id v17 = v7;
      id v13 = v11;
      [v12 performRequestWithHandler:v15];
    }
    else
    {
      uint64_t v14 = sub_100068600();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1000C72CC();
      }

      id v12 = +[NSError errorDomainMSDWithCode:3727744768 message:@"An error has occurred."];
      (*((void (**)(id, id))v7 + 2))(v7, v12);
    }
  }
}

- (void)_signOutAppleIDForServices:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100068600();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_DWORD *)buf = 138543362;
    id v24 = v6;
    uint64_t v10 = "Signing out Apple ID for services: %{public}@";
    id v11 = v8;
    uint32_t v12 = 12;
  }
  else
  {
    if (!v9) {
      goto LABEL_7;
    }
    *(_WORD *)buf = 0;
    uint64_t v10 = "Signing out Apple ID for ALL services.";
    id v11 = v8;
    uint32_t v12 = 2;
  }
  _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, v10, buf, v12);
LABEL_7:

  if (v7)
  {
    id v13 = objc_alloc_init((Class)AIDAMutableServiceContext);
    uint64_t v21 = AIDAServiceTypeCloud;
    __int16 v22 = self;
    uint64_t v14 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
    [v13 setSignOutContexts:v14];

    id v15 = [(MSDAccountManagerHelper *)self serviceOwnersManager];
    if (v6)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000111DC;
      v19[3] = &unk_100151DA8;
      id v16 = &v20;
      id v20 = v7;
      [v15 signOutOfServices:v6 usingContext:v13 completion:v19];
    }
    else
    {
      v17[0] = _NSConcreteStackBlock;
      v17[1] = 3221225472;
      v17[2] = sub_10001139C;
      v17[3] = &unk_100151DD0;
      id v16 = &v18;
      id v18 = v7;
      [v15 signOutOfAllServicesUsingContext:v13 completion:v17];
    }
  }
}

- (void)_markiCloudAccountAsManagedAccount:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v16 = v4;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Setting managed account state for iCloud account to: %{BOOL}d", buf, 8u);
  }

  if (v6)
  {
    id v8 = [(MSDAccountManagerHelper *)self iCloudAccount];
    if (v8)
    {
      BOOL v9 = v8;
      if (v4) {
        CFStringRef v10 = @"DeKOTA";
      }
      else {
        CFStringRef v10 = 0;
      }
      [v8 setObject:v10 forKeyedSubscript:ACAccountPropertyRemoteManagingAccountIdentifier];
      uint32_t v12 = [(MSDAccountManagerHelper *)self accountStore];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001164C;
      v13[3] = &unk_100151DD0;
      id v14 = v6;
      [v12 saveAccount:v9 withCompletionHandler:v13];
    }
    else
    {
      id v11 = sub_100068600();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "No iCloud account found on device.", buf, 2u);
      }

      (*((void (**)(id, void))v6 + 2))(v6, 0);
    }
  }
}

- (void)_configureiCloudAccountFeatures:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = sub_100068600();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Configuring iCloud account features: %{public}@", buf, 0xCu);
  }

  if (v7)
  {
    uint64_t v9 = [(MSDAccountManagerHelper *)self iCloudAccount];
    if (v9)
    {
      CFStringRef v10 = (void *)v9;
      if (v6 && [v6 count])
      {
        id v28 = self;
        uint64_t v29 = v7;
        long long v38 = 0u;
        long long v39 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        id v30 = v6;
        id v11 = v6;
        id v12 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
        if (!v12) {
          goto LABEL_29;
        }
        id v13 = v12;
        uint64_t v14 = *(void *)v37;
        uint64_t v31 = ACAccountDataclassSiri;
        while (1)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(void *)v37 != v14) {
              objc_enumerationMutation(v11);
            }
            BOOL v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
            id v17 = [v11 objectForKey:v16];
            unsigned int v18 = [v17 BOOLValue];
            id v19 = sub_100068600();
            BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
            if (v18)
            {
              if (v20)
              {
                *(_DWORD *)buf = 138543362;
                id v42 = v16;
                uint64_t v21 = v19;
                __int16 v22 = ">> Enabling iCloud account feature: %{public}@";
LABEL_17:
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, v22, buf, 0xCu);
              }
            }
            else if (v20)
            {
              *(_DWORD *)buf = 138543362;
              id v42 = v16;
              uint64_t v21 = v19;
              __int16 v22 = ">> Disabling iCloud account feature: %{public}@";
              goto LABEL_17;
            }

            if (([v16 isEqualToString:@"com.apple.mobilestoredemo.FindMyiPhone"] & 1) == 0
              && ([v16 isEqualToString:@"com.apple.mobilestoredemo.SendLastLocation"] & 1) == 0)
            {
              if ([v10 isProvisionedForDataclass:v16])
              {
                if ([v16 isEqualToString:v31])
                {
                  int64_t v23 = +[AFPreferences sharedPreferences];
                  [v23 setCloudSyncEnabled:[v17 BOOLValue]];
                }
                [v10 setEnabled:[v17 BOOLValue] forDataclass:v16];
              }
              else
              {
                id v24 = sub_100068600();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                  sub_1000C7580(&v34, v35, v24);
                }
              }
            }
          }
          id v13 = [v11 countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (!v13)
          {
LABEL_29:

            id v25 = [(MSDAccountManagerHelper *)v28 accountStore];
            v32[0] = _NSConcreteStackBlock;
            v32[1] = 3221225472;
            v32[2] = sub_100011B38;
            v32[3] = &unk_100151DD0;
            id v7 = v29;
            id v33 = v29;
            [v25 saveAccount:v10 withCompletionHandler:v32];

            id v6 = v30;
            goto LABEL_36;
          }
        }
      }
      dispatch_semaphore_t v26 = sub_100068600();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "No iCloud account features provided. Skip configuring anything!", buf, 2u);
      }

      (*((void (**)(id, void))v7 + 2))(v7, 0);
    }
    else
    {
      uint64_t v27 = sub_100068600();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1000C754C();
      }

      CFStringRef v10 = +[NSError errorDomainMSDWithCode:3727744768 message:@"An error has occurred."];
      (*((void (**)(id, void *))v7 + 2))(v7, v10);
    }
LABEL_36:
  }
}

- (void)_enableFindMyServiceAndSendLastLocation:(BOOL)a3 completionHandler:(id)a4
{
  id v5 = a4;
  id v6 = +[AAUIDeviceLocatorService sharedInstance];
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Enabling 'Find My' service...", buf, 2u);
  }

  if (v5)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100011CF8;
    v8[3] = &unk_100151E20;
    id v9 = v5;
    BOOL v10 = a3;
    [v6 enableInContext:3 completion:v8];
  }
}

- (void)_disableFindMyServiceUsingContext:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[AAUIDeviceLocatorService sharedInstance];
  id v9 = [(MSDAccountManagerHelper *)self iCloudAccount];
  BOOL v10 = sub_100068600();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [v9 username];
    *(_DWORD *)buf = 138543362;
    v28[0] = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Checking 'Find My' service state for iCloud account: %{public}@", buf, 0xCu);
  }
  if (v7)
  {
    if (v9)
    {
      id v12 = [v9 username];
      [v6 setUsername:v12];

      *(void *)&long long v13 = 67109376;
      long long v22 = v13;
      while (!objc_msgSend(v8, "isStateKnown", v22) || objc_msgSend(v8, "isChangingState"))
      {
        uint64_t v14 = sub_100068600();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          unsigned int v15 = [v8 isStateKnown];
          unsigned int v16 = [v8 isChangingState];
          *(_DWORD *)buf = v22;
          LODWORD(v28[0]) = v15;
          WORD2(v28[0]) = 1024;
          *(_DWORD *)((char *)v28 + 6) = v16;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Wait until 'Find My' service state is known (isStateKnown = %{BOOL}d) or finished changing (isChaningState = %{BOOL}d).", buf, 0xEu);
        }

        sleep(1u);
      }
      if (![v8 isStateKnown] || (objc_msgSend(v8, "isEnabled") & 1) != 0)
      {
        id v17 = sub_100068600();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "'Find My' service is still enabled. Disabling it now!", buf, 2u);
        }

        unsigned int v18 = [v6 password];

        if (v18)
        {
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_1000122FC;
          v23[3] = &unk_100151E98;
          id v26 = v7;
          id v24 = v9;
          id v25 = v8;
          [(MSDAccountManagerHelper *)self _authenticateAccountWithContext:v6 forService:0 completionHandler:v23];
        }
        else
        {
          id v19 = sub_100068600();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            sub_1000C76FC();
          }

          BOOL v20 = +[NSError errorDomainMSDWithCode:3727744512 message:@"Unexpected server response." reason:@"No password for existing account."];
          (*((void (**)(id, void *))v7 + 2))(v7, v20);
        }
        goto LABEL_24;
      }
      uint64_t v21 = sub_100068600();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "'Find My' service is already disabled.", buf, 2u);
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
LABEL_24:
}

- (void)_waitForIDSOperationToQuiesceForAccount:(id)a3 forSignOut:(BOOL)a4
{
  BOOL v4 = a4;
  id v41 = a3;
  id v5 = @"registration";
  BOOL v39 = v4;
  if (v4) {
    id v5 = @"deregistration";
  }
  id v6 = v5;
  id v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v51 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Wait for IDS %{public}@ to quiesce...", buf, 0xCu);
  }

  if (v41)
  {
    id v8 = [objc_alloc((Class)IDSAccountController) initWithService:@"com.apple.private.alloy.mobilestoredemo.icloud"];
    if (v8)
    {
      id v9 = v8;
      uint64_t v38 = (uint64_t)v6;
      BOOL v10 = 0;
      id v11 = 0;
      double v12 = 0.0;
      while (1)
      {
        long long v13 = v10;
        uint64_t v14 = [v9 accounts];
        BOOL v10 = +[NSDate date];

        unsigned int v15 = sub_100068600();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v51 = v14;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Found IDS accounts: %{public}@", buf, 0xCu);
        }

        if (v39)
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          unsigned int v16 = v14;
          id v17 = [(__CFString *)v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
          if (!v17)
          {
LABEL_19:

            int v21 = 1;
            goto LABEL_31;
          }
          id v18 = v17;
          uint64_t v19 = *(void *)v47;
LABEL_13:
          uint64_t v20 = 0;
          while (1)
          {
            if (*(void *)v47 != v19) {
              objc_enumerationMutation(v16);
            }
            if ([*(id *)(*((void *)&v46 + 1) + 8 * v20) isActive]) {
              break;
            }
            if (v18 == (id)++v20)
            {
              id v18 = [(__CFString *)v16 countByEnumeratingWithState:&v46 objects:v55 count:16];
              if (v18) {
                goto LABEL_13;
              }
              goto LABEL_19;
            }
          }
        }
        else
        {
          long long v44 = 0u;
          long long v45 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v22 = v14;
          id v23 = [(__CFString *)v22 countByEnumeratingWithState:&v42 objects:v54 count:16];
          if (v23)
          {
            id v24 = v23;
            uint64_t v25 = *(void *)v43;
            v40 = v11;
            while (2)
            {
              id v26 = v10;
              uint64_t v27 = v9;
              for (i = 0; i != v24; i = (char *)i + 1)
              {
                if (*(void *)v43 != v25) {
                  objc_enumerationMutation(v22);
                }
                uint64_t v29 = *(void **)(*((void *)&v42 + 1) + 8 * i);
                if ([v29 isActive])
                {
                  id v30 = [v29 loginID];
                  unsigned int v31 = [v30 isEqualToString:v41];

                  if (v31)
                  {

                    int v21 = 1;
                    id v9 = v27;
                    BOOL v10 = v26;
                    id v11 = v40;
                    goto LABEL_31;
                  }
                }
              }
              id v24 = [(__CFString *)v22 countByEnumeratingWithState:&v42 objects:v54 count:16];
              id v9 = v27;
              BOOL v10 = v26;
              id v11 = v40;
              if (v24) {
                continue;
              }
              break;
            }
          }
        }

        sleep(5u);
        int v21 = 0;
LABEL_31:
        id v32 = +[NSDate date];

        [v32 timeIntervalSinceDate:v10];
        double v12 = v12 + v33;

        if ((v21 & 1) == 0)
        {
          id v11 = v32;
          if (v12 < 60.0) {
            continue;
          }
        }
        uint8_t v34 = sub_100068600();
        id v35 = v34;
        if (v21)
        {
          id v6 = (__CFString *)v38;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            v51 = (__CFString *)v38;
            __int16 v52 = 2048;
            double v53 = v12;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "IDS %{public}@ finished after %f seconds.", buf, 0x16u);
          }
        }
        else
        {
          id v6 = (__CFString *)v38;
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
            sub_1000C77FC(v38, v35, v12);
          }
        }

        goto LABEL_43;
      }
    }
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1000C7780(v9, v36, v37);
    }
  }
  else
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No iCloud account signed in on device!", buf, 2u);
    }
  }
LABEL_43:
}

- (void)_forceiCloudKeychainToSyncWithServerAndCompletion:(id)a3
{
  BOOL v4 = (void (**)(id, id))a3;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  int v21 = sub_10000EEA0;
  long long v22 = sub_10000EEB0;
  id v23 = 0;
  id v5 = sub_100068600();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Forcing iCloud keychain to sync with server...", buf, 2u);
  }

  if (v4)
  {
    id v6 = [(MSDAccountManagerHelper *)self iCloudAccount];
    if (v6)
    {
      id v17 = 0;
      uint64_t v7 = +[CKKSControl controlObject:&v17];
      id v8 = v17;
      id v9 = (void *)v19[5];
      v19[5] = v7;

      if (v8)
      {
        BOOL v10 = sub_100068600();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          id v11 = [v8 localizedDescription];
          sub_1000C7880(v11, (uint64_t)buf, v10);
        }

        v4[2](v4, v8);
      }
      else
      {
        long long v13 = (void *)v19[5];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001306C;
        v14[3] = &unk_100151EC0;
        unsigned int v15 = v4;
        unsigned int v16 = &v18;
        [v13 rpcFetchAndProcessChanges:0 reply:v14];

        id v8 = 0;
      }
    }
    else
    {
      double v12 = sub_100068600();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "No iCloud account signed in on device!", buf, 2u);
      }

      v4[2](v4, 0);
      id v8 = 0;
      id v6 = 0;
    }
  }
  else
  {
    id v8 = 0;
    id v6 = 0;
  }

  _Block_object_dispose(&v18, 8);
}

- (void)_forceIDSToSyncWithServer
{
  v3 = sub_100068600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Forcing IDS to sync with server...", buf, 2u);
  }

  BOOL v4 = [(MSDAccountManagerHelper *)self iCloudAccount];
  if (v4)
  {
    id v5 = [objc_alloc((Class)IDSAccountController) initWithService:@"com.apple.private.alloy.multiplex1"];
    if (v5)
    {
      id v6 = v5;
      long long v16 = 0u;
      long long v17 = 0u;
      long long v14 = 0u;
      long long v15 = 0u;
      uint64_t v7 = [v5 enabledAccounts];
      id v8 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
      if (v8)
      {
        id v9 = v8;
        uint64_t v10 = *(void *)v15;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(void *)v15 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
            long long v13 = sub_100068600();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v19 = v12;
              _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Kicking IDS account: %{public}@", buf, 0xCu);
            }

            IDSKickGetDependent();
          }
          id v9 = [v7 countByEnumeratingWithState:&v14 objects:v20 count:16];
        }
        while (v9);
      }

      sleep(0xAu);
    }
    else
    {
      id v6 = sub_100068600();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        sub_1000C7954();
      }
    }
  }
  else
  {
    id v6 = sub_100068600();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "No iCloud account signed in on device!", buf, 2u);
    }
  }
}

- (BOOL)_isAllowListedAccount:(id)a3 withAuthResults:(id)a4
{
  id v5 = a3;
  id v6 = [a4 objectForKey:AKAuthenticationDemoAccountKey];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v6 BOOLValue])
  {
    id v9 = sub_100068600();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "No 'demo account' flag set in IdMS auth response!", buf, 2u);
    }

    id v23 = 0;
    uint64_t v10 = +[NSRegularExpression regularExpressionWithPattern:@"chnl_internal_[0-9]{1,2}@icloud.com" options:1 error:&v23];
    id v11 = v23;
    if (!v10)
    {
      uint64_t v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000C79F4();
      }
      goto LABEL_44;
    }
    if (!objc_msgSend(v10, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
      && v12 == [v5 length])
    {
      long long v13 = [v5 substringWithRange:objc_msgSend(@"chnl_internal_", "length"), (unsigned char *)[v5 rangeOfString:@"@icloud.com"]];
      if ((uint64_t)[v13 integerValue] >= 1
        && (uint64_t)[v13 integerValue] < 21)
      {
        BOOL v8 = 1;
LABEL_31:

        goto LABEL_32;
      }
    }
    long long v22 = v11;
    long long v14 = +[NSRegularExpression regularExpressionWithPattern:@"(ars|channel|dekota)[0-9]+\\.[0-9]+@(icloud|me|mac)\\.com" options:1 error:&v22];
    uint64_t v7 = v22;

    if (v14)
    {
      if (!objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
        && v15 == [v5 length])
      {
        goto LABEL_26;
      }
      int v21 = v7;
      uint64_t v10 = +[NSRegularExpression regularExpressionWithPattern:@"chnl\\.[0-9]{7}\\.[0-9]{3}@icloud\\.com" options:1 error:&v21];
      id v11 = v21;

      if (!v10)
      {
        uint64_t v19 = sub_100068600();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          sub_1000C79F4();
        }
        goto LABEL_44;
      }
      if (!objc_msgSend(v10, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
        && v16 == [v5 length])
      {
        BOOL v8 = 1;
LABEL_32:
        long long v14 = v10;
        uint64_t v7 = v11;
        goto LABEL_33;
      }
      uint64_t v20 = v11;
      long long v14 = +[NSRegularExpression regularExpressionWithPattern:@"chnl\\.[a-zA-Z0-9]{4}\\.[a-zA-Z0-9]{6}@icloud\\.com" options:1 error:&v20];
      uint64_t v7 = v20;

      if (v14)
      {
        if (!objc_msgSend(v14, "rangeOfFirstMatchInString:options:range:", v5, 0, 0, objc_msgSend(v5, "length"))
          && v17 == [v5 length])
        {
LABEL_26:
          BOOL v8 = 1;
LABEL_33:

          goto LABEL_34;
        }
        uint64_t v10 = v14;
        id v11 = v7;
LABEL_28:
        long long v13 = sub_100068600();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1000C7988();
        }
        BOOL v8 = 0;
        goto LABEL_31;
      }
      uint64_t v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000C79F4();
      }
    }
    else
    {
      uint64_t v19 = sub_100068600();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1000C79F4();
      }
    }
    id v11 = v7;
LABEL_44:

    uint64_t v10 = 0;
    goto LABEL_28;
  }
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found 'demo account' flag in IdMS auth response!", buf, 2u);
  }
  BOOL v8 = 1;
LABEL_34:

  return v8;
}

- (void)signOutFlowController:(id)a3 showAlertWithTitle:(id)a4 message:(id)a5 completion:(id)a6
{
  id v6 = (void (**)(id, uint64_t))a6;
  uint64_t v7 = sub_100068600();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[MSDAccountManagerHelper signOutFlowController:showAlertWithTitle:message:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v8, 0xCu);
  }

  v6[2](v6, 1);
}

- (void)signOutFlowController:(id)a3 performWalrusValidationForAccount:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, uint64_t, void))a5;
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[MSDAccountManagerHelper signOutFlowController:performWalrusValidationForAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v7, 0xCu);
  }

  v5[2](v5, 1, 0);
}

- (void)signOutFlowController:(id)a3 disableFindMyDeviceForAccount:(id)a4 completion:(id)a5
{
  id v5 = (void (**)(id, uint64_t, void))a5;
  id v6 = sub_100068600();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    int v8 = "-[MSDAccountManagerHelper signOutFlowController:disableFindMyDeviceForAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered!", (uint8_t *)&v7, 0xCu);
  }

  v5[2](v5, 1, 0);
}

- (void)signOutFlowController:(id)a3 signOutAccount:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = sub_100068600();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v15 = "-[MSDAccountManagerHelper signOutFlowController:signOutAccount:completion:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered!", buf, 0xCu);
  }

  uint64_t v10 = [(MSDAccountManagerHelper *)self accountStore];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100013B98;
  v12[3] = &unk_100151DD0;
  id v13 = v7;
  id v11 = v7;
  [v10 removeAccount:v8 withDataclassActions:0 completion:v12];
}

- (CDPContext)cdpContext
{
  return self->cdpContext;
}

- (void)setCdpContext:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (AIDAServiceOwnersManager)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);

  objc_storeStrong((id *)&self->cdpContext, 0);
}

@end