@interface TVRMSRunAssertion
- (TVRMSRunAssertion)init;
- (void)dealloc;
@end

@implementation TVRMSRunAssertion

- (TVRMSRunAssertion)init
{
  v3.receiver = self;
  v3.super_class = (Class)TVRMSRunAssertion;
  return [(TVRMSRunAssertion *)&v3 init];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)TVRMSRunAssertion;
  [(TVRMSRunAssertion *)&v2 dealloc];
}

@end