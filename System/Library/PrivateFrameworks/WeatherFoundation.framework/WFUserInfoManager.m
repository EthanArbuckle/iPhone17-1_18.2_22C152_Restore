@interface WFUserInfoManager
- (NSUbiquitousKeyValueStore)encryptedStore;
- (OS_dispatch_queue)callbackQueue;
- (OS_dispatch_queue)ubiquitousKVSCommunicationsQueue;
- (WFUserInfoManager)init;
- (WFUserInfoManagerDelegate)delegate;
- (void)dealloc;
- (void)readUserIdentifierAndNotify;
- (void)setCallbackQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setUbiquitousKVSCommunicationsQueue:(id)a3;
@end

@implementation WFUserInfoManager

- (WFUserInfoManager)init
{
  v15.receiver = self;
  v15.super_class = (Class)WFUserInfoManager;
  v2 = [(WFUserInfoManager *)&v15 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.WeatherFoundation.ubiquitousKVSCommunicationsQueue", v3);
    ubiquitousKVSCommunicationsQueue = v2->_ubiquitousKVSCommunicationsQueue;
    v2->_ubiquitousKVSCommunicationsQueue = (OS_dispatch_queue *)v4;

    v6 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.WeatherFoundation.callbackQueue", v6);
    callbackQueue = v2->_callbackQueue;
    v2->_callbackQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = [objc_alloc(MEMORY[0x263F08C40]) _initWithStoreIdentifier:@"com.apple.weather" usingEndToEndEncryption:1];
    encryptedStore = v2->_encryptedStore;
    v2->_encryptedStore = (NSUbiquitousKeyValueStore *)v9;

    v11 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v12 = *MEMORY[0x263F085E8];
    v13 = [(WFUserInfoManager *)v2 encryptedStore];
    [v11 addObserver:v2 selector:sel_encryptedStoreChanged_ name:v12 object:v13];
  }
  return v2;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)WFUserInfoManager;
  [(WFUserInfoManager *)&v4 dealloc];
}

- (void)readUserIdentifierAndNotify
{
  v3 = [(WFUserInfoManager *)self ubiquitousKVSCommunicationsQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke;
  block[3] = &unk_2644305E8;
  block[4] = self;
  dispatch_async(v3, block);
}

void __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke(uint64_t a1)
{
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  v2 = (unsigned int (*)(void))getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  v14 = getMKBDeviceUnlockedSinceBootSymbolLoc_ptr;
  if (!getMKBDeviceUnlockedSinceBootSymbolLoc_ptr)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke;
    v10[3] = &unk_2644316A8;
    v10[4] = &v11;
    __getMKBDeviceUnlockedSinceBootSymbolLoc_block_invoke((uint64_t)v10);
    v2 = (unsigned int (*)(void))v12[3];
  }
  _Block_object_dispose(&v11, 8);
  if (!v2)
  {
    dispatch_queue_t v7 = (_Unwind_Exception *)__48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_cold_1();
    _Block_object_dispose(&v11, 8);
    _Unwind_Resume(v7);
  }
  if (v2() == 1)
  {
    v3 = [*(id *)(a1 + 32) encryptedStore];
    objc_super v4 = [v3 stringForKey:@"userIdentifier"];
  }
  else
  {
    v3 = [MEMORY[0x263F087E8] errorWithDomain:@"com.apple.weather.foundation.userInfoManager.errorDomain" code:1 userInfo:0];
    objc_super v4 = 0;
  }

  v5 = [*(id *)(a1 + 32) callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_2;
  block[3] = &unk_264431680;
  block[4] = *(void *)(a1 + 32);
  id v9 = v4;
  id v6 = v4;
  dispatch_async(v5, block);
}

void __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 userInfoManager:*(void *)(a1 + 32) didSynchronizeUserIdentifier:*(void *)(a1 + 40)];
}

- (NSUbiquitousKeyValueStore)encryptedStore
{
  return self->_encryptedStore;
}

- (WFUserInfoManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)ubiquitousKVSCommunicationsQueue
{
  return self->_ubiquitousKVSCommunicationsQueue;
}

- (void)setUbiquitousKVSCommunicationsQueue:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_ubiquitousKVSCommunicationsQueue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_encryptedStore, 0);
}

uint64_t __48__WFUserInfoManager_readUserIdentifierAndNotify__block_invoke_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[WFWeatherAlmanacParserV3 parseForecastData:types:location:locale:date:error:rules:](v0);
}

@end