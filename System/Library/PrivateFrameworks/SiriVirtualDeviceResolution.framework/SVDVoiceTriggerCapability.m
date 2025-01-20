@interface SVDVoiceTriggerCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDVoiceTriggerCapability)initWithCoder:(id)a3;
- (SVDVoiceTriggerCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsVoiceTrigger;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDVoiceTriggerCapability

- (SVDVoiceTriggerCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDVoiceTriggerCapability;
  v4 = [(SVDVoiceTriggerCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability alloc] initWithStatus:a3];
    backing = v4->_backing;
    v4->_backing = v5;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void).cxx_destruct
{
}

- (SVDVoiceTriggerCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDVoiceTriggerCapability;
  v5 = [(SVDVoiceTriggerCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDVoiceTriggerCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution22VoiceTriggerCapability *)v6;
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

- (int64_t)supportsVoiceTrigger
{
  return [(VoiceTriggerCapability *)self->_backing supportsVoiceTrigger];
}

+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3
{
  v3 = +[VoiceTriggerCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end