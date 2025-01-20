@interface PSUICallingSubgroup
- (NSArray)wifiCallingSpecifiers;
- (PSListController)listController;
- (PSSpecifier)parentSpecifier;
- (PSUICallingSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4;
- (PSUICallingSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5;
- (id)getLogger;
- (id)specifiers;
- (void)setListController:(id)a3;
- (void)setParentSpecifier:(id)a3;
- (void)setWifiCallingSpecifiers:(id)a3;
- (void)viewWillAppear;
@end

@implementation PSUICallingSubgroup

- (PSUICallingSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4 parentSpecifier:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PSUICallingSubgroup;
  v9 = [(PSUICallingSubgroup *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_listController, v7);
    id v11 = objc_storeWeak((id *)&v10->_parentSpecifier, v8);
    v12 = [v8 propertyForKey:*MEMORY[0x263F60290]];

    v10->_supportsWiFiCalling = +[SettingsCellularUtils supportsWiFiCalling:v12];
  }

  return v10;
}

- (PSUICallingSubgroup)initWithListController:(id)a3 groupSpecifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  objc_exception_throw((id)[objc_alloc(MEMORY[0x263EFF940]) initWithName:@"Unsupported initializer called" reason:@"Unsupported initializer called" userInfo:0]);
}

- (void)viewWillAppear
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  v3 = self->_wifiCallingSpecifiers;
  uint64_t v4 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    p_listController = &self->_listController;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        id WeakRetained = objc_loadWeakRetained((id *)p_listController);
        objc_msgSend(WeakRetained, "reloadSpecifier:", v9, (void)v11);

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [(NSArray *)v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (id)specifiers
{
  v38[1] = *MEMORY[0x263EF8340];
  v23 = objc_opt_new();
  uint64_t v37 = *MEMORY[0x263F5FF68];
  uint64_t v24 = v37;
  v38[0] = @"WiFiCallingTelephonySettings";
  v26 = [NSDictionary dictionaryWithObjects:v38 forKeys:&v37 count:1];
  v34 = v26;
  v35 = @"items";
  v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v34 count:1];
  v36 = v3;
  uint64_t v4 = [NSDictionary dictionaryWithObjects:&v36 forKeys:&v35 count:1];
  location = (id *)&self->_parentSpecifier;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  p_listController = &self->_listController;
  id v7 = objc_loadWeakRetained((id *)&self->_listController);
  uint64_t v8 = [v7 bundle];
  id v9 = objc_loadWeakRetained((id *)&self->_listController);
  id v28 = 0;
  v10 = SpecifiersFromPlist();

  id v25 = v28;
  long long v11 = objc_msgSend(v10, "copy", &v28);
  [(PSUICallingSubgroup *)self setWifiCallingSpecifiers:v11];

  [v23 addObjectsFromArray:self->_wifiCallingSpecifiers];
  uint64_t v32 = v24;
  v33 = @"PrimaryCloudCallingSettingsBundle";
  long long v12 = [NSDictionary dictionaryWithObjects:&v33 forKeys:&v32 count:1];
  v29 = v12;
  v30 = @"items";
  long long v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v29 count:1];
  v31 = v13;
  long long v14 = [NSDictionary dictionaryWithObjects:&v31 forKeys:&v30 count:1];
  id v15 = objc_loadWeakRetained(location);
  id v16 = objc_loadWeakRetained((id *)p_listController);
  v17 = [v16 bundle];
  id v18 = objc_loadWeakRetained((id *)p_listController);
  id v27 = 0;
  v19 = SpecifiersFromPlist();

  id v20 = v27;
  objc_msgSend(v23, "addObjectsFromArray:", v19, &v27);

  return v23;
}

- (void)setWifiCallingSpecifiers:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (self->_supportsWiFiCalling)
  {
    objc_storeStrong((id *)&self->_wifiCallingSpecifiers, a3);
    p_super = [(PSUICallingSubgroup *)self getLogger];
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[PSUICallingSubgroup setWifiCallingSpecifiers:]";
      _os_log_impl(&dword_221B17000, p_super, OS_LOG_TYPE_DEFAULT, "%s WiFi calling is supported, adding specifiers", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    id v7 = [(PSUICallingSubgroup *)self getLogger];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315138;
      id v9 = "-[PSUICallingSubgroup setWifiCallingSpecifiers:]";
      _os_log_impl(&dword_221B17000, v7, OS_LOG_TYPE_DEFAULT, "%s WiFi calling is not supported, omitting specifiers", (uint8_t *)&v8, 0xCu);
    }

    p_super = &self->_wifiCallingSpecifiers->super;
    self->_wifiCallingSpecifiers = 0;
  }
}

- (id)getLogger
{
  return (id)[MEMORY[0x263F67EB0] loggerWithCategory:@"CallingSubgroup"];
}

- (PSListController)listController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_listController);
  return (PSListController *)WeakRetained;
}

- (void)setListController:(id)a3
{
}

- (PSSpecifier)parentSpecifier
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentSpecifier);
  return (PSSpecifier *)WeakRetained;
}

- (void)setParentSpecifier:(id)a3
{
}

- (NSArray)wifiCallingSpecifiers
{
  return self->_wifiCallingSpecifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wifiCallingSpecifiers, 0);
  objc_destroyWeak((id *)&self->_parentSpecifier);
  objc_destroyWeak((id *)&self->_listController);
}

@end