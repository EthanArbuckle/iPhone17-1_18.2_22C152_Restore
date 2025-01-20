@interface PHRegistrationViewController
+ (BOOL)_shouldShowAuthKitSignIn;
+ (BOOL)shouldShowRegistration;
+ (id)_inProgressRegisteringNonPhoneAccount;
- (AKTapToSignInViewController)akSignInVC;
- (NSTimer)registrationTimeout;
- (OBPrivacyLinkController)privacyLinkController;
- (PHRegistrationViewController)init;
- (id)completionBlock;
- (void)_handleRegistrarCompletion:(BOOL)a3 errorAlertController:(id)a4;
- (void)_keyboardWillAppear:(id)a3;
- (void)_keyboardWillDisappear:(id)a3;
- (void)_registrationStatusChanged:(id)a3;
- (void)_registrationTimedOut:(id)a3;
- (void)_startListeningForKeyboardNotifications;
- (void)_stopListeningToKeyboardNotifications;
- (void)dealloc;
- (void)registrationViewSignInPhoneAccount:(id)a3;
- (void)setAkSignInVC:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setPrivacyLinkController:(id)a3;
- (void)setRegistrationTimeout:(id)a3;
- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation PHRegistrationViewController

+ (BOOL)shouldShowRegistration
{
  v2 = sub_100011338(@"BypassRegistrationUI");
  unsigned __int8 v3 = [v2 BOOLValue];

  if ((v3 & 1) != 0
    || [UIApp showsTelephonyCalls]
    && ([UIApp telephonyCallingIsAvailable] & 1) != 0
    || [UIApp showsFaceTimeVideo]
    && ([UIApp faceTimeVideoIsAvailable] & 1) != 0)
  {
    return 0;
  }
  if (+[PHRegistrationViewController _shouldShowAuthKitSignIn])
  {
    return 1;
  }
  v6 = +[PHRegistrationViewController _inProgressRegisteringNonPhoneAccount];
  BOOL v4 = v6 != 0;

  return v4;
}

+ (BOOL)_shouldShowAuthKitSignIn
{
  v2 = +[IMAccountController sharedInstance];
  unsigned __int8 v3 = +[IMService facetimeService];
  BOOL v4 = [v2 accountsForService:v3];

  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * i), "registrationStatus", (void)v12) == (id)5)
        {
          BOOL v10 = 0;
          goto LABEL_11;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  BOOL v10 = 1;
LABEL_11:

  return v10;
}

+ (id)_inProgressRegisteringNonPhoneAccount
{
  v2 = +[IMAccountController sharedInstance];
  unsigned __int8 v3 = +[IMService facetimeService];
  BOOL v4 = [v2 accountsForService:v3];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 accountType];
        v11 = (char *)[v9 registrationStatus];
        if (v11 != (char *)5 && v10 != (id)2 && (unint64_t)(v11 - 2) <= 2)
        {
          id v6 = v9;
          goto LABEL_14;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }
LABEL_14:

  return v6;
}

- (PHRegistrationViewController)init
{
  v25.receiver = self;
  v25.super_class = (Class)PHRegistrationViewController;
  v2 = [(PHRegistrationViewController *)&v25 init];
  if (v2)
  {
    unsigned __int8 v3 = -[PHRegistrationView initWithFrame:]([PHRegistrationView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    [(PHRegistrationView *)v3 setRegistrationDelegate:v2];
    [(PHRegistrationViewController *)v2 setView:v3];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v4 = +[IMAccountController sharedInstance];
    id v5 = +[IMService facetimeService];
    id v6 = [v4 accountsForService:v5];

    id v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v22;
LABEL_4:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        if ([*(id *)(*((void *)&v21 + 1) + 8 * v10) accountType] == (id)2) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v8) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v11 = (AKTapToSignInViewController *)objc_alloc_init((Class)CUTWeakLinkClass());
      akSignInVC = v2->_akSignInVC;
      v2->_akSignInVC = v11;

      [(AKTapToSignInViewController *)v2->_akSignInVC setUsesDarkMode:1];
      [(AKTapToSignInViewController *)v2->_akSignInVC setDelegate:v2];
      id v6 = objc_alloc_init((Class)CUTWeakLinkClass());
      [v6 setPresentingViewController:v2];
      id v13 = objc_alloc_init((Class)CUTWeakLinkClass());
      long long v14 = [v13 aa_primaryAppleAccount];
      long long v15 = [v14 username];
      if ([v15 length]) {
        [v6 setUsername:v15];
      }
      [(AKTapToSignInViewController *)v2->_akSignInVC setContext:v6];
      long long v16 = [(AKTapToSignInViewController *)v2->_akSignInVC view];
      [(PHRegistrationView *)v3 setAuthKitSignInView:v16];

      uint64_t v17 = +[OBPrivacyLinkController linkWithBundleIdentifier:@"com.apple.onboarding.facetime"];
      privacyLinkController = v2->_privacyLinkController;
      v2->_privacyLinkController = (OBPrivacyLinkController *)v17;

      [(PHRegistrationViewController *)v2 addChildViewController:v2->_privacyLinkController];
      v19 = [(OBPrivacyLinkController *)v2->_privacyLinkController view];
      [(PHRegistrationView *)v3 setPrivacyLinkView:v19];

      [(OBPrivacyLinkController *)v2->_privacyLinkController didMoveToParentViewController:v2];
    }

    [(PHRegistrationView *)v3 layoutSubviews];
  }
  return v2;
}

- (void)dealloc
{
  [(PHRegistrationViewController *)self _stopListeningToKeyboardNotifications];
  v3.receiver = self;
  v3.super_class = (Class)PHRegistrationViewController;
  [(PHRegistrationViewController *)&v3 dealloc];
}

- (void)viewWillAppear:(BOOL)a3
{
  v14.receiver = self;
  v14.super_class = (Class)PHRegistrationViewController;
  [(PHRegistrationViewController *)&v14 viewWillAppear:a3];
  [(PHRegistrationViewController *)self _startListeningForKeyboardNotifications];
  BOOL v4 = +[PHRegistrationViewController _inProgressRegisteringNonPhoneAccount];
  if (v4)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100040E28;
    block[3] = &unk_1000A1D50;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    uint64_t v7 = 0;
    id v8 = &v7;
    uint64_t v9 = 0x3032000000;
    uint64_t v10 = sub_100040E70;
    v11 = sub_100040E80;
    id v12 = objc_alloc_init((Class)CNFAccountRegistrar);
    id v5 = (void *)v8[5];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100040E88;
    v6[3] = &unk_1000A26E8;
    v6[4] = self;
    v6[5] = &v7;
    [v5 continueRegistrationForAccount:v4 completionBlock:v6];
    _Block_object_dispose(&v7, 8);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PHRegistrationViewController;
  [(PHRegistrationViewController *)&v4 viewWillDisappear:a3];
  [(PHRegistrationViewController *)self _stopListeningToKeyboardNotifications];
}

- (void)tapToSignInViewController:(id)a3 didAuthenticateWithResults:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = sub_100012C68();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    sub_10006AFD4();
  }

  if (v10)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100041314;
    block[3] = &unk_1000A1D50;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    id v12 = sub_100012C68();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10006AF5C((uint64_t)v10, v12);
    }
  }
  else
  {
    id v13 = sub_100012C68();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      sub_10006AF28();
    }

    if (!qword_1000BC248)
    {
      objc_super v14 = (void **)CUTWeakLinkSymbol();
      if (v14) {
        long long v15 = *v14;
      }
      else {
        long long v15 = 0;
      }
      objc_storeStrong((id *)&qword_1000BC248, v15);
    }
    if (!qword_1000BC250)
    {
      long long v16 = (void **)CUTWeakLinkSymbol();
      if (v16) {
        uint64_t v17 = *v16;
      }
      else {
        uint64_t v17 = 0;
      }
      objc_storeStrong((id *)&qword_1000BC250, v17);
    }
    v18 = [v9 objectForKey:qword_1000BC248];
    uint64_t v19 = [v9 objectForKey:qword_1000BC250];
    v20 = (void *)v19;
    if (v18 && v19)
    {
      long long v21 = sub_100012C68();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        sub_10006AEB4();
      }

      v34[0] = _NSConcreteStackBlock;
      v34[1] = 3221225472;
      v34[2] = sub_1000413B4;
      v34[3] = &unk_1000A1D50;
      v34[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v34);
      long long v22 = sub_100012C68();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        sub_10006AE80();
      }

      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x3032000000;
      v31 = sub_100040E70;
      v32 = sub_100040E80;
      id v33 = [objc_alloc((Class)CNFAccountRegistrar) initWithServiceType:0 presentationViewController:self];
      long long v23 = (void *)v29[5];
      long long v24 = +[IMServiceImpl facetimeService];
      v27[0] = _NSConcreteStackBlock;
      v27[1] = 3221225472;
      v27[2] = sub_1000413FC;
      v27[3] = &unk_1000A26E8;
      v27[4] = self;
      v27[5] = &v28;
      [v23 registerAccountWithUsername:v18 password:v20 service:v24 completionBlock:v27];

      _Block_object_dispose(&v28, 8);
    }
    else
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_10004140C;
      v26[3] = &unk_1000A1D50;
      v26[4] = self;
      dispatch_async((dispatch_queue_t)&_dispatch_main_q, v26);
      objc_super v25 = sub_100012C68();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
        sub_10006AEE8();
      }
    }
  }
}

- (void)_handleRegistrarCompletion:(BOOL)a3 errorAlertController:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  uint64_t v7 = sub_100012C68();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    sub_10006B070();
  }

  if (v4)
  {
    id v8 = sub_100012C68();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      sub_10006B008();
    }

    id v9 = [(PHRegistrationViewController *)self completionBlock];

    if (v9)
    {
      id v10 = [(PHRegistrationViewController *)self completionBlock];
      v10[2](v10, 1);
    }
  }
  else if (v6)
  {
    v11 = sub_100012C68();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_10006B03C();
    }

    [(PHRegistrationViewController *)self presentViewController:v6 animated:1 completion:0];
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000415C0;
  block[3] = &unk_1000A1D50;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)registrationViewSignInPhoneAccount:(id)a3
{
  BOOL v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "View requested phone account to register", buf, 2u);
  }

  id v5 = +[IMAccountController sharedInstance];
  id v6 = +[IMService facetimeService];
  uint64_t v7 = [v5 accountsForService:v6];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v7;
  id v8 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
  if (v8)
  {
    id v10 = v8;
    uint64_t v11 = *(void *)v22;
    uint64_t v12 = IMAccountRegistrationStatusChangedNotification;
    *(void *)&long long v9 = 138412290;
    long long v19 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        objc_super v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v14, "accountType", v19) == (id)2)
        {
          long long v15 = sub_100012C68();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v19;
            v26 = v14;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Registering this acount: %@", buf, 0xCu);
          }

          long long v16 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_registrationTimedOut:" selector:0 userInfo:0 repeats:180.0];
          [(PHRegistrationViewController *)self setRegistrationTimeout:v16];

          uint64_t v17 = +[NSNotificationCenter defaultCenter];
          [v17 addObserver:self selector:"_registrationStatusChanged:" name:v12 object:0];

          v18 = dispatch_get_global_queue(21, 0);
          IDSRegistrationControlEnableRegistrationType();
        }
      }
      id v10 = [obj countByEnumeratingWithState:&v21 objects:v27 count:16];
    }
    while (v10);
  }
}

- (void)_registrationTimedOut:(id)a3
{
  id v4 = a3;
  id v5 = sub_100012C68();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Registration timed out", v10, 2u);
  }

  [v4 invalidate];
  [(PHRegistrationViewController *)self setRegistrationTimeout:0];
  id v6 = +[NSNotificationCenter defaultCenter];
  [v6 removeObserver:self name:IMAccountRegistrationStatusChangedNotification object:0];

  uint64_t v7 = [(PHRegistrationViewController *)self completionBlock];

  if (v7)
  {
    id v8 = [(PHRegistrationViewController *)self view];
    [v8 setSigningIn:0];
    long long v9 = [(PHRegistrationViewController *)self completionBlock];
    v9[2](v9, 0);
  }
}

- (void)_startListeningForKeyboardNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_keyboardWillAppear:" name:UIKeyboardWillShowNotification object:0];
  [v3 addObserver:self selector:"_keyboardWillDisappear:" name:UIKeyboardWillHideNotification object:0];
}

- (void)_stopListeningToKeyboardNotifications
{
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:UIKeyboardWillShowNotification object:0];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:UIKeyboardWillHideNotification object:0];
}

- (void)_keyboardWillAppear:(id)a3
{
  id v17 = a3;
  id v4 = [(PHRegistrationViewController *)self view];
  if (v4)
  {
    id v5 = [v17 userInfo];
    id v6 = [v5 objectForKey:UIKeyboardFrameEndUserInfoKey];
    [v6 CGRectValue];
    double v8 = v7;

    [v4 bounds];
    double v10 = v9;
    [v4 contentSize];
    if (v8 > v10 - v11)
    {
      [v4 contentInset];
      [v4 setContentInset:];
      [v4 contentSize];
      double v13 = v12;
      [v4 bounds];
      double v15 = v13 - v14;
      [v4 contentInset];
      [v4 setContentOffset:1 animated:fabs(v16 + v15)];
    }
  }
}

- (void)_keyboardWillDisappear:(id)a3
{
  id v3 = [(PHRegistrationViewController *)self view];
  if (v3)
  {
    id v4 = v3;
    [v3 setContentInset:UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right];
    [v4 setContentOffset:CGPointZero];
    id v3 = v4;
  }
}

- (void)_registrationStatusChanged:(id)a3
{
  id v4 = sub_100012C68();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Registration status changed", buf, 2u);
  }

  id v5 = +[IMAccountController sharedInstance];
  id v6 = +[IMService facetimeService];
  double v7 = [v5 accountsForService:v6];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = v7;
  id v9 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (!v9) {
    goto LABEL_29;
  }
  id v10 = v9;
  uint64_t v11 = *(void *)v27;
  while (2)
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      double v13 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      if ([v13 accountType] == (id)2)
      {
        id v14 = [v13 registrationStatus];
        id v15 = v14;
        if (v14 == (id)5)
        {
          double v16 = sub_100012C68();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Phone account is registered", buf, 2u);
          }
        }
        else
        {
          if (v14 != (id)-1) {
            continue;
          }
          id v17 = sub_100012C68();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Phone account failed registration", buf, 2u);
          }

          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100042180;
          block[3] = &unk_1000A1D50;
          block[4] = self;
          dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        }
        v18 = sub_100012C68();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Registration status change handled", buf, 2u);
        }

        long long v19 = [(PHRegistrationViewController *)self registrationTimeout];
        [v19 invalidate];

        [(PHRegistrationViewController *)self setRegistrationTimeout:0];
        v20 = [(PHRegistrationViewController *)self completionBlock];

        if (v20)
        {
          long long v21 = sub_100012C68();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            CFStringRef v22 = @"NO";
            if (v15 == (id)5) {
              CFStringRef v22 = @"YES";
            }
            *(_DWORD *)buf = 138412290;
            CFStringRef v31 = v22;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Calling completion block with result: %@", buf, 0xCu);
          }

          long long v23 = [(PHRegistrationViewController *)self completionBlock];
          ((void (**)(void, BOOL))v23)[2](v23, v15 == (id)5);
        }
        long long v24 = +[NSNotificationCenter defaultCenter];
        [v24 removeObserver:self name:IMAccountRegistrationStatusChangedNotification object:0];

        goto LABEL_29;
      }
    }
    id v10 = [v8 countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v10) {
      continue;
    }
    break;
  }
LABEL_29:
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (AKTapToSignInViewController)akSignInVC
{
  return (AKTapToSignInViewController *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAkSignInVC:(id)a3
{
}

- (OBPrivacyLinkController)privacyLinkController
{
  return (OBPrivacyLinkController *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPrivacyLinkController:(id)a3
{
}

- (NSTimer)registrationTimeout
{
  return (NSTimer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setRegistrationTimeout:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrationTimeout, 0);
  objc_storeStrong((id *)&self->_privacyLinkController, 0);
  objc_storeStrong((id *)&self->_akSignInVC, 0);

  objc_storeStrong(&self->_completionBlock, 0);
}

@end