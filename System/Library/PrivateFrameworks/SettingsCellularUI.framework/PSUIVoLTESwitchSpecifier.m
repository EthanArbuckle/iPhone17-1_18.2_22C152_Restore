@interface PSUIVoLTESwitchSpecifier
- (BOOL)isVoLTEProvisioning;
- (BOOL)shouldEnableVoLTESwitchCell;
- (BOOL)shouldShowCallCarrierAlert;
- (BOOL)shouldShowCallWillEndWarning;
- (BOOL)shouldShowVoLTEUnsupportedWarning;
- (BOOL)showDisableVoLTEWarningsIfNeeded;
- (BOOL)showEnableVoLTEWarningsIfNeeded;
- (BOOL)showWarningsIfNeededForEnableState:(BOOL)a3;
- (PSUIVoLTESwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4;
- (PSUIVoLTESwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 callCache:(id)a5 capabilitiesCache:(id)a6 carrierBundleCache:(id)a7 simStatusCache:(id)a8;
- (id)createCallCarrierAlertForContext:(id)a3;
- (id)getLogger;
- (id)getVoLTEEnabled;
- (id)groupFooterText;
- (void)addSpinnerIfNeededToCell:(id)a3;
- (void)reloadSelfInListController;
- (void)setUpPhoneCallWillEndWarningSpecifier;
- (void)setVoLTEEnabled:(BOOL)a3;
- (void)setVoLTEEnabled:(id)a3 specifier:(id)a4;
- (void)setVoLTEOff;
- (void)showCallCarrierAlert;
- (void)showPhoneCallWillEndWarning;
@end

@implementation PSUIVoLTESwitchSpecifier

- (PSUIVoLTESwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 callCache:(id)a5 capabilitiesCache:(id)a6 carrierBundleCache:(id)a7 simStatusCache:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v26 = a5;
  id v25 = a6;
  id v24 = a7;
  id v23 = a8;
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"VoLTE" value:&stru_26D410CA0 table:@"VOLTE"];
  v27.receiver = self;
  v27.super_class = (Class)PSUIVoLTESwitchSpecifier;
  v18 = [(PSUIVoLTESwitchSpecifier *)&v27 initWithName:v17 target:self set:sel_setVoLTEEnabled_specifier_ get:sel_getVoLTEEnabled detail:0 cell:6 edit:0];

  if (v18)
  {
    objc_storeWeak((id *)&v18->_listController, v14);
    objc_storeStrong((id *)&v18->_parentSpecifier, a4);
    uint64_t v19 = [v15 propertyForKey:*MEMORY[0x263F60290]];
    subscriptionContext = v18->_subscriptionContext;
    v18->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v19;

    objc_storeStrong((id *)&v18->_callCache, a5);
    objc_storeStrong((id *)&v18->_capabilitiesCache, a6);
    objc_storeStrong((id *)&v18->_carrierBundleCache, a7);
    objc_storeStrong((id *)&v18->_simStatusCache, a8);
  }
  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIVoLTESwitchSpecifier shouldEnableVoLTESwitchCell](v18, "shouldEnableVoLTESwitchCell"));
  [(PSUIVoLTESwitchSpecifier *)v18 setProperty:v21 forKey:*MEMORY[0x263F600A8]];

  return v18;
}

- (PSUIVoLTESwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PSUICoreTelephonyCallCache sharedInstance];
  v9 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  v10 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  v11 = [MEMORY[0x263F67EF0] sharedInstance];
  v12 = [(PSUIVoLTESwitchSpecifier *)self initWithHostController:v7 parentSpecifier:v6 callCache:v8 capabilitiesCache:v9 carrierBundleCache:v10 simStatusCache:v11];

  return v12;
}

- (BOOL)shouldEnableVoLTESwitchCell
{
  if (![(PSUICoreTelephonyCallCache *)self->_callCache isAnyTelephonyCallActive]
    || (BOOL v3 = [(PSUICoreTelephonyCallCache *)self->_callCache isActiveCallVoLTE]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)getVoLTEEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache capabilityEnabledVoLTE:self->_subscriptionContext];
  v4 = [(PSUIVoLTESwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "OFF";
    if (v3) {
      v5 = "ON";
    }
    int v8 = 136315138;
    v9 = v5;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "VoLTE state is: %s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [NSNumber numberWithBool:v3];
  return v6;
}

- (void)setVoLTEEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(PSUIVoLTESwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"disable";
    if (v5) {
      id v7 = @"enable";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "attempting to %@ VoLTE", (uint8_t *)&v8, 0xCu);
  }

  if (![(PSUIVoLTESwitchSpecifier *)self showWarningsIfNeededForEnableState:v5]) {
    [(PSUIVoLTESwitchSpecifier *)self setVoLTEEnabled:v5];
  }
}

- (BOOL)showWarningsIfNeededForEnableState:(BOOL)a3
{
  if (a3) {
    return [(PSUIVoLTESwitchSpecifier *)self showEnableVoLTEWarningsIfNeeded];
  }
  else {
    return [(PSUIVoLTESwitchSpecifier *)self showDisableVoLTEWarningsIfNeeded];
  }
}

- (BOOL)showEnableVoLTEWarningsIfNeeded
{
  BOOL v3 = [(PSUIVoLTESwitchSpecifier *)self shouldShowCallCarrierAlert];
  if (v3) {
    [(PSUIVoLTESwitchSpecifier *)self showCallCarrierAlert];
  }
  return v3;
}

- (BOOL)showDisableVoLTEWarningsIfNeeded
{
  BOOL v3 = [(PSUIVoLTESwitchSpecifier *)self shouldShowCallWillEndWarning];
  if (v3) {
    [(PSUIVoLTESwitchSpecifier *)self showPhoneCallWillEndWarning];
  }
  return v3;
}

- (BOOL)shouldShowCallCarrierAlert
{
  return [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache cannotChangeVoLTESettingCallCarrier:self->_subscriptionContext];
}

- (BOOL)shouldShowVoLTEUnsupportedWarning
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache showVolteWarningUnsupportedCarrier:self->_subscriptionContext];
}

- (BOOL)shouldShowCallWillEndWarning
{
  int v3 = [(PSUICoreTelephonyCallCache *)self->_callCache isActiveCallVoLTE];
  if (v3)
  {
    simStatusCache = self->_simStatusCache;
    uint64_t v5 = [(CTXPCServiceSubscriptionContext *)self->_subscriptionContext slotID];
    LOBYTE(v3) = [(PSSimStatusCache *)simStatusCache isSlotActiveDataSlot:v5];
  }
  return v3;
}

- (void)showPhoneCallWillEndWarning
{
  int v3 = [(PSUIVoLTESwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "User tried to disable VoLTE during a call, showing warning", v5, 2u);
  }

  [(PSUIVoLTESwitchSpecifier *)self setUpPhoneCallWillEndWarningSpecifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained showConfirmationViewForSpecifier:self->_phoneCallWillEndWarning];
}

- (void)setUpPhoneCallWillEndWarningSpecifier
{
  if (!self->_phoneCallWillEndWarning)
  {
    int v3 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:&stru_26D410CA0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    phoneCallWillEndWarning = self->_phoneCallWillEndWarning;
    self->_phoneCallWillEndWarning = v3;

    id v15 = [MEMORY[0x263EFF9A0] dictionary];
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"ON_CALL_CANCEL" value:&stru_26D410CA0 table:@"VOLTE"];
    [v15 setObject:v6 forKey:*MEMORY[0x263F5FFF8]];

    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    int v8 = [v7 localizedStringForKey:@"ON_CALL_OK_DISABLE" value:&stru_26D410CA0 table:@"VOLTE"];
    [v15 setObject:v8 forKey:*MEMORY[0x263F60008]];

    v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v9 localizedStringForKey:@"RAT_ON_CALL_WARNING_DISABLE_VOLTE" value:&stru_26D410CA0 table:@"VOLTE"];
    [v15 setObject:v10 forKey:*MEMORY[0x263F60010]];

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = [v11 localizedStringForKey:@"DISABLE_VOLTE" value:&stru_26D410CA0 table:@"VOLTE"];
    [v15 setObject:v12 forKey:*MEMORY[0x263F60018]];

    [(PSConfirmationSpecifier *)self->_phoneCallWillEndWarning setupWithDictionary:v15];
    v13 = self->_phoneCallWillEndWarning;
    id v14 = [NSNumber numberWithBool:1];
    [(PSConfirmationSpecifier *)v13 setProperty:v14 forKey:*MEMORY[0x263F60000]];

    [(PSConfirmationSpecifier *)self->_phoneCallWillEndWarning setConfirmationAction:sel_setVoLTEOff];
    [(PSConfirmationSpecifier *)self->_phoneCallWillEndWarning setConfirmationCancelAction:sel_reloadSelfInListController];
  }
}

- (void)setVoLTEEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(PSUIVoLTESwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "OFF";
    if (v3) {
      id v6 = "ON";
    }
    *(_DWORD *)buf = 136315138;
    v9 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting VoLTE state : %s", buf, 0xCu);
  }

  [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache setCapabilityVoLTE:self->_subscriptionContext enabled:v3];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__PSUIVoLTESwitchSpecifier_setVoLTEEnabled___block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __44__PSUIVoLTESwitchSpecifier_setVoLTEEnabled___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained reloadSpecifiers];
}

- (void)setVoLTEOff
{
  [(PSUIVoLTESwitchSpecifier *)self setVoLTEEnabled:0];
  [(PSUIVoLTESwitchSpecifier *)self reloadSelfInListController];
}

- (void)reloadSelfInListController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__PSUIVoLTESwitchSpecifier_reloadSelfInListController__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __54__PSUIVoLTESwitchSpecifier_reloadSelfInListController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (void)showCallCarrierAlert
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  BOOL v3 = [(PSUIVoLTESwitchSpecifier *)self createCallCarrierAlertForContext:self->_subscriptionContext];
  [WeakRetained presentViewController:v3 animated:1 completion:0];
}

- (id)createCallCarrierAlertForContext:(id)a3
{
  parentSpecifier = self->_parentSpecifier;
  id v5 = a3;
  id v6 = [(PSSpecifier *)parentSpecifier propertyForKey:0x26D412E40];
  char v7 = [v6 BOOLValue];

  int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v9 = v8;
  if (v7)
  {
    uint64_t v10 = [v8 localizedStringForKey:@"SETUP_VOICE_ALERT_TITLE_LTE_AS_4G" value:&stru_26D410CA0 table:@"VOLTE"];

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = v11;
    v13 = @"SETUP_VOICE_ALERT_BODY_FORMAT_LTE_AS_4G";
  }
  else
  {
    uint64_t v10 = [v8 localizedStringForKey:@"SETUP_VOICE_ALERT_TITLE_LTE" value:&stru_26D410CA0 table:@"VOLTE"];

    v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v12 = v11;
    v13 = @"SETUP_VOICE_ALERT_BODY_FORMAT_LTE";
  }
  id v14 = [v11 localizedStringForKey:v13 value:&stru_26D410CA0 table:@"VOLTE"];

  id v15 = [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache carrierName:v5];
  v16 = objc_msgSend(NSString, "stringWithFormat:", v14, v15);
  v17 = [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache volteCustomerCareWebsite:v5];

  if (v17)
  {
    v18 = [NSURL URLWithString:v17];
  }
  else
  {
    v18 = 0;
  }
  v29 = (void *)v10;
  uint64_t v19 = [MEMORY[0x263F82418] alertControllerWithTitle:v10 message:v16 preferredStyle:1];
  if (v18)
  {
    v20 = (void *)MEMORY[0x263F82400];
    v21 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v22 = [v21 localizedStringForKey:@"SETUP_VOICE_OPTION_WEBSITE" value:&stru_26D410CA0 table:@"VOLTE"];
    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke;
    v31[3] = &unk_2645E0CA0;
    id v32 = v18;
    id v23 = [v20 actionWithTitle:v22 style:0 handler:v31];
    [v19 addAction:v23];
  }
  id v24 = (void *)MEMORY[0x263F82400];
  id v25 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v26 = [v25 localizedStringForKey:@"SETUP_VOICE_CANCEL" value:&stru_26D410CA0 table:@"VOLTE"];
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke_2;
  v30[3] = &unk_2645E0CA0;
  v30[4] = self;
  objc_super v27 = [v24 actionWithTitle:v26 style:1 handler:v30];
  [v19 addAction:v27];

  return v19;
}

void __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x263F82438] sharedApplication];
  [v2 openURL:*(void *)(a1 + 32) options:MEMORY[0x263EFFA78] completionHandler:0];
}

uint64_t __61__PSUIVoLTESwitchSpecifier_createCallCarrierAlertForContext___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSelfInListController];
}

- (void)addSpinnerIfNeededToCell:(id)a3
{
  id v5 = a3;
  if ([(PSUIVoLTESwitchSpecifier *)self isVoLTEProvisioning])
  {
    v4 = (void *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    [v4 startAnimating];
    [v5 setAccessoryView:v4];
  }
}

- (BOOL)isVoLTEProvisioning
{
  return [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache isVoLTEStillProvisioningForContext:self->_subscriptionContext];
}

- (id)groupFooterText
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"VOLTE_SWITCH_EXPLANATION" value:&stru_26D410CA0 table:@"VOLTE"];

  if ([(PSUIVoLTESwitchSpecifier *)self shouldShowVoLTEUnsupportedWarning])
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"VOLTE_UNSUPPORTED_WARNING" value:&stru_26D410CA0 table:@"VOLTE"];
    uint64_t v7 = [v4 stringByAppendingString:v6];

    v4 = (void *)v7;
  }
  return v4;
}

- (id)getLogger
{
  id v2 = (void *)MEMORY[0x263F67EB0];
  BOOL v3 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:self->_subscriptionContext];
  v4 = [v3 instance];
  id v5 = [v4 stringValue];
  id v6 = [v2 loggerWithCategory:@"VoLTESwitchSpecifier" instance:v5];

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
  objc_storeStrong((id *)&self->_simStatusCache, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_capabilitiesCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_phoneCallWillEndWarning, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end