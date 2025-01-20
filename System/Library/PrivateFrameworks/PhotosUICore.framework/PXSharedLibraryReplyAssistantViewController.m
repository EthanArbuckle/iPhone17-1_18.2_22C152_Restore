@interface PXSharedLibraryReplyAssistantViewController
- (BOOL)_canStepForward;
- (BOOL)wantsToStepForward;
- (OBBoldTrayButton)setupButton;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor;
- (PXSharedLibraryReplyAssistantViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (PXSharedLibraryReplyAssistantViewController)initWithViewModel:(id)a3 legacyDevicesFallbackMonitor:(id)a4;
- (void)_setIsWaitingToStepForward:(BOOL)a3;
- (void)_stepForward;
- (void)_updateImage;
- (void)_updateTextView;
- (void)acceptAndContinue;
- (void)declineInvitation;
- (void)legacyDevicesFallbackMonitorChangedState;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)setSetupButton:(id)a3;
- (void)setWantsToStepForward:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryReplyAssistantViewController

- (void)legacyDevicesFallbackMonitorChangedState
{
  if ([(PXSharedLibraryReplyAssistantViewController *)self _canStepForward]
    && [(PXSharedLibraryReplyAssistantViewController *)self wantsToStepForward])
  {
    v3 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Finished waiting for legacy devices discovery [Receiver Setup]", v4, 2u);
    }

    [(PXSharedLibraryReplyAssistantViewController *)self _setIsWaitingToStepForward:0];
    [(PXSharedLibraryReplyAssistantViewController *)self _stepForward];
  }
}

- (void)declineInvitation
{
  v4 = [(PXSharedLibraryReplyAssistantViewController *)self viewModel];
  v5 = [v4 sharedLibrary];

  v6 = +[PXViewControllerPresenter defaultPresenterWithViewController:self];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__PXSharedLibraryReplyAssistantViewController_Internal__declineInvitation__block_invoke;
  v7[3] = &unk_1E5DC7060;
  v7[4] = self;
  v7[5] = a2;
  PXSharedLibraryDeclineInvitation(v5, v6, @"Assistant", v7);
}

void __74__PXSharedLibraryReplyAssistantViewController_Internal__declineInvitation__block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) assistantViewControllerDelegate];
    if (!v3) {
      PXAssertGetLog();
    }
    [v3 completeAssistantForAssistantViewController:*(void *)(a1 + 32)];
  }
}

- (void)acceptAndContinue
{
  if ([(PXSharedLibraryReplyAssistantViewController *)self _canStepForward])
  {
    [(PXSharedLibraryReplyAssistantViewController *)self _stepForward];
  }
  else
  {
    v3 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A9AE7000, v3, OS_LOG_TYPE_DEFAULT, "PXSharedLibraryLegacyDevice: Begin waiting for legacy devices discovery... [Receiver Setup]", v4, 2u);
    }

    [(PXSharedLibraryReplyAssistantViewController *)self _setIsWaitingToStepForward:1];
  }
}

- (void)_stepForward
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v3 = [(PXSharedLibraryReplyAssistantViewController *)self assistantViewControllerDelegate];
  if (!v3) {
    PXAssertGetLog();
  }
  [v3 stepForwardInAssistantForAssistantViewController:self];
}

- (BOOL)_canStepForward
{
  v2 = [(PXSharedLibraryReplyAssistantViewController *)self legacyDevicesFallbackMonitor];
  v3 = v2;
  if (v2) {
    BOOL v4 = [v2 state] != 0;
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (void)_setIsWaitingToStepForward:(BOOL)a3
{
  BOOL v3 = a3;
  -[PXSharedLibraryReplyAssistantViewController setWantsToStepForward:](self, "setWantsToStepForward:");
  v5 = [(PXSharedLibraryReplyAssistantViewController *)self setupButton];
  id v6 = v5;
  if (v3) {
    [v5 showsBusyIndicator];
  }
  else {
    [v5 hidesBusyIndicator];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_setupButton, 0);
  objc_storeStrong((id *)&self->_legacyDevicesFallbackMonitor, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)setWantsToStepForward:(BOOL)a3
{
  self->_wantsToStepForward = a3;
}

- (BOOL)wantsToStepForward
{
  return self->_wantsToStepForward;
}

- (void)setSetupButton:(id)a3
{
}

- (OBBoldTrayButton)setupButton
{
  return self->_setupButton;
}

- (PXSharedLibraryLegacyDevicesFallbackMonitor)legacyDevicesFallbackMonitor
{
  return self->_legacyDevicesFallbackMonitor;
}

- (PXSharedLibraryAssistantViewModel)viewModel
{
  return self->_viewModel;
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
  if ((a4 & 1) != 0 && (void *)PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext_283665 == a5) {
    [(PXSharedLibraryReplyAssistantViewController *)self legacyDevicesFallbackMonitorChangedState];
  }
}

- (void)_updateTextView
{
  v28[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  BOOL v4 = (void *)[v3 mutableCopy];

  if (PXSharedLibraryAssistantShouldUseAccessibilityLayout()) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 setAlignment:v5];
  uint64_t v6 = *MEMORY[0x1E4FB0700];
  v27[0] = *MEMORY[0x1E4FB0738];
  v27[1] = v6;
  v28[0] = v4;
  v7 = [MEMORY[0x1E4FB1618] labelColor];
  v28[1] = v7;
  v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v28 forKeys:v27 count:2];

  uint64_t v25 = *MEMORY[0x1E4FB06F8];
  uint64_t v9 = v25;
  uint64_t v10 = *MEMORY[0x1E4FB28C8];
  v11 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v26 = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];

  v13 = [MEMORY[0x1E4FB1E20] traitCollectionWithLegibilityWeight:1];
  uint64_t v23 = v9;
  v14 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:v10 compatibleWithTraitCollection:v13];
  v24 = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  v16 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel sharedLibrary];
  v17 = [v16 owner];
  v18 = PXSharedLibraryReplyAssistantAttributedSubtitle(v17, v12, v15);

  v19 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@" "];
  v20 = PXSharedLibraryLearnMoreString();
  v21 = objc_msgSend(v20, "px_attributedStringByAddingAttributes:", v12);

  v22 = (void *)[v18 mutableCopy];
  [v22 appendAttributedString:v19];
  [v22 appendAttributedString:v21];
  objc_msgSend(v22, "addAttributes:range:", v8, 0, objc_msgSend(v22, "length"));
  [(UITextView *)self->_textView setAttributedText:v22];
}

- (void)_updateImage
{
  BOOL v3 = [(PXSharedLibraryReplyAssistantViewController *)self viewIfLoaded];

  if (v3)
  {
    BOOL v4 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel sharedLibrary];
    uint64_t v5 = [v4 owner];

    uint64_t v6 = [(PXSharedLibraryReplyAssistantViewController *)self traitCollection];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __59__PXSharedLibraryReplyAssistantViewController__updateImage__block_invoke;
    v7[3] = &unk_1E5DD0888;
    v7[4] = self;
    v7[5] = v5;
    PXSharedLibraryRequestInvitationImageForOwner(v5, v6, v7);
  }
}

void __59__PXSharedLibraryReplyAssistantViewController__updateImage__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = [*(id *)(a1 + 32) headerView];
    [v7 setIcon:v5 accessibilityLabel:0];
  }
  else
  {
    v7 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v6;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_ERROR, "Error getting image of owner %@ (%@)", (uint8_t *)&v9, 0x16u);
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PXSharedLibraryReplyAssistantViewController;
  [(PXSharedLibraryReplyAssistantViewController *)&v13 traitCollectionDidChange:v4];
  id v5 = [(PXSharedLibraryReplyAssistantViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryReplyAssistantViewController *)self _updateImage];
  }
  uint64_t v8 = [(PXSharedLibraryReplyAssistantViewController *)self traitCollection];
  id v9 = [v8 preferredContentSizeCategory];
  id v10 = [v4 preferredContentSizeCategory];
  if (v9 == v10)
  {
  }
  else
  {
    __int16 v11 = v10;
    char v12 = [v9 isEqual:v10];

    if ((v12 & 1) == 0) {
      [(PXSharedLibraryReplyAssistantViewController *)self _updateTextView];
    }
  }
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryReplyAssistantViewController;
  [(OBBaseWelcomeController *)&v16 viewDidLoad];
  BOOL v3 = [(PXSharedLibraryReplyAssistantViewController *)self headerView];
  id v4 = PXLocalizedSharedLibraryString(@"PXSharedLibraryReplyAssistant_Intro_Title");
  [v3 setTitle:v4];

  [(PXSharedLibraryReplyAssistantViewController *)self _updateImage];
  PXSharedLibraryAssistantCreateTextViewForSelectableLinks();
  id v5 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v5;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [(PXSharedLibraryReplyAssistantViewController *)self contentView];
  objc_msgSend(v7, "px_addFullBoundsSubview:", self->_textView);

  [(PXSharedLibraryReplyAssistantViewController *)self _updateTextView];
  uint64_t v8 = [MEMORY[0x1E4F83A80] boldButton];
  id v9 = PXLocalizedSharedLibraryString(@"PXSharedLibraryReplyAssistant_Intro_ButtonTitle_Start");
  [v8 setTitle:v9 forState:0];

  [v8 addTarget:self action:sel_setupButtonTapped_ forControlEvents:0x2000];
  id v10 = [(PXSharedLibraryReplyAssistantViewController *)self buttonTray];
  [v10 addButton:v8];

  [(PXSharedLibraryReplyAssistantViewController *)self setSetupButton:v8];
  __int16 v11 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_setupButtonTapped_];
  [(PXSharedLibraryReplyAssistantViewController *)self addKeyCommand:v11];

  char v12 = [MEMORY[0x1E4F83AB8] linkButton];
  objc_super v13 = PXLocalizedSharedLibraryString(@"PXSharedLibraryReplyAssistant_Intro_ButtonTitle_Decline");
  [v12 setTitle:v13 forState:0];

  [v12 addTarget:self action:sel_declineButtonTapped_ forControlEvents:0x2000];
  v14 = [(PXSharedLibraryReplyAssistantViewController *)self buttonTray];
  [v14 addButton:v12];

  v15 = [(PXSharedLibraryReplyAssistantViewController *)self headerView];
  [v15 setAllowFullWidthIcon:1];
}

- (PXSharedLibraryReplyAssistantViewController)initWithViewModel:(id)a3 legacyDevicesFallbackMonitor:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"PXSharedLibraryReplyAssistantViewController+iOS.m", 42, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];
  }
  v14.receiver = self;
  v14.super_class = (Class)PXSharedLibraryReplyAssistantViewController;
  id v10 = [(PXSharedLibraryReplyAssistantViewController *)&v14 initWithTitle:&stru_1F00B0030 detailText:0 icon:0 contentLayout:2];
  __int16 v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_viewModel, a3);
    objc_storeStrong((id *)&v11->_legacyDevicesFallbackMonitor, a4);
    [(PXSharedLibraryLegacyDevicesFallbackMonitor *)v11->_legacyDevicesFallbackMonitor registerChangeObserver:v11 context:PXSharedLibraryLegacyDevicesFallbackMonitorObservationContext_283665];
  }

  return v11;
}

- (PXSharedLibraryReplyAssistantViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  objc_super v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryReplyAssistantViewController+iOS.m", 38, @"%s is not available as initializer", "-[PXSharedLibraryReplyAssistantViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

@end