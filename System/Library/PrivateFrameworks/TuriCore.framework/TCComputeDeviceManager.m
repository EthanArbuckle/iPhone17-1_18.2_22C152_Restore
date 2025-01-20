@interface TCComputeDeviceManager
+ (id)sharedInstance;
- (TCComputeDevice)defaultDevice;
- (TCComputeDevice)pipelineDevicePrimary;
- (TCComputeDevice)pipelineDeviceSecondary;
- (TCComputeDeviceManager)initWithDevices:(id)a3 forceCPU:(BOOL)a4;
- (id)initSingleton;
- (void)dealloc;
- (void)selectDevices:(id)a3 group1:(id)a4 group2:(id)a5;
- (void)setDefaultDevice:(id)a3;
- (void)setDevices:(id)a3;
- (void)setPipelineDevicePrimary:(id)a3;
- (void)setPipelineDeviceSecondary:(id)a3;
@end

@implementation TCComputeDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance_singleton_0;
  return v2;
}

void __40__TCComputeDeviceManager_sharedInstance__block_invoke()
{
  id v0 = [[TCComputeDeviceManager alloc] initSingleton];
  v1 = (void *)sharedInstance_singleton_0;
  sharedInstance_singleton_0 = (uint64_t)v0;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TCComputeDeviceManager;
  [(TCComputeDeviceManager *)&v2 dealloc];
}

- (id)initSingleton
{
  v5.receiver = self;
  v5.super_class = (Class)TCComputeDeviceManager;
  objc_super v2 = [(TCComputeDeviceManager *)&v5 init];
  if (v2)
  {
    v3 = +[TCPreferences userPreferences];
    v2->_forceCPU = [v3 devicePolicy] == 1;
  }
  return v2;
}

- (TCComputeDeviceManager)initWithDevices:(id)a3 forceCPU:(BOOL)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TCComputeDeviceManager;
  v7 = [(TCComputeDeviceManager *)&v10 init];
  v8 = v7;
  if (v7)
  {
    v7->_forceCPU = a4;
    [(TCComputeDeviceManager *)v7 setDevices:v6];
  }

  return v8;
}

- (void)setDevices:(id)a3
{
  id v4 = a3;
  objc_super v5 = [[TCComputeDevice alloc] initWithDevices:0 forceCPU:self->_forceCPU];
  [(TCComputeDeviceManager *)self setDefaultDevice:v5];

  id v9 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v6 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(TCComputeDeviceManager *)self selectDevices:v4 group1:v9 group2:v6];

  v7 = [[TCComputeDevice alloc] initWithDevices:v9 forceCPU:self->_forceCPU];
  [(TCComputeDeviceManager *)self setPipelineDevicePrimary:v7];

  v8 = [[TCComputeDevice alloc] initWithDevices:v6 forceCPU:self->_forceCPU];
  [(TCComputeDeviceManager *)self setPipelineDeviceSecondary:v8];
}

- (void)selectDevices:(id)a3 group1:(id)a4 group2:(id)a5
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  [a3 sortedArrayUsingComparator:&__block_literal_global_42];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v21;
LABEL_3:
    uint64_t v13 = 0;
    while (1)
    {
      if (*(void *)v21 != v12) {
        objc_enumerationMutation(v9);
      }
      v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
      if (objc_msgSend(v14, "isLowPower", (void)v20)) {
        break;
      }
      uint64_t v15 = [v7 count];
      v16 = v7;
      if (!v15 || (uint64_t v17 = [v8 count], v16 = v8, !v17)) {
        [v16 addObject:v14];
      }
      if (v11 == ++v13)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v11) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if ([v8 count] || objc_msgSend(v7, "count") != 1)
  {
    if (!objc_msgSend(v8, "count", (void)v20) && (unint64_t)objc_msgSend(v7, "count") >= 2)
    {
      v19 = [v7 lastObject];
      [v8 addObject:v19];

      [v7 removeLastObject];
    }
  }
  else
  {
    v18 = [v7 objectAtIndexedSubscript:0];
    [v8 addObject:v18];
  }
}

uint64_t __54__TCComputeDeviceManager_selectDevices_group1_group2___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  if ([v4 isLowPower] & 1) == 0 && (objc_msgSend(v5, "isLowPower")) {
    goto LABEL_14;
  }
  if (![v4 isLowPower] || objc_msgSend(v5, "isLowPower"))
  {
    if ([v4 isRemovable] && !objc_msgSend(v5, "isRemovable")) {
      goto LABEL_14;
    }
    if (([v4 isRemovable] & 1) != 0 || (objc_msgSend(v5, "isRemovable") & 1) == 0)
    {
      if (![v4 isHeadless] || objc_msgSend(v5, "isHeadless"))
      {
        if (([v4 isHeadless] & 1) != 0 || (objc_msgSend(v5, "isHeadless") & 1) == 0)
        {
          uint64_t v6 = 0;
          goto LABEL_16;
        }
        goto LABEL_13;
      }
LABEL_14:
      uint64_t v6 = -1;
      goto LABEL_16;
    }
  }
LABEL_13:
  uint64_t v6 = 1;
LABEL_16:

  return v6;
}

- (TCComputeDevice)defaultDevice
{
  return (TCComputeDevice *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDefaultDevice:(id)a3
{
}

- (TCComputeDevice)pipelineDevicePrimary
{
  return (TCComputeDevice *)objc_getProperty(self, a2, 32, 1);
}

- (void)setPipelineDevicePrimary:(id)a3
{
}

- (TCComputeDevice)pipelineDeviceSecondary
{
  return (TCComputeDevice *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPipelineDeviceSecondary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelineDeviceSecondary, 0);
  objc_storeStrong((id *)&self->_pipelineDevicePrimary, 0);
  objc_storeStrong((id *)&self->_defaultDevice, 0);
  objc_storeStrong((id *)&self->_deviceObserver, 0);
}

@end