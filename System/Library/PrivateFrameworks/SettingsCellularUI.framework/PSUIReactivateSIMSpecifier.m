@interface PSUIReactivateSIMSpecifier
- (PSListController)hostController;
- (PSUIReactivateSIMSpecifier)initWithPlanUniversalReference:(id)a3 hostController:(id)a4;
- (UIActivityIndicatorView)spinner;
- (id)getLogger;
- (id)originAccessoryView;
- (id)planItem;
- (void)_activateSIMPressed:(id)a3;
- (void)_hideSpinner;
- (void)_showSpinner;
- (void)setHostController:(id)a3;
- (void)setOriginAccessoryView:(id)a3;
- (void)setPlanItem:(id)a3;
- (void)setProperty:(id)a3 forKey:(id)a4;
- (void)setSpinner:(id)a3;
- (void)transferBackCanceled:(id)a3;
- (void)transferBackFailed:(id)a3 error:(id)a4;
- (void)transferBackSuccessFrom:(id)a3 to:(id)a4;
@end

@implementation PSUIReactivateSIMSpecifier

- (PSUIReactivateSIMSpecifier)initWithPlanUniversalReference:(id)a3 hostController:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (_MergedGlobals_1_0 != -1) {
    dispatch_once(&_MergedGlobals_1_0, &__block_literal_global_3);
  }
  v8 = +[PSUICellularPlanManagerCache sharedInstance];
  v9 = [v8 planFromReference:v6];

  uint64_t v10 = [v9 type];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = v11;
  if (v10) {
    v13 = @"ACTIVATE_ESIM";
  }
  else {
    v13 = @"CHECK_CELLULAR_CONNECTION";
  }
  v14 = [v11 localizedStringForKey:v13 value:&stru_26D410CA0 table:@"Cellular"];

  v24.receiver = self;
  v24.super_class = (Class)PSUIReactivateSIMSpecifier;
  v15 = [(PSUIReactivateSIMSpecifier *)&v24 initWithName:v14 target:0 set:0 get:0 detail:0 cell:13 edit:0];
  v16 = v15;
  if (v15)
  {
    [(PSUIReactivateSIMSpecifier *)v15 setIdentifier:@"ACTIVATE_SIM"];
    [(PSUIReactivateSIMSpecifier *)v16 setTarget:v16];
    [(PSUIReactivateSIMSpecifier *)v16 setButtonAction:sel__activateSIMPressed_];
    objc_storeWeak((id *)&v16->_hostController, v7);
    if (v9)
    {
      objc_storeStrong(&v16->_planItem, v9);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && [v16->_planItem isCheckingCellularConnectivity])
      {
        [(PSUIReactivateSIMSpecifier *)v16 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
      }
    }
    else
    {
      v17 = +[PSUICellularPlanManagerCache sharedInstance];
      uint64_t v18 = [v17 danglingPlanFromReference:v6];

      id planItem = v16->_planItem;
      v16->_id planItem = (id)v18;
    }
    v20 = [v16->_planItem iccid];
    v21 = [(id)qword_26AC32368 objectForKey:v20];
    if (v21)
    {
      v22 = [(PSUIReactivateSIMSpecifier *)v16 getLogger];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v26 = v16;
        _os_log_impl(&dword_221B17000, v22, OS_LOG_TYPE_DEFAULT, "update delegate to %@", buf, 0xCu);
      }

      [v21 setDelegate:v16];
    }
  }
  return v16;
}

uint64_t __76__PSUIReactivateSIMSpecifier_initWithPlanUniversalReference_hostController___block_invoke()
{
  qword_26AC32368 = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (void)transferBackCanceled:(id)a3
{
  uint64_t v4 = *MEMORY[0x263F600A8];
  id v5 = a3;
  [(PSUIReactivateSIMSpecifier *)self setProperty:MEMORY[0x263EFFA88] forKey:v4];
  id v6 = (void *)qword_26AC32368;
  id v7 = [v5 iccid];

  [v6 removeObjectForKey:v7];
}

- (void)transferBackFailed:(id)a3 error:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    v8 = [(PSUIReactivateSIMSpecifier *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "transfer back failed : %@", (uint8_t *)&v11, 0xCu);
    }
  }
  [(PSUIReactivateSIMSpecifier *)self setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  v9 = (void *)qword_26AC32368;
  uint64_t v10 = [v6 iccid];
  [v9 removeObjectForKey:v10];
}

- (void)transferBackSuccessFrom:(id)a3 to:(id)a4
{
  id v5 = (void *)qword_26AC32368;
  id v6 = [a3 iccid];
  [v5 removeObjectForKey:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  id v7 = [WeakRetained navigationController];
  id v8 = (id)[v7 popViewControllerAnimated:1];
}

- (void)setProperty:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PSUIReactivateSIMSpecifier;
  id v7 = a4;
  [(PSUIReactivateSIMSpecifier *)&v9 setProperty:v6 forKey:v7];
  int v8 = objc_msgSend((id)*MEMORY[0x263F600A8], "isEqualToString:", v7, v9.receiver, v9.super_class);

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([v6 BOOLValue]) {
        [(PSUIReactivateSIMSpecifier *)self _hideSpinner];
      }
      else {
        [(PSUIReactivateSIMSpecifier *)self _showSpinner];
      }
    }
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"reactivate.sim"];
}

- (void)_activateSIMPressed:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [(PSUIReactivateSIMSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id planItem = self->_planItem;
    int v12 = 138412290;
    id v13 = planItem;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "transfer back : %@", (uint8_t *)&v12, 0xCu);
  }

  [(PSUIReactivateSIMSpecifier *)self setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  id v6 = [self->_planItem iccid];
  id v7 = [(id)qword_26AC32368 objectForKey:v6];
  if (v7)
  {
    id WeakRetained = [(PSUIReactivateSIMSpecifier *)self getLogger];
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      _os_log_error_impl(&dword_221B17000, WeakRetained, OS_LOG_TYPE_ERROR, "this should not happen.", (uint8_t *)&v12, 2u);
    }
  }
  else
  {
    objc_super v9 = [TransferBackPlanCache alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
    uint64_t v10 = [WeakRetained navigationController];
    int v11 = [(TransferBackPlanCache *)v9 initWithDelegate:self navigationController:v10 transferBackPlan:self->_planItem];
    [(id)qword_26AC32368 setObject:v11 forKeyedSubscript:v6];
  }
}

- (void)_showSpinner
{
  if (self->_spinner)
  {
    uint64_t v3 = *MEMORY[0x263F602B0];
  }
  else
  {
    uint64_t v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v4;

    uint64_t v3 = *MEMORY[0x263F602B0];
    id v6 = [(PSUIReactivateSIMSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
    id v7 = [v6 accessoryView];
    id originAccessoryView = self->_originAccessoryView;
    self->_id originAccessoryView = v7;
  }
  objc_super v9 = [(PSUIReactivateSIMSpecifier *)self propertyForKey:v3];
  uint64_t v10 = v9;
  if (v9)
  {
    [v9 setAccessoryView:self->_spinner];
    [(UIActivityIndicatorView *)self->_spinner startAnimating];
  }
  else
  {
    int v11 = [(PSUIReactivateSIMSpecifier *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v12 = 0;
      _os_log_error_impl(&dword_221B17000, v11, OS_LOG_TYPE_ERROR, "invalid table cell", v12, 2u);
    }
  }
}

- (void)_hideSpinner
{
  uint64_t v3 = [(PSUIReactivateSIMSpecifier *)self propertyForKey:*MEMORY[0x263F602B0]];
  if (v3)
  {
    [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    [v3 setAccessoryView:self->_originAccessoryView];
  }
  else
  {
    uint64_t v4 = [(PSUIReactivateSIMSpecifier *)self getLogger];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v5 = 0;
      _os_log_error_impl(&dword_221B17000, v4, OS_LOG_TYPE_ERROR, "invalid table cell", v5, 2u);
    }
  }
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (id)planItem
{
  return objc_getProperty(self, a2, 216, 1);
}

- (void)setPlanItem:(id)a3
{
}

- (id)originAccessoryView
{
  return objc_getProperty(self, a2, 224, 1);
}

- (void)setOriginAccessoryView:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return (UIActivityIndicatorView *)objc_getProperty(self, a2, 232, 1);
}

- (void)setSpinner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong(&self->_originAccessoryView, 0);
  objc_storeStrong(&self->_planItem, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end