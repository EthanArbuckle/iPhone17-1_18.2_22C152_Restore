@interface PSUICellularRoamingController
- (PSUICellularRoamingController)init;
- (id)_voiceRoamingFooterTextWithVoiceRoamingOn:(BOOL)a3;
- (id)cdmaRoamingSpecifiers;
- (id)dataRoamingSpecifiers;
- (id)getCDMARoamingStatus:(id)a3;
- (id)getDataRoamingStatus:(id)a3;
- (id)getDataRoamingStatusForService:(id)a3 specifier:(id)a4;
- (id)getLogger;
- (id)getVoiceRoamingStatus:(id)a3;
- (id)specifiers;
- (void)cellularPlanChangedNotification:(id)a3;
- (void)dealloc;
- (void)newCarrierNotification;
- (void)reloadRoamingStatus;
- (void)roamingOptionsDidChange;
- (void)setCDMARoamingEnabled:(id)a3 specifier:(id)a4;
- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4;
- (void)setVoiceRoamingEnabled:(id)a3 specifier:(id)a4;
@end

@implementation PSUICellularRoamingController

- (PSUICellularRoamingController)init
{
  v8.receiver = self;
  v8.super_class = (Class)PSUICellularRoamingController;
  v2 = [(PSUICellularRoamingController *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"cellular_roaming_controller"];
    v2->_serverConnection = (__CTServerConnection *)_CTServerConnectionCreateOnTargetQueue();

    v4 = [MEMORY[0x263F08A00] defaultCenter];
    [v4 addObserver:v2 selector:sel_newCarrierNotification name:@"PSNewCarrierNotification" object:0];

    v5 = [MEMORY[0x263F08A00] defaultCenter];
    [v5 addObserver:v2 selector:sel_cellularPlanChangedNotification_ name:@"PSUICellularPlanChanged" object:0];

    v6 = [MEMORY[0x263F08A00] defaultCenter];
    [v6 addObserver:v2 selector:sel_reloadRoamingStatus name:0x26D4164C0 object:0];
  }
  return v2;
}

- (void)dealloc
{
  serverConnection = self->_serverConnection;
  if (serverConnection) {
    CFRelease(serverConnection);
  }
  v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 removeObserver:self];

  v5.receiver = self;
  v5.super_class = (Class)PSUICellularRoamingController;
  [(PSUICellularRoamingController *)&v5 dealloc];
}

- (id)dataRoamingSpecifiers
{
  v3 = PSDataRoamingSpecifiers(self);
  v4 = [v3 specifierForID:@"DATA_ROAMING"];
  dataRoamingSpecifier = self->_dataRoamingSpecifier;
  self->_dataRoamingSpecifier = v4;

  return v3;
}

- (id)cdmaRoamingSpecifiers
{
  v3 = PSCDMARoamingSpecifiers(self);
  v4 = [v3 lastObject];
  cdmaRoamingSpecifier = self->_cdmaRoamingSpecifier;
  self->_cdmaRoamingSpecifier = v4;

  return v3;
}

- (id)_voiceRoamingFooterTextWithVoiceRoamingOn:(BOOL)a3
{
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  if (a3)
  {
    objc_super v5 = @"VOICE_ROAMING_ON_EXPLANATION";
  }
  else if (PSShouldIncludeMMSFooterNote())
  {
    objc_super v5 = @"VOICE_AND_DATA_ROAMING_OFF_EXPLANATION_MMS";
  }
  else
  {
    objc_super v5 = @"VOICE_AND_DATA_ROAMING_OFF_EXPLANATION";
  }
  v6 = [v4 localizedStringForKey:v5 value:&stru_26D410CA0 table:@"Cellular"];

  return v6;
}

- (id)specifiers
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  uint64_t v3 = (int)*MEMORY[0x263F5FDB8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    voiceRoamingSpecifier = self->_voiceRoamingSpecifier;
    self->_voiceRoamingSpecifier = 0;

    dataRoamingSpecifier = self->_dataRoamingSpecifier;
    self->_dataRoamingSpecifier = 0;

    cdmaRoamingSpecifier = self->_cdmaRoamingSpecifier;
    self->_cdmaRoamingSpecifier = 0;

    v9 = +[PSUICoreTelephonyDataCache sharedInstance];
    int v10 = [v9 isCellularDataEnabled];

    int v11 = PSIsVoiceRoamingOptionAvailable();
    uint64_t v12 = PSIsVoiceRoamingEnabled();
    if (v11)
    {
      v13 = [(PSUICellularRoamingController *)self getLogger];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[PSUICellularRoamingController specifiers]";
        _os_log_debug_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEBUG, "%s voice roaming is available", buf, 0xCu);
      }

      v14 = [MEMORY[0x263F5FC40] groupSpecifierWithName:0];
      [v14 setProperty:@"VOICE_ROAMING_GROUP" forKey:*MEMORY[0x263F60138]];
      v15 = [(PSUICellularRoamingController *)self _voiceRoamingFooterTextWithVoiceRoamingOn:v12];
      [v14 setProperty:v15 forKey:*MEMORY[0x263F600F8]];

      [v5 addObject:v14];
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = v16;
      if (v10 ^ 1 | v12) {
        v18 = @"VOICE_ROAMING_TOGGLE";
      }
      else {
        v18 = @"VOICE_DATA_ROAMING_TOGGLE";
      }
      v19 = [v16 localizedStringForKey:v18 value:&stru_26D410CA0 table:@"Cellular"];

      v20 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:v19 target:self set:sel_setVoiceRoamingEnabled_specifier_ get:sel_getVoiceRoamingStatus_ detail:0 cell:6 edit:0];
      v21 = self->_voiceRoamingSpecifier;
      self->_voiceRoamingSpecifier = v20;

      [v5 addObject:self->_voiceRoamingSpecifier];
    }
    if (v12)
    {
      v22 = [(PSUICellularRoamingController *)self getLogger];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136315138;
        v28 = "-[PSUICellularRoamingController specifiers]";
        _os_log_debug_impl(&dword_221B17000, v22, OS_LOG_TYPE_DEBUG, "%s voice roaming is enabled", buf, 0xCu);
      }

      if (v10)
      {
        v23 = [(PSUICellularRoamingController *)self dataRoamingSpecifiers];
        [v5 addObjectsFromArray:v23];
      }
      if (PSIsCDMARoamingOptionAvailable())
      {
        v24 = [(PSUICellularRoamingController *)self cdmaRoamingSpecifiers];
        [v5 addObjectsFromArray:v24];
      }
    }
    [MEMORY[0x263F67F00] logSpecifiers:v5 origin:@"[PSUICellularRoamingController specifiers] end"];
    v25 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
    *(Class *)((char *)&self->super.super.super.super.super.isa + v3) = (Class)v5;

    v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  }
  return v4;
}

- (void)newCarrierNotification
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(PSUICellularRoamingController *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[PSUICellularRoamingController newCarrierNotification]";
    __int16 v7 = 2112;
    objc_super v8 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__PSUICellularRoamingController_newCarrierNotification__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __55__PSUICellularRoamingController_newCarrierNotification__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)cellularPlanChangedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v4 = [(PSUICellularRoamingController *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v7 = "-[PSUICellularRoamingController cellularPlanChangedNotification:]";
    __int16 v8 = 2112;
    uint64_t v9 = @"PSUICellularPlanChanged";
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "%s received notification %@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__PSUICellularRoamingController_cellularPlanChangedNotification___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __65__PSUICellularRoamingController_cellularPlanChangedNotification___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)reloadRoamingStatus
{
  uint64_t v3 = +[PSUICoreTelephonyDataCache sharedInstance];
  int v4 = [v3 isCellularDataEnabled];
  id v5 = (int *)MEMORY[0x263F5FDB8];
  if (v4)
  {
    int v6 = PSIsVoiceRoamingEnabled();
    int v7 = [*(id *)((char *)&self->super.super.super.super.super.isa + *v5) containsObject:self->_dataRoamingSpecifier];

    if (v6 != v7)
    {
      [(PSUICellularRoamingController *)self reloadSpecifiers];
      return;
    }
  }
  else
  {
  }
  if (self->_voiceRoamingSpecifier
    && objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:"))
  {
    [(PSUICellularRoamingController *)self reloadSpecifier:self->_voiceRoamingSpecifier animated:1];
  }
  if (self->_dataRoamingSpecifier
    && objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:"))
  {
    [(PSUICellularRoamingController *)self reloadSpecifier:self->_dataRoamingSpecifier animated:1];
  }
  if (self->_cdmaRoamingSpecifier
    && objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v5), "containsObject:"))
  {
    cdmaRoamingSpecifier = self->_cdmaRoamingSpecifier;
    [(PSUICellularRoamingController *)self reloadSpecifier:cdmaRoamingSpecifier animated:1];
  }
}

- (void)setVoiceRoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [(PSUICellularRoamingController *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 BOOLValue];
    __int16 v8 = @"disabled";
    if (v7) {
      __int16 v8 = @"enabled";
    }
    int v28 = 136315394;
    uint64_t v29 = "-[PSUICellularRoamingController setVoiceRoamingEnabled:specifier:]";
    __int16 v30 = 2112;
    v31 = v8;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s setting voice roaming = %@", (uint8_t *)&v28, 0x16u);
  }

  uint64_t v9 = [v5 BOOLValue];
  if (v9 == PSIsVoiceRoamingEnabled())
  {
    int v11 = [(PSUICellularRoamingController *)self getLogger];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v28 = 67109120;
      LODWORD(v29) = v9;
      _os_log_debug_impl(&dword_221B17000, v11, OS_LOG_TYPE_DEBUG, "Voice roaming is already set to: %d", (uint8_t *)&v28, 8u);
    }
  }
  else
  {
    [(PSUICellularRoamingController *)self beginUpdates];
    PSSetVoiceRoamingEnabled();
    while (v9 != PSIsVoiceRoamingEnabled())
    {
      uint64_t v10 = [(PSUICellularRoamingController *)self getLogger];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v28) = 0;
        _os_log_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEFAULT, "CoreTelephony has not saved the voice roaming state (see 12172800)", (uint8_t *)&v28, 2u);
      }
    }
    int v11 = [(PSUICellularRoamingController *)self specifierForID:@"VOICE_ROAMING_GROUP"];
    uint64_t v12 = [(PSUICellularRoamingController *)self _voiceRoamingFooterTextWithVoiceRoamingOn:v9];
    [v11 setProperty:v12 forKey:*MEMORY[0x263F600F8]];

    [(PSUICellularRoamingController *)self reloadSpecifier:v11 animated:1];
    v13 = [(PSUICellularRoamingController *)self getLogger];
    BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG);
    if (v9)
    {
      if (v14)
      {
        LOWORD(v28) = 0;
        _os_log_debug_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEBUG, "Enabling voice roaming", (uint8_t *)&v28, 2u);
      }

      voiceRoamingSpecifier = self->_voiceRoamingSpecifier;
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      v17 = [v16 localizedStringForKey:@"VOICE_ROAMING_TOGGLE" value:&stru_26D410CA0 table:@"Cellular"];
      [(PSSpecifier *)voiceRoamingSpecifier setName:v17];

      v18 = [MEMORY[0x263EFF980] array];
      v19 = +[PSUICoreTelephonyDataCache sharedInstance];
      LODWORD(v17) = [v19 isCellularDataEnabled];

      if (v17)
      {
        v20 = [(PSUICellularRoamingController *)self dataRoamingSpecifiers];
        [v18 addObjectsFromArray:v20];
      }
      if (PSIsCDMARoamingOptionAvailable())
      {
        v21 = [(PSUICellularRoamingController *)self cdmaRoamingSpecifiers];
        [v18 addObjectsFromArray:v21];
      }
      if ([v18 count]) {
        [(PSUICellularRoamingController *)self insertContiguousSpecifiers:v18 afterSpecifier:self->_voiceRoamingSpecifier animated:1];
      }
    }
    else
    {
      if (v14)
      {
        LOWORD(v28) = 0;
        _os_log_debug_impl(&dword_221B17000, v13, OS_LOG_TYPE_DEBUG, "Disabling voice roaming", (uint8_t *)&v28, 2u);
      }

      v22 = +[PSUICoreTelephonyDataCache sharedInstance];
      int v23 = [v22 isCellularDataEnabled];

      if (v23)
      {
        v24 = self->_voiceRoamingSpecifier;
        v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v26 = [v25 localizedStringForKey:@"VOICE_DATA_ROAMING_TOGGLE" value:&stru_26D410CA0 table:@"Cellular"];
        [(PSSpecifier *)v24 setName:v26];
      }
      uint64_t v27 = [(PSUICellularRoamingController *)self indexOfSpecifier:self->_voiceRoamingSpecifier]
          + 1;
      v18 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "subarrayWithRange:", v27, objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FDB8]), "count")- v27);
      [(PSUICellularRoamingController *)self removeContiguousSpecifiers:v18 animated:1];
    }

    [(PSUICellularRoamingController *)self endUpdates];
    [(PSUICellularRoamingController *)self roamingOptionsDidChange];
  }
}

- (id)getVoiceRoamingStatus:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = PSIsVoiceRoamingEnabled();
  return (id)[v3 numberWithBool:v4];
}

- (id)getDataRoamingStatus:(id)a3
{
  uint64_t v3 = NSNumber;
  uint64_t v4 = PSIsDataRoamingEnabled();
  return (id)[v3 numberWithBool:v4];
}

- (id)getDataRoamingStatusForService:(id)a3 specifier:(id)a4
{
  uint64_t v4 = NSNumber;
  uint64_t v5 = PSIsDataRoamingEnabledForService(a3);
  return (id)[v4 numberWithBool:v5];
}

- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [(PSUICellularRoamingController *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 BOOLValue];
    __int16 v8 = @"disabled";
    if (v7) {
      __int16 v8 = @"enabled";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[PSUICellularRoamingController setDataRoamingEnabled:specifier:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s setting data roaming = %@", (uint8_t *)&v9, 0x16u);
  }

  PSSetDataRoamingEnabled([v5 BOOLValue]);
  [(PSUICellularRoamingController *)self roamingOptionsDidChange];
}

- (void)setCDMARoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  int v6 = [(PSUICellularRoamingController *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = [v5 BOOLValue];
    __int16 v8 = @"disabled";
    if (v7) {
      __int16 v8 = @"enabled";
    }
    int v9 = 136315394;
    uint64_t v10 = "-[PSUICellularRoamingController setCDMARoamingEnabled:specifier:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s setting CDMA roaming = %@", (uint8_t *)&v9, 0x16u);
  }

  [v5 BOOLValue];
  PSSetCDMARoamingEnabled();
  [(PSUICellularRoamingController *)self roamingOptionsDidChange];
}

- (id)getCDMARoamingStatus:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v4 = +[PSUICellularPlanManagerCache sharedInstance];
  id v5 = [v4 selectedPlanItem];
  [v5 isBackedByCellularPlan];

  unint64_t CDMAInternationalRoaming = _CTServerConnectionGetCDMAInternationalRoaming();
  unint64_t v7 = HIDWORD(CDMAInternationalRoaming);
  if (HIDWORD(CDMAInternationalRoaming))
  {
    int v8 = CDMAInternationalRoaming;
    int v9 = [(PSUICellularRoamingController *)self getLogger];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109376;
      int v13 = v8;
      __int16 v14 = 1024;
      int v15 = v7;
      _os_log_error_impl(&dword_221B17000, v9, OS_LOG_TYPE_ERROR, "Failed to get CDMAInternationalRoaming setting with error %i:%i", buf, 0xEu);
    }

    uint64_t v10 = (void *)MEMORY[0x263EFFA80];
  }
  else
  {
    uint64_t v10 = [NSNumber numberWithInt:0];
  }
  return v10;
}

- (void)roamingOptionsDidChange
{
  v2 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE78]);
  id WeakRetained = objc_loadWeakRetained(v2);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = objc_loadWeakRetained(v2);
    [v3 roamingOptionsDidChange];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CellularRoamingController"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cdmaRoamingSpecifier, 0);
  objc_storeStrong((id *)&self->_dataRoamingSpecifier, 0);
  objc_storeStrong((id *)&self->_voiceRoamingSpecifier, 0);
}

@end