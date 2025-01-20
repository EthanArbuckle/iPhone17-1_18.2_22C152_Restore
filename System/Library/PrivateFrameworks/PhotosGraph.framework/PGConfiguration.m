@interface PGConfiguration
+ (id)_persistedConfigurationPath;
+ (id)persistedConfiguration;
- (PGConfiguration)initWithSources:(id)a3 version:(double)a4;
- (double)version;
- (id)_configurationDictionary;
- (id)description;
- (id)propertyKeys;
- (id)propertyNamesForProperties:(objc_property *)a3 propertyCount:(unsigned int)a4;
- (void)_configureWithSource:(id)a3 propertyKeys:(id)a4;
- (void)deletePersistedConfiguration;
- (void)persistConfiguration;
@end

@implementation PGConfiguration

- (double)version
{
  return self->_version;
}

- (void)deletePersistedConfiguration
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _persistedConfigurationPath];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  if ([v3 fileExistsAtPath:v2 isDirectory:0])
  {
    id v8 = 0;
    char v4 = [v3 removeItemAtPath:v2 error:&v8];
    id v5 = v8;
    if ((v4 & 1) == 0)
    {
      v6 = +[PGLogging sharedLogging];
      v7 = [v6 loggingConnection];

      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v10 = v5;
        _os_log_error_impl(&dword_1D1805000, v7, OS_LOG_TYPE_ERROR, "[PGConfiguration] Failed to delete persisted configuration dictionary (%@)", buf, 0xCu);
      }
    }
  }
}

- (id)_configurationDictionary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  char v4 = [(PGConfiguration *)self propertyKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v10 = [(PGConfiguration *)self valueForKey:v9];
        [v3 setObject:v10 forKeyedSubscript:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)persistConfiguration
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  id v4 = 0;
  if (([v3 fileExistsAtPath:@"/var/mobile/Media/PhotoData/Configuration" isDirectory:0] & 1) != 0
    || (id v14 = 0,
        v5 = [v3 createDirectoryAtPath:@"/var/mobile/Media/PhotoData/Configuration" withIntermediateDirectories:1 attributes:0 error:&v14], id v4 = v14, (v5 & 1) != 0))
  {
    uint64_t v6 = [(id)objc_opt_class() _persistedConfigurationPath];
    uint64_t v7 = [(PGConfiguration *)self _configurationDictionary];
    char v8 = [v7 writeToFile:v6 atomically:1];

    if (v8) {
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v9 = +[PGLogging sharedLogging];
    id v10 = [v9 loggingConnection];

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v16 = v4;
      _os_log_error_impl(&dword_1D1805000, v10, OS_LOG_TYPE_ERROR, "[PGConfiguration] Failed to create Configuration directory (%@)", buf, 0xCu);
    }
  }
  uint64_t v11 = +[PGLogging sharedLogging];
  long long v12 = [v11 loggingConnection];

  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    long long v13 = [(id)objc_opt_class() name];
    *(_DWORD *)buf = 138412290;
    id v16 = v13;
    _os_log_error_impl(&dword_1D1805000, v12, OS_LOG_TYPE_ERROR, "[PGConfiguration] Failed to persist configuration dictionary for class %@", buf, 0xCu);
  }
LABEL_11:
}

- (id)description
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = [(id)objc_opt_class() name];
  [(PGConfiguration *)self version];
  uint64_t v6 = [v3 stringWithFormat:@"%@ (version: %.2f):", v4, v5];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [(PGConfiguration *)self propertyKeys];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        long long v13 = [(PGConfiguration *)self valueForKey:v12];
        [v6 appendFormat:@"\n\t%@: %@", v12, v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

- (void)_configureWithSource:(id)a3 propertyKeys:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        long long v13 = [v6 objectForKey:v12];
        if (v13) {
          [(PGConfiguration *)self setValue:v13 forKey:v12];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
}

- (id)propertyNamesForProperties:(objc_property *)a3 propertyCount:(unsigned int)a4
{
  id v6 = [MEMORY[0x1E4F1CA48] array];
  if (a4)
  {
    uint64_t v7 = a4;
    do
    {
      uint64_t v8 = *a3++;
      uint64_t v9 = [NSString stringWithUTF8String:property_getName(v8)];
      [v6 addObject:v9];

      --v7;
    }
    while (v7);
  }
  return v6;
}

- (id)propertyKeys
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v4 = (objc_class *)objc_opt_class();
  while ([(objc_class *)v4 isSubclassOfClass:objc_opt_class()])
  {
    unsigned int outCount = 0;
    uint64_t v5 = class_copyPropertyList(v4, &outCount);
    id v6 = [(PGConfiguration *)self propertyNamesForProperties:v5 propertyCount:outCount];
    [v3 addObjectsFromArray:v6];
    free(v5);
    id v4 = (objc_class *)[(objc_class *)v4 superclass];
  }
  return v3;
}

- (PGConfiguration)initWithSources:(id)a3 version:(double)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v20.receiver = self;
  v20.super_class = (Class)PGConfiguration;
  uint64_t v7 = [(PGConfiguration *)&v20 init];
  uint64_t v8 = v7;
  if (v7)
  {
    v7->_version = a4;
    uint64_t v9 = [(PGConfiguration *)v7 propertyKeys];
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v17;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v17 != v13) {
            objc_enumerationMutation(v10);
          }
          -[PGConfiguration _configureWithSource:propertyKeys:](v8, "_configureWithSource:propertyKeys:", *(void *)(*((void *)&v16 + 1) + 8 * v14++), v9, (void)v16);
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v12);
    }
  }
  return v8;
}

+ (id)_persistedConfigurationPath
{
  v2 = NSString;
  id v3 = [a1 name];
  id v4 = [v2 stringWithFormat:@"%@/%@", @"/var/mobile/Media/PhotoData/Configuration", v3];

  return v4;
}

+ (id)persistedConfiguration
{
  v15[1] = *MEMORY[0x1E4F143B8];
  v2 = [(id)objc_opt_class() _persistedConfigurationPath];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v2];
  if (v3)
  {
    id v4 = [[PGDictionaryConfigurationSource alloc] initWithDictionary:v3];
    uint64_t v5 = [v3 objectForKeyedSubscript:@"version"];
    [v5 doubleValue];
    double v7 = v6;

    uint64_t v8 = [PGConfiguration alloc];
    v15[0] = v4;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v10 = [(PGConfiguration *)v8 initWithSources:v9 version:v7];
  }
  else
  {
    uint64_t v11 = +[PGLogging sharedLogging];
    id v4 = [v11 loggingConnection];

    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      int v13 = 138412290;
      uint64_t v14 = v2;
      _os_log_error_impl(&dword_1D1805000, &v4->super, OS_LOG_TYPE_ERROR, "[PGConfiguration] No persisted configuration found at path %@", (uint8_t *)&v13, 0xCu);
    }
    id v10 = 0;
  }

  return v10;
}

@end