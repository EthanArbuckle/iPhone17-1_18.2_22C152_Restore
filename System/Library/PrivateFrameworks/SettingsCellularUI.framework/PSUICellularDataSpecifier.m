@interface PSUICellularDataSpecifier
- (BOOL)isDetailControllerNeeded;
- (BOOL)isMSOActive;
- (NSArray)cachedPlanItems;
- (PSListController)hostController;
- (PSSimStatusCache)simStatusCache;
- (PSUICellularDataListItemsController)detailController;
- (PSUICellularDataSpecifier)initWithHostController:(id)a3;
- (PSUICellularDataSpecifier)initWithHostController:(id)a3 simStatusCache:(id)a4 planManagerCache:(id)a5 callCache:(id)a6 dataCache:(id)a7 wifiState:(id)a8;
- (PSUICellularPlanManagerCache)planManagerCache;
- (PSUICoreTelephonyCallCache)callCache;
- (PSUICoreTelephonyDataCache)dataCache;
- (PSUIDeviceWiFiState)wifiState;
- (id)_isCellularDataEnabled:(id)a3;
- (id)callEndConfirmationSpecifier;
- (id)getLogger;
- (id)isCellularDataEnabled:(id)a3;
- (id)planItemForListItem:(id)a3;
- (id)subscriptionContextForListItem:(id)a3;
- (void)_acceptedDataSwitch:(id)a3;
- (void)_setCellularDataEnabled:(id)a3 specifier:(id)a4;
- (void)_setCellularDataSwitch:(id)a3;
- (void)acceptedDataSwitch:(id)a3;
- (void)canceledDataSwitch:(id)a3;
- (void)setAirplaneMode:(BOOL)a3;
- (void)setCachedPlanItems:(id)a3;
- (void)setCallCache:(id)a3;
- (void)setCellularDataEnabled:(id)a3 specifier:(id)a4;
- (void)setCellularDataSwitch:(BOOL)a3;
- (void)setDataCache:(id)a3;
- (void)setDetailController:(id)a3;
- (void)setHostController:(id)a3;
- (void)setIsMSOActive:(BOOL)a3;
- (void)setPlanManagerCache:(id)a3;
- (void)setSimStatusCache:(id)a3;
- (void)setWifiState:(id)a3;
- (void)updateCachedState;
@end

@implementation PSUICellularDataSpecifier

- (PSUICellularDataSpecifier)initWithHostController:(id)a3
{
  v4 = (void *)MEMORY[0x263F67EF0];
  id v5 = a3;
  v6 = [v4 sharedInstance];
  v7 = +[PSUICellularPlanManagerCache sharedInstance];
  v8 = +[PSUICoreTelephonyCallCache sharedInstance];
  v9 = +[PSUICoreTelephonyDataCache sharedInstance];
  v10 = +[PSUIDeviceWiFiState sharedInstance];
  v11 = [(PSUICellularDataSpecifier *)self initWithHostController:v5 simStatusCache:v6 planManagerCache:v7 callCache:v8 dataCache:v9 wifiState:v10];

  return v11;
}

- (PSUICellularDataSpecifier)initWithHostController:(id)a3 simStatusCache:(id)a4 planManagerCache:(id)a5 callCache:(id)a6 dataCache:(id)a7 wifiState:(id)a8
{
  id v14 = a3;
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v20 = a8;
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"MOBILE_DATA_SETTINGS" value:&stru_26D410CA0 table:@"Cellular"];
  uint64_t v17 = objc_opt_class();
  v25.receiver = self;
  v25.super_class = (Class)PSUICellularDataSpecifier;
  v18 = [(PSUICellularDataSpecifier *)&v25 initWithName:v16 target:self set:sel_setCellularDataEnabled_specifier_ get:sel_isCellularDataEnabled_ detail:v17 cell:6 edit:0];

  if (v18)
  {
    [(PSUICellularDataSpecifier *)v18 setIdentifier:@"MOBILE_DATA_SETTINGS"];
    objc_storeWeak((id *)&v18->_hostController, v14);
    objc_storeStrong((id *)&v18->_simStatusCache, a4);
    objc_storeStrong((id *)&v18->_planManagerCache, a5);
    objc_storeStrong((id *)&v18->_dataCache, a7);
    objc_storeStrong((id *)&v18->_callCache, a6);
    objc_storeStrong((id *)&v18->_wifiState, a8);
    [(PSUICellularDataSpecifier *)v18 setAirplaneMode:[(PSUICoreTelephonyDataCache *)v18->_dataCache isAirplaneModeEnabled]];
    [(PSUICellularDataSpecifier *)v18 setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F60268]];
    [(PSUICellularDataSpecifier *)v18 updateCachedState];
  }

  return v18;
}

- (void)updateCachedState
{
  uint64_t v75 = *MEMORY[0x263EF8340];
  v3 = [(PSUICellularPlanManagerCache *)self->_planManagerCache planItems];
  cachedPlanItems = self->_cachedPlanItems;
  self->_cachedPlanItems = v3;

  id v5 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    unint64_t v7 = 0;
    int v8 = 0;
    unsigned int v9 = 0;
    do
    {
      v10 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
      v11 = [v10 objectAtIndexedSubscript:v7];

      v8 |= [v11 isSimHidden];
      v9 += [v11 isSimPresent];

      ++v7;
      v12 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
      unint64_t v13 = [v12 count];
    }
    while (v13 > v7);
    BOOL v14 = (v9 > 1) & v8;
  }
  else
  {
    BOOL v14 = 0;
  }
  self->_isMSOActive = v14;
  v15 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
    uint64_t v17 = [v16 count];
    NSUInteger v18 = [(NSArray *)self->_cachedPlanItems count];
    *(_DWORD *)buf = 134218240;
    *(void *)v72 = v17;
    *(_WORD *)&v72[8] = 2048;
    *(void *)&v72[10] = v18;
    _os_log_impl(&dword_221B17000, v15, OS_LOG_TYPE_DEFAULT, "%lu subscription context(s) and %lu plan item(s)", buf, 0x16u);
  }
  v19 = [(PSSimStatusCache *)self->_simStatusCache subscriptionContexts];
  if ((unint64_t)[v19 count] < 2)
  {

    goto LABEL_21;
  }
  NSUInteger v20 = [(NSArray *)self->_cachedPlanItems count];

  if (v20 < 2)
  {
LABEL_21:
    [(PSUICellularDataSpecifier *)self setCellType:6];
    *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE28]) = (Class)sel_isCellularDataEnabled_;
    *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE38]) = (Class)sel_setCellularDataEnabled_specifier_;
    return;
  }
  [(PSUICellularDataSpecifier *)self setCellType:2];
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE28]) = (Class)sel__isCellularDataEnabled_;
  *(Class *)((char *)&self->super.super.isa + (int)*MEMORY[0x263F5FE38]) = (Class)sel__setCellularDataEnabled_specifier_;
  id v21 = objc_opt_new();
  id v22 = objc_opt_new();
  v70 = objc_opt_new();
  id v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v24 = [v23 localizedStringForKey:@"OFF" value:&stru_26D410CA0 table:@"Cellular"];
  v69 = v21;
  [v21 addObject:v24];

  objc_super v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v26 = [v25 localizedStringForKey:@"OFF" value:&stru_26D410CA0 table:@"Cellular"];
  [v22 addObject:v26];

  v27 = [MEMORY[0x263EFF9D0] null];
  [v70 addObject:v27];

  v28 = self->_cachedPlanItems;
  v29 = &unk_221B9F000;
  if ([(NSArray *)v28 count])
  {
    unint64_t v30 = 0;
    int v31 = 0;
    do
    {
      v32 = [(NSArray *)v28 objectAtIndexedSubscript:v30];
      if ([v32 isSelected])
      {
        ++v31;
        v33 = NSString;
        v34 = [v32 userLabel];
        v35 = [v34 label];
        v36 = [v33 stringWithFormat:@"%@", v35];
        [v69 addObject:v36];

        v37 = NSString;
        v38 = [v32 userLabel];
        v39 = [v38 label];
        v40 = [v37 stringWithFormat:@"%@", v39];
        [v22 addObject:v40];

        v41 = [NSNumber numberWithInteger:v30];
        [v70 addObject:v41];

        v42 = [(PSUICellularDataSpecifier *)self getLogger];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v43 = [v32 userLabel];
          v44 = [v43 label];
          *(_DWORD *)buf = 138412546;
          *(void *)v72 = v44;
          *(_WORD *)&v72[8] = 1024;
          *(_DWORD *)&v72[10] = v30;
          _os_log_impl(&dword_221B17000, v42, OS_LOG_TYPE_DEFAULT, "Adding plan item %@ with value %d", buf, 0x12u);
        }
      }
      else
      {
        v42 = [(PSUICellularDataSpecifier *)self getLogger];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          v45 = [v32 userLabel];
          v46 = [v45 label];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v72 = v30;
          *(_WORD *)&v72[4] = 2112;
          *(void *)&v72[6] = v46;
          _os_log_impl(&dword_221B17000, v42, OS_LOG_TYPE_DEFAULT, "Plan item %d (%@) is not selected", buf, 0x12u);
        }
      }

      ++v30;
    }
    while ([(NSArray *)v28 count] > v30);
    v29 = (void *)&unk_221B9F000;
    if (v31 >= 2) {
      goto LABEL_35;
    }
  }
  else
  {
    int v31 = 0;
  }
  v47 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_221B17000, v47, OS_LOG_TYPE_DEFAULT, "Adding additional plans", buf, 2u);
  }

  if ([(NSArray *)v28 count])
  {
    unint64_t v48 = 0;
    int v67 = v29[94];
    int v68 = v31;
    do
    {
      v49 = [(NSArray *)v28 objectAtIndexedSubscript:v48];
      if (([v49 isSelected] & 1) != 0 || (objc_msgSend(v49, "isSelectable") & 1) == 0)
      {
        v59 = [(PSUICellularDataSpecifier *)self getLogger];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v62 = [v49 userLabel];
          v63 = [v62 label];
          int v64 = [v49 isSelected];
          int v65 = [v49 isSelectable];
          *(_DWORD *)buf = 67109890;
          *(_DWORD *)v72 = v48;
          *(_WORD *)&v72[4] = 2112;
          *(void *)&v72[6] = v63;
          *(_WORD *)&v72[14] = 1024;
          *(_DWORD *)&v72[16] = v64;
          __int16 v73 = 1024;
          int v74 = v65;
          _os_log_impl(&dword_221B17000, v59, OS_LOG_TYPE_DEFAULT, "Plan item %d (%@) is selected (%d) or not selectable (%d)", buf, 0x1Eu);
        }
      }
      else
      {
        v50 = NSString;
        v51 = [v49 userLabel];
        v52 = [v51 label];
        v53 = [v50 stringWithFormat:@"%@", v52];
        [v69 addObject:v53];

        v54 = NSString;
        v55 = [v49 userLabel];
        v56 = [v55 label];
        v57 = [v54 stringWithFormat:@"%@", v56];
        [v22 addObject:v57];

        v58 = [NSNumber numberWithInteger:v48];
        [v70 addObject:v58];

        v59 = [(PSUICellularDataSpecifier *)self getLogger];
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
        {
          v60 = [v49 userLabel];
          v61 = [v60 label];
          *(_DWORD *)buf = v67;
          *(void *)v72 = v61;
          *(_WORD *)&v72[8] = 1024;
          *(_DWORD *)&v72[10] = v48;
          _os_log_impl(&dword_221B17000, v59, OS_LOG_TYPE_DEFAULT, "Adding plan item %@ with value %d", buf, 0x12u);
        }
        int v31 = v68;
      }

      ++v48;
    }
    while ([(NSArray *)v28 count] > v48);
  }
LABEL_35:
  v66 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v72 = v31;
    _os_log_impl(&dword_221B17000, v66, OS_LOG_TYPE_DEFAULT, "%d lines turned on", buf, 8u);
  }

  [(PSUICellularDataSpecifier *)self setValues:v70 titles:v69 shortTitles:v22];
}

- (BOOL)isDetailControllerNeeded
{
  return [(PSUICellularDataSpecifier *)self cellType] == 2;
}

- (void)setAirplaneMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "OFF";
    if (v3) {
      uint64_t v6 = "ON";
    }
    int v7 = 136315138;
    int v8 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Airplane mode is %s", (uint8_t *)&v7, 0xCu);
  }

  if (v3) {
    [(PSUICellularDataSpecifier *)self setProperty:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F600A8]];
  }
  else {
    [(PSUICellularDataSpecifier *)self removePropertyForKey:*MEMORY[0x263F600A8]];
  }
}

- (id)isCellularDataEnabled:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v4 = [(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled];
  BOOL v5 = [(PSUICoreTelephonyDataCache *)self->_dataCache isAirplaneModeEnabled];
  uint64_t v6 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = "OFF";
    if (v4) {
      int v8 = "ON";
    }
    else {
      int v8 = "OFF";
    }
    if (v5) {
      int v7 = "ON";
    }
    int v11 = 136315394;
    v12 = v8;
    __int16 v13 = 2080;
    BOOL v14 = v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Cellular data %s airplane mode %s", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v9 = [NSNumber numberWithBool:v4 && !v5];
  return v9;
}

- (void)setCellularDataEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 BOOLValue];
    int v8 = @"OFF";
    if (v7) {
      int v8 = @"ON";
    }
    int v12 = 138412290;
    __int16 v13 = v8;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set cellular data switch to %@", (uint8_t *)&v12, 0xCu);
  }

  uint64_t v9 = [v5 BOOLValue];
  if (v9 != [(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled])
  {
    if ((v9 & 1) != 0 || ![(PSUICoreTelephonyCallCache *)self->_callCache isAnyVOIPCallActive])
    {
      [(PSUICellularDataSpecifier *)self setCellularDataSwitch:v9];
    }
    else
    {
      v10 = [(PSUICellularDataSpecifier *)self callEndConfirmationSpecifier];
      [v10 setConfirmationAction:sel_acceptedDataSwitch_];
      [v10 setProperty:v5 forKey:@"newValue"];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
      [WeakRetained showConfirmationViewForSpecifier:v10];
    }
  }
}

- (void)acceptedDataSwitch:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "User confirmed cellular data switch action", v8, 2u);
  }

  uint64_t v6 = [v4 propertyForKey:@"newValue"];

  uint64_t v7 = [v6 BOOLValue];
  [(PSUICellularDataSpecifier *)self setCellularDataSwitch:v7];
}

- (void)setCellularDataSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"OFF";
    if (v3) {
      uint64_t v6 = @"ON";
    }
    int v7 = 138412290;
    int v8 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting cellular data switch to %@", (uint8_t *)&v7, 0xCu);
  }

  [(PSUICoreTelephonyDataCache *)self->_dataCache setCellularDataEnabled:v3];
}

- (id)_isCellularDataEnabled:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  BOOL v5 = [(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled];
  BOOL v6 = [(PSUICoreTelephonyDataCache *)self->_dataCache isAirplaneModeEnabled];
  int v7 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = "OFF";
    if (v5) {
      uint64_t v9 = "ON";
    }
    else {
      uint64_t v9 = "OFF";
    }
    if (v6) {
      int v8 = "ON";
    }
    int v18 = 136315394;
    v19 = v9;
    __int16 v20 = 2080;
    id v21 = v8;
    _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "Cellular data %s airplane mode %s", (uint8_t *)&v18, 0x16u);
  }

  if (!v5 || v6)
  {
    v10 = [MEMORY[0x263EFF9D0] null];
  }
  else
  {
    int v11 = self->_cachedPlanItems;
    if ([(NSArray *)v11 count])
    {
      unint64_t v12 = 0;
      v10 = 0;
      id v13 = 0;
      do
      {
        uint64_t v14 = [(NSArray *)v11 objectAtIndexedSubscript:v12];
        if ([v14 isSelected])
        {
          uint64_t v15 = [NSNumber numberWithInteger:v12];

          id v13 = (id)v15;
        }
        if ([v14 isActiveDataPlan])
        {
          uint64_t v16 = [NSNumber numberWithInteger:v12];

          v10 = (void *)v16;
        }

        ++v12;
      }
      while ([(NSArray *)v11 count] > v12);
      if (v13 && self->_isMSOActive)
      {
        id v13 = v13;

        v10 = v13;
      }
    }
    else
    {
      id v13 = 0;
      v10 = 0;
    }
  }
  return v10;
}

- (void)_setCellularDataEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "Attempting to set cellular data switch to %@", (uint8_t *)&v12, 0xCu);
  }

  if (self->_isMSOActive)
  {
    int v7 = [(PSUICellularDataSpecifier *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "MSO active, ignore cellular data switch", (uint8_t *)&v12, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  int v8 = [MEMORY[0x263EFF9D0] null];
  int v9 = [v8 isEqual:v5];

  if (!v9)
  {
    v10 = -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", [v5 integerValue]);
    if ([(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled]
      && [v10 isActiveDataPlan])
    {
      id WeakRetained = [(PSUICellularDataSpecifier *)self getLogger];
      if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v12) = 0;
        _os_log_debug_impl(&dword_221B17000, WeakRetained, OS_LOG_TYPE_DEBUG, "Cellular data is already on and plan is already the active data plan", (uint8_t *)&v12, 2u);
      }
      goto LABEL_14;
    }

LABEL_16:
    [(PSUICellularDataSpecifier *)self _setCellularDataSwitch:v5];
    goto LABEL_20;
  }
  if (![(PSUICoreTelephonyDataCache *)self->_dataCache isCellularDataEnabled])
  {
    int v7 = [(PSUICellularDataSpecifier *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_debug_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEBUG, "Cellular data is already off", (uint8_t *)&v12, 2u);
    }
    goto LABEL_19;
  }
  if (![(PSUICoreTelephonyCallCache *)self->_callCache isAnyVOIPCallActive]) {
    goto LABEL_16;
  }
  v10 = [(PSUICellularDataSpecifier *)self callEndConfirmationSpecifier];
  [v10 setConfirmationAction:sel__acceptedDataSwitch_];
  [v10 setProperty:v5 forKey:@"newValue"];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained showConfirmationViewForSpecifier:v10];
LABEL_14:

LABEL_20:
}

- (void)_acceptedDataSwitch:(id)a3
{
  id v4 = a3;
  id v5 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v7 = 0;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "User confirmed cellular data switch action", v7, 2u);
  }

  BOOL v6 = [v4 propertyForKey:@"newValue"];

  [(PSUICellularDataSpecifier *)self _setCellularDataSwitch:v6];
}

- (void)_setCellularDataSwitch:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v4;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting cellular data switch to %@", (uint8_t *)&v9, 0xCu);
  }

  BOOL v6 = [MEMORY[0x263EFF9D0] null];
  int v7 = [v6 isEqual:v4];

  if (v7)
  {
    [(PSUICoreTelephonyDataCache *)self->_dataCache setCellularDataEnabled:0];
  }
  else
  {
    int v8 = -[NSArray objectAtIndexedSubscript:](self->_cachedPlanItems, "objectAtIndexedSubscript:", [v4 integerValue]);
    [(PSUICoreTelephonyDataCache *)self->_dataCache setCellularDataEnabled:1];
    [(PSUICellularPlanManagerCache *)self->_planManagerCache setSelectedPlanItemForData:v8];
  }
}

- (id)planItemForListItem:(id)a3
{
  id v4 = a3;
  if ([v4 cellType] != 3) {
    goto LABEL_5;
  }
  id v5 = [v4 values];
  BOOL v6 = [v5 firstObject];
  int v7 = [MEMORY[0x263EFF9D0] null];
  char v8 = [v6 isEqual:v7];

  if ((v8 & 1) != 0
    || ([v4 values],
        int v9 = objc_claimAutoreleasedReturnValue(),
        [v9 firstObject],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unint64_t v11 = [v10 integerValue],
        v10,
        v9,
        [(NSArray *)self->_cachedPlanItems count] <= v11))
  {
LABEL_5:
    int v12 = 0;
  }
  else
  {
    int v12 = [(NSArray *)self->_cachedPlanItems objectAtIndexedSubscript:v11];
  }

  return v12;
}

- (id)subscriptionContextForListItem:(id)a3
{
  id v4 = [(PSUICellularDataSpecifier *)self planItemForListItem:a3];
  id v5 = [(PSUICellularPlanManagerCache *)self->_planManagerCache subscriptionContextForPlanItem:v4 cachedSubscriptionContexts:0];

  return v5;
}

- (id)callEndConfirmationSpecifier
{
  BOOL v3 = [(PSUIDeviceWiFiState *)self->_wifiState isConnectedOverWiFi];
  id v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v4;
  if (v3) {
    BOOL v6 = @"CELLULAR_DATA_ON_FACETIME_WIFI_WARNING_DISABLE";
  }
  else {
    BOOL v6 = @"CELLULAR_DATA_ON_FACETIME_WARNING_DISABLE";
  }
  int v7 = [v4 localizedStringForKey:v6 value:&stru_26D410CA0 table:@"Cellular"];

  char v8 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:&stru_26D410CA0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
  int v9 = [MEMORY[0x263EFF9A0] dictionary];
  id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  unint64_t v11 = [v10 localizedStringForKey:@"ON_CALL_CANCEL" value:&stru_26D410CA0 table:@"Cellular"];
  [v9 setObject:v11 forKey:*MEMORY[0x263F5FFF8]];

  int v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"ON_CALL_OK_DISABLE" value:&stru_26D410CA0 table:@"Cellular"];
  [v9 setObject:v13 forKey:*MEMORY[0x263F60008]];

  [v9 setObject:v7 forKey:*MEMORY[0x263F60010]];
  uint64_t v14 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  uint64_t v15 = [v14 localizedStringForKey:@"DISABLE_CELLULAR_DATA" value:&stru_26D410CA0 table:@"Cellular"];
  [v9 setObject:v15 forKey:*MEMORY[0x263F60018]];

  [v8 setupWithDictionary:v9];
  uint64_t v16 = [NSNumber numberWithBool:1];
  [v8 setProperty:v16 forKey:*MEMORY[0x263F60000]];

  [v8 setConfirmationCancelAction:sel_canceledDataSwitch_];
  return v8;
}

- (void)canceledDataSwitch:(id)a3
{
  id v4 = [(PSUICellularDataSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v8 = 0;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "User cancelled cellular data switch action", v8, 2u);
  }

  id v5 = [(PSUICellularDataSpecifier *)self detailController];

  if (v5)
  {
    BOOL v6 = [(PSUICellularDataSpecifier *)self detailController];
    [v6 reloadSpecifiers];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained reloadSpecifierID:@"MOBILE_DATA_SETTINGS" animated:1];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"DataSpecifier"];
}

- (PSUICellularDataListItemsController)detailController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_detailController);
  return (PSUICellularDataListItemsController *)WeakRetained;
}

- (void)setDetailController:(id)a3
{
}

- (PSListController)hostController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  return (PSListController *)WeakRetained;
}

- (void)setHostController:(id)a3
{
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

- (PSUICoreTelephonyCallCache)callCache
{
  return self->_callCache;
}

- (void)setCallCache:(id)a3
{
}

- (PSUIDeviceWiFiState)wifiState
{
  return self->_wifiState;
}

- (void)setWifiState:(id)a3
{
}

- (NSArray)cachedPlanItems
{
  return self->_cachedPlanItems;
}

- (void)setCachedPlanItems:(id)a3
{
}

- (BOOL)isMSOActive
{
  return self->_isMSOActive;
}

- (void)setIsMSOActive:(BOOL)a3
{
  self->_isMSOActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedPlanItems, 0);
  objc_storeStrong((id *)&self->_wifiState, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_dataCache, 0);
  objc_storeStrong((id *)&self->_planManagerCache, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_destroyWeak((id *)&self->_hostController);
  objc_destroyWeak((id *)&self->_detailController);
}

@end