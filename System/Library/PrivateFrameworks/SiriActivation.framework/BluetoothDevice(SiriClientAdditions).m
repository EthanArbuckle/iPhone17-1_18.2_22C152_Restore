@interface BluetoothDevice(SiriClientAdditions)
- (uint64_t)ac_isBluetoothVehicle;
- (uint64_t)ac_isEyesFree;
@end

@implementation BluetoothDevice(SiriClientAdditions)

- (uint64_t)ac_isEyesFree
{
  v11[2] = *MEMORY[0x1E4F143B8];
  v2 = [a1 getServiceSetting:1 key:@"BT_KEY_SIRI_EYESFREE_MODE"];
  if ([v2 BOOLValue])
  {

    return 1;
  }
  char v3 = AFPreferencesAlwaysEyesFreeEnabled();

  if (v3) {
    return 1;
  }
  if ([a1 isServiceSupported:128])
  {
    uint64_t v10 = 0;
    v11[0] = 0;
    *(void *)((char *)v11 + 7) = 0;
    [a1 device];
    if (!BTDeviceGetAddressString())
    {
      __int16 v9 = 0;
      *(_DWORD *)bytes = 0;
      BOOL v4 = 0;
      if (BTDeviceAddressFromString()) {
        return v4;
      }
      CFDataRef v6 = CFDataCreate(0, bytes, 6);
      if (v6)
      {
        CFDataRef v7 = v6;
        BOOL v4 = IAPBluetoothDeviceMode() == 2;
        CFRelease(v7);
        return v4;
      }
    }
  }
  return 0;
}

- (uint64_t)ac_isBluetoothVehicle
{
  [a1 device];
  int DeviceType = BTDeviceGetDeviceType();
  uint64_t result = 0;
  if (!DeviceType) {
    return AFPreferencesAlwaysEyesFreeEnabled();
  }
  return result;
}

@end