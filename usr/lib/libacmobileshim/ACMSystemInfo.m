@interface ACMSystemInfo
- (BOOL)isPreRelease;
- (BOOL)isRetailDevice;
- (BOOL)isRunningOnModernMobileSystem;
- (BOOL)isTouchIDAvailable;
- (NSString)IPAddress;
- (NSString)MACAddress;
- (NSString)deviceModel;
- (NSString)systemVersion;
- (NSString)uniqueDeviceIdentifier;
- (NSString)version;
- (id)previousVersionUUID;
@end

@implementation ACMSystemInfo

- (NSString)IPAddress
{
  v11 = 0;
  int v2 = getifaddrs(&v11);
  uint64_t v3 = 0;
  v4 = v11;
  if (v2 || !v11)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v3 = 0;
    do
    {
      if (v4->ifa_addr->sa_family == 2)
      {
        if (objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v4->ifa_name), "isEqualToString:", @"en0"))
        {
          v6.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          uint64_t v3 = [NSString stringWithUTF8String:inet_ntoa(v6)];
        }
        if (objc_msgSend((id)objc_msgSend(NSString, "stringWithUTF8String:", v4->ifa_name), "isEqualToString:", @"ppp0"))
        {
          v7.s_addr = *(_DWORD *)&v4->ifa_addr->sa_data[2];
          uint64_t v5 = [NSString stringWithUTF8String:inet_ntoa(v7)];
        }
      }
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v11;
  }
  v8 = @"127.0.0.1";
  if (v3) {
    v8 = (__CFString *)v3;
  }
  if (v5) {
    p_isa = (NSString *)v5;
  }
  else {
    p_isa = &v8->isa;
  }
  MEMORY[0x23ED0E130](v4);
  return p_isa;
}

- (NSString)MACAddress
{
  v10 = 0;
  int v2 = getifaddrs(&v10);
  uint64_t v3 = 0;
  v4 = v10;
  if (!v2 && v10)
  {
    uint64_t v3 = 0;
    do
    {
      ifa_addr = v4->ifa_addr;
      if (ifa_addr->sa_family == 18 && ifa_addr->sa_data[2] == 6)
      {
        uint64_t v6 = ifa_addr->sa_data[3];
        uint64_t v3 = (void *)[MEMORY[0x263F089D8] string];
        if (ifa_addr->sa_data[4])
        {
          unint64_t v7 = 0;
          uint64_t v8 = (uint64_t)&ifa_addr->sa_data[v6 + 6];
          do
            [v3 appendFormat:@"%02x", *(unsigned __int8 *)(v8 + v7++)]
          while (v7 < ifa_addr->sa_data[4]);
        }
      }
      v4 = v4->ifa_next;
    }
    while (v4);
    v4 = v10;
  }
  MEMORY[0x23ED0E130](v4);
  return (NSString *)v3;
}

- (id)previousVersionUUID
{
  uint64_t v6 = 0;
  unint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  uint64_t v11 = 0;
  id v2 = +[ACMEnvironmentPreferences supportedRealms];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__ACMSystemInfo_previousVersionUUID__block_invoke;
  v5[3] = &unk_265043B68;
  v5[4] = &v6;
  [v2 enumerateObjectsUsingBlock:v5];
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __36__ACMSystemInfo_previousVersionUUID__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v6 = [[[+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components") preferences] environmentPreferencesWithRealm:a2];
  uint64_t result = [[(id)objc_msgSend(v6, "provisionedDeviceIdentifier") length];
  if (result)
  {
    uint64_t result = [v6 provisionedDeviceIdentifier];
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
    *a4 = 1;
  }
  return result;
}

- (NSString)uniqueDeviceIdentifier
{
  id v3 = (id)_sharedUniqueDeviceIdentifier;
  if (!_sharedUniqueDeviceIdentifier)
  {
    id v3 = [(id)[+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components") preferences] UUID];
    _sharedUniqueDeviceIdentifier = (uint64_t)v3;
    if (!v3)
    {
      _sharedUniqueDeviceIdentifier = (uint64_t)[(ACMSystemInfo *)self previousVersionUUID];
      if (_sharedUniqueDeviceIdentifier) {
        goto LABEL_10;
      }
      _sharedUniqueDeviceIdentifier = (uint64_t)[(id)[(id)[(id)[MEMORY[0x263F1C5C0] currentDevice] identifierForVendor] UUIDString];
      if (_sharedUniqueDeviceIdentifier) {
        goto LABEL_10;
      }
      id v3 = [[(id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F08C38], "UUID"), "UUIDString");
      _sharedUniqueDeviceIdentifier = (uint64_t)v3;
      if (ACFLog)
      {
        if ((ACFLogSettingsGetLevelMask() & 0x80) != 0) {
          ACFLog(7, (uint64_t)"-[ACMSystemInfo uniqueDeviceIdentifier]", "/Library/Caches/com.apple.xbs/Sources/AppleConnectClients/Mobile/Common/Sources/ACMSystemInfo.m", 136, 0, "Failed to get device ID, generating random %@", _sharedUniqueDeviceIdentifier);
        }
        id v3 = (id)_sharedUniqueDeviceIdentifier;
      }
      if (v3)
      {
LABEL_10:
        v4 = [[+[ACMAppleConnectImplComponents components](ACMAppleConnectImplComponents, "components") preferences];
        [v4 setUUID:_sharedUniqueDeviceIdentifier];
        id v3 = (id)_sharedUniqueDeviceIdentifier;
      }
    }
  }
  id v5 = v3;

  return (NSString *)v5;
}

- (NSString)deviceModel
{
  id v2 = (void *)[MEMORY[0x263F1C5C0] currentDevice];

  return (NSString *)[v2 model];
}

- (NSString)systemVersion
{
  id v2 = (void *)[MEMORY[0x263F1C5C0] currentDevice];

  return (NSString *)[v2 systemVersion];
}

- (BOOL)isRunningOnModernMobileSystem
{
  return floor(*MEMORY[0x263F080F8]) > 993.0;
}

- (BOOL)isTouchIDAvailable
{
  return 0;
}

- (BOOL)isRetailDevice
{
  return 0;
}

- (NSString)version
{
  return (NSString *)@"2.9.2";
}

- (BOOL)isPreRelease
{
  id v2 = [(ACMSystemInfo *)self version];
  -[NSString rangeOfCharacterFromSet:](v2, "rangeOfCharacterFromSet:", [MEMORY[0x263F08708] letterCharacterSet]);
  return v3 != 0;
}

@end