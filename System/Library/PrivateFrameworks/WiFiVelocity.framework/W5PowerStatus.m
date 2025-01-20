@interface W5PowerStatus
+ (BOOL)supportsSecureCoding;
- (BOOL)conformsToProtocol:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPowerStatus:(id)a3;
- (W5PowerStatus)initWithCoder:(id)a3;
- (double)internalBatteryLevel;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)batteryWarningLevel;
- (int64_t)powerSourceType;
- (unint64_t)hash;
- (unsigned)powerStateCaps;
- (void)encodeWithCoder:(id)a3;
- (void)setBatteryWarningLevel:(int)a3;
- (void)setInternalBatteryLevel:(double)a3;
- (void)setPowerSourceType:(int64_t)a3;
- (void)setPowerStateCaps:(unsigned int)a3;
@end

@implementation W5PowerStatus

- (id)description
{
  v3 = (void *)[MEMORY[0x263F089D8] stringWithCapacity:0];
  [v3 appendFormat:@"Power Source Type: %@\n", W5DescriptionForPowerSourceType(self->_powerSourceType)];
  objc_msgSend(v3, "appendFormat:", @"Internal Battery Level: %.0f\n", *(void *)&self->_internalBatteryLevel);
  [v3 appendFormat:@"Battery Warning Level: %@\n", W5DescriptionForBatteryWarningLevel(self->_batteryWarningLevel)];
  [v3 appendFormat:@"Power State: %@\n", W5DescriptionForPowerStateCaps()];
  v4 = (void *)[v3 copy];
  return v4;
}

- (BOOL)conformsToProtocol:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)W5PowerStatus;
  if (-[W5PowerStatus conformsToProtocol:](&v5, sel_conformsToProtocol_)
    || ([a3 isEqual:&unk_26C50B870] & 1) != 0)
  {
    return 1;
  }
  else
  {
    return [a3 isEqual:&unk_26C50B6D8];
  }
}

- (BOOL)isEqualToPowerStatus:(id)a3
{
  int64_t powerSourceType = self->_powerSourceType;
  if (powerSourceType != [a3 powerSourceType]) {
    return 0;
  }
  int batteryWarningLevel = self->_batteryWarningLevel;
  if (batteryWarningLevel != [a3 batteryWarningLevel]) {
    return 0;
  }
  unsigned int powerStateCaps = self->_powerStateCaps;
  if (powerStateCaps != [a3 powerStateCaps]) {
    return 0;
  }
  unint64_t internalBatteryLevel = (unint64_t)self->_internalBatteryLevel;
  [a3 internalBatteryLevel];
  return internalBatteryLevel == (unint64_t)v9;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  if (!a3) {
    return 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    return 0;
  }
  return [(W5PowerStatus *)self isEqualToPowerStatus:a3];
}

- (unint64_t)hash
{
  int64_t v2 = self->_powerSourceType ^ self->_batteryWarningLevel ^ self->_powerStateCaps;
  return v2 ^ objc_msgSend((id)objc_msgSend(NSNumber, "numberWithDouble:", self->_internalBatteryLevel), "hash");
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [+[W5PowerStatus allocWithZone:a3] init];
  [(W5PowerStatus *)v4 setPowerSourceType:self->_powerSourceType];
  [(W5PowerStatus *)v4 setBatteryWarningLevel:self->_batteryWarningLevel];
  [(W5PowerStatus *)v4 setPowerStateCaps:self->_powerStateCaps];
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeInteger:self->_powerSourceType forKey:@"_powerSourceType"];
  [a3 encodeInt:self->_batteryWarningLevel forKey:@"_batteryWarningLevel"];
  [a3 encodeDouble:@"_internalBatteryLevel" forKey:self->_internalBatteryLevel];
  uint64_t powerStateCaps = self->_powerStateCaps;
  [a3 encodeInt:powerStateCaps forKey:@"_powerStateCaps"];
}

- (W5PowerStatus)initWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)W5PowerStatus;
  v4 = [(W5PowerStatus *)&v7 init];
  if (v4)
  {
    v4->_int64_t powerSourceType = [a3 decodeIntegerForKey:@"_powerSourceType"];
    v4->_int batteryWarningLevel = [a3 decodeIntForKey:@"_batteryWarningLevel"];
    [a3 decodeFloatForKey:@"_internalBatteryLevel"];
    v4->_unint64_t internalBatteryLevel = v5;
    v4->_uint64_t powerStateCaps = [a3 decodeIntForKey:@"_powerStateCaps"];
  }
  return v4;
}

- (int64_t)powerSourceType
{
  return self->_powerSourceType;
}

- (void)setPowerSourceType:(int64_t)a3
{
  self->_int64_t powerSourceType = a3;
}

- (int)batteryWarningLevel
{
  return self->_batteryWarningLevel;
}

- (void)setBatteryWarningLevel:(int)a3
{
  self->_int batteryWarningLevel = a3;
}

- (double)internalBatteryLevel
{
  return self->_internalBatteryLevel;
}

- (void)setInternalBatteryLevel:(double)a3
{
  self->_unint64_t internalBatteryLevel = a3;
}

- (unsigned)powerStateCaps
{
  return self->_powerStateCaps;
}

- (void)setPowerStateCaps:(unsigned int)a3
{
  self->_uint64_t powerStateCaps = a3;
}

@end