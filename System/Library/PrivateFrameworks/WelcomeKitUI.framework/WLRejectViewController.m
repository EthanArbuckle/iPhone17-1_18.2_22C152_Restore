@interface WLRejectViewController
- (WLRejectViewController)initWithWelcomeController:(id)a3;
- (id)retryBlock;
- (void)_retry;
- (void)setRetryBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WLRejectViewController

- (WLRejectViewController)initWithWelcomeController:(id)a3
{
  id v5 = a3;
  v6 = WLLocalizedString();
  v7 = WLLocalizedString();
  v8 = (void *)MEMORY[0x263F827E8];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v8 imageNamed:@"MoveToiOS" inBundle:v9];
  v19.receiver = self;
  v19.super_class = (Class)WLRejectViewController;
  v11 = [(WLRejectViewController *)&v19 initWithTitle:v6 detailText:v7 icon:v10 contentLayout:2];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_welcomeController, a3);
    uint64_t v12 = [MEMORY[0x263F5B898] boldButton];
    retryButton = v11->_retryButton;
    v11->_retryButton = (OBTrayButton *)v12;

    v14 = v11->_retryButton;
    v15 = WLLocalizedString();
    [(OBTrayButton *)v14 setTitle:v15 forState:0];

    [(OBTrayButton *)v11->_retryButton addTarget:v11 action:sel__retry forControlEvents:64];
    v16 = [(WLRejectViewController *)v11 buttonTray];
    [v16 addButton:v11->_retryButton];

    v17 = [(OBBaseWelcomeController *)v11 navigationItem];
    [v17 setHidesBackButton:1 animated:0];
  }
  return v11;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLRejectViewController;
  [(WLRejectViewController *)&v4 viewWillAppear:a3];
  [(OBTrayButton *)self->_retryButton hidesBusyIndicator];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLRejectViewController;
  [(WLRejectViewController *)&v4 viewDidDisappear:a3];
  [(OBTrayButton *)self->_retryButton hidesBusyIndicator];
}

- (void)_retry
{
  [(OBTrayButton *)self->_retryButton showsBusyIndicator];
  id retryBlock = self->_retryBlock;
  if (retryBlock)
  {
    objc_super v4 = (void (*)(void))*((void *)retryBlock + 2);
    v4();
  }
}

- (id)retryBlock
{
  return self->_retryBlock;
}

- (void)setRetryBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_retryBlock, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end