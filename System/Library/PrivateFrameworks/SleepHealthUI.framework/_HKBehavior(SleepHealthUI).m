@interface _HKBehavior(SleepHealthUI)
- (id)hksp_systemImageNameForActivePairedDevice;
- (id)hksp_systemImageNameForCurrentDevice;
- (uint64_t)hksp_activeCompanionVariant;
@end

@implementation _HKBehavior(SleepHealthUI)

- (id)hksp_systemImageNameForCurrentDevice
{
  v1 = [a1 currentDeviceProductType];
  v2 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:v1];
  v3 = (void *)MEMORY[0x1E4F6F260];
  v4 = [v2 identifier];
  v5 = [v3 symbolForTypeIdentifier:v4 error:0];

  v6 = [v5 name];

  return v6;
}

- (id)hksp_systemImageNameForActivePairedDevice
{
  v1 = objc_msgSend(a1, "hksp_activePairedDeviceProductType");
  if (v1)
  {
    v2 = [MEMORY[0x1E4F442D8] _typeWithDeviceModelCode:v1];
    v3 = (void *)MEMORY[0x1E4F6F260];
    v4 = [v2 identifier];
    v5 = [v3 symbolForTypeIdentifier:v4 error:0];

    v6 = [v5 name];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)hksp_activeCompanionVariant
{
  v1 = objc_msgSend(a1, "hksp_systemImageNameForActivePairedDevice");
  v2 = v1;
  if (v1)
  {
    if ([v1 isEqualToString:@"iphone.gen1"])
    {
      uint64_t v3 = 0;
    }
    else if ([v2 isEqualToString:@"iphone.gen2"])
    {
      uint64_t v3 = 1;
    }
    else if ([v2 isEqualToString:@"iphone.gen3"])
    {
      uint64_t v3 = 2;
    }
    else
    {
      uint64_t v3 = 3;
    }
  }
  else
  {
    uint64_t v3 = 3;
  }

  return v3;
}

@end