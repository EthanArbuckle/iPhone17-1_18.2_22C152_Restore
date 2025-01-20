@interface PSUISubscriptionContextMenusGroup
- (BOOL)planManagerCacheHasMoreThanOnePlanItem;
- (BOOL)popViewControllerOnFinished;
- (CTCellularPlanManager)cellularPlanManager;
- (PSListController)listController;
- (PSSimStatusCache)simStatusCache;
- (PSSpecifier)groupSpecifier;
- (PSSpecifier)parentSpecifier;
- (PSUICallingSubgroup)callingSubgroup;
- (PSUICarrierSpaceGroup)carrierSpaceSubgroup;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUICoreTelephonyCallCache)callCache;
- (PSUICoreTelephonyCapabilitiesCache)capabilitiesCache;
- (PSUICoreTelephonyCarrierBundleCache)carrierBundleCache;
- (PSUICoreTelephonyDataCache)dataCache;
- (PSUIDataModeSubgroup)dataModeSubgroup;
- (PSUIDevicePasscodeState)passcodeStatusCache;
- (PSUIMyNumberSubgroup)myNumberSubgroup;
- (PSUINetworkSelectionSubgroup)networkSelectionSubgroup;
- (PSUINetworkSettingsSubgroup)networkSettingsSubgroup;
- (PSUIRoamingSpecifiersSubgroup)roamingSpecifiersSubgroup;
- (PSUISIMSubgroup)simSubgroup;
- (PSUISatelliteSubgroup)satelliteSubgroup;
- (PSUISubscriptionContextMenusGroup)initWithFactory:(id)a3;
- (PSUISubscriptionContextMenusGroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getLogger;
- (id)networkSlicingDetailText:(id)a3;
- (id)specifiers;
- (void)deleteDataPlanTapped:(id)a3;
- (void)setCallCache:(id)a3;
- (void)setCallingSubgroup:(id)a3;
- (void)setCapabilitiesCache:(id)a3;
- (void)setCarrierBundleCache:(id)a3;
- (void)setCarrierSpaceSubgroup:(id)a3;
- (void)setCellularPlanManager:(id)a3;
- (void)setDataCache:(id)a3;
- (void)setDataModeSubgroup:(id)a3;
- (void)setGroupSpecifier:(id)a3;
- (void)setListController:(id)a3;
- (void)setMyNumberSubgroup:(id)a3;
- (void)setNetworkSelectionSubgroup:(id)a3;
- (void)setNetworkSettingsSubgroup:(id)a3;
- (void)setParentSpecifier:(id)a3;
- (void)setPasscodeStatusCache:(id)a3;
- (void)setPlanManagerCache:(id)a3;
- (void)setPopViewControllerOnFinished:(BOOL)a3;
- (void)setRoamingSpecifiersSubgroup:(id)a3;
- (void)setSatelliteSubgroup:(id)a3;
- (void)setSimStatusCache:(id)a3;
- (void)setSimSubgroup:(id)a3;
- (void)viewWillAppear;
@end

@implementation PSUISubscriptionContextMenusGroup

- (PSUISubscriptionContextMenusGroup)initWithFactory:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)PSUISubscriptionContextMenusGroup;
  v5 = [(PSUISubscriptionContextMenusGroup *)&v47 init];
  if (v5)
  {
    v6 = [v4 hostController];
    objc_storeWeak((id *)&v5->_listController, v6);

    v7 = [v4 groupSpecifier];
    objc_storeWeak((id *)&v5->_groupSpecifier, v7);

    uint64_t v8 = [v4 parentSpecifier];
    parentSpecifier = v5->_parentSpecifier;
    v5->_parentSpecifier = (PSSpecifier *)v8;

    v5->_popViewControllerOnFinished = [v4 shouldPopViewControllerOnPlanRemoval];
    uint64_t v10 = [v4 createCallingSubgroup];
    callingSubgroup = v5->_callingSubgroup;
    v5->_callingSubgroup = (PSUICallingSubgroup *)v10;

    uint64_t v12 = [v4 createCarrierSpaceSubgroup];
    carrierSpaceSubgroup = v5->_carrierSpaceSubgroup;
    v5->_carrierSpaceSubgroup = (PSUICarrierSpaceGroup *)v12;

    uint64_t v14 = [v4 createNetworkSelectionSubgroup];
    networkSelectionSubgroup = v5->_networkSelectionSubgroup;
    v5->_networkSelectionSubgroup = (PSUINetworkSelectionSubgroup *)v14;

    uint64_t v16 = [v4 createMyNumberSubgroup];
    myNumberSubgroup = v5->_myNumberSubgroup;
    v5->_myNumberSubgroup = (PSUIMyNumberSubgroup *)v16;

    uint64_t v18 = [v4 createNetworkSettingsSubgroup];
    networkSettingsSubgroup = v5->_networkSettingsSubgroup;
    v5->_networkSettingsSubgroup = (PSUINetworkSettingsSubgroup *)v18;

    uint64_t v20 = [v4 createSimSubgroup];
    simSubgroup = v5->_simSubgroup;
    v5->_simSubgroup = (PSUISIMSubgroup *)v20;

    uint64_t v22 = [v4 createCallCache];
    callCache = v5->_callCache;
    v5->_callCache = (PSUICoreTelephonyCallCache *)v22;

    uint64_t v24 = [v4 createSimStatusCache];
    simStatusCache = v5->_simStatusCache;
    v5->_simStatusCache = (PSSimStatusCache *)v24;

    uint64_t v26 = [v4 createCarrierBundleCache];
    carrierBundleCache = v5->_carrierBundleCache;
    v5->_carrierBundleCache = (PSUICoreTelephonyCarrierBundleCache *)v26;

    uint64_t v28 = [v4 createDataCache];
    dataCache = v5->_dataCache;
    v5->_dataCache = (PSUICoreTelephonyDataCache *)v28;

    uint64_t v30 = [v4 createCellularPlanManagerCache];
    planManagerCache = v5->_planManagerCache;
    v5->_planManagerCache = (PSUICellularPlanManagerCache *)v30;

    uint64_t v32 = [v4 createCellularPlanManager];
    cellularPlanManager = v5->_cellularPlanManager;
    v5->_cellularPlanManager = (CTCellularPlanManager *)v32;

    v34 = [(PSSpecifier *)v5->_parentSpecifier propertyForKey:*MEMORY[0x263F60290]];
    uint64_t v35 = [v4 createDataModeSubgroupWithContext:v34];
    dataModeSubgroup = v5->_dataModeSubgroup;
    v5->_dataModeSubgroup = (PSUIDataModeSubgroup *)v35;

    v37 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v34];
    uint64_t v38 = [v4 createRoamingSpecifiersSubgroupWithServiceDescriptor:v37];
    roamingSpecifiersSubgroup = v5->_roamingSpecifiersSubgroup;
    v5->_roamingSpecifiersSubgroup = (PSUIRoamingSpecifiersSubgroup *)v38;

    uint64_t v40 = [v4 createPasscodeStatusCache];
    passcodeStatusCache = v5->_passcodeStatusCache;
    v5->_passcodeStatusCache = (PSUIDevicePasscodeState *)v40;

    uint64_t v42 = [v4 createSatelliteSubgroupWithContext:v34];
    satelliteSubgroup = v5->_satelliteSubgroup;
    v5->_satelliteSubgroup = (PSUISatelliteSubgroup *)v42;

    uint64_t v44 = [v4 createCapabilitiesCache];
    capabilitiesCache = v5->_capabilitiesCache;
    v5->_capabilitiesCache = (PSUICoreTelephonyCapabilitiesCache *)v44;
  }
  return v5;
}

- (PSUISubscriptionContextMenusGroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)viewWillAppear
{
}

- (id)specifiers
{
  uint64_t v109 = *MEMORY[0x263EF8340];
  uint64_t v92 = *MEMORY[0x263F5FFF0];
  v104 = -[PSSpecifier propertyForKey:](self->_parentSpecifier, "propertyForKey:");
  id v4 = -[PSUICellularPlanManagerCache planFromReferenceSafe:](self->_planManagerCache, "planFromReferenceSafe:");
  uint64_t v93 = *MEMORY[0x263F60290];
  id v5 = -[PSSpecifier propertyForKey:](self->_parentSpecifier, "propertyForKey:");
  id v6 = [(PSUISubscriptionContextMenusGroup *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v106 = v4;
    __int16 v107 = 2112;
    v108 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "menus: plan item: %@, context: %@", buf, 0x16u);
  }

  BOOL v102 = [(PSUISubscriptionContextMenusGroup *)self planManagerCacheHasMoreThanOnePlanItem];
  int v7 = [(PSSimStatusCache *)self->_simStatusCache isDualSimCapable];
  BOOL v95 = [(PSUICoreTelephonyDataCache *)self->_dataCache isAirplaneModeEnabled];
  BOOL v101 = [(PSUIDevicePasscodeState *)self->_passcodeStatusCache isPasscodeSet];
  uint64_t v8 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v9 = [v8 canSetTurnOffCellular:v5];

  if (v9)
  {
    uint64_t v10 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
    unsigned __int8 v94 = [v10 getTurnOffCellular:v5];
  }
  else
  {
    unsigned __int8 v94 = 0;
  }
  v11 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v97 = [v11 canSetNetworkSlicing:v5];

  BOOL v99 = [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache canSetSatelliteCapability:v5];
  if (v7)
  {
    if (v4)
    {
      uint64_t v12 = [v4 carrierName];
    }
    else
    {
      if (!v5) {
        goto LABEL_12;
      }
      uint64_t v12 = [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache carrierName:v5];
    }
    v13 = (void *)v12;
    WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
    [WeakRetained setName:v13];
  }
LABEL_12:
  uint64_t v14 = objc_opt_new();
  if (v4) {
    int v15 = v7;
  }
  else {
    int v15 = 0;
  }
  int v103 = v7;
  if (v15 != 1) {
    goto LABEL_30;
  }
  if (v102)
  {
    uint64_t v16 = [[PSUICellularPlanLabelSpecifier alloc] initWithPlanUniversalReference:v104 planManagerCache:self->_planManagerCache];
    [v14 addObject:v16];
    WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
    [WeakRetained setName:&stru_26D410CA0];
  }
  char v17 = [v4 isCheckingCellularConnectivity];
  if ((v17 & 1) == 0)
  {
    WeakRetained = [v4 plan];
    if ([WeakRetained status] != 14)
    {

      goto LABEL_26;
    }
  }
  uint64_t v18 = [MEMORY[0x263F82670] currentDevice];
  int v19 = objc_msgSend(v18, "sf_isiPhone");

  if ((v17 & 1) == 0)
  {

    if (v19) {
      goto LABEL_24;
    }
LABEL_26:
    if (![v4 isSelectable]) {
      goto LABEL_30;
    }
    uint64_t v32 = [PSUITurnOnThisLineSpecifier alloc];
    planManagerCache = self->_planManagerCache;
    cellularPlanManager = self->_cellularPlanManager;
    callCache = self->_callCache;
    id v24 = objc_loadWeakRetained((id *)&self->_listController);
    v25 = v32;
    uint64_t v26 = v104;
    v27 = cellularPlanManager;
    uint64_t v28 = planManagerCache;
    v29 = callCache;
    id v30 = v24;
    uint64_t v31 = 0;
    goto LABEL_28;
  }
  if (!v19) {
    goto LABEL_26;
  }
LABEL_24:
  uint64_t v20 = [PSUITurnOnThisLineSpecifier alloc];
  uint64_t v22 = self->_planManagerCache;
  v21 = self->_cellularPlanManager;
  v23 = self->_callCache;
  id v24 = objc_loadWeakRetained((id *)&self->_listController);
  v25 = v20;
  uint64_t v26 = v104;
  v27 = v21;
  uint64_t v28 = v22;
  v29 = v23;
  id v30 = v24;
  uint64_t v31 = 1;
LABEL_28:
  v36 = [(PSUITurnOnThisLineSpecifier *)v25 initWithPlanUniversalReference:v26 cellularPlanManager:v27 planManagerCache:v28 callCache:v29 hostController:v30 isActivating:v31];

  int v7 = v103;
  if (v36)
  {
    [v14 addObject:v36];
  }
LABEL_30:
  if (!v5) {
    goto LABEL_79;
  }
  if (v4 && ![v4 isSelected]) {
    goto LABEL_80;
  }
  int v89 = v7 & v102;
  int v91 = v7 & v102 ^ 1;
  if ((v91 & 1) == 0)
  {
    v37 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SPACER_GROUP"];
    uint64_t v38 = [v4 carrierName];
    [v37 setName:v38];

    [v14 addObject:v37];
  }
  uint64_t v39 = [(PSUICarrierSpaceGroup *)self->_carrierSpaceSubgroup specifierForID:0x26D413980];
  if (v39) {
    [v14 addObject:v39];
  }
  v90 = (void *)v39;
  if ((v95 | v94))
  {
    if (!v7) {
      goto LABEL_39;
    }
  }
  else
  {
    v52 = [(PSUINetworkSelectionSubgroup *)self->_networkSelectionSubgroup specifiers];
    [v14 addObjectsFromArray:v52];

    if (!v7)
    {
LABEL_39:
      if (!v9) {
        goto LABEL_41;
      }
      goto LABEL_40;
    }
  }
  v53 = [(PSUIMyNumberSubgroup *)self->_myNumberSubgroup specifiers];
  [v14 addObjectsFromArray:v53];

  if (v9)
  {
LABEL_40:
    uint64_t v40 = [PSUITurnOffCellularSpecifier alloc];
    v41 = self->_callCache;
    id v42 = objc_loadWeakRetained((id *)&self->_listController);
    v43 = [(PSUITurnOffCellularSpecifier *)v40 initWithContext:v5 callCache:v41 hostController:v42];

    [v14 addObject:v43];
  }
LABEL_41:
  uint64_t v44 = [(PSUICallingSubgroup *)self->_callingSubgroup specifiers];
  [v14 addObjectsFromArray:v44];

  if (v97)
  {
    v45 = (void *)MEMORY[0x263F5FC40];
    v46 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v47 = [v46 localizedStringForKey:@"NETWORK_SLICING" value:&stru_26D410CA0 table:@"Cellular"];
    v48 = [v45 preferenceSpecifierNamed:v47 target:self set:0 get:sel_networkSlicingDetailText_ detail:objc_opt_class() cell:2 edit:0];

    [v48 setIdentifier:@"NETWORK_SLICING"];
    if ([(PSUICoreTelephonyCallCache *)self->_callCache isAnyCallActive]) {
      uint64_t v49 = MEMORY[0x263EFFA80];
    }
    else {
      uint64_t v49 = MEMORY[0x263EFFA88];
    }
    [v48 setProperty:v49 forKey:*MEMORY[0x263F600A8]];
    [v48 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
    [v48 setProperty:v5 forKey:v93];
    [v14 addObject:v48];
  }
  if (((v95 | v94) & 1) == 0)
  {
    v50 = [(PSUINetworkSettingsSubgroup *)self->_networkSettingsSubgroup specifiers];
    [v14 addObjectsFromArray:v50];
  }
  v51 = [(PSUIDataModeSubgroup *)self->_dataModeSubgroup specifiers];
  BOOL v98 = [(PSUIDataModeSubgroup *)self->_dataModeSubgroup shouldShowLinkCell];
  if ((v89 & v98) == 1)
  {
    [v14 addObjectsFromArray:v51];
    if (!v99) {
      goto LABEL_56;
    }
  }
  else if ((v89 & v99) != 1)
  {
    goto LABEL_57;
  }
  v54 = [(PSUISatelliteSubgroup *)self->_satelliteSubgroup specifiers];
  [v14 addObjectsFromArray:v54];

LABEL_56:
  v55 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SeparatingGroupSpecifier"];
  [v14 addObject:v55];

LABEL_57:
  if (v89)
  {
    v56 = [(PSUIRoamingSpecifiersSubgroup *)self->_roamingSpecifiersSubgroup specifiers];
    [v14 addObjectsFromArray:v56];
  }
  if ([(PSUICoreTelephonyDataCache *)self->_dataCache isCellularUsageStatisticsEnabled])
  {
    v57 = [(PSUICarrierSpaceGroup *)self->_carrierSpaceSubgroup specifierForID:0x26D4139A0];
    if (v57) {
      [v14 addObject:v57];
    }
  }
  v58 = [(PSUICarrierSpaceGroup *)self->_carrierSpaceSubgroup specifierForID:0x26D4139C0];
  if (v58) {
    [v14 addObject:v58];
  }
  v59 = [(PSUISIMSubgroup *)self->_simSubgroup specifiers];
  [v14 addObjectsFromArray:v59];

  int v7 = v103;
  if (([v4 isLocalTransferToeSIMSupported] & v101) != 1) {
    goto LABEL_70;
  }
  v60 = v51;
  v61 = +[PSUICellularPlanManagerCache sharedInstance];
  if (![v61 isActivationCodeFlowSupported]) {
    goto LABEL_69;
  }
  v62 = +[PSUICellularPlanManagerCache sharedInstance];
  char v63 = [v62 isSingleActivationCodeFlowSupported];

  int v7 = v103;
  v51 = v60;
  if ((v63 & 1) == 0)
  {
    v100 = [v4 phoneNumber];
    v64 = [v4 carrierName];
    id v65 = objc_loadWeakRetained((id *)&self->_listController);
    BOOL popViewControllerOnFinished = self->_popViewControllerOnFinished;
    v66 = [v4 iccid];
    v61 = +[PSUIConvertToESIMSpecifier specifierWithPhoneNumber:v100 carrierName:v64 hostController:v65 isViewControllerPopNeeded:popViewControllerOnFinished iccid:v66];

    int v7 = v103;
    [v14 addObject:v61];
LABEL_69:

    v51 = v60;
  }
LABEL_70:
  if (_os_feature_enabled_impl()) {
    char v67 = 0;
  }
  else {
    char v67 = _os_feature_enabled_impl() ^ 1;
  }
  if (([v4 supportedTransferOption] & 2) != 0 && (v67 & 1) == 0)
  {
    v68 = v51;
    id v69 = objc_loadWeakRetained((id *)&self->_listController);
    v70 = [v4 iccid];
    v71 = [v4 carrierName];
    v72 = +[PSUIGenerateTransferQRCodeSpecifier specifierWithHostController:v69 iccid:v70 carrierName:v71];

    v51 = v68;
    [v14 addObject:v72];

    int v7 = v103;
  }
  if (((v91 | v98) & 1) == 0) {
    [v14 addObjectsFromArray:v51];
  }

LABEL_79:
  if (!v4) {
    goto LABEL_95;
  }
LABEL_80:
  if ([v4 type] != 2) {
    goto LABEL_95;
  }
  uint64_t v73 = [v4 plan];
  if (!v73) {
    goto LABEL_85;
  }
  v74 = (PSUIRemoveCellularPlanSpecifier *)v73;
  v75 = [v4 plan];
  if (![v75 isDeleteNotAllowed])
  {
    v76 = [v4 plan];
    int v77 = [v76 status];

    BOOL v78 = v77 == 14;
    int v7 = v103;
    if (v78) {
      goto LABEL_95;
    }
LABEL_85:
    if (v7)
    {
      v79 = [PSUIRemoveCellularPlanSpecifier alloc];
      v81 = self->_planManagerCache;
      v80 = self->_cellularPlanManager;
      id v82 = objc_loadWeakRetained((id *)&self->_listController);
      v74 = [(PSUIRemoveCellularPlanSpecifier *)v79 initWithPlanUniversalReference:v104 cellularPlanManager:v80 planManagerCache:v81 hostController:v82 popViewControllerOnPlanDeletion:self->_popViewControllerOnFinished];

      if (!v102)
      {
        [(PSUIRemoveCellularPlanSpecifier *)v74 alignLeft];
        goto LABEL_93;
      }
      v83 = (void *)MEMORY[0x263F5FC40];
    }
    else
    {
      v84 = (void *)MEMORY[0x263F5FC40];
      v85 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v86 = [v85 localizedStringForKey:@"DELETE_ESIM" value:&stru_26D410CA0 table:@"Cellular"];
      v74 = [v84 preferenceSpecifierNamed:v86 target:self set:0 get:0 detail:0 cell:13 edit:0];

      [(PSUIRemoveCellularPlanSpecifier *)v74 setButtonAction:sel_deleteDataPlanTapped_];
      [(PSUIRemoveCellularPlanSpecifier *)v74 setProperty:v104 forKey:v92];
      [(PSUIRemoveCellularPlanSpecifier *)v74 setProperty:objc_opt_class() forKey:*MEMORY[0x263F5FFE0]];
      [(PSUIRemoveCellularPlanSpecifier *)v74 setProperty:&unk_26D425E28 forKey:*MEMORY[0x263F5FEF0]];
      if (![v14 count] || !objc_msgSend(v4, "isSelected")) {
        goto LABEL_93;
      }
      v83 = (void *)MEMORY[0x263F5FC40];
    }
    v87 = [v83 groupSpecifierWithID:@"BOTTOM_SPACER_GROUP"];
    [v14 addObject:v87];

LABEL_93:
    [v14 addObject:v74];
    goto LABEL_94;
  }

LABEL_94:
LABEL_95:

  return v14;
}

- (BOOL)planManagerCacheHasMoreThanOnePlanItem
{
  v3 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planItems];
  uint64_t v4 = [v3 count];
  id v5 = [(PSUICellularPlanManagerCache *)self->_planManagerCache danglingPlanItems];
  uint64_t v6 = [v5 count] + v4;
  int v7 = [(PSUICellularPlanManagerCache *)self->_planManagerCache plansPendingTransfer];
  LOBYTE(v6) = (unint64_t)(v6 + [v7 count]) > 1;

  return v6;
}

- (id)networkSlicingDetailText:(id)a3
{
  v3 = [(PSSpecifier *)self->_parentSpecifier propertyForKey:*MEMORY[0x263F60290]];
  uint64_t v4 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  int v5 = [v4 getNetworkSlicing:v3];

  uint64_t v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  int v7 = v6;
  if (v5) {
    uint64_t v8 = @"NETWORK_SLICING_ON";
  }
  else {
    uint64_t v8 = @"NETWORK_SLICING_OFF";
  }
  int v9 = [v6 localizedStringForKey:v8 value:&stru_26D410CA0 table:@"Cellular"];

  return v9;
}

- (void)deleteDataPlanTapped:(id)a3
{
  id v4 = a3;
  int v5 = [v4 propertyForKey:*MEMORY[0x263F5FFF0]];
  uint64_t v6 = +[PSUICellularPlanManagerCache sharedInstance];
  int v7 = [v6 planFromReference:v5];

  if (v7)
  {
    uint64_t v22 = v5;
    uint64_t v8 = (void *)MEMORY[0x263F82418];
    int v9 = +[SettingsCellularUtils removePlanConfirmationTitle:v7];
    uint64_t v10 = +[SettingsCellularUtils removePlanConfirmationMessage:v7];
    v11 = [v8 alertControllerWithTitle:v9 message:v10 preferredStyle:1];

    location[0] = 0;
    objc_initWeak(location, self);
    uint64_t v12 = (void *)MEMORY[0x263F82400];
    v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v14 = [v13 localizedStringForKey:@"REMOVE" value:&stru_26D410CA0 table:@"Cellular"];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke;
    v25[3] = &unk_2645E0F18;
    objc_copyWeak(&v28, location);
    v25[4] = self;
    id v15 = v7;
    id v26 = v15;
    id v27 = v4;
    uint64_t v16 = [v12 actionWithTitle:v14 style:2 handler:v25];

    [v11 addAction:v16];
    char v17 = (void *)MEMORY[0x263F82400];
    uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v19 = [v18 localizedStringForKey:@"CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_2;
    v23[3] = &unk_2645E0F40;
    v23[4] = self;
    id v24 = v15;
    uint64_t v20 = [v17 actionWithTitle:v19 style:1 handler:v23];

    [v11 addAction:v20];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
    [WeakRetained presentViewController:v11 animated:1 completion:0];

    objc_destroyWeak(&v28);
    objc_destroyWeak(location);
    int v5 = v22;
  }
  else
  {
    v11 = [(PSUISubscriptionContextMenusGroup *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEFAULT, "planItem is null!", (uint8_t *)location, 2u);
    }
  }
}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v3 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    uint64_t v16 = v4;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "Confirmed delete plan: %@", buf, 0xCu);
  }

  [*(id *)(a1 + 48) setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  int v5 = [MEMORY[0x263F31978] sharedManager];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_59;
  v10[3] = &unk_2645E0EF0;
  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 32);
  int v9 = *(void **)(a1 + 40);
  id v11 = v7;
  uint64_t v12 = v8;
  id v13 = v9;
  id v14 = WeakRetained;
  [v5 didDeletePlanItem:v6 completion:v10];
}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_59(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [*(id *)(a1 + 32) setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F600A8]];
  if (v4)
  {
    int v5 = [*(id *)(a1 + 40) getLogger];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      uint64_t v10 = v6;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Failed to delete plan item:%@ with error:%@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = *(void *)(a1 + 56);
    if (v7)
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_60;
      block[3] = &unk_2645E0B88;
      block[4] = v7;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  v1 = [WeakRetained navigationController];
  id v2 = (id)[v1 popViewControllerAnimated:1];
}

void __58__PSUISubscriptionContextMenusGroup_deleteDataPlanTapped___block_invoke_2(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = [*(id *)(a1 + 32) getLogger];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v4 = 138412290;
    uint64_t v5 = v3;
    _os_log_impl(&dword_221B17000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled delete plan: %@", (uint8_t *)&v4, 0xCu);
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"SubscriptionContextMenusGroup"];
}

- (PSSpecifier)parentSpecifier
{
  return self->_parentSpecifier;
}

- (void)setParentSpecifier:(id)a3
{
}

- (PSSpecifier)groupSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_groupSpecifier);
  return (PSSpecifier *)WeakRetained;
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

- (BOOL)popViewControllerOnFinished
{
  return self->_popViewControllerOnFinished;
}

- (void)setPopViewControllerOnFinished:(BOOL)a3
{
  self->_BOOL popViewControllerOnFinished = a3;
}

- (PSUICallingSubgroup)callingSubgroup
{
  return self->_callingSubgroup;
}

- (void)setCallingSubgroup:(id)a3
{
}

- (PSUICarrierSpaceGroup)carrierSpaceSubgroup
{
  return self->_carrierSpaceSubgroup;
}

- (void)setCarrierSpaceSubgroup:(id)a3
{
}

- (PSUINetworkSelectionSubgroup)networkSelectionSubgroup
{
  return self->_networkSelectionSubgroup;
}

- (void)setNetworkSelectionSubgroup:(id)a3
{
}

- (PSUIMyNumberSubgroup)myNumberSubgroup
{
  return self->_myNumberSubgroup;
}

- (void)setMyNumberSubgroup:(id)a3
{
}

- (PSUINetworkSettingsSubgroup)networkSettingsSubgroup
{
  return self->_networkSettingsSubgroup;
}

- (void)setNetworkSettingsSubgroup:(id)a3
{
}

- (PSUISIMSubgroup)simSubgroup
{
  return self->_simSubgroup;
}

- (void)setSimSubgroup:(id)a3
{
}

- (PSUIDataModeSubgroup)dataModeSubgroup
{
  return self->_dataModeSubgroup;
}

- (void)setDataModeSubgroup:(id)a3
{
}

- (PSUISatelliteSubgroup)satelliteSubgroup
{
  return self->_satelliteSubgroup;
}

- (void)setSatelliteSubgroup:(id)a3
{
}

- (PSUICoreTelephonyCallCache)callCache
{
  return self->_callCache;
}

- (void)setCallCache:(id)a3
{
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
}

- (PSUICoreTelephonyCarrierBundleCache)carrierBundleCache
{
  return self->_carrierBundleCache;
}

- (void)setCarrierBundleCache:(id)a3
{
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
}

- (CTCellularPlanManager)cellularPlanManager
{
  return self->_cellularPlanManager;
}

- (void)setCellularPlanManager:(id)a3
{
}

- (PSUIRoamingSpecifiersSubgroup)roamingSpecifiersSubgroup
{
  return self->_roamingSpecifiersSubgroup;
}

- (void)setRoamingSpecifiersSubgroup:(id)a3
{
}

- (PSUIDevicePasscodeState)passcodeStatusCache
{
  return self->_passcodeStatusCache;
}

- (void)setPasscodeStatusCache:(id)a3
{
}

- (PSUICoreTelephonyCapabilitiesCache)capabilitiesCache
{
  return self->_capabilitiesCache;
}

- (void)setCapabilitiesCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_capabilitiesCache, 0);
  objc_storeStrong((id *)&self->_passcodeStatusCache, 0);
  objc_storeStrong((id *)&self->_roamingSpecifiersSubgroup, 0);
  objc_storeStrong((id *)&self->_cellularPlanManager, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_satelliteSubgroup, 0);
  objc_storeStrong((id *)&self->_dataModeSubgroup, 0);
  objc_storeStrong((id *)&self->_simSubgroup, 0);
  objc_storeStrong((id *)&self->_networkSettingsSubgroup, 0);
  objc_storeStrong((id *)&self->_myNumberSubgroup, 0);
  objc_storeStrong((id *)&self->_networkSelectionSubgroup, 0);
  objc_storeStrong((id *)&self->_carrierSpaceSubgroup, 0);
  objc_storeStrong((id *)&self->_callingSubgroup, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_destroyWeak((id *)&self->_groupSpecifier);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end