@interface SPUIAppService
+ (id)sharedAppService;
+ (void)initialize;
- (SPUIAppService)init;
- (void)_cancelAwakeNotifyToken;
- (void)activate;
- (void)deactivate;
- (void)init;
- (void)registerAwakeNotifyToken;
@end

@implementation SPUIAppService

+ (void)initialize
{
  id v3 = [MEMORY[0x263F086E0] mainBundle];
  v2 = [v3 bundleIdentifier];
  runningInSpotlight = [v2 isEqualToString:@"com.apple.springboard"];
}

+ (id)sharedAppService
{
  if (sharedAppService_onceToken != -1) {
    dispatch_once(&sharedAppService_onceToken, &__block_literal_global);
  }
  v2 = (void *)sharedAppService_sAppService;
  return v2;
}

uint64_t __34__SPUIAppService_sharedAppService__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)sharedAppService_sAppService;
  sharedAppService_sAppService = v0;

  v2 = (void *)sharedAppService_sAppService;
  return [v2 registerAwakeNotifyToken];
}

- (void)_cancelAwakeNotifyToken
{
  v2 = self;
  objc_sync_enter(v2);
  int awakeNotifyToken = v2->_awakeNotifyToken;
  v2->_int awakeNotifyToken = -1;
  objc_sync_exit(v2);

  if (awakeNotifyToken != -1)
  {
    notify_cancel(awakeNotifyToken);
  }
}

- (void)registerAwakeNotifyToken
{
  v2 = self;
  objc_sync_enter(v2);
  int awakeNotifyToken = v2->_awakeNotifyToken;
  if (awakeNotifyToken != -1) {
    notify_cancel(awakeNotifyToken);
  }
  int out_token = -1;
  appServiceQueue = v2->_appServiceQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__SPUIAppService_registerAwakeNotifyToken__block_invoke;
  v7[3] = &unk_264702AB8;
  v7[4] = v2;
  uint32_t v5 = notify_register_dispatch("com.apple.searchd.launched", &out_token, appServiceQueue, v7);
  int v6 = out_token;
  if (v5) {
    int v6 = -1;
  }
  v2->_int awakeNotifyToken = v6;
  objc_sync_exit(v2);
}

void __42__SPUIAppService_registerAwakeNotifyToken__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_224D5D000, &_os_log_internal, OS_LOG_TYPE_INFO, "Got index agent wakeup notification!", buf, 2u);
  }
  int v2 = MKBGetDeviceLockState();
  if (!v2 || v2 == 3 || unlocked == 1)
  {
    unlocked = 1;
    if (runningInSpotlight)
    {
      id v3 = *(void **)(*(void *)(a1 + 32) + 24);
      id v4 = *(id *)(*(void *)(a1 + 32) + 16);
      id v5 = v3;
      kdebug_trace();
      int v6 = SPFastApplicationsGetNoBuild();
      v7 = SPFastHiddenAppsGetNoBuild();
      sendAppsInfoWithData(v5, v6, v7);
    }
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_224D5D000, &_os_log_internal, OS_LOG_TYPE_INFO, "Got index agent wakeup notification in locked state!", v9, 2u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, *(const void **)(a1 + 32), (CFNotificationCallback)lockStateChanged, @"com.apple.mobile.keybagd.lock_status", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (SPUIAppService)init
{
  v23.receiver = self;
  v23.super_class = (Class)SPUIAppService;
  int v2 = [(SPUIAppService *)&v23 init];
  id v3 = v2;
  if (v2)
  {
    v2->_int awakeNotifyToken = -1;
    id v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.searchd.appservice", v5);
    appServiceQueue = v3->_appServiceQueue;
    v3->_appServiceQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [objc_alloc(MEMORY[0x263F674C8]) initWithServiceName:@"com.apple.searchd.background" onQueue:v3->_appServiceQueue];
    backgroundConnection = v3->_backgroundConnection;
    v3->_backgroundConnection = (SPXPCConnection *)v8;

    uint64_t v10 = [objc_alloc(MEMORY[0x263F674C8]) initWithServiceName:@"com.apple.searchd" onQueue:v3->_appServiceQueue];
    appConnection = v3->_appConnection;
    v3->_appConnection = (SPXPCConnection *)v10;

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG)) {
      [(SPUIAppService *)(uint64_t)&v3->_backgroundConnection init];
    }
    if (runningInSpotlight)
    {
      v19 = v3->_appServiceQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __22__SPUIAppService_init__block_invoke;
      block[3] = &unk_264702B08;
      v22 = v3;
      dispatch_async(v19, block);
    }
  }
  return v3;
}

void __22__SPUIAppService_init__block_invoke(uint64_t a1)
{
  id v2 = *(id *)(a1 + 32);
  SPSetAppUpdateBlock();
  id v1 = (id)SPFastApplicationsGet();
}

void __22__SPUIAppService_init__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
}

- (void)activate
{
  if (!self->_activated)
  {
    self->_activated = 1;
    appServiceQueue = self->_appServiceQueue;
    qos_class_t v4 = qos_class_self();
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __26__SPUIAppService_activate__block_invoke;
    block[3] = &unk_264702B08;
    void block[4] = self;
    dispatch_block_t v5 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v4, 0, block);
    dispatch_async(appServiceQueue, v5);
  }
}

void __26__SPUIAppService_activate__block_invoke(uint64_t a1)
{
  id v2 = SPFastApplicationsGetNoBuild();
  id v3 = SPFastHiddenAppsGetNoBuild();
  qos_class_t v4 = prepareApps(v2, v3);
  dispatch_block_t v5 = (void *)[objc_alloc(MEMORY[0x263F674D0]) initWithName:@"Activate"];
  dispatch_queue_t v6 = v5;
  uint64_t v7 = MEMORY[0x263EFFA78];
  if (v4) {
    uint64_t v8 = v4;
  }
  else {
    uint64_t v8 = (void *)MEMORY[0x263EFFA78];
  }
  [v5 setRootObject:v8];
  [v6 setInfo:v7];
  [*(id *)(*(void *)(a1 + 32) + 32) sendMessage:v6 withReply:&__block_literal_global_33];
  BOOL v9 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v9) {
    __26__SPUIAppService_activate__block_invoke_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
  }
}

void __26__SPUIAppService_activate__block_invoke_2()
{
  BOOL v0 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v0) {
    __26__SPUIAppService_activate__block_invoke_2_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

- (void)deactivate
{
  if (self->_activated)
  {
    self->_activated = 0;
    appServiceQueue = self->_appServiceQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __28__SPUIAppService_deactivate__block_invoke;
    block[3] = &unk_264702B08;
    void block[4] = self;
    dispatch_block_t v3 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_BACKGROUND, 0, block);
    dispatch_async(appServiceQueue, v3);
  }
}

void __28__SPUIAppService_deactivate__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F674D0]) initWithName:@"Deactivate"];
  [v2 setInfo:0];
  [v2 setRootObject:0];
  [*(id *)(*(void *)(a1 + 32) + 32) sendMessage:v2];
  BOOL v3 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEBUG);
  if (v3) {
    __28__SPUIAppService_deactivate__block_invoke_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appConnection, 0);
  objc_storeStrong((id *)&self->_backgroundConnection, 0);
  objc_storeStrong((id *)&self->_appServiceQueue, 0);
}

- (void)init
{
}

void __26__SPUIAppService_activate__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __26__SPUIAppService_activate__block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __28__SPUIAppService_deactivate__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end