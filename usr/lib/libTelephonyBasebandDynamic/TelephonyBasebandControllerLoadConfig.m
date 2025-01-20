@interface TelephonyBasebandControllerLoadConfig
@end

@implementation TelephonyBasebandControllerLoadConfig

uint64_t ___TelephonyBasebandControllerLoadConfig_block_invoke(uint64_t a1)
{
  _TelephonyUtilDebugPrint();
  mach_port_t v2 = *MEMORY[0x263F0EC88];
  CFDictionaryRef v3 = IOServiceNameMatching("baseband");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (!MatchingService
    || (io_object_t v5 = MatchingService,
        (CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"config", (CFAllocatorRef)*MEMORY[0x263EFFB08], 0)) == 0))
  {
    uint64_t result = _TelephonyUtilDebugPrintError();
LABEL_8:
    char v10 = 0;
    goto LABEL_9;
  }
  v7 = CFProperty;
  CFTypeID v8 = CFGetTypeID(CFProperty);
  if (v8 != CFDataGetTypeID())
  {
    _TelephonyUtilDebugPrintError();
    CFRelease(v7);
    uint64_t result = IOObjectRelease(v5);
    goto LABEL_8;
  }
  if (CFDataGetLength((CFDataRef)v7) <= 23)
  {
    _TelephonyUtilDebugPrint();
  }
  else
  {
    v11.location = 0;
    v11.length = 24;
    CFDataGetBytes((CFDataRef)v7, v11, (UInt8 *)&sTelephonyBasebandControllerBasebandConfiguration);
  }
  CFRelease(v7);
  uint64_t result = IOObjectRelease(v5);
  char v10 = 1;
LABEL_9:
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v10;
  return result;
}

@end