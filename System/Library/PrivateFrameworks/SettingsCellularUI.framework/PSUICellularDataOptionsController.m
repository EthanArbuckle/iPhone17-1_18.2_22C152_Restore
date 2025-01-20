@interface PSUICellularDataOptionsController
- (PSSimStatusCache)simStatusCache;
- (PSUICellularDataOptionsController)init;
- (PSUICellularDataOptionsController)initWithParentSpecifier:(id)a3;
- (PSUICellularDataOptionsController)initWithParentSpecifier:(id)a3 simStatusCache:(id)a4 planManagerCache:(id)a5 dataCache:(id)a6;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUICoreTelephonyDataCache)dataCache;
- (id)getCDMARoamingStatus:(id)a3;
- (id)getDataRoamingStatus:(id)a3;
- (id)getDataRoamingStatusForService:(id)a3;
- (id)getLogger;
- (id)roamingSettingsDescription:(id)a3;
- (id)roamingSpecifiers;
- (id)specifiers;
- (void)createSatelliteSubgroupIfRequired:(id)a3;
- (void)dealloc;
- (void)emitNavigationEvent;
- (void)roamingOptionsDidChange;
- (void)setCDMARoamingEnabled:(id)a3 specifier:(id)a4;
- (void)setDataCache:(id)a3;
- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4;
- (void)setDataRoamingEnabledForService:(id)a3 specifier:(id)a4;
- (void)setPlanManagerCache:(id)a3;
- (void)setSimStatusCache:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation PSUICellularDataOptionsController

- (PSUICellularDataOptionsController)init
{
  v12.receiver = self;
  v12.super_class = (Class)PSUICellularDataOptionsController;
  v2 = [(PSUICellularDataOptionsController *)&v12 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x263F67EF0] sharedInstance];
    simStatusCache = v2->_simStatusCache;
    v2->_simStatusCache = (PSSimStatusCache *)v3;

    uint64_t v5 = +[PSUICellularPlanManagerCache sharedInstance];
    planManagerCache = v2->_planManagerCache;
    v2->_planManagerCache = (PSUICellularPlanManagerCache *)v5;

    uint64_t v7 = +[PSUICoreTelephonyDataCache sharedInstance];
    dataCache = v2->_dataCache;
    v2->_dataCache = (PSUICoreTelephonyDataCache *)v7;

    v9 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"cellular_data_options_controller"];
    v2->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    v10 = [MEMORY[0x263F08A00] defaultCenter];
    [v10 addObserver:v2 selector:sel_airplaneModeChanged name:0x26D4164E0 object:0];
  }
  return v2;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PSUICellularDataOptionsController;
  [(PSUICellularDataOptionsController *)&v4 viewDidAppear:a3];
  [(PSUICellularDataOptionsController *)self emitNavigationEvent];
}

- (void)emitNavigationEvent
{
  v17[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = [NSURL URLWithString:@"settings-navigation://com.apple.Settings.Cellular/CELLULAR_DATA_OPTIONS"];
  id v4 = objc_alloc(MEMORY[0x263F08DB0]);
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:@"CELLULAR_DATA_OPTIONS" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v7 = [MEMORY[0x263EFF960] currentLocale];
  v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = [v8 bundleURL];
  v10 = (void *)[v4 initWithKey:v6 table:0 locale:v7 bundleURL:v9];

  id v11 = objc_alloc(MEMORY[0x263F08DB0]);
  objc_super v12 = [MEMORY[0x263EFF960] currentLocale];
  v13 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v14 = [v13 bundleURL];
  v15 = (void *)[v11 initWithKey:@"Cellular" table:0 locale:v12 bundleURL:v14];

  v17[0] = v15;
  v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:1];
  [(PSUICellularDataOptionsController *)self pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:@"com.apple.graphic-icon.cellular-settings" title:v10 localizedNavigationComponents:v16 deepLink:v3];
}

- (PSUICellularDataOptionsController)initWithParentSpecifier:(id)a3
{
  id v4 = (void *)MEMORY[0x263F67EF0];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  uint64_t v7 = +[PSUICellularPlanManagerCache sharedInstance];
  v8 = +[PSUICoreTelephonyDataCache sharedInstance];
  v9 = [(PSUICellularDataOptionsController *)self initWithParentSpecifier:v5 simStatusCache:v6 planManagerCache:v7 dataCache:v8];

  return v9;
}

- (PSUICellularDataOptionsController)initWithParentSpecifier:(id)a3 simStatusCache:(id)a4 planManagerCache:(id)a5 dataCache:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)PSUICellularDataOptionsController;
  v15 = [(PSUICellularDataOptionsController *)&v23 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_parentSpecifier, a3);
    v17 = [v11 propertyForKey:*MEMORY[0x263F60290]];
    uint64_t v18 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v17];
    serviceDescriptor = v16->_serviceDescriptor;
    v16->_serviceDescriptor = (CTServiceDescriptor *)v18;

    objc_storeStrong((id *)&v16->_simStatusCache, a4);
    objc_storeStrong((id *)&v16->_planManagerCache, a5);
    objc_storeStrong((id *)&v16->_dataCache, a6);
    v20 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"cellular_data_options_controller"];
    v16->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    v21 = [MEMORY[0x263F08A00] defaultCenter];
    [v21 addObserver:v16 selector:sel_airplaneModeChanged name:0x26D4164E0 object:0];
  }
  return v16;
}

- (void)dealloc
{
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    CFRelease(serverConnection);
  }
  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PSUICellularDataOptionsController;
  [(PSUICellularDataOptionsController *)&v5 dealloc];
}

- (id)specifiers
{
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (v4) {
    goto LABEL_24;
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
  v6 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"DATA_RATE_GROUP"];
  [v5 addObject:v6];
  id v7 = v6;
  v8 = [(PSSimStatusCache *)self->_simStatusCache subscriptionsInUse];
  v31 = v8;
  if ([v8 count])
  {
    v9 = [v8 objectAtIndexedSubscript:0];
  }
  else
  {
    v10 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
    v9 = [v10 objectAtIndexedSubscript:0];
  }
  uint64_t v11 = (int)*MEMORY[0x263F5FE98];
  [*(id *)((char *)&self->super.super.super.super.super.isa + v11) setProperty:v9 forKey:*MEMORY[0x263F60290]];
  id v12 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  if ((unint64_t)[v12 count] <= 1)
  {

    goto LABEL_9;
  }
  id v13 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planItems];
  unint64_t v14 = [v13 count];

  if (v14 < 2)
  {
LABEL_9:
    if (![(PSUICoreTelephonyDataCache *)self->_dataCache isAirplaneModeEnabled])
    {
      v15 = [(PSUICellularDataOptionsController *)self getLogger];
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEBUG, "Adding enable LTE/3G/etc group", buf, 2u);
      }

      v16 = [[PSUIVoiceAndDataSpecifier alloc] initWithHostController:self subscriptionContext:v9 groupSpecifierToUpdateFooterFor:0];
      if (v16) {
        objc_msgSend(v5, "ps_insertObject:afterObject:", v16, v7);
      }
    }
    int v30 = 0;
    goto LABEL_16;
  }
  int v30 = 1;
LABEL_16:
  if ([(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled]
    || PSIsVoiceRoamingOptionAvailable())
  {
    v17 = [(PSUICellularDataOptionsController *)self roamingSpecifiers];
    if ([v17 count]) {
      objc_msgSend(v5, "ps_insertObjectsFromArray:afterObject:", v17, v7);
    }
  }
  v32 = v7;
  uint64_t v18 = [PSUIDataModeSubgroup alloc];
  uint64_t v19 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa + v11);
  dataCache = self->_dataCache;
  id v21 = objc_alloc(MEMORY[0x263F02D30]);
  v22 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"data_options_controller"];
  objc_super v23 = (void *)[v21 initWithQueue:v22];
  v24 = [(PSUIDataModeSubgroup *)v18 initWithHostController:self parentSpecifier:v19 dataCache:dataCache context:v9 ctClient:v23];

  v25 = [(PSUIDataModeSubgroup *)v24 specifiers];
  [v5 addObjectsFromArray:v25];

  [MEMORY[0x263F67F00] logSpecifiers:v5 origin:@"[PSUICellularDataOptionsController specifiers] end"];
  v26 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  LODWORD(dataCache) = [v26 canSetSatelliteCapability:v9];

  if (((v30 | dataCache ^ 1) & 1) == 0)
  {
    [(PSUICellularDataOptionsController *)self createSatelliteSubgroupIfRequired:v9];
    v27 = [(PSUISatelliteSubgroup *)self->_satelliteSubgroup specifiers];
    [v5 addObjectsFromArray:v27];
  }
  v28 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

  id v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
LABEL_24:
  return v4;
}

- (void)createSatelliteSubgroupIfRequired:(id)a3
{
  if (!self->_satelliteSubgroup)
  {
    id v4 = a3;
    id v5 = [[PSUISatelliteSubgroup alloc] initWithHostController:self context:v4];

    satelliteSubgroup = self->_satelliteSubgroup;
    self->_satelliteSubgroup = v5;
  }
}

- (id)roamingSpecifiers
{
  uint64_t v3 = [MEMORY[0x263EFF980] array];
  if ([(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled]
    || PSIsVoiceRoamingOptionAvailable())
  {
    if (PSIsVoiceRoamingOptionAvailable())
    {
      id v4 = [(PSUICellularDataOptionsController *)self getLogger];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEBUG, "Adding voice roaming specifiers", buf, 2u);
      }

      uint64_t v5 = PSRoamingSubMenuSpecifiers(self);
LABEL_15:
      v9 = (void *)v5;
      [v3 addObjectsFromArray:v5];

      goto LABEL_16;
    }
    if (PSIsDataRoamingOptionAvailable())
    {
      v6 = [(PSUICellularDataOptionsController *)self getLogger];
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)id v12 = 0;
        _os_log_debug_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEBUG, "Adding data roaming specifiers", v12, 2u);
      }

      id v7 = PSDataRoamingSpecifiers(self);
      [v3 addObjectsFromArray:v7];
    }
    if (PSIsCDMARoamingOptionAvailable())
    {
      v8 = [(PSUICellularDataOptionsController *)self getLogger];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_debug_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEBUG, "Adding CDMA roaming specifiers", v11, 2u);
      }

      uint64_t v5 = PSCDMARoamingSpecifiers(self);
      goto LABEL_15;
    }
  }
LABEL_16:
  return v3;
}

- (id)roamingSettingsDescription:(id)a3
{
  BOOL v3 = [(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled];
  int v4 = PSIsVoiceRoamingEnabled();
  if (v3 && (v4 & PSIsDataRoamingEnabled()) == 1)
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = v5;
    id v7 = @"VOICE_AND_DATA_ROAMING";
  }
  else
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = v5;
    if (v4) {
      id v7 = @"VOICE_ONLY_ROAMING";
    }
    else {
      id v7 = @"NONE_ROAMING";
    }
  }
  v8 = [v5 localizedStringForKey:v7 value:&stru_26D410CA0 table:@"Cellular"];

  return v8;
}

- (id)getDataRoamingStatus:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PSUICellularDataOptionsController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = PSIsDataRoamingEnabled();
    uint64_t v5 = @"disabled";
    if (v4) {
      uint64_t v5 = @"enabled";
    }
    int v8 = 136315394;
    v9 = "-[PSUICellularDataOptionsController getDataRoamingStatus:]";
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s roaming is %@", (uint8_t *)&v8, 0x16u);
  }

  v6 = [NSNumber numberWithBool:PSIsDataRoamingEnabled()];
  return v6;
}

- (id)getDataRoamingStatusForService:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v4 = [(PSUICellularDataOptionsController *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    serviceDescriptor = self->_serviceDescriptor;
    int v6 = PSIsDataRoamingEnabledForService(serviceDescriptor);
    id v7 = @"disabled";
    uint64_t v11 = "-[PSUICellularDataOptionsController getDataRoamingStatusForService:]";
    int v10 = 136315650;
    __int16 v12 = 2112;
    id v13 = serviceDescriptor;
    if (v6) {
      id v7 = @"enabled";
    }
    __int16 v14 = 2112;
    v15 = v7;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s For service %@, roaming is %@", (uint8_t *)&v10, 0x20u);
  }

  int v8 = [NSNumber numberWithBool:PSIsDataRoamingEnabledForService(self->_serviceDescriptor)];
  return v8;
}

- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = [a3 BOOLValue];
  int v8 = [(PSUICellularDataOptionsController *)self getLogger];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = @"disabled";
    if (v7) {
      v9 = @"enabled";
    }
    int v19 = 136315394;
    v20 = "-[PSUICellularDataOptionsController setDataRoamingEnabled:specifier:]";
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "%s setting roaming = %@", (uint8_t *)&v19, 0x16u);
  }

  PSSetDataRoamingEnabled(v7);
  int v10 = [v6 identifier];

  [(PSUICellularDataOptionsController *)self beginUpdates];
  uint64_t v11 = [MEMORY[0x263F82670] currentDevice];
  char v12 = objc_msgSend(v11, "sf_isiPad");
  if (v7)
  {
    if ((v12 & 1) == 0)
    {
LABEL_13:

      goto LABEL_14;
    }
    id v13 = [(PSUICellularDataOptionsController *)self specifierForID:@"CDMA_ROAMING"];
    if (v13)
    {

      goto LABEL_13;
    }
    int v17 = PSIsCDMARoamingOptionAvailable();

    if (v17)
    {
      uint64_t v18 = PSCDMARoamingSpecifiers(self);
      [(PSUICellularDataOptionsController *)self insertContiguousSpecifiers:v18 afterSpecifierID:v10 animated:1];
    }
  }
  else
  {
    if ((v12 & 1) == 0) {
      goto LABEL_13;
    }
    uint64_t v14 = [(PSUICellularDataOptionsController *)self specifierForID:@"CDMA_ROAMING"];
    if (!v14) {
      goto LABEL_13;
    }
    v15 = (void *)v14;
    char v16 = PSIsCDMARoamingOptionAvailable();

    if ((v16 & 1) == 0) {
      [(PSUICellularDataOptionsController *)self removeSpecifierID:@"CDMA_ROAMING_GROUP" animated:1];
    }
  }
LABEL_14:
  [(PSUICellularDataOptionsController *)self endUpdates];
  [(PSUICellularDataOptionsController *)self roamingOptionsDidChange];
}

- (void)setDataRoamingEnabledForService:(id)a3 specifier:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(PSUICellularDataOptionsController *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    serviceDescriptor = self->_serviceDescriptor;
    int v8 = @"disabled";
    int v10 = "-[PSUICellularDataOptionsController setDataRoamingEnabledForService:specifier:]";
    int v9 = 136315650;
    if (v5) {
      int v8 = @"enabled";
    }
    __int16 v11 = 2112;
    char v12 = serviceDescriptor;
    __int16 v13 = 2112;
    uint64_t v14 = v8;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s For service %@, setting roaming = %@", (uint8_t *)&v9, 0x20u);
  }

  PSSetDataRoamingEnabledForService(self->_serviceDescriptor, v5);
  [(PSUICellularDataOptionsController *)self roamingOptionsDidChange];
}

- (void)setCDMARoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = [(PSUICellularDataOptionsController *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 BOOLValue];
    int v8 = @"disabled";
    if (v7) {
      int v8 = @"enabled";
    }
    int v9 = 136315394;
    int v10 = "-[PSUICellularDataOptionsController setCDMARoamingEnabled:specifier:]";
    __int16 v11 = 2112;
    char v12 = v8;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s setting CDMA roaming = %@", (uint8_t *)&v9, 0x16u);
  }

  [v5 BOOLValue];
  PSSetCDMARoamingEnabled();
  [(PSUICellularDataOptionsController *)self roamingOptionsDidChange];
}

- (id)getCDMARoamingStatus:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  int v4 = [(PSUICellularPlanManagerCache *)self->_planManagerCache selectedPlanItem];
  [v4 isBackedByCellularPlan];

  unint64_t CDMAInternationalRoaming = _CTServerConnectionGetCDMAInternationalRoaming();
  unint64_t v6 = HIDWORD(CDMAInternationalRoaming);
  if (HIDWORD(CDMAInternationalRoaming))
  {
    int v7 = CDMAInternationalRoaming;
    int v8 = [(PSUICellularDataOptionsController *)self getLogger];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v12 = v7;
      __int16 v13 = 1024;
      int v14 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Failed to get CDMAInternationalRoaming setting with error %i:%i", buf, 0xEu);
    }

    int v9 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    int v9 = [NSNumber numberWithInt:0];
  }
  return v9;
}

- (void)roamingOptionsDidChange
{
  id WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x263F5FE78]));
  [WeakRetained reloadSpecifier:*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularDataOptionsController"];
}

- (PSSimStatusCache)simStatusCache
{
  return self->_simStatusCache;
}

- (void)setSimStatusCache:(id)a3
{
}

- (PSUICellularPlanManagerCache)planManagerCache
{
  return self->_planManagerCache;
}

- (void)setPlanManagerCache:(id)a3
{
}

- (PSUICoreTelephonyDataCache)dataCache
{
  return self->_dataCache;
}

- (void)setDataCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_satelliteSubgroup, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
}

@end