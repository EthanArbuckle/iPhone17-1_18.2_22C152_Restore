@interface STDeviceStateChangeContent
+ (BOOL)supportsSecureCoding;
+ (int64_t)contentType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceStateChangeContent:(id)a3;
- (NSString)description;
- (STDeviceStateChange)deviceStateChange;
- (STDeviceStateChangeContent)initWithCoder:(id)a3;
- (STDeviceStateChangeContent)initWithDeviceStateChange:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STDeviceStateChangeContent

- (STDeviceStateChangeContent)initWithDeviceStateChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STDeviceStateChangeContent;
  id v3 = a3;
  v4 = [(STDeviceStateChangeContent *)&v8 init];
  v5 = (STDeviceStateChange *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  deviceStateChange = v4->_deviceStateChange;
  v4->_deviceStateChange = v5;

  return v4;
}

+ (int64_t)contentType
{
  return 2;
}

- (NSString)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STDeviceStateChangeContent *)self deviceStateChange];
  v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<%@ { Device State Change: %@, Type: %ld }>", v3, v4, [(id)objc_opt_class() contentType]);

  return (NSString *)v5;
}

- (STDeviceStateChangeContent)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"deviceStateChange"];

  v6 = [(STDeviceStateChangeContent *)self initWithDeviceStateChange:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STDeviceStateChangeContent *)self deviceStateChange];
  [v4 encodeObject:v5 forKey:@"deviceStateChange"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  deviceStateChange = self->_deviceStateChange;
  return [v4 initWithDeviceStateChange:deviceStateChange];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDeviceStateChangeContent *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STDeviceStateChangeContent *)self isEqualToDeviceStateChangeContent:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDeviceStateChangeContent:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(STDeviceStateChangeContent *)self deviceStateChange];
  v6 = [v4 deviceStateChange];

  LOBYTE(v4) = [v5 isEqualToDeviceStateChange:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(STDeviceStateChangeContent *)self deviceStateChange];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (STDeviceStateChange)deviceStateChange
{
  return (STDeviceStateChange *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end