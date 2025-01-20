@interface SVDCustomTimerIntentHandlingCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDCustomTimerIntentHandlingCapability)initWithCoder:(id)a3;
- (SVDCustomTimerIntentHandlingCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsCustomTimerIntentHandling;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDCustomTimerIntentHandlingCapability

- (void).cxx_destruct
{
}

- (SVDCustomTimerIntentHandlingCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDCustomTimerIntentHandlingCapability;
  v5 = [(SVDCustomTimerIntentHandlingCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDCustomTimerIntentHandlingCapability"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability *)v6;
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

- (int64_t)supportsCustomTimerIntentHandling
{
  return [(CustomTimerIntentHandlingCapability *)self->_backing supportsCustomTimerIntentHandling];
}

- (SVDCustomTimerIntentHandlingCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDCustomTimerIntentHandlingCapability;
  id v4 = [(SVDCustomTimerIntentHandlingCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution35CustomTimerIntentHandlingCapability alloc] initWithStatus:a3];
    backing = v4->_backing;
    v4->_backing = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  v3 = +[CustomTimerIntentHandlingCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end