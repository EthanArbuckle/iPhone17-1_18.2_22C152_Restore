@interface PXSharedLibraryAssistantWelcomeViewController
- (BOOL)_isLegacyDevicesFallbackMonitorEnabledAndReady;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantWelcomeViewController)initWithLegacyDevicesFallbackMonitor:(id)a3 legacyDevicesRemoteController:(id)a4;
- (double)_contentViewHeight;
- (void)_checkLegacyDeviceMonitorAndAttemptStepForward;
- (void)_forceStepForward;
- (void)_legacyDevicesFallbackMonitorChangedState;
- (void)_legacyDevicesRemoteControllerChangedState;
- (void)_updateTextView;
- (void)cancelButtonTapped:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)startButtonTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantWelcomeViewController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_startButton, 0);
  objc_storeStrong((id *)&self->_textView, 0);
  objc_storeStrong((id *)&self->_legacyDevicesRemoteController, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
  return (PXAssistantViewControllerDelegate *)WeakRetained;
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_8;
    }
    id v11 = v9;
    [(PXSharedLibraryAssistantWelcomeViewController *)self _legacyDevicesFallbackMonitorChangedState];
    goto LABEL_7;
  }
  if ((void *)PXSharedLibraryLegacyDevicesRemoteControllerObservationContext != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantWelcomeViewController.m" lineNumber:231 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if (v6)
  {
    id v11 = v9;
    [(PXSharedLibraryAssistantWelcomeViewController *)self _legacyDevicesRemoteControllerChangedState];
LABEL_7:
    id v9 = v11;
  }
LABEL_8:
}

- (void)_legacyDevicesRemoteControllerChangedState
{
  switch([(PXSharedLibraryLegacyDevicesRemoteController *)self->_legacyDevicesRemoteController state])
  {
    case 0:
    case 2:
      startButton = self->_startButton;
      [(OBBoldTrayButton *)startButton hidesBusyIndicator];
      break;
    case 1:
      v4 = self->_startButton;
      [(OBBoldTrayButton *)v4 showsBusyIndicator];
      break;
    case 3:
      [(OBBoldTrayButton *)self->_startButton hidesBusyIndicator];
      [(PXSharedLibraryAssistantWelcomeViewController *)self _forceStepForward];
      break;
    case 4:
      [(OBBoldTrayButton *)self->_startButton hidesBusyIndicator];
      [(PXSharedLibraryAssistantWelcomeViewController *)self _checkLegacyDeviceMonitorAndAttemptStepForward];
      break;
    default:
      return;
  }
}

- (void)_legacyDevicesFallbackMonitorChangedState
{
  if ([(PXSharedLibraryAssistantWelcomeViewController *)self _isLegacyDevicesFallbackMonitorEnabledAndReady]&& self->_wantsToStepForward)
  {
    v3 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Finished waiting for legacy devices discovery [Sender Setup]", v4, 2u);
    }

    [(OBBoldTrayButton *)self->_startButton hidesBusyIndicator];
    [(PXSharedLibraryAssistantWelcomeViewController *)self _forceStepForward];
  }
}

- (void)_forceStepForward
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3 = [(PXSharedLibraryAssistantWelcomeViewController *)self assistantViewControllerDelegate];
  if (!v3) {
    PXAssertGetLog();
  }
  [v3 stepForwardInAssistantForAssistantViewControllerAsCurrentViewController:self];
}

- (void)_checkLegacyDeviceMonitorAndAttemptStepForward
{
  if ([(PXSharedLibraryAssistantWelcomeViewController *)self _isLegacyDevicesFallbackMonitorEnabledAndReady])
  {
    [(PXSharedLibraryAssistantWelcomeViewController *)self _forceStepForward];
  }
  else
  {
    v3 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Begin waiting for legacy devices discovery... [Sender Setup]", v4, 2u);
    }

    self->_wantsToStepForward = 1;
    [(OBBoldTrayButton *)self->_startButton showsBusyIndicator];
  }
}

- (BOOL)_isLegacyDevicesFallbackMonitorEnabledAndReady
{
  legacyDevicesFallbackMonitor = self->_legacyDevicesFallbackMonitor;
  return !legacyDevicesFallbackMonitor
      || [(PXSharedLibraryLegacyDevicesFallbackMonitor *)legacyDevicesFallbackMonitor state] != 0;
}

- (void)cancelButtonTapped:(id)a3
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(PXSharedLibraryAssistantWelcomeViewController *)self assistantViewControllerDelegate];
  if (!v4) {
    PXAssertGetLog();
  }
  [v4 cancelAssistantForAssistantViewController:self];
}

- (void)startButtonTapped:(id)a3
{
  legacyDevicesRemoteController = self->_legacyDevicesRemoteController;
  if (legacyDevicesRemoteController) {
    [(PXSharedLibraryLegacyDevicesRemoteController *)legacyDevicesRemoteController beginRemoteUIRequestWithPresenter:self];
  }
  else {
    [(PXSharedLibraryAssistantWelcomeViewController *)self _checkLegacyDeviceMonitorAndAttemptStepForward];
  }
}

- (void)_updateTextView
{
  v14[3] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (PXSharedLibraryAssistantShouldUseAccessibilityLayout()) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 setAlignment:v5];
  v13[0] = *MEMORY[0x1E4FB06F8];
  char v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  uint64_t v7 = *MEMORY[0x1E4FB0738];
  v14[0] = v6;
  v14[1] = v4;
  uint64_t v8 = *MEMORY[0x1E4FB0700];
  v13[1] = v7;
  v13[2] = v8;
  id v9 = [MEMORY[0x1E4FB1618] labelColor];
  v14[2] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:3];

  id v11 = PXSharedLibraryLearnMoreStringWithKey(@"PXSharedLibrarySetupAssistant_Welcome_Body");
  v12 = objc_msgSend(v11, "px_attributedStringByAddingAttributes:", v10);
  [(UITextView *)self->_textView setAttributedText:v12];
}

- (double)_contentViewHeight
{
  return 228.0;
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXSharedLibraryAssistantWelcomeViewController;
  [(PXSharedLibraryAssistantWelcomeViewController *)&v4 traitCollectionDidChange:a3];
  [(PXSharedLibraryAssistantWelcomeViewController *)self _updateTextView];
}

- (void)viewDidLoad
{
  v52[2] = *MEMORY[0x1E4F143B8];
  v50.receiver = self;
  v50.super_class = (Class)PXSharedLibraryAssistantWelcomeViewController;
  [(OBBaseWelcomeController *)&v50 viewDidLoad];
  v3 = [(PXSharedLibraryAssistantWelcomeViewController *)self headerView];
  objc_super v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Welcome_Title");
  v49 = v3;
  [v3 setTitle:v4];

  uint64_t v5 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupAssistant_Welcome_Subtitle");
  [v3 setDetailText:v5];

  id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4FB1818], "px_imageNamed:", @"SharedLibrarySetup");
  uint64_t v8 = (void *)[v6 initWithImage:v7];

  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v9 = [(PXSharedLibraryAssistantWelcomeViewController *)self contentView];
  v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v9 setBackgroundColor:v10];

  [v9 addSubview:v8];
  id v11 = (void *)MEMORY[0x1E4F28DC8];
  v48 = v8;
  v12 = [v8 topAnchor];
  v47 = v9;
  v13 = [v9 topAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v52[0] = v14;
  v15 = [v8 centerXAnchor];
  v16 = [v9 centerXAnchor];
  v17 = [v15 constraintEqualToAnchor:v16];
  v52[1] = v17;
  v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v52 count:2];
  [v11 activateConstraints:v18];

  v19 = [(PXSharedLibraryAssistantWelcomeViewController *)self secondaryContentView];
  PXSharedLibraryAssistantCreateTextViewForSelectableLinks();
  v20 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v20;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  v22 = [(PXSharedLibraryAssistantWelcomeViewController *)self secondaryContentView];
  [v22 addSubview:self->_textView];

  v41 = (void *)MEMORY[0x1E4F28DC8];
  v45 = [(UITextView *)self->_textView topAnchor];
  v44 = [v19 topAnchor];
  v43 = [v45 constraintEqualToSystemSpacingBelowAnchor:v44 multiplier:1.0];
  v51[0] = v43;
  v42 = [(UITextView *)self->_textView bottomAnchor];
  v23 = [v19 bottomAnchor];
  v24 = [v42 constraintEqualToAnchor:v23];
  v51[1] = v24;
  v25 = [(UITextView *)self->_textView leadingAnchor];
  v46 = v19;
  v26 = [v19 leadingAnchor];
  v27 = [v25 constraintEqualToAnchor:v26];
  v51[2] = v27;
  v28 = [(UITextView *)self->_textView trailingAnchor];
  v29 = [v19 trailingAnchor];
  v30 = [v28 constraintEqualToAnchor:v29];
  v51[3] = v30;
  v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:4];
  [v41 activateConstraints:v31];

  [(PXSharedLibraryAssistantWelcomeViewController *)self _updateTextView];
  v32 = [MEMORY[0x1E4F83A80] boldButton];
  startButton = self->_startButton;
  self->_startButton = v32;

  v34 = self->_startButton;
  v35 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_Start");
  [(OBBoldTrayButton *)v34 setTitle:v35 forState:0];

  [(OBBoldTrayButton *)self->_startButton addTarget:self action:sel_startButtonTapped_ forControlEvents:0x2000];
  v36 = [(PXSharedLibraryAssistantWelcomeViewController *)self buttonTray];
  [v36 addButton:self->_startButton];

  v37 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_startButtonTapped_];
  [(PXSharedLibraryAssistantWelcomeViewController *)self addKeyCommand:v37];

  v38 = [MEMORY[0x1E4F83AB8] linkButton];
  v39 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ButtonTitle_NotNow");
  [v38 setTitle:v39 forState:0];

  [v38 addTarget:self action:sel_cancelButtonTapped_ forControlEvents:0x2000];
  v40 = [(PXSharedLibraryAssistantWelcomeViewController *)self buttonTray];
  [v40 addButton:v38];
}

- (PXSharedLibraryAssistantWelcomeViewController)initWithLegacyDevicesFallbackMonitor:(id)a3 legacyDevicesRemoteController:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXSharedLibraryAssistantWelcomeViewController;
  id v9 = [(PXSharedLibraryAssistantWelcomeViewController *)&v12 initWithTitle:&stru_1F00B0030 detailText:0 icon:0 contentLayout:4];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_legacyDevicesFallbackMonitor, a3);
    [(PXSharedLibraryLegacyDevicesFallbackMonitor *)v10->_legacyDevicesFallbackMonitor registerChangeObserver:v10 context:PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext];
    objc_storeStrong((id *)&v10->_legacyDevicesRemoteController, a4);
    [(PXSharedLibraryLegacyDevicesRemoteController *)v10->_legacyDevicesRemoteController registerChangeObserver:v10 context:PXSharedLibraryLegacyDevicesRemoteControllerObservationContext];
  }

  return v10;
}

@end