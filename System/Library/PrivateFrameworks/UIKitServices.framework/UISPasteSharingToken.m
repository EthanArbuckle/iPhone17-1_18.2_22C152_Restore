@interface UISPasteSharingToken
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (UISPasteSharingToken)init;
- (UISPasteSharingToken)initWithCoder:(id)a3;
- (UISPasteSharingToken)initWithTokenValue:(unint64_t)a3;
- (unint64_t)tokenValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation UISPasteSharingToken

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (UISPasteSharingToken)init
{
  uint64_t __buf = 0;
  arc4random_buf(&__buf, 8uLL);
  return [(UISPasteSharingToken *)self initWithTokenValue:__buf];
}

- (UISPasteSharingToken)initWithTokenValue:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)UISPasteSharingToken;
  result = [(UISPasteSharingToken *)&v5 init];
  if (result) {
    result->_tokenValue = a3;
  }
  return result;
}

- (UISPasteSharingToken)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeInt64ForKey:@"sharingTokenValue"];
  return [(UISPasteSharingToken *)self initWithTokenValue:v4];
}

- (void)encodeWithCoder:(id)a3
{
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (UISPasteSharingToken *)a3;
  if (v4 == self)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [(UISPasteSharingToken *)v4 tokenValue];
      BOOL v6 = v5 == [(UISPasteSharingToken *)self tokenValue];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)tokenValue
{
  return self->_tokenValue;
}

@end