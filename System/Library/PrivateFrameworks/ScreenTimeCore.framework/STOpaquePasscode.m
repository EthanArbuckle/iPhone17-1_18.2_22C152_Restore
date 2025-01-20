@interface STOpaquePasscode
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToOpaquePasscode:(id)a3;
- (NSString)passcode;
- (STOpaquePasscode)initWithCoder:(id)a3;
- (STOpaquePasscode)initWithPasscode:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STOpaquePasscode

- (STOpaquePasscode)initWithPasscode:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)STOpaquePasscode;
  id v3 = a3;
  v4 = [(STOpaquePasscode *)&v8 init];
  uint64_t v5 = objc_msgSend(v3, "copy", v8.receiver, v8.super_class);

  passcode = v4->_passcode;
  v4->_passcode = (NSString *)v5;

  return v4;
}

- (STOpaquePasscode)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"passcode"];

  v6 = [(STOpaquePasscode *)self initWithPasscode:v5];
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = (void *)[(id)objc_opt_class() allocWithZone:a3];
  passcode = self->_passcode;
  return (id)[v4 initWithPasscode:passcode];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (STOpaquePasscode *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STOpaquePasscode *)self isEqualToOpaquePasscode:v4];
  }

  return v5;
}

- (BOOL)isEqualToOpaquePasscode:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = [a3 passcode];
  BOOL v5 = [(STOpaquePasscode *)self passcode];
  char v6 = [v4 isEqualToString:v5];

  return v6;
}

- (unint64_t)hash
{
  v2 = [(STOpaquePasscode *)self passcode];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (NSString)passcode
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end