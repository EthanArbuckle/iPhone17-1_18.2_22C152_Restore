@interface HOOnboardingInvitationJoiningHomeViewController
- (BOOL)didPushNextViewController;
- (HMIncomingHomeInvitation)invitation;
- (HOOnboardingChildViewControllerDelegate)delegate;
- (HOOnboardingChildViewControllerNavigationBarDelegate)navigationBarDelegate;
- (HOOnboardingIncomingInvitationFlowDelegate)incomingInvitationDelegate;
- (HOOnboardingInvitationJoinedHomeViewController)joinedHomeVC;
- (HOOnboardingInvitationJoiningHomeViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5;
- (HUIncomingInvitationResponseController)responseController;
- (HUInvitationHelper)invitationHelper;
- (NACancelable)acceptedPendingAddHomeTimeoutCancellationToken;
- (NSError)acceptInvitationError;
- (NSString)segmentIdentifier;
- (UIActivityIndicatorView)spinner;
- (id)_didHomeGetAdded;
- (id)hu_preloadContent;
- (void)_cancelTimer;
- (void)_handleAppDidEnterBackground;
- (void)_handleAppDidForeground;
- (void)_hideSpinner;
- (void)_moveToNextViewController;
- (void)_showSpinner;
- (void)_startAddHomeTimeout;
- (void)dealloc;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4;
- (void)setAcceptInvitationError:(id)a3;
- (void)setAcceptedPendingAddHomeTimeoutCancellationToken:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDidPushNextViewController:(BOOL)a3;
- (void)setIncomingInvitationDelegate:(id)a3;
- (void)setInvitation:(id)a3;
- (void)setInvitationHelper:(id)a3;
- (void)setJoinedHomeVC:(id)a3;
- (void)setNavigationBarDelegate:(id)a3;
- (void)setResponseController:(id)a3;
- (void)setSpinner:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation HOOnboardingInvitationJoiningHomeViewController

- (HOOnboardingInvitationJoiningHomeViewController)initWithIncomingInvitation:(id)a3 invitationHelper:(id)a4 incomingInvitationDelegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[NSBundle mainBundle];
  v11 = @"HOIncomingInvitation_RestrictedGuest_JoiningHome_Title";
  v12 = [v10 localizedStringForKey:@"HOIncomingInvitation_RestrictedGuest_JoiningHome_Title" value:@"_" table:@"HOLocalizable"];

  if ([@"_" isEqualToString:v12])
  {
    id v36 = v9;
    id v37 = v8;
    id v38 = v7;
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v13 = sub_10003EB94();
    id v14 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
    if (v14)
    {
      id v15 = v14;
      id v35 = a4;
      uint64_t v16 = *(void *)v43;
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v43 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v42 + 1) + 8 * v17);
        v19 = +[NSBundle mainBundle];
        v20 = [v19 localizedStringForKey:@"HOIncomingInvitation_RestrictedGuest_JoiningHome_Title" value:@"HOIncomingInvitation_RestrictedGuest_JoiningHome_Title" table:v18];

        if (![(__CFString *)v20 isEqualToString:@"HOIncomingInvitation_RestrictedGuest_JoiningHome_Title"])break; {
        if (v15 == (id)++v17)
        }
        {
          id v15 = [v13 countByEnumeratingWithState:&v42 objects:v46 count:16];
          if (v15) {
            goto LABEL_4;
          }
          v20 = @"_";
          break;
        }
      }
      a4 = v35;
    }
    else
    {
      v20 = @"_";
    }

    v12 = v20;
    id v8 = v37;
    id v7 = v38;
    id v9 = v36;
  }
  if ([@"_" isEqualToString:v12]) {
    NSLog(@"Sensitive key '%@' not found!", @"HOIncomingInvitation_RestrictedGuest_JoiningHome_Title");
  }
  else {
    v11 = v12;
  }

  v21 = [v7 homeName];
  v22 = +[NSString stringWithValidatedFormat:v11, @"%@", 0, v21 validFormatSpecifiers error];

  v23 = +[UIImage systemImageNamed:@"house.circle.fill"];
  v41.receiver = self;
  v41.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  v24 = [(HOOnboardingInvitationJoiningHomeViewController *)&v41 initWithTitle:v22 detailText:0 icon:v23];

  if (v24)
  {
    v25 = [(HOOnboardingInvitationJoiningHomeViewController *)v24 headerView];
    [v25 setIconAccessibilityIdentifier:@"Home.Onboarding.Invitation.Guest.JoiningHome.Icon"];

    v26 = [(HOOnboardingInvitationJoiningHomeViewController *)v24 headerView];
    [v26 setTitleAccessibilityIdentifier:@"Home.Onboarding.Invitation.Guest.JoiningHome.Title"];

    objc_storeStrong((id *)&v24->_invitation, a3);
    objc_storeStrong((id *)&v24->_invitationHelper, a4);
    objc_storeWeak((id *)&v24->_incomingInvitationDelegate, v9);
    v27 = (HUIncomingInvitationResponseController *)[objc_alloc((Class)HUIncomingInvitationResponseController) initWithDelegate:v24 invitation:v7];
    responseController = v24->_responseController;
    v24->_responseController = v27;

    [(HOOnboardingInvitationJoiningHomeViewController *)v24 setModalInPresentation:1];
    v29 = [(HOOnboardingInvitationJoiningHomeViewController *)v24 navigationItem];
    [v29 setHidesBackButton:1];

    v30 = +[HFHomeKitDispatcher sharedDispatcher];
    [v30 addHomeManagerObserver:v24];
    v31 = [[HOOnboardingInvitationJoinedHomeViewController alloc] initWithIncomingInvitation:v7 delegate:v9];
    joinedHomeVC = v24->_joinedHomeVC;
    v24->_joinedHomeVC = v31;

    v33 = [(HOOnboardingInvitationJoiningHomeViewController *)v24 delegate];
    [(HOOnboardingInvitationJoinedHomeViewController *)v24->_joinedHomeVC setDelegate:v33];
  }
  return v24;
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  [(HOOnboardingInvitationJoiningHomeViewController *)&v4 dealloc];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  [(HOOnboardingInvitationJoiningHomeViewController *)&v5 viewDidLoad];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_handleAppDidForeground" name:UIApplicationWillEnterForegroundNotification object:0];

  objc_super v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"_handleAppDidEnterBackground" name:UIApplicationDidEnterBackgroundNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v17.receiver = self;
  v17.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  [(HOOnboardingInvitationJoiningHomeViewController *)&v17 viewWillAppear:a3];
  objc_super v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v5 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    [v5 state];
    v6 = HUStringFromIncomingInvitationResponseControllerState();
    id v7 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v8 = [v7 invitation];
    id v9 = [v8 hf_prettyDescription];
    *(_DWORD *)buf = 136315650;
    v19 = "-[HOOnboardingInvitationJoiningHomeViewController viewWillAppear:]";
    __int16 v20 = 2112;
    v21 = v6;
    __int16 v22 = 2112;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(%s) State is %@ for incoming invitation = %@.", buf, 0x20u);
  }
  [(HOOnboardingInvitationJoiningHomeViewController *)self setAcceptInvitationError:0];
  [(HOOnboardingInvitationJoiningHomeViewController *)self setDidPushNextViewController:0];
  v10 = +[UIColor systemGray4Color];
  v11 = [(HOOnboardingInvitationJoiningHomeViewController *)self headerView];
  [v11 setTintColor:v10];

  v12 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
  if ([v12 state] == (id)3)
  {
  }
  else
  {
    v13 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v14 = [v13 state];

    if (v14 != (id)2)
    {
      [(HOOnboardingInvitationJoiningHomeViewController *)self _cancelTimer];
      [(HOOnboardingInvitationJoiningHomeViewController *)self _startAddHomeTimeout];
      id v15 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
      [v15 respondToInvitationWithResponse:1];
      goto LABEL_8;
    }
  }
  id v15 = [(HOOnboardingInvitationJoiningHomeViewController *)self navigationController];
  id v16 = [v15 popToRootViewControllerAnimated:1];
LABEL_8:
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  objc_super v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v7 = [v6 invitation];
    id v8 = [v7 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    v11 = "-[HOOnboardingInvitationJoiningHomeViewController viewWillDisappear:]";
    __int16 v12 = 2112;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);
  }
  v9.receiver = self;
  v9.super_class = (Class)HOOnboardingInvitationJoiningHomeViewController;
  [(HOOnboardingInvitationJoiningHomeViewController *)&v9 viewWillDisappear:v3];
  [(HOOnboardingInvitationJoiningHomeViewController *)self _cancelTimer];
}

- (NSString)segmentIdentifier
{
  return (NSString *)@"OnboardingInviteFlow";
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 hf_minimumDescription];
    int v13 = 136315394;
    id v14 = "-[HOOnboardingInvitationJoiningHomeViewController homeManager:didAddHome:]";
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", (uint8_t *)&v13, 0x16u);
  }
  id v8 = [v5 uuid];
  objc_super v9 = [(HOOnboardingInvitationJoiningHomeViewController *)self invitation];
  v10 = [v9 homeUUID];
  unsigned int v11 = [v8 hmf_isEqualToUUID:v10];

  if (v11)
  {
    [(HOOnboardingInvitationJoiningHomeViewController *)self _moveToNextViewController];
    __int16 v12 = +[HFHomeKitDispatcher sharedDispatcher];
    [v12 setSelectedHome:v5 userInitiated:1];
  }
}

- (void)invitationResponseController:(id)a3 stateDidChange:(unint64_t)a4
{
  id v6 = a3;
  id v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v6 state];
    id v8 = HUStringFromIncomingInvitationResponseControllerState();
    objc_super v9 = [v6 invitation];
    v10 = [v9 hf_prettyDescription];
    int v24 = 136315650;
    v25 = "-[HOOnboardingInvitationJoiningHomeViewController invitationResponseController:stateDidChange:]";
    __int16 v26 = 2114;
    v27 = v8;
    __int16 v28 = 2112;
    v29 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) invitation state is %{public}@ for invitation %@", (uint8_t *)&v24, 0x20u);
  }
  if (a4 == 3)
  {
    v19 = [(HOOnboardingInvitationJoiningHomeViewController *)self incomingInvitationDelegate];
    char v20 = objc_opt_respondsToSelector();

    v21 = [(HOOnboardingInvitationJoiningHomeViewController *)self incomingInvitationDelegate];
    objc_super v17 = v21;
    if (v20)
    {
      __int16 v22 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
      v23 = [v22 error];
      [v17 invitationViewControllerDidDecideLaterInvitation:self error:v23];
    }
    else
    {
      [v21 invitationViewControllerDidDecideLaterInvitation:self];
    }
    goto LABEL_15;
  }
  if (a4 == 2 && [v6 response] == (id)1)
  {
    unsigned int v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v12 = [v6 invitation];
      int v13 = [v12 hf_prettyDescription];
      int v24 = 136315394;
      v25 = "-[HOOnboardingInvitationJoiningHomeViewController invitationResponseController:stateDidChange:]";
      __int16 v26 = 2112;
      v27 = v13;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) Starting timer for invitation %@", (uint8_t *)&v24, 0x16u);
    }
    id v14 = [(HOOnboardingInvitationJoiningHomeViewController *)self acceptedPendingAddHomeTimeoutCancellationToken];

    if (!v14) {
      [(HOOnboardingInvitationJoiningHomeViewController *)self _startAddHomeTimeout];
    }
    __int16 v15 = [(HOOnboardingInvitationJoiningHomeViewController *)self incomingInvitationDelegate];
    char v16 = objc_opt_respondsToSelector();

    if (v16)
    {
      objc_super v17 = [(HOOnboardingInvitationJoiningHomeViewController *)self incomingInvitationDelegate];
      uint64_t v18 = [v6 invitation];
      [v17 acceptedInvitationPendingForNewHome:v18];

LABEL_15:
    }
  }
}

- (id)hu_preloadContent
{
  return +[NAFuture futureWithNoResult];
}

- (void)_handleAppDidEnterBackground
{
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v5 = [v4 invitation];
    id v6 = [v5 hf_prettyDescription];
    int v7 = 136315394;
    id v8 = "-[HOOnboardingInvitationJoiningHomeViewController _handleAppDidEnterBackground]";
    __int16 v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", (uint8_t *)&v7, 0x16u);
  }
  [(HOOnboardingInvitationJoiningHomeViewController *)self _cancelTimer];
}

- (void)_cancelTimer
{
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v5 = [v4 invitation];
    id v6 = [v5 hf_prettyDescription];
    int v8 = 136315394;
    __int16 v9 = "-[HOOnboardingInvitationJoiningHomeViewController _cancelTimer]";
    __int16 v10 = 2112;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", (uint8_t *)&v8, 0x16u);
  }
  [(HOOnboardingInvitationJoiningHomeViewController *)self _hideSpinner];
  int v7 = [(HOOnboardingInvitationJoiningHomeViewController *)self acceptedPendingAddHomeTimeoutCancellationToken];
  [v7 cancel];

  [(HOOnboardingInvitationJoiningHomeViewController *)self setAcceptedPendingAddHomeTimeoutCancellationToken:0];
  [(HOOnboardingInvitationJoiningHomeViewController *)self setAcceptInvitationError:0];
}

- (void)_moveToNextViewController
{
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v5 = [v4 invitation];
    id v6 = [v5 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[HOOnboardingInvitationJoiningHomeViewController _moveToNextViewController]";
    __int16 v23 = 2112;
    int v24 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) Cancelling addHomeTimeout and moving onto the next view controller 'Home Joined' for %@", buf, 0x16u);
  }
  int v7 = [(HOOnboardingInvitationJoiningHomeViewController *)self acceptedPendingAddHomeTimeoutCancellationToken];
  [v7 cancel];

  [(HOOnboardingInvitationJoiningHomeViewController *)self setAcceptedPendingAddHomeTimeoutCancellationToken:0];
  int v8 = [(HOOnboardingInvitationJoiningHomeViewController *)self navigationController];
  __int16 v9 = [v8 visibleViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    unsigned int v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v22 = "-[HOOnboardingInvitationJoiningHomeViewController _moveToNextViewController]";
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) There's an alert presented. Dismissing that first before moving onto the next view controller", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    __int16 v12 = [(HOOnboardingInvitationJoiningHomeViewController *)self navigationController];
    int v13 = [v12 visibleViewController];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_10003D7FC;
    v19[3] = &unk_1000C2398;
    objc_copyWeak(&v20, (id *)buf);
    [v13 dismissViewControllerAnimated:1 completion:v19];

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }
  else if (![(HOOnboardingInvitationJoiningHomeViewController *)self didPushNextViewController])
  {
    id v14 = [(HOOnboardingInvitationJoiningHomeViewController *)self navigationController];
    __int16 v15 = [v14 visibleViewController];
    unsigned int v16 = [v15 isEqual:self];

    if (v16)
    {
      objc_super v17 = [(HOOnboardingInvitationJoiningHomeViewController *)self navigationController];
      uint64_t v18 = [(HOOnboardingInvitationJoiningHomeViewController *)self joinedHomeVC];
      [v17 pushViewController:v18 animated:1];

      [(HOOnboardingInvitationJoiningHomeViewController *)self setDidPushNextViewController:1];
    }
  }
}

- (void)_handleAppDidForeground
{
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = [(HOOnboardingInvitationJoiningHomeViewController *)self responseController];
    id v5 = [v4 invitation];
    id v6 = [v5 hf_prettyDescription];
    *(_DWORD *)buf = 136315394;
    __int16 v12 = "-[HOOnboardingInvitationJoiningHomeViewController _handleAppDidForeground]";
    __int16 v13 = 2112;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "(%s) invitation = %@", buf, 0x16u);
  }
  [(HOOnboardingInvitationJoiningHomeViewController *)self setDidPushNextViewController:0];
  objc_initWeak((id *)buf, self);
  int v7 = [(HOOnboardingInvitationJoiningHomeViewController *)self _didHomeGetAdded];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10003DA98;
  v9[3] = &unk_1000C3C28;
  objc_copyWeak(&v10, (id *)buf);
  id v8 = [v7 flatMap:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

- (void)_startAddHomeTimeout
{
  [(HOOnboardingInvitationJoiningHomeViewController *)self _showSpinner];
  objc_initWeak(&location, self);
  [(HOOnboardingInvitationJoiningHomeViewController *)self setAcceptInvitationError:0];
  BOOL v3 = +[NAScheduler mainThreadScheduler];
  id v5 = _NSConcreteStackBlock;
  uint64_t v6 = 3221225472;
  int v7 = sub_10003DDB4;
  id v8 = &unk_1000C2398;
  objc_copyWeak(&v9, &location);
  objc_super v4 = [v3 afterDelay:&v5 performBlock:120.0];
  -[HOOnboardingInvitationJoiningHomeViewController setAcceptedPendingAddHomeTimeoutCancellationToken:](self, "setAcceptedPendingAddHomeTimeoutCancellationToken:", v4, v5, v6, v7, v8);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (id)_didHomeGetAdded
{
  BOOL v3 = +[HFHomeKitDispatcher sharedDispatcher];
  objc_super v4 = [v3 allHomesFuture];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10003E288;
  v7[3] = &unk_1000C3C78;
  v7[4] = self;
  id v5 = [v4 flatMap:v7];

  return v5;
}

- (void)_showSpinner
{
  [(HOOnboardingInvitationJoiningHomeViewController *)self _hideSpinner];
  id v3 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
  [(HOOnboardingInvitationJoiningHomeViewController *)self setSpinner:v3];

  objc_super v4 = [(HOOnboardingInvitationJoiningHomeViewController *)self spinner];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v5 = [(HOOnboardingInvitationJoiningHomeViewController *)self spinner];
  [v5 sizeToFit];

  uint64_t v6 = [(HOOnboardingInvitationJoiningHomeViewController *)self spinner];
  [v6 startAnimating];

  id v7 = objc_alloc((Class)UIStackView);
  id v8 = [(HOOnboardingInvitationJoiningHomeViewController *)self spinner];
  v21 = v8;
  id v9 = +[NSArray arrayWithObjects:&v21 count:1];
  id v10 = [v7 initWithArrangedSubviews:v9];

  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAlignment:3];
  [v10 setDistribution:3];
  [v10 setSpacing:10.0];
  unsigned int v11 = [(HOOnboardingInvitationJoiningHomeViewController *)self contentView];
  [v11 addSubview:v10];

  __int16 v12 = [v10 topAnchor];
  __int16 v13 = [(HOOnboardingInvitationJoiningHomeViewController *)self contentView];
  id v14 = [v13 bottomAnchor];
  __int16 v15 = [v12 constraintEqualToAnchor:v14 constant:20.0];
  [v15 setActive:1];

  unsigned int v16 = [v10 centerXAnchor];
  objc_super v17 = [(HOOnboardingInvitationJoiningHomeViewController *)self contentView];
  uint64_t v18 = [v17 centerXAnchor];
  v19 = [v16 constraintEqualToAnchor:v18];
  [v19 setActive:1];

  id v20 = [(HOOnboardingInvitationJoiningHomeViewController *)self view];
  [v20 setNeedsLayout];
}

- (void)_hideSpinner
{
  id v3 = [(HOOnboardingInvitationJoiningHomeViewController *)self spinner];

  if (v3)
  {
    objc_super v4 = [(HOOnboardingInvitationJoiningHomeViewController *)self spinner];
    [v4 removeFromSuperview];

    [(HOOnboardingInvitationJoiningHomeViewController *)self setSpinner:0];
  }
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

- (NACancelable)acceptedPendingAddHomeTimeoutCancellationToken
{
  return self->_acceptedPendingAddHomeTimeoutCancellationToken;
}

- (void)setAcceptedPendingAddHomeTimeoutCancellationToken:(id)a3
{
}

- (NSError)acceptInvitationError
{
  return self->_acceptInvitationError;
}

- (void)setAcceptInvitationError:(id)a3
{
}

- (HUIncomingInvitationResponseController)responseController
{
  return self->_responseController;
}

- (void)setResponseController:(id)a3
{
}

- (HOOnboardingInvitationJoinedHomeViewController)joinedHomeVC
{
  return self->_joinedHomeVC;
}

- (void)setJoinedHomeVC:(id)a3
{
}

- (BOOL)didPushNextViewController
{
  return self->_didPushNextViewController;
}

- (void)setDidPushNextViewController:(BOOL)a3
{
  self->_didPushNextViewController = a3;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_joinedHomeVC, 0);
  objc_storeStrong((id *)&self->_responseController, 0);
  objc_storeStrong((id *)&self->_acceptInvitationError, 0);
  objc_storeStrong((id *)&self->_acceptedPendingAddHomeTimeoutCancellationToken, 0);
  objc_destroyWeak((id *)&self->_incomingInvitationDelegate);
  objc_storeStrong((id *)&self->_invitationHelper, 0);
  objc_storeStrong((id *)&self->_invitation, 0);
  objc_destroyWeak((id *)&self->delegate);

  objc_destroyWeak((id *)&self->_navigationBarDelegate);
}

@end