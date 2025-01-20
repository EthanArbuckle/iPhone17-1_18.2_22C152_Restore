@interface PXCMMComposeRecipientViewController
- (NSProgress)actionProgress;
- (PXCMMActionControllerDelegate)actionDelegate;
- (PXCMMComposeRecipientViewController)initWithCoder:(id)a3;
- (PXCMMComposeRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXCMMComposeRecipientViewController)initWithSession:(id)a3;
- (PXCMMSession)session;
- (PXCMMSpecManager)specManager;
- (PXComposeRecipientTableViewController)tableViewController;
- (PXComposeRecipientTableViewModel)tableViewModel;
- (PXUpdater)updater;
- (UIButton)sendButton;
- (UIButton)tapToRadarButton;
- (UILabel)privacyMessageLabel;
- (UIVisualEffectView)footerVisualEffectView;
- (double)maximumContentWidth;
- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4;
- (void)_handleActionButton:(id)a3;
- (void)_setNeedsUpdate;
- (void)_tapToRadarTapped:(id)a3;
- (void)_updateFooter;
- (void)_updateTableView;
- (void)_updateUserInteraction;
- (void)dealloc;
- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forComposeRecipientTableViewController:(id)a4;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 forComposeRecipientTableViewController:(id)a5;
- (void)setActionDelegate:(id)a3;
- (void)setActionProgress:(id)a3;
- (void)setFooterVisualEffectView:(id)a3;
- (void)setMaximumContentWidth:(double)a3;
- (void)setPrivacyMessageLabel:(id)a3;
- (void)setSendButton:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)setTableViewModel:(id)a3;
- (void)setTapToRadarButton:(id)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation PXCMMComposeRecipientViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);
  objc_storeStrong((id *)&self->_actionProgress, 0);
  objc_storeStrong((id *)&self->_sendButton, 0);
  objc_storeStrong((id *)&self->_privacyMessageLabel, 0);
  objc_storeStrong((id *)&self->_footerVisualEffectView, 0);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_tableViewModel, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_destroyWeak((id *)&self->_actionDelegate);
  objc_storeStrong((id *)&self->_session, 0);
}

- (void)setTapToRadarButton:(id)a3
{
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (void)setMaximumContentWidth:(double)a3
{
  self->_maximumContentWidth = a3;
}

- (double)maximumContentWidth
{
  return self->_maximumContentWidth;
}

- (NSProgress)actionProgress
{
  return self->_actionProgress;
}

- (void)setSendButton:(id)a3
{
}

- (UIButton)sendButton
{
  return self->_sendButton;
}

- (void)setPrivacyMessageLabel:(id)a3
{
}

- (UILabel)privacyMessageLabel
{
  return self->_privacyMessageLabel;
}

- (void)setFooterVisualEffectView:(id)a3
{
}

- (UIVisualEffectView)footerVisualEffectView
{
  return self->_footerVisualEffectView;
}

- (void)setTableViewController:(id)a3
{
}

- (PXComposeRecipientTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewModel:(id)a3
{
}

- (PXComposeRecipientTableViewModel)tableViewModel
{
  return self->_tableViewModel;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXCMMSpecManager)specManager
{
  return self->_specManager;
}

- (void)setActionDelegate:(id)a3
{
}

- (PXCMMActionControllerDelegate)actionDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionDelegate);
  return (PXCMMActionControllerDelegate *)WeakRetained;
}

- (PXCMMSession)session
{
  return self->_session;
}

- (id)px_diagnosticsItemProvidersForPoint:(CGPoint)a3 inCoordinateSpace:(id)a4
{
  v18.receiver = self;
  v18.super_class = (Class)PXCMMComposeRecipientViewController;
  v5 = -[UIViewController px_diagnosticsItemProvidersForPoint:inCoordinateSpace:](&v18, sel_px_diagnosticsItemProvidersForPoint_inCoordinateSpace_, a4, a3.x, a3.y);
  v6 = (void *)[v5 mutableCopy];

  v7 = [MEMORY[0x1E4F1CA60] dictionary];
  [v7 setObject:@"CMM Compose Recipient" forKeyedSubscript:@"PXDiagnosticsTitle"];
  v8 = [(PXCMMComposeRecipientViewController *)self session];
  v9 = [v8 diagnosticDictionary];
  [v7 setObject:v9 forKeyedSubscript:@"Session"];

  v10 = [(PXCMMComposeRecipientViewController *)self tableViewModel];
  v11 = [v10 composeRecipientDataSourceManager];
  v12 = [v11 diagnosticDictionary];
  [v7 setObject:v12 forKeyedSubscript:@"Recipient Manager"];

  v13 = objc_alloc_init(PXDiagnosticsItemProvider);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __93__PXCMMComposeRecipientViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke;
  v16[3] = &unk_1E5DD2988;
  id v17 = v7;
  id v14 = v7;
  [(PXDiagnosticsItemProvider *)v13 registerItemForIdentifier:@"PXDiagnosticsItemIdentifierDebugDictionary" loadHandler:v16];
  [v6 addObject:v13];

  return v6;
}

id __93__PXCMMComposeRecipientViewController_px_diagnosticsItemProvidersForPoint_inCoordinateSpace___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((void *)PXProgressFinishedObservationContext == a6 || PXProgressCancelledObservationContext == (void)a6)
  {
    uint64_t v20 = MEMORY[0x1E4F143A8];
    uint64_t v21 = 3221225472;
    v22 = __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke;
    v23 = &unk_1E5DD36F8;
    v24 = self;
    goto LABEL_10;
  }
  if ((void *)PXProgressFractionCompletedObservationContext == a6)
  {
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    id v17 = __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2;
    objc_super v18 = &unk_1E5DD36F8;
    v19 = self;
LABEL_10:
    px_dispatch_on_main_queue();
  }
  v14.receiver = self;
  v14.super_class = (Class)PXCMMComposeRecipientViewController;
  [(PXCMMComposeRecipientViewController *)&v14 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
}

void __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) updater];
  [v2 setNeedsUpdateOf:sel__updateFooter];

  id v3 = [*(id *)(a1 + 32) updater];
  [v3 setNeedsUpdateOf:sel__updateUserInteraction];
}

void __86__PXCMMComposeRecipientViewController_observeValueForKeyPath_ofObject_change_context___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) updater];
  [v1 setNeedsUpdateOf:sel__updateFooter];
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6 = a4;
  id v8 = a3;
  if ((void *)PXComposeRecipientTableViewModelObservationContext_101516 == a5)
  {
    if (v6)
    {
      v9 = [(PXCMMComposeRecipientViewController *)self session];
      id v10 = [v9 viewModel];

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __68__PXCMMComposeRecipientViewController_observable_didChange_context___block_invoke;
      v12[3] = &unk_1E5DCCFD0;
      v12[4] = self;
      [v10 performChanges:v12];
    }
    if ((v6 & 2) != 0)
    {
      id v11 = [(PXCMMComposeRecipientViewController *)self updater];
      [v11 setNeedsUpdateOf:sel__updateFooter];
    }
  }
}

void __68__PXCMMComposeRecipientViewController_observable_didChange_context___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 tableViewModel];
  id v5 = [v4 recipients];

  [v3 setRecipients:v5];
}

- (void)dismissPresentedViewControllerAnimated:(BOOL)a3 forComposeRecipientTableViewController:(id)a4
{
  id v5 = [(PXCMMComposeRecipientViewController *)self presentedViewController];
  [(PXCMMComposeRecipientViewController *)self dismissViewControllerAnimated:v5 != 0 completion:0];
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 forComposeRecipientTableViewController:(id)a5
{
}

- (void)_updateUserInteraction
{
  id v3 = [(PXCMMComposeRecipientViewController *)self actionProgress];
  id v12 = v3;
  if (v3 && ([v3 isFinished] & 1) == 0) {
    uint64_t v4 = [v12 isCancelled];
  }
  else {
    uint64_t v4 = 1;
  }
  id v5 = [(PXCMMComposeRecipientViewController *)self navigationController];
  char v6 = [v5 viewControllers];
  v7 = [v6 firstObject];
  id v8 = [v7 navigationItem];
  v9 = [v8 leftBarButtonItem];

  [v9 setEnabled:v4];
  id v10 = [(PXCMMComposeRecipientViewController *)self tableViewController];
  id v11 = [v10 tableView];

  [v11 setUserInteractionEnabled:v4];
}

- (void)_updateTableView
{
  id v3 = [(PXCMMComposeRecipientViewController *)self specManager];
  uint64_t v4 = [v3 extendedTraitCollection];
  [v4 safeAreaInsets];
  double v6 = v5;
  double v8 = v7;

  [(UIVisualEffectView *)self->_footerVisualEffectView frame];
  CGFloat v9 = CGRectGetMinY(v15) - v6;
  [(PXComposeRecipientTableViewController *)self->_tableViewController tableViewHeight];
  BOOL v11 = v10 > v9;
  id v13 = [(PXComposeRecipientTableViewController *)self->_tableViewController tableView];
  [v13 setScrollEnabled:v11];
  [(PXCMMComposeRecipientViewController *)self maximumContentWidth];
  objc_msgSend(v13, "setFrame:", v8, v6, v12, v9);
}

- (void)_updateFooter
{
  id v3 = [(PXCMMComposeRecipientViewController *)self actionProgress];
  id v42 = v3;
  if (!v3 || ([v3 isFinished] & 1) != 0 || objc_msgSend(v42, "isCancelled"))
  {
    uint64_t v4 = [(PXCMMComposeRecipientViewController *)self tableViewModel];
    double v5 = [v4 composeRecipients];
    BOOL v6 = [v5 count] != 0;
  }
  else
  {
    BOOL v6 = 0;
  }
  [(UIButton *)self->_sendButton setEnabled:v6];
  double v7 = [(PXCMMComposeRecipientViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v41 = v10;

  BOOL v11 = [(PXCMMComposeRecipientViewController *)self specManager];
  double v12 = [v11 extendedTraitCollection];

  [v12 safeAreaInsets];
  double v14 = v13;
  double v16 = v15;
  double v18 = v9 - v13 - v17;
  v19 = [(PXCMMComposeRecipientViewController *)self specManager];
  uint64_t v20 = [v19 spec];

  [v20 composeFooterMargins];
  double v22 = v21;
  double v24 = v23;
  double v26 = v18 - (v21 + v25);
  -[UILabel sizeThatFits:](self->_privacyMessageLabel, "sizeThatFits:", v26, 1.79769313e308);
  double v28 = v27;
  -[UIButton sizeThatFits:](self->_sendButton, "sizeThatFits:", v26, 1.79769313e308);
  double v30 = v29;
  [v20 composePrivacyMessageInset];
  double v32 = v24 + v16 + v30 + v28 + v31 * 2.0;
  -[UIVisualEffectView setFrame:](self->_footerVisualEffectView, "setFrame:", v14, v41 - v32, v18, v32);
  [v20 composePrivacyMessageInset];
  -[UILabel setFrame:](self->_privacyMessageLabel, "setFrame:", v22, v33, v26, v28);
  [(UILabel *)self->_privacyMessageLabel frame];
  double MaxY = CGRectGetMaxY(v44);
  [v20 composePrivacyMessageInset];
  -[UIButton setFrame:](self->_sendButton, "setFrame:", v22, MaxY + v35, v26, v30);
  tapToRadarButton = self->_tapToRadarButton;
  if (tapToRadarButton)
  {
    -[UIButton sizeThatFits:](tapToRadarButton, "sizeThatFits:", v26, 1.79769313e308);
    double v38 = v37;
    [(UIButton *)self->_sendButton frame];
    -[UIButton setFrame:](self->_tapToRadarButton, "setFrame:", v22, CGRectGetMaxY(v45) + 3.0, v26, v38);
  }
  v39 = [(PXCMMComposeRecipientViewController *)self tableViewController];
  v40 = [v39 tableView];

  objc_msgSend(v40, "setContentInset:", 0.0, 0.0, v32 - v16, 0.0);
  objc_msgSend(v40, "setScrollIndicatorInsets:", 0.0, 0.0, v32 - v16, 0.0);
}

- (void)_setNeedsUpdate
{
  if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
  {
    uint64_t v4 = [MEMORY[0x1E4F28B00] currentHandler];
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMComposeRecipientViewController.m", 297, @"%s must be called on the main thread", "-[PXCMMComposeRecipientViewController _setNeedsUpdate]");
  }
  id v5 = [(PXCMMComposeRecipientViewController *)self viewIfLoaded];
  [v5 setNeedsLayout];
}

- (void)_tapToRadarTapped:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __57__PXCMMComposeRecipientViewController__tapToRadarTapped___block_invoke;
  v5[3] = &unk_1E5DD2188;
  v5[4] = self;
  uint64_t v4 = +[PXFeedbackTapToRadarUtilities alertControllerWithPrivacyTitle:@"Privacy Warning" message:@"This will capture the recipients contact information and take a snapshot of the details of your Photo Library (such as names and locations, but not actual assets)\n\nBy submitting this feedback you agree to share the details of this snapshot with Apple." completion:v5];
  [(PXCMMComposeRecipientViewController *)self presentViewController:v4 animated:1 completion:0];
}

void __57__PXCMMComposeRecipientViewController__tapToRadarTapped___block_invoke(uint64_t a1, int a2)
{
  v17[1] = *MEMORY[0x1E4F143B8];
  if (a2)
  {
    id v3 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v4 = [*(id *)(a1 + 32) session];
    id v5 = [v4 diagnosticDictionary];

    if (v5) {
      [v3 addObject:v5];
    }
    BOOL v6 = [*(id *)(a1 + 32) tableViewModel];
    double v7 = [v6 composeRecipientDataSourceManager];

    double v8 = [v7 diagnosticDictionary];
    if (v8) {
      [v3 addObject:v8];
    }
    if ([v3 count])
    {
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      BOOL v11 = +[PXFeedbackTapToRadarUtilities attachmentURLForDiagnosticDictionaries:v3 descriptionName:v10];

      if (v11)
      {
        v17[0] = v11;
        double v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:1];
      }
      else
      {
        double v12 = 0;
      }
    }
    else
    {
      double v12 = 0;
      BOOL v11 = 0;
    }
    double v13 = +[PXFeedbackTapToRadarUtilities summaryDescription];
    double v16 = @"com.apple.PhotoLibraryServices.PhotosDiagnostics";
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    LOWORD(v15) = 1;
    +[PXFeedbackTapToRadarUtilities fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:](PXFeedbackTapToRadarUtilities, "fileRadarWithTitle:description:classification:componentID:componentName:componentVersion:keyword:screenshotURLs:attachmentURLs:includeSysDiagnose:includeInternalRelease:additionalExtensionIdentifiers:completionHandler:", @"CMM - Compose Recipient List - [TTR] <Insert Bug Title>", v13, @"Other Bug", @"476292", @"Photos UI Sharing", @"all", 0, 0, v12, v15, v14, 0);
  }
}

- (void)setActionProgress:(id)a3
{
  id v5 = (NSProgress *)a3;
  p_actionProgress = &self->_actionProgress;
  actionProgress = self->_actionProgress;
  if (actionProgress != v5)
  {
    double v10 = v5;
    [(NSProgress *)actionProgress removeObserver:self forKeyPath:@"finished" context:PXProgressFinishedObservationContext];
    [(NSProgress *)*p_actionProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PXProgressFractionCompletedObservationContext];
    [(NSProgress *)*p_actionProgress removeObserver:self forKeyPath:@"cancelled" context:PXProgressCancelledObservationContext];
    objc_storeStrong((id *)&self->_actionProgress, a3);
    [(NSProgress *)*p_actionProgress addObserver:self forKeyPath:@"finished" options:1 context:PXProgressFinishedObservationContext];
    [(NSProgress *)*p_actionProgress addObserver:self forKeyPath:@"fractionCompleted" options:1 context:PXProgressFractionCompletedObservationContext];
    [(NSProgress *)*p_actionProgress addObserver:self forKeyPath:@"cancelled" options:1 context:PXProgressCancelledObservationContext];
    double v8 = [(PXCMMComposeRecipientViewController *)self updater];
    [v8 setNeedsUpdateOf:sel__updateFooter];

    double v9 = [(PXCMMComposeRecipientViewController *)self updater];
    [v9 setNeedsUpdateOf:sel__updateUserInteraction];

    id v5 = v10;
  }
}

- (void)_handleActionButton:(id)a3
{
  id v4 = a3;
  id v5 = [(PXCMMComposeRecipientViewController *)self tableViewModel];
  BOOL v6 = [v5 composeRecipientDataSourceManager];
  double v7 = [v6 dataSource];

  double v8 = [v7 composeRecipients];
  double v9 = [v5 composeRecipients];
  double v10 = [(PXCMMComposeRecipientViewController *)self actionDelegate];
  BOOL v11 = [(PXCMMComposeRecipientViewController *)self session];
  double v12 = [v10 completeMyMomentViewController:self performActionForSession:v11];

  [(PXCMMComposeRecipientViewController *)self setActionProgress:v12];
  id v13 = v8;
  id v14 = v9;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x2020000000;
  v23[3] = 0;
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v22[3] = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x2020000000;
  v21[3] = 0;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = ___TraceComposeRecipientStatistics_block_invoke;
  v16[3] = &unk_1E5DB24D0;
  id v15 = v14;
  id v17 = v15;
  double v18 = v22;
  v19 = v23;
  uint64_t v20 = v21;
  [v13 enumerateObjectsUsingBlock:v16];

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(v23, 8);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PXCMMComposeRecipientViewController;
  -[PXCMMComposeRecipientViewController viewWillTransitionToSize:withTransitionCoordinator:](&v7, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  id v5 = [(PXCMMComposeRecipientViewController *)self updater];
  [v5 setNeedsUpdateOf:sel__updateFooter];

  BOOL v6 = [(PXCMMComposeRecipientViewController *)self updater];
  [v6 setNeedsUpdateOf:sel__updateTableView];
}

- (void)viewWillLayoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)PXCMMComposeRecipientViewController;
  [(PXCMMComposeRecipientViewController *)&v12 viewWillLayoutSubviews];
  id v3 = [(PXCMMComposeRecipientViewController *)self specManager];
  id v4 = [v3 extendedTraitCollection];

  id v5 = [(PXCMMComposeRecipientViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  [v4 safeAreaInsets];
  double v9 = v8;
  [v4 safeAreaInsets];
  [(PXCMMComposeRecipientViewController *)self setMaximumContentWidth:v7 - (v9 + v10)];
  BOOL v11 = [(PXCMMComposeRecipientViewController *)self updater];
  [v11 updateIfNeeded];
}

- (void)viewDidLoad
{
  v56.receiver = self;
  v56.super_class = (Class)PXCMMComposeRecipientViewController;
  [(PXCMMComposeRecipientViewController *)&v56 viewDidLoad];
  id v3 = [(PXCMMComposeRecipientViewController *)self specManager];
  id v4 = [v3 spec];

  id v5 = [v4 composeRecipientViewBackgroundColor];
  double v6 = [(PXCMMComposeRecipientViewController *)self view];
  [v6 setBackgroundColor:v5];

  double v7 = [(PXCMMComposeRecipientViewController *)self tableViewModel];
  [v7 performChanges:&__block_literal_global_33691];
  [v7 registerChangeObserver:self context:PXComposeRecipientTableViewModelObservationContext_101516];
  double v8 = [[PXComposeRecipientTableViewController alloc] initWithViewModel:v7];
  tableViewController = self->_tableViewController;
  self->_tableViewController = v8;

  [(PXComposeRecipientTableViewController *)self->_tableViewController setDelegate:self];
  double v10 = [(PXCMMComposeRecipientViewController *)self view];
  BOOL v11 = [(PXComposeRecipientTableViewController *)self->_tableViewController tableView];
  [v10 addSubview:v11];

  v51 = [MEMORY[0x1E4FB14C8] effectWithBlurRadius:20.0];
  objc_super v12 = (UIVisualEffectView *)[objc_alloc(MEMORY[0x1E4FB1F00]) initWithEffect:v51];
  footerVisualEffectView = self->_footerVisualEffectView;
  self->_footerVisualEffectView = v12;

  id v14 = [(PXCMMComposeRecipientViewController *)self view];
  [v14 addSubview:self->_footerVisualEffectView];

  id v15 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
  privacyMessageLabel = self->_privacyMessageLabel;
  self->_privacyMessageLabel = v15;

  id v17 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)self->_privacyMessageLabel setTextColor:v17];

  [(UILabel *)self->_privacyMessageLabel setNumberOfLines:0];
  [(UILabel *)self->_privacyMessageLabel setTextAlignment:1];
  double v18 = objc_msgSend(MEMORY[0x1E4FB08E0], "px_preferredFontForTextStyle:maxContentSizeCategory:withSymbolicTraits:", *MEMORY[0x1E4FB28F0], *MEMORY[0x1E4FB2790], 0x8000);
  [(UILabel *)self->_privacyMessageLabel setFont:v18];

  v19 = PXLocalizedStringFromTable(@"PXComposeRecipientPrivacyMessage", @"PhotosUICore");
  [(UILabel *)self->_privacyMessageLabel setText:v19];

  uint64_t v20 = [(UIVisualEffectView *)self->_footerVisualEffectView contentView];
  [v20 addSubview:self->_privacyMessageLabel];

  double v21 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
  sendButton = self->_sendButton;
  self->_sendButton = v21;

  [(UIButton *)self->_sendButton addTarget:self action:sel__handleActionButton_ forControlEvents:64];
  double v23 = self->_sendButton;
  double v24 = PXLocalizedStringFromTable(@"PXCompleteMyMomentSendingTitle", @"PhotosUICore");
  [(UIButton *)v23 setTitle:v24 forState:0];

  double v25 = self->_sendButton;
  double v26 = [MEMORY[0x1E4FB1618] whiteColor];
  [(UIButton *)v25 setTitleColor:v26 forState:0];

  double v27 = self->_sendButton;
  double v28 = (void *)MEMORY[0x1E4FB14D0];
  double v29 = [(PXCMMComposeRecipientViewController *)self view];
  double v30 = [v29 tintColor];
  double v31 = objc_msgSend(v28, "px_buttonBackgroundImageForType:color:cornerRadius:controlState:", 0, v30, 0, 6.0);
  [(UIButton *)v27 setBackgroundImage:v31 forState:0];

  double v54 = 0.0;
  double v55 = 0.0;
  uint64_t v52 = 0;
  double v53 = 0.0;
  double v32 = [(PXCMMComposeRecipientViewController *)self view];
  double v33 = [v32 tintColor];
  [v33 getRed:&v55 green:&v54 blue:&v53 alpha:&v52];

  v34 = self->_sendButton;
  double v35 = (void *)MEMORY[0x1E4FB14D0];
  v36 = [MEMORY[0x1E4FB1618] colorWithRed:v55 green:v54 blue:v53 alpha:0.5];
  double v37 = objc_msgSend(v35, "px_buttonBackgroundImageForType:color:cornerRadius:controlState:", 0, v36, 2, 6.0);
  [(UIButton *)v34 setBackgroundImage:v37 forState:2];

  double v38 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:18.0];
  v39 = [(UIButton *)self->_sendButton titleLabel];
  [v39 setFont:v38];

  [v4 composeCornerRadius];
  double v41 = v40;
  id v42 = [(UIButton *)self->_sendButton layer];
  [v42 setCornerRadius:v41];

  [v4 composeFooterInsets];
  -[UIButton setContentEdgeInsets:](self->_sendButton, "setContentEdgeInsets:");
  v43 = [(UIVisualEffectView *)self->_footerVisualEffectView contentView];
  [v43 addSubview:self->_sendButton];

  CGRect v44 = +[PXRootSettings sharedInstance];
  LODWORD(v39) = [v44 canShowInternalUI];

  if (v39)
  {
    CGRect v45 = [MEMORY[0x1E4FB14D0] buttonWithType:1];
    v46 = +[PXRootSettings sharedInstance];
    -[UIButton setHidden:](v45, "setHidden:", [v46 canShowInternalUI] ^ 1);

    [(UIButton *)v45 setTitle:@"File Radar (Apple Internal)" forState:0];
    [(UIButton *)v45 addTarget:self action:sel__tapToRadarTapped_ forControlEvents:64];
    v47 = [(UIVisualEffectView *)self->_footerVisualEffectView contentView];
    [v47 addSubview:v45];

    tapToRadarButton = self->_tapToRadarButton;
    self->_tapToRadarButton = v45;
  }
  v49 = [(PXCMMComposeRecipientViewController *)self updater];
  [v49 setNeedsUpdateOf:sel__updateFooter];

  v50 = [(PXCMMComposeRecipientViewController *)self updater];
  [v50 setNeedsUpdateOf:sel__updateTableView];
}

void __50__PXCMMComposeRecipientViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  PXLocalizedStringFromTable(@"PXComposeRecipientHeaderTitle", @"PhotosUICore");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setHeaderTitle:v3];
}

- (void)dealloc
{
  [(NSProgress *)self->_actionProgress removeObserver:self forKeyPath:@"finished" context:PXProgressFinishedObservationContext];
  [(NSProgress *)self->_actionProgress removeObserver:self forKeyPath:@"fractionCompleted" context:PXProgressFractionCompletedObservationContext];
  [(NSProgress *)self->_actionProgress removeObserver:self forKeyPath:@"cancelled" context:PXProgressCancelledObservationContext];
  v3.receiver = self;
  v3.super_class = (Class)PXCMMComposeRecipientViewController;
  [(PXCMMComposeRecipientViewController *)&v3 dealloc];
}

- (PXCMMComposeRecipientViewController)initWithSession:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    double v30 = [MEMORY[0x1E4F28B00] currentHandler];
    [v30 handleFailureInMethod:a2, self, @"PXCMMComposeRecipientViewController.m", 102, @"Invalid parameter not satisfying: %@", @"session" object file lineNumber description];
  }
  v33.receiver = self;
  v33.super_class = (Class)PXCMMComposeRecipientViewController;
  double v7 = [(PXCMMComposeRecipientViewController *)&v33 initWithNibName:0 bundle:0];
  double v8 = v7;
  if (v7)
  {
    p_session = (id *)&v7->_session;
    objc_storeStrong((id *)&v7->_session, a3);
    [(UIViewController *)v8 px_enableExtendedTraitCollection];
    double v10 = [(UIViewController *)v8 px_extendedTraitCollection];
    BOOL v11 = -[PXCMMSpecManager initWithExtendedTraitCollection:activityType:]([PXCMMSpecManager alloc], "initWithExtendedTraitCollection:activityType:", v10, [*p_session activityType]);
    specManager = v8->_specManager;
    v8->_specManager = v11;

    uint64_t v13 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v8];
    updater = v8->_updater;
    v8->_updater = (PXUpdater *)v13;

    [(PXUpdater *)v8->_updater setNeedsUpdateSelector:sel__setNeedsUpdate];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateFooter];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateTableView];
    [(PXUpdater *)v8->_updater addUpdateSelector:sel__updateUserInteraction];
    id v15 = [*p_session peopleSuggestionsDataSourceManager];
    double v16 = [v15 dataSource];
    uint64_t v17 = [v16 numberOfItemsInSection:0];

    double v18 = +[PXCompleteMyMomentSettings sharedInstance];
    int v19 = [v18 graphSuggestionEnabled];

    if (v19 && v17 > 0)
    {
      uint64_t v20 = 1;
    }
    else
    {
      double v21 = [*p_session peopleSuggestionsPreviewDataSourceManager];
      double v22 = [v21 dataSource];
      uint64_t v23 = [v22 numberOfItemsInSection:0];

      if (v23 < 1)
      {
        uint64_t v20 = 0;
        id v24 = 0;
      }
      else
      {
        id v24 = v21;
        uint64_t v20 = 2;
      }

      id v15 = v24;
    }
    double v25 = [[PXComposeRecipientDataSourceManager alloc] initWithPeopleSuggestionsDataSourceManager:v15 sourceType:v20];
    double v26 = [[PXComposeRecipientTableViewModel alloc] initWithComposeRecipientDataSourceManager:v25];
    tableViewModel = v8->_tableViewModel;
    v8->_tableViewModel = v26;

    double v28 = v8->_tableViewModel;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __55__PXCMMComposeRecipientViewController_initWithSession___block_invoke;
    v31[3] = &unk_1E5DB2488;
    double v32 = v8;
    [(PXComposeRecipientTableViewModel *)v28 performChanges:v31];
  }
  return v8;
}

void __55__PXCMMComposeRecipientViewController_initWithSession___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 976);
  id v3 = a2;
  id v7 = [v2 viewModel];
  uint64_t v4 = [v7 recipients];
  id v5 = (void *)v4;
  if (v4) {
    uint64_t v6 = v4;
  }
  else {
    uint64_t v6 = MEMORY[0x1E4F1CBF0];
  }
  [v3 setRecipients:v6];

  [v3 setCanAddRecipients:1];
  [v3 setCanSelectRecipients:1];
}

- (PXCMMComposeRecipientViewController)initWithCoder:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMComposeRecipientViewController.m", 98, @"%s is not available as initializer", "-[PXCMMComposeRecipientViewController initWithCoder:]");

  abort();
}

- (PXCMMComposeRecipientViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  double v9 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXCMMComposeRecipientViewController.m", 94, @"%s is not available as initializer", "-[PXCMMComposeRecipientViewController initWithNibName:bundle:]");

  abort();
}

@end