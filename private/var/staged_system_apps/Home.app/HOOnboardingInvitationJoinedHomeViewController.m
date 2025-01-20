@interface HOOnboardingInvitationJoinedHomeViewController
- (BOOL)didUserTriggerOnboardingDismissal;
- (HMIncomingHomeInvitation)invitation;
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate;
- (HOOnboardingInvitationJoinedHomeViewController)initWithIncomingInvitation:(id)a3 delegate:(id)a4;
- (NSString)segmentIdentifier;
- (OBTrayButton)continueButton;
- (id)hu_preloadContent;
- (void)_continueButtonTapped:(id)a3;
- (void)nextButtonPressed;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidUserTriggerOnboardingDismissal:(BOOL)a3;
- (void)setIncomingInvitationDelegate:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HOOnboardingInvitationJoinedHomeViewController

- (HOOnboardingInvitationJoinedHomeViewController)initWithIncomingInvitation:(id)a3 delegate:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = sub_100042558(@"HOIncomingInvitation_RestrictedGuest_JoinedHome_Title");
  v9 = [v7 homeName];

  v10 = +[NSString stringWithValidatedFormat:v8, @"%@", 0, v9 validFormatSpecifiers error];

  v11 = +[UIImage systemImageNamed:@"house.circle.fill"];
  v22.receiver = self;
  v22.super_class = (Class)HOOnboardingInvitationJoinedHomeViewController;
  v12 = [(HOOnboardingInvitationJoinedHomeViewController *)&v22 initWithTitle:v10 detailText:0 icon:v11];

  if (v12)
  {
    objc_storeWeak((id *)&v12->_incomingInvitationDelegate, v6);
    v13 = [(HOOnboardingInvitationJoinedHomeViewController *)v12 headerView];
    [v13 setIconAccessibilityIdentifier:@"Home.Onboarding.Guest.JoinedHome.Icon"];

    v14 = [(HOOnboardingInvitationJoinedHomeViewController *)v12 headerView];
    [v14 setTitleAccessibilityIdentifier:@"Home.Onboarding.Guest.JoinedHome.Title"];

    uint64_t v15 = +[OBBoldTrayButton boldButton];
    continueButton = v12->_continueButton;
    v12->_continueButton = (OBTrayButton *)v15;

    [(OBTrayButton *)v12->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v17 = v12->_continueButton;
    v18 = sub_100042558(@"HOWelcomeView_Button_Continue");
    [(OBTrayButton *)v17 setTitle:v18 forState:0];

    [(OBTrayButton *)v12->_continueButton setAccessibilityIdentifier:@"Home.Onboarding.Guest.JoinedHome.ContinueButton"];
    [(OBTrayButton *)v12->_continueButton addTarget:v12 action:"_continueButtonTapped:" forControlEvents:64];
    v19 = [(HOOnboardingInvitationJoinedHomeViewController *)v12 buttonTray];
    [v19 addButton:v12->_continueButton];

    [(HOOnboardingInvitationJoinedHomeViewController *)v12 setModalInPresentation:1];
    v20 = [(HOOnboardingInvitationJoinedHomeViewController *)v12 navigationItem];
    [v20 setHidesBackButton:1];
  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HOOnboardingInvitationJoinedHomeViewController;
  [(HOOnboardingInvitationJoinedHomeViewController *)&v9 viewWillAppear:a3];
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(HOOnboardingInvitationJoinedHomeViewController *)self invitation];
    id v6 = [v5 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    v11 = "-[HOOnboardingInvitationJoinedHomeViewController viewWillAppear:]";
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@.", buf, 0x16u);
  }
  [(HOOnboardingInvitationJoinedHomeViewController *)self setDidUserTriggerOnboardingDismissal:0];
  id v7 = +[UIColor systemGray4Color];
  v8 = [(HOOnboardingInvitationJoinedHomeViewController *)self headerView];
  [v8 setTintColor:v7];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(HOOnboardingInvitationJoinedHomeViewController *)self invitation];
    id v7 = [v6 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    v10 = "-[HOOnboardingInvitationJoinedHomeViewController viewWillDisappear:]";
    __int16 v11 = 2112;
    __int16 v12 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);
  }
  v8.receiver = self;
  v8.super_class = (Class)HOOnboardingInvitationJoinedHomeViewController;
  [(HOOnboardingInvitationJoinedHomeViewController *)&v8 viewWillDisappear:v3];
}

- (void)_continueButtonTapped:(id)a3
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    __int16 v11 = "-[HOOnboardingInvitationJoinedHomeViewController _continueButtonTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s User tapped 'Continue' button", (uint8_t *)&v10, 0xCu);
  }

  [(HOOnboardingInvitationJoinedHomeViewController *)self setDidUserTriggerOnboardingDismissal:1];
  v5 = [(HOOnboardingInvitationJoinedHomeViewController *)self incomingInvitationDelegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = [(HOOnboardingInvitationJoinedHomeViewController *)self incomingInvitationDelegate];
  objc_super v8 = v7;
  if (v6)
  {
    objc_super v9 = [(HOOnboardingInvitationJoinedHomeViewController *)self invitation];
    [v8 didAcceptInvitation:v9 viewController:self];
  }
  else
  {
    [v7 invitationViewControllerDidAcceptInvitation:self];
  }
}

- (void)nextButtonPressed
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 136315138;
    v4 = "-[HOOnboardingInvitationJoinedHomeViewController nextButtonPressed]";
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%s User tapped 'Next' button", (uint8_t *)&v3, 0xCu);
  }
}

- (NSString)segmentIdentifier
{
  return (NSString *)@"OnboardingInviteFlow";
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult];
}

- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->navigationBarDelegate);

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

- (HMIncomingHomeInvitation)invitation
{
  return self->_invitation;
}

- (void)setInvitation:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingInvitationDelegate);

  return (HOOnboardingIncomingInvitationFlowDelegate *)WeakRetained;
}

- (void)setIncomingInvitationDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_destroyWeak((id *)&self->navigationBarDelegate);
}

@end