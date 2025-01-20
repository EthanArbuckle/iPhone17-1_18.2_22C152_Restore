@interface PSUIVoiceAndDataDrillDownController
- (BOOL)shouldEnable5GRATModeSpecifiers;
- (BOOL)shouldShow5GReliabilityWarning;
- (BOOL)shouldShow5GSABatteryLifeReliabilityWarning;
- (BOOL)shouldShow5GSASwitch;
- (BOOL)shouldShowFooterTextWithVoiceExplanation;
- (BOOL)shouldShowVoLTESwitch;
- (BOOL)shouldShowVoNRSwitch;
- (PSUIVoiceAndDataDrillDownController)init;
- (PSUIVoiceAndDataDrillDownController)initWithCTClient:(id)a3 switchFactory:(id)a4 carrierBundleCache:(id)a5 standaloneCache:(id)a6;
- (id)getLogger;
- (id)getSwitchSpecifiers;
- (id)identifierForRATMode:(int)a3;
- (id)specifiers;
- (int)RATModeForSpecifier:(id)a3;
- (void)airplaneModeChanged;
- (void)configure5GRATModeSpecifiersEnabledState;
- (void)configureSpecifiers;
- (void)context:(id)a3 capabilitiesChanged:(id)a4;
- (void)handleMaxDataRateChanged;
- (void)listItemSelected:(id)a3;
- (void)nrDisableStatusChanged:(id)a3 status:(id)a4;
- (void)prepareSpecifiers:(id)a3;
- (void)reloadSpecifier:(id)a3;
- (void)set5GRATModeSpecifierEnabledState:(id)a3;
- (void)setRATGroupFooterText;
- (void)setSpecifier:(id)a3;
- (void)setUpRATModeSpecifierIdentifiers:(id)a3;
- (void)startObservingNotifications;
- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5;
- (void)updateCurrentRATModeFromSpecifier:(id)a3;
@end

@implementation PSUIVoiceAndDataDrillDownController

- (PSUIVoiceAndDataDrillDownController)initWithCTClient:(id)a3 switchFactory:(id)a4 carrierBundleCache:(id)a5 standaloneCache:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  v15 = [(PSUIVoiceAndDataDrillDownController *)&v18 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_ctClient, a3);
    [(CoreTelephonyClient *)v16->_ctClient setDelegate:v16];
    objc_storeStrong((id *)&v16->_switchFactory, a4);
    objc_storeStrong((id *)&v16->_cbCache, a5);
    objc_storeStrong((id *)&v16->_saCache, a6);
    [(PSUIVoiceAndDataDrillDownController *)v16 startObservingNotifications];
  }

  return v16;
}

- (PSUIVoiceAndDataDrillDownController)init
{
  v14.receiver = self;
  v14.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  v2 = [(PSUIVoiceAndDataDrillDownController *)&v14 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x263F02D30]);
    v4 = [MEMORY[0x263F67F00] createCTClientSerialQueue:@"voice_and_data_controller"];
    uint64_t v5 = [v3 initWithQueue:v4];
    ctClient = v2->_ctClient;
    v2->_ctClient = (CoreTelephonyClient *)v5;

    [(CoreTelephonyClient *)v2->_ctClient setDelegate:v2];
    v7 = objc_alloc_init(PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory);
    switchFactory = v2->_switchFactory;
    v2->_switchFactory = v7;

    uint64_t v9 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
    cbCache = v2->_cbCache;
    v2->_cbCache = (PSUICoreTelephonyCarrierBundleCache *)v9;

    uint64_t v11 = +[PSUI5GStandaloneCache sharedInstance];
    saCache = v2->_saCache;
    v2->_saCache = (PSUI5GStandaloneCache *)v11;

    [(PSUIVoiceAndDataDrillDownController *)v2 startObservingNotifications];
  }
  return v2;
}

- (void)startObservingNotifications
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 addObserver:self selector:sel_handleMaxDataRateChanged name:@"PSMaxDataRateChangedNotification" object:0];

  id v4 = [MEMORY[0x263F08A00] defaultCenter];
  [v4 addObserver:self selector:sel_airplaneModeChanged name:0x26D4164E0 object:0];
}

- (void)setSpecifier:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  [(PSUIVoiceAndDataDrillDownController *)&v9 setSpecifier:a3];
  uint64_t v4 = (int)*MEMORY[0x263F5FE98];
  uint64_t v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) propertyForKey:*MEMORY[0x263F60290]];
  subscriptionContext = self->_subscriptionContext;
  self->_subscriptionContext = v5;

  v7 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:self->_subscriptionContext];
  serviceDescriptor = self->_serviceDescriptor;
  self->_serviceDescriptor = v7;

  [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) setProperty:self forKey:@"DrillDownControllerKey"];
}

- (id)specifiers
{
  uint64_t v2 = (int)*MEMORY[0x263F5FDB8];
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    [(PSUIVoiceAndDataDrillDownController *)self updateCurrentRATModeFromSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + (int)*MEMORY[0x263F5FE98])];
    v6 = (void *)MEMORY[0x263EFF980];
    v14.receiver = self;
    v14.super_class = (Class)PSUIVoiceAndDataDrillDownController;
    v7 = [(PSListItemsController *)&v14 specifiers];
    v8 = [v6 arrayWithArray:v7];

    [(PSUIVoiceAndDataDrillDownController *)self prepareSpecifiers:v8];
    objc_super v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2);
    *(Class *)((char *)&self->super.super.super.super.super.super.isa + v2) = v8;
    v10 = v8;

    [(PSUIVoiceAndDataDrillDownController *)self configureSpecifiers];
    uint64_t v11 = (void *)MEMORY[0x263F67F00];
    id v12 = (void *)[*(id *)((char *)&self->super.super.super.super.super.super.isa + v2) mutableCopy];
    [v11 logSpecifiers:v12 origin:@"[PSUIVoiceAndDataDrillDownController specifiers] end"];

    id v4 = *(id *)((char *)&self->super.super.super.super.super.super.isa + v2);
  }
  return v4;
}

- (void)reloadSpecifier:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PSUIVoiceAndDataDrillDownController;
  [(PSUIVoiceAndDataDrillDownController *)&v8 reloadSpecifier:v4];
  uint64_t v5 = [v4 identifier];

  if (v5 == @"SASwitchSpecifierKey")
  {
    v6 = [(PSUIVoiceAndDataDrillDownController *)self specifierForID:@"SASwitchGroupSpecifierKey"];
    if (v6)
    {
      v7 = [v4 groupFooterText];
      [v6 setProperty:v7 forKey:*MEMORY[0x263F600F8]];

      [(PSUIVoiceAndDataDrillDownController *)self reloadSpecifier:v6];
    }
  }
}

- (void)prepareSpecifiers:(id)a3
{
  id v4 = a3;
  [(PSUIVoiceAndDataDrillDownController *)self setUpRATModeSpecifierIdentifiers:v4];
  id v5 = [(PSUIVoiceAndDataDrillDownController *)self getSwitchSpecifiers];
  [v4 addObjectsFromArray:v5];
}

- (void)setUpRATModeSpecifierIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([v4 count])
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          if (objc_msgSend(v10, "cellType", (void)v12))
          {
            uint64_t v11 = [(PSUIVoiceAndDataDrillDownController *)self identifierForRATMode:[(PSUIVoiceAndDataDrillDownController *)self RATModeForSpecifier:v10]];
            [v10 setIdentifier:v11];
          }
          else
          {
            [v10 setIdentifier:@"RATGroupSpecifierKey"];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

- (void)configureSpecifiers
{
  [(PSUIVoiceAndDataDrillDownController *)self configure5GRATModeSpecifiersEnabledState];
  [(PSUIVoiceAndDataDrillDownController *)self setRATGroupFooterText];
}

- (void)setRATGroupFooterText
{
  id v3 = [(PSUIVoiceAndDataDrillDownController *)self specifierForID:@"RATGroupSpecifierKey"];
  if (v3)
  {
    id v26 = v3;
    uint64_t v4 = (int)*MEMORY[0x263F5FE98];
    id v5 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) propertyForKey:0x26D412E40];
    int v6 = [v5 BOOLValue];

    BOOL v7 = [(PSUIVoiceAndDataDrillDownController *)self shouldShowFooterTextWithVoiceExplanation];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    objc_super v9 = v8;
    v10 = @"RAT_TEXT_LTE_AS_4G";
    if (v7) {
      v10 = @"RAT_TEXT_LTE_AS_4G_AND_VOICE";
    }
    uint64_t v11 = @"RAT_TEXT_LTE_AND_VOICE";
    if (!v7) {
      uint64_t v11 = @"RAT_TEXT_LTE";
    }
    if (v6) {
      long long v12 = v10;
    }
    else {
      long long v12 = v11;
    }
    long long v13 = [v8 localizedStringForKey:v12 value:&stru_26D410CA0 table:@"Cellular"];

    long long v14 = [*(id *)((char *)&self->super.super.super.super.super.super.isa + v4) propertyForKey:@"Supports5G"];
    int v15 = [v14 BOOLValue];

    if (!v15) {
      goto LABEL_23;
    }
    if ([(PSUIVoiceAndDataDrillDownController *)self shouldEnable5GRATModeSpecifiers])
    {
      v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      uint64_t v17 = [v16 localizedStringForKey:@"RAT_DRILLDOWN_SELECTION_EXPLANATION" value:&stru_26D410CA0 table:@"Aries"];

      if ([(PSUIVoiceAndDataDrillDownController *)self shouldShow5GSABatteryLifeReliabilityWarning])
      {
        objc_super v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v19 = v18;
        v20 = @"5G_SA_BATTERY_LIFE_RELIABILITY_WARNING_FOOTER";
      }
      else
      {
        if (![(PSUIVoiceAndDataDrillDownController *)self shouldShow5GReliabilityWarning])
        {
          long long v13 = v17;
          goto LABEL_23;
        }
        objc_super v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v19 = v18;
        v20 = @"5G_RELIABILITY_WARNING_FOOTER";
      }
      long long v13 = [v18 localizedStringForKey:v20 value:&stru_26D410CA0 table:@"Aries"];
      uint64_t v25 = [v17 stringByAppendingString:v13];
    }
    else
    {
      int v21 = [(PSUI5GStandaloneCache *)self->_saCache getNSADisableStatusReasonMaskForContext:self->_subscriptionContext];
      if ((v21 & 2) != 0)
      {
        v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
        v19 = v23;
        v24 = @"RAT_DRILLDOWN_SELECTION_EXPLANATION_DUAL_SIM_OUTSIDE_CHINA";
      }
      else
      {
        if ((v21 & 0x80000000) == 0)
        {
LABEL_23:
          [v26 setProperty:v13 forKey:*MEMORY[0x263F600F8]];

          id v3 = v26;
          goto LABEL_24;
        }
        unint64_t v22 = [(PSUI5GStandaloneCache *)self->_saCache getSADisableStatusReasonMaskForContext:self->_subscriptionContext];
        if ((v22 & 0x40008) != 0)
        {
          v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v19 = v23;
          v24 = @"5G_RAT_MODE_DISABLED";
        }
        else if ((v22 & 0x10000) != 0)
        {
          v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v19 = v23;
          v24 = @"5G_RAT_MODE_DISABLED_LPM";
        }
        else
        {
          if ((v22 & 2) == 0) {
            goto LABEL_23;
          }
          v23 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
          v19 = v23;
          v24 = @"5G_RAT_MODE_DISABLED_MSIM";
        }
      }
      uint64_t v25 = [v23 localizedStringForKey:v24 value:&stru_26D410CA0 table:@"Aries"];
    }

    long long v13 = (void *)v25;
    goto LABEL_23;
  }
LABEL_24:
}

- (BOOL)shouldEnable5GRATModeSpecifiers
{
  return [(PSUI5GStandaloneCache *)self->_saCache are5GRATModesUserInteractableForContext:self->_subscriptionContext];
}

- (void)configure5GRATModeSpecifiersEnabledState
{
  id v3 = [(PSUIVoiceAndDataDrillDownController *)self identifierForRATMode:4];
  uint64_t v4 = [(PSUIVoiceAndDataDrillDownController *)self specifierForID:v3];
  [(PSUIVoiceAndDataDrillDownController *)self set5GRATModeSpecifierEnabledState:v4];

  id v6 = [(PSUIVoiceAndDataDrillDownController *)self identifierForRATMode:5];
  id v5 = [(PSUIVoiceAndDataDrillDownController *)self specifierForID:v6];
  [(PSUIVoiceAndDataDrillDownController *)self set5GRATModeSpecifierEnabledState:v5];
}

- (void)set5GRATModeSpecifierEnabledState:(id)a3
{
  if (a3)
  {
    uint64_t v4 = NSNumber;
    id v5 = a3;
    objc_msgSend(v4, "numberWithBool:", -[PSUIVoiceAndDataDrillDownController shouldEnable5GRATModeSpecifiers](self, "shouldEnable5GRATModeSpecifiers"));
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    [v5 setProperty:v6 forKey:*MEMORY[0x263F600A8]];
  }
}

- (void)updateCurrentRATModeFromSpecifier:(id)a3
{
  id v4 = [a3 performGetter];
  self->_currentRATMode = [v4 unsignedIntValue];
}

- (id)getSwitchSpecifiers
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v3 = objc_opt_new();
  BOOL v4 = [(PSUIVoiceAndDataDrillDownController *)self shouldShowVoLTESwitch];
  id v5 = (int *)MEMORY[0x263F5FE98];
  if (v4)
  {
    id v6 = [(PSUIVoiceAndDataDrillDownController *)self getLogger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      v20 = "-[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers]";
      _os_log_debug_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEBUG, "%s showing VoLTE switch", (uint8_t *)&v19, 0xCu);
    }

    BOOL v7 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"VoLTESwitchGroupSpecifierKey"];
    [v3 addObject:v7];
    uint64_t v8 = [(PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory *)self->_switchFactory createVoLTESwitchSpecifierWithHostController:self parentSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v5)];
    [v8 setIdentifier:@"VoLTESwitchSpecifierKey"];
    [v3 addObject:v8];
    objc_super v9 = [v8 groupFooterText];
    if (v9) {
      [v7 setProperty:v9 forKey:*MEMORY[0x263F600F8]];
    }
  }
  if ([(PSUIVoiceAndDataDrillDownController *)self shouldShow5GSASwitch])
  {
    v10 = [(PSUIVoiceAndDataDrillDownController *)self getLogger];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      v20 = "-[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers]";
      _os_log_debug_impl(&dword_221B17000, v10, OS_LOG_TYPE_DEBUG, "%s showing 5G SA switch", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v11 = [(PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory *)self->_switchFactory create5GSASwitchSpecifierWithHostController:self parentSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v5)];
    [v11 setIdentifier:@"SASwitchSpecifierKey"];
    long long v12 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"SASwitchGroupSpecifierKey"];
    [v3 addObject:v12];
    [v3 addObject:v11];
    long long v13 = [v11 groupFooterText];
    if (v13) {
      [v12 setProperty:v13 forKey:*MEMORY[0x263F600F8]];
    }
  }
  if ([(PSUIVoiceAndDataDrillDownController *)self shouldShowVoNRSwitch])
  {
    long long v14 = [(PSUIVoiceAndDataDrillDownController *)self getLogger];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v19 = 136315138;
      v20 = "-[PSUIVoiceAndDataDrillDownController getSwitchSpecifiers]";
      _os_log_debug_impl(&dword_221B17000, v14, OS_LOG_TYPE_DEBUG, "%s showing VoNR switch", (uint8_t *)&v19, 0xCu);
    }

    int v15 = [MEMORY[0x263F5FC40] groupSpecifierWithID:@"VoNRSwitchGroupSpecifierKey"];
    [v3 addObject:v15];
    v16 = [(PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory *)self->_switchFactory createVoNRSwitchSpecifierWithHostController:self parentSpecifier:*(Class *)((char *)&self->super.super.super.super.super.super.isa + *v5)];
    [v16 setIdentifier:@"VoNRSwitchSpecifierKey"];
    [v3 addObject:v16];
    uint64_t v17 = [v16 groupFooterText];
    if (v17) {
      [v15 setProperty:v17 forKey:*MEMORY[0x263F600F8]];
    }
  }
  return v3;
}

- (BOOL)shouldShow5GSABatteryLifeReliabilityWarning
{
  if ([(PSUIVoiceAndDataDrillDownController *)self shouldShow5GSASwitch]
    || self->_currentRATMode < 4u)
  {
    return 0;
  }
  else
  {
    return ![(PSUICoreTelephonyCarrierBundleCache *)self->_cbCache is5GSAEnabledByDefault:self->_subscriptionContext];
  }
}

- (BOOL)shouldShow5GReliabilityWarning
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self->_cbCache show5GWarningUnsupportedCarrier:self->_subscriptionContext];
}

- (BOOL)shouldShowVoLTESwitch
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoLTESwitchForSubscriptionContext:self->_subscriptionContext RATMode:self->_currentRATMode];
}

- (BOOL)shouldShowVoNRSwitch
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShowVoNRSwitchForSubscriptionContext:self->_subscriptionContext RATMode:self->_currentRATMode];
}

- (BOOL)shouldShowFooterTextWithVoiceExplanation
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory isVoLTESwitchTurnedOnByDefaultAndHidden:self->_subscriptionContext];
}

- (BOOL)shouldShow5GSASwitch
{
  return +[PSUIVoiceAndDataDrillDownSwitchSpecifiersFactory shouldShow5GSASwitchForSubscriptionContext:self->_subscriptionContext RATMode:self->_currentRATMode];
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v9 = a4;
  BOOL v7 = [(PSUIVoiceAndDataDrillDownController *)self specifierAtIndexPath:a5];
  uint64_t v8 = [v7 identifier];

  if (v8 == @"VoLTESwitchSpecifierKey") {
    [v7 addSpinnerIfNeededToCell:v9];
  }
}

- (int)RATModeForSpecifier:(id)a3
{
  id v3 = [a3 values];
  BOOL v4 = [v3 firstObject];
  int v5 = [v4 unsignedIntValue];

  return v5;
}

- (id)identifierForRATMode:(int)a3
{
  if (a3 > 5)
  {
    BOOL v4 = @"NO_KNOWN_RAT_MODE";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%d", *(void *)&a3);
    BOOL v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)listItemSelected:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(PSUIVoiceAndDataDrillDownController *)self indexForIndexPath:v4];
  if (v5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    id v6 = [(PSUIVoiceAndDataDrillDownController *)self specifierAtIndex:v5];
    if ([v6 isRATModeSpecifier])
    {
      v7.receiver = self;
      v7.super_class = (Class)PSUIVoiceAndDataDrillDownController;
      [(PSListItemsController *)&v7 listItemSelected:v4];
    }
  }
}

- (void)context:(id)a3 capabilitiesChanged:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__PSUIVoiceAndDataDrillDownController_context_capabilitiesChanged___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __67__PSUIVoiceAndDataDrillDownController_context_capabilitiesChanged___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)handleMaxDataRateChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__PSUIVoiceAndDataDrillDownController_handleMaxDataRateChanged__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__PSUIVoiceAndDataDrillDownController_handleMaxDataRateChanged__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (void)airplaneModeChanged
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__PSUIVoiceAndDataDrillDownController_airplaneModeChanged__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __58__PSUIVoiceAndDataDrillDownController_airplaneModeChanged__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) navigationController];
  id v1 = (id)[v2 popViewControllerAnimated:1];
}

- (void)nrDisableStatusChanged:(id)a3 status:(id)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__PSUIVoiceAndDataDrillDownController_nrDisableStatusChanged_status___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __69__PSUIVoiceAndDataDrillDownController_nrDisableStatusChanged_status___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"VoiceAndDataDrilldown"];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_ctClient, 0);
  objc_storeStrong((id *)&self->_saCache, 0);
  objc_storeStrong((id *)&self->_cbCache, 0);
  objc_storeStrong((id *)&self->_switchFactory, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end