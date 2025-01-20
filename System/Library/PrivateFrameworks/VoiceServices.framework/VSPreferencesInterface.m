@interface VSPreferencesInterface
+ (VSPreferencesInterface)defaultInstance;
+ (id)dictionaryRepresentationOfVoices:(id)a3;
- (BOOL)OOBNeedsToBeMeasured;
- (NSDate)OOBTriggeredDate;
- (NSDate)lastTTSRequestDate;
- (NSString)deviceUUID;
- (NSUserDefaults)defaults;
- (VSPreferencesInterface)initWithSuiteName:(id)a3;
- (_opaque_pthread_mutex_t)lock;
- (id)subscribedVoicesForClientID:(id)a3 accessoryID:(id)a4;
- (void)dealloc;
- (void)migrateDefaults;
- (void)removeSubscriptionsForAccessory:(id)a3;
- (void)setDefaults:(id)a3;
- (void)setLastTTSRequestDate:(id)a3;
- (void)setLock:(_opaque_pthread_mutex_t *)a3;
- (void)setOOBNeedsToBeMeasured:(BOOL)a3;
- (void)setOOBTriggeredDate:(id)a3;
- (void)setSubscribedVoices:(id)a3 forClientID:(id)a4 accessoryID:(id)a5;
@end

@implementation VSPreferencesInterface

+ (VSPreferencesInterface)defaultInstance
{
  if (defaultInstance_onceToken != -1) {
    dispatch_once(&defaultInstance_onceToken, &__block_literal_global_3035);
  }
  v2 = (void *)defaultInstance_defaultInstance;
  return (VSPreferencesInterface *)v2;
}

- (id)subscribedVoicesForClientID:(id)a3 accessoryID:(id)a4
{
  v56[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"subscribedAssets"];
  id v39 = [MEMORY[0x263EFF980] array];
  v27 = v7;
  if (v7)
  {
    v56[0] = v7;
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:1];
  }
  else
  {
    v9 = [v8 allKeys];
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id obj = v9;
  uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
  if (v32)
  {
    uint64_t v29 = *(void *)v49;
    v30 = v8;
    id v31 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v49 != v29) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void *)(*((void *)&v48 + 1) + 8 * v10);
        v12 = [v8 objectForKey:v11];
        v13 = v12;
        uint64_t v33 = v10;
        if (v6)
        {
          id v54 = v6;
          [MEMORY[0x263EFF8C0] arrayWithObjects:&v54 count:1];
        }
        else
        {
          [v12 allKeys];
        v14 = };
        long long v46 = 0u;
        long long v47 = 0u;
        long long v44 = 0u;
        long long v45 = 0u;
        id v34 = v14;
        uint64_t v37 = [v34 countByEnumeratingWithState:&v44 objects:v53 count:16];
        if (v37)
        {
          uint64_t v35 = *(void *)v45;
          v36 = v13;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v45 != v35) {
                objc_enumerationMutation(v34);
              }
              uint64_t v38 = v15;
              uint64_t v16 = *(void *)(*((void *)&v44 + 1) + 8 * v15);
              long long v40 = 0u;
              long long v41 = 0u;
              long long v42 = 0u;
              long long v43 = 0u;
              v17 = [v13 objectForKeyedSubscript:v16];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v52 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v41 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    v22 = [[VSVoiceAsset alloc] initWithDictionaryRepresentation:*(void *)(*((void *)&v40 + 1) + 8 * i)];
                    v23 = [(VSVoiceAsset *)v22 languages];
                    uint64_t v24 = [v23 count];

                    if (v24)
                    {
                      v25 = [[VSVoiceSubscription alloc] initWithClient:v16 accessory:v11 voice:v22];
                      [v39 addObject:v25];
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v52 count:16];
                }
                while (v19);
              }

              uint64_t v15 = v38 + 1;
              v13 = v36;
            }
            while (v38 + 1 != v37);
            uint64_t v37 = [v34 countByEnumeratingWithState:&v44 objects:v53 count:16];
          }
          while (v37);
        }

        uint64_t v10 = v33 + 1;
        v8 = v30;
        id v6 = v31;
      }
      while (v33 + 1 != v32);
      uint64_t v32 = [obj countByEnumeratingWithState:&v48 objects:v55 count:16];
    }
    while (v32);
  }

  return v39;
}

- (void).cxx_destruct
{
}

- (void)setLock:(_opaque_pthread_mutex_t *)a3
{
  long long v3 = *(_OWORD *)&a3->__sig;
  long long v4 = *(_OWORD *)&a3->__opaque[8];
  long long v5 = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[24] = *(_OWORD *)&a3->__opaque[24];
  *(_OWORD *)&self->_lock.__opaque[40] = v5;
  *(_OWORD *)&self->_lock.__sig = v3;
  *(_OWORD *)&self->_lock.__opaque[8] = v4;
}

- (_opaque_pthread_mutex_t)lock
{
  long long v3 = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[8];
  *(_OWORD *)&retstr->__opaque[8] = v3;
  long long v4 = *(_OWORD *)&self[1].__sig;
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__opaque[40] = v4;
  return self;
}

- (void)setDefaults:(id)a3
{
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (NSString)deviceUUID
{
  long long v3 = [(NSUserDefaults *)self->_defaults stringForKey:@"deviceID"];
  long long v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [MEMORY[0x263F08C38] UUID];
    id v5 = [v6 UUIDString];

    [(NSUserDefaults *)self->_defaults setObject:v5 forKey:@"deviceID"];
  }

  return (NSString *)v5;
}

- (NSDate)lastTTSRequestDate
{
  return (NSDate *)[(NSUserDefaults *)self->_defaults objectForKey:@"lastTTSRequestDate"];
}

- (void)setLastTTSRequestDate:(id)a3
{
}

- (void)setOOBNeedsToBeMeasured:(BOOL)a3
{
}

- (BOOL)OOBNeedsToBeMeasured
{
  return [(NSUserDefaults *)self->_defaults BOOLForKey:@"OOBNeedsToBeMeasured"];
}

- (void)setOOBTriggeredDate:(id)a3
{
}

- (NSDate)OOBTriggeredDate
{
  return (NSDate *)[(NSUserDefaults *)self->_defaults objectForKey:@"OOBTriggeredDate"];
}

- (void)removeSubscriptionsForAccessory:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  pthread_mutex_lock(&self->_lock);
  id v5 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"subscribedAssets"];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = VSGetLogDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412290;
    id v9 = v4;
    _os_log_impl(&dword_20CABC000, v7, OS_LOG_TYPE_DEFAULT, "clearing auto-downloaded voice preferences for accessory %@", (uint8_t *)&v8, 0xCu);
  }

  [v6 setObject:0 forKeyedSubscript:v4];
  [(NSUserDefaults *)self->_defaults setObject:v6 forKey:@"subscribedAssets"];
  pthread_mutex_unlock(&self->_lock);
}

- (void)setSubscribedVoices:(id)a3 forClientID:(id)a4 accessoryID:(id)a5
{
  uint64_t v58 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = +[VSPreferencesInterface dictionaryRepresentationOfVoices:v8];
  pthread_mutex_lock(&self->_lock);
  v12 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"subscribedAssets"];
  v13 = (void *)[v12 mutableCopy];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [MEMORY[0x263EFF9A0] dictionary];
  }
  uint64_t v16 = v15;

  v17 = [v16 objectForKeyedSubscript:v10];
  uint64_t v18 = (void *)[v17 mutableCopy];
  uint64_t v19 = v18;
  if (v18)
  {
    id v20 = v18;
  }
  else
  {
    id v20 = [MEMORY[0x263EFF9A0] dictionary];
  }
  v21 = v20;

  [v21 setObject:v11 forKeyedSubscript:v9];
  [v16 setObject:v21 forKeyedSubscript:v10];
  [(NSUserDefaults *)self->_defaults setObject:v16 forKey:@"subscribedAssets"];
  pthread_mutex_unlock(&self->_lock);
  if (![v10 length]
    && [v9 isEqualToString:@"com.apple.AssistantServices"])
  {
    soft_BYSetupAssistantNeedsToRun();
    if (v22 && ![(VSPreferencesInterface *)self OOBNeedsToBeMeasured])
    {
      [(VSPreferencesInterface *)self setOOBNeedsToBeMeasured:1];
      [(VSPreferencesInterface *)self setOOBTriggeredDate:0];
    }
    else
    {
      soft_BYSetupAssistantNeedsToRun();
      if ((v23 & 1) == 0)
      {
        uint64_t v24 = [v8 firstObject];
        v25 = [(VSPreferencesInterface *)self OOBTriggeredDate];

        if (!v25)
        {
          v26 = VSGetLogEvent();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            v52 = [v24 languages];
            long long v49 = [v52 firstObject];
            [v24 name];
            *(_DWORD *)buf = 138412546;
            v55 = v49;
            v57 = __int16 v56 = 2112;
            v27 = (void *)v57;
            _os_log_impl(&dword_20CABC000, v26, OS_LOG_TYPE_DEFAULT, "OOB subscription start observed with %@ %@", buf, 0x16u);
          }
          v28 = [MEMORY[0x263EFF910] now];
          [(VSPreferencesInterface *)self setOOBTriggeredDate:v28];
        }
        if ([(VSPreferencesInterface *)self OOBNeedsToBeMeasured])
        {
          uint64_t v29 = +[VSMobileAssetsManager sharedManager];
          uint64_t v30 = [v29 preferredDownloadForVoice:v24];
          id v31 = (void *)v30;
          if (v30) {
            uint64_t v32 = (void *)v30;
          }
          else {
            uint64_t v32 = v24;
          }
          id v33 = v32;

          long long v47 = +[VSMobileAssetsManager sharedManager];
          long long v50 = [v33 languages];
          long long v46 = [v50 firstObject];
          [v33 name];
          id v34 = v53 = v33;
          uint64_t v35 = objc_msgSend(v47, "selectVoiceForLang:name:type:gender:footprint:", v46, v34, objc_msgSend(v33, "type"), objc_msgSend(v33, "gender"), objc_msgSend(v33, "footprint"));
          v36 = [v35 voiceData];

          if ([v36 footprint] >= 2)
          {
            long long v48 = [VSDownloadMetrics alloc];
            uint64_t v37 = [v36 name];
            uint64_t v38 = [v36 languages];
            [v38 firstObject];
            id v39 = v51 = v36;
            uint64_t v40 = [v36 gender];
            long long v41 = (void *)v37;
            long long v42 = [(VSDownloadMetrics *)v48 initWithVoiceName:v37 languageCode:v39 gender:v40];

            long long v43 = [MEMORY[0x263F086E0] mainBundle];
            long long v44 = [v43 bundleIdentifier];
            [(VSDownloadMetrics *)v42 setClientBundleIdentifier:v44];

            v36 = v51;
            [(VSDownloadMetrics *)v42 setDownloadSize:&unk_26C1BABA8];
            LODWORD(v45) = 1.0;
            [(VSDownloadMetrics *)v42 setDownloadProgress:v45];
            +[VSAnalytics reportDownloadMetrics:v42];
          }
          uint64_t v24 = v53;
        }
      }
    }
  }
}

- (void)migrateDefaults
{
  id v14 = [(NSUserDefaults *)self->_defaults arrayForKey:@"Auto Downloaded Assets"];
  if (v14)
  {
    long long v3 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"autoDownloadedAssets"];
    id v4 = (void *)[v3 mutableCopy];
    id v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x263EFF9A0] dictionary];
    }
    id v7 = v6;

    [v7 setObject:v14 forKey:@"com.apple.AssistantServices"];
    [(NSUserDefaults *)self->_defaults setObject:v7 forKey:@"autoDownloadedAssets"];
    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"Auto Downloaded Assets"];
  }
  id v8 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"autoDownloadedAssets"];
  if (v8)
  {
    id v9 = [(NSUserDefaults *)self->_defaults dictionaryForKey:@"subscribedAssets"];
    id v10 = (void *)[v9 mutableCopy];
    uint64_t v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x263EFF9A0] dictionary];
    }
    v13 = v12;

    [v13 setObject:v8 forKeyedSubscript:&stru_26C1B0528];
    [(NSUserDefaults *)self->_defaults setObject:v13 forKey:@"subscribedAssets"];
    [(NSUserDefaults *)self->_defaults removeObjectForKey:@"autoDownloadedAssets"];
  }
}

- (void)dealloc
{
  pthread_mutex_destroy(&self->_lock);
  v3.receiver = self;
  v3.super_class = (Class)VSPreferencesInterface;
  [(VSPreferencesInterface *)&v3 dealloc];
}

- (VSPreferencesInterface)initWithSuiteName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)VSPreferencesInterface;
  id v5 = [(VSPreferencesInterface *)&v12 init];
  id v6 = v5;
  if (v5)
  {
    pthread_mutex_init(&v5->_lock, 0);
    if (geteuid() != 501)
    {
      id v7 = VSGetLogDefault();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_error_impl(&dword_20CABC000, v7, OS_LOG_TYPE_ERROR, "process is not running as user Mobile: it won't share the same UserDefaults as voiced", v11, 2u);
      }
    }
    uint64_t v8 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:v4];
    defaults = v6->_defaults;
    v6->_defaults = (NSUserDefaults *)v8;

    [(VSPreferencesInterface *)v6 migrateDefaults];
  }

  return v6;
}

+ (id)dictionaryRepresentationOfVoices:(id)a3
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v3 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v30 objects:v40 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v31;
    *(void *)&long long v5 = 138543618;
    long long v25 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v31 != v7) {
          objc_enumerationMutation(v3);
        }
        id v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "languages", v25);
        uint64_t v11 = [v10 firstObject];

        objc_super v12 = +[VSSpeechSynthesizerPreference availableLanguages];
        char v13 = [v12 containsObject:v11];

        if ((v13 & 1) == 0)
        {
          id v14 = +[VSSpeechSynthesizerPreference fallbackLanguageForLanguage:v11];
          id v39 = v14;
          id v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v39 count:1];
          [v9 setLanguages:v15];

          uint64_t v16 = VSGetLogDefault();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v25;
            v36 = v11;
            __int16 v37 = 2114;
            uint64_t v38 = v14;
            _os_log_impl(&dword_20CABC000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ is not TTS language, fallback to %{public}@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v30 objects:v40 count:16];
    }
    while (v6);
  }
  v17 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v18 = v3;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v18);
        }
        char v23 = [*(id *)(*((void *)&v26 + 1) + 8 * j) dictionaryRepresentation];
        [v17 addObject:v23];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v20);
  }

  return v17;
}

void __41__VSPreferencesInterface_defaultInstance__block_invoke()
{
  v0 = [[VSPreferencesInterface alloc] initWithSuiteName:@"com.apple.voiceservices"];
  v1 = (void *)defaultInstance_defaultInstance;
  defaultInstance_defaultInstance = (uint64_t)v0;
}

@end