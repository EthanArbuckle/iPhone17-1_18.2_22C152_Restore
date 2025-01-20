@interface PGRemoteConfiguration
- (BOOL)BOOLValueForKey:(id)a3 withFallbackValue:(BOOL)a4;
- (BOOL)_isValidFilePath:(id)a3;
- (PGRemoteConfiguration)init;
- (PGRemoteConfiguration)initWithConfigurationSources:(id)a3;
- (PGRemoteConfiguration)initWithTrialNamespace:(unsigned __int16)a3 onDiskResourceFile:(id)a4;
- (double)doubleValueForKey:(id)a3 withFallbackValue:(double)a4;
- (id)_configValueForKey:(id)a3 withFallbackValue:(id)a4;
- (id)arrayValueForKey:(id)a3 withFallbackValue:(id)a4;
- (id)dictionaryValueForKey:(id)a3 withFallbackValue:(id)a4;
- (id)fileValueForKey:(id)a3 withFallbackValue:(id)a4;
- (id)onDiskConfigurationPathForResourceFileName:(id)a3;
- (id)stringValueForKey:(id)a3 withFallbackValue:(id)a4;
- (int64_t)longValueForKey:(id)a3 withFallbackValue:(int64_t)a4;
- (void)_cacheFallbackValueForKey:(id)a3 withValue:(id)a4;
@end

@implementation PGRemoteConfiguration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationSources, 0);
  objc_storeStrong((id *)&self->_remoteConfigurationCache, 0);
}

- (void)_cacheFallbackValueForKey:(id)a3 withValue:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(NSMutableDictionary *)self->_remoteConfigurationCache objectForKey:v6];
  if (([v8 isEqual:v7] & 1) == 0)
  {
    if (v8)
    {
      v9 = +[PGLogging sharedLogging];
      v10 = [v9 loggingConnection];

      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v11 = 138412802;
        id v12 = v6;
        __int16 v13 = 2112;
        v14 = v8;
        __int16 v15 = 2112;
        id v16 = v7;
        _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[PGRemoteConfiguration] fallback value for Key: %@ is given multiple unequal values: %@, %@", (uint8_t *)&v11, 0x20u);
      }
    }
    else
    {
      [(NSMutableDictionary *)self->_remoteConfigurationCache setObject:v7 forKeyedSubscript:v6];
    }
  }
}

- (id)_configValueForKey:(id)a3 withFallbackValue:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(PGRemoteConfiguration *)self _cacheFallbackValueForKey:v6 withValue:a4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = self->_configurationSources;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "objectForKey:", v6, (void)v15);
        if (v12)
        {
          __int16 v13 = (void *)v12;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  __int16 v13 = 0;
LABEL_11:

  return v13;
}

- (id)fileValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6 = a4;
  id v7 = [(PGRemoteConfiguration *)self _configValueForKey:a3 withFallbackValue:v6];
  uint64_t v8 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v9 = [v8 fileExistsAtPath:v7];

  if (v9)
  {
    id v10 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
  }
  else
  {
    id v10 = v6;
  }
  int v11 = v10;

  return v11;
}

- (BOOL)_isValidFilePath:(id)a3
{
  v3 = (void *)MEMORY[0x1E4F28CB8];
  id v4 = a3;
  v5 = [v3 defaultManager];
  char v6 = [v5 fileExistsAtPath:v4];

  return v6;
}

- (id)dictionaryValueForKey:(id)a3 withFallbackValue:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PGRemoteConfiguration *)self _configValueForKey:a3 withFallbackValue:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![(PGRemoteConfiguration *)self _isValidFilePath:v7])
  {
LABEL_7:
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v11 = v7;
    }
    else {
      int v11 = v6;
    }
    id v8 = v11;
    goto LABEL_11;
  }
  id v8 = (id)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v7];
  if (!v8)
  {
    int v9 = +[PGLogging sharedLogging];
    id v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      v14 = v7;
      _os_log_impl(&dword_1D1805000, v10, OS_LOG_TYPE_INFO, "[RemoteConfiguration] failed to load dictionary from Trial at filepath %@", (uint8_t *)&v13, 0xCu);
    }

    goto LABEL_7;
  }
LABEL_11:

  return v8;
}

- (id)arrayValueForKey:(id)a3 withFallbackValue:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [(PGRemoteConfiguration *)self _configValueForKey:a3 withFallbackValue:v6];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [(PGRemoteConfiguration *)self _isValidFilePath:v7])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1C978]) initWithContentsOfFile:v7];
    int v9 = v8;
    if (!v8)
    {
      id v10 = +[PGLogging sharedLogging];
      int v11 = [v10 loggingConnection];

      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        int v15 = 138412290;
        long long v16 = v7;
        _os_log_error_impl(&dword_1D1805000, v11, OS_LOG_TYPE_ERROR, "[RemoteConfiguration] failed to load array from Trial at filepath %@", (uint8_t *)&v15, 0xCu);
      }

      int v9 = v6;
    }
    id v12 = v9;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v7;
    }
    else {
      id v13 = v6;
    }
    id v12 = v13;
  }

  return v12;
}

- (double)doubleValueForKey:(id)a3 withFallbackValue:(double)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithDouble:a4];
  int v9 = [(PGRemoteConfiguration *)self _configValueForKey:v7 withFallbackValue:v8];

  if (v9)
  {
    [v9 doubleValue];
    a4 = v10;
  }

  return a4;
}

- (int64_t)longValueForKey:(id)a3 withFallbackValue:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithLongLong:a4];
  int v9 = [(PGRemoteConfiguration *)self _configValueForKey:v7 withFallbackValue:v8];

  if (v9) {
    a4 = [v9 longValue];
  }

  return a4;
}

- (id)stringValueForKey:(id)a3 withFallbackValue:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(PGRemoteConfiguration *)self _configValueForKey:a3 withFallbackValue:v6];
  id v8 = (void *)v7;
  if (v7) {
    int v9 = (void *)v7;
  }
  else {
    int v9 = v6;
  }
  id v10 = v9;

  return v10;
}

- (BOOL)BOOLValueForKey:(id)a3 withFallbackValue:(BOOL)a4
{
  uint64_t v4 = a4;
  id v6 = NSNumber;
  id v7 = a3;
  id v8 = [v6 numberWithBool:v4];
  int v9 = [(PGRemoteConfiguration *)self _configValueForKey:v7 withFallbackValue:v8];

  if (v9) {
    LOBYTE(v4) = [v9 BOOLValue];
  }

  return v4;
}

- (id)onDiskConfigurationPathForResourceFileName:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 pathForResource:v3 ofType:@"remoteconfig.plist"];

  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v7 = [v6 fileExistsAtPath:v5];

  if (v7)
  {
    id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v5];
  }
  else
  {
    int v9 = +[PGLogging sharedLogging];
    id v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 138412546;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[PGRemoteConfiguration] Failed to find resourceFilePath:%@ for resourceFileName:%@", (uint8_t *)&v12, 0x16u);
    }

    id v8 = 0;
  }

  return v8;
}

- (PGRemoteConfiguration)initWithConfigurationSources:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PGRemoteConfiguration;
  id v6 = [(PGRemoteConfiguration *)&v10 init];
  if (v6)
  {
    int v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    remoteConfigurationCache = v6->_remoteConfigurationCache;
    v6->_remoteConfigurationCache = v7;

    objc_storeStrong((id *)&v6->_configurationSources, a3);
  }

  return v6;
}

- (PGRemoteConfiguration)initWithTrialNamespace:(unsigned __int16)a3 onDiskResourceFile:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = +[PGTrialSession newTrialSession];
  if (v6)
  {
    id v8 = [(PGRemoteConfiguration *)self onDiskConfigurationPathForResourceFileName:v6];
    int v9 = [[PGPlistFileConfigurationSource alloc] initWithPlistFileURL:v8];
  }
  else
  {
    int v9 = 0;
  }
  objc_super v10 = [[PGTrialConfigurationSource alloc] initWithTrialSession:v7 namespaceType:v4];
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v12 = v11;
  if (v10) {
    [v11 addObject:v10];
  }
  if (v9) {
    [v12 addObject:v9];
  }
  if (![v12 count])
  {
    id v13 = +[PGLogging sharedLogging];
    __int16 v14 = [v13 loggingConnection];

    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_error_impl(&dword_1D1805000, v14, OS_LOG_TYPE_ERROR, "[RemoteConfiguration] ConfigurationSources array is empty. No remote configuration values will be used", v17, 2u);
    }
  }
  id v15 = [(PGRemoteConfiguration *)self initWithConfigurationSources:v12];

  return v15;
}

- (PGRemoteConfiguration)init
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[PGTrialSession newTrialSession];
  uint64_t v4 = [[PGTrialConfigurationSource alloc] initWithTrialSession:v3 namespaceType:1];
  v8[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  id v6 = [(PGRemoteConfiguration *)self initWithConfigurationSources:v5];

  return v6;
}

@end