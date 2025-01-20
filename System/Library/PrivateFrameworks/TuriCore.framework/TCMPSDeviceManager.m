@interface TCMPSDeviceManager
+ (id)sharedInstance;
- (BOOL)shouldPreferDevice:(id)a3 overDevice:(id)a4;
- (MTLDevice)preferredDevice;
- (TCMPSDeviceManager)init;
- (void)dealloc;
- (void)setPreferredDevice:(id)a3;
- (void)setPreferredDeviceFromDevices:(id)a3;
@end

@implementation TCMPSDeviceManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_2);
  }
  v2 = (void *)sharedInstance_singleton;
  return v2;
}

void __36__TCMPSDeviceManager_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(TCMPSDeviceManager);
  v1 = (void *)sharedInstance_singleton;
  sharedInstance_singleton = (uint64_t)v0;
}

- (TCMPSDeviceManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)TCMPSDeviceManager;
  return [(TCMPSDeviceManager *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TCMPSDeviceManager;
  [(TCMPSDeviceManager *)&v2 dealloc];
}

- (BOOL)shouldPreferDevice:(id)a3 overDevice:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (!v6 || ([v5 isLowPower] & 1) == 0 && (objc_msgSend(v6, "isLowPower") & 1) != 0) {
    goto LABEL_15;
  }
  if (![v5 isLowPower] || objc_msgSend(v6, "isLowPower"))
  {
    if ([v5 isRemovable] && !objc_msgSend(v6, "isRemovable")) {
      goto LABEL_15;
    }
    if (([v5 isRemovable] & 1) != 0 || (objc_msgSend(v6, "isRemovable") & 1) == 0)
    {
      if (![v5 isHeadless] || objc_msgSend(v6, "isHeadless"))
      {
        if (([v5 isHeadless] & 1) == 0) {
          [v6 isHeadless];
        }
        goto LABEL_14;
      }
LABEL_15:
      BOOL v7 = 1;
      goto LABEL_16;
    }
  }
LABEL_14:
  BOOL v7 = 0;
LABEL_16:

  return v7;
}

- (void)setPreferredDeviceFromDevices:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    BOOL v7 = 0;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(TCMPSDeviceManager *)self shouldPreferDevice:v10 overDevice:v7])
        {
          id v11 = v10;

          BOOL v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
  else
  {
    BOOL v7 = 0;
  }
  [(TCMPSDeviceManager *)self setPreferredDevice:v7];
}

- (MTLDevice)preferredDevice
{
  return (MTLDevice *)objc_getProperty(self, a2, 16, 1);
}

- (void)setPreferredDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredDevice, 0);
  objc_storeStrong((id *)&self->_deviceObserver, 0);
}

@end