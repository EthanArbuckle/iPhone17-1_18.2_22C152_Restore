@interface HOOnboardingInvitationRestrictedGuestAccessViewController
- (BOOL)didUserTriggerOnboardingDismissal;
- (HMIncomingHomeInvitation)invitation;
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate;
- (HOOnboardingInvitationJoiningHomeViewController)joiningHomeVC;
- (HOOnboardingInvitationRestrictedGuestAccessViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5;
- (HUIncomingInvitationResponseController)responseController;
- (HUInvitationHelper)invitationHelper;
- (NSArray)centerListConstraints;
- (NSString)segmentIdentifier;
- (OBTrayButton)continueButton;
- (UIViewController)centerVC;
- (id)hu_preloadContent;
- (void)_cancelButton:(id)a3;
- (void)_continueButtonTapped:(id)a3;
- (void)_displayNextViewController;
- (void)_reportJunk;
- (void)_updateImageConstraints;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4;
- (void)setCenterListConstraints:(id)a3;
- (void)setCenterVC:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidUserTriggerOnboardingDismissal:(BOOL)a3;
- (void)setIncomingInvitationDelegate:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setInvitationHelper:(id)a3;
- (void)setJoiningHomeVC:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
- (void)setResponseController:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HOOnboardingInvitationRestrictedGuestAccessViewController

- (HOOnboardingInvitationRestrictedGuestAccessViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5
{
  id obj = a3;
  id v8 = a3;
  id v46 = a4;
  id v9 = a4;
  id v10 = a5;
  v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = [v8 hf_prettyDescription:obj v46];
    *(_DWORD *)buf = 136315394;
    v49 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController initWithIncomingInvitation:invitationHelper:incomi"
          "ngInvitationDelegate:]";
    __int16 v50 = 2112;
    v51 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);
  }
  v13 = sub_100040C00(@"HOIncomingInvitation_RestrictedGuest_YourAccess_Title");
  v14 = sub_100040C00(@"HOIncomingInvitation_RestrictedGuest_YourAccess_DetailText");
  id v15 = objc_alloc((Class)HUScheduleAccessViewController);
  [v8 restrictedGuestSchedule];
  v17 = v16 = v8;
  v18 = +[UIColor hf_keyColor];
  v19 = +[UIColor clearColor];
  v20 = (UIViewController *)[v15 initWithGuestAccessSchedule:v17 tintColor:v18 shouldDisplayAlwaysAllowedSchedule:0 scheduleBackgroundColor:v19 listRowBackgroundColor:0];
  centerVC = self->_centerVC;
  self->_centerVC = v20;

  v22 = +[UIImage systemImageNamed:@"calendar.circle.fill"];
  v23 = [(UIViewController *)self->_centerVC view];
  v47.receiver = self;
  v47.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  v24 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)&v47 initWithTitle:v13 detailText:v14 icon:v22 contentView:v23];

  v25 = v9;
  if (v24)
  {
    v26 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 headerView];
    [v26 setIconAccessibilityIdentifier:@"Home.Onboarding.Guest.YourSchedule.Icon"];

    v27 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 headerView];
    [v27 setTitleAccessibilityIdentifier:@"Home.Onboarding.Guest.YourSchedule.Title"];

    v28 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 headerView];
    [v28 setDetailTextAccessibilityIdentifier:@"Home.Onboarding.Guest.YourSchedule.DetailText"];

    objc_storeStrong((id *)&v24->_invitation, obj);
    objc_storeStrong((id *)&v24->_invitationHelper, v46);
    objc_storeWeak((id *)&v24->_incomingInvitationDelegate, v10);
    v29 = [[HOOnboardingInvitationJoiningHomeViewController alloc] initWithIncomingInvitation:v16 invitationHelper:v9 incomingInvitationDelegate:v10];
    joiningHomeVC = v24->_joiningHomeVC;
    v24->_joiningHomeVC = v29;

    v31 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 delegate];
    [(HOOnboardingInvitationJoiningHomeViewController *)v24->_joiningHomeVC setDelegate:v31];

    v32 = (HUIncomingInvitationResponseController *)[objc_alloc((Class)HUIncomingInvitationResponseController) initWithDelegate:v24 invitation:v16];
    responseController = v24->_responseController;
    v24->_responseController = v32;

    [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 setModalInPresentation:1];
    uint64_t v34 = +[OBBoldTrayButton boldButton];
    continueButton = v24->_continueButton;
    v24->_continueButton = (OBTrayButton *)v34;

    [(OBTrayButton *)v24->_continueButton setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = v24->_continueButton;
    v37 = sub_100040C00(@"HOContinueButtonTitle");
    [(OBTrayButton *)v36 setTitle:v37 forState:0];

    [(OBTrayButton *)v24->_continueButton setAccessibilityIdentifier:@"Home.Onboarding.Guest.ContinueButton"];
    [(OBTrayButton *)v24->_continueButton addTarget:v24 action:"_continueButtonTapped:" forControlEvents:64];
    v38 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 buttonTray];
    [v38 addButton:v24->_continueButton];

    id v39 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:v24 action:"_cancelButton:"];
    v40 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 navigationItem];
    [v40 setRightBarButtonItem:v39];

    v41 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)v24 navigationItem];
    v42 = [v41 rightBarButtonItem];
    [v42 setAccessibilityIdentifier:@"Home.Onboarding.Guest.CancelButton"];

    -[HOOnboardingInvitationRestrictedGuestAccessViewController setContentInsets:](v24, "setContentInsets:", UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    v43 = +[HFHomeKitDispatcher sharedDispatcher];
    [v43 addHomeManagerObserver:v24];
  }
  return v24;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)&v5 viewDidLoad];
  v3 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerVC];
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self addChildViewController:v3];

  v4 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerVC];
  [v4 didMoveToParentViewController:self];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)&v7 viewWillAppear:a3];
  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  [v4 addHomeManagerObserver:self];
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self setDidUserTriggerOnboardingDismissal:0];
  objc_super v5 = +[UIColor systemGray4Color];
  v6 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self headerView];
  [v6 setTintColor:v5];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)&v5 viewWillDisappear:a3];
  v4 = +[HFHomeKitDispatcher sharedDispatcher];
  [v4 removeHomeManagerObserver:self];
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self setDidUserTriggerOnboardingDismissal:0];
}

- (void)_continueButtonTapped:(id)a3
{
  id v29 = a3;
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v37 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _continueButtonTapped:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'Continue' button", buf, 0xCu);
  }

  objc_super v5 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self invitationHelper];
  unsigned int v6 = [v5 isUnknownContact];

  if (v6)
  {
    objc_super v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self invitation];
      id v9 = [v8 hf_prettyDescription];
      id v10 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self invitationHelper];
      v11 = [v10 inviterContact];
      *(_DWORD *)buf = 136315650;
      v37 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _continueButtonTapped:]";
      __int16 v38 = 2112;
      id v39 = v9;
      __int16 v40 = 2112;
      v41 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) User invitation %@ is from unknown contact %@", buf, 0x20u);
    }
    v12 = sub_100040C00(@"HOUserIncomingInvitationView_UnknownInviteAlert_Title");
    v13 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self invitation];
    v14 = [v13 homeName];
    v28 = +[NSString stringWithValidatedFormat:v12, @"%@", 0, v14 validFormatSpecifiers error];

    id v15 = sub_100040C00(@"HOUserIncomingInvitationView_UnknownInviteAlert_Body");
    v16 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self invitationHelper];
    v17 = [v16 inviterContact];
    v18 = [v17 givenName];
    v19 = +[NSString stringWithValidatedFormat:v15, @"%@", 0, v18 validFormatSpecifiers error];

    v20 = +[UIAlertController alertControllerWithTitle:v28 message:v19 preferredStyle:1];
    objc_initWeak((id *)buf, self);
    v21 = sub_100040C00(@"HOUserIncomingInvitationView_AcceptButton");
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_1000414F0;
    v34[3] = &unk_1000C3D30;
    objc_copyWeak(&v35, (id *)buf);
    v22 = +[UIAlertAction actionWithTitle:v21 style:0 handler:v34];

    [v22 setAccessibilityIdentifier:@"Home.Onboarding.Guest.IncomingInvitation.ConfirmationAlert.Accept"];
    v23 = sub_100040C00(@"HOUserIncomingInvitationView_UnknownInviteAlert_IgnoreAndReport");
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_1000415B4;
    v32[3] = &unk_1000C3D30;
    objc_copyWeak(&v33, (id *)buf);
    v24 = +[UIAlertAction actionWithTitle:v23 style:0 handler:v32];

    [v24 setAccessibilityIdentifier:@"Home.Onboarding.Guest.IncomingInvitation.ConfirmationAlert.IgnoreAndReport"];
    v25 = sub_100040C00(@"HOUserIncomingInvitationView_UnknownInviteAlert_Cancel");
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100041678;
    v30[3] = &unk_1000C23E8;
    id v26 = v20;
    id v31 = v26;
    v27 = +[UIAlertAction actionWithTitle:v25 style:1 handler:v30];

    [v27 setAccessibilityIdentifier:@"Home.Onboarding.Guest.IncomingInvitation.ConfirmationAlert.Cancel"];
    [v26 addAction:v24];
    [v26 addAction:v22];
    [v26 addAction:v27];
    [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self presentViewController:v26 animated:1 completion:0];

    objc_destroyWeak(&v33);
    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self _displayNextViewController];
  }
}

- (void)_displayNextViewController
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _displayNextViewController]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) Moving onto the next view controller 'Joining Home'", (uint8_t *)&v6, 0xCu);
  }

  v4 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self navigationController];
  objc_super v5 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self joiningHomeVC];
  [v4 pushViewController:v5 animated:1];
}

- (void)_reportJunk
{
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _reportJunk]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) User tapped button", (uint8_t *)&v5, 0xCu);
  }

  v4 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self responseController];
  [v4 respondToInvitationWithResponse:4];
}

- (void)_cancelButton:(id)a3
{
  v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    objc_super v7 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController _cancelButton:]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) User tapped 'cancel' button", (uint8_t *)&v6, 0xCu);
  }

  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self setDidUserTriggerOnboardingDismissal:1];
  int v5 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self incomingInvitationDelegate];
  [v5 invitationViewControllerDidDecideLaterInvitation:self];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HOOnboardingInvitationRestrictedGuestAccessViewController;
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)&v3 viewDidLayoutSubviews];
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self _updateImageConstraints];
}

- (void)_updateImageConstraints
{
  objc_super v3 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerListConstraints];
  +[NSLayoutConstraint deactivateConstraints:v3];

  v4 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerVC];
  int v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerVC];
  v18 = [v19 view];
  v16 = [v18 widthAnchor];
  v17 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self continueButton];
  int v6 = [v17 widthAnchor];
  objc_super v7 = [v16 constraintEqualToAnchor:v6 constant:25.0];
  v20[0] = v7;
  id v8 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerVC];
  id v9 = [v8 view];
  id v10 = [v9 centerXAnchor];
  v11 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self continueButton];
  v12 = [v11 centerXAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  v20[1] = v13;
  v14 = +[NSArray arrayWithObjects:v20 count:2];
  [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self setCenterListConstraints:v14];

  id v15 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self centerListConstraints];
  +[NSLayoutConstraint activateConstraints:v15];
}

- (NSString)segmentIdentifier
{
  return (NSString *)@"OnboardingInviteFlow";
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  int v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = [v5 name];
    id v8 = [v5 uniqueIdentifier];
    int v15 = 136315650;
    v16 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController homeManager:didAddHome:]";
    __int16 v17 = 2112;
    v18 = v7;
    __int16 v19 = 2112;
    v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) home <Name: %@, id: %@>", (uint8_t *)&v15, 0x20u);
  }
  id v9 = [v5 uuid];
  id v10 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self invitation];
  v11 = [v10 homeUUID];
  unsigned int v12 = [v9 hmf_isEqualToUUID:v11];

  if (v12)
  {
    v13 = +[HFHomeKitDispatcher sharedDispatcher];
    [v13 setSelectedHome:v5 userInitiated:1];

    v14 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self incomingInvitationDelegate];
    [v14 invitationViewControllerDidAcceptInvitation:self];
  }
}

- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6 = a3;
  objc_super v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 state];
    id v8 = HUStringFromIncomingInvitationResponseControllerState();
    id v9 = [v6 invitation];
    id v10 = [v9 hf_prettyDescription];
    int v12 = 136315650;
    v13 = "-[HOOnboardingInvitationRestrictedGuestAccessViewController invitationResponseController:stateDidChange:]";
    __int16 v14 = 2114;
    int v15 = v8;
    __int16 v16 = 2112;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", (uint8_t *)&v12, 0x20u);
  }
  if (a4 == 3)
  {
    v11 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self incomingInvitationDelegate];
    [v11 invitationViewControllerDidDecideLaterInvitation:self];
LABEL_8:

    goto LABEL_9;
  }
  if (a4 == 2)
  {
    if ([v6 response] == (id)2)
    {
      v11 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self incomingInvitationDelegate];
      [v11 invitationViewControllerDidDeclineInvitation:self];
    }
    else if ([v6 response] == (id)3)
    {
      v11 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self incomingInvitationDelegate];
      [v11 invitationViewControllerDidIgnoreInvitation:self];
    }
    else
    {
      if ([v6 response] != (id)4) {
        goto LABEL_9;
      }
      v11 = [(HOOnboardingInvitationRestrictedGuestAccessViewController *)self incomingInvitationDelegate];
      [v11 invitationViewControllerDidReportJunkInvitation:self];
    }
    goto LABEL_8;
  }
LABEL_9:
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

- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_incomingInvitationDelegate);

  return (HOOnboardingIncomingInvitationFlowDelegate *)WeakRetained;
}

- (void)setIncomingInvitationDelegate:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (HUIncomingInvitationResponseController)responseController
{
  return self->_responseController;
}

- (void)setResponseController:(id)a3
{
}

- (UIViewController)centerVC
{
  return self->_centerVC;
}

- (void)setCenterVC:(id)a3
{
}

- (HOOnboardingInvitationJoiningHomeViewController)joiningHomeVC
{
  return self->_joiningHomeVC;
}

- (void)setJoiningHomeVC:(id)a3
{
}

- (NSArray)centerListConstraints
{
  return self->_centerListConstraints;
}

- (void)setCenterListConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_centerListConstraints, 0);
  objc_storeStrong((id *)&self->_joiningHomeVC, 0);
  objc_storeStrong((id *)&self->_centerVC, 0);
  objc_storeStrong((id *)&self->_responseController, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_destroyWeak((id *)&self->_navigationBarDelegate);
}

@end