@interface OTConfigurationContext(Framework)
- (id)escrowAuth;
- (void)setEscrowAuth:()Framework;
@end

@implementation OTConfigurationContext(Framework)

- (id)escrowAuth
{
  return objc_getAssociatedObject(a1, @"kOTEscrowAuthKey");
}

- (void)setEscrowAuth:()Framework
{
}

@end