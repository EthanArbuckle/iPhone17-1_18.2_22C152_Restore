@interface WLTransferCancellationViewController
- (WLTransferCancellationViewController)initWithWelcomeController:(id)a3 context:(id)a4;
- (id)resetBlock;
- (void)_detailTapped:(id)a3;
- (void)_reset;
- (void)setResetBlock:(id)a3;
@end

@implementation WLTransferCancellationViewController

- (WLTransferCancellationViewController)initWithWelcomeController:(id)a3 context:(id)a4
{
  v41[3] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = WLLocalizedString();
  v10 = [MEMORY[0x263F82670] modelSpecificLocalizedStringKeyForKey:@"CANCELLATION_DETAIL"];
  v11 = WLLocalizedString();
  v12 = (void *)MEMORY[0x263F827E8];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v12 imageNamed:@"MoveToiOS" inBundle:v13];
  v40.receiver = self;
  v40.super_class = (Class)WLTransferCancellationViewController;
  v15 = [(WLTransferCancellationViewController *)&v40 initWithTitle:v9 detailText:v11 icon:v14 contentLayout:2];

  if (v15)
  {
    objc_storeStrong((id *)&v15->_welcomeController, a3);
    id v39 = v8;
    if ([v8 isEnabled])
    {
      objc_storeStrong((id *)&v15->_context, a4);
      v16 = [MEMORY[0x263F5B8D0] linkButton];
      v17 = WLLocalizedString();
      [v16 setTitle:v17 forState:0];

      [v16 addTarget:v15 action:sel__detailTapped_ forControlEvents:64];
      v18 = [(WLTransferCancellationViewController *)v15 contentView];
      [v18 addSubview:v16];

      v33 = (void *)MEMORY[0x263F08938];
      v36 = [v16 topAnchor];
      v37 = [(WLTransferCancellationViewController *)v15 contentView];
      v35 = [v37 topAnchor];
      v34 = [v36 constraintEqualToAnchor:v35];
      v41[0] = v34;
      v32 = [v16 bottomAnchor];
      [(WLTransferCancellationViewController *)v15 contentView];
      v19 = id v38 = v7;
      v20 = [v19 bottomAnchor];
      v21 = [v32 constraintEqualToAnchor:v20];
      v41[1] = v21;
      v22 = [v16 centerXAnchor];
      v23 = [(WLTransferCancellationViewController *)v15 contentView];
      v24 = [v23 centerXAnchor];
      v25 = [v22 constraintEqualToAnchor:v24];
      v41[2] = v25;
      v26 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:3];
      [v33 activateConstraints:v26];

      id v7 = v38;
    }
    v27 = [MEMORY[0x263F5B898] boldButton];
    v28 = WLLocalizedString();
    [v27 setTitle:v28 forState:0];

    [v27 addTarget:v15 action:sel__reset forControlEvents:64];
    v29 = [(WLTransferCancellationViewController *)v15 buttonTray];
    [v29 addButton:v27];

    v30 = [(OBBaseWelcomeController *)v15 navigationItem];
    [v30 setHidesBackButton:1 animated:0];

    id v8 = v39;
  }

  return v15;
}

- (void)_reset
{
  resetBlock = (void (**)(void))self->_resetBlock;
  if (resetBlock) {
    resetBlock[2]();
  }
}

- (void)_detailTapped:(id)a3
{
  v5 = [[WLDetailViewController alloc] initWithContext:self->_context];
  v4 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v5];
  [v4 setModalPresentationStyle:2];
  [(WLTransferCancellationViewController *)self presentViewController:v4 animated:1 completion:0];
}

- (id)resetBlock
{
  return self->_resetBlock;
}

- (void)setResetBlock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resetBlock, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end