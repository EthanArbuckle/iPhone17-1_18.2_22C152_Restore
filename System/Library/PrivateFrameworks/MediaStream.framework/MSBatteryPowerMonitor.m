@interface MSBatteryPowerMonitor
+ (id)defaultMonitor;
- (BOOL)_updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3;
- (BOOL)isExternalPowerConnected;
- (MSBatteryPowerMonitor)init;
- (double)currentLevel;
- (void)dealloc;
- (void)setCurrentLevel:(double)a3;
- (void)setExternalPowerConnected:(BOOL)a3;
- (void)updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3;
- (void)updateBatteryLevelWithBatteryEntry:(unsigned int)a3;
@end

@implementation MSBatteryPowerMonitor

- (void)setExternalPowerConnected:(BOOL)a3
{
  self->_isExteralPowerConnected = a3;
}

- (BOOL)isExternalPowerConnected
{
  return self->_isExteralPowerConnected;
}

- (void)setCurrentLevel:(double)a3
{
  self->_currentLevel = a3;
}

- (double)currentLevel
{
  return self->_currentLevel;
}

- (void)updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  if ([(MSBatteryPowerMonitor *)self _updateBatteryConnectedStateWithBatteryEntry:*(void *)&a3])
  {
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"MSBatteryPowerMonitorExternalPowerSourceChangedNotification" object:self];
  }
}

- (BOOL)_updateBatteryConnectedStateWithBatteryEntry:(unsigned int)a3
{
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"ExternalConnected", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    uint64_t v6 = [CFProperty BOOLValue];
    int v7 = v6 ^ [(MSBatteryPowerMonitor *)self isExternalPowerConnected];
    if (v7 != 1)
    {
LABEL_11:
      CFRelease(v5);
      return v7;
    }
    BOOL v8 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        __int16 v14 = 0;
        v9 = MEMORY[0x1E4F14500];
        v10 = "External power connected.";
        v11 = (uint8_t *)&v14;
LABEL_9:
        _os_log_impl(&dword_1DD956000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
      }
    }
    else if (v8)
    {
      LOWORD(v13) = 0;
      v9 = MEMORY[0x1E4F14500];
      v10 = "External power disconnected.";
      v11 = (uint8_t *)&v13;
      goto LABEL_9;
    }
    -[MSBatteryPowerMonitor setExternalPowerConnected:](self, "setExternalPowerConnected:", v6, v13);
    goto LABEL_11;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (void)updateBatteryLevelWithBatteryEntry:(unsigned int)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  CFProperty = (void *)IORegistryEntryCreateCFProperty(a3, @"MaxCapacity", (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  int v7 = (void *)IORegistryEntryCreateCFProperty(a3, @"CurrentCapacity", v5, 0);
  BOOL v8 = v7;
  double v9 = -1.0;
  if (CFProperty) {
    BOOL v10 = v7 == 0;
  }
  else {
    BOOL v10 = 1;
  }
  if (!v10)
  {
    objc_msgSend(v7, "doubleValue", -1.0);
    double v12 = v11;
    [CFProperty doubleValue];
    double v9 = v12 / v13;
  }
  [(MSBatteryPowerMonitor *)self setCurrentLevel:v9];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
  {
    [(MSBatteryPowerMonitor *)self currentLevel];
    int v15 = 134217984;
    double v16 = v14 * 100.0;
    _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Battery level: %.1f%%.", (uint8_t *)&v15, 0xCu);
  }
  if (CFProperty) {
    CFRelease(CFProperty);
  }
  if (v8) {
    CFRelease(v8);
  }
}

- (void)dealloc
{
  Current = CFRunLoopGetCurrent();
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D418];
  if (CFRunLoopContainsSource(Current, self->_batteryRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]))
  {
    CFAllocatorRef v5 = CFRunLoopGetCurrent();
    CFRunLoopRemoveSource(v5, self->_batteryRunLoopSource, v4);
  }
  batteryIONotifyPort = self->_batteryIONotifyPort;
  if (batteryIONotifyPort)
  {
    IONotificationPortDestroy(batteryIONotifyPort);
    self->_batteryIONotifyPort = 0;
  }
  io_object_t batteryNotificationRef = self->_batteryNotificationRef;
  if (batteryNotificationRef)
  {
    IOObjectRelease(batteryNotificationRef);
    self->_io_object_t batteryNotificationRef = 0;
  }
  v8.receiver = self;
  v8.super_class = (Class)MSBatteryPowerMonitor;
  [(MSBatteryPowerMonitor *)&v8 dealloc];
}

- (MSBatteryPowerMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)MSBatteryPowerMonitor;
  v2 = [(MSBatteryPowerMonitor *)&v14 init];
  v3 = v2;
  if (v2)
  {
    [(MSBatteryPowerMonitor *)v2 setCurrentLevel:-1.0];
    mach_port_t v4 = *MEMORY[0x1E4F2EEF0];
    CFAllocatorRef v5 = IONotificationPortCreate(*MEMORY[0x1E4F2EEF0]);
    v3->_batteryIONotifyPort = v5;
    CFRunLoopSourceRef RunLoopSource = IONotificationPortGetRunLoopSource(v5);
    v3->_batteryCFRunLoopSourceRef RunLoopSource = RunLoopSource;
    if (!RunLoopSource)
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v13 = 0;
        BOOL v10 = MEMORY[0x1E4F14500];
        double v11 = "Cannot retrieve runloop source for battery monitor.";
        goto LABEL_13;
      }
LABEL_7:

      return 0;
    }
    Current = CFRunLoopGetCurrent();
    CFRunLoopAddSource(Current, v3->_batteryRunLoopSource, (CFRunLoopMode)*MEMORY[0x1E4F1D418]);
    CFDictionaryRef v8 = IOServiceMatching("IOPMPowerSource");
    uint64_t MatchingService = IOServiceGetMatchingService(v4, v8);
    if (IOServiceAddInterestNotification(v3->_batteryIONotifyPort, MatchingService, "IOGeneralInterest", (IOServiceInterestCallback)BatteryStateChanged, v3, &v3->_batteryNotificationRef))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)double v13 = 0;
        BOOL v10 = MEMORY[0x1E4F14500];
        double v11 = "Cannot listen to battery level change notification.";
LABEL_13:
        _os_log_error_impl(&dword_1DD956000, v10, OS_LOG_TYPE_ERROR, v11, v13, 2u);
        goto LABEL_7;
      }
      goto LABEL_7;
    }
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)double v13 = 0;
      _os_log_impl(&dword_1DD956000, MEMORY[0x1E4F14500], OS_LOG_TYPE_INFO, "Listening to battery level changes.", v13, 2u);
    }
    [(MSBatteryPowerMonitor *)v3 updateBatteryLevelWithBatteryEntry:MatchingService];
    [(MSBatteryPowerMonitor *)v3 _updateBatteryConnectedStateWithBatteryEntry:MatchingService];
  }
  return v3;
}

+ (id)defaultMonitor
{
  if (defaultMonitor_onceToken != -1) {
    dispatch_once(&defaultMonitor_onceToken, &__block_literal_global_363);
  }
  v2 = (void *)defaultMonitor_monitor;

  return v2;
}

uint64_t __39__MSBatteryPowerMonitor_defaultMonitor__block_invoke()
{
  defaultMonitor_monitor = objc_alloc_init(MSBatteryPowerMonitor);

  return MEMORY[0x1F41817F8]();
}

@end