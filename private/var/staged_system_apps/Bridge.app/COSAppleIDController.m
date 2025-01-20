@interface COSAppleIDController
- (ACAccount)faceTimeAccount;
- (ACAccount)faceTimeIDMSAccount;
- (ACAccount)iCloudAccount;
- (ACAccount)iCloudIDMSAccount;
- (ACAccount)iMessageAccount;
- (ACAccount)iMessageIDMSAccount;
- (ACAccount)iTunesIDMSAccount;
- (ACAccount)iTunesStoreAccount;
- (ACAccountStore)accountStore;
- (AKDevice)watchAKDevice;
- (BOOL)_federatedAuthRequiredForAccount:(id)a3;
- (BOOL)displayFaceTimePasswordTextField;
- (BOOL)displayiCloudPasswordTextField;
- (BOOL)displayiMessagePasswordTextField;
- (BOOL)displayiTunesStorePasswordTextField;
- (BOOL)facetimeInteractiveAuthRequired;
- (BOOL)hasFetchedAccountsInfo;
- (BOOL)iCloudInteractiveAuthRequired;
- (BOOL)iMessageInteractiveAuthRequired;
- (BOOL)iTunesInteractiveAuthRequired;
- (BOOL)recoveringCredentialsForFaceTime;
- (BOOL)recoveringCredentialsForiCloud;
- (BOOL)recoveringCredentialsForiMessage;
- (BOOL)recoveringCredentialsForiTunesStore;
- (BOOL)sameAccountForAllAccountTypes;
- (BOOL)sameiCloudAndFaceTimeAppleID;
- (BOOL)sameiCloudAndiMessageAppleID;
- (BOOL)sameiCloudAndiTunesStoreAppleID;
- (BOOL)sameiMessageAndFaceTimeAppleID;
- (BOOL)signingIn;
- (BOOL)signingInToFaceTime;
- (BOOL)signingInToiCloud;
- (BOOL)signingInToiMessage;
- (BOOL)signingInToiTunesStore;
- (BOOL)textFieldShouldReturn:(id)a3;
- (BOOL)watchIsSignedInToFaceTime;
- (BOOL)watchIsSignedInToiCloud;
- (BOOL)watchIsSignedInToiMessage;
- (BOOL)watchIsSignedInToiTunesStore;
- (BOOL)watchSupportsFaceTime;
- (BOOL)watchSupportsiTunesStore;
- (COSAppleIDAuthController)authController;
- (COSAppleIDController)init;
- (NRDevice)pairedWatch;
- (NSObject)faceTimePasswordTextFieldTextDidChangeObserver;
- (NSObject)iCloudPasswordTextFieldTextDidChangeObserver;
- (NSObject)iMessagePasswordTextFieldTextDidChangeObserver;
- (NSObject)iTunesStorePasswordTextFieldTextDidChangeObserver;
- (NSSManager)nssManager;
- (UITextField)faceTimePasswordTextField;
- (UITextField)iCloudPasswordTextField;
- (UITextField)iMessagePasswordTextField;
- (UITextField)iTunesStorePasswordTextField;
- (id)getFaceTimeUsernameForSpecifier:(id)a3;
- (id)getiCloudUsernameForSpecifier:(id)a3;
- (id)getiMessageUsernameForSpecifier:(id)a3;
- (id)getiTunesStoreUsernameForSpecifier:(id)a3;
- (id)newPasswordTextFieldSpecifierWithID:(id)a3;
- (id)specifiers;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (void)_removeAppleIDFollowUp;
- (void)_removeStoreFollowUp;
- (void)_textFieldValueDidChange:(id)a3;
- (void)addForgotPasswordFooterToSpecifier:(id)a3 withActionSelector:(SEL)a4;
- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5;
- (void)dealloc;
- (void)enableSignInButtons:(BOOL)a3;
- (void)handleAccountsInfoReply:(id)a3 error:(id)a4;
- (void)loggedInSuccessfullyToAccount:(id)a3;
- (void)openiCloudPaneInSettingsApp;
- (void)queryWatchForAccountsInfo;
- (void)removeForgotPasswordFooterFromSpecifier:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAuthController:(id)a3;
- (void)setDisplayFaceTimePasswordTextField:(BOOL)a3;
- (void)setDisplayiCloudPasswordTextField:(BOOL)a3;
- (void)setDisplayiMessagePasswordTextField:(BOOL)a3;
- (void)setDisplayiTunesStorePasswordTextField:(BOOL)a3;
- (void)setFaceTimeAccount:(id)a3;
- (void)setFaceTimeIDMSAccount:(id)a3;
- (void)setFaceTimePasswordTextField:(id)a3;
- (void)setFaceTimePasswordTextFieldTextDidChangeObserver:(id)a3;
- (void)setFacetimeInteractiveAuthRequired:(BOOL)a3;
- (void)setHasFetchedAccountsInfo:(BOOL)a3;
- (void)setICloudAccount:(id)a3;
- (void)setICloudIDMSAccount:(id)a3;
- (void)setICloudInteractiveAuthRequired:(BOOL)a3;
- (void)setICloudPasswordTextField:(id)a3;
- (void)setICloudPasswordTextFieldTextDidChangeObserver:(id)a3;
- (void)setIMessageAccount:(id)a3;
- (void)setIMessageIDMSAccount:(id)a3;
- (void)setIMessageInteractiveAuthRequired:(BOOL)a3;
- (void)setIMessagePasswordTextField:(id)a3;
- (void)setIMessagePasswordTextFieldTextDidChangeObserver:(id)a3;
- (void)setITunesIDMSAccount:(id)a3;
- (void)setITunesInteractiveAuthRequired:(BOOL)a3;
- (void)setITunesStoreAccount:(id)a3;
- (void)setITunesStorePasswordTextField:(id)a3;
- (void)setITunesStorePasswordTextFieldTextDidChangeObserver:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setPairedWatch:(id)a3;
- (void)setRecoveringCredentialsForFaceTime:(BOOL)a3;
- (void)setRecoveringCredentialsForiCloud:(BOOL)a3;
- (void)setRecoveringCredentialsForiMessage:(BOOL)a3;
- (void)setRecoveringCredentialsForiTunesStore:(BOOL)a3;
- (void)setSameAccountForAllAccountTypes:(BOOL)a3;
- (void)setSameiCloudAndFaceTimeAppleID:(BOOL)a3;
- (void)setSameiCloudAndiMessageAppleID:(BOOL)a3;
- (void)setSameiCloudAndiTunesStoreAppleID:(BOOL)a3;
- (void)setSameiMessageAndFaceTimeAppleID:(BOOL)a3;
- (void)setSigningInToFaceTime:(BOOL)a3;
- (void)setSigningInToiCloud:(BOOL)a3;
- (void)setSigningInToiMessage:(BOOL)a3;
- (void)setSigningInToiTunesStore:(BOOL)a3;
- (void)setWatchAKDevice:(id)a3;
- (void)setWatchIsSignedInToFaceTime:(BOOL)a3;
- (void)setWatchIsSignedInToiCloud:(BOOL)a3;
- (void)setWatchIsSignedInToiMessage:(BOOL)a3;
- (void)setWatchIsSignedInToiTunesStore:(BOOL)a3;
- (void)setWatchSupportsFaceTime:(BOOL)a3;
- (void)setWatchSupportsiTunesStore:(BOOL)a3;
- (void)startNetworkRequest;
- (void)stopNetworkRequest;
- (void)tappedForgotButton;
- (void)tappedForgotFaceTimeButton;
- (void)tappedForgotiCloudButton;
- (void)tappedForgotiMessageButton;
- (void)tappedForgotiTunesStoreButton;
- (void)tappedSignInToFaceTime;
- (void)tappedSignInToiCloud;
- (void)tappedSignInToiMessage;
- (void)tappedSignInToiTunesStore;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation COSAppleIDController

- (COSAppleIDController)init
{
  v74.receiver = self;
  v74.super_class = (Class)COSAppleIDController;
  v2 = [(COSAppleIDController *)&v74 init];
  v3 = v2;
  if (v2)
  {
    v2->_hasFetchedAccountsInfo = 0;
    uint64_t v4 = [UIApp activeWatch];
    pairedWatch = v3->_pairedWatch;
    v3->_pairedWatch = (NRDevice *)v4;

    if (!v3->_pairedWatch)
    {
      uint64_t v6 = -[COSTinkerHealthSharingSetupDelegate tinkerDevice]_0();
      v7 = v3->_pairedWatch;
      v3->_pairedWatch = (NRDevice *)v6;

      v8 = pbb_accountsignin_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v9 = v3->_pairedWatch != 0;
        *(_DWORD *)buf = 136315394;
        v76 = "-[COSAppleIDController init]";
        __int16 v77 = 1024;
        LODWORD(v78) = v9;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s active watch: %{BOOL}d", buf, 0x12u);
      }
    }
    v10 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
    accountStore = v3->_accountStore;
    v3->_accountStore = v10;

    uint64_t v12 = +[COSiCloudAuthController iCloudAccountInAccountStore];
    iCloudAccount = v3->_iCloudAccount;
    v3->_iCloudAccount = (ACAccount *)v12;

    uint64_t v14 = +[COSAppleIDAuthController lookupIDMSAccountWithAccountStore:v3->_accountStore matchingAccount:v3->_iCloudAccount];
    iCloudIDMSAccount = v3->_iCloudIDMSAccount;
    v3->_iCloudIDMSAccount = (ACAccount *)v14;

    uint64_t v16 = +[COSiMessageFaceTimeAuthController iMessageAccountInAccountStore];
    iMessageAccount = v3->_iMessageAccount;
    v3->_iMessageAccount = (ACAccount *)v16;

    uint64_t v18 = +[COSAppleIDAuthController lookupIDMSAccountWithAccountStore:v3->_accountStore matchingAccount:v3->_iMessageAccount];
    iMessageIDMSAccount = v3->_iMessageIDMSAccount;
    v3->_iMessageIDMSAccount = (ACAccount *)v18;

    if (v3->_iCloudAccount && v3->_iMessageAccount) {
      unsigned __int8 v20 = +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:");
    }
    else {
      unsigned __int8 v20 = 0;
    }
    v3->_sameiCloudAndiMessageAppleID = v20;
    v21 = v3->_pairedWatch;
    id v22 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DEBFF23F-9327-44FB-A219-0428BEBD5BA7"];
    v3->_watchSupportsFaceTime = [(NRDevice *)v21 supportsCapability:v22];

    if (v3->_watchSupportsFaceTime)
    {
      uint64_t v23 = +[COSiMessageFaceTimeAuthController faceTimeAccountInAccountStore];
      faceTimeAccount = v3->_faceTimeAccount;
      v3->_faceTimeAccount = (ACAccount *)v23;

      uint64_t v25 = +[COSAppleIDAuthController lookupIDMSAccountWithAccountStore:v3->_accountStore matchingAccount:v3->_faceTimeAccount];
      faceTimeIDMSAccount = v3->_faceTimeIDMSAccount;
      v3->_faceTimeIDMSAccount = (ACAccount *)v25;
    }
    if (v3->_iCloudAccount)
    {
      p_cache = &OBJC_METACLASS___COSResetController.cache;
      if (v3->_faceTimeAccount) {
        unsigned __int8 v28 = +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:");
      }
      else {
        unsigned __int8 v28 = 0;
      }
    }
    else
    {
      unsigned __int8 v28 = 0;
      p_cache = (void **)(&OBJC_METACLASS___COSResetController + 16);
    }
    v3->_sameiCloudAndFaceTimeAppleID = v28;
    if (v3->_iMessageAccount && v3->_faceTimeAccount) {
      unsigned __int8 v29 = +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:");
    }
    else {
      unsigned __int8 v29 = 0;
    }
    v3->_BOOL sameiMessageAndFaceTimeAppleID = v29;
    v30 = v3->_pairedWatch;
    id v31 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1F1097A5-5A0B-4795-9FBE-B206DB49FA1D"];
    uint64_t v32 = 190;
    v3->_watchSupportsiTunesStore = [(NRDevice *)v30 supportsCapability:v31];

    if (v3->_watchSupportsiTunesStore)
    {
      uint64_t v33 = +[COSiTunesStoreAuthController iTunesStoreAccountInAccountStore];
      iTunesStoreAccount = v3->_iTunesStoreAccount;
      v3->_iTunesStoreAccount = (ACAccount *)v33;

      uint64_t v35 = [p_cache + 83 lookupIDMSAccountWithAccountStore:v3->_accountStore matchingAccount:v3->_iTunesIDMSAccount];
      iTunesIDMSAccount = v3->_iTunesIDMSAccount;
      v3->_iTunesIDMSAccount = (ACAccount *)v35;
    }
    if (v3->_iTunesStoreAccount && v3->_iCloudAccount) {
      unsigned __int8 v37 = +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:");
    }
    else {
      unsigned __int8 v37 = 0;
    }
    v3->_BOOL sameiCloudAndiTunesStoreAppleID = v37;
    v38 = v3->_iCloudAccount;
    if (v38)
    {
      unsigned __int8 v39 = [p_cache + 83 shouldAttemptPasswordLessSignInForAccount:v38 inAccountStore:v3->_accountStore];
      v3->_iCloudInteractiveAuthRequired = v39 ^ 1;
      if (v39) {
        LOBYTE(v40) = 0;
      }
      else {
        unsigned int v40 = ![(COSAppleIDController *)v3 _federatedAuthRequiredForAccount:v3->_iCloudIDMSAccount];
      }
    }
    else
    {
      LOBYTE(v40) = 0;
      v3->_iCloudInteractiveAuthRequired = 0;
    }
    v3->_displayiCloudPasswordTextField = v40;
    v41 = v3->_iMessageAccount;
    if (v41)
    {
      unsigned __int8 v42 = [p_cache + 83 shouldAttemptPasswordLessSignInForAccount:v41 inAccountStore:v3->_accountStore];
      v3->_iMessageInteractiveAuthRequired = v42 ^ 1;
      if (v42) {
        BOOL v43 = 0;
      }
      else {
        BOOL v43 = ![(COSAppleIDController *)v3 _federatedAuthRequiredForAccount:v3->_iMessageIDMSAccount];
      }
    }
    else
    {
      BOOL v43 = 0;
      v3->_iMessageInteractiveAuthRequired = 0;
    }
    v3->_displayiMessagePasswordTextField = v43;
    v44 = v3->_faceTimeAccount;
    if (v44)
    {
      unsigned __int8 v45 = [p_cache + 83 shouldAttemptPasswordLessSignInForAccount:v44 inAccountStore:v3->_accountStore];
      v3->_facetimeInteractiveAuthRequired = v45 ^ 1;
      if (v45) {
        LOBYTE(v46) = 0;
      }
      else {
        unsigned int v46 = ![(COSAppleIDController *)v3 _federatedAuthRequiredForAccount:v3->_faceTimeIDMSAccount];
      }
    }
    else
    {
      LOBYTE(v46) = 0;
      v3->_facetimeInteractiveAuthRequired = 0;
    }
    v3->_displayFaceTimePasswordTextField = v46;
    v47 = v3->_iTunesStoreAccount;
    if (v47)
    {
      unsigned __int8 v48 = [p_cache + 83 shouldAttemptPasswordLessSignInForAccount:v47 inAccountStore:v3->_accountStore];
      v3->_iTunesInteractiveAuthRequired = v48 ^ 1;
      if (v48) {
        BOOL v49 = 0;
      }
      else {
        BOOL v49 = ![(COSAppleIDController *)v3 _federatedAuthRequiredForAccount:v3->_iTunesIDMSAccount];
      }
    }
    else
    {
      BOOL v49 = 0;
      v3->_iTunesInteractiveAuthRequired = 0;
    }
    v3->_displayiTunesStorePasswordTextField = v49;
    v50 = pbb_accountsignin_log();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "COSAppleIDController: Phone Info!!!!---------------------", buf, 2u);
    }

    v51 = pbb_accountsignin_log();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
    {
      if (v3->_accountStore) {
        v52 = "YES";
      }
      else {
        v52 = "NO";
      }
      v53 = [(ACAccount *)v3->_iCloudAccount aa_displayName];
      v54 = [(ACAccount *)v3->_iMessageAccount aa_displayName];
      v55 = [(ACAccount *)v3->_faceTimeAccount aa_displayName];
      uint64_t v56 = [(ACAccount *)v3->_iTunesStoreAccount aa_displayName];
      v57 = (void *)v56;
      BOOL sameiMessageAndFaceTimeAppleID = v3->_sameiMessageAndFaceTimeAppleID;
      if (v3->_sameiCloudAndiMessageAppleID) {
        v59 = "YES";
      }
      else {
        v59 = "NO";
      }
      *(_DWORD *)buf = 136316674;
      if (sameiMessageAndFaceTimeAppleID) {
        v60 = "YES";
      }
      else {
        v60 = "NO";
      }
      v76 = v52;
      uint64_t v32 = v73;
      __int16 v77 = 2112;
      v78 = v53;
      __int16 v79 = 2112;
      v80 = v54;
      __int16 v81 = 2112;
      v82 = v55;
      __int16 v83 = 2112;
      uint64_t v84 = v56;
      __int16 v85 = 2080;
      v86 = v59;
      __int16 v87 = 2080;
      v88 = v60;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "COSAppleIDController: accountStore=%s iCloudAccount=%@ iMessageAccount=%@ faceTimeAccount=%@ iTunesStoreAccount=%@ sameiCloudAndiMessageAppleID=%s sameiMessageAndFaceTimeAppleID=%s", buf, 0x48u);
    }
    v61 = pbb_accountsignin_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_DEFAULT))
    {
      if (v3->_watchSupportsFaceTime) {
        v62 = "YES";
      }
      else {
        v62 = "NO";
      }
      BOOL sameiCloudAndiTunesStoreAppleID = v3->_sameiCloudAndiTunesStoreAppleID;
      if (v3->BPSListController_opaque[v32]) {
        v64 = "YES";
      }
      else {
        v64 = "NO";
      }
      *(_DWORD *)buf = 136315650;
      if (sameiCloudAndiTunesStoreAppleID) {
        v65 = "YES";
      }
      else {
        v65 = "NO";
      }
      v76 = v62;
      __int16 v77 = 2080;
      v78 = v64;
      __int16 v79 = 2080;
      v80 = v65;
      _os_log_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEFAULT, "COSAppleIDController: watchSupportsFaceTime=%s watchSupportsiTunesStore=%s sameiCloudAndiTunesStoreAppleID=%s", buf, 0x20u);
    }

    v66 = pbb_accountsignin_log();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      if (v3->_iCloudPasswordTextField) {
        v67 = "YES";
      }
      else {
        v67 = "NO";
      }
      if (v3->_iMessagePasswordTextField) {
        v68 = "YES";
      }
      else {
        v68 = "NO";
      }
      if (v3->_faceTimePasswordTextField) {
        v69 = "YES";
      }
      else {
        v69 = "NO";
      }
      if (v3->_iTunesStorePasswordTextField) {
        v70 = "YES";
      }
      else {
        v70 = "NO";
      }
      *(_DWORD *)buf = 136315906;
      v76 = v67;
      __int16 v77 = 2080;
      v78 = v68;
      __int16 v79 = 2080;
      v80 = v69;
      __int16 v81 = 2080;
      v82 = v70;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "COSAppleIDController: display- iCloudPasswordTextField=%s iMessagePasswordTextField=%s FaceTimePasswordTextField=%s iTunesStorePasswordTextField=%s", buf, 0x2Au);
    }

    v71 = pbb_accountsignin_log();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v71, OS_LOG_TYPE_DEFAULT, "COSAppleIDController: Phone Info!!!!---------------------", buf, 2u);
    }

    [(COSAppleIDController *)v3 queryWatchForAccountsInfo];
  }
  return v3;
}

- (BOOL)_federatedAuthRequiredForAccount:(id)a3
{
  v3 = [a3 accountPropertyForKey:AKAuthMode];
  BOOL v4 = [v3 unsignedIntegerValue] == (id)2;

  return v4;
}

- (void)dealloc
{
  [(COSAppleIDAuthController *)self->_authController setDelegate:0];
  if (self->_iCloudPasswordTextFieldTextDidChangeObserver)
  {
    v3 = +[NSNotificationCenter defaultCenter];
    [v3 removeObserver:self->_iCloudPasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:self->_iCloudPasswordTextField];

    iCloudPasswordTextFieldTextDidChangeObserver = self->_iCloudPasswordTextFieldTextDidChangeObserver;
    self->_iCloudPasswordTextFieldTextDidChangeObserver = 0;
  }
  if (self->_iMessagePasswordTextFieldTextDidChangeObserver)
  {
    v5 = +[NSNotificationCenter defaultCenter];
    [v5 removeObserver:self->_iMessagePasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:self->_iMessagePasswordTextField];

    iMessagePasswordTextFieldTextDidChangeObserver = self->_iMessagePasswordTextFieldTextDidChangeObserver;
    self->_iMessagePasswordTextFieldTextDidChangeObserver = 0;
  }
  if (self->_faceTimePasswordTextFieldTextDidChangeObserver)
  {
    v7 = +[NSNotificationCenter defaultCenter];
    [v7 removeObserver:self->_faceTimePasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:self->_faceTimePasswordTextField];

    faceTimePasswordTextFieldTextDidChangeObserver = self->_faceTimePasswordTextFieldTextDidChangeObserver;
    self->_faceTimePasswordTextFieldTextDidChangeObserver = 0;
  }
  if (self->_iTunesStorePasswordTextFieldTextDidChangeObserver)
  {
    BOOL v9 = +[NSNotificationCenter defaultCenter];
    [v9 removeObserver:self->_iTunesStorePasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:self->_iTunesStorePasswordTextField];

    iTunesStorePasswordTextFieldTextDidChangeObserver = self->_iTunesStorePasswordTextFieldTextDidChangeObserver;
    self->_iTunesStorePasswordTextFieldTextDidChangeObserver = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)COSAppleIDController;
  [(COSAppleIDController *)&v11 dealloc];
}

- (id)specifiers
{
  v3 = (id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  id v4 = *v3;
  if (!*v3)
  {
    id v5 = objc_alloc_init((Class)NSMutableArray);
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_10003A3A4;
    v82[3] = &unk_100244350;
    v82[4] = self;
    uint64_t v6 = objc_retainBlock(v82);
    objc_initWeak(&location, self);
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    v78[2] = sub_10003A538;
    v78[3] = &unk_100244378;
    objc_copyWeak(&v80, &location);
    v7 = v6;
    id v79 = v7;
    v8 = objc_retainBlock(v78);
    BOOL v9 = +[PSSpecifier groupSpecifierWithID:@"iCloudHeader"];
    __int16 v77 = v8;
    uint64_t v10 = BPSStockholmSupportedInGizmoRegion();
    ((void (*)(void *, void *, uint64_t))v7[2])(v7, v9, v10);
    [v5 addObject:v9];
    if (!self->_hasFetchedAccountsInfo)
    {
      v21 = +[PSSpecifier emptyGroupSpecifier];

      [v5 addObject:v21];
      id v22 = +[PSSpecifier preferenceSpecifierNamed:0 target:0 set:0 get:0 detail:0 cell:15 edit:0];

      [v5 addObject:v22];
      goto LABEL_82;
    }
    if (!self->_iCloudAccount)
    {
      uint64_t v23 = +[PSSpecifier emptyGroupSpecifier];

      [v5 addObject:v23];
      v24 = +[NSBundle mainBundle];
      uint64_t v25 = [v24 localizedStringForKey:@"SIGN_IN_COMPANION" value:&stru_100249230 table:@"AppleID"];
      id v22 = +[PSSpecifier preferenceSpecifierNamed:v25 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [v22 setButtonAction:"openiCloudPaneInSettingsApp"];
      [v5 addObject:v22];
      goto LABEL_33;
    }
    objc_super v11 = +[PSSpecifier groupSpecifierWithID:@"iCloudGroup"];

    [v5 addObject:v11];
    uint64_t v12 = PSTextFieldSpecifier;
    v13 = +[NSBundle mainBundle];
    uint64_t v14 = [v13 localizedStringForKey:@"APPLE_ID" value:&stru_100249230 table:@"AppleID"];
    v15 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v14 target:self set:0 get:"getiCloudUsernameForSpecifier:" detail:0 cell:8 edit:0];

    [v15 setProperty:@"iCloudLogin" forKey:PSIDKey];
    uint64_t v16 = PSEnabledKey;
    [v15 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
    [v5 addObject:v15];
    if (!self->_watchIsSignedInToiCloud) {
      goto LABEL_27;
    }
    iMessageAccount = self->_iMessageAccount;
    if (iMessageAccount)
    {
      if (self->_sameiCloudAndiMessageAppleID && !self->_watchIsSignedInToiMessage) {
        goto LABEL_27;
      }
    }
    faceTimeAccount = self->_faceTimeAccount;
    if (!faceTimeAccount || !self->_sameiCloudAndFaceTimeAppleID || self->_watchIsSignedInToFaceTime)
    {
      int v19 = 0;
LABEL_12:
      if (self->_iTunesStoreAccount && self->_sameiCloudAndiTunesStoreAppleID)
      {
        BOOL watchIsSignedInToiTunesStore = self->_watchIsSignedInToiTunesStore;
        if (v19)
        {
        }
        if (!watchIsSignedInToiTunesStore) {
          goto LABEL_27;
        }
      }
      else if (v19)
      {
      }
      id v22 = v11;
LABEL_32:

LABEL_33:
      if (self->_hasFetchedAccountsInfo)
      {
        id v31 = self->_iMessageAccount;
        if (v31)
        {
          if (!self->_sameiCloudAndiMessageAppleID)
          {
            if (self->_watchSupportsFaceTime
              && self->_faceTimeAccount
              && self->_sameiMessageAndFaceTimeAppleID
              && self->_watchIsSignedInToiMessage
              && self->_watchIsSignedInToFaceTime)
            {
              uint64_t v33 = +[NSBundle mainBundle];
              uint64_t v34 = [v33 localizedStringForKey:@"MESSAGES_AND_FACETIME" value:&stru_100249230 table:@"AppleID"];
            }
            else
            {
              uint64_t v33 = +[NSBundle mainBundle];
              uint64_t v34 = [v33 localizedStringForKey:@"MESSAGES" value:&stru_100249230 table:@"AppleID"];
            }
            uint64_t v35 = (void *)v34;

            v36 = +[PSSpecifier groupSpecifierWithID:@"iMessageGroup" name:v35];

            [v5 addObject:v36];
            v75 = v35;
            unsigned __int8 v37 = +[NSBundle mainBundle];
            v38 = [v37 localizedStringForKey:@"APPLE_ID" value:&stru_100249230 table:@"AppleID"];
            unsigned __int8 v39 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v38 target:self set:0 get:"getiMessageUsernameForSpecifier:" detail:0 cell:8 edit:0];

            [v39 setProperty:@"iMessageLogin" forKey:PSIDKey];
            uint64_t v40 = PSEnabledKey;
            [v39 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
            [v5 addObject:v39];
            if (self->_watchIsSignedInToiMessage)
            {
              id v22 = v36;
            }
            else
            {
              if (self->_displayiMessagePasswordTextField)
              {
                id v41 = [(COSAppleIDController *)self newPasswordTextFieldSpecifierWithID:@"iMessagePassword"];

                [v5 addObject:v41];
                unsigned __int8 v39 = v41;
              }
              if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_iMessageIDMSAccount])
              {
                unsigned __int8 v42 = [v5 specifierForID:@"iMessageGroup"];
                [(COSAppleIDController *)self addForgotPasswordFooterToSpecifier:v42 withActionSelector:"tappedForgotiMessageButton"];
              }
              BOOL v43 = +[NSBundle mainBundle];
              v44 = [v43 localizedStringForKey:@"SIGN_IN" value:&stru_100249230 table:@"AppleID"];
              id v22 = +[PSSpecifier preferenceSpecifierNamed:v44 target:self set:0 get:0 detail:0 cell:13 edit:0];

              [v22 setIdentifier:@"iMessageSignIn"];
              [v22 setButtonAction:"tappedSignInToiMessage"];
              unsigned __int8 v45 = +[NSNumber numberWithInt:[(COSAppleIDController *)self signingIn] ^ 1];
              [v22 setProperty:v45 forKey:v40];

              [v5 addObject:v22];
            }

            BOOL hasFetchedAccountsInfo = self->_hasFetchedAccountsInfo;
            LODWORD(v31) = 1;
LABEL_53:
            if (self->_watchSupportsFaceTime)
            {
              if (!hasFetchedAccountsInfo)
              {
                if ((v31 & 1) == 0) {
                  goto LABEL_82;
                }
                goto LABEL_81;
              }
              if (!self->_faceTimeAccount
                || self->_sameiCloudAndFaceTimeAppleID
                || self->_sameiMessageAndFaceTimeAppleID)
              {
LABEL_69:
                if (self->_iTunesStoreAccount && !self->_sameiCloudAndiTunesStoreAppleID)
                {
                  v58 = +[NSBundle mainBundle];
                  uint64_t v59 = [v58 localizedStringForKey:@"ITUNES_STORE" value:&stru_100249230 table:@"AppleID"];

                  v60 = +[PSSpecifier groupSpecifierWithID:@"iTunesStoreGroup" name:v59];

                  [v5 addObject:v60];
                  v76 = (void *)v59;
                  v61 = +[NSBundle mainBundle];
                  v62 = [v61 localizedStringForKey:@"APPLE_ID" value:&stru_100249230 table:@"AppleID"];
                  v63 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v62 target:self set:0 get:"getiTunesStoreUsernameForSpecifier:" detail:0 cell:8 edit:0];

                  [v63 setProperty:@"iTunesStoreLoginCell" forKey:PSIDKey];
                  uint64_t v64 = PSEnabledKey;
                  [v63 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
                  [v5 addObject:v63];
                  if (self->_watchIsSignedInToiTunesStore)
                  {
                    id v22 = v60;
                  }
                  else
                  {
                    if (self->_displayiTunesStorePasswordTextField)
                    {
                      id v65 = [(COSAppleIDController *)self newPasswordTextFieldSpecifierWithID:@"iTunesStorePasswordCell"];

                      [v5 addObject:v65];
                      v63 = v65;
                    }
                    if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_iTunesIDMSAccount])
                    {
                      v66 = [v5 specifierForID:@"iTunesStoreGroup"];
                      [(COSAppleIDController *)self addForgotPasswordFooterToSpecifier:v66 withActionSelector:"tappedForgotiTunesStoreButton"];
                    }
                    v67 = +[NSBundle mainBundle];
                    v68 = [v67 localizedStringForKey:@"SIGN_IN" value:&stru_100249230 table:@"AppleID"];
                    id v22 = +[PSSpecifier preferenceSpecifierNamed:v68 target:self set:0 get:0 detail:0 cell:13 edit:0];

                    [v22 setIdentifier:@"iTunesStoreSignInCell"];
                    [v22 setButtonAction:"tappedSignInToiTunesStore"];
                    v69 = +[NSNumber numberWithInt:[(COSAppleIDController *)self signingIn] ^ 1];
                    [v22 setProperty:v69 forKey:v64];

                    [v5 addObject:v22];
                  }

LABEL_81:
                  v70 = [v5 specifierForID:@"iCloudGroup"];
                  [v70 setName:@"ICLOUD"];

                  goto LABEL_82;
                }
LABEL_71:
                if (!v31) {
                  goto LABEL_82;
                }
                goto LABEL_81;
              }
              unsigned int v46 = +[NSBundle mainBundle];
              v47 = [v46 localizedStringForKey:@"FACETIME" value:&stru_100249230 table:@"AppleID"];
              unsigned __int8 v48 = +[PSSpecifier groupSpecifierWithID:@"iFaceTimeGroup" name:v47];

              [v5 addObject:v48];
              BOOL v49 = +[NSBundle mainBundle];
              v50 = [v49 localizedStringForKey:@"APPLE_ID" value:&stru_100249230 table:@"AppleID"];
              v51 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v50 target:self set:0 get:"getFaceTimeUsernameForSpecifier:" detail:0 cell:8 edit:0];

              [v51 setProperty:@"iFaceTimeLogin" forKey:PSIDKey];
              uint64_t v52 = PSEnabledKey;
              [v51 setProperty:&__kCFBooleanFalse forKey:PSEnabledKey];
              [v5 addObject:v51];
              if (self->_watchIsSignedInToFaceTime)
              {
                id v22 = v48;
              }
              else
              {
                if (self->_displayFaceTimePasswordTextField)
                {
                  id v53 = [(COSAppleIDController *)self newPasswordTextFieldSpecifierWithID:@"iFaceTimePassword"];

                  [v5 addObject:v53];
                  v51 = v53;
                }
                if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_faceTimeIDMSAccount])
                {
                  v54 = [v5 specifierForID:@"iFaceTimeGroup"];
                  [(COSAppleIDController *)self addForgotPasswordFooterToSpecifier:v54 withActionSelector:"tappedForgotFaceTimeButton"];
                }
                v55 = +[NSBundle mainBundle];
                uint64_t v56 = [v55 localizedStringForKey:@"SIGN_IN" value:&stru_100249230 table:@"AppleID"];
                id v22 = +[PSSpecifier preferenceSpecifierNamed:v56 target:self set:0 get:0 detail:0 cell:13 edit:0];

                [v22 setIdentifier:@"iFaceTimeSignIn"];
                [v22 setButtonAction:"tappedSignInToFaceTime"];
                v57 = +[NSNumber numberWithInt:[(COSAppleIDController *)self signingIn] ^ 1];
                [v22 setProperty:v57 forKey:v52];

                [v5 addObject:v22];
              }

              BOOL hasFetchedAccountsInfo = self->_hasFetchedAccountsInfo;
              LODWORD(v31) = 1;
            }
            if (!hasFetchedAccountsInfo) {
              goto LABEL_71;
            }
            goto LABEL_69;
          }
          LODWORD(v31) = 0;
        }
        BOOL hasFetchedAccountsInfo = 1;
        goto LABEL_53;
      }
LABEL_82:
      objc_storeStrong(v3, v5);
      v71 = [(COSAppleIDController *)self navigationItem];
      v72 = +[NSBundle mainBundle];
      uint64_t v73 = [v72 localizedStringForKey:@"TITLE" value:&stru_100249230 table:@"AppleID"];
      [v71 setTitle:v73];

      objc_destroyWeak(&v80);
      objc_destroyWeak(&location);

      id v4 = *v3;
      goto LABEL_83;
    }
    if (iMessageAccount)
    {
      uint64_t v14 = [(ACAccount *)faceTimeAccount identifier];
      uint64_t v12 = [(ACAccount *)self->_iMessageAccount identifier];
      if ([v14 isEqualToString:v12])
      {
        int v19 = 1;
        goto LABEL_12;
      }
    }
LABEL_27:
    if (self->_displayiCloudPasswordTextField)
    {
      id v26 = [(COSAppleIDController *)self newPasswordTextFieldSpecifierWithID:@"iCloudPassword"];

      [v5 addObject:v26];
      v15 = v26;
    }
    if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_iCloudIDMSAccount])
    {
      v27 = [v5 specifierForID:@"iCloudGroup"];
      [(COSAppleIDController *)self addForgotPasswordFooterToSpecifier:v27 withActionSelector:"tappedForgotiCloudButton"];
    }
    unsigned __int8 v28 = +[NSBundle mainBundle];
    unsigned __int8 v29 = [v28 localizedStringForKey:@"SIGN_IN" value:&stru_100249230 table:@"AppleID"];
    id v22 = +[PSSpecifier preferenceSpecifierNamed:v29 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v22 setIdentifier:@"iCloudSignIn"];
    [v22 setButtonAction:"tappedSignInToiCloud"];
    v30 = +[NSNumber numberWithInt:[(COSAppleIDController *)self signingIn] ^ 1];
    [v22 setProperty:v30 forKey:v16];

    [v5 addObject:v22];
    goto LABEL_32;
  }
LABEL_83:

  return v4;
}

- (void)addForgotPasswordFooterToSpecifier:(id)a3 withActionSelector:(SEL)a4
{
  id v6 = a3;
  v7 = +[NSBundle mainBundle];
  id v14 = [v7 localizedStringForKey:@"FORGOT" value:&stru_100249230 table:@"AppleID"];

  v8 = (objc_class *)objc_opt_class();
  BOOL v9 = NSStringFromClass(v8);
  [v6 setProperty:v9 forKey:PSFooterCellClassGroupKey];

  [v6 setProperty:v14 forKey:PSFooterHyperlinkViewTitleKey];
  v16.length = (NSUInteger)[v14 length];
  v16.id location = 0;
  uint64_t v10 = NSStringFromRange(v16);
  [v6 setProperty:v10 forKey:PSFooterHyperlinkViewLinkRangeKey];

  objc_super v11 = +[NSValue valueWithNonretainedObject:self];
  [v6 setProperty:v11 forKey:PSFooterHyperlinkViewTargetKey];

  uint64_t v12 = NSStringFromSelector(a4);
  [v6 setProperty:v12 forKey:PSFooterHyperlinkViewActionKey];

  v13 = +[NSNumber numberWithInt:1];
  [v6 setProperty:v13 forKey:PSFooterAlignmentGroupKey];
}

- (void)removeForgotPasswordFooterFromSpecifier:(id)a3
{
  uint64_t v3 = PSFooterCellClassGroupKey;
  id v4 = a3;
  [v4 removePropertyForKey:v3];
  [v4 removePropertyForKey:PSFooterHyperlinkViewTitleKey];
  [v4 removePropertyForKey:PSFooterHyperlinkViewLinkRangeKey];
  [v4 removePropertyForKey:PSFooterHyperlinkViewTargetKey];
  [v4 removePropertyForKey:PSFooterHyperlinkViewActionKey];
  [v4 removePropertyForKey:PSFooterAlignmentGroupKey];
}

- (id)newPasswordTextFieldSpecifierWithID:(id)a3
{
  id v4 = a3;
  id v5 = +[NSBundle mainBundle];
  id v6 = [v5 localizedStringForKey:@"PASSWORD" value:&stru_100249230 table:@"AppleID"];
  v7 = +[PSTextFieldSpecifier preferenceSpecifierNamed:v6 target:self set:"setPassword:withSpecifier:" get:0 detail:0 cell:8 edit:0];

  [v7 setProperty:v4 forKey:PSIDKey];
  [v7 setKeyboardType:1 autoCaps:0 autoCorrection:1];
  [v7 setCellType:12];
  v8 = +[NSBundle mainBundle];
  BOOL v9 = [v8 localizedStringForKey:@"REQUIRED" value:&stru_100249230 table:@"AppleID"];
  [v7 setPlaceholder:v9];

  return v7;
}

- (BOOL)signingIn
{
  return self->_signingInToiCloud || self->_signingInToiMessage;
}

- (void)queryWatchForAccountsInfo
{
  uint64_t v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "queryWatchForAccountsInfo...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if (self->_iCloudAccount || self->_iMessageAccount || self->_faceTimeAccount || self->_iTunesStoreAccount)
  {
    self->_watchIsSignedInToiCloud = 0;
    self->_watchIsSignedInToiMessage = 0;
    self->_watchIsSignedInToFaceTime = 0;
    self->_BOOL hasFetchedAccountsInfo = 0;
    if (!self->_nssManager)
    {
      id v4 = (NSSManager *)objc_opt_new();
      nssManager = self->_nssManager;
      self->_nssManager = v4;
    }
    id v6 = +[NSThread currentThread];
    v7 = +[NSThread mainThread];

    if (v6 == v7)
    {
      v8 = self->_nssManager;
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10003ABC4;
      v10[3] = &unk_100243F08;
      objc_copyWeak(&v11, buf);
      [(NSSManager *)v8 getAccountsInfo:v10];
      objc_destroyWeak(&v11);
    }
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained(buf);
    [WeakRetained handleAccountsInfoReply:0 error:0];
  }
  objc_destroyWeak(buf);
}

- (void)handleAccountsInfoReply:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = v6;
  self->_BOOL hasFetchedAccountsInfo = 1;
  if (a4)
  {
    uint64_t v52 = _NSConcreteStackBlock;
    uint64_t v53 = 3221225472;
    v54 = sub_10003B5FC;
    v55 = &unk_1002438A0;
    uint64_t v56 = self;
    BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
    goto LABEL_55;
  }
  v8 = [v6 objectForKeyedSubscript:kNSSAccountsKey];
  unsigned __int8 v37 = v7;
  BOOL v9 = [v7 objectForKeyedSubscript:kNSSAKDeviceKey];
  watchAKDevice = self->_watchAKDevice;
  self->_watchAKDevice = v9;

  [self->_watchAKDevice setLinkType:2];
  id v11 = pbb_accountsignin_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = self->_watchAKDevice;
    *(_DWORD *)buf = 138412290;
    v58 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "handleAccountsInfoReply: Got AKDevice from watch=%@", buf, 0xCu);
  }

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v8;
  id v13 = [obj countByEnumeratingWithState:&v48 objects:v65 count:16];
  if (v13)
  {
    id v14 = v13;
    uint64_t v47 = *(void *)v49;
    uint64_t v46 = kNSSAccountTypeKey;
    uint64_t v45 = kNSSAccountUsernameKey;
    uint64_t v44 = kNSSAccountDSIDKey;
    uint64_t v43 = kNSSAccountAltDSIDKey;
    uint64_t v39 = ACAccountTypeIdentifierAppleAccount;
    uint64_t v42 = ACAccountTypeIdentifierIdentityServices;
    uint64_t v38 = ACAccountTypeIdentifieriTunesStore;
    do
    {
      v15 = 0;
      id v40 = v14;
      do
      {
        if (*(void *)v49 != v47) {
          objc_enumerationMutation(obj);
        }
        NSRange v16 = *(void **)(*((void *)&v48 + 1) + 8 * (void)v15);
        v17 = [v16 objectForKeyedSubscript:v46];
        uint64_t v18 = [v16 objectForKeyedSubscript:v45];
        int v19 = [v16 objectForKeyedSubscript:v44];
        unsigned __int8 v20 = [v16 objectForKeyedSubscript:v43];
        if (self->_iCloudAccount
          && !self->_watchIsSignedInToiCloud
          && [v17 isEqualToString:v39])
        {
          v21 = +[COSiCloudAuthController usernameForiCloudAccount:self->_iCloudAccount];
          id v22 = +[COSiCloudAuthController DSIDForiCloudAccount:self->_iCloudAccount];
          uint64_t v23 = +[COSiCloudAuthController altDSIDForiCloudAccount:self->_iCloudAccount];
          self->_watchIsSignedInToiCloud = +[COSAppleIDUtilities checkIfSameAppleIDForUsername1:v18 username2:v21 DSID1:v19 DSID2:v22 altDSID1:v20 altDSID2:v23];
          v24 = pbb_accountsignin_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v21;
            uint64_t v25 = v24;
            id v26 = "handleAccountsInfoReply: watch localiCloudUsername=%@";
            goto LABEL_34;
          }
          goto LABEL_35;
        }
        if ([v17 isEqualToString:v42])
        {
          if (self->_iMessageAccount && !self->_watchIsSignedInToiMessage)
          {
            v27 = +[COSiMessageFaceTimeAuthController usernameForIDSAccount:](COSiMessageFaceTimeAuthController, "usernameForIDSAccount:");
            unsigned __int8 v28 = +[COSiMessageFaceTimeAuthController DSIDForIDSAccount:self->_iMessageAccount];
            unsigned __int8 v29 = +[COSiMessageFaceTimeAuthController altDSIDForIDSAccount:self->_iMessageAccount];
            self->_watchIsSignedInToiMessage = +[COSAppleIDUtilities checkIfSameAppleIDForUsername1:v18 username2:v27 DSID1:v19 DSID2:v28 altDSID1:v20 altDSID2:v29];
            v30 = pbb_accountsignin_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v27;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "handleAccountsInfoReply: watch localiMessageUsername=%@", buf, 0xCu);
            }

            id v14 = v40;
          }
          if (self->_watchSupportsFaceTime && self->_faceTimeAccount && !self->_watchIsSignedInToFaceTime)
          {
            v21 = +[COSiMessageFaceTimeAuthController usernameForIDSAccount:](COSiMessageFaceTimeAuthController, "usernameForIDSAccount:");
            id v22 = +[COSiMessageFaceTimeAuthController DSIDForIDSAccount:self->_faceTimeAccount];
            uint64_t v23 = +[COSiMessageFaceTimeAuthController altDSIDForIDSAccount:self->_faceTimeAccount];
            self->_watchIsSignedInToFaceTime = +[COSAppleIDUtilities checkIfSameAppleIDForUsername1:v18 username2:v21 DSID1:v19 DSID2:v22 altDSID1:v20 altDSID2:v23];
            v24 = pbb_accountsignin_log();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v58 = v21;
              uint64_t v25 = v24;
              id v26 = "handleAccountsInfoReply: watch localFaceTimeUsername=%@";
              goto LABEL_34;
            }
            goto LABEL_35;
          }
        }
        else if (self->_watchSupportsiTunesStore {
               && self->_iTunesStoreAccount
        }
               && !self->_watchIsSignedInToiTunesStore
               && [v17 isEqualToString:v38])
        {
          v21 = +[COSiTunesStoreAuthController usernameForiTunesStoreAccount:self->_iTunesStoreAccount];
          id v22 = +[COSiTunesStoreAuthController DSIDForiTunesStoreAccount:self->_iTunesStoreAccount];
          uint64_t v23 = +[COSiTunesStoreAuthController altDSIDForiTunesStoreAccount:self->_iTunesStoreAccount];
          BOOL v31 = +[COSAppleIDUtilities checkIfSameAppleIDForUsername1:v18 username2:v21 DSID1:v19 DSID2:v22 altDSID1:v20 altDSID2:v23];
          self->_BOOL watchIsSignedInToiTunesStore = v31;
          if (v31) {
            [(COSAppleIDController *)self _removeStoreFollowUp];
          }
          v24 = pbb_accountsignin_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v58 = v21;
            uint64_t v25 = v24;
            id v26 = "handleAccountsInfoReply: watch iTunesStoreUsername=%@";
LABEL_34:
            _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, v26, buf, 0xCu);
          }
LABEL_35:

          id v14 = v40;
        }

        v15 = (char *)v15 + 1;
      }
      while (v14 != v15);
      id v14 = [obj countByEnumeratingWithState:&v48 objects:v65 count:16];
    }
    while (v14);
  }

  uint64_t v32 = pbb_accountsignin_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v33 = "YES";
    if (self->_watchIsSignedInToiCloud) {
      uint64_t v34 = "YES";
    }
    else {
      uint64_t v34 = "NO";
    }
    if (self->_watchIsSignedInToiMessage) {
      uint64_t v35 = "YES";
    }
    else {
      uint64_t v35 = "NO";
    }
    if (self->_watchIsSignedInToFaceTime) {
      v36 = "YES";
    }
    else {
      v36 = "NO";
    }
    if (!self->_watchIsSignedInToiTunesStore) {
      uint64_t v33 = "NO";
    }
    *(_DWORD *)buf = 136315906;
    v58 = (void *)v34;
    __int16 v59 = 2080;
    v60 = v35;
    __int16 v61 = 2080;
    v62 = v36;
    __int16 v63 = 2080;
    uint64_t v64 = v33;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "handleAccountsInfoReply: watchANDPhoneAreSignedInTo- iCloud=%s iMessage=%s FaceTime=%s iTunesStore=%s", buf, 0x2Au);
  }

  v7 = v37;
  if (self->_watchIsSignedInToiCloud && self->_watchSupportsiTunesStore)
  {
    [(COSAppleIDController *)self _removeAppleIDFollowUp];
    [(COSAppleIDController *)self _removeStoreFollowUp];
  }
  [(COSAppleIDController *)self reloadSpecifiers];

LABEL_55:
}

- (id)getiCloudUsernameForSpecifier:(id)a3
{
  return +[COSiCloudAuthController usernameForiCloudAccount:self->_iCloudAccount];
}

- (id)getiMessageUsernameForSpecifier:(id)a3
{
  return +[COSiMessageFaceTimeAuthController usernameForIDSAccount:self->_iMessageAccount];
}

- (id)getFaceTimeUsernameForSpecifier:(id)a3
{
  return +[COSiMessageFaceTimeAuthController usernameForIDSAccount:self->_faceTimeAccount];
}

- (id)getiTunesStoreUsernameForSpecifier:(id)a3
{
  return +[COSiTunesStoreAuthController usernameForiTunesStoreAccount:self->_iTunesStoreAccount];
}

- (void)openiCloudPaneInSettingsApp
{
  +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT"];
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  BPSOpenSensitiveURLAsync();
}

- (void)enableSignInButtons:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = pbb_accountsignin_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Enable / disable sign in button: %d", buf, 8u);
  }

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003B86C;
  v7[3] = &unk_1002443A0;
  v7[4] = self;
  BOOL v8 = v3;
  id v6 = objc_retainBlock(v7);
  ((void (*)(void *, const __CFString *))v6[2])(v6, @"iCloudSignIn");
  ((void (*)(void *, const __CFString *))v6[2])(v6, @"iMessageSignIn");
  ((void (*)(void *, const __CFString *))v6[2])(v6, @"iFaceTimeSignIn");
  ((void (*)(void *, const __CFString *))v6[2])(v6, @"iTunesStoreSignInCell");
}

- (void)tappedSignInToiCloud
{
  if (!+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    self->_signingInToiCloud = 1;
    [(COSAppleIDController *)self enableSignInButtons:0];
    [(COSAppleIDController *)self startNetworkRequest];
    if (self->_displayiCloudPasswordTextField)
    {
      BOOL v3 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
      [v3 resignFirstResponder];
    }
    id v4 = self->_iCloudAccount;
    if (self->_watchIsSignedInToiCloud
      && self->_sameiCloudAndiTunesStoreAppleID
      && !self->_watchIsSignedInToiTunesStore)
    {
      id v6 = pbb_accountsignin_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User asked to sign in to iTunesStore.", buf, 2u);
      }

      p_super = &v4->super;
      id v4 = self->_iTunesStoreAccount;
    }
    else
    {
      p_super = pbb_accountsignin_log();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v10 = 0;
        _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_DEFAULT, "User asked to sign in to iCloud.", v10, 2u);
      }
    }

    v7 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:v4 timeout:self->_pairedWatch device:0.0];
    authController = self->_authController;
    self->_authController = v7;

    [(COSAppleIDAuthController *)self->_authController setDelegate:self];
    [(COSAppleIDAuthController *)self->_authController setProxiedDevice:self->_watchAKDevice];
    if (self->_iCloudInteractiveAuthRequired)
    {
      if (self->_displayiCloudPasswordTextField)
      {
        BOOL v9 = [(UITextField *)self->_iCloudPasswordTextField text];
      }
      else
      {
        BOOL v9 = 0;
      }
      [(COSAppleIDAuthController *)self->_authController startSigningInWithPassword:v9];
    }
    else
    {
      [(COSAppleIDAuthController *)self->_authController startSigningInWithoutPassword];
    }
  }
}

- (void)tappedSignInToiMessage
{
  if (!+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    BOOL v3 = pbb_accountsignin_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to sign in to iMessage.", v8, 2u);
    }

    self->_signingInToiMessage = 1;
    [(COSAppleIDController *)self enableSignInButtons:0];
    [(COSAppleIDController *)self startNetworkRequest];
    if (self->_displayiMessagePasswordTextField)
    {
      id v4 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
      [v4 resignFirstResponder];
    }
    id v5 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_iMessageAccount timeout:self->_pairedWatch device:0.0];
    authController = self->_authController;
    self->_authController = v5;

    [(COSAppleIDAuthController *)self->_authController setDelegate:self];
    [(COSAppleIDAuthController *)self->_authController setProxiedDevice:self->_watchAKDevice];
    if (self->_iMessageInteractiveAuthRequired)
    {
      if (self->_displayiMessagePasswordTextField)
      {
        v7 = [(UITextField *)self->_iMessagePasswordTextField text];
      }
      else
      {
        v7 = 0;
      }
      [(COSAppleIDAuthController *)self->_authController startSigningInWithPassword:v7];
    }
    else
    {
      [(COSAppleIDAuthController *)self->_authController startSigningInWithoutPassword];
    }
  }
}

- (void)tappedSignInToFaceTime
{
  if (!+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    BOOL v3 = pbb_accountsignin_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to sign in to FaceTime.", v8, 2u);
    }

    self->_signingInToFaceTime = 1;
    [(COSAppleIDController *)self enableSignInButtons:0];
    [(COSAppleIDController *)self startNetworkRequest];
    if (self->_displayFaceTimePasswordTextField)
    {
      id v4 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
      [v4 resignFirstResponder];
    }
    id v5 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_faceTimeAccount timeout:self->_pairedWatch device:0.0];
    authController = self->_authController;
    self->_authController = v5;

    [(COSAppleIDAuthController *)self->_authController setDelegate:self];
    [(COSAppleIDAuthController *)self->_authController setProxiedDevice:self->_watchAKDevice];
    if (self->_facetimeInteractiveAuthRequired)
    {
      if (self->_displayFaceTimePasswordTextField)
      {
        v7 = [(UITextField *)self->_faceTimePasswordTextField text];
      }
      else
      {
        v7 = 0;
      }
      [(COSAppleIDAuthController *)self->_authController startSigningInWithPassword:v7];
    }
    else
    {
      [(COSAppleIDAuthController *)self->_authController startSigningInWithoutPassword];
    }
  }
}

- (void)tappedSignInToiTunesStore
{
  if (!+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    BOOL v3 = pbb_accountsignin_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to sign in to iTunesStore.", v8, 2u);
    }

    self->_signingInToiTunesStore = 1;
    [(COSAppleIDController *)self enableSignInButtons:0];
    [(COSAppleIDController *)self startNetworkRequest];
    if (self->_displayiTunesStorePasswordTextField)
    {
      id v4 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
      [v4 resignFirstResponder];
    }
    id v5 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_iTunesStoreAccount timeout:self->_pairedWatch device:0.0];
    authController = self->_authController;
    self->_authController = v5;

    [(COSAppleIDAuthController *)self->_authController setDelegate:self];
    [(COSAppleIDAuthController *)self->_authController setProxiedDevice:self->_watchAKDevice];
    if (self->_iTunesInteractiveAuthRequired)
    {
      if (self->_displayiTunesStorePasswordTextField)
      {
        v7 = [(UITextField *)self->_iTunesStorePasswordTextField text];
      }
      else
      {
        v7 = 0;
      }
      [(COSAppleIDAuthController *)self->_authController startSigningInWithPassword:v7];
    }
    else
    {
      [(COSAppleIDAuthController *)self->_authController startSigningInWithoutPassword];
    }
  }
}

- (void)_removeStoreFollowUp
{
}

- (void)_removeAppleIDFollowUp
{
}

- (void)loggedInSuccessfullyToAccount:(id)a3
{
  id v4 = (ACAccount *)a3;
  [(COSAppleIDController *)self _removeAppleIDFollowUp];
  if ([(ACAccount *)v4 isEqual:ACAccountTypeIdentifierAppleAccount])
  {
    id v5 = [(COSAppleIDController *)self parentController];

    if (v5) {
      +[PBBridgeCAReporter recordSigninEventPostPair:0];
    }
    else {
      +[PBBridgeCAReporter recordSigninEventFollowup:0];
    }
  }
  if (!self->_signingInToiCloud && !self->_recoveringCredentialsForiCloud)
  {
    if (self->_signingInToiMessage || self->_recoveringCredentialsForiMessage)
    {
      self->_watchIsSignedInToiMessage = 1;
      self->_iMessageInteractiveAuthRequired = 0;
      [(COSAppleIDController *)self removeSpecifierID:@"iMessageSignIn" animated:1];
      [(COSAppleIDController *)self removeSpecifierID:@"iMessagePassword" animated:1];
      BOOL v10 = [(COSAppleIDController *)self specifiers];
      id v11 = v10;
      CFStringRef v12 = @"iMessageGroup";
    }
    else if (self->_signingInToFaceTime || self->_recoveringCredentialsForFaceTime)
    {
      self->_watchIsSignedInToFaceTime = 1;
      self->_facetimeInteractiveAuthRequired = 0;
      [(COSAppleIDController *)self removeSpecifierID:@"iFaceTimeSignIn" animated:1];
      [(COSAppleIDController *)self removeSpecifierID:@"iFaceTimePassword" animated:1];
      BOOL v10 = [(COSAppleIDController *)self specifiers];
      id v11 = v10;
      CFStringRef v12 = @"iFaceTimeGroup";
    }
    else
    {
      if (!self->_signingInToiTunesStore && !self->_recoveringCredentialsForiTunesStore) {
        goto LABEL_15;
      }
      self->_BOOL watchIsSignedInToiTunesStore = 1;
      self->_iTunesInteractiveAuthRequired = 0;
      [(COSAppleIDController *)self _removeStoreFollowUp];
      [(COSAppleIDController *)self removeSpecifierID:@"iTunesStoreSignInCell" animated:1];
      [(COSAppleIDController *)self removeSpecifierID:@"iTunesStorePasswordCell" animated:1];
      BOOL v10 = [(COSAppleIDController *)self specifiers];
      id v11 = v10;
      CFStringRef v12 = @"iTunesStoreGroup";
    }
    id v13 = [v10 specifierForID:v12];
    [(COSAppleIDController *)self removeForgotPasswordFooterFromSpecifier:v13];

    goto LABEL_15;
  }
  self->_watchIsSignedInToiCloud = 1;
  self->_iCloudInteractiveAuthRequired = 0;
  [(COSAppleIDController *)self removeSpecifierID:@"iCloudSignIn" animated:1];
  [(COSAppleIDController *)self removeSpecifierID:@"iCloudPassword" animated:1];
  id v6 = [(COSAppleIDController *)self specifiers];
  v7 = [v6 specifierForID:@"iCloudGroup"];
  [(COSAppleIDController *)self removeForgotPasswordFooterFromSpecifier:v7];

  if (self->_iCloudAccount == v4 && self->_sameiCloudAndiTunesStoreAppleID && !self->_watchIsSignedInToiTunesStore)
  {
    iTunesStoreAccount = self->_iTunesStoreAccount;
    accountStore = self->_accountStore;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10003C530;
    v14[3] = &unk_100243878;
    v14[4] = self;
    +[COSiTunesStoreAuthController saveToPairedDeviceiTunesStoreAccount:iTunesStoreAccount fromAccountStore:accountStore completion:v14];
  }
LABEL_15:
}

- (void)startNetworkRequest
{
  BOOL v3 = [(COSAppleIDController *)self view];
  [v3 setUserInteractionEnabled:0];

  id v8 = [objc_alloc((Class)UIActivityIndicatorView) initWithFrame:0.0, 0.0, 20.0, 20.0];
  id v4 = [objc_alloc((Class)UIBarButtonItem) initWithCustomView:v8];
  id v5 = [(COSAppleIDController *)self navigationController];
  id v6 = [v5 navigationBar];

  v7 = [v6 topItem];
  [v7 setRightBarButtonItem:v4];
  [v8 startAnimating];
}

- (void)stopNetworkRequest
{
  BOOL v3 = [(COSAppleIDController *)self navigationController];
  id v6 = [v3 navigationBar];

  id v4 = [v6 topItem];
  [v4 setRightBarButtonItem:0];
  id v5 = [(COSAppleIDController *)self view];
  [v5 setUserInteractionEnabled:1];
}

- (void)tappedForgotiCloudButton
{
  BOOL v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to recover iCloud credential (iForgot).", v4, 2u);
  }

  self->_recoveringCredentialsForiCloud = 1;
  [(COSAppleIDController *)self tappedForgotButton];
}

- (void)tappedForgotiMessageButton
{
  BOOL v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to recover iMessage credential (iForgot).", v4, 2u);
  }

  self->_recoveringCredentialsForiMessage = 1;
  [(COSAppleIDController *)self tappedForgotButton];
}

- (void)tappedForgotFaceTimeButton
{
  BOOL v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to recover FaceTime credential (iForgot).", v4, 2u);
  }

  self->_recoveringCredentialsForFaceTime = 1;
  [(COSAppleIDController *)self tappedForgotButton];
}

- (void)tappedForgotiTunesStoreButton
{
  BOOL v3 = pbb_accountsignin_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "User asked to recover iTunesStore credential (iForgot).", v4, 2u);
  }

  self->_recoveringCredentialsForiTunesStore = 1;
  [(COSAppleIDController *)self tappedForgotButton];
}

- (void)tappedForgotButton
{
  if (+[COSAppleIDLoginViewController showAlertIfLackingConnectivityAndPresentAlertWithPresentingViewController:self])
  {
    self->_recoveringCredentialsForiCloud = 0;
    self->_recoveringCredentialsForiMessage = 0;
    self->_recoveringCredentialsForFaceTime = 0;
    self->_recoveringCredentialsForiTunesStore = 0;
    return;
  }
  [(COSAppleIDController *)self enableSignInButtons:0];
  [(COSAppleIDController *)self startNetworkRequest];
  if (self->_displayiCloudPasswordTextField
    || self->_displayiMessagePasswordTextField
    || self->_displayFaceTimePasswordTextField
    || self->_displayiTunesStorePasswordTextField)
  {
    BOOL v3 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
    [v3 resignFirstResponder];
  }
  if (self->_recoveringCredentialsForiCloud)
  {
    id v4 = &OBJC_IVAR___COSAppleIDController__iCloudAccount;
  }
  else if (self->_recoveringCredentialsForiMessage)
  {
    id v4 = &OBJC_IVAR___COSAppleIDController__iMessageAccount;
  }
  else if (self->_recoveringCredentialsForFaceTime)
  {
    id v4 = &OBJC_IVAR___COSAppleIDController__faceTimeAccount;
  }
  else
  {
    if (!self->_recoveringCredentialsForiTunesStore)
    {
      id v7 = 0;
      goto LABEL_17;
    }
    id v4 = &OBJC_IVAR___COSAppleIDController__iTunesStoreAccount;
  }
  id v7 = *(id *)&self->BPSListController_opaque[*v4];
LABEL_17:
  id v5 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:v7 timeout:self->_pairedWatch device:0.0];
  authController = self->_authController;
  self->_authController = v5;

  [(COSAppleIDAuthController *)self->_authController setDelegate:self];
  [(COSAppleIDAuthController *)self->_authController startRecoveringCredentials];
}

- (void)_textFieldValueDidChange:(id)a3
{
  id v4 = [a3 object];
  id v11 = v4;
  if (v4 == self->_iCloudPasswordTextField)
  {
    CFStringRef v5 = @"iCloudSignIn";
  }
  else if (v4 == self->_iMessagePasswordTextField)
  {
    CFStringRef v5 = @"iMessageSignIn";
  }
  else if (v4 == self->_faceTimePasswordTextField)
  {
    CFStringRef v5 = @"iFaceTimeSignIn";
  }
  else if (v4 == self->_iTunesStorePasswordTextField)
  {
    CFStringRef v5 = @"iTunesStoreSignInCell";
  }
  else
  {
    CFStringRef v5 = 0;
  }
  id v6 = [(COSAppleIDController *)self specifierForID:v5];
  id v7 = [(UITextField *)v11 text];
  id v8 = v7;
  if (v7) {
    uint64_t v9 = [v7 isEqualToString:&stru_100249230] ^ 1;
  }
  else {
    uint64_t v9 = 0;
  }
  BOOL v10 = +[NSNumber numberWithBool:v9];
  [v6 setProperty:v10 forKey:PSEnabledKey];

  [(COSAppleIDController *)self reloadSpecifier:v6];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  CFStringRef v5 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__table] firstResponder];
  [v5 resignFirstResponder];

  v6.receiver = self;
  v6.super_class = (Class)COSAppleIDController;
  [(COSAppleIDController *)&v6 viewWillDisappear:v3];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v56.receiver = self;
  v56.super_class = (Class)COSAppleIDController;
  id v8 = [(COSAppleIDController *)&v56 tableView:v6 cellForRowAtIndexPath:v7];
  uint64_t v9 = [v8 specifier];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v8;
    id v11 = [v9 identifier];
    if (([v11 isEqualToString:@"iCloudLogin"] & 1) == 0)
    {
      CFStringRef v12 = [v9 identifier];
      if (([v12 isEqualToString:@"iMessageLogin"] & 1) == 0)
      {
        id v13 = [v9 identifier];
        if (![v13 isEqualToString:@"iFaceTimeLogin"])
        {
          [v9 identifier];
          v19 = uint64_t v46 = v10;
          unsigned __int8 v20 = [v19 isEqualToString:@"iTunesStoreLoginCell"];

          id v10 = v46;
          if ((v20 & 1) == 0)
          {
            id v14 = [v46 editableTextField];
            v21 = [v9 identifier];
            unsigned int v22 = [v21 isEqualToString:@"iCloudPassword"];

            if (v22)
            {
              objc_storeStrong((id *)&self->_iCloudPasswordTextField, v14);
              [(UITextField *)self->_iCloudPasswordTextField setDelegate:self];
              if (self->_iCloudPasswordTextFieldTextDidChangeObserver)
              {
                uint64_t v23 = +[NSNotificationCenter defaultCenter];
                [v23 removeObserver:self->_iCloudPasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:v14];
              }
              objc_initWeak(&location, self);
              v24 = +[NSNotificationCenter defaultCenter];
              v53[0] = _NSConcreteStackBlock;
              v53[1] = 3221225472;
              v53[2] = sub_10003D4E0;
              v53[3] = &unk_100244408;
              uint64_t v25 = &v54;
              objc_copyWeak(&v54, &location);
              id v26 = [v24 addObserverForName:UITextFieldTextDidChangeNotification object:v14 queue:0 usingBlock:v53];
              iCloudPasswordTextFieldTextDidChangeObserver = self->_iCloudPasswordTextFieldTextDidChangeObserver;
              self->_iCloudPasswordTextFieldTextDidChangeObserver = v26;

              [v14 setReturnKeyType:9];
            }
            else
            {
              unsigned __int8 v28 = [v9 identifier];
              unsigned int v29 = [v28 isEqualToString:@"iMessagePassword"];

              if (v29)
              {
                objc_storeStrong((id *)&self->_iMessagePasswordTextField, v14);
                [(UITextField *)self->_iMessagePasswordTextField setDelegate:self];
                if (self->_iMessagePasswordTextFieldTextDidChangeObserver)
                {
                  v30 = +[NSNotificationCenter defaultCenter];
                  [v30 removeObserver:self->_iMessagePasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:v14];
                }
                objc_initWeak(&location, self);
                BOOL v31 = +[NSNotificationCenter defaultCenter];
                v51[0] = _NSConcreteStackBlock;
                v51[1] = 3221225472;
                v51[2] = sub_10003D53C;
                v51[3] = &unk_100244408;
                uint64_t v25 = &v52;
                objc_copyWeak(&v52, &location);
                uint64_t v32 = [v31 addObserverForName:UITextFieldTextDidChangeNotification object:v14 queue:0 usingBlock:v51];
                iMessagePasswordTextFieldTextDidChangeObserver = self->_iMessagePasswordTextFieldTextDidChangeObserver;
                self->_iMessagePasswordTextFieldTextDidChangeObserver = v32;

                [v14 setReturnKeyType:9];
              }
              else
              {
                uint64_t v34 = [v9 identifier];
                unsigned int v35 = [v34 isEqualToString:@"iFaceTimePassword"];

                if (v35)
                {
                  objc_storeStrong((id *)&self->_faceTimePasswordTextField, v14);
                  [(UITextField *)self->_faceTimePasswordTextField setDelegate:self];
                  if (self->_faceTimePasswordTextFieldTextDidChangeObserver)
                  {
                    v36 = +[NSNotificationCenter defaultCenter];
                    [v36 removeObserver:self->_faceTimePasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:v14];
                  }
                  objc_initWeak(&location, self);
                  unsigned __int8 v37 = +[NSNotificationCenter defaultCenter];
                  v49[0] = _NSConcreteStackBlock;
                  v49[1] = 3221225472;
                  v49[2] = sub_10003D598;
                  v49[3] = &unk_100244408;
                  uint64_t v25 = &v50;
                  objc_copyWeak(&v50, &location);
                  uint64_t v38 = [v37 addObserverForName:UITextFieldTextDidChangeNotification object:v14 queue:0 usingBlock:v49];
                  faceTimePasswordTextFieldTextDidChangeObserver = self->_faceTimePasswordTextFieldTextDidChangeObserver;
                  self->_faceTimePasswordTextFieldTextDidChangeObserver = v38;

                  [v14 setReturnKeyType:9];
                }
                else
                {
                  id v40 = [v9 identifier];
                  unsigned int v41 = [v40 isEqualToString:@"iTunesStorePasswordCell"];

                  if (!v41) {
                    goto LABEL_9;
                  }
                  objc_storeStrong((id *)&self->_iTunesStorePasswordTextField, v14);
                  [(UITextField *)self->_iTunesStorePasswordTextField setDelegate:self];
                  if (self->_iTunesStorePasswordTextFieldTextDidChangeObserver)
                  {
                    uint64_t v42 = +[NSNotificationCenter defaultCenter];
                    [v42 removeObserver:self->_iTunesStorePasswordTextFieldTextDidChangeObserver name:UITextFieldTextDidChangeNotification object:v14];
                  }
                  objc_initWeak(&location, self);
                  uint64_t v43 = +[NSNotificationCenter defaultCenter];
                  v47[0] = _NSConcreteStackBlock;
                  v47[1] = 3221225472;
                  v47[2] = sub_10003D5F4;
                  v47[3] = &unk_100244408;
                  uint64_t v25 = &v48;
                  objc_copyWeak(&v48, &location);
                  uint64_t v44 = [v43 addObserverForName:UITextFieldTextDidChangeNotification object:v14 queue:0 usingBlock:v47];
                  iTunesStorePasswordTextFieldTextDidChangeObserver = self->_iTunesStorePasswordTextFieldTextDidChangeObserver;
                  self->_iTunesStorePasswordTextFieldTextDidChangeObserver = v44;

                  [v14 setReturnKeyType:9];
                }
              }
            }
            objc_destroyWeak(v25);
            objc_destroyWeak(&location);
            id v10 = v46;
            goto LABEL_9;
          }
LABEL_8:
          id v14 = [v10 editableTextField];
          v15 = BPSDetailTextColor();
          [v14 setTextColor:v15];

          [v14 setAdjustsFontSizeToFitWidth:1];
          [v14 setMinimumFontSize:1.0];
          NSRange v16 = [v10 titleLabel];
          [v16 setEnabled:1];
          v17 = BPSTextColor();
          [v16 setTextColor:v17];

LABEL_9:
          goto LABEL_10;
        }
      }
    }

    goto LABEL_8;
  }
LABEL_10:

  return v8;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = (UITextField *)a3;
  [(UITextField *)v4 resignFirstResponder];
  CFStringRef v5 = [(UITextField *)v4 text];
  id v6 = v5;
  if (v5 && ([v5 isEqualToString:&stru_100249230] & 1) == 0)
  {
    if (self->_iCloudPasswordTextField == v4)
    {
      [(COSAppleIDController *)self tappedSignInToiCloud];
    }
    else if (self->_iMessagePasswordTextField == v4)
    {
      [(COSAppleIDController *)self tappedSignInToiMessage];
    }
    else if (self->_faceTimePasswordTextField == v4)
    {
      [(COSAppleIDController *)self tappedSignInToFaceTime];
    }
    else if (self->_iTunesStorePasswordTextField == v4)
    {
      [(COSAppleIDController *)self tappedSignInToiTunesStore];
    }
  }

  return 1;
}

- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5
{
  id v17 = a3;
  id v8 = a5;
  [(COSAppleIDAuthController *)self->_authController setDelegate:0];
  authController = self->_authController;
  self->_authController = 0;

  [(COSAppleIDController *)self stopNetworkRequest];
  [(COSAppleIDController *)self enableSignInButtons:1];
  if (a4) {
    goto LABEL_4;
  }
  id v10 = [v8 domain];
  if ([v10 isEqualToString:@"com.apple.appleaccount"])
  {
    id v11 = [v8 code];

    if (v11 == (id)-6)
    {
LABEL_4:
      CFStringRef v12 = [v17 account];
      [(COSAppleIDController *)self loggedInSuccessfullyToAccount:v12];

      goto LABEL_32;
    }
  }
  else
  {
  }
  if (!self->_signingInToiCloud || self->_iCloudInteractiveAuthRequired)
  {
    if (self->_signingInToiMessage && !self->_iMessageInteractiveAuthRequired)
    {
      if (!self->_signingInToiCloud) {
        goto LABEL_23;
      }
    }
    else
    {
      if ((!self->_signingInToFaceTime || self->_facetimeInteractiveAuthRequired)
        && (!self->_signingInToiTunesStore || self->_iTunesInteractiveAuthRequired))
      {
        +[COSAppleIDLoginViewController showAlertForLoginFailureWithError:v8 presentingViewController:self];
        goto LABEL_32;
      }
      if (!self->_signingInToiCloud)
      {
        if (!self->_signingInToiMessage)
        {
          if (self->_signingInToFaceTime)
          {
            self->_facetimeInteractiveAuthRequired = 1;
            CFStringRef v13 = @"iFaceTimeLogin";
            if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_faceTimeIDMSAccount])
            {
              CFStringRef v14 = @"iFaceTimePassword";
              v15 = &OBJC_IVAR___COSAppleIDController__displayFaceTimePasswordTextField;
LABEL_26:
              self->BPSListController_opaque[*v15] = 1;
              goto LABEL_27;
            }
          }
          else
          {
            if (!self->_signingInToiTunesStore)
            {
              CFStringRef v14 = 0;
              CFStringRef v13 = 0;
              goto LABEL_27;
            }
            self->_iTunesInteractiveAuthRequired = 1;
            CFStringRef v13 = @"iTunesStoreLoginCell";
            if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_iTunesIDMSAccount])
            {
              CFStringRef v14 = @"iTunesStorePasswordCell";
              v15 = &OBJC_IVAR___COSAppleIDController__displayiTunesStorePasswordTextField;
              goto LABEL_26;
            }
          }
          goto LABEL_24;
        }
LABEL_23:
        self->_iMessageInteractiveAuthRequired = 1;
        CFStringRef v13 = @"iMessageLogin";
        if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_iMessageIDMSAccount])
        {
          CFStringRef v14 = @"iMessagePassword";
          v15 = &OBJC_IVAR___COSAppleIDController__displayiMessagePasswordTextField;
          goto LABEL_26;
        }
        goto LABEL_24;
      }
    }
  }
  self->_iCloudInteractiveAuthRequired = 1;
  CFStringRef v13 = @"iCloudLogin";
  if (![(COSAppleIDController *)self _federatedAuthRequiredForAccount:self->_iCloudIDMSAccount])
  {
    CFStringRef v14 = @"iCloudPassword";
    v15 = &OBJC_IVAR___COSAppleIDController__displayiCloudPasswordTextField;
    goto LABEL_26;
  }
LABEL_24:
  CFStringRef v14 = 0;
LABEL_27:
  if (self->_displayiCloudPasswordTextField
    || self->_displayiMessagePasswordTextField
    || self->_displayFaceTimePasswordTextField
    || self->_displayiTunesStorePasswordTextField)
  {
    id v16 = [(COSAppleIDController *)self newPasswordTextFieldSpecifierWithID:v14];
    [(COSAppleIDController *)self insertSpecifier:v16 afterSpecifierID:v13];
  }
LABEL_32:
  self->_signingInToiCloud = 0;
  self->_signingInToiMessage = 0;
  self->_signingInToFaceTime = 0;
  self->_signingInToiTunesStore = 0;
  self->_recoveringCredentialsForiCloud = 0;
  self->_recoveringCredentialsForiMessage = 0;
  self->_recoveringCredentialsForFaceTime = 0;
  self->_recoveringCredentialsForiTunesStore = 0;
}

- (NRDevice)pairedWatch
{
  return self->_pairedWatch;
}

- (void)setPairedWatch:(id)a3
{
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (ACAccount)iCloudAccount
{
  return self->_iCloudAccount;
}

- (void)setICloudAccount:(id)a3
{
}

- (ACAccount)iCloudIDMSAccount
{
  return self->_iCloudIDMSAccount;
}

- (void)setICloudIDMSAccount:(id)a3
{
}

- (ACAccount)iMessageAccount
{
  return self->_iMessageAccount;
}

- (void)setIMessageAccount:(id)a3
{
}

- (ACAccount)iMessageIDMSAccount
{
  return self->_iMessageIDMSAccount;
}

- (void)setIMessageIDMSAccount:(id)a3
{
}

- (ACAccount)faceTimeAccount
{
  return self->_faceTimeAccount;
}

- (void)setFaceTimeAccount:(id)a3
{
}

- (ACAccount)faceTimeIDMSAccount
{
  return self->_faceTimeIDMSAccount;
}

- (void)setFaceTimeIDMSAccount:(id)a3
{
}

- (ACAccount)iTunesStoreAccount
{
  return self->_iTunesStoreAccount;
}

- (void)setITunesStoreAccount:(id)a3
{
}

- (ACAccount)iTunesIDMSAccount
{
  return self->_iTunesIDMSAccount;
}

- (void)setITunesIDMSAccount:(id)a3
{
}

- (AKDevice)watchAKDevice
{
  return self->_watchAKDevice;
}

- (void)setWatchAKDevice:(id)a3
{
}

- (BOOL)sameAccountForAllAccountTypes
{
  return self->_sameAccountForAllAccountTypes;
}

- (void)setSameAccountForAllAccountTypes:(BOOL)a3
{
  self->_sameAccountForAllAccountTypes = a3;
}

- (BOOL)sameiCloudAndiMessageAppleID
{
  return self->_sameiCloudAndiMessageAppleID;
}

- (void)setSameiCloudAndiMessageAppleID:(BOOL)a3
{
  self->_sameiCloudAndiMessageAppleID = a3;
}

- (BOOL)sameiCloudAndFaceTimeAppleID
{
  return self->_sameiCloudAndFaceTimeAppleID;
}

- (void)setSameiCloudAndFaceTimeAppleID:(BOOL)a3
{
  self->_sameiCloudAndFaceTimeAppleID = a3;
}

- (BOOL)sameiCloudAndiTunesStoreAppleID
{
  return self->_sameiCloudAndiTunesStoreAppleID;
}

- (void)setSameiCloudAndiTunesStoreAppleID:(BOOL)a3
{
  self->_BOOL sameiCloudAndiTunesStoreAppleID = a3;
}

- (BOOL)sameiMessageAndFaceTimeAppleID
{
  return self->_sameiMessageAndFaceTimeAppleID;
}

- (void)setSameiMessageAndFaceTimeAppleID:(BOOL)a3
{
  self->_BOOL sameiMessageAndFaceTimeAppleID = a3;
}

- (BOOL)watchSupportsFaceTime
{
  return self->_watchSupportsFaceTime;
}

- (void)setWatchSupportsFaceTime:(BOOL)a3
{
  self->_watchSupportsFaceTime = a3;
}

- (BOOL)watchSupportsiTunesStore
{
  return self->_watchSupportsiTunesStore;
}

- (void)setWatchSupportsiTunesStore:(BOOL)a3
{
  self->_watchSupportsiTunesStore = a3;
}

- (BOOL)hasFetchedAccountsInfo
{
  return self->_hasFetchedAccountsInfo;
}

- (void)setHasFetchedAccountsInfo:(BOOL)a3
{
  self->_BOOL hasFetchedAccountsInfo = a3;
}

- (BOOL)watchIsSignedInToiCloud
{
  return self->_watchIsSignedInToiCloud;
}

- (void)setWatchIsSignedInToiCloud:(BOOL)a3
{
  self->_watchIsSignedInToiCloud = a3;
}

- (BOOL)watchIsSignedInToiMessage
{
  return self->_watchIsSignedInToiMessage;
}

- (void)setWatchIsSignedInToiMessage:(BOOL)a3
{
  self->_watchIsSignedInToiMessage = a3;
}

- (BOOL)watchIsSignedInToFaceTime
{
  return self->_watchIsSignedInToFaceTime;
}

- (void)setWatchIsSignedInToFaceTime:(BOOL)a3
{
  self->_watchIsSignedInToFaceTime = a3;
}

- (BOOL)watchIsSignedInToiTunesStore
{
  return self->_watchIsSignedInToiTunesStore;
}

- (void)setWatchIsSignedInToiTunesStore:(BOOL)a3
{
  self->_BOOL watchIsSignedInToiTunesStore = a3;
}

- (BOOL)signingInToiCloud
{
  return self->_signingInToiCloud;
}

- (void)setSigningInToiCloud:(BOOL)a3
{
  self->_signingInToiCloud = a3;
}

- (BOOL)signingInToiMessage
{
  return self->_signingInToiMessage;
}

- (void)setSigningInToiMessage:(BOOL)a3
{
  self->_signingInToiMessage = a3;
}

- (BOOL)signingInToFaceTime
{
  return self->_signingInToFaceTime;
}

- (void)setSigningInToFaceTime:(BOOL)a3
{
  self->_signingInToFaceTime = a3;
}

- (BOOL)signingInToiTunesStore
{
  return self->_signingInToiTunesStore;
}

- (void)setSigningInToiTunesStore:(BOOL)a3
{
  self->_signingInToiTunesStore = a3;
}

- (BOOL)recoveringCredentialsForiCloud
{
  return self->_recoveringCredentialsForiCloud;
}

- (void)setRecoveringCredentialsForiCloud:(BOOL)a3
{
  self->_recoveringCredentialsForiCloud = a3;
}

- (BOOL)recoveringCredentialsForiMessage
{
  return self->_recoveringCredentialsForiMessage;
}

- (void)setRecoveringCredentialsForiMessage:(BOOL)a3
{
  self->_recoveringCredentialsForiMessage = a3;
}

- (BOOL)recoveringCredentialsForFaceTime
{
  return self->_recoveringCredentialsForFaceTime;
}

- (void)setRecoveringCredentialsForFaceTime:(BOOL)a3
{
  self->_recoveringCredentialsForFaceTime = a3;
}

- (BOOL)recoveringCredentialsForiTunesStore
{
  return self->_recoveringCredentialsForiTunesStore;
}

- (void)setRecoveringCredentialsForiTunesStore:(BOOL)a3
{
  self->_recoveringCredentialsForiTunesStore = a3;
}

- (BOOL)displayiCloudPasswordTextField
{
  return self->_displayiCloudPasswordTextField;
}

- (void)setDisplayiCloudPasswordTextField:(BOOL)a3
{
  self->_displayiCloudPasswordTextField = a3;
}

- (BOOL)iCloudInteractiveAuthRequired
{
  return self->_iCloudInteractiveAuthRequired;
}

- (void)setICloudInteractiveAuthRequired:(BOOL)a3
{
  self->_iCloudInteractiveAuthRequired = a3;
}

- (BOOL)displayiMessagePasswordTextField
{
  return self->_displayiMessagePasswordTextField;
}

- (void)setDisplayiMessagePasswordTextField:(BOOL)a3
{
  self->_displayiMessagePasswordTextField = a3;
}

- (BOOL)iMessageInteractiveAuthRequired
{
  return self->_iMessageInteractiveAuthRequired;
}

- (void)setIMessageInteractiveAuthRequired:(BOOL)a3
{
  self->_iMessageInteractiveAuthRequired = a3;
}

- (BOOL)displayFaceTimePasswordTextField
{
  return self->_displayFaceTimePasswordTextField;
}

- (void)setDisplayFaceTimePasswordTextField:(BOOL)a3
{
  self->_displayFaceTimePasswordTextField = a3;
}

- (BOOL)facetimeInteractiveAuthRequired
{
  return self->_facetimeInteractiveAuthRequired;
}

- (void)setFacetimeInteractiveAuthRequired:(BOOL)a3
{
  self->_facetimeInteractiveAuthRequired = a3;
}

- (BOOL)displayiTunesStorePasswordTextField
{
  return self->_displayiTunesStorePasswordTextField;
}

- (void)setDisplayiTunesStorePasswordTextField:(BOOL)a3
{
  self->_displayiTunesStorePasswordTextField = a3;
}

- (BOOL)iTunesInteractiveAuthRequired
{
  return self->_iTunesInteractiveAuthRequired;
}

- (void)setITunesInteractiveAuthRequired:(BOOL)a3
{
  self->_iTunesInteractiveAuthRequired = a3;
}

- (COSAppleIDAuthController)authController
{
  return self->_authController;
}

- (void)setAuthController:(id)a3
{
}

- (UITextField)iCloudPasswordTextField
{
  return self->_iCloudPasswordTextField;
}

- (void)setICloudPasswordTextField:(id)a3
{
}

- (NSObject)iCloudPasswordTextFieldTextDidChangeObserver
{
  return self->_iCloudPasswordTextFieldTextDidChangeObserver;
}

- (void)setICloudPasswordTextFieldTextDidChangeObserver:(id)a3
{
}

- (UITextField)iMessagePasswordTextField
{
  return self->_iMessagePasswordTextField;
}

- (void)setIMessagePasswordTextField:(id)a3
{
}

- (NSObject)iMessagePasswordTextFieldTextDidChangeObserver
{
  return self->_iMessagePasswordTextFieldTextDidChangeObserver;
}

- (void)setIMessagePasswordTextFieldTextDidChangeObserver:(id)a3
{
}

- (UITextField)faceTimePasswordTextField
{
  return self->_faceTimePasswordTextField;
}

- (void)setFaceTimePasswordTextField:(id)a3
{
}

- (NSObject)faceTimePasswordTextFieldTextDidChangeObserver
{
  return self->_faceTimePasswordTextFieldTextDidChangeObserver;
}

- (void)setFaceTimePasswordTextFieldTextDidChangeObserver:(id)a3
{
}

- (UITextField)iTunesStorePasswordTextField
{
  return self->_iTunesStorePasswordTextField;
}

- (void)setITunesStorePasswordTextField:(id)a3
{
}

- (NSObject)iTunesStorePasswordTextFieldTextDidChangeObserver
{
  return self->_iTunesStorePasswordTextFieldTextDidChangeObserver;
}

- (void)setITunesStorePasswordTextFieldTextDidChangeObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesStorePasswordTextFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_iTunesStorePasswordTextField, 0);
  objc_storeStrong((id *)&self->_faceTimePasswordTextFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_faceTimePasswordTextField, 0);
  objc_storeStrong((id *)&self->_iMessagePasswordTextFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_iMessagePasswordTextField, 0);
  objc_storeStrong((id *)&self->_iCloudPasswordTextFieldTextDidChangeObserver, 0);
  objc_storeStrong((id *)&self->_iCloudPasswordTextField, 0);
  objc_storeStrong((id *)&self->_authController, 0);
  objc_storeStrong((id *)&self->_watchAKDevice, 0);
  objc_storeStrong((id *)&self->_iTunesIDMSAccount, 0);
  objc_storeStrong((id *)&self->_iTunesStoreAccount, 0);
  objc_storeStrong((id *)&self->_faceTimeIDMSAccount, 0);
  objc_storeStrong((id *)&self->_faceTimeAccount, 0);
  objc_storeStrong((id *)&self->_iMessageIDMSAccount, 0);
  objc_storeStrong((id *)&self->_iMessageAccount, 0);
  objc_storeStrong((id *)&self->_iCloudIDMSAccount, 0);
  objc_storeStrong((id *)&self->_iCloudAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_nssManager, 0);

  objc_storeStrong((id *)&self->_pairedWatch, 0);
}

@end