@interface WLPreparationViewController
- (BOOL)showCancelButton;
- (WLPreparationViewController)initWithWelcomeController:(id)a3;
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

@implementation WLPreparationViewController

- (WLPreparationViewController)initWithWelcomeController:(id)a3
{
  id v5 = a3;
  v6 = WLLocalizedString();
  v11.receiver = self;
  v11.super_class = (Class)WLPreparationViewController;
  v7 = [(OBSetupAssistantSpinnerController *)&v11 initWithSpinnerText:v6];

  if (v7)
  {
    objc_storeStrong((id *)&v7->_welcomeController, a3);
    v8 = [(OBBaseWelcomeController *)v7 navigationItem];
    [v8 setTitle:&stru_26DDE7AC0];

    v9 = [(OBBaseWelcomeController *)v7 navigationItem];
    [v9 setHidesBackButton:1 animated:0];
  }
  return v7;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)WLPreparationViewController;
  [(OBBaseWelcomeController *)&v6 viewDidLoad];
  if (self->_showCancelButton)
  {
    v3 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:self action:sel_cancel];
    v4 = [(OBBaseWelcomeController *)self navigationItem];
    [v4 setHidesBackButton:1];

    id v5 = [(OBBaseWelcomeController *)self navigationItem];
    [v5 setLeftBarButtonItem:v3];
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
    v6[2] = __37__WLPreparationViewController_cancel__block_invoke;
    v6[3] = &unk_2648707E0;
    objc_copyWeak(&v7, &location);
    cancellationBlock[2](cancellationBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(WLPreparationViewController *)self navigationController];
    id v4 = (id)[v5 popViewControllerAnimated:1];
  }
}

void __37__WLPreparationViewController_cancel__block_invoke(uint64_t a1)
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
  v8.super_class = (Class)WLPreparationViewController;
  [(OBSetupAssistantSpinnerController *)&v8 viewWillDisappear:a3];
  id v4 = [(WLPreparationViewController *)self navigationController];
  id v5 = [v4 transitionCoordinator];
  objc_super v6 = [v5 viewControllerForKey:*MEMORY[0x263F83C00]];

  if (v6 == self
    && (([(WLPreparationViewController *)self isMovingFromParentViewController] & 1) != 0
     || [(WLPreparationViewController *)self isBeingDismissed]))
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