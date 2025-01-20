@interface _LTDANEService
+ (Class)dataProvider;
+ (int64_t)capability;
+ (int64_t)capabilityForSubType:(id)a3 error:(id *)a4;
+ (void)initialize;
+ (void)setDataProvider:(Class)a3;
@end

@implementation _LTDANEService

+ (void)setDataProvider:(Class)a3
{
  _dataProvider = (uint64_t)a3;
}

+ (Class)dataProvider
{
  return (Class)(id)_dataProvider;
}

+ (void)initialize
{
  _dataProvider = objc_opt_class();
  if (_LTIsInternalInstall())
  {
    v2 = (void *)_dataProvider;
    [v2 logCapabilities];
  }
}

+ (int64_t)capability
{
  if (!objc_msgSend((id)objc_msgSend(a1, "dataProvider"), "isAvailable")) {
    return 0;
  }
  v3 = objc_msgSend((id)objc_msgSend(a1, "dataProvider"), "subType");
  uint64_t v7 = 0;
  int64_t v4 = [a1 capabilityForSubType:v3 error:&v7];
  uint64_t v5 = v7;

  if (v5) {
    return 0;
  }
  else {
    return v4;
  }
}

+ (int64_t)capabilityForSubType:(id)a3 error:(id *)a4
{
  id v5 = a3;
  if ([v5 length])
  {
    v6 = +[_LTDConfigurationService aneConfigurationWithError:0];
    uint64_t v7 = [v6 capabilityForSubType:v5];
    if (v7)
    {
      int64_t v8 = v7;
LABEL_4:
      id v9 = 0;
LABEL_22:

      goto LABEL_23;
    }
    v11 = [v5 substringToIndex:1];
    v12 = [v6 subTypes];
    uint64_t v13 = [v12 count];
    if (v13 - 1 < 0)
    {
LABEL_12:
    }
    else
    {
      uint64_t v14 = v13;
      while (1)
      {
        v15 = [v12 objectAtIndex:--v14];
        if ([v15 hasPrefix:v11]) {
          break;
        }

        if (v14 <= 0) {
          goto LABEL_12;
        }
      }
      int64_t v8 = [v6 capabilityForSubType:v15];

      if (v8) {
        goto LABEL_4;
      }
    }
    objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 1, @"Unhandled ANE subtype", 0);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    v16 = _LTOSLogAssets();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      +[_LTDANEService capabilityForSubType:error:]();
      if (a4) {
        goto LABEL_15;
      }
    }
    else if (a4)
    {
LABEL_15:
      id v9 = v9;
      int64_t v8 = 0;
      *a4 = v9;
      goto LABEL_22;
    }
    int64_t v8 = 0;
    goto LABEL_22;
  }
  objc_msgSend(MEMORY[0x263F087E8], "ltd_errorWithCode:description:userInfo:", 1, @"Unhandled ANE subtype", 0);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = _LTOSLogAssets();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    +[_LTDANEService capabilityForSubType:error:]();
    if (a4) {
      goto LABEL_7;
    }
LABEL_19:
    int64_t v8 = 0;
    goto LABEL_23;
  }
  if (!a4) {
    goto LABEL_19;
  }
LABEL_7:
  id v9 = v9;
  int64_t v8 = 0;
  *a4 = v9;
LABEL_23:

  return v8;
}

+ (void)capabilityForSubType:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Invalid ANE subtype, assuming none for %{public}@: %@");
}

+ (void)capabilityForSubType:error:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_2600DC000, v0, v1, "Unhandled ANE subtype, assuming none for %{public}@: %@");
}

@end