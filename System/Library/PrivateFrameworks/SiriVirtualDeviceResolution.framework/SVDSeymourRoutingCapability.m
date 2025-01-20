@interface SVDSeymourRoutingCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDSeymourRoutingCapability)initWithCoder:(id)a3;
- (SVDSeymourRoutingCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsSeymourRouting;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDSeymourRoutingCapability

- (void).cxx_destruct
{
}

- (SVDSeymourRoutingCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDSeymourRoutingCapability;
  v5 = [(SVDSeymourRoutingCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDSeymourRoutingCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability *)v6;
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

- (int64_t)supportsSeymourRouting
{
  return [(SeymourRoutingCapability *)self->_backing supportsSeymourRouting];
}

- (SVDSeymourRoutingCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDSeymourRoutingCapability;
  id v4 = [(SVDSeymourRoutingCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution24SeymourRoutingCapability alloc] initWithStatus:a3];
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
  v3 = +[SeymourRoutingCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end