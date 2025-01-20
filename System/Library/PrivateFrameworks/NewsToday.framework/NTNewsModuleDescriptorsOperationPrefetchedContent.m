@interface NTNewsModuleDescriptorsOperationPrefetchedContent
- (FCNewsAppConfiguration)appConfiguration;
- (FCTodayPrivateData)privateData;
- (NSDictionary)prefetchedHeldRecordsByType;
- (NSDictionary)todayConfigsByRequestID;
- (NTNewsModuleDescriptorsOperationPrefetchedContent)init;
- (NTNewsModuleDescriptorsOperationPrefetchedContent)initWithAppConfiguration:(id)a3 privateData:(id)a4 todayConfigsByRequestID:(id)a5 prefetchedHeldRecordsByType:(id)a6;
@end

@implementation NTNewsModuleDescriptorsOperationPrefetchedContent

- (NTNewsModuleDescriptorsOperationPrefetchedContent)init
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    v2 = (void *)[[NSString alloc] initWithFormat:@"Do not call method"];
    *(_DWORD *)buf = 136315906;
    v8 = "-[NTNewsModuleDescriptorsOperationPrefetchedContent init]";
    __int16 v9 = 2080;
    v10 = "NTNewsModuleDescriptorsOperation.m";
    __int16 v11 = 1024;
    int v12 = 46;
    __int16 v13 = 2114;
    v14 = v2;
    _os_log_error_impl(&dword_22592C000, &_os_log_internal, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);
  }
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF498];
  v5 = [NSString stringWithFormat:@"%@: %s", @"Do not call method", "-[NTNewsModuleDescriptorsOperationPrefetchedContent init]"];
  id v6 = [v3 exceptionWithName:v4 reason:v5 userInfo:0];

  objc_exception_throw(v6);
}

- (NTNewsModuleDescriptorsOperationPrefetchedContent)initWithAppConfiguration:(id)a3 privateData:(id)a4 todayConfigsByRequestID:(id)a5 prefetchedHeldRecordsByType:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (!v10 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR))
  {
    -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:]();
    if (v12) {
      goto LABEL_6;
    }
  }
  else if (v12)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:]();
  }
LABEL_6:
  if (!v13 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_ERROR)) {
    -[NTNewsModuleDescriptorsOperationPrefetchedContent initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:]();
  }
  v24.receiver = self;
  v24.super_class = (Class)NTNewsModuleDescriptorsOperationPrefetchedContent;
  v14 = [(NTNewsModuleDescriptorsOperationPrefetchedContent *)&v24 init];
  if (v14)
  {
    uint64_t v15 = [v10 copy];
    appConfiguration = v14->_appConfiguration;
    v14->_appConfiguration = (FCNewsAppConfiguration *)v15;

    uint64_t v17 = [v11 copy];
    privateData = v14->_privateData;
    v14->_privateData = (FCTodayPrivateData *)v17;

    uint64_t v19 = [v12 copy];
    todayConfigsByRequestID = v14->_todayConfigsByRequestID;
    v14->_todayConfigsByRequestID = (NSDictionary *)v19;

    uint64_t v21 = [v13 copy];
    prefetchedHeldRecordsByType = v14->_prefetchedHeldRecordsByType;
    v14->_prefetchedHeldRecordsByType = (NSDictionary *)v21;
  }
  return v14;
}

- (FCNewsAppConfiguration)appConfiguration
{
  return self->_appConfiguration;
}

- (FCTodayPrivateData)privateData
{
  return self->_privateData;
}

- (NSDictionary)todayConfigsByRequestID
{
  return self->_todayConfigsByRequestID;
}

- (NSDictionary)prefetchedHeldRecordsByType
{
  return self->_prefetchedHeldRecordsByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedHeldRecordsByType, 0);
  objc_storeStrong((id *)&self->_todayConfigsByRequestID, 0);
  objc_storeStrong((id *)&self->_privateData, 0);

  objc_storeStrong((id *)&self->_appConfiguration, 0);
}

- (void)initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "prefetchedHeldRecordsByType");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

- (void)initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "todayConfigsByRequestID");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

- (void)initWithAppConfiguration:privateData:todayConfigsByRequestID:prefetchedHeldRecordsByType:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v0 = objc_msgSend([NSString alloc], "initWithFormat:", @"Invalid parameter not satisfying %s", "appConfiguration");
  v2[0] = 136315906;
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_22592C000, &_os_log_internal, v1, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)v2);
}

@end