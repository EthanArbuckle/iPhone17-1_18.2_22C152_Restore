@interface SVDAlarmTimerIntentsHandlingCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDAlarmTimerIntentsHandlingCapability)initWithCoder:(id)a3;
- (SVDAlarmTimerIntentsHandlingCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsAlarmTimerIntentsHandling;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDAlarmTimerIntentsHandlingCapability

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SVDAlarmTimerIntentsHandlingCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDAlarmTimerIntentsHandlingCapability;
  v4 = [(SVDAlarmTimerIntentsHandlingCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability alloc] initWithStatus:a3];
    backing = v4->_backing;
    v4->_backing = v5;
  }
  return v4;
}

- (void).cxx_destruct
{
}

- (SVDAlarmTimerIntentsHandlingCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDAlarmTimerIntentsHandlingCapability;
  v5 = [(SVDAlarmTimerIntentsHandlingCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDAlarmTimerIntentsHandlingCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution35AlarmTimerIntentsHandlingCapability *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (id)_swiftBacking
{
  return self->_backing;
}

- (int64_t)supportsAlarmTimerIntentsHandling
{
  return [(AlarmTimerIntentsHandlingCapability *)self->_backing supportsAlarmTimerIntentsHandling];
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  v3 = +[AlarmTimerIntentsHandlingCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end