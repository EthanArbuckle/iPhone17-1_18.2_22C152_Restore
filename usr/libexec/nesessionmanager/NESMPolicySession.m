@interface NESMPolicySession
- (NESMPolicySession)init;
- (void)dealloc;
@end

@implementation NESMPolicySession

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationExceptionPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleMulticastAppUUIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleAllowMulticastPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleSilentDenyMulticastPolicyIDs, 0);
  objc_storeStrong((id *)&self->_pathRuleDenyMulticastPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfaceTunnelPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfaceControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_interfaceDropControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_defaultDropPolicyIDsLow, 0);
  objc_storeStrong((id *)&self->_defaultDropExcludsionPolicyIDsLow, 0);
  objc_storeStrong((id *)&self->_dnsPolicyIDs, 0);
  objc_storeStrong((id *)&self->_NexusPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowSkipPolicyIDs, 0);
  objc_storeStrong((id *)&self->_skipPolicyIDs, 0);
  objc_storeStrong((id *)&self->_dropControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowOnDemandPolicyIDs, 0);
  objc_storeStrong((id *)&self->_onDemandPolicyIDs, 0);
  objc_storeStrong((id *)&self->_tunnelPolicyIDs, 0);
  objc_storeStrong((id *)&self->_lowControlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_controlPolicyIDs, 0);
  objc_storeStrong((id *)&self->_policyIDsLow, 0);
  objc_storeStrong((id *)&self->_policyIDs, 0);

  objc_storeStrong((id *)&self->_configUUID, 0);
}

- (void)dealloc
{
  sub_10002E7D4((uint64_t)self);
  sub_10002E854((uint64_t)self);
  sub_10002E8D4((uint64_t)self);
  sub_10002E954((uint64_t)self);
  sub_10002E9D4(self, v3);
  sub_10002EA70((uint64_t)self);
  sub_10002EAF0(self, v4);
  if (self)
  {
    sub_10002EC18((uint64_t)NESMPolicyMasterSession, &stru_1000C5B38);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id Property = objc_getProperty(self, v5, 176, 1);
  }
  else
  {
    id Property = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  id v7 = Property;
  id v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        sub_10002ECC4(self, v12);
        sub_10002ED98(self, v12);
        sub_10002EE6C(self, v12);
        sub_10002EF40((uint64_t)self, v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  v13.receiver = self;
  v13.super_class = (Class)NESMPolicySession;
  [(NESMPolicySession *)&v13 dealloc];
}

- (NESMPolicySession)init
{
}

@end