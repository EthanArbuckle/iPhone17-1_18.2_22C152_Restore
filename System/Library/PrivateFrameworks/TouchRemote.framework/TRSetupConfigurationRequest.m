@interface TRSetupConfigurationRequest
+ (BOOL)supportsSecureCoding;
- (NSString)deviceName;
- (TRSetupConfigurationRequest)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setDeviceName:(id)a3;
@end

@implementation TRSetupConfigurationRequest

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)TRSetupConfigurationRequest;
  [(TRMessage *)&v6 encodeWithCoder:v4];
  deviceName = self->_deviceName;
  if (deviceName) {
    [v4 encodeObject:deviceName forKey:@"TRSetupConfigurationMessages_dN"];
  }
}

- (TRSetupConfigurationRequest)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TRSetupConfigurationRequest;
  v5 = [(TRMessage *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"TRSetupConfigurationMessages_dN"];
    deviceName = v5->_deviceName;
    v5->_deviceName = (NSString *)v6;
  }
  return v5;
}

- (id)description
{
  v3 = [NSString stringWithFormat:@"deviceName:[-%@-]", self->_deviceName];
  id v4 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRSetupConfigurationRequest;
  v5 = [(TRMessage *)&v8 description];
  uint64_t v6 = [v4 stringWithFormat:@"%@ %@", v5, v3];

  return v6;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (void).cxx_destruct
{
}

@end