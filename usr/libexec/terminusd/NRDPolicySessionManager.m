@interface NRDPolicySessionManager
@end

@implementation NRDPolicySessionManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installedPolicyIdentifiers, 0);
  objc_storeStrong((id *)&self->_policySession, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end