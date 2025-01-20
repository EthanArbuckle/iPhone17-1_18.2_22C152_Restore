@interface ZhuGeBasebandArmory
+ (BOOL)hasBaseband;
+ (BOOL)isBasebandReady;
+ (BOOL)waitUntilBasebandReady:(int)a3 retryInterval:(int)a4;
+ (id)getProperty:(char)a3[512] inPlane:(char)a4[128] withName:(__CFString *)a5 withOption:(unsigned int)a6;
+ (id)query:(id)a3 withError:(id *)a4;
+ (int64_t)getBasebandClass;
@end

@implementation ZhuGeBasebandArmory

+ (id)query:(id)a3 withError:(id *)a4
{
  return 0;
}

+ (BOOL)hasBaseband
{
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("baseband");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  io_service_t v5 = MatchingService;
  if (MatchingService) {
    IOObjectRelease(MatchingService);
  }
  return v5 != 0;
}

+ (int64_t)getBasebandClass
{
  uint64_t v2 = [a1 getProperty:"IODeviceTree:/baseband" inPlane:"IODeviceTree" withName:@"class" withOption:0];
  v6 = (void *)v2;
  if (!v2)
  {
    v9 = @"can not find baseband class";
    uint64_t v10 = 195;
LABEL_10:
    ZhuGeLog(1040, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[ZhuGeBasebandArmory getBasebandClass]", v10, v9, v3, v4, v5, v12);
    int64_t v8 = -1;
    goto LABEL_11;
  }
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[ZhuGeBasebandArmory getBasebandClass]", 198, @"baseband class: %@", v3, v4, v5, v2);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int64_t v8 = [v6 integerValue];
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  v7 = [NSNumber integerFromData:v6 size:4 truncate:0 isSigned:1 needSwap:0];
  if (!v7)
  {
    v7 = [NSNumber integerFromData:v6 size:8 truncate:0 isSigned:1 needSwap:0];
    if (!v7)
    {
LABEL_9:
      v9 = @"baseband class should be an integer";
      uint64_t v10 = 220;
      goto LABEL_10;
    }
  }
  int64_t v8 = [v7 integerValue];

LABEL_11:
  return v8;
}

+ (BOOL)isBasebandReady
{
  if (![a1 hasBaseband] || objc_msgSend(a1, "getBasebandClass") < 2) {
    return 0;
  }
  uint64_t v3 = *MEMORY[0x263F02EA0];
  uint64_t v10 = 0;
  uint64_t v4 = +[ZhuGeBasebandPostponementStatusArmory query:v3 isCachable:0 withError:&v10];
  ZhuGeLog(262400, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[ZhuGeBasebandArmory isBasebandReady]", 234, @"postponement status %@", v5, v6, v7, (uint64_t)v4);
  BOOL v8 = v4 && ![v4 isEqualToString:*MEMORY[0x263F02EA8]];

  return v8;
}

+ (BOOL)waitUntilBasebandReady:(int)a3 retryInterval:(int)a4
{
  int v6 = [a1 hasBaseband];
  if (v6)
  {
    LOBYTE(v6) = +[ZhuGeBasebandArmory isBasebandReady];
    if ((v6 & 1) == 0 && a3 >= 1)
    {
      double v7 = (double)a4;
      int v8 = 1;
      do
      {
        [MEMORY[0x263F08B88] sleepForTimeInterval:v7];
        LOBYTE(v6) = +[ZhuGeBasebandArmory isBasebandReady];
        if (v6) {
          break;
        }
      }
      while (v8++ < a3);
    }
  }
  return v6;
}

+ (id)getProperty:(char)a3[512] inPlane:(char)a4[128] withName:(__CFString *)a5 withOption:(unsigned int)a6
{
  io_registry_entry_t v10 = IORegistryEntryFromPath(*MEMORY[0x263F0EC88], a3);
  if (v10)
  {
    io_object_t v14 = v10;
    v15 = (void *)IORegistryEntrySearchCFProperty(v10, a4, a5, (CFAllocatorRef)*MEMORY[0x263EFFB08], a6);
    IOObjectRelease(v14);
    if (!v15) {
      ZhuGeLog(256, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[ZhuGeBasebandArmory getProperty:inPlane:withName:withOption:]", 276, @"can not find property %@ under %s", v16, v17, v18, (uint64_t)a5);
    }
  }
  else
  {
    ZhuGeLog(256, "/Library/Caches/com.apple.xbs/Sources/ZhuGe_Service/ZhuGeCommon/ZhuGeBaseband.m", "+[ZhuGeBasebandArmory getProperty:inPlane:withName:withOption:]", 269, @"can not find entry at %s", v11, v12, v13, (uint64_t)a3);
    v15 = 0;
  }
  return v15;
}

@end