@interface TRSetupProxyDeviceResponse
+ (BOOL)supportsSecureCoding;
- (AKDevice)proxyDevice;
- (TRSetupProxyDeviceResponse)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setProxyDevice:(id)a3;
@end

@implementation TRSetupProxyDeviceResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupProxyDeviceResponse;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  proxyDevice = self->_proxyDevice;
  if (proxyDevice) {
    [v4 encodeObject:proxyDevice forKey:@"TRSetupAuthenticationMessages_pD"];
  }
}

- (TRSetupProxyDeviceResponse)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupProxyDeviceResponse;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupAuthenticationMessages_pD"];
    proxyDevice = v5->_proxyDevice;
    v5->_proxyDevice = (AKDevice *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"proxyDevice:[-%@-]", self->_proxyDevice];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRSetupProxyDeviceResponse;
  v5 = [(TRMessage *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (AKDevice)proxyDevice
{
  return self->_proxyDevice;
}

- (void)setProxyDevice:(id)a3
{
}

- (void).cxx_destruct
{
}

@end