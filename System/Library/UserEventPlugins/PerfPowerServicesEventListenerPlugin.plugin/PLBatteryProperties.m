@interface PLBatteryProperties
+ (id)properties;
- (BOOL)draining;
- (BOOL)fullyCharged;
- (BOOL)gasGaugeEnabled;
- (BOOL)isCharging;
- (BOOL)isCritical;
- (BOOL)isPluggedIn;
- (NSNumber)adapterInfo;
- (NSNumber)connectedStatus;
- (PLBatteryProperties)init;
- (PLBatteryProperties)initWithBatteryEntry:(unsigned int)a3;
- (double)capacity;
- (double)chargeAccum;
- (double)currentAbsoluteCapacity;
- (double)currentCapacity;
- (double)dod0;
- (double)fullAvailableCapacity;
- (double)maxCapacity;
- (double)nominalChargeCapacity;
- (double)passedCharge;
- (double)rawCapacity;
- (double)rawCurrentCapacity;
- (double)rawMaxCapacity;
- (id)batteryProperties;
- (id)humanReadableChargingState;
- (id)propertyForKey:(__CFString *)a3;
- (int64_t)batteryTemp;
- (int64_t)chargingCurrent;
- (int64_t)current;
- (int64_t)cycleCount;
- (int64_t)designCapacity;
- (int64_t)updateTime;
- (int64_t)voltage;
- (void)dealloc;
- (void)invalidateCache;
@end

@implementation PLBatteryProperties

- (PLBatteryProperties)initWithBatteryEntry:(unsigned int)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLBatteryProperties;
  v4 = [(PLBatteryProperties *)&v6 init];
  if (v4)
  {
    IOObjectRetain(a3);
    v4->batteryEntry = a3;
  }
  return v4;
}

+ (id)properties
{
  id v2 = objc_alloc_init((Class)a1);

  return v2;
}

- (PLBatteryProperties)init
{
  CFDictionaryRef v3 = IOServiceMatching("IOPMPowerSource");
  uint64_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v3);
  io_object_t v5 = MatchingService;
  objc_super v6 = [(PLBatteryProperties *)self initWithBatteryEntry:MatchingService];
  IOObjectRelease(v5);
  return v6;
}

- (void)dealloc
{
  IOObjectRelease(self->batteryEntry);

  v3.receiver = self;
  v3.super_class = (Class)PLBatteryProperties;
  [(PLBatteryProperties *)&v3 dealloc];
}

- (id)batteryProperties
{
  p_batteryProperties = (CFMutableDictionaryRef *)&self->batteryProperties;
  id result = self->batteryProperties;
  if (result) {
    return result;
  }
  io_registry_entry_t batteryEntry = self->batteryEntry;
  if (!batteryEntry) {
    return 0;
  }
  CFMutableDictionaryRef *p_batteryProperties = 0;
  uint64_t CFProperties = IORegistryEntryCreateCFProperties(batteryEntry, p_batteryProperties, 0, 0);
  id result = *p_batteryProperties;
  if (CFProperties) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = result == 0;
  }
  if (v7)
  {

    NSLog(&cfstr_UnableToGetPro.isa, CFProperties);
    return 0;
  }
  return result;
}

- (BOOL)gasGaugeEnabled
{
  id v2 = (id)qword_13E18;
  if (!qword_13E18)
  {
    CFBooleanRef v3 = (const __CFBoolean *)MGCopyAnswer();
    id v4 = objc_alloc((Class)NSNumber);
    if (v3)
    {
      qword_13E18 = (uint64_t)[v4 initWithBool:CFBooleanGetValue(v3) != 0];
      CFRelease(v3);
      id v2 = (id)qword_13E18;
    }
    else
    {
      id v2 = [v4 initWithBool:0];
      qword_13E18 = (uint64_t)v2;
    }
  }

  return [v2 BOOLValue];
}

- (double)maxCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"MaxCapacity"];

  [v2 doubleValue];
  return result;
}

- (double)rawMaxCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"AppleRawMaxCapacity"];

  [v2 doubleValue];
  return result;
}

- (double)currentCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"CurrentCapacity"];

  [v2 doubleValue];
  return result;
}

- (double)currentAbsoluteCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"AbsoluteCapacity"];

  [v2 doubleValue];
  return result;
}

- (BOOL)isPluggedIn
{
  id v2 = [(PLBatteryProperties *)self adapterInfo];

  return [(NSNumber *)v2 BOOLValue];
}

- (NSNumber)adapterInfo
{
  double result = [(PLBatteryProperties *)self propertyForKey:@"AdapterDetails"];
  if (result)
  {
    return (NSNumber *)[(NSNumber *)result objectForKey:@"FamilyCode"];
  }
  return result;
}

- (NSNumber)connectedStatus
{
  return (NSNumber *)[(PLBatteryProperties *)self propertyForKey:@"ExternalConnected"];
}

- (double)capacity
{
  [(PLBatteryProperties *)self currentCapacity];
  double v4 = v3 * 100.0;
  [(PLBatteryProperties *)self maxCapacity];
  return v4 / v5;
}

- (double)passedCharge
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"BatteryData"];
  if (!v2) {
    return 0.0;
  }
  id v3 = [v2 objectForKey:@"PassedCharge"];

  [v3 doubleValue];
  return result;
}

- (double)chargeAccum
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"BatteryData"];
  if (!v2) {
    return 0.0;
  }
  id v3 = [v2 objectForKey:@"ChargeAccum"];

  [v3 doubleValue];
  return result;
}

- (double)dod0
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"BatteryData"];
  if (!v2) {
    return 0.0;
  }
  id v3 = objc_msgSend(objc_msgSend(v2, "objectForKey:", @"DOD0"), "firstObject");

  [v3 doubleValue];
  return result;
}

- (double)rawCurrentCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"AppleRawCurrentCapacity"];

  [v2 doubleValue];
  return result;
}

- (double)rawCapacity
{
  [(PLBatteryProperties *)self rawCurrentCapacity];
  double v4 = v3 * 100.0;
  [(PLBatteryProperties *)self rawMaxCapacity];
  return v4 / v5;
}

- (int64_t)voltage
{
  if ([(PLBatteryProperties *)self gasGaugeEnabled]) {
    CFStringRef v3 = @"Voltage";
  }
  else {
    CFStringRef v3 = @"AppleRawBatteryVoltage";
  }
  CFProperty = (void *)IORegistryEntryCreateCFProperty(self->batteryEntry, v3, kCFAllocatorDefault, 0);
  if (CFProperty)
  {
    double v5 = CFProperty;
    id v6 = [CFProperty integerValue];

    return (int64_t)v6;
  }
  else
  {
    NSLog(&cfstr_UnableToLookUp.isa);
    return -1;
  }
}

- (BOOL)isCharging
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"IsCharging"];

  return [v2 BOOLValue];
}

- (BOOL)isCritical
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"AtCriticalLevel"];

  return [v2 BOOLValue];
}

- (int64_t)chargingCurrent
{
  int64_t result = [(PLBatteryProperties *)self propertyForKey:@"AdapterDetails"];
  if (result)
  {
    id v3 = [(id)result objectForKey:@"Current"];
    return (int64_t)[v3 integerValue];
  }
  return result;
}

- (int64_t)batteryTemp
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"Temperature"];

  return (int64_t)[v2 integerValue];
}

- (int64_t)cycleCount
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"CycleCount"];

  return (int64_t)[v2 integerValue];
}

- (int64_t)designCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"DesignCapacity"];

  return (int64_t)[v2 integerValue];
}

- (int64_t)current
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"InstantAmperage"];

  return (int64_t)[v2 integerValue];
}

- (BOOL)fullyCharged
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"FullyCharged"];

  return [v2 BOOLValue];
}

- (int64_t)updateTime
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"UpdateTime"];

  return (int64_t)[v2 longValue];
}

- (double)nominalChargeCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"NominalChargeCapacity"];

  [v2 doubleValue];
  return result;
}

- (double)fullAvailableCapacity
{
  id v2 = [(PLBatteryProperties *)self propertyForKey:@"FullAvailableCapacity"];

  [v2 doubleValue];
  return result;
}

- (BOOL)draining
{
  if ([(PLBatteryProperties *)self isCharging]) {
    return 0;
  }
  else {
    return ![(PLBatteryProperties *)self fullyCharged];
  }
}

- (id)propertyForKey:(__CFString *)a3
{
  id v4 = [(PLBatteryProperties *)self batteryProperties];

  return [v4 objectForKey:a3];
}

- (id)humanReadableChargingState
{
  if ([(PLBatteryProperties *)self isCharging]) {
    return @"Active";
  }
  if ([(PLBatteryProperties *)self fullyCharged]) {
    return @"Full";
  }
  CFStringRef v4 = [(PLBatteryProperties *)self propertyForKey:@"ChargeStatus"];
  if (!v4) {
    return @"Inactive";
  }
  CFStringRef v5 = v4;
  if (CFStringCompare(v4, @"HighTemperature", 0)) {
    return @"OverTemp";
  }
  if (CFStringCompare(v5, @"LowTemperature", 0)) {
    return @"UnderTemp";
  }
  if (CFStringCompare(v5, @"BatteryTemperatureGradient", 0)) {
    return @"Gradient";
  }
  return (id)v5;
}

- (void)invalidateCache
{
  self->batteryProperties = 0;
}

@end