@interface FMDBatteryInfo
+ (BOOL)supportsSecureCoding;
- (FMDBatteryInfo)init;
- (FMDBatteryInfo)initWithCoder:(id)a3;
- (FMDBatteryInfo)initWithDictionary:(id)a3;
- (FMDBatteryInfo)initWithType:(unint64_t)a3 level:(double)a4 state:(unint64_t)a5;
- (NSDictionary)dictionaryValue;
- (double)batteryLevel;
- (id)batteryStatusForState:(unint64_t)a3;
- (unint64_t)batteryState;
- (unint64_t)batteryType;
- (void)encodeWithCoder:(id)a3;
- (void)populateBatterStatsForCurrentDevice;
@end

@implementation FMDBatteryInfo

- (FMDBatteryInfo)init
{
  v5.receiver = self;
  v5.super_class = (Class)FMDBatteryInfo;
  v2 = [(FMDBatteryInfo *)&v5 init];
  v3 = v2;
  if (v2)
  {
    v2->_batteryType = 4;
    [(FMDBatteryInfo *)v2 populateBatterStatsForCurrentDevice];
  }
  return v3;
}

- (FMDBatteryInfo)initWithType:(unint64_t)a3 level:(double)a4 state:(unint64_t)a5
{
  v9.receiver = self;
  v9.super_class = (Class)FMDBatteryInfo;
  result = [(FMDBatteryInfo *)&v9 init];
  if (result)
  {
    result->_batteryLevel = a4;
    result->_batteryState = a5;
    result->_batteryType = a3;
  }
  return result;
}

- (FMDBatteryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FMDBatteryInfo;
  objc_super v5 = [(FMDBatteryInfo *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_opt_class();
    v7 = NSStringFromSelector("batteryLevel");
    v8 = [v4 decodeObjectOfClass:v6 forKey:v7];
    [v8 doubleValue];
    v5->_batteryLevel = v9;

    uint64_t v10 = objc_opt_class();
    v11 = NSStringFromSelector("batteryState");
    v12 = [v4 decodeObjectOfClass:v10 forKey:v11];
    v5->_batteryState = (unint64_t)[v12 unsignedIntegerValue];

    uint64_t v13 = objc_opt_class();
    v14 = NSStringFromSelector("batteryType");
    v15 = [v4 decodeObjectOfClass:v13 forKey:v14];
    v5->_batteryType = (unint64_t)[v15 unsignedIntegerValue];
  }
  return v5;
}

- (FMDBatteryInfo)initWithDictionary:(id)a3
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  double batteryLevel = self->_batteryLevel;
  id v5 = a3;
  uint64_t v6 = +[NSNumber numberWithDouble:batteryLevel];
  v7 = NSStringFromSelector("batteryLevel");
  [v5 encodeObject:v6 forKey:v7];

  v8 = +[NSNumber numberWithUnsignedInteger:self->_batteryState];
  double v9 = NSStringFromSelector("batteryState");
  [v5 encodeObject:v8 forKey:v9];

  id v11 = +[NSNumber numberWithUnsignedInteger:self->_batteryType];
  uint64_t v10 = NSStringFromSelector("batteryType");
  [v5 encodeObject:v11 forKey:v10];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSDictionary)dictionaryValue
{
  v3 = objc_opt_new();
  id v4 = +[NSNumber numberWithDouble:self->_batteryLevel];
  [v3 setValue:v4 forKey:@"batteryLevel"];

  id v5 = [(FMDBatteryInfo *)self batteryStatusForState:self->_batteryState];
  [v3 setValue:v5 forKey:@"batteryStatus"];

  uint64_t v6 = +[NSNumber numberWithUnsignedInteger:self->_batteryType];
  [v3 setValue:v6 forKey:@"batteryType"];

  v7 = +[NSNumber numberWithBool:self->_batteryState == 2];
  [v3 setValue:v7 forKey:@"isChargerConnected"];

  return (NSDictionary *)v3;
}

- (void)populateBatterStatsForCurrentDevice
{
  CFDictionaryRef v4 = IOServiceMatching("IOPMPowerSource");
  if (v4)
  {
    io_service_t MatchingService = IOServiceGetMatchingService(kIOMasterPortDefault, v4);
    if (MatchingService)
    {
      io_registry_entry_t v6 = MatchingService;
      CFBooleanRef CFProperty = (const __CFBoolean *)IORegistryEntryCreateCFProperty(MatchingService, @"FullyCharged", kCFAllocatorDefault, 0);
      CFBooleanRef v8 = (const __CFBoolean *)IORegistryEntryCreateCFProperty(v6, @"IsCharging", kCFAllocatorDefault, 0);
      CFBooleanRef v9 = v8;
      if (CFProperty) {
        BOOL v10 = v8 == 0;
      }
      else {
        BOOL v10 = 1;
      }
      if (v10)
      {
        self->_batteryState = 0;
        if (!CFProperty)
        {
          if (!v8) {
            goto LABEL_11;
          }
          goto LABEL_10;
        }
      }
      else
      {
        int Value = CFBooleanGetValue(CFProperty);
        if (CFBooleanGetValue(v9)) {
          BOOL v17 = Value == 0;
        }
        else {
          BOOL v17 = 0;
        }
        unint64_t v18 = 1;
        if (v17) {
          unint64_t v18 = 2;
        }
        self->_batteryState = v18;
      }
      CFRelease(CFProperty);
      if (!v9)
      {
LABEL_11:
        CFNumberRef v11 = (const __CFNumber *)IORegistryEntryCreateCFProperty(v6, @"CurrentCapacity", kCFAllocatorDefault, 0);
        CFTypeRef v12 = IORegistryEntryCreateCFProperty(v6, @"MaxCapacity", kCFAllocatorDefault, 0);
        uint64_t v13 = v12;
        if (v11) {
          BOOL v14 = v12 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          if (!v11)
          {
            if (!v12)
            {
LABEL_19:
              IOObjectRelease(v6);
              goto LABEL_20;
            }
LABEL_18:
            CFRelease(v13);
            goto LABEL_19;
          }
        }
        else
        {
          uint64_t valuePtr = 0;
          CFNumberGetValue(v11, kCFNumberFloatType, (char *)&valuePtr + 4);
          CFNumberGetValue((CFNumberRef)v13, kCFNumberFloatType, &valuePtr);
          float v19 = fabsf(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
          double v20 = (float)(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
          BOOL v21 = v19 < INFINITY;
          BOOL v22 = v19 <= INFINITY;
          double v23 = 0.0;
          if (v21) {
            double v23 = (float)(*((float *)&valuePtr + 1) / *(float *)&valuePtr);
          }
          if (v22) {
            double v20 = v23;
          }
          self->_double batteryLevel = v20;
        }
        CFRelease(v11);
        if (!v13) {
          goto LABEL_19;
        }
        goto LABEL_18;
      }
LABEL_10:
      CFRelease(v9);
      goto LABEL_11;
    }
  }
LABEL_20:
}

- (id)batteryStatusForState:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return @"Unknown";
  }
  else {
    return *(&off_1002DAF28 + a3 - 1);
  }
}

- (unint64_t)batteryType
{
  return self->_batteryType;
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (unint64_t)batteryState
{
  return self->_batteryState;
}

@end