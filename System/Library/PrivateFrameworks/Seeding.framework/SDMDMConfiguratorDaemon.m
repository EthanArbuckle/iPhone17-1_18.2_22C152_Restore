@interface SDMDMConfiguratorDaemon
+ (BOOL)isBetaEnrollmentDisabled;
+ (int64_t)applyMDMConfiguration:(id)a3;
+ (int64_t)conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:(id)a3 userIdentifier:(id)a4;
+ (int64_t)enrollWithRequireProgramToken:(id)a3 userIdentifier:(id)a4;
+ (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 userIdentifier:(id)a6 completion:(id)a7;
+ (void)isBetaEnrollmentDisabled;
@end

@implementation SDMDMConfiguratorDaemon

+ (BOOL)isBetaEnrollmentDisabled
{
  id v8 = 0;
  v2 = +[SDPersistence loadMDMConfigurationWithError:&v8];
  id v3 = v8;
  if (v3)
  {
    v4 = +[SDSeedingLogging mdmHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      +[SDMDMConfiguratorDaemon isBetaEnrollmentDisabled];
    }
  }
  else
  {
    if (v2)
    {
      char v5 = [v2 disableBetaEnrollment];
      goto LABEL_7;
    }
    v4 = +[SDSeedingLogging mdmHandle];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_INFO, "No MDM configuration set", v7, 2u);
    }
  }

  char v5 = 0;
LABEL_7:

  return v5;
}

+ (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 userIdentifier:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v15 = (void (**)(id, uint64_t))a7;
  v16 = [[SDMDMConfiguration alloc] initWithPolicy:a5];
  v17 = v16;
  switch(a5)
  {
    case 0:
      [(SDMDMConfiguration *)v16 setRestrictUserPrograms:0];
      [(SDMDMConfiguration *)v17 setDisableBetaEnrollment:0];
      v18 = objc_opt_new();
      [(SDMDMConfiguration *)v17 setTokens:v18];

      goto LABEL_8;
    case 1:
      [(SDMDMConfiguration *)v16 setRestrictUserPrograms:0];
      [(SDMDMConfiguration *)v17 setDisableBetaEnrollment:0];
      goto LABEL_7;
    case 2:
      [(SDMDMConfiguration *)v16 setRestrictUserPrograms:1];
      [(SDMDMConfiguration *)v17 setDisableBetaEnrollment:0];
      if (v13)
      {
        v21 = [MEMORY[0x1E4F1CAD0] setWithObject:v13];
        [(SDMDMConfiguration *)v17 setTokens:v21];

        [a1 enrollWithRequireProgramToken:v13 userIdentifier:v14];
LABEL_12:
        uint64_t v20 = [a1 applyMDMConfiguration:v17];
      }
      else
      {
        if (![v12 count])
        {
          v24 = +[SDSeedingLogging mdmHandle];
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v25 = 0;
            _os_log_impl(&dword_1DD702000, v24, OS_LOG_TYPE_DEFAULT, "Restricting user programs with zero Beta Enrollment tokens.", v25, 2u);
          }
        }
LABEL_7:
        [(SDMDMConfiguration *)v17 setTokens:v12];
LABEL_8:
        uint64_t v20 = [a1 applyMDMConfiguration:v17];
        [a1 conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:v17 userIdentifier:v14];
      }
LABEL_13:
      v15[2](v15, v20);

      return;
    case 3:
      [(SDMDMConfiguration *)v16 setRestrictUserPrograms:1];
      [(SDMDMConfiguration *)v17 setDisableBetaEnrollment:1];
      v22 = objc_opt_new();
      [(SDMDMConfiguration *)v17 setTokens:v22];

      v23 = +[SDDevice _currentDevice];
      [v23 _unenrollWithUserIdentifier:v14];

      goto LABEL_12;
    default:
      v19 = +[SDSeedingLogging mdmHandle];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        +[SDMDMConfiguratorDaemon configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:userIdentifier:completion:](a5, v19);
      }

      uint64_t v20 = 3;
      goto LABEL_13;
  }
}

+ (int64_t)conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:(id)a3 userIdentifier:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 136446210;
    uint64_t v20 = "+[SDMDMConfiguratorDaemon conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:userIdentifier:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v19, 0xCu);
  }

  id v8 = +[SDBetaManager _currentBetaProgram];
  if ([v8 isMDMProgram])
  {
    v9 = [v8 betaEnrollmentToken];
    v10 = +[SDSeedingLogging mdmHandle];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 138543362;
      uint64_t v20 = v9;
      _os_log_impl(&dword_1DD702000, v10, OS_LOG_TYPE_INFO, "Currently enrolled in MDM program with token [%{public}@]", (uint8_t *)&v19, 0xCu);
    }

    if (!v9)
    {
      v11 = +[SDSeedingLogging mdmHandle];
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        +[SDMDMConfiguratorDaemon conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:userIdentifier:](v8, v11);
      }
    }
    id v12 = [v5 tokens];
    char v13 = [v12 containsObject:v9];

    if ((v13 & 1) == 0)
    {
      id v14 = +[SDSeedingLogging mdmHandle];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = [v8 programID];
        v16 = [v8 betaEnrollmentToken];
        int v19 = 134218242;
        uint64_t v20 = (const char *)v15;
        __int16 v21 = 2114;
        v22 = v16;
        _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_DEFAULT, "Currently enrolled MDM program [%lu: %{public}@] not in offered set. Will unenroll.", (uint8_t *)&v19, 0x16u);
      }
      v17 = +[SDDevice _currentDevice];
      [v17 _unenrollWithUserIdentifier:v6];
    }
  }

  return 0;
}

+ (int64_t)applyMDMConfiguration:(id)a3
{
  id v3 = a3;
  v4 = +[SDBetaManager sharedManager];
  [v4 invalidateCache];

  id v5 = +[SDPersistence saveMDMConfiguration:v3];

  if (v5) {
    int64_t v6 = 3;
  }
  else {
    int64_t v6 = 0;
  }

  return v6;
}

+ (int64_t)enrollWithRequireProgramToken:(id)a3 userIdentifier:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136446210;
    *(void *)((char *)&buf + 4) = "+[SDMDMConfiguratorDaemon enrollWithRequireProgramToken:userIdentifier:]";
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v22 = 0x2020000000;
  uint64_t v23 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v9 = +[SDBetaManager sharedManager];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = __72__SDMDMConfiguratorDaemon_enrollWithRequireProgramToken_userIdentifier___block_invoke;
  v18 = &unk_1E6CD8228;
  p_long long buf = &buf;
  v10 = v8;
  int v19 = v10;
  [v9 enrollInProgramWithToken:v5 userIdentifier:v6 shouldSaveToken:0 completion:&v15];

  dispatch_time_t v11 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v10, v11))
  {
    id v12 = +[SDSeedingLogging mdmHandle];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      +[SDMDMConfiguratorDaemon enrollWithRequireProgramToken:userIdentifier:](v12);
    }

    int64_t v13 = 3;
    *(void *)(*((void *)&buf + 1) + 24) = 3;
  }
  else
  {
    int64_t v13 = *(void *)(*((void *)&buf + 1) + 24);
  }

  _Block_object_dispose(&buf, 8);
  return v13;
}

intptr_t __72__SDMDMConfiguratorDaemon_enrollWithRequireProgramToken_userIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (void)isBetaEnrollmentDisabled
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 localizedDescription];
  int v4 = 138543362;
  id v5 = v3;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Failed to load mdm configuration: %{public}@", (uint8_t *)&v4, 0xCu);
}

+ (void)configureWithOfferProgramTokens:(uint64_t)a1 requireProgramToken:(NSObject *)a2 enrollmentPolicy:userIdentifier:completion:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = "Unknown";
  if (a1 == 3) {
    v2 = "AlwaysOff";
  }
  int v3 = 136446210;
  int v4 = v2;
  _os_log_error_impl(&dword_1DD702000, a2, OS_LOG_TYPE_ERROR, "Unknown enrollment policy: [%{public}s]", (uint8_t *)&v3, 0xCu);
}

+ (void)conditionallyUnenrollIfNotMatchingOfferedTokensWithConfig:(void *)a1 userIdentifier:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v3 = 134217984;
  uint64_t v4 = [a1 programID];
  _os_log_fault_impl(&dword_1DD702000, a2, OS_LOG_TYPE_FAULT, "Unexpected nil beta enrollment token for program %lu", (uint8_t *)&v3, 0xCu);
}

+ (void)enrollWithRequireProgramToken:(os_log_t)log userIdentifier:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DD702000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for -[SDBetaManager enrollInProgramWithToken:userIdentifier:completion:]", v1, 2u);
}

@end