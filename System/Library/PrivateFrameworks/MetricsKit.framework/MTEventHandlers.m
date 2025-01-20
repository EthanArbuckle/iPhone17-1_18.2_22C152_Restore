@interface MTEventHandlers
- (Class)baseDataProviderClass;
- (MTBaseEventDataProvider)base;
- (NSMutableDictionary)registrations;
- (id)objectForKeyedSubscript:(id)a3;
- (void)registerEventHandlerName:(id)a3 eventData:(id)a4;
- (void)registerEventHandlerName:(id)a3 eventHandlerClass:(Class)a4;
- (void)registerEventHandlerName:(id)a3 eventHandlerClass:(Class)a4 eventData:(id)a5;
- (void)setBase:(id)a3;
- (void)setRegistrations:(id)a3;
@end

@implementation MTEventHandlers

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registrations, 0);

  objc_storeStrong((id *)&self->_base, 0);
}

- (NSMutableDictionary)registrations
{
  v2 = self;
  objc_sync_enter(v2);
  if (!v2->_registrations)
  {
    uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
    registrations = v2->_registrations;
    v2->_registrations = (NSMutableDictionary *)v3;

    [(MTEventHandlers *)v2 registerDefaultEventHandlers];
  }
  objc_sync_exit(v2);

  v5 = v2->_registrations;

  return v5;
}

- (Class)baseDataProviderClass
{
  id v8 = MTConfigurationError(101, @"Required method 'baseDataProviderClass' is not implemented on '%@'", v2, v3, v4, v5, v6, v7, (uint64_t)self);

  return (Class)objc_opt_class();
}

- (MTBaseEventDataProvider)base
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (!v2->_base)
  {
    id v3 = objc_alloc([(MTEventHandlers *)v2 baseDataProviderClass]);
    uint64_t v4 = [(MTObject *)v2 metricsKit];
    uint64_t v5 = [v3 initWithMetricsKit:v4];
    base = v2->_base;
    v2->_base = (MTBaseEventDataProvider *)v5;
  }
  objc_sync_exit(v2);

  uint64_t v7 = v2->_base;

  return v7;
}

- (void)registerEventHandlerName:(id)a3 eventHandlerClass:(Class)a4
{
}

- (void)registerEventHandlerName:(id)a3 eventHandlerClass:(Class)a4 eventData:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  v10 = [MTEventHandlerRegistration alloc];
  v11 = [(MTObject *)self metricsKit];
  v12 = [(MTEventHandlerRegistration *)v10 initWithMetricsKit:v11 name:v8 class:a4 eventData:v9];

  v13 = self;
  objc_sync_enter(v13);
  v14 = [(MTEventHandlers *)v13 registrations];
  v15 = [v14 objectForKeyedSubscript:v8];

  if (v15)
  {
    v16 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v18 = 138412290;
      id v19 = v8;
      _os_log_impl(&dword_218211000, v16, OS_LOG_TYPE_DEBUG, "MetricsKit: registerEventHandlerName: Event handler named %@ is already registered. The previous event handler will be replaced.", (uint8_t *)&v18, 0xCu);
    }
  }
  v17 = [(MTEventHandlers *)v13 registrations];
  [v17 setObject:v12 forKeyedSubscript:v8];

  objc_sync_exit(v13);
}

- (void)registerEventHandlerName:(id)a3 eventData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(MTEventHandlers *)self registerEventHandlerName:v7 eventHandlerClass:objc_opt_class() eventData:v6];
}

- (id)objectForKeyedSubscript:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = [(MTEventHandlers *)v5 registrations];
  id v7 = [v6 objectForKeyedSubscript:v4];

  objc_sync_exit(v5);
  if (!v7 || ([v7 eventHandler], (id v8 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v9 = MTMetricsKitOSLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_218211000, v9, OS_LOG_TYPE_DEBUG, "MetricsKit: Event handler named %@ has not been registered. Use registerEventHandlerName to register it first.", (uint8_t *)&v11, 0xCu);
    }

    id v8 = 0;
  }

  return v8;
}

- (void)setBase:(id)a3
{
}

- (void)setRegistrations:(id)a3
{
}

@end