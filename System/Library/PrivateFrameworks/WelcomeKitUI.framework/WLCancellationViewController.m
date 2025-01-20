@interface WLCancellationViewController
- (WLCancellationViewController)initWithWelcomeController:(id)a3;
- (id)continueBlock;
- (id)retryBlock;
- (void)_continue;
- (void)_retry;
- (void)setContinueBlock:(id)a3;
- (void)setRetryBlock:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation WLCancellationViewController

- (WLCancellationViewController)initWithWelcomeController:(id)a3
{
  id v5 = a3;
  v6 = WLLocalizedString();
  v7 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"CANCELLATION_DETAIL"];
  v8 = WLLocalizedString();
  v9 = (void *)MEMORY[0x263F827E8];
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v9 imageNamed:@"MoveToiOS" inBundle:v10];
  v23.receiver = self;
  v23.super_class = (Class)WLCancellationViewController;
  v12 = [(WLCancellationViewController *)&v23 initWithTitle:v6 detailText:v8 icon:v11 contentLayout:2];

  if (v12)
  {
    objc_storeStrong((id *)&v12->_welcomeController, a3);
    v13 = [MEMORY[0x263F5B898] boldButton];
    v14 = WLLocalizedString();
    [v13 setTitle:v14 forState:0];

    [v13 addTarget:v12 action:sel__continue forControlEvents:64];
    v15 = [(WLCancellationViewController *)v12 buttonTray];
    [v15 addButton:v13];

    uint64_t v16 = [MEMORY[0x263F5B8D0] linkButton];
    retryButton = v12->_retryButton;
    v12->_retryButton = (OBTrayButton *)v16;

    v18 = v12->_retryButton;
    v19 = WLLocalizedString();
    [(OBTrayButton *)v18 setTitle:v19 forState:0];

    [(OBTrayButton *)v12->_retryButton addTarget:v12 action:sel__retry forControlEvents:64];
    v20 = [(WLCancellationViewController *)v12 buttonTray];
    [v20 addButton:v12->_retryButton];

    v21 = [(OBBaseWelcomeController *)v12 navigationItem];
    [v21 setHidesBackButton:1 animated:0];
  }
  return v12;
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLCancellationViewController;
  [(WLCancellationViewController *)&v4 viewWillAppear:a3];
  [(OBTrayButton *)self->_retryButton hidesBusyIndicator];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WLCancellationViewController;
  [(WLCancellationViewController *)&v4 viewDidDisappear:a3];
  [(OBTrayButton *)self->_retryButton hidesBusyIndicator];
}

- (void)_continue
{
  continueBlock = (void (**)(void))self->_continueBlock;
  if (continueBlock) {
    continueBlock[2]();
  }
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

- (id)continueBlock
{
  return self->_continueBlock;
}

- (void)setContinueBlock:(id)a3
{
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
  objc_storeStrong(&self->_continueBlock, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end