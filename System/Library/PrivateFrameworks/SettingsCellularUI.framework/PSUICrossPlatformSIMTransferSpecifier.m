@interface PSUICrossPlatformSIMTransferSpecifier
- (BOOL)isRequestingFirstViewController;
- (PSListController)hostController;
- (PSUICrossPlatformSIMTransferSpecifier)initWithHostController:(id)a3;
- (TSSIMSetupFlow)flow;
- (UIViewController)firstViewController;
- (id)getLogger;
- (void)cellPressed:(id)a3;
- (void)setFirstViewController:(id)a3;
- (void)setFlow:(id)a3;
- (void)setHostController:(id)a3;
- (void)setIsRequestingFirstViewController:(BOOL)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)showSpinner:(BOOL)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUICrossPlatformSIMTransferSpecifier

- (PSUICrossPlatformSIMTransferSpecifier)initWithHostController:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CROSS_PLATFORM_SIM_TRANSFER_TITLE" value:&stru_26D410CA0 table:@"Cellular"];

  v10.receiver = self;
  v10.super_class = (Class)PSUICrossPlatformSIMTransferSpecifier;
  v7 = [(PSUICrossPlatformSIMTransferSpecifier *)&v10 initWithName:v6 target:0 set:0 get:0 detail:0 cell:13 edit:0];
  v8 = v7;
  if (v7)
  {
    [(PSUICrossPlatformSIMTransferSpecifier *)v7 setIdentifier:@"Transfer SIM via QRCode"];
    [(PSUICrossPlatformSIMTransferSpecifier *)v8 setTarget:v8];
    [(PSUICrossPlatformSIMTransferSpecifier *)v8 setButtonAction:sel_cellPressed_];
    objc_storeWeak((id *)&v8->_hostController, v4);
    v8->_isRequestingFirstViewController = 0;
  }

  return v8;
}

- (void)cellPressed:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = [(PSUICrossPlatformSIMTransferSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[PSUICrossPlatformSIMTransferSpecifier cellPressed:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (self->_flow
    && (self->_isRequestingFirstViewController
     || (id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController),
         [WeakRetained presentedViewController],
         v7 = objc_claimAutoreleasedReturnValue(),
         BOOL v8 = v7 == 0,
         v7,
         WeakRetained,
         !v8)))
  {
    v9 = [(PSUICrossPlatformSIMTransferSpecifier *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "duplicate request to launch SimSetupSupport", buf, 2u);
    }
  }
  else
  {
    [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    uint64_t v15 = *MEMORY[0x263F66090];
    v16 = &unk_26D425E10;
    v9 = [NSDictionary dictionaryWithObjects:&v16 forKeys:&v15 count:1];
    objc_super v10 = [MEMORY[0x263F66078] flowWithOptions:v9];
    flow = self->_flow;
    self->_flow = v10;

    [(TSSIMSetupFlow *)self->_flow setDelegate:self];
    self->_isRequestingFirstViewController = 1;
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v12 = self->_flow;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __53__PSUICrossPlatformSIMTransferSpecifier_cellPressed___block_invoke;
    v13[3] = &unk_2645E0CF8;
    objc_copyWeak(&v14, (id *)buf);
    v13[4] = self;
    [(TSSIMSetupFlow *)v12 firstViewController:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)buf);
  }
}

void __53__PSUICrossPlatformSIMTransferSpecifier_cellPressed___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setIsRequestingFirstViewController:0];
    v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = [v5 hostController];
      BOOL v8 = [v7 navigationController];
      int v13 = 134217984;
      uint64_t v14 = [v8 modalPresentationStyle];
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "modal style:%ld", (uint8_t *)&v13, 0xCu);
    }
    v9 = [v5 hostController];
    int v10 = [v9 isInModalPresentation];

    if (v10)
    {
      v11 = [v5 hostController];
      v12 = [v11 navigationController];
      [v12 pushViewController:v3 animated:1];
    }
    else
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
      [v11 setModalPresentationStyle:2];
      v12 = [v5 hostController];
      [v12 presentViewController:v11 animated:1 completion:0];
    }

    [v5 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  }
  else if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138412290;
    uint64_t v14 = objc_opt_class();
    _os_log_error_impl(&dword_221B17000, &_os_log_internal, OS_LOG_TYPE_ERROR, "invalid %@", (uint8_t *)&v13, 0xCu);
  }
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id v4 = [(PSUICrossPlatformSIMTransferSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "finish x sim transfer flow", buf, 2u);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSUICrossPlatformSIMTransferSpecifier_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0CD0;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __63__PSUICrossPlatformSIMTransferSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    v2 = [WeakRetained hostController];
    id v3 = [v2 navigationController];
    [v3 dismissViewControllerAnimated:1 completion:0];

    [v4 setFlow:0];
    id WeakRetained = v4;
  }
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_spinner)
  {
    uint64_t v5 = *MEMORY[0x263F602B0];
  }
  else
  {
    id v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v6;

    uint64_t v5 = *MEMORY[0x263F602B0];
    BOOL v8 = [(PSUICrossPlatformSIMTransferSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
    v9 = [v8 accessoryView];
    id originAccessoryView = self->_originAccessoryView;
    self->_id originAccessoryView = v9;
  }
  v11 = [(PSUICrossPlatformSIMTransferSpecifier *)self propertyForKey:v5];
  v12 = v11;
  if (v11)
  {
    if (v3)
    {
      [v11 setAccessoryView:self->_spinner];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
      [v12 setAccessoryView:self->_originAccessoryView];
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __53__PSUICrossPlatformSIMTransferSpecifier_showSpinner___block_invoke;
    block[3] = &unk_2645E0B88;
    void block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    int v13 = [(PSUICrossPlatformSIMTransferSpecifier *)self getLogger];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_221B17000, v13, OS_LOG_TYPE_ERROR, "invalid table cell", buf, 2u);
    }
  }
}

void __53__PSUICrossPlatformSIMTransferSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 232));
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

      if (self->_spinner) {
        objc_msgSend(v8, "setAccessoryView:");
      }
    }
  }
  if ([(id)*MEMORY[0x263F600A8] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSUICrossPlatformSIMTransferSpecifier showSpinner:](self, "showSpinner:", [v6 BOOLValue] ^ 1);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUICrossPlatformSIMTransferSpecifier;
  [(PSUICrossPlatformSIMTransferSpecifier *)&v11 setProperty:v6 forKey:v7];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"xpf.sim.tr"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (UIViewController)firstViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_firstViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setFirstViewController:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 248, 1);
}

- (void)setFlow:(id)a3
{
}

- (BOOL)isRequestingFirstViewController
{
  return self->_isRequestingFirstViewController;
}

- (void)setIsRequestingFirstViewController:(BOOL)a3
{
  self->_isRequestingFirstViewController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_firstViewController);
  objc_destroyWeak((id *)&self->_hostController);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
}

@end