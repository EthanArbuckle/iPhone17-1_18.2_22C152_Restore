@interface PKIDSDestination
+ (id)destinationWithDeviceIdentifier:(id)a3 name:(id)a4;
- (NSString)deviceIdentifier;
- (NSString)name;
- (PKIDSDestination)initWithDeviceIdentifier:(id)a3 name:(id)a4;
- (id)description;
@end

@implementation PKIDSDestination

- (PKIDSDestination)initWithDeviceIdentifier:(id)a3 name:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PKIDSDestination;
  v8 = [(PKIDSDestination *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    deviceIdentifier = v8->_deviceIdentifier;
    v8->_deviceIdentifier = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    name = v8->_name;
    v8->_name = (NSString *)v11;
  }
  return v8;
}

+ (id)destinationWithDeviceIdentifier:(id)a3 name:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (void *)[objc_alloc((Class)objc_opt_class()) initWithDeviceIdentifier:v6 name:v5];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  objc_msgSend(v3, "stringWithFormat:", @"<%@ %p: name: %@; deviceIdentifier: %@>",
    v5,
    self,
    self->_name,
  id v6 = self->_deviceIdentifier);

  return v6;
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (NSString)name
{
  return self->_name;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end