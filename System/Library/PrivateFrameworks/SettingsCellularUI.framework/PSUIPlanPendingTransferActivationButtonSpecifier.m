@interface PSUIPlanPendingTransferActivationButtonSpecifier
- (CTCellularPlanManager)cellularPlanManager;
- (CTCellularPlanPendingTransfer)plan;
- (PSListController)hostController;
- (PSUIPlanPendingTransferActivationButtonSpecifier)initWithListController:(id)a3 planPendingTransfer:(id)a4;
- (TSSIMSetupFlow)flow;
- (UIActivityIndicatorView)spinner;
- (UIViewController)topViewController;
- (id)getLogger;
- (void)activatePlanPendingTransfer:(id)a3;
- (void)setCellularPlanManager:(id)a3;
- (void)setFlow:(id)a3;
- (void)setHostController:(id)a3;
- (void)setPlan:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setSpecifierProperties;
- (void)setSpinner:(id)a3;
- (void)setTopViewController:(id)a3;
- (void)showSpinner:(BOOL)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIPlanPendingTransferActivationButtonSpecifier

- (PSUIPlanPendingTransferActivationButtonSpecifier)initWithListController:(id)a3 planPendingTransfer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PSUIPlanPendingTransferActivationButtonSpecifier;
  v8 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)&v14 initWithName:0 target:self set:0 get:0 detail:0 cell:13 edit:0];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    v10 = [v6 navigationController];
    objc_storeWeak((id *)&v9->_navigationController, v10);

    objc_storeStrong((id *)&v9->_plan, a4);
    objc_storeWeak((id *)&v9->_hostController, v6);
    uint64_t v11 = [MEMORY[0x263F31978] sharedManager];
    cellularPlanManager = v9->_cellularPlanManager;
    v9->_cellularPlanManager = (CTCellularPlanManager *)v11;

    [(PSUIPlanPendingTransferActivationButtonSpecifier *)v9 setSpecifierProperties];
    [(PSUIPlanPendingTransferActivationButtonSpecifier *)v9 setButtonAction:sel_activatePlanPendingTransfer_];
  }

  return v9;
}

- (void)setSpecifierProperties
{
  unint64_t v3 = [(CTCellularPlanPendingTransfer *)self->_plan status];
  if (v3 >= 2)
  {
    if (v3 != 2) {
      return;
    }
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"ACTIVATING" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    uint64_t v6 = MEMORY[0x263EFFA80];
  }
  else
  {
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"ACTIVATE_CELLULAR_PLAN" value:&stru_26D410CA0 table:@"Gemini-Gemini"];
    uint64_t v6 = MEMORY[0x263EFFA88];
  }
  [(PSUIPlanPendingTransferActivationButtonSpecifier *)self setName:v5];

  uint64_t v7 = *MEMORY[0x263F600A8];
  [(PSUIPlanPendingTransferActivationButtonSpecifier *)self setProperty:v6 forKey:v7];
}

- (void)activatePlanPendingTransfer:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = "-[PSUIPlanPendingTransferActivationButtonSpecifier activatePlanPendingTransfer:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  uint64_t v6 = (void *)MEMORY[0x263F82418];
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"TRANSFER_TARGET_TITLE" value:&stru_26D410CA0 table:@"Cellular"];
  v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"TRANSFER_REQUEST_CONFIRMATION" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v11 = [v6 alertControllerWithTitle:v8 message:v10 preferredStyle:1];

  v12 = (void *)MEMORY[0x263F82400];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  objc_super v14 = [v13 localizedStringForKey:@"OK_BUTTON" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v18 = MEMORY[0x263EF8330];
  uint64_t v19 = 3221225472;
  v20 = __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke;
  v21 = &unk_2645E0F40;
  v22 = self;
  id v23 = v4;
  id v15 = v4;
  v16 = [v12 actionWithTitle:v14 style:2 handler:&v18];

  objc_msgSend(v11, "addAction:", v16, v18, v19, v20, v21, v22);
  v17 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)self hostController];
  [v17 presentViewController:v11 animated:1 completion:0];
}

void __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unint64_t v3 = [*(id *)(a1 + 32) plan];
    *(_DWORD *)buf = 138412290;
    v10 = v3;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "Triggered activation of pending transfer item: %@", buf, 0xCu);
  }
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(void **)(v4 + 248);
  uint64_t v6 = *(void *)(v4 + 232);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_27;
  v7[3] = &unk_2645E1780;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  [v5 activatePlanPendingTransfer:v6 completion:v7];
}

void __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_27(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a5;
  uint64_t v7 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v21 = v6;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "activate pending plan callback with error: %@", buf, 0xCu);
  }

  if ([v6 code] == 49 || objc_msgSend(v6, "code") == 51)
  {
    id v8 = *(void **)(a1 + 32);
    if (v8[32])
    {
      v9 = [v8 getLogger];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "duplicate request to launch SimSetupSupport", buf, 2u);
      }
    }
    else
    {
      uint64_t v18 = *MEMORY[0x263F66090];
      v10 = [NSNumber numberWithInteger:3];
      uint64_t v19 = v10;
      v9 = [NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];

      uint64_t v11 = [MEMORY[0x263F66078] flowWithOptions:v9];
      uint64_t v12 = *(void *)(a1 + 32);
      v13 = *(void **)(v12 + 256);
      *(void *)(v12 + 256) = v11;

      objc_msgSend(*(id *)(*(void *)(a1 + 32) + 256), "setDelegate:");
      uint64_t v14 = *(void *)(a1 + 32);
      id v15 = *(void **)(v14 + 256);
      v16[0] = MEMORY[0x263EF8330];
      v16[1] = 3221225472;
      v16[2] = __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_31;
      v16[3] = &unk_2645E1758;
      v16[4] = v14;
      id v17 = *(id *)(a1 + 40);
      [v15 firstViewController:v16];
    }
  }
}

void __80__PSUIPlanPendingTransferActivationButtonSpecifier_activatePlanPendingTransfer___block_invoke_31(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    uint64_t v11 = objc_opt_class();
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "present %@", (uint8_t *)&v10, 0xCu);
  }

  [*(id *)(a1 + 40) setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  v5 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
  [v5 setModalPresentationStyle:2];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  uint64_t v7 = [WeakRetained topViewController];
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 264), v7);

  id v8 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
  v9 = [v8 topViewController];
  [v9 presentViewController:v5 animated:1 completion:0];
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_spinner)
  {
    id v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v6;

    id v8 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
    v9 = [v8 accessoryView];
    id originAccessoryView = self->_originAccessoryView;
    self->_id originAccessoryView = v9;

    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    uint64_t v11 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
    [v11 setAccessoryView:self->_originAccessoryView];

    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
  [v5 setAccessoryView:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
LABEL_6:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__PSUIPlanPendingTransferActivationButtonSpecifier_showSpinner___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __64__PSUIPlanPendingTransferActivationButtonSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 240));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(id)*MEMORY[0x263F602B0] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v6;
      v9 = [v8 textLabel];
      [v9 setNumberOfLines:0];

      int v10 = [v8 textLabel];

      [v10 setLineBreakMode:0];
    }
  }
  if ([(id)*MEMORY[0x263F600A8] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSUIPlanPendingTransferActivationButtonSpecifier showSpinner:](self, "showSpinner:", [v6 BOOLValue] ^ 1);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUIPlanPendingTransferActivationButtonSpecifier;
  [(PSUIPlanPendingTransferActivationButtonSpecifier *)&v11 setProperty:v6 forKey:v7];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v4 = [(PSUIPlanPendingTransferActivationButtonSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "finish activation flow", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __74__PSUIPlanPendingTransferActivationButtonSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_2645E0E68;
  objc_copyWeak(&v6, (id *)buf);
  v5[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __74__PSUIPlanPendingTransferActivationButtonSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v3 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 224));
    uint64_t v4 = [v3 topViewController];
    v5 = [v4 presentedViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 256);
    *(void *)(v6 + 256) = 0;

    id WeakRetained = v8;
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PlanPendingTransferActivationButton"];
}

- (CTCellularPlanPendingTransfer)plan
{
  return self->_plan;
}

- (void)setPlan:(id)a3
{
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 256, 1);
}

- (void)setFlow:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (UIViewController)topViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_topViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setTopViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_topViewController);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_plan, 0);
  objc_destroyWeak((id *)&self->_navigationController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
}

@end