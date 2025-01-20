@interface PSUICellularPlanDetailController
- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus;
- (id)getLogger;
- (id)specifiers;
- (void)setSubscriptionContextMenus:(id)a3;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation PSUICellularPlanDetailController

- (id)specifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    v5 = [(PSUICellularPlanDetailController *)self getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[PSUICellularPlanDetailController specifiers]";
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s (re)loading specifiers", (uint8_t *)&v17, 0xCu);
    }

    v6 = objc_opt_new();
    v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SUBSCRIPTION_CONTEXT_MENUS_GROUP"];
    [v6 addObject:v7];
    subscriptionContextMenus = self->_subscriptionContextMenus;
    if (subscriptionContextMenus)
    {
      [(PSUISubscriptionContextMenusGroup *)subscriptionContextMenus setGroupSpecifier:v7];
    }
    else
    {
      v9 = [PSUISubscriptionContextMenusGroup alloc];
      v10 = [PSUISubscriptionContextMenusProductionFactory alloc];
      v11 = [(PSUISubscriptionContextMenusProductionFactory *)v10 initWithHostController:self parentSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98]) groupSpecifier:v7 popViewControllerOnPlanRemoval:1];
      v12 = [(PSUISubscriptionContextMenusGroup *)v9 initWithFactory:v11];
      v13 = self->_subscriptionContextMenus;
      self->_subscriptionContextMenus = v12;
    }
    v14 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus specifiers];
    [v6 addObjectsFromArray:v14];

    [MEMORY[0x263F67F00] logSpecifiers:v6 origin:@"[PSUICellularPlanDetailController specifiers] end"];
    v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v6;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  v5 = [(PSUICellularPlanDetailController *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v8 = "-[PSUICellularPlanDetailController viewWillAppear:]";
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)PSUICellularPlanDetailController;
  [(PSUICellularPlanDetailController *)&v6 viewWillAppear:v3];
  [(PSUICellularPlanDetailController *)self reloadSpecifiers];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularPlanDetailController"];
}

- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus
{
  return self->_subscriptionContextMenus;
}

- (void)setSubscriptionContextMenus:(id)a3
{
}

- (void).cxx_destruct
{
}

@end