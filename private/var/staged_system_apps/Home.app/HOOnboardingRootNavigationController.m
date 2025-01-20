@interface HOOnboardingRootNavigationController
+ (id)onboardingStatesForHome:(id)a3;
+ (id)onboardingStatesForHome:(id)a3 pendingHomeIDsFromInvitations:(id)a4;
+ (id)stringForOnboardingState:(unint64_t)a3;
+ (id)stringForOnboardingStates:(id)a3;
- (BOOL)hasNextStepInRestrictedGuestIncomingInvitationFlow;
- (BOOL)isDisplayingRestrictedGuestIncomingInvitationFlow;
- (HOOnboardingIncomingInvitationViewController)invitationViewController;
- (HOOnboardingRootNavigationController)init;
- (HOOnboardingRootNavigationController)initWithCoder:(id)a3;
- (HOOnboardingRootNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (HOOnboardingRootNavigationController)initWithNibName:(id)a3 bundle:(id)a4;
- (HOOnboardingRootNavigationController)initWithOnboardingStates:(id)a3;
- (HOOnboardingRootNavigationController)initWithRootViewController:(id)a3;
- (HOOnboardingRootNavigationControllerDelegate)onboardingDelegate;
- (NSArray)onboardingStates;
- (NSArray)onboardingViewControllers;
- (id)_invitationJoinedHomeViewController;
- (id)_invitationJoiningHomeViewController;
- (id)_invitationRestrictedGuestAccessViewController;
- (id)_onboardingViewControllersForStates:(id)a3;
- (id)_viewControllerForState:(unint64_t)a3;
- (unint64_t)activeOnboardingState;
- (void)_finishedOnboarding;
- (void)_presentNextViewControllerWithCurrentViewController:(id)a3 skipRelated:(BOOL)a4;
- (void)acceptedInvitationPendingForNewHome:(id)a3;
- (void)childViewControllerDidFinish:(id)a3;
- (void)didAcceptInvitation:(id)a3 viewController:(id)a4;
- (void)didDecideLaterForInvitation:(id)a3 viewController:(id)a4 error:(id)a5;
- (void)didDeclineInvitation:(id)a3 viewController:(id)a4;
- (void)didIgnoreInvitation:(id)a3 viewController:(id)a4;
- (void)didReportJunkForInvitation:(id)a3 viewController:(id)a4;
- (void)homeManager:(id)a3 didAddHome:(id)a4;
- (void)invitationViewControllerDidAcceptInvitation:(id)a3;
- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3;
- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3 error:(id)a4;
- (void)invitationViewControllerDidDeclineInvitation:(id)a3;
- (void)invitationViewControllerDidIgnoreInvitation:(id)a3;
- (void)invitationViewControllerDidReportJunkInvitation:(id)a3;
- (void)setInvitationViewController:(id)a3;
- (void)setOnboardingDelegate:(id)a3;
- (void)setOnboardingViewControllers:(id)a3;
@end

@implementation HOOnboardingRootNavigationController

+ (id)stringForOnboardingStates:(id)a3
{
  v3 = [a3 na_map:&stru_1000C1E90];
  v4 = [v3 componentsJoinedByString:@", "];
  v5 = +[NSString stringWithFormat:@"[%@]", v4];

  return v5;
}

+ (id)onboardingStatesForHome:(id)a3 pendingHomeIDsFromInvitations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (+[HFUtilities isPressDemoModeEnabled])
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v38 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      v8 = "(%s) Bypass all onboarding states in demo mode.";
      v9 = v7;
      uint32_t v10 = 12;
LABEL_7:
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if ([v6 count])
  {
    v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      v38 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      __int16 v39 = 2112;
      id v40 = v6;
      __int16 v41 = 2112;
      id v42 = v5;
      v8 = "(%s) There are pending home IDs %@, so not creating onboarding states for home %@";
      v9 = v7;
      uint32_t v10 = 32;
      goto LABEL_7;
    }
LABEL_8:
    id v11 = &__NSArray0__struct;
    goto LABEL_9;
  }
  v7 = +[NSMutableArray array];
  v13 = +[HFHomeKitDispatcher sharedDispatcher];
  v14 = [v13 homeManager];

  v15 = [v14 incomingHomeInvitations];
  v16 = [v15 na_filter:&stru_1000C1DF0];

  unsigned int v17 = [v14 hf_hasSeenOnboardingWelcomeView];
  if (v5) {
    unsigned int v18 = v17;
  }
  else {
    unsigned int v18 = 0;
  }
  id v19 = [v14 hf_lastNewFeaturesViewVersionSeen];
  int64_t v20 = +[HOOnboardingNewFeaturesViewController newFeaturesOnboardingVersion];
  if (![v16 count])
  {
LABEL_23:
    if (!v18) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  if (!v18 || HFForceFirstTimeOnboarding())
  {
    [v7 addObject:&off_1000CB5F8];
    v21 = [v16 na_firstObjectPassingTest:&stru_1000C1E10];
    if (v21)
    {
      v22 = +[HOUtilities onboardingStatesForRestrictedGuestInvitation:v21];
      [v7 na_safeAddObjectsFromArray:v22];
    }
    v36 = v16;
    v23 = [v16 na_map:&stru_1000C1E50];
    v24 = [v23 description];

    v25 = HFLogForCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      [v21 hf_prettyDescription];
      v26 = id v35 = v19;
      +[HOOnboardingRootNavigationController stringForOnboardingStates:v7];
      v27 = int64_t v34 = v20;
      *(_DWORD *)buf = 136315906;
      v38 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      __int16 v39 = 2112;
      id v40 = v24;
      __int16 v41 = 2112;
      id v42 = v26;
      __int16 v43 = 2112;
      v44 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "(%s) incomingInvitations = %@. rgIncomingInvitation = %@. onboardingStates = %@", buf, 0x2Au);

      id v19 = v35;
      int64_t v20 = v34;
    }

    v16 = v36;
    goto LABEL_23;
  }
LABEL_24:
  if (!HFForceFirstTimeOnboarding())
  {
    if (v20 <= (uint64_t)v19 && (HFForceNewFeaturesOnboarding() & 1) == 0) {
      goto LABEL_33;
    }
    goto LABEL_32;
  }
LABEL_25:
  v28 = HFLogForCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v29 = +[NSNumber numberWithBool:HFForceFirstTimeOnboarding()];
    *(_DWORD *)buf = 136315394;
    v38 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
    __int16 v39 = 2112;
    id v40 = v29;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "(%s) *** HFForceFirstTimeOnboarding = [%@] ***", buf, 0x16u);
  }
  [v7 addObject:&off_1000CB610];
  if ((HFForceNewFeaturesOnboarding() & 1) == 0) {
    goto LABEL_33;
  }
  if ((HFForceNewFeaturesOnboarding() & 1) == 0) {
    NSLog(@"WHOOPS - we should never show both the Welcome & the New Features View");
  }
LABEL_32:
  [v7 addObject:&off_1000CB628];
LABEL_33:
  if (objc_msgSend(v5, "hf_currentUserIsRestrictedGuest"))
  {
    if ([v7 containsObject:&off_1000CB610]) {
      [v7 removeObject:&off_1000CB610];
    }
    if ([v7 containsObject:&off_1000CB628]) {
      [v7 removeObject:&off_1000CB628];
    }
    v30 = HFLogForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [v5 currentUser];
      v32 = [v31 hf_prettyDescription];
      v33 = [v5 hf_minimumDescription];
      *(_DWORD *)buf = 136315650;
      v38 = "+[HOOnboardingRootNavigationController onboardingStatesForHome:pendingHomeIDsFromInvitations:]";
      __int16 v39 = 2112;
      id v40 = v32;
      __int16 v41 = 2112;
      id v42 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "(%s) Not including 'welcome' and 'new features' because current user is RG of home. user = %@ | home = %@", buf, 0x20u);
    }
  }
  id v11 = [v7 copy];

LABEL_9:

  return v11;
}

+ (id)onboardingStatesForHome:(id)a3
{
  return [a1 onboardingStatesForHome:a3 pendingHomeIDsFromInvitations:0];
}

- (HOOnboardingRootNavigationController)init
{
  v4 = +[NSAssertionHandler currentHandler];
  id v5 = NSStringFromSelector("initWithOnboardingStates:");
  [v4 handleFailureInMethod:a2 object:self file:@"HOOnboardingRootNavigationController.m" lineNumber:48 description:@"%s is unavailable; use %@ instead"];
    "-[HOOnboardingRootNavigationController init]",
    v5);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithCoder:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  id v6 = NSStringFromSelector("initWithOnboardingStates:");
  [v5 handleFailureInMethod:a2 object:self file:@"HOOnboardingRootNavigationController.m" lineNumber:53 description:@"%s is unavailable; use %@ instead"];
    "-[HOOnboardingRootNavigationController initWithCoder:]",
    v6);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v6 = +[NSAssertionHandler currentHandler];
  v7 = NSStringFromSelector("initWithOnboardingStates:");
  [v6 handleFailureInMethod:a2 object:self file:@"HOOnboardingRootNavigationController.m" lineNumber:59 description:@"%s is unavailable; use %@ instead"];
    "-[HOOnboardingRootNavigationController initWithNibName:bundle:]",
    v7);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithRootViewController:(id)a3
{
  id v5 = +[NSAssertionHandler currentHandler];
  id v6 = NSStringFromSelector("initWithOnboardingStates:");
  [v5 handleFailureInMethod:a2 object:self file:@"HOOnboardingRootNavigationController.m" lineNumber:65 description:@"%s is unavailable; use %@ instead"];
    "-[HOOnboardingRootNavigationController initWithRootViewController:]",
    v6);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  id v6 = +[NSAssertionHandler currentHandler];
  v7 = NSStringFromSelector("initWithOnboardingStates:");
  [v6 handleFailureInMethod:a2 object:self file:@"HOOnboardingRootNavigationController.m" lineNumber:71 description:@"%s is unavailable; use %@ instead"];
    "-[HOOnboardingRootNavigationController initWithNavigationBarClass:toolbarClass:]",
    v7);

  return 0;
}

- (HOOnboardingRootNavigationController)initWithOnboardingStates:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HOOnboardingRootNavigationController;
  id v6 = [(HOOnboardingRootNavigationController *)&v21 initWithNavigationBarClass:0 toolbarClass:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_onboardingStates, a3);
    v8 = +[HFHomeKitDispatcher sharedDispatcher];
    v9 = [v8 homeManager];
    uint32_t v10 = [v9 incomingHomeInvitations];

    id v11 = [v10 firstObject];
    v12 = [[HOOnboardingIncomingInvitationViewController alloc] initWithIncomingInvitation:v11 invitationHelper:0 incomingInvitationDelegate:v7];
    invitationViewController = v7->_invitationViewController;
    v7->_invitationViewController = v12;

    [(HOOnboardingIncomingInvitationViewController *)v7->_invitationViewController setDelegate:v7];
    uint64_t v14 = [(HOOnboardingRootNavigationController *)v7 _onboardingViewControllersForStates:v5];
    onboardingViewControllers = v7->_onboardingViewControllers;
    v7->_onboardingViewControllers = (NSArray *)v14;

    v16 = +[HFHomeKitDispatcher sharedDispatcher];
    [v16 addHomeManagerObserver:v7];

    unsigned int v17 = [(HOOnboardingRootNavigationController *)v7 onboardingViewControllers];
    unsigned int v18 = [v17 firstObject];
    v22 = v18;
    id v19 = +[NSArray arrayWithObjects:&v22 count:1];
    [(HOOnboardingRootNavigationController *)v7 setViewControllers:v19];

    [(HOOnboardingRootNavigationController *)v7 setModalInPresentation:1];
  }

  return v7;
}

- (unint64_t)activeOnboardingState
{
  v3 = [(HOOnboardingRootNavigationController *)self onboardingViewControllers];
  v4 = [(HOOnboardingRootNavigationController *)self topViewController];
  id v5 = [v3 indexOfObject:v4];

  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100082980(self, v6);
    }
  }
  v7 = [(HOOnboardingRootNavigationController *)self onboardingStates];
  v8 = [v7 objectAtIndexedSubscript:v5];
  id v9 = [v8 unsignedIntegerValue];

  return (unint64_t)v9;
}

+ (id)stringForOnboardingState:(unint64_t)a3
{
  if (a3 < 7) {
    return *(&off_1000C1F78 + a3);
  }
  NSLog(@"Unknown onboarding state %lu", a2, a3);
  return @"Unknown";
}

- (BOOL)isDisplayingRestrictedGuestIncomingInvitationFlow
{
  if ([(HOOnboardingRootNavigationController *)self hasNextStepInRestrictedGuestIncomingInvitationFlow])
  {
    BOOL v3 = 1;
  }
  else
  {
    objc_opt_class();
    v4 = [(HOOnboardingRootNavigationController *)self visibleViewController];
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
    id v6 = v5;
    BOOL v3 = v6 != 0;
  }
  v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(HOOnboardingRootNavigationController *)self visibleViewController];
    uint64_t v9 = objc_opt_class();
    uint32_t v10 = +[HOOnboardingRootNavigationController stringForOnboardingState:[(HOOnboardingRootNavigationController *)self activeOnboardingState]];
    int v12 = 136315906;
    v13 = "-[HOOnboardingRootNavigationController isDisplayingRestrictedGuestIncomingInvitationFlow]";
    __int16 v14 = 1024;
    BOOL v15 = v3;
    __int16 v16 = 2112;
    uint64_t v17 = v9;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "(%s) Returning %{BOOL}d | visibleVC = %@ | states = %@", (uint8_t *)&v12, 0x26u);
  }
  return v3;
}

- (BOOL)hasNextStepInRestrictedGuestIncomingInvitationFlow
{
  objc_opt_class();
  BOOL v3 = [(HOOnboardingRootNavigationController *)self visibleViewController];
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  id v6 = [v5 invitation];
  unsigned int v7 = [v6 isInviteeRestrictedGuest];

  if (v7)
  {
    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [(HOOnboardingRootNavigationController *)self visibleViewController];
      uint64_t v10 = objc_opt_class();
      id v11 = +[HOOnboardingRootNavigationController stringForOnboardingState:[(HOOnboardingRootNavigationController *)self activeOnboardingState]];
      int v12 = [v5 invitation];
      v13 = [v12 hf_prettyDescription];
      int v22 = 136315906;
      v23 = "-[HOOnboardingRootNavigationController hasNextStepInRestrictedGuestIncomingInvitationFlow]";
      __int16 v24 = 2112;
      *(void *)v25 = v10;
      *(_WORD *)&v25[8] = 2112;
      *(void *)&v25[10] = v11;
      *(_WORD *)&v25[18] = 2112;
      *(void *)&v25[20] = v13;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Returning YES | visibleVC = %@ | states = %@ | invitation = %@", (uint8_t *)&v22, 0x2Au);
    }
    LOBYTE(v14) = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v15 = [(HOOnboardingRootNavigationController *)self visibleViewController];
    if (objc_opt_isKindOfClass()) {
      __int16 v16 = v15;
    }
    else {
      __int16 v16 = 0;
    }
    if (v16)
    {
      BOOL v14 = 1;
    }
    else
    {
      objc_opt_class();
      uint64_t v17 = [(HOOnboardingRootNavigationController *)self visibleViewController];
      if (objc_opt_isKindOfClass()) {
        __int16 v18 = v17;
      }
      else {
        __int16 v18 = 0;
      }
      BOOL v14 = v18 != 0;
    }
    v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [(HOOnboardingRootNavigationController *)self visibleViewController];
      int64_t v20 = +[HOOnboardingRootNavigationController stringForOnboardingState:[(HOOnboardingRootNavigationController *)self activeOnboardingState]];
      int v22 = 136315906;
      v23 = "-[HOOnboardingRootNavigationController hasNextStepInRestrictedGuestIncomingInvitationFlow]";
      __int16 v24 = 1024;
      *(_DWORD *)v25 = v14;
      *(_WORD *)&v25[4] = 2112;
      *(void *)&v25[6] = v19;
      *(_WORD *)&v25[14] = 2112;
      *(void *)&v25[16] = v20;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Returning %{BOOL}d | visibleVC = %@ | activeOnboardingState = %@", (uint8_t *)&v22, 0x26u);
    }
  }

  return v14;
}

- (void)invitationViewControllerDidIgnoreInvitation:(id)a3
{
}

- (void)didIgnoreInvitation:(id)a3 viewController:(id)a4
{
  id v9 = a3;
  [(HOOnboardingRootNavigationController *)self _presentNextViewControllerWithCurrentViewController:a4 skipRelated:1];
  id v6 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
    [v8 onboardingNavigationController:self didIgnoreInvitation:v9];
  }
}

- (void)invitationViewControllerDidDeclineInvitation:(id)a3
{
}

- (void)didDeclineInvitation:(id)a3 viewController:(id)a4
{
  id v9 = a3;
  [(HOOnboardingRootNavigationController *)self _presentNextViewControllerWithCurrentViewController:a4 skipRelated:1];
  id v6 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    v8 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
    [v8 onboardingNavigationController:self didDeclineInvitation:v9];
  }
}

- (void)invitationViewControllerDidAcceptInvitation:(id)a3
{
}

- (void)didAcceptInvitation:(id)a3 viewController:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v6 hf_prettyDescription];
    int v13 = 136315650;
    BOOL v14 = "-[HOOnboardingRootNavigationController didAcceptInvitation:viewController:]";
    __int16 v15 = 2112;
    __int16 v16 = v9;
    __int16 v17 = 2112;
    id v18 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "(%s) Did accept invitation %@ | viewController %@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v10 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    int v12 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
    [v12 onboardingNavigationController:self didAcceptInvitation:v6];
  }
  [(HOOnboardingRootNavigationController *)self _finishedOnboarding];
}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3 error:(id)a4
{
}

- (void)didDecideLaterForInvitation:(id)a3 viewController:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = [v8 hf_prettyDescription];
    int v17 = 136315906;
    id v18 = "-[HOOnboardingRootNavigationController didDecideLaterForInvitation:viewController:error:]";
    __int16 v19 = 2112;
    int64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "(%s) Deciding later for invitation %@ | viewController %@ | error %@", (uint8_t *)&v17, 0x2Au);
  }
  [(HOOnboardingRootNavigationController *)self _presentNextViewControllerWithCurrentViewController:v9 skipRelated:1];
  if (v10)
  {
    int v13 = +[HFErrorHandler sharedHandler];
    [v13 handleError:v10 operationType:HFOperationAcceptInvitation options:0 retryBlock:0 cancelBlock:0];
  }
  BOOL v14 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    __int16 v16 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
    [v16 onboardingNavigationController:self didDecideLaterInvitation:v8 error:v10];
  }
}

- (void)invitationViewControllerDidDecideLaterInvitation:(id)a3
{
}

- (void)invitationViewControllerDidReportJunkInvitation:(id)a3
{
}

- (void)didReportJunkForInvitation:(id)a3 viewController:(id)a4
{
  id v9 = a3;
  [(HOOnboardingRootNavigationController *)self _presentNextViewControllerWithCurrentViewController:a4 skipRelated:1];
  id v6 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
    [v8 onboardingNavigationController:self didReportJunkInvitation:v9];
  }
}

- (void)acceptedInvitationPendingForNewHome:(id)a3
{
  id v7 = a3;
  v4 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
    [v6 onboardingNavigationController:self acceptedInvitationAndWaitingForHomeToLand:v7];
  }
}

- (void)childViewControllerDidFinish:(id)a3
{
}

- (void)homeManager:(id)a3 didAddHome:(id)a4
{
  id v5 = a4;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315394;
    BOOL v14 = "-[HOOnboardingRootNavigationController homeManager:didAddHome:]";
    __int16 v15 = 2112;
    *(void *)__int16 v16 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "(%s) home = %@.", (uint8_t *)&v13, 0x16u);
  }

  [v5 hf_homeHasMigratedIntoHomeApp];
  unsigned int v7 = [v5 hf_homeHasMigratedIntoHomeApp];
  unsigned int v8 = [(HOOnboardingRootNavigationController *)self isDisplayingRestrictedGuestIncomingInvitationFlow];
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [(HOOnboardingRootNavigationController *)self visibleViewController];
    char v11 = [(HOOnboardingRootNavigationController *)self onboardingStates];
    int v12 = +[HOOnboardingRootNavigationController stringForOnboardingStates:v11];
    int v13 = 136316418;
    BOOL v14 = "-[HOOnboardingRootNavigationController homeManager:didAddHome:]";
    __int16 v15 = 1024;
    *(_DWORD *)__int16 v16 = v7 & (v8 ^ 1);
    *(_WORD *)&v16[4] = 1024;
    *(_DWORD *)&v16[6] = v7;
    __int16 v17 = 1024;
    unsigned int v18 = v8;
    __int16 v19 = 2112;
    int64_t v20 = v10;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "(%s) shouldFinishOnboarding = %{BOOL}d | hasMigrated = %{BOOL}d | isRGFlow = %{BOOL}d | visibleVC = %@ | states = %@", (uint8_t *)&v13, 0x32u);
  }
  if ((v7 & (v8 ^ 1)) != 0) {
    [(HOOnboardingRootNavigationController *)self _finishedOnboarding];
  }
}

- (void)_finishedOnboarding
{
  BOOL v3 = +[HFHomeKitDispatcher sharedDispatcher];
  v4 = [v3 home];
  id v5 = [v4 hf_setHomeHasMigratedServicesToAccessories:1];

  id v6 = +[HFHomeKitDispatcher sharedDispatcher];
  [v6 removeHomeManagerObserver:self];

  id v7 = [(HOOnboardingRootNavigationController *)self onboardingDelegate];
  [v7 onboardingNavigationControllerDidFinish:self];
}

- (void)_presentNextViewControllerWithCurrentViewController:(id)a3 skipRelated:(BOOL)a4
{
  id v6 = a3;
  id v7 = [(HOOnboardingRootNavigationController *)self onboardingViewControllers];
  id v8 = [v7 indexOfObject:v6];

  if (v8 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    [(HOOnboardingRootNavigationController *)self _finishedOnboarding];
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      id v9 = [v6 segmentIdentifier];
    }
    else
    {
      id v9 = 0;
    }
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000137F8;
    v38[3] = &unk_1000C1EB8;
    id v40 = v8;
    v38[4] = self;
    BOOL v41 = a4;
    id v10 = v9;
    id v39 = v10;
    char v11 = sub_1000137F8((uint64_t)v38);
    int v12 = v11;
    if (v11)
    {
      if ([v11 conformsToProtocol:&OBJC_PROTOCOL___HUPreloadableViewController]) {
        id v13 = [(HOOnboardingRootNavigationController *)self hu_pushPreloadableViewController:v12 animated:1];
      }
      else {
        [(HOOnboardingRootNavigationController *)self pushViewController:v12 animated:1];
      }
    }
    else
    {
      BOOL v14 = +[HFHomeKitDispatcher sharedDispatcher];
      __int16 v15 = [v14 home];

      __int16 v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v43 = v15;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Finished presenting view controillers for App Onboarding. home = %@", buf, 0xCu);
      }

      __int16 v17 = +[HFHomeKitDispatcher sharedDispatcher];
      unsigned int v18 = [v17 homeManager];
      [v18 hf_setHasSeenOnboardingWelcomeView:1];

      int64_t v20 = +[HFHomeKitDispatcher sharedDispatcher];
      __int16 v21 = [v20 homeManager];
      id v22 = [v21 hf_setSeenNewFeaturesViewVersion:[HOOnboardingNewFeaturesViewController newFeaturesOnboardingVersion]];

      if (v15)
      {
        id v23 = [v15 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:1];
        [(HOOnboardingRootNavigationController *)self _finishedOnboarding];
      }
      else
      {
        id v24 = [objc_alloc((Class)HFHomeBuilder) initWithExistingObject:0 inHome:0];
        v25 = HULocalizedString();
        [v24 setName:v25];

        v26 = [v24 commitItem];
        v36[0] = _NSConcreteStackBlock;
        v36[1] = 3221225472;
        v36[2] = sub_100013914;
        v36[3] = &unk_1000C1EE0;
        id v27 = v24;
        id v37 = v27;
        v28 = [v26 recover:v36];

        objc_initWeak((id *)buf, self);
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_1000139FC;
        v34[3] = &unk_1000C1F08;
        objc_copyWeak(&v35, (id *)buf);
        id v29 = [v28 addSuccessBlock:v34];
        v32[0] = _NSConcreteStackBlock;
        v32[1] = 3221225472;
        v32[2] = sub_100013AC0;
        v32[3] = &unk_1000C1F30;
        id v30 = v27;
        id v33 = v30;
        id v31 = [v28 addFailureBlock:v32];

        objc_destroyWeak(&v35);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

- (id)_onboardingViewControllersForStates:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100013CAC;
  v7[3] = &unk_1000C1F58;
  objc_copyWeak(&v8, &location);
  id v5 = [v4 na_map:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);

  return v5;
}

- (id)_viewControllerForState:(unint64_t)a3
{
  id v5 = +[HFHomeKitDispatcher sharedDispatcher];
  id v6 = [v5 homeManager];
  id v7 = [v6 incomingHomeInvitations];

  id v8 = [v7 firstObject];
  id v9 = v8;
  id v10 = 0;
  switch(a3)
  {
    case 0uLL:
      if (!v8) {
        goto LABEL_14;
      }
      id v11 = [(HOOnboardingRootNavigationController *)self invitationViewController];
      goto LABEL_13;
    case 1uLL:
      int v12 = HOOnboardingWelcomeViewController;
      goto LABEL_6;
    case 2uLL:
      int v12 = HOOnboardingNewFeaturesViewController;
LABEL_6:
      id v11 = [[v12 alloc] initWithDelegate:self];
      goto LABEL_13;
    case 4uLL:
      if (![v8 isInviteeRestrictedGuest]) {
        goto LABEL_14;
      }
      id v11 = [(HOOnboardingRootNavigationController *)self _invitationRestrictedGuestAccessViewController];
      goto LABEL_13;
    case 5uLL:
      if (![v8 isInviteeRestrictedGuest]) {
        goto LABEL_14;
      }
      id v11 = [(HOOnboardingRootNavigationController *)self _invitationJoiningHomeViewController];
      goto LABEL_13;
    case 6uLL:
      if ([v8 isInviteeRestrictedGuest])
      {
        id v11 = [(HOOnboardingRootNavigationController *)self _invitationJoinedHomeViewController];
LABEL_13:
        id v10 = v11;
      }
      else
      {
LABEL_14:
        id v10 = 0;
      }
LABEL_15:

      return v10;
    default:
      goto LABEL_15;
  }
}

- (id)_invitationRestrictedGuestAccessViewController
{
  objc_opt_class();
  BOOL v3 = [(HOOnboardingRootNavigationController *)self invitationViewController];
  id v4 = [v3 nextViewController];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (id)_invitationJoiningHomeViewController
{
  BOOL v3 = [(HOOnboardingRootNavigationController *)self _invitationRestrictedGuestAccessViewController];
  id v4 = [v3 nextViewController];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v7 = [(HOOnboardingRootNavigationController *)self invitationViewController];
    id v6 = [v7 nextViewController];
  }
  objc_opt_class();
  id v8 = v6;
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  id v10 = v9;

  return v10;
}

- (id)_invitationJoinedHomeViewController
{
  objc_opt_class();
  BOOL v3 = [(HOOnboardingRootNavigationController *)self _invitationJoiningHomeViewController];
  id v4 = [v3 nextViewController];
  if (objc_opt_isKindOfClass()) {
    id v5 = v4;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (HOOnboardingRootNavigationControllerDelegate)onboardingDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_onboardingDelegate);

  return (HOOnboardingRootNavigationControllerDelegate *)WeakRetained;
}

- (void)setOnboardingDelegate:(id)a3
{
}

- (NSArray)onboardingStates
{
  return self->_onboardingStates;
}

- (NSArray)onboardingViewControllers
{
  return self->_onboardingViewControllers;
}

- (void)setOnboardingViewControllers:(id)a3
{
}

- (HOOnboardingIncomingInvitationViewController)invitationViewController
{
  return self->_invitationViewController;
}

- (void)setInvitationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invitationViewController, 0);
  objc_storeStrong((id *)&self->_onboardingViewControllers, 0);
  objc_storeStrong((id *)&self->_onboardingStates, 0);

  objc_destroyWeak((id *)&self->_onboardingDelegate);
}

@end