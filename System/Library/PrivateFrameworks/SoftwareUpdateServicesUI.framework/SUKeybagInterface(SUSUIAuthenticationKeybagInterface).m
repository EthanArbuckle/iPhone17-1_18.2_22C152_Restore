@interface SUKeybagInterface(SUSUIAuthenticationKeybagInterface)
- (BOOL)authenticate:()SUSUIAuthenticationKeybagInterface;
- (double)backOffTime;
- (uint64_t)lockDevice;
@end

@implementation SUKeybagInterface(SUSUIAuthenticationKeybagInterface)

- (uint64_t)lockDevice
{
  location[2] = a1;
  location[1] = a2;
  location[0] = SUSUILogKeybagInterface();
  os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
  {
    log = location[0];
    os_log_type_t type = v6;
    __os_log_helper_16_0_0(v5);
    _os_log_impl(&dword_224ECB000, log, type, "attemptAuthentication: blocked", v5, 2u);
  }
  objc_storeStrong(location, 0);
  return MKBLockDeviceNow();
}

- (BOOL)authenticate:()SUSUIAuthenticationKeybagInterface
{
  location[2] = a1;
  location[1] = a2;
  location[0] = 0;
  objc_storeStrong(location, obj);
  [location[0] dataUsingEncoding:4];
  BOOL v4 = MKBUnlockDevice() == 0;
  objc_storeStrong(location, 0);
  return v4;
}

- (double)backOffTime
{
  v8[2] = a1;
  v8[1] = a2;
  v8[0] = 0;
  id v9 = (id)MKBGetDeviceLockStateInfo();
  id v7 = v9;
  id v2 = (id)[v7 objectForKeyedSubscript:*MEMORY[0x263F55A40]];
  id v3 = v8[0];
  v8[0] = v2;

  [v8[0] doubleValue];
  double v6 = v4;
  objc_storeStrong(&v7, 0);
  objc_storeStrong(v8, 0);
  return v6;
}

@end