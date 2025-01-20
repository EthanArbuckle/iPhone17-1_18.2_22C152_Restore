@interface OspreyDeviceAuthentication
- (OspreyDeviceAuthentication)initWithChannel:(id)a3 connectionPreferences:(id)a4 allPreferences:(id)a5;
- (id)_currentStrategy;
- (unint64_t)authenticationStrategyVersion;
- (unint64_t)currentStrategyVersion;
- (void)setCurrentStrategyVersion:(unint64_t)a3;
- (void)signData:(id)a3 success:(id)a4 failure:(id)a5;
@end

@implementation OspreyDeviceAuthentication

- (OspreyDeviceAuthentication)initWithChannel:(id)a3 connectionPreferences:(id)a4 allPreferences:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)OspreyDeviceAuthentication;
  v11 = [(OspreyDeviceAuthentication *)&v26 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_allPreferences, a5);
    objc_storeStrong((id *)&v12->_connectionPreferences, a4);
    v13 = [MEMORY[0x1E4F1CA60] dictionary];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __83__OspreyDeviceAuthentication_initWithChannel_connectionPreferences_allPreferences___block_invoke;
    v24[3] = &unk_1E63CC138;
    v14 = v13;
    v25 = v14;
    v15 = (void (**)(void, void))MEMORY[0x1C189D2A0](v24);
    v16 = [[OspreyMescalAuthentication alloc] initWithChannel:v8 connectionPreferences:v9];
    ((void (**)(void, OspreyMescalAuthentication *))v15)[2](v15, v16);
    v17 = [[OspreyAbsintheAuthenticator alloc] initWithChannel:v8 connectionPreferences:v9];
    ((void (**)(void, OspreyAbsintheAuthenticator *))v15)[2](v15, v17);
    strategies = v12->_strategies;
    v12->_strategies = v14;
    v19 = v14;

    v20 = [v9 deviceAuthenticationVersion];
    v21 = v20;
    if (v20) {
      uint64_t v22 = [v20 integerValue];
    }
    else {
      uint64_t v22 = 1;
    }
    [(OspreyDeviceAuthentication *)v12 setCurrentStrategyVersion:v22];
  }
  return v12;
}

void __83__OspreyDeviceAuthentication_initWithChannel_connectionPreferences_allPreferences___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  v3 = NSNumber;
  id v4 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "authenticationStrategyVersion"));
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v2 setObject:v4 forKey:v5];
}

- (void)setCurrentStrategyVersion:(unint64_t)a3
{
  id v5 = [(NSDictionary *)self->_strategies allKeys];
  v6 = [NSNumber numberWithUnsignedInteger:a3];
  int v7 = [v5 containsObject:v6];

  OspreyLoggingInit();
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG)) {
      -[OspreyDeviceAuthentication setCurrentStrategyVersion:]();
    }
    self->_currentStrategyVersion = a3;
    self->_hasCurrentStrategyVersion = 1;
    id v8 = [(OspreyConnectionPreferences *)self->_connectionPreferences deviceAttestionVersion];
    uint64_t v9 = [v8 integerValue];

    if (v9 != self->_currentStrategyVersion)
    {
      OspreyLoggingInit();
      id v10 = OspreyLogContextDeviceAuth;
      if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_DEBUG)) {
        [(OspreyDeviceAuthentication *)(uint64_t *)&self->_currentStrategyVersion setCurrentStrategyVersion:v10];
      }
      [(OspreyConnectionPreferences *)self->_connectionPreferences resetCachedDeviceAttestation];
      [(OspreyPreferences *)self->_allPreferences setConnectionPreferences:self->_connectionPreferences];
      [(OspreyPreferences *)self->_allPreferences synchronize];
    }
  }
  else if (os_log_type_enabled((os_log_t)OspreyLogContextDeviceAuth, OS_LOG_TYPE_ERROR))
  {
    -[OspreyDeviceAuthentication setCurrentStrategyVersion:]();
  }
}

- (unint64_t)authenticationStrategyVersion
{
  return self->_currentStrategyVersion;
}

- (id)_currentStrategy
{
  if (self->_hasCurrentStrategyVersion)
  {
    strategies = self->_strategies;
    v3 = [NSNumber numberWithUnsignedInteger:self->_currentStrategyVersion];
    id v4 = [(NSDictionary *)strategies objectForKey:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)signData:(id)a3 success:(id)a4 failure:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  id v10 = [(OspreyDeviceAuthentication *)self _currentStrategy];
  if (v10)
  {
    v11 = [(OspreyDeviceAuthentication *)self _currentStrategy];
    [v11 signData:v12 success:v8 failure:v9];
  }
  else
  {
    v11 = [MEMORY[0x1E4F28C58] errorWithDomain:@"OspreyDeviceAuthentication" code:1 userInfo:&unk_1F1A036E0];
    v9[2](v9, v11);
  }
}

- (unint64_t)currentStrategyVersion
{
  return self->_currentStrategyVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strategies, 0);
  objc_storeStrong((id *)&self->_allPreferences, 0);

  objc_storeStrong((id *)&self->_connectionPreferences, 0);
}

- (void)setCurrentStrategyVersion:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 136315650;
  id v5 = "-[OspreyDeviceAuthentication setCurrentStrategyVersion:]";
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2048;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_1BEDB4000, log, OS_LOG_TYPE_DEBUG, "%s Purging cache device attestation data due to version mismatch [cached: %lu, current: %lu]", (uint8_t *)&v4, 0x20u);
}

- (void)setCurrentStrategyVersion:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_debug_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_DEBUG, "%s Configuring with device auth version: %lu", (uint8_t *)v1, 0x16u);
}

- (void)setCurrentStrategyVersion:.cold.3()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  v1[0] = 136315394;
  OUTLINED_FUNCTION_0_3();
  _os_log_error_impl(&dword_1BEDB4000, v0, OS_LOG_TYPE_ERROR, "%s Attempted to use unknown device auth version: %lu", (uint8_t *)v1, 0x16u);
}

@end