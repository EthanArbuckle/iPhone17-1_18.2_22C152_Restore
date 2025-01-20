@interface CloudDevice
+ (CloudDevice)deviceWithIDSDevice:(id)a3;
- (BOOL)isConnected;
- (BOOL)isEqual:(id)a3;
- (CloudDevice)initWithCoder:(id)a3;
- (CloudDevice)initWithIDSDevice:(id)a3;
- (IDSDevice)idsDevice;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)stateString;
- (unint64_t)hash;
- (unint64_t)state;
- (void)setIsConnected:(BOOL)a3;
- (void)setState:(unint64_t)a3;
@end

@implementation CloudDevice

+ (CloudDevice)deviceWithIDSDevice:(id)a3
{
  id v3 = a3;
  v4 = [[CloudDevice alloc] initWithIDSDevice:v3];

  return v4;
}

- (CloudDevice)initWithIDSDevice:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CloudDevice;
  v6 = [(CloudDevice *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_idsDevice, a3);
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [v4 idsDevice];
    v6 = [v5 uniqueID];
    v7 = [(CloudDevice *)self idsDevice];
    v8 = [v7 uniqueID];
    unsigned __int8 v9 = [v6 isEqualToString:v8];
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  v2 = [(CloudDevice *)self idsDevice];
  id v3 = [v2 uniqueID];
  id v4 = [v3 hash];

  return (unint64_t)v4;
}

- (id)description
{
  v2 = [(CloudDevice *)self idsDevice];
  id v3 = [v2 cpDescription];

  return v3;
}

- (id)stateString
{
  unint64_t state = self->_state;
  if (state > 6) {
    return @"unknown";
  }
  else {
    return (id)*((void *)&off_100235A00 + state);
  }
}

- (CloudDevice)initWithCoder:(id)a3
{
  return 0;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = +[CloudDevice allocWithZone:a3];

  return [(CloudDevice *)v3 init];
}

- (IDSDevice)idsDevice
{
  return self->_idsDevice;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_unint64_t state = a3;
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (void).cxx_destruct
{
}

@end