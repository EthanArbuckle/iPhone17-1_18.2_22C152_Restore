@interface WLSourceDevicesControllerSurrogate
- (WLSourceDevicesControllerSurrogate)initWithDelegate:(id)a3;
- (void)scheduleSurrogateDeviceDiscovery;
- (void)startWiFiAndDeviceDiscoveryWithCompletion:(id)a3;
- (void)stopDeviceDiscoveryWithCompletion:(id)a3;
- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3;
@end

@implementation WLSourceDevicesControllerSurrogate

- (WLSourceDevicesControllerSurrogate)initWithDelegate:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WLSourceDevicesControllerSurrogate;
  v3 = [(WLSourceDevicesController *)&v7 initWithDelegate:a3];
  if (v3)
  {
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.welcomekit.sourceDeviceControllerSurrogate", 0);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v4;
  }
  return v3;
}

- (void)startWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 500000000);
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __80__WLSourceDevicesControllerSurrogate_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_264C65F30;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, serialQueue, v8);
}

void __80__WLSourceDevicesControllerSurrogate_startWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  v2 = [MEMORY[0x263F08C38] UUID];
  id obj = [v2 UUIDString];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 56), obj);
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"%06u", arc4random_uniform(0xF423Fu));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(uint64_t, uint64_t, __CFString *, __CFString *, void *, uint64_t, void))(v4 + 16))(v4, 1, @"fake ssid", @"fake psk", v3, -1, 0);
  }
}

- (void)scheduleSurrogateDeviceDiscovery
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __70__WLSourceDevicesControllerSurrogate_scheduleSurrogateDeviceDiscovery__block_invoke;
  block[3] = &unk_264C65F58;
  block[4] = self;
  dispatch_after(v3, serialQueue, block);
}

void __70__WLSourceDevicesControllerSurrogate_scheduleSurrogateDeviceDiscovery__block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 56))
  {
    dispatch_time_t v3 = objc_alloc_init(WLSourceDevice);
    [(WLSourceDevice *)v3 setName:@"UI Test Mode"];
    v2 = [*(id *)(a1 + 32) delegate];
    [v2 sourceDeviceController:*(void *)(a1 + 32) didDiscoverDevice:v3];
  }
}

- (void)stopDeviceDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__WLSourceDevicesControllerSurrogate_stopDeviceDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_264C65F30;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, serialQueue, v8);
}

uint64_t __72__WLSourceDevicesControllerSurrogate_stopDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 48))
  {
    dispatch_time_t v3 = *(void **)(v2 + 56);
    *(void *)(v2 + 56) = 0;
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    dispatch_time_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void)stopWiFiAndDeviceDiscoveryWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = dispatch_time(0, 100000000);
  serialQueue = self->_serialQueue;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __79__WLSourceDevicesControllerSurrogate_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke;
  v8[3] = &unk_264C65F30;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_after(v5, serialQueue, v8);
}

uint64_t __79__WLSourceDevicesControllerSurrogate_stopWiFiAndDeviceDiscoveryWithCompletion___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 0;
  uint64_t v2 = *(void *)(a1 + 32);
  dispatch_time_t v3 = *(void **)(v2 + 56);
  *(void *)(v2 + 56) = 0;

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    dispatch_time_t v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceDiscoverySession, 0);

  objc_storeStrong((id *)&self->_serialQueue, 0);
}

@end