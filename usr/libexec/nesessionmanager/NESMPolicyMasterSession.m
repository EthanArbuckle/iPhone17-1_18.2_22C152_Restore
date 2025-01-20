@interface NESMPolicyMasterSession
- (NESMPolicyMasterSession)init;
@end

@implementation NESMPolicyMasterSession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionsWithLoopbackPolicies, 0);
  objc_storeStrong((id *)&self->_necpTrieIDs, 0);
  objc_storeStrong((id *)&self->_skipPrivacyProxyPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleFilterPolicyIDs, 0);
  objc_storeStrong((id *)&self->_policySessionLow, 0);

  objc_storeStrong((id *)&self->_policySession, 0);
}

- (NESMPolicyMasterSession)init
{
}

@end