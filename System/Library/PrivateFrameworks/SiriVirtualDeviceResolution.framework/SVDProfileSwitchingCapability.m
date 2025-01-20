@interface SVDProfileSwitchingCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDProfileSwitchingCapability)initWithCoder:(id)a3;
- (SVDProfileSwitchingCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsProfileSwitching;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDProfileSwitchingCapability

- (void).cxx_destruct
{
}

- (SVDProfileSwitchingCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDProfileSwitchingCapability;
  v5 = [(SVDProfileSwitchingCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDProfileSwitchingCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability *)v6;
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

- (int64_t)supportsProfileSwitching
{
  return [(ProfileSwitchingCapability *)self->_backing supportsProfileSwitching];
}

- (SVDProfileSwitchingCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDProfileSwitchingCapability;
  id v4 = [(SVDProfileSwitchingCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution26ProfileSwitchingCapability alloc] initWithStatus:a3];
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
  v3 = +[ProfileSwitchingCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end