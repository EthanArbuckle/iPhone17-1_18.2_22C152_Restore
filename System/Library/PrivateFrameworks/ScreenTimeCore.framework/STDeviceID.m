@interface STDeviceID
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToDeviceID:(id)a3;
- (NSString)identifier;
- (STDeviceID)initWithCoder:(id)a3;
- (STDeviceID)initWithIdentifier:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STDeviceID

- (STDeviceID)initWithIdentifier:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STDeviceID;
  id v3 = a3;
  v4 = [(STDeviceID *)&v8 init];
  v5 = (NSString *)objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  identifier = v4->_identifier;
  v4->_identifier = v5;

  return v4;
}

- (id)description
{
  uint64_t v3 = objc_opt_class();
  v4 = [(STDeviceID *)self identifier];
  v5 = +[NSString stringWithFormat:@"<%@ { Identifier: %@ }>", v3, v4];

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [(id)objc_opt_class() allocWithZone:a3];
  identifier = self->_identifier;
  return [v4 initWithIdentifier:identifier];
}

- (STDeviceID)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];

  v6 = [(STDeviceID *)self initWithIdentifier:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STDeviceID *)self identifier];
  [v4 encodeObject:v5 forKey:@"identifier"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STDeviceID *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      BOOL v5 = [(STDeviceID *)self isEqualToDeviceID:v4];
    }
    else {
      BOOL v5 = 0;
    }
  }

  return v5;
}

- (BOOL)isEqualToDeviceID:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  BOOL v5 = [(STDeviceID *)self identifier];
  v6 = [v4 identifier];

  LOBYTE(v4) = [v5 isEqualToString:v6];
  return (char)v4;
}

- (unint64_t)hash
{
  v2 = [(STDeviceID *)self identifier];
  id v3 = [v2 hash];

  return (unint64_t)v3;
}

- (NSString)identifier
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end