@interface SVDMUXCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDMUXCapability)initWithCoder:(id)a3;
- (SVDMUXCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsMUX;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDMUXCapability

- (void).cxx_destruct
{
}

- (SVDMUXCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDMUXCapability;
  v5 = [(SVDMUXCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDMUXCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution13MUXCapability *)v6;
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

- (int64_t)supportsMUX
{
  return [(MUXCapability *)self->_backing supportsMUX];
}

- (SVDMUXCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDMUXCapability;
  id v4 = [(SVDMUXCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution13MUXCapability alloc] initWithStatus:a3];
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
  v3 = +[MUXCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end