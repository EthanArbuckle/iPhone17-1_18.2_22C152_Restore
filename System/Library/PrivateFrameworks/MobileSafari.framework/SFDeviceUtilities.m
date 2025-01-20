@interface SFDeviceUtilities
+ (id)deviceUUID;
@end

@implementation SFDeviceUtilities

+ (id)deviceUUID
{
  if (deviceUUID_once != -1) {
    dispatch_once(&deviceUUID_once, &__block_literal_global_45);
  }
  v2 = (void *)deviceUUID_deviceUUID;

  return v2;
}

void __31__SFDeviceUtilities_deviceUUID__block_invoke()
{
  if ([MEMORY[0x1E4FB6EE0] accessLevel] == 2)
  {
    uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"FEBFD06E-A2DF-4AEF-A58B-A9DEE6116B9D"];
    v1 = (void *)deviceUUID_deviceUUID;
    deviceUUID_deviceUUID = v0;
  }
  else
  {
    uint64_t v14 = _SFSafariCloudTabsMetadataPath();
    v2 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithContentsOfFile:");
    v3 = objc_msgSend(v2, "safari_stringForKey:", @"DeviceUUID");
    if ([v3 length])
    {
      uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v3];
      v5 = (void *)deviceUUID_deviceUUID;
      deviceUUID_deviceUUID = v4;
    }
    if (!deviceUUID_deviceUUID)
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F29128]);
      v7 = (void *)deviceUUID_deviceUUID;
      deviceUUID_deviceUUID = (uint64_t)v6;

      v8 = (void *)[v2 mutableCopy];
      if (!v2)
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:1];

        v8 = (void *)v9;
      }
      v10 = [(id)deviceUUID_deviceUUID UUIDString];
      [v8 setObject:v10 forKey:@"DeviceUUID"];

      [v8 writeToFile:v14 atomically:1];
    }
    v11 = objc_msgSend(MEMORY[0x1E4F1CB18], "safari_browserDefaults");
    v12 = [v11 objectForKey:@"cloudTabsDeviceUUIDForRestoration"];

    if (!v12)
    {
      v13 = [(id)deviceUUID_deviceUUID UUIDString];
      [v11 setObject:v13 forKey:@"cloudTabsDeviceUUIDForRestoration"];
    }
    v1 = (void *)v14;
  }
}

@end