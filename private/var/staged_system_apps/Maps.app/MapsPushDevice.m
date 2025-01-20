@interface MapsPushDevice
- (BOOL)isFake;
- (IDSDevice)device;
- (MapsPushDevice)initWithIDSDevice:(id)a3;
- (NSString)colorName;
- (NSString)enclosureColorName;
- (NSString)model;
- (NSString)name;
- (NSString)uniqueID;
@end

@implementation MapsPushDevice

- (MapsPushDevice)initWithIDSDevice:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MapsPushDevice;
  v6 = [(MapsPushDevice *)&v10 init];
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    objc_storeStrong((id *)&v6->_device, a3);
    v8 = v7;
  }

  return v8;
}

- (NSString)model
{
  return (NSString *)[(IDSDevice *)self->_device modelIdentifier];
}

- (NSString)uniqueID
{
  return (NSString *)[(IDSDevice *)self->_device uniqueID];
}

- (NSString)colorName
{
  return (NSString *)[(IDSDevice *)self->_device deviceColor];
}

- (NSString)enclosureColorName
{
  return (NSString *)[(IDSDevice *)self->_device enclosureColor];
}

- (NSString)name
{
  return (NSString *)[(IDSDevice *)self->_device name];
}

- (BOOL)isFake
{
  return 0;
}

- (IDSDevice)device
{
  return self->_device;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->pushToken, 0);

  objc_storeStrong((id *)&self->_device, 0);
}

@end