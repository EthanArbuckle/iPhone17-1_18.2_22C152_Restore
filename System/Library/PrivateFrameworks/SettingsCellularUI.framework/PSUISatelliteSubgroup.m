@interface PSUISatelliteSubgroup
- (PSUISatelliteSubgroup)initWithHostController:(id)a3 context:(id)a4;
- (PSUISatelliteSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getLogger;
- (id)getSatelliteEnabled:(id)a3;
- (id)specifiers;
- (void)setSatelliteEnabled:(id)a3 specifier:(id)a4;
- (void)setupGroupSpecifierIfRequired;
- (void)setupSatelliteSwitchSpecifierIfRequired;
@end

@implementation PSUISatelliteSubgroup

- (PSUISatelliteSubgroup)initWithHostController:(id)a3 context:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PSUISatelliteSubgroup;
  v8 = [(PSUISatelliteSubgroup *)&v16 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_hostController, v6);
    objc_storeStrong((id *)&v9->_subscriptionContext, a4);
    uint64_t v10 = [MEMORY[0x263F02CD8] descriptorWithSubscriptionContext:v9->_subscriptionContext];
    serviceDescriptor = v9->_serviceDescriptor;
    v9->_serviceDescriptor = (CTServiceDescriptor *)v10;

    v12 = [(PSUISatelliteSubgroup *)v9 getLogger];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = [(PSUISatelliteSubgroup *)v9 getSatelliteEnabled:0];
      *(_DWORD *)buf = 138412290;
      v18 = v13;
      _os_log_impl(&dword_221B17000, v12, OS_LOG_TYPE_DEFAULT, "getSatelliteEnabled: %@", buf, 0xCu);
    }
    v14 = v9;
  }

  return v9;
}

- (void)setupGroupSpecifierIfRequired
{
  if (!self->_groupSpecifier)
  {
    v3 = (PSSpecifier *)[objc_alloc(MEMORY[0x263F5FC40]) initWithName:0 target:0 set:0 get:0 detail:0 cell:0 edit:0];
    groupSpecifier = self->_groupSpecifier;
    self->_groupSpecifier = v3;

    [(PSSpecifier *)self->_groupSpecifier setIdentifier:@"SatelliteGroup"];
    v5 = self->_groupSpecifier;
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v7 localizedStringForKey:@"SATELLITE_SWITCH_FOOTER" value:&stru_26D410CA0 table:@"Satellite"];
    [(PSSpecifier *)v5 setProperty:v6 forKey:*MEMORY[0x263F600F8]];
  }
}

- (void)setupSatelliteSwitchSpecifierIfRequired
{
  if (!self->_satelliteSwitchSpecifier)
  {
    v3 = (void *)MEMORY[0x263F5FC40];
    v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v5 = [v4 localizedStringForKey:@"SATELLITE_SWITCH_NAME" value:&stru_26D410CA0 table:@"Satellite"];
    id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setSatelliteEnabled_specifier_ get:sel_getSatelliteEnabled_ detail:0 cell:6 edit:0];
    satelliteSwitchSpecifier = self->_satelliteSwitchSpecifier;
    self->_satelliteSwitchSpecifier = v6;

    v8 = self->_satelliteSwitchSpecifier;
    [(PSSpecifier *)v8 setIdentifier:@"SatelliteSwitch"];
  }
}

- (id)specifiers
{
  v6[2] = *MEMORY[0x263EF8340];
  [(PSUISatelliteSubgroup *)self setupGroupSpecifierIfRequired];
  [(PSUISatelliteSubgroup *)self setupSatelliteSwitchSpecifierIfRequired];
  satelliteSwitchSpecifier = self->_satelliteSwitchSpecifier;
  v6[0] = self->_groupSpecifier;
  v6[1] = satelliteSwitchSpecifier;
  v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:2];
  return v4;
}

- (PSUISatelliteSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)setSatelliteEnabled:(id)a3 specifier:(id)a4
{
  id v5 = a3;
  id v6 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  subscriptionContext = self->_subscriptionContext;
  uint64_t v8 = [v5 BOOLValue];

  [v6 setSatelliteCapability:subscriptionContext enabled:v8];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostController);
  [WeakRetained reloadSpecifier:self->_satelliteSwitchSpecifier];
}

- (id)getSatelliteEnabled:(id)a3
{
  v4 = NSNumber;
  id v5 = +[PSUICoreTelephonyCapabilitiesCache sharedInstance];
  id v6 = objc_msgSend(v4, "numberWithBool:", objc_msgSend(v5, "getSatelliteCapability:", self->_subscriptionContext));

  return v6;
}

- (id)getLogger
{
  v2 = (void *)MEMORY[0x263F67EB0];
  v3 = [(CTServiceDescriptor *)self->_serviceDescriptor instance];
  v4 = [v3 stringValue];
  id v5 = [v2 loggerWithCategory:@"SAT" instance:v4];

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_satelliteSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_groupSpecifier, 0);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
  objc_storeStrong((id *)&self->_subscriptionContext, 0);
  objc_destroyWeak((id *)&self->_hostController);
}

@end