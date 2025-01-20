@interface SBWakeLogger
+ (id)sharedInstance;
+ (id)sharedInstanceIfExists;
- (BOOL)trackingWake;
- (NSMutableDictionary)wakeSouceToEventDict;
- (NSString)activeWakeSourceDescription;
- (SBWakeLogger)init;
- (int64_t)activeWakeLoggerSource;
- (int64_t)homeButtonType;
- (unsigned)backlightService;
- (unsigned)timesyncService;
- (void)_lock_wakeDidBegin:(int64_t)a3;
- (void)dealloc;
- (void)lockDidBegin;
- (void)setActiveWakeLoggerSource:(int64_t)a3;
- (void)setBacklightService:(unsigned int)a3;
- (void)setHomeButtonType:(int64_t)a3;
- (void)setTimesyncService:(unsigned int)a3;
- (void)setTrackingWake:(BOOL)a3;
- (void)setWakeSouceToEventDict:(id)a3;
- (void)wakeDidBegin:(int64_t)a3;
- (void)wakeDidEnd;
- (void)wakeMayBegin:(int64_t)a3 withTimestamp:(unint64_t)a4;
@end

@implementation SBWakeLogger

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_6 != -1) {
    dispatch_once(&sharedInstance_onceToken_6, &__block_literal_global_31);
  }
  v2 = (void *)__loggerInstance;
  return v2;
}

uint64_t __30__SBWakeLogger_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(SBWakeLogger);
  uint64_t v1 = __loggerInstance;
  __loggerInstance = (uint64_t)v0;
  return MEMORY[0x1F41817F8](v0, v1);
}

+ (id)sharedInstanceIfExists
{
  return (id)__loggerInstance;
}

- (SBWakeLogger)init
{
  v16[1] = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v12.receiver = self;
  v12.super_class = (Class)SBWakeLogger;
  v3 = [(SBWakeLogger *)&v12 init];
  if (v3)
  {
    v15 = @"IOPropertyMatch";
    v13 = @"backlight-control";
    uint64_t v14 = *MEMORY[0x1E4F1CFD0];
    v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v14 forKeys:&v13 count:1];
    v16[0] = v4;
    v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];

    v3->_lock._os_unfair_lock_opaque = 0;
    v6 = [MEMORY[0x1E4F4F7D0] sharedInstance];
    v3->_homeButtonType = [v6 homeButtonType];

    mach_port_t v7 = *MEMORY[0x1E4F2EEF0];
    CFDictionaryRef v8 = IOServiceMatching("AppleSPUTimesync");
    v3->_timesyncService = IOServiceGetMatchingService(v7, v8);
    if (MGGetBoolAnswer()) {
      IOMobileFramebufferGetMainDisplay();
    }
    else {
      v3->_backlightService = IOServiceGetMatchingService(v7, (CFDictionaryRef)v5);
    }
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    wakeSouceToEventDict = v3->_wakeSouceToEventDict;
    v3->_wakeSouceToEventDict = v9;
  }
  kdebug_trace();
  return v3;
}

- (void)dealloc
{
  IOObjectRelease(self->_timesyncService);
  IOObjectRelease(self->_backlightService);
  v3.receiver = self;
  v3.super_class = (Class)SBWakeLogger;
  [(SBWakeLogger *)&v3 dealloc];
}

- (NSString)activeWakeSourceDescription
{
  return (NSString *)SBWakeLoggerSourceDescription(self->_activeWakeLoggerSource);
}

- (void)wakeMayBegin:(int64_t)a3 withTimestamp:(unint64_t)a4
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  CFDictionaryRef v8 = [[SBWakeEvent alloc] initWithTimestamp:a4];
  wakeSouceToEventDict = self->_wakeSouceToEventDict;
  v10 = [NSNumber numberWithInteger:a3];
  [(NSMutableDictionary *)wakeSouceToEventDict setObject:v8 forKeyedSubscript:v10];

  os_unfair_lock_unlock(p_lock);
}

- (void)wakeDidBegin:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(SBWakeLogger *)self _lock_wakeDidBegin:a3];
  self->_activeWakeLoggerSource = a3;
  os_unfair_lock_unlock(p_lock);
}

- (void)wakeDidEnd
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_trackingWake)
  {
    self->_trackingWake = 0;
    v4 = (void *)IORegistryEntrySearchCFProperty(self->_backlightService, "IOService", @"displayOnContinuousTimestamp", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 1u);
    v5 = SBLogTailspinSignposts();
    if (os_signpost_enabled(v5))
    {
      int v6 = 134349056;
      uint64_t v7 = [v4 unsignedLongLongValue];
      _os_signpost_emit_with_name_impl(&dword_18B52E000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT", "%{public,signpost.description:end_time}llu enableTelemetry=YES ", (uint8_t *)&v6, 0xCu);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)lockDidBegin
{
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_wakeSouceToEventDict removeAllObjects];
  self->_activeWakeLoggerSource = 0;
  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_wakeDidBegin:(int64_t)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  if (self->_backlightService)
  {
    uint64_t v55 = 0;
    uint64_t v56 = 0;
    mach_get_times();
    long long v5 = 0uLL;
    long long valuePtr = 0u;
    long long v54 = 0u;
    io_registry_entry_t timesyncService = self->_timesyncService;
    if (timesyncService)
    {
      CFDictionaryRef CFProperty = (const __CFDictionary *)IORegistryEntryCreateCFProperty(timesyncService, @"timesync", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
      if (CFProperty)
      {
        CFDictionaryRef v8 = CFProperty;
        CFNumberRef Value = (const __CFNumber *)CFDictionaryGetValue(CFProperty, @"ap");
        Boolean v10 = CFNumberGetValue(Value, kCFNumberLongLongType, &valuePtr);
        CFNumberRef v11 = (const __CFNumber *)CFDictionaryGetValue(v8, @"ap-cont");
        unsigned __int8 v12 = v10 & CFNumberGetValue(v11, kCFNumberLongLongType, (char *)&valuePtr + 8);
        CFNumberRef v13 = (const __CFNumber *)CFDictionaryGetValue(v8, @"spu");
        Boolean v14 = CFNumberGetValue(v13, kCFNumberLongLongType, &v54);
        CFNumberRef v15 = (const __CFNumber *)CFDictionaryGetValue(v8, @"calendar");
        int v48 = v12 & (v14 & CFNumberGetValue(v15, kCFNumberLongLongType, (char *)&v54 + 8)) & 1;
        CFRelease(v8);
      }
      else
      {
        int v48 = 0;
      }
      long long v5 = 0uLL;
    }
    else
    {
      int v48 = 0;
    }
    long long v51 = v5;
    long long v52 = v5;
    long long v49 = v5;
    long long v50 = v5;
    obj = self->_wakeSouceToEventDict;
    uint64_t v16 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v61 count:16];
    if (v16)
    {
      uint64_t v18 = v16;
      uint64_t v19 = *(void *)v50;
      *(void *)&long long v17 = 134349056;
      long long v45 = v17;
      int64_t v46 = a3;
      do
      {
        uint64_t v20 = 0;
        do
        {
          if (*(void *)v50 != v19) {
            objc_enumerationMutation(obj);
          }
          v21 = *(void **)(*((void *)&v49 + 1) + 8 * v20);
          v22 = -[NSMutableDictionary objectForKey:](self->_wakeSouceToEventDict, "objectForKey:", v21, v45);
          unint64_t v23 = [v21 integerValue];
          uint64_t v24 = [v22 eventRecvContTimestamp];
          uint64_t v25 = [v22 eventAbsTimestamp];
          if (v23 <= 6)
          {
            uint64_t v26 = v25;
            if (((1 << v23) & 0x66) != 0)
            {
              if (!v48) {
                goto LABEL_33;
              }
              uint64_t v27 = valuePtr;
              uint64_t v28 = v54;
              *(void *)info = 0;
              mach_timebase_info((mach_timebase_info_t)info);
              unint64_t v29 = v26 * (unint64_t)*(unsigned int *)info / *(unsigned int *)&info[4];
              uint64_t v30 = v28 - v27;
              goto LABEL_17;
            }
            if (v23 == 3)
            {
              int64_t homeButtonType = self->_homeButtonType;
              if (homeButtonType != 1)
              {
                if (homeButtonType) {
                  goto LABEL_33;
                }
                goto LABEL_23;
              }
              if (!v48) {
                goto LABEL_33;
              }
              uint64_t v42 = valuePtr;
              uint64_t v43 = v54;
              *(void *)info = 0;
              mach_timebase_info((mach_timebase_info_t)info);
              unint64_t v29 = v26 * (unint64_t)*(unsigned int *)info / *(unsigned int *)&info[4];
              uint64_t v30 = v43 - v42;
LABEL_17:
              unint64_t v31 = (v30 + v29) / 0x3E8;
              *(void *)info = 0;
              mach_timebase_info((mach_timebase_info_t)info);
              unint64_t v32 = v31 * *(unsigned int *)&info[4];
              a3 = v46;
              unint64_t v33 = 1000 * v32 / *(unsigned int *)info;
            }
            else
            {
              if (v23 != 4) {
                goto LABEL_33;
              }
LABEL_23:
              uint64_t v57 = 0;
              *(void *)info = 0;
              mach_get_times();
              unint64_t v33 = v57 + v26 - *(void *)info;
            }
            if (v23 == a3)
            {
              self->_trackingWake = 1;
              v35 = SBLogTailspinSignposts();
              if (os_signpost_enabled(v35))
              {
                SBWakeLoggerSourceDescription(a3);
                id v36 = objc_claimAutoreleasedReturnValue();
                uint64_t v37 = [v36 UTF8String];
                *(_DWORD *)info = 134349314;
                *(void *)&info[4] = v33;
                __int16 v59 = 2082;
                uint64_t v60 = v37;
                _os_signpost_emit_with_name_impl(&dword_18B52E000, v35, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT", "%{public,signpost.description:begin_time,public}llu WakeReason=%{public,signpost.telemetry:string1}s enableTelemetry=YES ", info, 0x16u);
              }
            }
            v38 = SBLogTailspinSignposts();
            if (os_signpost_enabled(v38))
            {
              SBWakeLoggerSourceDescription(a3);
              id v39 = objc_claimAutoreleasedReturnValue();
              uint64_t v40 = [v39 UTF8String];
              *(_DWORD *)info = 134349314;
              *(void *)&info[4] = v33;
              __int16 v59 = 2082;
              uint64_t v60 = v40;
              _os_signpost_emit_with_name_impl(&dword_18B52E000, v38, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT_HID_LATENCY", "%{public,signpost.description:begin_time}llu WakeReason=%{public,signpost.telemetry:string1}s enableTelemetry=YES ", info, 0x16u);
            }
            v41 = SBLogTailspinSignposts();
            if (os_signpost_enabled(v41))
            {
              *(_DWORD *)info = v45;
              *(void *)&info[4] = v24;
              _os_signpost_emit_with_name_impl(&dword_18B52E000, v41, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_WAKE_EVENT_HID_LATENCY", "%{public,signpost.description:end_time}llu enableTelemetry=YES ", info, 0xCu);
            }
          }
LABEL_33:

          ++v20;
        }
        while (v18 != v20);
        uint64_t v44 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v49 objects:v61 count:16];
        uint64_t v18 = v44;
      }
      while (v44);
    }

    [(NSMutableDictionary *)self->_wakeSouceToEventDict removeAllObjects];
  }
}

- (BOOL)trackingWake
{
  return self->_trackingWake;
}

- (void)setTrackingWake:(BOOL)a3
{
  self->_trackingWake = a3;
}

- (int64_t)homeButtonType
{
  return self->_homeButtonType;
}

- (void)setHomeButtonType:(int64_t)a3
{
  self->_int64_t homeButtonType = a3;
}

- (unsigned)timesyncService
{
  return self->_timesyncService;
}

- (void)setTimesyncService:(unsigned int)a3
{
  self->_io_registry_entry_t timesyncService = a3;
}

- (unsigned)backlightService
{
  return self->_backlightService;
}

- (void)setBacklightService:(unsigned int)a3
{
  self->_backlightService = a3;
}

- (NSMutableDictionary)wakeSouceToEventDict
{
  return self->_wakeSouceToEventDict;
}

- (void)setWakeSouceToEventDict:(id)a3
{
}

- (int64_t)activeWakeLoggerSource
{
  return self->_activeWakeLoggerSource;
}

- (void)setActiveWakeLoggerSource:(int64_t)a3
{
  self->_activeWakeLoggerSource = a3;
}

- (void).cxx_destruct
{
}

@end