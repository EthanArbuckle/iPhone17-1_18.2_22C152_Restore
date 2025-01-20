@interface SDMDMConfigurator
+ (id)loadMDMConfigurationWithError:(id *)a3;
+ (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 error:(id *)a6;
+ (void)enrollInProgramWithMDMToken:(id)a3 completion:(id)a4;
+ (void)resetMDMConfigurationWithError:(id *)a3;
+ (void)setupAssistant_enrollInProgramWithMDMToken:(id)a3 completion:(id)a4;
@end

@implementation SDMDMConfigurator

+ (void)configureWithOfferProgramTokens:(id)a3 requireProgramToken:(id)a4 enrollmentPolicy:(int64_t)a5 error:(id *)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  v11 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a5 > 3) {
      v12 = "Unknown";
    }
    else {
      v12 = off_1E6CD8138[a5];
    }
    *(_DWORD *)buf = 136446723;
    v35 = "+[SDMDMConfigurator configureWithOfferProgramTokens:requireProgramToken:enrollmentPolicy:error:]";
    __int16 v36 = 2113;
    id v37 = v10;
    __int16 v38 = 2082;
    v39 = v12;
    _os_log_impl(&dword_1DD702000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}s requireToken [%{private}@] policy [%{public}s]", buf, 0x20u);
  }

  uint64_t v13 = [v9 count];
  v14 = +[SDSeedingLogging mdmHandle];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_DEFAULT, "offerTokens:", buf, 2u);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    v14 = v9;
    uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v25 = v10;
      int64_t v26 = a5;
      v27 = a6;
      id v28 = v9;
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v14);
          }
          v20 = *(const char **)(*((void *)&v29 + 1) + 8 * i);
          v21 = +[SDSeedingLogging mdmHandle];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v35 = v20;
            _os_log_impl(&dword_1DD702000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@]", buf, 0xCu);
          }
        }
        uint64_t v17 = [v14 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v17);
      a6 = v27;
      id v9 = v28;
      id v10 = v25;
      a5 = v26;
    }
  }
  else if (v15)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DD702000, v14, OS_LOG_TYPE_DEFAULT, "No offer-tokens given.", buf, 2u);
  }

  uint64_t v22 = [v9 count];
  if ((unint64_t)a5 <= 1 && !v10 && !v22)
  {
    v23 = +[SDSeedingLogging mdmHandle];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DD702000, v23, OS_LOG_TYPE_DEFAULT, "Called with parameters matching reset condition.", buf, 2u);
    }
  }
  v24 = +[SDDaemonClient sharedInstance];
  [v24 configureWithOfferProgramTokens:v9 requireProgramToken:v10 enrollmentPolicy:a5 error:a6];
}

+ (void)resetMDMConfigurationWithError:(id *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136446210;
    v8 = "+[SDMDMConfigurator resetMDMConfigurationWithError:]";
    _os_log_impl(&dword_1DD702000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v7, 0xCu);
  }

  v6 = objc_opt_new();
  [a1 configureWithOfferProgramTokens:v6 requireProgramToken:0 enrollmentPolicy:0 error:a3];
}

+ (void)enrollInProgramWithMDMToken:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446467;
    id v10 = "+[SDMDMConfigurator enrollInProgramWithMDMToken:completion:]";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s token [%{private}@]", (uint8_t *)&v9, 0x16u);
  }

  v8 = +[SDDaemonClient sharedInstance];
  [v8 enrollInProgramWithToken:v5 completion:v6];
}

+ (void)setupAssistant_enrollInProgramWithMDMToken:(id)a3 completion:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136446467;
    id v10 = "+[SDMDMConfigurator setupAssistant_enrollInProgramWithMDMToken:completion:]";
    __int16 v11 = 2113;
    id v12 = v5;
    _os_log_impl(&dword_1DD702000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}s token [%{private}@]", (uint8_t *)&v9, 0x16u);
  }

  v8 = +[SDBetaEnrollmentHelper sharedInstance];
  objc_msgSend(v8, "setupAssistant_enrollInProgramWithBetaEnrollmentToken:completion:", v5, v6);
}

+ (id)loadMDMConfigurationWithError:(id *)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = +[SDSeedingLogging mdmHandle];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446210;
    int v9 = "+[SDMDMConfigurator loadMDMConfigurationWithError:]";
    _os_log_impl(&dword_1DD702000, v4, OS_LOG_TYPE_DEFAULT, "[%{public}s", (uint8_t *)&v8, 0xCu);
  }

  id v5 = +[SDDaemonClient sharedInstance];
  id v6 = [v5 loadMDMConfigurationWithError:a3];

  return v6;
}

@end