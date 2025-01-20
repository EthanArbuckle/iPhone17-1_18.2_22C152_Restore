@interface NACRunAssertion
- (NACRunAssertion)init;
@end

@implementation NACRunAssertion

- (NACRunAssertion)init
{
  v6.receiver = self;
  v6.super_class = (Class)NACRunAssertion;
  v2 = [(NACRunAssertion *)&v6 init];
  if (v2)
  {
    uint64_t v3 = os_transaction_create();
    transaction = v2->_transaction;
    v2->_transaction = (OS_os_transaction *)v3;
  }
  return v2;
}

- (void).cxx_destruct
{
}

@end