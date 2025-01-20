@interface RCConfigurationSettings
- (BOOL)internalUseBackgroundRefreshRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isValid;
- (BOOL)useBackgroundRefreshRate;
- (NSArray)requestInfos;
- (NSString)JSONRepresentation;
- (NSString)bundleID;
- (NSString)description;
- (NSString)internalLoggingKey;
- (NSString)loggingKey;
- (NSString)storefrontID;
- (NSString)userID;
- (RCBackgroundFetchConfiguration)backgroundFetchConfiguration;
- (RCBackgroundFetchConfiguration)internalBackgroundFetchConfiguration;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 backgroundFetchConfiguration:(id)a10 requestMode:(unint64_t)a11 endpointConfig:(id)a12 endpointTimeoutDuration:(double)a13 fallbackTimeoutDuration:(double)a14;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 backgroundFetchConfiguration:(id)a10 requestMode:(unint64_t)a11 endpointTimeoutDuration:(double)a12 fallbackTimeoutDuration:(double)a13;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10 endpointTimeoutDuration:(double)a11;
- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10 endpointTimeoutDuration:(double)a11 fallbackTimeoutDuration:(double)a12;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 requestMode:(unint64_t)a11;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 backgroundFetchConfiguration:(id)a12 requestMode:(unint64_t)a13 endpointConfig:(id)a14 endpointTimeoutDuration:(double)a15 fallbackTimeoutDuration:(double)a16;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 backgroundFetchConfiguration:(id)a12 requestMode:(unint64_t)a13 endpointTimeoutDuration:(double)a14 fallbackTimeoutDuration:(double)a15;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 requestMode:(unint64_t)a12 endpointTimeoutDuration:(double)a13;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 userID:(id)a5 storefrontID:(id)a6 bundleID:(id)a7 deviceInfo:(id)a8;
- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 userID:(id)a5 storefrontID:(id)a6 bundleID:(id)a7 deviceInfo:(id)a8 debugOverrides:(id)a9 backgroundFetchConfiguration:(id)a10;
- (RCDebugOverrides)debugOverrides;
- (RCDebugOverrides)internalDebugOverrides;
- (RCDeviceInfo)deviceInfo;
- (RCEndpointConfig)endpointConfig;
- (RCEndpointConfig)internalEndpointConfig;
- (RCUnfairLock)accessLock;
- (double)endpointTimeoutDuration;
- (double)fallbackTimeoutDuration;
- (double)internalEndpointTimeoutDuration;
- (double)internalFallbackTimeoutDuration;
- (id)applicationStateDescription;
- (id)dictionaryRepresentation;
- (id)fallbackURL;
- (id)requestInfoForRequestCacheKey:(id)a3;
- (unint64_t)applicationState;
- (unint64_t)hash;
- (unint64_t)internalApplicationState;
- (unint64_t)internalRequestMode;
- (unint64_t)requestMode;
- (void)setAccessLock:(id)a3;
- (void)setApplicationState:(unint64_t)a3;
- (void)setBackgroundFetchConfiguration:(id)a3;
- (void)setDebugOverrides:(id)a3;
- (void)setEndpointConfig:(id)a3;
- (void)setEndpointTimeoutDuration:(double)a3;
- (void)setFallbackTimeoutDuration:(double)a3;
- (void)setInternalApplicationState:(unint64_t)a3;
- (void)setInternalBackgroundFetchConfiguration:(id)a3;
- (void)setInternalDebugOverrides:(id)a3;
- (void)setInternalEndpointConfig:(id)a3;
- (void)setInternalEndpointTimeoutDuration:(double)a3;
- (void)setInternalFallbackTimeoutDuration:(double)a3;
- (void)setInternalLoggingKey:(id)a3;
- (void)setInternalRequestMode:(unint64_t)a3;
- (void)setInternalUseBackgroundRefreshRate:(BOOL)a3;
- (void)setLoggingKey:(id)a3;
- (void)setRequestMode:(unint64_t)a3;
- (void)setUseBackgroundRefreshRate:(BOOL)a3;
@end

@implementation RCConfigurationSettings

- (void)setUseBackgroundRefreshRate:(BOOL)a3
{
  v5 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__RCConfigurationSettings_setUseBackgroundRefreshRate___block_invoke;
  v6[3] = &unk_1E5B76CD8;
  v6[4] = self;
  BOOL v7 = a3;
  [v5 performWithLockSync:v6];
}

- (void)setRequestMode:(unint64_t)a3
{
  v5 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__RCConfigurationSettings_setRequestMode___block_invoke;
  v6[3] = &unk_1E5B76088;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performWithLockSync:v6];
}

- (void)setEndpointTimeoutDuration:(double)a3
{
  v5 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__RCConfigurationSettings_setEndpointTimeoutDuration___block_invoke;
  v6[3] = &unk_1E5B76088;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  [v5 performWithLockSync:v6];
}

- (void)setApplicationState:(unint64_t)a3
{
  v5 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__RCConfigurationSettings_setApplicationState___block_invoke;
  v6[3] = &unk_1E5B76088;
  v6[4] = self;
  void v6[5] = a3;
  [v5 performWithLockSync:v6];
}

- (void)setDebugOverrides:(id)a3
{
  id v4 = a3;
  v5 = [(RCConfigurationSettings *)self accessLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RCConfigurationSettings_setDebugOverrides___block_invoke;
  v7[3] = &unk_1E5B75F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v7];
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 requestMode:(unint64_t)a11
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v31 = a10;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.6();
    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.5();
  }
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:].cold.4();
    if (v20) {
      goto LABEL_11;
    }
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:]();
  }
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:]();
  }
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:]();
  }
  v23 = [[RCRequestInfo alloc] initWithRequestKey:v16 responseKey:v17 fallbackURL:v18];
  v24 = [RCConfigurationSettings alloc];
  v33[0] = v23;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  v30 = v16;
  v26 = v25 = v18;
  LOBYTE(v29) = 0;
  v27 = [(RCConfigurationSettings *)v24 initWithRequestInfos:v26 userID:v19 storefrontID:v20 bundleID:v21 deviceInfo:v22 debugOverrides:v31 useBackgroundRefreshRate:1.79769313e308 backgroundFetchConfiguration:1.79769313e308 requestMode:v29 endpointTimeoutDuration:0 fallbackTimeoutDuration:a11];

  return v27;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 backgroundFetchConfiguration:(id)a10 requestMode:(unint64_t)a11 endpointTimeoutDuration:(double)a12 fallbackTimeoutDuration:(double)a13
{
  id v21 = a10;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = a3;
  LOBYTE(v30) = a9;
  v28 = [[RCConfigurationSettings alloc] initWithRequestInfos:v27 userID:v26 storefrontID:v25 bundleID:v24 deviceInfo:v23 debugOverrides:v22 useBackgroundRefreshRate:a12 backgroundFetchConfiguration:a13 requestMode:v30 endpointConfig:v21 endpointTimeoutDuration:a11 fallbackTimeoutDuration:0];

  return v28;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 backgroundFetchConfiguration:(id)a10 requestMode:(unint64_t)a11 endpointConfig:(id)a12 endpointTimeoutDuration:(double)a13 fallbackTimeoutDuration:(double)a14
{
  id v22 = a3;
  id v34 = a4;
  id v23 = a4;
  id v35 = a5;
  id v24 = a5;
  id v36 = a6;
  id v25 = a6;
  id v37 = a7;
  id v26 = a7;
  id v27 = a8;
  id v39 = a10;
  id v38 = a12;
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.5();
    if (v23) {
      goto LABEL_6;
    }
  }
  else if (v23)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.4();
  }
LABEL_6:
  if (!v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]();
    if (v25) {
      goto LABEL_11;
    }
  }
  else if (v25)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
LABEL_11:
  if (!v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
  v40.receiver = self;
  v40.super_class = (Class)RCConfigurationSettings;
  v28 = [(RCConfigurationSettings *)&v40 init];
  uint64_t v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_requestInfos, a3);
    objc_storeStrong((id *)&v29->_userID, v34);
    objc_storeStrong((id *)&v29->_storefrontID, v35);
    objc_storeStrong((id *)&v29->_bundleID, v36);
    objc_storeStrong((id *)&v29->_deviceInfo, v37);
    objc_storeStrong((id *)&v29->_internalDebugOverrides, a8);
    v29->_internalUseBackgroundRefreshRate = a9;
    objc_storeStrong((id *)&v29->_internalBackgroundFetchConfiguration, a10);
    v29->_internalRequestMode = a11;
    objc_storeStrong((id *)&v29->_internalEndpointConfig, a12);
    v29->_internalEndpointTimeoutDuration = a13;
    v29->_internalFallbackTimeoutDuration = a14;
    uint64_t v30 = objc_alloc_init(RCUnfairLock);
    accessLock = v29->_accessLock;
    v29->_accessLock = v30;
  }
  return v29;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_internalEndpointConfig, 0);
  objc_storeStrong((id *)&self->_internalBackgroundFetchConfiguration, 0);
  objc_storeStrong((id *)&self->_internalLoggingKey, 0);
  objc_storeStrong((id *)&self->_internalDebugOverrides, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_storefrontID, 0);
  objc_storeStrong((id *)&self->_userID, 0);

  objc_storeStrong((id *)&self->_requestInfos, 0);
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id obj = a7;
  id v16 = a7;
  if (!v12 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.5();
  }
  id v31 = v13;
  if (!v13 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:].cold.4();
    if (v14) {
      goto LABEL_9;
    }
  }
  else if (v14)
  {
    goto LABEL_9;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:]();
  }
LABEL_9:
  id v17 = v12;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:]();
    if (v16) {
      goto LABEL_14;
    }
  }
  else if (v16)
  {
    goto LABEL_14;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:]();
  }
LABEL_14:
  v36.receiver = self;
  v36.super_class = (Class)RCConfigurationSettings;
  id v18 = [(RCConfigurationSettings *)&v36 init];
  id v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_requestInfos, a3);
    objc_storeStrong((id *)&v19->_userID, a4);
    objc_storeStrong((id *)&v19->_storefrontID, a5);
    objc_storeStrong((id *)&v19->_bundleID, a6);
    objc_storeStrong((id *)&v19->_deviceInfo, obj);
    v19->_internalRequestMode = 2;
    id v20 = objc_alloc_init(RCUnfairLock);
    accessLock = v19->_accessLock;
    v19->_accessLock = v20;

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v22 = v12;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v32 objects:v37 count:16];
    if (v23)
    {
      uint64_t v24 = v23;
      uint64_t v25 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v33 != v25) {
            objc_enumerationMutation(v22);
          }
          id v27 = [*(id *)(*((void *)&v32 + 1) + 8 * i) fallbackURL];

          if (v27)
          {
            v19->_internalRequestMode = 1;
            goto LABEL_25;
          }
        }
        uint64_t v24 = [v22 countByEnumeratingWithState:&v32 objects:v37 count:16];
        if (v24) {
          continue;
        }
        break;
      }
    }
LABEL_25:
  }
  return v19;
}

- (BOOL)useBackgroundRefreshRate
{
  v2 = self;
  uint64_t v6 = 0;
  BOOL v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  v3 = [(RCConfigurationSettings *)self accessLock];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __51__RCConfigurationSettings_useBackgroundRefreshRate__block_invoke;
  v5[3] = &unk_1E5B760D8;
  v5[4] = v2;
  v5[5] = &v6;
  [v3 performWithLockSync:v5];

  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (NSString)storefrontID
{
  return self->_storefrontID;
}

- (id)requestInfoForRequestCacheKey:(id)a3
{
  id v4 = a3;
  v5 = [(RCConfigurationSettings *)self requestInfos];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__RCConfigurationSettings_requestInfoForRequestCacheKey___block_invoke;
  v9[3] = &unk_1E5B76E78;
  id v10 = v4;
  id v6 = v4;
  BOOL v7 = objc_msgSend(v5, "rc_firstObjectPassingTest:", v9);

  return v7;
}

- (NSArray)requestInfos
{
  return self->_requestInfos;
}

uint64_t __57__RCConfigurationSettings_requestInfoForRequestCacheKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 requestCacheKey];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (RCEndpointConfig)endpointConfig
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__RCConfigurationSettings_endpointConfig__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RCEndpointConfig *)v4;
}

- (NSString)userID
{
  return self->_userID;
}

- (RCDebugOverrides)debugOverrides
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__RCConfigurationSettings_debugOverrides__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RCDebugOverrides *)v4;
}

- (unint64_t)requestMode
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__RCConfigurationSettings_requestMode__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

- (RCDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 userID:(id)a5 storefrontID:(id)a6 bundleID:(id)a7 deviceInfo:(id)a8
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id obj = a7;
  id v18 = a7;
  id v28 = a8;
  id v19 = a8;
  if (!v14 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.6();
    if (v15) {
      goto LABEL_6;
    }
  }
  else if (v15)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.5();
  }
LABEL_6:
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:].cold.4();
    if (v17) {
      goto LABEL_11;
    }
  }
  else if (v17)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:]();
  }
LABEL_11:
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:]();
    if (v19) {
      goto LABEL_16;
    }
  }
  else if (v19)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:]();
  }
LABEL_16:
  id v20 = [[RCRequestInfo alloc] initWithRequestKey:v14 responseKey:v15 fallbackURL:0];
  v29.receiver = self;
  v29.super_class = (Class)RCConfigurationSettings;
  id v21 = [(RCConfigurationSettings *)&v29 init];
  if (v21)
  {
    v30[0] = v20;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:1];
    requestInfos = v21->_requestInfos;
    v21->_requestInfos = (NSArray *)v22;

    objc_storeStrong((id *)&v21->_userID, a5);
    objc_storeStrong((id *)&v21->_storefrontID, a6);
    objc_storeStrong((id *)&v21->_bundleID, obj);
    objc_storeStrong((id *)&v21->_deviceInfo, v28);
    uint64_t v24 = objc_alloc_init(RCUnfairLock);
    accessLock = v21->_accessLock;
    v21->_accessLock = v24;

    v21->_internalRequestMode = 2;
  }

  return v21;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    id v6 = (void *)MEMORY[0x1E4FBA8A8];
    uint64_t v7 = [(RCConfigurationSettings *)self requestInfos];
    uint64_t v8 = [v5 requestInfos];
    if (objc_msgSend(v6, "rc_object:isEqualToObject:", v7, v8))
    {
      uint64_t v9 = [(RCConfigurationSettings *)self userID];
      uint64_t v10 = [v5 userID];
      if ([v9 isEqualToString:v10])
      {
        v11 = [(RCConfigurationSettings *)self storefrontID];
        id v12 = [v5 storefrontID];
        if ([v11 isEqualToString:v12])
        {
          v45 = v11;
          id v13 = [(RCConfigurationSettings *)self bundleID];
          uint64_t v43 = [v5 bundleID];
          v44 = v13;
          if (objc_msgSend(v13, "isEqualToString:"))
          {
            id v14 = [(RCConfigurationSettings *)self deviceInfo];
            v41 = [v5 deviceInfo];
            v42 = v14;
            if (objc_msgSend(v14, "isEqual:"))
            {
              id v39 = (void *)MEMORY[0x1E4FBA8A8];
              uint64_t v15 = [(RCConfigurationSettings *)self debugOverrides];
              uint64_t v16 = [v5 debugOverrides];
              id v17 = v39;
              uint64_t v38 = (void *)v16;
              objc_super v40 = (void *)v15;
              if (objc_msgSend(v17, "rc_object:isEqualToObject:", v15)
                && (int v18 = [(RCConfigurationSettings *)self useBackgroundRefreshRate],
                    v18 == [v5 useBackgroundRefreshRate]))
              {
                id v21 = (void *)MEMORY[0x1E4FBA8A8];
                uint64_t v22 = [(RCConfigurationSettings *)self backgroundFetchConfiguration];
                objc_super v36 = [v5 backgroundFetchConfiguration];
                id v37 = (void *)v22;
                if (objc_msgSend(v21, "rc_object:isEqualToObject:", v22)
                  && (unint64_t v23 = [(RCConfigurationSettings *)self requestMode],
                      v23 == [v5 requestMode]))
                {
                  uint64_t v24 = [(RCConfigurationSettings *)self endpointConfig];
                  long long v34 = [v5 endpointConfig];
                  long long v35 = v24;
                  int v25 = objc_msgSend(v24, "isEqual:");
                  id v20 = (void *)v43;
                  id v13 = v44;
                  if (v25
                    && ([(RCConfigurationSettings *)self endpointTimeoutDuration],
                        double v27 = v26,
                        [v5 endpointTimeoutDuration],
                        v27 == v28)
                    && ([(RCConfigurationSettings *)self fallbackTimeoutDuration],
                        double v30 = v29,
                        [v5 fallbackTimeoutDuration],
                        v30 == v31))
                  {
                    unint64_t v32 = [(RCConfigurationSettings *)self applicationState];
                    BOOL v19 = v32 == [v5 applicationState];
                  }
                  else
                  {
                    BOOL v19 = 0;
                  }
                }
                else
                {
                  BOOL v19 = 0;
                  id v20 = (void *)v43;
                  id v13 = v44;
                }
              }
              else
              {
                BOOL v19 = 0;
                id v20 = (void *)v43;
                id v13 = v44;
              }
            }
            else
            {
              BOOL v19 = 0;
              id v20 = (void *)v43;
              id v13 = v44;
            }
          }
          else
          {
            BOOL v19 = 0;
            id v20 = (void *)v43;
          }

          v11 = v45;
        }
        else
        {
          BOOL v19 = 0;
        }
      }
      else
      {
        BOOL v19 = 0;
      }
    }
    else
    {
      BOOL v19 = 0;
    }
  }
  else
  {
    BOOL v19 = 0;
  }

  return v19;
}

- (unint64_t)hash
{
  double v31 = [(RCConfigurationSettings *)self requestInfos];
  uint64_t v3 = [v31 hash];
  double v30 = [(RCConfigurationSettings *)self userID];
  uint64_t v4 = [v30 hash] ^ v3;
  double v29 = [(RCConfigurationSettings *)self storefrontID];
  uint64_t v5 = [v29 hash];
  double v28 = [(RCConfigurationSettings *)self bundleID];
  uint64_t v6 = v4 ^ v5 ^ [v28 hash];
  double v27 = [(RCConfigurationSettings *)self deviceInfo];
  uint64_t v7 = [v27 hash];
  double v26 = [(RCConfigurationSettings *)self debugOverrides];
  uint64_t v8 = v7 ^ [v26 hash];
  int v25 = [(RCConfigurationSettings *)self backgroundFetchConfiguration];
  uint64_t v9 = v6 ^ v8 ^ [v25 hash];
  uint64_t v10 = objc_msgSend(NSNumber, "numberWithBool:", -[RCConfigurationSettings useBackgroundRefreshRate](self, "useBackgroundRefreshRate"));
  uint64_t v11 = v9 ^ [v10 hash];
  id v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCConfigurationSettings requestMode](self, "requestMode"));
  uint64_t v13 = [v12 hash];
  id v14 = [(RCConfigurationSettings *)self endpointConfig];
  uint64_t v15 = v11 ^ v13 ^ [v14 hash];
  uint64_t v16 = NSNumber;
  [(RCConfigurationSettings *)self endpointTimeoutDuration];
  id v17 = objc_msgSend(v16, "numberWithDouble:");
  uint64_t v18 = [v17 hash];
  BOOL v19 = NSNumber;
  [(RCConfigurationSettings *)self fallbackTimeoutDuration];
  id v20 = objc_msgSend(v19, "numberWithDouble:");
  uint64_t v21 = v18 ^ [v20 hash];
  uint64_t v22 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[RCConfigurationSettings applicationState](self, "applicationState"));
  unint64_t v23 = v15 ^ v21 ^ [v22 hash];

  return v23;
}

- (NSString)description
{
  uint64_t v22 = NSString;
  uint64_t v21 = objc_opt_class();
  id v20 = [(RCConfigurationSettings *)self requestInfos];
  BOOL v19 = [(RCConfigurationSettings *)self userID];
  uint64_t v18 = [(RCConfigurationSettings *)self storefrontID];
  uint64_t v3 = [(RCConfigurationSettings *)self bundleID];
  uint64_t v4 = [(RCConfigurationSettings *)self endpointConfig];
  uint64_t v5 = [(RCConfigurationSettings *)self deviceInfo];
  uint64_t v6 = [v5 description];
  uint64_t v7 = [(RCConfigurationSettings *)self debugOverrides];
  uint64_t v8 = [v7 description];
  objc_msgSend(v22, "stringWithFormat:", @"<%@: %p; requestInfos: %@\n userID: %@\n storefrontID: %@\n bundleID: %@\n endpointConfig: %@\n deviceInfo: %@\n debugOverrides: %@\n useBackgroundRefreshRate: %d requestMode: %lu applicationState: %lu",
    v21,
    self,
    v20,
    v19,
    v18,
    v3,
    v4,
    v6,
    v8,
    [(RCConfigurationSettings *)self useBackgroundRefreshRate],
    [(RCConfigurationSettings *)self requestMode],
  uint64_t v9 = [(RCConfigurationSettings *)self applicationState]);

  [(RCConfigurationSettings *)self endpointTimeoutDuration];
  if (v10 != 1.79769313e308)
  {
    [(RCConfigurationSettings *)self endpointTimeoutDuration];
    uint64_t v12 = objc_msgSend(v9, "stringByAppendingFormat:", @" endpointTimeout: %.1f", v11);

    uint64_t v9 = (void *)v12;
  }
  [(RCConfigurationSettings *)self fallbackTimeoutDuration];
  if (v13 != 1.79769313e308)
  {
    [(RCConfigurationSettings *)self fallbackTimeoutDuration];
    uint64_t v15 = objc_msgSend(v9, "stringByAppendingFormat:", @" fallbackTimeout: %.1f", v14);

    uint64_t v9 = (void *)v15;
  }
  uint64_t v16 = [v9 stringByAppendingString:@">"];

  return (NSString *)v16;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v4 = [(RCConfigurationSettings *)self userID];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v4, @"feldsparId");

  uint64_t v5 = [(RCConfigurationSettings *)self storefrontID];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v5, @"storefrontId");

  uint64_t v6 = [(RCConfigurationSettings *)self bundleID];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v6, @"bundleId");

  uint64_t v7 = [(RCConfigurationSettings *)self deviceInfo];
  uint64_t v8 = [v7 dictionaryRepresentation];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v8, @"deviceInfo");

  uint64_t v9 = [(RCConfigurationSettings *)self debugOverrides];
  double v10 = [v9 dictionaryRepresentation];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v10, @"debugOverrides");

  uint64_t v11 = [(RCConfigurationSettings *)self applicationStateDescription];
  objc_msgSend(v3, "rc_safelySetObjectAllowingNil:forKey:", v11, @"applicationState");

  uint64_t v12 = (void *)[v3 copy];

  return v12;
}

- (id)applicationStateDescription
{
  unint64_t v2 = [(RCConfigurationSettings *)self applicationState];
  uint64_t v3 = @"foreground";
  if (v2 != 1) {
    uint64_t v3 = 0;
  }
  if (v2 == 2) {
    return @"background";
  }
  else {
    return v3;
  }
}

- (NSString)JSONRepresentation
{
  unint64_t v2 = (void *)MEMORY[0x1E4F28D90];
  uint64_t v3 = [(RCConfigurationSettings *)self dictionaryRepresentation];
  uint64_t v4 = [v2 dataWithJSONObject:v3 options:0 error:0];

  uint64_t v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];

  return (NSString *)v5;
}

- (BOOL)isValid
{
  uint64_t v3 = [(RCConfigurationSettings *)self requestInfos];
  if (v3)
  {
    uint64_t v4 = [(RCConfigurationSettings *)self userID];
    if (v4)
    {
      uint64_t v5 = [(RCConfigurationSettings *)self storefrontID];
      if (v5)
      {
        uint64_t v6 = [(RCConfigurationSettings *)self bundleID];
        if (v6)
        {
          uint64_t v7 = [(RCConfigurationSettings *)self deviceInfo];
          BOOL v8 = v7 != 0;
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)fallbackURL
{
  unint64_t v2 = [(RCConfigurationSettings *)self requestInfos];
  uint64_t v3 = [v2 firstObject];
  uint64_t v4 = [v3 fallbackURL];

  return v4;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 userID:(id)a5 storefrontID:(id)a6 bundleID:(id)a7 deviceInfo:(id)a8 debugOverrides:(id)a9 backgroundFetchConfiguration:(id)a10
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v31 = a9;
  id v30 = a10;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.6();
    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.5();
  }
LABEL_6:
  if (!v17 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:].cold.4();
    if (v18) {
      goto LABEL_11;
    }
  }
  else if (v18)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:]();
  }
LABEL_11:
  uint64_t v21 = v18;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:]();
  }
  uint64_t v22 = v17;
  unint64_t v23 = v20;
  if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:]();
  }
  uint64_t v24 = [[RCRequestInfo alloc] initWithRequestKey:v15 responseKey:v16 fallbackURL:0];
  int v25 = [RCConfigurationSettings alloc];
  v33[0] = v24;
  double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  LOBYTE(v29) = 0;
  double v27 = [(RCConfigurationSettings *)v25 initWithRequestInfos:v26 userID:v22 storefrontID:v21 bundleID:v19 deviceInfo:v23 debugOverrides:v31 useBackgroundRefreshRate:1.79769313e308 backgroundFetchConfiguration:1.79769313e308 requestMode:v29 endpointTimeoutDuration:v30 fallbackTimeoutDuration:1];

  return v27;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v29 = a10;
  if (!v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.6();
    if (v16) {
      goto LABEL_6;
    }
  }
  else if (v16)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.5();
  }
LABEL_6:
  if (!v18 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:].cold.4();
    if (v19) {
      goto LABEL_11;
    }
  }
  else if (v19)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:]();
  }
LABEL_11:
  if (!v20 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:]();
    if (v21) {
      goto LABEL_16;
    }
  }
  else if (v21)
  {
    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:]();
  }
LABEL_16:
  uint64_t v22 = [[RCRequestInfo alloc] initWithRequestKey:v15 responseKey:v16 fallbackURL:v17];
  unint64_t v23 = [RCConfigurationSettings alloc];
  v31[0] = v22;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  uint64_t v24 = v28 = v17;
  LOBYTE(v27) = 0;
  int v25 = [(RCConfigurationSettings *)v23 initWithRequestInfos:v24 userID:v18 storefrontID:v19 bundleID:v20 deviceInfo:v21 debugOverrides:v29 useBackgroundRefreshRate:1.79769313e308 backgroundFetchConfiguration:1.79769313e308 requestMode:v27 endpointTimeoutDuration:0 fallbackTimeoutDuration:0];

  return v25;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v31 = a10;
  if (!v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.6();
    if (v17) {
      goto LABEL_6;
    }
  }
  else if (v17)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.5();
  }
LABEL_6:
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:].cold.4();
    if (v20) {
      goto LABEL_11;
    }
  }
  else if (v20)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:]();
  }
LABEL_11:
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:]();
  }
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:]();
  }
  unint64_t v23 = [[RCRequestInfo alloc] initWithRequestKey:v16 responseKey:v17 fallbackURL:v18];
  uint64_t v24 = [RCConfigurationSettings alloc];
  v33[0] = v23;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
  id v30 = v16;
  v26 = int v25 = v18;
  LOBYTE(v29) = a11;
  uint64_t v27 = [(RCConfigurationSettings *)v24 initWithRequestInfos:v26 userID:v19 storefrontID:v20 bundleID:v21 deviceInfo:v22 debugOverrides:v31 useBackgroundRefreshRate:1.79769313e308 backgroundFetchConfiguration:1.79769313e308 requestMode:v29 endpointTimeoutDuration:0 fallbackTimeoutDuration:0];

  return v27;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 requestMode:(unint64_t)a12 endpointTimeoutDuration:(double)a13
{
  v38[1] = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v23 = a7;
  id v24 = a8;
  id v25 = a9;
  id v35 = a10;
  if (!v19 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.6();
    if (v20) {
      goto LABEL_6;
    }
  }
  else if (v20)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.5();
  }
LABEL_6:
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:].cold.4();
    if (v23) {
      goto LABEL_11;
    }
  }
  else if (v23)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:]();
  }
LABEL_11:
  if (!v24 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:]();
  }
  objc_super v36 = v24;
  double v26 = v23;
  if (!v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:]();
  }
  uint64_t v27 = [[RCRequestInfo alloc] initWithRequestKey:v19 responseKey:v20 fallbackURL:v21];
  long long v34 = v19;
  double v28 = [RCConfigurationSettings alloc];
  v38[0] = v27;
  [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:1];
  v30 = uint64_t v29 = v21;
  LOBYTE(v33) = a11;
  id v31 = [(RCConfigurationSettings *)v28 initWithRequestInfos:v30 userID:v22 storefrontID:v26 bundleID:v36 deviceInfo:v25 debugOverrides:v35 useBackgroundRefreshRate:a13 backgroundFetchConfiguration:1.79769313e308 requestMode:v33 endpointTimeoutDuration:0 fallbackTimeoutDuration:a12];

  return v31;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 backgroundFetchConfiguration:(id)a12 requestMode:(unint64_t)a13 endpointTimeoutDuration:(double)a14 fallbackTimeoutDuration:(double)a15
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  id v35 = a5;
  id v23 = a6;
  id v24 = a7;
  id v25 = a8;
  id v26 = a9;
  id v34 = a10;
  id v33 = a12;
  if (!v21 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.6();
  }
  if (!v22 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.5();
  }
  if (!v23 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.4();
    if (v24) {
      goto LABEL_12;
    }
  }
  else if (v24)
  {
    goto LABEL_12;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
LABEL_12:
  if (!v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
  if (!v26 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
  uint64_t v27 = [[RCRequestInfo alloc] initWithRequestKey:v21 responseKey:v22 fallbackURL:v35];
  double v28 = [RCConfigurationSettings alloc];
  v37[0] = v27;
  uint64_t v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
  LOBYTE(v32) = a11;
  id v30 = [(RCConfigurationSettings *)v28 initWithRequestInfos:v29 userID:v23 storefrontID:v24 bundleID:v25 deviceInfo:v26 debugOverrides:v34 useBackgroundRefreshRate:a14 backgroundFetchConfiguration:1.79769313e308 requestMode:v32 endpointConfig:v33 endpointTimeoutDuration:a13 fallbackTimeoutDuration:0];

  return v30;
}

- (RCConfigurationSettings)initWithRequestKey:(id)a3 responseKey:(id)a4 fallbackURL:(id)a5 userID:(id)a6 storefrontID:(id)a7 bundleID:(id)a8 deviceInfo:(id)a9 debugOverrides:(id)a10 useBackgroundRefreshRate:(BOOL)a11 backgroundFetchConfiguration:(id)a12 requestMode:(unint64_t)a13 endpointConfig:(id)a14 endpointTimeoutDuration:(double)a15 fallbackTimeoutDuration:(double)a16
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v24 = a4;
  id v39 = a5;
  id v25 = a6;
  id v26 = a7;
  id v27 = a8;
  id v28 = a9;
  id v37 = a10;
  id v36 = a12;
  id v35 = a14;
  if (!v23 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.6();
    if (v24) {
      goto LABEL_6;
    }
  }
  else if (v24)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.5();
  }
LABEL_6:
  if (!v25 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:].cold.4();
    if (v26) {
      goto LABEL_11;
    }
  }
  else if (v26)
  {
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
LABEL_11:
  if (!v27 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
  uint64_t v38 = v26;
  if (!v28 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[RCConfigurationSettings initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:]();
  }
  uint64_t v29 = [[RCRequestInfo alloc] initWithRequestKey:v23 responseKey:v24 fallbackURL:v39];
  id v30 = [RCConfigurationSettings alloc];
  v41[0] = v29;
  id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
  LOBYTE(v33) = a11;
  id v34 = [(RCConfigurationSettings *)v30 initWithRequestInfos:v31 userID:v25 storefrontID:v38 bundleID:v27 deviceInfo:v28 debugOverrides:v37 useBackgroundRefreshRate:a15 backgroundFetchConfiguration:a16 requestMode:v33 endpointConfig:v36 endpointTimeoutDuration:a13 fallbackTimeoutDuration:v35];

  return v34;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  LOBYTE(v22) = 0;
  id v20 = [[RCConfigurationSettings alloc] initWithRequestInfos:v19 userID:v18 storefrontID:v17 bundleID:v16 deviceInfo:v15 debugOverrides:v14 useBackgroundRefreshRate:1.79769313e308 requestMode:1.79769313e308 endpointTimeoutDuration:v22 fallbackTimeoutDuration:0];

  return v20;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9
{
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = a3;
  LOBYTE(v23) = a9;
  id v21 = [[RCConfigurationSettings alloc] initWithRequestInfos:v20 userID:v19 storefrontID:v18 bundleID:v17 deviceInfo:v16 debugOverrides:v15 useBackgroundRefreshRate:1.79769313e308 requestMode:1.79769313e308 endpointTimeoutDuration:v23 fallbackTimeoutDuration:0];

  return v21;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10
{
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  LOBYTE(v24) = a9;
  uint64_t v22 = [[RCConfigurationSettings alloc] initWithRequestInfos:v21 userID:v20 storefrontID:v19 bundleID:v18 deviceInfo:v17 debugOverrides:v16 useBackgroundRefreshRate:1.79769313e308 requestMode:1.79769313e308 endpointTimeoutDuration:v24 fallbackTimeoutDuration:a10];

  return v22;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10 endpointTimeoutDuration:(double)a11
{
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a5;
  id v22 = a4;
  id v23 = a3;
  LOBYTE(v26) = a9;
  uint64_t v24 = [[RCConfigurationSettings alloc] initWithRequestInfos:v23 userID:v22 storefrontID:v21 bundleID:v20 deviceInfo:v19 debugOverrides:v18 useBackgroundRefreshRate:a11 requestMode:1.79769313e308 endpointTimeoutDuration:v26 fallbackTimeoutDuration:a10];

  return v24;
}

- (RCConfigurationSettings)initWithRequestInfos:(id)a3 userID:(id)a4 storefrontID:(id)a5 bundleID:(id)a6 deviceInfo:(id)a7 debugOverrides:(id)a8 useBackgroundRefreshRate:(BOOL)a9 requestMode:(unint64_t)a10 endpointTimeoutDuration:(double)a11 fallbackTimeoutDuration:(double)a12
{
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = a3;
  LOBYTE(v28) = a9;
  uint64_t v26 = [[RCConfigurationSettings alloc] initWithRequestInfos:v25 userID:v24 storefrontID:v23 bundleID:v22 deviceInfo:v21 debugOverrides:v20 useBackgroundRefreshRate:a11 backgroundFetchConfiguration:a12 requestMode:v28 endpointTimeoutDuration:0 fallbackTimeoutDuration:a10];

  return v26;
}

void __45__RCConfigurationSettings_setDebugOverrides___block_invoke(uint64_t a1)
{
}

void __41__RCConfigurationSettings_debugOverrides__block_invoke(uint64_t a1)
{
}

- (void)setLoggingKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RCConfigurationSettings *)self accessLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__RCConfigurationSettings_setLoggingKey___block_invoke;
  v7[3] = &unk_1E5B75F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v7];
}

void __41__RCConfigurationSettings_setLoggingKey___block_invoke(uint64_t a1)
{
}

- (NSString)loggingKey
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__6;
  id v15 = __Block_byref_object_dispose__6;
  id v16 = 0;
  uint64_t v3 = [(RCConfigurationSettings *)self accessLock];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __37__RCConfigurationSettings_loggingKey__block_invoke;
  v10[3] = &unk_1E5B760D8;
  v10[4] = self;
  v10[5] = &v11;
  [v3 performWithLockSync:v10];

  id v4 = (void *)v12[5];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v6 = NSString;
    uint64_t v7 = objc_opt_class();
    id v8 = [(RCConfigurationSettings *)self requestInfos];
    id v5 = [v6 stringWithFormat:@"<%@: %p; requestInfos: %@>", v7, self, v8];
  }
  _Block_object_dispose(&v11, 8);

  return (NSString *)v5;
}

void __37__RCConfigurationSettings_loggingKey__block_invoke(uint64_t a1)
{
}

- (void)setBackgroundFetchConfiguration:(id)a3
{
  id v4 = a3;
  id v5 = [(RCConfigurationSettings *)self accessLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__RCConfigurationSettings_setBackgroundFetchConfiguration___block_invoke;
  v7[3] = &unk_1E5B75F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v7];
}

void __59__RCConfigurationSettings_setBackgroundFetchConfiguration___block_invoke(uint64_t a1)
{
}

- (RCBackgroundFetchConfiguration)backgroundFetchConfiguration
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  double v10 = __Block_byref_object_copy__6;
  uint64_t v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__RCConfigurationSettings_backgroundFetchConfiguration__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (RCBackgroundFetchConfiguration *)v4;
}

void __55__RCConfigurationSettings_backgroundFetchConfiguration__block_invoke(uint64_t a1)
{
}

uint64_t __55__RCConfigurationSettings_setUseBackgroundRefreshRate___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 8) = *(unsigned char *)(result + 40);
  return result;
}

uint64_t __51__RCConfigurationSettings_useBackgroundRefreshRate__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 8);
  return result;
}

uint64_t __42__RCConfigurationSettings_setRequestMode___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 80) = *(void *)(result + 40);
  return result;
}

uint64_t __38__RCConfigurationSettings_requestMode__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)setEndpointConfig:(id)a3
{
  id v4 = a3;
  id v5 = [(RCConfigurationSettings *)self accessLock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__RCConfigurationSettings_setEndpointConfig___block_invoke;
  v7[3] = &unk_1E5B75F80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithLockSync:v7];
}

void __45__RCConfigurationSettings_setEndpointConfig___block_invoke(uint64_t a1)
{
}

void __41__RCConfigurationSettings_endpointConfig__block_invoke(uint64_t a1)
{
}

double __54__RCConfigurationSettings_setEndpointTimeoutDuration___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 96) = result;
  return result;
}

- (double)endpointTimeoutDuration
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__RCConfigurationSettings_endpointTimeoutDuration__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __50__RCConfigurationSettings_endpointTimeoutDuration__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 96);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setFallbackTimeoutDuration:(double)a3
{
  id v5 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __54__RCConfigurationSettings_setFallbackTimeoutDuration___block_invoke;
  v6[3] = &unk_1E5B76088;
  v6[4] = self;
  *(double *)&void v6[5] = a3;
  [v5 performWithLockSync:v6];
}

double __54__RCConfigurationSettings_setFallbackTimeoutDuration___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 104) = result;
  return result;
}

- (double)fallbackTimeoutDuration
{
  uint64_t v7 = 0;
  id v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__RCConfigurationSettings_fallbackTimeoutDuration__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __50__RCConfigurationSettings_fallbackTimeoutDuration__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 104);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __47__RCConfigurationSettings_setApplicationState___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 112) = *(void *)(result + 40);
  return result;
}

- (unint64_t)applicationState
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(RCConfigurationSettings *)self accessLock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__RCConfigurationSettings_applicationState__block_invoke;
  v6[3] = &unk_1E5B760D8;
  v6[4] = self;
  void v6[5] = &v7;
  [v3 performWithLockSync:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __43__RCConfigurationSettings_applicationState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 112);
  return result;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (RCDebugOverrides)internalDebugOverrides
{
  return self->_internalDebugOverrides;
}

- (void)setInternalDebugOverrides:(id)a3
{
}

- (NSString)internalLoggingKey
{
  return self->_internalLoggingKey;
}

- (void)setInternalLoggingKey:(id)a3
{
}

- (RCBackgroundFetchConfiguration)internalBackgroundFetchConfiguration
{
  return self->_internalBackgroundFetchConfiguration;
}

- (void)setInternalBackgroundFetchConfiguration:(id)a3
{
}

- (BOOL)internalUseBackgroundRefreshRate
{
  return self->_internalUseBackgroundRefreshRate;
}

- (void)setInternalUseBackgroundRefreshRate:(BOOL)a3
{
  self->_internalUseBackgroundRefreshRate = a3;
}

- (unint64_t)internalRequestMode
{
  return self->_internalRequestMode;
}

- (void)setInternalRequestMode:(unint64_t)a3
{
  self->_internalRequestMode = a3;
}

- (RCEndpointConfig)internalEndpointConfig
{
  return self->_internalEndpointConfig;
}

- (void)setInternalEndpointConfig:(id)a3
{
}

- (double)internalEndpointTimeoutDuration
{
  return self->_internalEndpointTimeoutDuration;
}

- (void)setInternalEndpointTimeoutDuration:(double)a3
{
  self->_internalEndpointTimeoutDuration = a3;
}

- (double)internalFallbackTimeoutDuration
{
  return self->_internalFallbackTimeoutDuration;
}

- (void)setInternalFallbackTimeoutDuration:(double)a3
{
  self->_internalFallbackTimeoutDuration = a3;
}

- (unint64_t)internalApplicationState
{
  return self->_internalApplicationState;
}

- (void)setInternalApplicationState:(unint64_t)a3
{
  self->_internalApplicationState = a3;
}

- (RCUnfairLock)accessLock
{
  return self->_accessLock;
}

- (void)setAccessLock:(id)a3
{
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestInfos", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:userID:storefrontID:bundleID:deviceInfo:debugOverrides:backgroundFetchConfiguration:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:requestMode:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:requestMode:endpointTimeoutDuration:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"responseKey", v6, 2u);
}

- (void)initWithRequestKey:responseKey:fallbackURL:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.6()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestKey", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.1()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"deviceInfo", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.2()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"bundleID", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.3()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"storefrontID", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.4()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"userID", v6, 2u);
}

- (void)initWithRequestInfos:userID:storefrontID:bundleID:deviceInfo:debugOverrides:useBackgroundRefreshRate:backgroundFetchConfiguration:requestMode:endpointConfig:endpointTimeoutDuration:fallbackTimeoutDuration:.cold.5()
{
  v0 = (void *)[[NSString alloc] initWithFormat:@"Invalid parameter not satisfying %s"];
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_1A4AB3000, MEMORY[0x1E4F14500], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"requestInfos", v6, 2u);
}

@end