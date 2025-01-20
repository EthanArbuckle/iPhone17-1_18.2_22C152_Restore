@interface PXSharedLibraryAssistantSummaryViewController
- (NSProgress)previewProgress;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXLibraryFilterState)libraryFilterState;
- (PXSharedLibraryAssistantSummaryViewController)initWithViewModel:(id)a3 sharedLibraryStatusProvider:(id)a4 libraryFilterState:(id)a5;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryStatusProvider)statusProvider;
- (id)_presentationEnvironment;
- (void)_createPreviewAndCompleteAssistant;
- (void)_previewInvitationAndCompleteAssistant;
- (void)_setIsProcessing:(BOOL)a3;
- (void)cancelShareIfInProgress;
- (void)createPreviewAndCompleteAssistant;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)prepareUIForProcessing:(BOOL)a3;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)setPreviewProgress:(id)a3;
- (void)skipAndContinue;
- (void)updateProgress;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryAssistantSummaryViewController

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if ((void *)PXProgressFractionCompletedObservationContext_142109 == a6)
  {
    v7 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];
      [v8 fractionCompleted];
      *(_DWORD *)buf = 134217984;
      uint64_t v17 = v9;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed observation: %.3f", buf, 0xCu);
    }
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __106__PXSharedLibraryAssistantSummaryViewController_Internal__observeValueForKeyPath_ofObject_change_context___block_invoke;
    v14 = &unk_1E5DD36F8;
    v15 = self;
    px_dispatch_on_main_queue();
  }
  v10.receiver = self;
  v10.super_class = (Class)PXSharedLibraryAssistantSummaryViewController;
  -[PXSharedLibraryAssistantSummaryViewController observeValueForKeyPath:ofObject:change:context:](&v10, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
}

uint64_t __106__PXSharedLibraryAssistantSummaryViewController_Internal__observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProgress];
}

- (void)_previewInvitationAndCompleteAssistant
{
  v4 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  v5 = [v4 sharedLibrary];
  v6 = [v4 sharedLibraryRule];
  uint64_t v7 = [v4 autoSharePolicy];
  v8 = [(PXSharedLibraryAssistantSummaryViewController *)self _presentationEnvironment];
  [(PXSharedLibraryAssistantSummaryViewController *)self _setIsProcessing:1];
  uint64_t v9 = [(PXSharedLibraryAssistantSummaryViewController *)self statusProvider];
  int v10 = [v4 previewIsOutdated];
  uint64_t v11 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __97__PXSharedLibraryAssistantSummaryViewController_Internal___previewInvitationAndCompleteAssistant__block_invoke;
  v13[3] = &unk_1E5DC63E8;
  id v14 = v4;
  SEL v15 = a2;
  v13[4] = self;
  id v12 = v4;
  PXSharedLibraryPreviewInvitation(v9, v5, v6, v7, v10, v11, v8, v13);
}

void __97__PXSharedLibraryAssistantSummaryViewController_Internal___previewInvitationAndCompleteAssistant__block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) _setIsProcessing:0];
  if (a2)
  {
    v4 = [*(id *)(a1 + 32) assistantViewControllerDelegate];
    if (!v4) {
      PXAssertGetLog();
    }
    [v4 completeAssistantForAssistantViewController:*(void *)(a1 + 32)];
    v5 = [*(id *)(a1 + 32) libraryFilterState];
    PXSharedLibraryNavigateToLibraryViewInSharedLibraryViewMode(1, v5);

    v6 = [*(id *)(a1 + 40) infosWithBothPeopleAndParticipants];
    PXSharedLibraryLinkContactsToPeopleForInfos(v6);
  }
}

- (void)_createPreviewAndCompleteAssistant
{
  v4 = [(PXSharedLibraryAssistantSummaryViewController *)self _presentationEnvironment];
  [(PXSharedLibraryAssistantSummaryViewController *)self _setIsProcessing:1];
  v5 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  v6 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__PXSharedLibraryAssistantSummaryViewController_Internal___createPreviewAndCompleteAssistant__block_invoke;
  v7[3] = &unk_1E5DC7060;
  v7[4] = self;
  v7[5] = a2;
  PXSharedLibraryCreatePreview(v5, v6, v4, v7);
}

void __93__PXSharedLibraryAssistantSummaryViewController_Internal___createPreviewAndCompleteAssistant__block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) _setIsProcessing:0];
  if (a2)
  {
    v4 = [*(id *)(a1 + 32) assistantViewControllerDelegate];
    if (!v4) {
      PXAssertGetLog();
    }
    [v4 completeAssistantForAssistantViewController:*(void *)(a1 + 32)];
    v5 = [*(id *)(a1 + 32) libraryFilterState];
    PXSharedLibraryNavigateToLibraryViewInSharedLibraryViewMode(1, v5);

    v6 = [*(id *)(a1 + 32) viewModel];
    uint64_t v7 = [v6 infosWithBothPeopleAndParticipants];
    PXSharedLibraryLinkContactsToPeopleForInfos(v7);
  }
}

- (void)_setIsProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  -[PXSharedLibraryAssistantSummaryViewController prepareUIForProcessing:](self, "prepareUIForProcessing:");
  if (v3)
  {
    id v6 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    [v6 addObserver:self forKeyPath:@"fractionCompleted" options:1 context:PXProgressFractionCompletedObservationContext_142109];
    [(PXSharedLibraryAssistantSummaryViewController *)self setPreviewProgress:v6];
  }
  else
  {
    v5 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];
    [v5 removeObserver:self forKeyPath:@"fractionCompleted" context:PXProgressFractionCompletedObservationContext_142109];

    [(PXSharedLibraryAssistantSummaryViewController *)self setPreviewProgress:0];
  }
}

- (id)_presentationEnvironment
{
  return +[PXViewControllerPresenter defaultPresenterWithViewController:self];
}

- (void)cancelShareIfInProgress
{
  id v6 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  if ([v6 isCancelingAssistant])
  {
    BOOL v3 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];

    if (v3)
    {
      v4 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Create Shared Library Preview", buf, 2u);
      }

      v5 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];
      [v5 cancel];
    }
  }
  else
  {
  }
}

- (void)skipAndContinue
{
  v4 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  uint64_t v5 = [v4 mode];
  if ((unint64_t)(v5 - 1) >= 2)
  {
    if (!v5)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantSummaryViewController+Internal.m" lineNumber:62 description:@"Code which should be unreachable has been reached"];

      abort();
    }
  }
  else
  {
    id v6 = [(PXSharedLibraryAssistantSummaryViewController *)self assistantViewControllerDelegate];
    if (!v6) {
      PXAssertGetLog();
    }
    [v6 stepForwardInAssistantForAssistantViewController:self];
    uint64_t v7 = [v4 infosWithBothPeopleAndParticipants];
    PXSharedLibraryLinkContactsToPeopleForInfos(v7);
  }
}

- (void)createPreviewAndCompleteAssistant
{
  id v6 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  uint64_t v4 = [v6 mode];
  switch(v4)
  {
    case 1:
      [(PXSharedLibraryAssistantSummaryViewController *)self _createPreviewAndCompleteAssistant];
      break;
    case 2:
      [(PXSharedLibraryAssistantSummaryViewController *)self _previewInvitationAndCompleteAssistant];
      break;
    case 0:
      uint64_t v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantSummaryViewController+Internal.m" lineNumber:45 description:@"Code which should be unreachable has been reached"];

      abort();
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_previewProgress, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_progressHeightConstraint, 0);
  objc_storeStrong((id *)&self->_skipPreviewButton, 0);
  objc_storeStrong((id *)&self->_previewButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_progressLabel, 0);
}

- (void)setPreviewProgress:(id)a3
{
}

- (NSProgress)previewProgress
{
  return self->_previewProgress;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (PXSharedLibraryStatusProvider)statusProvider
{
  return self->_statusProvider;
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
  __int16 v6 = a4;
  id v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_240093 != a5)
  {
    int v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantSummaryViewController+iOS.m" lineNumber:186 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 0x1000) != 0)
  {
    id v11 = v9;
    [(PXSharedLibraryAssistantSummaryViewController *)self cancelShareIfInProgress];
    id v9 = v11;
  }
}

- (void)viewDidLoad
{
  v78[12] = *MEMORY[0x1E4F143B8];
  v77.receiver = self;
  v77.super_class = (Class)PXSharedLibraryAssistantSummaryViewController;
  [(OBBaseWelcomeController *)&v77 viewDidLoad];
  BOOL v3 = [(PXSharedLibraryAssistantSummaryViewController *)self headerView];
  uint64_t v4 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_Summary_Title");
  [v3 setTitle:v4];

  uint64_t v5 = [(PXSharedLibraryAssistantSummaryViewController *)self headerView];
  __int16 v6 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  uint64_t v7 = [v6 mode];
  id v9 = PXSharedLibraryAssistantSummaryDetail(v7, v8);
  [v5 setDetailText:v9];

  int v10 = [PXSharedLibraryAssistantSummaryContentView alloc];
  id v11 = [(PXSharedLibraryAssistantSummaryViewController *)self viewModel];
  id v12 = [(PXSharedLibraryAssistantSummaryContentView *)v10 initWithViewModel:v11];

  [(PXSharedLibraryAssistantSummaryContentView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v13 = [PXRoundProgressView alloc];
  id v14 = -[PXRoundProgressView initWithFrame:style:](v13, "initWithFrame:style:", 4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  progressView = self->_progressView;
  self->_progressView = v14;

  [(PXRoundProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  [(PXRoundProgressView *)self->_progressView setHidden:1];
  v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  progressLabel = self->_progressLabel;
  self->_progressLabel = v16;

  [(UILabel *)self->_progressLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_progressLabel setHidden:1];
  uint64_t v18 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28D0]];
  [(UILabel *)self->_progressLabel setFont:v18];

  [(UILabel *)self->_progressLabel setNumberOfLines:0];
  [(UILabel *)self->_progressLabel setTextAlignment:1];
  v19 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_progressLabel setTextColor:v19];

  [(UILabel *)self->_progressLabel setAdjustsFontForContentSizeCategory:1];
  v20 = PXLocalizedSharedLibraryString(@"PXSharedLibraryCreatingPreviewProgressTitle");
  [(UILabel *)self->_progressLabel setText:v20];

  v21 = [(PXSharedLibraryAssistantSummaryViewController *)self secondaryContentView];
  [v21 addSubview:self->_progressView];
  v22 = v21;
  [v21 addSubview:self->_progressLabel];
  v23 = [(PXSharedLibraryAssistantSummaryViewController *)self contentView];
  [v23 addSubview:v12];
  v24 = [(PXRoundProgressView *)self->_progressView heightAnchor];
  v25 = [v24 constraintEqualToConstant:0.0];
  progressHeightConstraint = self->_progressHeightConstraint;
  self->_progressHeightConstraint = v25;

  v61 = (void *)MEMORY[0x1E4F28DC8];
  v75 = [(PXSharedLibraryAssistantSummaryContentView *)v12 centerYAnchor];
  v74 = [v23 centerYAnchor];
  v72 = [v75 constraintEqualToAnchor:v74];
  v78[0] = v72;
  v76 = v12;
  v70 = [(PXSharedLibraryAssistantSummaryContentView *)v12 leadingAnchor];
  v71 = v23;
  v69 = [v23 leadingAnchor];
  v68 = [v70 constraintEqualToSystemSpacingAfterAnchor:v69 multiplier:2.0];
  v78[1] = v68;
  v67 = [v23 trailingAnchor];
  v66 = [(PXSharedLibraryAssistantSummaryContentView *)v12 trailingAnchor];
  v65 = [v67 constraintEqualToSystemSpacingAfterAnchor:v66 multiplier:2.0];
  v78[2] = v65;
  v64 = [(PXRoundProgressView *)self->_progressView topAnchor];
  v63 = [v22 topAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:40.0];
  v78[3] = v62;
  v60 = [(PXRoundProgressView *)self->_progressView leadingAnchor];
  v59 = [v22 leadingAnchor];
  v58 = [v60 constraintEqualToAnchor:v59];
  v78[4] = v58;
  v57 = [(PXRoundProgressView *)self->_progressView trailingAnchor];
  v56 = [v22 trailingAnchor];
  v55 = [v57 constraintEqualToAnchor:v56];
  v78[5] = v55;
  v54 = [(PXRoundProgressView *)self->_progressView widthAnchor];
  v53 = [v54 constraintEqualToConstant:30.0];
  v27 = self->_progressHeightConstraint;
  v78[6] = v53;
  v78[7] = v27;
  v52 = [(PXRoundProgressView *)self->_progressView bottomAnchor];
  v51 = [(UILabel *)self->_progressLabel topAnchor];
  v50 = [v52 constraintEqualToAnchor:v51 constant:-10.0];
  v78[8] = v50;
  v49 = [(UILabel *)self->_progressLabel leadingAnchor];
  v28 = [v22 leadingAnchor];
  v29 = [v49 constraintEqualToAnchor:v28];
  v78[9] = v29;
  v30 = [(UILabel *)self->_progressLabel trailingAnchor];
  v73 = v22;
  v31 = [v22 trailingAnchor];
  v32 = [v30 constraintEqualToAnchor:v31];
  v78[10] = v32;
  v33 = [(UILabel *)self->_progressLabel bottomAnchor];
  v34 = [v22 bottomAnchor];
  v35 = [v33 constraintEqualToAnchor:v34];
  v78[11] = v35;
  v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:12];
  [v61 activateConstraints:v36];

  v37 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v71 setBackgroundColor:v37];

  v38 = [MEMORY[0x1E4F83A80] boldButton];
  previewButton = self->_previewButton;
  self->_previewButton = v38;

  v40 = self->_previewButton;
  v41 = PXSharedLibraryAssistantSummaryStartButtonTitleForMode([(PXSharedLibraryAssistantViewModel *)self->_viewModel mode]);
  [(OBBoldTrayButton *)v40 setTitle:v41 forState:0];

  [(OBBoldTrayButton *)self->_previewButton addTarget:self action:sel_primaryButtonTapped_ forControlEvents:0x2000];
  v42 = [(PXSharedLibraryAssistantSummaryViewController *)self buttonTray];
  [v42 addButton:self->_previewButton];

  v43 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_primaryButtonTapped_];
  [(PXSharedLibraryAssistantSummaryViewController *)self addKeyCommand:v43];

  v44 = [MEMORY[0x1E4F83AB8] linkButton];
  skipPreviewButton = self->_skipPreviewButton;
  self->_skipPreviewButton = v44;

  v46 = self->_skipPreviewButton;
  v47 = PXSharedLibraryAssistantSummaryDeclineButtonTitleForMode([(PXSharedLibraryAssistantViewModel *)self->_viewModel mode]);
  [(OBTrayButton *)v46 setTitle:v47 forState:0];

  [(OBTrayButton *)self->_skipPreviewButton addTarget:self action:sel_secondaryButtonTapped_ forControlEvents:0x2000];
  v48 = [(PXSharedLibraryAssistantSummaryViewController *)self buttonTray];
  [v48 addButton:self->_skipPreviewButton];
}

- (void)updateProgress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(PXSharedLibraryAssistantSummaryViewController *)self previewProgress];
  [v3 fractionCompleted];
  double v5 = v4;

  __int16 v6 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v5;
    _os_log_impl(&dword_1A9AE7000, v6, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed UI update: %.3f", (uint8_t *)&v8, 0xCu);
  }

  *(float *)&double v7 = v5;
  [(PXRoundProgressView *)self->_progressView setProgress:v7];
}

- (void)prepareUIForProcessing:(BOOL)a3
{
  progressView = self->_progressView;
  if (a3)
  {
    [(PXRoundProgressView *)progressView setHidden:0];
    [(NSLayoutConstraint *)self->_progressHeightConstraint setConstant:25.0];
    [(UILabel *)self->_progressLabel setHidden:0];
    [(OBBoldTrayButton *)self->_previewButton setEnabled:0];
    [(OBTrayButton *)self->_skipPreviewButton setEnabled:0];
    [(OBBoldTrayButton *)self->_previewButton setHidden:1];
    [(OBTrayButton *)self->_skipPreviewButton setHidden:1];
    double v5 = [(OBBaseWelcomeController *)self navigationItem];
    [v5 setHidesBackButton:1];

    id v7 = [(PXSharedLibraryAssistantSummaryViewController *)self scrollView];
    __int16 v6 = [(PXSharedLibraryAssistantSummaryViewController *)self secondaryContentView];
    [v6 frame];
    objc_msgSend(v7, "scrollRectToVisible:animated:", 1);
  }
  else
  {
    [(PXRoundProgressView *)progressView setHidden:1];
    [(NSLayoutConstraint *)self->_progressHeightConstraint setConstant:0.0];
    [(UILabel *)self->_progressLabel setHidden:1];
    [(UILabel *)self->_progressLabel setText:0];
    [(OBBoldTrayButton *)self->_previewButton setEnabled:1];
    [(OBTrayButton *)self->_skipPreviewButton setEnabled:1];
    [(OBBoldTrayButton *)self->_previewButton setHidden:0];
    [(OBTrayButton *)self->_skipPreviewButton setHidden:0];
    id v7 = [(OBBaseWelcomeController *)self navigationItem];
    [v7 setHidesBackButton:0];
  }
}

- (PXSharedLibraryAssistantSummaryViewController)initWithViewModel:(id)a3 sharedLibraryStatusProvider:(id)a4 libraryFilterState:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (v10)
  {
    if (v11) {
      goto LABEL_3;
    }
LABEL_8:
    uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantSummaryViewController+iOS.m", 41, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantSummaryViewController+iOS.m", 40, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  uint64_t v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantSummaryViewController+iOS.m", 42, @"Invalid parameter not satisfying: %@", @"libraryFilterState" object file lineNumber description];

LABEL_4:
  v19.receiver = self;
  v19.super_class = (Class)PXSharedLibraryAssistantSummaryViewController;
  v13 = [(PXSharedLibraryAssistantSummaryViewController *)&v19 initWithTitle:&stru_1F00B0030 detailText:0 icon:0 contentLayout:4];
  id v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_viewModel, a3);
    objc_storeStrong((id *)&v14->_statusProvider, a4);
    objc_storeStrong((id *)&v14->_libraryFilterState, a5);
    [(PXSharedLibraryAssistantViewModel *)v14->_viewModel registerChangeObserver:v14 context:PXSharedLibraryAssistantViewModelObservationContext_240093];
  }

  return v14;
}

@end