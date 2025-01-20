@interface PSUIRoamingSpecifiersSubgroup
- (PSListController)listController;
- (PSUICoreTelephonyDataCache)dataCache;
- (PSUIRoamingSpecifiersSubgroup)initWithListController:(id)a3 dataCache:(id)a4 serviceDescriptor:(id)a5;
- (PSUIRoamingSpecifiersSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (id)getDataRoamingStatus:(id)a3;
- (id)getLogger;
- (id)specifiers;
- (void)roamingOptionsDidChange;
- (void)setDataCache:(id)a3;
- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4;
- (void)setListController:(id)a3;
@end

@implementation PSUIRoamingSpecifiersSubgroup

- (PSUIRoamingSpecifiersSubgroup)initWithListController:(id)a3 dataCache:(id)a4 serviceDescriptor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSUIRoamingSpecifiersSubgroup;
  v11 = [(PSUIRoamingSpecifiersSubgroup *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_listController, v8);
    objc_storeWeak((id *)&v12->_dataCache, v9);
    objc_storeStrong((id *)&v12->_serviceDescriptor, a5);
  }

  return v12;
}

- (PSUIRoamingSpecifiersSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (id)specifiers
{
  v12[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F5FC40];
  v4 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"DATA_ROAMING_TOGGLE" value:&stru_26D410CA0 table:@"Cellular"];
  id v6 = [v3 preferenceSpecifierNamed:v5 target:self set:sel_setDataRoamingEnabled_specifier_ get:sel_getDataRoamingStatus_ detail:0 cell:6 edit:0];

  [v6 setIdentifier:@"DATA_ROAMING"];
  v7 = NSNumber;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  id v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(WeakRetained, "hideDataRoaming:", self->_serviceDescriptor) ^ 1);
  [v6 setProperty:v9 forKey:*MEMORY[0x263F600A8]];

  v12[0] = v6;
  id v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

  return v10;
}

- (id)getDataRoamingStatus:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  uint64_t v5 = [WeakRetained getInternationalDataAccessStatus:self->_serviceDescriptor];

  id v6 = [(PSUIRoamingSpecifiersSubgroup *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"disabled";
    serviceDescriptor = self->_serviceDescriptor;
    v12 = "-[PSUIRoamingSpecifiersSubgroup getDataRoamingStatus:]";
    int v11 = 136315650;
    if (v5) {
      v7 = @"enabled";
    }
    __int16 v13 = 2112;
    objc_super v14 = serviceDescriptor;
    __int16 v15 = 2112;
    v16 = v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s For service %@, roaming is %@", (uint8_t *)&v11, 0x20u);
  }

  id v9 = [NSNumber numberWithBool:v5];
  return v9;
}

- (void)setDataRoamingEnabled:(id)a3 specifier:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  uint64_t v5 = [a3 BOOLValue];
  id v6 = [(PSUIRoamingSpecifiersSubgroup *)self getLogger];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"disabled";
    serviceDescriptor = self->_serviceDescriptor;
    int v11 = "-[PSUIRoamingSpecifiersSubgroup setDataRoamingEnabled:specifier:]";
    int v10 = 136315650;
    if (v5) {
      v7 = @"enabled";
    }
    __int16 v12 = 2112;
    __int16 v13 = serviceDescriptor;
    __int16 v14 = 2112;
    __int16 v15 = v7;
    _os_log_impl(&dword_221B17000, v6, OS_LOG_TYPE_DEFAULT, "%s For service %@, setting roaming = %@", (uint8_t *)&v10, 0x20u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  [WeakRetained setInternationalDataAccessStatus:self->_serviceDescriptor status:v5];

  [(PSUIRoamingSpecifiersSubgroup *)self roamingOptionsDidChange];
}

- (void)roamingOptionsDidChange
{
  id location = 0;
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __56__PSUIRoamingSpecifiersSubgroup_roamingOptionsDidChange__block_invoke;
  v2[3] = &unk_2645E0CD0;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __56__PSUIRoamingSpecifiersSubgroup_roamingOptionsDidChange__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    id v4 = objc_loadWeakRetained(v1);
    id v3 = [v4 listController];
    [v3 reloadSpecifiers];
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"RoamingSpecifiersSubgroup"];
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (PSUICoreTelephonyDataCache)dataCache
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataCache);
  return (PSUICoreTelephonyDataCache *)WeakRetained;
}

- (void)setDataCache:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataCache);
  objc_destroyWeak((id *)&self->_listController);
  objc_storeStrong((id *)&self->_serviceDescriptor, 0);
}

@end