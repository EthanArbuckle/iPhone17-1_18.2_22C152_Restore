@interface SUSUIServiceManager
+ (id)sharedInstance;
- (BOOL)initialized;
- (BOOL)isServiceRegistered:(id)a3;
- (Class)classForService:(Class)a3;
- (Class)classForServiceName:(id)a3;
- (SUSUIServiceManager)init;
- (id)mockedServicesMap;
- (void)initialize;
- (void)registerMockClasses;
- (void)registerServiceWithName:(id)a3 forServiceClass:(Class)a4;
- (void)reset;
- (void)setInitialized:(BOOL)a3;
@end

@implementation SUSUIServiceManager

+ (id)sharedInstance
{
  v5 = (dispatch_once_t *)&sharedInstance_onceToken;
  id location = 0;
  objc_storeStrong(&location, &__block_literal_global);
  if (*v5 != -1) {
    dispatch_once(v5, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

void __37__SUSUIServiceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SUSUIServiceManager);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;
}

- (SUSUIServiceManager)init
{
  SEL v8 = a2;
  v9 = 0;
  v7.receiver = self;
  v7.super_class = (Class)SUSUIServiceManager;
  v6 = [(SUSUIServiceManager *)&v7 init];
  v9 = v6;
  objc_storeStrong((id *)&v9, v6);
  if (v6)
  {
    v2 = (NSMutableDictionary *)(id)[MEMORY[0x263EFF9A0] dictionary];
    registeredServices = v9->_registeredServices;
    v9->_registeredServices = v2;
  }
  v5 = v9;
  objc_storeStrong((id *)&v9, 0);
  return v5;
}

- (void)initialize
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v11 = self;
  v10[1] = (id)a2;
  if (![(SUSUIServiceManager *)self initialized])
  {
    [(SUSUIServiceManager *)v11 setInitialized:1];
    [(SUSUIServiceManager *)v11 reset];
    v10[0] = _SUSUILoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v10[0], OS_LOG_TYPE_DEFAULT))
    {
      log = v10[0];
      os_log_type_t type = v9;
      v2 = (objc_class *)objc_opt_class();
      v6 = NSStringFromClass(v2);
      SEL v8 = v6;
      __os_log_helper_16_2_2_8_32_8_66((uint64_t)v13, (uint64_t)"-[SUSUIServiceManager initialize]", (uint64_t)v8);
      _os_log_impl(&dword_228401000, log, type, "%s: Initializing %{public}@", v13, 0x16u);

      objc_storeStrong((id *)&v8, 0);
    }
    objc_storeStrong(v10, 0);
    if (NSClassFromString(&cfstr_Susuitestautom.isa))
    {
      id v3 = +[SUSUITestAutomationManager sharedManager];
      [v3 initialize];
    }
    else
    {
      os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_1_8_32((uint64_t)v12, (uint64_t)"-[SUSUIServiceManager initialize]");
        _os_log_error_impl(&dword_228401000, oslog, OS_LOG_TYPE_ERROR, "%s: __HAS_SUSUI_MOCKING_KIT is true but SUSUITestAutomationManager doesn't exists.", v12, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)registerServiceWithName:(id)a3 forServiceClass:(Class)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  Class v11 = a4;
  if (location[0] && v11)
  {
    if ([(NSMutableDictionary *)v13->_registeredServices objectForKey:location[0]])
    {
      os_log_t v7 = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t v6 = OS_LOG_TYPE_ERROR;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v15, (uint64_t)location[0], (uint64_t)v11);
        _os_log_error_impl(&dword_228401000, v7, v6, "Failed to register service with name '%@' for class '%@'. Service with this name is already registered.", v15, 0x16u);
      }
      objc_storeStrong((id *)&v7, 0);
      int v8 = 1;
    }
    else
    {
      os_log_t v5 = (os_log_t)_SUSUILoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v14, (uint64_t)location[0], (uint64_t)v11);
        _os_log_impl(&dword_228401000, v5, OS_LOG_TYPE_DEFAULT, "Registering service with name '%@' for class '%@'.", v14, 0x16u);
      }
      objc_storeStrong((id *)&v5, 0);
      [(NSMutableDictionary *)v13->_registeredServices setObject:v11 forKeyedSubscript:location[0]];
      int v8 = 0;
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
    os_log_type_t type = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_2_8_64_8_64((uint64_t)v16, (uint64_t)location[0], (uint64_t)v11);
      _os_log_error_impl(&dword_228401000, oslog, type, "Failed to register service with name '%@' for class '%@'. Service name and class must not be nil.", v16, 0x16u);
    }
    objc_storeStrong((id *)&oslog, 0);
    int v8 = 1;
  }
  objc_storeStrong(location, 0);
}

- (BOOL)isServiceRegistered:(id)a3
{
  os_log_type_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v4 = [(NSMutableDictionary *)v6->_registeredServices objectForKey:location[0]] != 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (Class)classForService:(Class)a3
{
  registeredServices = self->_registeredServices;
  os_log_type_t v6 = NSStringFromClass(a3);
  uint64_t v7 = -[NSMutableDictionary objectForKey:](registeredServices, "objectForKey:");

  if (v7) {
    Class v4 = (Class)v7;
  }
  else {
    Class v4 = a3;
  }
  return v4;
}

- (Class)classForServiceName:(id)a3
{
  os_log_type_t v6 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v4 = (id)[(NSMutableDictionary *)v6->_registeredServices objectForKey:location[0]];
  objc_storeStrong(location, 0);
  return (Class)v4;
}

- (void)reset
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
}

- (void)registerMockClasses
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  v35 = self;
  v34[1] = (id)a2;
  v34[0] = [(SUSUIServiceManager *)self mockedServicesMap];
  memset(__b, 0, sizeof(__b));
  id obj = v34[0];
  uint64_t v23 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
  if (v23)
  {
    uint64_t v19 = *(void *)__b[2];
    uint64_t v20 = 0;
    unint64_t v21 = v23;
    while (1)
    {
      uint64_t v18 = v20;
      if (*(void *)__b[2] != v19) {
        objc_enumerationMutation(obj);
      }
      id v33 = *(id *)(__b[1] + 8 * v20);
      id v31 = (id)[v34[0] objectForKeyedSubscript:v33];
      memset(v29, 0, sizeof(v29));
      id v16 = v31;
      uint64_t v17 = [v16 countByEnumeratingWithState:v29 objects:v37 count:16];
      if (v17)
      {
        uint64_t v13 = *(void *)v29[2];
        uint64_t v14 = 0;
        unint64_t v15 = v17;
        while (1)
        {
          uint64_t v12 = v14;
          if (*(void *)v29[2] != v13) {
            objc_enumerationMutation(v16);
          }
          id v30 = *(id *)(v29[1] + 8 * v14);
          v10 = v35;
          id v11 = (id)[v30 resolvedServiceClassName];
          -[SUSUIServiceManager registerServiceWithName:forServiceClass:](v10, "registerServiceWithName:forServiceClass:", v11, [v30 mockedServiceClass]);

          os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
          os_log_type_t type = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            log = oslog;
            os_log_type_t v6 = type;
            id v9 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass_1(), "descriptionForType:", objc_msgSend(v33, "integerValue"));
            id v2 = v9;
            id v26 = v2;
            uint64_t v3 = (uint64_t)v33;
            id v8 = (id)[v30 resolvedServiceClassName];
            id v4 = v8;
            id v25 = v4;
            uint64_t v7 = NSStringFromClass((Class)[v30 mockedServiceClass]);
            v24 = v7;
            __os_log_helper_16_2_5_8_32_8_64_8_64_8_64_8_64((uint64_t)v36, (uint64_t)"-[SUSUIServiceManager(XCUI) registerMockClasses]", (uint64_t)v2, v3, (uint64_t)v4, (uint64_t)v24);
            _os_log_impl(&dword_228401000, log, v6, "%s: Registering mock mapping for service \"%@\" (%@): \"%@\" -> \"%@\"", v36, 0x34u);

            objc_storeStrong((id *)&v24, 0);
            objc_storeStrong(&v25, 0);
            objc_storeStrong(&v26, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
          ++v14;
          if (v12 + 1 >= v15)
          {
            uint64_t v14 = 0;
            unint64_t v15 = [v16 countByEnumeratingWithState:v29 objects:v37 count:16];
            if (!v15) {
              break;
            }
          }
        }
      }

      objc_storeStrong(&v31, 0);
      ++v20;
      if (v18 + 1 >= v21)
      {
        uint64_t v20 = 0;
        unint64_t v21 = [obj countByEnumeratingWithState:__b objects:v38 count:16];
        if (!v21) {
          break;
        }
      }
    }
  }

  objc_storeStrong(v34, 0);
}

- (id)mockedServicesMap
{
  v19[2] = *MEMORY[0x263EF8340];
  v18[0] = &unk_26DCE4B78;
  uint64_t v3 = [SUSMKockedServiceRecord alloc];
  objc_opt_class();
  objc_opt_class();
  unint64_t v15 = -[SUSMKockedServiceRecord initWithServiceType:resolvingService:usingMockedClass:](v3, "initWithServiceType:resolvingService:usingMockedClass:");
  uint64_t v17 = v15;
  id v14 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:&v17 count:1];
  v19[0] = v14;
  v18[1] = &unk_26DCE4B90;
  id v4 = [SUSMKockedServiceRecord alloc];
  objc_opt_class();
  objc_opt_class();
  uint64_t v13 = -[SUSMKockedServiceRecord initWithServiceType:resolvingService:usingMockedClass:](v4, "initWithServiceType:resolvingService:usingMockedClass:");
  v16[0] = v13;
  os_log_type_t v6 = [SUSMKockedServiceRecord alloc];
  uint64_t v5 = objc_opt_class();
  uint64_t v12 = [(SUSMKockedServiceRecord *)v6 initWithServiceType:0 resolvingService:v5 usingMockedClass:objc_opt_class()];
  v16[1] = v12;
  id v8 = [SUSMKockedServiceRecord alloc];
  uint64_t v7 = objc_opt_class();
  id v11 = [(SUSMKockedServiceRecord *)v8 initWithServiceType:0 resolvingService:v7 usingMockedClass:objc_opt_class()];
  v16[2] = v11;
  id v9 = (id)[MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v19[1] = v9;
  id v10 = (id)[NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:2];

  return v10;
}

@end