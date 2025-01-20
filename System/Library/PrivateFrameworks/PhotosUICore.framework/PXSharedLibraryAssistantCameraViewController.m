@interface PXSharedLibraryAssistantCameraViewController
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantCameraViewController)init;
- (id)completionHandler;
- (void)_completeWithAutoSharedEnabled:(BOOL)a3;
- (void)_updateTextView;
- (void)primaryButtonTapped:(id)a3;
- (void)secondaryButtonTapped:(id)a3;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantCameraViewController

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_textView, 0);
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setAssistantViewControllerDelegate:(id)a3
{
}

- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->assistantViewControllerDelegate);
  return (PXAssistantViewControllerDelegate *)WeakRetained;
}

- (void)_completeWithAutoSharedEnabled:(BOOL)a3
{
  PXPreferencesSetCameraAutoShareEnabled(a3);
  PXPreferencesSetCameraSharingPreferencesState(1);
  uint64_t v4 = [(PXSharedLibraryAssistantCameraViewController *)self completionHandler];
  v5 = (void *)v4;
  if (v4)
  {
    (*(void (**)(uint64_t))(v4 + 16))(v4);
  }
  else
  {
    v6 = [(PXSharedLibraryAssistantCameraViewController *)self assistantViewControllerDelegate];
    if (!v6) {
      PXAssertGetLog();
    }
    [v6 stepForwardInAssistantForAssistantViewController:self];
  }
}

- (void)secondaryButtonTapped:(id)a3
{
}

- (void)primaryButtonTapped:(id)a3
{
}

- (void)_updateTextView
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4FB0850] defaultParagraphStyle];
  uint64_t v4 = (void *)[v3 mutableCopy];

  if (PXSharedLibraryAssistantShouldUseAccessibilityLayout()) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 1;
  }
  [v4 setAlignment:v5];
  v10[0] = *MEMORY[0x1E4FB06F8];
  v6 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  v10[1] = *MEMORY[0x1E4FB0738];
  v11[0] = v6;
  v11[1] = v4;
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];

  v8 = PXSharedLibraryLearnMoreString();
  v9 = objc_msgSend(v8, "px_attributedStringByAddingAttributes:", v7);

  [(UITextView *)self->_textView setAttributedText:v9];
}

- (void)traitCollectionDidChange:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryAssistantCameraViewController;
  id v4 = a3;
  [(PXSharedLibraryAssistantCameraViewController *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = [(PXSharedLibraryAssistantCameraViewController *)self traitCollection];
  id v6 = [v5 preferredContentSizeCategory];
  v7 = [v4 preferredContentSizeCategory];

  id v8 = v7;
  if (v6 == v8)
  {
  }
  else
  {
    v9 = v8;
    char v10 = [v6 isEqual:v8];

    if ((v10 & 1) == 0) {
      [(PXSharedLibraryAssistantCameraViewController *)self _updateTextView];
    }
  }
}

- (void)viewDidLoad
{
  v37[4] = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)PXSharedLibraryAssistantCameraViewController;
  [(OBBaseWelcomeController *)&v36 viewDidLoad];
  v3 = objc_alloc_init(PXSharedLibraryAssistantCameraHeaderView);
  [(PXSharedLibraryAssistantCameraHeaderView *)v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXSharedLibraryAssistantCameraHeaderView *)v3 setClipsToBounds:1];
  id v4 = [(PXSharedLibraryAssistantCameraViewController *)self contentView];
  uint64_t v5 = [(PXSharedLibraryAssistantCameraViewController *)self contentView];
  [v5 addSubview:v3];

  v29 = (void *)MEMORY[0x1E4F28DC8];
  v33 = [(PXSharedLibraryAssistantCameraHeaderView *)v3 topAnchor];
  v32 = [v4 topAnchor];
  v31 = [v33 constraintEqualToAnchor:v32];
  v37[0] = v31;
  v30 = [(PXSharedLibraryAssistantCameraHeaderView *)v3 leadingAnchor];
  id v6 = [v4 leadingAnchor];
  v7 = [v30 constraintEqualToAnchor:v6];
  v37[1] = v7;
  v35 = v3;
  id v8 = [(PXSharedLibraryAssistantCameraHeaderView *)v3 trailingAnchor];
  v9 = v4;
  v34 = v4;
  char v10 = [v4 trailingAnchor];
  objc_super v11 = [v8 constraintEqualToAnchor:v10];
  v37[2] = v11;
  v12 = [(PXSharedLibraryAssistantCameraHeaderView *)v3 bottomAnchor];
  v13 = [v9 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v37[3] = v14;
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:4];
  [v29 activateConstraints:v15];

  v16 = [MEMORY[0x1E4FB1618] secondarySystemBackgroundColor];
  v17 = [(PXSharedLibraryAssistantCameraViewController *)self contentView];
  [v17 setBackgroundColor:v16];

  PXSharedLibraryAssistantCreateTextViewForSelectableLinks();
  v18 = (UITextView *)objc_claimAutoreleasedReturnValue();
  textView = self->_textView;
  self->_textView = v18;

  [(UITextView *)self->_textView setTranslatesAutoresizingMaskIntoConstraints:0];
  -[UITextView setTextContainerInset:](self->_textView, "setTextContainerInset:", 2.0, 0.0, 2.0, 0.0);
  v20 = [(UITextView *)self->_textView textContainer];
  [v20 setLineFragmentPadding:0.0];

  v21 = [(PXSharedLibraryAssistantCameraViewController *)self secondaryContentView];
  objc_msgSend(v21, "px_addFullBoundsSubview:", self->_textView);

  [(PXSharedLibraryAssistantCameraViewController *)self _updateTextView];
  v22 = [MEMORY[0x1E4F83A80] boldButton];
  v23 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_CameraRules_ButtonTitle_ShareAutomatically");
  [v22 setTitle:v23 forState:0];

  [v22 addTarget:self action:sel_primaryButtonTapped_ forControlEvents:0x2000];
  v24 = [(PXSharedLibraryAssistantCameraViewController *)self buttonTray];
  [v24 addButton:v22];

  v25 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_primaryButtonTapped_];
  [(PXSharedLibraryAssistantCameraViewController *)self addKeyCommand:v25];

  v26 = [MEMORY[0x1E4F83AB8] linkButton];
  v27 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_CameraRules_ButtonTitle_ShareManually");
  [v26 setTitle:v27 forState:0];

  [v26 addTarget:self action:sel_secondaryButtonTapped_ forControlEvents:0x2000];
  v28 = [(PXSharedLibraryAssistantCameraViewController *)self buttonTray];
  [v28 addButton:v26];
}

- (PXSharedLibraryAssistantCameraViewController)init
{
  v3 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_CameraRules_Title");
  id v4 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_CameraRules_Description");
  v7.receiver = self;
  v7.super_class = (Class)PXSharedLibraryAssistantCameraViewController;
  uint64_t v5 = [(PXSharedLibraryAssistantCameraViewController *)&v7 initWithTitle:v3 detailText:v4 icon:0 contentLayout:4];

  return v5;
}

@end