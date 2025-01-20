@interface WLWaitingForDataTypeSelectionViewController
- (BOOL)showCancelButton;
- (WLWaitingForDataTypeSelectionViewController)initWithWelcomeController:(id)a3;
- (id)cancellationBlock;
- (id)viewWillDismissBlock;
- (void)cancel;
- (void)setCancellationBlock:(id)a3;
- (void)setShowCancelButton:(BOOL)a3;
- (void)setViewWillDismissBlock:(id)a3;
- (void)showActivityIndicatorView;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation WLWaitingForDataTypeSelectionViewController

- (WLWaitingForDataTypeSelectionViewController)initWithWelcomeController:(id)a3
{
  id v5 = a3;
  v6 = WLLocalizedString();
  v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"PROGRESS_WAITING_EXPLANATION"];
  v8 = WLLocalizedString();
  v9 = (void *)MEMORY[0x263F827E8];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v9 imageNamed:@"MoveToiOS" inBundle:v10];
  v16.receiver = self;
  v16.super_class = (Class)WLWaitingForDataTypeSelectionViewController;
  v12 = [(WLWaitingForDataTypeSelectionViewController *)&v16 initWithTitle:v6 detailText:v8 icon:v11 contentLayout:2];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_welcomeController, a3);
    v13 = [(OBBaseWelcomeController *)v12 navigationItem];
    [v13 setTitle:&stru_26DDE7AC0];

    v14 = [(OBBaseWelcomeController *)v12 navigationItem];
    [v14 setHidesBackButton:1 animated:0];
  }
  return v12;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)WLWaitingForDataTypeSelectionViewController;
  [(WLOnboardingViewController *)&v5 viewDidLoad];
  if (self->_showCancelButton)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    v4 = [(OBBaseWelcomeController *)self navigationItem];
    [v4 setLeftBarButtonItem:v3];
  }
}

- (void)cancel
{
  if (self->_cancellationBlock)
  {
    objc_initWeak(&location, self);
    cancellationBlock = (void (**)(id, void *))self->_cancellationBlock;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __53__WLWaitingForDataTypeSelectionViewController_cancel__block_invoke;
    v6[3] = &unk_2648707E0;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(WLWaitingForDataTypeSelectionViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

void __53__WLWaitingForDataTypeSelectionViewController_cancel__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained showActivityIndicatorView];
}

- (void)showActivityIndicatorView
{
  id v5 = (id)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
  [v5 startAnimating];
  v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithCustomView:v5];
  id v4 = [(OBBaseWelcomeController *)self navigationItem];
  [v4 setLeftBarButtonItem:v3];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v8.receiver = self;
  v8.super_class = (Class)WLWaitingForDataTypeSelectionViewController;
  [(WLWaitingForDataTypeSelectionViewController *)&v8 viewWillDisappear:a3];
  id v4 = [(WLWaitingForDataTypeSelectionViewController *)self navigationController];
  id v5 = [v4 transitionCoordinator];
  v6 = [v5 viewControllerForKey:*MEMORY[0x263F83C00]];

  if (v6 == self
    && (([(WLWaitingForDataTypeSelectionViewController *)self isMovingFromParentViewController] & 1) != 0|| [(WLWaitingForDataTypeSelectionViewController *)self isBeingDismissed]))
  {
    viewWillDismissBlock = (void (**)(void))self->_viewWillDismissBlock;
    if (viewWillDismissBlock) {
      viewWillDismissBlock[2]();
    }
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

  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end