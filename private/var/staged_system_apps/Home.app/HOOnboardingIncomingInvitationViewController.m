@interface HOOnboardingIncomingInvitationViewController
- (BOOL)didUserTriggerOnboardingDismissal;
- (HMIncomingHomeInvitation)invitation;
- (HOOnboardingChildViewController)nextViewController;
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate;
- (HOOnboardingIncomingInvitationViewController)initWithIncomingInvitation:(id)a3;
- (HOOnboardingIncomingInvitationViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5;
- (HUIncomingInvitationResponseController)responseController;
- (HUInvitationHelper)invitationHelper;
- (NACancelable)acceptedPendingAddHomeTimeoutCancellationToken;
- (NSArray)knownContactImageConstraints;
- (NSString)segmentIdentifier;
- (OBTrayButton)declineOrIgnoreInvitationButton;
- (OBTrayButton)mainActionButton;
- (OBWelcomeController)restrictedGuestNextViewController;
- (UIActivityIndicatorView)spinner;
- (UIImageView)imageView;
- (UILabel)joiningHomeLabel;
- (id)hu_preloadContent;
- (void)_acceptInvitation;
- (void)_cancelButton:(id)a3;
- (void)_configureButtons;
- (void)_continue;
- (void)_declineInvitation:(id)a3;
- (void)_handleMainActionButton:(id)a3;
- (void)_hideSpinner;
- (void)_ignoreInvitation:(id)a3;
- (void)_ignoreOrReportAlert:(id)a3;
- (void)_reallyAcceptInvitation;
- (void)_reportJunk:(id)a3;
- (void)_showSpinner;
- (void)_updateImageConstraints;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4;
- (void)invitationUtilityDidUpdateInformation:(id)a3;
- (void)setAcceptedPendingAddHomeTimeoutCancellationToken:(id)a3;
- (void)setDeclineOrIgnoreInvitationButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidUserTriggerOnboardingDismissal:(BOOL)a3;
- (void)setImageView:(id)a3;
- (void)setIncomingInvitationDelegate:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setInvitationHelper:(id)a3;
- (void)setJoiningHomeLabel:(id)a3;
- (void)setKnownContactImageConstraints:(id)a3;
- (void)setMainActionButton:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
- (void)setResponseController:(id)a3;
- (void)setRestrictedGuestNextViewController:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HOOnboardingIncomingInvitationViewController

- (HOOnboardingIncomingInvitationViewController)initWithIncomingInvitation:(id)a3
{
  return [(HOOnboardingIncomingInvitationViewController *)self initWithIncomingInvitation:a3 invitationHelper:0 incomingInvitationDelegate:0];
}

- (HOOnboardingIncomingInvitationViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v10) {
    [v10 setMode:1];
  }
  else {
    id v10 = [objc_alloc((Class)HUInvitationHelper) initWithMode:1];
  }
  [v10 setInvitation:v9];
  v12 = [v10 detailText];
  v13 = [v10 homeInvitationTitle];
  if ([v10 isUnknownContact]) {
    CFStringRef v14 = @"person.crop.circle.badge.questionmark";
  }
  else {
    CFStringRef v14 = 0;
  }
  v38.receiver = self;
  v38.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  v15 = [(HOOnboardingIncomingInvitationViewController *)&v38 initWithTitle:v13 detailText:v12 symbolName:v14];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_invitationHelper, v10);
    [(HUInvitationHelper *)v16->_invitationHelper setDelegate:v16];
    objc_storeWeak((id *)&v16->_incomingInvitationDelegate, v11);
    p_invitation = (id *)&v16->_invitation;
    objc_storeStrong((id *)&v16->_invitation, a3);
    v18 = (HUIncomingInvitationResponseController *)[objc_alloc((Class)HUIncomingInvitationResponseController) initWithDelegate:v16 invitation:v9];
    responseController = v16->_responseController;
    v16->_responseController = v18;

    v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v9 hf_prettyDescription];
      *(_DWORD *)buf = 138412290;
      v40 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Onboarding invitation %@", buf, 0xCu);
    }
    v22 = HUImageNamed();
    if ([*p_invitation isInviteeRestrictedGuest])
    {
      v23 = +[UIImageSymbolConfiguration configurationWithPointSize:6 weight:150.0];
      uint64_t v24 = +[UIImage systemImageNamed:@"house.circle.fill" withConfiguration:v23];

      uint64_t v25 = 4;
      v22 = (void *)v24;
    }
    else
    {
      uint64_t v25 = 1;
    }
    v26 = (UIImageView *)[objc_alloc((Class)UIImageView) initWithImage:v22];
    imageView = v16->_imageView;
    v16->_imageView = v26;

    [(UIImageView *)v16->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)v16->_imageView setContentMode:v25];
    v28 = [(HOOnboardingIncomingInvitationViewController *)v16 contentView];
    [v28 addSubview:v16->_imageView];

    if ([*p_invitation isInviteeRestrictedGuest])
    {
      v29 = +[UIColor systemGray4Color];
      [(UIImageView *)v16->_imageView setTintColor:v29];
    }
    id v30 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v16 action:"_cancelButton:"];
    v31 = [(HOOnboardingIncomingInvitationViewController *)v16 navigationItem];
    [v31 setRightBarButtonItem:v30];

    [(HOOnboardingIncomingInvitationViewController *)v16 setModalInPresentation:1];
    v32 = +[HFHomeKitDispatcher sharedDispatcher];
    [v32 addHomeManagerObserver:v16];
    [v32 addHomeObserver:v16];
    if ([v9 isInviteeRestrictedGuest])
    {
      v33 = [v9 restrictedGuestSchedule];

      if (v33) {
        v34 = HOOnboardingInvitationRestrictedGuestAccessViewController;
      }
      else {
        v34 = HOOnboardingInvitationJoiningHomeViewController;
      }
      v35 = (OBWelcomeController *)[[v34 alloc] initWithIncomingInvitation:v9 invitationHelper:v10 incomingInvitationDelegate:v11];
      restrictedGuestNextViewController = v16->_restrictedGuestNextViewController;
      v16->_restrictedGuestNextViewController = v35;
    }
    [(HOOnboardingIncomingInvitationViewController *)v16 _configureButtons];
  }
  return v16;
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  [(HOOnboardingIncomingInvitationViewController *)&v3 viewDidLayoutSubviews];
  [(HOOnboardingIncomingInvitationViewController *)self _updateImageConstraints];
}

- (void)viewWillAppear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  [(HOOnboardingIncomingInvitationViewController *)&v8 viewWillAppear:a3];
  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  [v4 addHomeManagerObserver:self];
  [(HOOnboardingIncomingInvitationViewController *)self setDidUserTriggerOnboardingDismissal:0];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
    v7 = [v6 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[HOOnboardingIncomingInvitationViewController viewWillAppear:]";
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s invitation = %@.", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)HOOnboardingIncomingInvitationViewController;
  [(HOOnboardingIncomingInvitationViewController *)&v8 viewWillDisappear:a3];
  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  [v4 removeHomeManagerObserver:self];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
    v7 = [v6 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    id v10 = "-[HOOnboardingIncomingInvitationViewController viewWillDisappear:]";
    __int16 v11 = 2112;
    v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s invitation = %@.", buf, 0x16u);
  }
}

- (NSString)segmentIdentifier
{
  return (NSString *)@"OnboardingInviteFlow";
}

- (HOOnboardingChildViewController)nextViewController
{
  objc_super v3 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
  unsigned int v4 = [v3 isInviteeRestrictedGuest];

  if (v4)
  {
    v5 = [(HOOnboardingIncomingInvitationViewController *)self restrictedGuestNextViewController];
  }
  else
  {
    v5 = 0;
  }

  return (HOOnboardingChildViewController *)v5;
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    v15 = "-[HOOnboardingIncomingInvitationViewController homeManager:didAddHome:]";
    __int16 v16 = 2112;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", (uint8_t *)&v14, 0x16u);
  }

  v7 = [v5 uuid];
  objc_super v8 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
  id v9 = [v8 homeUUID];
  unsigned int v10 = [v7 hmf_isEqualToUUID:v9];

  if (v10)
  {
    __int16 v11 = [(HOOnboardingIncomingInvitationViewController *)self acceptedPendingAddHomeTimeoutCancellationToken];
    [v11 cancel];

    [(HOOnboardingIncomingInvitationViewController *)self setAcceptedPendingAddHomeTimeoutCancellationToken:0];
    v12 = +[HFHomeKitDispatcher sharedDispatcher];
    [v12 setSelectedHome:v5 userInitiated:1];

    v13 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
    [v13 invitationViewControllerDidAcceptInvitation:self];
  }
}

- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6 = a3;
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 state];
    objc_super v8 = HUStringFromIncomingInvitationResponseControllerState();
    id v9 = [v6 invitation];
    unsigned int v10 = [v9 hf_prettyDescription];
    *(_DWORD *)buf = 136315650;
    uint64_t v24 = "-[HOOnboardingIncomingInvitationViewController invitationResponseController:stateDidChange:]";
    __int16 v25 = 2114;
    v26 = v8;
    __int16 v27 = 2112;
    v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", buf, 0x20u);
  }
  switch(a4)
  {
    case 3uLL:
      __int16 v16 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
      [v16 invitationViewControllerDidDecideLaterInvitation:self];

      break;
    case 2uLL:
      if ([v6 response] == (id)1)
      {
        __int16 v11 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
        v12 = sub_10001B7C8(@"HOJoiningHome_Label_Title");
        [v11 setText:v12];

        v13 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
        [v13 sizeToFit];

        objc_initWeak((id *)buf, self);
        int v14 = +[NAScheduler mainThreadScheduler];
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_10001B9B4;
        v21[3] = &unk_1000C2398;
        objc_copyWeak(&v22, (id *)buf);
        v15 = [v14 afterDelay:v21 performBlock:120.0];
        [(HOOnboardingIncomingInvitationViewController *)self setAcceptedPendingAddHomeTimeoutCancellationToken:v15];

        objc_destroyWeak(&v22);
        objc_destroyWeak((id *)buf);
      }
      else if ([v6 response] == (id)2)
      {
        id v17 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
        [v17 invitationViewControllerDidDeclineInvitation:self];
      }
      else if ([v6 response] == (id)3)
      {
        v18 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
        [v18 invitationViewControllerDidIgnoreInvitation:self];
      }
      else if ([v6 response] == (id)4)
      {
        v19 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
        [v19 invitationViewControllerDidReportJunkInvitation:self];
      }
      else
      {
        v20 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v6 response]);
        NSLog(@"Unexpected response %@", v20);
      }
      break;
    case 1uLL:
      [(HOOnboardingIncomingInvitationViewController *)self _showSpinner];
      break;
  }
}

- (void)invitationUtilityDidUpdateInformation:(id)a3
{
  [(OBTrayButton *)self->_declineOrIgnoreInvitationButton removeTarget:self action:0 forControlEvents:64];
  unsigned int v4 = [(HOOnboardingIncomingInvitationViewController *)self buttonTray];
  [v4 removeAllButtons];

  [(HOOnboardingIncomingInvitationViewController *)self _configureButtons];
}

- (void)_configureButtons
{
  objc_super v3 = sub_10001B7C8(@"HHOUserIncomingInvitationView_ConsentNotice");
  unsigned int v4 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  id v5 = [v4 invitation];
  unsigned int v6 = [v5 isInviteeRestrictedGuest];

  if (v6)
  {

    objc_super v3 = 0;
  }
  v7 = [(HOOnboardingIncomingInvitationViewController *)self buttonTray];
  [v7 addCaptionText:v3];

  objc_super v8 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  unsigned int v9 = [v8 isUnknownContact];

  unsigned int v10 = +[OBBoldTrayButton boldButton];
  if (v9)
  {
    [(HOOnboardingIncomingInvitationViewController *)self setDeclineOrIgnoreInvitationButton:v10];

    __int16 v11 = +[OBLinkTrayButton linkButton];
    [(HOOnboardingIncomingInvitationViewController *)self setMainActionButton:v11];

    v12 = [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
    v13 = sub_10001B7C8(@"HOUserIncomingInvitationView_IgnoreButton");
    [v12 setTitle:v13 forState:0];
    int v14 = &selRef__ignoreOrReportAlert_;
  }
  else
  {
    [(HOOnboardingIncomingInvitationViewController *)self setMainActionButton:v10];

    if (+[HFUtilities isAMac]) {
      +[OBBoldTrayButton boldButton];
    }
    else {
    v15 = +[OBLinkTrayButton linkButton];
    }
    [(HOOnboardingIncomingInvitationViewController *)self setDeclineOrIgnoreInvitationButton:v15];

    v12 = [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
    v13 = sub_10001B7C8(@"HOUserIncomingInvitationView_DeclineButton");
    [v12 setTitle:v13 forState:0];
    int v14 = &selRef__declineInvitation_;
  }

  __int16 v16 = [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
  [v16 addTarget:self action:*v14 forControlEvents:64];

  id v17 = [(HOOnboardingIncomingInvitationViewController *)self headerView];
  v18 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  v19 = [v18 homeInvitationTitle];
  [v17 setTitle:v19];

  v20 = [(HOOnboardingIncomingInvitationViewController *)self headerView];
  v21 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  id v22 = [v21 detailText];
  [v20 setDetailText:v22];

  v23 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
  [v23 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v24 = [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  __int16 v25 = sub_10001B7C8(@"HOUserIncomingInvitationView_AcceptButton");
  v26 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
  [v26 setAccessibilityIdentifier:@"Home.Onboarding.Guest.JoinHome"];

  __int16 v27 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
  LODWORD(v22) = [v27 isInviteeRestrictedGuest];

  if (v22)
  {
    uint64_t v28 = sub_10001B7C8(@"HOIncomingInvitation_RestrictedGuest_JoinHomeButton");

    v29 = HFLogForCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
      v31 = [v30 hf_prettyDescription];
      v32 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
      int v42 = 136315650;
      v43 = "-[HOOnboardingIncomingInvitationViewController _configureButtons]";
      __int16 v44 = 2112;
      v45 = v31;
      __int16 v46 = 1024;
      unsigned int v47 = [v32 isInviteeRestrictedGuest];
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@. isInviteeRestrictedGuest = %{BOOL}d", (uint8_t *)&v42, 0x1Cu);
    }
    __int16 v25 = (void *)v28;
  }
  v33 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
  [v33 setTitle:v25 forState:0];

  v34 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
  [v34 addTarget:self action:"_handleMainActionButton:" forControlEvents:64];

  v35 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  unsigned int v36 = [v35 isUnknownContact];

  v37 = [(HOOnboardingIncomingInvitationViewController *)self buttonTray];
  if (v36)
  {
    objc_super v38 = [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
    [v37 addButton:v38];

    v39 = [(HOOnboardingIncomingInvitationViewController *)self buttonTray];
    [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
  }
  else
  {
    v40 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
    [v37 addButton:v40];

    v39 = [(HOOnboardingIncomingInvitationViewController *)self buttonTray];
    [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
  v41 = };
  [v39 addButton:v41];
}

- (void)_updateImageConstraints
{
  objc_super v3 = [(HOOnboardingIncomingInvitationViewController *)self knownContactImageConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  [(HOOnboardingIncomingInvitationViewController *)self setKnownContactImageConstraints:&__NSArray0__struct];
  unsigned int v4 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  LODWORD(v3) = [v4 isUnknownContact];

  id v5 = [(HOOnboardingIncomingInvitationViewController *)self imageView];
  id v22 = v5;
  if (v3)
  {
    [v5 setHidden:1];
  }
  else
  {
    [v5 setHidden:0];

    unsigned int v6 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
    [v6 bounds];
    double v8 = v7;

    if (+[HFUtilities isAMac])
    {
      unsigned int v9 = [(HOOnboardingIncomingInvitationViewController *)self view];
      [v9 frame];
      double v11 = v10 * 0.65;
    }
    else
    {
      double v11 = v8 + -82.0;
    }
    id v23 = [(UIImageView *)self->_imageView centerXAnchor];
    v12 = [(HOOnboardingIncomingInvitationViewController *)self contentView];
    v13 = [v12 centerXAnchor];
    int v14 = [v23 constraintEqualToAnchor:v13];
    v24[0] = v14;
    v15 = [(UIImageView *)self->_imageView heightAnchor];
    __int16 v16 = [(UIImageView *)self->_imageView widthAnchor];
    id v17 = [v15 constraintEqualToAnchor:v16];
    v24[1] = v17;
    v18 = [(UIImageView *)self->_imageView widthAnchor];
    v19 = [v18 constraintEqualToConstant:v11];
    v24[2] = v19;
    v20 = +[NSArray arrayWithObjects:v24 count:3];
    [(HOOnboardingIncomingInvitationViewController *)self setKnownContactImageConstraints:v20];

    v21 = [(HOOnboardingIncomingInvitationViewController *)self knownContactImageConstraints];
    +[NSLayoutConstraint activateConstraints:v21];
  }
}

- (void)_ignoreOrReportAlert:(id)a3
{
  id v18 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v27 = self;
    __int16 v28 = 2112;
    v29 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  double v7 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteActionSheet_Title");
  double v8 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
  unsigned int v9 = [v8 homeName];
  v19 = +[NSString stringWithValidatedFormat:v7, @"%@", 0, v9 validFormatSpecifiers error];

  double v10 = +[UIAlertController alertControllerWithTitle:v19 message:0 preferredStyle:0];
  objc_initWeak((id *)buf, self);
  double v11 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteActionSheet_Ignore");
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_10001C7B4;
  void v24[3] = &unk_1000C23C0;
  objc_copyWeak(v25, (id *)buf);
  v25[1] = (id)a2;
  v12 = +[UIAlertAction actionWithTitle:v11 style:0 handler:v24];

  v13 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteActionSheet_Report");
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_10001C8A0;
  v22[3] = &unk_1000C23C0;
  objc_copyWeak(v23, (id *)buf);
  v23[1] = (id)a2;
  int v14 = +[UIAlertAction actionWithTitle:v13 style:2 handler:v22];

  v15 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteActionSheet_Cancel");
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_10001C98C;
  v20[3] = &unk_1000C23E8;
  id v16 = v10;
  id v21 = v16;
  id v17 = +[UIAlertAction actionWithTitle:v15 style:1 handler:v20];

  [v16 addAction:v12];
  [v16 addAction:v14];
  [v16 addAction:v17];
  [(HOOnboardingIncomingInvitationViewController *)self presentViewController:v16 animated:1 completion:0];

  objc_destroyWeak(v23);
  objc_destroyWeak(v25);
  objc_destroyWeak((id *)buf);
}

- (void)_reportJunk:(id)a3
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = NSStringFromSelector(a2);
    int v8 = 138412546;
    unsigned int v9 = self;
    __int16 v10 = 2112;
    double v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);
  }
  double v7 = [(HOOnboardingIncomingInvitationViewController *)self responseController];
  [v7 respondToInvitationWithResponse:4];
}

- (void)_cancelButton:(id)a3
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = NSStringFromSelector(a2);
    int v12 = 138412546;
    v13 = self;
    __int16 v14 = 2112;
    v15 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v12, 0x16u);
  }
  [(HOOnboardingIncomingInvitationViewController *)self setDidUserTriggerOnboardingDismissal:1];
  double v7 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
  char v8 = objc_opt_respondsToSelector();

  unsigned int v9 = [(HOOnboardingIncomingInvitationViewController *)self incomingInvitationDelegate];
  __int16 v10 = v9;
  if (v8)
  {
    double v11 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
    [v10 didDecideLaterForInvitation:v11 viewController:self error:0];
  }
  else
  {
    [v9 invitationViewControllerDidDecideLaterInvitation:self];
  }
}

- (void)_ignoreInvitation:(id)a3
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = NSStringFromSelector(a2);
    int v8 = 138412546;
    unsigned int v9 = self;
    __int16 v10 = 2112;
    double v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);
  }
  double v7 = [(HOOnboardingIncomingInvitationViewController *)self responseController];
  [v7 respondToInvitationWithResponse:3];
}

- (void)_declineInvitation:(id)a3
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = NSStringFromSelector(a2);
    int v8 = 138412546;
    unsigned int v9 = self;
    __int16 v10 = 2112;
    double v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", (uint8_t *)&v8, 0x16u);
  }
  [(HOOnboardingIncomingInvitationViewController *)self setDidUserTriggerOnboardingDismissal:1];
  double v7 = [(HOOnboardingIncomingInvitationViewController *)self responseController];
  [v7 respondToInvitationWithResponse:2];
}

- (void)_handleMainActionButton:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [v4 currentTitle];
    double v7 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
    int v8 = [v7 hf_prettyDescription];
    *(_DWORD *)buf = 136315650;
    v19 = "-[HOOnboardingIncomingInvitationViewController _handleMainActionButton:]";
    __int16 v20 = 2112;
    id v21 = v6;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s User tapped %@ button. invitation = %@", buf, 0x20u);
  }
  unsigned int v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"(%s) Accepting invitation", "-[HOOnboardingIncomingInvitationViewController _handleMainActionButton:]");
  __int16 v10 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
  unsigned int v11 = [v10 isInviteeRestrictedGuest];
  CFStringRef v12 = @"NO";
  if (v11) {
    CFStringRef v12 = @"YES";
  }
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s invitation.isInviteeRestrictedGuest = %@.", "-[HOOnboardingIncomingInvitationViewController _handleMainActionButton:]", v12);

  __int16 v14 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
  unsigned int v15 = [v14 isInviteeRestrictedGuest];

  if (v15)
  {
    uint64_t v16 = +[NSString stringWithFormat:@"%@. Continuing to next view controller.", v13];

    [(HOOnboardingIncomingInvitationViewController *)self _continue];
    v13 = (void *)v16;
  }
  else
  {
    [(HOOnboardingIncomingInvitationViewController *)self _acceptInvitation];
  }
  id v17 = HFLogForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = (const char *)v13;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
  }
}

- (void)_continue
{
  objc_super v3 = [(HOOnboardingIncomingInvitationViewController *)self restrictedGuestNextViewController];
  unsigned int v4 = [v3 conformsToProtocol:&OBJC_PROTOCOL___HOOnboardingChildViewController];

  if (v4)
  {
    id v5 = [(HOOnboardingIncomingInvitationViewController *)self restrictedGuestNextViewController];
    if ([v5 conformsToProtocol:&OBJC_PROTOCOL___HOOnboardingChildViewController]) {
      unsigned int v6 = v5;
    }
    else {
      unsigned int v6 = 0;
    }
    id v7 = v6;

    int v8 = [(HOOnboardingIncomingInvitationViewController *)self delegate];
    [v7 setDelegate:v8];
  }
  id v10 = [(HOOnboardingIncomingInvitationViewController *)self navigationController];
  unsigned int v9 = [(HOOnboardingIncomingInvitationViewController *)self restrictedGuestNextViewController];
  [v10 pushViewController:v9 animated:1];
}

- (void)_acceptInvitation
{
  unsigned int v4 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  unsigned int v5 = [v4 isUnknownContact];

  if (v5)
  {
    unsigned int v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
      int v8 = [v7 hf_prettyDescription];
      unsigned int v9 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
      id v10 = [v9 inviterContact];
      *(_DWORD *)buf = 138412546;
      v35 = v8;
      __int16 v36 = 2112;
      v37 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "User invitation %@ is from unknown contact %@", buf, 0x16u);
    }
    unsigned int v11 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteAlert_Title");
    CFStringRef v12 = [(HOOnboardingIncomingInvitationViewController *)self invitation];
    v13 = [v12 homeName];
    __int16 v27 = +[NSString stringWithValidatedFormat:v11, @"%@", 0, v13 validFormatSpecifiers error];

    __int16 v14 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteAlert_Body");
    unsigned int v15 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
    uint64_t v16 = [v15 inviterContact];
    id v17 = [v16 givenName];
    v26 = +[NSString stringWithValidatedFormat:v14, @"%@", 0, v17 validFormatSpecifiers error];

    id v18 = +[UIAlertController alertControllerWithTitle:v27 message:v26 preferredStyle:1];
    objc_initWeak((id *)buf, self);
    v19 = sub_10001B7C8(@"HOUserIncomingInvitationView_AcceptButton");
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_10001D6E8;
    v32[3] = &unk_1000C23C0;
    objc_copyWeak(v33, (id *)buf);
    v33[1] = (id)a2;
    __int16 v20 = +[UIAlertAction actionWithTitle:v19 style:0 handler:v32];

    id v21 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteAlert_IgnoreAndReport");
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10001D7D0;
    v30[3] = &unk_1000C23C0;
    objc_copyWeak(v31, (id *)buf);
    v31[1] = (id)a2;
    __int16 v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v30];

    id v23 = sub_10001B7C8(@"HOUserIncomingInvitationView_UnknownInviteAlert_Cancel");
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10001D8BC;
    v28[3] = &unk_1000C23E8;
    id v24 = v18;
    id v29 = v24;
    __int16 v25 = +[UIAlertAction actionWithTitle:v23 style:1 handler:v28];

    [v24 addAction:v22];
    [v24 addAction:v20];
    [v24 addAction:v25];
    [(HOOnboardingIncomingInvitationViewController *)self presentViewController:v24 animated:1 completion:0];

    objc_destroyWeak(v31);
    objc_destroyWeak(v33);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(HOOnboardingIncomingInvitationViewController *)self _reallyAcceptInvitation];
  }
}

- (void)_reallyAcceptInvitation
{
  id v2 = [(HOOnboardingIncomingInvitationViewController *)self responseController];
  [v2 respondToInvitationWithResponse:1];
}

- (void)_hideSpinner
{
  objc_super v3 = [(HOOnboardingIncomingInvitationViewController *)self spinner];

  if (v3)
  {
    unsigned int v4 = [(HOOnboardingIncomingInvitationViewController *)self spinner];
    [v4 removeFromSuperview];

    [(HOOnboardingIncomingInvitationViewController *)self setSpinner:0];
  }
  unsigned int v5 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];

  if (v5)
  {
    unsigned int v6 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
    [v6 removeFromSuperview];

    [(HOOnboardingIncomingInvitationViewController *)self setJoiningHomeLabel:0];
  }
  id v7 = [(HOOnboardingIncomingInvitationViewController *)self mainActionButton];
  [v7 setHidden:0];

  int v8 = [(HOOnboardingIncomingInvitationViewController *)self declineOrIgnoreInvitationButton];
  [v8 setHidden:0];

  id v9 = [(HOOnboardingIncomingInvitationViewController *)self view];
  [v9 setNeedsLayout];
}

- (void)_showSpinner
{
  [(HOOnboardingIncomingInvitationViewController *)self _hideSpinner];
  unsigned int v3 = +[HFUtilities isAMac];
  unsigned int v4 = [(HOOnboardingIncomingInvitationViewController *)self buttonTray];
  unsigned int v5 = v4;
  if (v3) {
    [v4 setHidden:1];
  }
  else {
    [v4 removeFromSuperview];
  }

  id v6 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(HOOnboardingIncomingInvitationViewController *)self setSpinner:v6];

  id v7 = [(HOOnboardingIncomingInvitationViewController *)self spinner];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v8 = [(HOOnboardingIncomingInvitationViewController *)self spinner];
  [v8 sizeToFit];

  id v9 = [(HOOnboardingIncomingInvitationViewController *)self spinner];
  [v9 startAnimating];

  id v10 = objc_alloc_init((Class)UILabel);
  [(HOOnboardingIncomingInvitationViewController *)self setJoiningHomeLabel:v10];

  unsigned int v11 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  CFStringRef v12 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
  v13 = +[HUFontUtilities preferredFontForTextStyle:UIFontTextStyleTitle3 traits:32770];
  [v12 setFont:v13];

  __int16 v14 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
  unsigned int v15 = +[UIColor systemGrayColor];
  [v14 setTextColor:v15];

  id v16 = objc_alloc((Class)UIStackView);
  id v17 = [(HOOnboardingIncomingInvitationViewController *)self spinner];
  v35[0] = v17;
  id v18 = [(HOOnboardingIncomingInvitationViewController *)self joiningHomeLabel];
  v35[1] = v18;
  v19 = +[NSArray arrayWithObjects:v35 count:2];
  id v20 = [v16 initWithArrangedSubviews:v19];

  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v20 setAlignment:3];
  [v20 setDistribution:3];
  [v20 setSpacing:10.0];
  id v21 = [(HOOnboardingIncomingInvitationViewController *)self contentView];
  [v21 addSubview:v20];

  __int16 v22 = [(HOOnboardingIncomingInvitationViewController *)self invitationHelper];
  LODWORD(v18) = [v22 isUnknownContact];

  id v23 = [v20 topAnchor];
  if (v18)
  {
    id v24 = [(HOOnboardingIncomingInvitationViewController *)self contentView];
    __int16 v25 = [v24 bottomAnchor];
    v26 = [v23 constraintEqualToAnchor:v25 constant:20.0];
    [v26 setActive:1];

    __int16 v27 = [v20 centerXAnchor];
    [(HOOnboardingIncomingInvitationViewController *)self contentView];
  }
  else
  {
    __int16 v28 = [(HOOnboardingIncomingInvitationViewController *)self imageView];
    id v29 = [v28 bottomAnchor];
    id v30 = [v23 constraintEqualToAnchor:v29 constant:20.0];
    [v30 setActive:1];

    __int16 v27 = [v20 centerXAnchor];
    [(HOOnboardingIncomingInvitationViewController *)self imageView];
  v31 = };
  v32 = [v31 centerXAnchor];
  v33 = [v27 constraintEqualToAnchor:v32];
  [v33 setActive:1];

  v34 = [(HOOnboardingIncomingInvitationViewController *)self view];
  [v34 setNeedsLayout];
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult];
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_navigationBarDelegate);

  return (HOOnboardingChildViewControllerNavigationBarDelegate *)WeakRetained;
}

- (void)setNavigationBarDelegate:(id)a3
{
}

- (HOOnboardingChildViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (HOOnboardingChildViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didUserTriggerOnboardingDismissal
{
  return self->didUserTriggerOnboardingDismissal;
}

- (void)setDidUserTriggerOnboardingDismissal:(BOOL)a3
{
  self->didUserTriggerOnboardingDismissal = a3;
}

- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingInvitationDelegate);

  return (HOOnboardingIncomingInvitationFlowDelegate *)WeakRetained;
}

- (void)setIncomingInvitationDelegate:(id)a3
{
}

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (HUInvitationHelper)invitationHelper
{
  return self->_invitationHelper;
}

- (void)setInvitationHelper:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (NSArray)knownContactImageConstraints
{
  return self->_knownContactImageConstraints;
}

- (void)setKnownContactImageConstraints:(id)a3
{
}

- (OBTrayButton)mainActionButton
{
  return self->_mainActionButton;
}

- (void)setMainActionButton:(id)a3
{
}

- (OBTrayButton)declineOrIgnoreInvitationButton
{
  return self->_declineOrIgnoreInvitationButton;
}

- (void)setDeclineOrIgnoreInvitationButton:(id)a3
{
}

- (NACancelable)acceptedPendingAddHomeTimeoutCancellationToken
{
  return self->_acceptedPendingAddHomeTimeoutCancellationToken;
}

- (void)setAcceptedPendingAddHomeTimeoutCancellationToken:(id)a3
{
}

- (HUIncomingInvitationResponseController)responseController
{
  return self->_responseController;
}

- (void)setResponseController:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UILabel)joiningHomeLabel
{
  return self->_joiningHomeLabel;
}

- (void)setJoiningHomeLabel:(id)a3
{
}

- (OBWelcomeController)restrictedGuestNextViewController
{
  return self->_restrictedGuestNextViewController;
}

- (void)setRestrictedGuestNextViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictedGuestNextViewController, 0);
  objc_storeStrong((id *)&self->_joiningHomeLabel, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_responseController, 0);
  objc_storeStrong((id *)&self->_acceptedPendingAddHomeTimeoutCancellationToken, 0);
  objc_storeStrong((id *)&self->_declineOrIgnoreInvitationButton, 0);
  objc_storeStrong((id *)&self->_mainActionButton, 0);
  objc_storeStrong((id *)&self->_knownContactImageConstraints, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_destroyWeak((id *)&self->delegate);

  objc_destroyWeak((id *)&self->_navigationBarDelegate);
}

@end