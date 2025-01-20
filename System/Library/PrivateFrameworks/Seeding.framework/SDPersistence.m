@interface SDPersistence
+ (id)betaEnrollmentTokensFromOldLocation;
+ (id)containerURL;
+ (id)loadMDMConfigurationWithError:(id *)a3;
+ (id)persistenceDirectory:(BOOL)a3;
+ (id)saveMDMConfiguration:(id)a3;
+ (void)containerURL;
+ (void)deleteBetaEnrollmentTokensFromOldLocations;
+ (void)saveBetaEnrollmentTokens:(id)a3;
@end

@implementation SDPersistence

+ (void)saveBetaEnrollmentTokens:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    v9 = "+[SDPersistence saveBetaEnrollmentTokens:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v8, 0xCu);
  }

  v6 = +[SDMDMConfiguration defaultConfigurationForSetupAssistantFlowWithTokens:v4];

  id v7 = (id)[a1 saveMDMConfiguration:v6];
}

+ (id)betaEnrollmentTokensFromOldLocation
{
  v2 = SeedingDefaults();
  v3 = [v2 arrayForKey:@"BetaEnrollmentTokens"];

  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CAD0] setWithArray:v3];
  }
  else
  {
    v5 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_INFO, "No Beta Enrollment Tokens found in old location", v8, 2u);
    }

    uint64_t v4 = objc_opt_new();
  }
  v6 = (void *)v4;

  return v6;
}

+ (id)saveMDMConfiguration:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    v21 = "+[SDPersistence saveMDMConfiguration:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", buf, 0xCu);
  }

  [a1 deleteBetaEnrollmentTokensFromOldLocations];
  v6 = [a1 persistenceDirectory:1];
  if (v6)
  {
    id v19 = 0;
    id v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v4 requiringSecureCoding:1 error:&v19];
    id v8 = v19;
    if (v8)
    {
      v9 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        +[SDPersistence saveMDMConfiguration:]();
      }

      id v10 = v8;
    }
    else
    {
      v11 = [v6 URLByAppendingPathComponent:@"MDMConfiguration.plist"];
      v12 = [v11 path];
      id v18 = 0;
      [v7 writeToFile:v12 options:1 error:&v18];
      id v10 = v18;

      v13 = +[SDSeedingLogging betaHandle];
      v14 = v13;
      if (v10)
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          +[SDPersistence saveMDMConfiguration:]();
        }

        id v15 = v10;
      }
      else
      {
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v16 = [v11 path];
          *(_DWORD *)buf = 138543362;
          v21 = v16;
          _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_DEFAULT, "Saved [%{public}@]", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    SDGenericError();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

+ (id)loadMDMConfigurationWithError:(id *)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v5 = [a1 betaEnrollmentTokensFromOldLocation];
  if ([v5 count])
  {
    v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = v5;
      _os_log_impl(&dword_1DD702000, v6, OS_LOG_TYPE_DEFAULT, "Migrating beta enrollment tokens from old path with token: [%{public}@]", buf, 0xCu);
    }

    id v7 = +[SDMDMConfiguration defaultConfigurationForSetupAssistantFlowWithTokens:v5];
    id v8 = (id)[a1 saveMDMConfiguration:v7];
    [a1 deleteBetaEnrollmentTokensFromOldLocations];
  }
  else
  {
    v9 = [a1 persistenceDirectory:1];
    id v10 = v9;
    if (v9)
    {
      v11 = [v9 URLByAppendingPathComponent:@"MDMConfiguration.plist"];
      v12 = [MEMORY[0x1E4F28CB8] defaultManager];
      v13 = [v11 path];
      char v14 = [v12 fileExistsAtPath:v13];

      if (v14)
      {
        id v15 = (void *)MEMORY[0x1E4F1C9B8];
        v16 = [v11 path];
        id v31 = 0;
        v17 = [v15 dataWithContentsOfFile:v16 options:0 error:&v31];
        id v18 = v31;

        if (v18)
        {
          id v19 = +[SDSeedingLogging betaHandle];
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
            +[SDPersistence loadMDMConfigurationWithError:]((uint64_t)v18, v19);
          }

          if (a3)
          {
            SDGenericError();
            id v7 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            id v7 = 0;
          }
        }
        else
        {
          id v30 = 0;
          v21 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClass:objc_opt_class() fromData:v17 error:&v30];
          id v22 = v30;
          v23 = +[SDSeedingLogging betaHandle];
          v24 = v23;
          if (v22)
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
              +[SDPersistence loadMDMConfigurationWithError:](v22, v24);
            }

            if (a3)
            {
              SDGenericError();
              id v7 = 0;
              *a3 = (id)objc_claimAutoreleasedReturnValue();
            }
            else
            {
              id v7 = 0;
            }
          }
          else
          {
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              unint64_t v25 = [v21 policy];
              if (v25 > 3) {
                v26 = "Unknown";
              }
              else {
                v26 = off_1E6CD8928[v25];
              }
              v27 = [v21 tokens];
              uint64_t v28 = [v27 count];
              *(_DWORD *)buf = 136446466;
              v33 = v26;
              __int16 v34 = 2048;
              uint64_t v35 = v28;
              _os_log_impl(&dword_1DD702000, v24, OS_LOG_TYPE_DEFAULT, "Loaded MDM configuration: [%{public}s] with [%lu] tokens", buf, 0x16u);
            }
            id v7 = v21;
          }
        }
      }
      else
      {
        id v18 = +[SDSeedingLogging betaHandle];
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DD702000, v18, OS_LOG_TYPE_INFO, "MDM Configuration has not been set", buf, 2u);
        }
        id v7 = 0;
      }
    }
    else
    {
      v20 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DD702000, v20, OS_LOG_TYPE_DEFAULT, "could not load MDM Configuration ", buf, 2u);
      }

      if (a3)
      {
        SDGenericError();
        id v7 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v7 = 0;
      }
    }
  }
  return v7;
}

+ (void)deleteBetaEnrollmentTokensFromOldLocations
{
  SeedingDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 removeObjectForKey:@"BetaEnrollmentTokens"];
}

+ (id)persistenceDirectory:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [a1 containerURL];
  if (!v4)
  {
    v6 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SDPersistence persistenceDirectory:]();
    }
    goto LABEL_12;
  }
  if (v3)
  {
    v5 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v13 = 0;
    [v5 createDirectoryAtURL:v4 withIntermediateDirectories:1 attributes:0 error:&v13];
    v6 = v13;

    if (v6)
    {
      id v7 = +[SDSeedingLogging betaHandle];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        +[SDPersistence persistenceDirectory:]((uint64_t)v6, v7);
      }

LABEL_12:
      v9 = 0;
      goto LABEL_13;
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __38__SDPersistence_persistenceDirectory___block_invoke;
  v11[3] = &unk_1E6CD7D28;
  id v8 = v4;
  v12 = v8;
  if (persistenceDirectory__onceToken != -1) {
    dispatch_once(&persistenceDirectory__onceToken, v11);
  }
  v9 = v8;
  v6 = v12;
LABEL_13:

  return v9;
}

void __38__SDPersistence_persistenceDirectory___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = +[SDSeedingLogging betaHandle];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = [*(id *)(a1 + 32) path];
    int v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1DD702000, v2, OS_LOG_TYPE_DEFAULT, "Seeding directory [%{public}@]", (uint8_t *)&v4, 0xCu);
  }
}

+ (id)containerURL
{
  id v2 = [MEMORY[0x1E4F28CB8] defaultManager];
  BOOL v3 = [v2 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.seeding"];

  if (!v3)
  {
    int v4 = +[SDSeedingLogging betaHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SDPersistence containerURL]();
    }
  }
  return v3;
}

+ (void)saveMDMConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Failed to write MDM configuration to disk", v2, v3, v4, v5, v6);
}

+ (void)saveMDMConfiguration:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Failed to serialize MDM configuration", v2, v3, v4, v5, v6);
}

+ (void)loadMDMConfigurationWithError:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 description];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Failed to deserialize MDM configuration object - %{public}@.", (uint8_t *)&v4, 0xCu);
}

+ (void)loadMDMConfigurationWithError:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v2 = 136446466;
  uint64_t v3 = "+[SDPersistence loadMDMConfigurationWithError:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "[%{public}s] [%{public}@]", (uint8_t *)&v2, 0x16u);
}

+ (void)persistenceDirectory:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Group container URL was null.", v2, v3, v4, v5, v6);
}

+ (void)persistenceDirectory:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Failed to generate persistence directory: [%{public}@]", (uint8_t *)&v2, 0xCu);
}

+ (void)containerURL
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_0_0(&dword_1DD702000, v0, v1, "Could not find group container.", v2, v3, v4, v5, v6);
}

@end