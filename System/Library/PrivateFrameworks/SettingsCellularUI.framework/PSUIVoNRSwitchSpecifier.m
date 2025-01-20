@interface PSUIVoNRSwitchSpecifier
- (BOOL)shouldAddVoNRUnoptimizedWarning;
- (BOOL)shouldEnableVoNRSwitchCell;
- (BOOL)shouldShowCallWillEndWarning;
- (BOOL)showDisableVoNRWarningsIfNeeded;
- (PSUIVoNRSwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4;
- (PSUIVoNRSwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 callCache:(id)a5 capabilitiesCache:(id)a6 carrierBundleCache:(id)a7;
- (id)getLogger;
- (id)getVoNREnabled;
- (id)groupFooterText;
- (void)reloadSelfInListController;
- (void)setUpPhoneCallWillEndWarningSpecifier;
- (void)setVoNREnabled:(BOOL)a3;
- (void)setVoNREnabled:(id)a3 specifier:(id)a4;
- (void)setVoNROff;
- (void)showPhoneCallWillEndWarning;
@end

@implementation PSUIVoNRSwitchSpecifier

- (PSUIVoNRSwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 callCache:(id)a5 capabilitiesCache:(id)a6 carrierBundleCache:(id)a7
{
  id obj = a3;
  id v26 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v16 = [v15 localizedStringForKey:@"VoNR" value:&stru_26D410CA0 table:@"VONR-D63"];
  v28.receiver = self;
  v28.super_class = (Class)PSUIVoNRSwitchSpecifier;
  v17 = [(PSUIVoNRSwitchSpecifier *)&v28 initWithName:v16 target:self set:sel_setVoNREnabled_specifier_ get:sel_getVoNREnabled detail:0 cell:6 edit:0];

  if (v17)
  {
    objc_storeWeak((id *)&v17->_listController, obj);
    objc_storeStrong((id *)&v17->_parentSpecifier, a4);
    uint64_t v18 = [v26 propertyForKey:*MEMORY[0x263F60290]];
    subscriptionContext = v17->_subscriptionContext;
    v17->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v18;

    objc_storeStrong((id *)&v17->_callCache, a5);
    objc_storeStrong((id *)&v17->_capabilitiesCache, a6);
    objc_storeStrong((id *)&v17->_carrierBundleCache, a7);
    v20 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v17->_subscriptionContext];
    v21 = [v20 instance];
    uint64_t v22 = [v21 stringValue];
    instance = v17->_instance;
    v17->_instance = (NSString *)v22;
  }
  v24 = objc_msgSend(NSNumber, "numberWithBool:", -[PSUIVoNRSwitchSpecifier shouldEnableVoNRSwitchCell](v17, "shouldEnableVoNRSwitchCell"));
  [(PSUIVoNRSwitchSpecifier *)v17 setProperty:v24 forKey:*MEMORY[0x263F600A8]];

  [(PSUIVoNRSwitchSpecifier *)v17 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
  return v17;
}

- (PSUIVoNRSwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = +[PSUICoreTelephonyCallCache sharedInstance];
  v9 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  v10 = +[PSUICoreTelephonyCarrierBundleCache sharedInstance];
  v11 = [(PSUIVoNRSwitchSpecifier *)self initWithHostController:v7 parentSpecifier:v6 callCache:v8 capabilitiesCache:v9 carrierBundleCache:v10];

  return v11;
}

- (BOOL)shouldEnableVoNRSwitchCell
{
  if (![(PSUICoreTelephonyCallCache *)self->_callCache isAnyTelephonyCallActive]
    || (BOOL v3 = [(PSUICoreTelephonyCallCache *)self->_callCache isActiveCallVoNR]))
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (id)getVoNREnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v3 = [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache capabilityEnabledVoNR:self->_subscriptionContext];
  v4 = [(PSUIVoNRSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = "OFF";
    if (v3) {
      v5 = "ON";
    }
    int v8 = 136315138;
    v9 = v5;
    _os_log_impl(&dword_221B17000, v4, OS_LOG_TYPE_DEFAULT, "VoNR state is : %s", (uint8_t *)&v8, 0xCu);
  }

  id v6 = [NSNumber numberWithBool:v3];
  return v6;
}

- (void)setVoNREnabled:(id)a3 specifier:(id)a4
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(PSUIVoNRSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"disable";
    if (v5) {
      id v7 = @"enable";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "attempting to %@ VoNR", (uint8_t *)&v8, 0xCu);
  }

  if ((v5 & 1) != 0
    || ![(PSUIVoNRSwitchSpecifier *)self showDisableVoNRWarningsIfNeeded])
  {
    [(PSUIVoNRSwitchSpecifier *)self setVoNREnabled:v5];
  }
}

- (BOOL)showDisableVoNRWarningsIfNeeded
{
  BOOL v3 = [(PSUIVoNRSwitchSpecifier *)self shouldShowCallWillEndWarning];
  if (v3) {
    [(PSUIVoNRSwitchSpecifier *)self showPhoneCallWillEndWarning];
  }
  return v3;
}

- (BOOL)shouldShowCallWillEndWarning
{
  return [(PSUICoreTelephonyCallCache *)self->_callCache isActiveCallVoNR];
}

- (void)showPhoneCallWillEndWarning
{
  BOOL v3 = [(PSUIVoNRSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEFAULT, "User tried to disable VoNR during a call, showing warning", v5, 2u);
  }

  [(PSUIVoNRSwitchSpecifier *)self setUpPhoneCallWillEndWarningSpecifier];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  [WeakRetained showConfirmationViewForSpecifier:self->_phoneCallWillEndWarning];
}

- (void)setUpPhoneCallWillEndWarningSpecifier
{
  if (self->_phoneCallWillEndWarning)
  {
    BOOL v3 = [(PSUIVoNRSwitchSpecifier *)self getLogger];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_221B17000, v3, OS_LOG_TYPE_DEBUG, "Call will end warning has already been set up", buf, 2u);
    }
  }
  else
  {
    v4 = [MEMORY[0x263F5FB40] preferenceSpecifierNamed:&stru_26D410CA0 target:self set:0 get:0 detail:0 cell:-1 edit:0];
    phoneCallWillEndWarning = self->_phoneCallWillEndWarning;
    self->_phoneCallWillEndWarning = v4;

    id v16 = [MEMORY[0x263EFF9A0] dictionary];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"ON_CALL_CANCEL" value:&stru_26D410CA0 table:@"VONR-D63"];
    [v16 setObject:v7 forKey:*MEMORY[0x263F5FFF8]];

    int v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v9 = [v8 localizedStringForKey:@"ON_CALL_OK_DISABLE" value:&stru_26D410CA0 table:@"VONR-D63"];
    [v16 setObject:v9 forKey:*MEMORY[0x263F60008]];

    uint64_t v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"RAT_ON_CALL_WARNING_DISABLE_VONR" value:&stru_26D410CA0 table:@"VONR-D63"];
    [v16 setObject:v11 forKey:*MEMORY[0x263F60010]];

    id v12 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v13 = [v12 localizedStringForKey:@"DISABLE_VONR" value:&stru_26D410CA0 table:@"VONR-D63"];
    [v16 setObject:v13 forKey:*MEMORY[0x263F60018]];

    [(PSConfirmationSpecifier *)self->_phoneCallWillEndWarning setupWithDictionary:v16];
    id v14 = self->_phoneCallWillEndWarning;
    v15 = [NSNumber numberWithBool:1];
    [(PSConfirmationSpecifier *)v14 setProperty:v15 forKey:*MEMORY[0x263F60000]];

    [(PSConfirmationSpecifier *)self->_phoneCallWillEndWarning setConfirmationAction:sel_setVoNROff];
    [(PSConfirmationSpecifier *)self->_phoneCallWillEndWarning setConfirmationCancelAction:sel_reloadSelfInListController];
  }
}

- (void)setVoNREnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(PSUIVoNRSwitchSpecifier *)self getLogger];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "OFF";
    if (v3) {
      id v6 = "ON";
    }
    int v7 = 136315138;
    int v8 = v6;
    _os_log_impl(&dword_221B17000, v5, OS_LOG_TYPE_DEFAULT, "Setting VoNR state : %s", (uint8_t *)&v7, 0xCu);
  }

  [(PSUICoreTelephonyCapabilitiesCache *)self->_capabilitiesCache setCapabilityVoNR:self->_subscriptionContext enabled:v3];
  [(PSUIVoNRSwitchSpecifier *)self reloadSelfInListController];
}

- (void)setVoNROff
{
  [(PSUIVoNRSwitchSpecifier *)self setVoNREnabled:0];
  [(PSUIVoNRSwitchSpecifier *)self reloadSelfInListController];
}

- (void)reloadSelfInListController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__PSUIVoNRSwitchSpecifier_reloadSelfInListController__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __53__PSUIVoNRSwitchSpecifier_reloadSelfInListController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained reloadSpecifier:*(void *)(a1 + 32)];
}

- (id)groupFooterText
{
  BOOL v3 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:@"VONR_SWITCH_EXPLANATION" value:&stru_26D410CA0 table:@"VONR-D63"];

  if ([(PSUIVoNRSwitchSpecifier *)self shouldAddVoNRUnoptimizedWarning])
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"VONR_SWITCH_UNSUPPORTED_WARNING" value:&stru_26D410CA0 table:@"VONR-D63"];
    uint64_t v7 = [v4 stringByAppendingString:v6];

    v4 = (void *)v7;
  }
  return v4;
}

- (BOOL)shouldAddVoNRUnoptimizedWarning
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache showVoNRWarningUnsupportedCarrier:self->_subscriptionContext];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"VoNRSwitchSpecifier" instance:self->_instance];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_parentSpecifier, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_storeStrong((id *)&self->_capabilitiesCache, 0);
  objc_storeStrong((id *)&self->_callCache, 0);
  objc_storeStrong((id *)&self->_phoneCallWillEndWarning, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end