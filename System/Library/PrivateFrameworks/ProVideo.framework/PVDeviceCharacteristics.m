@interface PVDeviceCharacteristics
+ (BOOL)colorSyncCapable;
+ (BOOL)hasExtendedColorDisplay;
+ (BOOL)isLowMemDevice;
+ (int)architectureType;
+ (int64_t)actualMemory;
+ (void)Initialize;
@end

@implementation PVDeviceCharacteristics

+ (void)Initialize
{
  if (+[PVDeviceCharacteristics Initialize]::onceToken != -1) {
    dispatch_once(&+[PVDeviceCharacteristics Initialize]::onceToken, &__block_literal_global_9);
  }
}

void __37__PVDeviceCharacteristics_Initialize__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  *(void *)v7 = 0x1800000006;
  size_t v5 = 8;
  sysctl(v7, 2u, &s_actualMemory, &v5, 0, 0);
  if (s_actualMemory <= 0x20000000) {
    s_isLowMem = 1;
  }
  uint64_t v4 = 0;
  size_t v5 = 4;
  sysctlbyname("hw.cputype", (char *)&v4 + 4, &v5, 0, 0);
  size_t v5 = 4;
  sysctlbyname("hw.cpusubtype", &v4, &v5, 0, 0);
  if (HIDWORD(v4) == 16777228)
  {
    int v0 = 3;
  }
  else if (HIDWORD(v4) == 12)
  {
    if ((v4 - 9) >= 5) {
      int v0 = 1;
    }
    else {
      int v0 = dword_1B7E73780[(int)v4 - 9];
    }
  }
  else
  {
    int v0 = 5;
  }
  s_architectureType = v0;
  v6[0] = xmmword_1E6169460;
  v6[1] = *(_OWORD *)&off_1E6169470;
  v6[2] = xmmword_1E6169480;
  v1 = objc_msgSend(MEMORY[0x1E4F42948], "currentDevice", v4);
  s_hasExtendedColorDisplay = [v1 _supportsDeepColor];

  id v2 = MTLCreateSystemDefaultDevice();
  s_colorSyncCapable = [v2 supportsFamily:1002];

  for (uint64_t i = 40; i != -8; i -= 8)
}

+ (int64_t)actualMemory
{
  return s_actualMemory;
}

+ (BOOL)isLowMemDevice
{
  return s_isLowMem;
}

+ (int)architectureType
{
  return s_architectureType;
}

+ (BOOL)hasExtendedColorDisplay
{
  return s_hasExtendedColorDisplay;
}

+ (BOOL)colorSyncCapable
{
  return s_colorSyncCapable;
}

@end