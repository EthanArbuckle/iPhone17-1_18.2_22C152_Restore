@interface AEAConcreteRestrictedNetworkToken
- (BOOL)releaseRestrictions;
- (void)dealloc;
@end

@implementation AEAConcreteRestrictedNetworkToken

- (void)dealloc
{
  [(AEAConcreteRestrictedNetworkToken *)self releaseRestrictions];
  v3.receiver = self;
  v3.super_class = (Class)AEAConcreteRestrictedNetworkToken;
  [(AEAConcreteRestrictedNetworkToken *)&v3 dealloc];
}

- (BOOL)releaseRestrictions
{
  if (!self || !self->_policySession) {
    goto LABEL_5;
  }
  unsigned int v3 = [(NEPolicySession *)self->_policySession removeAllPolicies];
  if (v3)
  {
    sub_100003EE8((uint64_t)self, 0);
LABEL_5:
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (void).cxx_destruct
{
}

@end