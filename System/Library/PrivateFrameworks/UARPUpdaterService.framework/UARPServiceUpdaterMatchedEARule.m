@interface UARPServiceUpdaterMatchedEARule
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSString)accessorySerialNumber;
- (NSString)eaIdentifier;
- (UARPServiceUpdaterMatchedEARule)initWithCoder:(id)a3;
- (UARPServiceUpdaterMatchedEARule)initWithEAIdentifier:(id)a3 accessorySerialNumber:(id)a4;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UARPServiceUpdaterMatchedEARule

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UARPServiceUpdaterMatchedEARule)initWithEAIdentifier:(id)a3 accessorySerialNumber:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)UARPServiceUpdaterMatchedEARule;
  v6 = [(UARPServiceUpdaterMatchedEARule *)&v8 init];
  if (v6)
  {
    v6->_eaIdentifier = (NSString *)[a3 copy];
    v6->_accessorySerialNumber = (NSString *)[a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UARPServiceUpdaterMatchedEARule;
  [(UARPServiceUpdaterMatchedEARule *)&v3 dealloc];
}

- (UARPServiceUpdaterMatchedEARule)initWithCoder:(id)a3
{
  uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
  uint64_t v6 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"serialNumber"];
  return [(UARPServiceUpdaterMatchedEARule *)self initWithEAIdentifier:v5 accessorySerialNumber:v6];
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->_eaIdentifier forKey:@"identifier"];
  accessorySerialNumber = self->_accessorySerialNumber;
  [a3 encodeObject:accessorySerialNumber forKey:@"serialNumber"];
}

- (BOOL)isEqual:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (self == a3)
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      int v5 = [(NSString *)self->_eaIdentifier isEqual:*((void *)a3 + 1)];
      if (v5)
      {
        accessorySerialNumber = self->_accessorySerialNumber;
        uint64_t v7 = *((void *)a3 + 2);
        LOBYTE(v5) = [(NSString *)accessorySerialNumber isEqual:v7];
      }
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (id)description
{
  objc_super v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  return (id)[v3 stringWithFormat:@"<%@: EAIdentifier=%@, acessorySerialNumber=%@", NSStringFromClass(v4), self->_eaIdentifier, self->_accessorySerialNumber];
}

- (NSString)eaIdentifier
{
  return self->_eaIdentifier;
}

- (NSString)accessorySerialNumber
{
  return self->_accessorySerialNumber;
}

@end