@interface PSUICarrierListController
- (PSUIAddOnPlanGroup)addOnPlanGroup;
- (PSUICarrierItemGroup)carrierItemGroup;
- (PSUICarrierListController)init;
- (PSUICarrierListController)initWithOptions:(BOOL)a3 showCarrierItemGroup:(BOOL)a4;
- (UIBarButtonItem)cancelButton;
- (id)addOnGroupSpecifier;
- (id)carrierItemGroupSpecifier;
- (id)createAddCellularPlanSpecifierIfNeeded:(id)a3;
- (id)createCarrierItemGroupIfNeeded:(id)a3;
- (id)getLogger;
- (id)specifiers;
- (void)addCancelButton;
- (void)cellularPlanChanged:(id)a3;
- (void)dismiss;
- (void)loadView;
- (void)setAddOnPlanGroup:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCarrierItemGroup:(id)a3;
@end

@implementation PSUICarrierListController

- (PSUICarrierListController)init
{
  v7.receiver = self;
  v7.super_class = (Class)PSUICarrierListController;
  v2 = [(PSUICarrierListController *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v2 action:sel_dismiss];
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_cellularPlanChanged_ name:@"PSUICellularPlanChanged" object:0];

    [(PSUICarrierListController *)v2 setModalInPresentation:1];
    v2->_showCarrierItemGroup = 1;
    v2->_showAddOnPlanGroup = 1;
  }
  return v2;
}

- (PSUICarrierListController)initWithOptions:(BOOL)a3 showCarrierItemGroup:(BOOL)a4
{
  result = [(PSUICarrierListController *)self init];
  if (result)
  {
    result->_showAddOnPlanGroup = a3;
    result->_showCarrierItemGroup = a4;
  }
  return result;
}

- (void)loadView
{
  v3.receiver = self;
  v3.super_class = (Class)PSUICarrierListController;
  [(PSUICarrierListController *)&v3 loadView];
  [(PSUICarrierListController *)self addCancelButton];
}

- (void)dismiss
{
}

- (void)cellularPlanChanged:(id)a3
{
  id v4 = a3;
  carrierItemGroup = self->_carrierItemGroup;
  if (carrierItemGroup && [(PSUICarrierItemGroup *)carrierItemGroup isFlowRunning])
  {
    v6 = [(PSUICarrierListController *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "flow is still running", buf, 2u);
    }
  }
  else
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __49__PSUICarrierListController_cellularPlanChanged___block_invoke;
    block[3] = &unk_2645E0B88;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __49__PSUICarrierListController_cellularPlanChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)addCancelButton
{
  objc_super v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isiPad");

  v5 = [(PSUICarrierListController *)self navigationItem];
  cancelButton = self->_cancelButton;
  id v7 = v5;
  if (v4) {
    [v5 setRightBarButtonItem:cancelButton animated:1];
  }
  else {
    [v5 setLeftBarButtonItem:cancelButton animated:1];
  }
}

- (id)specifiers
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (self->_showAddOnPlanGroup)
  {
    int v4 = [(PSUICarrierListController *)self addOnGroupSpecifier];
    addOnGroupSpecifier = self->_addOnGroupSpecifier;
    self->_addOnGroupSpecifier = v4;

    v6 = [(PSUICarrierListController *)self createAddCellularPlanSpecifierIfNeeded:self->_addOnGroupSpecifier];
    [(PSUICarrierListController *)self setAddOnPlanGroup:v6];

    id v7 = [(PSUICarrierListController *)self addOnPlanGroup];
    v8 = [v7 specifiers];

    if ([v8 count])
    {
      [v3 addObject:self->_addOnGroupSpecifier];
      objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v8, self->_addOnGroupSpecifier);
    }
  }
  if (self->_showCarrierItemGroup)
  {
    v9 = [(PSUICarrierListController *)self carrierItemGroupSpecifier];
    carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
    self->_carrierItemGroupSpecifier = v9;

    [v3 addObject:self->_carrierItemGroupSpecifier];
    v11 = [(PSUICarrierListController *)self createCarrierItemGroupIfNeeded:self->_carrierItemGroupSpecifier];
    [(PSUICarrierListController *)self setCarrierItemGroup:v11];

    v12 = [(PSUICarrierListController *)self carrierItemGroup];
    v13 = [v12 specifiers];
    objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v13, self->_carrierItemGroupSpecifier);
  }
  uint64_t v14 = (int)*MEMORY[0x263F5FDB8];
  v15 = *(Class *)((char *)&self->super.super.super.super.super.isa + v14);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v14) = (Class)v3;
  id v16 = v3;

  id v17 = *(id *)((char *)&self->super.super.super.super.super.isa + v14);
  return v17;
}

- (id)carrierItemGroupSpecifier
{
  carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
  if (carrierItemGroupSpecifier)
  {
    id v3 = carrierItemGroupSpecifier;
  }
  else
  {
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADD_NEW_NETWORK_GROUP"];
  }
  return v3;
}

- (id)addOnGroupSpecifier
{
  addOnGroupSpecifier = self->_addOnGroupSpecifier;
  if (addOnGroupSpecifier)
  {
    id v3 = addOnGroupSpecifier;
  }
  else
  {
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"ADD_ON_PLAN_GROUP"];
  }
  return v3;
}

- (id)createCarrierItemGroupIfNeeded:(id)a3
{
  carrierItemGroup = self->_carrierItemGroup;
  if (carrierItemGroup)
  {
    int v4 = carrierItemGroup;
  }
  else
  {
    id v6 = a3;
    int v4 = [[PSUICarrierItemGroup alloc] initWithListController:self groupSpecifier:v6 showCarrierItems:self->_showCarrierItemGroup];
  }
  return v4;
}

- (id)createAddCellularPlanSpecifierIfNeeded:(id)a3
{
  addOnPlanGroup = self->_addOnPlanGroup;
  if (addOnPlanGroup)
  {
    int v4 = addOnPlanGroup;
  }
  else
  {
    id v6 = a3;
    int v4 = [[PSUIAddOnPlanGroup alloc] initWithListController:self groupSpecifier:v6];
  }
  return v4;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CarrierListController"];
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (PSUICarrierItemGroup)carrierItemGroup
{
  return self->_carrierItemGroup;
}

- (void)setCarrierItemGroup:(id)a3
{
}

- (PSUIAddOnPlanGroup)addOnPlanGroup
{
  return self->_addOnPlanGroup;
}

- (void)setAddOnPlanGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_addOnPlanGroup, 0);
  objc_storeStrong((id *)&self->_carrierItemGroup, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_addOnGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_carrierItemGroupSpecifier, 0);
}

@end