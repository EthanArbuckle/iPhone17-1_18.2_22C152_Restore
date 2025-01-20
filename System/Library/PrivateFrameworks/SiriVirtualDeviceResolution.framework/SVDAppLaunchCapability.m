@interface SVDAppLaunchCapability
+ (BOOL)supportsSecureCoding;
+ (id)capabilityDescriptionMatchingSupportStatus:(int64_t)a3;
- (SVDAppLaunchCapability)initWithCoder:(id)a3;
- (SVDAppLaunchCapability)initWithStatus:(int64_t)a3;
- (id)_swiftBacking;
- (int64_t)supportsAppLaunch;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SVDAppLaunchCapability

- (void).cxx_destruct
{
}

- (SVDAppLaunchCapability)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SVDAppLaunchCapability;
  v5 = [(SVDAppLaunchCapability *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"SVDAppLaunchCapabilityBacking"];
    backing = v5->_backing;
    v5->_backing = (_TtC27SiriVirtualDeviceResolution19AppLaunchCapability *)v6;
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

- (int64_t)supportsAppLaunch
{
  return [(AppLaunchCapability *)self->_backing supportsAppLaunch];
}

- (SVDAppLaunchCapability)initWithStatus:(int64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SVDAppLaunchCapability;
  id v4 = [(SVDAppLaunchCapability *)&v8 init];
  if (v4)
  {
    v5 = [[_TtC27SiriVirtualDeviceResolution19AppLaunchCapability alloc] initWithStatus:a3];
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
  v3 = +[AppLaunchCapability capabilityDescriptionMatchingSupportStatus:a3];
  id v4 = [[SVDCapabilityDescription alloc] initWithBacking:v3];

  return v4;
}

@end