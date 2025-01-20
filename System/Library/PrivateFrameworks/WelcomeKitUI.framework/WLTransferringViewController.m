@interface WLTransferringViewController
- (BOOL)isImporting;
- (BOOL)showCancelButton;
- (WLTransferringViewController)initWithSourceDevice:(id)a3 welcomeController:(id)a4 showsTips:(BOOL)a5;
- (id)cancellationBlock;
- (id)viewWillDismissBlock;
- (void)_cancelRemainingDownloadTimeUpdateTimer;
- (void)addProgressBar;
- (void)cancel;
- (void)dealloc;
- (void)removeProgressBar;
- (void)setCancellationBlock:(id)a3;
- (void)setCompletedOperationCount:(unint64_t)a3 totalOperationCount:(unint64_t)a4;
- (void)setIsImporting:(BOOL)a3;
- (void)setProgress:(double)a3;
- (void)setProgressText:(id)a3;
- (void)setRemainingDownloadTime:(double)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setViewWillDismissBlock:(id)a3;
- (void)showActivityIndicatorView;
- (void)tipsButtonPressed:(id)a3;
- (void)updateProgressText;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WLTransferringViewController

- (WLTransferringViewController)initWithSourceDevice:(id)a3 welcomeController:(id)a4 showsTips:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = WLLocalizedString();
  v10 = (void *)MEMORY[0x263F827E8];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v10 imageNamed:@"MoveToiOS" inBundle:v11];
  v33.receiver = self;
  v33.super_class = (Class)WLTransferringViewController;
  v13 = [(OBSetupAssistantProgressController *)&v33 initWithTitle:v9 detailText:0 icon:v12];

  if (v13)
  {
    objc_storeStrong((id *)&v13->_welcomeController, a4);
    v14 = [(OBBaseWelcomeController *)v13 navigationItem];
    [v14 setTitle:&stru_26DDE7AC0];

    v15 = [(OBBaseWelcomeController *)v13 navigationItem];
    [v15 setHidesBackButton:1 animated:0];

    v16 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"PROGRESS_TRANSFERRING_TEXT"];
    uint64_t v17 = WLLocalizedString();
    transferProgressDescription = v13->_transferProgressDescription;
    v13->_transferProgressDescription = (NSString *)v17;

    v19 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"PROGRESS_IMPORTING_TEXT"];
    uint64_t v20 = WLLocalizedString();
    importProgressDescription = v13->_importProgressDescription;
    v13->_importProgressDescription = (NSString *)v20;

    if (v5)
    {
      v22 = [MEMORY[0x263F5B8D0] linkButton];
      v23 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"PROGRESS_LEARN_HOW_TO_USE"];
      v24 = WLLocalizedString();
      [v22 setTitle:v24 forState:0];

      [v22 addTarget:v13 action:sel_tipsButtonPressed_ forControlEvents:64];
      v25 = (void *)MEMORY[0x263F827E8];
      v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v27 = [v25 imageNamed:@"tips" inBundle:v26];

      v28 = [MEMORY[0x263F824F0] plainButtonConfiguration];
      [v28 setImage:v27];
      [v28 setImagePlacement:1];
      [v28 setImagePadding:20.0];
      [v22 setConfiguration:v28];
      v29 = [(WLTransferringViewController *)v13 buttonTray];
      [v29 addButton:v22];
    }
    v30 = (NSDateComponentsFormatter *)objc_alloc_init(MEMORY[0x263F08780]);
    remainingDownloadTimeFormatter = v13->_remainingDownloadTimeFormatter;
    v13->_remainingDownloadTimeFormatter = v30;

    [(NSDateComponentsFormatter *)v13->_remainingDownloadTimeFormatter setUnitsStyle:3];
    [(NSDateComponentsFormatter *)v13->_remainingDownloadTimeFormatter setAllowedUnits:96];
    [(NSDateComponentsFormatter *)v13->_remainingDownloadTimeFormatter setIncludesApproximationPhrase:1];
  }

  return v13;
}

- (void)dealloc
{
  [(WLTransferringViewController *)self removeProgressBar];
  [(WLTransferringViewController *)self _cancelRemainingDownloadTimeUpdateTimer];
  v3.receiver = self;
  v3.super_class = (Class)WLTransferringViewController;
  [(WLTransferringViewController *)&v3 dealloc];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)WLTransferringViewController;
  [(WLOnboardingProgressViewController *)&v7 viewDidLoad];
  if (self->_showCancelButton)
  {
    objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    v4 = [(OBBaseWelcomeController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
  BOOL v5 = WLLocalizedString();
  v6 = [NSString stringWithFormat:@"%@\n\n%@", v5, self->_transferProgressDescription];
  [(WLTransferringViewController *)self setProgressText:v6];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLTransferringViewController;
  [(WLTransferringViewController *)&v4 viewWillAppear:a3];
  [(WLTransferringViewController *)self removeProgressBar];
}

- (void)cancel
{
  if (self->_cancellationBlock)
  {
    objc_initWeak(&location, self);
    cancellationBlock = (void (**)(id, void *))self->_cancellationBlock;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __38__WLTransferringViewController_cancel__block_invoke;
    v6[3] = &unk_2648707E0;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(WLTransferringViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

void __38__WLTransferringViewController_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showActivityIndicatorView];
}

- (void)showActivityIndicatorView
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v5 startAnimating];
  objc_super v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v5];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WLTransferringViewController;
  [(WLTransferringViewController *)&v8 viewWillDisappear:a3];
  [(WLTransferringViewController *)self _cancelRemainingDownloadTimeUpdateTimer];
  id v4 = [(WLTransferringViewController *)self navigationController];
  id v5 = [v4 transitionCoordinator];
  v6 = [v5 viewControllerForKey:*MEMORY[0x263F83C00]];

  if (v6 == self
    && (([(WLTransferringViewController *)self isMovingFromParentViewController] & 1) != 0
     || [(WLTransferringViewController *)self isBeingDismissed]))
  {
    viewWillDismissBlock = (void (**)(void))self->_viewWillDismissBlock;
    if (viewWillDismissBlock) {
      viewWillDismissBlock[2]();
    }
  }
}

- (void)setProgress:(double)a3
{
  self->_progress = a3;
  -[WLProgressBar setProgress:](self->_progressBar, "setProgress:");
  v5.receiver = self;
  v5.super_class = (Class)WLTransferringViewController;
  [(OBSetupAssistantProgressController *)&v5 setProgress:a3];
}

- (void)setProgressText:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLTransferringViewController;
  [(OBSetupAssistantProgressController *)&v4 setProgressText:a3];
  [(WLTransferringViewController *)self _cancelRemainingDownloadTimeUpdateTimer];
}

- (void)setRemainingDownloadTime:(double)a3
{
  if (a3 < 60.0) {
    a3 = 60.0;
  }
  self->_remainingDownloadTime = a3;
  if (!self->_remainingDownloadTimeUpdateTimer)
  {
    _WLLog();
    objc_initWeak(&location, self);
    objc_super v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    remainingDownloadTimeUpdateTimer = self->_remainingDownloadTimeUpdateTimer;
    self->_remainingDownloadTimeUpdateTimer = v4;

    v6 = self->_remainingDownloadTimeUpdateTimer;
    dispatch_time_t v7 = dispatch_time(0, 1000000000);
    dispatch_source_set_timer(v6, v7, 0x3B9ACA00uLL, 0xBEBC200uLL);
    objc_super v8 = self->_remainingDownloadTimeUpdateTimer;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __57__WLTransferringViewController_setRemainingDownloadTime___block_invoke;
    v9[3] = &unk_2648707E0;
    objc_copyWeak(&v10, &location);
    dispatch_source_set_event_handler(v8, v9);
    dispatch_activate((dispatch_object_t)self->_remainingDownloadTimeUpdateTimer);
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __57__WLTransferringViewController_setRemainingDownloadTime___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateProgressText];
}

- (void)setCompletedOperationCount:(unint64_t)a3 totalOperationCount:(unint64_t)a4
{
  self->_completedOperationCount = a3;
  self->_totalOperationCount = a4;
}

- (void)updateProgressText
{
  if (self->_isImporting)
  {
    _WLLog();
    objc_super v3 = NSString;
    objc_super v4 = WLLocalizedString();
    objc_super v5 = objc_msgSend(v3, "localizedStringWithFormat:", v4, self->_completedOperationCount, self->_totalOperationCount);

    v6 = [NSString stringWithFormat:@"%@\n\n%@", v5, self->_importProgressDescription];
  }
  else
  {
    dispatch_time_t v7 = [(NSDateComponentsFormatter *)self->_remainingDownloadTimeFormatter stringFromTimeInterval:self->_remainingDownloadTime];
    _WLLog();
    objc_super v8 = NSString;
    v9 = WLLocalizedString();
    objc_super v5 = objc_msgSend(v8, "stringWithFormat:", v9, v7);

    v6 = [NSString stringWithFormat:@"%@\n\n%@", v5, self->_transferProgressDescription];
  }
  [(WLProgressBar *)self->_progressBar setProgressText:v5];
  v10.receiver = self;
  v10.super_class = (Class)WLTransferringViewController;
  [(OBSetupAssistantProgressController *)&v10 setProgressText:v6];
}

- (void)_cancelRemainingDownloadTimeUpdateTimer
{
  remainingDownloadTimeUpdateTimer = self->_remainingDownloadTimeUpdateTimer;
  if (remainingDownloadTimeUpdateTimer)
  {
    dispatch_source_cancel(remainingDownloadTimeUpdateTimer);
    objc_super v4 = self->_remainingDownloadTimeUpdateTimer;
    self->_remainingDownloadTimeUpdateTimer = 0;
  }
}

- (void)setIsImporting:(BOOL)a3
{
  self->_isImporting = a3;
  if (a3)
  {
    objc_super v4 = WLLocalizedString();
    [(OBSetupAssistantProgressController *)self setTitle:v4];

    objc_super v5 = NSString;
    v6 = WLLocalizedString();
    dispatch_time_t v7 = [v5 stringWithFormat:@"%@\n\n%@", v6, self->_importProgressDescription];

    v8.receiver = self;
    v8.super_class = (Class)WLTransferringViewController;
    [(OBSetupAssistantProgressController *)&v8 setProgressText:v7];
  }
}

- (void)tipsButtonPressed:(id)a3
{
  objc_super v5 = [[WLTipsListViewController alloc] initWithItems];
  objc_super v4 = [(WLTransferringViewController *)self navigationController];
  [v4 pushViewController:v5 animated:1];

  [(WLTransferringViewController *)self addProgressBar];
}

- (void)removeProgressBar
{
  [(WLProgressBar *)self->_progressBar removeFromSuperview];
  progressBar = self->_progressBar;
  self->_progressBar = 0;
}

- (void)addProgressBar
{
  v23[4] = *MEMORY[0x263EF8340];
  [(WLTransferringViewController *)self removeProgressBar];
  objc_super v3 = [WLProgressBar alloc];
  objc_super v4 = -[WLProgressBar initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  progressBar = self->_progressBar;
  self->_progressBar = v4;

  [(WLProgressBar *)self->_progressBar setTranslatesAutoresizingMaskIntoConstraints:0];
  v6 = [(WLTransferringViewController *)self navigationController];
  dispatch_time_t v7 = [v6 view];

  [v7 addSubview:self->_progressBar];
  v18 = (void *)MEMORY[0x263F08938];
  v22 = [(WLProgressBar *)self->_progressBar topAnchor];
  v21 = [v7 bottomAnchor];
  +[WLProgressBar height];
  uint64_t v20 = [v22 constraintEqualToAnchor:v21 constant:-v8];
  v23[0] = v20;
  v19 = [(WLProgressBar *)self->_progressBar leadingAnchor];
  uint64_t v17 = [v7 leadingAnchor];
  v16 = [v19 constraintEqualToAnchor:v17];
  v23[1] = v16;
  v9 = [(WLProgressBar *)self->_progressBar trailingAnchor];
  objc_super v10 = [v7 trailingAnchor];
  v11 = [v9 constraintEqualToAnchor:v10];
  v23[2] = v11;
  v12 = [(WLProgressBar *)self->_progressBar bottomAnchor];
  v13 = [v7 bottomAnchor];
  v14 = [v12 constraintEqualToAnchor:v13];
  v23[3] = v14;
  v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v18 activateConstraints:v15];

  if (self->_progress > 0.0) {
    -[WLProgressBar setProgress:](self->_progressBar, "setProgress:");
  }
  if (self->_remainingDownloadTime > 0.0) {
    [(WLTransferringViewController *)self updateProgressText];
  }
}

- (BOOL)showCancelButton
{
  return self->_showCancelButton;
}

- (void)setShowCancelButton:(BOOL)a3
{
  self->_showCancelButton = a3;
}

- (BOOL)isImporting
{
  return self->_isImporting;
}

- (id)cancellationBlock
{
  return self->_cancellationBlock;
}

- (void)setCancellationBlock:(id)a3
{
}

- (id)viewWillDismissBlock
{
  return self->_viewWillDismissBlock;
}

- (void)setViewWillDismissBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewWillDismissBlock, 0);
  objc_storeStrong(&self->_cancellationBlock, 0);
  objc_storeStrong((id *)&self->_progressBar, 0);
  objc_storeStrong((id *)&self->_importProgressDescription, 0);
  objc_storeStrong((id *)&self->_transferProgressDescription, 0);
  objc_storeStrong((id *)&self->_remainingDownloadTimeFormatter, 0);
  objc_storeStrong((id *)&self->_remainingDownloadTimeUpdateTimer, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end