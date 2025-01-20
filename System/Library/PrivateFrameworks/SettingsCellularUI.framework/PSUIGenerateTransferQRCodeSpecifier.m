@interface PSUIGenerateTransferQRCodeSpecifier
+ (id)keyFor:(id)a3;
+ (id)specifierWithHostController:(id)a3 iccid:(id)a4 carrierName:(id)a5;
- (BOOL)popViewControllerOnPlanDeletion;
- (NSString)carrierName;
- (NSString)iccid;
- (PSListController)hostController;
- (PSUIGenerateTransferQRCodeSpecifier)initWithHostController:(id)a3 iccid:(id)a4 carrierName:(id)a5;
- (TSSIMSetupFlow)flow;
- (UIActivityIndicatorView)spinner;
- (id)getLogger;
- (void)generateTransferQRCodeCellPressed:(id)a3;
- (void)setFlow:(id)a3;
- (void)setHostController:(id)a3;
- (void)setPopViewControllerOnPlanDeletion:(BOOL)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setSpinner:(id)a3;
- (void)showSpinner:(BOOL)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIGenerateTransferQRCodeSpecifier

+ (id)keyFor:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v3 stringWithFormat:@"%@:%@", objc_opt_class(), v4];

  return v5;
}

+ (id)specifierWithHostController:(id)a3 iccid:(id)a4 carrierName:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[PSUIGenerateTransferQRCodeSpecifier keyFor:v8];
  v11 = +[SSFlowHostCache sharedInstance];
  v12 = [v11 objectForKey:v10];

  if (v12) {
    v13 = v12;
  }
  else {
    v13 = [[PSUIGenerateTransferQRCodeSpecifier alloc] initWithHostController:v7 iccid:v8 carrierName:v9];
  }
  v14 = v13;

  return v14;
}

- (PSUIGenerateTransferQRCodeSpecifier)initWithHostController:(id)a3 iccid:(id)a4 carrierName:(id)a5
{
  id v8 = a3;
  id v17 = a4;
  id v16 = a5;
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"GENERATE_TRANSFER_QRCODE" value:&stru_26D410CA0 table:@"Cellular"];

  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"GENERATE_TRANSFER_QRCODE" value:&stru_26D410CA0 table:@"Cellular"];

  v18.receiver = self;
  v18.super_class = (Class)PSUIGenerateTransferQRCodeSpecifier;
  v13 = [(PSUIGenerateTransferQRCodeSpecifier *)&v18 initWithName:v10 target:0 set:0 get:0 detail:0 cell:13 edit:0];
  v14 = v13;
  if (v13)
  {
    [(PSUIGenerateTransferQRCodeSpecifier *)v13 setIdentifier:v12];
    [(PSUIGenerateTransferQRCodeSpecifier *)v14 setTarget:v14];
    [(PSUIGenerateTransferQRCodeSpecifier *)v14 setButtonAction:sel_generateTransferQRCodeCellPressed_];
    objc_storeWeak((id *)&v14->_hostController, v8);
    objc_storeStrong((id *)&v14->_iccid, a4);
    objc_storeStrong((id *)&v14->_carrierName, a5);
  }

  return v14;
}

- (void)generateTransferQRCodeCellPressed:(id)a3
{
  v19[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  if (self->_flow)
  {
    v6 = [(PSUIGenerateTransferQRCodeSpecifier *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "duplicate request to launch SimSetupSupport", buf, 2u);
    }
  }
  else
  {
    [v4 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
    v18[0] = *MEMORY[0x263F66090];
    id v7 = [NSNumber numberWithInteger:11];
    uint64_t v8 = *MEMORY[0x263F660A0];
    iccid = self->_iccid;
    v19[0] = v7;
    v19[1] = iccid;
    uint64_t v10 = *MEMORY[0x263F66088];
    v18[1] = v8;
    v18[2] = v10;
    v19[2] = self->_carrierName;
    v6 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:3];

    v11 = [MEMORY[0x263F66078] flowWithOptions:v6];
    flow = self->_flow;
    self->_flow = v11;

    [(TSSIMSetupFlow *)self->_flow setDelegate:self];
    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    v13 = self->_flow;
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __73__PSUIGenerateTransferQRCodeSpecifier_generateTransferQRCodeCellPressed___block_invoke;
    v14[3] = &unk_2645E1940;
    v14[4] = self;
    objc_copyWeak(&v16, (id *)buf);
    id v15 = v5;
    [(TSSIMSetupFlow *)v13 firstViewController:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }
}

void __73__PSUIGenerateTransferQRCodeSpecifier_generateTransferQRCodeCellPressed___block_invoke(id *a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained(a1 + 6);
    v5 = [a1[4] getLogger];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (WeakRetained)
    {
      if (v6)
      {
        uint64_t v7 = objc_opt_class();
        uint64_t v8 = [WeakRetained iccid];
        int v15 = 138412546;
        uint64_t v16 = v7;
        __int16 v17 = 2112;
        objc_super v18 = v8;
        _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "present %@: for iccid: %@", (uint8_t *)&v15, 0x16u);
      }
      id v9 = [WeakRetained iccid];
      v5 = +[PSUIGenerateTransferQRCodeSpecifier keyFor:v9];

      uint64_t v10 = +[SSFlowHostCache sharedInstance];
      [v10 setObject:WeakRetained forKey:v5];

      v11 = (void *)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
      [v11 setModalPresentationStyle:2];
      v12 = [WeakRetained hostController];
      [v12 presentViewController:v11 animated:1 completion:0];

      [a1[5] setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
    }
    else if (v6)
    {
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)v3;
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "invalid specifier. skip present : %@", (uint8_t *)&v15, 0xCu);
    }
  }
  else
  {
    WeakRetained = [a1[4] getLogger];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_loadWeakRetained(a1 + 6);
      v14 = [v13 iccid];
      int v15 = 138412290;
      uint64_t v16 = (uint64_t)v14;
      _os_log_impl(&dword_221B17000, WeakRetained, OS_LOG_TYPE_DEFAULT, "invalid view for qr code with iccid: %@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)showSpinner:(BOOL)a3
{
  BOOL v3 = a3;
  if (!self->_spinner)
  {
    BOOL v6 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v6;

    if (v3) {
      goto LABEL_3;
    }
LABEL_5:
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    goto LABEL_6;
  }
  if (!a3) {
    goto LABEL_5;
  }
LABEL_3:
  v5 = [(PSUIGenerateTransferQRCodeSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
  [v5 setAccessoryView:self->_spinner];

  [(UIActivityIndicatorView *)self->_spinner startAnimating];
LABEL_6:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__PSUIGenerateTransferQRCodeSpecifier_showSpinner___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __51__PSUIGenerateTransferQRCodeSpecifier_showSpinner___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
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
      id v9 = [v8 textLabel];
      [v9 setNumberOfLines:0];

      uint64_t v10 = [v8 textLabel];

      [v10 setLineBreakMode:0];
    }
  }
  if ([(id)*MEMORY[0x263F600A8] isEqualToString:v7])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PSUIGenerateTransferQRCodeSpecifier showSpinner:](self, "showSpinner:", [v6 BOOLValue] ^ 1);
    }
  }
  v11.receiver = self;
  v11.super_class = (Class)PSUIGenerateTransferQRCodeSpecifier;
  [(PSUIGenerateTransferQRCodeSpecifier *)&v11 setProperty:v6 forKey:v7];
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __61__PSUIGenerateTransferQRCodeSpecifier_simSetupFlowCompleted___block_invoke;
  v5[3] = &unk_2645E0E18;
  objc_copyWeak(v6, &location);
  v5[4] = self;
  v6[1] = (id)a3;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __61__PSUIGenerateTransferQRCodeSpecifier_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = [WeakRetained hostController];
    v5 = [v4 presentedViewController];
    [v5 dismissViewControllerAnimated:1 completion:0];

    id v6 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 48);
      int v12 = 134217984;
      uint64_t v13 = v7;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "simSetupFlowCompleted with completionType:%ld", (uint8_t *)&v12, 0xCu);
    }

    id v8 = (void *)v3[28];
    v3[28] = 0;

    id v9 = [v3 iccid];
    uint64_t v10 = +[PSUIGenerateTransferQRCodeSpecifier keyFor:v9];

    objc_super v11 = +[SSFlowHostCache sharedInstance];
    [v11 removeObjectForKey:v10];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"trqr.cp"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (BOOL)popViewControllerOnPlanDeletion
{
  return self->_popViewControllerOnPlanDeletion;
}

- (void)setPopViewControllerOnPlanDeletion:(BOOL)a3
{
  self->_popViewControllerOnPlanDeletion = a3;
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 224, 1);
}

- (void)setFlow:(id)a3
{
}

- (NSString)iccid
{
  return self->_iccid;
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 248, 1);
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end