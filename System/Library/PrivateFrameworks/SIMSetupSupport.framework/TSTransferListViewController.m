@interface TSTransferListViewController
- (BOOL)_isCarrierSetupItemSelected:(unint64_t)a3;
- (BOOL)animating;
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)customizeSpinner;
- (BOOL)followDirections;
- (BOOL)installingTransferPlan;
- (BOOL)isCarrierSetupItemSelected;
- (BOOL)isOtherButtonTapped;
- (BOOL)isStandaloneProximityFlow;
- (BOOL)requireDelayBluetoothConnection;
- (BOOL)showSIMSetup;
- (CTDeviceIdentifier)transferPlanDeviceID;
- (CTRemotePlan)transferPlan;
- (NSArray)cachedButtons;
- (NSArray)transferItems;
- (NSLayoutConstraint)heightAnchor;
- (NSMutableArray)chosenUseIndexPaths;
- (NSString)carrierNameForSelectedItem;
- (SSSpinner)spinner;
- (TSSIMSetupFlowDelegate)delegate;
- (TSTransferListViewController)initWithPendingInstallItems:(id)a3;
- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 pendingInstallItems:(id)a7 carrierSetupItems:(id)a8 showOtherOptions:(BOOL)a9;
- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 pendingInstallItems:(id)a7 carrierSetupItems:(id)a8 showOtherOptions:(BOOL)a9 isStandaloneProximityFlow:(BOOL)a10;
- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 showOtherOptions:(BOOL)a7;
- (UITableViewCell)sectionFooter;
- (UIView)spinnerContainer;
- (double)_heightAnchorConstant;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (id)_calculatePlanSelection;
- (id)getLocalizedStringIf:(id)a3 then:(id)a4 otherwise:(id)a5;
- (id)getRemoteDeviceDisplayName:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4;
- (int64_t)backOption;
- (int64_t)backToSelfOption;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelTransferringPlan;
- (void)_continueButtonTapped;
- (void)_dismissSelf;
- (void)_installSelectedPlans;
- (void)_maybeDisplayConsent:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5;
- (void)_maybeDisplayPhysicalPlanConversionAlert:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5;
- (void)_maybeUpdateTableView;
- (void)_otherButtonTapped;
- (void)_startPendingInstall:(id)a3;
- (void)_startPlanTransfer:(id)a3 withDeviceID:(id)a4;
- (void)_transferConsentOnSource;
- (void)setAnimating:(BOOL)a3;
- (void)setBackToSelfOption:(int64_t)a3;
- (void)setCachedButtons:(id)a3;
- (void)setCarrierNameForSelectedItem:(id)a3;
- (void)setChosenUseIndexPaths:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFollowDirections:(BOOL)a3;
- (void)setHeightAnchor:(id)a3;
- (void)setInstallingTransferPlan:(BOOL)a3;
- (void)setIsCarrierSetupItemSelected:(BOOL)a3;
- (void)setIsOtherButtonTapped:(BOOL)a3;
- (void)setIsStandaloneProximityFlow:(BOOL)a3;
- (void)setRequireDelayBluetoothConnection:(BOOL)a3;
- (void)setSectionFooter:(id)a3;
- (void)setShowSIMSetup:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerContainer:(id)a3;
- (void)setTransferItems:(id)a3;
- (void)setTransferPlan:(id)a3;
- (void)setTransferPlanDeviceID:(id)a3;
- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)updateFooterView;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation TSTransferListViewController

- (TSTransferListViewController)initWithPendingInstallItems:(id)a3
{
  LOBYTE(v4) = 1;
  return [(TSTransferListViewController *)self initWithTransferItems:0 confirmCellularPlanTransfer:0 isActivationPolicyMismatch:0 isDualeSIMCapabilityLoss:0 pendingInstallItems:a3 carrierSetupItems:0 showOtherOptions:v4];
}

- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 showOtherOptions:(BOOL)a7
{
  LOBYTE(v8) = a7;
  return [(TSTransferListViewController *)self initWithTransferItems:a3 confirmCellularPlanTransfer:a4 isActivationPolicyMismatch:a5 isDualeSIMCapabilityLoss:a6 pendingInstallItems:0 carrierSetupItems:0 showOtherOptions:v8];
}

- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 pendingInstallItems:(id)a7 carrierSetupItems:(id)a8 showOtherOptions:(BOOL)a9
{
  LOWORD(v10) = a9;
  return -[TSTransferListViewController initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](self, "initWithTransferItems:confirmCellularPlanTransfer:isActivationPolicyMismatch:isDualeSIMCapabilityLoss:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", a3, a4, a5, a6, a7, a8, v10);
}

- (TSTransferListViewController)initWithTransferItems:(id)a3 confirmCellularPlanTransfer:(BOOL)a4 isActivationPolicyMismatch:(BOOL)a5 isDualeSIMCapabilityLoss:(BOOL)a6 pendingInstallItems:(id)a7 carrierSetupItems:(id)a8 showOtherOptions:(BOOL)a9 isStandaloneProximityFlow:(BOOL)a10
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  id v13 = a3;
  id obj = a7;
  id v14 = a7;
  id v58 = a8;
  id v63 = a8;
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"SET_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];

  long long v67 = 0u;
  long long v68 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  id v17 = v13;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v65 objects:v69 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v66;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v66 != v20) {
          objc_enumerationMutation(v17);
        }
        v22 = [*(id *)(*((void *)&v65 + 1) + 8 * i) objectForKeyedSubscript:@"planItem"];
        if ([v22 isPhysical]) {
          [v22 isTransferablePlan];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v65 objects:v69 count:16];
    }
    while (v19);
  }

  v62 = v14;
  if ([v17 count])
  {
    v23 = [v14 plans];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v26 = v25;
      v27 = @"TRANSFER_PLAN_LIST_DETAIL_BOTH";
LABEL_17:
      v31 = [v25 localizedStringForKey:v27 value:&stru_26DBE8E78 table:@"Localizable"];
      char v32 = 0;
LABEL_21:

      v29 = v16;
      goto LABEL_22;
    }
  }
  uint64_t v28 = [v17 count];
  v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = v25;
  if (!v28)
  {
    v27 = @"TRANSFER_PLAN_LIST_DETAIL_NEW";
    goto LABEL_17;
  }
  v29 = [v25 localizedStringForKey:@"MULTI_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v31 = [v30 localizedStringForKey:@"TRANSFER_PLAN_LIST_DETAIL_TRANSFER" value:&stru_26DBE8E78 table:@"Localizable"];

  v26 = [v63 plans];
  if ([v26 count])
  {
    char v32 = 0;
LABEL_20:
    v16 = v29;
    goto LABEL_21;
  }
  uint64_t v33 = [v17 count];

  if (v33 == 1)
  {
    v34 = [v17 objectAtIndexedSubscript:0];
    v26 = [v34 objectForKeyedSubscript:@"planItem"];

    char v32 = [v26 isPhysical];
    goto LABEL_20;
  }
  char v32 = 0;
LABEL_22:
  BOOL v35 = a9;
  v64.receiver = self;
  v64.super_class = (Class)TSTransferListViewController;
  v36 = [(OBTableWelcomeController *)&v64 initWithTitle:v29 detailText:v31 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];
  if (v36)
  {
    BOOL v37 = a10;
    v36->_inBuddy = +[TSUtilities inBuddy];
    uint64_t v38 = objc_opt_new();
    chosenUseIndexPaths = v36->_chosenUseIndexPaths;
    v36->_chosenUseIndexPaths = (NSMutableArray *)v38;

    if ([v17 count])
    {
      char v56 = v32;
      v40 = (void *)MEMORY[0x263EFF980];
      v41 = [v17 objectAtIndexedSubscript:0];
      objc_msgSend(v40, "arrayWithObjects:", v41, 0);
      v42 = (NSArray *)objc_claimAutoreleasedReturnValue();

      if ((unint64_t)[v17 count] >= 2)
      {
        uint64_t v43 = 1;
        while (1)
        {
          v44 = [v17 objectAtIndexedSubscript:v43];
          v45 = [v44 objectForKeyedSubscript:@"planItem"];

          v46 = [v45 phoneNumber];
          if (![v46 length]) {
            break;
          }
          char v47 = [v45 isTransferIneligiblePlan];

          if (v47) {
            goto LABEL_30;
          }
          v48 = [v17 objectAtIndexedSubscript:v43];
          [(NSArray *)v42 insertObject:v48 atIndex:0];
LABEL_31:

          if ([v17 count] <= (unint64_t)++v43) {
            goto LABEL_32;
          }
        }

LABEL_30:
        v48 = [v17 objectAtIndexedSubscript:v43];
        [(NSArray *)v42 addObject:v48];
        goto LABEL_31;
      }
LABEL_32:
      transferItems = v36->_transferItems;
      v36->_transferItems = v42;

      char v32 = v56;
      BOOL v35 = a9;
      BOOL v37 = a10;
    }
    objc_storeStrong((id *)&v36->_pendingInstallItems, obj);
    objc_storeStrong((id *)&v36->_carrierSetupItems, v58);
    v36->_receivedPendingInstallItems = 1;
    v36->_receivedTransferItems = 1;
    v36->_continueButtonTappedOnce = 0;
    v36->_confirmCellularPlanTransfer = a4;
    v36->_isActivationPolicyMismatch = a5;
    v36->_isDualeSIMCapabilityLoss = a6;
    v36->_isSinglePhysicalSIMTransfer = v32;
    v50 = [(CTDisplayPlanList *)v36->_pendingInstallItems plans];
    uint64_t v51 = [v50 count];
    v52 = [(CTDisplayPlanList *)v36->_carrierSetupItems plans];
    v36->_numNonRemotePlanItems = [v52 count] + v51;

    v36->_installingTransferPlan = 0;
    v36->_isStandaloneProximityFlow = v37;
    v36->_backToSelfOption = 0;
    v53 = [MEMORY[0x263F08A00] defaultCenter];
    [v53 addObserver:v36 selector:sel__transferConsentOnSource name:@"transfer.consent.on.source" object:0];

    v54 = [MEMORY[0x263F08A00] defaultCenter];
    [v54 addObserver:v36 selector:sel__cancelTransferringPlan name:@"ss.user.canceled" object:0];
  }
  v36->_showOtherOptions = v35;

  return v36;
}

- (void)viewDidLoad
{
  v41.receiver = self;
  v41.super_class = (Class)TSTransferListViewController;
  [(TSOBTableWelcomeController *)&v41 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateTrayButtonText_ name:@"esim.install.state.changed" object:0];

  uint64_t v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  v5 = [(TSTransferListViewController *)self navigationController];
  v6 = [v5 view];
  [v6 setBackgroundColor:v4];

  v7 = +[OBBoldTrayButton boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v7;

  [(SSOBBoldTrayButton *)self->_continueButton addTarget:self action:sel__continueButtonTapped forControlEvents:64];
  LODWORD(v6) = self->_isSinglePhysicalSIMTransfer;
  v9 = self->_continueButton;
  uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = v10;
  if (v6) {
    v12 = @"CONVERT_TO_ESIM";
  }
  else {
    v12 = @"CONTINUE";
  }
  id v13 = [v10 localizedStringForKey:v12 value:&stru_26DBE8E78 table:@"Localizable"];
  [(SSOBBoldTrayButton *)v9 setTitle:v13 forState:0];

  [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
  id v14 = [(TSTransferListViewController *)self buttonTray];
  [v14 addButton:self->_continueButton];

  id v15 = objc_alloc(MEMORY[0x263F82C78]);
  v16 = objc_msgSend(v15, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(OBTableWelcomeController *)self setTableView:v16];

  id v17 = [(OBTableWelcomeController *)self tableView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v18 = [(OBTableWelcomeController *)self tableView];
  [v18 setRowHeight:*MEMORY[0x263F839B8]];

  uint64_t v19 = [(OBTableWelcomeController *)self tableView];
  [v19 setEstimatedRowHeight:1.0];

  uint64_t v20 = [(OBTableWelcomeController *)self tableView];
  [v20 setAllowsMultipleSelection:0];

  v21 = [(OBTableWelcomeController *)self tableView];
  [v21 setScrollEnabled:1];

  v22 = [(OBTableWelcomeController *)self tableView];
  [v22 setShowsVerticalScrollIndicator:0];

  v23 = [(OBTableWelcomeController *)self tableView];
  uint64_t v24 = [MEMORY[0x263F825C8] clearColor];
  [v23 setBackgroundColor:v24];

  v25 = [(OBTableWelcomeController *)self tableView];
  [v25 setDataSource:self];

  v26 = [(OBTableWelcomeController *)self tableView];
  [v26 setDelegate:self];

  v27 = [(OBTableWelcomeController *)self tableView];
  [v27 reloadData];

  uint64_t v28 = [(OBTableWelcomeController *)self tableView];
  v29 = [v28 heightAnchor];
  [(TSTransferListViewController *)self _heightAnchorConstant];
  objc_msgSend(v29, "constraintEqualToConstant:");
  v30 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tableHeightAnchor = self->_tableHeightAnchor;
  self->_tableHeightAnchor = v30;

  [(NSLayoutConstraint *)self->_tableHeightAnchor setActive:1];
  if (!self->_inBuddy && self->_showOtherOptions)
  {
    char v32 = [MEMORY[0x263F5B8D0] linkButton];
    uint64_t v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26DBE8E78 table:@"Localizable"];
    [v32 setTitle:v34 forState:0];

    [v32 addTarget:self action:sel__otherButtonTapped forControlEvents:64];
    BOOL v35 = [(TSTransferListViewController *)self buttonTray];
    [v35 addButton:v32];
  }
  [(TSTransferListViewController *)self updateFooterView];
  if (!+[TSUtilities inBuddy])
  {
    v36 = [(TSTransferListViewController *)self navigationController];
    BOOL v37 = [v36 navigationBar];
    uint64_t v38 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [v37 setBackgroundColor:v38];
  }
  if (+[TSUtilities inBuddy])
  {
    WeakRetained = [(TSTransferListViewController *)self navigationController];
    v40 = [WeakRetained navigationItem];
    [v40 setHidesBackButton:0];

LABEL_14:
    return;
  }
  if (!+[TSUtilities inBuddy] || self->_isStandaloneProximityFlow)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained setDefaultNavigationItems:self];
    goto LABEL_14;
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)TSTransferListViewController;
  [(OBTableWelcomeController *)&v9 viewWillAppear:a3];
  if (self->_inBuddy)
  {
    [(OBBoldTrayButton *)self->_continueButton setEnabled:self->_continueButtonTappedOnce];
    continueButton = self->_continueButton;
    BOOL continueButtonTappedOnce = self->_continueButtonTappedOnce;
LABEL_3:
    [(SSOBBoldTrayButton *)continueButton setUserInteractionEnabled:continueButtonTappedOnce];
    return;
  }
  v6 = [(OBTableWelcomeController *)self tableView];
  v7 = [v6 indexPathsForSelectedRows];
  if (![v7 count])
  {

    return;
  }
  BOOL v8 = [(TSTransferListViewController *)self customizeSpinner];

  if (!v8)
  {
    [(OBBoldTrayButton *)self->_continueButton setEnabled:1];
    continueButton = self->_continueButton;
    BOOL continueButtonTappedOnce = 1;
    goto LABEL_3;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSTransferListViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  self->_isOtherButtonTapped = 0;
  self->_requireDelayBluetoothConnection = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSTransferListViewController;
  [(TSTransferListViewController *)&v5 viewDidDisappear:a3];
  objc_super v4 = [(TSTransferListViewController *)self delegate];
  [v4 receivedResponse];
}

- (void)viewDidLayoutSubviews
{
  v3 = [(TSTransferListViewController *)self view];
  [v3 layoutIfNeeded];

  v4.receiver = self;
  v4.super_class = (Class)TSTransferListViewController;
  [(OBTableWelcomeController *)&v4 viewDidLayoutSubviews];
}

- (void)updateFooterView
{
  if (self->_isActivationPolicyMismatch)
  {
    id v3 = objc_alloc(MEMORY[0x263F82C80]);
    objc_super v4 = (UITableViewCell *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    sectionFooter = self->_sectionFooter;
    self->_sectionFooter = v4;

    v6 = [(UITableViewCell *)self->_sectionFooter textLabel];
    v7 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F83588]];
    [v6 setFont:v7];

    BOOL v8 = [(UITableViewCell *)self->_sectionFooter textLabel];
    [v8 setLineBreakMode:0];

    objc_super v9 = [(UITableViewCell *)self->_sectionFooter textLabel];
    [v9 setNumberOfLines:0];

    uint64_t v10 = [(UITableViewCell *)self->_sectionFooter textLabel];
    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"TRANSFER_PLAN_LABELS_SECTION_FOOTER_CARRIER_UNLOCK" value:&stru_26DBE8E78 table:@"Localizable"];
    [v10 setText:v12];

    id v13 = [(UITableViewCell *)self->_sectionFooter textLabel];
    [v13 setTextAlignment:1];

    id v15 = [(UITableViewCell *)self->_sectionFooter textLabel];
    id v14 = [MEMORY[0x263F825C8] systemGrayColor];
    [v15 setTextColor:v14];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_sectionFooter;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  sectionFooter = self->_sectionFooter;
  objc_super v5 = [(OBTableWelcomeController *)self tableView];
  [v5 bounds];
  -[UITableViewCell sizeThatFits:](sectionFooter, "sizeThatFits:", v6, 1.79769313e308);
  double v8 = v7;

  return v8;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return self->_numNonRemotePlanItems + [(NSArray *)self->_transferItems count];
}

- (id)getRemoteDeviceDisplayName:(id)a3
{
  id v3 = a3;
  objc_super v4 = [v3 modelName];
  objc_super v5 = v4;
  if (!v4 || ![v4 length])
  {
    uint64_t v6 = [v3 deviceName];

    objc_super v5 = (void *)v6;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [[TSCellularPlanItemCell alloc] initWithStyle:0 reuseIdentifier:@"device"];
  [(TSCellularPlanItemCell *)v6 setSelectedBackgroundView:0];
  [(TSCellularPlanItemCell *)v6 setSelectionStyle:0];
  double v7 = [(OBTableWelcomeController *)self tableView];
  double v8 = [v7 indexPathsForSelectedRows];
  int v9 = [v8 containsObject:v5];

  if (v9) {
    [(TSCellularPlanItemCell *)v6 setAccessoryType:3];
  }
  if ([(NSMutableArray *)self->_chosenUseIndexPaths containsObject:v5])
  {
    [(TSCellularPlanItemCell *)v6 setAccessoryType:3];
    [(TSCellularPlanItemCell *)v6 setDisable];
  }
  unint64_t v10 = [v5 row];
  v11 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  unint64_t v12 = [v11 count];

  id v13 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  id v14 = v13;
  if (v10 < v12)
  {
    id v15 = [v13 objectAtIndexedSubscript:v10];

    -[TSCellularPlanItemCell setIcon:](v6, "setIcon:", [v15 isPhysical]);
    v16 = [v15 carrierName];

    if (v16)
    {
      id v17 = [v15 carrierName];
      uint64_t v18 = [(TSCellularPlanItemCell *)v6 title];
      [v18 setText:v17];
    }
    else
    {
      id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v18 = [v17 localizedStringForKey:@"NEW_CELLULAR_PLAN_NO_CARRIER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
      v34 = [(TSCellularPlanItemCell *)v6 title];
      [v34 setText:v18];
    }
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = v26;
    uint64_t v28 = @"ESIM";
    goto LABEL_14;
  }
  unint64_t v19 = v10 - [v13 count];

  uint64_t v20 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
  unint64_t v21 = [v20 count];

  v22 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
  v23 = v22;
  if (v19 < v21)
  {
    id v15 = [v22 objectAtIndexedSubscript:v19];

    -[TSCellularPlanItemCell setIcon:](v6, "setIcon:", [v15 isPhysical]);
    uint64_t v24 = [v15 carrierName];
    v25 = [(TSCellularPlanItemCell *)v6 title];
    [v25 setText:v24];

    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = v26;
    uint64_t v28 = @"CELLULAR_PLAN_DETAIL";
LABEL_14:
    BOOL v35 = [v26 localizedStringForKey:v28 value:&stru_26DBE8E78 table:@"Localizable"];
    v36 = [(TSCellularPlanItemCell *)v6 planInfo];
    [v36 setText:v35];

    BOOL v37 = v6;
    goto LABEL_39;
  }
  unint64_t v29 = v19 - [v22 count];

  v30 = [(NSArray *)self->_transferItems objectAtIndex:v29];
  id v15 = [v30 objectForKeyedSubscript:@"planItem"];

  v31 = [v15 phoneNumber];
  char v32 = +[TSUtilities formattedPhoneNumber:v31 withCountryCode:0];

  -[TSCellularPlanItemCell setIcon:](v6, "setIcon:", [v15 isPhysical]);
  v85 = v32;
  if ([v32 length])
  {
    uint64_t v33 = [(TSCellularPlanItemCell *)v6 title];
    [v33 setText:v32];
  }
  else
  {
    uint64_t v33 = [v15 carrierName];
    if ([v33 length])
    {
      uint64_t v38 = [(TSCellularPlanItemCell *)v6 title];
      [v38 setText:v33];
    }
    else
    {
      uint64_t v38 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v39 = [v38 localizedStringForKey:@"TRANSFER_PLAN_ITEM_TITLE_NO_PHONENUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
      v40 = [(TSCellularPlanItemCell *)v6 title];
      [v40 setText:v39];
    }
  }

  objc_super v41 = [(NSArray *)self->_transferItems objectAtIndex:v29];
  v42 = [v41 objectForKeyedSubscript:@"deviceInfo"];
  uint64_t v43 = [(TSTransferListViewController *)self getRemoteDeviceDisplayName:v42];

  v44 = [v15 label];
  unint64_t v45 = [v15 transferCapability];
  unint64_t v46 = v45;
  if (v45 <= 0xE)
  {
    if (((1 << v45) & 0x7F17) != 0)
    {
      if ([v43 length] && objc_msgSend(v44, "length"))
      {
        char v47 = NSString;
        v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        [v48 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        unint64_t v82 = v46;
        v50 = v49 = v44;
        uint64_t v51 = objc_msgSend(v47, "stringWithFormat:", v50, v49, v43);
        v52 = [(TSCellularPlanItemCell *)v6 planInfo];
        [v52 setText:v51];

        v44 = v49;
        unint64_t v46 = v82;
      }
      else
      {
        if ([v43 length])
        {
          v53 = NSString;
          v83 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v54 = [v83 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v53, "stringWithFormat:", v54, v43);
        }
        else
        {
          if (![v44 length])
          {
            v48 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
            v80 = [v48 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_NO_DEVICE_NAME" value:&stru_26DBE8E78 table:@"Localizable"];
            v81 = [(TSCellularPlanItemCell *)v6 planInfo];
            [v81 setText:v80];

            goto LABEL_30;
          }
          v59 = NSString;
          v83 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v54 = [v83 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_NO_DEVICE_NAME_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v59, "stringWithFormat:", v54, v44);
        v60 = };
        [(TSCellularPlanItemCell *)v6 planInfo];
        v61 = v43;
        unint64_t v62 = v46;
        v64 = id v63 = v44;
        [v64 setText:v60];

        v44 = v63;
        unint64_t v46 = v62;
        uint64_t v43 = v61;
        v48 = v83;
      }
    }
    else
    {
      v55 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      [v55 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_ALREADY_TRANSFERRED" value:&stru_26DBE8E78 table:@"Localizable"];
      v57 = char v56 = v44;
      id v58 = [(TSCellularPlanItemCell *)v6 planInfo];
      [v58 setText:v57];

      v44 = v56;
      [(TSCellularPlanItemCell *)v6 setAccessoryType:3];
      v48 = [MEMORY[0x263F825C8] grayColor];
      [(TSCellularPlanItemCell *)v6 setTintColor:v48];
    }
LABEL_30:
  }
  if (+[TSUtilities isPad])
  {
    long long v65 = [v15 carrierName];
    long long v66 = [(TSCellularPlanItemCell *)v6 title];
    [v66 setText:v65];

    long long v67 = [(TSCellularPlanItemCell *)v6 planInfo];
    [v67 setText:0];

    if ([v43 length])
    {
      long long v68 = NSString;
      v84 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v69 = [v84 localizedStringForKey:@"USED_ON_%@" value:&stru_26DBE8E78 table:@"Localizable"];
      uint64_t v70 = objc_msgSend(v68, "stringWithFormat:", v69, v43);
      [(TSCellularPlanItemCell *)v6 planInfo];
      v71 = v43;
      unint64_t v72 = v46;
      v74 = v73 = v44;
      [v74 setText:v70];

      v44 = v73;
      unint64_t v46 = v72;
      uint64_t v43 = v71;
    }
  }
  if (([v15 isTransferIneligiblePlan] & 1) != 0 || v46 == 8 && self->_inBuddy)
  {
    [(TSCellularPlanItemCell *)v6 setDisable];
    v75 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v76 = [v75 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_NOT_SUPPORTED" value:&stru_26DBE8E78 table:@"Localizable"];
    v77 = [(TSCellularPlanItemCell *)v6 planInfo];
    [v77 setText:v76];
  }
  v78 = v6;

LABEL_39:
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  continueButton = self->_continueButton;
  id v7 = a4;
  id v8 = a3;
  [(OBBoldTrayButton *)continueButton setEnabled:1];
  [(SSOBBoldTrayButton *)self->_continueButton setUserInteractionEnabled:1];
  id v9 = [v8 cellForRowAtIndexPath:v7];

  [v9 setAccessoryType:3];
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v10 indexPathsForSelectedRows];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
    [(SSOBBoldTrayButton *)self->_continueButton setUserInteractionEnabled:0];
  }
  id v9 = [v10 cellForRowAtIndexPath:v6];
  [v9 setAccessoryType:0];
}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  unint64_t v6 = [v5 row];
  unint64_t numNonRemotePlanItems = self->_numNonRemotePlanItems;
  if (v6 < numNonRemotePlanItems) {
    goto LABEL_4;
  }
  uint64_t v8 = [(NSArray *)self->_transferItems objectAtIndex:v6 - numNonRemotePlanItems];
  id v9 = [v8 objectForKeyedSubscript:@"planItem"];
  id v10 = [v9 plan];
  v11 = [v10 transferAttributes];
  uint64_t v12 = [v11 transferCapability];

  if ((unint64_t)(v12 - 3) >= 5) {
    goto LABEL_4;
  }
  if ((0x1Du >> (v12 - 3))) {
    id v13 = 0;
  }
  else {
LABEL_4:
  }
    id v13 = v5;

  return v13;
}

- (double)_heightAnchorConstant
{
  v2 = [(TSTransferListViewController *)self view];
  [v2 bounds];
  double v4 = v3 * 0.42;

  return v4;
}

- (void)_otherButtonTapped
{
  double v3 = +[TSCoreTelephonyClientCache sharedInstance];
  id v4 = objc_alloc(MEMORY[0x263F02CE0]);
  BOOL inBuddy = self->_inBuddy;
  unint64_t v6 = +[TSUtilities transferablePlans:self->_transferItems];
  id v7 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  uint64_t v8 = objc_msgSend(v4, "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", inBuddy, v6, 0, objc_msgSend(v7, "count"), 0, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", self->_transferItems));
  [v3 submitSimSetupUsage:v8];

  self->_isOtherButtonTapped = 1;
  id v9 = [(TSTransferListViewController *)self delegate];
  [v9 viewControllerDidComplete:self];
}

- (id)_calculatePlanSelection
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  unint64_t v26 = +[TSUtilities transferablePlans:self->_transferItems];
  double v3 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  uint64_t v25 = [v3 count];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v4 = [(OBTableWelcomeController *)self tableView];
  id v5 = [v4 indexPathsForSelectedRows];

  id obj = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v27 = 0;
    uint64_t v9 = *(void *)v31;
    do
    {
      uint64_t v10 = 0;
      uint64_t v28 = v7;
      do
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v30 + 1) + 8 * v10);
        -[NSMutableArray addObject:](self->_chosenUseIndexPaths, "addObject:", v11, v25);
        unint64_t v12 = [v11 row];
        id v13 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
        unint64_t v14 = [v13 count];

        if (v12 >= v14)
        {
          id v15 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
          unint64_t v16 = v12 - [v15 count];

          id v17 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
          unint64_t v18 = [v17 count];

          if (v16 >= v18)
          {
            unint64_t v19 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
            unint64_t v20 = v16 - [v19 count];

            unint64_t v21 = [(NSArray *)self->_transferItems objectAtIndex:v20];
            v22 = [v21 objectForKeyedSubscript:@"planItem"];

            v27 += [v22 isTransferablePlan];
          }
          uint64_t v7 = v28;
        }
        else
        {
          ++v8;
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v7 = [obj countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v27 = 0;
  }

  v23 = objc_msgSend(objc_alloc(MEMORY[0x263F02CE0]), "initWithInBuddy:transferablePlans:selectedTransferablePlans:alsPlans:selectedAlsPlans:odaPlans:", self->_inBuddy, v26, v27, v25, v8, +[TSUtilities odaPlans:](TSUtilities, "odaPlans:", self->_transferItems));
  return v23;
}

- (void)_continueButtonTapped
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  double v3 = _TSLogDomain();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(OBTableWelcomeController *)self tableView];
    id v5 = [v4 indexPathsForSelectedRows];
    *(_DWORD *)buf = 138412546;
    v36 = v5;
    __int16 v37 = 2080;
    uint64_t v38 = "-[TSTransferListViewController _continueButtonTapped]";
    _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "selected item row: %@ @%s", buf, 0x16u);
  }
  if (!self->_continueButtonTappedOnce)
  {
    uint64_t v6 = +[TSCoreTelephonyClientCache sharedInstance];
    uint64_t v7 = [(TSTransferListViewController *)self _calculatePlanSelection];
    [v6 submitSimSetupUsage:v7];

    self->_BOOL continueButtonTappedOnce = 1;
    if (self->_isDualeSIMCapabilityLoss)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      uint64_t v8 = [(OBTableWelcomeController *)self tableView];
      uint64_t v9 = [v8 indexPathsForSelectedRows];

      uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v31;
        while (2)
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v31 != v12) {
              objc_enumerationMutation(v9);
            }
            if ([*(id *)(*((void *)&v30 + 1) + 8 * i) row] >= self->_numNonRemotePlanItems)
            {

              unint64_t v14 = (void *)MEMORY[0x263F82418];
              id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              unint64_t v16 = [v15 localizedStringForKey:@"DUAL_ESIM_LOSS_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
              id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              unint64_t v18 = [v17 localizedStringForKey:@"DUAL_ESIM_LOSS_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
              unint64_t v19 = [v14 alertControllerWithTitle:v16 message:v18 preferredStyle:1];

              unint64_t v20 = (void *)MEMORY[0x263F82400];
              unint64_t v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              v22 = [v21 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
              v29[0] = MEMORY[0x263EF8330];
              v29[1] = 3221225472;
              v29[2] = __53__TSTransferListViewController__continueButtonTapped__block_invoke;
              v29[3] = &unk_264827F48;
              v29[4] = self;
              v23 = [v20 actionWithTitle:v22 style:1 handler:v29];
              [v19 addAction:v23];

              uint64_t v24 = (void *)MEMORY[0x263F82400];
              uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
              unint64_t v26 = [v25 localizedStringForKey:@"CONTINUE" value:&stru_26DBE8E78 table:@"Localizable"];
              v28[0] = MEMORY[0x263EF8330];
              v28[1] = 3221225472;
              v28[2] = __53__TSTransferListViewController__continueButtonTapped__block_invoke_2;
              v28[3] = &unk_264827F48;
              v28[4] = self;
              uint64_t v27 = [v24 actionWithTitle:v26 style:0 handler:v28];
              [v19 addAction:v27];

              [(TSTransferListViewController *)self presentViewController:v19 animated:1 completion:0];
              return;
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
          if (v11) {
            continue;
          }
          break;
        }
      }
    }
    [(TSTransferListViewController *)self _installSelectedPlans];
  }
}

void __53__TSTransferListViewController__continueButtonTapped__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 userDidTapCancel];
}

uint64_t __53__TSTransferListViewController__continueButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _installSelectedPlans];
}

- (void)_installSelectedPlans
{
  uint64_t v70 = *MEMORY[0x263EF8340];
  v48 = objc_opt_new();
  uint64_t v51 = objc_opt_new();
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  double v3 = [(OBTableWelcomeController *)self tableView];
  id obj = [v3 indexPathsForSelectedRows];

  uint64_t v4 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
  if (v4)
  {
    v49 = 0;
    v50 = 0;
    uint64_t v6 = *(void *)v63;
    *(void *)&long long v5 = 136315138;
    long long v47 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v63 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        -[NSMutableArray addObject:](self->_chosenUseIndexPaths, "addObject:", v8, v47);
        unint64_t v9 = [v8 row];
        uint64_t v10 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
        BOOL v11 = v9 < [v10 count];

        uint64_t v12 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
        id v13 = v12;
        if (v11)
        {
          unint64_t v14 = [v12 objectAtIndexedSubscript:v9];

          id v15 = [v14 carrierName];
          carrierNameForSelectedItem = self->_carrierNameForSelectedItem;
          self->_carrierNameForSelectedItem = v15;

          id v17 = [v14 plan];
          [v51 addObject:v17];
        }
        else
        {
          uint64_t v18 = [v12 count];

          unint64_t v19 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
          unint64_t v20 = v9 - v18;
          BOOL v21 = v20 < [v19 count];

          if (v21)
          {
            v22 = _TSLogDomain();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v47;
              long long v68 = "-[TSTransferListViewController _installSelectedPlans]";
              _os_log_impl(&dword_227A17000, v22, OS_LOG_TYPE_DEFAULT, "selected carrier setup item @%s", buf, 0xCu);
            }

            self->_isCarrierSetupItemSelected = 1;
          }
          else
          {
            v23 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
            uint64_t v24 = [v23 count];

            unint64_t v25 = v20 - v24;
            unint64_t v26 = [(NSArray *)self->_transferItems objectAtIndex:v20 - v24];
            uint64_t v27 = [v26 objectForKeyedSubscript:@"planItem"];

            uint64_t v28 = [(NSArray *)self->_transferItems objectAtIndex:v25];
            unint64_t v29 = [v28 objectForKeyedSubscript:@"deviceInfo"];
            uint64_t v30 = [v29 deviceID];

            long long v31 = [v27 plan];
            [v48 addObject:v31];

            uint64_t v32 = [v27 phoneNumber];

            v49 = (void *)v32;
            v50 = (void *)v30;
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v62 objects:v69 count:16];
    }
    while (v4);
  }
  else
  {
    v49 = 0;
    v50 = 0;
  }

  if ((unint64_t)[v51 count] >= 2)
  {
    long long v33 = self->_carrierNameForSelectedItem;
    self->_carrierNameForSelectedItem = 0;
  }
  uint64_t v34 = [v48 count];
  uint64_t v35 = [v51 count];
  v36 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
  LOBYTE(v34) = v35 + v34 + [v36 count] == 0;

  if ((v34 & 1) == 0)
  {
    __int16 v37 = [(OBTableWelcomeController *)self tableView];
    [v37 setUserInteractionEnabled:0];

    [(OBBoldTrayButton *)self->_continueButton setEnabled:0];
    [(SSOBBoldTrayButton *)self->_continueButton setUserInteractionEnabled:0];
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v38 = v48;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v59;
      while (2)
      {
        for (uint64_t j = 0; j != v39; ++j)
        {
          if (*(void *)v59 != v40) {
            objc_enumerationMutation(v38);
          }
          v42 = *(void **)(*((void *)&v58 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v43 = [v42 transferAttributes];
            char v44 = [v43 isSecuredFlow];
            BOOL confirmCellularPlanTransfer = 1;
            if ((v44 & 1) == 0) {
              BOOL confirmCellularPlanTransfer = self->_confirmCellularPlanTransfer;
            }
            self->_followDirections = confirmCellularPlanTransfer;
            self->_BOOL speedBumper = 1;

            goto LABEL_32;
          }
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v58 objects:v66 count:16];
        if (v39) {
          continue;
        }
        break;
      }
    }
LABEL_32:

    objc_initWeak((id *)buf, self);
    BOOL speedBumper = self->_speedBumper;
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __53__TSTransferListViewController__installSelectedPlans__block_invoke;
    v53[3] = &unk_2648280C8;
    v53[4] = self;
    id v54 = v38;
    id v55 = v51;
    objc_copyWeak(&v57, (id *)buf);
    id v56 = v50;
    [(TSTransferListViewController *)self _maybeDisplayPhysicalPlanConversionAlert:speedBumper phoneNumber:v49 completion:v53];

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);
  }
}

void __53__TSTransferListViewController__installSelectedPlans__block_invoke(uint64_t a1, char a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = *(id *)(a1 + 32);
  if (v4)
  {
    if (a2)
    {
      long long v5 = (void *)[objc_alloc(MEMORY[0x263F02CB0]) initWithPlans:*(void *)(a1 + 40)];
      uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F02CB0]) initWithPlans:*(void *)(a1 + 48)];
      if ([*(id *)(a1 + 40) count])
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
        [WeakRetained _startPlanTransfer:v5 withDeviceID:*(void *)(a1 + 56)];
      }
      if ([*(id *)(a1 + 48) count]) {
        [v4 _startPendingInstall:v6];
      }
      uint64_t v8 = (void *)v4[159];
      if (v8)
      {
        unint64_t v9 = [v8 plans];
        uint64_t v10 = [v9 count];

        if (v10) {
          [v4 _dismissSelf];
        }
      }
    }
    else
    {
      BOOL v11 = _TSLogDomain();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 136315138;
        id v13 = "-[TSTransferListViewController _installSelectedPlans]_block_invoke";
        _os_log_impl(&dword_227A17000, v11, OS_LOG_TYPE_DEFAULT, "transfer is canceled by user @%s", (uint8_t *)&v12, 0xCu);
      }

      long long v5 = [v4 delegate];
      [v5 userDidTapCancel];
    }
  }
}

- (void)_maybeDisplayConsent:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (!a3)
  {
    (*((void (**)(id))v9 + 2))(v9);
    id v13 = v8;
    goto LABEL_16;
  }
  BOOL v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v12 = [v11 localizedStringForKey:@"TRANSFER_TARGET_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  id v13 = +[TSUtilities formattedPhoneNumber:v8 withCountryCode:0];

  BOOL confirmCellularPlanTransfer = self->_confirmCellularPlanTransfer;
  BOOL v15 = +[TSUtilities isPad];
  if (!confirmCellularPlanTransfer)
  {
    if (v15)
    {
      unint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v17 = v16;
      uint64_t v18 = @"TRANSFER_REQUEST_CONFIRMATION";
      goto LABEL_8;
    }
    v22 = NSString;
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v21 = [v17 localizedStringForKey:@"TRANSFER_REQUEST_CONFIRMATION_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_msgSend(v22, "stringWithFormat:", v21, v13, v38);
    uint64_t v19 = LABEL_11:;

    goto LABEL_12;
  }
  if (!v15)
  {
    unint64_t v20 = NSString;
    id v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v21 = [v17 localizedStringForKey:@"TRANSFER_REQUEST_CONFIRMATION_CLOUD_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_msgSend(v20, "stringWithFormat:", v21, v13, v13);
    goto LABEL_11;
  }
  unint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v17 = v16;
  uint64_t v18 = @"TRANSFER_REQUEST_CONFIRMATION_CLOUD";
LABEL_8:
  uint64_t v19 = [v16 localizedStringForKey:v18 value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_12:

  uint64_t v39 = (void *)v19;
  v23 = [MEMORY[0x263F82418] alertControllerWithTitle:v12 message:v19 preferredStyle:1];
  BOOL v24 = self->_confirmCellularPlanTransfer;
  unint64_t v25 = (void *)MEMORY[0x263F82400];
  unint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v27 = v26;
  if (v24)
  {
    uint64_t v28 = [v26 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v44[0] = MEMORY[0x263EF8330];
    v44[1] = 3221225472;
    v44[2] = __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke;
    v44[3] = &unk_264827F48;
    v44[4] = self;
    unint64_t v29 = [v25 actionWithTitle:v28 style:1 handler:v44];
    [v23 addAction:v29];

    uint64_t v30 = (void *)MEMORY[0x263F82400];
    long long v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v32 = [v31 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26DBE8E78 table:@"Localizable"];
    v43[0] = MEMORY[0x263EF8330];
    v43[1] = 3221225472;
    v43[2] = __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_154;
    v43[3] = &unk_264827F48;
    v43[4] = self;
    long long v33 = [v30 actionWithTitle:v32 style:0 handler:v43];
    [v23 addAction:v33];

    uint64_t v34 = &off_227A93000;
  }
  else
  {
    uint64_t v34 = &off_227A93000;
    uint64_t v35 = [v26 localizedStringForKey:@"OK" value:&stru_26DBE8E78 table:@"Localizable"];
    v36 = [v25 actionWithTitle:v35 style:0 handler:&__block_literal_global_4];
    [v23 addAction:v36];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = *((void *)v34 + 77);
  block[2] = __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_2;
  block[3] = &unk_264827D18;
  block[4] = self;
  id v41 = v23;
  id v42 = v10;
  id v37 = v23;
  dispatch_async(MEMORY[0x263EF83A0], block);

LABEL_16:
}

void __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    long long v5 = "-[TSTransferListViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "cancel transfer. start over @%s", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _cancelTransferringPlan];
  double v3 = [*(id *)(a1 + 32) delegate];
  [v3 userDidTapCancel];
}

uint64_t __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_154(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    long long v5 = "-[TSTransferListViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "Don't have other device, maybe show intro @%s", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _cancelTransferringPlan];
  return [*(id *)(a1 + 32) _otherButtonTapped];
}

uint64_t __76__TSTransferListViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:*(void *)(a1 + 48)];
}

- (id)getLocalizedStringIf:(id)a3 then:(id)a4 otherwise:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && [v7 length])
  {
    uint64_t v10 = NSString;
    BOOL v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v12 = [v11 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];
    id v13 = objc_msgSend(v10, "stringWithFormat:", v12, v7);
  }
  else
  {
    BOOL v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = [v11 localizedStringForKey:v9 value:&stru_26DBE8E78 table:@"Localizable"];
  }

  return v13;
}

- (void)_maybeDisplayPhysicalPlanConversionAlert:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5
{
  v52[2] = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = v9;
  if (a3)
  {
    BOOL v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v42 = [v11 localizedStringForKey:@"TRANSFER_SPEED_BUMP_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

    if (+[TSUtilities isPad])
    {
      id v41 = v8;
      int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v38 = [v12 localizedStringForKey:@"TRANSFER_TO_ESIM_DETAIL" value:&stru_26DBE8E78 table:@"Localizable"];
    }
    else
    {
      uint64_t v13 = +[TSUtilities formattedPhoneNumber:v8 withCountryCode:0];

      uint64_t v14 = +[TSCoreTelephonyClientCache sharedInstance];
      char v15 = [v14 deviceSupportsHydra];

      if (v15)
      {
        unint64_t v16 = @"TRANSFER_TO_ESIM_DETAIL_%@";
        id v17 = @"TRANSFER_TO_ESIM_DETAIL";
      }
      else
      {
        unint64_t v16 = @"TRANSFER_TO_ESIM_DETAIL_WITH_DSDS_WARNING_%@";
        id v17 = @"TRANSFER_TO_ESIM_DETAIL_WITH_DSDS_WARNING";
      }
      uint64_t v38 = [(TSTransferListViewController *)self getLocalizedStringIf:v13 then:v16 otherwise:v17];
      id v41 = (id)v13;
    }
    BOOL v18 = +[TSUtilities isPad];
    uint64_t v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    unint64_t v20 = v19;
    if (v18) {
      BOOL v21 = @"TRANSFER_ACTION";
    }
    else {
      BOOL v21 = @"TRANSFER_NUM";
    }
    uint64_t v22 = [v19 localizedStringForKey:v21 value:&stru_26DBE8E78 table:@"Localizable"];

    v23 = (void *)MEMORY[0x263F82400];
    v49[0] = MEMORY[0x263EF8330];
    v49[1] = 3221225472;
    v49[2] = __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke;
    v49[3] = &unk_264827C30;
    id v24 = v10;
    id v50 = v24;
    uint64_t v40 = (void *)v22;
    unint64_t v25 = [v23 actionWithTitle:v22 style:0 handler:v49];
    v52[0] = v25;
    unint64_t v26 = (void *)MEMORY[0x263F82400];
    uint64_t v27 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v28 = [v27 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v47[0] = MEMORY[0x263EF8330];
    v47[1] = 3221225472;
    v47[2] = __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke_2;
    v47[3] = &unk_264827C30;
    id v48 = v24;
    unint64_t v29 = [v26 actionWithTitle:v28 style:1 handler:v47];
    v52[1] = v29;
    uint64_t v30 = [MEMORY[0x263EFF8C0] arrayWithObjects:v52 count:2];

    long long v31 = [MEMORY[0x263F82418] alertControllerWithTitle:v42 message:v39 preferredStyle:1];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v32 = v30;
    uint64_t v33 = [v32 countByEnumeratingWithState:&v43 objects:v51 count:16];
    if (v33)
    {
      uint64_t v34 = v33;
      uint64_t v35 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v34; ++i)
        {
          if (*(void *)v44 != v35) {
            objc_enumerationMutation(v32);
          }
          [v31 addAction:*(void *)(*((void *)&v43 + 1) + 8 * i)];
        }
        uint64_t v34 = [v32 countByEnumeratingWithState:&v43 objects:v51 count:16];
      }
      while (v34);
    }

    id v37 = [v32 objectAtIndex:0];
    [v31 setPreferredAction:v37];

    [(TSTransferListViewController *)self presentViewController:v31 animated:1 completion:0];
    id v8 = v41;
  }
  else
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }
}

uint64_t __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __96__TSTransferListViewController__maybeDisplayPhysicalPlanConversionAlert_phoneNumber_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_startPlanTransfer:(id)a3 withDeviceID:(id)a4
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v40 = a4;
  long long v43 = self;
  objc_initWeak(&location, self);
  id v42 = objc_opt_new();
  uint64_t v6 = [v41 plans];
  LODWORD(self) = (unint64_t)[v6 count] > 1;

  if (self)
  {
    id v7 = _TSLogDomain();
    id obj = v7;
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[TSTransferListViewController _startPlanTransfer:withDeviceID:](v7, v8, v9, v10, v11, v12, v13, v14);
    }
    char v15 = 0;
LABEL_29:
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = [v41 plans];
    unint64_t v16 = 0;
    uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v53;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v18) {
            objc_enumerationMutation(obj);
          }
          unint64_t v20 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            BOOL v21 = v20;
            char v15 = [v21 phoneNumber];

            uint64_t v22 = [v21 transferAttributes];
            if ([v22 transferCapability] == 8)
            {
              if (objc_opt_respondsToSelector())
              {
                v23 = [v22 performSelector:sel_transferEndpoint];
                if (!v23)
                {
                  id v32 = _TSLogDomain();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                    -[TSTransferListViewController _startPlanTransfer:withDeviceID:](v32, v33, v34, v35, v36, v37, v38, v39);
                  }

                  goto LABEL_29;
                }
                id v24 = _TSLogDomain();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
                {
                  unint64_t v25 = [v21 iccid];
                  *(_DWORD *)buf = 138412802;
                  long long v58 = v25;
                  __int16 v59 = 2112;
                  long long v60 = v23;
                  __int16 v61 = 2080;
                  long long v62 = "-[TSTransferListViewController _startPlanTransfer:withDeviceID:]";
                  _os_log_impl(&dword_227A17000, v24, OS_LOG_TYPE_DEFAULT, "Carrier direct auth flow plan: [%@], url: %@ @%s", buf, 0x20u);
                }
                unint64_t v26 = [MEMORY[0x263F82438] sharedApplication];
                uint64_t v27 = [NSURL URLWithString:v23];
                v50[0] = MEMORY[0x263EF8330];
                v50[1] = 3221225472;
                v50[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke;
                v50[3] = &unk_264827958;
                objc_copyWeak(&v51, &location);
                v50[4] = v43;
                [v26 openURL:v27 options:MEMORY[0x263EFFA78] completionHandler:v50];

                objc_destroyWeak(&v51);
              }
            }
            else
            {
              uint64_t v28 = [v21 planID];
              [v42 addObject:v28];

              transferPlan = v43->_transferPlan;
              v43->_transferPlan = (CTRemotePlan *)v21;
              BOOL v21 = v21;
            }
            unint64_t v16 = v15;
          }
          else
          {
            BOOL v21 = _TSLogDomain();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              long long v58 = v20;
              __int16 v59 = 2080;
              long long v60 = "-[TSTransferListViewController _startPlanTransfer:withDeviceID:]";
              _os_log_error_impl(&dword_227A17000, v21, OS_LOG_TYPE_ERROR, "[E]plan [%@] is not instance of CTRemotePlan @%s", buf, 0x16u);
            }
          }
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v52 objects:v63 count:16];
        if (v17) {
          continue;
        }
        break;
      }
    }

    if ([v42 count])
    {
      uint64_t v30 = (void *)[objc_alloc(MEMORY[0x263F02CC8]) initWithPlanIdentifiers:v42];
      BOOL followDirections = v43->_followDirections;
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_187;
      v46[3] = &unk_264827ED0;
      objc_copyWeak(&v49, &location);
      v46[4] = v43;
      id v47 = v40;
      id obja = v30;
      id v48 = obja;
      [(TSTransferListViewController *)v43 _maybeDisplayConsent:followDirections phoneNumber:v16 completion:v46];

      objc_destroyWeak(&v49);
      char v15 = v16;
    }
    else
    {
      char v15 = v16;
    }
  }

  objc_destroyWeak(&location);
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if ((a2 & 1) == 0)
  {
    long long v5 = _TSLogDomain();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  uint64_t v13 = [*(id *)(a1 + 32) tableView];
  [v13 setUserInteractionEnabled:1];

  [WeakRetained[157] setEnabled:1];
  [WeakRetained[157] setUserInteractionEnabled:1];
  *((unsigned char *)WeakRetained + 1237) = 0;
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_187(uint64_t a1)
{
  v2 = (id *)(a1 + 56);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  [WeakRetained _dismissSelf];

  [*(id *)(a1 + 32) _showButtonTraySpinnerWithBusyText:&stru_26DBE8E78];
  id v4 = objc_loadWeakRetained(v2);
  [v4 setInstallingTransferPlan:1];

  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = objc_loadWeakRetained(v2);
  [v6 setTransferPlanDeviceID:v5];

  id v7 = objc_loadWeakRetained(v2);
  [v7 setBackToSelfOption:2];

  uint64_t v8 = +[TSCoreTelephonyClientCache sharedInstance];
  uint64_t v10 = *(void *)(a1 + 40);
  uint64_t v9 = *(void *)(a1 + 48);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_2;
  v11[3] = &unk_264828110;
  objc_copyWeak(&v12, v2);
  [v8 transferPlansWithIdentifier:v9 fromDevice:v10 completionHandler:v11];

  objc_destroyWeak(&v12);
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, 100000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_3;
  v6[3] = &unk_264827B08;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  id v7 = v3;
  id v5 = v3;
  dispatch_after(v4, MEMORY[0x263EF83A0], v6);

  objc_destroyWeak(&v8);
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_3(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setInstallingTransferPlan:0];

  id v4 = objc_loadWeakRetained(v2);
  id v5 = [v4 view];
  [v5 setUserInteractionEnabled:1];

  if (*(void *)(a1 + 32))
  {
    id v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 postNotificationName:@"transfer.failed" object:*(void *)(a1 + 32)];
  }
}

- (void)_startPendingInstall:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v12 = v4;
    __int16 v13 = 2080;
    uint64_t v14 = "-[TSTransferListViewController _startPendingInstall:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "plans: %@ @%s", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"CONTINUE_BUTTON_STATE_INSTALLING" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v7];

  id v8 = +[TSCoreTelephonyClientCache sharedInstance];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __53__TSTransferListViewController__startPendingInstall___block_invoke;
  v9[3] = &unk_264827EA8;
  objc_copyWeak(&v10, (id *)buf);
  v9[4] = self;
  [v8 installPendingPlanList:v4 completion:v9];

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __53__TSTransferListViewController__startPendingInstall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__TSTransferListViewController__startPendingInstall___block_invoke_2;
  block[3] = &unk_264827E30;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __53__TSTransferListViewController__startPendingInstall___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v3 = *(unsigned char **)(a1 + 40);
  if (*(void *)(a1 + 32))
  {
    [v3 setShowSIMSetup:0];
    uint64_t v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __53__TSTransferListViewController__startPendingInstall___block_invoke_2_cold_1((uint64_t *)(a1 + 32), v4);
    }

    id v5 = (void *)MEMORY[0x263F82418];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"ERROR_GENERIC_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"ERROR_TRY_AGAIN_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    id v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    uint64_t v11 = (void *)MEMORY[0x263F82400];
    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    __int16 v13 = [v12 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __53__TSTransferListViewController__startPendingInstall___block_invoke_201;
    v15[3] = &unk_264827F48;
    v15[4] = WeakRetained;
    uint64_t v14 = [v11 actionWithTitle:v13 style:1 handler:v15];
    [v10 addAction:v14];

    [WeakRetained presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    if (!v3[1232]) {
      [v3 setShowSIMSetup:1];
    }
    [WeakRetained _dismissSelf];
  }
}

void __53__TSTransferListViewController__startPendingInstall___block_invoke_201(uint64_t a1)
{
  id v1 = *(unsigned char **)(a1 + 32);
  if (!v1[1292])
  {
    id v2 = [v1 delegate];
    [v2 attemptFailed];
  }
}

- (void)_maybeUpdateTableView
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (self->_receivedPendingInstallItems && self->_receivedTransferItems)
  {
    id v3 = [(OBTableWelcomeController *)self tableView];
    [v3 reloadData];

    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = [(OBTableWelcomeController *)self tableView];
    id v5 = [v4 visibleCells];

    uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(v5);
          }
          id v10 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (([v10 isUserInteractionEnabled] & 1) != 0 || objc_msgSend(v10, "accessoryType") != 3)
          {

            return;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }

    [(OBBoldTrayButton *)self->_continueButton setEnabled:1];
    [(SSOBBoldTrayButton *)self->_continueButton setUserInteractionEnabled:1];
  }
}

- (void)_dismissSelf
{
  id v3 = [(TSTransferListViewController *)self delegate];
  [v3 viewControllerDidComplete:self];
}

- (BOOL)_isCarrierSetupItemSelected:(unint64_t)a3
{
  id v5 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  unint64_t v6 = [v5 count];

  if (v6 > a3) {
    return 0;
  }
  uint64_t v8 = [(CTDisplayPlanList *)self->_pendingInstallItems plans];
  unint64_t v9 = a3 - [v8 count];

  id v10 = [(CTDisplayPlanList *)self->_carrierSetupItems plans];
  BOOL v7 = v9 < [v10 count];

  return v7;
}

- (void)_transferConsentOnSource
{
  id v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v4 = [v3 localizedStringForKey:@"CONTINUE_BUTTON_STATE_INSTALLING" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v4];

  id v5 = [(TSTransferListViewController *)self presentedViewController];

  if (v5)
  {
    id v6 = [(TSTransferListViewController *)self presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_cancelTransferringPlan
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v3 = [(TSTransferListViewController *)self delegate];
  [v3 cancelNextPane];

  self->_requireDelayBluetoothConnection = 1;
  uint64_t v4 = +[TSCoreTelephonyClientCache sharedInstance];
  [v4 cancelTransferPlan:self->_transferPlan fromDevice:self->_transferPlanDeviceID completionHandler:&__block_literal_global_203];

  [(OBWelcomeController *)self _hideButtonTraySpinner];
  self->_BOOL continueButtonTappedOnce = 0;
  id v5 = [(OBTableWelcomeController *)self tableView];
  [v5 setUserInteractionEnabled:1];

  [(NSMutableArray *)self->_chosenUseIndexPaths removeAllObjects];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = [(OBTableWelcomeController *)self tableView];
  BOOL v7 = [v6 indexPathsForSelectedRows];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * v11);
        long long v13 = [(OBTableWelcomeController *)self tableView];
        [v13 deselectRowAtIndexPath:v12 animated:1];

        long long v14 = [(OBTableWelcomeController *)self tableView];
        [(TSTransferListViewController *)self tableView:v14 didDeselectRowAtIndexPath:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
}

void __55__TSTransferListViewController__cancelTransferringPlan__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __55__TSTransferListViewController__cancelTransferringPlan__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (BOOL)customizeSpinner
{
  return self->_animating;
}

- (int64_t)backOption
{
  return self->_backToSelfOption;
}

- (BOOL)animating
{
  return self->_animating;
}

- (void)setAnimating:(BOOL)a3
{
  self->_animating = a3;
}

- (NSArray)cachedButtons
{
  return (NSArray *)objc_getProperty(self, a2, 1304, 1);
}

- (void)setCachedButtons:(id)a3
{
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1312, 1);
}

- (void)setSpinner:(id)a3
{
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1320, 1);
}

- (void)setSpinnerContainer:(id)a3
{
}

- (TSSIMSetupFlowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (TSSIMSetupFlowDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSString)carrierNameForSelectedItem
{
  return (NSString *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setCarrierNameForSelectedItem:(id)a3
{
}

- (BOOL)isOtherButtonTapped
{
  return self->_isOtherButtonTapped;
}

- (void)setIsOtherButtonTapped:(BOOL)a3
{
  self->_isOtherButtonTapped = a3;
}

- (BOOL)installingTransferPlan
{
  return self->_installingTransferPlan;
}

- (void)setInstallingTransferPlan:(BOOL)a3
{
  self->_installingTransferPlan = a3;
}

- (BOOL)requireDelayBluetoothConnection
{
  return self->_requireDelayBluetoothConnection;
}

- (void)setRequireDelayBluetoothConnection:(BOOL)a3
{
  self->_requireDelayBluetoothConnection = a3;
}

- (BOOL)showSIMSetup
{
  return self->_showSIMSetup;
}

- (void)setShowSIMSetup:(BOOL)a3
{
  self->_showSIMSetup = a3;
}

- (BOOL)isCarrierSetupItemSelected
{
  return self->_isCarrierSetupItemSelected;
}

- (void)setIsCarrierSetupItemSelected:(BOOL)a3
{
  self->_isCarrierSetupItemSelected = a3;
}

- (int64_t)backToSelfOption
{
  return self->_backToSelfOption;
}

- (void)setBackToSelfOption:(int64_t)a3
{
  self->_backToSelfOption = a3;
}

- (BOOL)isStandaloneProximityFlow
{
  return self->_isStandaloneProximityFlow;
}

- (void)setIsStandaloneProximityFlow:(BOOL)a3
{
  self->_isStandaloneProximityFlow = a3;
}

- (BOOL)followDirections
{
  return self->_followDirections;
}

- (void)setFollowDirections:(BOOL)a3
{
  self->_BOOL followDirections = a3;
}

- (NSArray)transferItems
{
  return (NSArray *)objc_getProperty(self, a2, 1352, 1);
}

- (void)setTransferItems:(id)a3
{
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
}

- (UITableViewCell)sectionFooter
{
  return (UITableViewCell *)objc_getProperty(self, a2, 1368, 1);
}

- (void)setSectionFooter:(id)a3
{
}

- (NSMutableArray)chosenUseIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setChosenUseIndexPaths:(id)a3
{
}

- (CTRemotePlan)transferPlan
{
  return (CTRemotePlan *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setTransferPlan:(id)a3
{
}

- (CTDeviceIdentifier)transferPlanDeviceID
{
  return (CTDeviceIdentifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setTransferPlanDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transferPlanDeviceID, 0);
  objc_storeStrong((id *)&self->_transferPlan, 0);
  objc_storeStrong((id *)&self->_chosenUseIndexPaths, 0);
  objc_storeStrong((id *)&self->_sectionFooter, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_carrierNameForSelectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
}

- (void)_startPlanTransfer:(uint64_t)a3 withDeviceID:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_startPlanTransfer:(uint64_t)a3 withDeviceID:(uint64_t)a4 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __64__TSTransferListViewController__startPlanTransfer_withDeviceID___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __53__TSTransferListViewController__startPendingInstall___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 138412546;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  id v6 = "-[TSTransferListViewController _startPendingInstall:]_block_invoke_2";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]error: %@ @%s", (uint8_t *)&v3, 0x16u);
}

void __55__TSTransferListViewController__cancelTransferringPlan__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  __int16 v5 = "-[TSTransferListViewController _cancelTransferringPlan]_block_invoke";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Failed %@ @%s", (uint8_t *)&v2, 0x16u);
}

@end