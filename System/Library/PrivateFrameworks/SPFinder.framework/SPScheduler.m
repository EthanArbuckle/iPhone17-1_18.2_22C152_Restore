@interface SPScheduler
- (FMXPCServiceDescription)serviceDescription;
- (FMXPCSession)session;
- (OS_dispatch_queue)queue;
- (SPScheduler)init;
- (SPSchedulerXPCProtocol)proxy;
- (id)remoteInterface;
- (void)dealloc;
- (void)publishImmediatelyWithCompletion:(id)a3;
- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4;
- (void)setProxy:(id)a3;
- (void)setQueue:(id)a3;
- (void)setServiceDescription:(id)a3;
- (void)setSession:(id)a3;
@end

@implementation SPScheduler

- (SPScheduler)init
{
  v11.receiver = self;
  v11.super_class = (Class)SPScheduler;
  v2 = [(SPScheduler *)&v11 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.icloud.searchpartyd.scheduler", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(MEMORY[0x263F3BA20]);
    v7 = [(SPScheduler *)v2 remoteInterface];
    uint64_t v8 = [v6 initWithMachServiceName:@"com.apple.icloud.searchpartyd.scheduler" options:0 remoteObjectInterface:v7 interruptionHandler:0 invalidationHandler:0];
    serviceDescription = v2->_serviceDescription;
    v2->_serviceDescription = (FMXPCServiceDescription *)v8;
  }
  return v2;
}

- (void)dealloc
{
  v3 = [(SPScheduler *)self session];
  [v3 invalidate];

  [(SPScheduler *)self setSession:0];
  v4.receiver = self;
  v4.super_class = (Class)SPScheduler;
  [(SPScheduler *)&v4 dealloc];
}

- (SPSchedulerXPCProtocol)proxy
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v3 = [(SPScheduler *)self queue];
  dispatch_assert_queue_V2(v3);

  objc_super v4 = [(SPScheduler *)self session];

  if (!v4)
  {
    id v5 = objc_alloc(MEMORY[0x263F3BA28]);
    id v6 = [(SPScheduler *)self serviceDescription];
    v7 = (void *)[v5 initWithServiceDescription:v6];
    [(SPScheduler *)self setSession:v7];

    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [(SPScheduler *)self serviceDescription];
      v9 = [v8 machService];
      int v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_2211E2000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "SPScheduler: Establishing XPC connection to %@", (uint8_t *)&v14, 0xCu);
    }
    v10 = [(SPScheduler *)self session];
    [v10 resume];
  }
  objc_super v11 = [(SPScheduler *)self session];
  v12 = [v11 proxy];

  return (SPSchedulerXPCProtocol *)v12;
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D312B98];
}

- (void)schedulePublishWakeWithInformation:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  activity_block[0] = MEMORY[0x263EF8330];
  activity_block[1] = 3221225472;
  activity_block[2] = __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke;
  activity_block[3] = &unk_264597B20;
  activity_block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  _os_activity_initiate(&dword_2211E2000, "SPScheduler schedulePublishWakeWithInformation", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

void __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke(id *a1)
{
  objc_initWeak(&location, a1[4]);
  v2 = [a1[4] queue];
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke_2;
  v3[3] = &unk_264597AF8;
  objc_copyWeak(&v6, &location);
  id v4 = a1[5];
  id v5 = a1[6];
  dispatch_async(v2, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __61__SPScheduler_schedulePublishWakeWithInformation_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v2 = [WeakRetained proxy];
  [v2 schedulePublishWakeWithInformation:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)publishImmediatelyWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke;
  v6[3] = &unk_264597B70;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  _os_activity_initiate(&dword_2211E2000, "SPScheduler publishImmediatelyWithCompletion", OS_ACTIVITY_FLAG_DEFAULT, v6);
}

void __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [*(id *)(a1 + 32) queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke_2;
  block[3] = &unk_264597B48;
  objc_copyWeak(&v5, &location);
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, block);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __48__SPScheduler_publishImmediatelyWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = [WeakRetained proxy];
  [v2 publishImmediatelyWithCompletion:*(void *)(a1 + 32)];
}

- (FMXPCServiceDescription)serviceDescription
{
  return self->_serviceDescription;
}

- (void)setServiceDescription:(id)a3
{
}

- (FMXPCSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (void)setProxy:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_proxy, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_serviceDescription, 0);
}

@end