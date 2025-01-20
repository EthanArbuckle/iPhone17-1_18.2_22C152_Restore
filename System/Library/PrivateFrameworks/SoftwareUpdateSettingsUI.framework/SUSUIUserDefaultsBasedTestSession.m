@interface SUSUIUserDefaultsBasedTestSession
+ (id)current;
- (BOOL)beginTestAndReturnError:(id *)a3;
- (BOOL)endTestWithResult:(int64_t)a3 error:(id *)a4;
- (Class)strategyClassForServiceType:(int64_t)a3;
- (NSString)correlationId;
- (SUSUIUserDefaultsBasedTestSession)init;
- (SUSUIUserDefaultsBasedTestSession)initWithStoredSession:(id)a3;
- (id)strategyForServiceType:(int64_t)a3;
- (int64_t)currentExecutionResult;
- (int64_t)currentPhase;
- (void)dealloc;
- (void)handleChangedPhase:(int64_t)a3;
- (void)handlePhaseConfigurationSealed;
- (void)handlePhaseFinished;
- (void)handlePhaseRunning;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
@end

@implementation SUSUIUserDefaultsBasedTestSession

- (SUSUIUserDefaultsBasedTestSession)init
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v9 = self;
  v8[1] = (id)a2;
  v8[0] = _SUSUIInternalLoggingFacility();
  char v7 = 16;
  if (os_log_type_enabled((os_log_t)v8[0], OS_LOG_TYPE_ERROR))
  {
    log = v8[0];
    os_log_type_t type = v7;
    id v5 = (id)[v9 correlationId];
    id v6 = v5;
    __os_log_helper_16_2_1_8_64((uint64_t)v10, (uint64_t)v6);
    _os_log_error_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] [SUSUIUserDefaultsBasedTestSession init] shouldn't be invoked directly.", v10, 0xCu);

    objc_storeStrong(&v6, 0);
  }
  objc_storeStrong(v8, 0);
  objc_storeStrong(&v9, 0);
  return 0;
}

- (SUSUIUserDefaultsBasedTestSession)initWithStoredSession:(id)a3
{
  v20 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v20;
  v20 = 0;
  v18.receiver = v3;
  v18.super_class = (Class)SUSUIUserDefaultsBasedTestSession;
  v17 = [(SUSUIUserDefaultsBasedTestSession *)&v18 init];
  v20 = v17;
  objc_storeStrong((id *)&v20, v17);
  if (v17)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    services = v20->_services;
    v20->_services = v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    servicesClasses = v20->_servicesClasses;
    v20->_servicesClasses = v6;

    objc_storeStrong((id *)&v20->_session, location[0]);
    if ([(SUSUIUserDefaultsBasedTestSession *)v20 currentPhase] > 2)
    {
      id v16 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
      id v15 = (id)[getSUSUIUserDefaultsKeysClass() UIUnitTestingCurrentPhase];
      objc_msgSend(v16, "setObject:forKey:", &unk_26DCE4AE8);
    }
    id v10 = objc_alloc(MEMORY[0x263EFFA40]);
    id v14 = (id)[getSUSUIUserDefaultsKeysClass() SoftwareUpdateSettingsSuiteName];
    id v13 = (id)objc_msgSend(v10, "initWithSuiteName:");
    uint64_t v11 = v20;
    id v12 = (id)[getSUSUIUserDefaultsKeysClass() UIUnitTestingCurrentPhase];
    objc_msgSend(v13, "addObserver:forKeyPath:options:context:", v11);
  }
  id v9 = v20;
  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v20, 0);
  return v9;
}

- (void)dealloc
{
  id v6 = self;
  SEL v5 = a2;
  id v3 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
  id v2 = (id)[getSUSUIUserDefaultsKeysClass() UIUnitTestingCurrentPhase];
  objc_msgSend(v3, "removeObserver:forKeyPath:", v6);

  v4.receiver = v6;
  v4.super_class = (Class)SUSUIUserDefaultsBasedTestSession;
  [(SUSUIUserDefaultsBasedTestSession *)&v4 dealloc];
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v30 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v28 = 0;
  objc_storeStrong(&v28, a4);
  id v27 = 0;
  objc_storeStrong(&v27, a5);
  v26 = a6;
  id v15 = location[0];
  id v16 = (id)[getSUSUIUserDefaultsKeysClass() UIUnitTestingCurrentPhase];
  char v17 = objc_msgSend(v15, "isEqualToString:");

  if (v17)
  {
    id v25 = (id)[v27 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
    char v23 = 0;
    char v11 = 1;
    if (v25)
    {
      id v24 = (id)[MEMORY[0x263EFF9D0] null];
      char v23 = 1;
      char v11 = objc_msgSend(v25, "isEqual:");
    }
    if (v23) {

    }
    if (v11)
    {
      id v22 = _SUSUIInternalLoggingFacility();
      char v21 = 16;
      if (os_log_type_enabled((os_log_t)v22, OS_LOG_TYPE_ERROR))
      {
        log = v22;
        os_log_type_t type = v21;
        id v10 = [(SUSUIUserDefaultsBasedTestSession *)v30 correlationId];
        id v6 = v10;
        v20 = v6;
        id v9 = (id)[v27 objectForKeyedSubscript:*MEMORY[0x263F081B8]];
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v31, (uint64_t)v6, (uint64_t)v9);
        _os_log_error_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] Failed to decode the changed phase into an NSNumber. Got: %@", v31, 0x16u);

        objc_storeStrong((id *)&v20, 0);
      }
      objc_storeStrong(&v22, 0);
      int v19 = 1;
    }
    else
    {
      -[SUSUIUserDefaultsBasedTestSession handleChangedPhase:](v30, "handleChangedPhase:", [v25 integerValue]);
      int v19 = 1;
    }
    objc_storeStrong(&v25, 0);
  }
  else
  {
    v18.receiver = v30;
    v18.super_class = (Class)SUSUIUserDefaultsBasedTestSession;
    [(SUSUIUserDefaultsBasedTestSession *)&v18 observeValueForKeyPath:location[0] ofObject:v28 change:v27 context:v26];
    int v19 = 0;
  }
  objc_storeStrong(&v27, 0);
  objc_storeStrong(&v28, 0);
  objc_storeStrong(location, 0);
}

- (id)strategyForServiceType:(int64_t)a3
{
  services = self->_services;
  id v5 = (id)[NSNumber numberWithInt:a3];
  id v6 = (id)-[NSMutableDictionary objectForKey:](services, "objectForKey:");

  return v6;
}

- (Class)strategyClassForServiceType:(int64_t)a3
{
  servicesClasses = self->_servicesClasses;
  id v5 = (id)[NSNumber numberWithInt:a3];
  id v6 = (id)-[NSMutableDictionary objectForKey:](servicesClasses, "objectForKey:");

  return (Class)v6;
}

- (int64_t)currentExecutionResult
{
  id v3 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
  int64_t v4 = [v3 unitTestingCurrentTestResult];

  return v4;
}

- (NSString)correlationId
{
  char v4 = 0;
  if (self->_session)
  {
    id v5 = (id)[(SUSMKUserDefaultsCodedTestCaseSession *)self->_session correlationId];
    char v4 = 1;
    id v2 = (__CFString *)v5;
  }
  else
  {
    id v2 = @"N/A";
  }
  id v6 = v2;
  if (v4) {

  }
  return (NSString *)v6;
}

- (int64_t)currentPhase
{
  id v3 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
  int64_t v4 = [v3 unitTestingCurrentPhase];

  return v4;
}

- (BOOL)beginTestAndReturnError:(id *)a3
{
  return 0;
}

+ (id)current
{
  id v3 = +[SUSUITestAutomationManager sharedManager];
  id v4 = (id)[v3 currentSession];

  return v4;
}

- (BOOL)endTestWithResult:(int64_t)a3 error:(id *)a4
{
  return 1;
}

- (void)handleChangedPhase:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v16 = self;
  SEL v15 = a2;
  int64_t v14 = a3;
  id v13 = _SUSUIInternalLoggingFacility();
  os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v13, OS_LOG_TYPE_DEFAULT))
  {
    log = v13;
    os_log_type_t type = v12;
    id v9 = [(SUSUIUserDefaultsBasedTestSession *)v16 correlationId];
    id v5 = v9;
    char v11 = v5;
    id v8 = (id)[getSUSMKTestCaseSessionPhaseUtilityClass() descriptionForPhase:v14];
    id v10 = v8;
    __os_log_helper_16_2_2_8_64_8_64((uint64_t)v17, (uint64_t)v5, (uint64_t)v10);
    _os_log_impl(&dword_228401000, log, type, "[XCUI correlationId: %@] Changed XCUI testing session phase into: %@", v17, 0x16u);

    objc_storeStrong(&v10, 0);
    objc_storeStrong((id *)&v11, 0);
  }
  objc_storeStrong(&v13, 0);
  switch(v14)
  {
    case 2:
      [(SUSUIUserDefaultsBasedTestSession *)v16 handlePhaseConfigurationSealed];
      [(SUSUIUserDefaultsBasedTestSession *)v16 handlePhaseRunning];
      break;
    case 3:
      id v3 = (id)[MEMORY[0x263F78500] sharedDefaults];
      char v4 = [v3 shouldKeepPreviousMockingKitSession];

      if (v4) {
        [(SUSUIUserDefaultsBasedTestSession *)v16 handlePhaseConfigurationSealed];
      }
      [(SUSUIUserDefaultsBasedTestSession *)v16 handlePhaseRunning];
      break;
    case 4:
      [(SUSUIUserDefaultsBasedTestSession *)v16 handlePhaseFinished];
      break;
  }
}

- (void)handlePhaseConfigurationSealed
{
  uint64_t v114 = *MEMORY[0x263EF8340];
  v106 = self;
  v105[1] = (id)a2;
  v105[0] = (id)[getSUSMKMockedServiceTypeUtilityClass() allOptionClasses];
  id v68 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
  id v104 = (id)[v68 unitTestingRegisteredServicesDictionary];

  memset(__b, 0, sizeof(__b));
  id obj = v104;
  uint64_t v70 = [obj countByEnumeratingWithState:__b objects:v113 count:16];
  if (v70)
  {
    uint64_t v65 = *(void *)__b[2];
    uint64_t v66 = 0;
    unint64_t v67 = v70;
    while (1)
    {
      uint64_t v64 = v66;
      if (*(void *)__b[2] != v65) {
        objc_enumerationMutation(obj);
      }
      id v103 = *(id *)(__b[1] + 8 * v66);
      id v101 = 0;
      id v2 = objc_alloc(MEMORY[0x263EFF9C0]);
      id v100 = (id)[v2 initWithSet:v105[0]];
      id v59 = v100;
      getSUSMKUserDefaultsCodedMockedStrategyClass();
      [v59 addObject:objc_opt_class()];
      v61 = (void *)MEMORY[0x263F08928];
      id v60 = v100;
      id v63 = (id)[v104 objectForKeyedSubscript:v103];
      id v98 = v101;
      id v62 = (id)objc_msgSend(v61, "unarchivedObjectOfClasses:fromData:error:", v60);
      objc_storeStrong(&v101, v98);
      id v99 = v62;

      if (v99 && !v101)
      {
        id SUSMKMockedServiceTypeUtilityClass = getSUSMKMockedServiceTypeUtilityClass();
        id v52 = (id)[v99 mockedStrategyClassName];
        char v53 = objc_msgSend(SUSMKMockedServiceTypeUtilityClass, "acceptibleStrategyClassName:forType:", v52, objc_msgSend(v99, "mockedService"));

        if (v53)
        {
          Class v87 = 0;
          v43 = (NSString *)(id)[v99 mockedStrategyClassName];
          Class v87 = NSClassFromString(v43);

          if (!v87)
          {
            os_log_t v86 = (os_log_t)_SUSUIInternalLoggingFacility();
            os_log_type_t v85 = OS_LOG_TYPE_ERROR;
            if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
            {
              v38 = v86;
              os_log_type_t v39 = v85;
              v42 = [(SUSUIUserDefaultsBasedTestSession *)v106 correlationId];
              v36 = v42;
              v84 = v36;
              id v41 = (id)[v99 mockedStrategyClassName];
              id v37 = v41;
              id v83 = v37;
              id v40 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v103, "integerValue"));
              id v82 = v40;
              __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v110, (uint64_t)v36, (uint64_t)v37, (uint64_t)v82);
              _os_log_error_impl(&dword_228401000, v38, v39, "[XCUI correlationId: %@] Could not fetch an NSClass instance from the class name string: '%@' for type: '%@'", v110, 0x20u);

              objc_storeStrong(&v82, 0);
              objc_storeStrong(&v83, 0);
              objc_storeStrong((id *)&v84, 0);
            }
            objc_storeStrong((id *)&v86, 0);
          }
          id v28 = [v87 alloc];
          id v27 = v106;
          id v29 = (id)[v99 mockedStrategyOptions];
          id v81 = (id)objc_msgSend(v28, "initForSession:usingOptions:", v27);

          id v30 = v81;
          services = v106->_services;
          id v32 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v99, "mockedService"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](services, "setObject:forKeyedSubscript:", v30);

          Class v33 = v87;
          servicesClasses = v106->_servicesClasses;
          id v35 = (id)objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v99, "mockedService"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](servicesClasses, "setObject:forKeyedSubscript:", v33);

          os_log_t v80 = (os_log_t)_SUSUIInternalLoggingFacility();
          os_log_type_t v79 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
          {
            char v23 = v80;
            os_log_type_t v24 = v79;
            v26 = [(SUSUIUserDefaultsBasedTestSession *)v106 correlationId];
            char v21 = v26;
            v78 = v21;
            Class v22 = v87;
            id v25 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v99, "mockedService"));
            id v77 = v25;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v109, (uint64_t)v21, (uint64_t)v22, (uint64_t)v77);
            _os_log_impl(&dword_228401000, v23, v24, "[XCUI correlationId: %@] Creating mocked service class: %@ for service '%@'", v109, 0x20u);

            objc_storeStrong(&v77, 0);
            objc_storeStrong((id *)&v78, 0);
          }
          objc_storeStrong((id *)&v80, 0);
          objc_storeStrong(&v81, 0);
          int v93 = 0;
        }
        else
        {
          os_log_t v92 = (os_log_t)_SUSUIInternalLoggingFacility();
          os_log_type_t v91 = OS_LOG_TYPE_ERROR;
          if (os_log_type_enabled(v92, OS_LOG_TYPE_ERROR))
          {
            v46 = v92;
            os_log_type_t v47 = v91;
            v50 = [(SUSUIUserDefaultsBasedTestSession *)v106 correlationId];
            v44 = v50;
            v90 = v44;
            id v49 = (id)[v99 mockedStrategyClassName];
            id v45 = v49;
            id v89 = v45;
            id v48 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v99, "mockedService"));
            id v88 = v48;
            __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v111, (uint64_t)v44, (uint64_t)v45, (uint64_t)v88);
            _os_log_error_impl(&dword_228401000, v46, v47, "[XCUI correlationId: %@] The supplied strategy class name '%@' for type '%@' is not acceptible. Each strategy must be manually registered in the Service Type class.", v111, 0x20u);

            objc_storeStrong(&v88, 0);
            objc_storeStrong(&v89, 0);
            objc_storeStrong((id *)&v90, 0);
          }
          objc_storeStrong((id *)&v92, 0);
          int v93 = 3;
        }
      }
      else
      {
        os_log_t oslog = (os_log_t)_SUSUIInternalLoggingFacility();
        os_log_type_t type = OS_LOG_TYPE_ERROR;
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
        {
          log = oslog;
          os_log_type_t v56 = type;
          v58 = [(SUSUIUserDefaultsBasedTestSession *)v106 correlationId];
          v54 = v58;
          v95 = v54;
          id v57 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v103, "integerValue"));
          id v94 = v57;
          __os_log_helper_16_2_3_8_64_8_64_8_64((uint64_t)v112, (uint64_t)v54, (uint64_t)v94, (uint64_t)v101);
          _os_log_error_impl(&dword_228401000, log, v56, "[XCUI correlationId: %@] Could not instantiate SUSMKUserDefaultsCodedMockedStrategy for type: '%@'.\nError: %@", v112, 0x20u);

          objc_storeStrong(&v94, 0);
          objc_storeStrong((id *)&v95, 0);
        }
        objc_storeStrong((id *)&oslog, 0);
        int v93 = 3;
      }
      objc_storeStrong(&v99, 0);
      objc_storeStrong(&v100, 0);
      objc_storeStrong(&v101, 0);
      ++v66;
      if (v64 + 1 >= v67)
      {
        uint64_t v66 = 0;
        unint64_t v67 = [obj countByEnumeratingWithState:__b objects:v113 count:16];
        if (!v67) {
          break;
        }
      }
    }
  }

  memset(v75, 0, sizeof(v75));
  id v19 = (id)[getSUSMKMockedServiceTypeUtilityClass() allCases];
  uint64_t v20 = [v19 countByEnumeratingWithState:v75 objects:v108 count:16];
  if (v20)
  {
    uint64_t v16 = *(void *)v75[2];
    uint64_t v17 = 0;
    unint64_t v18 = v20;
    while (1)
    {
      uint64_t v15 = v17;
      if (*(void *)v75[2] != v16) {
        objc_enumerationMutation(v19);
      }
      id v76 = *(id *)(v75[1] + 8 * v17);
      id v3 = (id)[(NSMutableDictionary *)v106->_services objectForKeyedSubscript:v76];
      BOOL v14 = v3 != 0;

      if (v14)
      {
        os_log_t v74 = (os_log_t)_SUSUIInternalLoggingFacility();
        os_log_type_t v73 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
        {
          id v10 = v74;
          os_log_type_t v11 = v73;
          id v13 = [(SUSUIUserDefaultsBasedTestSession *)v106 correlationId];
          id v9 = v13;
          v72 = v9;
          id v12 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v76, "integerValue"));
          id v71 = v12;
          __os_log_helper_16_2_2_8_64_8_64((uint64_t)v107, (uint64_t)v9, (uint64_t)v71);
          _os_log_impl(&dword_228401000, v10, v11, "[XCUI correlationId: %@] Registering the default implementation for service type: %@", v107, 0x16u);

          objc_storeStrong(&v71, 0);
          objc_storeStrong((id *)&v72, 0);
        }
        objc_storeStrong((id *)&v74, 0);
        id v7 = getSUSMKMockedServiceTypeUtilityClass();
        uint64_t v4 = [v76 integerValue];
        id v8 = (id)[v7 instantiateDefaultStrategyHandlerForType:v4 withSession:v106];
        -[NSMutableDictionary setObject:forKeyedSubscript:](v106->_services, "setObject:forKeyedSubscript:");

        uint64_t v5 = objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "defaultStrategyClassHandlerForType:", objc_msgSend(v76, "integerValue"));
        [(NSMutableDictionary *)v106->_servicesClasses setObject:v5 forKeyedSubscript:v76];
      }
      ++v17;
      if (v15 + 1 >= v18)
      {
        uint64_t v17 = 0;
        unint64_t v18 = [v19 countByEnumeratingWithState:v75 objects:v108 count:16];
        if (!v18) {
          break;
        }
      }
    }
  }

  id v6 = (id)[MEMORY[0x263EFFA40] softwareUpdateShared];
  [v6 setUnitTestingCurrentPhase:3];

  objc_storeStrong(&v104, 0);
  objc_storeStrong(v105, 0);
}

- (void)handlePhaseRunning
{
  id v12 = self;
  v11[1] = (id)a2;
  id v4 = (id)[MEMORY[0x263F78500] sharedDefaults];
  char v5 = [v4 shouldKeepPreviousMockingKitSession];

  if ((v5 & 1) != 0 && ![(NSMutableDictionary *)v12->_services count]) {
    [(SUSUIUserDefaultsBasedTestSession *)v12 handlePhaseConfigurationSealed];
  }
  dispatch_time_t when = dispatch_time(0, 100000000);
  queue = MEMORY[0x263EF83A0];
  uint64_t v6 = MEMORY[0x263EF8330];
  int v7 = -1073741824;
  int v8 = 0;
  id v9 = __55__SUSUIUserDefaultsBasedTestSession_handlePhaseRunning__block_invoke;
  id v10 = &unk_26483BA90;
  v11[0] = v12;
  dispatch_after(when, queue, &v6);

  objc_storeStrong(v11, 0);
}

void __55__SUSUIUserDefaultsBasedTestSession_handlePhaseRunning__block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  uint64_t v21 = a1;
  uint64_t v20 = a1;
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
  if (v13)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v13;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(__b[1] + 8 * v9);
      os_log_t oslog = (os_log_t)_SUSUIInternalLoggingFacility();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v4 = type;
        id v6 = (id)[*(id *)(a1 + 32) correlationId];
        id v2 = v6;
        id v15 = v2;
        id v5 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v19, "integerValue"));
        id v14 = v5;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v22, (uint64_t)v2, (uint64_t)v14);
        _os_log_impl(&dword_228401000, log, v4, "[XCUI correlationId: %@] Sending the willBegin event to service type: %@", v22, 0x16u);

        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v1 = (id)[*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v19];
      [v1 willBegin];

      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v23 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }
}

- (void)handlePhaseFinished
{
  unint64_t v10 = self;
  v9[1] = (id)a2;
  dispatch_time_t when = dispatch_time(0, 100000000);
  queue = MEMORY[0x263EF83A0];
  uint64_t v4 = MEMORY[0x263EF8330];
  int v5 = -1073741824;
  int v6 = 0;
  uint64_t v7 = __56__SUSUIUserDefaultsBasedTestSession_handlePhaseFinished__block_invoke;
  uint64_t v8 = &unk_26483BA90;
  v9[0] = v10;
  dispatch_after(when, queue, &v4);

  objc_storeStrong(v9, 0);
}

void __56__SUSUIUserDefaultsBasedTestSession_handlePhaseFinished__block_invoke(uint64_t a1)
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  uint64_t v22 = a1;
  uint64_t v21 = a1;
  uint64_t v20 = 0;
  uint64_t v20 = [*(id *)(a1 + 32) currentExecutionResult];
  memset(__b, 0, sizeof(__b));
  id obj = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v13 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
  if (v13)
  {
    uint64_t v8 = *(void *)__b[2];
    uint64_t v9 = 0;
    unint64_t v10 = v13;
    while (1)
    {
      uint64_t v7 = v9;
      if (*(void *)__b[2] != v8) {
        objc_enumerationMutation(obj);
      }
      id v19 = *(id *)(__b[1] + 8 * v9);
      os_log_t oslog = (os_log_t)_SUSUIInternalLoggingFacility();
      os_log_type_t type = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        log = oslog;
        os_log_type_t v4 = type;
        id v6 = (id)[*(id *)(a1 + 32) correlationId];
        id v2 = v6;
        id v15 = v2;
        id v5 = (id)objc_msgSend(getSUSMKMockedServiceTypeUtilityClass(), "descriptionForType:", objc_msgSend(v19, "integerValue"));
        id v14 = v5;
        __os_log_helper_16_2_2_8_64_8_64((uint64_t)v23, (uint64_t)v2, (uint64_t)v14);
        _os_log_impl(&dword_228401000, log, v4, "[XCUI correlationId: %@] Sending the didEnd event to service type: %@", v23, 0x16u);

        objc_storeStrong(&v14, 0);
        objc_storeStrong(&v15, 0);
      }
      objc_storeStrong((id *)&oslog, 0);
      id v1 = (id)[*(id *)(*(void *)(a1 + 32) + 8) objectForKeyedSubscript:v19];
      [v1 didEndWithResult:v20];

      ++v9;
      if (v7 + 1 >= v10)
      {
        uint64_t v9 = 0;
        unint64_t v10 = [obj countByEnumeratingWithState:__b objects:v24 count:16];
        if (!v10) {
          break;
        }
      }
    }
  }
}

- (void).cxx_destruct
{
}

@end