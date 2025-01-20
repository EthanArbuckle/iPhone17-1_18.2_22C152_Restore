@interface RERelevanceEngineDiagnosticRegistration
- (id)_allProcesses;
- (id)_defaultRegistrationDirectory;
- (id)_init;
- (id)_processesFileURL;
- (void)_accessEngineDataForProcess:(id)a3 usingBlock:(id)a4;
- (void)_allProcesses;
- (void)checkinEngine:(id)a3;
- (void)enumerateAvailableEngines:(id)a3;
@end

@implementation RERelevanceEngineDiagnosticRegistration

- (id)_init
{
  v6.receiver = self;
  v6.super_class = (Class)RERelevanceEngineDiagnosticRegistration;
  v2 = [(RESingleton *)&v6 _init];
  if (v2)
  {
    if (_fetchedInternalBuildOnceToken_8 != -1) {
      dispatch_once(&_fetchedInternalBuildOnceToken_8, &__block_literal_global_68);
    }
    if (_isInternalDevice_8)
    {
      v3 = [MEMORY[0x263F08850] defaultManager];
      v4 = [v2 _defaultRegistrationDirectory];
      v2[8] = [v3 fileExistsAtPath:v4];
    }
    else
    {
      v2[8] = 0;
    }
  }
  return v2;
}

uint64_t __48__RERelevanceEngineDiagnosticRegistration__init__block_invoke()
{
  uint64_t result = _REGetIsInternalBuild();
  _isInternalDevice_8 = result;
  return result;
}

- (id)_defaultRegistrationDirectory
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __72__RERelevanceEngineDiagnosticRegistration__defaultRegistrationDirectory__block_invoke;
  block[3] = &unk_2644BC660;
  v4 = @"/private/var/mobile/Library/RelevanceEngine/Registration/";
  if (_defaultRegistrationDirectory_onceToken != -1) {
    dispatch_once(&_defaultRegistrationDirectory_onceToken, block);
  }

  return @"/private/var/mobile/Library/RelevanceEngine/Registration/";
}

void __72__RERelevanceEngineDiagnosticRegistration__defaultRegistrationDirectory__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = 0;
  [v2 createDirectoryAtPath:v3 withIntermediateDirectories:1 attributes:0 error:&v4];
}

- (id)_processesFileURL
{
  v2 = [(RERelevanceEngineDiagnosticRegistration *)self _defaultRegistrationDirectory];
  uint64_t v3 = [v2 stringByAppendingPathComponent:@"Processes.dat"];

  uint64_t v4 = [NSURL fileURLWithPath:v3];

  return v4;
}

- (id)_allProcesses
{
  if (self->_supportsRegistration)
  {
    v2 = (void *)MEMORY[0x263EFF8C0];
    uint64_t v3 = [(RERelevanceEngineDiagnosticRegistration *)self _processesFileURL];
    id v8 = 0;
    uint64_t v4 = [v2 arrayWithContentsOfURL:v3 error:&v8];
    id v5 = v8;

    if (!v4)
    {
      objc_super v6 = RELogForDomain(0);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
        [(RERelevanceEngineDiagnosticRegistration *)(uint64_t)v5 _allProcesses];
      }

      uint64_t v4 = (void *)MEMORY[0x263EFFA68];
    }
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x263EFFA68];
  }
  return v4;
}

- (void)_accessEngineDataForProcess:(id)a3 usingBlock:(id)a4
{
  uint64_t v60 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (!v7 || !self->_supportsRegistration) {
    goto LABEL_34;
  }
  v46 = (void (**)(void, void *))v7;
  v9 = [(RERelevanceEngineDiagnosticRegistration *)self _defaultRegistrationDirectory];
  uint64_t v10 = [v9 stringByAppendingString:v6];

  v45 = (void *)v10;
  uint64_t v11 = [NSURL fileURLWithPath:v10];
  v12 = (void *)MEMORY[0x263EFF9C0];
  v42 = self;
  v13 = [(RERelevanceEngineDiagnosticRegistration *)self _allProcesses];
  v14 = [v12 setWithArray:v13];

  uint64_t v48 = [v14 copy];
  id v58 = 0;
  v15 = [NSDictionary dictionaryWithContentsOfURL:v11 error:&v58];
  id v16 = v58;
  if (!v15)
  {
    v15 = [NSDictionary dictionary];
    v17 = RELogForDomain(0);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:].cold.4();
    }
  }
  v43 = v16;
  v44 = (void *)v11;
  id v47 = v6;
  v50 = REBuildVersion();
  v18 = [MEMORY[0x263EFF910] date];
  v19 = (void *)[v15 mutableCopy];
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v15;
  uint64_t v20 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v55 != v22) {
          objc_enumerationMutation(obj);
        }
        uint64_t v24 = *(void *)(*((void *)&v54 + 1) + 8 * i);
        v25 = [v19 objectForKeyedSubscript:v24];
        v26 = [v25 objectForKeyedSubscript:@"Version"];
        int v27 = [v26 isEqualToString:v50];

        if (!v27 || ([v18 timeIntervalSinceDate:v18], fabs(v28) > 604800.0)) {
          [v19 removeObjectForKey:v24];
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v54 objects:v59 count:16];
    }
    while (v21);
  }

  id v8 = v46;
  v46[2](v46, v19);
  if (![v19 count])
  {
    v29 = v14;
    id v6 = v47;
    [v14 removeObject:v47];
    v35 = [MEMORY[0x263F08850] defaultManager];
    id v52 = 0;
    v30 = v44;
    int v36 = [v35 removeItemAtURL:v44 error:&v52];
    id v32 = v52;

    if (v36)
    {
      v33 = RELogForDomain(0);
      v34 = (void *)v48;
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
        -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:]();
      }
      goto LABEL_25;
    }
LABEL_26:
    v34 = (void *)v48;
    goto LABEL_27;
  }
  v29 = v14;
  id v6 = v47;
  [v14 addObject:v47];
  id v53 = 0;
  v30 = v44;
  char v31 = [v19 writeToURL:v44 error:&v53];
  id v32 = v53;
  if (v31) {
    goto LABEL_26;
  }
  v33 = RELogForDomain(0);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR)) {
    -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:]();
  }
  v34 = (void *)v48;
LABEL_25:

LABEL_27:
  if (([v34 isEqualToSet:v29] & 1) == 0)
  {
    v37 = [v29 allObjects];
    v38 = [(RERelevanceEngineDiagnosticRegistration *)v42 _processesFileURL];
    id v51 = 0;
    char v39 = [v37 writeToURL:v38 error:&v51];
    id v40 = v51;

    if ((v39 & 1) == 0)
    {
      v41 = RELogForDomain(0);
      if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
        -[RERelevanceEngineDiagnosticRegistration _accessEngineDataForProcess:usingBlock:]((uint64_t)v40, v41);
      }
    }
    v34 = (void *)v48;
  }

LABEL_34:
}

- (void)checkinEngine:(id)a3
{
  id v4 = a3;
  if (self->_supportsRegistration)
  {
    id v5 = [MEMORY[0x263F08AB0] processInfo];
    id v6 = [v5 processName];

    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __57__RERelevanceEngineDiagnosticRegistration_checkinEngine___block_invoke;
    v7[3] = &unk_2644BFF88;
    id v8 = v4;
    [(RERelevanceEngineDiagnosticRegistration *)self _accessEngineDataForProcess:v6 usingBlock:v7];
  }
}

void __57__RERelevanceEngineDiagnosticRegistration_checkinEngine___block_invoke(uint64_t a1, void *a2)
{
  v9[2] = *MEMORY[0x263EF8340];
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 name];
  id v5 = REBuildVersion();
  id v6 = [MEMORY[0x263EFF910] date];
  v8[0] = @"Version";
  v8[1] = @"Date";
  v9[0] = v5;
  v9[1] = v6;
  id v7 = [NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  [v3 setObject:v7 forKeyedSubscript:v4];
}

- (void)enumerateAvailableEngines:(id)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4 && self->_supportsRegistration)
  {
    id v5 = [(RERelevanceEngineDiagnosticRegistration *)self _allProcesses];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          v12[0] = MEMORY[0x263EF8330];
          v12[1] = 3221225472;
          v12[2] = __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke;
          v12[3] = &unk_2644BFFD8;
          id v11 = v4;
          v12[4] = v10;
          id v13 = v11;
          [(RERelevanceEngineDiagnosticRegistration *)self _accessEngineDataForProcess:v10 usingBlock:v12];
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }
  }
}

void __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke(uint64_t a1, void *a2)
{
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke_2;
  v5[3] = &unk_2644BFFB0;
  id v4 = *(id *)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  [a2 enumerateKeysAndObjectsUsingBlock:v5];
}

uint64_t __69__RERelevanceEngineDiagnosticRegistration_enumerateAvailableEngines___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2);
}

- (void)_allProcesses
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to read registration list: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_accessEngineDataForProcess:(uint64_t)a1 usingBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to write registration list: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_accessEngineDataForProcess:usingBlock:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E6E6000, v0, v1, "Unable to remove process %@ registration data: %@");
}

- (void)_accessEngineDataForProcess:usingBlock:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E6E6000, v0, v1, "Unable to write process %@ registration data: %@");
}

- (void)_accessEngineDataForProcess:usingBlock:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_21E6E6000, v0, v1, "Unable to read process %@ registration data: %@");
}

@end