@interface PSUIQRCodeGroup
- (PSListController)listController;
- (PSSpecifier)groupSpecifier;
- (PSUIQRCodeGroup)init;
- (PSUIQRCodeGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (TSSIMSetupFlow)flow;
- (id)getLogger;
- (id)specifiers;
- (void)scanQRCodePressed:(id)a3;
- (void)setFlow:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)simSetupFlowCompleted:(unint64_t)a3;
@end

@implementation PSUIQRCodeGroup

- (PSUIQRCodeGroup)init
{
}

- (PSUIQRCodeGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSUIQRCodeGroup;
  v8 = [(PSUIQRCodeGroup *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_listController, v6);
    objc_storeStrong((id *)&v9->_groupSpecifier, a4);
    groupSpecifier = v9->_groupSpecifier;
    v11 = NSString;
    v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"USE_QR_CODE_FOOTER" value:&stru_26D410CA0 table:@"Cellular"];
    v14 = [v11 stringWithFormat:v13];
    [(PSSpecifier *)groupSpecifier setProperty:v14 forKey:*MEMORY[0x263F600F8]];
  }
  return v9;
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = (void *)MEMORY[0x263F5FC40];
  v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"USE_QR_CODE" value:&stru_26D410CA0 table:@"Cellular"];
  id v7 = [v4 preferenceSpecifierNamed:v6 target:self set:0 get:0 detail:0 cell:13 edit:0];

  [v7 setButtonAction:sel_scanQRCodePressed_];
  [v3 addObject:v7];

  return v3;
}

- (void)simSetupFlowCompleted:(unint64_t)a3
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v4 = [(PSUIQRCodeGroup *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    *(void *)&buf[4] = "-[PSUIQRCodeGroup simSetupFlowCompleted:]";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__PSUIQRCodeGroup_simSetupFlowCompleted___block_invoke;
  block[3] = &unk_2645E0CD0;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __41__PSUIQRCodeGroup_simSetupFlowCompleted___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained[3];
    WeakRetained[3] = 0;
    v4 = WeakRetained;

    id v3 = objc_loadWeakRetained(v4 + 2);
    [v3 dismissViewControllerAnimated:1 completion:0];

    WeakRetained = v4;
  }
}

- (void)scanQRCodePressed:(id)a3
{
  v16[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  id v6 = [WeakRetained view];
  [v6 setUserInteractionEnabled:0];

  uint64_t v15 = *MEMORY[0x263F66090];
  id v7 = [NSNumber numberWithInteger:22];
  v16[0] = v7;
  uint64_t v8 = [NSDictionary dictionaryWithObjects:v16 forKeys:&v15 count:1];

  v9 = [MEMORY[0x263F66078] flowWithOptions:v8];
  flow = self->_flow;
  self->_flow = v9;

  [(TSSIMSetupFlow *)self->_flow setDelegate:self];
  id location = 0;
  objc_initWeak(&location, self);
  v11 = self->_flow;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __37__PSUIQRCodeGroup_scanQRCodePressed___block_invoke;
  v12[3] = &unk_2645E0CF8;
  objc_copyWeak(&v13, &location);
  v12[4] = self;
  [(TSSIMSetupFlow *)v11 firstViewController:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __37__PSUIQRCodeGroup_scanQRCodePressed___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = objc_loadWeakRetained(WeakRetained + 2);
    int v7 = [v6 isInModalPresentation];

    if (v7)
    {
      id v8 = objc_loadWeakRetained(v5 + 2);
      v9 = [v8 navigationController];
      [v9 pushViewController:v3 animated:1];
    }
    else
    {
      id v8 = (id)[objc_alloc(MEMORY[0x263F829B8]) initWithRootViewController:v3];
      [v8 setModalPresentationStyle:2];
      v9 = objc_loadWeakRetained(v5 + 2);
      [v9 presentViewController:v8 animated:1 completion:0];
    }

    v10 = objc_loadWeakRetained(v5 + 2);
    v11 = [v10 view];
    [v11 setUserInteractionEnabled:1];
  }
  else
  {
    v10 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_error_impl(&dword_221B17000, v10, OS_LOG_TYPE_ERROR, "Invalid PSUIQRCodeGroup", v12, 2u);
    }
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"QRCodeGroup"];
}

- (PSSpecifier)groupSpecifier
{
  return self->_groupSpecifier;
}

- (void)setGroupSpecifier:(id)a3
{
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (TSSIMSetupFlow)flow
{
  return (TSSIMSetupFlow *)objc_getProperty(self, a2, 24, 1);
}

- (void)setFlow:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flow, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
}

@end