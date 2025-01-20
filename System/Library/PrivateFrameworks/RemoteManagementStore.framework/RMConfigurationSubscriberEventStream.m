@interface RMConfigurationSubscriberEventStream
+ (id)_configuredConfigurationTypesWithScope:(int64_t)a3;
+ (id)_eventDescriptorByNameForEventStreamNamed:(id)a3;
+ (id)newConfigurationSubscriberEventStreamWithScope:(int64_t)a3 applicators:(id)a4 publisherClass:(Class)a5;
+ (void)_setupEventHandlerWithScope:(int64_t)a3;
- (NSArray)configurationTypes;
- (RMConfigurationSubscriberEventStream)initWithScope:(int64_t)a3;
- (id)eventStreamObserver;
- (int64_t)scope;
- (void)_fetchConfigurations:(id)a3;
- (void)_handleEvent:(id)a3;
- (void)_setupEventHandler;
- (void)dealloc;
- (void)setEventStreamObserver:(id)a3;
- (void)start;
@end

@implementation RMConfigurationSubscriberEventStream

+ (id)newConfigurationSubscriberEventStreamWithScope:(int64_t)a3 applicators:(id)a4 publisherClass:(Class)a5
{
  id v7 = a4;
  v8 = [[RMConfigurationSubscriberEventStream alloc] initWithScope:a3];
  if (v7)
  {
    v9 = +[RMConfigurationSubscriberDelegate sharedDelegateWithApplicators:v7];
    [(RMConfigurationSubscriberClient *)v8 setSubscriberDelegate:v9];
  }
  if (a5)
  {
    v10 = +[RMStatusPublisherDelegate sharedDelegateWithPublisherClass:a5];
    [(RMConfigurationSubscriberClient *)v8 setPublisherDelegate:v10];
  }
  return v8;
}

- (RMConfigurationSubscriberEventStream)initWithScope:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RMConfigurationSubscriberEventStream;
  result = [(RMConfigurationSubscriberEventStream *)&v5 init];
  if (result) {
    result->_scope = a3;
  }
  return result;
}

+ (id)_configuredConfigurationTypesWithScope:(int64_t)a3
{
  v4 = objc_opt_class();
  if (a3 == 1) {
    objc_super v5 = @"com.apple.remotemanagement.configs.daemon";
  }
  else {
    objc_super v5 = @"com.apple.remotemanagement.configs.agent";
  }
  v6 = [v4 _eventDescriptorByNameForEventStreamNamed:v5];
  if (MEMORY[0x26115B8B0]() == MEMORY[0x263EF8708])
  {
    v8 = objc_opt_new();
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __79__RMConfigurationSubscriberEventStream__configuredConfigurationTypesWithScope___block_invoke;
    applier[3] = &unk_26548F818;
    id v13 = v8;
    id v9 = v8;
    xpc_dictionary_apply(v6, applier);
    v10 = [v9 allObjects];
    id v7 = [v10 sortedArrayUsingSelector:sel_compare_];
  }
  else
  {
    id v7 = (void *)MEMORY[0x263EFFA68];
  }

  return v7;
}

uint64_t __79__RMConfigurationSubscriberEventStream__configuredConfigurationTypesWithScope___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (MEMORY[0x26115B8B0]() == MEMORY[0x263EF8708])
  {
    objc_super v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v6 = +[RMConfigurationSubscriberDescription descriptionWithEventsDictionary:v5];
    id v7 = [v6 types];
    if ([v7 count]) {
      [*(id *)(a1 + 32) addObjectsFromArray:v7];
    }
  }
  return 1;
}

- (NSArray)configurationTypes
{
  configurationTypes = self->_configurationTypes;
  if (!configurationTypes)
  {
    objc_msgSend((id)objc_opt_class(), "_configuredConfigurationTypesWithScope:", -[RMConfigurationSubscriberEventStream scope](self, "scope"));
    id v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_super v5 = self->_configurationTypes;
    self->_configurationTypes = v4;

    configurationTypes = self->_configurationTypes;
  }
  v6 = configurationTypes;
  return v6;
}

+ (id)_eventDescriptorByNameForEventStreamNamed:(id)a3
{
  [a3 UTF8String];
  v3 = (void *)xpc_copy_event();
  return v3;
}

- (void)dealloc
{
  if (self->_eventStreamObserver)
  {
    v3 = [MEMORY[0x263F08A00] defaultCenter];
    [v3 removeObserver:self->_eventStreamObserver];

    id eventStreamObserver = self->_eventStreamObserver;
    self->_id eventStreamObserver = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)RMConfigurationSubscriberEventStream;
  [(RMConfigurationSubscriberEventStream *)&v5 dealloc];
}

- (void)start
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_25B003000, log, OS_LOG_TYPE_DEBUG, "Setting up event handler", v1, 2u);
}

- (void)_setupEventHandler
{
  objc_initWeak(&location, self);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  int64_t v4 = [(RMConfigurationSubscriberEventStream *)self scope];
  objc_super v5 = @"com.apple.remotemanagement.configs.agent";
  if (v4 == 1) {
    objc_super v5 = @"com.apple.remotemanagement.configs.daemon";
  }
  v6 = v5;
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __58__RMConfigurationSubscriberEventStream__setupEventHandler__block_invoke;
  v11 = &unk_26548F840;
  objc_copyWeak(&v12, &location);
  id v7 = [v3 addObserverForName:v6 object:0 queue:0 usingBlock:&v8];
  -[RMConfigurationSubscriberEventStream setEventStreamObserver:](self, "setEventStreamObserver:", v7, v8, v9, v10, v11);

  objc_msgSend((id)objc_opt_class(), "_setupEventHandlerWithScope:", -[RMConfigurationSubscriberEventStream scope](self, "scope"));
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __58__RMConfigurationSubscriberEventStream__setupEventHandler__block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 userInfo];
  id v5 = [v3 objectForKeyedSubscript:@"Event"];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleEvent:v5];
}

- (void)_handleEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int64_t v4 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  id v5 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    int v18 = 138543362;
    v19 = v4;
    _os_log_impl(&dword_25B003000, v5, OS_LOG_TYPE_INFO, "Received event stream message: %{public}@", (uint8_t *)&v18, 0xCu);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = [v4 objectForKeyedSubscript:@"ConfigurationTypes"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v7 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        -[RMConfigurationSubscriberEventStream _handleEvent:].cold.4();
      }
      goto LABEL_21;
    }
    id v7 = [MEMORY[0x263EFF9C0] setWithArray:v6];
    uint64_t v8 = (void *)MEMORY[0x263EFF9C0];
    uint64_t v9 = [(RMConfigurationSubscriberEventStream *)self configurationTypes];
    v10 = [v8 setWithArray:v9];

    [v7 minusSet:v10];
    v11 = [MEMORY[0x263EFFA08] setWithArray:v6];
    [v10 intersectSet:v11];

    if ([v7 count])
    {
      uint64_t v12 = [v10 count];
      id v13 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
      BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_ERROR);
      if (!v12)
      {
        if (v14) {
          -[RMConfigurationSubscriberEventStream _handleEvent:]();
        }

        goto LABEL_20;
      }
      if (v14) {
        -[RMConfigurationSubscriberEventStream _handleEvent:]();
      }
    }
    v15 = [v10 allObjects];
    uint64_t v16 = [v15 sortedArrayUsingSelector:sel_compare_];

    v17 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[RMConfigurationSubscriberEventStream _handleEvent:]();
    }

    [(RMConfigurationSubscriberEventStream *)self _fetchConfigurations:v16];
    v6 = v16;
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v6 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    -[RMConfigurationSubscriberEventStream _handleEvent:].cold.5();
  }
LABEL_22:
}

- (void)_fetchConfigurations:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[RMConfigurationSubscriberEventStream _fetchConfigurations:](self);
  }

  v6 = [MEMORY[0x263EFFA08] setWithArray:v4];
  int64_t v7 = [(RMConfigurationSubscriberEventStream *)self scope];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke;
  v9[3] = &unk_26548F868;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  [(RMConfigurationSubscriberClient *)self fetchConfigurationsWithTypes:v6 scope:v7 completionHandler:v9];
}

void __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F635B0] configurationSubscriberEventStream];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke_cold_1(a1);
  }
}

+ (void)_setupEventHandlerWithScope:(int64_t)a3
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a3;
  if (_setupEventHandlerWithScope__onceToken != -1) {
    dispatch_once(&_setupEventHandlerWithScope__onceToken, block);
  }
}

void __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32) == 1) {
    v2 = @"com.apple.remotemanagement.configs.daemon";
  }
  else {
    v2 = @"com.apple.remotemanagement.configs.agent";
  }
  v3 = (const char *)[(__CFString *)v2 UTF8String];
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke_2;
  handler[3] = &__block_descriptor_40_e33_v16__0__NSObject_OS_xpc_object__8l;
  handler[4] = *(void *)(a1 + 32);
  xpc_set_event_stream_handler(v3, 0, handler);
}

void __68__RMConfigurationSubscriberEventStream__setupEventHandlerWithScope___block_invoke_2(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x263F08A00];
  id v4 = a2;
  id v5 = [v3 defaultCenter];
  if (*(void *)(a1 + 32) == 1) {
    v6 = @"com.apple.remotemanagement.configs.daemon";
  }
  else {
    v6 = @"com.apple.remotemanagement.configs.agent";
  }
  id v10 = @"Event";
  v11[0] = v4;
  int64_t v7 = NSDictionary;
  id v8 = v6;
  uint64_t v9 = [v7 dictionaryWithObjects:v11 forKeys:&v10 count:1];

  [v5 postNotificationName:v8 object:0 userInfo:v9];
}

- (id)eventStreamObserver
{
  return self->_eventStreamObserver;
}

- (void)setEventStreamObserver:(id)a3
{
}

- (int64_t)scope
{
  return self->_scope;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventStreamObserver, 0);
  objc_storeStrong((id *)&self->_configurationTypes, 0);
}

- (void)_handleEvent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_25B003000, v0, OS_LOG_TYPE_DEBUG, "Fetch of configurations with types: %{public}@...", v1, 0xCu);
}

- (void)_handleEvent:.cold.2()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Ignoring event stream message, notified about unsupported types: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleEvent:.cold.3()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Ignoring unsupported types: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleEvent:.cold.4()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Ignoring event stream message, configuration types is unexpected type: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_handleEvent:.cold.5()
{
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1(&dword_25B003000, v0, v1, "Ignoring event stream message, payload is unexpected type: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_fetchConfigurations:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = objc_msgSend(NSString, "rms_stringWithScope:", objc_msgSend(a1, "scope"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_25B003000, v2, v3, "Fetch configurations for %{public}@ scope with types: %{public}@...", v4, v5, v6, v7, v8);
}

void __61__RMConfigurationSubscriberEventStream__fetchConfigurations___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = objc_msgSend(NSString, "rms_stringWithScope:", objc_msgSend(*(id *)(a1 + 32), "scope"));
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_2(&dword_25B003000, v2, v3, "Processed configurations for %{public}@ scope with types: %{public}@...", v4, v5, v6, v7, v8);
}

@end