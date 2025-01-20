@interface PDRRegistry
+ (BOOL)supportsPairedDevice;
+ (id)activeDeviceSelectorBlock;
+ (id)activePairedDeviceSelectorBlock;
+ (id)pairedDevicesSelectorBlock;
+ (id)setupCompletedDevicesSelectorBlock;
+ (id)sharedInstance;
- (BOOL)isPaired;
- (BOOL)removeDelegate:(id)a3;
- (BOOL)started;
- (OS_dispatch_queue)callbackQueue;
- (PDRRegistry)init;
- (id)deviceForBluetoothID:(id)a3;
- (id)deviceForPairingID:(id)a3;
- (id)deviceFromNRDevice:(id)a3;
- (id)getActiveDevice;
- (id)getActivePairedDeviceExcludingAltAccount;
- (id)getActivePairedDeviceIncludingAltAccount;
- (id)getAllDevices;
- (id)getAllDevicesWithArchivedAltAccountDevicesMatching:(id)a3;
- (id)getAllDevicesWithArchivedDevices;
- (id)getAllDevicesWithArchivedDevicesMatching:(id)a3;
- (id)getDevices;
- (id)getDevicesExcluding:(unint64_t)a3;
- (id)getDevicesMatching:(id)a3;
- (id)getPairedDevices;
- (id)getSetupCompletedDevices;
- (id)pairingID;
- (id)pairingStorePath;
- (int64_t)compatibilityState;
- (int64_t)status;
- (unint64_t)switchIndex;
- (void)addDelegate:(id)a3;
- (void)getDevicesWithBlock:(id)a3;
- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4;
- (void)setCallbackQueue:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation PDRRegistry

- (id)getAllDevices
{
  return [(PDRRegistry *)self getDevicesMatching:&__block_literal_global];
}

- (void).cxx_destruct
{
}

+ (id)sharedInstance
{
  id v2 = instanceClass();
  return (id)[v2 sharedInstance];
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (id)getDevicesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __53__PDRRegistry_NanoRegistryStyle__getDevicesMatching___block_invoke;
  v8[3] = &unk_2654364F0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(PDRRegistry *)self getDevicesWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (id)getAllDevicesWithArchivedAltAccountDevicesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __85__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke;
  v8[3] = &unk_2654364F0;
  id v5 = v4;
  id v9 = v5;
  v10 = &v11;
  [(PDRRegistry *)self getDevicesWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

- (void)getDevicesWithBlock:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  id v5 = [(PDRRegistry *)self getDevicesExcluding:0];
  v4[2](v4, v5);
}

void __85__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedAltAccountDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

void __53__PDRRegistry_NanoRegistryStyle__getDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if (([v8 isArchived] & 1) == 0
          && ([v8 isAltAccount] & 1) == 0
          && (*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))())
        {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (PDRRegistry)init
{
  instanceClass();
  if (objc_opt_isKindOfClass())
  {
    id v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.nanoregistry.paireddeviceregistry", v3);
    [(PDRRegistry *)self setCallbackQueue:v4];

    v7.receiver = self;
    v7.super_class = (Class)PDRRegistry;
    return [(PDRRegistry *)&v7 init];
  }
  else
  {
    uint64_t v6 = (PDRRegistry *)objc_alloc_init((Class)instanceClass());

    return v6;
  }
}

- (void)setCallbackQueue:(id)a3
{
}

- (id)getDevices
{
  id v3 = [(id)objc_opt_class() activePairedDeviceSelectorBlock];
  dispatch_queue_t v4 = [(PDRRegistry *)self getDevicesMatching:v3];

  return v4;
}

- (id)getPairedDevices
{
  id v3 = [(id)objc_opt_class() pairedDevicesSelectorBlock];
  dispatch_queue_t v4 = [(PDRRegistry *)self getDevicesMatching:v3];

  return v4;
}

- (id)getSetupCompletedDevices
{
  id v3 = [(id)objc_opt_class() setupCompletedDevicesSelectorBlock];
  dispatch_queue_t v4 = [(PDRRegistry *)self getDevicesMatching:v3];

  return v4;
}

uint64_t __47__PDRRegistry_NanoRegistryStyle__getAllDevices__block_invoke()
{
  return 1;
}

- (id)getAllDevicesWithArchivedDevices
{
  return [(PDRRegistry *)self getAllDevicesWithArchivedDevicesMatching:&__block_literal_global_2];
}

uint64_t __66__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedDevices__block_invoke()
{
  return 1;
}

+ (id)activeDeviceSelectorBlock
{
  return &__block_literal_global_4;
}

uint64_t __59__PDRRegistry_NanoRegistryStyle__activeDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isActive];
}

+ (id)pairedDevicesSelectorBlock
{
  return &__block_literal_global_6;
}

uint64_t __60__PDRRegistry_NanoRegistryStyle__pairedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPaired];
}

+ (id)activePairedDeviceSelectorBlock
{
  return &__block_literal_global_8;
}

uint64_t __65__PDRRegistry_NanoRegistryStyle__activePairedDeviceSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPaired]) {
    uint64_t v3 = [v2 isActive];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

+ (id)setupCompletedDevicesSelectorBlock
{
  return &__block_literal_global_10;
}

uint64_t __68__PDRRegistry_NanoRegistryStyle__setupCompletedDevicesSelectorBlock__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ([v2 isPaired]) {
    uint64_t v3 = [v2 isSetup];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

- (id)getAllDevicesWithArchivedDevicesMatching:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  long long v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  id v16 = (id)objc_opt_new();
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __75__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedDevicesMatching___block_invoke;
  v8[3] = &unk_2654364F0;
  id v5 = v4;
  id v9 = v5;
  long long v10 = &v11;
  [(PDRRegistry *)self getDevicesWithBlock:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __75__PDRRegistry_NanoRegistryStyle__getAllDevicesWithArchivedDevicesMatching___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v9 + 1) + 8 * v7);
        if ((*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))() && ([v8 isAltAccount] & 1) == 0) {
          [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObject:v8];
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (id)deviceFromNRDevice:(id)a3
{
  uint64_t v4 = [a3 pairingID];
  uint64_t v5 = [(PDRRegistry *)self deviceForPairingID:v4];

  return v5;
}

+ (BOOL)supportsPairedDevice
{
  return +[PDRRegistry_Impl supportsWatch];
}

- (BOOL)started
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (int64_t)status
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (int64_t)compatibilityState
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (void)start
{
  OUTLINED_FUNCTION_1();
  objc_opt_class();
  uint64_t v2 = OUTLINED_FUNCTION_2();
  MEMORY[0x270EF2BB8](v2, v3, v4);
}

- (void)stop
{
  OUTLINED_FUNCTION_1();
  objc_opt_class();
  uint64_t v2 = OUTLINED_FUNCTION_2();
  MEMORY[0x270EF2BB8](v2, v3, v4);
}

- (BOOL)isPaired
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)pairingStorePath
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)pairingID
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (unint64_t)switchIndex
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return -1;
}

- (id)getDevicesExcluding:(unint64_t)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

- (id)getActivePairedDeviceIncludingAltAccount
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)getActivePairedDeviceExcludingAltAccount
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (id)getActiveDevice
{
  OUTLINED_FUNCTION_1();
  uint64_t v2 = objc_opt_class();
  OUTLINED_FUNCTION_0(v2);
  return 0;
}

- (void)getSwitchEventsAfterIndex:(unsigned int)a3 process:(id)a4
{
  OUTLINED_FUNCTION_1();
  objc_opt_class();
  uint64_t v4 = OUTLINED_FUNCTION_2();
  MEMORY[0x270EF2BB8](v4, v5, v6);
}

- (id)deviceForBluetoothID:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

- (id)deviceForPairingID:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

- (void)addDelegate:(id)a3
{
  OUTLINED_FUNCTION_1();
  objc_opt_class();
  uint64_t v3 = OUTLINED_FUNCTION_2();
  MEMORY[0x270EF2BB8](v3, v4, v5);
}

- (BOOL)removeDelegate:(id)a3
{
  OUTLINED_FUNCTION_1();
  uint64_t v3 = objc_opt_class();
  OUTLINED_FUNCTION_0(v3);
  return 0;
}

@end