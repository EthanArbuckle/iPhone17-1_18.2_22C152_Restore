@interface VTUIVoiceSelectionViewController
- (VTUIVoiceSelectionViewController)initWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 barButtonItemForContinue:(id)a5 customVoicePreviewer:(id)a6 delegate:(id)a7;
- (VTUIVoiceSelectionViewController)initWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 barButtonItemForContinue:(id)a5 dataManager:(id)a6 customVoicePreviewer:(id)a7 delegate:(id)a8;
- (VTUIVoiceSelectionViewControllerDelegate)delegate;
- (id)_getDetailedText;
- (id)_getTitle;
- (id)_initWithTitle:(id)a3 detailText:(id)a4 recognitionLanguage:(id)a5 compact:(BOOL)a6 allowsRandomSelection:(BOOL)a7 forSelectionStyle:(int64_t)a8 barButtonItemForContinue:(id)a9 dataManager:(id)a10 customVoicePreviewer:(id)a11 delegate:(id)a12;
- (id)chooseForMeButton;
- (id)continueButton;
- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 customVoicePreviewer:(id)a5 delegate:(id)a6;
- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 dataManager:(id)a5 customVoicePreviewer:(id)a6 delegate:(id)a7;
- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 dataManager:(id)a5 customVoicePreviewer:(id)a6 forSelectionStyle:(int64_t)a7 delegate:(id)a8;
- (void)_chooseForMeButtonClicked;
- (void)_continueButtonClicked;
- (void)_dismissButtonClicked;
- (void)_informDelegateVoiceWasSelected:(id)a3 randomlySelected:(BOOL)a4;
- (void)_setupButtons;
- (void)_setupContentForRecognitionLanguage:(id)a3 dataManager:(id)a4 customVoicePreviewer:(id)a5;
- (void)_setupWithTitle:(id)a3 detailText:(id)a4 allowsRandomSelection:(BOOL)a5 compact:(BOOL)a6 forSelectionStyle:(int64_t)a7;
- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4;
- (void)setShouldHideCompactBackgroundCardView:(BOOL)a3;
- (void)updateContainerConstraintsForOrientationChangeToSize:(CGSize)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation VTUIVoiceSelectionViewController

- (id)_initWithTitle:(id)a3 detailText:(id)a4 recognitionLanguage:(id)a5 compact:(BOOL)a6 allowsRandomSelection:(BOOL)a7 forSelectionStyle:(int64_t)a8 barButtonItemForContinue:(id)a9 dataManager:(id)a10 customVoicePreviewer:(id)a11 delegate:(id)a12
{
  BOOL v12 = a7;
  BOOL v13 = a6;
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v29 = a9;
  id v20 = a10;
  id v21 = a11;
  id v22 = a12;
  v30.receiver = self;
  v30.super_class = (Class)VTUIVoiceSelectionViewController;
  v23 = [(VTUIVoiceSelectionViewController *)&v30 init];
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_continueBarButton, a9);
    v24->_allowsRandomSelection = v12;
    objc_storeWeak((id *)&v24->_delegate, v22);
    [(VTUIVoiceSelectionViewController *)v24 _setupWithTitle:v17 detailText:v18 allowsRandomSelection:v12 compact:v13 forSelectionStyle:a8];
    [(VTUIVoiceSelectionViewController *)v24 _setupContentForRecognitionLanguage:v19 dataManager:v20 customVoicePreviewer:v21];
    [(VTUIVoiceSelectionViewController *)v24 _setupButtons];
    if (v13)
    {
      v25 = [(VTUIVoiceSelectionViewController *)v24 view];
      v26 = [MEMORY[0x263F825C8] clearColor];
      [v25 setBackgroundColor:v26];
    }
  }

  return v24;
}

- (VTUIVoiceSelectionViewController)initWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 barButtonItemForContinue:(id)a5 customVoicePreviewer:(id)a6 delegate:(id)a7
{
  BOOL v9 = a4;
  BOOL v12 = (objc_class *)MEMORY[0x263F75458];
  id v13 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  id v17 = objc_alloc_init(v12);
  id v18 = [(VTUIVoiceSelectionViewController *)self initWithRecognitionLanguage:v16 allowsRandomSelection:v9 barButtonItemForContinue:v15 dataManager:v17 customVoicePreviewer:v14 delegate:v13];

  return v18;
}

- (VTUIVoiceSelectionViewController)initWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 barButtonItemForContinue:(id)a5 dataManager:(id)a6 customVoicePreviewer:(id)a7 delegate:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [(VTUIVoiceSelectionViewController *)self _getTitle];
  id v20 = [(VTUIVoiceSelectionViewController *)self _getDetailedText];
  id v21 = [(VTUIVoiceSelectionViewController *)self _initWithTitle:v19 detailText:v20 recognitionLanguage:v18 compact:0 allowsRandomSelection:v11 forSelectionStyle:0 barButtonItemForContinue:v17 dataManager:v16 customVoicePreviewer:v15 delegate:v14];

  return v21;
}

- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 customVoicePreviewer:(id)a5 delegate:(id)a6
{
  BOOL v7 = a4;
  v10 = (objc_class *)MEMORY[0x263F75458];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = objc_alloc_init(v10);
  id v15 = [(VTUIVoiceSelectionViewController *)self initCompactWithRecognitionLanguage:v13 allowsRandomSelection:v7 dataManager:v14 customVoicePreviewer:v12 delegate:v11];

  return v15;
}

- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 dataManager:(id)a5 customVoicePreviewer:(id)a6 delegate:(id)a7
{
  BOOL v9 = a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a3;
  id v16 = [(VTUIVoiceSelectionViewController *)self _getTitle];
  id v17 = [(VTUIVoiceSelectionViewController *)self _getDetailedText];
  id v18 = [(VTUIVoiceSelectionViewController *)self _initWithTitle:v16 detailText:v17 recognitionLanguage:v15 compact:1 allowsRandomSelection:v9 forSelectionStyle:0 barButtonItemForContinue:0 dataManager:v14 customVoicePreviewer:v13 delegate:v12];

  return v18;
}

- (id)initCompactWithRecognitionLanguage:(id)a3 allowsRandomSelection:(BOOL)a4 dataManager:(id)a5 customVoicePreviewer:(id)a6 forSelectionStyle:(int64_t)a7 delegate:(id)a8
{
  BOOL v11 = a4;
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = [(VTUIVoiceSelectionViewController *)self _getTitle];
  id v19 = [(VTUIVoiceSelectionViewController *)self _getDetailedText];
  id v20 = [(VTUIVoiceSelectionViewController *)self _initWithTitle:v18 detailText:v19 recognitionLanguage:v17 compact:1 allowsRandomSelection:v11 forSelectionStyle:a7 barButtonItemForContinue:0 dataManager:v16 customVoicePreviewer:v15 delegate:v14];

  return v20;
}

- (void)_setupWithTitle:(id)a3 detailText:(id)a4 allowsRandomSelection:(BOOL)a5 compact:(BOOL)a6 forSelectionStyle:(int64_t)a7
{
  BOOL v9 = a5;
  id v17 = a3;
  id v12 = a4;
  if (a6)
  {
    id v13 = [[VTUIVoiceSelectionProximityView alloc] initWithTitle:v17 allowsRandomVoiceSelection:v9 forSelectionStyle:a7];
    voiceSelectionContainer = self->_voiceSelectionContainer;
    self->_voiceSelectionContainer = (VTUIVoiceSelectionContaining *)v13;
  }
  else
  {
    id v15 = [[VTUIVoiceSelectionView alloc] initWithAllowsRandomVoiceSelection:v9 showContinueButton:self->_continueBarButton == 0];
    [(VTUIEnrollmentBaseView *)v15 setTitle:v17];
    if (v12) {
      [(VTUIEnrollmentBaseView *)v15 setSubtitle:v12];
    }
    [(VTUIEnrollmentBaseView *)v15 setTitle:v17];
    [(VTUIEnrollmentBaseView *)v15 setSubtitle:v12];
    objc_storeStrong((id *)&self->_voiceSelectionContainer, v15);
    id v16 = (void *)MEMORY[0x263F825C8];
    id v13 = v15;
    voiceSelectionContainer = [v16 systemBackgroundColor];
    [(VTUIVoiceSelectionProximityView *)v13 setBackgroundColor:voiceSelectionContainer];
  }
  [(VTUIVoiceSelectionViewController *)self setView:v13];
}

- (id)_getTitle
{
  v2 = +[VTUIStyle sharedStyle];
  v3 = [v2 VTUIDeviceSpecificString:@"SELECT_VOICE"];

  return v3;
}

- (id)_getDetailedText
{
  v2 = [MEMORY[0x263F32B98] currentAvailability];
  int v3 = [v2 shouldShowGM];
  v4 = @"DESCRIPTION_VOICE_SELECTION";
  if (v3) {
    v4 = @"GM_DESCRIPTION_VOICE_SELECTION";
  }
  v5 = v4;
  v6 = +[VTUIStyle sharedStyle];
  BOOL v7 = [v6 VTUIDeviceSpecificString:v5];

  return v7;
}

- (void)_setupButtons
{
  if (self->_allowsRandomSelection)
  {
    int v3 = [(VTUIVoiceSelectionViewController *)self chooseForMeButton];
    [v3 addTarget:self action:sel__chooseForMeButtonClicked forControlEvents:64];
  }
  v4 = [(VTUIVoiceSelectionContaining *)self->_voiceSelectionContainer dismissButton];
  [v4 addTarget:self action:sel__dismissButtonClicked forControlEvents:64];

  continueBarButton = self->_continueBarButton;
  if (continueBarButton)
  {
    [(UIBarButtonItem *)continueBarButton setTarget:self];
    [(UIBarButtonItem *)self->_continueBarButton setAction:sel__continueButtonClicked];
    v6 = self->_continueBarButton;
    [(UIBarButtonItem *)v6 setEnabled:0];
  }
  else
  {
    id v7 = [(VTUIVoiceSelectionViewController *)self continueButton];
    [v7 addTarget:self action:sel__continueButtonClicked forControlEvents:64];
  }
}

- (void)_setupContentForRecognitionLanguage:(id)a3 dataManager:(id)a4 customVoicePreviewer:(id)a5
{
  id v17 = a5;
  id v8 = a4;
  id v9 = a3;
  v10 = objc_alloc_init(VTUIVoiceSelectionOptionsView);
  if (v17) {
    id v11 = v17;
  }
  else {
    id v11 = objc_alloc_init(MEMORY[0x263F75418]);
  }
  id v12 = v11;
  id v13 = (SUICVoiceSelectionPresenter *)[objc_alloc(MEMORY[0x263F75460]) initWithDataManaging:v8 view:v10 delegate:self voicePreviewing:v11 recognitionLanguage:v9];

  voiceSelectionPresenter = self->_voiceSelectionPresenter;
  self->_voiceSelectionPresenter = v13;

  voiceOptionsView = self->_voiceOptionsView;
  self->_voiceOptionsView = v10;
  id v16 = v10;

  [(VTUIVoiceSelectionContaining *)self->_voiceSelectionContainer setContentView:v16];
}

- (void)viewWillLayoutSubviews
{
  v13[1] = *MEMORY[0x263EF8340];
  v11.receiver = self;
  v11.super_class = (Class)VTUIVoiceSelectionViewController;
  [(VTUIVoiceSelectionViewController *)&v11 viewWillLayoutSubviews];
  if (self->_voiceOptionsViewHeightConstraint)
  {
    int v3 = (void *)MEMORY[0x263F08938];
    v13[0] = self->_voiceOptionsViewHeightConstraint;
    v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v13 count:1];
    [v3 deactivateConstraints:v4];
  }
  v5 = [(VTUIVoiceSelectionOptionsView *)self->_voiceOptionsView heightAnchor];
  -[VTUIVoiceSelectionOptionsView sizeThatFits:](self->_voiceOptionsView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  id v7 = [v5 constraintEqualToConstant:v6];
  voiceOptionsViewHeightConstraint = self->_voiceOptionsViewHeightConstraint;
  self->_voiceOptionsViewHeightConstraint = v7;

  id v9 = (void *)MEMORY[0x263F08938];
  id v12 = self->_voiceOptionsViewHeightConstraint;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v12 count:1];
  [v9 activateConstraints:v10];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VTUIVoiceSelectionViewController;
  [(VTUIVoiceSelectionViewController *)&v7 viewWillAppear:a3];
  v4 = [(VTUIVoiceSelectionViewController *)self chooseForMeButton];
  v5 = [(VTUIVoiceSelectionViewController *)self chooseForMeButton];
  double v6 = [v5 tintColor];
  [v4 setTitleColor:v6 forState:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)VTUIVoiceSelectionViewController;
  [(VTUIVoiceSelectionViewController *)&v4 viewWillDisappear:a3];
  [(SUICVoiceSelectionPresenter *)self->_voiceSelectionPresenter stopVoicePreview];
}

- (void)_continueButtonClicked
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[VTUIVoiceSelectionViewController _continueButtonClicked]";
  _os_log_error_impl(&dword_238878000, log, OS_LOG_TYPE_ERROR, "%s voice selection nil when continue button was enabled", (uint8_t *)&v1, 0xCu);
}

- (void)_chooseForMeButtonClicked
{
  self->shouldReportSelectionOnRandomVoicePlayBackCompletion = 1;
  objc_initWeak(&location, self);
  voiceSelectionPresenter = self->_voiceSelectionPresenter;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke;
  v4[3] = &unk_264D4C9F0;
  objc_copyWeak(&v5, &location);
  [(SUICVoiceSelectionPresenter *)voiceSelectionPresenter selectRandomVoiceWithCompletion:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    if (v3)
    {
      if (WeakRetained[1040])
      {
        [WeakRetained _informDelegateVoiceWasSelected:v3 randomlySelected:1];
      }
      else
      {
        objc_super v7 = VTUILogContextFacility;
        if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_DEFAULT))
        {
          int v8 = 136315394;
          id v9 = "-[VTUIVoiceSelectionViewController _chooseForMeButtonClicked]_block_invoke";
          __int16 v10 = 2112;
          id v11 = v3;
          _os_log_impl(&dword_238878000, v7, OS_LOG_TYPE_DEFAULT, "%s %@ voice already reported due to continue press before playback completion", (uint8_t *)&v8, 0x16u);
        }
      }
    }
    else
    {
      double v6 = VTUILogContextFacility;
      if (os_log_type_enabled((os_log_t)VTUILogContextFacility, OS_LOG_TYPE_ERROR)) {
        __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke_cold_1(v6);
      }
    }
    v5[1040] = 0;
  }
}

- (void)_informDelegateVoiceWasSelected:(id)a3 randomlySelected:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_super v7 = [(VTUIVoiceSelectionViewController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  id v9 = [(VTUIVoiceSelectionViewController *)self delegate];
  id v10 = v9;
  if (v8) {
    [v9 voiceSelectionController:self didSelectVoice:v6 randomlySelected:v4];
  }
  else {
    [v9 voiceSelectionController:self didSelectVoice:v6];
  }
}

- (void)_dismissButtonClicked
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = objc_loadWeakRetained((id *)p_delegate);
    [v6 voiceSelectionControllerRequestsDismissal:self];
  }
}

- (void)updateContainerConstraintsForOrientationChangeToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if (objc_opt_respondsToSelector())
  {
    voiceSelectionContainer = self->_voiceSelectionContainer;
    -[VTUIVoiceSelectionContaining updateContainerConstraintsForOrientationChangeToSize:](voiceSelectionContainer, "updateContainerConstraintsForOrientationChangeToSize:", width, height);
  }
}

- (void)presenter:(id)a3 didChangeVoiceSelection:(id)a4
{
  char v5 = (AFVoiceInfo *)a4;
  continueBarButton = self->_continueBarButton;
  if (continueBarButton)
  {
    [(UIBarButtonItem *)continueBarButton setEnabled:v5 != 0];
  }
  else
  {
    objc_super v7 = [(VTUIVoiceSelectionViewController *)self continueButton];
    [v7 setEnabled:v5 != 0];
  }
  currentVoiceSelection = self->_currentVoiceSelection;
  self->_currentVoiceSelection = v5;
}

- (id)continueButton
{
  return (id)[(VTUIVoiceSelectionContaining *)self->_voiceSelectionContainer continueButton];
}

- (id)chooseForMeButton
{
  return (id)[(VTUIVoiceSelectionContaining *)self->_voiceSelectionContainer chooseRandomVoiceButton];
}

- (void)setShouldHideCompactBackgroundCardView:(BOOL)a3
{
  BOOL v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    voiceSelectionContainer = self->_voiceSelectionContainer;
    [(VTUIVoiceSelectionContaining *)voiceSelectionContainer setShouldHideCompactBackgroundCardView:v3];
  }
}

- (VTUIVoiceSelectionViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VTUIVoiceSelectionViewControllerDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_continueBarButton, 0);
  objc_storeStrong((id *)&self->_currentVoiceSelection, 0);
  objc_storeStrong((id *)&self->_voiceSelectionContainer, 0);
  objc_storeStrong((id *)&self->_style, 0);
  objc_storeStrong((id *)&self->_voiceOptionsViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_voiceOptionsView, 0);
  objc_storeStrong((id *)&self->_voiceSelectionPresenter, 0);
}

void __61__VTUIVoiceSelectionViewController__chooseForMeButtonClicked__block_invoke_cold_1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  v2 = "-[VTUIVoiceSelectionViewController _chooseForMeButtonClicked]_block_invoke";
  _os_log_error_impl(&dword_238878000, log, OS_LOG_TYPE_ERROR, "%s Random voice was nil", (uint8_t *)&v1, 0xCu);
}

@end