@interface SVXMyriadDeviceManager
- (SVXMyriadDeviceManager)initWithInstanceContext:(id)a3 analytics:(id)a4 preferences:(id)a5 delegate:(id)a6;
- (void)_initializeMyriadDeviceWithInstanceContext:(id)a3 analytics:(id)a4 preferences:(id)a5 delegate:(id)a6 workQueue:(id)a7 analyticsQueue:(id)a8;
- (void)preheatMyriad;
- (void)resetMyriad;
- (void)setupEnabled:(BOOL)a3;
- (void)startAdvertising:(unint64_t)a3 withSCDAGoodnessScoreContext:(id)a4 withSCDAAudioContext:(id)a5 completion:(id)a6;
@end

@implementation SVXMyriadDeviceManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

- (void)setupEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v6 = 136315138;
    v7 = "-[SVXMyriadDeviceManager setupEnabled:]";
    _os_log_impl(&dword_220062000, v5, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v6, 0xCu);
  }
  [(SVXMyriadRequestDelegate *)self->_device setupEnabled:v3];
}

- (void)resetMyriad
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[SVXMyriadDeviceManager resetMyriad]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v4, 0xCu);
  }
  [(SVXMyriadRequestDelegate *)self->_device resetMyriad];
}

- (void)preheatMyriad
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  BOOL v3 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v4 = 136315138;
    v5 = "-[SVXMyriadDeviceManager preheatMyriad]";
    _os_log_impl(&dword_220062000, v3, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v4, 0xCu);
  }
  [(SVXMyriadRequestDelegate *)self->_device preheatMyriad];
}

- (void)startAdvertising:(unint64_t)a3 withSCDAGoodnessScoreContext:(id)a4 withSCDAAudioContext:(id)a5 completion:(id)a6
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v14 = 136315138;
    v15 = "-[SVXMyriadDeviceManager startAdvertising:withSCDAGoodnessScoreContext:withSCDAAudioContext:completion:]";
    _os_log_impl(&dword_220062000, v13, OS_LOG_TYPE_INFO, "%s #myriad", (uint8_t *)&v14, 0xCu);
  }
  [(SVXMyriadRequestDelegate *)self->_device startAdvertising:a3 withSCDAGoodnessScoreContext:v10 withSCDAAudioContext:v11 completion:v12];
}

- (void)_initializeMyriadDeviceWithInstanceContext:(id)a3 analytics:(id)a4 preferences:(id)a5 delegate:(id)a6 workQueue:(id)a7 analyticsQueue:(id)a8
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v10 = a6;
  id v11 = a7;
  id v12 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_INFO))
  {
    int v15 = 136315138;
    uint64_t v16 = "-[SVXMyriadDeviceManager _initializeMyriadDeviceWithInstanceContext:analytics:preferences:delegate:workQueue:analyticsQueue:]";
    _os_log_impl(&dword_220062000, v12, OS_LOG_TYPE_INFO, "%s #myriad Initializing Myriad on host device", (uint8_t *)&v15, 0xCu);
  }
  v13 = [[SVXMyriadHostDevice alloc] initWithDelegate:v10 queue:v11];
  device = self->_device;
  self->_device = (SVXMyriadRequestDelegate *)v13;
}

- (SVXMyriadDeviceManager)initWithInstanceContext:(id)a3 analytics:(id)a4 preferences:(id)a5 delegate:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SVXMyriadDeviceManager;
  int v14 = [(SVXMyriadDeviceManager *)&v25 init];
  if (v14)
  {
    int v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v16 = dispatch_queue_attr_make_with_qos_class(v15, QOS_CLASS_USER_INTERACTIVE, 0);

    if (SVXDispatchRootQueueGetHighPriority_onceToken != -1) {
      dispatch_once(&SVXDispatchRootQueueGetHighPriority_onceToken, &__block_literal_global_4974);
    }
    uint64_t v17 = (id)SVXDispatchRootQueueGetHighPriority_queue;
    dispatch_queue_t v18 = dispatch_queue_create_with_target_V2("com.apple.SiriHeadlessService.myriadproxy", v16, v17);
    queue = v14->_queue;
    v14->_queue = (OS_dispatch_queue *)v18;

    v20 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = dispatch_queue_attr_make_with_qos_class(v20, QOS_CLASS_UTILITY, 0);

    dispatch_queue_t v22 = dispatch_queue_create("com.apple.SiriHeadlessService.myriadproxy.analytics", v21);
    analyticsQueue = v14->_analyticsQueue;
    v14->_analyticsQueue = (OS_dispatch_queue *)v22;

    [(SVXMyriadDeviceManager *)v14 _initializeMyriadDeviceWithInstanceContext:v10 analytics:v11 preferences:v12 delegate:v13 workQueue:v14->_queue analyticsQueue:v14->_analyticsQueue];
  }

  return v14;
}

@end