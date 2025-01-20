@interface SiriCoreTrialUtilities
+ (BOOL)getBooleanForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5;
+ (id)experimentIdentifiersForTrialProject:(id)a3 trialNamespace:(id)a4;
+ (id)getDirectoryPathForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5;
+ (id)getTriLevelForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5;
+ (id)trialClientForProject:(id)a3;
@end

@implementation SiriCoreTrialUtilities

+ (id)experimentIdentifiersForTrialProject:(id)a3 trialNamespace:(id)a4
{
  id v5 = a4;
  v6 = +[SiriCoreTrialUtilities trialClientForProject:a3];
  v7 = [v6 experimentIdentifiersWithNamespaceName:v5];

  return v7;
}

+ (BOOL)getBooleanForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = +[SiriCoreTrialUtilities getTriLevelForTrialProject:a3 trialNamespace:a4 trialFactor:v7];
  if ([v8 levelOneOfCase] == 10)
  {
    char v9 = [v8 BOOLeanValue];
  }
  else
  {
    v10 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      v11 = v10;
      int v13 = 136315650;
      v14 = "+[SiriCoreTrialUtilities getBooleanForTrialProject:trialNamespace:trialFactor:]";
      __int16 v15 = 2112;
      id v16 = v7;
      __int16 v17 = 1024;
      int v18 = [v8 levelOneOfCase];
      _os_log_impl(&dword_21CBF7000, v11, OS_LOG_TYPE_INFO, "%s TRILevel is not a BOOLean type: %@ %d", (uint8_t *)&v13, 0x1Cu);
    }
    char v9 = 0;
  }

  return v9;
}

+ (id)getDirectoryPathForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v7 = a5;
  v8 = +[SiriCoreTrialUtilities getTriLevelForTrialProject:a3 trialNamespace:a4 trialFactor:v7];
  if ([v8 levelOneOfCase] != 101)
  {
    __int16 v15 = (void *)*MEMORY[0x263F28348];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO)) {
      goto LABEL_8;
    }
    char v9 = v15;
    int v17 = 136315650;
    int v18 = "+[SiriCoreTrialUtilities getDirectoryPathForTrialProject:trialNamespace:trialFactor:]";
    __int16 v19 = 2112;
    id v20 = v7;
    __int16 v21 = 1024;
    int v22 = [v8 levelOneOfCase];
    _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s TRILevel is not a directory type: %@ %d", (uint8_t *)&v17, 0x1Cu);
LABEL_7:

    goto LABEL_8;
  }
  char v9 = [v8 directoryValue];
  if (([v9 hasPath] & 1) == 0) {
    goto LABEL_7;
  }
  v10 = [v8 directoryValue];
  v11 = [v10 path];
  uint64_t v12 = [v11 length];

  if (v12)
  {
    int v13 = [v8 directoryValue];
    v14 = [v13 path];

    goto LABEL_9;
  }
LABEL_8:
  v14 = 0;
LABEL_9:

  return v14;
}

+ (id)getTriLevelForTrialProject:(id)a3 trialNamespace:(id)a4 trialFactor:(id)a5
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = +[SiriCoreTrialUtilities trialClientForProject:v7];
  v11 = v10;
  if (v10)
  {
    uint64_t v12 = [v10 levelForFactor:v9 withNamespaceName:v8];
    int v13 = v12;
    if (v12)
    {
      id v14 = v12;
    }
    else
    {
      id v16 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v18 = 136315394;
        __int16 v19 = "+[SiriCoreTrialUtilities getTriLevelForTrialProject:trialNamespace:trialFactor:]";
        __int16 v20 = 2112;
        id v21 = v9;
        _os_log_impl(&dword_21CBF7000, v16, OS_LOG_TYPE_INFO, "%s No level for factor %@", (uint8_t *)&v18, 0x16u);
      }
    }
  }
  else
  {
    __int16 v15 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v18 = 136315394;
      __int16 v19 = "+[SiriCoreTrialUtilities getTriLevelForTrialProject:trialNamespace:trialFactor:]";
      __int16 v20 = 2112;
      id v21 = v7;
      _os_log_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_INFO, "%s Could not create trial client for project %@", (uint8_t *)&v18, 0x16u);
    }
    int v13 = 0;
  }

  return v13;
}

+ (id)trialClientForProject:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x263F80EB8] projectIdFromName:v3];
  if v4 && (uint64_t v5 = v4, (TRIProject_ProjectId_IsValidValue()))
  {
    v6 = [MEMORY[0x263F80E18] clientWithIdentifier:v5];
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      v10 = *MEMORY[0x263F28348];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
      {
        int v12 = 136315394;
        int v13 = "+[SiriCoreTrialUtilities trialClientForProject:]";
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_impl(&dword_21CBF7000, v10, OS_LOG_TYPE_INFO, "%s Could not create trial client for project %@", (uint8_t *)&v12, 0x16u);
      }
    }
  }
  else
  {
    id v9 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
    {
      int v12 = 136315394;
      int v13 = "+[SiriCoreTrialUtilities trialClientForProject:]";
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_INFO, "%s Could not find TRIProject for %@", (uint8_t *)&v12, 0x16u);
    }
    id v7 = 0;
  }

  return v7;
}

@end