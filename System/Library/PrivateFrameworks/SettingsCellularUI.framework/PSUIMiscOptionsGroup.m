@interface PSUIMiscOptionsGroup
- (ACAccountStore)accountStore;
- (CHManager)callHistoryManager;
- (PSBillingPeriodSource)billingPeriodSource;
- (PSCellularManagementCache)managementCache;
- (PSListController)hostController;
- (PSUICallTimeGroup)callTimeGroup;
- (PSUICarrierSpaceManager)carrierSpaceManager;
- (PSUICoreTelephonyCarrierBundleCache)carrierBundleCache;
- (PSUICoreTelephonyDataCache)dataCache;
- (PSUIMBManagerWrapper)backupManagerWrapper;
- (PSUIMiscOptionsGroup)initWithHostController:(id)a3 cellularManagementCache:(id)a4 carrierSpaceManager:(id)a5 dataCache:(id)a6 carrierBundleCache:(id)a7 backupManagerWrapper:(id)a8 callHistoryManager:(id)a9 appleAccountStore:(id)a10 resetStatisticsDelegate:(id)a11;
- (PSUIResetStatisticsGroup)resetStatisticsGroup;
- (PSUIResetStatisticsGroupDelegate)resetStatisticsDelegate;
- (id)getLogger;
- (id)specifiers;
- (void)setAccountStore:(id)a3;
- (void)setBackupManagerWrapper:(id)a3;
- (void)setBillingPeriodSource:(id)a3;
- (void)setCallHistoryManager:(id)a3;
- (void)setCallTimeGroup:(id)a3;
- (void)setCarrierBundleCache:(id)a3;
- (void)setCarrierSpaceManager:(id)a3;
- (void)setDataCache:(id)a3;
- (void)setHostController:(id)a3;
- (void)setManagementCache:(id)a3;
- (void)setResetStatisticsDelegate:(id)a3;
- (void)setResetStatisticsGroup:(id)a3;
@end

@implementation PSUIMiscOptionsGroup

- (PSUIMiscOptionsGroup)initWithHostController:(id)a3 cellularManagementCache:(id)a4 carrierSpaceManager:(id)a5 dataCache:(id)a6 carrierBundleCache:(id)a7 backupManagerWrapper:(id)a8 callHistoryManager:(id)a9 appleAccountStore:(id)a10 resetStatisticsDelegate:(id)a11
{
  id obj = a3;
  id v27 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  id v22 = a9;
  id v17 = a10;
  id v18 = a11;
  v29.receiver = self;
  v29.super_class = (Class)PSUIMiscOptionsGroup;
  v19 = [(PSUIMiscOptionsGroup *)&v29 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_hostController, obj);
    objc_storeStrong((id *)&v20->_managementCache, a4);
    objc_storeStrong((id *)&v20->_carrierSpaceManager, a5);
    objc_storeStrong((id *)&v20->_dataCache, a6);
    objc_storeStrong((id *)&v20->_carrierBundleCache, a7);
    objc_storeStrong((id *)&v20->_backupManagerWrapper, a8);
    objc_storeStrong((id *)&v20->_callHistoryManager, a9);
    objc_storeStrong((id *)&v20->_accountStore, a10);
    objc_storeWeak((id *)&v20->_resetStatisticsDelegate, v18);
  }

  return v20;
}

- (id)specifiers
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  if (+[PSUIWiFiAssistSwitchSpecifier shouldShowWifiAssist:self->_carrierBundleCache])
  {
    v4 = +[PSUIWiFiAssistSwitchSpecifier wifiAssistGroupSpecifier];
    [v3 addObject:v4];

    id v5 = [[PSUIWiFiAssistSwitchSpecifier alloc] initDefault];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_billingPeriodSource);
    [v5 setBillingPeriodSource:WeakRetained];

    [v3 addObject:v5];
  }
  v7 = [[PSUICloudDriveCellularSwitchSpecifier alloc] initWithAppleAccountStore:self->_accountStore];
  if ([(PSUICloudDriveCellularSwitchSpecifier *)v7 shouldShowCloudDrive])
  {
    v8 = [(PSUICloudDriveCellularSwitchSpecifier *)v7 cloudDriveGroupSpecifier];
    [v3 addObject:v8];

    v9 = objc_msgSend(NSNumber, "numberWithInt:", -[PSCellularManagementCache isGlobalDataModificationRestricted](self->_managementCache, "isGlobalDataModificationRestricted") ^ 1);
    [(PSUICloudDriveCellularSwitchSpecifier *)v7 setProperty:v9 forKey:*MEMORY[0x263F600A8]];

    [v3 addObject:v7];
  }
  v10 = [[PSUICloudBackupCellularSwitchSpecifier alloc] initWithAppleAccountStore:self->_accountStore backupManagerWrapper:self->_backupManagerWrapper];
  if ([(PSUICloudBackupCellularSwitchSpecifier *)v10 shouldShowCloudBackupCarrier])
  {
    v11 = [(PSUICloudBackupCellularSwitchSpecifier *)v10 cloudBackupGroupSpecifier];
    [v3 addObject:v11];

    [v3 addObject:v10];
  }
  v12 = [(PSUICarrierSpaceManager *)self->_carrierSpaceManager capabilities];
  if ([v12 supportsUsage])
  {

    goto LABEL_10;
  }
  v13 = [MEMORY[0x263F82670] currentDevice];
  char v14 = objc_msgSend(v13, "sf_isiPad");

  if (v14)
  {
LABEL_10:
    v15 = [(PSUIMiscOptionsGroup *)self getLogger];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = [(PSUICarrierSpaceManager *)self->_carrierSpaceManager capabilities];
      int v17 = [v16 supportsUsage];
      id v18 = [MEMORY[0x263F82670] currentDevice];
      v33[0] = 67109376;
      v33[1] = v17;
      __int16 v34 = 1024;
      int v35 = objc_msgSend(v18, "sf_isiPad");
      _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "Not adding call time group because it isn't supported (%d) or we're an iPad (%d)", (uint8_t *)v33, 0xEu);
    }
    goto LABEL_15;
  }
  callTimeGroup = self->_callTimeGroup;
  if (!callTimeGroup)
  {
    v20 = [PSUICallTimeGroup alloc];
    id v21 = objc_loadWeakRetained((id *)&self->_hostController);
    id v22 = [(PSUICallTimeGroup *)v20 initWithListController:v21];
    id v23 = self->_callTimeGroup;
    self->_callTimeGroup = v22;

    callTimeGroup = self->_callTimeGroup;
  }
  v15 = [(PSUICallTimeGroup *)callTimeGroup specifiers];
  [v3 addObjectsFromArray:v15];
LABEL_15:

  resetStatisticsGroup = self->_resetStatisticsGroup;
  if (!resetStatisticsGroup)
  {
    id v25 = [PSUIResetStatisticsGroup alloc];
    dataCache = self->_dataCache;
    callHistoryManager = self->_callHistoryManager;
    id v28 = objc_loadWeakRetained((id *)&self->_resetStatisticsDelegate);
    objc_super v29 = [(PSUIResetStatisticsGroup *)v25 initWithDataCache:dataCache callHistoryManager:callHistoryManager delegate:v28];
    v30 = self->_resetStatisticsGroup;
    self->_resetStatisticsGroup = v29;

    resetStatisticsGroup = self->_resetStatisticsGroup;
  }
  v31 = [(PSUIResetStatisticsGroup *)resetStatisticsGroup specifiers];
  [v3 addObjectsFromArray:v31];

  return v3;
}

- (void)setBillingPeriodSource:(id)a3
{
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"PSUIMiscOptionsGroup"];
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
}

- (PSCellularManagementCache)managementCache
{
  return self->_managementCache;
}

- (void)setManagementCache:(id)a3
{
}

- (PSUICarrierSpaceManager)carrierSpaceManager
{
  return self->_carrierSpaceManager;
}

- (void)setCarrierSpaceManager:(id)a3
{
}

- (PSUICallTimeGroup)callTimeGroup
{
  return self->_callTimeGroup;
}

- (void)setCallTimeGroup:(id)a3
{
}

- (PSUIResetStatisticsGroup)resetStatisticsGroup
{
  return self->_resetStatisticsGroup;
}

- (void)setResetStatisticsGroup:(id)a3
{
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
}

- (PSUICoreTelephonyCarrierBundleCache)carrierBundleCache
{
  return self->_carrierBundleCache;
}

- (void)setCarrierBundleCache:(id)a3
{
}

- (PSUIMBManagerWrapper)backupManagerWrapper
{
  return self->_backupManagerWrapper;
}

- (void)setBackupManagerWrapper:(id)a3
{
}

- (CHManager)callHistoryManager
{
  return self->_callHistoryManager;
}

- (void)setCallHistoryManager:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (PSUIResetStatisticsGroupDelegate)resetStatisticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_resetStatisticsDelegate);
  return (PSUIResetStatisticsGroupDelegate *)WeakRetained;
}

- (void)setResetStatisticsDelegate:(id)a3
{
}

- (PSBillingPeriodSource)billingPeriodSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_billingPeriodSource);
  return (PSBillingPeriodSource *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_billingPeriodSource);
  objc_destroyWeak((id *)&self->_resetStatisticsDelegate);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_callHistoryManager, 0);
  objc_storeStrong((id *)&self->_backupManagerWrapper, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_resetStatisticsGroup, 0);
  objc_storeStrong((id *)&self->_callTimeGroup, 0);
  objc_storeStrong((id *)&self->_carrierSpaceManager, 0);
  objc_storeStrong((id *)&self->_managementCache, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end