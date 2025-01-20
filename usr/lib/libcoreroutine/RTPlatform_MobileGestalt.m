@interface RTPlatform_MobileGestalt
- (BOOL)iPhoneDevice;
- (BOOL)iPhonePlatform;
- (BOOL)internalInstall;
- (BOOL)isTinkerPaired;
- (BOOL)isWatchPaired;
- (BOOL)lowEndHardware;
- (BOOL)macOSPlatform;
- (BOOL)realityDevice;
- (BOOL)simulatorPlatform;
- (BOOL)supportsCoreRoutineCapability;
- (BOOL)supportsMultiUser;
- (BOOL)supportsScenarioTriggers;
- (BOOL)watchPlatform;
- (RTPlatform_MobileGestalt)init;
- (RTPlatform_MobileGestalt)initWithNanoRegistry:(id)a3 userDefaults:(id)a4;
- (id)deviceClass;
- (id)productType;
- (id)systemModel;
- (id)systemVersion;
- (id)userAssignedDeviceName;
@end

@implementation RTPlatform_MobileGestalt

- (BOOL)internalInstall
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (RTPlatform_MobileGestalt)init
{
  CFBooleanRef v3 = objc_alloc_init(RTNanoRegistry);
  CFTypeID v4 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  BOOL v5 = [(RTPlatform_MobileGestalt *)self initWithNanoRegistry:v3 userDefaults:v4];

  return v5;
}

- (RTPlatform_MobileGestalt)initWithNanoRegistry:(id)a3 userDefaults:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    v14.receiver = self;
    v14.super_class = (Class)RTPlatform_MobileGestalt;
    v9 = [(RTPlatform_MobileGestalt *)&v14 init];
    p_isa = (id *)&v9->super.super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_userDefaults, a4);
      objc_storeStrong(p_isa + 2, a3);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v12 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v16 = "-[RTPlatform_MobileGestalt initWithNanoRegistry:userDefaults:]";
      __int16 v17 = 1024;
      int v18 = 41;
      _os_log_error_impl(&dword_1D9BFA000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: userDefaults (in %s:%d)", buf, 0x12u);
    }

    v11 = 0;
  }

  return v11;
}

- (id)userAssignedDeviceName
{
  CFBooleanRef v2 = (void *)MGCopyAnswer();
  if (!v2)
  {
    CFBooleanRef v3 = [MEMORY[0x1E4F28D40] currentHost];
    CFTypeID v4 = [v3 name];

    if (v4) {
      [v3 name];
    }
    else {
    CFBooleanRef v2 = +[RTSystemControl valueForKey:@"kern.hostname"];
    }
  }

  return v2;
}

- (id)productType
{
  CFBooleanRef v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)systemVersion
{
  CFBooleanRef v2 = (void *)MGCopyAnswer();

  return v2;
}

- (BOOL)lowEndHardware
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (BOOL)supportsCoreRoutineCapability
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"OverrideCoreRoutineSupported"];
  if (v2)
  {
    CFBooleanRef v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      v12 = v2;
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "CoreRoutine capabiltiy overridden, %@", (uint8_t *)&v11, 0xCu);
    }

    int v4 = [(__CFString *)v2 BOOLValue];
  }
  else
  {
    CFBooleanRef v5 = (const __CFBoolean *)MGCopyAnswer();
    if (v5)
    {
      CFBooleanRef v6 = v5;
      CFTypeID v7 = CFGetTypeID(v5);
      int v4 = v7 == CFBooleanGetTypeID() && CFBooleanGetValue(v6) != 0;
      CFRelease(v6);
    }
    else
    {
      int v4 = 0;
    }
  }
  id v8 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = @"NO";
    if (v4) {
      v9 = @"YES";
    }
    int v11 = 138412290;
    v12 = v9;
    _os_log_impl(&dword_1D9BFA000, v8, OS_LOG_TYPE_INFO, "supports CoreRoutine capabiltiy, %@", (uint8_t *)&v11, 0xCu);
  }

  return v4;
}

- (BOOL)supportsMultiUser
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  CFBooleanRef v2 = [(NSUserDefaults *)self->_userDefaults objectForKey:@"ForceMultiUser"];
  if (v2)
  {
    CFBooleanRef v3 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v11 = @"YES";
      _os_log_impl(&dword_1D9BFA000, v3, OS_LOG_TYPE_INFO, "multi user overridden, %@", buf, 0xCu);
    }

    int v4 = [v2 BOOLValue];
  }
  else
  {
    CFBooleanRef v5 = (void *)MKBUserTypeDeviceMode();
    CFBooleanRef v6 = [v5 objectForKey:*MEMORY[0x1E4F78100]];
    int v4 = [v6 isEqualToString:*MEMORY[0x1E4F78108]];
  }
  CFTypeID v7 = _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    id v8 = @"NO";
    if (v4) {
      id v8 = @"YES";
    }
    *(_DWORD *)buf = 138412290;
    int v11 = v8;
    _os_log_impl(&dword_1D9BFA000, v7, OS_LOG_TYPE_INFO, "supports multi user, %@", buf, 0xCu);
  }

  return v4;
}

- (id)systemModel
{
  CFBooleanRef v2 = (void *)MGCopyAnswer();

  return v2;
}

- (id)deviceClass
{
  CFBooleanRef v2 = (void *)MGCopyAnswer();

  return v2;
}

- (BOOL)simulatorPlatform
{
  CFBooleanRef v2 = (const __CFBoolean *)MGCopyAnswer();
  if (!v2) {
    return 0;
  }
  CFBooleanRef v3 = v2;
  CFTypeID v4 = CFGetTypeID(v2);
  BOOL v5 = v4 == CFBooleanGetTypeID() && CFBooleanGetValue(v3) == 1;
  CFRelease(v3);
  return v5;
}

- (BOOL)iPhonePlatform
{
  CFBooleanRef v2 = [(RTPlatform_MobileGestalt *)self deviceClass];
  CFBooleanRef v3 = v2;
  BOOL v4 = v2
    && (([v2 isEqualToString:@"iPhone"] & 1) != 0
     || ([v3 isEqualToString:@"iPad"] & 1) != 0
     || [v3 isEqualToString:@"iPod"]);

  return v4;
}

- (BOOL)watchPlatform
{
  CFBooleanRef v2 = [(RTPlatform_MobileGestalt *)self deviceClass];
  CFBooleanRef v3 = v2;
  if (v2) {
    char v4 = [v2 isEqualToString:@"Watch"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)macOSPlatform
{
  return 0;
}

- (BOOL)iPhoneDevice
{
  CFBooleanRef v2 = [(RTPlatform_MobileGestalt *)self deviceClass];
  CFBooleanRef v3 = v2;
  if (v2) {
    char v4 = [v2 isEqualToString:@"iPhone"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)realityDevice
{
  CFBooleanRef v2 = [(RTPlatform_MobileGestalt *)self deviceClass];
  CFBooleanRef v3 = v2;
  if (v2) {
    char v4 = [v2 isEqualToString:@"RealityDevice"];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (BOOL)supportsScenarioTriggers
{
  return 1;
}

- (BOOL)isWatchPaired
{
  return [(RTNanoRegistry *)self->_nanoRegistry isWatchPaired];
}

- (BOOL)isTinkerPaired
{
  return [(RTNanoRegistry *)self->_nanoRegistry isTinkerPaired];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nanoRegistry, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

@end