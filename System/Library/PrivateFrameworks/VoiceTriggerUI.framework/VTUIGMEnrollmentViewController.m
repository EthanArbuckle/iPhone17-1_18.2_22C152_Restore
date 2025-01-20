@interface VTUIGMEnrollmentViewController
- (VTUIGMEnrollmentViewController)initWithCSFAvailability:(id)a3 delegate:(id)a4;
- (VTUIGMEnrollmentViewController)initWithDelegate:(id)a3;
- (VTUIGMEnrollmentViewController)initWithEnrollmentType:(unint64_t)a3 delegate:(id)a4;
- (void)_continueFromGMEnrollment;
- (void)_enrollUserIntoWaitlist;
- (void)_presentEnrollmentErrorWithCompletion:(id)a3;
- (void)_setupContent;
- (void)_userDidTapCancelButton;
- (void)_userDidTapContinueButton;
- (void)_userDidTapSetupLaterButton;
- (void)onboardingController:(id)a3 requestsPushingTo:(id)a4;
- (void)onboardingControllerRequestsGoingBack:(id)a3;
- (void)userDidCancel;
- (void)viewDidLoad;
@end

@implementation VTUIGMEnrollmentViewController

- (VTUIGMEnrollmentViewController)initWithCSFAvailability:(id)a3 delegate:(id)a4
{
  objc_storeStrong((id *)&self->_availability, a3);
  id v6 = a4;
  v7 = [(VTUIGMEnrollmentViewController *)self initWithDelegate:v6];

  return v7;
}

- (VTUIGMEnrollmentViewController)initWithDelegate:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(_TtC14VoiceTriggerUI23GMAvailabilityViewModel);
  viewModel = self->_viewModel;
  self->_viewModel = v5;

  v7 = [(VTUIGMEnrollmentViewController *)self initWithEnrollmentType:[(GMAvailabilityViewModel *)self->_viewModel enrollmentType] delegate:v4];
  return v7;
}

- (VTUIGMEnrollmentViewController)initWithEnrollmentType:(unint64_t)a3 delegate:(id)a4
{
  id v6 = a4;
  v7 = +[VTUIStyle sharedStyle];
  self->_enrollmentType = a3;
  v8 = [(GMAvailabilityViewModel *)self->_viewModel titleKeyWithEnrollmentType:a3];
  v9 = [(GMAvailabilityViewModel *)self->_viewModel subtitleKeyWithEnrollmentType:a3];
  v10 = +[VTUIStyle sharedStyle];
  v11 = [v10 VTUIDeviceSpecificString:v8];

  v12 = +[VTUIStyle sharedStyle];
  v13 = [v12 VTUIDeviceSpecificString:v9];

  v14 = objc_alloc_init(_TtC14VoiceTriggerUI20GMHeaderIconProvider);
  headerIconProvider = self->_headerIconProvider;
  self->_headerIconProvider = v14;

  v19.receiver = self;
  v19.super_class = (Class)VTUIGMEnrollmentViewController;
  v16 = [(VTUIGMEnrollmentViewController *)&v19 initWithTitle:v11 detailText:v13 icon:0];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_delegate, v6);
    [(VTUIGMEnrollmentViewController *)v17 _setupContent];
  }

  return v17;
}

- (void)_setupContent
{
  v70[4] = *MEMORY[0x263EF8340];
  v63 = +[VTUIStyle sharedStyle];
  v3 = [MEMORY[0x263F82DA0] currentTraitCollection];
  if ([v3 userInterfaceStyle] == 2)
  {

LABEL_3:
    headerIconProvider = self->_headerIconProvider;
    v5 = [MEMORY[0x263F825C8] systemWhiteColor];
    uint64_t v6 = [MEMORY[0x263F825C8] systemBlackColor];
    goto LABEL_10;
  }
  v7 = +[VTUIStyle sharedStyle];
  if (([v7 isIpad] & 1) != 0
    || ![(GMAvailabilityViewModel *)self->_viewModel isBuddyOrCFU])
  {
  }
  else
  {
    unint64_t enrollmentType = self->_enrollmentType;

    if (enrollmentType == 1) {
      goto LABEL_3;
    }
  }
  headerIconProvider = self->_headerIconProvider;
  v5 = [MEMORY[0x263F825C8] systemBlackColor];
  uint64_t v6 = [MEMORY[0x263F825C8] systemWhiteColor];
LABEL_10:
  v9 = (void *)v6;
  v10 = [(GMHeaderIconProvider *)headerIconProvider imageViewWithLabelWithLabelFontSize:v5 labelBackgroundColor:v6 labelForegroundColor:18.0];

  v11 = [(VTUIGMEnrollmentViewController *)self headerView];
  v12 = [v11 customIconContainerView];
  [v12 setClipsToBounds:0];

  v13 = [(VTUIGMEnrollmentViewController *)self headerView];
  v14 = [v13 customIconContainerView];
  [v14 addSubview:v10];

  v55 = (void *)MEMORY[0x263F08938];
  v59 = [v10 centerXAnchor];
  v60 = [(VTUIGMEnrollmentViewController *)self headerView];
  v58 = [v60 customIconContainerView];
  v57 = [v58 centerXAnchor];
  v56 = [v59 constraintEqualToAnchor:v57];
  v70[0] = v56;
  v54 = [v10 centerYAnchor];
  v15 = [(VTUIGMEnrollmentViewController *)self headerView];
  v16 = [v15 customIconContainerView];
  v17 = [v16 centerYAnchor];
  v18 = [v54 constraintEqualToAnchor:v17];
  v70[1] = v18;
  objc_super v19 = [v10 heightAnchor];
  v20 = [v19 constraintEqualToConstant:80.0];
  v70[2] = v20;
  v62 = v10;
  v21 = [v10 widthAnchor];
  v22 = [v21 constraintEqualToConstant:80.0];
  v70[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v70 count:4];
  [v55 activateConstraints:v23];

  v24 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v25 = self->_enrollmentType;
    v26 = v24;
    *(_DWORD *)buf = 136315650;
    v65 = "-[VTUIGMEnrollmentViewController _setupContent]";
    __int16 v66 = 2048;
    unint64_t v67 = v25;
    __int16 v68 = 1024;
    int v69 = [v63 isBuddyOrFollowUp];
    _os_log_impl(&dword_238878000, v26, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Setting up GM Info Sheet with enrollmentType: %lu, launched from buddy/cfu: %d", buf, 0x1Cu);
  }
  uint64_t v27 = [MEMORY[0x263F827E8] _systemImageNamed:@"text.line.2.summary"];
  v28 = [v63 VTUIDeviceSpecificString:@"GM_NEW_TOOLS_TO_EXPRESS_TITLE"];
  v29 = [v63 VTUIDeviceSpecificString:@"GM_NEW_TOOLS_TO_EXPRESS_DESC"];
  v30 = [MEMORY[0x263F825C8] systemBlueColor];
  v61 = (void *)v27;
  [(VTUIGMEnrollmentViewController *)self addBulletedListItemWithTitle:v28 description:v29 image:v27 tintColor:v30];

  v31 = [MEMORY[0x263F827E8] _systemImageNamed:@"siri"];
  v32 = [v63 VTUIDeviceSpecificString:@"GM_DO_MORE_WITH_SIRI_TITLE"];
  v33 = [v63 VTUIDeviceSpecificString:@"GM_DO_MORE_WITH_SIRI_DESC"];
  v34 = [MEMORY[0x263F825C8] systemBlueColor];
  [(VTUIGMEnrollmentViewController *)self addBulletedListItemWithTitle:v32 description:v33 image:v31 tintColor:v34];

  v35 = [MEMORY[0x263F827E8] _systemImageNamed:@"apple.logo.lock"];
  v36 = [v63 VTUIDeviceSpecificString:@"GM_BUILT_FOR_PRIVACY_TITLE"];
  v37 = [v63 VTUIDeviceSpecificString:@"GM_BUILT_FOR_PRIVACY_DESC"];
  v38 = [MEMORY[0x263F825C8] systemBlueColor];
  [(VTUIGMEnrollmentViewController *)self addBulletedListItemWithTitle:v36 description:v37 image:v35 tintColor:v38];

  v39 = [MEMORY[0x263F5B898] boldButton];
  continueButton = self->continueButton;
  self->continueButton = v39;

  v41 = [(GMAvailabilityViewModel *)self->_viewModel continueButtonTitleKeyWithEnrollmentType:self->_enrollmentType];
  v42 = self->continueButton;
  v43 = [v63 VTUIDeviceSpecificString:v41];
  [(OBTrayButton *)v42 setTitle:v43 forState:0];

  [(OBTrayButton *)self->continueButton addTarget:self action:sel__userDidTapContinueButton forControlEvents:64];
  v44 = [(VTUIGMEnrollmentViewController *)self buttonTray];
  [v44 addButton:self->continueButton];

  if (!self->_enrollmentType)
  {
    v45 = [MEMORY[0x263F5B8D0] linkButton];
    if ([(GMAvailabilityViewModel *)self->_viewModel isBuddy]) {
      v46 = @"BUTTON_SET_UP_LATER";
    }
    else {
      v46 = @"BUTTON_CONS_NOT_NOW";
    }
    v47 = [v63 VTUIDeviceSpecificString:v46];
    [v45 setTitle:v47 forState:0];

    [v45 addTarget:self action:sel__userDidTapCancelButton forControlEvents:64];
    v48 = [(VTUIGMEnrollmentViewController *)self buttonTray];
    [v48 addButton:v45];
  }
  if ([(GMAvailabilityViewModel *)self->_viewModel isBuddy] && self->_enrollmentType == 1)
  {
    v49 = [MEMORY[0x263F5B8D0] linkButton];
    v50 = [v63 VTUIDeviceSpecificString:@"BUTTON_SET_UP_LATER"];
    [v49 setTitle:v50 forState:0];

    [v49 addTarget:self action:sel__userDidTapSetupLaterButton forControlEvents:64];
    v51 = [(VTUIGMEnrollmentViewController *)self buttonTray];
    [v51 addButton:v49];
  }
  v52 = [(VTUIGMEnrollmentViewController *)self buttonTray];
  v53 = [MEMORY[0x263F5B8F0] linkWithBundleIdentifier:@"com.apple.onboarding.intelligenceengine"];
  [v52 setPrivacyLinkController:v53];
}

- (void)_userDidTapSetupLaterButton
{
  if (self->_enrollmentType == 1)
  {
    id v3 = objc_alloc_init(MEMORY[0x263F32BB0]);
    [v3 setIsOptedIn:0];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)&self->_delegate);
    [v6 siriGMIntroViewControllerNotNowPressed:self];
  }
  else
  {
    [(VTUIGMEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  viewModel = self->_viewModel;
  unint64_t enrollmentType = self->_enrollmentType;
  [(GMAvailabilityViewModel *)viewModel sendCancelEventWithEnrollmentType:enrollmentType];
}

- (void)_presentEnrollmentErrorWithCompletion:(id)a3
{
  id v4 = a3;
  id v12 = +[VTUIStyle sharedStyle];
  char v5 = [v12 VTUIDeviceSpecificString:@"GM_JOIN_WAITLIST_ERROR_MESSAGE"];
  id v6 = (void *)MEMORY[0x263F82418];
  v7 = [v12 VTUIDeviceSpecificString:@"GM_JOIN_WAITLIST_ERROR_TITLE"];
  v8 = [v6 alertControllerWithTitle:v7 message:v5 preferredStyle:1];

  v9 = (void *)MEMORY[0x263F82400];
  v10 = [v12 VTUIDeviceSpecificString:@"GM_JOIN_WAITLIST_ERROR_BUTTON_TITLE"];
  v11 = [v9 actionWithTitle:v10 style:1 handler:0];

  [v8 addAction:v11];
  [(VTUIGMEnrollmentViewController *)self presentViewController:v8 animated:1 completion:v4];
}

- (void)_enrollUserIntoWaitlist
{
  objc_initWeak(&location, self);
  [(OBTrayButton *)self->continueButton showsBusyIndicator];
  id v3 = (void *)MEMORY[0x263F32BA0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __57__VTUIGMEnrollmentViewController__enrollUserIntoWaitlist__block_invoke;
  v4[3] = &unk_264D4CA68;
  objc_copyWeak(&v5, &location);
  [v3 getTicketForFeature:@"cloud.llm" withCompletionHandler:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __57__VTUIGMEnrollmentViewController__enrollUserIntoWaitlist__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __57__VTUIGMEnrollmentViewController__enrollUserIntoWaitlist__block_invoke_2;
  block[3] = &unk_264D4C2F8;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v12);
}

void __57__VTUIGMEnrollmentViewController__enrollUserIntoWaitlist__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = VTUILogContextFacility;
    BOOL v5 = os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        uint64_t v6 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315394;
        id v11 = "-[VTUIGMEnrollmentViewController _enrollUserIntoWaitlist]_block_invoke";
        __int16 v12 = 2112;
        uint64_t v13 = v6;
        _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment from buddy getTicketForFeature: received an error. Bailing! Error: %@", buf, 0x16u);
      }
      v9[0] = MEMORY[0x263EF8330];
      v9[1] = 3221225472;
      v9[2] = __57__VTUIGMEnrollmentViewController__enrollUserIntoWaitlist__block_invoke_69;
      v9[3] = &unk_264D4C280;
      v9[4] = WeakRetained;
      [WeakRetained _presentEnrollmentErrorWithCompletion:v9];
    }
    else
    {
      if (v5)
      {
        uint64_t v8 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 136315394;
        id v11 = "-[VTUIGMEnrollmentViewController _enrollUserIntoWaitlist]_block_invoke_2";
        __int16 v12 = 2112;
        uint64_t v13 = v8;
        _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment from buddy getTicketForFeature: cloud.llm ticket: %@", buf, 0x16u);
      }
      [WeakRetained[154] hidesBusyIndicator];
      [WeakRetained _continueFromGMEnrollment];
    }
  }
  else
  {
    id v7 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v11 = "-[VTUIGMEnrollmentViewController _enrollUserIntoWaitlist]_block_invoke_2";
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment Enrollment from buddy getTicketForFeature: self in unavailable. Bailing!", buf, 0xCu);
    }
  }
}

uint64_t __57__VTUIGMEnrollmentViewController__enrollUserIntoWaitlist__block_invoke_69(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1232) hidesBusyIndicator];
}

- (void)_userDidTapCancelButton
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 siriGMIntroViewControllerNotNowPressed:self];
  }
  else
  {
    [(VTUIGMEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
  [(VTUIGMEnrollmentViewController *)self userDidCancel];
}

- (void)userDidCancel
{
}

- (void)_userDidTapContinueButton
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t enrollmentType = self->_enrollmentType;
    int v11 = 136315394;
    __int16 v12 = "-[VTUIGMEnrollmentViewController _userDidTapContinueButton]";
    __int16 v13 = 2048;
    unint64_t v14 = enrollmentType;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #gmenrollment User did tap continue button with enrollmentType: %lu", (uint8_t *)&v11, 0x16u);
  }
  if (self->_enrollmentType == 1)
  {
    id v5 = objc_alloc_init(MEMORY[0x263F32BB0]);
    [v5 setIsOptedIn:1];
  }
  int v6 = [MEMORY[0x263F843A8] isEligibleForExperience:0];
  if ([(GMAvailabilityViewModel *)self->_viewModel isBuddy]
    && (self->_enrollmentType == 1 ? (int v7 = v6) : (int v7 = 0), v7 == 1))
  {
    uint64_t v8 = [MEMORY[0x263F843A8] onboardingControllerForExperience:0];
    summarizationOnboardingController = self->_summarizationOnboardingController;
    self->_summarizationOnboardingController = v8;

    [(UNNotificationOnboardingController *)self->_summarizationOnboardingController setDelegate:self];
    id v10 = [(VTUIGMEnrollmentViewController *)self navigationController];
    [v10 pushViewController:self->_summarizationOnboardingController animated:1];
  }
  else if ([(GMAvailabilityViewModel *)self->_viewModel isBuddy] && !self->_enrollmentType)
  {
    [(VTUIGMEnrollmentViewController *)self _enrollUserIntoWaitlist];
  }
  else
  {
    [(VTUIGMEnrollmentViewController *)self _continueFromGMEnrollment];
  }
  [(GMAvailabilityViewModel *)self->_viewModel sendContinueEventWithEnrollmentType:self->_enrollmentType];
}

- (void)viewDidLoad
{
  v8.receiver = self;
  v8.super_class = (Class)VTUIGMEnrollmentViewController;
  [(OBBaseWelcomeController *)&v8 viewDidLoad];
  uint64_t v3 = +[VTUIStyle sharedStyle];
  if (![v3 isIpad]
    && [(GMAvailabilityViewModel *)self->_viewModel isBuddyOrCFU]
    && self->_enrollmentType == 1)
  {

LABEL_7:
    [(VTUIGMEnrollmentViewController *)self setOverrideUserInterfaceStyle:2];
    goto LABEL_9;
  }
  if (self->_enrollmentType == 1)
  {
    BOOL v4 = [(GMAvailabilityViewModel *)self->_viewModel hasCameraButton];

    if (!v4) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }

LABEL_9:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = objc_loadWeakRetained((id *)&self->_delegate);
    [v7 siriGMIntroViewControllerPresented:self withEnrollmentType:self->_enrollmentType];
  }
  [(GMAvailabilityViewModel *)self->_viewModel sendViewDidLoadEventWithEnrollmentType:self->_enrollmentType];
}

- (void)_continueFromGMEnrollment
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 siriGMIntroViewControllerContinuePressed:self];
  }
  else
  {
    [(VTUIGMEnrollmentViewController *)self dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)onboardingControllerRequestsGoingBack:(id)a3
{
  BOOL v4 = [(VTUIGMEnrollmentViewController *)self navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  id v6 = [(VTUIGMEnrollmentViewController *)self navigationController];
  id obj = [v6 topViewController];

  p_summarizationOnboardingController = &self->_summarizationOnboardingController;
  if ([obj conformsToProtocol:&unk_26EBBE728])
  {
    objc_storeStrong((id *)&self->_summarizationOnboardingController, obj);
    [(UNNotificationOnboardingController *)*p_summarizationOnboardingController setDelegate:self];
  }
  else
  {
    objc_super v8 = *p_summarizationOnboardingController;
    *p_summarizationOnboardingController = 0;
  }
}

- (void)onboardingController:(id)a3 requestsPushingTo:(id)a4
{
  id v5 = a4;
  [(UNNotificationOnboardingController *)self->_summarizationOnboardingController setDelegate:0];
  [v5 setDelegate:self];
  summarizationOnboardingController = self->_summarizationOnboardingController;
  self->_summarizationOnboardingController = (UNNotificationOnboardingController *)v5;
  id v7 = v5;

  id v8 = [(VTUIGMEnrollmentViewController *)self navigationController];
  [v8 pushViewController:v7 animated:1];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->continueButton, 0);
  objc_storeStrong((id *)&self->_summarizationOnboardingController, 0);
  objc_storeStrong((id *)&self->_headerIconProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_availability, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end