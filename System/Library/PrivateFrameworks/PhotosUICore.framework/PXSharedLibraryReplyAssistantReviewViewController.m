@interface PXSharedLibraryReplyAssistantReviewViewController
- (OBBoldTrayButton)movePhotosButton;
- (PXAssistantViewControllerDelegate)assistantViewControllerDelegate;
- (PXSharedLibraryAssistantViewModel)viewModel;
- (PXSharedLibraryReplyAssistantReviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (PXSharedLibraryReplyAssistantReviewViewController)initWithViewModel:(id)a3 sharedLibraryStatusProvider:(id)a4;
- (PXSharedLibraryStatusProvider)statusProvider;
- (void)_setIsProcessing:(BOOL)a3;
- (void)_updateHeaderText;
- (void)_updateIcon;
- (void)acceptInvitation;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setAssistantViewControllerDelegate:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation PXSharedLibraryReplyAssistantReviewViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_movePhotosButton, 0);
  objc_storeStrong((id *)&self->_statusProvider, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_destroyWeak((id *)&self->assistantViewControllerDelegate);
}

- (OBBoldTrayButton)movePhotosButton
{
  return self->_movePhotosButton;
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
  id v10 = a3;
  if ((void *)PXSharedLibraryAssistantViewModelObservationContext_161714 != a5)
  {
    v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2 object:self file:@"PXSharedLibraryReplyAssistantReviewViewController+iOS.m" lineNumber:112 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((+[PXSharedLibraryAssistantViewModel shareCountChangeDescriptors] & a4) != 0)[(PXSharedLibraryReplyAssistantReviewViewController *)self _updateHeaderText]; {
}
  }

- (void)_updateHeaderText
{
  v3 = [(PXSharedLibraryReplyAssistantReviewViewController *)self headerView];
  long long v13 = 0uLL;
  uint64_t v14 = 0;
  v4 = [(PXSharedLibraryReplyAssistantReviewViewController *)self viewModel];
  v5 = v4;
  if (v4)
  {
    [v4 shareCounts];
  }
  else
  {
    long long v13 = 0uLL;
    uint64_t v14 = 0;
  }

  v6 = PXLocalizedSharedLibraryString(@"PXSharedLibraryReplyAssistant_Intro_ReviewTitle");
  [v3 setTitle:v6];

  v7 = [(PXSharedLibraryReplyAssistantReviewViewController *)self viewModel];
  v8 = [v7 sharedLibrary];
  v9 = PXSharedLibraryGetCurrentUserParticipant(v8);

  if (v9)
  {
    long long v11 = v13;
    uint64_t v12 = v14;
    id v10 = PXSharedLibraryReplyAssistantReviewSubtitle((char **)&v11, v9);
    [v3 setDetailText:v10];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PXSharedLibraryReplyAssistantReviewViewController;
  id v4 = a3;
  [(PXSharedLibraryReplyAssistantReviewViewController *)&v8 traitCollectionDidChange:v4];
  v5 = [(PXSharedLibraryReplyAssistantReviewViewController *)self traitCollection];
  uint64_t v6 = [v5 userInterfaceStyle];
  uint64_t v7 = [v4 userInterfaceStyle];

  if (v6 != v7) {
    [(PXSharedLibraryReplyAssistantReviewViewController *)self _updateIcon];
  }
}

- (void)viewDidLoad
{
  v15.receiver = self;
  v15.super_class = (Class)PXSharedLibraryReplyAssistantReviewViewController;
  [(OBBaseWelcomeController *)&v15 viewDidLoad];
  [(PXSharedLibraryReplyAssistantReviewViewController *)self _updateIcon];
  [(PXSharedLibraryReplyAssistantReviewViewController *)self _updateHeaderText];
  v3 = [(PXSharedLibraryReplyAssistantReviewViewController *)self buttonTray];
  id v4 = PXLocalizedSharedLibraryString(@"PXSharedLibrarySetupDataRetentionInfoParticipant");
  v5 = (void *)MEMORY[0x1E4F1CB10];
  int IsIPad = PLPhysicalDeviceIsIPad();
  uint64_t v7 = @"https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ios_ui-05052022";
  if (IsIPad) {
    uint64_t v7 = @"https://support.apple.com/ht213248?cid=mc-ols-icloudphotos-article_ht213248-ipados_ui-05052022";
  }
  objc_super v8 = v7;
  v9 = [v5 URLWithString:v8];
  [v3 setCaptionText:v4 learnMoreURL:v9];

  id v10 = [MEMORY[0x1E4F83A80] boldButton];
  movePhotosButton = self->_movePhotosButton;
  self->_movePhotosButton = v10;

  uint64_t v12 = self->_movePhotosButton;
  long long v13 = PXLocalizedSharedLibraryString(@"PXSharedLibraryReplyAssistant_Intro_ReviewButtonTitle_Join");
  [(OBBoldTrayButton *)v12 setTitle:v13 forState:0];

  [(OBBoldTrayButton *)self->_movePhotosButton addTarget:self action:sel_moveButtonTapped_ forControlEvents:0x2000];
  uint64_t v14 = [(PXSharedLibraryReplyAssistantReviewViewController *)self buttonTray];
  [v14 addButton:self->_movePhotosButton];
}

- (void)_updateIcon
{
}

- (PXSharedLibraryReplyAssistantReviewViewController)initWithViewModel:(id)a3 sharedLibraryStatusProvider:(id)a4
{
  id v8 = a3;
  id v9 = a4;
  id v10 = v9;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, self, @"PXSharedLibraryReplyAssistantReviewViewController+iOS.m", 36, @"Invalid parameter not satisfying: %@", @"viewModel" object file lineNumber description];

    if (v10) {
      goto LABEL_3;
    }
  }
  objc_super v15 = [MEMORY[0x1E4F28B00] currentHandler];
  [v15 handleFailureInMethod:a2, self, @"PXSharedLibraryReplyAssistantReviewViewController+iOS.m", 37, @"Invalid parameter not satisfying: %@", @"sharedLibraryStatusProvider" object file lineNumber description];

LABEL_3:
  v16.receiver = self;
  v16.super_class = (Class)PXSharedLibraryReplyAssistantReviewViewController;
  long long v11 = [(PXSharedLibraryReplyAssistantReviewViewController *)&v16 initWithTitle:&stru_1F00B0030 detailText:0 icon:0 contentLayout:2];
  uint64_t v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_statusProvider, a4);
    objc_storeStrong((id *)&v12->_viewModel, a3);
    [(PXSharedLibraryAssistantViewModel *)v12->_viewModel registerChangeObserver:v12 context:PXSharedLibraryAssistantViewModelObservationContext_161714];
  }

  return v12;
}

- (PXSharedLibraryReplyAssistantReviewViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  long long v13 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXSharedLibraryReplyAssistantReviewViewController+iOS.m", 32, @"%s is not available as initializer", "-[PXSharedLibraryReplyAssistantReviewViewController initWithTitle:detailText:icon:contentLayout:]");

  abort();
}

- (void)acceptInvitation
{
  id v4 = [(PXSharedLibraryReplyAssistantReviewViewController *)self viewModel];
  v5 = [v4 sharedLibrary];
  uint64_t v6 = [v4 sharedLibraryRule];
  uint64_t v7 = [v4 autoSharePolicy];
  id v8 = +[PXViewControllerPresenter defaultPresenterWithViewController:self];
  [(PXSharedLibraryReplyAssistantReviewViewController *)self _setIsProcessing:1];
  id v9 = [(PXSharedLibraryReplyAssistantReviewViewController *)self statusProvider];
  int v10 = [v4 previewIsOutdated];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __79__PXSharedLibraryReplyAssistantReviewViewController_Internal__acceptInvitation__block_invoke;
  v11[3] = &unk_1E5DC7060;
  v11[4] = self;
  v11[5] = a2;
  PXSharedLibraryAcceptInvitation(v9, v5, v6, v7, v10, 0, v8, v11);
}

void __79__PXSharedLibraryReplyAssistantReviewViewController_Internal__acceptInvitation__block_invoke(uint64_t a1, int a2)
{
  [*(id *)(a1 + 32) _setIsProcessing:0];
  if (a2)
  {
    id v4 = [*(id *)(a1 + 32) assistantViewControllerDelegate];
    if (!v4) {
      PXAssertGetLog();
    }
    [v4 stepForwardInAssistantForAssistantViewController:*(void *)(a1 + 32)];
  }
}

- (void)_setIsProcessing:(BOOL)a3
{
  BOOL v3 = a3;
  id v8 = [(PXSharedLibraryReplyAssistantReviewViewController *)self movePhotosButton];
  if (v3)
  {
    [v8 setEnabled:0];
    [v8 showsBusyIndicator];
    v5 = [(OBBaseWelcomeController *)self navigationItem];
    uint64_t v6 = v5;
    uint64_t v7 = 1;
  }
  else
  {
    [v8 setEnabled:1];
    [v8 hidesBusyIndicator];
    v5 = [(OBBaseWelcomeController *)self navigationItem];
    uint64_t v6 = v5;
    uint64_t v7 = 0;
  }
  [v5 setHidesBackButton:v7];
}

@end