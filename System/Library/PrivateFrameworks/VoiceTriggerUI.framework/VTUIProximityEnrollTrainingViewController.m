@interface VTUIProximityEnrollTrainingViewController
- (AFMyriadCoordinator)myriadCoordinator;
- (BOOL)_hasPHSCloudDataForSpokenLanguage;
- (BOOL)_isLocaleSupported:(id)a3;
- (BOOL)_isTrainingInProgress;
- (BOOL)_shouldPresentLanguageDisambiguation;
- (BOOL)_shouldShowSiriDataSharingOptInView;
- (BOOL)_shouldSpeakAudioHint;
- (BOOL)_siriLanguageIsIncompatibleWithPairedWatch;
- (BOOL)disambiguateLanguageOptionsForTesting;
- (BOOL)hasRetriedTraining;
- (BOOL)shouldTurnOnMyriad;
- (BOOL)simulateJSSupportingDeviceForTesting;
- (BOOL)skipToDataSharingForTesting;
- (BOOL)skipToEndForTesting;
- (NSArray)trainingPageInstructions;
- (NSString)disambiguatedLanguageOption;
- (NSString)spokenLanguageCode;
- (NSUUID)trainingAttemptUUID;
- (SCDACoordinator)scdaCoordinator;
- (SSRVTUITrainingManager)trainingManager;
- (UIView)aboutTappedSender;
- (VTUIAudioHintPlayer)audioHintPlayer;
- (VTUIEnrollTrainingViewControllerDelegate)delegate;
- (VTUIProximityEnrollTrainingView)enrollTrainingView;
- (VTUIProximityEnrollTrainingViewController)init;
- (VTUIProximityEnrollTrainingViewController)initWithEnrollmentMode:(int64_t)a3;
- (VTUIProximityEnrollmentLanguageOptionsView)languageOptionsView;
- (VTUIProximityEnrollmentSetupIntroView)introView;
- (VTUIProximityEnrollmentSuccessView)successView;
- (VTUIProximityTryAgainView)tryAgainView;
- (id)_getSetupModeString;
- (id)_retryStringForStatus:(int64_t)a3;
- (id)interpretAudioSource:(unint64_t)a3;
- (int64_t)currentTrainingState;
- (int64_t)interpretSessionManagerResult:(id)a3 forInstruction:(int64_t)a4;
- (int64_t)orientation;
- (unint64_t)AVVCRetryCount;
- (unint64_t)badMicRetryCount;
- (unint64_t)cannotHearRetryCount;
- (unint64_t)digitalZerosRetryCount;
- (unint64_t)sessionId;
- (void)VTUITrainingManagerFeedLevel:(float)a3;
- (void)_advanceState;
- (void)_animateCheckMark:(BOOL)a3 completion:(id)a4;
- (void)_autoContinueFromRetry:(BOOL)a3;
- (void)_becomeActive;
- (void)_checkForPHSCloudDataIfNecessary:(id)a3;
- (void)_cleanupHelper;
- (void)_cleanupTrainingManagerWithCompletion:(id)a3;
- (void)_cleanupTrainingManagerWithCompletion:(id)a3 status:(int64_t)a4;
- (void)_continueToTrainingFromIntro;
- (void)_continueToTrainingFromLanguageOptions;
- (void)_continueToTrainingFromVoiceSelection;
- (void)_createTrainingManagerIfNeeded;
- (void)_didEnterBackground;
- (void)_dismiss:(id)a3;
- (void)_finishSiriSetup:(id)a3;
- (void)_gatherAudioDeviceInfo;
- (void)_handleTrainingResultForNonRetryablePhraseWithResult:(id)a3;
- (void)_handleTrainingResultForRetryablePhraseWithResult:(id)a3 shouldShowCheckMark:(BOOL)a4;
- (void)_hideInstruction;
- (void)_hideTrainingElements;
- (void)_markEnrollmentSuccessForVoiceProfile:(BOOL)a3;
- (void)_processDisambiguatedLanguageOption:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4;
- (void)_processIntroViewContinueAction:(id)a3;
- (void)_processLanguageSelectionAction:(id)a3;
- (void)_resetEnrollment;
- (void)_resetIdleTimer;
- (void)_resetTrainingManager;
- (void)_resignActive;
- (void)_resumeTraining;
- (void)_retryAfterBadMicAlert;
- (void)_retryInstruction:(BOOL)a3 withStatusMessage:(id)a4;
- (void)_setAssistantEnabled:(BOOL)a3;
- (void)_setIntroViewActionOnEnablementConfigurationDidLoad:(id)a3;
- (void)_setLanguageOptionsAndContinue;
- (void)_setPHSEnrollmentPrefEnabled:(BOOL)a3;
- (void)_setupEnrollTrainingView;
- (void)_setupMode;
- (void)_setupTrainingStates;
- (void)_showBadMicAlertCompletion:(id)a3;
- (void)_showBadMicAlertWithCompletion:(id)a3;
- (void)_showEnrollmentSuccessView;
- (void)_showInstruction:(int64_t)a3 isRetry:(BOOL)a4;
- (void)_showIntroView;
- (void)_showSiriDataSharingOptInView;
- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5;
- (void)_showTrainingElements;
- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6;
- (void)_showUnsupportedLocaleAlert;
- (void)_showUnsupportedLocaleAlertCompletion:(id)a3;
- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3;
- (void)_skipSetup;
- (void)_startEnrollment;
- (void)_startTraining;
- (void)_startTrainingIfNecessary;
- (void)_updateCurrentConstraintsToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)_updatePageNumberForInstruction:(int64_t)a3;
- (void)_warnForLanguageCompatibilityIfNecessary:(id)a3;
- (void)aboutTapped:(id)a3;
- (void)cancelTraining;
- (void)dealloc;
- (void)finish:(id)a3;
- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3;
- (void)scdaShouldContinue:(id)a3;
- (void)setAVVCRetryCount:(unint64_t)a3;
- (void)setAboutTappedSender:(id)a3;
- (void)setAudioHintPlayer:(id)a3;
- (void)setBadMicRetryCount:(unint64_t)a3;
- (void)setCannotHearRetryCount:(unint64_t)a3;
- (void)setCurrentTrainingState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDigitalZerosRetryCount:(unint64_t)a3;
- (void)setDisambiguateLanguageOptionsForTesting:(BOOL)a3;
- (void)setDisambiguatedLanguageOption:(id)a3;
- (void)setEnrollTrainingView:(id)a3;
- (void)setHasRetriedTraining:(BOOL)a3;
- (void)setIntroView:(id)a3;
- (void)setLanguageOptionsView:(id)a3;
- (void)setMyriadCoordinator:(id)a3;
- (void)setOrientation:(int64_t)a3;
- (void)setScdaCoordinator:(id)a3;
- (void)setShouldTurnOnMyriad:(BOOL)a3;
- (void)setSimulateJSSupportingDeviceForTesting:(BOOL)a3;
- (void)setSkipToDataSharingForTesting:(BOOL)a3;
- (void)setSkipToEndForTesting:(BOOL)a3;
- (void)setSpokenLanguageCode:(id)a3;
- (void)setSuccessView:(id)a3;
- (void)setTrainingAttemptUUID:(id)a3;
- (void)setTrainingManager:(id)a3;
- (void)setTrainingPageInstructions:(id)a3;
- (void)setTryAgainView:(id)a3;
- (void)setupNavigationBarStyleForAppearing:(BOOL)a3;
- (void)shouldAbortAnotherDeviceBetter:(id)a3;
- (void)shouldContinue:(id)a3;
- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3;
- (void)siriDataSharingOptInViewDismissButtonTappedFromPresenter:(id)a3;
- (void)siriLanguageSpokenLanguageCodeDidChange:(id)a3;
- (void)skipAssistant:(id)a3;
- (void)skipTraining:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4;
- (void)voiceSelectionControllerRequestsDismissal:(id)a3;
@end

@implementation VTUIProximityEnrollTrainingViewController

- (VTUIProximityEnrollTrainingViewController)init
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  v45.receiver = self;
  v45.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  v2 = [(VTUIProximityEnrollTrainingViewController *)&v45 init];
  if (v2)
  {
    VTUILogInitIfNeeded();
    v3 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
    settings = v2->_settings;
    v2->_settings = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.siri.amnesia", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v5;

    [(VTUIProximityEnrollTrainingViewController *)v2 _gatherAudioDeviceInfo];
    v7 = objc_alloc_init(VTUIAnalytics);
    analyticsEvent = v2->_analyticsEvent;
    v2->_analyticsEvent = v7;

    v9 = v2->_analyticsEvent;
    v10 = [(VTUIProximityEnrollTrainingViewController *)v2 _getSetupModeString];
    [(VTUIAnalytics *)v9 setSetupMode:v10];

    v11 = objc_alloc_init(VTUIEnrollmentPageEligibilityProvider);
    pageEligibilityProvider = v2->_pageEligibilityProvider;
    v2->_pageEligibilityProvider = v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F28818]) initWithDelegate:v2];
    siriLanguage = v2->_siriLanguage;
    v2->_siriLanguage = (AFUISiriLanguage *)v13;

    uint64_t v15 = [(AFUISiriLanguage *)v2->_siriLanguage spokenLanguageCode];
    spokenLanguageCode = v2->_spokenLanguageCode;
    v2->_spokenLanguageCode = (NSString *)v15;

    if (!v2->_spokenLanguageCode)
    {
      v17 = [MEMORY[0x263F285A0] sharedPreferences];
      uint64_t v18 = [v17 bestSupportedLanguageCodeForLanguageCode:0];
      v19 = v2->_spokenLanguageCode;
      v2->_spokenLanguageCode = (NSString *)v18;

      v20 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        v21 = v2->_spokenLanguageCode;
        *(_DWORD *)buf = 136315394;
        v47 = "-[VTUIProximityEnrollTrainingViewController init]";
        __int16 v48 = 2112;
        v49 = v21;
        _os_log_impl(&dword_238878000, v20, OS_LOG_TYPE_DEFAULT, "%s No Siri language code found, falling back to: %@", buf, 0x16u);
      }
    }
    v22 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v23 = v2->_spokenLanguageCode;
      *(_DWORD *)buf = 136315394;
      v47 = "-[VTUIProximityEnrollTrainingViewController init]";
      __int16 v48 = 2112;
      v49 = v23;
      _os_log_impl(&dword_238878000, v22, OS_LOG_TYPE_DEFAULT, "%s Initializing with language code: %@", buf, 0x16u);
    }
    if (v2->_spokenLanguageCode)
    {
      v24 = +[VTUIStringsHelper sharedStringsHelper];
      [v24 setSiriLanguage:v2->_spokenLanguageCode];

      v25 = v2->_spokenLanguageCode;
    }
    else
    {
      v25 = 0;
    }
    [(VTUIAnalytics *)v2->_analyticsEvent setLanguageCode:v25];
    v2->_shouldTurnOnMyriad = 1;
    v26 = (void *)*MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      v27 = v2->_spokenLanguageCode;
      v28 = v26;
      v29 = +[VTUIStringsHelper sharedStringsHelper];
      v30 = [v29 heySiriTriggerPhrase];
      *(_DWORD *)buf = 136315650;
      v47 = "-[VTUIProximityEnrollTrainingViewController init]";
      __int16 v48 = 2112;
      v49 = v27;
      __int16 v50 = 2112;
      v51 = v30;
      _os_log_impl(&dword_238878000, v28, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code: %@. (Trigger: '%@')", buf, 0x20u);
    }
    v31 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v47 = "-[VTUIProximityEnrollTrainingViewController init]";
      _os_log_impl(&dword_238878000, v31, OS_LOG_TYPE_DEFAULT, "%s Setting the current training state in VTUIEnrollTrainingViewController to kVTUITrainingStateNotStarted", buf, 0xCu);
    }
    v2->_currentTrainingState = -1;
    aboutTappedSender = v2->_aboutTappedSender;
    v2->_aboutTappedSender = 0;

    if ([MEMORY[0x263F28510] isSCDAFrameworkEnabled])
    {
      v33 = [MEMORY[0x263F6CF70] currentCoordinator];

      if (v33)
      {
        uint64_t v34 = [MEMORY[0x263F6CF70] currentCoordinator];
      }
      else
      {
        uint64_t v34 = [objc_alloc(MEMORY[0x263F6CF70]) initWithDelegate:v2];
      }
      uint64_t v36 = 1272;
    }
    else
    {
      v35 = [MEMORY[0x263F28568] currentCoordinator];

      if (v35)
      {
        uint64_t v34 = [MEMORY[0x263F28568] currentCoordinator];
      }
      else
      {
        uint64_t v34 = [objc_alloc(MEMORY[0x263F28568]) initWithDelegate:v2];
      }
      uint64_t v36 = 1264;
    }
    v37 = *(Class *)((char *)&v2->super.super.super.isa + v36);
    *(Class *)((char *)&v2->super.super.super.isa + v36) = (Class)v34;

    v38 = +[VTUIStyle sharedStyle];
    [v38 setIsBuddyOrFollowUp:PSIsRunningInAssistant()];
    uint64_t v39 = [v38 proxAccessorySupportsCompactTrigger]
       && ([v38 shouldSetupForMultipleTriggerPhrases] & 1) != 0
       || [(VTUIProximityEnrollTrainingViewController *)v2 simulateJSSupportingDeviceForTesting];
    v40 = [[VTUIAudioHintPlayer alloc] initWithLanguage:v2->_spokenLanguageCode isCompact:v39];
    audioHintPlayer = v2->_audioHintPlayer;
    v2->_audioHintPlayer = v40;

    v42 = objc_alloc_init(VTUISiriDataSharingOptInPresenter);
    siriDataSharingOptInPresenter = v2->_siriDataSharingOptInPresenter;
    v2->_siriDataSharingOptInPresenter = v42;

    [(VTUISiriDataSharingOptInPresenter *)v2->_siriDataSharingOptInPresenter setPresentationDelegate:v2];
    [(VTUISiriDataSharingOptInPresenter *)v2->_siriDataSharingOptInPresenter setSourceOfChange:3];
    [(VTUIProximityEnrollTrainingViewController *)v2 _setupMode];
  }
  return v2;
}

- (VTUIProximityEnrollTrainingViewController)initWithEnrollmentMode:(int64_t)a3
{
  result = [(VTUIProximityEnrollTrainingViewController *)self init];
  if (a3) {
    result->_enrollmentMode = a3;
  }
  return result;
}

- (void)dealloc
{
  [(VTUIAnalytics *)self->_analyticsEvent logEvent];
  if ([(VTUIProximityEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    v3 = [MEMORY[0x263F78BB8] sharedInstance];
    v4 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v5 = (id)[v3 deleteUserVoiceProfile:v4];
  }
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
  v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  [(VTUIProximityEnrollTrainingViewController *)&v7 dealloc];
}

- (void)_setupMode
{
  id v2 = +[VTUIStyle sharedStyle];
  [v2 setEnrollmentMode:4];
}

- (void)viewDidLoad
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  VTUILogInitIfNeeded();
  v11.receiver = self;
  v11.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  [(VTUIProximityEnrollTrainingViewController *)&v11 viewDidLoad];
  v3 = +[VTUIStringsHelper sharedStringsHelper];
  [v3 setupForCurrentLocaleAndSiriLanguage];

  [(VTUIProximityEnrollTrainingViewController *)self _setupTrainingStates];
  [(VTUIProximityEnrollTrainingViewController *)self _setupEnrollTrainingView];
  v4 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView skipButton];
  [v4 addTarget:self action:sel_skipTraining_ forControlEvents:64];

  id v5 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView dismissButton];
  [v5 addTarget:self action:sel__dismiss_ forControlEvents:64];

  v6 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPreludeLabel];
  [v6 setHidden:1];

  objc_super v7 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v13 = "-[VTUIProximityEnrollTrainingViewController viewDidLoad]";
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s Main View Loaded", buf, 0xCu);
  }
  v8 = [MEMORY[0x263F08A00] defaultCenter];
  [v8 addObserver:self selector:sel__resignActive name:*MEMORY[0x263F833C0] object:0];

  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 addObserver:self selector:sel__becomeActive name:*MEMORY[0x263F83318] object:0];

  v10 = [MEMORY[0x263F08A00] defaultCenter];
  [v10 addObserver:self selector:sel__didEnterBackground name:*MEMORY[0x263F83330] object:0];

  if (self->_skipToEndForTesting)
  {
    self->_currentTrainingState = 5;
    [(VTUIProximityEnrollTrainingViewController *)self _showEnrollmentSuccessView];
  }
  if (self->_skipToDataSharingForTesting)
  {
    self->_currentTrainingState = 5;
    [(VTUIProximityEnrollTrainingViewController *)self _showSiriDataSharingOptInView];
  }
}

- (void)_setupEnrollTrainingView
{
  int64_t enrollmentMode = self->_enrollmentMode;
  v4 = [VTUIProximityEnrollTrainingView alloc];
  id v5 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v5 bounds];
  if (enrollmentMode == 5) {
    v6 = -[VTUIProximityEnrollTrainingView initWithFrame:forEnrollmentStyle:](v4, "initWithFrame:forEnrollmentStyle:", 1);
  }
  else {
    v6 = -[VTUIProximityEnrollTrainingView initWithFrame:](v4, "initWithFrame:");
  }
  enrollTrainingView = self->_enrollTrainingView;
  self->_enrollTrainingView = v6;

  [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView setAutoresizingMask:18];
  id v8 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v8 addSubview:self->_enrollTrainingView];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v8 = "-[VTUIProximityEnrollTrainingViewController viewWillAppear:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillAppear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  [(VTUIProximityEnrollTrainingViewController *)&v6 viewWillAppear:v3];
  [(VTUIProximityEnrollTrainingViewController *)self _becomeActive];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VTUIProximityEnrollTrainingViewController viewWillDisappear:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillDisappear method called", buf, 0xCu);
  }
  int v6 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
  objc_super v7 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
  if (v6) {
    objc_super v7 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v7) resetStateMachine];
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer cleanup];
  v8.receiver = self;
  v8.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  [(VTUIProximityEnrollTrainingViewController *)&v8 viewWillDisappear:v3];
  [(VTUIProximityEnrollTrainingViewController *)self _hideTrainingElements];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v8 = "-[VTUIProximityEnrollTrainingViewController viewDidDisappear:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s viewDidDisappear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  [(VTUIProximityEnrollTrainingViewController *)&v6 viewDidDisappear:v3];
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)VTUIProximityEnrollTrainingViewController;
  [(VTUIProximityEnrollTrainingViewController *)&v6 viewDidLayoutSubviews];
  BOOL v3 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v3 bounds];
  -[VTUIProximityEnrollTrainingViewController _updateCurrentConstraintsToSize:withTransitionCoordinator:](self, "_updateCurrentConstraintsToSize:withTransitionCoordinator:", 0, v4, v5);
}

- (void)setupNavigationBarStyleForAppearing:(BOOL)a3
{
  BOOL v3 = a3;
  double v5 = [(VTUIProximityEnrollTrainingViewController *)self navigationController];
  objc_super v6 = [v5 view];
  if (v3)
  {
    objc_super v7 = [MEMORY[0x263F825C8] clearColor];
    [v6 setBackgroundColor:v7];

    objc_super v8 = [(VTUIProximityEnrollTrainingViewController *)self navigationController];
    uint64_t v9 = [v8 navigationBar];
    v10 = [MEMORY[0x263F825C8] clearColor];
    [v9 setBackgroundColor:v10];

    id v17 = [(VTUIProximityEnrollTrainingViewController *)self navigationController];
    uint64_t v11 = [v17 navigationBar];
    v12 = objc_opt_new();
    [v11 setBackgroundImage:v12 forBarMetrics:0];
  }
  else
  {
    uint64_t v13 = [MEMORY[0x263F825C8] whiteColor];
    [v6 setBackgroundColor:v13];

    uint64_t v14 = [(VTUIProximityEnrollTrainingViewController *)self navigationController];
    uint64_t v15 = [v14 navigationBar];
    v16 = [MEMORY[0x263F825C8] whiteColor];
    [v15 setBackgroundColor:v16];

    id v17 = [(VTUIProximityEnrollTrainingViewController *)self navigationController];
    uint64_t v11 = [v17 navigationBar];
    [v11 setBackgroundImage:0 forBarMetrics:0];
  }
}

- (void)setSimulateJSSupportingDeviceForTesting:(BOOL)a3
{
  self->_simulateJSSupportingDeviceForTesting = a3;
  if (a3) {
    uint64_t v4 = 8212;
  }
  else {
    uint64_t v4 = 8206;
  }
  double v5 = +[VTUIStyle sharedStyle];
  [v5 setAudioProductID:v4];

  [(VTUIProximityEnrollTrainingViewController *)self _setupTrainingStates];
}

- (void)_becomeActive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[VTUIProximityEnrollTrainingViewController _becomeActive]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Making View Active", (uint8_t *)&v5, 0xCu);
  }
  [(VTUIProximityEnrollTrainingViewController *)self _showTrainingElements];
  self->_badMicRetryCount = 0;
  self->_AVVCRetryCount = 0;
  self->_isResignedActive = 0;
  self->_cannotHearRetryCount = 0;
  self->_digitalZerosRetryCount = 0;
  int64_t currentTrainingState = self->_currentTrainingState;
  if (currentTrainingState == -1) {
    [(VTUIProximityEnrollTrainingViewController *)self _startEnrollment];
  }
  else {
    [(VTUIProximityEnrollTrainingViewController *)self _showTrainingInstruction:currentTrainingState afterDelay:0 isRetry:1 animate:0.0];
  }
}

- (void)_resignActive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    objc_super v6 = "-[VTUIProximityEnrollTrainingViewController _resignActive]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Resigning Active", (uint8_t *)&v5, 0xCu);
  }
  self->_isResignedActive = 1;
  [(VTUIProximityEnrollTrainingViewController *)self _hideTrainingElements];
  [(VTUIProximityEnrollTrainingViewController *)self _resetTrainingManager];
  uint64_t v4 = [(VTUIProximityEnrollTrainingViewController *)self audioHintPlayer];
  [v4 cleanup];
}

- (void)_didEnterBackground
{
  if ([(VTUIProximityEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    [(VTUIProximityEnrollTrainingViewController *)self _resetEnrollment];
    id v3 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPagedLabel];
    [v3 clear];
  }
}

- (void)_updateCurrentConstraintsToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  if (a3.width <= a3.height) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = 3;
  }
  objc_super v8 = +[MGWrapper sharedMGWrapper];
  char v9 = [v8 isDeviceIPad];

  if ((v9 & 1) == 0 && v7 != [(VTUIProximityEnrollTrainingViewController *)self orientation])
  {
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_introView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_tryAgainView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_enrollTrainingView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_successView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIProximityView updateContainerConstraintsForOrientationChangeToSize:](self->_languageOptionsView, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    -[VTUIVoiceSelectionViewController updateContainerConstraintsForOrientationChangeToSize:](self->_voiceSelectionViewController, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
    self->_orientation = v7;
  }
}

- (void)_hideTrainingElements
{
  id v3 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView orbView];
  [v3 setHidden:1];

  id v4 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView checkMark];
  [v4 setHidden:1];
}

- (void)_showTrainingElements
{
  id v3 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView orbView];
  [v3 setHidden:0];

  id v4 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView checkMark];
  [v4 setHidden:0];
}

- (void)_showBadMicAlertWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __76__VTUIProximityEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke;
  v6[3] = &unk_264D4C230;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v6];
}

uint64_t __76__VTUIProximityEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VTUIProximityEnrollTrainingViewController _showBadMicAlertWithCompletion:]_block_invoke";
    _os_log_impl(&dword_238878000, v2, OS_LOG_TYPE_DEFAULT, "%s Showing Bad Mic Alert", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _showBadMicAlertCompletion:*(void *)(a1 + 40)];
}

- (void)_retryAfterBadMicAlert
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[VTUIProximityEnrollTrainingViewController _retryAfterBadMicAlert]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_INFO, "%s Trying again after Bad Mic ALert", (uint8_t *)&v4, 0xCu);
  }
  [(VTUIProximityEnrollTrainingViewController *)self _resumeTraining];
}

- (BOOL)_isLocaleSupported:(id)a3
{
  id v3 = a3;
  int v4 = AFPreferencesSupportedLanguages();
  char v5 = [v4 containsObject:v3];

  return v5;
}

- (void)_showUnsupportedLocaleAlert
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  objc_initWeak(&location, self);
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v8 = "-[VTUIProximityEnrollTrainingViewController _showUnsupportedLocaleAlert]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Showing Unsupported LocaleAlert", buf, 0xCu);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __72__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke;
  v4[3] = &unk_264D4C258;
  objc_copyWeak(&v5, &location);
  [(VTUIProximityEnrollTrainingViewController *)self _showUnsupportedLocaleAlertCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __72__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = [WeakRetained trainingManager];
    objc_msgSend(v2, "cancelTrainingForID:", objc_msgSend(v4, "sessionId"));

    id v3 = [v4 trainingManager];
    [v3 stopRMS];

    [v4 skipTraining:0];
    id WeakRetained = v4;
  }
}

- (BOOL)_isTrainingInProgress
{
  return self->_currentTrainingState < 5uLL;
}

- (void)_setupTrainingStates
{
  v51[5] = *MEMORY[0x263EF8340];
  id v3 = +[VTUIStyle sharedStyle];
  v29 = v3;
  BOOL v4 = [v3 proxAccessorySupportsCompactTrigger]
    && ([v3 shouldSetupForMultipleTriggerPhrases] & 1) != 0
    || [(VTUIProximityEnrollTrainingViewController *)self simulateJSSupportingDeviceForTesting];
  id v5 = [(VTUIAudioHintPlayer *)self->_audioHintPlayer outputVoice];
  if (v4)
  {
    v49[0] = @"Instruction";
    v28 = +[VTUIStringsHelper sharedStringsHelper];
    [v28 uiLocalizedStringForKey:@"TEXT_TITLE_UTT1" usesMultipleTriggers:1 siriVoice:v5];
    v27 = v49[1] = @"RetryOnFail";
    v50[0] = v27;
    v50[1] = MEMORY[0x263EFFA80];
    v26 = [NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];
    v51[0] = v26;
    v47[0] = @"Instruction";
    v25 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v6 = [v25 uiLocalizedStringForKey:@"TEXT_TITLE_UTT2" usesMultipleTriggers:0 siriVoice:v5];
    v47[1] = @"RetryOnFail";
    uint64_t v7 = MEMORY[0x263EFFA88];
    v24 = (void *)v6;
    v48[0] = v6;
    v48[1] = MEMORY[0x263EFFA88];
    v23 = [NSDictionary dictionaryWithObjects:v48 forKeys:v47 count:2];
    v51[1] = v23;
    v45[0] = @"Instruction";
    v22 = +[VTUIStringsHelper sharedStringsHelper];
    [v22 uiLocalizedStringForKey:@"TEXT_TITLE_UTT3" usesMultipleTriggers:1 siriVoice:v5];
    v46[0] = v45[1] = @"RetryOnFail";
    v21 = (void *)v46[0];
    v46[1] = v7;
    objc_super v8 = [NSDictionary dictionaryWithObjects:v46 forKeys:v45 count:2];
    v51[2] = v8;
    v43[0] = @"Instruction";
    uint64_t v9 = +[VTUIStringsHelper sharedStringsHelper];
    v10 = [v9 uiLocalizedStringForKey:@"TEXT_TITLE_UTT4" usesMultipleTriggers:0 siriVoice:v5];
    v43[1] = @"RetryOnFail";
    v44[0] = v10;
    v44[1] = v7;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v44 forKeys:v43 count:2];
    v51[3] = v11;
    v41[0] = @"Instruction";
    v12 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v13 = [v12 uiLocalizedStringForKey:@"TEXT_TITLE_UTT5" usesMultipleTriggers:1 siriVoice:v5];
    v41[1] = @"RetryOnFail";
    v42[0] = v13;
    v42[1] = v7;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v42 forKeys:v41 count:2];
    v51[4] = v14;
    uint64_t v15 = (void *)MEMORY[0x263EFF8C0];
    v16 = v51;
  }
  else
  {
    v38[0] = @"Instruction";
    v28 = +[VTUIStringsHelper sharedStringsHelper];
    [v28 uiLocalizedStringForKey:@"TEXT_TITLE_UTT1" usesMultipleTriggers:0 siriVoice:v5];
    v27 = v38[1] = @"RetryOnFail";
    v39[0] = v27;
    v39[1] = MEMORY[0x263EFFA80];
    v26 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:2];
    v40[0] = v26;
    v36[0] = @"Instruction";
    v25 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v17 = [v25 uiLocalizedStringForKey:@"TEXT_TITLE_UTT2" usesMultipleTriggers:0 siriVoice:v5];
    v36[1] = @"RetryOnFail";
    uint64_t v18 = MEMORY[0x263EFFA88];
    v24 = (void *)v17;
    v37[0] = v17;
    v37[1] = MEMORY[0x263EFFA88];
    v23 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:2];
    v40[1] = v23;
    v34[0] = @"Instruction";
    v22 = +[VTUIStringsHelper sharedStringsHelper];
    [v22 uiLocalizedStringForKey:@"TEXT_TITLE_UTT3" usesMultipleTriggers:0 siriVoice:v5];
    v35[0] = v34[1] = @"RetryOnFail";
    v21 = (void *)v35[0];
    v35[1] = v18;
    objc_super v8 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    v40[2] = v8;
    v32[0] = @"Instruction";
    uint64_t v9 = +[VTUIStringsHelper sharedStringsHelper];
    v10 = [v9 uiLocalizedStringForKey:@"TEXT_TITLE_UTT4" usesMultipleTriggers:0 siriVoice:v5];
    v32[1] = @"RetryOnFail";
    v33[0] = v10;
    v33[1] = v18;
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:2];
    v40[3] = v11;
    v30[0] = @"Instruction";
    v12 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v13 = [v12 uiLocalizedStringForKey:@"TEXT_TITLE_UTT5" usesMultipleTriggers:0 siriVoice:v5];
    v30[1] = @"RetryOnFail";
    v31[0] = v13;
    v31[1] = v18;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:2];
    v40[4] = v14;
    uint64_t v15 = (void *)MEMORY[0x263EFF8C0];
    v16 = v40;
  }
  v19 = [v15 arrayWithObjects:v16 count:5];
  trainingPageInstructions = self->_trainingPageInstructions;
  self->_trainingPageInstructions = v19;
}

- (void)_animateCheckMark:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    v10 = "-[VTUIProximityEnrollTrainingViewController _animateCheckMark:completion:]";
    __int16 v11 = 1024;
    BOOL v12 = v4;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s Animate. For Success: %d", (uint8_t *)&v9, 0x12u);
  }
  objc_super v8 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView checkMark];
  [v8 animateForSuccess:v4 completion:v6];
}

- (void)_resetIdleTimer
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 setIdleTimerDisabled:1];

  id v3 = [MEMORY[0x263F82438] sharedApplication];
  [v3 setIdleTimerDisabled:0];
}

- (void)_showIntroView
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v34 = "-[VTUIProximityEnrollTrainingViewController _showIntroView]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying Intro view", buf, 0xCu);
  }
  if (!self->_introView)
  {
    BOOL v4 = [(VTUIProximityEnrollTrainingViewController *)self view];
    id v5 = [VTUIProximityEnrollmentSetupIntroView alloc];
    id v6 = [(VTUIProximityEnrollTrainingViewController *)self view];
    [v6 bounds];
    uint64_t v7 = -[VTUIProximityEnrollmentSetupIntroView initWithFrame:](v5, "initWithFrame:");
    introView = self->_introView;
    self->_introView = v7;

    [(VTUIProximityEnrollmentSetupIntroView *)self->_introView setAutoresizingMask:18];
    [(VTUIProximityEnrollmentSetupIntroView *)self->_introView setEnrollmentDelegate:self];
    [v4 addSubview:self->_introView];
    int v9 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView dismissButton];
    [v9 addTarget:self action:sel__dismiss_ forControlEvents:64];

    char v31 = 0;
    v10 = [MEMORY[0x263F285A0] sharedPreferences];
    __int16 v11 = [MEMORY[0x263EFF960] currentLocale];
    BOOL v12 = [v11 localeIdentifier];
    uint64_t v13 = [v10 allSiriLanguageCodesForSystemLanguageCode:v12 isGoodFit:&v31];
    siriLanguageOptions = self->_siriLanguageOptions;
    self->_siriLanguageOptions = v13;

    if (self->_disambiguateLanguageOptionsForTesting)
    {
      uint64_t v15 = self->_siriLanguageOptions;
      self->_siriLanguageOptions = (NSArray *)&unk_26EB98E00;
    }
    v16 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView setupButton];
    [v16 addTarget:self action:sel__processIntroViewContinueAction_ forControlEvents:64];

    uint64_t v17 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView notNowButton];
    [v17 addTarget:self action:sel_skipAssistant_ forControlEvents:64];

    uint64_t v18 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView skipButton];
    [v18 setHidden:1];

    v19 = +[VTUIStyle sharedStyle];
    uint64_t v20 = [v19 enrollmentMode];

    v21 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v34 = "-[VTUIProximityEnrollTrainingViewController _showIntroView]";
      __int16 v35 = 2048;
      uint64_t v36 = v20;
      _os_log_impl(&dword_238878000, v21, OS_LOG_TYPE_DEFAULT, "%s Enrollment mode: %ld", buf, 0x16u);
    }
    if (!self->_provider)
    {
      v22 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x263F28500]);
      provider = self->_provider;
      self->_provider = v22;
    }
    if (self->_enablementConfiguration)
    {
      [(VTUIAnalytics *)self->_analyticsEvent setIntroViewShown:[(VTUIAnalytics *)self->_analyticsEvent introViewShown] + 1];
    }
    else
    {
      if ([(VTUIProximityEnrollTrainingViewController *)self _shouldPresentLanguageDisambiguation])
      {
        v24 = self->_siriLanguageOptions;
      }
      else
      {
        spokenLanguageCode = self->_spokenLanguageCode;
        v24 = [MEMORY[0x263EFF8C0] arrayWithObjects:&spokenLanguageCode count:1];
      }
      v25 = v24;
      objc_initWeak((id *)buf, self);
      self->_isEnablementConfigurationLoading = 1;
      v26 = self->_provider;
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke;
      v28[3] = &unk_264D4C320;
      objc_copyWeak(&v30, (id *)buf);
      v27 = v25;
      v29 = v27;
      [(AFEnablementFlowConfigurationProvider *)v26 configurationForEnablementFlow:2 recognitionLanguageCodes:v27 completion:v28];

      objc_destroyWeak(&v30);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke_2;
  block[3] = &unk_264D4C2F8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __59__VTUIProximityEnrollTrainingViewController__showIntroView__block_invoke_2(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 40);
      int v8 = 136315650;
      int v9 = "-[VTUIProximityEnrollTrainingViewController _showIntroView]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Enablement Configuration %@ for recognition languages %@", (uint8_t *)&v8, 0x20u);
    }
    objc_storeStrong(WeakRetained + 140, *(id *)(a1 + 32));
    *((unsigned char *)WeakRetained + 1136) = 0;
    id v6 = (void (**)(void))WeakRetained[143];
    if (v6)
    {
      v6[2]();
      id v7 = WeakRetained[143];
      WeakRetained[143] = 0;
    }
  }
}

- (BOOL)_siriLanguageIsIncompatibleWithPairedWatch
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F57730] sharedInstance];
  int v4 = [v3 isPaired];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [MEMORY[0x263F57730] sharedInstance];
  id v6 = [v5 getActivePairedDevice];
  id v7 = [v6 valueForProperty:*MEMORY[0x263F57668]];

  int v8 = [MEMORY[0x263F57730] sharedInstance];
  int v9 = [v8 getActivePairedDevice];

  __int16 v10 = [v9 valueForProperty:*MEMORY[0x263F57660]];
  int v11 = [MEMORY[0x263F284A0] siriIsSupportedForLanguageCode:self->_spokenLanguageCode productName:v10 productVersion:v7 error:0];
  __int16 v12 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = @"false";
    if (v11) {
      uint64_t v13 = @"true";
    }
    int v16 = 136315394;
    uint64_t v17 = "-[VTUIProximityEnrollTrainingViewController _siriLanguageIsIncompatibleWithPairedWatch]";
    __int16 v18 = 2112;
    v19 = v13;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s Is Siri Language Supported on watch ? - %@", (uint8_t *)&v16, 0x16u);
  }
  char v14 = v11 ^ 1;

  return v14;
}

- (void)_warnForLanguageCompatibilityIfNecessary:(id)a3
{
  int v4 = (void (**)(void))a3;
  if ([(VTUIProximityEnrollTrainingViewController *)self _siriLanguageIsIncompatibleWithPairedWatch])
  {
    uint64_t v5 = (void *)MEMORY[0x263F82418];
    id v6 = +[VTUIStringsHelper sharedStringsHelper];
    id v7 = [v6 uiLocalizedStringForKey:@"ALERT_TITLE_LANGUAGE_NOT_SUPPORTED_ON_WATCH"];
    int v8 = +[VTUIStringsHelper sharedStringsHelper];
    int v9 = [v8 uiLocalizedStringForKey:@"ALERT_MESSAGE_LANGUAGE_NOT_SUPPORTED_ON_WATCH"];
    __int16 v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    int v11 = (void *)MEMORY[0x263F82400];
    __int16 v12 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v13 = [v12 uiLocalizedStringForKey:@"ALERT_BUTTON_CONTINUE"];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __86__VTUIProximityEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke;
    v15[3] = &unk_264D4C348;
    int v16 = v4;
    char v14 = [v11 actionWithTitle:v13 style:0 handler:v15];

    [v10 addAction:v14];
    [(VTUIProximityEnrollTrainingViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __86__VTUIProximityEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_setAssistantEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [MEMORY[0x263F285A0] sharedPreferences];
  [v5 setAssistantIsEnabled:v3];

  enablementConfiguration = self->_enablementConfiguration;
  if (enablementConfiguration)
  {
    id v7 = [(AFEnablementConfiguration *)enablementConfiguration completionLoggingBlock];
    v7[2](v7, v3);
  }
}

- (void)_markEnrollmentSuccessForVoiceProfile:(BOOL)a3
{
  if (a3)
  {
    id v6 = [MEMORY[0x263F78BB8] sharedInstance];
    int v4 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v5 = (id)[v6 markSATEnrollmentSuccessForVoiceProfile:v4];
  }
}

- (void)_setPHSEnrollmentPrefEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [MEMORY[0x263F78BB8] sharedInstance];
    id v6 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v7 = (id)[v5 markSATEnrollmentSuccessForVoiceProfile:v6];
  }
  id v8 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v8 setVoiceTriggerEnabled:v3];
}

- (void)_showEnrollmentSuccessView
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[VTUIProximityEnrollTrainingViewController _showEnrollmentSuccessView]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Enrollment completed", buf, 0xCu);
  }
  int v4 = [(VTUIProximityEnrollTrainingViewController *)self view];
  id v5 = [VTUIProximityEnrollmentSuccessView alloc];
  id v6 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v6 bounds];
  id v7 = -[VTUIProximityEnrollmentSuccessView initWithFrame:](v5, "initWithFrame:");
  successView = self->_successView;
  self->_successView = v7;

  [(VTUIProximityEnrollmentSuccessView *)self->_successView setAutoresizingMask:18];
  [v4 addSubview:self->_successView];
  int v9 = [(VTUIProximityEnrollmentSuccessView *)self->_successView dismissButton];
  [v9 addTarget:self action:sel__dismiss_ forControlEvents:64];

  __int16 v10 = [(VTUIProximityEnrollmentSuccessView *)self->_successView continueButton];
  [v10 addTarget:self action:sel__finishSiriSetup_ forControlEvents:64];

  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView)
  {
    [(VTUIProximityEnrollTrainingView *)enrollTrainingView removeFromSuperview];
    __int16 v12 = self->_enrollTrainingView;
    self->_enrollTrainingView = 0;
  }
  if ([(VTUIProximityEnrollTrainingViewController *)self _shouldSpeakAudioHint])
  {
    if (self->_shouldTurnOnMyriad)
    {
      int v13 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
      uint64_t v15 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
      if (v13) {
        uint64_t v15 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
      }
      LODWORD(v14) = 20.0;
      [*(id *)((char *)&self->super.super.super.isa + *v15) startAdvertisingForPHSSetupAfterDelay:0.0 maxInterval:v14];
    }
    objc_initWeak((id *)buf, self);
    audioHintPlayer = self->_audioHintPlayer;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __71__VTUIProximityEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke;
    v17[3] = &unk_264D4C390;
    objc_copyWeak(&v18, (id *)buf);
    [(VTUIAudioHintPlayer *)audioHintPlayer speakConfirmationDialog:v17];
    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
}

void __71__VTUIProximityEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v1 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
    BOOL v3 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
    if (v1) {
      BOOL v3 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
    }
    LODWORD(v2) = 0.5;
    [*(id *)&WeakRetained[*v3] endAdvertisingAfterDelay:v2];
    [WeakRetained _cleanupTrainingManagerWithCompletion:0];
  }
}

- (void)_startEnrollment
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    spokenLanguageCode = self->_spokenLanguageCode;
    int v7 = 136315394;
    id v8 = "-[VTUIProximityEnrollTrainingViewController _startEnrollment]";
    __int16 v9 = 2112;
    __int16 v10 = spokenLanguageCode;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting Enrollment for language code: %@", (uint8_t *)&v7, 0x16u);
  }
  if (![(VTUIProximityEnrollTrainingViewController *)self _isLocaleSupported:self->_spokenLanguageCode])[(VTUIProximityEnrollTrainingViewController *)self _showUnsupportedLocaleAlert]; {
  introView = self->_introView;
  }
  if (introView)
  {
    self->_introView = 0;
  }
  aboutTappedSender = self->_aboutTappedSender;
  if (self->_languageOptionsView)
  {
    if (!aboutTappedSender) {
      return;
    }
LABEL_11:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      return;
    }
    goto LABEL_12;
  }
  if (aboutTappedSender) {
    goto LABEL_11;
  }
  if (self->_enrollmentMode == 5)
  {
    [(VTUIProximityEnrollTrainingViewController *)self _continueToTrainingFromIntro];
    return;
  }
LABEL_12:
  [(VTUIProximityEnrollTrainingViewController *)self _showIntroView];
}

- (void)_resetEnrollment
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    id v8 = "-[VTUIProximityEnrollTrainingViewController _resetEnrollment]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Resetting State to kVTUITrainingStateNotStarted", (uint8_t *)&v7, 0xCu);
  }
  self->_int64_t currentTrainingState = -1;
  [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
  [(VTUIProximityEnrollTrainingViewController *)self _hideInstruction];
  int v4 = [MEMORY[0x263F78BB8] sharedInstance];
  id v5 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
  id v6 = (id)[v4 deleteUserVoiceProfile:v5];
}

- (void)_resumeTraining
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    int64_t currentTrainingState = self->_currentTrainingState;
    int v5 = 136315394;
    id v6 = "-[VTUIProximityEnrollTrainingViewController _resumeTraining]";
    __int16 v7 = 2048;
    int64_t v8 = currentTrainingState;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_INFO, "%s Resuming training from the previous state: %zd", (uint8_t *)&v5, 0x16u);
  }
  if ([(VTUIProximityEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    [(VTUIProximityEnrollTrainingViewController *)self _createTrainingManagerIfNeeded];
    [(VTUIProximityEnrollTrainingViewController *)self _showInstruction:self->_currentTrainingState isRetry:0];
  }
}

- (void)_startTraining
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (self->_currentTrainingState < 0)
  {
    int v5 = [MEMORY[0x263F08C38] UUID];
    trainingAttemptUUID = self->_trainingAttemptUUID;
    self->_trainingAttemptUUID = v5;

    __int16 v7 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v8 = self->_trainingAttemptUUID;
      uint64_t v9 = v7;
      __int16 v10 = [(NSUUID *)v8 UUIDString];
      int64_t currentTrainingState = self->_currentTrainingState;
      int v20 = 136315650;
      uint64_t v21 = "-[VTUIProximityEnrollTrainingViewController _startTraining]";
      __int16 v22 = 2112;
      int64_t v23 = (int64_t)v10;
      __int16 v24 = 2048;
      int64_t v25 = currentTrainingState;
      _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s Starting training attempt %@ - Moving from state: %zd to state 0", (uint8_t *)&v20, 0x20u);
    }
    __int16 v12 = [MEMORY[0x263F78BB8] sharedInstance];
    int v13 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v14 = (id)[v12 deleteUserVoiceProfile:v13];

    uint64_t v15 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v15 logEventWithType:5502 context:0];

    int v16 = [MEMORY[0x263F85AF0] sharedPreferences];
    uint64_t v17 = [v16 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:0];

    if (v17) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 1;
    }
    +[VTUISELFLogger logSiriSetupPHSEnrollmentUIStarted:self->_trainingAttemptUUID enrollmentMode:self->_enrollmentMode locale:self->_spokenLanguageCode voiceTriggerType:v18];
    [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
    self->_int64_t currentTrainingState = 0;
    v19 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPreludeLabel];
    [v19 setHidden:0];

    [(VTUIProximityEnrollTrainingViewController *)self _showInstruction:self->_currentTrainingState isRetry:0];
  }
  else
  {
    BOOL v3 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
    {
      int64_t v4 = self->_currentTrainingState;
      int v20 = 136315394;
      uint64_t v21 = "-[VTUIProximityEnrollTrainingViewController _startTraining]";
      __int16 v22 = 2048;
      int64_t v23 = v4;
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_INFO, "%s Training has already started at state %zd - resuming.", (uint8_t *)&v20, 0x16u);
    }
    [(VTUIProximityEnrollTrainingViewController *)self _resumeTraining];
  }
}

- (void)_advanceState
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  unint64_t currentTrainingState = self->_currentTrainingState;
  if (currentTrainingState >= [(NSArray *)self->_trainingPageInstructions count] - 1)
  {
    if (self->_currentTrainingState != 5)
    {
      self->_unint64_t currentTrainingState = 5;
      [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingCompleted:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingCompleted] + 1];
      if (self->_enrollmentMode == 5)
      {
        [(VTUIProximityEnrollTrainingViewController *)self _markEnrollmentSuccessForVoiceProfile:1];
        [(VTUIProximityEnrollTrainingViewController *)self _finishSiriSetup:0];
        [(VTUIProximityEnrollTrainingViewController *)self finish:0];
      }
      else
      {
        [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:1];
        id v6 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPagedLabel];
        v12[0] = MEMORY[0x263EF8330];
        v12[1] = 3221225472;
        v12[2] = __58__VTUIProximityEnrollTrainingViewController__advanceState__block_invoke;
        v12[3] = &unk_264D4C280;
        v12[4] = self;
        [v6 slideInText:0 afterDelay:v12 completion:0.0];
      }
      __int16 v7 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v14 = "-[VTUIProximityEnrollTrainingViewController _advanceState]";
        _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s Completed Last stage in Training", buf, 0xCu);
      }
      int64_t v8 = [MEMORY[0x263F283F8] sharedAnalytics];
      uint64_t v9 = (void *)[v8 newTurnBasedInstrumentationContext];

      id v10 = objc_alloc_init(MEMORY[0x263F6ED78]);
      [v10 setInvocationSource:45];
      [v9 emitInstrumentation:v10];
      uint64_t v11 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v11 logEventWithType:5503 context:0];

      +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:self->_trainingAttemptUUID enrollmentMode:self->_enrollmentMode locale:self->_spokenLanguageCode enrollmentSessionOutcome:1 pageNumber:LODWORD(self->_currentTrainingState)];
    }
  }
  else
  {
    self->_hasRetriedTraining = 0;
    ++self->_currentTrainingState;
    -[VTUIProximityEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:");
    int64_t v4 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v5 = self->_currentTrainingState;
      *(_DWORD *)buf = 136315394;
      id v14 = "-[VTUIProximityEnrollTrainingViewController _advanceState]";
      __int16 v15 = 2048;
      int64_t v16 = v5;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Advance to Next stage in Training - Current state : %zd", buf, 0x16u);
    }
  }
}

uint64_t __58__VTUIProximityEnrollTrainingViewController__advanceState__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showEnrollmentSuccessView];
}

- (void)_showInstruction:(int64_t)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  [(VTUIProximityEnrollTrainingViewController *)self _updatePageNumberForInstruction:a3];
  int64_t currentTrainingState = self->_currentTrainingState;
  [(VTUIProximityEnrollTrainingViewController *)self _showTrainingInstruction:currentTrainingState afterDelay:v4 isRetry:1 animate:0.0];
}

- (id)_retryStringForStatus:(int64_t)a3
{
  int64_t v5 = +[VTUIStringsHelper sharedStringsHelper];
  id v6 = [v5 uiLocalizedStringForKey:@"TRY_AGAIN_MESSAGE"];

  if (a3 == 2)
  {
    if ([(VTUIProximityEnrollTrainingViewController *)self cannotHearRetryCount] != 1)
    {
      if (![(VTUIProximityEnrollTrainingViewController *)self cannotHearRetryCount]) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_7:
    __int16 v7 = +[VTUIStringsHelper sharedStringsHelper];
    int64_t v8 = v7;
    uint64_t v9 = @"TRY_AGAIN_CANNOT_HEAR_MESSAGE";
LABEL_10:
    uint64_t v10 = [v7 uiLocalizedStringForKey:v9];

    id v6 = (void *)v10;
    goto LABEL_11;
  }
  if (a3 != 9) {
    goto LABEL_11;
  }
  if ([(VTUIProximityEnrollTrainingViewController *)self digitalZerosRetryCount] == 1) {
    goto LABEL_7;
  }
  if ([(VTUIProximityEnrollTrainingViewController *)self digitalZerosRetryCount])
  {
LABEL_9:
    __int16 v7 = +[VTUIStringsHelper sharedStringsHelper];
    int64_t v8 = v7;
    uint64_t v9 = @"TRY_AGAIN_STILL_CANNOT_HEAR_MESSAGE";
    goto LABEL_10;
  }
LABEL_11:
  return v6;
}

- (void)_retryInstruction:(BOOL)a3 withStatusMessage:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  __int16 v7 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[VTUIProximityEnrollTrainingViewController _retryInstruction:withStatusMessage:]";
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  int64_t v8 = [VTUIProximityTryAgainView alloc];
  uint64_t v9 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v9 bounds];
  uint64_t v10 = -[VTUIProximityTryAgainView initWithFrame:](v8, "initWithFrame:");
  tryAgainView = self->_tryAgainView;
  self->_tryAgainView = v10;

  [(VTUIProximityTryAgainView *)self->_tryAgainView setAutoresizingMask:18];
  __int16 v12 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v12 addSubview:self->_tryAgainView];

  int v13 = [(VTUIProximityTryAgainView *)self->_tryAgainView dismissButton];
  [v13 addTarget:self action:sel__dismiss_ forControlEvents:64];

  objc_initWeak((id *)buf, self);
  id v14 = (void *)MEMORY[0x263F82E00];
  __int16 v15 = [(VTUIProximityEnrollTrainingViewController *)self enrollTrainingView];
  int64_t v16 = [(VTUIProximityEnrollTrainingViewController *)self tryAgainView];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke;
  v17[3] = &unk_264D4C620;
  objc_copyWeak(&v18, (id *)buf);
  BOOL v19 = a3;
  [v14 transitionFromView:v15 toView:v16 duration:5242880 options:v17 completion:0.4];

  objc_destroyWeak(&v18);
  objc_destroyWeak((id *)buf);
}

void __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 2000000000);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2;
  v3[3] = &unk_264D4C3B8;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  char v5 = *(unsigned char *)(a1 + 40);
  dispatch_after(v2, MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(&v4);
}

void __81__VTUIProximityEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _autoContinueFromRetry:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_autoContinueFromRetry:(BOOL)a3
{
  [(VTUIProximityEnrollTrainingViewController *)self _hideInstruction];
  if (([(VTUIProximityEnrollTrainingViewController *)self currentTrainingState] & 0x8000000000000000) == 0
    && [(VTUIProximityEnrollTrainingViewController *)self currentTrainingState] <= 4)
  {
    [(VTUIProximityEnrollTrainingViewController *)self _updatePageNumberForInstruction:[(VTUIProximityEnrollTrainingViewController *)self currentTrainingState]];
  }
  char v5 = (void *)MEMORY[0x263F82E00];
  id v6 = [(VTUIProximityEnrollTrainingViewController *)self tryAgainView];
  __int16 v7 = [(VTUIProximityEnrollTrainingViewController *)self enrollTrainingView];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__VTUIProximityEnrollTrainingViewController__autoContinueFromRetry___block_invoke;
  v8[3] = &unk_264D4C648;
  v8[4] = self;
  BOOL v9 = a3;
  [v5 transitionFromView:v6 toView:v7 duration:5242880 options:v8 completion:0.4];
}

void __68__VTUIProximityEnrollTrainingViewController__autoContinueFromRetry___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) currentTrainingState] & 0x8000000000000000) == 0
    && [*(id *)(a1 + 32) currentTrainingState] <= 4)
  {
    objc_msgSend(*(id *)(a1 + 32), "_showTrainingInstruction:afterDelay:isRetry:animate:", objc_msgSend(*(id *)(a1 + 32), "currentTrainingState"), *(unsigned char *)(a1 + 40) == 0, 1, 0.0);
    dispatch_time_t v2 = NSString;
    BOOL v3 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*(id *)(a1 + 32), "currentTrainingState"));
    id v4 = [v2 stringWithFormat:@"%@", v3];

    char v5 = [MEMORY[0x263F283F8] sharedAnalytics];
    BOOL v9 = @"currentTrainingState";
    v10[0] = v4;
    id v6 = [NSDictionary dictionaryWithObjects:v10 forKeys:&v9 count:1];
    [v5 logEventWithType:5511 context:v6];
  }
  __int16 v7 = [*(id *)(a1 + 32) tryAgainView];

  if (v7)
  {
    int64_t v8 = [*(id *)(a1 + 32) tryAgainView];
    [v8 removeFromSuperview];

    [*(id *)(a1 + 32) setTryAgainView:0];
  }
}

- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v53 = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 1024;
    BOOL v50 = v7;
    __int16 v51 = 1024;
    BOOL v52 = v6;
    _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Instruction Number %ld, isRetry %d, animate %d", buf, 0x22u);
  }
  unint64_t v12 = [(NSArray *)self->_trainingPageInstructions count];
  if ((a3 & 0x8000000000000000) == 0 && v12 > a3)
  {
    char v31 = +[VTUIStyle sharedStyle];
    int v13 = [(NSArray *)self->_trainingPageInstructions objectAtIndexedSubscript:a3];
    id v14 = [v13 objectForKeyedSubscript:@"Instruction"];
    uint64_t v29 = [v31 VTUIDeviceSpecificString:v14];

    __int16 v15 = [v13 objectForKeyedSubscript:@"RetryOnFail"];
    char v16 = [v15 BOOLValue];

    uint64_t v17 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView orbView];
    [v17 animateToOffWithCompletion:0];

    [(VTUIProximityEnrollTrainingViewController *)self _createTrainingManagerIfNeeded];
    if ((unint64_t)a3 <= 4)
    {
      id v18 = [MEMORY[0x263F283F8] sharedAnalytics];
      v47 = @"instruction";
      uint64_t v48 = v29;
      BOOL v19 = [NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
      [v18 logEventWithType:a3 + 5505 context:v19];
    }
    int v20 = [(VTUIAudioHintPlayer *)self->_audioHintPlayer synth];
    [v20 stopSpeaking];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v50) = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke;
    aBlock[3] = &unk_264D4C670;
    objc_copyWeak(v45, &location);
    v45[1] = (id)a3;
    uint64_t v21 = _Block_copy(aBlock);
    v39[0] = MEMORY[0x263EF8330];
    v39[1] = 3221225472;
    void v39[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2;
    v39[3] = &unk_264D4C6C0;
    objc_copyWeak(v40, &location);
    v40[1] = (id)a3;
    BOOL v41 = v7;
    BOOL v42 = v6;
    v39[4] = self;
    v39[5] = buf;
    char v43 = v16;
    uint64_t v22 = _Block_copy(v39);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    void v36[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_148;
    v36[3] = &unk_264D4C458;
    int64_t v23 = v21;
    id v37 = v23;
    id v24 = v22;
    id v38 = v24;
    int64_t v25 = (void (**)(void))_Block_copy(v36);
    if ([(VTUIProximityEnrollTrainingViewController *)self _shouldSpeakAudioHint])
    {
      if (v6)
      {
        uint64_t v26 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPagedLabel];
        [v26 slideInText:v30 afterDelay:v23 completion:a4];
      }
      else
      {
        v23[2](v23);
      }
      v28 = [(VTUIProximityEnrollTrainingViewController *)self trainingManager];
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      void v32[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_149;
      v32[3] = &unk_264D4C4A8;
      objc_copyWeak(v35, &location);
      v35[1] = (id)a3;
      uint64_t v34 = buf;
      id v33 = v24;
      [v28 prepareWithCompletion:v32];

      objc_destroyWeak(v35);
    }
    else if (v6)
    {
      v27 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPagedLabel];
      [v27 slideInText:v30 afterDelay:v25 completion:a4];
    }
    else
    {
      v25[2](v25);
    }

    objc_destroyWeak(v40);
    objc_destroyWeak(v45);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained _updatePageNumberForInstruction:*(void *)(a1 + 40)];
    id WeakRetained = v3;
  }
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained enrollTrainingView];
    char v5 = [v4 orbView];
    [v5 setMode:1];

    BOOL v6 = [v3 trainingManager];
    [v6 startRMS];

    if (v3[1156])
    {
      int v7 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
      BOOL v9 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
      if (v7) {
        BOOL v9 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
      }
      LODWORD(v8) = 20.0;
      [*(id *)&v3[*v9] startAdvertisingForPHSSetupAfterDelay:0.0 maxInterval:v8];
    }
    uint64_t v10 = (void *)*((void *)v3 + 130);
    uint64_t v11 = *(void *)(a1 + 56) + 1;
    unint64_t v12 = [*(id *)(a1 + 32) trainingAttemptUUID];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_3;
    v15[3] = &unk_264D4C698;
    uint64_t v13 = *(void *)(a1 + 56);
    char v16 = *(unsigned char *)(a1 + 64);
    __int16 v17 = *(_WORD *)(a1 + 65);
    uint64_t v14 = *(void *)(a1 + 40);
    void v15[4] = *(void *)(a1 + 32);
    v15[5] = v3;
    v15[6] = v14;
    v15[7] = v13;
    *((void *)v3 + 129) = [v10 trainUtterance:v11 shouldUseASR:1 mhUUID:v12 completionWithResult:v15];
  }
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_3(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a2;
  BOOL v6 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v7 = v6;
    uint64_t v8 = [v5 sessionId];
    uint64_t v9 = *(void *)(a1 + 56);
    int v10 = *(unsigned __int8 *)(a1 + 64);
    int v11 = *(unsigned __int8 *)(a1 + 65);
    unint64_t v12 = [*(id *)(a1 + 32) trainingAttemptUUID];
    uint64_t v13 = [v12 UUIDString];
    *(_DWORD *)buf = 136316418;
    v32 = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_3";
    __int16 v33 = 2048;
    uint64_t v34 = v8;
    __int16 v35 = 2048;
    uint64_t v36 = v9;
    __int16 v37 = 1024;
    int v38 = v10;
    __int16 v39 = 1024;
    int v40 = v11;
    __int16 v41 = 2112;
    BOOL v42 = v13;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s SessionID: %ld, Instruction Number %ld, isRetry %d, animate %d attemptUUID: %@", buf, 0x36u);
  }
  if (*(void *)(a1 + 40))
  {
    int v14 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
    __int16 v15 = *(void **)(a1 + 40);
    if (v14) {
      [v15 scdaCoordinator];
    }
    else {
    char v16 = [v15 myriadCoordinator];
    }
    LODWORD(v17) = 0.5;
    [v16 endAdvertisingAfterDelay:v17];

    id v18 = [*(id *)(a1 + 40) trainingManager];
    [v18 stopRMS];

    BOOL v19 = [*(id *)(a1 + 40) enrollTrainingView];
    int v20 = [v19 orbView];
    [v20 animateToOffWithCompletion:0];

    [*(id *)(a1 + 40) _resetIdleTimer];
    if (objc_msgSend(*(id *)(a1 + 40), "interpretSessionManagerResult:forInstruction:", v5, objc_msgSend(*(id *)(a1 + 40), "currentTrainingState")) == 1)uint64_t v21 = 1; {
    else
    }
      uint64_t v21 = 3;
    uint64_t v22 = [*(id *)(a1 + 40) trainingAttemptUUID];
    int64_t v23 = *(void **)(a1 + 40);
    uint64_t v24 = v23[132];
    int64_t v25 = [v23 spokenLanguageCode];
    uint64_t v26 = *(unsigned int *)(a1 + 56);
    uint64_t v27 = *(unsigned __int8 *)(a1 + 64);
    char v28 = [*(id *)(a1 + 40) _shouldSpeakAudioHint];
    BYTE1(v30) = *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
    LOBYTE(v30) = v28;
    +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", v22, v24, v25, v21, v26, v27, v30);

    uint64_t v29 = *(void **)(a1 + 40);
    if (*(unsigned char *)(a1 + 66))
    {
      [v29 setHasRetriedTraining:*(unsigned __int8 *)(a1 + 64)];
      [*(id *)(a1 + 40) _handleTrainingResultForRetryablePhraseWithResult:v5 shouldShowCheckMark:a3];
    }
    else
    {
      [v29 _handleTrainingResultForNonRetryablePhraseWithResult:v5];
    }
  }
}

uint64_t __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_148(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  dispatch_time_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_149(uint64_t a1, char a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if ((a2 & 1) == 0)
  {
    id v3 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v14 = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_2";
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Error preparing audio session", buf, 0xCu);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v6 = (void *)*((void *)WeakRetained + 160);
    uint64_t v7 = *(void *)(a1 + 56);
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    void v10[2] = __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_150;
    v10[3] = &unk_264D4C480;
    objc_copyWeak(&v12, (id *)(a1 + 48));
    long long v9 = *(_OWORD *)(a1 + 32);
    id v8 = (id)v9;
    long long v11 = v9;
    [v6 speakAudioHint:v7 completion:v10];

    objc_destroyWeak(&v12);
  }
}

void __97__VTUIProximityEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_150(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    int v6 = *((unsigned __int8 *)WeakRetained + 987);
    uint64_t v7 = [WeakRetained[160] synth];
    int v8 = [v7 isSpeaking];

    long long v9 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      id v12 = "-[VTUIProximityEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
      __int16 v13 = 1024;
      int v14 = v8;
      __int16 v15 = 1024;
      BOOL v16 = v6 == 0;
      __int16 v17 = 2112;
      id v18 = v3;
      _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s Audio Hint Synthesized. Synthesizer isSpeaking %d, view active: %d, error:%@ ", (uint8_t *)&v11, 0x22u);
    }
    if (v6) {
      char v10 = 1;
    }
    else {
      char v10 = v8;
    }
    if ((v10 & 1) == 0) {
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    }
  }
}

- (void)_handleTrainingResultForNonRetryablePhraseWithResult:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F28398];
  int v6 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    int v8 = [v4 sessionStatus];
    int v9 = [v4 audioStatus];
    unint64_t badMicRetryCount = self->_badMicRetryCount;
    *(_DWORD *)buf = 136315906;
    int v38 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    __int16 v39 = 1024;
    *(_DWORD *)int v40 = v8;
    *(_WORD *)&v40[4] = 1024;
    *(_DWORD *)&v40[6] = v9;
    __int16 v41 = 2048;
    unint64_t v42 = badMicRetryCount;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, badMicRetryCount: %lu", buf, 0x22u);
  }
  int64_t v11 = [(VTUIProximityEnrollTrainingViewController *)self interpretSessionManagerResult:v4 forInstruction:self->_currentTrainingState];
  id v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v38 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    __int16 v39 = 2048;
    *(void *)int v40 = v11;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  switch(v11)
  {
    case 1:
      self->_int64_t consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      v30[0] = MEMORY[0x263EF8330];
      v30[1] = 3221225472;
      void v30[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_6;
      v30[3] = &unk_264D4C258;
      objc_copyWeak(&v31, (id *)buf);
      [(VTUIProximityEnrollTrainingViewController *)self _animateCheckMark:1 completion:v30];
      objc_destroyWeak(&v31);
      break;
    case 4:
      [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
      BOOL v16 = [MEMORY[0x263F78BB8] sharedInstance];
      __int16 v17 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
      id v18 = (id)[v16 deleteUserVoiceProfile:v17];

      v36[0] = MEMORY[0x263EF8330];
      v36[1] = 3221225472;
      void v36[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke;
      v36[3] = &unk_264D4C280;
      void v36[4] = self;
      [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v36 status:4];
      break;
    case 5:
      unint64_t v19 = self->_badMicRetryCount + 1;
      self->_unint64_t badMicRetryCount = v19;
      if (v19 < 6)
      {
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        void v32[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5;
        v32[3] = &unk_264D4C280;
        void v32[4] = self;
        [(VTUIProximityEnrollTrainingViewController *)self _showBadMicAlertCompletion:v32];
      }
      else
      {
        [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        int v20 = [MEMORY[0x263F78BB8] sharedInstance];
        uint64_t v21 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v22 = (id)[v20 deleteUserVoiceProfile:v21];

        v33[0] = MEMORY[0x263EF8330];
        v33[1] = 3221225472;
        void v33[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4;
        v33[3] = &unk_264D4C280;
        v33[4] = self;
        [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v33 status:5];
      }
      break;
    case 6:
      unint64_t v23 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v23;
      if (v23 < 6)
      {
        dispatch_time_t v29 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3;
        block[3] = &unk_264D4C280;
        void block[4] = self;
        dispatch_after(v29, MEMORY[0x263EF83A0], block);
      }
      else
      {
        [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        uint64_t v24 = [MEMORY[0x263F78BB8] sharedInstance];
        int64_t v25 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v26 = (id)[v24 deleteUserVoiceProfile:v25];

        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        id v35[2] = __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2;
        v35[3] = &unk_264D4C280;
        v35[4] = self;
        [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v35 status:6];
      }
      break;
    case 7:
      break;
    case 8:
      int64_t consecutiveTimeoutCount = self->_consecutiveTimeoutCount;
      self->_int64_t consecutiveTimeoutCount = consecutiveTimeoutCount + 1;
      if (consecutiveTimeoutCount >= 1) {
        self->_shouldTurnOnMyriad = 0;
      }
      __int16 v15 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:8];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v15];

      break;
    case 9:
      ++self->_digitalZerosRetryCount;
      uint64_t v27 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:9];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v27];

      break;
    case 10:
      ++self->_cannotHearRetryCount;
      char v28 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:10];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v28];

      break;
    default:
      __int16 v13 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:0];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v13];

      break;
  }
  objc_destroyWeak((id *)buf);
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipSetup];
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipSetup];
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeTraining];
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipSetup];
}

uint64_t __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryAfterBadMicAlert];
}

void __98__VTUIProximityEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _advanceState];
}

- (void)_handleTrainingResultForRetryablePhraseWithResult:(id)a3 shouldShowCheckMark:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x263F28398];
  int v8 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    int v10 = [v6 sessionStatus];
    int v11 = [v6 audioStatus];
    unint64_t badMicRetryCount = self->_badMicRetryCount;
    *(_DWORD *)buf = 136316162;
    int v40 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    __int16 v41 = 1024;
    *(_DWORD *)unint64_t v42 = v10;
    *(_WORD *)&v42[4] = 1024;
    *(_DWORD *)&v42[6] = v11;
    __int16 v43 = 1024;
    BOOL v44 = v4;
    __int16 v45 = 2048;
    unint64_t v46 = badMicRetryCount;
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, shouldShowCheckMark:%d, badMicRetryCount: %lu", buf, 0x28u);
  }
  int64_t v13 = [(VTUIProximityEnrollTrainingViewController *)self interpretSessionManagerResult:v6 forInstruction:self->_currentTrainingState];
  int v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v40 = "-[VTUIProximityEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    __int16 v41 = 2048;
    *(void *)unint64_t v42 = v13;
    _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  objc_initWeak((id *)buf, self);
  switch(v13)
  {
    case 2:
      self->_int64_t consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      [(VTUIAnalytics *)self->_analyticsEvent setAsrError:[(VTUIAnalytics *)self->_analyticsEvent asrError] + 1];
      if (self->_hasRetriedTraining) {
        goto LABEL_10;
      }
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:0 withStatusMessage:0];
      break;
    case 3:
      self->_int64_t consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      if (v4)
      {
        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        void v32[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_6;
        v32[3] = &unk_264D4C258;
        objc_copyWeak(&v33, (id *)buf);
        [(VTUIProximityEnrollTrainingViewController *)self _animateCheckMark:1 completion:v32];
        objc_destroyWeak(&v33);
      }
      else
      {
LABEL_10:
        [(VTUIProximityEnrollTrainingViewController *)self _advanceState];
      }
      break;
    case 4:
      [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
      int v20 = [MEMORY[0x263F78BB8] sharedInstance];
      uint64_t v21 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
      id v22 = (id)[v20 deleteUserVoiceProfile:v21];

      v38[0] = MEMORY[0x263EF8330];
      v38[1] = 3221225472;
      void v38[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke;
      v38[3] = &unk_264D4C280;
      v38[4] = self;
      [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v38 status:4];
      break;
    case 5:
      unint64_t v15 = self->_badMicRetryCount + 1;
      self->_unint64_t badMicRetryCount = v15;
      if (v15 < 6)
      {
        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        void v34[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5;
        v34[3] = &unk_264D4C280;
        v34[4] = self;
        [(VTUIProximityEnrollTrainingViewController *)self _showBadMicAlertCompletion:v34];
      }
      else
      {
        [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        BOOL v16 = [MEMORY[0x263F78BB8] sharedInstance];
        __int16 v17 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v18 = (id)[v16 deleteUserVoiceProfile:v17];

        v35[0] = MEMORY[0x263EF8330];
        v35[1] = 3221225472;
        id v35[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4;
        v35[3] = &unk_264D4C280;
        v35[4] = self;
        [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v35 status:5];
      }
      break;
    case 6:
      unint64_t v23 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v23;
      if (v23 < 6)
      {
        dispatch_time_t v31 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3;
        block[3] = &unk_264D4C280;
        void block[4] = self;
        dispatch_after(v31, MEMORY[0x263EF83A0], block);
      }
      else
      {
        [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        uint64_t v24 = [MEMORY[0x263F78BB8] sharedInstance];
        int64_t v25 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v26 = (id)[v24 deleteUserVoiceProfile:v25];

        v37[0] = MEMORY[0x263EF8330];
        v37[1] = 3221225472;
        void v37[2] = __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2;
        v37[3] = &unk_264D4C280;
        v37[4] = self;
        [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v37 status:6];
      }
      break;
    case 7:
      break;
    case 8:
      int64_t consecutiveTimeoutCount = self->_consecutiveTimeoutCount;
      self->_int64_t consecutiveTimeoutCount = consecutiveTimeoutCount + 1;
      if (consecutiveTimeoutCount >= 1) {
        self->_shouldTurnOnMyriad = 0;
      }
      [(VTUIAnalytics *)self->_analyticsEvent setVtError:[(VTUIAnalytics *)self->_analyticsEvent vtError] + 1];
      char v28 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:8];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v28];

      break;
    case 9:
      ++self->_digitalZerosRetryCount;
      dispatch_time_t v29 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:9];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v29];

      break;
    case 10:
      ++self->_cannotHearRetryCount;
      uint64_t v30 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:10];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v30];

      break;
    default:
      [(VTUIAnalytics *)self->_analyticsEvent setVtError:[(VTUIAnalytics *)self->_analyticsEvent vtError] + 1];
      unint64_t v19 = [(VTUIProximityEnrollTrainingViewController *)self _retryStringForStatus:0];
      [(VTUIProximityEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v19];

      break;
  }
  objc_destroyWeak((id *)buf);
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipSetup];
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipSetup];
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeTraining];
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipSetup];
}

uint64_t __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryAfterBadMicAlert];
}

void __115__VTUIProximityEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_6(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _advanceState];
}

- (void)_showBadMicAlertCompletion:(id)a3
{
  id v19 = a3;
  int v20 = [(VTUIProximityEnrollTrainingViewController *)self interpretAudioSource:[(SSRVTUITrainingManager *)self->_trainingManager audioSource]];
  BOOL v4 = (void *)MEMORY[0x263F82418];
  id v5 = NSString;
  id v6 = +[VTUIStringsHelper sharedStringsHelper];
  uint64_t v7 = [v6 uiLocalizedStringForKey:@"ALERT_TITLE_BAD_MIC"];
  int v8 = +[VTUIStringsHelper sharedStringsHelper];
  int v9 = [v8 uiLocalizedStringForKey:v20];
  int v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);
  int v11 = +[VTUIStringsHelper sharedStringsHelper];
  id v12 = [v11 uiLocalizedStringForKey:@"ALERT_MAIN_BAD_MIC"];
  int64_t v13 = [v4 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

  int v14 = (void *)MEMORY[0x263F82400];
  unint64_t v15 = +[VTUIStringsHelper sharedStringsHelper];
  BOOL v16 = [v15 uiLocalizedStringForKey:@"ALERT_BUTTON_BAD_MIC"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __72__VTUIProximityEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke;
  v21[3] = &unk_264D4C348;
  id v22 = v19;
  id v17 = v19;
  id v18 = [v14 actionWithTitle:v16 style:0 handler:v21];

  [v13 addAction:v18];
  [(VTUIProximityEnrollTrainingViewController *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __72__VTUIProximityEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_showUnsupportedLocaleAlertCompletion:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x263F82418];
  id v6 = +[VTUIStringsHelper sharedStringsHelper];
  uint64_t v7 = [v6 uiLocalizedStringForKey:@"ALERT_TITLE_UNSUPPORTED_LOCALE"];
  int v8 = +[VTUIStringsHelper sharedStringsHelper];
  int v9 = [v8 uiLocalizedStringForKey:@"ALERT_MAIN_UNSUPPORTED_LOCALE"];
  int v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  int v11 = (void *)MEMORY[0x263F82400];
  id v12 = +[VTUIStringsHelper sharedStringsHelper];
  int64_t v13 = [v12 uiLocalizedStringForKey:@"ALERT_BUTTON_UNSUPPORTED_LOCALE"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __83__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke;
  v16[3] = &unk_264D4C348;
  id v17 = v4;
  id v14 = v4;
  unint64_t v15 = [v11 actionWithTitle:v13 style:0 handler:v16];

  [v10 addAction:v15];
  [(VTUIProximityEnrollTrainingViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __83__VTUIProximityEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_updatePageNumberForInstruction:(int64_t)a3
{
  id v14 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v5 = NSString;
  id v6 = +[VTUIStringsHelper sharedStringsHelper];
  uint64_t v7 = [v6 uiLocalizedStringForKey:@"PAGE_PROGRESS_FORMAT"];
  int v8 = [NSNumber numberWithInteger:a3 + 1];
  int v9 = [v14 stringFromNumber:v8];
  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_trainingPageInstructions, "count"));
  int v11 = [v14 stringFromNumber:v10];
  id v12 = objc_msgSend(v5, "stringWithFormat:", v7, v9, v11);

  int64_t v13 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView pageLabel];
  [v13 setText:v12];
}

- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  dispatch_time_t v10 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke;
  v13[3] = &unk_264D4C5D8;
  objc_copyWeak(&v16, &location);
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_after(v10, MEMORY[0x263EF83A0], v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

void __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke(id *a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    uint64_t v3 = [a1[4] length];
    id v4 = [WeakRetained[146] statusLabel];
    id v5 = v4;
    if (v3)
    {
      [v4 setAlpha:0.0];

      id v6 = [WeakRetained[146] statusLabel];
      [v6 setText:a1[4]];

      uint64_t v7 = (void *)MEMORY[0x263F82E00];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_2;
      v18[3] = &unk_264D4C280;
      v18[4] = WeakRetained;
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_3;
      v16[3] = &unk_264D4C6E8;
      id v17 = a1[5];
      [v7 animateWithDuration:v18 animations:v16 completion:0.3];
      id v8 = v17;
LABEL_6:

      goto LABEL_7;
    }
    [v4 alpha];
    double v10 = v9;

    if (v10 > 0.0)
    {
      id v11 = (void *)MEMORY[0x263F82E00];
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_4;
      v15[3] = &unk_264D4C280;
      void v15[4] = WeakRetained;
      v13[0] = MEMORY[0x263EF8330];
      v13[1] = 3221225472;
      v13[2] = __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_5;
      v13[3] = &unk_264D4C710;
      void v13[4] = WeakRetained;
      id v14 = a1[5];
      [v11 animateWithDuration:v15 animations:v13 completion:0.3];
      id v8 = v14;
      goto LABEL_6;
    }
    id v12 = (void (**)(void))a1[5];
    if (v12) {
      v12[2]();
    }
  }
LABEL_7:
}

void __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1168) statusLabel];
  [v1 setAlpha:1.0];
}

uint64_t __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1168) statusLabel];
  [v1 setAlpha:0.0];
}

uint64_t __86__VTUIProximityEnrollTrainingViewController__showStatusMessage_afterDelay_completion___block_invoke_5(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(*(void *)(a1 + 32) + 1168) statusLabel];
  [v2 setText:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)_hideInstruction
{
  uint64_t v3 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView instructionPagedLabel];
  [v3 clear];

  id v4 = [(VTUIProximityEnrollTrainingViewController *)self navigationItem];
  [v4 setTitle:0];
}

- (void)_createTrainingManagerIfNeeded
{
  if (!self->_trainingManager)
  {
    uint64_t v3 = [MEMORY[0x263F78BA8] trainingManagerWithLocaleID:self->_spokenLanguageCode withAppDomain:*MEMORY[0x263F78BC0]];
    trainingManager = self->_trainingManager;
    self->_trainingManager = v3;

    id v5 = self->_trainingManager;
    [(SSRVTUITrainingManager *)v5 setDelegate:self];
  }
}

- (void)_resetTrainingManager
{
}

- (void)_cleanupTrainingManagerWithCompletion:(id)a3 status:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = NSNumber;
    double v9 = v7;
    double v10 = [v8 numberWithInteger:a4];
    int v11 = 136315394;
    id v12 = "-[VTUIProximityEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:]";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v6];
}

- (void)_cleanupTrainingManagerWithCompletion:(id)a3
{
  id v4 = (uint64_t (**)(id))a3;
  trainingManager = self->_trainingManager;
  if (trainingManager)
  {
    id v6 = v4;
    [(SSRVTUITrainingManager *)trainingManager cancelTrainingForID:self->_sessionId];
    [(SSRVTUITrainingManager *)self->_trainingManager stopRMS];
    trainingManager = (SSRVTUITrainingManager *)(id)[(SSRVTUITrainingManager *)self->_trainingManager cleanupWithCompletion:v6];
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v6 = v4;
    trainingManager = (SSRVTUITrainingManager *)v4[2](v4);
  }
  id v4 = v6;
LABEL_6:
  MEMORY[0x270F9A758](trainingManager, v4);
}

- (BOOL)_shouldSpeakAudioHint
{
  return [(VTUIAudioHintPlayer *)self->_audioHintPlayer shouldSpeakAudioHint];
}

- (id)interpretAudioSource:(unint64_t)a3
{
  if (a3 - 2 > 3) {
    return @"ALERT_HEADPHONE_BAD_MIC";
  }
  else {
    return off_264D4C778[a3 - 2];
  }
}

- (void)_gatherAudioDeviceInfo
{
  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__VTUIProximityEnrollTrainingViewController__gatherAudioDeviceInfo__block_invoke;
  v4[3] = &unk_264D4C258;
  objc_copyWeak(&v5, &location);
  dispatch_async(settingsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __67__VTUIProximityEnrollTrainingViewController__gatherAudioDeviceInfo__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    dispatch_time_t v2 = WeakRetained;
    [WeakRetained[137] getConnectedBluetoothDeviceInfoArrayWithCompletion:&__block_literal_global_0];
    id WeakRetained = v2;
  }
}

void __67__VTUIProximityEnrollTrainingViewController__gatherAudioDeviceInfo__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v2 = a2;
  uint64_t v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        int v8 = objc_msgSend(v7, "productID", (void)v13);
        double v9 = +[VTUIStyle sharedStyle];
        uint64_t v10 = [v9 audioProductID];

        if (v10 == v8)
        {
          int v11 = [v7 name];
          id v12 = +[VTUIStyle sharedStyle];
          [v12 setAudioAccessoryName:v11];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (int64_t)interpretSessionManagerResult:(id)a3 forInstruction:(int64_t)a4
{
  id v6 = a3;
  unsigned int v7 = [v6 sessionStatus];
  int v8 = [v6 audioStatus];

  uint64_t v9 = v7 - 4;
  if (v9 < 3) {
    return v9 + 5;
  }
  if (a4 < 0
    || ([(VTUIProximityEnrollTrainingViewController *)self trainingPageInstructions],
        int v11 = objc_claimAutoreleasedReturnValue(),
        unint64_t v12 = [v11 count],
        v11,
        v12 <= a4))
  {
    char v16 = 0;
  }
  else
  {
    long long v13 = [(VTUIProximityEnrollTrainingViewController *)self trainingPageInstructions];
    long long v14 = [v13 objectAtIndexedSubscript:a4];

    long long v15 = [v14 objectForKeyedSubscript:@"RetryOnFail"];
    char v16 = [v15 BOOLValue];
  }
  if (v7 == 3) {
    return 4;
  }
  if (v16)
  {
    if (v8 == 1)
    {
      return 9;
    }
    else if (v8 == 2)
    {
      return 10;
    }
    else if (v7 >= 8)
    {
      return 0;
    }
    else
    {
      return qword_2388E5370[v7];
    }
  }
  else
  {
    int64_t v17 = 8;
    if (v7 != 7) {
      int64_t v17 = 1;
    }
    if (v7 == 2) {
      return 0;
    }
    else {
      return v17;
    }
  }
}

- (id)_getSetupModeString
{
  id v2 = +[VTUIStyle sharedStyle];
  int v3 = [v2 isBuddyOrFollowUp];

  if (v3) {
    return @"buddy";
  }
  else {
    return @"prefs";
  }
}

- (void)VTUITrainingManagerFeedLevel:(float)a3
{
  id v5 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView orbView];
  *(float *)&double v4 = a3;
  [v5 setPowerLevel:v4];
}

- (void)aboutTapped:(id)a3
{
  double v4 = (UIView *)a3;
  [(VTUIAnalytics *)self->_analyticsEvent setAboutViewShown:[(VTUIAnalytics *)self->_analyticsEvent aboutViewShown] + 1];
  aboutTappedSender = self->_aboutTappedSender;
  self->_aboutTappedSender = v4;

  id v6 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
  [v6 showLearnMore];
}

- (void)siriLanguageSpokenLanguageCodeDidChange:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  double v4 = [a3 spokenLanguageCode];
  spokenLanguageCode = self->_spokenLanguageCode;
  self->_spokenLanguageCode = v4;

  [(VTUIAnalytics *)self->_analyticsEvent setLanguageCode:self->_spokenLanguageCode];
  id v6 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v7 = self->_spokenLanguageCode;
    int v8 = v6;
    uint64_t v9 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v10 = [v9 heySiriTriggerPhrase];
    int v14 = 136315650;
    long long v15 = "-[VTUIProximityEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
    __int16 v16 = 2112;
    int64_t v17 = v7;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code changed: %@. (Trigger: '%@')", (uint8_t *)&v14, 0x20u);
  }
  [(SSRVTUITrainingManager *)self->_trainingManager setLocaleIdentifier:self->_spokenLanguageCode];
  int v11 = +[VTUIStringsHelper sharedStringsHelper];
  [v11 setSiriLanguage:self->_spokenLanguageCode];

  unint64_t v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    long long v13 = self->_spokenLanguageCode;
    int v14 = 136315394;
    long long v15 = "-[VTUIProximityEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
    __int16 v16 = 2112;
    int64_t v17 = v13;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v14, 0x16u);
  }
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer setLanguage:self->_spokenLanguageCode];
  [(VTUIProximityEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode];
}

- (void)skipAssistant:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_isEnablementConfigurationLoading)
  {
    id v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[VTUIProximityEnrollTrainingViewController skipAssistant:]";
      _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip Assistant requested while Enablement configuration loading", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __59__VTUIProximityEnrollTrainingViewController_skipAssistant___block_invoke;
    v15[3] = &unk_264D4C4D0;
    objc_copyWeak(&v17, (id *)buf);
    id v16 = v4;
    [(VTUIProximityEnrollTrainingViewController *)self _setIntroViewActionOnEnablementConfigurationDidLoad:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    id v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      id v19 = "-[VTUIProximityEnrollTrainingViewController skipAssistant:]";
      _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping Setup / Assistant", buf, 0xCu);
    }
    unsigned int v7 = +[VTUIStyle sharedStyle];
    int v8 = [v7 isBuddyOrFollowUp];

    if (v8)
    {
      uint64_t v9 = +[VTUIStyle sharedStyle];
      BOOL v10 = [v9 enrollmentMode] == 0;

      if (v10)
      {
        [(VTUIAnalytics *)self->_analyticsEvent setSkippedFromIntroAOP:[(VTUIAnalytics *)self->_analyticsEvent skippedFromIntroAOP] + 1];
      }
      else
      {
        int v11 = +[VTUIStyle sharedStyle];
        BOOL v12 = [v11 enrollmentMode] == 3;

        if (v12) {
          [(VTUIAnalytics *)self->_analyticsEvent setSkippedFromIntroNonAOP:[(VTUIAnalytics *)self->_analyticsEvent skippedFromIntroNonAOP] + 1];
        }
      }
    }
    long long v13 = +[VTUIStyle sharedStyle];
    BOOL v14 = [v13 enrollmentMode] == 3;

    if (!v14) {
      [(VTUIProximityEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
    }
    [(VTUIProximityEnrollTrainingViewController *)self skipTraining:v4];
  }
}

void __59__VTUIProximityEnrollTrainingViewController_skipAssistant___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained skipAssistant:*(void *)(a1 + 32)];

  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VTUIProximityEnrollTrainingViewController skipAssistant:]_block_invoke";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Skip Assistant processed after Enablement configuration loaded", (uint8_t *)&v4, 0xCu);
  }
}

- (void)cancelTraining
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    BOOL v12 = "-[VTUIProximityEnrollTrainingViewController cancelTraining]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_INFO, "%s Cancel Training", buf, 0xCu);
  }
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer cleanup];
  int v4 = [MEMORY[0x263F283F8] sharedAnalytics];
  uint64_t v9 = @"currentTrainingState";
  id v5 = NSString;
  uint64_t v6 = [NSNumber numberWithInteger:self->_currentTrainingState];
  unsigned int v7 = [v5 stringWithFormat:@"%@", v6];
  BOOL v10 = v7;
  int v8 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v4 logEventWithType:5504 context:v8];

  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingCancelledStep:LODWORD(self->_currentTrainingState)];
  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingCancelled:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingCancelled] + 1];
  +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:self->_trainingAttemptUUID enrollmentMode:self->_enrollmentMode locale:self->_spokenLanguageCode enrollmentSessionOutcome:2 pageNumber:LODWORD(self->_currentTrainingState)];
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupHelper];
}

- (void)skipTraining:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[VTUIProximityEnrollTrainingViewController skipTraining:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_INFO, "%s Skipping Training", buf, 0xCu);
  }
  uint64_t v6 = [MEMORY[0x263F283F8] sharedAnalytics];
  id v17 = @"currentTrainingState";
  unsigned int v7 = NSString;
  int v8 = [NSNumber numberWithInteger:self->_currentTrainingState];
  uint64_t v9 = [v7 stringWithFormat:@"%@", v8];
  __int16 v18 = v9;
  BOOL v10 = [NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
  [v6 logEventWithType:5510 context:v10];

  self->_hasSkippedTraining = 1;
  trainingAttemptUUID = self->_trainingAttemptUUID;
  int64_t enrollmentMode = self->_enrollmentMode;
  spokenLanguageCode = self->_spokenLanguageCode;
  uint64_t currentTrainingState_low = LODWORD(self->_currentTrainingState);
  LOWORD(v16) = [(VTUIProximityEnrollTrainingViewController *)self _shouldSpeakAudioHint];
  +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", trainingAttemptUUID, enrollmentMode, spokenLanguageCode, 2, currentTrainingState_low, 0, v16);
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupHelper];
  long long v15 = [MEMORY[0x263F285A0] sharedPreferences];
  LODWORD(trainingAttemptUUID) = [v15 assistantIsEnabled];

  if (trainingAttemptUUID
    && [(VTUIProximityEnrollTrainingViewController *)self _shouldShowSiriDataSharingOptInView])
  {
    [(VTUIProximityEnrollTrainingViewController *)self _showSiriDataSharingOptInView];
  }
  else
  {
    [(VTUIProximityEnrollTrainingViewController *)self _skipSetup];
  }
}

- (void)_skipSetup
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F285A0] sharedPreferences];
  int v4 = [v3 assistantIsEnabled];

  id v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    enablementConfiguration = self->_enablementConfiguration;
    int v10 = 136315650;
    int v11 = "-[VTUIProximityEnrollTrainingViewController _skipSetup]";
    __int16 v12 = 1024;
    int v13 = v4;
    __int16 v14 = 2112;
    long long v15 = enablementConfiguration;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Ending setup, assistant enabled %d enablementConfiguration:%@", (uint8_t *)&v10, 0x1Cu);
  }
  if ((v4 & 1) == 0)
  {
    unsigned int v7 = self->_enablementConfiguration;
    if (v7)
    {
      int v8 = [(AFEnablementConfiguration *)v7 completionLoggingBlock];
      v8[2](v8, 0);
    }
  }
  uint64_t v9 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
  [v9 skipSetup];
}

- (void)_dismiss:(id)a3
{
  v26[1] = *MEMORY[0x263EF8340];
  int v4 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    uint64_t v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[VTUIProximityEnrollTrainingViewController _dismiss:]";
      _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_INFO, "%s Dismissing", buf, 0xCu);
    }
    unsigned int v7 = [MEMORY[0x263F283F8] sharedAnalytics];
    int64_t v25 = @"currentTrainingState";
    int v8 = NSString;
    uint64_t v9 = [NSNumber numberWithInteger:self->_currentTrainingState];
    int v10 = [v8 stringWithFormat:@"%@", v9];
    v26[0] = v10;
    int v11 = [NSDictionary dictionaryWithObjects:v26 forKeys:&v25 count:1];
    [v7 logEventWithType:5512 context:v11];

    [(VTUIProximityEnrollTrainingViewController *)self _cleanupHelper];
    __int16 v12 = [MEMORY[0x263F285A0] sharedPreferences];
    int v13 = [v12 assistantIsEnabled];

    __int16 v14 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      enablementConfiguration = self->_enablementConfiguration;
      *(_DWORD *)buf = 136315650;
      uint64_t v20 = "-[VTUIProximityEnrollTrainingViewController _dismiss:]";
      __int16 v21 = 1024;
      int v22 = v13;
      __int16 v23 = 2112;
      uint64_t v24 = enablementConfiguration;
      _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s Ending setup, assistant enabled %d enablementConfiguration:%@", buf, 0x1Cu);
    }
    if ((v13 & 1) == 0)
    {
      uint64_t v16 = self->_enablementConfiguration;
      if (v16)
      {
        id v17 = [(AFEnablementConfiguration *)v16 completionLoggingBlock];
        v17[2](v17, 0);
      }
    }
    __int16 v18 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
    [v18 dismissSetup];
  }
}

- (void)_cleanupHelper
{
  int v3 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
  int v4 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__myriadCoordinator;
  if (v3) {
    int v4 = &OBJC_IVAR___VTUIProximityEnrollTrainingViewController__scdaCoordinator;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v4) resetStateMachine];
  [(VTUIProximityEnrollTrainingViewController *)self _resetEnrollment];
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
  [(VTUIProximityEnrollTrainingViewController *)self setTrainingAttemptUUID:0];
}

- (BOOL)_shouldPresentLanguageDisambiguation
{
  return [(VTUIEnrollmentPageEligibilityProvider *)self->_pageEligibilityProvider shouldShowLanguageDisambiguationForBestFittingSiriLanguages:self->_siriLanguageOptions];
}

- (void)_setLanguageOptionsAndContinue
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __75__VTUIProximityEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke;
  v3[3] = &unk_264D4C4D0;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(VTUIProximityEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __75__VTUIProximityEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    __int16 v12 = WeakRetained;
    [WeakRetained[148] removeFromSuperview];
    id v3 = v12[148];
    v12[148] = 0;

    id WeakRetained = v12;
    if (!v12[156])
    {
      id v4 = [v12 view];
      char v5 = [VTUIProximityEnrollmentLanguageOptionsView alloc];
      uint64_t v6 = [v12 view];
      [v6 bounds];
      uint64_t v7 = -[VTUIProximityEnrollmentLanguageOptionsView initWithFrame:languageOptions:](v5, "initWithFrame:languageOptions:", v12[127]);
      id v8 = v12[156];
      v12[156] = (id)v7;

      [v12[156] setAutoresizingMask:18];
      [v4 addSubview:v12[156]];
      uint64_t v9 = [v12[156] continueButton];
      [v9 addTarget:*(void *)(a1 + 32) action:sel__processLanguageSelectionAction_ forControlEvents:64];

      int v10 = [v12[156] dismissButton];
      [v10 addTarget:*(void *)(a1 + 32) action:sel__dismiss_ forControlEvents:64];

      int v11 = [v12[146] skipButton];
      [v11 setHidden:1];

      id WeakRetained = v12;
    }
  }
}

- (void)_checkForPHSCloudDataIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4
    && (+[VTUIStyle sharedStyle],
        char v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 enrollmentMode],
        v5,
        !v6))
  {
    uint64_t v9 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__VTUIProximityEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke;
    v16[3] = &unk_264D4C4D0;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v4;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v16);
    id hasPHSInCloudFetchBlock = self->_hasPHSInCloudFetchBlock;
    self->_id hasPHSInCloudFetchBlock = v10;

    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    if (!hasPHSInCloudFetchQueue)
    {
      int v13 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      __int16 v14 = (OS_dispatch_queue *)dispatch_queue_create(0, v13);
      long long v15 = self->_hasPHSInCloudFetchQueue;
      self->_hasPHSInCloudFetchQueue = v14;

      hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    }
    dispatch_async(hasPHSInCloudFetchQueue, self->_hasPHSInCloudFetchBlock);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    uint64_t v7 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s Clearing fetch block", buf, 0xCu);
    }
    id v8 = self->_hasPHSInCloudFetchBlock;
    self->_id hasPHSInCloudFetchBlock = 0;
  }
}

void __78__VTUIProximityEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = [MEMORY[0x263F78BB8] sharedInstance];
    WeakRetained[985] = [v3 hasVoiceProfileIniCloudForLanguageCode:*(void *)(a1 + 32)];

    id v4 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = WeakRetained[985];
      int v6 = 136315394;
      uint64_t v7 = "-[VTUIProximityEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]_block_invoke";
      __int16 v8 = 1024;
      int v9 = v5;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s set cloud value %d", (uint8_t *)&v6, 0x12u);
    }
  }
}

- (BOOL)_hasPHSCloudDataForSpokenLanguage
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  if (self->_hasPHSInCloudFetchBlock
    || ([(VTUIProximityEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode], self->_hasPHSInCloudFetchBlock))
  {
    id v3 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      __int16 v14 = "-[VTUIProximityEnrollTrainingViewController _hasPHSCloudDataForSpokenLanguage]";
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Waiting on block", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __78__VTUIProximityEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke;
    v7[3] = &unk_264D4C538;
    objc_copyWeak(&v8, (id *)buf);
    v7[4] = &v9;
    dispatch_sync(hasPHSInCloudFetchQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __78__VTUIProximityEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[985];
}

- (void)_finishSiriSetup:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __62__VTUIProximityEnrollTrainingViewController__finishSiriSetup___block_invoke;
  v5[3] = &unk_264D4C258;
  objc_copyWeak(&v6, &location);
  [(VTUIProximityEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __62__VTUIProximityEnrollTrainingViewController__finishSiriSetup___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[135] setTurnOnSiriNonAOP:1];
    [v2 _setAssistantEnabled:1];
    id v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      id v6 = "-[VTUIProximityEnrollTrainingViewController _finishSiriSetup:]_block_invoke";
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    if ([v2 _shouldShowSiriDataSharingOptInView])
    {
      [v2 _showSiriDataSharingOptInView];
    }
    else
    {
      id v4 = [v2 delegate];
      [v4 continueSetup];
    }
  }
}

- (void)finish:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  [(VTUIProximityEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    uint64_t v7 = "-[VTUIProximityEnrollTrainingViewController finish:]";
    _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v6, 0xCu);
  }
  int v5 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
  [v5 continueSetup];
}

- (void)shouldAbortAnotherDeviceBetter:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIProximityEnrollTrainingViewController shouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s BTLE Device abort ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)shouldContinue:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIProximityEnrollTrainingViewController shouldContinue:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s BTLE Device continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIProximityEnrollTrainingViewController scdaShouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda abort ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scdaShouldContinue:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIProximityEnrollTrainingViewController scdaShouldContinue:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_showSiriDataSharingOptInView
{
  id v10 = [(VTUIProximityEnrollTrainingViewController *)self view];
  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  [v10 bounds];
  -[VTUISiriDataSharingOptInPresenter dataSharingOptInViewForFrame:viewStyle:](siriDataSharingOptInPresenter, "dataSharingOptInViewForFrame:viewStyle:", 1);
  int v4 = (UIView *)objc_claimAutoreleasedReturnValue();
  siriDataSharingProximityView = self->_siriDataSharingProximityView;
  self->_siriDataSharingProximityView = v4;

  [(UIView *)self->_siriDataSharingProximityView setAutoresizingMask:18];
  [v10 addSubview:self->_siriDataSharingProximityView];
  enrollTrainingView = self->_enrollTrainingView;
  if (enrollTrainingView)
  {
    [(VTUIProximityEnrollTrainingView *)enrollTrainingView removeFromSuperview];
    uint64_t v7 = self->_enrollTrainingView;
    self->_enrollTrainingView = 0;
  }
  successView = self->_successView;
  if (successView)
  {
    [(VTUIProximityEnrollmentSuccessView *)successView removeFromSuperview];
    uint64_t v9 = self->_successView;
    self->_successView = 0;
  }
}

- (BOOL)_shouldShowSiriDataSharingOptInView
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = +[MGWrapper sharedMGWrapper];
  uint64_t v4 = [v3 isDeviceIPad];

  uint64_t v5 = [(id)*MEMORY[0x263F83300] activeInterfaceOrientation];
  BOOL v6 = [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView];
  uint64_t v7 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = v7;
    id v10 = [v8 numberWithBool:v4];
    uint64_t v11 = [NSNumber numberWithBool:v5 == 1];
    char v12 = [NSNumber numberWithBool:v6];
    int v15 = 136315906;
    uint64_t v16 = "-[VTUIProximityEnrollTrainingViewController _shouldShowSiriDataSharingOptInView]";
    __int16 v17 = 2112;
    id v18 = v10;
    __int16 v19 = 2112;
    uint64_t v20 = v11;
    __int16 v21 = 2112;
    id v22 = v12;
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: isIpad:%@ isPortrait: %@, unspecifiedState:%@", (uint8_t *)&v15, 0x2Au);
  }
  if (v5 == 1) {
    char v13 = 1;
  }
  else {
    char v13 = v4;
  }
  return v13 & v6;
}

- (void)siriDataSharingOptInViewDismissButtonTappedFromPresenter:(id)a3
{
  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  self->_siriDataSharingOptInPresenter = 0;

  siriDataSharingProximityView = self->_siriDataSharingProximityView;
  self->_siriDataSharingProximityView = 0;

  [(VTUIProximityEnrollTrainingViewController *)self _dismiss:0];
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  self->_siriDataSharingOptInPresenter = 0;

  siriDataSharingProximityView = self->_siriDataSharingProximityView;
  self->_siriDataSharingProximityView = 0;

  if (self->_hasSkippedTraining)
  {
    [(VTUIProximityEnrollTrainingViewController *)self _skipSetup];
  }
  else
  {
    id v6 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
    [v6 continueSetup];
  }
}

- (void)_processIntroViewContinueAction:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_isEnablementConfigurationLoading)
  {
    uint64_t v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v12 = "-[VTUIProximityEnrollTrainingViewController _processIntroViewContinueAction:]";
      _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Intro view continue requested while Enablement configuration loading", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __77__VTUIProximityEnrollTrainingViewController__processIntroViewContinueAction___block_invoke;
    v8[3] = &unk_264D4C4D0;
    objc_copyWeak(&v10, (id *)buf);
    id v9 = v4;
    [(VTUIProximityEnrollTrainingViewController *)self _setIntroViewActionOnEnablementConfigurationDidLoad:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else if ([(VTUIProximityEnrollTrainingViewController *)self _shouldPresentLanguageDisambiguation])
  {
    [(VTUIProximityEnrollTrainingViewController *)self _setLanguageOptionsAndContinue];
  }
  else if ([(AFEnablementConfiguration *)self->_enablementConfiguration requiresVoiceSelectionForRecognitionLanguage:self->_spokenLanguageCode])
  {
    id v6 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v12 = "-[VTUIProximityEnrollTrainingViewController _processIntroViewContinueAction:]";
      _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    [(VTUIProximityEnrollmentSetupIntroView *)self->_introView removeFromSuperview];
    introView = self->_introView;
    self->_introView = 0;

    [(VTUIProximityEnrollTrainingViewController *)self _showVoiceSelectionViewForRecognitionLanguage:self->_spokenLanguageCode];
  }
  else
  {
    [(VTUIProximityEnrollTrainingViewController *)self _continueToTrainingFromIntro];
  }
}

void __77__VTUIProximityEnrollTrainingViewController__processIntroViewContinueAction___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _processIntroViewContinueAction:*(void *)(a1 + 32)];

  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[VTUIProximityEnrollTrainingViewController _processIntroViewContinueAction:]_block_invoke";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Intro view continue processed after Enablement configuration loaded", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_setIntroViewActionOnEnablementConfigurationDidLoad:(id)a3
{
  v28[2] = *MEMORY[0x263EF8340];
  id v22 = a3;
  int v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v4 startAnimating];
  uint64_t v5 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v5 addSubview:v4];

  __int16 v19 = (void *)MEMORY[0x263F08938];
  uint64_t v20 = [v4 centerYAnchor];
  __int16 v21 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView setupButton];
  uint64_t v6 = [v21 centerYAnchor];
  uint64_t v7 = [v20 constraintEqualToAnchor:v6];
  v28[0] = v7;
  uint64_t v8 = [v4 centerXAnchor];
  id v9 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView setupButton];
  id v10 = [v9 centerXAnchor];
  uint64_t v11 = [v8 constraintEqualToAnchor:v10];
  v28[1] = v11;
  char v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
  [v19 activateConstraints:v12];

  uint64_t v13 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView setupButton];
  [v13 setHidden:1];

  __int16 v14 = [(VTUIProximityEnrollmentSetupIntroView *)self->_introView notNowButton];
  [v14 setHidden:1];

  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__VTUIProximityEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke;
  aBlock[3] = &unk_264D4C758;
  id v25 = v22;
  id v15 = v22;
  objc_copyWeak(&v26, &location);
  id v24 = v4;
  id v16 = v4;
  __int16 v17 = _Block_copy(aBlock);
  id onEnablementConfigurationDidLoad = self->_onEnablementConfigurationDidLoad;
  self->_id onEnablementConfigurationDidLoad = v17;

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);
}

uint64_t __97__VTUIProximityEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v4 = [WeakRetained introView];
  uint64_t v5 = [v4 setupButton];
  [v5 setHidden:0];

  id v6 = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v7 = [v6 introView];
  uint64_t v8 = [v7 notNowButton];
  [v8 setHidden:0];

  id v9 = *(void **)(a1 + 32);
  return [v9 removeFromSuperview];
}

- (void)_processLanguageSelectionAction:(id)a3
{
  siriLanguageOptions = self->_siriLanguageOptions;
  uint64_t v5 = [(VTUIProximityEnrollmentLanguageOptionsView *)self->_languageOptionsView languagesPickerView];
  -[NSArray objectAtIndexedSubscript:](siriLanguageOptions, "objectAtIndexedSubscript:", [v5 selectedRowInComponent:0]);
  id obj = (id)objc_claimAutoreleasedReturnValue();

  if (obj)
  {
    objc_storeStrong((id *)&self->_spokenLanguageCode, obj);
    objc_storeStrong((id *)&self->_disambiguatedLanguageOption, self->_spokenLanguageCode);
    [(VTUIProximityEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode];
  }
  if ([(AFEnablementConfiguration *)self->_enablementConfiguration requiresVoiceSelectionForRecognitionLanguage:self->_spokenLanguageCode])
  {
    [(VTUIProximityEnrollmentLanguageOptionsView *)self->_languageOptionsView removeFromSuperview];
    languageOptionsView = self->_languageOptionsView;
    self->_languageOptionsView = 0;

    [(VTUIProximityEnrollTrainingViewController *)self _showVoiceSelectionViewForRecognitionLanguage:self->_spokenLanguageCode];
  }
  else
  {
    disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
    if (disambiguatedLanguageOption)
    {
      [(VTUIProximityEnrollTrainingViewController *)self _processDisambiguatedLanguageOption:disambiguatedLanguageOption commitLanguageCodeToPreferences:1];
      uint64_t v8 = self->_disambiguatedLanguageOption;
      self->_disambiguatedLanguageOption = 0;
    }
    [(VTUIProximityEnrollTrainingViewController *)self _continueToTrainingFromLanguageOptions];
  }
}

- (void)_processDisambiguatedLanguageOption:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315138;
    id v16 = "-[VTUIProximityEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
    _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v15, 0xCu);
  }
  id v9 = +[VTUIStyle sharedStyle];
  uint64_t v10 = [v9 enrollmentMode];

  if (v4)
  {
    uint64_t v11 = [MEMORY[0x263F285A0] sharedPreferences];
    [v11 setLanguageCode:self->_disambiguatedLanguageOption];
  }
  char v12 = +[VTUIStringsHelper sharedStringsHelper];
  [v12 setSiriLanguage:self->_disambiguatedLanguageOption];

  if (v10 != 3)
  {
    uint64_t v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
      int v15 = 136315394;
      id v16 = "-[VTUIProximityEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
      __int16 v17 = 2112;
      id v18 = disambiguatedLanguageOption;
      _os_log_impl(&dword_238878000, v13, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v15, 0x16u);
    }
    [(VTUIAudioHintPlayer *)self->_audioHintPlayer setLanguage:self->_disambiguatedLanguageOption];
  }
}

- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v33 = "-[VTUIProximityEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
    __int16 v34 = 2112;
    id v35 = v4;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Showing voice selection view for recognitionLanguage %@", buf, 0x16u);
  }
  if (!v4)
  {
    id v6 = [MEMORY[0x263F285A0] sharedPreferences];
    id v4 = [v6 bestSupportedLanguageCodeForLanguageCode:0];

    uint64_t v7 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v33 = "-[VTUIProximityEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
      __int16 v34 = 2112;
      id v35 = v4;
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s No recognition language used, falling back to %@", buf, 0x16u);
    }
  }
  uint64_t v8 = [[VTUIVoiceSelectionViewController alloc] initCompactWithRecognitionLanguage:v4 allowsRandomSelection:[(AFEnablementConfiguration *)self->_enablementConfiguration voiceSelectionAllowsRandomSelection] customVoicePreviewer:0 delegate:self];
  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = v8;

  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController willMoveToParentViewController:self];
  [(VTUIProximityEnrollTrainingViewController *)self addChildViewController:self->_voiceSelectionViewController];
  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController didMoveToParentViewController:self];
  uint64_t v10 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAutoresizesSubviews:0];
  uint64_t v11 = [(VTUIProximityEnrollTrainingViewController *)self view];
  [v11 addSubview:v10];

  uint64_t v23 = (void *)MEMORY[0x263F08938];
  dispatch_time_t v29 = [v10 topAnchor];
  uint64_t v30 = [(VTUIProximityEnrollTrainingViewController *)self view];
  char v28 = [v30 topAnchor];
  uint64_t v27 = [v29 constraintEqualToAnchor:v28];
  v31[0] = v27;
  id v25 = [v10 leftAnchor];
  id v26 = [(VTUIProximityEnrollTrainingViewController *)self view];
  id v24 = [v26 leftAnchor];
  id v22 = [v25 constraintEqualToAnchor:v24];
  v31[1] = v22;
  char v12 = [v10 rightAnchor];
  uint64_t v13 = [(VTUIProximityEnrollTrainingViewController *)self view];
  __int16 v14 = [v13 rightAnchor];
  int v15 = [v12 constraintEqualToAnchor:v14];
  void v31[2] = v15;
  id v16 = [v10 bottomAnchor];
  __int16 v17 = [(VTUIProximityEnrollTrainingViewController *)self view];
  id v18 = [v17 bottomAnchor];
  uint64_t v19 = [v16 constraintEqualToAnchor:v18];
  v31[3] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:4];
  [v23 activateConstraints:v20];
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v9 = v8;
    uint64_t v10 = +[VTUIStyle sharedStyle];
    int v16 = 136315650;
    __int16 v17 = "-[VTUIProximityEnrollTrainingViewController voiceSelectionController:didSelectVoice:]";
    __int16 v18 = 2112;
    id v19 = v7;
    __int16 v20 = 2048;
    uint64_t v21 = [v10 enrollmentMode];
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s voice: %@, enrollment: %ld", (uint8_t *)&v16, 0x20u);
  }
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  if (disambiguatedLanguageOption)
  {
    [(VTUIProximityEnrollTrainingViewController *)self _processDisambiguatedLanguageOption:disambiguatedLanguageOption commitLanguageCodeToPreferences:0];
    char v12 = self->_disambiguatedLanguageOption;
    self->_disambiguatedLanguageOption = 0;
  }
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer setOutputVoice:v7];
  [(VTUIProximityEnrollTrainingViewController *)self _setupTrainingStates];
  uint64_t v13 = [MEMORY[0x263F285A0] sharedPreferences];
  [v13 setLanguageCode:self->_spokenLanguageCode outputVoice:v7];

  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController removeFromParentViewController];
  __int16 v14 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v14 removeFromSuperview];

  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = 0;

  [(VTUIProximityEnrollTrainingViewController *)self _continueToTrainingFromVoiceSelection];
}

- (void)voiceSelectionControllerRequestsDismissal:(id)a3
{
}

- (void)_continueToTrainingFromIntro
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[VTUIProximityEnrollTrainingViewController _continueToTrainingFromIntro]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __73__VTUIProximityEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke;
  v4[3] = &unk_264D4C258;
  objc_copyWeak(&v5, (id *)buf);
  [(VTUIProximityEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

void __73__VTUIProximityEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[148] removeFromSuperview];
    id v2 = v4[148];
    v4[148] = 0;

    [v4 _setAssistantEnabled:1];
    id v3 = [v4[146] skipButton];
    [v3 setHidden:0];

    objc_msgSend(v4[135], "setVoiceTrainingStarted:", objc_msgSend(v4[135], "voiceTrainingStarted") + 1);
    [v4 _startTrainingIfNecessary];
    id WeakRetained = v4;
  }
}

- (void)_continueToTrainingFromLanguageOptions
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315138;
    uint64_t v11 = "-[VTUIProximityEnrollTrainingViewController _continueToTrainingFromLanguageOptions]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v10, 0xCu);
  }
  [(VTUIProximityEnrollmentLanguageOptionsView *)self->_languageOptionsView removeFromSuperview];
  languageOptionsView = self->_languageOptionsView;
  self->_languageOptionsView = 0;

  [(VTUIProximityEnrollTrainingViewController *)self _setAssistantEnabled:1];
  id v5 = (void *)[@"BUTTON_SET_UP_LATER" copy];
  id v6 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView skipButton];
  [v6 setHidden:0];

  id v7 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView skipButton];
  uint64_t v8 = +[VTUIStyle sharedStyle];
  id v9 = [v8 VTUIDeviceSpecificString:v5];
  [v7 setTitle:v9 forState:0];

  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingStarted:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingStarted] + 1];
  [(VTUIProximityEnrollTrainingViewController *)self _startTrainingIfNecessary];
}

- (void)_continueToTrainingFromVoiceSelection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[VTUIProximityEnrollTrainingViewController _continueToTrainingFromVoiceSelection]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v4 = (void *)[@"BUTTON_SET_UP_LATER" copy];
  id v5 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView skipButton];
  [v5 setHidden:0];

  id v6 = [(VTUIProximityEnrollTrainingView *)self->_enrollTrainingView skipButton];
  id v7 = +[VTUIStyle sharedStyle];
  uint64_t v8 = [v7 VTUIDeviceSpecificString:v4];
  [v6 setTitle:v8 forState:0];

  [(VTUIProximityEnrollTrainingViewController *)self _setAssistantEnabled:1];
  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingStarted:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingStarted] + 1];
  [(VTUIProximityEnrollTrainingViewController *)self _startTrainingIfNecessary];
}

- (void)_startTrainingIfNecessary
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F78BB8] sharedInstance];
  id v4 = [MEMORY[0x263F285A0] sharedPreferences];
  id v5 = [v4 languageCode];

  if ([v3 isSATEnrolledForSiriProfileId:0 forLanguageCode:v5])
  {
    id v6 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary]";
      _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data locally", buf, 0xCu);
    }
    id v7 = [MEMORY[0x263F283F8] sharedAnalytics];
    __int16 v18 = @"type";
    id v19 = @"local";
    uint64_t v8 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    [v7 logEventWithType:5501 context:v8];

    int v9 = [MEMORY[0x263F85AF0] sharedPreferences];
    [v9 setVoiceTriggerEnabled:1];

LABEL_9:
    if ([(VTUIProximityEnrollTrainingViewController *)self _shouldShowSiriDataSharingOptInView])
    {
      [(VTUIProximityEnrollTrainingViewController *)self _showSiriDataSharingOptInView];
    }
    else
    {
      int v15 = [(VTUIProximityEnrollTrainingViewController *)self delegate];
      [v15 continueSetup];
    }
    goto LABEL_15;
  }
  BOOL v10 = [(VTUIProximityEnrollTrainingViewController *)self _hasPHSCloudDataForSpokenLanguage];
  uint64_t v11 = *MEMORY[0x263F28398];
  BOOL v12 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v21 = "-[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary]";
      _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data in cloud", buf, 0xCu);
    }
    uint64_t v13 = [MEMORY[0x263F283F8] sharedAnalytics];
    int v16 = @"type";
    __int16 v17 = @"cloud";
    __int16 v14 = [NSDictionary dictionaryWithObjects:&v17 forKeys:&v16 count:1];
    [v13 logEventWithType:5501 context:v14];

    [v3 enableVoiceTriggerUponVoiceProfileSyncForLanguage:self->_spokenLanguageCode];
    goto LABEL_9;
  }
  if (v12)
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v21 = "-[VTUIProximityEnrollTrainingViewController _startTrainingIfNecessary]";
    _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting training due to no PHS data locally or in cloud", buf, 0xCu);
  }
  [(VTUIProximityEnrollTrainingViewController *)self _startTraining];
LABEL_15:
}

- (VTUIEnrollTrainingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VTUIEnrollTrainingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SSRVTUITrainingManager)trainingManager
{
  return self->_trainingManager;
}

- (void)setTrainingManager:(id)a3
{
}

- (unint64_t)sessionId
{
  return self->_sessionId;
}

- (int64_t)currentTrainingState
{
  return self->_currentTrainingState;
}

- (void)setCurrentTrainingState:(int64_t)a3
{
  self->_int64_t currentTrainingState = a3;
}

- (BOOL)hasRetriedTraining
{
  return self->_hasRetriedTraining;
}

- (void)setHasRetriedTraining:(BOOL)a3
{
  self->_hasRetriedTraining = a3;
}

- (BOOL)skipToEndForTesting
{
  return self->_skipToEndForTesting;
}

- (void)setSkipToEndForTesting:(BOOL)a3
{
  self->_skipToEndForTesting = a3;
}

- (BOOL)skipToDataSharingForTesting
{
  return self->_skipToDataSharingForTesting;
}

- (void)setSkipToDataSharingForTesting:(BOOL)a3
{
  self->_skipToDataSharingForTesting = a3;
}

- (BOOL)disambiguateLanguageOptionsForTesting
{
  return self->_disambiguateLanguageOptionsForTesting;
}

- (void)setDisambiguateLanguageOptionsForTesting:(BOOL)a3
{
  self->_disambiguateLanguageOptionsForTesting = a3;
}

- (BOOL)simulateJSSupportingDeviceForTesting
{
  return self->_simulateJSSupportingDeviceForTesting;
}

- (VTUIProximityEnrollTrainingView)enrollTrainingView
{
  return self->_enrollTrainingView;
}

- (void)setEnrollTrainingView:(id)a3
{
}

- (VTUIProximityEnrollmentSuccessView)successView
{
  return self->_successView;
}

- (void)setSuccessView:(id)a3
{
}

- (VTUIProximityEnrollmentSetupIntroView)introView
{
  return self->_introView;
}

- (void)setIntroView:(id)a3
{
}

- (VTUIProximityTryAgainView)tryAgainView
{
  return self->_tryAgainView;
}

- (void)setTryAgainView:(id)a3
{
}

- (unint64_t)badMicRetryCount
{
  return self->_badMicRetryCount;
}

- (void)setBadMicRetryCount:(unint64_t)a3
{
  self->_unint64_t badMicRetryCount = a3;
}

- (unint64_t)AVVCRetryCount
{
  return self->_AVVCRetryCount;
}

- (void)setAVVCRetryCount:(unint64_t)a3
{
  self->_AVVCRetryCount = a3;
}

- (unint64_t)digitalZerosRetryCount
{
  return self->_digitalZerosRetryCount;
}

- (void)setDigitalZerosRetryCount:(unint64_t)a3
{
  self->_digitalZerosRetryCount = a3;
}

- (unint64_t)cannotHearRetryCount
{
  return self->_cannotHearRetryCount;
}

- (void)setCannotHearRetryCount:(unint64_t)a3
{
  self->_cannotHearRetryCount = a3;
}

- (NSString)spokenLanguageCode
{
  return self->_spokenLanguageCode;
}

- (void)setSpokenLanguageCode:(id)a3
{
}

- (NSString)disambiguatedLanguageOption
{
  return self->_disambiguatedLanguageOption;
}

- (void)setDisambiguatedLanguageOption:(id)a3
{
}

- (VTUIProximityEnrollmentLanguageOptionsView)languageOptionsView
{
  return self->_languageOptionsView;
}

- (void)setLanguageOptionsView:(id)a3
{
}

- (UIView)aboutTappedSender
{
  return self->_aboutTappedSender;
}

- (void)setAboutTappedSender:(id)a3
{
}

- (BOOL)shouldTurnOnMyriad
{
  return self->_shouldTurnOnMyriad;
}

- (void)setShouldTurnOnMyriad:(BOOL)a3
{
  self->_shouldTurnOnMyriad = a3;
}

- (AFMyriadCoordinator)myriadCoordinator
{
  return self->_myriadCoordinator;
}

- (void)setMyriadCoordinator:(id)a3
{
}

- (SCDACoordinator)scdaCoordinator
{
  return self->_scdaCoordinator;
}

- (void)setScdaCoordinator:(id)a3
{
}

- (NSArray)trainingPageInstructions
{
  return self->_trainingPageInstructions;
}

- (void)setTrainingPageInstructions:(id)a3
{
}

- (VTUIAudioHintPlayer)audioHintPlayer
{
  return self->_audioHintPlayer;
}

- (void)setAudioHintPlayer:(id)a3
{
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (void)setOrientation:(int64_t)a3
{
  self->_orientation = a3;
}

- (NSUUID)trainingAttemptUUID
{
  return self->_trainingAttemptUUID;
}

- (void)setTrainingAttemptUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingAttemptUUID, 0);
  objc_storeStrong((id *)&self->_audioHintPlayer, 0);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_myriadCoordinator, 0);
  objc_storeStrong((id *)&self->_aboutTappedSender, 0);
  objc_storeStrong((id *)&self->_languageOptionsView, 0);
  objc_storeStrong((id *)&self->_disambiguatedLanguageOption, 0);
  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
  objc_storeStrong((id *)&self->_tryAgainView, 0);
  objc_storeStrong((id *)&self->_introView, 0);
  objc_storeStrong((id *)&self->_successView, 0);
  objc_storeStrong((id *)&self->_enrollTrainingView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_onEnablementConfigurationDidLoad, 0);
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_pageEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_siriDataSharingProximityView, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptions, 0);
  objc_storeStrong((id *)&self->_trainingPageInstructions, 0);
  objc_storeStrong((id *)&self->_hasPHSInCloudFetchQueue, 0);
  objc_storeStrong(&self->_hasPHSInCloudFetchBlock, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

@end