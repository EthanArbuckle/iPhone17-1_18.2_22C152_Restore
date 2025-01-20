@interface RTPlatform
+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionFromString:(SEL)a3;
+ (BOOL)operatingSystemAtLeastVersion:(id *)a3;
+ (BOOL)operatingSystemNoGreaterThanVersion:(id *)a3;
+ (BOOL)version:(id *)a3 atLeastVersion:(id *)a4;
+ (BOOL)version:(id *)a3 equalToVersion:(id *)a4;
+ (BOOL)version:(id *)a3 noGreaterThanVersion:(id *)a4;
+ (RTPlatform)allocWithZone:(_NSZone *)a3;
+ (id)currentPlatform;
- (BOOL)iPhoneDevice;
- (BOOL)iPhonePlatform;
- (BOOL)internalInstall;
- (BOOL)isTinkerPaired;
- (BOOL)isWatchPaired;
- (BOOL)lowEndHardware;
- (BOOL)macOSPlatform;
- (BOOL)paired;
- (BOOL)realityDevice;
- (BOOL)simulatorPlatform;
- (BOOL)supportsCoreRoutineCapability;
- (BOOL)supportsMultiUser;
- (BOOL)supportsPairedDevice;
- (BOOL)supportsScenarioTriggers;
- (BOOL)usesTSCForClustering;
- (BOOL)watchPlatform;
- (id)buildVersion;
- (id)deviceClass;
- (id)productType;
- (id)serialNumber;
- (id)systemModel;
- (id)systemVersion;
- (id)userAssignedDeviceName;
- (unint64_t)deviceMemorySize;
@end

@implementation RTPlatform

+ (id)currentPlatform
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__RTPlatform_currentPlatform__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_MergedGlobals_101 != -1) {
    dispatch_once(&_MergedGlobals_101, block);
  }
  v2 = (void *)qword_1EBE38888;

  return v2;
}

uint64_t __29__RTPlatform_currentPlatform__block_invoke()
{
  qword_1EBE38888 = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

+ (RTPlatform)allocWithZone:(_NSZone *)a3
{
  if ((id)objc_opt_class() == a1)
  {
    return (RTPlatform *)+[RTPlatform allocWithZone:a3];
  }
  else
  {
    v6.receiver = a1;
    v6.super_class = (Class)&OBJC_METACLASS___RTPlatform;
    return (RTPlatform *)[super allocWithZone:a3];
  }
}

- (id)userAssignedDeviceName
{
  return +[RTSystemControl valueForKey:@"kern.hostname"];
}

- (id)productType
{
  return +[RTSystemControl valueForKey:@"hw.model"];
}

- (BOOL)internalInstall
{
  return 0;
}

- (id)buildVersion
{
  v2 = (void *)_CFCopyServerVersionDictionary();
  if (v2 || (v2 = (void *)_CFCopySystemVersionDictionary()) != 0)
  {
    v3 = [v2 objectForKey:*MEMORY[0x1E4F1CD10]];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)systemVersion
{
  v2 = (void *)_CFCopyServerVersionDictionary();
  if (v2 || (v2 = (void *)_CFCopySystemVersionDictionary()) != 0)
  {
    v3 = [v2 objectForKey:*MEMORY[0x1E4F1CD30]];
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (id)serialNumber
{
  mach_port_t v2 = *MEMORY[0x1E4F2EEF0];
  CFDictionaryRef v3 = IOServiceMatching("IOPlatformExpertDevice");
  io_service_t MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    io_object_t v5 = MatchingService;
    CFTypeRef CFProperty = IORegistryEntryCreateCFProperty(MatchingService, @"IOPlatformSerialNumber", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
    if (CFProperty)
    {
      v7 = (void *)CFProperty;
      v8 = [NSString stringWithString:CFProperty];
    }
    else
    {
      v8 = 0;
    }
    IOObjectRelease(v5);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)systemModel
{
  return @"Unknown";
}

- (BOOL)lowEndHardware
{
  return 0;
}

- (BOOL)supportsCoreRoutineCapability
{
  return 0;
}

- (BOOL)supportsMultiUser
{
  return 0;
}

- (id)deviceClass
{
  return +[RTSystemControl valueForKey:@"hw.targettype"];
}

- (unint64_t)deviceMemorySize
{
  return +[RTSystemControl sysctlByName:@"hw.memsize"];
}

+ (BOOL)version:(id *)a3 equalToVersion:(id *)a4
{
  return a3->var0 == a4->var0 && a3->var1 == a4->var1 && a3->var2 == a4->var2;
}

+ (BOOL)version:(id *)a3 noGreaterThanVersion:(id *)a4
{
  if (a3->var0 > a4->var0) {
    return 0;
  }
  if (a3->var0 < a4->var0) {
    return 1;
  }
  int64_t var1 = a3->var1;
  int64_t v5 = a4->var1;
  if (var1 > v5) {
    return 0;
  }
  return var1 < v5 || a3->var2 <= a4->var2;
}

+ (BOOL)operatingSystemNoGreaterThanVersion:(id *)a3
{
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  int64_t v5 = v4;
  if (v4) {
    [v4 operatingSystemVersion];
  }

  if (a3->var0 < 0) {
    return 0;
  }
  if (a3->var0 > 0) {
    return 1;
  }
  int64_t var1 = a3->var1;
  if (var1 < 0) {
    return 0;
  }
  return var1 > 0 || a3->var2 >= 0;
}

+ (BOOL)operatingSystemAtLeastVersion:(id *)a3
{
  v4 = [MEMORY[0x1E4F28F80] processInfo];
  int64_t v5 = v4;
  if (v4) {
    [v4 operatingSystemVersion];
  }

  if (a3->var0 > 0) {
    return 0;
  }
  if (a3->var0 < 0) {
    return 1;
  }
  int64_t var1 = a3->var1;
  if (var1 > 0) {
    return 0;
  }
  return var1 < 0 || a3->var2 <= 0;
}

+ (BOOL)version:(id *)a3 atLeastVersion:(id *)a4
{
  if (a3->var0 < a4->var0) {
    return 0;
  }
  if (a3->var0 > a4->var0) {
    return 1;
  }
  int64_t var1 = a3->var1;
  int64_t v5 = a4->var1;
  if (var1 < v5) {
    return 0;
  }
  return var1 > v5 || a3->var2 >= a4->var2;
}

+ ($9FE6E10C8CE45DBC9A88DFDEA39A390D)operatingSystemVersionFromString:(SEL)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (!v5)
  {
    objc_super v6 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136315394;
      v15 = "+[RTPlatform operatingSystemVersionFromString:]";
      __int16 v16 = 1024;
      int v17 = 249;
      _os_log_error_impl(&dword_1D9BFA000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: versionString (in %s:%d)", (uint8_t *)&v14, 0x12u);
    }
  }
  retstr->var0 = 0;
  retstr->int64_t var1 = 0;
  retstr->var2 = 0;
  v7 = [v5 componentsSeparatedByString:@"."];
  uint64_t v8 = [v7 count];
  if (v8)
  {
    unint64_t v9 = v8;
    v10 = [v7 objectAtIndex:0];
    retstr->var0 = [v10 integerValue];

    if (v9 != 1)
    {
      v11 = [v7 objectAtIndex:1];
      retstr->int64_t var1 = [v11 integerValue];

      if (v9 >= 3)
      {
        v12 = [v7 objectAtIndex:2];
        retstr->var2 = [v12 integerValue];
      }
    }
  }

  return result;
}

- (BOOL)simulatorPlatform
{
  return 0;
}

- (BOOL)iPhonePlatform
{
  return 0;
}

- (BOOL)watchPlatform
{
  return 0;
}

- (BOOL)macOSPlatform
{
  return 0;
}

- (BOOL)iPhoneDevice
{
  return 0;
}

- (BOOL)realityDevice
{
  return 0;
}

- (BOOL)supportsPairedDevice
{
  return 0;
}

- (BOOL)paired
{
  return 0;
}

- (BOOL)supportsScenarioTriggers
{
  return 0;
}

- (BOOL)isWatchPaired
{
  return 0;
}

- (BOOL)usesTSCForClustering
{
  return 1;
}

- (BOOL)isTinkerPaired
{
  return 0;
}

@end