@interface MRExternalDeviceManager
+ (id)sharedManager;
- (MRExternalDeviceManager)init;
- (NSArray)allDevices;
- (id)deviceWithIdentifier:(id)a3;
- (void)clearDevices;
- (void)registerDevice:(id)a3;
@end

@implementation MRExternalDeviceManager

+ (id)sharedManager
{
  if (sharedManager___once_0 != -1) {
    dispatch_once(&sharedManager___once_0, &__block_literal_global_37);
  }
  v2 = (void *)sharedManager___sharedManager;

  return v2;
}

uint64_t __40__MRExternalDeviceManager_sharedManager__block_invoke()
{
  sharedManager___sharedManager = objc_alloc_init(MRExternalDeviceManager);

  return MEMORY[0x1F41817F8]();
}

- (MRExternalDeviceManager)init
{
  v11.receiver = self;
  v11.super_class = (Class)MRExternalDeviceManager;
  v2 = [(MRExternalDeviceManager *)&v11 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
    devicesPointerArray = v2->_devicesPointerArray;
    v2->_devicesPointerArray = (NSPointerArray *)v3;

    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create(Name, v7);
    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v8;
  }
  return v2;
}

- (NSArray)allDevices
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__12;
  v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  serialQueue = self->_serialQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __37__MRExternalDeviceManager_allDevices__block_invoke;
  v5[3] = &unk_1E57D0590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(serialQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __37__MRExternalDeviceManager_allDevices__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 8) allObjects];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)deviceWithIdentifier:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(MRExternalDeviceManager *)self allDevices];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (v9)
        {
          v10 = objc_msgSend(MEMORY[0x1E4F1CA98], "null", (void)v14);

          if (v9 != v10)
          {
            id v11 = [v9 deviceInfo];
            v12 = [v11 identifier];

            if ([v4 isEqualToString:v12])
            {
              id v6 = v9;

              goto LABEL_14;
            }
          }
        }
      }
      id v6 = (id)[v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_14:

  return v6;
}

- (void)registerDevice:(id)a3
{
  id v4 = a3;
  serialQueue = self->_serialQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__MRExternalDeviceManager_registerDevice___block_invoke;
  v7[3] = &unk_1E57D0790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(serialQueue, v7);
}

uint64_t __42__MRExternalDeviceManager_registerDevice___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) addPointer:*(void *)(a1 + 40)];
}

- (void)clearDevices
{
  serialQueue = self->_serialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__MRExternalDeviceManager_clearDevices__block_invoke;
  block[3] = &unk_1E57D0518;
  block[4] = self;
  dispatch_sync(serialQueue, block);
}

uint64_t __39__MRExternalDeviceManager_clearDevices__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) setCount:0];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);

  objc_storeStrong((id *)&self->_devicesPointerArray, 0);
}

@end