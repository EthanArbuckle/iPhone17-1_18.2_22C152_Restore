@interface CarrierSettingsStatusIndicator
- (CarrierSettingsStatusIndicator)init;
- (CoreTelephonyClient)coreTelephonyClient;
- (OS_dispatch_queue)queue;
- (__CFRunLoop)runloop;
- (__CFString)runloopMode;
- (void)callback;
- (void)carrierBundleChange:(id)a3;
- (void)createConnection;
- (void)preferredDataSimChanged:(id)a3;
- (void)setCallback:(void *)a3;
- (void)setCoreTelephonyClient:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRunloop:(__CFRunLoop *)a3;
- (void)setRunloopMode:(__CFString *)a3;
@end

@implementation CarrierSettingsStatusIndicator

- (CarrierSettingsStatusIndicator)init
{
  v7.receiver = self;
  v7.super_class = (Class)CarrierSettingsStatusIndicator;
  v2 = [(CarrierSettingsStatusIndicator *)&v7 init];
  if (v2)
  {
    v3 = mysyslog_get_logger();
    os_log_type_t v4 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v3, v4))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_225F82000, v3, v4, "CarrierSettingsStatusIndicator initialized.", v6, 2u);
    }
  }
  return v2;
}

- (void)createConnection
{
  dispatch_queue_t v3 = dispatch_queue_create("Carrier Settings status indicator queue", 0);
  [(CarrierSettingsStatusIndicator *)self setQueue:v3];

  os_log_type_t v4 = (void *)[objc_alloc(MEMORY[0x263F02D38]) initWithQueue:self->_queue];
  [(CarrierSettingsStatusIndicator *)self setCoreTelephonyClient:v4];

  id v5 = [(CarrierSettingsStatusIndicator *)self coreTelephonyClient];
  [v5 setDelegate:self];
}

- (void)carrierBundleChange:(id)a3
{
  os_log_type_t v4 = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225F82000, v4, v5, "carrier bundle settings changed", buf, 2u);
  }

  v6 = [(CarrierSettingsStatusIndicator *)self runloop];
  objc_super v7 = [(CarrierSettingsStatusIndicator *)self runloopMode];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__CarrierSettingsStatusIndicator_carrierBundleChange___block_invoke;
  block[3] = &unk_264784910;
  block[4] = self;
  CFRunLoopPerformBlock(v6, v7, block);
  CFRunLoopWakeUp([(CarrierSettingsStatusIndicator *)self runloop]);
}

uint64_t __54__CarrierSettingsStatusIndicator_carrierBundleChange___block_invoke(uint64_t a1)
{
  v1 = (uint64_t (*)(void))[*(id *)(a1 + 32) callback];

  return v1();
}

- (void)preferredDataSimChanged:(id)a3
{
  os_log_type_t v4 = mysyslog_get_logger();
  os_log_type_t v5 = _SC_syslog_os_log_mapping();
  if (os_log_type_enabled(v4, v5))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_225F82000, v4, v5, "user's data subscription preference changed", buf, 2u);
  }

  v6 = [(CarrierSettingsStatusIndicator *)self runloop];
  objc_super v7 = [(CarrierSettingsStatusIndicator *)self runloopMode];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__CarrierSettingsStatusIndicator_preferredDataSimChanged___block_invoke;
  block[3] = &unk_264784910;
  block[4] = self;
  CFRunLoopPerformBlock(v6, v7, block);
  CFRunLoopWakeUp([(CarrierSettingsStatusIndicator *)self runloop]);
}

uint64_t __58__CarrierSettingsStatusIndicator_preferredDataSimChanged___block_invoke(uint64_t a1)
{
  v1 = (uint64_t (*)(void))[*(id *)(a1 + 32) callback];

  return v1();
}

- (CoreTelephonyClient)coreTelephonyClient
{
  return self->_coreTelephonyClient;
}

- (void)setCoreTelephonyClient:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)callback
{
  return self->_callback;
}

- (void)setCallback:(void *)a3
{
  self->_callback = a3;
}

- (__CFRunLoop)runloop
{
  return self->_runloop;
}

- (void)setRunloop:(__CFRunLoop *)a3
{
  self->_runloop = a3;
}

- (__CFString)runloopMode
{
  return self->_runloopMode;
}

- (void)setRunloopMode:(__CFString *)a3
{
  self->_runloopMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end