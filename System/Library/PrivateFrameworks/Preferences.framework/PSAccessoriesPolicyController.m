@interface PSAccessoriesPolicyController
- (PSAccessoriesPolicyController)initWithAppBundleID:(id)a3;
- (id)accessChangedHandler;
- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4;
- (id)numberOfAccessories:(id)a3;
- (void)handleSessionEvent:(id)a3;
- (void)setAccessChangedHandler:(id)a3;
@end

@implementation PSAccessoriesPolicyController

- (PSAccessoriesPolicyController)initWithAppBundleID:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PSAccessoriesPolicyController;
  v6 = [(PSAccessoriesPolicyController *)&v13 init];
  v7 = (DASession *)objc_alloc_init((Class)getDADaemonSessionClass());
  appSession = v6->_appSession;
  v6->_appSession = v7;

  objc_storeStrong((id *)&v6->_bundleID, a3);
  [(DASession *)v6->_appSession activate];
  objc_initWeak(&location, v6);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__PSAccessoriesPolicyController_initWithAppBundleID___block_invoke;
  v10[3] = &unk_1E5C5D500;
  objc_copyWeak(&v11, &location);
  [(DASession *)v6->_appSession setEventHandler:v10];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v6;
}

void __53__PSAccessoriesPolicyController_initWithAppBundleID___block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained handleSessionEvent:v3];
}

- (id)appSpecifierWithName:(id)a3 bundleID:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (_os_feature_enabled_impl())
  {
    id v27 = v7;
    id v28 = v6;
    v8 = [getDADaemonSessionClass() getDevicesWithFlags:8 session:self->_appSession error:0];
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v30 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v16 = [v15 appAccessInfoMap];
          v17 = [v16 allKeys];
          int v18 = [v17 containsObject:self->_bundleID];

          if (v18) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v12);
    }

    objc_storeStrong((id *)&self->_devices, v9);
    if ([v9 count])
    {
      uint64_t v19 = [v10 count];
      id v7 = v27;
      id v6 = v28;
      if (v19 == 1) {
        uint64_t v20 = (uint64_t)NSClassFromString(&cfstr_Asaccessoryinf.isa);
      }
      else {
        uint64_t v20 = objc_opt_class();
      }
      v21 = +[PSSpecifier preferenceSpecifierNamed:v28 target:self set:0 get:sel_numberOfAccessories_ detail:v20 cell:2 edit:0];
      [v21 setProperty:v27 forKey:@"bundleID"];
      if (v19 == 1)
      {
        v22 = [v10 firstObject];
        [v21 setProperty:v22 forKey:@"device"];
      }
      v23 = (void *)MEMORY[0x1E4F42A80];
      v24 = PSPreferencesFrameworkBundle();
      v25 = [v23 imageNamed:@"Accessory" inBundle:v24];

      if (v25) {
        [v21 setProperty:v25 forKey:@"iconImage"];
      }
    }
    else
    {
      v21 = 0;
      id v7 = v27;
      id v6 = v28;
    }
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)numberOfAccessories:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v4 = self->_devices;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = [*(id *)(*((void *)&v15 + 1) + 8 * i) appAccessInfoMap];
        uint64_t v11 = [v10 objectForKeyedSubscript:self->_bundleID];
        uint64_t v12 = [v11 state];

        if (v12 == 25) {
          ++v7;
        }
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%lu", v7);
  return v13;
}

- (void)handleSessionEvent:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)([a3 eventType] - 41) <= 1)
  {
    v4 = [getDADaemonSessionClass() getDevicesWithFlags:8 session:self->_appSession error:0];
    objc_storeStrong((id *)&self->_devices, v4);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_devices;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = 0;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "appAccessInfoMap", (void)v14);
          uint64_t v12 = [v11 objectForKeyedSubscript:self->_bundleID];
          uint64_t v13 = [v12 state];

          if (v13 == 25) {
            ++v8;
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    (*((void (**)(void))self->_accessChangedHandler + 2))();
  }
}

- (id)accessChangedHandler
{
  return self->_accessChangedHandler;
}

- (void)setAccessChangedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_accessChangedHandler, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_appSession, 0);
}

@end