@interface STAuthenticationResult
+ (BOOL)supportsSecureCoding;
- (BOOL)authenticated;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToAuthenticationResult:(id)a3;
- (STAuthenticationResult)initWithCoder:(id)a3;
- (STAuthenticationResult)initWithResult:(BOOL)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation STAuthenticationResult

- (STAuthenticationResult)initWithResult:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)STAuthenticationResult;
  result = [(STAuthenticationResult *)&v5 init];
  result->_authenticated = a3;
  return result;
}

- (STAuthenticationResult)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeBoolForKey:@"authenticated"];
  return [(STAuthenticationResult *)self initWithResult:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (STAuthenticationResult *)a3;
  if (v4 == self)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0
      && [(STAuthenticationResult *)self isEqualToAuthenticationResult:v4];
  }

  return v5;
}

- (BOOL)isEqualToAuthenticationResult:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  char v4 = [a3 authenticated];
  return v4 ^ [(STAuthenticationResult *)self authenticated] ^ 1;
}

- (unint64_t)hash
{
  return [(STAuthenticationResult *)self authenticated];
}

- (BOOL)authenticated
{
  return self->_authenticated;
}

@end