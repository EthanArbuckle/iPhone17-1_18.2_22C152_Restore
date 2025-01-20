@interface NDAppConfigAnalyticsPayloadAssemblerConfigProvider
- (FCNewsAppConfigurationManager)appConfigurationManager;
- (NDAppConfigAnalyticsPayloadAssemblerConfigProvider)init;
- (NDAppConfigAnalyticsPayloadAssemblerConfigProvider)initWithAppConfigurationManager:(id)a3;
- (void)fetchConfigWithCompletion:(id)a3;
- (void)setAppConfigurationManager:(id)a3;
@end

@implementation NDAppConfigAnalyticsPayloadAssemblerConfigProvider

- (NDAppConfigAnalyticsPayloadAssemblerConfigProvider)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NDAppConfigAnalyticsPayloadAssemblerConfigProvider init]";
    __int16 v9 = 2080;
    v10 = "NDAppConfigAnalyticsPayloadAssemblerConfigProvider.m";
    __int16 v11 = 1024;
    int v12 = 24;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NDAppConfigAnalyticsPayloadAssemblerConfigProvider init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NDAppConfigAnalyticsPayloadAssemblerConfigProvider)initWithAppConfigurationManager:(id)a3
{
  id v5 = a3;
  if (!v5 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider initWithAppConfigurationManager:]();
  }
  v9.receiver = self;
  v9.super_class = (Class)NDAppConfigAnalyticsPayloadAssemblerConfigProvider;
  id v6 = [(NDAppConfigAnalyticsPayloadAssemblerConfigProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_appConfigurationManager, a3);
  }

  return v7;
}

- (void)fetchConfigWithCompletion:(id)a3
{
  id v4 = a3;
  if (!v4 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NDAppConfigAnalyticsPayloadAssemblerConfigProvider fetchConfigWithCompletion:]();
  }
  id v5 = [(NDAppConfigAnalyticsPayloadAssemblerConfigProvider *)self appConfigurationManager];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __80__NDAppConfigAnalyticsPayloadAssemblerConfigProvider_fetchConfigWithCompletion___block_invoke;
  v7[3] = &unk_264538D70;
  id v8 = v4;
  id v6 = v4;
  [v5 fetchAppConfigurationIfNeededWithCompletion:v7];
}

void __80__NDAppConfigAnalyticsPayloadAssemblerConfigProvider_fetchConfigWithCompletion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v6 = a2;
  if (a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = [v6 analyticsEnvelopeContentTypeConfigsForEnvironment:FCDefaultsReadEndpointEnvironment()];
    (*(void (**)(void, void *, uint64_t, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v5, [v6 analyticsEndpointMaxPayloadSize], 0);
  }
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (void)setAppConfigurationManager:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)initWithAppConfigurationManager:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfigurationManager");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NDAppConfigAnalyticsPayloadAssemblerConfigProvider initWithAppConfigurationManager:]";
  __int16 v3 = 2080;
  id v4 = "NDAppConfigAnalyticsPayloadAssemblerConfigProvider.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

- (void)fetchConfigWithCompletion:.cold.1()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "completion");
  *(_DWORD *)buf = 136315906;
  v2 = "-[NDAppConfigAnalyticsPayloadAssemblerConfigProvider fetchConfigWithCompletion:]";
  __int16 v3 = 2080;
  id v4 = "NDAppConfigAnalyticsPayloadAssemblerConfigProvider.m";
  __int16 v5 = 1024;
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_21FDD6000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
}

@end