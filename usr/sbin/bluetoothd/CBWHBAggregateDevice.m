@interface CBWHBAggregateDevice
- (CBDevice)latestDevice;
- (NSMutableDictionary)deviceControllerMap;
- (id)description;
- (void)setDeviceControllerMap:(id)a3;
- (void)setLatestDevice:(id)a3;
@end

@implementation CBWHBAggregateDevice

- (id)description
{
  v3 = self->_deviceControllerMap;
  v4 = self->_latestDevice;
  uint64_t v23 = 0;
  v5 = [(id)objc_opt_class() description];
  id v18 = [(NSMutableDictionary *)v3 count];
  NSAppendPrintF_safe();
  id v6 = 0;

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v7 = [(NSMutableDictionary *)v3 allKeys];
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v20;
    v11 = " [";
    do
    {
      v12 = 0;
      v13 = v6;
      do
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        v16 = v11;
        uint64_t v17 = *(void *)(*((void *)&v19 + 1) + 8 * (void)v12);
        NSAppendPrintF_safe();
        id v6 = v13;

        v12 = (char *)v12 + 1;
        v11 = ", ";
        v13 = v6;
      }
      while (v9 != v12);
      id v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      v11 = ", ";
    }
    while (v9);

    NSAppendPrintF_safe();
    v7 = v6;
    id v6 = v6;
  }

  id v14 = v6;
  return v14;
}

- (NSMutableDictionary)deviceControllerMap
{
  return self->_deviceControllerMap;
}

- (void)setDeviceControllerMap:(id)a3
{
}

- (CBDevice)latestDevice
{
  return self->_latestDevice;
}

- (void)setLatestDevice:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestDevice, 0);

  objc_storeStrong((id *)&self->_deviceControllerMap, 0);
}

@end