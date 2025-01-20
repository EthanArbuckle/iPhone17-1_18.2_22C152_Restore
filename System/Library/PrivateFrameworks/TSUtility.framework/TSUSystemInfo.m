@interface TSUSystemInfo
+ (id)hwModel;
+ (id)macAddress;
+ (id)processorName;
+ (id)systemVersion;
@end

@implementation TSUSystemInfo

+ (id)macAddress
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  int v2 = socket(2, 2, 0);
  if (v2 < 0) {
    return 0;
  }
  int v3 = v2;
  int v16 = 4000;
  v17 = v18;
  if (ioctl(v2, 0xC00C6924uLL, &v16) < 0 || v16 < 1)
  {
    v7 = 0;
  }
  else
  {
    v4 = &v18[v16];
    v5 = v18;
    do
    {
      if (v5[17] == 18
        && ((unsigned int v15 = 0,
             uint64_t v13 = 0,
             uint64_t v14 = 0,
             unsigned int v12 = 0,
             v6 = ether_ntoa((const ether_addr *)&v5[v5[21] + 24]),
             sscanf(v6, "%x:%x:%x:%x:%x:%x", &v15, (char *)&v14 + 4, &v14, (char *)&v13 + 4, &v13, &v12),
             v15)
         || v14
         || HIDWORD(v13)
         || v13
         || v12))
      {
        v7 = objc_msgSend(NSString, "stringWithFormat:", @"%02X:%02X:%02X:%02X:%02X:%02X", v15, HIDWORD(v14), v14, HIDWORD(v13), v13, v12);
      }
      else
      {
        v7 = 0;
      }
      uint64_t v8 = v5[16];
      if (v8 <= 0x10) {
        uint64_t v9 = 32;
      }
      else {
        uint64_t v9 = v8 + 16;
      }
      v5 += v9;
    }
    while (v5 < v4 && v7 == 0);
  }
  close(v3);
  return v7;
}

+ (id)processorName
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  *(void *)v4 = 0xC00000006;
  size_t v3 = 257;
  if (sysctl(v4, 2u, v5, &v3, 0, 0) < 0) {
    return (id)[MEMORY[0x263F1C5C0] platformString];
  }
  id result = (id)objc_msgSend(NSString, "stringWithFormat:", @"%s", v5);
  if (!result) {
    return (id)[MEMORY[0x263F1C5C0] platformString];
  }
  return result;
}

+ (id)systemVersion
{
  int v2 = (void *)[MEMORY[0x263F1C5C0] currentDevice];
  return (id)[v2 systemVersion];
}

+ (id)hwModel
{
  if (hwModel_onceToken != -1) {
    dispatch_once(&hwModel_onceToken, &__block_literal_global_4);
  }
  return (id)hwModel_hwModel;
}

void __24__TSUSystemInfo_hwModel__block_invoke()
{
  size_t size = 0;
  sysctlbyname("hw.model", 0, &size, 0, 0);
  v0 = malloc_type_malloc(size, 0xD07625F7uLL);
  sysctlbyname("hw.model", v0, &size, 0, 0);
  hwModel_hwModel = [[NSString alloc] initWithUTF8String:v0];
  free(v0);
}

@end