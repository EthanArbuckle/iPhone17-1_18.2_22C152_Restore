@interface PSUIDataPlanDetailsController
- (PSUICellularDataPlanDetailGroup)cellularDataPlanDetailGroup;
- (PSUIDataPlanDetailsController)init;
- (PSUIDataPlanDetailsController)initWithParentSpecifier:(id)a3;
- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus;
- (id)getLogger;
- (id)specifiers;
- (id)titleDescription;
- (void)createOrUpdateSubscriptionContextMenuGroup:(id)a3;
- (void)dismiss;
- (void)setCellularDataPlanDetailGroup:(id)a3;
- (void)setSubscriptionContextMenus:(id)a3;
@end

@implementation PSUIDataPlanDetailsController

- (PSUIDataPlanDetailsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSUIDataPlanDetailsController;
  v2 = [(PSUIDataPlanDetailsController *)&v5 init];
  v3 = v2;
  if (v2) {
    [(PSUIDataPlanDetailsController *)v2 setModalInPresentation:1];
  }
  return v3;
}

- (PSUIDataPlanDetailsController)initWithParentSpecifier:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PSUIDataPlanDetailsController;
  v6 = [(PSUIDataPlanDetailsController *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_parentSpecifier, a3);
    v8 = [(PSUIDataPlanDetailsController *)v7 titleDescription];
    if ([v8 length]) {
      [(PSUIDataPlanDetailsController *)v7 setTitle:v8];
    }
  }
  return v7;
}

- (void)dismiss
{
}

- (id)specifiers
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  v4 = [(PSSpecifier *)self->_parentSpecifier userInfo];
  id v5 = v4;
  if (v4)
  {
    if ([v4 isSelected])
    {
      v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CELLULAR_ACCOUNT_DETAILS_GROUP"];
      if (![(PSUICellularDataPlanDetailGroup *)self->_cellularDataPlanDetailGroup isFlowRunning])
      {
        v7 = [[PSUICellularDataPlanDetailGroup alloc] initWithListController:self groupSpecifier:v6];
        cellularDataPlanDetailGroup = self->_cellularDataPlanDetailGroup;
        self->_cellularDataPlanDetailGroup = v7;
      }
      v9 = [(PSUICellularDataPlanDetailGroup *)self->_cellularDataPlanDetailGroup specifiers];
      if ([v9 count])
      {
        [v3 addObject:v6];
        objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v9, v6);
      }
    }
    objc_super v10 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SUBSCRIPTION_CONTEXT_MENUS_GROUP"];
    [(PSUIDataPlanDetailsController *)self createOrUpdateSubscriptionContextMenuGroup:v10];
    v11 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus specifiers];
    if ([v11 count])
    {
      v12 = [(PSUIDataPlanDetailsController *)self getLogger];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = 136315138;
        v18 = "-[PSUIDataPlanDetailsController specifiers]";
        _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "%s showing subscription context menus group", (uint8_t *)&v17, 0xCu);
      }

      [v3 addObject:v10];
      objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v11, v10);
    }
    uint64_t v13 = (int)*MEMORY[0x263F5FDB8];
    v14 = *(Class *)((char *)&self->super.super.super.super.super.isa + v13);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v13) = (Class)v3;
    id v15 = v3;

    id v3 = *(id *)((char *)&self->super.super.super.super.super.isa + v13);
  }
  else
  {
    objc_super v10 = [(PSUIDataPlanDetailsController *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "Plan item is not set!", (uint8_t *)&v17, 2u);
    }
  }

  return v3;
}

- (void)createOrUpdateSubscriptionContextMenuGroup:(id)a3
{
  id v17 = a3;
  if (self->_subscriptionContextMenus)
  {
    uint64_t v4 = (int)*MEMORY[0x263F5FE98];
    uint64_t v5 = *MEMORY[0x263F60290];
    v6 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:*MEMORY[0x263F60290]];

    if (v6)
    {
      v7 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus parentSpecifier];
      v8 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:v5];
      [v7 setProperty:v8 forKey:v5];
    }
    uint64_t v9 = *MEMORY[0x263F5FFF0];
    objc_super v10 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:*MEMORY[0x263F5FFF0]];

    if (v10)
    {
      v11 = [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus parentSpecifier];
      v12 = [*(id *)((char *)&self->super.super.super.super.super.isa + v4) propertyForKey:v9];
      [v11 setProperty:v12 forKey:v9];
    }
    [(PSUISubscriptionContextMenusGroup *)self->_subscriptionContextMenus setGroupSpecifier:v17];
  }
  else
  {
    uint64_t v13 = [PSUISubscriptionContextMenusGroup alloc];
    v14 = [[PSUISubscriptionContextMenusProductionFactory alloc] initWithHostController:self parentSpecifier:self->_parentSpecifier groupSpecifier:v17 popViewControllerOnPlanRemoval:0];
    id v15 = [(PSUISubscriptionContextMenusGroup *)v13 initWithFactory:v14];
    subscriptionContextMenus = self->_subscriptionContextMenus;
    self->_subscriptionContextMenus = v15;
  }
}

- (id)titleDescription
{
  v2 = [(PSSpecifier *)self->_parentSpecifier userInfo];
  if ([v2 isBackedByCellularPlan])
  {
    id v3 = [v2 plan];
    uint64_t v4 = [v3 planDescription];

    uint64_t v5 = [v2 plan];
    v6 = [v5 carrierName];

    if ([v4 length] && objc_msgSend(v6, "length") && (objc_msgSend(v4, "isEqualToString:", v6) & 1) == 0)
    {
      uint64_t v9 = NSString;
      objc_super v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v11 = [v10 localizedStringForKey:@"CELLULAR_PLAN_CARRIER_AND_PLAN_NAME" value:&stru_26D410CA0 table:@"Cellular"];
      v8 = objc_msgSend(v9, "stringWithFormat:", v11, v6, v4);
    }
    else
    {
      if (v4)
      {
        id v7 = v4;
      }
      else if (v6)
      {
        id v7 = v6;
      }
      else
      {
        id v7 = [v2 name];
      }
      v8 = v7;
    }
  }
  else
  {
    v8 = [v2 name];
  }

  return v8;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"DataPlanDetailsController"];
}

- (PSUISubscriptionContextMenusGroup)subscriptionContextMenus
{
  return self->_subscriptionContextMenus;
}

- (void)setSubscriptionContextMenus:(id)a3
{
}

- (PSUICellularDataPlanDetailGroup)cellularDataPlanDetailGroup
{
  return self->_cellularDataPlanDetailGroup;
}

- (void)setCellularDataPlanDetailGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularDataPlanDetailGroup, 0);
  objc_storeStrong((id *)&self->_subscriptionContextMenus, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end