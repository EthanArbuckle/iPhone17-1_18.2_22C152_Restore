@interface COSAppleIDSilentSignInController
+ (double)silentAuthTimeout;
- (ACAccount)faceTimeAccount;
- (ACAccount)iCloudAccount;
- (ACAccount)iMessageAccount;
- (ACAccount)iTunesStoreAccount;
- (ACAccountStore)accountStore;
- (BOOL)faceTimeAccountIsForSameUserAsiCloudAccount;
- (BOOL)faceTimeAccountIsForSameUserAsiMessageAccount;
- (BOOL)iMessageAccountIsForSameUserAsiCloudAccount;
- (BOOL)iTunesStoreAccountIsForSameUserAsFaceTimeAccount;
- (BOOL)iTunesStoreAccountIsForSameUserAsiCloudAccount;
- (BOOL)iTunesStoreAccountIsForSameUserAsiMessageAccount;
- (BOOL)shouldSignFaceTimeAccountSeparately;
- (BOOL)shouldSigniMessageAccountSeparately;
- (BOOL)shouldSigniTunesStoreAccountSeparately;
- (COSAppleIDAuthController)faceTimeAuthController;
- (COSAppleIDAuthController)iCloudAuthController;
- (COSAppleIDAuthController)iMessageAuthController;
- (COSAppleIDAuthController)iTunesStoreAuthController;
- (COSAppleIDSilentSignInController)initWithDelegate:(id)a3 device:(id)a4;
- (COSAppleIDSilentSignInControllerDelegate)delegate;
- (NRDevice)device;
- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5;
- (void)setAccountStore:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDevice:(id)a3;
- (void)setFaceTimeAccount:(id)a3;
- (void)setFaceTimeAccountIsForSameUserAsiCloudAccount:(BOOL)a3;
- (void)setFaceTimeAccountIsForSameUserAsiMessageAccount:(BOOL)a3;
- (void)setFaceTimeAuthController:(id)a3;
- (void)setICloudAccount:(id)a3;
- (void)setICloudAuthController:(id)a3;
- (void)setIMessageAccount:(id)a3;
- (void)setIMessageAccountIsForSameUserAsiCloudAccount:(BOOL)a3;
- (void)setIMessageAuthController:(id)a3;
- (void)setITunesStoreAccount:(id)a3;
- (void)setITunesStoreAccountIsForSameUserAsFaceTimeAccount:(BOOL)a3;
- (void)setITunesStoreAccountIsForSameUserAsiCloudAccount:(BOOL)a3;
- (void)setITunesStoreAccountIsForSameUserAsiMessageAccount:(BOOL)a3;
- (void)setITunesStoreAuthController:(id)a3;
- (void)setShouldSignFaceTimeAccountSeparately:(BOOL)a3;
- (void)setShouldSigniMessageAccountSeparately:(BOOL)a3;
- (void)setShouldSigniTunesStoreAccountSeparately:(BOOL)a3;
- (void)startSigninIn;
@end

@implementation COSAppleIDSilentSignInController

- (COSAppleIDSilentSignInController)initWithDelegate:(id)a3 device:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)COSAppleIDSilentSignInController;
  v8 = [(COSAppleIDSilentSignInController *)&v38 init];
  v9 = v8;
  if (!v8) {
    goto LABEL_39;
  }
  objc_storeWeak((id *)&v8->_delegate, v6);
  objc_storeStrong((id *)&v9->_device, a4);
  device = v9->_device;
  id v11 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"DEBFF23F-9327-44FB-A219-0428BEBD5BA7"];
  unsigned __int8 v12 = [(NRDevice *)device supportsCapability:v11];

  v13 = v9->_device;
  id v14 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"1F1097A5-5A0B-4795-9FBE-B206DB49FA1D"];
  unsigned __int8 v15 = [(NRDevice *)v13 supportsCapability:v14];

  v16 = (ACAccountStore *)objc_alloc_init((Class)ACAccountStore);
  accountStore = v9->_accountStore;
  v9->_accountStore = v16;

  uint64_t v18 = +[COSiCloudAuthController iCloudAccountInAccountStore];
  iCloudAccount = v9->_iCloudAccount;
  v9->_iCloudAccount = (ACAccount *)v18;

  uint64_t v20 = +[COSiMessageFaceTimeAuthController iMessageAccountInAccountStore];
  iMessageAccount = v9->_iMessageAccount;
  v9->_iMessageAccount = (ACAccount *)v20;

  if (v12)
  {
    uint64_t v22 = +[COSiMessageFaceTimeAuthController faceTimeAccountInAccountStore];
    p_faceTimeAccount = &v9->_faceTimeAccount;
    faceTimeAccount = v9->_faceTimeAccount;
    v9->_faceTimeAccount = (ACAccount *)v22;
  }
  else
  {
    p_faceTimeAccount = &v9->_faceTimeAccount;
    faceTimeAccount = v9->_faceTimeAccount;
    v9->_faceTimeAccount = 0;
  }

  if (v15)
  {
    uint64_t v25 = +[COSiTunesStoreAuthController iTunesStoreAccountInAccountStore];
    p_iTunesStoreAccount = &v9->_iTunesStoreAccount;
    iTunesStoreAccount = v9->_iTunesStoreAccount;
    v9->_iTunesStoreAccount = (ACAccount *)v25;
  }
  else
  {
    p_iTunesStoreAccount = &v9->_iTunesStoreAccount;
    iTunesStoreAccount = v9->_iTunesStoreAccount;
    v9->_iTunesStoreAccount = 0;
  }

  v28 = pbb_accountsignin_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v29 = v9->_iCloudAccount != 0;
    BOOL v30 = v9->_iMessageAccount != 0;
    BOOL v31 = v9->_faceTimeAccount != 0;
    BOOL v32 = v9->_iTunesStoreAccount != 0;
    *(_DWORD *)buf = 67109888;
    BOOL v40 = v29;
    __int16 v41 = 1024;
    BOOL v42 = v30;
    __int16 v43 = 1024;
    BOOL v44 = v31;
    __int16 v45 = 1024;
    BOOL v46 = v32;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Found Accounts... iCloud: %d iMessage: %d FaceTime: %d iTunes: %d", buf, 0x1Au);
  }

  if (v9->_iMessageAccount)
  {
    if (v9->_iCloudAccount
      && +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:"))
    {
      char v33 = 0;
      char v34 = 1;
    }
    else
    {
      char v34 = 0;
      char v33 = 1;
    }
    v9->_shouldSigniMessageAccountSeparately = v33;
    v9->_iMessageAccountIsForSameUserAsiCloudAccount = v34;
  }
  if (*p_faceTimeAccount)
  {
    if (v9->_iCloudAccount
      && +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:"))
    {
      uint64_t v35 = 12;
    }
    else
    {
      if (!v9->_iMessageAccount
        || !+[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:", *p_faceTimeAccount))
      {
        uint64_t v35 = 9;
        goto LABEL_25;
      }
      uint64_t v35 = 13;
    }
    v9->_shouldSignFaceTimeAccountSeparately = 0;
LABEL_25:
    *((unsigned char *)&v9->super.isa + v35) = 1;
  }
  if (*p_iTunesStoreAccount)
  {
    if (v9->_iCloudAccount
      && +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:"))
    {
      uint64_t v36 = 14;
    }
    else if (v9->_iMessageAccount {
           && +[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:", *p_iTunesStoreAccount))
    }
    {
      uint64_t v36 = 15;
    }
    else
    {
      if (!*p_faceTimeAccount
        || !+[COSAppleIDUtilities checkIfAccount:isForSameAppleIDAsAccount:](COSAppleIDUtilities, "checkIfAccount:isForSameAppleIDAsAccount:", *p_iTunesStoreAccount))
      {
        uint64_t v36 = 10;
        goto LABEL_38;
      }
      uint64_t v36 = 16;
    }
    v9->_shouldSigniTunesStoreAccountSeparately = 0;
LABEL_38:
    *((unsigned char *)&v9->super.isa + v36) = 1;
  }
LABEL_39:

  return v9;
}

- (void)startSigninIn
{
  [(id)objc_opt_class() silentAuthTimeout];
  double v4 = v3;
  iCloudAccount = self->_iCloudAccount;
  if (iCloudAccount
    && +[COSAppleIDAuthController shouldAttemptPasswordLessSignInForAccount:iCloudAccount inAccountStore:self->_accountStore])
  {
    id v6 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_iCloudAccount timeout:self->_device device:v4];
    iCloudAuthController = self->_iCloudAuthController;
    self->_iCloudAuthController = v6;

    [(COSAppleIDAuthController *)self->_iCloudAuthController setDelegate:self];
    [(COSAppleIDAuthController *)self->_iCloudAuthController setSignInAccountType:COSSignInAccountTypeiCloud];
    [(COSAppleIDAuthController *)self->_iCloudAuthController startSigningInWithoutPassword];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained appleIDSilentSignInControllerSignedAccountType:0 withSuccess:0];

    if (self->_iMessageAccount
      && self->_iMessageAccountIsForSameUserAsiCloudAccount
      && !self->_shouldSigniMessageAccountSeparately)
    {
      id v9 = objc_loadWeakRetained((id *)&self->_delegate);
      [v9 appleIDSilentSignInControllerSignedAccountType:1 withSuccess:0];
    }
    if (self->_faceTimeAccount
      && self->_faceTimeAccountIsForSameUserAsiCloudAccount
      && !self->_shouldSignFaceTimeAccountSeparately)
    {
      id v10 = objc_loadWeakRetained((id *)&self->_delegate);
      [v10 appleIDSilentSignInControllerSignedAccountType:2 withSuccess:0];
    }
    if (self->_iTunesStoreAccount
      && self->_iTunesStoreAccountIsForSameUserAsiCloudAccount
      && !self->_shouldSigniTunesStoreAccountSeparately)
    {
      id v11 = objc_loadWeakRetained((id *)&self->_delegate);
      [v11 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
    }
  }
  if (self->_iMessageAccount
    && self->_shouldSigniMessageAccountSeparately
    && +[COSAppleIDAuthController shouldAttemptPasswordLessSignInForAccount:inAccountStore:](COSAppleIDAuthController, "shouldAttemptPasswordLessSignInForAccount:inAccountStore:"))
  {
    unsigned __int8 v12 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_iMessageAccount timeout:self->_device device:v4];
    iMessageAuthController = self->_iMessageAuthController;
    self->_iMessageAuthController = v12;

    [(COSAppleIDAuthController *)self->_iMessageAuthController setDelegate:self];
    [(COSAppleIDAuthController *)self->_iMessageAuthController setSignInAccountType:COSSignInAccountTypeiMessage];
    [(COSAppleIDAuthController *)self->_iMessageAuthController startSigningInWithoutPassword];
  }
  else
  {
    id v14 = objc_loadWeakRetained((id *)&self->_delegate);
    [v14 appleIDSilentSignInControllerSignedAccountType:1 withSuccess:0];

    if (self->_faceTimeAccount
      && self->_faceTimeAccountIsForSameUserAsiMessageAccount
      && !self->_shouldSignFaceTimeAccountSeparately)
    {
      id v15 = objc_loadWeakRetained((id *)&self->_delegate);
      [v15 appleIDSilentSignInControllerSignedAccountType:2 withSuccess:0];
    }
    if (self->_iTunesStoreAccount
      && self->_iTunesStoreAccountIsForSameUserAsiMessageAccount
      && !self->_shouldSigniTunesStoreAccountSeparately)
    {
      id v16 = objc_loadWeakRetained((id *)&self->_delegate);
      [v16 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
    }
  }
  if (self->_faceTimeAccount
    && self->_shouldSignFaceTimeAccountSeparately
    && +[COSAppleIDAuthController shouldAttemptPasswordLessSignInForAccount:inAccountStore:](COSAppleIDAuthController, "shouldAttemptPasswordLessSignInForAccount:inAccountStore:"))
  {
    v17 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_faceTimeAccount timeout:self->_device device:v4];
    faceTimeAuthController = self->_faceTimeAuthController;
    self->_faceTimeAuthController = v17;

    [(COSAppleIDAuthController *)self->_faceTimeAuthController setDelegate:self];
    [(COSAppleIDAuthController *)self->_faceTimeAuthController setSignInAccountType:COSSignInAccountTypeFaceTime];
    [(COSAppleIDAuthController *)self->_faceTimeAuthController startSigningInWithoutPassword];
  }
  else
  {
    id v19 = objc_loadWeakRetained((id *)&self->_delegate);
    [v19 appleIDSilentSignInControllerSignedAccountType:2 withSuccess:0];

    if (self->_iTunesStoreAccount
      && self->_iTunesStoreAccountIsForSameUserAsFaceTimeAccount
      && !self->_shouldSigniTunesStoreAccountSeparately)
    {
      id v20 = objc_loadWeakRetained((id *)&self->_delegate);
      [v20 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
    }
  }
  if (!self->_iTunesStoreAccount) {
    goto LABEL_42;
  }
  if (!self->_shouldSigniTunesStoreAccountSeparately) {
    return;
  }
  if (+[COSAppleIDAuthController shouldAttemptPasswordLessSignInForAccount:inAccountStore:](COSAppleIDAuthController, "shouldAttemptPasswordLessSignInForAccount:inAccountStore:"))
  {
    v21 = [[COSAppleIDAuthController alloc] initWithAccountStore:self->_accountStore account:self->_iTunesStoreAccount timeout:self->_device device:v4];
    iTunesStoreAuthController = self->_iTunesStoreAuthController;
    self->_iTunesStoreAuthController = v21;

    [(COSAppleIDAuthController *)self->_iTunesStoreAuthController setDelegate:self];
    [(COSAppleIDAuthController *)self->_iTunesStoreAuthController setSignInAccountType:COSSignInAccountTypeiTunes];
    v23 = self->_iTunesStoreAuthController;
    [(COSAppleIDAuthController *)v23 startSigningInWithoutPassword];
  }
  else
  {
LABEL_42:
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    [v24 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
  }
}

+ (double)silentAuthTimeout
{
  v2 = +[NSUserDefaults standardUserDefaults];
  [v2 doubleForKey:@"SilentAppleIDSignInTimeout"];
  double v4 = v3;

  double result = 0.0;
  if (v4 != 0.0) {
    return v4;
  }
  return result;
}

- (void)appleIDAuthController:(id)a3 didSignInWithSuccess:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  v8 = (COSAppleIDAuthController *)a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  if (self->_iCloudAuthController == v8)
  {
    if (v6)
    {
      BOOL v14 = 0;
    }
    else
    {
      v23 = [v9 domain];
      if ([v23 isEqualToString:@"com.apple.appleaccount"]) {
        BOOL v14 = [v9 code] == (id)-6;
      }
      else {
        BOOL v14 = 0;
      }
    }
    BOOL v30 = pbb_accountsignin_log();
    BOOL v31 = v14 || v6;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      iCloudAccount = self->_iCloudAccount;
      *(_DWORD *)buf = 138412546;
      v77 = iCloudAccount;
      __int16 v78 = 1024;
      BOOL v79 = v14 || v6;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Silent sign in for iCloud account (%@) completed with success: (%d)", buf, 0x12u);
    }

    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1000FA22C;
    v72[3] = &unk_100245C98;
    objc_copyWeak(&v73, &location);
    BOOL v74 = v14 || v6;
    char v33 = objc_retainBlock(v72);
    BOOL v34 = !v14;
    if (self->_iMessageAccount && !self->_shouldSigniMessageAccountSeparately)
    {
      uint64_t v35 = pbb_accountsignin_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v77) = v31;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Silent combined sign in for iMessage (via iCloud) completed with success: (%d)", buf, 8u);
      }

      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      [WeakRetained appleIDSilentSignInControllerSignedAccountType:1 withSuccess:v34];
    }
    if (self->_faceTimeAccount
      && !self->_shouldSignFaceTimeAccountSeparately
      && self->_faceTimeAccountIsForSameUserAsiCloudAccount)
    {
      v37 = pbb_accountsignin_log();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v77) = v31;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Silent combined sign in for FaceTime (via iCloud) completed with success: (%d)", buf, 8u);
      }

      id v38 = objc_loadWeakRetained((id *)&self->_delegate);
      [v38 appleIDSilentSignInControllerSignedAccountType:2 withSuccess:v34];
    }
    if (self->_iTunesStoreAccount
      && !self->_shouldSigniTunesStoreAccountSeparately
      && self->_iTunesStoreAccountIsForSameUserAsiCloudAccount)
    {
      if (v31)
      {
        v39 = pbb_accountsignin_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          iTunesStoreAccount = self->_iTunesStoreAccount;
          *(_DWORD *)buf = 138412290;
          v77 = iTunesStoreAccount;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Starting silent combined sign in for iTunesStore (via iCloud) account: (%@)", buf, 0xCu);
        }

        +[COSiTunesStoreAuthController saveToPairedDeviceiTunesStoreAccount:self->_iTunesStoreAccount fromAccountStore:self->_accountStore completion:&stru_1002470B8];
        __int16 v41 = [(COSAppleIDSilentSignInController *)self delegate];
        [v41 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:1];
      }
      else
      {
        BOOL v42 = pbb_accountsignin_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
          sub_100174A08(v42, v43, v44, v45, v46, v47, v48, v49);
        }

        __int16 v41 = objc_loadWeakRetained((id *)&self->_delegate);
        [v41 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
      }
    }
    ((void (*)(void *))v33[2])(v33);

    objc_destroyWeak(&v73);
  }
  else if (self->_iMessageAuthController == v8)
  {
    id v15 = pbb_accountsignin_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      iMessageAccount = self->_iMessageAccount;
      *(_DWORD *)buf = 138412546;
      v77 = iMessageAccount;
      __int16 v78 = 1024;
      BOOL v79 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Silent sign in for iMessage account (%@) completed with success: (%d)", buf, 0x12u);
    }

    v69[0] = _NSConcreteStackBlock;
    v69[1] = 3221225472;
    v69[2] = sub_1000FA360;
    v69[3] = &unk_100245C98;
    objc_copyWeak(&v70, &location);
    BOOL v71 = v6;
    v17 = objc_retainBlock(v69);
    if (self->_faceTimeAccount
      && !self->_shouldSignFaceTimeAccountSeparately
      && self->_faceTimeAccountIsForSameUserAsiMessageAccount)
    {
      uint64_t v18 = pbb_accountsignin_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v77) = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Silent combined sign in for FaceTime (via iMessage) completed with success: (%d)", buf, 8u);
      }

      id v19 = objc_loadWeakRetained((id *)&self->_delegate);
      [v19 appleIDSilentSignInControllerSignedAccountType:2 withSuccess:v6];
    }
    if (self->_iTunesStoreAccount
      && !self->_shouldSigniTunesStoreAccountSeparately
      && self->_iTunesStoreAccountIsForSameUserAsiMessageAccount)
    {
      if (v6)
      {
        id v20 = pbb_accountsignin_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = self->_iTunesStoreAccount;
          *(_DWORD *)buf = 138412290;
          v77 = v21;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting silent combined sign in for iTunesStore (via iMessage) account: (%@)", buf, 0xCu);
        }

        +[COSiTunesStoreAuthController saveToPairedDeviceiTunesStoreAccount:self->_iTunesStoreAccount fromAccountStore:self->_accountStore completion:&stru_1002470D8];
        uint64_t v22 = [(COSAppleIDSilentSignInController *)self delegate];
        [v22 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:1];
      }
      else
      {
        v50 = pbb_accountsignin_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_ERROR)) {
          sub_100174A40(v50, v51, v52, v53, v54, v55, v56, v57);
        }

        uint64_t v22 = objc_loadWeakRetained((id *)&self->_delegate);
        [v22 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
      }
    }
    ((void (*)(void *))v17[2])(v17);

    objc_destroyWeak(&v70);
  }
  else if (self->_faceTimeAuthController == v8)
  {
    id v24 = pbb_accountsignin_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      faceTimeAccount = self->_faceTimeAccount;
      *(_DWORD *)buf = 138412546;
      v77 = faceTimeAccount;
      __int16 v78 = 1024;
      BOOL v79 = v6;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Silent sign in for FaceTime account (%@) completed with success: (%d)", buf, 0x12u);
    }

    v66[0] = _NSConcreteStackBlock;
    v66[1] = 3221225472;
    v66[2] = sub_1000FA494;
    v66[3] = &unk_100245C98;
    objc_copyWeak(&v67, &location);
    BOOL v68 = v6;
    v26 = objc_retainBlock(v66);
    if (self->_iTunesStoreAccount
      && !self->_shouldSigniTunesStoreAccountSeparately
      && self->_iTunesStoreAccountIsForSameUserAsFaceTimeAccount)
    {
      if (v6)
      {
        v27 = pbb_accountsignin_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          v28 = self->_iTunesStoreAccount;
          *(_DWORD *)buf = 138412290;
          v77 = v28;
          _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Starting silent combined sign in for iTunesStore (via FaceTime) account: (%@)", buf, 0xCu);
        }

        +[COSiTunesStoreAuthController saveToPairedDeviceiTunesStoreAccount:self->_iTunesStoreAccount fromAccountStore:self->_accountStore completion:&stru_1002470F8];
        BOOL v29 = [(COSAppleIDSilentSignInController *)self delegate];
        [v29 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:1];
      }
      else
      {
        v58 = pbb_accountsignin_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR)) {
          sub_100174A78(v58, v59, v60, v61, v62, v63, v64, v65);
        }

        BOOL v29 = objc_loadWeakRetained((id *)&self->_delegate);
        [v29 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:0];
      }
    }
    ((void (*)(void *))v26[2])(v26);

    objc_destroyWeak(&v67);
  }
  else if (self->_iTunesStoreAuthController == v8)
  {
    id v10 = pbb_accountsignin_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = self->_iTunesStoreAccount;
      *(_DWORD *)buf = 138412546;
      v77 = v11;
      __int16 v78 = 1024;
      BOOL v79 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Silent sign in for iTunesStore account (%@) completed with success: (%d)", buf, 0x12u);
    }

    id v12 = objc_loadWeakRetained((id *)&self->_delegate);
    [v12 appleIDSilentSignInControllerSignedAccountType:3 withSuccess:v6];

    [(COSAppleIDAuthController *)self->_iTunesStoreAuthController setDelegate:0];
    iTunesStoreAuthController = self->_iTunesStoreAuthController;
    self->_iTunesStoreAuthController = 0;
  }
  objc_destroyWeak(&location);
}

- (COSAppleIDSilentSignInControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (COSAppleIDSilentSignInControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NRDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
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

- (ACAccount)iMessageAccount
{
  return self->_iMessageAccount;
}

- (void)setIMessageAccount:(id)a3
{
}

- (ACAccount)faceTimeAccount
{
  return self->_faceTimeAccount;
}

- (void)setFaceTimeAccount:(id)a3
{
}

- (ACAccount)iTunesStoreAccount
{
  return self->_iTunesStoreAccount;
}

- (void)setITunesStoreAccount:(id)a3
{
}

- (COSAppleIDAuthController)iCloudAuthController
{
  return self->_iCloudAuthController;
}

- (void)setICloudAuthController:(id)a3
{
}

- (COSAppleIDAuthController)iMessageAuthController
{
  return self->_iMessageAuthController;
}

- (void)setIMessageAuthController:(id)a3
{
}

- (COSAppleIDAuthController)faceTimeAuthController
{
  return self->_faceTimeAuthController;
}

- (void)setFaceTimeAuthController:(id)a3
{
}

- (COSAppleIDAuthController)iTunesStoreAuthController
{
  return self->_iTunesStoreAuthController;
}

- (void)setITunesStoreAuthController:(id)a3
{
}

- (BOOL)shouldSigniMessageAccountSeparately
{
  return self->_shouldSigniMessageAccountSeparately;
}

- (void)setShouldSigniMessageAccountSeparately:(BOOL)a3
{
  self->_shouldSigniMessageAccountSeparately = a3;
}

- (BOOL)shouldSignFaceTimeAccountSeparately
{
  return self->_shouldSignFaceTimeAccountSeparately;
}

- (void)setShouldSignFaceTimeAccountSeparately:(BOOL)a3
{
  self->_shouldSignFaceTimeAccountSeparately = a3;
}

- (BOOL)shouldSigniTunesStoreAccountSeparately
{
  return self->_shouldSigniTunesStoreAccountSeparately;
}

- (void)setShouldSigniTunesStoreAccountSeparately:(BOOL)a3
{
  self->_shouldSigniTunesStoreAccountSeparately = a3;
}

- (BOOL)iMessageAccountIsForSameUserAsiCloudAccount
{
  return self->_iMessageAccountIsForSameUserAsiCloudAccount;
}

- (void)setIMessageAccountIsForSameUserAsiCloudAccount:(BOOL)a3
{
  self->_iMessageAccountIsForSameUserAsiCloudAccount = a3;
}

- (BOOL)faceTimeAccountIsForSameUserAsiCloudAccount
{
  return self->_faceTimeAccountIsForSameUserAsiCloudAccount;
}

- (void)setFaceTimeAccountIsForSameUserAsiCloudAccount:(BOOL)a3
{
  self->_faceTimeAccountIsForSameUserAsiCloudAccount = a3;
}

- (BOOL)faceTimeAccountIsForSameUserAsiMessageAccount
{
  return self->_faceTimeAccountIsForSameUserAsiMessageAccount;
}

- (void)setFaceTimeAccountIsForSameUserAsiMessageAccount:(BOOL)a3
{
  self->_faceTimeAccountIsForSameUserAsiMessageAccount = a3;
}

- (BOOL)iTunesStoreAccountIsForSameUserAsiCloudAccount
{
  return self->_iTunesStoreAccountIsForSameUserAsiCloudAccount;
}

- (void)setITunesStoreAccountIsForSameUserAsiCloudAccount:(BOOL)a3
{
  self->_iTunesStoreAccountIsForSameUserAsiCloudAccount = a3;
}

- (BOOL)iTunesStoreAccountIsForSameUserAsiMessageAccount
{
  return self->_iTunesStoreAccountIsForSameUserAsiMessageAccount;
}

- (void)setITunesStoreAccountIsForSameUserAsiMessageAccount:(BOOL)a3
{
  self->_iTunesStoreAccountIsForSameUserAsiMessageAccount = a3;
}

- (BOOL)iTunesStoreAccountIsForSameUserAsFaceTimeAccount
{
  return self->_iTunesStoreAccountIsForSameUserAsFaceTimeAccount;
}

- (void)setITunesStoreAccountIsForSameUserAsFaceTimeAccount:(BOOL)a3
{
  self->_iTunesStoreAccountIsForSameUserAsFaceTimeAccount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesStoreAuthController, 0);
  objc_storeStrong((id *)&self->_faceTimeAuthController, 0);
  objc_storeStrong((id *)&self->_iMessageAuthController, 0);
  objc_storeStrong((id *)&self->_iCloudAuthController, 0);
  objc_storeStrong((id *)&self->_iTunesStoreAccount, 0);
  objc_storeStrong((id *)&self->_faceTimeAccount, 0);
  objc_storeStrong((id *)&self->_iMessageAccount, 0);
  objc_storeStrong((id *)&self->_iCloudAccount, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_device, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end