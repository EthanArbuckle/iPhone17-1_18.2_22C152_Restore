@interface FMIPLockScreenViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isDeviceActivated;
- (BOOL)isManagedLostmode;
- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3;
- (CoreTelephonyClient)ctClient;
- (NSObject)lostModeChangedToken;
- (NSObject)registrationStatusChangedToken;
- (NSObject)simStatusChangedToken;
- (SBLockScreenModalView)lockScreenModalView;
- (SBLockScreenPluginController)pluginController;
- (int64_t)currentState;
- (void)bottomButtonPressed:(id)a3;
- (void)callOwner:(id)a3;
- (void)canCallWithCompletion:(id)a3;
- (void)dealloc;
- (void)disable;
- (void)handlePrimaryActionForView:(id)a3;
- (void)handleSecondaryActionForView:(id)a3;
- (void)loadView;
- (void)setCallButtonEnabled:(BOOL)a3;
- (void)setCtClient:(id)a3;
- (void)setCurrentState:(int64_t)a3;
- (void)setIsManagedLostmode:(BOOL)a3;
- (void)setLegibilitySettings:(id)a3;
- (void)setLockScreenModalView:(id)a3;
- (void)setLostModeChangedToken:(id)a3;
- (void)setPluginController:(id)a3;
- (void)setRegistrationStatusChangedToken:(id)a3;
- (void)setSimStatusChangedToken:(id)a3;
- (void)updateAppearance;
- (void)updateLockScreenView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMIPLockScreenViewController

- (void)loadView
{
  v6.receiver = self;
  v6.super_class = (Class)FMIPLockScreenViewController;
  [(FMIPLockScreenViewController *)&v6 loadView];
  id v3 = objc_alloc_init((Class)CoreTelephonyClient);
  [(FMIPLockScreenViewController *)self setCtClient:v3];

  id v4 = +[SBLockScreenModalViewFactory newLockScreenModalView];
  [(FMIPLockScreenViewController *)self setLockScreenModalView:v4];

  [(SBLockScreenModalView *)self->_lockScreenModalView setDelegate:self];
  [(FMIPLockScreenViewController *)self setView:self->_lockScreenModalView];
  v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_4774(self, v5);
  }
}

- (void)viewDidLoad
{
  id v3 = +[NSNotificationCenter defaultCenter];
  v16.receiver = self;
  v16.super_class = (Class)FMIPLockScreenViewController;
  [(FMIPLockScreenViewController *)&v16 viewDidLoad];
  id v4 = off_D6B0;
  v5 = +[NSOperationQueue mainQueue];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_2314;
  v15[3] = &unk_8318;
  v15[4] = self;
  objc_super v6 = [v3 addObserverForName:v4 object:0 queue:v5 usingBlock:v15];
  [(FMIPLockScreenViewController *)self setLostModeChangedToken:v6];

  v7 = off_D6B8;
  v8 = +[NSOperationQueue mainQueue];
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_24AC;
  v14[3] = &unk_8318;
  v14[4] = self;
  v9 = [v3 addObserverForName:v7 object:0 queue:v8 usingBlock:v14];
  [(FMIPLockScreenViewController *)self setSimStatusChangedToken:v9];

  v10 = off_D6C0;
  v11 = +[NSOperationQueue mainQueue];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_256C;
  v13[3] = &unk_8318;
  v13[4] = self;
  v12 = [v3 addObserverForName:v10 object:0 queue:v11 usingBlock:v13];
  [(FMIPLockScreenViewController *)self setRegistrationStatusChangedToken:v12];
}

- (void)dealloc
{
  [(FMIPLockScreenViewController *)self setCtClient:0];
  id v3 = +[NSNotificationCenter defaultCenter];
  id v4 = [(FMIPLockScreenViewController *)self lostModeChangedToken];

  if (v4)
  {
    v5 = [(FMIPLockScreenViewController *)self lostModeChangedToken];
    [v3 removeObserver:v5];

    [(FMIPLockScreenViewController *)self setLostModeChangedToken:0];
  }
  objc_super v6 = [(FMIPLockScreenViewController *)self simStatusChangedToken];

  if (v6)
  {
    v7 = [(FMIPLockScreenViewController *)self simStatusChangedToken];
    [v3 removeObserver:v7];

    [(FMIPLockScreenViewController *)self setSimStatusChangedToken:0];
  }
  v8 = [(FMIPLockScreenViewController *)self registrationStatusChangedToken];

  if (v8)
  {
    v9 = [(FMIPLockScreenViewController *)self registrationStatusChangedToken];
    [v3 removeObserver:v9];

    [(FMIPLockScreenViewController *)self setRegistrationStatusChangedToken:0];
  }

  v10.receiver = self;
  v10.super_class = (Class)FMIPLockScreenViewController;
  [(FMIPLockScreenViewController *)&v10 dealloc];
}

- (BOOL)pluginAnimatesAppearanceTransition:(BOOL)a3
{
  return 0;
}

- (void)handlePrimaryActionForView:(id)a3
{
}

- (void)handleSecondaryActionForView:(id)a3
{
}

- (void)setLegibilitySettings:(id)a3
{
  id v4 = a3;
  id v5 = [(FMIPLockScreenViewController *)self lockScreenModalView];
  [v5 setLegibilitySettings:v4];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)callOwner:(id)a3
{
  id v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "callOwner pressed", (uint8_t *)&v18, 2u);
  }

  id v5 = +[FMDFMIPManager sharedInstance];
  objc_super v6 = [v5 lostModeInfo];

  if (v6)
  {
    v7 = [v6 phoneNumber];
    id v8 = [v7 length];

    if (v8)
    {
      id v9 = objc_alloc_init((Class)NSURLComponents);
      [v9 setScheme:@"tel"];
      objc_super v10 = [v6 phoneNumber];
      [v9 setHost:v10];

      v11 = [v9 URL];
      v12 = [(FMIPLockScreenViewController *)self pluginController];
      id v13 = [objc_alloc((Class)SBLockScreenPluginCallAction) initWithURL:v11];
      v14 = sub_4588();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v15 = [v6 phoneNumber];
        int v18 = 138412546;
        v19 = v15;
        __int16 v20 = 2112;
        v21 = v11;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_DEFAULT, "Dialing %@ at URL %@", (uint8_t *)&v18, 0x16u);
      }
      objc_super v16 = [v12 pluginAgent];
      [v16 pluginController:v12 sendAction:v13];

      v17 = sub_4588();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412290;
        v19 = v11;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "Initiated call to %@", (uint8_t *)&v18, 0xCu);
      }
    }
  }
}

- (void)bottomButtonPressed:(id)a3
{
  id v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "bottomButton pressed", buf, 2u);
  }

  id v5 = +[FMDFMIPManager sharedInstance];
  objc_super v6 = [v5 lostModeInfo];

  if ([v6 lostModeType] == (char *)&dword_4 + 1)
  {
    activity_block[0] = _NSConcreteStackBlock;
    activity_block[1] = 3221225472;
    activity_block[2] = sub_2C4C;
    activity_block[3] = &unk_8340;
    activity_block[4] = self;
    _os_activity_initiate(&dword_0, "AckManagedLostMode", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  }
  else
  {
    v7 = [(FMIPLockScreenViewController *)self pluginController];
    id v8 = +[SBLockScreenPluginEmergencyDialerAction action];
    id v9 = sub_4588();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "Show Emergency Dialer", buf, 2u);
    }

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_2DB0;
    v12[3] = &unk_8390;
    id v13 = v7;
    id v14 = v8;
    id v10 = v8;
    id v11 = v7;
    _os_activity_initiate(&dword_0, "ShowEmergencyDialer", OS_ACTIVITY_FLAG_DEFAULT, v12);
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_4878(v5);
  }

  [(FMIPLockScreenViewController *)self updateLockScreenView];
  v6.receiver = self;
  v6.super_class = (Class)FMIPLockScreenViewController;
  [(FMIPLockScreenViewController *)&v6 viewDidAppear:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_48BC(v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)FMIPLockScreenViewController;
  [(FMIPLockScreenViewController *)&v8 viewWillDisappear:v3];
  objc_super v6 = sub_4588();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "currentState: FMIPLockScreenStateNotInitialized", v7, 2u);
  }

  [(FMIPLockScreenViewController *)self setCurrentState:0];
}

- (void)disable
{
  v2 = [(FMIPLockScreenViewController *)self pluginController];
  BOOL v3 = sub_4588();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    objc_super v6 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "FMIPLockScreenController disabling with pluginController: %@", (uint8_t *)&v5, 0xCu);
  }

  id v4 = [v2 pluginAgent];
  [v4 deactivatePluginController:v2];
}

- (void)canCallWithCompletion:(id)a3
{
  id v4 = a3;
  CFBooleanRef v5 = (const __CFBoolean *)MGCopyAnswer();
  if (v5)
  {
    CFBooleanRef v6 = v5;
    BOOL v7 = CFBooleanGetValue(v5) != 0;
    CFRelease(v6);
  }
  else
  {
    BOOL v7 = 0;
  }
  objc_super v8 = sub_4588();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v13 = v7;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Telephone Capability: %i", buf, 8u);
  }

  if ([(FMIPLockScreenViewController *)self isDeviceActivated] && v7)
  {
    id v9 = [(FMIPLockScreenViewController *)self ctClient];
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_31B4;
    v10[3] = &unk_8430;
    v10[4] = self;
    id v11 = v4;
    [v9 getSubscriptionInfo:v10];
  }
  else if (v4)
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (BOOL)isDeviceActivated
{
  v2 = (void *)MAEGetActivationStateWithError();
  id v3 = 0;
  id v4 = sub_4588();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    objc_super v8 = v2;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "Current device activation state: %@", buf, 0xCu);
  }

  BOOL v5 = ([v2 isEqualToString:@"Activated"] & 1) != 0
    || ([v2 isEqualToString:@"WildcardActivated"] & 1) != 0
    || ([v2 isEqualToString:@"Unlocked"] & 1) != 0
    || [v2 isEqualToString:@"SoftActivation"];

  return v5;
}

- (void)updateAppearance
{
  id v4 = [(FMIPLockScreenViewController *)self pluginController];
  v2 = [v4 pluginAppearance];
  id v3 = [v4 pluginAgent];
  [v3 pluginController:v4 updateAppearance:v2];
}

- (void)setCallButtonEnabled:(BOOL)a3
{
  if (a3 && (char *)[(FMIPLockScreenViewController *)self currentState] != (char *)&dword_0 + 2)
  {
    id v4 = sub_1488(@"TAP_TO_CALL");
    BOOL v5 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v5 setPrimaryActionButtonText:v4];

    id v7 = +[UIColor systemGreenColor];
    CFBooleanRef v6 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v6 setPrimaryActionButtonBackgroundColor:v7];
  }
  else
  {
    id v7 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v7 setPrimaryActionButtonText:0];
  }
}

- (void)updateLockScreenView
{
  id v3 = +[FMDFMIPManager sharedInstance];
  id v4 = [v3 lostModeInfo];

  BOOL v5 = sub_4588();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v58 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "lostModeInfo = %@", buf, 0xCu);
  }

  -[FMIPLockScreenViewController setIsManagedLostmode:](self, "setIsManagedLostmode:", [v4 lostModeType] == (char *)&dword_0 + 3);
  CFBooleanRef v6 = sub_4588();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = [(FMIPLockScreenViewController *)self isManagedLostmode];
    *(_DWORD *)buf = 67109120;
    LODWORD(v58) = v7;
    _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "updateLockScreenView in managedLostMode %i", buf, 8u);
  }

  if (!v4 || ![v4 lostModeEnabled])
  {
    id v11 = 0;
    v12 = 0;
    BOOL v13 = 0;
    goto LABEL_31;
  }
  objc_super v8 = +[FMSystemInfo sharedInstance];
  id v9 = [v8 deviceClass];

  if ([v4 lostModeType] == (char *)&dword_4 + 1)
  {
    if ([v9 hasPrefix:@"iPad"])
    {
      id v10 = @"LOCATED_IPAD_TITLE";
      goto LABEL_22;
    }
    unsigned int v16 = [v9 hasPrefix:@"iPod"];
    CFStringRef v17 = @"LOCATED_IPHONE_TITLE";
    CFStringRef v18 = @"LOCATED_IPOD_TITLE";
  }
  else
  {
    BOOL v14 = [v4 lostModeType] == &dword_4;
    unsigned __int8 v15 = [v9 hasPrefix:@"iPad"];
    if (v14)
    {
      if (v15)
      {
        id v10 = @"ERASED_IPAD_TITLE";
        goto LABEL_22;
      }
      unsigned int v16 = [v9 hasPrefix:@"iPod"];
      CFStringRef v17 = @"ERASED_IPHONE_TITLE";
      CFStringRef v18 = @"ERASED_IPOD_TITLE";
    }
    else
    {
      if (v15)
      {
        id v10 = @"LOST_IPAD_TITLE";
        goto LABEL_22;
      }
      unsigned int v16 = [v9 hasPrefix:@"iPod"];
      CFStringRef v17 = @"LOST_IPHONE_TITLE";
      CFStringRef v18 = @"LOST_IPOD_TITLE";
    }
  }
  if (v16) {
    id v10 = (__CFString *)v18;
  }
  else {
    id v10 = (__CFString *)v17;
  }
LABEL_22:
  BOOL v13 = sub_1488(v10);
  v19 = [v4 message];
  __int16 v20 = +[NSCharacterSet newlineCharacterSet];
  v21 = [v19 componentsSeparatedByCharactersInSet:v20];
  v22 = [v21 componentsJoinedByString:@" "];

  v23 = +[NSCharacterSet whitespaceCharacterSet];
  v12 = [v22 stringByTrimmingCharactersInSet:v23];

  id v11 = [v4 phoneNumber];
  if ([v4 lostModeType] == (char *)&dword_4 + 1)
  {
    v24 = sub_1488(@"CONTINUE_BUTTON");
    v25 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v25 setSecondaryActionButtonText:v24];
  }
  else
  {
    v26 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v26 setSecondaryActionButtonText:0];

    objc_initWeak((id *)buf, self);
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_417C;
    v55[3] = &unk_8480;
    objc_copyWeak(&v56, (id *)buf);
    [(FMIPLockScreenViewController *)self canCallWithCompletion:v55];
    objc_destroyWeak(&v56);
    objc_destroyWeak((id *)buf);
  }
  BOOL v27 = [v4 lostModeType] == (char *)&dword_0 + 3;
  v28 = [v4 footnoteText];
  v29 = v28;
  if (v27)
  {
    BOOL v30 = [v28 length] == 0;

    if (v30)
    {
      v29 = sub_1488(@"DEFAULT_MANAGED_FOOTNOTE_TEXT");
    }
    else
    {
      v31 = [v4 footnoteText];
      v32 = +[NSCharacterSet newlineCharacterSet];
      v33 = [v31 componentsSeparatedByCharactersInSet:v32];
      v34 = [v33 componentsJoinedByString:@" "];

      v35 = +[NSCharacterSet whitespaceCharacterSet];
      v29 = [v34 stringByTrimmingCharactersInSet:v35];
    }
  }
  v36 = [(FMIPLockScreenViewController *)self lockScreenModalView];
  [v36 setFooterText:v29];

LABEL_31:
  if ([v12 length] || objc_msgSend(v11, "length"))
  {
    v37 = sub_4588();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v37, OS_LOG_TYPE_DEFAULT, "currentState: FMIPLockScreenStateNormal", buf, 2u);
    }

    [(FMIPLockScreenViewController *)self setCurrentState:1];
    v38 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v38 setTitleText:v13];

    v39 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v39 setSubtitleText:v12];

    uint64_t v40 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [(id)v40 setSecondarySubtitleText:v11];

    LOBYTE(v40) = [v11 length] == 0;
    [(FMIPLockScreenViewController *)self setCallButtonEnabled:0];
    if ((v40 & 1) == 0)
    {
      objc_initWeak((id *)buf, self);
      v50 = _NSConcreteStackBlock;
      uint64_t v51 = 3221225472;
      v52 = sub_42A8;
      v53 = &unk_8480;
      objc_copyWeak(&v54, (id *)buf);
      [(FMIPLockScreenViewController *)self canCallWithCompletion:&v50];
      objc_destroyWeak(&v54);
      objc_destroyWeak((id *)buf);
    }
    [(FMIPLockScreenViewController *)self updateAppearance];
  }
  else
  {
    v41 = sub_4588();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_DEFAULT, "currentState: FMIPLockScreenStateSilent", buf, 2u);
    }

    [(FMIPLockScreenViewController *)self setCurrentState:2];
    v42 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v42 setTitleText:0];

    v43 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v43 setSubtitleText:0];

    v44 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v44 setSecondarySubtitleText:0];

    v45 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v45 setPrimaryActionButtonText:0];

    v46 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v46 setSecondaryActionButtonText:0];

    v47 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v47 setFooterText:0];

    v48 = [(FMIPLockScreenViewController *)self lockScreenModalView];
    [v48 setImage:0];

    [(FMIPLockScreenViewController *)self updateAppearance];
    v49 = [(FMIPLockScreenViewController *)self view];
    [v49 setNeedsDisplay];
  }
}

- (SBLockScreenPluginController)pluginController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pluginController);

  return (SBLockScreenPluginController *)WeakRetained;
}

- (void)setPluginController:(id)a3
{
}

- (SBLockScreenModalView)lockScreenModalView
{
  return self->_lockScreenModalView;
}

- (void)setLockScreenModalView:(id)a3
{
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (void)setCurrentState:(int64_t)a3
{
  self->_currentState = a3;
}

- (BOOL)isManagedLostmode
{
  return self->_isManagedLostmode;
}

- (void)setIsManagedLostmode:(BOOL)a3
{
  self->_isManagedLostmode = a3;
}

- (NSObject)lostModeChangedToken
{
  return self->_lostModeChangedToken;
}

- (void)setLostModeChangedToken:(id)a3
{
}

- (NSObject)simStatusChangedToken
{
  return self->_simStatusChangedToken;
}

- (void)setSimStatusChangedToken:(id)a3
{
}

- (NSObject)registrationStatusChangedToken
{
  return self->_registrationStatusChangedToken;
}

- (void)setRegistrationStatusChangedToken:(id)a3
{
}

- (CoreTelephonyClient)ctClient
{
  return self->_ctClient;
}

- (void)setCtClient:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_registrationStatusChangedToken, 0);
  objc_storeStrong((id *)&self->_simStatusChangedToken, 0);
  objc_storeStrong((id *)&self->_lostModeChangedToken, 0);
  objc_storeStrong((id *)&self->_lockScreenModalView, 0);

  objc_destroyWeak((id *)&self->_pluginController);
}

@end