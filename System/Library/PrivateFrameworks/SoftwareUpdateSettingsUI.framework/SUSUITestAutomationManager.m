@interface SUSUITestAutomationManager
+ (id)sharedManager;
- (BOOL)enabled;
- (SUSUITestAutomationManager)init;
- (SUSUIUserDefaultsBasedTestSession)currentSession;
- (id)description;
- (void)addResponderDelegate:(id)a3 forServiceType:(int64_t)a4;
- (void)dealloc;
- (void)initialize;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)resolveStoredXCUISession:(id)a3;
- (void)setupAutomaticTestingForStoredSession:(id)a3;
- (void)startObserving;
- (void)stopObserving;
@end

@implementation SUSUITestAutomationManager

+ (id)sharedManager
{
  id v11 = a1;
  SEL v10 = a2;
  uint64_t obj = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  v7 = __43__SUSUITestAutomationManager_sharedManager__block_invoke;
  v8 = &__block_descriptor_40_e5_v8__0l;
  id v9 = a1;
  v13 = (dispatch_once_t *)&sharedManager_onceToken_0;
  id location = 0;
  objc_storeStrong(&location, &obj);
  if (*v13 != -1) {
    dispatch_once(v13, location);
  }
  objc_storeStrong(&location, 0);
  v2 = (void *)sharedManager_sharedManager;
  return v2;
}

void __43__SUSUITestAutomationManager_sharedManager__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v1;
}

- (SUSUITestAutomationManager)init
{
  SEL v5 = a2;
  int v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUITestAutomationManager;
  int v6 = [(SUSUITestAutomationManager *)&v4 init];
  objc_storeStrong((id *)&v6, v6);
  if (v6)
  {
    objc_storeStrong((id *)&v6->_currentSession, 0);
    [(SUSUITestAutomationManager *)v6 startObserving];
  }
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)initialize
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v8[2] = self;
  v8[1] = (id)a2;
  v8[0] = _SUSUILoggingFacility();
  os_log_type_t v7 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_DEFAULT))
  {
    log = v8[0];
    os_log_type_t type = v7;
    v2 = (objc_class *)objc_opt_class();
    SEL v5 = NSStringFromClass(v2);
    int v6 = v5;
    __os_log_helper_16_2_2_8_32_8_64((uint64_t)v9, (uint64_t)"-[SUSUITestAutomationManager initialize]", (uint64_t)v6);
    _os_log_impl(&dword_228401000, log, type, "%s: Initializing %@", v9, 0x16u);

    objc_storeStrong((id *)&v6, 0);
  }
  objc_storeStrong(v8, 0);
}

- (void)dealloc
{
  objc_super v4 = self;
  SEL v3 = a2;
  if (self->_observing) {
    [(SUSUITestAutomationManager *)v4 stopObserving];
  }
  v2.receiver = v4;
  v2.super_class = (Class)SUSUITestAutomationManager;
  [(SUSUITestAutomationManager *)&v2 dealloc];
}

- (id)description
{
  int v6 = NSString;
  objc_super v2 = (objc_class *)objc_opt_class();
  SEL v3 = NSStringFromClass(v2);
  os_log_type_t v7 = v3;
  objc_super v4 = @"YES";
  if (!self->_currentSession) {
    objc_super v4 = @"NO";
  }
  id v8 = (id)[v6 stringWithFormat:@"<%@: %p, automationEnabled: %@>", v3, self, v4];

  return v8;
}

- (void)startObserving
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v11 = self;
  location[3] = (id)a2;
  if (self->_observing) {
    [(SUSUITestAutomationManager *)v11 stopObserving];
  }
  uint64_t obj = v11;
  objc_sync_enter(obj);
  v11->_observing = 1;
  if ((os_variant_has_internal_content() & 1) != 0 && SoftwareUpdateSettingsMockingKitLibraryCore_0())
  {
    id v6 = objc_alloc(MEMORY[0x263EFFA40]);
    id v4 = (id)[getSUSUIUserDefaultsKeysClass_0() SoftwareUpdateSettingsSuiteName];
    id v5 = (id)objc_msgSend(v6, "initWithSuiteName:");
    id v3 = (id)[getSUSUIUserDefaultsKeysClass_0() UIUnitTestingCurrentSession];
    objc_msgSend(v5, "addObserver:forKeyPath:options:context:", v11);

    location[0] = _SUSUILoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      if ([(SUSUITestAutomationManager *)v11 enabled]) {
        objc_super v2 = @"YES";
      }
      else {
        objc_super v2 = @"NO";
      }
      __os_log_helper_16_2_2_8_32_8_64((uint64_t)v13, (uint64_t)"-[SUSUITestAutomationManager startObserving]", (uint64_t)v2);
      _os_log_impl(&dword_228401000, (os_log_t)location[0], v9, "%s: Start to observe for Unit Testing requests.\nNSUserDefaults Automation enabled? %@", v13, 0x16u);
    }
    objc_storeStrong(location, 0);
  }
  else
  {
    id v8 = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)v8, OS_LOG_TYPE_ERROR))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v12, (uint64_t)"-[SUSUITestAutomationManager startObserving]");
      _os_log_error_impl(&dword_228401000, (os_log_t)v8, OS_LOG_TYPE_ERROR, "%s: SUSUITestAutomationManager exists in Production. Auto-disables.", v12, 0xCu);
    }
    objc_storeStrong(&v8, 0);
  }
  objc_sync_exit(obj);
}

- (void)stopObserving
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  os_log_type_t v9 = self;
  SEL v8 = a2;
  id v5 = self;
  objc_sync_enter(v5);
  if (v9->_observing)
  {
    id location = _SUSUILoggingFacility();
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v10, (uint64_t)"-[SUSUITestAutomationManager stopObserving]");
      _os_log_impl(&dword_228401000, (os_log_t)location, OS_LOG_TYPE_DEFAULT, "%s: Stops observing for Unit Testing requests.", v10, 0xCu);
    }
    objc_storeStrong(&location, 0);
    v9->_observing = 0;
    if ((os_variant_has_internal_content() & 1) != 0 && SoftwareUpdateSettingsMockingKitLibraryCore_0())
    {
      id v3 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
      id v4 = v9;
      id v2 = (id)[getSUSUIUserDefaultsKeysClass_0() UIUnitTestingCurrentSession];
      objc_msgSend(v3, "removeObserver:forKeyPath:", v4);
    }
    int v7 = 0;
  }
  else
  {
    int v7 = 1;
  }
  objc_sync_exit(v5);
}

- (BOOL)enabled
{
  BOOL v3 = 0;
  if (self->_currentSession) {
    return SoftwareUpdateSettingsMockingKitLibraryCore_0() != 0;
  }
  return v3;
}

- (void)addResponderDelegate:(id)a3 forServiceType:(int64_t)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  v55 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v53 = a4;
  id v33 = +[SUSUITestAutomationManager sharedManager];
  char v34 = [v33 enabled];

  if (v34)
  {
    v31 = [(SUSUITestAutomationManager *)v55 currentSession];
    id v51 = [(SUSUIUserDefaultsBasedTestSession *)v31 strategyForServiceType:v53];

    if (v51)
    {
      v27 = [(SUSUITestAutomationManager *)v55 currentSession];
      Class v47 = [(SUSUIUserDefaultsBasedTestSession *)v27 strategyClassForServiceType:v53];

      if (v47)
      {
        if ((objc_opt_respondsToSelector() & 1) == 0
          || (id v21 = location[0],
              id v22 = (id)-[objc_class responderDelegateProtocol](v47, "responderDelegateProtocol"), v23 = objc_msgSend(v21, "conformsToProtocol:"), v22, (v23 & 1) != 0))
        {
          os_log_t oslog = (os_log_t)_SUSUIInternalLoggingFacility();
          os_log_type_t v37 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
          {
            int v7 = oslog;
            os_log_type_t v8 = v37;
            id v12 = +[SUSUITestAutomationManager sharedManager];
            id v11 = (id)[v12 currentSession];
            id v10 = (id)[v11 correlationId];
            id v5 = v10;
            id v36 = v5;
            id v6 = location[0];
            os_log_type_t v9 = NSStringFromClass(v47);
            v35 = v9;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v56, (uint64_t)v5, (uint64_t)v6, (uint64_t)v35);
            _os_log_impl(&dword_228401000, v7, v8, "[XCUI correlationId: %@] Adding a XCUI responder delegate '%@' as a listener to strategy: %@", v56, 0x20u);

            objc_storeStrong((id *)&v35, 0);
            objc_storeStrong(&v36, 0);
          }
          objc_storeStrong((id *)&oslog, 0);
          [v51 addResponderDelegate:location[0]];
          int v52 = 0;
        }
        else
        {
          id v43 = _SUSUILoggingFacility();
          char v42 = 16;
          if (os_log_type_enabled((os_log_t)v43, OS_LOG_TYPE_ERROR))
          {
            v15 = v43;
            os_log_type_t v16 = v42;
            id v4 = (objc_class *)objc_opt_class();
            v20 = NSStringFromClass(v4);
            v13 = v20;
            v41 = v13;
            v19 = NSStringFromClass(v47);
            uint64_t v14 = v19;
            v40 = v14;
            v18 = (Protocol *)(id)[(objc_class *)v47 responderDelegateProtocol];
            v17 = NSStringFromProtocol(v18);
            v39 = v17;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v57, (uint64_t)v13, (uint64_t)v14, (uint64_t)v39);
            _os_log_error_impl(&dword_228401000, v15, v16, "Could not register a new responder, of type '%@', for the strategy class '%@'. The responder class does not implement the required protocol '%@.", v57, 0x20u);

            objc_storeStrong((id *)&v39, 0);
            objc_storeStrong((id *)&v40, 0);
            objc_storeStrong((id *)&v41, 0);
          }
          objc_storeStrong(&v43, 0);
          int v52 = 1;
        }
      }
      else
      {
        id v46 = _SUSUILoggingFacility();
        char v45 = 16;
        if (os_log_type_enabled((os_log_t)v46, OS_LOG_TYPE_ERROR))
        {
          v24 = v46;
          os_log_type_t v25 = v45;
          id v26 = (id)[getSUSMKMockedServiceTypeUtilityClass_0() descriptionForType:v53];
          id v44 = v26;
          __os_log_helper_16_2_1_8_64((uint64_t)v58, (uint64_t)v44);
          _os_log_error_impl(&dword_228401000, v24, v25, "Could not find any registered strategy class for service type: %@", v58, 0xCu);

          objc_storeStrong(&v44, 0);
        }
        objc_storeStrong(&v46, 0);
        int v52 = 1;
      }
    }
    else
    {
      id v50 = _SUSUILoggingFacility();
      os_log_type_t v49 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
      {
        log = v50;
        os_log_type_t type = v49;
        id v30 = (id)[getSUSMKMockedServiceTypeUtilityClass_0() descriptionForType:v53];
        id v48 = v30;
        __os_log_helper_16_2_1_8_64((uint64_t)v59, (uint64_t)v48);
        _os_log_impl(&dword_228401000, log, type, "The service type '%@' was not included in the test plan and thus no strategy was assigned.", v59, 0xCu);

        objc_storeStrong(&v48, 0);
      }
      objc_storeStrong(&v50, 0);
      int v52 = 1;
    }
    objc_storeStrong(&v51, 0);
  }
  else
  {
    int v52 = 1;
  }
  objc_storeStrong(location, 0);
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  os_log_type_t v16 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v14 = 0;
  objc_storeStrong(&v14, a4);
  id v13 = 0;
  objc_storeStrong(&v13, a5);
  NSLog(&cfstr_SChangedProper.isa, "-[SUSUITestAutomationManager observeValueForKeyPath:ofObject:change:context:]", v14, location[0], v13);
  id v10 = location[0];
  id v11 = (id)[getSUSUIUserDefaultsKeysClass_0() UIUnitTestingCurrentSession];
  char v12 = objc_msgSend(v10, "isEqualToString:");

  if (v12)
  {
    id v6 = v16;
    id v7 = (id)[v13 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    -[SUSUITestAutomationManager resolveStoredXCUISession:](v6, "resolveStoredXCUISession:");
  }
  objc_storeStrong(&v13, 0);
  objc_storeStrong(&v14, 0);
  objc_storeStrong(location, 0);
}

- (void)resolveStoredXCUISession:(id)a3
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v36 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v33 = 0;
  char v18 = 1;
  if (location[0])
  {
    id v17 = location[0];
    id v34 = (id)[MEMORY[0x263EFF9D0] null];
    char v33 = 1;
    char v18 = objc_msgSend(v17, "isEqual:");
  }
  if (v33) {

  }
  if ((v18 & 1) == 0)
  {
    id v31 = 0;
    v15 = (void *)MEMORY[0x263F08928];
    getSUSMKUserDefaultsCodedTestCaseSessionClass();
    uint64_t v3 = objc_opt_class();
    id obj = v31;
    id v16 = (id)[v15 unarchivedObjectOfClass:v3 fromData:location[0] error:&obj];
    objc_storeStrong(&v31, obj);
    id v30 = v16;
    if (!v16 || v31)
    {
      os_log_t oslog = (os_log_t)_SUSUILoggingFacility();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        __os_log_helper_16_2_1_8_64((uint64_t)v41, (uint64_t)v31);
        _os_log_impl(&dword_228401000, oslog, type, "Could not decode the saved UT session into an SUSMKUserDefaultsCodedTestCaseSession object. Error: %@", v41, 0xCu);
      }
      objc_storeStrong((id *)&oslog, 0);
      [(SUSUITestAutomationManager *)v36 setupAutomaticTestingForStoredSession:0];
      int v32 = 1;
LABEL_32:
      objc_storeStrong(&v30, 0);
      objc_storeStrong(&v31, 0);
      goto LABEL_33;
    }
    id v13 = (id)[MEMORY[0x263F78500] sharedDefaults];
    char v14 = [v13 shouldKeepPreviousMockingKitSession];

    if ((v14 & 1) == 0)
    {
      if ((objc_msgSend(MEMORY[0x263F08AB0], "isRunning:", objc_msgSend(v30, "processId")) & 1) == 0)
      {
        id v11 = (id)[MEMORY[0x263F78500] sharedDefaults];
        char v12 = [v11 shouldSkipMockingKitPIDValidation];

        if ((v12 & 1) == 0)
        {
          os_log_t v26 = (os_log_t)_SUSUILoggingFacility();
          os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            __os_log_helper_16_2_2_8_32_4_0((uint64_t)v40, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", [v30 processId]);
            _os_log_impl(&dword_228401000, v26, v25, "%s: Found a UTs session stored in NSUserDefaults. However, the process '%d' isn't running anymore. Killing the session.", v40, 0x12u);
          }
          objc_storeStrong((id *)&v26, 0);
          [(SUSUITestAutomationManager *)v36 setupAutomaticTestingForStoredSession:0];
          int v32 = 1;
          goto LABEL_32;
        }
        os_log_t v24 = (os_log_t)_SUSUILoggingFacility();
        os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          __os_log_helper_16_2_2_8_32_4_0((uint64_t)v39, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", [v30 processId]);
          _os_log_impl(&dword_228401000, v24, v23, "%s: Found a UTs session stored in NSUserDefaults. However, the process '%d' isn't running anymore. As SUSkipMockingKitPIDValidation is on - we will continue to use the test plan with this, incorrect, PID.", v39, 0x12u);
        }
        objc_storeStrong((id *)&v24, 0);
      }
      uint64_t v22 = objc_msgSend(MEMORY[0x263F08AB0], "processStartTime:", objc_msgSend(v30, "processId"));
      if (v22 != [v30 processStartTime])
      {
        id v9 = (id)[MEMORY[0x263F78500] sharedDefaults];
        char v10 = [v9 shouldSkipMockingKitPIDValidation];

        if ((v10 & 1) == 0)
        {
          os_log_t v21 = (os_log_t)_SUSUILoggingFacility();
          os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v8 = [v30 processId];
            __os_log_helper_16_2_4_8_32_8_0_8_0_8_0((uint64_t)v38, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", v8, [v30 processStartTime], v22);
            _os_log_impl(&dword_228401000, v21, v20, "%s: Found a UTs session stored in NSUserDefaults. However, the session stored process start time for pid %ld, %ld, different than the start time of the current process with this pid, %ld. Killing the session.", v38, 0x2Au);
          }
          objc_storeStrong((id *)&v21, 0);
          [(SUSUITestAutomationManager *)v36 setupAutomaticTestingForStoredSession:0];
          int v32 = 1;
          goto LABEL_32;
        }
        os_log_t v19 = (os_log_t)_SUSUILoggingFacility();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v7 = [v30 processId];
          __os_log_helper_16_2_4_8_32_8_0_8_0_8_0((uint64_t)v37, (uint64_t)"-[SUSUITestAutomationManager resolveStoredXCUISession:]", v7, [v30 processStartTime], v22);
          _os_log_impl(&dword_228401000, v19, OS_LOG_TYPE_DEFAULT, "%s: Found a UTs session stored in NSUserDefaults. However, the session stored process start time for pid %ld, %ld, different than the start time of the current process with this pid, %ld. As SUSkipMockingKitPIDValidation is on - we will continue to use the test plan with this, corrupted, PID.", v37, 0x2Au);
        }
        objc_storeStrong((id *)&v19, 0);
      }
    }
    id v5 = (id)[MEMORY[0x263F78500] sharedDefaults];
    char v6 = [v5 shouldSkipMockingKitPIDValidation];

    if (v6)
    {
      id v4 = (id)[MEMORY[0x263F78500] sharedDefaults];
      [v4 shouldSkipMockingKitPIDValidation:0];
    }
    [(SUSUITestAutomationManager *)v36 setupAutomaticTestingForStoredSession:v30];
    int v32 = 0;
    goto LABEL_32;
  }
  [(SUSUITestAutomationManager *)v36 setupAutomaticTestingForStoredSession:0];
  int v32 = 1;
LABEL_33:
  objc_storeStrong(location, 0);
}

- (void)setupAutomaticTestingForStoredSession:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v28 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  char v18 = +[SUSUIServiceManager sharedInstance];
  [(SUSUIServiceManager *)v18 reset];

  if (location[0])
  {
    id v26 = _SUSUILoggingFacility();
    os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v26, OS_LOG_TYPE_DEFAULT))
    {
      __os_log_helper_16_2_1_8_32((uint64_t)v31, (uint64_t)"-[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:]");
      _os_log_impl(&dword_228401000, (os_log_t)v26, v25, "%s: In unit testing mode, registering mocks third-party services", v31, 0xCu);
    }
    objc_storeStrong(&v26, 0);
    id v17 = +[SUSUIServiceManager sharedInstance];
    [(SUSUIServiceManager *)v17 registerMockClasses];

    id v24 = _SUSUILoggingFacility();
    os_log_type_t v23 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v24, OS_LOG_TYPE_DEFAULT))
    {
      char v14 = v24;
      os_log_type_t v15 = v23;
      id v13 = (id)objc_opt_class();
      id v22 = v13;
      id v16 = (id)[location[0] correlationId];
      id v21 = v16;
      __os_log_helper_16_2_3_8_32_8_64_8_64((uint64_t)v30, (uint64_t)"-[SUSUITestAutomationManager setupAutomaticTestingForStoredSession:]", (uint64_t)v13, (uint64_t)v21);
      _os_log_impl(&dword_228401000, v14, v15, "%s: XCUI Automation is enabled. Setting up the XCUI communication client using: %@ for test session: %@", v30, 0x20u);

      objc_storeStrong(&v21, 0);
      objc_storeStrong(&v22, 0);
    }
    objc_storeStrong(&v24, 0);
    uint64_t v3 = [SUSUIUserDefaultsBasedTestSession alloc];
    uint64_t v4 = [(SUSUIUserDefaultsBasedTestSession *)v3 initWithStoredSession:location[0]];
    currentSession = v28->_currentSession;
    v28->_currentSession = (SUSUIUserDefaultsBasedTestSession *)v4;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    id v11 = (id)[getSUSUIUserDefaultsKeysClass_0() UIUnitTestingKeys];
    uint64_t v12 = [v11 countByEnumeratingWithState:__b objects:v29 count:16];
    if (v12)
    {
      uint64_t v8 = *(void *)__b[2];
      uint64_t v9 = 0;
      unint64_t v10 = v12;
      while (1)
      {
        uint64_t v7 = v9;
        if (*(void *)__b[2] != v8) {
          objc_enumerationMutation(v11);
        }
        uint64_t v20 = *(void *)(__b[1] + 8 * v9);
        id v6 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
        [v6 removeObjectForKey:v20];

        ++v9;
        if (v7 + 1 >= v10)
        {
          uint64_t v9 = 0;
          unint64_t v10 = [v11 countByEnumeratingWithState:__b objects:v29 count:16];
          if (!v10) {
            break;
          }
        }
      }
    }
  }
  objc_storeStrong(location, 0);
}

- (SUSUIUserDefaultsBasedTestSession)currentSession
{
  return self->_currentSession;
}

- (void).cxx_destruct
{
}

@end