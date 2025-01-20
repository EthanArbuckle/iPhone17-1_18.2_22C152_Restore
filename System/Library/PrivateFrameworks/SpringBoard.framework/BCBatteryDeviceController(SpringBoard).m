@interface BCBatteryDeviceController(SpringBoard)
- (id)sb_deviceInternalBattery;
- (uint64_t)sb_isConnectedToWirelessCharger;
@end

@implementation BCBatteryDeviceController(SpringBoard)

- (id)sb_deviceInternalBattery
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [a1 connectedDevices];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v8;
    while (2)
    {
      for (i = 0; i != v2; i = (char *)i + 1)
      {
        if (*(void *)v8 != v3) {
          objc_enumerationMutation(v1);
        }
        v5 = *(void **)(*((void *)&v7 + 1) + 8 * i);
        if (objc_msgSend(v5, "isInternal", (void)v7))
        {
          id v2 = v5;
          goto LABEL_11;
        }
      }
      id v2 = (id)[v1 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

- (uint64_t)sb_isConnectedToWirelessCharger
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [a1 connectedDevices];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v7;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v7 != v3) {
          objc_enumerationMutation(v1);
        }
        if (objc_msgSend(*(id *)(*((void *)&v6 + 1) + 8 * i), "isWirelesslyCharging", (void)v6))
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

@end