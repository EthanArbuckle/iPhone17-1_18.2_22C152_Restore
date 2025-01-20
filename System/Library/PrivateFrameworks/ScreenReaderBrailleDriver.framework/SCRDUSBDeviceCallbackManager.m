@interface SCRDUSBDeviceCallbackManager
+ (id)sharedManager;
- (SCRDUSBDeviceCallbackManager)init;
- (_SCRDUSBDeviceCompletion)completionWithReference:(void *)a3;
- (void)addCompletion:(_SCRDUSBDeviceCompletion *)a3;
- (void)removeCompletion:(void *)a3;
@end

@implementation SCRDUSBDeviceCallbackManager

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1) {
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedManager_manager;

  return v2;
}

uint64_t __45__SCRDUSBDeviceCallbackManager_sharedManager__block_invoke()
{
  sharedManager_manager = objc_alloc_init(SCRDUSBDeviceCallbackManager);

  return MEMORY[0x270F9A758]();
}

- (SCRDUSBDeviceCallbackManager)init
{
  v9.receiver = self;
  v9.super_class = (Class)SCRDUSBDeviceCallbackManager;
  v2 = [(SCRDUSBDeviceCallbackManager *)&v9 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    completions = v2->_completions;
    v2->_completions = v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v6 = dispatch_queue_create("com.apple.ScreenReaderOutput.usbDeviceCallback.clientQueue", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;
  }
  return v2;
}

- (void)addCompletion:(_SCRDUSBDeviceCompletion *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __46__SCRDUSBDeviceCallbackManager_addCompletion___block_invoke;
  v4[3] = &unk_264CB2FA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __46__SCRDUSBDeviceCallbackManager_addCompletion___block_invoke(uint64_t a1)
{
  id v5 = [MEMORY[0x263F08D40] valueWithPointer:*(void *)(a1 + 40)];
  uint64_t v2 = [v5 pointerValue];
  v3 = *(void **)(*(void *)(a1 + 32) + 8);
  v4 = [NSNumber numberWithUnsignedInt:v2];
  [v3 setObject:v5 forKey:v4];
}

- (void)removeCompletion:(void *)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SCRDUSBDeviceCallbackManager_removeCompletion___block_invoke;
  v4[3] = &unk_264CB2FA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __49__SCRDUSBDeviceCallbackManager_removeCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(*(void *)(a1 + 32) + 8);
  id v2 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 40)];
  [v1 removeObjectForKey:v2];
}

- (_SCRDUSBDeviceCompletion)completionWithReference:(void *)a3
{
  uint64_t v8 = 0;
  objc_super v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  id v13 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCRDUSBDeviceCallbackManager_completionWithReference___block_invoke;
  block[3] = &unk_264CB2FC8;
  block[4] = self;
  block[5] = &v8;
  block[6] = a3;
  dispatch_sync(queue, block);
  v4 = (void *)v9[5];
  if (v4) {
    id v5 = (_SCRDUSBDeviceCompletion *)[v4 pointerValue];
  }
  else {
    id v5 = 0;
  }
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __56__SCRDUSBDeviceCallbackManager_completionWithReference___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = [NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  uint64_t v3 = [v2 objectForKey:v6];
  uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_completions, 0);
}

@end