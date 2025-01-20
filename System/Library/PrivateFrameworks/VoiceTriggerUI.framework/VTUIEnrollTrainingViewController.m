@interface VTUIEnrollTrainingViewController
- (AFMyriadCoordinator)myriadCoordinator;
- (AVAudioPlayer)audioPlayer;
- (BOOL)_hasPHSCloudDataForSpokenLanguage;
- (BOOL)_isGreyMatterAvailable;
- (BOOL)_isLocaleSupported:(id)a3;
- (BOOL)_isTrainingInProgress;
- (BOOL)_shouldPresentLanguageDisambiguation;
- (BOOL)_shouldShowSiriDataSharingOptInView;
- (BOOL)_shouldSpeakAudioHint;
- (BOOL)_siriLanguageIsIncompatibleWithPairedWatch;
- (BOOL)allLanguageOptionsSupportCompactTrigger;
- (BOOL)didShowVoiceTriggerPrompt;
- (BOOL)disambiguateLanguageOptionsForTesting;
- (BOOL)hasRetriedTraining;
- (BOOL)shouldTurnOnMyriad;
- (BOOL)skipToEndForTesting;
- (BOOL)skipToSiriDataSharingOptInForTesting;
- (NSArray)trainingPageInstructions;
- (NSString)disambiguatedLanguageOption;
- (NSString)spokenLanguageCode;
- (NSString)voiceProfileAppDomain;
- (NSUUID)trainingAttemptUUID;
- (SCDACoordinator)scdaCoordinator;
- (SSRVTUITrainingManager)trainingManager;
- (UIView)aboutTappedSender;
- (VTUIAudioHintPlayer)audioHintPlayer;
- (VTUIEnrollTrainingViewController)init;
- (VTUIEnrollTrainingViewControllerDelegate)delegate;
- (VTUIEnrollmentLanguageOptionsView)languageOptionsView;
- (VTUITrainingViewMediator)trainingViewMediator;
- (id)_getSetupModeString;
- (id)_retryStringForStatus:(int64_t)a3;
- (id)init:(int64_t)a3;
- (id)init:(int64_t)a3 withAppDomain:(id)a4;
- (id)interpretAudioSource:(unint64_t)a3;
- (int64_t)currentTrainingState;
- (int64_t)interpretSessionManagerResult:(id)a3 forInstruction:(int64_t)a4;
- (unint64_t)AVVCRetryCount;
- (unint64_t)badMicRetryCount;
- (unint64_t)cannotHearRetryCount;
- (unint64_t)digitalZerosRetryCount;
- (unint64_t)sessionId;
- (void)VTUITrainingManagerFeedLevel:(float)a3;
- (void)_advanceState;
- (void)_animateSuccessfulStep:(BOOL)a3 completion:(id)a4;
- (void)_becomeActive;
- (void)_checkForPHSCloudDataIfNecessary:(id)a3;
- (void)_cleanupAllViews;
- (void)_cleanupHelper;
- (void)_cleanupMyriad;
- (void)_cleanupTrainingManagerWithCompletion:(id)a3;
- (void)_cleanupTrainingManagerWithCompletion:(id)a3 status:(int64_t)a4;
- (void)_configureTrainingWith:(int64_t)a3 withAppDomain:(id)a4;
- (void)_continueToCameraButtonBuddy;
- (void)_continueToNextFromGM;
- (void)_continueToNextFromSummarization;
- (void)_continueToSummarizationFromGM;
- (void)_continueToTrainingFromIntro;
- (void)_continueToTrainingFromLanguageOptions;
- (void)_continueToTrainingFromVoiceSelection;
- (void)_continueToVoiceSelectionFromIntro;
- (void)_createTrainingManagerIfNeeded;
- (void)_didEnterBackground;
- (void)_endSetup;
- (void)_finishButtonTapped;
- (void)_finishSiriSetup;
- (void)_handleTrainingResultForNonRetryablePhraseWithResult:(id)a3;
- (void)_handleTrainingResultForRetryablePhraseWithResult:(id)a3 shouldShowCheckMark:(BOOL)a4;
- (void)_hideInstruction;
- (void)_hideIntroView;
- (void)_hideTrainingElements;
- (void)_initialSetup;
- (void)_logVoiceSelection:(id)a3 randomlySelected:(BOOL)a4;
- (void)_playSoundForStageAfterDelay:(double)a3;
- (void)_prepareCameraButtonBuddy;
- (void)_proceedAfterTrainingCompletionOrSkip;
- (void)_proceedAfterVoiceSelectionOrSkip;
- (void)_processDisambiguatedLanguageOption:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4;
- (void)_processIntroViewContinueAction:(id)a3;
- (void)_processLanguageSelectionAction:(id)a3;
- (void)_processVTConfirmationLaterAction:(id)a3;
- (void)_processVTConfirmationViewContinueAction:(id)a3;
- (void)_resetBackBarButtonItem;
- (void)_resetEnrollment;
- (void)_resetIdleTimer;
- (void)_resetRightBarButtonItems;
- (void)_resetTrainingManager;
- (void)_resignActive;
- (void)_resumeTraining:(BOOL)a3;
- (void)_retryAfterBadMicAlert;
- (void)_retryInstruction:(BOOL)a3 withStatusMessage:(id)a4;
- (void)_setAssistantEnabled:(BOOL)a3;
- (void)_setInitialTriggerPhraseIfNotSet;
- (void)_setInitialTriggerPhraseOnHome;
- (void)_setIntroViewActionOnEnablementConfigurationDidLoad:(id)a3;
- (void)_setLanguageOptionsAndContinue;
- (void)_setPHSEnrollmentPrefEnabled:(BOOL)a3;
- (void)_setRightBarButtonItem:(id)a3;
- (void)_setupEnrollTrainingView;
- (void)_setupEnrollmentWithIntelligentLight;
- (void)_setupEnrollmentwithOrb;
- (void)_setupMode;
- (void)_setupMyriadCoordinator;
- (void)_setupTrainingStates;
- (void)_showBadMicAlertCompletion:(id)a3;
- (void)_showBadMicAlertWithCompletion:(id)a3;
- (void)_showCameraButtonBuddyControlOrSiriIntro;
- (void)_showEducationView;
- (void)_showEnrollmentSuccessView;
- (void)_showGMIntroView;
- (void)_showInstruction:(int64_t)a3 isRetry:(BOOL)a4;
- (void)_showRadarExitButton;
- (void)_showSiriDataSharingOptIn;
- (void)_showSiriIntroView;
- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5;
- (void)_showTrainingElements;
- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6;
- (void)_showUnsupportedLocaleAlert;
- (void)_showUnsupportedLocaleAlertCompletion:(id)a3;
- (void)_showVTConfirmationView;
- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3;
- (void)_signalSingleEnrollmentSuccess;
- (void)_startEnrollment;
- (void)_startTraining;
- (void)_startTrainingIfNecessary;
- (void)_startTrainingIfNecessaryWithViewCleanupBlock:(id)a3;
- (void)_tearDownDataSharingViews;
- (void)_updatePageNumberForInstruction:(int64_t)a3;
- (void)_updateTrainingLabelsForInstruction:(int64_t)a3;
- (void)_updateViewBackground;
- (void)_warnForLanguageCompatibilityIfNecessary:(id)a3;
- (void)aboutTapped:(id)a3;
- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3;
- (void)cancelTraining;
- (void)dealloc;
- (void)enrollTrainingViewRadarButtonPressed:(id)a3;
- (void)finish:(id)a3;
- (void)onboardingController:(id)a3 requestsPushingTo:(id)a4;
- (void)prewarm;
- (void)restartFromIntroView;
- (void)returnFromVoiceSelectionToIntroView:(id)a3;
- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3;
- (void)scdaShouldContinue:(id)a3;
- (void)setAVVCRetryCount:(unint64_t)a3;
- (void)setAboutTappedSender:(id)a3;
- (void)setAudioHintPlayer:(id)a3;
- (void)setAudioPlayer:(id)a3;
- (void)setBadMicRetryCount:(unint64_t)a3;
- (void)setCannotHearRetryCount:(unint64_t)a3;
- (void)setCurrentTrainingState:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setDidShowVoiceTriggerPrompt:(BOOL)a3;
- (void)setDigitalZerosRetryCount:(unint64_t)a3;
- (void)setDisambiguateLanguageOptionsForTesting:(BOOL)a3;
- (void)setDisambiguatedLanguageOption:(id)a3;
- (void)setHasRetriedTraining:(BOOL)a3;
- (void)setLanguageOptionsView:(id)a3;
- (void)setMyriadCoordinator:(id)a3;
- (void)setScdaCoordinator:(id)a3;
- (void)setShouldTurnOnMyriad:(BOOL)a3;
- (void)setSkipToEndForTesting:(BOOL)a3;
- (void)setSkipToSiriDataSharingOptInForTesting:(BOOL)a3;
- (void)setSpokenLanguageCode:(id)a3;
- (void)setTrainingAttemptUUID:(id)a3;
- (void)setTrainingManager:(id)a3;
- (void)setTrainingPageInstructions:(id)a3;
- (void)setTrainingViewMediator:(id)a3;
- (void)setVoiceProfileAppDomain:(id)a3;
- (void)shouldAbortAnotherDeviceBetter:(id)a3;
- (void)shouldContinue:(id)a3;
- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3;
- (void)siriEducationViewControllerContinuePressed:(id)a3;
- (void)siriGMIntroViewControllerContinuePressed:(id)a3;
- (void)siriIntroViewControllerLaterPressed:(id)a3;
- (void)siriIntroViewControllerPrivacyLinkTapped;
- (void)siriLanguageSpokenLanguageCodeDidChange:(id)a3;
- (void)skipAssistant:(id)a3;
- (void)skipTraining:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4 randomlySelected:(BOOL)a5;
@end

@implementation VTUIEnrollTrainingViewController

- (id)init:(int64_t)a3 withAppDomain:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)VTUIEnrollTrainingViewController;
  v7 = [(VTUIEnrollTrainingViewController *)&v11 init];
  if (v7)
  {
    v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v13 = "-[VTUIEnrollTrainingViewController init:withAppDomain:]";
      __int16 v14 = 2048;
      int64_t v15 = a3;
      _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s init with enrollmentMode: %ld", buf, 0x16u);
    }
    if (v6) {
      id v9 = v6;
    }
    else {
      id v9 = (id)*MEMORY[0x263F78BC0];
    }
    [(VTUIEnrollTrainingViewController *)v7 _configureTrainingWith:a3 withAppDomain:v9];
  }

  return v7;
}

- (id)init:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollTrainingViewController;
  v4 = [(VTUIEnrollTrainingViewController *)&v7 init];
  if (v4)
  {
    v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      id v9 = "-[VTUIEnrollTrainingViewController init:]";
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s init with enrollmentMode: %ld", buf, 0x16u);
    }
    [(VTUIEnrollTrainingViewController *)v4 _configureTrainingWith:a3 withAppDomain:*MEMORY[0x263F78BC0]];
  }
  return v4;
}

- (void)_configureTrainingWith:(int64_t)a3 withAppDomain:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v7 = a4;
  [(VTUIEnrollTrainingViewController *)self _initialSetup];
  uint64_t v8 = 1;
  if (a3 != 1 && a3 != 7) {
    uint64_t v8 = PSIsRunningInAssistant();
  }
  id v9 = +[VTUIStyle sharedStyle];
  [v9 setIsBuddyOrFollowUp:v8];

  __int16 v10 = +[VTUIStyle sharedStyle];
  [v10 setEnrollmentMode:a3];

  int64_t v11 = +[VTUIStyle sharedStyle];
  int v12 = [v11 shouldShowVoiceTriggerConfirmationInBuddy];

  int64_t v13 = a3;
  if (v12)
  {
    int64_t v13 = a3;
    if (v8)
    {
      __int16 v14 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        v19 = "-[VTUIEnrollTrainingViewController _configureTrainingWith:withAppDomain:]";
        _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s enrollment mode set for VT confirmation", (uint8_t *)&v18, 0xCu);
      }
      int64_t v13 = 6;
    }
  }
  self->_enrollmentMode = v13;
  objc_storeStrong((id *)&self->_voiceProfileAppDomain, a4);
  if (self->_enrollmentMode == 2)
  {
    if ([(VTUIEnrollTrainingViewController *)self _shouldPresentLanguageDisambiguation])
    {
      [(VTUIEnrollTrainingViewController *)self _setLanguageOptionsAndContinue];
    }
    else
    {
      [(VTUIEnrollTrainingViewController *)self _continueToTrainingFromIntro];
    }
  }
  int64_t v15 = objc_alloc_init(VTUISiriDataSharingOptInPresenter);
  siriDataSharingOptInPresenter = self->_siriDataSharingOptInPresenter;
  self->_siriDataSharingOptInPresenter = v15;

  [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingOptInPresenter setPresentationDelegate:self];
  v17 = self->_siriDataSharingOptInPresenter;
  if (a3 == 1)
  {
    [(VTUISiriDataSharingOptInPresenter *)v17 setSourceOfChange:7];
    [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingOptInPresenter setReasonForChange:@"followup"];
  }
  else
  {
    [(VTUISiriDataSharingOptInPresenter *)v17 setSourceOfChange:1];
  }
}

- (VTUIEnrollTrainingViewController)init
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  v9.receiver = self;
  v9.super_class = (Class)VTUIEnrollTrainingViewController;
  v2 = [(VTUIEnrollTrainingViewController *)&v9 init];
  if (v2)
  {
    v3 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int64_t v11 = "-[VTUIEnrollTrainingViewController init]";
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
    }
    [(VTUIEnrollTrainingViewController *)v2 _initialSetup];
    v4 = +[VTUIStyle sharedStyle];
    [v4 setIsBuddyOrFollowUp:PSIsRunningInAssistant()];
    [(VTUIEnrollTrainingViewController *)v2 _setupMode];
    objc_storeStrong((id *)&v2->_voiceProfileAppDomain, (id)*MEMORY[0x263F78BC0]);
    if (v2->_enrollmentMode == 2)
    {
      if ([(VTUIEnrollTrainingViewController *)v2 _shouldPresentLanguageDisambiguation])
      {
        [(VTUIEnrollTrainingViewController *)v2 _setLanguageOptionsAndContinue];
      }
      else
      {
        [(VTUIEnrollTrainingViewController *)v2 _continueToTrainingFromIntro];
      }
    }
    v5 = objc_alloc_init(VTUISiriDataSharingOptInPresenter);
    siriDataSharingOptInPresenter = v2->_siriDataSharingOptInPresenter;
    v2->_siriDataSharingOptInPresenter = v5;

    [(VTUISiriDataSharingOptInPresenter *)v2->_siriDataSharingOptInPresenter setPresentationDelegate:v2];
    if ([v4 isBuddyOrFollowUp]) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 7;
    }
    [(VTUISiriDataSharingOptInPresenter *)v2->_siriDataSharingOptInPresenter setSourceOfChange:v7];
  }
  return v2;
}

- (void)dealloc
{
  [(VTUIAnalytics *)self->_analyticsEvent logEvent];
  if ([(VTUIEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    v3 = [MEMORY[0x263F78BB8] sharedInstance];
    v4 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v5 = (id)[v3 deleteUserVoiceProfile:v4];
  }
  [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  v7.receiver = self;
  v7.super_class = (Class)VTUIEnrollTrainingViewController;
  [(VTUIEnrollTrainingViewController *)&v7 dealloc];
}

- (void)_initialSetup
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  VTUILogInitIfNeeded();
  v3 = objc_alloc_init(VTUIEnrollmentPageEligibilityProvider);
  pageEligibilityProvider = self->_pageEligibilityProvider;
  self->_pageEligibilityProvider = v3;

  id v5 = (AFUISiriLanguage *)[objc_alloc(MEMORY[0x263F28818]) initWithDelegate:self];
  siriLanguage = self->_siriLanguage;
  self->_siriLanguage = v5;

  objc_super v7 = [(AFUISiriLanguage *)self->_siriLanguage spokenLanguageCode];
  spokenLanguageCode = self->_spokenLanguageCode;
  self->_spokenLanguageCode = v7;

  objc_super v9 = objc_alloc_init(VTUIAnalytics);
  analyticsEvent = self->_analyticsEvent;
  self->_analyticsEvent = v9;

  int64_t v11 = self->_analyticsEvent;
  uint64_t v12 = [(VTUIEnrollTrainingViewController *)self _getSetupModeString];
  [(VTUIAnalytics *)v11 setSetupMode:v12];

  int64_t v13 = (AFSettingsConnection *)objc_alloc_init(MEMORY[0x263F285E0]);
  settingsConnection = self->_settingsConnection;
  self->_settingsConnection = v13;

  int64_t v15 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.siri.voicetrigger.home", 0);
  settingsQueue = self->_settingsQueue;
  self->_settingsQueue = v15;

  if (!self->_spokenLanguageCode)
  {
    v17 = [MEMORY[0x263F285A0] sharedPreferences];
    int v18 = [v17 bestSupportedLanguageCodeForLanguageCode:0];
    v19 = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v18;

    uint64_t v20 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      v21 = self->_spokenLanguageCode;
      int v41 = 136315394;
      v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
      __int16 v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_238878000, v20, OS_LOG_TYPE_DEFAULT, "%s No Siri language code found, falling back to: %@", (uint8_t *)&v41, 0x16u);
    }
  }
  v22 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    v23 = self->_spokenLanguageCode;
    int v41 = 136315394;
    v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
    __int16 v43 = 2112;
    v44 = v23;
    _os_log_impl(&dword_238878000, v22, OS_LOG_TYPE_DEFAULT, "%s Initializing with language code: %@", (uint8_t *)&v41, 0x16u);
  }
  if (self->_spokenLanguageCode)
  {
    v24 = +[VTUIStringsHelper sharedStringsHelper];
    [v24 setSiriLanguage:self->_spokenLanguageCode];

    v25 = self->_spokenLanguageCode;
  }
  else
  {
    v25 = 0;
  }
  [(VTUIAnalytics *)self->_analyticsEvent setLanguageCode:v25];
  self->_shouldTurnOnMyriad = 1;
  v26 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    v27 = self->_spokenLanguageCode;
    v28 = v26;
    v29 = +[VTUIStringsHelper sharedStringsHelper];
    v30 = [v29 heySiriTriggerPhrase];
    int v41 = 136315650;
    v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
    __int16 v43 = 2112;
    v44 = v27;
    __int16 v45 = 2112;
    v46 = v30;
    _os_log_impl(&dword_238878000, v28, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code: %@. (Trigger: '%@')", (uint8_t *)&v41, 0x20u);
  }
  v31 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v41 = 136315138;
    v42 = "-[VTUIEnrollTrainingViewController _initialSetup]";
    _os_log_impl(&dword_238878000, v31, OS_LOG_TYPE_DEFAULT, "%s Setting the current training state in VTUIEnrollTrainingViewController to kVTUITrainingStateNotStarted", (uint8_t *)&v41, 0xCu);
  }
  self->_currentTrainingState = -1;
  aboutTappedSender = self->_aboutTappedSender;
  self->_aboutTappedSender = 0;

  if ([MEMORY[0x263F28510] isSCDAFrameworkEnabled]) {
    uint64_t v33 = 1352;
  }
  else {
    uint64_t v33 = 1344;
  }
  if (!*(Class *)((char *)&self->super.super.super.isa + v33)) {
    [(VTUIEnrollTrainingViewController *)self _setupMyriadCoordinator];
  }
  v34 = [VTUIAudioHintPlayer alloc];
  v35 = self->_spokenLanguageCode;
  v36 = +[VTUIStyle sharedStyle];
  v37 = -[VTUIAudioHintPlayer initWithLanguage:isCompact:](v34, "initWithLanguage:isCompact:", v35, [v36 shouldSetupForMultipleTriggerPhrases]);
  audioHintPlayer = self->_audioHintPlayer;
  self->_audioHintPlayer = v37;

  v39 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v40 = [v39 userInterfaceIdiom];

  if ((v40 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    [MEMORY[0x263F5B890] preferredContentSize];
    -[VTUIEnrollTrainingViewController setPreferredContentSize:](self, "setPreferredContentSize:");
  }
}

- (void)_setupMode
{
  v3 = +[VTUIStyle sharedStyle];
  int v4 = [v3 isBuddyOrFollowUp];

  id v5 = +[VTUIStyle sharedStyle];
  id v6 = v5;
  if (v4)
  {
    int v7 = [v5 isHeySiriAlwaysOn];

    uint64_t v8 = +[VTUIStyle sharedStyle];
    objc_super v9 = v8;
    if (v7) {
      uint64_t v10 = 0;
    }
    else {
      uint64_t v10 = 3;
    }
    [v8 setEnrollmentMode:v10];

    [(VTUIEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode];
  }
  else
  {
    [v5 setEnrollmentMode:4];
  }
  id v11 = +[VTUIStyle sharedStyle];
  self->_enrollmentMode = [v11 enrollmentMode];
}

- (void)viewDidLoad
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  VTUILogInitIfNeeded();
  v19.receiver = self;
  v19.super_class = (Class)VTUIEnrollTrainingViewController;
  [(VTUIEnrollTrainingViewController *)&v19 viewDidLoad];
  [(VTUIEnrollTrainingViewController *)self _updateViewBackground];
  v3 = +[VTUIStringsHelper sharedStringsHelper];
  [v3 setupForCurrentLocaleAndSiriLanguage];

  [(VTUIEnrollTrainingViewController *)self _setupTrainingStates];
  [(VTUIEnrollTrainingViewController *)self _setupEnrollTrainingView];
  int v4 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VTUIEnrollTrainingViewController viewDidLoad]";
    _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Main View Loaded", buf, 0xCu);
  }
  id v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__resignActive name:*MEMORY[0x263F833C0] object:0];

  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 addObserver:self selector:sel__becomeActive name:*MEMORY[0x263F83318] object:0];

  int v7 = [MEMORY[0x263F08A00] defaultCenter];
  [v7 addObserver:self selector:sel__didEnterBackground name:*MEMORY[0x263F83330] object:0];

  if (self->_skipToEndForTesting)
  {
    self->_currentTrainingState = 5;
    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideTrainingView:0];
    [(VTUIEnrollTrainingViewController *)self _showEnrollmentSuccessView];
  }
  uint64_t v8 = +[VTUIStyle sharedStyle];
  int v9 = [v8 shouldPresentDisclosureForCompactVoiceTrigger];

  uint64_t v10 = [MEMORY[0x263F285A0] sharedPreferences];
  if ([v10 assistantIsEnabled])
  {
    if (self->_enrollmentMode) {
      uint64_t v11 = 0;
    }
    else {
      uint64_t v11 = v9 ^ 1u;
    }

    p_skipToSiriDataSharingOptInForTesting = &self->_skipToSiriDataSharingOptInForTesting;
    if (!self->_skipToSiriDataSharingOptInForTesting)
    {
      if (!v11
        || ![(VTUIEnrollTrainingViewController *)self _shouldShowSiriDataSharingOptInView])
      {
        return;
      }
      uint64_t v11 = 1;
    }
  }
  else
  {

    p_skipToSiriDataSharingOptInForTesting = &self->_skipToSiriDataSharingOptInForTesting;
    if (!self->_skipToSiriDataSharingOptInForTesting) {
      return;
    }
    uint64_t v11 = 0;
  }
  int64_t v13 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v14 = NSNumber;
    BOOL v15 = *p_skipToSiriDataSharingOptInForTesting;
    uint64_t v16 = v13;
    v17 = [v14 numberWithBool:v15];
    int v18 = [NSNumber numberWithBool:v11];
    *(_DWORD *)buf = 136315650;
    v21 = "-[VTUIEnrollTrainingViewController viewDidLoad]";
    __int16 v22 = 2112;
    v23 = v17;
    __int16 v24 = 2112;
    v25 = v18;
    _os_log_impl(&dword_238878000, v16, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Showing DataSharingOptIn. _skipToEndForTesting:%@, isBuddyForDataSharingOptIn:%@", buf, 0x20u);
  }
  self->_currentTrainingState = 5;
  [(VTUIEnrollTrainingViewController *)self _showSiriDataSharingOptIn];
}

- (BOOL)_isGreyMatterAvailable
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  trainingViewMediator = self->_trainingViewMediator;
  if (trainingViewMediator)
  {
    int v3 = [(VTUITrainingViewMediator *)trainingViewMediator isMemberOfClass:objc_opt_class()];
    int v4 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[VTUIEnrollTrainingViewController _isGreyMatterAvailable]";
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s #GMAvailability - from the current session: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else if (self->_enrollmentMode == 7)
  {
    id v5 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[VTUIEnrollTrainingViewController _isGreyMatterAvailable]";
      _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s #GMAvailability - true:  _enrollmentMode == kVTUIEnrollmentModeGM", (uint8_t *)&v10, 0xCu);
    }
    LOBYTE(v3) = 1;
  }
  else if (AFDeviceSupportsSAE())
  {
    id v6 = objc_alloc_init(MEMORY[0x263F32BB0]);
    int v3 = [v6 isOptedIn];
    int v7 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315394;
      uint64_t v11 = "-[VTUIEnrollTrainingViewController _isGreyMatterAvailable]";
      __int16 v12 = 1024;
      int v13 = v3;
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s #GMAvailability - from CSFGMOptIn: %d", (uint8_t *)&v10, 0x12u);
    }
  }
  else
  {
    uint64_t v8 = VTUILogContextFacility;
    LOBYTE(v3) = 0;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 136315138;
      uint64_t v11 = "-[VTUIEnrollTrainingViewController _isGreyMatterAvailable]";
      _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s #GMAvailability - false: AFDeviceSupportsSAE() == false", (uint8_t *)&v10, 0xCu);
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)_setupEnrollTrainingView
{
  if ([(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
  {
    [(VTUIEnrollTrainingViewController *)self _setupEnrollmentWithIntelligentLight];
  }
  else
  {
    [(VTUIEnrollTrainingViewController *)self _setupEnrollmentwithOrb];
  }
}

- (void)_setupEnrollmentwithOrb
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VTUIEnrollTrainingViewController _setupEnrollmentwithOrb]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting up enrollment using Orb", buf, 0xCu);
  }
  int v4 = [VTUIEnrollTrainingView alloc];
  id v5 = [(VTUIEnrollTrainingViewController *)self view];
  [v5 bounds];
  id v6 = -[VTUIEnrollTrainingView initWithFrame:](v4, "initWithFrame:");

  [(VTUIEnrollTrainingView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIEnrollTrainingView *)v6 setDelegate:self];
  int v7 = [[VTUIEnrollTrainingViewMediatorOrb alloc] initWithTrainingView:v6];
  trainingViewMediator = self->_trainingViewMediator;
  self->_trainingViewMediator = (VTUITrainingViewMediator *)v7;

  if (self->_enrollmentMode == 4) {
    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
  }
  int v9 = [(VTUIEnrollTrainingViewController *)self view];
  [v9 addSubview:v6];
  int v10 = (void *)MEMORY[0x263F08938];
  uint64_t v11 = _NSDictionaryOfVariableBindings(&cfstr_Enrolltraining.isa, v6, 0);
  __int16 v12 = [v10 constraintsWithVisualFormat:@"H:|[enrollTrainingView]|" options:0 metrics:0 views:v11];
  [v9 addConstraints:v12];

  int v13 = (void *)MEMORY[0x263F08938];
  uint64_t v14 = _NSDictionaryOfVariableBindings(&cfstr_Enrolltraining.isa, v6, 0);
  BOOL v15 = [v13 constraintsWithVisualFormat:@"V:|[enrollTrainingView]|" options:0 metrics:0 views:v14];
  [v9 addConstraints:v15];
}

- (void)_setupEnrollmentWithIntelligentLight
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[VTUIEnrollTrainingViewController _setupEnrollmentWithIntelligentLight]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Setting up enrollment using Intelligent Light", buf, 0xCu);
  }
  int v4 = [VTUIEnrollTrainingIntelligentLightView alloc];
  id v5 = [(VTUIEnrollTrainingViewController *)self view];
  [v5 bounds];
  id v6 = -[VTUIEnrollTrainingIntelligentLightView initWithFrame:](v4, "initWithFrame:");

  [(VTUIEnrollTrainingIntelligentLightView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(VTUIEnrollTrainingIntelligentLightView *)v6 setDelegate:self];
  int v7 = [[VTUIEnrollTrainingViewMediatorGM alloc] initWithTrainingView:v6];
  trainingViewMediator = self->_trainingViewMediator;
  self->_trainingViewMediator = (VTUITrainingViewMediator *)v7;

  if (self->_enrollmentMode == 4) {
    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
  }
  int v9 = [(VTUIEnrollTrainingViewController *)self view];
  [v9 addSubview:v6];
  int v10 = (void *)MEMORY[0x263F08938];
  uint64_t v11 = _NSDictionaryOfVariableBindings(&cfstr_Trainingview.isa, v6, 0);
  __int16 v12 = [v10 constraintsWithVisualFormat:@"H:|[trainingView]|" options:0 metrics:0 views:v11];
  [v9 addConstraints:v12];

  int v13 = (void *)MEMORY[0x263F08938];
  uint64_t v14 = _NSDictionaryOfVariableBindings(&cfstr_Trainingview.isa, v6, 0);
  BOOL v15 = [v13 constraintsWithVisualFormat:@"V:|[trainingView]|" options:0 metrics:0 views:v14];
  [v9 addConstraints:v15];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[VTUIEnrollTrainingViewController viewWillAppear:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillAppear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewController;
  [(VTUIEnrollTrainingViewController *)&v6 viewWillAppear:v3];
  [(VTUIEnrollTrainingViewController *)self _becomeActive];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v13 = "-[VTUIEnrollTrainingViewController viewWillDisappear:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s viewWillDisappear method called", buf, 0xCu);
  }
  int v6 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
  int v7 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
  if (v6) {
    int v7 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v7) endAdvertising:0];
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer cleanup];
  [(VTUIEnrollTrainingViewController *)self _hideTrainingElements];
  self->_isResignedActive = 1;
  int v8 = [(SSRVTUITrainingManager *)self->_trainingManager cancelTrainingForID:self->_sessionId];
  uint64_t v9 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t sessionId = self->_sessionId;
    *(_DWORD *)buf = 136315650;
    int v13 = "-[VTUIEnrollTrainingViewController viewWillDisappear:]";
    __int16 v14 = 2048;
    unint64_t v15 = sessionId;
    __int16 v16 = 1024;
    int v17 = v8;
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s Called cancel training for session %ld with result %d", buf, 0x1Cu);
  }
  v11.receiver = self;
  v11.super_class = (Class)VTUIEnrollTrainingViewController;
  [(VTUIEnrollTrainingViewController *)&v11 viewWillDisappear:v3];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v8 = "-[VTUIEnrollTrainingViewController viewDidDisappear:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s viewDidDisappear method called", buf, 0xCu);
  }
  v6.receiver = self;
  v6.super_class = (Class)VTUIEnrollTrainingViewController;
  [(VTUIEnrollTrainingViewController *)&v6 viewDidDisappear:v3];
  self->_isResignedActive = 1;
  [(VTUIEnrollTrainingViewController *)self _cleanupAllViews];
  [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  if (self->_enrollmentMode != 2)
  {
    id v5 = [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController view];
    [v5 setNeedsUpdateConstraints];
  }
  trainingViewMediator = self->_trainingViewMediator;
  [(VTUITrainingViewMediator *)trainingViewMediator setNeedsUpdateConstraints];
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIEnrollTrainingViewController;
  [(VTUIEnrollTrainingViewController *)&v4 traitCollectionDidChange:a3];
  [(VTUIEnrollTrainingViewController *)self _updateViewBackground];
}

- (void)_updateViewBackground
{
  BOOL v3 = [(VTUIEnrollTrainingViewController *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  id v6 = [(VTUIEnrollTrainingViewController *)self view];
  if (v4 == 2) {
    [MEMORY[0x263F825C8] blackColor];
  }
  else {
  id v5 = [MEMORY[0x263F825C8] whiteColor];
  }
  [v6 setBackgroundColor:v5];
}

- (void)_becomeActive
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    int v7 = "-[VTUIEnrollTrainingViewController _becomeActive]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Making View Active", (uint8_t *)&v6, 0xCu);
  }
  [(VTUIEnrollTrainingViewController *)self _showTrainingElements];
  self->_badMicRetryCount = 0;
  self->_AVVCRetryCount = 0;
  self->_isResignedActive = 0;
  self->_cannotHearRetryCount = 0;
  self->_digitalZerosRetryCount = 0;
  if ([MEMORY[0x263F28510] isSCDAFrameworkEnabled]) {
    uint64_t v4 = 1352;
  }
  else {
    uint64_t v4 = 1344;
  }
  if (!*(Class *)((char *)&self->super.super.super.isa + v4)) {
    [(VTUIEnrollTrainingViewController *)self _setupMyriadCoordinator];
  }
  if (self->_enrollmentMode == 6)
  {
    [(VTUIEnrollTrainingViewController *)self _showVTConfirmationView];
  }
  else
  {
    int64_t currentTrainingState = self->_currentTrainingState;
    if (currentTrainingState == -1) {
      [(VTUIEnrollTrainingViewController *)self _startEnrollment];
    }
    else {
      [(VTUIEnrollTrainingViewController *)self _showTrainingInstruction:currentTrainingState afterDelay:0 isRetry:1 animate:0.0];
    }
  }
}

- (void)_resignActive
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[VTUIEnrollTrainingViewController _resignActive]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Resigning Active", (uint8_t *)&v5, 0xCu);
  }
  self->_isResignedActive = 1;
  [(VTUIEnrollTrainingViewController *)self _hideTrainingElements];
  [(VTUIEnrollTrainingViewController *)self _resetTrainingManager];
  uint64_t v4 = [(VTUIEnrollTrainingViewController *)self audioHintPlayer];
  [v4 cleanup];
}

- (void)_didEnterBackground
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIEnrollTrainingViewController _didEnterBackground]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Did Enter Background", (uint8_t *)&v4, 0xCu);
  }
  if ([(VTUIEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    [(VTUIEnrollTrainingViewController *)self _resetEnrollment];
    [(VTUITrainingViewMediator *)self->_trainingViewMediator clearInstructionLabel];
  }
  if (self->_currentTrainingState <= 4) {
    [(VTUIEnrollTrainingViewController *)self _startEnrollment];
  }
  [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController didEnterBackground];
}

- (void)_hideTrainingElements
{
}

- (void)_showTrainingElements
{
}

- (void)_showBadMicAlertWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__VTUIEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke;
  v6[3] = &unk_264D4C230;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v6];
}

uint64_t __67__VTUIEnrollTrainingViewController__showBadMicAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[VTUIEnrollTrainingViewController _showBadMicAlertWithCompletion:]_block_invoke";
    _os_log_impl(&dword_238878000, v2, OS_LOG_TYPE_DEFAULT, "%s Showing Bad Mic Alert", (uint8_t *)&v4, 0xCu);
  }
  return [*(id *)(a1 + 32) _showBadMicAlertCompletion:*(void *)(a1 + 40)];
}

- (void)_retryAfterBadMicAlert
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    id v5 = "-[VTUIEnrollTrainingViewController _retryAfterBadMicAlert]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_INFO, "%s Trying again after Bad Mic Alert", (uint8_t *)&v4, 0xCu);
  }
  [(VTUIEnrollTrainingViewController *)self _resumeTraining:1];
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
    uint64_t v8 = "-[VTUIEnrollTrainingViewController _showUnsupportedLocaleAlert]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Showing Unsupported LocaleAlert", buf, 0xCu);
  }
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __63__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke;
  v4[3] = &unk_264D4C258;
  objc_copyWeak(&v5, &location);
  [(VTUIEnrollTrainingViewController *)self _showUnsupportedLocaleAlertCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __63__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained trainingManager];
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
  v50[5] = *MEMORY[0x263EF8340];
  v28 = +[VTUIStyle sharedStyle];
  uint64_t v3 = [v28 shouldSetupForMultipleTriggerPhrases];
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer updateIfNeededForUsesMultipleTriggers:v3];
  id v4 = [(VTUIAudioHintPlayer *)self->_audioHintPlayer outputVoice];
  if (v3)
  {
    v48[0] = @"Instruction";
    v27 = +[VTUIStringsHelper sharedStringsHelper];
    [v27 uiLocalizedStringForKey:@"TEXT_TITLE_UTT1" usesMultipleTriggers:1 siriVoice:v4];
    uint64_t v26 = v48[1] = @"RetryOnFail";
    v49[0] = v26;
    v49[1] = MEMORY[0x263EFFA80];
    v25 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:2];
    v50[0] = v25;
    v46[0] = @"Instruction";
    __int16 v24 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v5 = [v24 uiLocalizedStringForKey:@"TEXT_TITLE_UTT2" usesMultipleTriggers:0 siriVoice:v4];
    v46[1] = @"RetryOnFail";
    uint64_t v6 = MEMORY[0x263EFFA88];
    v23 = (void *)v5;
    v47[0] = v5;
    v47[1] = MEMORY[0x263EFFA88];
    __int16 v22 = [NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:2];
    v50[1] = v22;
    v44[0] = @"Instruction";
    v21 = +[VTUIStringsHelper sharedStringsHelper];
    [v21 uiLocalizedStringForKey:@"TEXT_TITLE_UTT3" usesMultipleTriggers:1 siriVoice:v4];
    v45[0] = v44[1] = @"RetryOnFail";
    uint64_t v20 = (void *)v45[0];
    v45[1] = v6;
    id v7 = [NSDictionary dictionaryWithObjects:v45 forKeys:v44 count:2];
    v50[2] = v7;
    v42[0] = @"Instruction";
    uint64_t v8 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v9 = [v8 uiLocalizedStringForKey:@"TEXT_TITLE_UTT4" usesMultipleTriggers:0 siriVoice:v4];
    v42[1] = @"RetryOnFail";
    v43[0] = v9;
    v43[1] = v6;
    int v10 = [NSDictionary dictionaryWithObjects:v43 forKeys:v42 count:2];
    v50[3] = v10;
    v40[0] = @"Instruction";
    objc_super v11 = +[VTUIStringsHelper sharedStringsHelper];
    __int16 v12 = [v11 uiLocalizedStringForKey:@"TEXT_TITLE_UTT5" usesMultipleTriggers:1 siriVoice:v4];
    v40[1] = @"RetryOnFail";
    v41[0] = v12;
    v41[1] = v6;
    int v13 = [NSDictionary dictionaryWithObjects:v41 forKeys:v40 count:2];
    v50[4] = v13;
    __int16 v14 = (void *)MEMORY[0x263EFF8C0];
    unint64_t v15 = v50;
  }
  else
  {
    v37[0] = @"Instruction";
    v27 = +[VTUIStringsHelper sharedStringsHelper];
    [v27 uiLocalizedStringForKey:@"TEXT_TITLE_UTT1" usesMultipleTriggers:0 siriVoice:v4];
    uint64_t v26 = v37[1] = @"RetryOnFail";
    v38[0] = v26;
    v38[1] = MEMORY[0x263EFFA80];
    v25 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    v39[0] = v25;
    v35[0] = @"Instruction";
    __int16 v24 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v16 = [v24 uiLocalizedStringForKey:@"TEXT_TITLE_UTT2" usesMultipleTriggers:0 siriVoice:v4];
    v35[1] = @"RetryOnFail";
    uint64_t v17 = MEMORY[0x263EFFA88];
    v23 = (void *)v16;
    v36[0] = v16;
    v36[1] = MEMORY[0x263EFFA88];
    __int16 v22 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:2];
    v39[1] = v22;
    v33[0] = @"Instruction";
    v21 = +[VTUIStringsHelper sharedStringsHelper];
    [v21 uiLocalizedStringForKey:@"TEXT_TITLE_UTT3" usesMultipleTriggers:0 siriVoice:v4];
    v34[0] = v33[1] = @"RetryOnFail";
    uint64_t v20 = (void *)v34[0];
    v34[1] = v17;
    id v7 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:2];
    v39[2] = v7;
    v31[0] = @"Instruction";
    uint64_t v8 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v9 = [v8 uiLocalizedStringForKey:@"TEXT_TITLE_UTT4" usesMultipleTriggers:0 siriVoice:v4];
    v31[1] = @"RetryOnFail";
    v32[0] = v9;
    v32[1] = v17;
    int v10 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
    v39[3] = v10;
    v29[0] = @"Instruction";
    objc_super v11 = +[VTUIStringsHelper sharedStringsHelper];
    __int16 v12 = [v11 uiLocalizedStringForKey:@"TEXT_TITLE_UTT5" usesMultipleTriggers:0 siriVoice:v4];
    v29[1] = @"RetryOnFail";
    v30[0] = v12;
    v30[1] = v17;
    int v13 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:2];
    v39[4] = v13;
    __int16 v14 = (void *)MEMORY[0x263EFF8C0];
    unint64_t v15 = v39;
  }
  uint64_t v18 = [v14 arrayWithObjects:v15 count:5];
  trainingPageInstructions = self->_trainingPageInstructions;
  self->_trainingPageInstructions = v18;
}

- (void)_animateSuccessfulStep:(BOOL)a3 completion:(id)a4
{
}

- (void)_resetIdleTimer
{
  v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 setIdleTimerDisabled:1];

  id v3 = [MEMORY[0x263F82438] sharedApplication];
  [v3 setIdleTimerDisabled:0];
}

- (void)_showGMIntroView
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    objc_super v19 = "-[VTUIEnrollTrainingViewController _showGMIntroView]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying GM view", buf, 0xCu);
  }
  if (!self->_gmViewController)
  {
    id v4 = [(VTUIEnrollTrainingViewController *)self view];
    uint64_t v5 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v6 = [v5 userInterfaceIdiom];

    id v7 = [(VTUIEnrollTrainingViewController *)self navigationController];
    [v7 setModalPresentationStyle:2 * ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1)];

    uint64_t v8 = [[VTUIGMEnrollmentViewController alloc] initWithDelegate:self];
    gmViewController = self->_gmViewController;
    self->_gmViewController = v8;

    [(VTUIGMEnrollmentViewController *)self->_gmViewController willMoveToParentViewController:self];
    [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_gmViewController];
    [(VTUIGMEnrollmentViewController *)self->_gmViewController didMoveToParentViewController:self];
    int v10 = [(VTUIGMEnrollmentViewController *)self->_gmViewController view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v10 setAutoresizesSubviews:0];
    objc_super v11 = [(VTUIEnrollTrainingViewController *)self view];
    [v11 addSubview:v10];

    __int16 v12 = (void *)MEMORY[0x263F08938];
    int v13 = _NSDictionaryOfVariableBindings(&cfstr_Gmview.isa, v10, 0);
    __int16 v14 = [v12 constraintsWithVisualFormat:@"H:|[gmView]|" options:0 metrics:0 views:v13];
    [v4 addConstraints:v14];

    unint64_t v15 = (void *)MEMORY[0x263F08938];
    uint64_t v16 = _NSDictionaryOfVariableBindings(&cfstr_Gmview.isa, v10, 0);
    uint64_t v17 = [v15 constraintsWithVisualFormat:@"V:|[gmView]|" options:0 metrics:0 views:v16];
    [v4 addConstraints:v17];

    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
    [(VTUIEnrollTrainingViewController *)self prewarm];
  }
  if (MGGetBoolAnswer()) {
    [(VTUIEnrollTrainingViewController *)self _prepareCameraButtonBuddy];
  }
}

- (void)_prepareCameraButtonBuddy
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v10 = "-[VTUIEnrollTrainingViewController _prepareCameraButtonBuddy]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Preloading Camera Button Buddy", buf, 0xCu);
  }
  id v4 = (CAMCameraButtonBuddyViewController *)objc_alloc_init(MEMORY[0x263F30778]);
  cameraButtonBuddyViewController = self->_cameraButtonBuddyViewController;
  self->_cameraButtonBuddyViewController = v4;

  [(CAMCameraButtonBuddyViewController *)self->_cameraButtonBuddyViewController setDelegate:self];
  [(CAMCameraButtonBuddyViewController *)self->_cameraButtonBuddyViewController willMoveToParentViewController:self];
  [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_cameraButtonBuddyViewController];
  [(CAMCameraButtonBuddyViewController *)self->_cameraButtonBuddyViewController didMoveToParentViewController:self];
  objc_initWeak((id *)buf, self);
  uint64_t v6 = self->_cameraButtonBuddyViewController;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__VTUIEnrollTrainingViewController__prepareCameraButtonBuddy__block_invoke;
  v7[3] = &unk_264D4C258;
  objc_copyWeak(&v8, (id *)buf);
  [(CAMCameraButtonBuddyViewController *)v6 loadAssetsWithCompletion:v7];
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __61__VTUIEnrollTrainingViewController__prepareCameraButtonBuddy__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained) {
    WeakRetained[1241] = 1;
  }
}

- (void)siriGMIntroViewControllerContinuePressed:(id)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315138;
    id v7 = "-[VTUIEnrollTrainingViewController siriGMIntroViewControllerContinuePressed:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s GM view Continue", (uint8_t *)&v6, 0xCu);
  }
  if ([MEMORY[0x263F843A8] isEligibleForExperience:0]) {
    [(VTUIEnrollTrainingViewController *)self _continueToSummarizationFromGM];
  }
  else {
    [(VTUIEnrollTrainingViewController *)self _continueToNextFromGM];
  }
}

- (void)_continueToSummarizationFromGM
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v21 = "-[VTUIEnrollTrainingViewController _continueToSummarizationFromGM]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s GM to Summarization", buf, 0xCu);
  }
  id v4 = [(VTUIEnrollTrainingViewController *)self view];
  uint64_t v5 = [MEMORY[0x263F843A8] onboardingControllerForExperience:0];
  summarizationOnboardingController = self->_summarizationOnboardingController;
  self->_summarizationOnboardingController = v5;

  [(UNNotificationOnboardingController *)self->_summarizationOnboardingController setDelegate:self];
  [(UNNotificationOnboardingController *)self->_summarizationOnboardingController willMoveToParentViewController:self];
  [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_summarizationOnboardingController];
  [(UNNotificationOnboardingController *)self->_summarizationOnboardingController didMoveToParentViewController:self];
  id v7 = [(UNNotificationOnboardingController *)self->_summarizationOnboardingController view];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v7 setAutoresizesSubviews:0];
  [v4 addSubview:v7];
  [v7 setAlpha:0.0];
  uint64_t v8 = (void *)MEMORY[0x263F08938];
  uint64_t v9 = _NSDictionaryOfVariableBindings(&cfstr_Summarizationv.isa, v7, 0);
  int v10 = [v8 constraintsWithVisualFormat:@"H:|[summarizationView]|" options:0 metrics:0 views:v9];
  [v4 addConstraints:v10];

  uint64_t v11 = (void *)MEMORY[0x263F08938];
  __int16 v12 = _NSDictionaryOfVariableBindings(&cfstr_Summarizationv.isa, v7, 0);
  int v13 = [v11 constraintsWithVisualFormat:@"V:|[summarizationView]|" options:0 metrics:0 views:v12];
  [v4 addConstraints:v13];

  objc_initWeak((id *)buf, self);
  __int16 v14 = (void *)MEMORY[0x263F82E00];
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __66__VTUIEnrollTrainingViewController__continueToSummarizationFromGM__block_invoke;
  v18[3] = &unk_264D4C280;
  id v15 = v7;
  id v19 = v15;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __66__VTUIEnrollTrainingViewController__continueToSummarizationFromGM__block_invoke_2;
  v16[3] = &unk_264D4C2A8;
  objc_copyWeak(&v17, (id *)buf);
  [v14 animateWithDuration:v18 animations:v16 completion:0.3];
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

uint64_t __66__VTUIEnrollTrainingViewController__continueToSummarizationFromGM__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __66__VTUIEnrollTrainingViewController__continueToSummarizationFromGM__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained[140] view];
    [v2 removeFromSuperview];

    id v3 = v4[140];
    v4[140] = 0;

    id WeakRetained = v4;
  }
}

- (void)_continueToCameraButtonBuddy
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v8 = "-[VTUIEnrollTrainingViewController _continueToCameraButtonBuddy]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s To Camera Button Buddy", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v4 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__VTUIEnrollTrainingViewController__continueToCameraButtonBuddy__block_invoke;
  block[3] = &unk_264D4C258;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __64__VTUIEnrollTrainingViewController__continueToCameraButtonBuddy__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    if (!WeakRetained[1241])
    {
      do
        [MEMORY[0x263F08B88] sleepForTimeInterval:0.05];
      while (!v2[1241]);
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __64__VTUIEnrollTrainingViewController__continueToCameraButtonBuddy__block_invoke_2;
    block[3] = &unk_264D4C280;
    void block[4] = v2;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __64__VTUIEnrollTrainingViewController__continueToCameraButtonBuddy__block_invoke_2(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    id v3 = [v2 view];
    id v4 = [*(id *)(*(void *)(a1 + 32) + 1160) view];
    [v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 setAutoresizesSubviews:0];
    [v3 addSubview:v4];
    [v4 setAlpha:0.0];
    uint64_t v5 = (void *)MEMORY[0x263F08938];
    id v6 = _NSDictionaryOfVariableBindings(&cfstr_Camerabuddyvie.isa, v4, 0);
    id v7 = [v5 constraintsWithVisualFormat:@"H:|[cameraBuddyView]|" options:0 metrics:0 views:v6];
    [v3 addConstraints:v7];

    uint64_t v8 = (void *)MEMORY[0x263F08938];
    uint64_t v9 = _NSDictionaryOfVariableBindings(&cfstr_Camerabuddyvie.isa, v4, 0);
    int v10 = [v8 constraintsWithVisualFormat:@"V:|[cameraBuddyView]|" options:0 metrics:0 views:v9];
    [v3 addConstraints:v10];

    uint64_t v11 = (void *)MEMORY[0x263F82E00];
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __64__VTUIEnrollTrainingViewController__continueToCameraButtonBuddy__block_invoke_3;
    v13[3] = &unk_264D4C280;
    id v14 = v4;
    id v12 = v4;
    [v11 animateWithDuration:v13 animations:0 completion:0.3];
  }
}

uint64_t __64__VTUIEnrollTrainingViewController__continueToCameraButtonBuddy__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)cameraButtonBuddyViewControllerDidFinish:(id)a3
{
  id v4 = [(CAMCameraButtonBuddyViewController *)self->_cameraButtonBuddyViewController view];
  [v4 removeFromSuperview];

  cameraButtonBuddyViewController = self->_cameraButtonBuddyViewController;
  self->_cameraButtonBuddyViewController = 0;

  [(VTUIEnrollTrainingViewController *)self _showSiriIntroView];
}

- (void)_continueToNextFromGM
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[VTUIEnrollTrainingViewController _continueToNextFromGM]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s GM to next buddy", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v4 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __57__VTUIEnrollTrainingViewController__continueToNextFromGM__block_invoke;
  v10[3] = &unk_264D4C280;
  v10[4] = self;
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __57__VTUIEnrollTrainingViewController__continueToNextFromGM__block_invoke_2;
  uint64_t v8 = &unk_264D4C2A8;
  objc_copyWeak(&v9, (id *)buf);
  [v4 animateWithDuration:v10 animations:&v5 completion:0.3];
  [(VTUIEnrollTrainingViewController *)self _showCameraButtonBuddyControlOrSiriIntro];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __57__VTUIEnrollTrainingViewController__continueToNextFromGM__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1120) view];
  [v1 setAlpha:0.0];
}

void __57__VTUIEnrollTrainingViewController__continueToNextFromGM__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained[140] view];
    [v2 removeFromSuperview];

    id v3 = v4[140];
    v4[140] = 0;

    id WeakRetained = v4;
  }
}

- (void)_continueToNextFromSummarization
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v12 = "-[VTUIEnrollTrainingViewController _continueToNextFromSummarization]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Summarization to next buddy", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v4 = (void *)MEMORY[0x263F82E00];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __68__VTUIEnrollTrainingViewController__continueToNextFromSummarization__block_invoke;
  v10[3] = &unk_264D4C280;
  v10[4] = self;
  uint64_t v5 = MEMORY[0x263EF8330];
  uint64_t v6 = 3221225472;
  id v7 = __68__VTUIEnrollTrainingViewController__continueToNextFromSummarization__block_invoke_2;
  uint64_t v8 = &unk_264D4C2A8;
  objc_copyWeak(&v9, (id *)buf);
  [v4 animateWithDuration:v10 animations:&v5 completion:0.3];
  [(VTUIEnrollTrainingViewController *)self _showCameraButtonBuddyControlOrSiriIntro];
  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __68__VTUIEnrollTrainingViewController__continueToNextFromSummarization__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1176) view];
  [v1 setAlpha:0.0];
}

void __68__VTUIEnrollTrainingViewController__continueToNextFromSummarization__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained[147] view];
    [v2 removeFromSuperview];

    id v3 = v4[147];
    v4[147] = 0;

    id WeakRetained = v4;
  }
}

- (void)_showCameraButtonBuddyControlOrSiriIntro
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  int v3 = MGGetBoolAnswer();
  id v4 = VTUILogContextFacility;
  BOOL v5 = os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      int v6 = 136315138;
      id v7 = "-[VTUIEnrollTrainingViewController _showCameraButtonBuddyControlOrSiriIntro]";
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Continue to Camera Button Buddy", (uint8_t *)&v6, 0xCu);
    }
    [(VTUIEnrollTrainingViewController *)self _continueToCameraButtonBuddy];
  }
  else
  {
    if (v5)
    {
      int v6 = 136315138;
      id v7 = "-[VTUIEnrollTrainingViewController _showCameraButtonBuddyControlOrSiriIntro]";
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Continue to Siri Buddy", (uint8_t *)&v6, 0xCu);
    }
    [(VTUIEnrollTrainingViewController *)self _showSiriIntroView];
  }
}

- (void)onboardingController:(id)a3 requestsPushingTo:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(VTUIEnrollTrainingViewController *)self view];
  id v9 = v7;
  [v9 setDelegate:self];
  [v9 willMoveToParentViewController:self];
  [(VTUIEnrollTrainingViewController *)self addChildViewController:v9];
  [v9 didMoveToParentViewController:self];
  int v10 = [v9 view];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v10 setAutoresizesSubviews:0];
  [v8 addSubview:v10];
  [v10 setAlpha:0.0];
  uint64_t v11 = (void *)MEMORY[0x263F08938];
  id v12 = _NSDictionaryOfVariableBindings(&cfstr_Nextsummarizat.isa, v10, 0);
  uint64_t v13 = [v11 constraintsWithVisualFormat:@"H:|[nextSummarizationView]|" options:0 metrics:0 views:v12];
  [v8 addConstraints:v13];

  id v14 = (void *)MEMORY[0x263F08938];
  id v15 = _NSDictionaryOfVariableBindings(&cfstr_Nextsummarizat.isa, v10, 0);
  uint64_t v16 = [v14 constraintsWithVisualFormat:@"V:|[nextSummarizationView]|" options:0 metrics:0 views:v15];
  [v8 addConstraints:v16];

  objc_initWeak(&location, self);
  id v17 = (void *)MEMORY[0x263F82E00];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __75__VTUIEnrollTrainingViewController_onboardingController_requestsPushingTo___block_invoke;
  v23[3] = &unk_264D4C280;
  id v18 = v10;
  id v24 = v18;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __75__VTUIEnrollTrainingViewController_onboardingController_requestsPushingTo___block_invoke_2;
  v20[3] = &unk_264D4C2D0;
  objc_copyWeak(&v22, &location);
  id v19 = v9;
  id v21 = v19;
  [v17 animateWithDuration:v23 animations:v20 completion:0.3];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

uint64_t __75__VTUIEnrollTrainingViewController_onboardingController_requestsPushingTo___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __75__VTUIEnrollTrainingViewController_onboardingController_requestsPushingTo___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = WeakRetained + 147;
    id v6 = WeakRetained;
    id v4 = [WeakRetained[147] view];
    [v4 removeFromSuperview];

    id v5 = *v3;
    id *v3 = 0;

    objc_storeStrong(v3, *(id *)(a1 + 32));
    id WeakRetained = v6;
  }
}

- (void)_showSiriIntroView
{
  uint64_t v69 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v66 = "-[VTUIEnrollTrainingViewController _showSiriIntroView]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying Intro view", buf, 0xCu);
  }
  educationViewController = self->_educationViewController;
  if (educationViewController)
  {
    id v5 = [(VTUISiriEducationViewController *)educationViewController view];
    [v5 removeFromSuperview];

    id v6 = self->_educationViewController;
    self->_educationViewController = 0;
  }
  [(VTUIEnrollTrainingViewController *)self setDidShowVoiceTriggerPrompt:1];
  if (!self->_introViewController)
  {
    id v7 = [(VTUIEnrollTrainingViewController *)self view];
    uint64_t v8 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    int v10 = [(VTUIEnrollTrainingViewController *)self navigationController];
    uint64_t v11 = v10;
    if ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
      uint64_t v12 = 2;
    }
    else {
      uint64_t v12 = 0;
    }
    [v10 setModalPresentationStyle:v12];

    [(VTUIEnrollTrainingViewController *)self _setInitialTriggerPhraseIfNotSet];
    [(VTUIEnrollTrainingViewController *)self _setupTrainingStates];
    char v63 = 0;
    uint64_t v13 = [MEMORY[0x263F285A0] sharedPreferences];
    id v14 = [MEMORY[0x263EFF960] currentLocale];
    id v15 = [v14 localeIdentifier];
    uint64_t v16 = [v13 allSiriLanguageCodesForSystemLanguageCode:v15 isGoodFit:&v63];
    siriLanguageOptions = self->_siriLanguageOptions;
    self->_siriLanguageOptions = v16;

    if (self->_disambiguateLanguageOptionsForTesting)
    {
      id v18 = self->_siriLanguageOptions;
      self->_siriLanguageOptions = (NSArray *)&unk_26EB98DE8;
    }
    [v7 bounds];
    double Width = CGRectGetWidth(v70);
    uint64_t v20 = [MEMORY[0x263F82B60] mainScreen];
    [v20 bounds];
    BOOL v21 = vabdd_f64(Width, CGRectGetWidth(v71)) > 2.22044605e-16;

    id v22 = +[VTUIStyle sharedStyle];
    [v22 setIsFloatingWithReducedWidth:v21];

    if ([(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
    {
      v23 = [(VTUIEnrollTrainingViewController *)self view];
      [v23 bounds];
      double v25 = v24;
      double v27 = v26;
      double v29 = v28;
      double v31 = v30;

      v32 = -[VTUIEnrollmentSetupIntroViewControllerGM initWithFrame:delegate:]([VTUIEnrollmentSetupIntroViewControllerGM alloc], "initWithFrame:delegate:", self, v25, v27, v29, v31);
      introViewController = self->_introViewController;
      self->_introViewController = (VTUIEnrollmentSetupIntroViewControlling *)v32;

      [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_introViewController];
      v34 = [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController view];
      [v34 setAlpha:0.0];
      v35 = [(VTUIEnrollTrainingViewController *)self view];
      [v35 addSubview:v34];

      objc_initWeak((id *)buf, self);
      v36 = (void *)MEMORY[0x263F82E00];
      v61[0] = MEMORY[0x263EF8330];
      v61[1] = 3221225472;
      v61[2] = __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke;
      v61[3] = &unk_264D4C280;
      id v37 = v34;
      id v62 = v37;
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke_2;
      v59[3] = &unk_264D4C2A8;
      objc_copyWeak(&v60, (id *)buf);
      [v36 animateWithDuration:v61 animations:v59 completion:0.3];
      objc_destroyWeak(&v60);

      objc_destroyWeak((id *)buf);
    }
    else
    {
      v38 = [[VTUIEnrollmentSetupIntroViewControllerOrb alloc] initWithDelegate:self];
      v39 = self->_introViewController;
      self->_introViewController = (VTUIEnrollmentSetupIntroViewControlling *)v38;

      [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController willMoveToParentViewController:self];
      [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_introViewController];
      [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController didMoveToParentViewController:self];
      id v37 = [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController view];
      [v37 setTranslatesAutoresizingMaskIntoConstraints:0];
      [v37 setAutoresizesSubviews:0];
      uint64_t v40 = [(VTUIEnrollTrainingViewController *)self view];
      [v40 addSubview:v37];

      int v41 = (void *)MEMORY[0x263F08938];
      v42 = _NSDictionaryOfVariableBindings(&cfstr_Introview.isa, v37, 0);
      __int16 v43 = [v41 constraintsWithVisualFormat:@"H:|[introView]|" options:0 metrics:0 views:v42];
      [v7 addConstraints:v43];

      v44 = (void *)MEMORY[0x263F08938];
      __int16 v45 = _NSDictionaryOfVariableBindings(&cfstr_Introview.isa, v37, 0);
      v46 = [v44 constraintsWithVisualFormat:@"V:|[introView]|" options:0 metrics:0 views:v45];
      [v7 addConstraints:v46];
    }
    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
    [(VTUIAnalytics *)self->_analyticsEvent setIntroViewShown:[(VTUIAnalytics *)self->_analyticsEvent introViewShown] + 1];
    uint64_t v47 = +[VTUIStyle sharedStyle];
    uint64_t v48 = [v47 enrollmentMode];

    v49 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      v66 = "-[VTUIEnrollTrainingViewController _showSiriIntroView]";
      __int16 v67 = 2048;
      uint64_t v68 = v48;
      _os_log_impl(&dword_238878000, v49, OS_LOG_TYPE_DEFAULT, "%s Enrollment mode: %ld", buf, 0x16u);
    }
    if (v48 != 2 && v48 != 4)
    {
      if (!self->_provider)
      {
        v50 = (AFEnablementFlowConfigurationProvider *)objc_alloc_init(MEMORY[0x263F28500]);
        provider = self->_provider;
        self->_provider = v50;
      }
      if (!self->_enablementConfiguration)
      {
        if ([(VTUIEnrollTrainingViewController *)self _shouldPresentLanguageDisambiguation])
        {
          v52 = self->_siriLanguageOptions;
        }
        else
        {
          spokenLanguageCode = self->_spokenLanguageCode;
          v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:&spokenLanguageCode count:1];
        }
        v53 = v52;
        objc_initWeak((id *)buf, self);
        self->_isEnablementConfigurationLoading = 1;
        v54 = self->_provider;
        v56[0] = MEMORY[0x263EF8330];
        v56[1] = 3221225472;
        v56[2] = __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke_175;
        v56[3] = &unk_264D4C320;
        objc_copyWeak(&v58, (id *)buf);
        v55 = v53;
        v57 = v55;
        [(AFEnablementFlowConfigurationProvider *)v54 configurationForEnablementFlow:1 recognitionLanguageCodes:v55 completion:v56];

        objc_destroyWeak(&v58);
        objc_destroyWeak((id *)buf);
      }
    }
  }
}

uint64_t __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

void __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[159] showTrainingView];
    id WeakRetained = v2;
  }
}

void __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke_175(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke_2_176;
  block[3] = &unk_264D4C2F8;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v8);
}

void __54__VTUIEnrollTrainingViewController__showSiriIntroView__block_invoke_2_176(uint64_t a1)
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
      uint64_t v9 = "-[VTUIEnrollTrainingViewController _showSiriIntroView]_block_invoke_2";
      __int16 v10 = 2112;
      uint64_t v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v5;
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Enablement Configuration %@ for recognition languages %@", (uint8_t *)&v8, 0x20u);
    }
    objc_storeStrong(WeakRetained + 150, *(id *)(a1 + 32));
    *((unsigned char *)WeakRetained + 1240) = 0;
    id v6 = (void (**)(void))WeakRetained[156];
    if (v6)
    {
      v6[2]();
      id v7 = WeakRetained[156];
      WeakRetained[156] = 0;
    }
  }
}

- (void)_showVTConfirmationView
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    double v26 = "-[VTUIEnrollTrainingViewController _showVTConfirmationView]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Displaying Voice Trigger Confirmation view", buf, 0xCu);
  }
  educationViewController = self->_educationViewController;
  if (educationViewController)
  {
    uint64_t v5 = [(VTUISiriEducationViewController *)educationViewController view];
    [v5 removeFromSuperview];

    id v6 = self->_educationViewController;
    self->_educationViewController = 0;
  }
  [(VTUIEnrollTrainingViewController *)self setDidShowVoiceTriggerPrompt:1];
  if (!self->_vtConfirmationViewController)
  {
    id v7 = [(VTUIEnrollTrainingViewController *)self view];
    int v8 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v9 = [v8 userInterfaceIdiom];

    __int16 v10 = [(VTUIEnrollTrainingViewController *)self navigationController];
    [v10 setModalPresentationStyle:2 * ((v9 & 0xFFFFFFFFFFFFFFFBLL) == 1)];

    [v7 bounds];
    double Width = CGRectGetWidth(v28);
    __int16 v12 = [MEMORY[0x263F82B60] mainScreen];
    [v12 bounds];
    BOOL v13 = vabdd_f64(Width, CGRectGetWidth(v29)) > 2.22044605e-16;

    uint64_t v14 = +[VTUIStyle sharedStyle];
    [v14 setIsFloatingWithReducedWidth:v13];

    id v15 = [[VTUIVoiceTriggerConfirmationViewController alloc] initWithDelegate:self];
    vtConfirmationViewController = self->_vtConfirmationViewController;
    self->_vtConfirmationViewController = v15;

    [(VTUIVoiceTriggerConfirmationViewController *)self->_vtConfirmationViewController willMoveToParentViewController:self];
    [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_vtConfirmationViewController];
    [(VTUIVoiceTriggerConfirmationViewController *)self->_vtConfirmationViewController didMoveToParentViewController:self];
    id v17 = [(VTUIVoiceTriggerConfirmationViewController *)self->_vtConfirmationViewController view];
    [v17 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v17 setAutoresizesSubviews:0];
    id v18 = [(VTUIEnrollTrainingViewController *)self view];
    [v18 addSubview:v17];

    id v19 = (void *)MEMORY[0x263F08938];
    uint64_t v20 = _NSDictionaryOfVariableBindings(&cfstr_Vtview.isa, v17, 0);
    BOOL v21 = [v19 constraintsWithVisualFormat:@"H:|[vtView]|" options:0 metrics:0 views:v20];
    [v7 addConstraints:v21];

    id v22 = (void *)MEMORY[0x263F08938];
    v23 = _NSDictionaryOfVariableBindings(&cfstr_Vtview.isa, v17, 0);
    double v24 = [v22 constraintsWithVisualFormat:@"V:|[vtView]|" options:0 metrics:0 views:v23];
    [v7 addConstraints:v24];

    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
  }
}

- (void)_processVTConfirmationViewContinueAction:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[VTUIEnrollTrainingViewController _processVTConfirmationViewContinueAction:]";
    _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Enabling voice trigger - confirmation continued", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v5 setVoiceTriggerEnabled:1];

  id v6 = [MEMORY[0x263F78BB8] sharedInstance];
  id v7 = (id)[v6 voiceTriggerRepromptFinished];

  [(VTUIEnrollTrainingViewController *)self _proceedAfterTrainingCompletionOrSkip];
}

- (void)_processVTConfirmationLaterAction:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[VTUIEnrollTrainingViewController _processVTConfirmationLaterAction:]";
    _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Disabling voice trigger - confirmation skipped", (uint8_t *)&v8, 0xCu);
  }
  uint64_t v5 = [MEMORY[0x263F85AF0] sharedPreferences];
  [v5 setVoiceTriggerEnabled:0];

  id v6 = [MEMORY[0x263F78BB8] sharedInstance];
  id v7 = (id)[v6 voiceTriggerRepromptFinished];

  [(VTUIEnrollTrainingViewController *)self _proceedAfterTrainingCompletionOrSkip];
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
  uint64_t v9 = [v8 getActivePairedDevice];

  uint64_t v10 = [v9 valueForProperty:*MEMORY[0x263F57660]];
  int v11 = [MEMORY[0x263F284A0] siriIsSupportedForLanguageCode:self->_spokenLanguageCode productName:v10 productVersion:v7 error:0];
  __int16 v12 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    BOOL v13 = @"false";
    if (v11) {
      BOOL v13 = @"true";
    }
    int v16 = 136315394;
    id v17 = "-[VTUIEnrollTrainingViewController _siriLanguageIsIncompatibleWithPairedWatch]";
    __int16 v18 = 2112;
    id v19 = v13;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s Is Siri Language Supported on watch ? - %@", (uint8_t *)&v16, 0x16u);
  }
  char v14 = v11 ^ 1;

  return v14;
}

- (void)_warnForLanguageCompatibilityIfNecessary:(id)a3
{
  int v4 = (void (**)(void))a3;
  if ([(VTUIEnrollTrainingViewController *)self _siriLanguageIsIncompatibleWithPairedWatch])
  {
    uint64_t v5 = (void *)MEMORY[0x263F82418];
    id v6 = +[VTUIStringsHelper sharedStringsHelper];
    id v7 = [v6 uiLocalizedStringForKey:@"ALERT_TITLE_LANGUAGE_NOT_SUPPORTED_ON_WATCH"];
    int v8 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v9 = [v8 uiLocalizedStringForKey:@"ALERT_MESSAGE_LANGUAGE_NOT_SUPPORTED_ON_WATCH"];
    uint64_t v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    int v11 = (void *)MEMORY[0x263F82400];
    __int16 v12 = +[VTUIStringsHelper sharedStringsHelper];
    BOOL v13 = [v12 uiLocalizedStringForKey:@"ALERT_BUTTON_CONTINUE"];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __77__VTUIEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke;
    v15[3] = &unk_264D4C348;
    int v16 = v4;
    char v14 = [v11 actionWithTitle:v13 style:0 handler:v15];

    [v10 addAction:v14];
    [(VTUIEnrollTrainingViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else if (v4)
  {
    v4[2](v4);
  }
}

uint64_t __77__VTUIEnrollTrainingViewController__warnForLanguageCompatibilityIfNecessary___block_invoke(uint64_t a1)
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

- (void)_setInitialTriggerPhraseIfNotSet
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (!_os_feature_enabled_impl()) {
    return;
  }
  BOOL v3 = [MEMORY[0x263F285A0] sharedPreferences];
  int v4 = [v3 languageCode];

  if (!v4)
  {
    uint64_t v5 = [MEMORY[0x263F285A0] sharedPreferences];
    int v4 = [v5 bestSupportedLanguageCodeForLanguageCode:0];
  }
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  if (disambiguatedLanguageOption)
  {
    BOOL v7 = [(NSString *)disambiguatedLanguageOption isEqualToString:v4];
    if (!v7)
    {
      int v8 = self->_disambiguatedLanguageOption;

      int v4 = (__CFString *)v8;
    }
    int v9 = !v7;
    if (self->_disambiguatedLanguageOption) {
      goto LABEL_12;
    }
  }
  else
  {
    int v9 = 0;
  }
  if (![(NSString *)self->_spokenLanguageCode isEqualToString:v4])
  {
    uint64_t v10 = self->_spokenLanguageCode;

    int v9 = 1;
    int v4 = (__CFString *)v10;
  }
LABEL_12:
  int v11 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315394;
    v23 = "-[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet]";
    __int16 v24 = 2112;
    double v25 = v4;
    _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s setting initial trigger phrase based on langauge code: %@", (uint8_t *)&v22, 0x16u);
  }
  __int16 v12 = [MEMORY[0x263F85AF0] sharedPreferences];
  if ([v12 isCompactVoiceTriggerAvailableForLanguageCode:v4]) {
    unsigned int v13 = AFDeviceSupportsANE();
  }
  else {
    unsigned int v13 = 0;
  }

  char v14 = (void *)CFPreferencesCopyAppValue(@"UserPreferredVoiceTriggerPhraseType", @"com.apple.voicetrigger");
  if (v14) {
    int v15 = v9;
  }
  else {
    int v15 = 1;
  }
  if ((v13 & 1) != 0 || v15)
  {
    int v16 = +[VTUIStyle sharedStyle];
    int v17 = [v16 isBuddyOrFollowUp];

    if (v17)
    {
      __int16 v18 = [MEMORY[0x263F85AF0] sharedPreferences];
      id v19 = (id)[v18 setUserPreferredVoiceTriggerPhraseType:v13 sender:self deviceType:0 endpointId:0];

      uint64_t v20 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v21 = @"Hey Siri";
        if (v13) {
          BOOL v21 = @"Siri + Hey Siri";
        }
        int v22 = 136315394;
        v23 = "-[VTUIEnrollTrainingViewController _setInitialTriggerPhraseIfNotSet]";
        __int16 v24 = 2112;
        double v25 = v21;
        _os_log_impl(&dword_238878000, v20, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger set to %@", (uint8_t *)&v22, 0x16u);
      }
      [(VTUIEnrollTrainingViewController *)self _setInitialTriggerPhraseOnHome];
    }
  }
}

- (void)_setInitialTriggerPhraseOnHome
{
  objc_initWeak(&location, self);
  settingsQueue = self->_settingsQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __66__VTUIEnrollTrainingViewController__setInitialTriggerPhraseOnHome__block_invoke;
  v4[3] = &unk_264D4C258;
  objc_copyWeak(&v5, &location);
  dispatch_async(settingsQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __66__VTUIEnrollTrainingViewController__setInitialTriggerPhraseOnHome__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[144] setAllowJustSiriHomeKitSetting:1 withCompletion:&__block_literal_global];
    id WeakRetained = v2;
  }
}

void __66__VTUIEnrollTrainingViewController__setInitialTriggerPhraseOnHome__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v2 = a2;
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[VTUIEnrollTrainingViewController _setInitialTriggerPhraseOnHome]_block_invoke_2";
    __int16 v6 = 2112;
    id v7 = v2;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s VoiceTrigger on HomeKit set to Siri + Hey Siri with error: %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)_setPHSEnrollmentPrefEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3)
  {
    id v5 = [MEMORY[0x263F78BB8] sharedInstance];
    __int16 v6 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v7 = (id)[v5 markSATEnrollmentSuccessForVoiceProfile:v6];
  }
  if (self->_enrollmentMode != 2)
  {
    id v8 = [MEMORY[0x263F85AF0] sharedPreferences];
    [v8 setVoiceTriggerEnabled:v3];
  }
}

- (void)_showEnrollmentSuccessView
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v23 = "-[VTUIEnrollTrainingViewController _showEnrollmentSuccessView]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Enrollment completed", buf, 0xCu);
  }
  int v4 = [(VTUIEnrollTrainingViewController *)self view];
  id v5 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v5 setLeftBarButtonItem:0];

  if ([(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
  {
    __int16 v6 = self->_introViewController;
    successView = self->_successView;
    self->_successView = v6;
  }
  else
  {
    [(VTUIEnrollmentSuccessViewing *)self->_successView prepareReInit];
    id v8 = [VTUIEnrollmentSuccessView alloc];
    [v4 bounds];
    int v9 = -[VTUIEnrollmentSuccessView initWithFrame:](v8, "initWithFrame:");
    [(VTUIEnrollmentSuccessView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
    [v4 addSubview:v9];
    [(VTUIEnrollmentSuccessView *)v9 addFinishButtonTarget:self selector:sel__finishButtonTapped];
    uint64_t v10 = (void *)MEMORY[0x263F08938];
    int v11 = _NSDictionaryOfVariableBindings(&cfstr_Successview.isa, v9, 0);
    __int16 v12 = [v10 constraintsWithVisualFormat:@"H:|[successView]|" options:0 metrics:0 views:v11];
    [v4 addConstraints:v12];

    unsigned int v13 = (void *)MEMORY[0x263F08938];
    char v14 = _NSDictionaryOfVariableBindings(&cfstr_Successview.isa, v9, 0);
    int v15 = [v13 constraintsWithVisualFormat:@"V:|[successView]|" options:0 metrics:0 views:v14];
    [v4 addConstraints:v15];

    successView = self->_successView;
    self->_successView = (VTUIEnrollmentSuccessViewing *)v9;
  }

  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideTrainingView:1];
  [(VTUIEnrollmentSuccessViewing *)self->_successView fadeIn];
  if (self->_cachedColorForNavigationUI)
  {
    int v16 = [(VTUIEnrollTrainingViewController *)self navigationController];
    int v17 = [v16 navigationBar];
    [v17 setTintColor:self->_cachedColorForNavigationUI];
  }
  [(VTUIEnrollTrainingViewController *)self setDidShowVoiceTriggerPrompt:1];
  __int16 v18 = [MEMORY[0x263F285A0] sharedPreferences];
  [v18 setCompactVoiceTriggerDisclosurePresented:1];

  if ([(VTUIEnrollTrainingViewController *)self _shouldSpeakAudioHint])
  {
    objc_initWeak((id *)buf, self);
    audioHintPlayer = self->_audioHintPlayer;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __62__VTUIEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke;
    v20[3] = &unk_264D4C390;
    objc_copyWeak(&v21, (id *)buf);
    [(VTUIAudioHintPlayer *)audioHintPlayer speakConfirmationDialog:v20];
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  [(VTUIEnrollTrainingViewController *)self _cleanupMyriad];
}

void __62__VTUIEnrollTrainingViewController__showEnrollmentSuccessView__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _cleanupTrainingManagerWithCompletion:0];
    id WeakRetained = v2;
  }
}

- (void)_finishButtonTapped
{
  BOOL v3 = +[VTUIStyle sharedStyle];
  int v4 = [v3 isBuddyOrFollowUp];

  if (v4)
  {
    [(VTUIEnrollTrainingViewController *)self finish:0];
  }
  else
  {
    [(VTUIEnrollTrainingViewController *)self _finishSiriSetup];
  }
}

- (void)_startEnrollment
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    spokenLanguageCode = self->_spokenLanguageCode;
    int v12 = 136315394;
    unsigned int v13 = "-[VTUIEnrollTrainingViewController _startEnrollment]";
    __int16 v14 = 2112;
    int v15 = spokenLanguageCode;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Starting Enrollment for language code: %@", (uint8_t *)&v12, 0x16u);
  }
  if (![(VTUIEnrollTrainingViewController *)self _isLocaleSupported:self->_spokenLanguageCode]) {
    [(VTUIEnrollTrainingViewController *)self _showUnsupportedLocaleAlert];
  }
  if (self->_siriDataSharingOptInView) {
    [(VTUIEnrollTrainingViewController *)self _tearDownDataSharingViews];
  }
  int64_t enrollmentMode = self->_enrollmentMode;
  if (self->_languageOptionsView
    || (!self->_aboutTappedSender ? (BOOL v6 = (enrollmentMode & 0xFFFFFFFFFFFFFFFBLL) == 2) : (BOOL v6 = 1), v6))
  {
    if (enrollmentMode != 7)
    {
LABEL_18:
      introViewController = self->_introViewController;
      if (introViewController)
      {
        uint64_t v10 = [(VTUIEnrollmentSetupIntroViewControlling *)introViewController view];
        [v10 removeFromSuperview];

        int v11 = self->_introViewController;
        self->_introViewController = 0;
      }
      return;
    }
  }
  else if (enrollmentMode != 7)
  {
    if (!self->_voiceSelectionViewController)
    {
      [(VTUIEnrollTrainingViewController *)self _showSiriIntroView];
      return;
    }
    goto LABEL_18;
  }
  id v7 = [(VTUIEnrollTrainingViewController *)self childViewControllers];
  uint64_t v8 = [v7 count];

  if (!v8) {
    [(VTUIEnrollTrainingViewController *)self _showGMIntroView];
  }
}

- (void)_resetEnrollment
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  BOOL v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315138;
    uint64_t v8 = "-[VTUIEnrollTrainingViewController _resetEnrollment]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Resetting State to kVTUITrainingStateNotStarted", (uint8_t *)&v7, 0xCu);
  }
  self->_int64_t currentTrainingState = -1;
  [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
  [(VTUIEnrollTrainingViewController *)self _hideInstruction];
  int v4 = [MEMORY[0x263F78BB8] sharedInstance];
  id v5 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
  id v6 = (id)[v4 deleteUserVoiceProfile:v5];

  self->_badMicRetryCount = 0;
  [(VTUIEnrollTrainingViewController *)self _cleanupMyriad];
}

- (void)_resumeTraining:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    int64_t currentTrainingState = self->_currentTrainingState;
    int v7 = 136315394;
    uint64_t v8 = "-[VTUIEnrollTrainingViewController _resumeTraining:]";
    __int16 v9 = 2048;
    int64_t v10 = currentTrainingState;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_INFO, "%s Resuming training from the previous state: %zd", (uint8_t *)&v7, 0x16u);
  }
  if ([(VTUIEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    [(VTUIEnrollTrainingViewController *)self _createTrainingManagerIfNeeded];
    [(VTUIEnrollTrainingViewController *)self _showInstruction:self->_currentTrainingState isRetry:v3];
  }
}

- (void)_startTraining
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  BOOL v3 = [(VTUIEnrollTrainingViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(VTUIEnrollTrainingViewController *)self delegate];
    [v5 willBeginVoiceTraining];
  }
  if (self->_currentTrainingState < 0)
  {
    uint64_t v8 = [MEMORY[0x263F08C38] UUID];
    trainingAttemptUUID = self->_trainingAttemptUUID;
    self->_trainingAttemptUUID = v8;

    int64_t v10 = (void *)VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = self->_trainingAttemptUUID;
      int v12 = v10;
      unsigned int v13 = [(NSUUID *)v11 UUIDString];
      int64_t currentTrainingState = self->_currentTrainingState;
      int v29 = 136315650;
      double v30 = "-[VTUIEnrollTrainingViewController _startTraining]";
      __int16 v31 = 2112;
      int64_t v32 = (int64_t)v13;
      __int16 v33 = 2048;
      int64_t v34 = currentTrainingState;
      _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s Starting training attempt %@ - Moving from state: %zd to state 0", (uint8_t *)&v29, 0x20u);
    }
    int v15 = [MEMORY[0x263F78BB8] sharedInstance];
    uint64_t v16 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
    id v17 = (id)[v15 deleteUserVoiceProfile:v16];

    __int16 v18 = [MEMORY[0x263F283F8] sharedAnalytics];
    [v18 logEventWithType:3302 context:0];

    id v19 = [MEMORY[0x263F85AF0] sharedPreferences];
    uint64_t v20 = [v19 getUserPreferredVoiceTriggerPhraseTypeForDeviceType:0 endpointId:0 error:0];

    if (v20) {
      uint64_t v21 = 2;
    }
    else {
      uint64_t v21 = 1;
    }
    +[VTUISELFLogger logSiriSetupPHSEnrollmentUIStarted:self->_trainingAttemptUUID enrollmentMode:self->_enrollmentMode locale:self->_spokenLanguageCode voiceTriggerType:v21];
    [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
    self->_int64_t currentTrainingState = 0;
    [(VTUITrainingViewMediator *)self->_trainingViewMediator hideContinuationAndPreludeLabel:0];
    [(VTUIEnrollTrainingViewController *)self _showInstruction:self->_currentTrainingState isRetry:0];
    if (!self->_cachedColorForNavigationUI
      && [(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
    {
      int v22 = [(VTUIEnrollTrainingViewController *)self navigationController];
      v23 = [v22 navigationBar];
      uint64_t v24 = [v23 tintColor];
      cachedColorForNavigationUI = self->_cachedColorForNavigationUI;
      self->_cachedColorForNavigationUI = v24;

      uint64_t v26 = [(VTUIEnrollTrainingViewController *)self navigationController];
      uint64_t v27 = [v26 navigationBar];
      CGRect v28 = [MEMORY[0x263F825C8] whiteColor];
      [v27 setTintColor:v28];
    }
  }
  else
  {
    id v6 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
    {
      int64_t v7 = self->_currentTrainingState;
      int v29 = 136315394;
      double v30 = "-[VTUIEnrollTrainingViewController _startTraining]";
      __int16 v31 = 2048;
      int64_t v32 = v7;
      _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_INFO, "%s Training has already stated at state %zd - resuming.", (uint8_t *)&v29, 0x16u);
    }
    [(VTUIEnrollTrainingViewController *)self _resumeTraining:0];
  }
}

- (void)_advanceState
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t currentTrainingState = self->_currentTrainingState;
  if (currentTrainingState >= [(NSArray *)self->_trainingPageInstructions count] - 1)
  {
    int64_t v6 = self->_currentTrainingState;
    if (v6 != -1 && v6 != 5)
    {
      self->_unint64_t currentTrainingState = 5;
      [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingCompleted:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingCompleted] + 1];
      uint64_t v8 = [MEMORY[0x263F67FF8] sharedInstance];
      [v8 didCompleteFlow:*MEMORY[0x263F67FA0]];

      __int16 v9 = [(VTUIEnrollTrainingViewController *)self navigationItem];
      [v9 setTitle:0];

      [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:1];
      if (self->_enrollmentMode == 2)
      {
        [(VTUIEnrollTrainingViewController *)self finish:0];
      }
      else
      {
        objc_initWeak((id *)buf, self);
        trainingViewMediator = self->_trainingViewMediator;
        v16[0] = MEMORY[0x263EF8330];
        v16[1] = 3221225472;
        v16[2] = __49__VTUIEnrollTrainingViewController__advanceState__block_invoke;
        v16[3] = &unk_264D4C258;
        objc_copyWeak(&v17, (id *)buf);
        [(VTUITrainingViewMediator *)trainingViewMediator slideInText:0 afterDelay:v16 completion:0.0];
        objc_destroyWeak(&v17);
        objc_destroyWeak((id *)buf);
      }
      uint64_t v11 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        id v19 = "-[VTUIEnrollTrainingViewController _advanceState]";
        _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Completed Last stage in Training", buf, 0xCu);
      }
      int v12 = [MEMORY[0x263F283F8] sharedAnalytics];
      unsigned int v13 = (void *)[v12 newTurnBasedInstrumentationContext];

      id v14 = objc_alloc_init(MEMORY[0x263F6ED78]);
      [v14 setInvocationSource:44];
      [v13 emitInstrumentation:v14];
      int v15 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v15 logEventWithType:3303 context:0];

      +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:self->_trainingAttemptUUID enrollmentMode:self->_enrollmentMode locale:self->_spokenLanguageCode enrollmentSessionOutcome:1 pageNumber:LODWORD(self->_currentTrainingState)];
    }
  }
  else
  {
    self->_hasRetriedTraining = 0;
    ++self->_currentTrainingState;
    -[VTUIEnrollTrainingViewController _showInstruction:isRetry:](self, "_showInstruction:isRetry:");
    char v4 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      int64_t v5 = self->_currentTrainingState;
      *(_DWORD *)buf = 136315394;
      id v19 = "-[VTUIEnrollTrainingViewController _advanceState]";
      __int16 v20 = 2048;
      int64_t v21 = v5;
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s Advance to Next stage in Training - Current state : %zd", buf, 0x16u);
    }
  }
}

void __49__VTUIEnrollTrainingViewController__advanceState__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _showEnrollmentSuccessView];
}

- (void)_showInstruction:(int64_t)a3 isRetry:(BOOL)a4
{
  BOOL v4 = a4;
  [(VTUIEnrollTrainingViewController *)self _updatePageNumberForInstruction:a3];
  int64_t currentTrainingState = self->_currentTrainingState;
  [(VTUIEnrollTrainingViewController *)self _showTrainingInstruction:currentTrainingState afterDelay:v4 isRetry:1 animate:0.0];
}

- (id)_retryStringForStatus:(int64_t)a3
{
  int64_t v5 = +[VTUIStringsHelper sharedStringsHelper];
  int64_t v6 = [v5 uiLocalizedStringForKey:@"TRY_AGAIN_MESSAGE"];

  if (a3 == 2)
  {
    if ([(VTUIEnrollTrainingViewController *)self cannotHearRetryCount] != 1)
    {
      if (![(VTUIEnrollTrainingViewController *)self cannotHearRetryCount]) {
        goto LABEL_11;
      }
      goto LABEL_9;
    }
LABEL_7:
    int64_t v7 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v8 = v7;
    __int16 v9 = @"TRY_AGAIN_CANNOT_HEAR_MESSAGE";
LABEL_10:
    uint64_t v10 = [v7 uiLocalizedStringForKey:v9];

    int64_t v6 = (void *)v10;
    goto LABEL_11;
  }
  if (a3 != 9) {
    goto LABEL_11;
  }
  if ([(VTUIEnrollTrainingViewController *)self digitalZerosRetryCount] == 1) {
    goto LABEL_7;
  }
  if ([(VTUIEnrollTrainingViewController *)self digitalZerosRetryCount])
  {
LABEL_9:
    int64_t v7 = +[VTUIStringsHelper sharedStringsHelper];
    uint64_t v8 = v7;
    __int16 v9 = @"TRY_AGAIN_STILL_CANNOT_HEAR_MESSAGE";
    goto LABEL_10;
  }
LABEL_11:
  return v6;
}

- (void)_retryInstruction:(BOOL)a3 withStatusMessage:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  int64_t v7 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v15 = "-[VTUIEnrollTrainingViewController _retryInstruction:withStatusMessage:]";
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideContinuationAndPreludeLabel:1];
  objc_initWeak((id *)buf, self);
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke;
  uint64_t v11 = &unk_264D4C3B8;
  objc_copyWeak(&v12, (id *)buf);
  BOOL v13 = a3;
  [(VTUIEnrollTrainingViewController *)self _showStatusMessage:v6 afterDelay:&v8 completion:0.2];
  [(VTUIEnrollTrainingViewController *)self _hideInstruction];
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke(uint64_t a1)
{
  v11[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2;
    v9[3] = &unk_264D4C280;
    v9[4] = WeakRetained;
    [WeakRetained _showStatusMessage:0 afterDelay:v9 completion:2.0];
    if (([v3 currentTrainingState] & 0x8000000000000000) == 0
      && [v3 currentTrainingState] <= 4)
    {
      objc_msgSend(v3, "_showTrainingInstruction:afterDelay:isRetry:animate:", objc_msgSend(v3, "currentTrainingState"), *(unsigned char *)(a1 + 40) == 0, 1, 2.2);
      BOOL v4 = NSString;
      int64_t v5 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "currentTrainingState"));
      id v6 = [v4 stringWithFormat:@"%@", v5];

      int64_t v7 = [MEMORY[0x263F283F8] sharedAnalytics];
      uint64_t v10 = @"currentTrainingState";
      v11[0] = v6;
      uint64_t v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:&v10 count:1];
      [v7 logEventWithType:3311 context:v8];
    }
  }
}

uint64_t __72__VTUIEnrollTrainingViewController__retryInstruction_withStatusMessage___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result)
  {
    uint64_t result = [(id)result currentTrainingState];
    if ((result & 0x8000000000000000) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) currentTrainingState];
      if (result <= 4)
      {
        BOOL v3 = *(void **)(a1 + 32);
        uint64_t v4 = [v3 currentTrainingState];
        return [v3 _updatePageNumberForInstruction:v4];
      }
    }
  }
  return result;
}

- (void)_updateTrainingLabelsForInstruction:(int64_t)a3
{
  int64_t v5 = +[VTUIStyle sharedStyle];
  id v15 = v5;
  if (a3)
  {
    NSUInteger v6 = [(NSArray *)self->_trainingPageInstructions count] - 1;
    trainingViewMediator = self->_trainingViewMediator;
    if (v6 == a3)
    {
      uint64_t v8 = [v15 VTUIDeviceSpecificString:@"TEXT_LABEL_SAY_LAST"];
      [(VTUITrainingViewMediator *)trainingViewMediator setInstructionPreludeLabel:v8];

      uint64_t v9 = self->_trainingViewMediator;
      uint64_t v10 = @"TEXT_LABEL_TO_LAST";
    }
    else
    {
      BOOL v13 = [v15 VTUIDeviceSpecificString:@"TEXT_LABEL_SAY_MIDDLE"];
      [(VTUITrainingViewMediator *)trainingViewMediator setInstructionPreludeLabel:v13];

      uint64_t v9 = self->_trainingViewMediator;
      uint64_t v10 = @"TEXT_LABEL_TO_MIDDLE";
    }
  }
  else
  {
    uint64_t v11 = self->_trainingViewMediator;
    id v12 = [v5 VTUIDeviceSpecificString:@"TEXT_LABEL_SAY_FIRST"];
    [(VTUITrainingViewMediator *)v11 setInstructionPreludeLabel:v12];

    uint64_t v9 = self->_trainingViewMediator;
    uint64_t v10 = @"TEXT_LABEL_TO_FIRST";
  }
  id v14 = [v15 VTUIDeviceSpecificString:v10];
  [(VTUITrainingViewMediator *)v9 setInstructionContinuationLabel:v14];
}

- (void)_showTrainingInstruction:(int64_t)a3 afterDelay:(double)a4 isRetry:(BOOL)a5 animate:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v50 = *MEMORY[0x263EF8340];
  uint64_t v11 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    *(void *)&uint8_t buf[4] = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]";
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = a3;
    *(_WORD *)&buf[22] = 1024;
    BOOL v47 = v7;
    __int16 v48 = 1024;
    BOOL v49 = v6;
    _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Instruction Number %ld, isRetry %d, animate %d", buf, 0x22u);
  }
  unint64_t v12 = [(NSArray *)self->_trainingPageInstructions count];
  if ((a3 & 0x8000000000000000) == 0 && v12 > a3)
  {
    BOOL v13 = [(NSArray *)self->_trainingPageInstructions objectAtIndexedSubscript:a3];
    CGRect v28 = [v13 objectForKeyedSubscript:@"Instruction"];
    id v14 = [v13 objectForKeyedSubscript:@"RetryOnFail"];
    char v15 = [v14 BOOLValue];

    [(VTUIEnrollTrainingViewController *)self _updateTrainingLabelsForInstruction:a3];
    [(VTUITrainingViewMediator *)self->_trainingViewMediator animateToOff];
    [(VTUIEnrollTrainingViewController *)self _createTrainingManagerIfNeeded];
    if ((unint64_t)a3 <= 4)
    {
      uint64_t v16 = [MEMORY[0x263F283F8] sharedAnalytics];
      v44 = @"instruction";
      __int16 v45 = v28;
      id v17 = [NSDictionary dictionaryWithObjects:&v45 forKeys:&v44 count:1];
      [v16 logEventWithType:a3 + 3305 context:v17];
    }
    __int16 v18 = [(VTUIAudioHintPlayer *)self->_audioHintPlayer synth];
    [v18 stopSpeaking];

    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v47) = 0;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke;
    aBlock[3] = &unk_264D4C3E0;
    objc_copyWeak(v41, &location);
    BOOL v42 = v7;
    v41[1] = (id)a3;
    id v19 = _Block_copy(aBlock);
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    void v36[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2;
    v36[3] = &unk_264D4C430;
    objc_copyWeak(v37, &location);
    v37[1] = (id)a3;
    char v38 = v15;
    BOOL v39 = v7;
    v36[4] = self;
    v36[5] = buf;
    __int16 v20 = _Block_copy(v36);
    v33[0] = MEMORY[0x263EF8330];
    v33[1] = 3221225472;
    void v33[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_279;
    v33[3] = &unk_264D4C458;
    int64_t v21 = v19;
    id v34 = v21;
    id v22 = v20;
    id v35 = v22;
    v23 = (void (**)(void))_Block_copy(v33);
    if (self->_shouldTurnOnMyriad)
    {
      int v24 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
      uint64_t v26 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
      if (v24) {
        uint64_t v26 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
      }
      LODWORD(v25) = 1110704128;
      [*(id *)((char *)&self->super.super.super.isa + *v26) startAdvertisingForPHSSetupAfterDelay:0.0 maxInterval:v25];
    }
    if ([(VTUIEnrollTrainingViewController *)self _shouldSpeakAudioHint])
    {
      if (v6) {
        [(VTUITrainingViewMediator *)self->_trainingViewMediator slideInText:v28 afterDelay:v21 completion:a4];
      }
      else {
        v21[2](v21);
      }
      uint64_t v27 = [(VTUIEnrollTrainingViewController *)self trainingManager];
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      void v29[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_280;
      v29[3] = &unk_264D4C4A8;
      objc_copyWeak(v32, &location);
      v32[1] = (id)a3;
      __int16 v31 = buf;
      id v30 = v22;
      [v27 prepareWithCompletion:v29];

      objc_destroyWeak(v32);
    }
    else if (v6)
    {
      [(VTUITrainingViewMediator *)self->_trainingViewMediator slideInText:v28 afterDelay:v23 completion:a4];
    }
    else
    {
      v23[2](v23);
    }

    objc_destroyWeak(v37);
    objc_destroyWeak(v41);
    objc_destroyWeak(&location);
    _Block_object_dispose(buf, 8);
  }
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    BOOL v3 = WeakRetained;
    if (!*(unsigned char *)(a1 + 48)) {
      [WeakRetained _updatePageNumberForInstruction:*(void *)(a1 + 40)];
    }
    [v3[159] hidePreludeLabel:0];
    [v3[159] hideContinuationLabel:(uint64_t)v3[141] > 0];
    id WeakRetained = v3;
  }
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v2 = (id *)(a1 + 48);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained[159] animateToListeningState];
    int64_t v5 = [v4 trainingManager];
    [v5 startRMS];

    if (*((unsigned char *)v4 + 1260))
    {
      int v6 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
      uint64_t v8 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
      if (v6) {
        uint64_t v8 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
      }
      LODWORD(v7) = 20.0;
      [*(id *)((char *)v4 + *v8) startAdvertisingForPHSSetupAfterDelay:0.0 maxInterval:v7];
    }
    uint64_t v9 = [*(id *)(a1 + 32) trainingAttemptUUID];
    uint64_t v10 = [v9 UUIDString];

    objc_storeStrong(v4 + 130, v10);
    uint64_t v11 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v12 = *(void *)(a1 + 56) + 1;
      *(_DWORD *)buf = 136315650;
      CGRect v28 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_2";
      __int16 v29 = 2112;
      id v30 = v10;
      __int16 v31 = 2048;
      uint64_t v32 = v12;
      _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Starting training attempt %@ for instruction %ld", buf, 0x20u);
    }
    int v13 = MGGetBoolAnswer();
    id v14 = v4[131];
    uint64_t v15 = *(void *)(a1 + 56);
    int v16 = [*(id *)(a1 + 32) _isGreyMatterAvailable];
    id v17 = [*(id *)(a1 + 32) trainingAttemptUUID];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_277;
    v21[3] = &unk_264D4C408;
    objc_copyWeak(v24, v2);
    uint64_t v18 = v16 & v13 ^ 1u;
    char v25 = *(unsigned char *)(a1 + 64);
    id v19 = v10;
    v24[1] = *(id *)(a1 + 56);
    char v26 = *(unsigned char *)(a1 + 65);
    uint64_t v20 = *(void *)(a1 + 40);
    id v22 = v19;
    uint64_t v23 = v20;
    v4[129] = (id)[v14 trainUtterance:v15 + 1 shouldUseASR:v18 mhUUID:v17 completionWithResult:v21];

    objc_destroyWeak(v24);
  }
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_277(uint64_t a1, void *a2, unsigned int a3)
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    double v7 = (NSObject **)MEMORY[0x263F28398];
    uint64_t v8 = (void *)*MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = v8;
      uint64_t v10 = [v5 sessionId];
      uint64_t v11 = WeakRetained[129];
      int v12 = [v5 sessionStatus];
      int v13 = *(unsigned __int8 *)(a1 + 64);
      uint64_t v14 = WeakRetained[130];
      uint64_t v15 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 136316930;
      BOOL v39 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
      __int16 v40 = 2048;
      uint64_t v41 = v10;
      __int16 v42 = 2048;
      uint64_t v43 = v11;
      __int16 v44 = 1024;
      int v45 = v12;
      __int16 v46 = 1024;
      unsigned int v47 = a3;
      __int16 v48 = 1024;
      int v49 = v13;
      __int16 v50 = 2112;
      uint64_t v51 = v15;
      __int16 v52 = 2112;
      uint64_t v53 = v14;
      _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s Callback Session Id: %ld, Current Session Id: %ld, status: %d, success: %d, canRetry: %d, attempt Identifier: %@, latest attempt identifier: %@", buf, 0x46u);
    }
    if ([*(id *)(a1 + 32) isEqualToString:WeakRetained[130]])
    {
      unsigned int v37 = a3;
      int v16 = [WeakRetained myriadCoordinator];
      LODWORD(v17) = 0.5;
      [v16 endAdvertisingAfterDelay:v17];

      uint64_t v18 = [WeakRetained trainingManager];
      [v18 stopRMS];

      id v19 = [WeakRetained trainingViewMediator];
      [v19 animateToOff];

      [WeakRetained _resetIdleTimer];
      if ((objc_msgSend(WeakRetained, "interpretSessionManagerResult:forInstruction:", v5, objc_msgSend(WeakRetained, "currentTrainingState")) & 0xFFFFFFFFFFFFFFFDLL) == 1)uint64_t v20 = 1; {
      else
      }
        uint64_t v20 = 3;
      int64_t v21 = [WeakRetained trainingAttemptUUID];
      uint64_t v22 = WeakRetained[134];
      uint64_t v23 = [WeakRetained spokenLanguageCode];
      uint64_t v24 = *(unsigned int *)(a1 + 56);
      uint64_t v25 = *(unsigned __int8 *)(a1 + 65);
      char v26 = [WeakRetained _shouldSpeakAudioHint];
      BYTE1(v36) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      LOBYTE(v36) = v26;
      +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", v21, v22, v23, v20, v24, v25, v36);

      if (*(unsigned char *)(a1 + 64))
      {
        [WeakRetained setHasRetriedTraining:*(unsigned __int8 *)(a1 + 65)];
        [WeakRetained _handleTrainingResultForRetryablePhraseWithResult:v5 shouldShowCheckMark:v37];
      }
      else
      {
        [WeakRetained _handleTrainingResultForNonRetryablePhraseWithResult:v5];
      }
    }
    else
    {
      uint64_t v27 = *v7;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v28 = WeakRetained[130];
        uint64_t v29 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 136315650;
        BOOL v39 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
        __int16 v40 = 2112;
        uint64_t v41 = v29;
        __int16 v42 = 2112;
        uint64_t v43 = v28;
        _os_log_impl(&dword_238878000, v27, OS_LOG_TYPE_DEFAULT, "%s Callback for training attempt %@ does not match most recent attempt %@. Ignoring", buf, 0x20u);
      }
      id v30 = [WeakRetained trainingAttemptUUID];
      uint64_t v31 = WeakRetained[134];
      uint64_t v32 = [WeakRetained spokenLanguageCode];
      uint64_t v33 = *(unsigned int *)(a1 + 56);
      uint64_t v34 = *(unsigned __int8 *)(a1 + 65);
      char v35 = [WeakRetained _shouldSpeakAudioHint];
      BYTE1(v36) = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
      LOBYTE(v36) = v35;
      +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", v30, v31, v32, 0, v33, v34, v36);
    }
  }
}

uint64_t __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_279(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_2_280(uint64_t a1, char a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  int v6 = WeakRetained;
  if (a2)
  {
    if (WeakRetained)
    {
      double v7 = (void *)*((void *)WeakRetained + 170);
      uint64_t v8 = *(void *)(a1 + 56);
      v12[0] = MEMORY[0x263EF8330];
      v12[1] = 3221225472;
      v12[2] = __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_281;
      v12[3] = &unk_264D4C480;
      objc_copyWeak(&v14, v4);
      long long v11 = *(_OWORD *)(a1 + 32);
      id v9 = (id)v11;
      long long v13 = v11;
      [v7 speakAudioHint:v8 completion:v12];

      objc_destroyWeak(&v14);
    }
  }
  else
  {
    uint64_t v10 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v16 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke_2";
      _os_log_impl(&dword_238878000, v10, OS_LOG_TYPE_DEFAULT, "%s Error preparing audio session", buf, 0xCu);
    }
  }
}

void __88__VTUIEnrollTrainingViewController__showTrainingInstruction_afterDelay_isRetry_animate___block_invoke_281(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    int v6 = *((unsigned __int8 *)WeakRetained + 987);
    double v7 = [WeakRetained[170] synth];
    int v8 = [v7 isSpeaking];

    id v9 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      int v11 = 136315906;
      int v12 = "-[VTUIEnrollTrainingViewController _showTrainingInstruction:afterDelay:isRetry:animate:]_block_invoke";
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
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (os_log_t *)MEMORY[0x263F28398];
  int v6 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    double v7 = v6;
    int v8 = [v4 sessionStatus];
    int v9 = [v4 audioStatus];
    unint64_t badMicRetryCount = self->_badMicRetryCount;
    *(_DWORD *)buf = 136315906;
    unsigned int v37 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    __int16 v38 = 1024;
    *(_DWORD *)BOOL v39 = v8;
    *(_WORD *)&v39[4] = 1024;
    *(_DWORD *)&v39[6] = v9;
    __int16 v40 = 2048;
    unint64_t v41 = badMicRetryCount;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, badMicRetryCount: %lu", buf, 0x22u);
  }
  int64_t v11 = [(VTUIEnrollTrainingViewController *)self interpretSessionManagerResult:v4 forInstruction:self->_currentTrainingState];
  int v12 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    unsigned int v37 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForNonRetryablePhraseWithResult:]";
    __int16 v38 = 2048;
    *(void *)BOOL v39 = v11;
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  switch(v11)
  {
    case 1:
      self->_int64_t consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      [(VTUIEnrollTrainingViewController *)self _signalSingleEnrollmentSuccess];
      break;
    case 4:
      [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
      __int16 v15 = [MEMORY[0x263F78BB8] sharedInstance];
      BOOL v16 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
      id v17 = (id)[v15 deleteUserVoiceProfile:v16];

      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      void v35[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke;
      v35[3] = &unk_264D4C280;
      v35[4] = self;
      id v18 = v35;
      uint64_t v19 = self;
      uint64_t v20 = 4;
      goto LABEL_13;
    case 5:
      ++self->_badMicRetryCount;
      if ([(VTUIEnrollTrainingViewController *)self badMicRetryCount] >= 2)
      {
        [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        int64_t v21 = [MEMORY[0x263F78BB8] sharedInstance];
        uint64_t v22 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v23 = (id)[v21 deleteUserVoiceProfile:v22];

        v32[0] = MEMORY[0x263EF8330];
        v32[1] = 3221225472;
        id v32[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4;
        v32[3] = &unk_264D4C280;
        v32[4] = self;
        id v18 = v32;
        uint64_t v19 = self;
        uint64_t v20 = 5;
        goto LABEL_13;
      }
      v31[0] = MEMORY[0x263EF8330];
      v31[1] = 3221225472;
      void v31[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5;
      v31[3] = &unk_264D4C280;
      v31[4] = self;
      [(VTUIEnrollTrainingViewController *)self _showBadMicAlertCompletion:v31];
      break;
    case 6:
      unint64_t v24 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v24;
      if (v24 < 6)
      {
        dispatch_time_t v30 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3;
        block[3] = &unk_264D4C280;
        void block[4] = self;
        dispatch_after(v30, MEMORY[0x263EF83A0], block);
      }
      else
      {
        [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        uint64_t v25 = [MEMORY[0x263F78BB8] sharedInstance];
        char v26 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v27 = (id)[v25 deleteUserVoiceProfile:v26];

        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        void v34[2] = __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2;
        v34[3] = &unk_264D4C280;
        v34[4] = self;
        id v18 = v34;
        uint64_t v19 = self;
        uint64_t v20 = 6;
LABEL_13:
        [(VTUIEnrollTrainingViewController *)v19 _cleanupTrainingManagerWithCompletion:v18 status:v20];
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
      __int16 v13 = self;
      uint64_t v14 = 8;
      goto LABEL_19;
    case 9:
      ++self->_digitalZerosRetryCount;
      __int16 v13 = self;
      uint64_t v14 = 9;
      goto LABEL_19;
    case 10:
      ++self->_cannotHearRetryCount;
      __int16 v13 = self;
      uint64_t v14 = 10;
      goto LABEL_19;
    default:
      __int16 v13 = self;
      uint64_t v14 = 0;
LABEL_19:
      uint64_t v29 = [(VTUIEnrollTrainingViewController *)v13 _retryStringForStatus:v14];
      [(VTUIEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v29];

      break;
  }
}

void __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 skipSetup];
}

void __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 skipSetup];
}

uint64_t __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeTraining:1];
}

void __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 skipSetup];
}

uint64_t __89__VTUIEnrollTrainingViewController__handleTrainingResultForNonRetryablePhraseWithResult___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryAfterBadMicAlert];
}

- (void)_signalSingleEnrollmentSuccess
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__VTUIEnrollTrainingViewController__signalSingleEnrollmentSuccess__block_invoke;
  v3[3] = &unk_264D4C258;
  objc_copyWeak(&v4, &location);
  [(VTUIEnrollTrainingViewController *)self _animateSuccessfulStep:1 completion:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__VTUIEnrollTrainingViewController__signalSingleEnrollmentSuccess__block_invoke(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _advanceState];

  id v3 = objc_loadWeakRetained(v1);
  int v4 = [v3 _isGreyMatterAvailable];

  if (v4)
  {
    id v5 = objc_loadWeakRetained(v1);
    [v5 _playSoundForStageAfterDelay:0.0];
  }
}

- (void)_playSoundForStageAfterDelay:(double)a3
{
  dispatch_time_t v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__VTUIEnrollTrainingViewController__playSoundForStageAfterDelay___block_invoke;
  block[3] = &unk_264D4C280;
  void block[4] = self;
  dispatch_after(v4, MEMORY[0x263EF83A0], block);
}

uint64_t __65__VTUIEnrollTrainingViewController__playSoundForStageAfterDelay___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 1128);
  NSLog(&cfstr_Playsoundforst.isa, (__int16)v2);
  id v3 = *(void **)(*(void *)(a1 + 32) + 1048);
  return [v3 playSoundsEffect:(__int16)v2];
}

- (void)restartFromIntroView
{
  [(VTUIEnrollTrainingViewController *)self _resetEnrollment];
  if (self->_enrollmentMode != 2) {
    [(VTUIEnrollTrainingViewController *)self _showSiriIntroView];
  }
  id v3 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v3 setTitle:0];
}

- (void)_handleTrainingResultForRetryablePhraseWithResult:(id)a3 shouldShowCheckMark:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v46 = *MEMORY[0x263EF8340];
  id v6 = a3;
  double v7 = (os_log_t *)MEMORY[0x263F28398];
  int v8 = (void *)*MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = v8;
    int v10 = [v6 sessionStatus];
    int v11 = [v6 audioStatus];
    unint64_t badMicRetryCount = self->_badMicRetryCount;
    *(_DWORD *)buf = 136316162;
    BOOL v39 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    __int16 v40 = 1024;
    *(_DWORD *)unint64_t v41 = v10;
    *(_WORD *)&v41[4] = 1024;
    *(_DWORD *)&v41[6] = v11;
    __int16 v42 = 1024;
    BOOL v43 = v4;
    __int16 v44 = 2048;
    unint64_t v45 = badMicRetryCount;
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s session status: %d, audio status: %d, shouldShowCheckMark:%d, badMicRetryCount: %lu", buf, 0x28u);
  }
  int64_t v13 = [(VTUIEnrollTrainingViewController *)self interpretSessionManagerResult:v6 forInstruction:self->_currentTrainingState];
  uint64_t v14 = *v7;
  if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    BOOL v39 = "-[VTUIEnrollTrainingViewController _handleTrainingResultForRetryablePhraseWithResult:shouldShowCheckMark:]";
    __int16 v40 = 2048;
    *(void *)unint64_t v41 = v13;
    _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s digestedStatus: %ld", buf, 0x16u);
  }
  switch(v13)
  {
    case 2:
      self->_int64_t consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      [(VTUIAnalytics *)self->_analyticsEvent setAsrError:[(VTUIAnalytics *)self->_analyticsEvent asrError] + 1];
      if (self->_hasRetriedTraining) {
        [(VTUIEnrollTrainingViewController *)self _advanceState];
      }
      else {
        [(VTUIEnrollTrainingViewController *)self _retryInstruction:0 withStatusMessage:0];
      }
      break;
    case 3:
      self->_int64_t consecutiveTimeoutCount = 0;
      self->_shouldTurnOnMyriad = 1;
      [(VTUIEnrollTrainingViewController *)self _signalSingleEnrollmentSuccess];
      break;
    case 4:
      [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
      id v17 = [MEMORY[0x263F78BB8] sharedInstance];
      id v18 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
      id v19 = (id)[v17 deleteUserVoiceProfile:v18];

      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      id v37[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke;
      v37[3] = &unk_264D4C280;
      v37[4] = self;
      uint64_t v20 = v37;
      int64_t v21 = self;
      uint64_t v22 = 4;
      goto LABEL_15;
    case 5:
      ++self->_badMicRetryCount;
      if ([(VTUIEnrollTrainingViewController *)self badMicRetryCount] >= 2)
      {
        [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        id v23 = [MEMORY[0x263F78BB8] sharedInstance];
        unint64_t v24 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v25 = (id)[v23 deleteUserVoiceProfile:v24];

        v34[0] = MEMORY[0x263EF8330];
        v34[1] = 3221225472;
        void v34[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4;
        v34[3] = &unk_264D4C280;
        v34[4] = self;
        uint64_t v20 = v34;
        int64_t v21 = self;
        uint64_t v22 = 5;
        goto LABEL_15;
      }
      v33[0] = MEMORY[0x263EF8330];
      v33[1] = 3221225472;
      void v33[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5;
      v33[3] = &unk_264D4C280;
      void v33[4] = self;
      [(VTUIEnrollTrainingViewController *)self _showBadMicAlertCompletion:v33];
      break;
    case 6:
      unint64_t v26 = self->_AVVCRetryCount + 1;
      self->_AVVCRetryCount = v26;
      if (v26 < 6)
      {
        dispatch_time_t v32 = dispatch_time(0, 1000000000);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3;
        block[3] = &unk_264D4C280;
        void block[4] = self;
        dispatch_after(v32, MEMORY[0x263EF83A0], block);
      }
      else
      {
        [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
        id v27 = [MEMORY[0x263F78BB8] sharedInstance];
        uint64_t v28 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
        id v29 = (id)[v27 deleteUserVoiceProfile:v28];

        v36[0] = MEMORY[0x263EF8330];
        v36[1] = 3221225472;
        void v36[2] = __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2;
        v36[3] = &unk_264D4C280;
        v36[4] = self;
        uint64_t v20 = v36;
        int64_t v21 = self;
        uint64_t v22 = 6;
LABEL_15:
        [(VTUIEnrollTrainingViewController *)v21 _cleanupTrainingManagerWithCompletion:v20 status:v22];
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
      __int16 v15 = self;
      uint64_t v16 = 8;
      goto LABEL_21;
    case 9:
      ++self->_digitalZerosRetryCount;
      __int16 v15 = self;
      uint64_t v16 = 9;
      goto LABEL_21;
    case 10:
      ++self->_cannotHearRetryCount;
      __int16 v15 = self;
      uint64_t v16 = 10;
      goto LABEL_21;
    default:
      [(VTUIAnalytics *)self->_analyticsEvent setAsrError:[(VTUIAnalytics *)self->_analyticsEvent asrError] + 1];
      __int16 v15 = self;
      uint64_t v16 = 0;
LABEL_21:
      uint64_t v31 = [(VTUIEnrollTrainingViewController *)v15 _retryStringForStatus:v16];
      [(VTUIEnrollTrainingViewController *)self _retryInstruction:1 withStatusMessage:v31];

      break;
  }
}

void __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 skipSetup];
}

void __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 skipSetup];
}

uint64_t __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resumeTraining:1];
}

void __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_4(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 skipSetup];
}

uint64_t __106__VTUIEnrollTrainingViewController__handleTrainingResultForRetryablePhraseWithResult_shouldShowCheckMark___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _retryAfterBadMicAlert];
}

- (void)_showBadMicAlertCompletion:(id)a3
{
  id v19 = a3;
  uint64_t v20 = [(VTUIEnrollTrainingViewController *)self interpretAudioSource:[(SSRVTUITrainingManager *)self->_trainingManager audioSource]];
  BOOL v4 = (void *)MEMORY[0x263F82418];
  id v5 = NSString;
  id v6 = +[VTUIStringsHelper sharedStringsHelper];
  double v7 = [v6 uiLocalizedStringForKey:@"ALERT_TITLE_BAD_MIC"];
  int v8 = +[VTUIStringsHelper sharedStringsHelper];
  int v9 = [v8 uiLocalizedStringForKey:v20];
  int v10 = objc_msgSend(v5, "stringWithFormat:", v7, v9);
  int v11 = +[VTUIStringsHelper sharedStringsHelper];
  int v12 = [v11 uiLocalizedStringForKey:@"ALERT_MAIN_BAD_MIC"];
  int64_t v13 = [v4 alertControllerWithTitle:v10 message:v12 preferredStyle:1];

  uint64_t v14 = (void *)MEMORY[0x263F82400];
  __int16 v15 = +[VTUIStringsHelper sharedStringsHelper];
  uint64_t v16 = [v15 uiLocalizedStringForKey:@"ALERT_BUTTON_BAD_MIC"];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __63__VTUIEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke;
  v21[3] = &unk_264D4C348;
  id v22 = v19;
  id v17 = v19;
  id v18 = [v14 actionWithTitle:v16 style:0 handler:v21];

  [v13 addAction:v18];
  [(VTUIEnrollTrainingViewController *)self presentViewController:v13 animated:1 completion:0];
}

uint64_t __63__VTUIEnrollTrainingViewController__showBadMicAlertCompletion___block_invoke(uint64_t a1)
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
  double v7 = [v6 uiLocalizedStringForKey:@"ALERT_TITLE_UNSUPPORTED_LOCALE"];
  int v8 = +[VTUIStringsHelper sharedStringsHelper];
  int v9 = [v8 uiLocalizedStringForKey:@"ALERT_MAIN_UNSUPPORTED_LOCALE"];
  int v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

  int v11 = (void *)MEMORY[0x263F82400];
  int v12 = +[VTUIStringsHelper sharedStringsHelper];
  int64_t v13 = [v12 uiLocalizedStringForKey:@"ALERT_BUTTON_UNSUPPORTED_LOCALE"];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __74__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke;
  v16[3] = &unk_264D4C348;
  id v17 = v4;
  id v14 = v4;
  __int16 v15 = [v11 actionWithTitle:v13 style:0 handler:v16];

  [v10 addAction:v15];
  [(VTUIEnrollTrainingViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __74__VTUIEnrollTrainingViewController__showUnsupportedLocaleAlertCompletion___block_invoke(uint64_t a1)
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
  double v7 = [v6 uiLocalizedStringForKey:@"PAGE_PROGRESS_FORMAT"];
  int v8 = [NSNumber numberWithInteger:a3 + 1];
  int v9 = [v14 stringFromNumber:v8];
  int v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[NSArray count](self->_trainingPageInstructions, "count"));
  int v11 = [v14 stringFromNumber:v10];
  int v12 = objc_msgSend(v5, "stringWithFormat:", v7, v9, v11);

  int64_t v13 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v13 setTitle:v12];
}

- (void)_showStatusMessage:(id)a3 afterDelay:(double)a4 completion:(id)a5
{
}

- (void)_hideInstruction
{
  [(VTUITrainingViewMediator *)self->_trainingViewMediator clearInstructionLabel];
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideContinuationAndPreludeLabel:1];
  id v3 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v3 setTitle:0];
}

- (void)_createTrainingManagerIfNeeded
{
  if (!self->_trainingManager)
  {
    id v3 = [MEMORY[0x263F78BA8] trainingManagerWithLocaleID:self->_spokenLanguageCode withAppDomain:self->_voiceProfileAppDomain];
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
  double v7 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = NSNumber;
    int v9 = v7;
    int v10 = [v8 numberWithInteger:a4];
    int v11 = 136315394;
    int v12 = "-[VTUIEnrollTrainingViewController _cleanupTrainingManagerWithCompletion:status:]";
    __int16 v13 = 2112;
    id v14 = v10;
    _os_log_impl(&dword_238878000, v9, OS_LOG_TYPE_DEFAULT, "%s %@", (uint8_t *)&v11, 0x16u);
  }
  [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v6];
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
    id v4 = v6;
    self->_int64_t currentTrainingState = -1;
  }
  else if (v4)
  {
    double v7 = v4;
    trainingManager = (SSRVTUITrainingManager *)v4[2](v4);
    id v4 = v7;
  }
  MEMORY[0x270F9A758](trainingManager, v4);
}

- (void)_cleanupAllViews
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    int v10 = "-[VTUIEnrollTrainingViewController _cleanupAllViews]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v9, 0xCu);
  }
  id v4 = [(VTUISiriEducationViewController *)self->_educationViewController view];
  [v4 removeFromSuperview];

  educationViewController = self->_educationViewController;
  self->_educationViewController = 0;

  if (self->_siriDataSharingOptInView)
  {
    [(UIViewController *)self->_siriDataSharingViewController viewDidDisappear:0];
    [(VTUIEnrollTrainingViewController *)self _tearDownDataSharingViews];
  }
  [(VTUIEnrollmentLanguageOptionsView *)self->_languageOptionsView removeFromSuperview];
  languageOptionsView = self->_languageOptionsView;
  self->_languageOptionsView = 0;

  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController removeFromParentViewController];
  double v7 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v7 removeFromSuperview];

  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = 0;
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
    return off_264D4C5F8[a3 - 2];
  }
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
    || ([(VTUIEnrollTrainingViewController *)self trainingPageInstructions],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unint64_t v12 = [v11 count],
        v11,
        v12 <= a4))
  {
    char v16 = 0;
  }
  else
  {
    __int16 v13 = [(VTUIEnrollTrainingViewController *)self trainingPageInstructions];
    id v14 = [v13 objectAtIndexedSubscript:a4];

    uint64_t v15 = [v14 objectForKeyedSubscript:@"RetryOnFail"];
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
      return qword_2388E5310[v7];
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

- (void)_showRadarExitButton
{
  id v7 = +[VTUIStyle sharedStyle];
  if ([(VTUIEnrollmentSuccessViewing *)self->_successView isSuccessViewReady])
  {
    id v3 = +[VTUIStringsHelper sharedStringsHelper];
    id v4 = [v3 uiLocalizedStringForKey:@"BUTTON_DONE"];
  }
  else
  {
    id v4 = [v7 VTUIDeviceSpecificString:@"BUTTON_SET_UP_LATER"];
  }
  [(VTUITrainingViewMediator *)self->_trainingViewMediator showRadarExitButton:v4];
  int v5 = [(VTUIEnrollmentSuccessViewing *)self->_successView isSuccessViewReady];
  id v6 = &selRef_finish_;
  if (!v5) {
    id v6 = &selRef_skipTraining_;
  }
  [(VTUITrainingViewMediator *)self->_trainingViewMediator addTargetToRadarExitButton:self action:*v6 forControlEvents:64];
}

- (id)_getSetupModeString
{
  uint64_t v2 = +[VTUIStyle sharedStyle];
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
}

- (void)aboutTapped:(id)a3
{
  id v4 = (UIView *)a3;
  [(VTUIAnalytics *)self->_analyticsEvent setAboutViewShown:[(VTUIAnalytics *)self->_analyticsEvent aboutViewShown] + 1];
  aboutTappedSender = self->_aboutTappedSender;
  self->_aboutTappedSender = v4;

  id v6 = [(VTUIEnrollTrainingViewController *)self delegate];
  [v6 showLearnMore];
}

- (void)siriLanguageSpokenLanguageCodeDidChange:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v5 = self->_spokenLanguageCode;
  id v6 = [a3 spokenLanguageCode];
  spokenLanguageCode = self->_spokenLanguageCode;
  self->_spokenLanguageCode = v6;

  if (v5 != self->_spokenLanguageCode)
  {
    -[VTUIAnalytics setLanguageCode:](self->_analyticsEvent, "setLanguageCode:");
    int v8 = (void *)*MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = self->_spokenLanguageCode;
      int v10 = v8;
      uint64_t v11 = +[VTUIStringsHelper sharedStringsHelper];
      unint64_t v12 = [v11 heySiriTriggerPhrase];
      int v17 = 136315650;
      id v18 = "-[VTUIEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
      __int16 v19 = 2112;
      uint64_t v20 = v9;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_238878000, v10, OS_LOG_TYPE_DEFAULT, "%s VoiceTriggerUI: Spoken Language Code changed: %@. (Trigger: '%@')", (uint8_t *)&v17, 0x20u);
    }
    [(SSRVTUITrainingManager *)self->_trainingManager setLocaleIdentifier:self->_spokenLanguageCode];
    __int16 v13 = +[VTUIStringsHelper sharedStringsHelper];
    [v13 setSiriLanguage:self->_spokenLanguageCode];

    id v14 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = self->_spokenLanguageCode;
      int v17 = 136315394;
      id v18 = "-[VTUIEnrollTrainingViewController siriLanguageSpokenLanguageCodeDidChange:]";
      __int16 v19 = 2112;
      uint64_t v20 = v15;
      _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v17, 0x16u);
    }
    [(VTUIAudioHintPlayer *)self->_audioHintPlayer setLanguage:self->_spokenLanguageCode];
    [(VTUIEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode];
    disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
    self->_disambiguatedLanguageOption = 0;
  }
}

- (void)skipAssistant:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_isEnablementConfigurationLoading)
  {
    int v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[VTUIEnrollTrainingViewController skipAssistant:]";
      _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip Assistant requested while Enablement configuration loading", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __50__VTUIEnrollTrainingViewController_skipAssistant___block_invoke;
    v16[3] = &unk_264D4C4D0;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v4;
    [(VTUIEnrollTrainingViewController *)self _setIntroViewActionOnEnablementConfigurationDidLoad:v16];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
    goto LABEL_17;
  }
  id v6 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v20 = "-[VTUIEnrollTrainingViewController skipAssistant:]";
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Skipping Setup / Assistant", buf, 0xCu);
  }
  id v7 = +[VTUIStyle sharedStyle];
  int v8 = [v7 isBuddyOrFollowUp];

  if (v8)
  {
    uint64_t v9 = +[VTUIStyle sharedStyle];
    if ([v9 enrollmentMode])
    {
      int v10 = +[VTUIStyle sharedStyle];
      BOOL v11 = [v10 enrollmentMode] == 1;

      if (!v11)
      {
        unint64_t v12 = +[VTUIStyle sharedStyle];
        BOOL v13 = [v12 enrollmentMode] == 3;

        if (v13) {
          [(VTUIAnalytics *)self->_analyticsEvent setSkippedFromIntroNonAOP:[(VTUIAnalytics *)self->_analyticsEvent skippedFromIntroNonAOP] + 1];
        }
        goto LABEL_14;
      }
    }
    else
    {
    }
    [(VTUIAnalytics *)self->_analyticsEvent setSkippedFromIntroAOP:[(VTUIAnalytics *)self->_analyticsEvent skippedFromIntroAOP] + 1];
  }
LABEL_14:
  id v14 = +[VTUIStyle sharedStyle];
  BOOL v15 = [v14 enrollmentMode] == 3;

  if (!v15) {
    [(VTUIEnrollTrainingViewController *)self _setPHSEnrollmentPrefEnabled:0];
  }
  [(VTUIEnrollTrainingViewController *)self _proceedAfterVoiceSelectionOrSkip];
LABEL_17:
}

void __50__VTUIEnrollTrainingViewController_skipAssistant___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained skipAssistant:*(void *)(a1 + 32)];

  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIEnrollTrainingViewController skipAssistant:]_block_invoke";
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
    unint64_t v12 = "-[VTUIEnrollTrainingViewController cancelTraining]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_INFO, "%s Cancel Training", buf, 0xCu);
  }
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer cleanup];
  [(VTUIGMEnrollmentViewController *)self->_gmViewController userDidCancel];
  int v4 = [MEMORY[0x263F283F8] sharedAnalytics];
  uint64_t v9 = @"currentTrainingState";
  int v5 = NSString;
  uint64_t v6 = [NSNumber numberWithInteger:self->_currentTrainingState];
  id v7 = [v5 stringWithFormat:@"%@", v6];
  int v10 = v7;
  int v8 = [NSDictionary dictionaryWithObjects:&v10 forKeys:&v9 count:1];
  [v4 logEventWithType:3304 context:v8];

  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingCancelled:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingCancelled] + 1];
  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingCancelledStep:LODWORD(self->_currentTrainingState)];
  +[VTUISELFLogger logSiriSetupPHSEnrollmentUICompleted:self->_trainingAttemptUUID enrollmentMode:self->_enrollmentMode locale:self->_spokenLanguageCode enrollmentSessionOutcome:2 pageNumber:LODWORD(self->_currentTrainingState)];
  [(VTUIEnrollTrainingViewController *)self _cleanupHelper];
}

- (void)skipTraining:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v4 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    id v18 = "-[VTUIEnrollTrainingViewController skipTraining:]";
    _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_INFO, "%s Skipping Training", buf, 0xCu);
  }
  self->_hasSkippedTraining = 1;
  int v5 = [MEMORY[0x263F283F8] sharedAnalytics];
  BOOL v15 = @"currentTrainingState";
  uint64_t v6 = NSString;
  id v7 = [NSNumber numberWithInteger:self->_currentTrainingState];
  int v8 = [v6 stringWithFormat:@"%@", v7];
  char v16 = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
  [v5 logEventWithType:3310 context:v9];

  trainingAttemptUUID = self->_trainingAttemptUUID;
  int64_t enrollmentMode = self->_enrollmentMode;
  spokenLanguageCode = self->_spokenLanguageCode;
  uint64_t currentTrainingState_low = LODWORD(self->_currentTrainingState);
  LOWORD(v14) = [(VTUIEnrollTrainingViewController *)self _shouldSpeakAudioHint];
  +[VTUISELFLogger logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:](VTUISELFLogger, "logSiriSetupPHSEnrollmentTrainingUtteranceAttempted:enrollmentMode:locale:trainingOutcome:pageNumber:isRetry:audioHintNeeded:audioHintSpoken:", trainingAttemptUUID, enrollmentMode, spokenLanguageCode, 2, currentTrainingState_low, 0, v14);
  [(VTUIEnrollTrainingViewController *)self _cleanupHelper];
  [(VTUIEnrollTrainingViewController *)self _proceedAfterTrainingCompletionOrSkip];
}

- (void)prewarm
{
  id v4 = +[VTUIStyle sharedStyle];
  if ([v4 isIpad])
  {
  }
  else
  {
    BOOL v3 = [(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable];

    if (v3 && prewarm_onceToken != -1)
    {
      dispatch_once(&prewarm_onceToken, &__block_literal_global_340);
    }
  }
}

void __43__VTUIEnrollTrainingViewController_prewarm__block_invoke()
{
  v0 = dispatch_get_global_queue(2, 0);
  dispatch_async(v0, &__block_literal_global_342);
}

void __43__VTUIEnrollTrainingViewController_prewarm__block_invoke_2()
{
  v0 = (void *)MEMORY[0x23EC94C20]();
  +[GMDeviceSceneViewController prepareSceneWithCompletionHandler:&__block_literal_global_345];
}

void __43__VTUIEnrollTrainingViewController_prewarm__block_invoke_3(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    uint64_t v2 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
      __43__VTUIEnrollTrainingViewController_prewarm__block_invoke_3_cold_1(v2);
    }
  }
}

- (void)_cleanupHelper
{
  int v3 = [MEMORY[0x263F28510] isSCDAFrameworkEnabled];
  id v4 = &OBJC_IVAR___VTUIEnrollTrainingViewController__myriadCoordinator;
  if (v3) {
    id v4 = &OBJC_IVAR___VTUIEnrollTrainingViewController__scdaCoordinator;
  }
  [*(id *)((char *)&self->super.super.super.isa + *v4) resetStateMachine];
  [(VTUIEnrollTrainingViewController *)self _resetEnrollment];
  [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
  [(VTUIEnrollTrainingViewController *)self setTrainingAttemptUUID:0];
}

- (void)_cleanupMyriad
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    uint64_t v9 = "-[VTUIEnrollTrainingViewController _cleanupMyriad]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #myriad needs to be cleaned up", (uint8_t *)&v8, 0xCu);
  }
  if (![MEMORY[0x263F28510] isSCDAFrameworkEnabled])
  {
    p_myriadCoordinator = &self->_myriadCoordinator;
    myriadCoordinator = self->_myriadCoordinator;
    uint64_t v6 = (id *)0x263F28568;
    if (!myriadCoordinator) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  p_myriadCoordinator = &self->_scdaCoordinator;
  myriadCoordinator = self->_scdaCoordinator;
  uint64_t v6 = (id *)0x263F6CF70;
  if (myriadCoordinator)
  {
LABEL_5:
    [(AFMyriadCoordinator *)myriadCoordinator endAdvertising:0];
    [(AFMyriadCoordinator *)*p_myriadCoordinator stopListening:0];
    [(AFMyriadCoordinator *)*p_myriadCoordinator setupEnabled:0];
    id v7 = *p_myriadCoordinator;
    *p_myriadCoordinator = 0;
  }
LABEL_6:
  [*v6 clearCurrentCoordinator];
}

- (void)_setupMyriadCoordinator
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)&v10[4] = "-[VTUIEnrollTrainingViewController _setupMyriadCoordinator]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #myriad needs to be set up", v10, 0xCu);
  }
  if ([MEMORY[0x263F28510] isSCDAFrameworkEnabled])
  {
    p_scdaCoordinator = (id *)&self->_scdaCoordinator;
    if (self->_scdaCoordinator)
    {
      int v5 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)uint64_t v10 = 136315138;
        *(void *)&v10[4] = "-[VTUIEnrollTrainingViewController _setupMyriadCoordinator]";
LABEL_10:
        _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s #myriad was already set up", v10, 0xCu);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    uint64_t v6 = [MEMORY[0x263F6CF70] currentCoordinator];
    if (!v6)
    {
      id v7 = (objc_class *)MEMORY[0x263F6CF70];
LABEL_16:
      id v8 = (id)[[v7 alloc] initWithDelegate:self];
      goto LABEL_17;
    }
    goto LABEL_14;
  }
  p_scdaCoordinator = (id *)&self->_myriadCoordinator;
  if (!self->_myriadCoordinator)
  {
    uint64_t v6 = [MEMORY[0x263F28568] currentCoordinator];
    if (!v6)
    {
      id v7 = (objc_class *)MEMORY[0x263F28568];
      goto LABEL_16;
    }
LABEL_14:
    id v8 = v6;
LABEL_17:
    id v9 = *p_scdaCoordinator;
    id *p_scdaCoordinator = v8;

    goto LABEL_18;
  }
  int v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v10 = 136315138;
    *(void *)&v10[4] = "-[VTUIEnrollTrainingViewController _setupMyriadCoordinator]";
    goto LABEL_10;
  }
LABEL_18:
  objc_msgSend(*p_scdaCoordinator, "setupEnabled:", 1, *(_OWORD *)v10);
}

- (BOOL)_shouldPresentLanguageDisambiguation
{
  return [(VTUIEnrollmentPageEligibilityProvider *)self->_pageEligibilityProvider shouldShowLanguageDisambiguationForBestFittingSiriLanguages:self->_siriLanguageOptions];
}

- (void)_setLanguageOptionsAndContinue
{
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideContinuationAndPreludeLabel:1];
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __66__VTUIEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke;
  v3[3] = &unk_264D4C4D0;
  objc_copyWeak(&v4, &location);
  void v3[4] = self;
  [(VTUIEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __66__VTUIEnrollTrainingViewController__setLanguageOptionsAndContinue__block_invoke(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  int v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained[136] view];
    [v4 removeFromSuperview];

    id v5 = v3[136];
    v3[136] = 0;

    uint64_t v6 = v3 + 166;
    if (!v3[166])
    {
      id v7 = [v3 view];
      id v8 = [VTUIEnrollmentLanguageOptionsView alloc];
      id v9 = [v3 view];
      [v9 bounds];
      uint64_t v10 = -[VTUIEnrollmentLanguageOptionsView initWithFrame:](v8, "initWithFrame:");

      objc_storeStrong(v3 + 166, v10);
      [*v6 setEnrollmentDelegate:v3];
      [*v6 setTranslatesAutoresizingMaskIntoConstraints:0];
      if ([v3[127] count]) {
        [*v6 setContinueButtonLanguages:v3[127]];
      }
      [v7 addSubview:*v6];
      uint64_t v11 = (void *)MEMORY[0x263F08938];
      unint64_t v12 = _NSDictionaryOfVariableBindings(&cfstr_Languageoption.isa, v10, 0);
      uint64_t v13 = [v11 constraintsWithVisualFormat:@"H:|[languageOptionsView]|" options:0 metrics:0 views:v12];
      [v7 addConstraints:v13];

      uint64_t v14 = (void *)MEMORY[0x263F08938];
      BOOL v15 = _NSDictionaryOfVariableBindings(&cfstr_Languageoption.isa, v10, 0);
      char v16 = [v14 constraintsWithVisualFormat:@"V:|[languageOptionsView]|" options:0 metrics:0 views:v15];
      id v22 = v7;
      [v7 addConstraints:v16];

      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = [*v6 continueButtons];
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            [*(id *)(*((void *)&v23 + 1) + 8 * i) addTarget:*(void *)(a1 + 32) action:sel__processLanguageSelectionAction_ forControlEvents:64];
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v19);
      }

      [v3[159] hideSkipButton:1];
      [*v6 fadeInSubviews];
    }
  }
}

- (void)_checkForPHSCloudDataIfNecessary:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = +[VTUIStyle sharedStyle];
  unint64_t v6 = [v5 enrollmentMode];

  id v7 = *MEMORY[0x263F28398];
  BOOL v8 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
  if (v4 && v6 <= 1)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v20 = "-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      __int16 v21 = 2112;
      id v22 = v4;
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s %@", buf, 0x16u);
    }
    objc_initWeak((id *)buf, self);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __69__VTUIEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke;
    v16[3] = &unk_264D4C4D0;
    objc_copyWeak(&v18, (id *)buf);
    id v17 = v4;
    dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, v16);
    id hasPHSInCloudFetchBlock = self->_hasPHSInCloudFetchBlock;
    self->_id hasPHSInCloudFetchBlock = v9;

    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    if (!hasPHSInCloudFetchQueue)
    {
      unint64_t v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
      uint64_t v13 = (OS_dispatch_queue *)dispatch_queue_create(0, v12);
      uint64_t v14 = self->_hasPHSInCloudFetchQueue;
      self->_hasPHSInCloudFetchQueue = v13;

      hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    }
    dispatch_async(hasPHSInCloudFetchQueue, self->_hasPHSInCloudFetchBlock);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v20 = "-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]";
      _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s Clearing fetch block", buf, 0xCu);
    }
    id v15 = self->_hasPHSInCloudFetchBlock;
    self->_id hasPHSInCloudFetchBlock = 0;
  }
}

void __69__VTUIEnrollTrainingViewController__checkForPHSCloudDataIfNecessary___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v3 = [MEMORY[0x263F78BB8] sharedInstance];
    WeakRetained[985] = [v3 hasVoiceProfileIniCloudForLanguageCode:*(void *)(a1 + 32)];

    id v4 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = WeakRetained[985];
      int v6 = 136315394;
      id v7 = "-[VTUIEnrollTrainingViewController _checkForPHSCloudDataIfNecessary:]_block_invoke";
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
    || ([(VTUIEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode], self->_hasPHSInCloudFetchBlock))
  {
    int v3 = *MEMORY[0x263F28398];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      uint64_t v14 = "-[VTUIEnrollTrainingViewController _hasPHSCloudDataForSpokenLanguage]";
      _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Waiting on block", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    hasPHSInCloudFetchQueue = self->_hasPHSInCloudFetchQueue;
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __69__VTUIEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke;
    v7[3] = &unk_264D4C538;
    objc_copyWeak(&v8, (id *)buf);
    void v7[4] = &v9;
    dispatch_sync(hasPHSInCloudFetchQueue, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }
  char v5 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v5;
}

void __69__VTUIEnrollTrainingViewController__hasPHSCloudDataForSpokenLanguage__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = WeakRetained[985];
}

- (void)_showEducationView
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int64_t enrollmentMode = self->_enrollmentMode;
    *(_DWORD *)buf = 136315394;
    char v35 = "-[VTUIEnrollTrainingViewController _showEducationView]";
    __int16 v36 = 2048;
    int64_t v37 = enrollmentMode;
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Showing Education view for enrollment mode %ld", buf, 0x16u);
  }
  char v5 = +[VTUIStyle sharedStyle];
  dispatch_time_t v32 = [v5 educationViewTitleText];

  int v6 = +[VTUIStyle sharedStyle];
  uint64_t v31 = [v6 educationViewDetailText];

  id v7 = [VTUISiriEducationViewController alloc];
  id v8 = +[VTUIStyle sharedStyle];
  uint64_t v9 = [(VTUISiriEducationViewController *)v7 initWithTitle:v32 detailText:v31 style:v8 delegate:self];
  educationViewController = self->_educationViewController;
  self->_educationViewController = v9;

  [(VTUISiriEducationViewController *)self->_educationViewController willMoveToParentViewController:self];
  [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_educationViewController];
  [(VTUISiriEducationViewController *)self->_educationViewController didMoveToParentViewController:self];
  uint64_t v11 = [(VTUISiriEducationViewController *)self->_educationViewController view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v11 setAutoresizesSubviews:0];
  char v12 = [(VTUIEnrollTrainingViewController *)self view];
  [v12 addSubview:v11];

  uint64_t v23 = (void *)MEMORY[0x263F08938];
  id v29 = [v11 topAnchor];
  dispatch_time_t v30 = [(VTUIEnrollTrainingViewController *)self view];
  uint64_t v28 = [v30 topAnchor];
  id v27 = [v29 constraintEqualToAnchor:v28 constant:0.0];
  v33[0] = v27;
  long long v25 = [v11 leftAnchor];
  long long v26 = [(VTUIEnrollTrainingViewController *)self view];
  long long v24 = [v26 leftAnchor];
  id v22 = [v25 constraintEqualToAnchor:v24 constant:0.0];
  v33[1] = v22;
  __int16 v21 = [v11 rightAnchor];
  uint64_t v13 = [(VTUIEnrollTrainingViewController *)self view];
  uint64_t v14 = [v13 rightAnchor];
  uint64_t v15 = [v21 constraintEqualToAnchor:v14 constant:0.0];
  void v33[2] = v15;
  char v16 = [v11 bottomAnchor];
  id v17 = [(VTUIEnrollTrainingViewController *)self view];
  id v18 = [v17 bottomAnchor];
  uint64_t v19 = [v16 constraintEqualToAnchor:v18 constant:0.0];
  v33[3] = v19;
  uint64_t v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v23 activateConstraints:v20];

  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
}

- (void)_finishSiriSetup
{
  objc_initWeak(&location, self);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __52__VTUIEnrollTrainingViewController__finishSiriSetup__block_invoke;
  v3[3] = &unk_264D4C258;
  objc_copyWeak(&v4, &location);
  [(VTUIEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:v3];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

void __52__VTUIEnrollTrainingViewController__finishSiriSetup__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained[142], "setTurnOnSiriNonAOP:", objc_msgSend(WeakRetained[142], "turnOnSiriNonAOP") + 1);
    [v2 _setAssistantEnabled:1];
    int v3 = [MEMORY[0x263F67FF8] sharedInstance];
    [v3 didCompleteFlow:*MEMORY[0x263F67FA0]];

    id v4 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      int v6 = "-[VTUIEnrollTrainingViewController _finishSiriSetup]_block_invoke";
      _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
    }
    [v2 _proceedAfterTrainingCompletionOrSkip];
  }
}

- (void)finish:(id)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:0];
  id v4 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 136315138;
    int v6 = "-[VTUIEnrollTrainingViewController finish:]";
    _os_log_impl(&dword_238878000, v4, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v5, 0xCu);
  }
  [(VTUIEnrollTrainingViewController *)self _proceedAfterTrainingCompletionOrSkip];
}

- (void)enrollTrainingViewRadarButtonPressed:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[VTUIEnrollTrainingViewController enrollTrainingViewRadarButtonPressed:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Tapped on radar button", buf, 0xCu);
  }
  [(VTUIEnrollTrainingViewController *)self _showRadarExitButton];
  [(VTUIEnrollmentSuccessViewing *)self->_successView setHidden:1];
  introViewController = self->_introViewController;
  if (introViewController)
  {
    uint64_t v7 = [(VTUIEnrollmentSetupIntroViewControlling *)introViewController view];
    [v7 setHidden:1];
  }
  [(VTUIEnrollmentLanguageOptionsView *)self->_languageOptionsView setHidden:1];
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideRadarButton:1];
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
  if ([(VTUIEnrollTrainingViewController *)self _isTrainingInProgress])
  {
    [(VTUIEnrollTrainingViewController *)self _resetEnrollment];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__VTUIEnrollTrainingViewController_enrollTrainingViewRadarButtonPressed___block_invoke;
    v8[3] = &unk_264D4C280;
    v8[4] = self;
    [(VTUIEnrollTrainingViewController *)self _cleanupTrainingManagerWithCompletion:v8];
  }
  else
  {
    [(VTUIEnrollTrainingViewController *)self _presentRadarView];
  }
}

uint64_t __73__VTUIEnrollTrainingViewController_enrollTrainingViewRadarButtonPressed___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentRadarView];
}

- (void)shouldAbortAnotherDeviceBetter:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIEnrollTrainingViewController shouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s BTLE Device abort ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)shouldContinue:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIEnrollTrainingViewController shouldContinue:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s BTLE Device continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scdaShouldAbortAnotherDeviceBetter:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIEnrollTrainingViewController scdaShouldAbortAnotherDeviceBetter:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda abort ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)scdaShouldContinue:(id)a3
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    int v5 = "-[VTUIEnrollTrainingViewController scdaShouldContinue:]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #scda continue ignored during training", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_tearDownDataSharingViews
{
  [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingOptInPresenter tearDownPresentedViews];
  siriDataSharingOptInView = self->_siriDataSharingOptInView;
  self->_siriDataSharingOptInView = 0;

  [(VTUIEnrollTrainingViewController *)self removeChildViewController:self->_siriDataSharingViewController];
  siriDataSharingViewController = self->_siriDataSharingViewController;
  self->_siriDataSharingViewController = 0;
}

- (void)_showSiriDataSharingOptIn
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  int v3 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v17 = "-[VTUIEnrollTrainingViewController _showSiriDataSharingOptIn]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Displaying SiriDataSharingOptIn", buf, 0xCu);
  }
  int v4 = [(VTUIEnrollTrainingViewController *)self view];
  int v5 = [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingOptInPresenter dataSharingOptInTextWelcomeControllerForViewStyle:0];
  siriDataSharingViewController = self->_siriDataSharingViewController;
  self->_siriDataSharingViewController = v5;

  uint64_t v7 = [(UIViewController *)self->_siriDataSharingViewController view];
  siriDataSharingOptInView = self->_siriDataSharingOptInView;
  self->_siriDataSharingOptInView = v7;
  uint64_t v9 = v7;

  [(UIViewController *)self->_siriDataSharingViewController willMoveToParentViewController:self];
  [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_siriDataSharingViewController];
  [(UIViewController *)self->_siriDataSharingViewController didMoveToParentViewController:self];
  [(UIView *)v9 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)v9 setAutoresizesSubviews:0];
  [v4 addSubview:v9];
  uint64_t v10 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:3 relatedBy:0 toItem:v4 attribute:3 multiplier:1.0 constant:0.0];
  uint64_t v11 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:4 relatedBy:0 toItem:v4 attribute:4 multiplier:1.0 constant:0.0];
  char v12 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:1 relatedBy:0 toItem:v4 attribute:1 multiplier:1.0 constant:0.0];
  uint64_t v13 = [MEMORY[0x263F08938] constraintWithItem:v9 attribute:2 relatedBy:0 toItem:v4 attribute:2 multiplier:1.0 constant:0.0];
  v15[0] = v10;
  v15[1] = v11;
  v15[2] = v12;
  v15[3] = v13;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v15 count:4];
  [v4 addConstraints:v14];

  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:1];
}

- (BOOL)_shouldShowSiriDataSharingOptInView
{
  int64_t enrollmentMode = self->_enrollmentMode;
  int v4 = [MEMORY[0x263F285A0] sharedPreferences];
  char v5 = [v4 assistantIsEnabled];

  if (enrollmentMode == 2) {
    return 0;
  }
  else {
    return [(VTUISiriDataSharingOptInPresenter *)self->_siriDataSharingOptInPresenter shouldShowSiriDataSharingOptInView] & v5;
  }
}

- (void)siriDataSharingOptInRequestsDismissalFromPresenter:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v4 = (void *)VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = NSNumber;
    BOOL hasSkippedTraining = self->_hasSkippedTraining;
    uint64_t v7 = v4;
    id v8 = [v5 numberWithBool:hasSkippedTraining];
    int v9 = 136315394;
    uint64_t v10 = "-[VTUIEnrollTrainingViewController siriDataSharingOptInRequestsDismissalFromPresenter:]";
    __int16 v11 = 2112;
    char v12 = v8;
    _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s #SiriDataSharingOptIn: Dismissing DataSharingOptIn sheet. _hasSkippedTraining:%@", (uint8_t *)&v9, 0x16u);
  }
  [(VTUIEnrollTrainingViewController *)self _endSetup];
}

- (void)_proceedAfterVoiceSelectionOrSkip
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F285A0] sharedPreferences];
  int v4 = [v3 assistantIsEnabled];

  char v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    uint64_t v10 = "-[VTUIEnrollTrainingViewController _proceedAfterVoiceSelectionOrSkip]";
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Enabled: %d", (uint8_t *)&v9, 0x12u);
  }
  if (self->_hasSkippedTraining) {
    char v6 = v4;
  }
  else {
    char v6 = 1;
  }
  if ((v6 & 1) == 0) {
    goto LABEL_11;
  }
  uint64_t v7 = +[VTUIStyle sharedStyle];
  int v8 = [v7 shouldPresentEducationView];

  if (v8)
  {
    [(VTUIEnrollmentSuccessViewing *)self->_successView setHidden:1];
    [(VTUIEnrollTrainingViewController *)self _showEducationView];
    return;
  }
  if ([(VTUIEnrollTrainingViewController *)self _shouldShowSiriDataSharingOptInView])
  {
    [(VTUIEnrollmentSuccessViewing *)self->_successView setHidden:1];
    [(VTUIEnrollTrainingViewController *)self _showSiriDataSharingOptIn];
  }
  else
  {
LABEL_11:
    [(VTUIEnrollTrainingViewController *)self _endSetup];
  }
}

- (void)_endSetup
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (self->_hasSkippedTraining)
  {
    int v3 = [MEMORY[0x263F285A0] sharedPreferences];
    int v4 = [v3 assistantIsEnabled];

    char v5 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      enablementConfiguration = self->_enablementConfiguration;
      *(_DWORD *)buf = 136315650;
      char v16 = "-[VTUIEnrollTrainingViewController _endSetup]";
      __int16 v17 = 1024;
      int v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = enablementConfiguration;
      _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Ending setup, assistant enabled %d enablementConfiguration:%@", buf, 0x1Cu);
    }
    if ((v4 & 1) == 0)
    {
      uint64_t v7 = self->_enablementConfiguration;
      if (v7)
      {
        int v8 = [(AFEnablementConfiguration *)v7 completionLoggingBlock];
        v8[2](v8, 0);
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained skipSetup];
  }
  else
  {
    uint64_t v10 = [(VTUIEnrollTrainingViewController *)self delegate];
    char v11 = objc_opt_respondsToSelector();

    int v12 = [(VTUIEnrollTrainingViewController *)self delegate];
    id v14 = v12;
    if (v11)
    {
      uint64_t v13 = [(SSRVTUITrainingManager *)self->_trainingManager voiceProfile];
      [v14 continueSetupWithVoiceProfile:v13];
    }
    else
    {
      [v12 continueSetup];
    }
  }
}

- (void)siriEducationViewControllerContinuePressed:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315138;
    int v9 = "-[VTUIEnrollTrainingViewController siriEducationViewControllerContinuePressed:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Education view continue pressed", (uint8_t *)&v8, 0xCu);
  }
  if ([(VTUIEnrollTrainingViewController *)self _shouldShowSiriDataSharingOptInView])
  {
    char v6 = [(VTUISiriEducationViewController *)self->_educationViewController view];
    [v6 removeFromSuperview];

    educationViewController = self->_educationViewController;
    self->_educationViewController = 0;

    [(VTUIEnrollTrainingViewController *)self _showSiriDataSharingOptIn];
  }
  else
  {
    [(VTUIEnrollTrainingViewController *)self _endSetup];
  }
}

- (void)siriIntroViewControllerLaterPressed:(id)a3
{
  self->_BOOL hasSkippedTraining = 1;
  [(VTUIEnrollTrainingViewController *)self skipAssistant:a3];
}

- (void)siriIntroViewControllerPrivacyLinkTapped
{
  if ([(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
  {
    id v10 = [MEMORY[0x263F5B8F8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.siri"];
    [v10 setPresentingViewController:self];
    int v3 = [v10 splashController];
    [v3 setAllowsOpeningSafari:1];

    id v4 = [v10 splashController];
    [v4 setUnderlineLinks:0];

    char v5 = [v10 splashController];
    [v5 setDisplayDeviceType:1];

    char v6 = [MEMORY[0x263F285A0] sharedPreferences];
    uint64_t v7 = [v6 languageCode];
    int v8 = [v10 splashController];
    [v8 setDisplayLanguage:v7];

    objc_msgSend(v10, "setModalPresentationStyle:", -[VTUIEnrollTrainingViewController modalPresentationStyle](self, "modalPresentationStyle"));
    int v9 = [(VTUIEnrollTrainingViewController *)self presentingViewController];
    objc_msgSend(v10, "setSupportedInterfaceOrientations:", objc_msgSend(v9, "supportedInterfaceOrientations"));

    [v10 present];
  }
}

- (BOOL)allLanguageOptionsSupportCompactTrigger
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = self->_siriLanguageOptions;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v11 + 1) + 8 * i);
        int v8 = objc_msgSend(MEMORY[0x263F85AF0], "sharedPreferences", (void)v11);
        LODWORD(v7) = [v8 isCompactVoiceTriggerAvailableForLanguageCode:v7];

        if (!v7)
        {
          BOOL v9 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSArray *)v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v9 = 1;
LABEL_11:

  return v9;
}

- (void)_processIntroViewContinueAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!self->_isEnablementConfigurationLoading)
  {
    char v6 = +[VTUIStyle sharedStyle];
    unint64_t v7 = [v6 enrollmentMode];

    if (v7 == 4)
    {
LABEL_6:
      [(VTUIEnrollTrainingViewController *)self _continueToTrainingFromIntro];
      goto LABEL_16;
    }
    if ([(VTUIEnrollTrainingViewController *)self _shouldPresentLanguageDisambiguation])
    {
      [(VTUIEnrollTrainingViewController *)self _setLanguageOptionsAndContinue];
      goto LABEL_16;
    }
    if (v7 != 3)
    {
      if (v7 > 1
        || (+[VTUIStyle sharedStyle],
            int v8 = objc_claimAutoreleasedReturnValue(),
            int v9 = [v8 shouldPresentDisclosureForCompactVoiceTrigger],
            v8,
            !v9))
      {
        if (![(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
        {
          [(VTUIEnrollTrainingViewController *)self _continueToVoiceSelectionFromIntro];
          goto LABEL_16;
        }
        goto LABEL_6;
      }
      id v10 = [MEMORY[0x263F285A0] sharedPreferences];
      [v10 setCompactVoiceTriggerDisclosurePresented:1];
    }
    [(VTUIEnrollTrainingViewController *)self _finishSiriSetup];
    goto LABEL_16;
  }
  uint64_t v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v15 = "-[VTUIEnrollTrainingViewController _processIntroViewContinueAction:]";
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Intro view continue requested while Enablement configuration loading", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  void v11[2] = __68__VTUIEnrollTrainingViewController__processIntroViewContinueAction___block_invoke;
  v11[3] = &unk_264D4C4D0;
  objc_copyWeak(&v13, (id *)buf);
  id v12 = v4;
  [(VTUIEnrollTrainingViewController *)self _setIntroViewActionOnEnablementConfigurationDidLoad:v11];

  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
LABEL_16:
}

void __68__VTUIEnrollTrainingViewController__processIntroViewContinueAction___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _processIntroViewContinueAction:*(void *)(a1 + 32)];

  uint64_t v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    uint64_t v5 = "-[VTUIEnrollTrainingViewController _processIntroViewContinueAction:]_block_invoke";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s Intro view continue processed after Enablement configuration loaded", (uint8_t *)&v4, 0xCu);
  }
}

- (void)_proceedAfterTrainingCompletionOrSkip
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(VTUIEnrollTrainingViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(VTUIEnrollTrainingViewController *)self delegate];
    [v5 didCompleteOrSkipVoiceTraining];
  }
  uint64_t v6 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    BOOL voiceSelected = self->_voiceSelected;
    *(_DWORD *)buf = 136315394;
    long long v11 = "-[VTUIEnrollTrainingViewController _proceedAfterTrainingCompletionOrSkip]";
    __int16 v12 = 1024;
    BOOL v13 = voiceSelected;
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Voice already selected in the session: %d", buf, 0x12u);
  }
  if (self->_voiceSelected
    || ![(AFEnablementConfiguration *)self->_enablementConfiguration requiresVoiceSelectionForRecognitionLanguage:self->_spokenLanguageCode])
  {
    [(VTUIEnrollTrainingViewController *)self _proceedAfterVoiceSelectionOrSkip];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __73__VTUIEnrollTrainingViewController__proceedAfterTrainingCompletionOrSkip__block_invoke;
    v8[3] = &unk_264D4C258;
    objc_copyWeak(&v9, (id *)buf);
    [(VTUIEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak((id *)buf);
  }
}

void __73__VTUIEnrollTrainingViewController__proceedAfterTrainingCompletionOrSkip__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v4 = WeakRetained;
    uint64_t v2 = [WeakRetained[136] view];
    [v2 removeFromSuperview];

    id v3 = v4[136];
    v4[136] = 0;

    [v4 _showVoiceSelectionViewForRecognitionLanguage:v4[164]];
    id WeakRetained = v4;
  }
}

- (void)_processLanguageSelectionAction:(id)a3
{
  id v14 = a3;
  char v4 = +[VTUIStyle sharedStyle];
  uint64_t v5 = [v4 enrollmentMode];

  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideContinuationAndPreludeLabel:0];
  uint64_t v6 = [(VTUIEnrollmentLanguageOptionsView *)self->_languageOptionsView continueButtons];
  char v7 = [v6 containsObject:v14];

  if (v7)
  {
    int v8 = [(VTUIEnrollmentLanguageOptionsView *)self->_languageOptionsView languageSelectionOfContinueButton:v14];
    spokenLanguageCode = self->_spokenLanguageCode;
    self->_spokenLanguageCode = v8;
    id v10 = v8;

    objc_storeStrong((id *)&self->_disambiguatedLanguageOption, self->_spokenLanguageCode);
    [(VTUIEnrollTrainingViewController *)self _checkForPHSCloudDataIfNecessary:self->_spokenLanguageCode];
  }
  if ([(AFEnablementConfiguration *)self->_enablementConfiguration requiresVoiceSelectionForRecognitionLanguage:self->_spokenLanguageCode])
  {
    [(VTUIEnrollmentLanguageOptionsView *)self->_languageOptionsView removeFromSuperview];
    languageOptionsView = self->_languageOptionsView;
    self->_languageOptionsView = 0;

    [(VTUIEnrollTrainingViewController *)self _showVoiceSelectionViewForRecognitionLanguage:self->_spokenLanguageCode];
  }
  else
  {
    disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
    if (disambiguatedLanguageOption) {
      [(VTUIEnrollTrainingViewController *)self _processDisambiguatedLanguageOption:disambiguatedLanguageOption commitLanguageCodeToPreferences:1];
    }
    if (v5 == 3)
    {
      [(VTUIEnrollmentLanguageOptionsView *)self->_languageOptionsView removeFromSuperview];
      BOOL v13 = self->_languageOptionsView;
      self->_languageOptionsView = 0;

      [(VTUIEnrollTrainingViewController *)self _finishSiriSetup];
    }
    else
    {
      [(VTUIEnrollTrainingViewController *)self _continueToTrainingFromLanguageOptions];
    }
  }
}

- (void)_setIntroViewActionOnEnablementConfigurationDidLoad:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v5 startAnimating];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v5];
  [(VTUIEnrollTrainingViewController *)self _setRightBarButtonItem:v6];
  [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController setContinueButtonEnabled:0];
  [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController setLaterButtonEnabled:0];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__VTUIEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke;
  aBlock[3] = &unk_264D4C560;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v7 = v4;
  int v8 = _Block_copy(aBlock);
  id onEnablementConfigurationDidLoad = self->_onEnablementConfigurationDidLoad;
  self->_id onEnablementConfigurationDidLoad = v8;

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __88__VTUIEnrollTrainingViewController__setIntroViewActionOnEnablementConfigurationDidLoad___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained _resetRightBarButtonItems];
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3) {
      (*(void (**)(void))(v3 + 16))();
    }
    [v4[136] setContinueButtonEnabled:1];
    [v4[136] setLaterButtonEnabled:1];
    id WeakRetained = v4;
  }
}

- (void)_processDisambiguatedLanguageOption:(id)a3 commitLanguageCodeToPreferences:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (os_log_t *)MEMORY[0x263F28348];
  int v8 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 136315138;
    __int16 v17 = "-[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
    _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v16, 0xCu);
  }
  id v9 = +[VTUIStyle sharedStyle];
  uint64_t v10 = [v9 enrollmentMode];

  if (v4)
  {
    id v11 = [MEMORY[0x263F285A0] sharedPreferences];
    [v11 setLanguageCode:self->_disambiguatedLanguageOption];
  }
  id v12 = +[VTUIStringsHelper sharedStringsHelper];
  [v12 setSiriLanguage:self->_disambiguatedLanguageOption];

  if (v4)
  {
    BOOL v13 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      int v16 = 136315138;
      __int16 v17 = "-[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
      _os_log_impl(&dword_238878000, v13, OS_LOG_TYPE_DEFAULT, "%s resetting trigger phrase and training hints", (uint8_t *)&v16, 0xCu);
    }
    [(VTUIEnrollTrainingViewController *)self _setInitialTriggerPhraseIfNotSet];
    [(VTUIEnrollTrainingViewController *)self _setupTrainingStates];
  }
  if (v10 != 3)
  {
    id v14 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEFAULT))
    {
      disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
      int v16 = 136315394;
      __int16 v17 = "-[VTUIEnrollTrainingViewController _processDisambiguatedLanguageOption:commitLanguageCodeToPreferences:]";
      __int16 v18 = 2112;
      __int16 v19 = disambiguatedLanguageOption;
      _os_log_impl(&dword_238878000, v14, OS_LOG_TYPE_DEFAULT, "%s Audio Hint player setLanguage:%@", (uint8_t *)&v16, 0x16u);
    }
    [(VTUIAudioHintPlayer *)self->_audioHintPlayer setLanguage:self->_disambiguatedLanguageOption];
  }
}

- (void)_continueToVoiceSelectionFromIntro
{
  [(VTUIEnrollTrainingViewController *)self _hideIntroView];
  spokenLanguageCode = self->_spokenLanguageCode;
  [(VTUIEnrollTrainingViewController *)self _showVoiceSelectionViewForRecognitionLanguage:spokenLanguageCode];
}

- (void)_showVoiceSelectionViewForRecognitionLanguage:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = VTUILogContextFacility;
  if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
  {
    int64_t enrollmentMode = self->_enrollmentMode;
    *(_DWORD *)buf = 136315650;
    uint64_t v51 = "-[VTUIEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
    __int16 v52 = 2048;
    int64_t v53 = enrollmentMode;
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl(&dword_238878000, v5, OS_LOG_TYPE_DEFAULT, "%s Showing voice selection view for enrollment mode %ld, recognitionLanguage %@", buf, 0x20u);
  }
  if (!v4)
  {
    id v7 = [MEMORY[0x263F285A0] sharedPreferences];
    id v4 = [v7 bestSupportedLanguageCodeForLanguageCode:0];

    int v8 = VTUILogContextFacility;
    if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      uint64_t v51 = "-[VTUIEnrollTrainingViewController _showVoiceSelectionViewForRecognitionLanguage:]";
      __int16 v52 = 2112;
      int64_t v53 = (int64_t)v4;
      _os_log_impl(&dword_238878000, v8, OS_LOG_TYPE_DEFAULT, "%s No recognition language used, falling back to %@", buf, 0x16u);
    }
  }
  uint64_t v9 = [(AFEnablementConfiguration *)self->_enablementConfiguration voiceSelectionAllowsRandomSelection];
  [(VTUIEnrollTrainingViewController *)self _setRightBarButtonItem:0];
  uint64_t v10 = +[VTUIStyle sharedStyle];
  uint64_t v11 = [v10 enrollmentMode];

  if (v11 != 2 && v11 != 4)
  {
    BOOL v13 = [(VTUIEnrollTrainingViewController *)self navigationItem];
    self->didOverrideHiddenBackButtonVisibility = [v13 hidesBackButton];

    id v14 = [(VTUIEnrollTrainingViewController *)self navigationItem];
    [v14 setHidesBackButton:0];

    [MEMORY[0x263F829A0] _setUseCustomBackButtonAction:1];
    uint64_t v15 = [(VTUIEnrollTrainingViewController *)self navigationItem];
    int v16 = [v15 navigationBar];
    __int16 v17 = [v16 backItem];
    __int16 v18 = [v17 backBarButtonItem];
    overriddenBackItemBackBarButtonItem = self->overriddenBackItemBackBarButtonItem;
    self->overriddenBackItemBackBarButtonItem = v18;

    uint64_t v20 = +[VTUIStyle sharedStyle];
    uint64_t v21 = [v20 VTUIDeviceSpecificString:@"BUTTON_NAV_BACK"];

    id v22 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithTitle:v21 style:0 target:self action:sel_returnFromVoiceSelectionToIntroView_];
    uint64_t v23 = [(VTUIEnrollTrainingViewController *)self navigationItem];
    long long v24 = [v23 navigationBar];
    long long v25 = [v24 backItem];
    [v25 setBackBarButtonItem:v22];
  }
  long long v26 = [[VTUIVoiceSelectionViewController alloc] initWithRecognitionLanguage:v4 allowsRandomSelection:v9 barButtonItemForContinue:0 customVoicePreviewer:0 delegate:self];
  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = v26;

  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController willMoveToParentViewController:self];
  [(VTUIEnrollTrainingViewController *)self addChildViewController:self->_voiceSelectionViewController];
  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController didMoveToParentViewController:self];
  uint64_t v28 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v28 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v28 setAutoresizesSubviews:0];
  id v29 = [(VTUIEnrollTrainingViewController *)self view];
  [v29 addSubview:v28];

  __int16 v40 = (void *)MEMORY[0x263F08938];
  unsigned int v47 = [v28 topAnchor];
  __int16 v48 = [(VTUIEnrollTrainingViewController *)self view];
  uint64_t v46 = [v48 topAnchor];
  unint64_t v45 = [v47 constraintEqualToAnchor:v46];
  v49[0] = v45;
  BOOL v43 = [v28 leftAnchor];
  __int16 v44 = [(VTUIEnrollTrainingViewController *)self view];
  unint64_t v41 = [v44 leftAnchor];
  BOOL v39 = [v43 constraintEqualToAnchor:v41];
  v49[1] = v39;
  dispatch_time_t v30 = [v28 rightAnchor];
  uint64_t v31 = [(VTUIEnrollTrainingViewController *)self view];
  dispatch_time_t v32 = [v31 rightAnchor];
  uint64_t v33 = [v30 constraintEqualToAnchor:v32];
  void v49[2] = v33;
  [v28 bottomAnchor];
  uint64_t v34 = v42 = v4;
  char v35 = [(VTUIEnrollTrainingViewController *)self view];
  __int16 v36 = [v35 bottomAnchor];
  int64_t v37 = [v34 constraintEqualToAnchor:v36];
  v49[3] = v37;
  uint64_t v38 = [MEMORY[0x263EFF8C0] arrayWithObjects:v49 count:4];
  [v40 activateConstraints:v38];
}

- (void)returnFromVoiceSelectionToIntroView:(id)a3
{
  [(VTUIEnrollTrainingViewController *)self _resetBackBarButtonItem];
  [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController removeFromParentViewController];
  id v4 = [(VTUIVoiceSelectionViewController *)self->_voiceSelectionViewController view];
  [v4 removeFromSuperview];

  voiceSelectionViewController = self->_voiceSelectionViewController;
  self->_voiceSelectionViewController = 0;

  id v6 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v6 setRightBarButtonItems:self->_existingRightBarButtonItems];

  existingRightBarButtonItems = self->_existingRightBarButtonItems;
  self->_existingRightBarButtonItems = 0;

  [(VTUIEnrollTrainingViewController *)self _showSiriIntroView];
}

- (void)_resetBackBarButtonItem
{
  if (self->didOverrideHiddenBackButtonVisibility)
  {
    uint64_t v3 = [(VTUIEnrollTrainingViewController *)self navigationItem];
    [v3 setHidesBackButton:1];

    self->didOverrideHiddenBackButtonVisibility = 0;
  }
  id v4 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  uint64_t v5 = [v4 navigationBar];
  id v6 = [v5 backItem];
  [v6 setBackBarButtonItem:self->overriddenBackItemBackBarButtonItem];

  overriddenBackItemBackBarButtonItem = self->overriddenBackItemBackBarButtonItem;
  self->overriddenBackItemBackBarButtonItem = 0;

  int v8 = (void *)MEMORY[0x263F829A0];
  [v8 _setUseCustomBackButtonAction:0];
}

- (void)voiceSelectionController:(id)a3 didSelectVoice:(id)a4 randomlySelected:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (os_log_t *)MEMORY[0x263F28348];
  uint64_t v11 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = v11;
    BOOL v13 = +[VTUIStyle sharedStyle];
    int v24 = 136315650;
    long long v25 = "-[VTUIEnrollTrainingViewController voiceSelectionController:didSelectVoice:randomlySelected:]";
    __int16 v26 = 2112;
    id v27 = v9;
    __int16 v28 = 2048;
    uint64_t v29 = [v13 enrollmentMode];
    _os_log_impl(&dword_238878000, v12, OS_LOG_TYPE_DEFAULT, "%s voice: %@, enrollment: %ld", (uint8_t *)&v24, 0x20u);
  }
  [(VTUIEnrollTrainingViewController *)self _resetBackBarButtonItem];
  disambiguatedLanguageOption = self->_disambiguatedLanguageOption;
  if (disambiguatedLanguageOption) {
    [(VTUIEnrollTrainingViewController *)self _processDisambiguatedLanguageOption:disambiguatedLanguageOption commitLanguageCodeToPreferences:0];
  }
  [(VTUIAudioHintPlayer *)self->_audioHintPlayer setOutputVoice:v9];
  uint64_t v15 = [MEMORY[0x263F285A0] sharedPreferences];
  [v15 setLanguageCode:self->_spokenLanguageCode outputVoice:v9];

  int v16 = *v10;
  if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 136315138;
    long long v25 = "-[VTUIEnrollTrainingViewController voiceSelectionController:didSelectVoice:randomlySelected:]";
    _os_log_impl(&dword_238878000, v16, OS_LOG_TYPE_DEFAULT, "%s resetting trigger phrase and training hints - voiceSelection", (uint8_t *)&v24, 0xCu);
  }
  [(VTUIEnrollTrainingViewController *)self _setInitialTriggerPhraseIfNotSet];
  [(VTUIEnrollTrainingViewController *)self _setupTrainingStates];
  __int16 v17 = [(VTUIEnrollTrainingViewController *)self delegate];
  char v18 = objc_opt_respondsToSelector();

  if (v18)
  {
    __int16 v19 = [(VTUIEnrollTrainingViewController *)self delegate];
    [v19 selectedVoice:v9 recognitionLanguageCode:self->_spokenLanguageCode];
  }
  [(VTUIEnrollTrainingViewController *)self _logVoiceSelection:v9 randomlySelected:v5];
  self->_BOOL voiceSelected = 1;
  [(VTUIEnrollTrainingViewController *)self _resetRightBarButtonItems];
  uint64_t v20 = +[VTUIStyle sharedStyle];
  uint64_t v21 = [v20 enrollmentMode];

  if (v21 == 3)
  {
    [(VTUIEnrollTrainingViewController *)self _finishSiriSetup];
  }
  else
  {
    id v22 = [MEMORY[0x263F285A0] sharedPreferences];
    char v23 = [v22 assistantIsEnabled];

    if (v23) {
      [(VTUIEnrollTrainingViewController *)self _proceedAfterVoiceSelectionOrSkip];
    }
    else {
      [(VTUIEnrollTrainingViewController *)self _continueToTrainingFromVoiceSelection];
    }
  }
}

- (void)_logVoiceSelection:(id)a3 randomlySelected:(BOOL)a4
{
  id v5 = a3;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __72__VTUIEnrollTrainingViewController__logVoiceSelection_randomlySelected___block_invoke(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v3 = [*(id *)(a1 + 32) languageCode];

  if (v3)
  {
    id v4 = [*(id *)(a1 + 32) languageCode];
    [v2 setObject:v4 forKey:@"languageCode"];
  }
  id v5 = [*(id *)(a1 + 32) name];

  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) name];
    [v2 setObject:v6 forKey:@"voiceName"];
  }
  id v7 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 40)];
  [v2 setObject:v7 forKey:@"randomlySelected"];

  return v2;
}

- (void)_hideIntroView
{
  if ([(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable])
  {
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke;
    v6[3] = &unk_264D4C280;
    v6[4] = self;
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke_2;
    v5[3] = &unk_264D4C5B0;
    v5[4] = self;
    [MEMORY[0x263F82E00] animateWithDuration:0 delay:v6 options:v5 animations:0.3 completion:0.0];
  }
  else
  {
    uint64_t v3 = [(VTUIEnrollmentSetupIntroViewControlling *)self->_introViewController view];
    [v3 removeFromSuperview];

    introViewController = self->_introViewController;
    self->_introViewController = 0;
  }
}

void __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(*(void *)(a1 + 32) + 1088) view];
  [v1 setAlpha:0.0];
}

void __50__VTUIEnrollTrainingViewController__hideIntroView__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 1088) view];
  [v2 setHidden:1];

  id v3 = [*(id *)(*(void *)(a1 + 32) + 1088) view];
  [v3 setAlpha:1.0];
}

- (void)_continueToTrainingFromIntro
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    int v16 = "-[VTUIEnrollTrainingViewController _continueToTrainingFromIntro]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke;
  aBlock[3] = &unk_264D4C258;
  objc_copyWeak(&v14, (id *)buf);
  id v4 = _Block_copy(aBlock);
  uint64_t v6 = MEMORY[0x263EF8330];
  uint64_t v7 = 3221225472;
  id v8 = __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke_2;
  id v9 = &unk_264D4C5D8;
  objc_copyWeak(&v12, (id *)buf);
  uint64_t v10 = self;
  id v5 = v4;
  id v11 = v5;
  [(VTUIEnrollTrainingViewController *)self _warnForLanguageCompatibilityIfNecessary:&v6];
  if ([(VTUIEnrollTrainingViewController *)self _isGreyMatterAvailable]) {
    [(VTUIEnrollTrainingViewController *)self _playSoundForStageAfterDelay:0.3];
  }

  objc_destroyWeak(&v12);
  objc_destroyWeak(&v14);
  objc_destroyWeak((id *)buf);
}

void __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained _hideIntroView];
    id WeakRetained = v2;
  }
}

void __64__VTUIEnrollTrainingViewController__continueToTrainingFromIntro__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v9 = WeakRetained;
    if ([WeakRetained[136] isLaterButtonAvailable])
    {
      id v3 = v9;
      id v4 = v9[134];
      BOOL v6 = v4 == (id)4 || v4 == (id)7;
    }
    else
    {
      BOOL v6 = 1;
      id v3 = v9;
    }
    [v3[159] hideSkipButton:v6];
    uint64_t v7 = +[VTUIStyle sharedStyle];
    uint64_t v8 = [v7 enrollmentMode];

    if (v8 != 4) {
      [v9 _setAssistantEnabled:1];
    }
    objc_msgSend(v9[142], "setVoiceTrainingStarted:", objc_msgSend(v9[142], "voiceTrainingStarted") + 1);
    [*(id *)(a1 + 32) _startTrainingIfNecessaryWithViewCleanupBlock:*(void *)(a1 + 40)];
    id WeakRetained = v9;
  }
}

- (void)_continueToTrainingFromLanguageOptions
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[VTUIEnrollTrainingViewController _continueToTrainingFromLanguageOptions]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __74__VTUIEnrollTrainingViewController__continueToTrainingFromLanguageOptions__block_invoke;
  aBlock[3] = &unk_264D4C258;
  objc_copyWeak(&v8, (id *)buf);
  id v4 = _Block_copy(aBlock);
  id v5 = +[VTUIStyle sharedStyle];
  BOOL v6 = [v5 enrollmentMode] == 4;

  if (!v6) {
    [(VTUIEnrollTrainingViewController *)self _setAssistantEnabled:1];
  }
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:0];
  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingStarted:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingStarted] + 1];
  [(VTUIEnrollTrainingViewController *)self _startTrainingIfNecessaryWithViewCleanupBlock:v4];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __74__VTUIEnrollTrainingViewController__continueToTrainingFromLanguageOptions__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    [WeakRetained[166] removeFromSuperview];
    id v2 = v3[166];
    v3[166] = 0;

    id WeakRetained = v3;
  }
}

- (void)_continueToTrainingFromVoiceSelection
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v10 = "-[VTUIEnrollTrainingViewController _continueToTrainingFromVoiceSelection]";
    _os_log_impl(&dword_238878000, v3, OS_LOG_TYPE_DEFAULT, "%s ", buf, 0xCu);
  }
  [(VTUITrainingViewMediator *)self->_trainingViewMediator hideSkipButton:0];
  id v4 = +[VTUIStyle sharedStyle];
  BOOL v5 = [v4 enrollmentMode] == 4;

  if (!v5) {
    [(VTUIEnrollTrainingViewController *)self _setAssistantEnabled:1];
  }
  objc_initWeak((id *)buf, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __73__VTUIEnrollTrainingViewController__continueToTrainingFromVoiceSelection__block_invoke;
  aBlock[3] = &unk_264D4C258;
  objc_copyWeak(&v8, (id *)buf);
  BOOL v6 = _Block_copy(aBlock);
  [(VTUIAnalytics *)self->_analyticsEvent setVoiceTrainingStarted:[(VTUIAnalytics *)self->_analyticsEvent voiceTrainingStarted] + 1];
  [(VTUIEnrollTrainingViewController *)self _startTrainingIfNecessaryWithViewCleanupBlock:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __73__VTUIEnrollTrainingViewController__continueToTrainingFromVoiceSelection__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    [WeakRetained[151] removeFromParentViewController];
    id v2 = [v4[151] view];
    [v2 removeFromSuperview];

    id v3 = v4[151];
    v4[151] = 0;

    id WeakRetained = v4;
  }
}

- (void)_startTrainingIfNecessary
{
}

- (void)_startTrainingIfNecessaryWithViewCleanupBlock:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(void))a3;
  BOOL v5 = v4;
  if (self->_enrollmentMode != 2)
  {
    uint64_t v7 = [MEMORY[0x263F78BB8] sharedInstance];
    id v8 = [MEMORY[0x263F285A0] sharedPreferences];
    id v9 = [v8 languageCode];

    if ([v7 isSATEnrolledForSiriProfileId:0 forLanguageCode:v9])
    {
      uint64_t v10 = (os_log_t *)MEMORY[0x263F28398];
      uint64_t v11 = *MEMORY[0x263F28398];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        char v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        _os_log_impl(&dword_238878000, v11, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data locally", (uint8_t *)&v22, 0xCu);
      }
      id v12 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v12 logEventWithType:3301 context:&unk_26EB98F20];

      BOOL v13 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
      {
        int v22 = 136315138;
        char v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        _os_log_impl(&dword_238878000, v13, OS_LOG_TYPE_DEFAULT, "%s Enabling voice trigger", (uint8_t *)&v22, 0xCu);
      }
      id v14 = [MEMORY[0x263F85AF0] sharedPreferences];
      [v14 setVoiceTriggerEnabled:1];
    }
    else
    {
      BOOL v15 = [(VTUIEnrollTrainingViewController *)self _hasPHSCloudDataForSpokenLanguage];
      int v16 = (os_log_t *)MEMORY[0x263F28398];
      uint64_t v17 = *MEMORY[0x263F28398];
      BOOL v18 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT);
      if (!v15)
      {
        if (v18)
        {
          int v22 = 136315138;
          char v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
          _os_log_impl(&dword_238878000, v17, OS_LOG_TYPE_DEFAULT, "%s Starting training due to no PHS data locally or in cloud", (uint8_t *)&v22, 0xCu);
        }
        if (v5) {
          v5[2](v5);
        }
        [(VTUIEnrollTrainingViewController *)self setDidShowVoiceTriggerPrompt:1];
        [(VTUIEnrollTrainingViewController *)self _startTraining];
        goto LABEL_25;
      }
      if (v18)
      {
        int v22 = 136315138;
        char v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        _os_log_impl(&dword_238878000, v17, OS_LOG_TYPE_DEFAULT, "%s Skipping training due to preexistence of PHS data in cloud", (uint8_t *)&v22, 0xCu);
      }
      __int16 v19 = [MEMORY[0x263F283F8] sharedAnalytics];
      [v19 logEventWithType:3301 context:&unk_26EB98F48];

      uint64_t v20 = *v16;
      if (os_log_type_enabled(*v16, OS_LOG_TYPE_DEFAULT))
      {
        spokenLanguageCode = self->_spokenLanguageCode;
        int v22 = 136315394;
        char v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
        __int16 v24 = 2112;
        long long v25 = spokenLanguageCode;
        _os_log_impl(&dword_238878000, v20, OS_LOG_TYPE_DEFAULT, "%s Enabling voice trigger upon profile sync for %@", (uint8_t *)&v22, 0x16u);
      }
      [v7 enableVoiceTriggerUponVoiceProfileSyncForLanguage:self->_spokenLanguageCode];
    }
    [(VTUIEnrollTrainingViewController *)self _proceedAfterTrainingCompletionOrSkip];
LABEL_25:

    goto LABEL_26;
  }
  if (v4) {
    v4[2](v4);
  }
  BOOL v6 = *MEMORY[0x263F28398];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28398], OS_LOG_TYPE_DEFAULT))
  {
    int v22 = 136315138;
    char v23 = "-[VTUIEnrollTrainingViewController _startTrainingIfNecessaryWithViewCleanupBlock:]";
    _os_log_impl(&dword_238878000, v6, OS_LOG_TYPE_DEFAULT, "%s Starting training since we are in kVTUIEnrollmentModeTrainingUIOnly", (uint8_t *)&v22, 0xCu);
  }
  [(VTUIEnrollTrainingViewController *)self _startTraining];
LABEL_26:
}

- (void)_setRightBarButtonItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  BOOL v6 = [v5 rightBarButtonItems];
  existingRightBarButtonItems = self->_existingRightBarButtonItems;
  self->_existingRightBarButtonItems = v6;

  id v8 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v8 setRightBarButtonItem:v4];
}

- (void)_resetRightBarButtonItems
{
  id v3 = [(VTUIEnrollTrainingViewController *)self navigationItem];
  [v3 setRightBarButtonItems:self->_existingRightBarButtonItems];

  existingRightBarButtonItems = self->_existingRightBarButtonItems;
  self->_existingRightBarButtonItems = 0;
}

- (VTUIEnrollTrainingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VTUIEnrollTrainingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)didShowVoiceTriggerPrompt
{
  return self->_didShowVoiceTriggerPrompt;
}

- (void)setDidShowVoiceTriggerPrompt:(BOOL)a3
{
  self->_didShowVoiceTriggerPrompt = a3;
}

- (VTUITrainingViewMediator)trainingViewMediator
{
  return self->_trainingViewMediator;
}

- (void)setTrainingViewMediator:(id)a3
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

- (BOOL)skipToSiriDataSharingOptInForTesting
{
  return self->_skipToSiriDataSharingOptInForTesting;
}

- (void)setSkipToSiriDataSharingOptInForTesting:(BOOL)a3
{
  self->_skipToSiriDataSharingOptInForTesting = a3;
}

- (BOOL)disambiguateLanguageOptionsForTesting
{
  return self->_disambiguateLanguageOptionsForTesting;
}

- (void)setDisambiguateLanguageOptionsForTesting:(BOOL)a3
{
  self->_disambiguateLanguageOptionsForTesting = a3;
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

- (VTUIEnrollmentLanguageOptionsView)languageOptionsView
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

- (NSString)voiceProfileAppDomain
{
  return self->_voiceProfileAppDomain;
}

- (void)setVoiceProfileAppDomain:(id)a3
{
}

- (NSUUID)trainingAttemptUUID
{
  return self->_trainingAttemptUUID;
}

- (void)setTrainingAttemptUUID:(id)a3
{
}

- (AVAudioPlayer)audioPlayer
{
  return (AVAudioPlayer *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setAudioPlayer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioPlayer, 0);
  objc_storeStrong((id *)&self->_trainingAttemptUUID, 0);
  objc_storeStrong((id *)&self->_voiceProfileAppDomain, 0);
  objc_storeStrong((id *)&self->_audioHintPlayer, 0);
  objc_storeStrong((id *)&self->_scdaCoordinator, 0);
  objc_storeStrong((id *)&self->_myriadCoordinator, 0);
  objc_storeStrong((id *)&self->_aboutTappedSender, 0);
  objc_storeStrong((id *)&self->_languageOptionsView, 0);
  objc_storeStrong((id *)&self->_disambiguatedLanguageOption, 0);
  objc_storeStrong((id *)&self->_spokenLanguageCode, 0);
  objc_storeStrong((id *)&self->_trainingViewMediator, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->_onEnablementConfigurationDidLoad, 0);
  objc_storeStrong((id *)&self->overriddenBackItemBackBarButtonItem, 0);
  objc_storeStrong((id *)&self->_existingRightBarButtonItems, 0);
  objc_storeStrong((id *)&self->_voiceSelectionViewController, 0);
  objc_storeStrong((id *)&self->_enablementConfiguration, 0);
  objc_storeStrong((id *)&self->_provider, 0);
  objc_storeStrong((id *)&self->_cachedColorForNavigationUI, 0);
  objc_storeStrong((id *)&self->_summarizationOnboardingController, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);
  objc_storeStrong((id *)&self->_cameraButtonBuddyViewController, 0);
  objc_storeStrong((id *)&self->_settingsConnection, 0);
  objc_storeStrong((id *)&self->_pageEligibilityProvider, 0);
  objc_storeStrong((id *)&self->_analyticsEvent, 0);
  objc_storeStrong((id *)&self->_gmViewController, 0);
  objc_storeStrong((id *)&self->_educationViewController, 0);
  objc_storeStrong((id *)&self->_vtConfirmationViewController, 0);
  objc_storeStrong((id *)&self->_successView, 0);
  objc_storeStrong((id *)&self->_introViewController, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInPresenter, 0);
  objc_storeStrong((id *)&self->_siriDataSharingOptInView, 0);
  objc_storeStrong((id *)&self->_siriDataSharingViewController, 0);
  objc_storeStrong((id *)&self->_trainingManager, 0);
  objc_storeStrong((id *)&self->_latestTrainingAttemptIdentifier, 0);
  objc_storeStrong((id *)&self->_siriLanguageOptions, 0);
  objc_storeStrong((id *)&self->_trainingPageInstructions, 0);
  objc_storeStrong((id *)&self->_hasPHSInCloudFetchQueue, 0);
  objc_storeStrong(&self->_hasPHSInCloudFetchBlock, 0);
  objc_storeStrong((id *)&self->_siriLanguage, 0);
}

void __43__VTUIEnrollTrainingViewController_prewarm__block_invoke_3_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  id v2 = "-[VTUIEnrollTrainingViewController prewarm]_block_invoke_3";
  _os_log_error_impl(&dword_238878000, log, OS_LOG_TYPE_ERROR, "%s Unable to prepare GMDeviceScene", (uint8_t *)&v1, 0xCu);
}

@end