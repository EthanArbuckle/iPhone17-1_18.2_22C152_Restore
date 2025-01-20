@interface PODaemonCoreProcess
- (BOOL)_removeStashedUserLoginStateListDataWithError:(id *)a3;
- (BOOL)_savePendingSSOTokensData:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_saveStashedDecryptionContextData:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_saveStashedSSOTokensData:(id)a3 forIdentifier:(id)a4 error:(id *)a5;
- (BOOL)_saveUserLoginStateList:(id)a3 error:(id *)a4;
- (BOOL)baseSystem;
- (BOOL)writeData:(id)a3 toPath:(id)a4 saveError:(id *)a5;
- (NSString)volumeUUID;
- (PODaemonCoreProcess)initWithXPCConnection:(id)a3 baseSystem:(BOOL)a4;
- (POTokenHelper)tokenHelper;
- (POUserIdentifierProvider)userIdentifierProvider;
- (__SecKey)prebootKey;
- (id)_dataForUserLoginStateList:(id)a3 error:(id *)a4;
- (id)_defaultConfigurationPath;
- (id)_deviceConfigurationForIdentifer:(id)a3;
- (id)_loginConfigurationForIdentifer:(id)a3;
- (id)_parseUserLoginStateListData:(id)a3 error:(id *)a4;
- (id)_pendingSSOTokensForIdentifer:(id)a3 error:(id *)a4;
- (id)_stashedSSOTokensForIdentifer:(id)a3 error:(id *)a4;
- (id)_stashedUserLoginStateListDataWithError:(id *)a3;
- (id)_stashedUserLoginStateListWithError:(id *)a3;
- (id)_userConfigurationForIdentifier:(id)a3 error:(id *)a4;
- (id)_userLoginStateForIdentifier:(id)a3 error:(id *)a4;
- (id)_userLoginStateListDataWithError:(id *)a3;
- (id)_userLoginStateListWithError:(id *)a3;
- (id)initForBaseSystem:(BOOL)a3;
- (id)invalidationHandler;
- (void)connectionInvalidated;
- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)handleStartup;
- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4;
- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4;
- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4;
- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5;
- (void)setBaseSystem:(BOOL)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setPrebootKey:(__SecKey *)a3;
- (void)setTokenHelper:(id)a3;
- (void)setUserIdentifierProvider:(id)a3;
- (void)setVolumeUUID:(id)a3;
- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7;
- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4;
- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4;
@end

@implementation PODaemonCoreProcess

- (id)initForBaseSystem:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)PODaemonCoreProcess;
  v4 = [(PODaemonCoreProcess *)&v20 init];
  v5 = v4;
  if (v4)
  {
    v4->_baseSystem = a3;
    v4->_prebootKey = 0;
    if (!_cachedContexts)
    {
      uint64_t v6 = [MEMORY[0x263EFFA78] mutableCopy];
      v7 = (void *)_cachedContexts;
      _cachedContexts = v6;
    }
    if (!_cachedStashedTokens)
    {
      uint64_t v8 = [MEMORY[0x263EFFA78] mutableCopy];
      v9 = (void *)_cachedStashedTokens;
      _cachedStashedTokens = v8;
    }
    if (!_cachedPendingTokens)
    {
      uint64_t v10 = [MEMORY[0x263EFFA78] mutableCopy];
      v11 = (void *)_cachedPendingTokens;
      _cachedPendingTokens = v10;
    }
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x2050000000;
    v12 = (void *)getPODirectoryServicesClass_softClass;
    uint64_t v25 = getPODirectoryServicesClass_softClass;
    if (!getPODirectoryServicesClass_softClass)
    {
      v21[0] = MEMORY[0x263EF8330];
      v21[1] = 3221225472;
      v21[2] = __getPODirectoryServicesClass_block_invoke;
      v21[3] = &unk_265463A28;
      v21[4] = &v22;
      __getPODirectoryServicesClass_block_invoke((uint64_t)v21);
      v12 = (void *)v23[3];
    }
    v13 = v12;
    _Block_object_dispose(&v22, 8);
    v14 = (POUserIdentifierProvider *)objc_alloc_init(v13);
    userIdentifierProvider = v5->_userIdentifierProvider;
    v5->_userIdentifierProvider = v14;

    v16 = [[POTokenHelper alloc] initWithIdentifierProvider:v5->_userIdentifierProvider];
    tokenHelper = v5->_tokenHelper;
    v5->_tokenHelper = v16;

    volumeUUID = v5->_volumeUUID;
    v5->_volumeUUID = 0;
  }
  return v5;
}

- (PODaemonCoreProcess)initWithXPCConnection:(id)a3 baseSystem:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess initWithXPCConnection:baseSystem:]((uint64_t)self, v7);
  }

  uint64_t v8 = [v6 valueForEntitlement:@"com.apple.private.platformsso.agent"];
  v9 = v8;
  if (v8 && ([v8 BOOLValue] & 1) != 0)
  {
    uint64_t v10 = [(PODaemonCoreProcess *)self initForBaseSystem:v4];
    v11 = v10;
    if (v10) {
      objc_storeWeak(v10 + 1, v6);
    }
    activity_block[0] = MEMORY[0x263EF8330];
    activity_block[1] = 3221225472;
    activity_block[2] = __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke_6;
    activity_block[3] = &unk_2654639D8;
    v12 = v11;
    v17 = v12;
    _os_activity_initiate(&dword_259DFE000, "DaemonStartup", OS_ACTIVITY_FLAG_DEFAULT, activity_block);

    self = v12;
    v13 = self;
  }
  else
  {
    id v14 = __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke();
    v13 = 0;
  }

  return v13;
}

id __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke()
{
  v0 = +[POError errorWithCode:-1002 description:@"missing required entitlement"];
  v1 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

uint64_t __56__PODaemonCoreProcess_initWithXPCConnection_baseSystem___block_invoke_6(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStartup];
}

- (void)connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v3 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    v5 = "-[PODaemonCoreProcess connectionInvalidated]";
    __int16 v6 = 2112;
    v7 = self;
    _os_log_impl(&dword_259DFE000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v4, 0x16u);
  }
}

- (void)handleStartup
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "handleStartup", v2, v3, v4, v5, v6);
}

- (BOOL)writeData:(id)a3 toPath:(id)a4 saveError:(id *)a5
{
  v39[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v9 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess writeData:toPath:saveError:]();
  }

  if (v7)
  {
    id v34 = 0;
    char v10 = [v7 writeToURL:v8 options:0x10000000 error:&v34];
    id v11 = v34;
    v12 = v11;
    if (v10)
    {
      uint64_t v38 = *MEMORY[0x263F08078];
      v39[0] = &unk_2707DBAD8;
      v13 = [NSDictionary dictionaryWithObjects:v39 forKeys:&v38 count:1];
      id v14 = [MEMORY[0x263F08850] defaultManager];
      v15 = [v8 path];
      id v31 = v12;
      char v16 = [v14 setAttributes:v13 ofItemAtPath:v15 error:&v31];
      id v17 = v31;

      if (v16)
      {
        v18 = PO_LOG_PODaemonCoreProcess();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[PODaemonCoreProcess writeData:toPath:saveError:]();
        }
      }
      else
      {
        v29[0] = MEMORY[0x263EF8330];
        v29[1] = 3221225472;
        v29[2] = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_21;
        v29[3] = &unk_265463860;
        v30 = v17;
        uint64_t v24 = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_21((uint64_t)v29);
        uint64_t v25 = v24;
        if (a5) {
          *a5 = v24;
        }

        v18 = v30;
      }
    }
    else
    {
      v32[0] = MEMORY[0x263EF8330];
      v32[1] = 3221225472;
      v32[2] = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_15;
      v32[3] = &unk_265463860;
      id v17 = v11;
      id v33 = v17;
      v21 = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_15((uint64_t)v32);
      uint64_t v22 = v21;
      if (a5) {
        *a5 = v21;
      }

      char v16 = 0;
      v13 = v33;
    }
LABEL_22:

    goto LABEL_23;
  }
  v19 = [MEMORY[0x263F08850] defaultManager];
  id v37 = 0;
  char v20 = [v19 removeItemAtURL:v8 error:&v37];
  id v17 = v37;

  if ((v20 & 1) == 0)
  {
    v23 = [v17 userInfo];
    v13 = [v23 objectForKeyedSubscript:@"NSUnderlyingError"];

    if ([v13 code] == 2)
    {
      char v16 = 1;
    }
    else
    {
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke;
      v35[3] = &unk_265463860;
      id v17 = v17;
      id v36 = v17;
      v26 = __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke((uint64_t)v35);
      v27 = v26;
      if (a5) {
        *a5 = v26;
      }

      char v16 = 0;
    }
    goto LABEL_22;
  }
  char v16 = 1;
LABEL_23:

  return v16;
}

id __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1007 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove configuration"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_15(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write config to disk"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __50__PODaemonCoreProcess_writeData_toPath_saveError___block_invoke_21(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to set configuration attributes"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (id)_deviceConfigurationForIdentifer:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[PODaemonCoreProcess _deviceConfigurationForIdentifer:]";
    __int16 v20 = 2114;
    id v21 = v4;
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  uint8_t v6 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v7 = v6;
  if (v4)
  {
    id v8 = [NSString stringWithFormat:@"com.apple.PlatformSSO.device.%@.txt", v4];
    v9 = [v7 URLByAppendingPathComponent:v8];
  }
  else
  {
    v9 = [v6 URLByAppendingPathComponent:@"com.apple.PlatformSSO.device.txt"];
  }

  char v10 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:]();
  }

  id v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    id v12 = [NSString alloc];
    v13 = v12;
    if (v11)
    {
      id v14 = (PODaemonCoreProcess *)[v12 initWithData:v11 encoding:4];
    }
    else
    {
      v15 = [MEMORY[0x263EFF8F8] data];
      id v14 = (PODaemonCoreProcess *)[v13 initWithData:v15 encoding:4];
    }
    char v16 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v19 = "-[PODaemonCoreProcess _deviceConfigurationForIdentifer:]";
      __int16 v20 = 2114;
      id v21 = v4;
      __int16 v22 = 2114;
      v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = self;
      _os_log_debug_impl(&dword_259DFE000, v16, OS_LOG_TYPE_DEBUG, "%s identifer = %{public}@, data = %{public}@ on %@", buf, 0x2Au);
    }
  }
  return v11;
}

- (void)deviceConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v14 = "-[PODaemonCoreProcess deviceConfigurationForIdentifer:completion:]";
    __int16 v15 = 2114;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  v9 = [(PODaemonCoreProcess *)self _deviceConfigurationForIdentifer:v6];
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __66__PODaemonCoreProcess_deviceConfigurationForIdentifer_completion___block_invoke;
    v11[3] = &unk_265463860;
    id v12 = v6;
    char v10 = __66__PODaemonCoreProcess_deviceConfigurationForIdentifer_completion___block_invoke((uint64_t)v11);
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);
  }
}

id __66__PODaemonCoreProcess_deviceConfigurationForIdentifer_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32)) {
    uint64_t v1 = "no user device configuration data to load";
  }
  else {
    uint64_t v1 = "no device configuration data to load";
  }
  uint64_t v2 = [NSString stringWithUTF8String:v1];
  uint64_t v3 = +[POError errorWithCode:-1004 description:v2];

  id v4 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v3;
}

- (id)_loginConfigurationForIdentifer:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v19 = "-[PODaemonCoreProcess _loginConfigurationForIdentifer:]";
    __int16 v20 = 2114;
    id v21 = v4;
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_259DFE000, v5, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v6 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v7 = v6;
  if (v4)
  {
    id v8 = [NSString stringWithFormat:@"com.apple.PlatformSSO.login.%@.txt", v4];
    v9 = [v7 URLByAppendingPathComponent:v8];
  }
  else
  {
    v9 = [v6 URLByAppendingPathComponent:@"com.apple.PlatformSSO.login.txt"];
  }

  char v10 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:]();
  }

  id v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    id v12 = [NSString alloc];
    v13 = v12;
    if (v11)
    {
      id v14 = (void *)[v12 initWithData:v11 encoding:4];
    }
    else
    {
      __int16 v15 = [MEMORY[0x263EFF8F8] data];
      id v14 = (void *)[v13 initWithData:v15 encoding:4];
    }
    id v16 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _loginConfigurationForIdentifer:]();
    }
  }
  return v11;
}

- (void)loginConfigurationForIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, void))a4;
  id v8 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 136315650;
    id v12 = "-[PODaemonCoreProcess loginConfigurationForIdentifer:completion:]";
    __int16 v13 = 2114;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", (uint8_t *)&v11, 0x20u);
  }

  v9 = [(PODaemonCoreProcess *)self _loginConfigurationForIdentifer:v6];
  if (v9)
  {
    v7[2](v7, v9, 0);
  }
  else
  {
    char v10 = __65__PODaemonCoreProcess_loginConfigurationForIdentifer_completion___block_invoke();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v10);
  }
}

id __65__PODaemonCoreProcess_loginConfigurationForIdentifer_completion___block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no login configuration data to load"];
  uint64_t v1 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)_userConfigurationForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v8 = [NSString stringWithFormat:@"com.apple.PlatformSSO.user.%@.txt", v6];

  v9 = [v7 URLByAppendingPathComponent:v8];

  char v10 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:]();
  }

  int v11 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v9];
  if (v11)
  {
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
    {
      id v12 = (void *)[[NSString alloc] initWithData:v11 encoding:4];
      __int16 v13 = PO_LOG_PODaemonCoreProcess();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        -[PODaemonCoreProcess _userConfigurationForIdentifier:error:]();
      }
    }
    id v14 = [[POUserConfiguration alloc] initWithData:v11];
  }
  else
  {
    __int16 v15 = __61__PODaemonCoreProcess__userConfigurationForIdentifier_error___block_invoke();
    id v16 = v15;
    if (a4) {
      *a4 = v15;
    }

    id v14 = 0;
  }

  return v14;
}

id __61__PODaemonCoreProcess__userConfigurationForIdentifier_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no user configuration data to load"];
  uint64_t v1 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)userConfigurationForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v13 = "-[PODaemonCoreProcess userConfigurationForIdentifier:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  v9 = [(PODaemonCoreProcess *)self _userConfigurationForIdentifier:v6 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (id)_userLoginStateListDataWithError:(id *)a3
{
  id v4 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"com.apple.PlatformSSO.userstate.txt"];

  id v6 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:]();
  }

  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
  if (v7)
  {
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
    {
      id v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      v9 = PO_LOG_PODaemonCoreProcess();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PODaemonCoreProcess _userLoginStateListDataWithError:]();
      }
    }
    id v10 = v7;
  }
  else
  {
    id v11 = __56__PODaemonCoreProcess__userLoginStateListDataWithError___block_invoke();
    id v12 = v11;
    if (a3) {
      *a3 = v11;
    }
  }
  return v7;
}

id __56__PODaemonCoreProcess__userLoginStateListDataWithError___block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no user state data to load"];
  uint64_t v1 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (id)_parseUserLoginStateListData:(id)a3 error:(id *)a4
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v39 = 0;
  uint64_t v5 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:16 error:&v39];
  id v6 = v39;
  id v7 = v6;
  if (v6)
  {
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke;
    v37[3] = &unk_265463860;
    id v38 = v6;
    id v8 = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke((uint64_t)v37);
    v9 = v8;
    if (a4) {
      *a4 = v8;
    }

    id v10 = 0;
    id v11 = v38;
  }
  else
  {
    v27 = 0;
    id v12 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    long long v33 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    __int16 v13 = [v5 allKeys];
    uint64_t v14 = [v13 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v34;
      v28 = v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v34 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v19 = objc_msgSend(v5, "objectForKeyedSubscript:", v18, v27, v28);
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass)
          {
            id v21 = [POUserLoginState alloc];
            __int16 v22 = [v5 objectForKeyedSubscript:v18];
            v23 = [(POUserLoginState *)v21 initWithDictionary:v22];

            if (v23)
            {
              uint64_t v24 = [(POUserLoginState *)v23 uniqueIdentifier];
              [v12 setObject:v23 forKeyedSubscript:v24];
            }
            else
            {
              v29[0] = MEMORY[0x263EF8330];
              v29[1] = 3221225472;
              v30[0] = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_52;
              v30[1] = &unk_265463A00;
              id v31 = 0;
              uint64_t v32 = v18;
              id v25 = __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_52((uint64_t)v29);
              uint64_t v24 = v31;
            }
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v15);
    }

    id v11 = v12;
    id v10 = (void *)[v12 copy];
    id v7 = v27;
  }

  return v10;
}

id __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing user state list."];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_52(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error deserializing user state."];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_52_cold_1();
  }

  return v1;
}

- (id)_userLoginStateListWithError:(id *)a3
{
  id v14 = 0;
  uint64_t v5 = [(PODaemonCoreProcess *)self _userLoginStateListDataWithError:&v14];
  id v6 = v14;
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __52__PODaemonCoreProcess__userLoginStateListWithError___block_invoke;
    v12[3] = &unk_265463860;
    id v13 = v6;
    id v8 = __52__PODaemonCoreProcess__userLoginStateListWithError___block_invoke((uint64_t)v12);
    v9 = v8;
    if (a3) {
      *a3 = v8;
    }

    id v10 = 0;
  }
  else
  {
    id v10 = [(PODaemonCoreProcess *)self _parseUserLoginStateListData:v5 error:a3];
  }

  return v10;
}

id __52__PODaemonCoreProcess__userLoginStateListWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error loading user state list."];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (id)_stashedUserLoginStateListDataWithError:(id *)a3
{
  id v4 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"com.apple.PlatformSSO.stashed.userstate.txt"];

  id v6 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _deviceConfigurationForIdentifer:]();
  }

  id v7 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v5];
  if (v7)
  {
    if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
    {
      id v8 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
      v9 = PO_LOG_PODaemonCoreProcess();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[PODaemonCoreProcess _stashedUserLoginStateListDataWithError:]();
      }
    }
    id v10 = v7;
  }
  else
  {
    id v11 = __56__PODaemonCoreProcess__userLoginStateListDataWithError___block_invoke();
    id v12 = v11;
    if (a3) {
      *a3 = v11;
    }
  }
  return v7;
}

- (id)_stashedUserLoginStateListWithError:(id *)a3
{
  id v14 = 0;
  uint64_t v5 = [(PODaemonCoreProcess *)self _stashedUserLoginStateListDataWithError:&v14];
  id v6 = v14;
  id v7 = v6;
  if (v6)
  {
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __59__PODaemonCoreProcess__stashedUserLoginStateListWithError___block_invoke;
    v12[3] = &unk_265463860;
    id v13 = v6;
    id v8 = __59__PODaemonCoreProcess__stashedUserLoginStateListWithError___block_invoke((uint64_t)v12);
    v9 = v8;
    if (a3) {
      *a3 = v8;
    }

    id v10 = 0;
  }
  else
  {
    id v10 = [(PODaemonCoreProcess *)self _parseUserLoginStateListData:v5 error:a3];
  }

  return v10;
}

id __59__PODaemonCoreProcess__stashedUserLoginStateListWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error loading user state list."];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (BOOL)_removeStashedUserLoginStateListDataWithError:(id *)a3
{
  id v4 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  uint64_t v5 = [v4 URLByAppendingPathComponent:@"com.apple.PlatformSSO.stashed.userstate.txt"];

  id v6 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _removeStashedUserLoginStateListDataWithError:]();
  }

  id v7 = [MEMORY[0x263F08850] defaultManager];
  id v19 = 0;
  char v8 = [v7 removeItemAtURL:v5 error:&v19];
  id v9 = v19;

  if (v8)
  {
    BOOL v10 = 1;
  }
  else
  {
    id v11 = [v9 userInfo];
    id v12 = [v11 objectForKeyedSubscript:@"NSUnderlyingError"];

    uint64_t v13 = [v12 code];
    BOOL v10 = v13 == 2;
    if (v13 != 2)
    {
      v17[0] = MEMORY[0x263EF8330];
      v17[1] = 3221225472;
      v17[2] = __69__PODaemonCoreProcess__removeStashedUserLoginStateListDataWithError___block_invoke;
      v17[3] = &unk_265463860;
      id v18 = v9;
      id v14 = __69__PODaemonCoreProcess__removeStashedUserLoginStateListDataWithError___block_invoke((uint64_t)v17);
      uint64_t v15 = v14;
      if (a3) {
        *a3 = v14;
      }
    }
  }

  return v10;
}

id __69__PODaemonCoreProcess__removeStashedUserLoginStateListDataWithError___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1007 underlyingError:*(void *)(a1 + 32) description:@"Failed to remove stashed login state list"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (id)_dataForUserLoginStateList:(id)a3 error:(id *)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v7 = [v5 allKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v13 = [v5 objectForKeyedSubscript:v12];
        id v14 = [v13 dictionaryRepresentation];
        [v6 setObject:v14 forKeyedSubscript:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v9);
  }

  id v24 = 0;
  uint64_t v15 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:11 error:&v24];
  id v16 = v24;
  uint64_t v17 = v16;
  if (v16)
  {
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = __56__PODaemonCoreProcess__dataForUserLoginStateList_error___block_invoke;
    v22[3] = &unk_265463860;
    id v23 = v16;
    id v18 = __56__PODaemonCoreProcess__dataForUserLoginStateList_error___block_invoke((uint64_t)v22);
    id v19 = v18;
    if (a4) {
      *a4 = v18;
    }

    id v20 = 0;
  }
  else
  {
    id v20 = v15;
  }

  return v20;
}

id __56__PODaemonCoreProcess__dataForUserLoginStateList_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing user state list."];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (BOOL)_saveUserLoginStateList:(id)a3 error:(id *)a4
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v31 = "-[PODaemonCoreProcess _saveUserLoginStateList:error:]";
    __int16 v32 = 2112;
    long long v33 = self;
    _os_log_impl(&dword_259DFE000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    uint64_t v8 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _saveUserLoginStateList:error:]();
    }
  }
  uint64_t v9 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  uint64_t v10 = [v9 URLByAppendingPathComponent:@"com.apple.PlatformSSO.userstate.txt"];

  id v29 = 0;
  id v11 = [(PODaemonCoreProcess *)self _dataForUserLoginStateList:v6 error:&v29];
  id v12 = v29;
  if (v12)
  {
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke;
    v27[3] = &unk_265463860;
    uint64_t v13 = v12;
    long long v28 = v13;
    id v14 = __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke((uint64_t)v27);
    uint64_t v15 = v14;
    if (a4) {
      *a4 = v14;
    }

    BOOL v16 = 0;
    uint64_t v17 = v28;
  }
  else
  {
    id v26 = 0;
    BOOL v18 = [(PODaemonCoreProcess *)self writeData:v11 toPath:v10 saveError:&v26];
    id v19 = v26;
    uint64_t v13 = v19;
    if (v18)
    {
      uint64_t v17 = PO_LOG_PODaemonCoreProcess();
      BOOL v16 = 1;
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v20 = [v10 path];
        *(_DWORD *)buf = 138543362;
        id v31 = v20;
        _os_log_impl(&dword_259DFE000, v17, OS_LOG_TYPE_INFO, "user state list written to file: %{public}@", buf, 0xCu);
      }
    }
    else
    {
      v24[0] = MEMORY[0x263EF8330];
      v24[1] = 3221225472;
      v24[2] = __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke_67;
      v24[3] = &unk_265463860;
      uint64_t v13 = v19;
      long long v25 = v13;
      id v21 = __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke_67((uint64_t)v24);
      __int16 v22 = v21;
      if (a4) {
        *a4 = v21;
      }

      BOOL v16 = 0;
      uint64_t v17 = v25;
    }
  }

  return v16;
}

id __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Error serializing user state list."];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

id __53__PODaemonCoreProcess__saveUserLoginStateList_error___block_invoke_67(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write user state list to disk"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (id)_userLoginStateForIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(PODaemonCoreProcess *)self _userLoginStateListWithError:a4];
  uint64_t v8 = [v7 objectForKeyedSubscript:v6];

  return v8;
}

- (void)userLoginStateForIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  uint64_t v8 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    uint64_t v13 = "-[PODaemonCoreProcess userLoginStateForIdentifier:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    uint64_t v17 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  uint64_t v9 = [(PODaemonCoreProcess *)self _userLoginStateForIdentifier:v6 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (void)updateLoginStateForIdentifier:(id)a3 state:(id)a4 loginDate:(id)a5 loginType:(id)a6 completion:(id)a7
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  __int16 v16 = (void (**)(id, uint64_t, void))a7;
  uint64_t v17 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    long long v33 = "-[PODaemonCoreProcess updateLoginStateForIdentifier:state:loginDate:loginType:completion:]";
    __int16 v34 = 2114;
    id v35 = v12;
    __int16 v36 = 2112;
    id v37 = self;
    _os_log_impl(&dword_259DFE000, v17, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v31 = 0;
  uint64_t v18 = [(PODaemonCoreProcess *)self _userLoginStateListWithError:&v31];
  id v19 = v31;
  id v20 = (void *)[v18 mutableCopy];
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  id v23 = v22;

  id v24 = [v23 objectForKeyedSubscript:v12];
  if (!v24) {
    id v24 = [[POUserLoginState alloc] initWithUniqueIdentifier:v12];
  }
  if (v13) {
    -[POUserLoginState setState:](v24, "setState:", [v13 unsignedIntValue]);
  }
  if (v14) {
    [(POUserLoginState *)v24 setLastLogin:v14];
  }
  if (v15) {
    -[POUserLoginState setLoginType:](v24, "setLoginType:", [v15 unsignedIntValue]);
  }
  long long v25 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess updateLoginStateForIdentifier:state:loginDate:loginType:completion:]();
  }

  [v23 setObject:v24 forKeyedSubscript:v12];
  id v30 = v19;
  BOOL v26 = [(PODaemonCoreProcess *)self _saveUserLoginStateList:v23 error:&v30];
  id v27 = v30;

  if (v26)
  {
    uint64_t v28 = 1;
    id v29 = 0;
  }
  else
  {
    uint64_t v28 = 0;
    id v29 = v27;
  }
  ((void (**)(id, uint64_t, id))v16)[2](v16, v28, v29);
}

- (void)savePendingSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[PODaemonCoreProcess savePendingSSOTokens:identifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_259DFE000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = 0;
  BOOL v12 = [(PODaemonCoreProcess *)self _savePendingSSOTokensData:v10 forIdentifier:v8 error:&v14];

  id v13 = v14;
  v9[2](v9, v12, v13);
}

- (BOOL)_savePendingSSOTokensData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v31 = "-[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:]";
    __int16 v32 = 2114;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = self;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    id v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    BOOL v12 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:]();
    }
  }
  if (![(PODaemonCoreProcess *)self baseSystem])
  {
    uint64_t v16 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
    __int16 v17 = [NSString stringWithFormat:@"com.apple.PlatformSSO.pending.%@.txt", v9];
    id v18 = [(id)v16 URLByAppendingPathComponent:v17];

    id v29 = 0;
    LOBYTE(v16) = [(PODaemonCoreProcess *)self writeData:v8 toPath:v18 saveError:&v29];
    id v19 = v29;
    id v20 = v19;
    if ((v16 & 1) == 0)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __69__PODaemonCoreProcess__savePendingSSOTokensData_forIdentifier_error___block_invoke;
      v27[3] = &unk_265463860;
      id v20 = v19;
      id v28 = v20;
      id v23 = __69__PODaemonCoreProcess__savePendingSSOTokensData_forIdentifier_error___block_invoke((uint64_t)v27);
      id v24 = v23;
      if (a5) {
        *a5 = v23;
      }

      BOOL v15 = 0;
      goto LABEL_21;
    }
    uint64_t v21 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v18 path];
      *(_DWORD *)buf = 138543362;
      id v31 = v22;
      _os_log_impl(&dword_259DFE000, v21, OS_LOG_TYPE_INFO, "pending tokens written to file: %{public}@", buf, 0xCu);
    }
LABEL_20:
    BOOL v15 = 1;
LABEL_21:

    goto LABEL_22;
  }
  id v13 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:]();
  }

  id v14 = (id)_cachedPendingTokens;
  objc_sync_enter(v14);
  [(id)_cachedPendingTokens setObject:v8 forKeyedSubscript:v9];
  objc_sync_exit(v14);

  if (!_cacheTransaction)
  {
    uint64_t v25 = os_transaction_create();
    id v20 = (id)_cacheTransaction;
    _cacheTransaction = v25;
    goto LABEL_20;
  }
  BOOL v15 = 1;
LABEL_22:

  return v15;
}

id __69__PODaemonCoreProcess__savePendingSSOTokensData_forIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write pending tokens to disk"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (void)retrievePendingSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[PODaemonCoreProcess retrievePendingSSOTokenForIdentifer:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  id v9 = [(PODaemonCoreProcess *)self _pendingSSOTokensForIdentifer:v6 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (id)_pendingSSOTokensForIdentifer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PODaemonCoreProcess *)self baseSystem])
  {
    id v7 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:]();
    }

    id v8 = (id)_cachedPendingTokens;
    objc_sync_enter(v8);
    id v9 = [(id)_cachedPendingTokens objectForKeyedSubscript:v6];
    objc_sync_exit(v8);
  }
  else
  {
    id v10 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
    id v11 = [NSString stringWithFormat:@"com.apple.PlatformSSO.pending.%@.txt", v6];
    id v8 = [v10 URLByAppendingPathComponent:v11];

    id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
    if (v9)
    {
      if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
      {
        BOOL v12 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
        id v13 = PO_LOG_PODaemonCoreProcess();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:]();
        }
      }
      id v14 = v9;
    }
    else
    {
      id v15 = __59__PODaemonCoreProcess__pendingSSOTokensForIdentifer_error___block_invoke();
      __int16 v16 = v15;
      if (a4) {
        *a4 = v15;
      }
    }
  }

  return v9;
}

id __59__PODaemonCoreProcess__pendingSSOTokensForIdentifer_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no pending tokens data to load"];
  uint64_t v1 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)saveStashedSSOTokens:(id)a3 identifer:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[PODaemonCoreProcess saveStashedSSOTokens:identifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_259DFE000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = 0;
  BOOL v12 = [(PODaemonCoreProcess *)self _saveStashedSSOTokensData:v10 forIdentifier:v8 error:&v14];

  id v13 = v14;
  v9[2](v9, v12, v13);
}

- (BOOL)_saveStashedSSOTokensData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v31 = "-[PODaemonCoreProcess _saveStashedSSOTokensData:forIdentifier:error:]";
    __int16 v32 = 2114;
    id v33 = v9;
    __int16 v34 = 2112;
    id v35 = self;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    id v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    BOOL v12 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _saveStashedSSOTokensData:forIdentifier:error:]();
    }
  }
  if (![(PODaemonCoreProcess *)self baseSystem])
  {
    uint64_t v16 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
    __int16 v17 = [NSString stringWithFormat:@"com.apple.PlatformSSO.stashed.%@.txt", v9];
    id v18 = [(id)v16 URLByAppendingPathComponent:v17];

    id v29 = 0;
    LOBYTE(v16) = [(PODaemonCoreProcess *)self writeData:v8 toPath:v18 saveError:&v29];
    id v19 = v29;
    id v20 = v19;
    if ((v16 & 1) == 0)
    {
      v27[0] = MEMORY[0x263EF8330];
      v27[1] = 3221225472;
      v27[2] = __69__PODaemonCoreProcess__saveStashedSSOTokensData_forIdentifier_error___block_invoke;
      v27[3] = &unk_265463860;
      id v20 = v19;
      id v28 = v20;
      id v23 = __69__PODaemonCoreProcess__saveStashedSSOTokensData_forIdentifier_error___block_invoke((uint64_t)v27);
      id v24 = v23;
      if (a5) {
        *a5 = v23;
      }

      BOOL v15 = 0;
      goto LABEL_21;
    }
    uint64_t v21 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      id v22 = [v18 path];
      *(_DWORD *)buf = 138543362;
      id v31 = v22;
      _os_log_impl(&dword_259DFE000, v21, OS_LOG_TYPE_INFO, "stashed tokens written to file: %{public}@", buf, 0xCu);
    }
LABEL_20:
    BOOL v15 = 1;
LABEL_21:

    goto LABEL_22;
  }
  id v13 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[PODaemonCoreProcess _savePendingSSOTokensData:forIdentifier:error:]();
  }

  id v14 = (id)_cachedStashedTokens;
  objc_sync_enter(v14);
  [(id)_cachedStashedTokens setObject:v8 forKeyedSubscript:v9];
  objc_sync_exit(v14);

  if (!_cacheTransaction)
  {
    uint64_t v25 = os_transaction_create();
    id v20 = (id)_cacheTransaction;
    _cacheTransaction = v25;
    goto LABEL_20;
  }
  BOOL v15 = 1;
LABEL_22:

  return v15;
}

id __69__PODaemonCoreProcess__saveStashedSSOTokensData_forIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write stashed tokens to disk"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (void)retrieveStashedSSOTokenForIdentifer:(id)a3 completion:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void *, id))a4;
  id v8 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v13 = "-[PODaemonCoreProcess retrieveStashedSSOTokenForIdentifer:completion:]";
    __int16 v14 = 2114;
    id v15 = v6;
    __int16 v16 = 2112;
    __int16 v17 = self;
    _os_log_impl(&dword_259DFE000, v8, OS_LOG_TYPE_DEFAULT, "%s identifer = %{public}@ on %@", buf, 0x20u);
  }

  id v11 = 0;
  id v9 = [(PODaemonCoreProcess *)self _stashedSSOTokensForIdentifer:v6 error:&v11];
  id v10 = v11;
  v7[2](v7, v9, v10);
}

- (id)_stashedSSOTokensForIdentifer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if ([(PODaemonCoreProcess *)self baseSystem])
  {
    id v7 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _pendingSSOTokensForIdentifer:error:]();
    }

    id v8 = (id)_cachedStashedTokens;
    objc_sync_enter(v8);
    id v9 = [(id)_cachedStashedTokens objectForKeyedSubscript:v6];
    objc_sync_exit(v8);
  }
  else
  {
    id v10 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
    id v11 = [NSString stringWithFormat:@"com.apple.PlatformSSO.stashed.%@.txt", v6];
    id v8 = [v10 URLByAppendingPathComponent:v11];

    id v9 = [MEMORY[0x263EFF8F8] dataWithContentsOfURL:v8];
    if (v9)
    {
      if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
      {
        BOOL v12 = (void *)[[NSString alloc] initWithData:v9 encoding:4];
        id v13 = PO_LOG_PODaemonCoreProcess();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
          -[PODaemonCoreProcess _stashedSSOTokensForIdentifer:error:]();
        }
      }
      id v14 = v9;
    }
    else
    {
      id v15 = __59__PODaemonCoreProcess__stashedSSOTokensForIdentifer_error___block_invoke();
      __int16 v16 = v15;
      if (a4) {
        *a4 = v15;
      }
    }
  }

  return v9;
}

id __59__PODaemonCoreProcess__stashedSSOTokensForIdentifer_error___block_invoke()
{
  v0 = +[POError errorWithCode:-1004 description:@"no stashed token data to load"];
  uint64_t v1 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v0;
}

- (void)saveStashedDecryptionContext:(id)a3 identifer:(id)a4 completion:(id)a5
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, BOOL, id))a5;
  id v10 = a3;
  id v11 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v16 = "-[PODaemonCoreProcess saveStashedDecryptionContext:identifer:completion:]";
    __int16 v17 = 2114;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_259DFE000, v11, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  id v14 = 0;
  BOOL v12 = [(PODaemonCoreProcess *)self _saveStashedDecryptionContextData:v10 forIdentifier:v8 error:&v14];

  id v13 = v14;
  v9[2](v9, v12, v13);
}

- (BOOL)_saveStashedDecryptionContextData:(id)a3 forIdentifier:(id)a4 error:(id *)a5
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    id v28 = "-[PODaemonCoreProcess _saveStashedDecryptionContextData:forIdentifier:error:]";
    __int16 v29 = 2114;
    id v30 = v9;
    __int16 v31 = 2112;
    __int16 v32 = self;
    _os_log_impl(&dword_259DFE000, v10, OS_LOG_TYPE_DEFAULT, "%s identifier = %{public}@ on %@", buf, 0x20u);
  }

  if (+[POCoreConfigurationUtil platformSSODevModeEnabled])
  {
    id v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    BOOL v12 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[PODaemonCoreProcess _saveStashedDecryptionContextData:forIdentifier:error:]();
    }
  }
  id v13 = [(PODaemonCoreProcess *)self _defaultConfigurationPath];
  id v14 = [NSString stringWithFormat:@"com.apple.PlatformSSO.context.%@.txt", v9];
  id v15 = [v13 URLByAppendingPathComponent:v14];

  id v26 = 0;
  BOOL v16 = [(PODaemonCoreProcess *)self writeData:v8 toPath:v15 saveError:&v26];
  id v17 = v26;
  id v18 = v17;
  if (v16)
  {
    __int16 v19 = PO_LOG_PODaemonCoreProcess();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v15 path];
      *(_DWORD *)buf = 138543362;
      id v28 = v20;
      _os_log_impl(&dword_259DFE000, v19, OS_LOG_TYPE_INFO, "stashed context written to file: %{public}@", buf, 0xCu);
    }
  }
  else
  {
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __77__PODaemonCoreProcess__saveStashedDecryptionContextData_forIdentifier_error___block_invoke;
    v24[3] = &unk_265463860;
    uint64_t v25 = v17;
    uint64_t v21 = __77__PODaemonCoreProcess__saveStashedDecryptionContextData_forIdentifier_error___block_invoke((uint64_t)v24);
    id v22 = v21;
    if (a5) {
      *a5 = v21;
    }

    __int16 v19 = v25;
  }

  return v16;
}

id __77__PODaemonCoreProcess__saveStashedDecryptionContextData_forIdentifier_error___block_invoke(uint64_t a1)
{
  uint64_t v1 = +[POError errorWithCode:-1001 underlyingError:*(void *)(a1 + 32) description:@"Failed to write stashed context to disk"];
  uint64_t v2 = PO_LOG_PODaemonCoreProcess();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __24__POJWT_initWithString___block_invoke_cold_1();
  }

  return v1;
}

- (id)_defaultConfigurationPath
{
  return (id)[NSURL fileURLWithPath:@"/var/mobile/Library/ExtensibleSSO/Configuration/PlatformSSO"];
}

- (id)invalidationHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)baseSystem
{
  return self->_baseSystem;
}

- (void)setBaseSystem:(BOOL)a3
{
  self->_baseSystem = a3;
}

- (__SecKey)prebootKey
{
  return self->_prebootKey;
}

- (void)setPrebootKey:(__SecKey *)a3
{
  self->_prebootKey = a3;
}

- (POTokenHelper)tokenHelper
{
  return (POTokenHelper *)objc_getProperty(self, a2, 40, 1);
}

- (void)setTokenHelper:(id)a3
{
}

- (POUserIdentifierProvider)userIdentifierProvider
{
  return (POUserIdentifierProvider *)objc_getProperty(self, a2, 48, 1);
}

- (void)setUserIdentifierProvider:(id)a3
{
}

- (NSString)volumeUUID
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setVolumeUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeUUID, 0);
  objc_storeStrong((id *)&self->_userIdentifierProvider, 0);
  objc_storeStrong((id *)&self->_tokenHelper, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_destroyWeak((id *)&self->_xpcConnection);
}

- (void)initWithXPCConnection:(uint64_t)a1 baseSystem:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[PODaemonCoreProcess initWithXPCConnection:baseSystem:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_259DFE000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (void)writeData:toPath:saveError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "Completed saving data to: %{public}@", v2, v3, v4, v5, v6);
}

- (void)writeData:toPath:saveError:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "Saving data to: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_deviceConfigurationForIdentifer:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "loading = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_loginConfigurationForIdentifer:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_userConfigurationForIdentifier:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_userLoginStateListDataWithError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

void __58__PODaemonCoreProcess__parseUserLoginStateListData_error___block_invoke_52_cold_1()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2114;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_259DFE000, v1, OS_LOG_TYPE_ERROR, "%{public}@, %{public}@", v2, 0x16u);
}

- (void)_stashedUserLoginStateListDataWithError:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_removeStashedUserLoginStateListDataWithError:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "removing = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_saveUserLoginStateList:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s stateList = %{public}@ on %@", v2);
}

- (void)updateLoginStateForIdentifier:state:loginDate:loginType:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_4_0(&dword_259DFE000, v0, v1, "Updated login state = %{public}@", v2, v3, v4, v5, v6);
}

- (void)_savePendingSSOTokensData:forIdentifier:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "saving to cache", v2, v3, v4, v5, v6);
}

- (void)_savePendingSSOTokensData:forIdentifier:error:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_pendingSSOTokensForIdentifer:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5(&dword_259DFE000, v0, v1, "using cached data", v2, v3, v4, v5, v6);
}

- (void)_pendingSSOTokensForIdentifer:error:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_saveStashedSSOTokensData:forIdentifier:error:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_stashedSSOTokensForIdentifer:error:.cold.2()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

- (void)_saveStashedDecryptionContextData:forIdentifier:error:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_3();
  OUTLINED_FUNCTION_3_1(&dword_259DFE000, v0, v1, "%s data = %{public}@ on %@", v2);
}

@end