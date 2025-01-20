@interface SSQueryIntentManagerConfig
+ (id)_getParsecDomainMapping;
+ (id)_parseServerDomainExclusionSet:(id)a3;
+ (id)sharedInstance;
- (BOOL)expired;
- (BOOL)getBoolParameter:(id)a3;
- (NSDictionary)config;
- (NSSet)serverDomainDemotionExclusionSet;
- (id)_defaultOptions;
- (int)getIntParameter:(id)a3;
- (void)_clearConfig;
- (void)_updateInternalConfig:(id)a3;
- (void)update;
- (void)update:(BOOL)a3;
- (void)updateWithResources:(id)a3 defaults:(id)a4;
@end

@implementation SSQueryIntentManagerConfig

- (void)_clearConfig
{
  baseConfig = self->_baseConfig;
  self->_baseConfig = 0;

  resources = self->_resources;
  self->_resources = 0;

  self->_serverDomainDemotionExclusionSet = [MEMORY[0x1E4F1CAD0] setWithArray:MEMORY[0x1E4F1CBF0]];
  MEMORY[0x1F41817F8]();
}

- (BOOL)getBoolParameter:(id)a3
{
  v3 = [(NSDictionary *)self->_config objectForKeyedSubscript:a3];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (int)getIntParameter:(id)a3
{
  v3 = [(NSDictionary *)self->_config objectForKeyedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (id)_defaultOptions
{
  if (_defaultOptions_onceToken != -1) {
    dispatch_once(&_defaultOptions_onceToken, &__block_literal_global_48);
  }
  v2 = (void *)_defaultOptions__defaults;
  return v2;
}

void __45__SSQueryIntentManagerConfig__defaultOptions__block_invoke()
{
  v3[23] = *MEMORY[0x1E4F143B8];
  v2[0] = @"IntentModelingEnabledMobile";
  v2[1] = @"IntentModelingEnabledDesktop";
  v3[0] = MEMORY[0x1E4F1CC38];
  v3[1] = MEMORY[0x1E4F1CC28];
  v2[2] = @"IntentModelingShowWebAsTypedBaseline";
  v2[3] = @"IntentModelingShowWebAsTypedLocal";
  v3[2] = MEMORY[0x1E4F1CC38];
  v3[3] = MEMORY[0x1E4F1CC38];
  v2[4] = @"IntentModelingShowWebAsTypedLocalStrong";
  v2[5] = @"IntentModelingShowWebAsTypedServer";
  v3[4] = MEMORY[0x1E4F1CC38];
  v3[5] = MEMORY[0x1E4F1CC38];
  v2[6] = @"IntentModelingLocalSuggestionQuotaBaseline";
  v2[7] = @"IntentModelingLocalSuggestionQuotaLocal";
  v3[6] = &unk_1F1863ED8;
  v3[7] = &unk_1F1863EF0;
  v2[8] = @"IntentModelingLocalSuggestionQuotaLocalStrong";
  v2[9] = @"IntentModelingLocalSuggestionQuotaServer";
  v3[8] = &unk_1F1863EF0;
  v3[9] = &unk_1F1863EF0;
  v2[10] = @"IntentModelingServerSuggestionQuotaBaseline";
  v2[11] = @"IntentModelingServerSuggestionQuotaLocal";
  v3[10] = &unk_1F1863ED8;
  v3[11] = &unk_1F1863EF0;
  v2[12] = @"IntentModelingServerSuggestionQuotaLocalStrong";
  v2[13] = @"IntentModelingServerSuggestionQuotaServer";
  v3[12] = &unk_1F1863EF0;
  v3[13] = &unk_1F1863ED8;
  v2[14] = @"IntentModelingServerSectionDisplayStrategyLocal";
  v2[15] = @"IntentModelingServerSectionDisplayStrategyLocalStrong";
  v3[14] = &unk_1F1863F08;
  v3[15] = &unk_1F1863F20;
  v2[16] = @"IntentModelingServerWeatherIntent";
  v2[17] = @"IntentModelingServerAppAccelerator";
  v3[16] = MEMORY[0x1E4F1CC38];
  v3[17] = MEMORY[0x1E4F1CC28];
  v2[18] = @"IntentModelingPhotosIntent";
  v2[19] = @"IntentModelingServerDomainsExcludedForDemotion";
  v3[18] = MEMORY[0x1E4F1CC38];
  v3[19] = &stru_1F1824018;
  v2[20] = @"IntentModelingSuppressSuggestionsUpToPrefixLength";
  v2[21] = @"IntentModelingShowSuggestionsAsOfPrefixLength";
  v3[20] = &unk_1F1863ED8;
  v3[21] = &unk_1F1863ED8;
  v2[22] = @"IntentModelingMapsPoiIntent";
  v3[22] = MEMORY[0x1E4F1CC38];
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:23];
  v1 = (void *)_defaultOptions__defaults;
  _defaultOptions__defaults = v0;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1) {
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_158);
  }
  [(id)sharedInstance_sharedInstance_4 update];
  v2 = (void *)sharedInstance_sharedInstance_4;
  return v2;
}

uint64_t __44__SSQueryIntentManagerConfig_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance_4 = objc_alloc_init(SSQueryIntentManagerConfig);
  return MEMORY[0x1F41817F8]();
}

- (void)_updateInternalConfig:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v4 = [a3 objectForKeyedSubscript:@"IntentModelingServerDomainsExcludedForDemotion"];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = +[SSQueryIntentManagerConfig _parseServerDomainExclusionSet:v4];
      serverDomainDemotionExclusionSet = self->_serverDomainDemotionExclusionSet;
      self->_serverDomainDemotionExclusionSet = v5;

      v7 = SSGeneralLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = self->_serverDomainDemotionExclusionSet;
        int v9 = 138412546;
        v10 = @"IntentModelingServerDomainsExcludedForDemotion";
        __int16 v11 = 2112;
        v12 = v8;
        _os_log_impl(&dword_1BDB2A000, v7, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] Processed value for %@ = %@", (uint8_t *)&v9, 0x16u);
      }
    }
  }
}

- (void)updateWithResources:(id)a3 defaults:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  resources = self->_resources;
  location = (id *)&self->_resources;
  if (v7 && !resources)
  {
    objc_storeStrong(location, a3);
    v10 = SSGeneralLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v11 = (__CFString *)*location;
      *(_DWORD *)buf = 138412290;
      v42 = v11;
      _os_log_impl(&dword_1BDB2A000, v10, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] Resources: %@", buf, 0xCu);
    }

    resources = (SRResources *)*location;
  }
  if (resources && [(SRResources *)resources hasUpdates])
  {
    baseConfig = self->_baseConfig;
    self->_baseConfig = 0;

    uint64_t v13 = SSGeneralLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDB2A000, v13, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] hasUpdates, clearing config", buf, 2u);
    }
  }
  v14 = self->_baseConfig;
  if (!v14)
  {
    v15 = SSGeneralLog();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BDB2A000, v15, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] Init config", buf, 2u);
    }

    if (!v8)
    {
      id v8 = [(SSQueryIntentManagerConfig *)self _defaultOptions];
    }
    id v32 = v8;
    v33 = self;
    v16 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:v8];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = [(NSDictionary *)v16 allKeys];
    uint64_t v17 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
    id v34 = v7;
    if (!v17)
    {
      v19 = 0;
      goto LABEL_32;
    }
    uint64_t v18 = v17;
    v19 = 0;
    uint64_t v20 = *(void *)v38;
    p_resources = &self->_resources;
    while (1)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        if (*p_resources)
        {
          uint64_t v24 = [(SRResources *)*p_resources objectForKey:*(void *)(*((void *)&v37 + 1) + 8 * i)];

          if (v24)
          {
            [(NSDictionary *)v16 setObject:v24 forKeyedSubscript:v23];
            v19 = (void *)v24;
            v25 = @"Override";
            goto LABEL_26;
          }
          v19 = 0;
        }
        v25 = @"Loaded";
LABEL_26:
        v26 = SSGeneralLog();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = [(NSDictionary *)v16 objectForKeyedSubscript:v23];
          *(_DWORD *)buf = 138412802;
          v42 = v25;
          __int16 v43 = 2112;
          uint64_t v44 = v23;
          __int16 v45 = 2112;
          v46 = v27;
          _os_log_impl(&dword_1BDB2A000, v26, OS_LOG_TYPE_DEFAULT, "[SpotlightRanking][IntentModeling][Config] %@ value for %@ = %@", buf, 0x20u);

          p_resources = (SRResources **)location;
        }
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v37 objects:v47 count:16];
      if (!v18)
      {
LABEL_32:

        self = v33;
        v28 = v33->_baseConfig;
        v33->_baseConfig = v16;
        v29 = v16;

        [(SSQueryIntentManagerConfig *)v33 _updateInternalConfig:v29];
        v14 = v33->_baseConfig;
        id v7 = v34;
        id v8 = v32;
        break;
      }
    }
  }
  objc_storeStrong((id *)&self->_config, v14);
  v30 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:300.0];
  expirationDate = self->_expirationDate;
  self->_expirationDate = v30;
}

- (BOOL)expired
{
  if (!self->_expirationDate) {
    return 1;
  }
  v3 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:0.0];
  BOOL v4 = [v3 compare:self->_expirationDate] == 1;

  return v4;
}

- (void)update
{
}

- (void)update:(BOOL)a3
{
  if (a3 || [(SSQueryIntentManagerConfig *)self expired])
  {
    os_unfair_lock_lock((os_unfair_lock_t)&sConfigLock);
    BOOL v4 = SSDefaultsGetResources();
    [(SSQueryIntentManagerConfig *)self updateWithResources:v4 defaults:0];

    os_unfair_lock_unlock((os_unfair_lock_t)&sConfigLock);
  }
}

+ (id)_getParsecDomainMapping
{
  if (_getParsecDomainMapping_onceToken != -1) {
    dispatch_once(&_getParsecDomainMapping_onceToken, &__block_literal_global_170);
  }
  v2 = (void *)_getParsecDomainMapping__domainMapping;
  return v2;
}

void __53__SSQueryIntentManagerConfig__getParsecDomainMapping__block_invoke()
{
  v3[18] = *MEMORY[0x1E4F143B8];
  v2[0] = @"stocks";
  v2[1] = @"sports";
  v3[0] = @"com.apple.parsec.stocks";
  v3[1] = @"com.apple.parsec.sports";
  v2[2] = @"maps";
  v2[3] = @"movies";
  v3[2] = @"com.apple.parsec.maps";
  v3[3] = @"com.apple.parsec.movies";
  v2[4] = @"kg";
  v2[5] = @"web";
  v3[4] = @"com.apple.parsec.kg";
  v3[5] = @"com.apple.parsec.web_index";
  v2[6] = @"dictionary";
  v2[7] = @"weather";
  v3[6] = @"com.apple.parsec.dictionary";
  v3[7] = @"com.apple.parsec.weather";
  v2[8] = @"webimages";
  v2[9] = @"webanswers";
  v3[8] = @"com.apple.parsec.web_images";
  v3[9] = @"com.apple.parsec.web_answer.passage";
  v2[10] = @"apps";
  v2[11] = @"news";
  v3[10] = @"com.apple.parsec.itunes.iosSoftware";
  v3[11] = @"com.apple.parsec.news";
  v2[12] = @"flights";
  v2[13] = @"itunes.album";
  v3[12] = @"com.apple.parsec.flights";
  v3[13] = @"com.apple.parsec.itunes.album";
  v2[14] = @"itunes.artist";
  v2[15] = @"itunes.book";
  v3[14] = @"com.apple.parsec.itunes.artist";
  v3[15] = @"com.apple.parsec.itunes.book";
  v2[16] = @"itunes.podcast";
  v2[17] = @"itunes.song";
  v3[16] = @"com.apple.parsec.itunes.podcast";
  v3[17] = @"com.apple.parsec.itunes.song";
  uint64_t v0 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v3 forKeys:v2 count:18];
  v1 = (void *)_getParsecDomainMapping__domainMapping;
  _getParsecDomainMapping__domainMapping = v0;
}

+ (id)_parseServerDomainExclusionSet:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [MEMORY[0x1E4F1CA80] set];
  if (v3)
  {
    id v5 = v3;
    v6 = +[SSQueryIntentManagerConfig _getParsecDomainMapping];
    id v7 = [v5 lowercaseString];
    id v8 = [v7 componentsSeparatedByString:@","];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v8;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          if (*(void *)(*((void *)&v16 + 1) + 8 * i))
          {
            v14 = [v6 objectForKeyedSubscript:(void)v16];
            if (v14) {
              [v4 addObject:v14];
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
  return v4;
}

- (NSDictionary)config
{
  return self->_config;
}

- (NSSet)serverDomainDemotionExclusionSet
{
  return self->_serverDomainDemotionExclusionSet;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverDomainDemotionExclusionSet, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_baseConfig, 0);
  objc_storeStrong((id *)&self->_resources, 0);
}

@end