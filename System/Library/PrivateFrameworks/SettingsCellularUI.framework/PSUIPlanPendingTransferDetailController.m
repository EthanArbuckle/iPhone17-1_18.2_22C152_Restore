@interface PSUIPlanPendingTransferDetailController
- (PSUIPlanPendingTransferDetailController)init;
- (PSUIPlanPendingTransferMenusGroup)planPendingTransferMenus;
- (id)getLogger;
- (id)specifiers;
- (void)cellularPlanChanged;
- (void)setPlanPendingTransferMenus:(id)a3;
@end

@implementation PSUIPlanPendingTransferDetailController

- (PSUIPlanPendingTransferDetailController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSUIPlanPendingTransferDetailController;
  v2 = [(PSUIPlanPendingTransferDetailController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 addObserver:v2 selector:sel_cellularPlanChanged name:@"PSUICellularPlanChanged" object:0];
  }
  return v2;
}

- (void)cellularPlanChanged
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v3 = [(PSUIPlanPendingTransferDetailController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v7 = "-[PSUIPlanPendingTransferDetailController cellularPlanChanged]";
    __int16 v8 = 2112;
    v9 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  planPendingTransferMenus = self->_planPendingTransferMenus;
  self->_planPendingTransferMenus = 0;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__PSUIPlanPendingTransferDetailController_cellularPlanChanged__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__PSUIPlanPendingTransferDetailController_cellularPlanChanged__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  [*(id *)(a1 + 32) reloadSpecifiers];
  if (![*(id *)(*(void *)(a1 + 32) + (int)*MEMORY[0x263F5FDB8]) count])
  {
    v2 = [*(id *)(a1 + 32) getLogger];
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315138;
      v6 = "-[PSUIPlanPendingTransferDetailController cellularPlanChanged]_block_invoke";
      _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "%s No specifiers to show, returning to Settings > Cellular view", (uint8_t *)&v5, 0xCu);
    }

    v3 = [*(id *)(a1 + 32) navigationController];
    id v4 = (id)[v3 popViewControllerAnimated:1];
  }
}

- (id)specifiers
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    int v5 = [(PSUIPlanPendingTransferDetailController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      v15 = "-[PSUIPlanPendingTransferDetailController specifiers]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", (uint8_t *)&v14, 0xCu);
    }

    v6 = objc_opt_new();
    planPendingTransferMenus = self->_planPendingTransferMenus;
    if (!planPendingTransferMenus)
    {
      __int16 v8 = [PSUIPlanPendingTransferMenusGroup alloc];
      v9 = [(PSUIPlanPendingTransferMenusGroup *)v8 initWithHostController:self parentSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];
      uint64_t v10 = self->_planPendingTransferMenus;
      self->_planPendingTransferMenus = v9;

      planPendingTransferMenus = self->_planPendingTransferMenus;
    }
    v11 = [(PSUIPlanPendingTransferMenusGroup *)planPendingTransferMenus specifiers];
    [v6 addObjectsFromArray:v11];

    [MEMORY[0x263F67F00] logSpecifiers:v6 origin:@"[PSUIPlanPendingTransferDetailController specifiers] end"];
    v12 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PlanPendingTransferDetailController"];
}

- (PSUIPlanPendingTransferMenusGroup)planPendingTransferMenus
{
  return self->_planPendingTransferMenus;
}

- (void)setPlanPendingTransferMenus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end