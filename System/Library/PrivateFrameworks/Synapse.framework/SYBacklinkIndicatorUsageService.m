@interface SYBacklinkIndicatorUsageService
+ (_SYBacklinkIndicatorUsageService_TestingDelegate)_testingDelegate;
+ (id)_listenerEndpoint;
+ (id)sharedInstance;
+ (void)beginObservingUsage;
+ (void)set_testingDelegate:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)listener;
- (SYBacklinkIndicatorUsageService)init;
- (void)dealloc;
- (void)didActivateBacklinkItemWithIdentifier:(id)a3;
- (void)didDismissBacklinkItemWithIdentifier:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation SYBacklinkIndicatorUsageService

+ (void)beginObservingUsage
{
  id v2 = (id)[a1 sharedInstance];
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_15);
  }
  id v2 = (void *)sharedInstance___instance_0;
  return v2;
}

uint64_t __49__SYBacklinkIndicatorUsageService_sharedInstance__block_invoke()
{
  sharedInstance___instance_0 = objc_alloc_init(SYBacklinkIndicatorUsageService);
  return MEMORY[0x1F41817F8]();
}

- (SYBacklinkIndicatorUsageService)init
{
  v9.receiver = self;
  v9.super_class = (Class)SYBacklinkIndicatorUsageService;
  id v2 = [(SYBacklinkIndicatorUsageService *)&v9 init];
  if (v2)
  {
    v3 = os_log_create("com.apple.synapse", "");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C2C5F000, v3, OS_LOG_TYPE_DEFAULT, "Starting Backlink Manager Service", v8, 2u);
    }

    v4 = [(id)objc_opt_class() _testingDelegate];

    if (v4)
    {
      uint64_t v5 = [MEMORY[0x1E4F29290] anonymousListener];
    }
    else
    {
      uint64_t v5 = [objc_alloc(MEMORY[0x1E4F29290]) initWithMachServiceName:@"com.apple.synapse.backlink-indicator-usage"];
    }
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v5;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    [(NSXPCListener *)v2->_listener resume];
  }
  return v2;
}

- (void)dealloc
{
  [(NSXPCListener *)self->_listener setDelegate:0];
  [(NSXPCListener *)self->_listener invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SYBacklinkIndicatorUsageService;
  [(SYBacklinkIndicatorUsageService *)&v3 dealloc];
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  v7 = (NSXPCListener *)a3;
  id v8 = a4;
  if (!v8)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SYBacklinkIndicatorUsageService.m", 58, @"Invalid parameter not satisfying: %@", @"newConnection" object file lineNumber description];
  }
  listener = self->_listener;
  if (listener == v7)
  {
    v10 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1E2D818];
    [v8 setExportedInterface:v10];
  }
  [v8 setExportedObject:self];
  [v8 resume];

  return listener == v7;
}

- (void)didActivateBacklinkItemWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v3 = [(id)objc_opt_class() _testingDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v3 didActivateBacklinkItemWithIdentifier:v4];
  }
}

- (void)didDismissBacklinkItemWithIdentifier:(id)a3
{
  id v4 = a3;
  objc_super v3 = [(id)objc_opt_class() _testingDelegate];
  if (v3 && (objc_opt_respondsToSelector() & 1) != 0) {
    [v3 didDismissBacklinkItemWithIdentifier:v4];
  }
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (void).cxx_destruct
{
}

+ (_SYBacklinkIndicatorUsageService_TestingDelegate)_testingDelegate
{
  return (_SYBacklinkIndicatorUsageService_TestingDelegate *)(id)__testingDelegate;
}

+ (void)set_testingDelegate:(id)a3
{
}

+ (id)_listenerEndpoint
{
  id v2 = +[SYBacklinkIndicatorUsageService sharedInstance];
  objc_super v3 = [v2[1] endpoint];

  return v3;
}

@end