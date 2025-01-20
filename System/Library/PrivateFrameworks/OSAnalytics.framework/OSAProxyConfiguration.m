@interface OSAProxyConfiguration
- (BOOL)isComputeController;
- (BOOL)isComputeNode;
- (BOOL)isConfigEnabled:(id)a3;
- (BOOL)isFile:(id)a3 validForSubmission:(id)a4 reasonableSize:(int64_t)a5 to:(id)a6 internalTypes:(id)a7 result:(const char *)a8;
- (BOOL)isInternalBridge;
- (BOOL)isProxy;
- (BOOL)usesLegacySubmission:(id)a3;
- (NSDictionary)currentTaskingIDByRouting;
- (NSString)automatedContextURL;
- (NSString)automatedDeviceGroup;
- (NSString)awdReporterKey;
- (NSString)buildVersion;
- (NSString)crashReporterKey;
- (NSString)experimentGroup;
- (NSString)identifier;
- (NSString)internalKey;
- (NSString)logPath;
- (NSString)modelCode;
- (NSString)osTrain;
- (NSString)productName;
- (NSString)productNameVersionBuildString;
- (NSString)productVersion;
- (NSString)releaseType;
- (NSString)seedGroup;
- (NSString)systemId;
- (NSString)targetAudience;
- (NSString)uiCountryCode;
- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4;
- (id)description;
- (id)init:(id)a3 fromMetadata:(id)a4;
- (id)initFromPath:(id)a3;
- (id)metadata;
@end

@implementation OSAProxyConfiguration

- (id)init:(id)a3 fromMetadata:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v50.receiver = self;
  v50.super_class = (Class)OSAProxyConfiguration;
  v9 = [(OSAProxyConfiguration *)&v50 init];
  if (!v9) {
    goto LABEL_14;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:@"path"];
  logPath = v9->_logPath;
  v9->_logPath = (NSString *)v10;

  objc_storeStrong((id *)&v9->_identifier, a3);
  uint64_t v12 = [v8 objectForKeyedSubscript:@"machine_config"];
  modelCode = v9->_modelCode;
  v9->_modelCode = (NSString *)v12;

  uint64_t v14 = [v8 objectForKeyedSubscript:@"product_version"];
  productVersion = v9->_productVersion;
  v9->_productVersion = (NSString *)v14;

  uint64_t v16 = [v8 objectForKeyedSubscript:@"os_train"];
  osTrain = v9->_osTrain;
  v9->_osTrain = (NSString *)v16;

  uint64_t v18 = [v8 objectForKeyedSubscript:@"target_audience"];
  targetAudience = v9->_targetAudience;
  v9->_targetAudience = (NSString *)v18;

  uint64_t v20 = [v8 objectForKeyedSubscript:@"os_version"];
  buildVersion = v9->_buildVersion;
  v9->_buildVersion = (NSString *)v20;

  uint64_t v22 = [v8 objectForKeyedSubscript:@"UI_country_code"];
  uiCountryCode = v9->_uiCountryCode;
  v9->_uiCountryCode = (NSString *)v22;

  uint64_t v24 = [v8 objectForKeyedSubscript:@"system_ID"];
  systemId = v9->_systemId;
  v9->_systemId = (NSString *)v24;

  uint64_t v26 = [v8 objectForKeyedSubscript:@"crashreporter_key"];
  crashReporterKey = v9->_crashReporterKey;
  v9->_crashReporterKey = (NSString *)v26;

  uint64_t v28 = [v8 objectForKeyedSubscript:@"awd_device_ID"];
  awdReporterKey = v9->_awdReporterKey;
  v9->_awdReporterKey = (NSString *)v28;

  uint64_t v30 = [v8 objectForKeyedSubscript:@"internal_key"];
  internalKey = v9->_internalKey;
  v9->_internalKey = (NSString *)v30;

  uint64_t v32 = [v8 objectForKeyedSubscript:@"release_type"];
  releaseType = v9->_releaseType;
  v9->_releaseType = (NSString *)v32;

  uint64_t v34 = [v8 objectForKeyedSubscript:@"SeedGroup"];
  seedGroup = v9->_seedGroup;
  v9->_seedGroup = (NSString *)v34;

  uint64_t v36 = [v8 objectForKeyedSubscript:@"ExperimentGroup"];
  experimentGroup = v9->_experimentGroup;
  v9->_experimentGroup = (NSString *)v36;

  uint64_t v38 = [v8 objectForKeyedSubscript:@"AutomatedDeviceGroup"];
  automatedDeviceGroup = v9->_automatedDeviceGroup;
  v9->_automatedDeviceGroup = (NSString *)v38;

  uint64_t v40 = [v8 objectForKeyedSubscript:@"AutomatedContextURL"];
  automatedContextURL = v9->_automatedContextURL;
  v9->_automatedContextURL = (NSString *)v40;

  uint64_t v42 = [v8 objectForKeyedSubscript:@"currentTaskingIDByRouting"];
  currentTaskingIDByRouting = v9->_currentTaskingIDByRouting;
  v9->_currentTaskingIDByRouting = (NSDictionary *)v42;

  v44 = [v8 objectForKeyedSubscript:@"isComputeController"];
  v9->_isComputeController = [v44 BOOLValue];

  if (!v9->_osTrain)
  {
    v9->_osTrain = (NSString *)@"<unknown>";
  }
  if (!v9->_targetAudience)
  {
    v9->_targetAudience = (NSString *)@"<unknown>";
  }
  uint64_t v45 = [NSString stringWithFormat:@"%@ (%@)", v9->_osTrain, v9->_buildVersion];
  productNameVersionBuildString = v9->_productNameVersionBuildString;
  v9->_productNameVersionBuildString = (NSString *)v45;

  if ([(NSString *)v9->_modelCode length]
    && [(NSString *)v9->_productVersion length]
    && [(NSString *)v9->_buildVersion length]
    && [(NSString *)v9->_uiCountryCode length]
    && [(NSString *)v9->_crashReporterKey length])
  {
    if ([(NSString *)v9->_releaseType length]) {
      v47 = v9;
    }
    else {
      v47 = 0;
    }
  }
  else
  {
LABEL_14:
    v47 = 0;
  }
  v48 = v47;

  return v48;
}

- (id)initFromPath:(id)a3
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1C9E8];
  v6 = [v4 stringByAppendingPathComponent:@"deviceMetadata.proxy"];
  id v7 = [v5 dictionaryWithContentsOfFile:v6];

  id v8 = [v4 lastPathComponent];
  v9 = [(OSAProxyConfiguration *)self init:v8 fromMetadata:v7];

  if (v9)
  {
    uint64_t v10 = [v4 copy];
    v11 = (void *)v9[1];
    v9[1] = v10;
  }
  return v9;
}

- (BOOL)isProxy
{
  return 1;
}

- (BOOL)isInternalBridge
{
  return [(NSString *)self->_logPath containsString:@"Bridge"];
}

- (id)assembleMetadataAt:(double)a3 withOptions:(unsigned int)a4
{
  char v4 = a4;
  double v5 = a3;
  v30[2] = *MEMORY[0x1E4F143B8];
  if ((a4 & 4) != 0) {
    a3 = OSATimeIntervalApproximate(a3);
  }
  id v7 = OSADateFormat(5u, a3);
  id v8 = [MEMORY[0x1E4F1CA60] dictionary];
  v9 = NSNumber;
  if ((v4 & 4) != 0) {
    double v5 = OSATimeIntervalApproximate(v5);
  }
  uint64_t v10 = [v9 numberWithDouble:v5];
  [v8 setObject:v10 forKey:@"submissionTime"];

  [v8 setObject:v7 forKey:@"submissionTimeISO"];
  v11 = [(OSAProxyConfiguration *)self releaseType];
  [v8 setValue:v11 forKey:@"release_type"];

  uint64_t v12 = [(OSAProxyConfiguration *)self modelCode];
  [v8 setValue:v12 forKey:@"machine_config"];

  v13 = [(OSAProxyConfiguration *)self automatedDeviceGroup];
  [v8 setValue:v13 forKey:@"AutomatedDeviceGroup"];

  uint64_t v14 = [(OSAProxyConfiguration *)self automatedContextURL];
  [v8 setValue:v14 forKey:@"AutomatedContextURL"];

  v15 = [(OSAProxyConfiguration *)self seedGroup];
  [v8 setValue:v15 forKey:@"SeedGroup"];

  uint64_t v16 = [(OSAProxyConfiguration *)self experimentGroup];
  [v8 setValue:v16 forKey:@"ExperimentGroup"];

  v17 = [(OSAProxyConfiguration *)self internalKey];
  [v8 setValue:v17 forKey:@"internal_key"];

  if ([(OSAProxyConfiguration *)self isComputeController]) {
    [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isComputeController"];
  }
  if (v4)
  {
    [v8 setValue:0 forKey:@"crashreporter_key"];
    if ((v4 & 2) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v18 = [(OSAProxyConfiguration *)self crashReporterKey];
    [v8 setValue:v18 forKey:@"crashreporter_key"];

    if ((v4 & 2) != 0)
    {
LABEL_9:
      [v8 setValue:0 forKey:@"system_ID"];
      goto LABEL_12;
    }
  }
  v19 = [(OSAProxyConfiguration *)self systemId];
  [v8 setValue:v19 forKey:@"system_ID"];

LABEL_12:
  if ([(OSAProxyConfiguration *)self isProxy])
  {
    uint64_t v20 = +[OSASystemConfiguration sharedInstance];
    v29[0] = @"os_version";
    v21 = [v20 productNameVersionBuildString];
    v29[1] = @"machine_config";
    v30[0] = v21;
    uint64_t v22 = [v20 modelCode];
    v30[1] = v22;
    v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:v29 count:2];
    uint64_t v24 = (void *)[v23 mutableCopy];

    if ([v20 appleInternal])
    {
      v25 = [v20 crashReporterKey];
      [v24 setObject:v25 forKey:@"crashreporter_key"];

      uint64_t v26 = [v20 automatedDeviceGroup];
      [v24 setValue:v26 forKey:@"AutomatedDeviceGroup"];

      v27 = [v20 internalKey];
      [v24 setValue:v27 forKey:@"internal_key"];
    }
    [v8 setValue:v24 forKey:@"proxyingDevice"];
  }
  return v8;
}

- (id)metadata
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char v4 = [(OSAProxyConfiguration *)self modelCode];
  [v3 setObject:v4 forKeyedSubscript:@"machine_config"];

  double v5 = [(OSAProxyConfiguration *)self productVersion];
  [v3 setObject:v5 forKeyedSubscript:@"product_version"];

  v6 = [(OSAProxyConfiguration *)self osTrain];
  [v3 setObject:v6 forKeyedSubscript:@"os_train"];

  id v7 = [(OSAProxyConfiguration *)self targetAudience];
  [v3 setObject:v7 forKeyedSubscript:@"target_audience"];

  id v8 = [(OSAProxyConfiguration *)self buildVersion];
  [v3 setObject:v8 forKeyedSubscript:@"os_version"];

  v9 = [(OSAProxyConfiguration *)self uiCountryCode];
  [v3 setObject:v9 forKeyedSubscript:@"UI_country_code"];

  uint64_t v10 = [(OSAProxyConfiguration *)self systemId];
  [v3 setObject:v10 forKeyedSubscript:@"system_ID"];

  v11 = [(OSAProxyConfiguration *)self crashReporterKey];
  [v3 setObject:v11 forKeyedSubscript:@"crashreporter_key"];

  uint64_t v12 = [(OSAProxyConfiguration *)self awdReporterKey];
  [v3 setObject:v12 forKeyedSubscript:@"awd_device_ID"];

  v13 = [(OSAProxyConfiguration *)self internalKey];
  [v3 setObject:v13 forKeyedSubscript:@"internal_key"];

  uint64_t v14 = [(OSAProxyConfiguration *)self releaseType];
  [v3 setObject:v14 forKeyedSubscript:@"release_type"];

  if ([(OSAProxyConfiguration *)self isComputeController]) {
    [v3 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"isComputeController"];
  }
  v15 = [(OSAProxyConfiguration *)self seedGroup];
  [v3 setValue:v15 forKey:@"SeedGroup"];

  uint64_t v16 = [(OSAProxyConfiguration *)self experimentGroup];
  [v3 setValue:v16 forKey:@"ExperimentGroup"];

  v17 = [(OSAProxyConfiguration *)self automatedDeviceGroup];
  [v3 setValue:v17 forKey:@"AutomatedDeviceGroup"];

  uint64_t v18 = [(OSAProxyConfiguration *)self automatedContextURL];
  [v3 setValue:v18 forKey:@"AutomatedContextURL"];

  v19 = [(OSAProxyConfiguration *)self currentTaskingIDByRouting];
  [v3 setValue:v19 forKey:@"currentTaskingIDByRouting"];

  return v3;
}

- (id)description
{
  v2 = (void *)MEMORY[0x1E4F28D90];
  v3 = [(OSAProxyConfiguration *)self metadata];
  char v4 = [v2 dataWithJSONObject:v3 options:0 error:0];

  double v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  return v5;
}

- (BOOL)usesLegacySubmission:(id)a3
{
  return 0;
}

- (BOOL)isConfigEnabled:(id)a3
{
  id v3 = a3;
  char v4 = [v3 objectForKeyedSubscript:@"eOS"];
  if (v4)
  {
    double v5 = [v3 objectForKeyedSubscript:@"eOS"];
    char v6 = [v5 BOOLValue];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (BOOL)isFile:(id)a3 validForSubmission:(id)a4 reasonableSize:(int64_t)a5 to:(id)a6 internalTypes:(id)a7 result:(const char *)a8
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (!a8) {
    -[OSAProxyConfiguration isFile:validForSubmission:reasonableSize:to:internalTypes:result:]();
  }
  uint64_t v18 = v17;
  *a8 = 0;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v19 = [v15 stringValue];

    id v15 = (id)v19;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v15 length])
  {
    uint64_t v20 = +[OSASystemConfiguration sharedInstance];
    if ([v20 appleInternal])
    {
      int v21 = [v18 containsObject:v15];

      if (v21)
      {
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v48 = v14;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%@' allowed for submission for testing", buf, 0xCu);
        }
        int v22 = 1;
        goto LABEL_62;
      }
    }
    else
    {
    }
    int64_t v46 = a5;
    uint64_t v24 = +[OSASystemConfiguration sharedInstance];
    v25 = [v24 getLogBlacklist];
    int v26 = [v25 containsObject:v15];

    if (v26)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543362;
        id v48 = v14;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Logfile '%{public}@' blacklisted from submission", buf, 0xCu);
      }
      int v22 = 0;
      *a8 = "rejected-blacklist";
      goto LABEL_62;
    }
    v27 = +[OSASystemConfiguration sharedInstance];
    uint64_t v28 = [v27 getPropsForLogType:v15];

    if (!v28)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v14;
        __int16 v49 = 2114;
        unint64_t v50 = (unint64_t)v15;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%{public}@' invalid for submission: unknown type %{public}@", buf, 0x16u);
      }
      uint64_t v32 = "rejected-unregistered";
      goto LABEL_60;
    }
    if (![(OSAProxyConfiguration *)self isConfigEnabled:v28])
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        id v48 = v14;
        __int16 v49 = 2114;
        unint64_t v50 = (unint64_t)v15;
        _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%{public}@' type %{public}@ invalid for platform", buf, 0x16u);
      }
      uint64_t v32 = "rejected-platform";
      goto LABEL_60;
    }
    if ([v16 isEqualToString:@"<transfer>"])
    {
      v29 = [v28 objectForKeyedSubscript:@"disabled"];
      unint64_t v30 = v46;
      if (!v29)
      {
        v31 = [v28 objectForKeyedSubscript:@"watchSync"];

        if (!v31) {
          goto LABEL_51;
        }
LABEL_41:
        int v22 = 1;
LABEL_52:
        uint64_t v42 = [v28 objectForKeyedSubscript:@"limit"];
        int v43 = [v42 intValue];

        if (v43) {
          int v44 = v43;
        }
        else {
          int v44 = 0x100000;
        }
        if (!v22 || v44 >= v30) {
          goto LABEL_61;
        }
        if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          id v48 = v14;
          __int16 v49 = 2048;
          unint64_t v50 = v30;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Logfile '%{public}@' is too large (%lld) for submission", buf, 0x16u);
        }
        uint64_t v32 = "rejected-size";
LABEL_60:
        int v22 = 0;
        *a8 = v32;
LABEL_61:

LABEL_62:
        BOOL v23 = v22 != 0;
        goto LABEL_63;
      }
    }
    else
    {
      int v33 = [v16 isEqualToString:@"<sync>"];
      uint64_t v34 = [v28 objectForKeyedSubscript:@"disabled"];
      v29 = (void *)v34;
      unint64_t v30 = v46;
      if (!v33)
      {
        if (v34)
        {
          BOOL v35 = 0;
        }
        else
        {
          v37 = +[OSASystemConfiguration sharedInstance];
          if ([v37 appleInternal])
          {
            BOOL v35 = 1;
          }
          else
          {
            v39 = [v28 objectForKeyedSubscript:@"gm"];
            BOOL v35 = v39 != 0;
          }
        }

        uint64_t v40 = [v28 objectForKeyedSubscript:@"routing"];
        if (v40) {
          v41 = (__CFString *)v40;
        }
        else {
          v41 = @"da3";
        }
        if (([(__CFString *)v41 isEqualToString:v16] & 1) == 0
          && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138544130;
          id v48 = v14;
          __int16 v49 = 2114;
          unint64_t v50 = (unint64_t)v15;
          __int16 v51 = 2114;
          id v52 = v16;
          __int16 v53 = 2114;
          v54 = v41;
          _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Warning: Logfile '%{public}@' type %{public}@ routing %{public}@ does not match config %{public}@", buf, 0x2Au);
        }

        if (!v35) {
          goto LABEL_51;
        }
        goto LABEL_41;
      }
      if (!v34)
      {
        uint64_t v36 = +[OSASystemConfiguration sharedInstance];
        if ([v36 appleInternal])
        {

          goto LABEL_41;
        }
        uint64_t v38 = [v28 objectForKeyedSubscript:@"gm"];

        if (v38) {
          goto LABEL_41;
        }
LABEL_51:
        int v22 = 0;
        *a8 = "rejected-config";
        goto LABEL_52;
      }
    }

    goto LABEL_51;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v48 = v14;
    _os_log_impl(&dword_1A7C6D000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Logfile '%{public}@' invalid for submission: no type", buf, 0xCu);
  }
  BOOL v23 = 0;
  *a8 = "rejected-invalid";
LABEL_63:

  return v23;
}

- (NSString)logPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)modelCode
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)productVersion
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSString)buildVersion
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)osTrain
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)productName
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (NSString)productNameVersionBuildString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)targetAudience
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (NSString)uiCountryCode
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (NSString)systemId
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (NSString)internalKey
{
  return (NSString *)objc_getProperty(self, a2, 136, 1);
}

- (NSString)crashReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (NSString)awdReporterKey
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (NSString)releaseType
{
  return (NSString *)objc_getProperty(self, a2, 144, 1);
}

- (NSString)seedGroup
{
  return (NSString *)objc_getProperty(self, a2, 152, 1);
}

- (NSString)experimentGroup
{
  return (NSString *)objc_getProperty(self, a2, 160, 1);
}

- (NSString)automatedDeviceGroup
{
  return (NSString *)objc_getProperty(self, a2, 168, 1);
}

- (NSString)automatedContextURL
{
  return (NSString *)objc_getProperty(self, a2, 176, 1);
}

- (BOOL)isComputeController
{
  return self->_isComputeController;
}

- (BOOL)isComputeNode
{
  return self->_isComputeNode;
}

- (NSDictionary)currentTaskingIDByRouting
{
  return (NSDictionary *)objc_getProperty(self, a2, 184, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTaskingIDByRouting, 0);
  objc_storeStrong((id *)&self->_automatedContextURL, 0);
  objc_storeStrong((id *)&self->_automatedDeviceGroup, 0);
  objc_storeStrong((id *)&self->_experimentGroup, 0);
  objc_storeStrong((id *)&self->_seedGroup, 0);
  objc_storeStrong((id *)&self->_releaseType, 0);
  objc_storeStrong((id *)&self->_internalKey, 0);
  objc_storeStrong((id *)&self->_awdReporterKey, 0);
  objc_storeStrong((id *)&self->_crashReporterKey, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_systemId, 0);
  objc_storeStrong((id *)&self->_uiCountryCode, 0);
  objc_storeStrong((id *)&self->_productReleaseString, 0);
  objc_storeStrong((id *)&self->_productNameVersionBuildString, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_productBuildString, 0);
  objc_storeStrong((id *)&self->_osTrain, 0);
  objc_storeStrong((id *)&self->_buildVersion, 0);
  objc_storeStrong((id *)&self->_targetAudience, 0);
  objc_storeStrong((id *)&self->_productVersion, 0);
  objc_storeStrong((id *)&self->_modelCode, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logPath, 0);
}

- (void)isFile:validForSubmission:reasonableSize:to:internalTypes:result:.cold.1()
{
}

@end