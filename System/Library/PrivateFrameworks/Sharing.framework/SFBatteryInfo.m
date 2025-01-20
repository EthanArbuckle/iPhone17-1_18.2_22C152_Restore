@interface SFBatteryInfo
+ (BOOL)supportsSecureCoding;
- (SFBatteryInfo)initWithCoder:(id)a3;
- (double)batteryLevel;
- (id)description;
- (int64_t)batteryState;
- (int64_t)batteryType;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryLevel:(double)a3;
- (void)setBatteryState:(int64_t)a3;
- (void)setBatteryType:(int64_t)a3;
@end

@implementation SFBatteryInfo

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SFBatteryInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SFBatteryInfo;
  v5 = [(SFBatteryInfo *)&v9 init];
  if (v5)
  {
    if ([v4 containsValueForKey:@"batteryLevel"])
    {
      [v4 decodeDoubleForKey:@"batteryLevel"];
      v5->_batteryLevel = v6;
    }
    if ([v4 containsValueForKey:@"batteryState"]) {
      v5->_batteryState = [v4 decodeIntegerForKey:@"batteryState"];
    }
    if ([v4 containsValueForKey:@"batteryType"]) {
      v5->_batteryType = [v4 decodeIntegerForKey:@"batteryType"];
    }
    v7 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  double batteryLevel = self->_batteryLevel;
  id v5 = a3;
  [v5 encodeDouble:@"batteryLevel" forKey:batteryLevel];
  [v5 encodeInteger:self->_batteryState forKey:@"batteryState"];
  [v5 encodeInteger:self->_batteryType forKey:@"batteryType"];
}

- (id)description
{
  return (id)NSPrintF();
}

- (double)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(double)a3
{
  self->_double batteryLevel = a3;
}

- (int64_t)batteryState
{
  return self->_batteryState;
}

- (void)setBatteryState:(int64_t)a3
{
  self->_batteryState = a3;
}

- (int64_t)batteryType
{
  return self->_batteryType;
}

- (void)setBatteryType:(int64_t)a3
{
  self->_batteryType = a3;
}

@end