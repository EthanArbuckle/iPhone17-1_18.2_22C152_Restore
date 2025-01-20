@interface TSSinglePlanTransferViewController
+ (id)getTitleAndDetailsForPlanType:(unint64_t)a3 transferCapability:(unint64_t)a4;
- (BOOL)animating;
- (BOOL)crossPlatformTransferPlanSelected;
- (BOOL)customizeSpinner;
- (BOOL)installingTransferPlan;
- (BOOL)isOtherButtonTapped;
- (BOOL)isStandaloneProximityFlow;
- (BOOL)requireDelayBluetoothConnection;
- (BOOL)showSIMSetup;
- (NSArray)cachedButtons;
- (NSString)carrierNameForSelectedItem;
- (SSSpinner)spinner;
- (TSSIMSetupFlowDelegate)delegate;
- (TSSinglePlanTransferViewController)initWithCrossPlatformTransferPlan:(id)a3;
- (TSSinglePlanTransferViewController)initWithLocalPhysical:(id)a3 carrierName:(id)a4;
- (TSSinglePlanTransferViewController)initWithPendingInstallPlan:(id)a3;
- (TSSinglePlanTransferViewController)initWithTransferPlan:(id)a3 isPhysical:(BOOL)a4 isIneligible:(BOOL)a5 inBuddy:(BOOL)a6 confirmCellularPlanTransfer:(BOOL)a7 showOtherOptions:(BOOL)a8;
- (TSSinglePlanTransferViewController)initWithTransferPlan:(id)a3 isPhysical:(BOOL)a4 isIneligible:(BOOL)a5 inBuddy:(BOOL)a6 confirmCellularPlanTransfer:(BOOL)a7 showOtherOptions:(BOOL)a8 isStandaloneProximityFlow:(BOOL)a9 transferBackPhoneNumber:(id)a10;
- (UIView)spinnerContainer;
- (double)_heightAnchorConstant;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (id)getLocalizedStringIf:(id)a3 then:(id)a4 otherwise:(id)a5;
- (id)getRemoteDeviceDisplayName:(id)a3;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (int64_t)backOption;
- (int64_t)backToSelfOption;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_cancelButtonTapped;
- (void)_cancelTransferringPlan;
- (void)_continueButtonTapped;
- (void)_maybeDisplayConsent:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5;
- (void)_maybeLaunchURLForCarrierDirectAuth:(id)a3;
- (void)_otherButtonTapped;
- (void)_showAlert:(id)a3;
- (void)_skipButtonTapped;
- (void)_startLocalPlanConversion;
- (void)_startPendingInstall:(id)a3;
- (void)_startPlanTransfer:(id)a3;
- (void)_transferConsentOnSource;
- (void)_userDisagreedTermsAndConditions;
- (void)setAnimating:(BOOL)a3;
- (void)setBackToSelfOption:(int64_t)a3;
- (void)setCachedButtons:(id)a3;
- (void)setCarrierNameForSelectedItem:(id)a3;
- (void)setCrossPlatformTransferPlanSelected:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setInstallingTransferPlan:(BOOL)a3;
- (void)setIsOtherButtonTapped:(BOOL)a3;
- (void)setIsStandaloneProximityFlow:(BOOL)a3;
- (void)setRequireDelayBluetoothConnection:(BOOL)a3;
- (void)setShowSIMSetup:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)setSpinnerContainer:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TSSinglePlanTransferViewController

- (TSSinglePlanTransferViewController)initWithTransferPlan:(id)a3 isPhysical:(BOOL)a4 isIneligible:(BOOL)a5 inBuddy:(BOOL)a6 confirmCellularPlanTransfer:(BOOL)a7 showOtherOptions:(BOOL)a8
{
  LOBYTE(v9) = 0;
  return [(TSSinglePlanTransferViewController *)self initWithTransferPlan:a3 isPhysical:a4 isIneligible:a5 inBuddy:a6 confirmCellularPlanTransfer:a7 showOtherOptions:a8 isStandaloneProximityFlow:v9 transferBackPhoneNumber:0];
}

- (TSSinglePlanTransferViewController)initWithTransferPlan:(id)a3 isPhysical:(BOOL)a4 isIneligible:(BOOL)a5 inBuddy:(BOOL)a6 confirmCellularPlanTransfer:(BOOL)a7 showOtherOptions:(BOOL)a8 isStandaloneProximityFlow:(BOOL)a9 transferBackPhoneNumber:(id)a10
{
  BOOL v10 = a5;
  BOOL v11 = a4;
  id v14 = a3;
  id v15 = a10;
  unint64_t v16 = !v11;
  if (v10) {
    unint64_t v16 = 4;
  }
  self->_unint64_t planType = v16;
  v17 = [v14 objectForKeyedSubscript:@"planItem"];
  v18 = [v17 plan];
  planItem = self->_planItem;
  self->_planItem = v18;

  v20 = [v14 objectForKeyedSubscript:@"deviceInfo"];
  v21 = [v20 deviceName];
  deviceName = self->_deviceName;
  self->_deviceName = v21;

  v23 = [(CTRemotePlan *)self->_planItem phoneNumber];
  v24 = +[TSUtilities formattedPhoneNumber:v23 withCountryCode:0];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v24;

  if (!self->_phoneNumber)
  {
    v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v27 = [v26 localizedStringForKey:@"PHONE_NUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
    v28 = self->_phoneNumber;
    self->_phoneNumber = v27;
  }
  unint64_t planType = self->_planType;
  v30 = [(CTRemotePlan *)self->_planItem transferAttributes];
  v31 = +[TSSinglePlanTransferViewController getTitleAndDetailsForPlanType:transferCapability:](TSSinglePlanTransferViewController, "getTitleAndDetailsForPlanType:transferCapability:", planType, [v30 transferCapability]);

  v32 = [v31 objectForKeyedSubscript:@"title"];
  v33 = [v31 objectForKeyedSubscript:@"details"];
  v44.receiver = self;
  v44.super_class = (Class)TSSinglePlanTransferViewController;
  v34 = [(OBTableWelcomeController *)&v44 initWithTitle:v32 detailText:v33 symbolName:@"antenna.radiowaves.left.and.right" adoptTableViewScrollView:1];
  v35 = v34;
  if (v34)
  {
    objc_storeStrong((id *)&v34->_transferPlan, a3);
    v35->_inBuddy = a6;
    v35->_confirmCellularPlanTransfer = a7;
    v35->_showOtherOptions = a8;
    v35->_isStandaloneProximityFlow = a9;
    v35->_backToSelfOption = 0;
    v36 = [(CTRemotePlan *)v35->_planItem transferAttributes];
    v35->_followDirections = [v36 isSecuredFlow] | a7;

    v35->_speedBumper = v15 == 0;
    objc_storeStrong((id *)&v35->_transferBackPhoneNumber, a10);
    v37 = [MEMORY[0x263F08A00] defaultCenter];
    [v37 addObserver:v35 selector:sel__transferConsentOnSource name:@"transfer.consent.on.source" object:0];

    v38 = [MEMORY[0x263F08A00] defaultCenter];
    [v38 addObserver:v35 selector:sel__cancelTransferringPlan name:@"ss.user.canceled" object:0];

    v39 = [MEMORY[0x263F08A00] defaultCenter];
    [v39 addObserver:v35 selector:sel__userDisagreedTermsAndConditions name:@"user.disagreed.terms.and.conditions" object:0];
  }
  return v35;
}

- (TSSinglePlanTransferViewController)initWithPendingInstallPlan:(id)a3
{
  id v5 = a3;
  self->_unint64_t planType = 2;
  v6 = [(CTRemotePlan *)self->_planItem phoneNumber];
  v7 = +[TSUtilities formattedPhoneNumber:v6 withCountryCode:0];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v7;

  self->_showOtherOptions = 1;
  if (!self->_phoneNumber)
  {
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"PHONE_NUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
    BOOL v11 = self->_phoneNumber;
    self->_phoneNumber = v10;
  }
  BOOL v12 = +[TSUtilities inBuddy];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v14 = v13;
  if (v12)
  {
    id v15 = [v13 localizedStringForKey:@"SETTING_UP_CELLULAR" value:&stru_26DBE8E78 table:@"Localizable"];

    unint64_t v16 = [v5 carrierName];
    if ([v16 length])
    {
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      v20 = @"SINGLE_ALS_INBUDDY_DETAIL_%@";
LABEL_8:
      v21 = [v18 localizedStringForKey:v20 value:&stru_26DBE8E78 table:@"Localizable"];
      v22 = [v5 carrierName];
      v23 = objc_msgSend(v17, "stringWithFormat:", v21, v22);

      goto LABEL_12;
    }
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = v24;
    v25 = @"SINGLE_ALS_INBUDDY_DETAIL_NO_CARRIER";
  }
  else
  {
    id v15 = [v13 localizedStringForKey:@"SET_UP_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];

    unint64_t v16 = [v5 carrierName];
    if ([v16 length])
    {
      v17 = NSString;
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v19 = v18;
      v20 = @"SINGLE_ALS_DETAIL_%@";
      goto LABEL_8;
    }
    v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v19 = v24;
    v25 = @"SINGLE_ALS_DETAIL_NO_CARRIER";
  }
  v23 = [v24 localizedStringForKey:v25 value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_12:

  v29.receiver = self;
  v29.super_class = (Class)TSSinglePlanTransferViewController;
  v26 = [(OBTableWelcomeController *)&v29 initWithTitle:v15 detailText:v23 symbolName:@"antenna.radiowaves.left.and.right"];
  v27 = v26;
  if (v26)
  {
    objc_storeStrong((id *)&v26->_pendingInstallPlan, a3);
    v27->_backToSelfOption = 0;
  }

  return v27;
}

- (TSSinglePlanTransferViewController)initWithCrossPlatformTransferPlan:(id)a3
{
  id v5 = a3;
  self->_unint64_t planType = 5;
  v6 = [(CTRemotePlan *)self->_planItem phoneNumber];
  v7 = +[TSUtilities formattedPhoneNumber:v6 withCountryCode:0];
  phoneNumber = self->_phoneNumber;
  self->_phoneNumber = v7;

  if (!self->_phoneNumber)
  {
    uint64_t v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v10 = [v9 localizedStringForKey:@"PHONE_NUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
    BOOL v11 = self->_phoneNumber;
    self->_phoneNumber = v10;
  }
  self->_showOtherOptions = 1;
  BOOL v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"SINGLE_ESIM_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  BOOL v14 = +[TSUtilities isPad];
  id v15 = NSString;
  unint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = v16;
  if (v14)
  {
    v18 = [v16 localizedStringForKey:@"SINGLE_ESIM_CROSSPLATFORM_TRANSFER_DETAIL_NO_NUMBER_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    v19 = [v5 carrierName];
    v20 = objc_msgSend(v15, "stringWithFormat:", v18, v19);
  }
  else
  {
    v18 = [v16 localizedStringForKey:@"SINGLE_ESIM_CROSSPLATFORM_TRANSFER_DETAIL_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    v19 = [v5 phoneNumber];
    v21 = [v5 carrierName];
    v20 = objc_msgSend(v15, "stringWithFormat:", v18, v19, v21);
  }
  v25.receiver = self;
  v25.super_class = (Class)TSSinglePlanTransferViewController;
  v22 = [(OBTableWelcomeController *)&v25 initWithTitle:v13 detailText:v20 symbolName:@"antenna.radiowaves.left.and.right"];
  v23 = v22;
  if (v22) {
    objc_storeStrong((id *)&v22->_crossPlatformTransferPlan, a3);
  }

  return v23;
}

- (TSSinglePlanTransferViewController)initWithLocalPhysical:(id)a3 carrierName:(id)a4
{
  id v6 = a3;
  v7 = (void *)MEMORY[0x263F086E0];
  id v8 = a4;
  uint64_t v9 = [v7 bundleForClass:objc_opt_class()];
  BOOL v10 = [v9 localizedStringForKey:@"CONVERT_TO_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];

  BOOL v11 = NSString;
  BOOL v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"ON_DEVICE_PHYSICAL_TRANSFER_DETAIL_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
  BOOL v14 = objc_msgSend(v11, "stringWithFormat:", v13, v8, v6);

  v33.receiver = self;
  v33.super_class = (Class)TSSinglePlanTransferViewController;
  id v15 = [(OBTableWelcomeController *)&v33 initWithTitle:v10 detailText:&stru_26DBE8E78 symbolName:@"antenna.radiowaves.left.and.right"];
  unint64_t v16 = v15;
  if (v15)
  {
    v15->_unint64_t planType = 3;
    uint64_t v17 = +[TSUtilities formattedPhoneNumber:v6 withCountryCode:0];
    phoneNumber = v16->_phoneNumber;
    v16->_phoneNumber = (NSString *)v17;

    if (!v16->_phoneNumber)
    {
      v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v20 = [v19 localizedStringForKey:@"PHONE_NUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
      v21 = v16->_phoneNumber;
      v16->_phoneNumber = (NSString *)v20;
    }
    v22 = [(TSSinglePlanTransferViewController *)v16 headerView];
    [v22 addDetailLabel:v14 withPhoneNumber:v16->_phoneNumber];

    v16->_followDirections = 0;
    v16->_speedBumper = 1;
    v16->_backToSelfOption = 0;
    v23 = v16;
  }
  else
  {
    v24 = _TSLogDomain();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      -[TSSinglePlanTransferViewController initWithLocalPhysical:carrierName:](v24, v25, v26, v27, v28, v29, v30, v31);
    }
  }
  return v16;
}

+ (id)getTitleAndDetailsForPlanType:(unint64_t)a3 transferCapability:(unint64_t)a4
{
  v32[2] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 0uLL:
      BOOL v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v14 localizedStringForKey:@"SET_UP_ESIM" value:&stru_26DBE8E78 table:@"Localizable"];

      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      unint64_t v16 = v15;
      uint64_t v17 = @"PHYSICAL_TRANSFER_DETAIL";
      goto LABEL_11;
    case 1uLL:
      v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v18 localizedStringForKey:@"SINGLE_ESIM_TRANSFER_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

      id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      unint64_t v16 = v15;
      uint64_t v17 = @"SINGLE_ESIM_TRANSFER_DETAIL";
LABEL_11:
      BOOL v12 = [v15 localizedStringForKey:v17 value:&stru_26DBE8E78 table:@"Localizable"];

      goto LABEL_12;
    case 2uLL:
    case 3uLL:
      v4 = _TSLogDomain();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
        +[TSSinglePlanTransferViewController getTitleAndDetailsForPlanType:transferCapability:](v4, v5, v6, v7, v8, v9, v10, v11);
      }

      goto LABEL_5;
    case 4uLL:
      uint64_t v20 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v13 = [v20 localizedStringForKey:@"TRANSFER_INELIGIBLE_PLAN" value:&stru_26DBE8E78 table:@"Localizable"];

      switch(a4)
      {
        case 0uLL:
        case 2uLL:
        case 3uLL:
        case 4uLL:
        case 5uLL:
        case 6uLL:
        case 7uLL:
        case 8uLL:
        case 0xAuLL:
          id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          unint64_t v16 = v15;
          uint64_t v17 = @"SINGLE_INELIGIBLE_ESIM_TRANSFER_UNKNOWN";
          goto LABEL_11;
        case 1uLL:
        case 0xCuLL:
          id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          unint64_t v16 = v15;
          uint64_t v17 = @"SINGLE_INELIGIBLE_ESIM_TRANSFER_NOT_SUPPORTED_DETAIL";
          goto LABEL_11;
        case 9uLL:
          id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          unint64_t v16 = v15;
          uint64_t v17 = @"SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL";
          goto LABEL_11;
        case 0xBuLL:
          id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          unint64_t v16 = v15;
          uint64_t v17 = @"SINGLE_INELIGIBLE_ESIM_TRANSFER_CAPABILITY_INELIGIBLE_DETAIL_ACTIVATION_POLICY_MISMATCH_CARRIER_UNLOCK";
          goto LABEL_11;
        case 0xDuLL:
          v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v24 = [v23 localizedStringForKey:@"TRANSFER_UPDATE_REQUIRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

          uint64_t v25 = NSString;
          uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v27 = v26;
          uint64_t v28 = @"TRANSFER_TARGET_UPDATE_REQUIRED_DETAIL";
          goto LABEL_21;
        case 0xEuLL:
          uint64_t v29 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v24 = [v29 localizedStringForKey:@"TRANSFER_UPDATE_REQUIRED_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

          uint64_t v25 = NSString;
          uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v27 = v26;
          uint64_t v28 = @"TRANSFER_SOURCE_UPDATE_REQUIRED_DETAIL";
LABEL_21:
          uint64_t v30 = [v26 localizedStringForKey:v28 value:&stru_26DBE8E78 table:@"Localizable"];
          BOOL v12 = [v25 stringWithFormat:v30];

          v13 = (void *)v24;
          break;
        default:
          BOOL v12 = 0;
          break;
      }
      goto LABEL_12;
    default:
LABEL_5:
      BOOL v12 = 0;
      v13 = 0;
LABEL_12:
      v31[0] = @"title";
      v31[1] = @"details";
      v32[0] = v13;
      v32[1] = v12;
      v21 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];

      return v21;
  }
}

- (void)viewDidLoad
{
  v37.receiver = self;
  v37.super_class = (Class)TSSinglePlanTransferViewController;
  [(TSOBTableWelcomeController *)&v37 viewDidLoad];
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel__updateTrayButtonText_ name:@"esim.install.state.changed" object:0];

  self->_inBuddy = +[TSUtilities inBuddy];
  v4 = [MEMORY[0x263F825C8] systemBackgroundColor];
  uint64_t v5 = [(TSSinglePlanTransferViewController *)self navigationController];
  uint64_t v6 = [v5 view];
  [v6 setBackgroundColor:v4];

  if (+[TSUtilities inBuddy] && self->_planType == 2 && self->_pendingInstallPlan)
  {
    -[TSSinglePlanTransferViewController _startPendingInstall:](self, "_startPendingInstall:");
    uint64_t v7 = +[TSCoreTelephonyClientCache sharedInstance];
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F02CE0]) initWithInBuddy:1 transferablePlans:0 selectedTransferablePlans:0 alsPlans:1 selectedAlsPlans:1 odaPlans:0];
    [v7 submitSimSetupUsage:v8];

    goto LABEL_25;
  }
  if (self->_transferPlan)
  {
    id v9 = objc_alloc(MEMORY[0x263F82C78]);
    uint64_t v10 = objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(OBTableWelcomeController *)self setTableView:v10];

    uint64_t v11 = [(OBTableWelcomeController *)self tableView];
    [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

    BOOL v12 = [(OBTableWelcomeController *)self tableView];
    [v12 setRowHeight:*MEMORY[0x263F839B8]];

    v13 = [(OBTableWelcomeController *)self tableView];
    [v13 setEstimatedRowHeight:1.0];

    BOOL v14 = [(OBTableWelcomeController *)self tableView];
    [v14 setAllowsMultipleSelection:0];

    id v15 = [(OBTableWelcomeController *)self tableView];
    [v15 setScrollEnabled:1];

    unint64_t v16 = [(OBTableWelcomeController *)self tableView];
    uint64_t v17 = [MEMORY[0x263F825C8] clearColor];
    [v16 setBackgroundColor:v17];

    v18 = [(OBTableWelcomeController *)self tableView];
    [v18 setDataSource:self];

    v19 = [(OBTableWelcomeController *)self tableView];
    [v19 reloadData];

    uint64_t v20 = [(OBTableWelcomeController *)self tableView];
    v21 = [v20 heightAnchor];
    [(TSSinglePlanTransferViewController *)self _heightAnchorConstant];
    objc_msgSend(v21, "constraintEqualToConstant:");
    v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    tableHeightAnchor = self->_tableHeightAnchor;
    self->_tableHeightAnchor = v22;

    [(NSLayoutConstraint *)self->_tableHeightAnchor setActive:1];
  }
  uint64_t v24 = +[OBBoldTrayButton boldButton];
  continueButton = self->_continueButton;
  self->_continueButton = v24;

  [(SSOBBoldTrayButton *)self->_continueButton addTarget:self action:sel__continueButtonTapped forControlEvents:64];
  unint64_t planType = self->_planType;
  switch(planType)
  {
    case 5uLL:
      uint64_t v27 = self->_continueButton;
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v29 = v28;
      uint64_t v30 = @"CONTINUE";
      goto LABEL_13;
    case 3uLL:
      uint64_t v27 = self->_continueButton;
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v29 = v28;
      uint64_t v30 = @"PHYSICAL_TRANSFER_CONTINUE";
      goto LABEL_13;
    case 2uLL:
      uint64_t v27 = self->_continueButton;
      uint64_t v28 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v29 = v28;
      uint64_t v30 = @"SET_UP_ESIM";
LABEL_13:
      uint64_t v31 = [v28 localizedStringForKey:v30 value:&stru_26DBE8E78 table:@"Localizable"];
      [(SSOBBoldTrayButton *)v27 setTitle:v31 forState:0];

      unint64_t planType = self->_planType;
      break;
  }
  if (planType > 5
    || ((1 << planType) & 0x2C) == 0
    || ([(TSSinglePlanTransferViewController *)self buttonTray],
        v32 = objc_claimAutoreleasedReturnValue(),
        [v32 addButton:self->_continueButton],
        v32,
        self->_planType != 3))
  {
    if (!self->_transferBackPhoneNumber
      && !+[TSUtilities inBuddy]
      && self->_showOtherOptions)
    {
      objc_super v33 = [MEMORY[0x263F5B8D0] linkButton];
      [v33 addTarget:self action:sel__otherButtonTapped forControlEvents:64];
      v34 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v35 = [v34 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26DBE8E78 table:@"Localizable"];
      [v33 setTitle:v35 forState:0];

      v36 = [(TSSinglePlanTransferViewController *)self buttonTray];
      [v36 addButton:v33];
    }
  }
  if (+[TSUtilities inBuddy])
  {
    if (!self->_isStandaloneProximityFlow) {
      return;
    }
    uint64_t v7 = [(OBBaseWelcomeController *)self navigationItem];
    [v7 setHidesBackButton:1];
  }
  else
  {
    uint64_t v7 = [(TSSinglePlanTransferViewController *)self delegate];
    [v7 setDefaultNavigationItems:self];
  }
LABEL_25:
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TSSinglePlanTransferViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  self->_isOtherButtonTapped = 0;
  self->_requireDelayBluetoothConnection = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)TSSinglePlanTransferViewController;
  [(TSSinglePlanTransferViewController *)&v5 viewDidDisappear:a3];
  if ([(TSSinglePlanTransferViewController *)self showSIMSetup])
  {
    objc_super v4 = [(TSSinglePlanTransferViewController *)self delegate];
    [v4 receivedResponse];
  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (+[TSUtilities inBuddy]) {
    return 2;
  }
  else {
    return 1;
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
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
  uint64_t v6 = NSString;
  id v7 = a4;
  id v8 = a3;
  id v9 = objc_msgSend(v6, "stringWithFormat:", @"options%ld", objc_msgSend(v7, "section"));
  uint64_t v10 = [v8 dequeueReusableCellWithIdentifier:v9];

  if (!v10) {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F82C80]) initWithStyle:3 reuseIdentifier:v9];
  }
  uint64_t v11 = [v10 contentView];
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  [v10 setAccessoryType:1];
  BOOL v12 = [MEMORY[0x263F825C8] secondarySystemBackgroundColor];
  [v10 setBackgroundColor:v12];

  v13 = [v10 textLabel];
  [v13 setLineBreakMode:0];

  BOOL v14 = [v10 textLabel];
  [v14 setNumberOfLines:0];

  id v15 = [v10 textLabel];
  [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

  unint64_t v16 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835D0]];
  uint64_t v17 = [v10 textLabel];
  [v17 setFont:v16];

  v18 = [v10 detailTextLabel];
  [v18 setLineBreakMode:0];

  v19 = [v10 detailTextLabel];
  [v19 setNumberOfLines:0];

  uint64_t v20 = [v10 detailTextLabel];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  v21 = [MEMORY[0x263F81708] preferredFontForTextStyle:*MEMORY[0x263F835F0]];
  v22 = [v10 detailTextLabel];
  [v22 setFont:v21];

  uint64_t v23 = [v7 section];
  if (!v23)
  {
    transferPlan = self->_transferPlan;
    if (transferPlan)
    {
      uint64_t v30 = [(NSDictionary *)transferPlan objectForKeyedSubscript:@"planItem"];
      objc_super v33 = [(NSDictionary *)self->_transferPlan objectForKeyedSubscript:@"deviceInfo"];
      v34 = [(TSSinglePlanTransferViewController *)self getRemoteDeviceDisplayName:v33];

      v35 = [v30 label];
      v64 = v35;
      if (+[TSUtilities isPad])
      {
        v36 = [v30 carrierName];
        if ([v36 length])
        {
          uint64_t v25 = [v30 carrierName];
        }
        else
        {
          v41 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v25 = [v41 localizedStringForKey:@"TRANSFER_PLAN_ITEM_TITLE_NO_CARRIER_NAME" value:&stru_26DBE8E78 table:@"Localizable"];
        }
        unint64_t v31 = 0x263F82000uLL;

        if ([v34 length])
        {
          v42 = NSString;
          v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v43 = [v39 localizedStringForKey:@"USED_ON_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          objc_msgSend(v42, "stringWithFormat:", v43, v34, deviceName);
          uint64_t v27 = LABEL_27:;

LABEL_33:
          uint64_t v28 = [MEMORY[0x263F827E8] systemImageNamed:@"iphone.and.arrow.forward"];
          v47 = [v10 textLabel];
          [v47 setText:v25];

          v48 = [v10 detailTextLabel];
          [v48 setText:v27];

          goto LABEL_34;
        }
LABEL_32:
        v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v27 = [v39 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_NO_DEVICE_NAME" value:&stru_26DBE8E78 table:@"Localizable"];
        goto LABEL_33;
      }
      if (self->_planType != 4)
      {
        objc_super v37 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v25 = [v37 localizedStringForKey:@"TRANSFER_PLAN_ITEM_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

        if ([(NSString *)self->_phoneNumber length])
        {
          v38 = NSString;
          v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v40 = [v39 localizedStringForKey:@"TRANSFER_PLAN_ITEM_SUBTITLE_@" value:&stru_26DBE8E78 table:@"Localizable"];
          uint64_t v27 = objc_msgSend(v38, "stringWithFormat:", v40, self->_phoneNumber);
        }
        else
        {
          v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          uint64_t v27 = [v39 localizedStringForKey:@"TRANSFER_PLAN_ITEM_SUBTITLE_NO_PHONENUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
        }
        unint64_t v31 = 0x263F82000;
        goto LABEL_33;
      }
      if ([(NSString *)self->_phoneNumber length])
      {
        uint64_t v25 = self->_phoneNumber;
      }
      else
      {
        objc_super v44 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        uint64_t v25 = [v44 localizedStringForKey:@"TRANSFER_PLAN_ITEM_TITLE_NO_PHONENUMBER" value:&stru_26DBE8E78 table:@"Localizable"];
      }
      unint64_t v31 = 0x263F82000;
      if (-[NSString length](self->_deviceName, "length") && [v35 length])
      {
        v63 = NSString;
        v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v43 = [v39 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        deviceName = self->_deviceName;
        v45 = (NSString *)v64;
      }
      else
      {
        if (![(NSString *)self->_deviceName length])
        {
          if (![v35 length]) {
            goto LABEL_32;
          }
          v46 = (NSString *)v35;
          v63 = NSString;
          v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v43 = [v39 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_WITH_LABEL_NO_DEVICE_NAME_%@" value:&stru_26DBE8E78 table:@"Localizable"];
          v61 = v46;
LABEL_26:
          objc_msgSend(v63, "stringWithFormat:", v43, v61, deviceName);
          goto LABEL_27;
        }
        v63 = NSString;
        v39 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v43 = [v39 localizedStringForKey:@"TRANSFER_PLAN_ITEM_DETAIL_%@" value:&stru_26DBE8E78 table:@"Localizable"];
        v45 = self->_deviceName;
      }
      v61 = v45;
      goto LABEL_26;
    }
  }
  if (!+[TSUtilities inBuddy])
  {
    uint64_t v27 = 0;
    uint64_t v25 = 0;
    uint64_t v28 = 0;
    unint64_t v31 = 0x263F82000;
    goto LABEL_35;
  }
  uint64_t v24 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v25 = [v24 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_26DBE8E78 table:@"Localizable"];

  uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v27 = [v26 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS_SUB" value:&stru_26DBE8E78 table:@"Localizable"];

  uint64_t v28 = [MEMORY[0x263F827E8] systemImageNamed:@"gear"];
  uint64_t v29 = [v10 textLabel];
  [v29 setText:v25];

  uint64_t v30 = [v10 detailTextLabel];
  [v30 setText:v27];
  unint64_t v31 = 0x263F82000;
LABEL_34:

LABEL_35:
  v49 = [*(id *)(v31 + 1480) systemBlueColor];
  v50 = [v28 imageWithTintColor:v49];

  [v50 size];
  CGFloat v52 = v51 * 1.5;
  [v50 size];
  v66.height = v53 * 1.5;
  v66.width = v52;
  UIGraphicsBeginImageContextWithOptions(v66, 0, 0.0);
  [v50 size];
  double v55 = v54 * 1.5;
  [v50 size];
  objc_msgSend(v50, "drawInRect:", 0.0, 0.0, v55, v56 * 1.5);
  v57 = UIGraphicsGetImageFromCurrentImageContext();
  UIGraphicsEndImageContext();
  id v58 = (id)[v57 imageWithRenderingMode:1];
  v59 = [v10 imageView];
  [v59 setImage:v57];

  if (self->_planType == 4)
  {
    [v10 setSelectionStyle:0];
    [v10 setAccessoryType:0];
  }

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5 = a4;
  if (self->_planType != 4)
  {
    id v7 = v5;
    if ([v5 section])
    {
      if ([v7 section] == 1) {
        [(TSSinglePlanTransferViewController *)self _skipButtonTapped];
      }
    }
    else
    {
      [(TSSinglePlanTransferViewController *)self _continueButtonTapped];
    }
    uint64_t v6 = [(OBTableWelcomeController *)self tableView];
    [v6 deselectRowAtIndexPath:v7 animated:1];

    id v5 = v7;
  }
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.100000001;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4 = objc_alloc(MEMORY[0x263F82E00]);
  id v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  return v5;
}

- (id)getLocalizedStringIf:(id)a3 then:(id)a4 otherwise:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v7 && [v7 length])
  {
    uint64_t v10 = NSString;
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    BOOL v12 = [v11 localizedStringForKey:v8 value:&stru_26DBE8E78 table:@"Localizable"];
    v13 = objc_msgSend(v10, "stringWithFormat:", v12, v7);
  }
  else
  {
    uint64_t v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v11 localizedStringForKey:v9 value:&stru_26DBE8E78 table:@"Localizable"];
  }

  return v13;
}

- (void)_continueButtonTapped
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v2 = *a1;
  int v3 = 134218242;
  uint64_t v4 = v2;
  __int16 v5 = 2080;
  uint64_t v6 = "-[TSSinglePlanTransferViewController _continueButtonTapped]";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]unexpected plan type %lu @%s", (uint8_t *)&v3, 0x16u);
}

uint64_t __59__TSSinglePlanTransferViewController__continueButtonTapped__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[154] == 3) {
    return [v1 _startLocalPlanConversion];
  }
  else {
    return [v1 _startPlanTransfer:v1[155]];
  }
}

uint64_t __59__TSSinglePlanTransferViewController__continueButtonTapped__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cancelButtonTapped];
}

- (void)_cancelButtonTapped
{
  if (self->_planType != 4)
  {
    int v3 = +[TSCoreTelephonyClientCache sharedInstance];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F02CE0]) initWithInBuddy:0 transferablePlans:self->_planType != 2 selectedTransferablePlans:0 alsPlans:self->_planType == 2 selectedAlsPlans:0 odaPlans:0];
    [v3 submitSimSetupUsage:v4];
  }
  id v5 = [(TSSinglePlanTransferViewController *)self delegate];
  [v5 userDidTapCancel];
}

- (void)_otherButtonTapped
{
  if (self->_planType != 4)
  {
    int v3 = +[TSCoreTelephonyClientCache sharedInstance];
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F02CE0]) initWithInBuddy:0 transferablePlans:self->_planType != 2 selectedTransferablePlans:0 alsPlans:self->_planType == 2 selectedAlsPlans:0 odaPlans:0];
    [v3 submitSimSetupUsage:v4];
  }
  self->_isOtherButtonTapped = 1;
  id v5 = [(TSSinglePlanTransferViewController *)self delegate];
  [v5 viewControllerDidComplete:self];
}

- (void)_skipButtonTapped
{
  if (self->_planType == 2
    || (+[TSCoreTelephonyClientCache sharedInstance],
        int v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 isEmbeddedSIMOnlyConfig],
        v3,
        v4))
  {
    id v5 = (void *)MEMORY[0x263F82418];
    uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v7 = [v6 localizedStringForKey:@"SKIP_SETUP_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"SKIP_SETUP_MESSAGE" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    uint64_t v11 = (void *)MEMORY[0x263F82400];
    BOOL v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"SKIP" value:&stru_26DBE8E78 table:@"Localizable"];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __55__TSSinglePlanTransferViewController__skipButtonTapped__block_invoke;
    v20[3] = &unk_264827F48;
    v20[4] = self;
    BOOL v14 = [v11 actionWithTitle:v13 style:1 handler:v20];
    [v10 addAction:v14];

    id v15 = (void *)MEMORY[0x263F82400];
    unint64_t v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v17 = [v16 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v18 = [v15 actionWithTitle:v17 style:0 handler:&__block_literal_global_19];
    [v10 addAction:v18];

    [(TSSinglePlanTransferViewController *)self presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    id v19 = [(TSSinglePlanTransferViewController *)self delegate];
    [v19 userDidTapCancel];
  }
}

void __55__TSSinglePlanTransferViewController__skipButtonTapped__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) delegate];
  [v1 userDidTapCancel];
}

- (void)_startLocalPlanConversion
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  int v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v4 = [v3 localizedStringForKey:@"CONTINUE_BUTTON_STATE_INSTALLING" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v4];

  id v5 = +[TSCoreTelephonyClientCache sharedInstance];
  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x263F02CE0]) initWithInBuddy:0 transferablePlans:1 selectedTransferablePlans:1 alsPlans:0 selectedAlsPlans:0 odaPlans:0];
  [v5 submitSimSetupUsage:v6];

  uint64_t v7 = _TSLogDomain();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v13 = "-[TSSinglePlanTransferViewController _startLocalPlanConversion]";
    _os_log_impl(&dword_227A17000, v7, OS_LOG_TYPE_DEFAULT, "Start converting local 4FF @%s", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  id v8 = [(TSSinglePlanTransferViewController *)self delegate];
  [v8 viewControllerDidComplete:self];

  id v9 = +[TSCoreTelephonyClientCache sharedInstance];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke;
  v10[3] = &unk_264828110;
  objc_copyWeak(&v11, (id *)buf);
  [v9 convertPhysicalSIMToeSIMWithCompletion:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke_2;
  v5[3] = &unk_264827B08;
  objc_copyWeak(&v7, (id *)(a1 + 32));
  id v6 = v3;
  id v4 = v3;
  dispatch_async(MEMORY[0x263EF83A0], v5);

  objc_destroyWeak(&v7);
}

void __63__TSSinglePlanTransferViewController__startLocalPlanConversion__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && *(void *)(a1 + 32))
  {
    id v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 postNotificationName:@"transfer.failed" object:*(void *)(a1 + 32)];

    id v4 = _TSLogDomain();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2080;
      id v9 = "-[TSSinglePlanTransferViewController _startLocalPlanConversion]_block_invoke_2";
      _os_log_impl(&dword_227A17000, v4, OS_LOG_TYPE_DEFAULT, "%@ @%s", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (void)_startPlanTransfer:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = _TSLogDomain();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v19 = v4;
    __int16 v20 = 2080;
    v21 = "-[TSSinglePlanTransferViewController _startPlanTransfer:]";
    _os_log_impl(&dword_227A17000, v5, OS_LOG_TYPE_DEFAULT, "plan: %@ @%s", buf, 0x16u);
  }

  int v6 = +[TSCoreTelephonyClientCache sharedInstance];
  uint64_t v7 = (void *)[objc_alloc(MEMORY[0x263F02CE0]) initWithInBuddy:0 transferablePlans:1 selectedTransferablePlans:1 alsPlans:0 selectedAlsPlans:0 odaPlans:0];
  [v6 submitSimSetupUsage:v7];

  __int16 v8 = [v4 objectForKeyedSubscript:@"planItem"];
  id v9 = [v8 plan];
  uint64_t v10 = [v9 transferAttributes];
  BOOL v11 = [v10 transferCapability] == 8;

  if (v11)
  {
    [(TSSinglePlanTransferViewController *)self _maybeLaunchURLForCarrierDirectAuth:v8];
  }
  else
  {
    objc_initWeak((id *)buf, self);
    BOOL followDirections = self->_followDirections;
    v13 = [v8 phoneNumber];
    uint64_t v14 = +[TSUtilities formattedPhoneNumber:v13 withCountryCode:0];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke;
    v15[3] = &unk_264827E30;
    objc_copyWeak(&v17, (id *)buf);
    v15[4] = self;
    id v16 = v4;
    [(TSSinglePlanTransferViewController *)self _maybeDisplayConsent:followDirections phoneNumber:v14 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);
  }
}

void __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke(id *a1)
{
  uint64_t v2 = a1 + 6;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  [WeakRetained setInstallingTransferPlan:1];

  [a1[4] _showButtonTraySpinnerWithBusyText:&stru_26DBE8E78];
  id v4 = objc_loadWeakRetained(v2);
  uint64_t v5 = [v4 delegate];
  id v6 = objc_loadWeakRetained(v2);
  [v5 viewControllerDidComplete:v6];

  id v7 = objc_loadWeakRetained(v2);
  [v7 setBackToSelfOption:2];

  __int16 v8 = +[TSCoreTelephonyClientCache sharedInstance];
  id v9 = [a1[5] objectForKeyedSubscript:@"planItem"];
  uint64_t v10 = [v9 plan];
  BOOL v11 = [v10 planID];
  BOOL v12 = [a1[5] objectForKeyedSubscript:@"deviceInfo"];
  v13 = [v12 deviceID];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_2;
  v14[3] = &unk_264828110;
  objc_copyWeak(&v15, v2);
  [v8 transferPlanWithIdentifier:v11 fromDevice:v13 completionHandler:v14];

  objc_destroyWeak(&v15);
}

void __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  dispatch_time_t v4 = dispatch_time(0, 100000000);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_3;
  v6[3] = &unk_264827A98;
  id v7 = v3;
  id v5 = v3;
  objc_copyWeak(&v8, (id *)(a1 + 32));
  dispatch_after(v4, MEMORY[0x263EF83A0], v6);
  objc_destroyWeak(&v8);
}

void __57__TSSinglePlanTransferViewController__startPlanTransfer___block_invoke_3(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
    [v2 postNotificationName:@"transfer.failed" object:*(void *)(a1 + 32)];
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setInstallingTransferPlan:0];
}

- (void)_cancelTransferringPlan
{
  id v3 = [(TSSinglePlanTransferViewController *)self delegate];
  [v3 cancelNextPane];

  self->_requireDelayBluetoothConnection = 1;
  dispatch_time_t v4 = +[TSCoreTelephonyClientCache sharedInstance];
  planItem = self->_planItem;
  id v6 = [(NSDictionary *)self->_transferPlan objectForKeyedSubscript:@"deviceInfo"];
  id v7 = [v6 deviceID];
  [v4 cancelTransferPlan:planItem fromDevice:v7 completionHandler:&__block_literal_global_258];

  [(OBWelcomeController *)self _hideButtonTraySpinner];
}

void __61__TSSinglePlanTransferViewController__cancelTransferringPlan__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    id v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __61__TSSinglePlanTransferViewController__cancelTransferringPlan__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (void)_startPendingInstall:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 carrierName];
  carrierNameForSelectedItem = self->_carrierNameForSelectedItem;
  self->_carrierNameForSelectedItem = v5;

  id v7 = [v4 plan];
  id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v9 = [v8 localizedStringForKey:@"CONTINUE_BUTTON_STATE_INSTALLING" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v9];

  uint64_t v10 = +[TSCoreTelephonyClientCache sharedInstance];
  BOOL v11 = (void *)[objc_alloc(MEMORY[0x263F02CE0]) initWithInBuddy:0 transferablePlans:0 selectedTransferablePlans:0 alsPlans:1 selectedAlsPlans:1 odaPlans:0];
  [v10 submitSimSetupUsage:v11];

  BOOL v12 = _TSLogDomain();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v17 = v7;
    __int16 v18 = 2080;
    id v19 = "-[TSSinglePlanTransferViewController _startPendingInstall:]";
    _os_log_impl(&dword_227A17000, v12, OS_LOG_TYPE_DEFAULT, "plan: %@ @%s", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v13 = +[TSCoreTelephonyClientCache sharedInstance];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke;
  v14[3] = &unk_264827EA8;
  objc_copyWeak(&v15, (id *)buf);
  void v14[4] = self;
  [v13 installPendingPlan:v7 completion:v14];

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);
}

void __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke_2;
  block[3] = &unk_264827E30;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  uint64_t v4 = *(void *)(a1 + 32);
  id v7 = v3;
  uint64_t v8 = v4;
  id v5 = v3;
  dispatch_async(MEMORY[0x263EF83A0], block);

  objc_destroyWeak(&v9);
}

void __59__TSSinglePlanTransferViewController__startPendingInstall___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    if (*(void *)(a1 + 32))
    {
      [WeakRetained setShowSIMSetup:0];
      [v4 _showAlert:*(void *)(a1 + 32)];
    }
    else
    {
      [*(id *)(a1 + 40) setShowSIMSetup:WeakRetained[1288] == 0];
      id v3 = [v4 delegate];
      [v3 viewControllerDidComplete:v4];
    }
    id WeakRetained = v4;
  }
}

- (void)_showAlert:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    id v5 = (void *)MEMORY[0x263F82418];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"ERROR_GENERIC_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"ERROR_TRY_AGAIN_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v10 = [v5 alertControllerWithTitle:v7 message:v9 preferredStyle:1];

    BOOL v11 = (void *)MEMORY[0x263F82400];
    BOOL v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v13 = [v12 localizedStringForKey:@"ERROR_OK" value:&stru_26DBE8E78 table:@"Localizable"];
    uint64_t v17 = MEMORY[0x263EF8330];
    uint64_t v18 = 3221225472;
    id v19 = __49__TSSinglePlanTransferViewController__showAlert___block_invoke;
    uint64_t v20 = &unk_264827A48;
    objc_copyWeak(&v21, &location);
    uint64_t v14 = [v11 actionWithTitle:v13 style:1 handler:&v17];
    objc_msgSend(v10, "addAction:", v14, v17, v18, v19, v20);

    id v15 = [(TSSinglePlanTransferViewController *)self navigationController];
    id v16 = [v15 visibleViewController];
    [v16 presentViewController:v10 animated:1 completion:0];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

void __49__TSSinglePlanTransferViewController__showAlert___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    id v2 = [WeakRetained delegate];
    [v2 attemptFailed];

    id WeakRetained = v3;
  }
}

- (void)_maybeDisplayConsent:(BOOL)a3 phoneNumber:(id)a4 completion:(id)a5
{
  id v8 = a4;
  if (!a3)
  {
    uint64_t v17 = (void (*)(void))*((void *)a5 + 2);
    id v12 = a5;
    v17();
    goto LABEL_16;
  }
  id v9 = (void *)MEMORY[0x263F086E0];
  id v10 = a5;
  BOOL v11 = [v9 bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"TRANSFER_TARGET_TITLE" value:&stru_26DBE8E78 table:@"Localizable"];

  LODWORD(v11) = self->_confirmCellularPlanTransfer;
  BOOL v13 = +[TSUtilities isPad];
  if (!v11)
  {
    if (v13)
    {
      uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v15 = v14;
      id v16 = @"TRANSFER_REQUEST_CONFIRMATION";
      goto LABEL_8;
    }
    id v21 = NSString;
    id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v15 localizedStringForKey:@"TRANSFER_REQUEST_CONFIRMATION_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_msgSend(v21, "stringWithFormat:", v20, v8, v34);
    uint64_t v18 = LABEL_11:;

    goto LABEL_12;
  }
  if (!v13)
  {
    id v19 = NSString;
    id v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v20 = [v15 localizedStringForKey:@"TRANSFER_REQUEST_CONFIRMATION_CLOUD_%@_%@" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_msgSend(v19, "stringWithFormat:", v20, v8, v8);
    goto LABEL_11;
  }
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v15 = v14;
  id v16 = @"TRANSFER_REQUEST_CONFIRMATION_CLOUD";
LABEL_8:
  uint64_t v18 = [v14 localizedStringForKey:v16 value:&stru_26DBE8E78 table:@"Localizable"];
LABEL_12:

  uint64_t v22 = [MEMORY[0x263F82418] alertControllerWithTitle:v12 message:v18 preferredStyle:1];
  BOOL confirmCellularPlanTransfer = self->_confirmCellularPlanTransfer;
  uint64_t v24 = (void *)MEMORY[0x263F82400];
  uint64_t v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v26 = v25;
  if (confirmCellularPlanTransfer)
  {
    uint64_t v27 = [v25 localizedStringForKey:@"CANCEL" value:&stru_26DBE8E78 table:@"Localizable"];
    v36[0] = MEMORY[0x263EF8330];
    v36[1] = 3221225472;
    v36[2] = __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke;
    v36[3] = &unk_264827F48;
    v36[4] = self;
    uint64_t v28 = [v24 actionWithTitle:v27 style:1 handler:v36];
    [v22 addAction:v28];

    uint64_t v29 = (void *)MEMORY[0x263F82400];
    uint64_t v26 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v30 = [v26 localizedStringForKey:@"OTHER_OPTIONS" value:&stru_26DBE8E78 table:@"Localizable"];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_283;
    v35[3] = &unk_264827F48;
    v35[4] = self;
    unint64_t v31 = [v29 actionWithTitle:v30 style:0 handler:v35];
    [v22 addAction:v31];
  }
  else
  {
    v32 = [v25 localizedStringForKey:@"OK" value:&stru_26DBE8E78 table:@"Localizable"];
    objc_super v33 = [v24 actionWithTitle:v32 style:0 handler:&__block_literal_global_289];
    [v22 addAction:v33];
  }
  [(TSSinglePlanTransferViewController *)self presentViewController:v22 animated:1 completion:v10];

LABEL_16:
}

void __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[TSSinglePlanTransferViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "cancel transfer. start over @%s", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _cancelTransferringPlan];
  id v3 = [*(id *)(a1 + 32) delegate];
  [v3 userDidTapCancel];
}

uint64_t __82__TSSinglePlanTransferViewController__maybeDisplayConsent_phoneNumber_completion___block_invoke_283(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = _TSLogDomain();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315138;
    id v5 = "-[TSSinglePlanTransferViewController _maybeDisplayConsent:phoneNumber:completion:]_block_invoke";
    _os_log_impl(&dword_227A17000, v2, OS_LOG_TYPE_DEFAULT, "Don't have other device, maybe show intro @%s", (uint8_t *)&v4, 0xCu);
  }

  [*(id *)(a1 + 32) _cancelTransferringPlan];
  return [*(id *)(a1 + 32) _otherButtonTapped];
}

- (double)_heightAnchorConstant
{
  id v2 = [(TSSinglePlanTransferViewController *)self view];
  [v2 bounds];
  double v4 = v3 * 0.2;

  return v4;
}

- (void)_transferConsentOnSource
{
  double v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  double v4 = [v3 localizedStringForKey:@"CONTINUE_BUTTON_STATE_INSTALLING" value:&stru_26DBE8E78 table:@"Localizable"];
  [(OBWelcomeController *)self _showButtonTraySpinnerWithBusyText:v4];

  id v5 = [(TSSinglePlanTransferViewController *)self presentedViewController];

  if (v5)
  {
    id v6 = [(TSSinglePlanTransferViewController *)self presentedViewController];
    [v6 dismissViewControllerAnimated:1 completion:0];
  }
}

- (void)_userDisagreedTermsAndConditions
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  if (self->_inBuddy)
  {
    double v3 = _TSLogDomain();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[TSSinglePlanTransferViewController _userDisagreedTermsAndConditions]";
      _os_log_impl(&dword_227A17000, v3, OS_LOG_TYPE_DEFAULT, "Hide button tray! @%s", (uint8_t *)&v4, 0xCu);
    }

    [(OBWelcomeController *)self _hideButtonTraySpinner];
  }
}

- (void)_maybeLaunchURLForCarrierDirectAuth:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v4 = [a3 plan];
  id v5 = [v4 transferAttributes];
  uint64_t v6 = _TSLogDomain();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v4 iccid];
    int v19 = 138412546;
    uint64_t v20 = v7;
    __int16 v21 = 2080;
    uint64_t v22 = "-[TSSinglePlanTransferViewController _maybeLaunchURLForCarrierDirectAuth:]";
    _os_log_impl(&dword_227A17000, v6, OS_LOG_TYPE_DEFAULT, "Carrier direct auth flow plan: [%@] @%s", (uint8_t *)&v19, 0x16u);
  }
  id v8 = [v5 performSelector:sel_transferEndpoint];
  if (v8)
  {
    id v9 = [MEMORY[0x263F82438] sharedApplication];
    id v10 = [NSURL URLWithString:v8];
    [v9 openURL:v10 options:MEMORY[0x263EFFA78] completionHandler:&__block_literal_global_296];

    BOOL v11 = [(TSSinglePlanTransferViewController *)self delegate];
    [v11 viewControllerDidComplete:self];
  }
  else
  {
    BOOL v11 = _TSLogDomain();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      -[TSSinglePlanTransferViewController _maybeLaunchURLForCarrierDirectAuth:](v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
}

void __74__TSSinglePlanTransferViewController__maybeLaunchURLForCarrierDirectAuth___block_invoke(uint64_t a1, char a2)
{
  if ((a2 & 1) == 0)
  {
    id v2 = _TSLogDomain();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __74__TSSinglePlanTransferViewController__maybeLaunchURLForCarrierDirectAuth___block_invoke_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
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
  return (NSArray *)objc_getProperty(self, a2, 1336, 1);
}

- (void)setCachedButtons:(id)a3
{
}

- (SSSpinner)spinner
{
  return (SSSpinner *)objc_getProperty(self, a2, 1344, 1);
}

- (void)setSpinner:(id)a3
{
}

- (UIView)spinnerContainer
{
  return (UIView *)objc_getProperty(self, a2, 1352, 1);
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
  return (NSString *)objc_getProperty(self, a2, 1368, 1);
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

- (BOOL)requireDelayBluetoothConnection
{
  return self->_requireDelayBluetoothConnection;
}

- (void)setRequireDelayBluetoothConnection:(BOOL)a3
{
  self->_requireDelayBluetoothConnection = a3;
}

- (BOOL)installingTransferPlan
{
  return self->_installingTransferPlan;
}

- (void)setInstallingTransferPlan:(BOOL)a3
{
  self->_installingTransferPlan = a3;
}

- (BOOL)showSIMSetup
{
  return self->_showSIMSetup;
}

- (void)setShowSIMSetup:(BOOL)a3
{
  self->_showSIMSetup = a3;
}

- (BOOL)crossPlatformTransferPlanSelected
{
  return self->_crossPlatformTransferPlanSelected;
}

- (void)setCrossPlatformTransferPlanSelected:(BOOL)a3
{
  self->_crossPlatformTransferPlanSelected = a3;
}

- (BOOL)isStandaloneProximityFlow
{
  return self->_isStandaloneProximityFlow;
}

- (void)setIsStandaloneProximityFlow:(BOOL)a3
{
  self->_isStandaloneProximityFlow = a3;
}

- (int64_t)backToSelfOption
{
  return self->_backToSelfOption;
}

- (void)setBackToSelfOption:(int64_t)a3
{
  self->_backToSelfOption = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_carrierNameForSelectedItem, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spinnerContainer, 0);
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_cachedButtons, 0);
  objc_storeStrong((id *)&self->_transferBackPhoneNumber, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
  objc_storeStrong((id *)&self->_planItem, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_crossPlatformTransferPlan, 0);
  objc_storeStrong((id *)&self->_pendingInstallPlan, 0);
  objc_storeStrong((id *)&self->_transferPlan, 0);
}

- (void)initWithLocalPhysical:(uint64_t)a3 carrierName:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

+ (void)getTitleAndDetailsForPlanType:(uint64_t)a3 transferCapability:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __61__TSSinglePlanTransferViewController__cancelTransferringPlan__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 138412546;
  uint64_t v3 = a1;
  __int16 v4 = 2080;
  uint64_t v5 = "-[TSSinglePlanTransferViewController _cancelTransferringPlan]_block_invoke";
  _os_log_error_impl(&dword_227A17000, a2, OS_LOG_TYPE_ERROR, "[E]Failed %@ @%s", (uint8_t *)&v2, 0x16u);
}

- (void)_maybeLaunchURLForCarrierDirectAuth:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __74__TSSinglePlanTransferViewController__maybeLaunchURLForCarrierDirectAuth___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end