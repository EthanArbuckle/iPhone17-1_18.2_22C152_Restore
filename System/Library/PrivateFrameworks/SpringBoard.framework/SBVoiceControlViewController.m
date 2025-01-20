@interface SBVoiceControlViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)_hasPickableBluetoothDevice;
- (BOOL)handleHomeButtonPress;
- (BOOL)isVoiceControlLoggingEnabled;
- (BOOL)prefersProximityDetectionEnabled;
- (BOOL)recognitionSessionWillBeginAction:(id)a3;
- (BOOL)shouldAllowSensitiveActions;
- (BOOL)shouldDisableHandlerActions;
- (BOOL)shouldDisableVoiceControlForBluetoothRequests;
- (CGRect)_flamesViewFrame;
- (NSArray)nextRecognitionAudioInputPaths;
- (SBVoiceControlViewController)initWithSource:(id)a3;
- (SBVoiceControlViewControllerDelegate)voiceControlDelegate;
- (double)_subtitleBaseline;
- (double)_titleBaseline;
- (float)audioLevelForFlamesView:(id)a3;
- (id)_availableRouteDictionaries;
- (id)_currentPreferredRouteDictionary;
- (id)_localizedStringForKey:(id)a3;
- (id)_newRecognitionSession;
- (id)_popNextRecognitionAudioInputPath;
- (id)_preferredRouteDictionaryWithAvailableRouteDictionaries:(id)a3 preferredAVAudioRouteName:(id)a4 preferredAVAudioRouteUID:(id)a5 shouldPreferBluetooth:(BOOL)a6;
- (id)nextSuggestionsForSuggestionsView:(id)a3 maxSuggestions:(unint64_t)a4;
- (void)_avSystemControllerHeadphoneJackIsConnectedDidChangeNotification:(id)a3;
- (void)_avSystemControllerPickableRoutesDidChangeNotification:(id)a3;
- (void)_configureRoutingIfNeeded;
- (void)_continueRecognitionAction;
- (void)_continueWithRecognitionAction;
- (void)_deviceProximityStateDidChangeNotification:(id)a3;
- (void)_handleButtonUpCancel;
- (void)_performConfirmationAction;
- (void)_performNoMatchFound;
- (void)_recognitionSessionKeywordsDidChangeNotification:(id)a3;
- (void)_requestDismissal;
- (void)_resetSession;
- (void)_setAVAudioRouteUID:(id)a3;
- (void)_setFeedbackVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)_setNeedsRoutingUpdate;
- (void)_setPrefersProximityDetectionEnabled:(BOOL)a3;
- (void)_setSession:(id)a3;
- (void)_setStatusText:(id)a3;
- (void)_setTitleText:(id)a3;
- (void)_speakFeedbackText;
- (void)_speakText:(id)a3;
- (void)_startSession;
- (void)dealloc;
- (void)handleHeadsetButtonUpFromButtonDownSource:(BOOL)a3;
- (void)performDismissalTransitionAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)performPresentationTransitionAnimated:(BOOL)a3 completionHandler:(id)a4;
- (void)recognitionSession:(id)a3 didCompleteActionWithError:(id)a4;
- (void)recognitionSession:(id)a3 didFinishSpeakingFeedbackStringWithError:(id)a4;
- (void)recognitionSession:(id)a3 openURL:(id)a4 completion:(id)a5;
- (void)recognitionSessionDidBeginAction:(id)a3;
- (void)resetSessionWithSource:(id)a3;
- (void)setNextRecognitionAudioInputPaths:(id)a3;
- (void)setShouldAllowSensitiveActions:(BOOL)a3;
- (void)setShouldDisableHandlerActions:(BOOL)a3;
- (void)setShouldDisableVoiceControlForBluetoothRequests:(BOOL)a3;
- (void)setVoiceControlDelegate:(id)a3;
- (void)setVoiceControlLoggingEnabled:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation SBVoiceControlViewController

- (SBVoiceControlViewController)initWithSource:(id)a3
{
  id v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)SBVoiceControlViewController;
  v6 = [(SBVoiceControlViewController *)&v23 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    p_source = (id *)&v6->_source;
    objc_storeStrong((id *)&v6->_source, a3);
    uint64_t v9 = [*p_source sourceType];
    if (v9)
    {
      if (v9 != 1)
      {
        if (v9 == 2)
        {
          avAudioRouteName = v7->_avAudioRouteName;
          v7->_avAudioRouteName = (NSString *)@"Headphone";

          v7->_isHeadsetButtonPressedDown = 1;
        }
        goto LABEL_13;
      }
      v11 = [*p_source bluetoothDevice];
      v12 = [v11 address];
      [(SBVoiceControlViewController *)v7 _setAVAudioRouteUID:v12];
    }
    else
    {
      v11 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
      v13 = [v11 attributeForKey:*MEMORY[0x1E4F74BF0]];
      char v14 = [v13 BOOLValue];

      if (v14)
      {
        v15 = @"Headphone";
      }
      else
      {
        [(SBVoiceControlViewController *)v7 _setPrefersProximityDetectionEnabled:1];
        v16 = [MEMORY[0x1E4F42948] currentDevice];
        int v17 = [v16 proximityState];

        v15 = @"Speaker";
        if (v17) {
          v15 = @"Receiver";
        }
      }
      v18 = v7->_avAudioRouteName;
      v7->_avAudioRouteName = &v15->isa;
    }
LABEL_13:
    v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v20 = *MEMORY[0x1E4F437E0];
    v21 = [MEMORY[0x1E4F42948] currentDevice];
    [v19 addObserver:v7 selector:sel__deviceProximityStateDidChangeNotification_ name:v20 object:v21];
  }
  return v7;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v4 = v3;
  if (self->_session)
  {
    objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E4FB4280]);
    [(VSRecognitionSession *)self->_session setDelegate:0];
    id v5 = (id)[(VSRecognitionSession *)self->_session cancel];
  }
  [v4 removeObserver:self name:*MEMORY[0x1E4F74C58] object:0];
  [v4 removeObserver:self name:*MEMORY[0x1E4F74C00] object:0];
  uint64_t v6 = *MEMORY[0x1E4F437E0];
  v7 = [MEMORY[0x1E4F42948] currentDevice];
  [v4 removeObserver:self name:v6 object:v7];

  [(NSTimer *)self->_delayedConfirmationActionTimer invalidate];
  [(SUICFlamesView *)self->_flamesView setDelegate:0];
  [(SiriUISuggestionsView *)self->_suggestionsView setDelegate:0];

  v8.receiver = self;
  v8.super_class = (Class)SBVoiceControlViewController;
  [(SBVoiceControlViewController *)&v8 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v34.receiver = self;
  v34.super_class = (Class)SBVoiceControlViewController;
  [(SBVoiceControlViewController *)&v34 viewDidLayoutSubviews];
  v3 = [(SBVoiceControlViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  -[UIView setFrame:](self->_contentView, "setFrame:", v5, v7, v9, v11);
  v12 = [(SBVoiceControlViewController *)self traitCollection];
  [v12 displayScale];
  double v14 = v13;

  if (v14 <= 0.00000011920929)
  {
    v15 = [MEMORY[0x1E4F42D90] mainScreen];
    [v15 scale];
  }
  [(UIView *)self->_contentView bounds];
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  double v21 = v20;
  CGFloat v23 = v22;
  double v24 = *MEMORY[0x1E4F1DB28];
  v25 = [(UILabel *)self->_titleLabel font];
  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  CGRectGetMinY(v35);
  [(SBVoiceControlViewController *)self _titleBaseline];
  [v25 descender];
  [v25 lineHeight];
  UIRoundToScale();
  double v27 = v26;
  [v25 lineHeight];
  -[UILabel setFrame:](self->_titleLabel, "setFrame:", v24, v27, v21, v28);
  v29 = [(UILabel *)self->_subtitleLabel font];
  v36.origin.x = v17;
  v36.origin.y = v19;
  v36.size.width = v21;
  v36.size.height = v23;
  CGRectGetMinY(v36);
  [(SBVoiceControlViewController *)self _subtitleBaseline];
  [v29 descender];
  [v29 lineHeight];
  UIRoundToScale();
  double v31 = v30;
  [v29 lineHeight];
  -[UILabel setFrame:](self->_subtitleLabel, "setFrame:", v24, v31, v21, v32);
  flamesView = self->_flamesView;
  [(SBVoiceControlViewController *)self _flamesViewFrame];
  -[SUICFlamesView setFrame:](flamesView, "setFrame:");
}

- (void)viewDidLoad
{
  v48.receiver = self;
  v48.super_class = (Class)SBVoiceControlViewController;
  [(SBVoiceControlViewController *)&v48 viewDidLoad];
  double v4 = [(SBVoiceControlViewController *)self view];
  [v4 bounds];
  double v9 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x1E4F42FF0]), "initWithFrame:", v5, v6, v7, v8);
  contentView = self->_contentView;
  self->_contentView = v9;

  double v11 = self->_contentView;
  v12 = [MEMORY[0x1E4F428B8] clearColor];
  [(UIView *)v11 setBackgroundColor:v12];

  [v4 addSubview:self->_contentView];
  [(UIView *)self->_contentView bounds];
  double v14 = v13;
  double v16 = v15;
  CGFloat v17 = [MEMORY[0x1E4F42A30] systemFontOfSize:36.0];
  double v18 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v18;

  [(UILabel *)self->_titleLabel setFont:v17];
  double v20 = self->_titleLabel;
  double v21 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v20 setTextColor:v21];

  [(UILabel *)self->_titleLabel setTextAlignment:1];
  double v22 = self->_titleLabel;
  CGFloat v23 = [(SBVoiceControlViewController *)self _localizedStringForKey:@"JIBBLER"];
  [(UILabel *)v22 setText:v23];

  [(UILabel *)self->_titleLabel setAdjustsFontSizeToFitWidth:1];
  [(UIView *)self->_contentView addSubview:self->_titleLabel];
  double v24 = [MEMORY[0x1E4F42A30] systemFontOfSize:14.0];
  v25 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v25;

  [(UILabel *)self->_subtitleLabel setFont:v24];
  double v27 = self->_subtitleLabel;
  double v28 = [(UILabel *)self->_titleLabel textColor];
  [(UILabel *)v27 setTextColor:v28];

  [(UILabel *)self->_subtitleLabel setTextAlignment:1];
  [(UIView *)self->_contentView addSubview:self->_subtitleLabel];
  v29 = (SiriUISuggestionsView *)objc_msgSend(objc_alloc(MEMORY[0x1E4FA5000]), "initWithFrame:", 0.0, 0.0, v14, v16 + -95.0 + -20.0);
  suggestionsView = self->_suggestionsView;
  self->_suggestionsView = v29;

  double v31 = self->_suggestionsView;
  if (!v31)
  {
    v46 = [MEMORY[0x1E4F28B00] currentHandler];
    [v46 handleFailureInMethod:a2 object:self file:@"SBVoiceControlViewController.m" lineNumber:185 description:@"can't create Siri UI suggestions view -- was the appropriate framework mastered onto this device?"];

    double v31 = self->_suggestionsView;
  }
  [(SiriUISuggestionsView *)v31 setDelegate:self];
  [(UIView *)self->_contentView addSubview:self->_suggestionsView];
  id v32 = objc_alloc(MEMORY[0x1E4FA5020]);
  [(SBVoiceControlViewController *)self _flamesViewFrame];
  double v34 = v33;
  double v36 = v35;
  double v38 = v37;
  double v40 = v39;
  v41 = [MEMORY[0x1E4F42D90] mainScreen];
  v42 = (SUICFlamesView *)objc_msgSend(v32, "initWithFrame:screen:fidelity:", v41, 0, v34, v36, v38, v40);
  flamesView = self->_flamesView;
  self->_flamesView = v42;

  v44 = self->_flamesView;
  if (!v44)
  {
    v47 = [MEMORY[0x1E4F28B00] currentHandler];
    [v47 handleFailureInMethod:a2 object:self file:@"SBVoiceControlViewController.m" lineNumber:191 description:@"can't create Siri UI feedback view -- was the appropriate framework mastered onto this device?"];

    v44 = self->_flamesView;
  }
  [(SUICFlamesView *)v44 setMode:1];
  [(SUICFlamesView *)self->_flamesView setDelegate:self];
  [(SUICFlamesView *)self->_flamesView setNeedsLayout];
  [(SUICFlamesView *)self->_flamesView setState:1];
  [(UIView *)self->_contentView addSubview:self->_flamesView];
  [(SBVoiceControlViewController *)self _setFeedbackVisible:0 animated:0];
  id v45 = [(SBVoiceControlViewController *)self _newRecognitionSession];
  [(SBVoiceControlViewController *)self _setSession:v45];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SBVoiceControlViewController;
  [(SBVoiceControlViewController *)&v4 viewWillAppear:a3];
  [(SBVoiceControlViewController *)self _startSession];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SBVoiceControlViewController;
  [(SBVoiceControlViewController *)&v6 viewWillDisappear:a3];
  [(NSTimer *)self->_delayedConfirmationActionTimer invalidate];
  delayedConfirmationActionTimer = self->_delayedConfirmationActionTimer;
  self->_delayedConfirmationActionTimer = 0;

  id v5 = (id)[(VSRecognitionSession *)self->_session cancel];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)nextSuggestionsForSuggestionsView:(id)a3 maxSuggestions:(unint64_t)a4
{
  uint64_t v6 = [(VSRecognitionSession *)self->_session keywordCount];
  if (v6 < 1)
  {
    double v8 = (void *)MEMORY[0x1E4F1CBF0];
    goto LABEL_9;
  }
  unint64_t v7 = v6;
  double v8 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:a4];
  if (v7 < a4)
  {
    self->_startingKeywordIndex = 0;
    a4 = v7;
    goto LABEL_6;
  }
  if (a4)
  {
LABEL_6:
    uint64_t v9 = 0;
    do
    {
      double v10 = [(VSRecognitionSession *)self->_session keywordAtIndex:(v9 + self->_startingKeywordIndex) % (uint64_t)v7];
      [v8 addObject:v10];

      ++v9;
    }
    while (a4 != v9);
  }
  self->_startingKeywordIndex = (self->_startingKeywordIndex + a4) % v7;
LABEL_9:
  return v8;
}

- (float)audioLevelForFlamesView:(id)a3
{
  if (![(VSRecognitionSession *)self->_session isActivelyRecognizing]) {
    return -120.0;
  }
  [(VSRecognitionSession *)self->_session inputLevelDB];
  if (v4 == 0.0) {
    return -120.0;
  }
  session = self->_session;
  [(VSRecognitionSession *)session inputLevelDB];
  return result;
}

- (void)recognitionSessionDidBeginAction:(id)a3
{
  if ([a3 isRecognizing])
  {
    [(SBVoiceControlViewController *)self _setFeedbackVisible:1 animated:1];
    suggestionsView = self->_suggestionsView;
    [(SiriUISuggestionsView *)suggestionsView startSuggesting];
  }
  else
  {
    self->_wasRecognizing = 0;
  }
}

- (void)recognitionSession:(id)a3 didCompleteActionWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(SBVoiceControlViewController *)self _setFeedbackVisible:0 animated:1];
  [(SiriUISuggestionsView *)self->_suggestionsView stopSuggesting];
  if (v7)
  {
    double v8 = [v7 domain];
    if ([v8 isEqualToString:*MEMORY[0x1E4FB4270]])
    {
      uint64_t v9 = [v7 code];

      if (v9 == -4002)
      {
LABEL_14:
        [(SBVoiceControlViewController *)self _handleButtonUpCancel];
        goto LABEL_25;
      }
    }
    else
    {
    }
    double v10 = SBLogCommon();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SBVoiceControlViewController recognitionSession:didCompleteActionWithError:]();
    }

    if (!self->_wasRecognizing) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  if ([v6 isFinished])
  {
    if (![(VSRecognitionSession *)self->_session isValid])
    {
      [(SBVoiceControlViewController *)self _requestDismissal];
      goto LABEL_25;
    }
    [(SBVoiceControlViewController *)self _configureRoutingIfNeeded];
    if (self->_wasRecognizing)
    {
LABEL_13:
      [(SBVoiceControlViewController *)self _performNoMatchFound];
      goto LABEL_25;
    }
    [(SBVoiceControlViewController *)self _continueWithRecognitionAction];
  }
  else
  {
    [(SBVoiceControlViewController *)self _configureRoutingIfNeeded];
    double v11 = [v6 displayResultString];
    if (v11) {
      [(SBVoiceControlViewController *)self _setTitleText:v11];
    }
    v12 = [v6 displayStatusString];
    [(SBVoiceControlViewController *)self _setStatusText:v12];

    if (self->_wasRecognizing)
    {
      objc_initWeak(&location, self);
      if ([v6 nextActionWillRecognize]) {
        SystemSoundID v13 = 1115;
      }
      else {
        SystemSoundID v13 = 1111;
      }
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke;
      v14[3] = &unk_1E6AF4B10;
      objc_copyWeak(&v15, &location);
      AudioServicesPlaySystemSoundWithCompletion(v13, v14);
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
    else
    {
      [(SBVoiceControlViewController *)self _speakFeedbackText];
    }
  }
LABEL_25:
}

void __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke_2;
  v1[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  _SBVoiceControlDispatchMain(v1);
  objc_destroyWeak(&v2);
}

void __78__SBVoiceControlViewController_recognitionSession_didCompleteActionWithError___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _speakFeedbackText];
}

- (void)recognitionSession:(id)a3 didFinishSpeakingFeedbackStringWithError:(id)a4
{
  id v6 = (VSRecognitionSession *)a3;
  id v7 = a4;
  double v8 = v7;
  if (self->_session == v6)
  {
    if (v7)
    {
      uint64_t v9 = SBLogCommon();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        -[SBVoiceControlViewController recognitionSession:didFinishSpeakingFeedbackStringWithError:]();
      }
    }
    [(SBVoiceControlViewController *)self _continueWithRecognitionAction];
  }
}

- (void)recognitionSession:(id)a3 openURL:(id)a4 completion:(id)a5
{
  v22[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  double v8 = [v6 absoluteString];
  if (![v8 length])
  {

    goto LABEL_5;
  }
  uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4FADBC0]) initWithURL:v6];
  int v10 = [v9 isValid];

  if (!v10)
  {
LABEL_5:
    double v16 = [MEMORY[0x1E4F42738] sharedApplication];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_62;
    v17[3] = &unk_1E6AF5A50;
    id v18 = v7;
    id v11 = v7;
    [v16 openURL:v6 options:MEMORY[0x1E4F1CC08] completionHandler:v17];

    id v15 = v18;
    goto LABEL_6;
  }
  id v11 = (id)objc_opt_new();
  uint64_t v12 = *MEMORY[0x1E4F626A0];
  v21[0] = *MEMORY[0x1E4F62688];
  v21[1] = v12;
  v22[0] = MEMORY[0x1E4F1CC38];
  v22[1] = MEMORY[0x1E4F1CC38];
  SystemSoundID v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
  [v11 setFrontBoardOptions:v13];

  [v11 setSensitive:1];
  double v14 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke;
  v19[3] = &unk_1E6B0E1D0;
  id v20 = v7;
  id v15 = v7;
  [v14 openURL:v6 configuration:v11 completionHandler:v19];

LABEL_6:
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = SBLogCommon();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v10 = *MEMORY[0x1E4FB4270];
      uint64_t v14 = *MEMORY[0x1E4F28A50];
      v15[0] = v6;
      id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
      uint64_t v12 = [v9 errorWithDomain:v10 code:-4007 userInfo:v11];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v12);
    }
  }
  else
  {
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13) {
      (*(void (**)(uint64_t, void))(v13 + 16))(v13, 0);
    }
  }
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_62(uint64_t a1, char a2)
{
  if (a2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    if (v3)
    {
      float v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    id v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_62_cold_1(v5);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    if (v6)
    {
      id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4FB4270] code:-4007 userInfo:0];
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
    }
  }
}

- (BOOL)recognitionSessionWillBeginAction:(id)a3
{
  id v4 = a3;
  int v5 = [(VSRecognitionSession *)self->_session isRecognizing];
  if (v5)
  {
    [(SBVoiceControlViewController *)self _configureRoutingIfNeeded];
    self->_wasRecognizing = 1;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke;
    v7[3] = &unk_1E6AF4B10;
    objc_copyWeak(&v8, &location);
    AudioServicesPlaySystemSoundWithCompletion(0x456u, v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v5 ^ 1;
}

void __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke(uint64_t a1)
{
  v1[0] = MEMORY[0x1E4F143A8];
  v1[1] = 3221225472;
  v1[2] = __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke_2;
  v1[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  _SBVoiceControlDispatchMain(v1);
  objc_destroyWeak(&v2);
}

void __66__SBVoiceControlViewController_recognitionSessionWillBeginAction___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _continueRecognitionAction];
}

- (void)handleHeadsetButtonUpFromButtonDownSource:(BOOL)a3
{
  if (a3)
  {
    if (self->_isHeadsetButtonPressedDown
      && [(VSRecognitionSession *)self->_session hasDeferredAction])
    {
      [(SBVoiceControlViewController *)self _continueRecognitionAction];
    }
  }
  else
  {
    [(SBVoiceControlViewController *)self _handleButtonUpCancel];
  }
  self->_isHeadsetButtonPressedDown = 0;
}

- (BOOL)handleHomeButtonPress
{
  return 1;
}

- (void)performDismissalTransitionAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v4)
  {
    id v8 = (void *)MEMORY[0x1E4F42FF0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke;
    v11[3] = &unk_1E6AF4AC0;
    v11[4] = self;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke_2;
    v9[3] = &unk_1E6AF5A50;
    id v10 = v6;
    [v8 animateWithDuration:v11 animations:v9 completion:0.3];
  }
  else if (v6)
  {
    (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
  }
}

uint64_t __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:0.0];
}

uint64_t __85__SBVoiceControlViewController_performDismissalTransitionAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)performPresentationTransitionAnimated:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  if (v4)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke;
    v11[3] = &unk_1E6AF4AC0;
    v11[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v11];
    id v7 = (void *)MEMORY[0x1E4F42FF0];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_2;
    v10[3] = &unk_1E6AF4AC0;
    v10[4] = self;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_3;
    v8[3] = &unk_1E6AF5A50;
    id v9 = v6;
    [v7 animateWithDuration:v10 animations:v8 completion:0.3];
  }
  else
  {
    [(UIView *)self->_contentView setAlpha:1.0];
    if (v6) {
      (*((void (**)(id, uint64_t))v6 + 2))(v6, 1);
    }
  }
}

uint64_t __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:0.0];
}

uint64_t __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:1.0];
}

uint64_t __88__SBVoiceControlViewController_performPresentationTransitionAnimated_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)resetSessionWithSource:(id)a3
{
  if ([a3 sourceType] == 2) {
    self->_isHeadsetButtonPressedDown = 1;
  }
  [(SBVoiceControlViewController *)self _resetSession];
}

- (void)_avSystemControllerPickableRoutesDidChangeNotification:(id)a3
{
  BOOL v4 = [(SBVoiceControlViewController *)self _currentPreferredRouteDictionary];

  if (!v4)
  {
    [(SBVoiceControlViewController *)self _requestDismissal];
  }
}

- (void)_avSystemControllerHeadphoneJackIsConnectedDidChangeNotification:(id)a3
{
  BOOL v4 = [(SBVoiceControlViewController *)self _currentPreferredRouteDictionary];

  if (!v4)
  {
    [(SBVoiceControlViewController *)self _requestDismissal];
  }
}

- (void)_deviceProximityStateDidChangeNotification:(id)a3
{
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", a3);
  int v5 = [v4 proximityState];
  id v6 = @"Speaker";
  if (v5) {
    id v6 = @"Receiver";
  }
  uint64_t v12 = v6;

  id v7 = v12;
  avAudioRouteName = self->_avAudioRouteName;
  if (avAudioRouteName != (NSString *)v12)
  {
    BOOL v9 = [(NSString *)avAudioRouteName isEqualToString:v12];
    id v7 = v12;
    if (!v9)
    {
      id v10 = (NSString *)[(__CFString *)v12 copy];
      id v11 = self->_avAudioRouteName;
      self->_avAudioRouteName = v10;

      [(SBVoiceControlViewController *)self _setNeedsRoutingUpdate];
      id v7 = v12;
    }
  }
}

- (void)_recognitionSessionKeywordsDidChangeNotification:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __81__SBVoiceControlViewController__recognitionSessionKeywordsDidChangeNotification___block_invoke;
  v3[3] = &unk_1E6AF4AC0;
  v3[4] = self;
  _SBVoiceControlDispatchMain(v3);
}

uint64_t __81__SBVoiceControlViewController__recognitionSessionKeywordsDidChangeNotification___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 1056) = 0;
  [*(id *)(*(void *)(a1 + 32) + 1072) stopSuggesting];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1072);
  return [v2 startSuggesting];
}

- (id)_availableRouteDictionaries
{
  id v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v3 = [v2 attributeForKey:*MEMORY[0x1E4F74C50]];

  return v3;
}

- (void)_configureRoutingIfNeeded
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error changing route: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_continueRecognitionAction
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error continuing action: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_continueWithRecognitionAction
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error beginning next action: %{public}@", v2, v3, v4, v5, v6);
}

void __62__SBVoiceControlViewController__continueWithRecognitionAction__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performConfirmationAction];
}

- (id)_currentPreferredRouteDictionary
{
  uint64_t v3 = [(SBVoiceControlViewController *)self _availableRouteDictionaries];
  uint64_t v4 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  uint64_t v5 = [v4 attributeForKey:*MEMORY[0x1E4F74BE0]];
  int v6 = [v5 BOOLValue];

  if ([(SBVoiceControlViewController *)self shouldDisableVoiceControlForBluetoothRequests])
  {
    uint64_t v7 = 0;
  }
  else if ([(SBVoiceControlPresentationSource *)self->_source sourceType])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = v6 ^ 1u;
  }
  id v8 = [(SBVoiceControlViewController *)self _preferredRouteDictionaryWithAvailableRouteDictionaries:v3 preferredAVAudioRouteName:self->_avAudioRouteName preferredAVAudioRouteUID:self->_avAudioRouteUID shouldPreferBluetooth:v7];

  return v8;
}

- (CGRect)_flamesViewFrame
{
  [(UIView *)self->_contentView bounds];
  double v4 = v3 + -95.0;
  double v5 = 95.0;
  double v6 = 0.0;
  result.size.height = v5;
  result.size.width = v2;
  result.origin.y = v4;
  result.origin.x = v6;
  return result;
}

- (void)_handleButtonUpCancel
{
  id v3 = (id)[(VSRecognitionSession *)self->_session cancelMaintainingKeepAlive:1];
  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke;
  v4[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v5, &location);
  AudioServicesPlaySystemSoundWithCompletion(0x458u, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke(uint64_t a1)
{
  dispatch_time_t v2 = dispatch_time(0, 270000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke_2;
  block[3] = &unk_1E6AF4B10;
  objc_copyWeak(&v4, (id *)(a1 + 32));
  dispatch_after(v2, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v4);
}

void __53__SBVoiceControlViewController__handleButtonUpCancel__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _requestDismissal];
}

- (BOOL)_hasPickableBluetoothDevice
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v2 = [MEMORY[0x1E4F74F68] sharedAVSystemController];
  id v3 = [v2 pickableRoutesForCategory:@"VoiceCommand_WithBluetooth"];

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    uint64_t v7 = (void *)MEMORY[0x1E4F74E10];
    id v8 = (void *)MEMORY[0x1E4F74C38];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "objectForKey:", *v7, (void)v13);
        char v11 = [v10 isEqualToString:*v8];

        if (v11)
        {
          LOBYTE(v5) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v5;
}

- (id)_localizedStringForKey:(id)a3
{
  id v4 = a3;
  localizationKeys = self->_localizationKeys;
  if (!localizationKeys)
  {
    uint64_t v6 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v7 = (const void *)VSRecognitionModelCopyResourceURL();

    if (v7)
    {
      id v8 = (NSDictionary *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfURL:v7];
      BOOL v9 = self->_localizationKeys;
      self->_localizationKeys = v8;

      CFRelease(v7);
    }
    localizationKeys = self->_localizationKeys;
    if (!localizationKeys)
    {
      self->_localizationKeys = (NSDictionary *)MEMORY[0x1E4F1CC08];

      localizationKeys = self->_localizationKeys;
    }
  }
  id v10 = [(NSDictionary *)localizationKeys objectForKey:v4];
  if (!v10)
  {
    char v11 = [MEMORY[0x1E4F28B50] mainBundle];
    id v10 = [v11 localizedStringForKey:v4 value:&stru_1F3084718 table:@"Jibbler"];
  }
  return v10;
}

- (id)_newRecognitionSession
{
  id v3 = objc_alloc_init(MEMORY[0x1E4FB4260]);
  objc_msgSend(v3, "setDebugDumpEnabled:", -[SBVoiceControlViewController isVoiceControlLoggingEnabled](self, "isVoiceControlLoggingEnabled"));
  objc_msgSend(v3, "setSensitiveActionsEnabled:", -[SBVoiceControlViewController shouldAllowSensitiveActions](self, "shouldAllowSensitiveActions"));
  if ([(SBVoiceControlViewController *)self shouldDisableHandlerActions]) {
    [v3 setPerformRecognitionHandlerActions:0];
  }
  [v3 setInputLevelUpdateInterval:0.1];
  [v3 setKeywordPhase:5];
  BOOL v4 = [(SBVoiceControlViewController *)self _hasPickableBluetoothDevice];
  if (v4 || [(SBVoiceControlPresentationSource *)self->_source sourceType] != 1)
  {
    [v3 setBluetoothInputAllowed:v4];
  }
  else
  {
    uint64_t v5 = [(SBVoiceControlPresentationSource *)self->_source bluetoothDevice];
    [v3 setBluetoothInputAllowed:v5 != 0];
  }
  return v3;
}

- (void)_performConfirmationAction
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error performing confirmation action: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_performNoMatchFound
{
  [(SBVoiceControlViewController *)self _setTitleText:0];
  [(SBVoiceControlViewController *)self _setStatusText:0];
  uint64_t v3 = [(SBVoiceControlViewController *)self _localizedStringForKey:@"NO_MATCH_FOUND"];
  objc_initWeak(&location, self);
  inCompletionBlock[0] = MEMORY[0x1E4F143A8];
  inCompletionBlock[1] = 3221225472;
  inCompletionBlock[2] = __52__SBVoiceControlViewController__performNoMatchFound__block_invoke;
  inCompletionBlock[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v7, &location);
  id v4 = v3;
  id v6 = v4;
  AudioServicesPlaySystemSoundWithCompletion(0x45Cu, inCompletionBlock);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __52__SBVoiceControlViewController__performNoMatchFound__block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __52__SBVoiceControlViewController__performNoMatchFound__block_invoke_2;
  v2[3] = &unk_1E6AF5AF0;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  id v3 = *(id *)(a1 + 32);
  _SBVoiceControlDispatchMain(v2);

  objc_destroyWeak(&v4);
}

void __52__SBVoiceControlViewController__performNoMatchFound__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _speakText:*(void *)(a1 + 32)];
}

- (id)_popNextRecognitionAudioInputPath
{
  id v3 = [(NSArray *)self->_nextRecognitionAudioInputPaths lastObject];
  NSUInteger v4 = [(NSArray *)self->_nextRecognitionAudioInputPaths count];
  nextRecognitionAudioInputPaths = self->_nextRecognitionAudioInputPaths;
  if (v4 < 2)
  {
    id v6 = 0;
  }
  else
  {
    -[NSArray subarrayWithRange:](nextRecognitionAudioInputPaths, "subarrayWithRange:", 0, [(NSArray *)self->_nextRecognitionAudioInputPaths count] - 1);
    id v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    nextRecognitionAudioInputPaths = self->_nextRecognitionAudioInputPaths;
  }
  self->_nextRecognitionAudioInputPaths = v6;

  return v3;
}

- (id)_preferredRouteDictionaryWithAvailableRouteDictionaries:(id)a3 preferredAVAudioRouteName:(id)a4 preferredAVAudioRouteUID:(id)a5 shouldPreferBluetooth:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t v10 = (unint64_t)a4;
  unint64_t v11 = (unint64_t)a5;
  if (!(v10 | v11)) {
    goto LABEL_30;
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
  if (!v13)
  {

LABEL_30:
    id v15 = 0;
    id v27 = 0;
    goto LABEL_31;
  }
  uint64_t v14 = v13;
  id v29 = v9;
  id v15 = 0;
  uint64_t v16 = *(void *)v32;
  uint64_t v30 = *(void *)v32;
  while (2)
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v12);
      }
      uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
      if (v11)
      {
        CGFloat v19 = [*(id *)(*((void *)&v31 + 1) + 8 * i) objectForKey:*MEMORY[0x1E4F74E18]];
        if ([v19 hasPrefix:v11])
        {
          id v27 = v18;

          goto LABEL_26;
        }
      }
      if (!v15)
      {
        id v20 = [v18 objectForKey:*MEMORY[0x1E4F74CE8]];
        double v21 = v20;
        if (v10 && v20 && ([v20 isEqualToString:v10] & 1) != 0) {
          goto LABEL_18;
        }
        if (!v6) {
          goto LABEL_19;
        }
        id v22 = v12;
        unint64_t v23 = v10;
        BOOL v24 = v6;
        v25 = [v18 objectForKey:*MEMORY[0x1E4F74E10]];
        int v26 = [v25 isEqualToString:*MEMORY[0x1E4F74C38]];

        if (!v26)
        {
          id v15 = 0;
          BOOL v6 = v24;
          unint64_t v10 = v23;
          id v12 = v22;
          uint64_t v16 = v30;
          goto LABEL_21;
        }
        BOOL v6 = v24;
        unint64_t v10 = v23;
        id v12 = v22;
        uint64_t v16 = v30;
        if (([v21 isEqualToString:@"HeadsetBT"] & 1) != 0
          || [v21 isEqualToString:@"HeadphonesBT"])
        {
LABEL_18:
          id v15 = v18;
        }
        else
        {
LABEL_19:
          id v15 = 0;
        }
LABEL_21:

        continue;
      }
    }
    uint64_t v14 = [v12 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v14) {
      continue;
    }
    break;
  }
  id v27 = 0;
LABEL_26:

  id v9 = v29;
  if (!v27 && v15)
  {
    id v15 = v15;
    id v27 = v15;
  }
LABEL_31:

  return v27;
}

- (void)_requestDismissal
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained voiceControlViewControllerRequestsDismissal:self];
  }
}

- (void)_resetSession
{
  [(SBVoiceControlViewController *)self _setFeedbackVisible:0 animated:1];
  [(SiriUISuggestionsView *)self->_suggestionsView stopSuggesting];
  id v3 = (id)[(VSRecognitionSession *)self->_session cancel];
  [(SBVoiceControlViewController *)self _setTitleText:0];
  [(SBVoiceControlViewController *)self _setStatusText:0];
  id v4 = [(SBVoiceControlViewController *)self _newRecognitionSession];
  [(SBVoiceControlViewController *)self _setSession:v4];
  [(SBVoiceControlViewController *)self _startSession];
  [(SiriUISuggestionsView *)self->_suggestionsView startSuggesting];
}

- (void)_setAVAudioRouteUID:(id)a3
{
  id v8 = a3;
  if ([v8 containsString:@"-"])
  {
    uint64_t v4 = objc_msgSend(v8, "substringToIndex:", objc_msgSend(v8, "rangeOfString:", @"-"));

    uint64_t v5 = (void *)v4;
  }
  else
  {
    uint64_t v5 = v8;
  }
  id v9 = v5;
  BOOL v6 = (NSString *)[v5 copy];
  avAudioRouteUID = self->_avAudioRouteUID;
  self->_avAudioRouteUID = v6;
}

- (void)_setFeedbackVisible:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(SBVoiceControlViewController *)self loadViewIfNeeded];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __61__SBVoiceControlViewController__setFeedbackVisible_animated___block_invoke;
    v8[3] = &unk_1E6AF5D38;
    void v8[4] = self;
    BOOL v9 = v5;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v8 animations:0.25];
    if (v5) {
      return;
    }
LABEL_8:
    [(SiriUISuggestionsView *)self->_suggestionsView stopSuggesting];
    return;
  }
  if (v5) {
    double v7 = 1.0;
  }
  else {
    double v7 = 0.0;
  }
  [(SUICFlamesView *)self->_flamesView setAlpha:v7];
  [(SiriUISuggestionsView *)self->_suggestionsView setAlpha:v7];
  if (!v5) {
    goto LABEL_8;
  }
}

uint64_t __61__SBVoiceControlViewController__setFeedbackVisible_animated___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1008);
  if (*(unsigned char *)(a1 + 40)) {
    double v3 = 1.0;
  }
  else {
    double v3 = 0.0;
  }
  [v2 setAlpha:v3];
  BOOL v4 = *(void **)(*(void *)(a1 + 32) + 1072);
  if (*(unsigned char *)(a1 + 40)) {
    double v5 = 1.0;
  }
  else {
    double v5 = 0.0;
  }
  return [v4 setAlpha:v5];
}

- (void)_setNeedsRoutingUpdate
{
  self->_hasConfiguredRouting = 0;
}

- (void)_setPrefersProximityDetectionEnabled:(BOOL)a3
{
  if (self->_prefersProximityDetectionEnabled != a3)
  {
    self->_prefersProximityDetectionEnabled = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
    if (objc_opt_respondsToSelector()) {
      [WeakRetained voiceControlViewControllerPrefersProximityDetectionEnabledDidChange:self];
    }
  }
}

- (void)_setSession:(id)a3
{
  double v5 = (VSRecognitionSession *)a3;
  p_session = &self->_session;
  session = self->_session;
  unint64_t v11 = v5;
  if (session != v5)
  {
    id v8 = (void *)MEMORY[0x1E4FB4280];
    if (session)
    {
      [(VSRecognitionSession *)session setDelegate:0];
      BOOL v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v9 removeObserver:self name:*v8 object:*p_session];
    }
    objc_storeStrong((id *)&self->_session, a3);
    if (*p_session)
    {
      [(VSRecognitionSession *)*p_session setDelegate:self];
      unint64_t v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v10 addObserver:self selector:sel__recognitionSessionKeywordsDidChangeNotification_ name:*v8 object:*p_session];
    }
  }
}

- (void)_setStatusText:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    [(UILabel *)self->_subtitleLabel setText:v4];
    long long v5 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v15.c = v5;
    *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
    CGAffineTransformMakeTranslation(&v15, 0.0, -10.0);
  }
  else
  {
    long long v6 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&v15.a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&v15.c = v6;
    *(_OWORD *)&v15.tx = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  }
  double v7 = (void *)MEMORY[0x1E4F42FF0];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47__SBVoiceControlViewController__setStatusText___block_invoke;
  v12[3] = &unk_1E6AFA4F0;
  v12[4] = self;
  CGAffineTransform v14 = v15;
  id v13 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __47__SBVoiceControlViewController__setStatusText___block_invoke_2;
  v9[3] = &unk_1E6AF4A98;
  id v10 = v13;
  unint64_t v11 = self;
  id v8 = v13;
  [v7 animateWithDuration:327680 delay:v12 options:v9 animations:0.25 completion:0.0];
}

uint64_t __47__SBVoiceControlViewController__setStatusText___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 1080);
  long long v3 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v3;
  long long v10 = *(_OWORD *)(a1 + 80);
  [v2 setTransform:&v8];
  id v4 = *(void **)(*(void *)(a1 + 32) + 1064);
  long long v5 = *(_OWORD *)(a1 + 64);
  long long v8 = *(_OWORD *)(a1 + 48);
  long long v9 = v5;
  long long v10 = *(_OWORD *)(a1 + 80);
  [v4 setTransform:&v8];
  double v6 = 1.0;
  if (!*(void *)(a1 + 40)) {
    double v6 = 0.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 1064) setAlpha:v6];
}

uint64_t __47__SBVoiceControlViewController__setStatusText___block_invoke_2(uint64_t result)
{
  if (!*(void *)(result + 32)) {
    return [*(id *)(*(void *)(result + 40) + 1064) setText:0];
  }
  return result;
}

- (void)_setTitleText:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
    id v4 = [(SBVoiceControlViewController *)self _localizedStringForKey:@"JIBBLER"];
  }
  id v5 = v4;
  [(UILabel *)self->_titleLabel setText:v4];
}

- (void)_speakFeedbackText
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error speaking text (%{public}@)", v2, v3, v4, v5, v6);
}

- (void)_speakText:(id)a3
{
  uint64_t v4 = [(VSRecognitionSession *)self->_session beginSpeakingString:a3];
  if (v4)
  {
    uint64_t v5 = SBLogCommon();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[SBVoiceControlViewController _speakFeedbackText]();
    }

    [(SBVoiceControlViewController *)self _continueWithRecognitionAction];
  }
}

- (void)_startSession
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error starting recognition: %{public}@", v2, v3, v4, v5, v6);
}

- (double)_titleBaseline
{
  return dbl_1D8FD35D0[(unint64_t)([(SBVoiceControlViewController *)self interfaceOrientation]- 1) < 2];
}

- (double)_subtitleBaseline
{
  return dbl_1D8FD35E0[(unint64_t)([(SBVoiceControlViewController *)self interfaceOrientation]- 1) < 2];
}

- (NSArray)nextRecognitionAudioInputPaths
{
  return self->_nextRecognitionAudioInputPaths;
}

- (void)setNextRecognitionAudioInputPaths:(id)a3
{
}

- (BOOL)prefersProximityDetectionEnabled
{
  return self->_prefersProximityDetectionEnabled;
}

- (BOOL)shouldAllowSensitiveActions
{
  return self->_shouldAllowSensitiveActions;
}

- (void)setShouldAllowSensitiveActions:(BOOL)a3
{
  self->_shouldAllowSensitiveActions = a3;
}

- (BOOL)shouldDisableHandlerActions
{
  return self->_shouldDisableHandlerActions;
}

- (void)setShouldDisableHandlerActions:(BOOL)a3
{
  self->_shouldDisableHandlerActions = a3;
}

- (BOOL)shouldDisableVoiceControlForBluetoothRequests
{
  return self->_shouldDisableVoiceControlForBluetoothRequests;
}

- (void)setShouldDisableVoiceControlForBluetoothRequests:(BOOL)a3
{
  self->_shouldDisableVoiceControlForBluetoothRequests = a3;
}

- (BOOL)isVoiceControlLoggingEnabled
{
  return self->_voiceControlLoggingEnabled;
}

- (void)setVoiceControlLoggingEnabled:(BOOL)a3
{
  self->_voiceControlLoggingEnabled = a3;
}

- (SBVoiceControlViewControllerDelegate)voiceControlDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_voiceControlDelegate);
  return (SBVoiceControlViewControllerDelegate *)WeakRetained;
}

- (void)setVoiceControlDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_voiceControlDelegate);
  objc_storeStrong((id *)&self->_nextRecognitionAudioInputPaths, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_suggestionsView, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_source, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_localizationKeys, 0);
  objc_storeStrong((id *)&self->_flamesView, 0);
  objc_storeStrong((id *)&self->_delayedConfirmationActionTimer, 0);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_avAudioRouteUID, 0);
  objc_storeStrong((id *)&self->_avAudioRouteName, 0);
}

- (void)recognitionSession:didCompleteActionWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Error during session: %{public}@", v2, v3, v4, v5, v6);
}

- (void)recognitionSession:didFinishSpeakingFeedbackStringWithError:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "Speech finished with an error: %{public}@", v2, v3, v4, v5, v6);
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_3(&dword_1D85BA000, v0, v1, "VoiceControl: failed dial request with error %{public}@", v2, v3, v4, v5, v6);
}

void __70__SBVoiceControlViewController_recognitionSession_openURL_completion___block_invoke_62_cold_1(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_1D85BA000, log, OS_LOG_TYPE_ERROR, "VoiceControl: failed to openURL", v1, 2u);
}

@end