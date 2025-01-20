@interface SAMLLogoutResponseElement
- (BOOL)assertionMeetsConditions:(id *)a3;
- (id)assertions;
@end

@implementation SAMLLogoutResponseElement

- (id)assertions
{
  return 0;
}

- (BOOL)assertionMeetsConditions:(id *)a3
{
  return 1;
}

@end