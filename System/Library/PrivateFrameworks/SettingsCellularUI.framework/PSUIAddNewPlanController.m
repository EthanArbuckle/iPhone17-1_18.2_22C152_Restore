@interface PSUIAddNewPlanController
- (BOOL)shouldShowPendingInstallPlan;
- (PSUIAddNewPlanController)init;
- (PSUIAddOnPlanGroup)addOnPlanGroup;
- (PSUICarrierItemGroup)carrierItemGroup;
- (PSUIPendingInstallPlanGroup)pendingInstallGroup;
- (PSUIPlanPendingTransferListGroup)transferablePlanGroup;
- (PSUIQRCodeGroup)QRCodeGroup;
- (UIBarButtonItem)cancelButton;
- (id)QRCodeGroupSpecifier;
- (id)addOnGroupSpecifier;
- (id)carrierItemGroupSpecifier;
- (id)createAddOnGroupIfNeeded:(id)a3;
- (id)createCarrierItemGroupIfNeeded:(id)a3;
- (id)createPendingInstallGroupIfNeeded:(id)a3;
- (id)createQRCodeGroupIfNeeded:(id)a3;
- (id)createTransferablePlanGroupIfNeeded:(id)a3;
- (id)getLogger;
- (id)pendingInstallGroupSpecifier;
- (id)specifiers;
- (id)transferablePlanGroupSpecifier;
- (void)addCancelButton;
- (void)cellularPlanChanged:(id)a3;
- (void)dismiss;
- (void)setAddOnPlanGroup:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCarrierItemGroup:(id)a3;
- (void)setPendingInstallGroup:(id)a3;
- (void)setQRCodeGroup:(id)a3;
- (void)setTransferablePlanGroup:(id)a3;
- (void)viewDidLoad;
@end

@implementation PSUIAddNewPlanController

- (PSUIAddNewPlanController)init
{
  v9.receiver = self;
  v9.super_class = (Class)PSUIAddNewPlanController;
  v2 = [(PSUIAddNewPlanController *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v2 action:sel_dismiss];
    cancelButton = v2->_cancelButton;
    v2->_cancelButton = (UIBarButtonItem *)v3;

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_cellularPlanChanged_ name:@"PSUICellularPlanChanged" object:0];

    [(PSUIAddNewPlanController *)v2 setModalInPresentation:1];
    v6 = +[PSUICellularPlanManagerCache sharedInstance];
    id v7 = (id)[v6 planItems];
  }
  return v2;
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PSUIAddNewPlanController;
  [(PSUIAddNewPlanController *)&v3 viewDidLoad];
  [(PSUIAddNewPlanController *)self addCancelButton];
}

- (void)dismiss
{
}

- (void)cellularPlanChanged:(id)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__PSUIAddNewPlanController_cellularPlanChanged___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __48__PSUIAddNewPlanController_cellularPlanChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)addCancelButton
{
  objc_super v3 = [MEMORY[0x263F82670] currentDevice];
  int v4 = objc_msgSend(v3, "sf_isiPad");

  v5 = [(PSUIAddNewPlanController *)self navigationItem];
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
  if ([(PSUIAddNewPlanController *)self shouldShowPendingInstallPlan])
  {
    int v4 = [(PSUIAddNewPlanController *)self pendingInstallGroupSpecifier];
    pendingInstallGroupSpecifier = self->_pendingInstallGroupSpecifier;
    self->_pendingInstallGroupSpecifier = v4;

    v6 = [(PSUIAddNewPlanController *)self createPendingInstallGroupIfNeeded:self->_pendingInstallGroupSpecifier];
    [(PSUIAddNewPlanController *)self setPendingInstallGroup:v6];

    [v3 addObject:self->_pendingInstallGroupSpecifier];
    id v7 = [(PSUIAddNewPlanController *)self pendingInstallGroup];
    v8 = [v7 specifiers];
    [v3 addObjectsFromArray:v8];
  }
  objc_super v9 = [(PSUIAddNewPlanController *)self transferablePlanGroupSpecifier];
  transferablePlanGroupSpecifier = self->_transferablePlanGroupSpecifier;
  self->_transferablePlanGroupSpecifier = v9;

  v11 = [(PSUIAddNewPlanController *)self createTransferablePlanGroupIfNeeded:self->_transferablePlanGroupSpecifier];
  [(PSUIAddNewPlanController *)self setTransferablePlanGroup:v11];

  [v3 addObject:self->_transferablePlanGroupSpecifier];
  v12 = [(PSUIAddNewPlanController *)self transferablePlanGroup];
  v13 = [v12 specifiers];
  [v3 addObjectsFromArray:v13];

  v14 = [(PSUIAddNewPlanController *)self addOnGroupSpecifier];
  addOnGroupSpecifier = self->_addOnGroupSpecifier;
  self->_addOnGroupSpecifier = v14;

  v16 = [(PSUIAddNewPlanController *)self createAddOnGroupIfNeeded:self->_addOnGroupSpecifier];
  [(PSUIAddNewPlanController *)self setAddOnPlanGroup:v16];

  v17 = [(PSUIAddNewPlanController *)self addOnPlanGroup];
  v18 = [v17 specifiers];

  if ([v18 count]) {
    [v3 addObject:self->_addOnGroupSpecifier];
  }
  objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v18, self->_addOnGroupSpecifier);
  v19 = [(PSUIAddNewPlanController *)self carrierItemGroupSpecifier];
  carrierItemGroupSpecifier = self->_carrierItemGroupSpecifier;
  self->_carrierItemGroupSpecifier = v19;

  v21 = [(PSUIAddNewPlanController *)self createCarrierItemGroupIfNeeded:self->_carrierItemGroupSpecifier];
  [(PSUIAddNewPlanController *)self setCarrierItemGroup:v21];

  v22 = [(PSUIAddNewPlanController *)self carrierItemGroup];
  v23 = [v22 specifiers];

  if ([v23 count]) {
    [v3 addObject:self->_carrierItemGroupSpecifier];
  }
  objc_msgSend(v3, "ps_addSpecifiers:toGroup:", v23, self->_carrierItemGroupSpecifier);
  v24 = [(PSUIAddNewPlanController *)self QRCodeGroupSpecifier];
  QRCodeGroupSpecifier = self->_QRCodeGroupSpecifier;
  self->_QRCodeGroupSpecifier = v24;

  v26 = [(PSUIAddNewPlanController *)self createQRCodeGroupIfNeeded:self->_QRCodeGroupSpecifier];
  [(PSUIAddNewPlanController *)self setQRCodeGroup:v26];

  [v3 addObject:self->_QRCodeGroupSpecifier];
  v27 = [(PSUIAddNewPlanController *)self QRCodeGroup];
  v28 = [v27 specifiers];
  [v3 addObjectsFromArray:v28];

  uint64_t v29 = (int)*MEMORY[0x263F5FDB8];
  v30 = *(Class *)((char *)&self->super.super.super.super.super.isa + v29);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v29) = (Class)v3;
  id v31 = v3;

  id v32 = *(id *)((char *)&self->super.super.super.super.super.isa + v29);
  return v32;
}

- (id)pendingInstallGroupSpecifier
{
  pendingInstallGroupSpecifier = self->_pendingInstallGroupSpecifier;
  if (pendingInstallGroupSpecifier)
  {
    id v3 = pendingInstallGroupSpecifier;
  }
  else
  {
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"PENDING_INSTALL_GROUP"];
  }
  return v3;
}

- (id)transferablePlanGroupSpecifier
{
  transferablePlanGroupSpecifier = self->_transferablePlanGroupSpecifier;
  if (transferablePlanGroupSpecifier)
  {
    id v3 = transferablePlanGroupSpecifier;
  }
  else
  {
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"TRANSFER_PLAN_GROUP"];
  }
  return v3;
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
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"CARRIER_ITEM_GROUP"];
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

- (id)QRCodeGroupSpecifier
{
  QRCodeGroupSpecifier = self->_QRCodeGroupSpecifier;
  if (QRCodeGroupSpecifier)
  {
    id v3 = QRCodeGroupSpecifier;
  }
  else
  {
    id v3 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"QR_CODE_GROUP"];
  }
  return v3;
}

- (id)createPendingInstallGroupIfNeeded:(id)a3
{
  pendingInstallGroup = self->_pendingInstallGroup;
  if (pendingInstallGroup)
  {
    int v4 = pendingInstallGroup;
  }
  else
  {
    id v6 = a3;
    int v4 = [[PSUIPendingInstallPlanGroup alloc] initWithListController:self groupSpecifier:v6];
  }
  return v4;
}

- (id)createTransferablePlanGroupIfNeeded:(id)a3
{
  transferablePlanGroup = self->_transferablePlanGroup;
  if (transferablePlanGroup)
  {
    int v4 = transferablePlanGroup;
  }
  else
  {
    id v6 = a3;
    int v4 = [[PSUIPlanPendingTransferListGroup alloc] initWithListController:self groupSpecifier:v6];
  }
  return v4;
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
    int v4 = [[PSUICarrierItemGroup alloc] initWithListController:self groupSpecifier:v6 showCarrierItems:0];
  }
  return v4;
}

- (id)createAddOnGroupIfNeeded:(id)a3
{
  addOnPlanGroup = self->_addOnPlanGroup;
  if (addOnPlanGroup)
  {
    int v4 = addOnPlanGroup;
  }
  else
  {
    id v6 = a3;
    int v4 = [[PSUIAddOnPlanGroup alloc] initWithListController:self groupSpecifier:v6 showAddOnPlans:0];
  }
  return v4;
}

- (id)createQRCodeGroupIfNeeded:(id)a3
{
  QRCodeGroup = self->_QRCodeGroup;
  if (QRCodeGroup)
  {
    int v4 = QRCodeGroup;
  }
  else
  {
    id v6 = a3;
    int v4 = [[PSUIQRCodeGroup alloc] initWithListController:self groupSpecifier:v6];
  }
  return v4;
}

- (BOOL)shouldShowPendingInstallPlan
{
  v2 = [MEMORY[0x263F82670] currentDevice];
  if (objc_msgSend(v2, "sf_isiPad"))
  {
    id v3 = +[PSUICellularPlanManagerCache sharedInstance];
    int v4 = [v3 planItems];
    if ([v4 count])
    {
      v5 = +[PSUICellularPlanManagerCache sharedInstance];
      id v6 = [v5 pendingInstallPlans];
      id v7 = [v6 plans];
      BOOL v8 = [v7 count] != 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"AddNewPlanController"];
}

- (UIBarButtonItem)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (PSUIPendingInstallPlanGroup)pendingInstallGroup
{
  return self->_pendingInstallGroup;
}

- (void)setPendingInstallGroup:(id)a3
{
}

- (PSUIPlanPendingTransferListGroup)transferablePlanGroup
{
  return self->_transferablePlanGroup;
}

- (void)setTransferablePlanGroup:(id)a3
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

- (PSUIQRCodeGroup)QRCodeGroup
{
  return self->_QRCodeGroup;
}

- (void)setQRCodeGroup:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_QRCodeGroup, 0);
  objc_storeStrong((id *)&self->_addOnPlanGroup, 0);
  objc_storeStrong((id *)&self->_carrierItemGroup, 0);
  objc_storeStrong((id *)&self->_transferablePlanGroup, 0);
  objc_storeStrong((id *)&self->_pendingInstallGroup, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_QRCodeGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_addOnGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_carrierItemGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_transferablePlanGroupSpecifier, 0);
  objc_storeStrong((id *)&self->_pendingInstallGroupSpecifier, 0);
}

@end