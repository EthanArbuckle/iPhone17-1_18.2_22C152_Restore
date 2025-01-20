@interface COSAppleIDAuthController
+ (BOOL)isTermsUpdateNeededError:(id)a3;
+ (BOOL)shouldAttemptPasswordLessSignInForAccount:(id)a3 inAccountStore:(id)a4;
+ (BOOL)signInEndResultForValue:(BOOL)a3 error:(id)a4;
+ (id)DSIDForIDMSAccount:(id)a3;
+ (id)altDSIDForIDMSAccount:(id)a3;
+ (id)amsSaveOptions;
+ (id)lookupIDMSAccountWithAccountStore:(id)a3 matchingAccount:(id)a4;
+ (id)usernameForIDMSAccount:(id)a3;
+ (void)saveToPairedDeviceAccount:(id)a3 fromAccountStore:(id)a4 withOptions:(id)a5 completion:(id)a6;
+ (void)saveVerifiedRawPassword:(id)a3 forAccountIdentifier:(id)a4 withCompletionHandler:(id)a5;
- (AAUIProxiedTermsRemoteUI)proxiedTermsRemoteUI;
- (ACAccount)account;
- (ACAccount)idmsAccount;
- (ACAccountStore)accountStore;
- (AKAnisetteData)phoneAnisetteData;
- (AKAppleIDAuthenticationContext)authContext;
- (AKAppleIDAuthenticationController)AKAppleIDAuthController;
- (AKAppleIDAuthenticationController)authController;
- (AKAppleIDAuthenticationWatchBuddyContext)watchBuddyAuthContext;
- (AKDevice)proxiedDevice;
- (BOOL)didComplete;
- (BOOL)hasStartedFallbackFlow;
- (BOOL)isCurrentAccountiTunesAccount;
- (BOOL)needsCredentialRecovery;
- (BOOL)waitingForWatchSignInAfterInteractiveAuth;
- (COSAppleIDAuthController)initWithAccountStore:(id)a3 account:(id)a4 timeout:(double)a5 device:(id)a6;
- (COSAppleIDAuthControllerDelegate)delegate;
- (COSPrimaryAccountAuthenticationHelper)primaryAccountAuthenticationHelper;
- (FACircleStateController)circleStateController;
- (NRDevice)watchDevice;
- (NSDictionary)acceptedTermsInfo;
- (NSDictionary)authenticationResults;
- (NSError)satelliteSignInDetailedError;
- (NSError)watchSignInErrorResult;
- (NSString)password;
- (NSString)satelliteSignInErrorDescription;
- (NSString)signInAccountType;
- (OS_dispatch_source)timerSource;
- (UIViewController)presentingController;
- (double)timeout;
- (id)authenticationContext;
- (id)baseAppContext;
- (id)companionSaveOptions;
- (id)httpHeadersForRemoteAuthUI;
- (id)optionsForPLTAuthWithTokens:(id)a3;
- (id)remoteUIStyle;
- (id)satelliteSignInCompletion;
- (id)tinkerFamilyMemberFromAuthenticationResultsForInternalUseByUpdatingtinkerSignInID;
- (int64_t)satelliteSignInStatus;
- (int64_t)watchSignInResult;
- (void)_resetTermsInformation;
- (void)_resumeSatelliteSignin;
- (void)attemptMagicSignIn;
- (void)authenticatedWithResults:(id)a3 error:(id)a4;
- (void)cancelSignInTimer;
- (void)contextDidDismissLoginAlertController:(id)a3;
- (void)contextDidEndPresentingSecondaryUI:(id)a3;
- (void)contextDidPresentLoginAlertController:(id)a3;
- (void)contextWillBeginPresentingSecondaryUI:(id)a3;
- (void)contextWillDismissLoginAlertController:(id)a3;
- (void)dealloc;
- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4;
- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4;
- (void)performProxiedAuthentication;
- (void)presentTermsWithCachedAuthResultsForDSID:(id)a3;
- (void)reauthFamilyCircleByExistingAuthenticationResultsWithCompletion:(id)a3;
- (void)repairGuardianAccount:(id)a3;
- (void)reportSignInCompletionWithSuccess:(BOOL)a3 error:(id)a4;
- (void)resetWatchSignInResponse;
- (void)saveAccountToPairedDevice;
- (void)saveAccountToPairedDeviceForPLTAuthWithTokens:(id)a3;
- (void)saveAccountToPairedDeviceWithOptions:(id)a3;
- (void)saveAccountToPairedDeviceWithRawPassword:(id)a3;
- (void)savedAccountToPairedDeviceWithSuccess:(BOOL)a3 error:(id)a4;
- (void)setAKAppleIDAuthController:(id)a3;
- (void)setAcceptedTermsInfo:(id)a3;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAuthContext:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setAuthenticationResults:(id)a3;
- (void)setCircleStateController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidComplete:(BOOL)a3;
- (void)setHasStartedFallbackFlow:(BOOL)a3;
- (void)setIdmsAccount:(id)a3;
- (void)setNeedsCredentialRecovery:(BOOL)a3;
- (void)setPassword:(id)a3;
- (void)setPhoneAnisetteData:(id)a3;
- (void)setPresentingController:(id)a3;
- (void)setPrimaryAccountAuthenticationHelper:(id)a3;
- (void)setProxiedDevice:(id)a3;
- (void)setProxiedTermsRemoteUI:(id)a3;
- (void)setSatelliteSignInCompletion:(id)a3;
- (void)setSatelliteSignInDetailedError:(id)a3;
- (void)setSatelliteSignInErrorDescription:(id)a3;
- (void)setSatelliteSignInStatus:(int64_t)a3;
- (void)setSignInAccountType:(id)a3;
- (void)setTimeout:(double)a3;
- (void)setTimerSource:(id)a3;
- (void)setWaitingForWatchSignInAfterInteractiveAuth:(BOOL)a3;
- (void)setWatchBuddyAuthContext:(id)a3;
- (void)setWatchDevice:(id)a3;
- (void)setWatchSignInErrorResult:(id)a3;
- (void)setWatchSignInResult:(int64_t)a3;
- (void)signInTimerFired;
- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4;
- (void)startAccountActionWithContext:(id)a3;
- (void)startRecoveringCredentials;
- (void)startSatelliteSigninWithProgressCompletion:(id)a3;
- (void)startSignInTimer;
- (void)startSigningInWithPassword:(id)a3;
- (void)startSigningInWithoutPassword;
- (void)waitForSatelliteSigninWithProgressCompletion:(id)a3;
- (void)willPresentModalNavigationController:(id)a3;
@end

@implementation COSAppleIDAuthController

+ (id)usernameForIDMSAccount:(id)a3
{
  return [a3 username];
}

+ (id)DSIDForIDMSAccount:(id)a3
{
  id v3 = a3;
  v4 = +[AKAccountManager sharedInstance];
  v5 = [v4 DSIDForAccount:v3];

  v6 = [v5 stringValue];

  return v6;
}

+ (id)altDSIDForIDMSAccount:(id)a3
{
  id v3 = a3;
  v4 = +[AKAccountManager sharedInstance];
  v5 = [v4 altDSIDForAccount:v3];

  return v5;
}

+ (BOOL)shouldAttemptPasswordLessSignInForAccount:(id)a3 inAccountStore:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    v7 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v8 = [v7 isPasscodeSet];

    if (v8)
    {
      v9 = [(id)objc_opt_class() lookupIDMSAccountWithAccountStore:v6 matchingAccount:v5];
      if (v9)
      {
        v10 = +[AKAccountManager sharedInstance];
        v11 = [v10 continuationTokenForAccount:v9];

        v12 = +[AKAccountManager sharedInstance];
        v13 = [v12 passwordResetTokenForAccount:v9];

        if (v11 && v13)
        {
          BOOL v14 = 1;
LABEL_16:

          goto LABEL_17;
        }
        v15 = pbb_accountsignin_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = +[NSNumber numberWithBool:v11 != 0];
          v17 = +[NSNumber numberWithBool:v13 != 0];
          int v19 = 138412802;
          id v20 = v5;
          __int16 v21 = 2112;
          v22 = v16;
          __int16 v23 = 2112;
          v24 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Will skip silent sign-in for account: (%@); hasCK: %@ hasPRK: %@",
            (uint8_t *)&v19,
            0x20u);
        }
      }
      else
      {
        v15 = pbb_accountsignin_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          int v19 = 138412290;
          id v20 = v5;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Will skip silent sign-in for account: (%@); No matching IDMS account.",
            (uint8_t *)&v19,
            0xCu);
        }
      }
    }
    else
    {
      v9 = pbb_accountsignin_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int v19 = 138412290;
        id v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Will skip silent sign-in for account: (%@); No passcode set.",
          (uint8_t *)&v19,
          0xCu);
      }
    }
    BOOL v14 = 0;
    goto LABEL_16;
  }
  BOOL v14 = 0;
LABEL_17:

  return v14;
}

+ (void)saveToPairedDeviceAccount:(id)a3 fromAccountStore:(id)a4 withOptions:(id)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = a4;
  v13 = pbb_accountsignin_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = objc_retainBlock(v11);
    *(_DWORD *)buf = 134218498;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2048;
    id v26 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving Account (%p) to paired device with options: (%@); completion: (%p)",
      buf,
      0x20u);
  }
  id v15 = [objc_alloc((Class)ACAccountCredential) initWithPassword:0];
  [v9 setCredential:v15];

  [v9 setAuthenticated:0];
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_1000FAD50;
  v18[3] = &unk_100247150;
  id v19 = v9;
  id v20 = v11;
  id v16 = v11;
  id v17 = v9;
  [v12 saveAccount:v17 toPairedDeviceWithOptions:v10 completion:v18];
}

+ (BOOL)signInEndResultForValue:(BOOL)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    BOOL v7 = 0;
  }
  else
  {
    unsigned __int8 v8 = [v5 domain];
    if ([v8 isEqualToString:ACErrorDomain]) {
      BOOL v7 = [v6 code] == (id)5;
    }
    else {
      BOOL v7 = 0;
    }
  }
  return v7 || a3;
}

+ (BOOL)isTermsUpdateNeededError:(id)a3
{
  id v3 = a3;
  v4 = [v3 domain];
  if ([v4 isEqualToString:AASignInErrorDomain]
    && [v3 code] == (id)-8010)
  {
    id v5 = [v3 userInfo];

    if (!v5)
    {
      unsigned __int8 v10 = 0;
      goto LABEL_8;
    }
    id v6 = [v3 userInfo];
    v4 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

    BOOL v7 = [v4 userInfo];
    if (v7)
    {
      unsigned __int8 v8 = [v4 userInfo];
      id v9 = [v8 objectForKeyedSubscript:kAAProtocolErrorKey];
      unsigned __int8 v10 = [v9 isEqualToString:kAAProtocolErrorMobileMeTermsOfServiceUpdate];
    }
    else
    {
      unsigned __int8 v10 = 0;
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

LABEL_8:
  return v10;
}

- (COSAppleIDAuthController)initWithAccountStore:(id)a3 account:(id)a4 timeout:(double)a5 device:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = 0;
  if (v11 && v12)
  {
    v20.receiver = self;
    v20.super_class = (Class)COSAppleIDAuthController;
    id v15 = [(COSAppleIDAuthController *)&v20 init];
    id v16 = v15;
    if (v15)
    {
      objc_storeStrong((id *)&v15->_accountStore, a3);
      objc_storeStrong((id *)&v16->_account, a4);
      v16->_timeout = a5;
      account = v16->_account;
      id v18 = [objc_alloc((Class)ACAccountCredential) initWithPassword:0];
      [(ACAccount *)account setCredential:v18];

      [(ACAccount *)v16->_account setAuthenticated:0];
      objc_storeStrong((id *)&v16->_watchDevice, a6);
    }
    self = v16;
    id v14 = self;
  }

  return v14;
}

- (void)dealloc
{
  [(COSAppleIDAuthController *)self cancelSignInTimer];
  v3.receiver = self;
  v3.super_class = (Class)COSAppleIDAuthController;
  [(COSAppleIDAuthController *)&v3 dealloc];
}

- (void)startSigningInWithoutPassword
{
  objc_super v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    double timeout = self->_timeout;
    int v10 = 138412546;
    id v11 = account;
    __int16 v12 = 2048;
    double v13 = timeout;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Starting password-less sign-in for account: (%@); timer: (%f)",
      (uint8_t *)&v10,
      0x16u);
  }

  id v6 = [UIApp setupController];
  BOOL v7 = [v6 pairingReportManager];

  unsigned __int8 v8 = [(COSAppleIDAuthController *)self signInAccountType];
  uint64_t v9 = BRSignInPairingTimeEventForAccountType();

  [v7 checkInWithOpenPairingTimeEvent:v9];
  [(COSAppleIDAuthController *)self startSignInTimer];
  [(COSAppleIDAuthController *)self attemptMagicSignIn];
}

- (void)startSigningInWithPassword:(id)a3
{
  id v5 = a3;
  id v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    double timeout = self->_timeout;
    *(_DWORD *)buf = 138412802;
    __int16 v23 = account;
    __int16 v24 = 2048;
    double v25 = timeout;
    __int16 v26 = 1024;
    BOOL v27 = v5 != 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Starting interactive sign-in for account: (%@); timer: (%f) password: %{BOOL}d",
      buf,
      0x1Cu);
  }

  uint64_t v9 = [UIApp setupController];
  int v10 = [v9 pairingReportManager];

  id v11 = [(COSAppleIDAuthController *)self signInAccountType];
  uint64_t v12 = BRSignInPairingTimeEventForAccountType();

  [v10 checkInWithOpenPairingTimeEvent:v12];
  [(COSAppleIDAuthController *)self startSignInTimer];
  objc_storeStrong((id *)&self->_password, a3);
  self->_hasStartedFallbackFlow = 1;
  watchDevice = self->_watchDevice;
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"25B1B001-1F02-49A0-B7E7-6225BA6B004D"];
  if ([(NRDevice *)watchDevice supportsCapability:v14])
  {
    id v15 = +[UIApplication sharedApplication];
    id v16 = [v15 bridgeController];

    if (v16)
    {
      if (self->_proxiedDevice)
      {
        [(COSAppleIDAuthController *)self performProxiedAuthentication];
      }
      else
      {
        id v18 = pbb_accountsignin_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Proxied Authenication.  Getting AKDevice from the watch", buf, 2u);
        }

        id v19 = +[UIApplication sharedApplication];
        objc_super v20 = [v19 bridgeController];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_1000FB628;
        v21[3] = &unk_100243EE0;
        v21[4] = self;
        [v20 requestProxiedDeviceForWatchWithCompletion:v21];
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  id v17 = pbb_accountsignin_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Can't get AKDevice explicitly, falling back to force failing silent auth", buf, 2u);
  }

  [(COSAppleIDAuthController *)self saveAccountToPairedDevice];
LABEL_11:
}

- (void)startRecoveringCredentials
{
  objc_super v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    *(_DWORD *)buf = 136315394;
    id v16 = "-[COSAppleIDAuthController startRecoveringCredentials]";
    __int16 v17 = 2112;
    id v18 = account;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s: Starting password-recovery for account: (%@)", buf, 0x16u);
  }

  password = self->_password;
  self->_password = 0;

  self->_hasStartedFallbackFlow = 1;
  self->_needsCredentialRecovery = 1;
  watchDevice = self->_watchDevice;
  id v7 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"25B1B001-1F02-49A0-B7E7-6225BA6B004D"];
  if ([(NRDevice *)watchDevice supportsCapability:v7])
  {
    unsigned __int8 v8 = +[UIApplication sharedApplication];
    uint64_t v9 = [v8 bridgeController];

    if (v9)
    {
      if (self->_proxiedDevice)
      {
        [(COSAppleIDAuthController *)self performProxiedAuthentication];
      }
      else
      {
        id v11 = pbb_accountsignin_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Proxied Authenication.  Getting AKDevice from the watch", buf, 2u);
        }

        uint64_t v12 = +[UIApplication sharedApplication];
        double v13 = [v12 bridgeController];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1000FB8E8;
        v14[3] = &unk_100243EE0;
        v14[4] = self;
        [v13 requestProxiedDeviceForWatchWithCompletion:v14];
      }
      return;
    }
  }
  else
  {
  }
  int v10 = pbb_accountsignin_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Can't get AKDevice explicitly, falling back to force failing silent auth", buf, 2u);
  }

  [(COSAppleIDAuthController *)self saveAccountToPairedDevice];
}

- (void)startSignInTimer
{
  if (self->_timeout != 0.0)
  {
    objc_super v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    timerSource = self->_timerSource;
    self->_timerSource = v3;

    if (self->_timerSource)
    {
      objc_initWeak(&location, self);
      double timeout = self->_timeout;
      uint64_t v6 = 100000000 * (uint64_t)timeout;
      id v7 = self->_timerSource;
      dispatch_time_t v8 = dispatch_time(0, 1000000000 * (uint64_t)timeout);
      dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, v6);
      uint64_t v9 = self->_timerSource;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1000FBA78;
      v10[3] = &unk_1002439E0;
      objc_copyWeak(&v11, &location);
      dispatch_source_set_event_handler(v9, v10);
      dispatch_resume((dispatch_object_t)self->_timerSource);
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

- (void)cancelSignInTimer
{
  timerSource = self->_timerSource;
  if (timerSource)
  {
    dispatch_source_cancel(timerSource);
    v4 = self->_timerSource;
    self->_timerSource = 0;
  }
}

- (void)signInTimerFired
{
  objc_super v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    account = self->_account;
    int v6 = 138412290;
    id v7 = account;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Sign-in timer fired for account: (%@)", (uint8_t *)&v6, 0xCu);
  }

  id v5 = sub_1000FBBD8(2, 0);
  [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v5];
}

+ (id)lookupIDMSAccountWithAccountStore:(id)a3 matchingAccount:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierIDMS];
  if (v7)
  {
    [v5 accountsWithAccountType:v7];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if (+[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:", v12, v6, (void)v14))
          {
            id v9 = v12;
            goto LABEL_12;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (void)attemptMagicSignIn
{
  objc_super v3 = [(id)objc_opt_class() lookupIDMSAccountWithAccountStore:self->_accountStore matchingAccount:self->_account];
  objc_storeStrong((id *)&self->_idmsAccount, v3);
  idmsAccount = self->_idmsAccount;
  if (idmsAccount)
  {
    id v20 = 0;
    id v5 = [(ACAccount *)idmsAccount credentialWithError:&v20];
    id v6 = v20;
    id v7 = pbb_accountsignin_log();
    id v8 = v7;
    if (v6 || !v5)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        sub_100174AE4();
      }

      double v13 = sub_1000FBBD8(0, v6);
      [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v13];
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = self->_idmsAccount;
        accountStore = self->_accountStore;
        *(_DWORD *)buf = 138412546;
        id v22 = v9;
        __int16 v23 = 2112;
        __int16 v24 = accountStore;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving IDMS account (%@) with account store: (%@)", buf, 0x16u);
      }

      id v11 = self->_accountStore;
      uint64_t v12 = self->_idmsAccount;
      long long v15 = _NSConcreteStackBlock;
      uint64_t v16 = 3221225472;
      long long v17 = sub_1000FC080;
      id v18 = &unk_100243878;
      id v19 = v3;
      [(ACAccountStore *)v11 saveAccount:v12 toPairedDeviceWithOptions:0 completion:&v15];
      [(COSAppleIDAuthController *)self saveAccountToPairedDevice];
      double v13 = v19;
    }
  }
  else
  {
    long long v14 = pbb_accountsignin_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_100174AB0();
    }

    sub_1000FBBD8(0, 0);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v6];
  }
}

- (BOOL)isCurrentAccountiTunesAccount
{
  v2 = [(ACAccount *)self->_account accountType];
  objc_super v3 = [v2 identifier];
  unsigned __int8 v4 = [v3 isEqualToString:ACAccountTypeIdentifieriTunesStore];

  return v4;
}

+ (id)amsSaveOptions
{
  v2 = objc_opt_new();
  [v2 setObject:&__kCFBooleanFalse forKeyedSubscript:AMSAuthenticateOptionsAllowServerDialogs];
  [v2 setObject:&__kCFBooleanTrue forKeyedSubscript:AMSAuthenticateOptionsIgnoreAccountConversion];

  return v2;
}

- (id)companionSaveOptions
{
  objc_super v3 = objc_opt_new();
  unsigned __int8 v4 = +[AKDevice currentDevice];
  id v5 = [v4 serverFriendlyDescription];

  if (v5) {
    [v3 setObject:v5 forKeyedSubscript:kAASaveOptionCompanionDeviceClientInfoKey];
  }
  id v6 = +[AKDevice currentDevice];
  id v7 = [v6 uniqueDeviceIdentifier];

  if (v7) {
    [v3 setObject:v7 forKeyedSubscript:kAASaveOptionCompanionDeviceUDIDKey];
  }
  if ([(COSAppleIDAuthController *)self isCurrentAccountiTunesAccount])
  {
    id v8 = [(id)objc_opt_class() amsSaveOptions];
    [v3 addEntriesFromDictionary:v8];
  }

  return v3;
}

- (void)saveAccountToPairedDevice
{
  id v5 = [(COSAppleIDAuthController *)self companionSaveOptions];
  account = self->_account;
  id v4 = [objc_alloc((Class)ACAccountCredential) initWithPassword:0];
  [(ACAccount *)account setCredential:v4];

  [(COSAppleIDAuthController *)self saveAccountToPairedDeviceWithOptions:v5];
}

- (void)saveAccountToPairedDeviceWithOptions:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    accountStore = self->_accountStore;
    account = self->_account;
    *(_DWORD *)buf = 138412802;
    long long v17 = account;
    __int16 v18 = 2112;
    id v19 = accountStore;
    __int16 v20 = 2112;
    id v21 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Saving account (%@) to paired device with account store: (%@) and options: (%@)", buf, 0x20u);
  }

  id v8 = self->_account;
  id v9 = self->_accountStore;
  uint64_t v10 = self->_account;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1000FC568;
  v12[3] = &unk_100247178;
  id v11 = v8;
  double v13 = v11;
  objc_copyWeak(&v14, &location);
  [(ACAccountStore *)v9 saveAccount:v10 toPairedDeviceWithOptions:v4 completion:v12];
  objc_destroyWeak(&v14);

  objc_destroyWeak(&location);
}

- (void)savedAccountToPairedDeviceWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (self->_didComplete) {
    goto LABEL_23;
  }
  if (v4)
  {
    id v8 = pbb_accountsignin_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Successfully signed-in.", (uint8_t *)&v23, 2u);
    }

    id v9 = self;
    uint64_t v10 = 1;
    id v11 = 0;
    goto LABEL_22;
  }
  if (self->_proxiedDevice)
  {
    uint64_t v12 = pbb_accountsignin_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100174C1C();
    }
LABEL_21:

    id v9 = self;
    uint64_t v10 = 0;
    id v11 = v7;
LABEL_22:
    [(COSAppleIDAuthController *)v9 reportSignInCompletionWithSuccess:v10 error:v11];
    goto LABEL_23;
  }
  double v13 = [v6 domain];
  if (![v13 isEqualToString:@"com.apple.appleaccount"])
  {

LABEL_19:
    uint64_t v12 = pbb_accountsignin_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_100174BB4();
    }
    goto LABEL_21;
  }
  id v14 = [v7 code];

  if (v14 != (id)-7) {
    goto LABEL_19;
  }
  if (self->_hasStartedFallbackFlow)
  {
    long long v15 = [v7 userInfo];
    uint64_t v16 = [v15 objectForKeyedSubscript:kAAErrorDetailsProxiedDeviceDataKey];
    long long v17 = v16;
    if (v16)
    {
      uint64_t v16 = +[AKDevice deviceWithSerializedData:v16];
    }
    proxiedDevice = self->_proxiedDevice;
    self->_proxiedDevice = v16;

    [(AKDevice *)self->_proxiedDevice setLinkType:2];
    id v19 = pbb_accountsignin_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v20 = self->_proxiedDevice;
      int v23 = 138412546;
      __int16 v24 = v20;
      __int16 v25 = 2048;
      id v26 = [(AKDevice *)v17 length];
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Watch AKDevice: (%@); AKDevice data: (%lu bytes)",
        (uint8_t *)&v23,
        0x16u);
    }

    if (self->_proxiedDevice)
    {
      [(COSAppleIDAuthController *)self performProxiedAuthentication];
    }
    else
    {
      id v22 = sub_1000FBBD8(1, v7);
      [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v22];
    }
  }
  else
  {
    id v21 = pbb_accountsignin_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_100174B4C();
    }

    long long v15 = sub_1000FBBD8(0, v7);
    [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v15];
  }

LABEL_23:
}

- (void)performProxiedAuthentication
{
  id v3 = objc_alloc_init((Class)AKAppleIDAuthenticationWatchBuddyContext);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0) {
    goto LABEL_6;
  }
  id v6 = objc_loadWeakRetained((id *)&self->_delegate);
  id v7 = [v6 appleIDAuthControllerRequestsPresentingViewController:self];

  id v8 = pbb_accountsignin_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v20 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Calling out to AuthKit. Presenting View Controller: (%@)", buf, 0xCu);
  }

  if (v7)
  {
    [v3 setPresentingViewController:v7];

LABEL_6:
    id v9 = [(ACAccount *)self->_account username];
    [v3 setUsername:v9];

    [v3 setPassword:self->_password];
    [v3 setIsUsernameEditable:0];
    uint64_t v10 = [(COSAppleIDAuthController *)self httpHeadersForRemoteAuthUI];
    [v3 setHttpHeadersForRemoteUI:v10];

    [v3 setProxiedDevice:self->_proxiedDevice];
    [v3 setNeedsCredentialRecovery:self->_needsCredentialRecovery];
    objc_storeStrong((id *)&self->_watchBuddyAuthContext, v3);
    objc_initWeak(&location, self);
    id v11 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
    authController = self->_authController;
    self->_authController = v11;

    double v13 = pbb_accountsignin_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = self->_authController;
      *(_DWORD *)buf = 138412290;
      __int16 v20 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Authenticating using AuthKit controller: (%@)", buf, 0xCu);
    }

    long long v15 = self->_authController;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000FCD24;
    v16[3] = &unk_100243F08;
    objc_copyWeak(&v17, &location);
    [(AKAppleIDAuthenticationController *)v15 authenticateWithContext:v3 completion:v16];
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
}

- (void)authenticatedWithResults:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!self->_didComplete)
  {
    authController = self->_authController;
    self->_authController = 0;

    if (v7)
    {
      id v9 = pbb_accountsignin_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_100174C84();
      }

      [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v7];
    }
    else
    {
      uint64_t v10 = [v6 objectForKeyedSubscript:AKAuthenticationRawPasswordKey];
      id v11 = [v6 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey];
      uint64_t v12 = [v11 objectForKeyedSubscript:AKPasswordlessTokenKey];
      if ([v12 length] && _os_feature_enabled_impl())
      {
        double v13 = pbb_accountsignin_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Saving account to pair device with passwordlessToken.", (uint8_t *)buf, 2u);
        }

        [(COSAppleIDAuthController *)self saveAccountToPairedDeviceForPLTAuthWithTokens:v11];
      }
      else
      {
        id v14 = [v10 length];
        long long v15 = pbb_accountsignin_log();
        BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
        if (v14)
        {
          if (v16)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Saving account to pair device with raw password.", (uint8_t *)buf, 2u);
          }

          objc_initWeak(buf, self);
          id v17 = objc_opt_class();
          __int16 v18 = [(ACAccount *)self->_account identifier];
          v20[0] = _NSConcreteStackBlock;
          v20[1] = 3221225472;
          v20[2] = sub_1000FD1EC;
          v20[3] = &unk_100243D28;
          objc_copyWeak(&v22, buf);
          id v21 = v10;
          [v17 saveVerifiedRawPassword:v21 forAccountIdentifier:v18 withCompletionHandler:v20];

          objc_destroyWeak(&v22);
          objc_destroyWeak(buf);
        }
        else
        {
          if (v16)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No raw password or passwordless token available for proxied auth.", (uint8_t *)buf, 2u);
          }

          id v19 = sub_1000FBBD8(1, 0);
          [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v19];
        }
      }
    }
  }
}

+ (void)saveVerifiedRawPassword:(id)a3 forAccountIdentifier:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = (void (**)(void))a5;
  uint64_t v10 = pbb_accountsignin_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving verified account locally for account identifier (%@)", buf, 0xCu);
  }

  id v11 = objc_alloc_init((Class)ACAccountStore);
  uint64_t v12 = [v11 accountWithIdentifier:v8];
  double v13 = v12;
  if (v12)
  {
    [v12 _aa_setRawPassword:v7];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000FD4E0;
    v15[3] = &unk_100244430;
    BOOL v16 = v9;
    [v11 saveVerifiedAccount:v13 withCompletionHandler:v15];
  }
  else
  {
    id v14 = pbb_bridge_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR) && os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v18 = v8;
      __int16 v19 = 2112;
      id v20 = v11;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Could not find account with identifier (%@) in account store (%@)", buf, 0x16u);
    }

    if (v9) {
      v9[2](v9);
    }
  }
}

- (void)saveAccountToPairedDeviceWithRawPassword:(id)a3
{
  id v4 = a3;
  char v5 = [(ACAccount *)self->_account accountType];
  id v6 = [v5 identifier];

  id v7 = pbb_accountsignin_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    __int16 v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Save Account of type identifier: %@", (uint8_t *)&v18, 0xCu);
  }

  watchDevice = self->_watchDevice;
  id v9 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"37CF71A8-CFCC-41D9-ADE7-704585AFA68B"];
  id v10 = [(NRDevice *)watchDevice supportsCapability:v9];

  id v11 = pbb_accountsignin_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = +[NSNumber numberWithBool:v10];
    int v18 = 138412290;
    __int16 v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Supports iTunes PET? %@", (uint8_t *)&v18, 0xCu);
  }
  if (v10 && [v6 isEqualToString:ACAccountTypeIdentifieriTunesStore])
  {
    id v13 = [objc_alloc((Class)ACAccountCredential) initWithPassword:0];
    [(ACAccount *)self->_account setCredential:v13];
    [v13 setCredentialItem:v4 forKey:ACRawPasswordKey];
  }
  else
  {
    account = self->_account;
    id v13 = +[ACAccountCredential credentialWithPassword:v4];
    [(ACAccount *)account setCredential:v13];
  }

  self->_waitingForWatchSignInAfterInteractiveAuth = 1;
  [(COSAppleIDAuthController *)self resetWatchSignInResponse];
  [(COSAppleIDAuthController *)self saveAccountToPairedDeviceWithOptions:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v16 = objc_opt_respondsToSelector();

  if (v16)
  {
    id v17 = objc_loadWeakRetained((id *)&self->_delegate);
    [v17 didSendSignInRequestToWatchFromAppleIDAuthContoller:self];
  }
}

- (void)resetWatchSignInResponse
{
  watchSignInErrorResult = self->_watchSignInErrorResult;
  self->_watchSignInResult = 0;
  self->_watchSignInErrorResult = 0;
}

- (void)saveAccountToPairedDeviceForPLTAuthWithTokens:(id)a3
{
  id v4 = [(COSAppleIDAuthController *)self optionsForPLTAuthWithTokens:a3];
  char v5 = [v4 objectForKeyedSubscript:kAASaveOptionPasswordlessTokenKey];
  if (v5)
  {
    id v6 = [(id)objc_opt_class() lookupIDMSAccountWithAccountStore:self->_accountStore matchingAccount:self->_account];
    objc_storeStrong((id *)&self->_idmsAccount, v6);
    idmsAccount = self->_idmsAccount;
    if (idmsAccount)
    {
      id v27 = 0;
      id v8 = [(ACAccount *)idmsAccount credentialWithError:&v27];
      id v9 = v27;
      if (v9 || !v8)
      {
        id v21 = pbb_accountsignin_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_100174AE4();
        }

        int v18 = sub_1000FBBD8(0, v9);
        [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v18];
      }
      else
      {
        [v8 setCredentialItem:0 forKey:ACContinuationTokenKey];
        id v10 = pbb_accountsignin_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          id v11 = self->_idmsAccount;
          accountStore = self->_accountStore;
          *(_DWORD *)buf = 138412546;
          v29 = v11;
          __int16 v30 = 2112;
          v31 = accountStore;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Saving IDMS account (%@) with account store: (%@)", buf, 0x16u);
        }

        id v13 = self->_accountStore;
        id v14 = self->_idmsAccount;
        id v22 = _NSConcreteStackBlock;
        uint64_t v23 = 3221225472;
        __int16 v24 = sub_1000FDB78;
        __int16 v25 = &unk_100243878;
        id v26 = v6;
        [(ACAccountStore *)v13 saveAccount:v14 toPairedDeviceWithOptions:0 completion:&v22];
        self->_waitingForWatchSignInAfterInteractiveAuth = 1;
        [(COSAppleIDAuthController *)self resetWatchSignInResponse];
        [(COSAppleIDAuthController *)self saveAccountToPairedDeviceWithOptions:v4];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        char v16 = objc_opt_respondsToSelector();

        if (v16)
        {
          id v17 = objc_loadWeakRetained((id *)&self->_delegate);
          [v17 didSendSignInRequestToWatchFromAppleIDAuthContoller:self];
        }
        int v18 = v26;
      }
    }
    else
    {
      id v20 = pbb_accountsignin_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        sub_100174AB0();
      }

      sub_1000FBBD8(0, 0);
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v9];
    }
  }
  else
  {
    __int16 v19 = pbb_accountsignin_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_100174CEC();
    }

    id v6 = sub_1000FBBD8(0, 0);
    [(COSAppleIDAuthController *)self reportSignInCompletionWithSuccess:0 error:v6];
  }
}

- (id)optionsForPLTAuthWithTokens:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_new();
  char v5 = [v3 objectForKeyedSubscript:AKPasswordlessTokenKey];
  id v6 = [v3 objectForKeyedSubscript:AKIdmsDataTokenKey];

  if (v5 && [v5 length])
  {
    id v7 = pbb_accountsignin_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Adding passwordlessToken to options.", buf, 2u);
    }

    [v4 setObject:v5 forKeyedSubscript:kAASaveOptionPasswordlessTokenKey];
  }
  if (v6 && [v6 length])
  {
    id v8 = pbb_accountsignin_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Adding idmsDataToken to options.", v10, 2u);
    }

    [v4 setObject:v6 forKeyedSubscript:kAASaveOptionIdmsDataTokenKey];
  }

  return v4;
}

- (id)httpHeadersForRemoteAuthUI
{
  v2 = [(NRDevice *)self->_watchDevice valueForProperty:NRDevicePropertyModelNumber];
  if (v2)
  {
    id v3 = +[COSAAGenericTermsUIRequest deviceModelHeaderName];
    id v6 = v3;
    id v7 = v2;
    id v4 = +[NSDictionary dictionaryWithObjects:&v7 forKeys:&v6 count:1];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)reportSignInCompletionWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  self->_didComplete = 1;
  id v6 = a4;
  [(COSAppleIDAuthController *)self cancelSignInTimer];
  authController = self->_authController;
  if (authController)
  {
    [(AKAppleIDAuthenticationController *)authController setDelegate:0];
    id v8 = self->_authController;
    self->_authController = 0;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  id v11 = WeakRetained;
  if (v4) {
    id v10 = 0;
  }
  else {
    id v10 = v6;
  }
  [WeakRetained appleIDAuthController:self didSignInWithSuccess:v4 error:v10];
}

- (void)_resetTermsInformation
{
  proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI;
  self->_proxiedTermsRemoteUI = 0;

  acceptedTermsInfo = self->_acceptedTermsInfo;
  self->_acceptedTermsInfo = 0;
}

- (void)startSatelliteSigninWithProgressCompletion:(id)a3
{
  id v4 = a3;
  [(COSAppleIDAuthController *)self _resetTermsInformation];
  self->_satelliteSignInStatus = 0;
  satelliteSignInDetailedError = self->_satelliteSignInDetailedError;
  self->_satelliteSignInDetailedError = 0;

  satelliteSignInErrorDescription = self->_satelliteSignInErrorDescription;
  self->_satelliteSignInErrorDescription = 0;

  id v7 = objc_retainBlock(v4);
  id satelliteSignInCompletion = self->_satelliteSignInCompletion;
  self->_id satelliteSignInCompletion = v7;

  [(COSAppleIDAuthController *)self _resumeSatelliteSignin];
}

- (void)waitForSatelliteSigninWithProgressCompletion:(id)a3
{
  id v4 = objc_retainBlock(a3);
  id satelliteSignInCompletion = self->_satelliteSignInCompletion;
  self->_id satelliteSignInCompletion = v4;

  if (self->_satelliteSignInStatus)
  {
    id v6 = (void (*)(void))*((void *)self->_satelliteSignInCompletion + 2);
    v6();
  }
  else
  {
    id v7 = pbb_accountsignin_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "ignoring current status", v8, 2u);
    }
  }
}

- (void)_resumeSatelliteSignin
{
  id v3 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationUsernameKey];
  id v4 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationRawPasswordKey];
  char v5 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  v28 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationDSIDKey];
  id v6 = +[NRPairedDeviceRegistry sharedInstance];
  id v7 = +[NRPairedDeviceRegistry activeDeviceSelectorBlock];
  id v8 = [v6 getAllDevicesWithArchivedAltAccountDevicesMatching:v7];
  id v9 = [v8 firstObject];

  if (v9)
  {
    id v10 = +[NRPairedDeviceRegistry sharedInstance];
    [v10 pairingClientSetAltAccountName:v3 altDSID:v5 forDevice:v9 completion:&stru_100247198];
  }
  else
  {
    id v10 = pbb_accountsignin_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_100174D20(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }

  int v18 = +[UIApplication sharedApplication];
  __int16 v19 = [v18 setupController];

  id v20 = objc_opt_new();
  [v20 setUsername:v3];
  [v20 setPassword:v4];
  [v20 setAcceptedTermsInfo:self->_acceptedTermsInfo];
  id v21 = [v19 pairingParentFamilyMember];
  id v22 = [v21 appleID];
  [v20 setPairingParentUsername:v22];

  uint64_t v23 = [v19 pairingParentFamilyMember];
  __int16 v24 = [v23 altDSID];
  [v20 setPairingParentAltDSID:v24];

  objc_initWeak(&location, self);
  __int16 v25 = +[UIApplication sharedApplication];
  id v26 = [v25 bridgeController];
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_1000FE424;
  v29[3] = &unk_1002471E8;
  objc_copyWeak(&v31, &location);
  id v27 = v28;
  id v30 = v27;
  [v26 sendTinkerAccountCredentialsWithContext:v20 completion:v29];

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
}

- (void)presentTermsWithCachedAuthResultsForDSID:(id)a3
{
  id v4 = (void *)UIApp;
  id v5 = a3;
  id v6 = [v4 setupController];
  id v12 = [v6 navigationController];

  id v7 = [(NSDictionary *)self->_authenticationResults mutableCopy];
  [v7 setObject:v5 forKeyedSubscript:AKAuthenticationDSIDKey];

  id v8 = (AAUIProxiedTermsRemoteUI *)[objc_alloc((Class)AAUIProxiedTermsRemoteUI) initWithAuthResults:v7 proxiedDevice:self->_proxiedDevice appProvidedContext:@"tinker"];
  proxiedTermsRemoteUI = self->_proxiedTermsRemoteUI;
  self->_proxiedTermsRemoteUI = v8;

  [(AAUIProxiedTermsRemoteUI *)self->_proxiedTermsRemoteUI setDelegate:self];
  id v10 = self->_proxiedTermsRemoteUI;
  uint64_t v11 = [v12 topViewController];
  [(AAUIProxiedTermsRemoteUI *)v10 presentFromViewController:v11 modal:1];
}

- (void)repairGuardianAccount:(id)a3
{
  id v4 = a3;
  id v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v28 = "-[COSAppleIDAuthController repairGuardianAccount:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000FEBF4;
  v25[3] = &unk_100247150;
  v25[4] = self;
  id v6 = v4;
  id v26 = v6;
  id v7 = objc_retainBlock(v25);
  id v8 = objc_alloc((Class)CDPStateController);
  id v9 = +[CDPAccount sharedInstance];
  uint64_t v10 = [v9 contextForPrimaryAccount];
  id v11 = [v8 initWithContext:v10];

  id v24 = 0;
  LOBYTE(v10) = [v11 isManateeAvailable:&v24];
  id v12 = v24;
  if (v10)
  {
    uint64_t v13 = pbb_accountsignin_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v28 = "-[COSAppleIDAuthController repairGuardianAccount:]";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s Manatee available", buf, 0xCu);
    }

    ((void (*)(void *, uint64_t, void))v7[2])(v7, 1, 0);
  }
  else
  {
    id v14 = objc_alloc((Class)CDPUIDeviceToDeviceEncryptionFlowContext);
    uint64_t v15 = +[CDPAccount sharedInstance];
    uint64_t v16 = [v15 primaryAccountAltDSID];
    id v17 = [v14 initWithAltDSID:v16];

    int v18 = +[NSBundle mainBundle];
    __int16 v19 = [v18 localizedStringForKey:@"GUARDIAN_ACCOUNT_REPAIR_FEATURE_NAME" value:&stru_100249230 table:@"Localizable-tinker"];
    [v17 setFeatureName:v19];

    [v17 setDeviceToDeviceEncryptionUpgradeUIStyle:0];
    [v17 setDeviceToDeviceEncryptionUpgradeType:0];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);
    [v17 setPresentingViewController:WeakRetained];

    [v17 setSecurityUpgradeContext:AKSecurityUpgradeContextTinker];
    id v21 = [objc_alloc((Class)CDPUIDeviceToDeviceEncryptionHelper) initWithContext:v17];
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000FEE0C;
    v22[3] = &unk_100244430;
    uint64_t v23 = v7;
    [v21 performDeviceToDeviceEncryptionStateRepairWithCompletion:v22];

    id v12 = v17;
  }
}

- (id)baseAppContext
{
  id v3 = objc_alloc_init((Class)AKAppleIDAuthenticationInAppContext);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);
  [v3 setPresentingViewController:WeakRetained];

  [v3 setServiceType:1];
  [v3 _setProxyingForApp:1];
  [v3 setDelegate:self];
  [v3 setAppProvidedContext:@"tinker"];
  id v5 = +[CDPAccount sharedInstance];
  id v6 = [v5 primaryAccountAltDSID];
  [v3 setAltDSID:v6];

  return v3;
}

- (void)startAccountActionWithContext:(id)a3
{
  id v4 = a3;
  id v5 = (AKAppleIDAuthenticationController *)objc_alloc_init((Class)AKAppleIDAuthenticationController);
  AKAppleIDAuthController = self->_AKAppleIDAuthController;
  self->_AKAppleIDAuthController = v5;

  id v7 = self->_AKAppleIDAuthController;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000FEF9C;
  v8[3] = &unk_100247210;
  v8[4] = self;
  [(AKAppleIDAuthenticationController *)v7 authenticateWithContext:v4 completion:v8];
}

- (void)reauthFamilyCircleByExistingAuthenticationResultsWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self->_authenticationResults;
  id v6 = [(NSDictionary *)v5 objectForKeyedSubscript:AKAuthenticationRawPasswordKey];
  if (v6)
  {
    id v7 = pbb_accountsignin_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v48 = "-[COSAppleIDAuthController reauthFamilyCircleByExistingAuthenticationResultsWithCompletion:]";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%s received results", buf, 0xCu);
    }

    id v8 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:&off_10025C528];
    v41 = [(NSDictionary *)v5 objectForKeyedSubscript:AKAuthenticationUsernameKey];
    uint64_t v9 = AKAuthenticationDSIDKey;
    uint64_t v10 = [(NSDictionary *)v5 objectForKeyedSubscript:AKAuthenticationDSIDKey];

    if (v10)
    {
      id v11 = [(NSDictionary *)v5 objectForKeyedSubscript:v9];
      [v8 setObject:v11 forKeyedSubscript:@"memberId"];
    }
    else
    {
      id v11 = pbb_accountsignin_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100174F38();
      }
    }

    uint64_t v13 = AKAuthenticationAlternateDSIDKey;
    id v14 = [(NSDictionary *)v5 objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];

    if (v14)
    {
      uint64_t v15 = [(NSDictionary *)v5 objectForKeyedSubscript:v13];
      [v8 setObject:v15 forKeyedSubscript:@"altDSID"];
    }
    else
    {
      uint64_t v15 = pbb_accountsignin_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_100174F04();
      }
    }

    uint64_t v16 = [(NSDictionary *)v5 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey];
    id v17 = [v16 objectForKeyedSubscript:@"com.apple.gs.icloud.family.auth"];

    if (v17)
    {
      int v18 = [v16 objectForKeyedSubscript:@"com.apple.gs.icloud.family.auth"];
      [v8 setObject:v18 forKeyedSubscript:@"com.apple.gs.icloud.family.auth"];
    }
    else
    {
      int v18 = pbb_accountsignin_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        sub_100174ED0();
      }
    }

    id v19 = objc_alloc((Class)FACircleContext);
    id v20 = [v19 initWithEventType:FACircleEventTypeFamilyRepair];
    [v20 setAdditionalParameters:v8];
    id v21 = (AKAppleIDAuthenticationContext *)objc_alloc_init((Class)AKAppleIDAuthenticationContext);
    authContext = self->_authContext;
    self->_authContext = v21;

    [(AKAppleIDAuthenticationContext *)self->_authContext setProxiedDevice:self->_proxiedDevice];
    [(AKAppleIDAuthenticationContext *)self->_authContext setNeedsNewAppleID:1];
    uint64_t v23 = [v8 objectForKeyedSubscript:v13];
    [(AKAppleIDAuthenticationContext *)self->_authContext setAltDSID:v23];

    [(AKAppleIDAuthenticationContext *)self->_authContext setUsername:v41];
    id v24 = [v8 objectForKeyedSubscript:v9];
    [(AKAppleIDAuthenticationContext *)self->_authContext setDSID:v24];

    if (self->_authContext)
    {
      [v20 setAuthContext:];
    }
    else
    {
      __int16 v25 = pbb_accountsignin_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_100174E58(v25, v26, v27, v28, v29, v30, v31, v32);
      }
    }
    v33 = pbb_accountsignin_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Performing FamilyCircle Reauth Check", buf, 2u);
    }

    id v34 = objc_alloc((Class)FACircleStateController);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);
    v36 = (FACircleStateController *)[v34 initWithPresenter:WeakRetained];
    circleStateController = self->_circleStateController;
    self->_circleStateController = v36;

    v38 = self->_circleStateController;
    v39 = objc_opt_new();
    [(FACircleStateController *)v38 setCustomRUIStyle:v39];

    objc_initWeak((id *)buf, self);
    v40 = self->_circleStateController;
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1000FF630;
    v42[3] = &unk_100247238;
    objc_copyWeak(&v46, (id *)buf);
    v43 = v5;
    id v12 = v41;
    id v44 = v12;
    id v45 = v4;
    [(FACircleStateController *)v40 performWithContext:v20 completion:v42];

    objc_destroyWeak(&v46);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v12 = 0;
  }
}

- (id)tinkerFamilyMemberFromAuthenticationResultsForInternalUseByUpdatingtinkerSignInID
{
  id v3 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationUsernameKey];
  id v4 = [UIApp setupController];
  [v4 setTinkerSignInId:v3];

  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  [v5 setObject:v3 forKeyedSubscript:@"member-apple-id"];
  id v6 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationDSIDKey];
  [v5 setObject:v6 forKeyedSubscript:@"member-dsid"];

  id v7 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  [v5 setObject:v7 forKeyedSubscript:@"member-altDSID"];

  id v8 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationFirstNameKey];
  [v5 setObject:v8 forKeyedSubscript:@"member-first-name"];

  uint64_t v9 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationLastNameKey];
  [v5 setObject:v9 forKeyedSubscript:@"member-last-name"];

  uint64_t v10 = [(NSDictionary *)self->_authenticationResults objectForKeyedSubscript:AKAuthenticationIsUnderageKey];
  [v5 setObject:v10 forKeyedSubscript:@"member-is-child-account"];

  id v11 = [objc_alloc((Class)FAFamilyMember) initWithDictionaryRepresentation:v5];
  id v12 = pbb_accountsignin_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v5;
    __int16 v16 = 2112;
    id v17 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "tinkerMemberInfo: %@ tinkerFamilyMember: %@", (uint8_t *)&v14, 0x16u);
  }

  return v11;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  id v5 = (NSDictionary *)a4;
  id v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "TinkerSignin signInController:didCompleteWithSuccess", v9, 2u);
  }

  authenticationResults = self->_authenticationResults;
  self->_authenticationResults = v5;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained appleIDAuthController:self didSignInWithSuccess:1 error:0];
}

- (id)authenticationContext
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  id v6 = pbb_accountsignin_log();
  BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      id v8 = objc_loadWeakRetained((id *)p_delegate);
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delegate responds to authenticationContext: %@", (uint8_t *)&v13, 0xCu);
    }
    id v9 = objc_loadWeakRetained((id *)p_delegate);
    uint64_t v10 = [v9 authenticationContext];
  }
  else
  {
    if (v7)
    {
      id v11 = objc_loadWeakRetained((id *)p_delegate);
      int v13 = 138412290;
      id v14 = v11;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Delegate does not respond to authenticationContext: %@", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v10 = [(COSAppleIDAuthController *)self baseAppContext];
  }

  return v10;
}

- (void)contextDidPresentLoginAlertController:(id)a3
{
  id v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[COSAppleIDAuthController contextDidPresentLoginAlertController:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationInAppContextDelegate - %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)contextWillDismissLoginAlertController:(id)a3
{
  id v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[COSAppleIDAuthController contextWillDismissLoginAlertController:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationInAppContextDelegate - %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)contextDidDismissLoginAlertController:(id)a3
{
  id v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[COSAppleIDAuthController contextDidDismissLoginAlertController:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationInAppContextDelegate - %s", (uint8_t *)&v4, 0xCu);
  }
}

- (void)contextWillBeginPresentingSecondaryUI:(id)a3
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 secondaryUIWillShow];
  }
  BOOL v7 = pbb_accountsignin_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    id v9 = "-[COSAppleIDAuthController contextWillBeginPresentingSecondaryUI:]";
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationInAppContextDelegate - %s", (uint8_t *)&v8, 0xCu);
  }
}

- (void)contextDidEndPresentingSecondaryUI:(id)a3
{
  id v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    char v5 = "-[COSAppleIDAuthController contextDidEndPresentingSecondaryUI:]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "AKAppleIDAuthenticationInAppContextDelegate - %s", (uint8_t *)&v4, 0xCu);
  }
}

- (id)remoteUIStyle
{
  v2 = objc_opt_new();

  return v2;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v3 = [a3 navigationBar];
  BPSApplyStyleToNavBar();
}

- (void)genericTermsRemoteUI:(id)a3 didFinishWithSuccess:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[COSAppleIDAuthController genericTermsRemoteUI:didFinishWithSuccess:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s success: %d", (uint8_t *)&v9, 0x12u);
  }

  if (v4)
  {
    [(COSAppleIDAuthController *)self _resumeSatelliteSignin];
  }
  else
  {
    id satelliteSignInCompletion = (void (**)(id, uint64_t, void, void *))self->_satelliteSignInCompletion;
    int v8 = +[NSError errorWithDomain:@"com.aple.COSSatelliteSignInErrorDomain" code:1 userInfo:0];
    satelliteSignInCompletion[2](satelliteSignInCompletion, -1, 0, v8);
  }
}

- (void)genericTermsRemoteUI:(id)a3 acceptedTermsInfo:(id)a4
{
  id v5 = a4;
  id v6 = pbb_accountsignin_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[COSAppleIDAuthController genericTermsRemoteUI:acceptedTermsInfo:]";
    __int16 v11 = 2114;
    id v12 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s terms info: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  BOOL v7 = (NSDictionary *)[v5 copy];
  acceptedTermsInfo = self->_acceptedTermsInfo;
  self->_acceptedTermsInfo = v7;
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_double timeout = a3;
}

- (BOOL)needsCredentialRecovery
{
  return self->_needsCredentialRecovery;
}

- (void)setNeedsCredentialRecovery:(BOOL)a3
{
  self->_needsCredentialRecovery = a3;
}

- (UIViewController)presentingController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingController:(id)a3
{
}

- (AKDevice)proxiedDevice
{
  return self->_proxiedDevice;
}

- (void)setProxiedDevice:(id)a3
{
}

- (NSString)signInAccountType
{
  return self->_signInAccountType;
}

- (void)setSignInAccountType:(id)a3
{
}

- (BOOL)waitingForWatchSignInAfterInteractiveAuth
{
  return self->_waitingForWatchSignInAfterInteractiveAuth;
}

- (void)setWaitingForWatchSignInAfterInteractiveAuth:(BOOL)a3
{
  self->_waitingForWatchSignInAfterInteractiveAuth = a3;
}

- (int64_t)watchSignInResult
{
  return self->_watchSignInResult;
}

- (void)setWatchSignInResult:(int64_t)a3
{
  self->_watchSignInResult = a3;
}

- (NSError)watchSignInErrorResult
{
  return self->_watchSignInErrorResult;
}

- (void)setWatchSignInErrorResult:(id)a3
{
}

- (COSAppleIDAuthControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSAppleIDAuthControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_source)timerSource
{
  return self->_timerSource;
}

- (void)setTimerSource:(id)a3
{
}

- (BOOL)didComplete
{
  return self->_didComplete;
}

- (void)setDidComplete:(BOOL)a3
{
  self->_didComplete = a3;
}

- (ACAccount)idmsAccount
{
  return self->_idmsAccount;
}

- (void)setIdmsAccount:(id)a3
{
}

- (NRDevice)watchDevice
{
  return self->_watchDevice;
}

- (void)setWatchDevice:(id)a3
{
}

- (AKAnisetteData)phoneAnisetteData
{
  return self->_phoneAnisetteData;
}

- (void)setPhoneAnisetteData:(id)a3
{
}

- (BOOL)hasStartedFallbackFlow
{
  return self->_hasStartedFallbackFlow;
}

- (void)setHasStartedFallbackFlow:(BOOL)a3
{
  self->_hasStartedFallbackFlow = a3;
}

- (AKAppleIDAuthenticationController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (NSDictionary)authenticationResults
{
  return self->_authenticationResults;
}

- (void)setAuthenticationResults:(id)a3
{
}

- (AKAppleIDAuthenticationController)AKAppleIDAuthController
{
  return self->_AKAppleIDAuthController;
}

- (void)setAKAppleIDAuthController:(id)a3
{
}

- (AKAppleIDAuthenticationContext)authContext
{
  return self->_authContext;
}

- (void)setAuthContext:(id)a3
{
}

- (AKAppleIDAuthenticationWatchBuddyContext)watchBuddyAuthContext
{
  return self->_watchBuddyAuthContext;
}

- (void)setWatchBuddyAuthContext:(id)a3
{
}

- (AAUIProxiedTermsRemoteUI)proxiedTermsRemoteUI
{
  return self->_proxiedTermsRemoteUI;
}

- (void)setProxiedTermsRemoteUI:(id)a3
{
}

- (NSDictionary)acceptedTermsInfo
{
  return self->_acceptedTermsInfo;
}

- (void)setAcceptedTermsInfo:(id)a3
{
}

- (id)satelliteSignInCompletion
{
  return self->_satelliteSignInCompletion;
}

- (void)setSatelliteSignInCompletion:(id)a3
{
}

- (int64_t)satelliteSignInStatus
{
  return self->_satelliteSignInStatus;
}

- (void)setSatelliteSignInStatus:(int64_t)a3
{
  self->_satelliteSignInStatus = a3;
}

- (NSString)satelliteSignInErrorDescription
{
  return self->_satelliteSignInErrorDescription;
}

- (void)setSatelliteSignInErrorDescription:(id)a3
{
}

- (NSError)satelliteSignInDetailedError
{
  return self->_satelliteSignInDetailedError;
}

- (void)setSatelliteSignInDetailedError:(id)a3
{
}

- (COSPrimaryAccountAuthenticationHelper)primaryAccountAuthenticationHelper
{
  return self->_primaryAccountAuthenticationHelper;
}

- (void)setPrimaryAccountAuthenticationHelper:(id)a3
{
}

- (FACircleStateController)circleStateController
{
  return self->_circleStateController;
}

- (void)setCircleStateController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_circleStateController, 0);
  objc_storeStrong((id *)&self->_primaryAccountAuthenticationHelper, 0);
  objc_storeStrong((id *)&self->_satelliteSignInDetailedError, 0);
  objc_storeStrong((id *)&self->_satelliteSignInErrorDescription, 0);
  objc_storeStrong(&self->_satelliteSignInCompletion, 0);
  objc_storeStrong((id *)&self->_acceptedTermsInfo, 0);
  objc_storeStrong((id *)&self->_proxiedTermsRemoteUI, 0);
  objc_storeStrong((id *)&self->_watchBuddyAuthContext, 0);
  objc_storeStrong((id *)&self->_authContext, 0);
  objc_storeStrong((id *)&self->_AKAppleIDAuthController, 0);
  objc_storeStrong((id *)&self->_authenticationResults, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_phoneAnisetteData, 0);
  objc_storeStrong((id *)&self->_watchDevice, 0);
  objc_storeStrong((id *)&self->_idmsAccount, 0);
  objc_storeStrong((id *)&self->_timerSource, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_watchSignInErrorResult, 0);
  objc_storeStrong((id *)&self->_signInAccountType, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
  objc_destroyWeak((id *)&self->_presentingController);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_accountStore, 0);
}

@end