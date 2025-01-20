@interface PXSharedLibraryAssistantReviewParticipantsViewController
- (BOOL)shouldHideBackButton;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantReviewParticipantsViewController)initWithViewModel:(id)a3 participantViewModel:(id)a4 sharedLibraryStatusProvider:(id)a5;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryStatusProvider)statusProvider;
- (void)_cancelShareIfInProgress;
- (void)_finishAssistantWithInvitationTransport:(int64_t)a3 sourceItem:(id)a4;
- (void)_setIsProcessing:(BOOL)a3;
- (void)_updateActionButtons;
- (void)_updateCaptionText;
- (void)_updateHeaderDetailText;
- (void)_updateIcon;
- (void)_updateNavigationItem;
- (void)_updateProgress;
- (void)_updateTableViewInteractability;
- (void)_updateTableViewLayoutConstraints;
- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forSharedLibraryParticipantTableViewController:(id)a4;
- (void)inviteButtonTapped:(id)a3;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 forSharedLibraryParticipantTableViewController:(id)a5;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)shareButtonTapped:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PXSharedLibraryAssistantReviewParticipantsViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
  objc_storeStrong((id *)&self->_shareProgress, 0);
  objc_storeStrong((id *)&self->_shareButton, 0);
  objc_storeStrong((id *)&self->_shareInMessagesButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_spinnerView, 0);
  objc_storeStrong((id *)&self->_tableViewLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_participantViewModel, 0);
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

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ((void *)PXProgressFractionCompletedObservationContext_301416 == a6)
  {
    v7 = PLSharedLibraryGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      [(NSProgress *)self->_shareProgress fractionCompleted];
      *(_DWORD *)buf = 134217984;
      uint64_t v16 = v8;
      _os_log_impl(&dword_1A9AE7000, v7, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed observation: %.3f", buf, 0xCu);
    }

    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    v12 = __107__PXSharedLibraryAssistantReviewParticipantsViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v13 = &unk_1E5DD36F8;
    v14 = self;
    px_dispatch_on_main_queue();
  }
  v9.receiver = self;
  v9.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  -[PXSharedLibraryAssistantReviewParticipantsViewController observeValueForKeyPath:ofObject:change:context:](&v9, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
}

uint64_t __107__PXSharedLibraryAssistantReviewParticipantsViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateProgress];
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forSharedLibraryParticipantTableViewController:(id)a4
{
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 forSharedLibraryParticipantTableViewController:(id)a5
{
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  id v9 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_301420 != a5)
  {
    uint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m" lineNumber:289 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  id v11 = v9;
  if ((a4 & 0x10) != 0) {
    [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateIcon];
  }
  if ((a4 & 0x20) != 0) {
    [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateActionButtons];
  }
  if (((+[PXSharedLibraryAssistantViewModel shareCountChangeDescriptors] | 0x20) & a4) != 0)[(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateHeaderDetailText]; {
  if ((a4 & 0x1000) != 0)
  }
    [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _cancelShareIfInProgress];
}

- (void)_cancelShareIfInProgress
{
  id v5 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self viewModel];
  if ([v5 isCancelingAssistant])
  {
    shareProgress = self->_shareProgress;

    if (shareProgress)
    {
      v4 = PLSharedLibraryGetLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Canceled by the user: Publish Shared Library", buf, 2u);
      }

      [(NSProgress *)self->_shareProgress cancel];
    }
  }
  else
  {
  }
}

- (void)_updateProgress
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(NSProgress *)self->_shareProgress fractionCompleted];
  double v4 = v3;
  id v5 = PLSharedLibraryGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 134217984;
    double v9 = v4;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Preview progress fraction completed UI update: %.3f", (uint8_t *)&v8, 0xCu);
  }

  spinnerView = self->_spinnerView;
  if (v4 <= 0.0)
  {
    [(UIActivityIndicatorView *)spinnerView startAnimating];
    [(PXRoundProgressView *)self->_progressView setHidden:1];
  }
  else
  {
    [(UIActivityIndicatorView *)spinnerView stopAnimating];
    [(PXRoundProgressView *)self->_progressView setHidden:0];
    *(float *)&double v7 = v4;
    [(PXRoundProgressView *)self->_progressView setProgress:v7];
  }
}

- (void)_updateCaptionText
{
  if (self->_shareProgress)
  {
    double v3 = &stru_1F00B0030;
  }
  else
  {
    PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupDataRetentionInfoOwner");
    double v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v3;
  uint64_t v4 = [(__CFString *)v3 length];
  id v5 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self buttonTray];
  v6 = v5;
  if (v4)
  {
    double v7 = (void *)MEMORY[0x1E4F1CB10];
    int IsIPad = PLPhysicalDeviceIsIPad();
    double v9 = @"https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ios_ui-05052022";
    if (IsIPad) {
      double v9 = @"https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ipados_ui-05052022";
    }
    uint64_t v10 = v9;
    id v11 = [v7 URLWithString:v10];
    [v6 setCaptionText:v12 learnMoreURL:v11];
  }
  else
  {
    [v5 setCaptionText:v12];
  }
}

- (void)_updateTableViewInteractability
{
  double v3 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel sharedLibrary];
  char v4 = [v3 isPublished];

  BOOL v5 = (v4 & 1) == 0 && self->_shareProgress == 0;
  tableViewController = self->_tableViewController;
  [(PXSharedLibraryParticipantTableViewController *)tableViewController setInteractionEnabled:v5];
}

- (void)_updateHeaderDetailText
{
  double v3 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self viewModel];
  char v4 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self headerView];
  BOOL v5 = [v3 localizedParticipantList];
  v6 = [v3 participantDataSource];
  uint64_t v7 = [v6 numberOfParticipants];
  if (v3) {
    [v3 shareCounts];
  }
  else {
    memset(v9, 0, sizeof(v9));
  }
  int v8 = PXSharedLibraryAssistantReviewParticipantsSubtitle(v5, v7, v9);
  [v4 setDetailText:v8];
}

- (void)_updateIcon
{
  double v3 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self viewModel];
  char v4 = [v3 participantsImage];
  BOOL v5 = v4;
  if (!v4) {
    PXSharedLibraryCreatePlatterImage(@"person.2.fill", 0);
  }
  id v7 = v4;

  v6 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self headerView];
  [v6 setIcon:v7 accessibilityLabel:0];
}

- (void)_updateActionButtons
{
  double v3 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel participantDataSource];
  shareProgress = self->_shareProgress;
  id v10 = v3;
  if (shareProgress)
  {
    [(OBBoldTrayButton *)self->_shareInMessagesButton setEnabled:0];
  }
  else
  {
    BOOL v5 = [v3 emailAddresses];
    if ([v5 count])
    {
      [(OBBoldTrayButton *)self->_shareInMessagesButton setEnabled:1];
    }
    else
    {
      v6 = [v10 phoneNumbers];
      -[OBBoldTrayButton setEnabled:](self->_shareInMessagesButton, "setEnabled:", [v6 count] != 0);
    }
  }
  [(OBLinkTrayButton *)self->_shareButton setEnabled:shareProgress == 0];
  if ([v10 numberOfParticipants] < 1)
  {
    self->_shareButtonTransport = 0;
    shareButton = self->_shareButton;
    int v8 = @"PXSharedLibraryAssistant_ReviewRecipients_ButtonTitle_inviteLater";
  }
  else
  {
    self->_shareButtonTransport = 2;
    shareButton = self->_shareButton;
    int v8 = @"PXSharedLibraryAssistant_ReviewRecipients_ButtonTitle_shareLink";
  }
  double v9 = PXLocalizedSharedLibraryString(v8);
  [(OBLinkTrayButton *)shareButton setTitle:v9 forState:0];
}

- (void)_updateNavigationItem
{
  BOOL v3 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self shouldHideBackButton];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setHidesBackButton:v3];
}

- (void)_updateTableViewLayoutConstraints
{
  v10[1] = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_tableViewLayoutConstraints];
  [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController tableViewHeight];
  double v4 = v3;
  BOOL v5 = [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController tableView];
  v6 = [v5 heightAnchor];
  id v7 = [v6 constraintEqualToConstant:v4];
  v10[0] = v7;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
  tableViewLayoutConstraints = self->_tableViewLayoutConstraints;
  self->_tableViewLayoutConstraints = v8;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_tableViewLayoutConstraints];
}

- (void)_setIsProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self buttonTray];
  if (objc_opt_respondsToSelector())
  {
    v6 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self buttonTray];
    id v10 = [v6 stackView];
  }
  else
  {
    id v10 = 0;
  }

  if (v3)
  {
    id v7 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:1];
    shareProgress = self->_shareProgress;
    self->_shareProgress = v7;

    [(NSProgress *)self->_shareProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:PXProgressFractionCompletedObservationContext_301416];
    [v10 insertArrangedSubview:self->_progressView atIndex:0];
    [v10 setCustomSpacing:self->_progressView afterView:10.0];
    [v10 insertArrangedSubview:self->_spinnerView atIndex:1];
    [v10 setCustomSpacing:self->_spinnerView afterView:12.0];
    [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateProgress];
  }
  else
  {
    [(PXRoundProgressView *)self->_progressView removeFromSuperview];
    [(UIActivityIndicatorView *)self->_spinnerView removeFromSuperview];
    [(NSProgress *)self->_shareProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PXProgressFractionCompletedObservationContext_301416];
    double v9 = self->_shareProgress;
    self->_shareProgress = 0;
  }
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateNavigationItem];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateTableViewInteractability];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateCaptionText];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateActionButtons];
  [(OBBoldTrayButton *)self->_shareInMessagesButton setEnabled:!v3];
}

- (void)_finishAssistantWithInvitationTransport:(int64_t)a3 sourceItem:(id)a4
{
  v6 = +[PXViewControllerPresenter popoverPresenterWithViewController:self sourceItem:a4];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _setIsProcessing:1];
  id v7 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self statusProvider];
  viewModel = self->_viewModel;
  shareProgress = self->_shareProgress;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __111__PXSharedLibraryAssistantReviewParticipantsViewController__finishAssistantWithInvitationTransport_sourceItem___block_invoke;
  v10[3] = &unk_1E5DD3158;
  v10[4] = self;
  PXSharedLibraryFinishReviewAssistant(v7, viewModel, a3, shareProgress, v6, v10);
}

void __111__PXSharedLibraryAssistantReviewParticipantsViewController__finishAssistantWithInvitationTransport_sourceItem___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v11 = a3;
  [*(id *)(a1 + 32) _setIsProcessing:0];
  if (a2)
  {
    BOOL v5 = [*(id *)(a1 + 32) assistantViewControllerDelegate];
    [v5 stepForwardInAssistantForAssistantViewController:*(void *)(a1 + 32)];

    v6 = [*(id *)(a1 + 32) viewModel];
    id v7 = [v6 infosWithBothPeopleAndParticipants];
    PXSharedLibraryLinkContactsToPeopleForInfos(v7);

LABEL_6:
    int v8 = v11;
    goto LABEL_7;
  }
  int v8 = v11;
  if (v11)
  {
    id v9 = v11;
    int v10 = objc_msgSend(v9, "px_isDomain:code:", @"PXSharedLibraryErrorDomain", -1001);

    int v8 = v11;
    if (v10)
    {
      [*(id *)(a1 + 32) _updateNavigationItem];
      [*(id *)(a1 + 32) _updateTableViewInteractability];
      goto LABEL_6;
    }
  }
LABEL_7:
}

- (void)shareButtonTapped:(id)a3
{
}

- (void)inviteButtonTapped:(id)a3
{
}

- (BOOL)shouldHideBackButton
{
  if (self->_shareProgress) {
    return 1;
  }
  BOOL v3 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel sharedLibrary];
  char v4 = [v3 isPublished];

  return v4;
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  id v4 = a3;
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)&v8 traitCollectionDidChange:v4];
  BOOL v5 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateIcon];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  [(OBTableWelcomeController *)&v11 viewWillAppear:a3];
  id v4 = [(PXSharedLibraryAssistantViewModel *)self->_viewModel participantDataSource];
  uint64_t v5 = [v4 numberOfParticipants];

  tableViewController = self->_tableViewController;
  if (v5)
  {
    [(PXSharedLibraryParticipantTableViewController *)tableViewController setDelegate:0];
    id v7 = objc_alloc(MEMORY[0x1E4FB1D00]);
    objc_super v8 = objc_msgSend(v7, "initWithFrame:style:", 0, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  }
  else
  {
    [(PXSharedLibraryParticipantTableViewController *)tableViewController setDelegate:self];
    objc_super v8 = [(PXSharedLibraryParticipantTableViewController *)self->_tableViewController tableView];
  }
  id v9 = v8;
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];
  int v10 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  [v9 setBackgroundColor:v10];

  [(OBTableWelcomeController *)self setTableView:v9];
}

- (void)viewDidLoad
{
  v31[2] = *MEMORY[0x1E4F143B8];
  v30.receiver = self;
  v30.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  [(OBTableWelcomeController *)&v30 viewDidLoad];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateIcon];
  BOOL v3 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self headerView];
  id v4 = [(PXSharedLibraryAssistantParticipantViewModel *)self->_participantViewModel title];
  [v3 setTitle:v4];

  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateHeaderDetailText];
  uint64_t v5 = [PXRoundProgressView alloc];
  uint64_t v6 = -[PXRoundProgressView initWithFrame:style:](v5, "initWithFrame:style:", 4, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  progressView = self->_progressView;
  self->_progressView = v6;

  [(PXRoundProgressView *)self->_progressView setTranslatesAutoresizingMaskIntoConstraints:0];
  +[PXRoundProgressView sizeForSizeClass:2];
  double v9 = v8;
  double v11 = v10;
  v12 = (void *)MEMORY[0x1E4F28DC8];
  v13 = [(PXRoundProgressView *)self->_progressView widthAnchor];
  v14 = [v13 constraintEqualToConstant:v9];
  v31[0] = v14;
  v15 = [(PXRoundProgressView *)self->_progressView heightAnchor];
  uint64_t v16 = [v15 constraintEqualToConstant:v11];
  v31[1] = v16;
  uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:2];
  [v12 activateConstraints:v17];

  v18 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
  spinnerView = self->_spinnerView;
  self->_spinnerView = v18;

  [(UIActivityIndicatorView *)self->_spinnerView setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [MEMORY[0x1E4F83A80] boldButton];
  v21 = PXLocalizedSharedLibraryString(@"PXSharedLibraryAssistant_ReviewRecipients_ButtonTitle_sendInMessages");
  [v20 setTitle:v21 forState:0];

  [v20 addTarget:self action:sel_inviteButtonTapped_ forControlEvents:0x2000];
  v22 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self buttonTray];
  [v22 addButton:v20];

  v23 = [MEMORY[0x1E4FB18D0] keyCommandWithInput:@"\r" modifierFlags:0 action:sel_inviteButtonTapped_];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self addKeyCommand:v23];

  shareInMessagesButton = self->_shareInMessagesButton;
  self->_shareInMessagesButton = (OBBoldTrayButton *)v20;
  id v25 = v20;

  v26 = [MEMORY[0x1E4F83AB8] linkButton];
  [v26 addTarget:self action:sel_shareButtonTapped_ forControlEvents:0x2000];
  v27 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self buttonTray];
  [v27 addButton:v26];

  shareButton = self->_shareButton;
  self->_shareButton = (OBLinkTrayButton *)v26;

  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateActionButtons];
  [(PXSharedLibraryAssistantReviewParticipantsViewController *)self _updateCaptionText];
  v29 = [(PXSharedLibraryAssistantReviewParticipantsViewController *)self headerView];
  [v29 setAllowFullWidthIcon:1];
}

- (PXSharedLibraryAssistantReviewParticipantsViewController)initWithViewModel:(id)a3 participantViewModel:(id)a4 sharedLibraryStatusProvider:(id)a5
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
    v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m", 55, @"Invalid parameter not satisfying: %@", @"participantViewModel" object file lineNumber description];

    if (v12) {
      goto LABEL_4;
    }
    goto LABEL_9;
  }
  v20 = [MEMORY[0x1E4F28B00] currentHandler];
  [v20 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m", 54, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

  if (!v11) {
    goto LABEL_8;
  }
LABEL_3:
  if (v12) {
    goto LABEL_4;
  }
LABEL_9:
  v22 = [MEMORY[0x1E4F28B00] currentHandler];
  [v22 handleFailureInMethod:a2, self, @"PXSharedLibraryAssistantReviewParticipantsViewController+iOS.m", 56, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];

LABEL_4:
  v23.receiver = self;
  v23.super_class = (Class)PXSharedLibraryAssistantReviewParticipantsViewController;
  v13 = [(OBTableWelcomeController *)&v23 initWithTitle:&stru_1F00B0030 detailText:0 icon:0 adoptTableViewScrollView:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_statusProvider, a5);
    objc_storeStrong((id *)&v14->_viewModel, a3);
    [(PXSharedLibraryAssistantViewModel *)v14->_viewModel registerChangeObserver:v14 context:PXSharedLibraryAssistantViewModelObservationContext_301420];
    objc_storeStrong((id *)&v14->_participantViewModel, a4);
    v15 = [PXSharedLibraryParticipantTableViewController alloc];
    uint64_t v16 = [(PXSharedLibraryAssistantViewModel *)v14->_viewModel participantDataSourceManager];
    uint64_t v17 = [(PXSharedLibraryParticipantTableViewController *)v15 initWithDataSourceManager:v16];
    tableViewController = v14->_tableViewController;
    v14->_tableViewController = (PXSharedLibraryParticipantTableViewController *)v17;
  }
  return v14;
}

@end