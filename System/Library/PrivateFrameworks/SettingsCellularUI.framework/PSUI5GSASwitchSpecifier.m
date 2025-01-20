@interface PSUI5GSASwitchSpecifier
- (BOOL)shouldAddCoverageExtensionFooterText;
- (BOOL)shouldAddDefaultOffCarrierFooterText;
- (PSUI5GSASwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 carrierBundleCache:(id)a5;
- (id)getLogger;
- (id)groupFooterText;
- (id)is5GSAEnabled;
- (void)checkNRStatusAndDisableIfNeeded;
- (void)refreshSpecifiersInHostController;
- (void)set5GSAEnabled:(BOOL)a3;
- (void)set5GSASwitch:(id)a3 specifier:(id)a4;
@end

@implementation PSUI5GSASwitchSpecifier

- (PSUI5GSASwitchSpecifier)initWithHostController:(id)a3 parentSpecifier:(id)a4 carrierBundleCache:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"5G_SA" value:&stru_26D410CA0 table:@"Aries"];
  v21.receiver = self;
  v21.super_class = (Class)PSUI5GSASwitchSpecifier;
  v13 = [(PSUI5GSASwitchSpecifier *)&v21 initWithName:v12 target:self set:sel_set5GSASwitch_specifier_ get:sel_is5GSAEnabled detail:0 cell:6 edit:0];

  if (v13)
  {
    objc_storeWeak((id *)&v13->_listController, v8);
    objc_storeStrong((id *)&v13->_carrierBundleCache, a5);
    uint64_t v14 = [v9 propertyForKey:*MEMORY[0x263F60290]];
    subscriptionContext = v13->_subscriptionContext;
    v13->_subscriptionContext = (CTXPCServiceSubscriptionContext *)v14;

    v16 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v13->_subscriptionContext];
    v17 = [v16 instance];
    uint64_t v18 = [v17 stringValue];
    instance = v13->_instance;
    v13->_instance = (NSString *)v18;

    [(PSUI5GSASwitchSpecifier *)v13 checkNRStatusAndDisableIfNeeded];
  }

  return v13;
}

- (id)is5GSAEnabled
{
  v3 = NSNumber;
  v4 = +[PSUI5GStandaloneCache sharedInstance];
  v5 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "is5GSAEnabledForContext:", self->_subscriptionContext));

  return v5;
}

- (void)set5GSASwitch:(id)a3 specifier:(id)a4
{
  uint64_t v5 = [a3 BOOLValue];
  [(PSUI5GSASwitchSpecifier *)self set5GSAEnabled:v5];
}

- (void)set5GSAEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = +[PSUI5GStandaloneCache sharedInstance];
  v6 = [v5 set5GSAEnabled:v3 forContext:self->_subscriptionContext];

  v7 = [(PSUI5GSASwitchSpecifier *)self getLogger];
  id v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      subscriptionContext = self->_subscriptionContext;
      int v12 = 138412546;
      v13 = subscriptionContext;
      __int16 v14 = 2112;
      v15 = v6;
      _os_log_error_impl(&dword_221B17000, v8, OS_LOG_TYPE_ERROR, "Failed to activate 5G SA for service: %@, error: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"Disabled";
    v11 = self->_subscriptionContext;
    if (v3) {
      id v10 = @"Enabled";
    }
    int v12 = 138412546;
    v13 = v10;
    __int16 v14 = 2112;
    v15 = v11;
    _os_log_impl(&dword_221B17000, v8, OS_LOG_TYPE_DEFAULT, "Successfully set 5G SA state to: %@ for service: %@", (uint8_t *)&v12, 0x16u);
  }

  [(PSUI5GSASwitchSpecifier *)self refreshSpecifiersInHostController];
}

- (id)groupFooterText
{
  BOOL v3 = +[PSUI5GStandaloneCache sharedInstance];
  int v4 = [v3 is5GSASwitchUserInteractableForContext:self->_subscriptionContext];

  if (v4)
  {
    uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v6 = [v5 localizedStringForKey:@"5G_STANDALONE_EXPLANATION" value:&stru_26D410CA0 table:@"Aries"];

    if ([(PSUI5GSASwitchSpecifier *)self shouldAddDefaultOffCarrierFooterText])
    {
      v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v8 = [v7 localizedStringForKey:@"5G_STANDALONE_DEFAULT_OFF_CARRIER_EXPLANATION" value:&stru_26D410CA0 table:@"Aries"];
      uint64_t v9 = [(__CFString *)v6 stringByAppendingString:v8];

      v6 = (__CFString *)v9;
    }
    if (![(PSUI5GSASwitchSpecifier *)self shouldAddCoverageExtensionFooterText]) {
      goto LABEL_17;
    }
    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v11 = [v10 localizedStringForKey:@"5G_STANDALONE_COVERAGE_EXTENSION_EXPLANATION" value:&stru_26D410CA0 table:@"Aries"];
    uint64_t v12 = [(__CFString *)v6 stringByAppendingString:v11];

    v6 = (__CFString *)v11;
    goto LABEL_16;
  }
  v13 = +[PSUI5GStandaloneCache sharedInstance];
  int v14 = [v13 getSADisableStatusReasonMaskForContext:self->_subscriptionContext];

  if ((v14 & 0x40040008) != 0)
  {
    v15 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v16 = &stru_26D410CA0;
    v17 = [v15 localizedStringForKey:@"5G_STANDALONE_DISABLED" value:&stru_26D410CA0 table:@"Aries"];

    goto LABEL_18;
  }
  if ((v14 & 0x10000) == 0)
  {
    v6 = &stru_26D410CA0;
    if ((v14 & 2) == 0) {
      goto LABEL_17;
    }
    goto LABEL_12;
  }
  uint64_t v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v6 = [v18 localizedStringForKey:@"5G_STANDALONE_DISABLED_LPM" value:&stru_26D410CA0 table:@"Aries"];

  if ((v14 & 2) != 0)
  {
LABEL_12:
    v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v10 = [v19 localizedStringForKey:@"5G_STANDALONE_DISABLED_MSIM" value:&stru_26D410CA0 table:@"Aries"];

    if ([(__CFString *)v6 length])
    {
      id v20 = [(__CFString *)v6 stringByAppendingFormat:@"\n\n%@", v10];
    }
    else
    {
      id v20 = v10;
      id v10 = v20;
    }
    uint64_t v12 = (uint64_t)v20;
LABEL_16:

    v6 = (__CFString *)v12;
  }
LABEL_17:
  v17 = v6;
  uint64_t v16 = v17;
LABEL_18:

  return v17;
}

- (BOOL)shouldAddDefaultOffCarrierFooterText
{
  return ![(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache is5GSAEnabledByDefault:self->_subscriptionContext];
}

- (BOOL)shouldAddCoverageExtensionFooterText
{
  return [(PSUICoreTelephonyCarrierBundleCache *)self->_carrierBundleCache show5GSACoverageExtension:self->_subscriptionContext];
}

- (void)checkNRStatusAndDisableIfNeeded
{
  BOOL v3 = NSNumber;
  id v5 = +[PSUI5GStandaloneCache sharedInstance];
  int v4 = objc_msgSend(v3, "numberWithBool:", objc_msgSend(v5, "is5GSASwitchUserInteractableForContext:", self->_subscriptionContext));
  [(PSUI5GSASwitchSpecifier *)self setProperty:v4 forKey:*MEMORY[0x263F600A8]];
}

- (void)refreshSpecifiersInHostController
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__PSUI5GSASwitchSpecifier_refreshSpecifiersInHostController__block_invoke;
  block[3] = &unk_2645E0B88;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __60__PSUI5GSASwitchSpecifier_refreshSpecifiersInHostController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 216));
  [WeakRetained reloadSpecifiers];
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"SASwitch" instance:self->_instance];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instance, 0);
  objc_storeStrong((id *)&self->_nrStatus, 0);
  objc_storeStrong((id *)&self->_carrierBundleCache, 0);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
}

@end