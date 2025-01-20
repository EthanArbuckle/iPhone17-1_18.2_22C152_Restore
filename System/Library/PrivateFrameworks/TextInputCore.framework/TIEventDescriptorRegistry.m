@interface TIEventDescriptorRegistry
+ (TIEventDescriptorRegistry)registryWithConfig:(id)a3;
+ (TIEventDescriptorRegistry)registryWithDescriptors:(id)a3 andSpecs:(id)a4;
+ (id)registry;
- (BOOL)loaded;
- (NSDictionary)config;
- (NSDictionary)eventDescriptors;
- (NSDictionary)eventSpecs;
- (TIEventDescriptorRegistry)initWithConfig:(id)a3;
- (TIEventDescriptorRegistry)initWithDescriptors:(id)a3 andSpecs:(id)a4;
- (id)allEventDescriptors;
- (id)contextFromError:(id)a3;
- (id)eventDescriptorWithName:(id)a3;
- (id)eventSpecWithName:(id)a3;
- (id)valueFromError:(id)a3 forKey:(id)a4;
- (void)_loadEventDescriptors;
- (void)loadEventDescriptorsIfNecessary;
- (void)setConfig:(id)a3;
- (void)setLoaded:(BOOL)a3;
@end

@implementation TIEventDescriptorRegistry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_eventSpecs, 0);

  objc_storeStrong((id *)&self->_eventDescriptors, 0);
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
  id v4 = a3;
  id v5 = [(TIEventDescriptorRegistry *)self valueFromError:v4 forKey:@"event"];
  v6 = [(TIEventDescriptorRegistry *)self valueFromError:v4 forKey:@"field"];

  if (v5)
  {
    if (v6) {
      [NSString stringWithFormat:@"Event %@ Field %@ ", v5, v6];
    }
    else {
    v7 = [NSString stringWithFormat:@"Event %@ ", v5, v9];
    }
  }
  else
  {
    v7 = &stru_1F3F7A998;
  }

  return v7;
}

- (void)_loadEventDescriptors
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v3 = [(TIEventDescriptorRegistry *)self config];

  if (!v3)
  {
    id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v5 = [v4 URLForResource:@"EventDescriptors" withExtension:@"plist"];
    v6 = IXADefaultLogFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading event descriptor configuration.", "-[TIEventDescriptorRegistry _loadEventDescriptors]");
      *(_DWORD *)buf = 138412290;
      v24 = v7;
      _os_log_impl(&dword_1E3F0E000, v6, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v5];
    [(TIEventDescriptorRegistry *)self setConfig:v8];

    uint64_t v9 = [(TIEventDescriptorRegistry *)self config];

    if (!v9)
    {
      v10 = IXADefaultLogFacility();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v21 = [NSString stringWithFormat:@"%s Unable to load the event descriptor configuration from %@.plist.", "-[TIEventDescriptorRegistry _loadEventDescriptors]", @"EventDescriptors"];
        *(_DWORD *)buf = 138412290;
        v24 = v21;
        _os_log_error_impl(&dword_1E3F0E000, v10, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
    }
  }
  v11 = [(TIEventDescriptorRegistry *)self config];

  if (v11)
  {
    v12 = IXADefaultLogFacility();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s Loading event descriptors.", "-[TIEventDescriptorRegistry _loadEventDescriptors]");
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_1E3F0E000, v12, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
    }
    v14 = objc_opt_new();
    v15 = objc_opt_new();
    eventDescriptors = self->_eventDescriptors;
    eventSpecs = self->_eventSpecs;
    v18 = [(TIEventDescriptorRegistry *)self config];
    [v14 parseEventDescriptors:eventDescriptors andEventSpecs:eventSpecs fromConfig:v18 errors:v15];

    if ([v15 count])
    {
      v19 = IXADefaultLogFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s The following errors occurred while parsing the event descriptor configuration.", "-[TIEventDescriptorRegistry _loadEventDescriptors]");
        *(_DWORD *)buf = 138412290;
        v24 = v20;
        _os_log_error_impl(&dword_1E3F0E000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
      }
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __50__TIEventDescriptorRegistry__loadEventDescriptors__block_invoke;
      v22[3] = &unk_1E6E2C3B8;
      v22[4] = self;
      [v15 enumerateObjectsUsingBlock:v22];
    }
  }
}

void __50__TIEventDescriptorRegistry__loadEventDescriptors__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = IXADefaultLogFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    id v5 = NSString;
    v6 = [*(id *)(a1 + 32) contextFromError:v3];
    v7 = [v3 userInfo];
    v8 = [v7 objectForKey:@"message"];
    uint64_t v9 = [v5 stringWithFormat:@"%s   %@%@", "-[TIEventDescriptorRegistry _loadEventDescriptors]_block_invoke", v6, v8];
    *(_DWORD *)buf = 138412290;
    v11 = v9;
    _os_log_error_impl(&dword_1E3F0E000, v4, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }
}

- (void)loadEventDescriptorsIfNecessary
{
  [(NSLock *)self->_lock lock];
  if (!self->_loaded)
  {
    [(TIEventDescriptorRegistry *)self _loadEventDescriptors];
    self->_loaded = 1;
  }
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (NSDictionary)eventSpecs
{
  [(TIEventDescriptorRegistry *)self loadEventDescriptorsIfNecessary];
  eventSpecs = self->_eventSpecs;

  return (NSDictionary *)eventSpecs;
}

- (NSDictionary)eventDescriptors
{
  [(TIEventDescriptorRegistry *)self loadEventDescriptorsIfNecessary];
  eventDescriptors = self->_eventDescriptors;

  return (NSDictionary *)eventDescriptors;
}

- (id)eventSpecWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(TIEventDescriptorRegistry *)self eventSpecs];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)eventDescriptorWithName:(id)a3
{
  id v4 = a3;
  id v5 = [(TIEventDescriptorRegistry *)self eventDescriptors];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)allEventDescriptors
{
  v2 = [(TIEventDescriptorRegistry *)self eventDescriptors];
  id v3 = [v2 allValues];

  return v3;
}

- (TIEventDescriptorRegistry)initWithDescriptors:(id)a3 andSpecs:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(TIEventDescriptorRegistry *)self initWithConfig:MEMORY[0x1E4F1CC08]];
  uint64_t v9 = v8;
  if (v8)
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __58__TIEventDescriptorRegistry_initWithDescriptors_andSpecs___block_invoke;
    v14[3] = &unk_1E6E2C390;
    v10 = v8;
    v15 = v10;
    id v16 = v7;
    [v6 enumerateObjectsUsingBlock:v14];
    v10->_loaded = 1;
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v10->_lock;
    v10->_lock = v11;
  }
  return v9;
}

void __58__TIEventDescriptorRegistry_initWithDescriptors_andSpecs___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  id v7 = [v6 eventName];
  [v5 setObject:v6 forKey:v7];

  v8 = *(void **)(a1 + 40);
  uint64_t v9 = *(void **)(*(void *)(a1 + 32) + 16);
  id v11 = [v8 objectAtIndexedSubscript:a3];
  v10 = [v6 eventName];

  [v9 setObject:v11 forKey:v10];
}

- (TIEventDescriptorRegistry)initWithConfig:(id)a3
{
  id v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)TIEventDescriptorRegistry;
  id v6 = [(TIEventDescriptorRegistry *)&v15 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    uint64_t v8 = objc_opt_new();
    eventDescriptors = v7->_eventDescriptors;
    v7->_eventDescriptors = (NSMutableDictionary *)v8;

    uint64_t v10 = objc_opt_new();
    eventSpecs = v7->_eventSpecs;
    v7->_eventSpecs = (NSMutableDictionary *)v10;

    v7->_loaded = 0;
    uint64_t v12 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v7->_lock;
    v7->_lock = v12;
  }
  return v7;
}

+ (TIEventDescriptorRegistry)registryWithDescriptors:(id)a3 andSpecs:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TIEventDescriptorRegistry alloc] initWithDescriptors:v6 andSpecs:v5];

  return v7;
}

+ (TIEventDescriptorRegistry)registryWithConfig:(id)a3
{
  id v3 = a3;
  id v4 = [[TIEventDescriptorRegistry alloc] initWithConfig:v3];

  return v4;
}

+ (id)registry
{
  v2 = [[TIEventDescriptorRegistry alloc] initWithConfig:0];

  return v2;
}

@end