@interface TIMetricDescriptorRegistry
+ (TIMetricDescriptorRegistry)registryWithConfig:(id)a3;
+ (TIMetricDescriptorRegistry)registryWithDescriptors:(id)a3 andInvalidMetricNames:(id)a4;
+ (id)registry;
- (BOOL)loaded;
- (NSDictionary)config;
- (NSDictionary)metricDescriptors;
- (NSSet)invalidMetricNames;
- (TIMetricDescriptorRegistry)initWithConfig:(id)a3;
- (TIMetricDescriptorRegistry)initWithDescriptors:(id)a3 andInvalidMetricNames:(id)a4;
- (id)allMetricDescriptors;
- (id)contextFromError:(id)a3;
- (id)metricDescriptorWithName:(id)a3;
- (id)valueFromError:(id)a3 forKey:(id)a4;
- (void)_loadMetricDescriptors;
- (void)loadMetricDescriptorsIfNecessary;
- (void)setConfig:(id)a3;
- (void)setLoaded:(BOOL)a3;
@end

@implementation TIMetricDescriptorRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_invalidMetricNames, 0);

  objc_storeStrong((id *)&self->_metricDescriptors, 0);
}

- (void)setLoaded:(BOOL)a3
{
  self->_loaded = a3;
}

- (BOOL)loaded
{
  return self->_loaded;
}

- (void)setConfig:(id)a3
{
}

- (NSDictionary)config
{
  return self->_config;
}

- (id)valueFromError:(id)a3 forKey:(id)a4
{
  id v5 = a4;
  v6 = [a3 userInfo];
  v7 = [v6 objectForKey:v5];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [NSString stringWithFormat:@"'%@'", v7];
    v8 = LABEL_5:;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%i", objc_msgSend(v7, "intValue"));
    goto LABEL_5;
  }
  v8 = 0;
LABEL_7:

  return v8;
}

- (id)contextFromError:(id)a3
{
  v3 = [(TIMetricDescriptorRegistry *)self valueFromError:a3 forKey:@"metric"];
  if (v3)
  {
    v4 = [NSString stringWithFormat:@"Metric %@ ", v3];
  }
  else
  {
    v4 = &stru_1F3F7A998;
  }

  return v4;
}

- (void)_loadMetricDescriptors
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(TIMetricDescriptorRegistry *)self config];

  if (!v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 URLForResource:@"MetricDescriptors" withExtension:@"plist"];
    v6 = IXADefaultLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading metric descriptor configuration.", "-[TIMetricDescriptorRegistry _loadMetricDescriptors]");
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5];
    [(TIMetricDescriptorRegistry *)self setConfig:v8];

    v9 = [(TIMetricDescriptorRegistry *)self config];

    if (!v9)
    {
      v10 = IXADefaultLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v21 = [NSString stringWithFormat:@"%s Unable to load the metric descriptor configuration from %@.plist.", "-[TIMetricDescriptorRegistry _loadMetricDescriptors]", @"MetricDescriptors"];
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v11 = [(TIMetricDescriptorRegistry *)self config];

  if (v11)
  {
    v12 = IXADefaultLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading metric descriptors.", "-[TIMetricDescriptorRegistry _loadMetricDescriptors]");
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    v14 = objc_opt_new();
    v15 = objc_opt_new();
    metricDescriptors = self->_metricDescriptors;
    invalidMetricNames = self->_invalidMetricNames;
    v18 = [(TIMetricDescriptorRegistry *)self config];
    [v14 parseMetricDescriptors:metricDescriptors andInvalidMetricNames:invalidMetricNames fromConfig:v18 errors:v15];

    if ([v15 count])
    {
      v19 = IXADefaultLogFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s The following errors occurred while parsing the metrics descriptor configuration.", "-[TIMetricDescriptorRegistry _loadMetricDescriptors]");
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_error_impl(&dword_1E3F0E000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __52__TIMetricDescriptorRegistry__loadMetricDescriptors__block_invoke;
      v22[3] = &unk_1E6E2C3B8;
      v22[4] = self;
      [v15 enumerateObjectsUsingBlock:v22];
    }
  }
}

void __52__TIMetricDescriptorRegistry__loadMetricDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = IXADefaultLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSString;
    v6 = [*(id *)(a1 + 32) contextFromError:v3];
    v7 = [v3 userInfo];
    v8 = [v7 objectForKey:@"message"];
    v9 = [v5 stringWithFormat:@"%s   %@%@", "-[TIMetricDescriptorRegistry _loadMetricDescriptors]_block_invoke", v6, v8];
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_error_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
}

- (void)loadMetricDescriptorsIfNecessary
{
  [(NSLock *)self->_lock lock];
  if (!self->_loaded)
  {
    [(TIMetricDescriptorRegistry *)self _loadMetricDescriptors];
    self->_loaded = 1;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (NSSet)invalidMetricNames
{
  [(TIMetricDescriptorRegistry *)self loadMetricDescriptorsIfNecessary];
  invalidMetricNames = self->_invalidMetricNames;

  return (NSSet *)invalidMetricNames;
}

- (NSDictionary)metricDescriptors
{
  [(TIMetricDescriptorRegistry *)self loadMetricDescriptorsIfNecessary];
  metricDescriptors = self->_metricDescriptors;

  return (NSDictionary *)metricDescriptors;
}

- (id)metricDescriptorWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(TIMetricDescriptorRegistry *)self invalidMetricNames];
  char v6 = [v5 containsObject:v4];

  if (v6)
  {
    v7 = 0;
  }
  else
  {
    v8 = [(TIMetricDescriptorRegistry *)self metricDescriptors];
    v7 = [v8 objectForKey:v4];

    if (!v7)
    {
      v7 = +[TINumericValueDescriptor numericValueDescriptorWithMetricName:v4 calculationExpression:0 calculationPrecondition:0 calculationDefaultValue:0 calculationDependencies:0 bucketThresholds:0 bucketValues:0];
    }
  }

  return v7;
}

- (id)allMetricDescriptors
{
  v2 = [(TIMetricDescriptorRegistry *)self metricDescriptors];
  id v3 = [v2 allValues];

  return v3;
}

- (TIMetricDescriptorRegistry)initWithDescriptors:(id)a3 andInvalidMetricNames:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(TIMetricDescriptorRegistry *)self initWithConfig:MEMORY[0x1E4F1CC08]];
  if (v8)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v6;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          metricDescriptors = v8->_metricDescriptors;
          v16 = [v14 metricName];
          [(NSMutableDictionary *)metricDescriptors setObject:v14 forKey:v16];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v11);
    }

    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v17 = v7;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v26;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          -[NSMutableSet addObject:](v8->_invalidMetricNames, "addObject:", *(void *)(*((void *)&v25 + 1) + 8 * j), (void)v25);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v25 objects:v33 count:16];
      }
      while (v19);
    }

    v8->_loaded = 1;
    v22 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v8->_lock;
    v8->_lock = v22;
  }
  return v8;
}

- (TIMetricDescriptorRegistry)initWithConfig:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIMetricDescriptorRegistry;
  id v6 = [(TIMetricDescriptorRegistry *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    uint64_t v8 = objc_opt_new();
    metricDescriptors = v7->_metricDescriptors;
    v7->_metricDescriptors = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    invalidMetricNames = v7->_invalidMetricNames;
    v7->_invalidMetricNames = (NSMutableSet *)v10;

    v7->_loaded = 0;
    uint64_t v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v7->_lock;
    v7->_lock = v12;
  }
  return v7;
}

+ (TIMetricDescriptorRegistry)registryWithDescriptors:(id)a3 andInvalidMetricNames:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TIMetricDescriptorRegistry alloc] initWithDescriptors:v6 andInvalidMetricNames:v5];

  return v7;
}

+ (TIMetricDescriptorRegistry)registryWithConfig:(id)a3
{
  id v3 = a3;
  id v4 = [[TIMetricDescriptorRegistry alloc] initWithConfig:v3];

  return v4;
}

+ (id)registry
{
  v2 = [[TIMetricDescriptorRegistry alloc] initWithConfig:0];

  return v2;
}

@end