@interface NRLink
- (BOOL)cancelWithReason:(id)a3;
- (BOOL)changeStateTo:(unsigned __int8)a3;
- (BOOL)changeStateTo:(unsigned __int8)a3 details:(id)a4;
- (BOOL)changeStateTo:(unsigned __int8)a3 detailsFormat:(id)a4;
- (BOOL)hasClassCPolicies;
- (BOOL)hasClassDPolicies;
- (BOOL)hasCompanionDatapath;
- (BOOL)hasRouteRulePolicy;
- (BOOL)ikeClassCEstablished;
- (BOOL)ikeClassDEstablished;
- (BOOL)isCompanionLink;
- (BOOL)isPrimary;
- (BOOL)noTransport;
- (BOOL)peerAvailabilityCheckInProgress;
- (BOOL)publishDNSConfig:(id)a3;
- (BOOL)resume;
- (BOOL)sendControlData:(id)a3;
- (BOOL)setInterfacePeerEgressFunctionalType:(unsigned int)a3;
- (BOOL)setInterfaceRank;
- (BOOL)setInterfaceSubfamily;
- (BOOL)setNoACKPrioritization;
- (BOOL)setupVirtualInterface;
- (BOOL)shouldCreateCompanionProxyAgent;
- (BOOL)start;
- (BOOL)startRequested;
- (BOOL)suspend;
- (BOOL)suspendWhenReady;
- (NEVirtualInterface_s)virtualInterface;
- (NRCompanionProxyAgent)companionProxyAgent;
- (NRLinkDelegate)linkDelegate;
- (NSMutableArray)appSvcPolicyIDs;
- (NSMutableArray)policyIDs;
- (NSString)description;
- (NSString)localInterfaceName;
- (NSString)localToken;
- (NSString)peerToken;
- (NSString)policyIdentifierString;
- (NSUUID)nrUUID;
- (NSUUID)proxyAgentUUID;
- (NWAddressEndpoint)localOuterEndpoint;
- (NWAddressEndpoint)remoteOuterEndpoint;
- (NWNetworkAgentRegistration)proxyAgentRegistration;
- (OS_dispatch_queue)queue;
- (OS_nw_proxy_config)publishedMasqueProxyConfig;
- (double)linkTotalReadyTimeInSec;
- (id)copyDescription;
- (id)copyDescriptionInner;
- (id)copyShortDescription;
- (id)copyShortDescriptionInner;
- (id)copyStatusString;
- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5;
- (unint64_t)identifier;
- (unsigned)ikev2Role;
- (unsigned)linkMTU;
- (unsigned)metric;
- (unsigned)state;
- (unsigned)subtype;
- (unsigned)type;
- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3;
- (void)checkProxyAgentWithForceUpdate:(BOOL)a3;
- (void)dealloc;
- (void)invalidateIKESession:(id *)a3;
- (void)invalidateIKESessionForClass:(unsigned __int8)a3;
- (void)invalidateLink;
- (void)invalidateVirtualInterface;
- (void)processIKEDisconnection:(unsigned __int8)a3 error:(id)a4;
- (void)removePolicies;
- (void)reportEvent:(unsigned int)a3;
- (void)reportEvent:(unsigned int)a3 details:(id)a4;
- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4;
- (void)setAppSvcPolicyIDs:(id)a3;
- (void)setHasClassCPolicies:(BOOL)a3;
- (void)setHasClassDPolicies:(BOOL)a3;
- (void)setHasRouteRulePolicy:(BOOL)a3;
- (void)setIdentifier:(unint64_t)a3;
- (void)setIkeClassCEstablished:(BOOL)a3;
- (void)setIkeClassDEstablished:(BOOL)a3;
- (void)setIkev2Role:(unsigned __int8)a3;
- (void)setInterfaceAvailability;
- (void)setIsCompanionLink:(BOOL)a3;
- (void)setIsPrimary:(BOOL)a3;
- (void)setLinkDelegate:(id)a3;
- (void)setLinkMTU:(unsigned __int16)a3;
- (void)setLocalInterfaceName:(id)a3;
- (void)setLocalOuterEndpoint:(id)a3;
- (void)setLocalToken:(id)a3;
- (void)setNoTransport:(BOOL)a3;
- (void)setNrUUID:(id)a3;
- (void)setPeerToken:(id)a3;
- (void)setPolicyIDs:(id)a3;
- (void)setPolicyIdentifierString:(id)a3;
- (void)setPowerAssertionState:(BOOL)a3;
- (void)setProxyAgentRegistration:(id)a3;
- (void)setPublishedMasqueProxyConfig:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRemoteOuterEndpoint:(id)a3;
- (void)setStartRequested:(BOOL)a3;
- (void)setState:(unsigned __int8)a3;
- (void)setSubtype:(unsigned __int8)a3;
- (void)setSuspendWhenReady:(BOOL)a3;
- (void)setType:(unsigned __int8)a3;
- (void)setVirtualInterface:(NEVirtualInterface_s *)a3;
- (void)unregisterProxyAgent;
- (void)updateIKEv2Role:(BOOL *)a3;
@end

@implementation NRLink

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usedProxyNotifyPayload, 0);
  objc_storeStrong((id *)&self->_policyIdentifierString, 0);
  objc_storeStrong((id *)&self->_appSvcPolicyIDs, 0);
  objc_storeStrong((id *)&self->_policyIDs, 0);
  objc_storeStrong((id *)&self->_publishedMasqueProxyConfig, 0);
  objc_storeStrong((id *)&self->_proxyAgentRegistration, 0);
  objc_storeStrong((id *)&self->_localToken, 0);
  objc_storeStrong((id *)&self->_peerToken, 0);
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_companionProxyAgent, 0);
  objc_storeStrong((id *)&self->_remoteOuterEndpoint, 0);
  objc_storeStrong((id *)&self->_localOuterEndpoint, 0);
  objc_destroyWeak((id *)&self->_linkDelegate);
  objc_storeStrong((id *)&self->_localInterfaceName, 0);
  objc_storeStrong((id *)&self->_nrUUID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (NSUUID)proxyAgentUUID
{
  return self->_proxyAgentUUID;
}

- (NRCompanionProxyAgent)companionProxyAgent
{
  return self->_companionProxyAgent;
}

- (NRLinkDelegate)linkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_linkDelegate);

  return (NRLinkDelegate *)WeakRetained;
}

- (NSUUID)nrUUID
{
  return self->_nrUUID;
}

- (unsigned)linkMTU
{
  return self->_linkMTU;
}

- (BOOL)startRequested
{
  return self->_startRequested;
}

- (void)setPolicyIdentifierString:(id)a3
{
}

- (NSString)policyIdentifierString
{
  return self->_policyIdentifierString;
}

- (void)setAppSvcPolicyIDs:(id)a3
{
}

- (NSMutableArray)appSvcPolicyIDs
{
  return self->_appSvcPolicyIDs;
}

- (void)setPolicyIDs:(id)a3
{
}

- (NSMutableArray)policyIDs
{
  return self->_policyIDs;
}

- (NEVirtualInterface_s)virtualInterface
{
  return self->_virtualInterface;
}

- (void)setPublishedMasqueProxyConfig:(id)a3
{
}

- (OS_nw_proxy_config)publishedMasqueProxyConfig
{
  return self->_publishedMasqueProxyConfig;
}

- (void)setProxyAgentRegistration:(id)a3
{
}

- (NWNetworkAgentRegistration)proxyAgentRegistration
{
  return self->_proxyAgentRegistration;
}

- (void)setHasClassDPolicies:(BOOL)a3
{
  self->_hasClassDPolicies = a3;
}

- (BOOL)hasClassDPolicies
{
  return self->_hasClassDPolicies;
}

- (void)setHasClassCPolicies:(BOOL)a3
{
  self->_hasClassCPolicies = a3;
}

- (BOOL)hasClassCPolicies
{
  return self->_hasClassCPolicies;
}

- (void)setHasRouteRulePolicy:(BOOL)a3
{
  self->_hasRouteRulePolicy = a3;
}

- (BOOL)hasRouteRulePolicy
{
  return self->_hasRouteRulePolicy;
}

- (void)setSuspendWhenReady:(BOOL)a3
{
  self->_suspendWhenReady = a3;
}

- (BOOL)suspendWhenReady
{
  return self->_suspendWhenReady;
}

- (BOOL)isPrimary
{
  return self->_isPrimary;
}

- (void)setNoTransport:(BOOL)a3
{
  self->_noTransport = a3;
}

- (BOOL)noTransport
{
  return self->_noTransport;
}

- (NWAddressEndpoint)remoteOuterEndpoint
{
  return self->_remoteOuterEndpoint;
}

- (NWAddressEndpoint)localOuterEndpoint
{
  return self->_localOuterEndpoint;
}

- (NSString)localInterfaceName
{
  return self->_localInterfaceName;
}

- (BOOL)hasCompanionDatapath
{
  return self->_hasCompanionDatapath;
}

- (unsigned)ikev2Role
{
  return self->_ikev2Role;
}

- (void)setLocalToken:(id)a3
{
}

- (NSString)localToken
{
  return self->_localToken;
}

- (void)setPeerToken:(id)a3
{
}

- (NSString)peerToken
{
  return self->_peerToken;
}

- (BOOL)isCompanionLink
{
  return self->_isCompanionLink;
}

- (BOOL)peerAvailabilityCheckInProgress
{
  return self->_peerAvailabilityCheckInProgress;
}

- (double)linkTotalReadyTimeInSec
{
  return self->_linkTotalReadyTimeInSec;
}

- (BOOL)ikeClassDEstablished
{
  return self->_ikeClassDEstablished;
}

- (BOOL)ikeClassCEstablished
{
  return self->_ikeClassCEstablished;
}

- (unint64_t)identifier
{
  return self->_identifier;
}

- (unsigned)subtype
{
  return self->_subtype;
}

- (unsigned)type
{
  return self->_type;
}

- (unsigned)state
{
  return self->_state;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)removePolicies
{
  policyIDs = self->_policyIDs;
  if (!policyIDs || ![(NSMutableArray *)policyIDs count])
  {
    v17 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return;
    }
LABEL_21:
    id v37 = (id)_NRCopyLogObjectForNRUUID();
    id v19 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    return;
  }
  if (!self->_policyIdentifierString)
  {
    v28 = (void *)_NRCopyLogObjectForNRUUID();
    int v29 = _NRLogIsLevelEnabled();

    if (!v29) {
      return;
    }
    goto LABEL_21;
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  v4 = self->_policyIDs;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v9, "unsignedIntegerValue", v30, v31, v32, v33, v35, policyIdentifierString))
        {
          self;
          if (qword_1001F4D28 != -1) {
            dispatch_once(&qword_1001F4D28, &stru_1001C8658);
          }
          id v10 = (id)qword_1001F4D20;
          sub_100134E2C((uint64_t)v10, self->_policyIdentifierString, v9);
          goto LABEL_12;
        }
        v11 = (void *)_NRCopyLogObjectForNRUUID();
        int v12 = _NRLogIsLevelEnabled();

        if (v12)
        {
          v13 = (void *)_NRCopyLogObjectForNRUUID();
          id v14 = [(NRLink *)self copyDescription];
          v35 = v9;
          policyIdentifierString = self->_policyIdentifierString;
          uint64_t v32 = 798;
          id v33 = v14;
          v30 = "";
          v31 = "-[NRLink removePolicies]";
          _NRLogWithArgs();
        }
        v15 = (void *)_NRCopyLogObjectForNRUUID();
        int v16 = _NRLogIsLevelEnabled();

        if (v16)
        {
          id v10 = (id)_NRCopyLogObjectForNRUUID();
          v30 = [(NRLink *)self copyDescription];
          v31 = (const char *)v9;
          _NRLogWithArgs();

LABEL_12:
          continue;
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v6);
  }

  self;
  if (qword_1001F4D28 != -1) {
    dispatch_once(&qword_1001F4D28, &stru_1001C8658);
  }
  id v20 = (id)qword_1001F4D20;
  v21 = (id *)v20;
  if (v20)
  {
    dispatch_assert_queue_V2(*((dispatch_queue_t *)v20 + 1));
    if (([v21[2] apply] & 1) == 0) {
      sub_100115AB0(@"NRPolicySessionManager", @"ApplyPolicy Failed", 0, 1, @"Failed to apply policies", v22, v23, v24, (uint64_t)v30);
    }
  }

  [(NSMutableArray *)self->_policyIDs removeAllObjects];
  *(_WORD *)&self->_hasRouteRulePolicy = 0;
  self->_hasClassDPolicies = 0;
  v25 = (void *)_NRCopyLogObjectForNRUUID();
  int v26 = _NRLogIsLevelEnabled();

  if (v26)
  {
    v27 = (void *)_NRCopyLogObjectForNRUUID();
    id v34 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
}

- (void)updateIKEv2Role:(BOOL *)a3
{
  v25 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
  [(NRLink *)self setIkev2Role:sub_100118D5C(v25)];
  unsigned int v5 = [(NRLink *)self ikev2Role];
  unsigned int v6 = [(NRLink *)self ikev2Role];
  BOOL v7 = v6 == 1;
  if (v5 != 2 && v6 != 1)
  {
    uint64_t v8 = [(NRLink *)self peerToken];
    if (v8
      && (v9 = (void *)v8,
          [(NRLink *)self localToken],
          id v10 = objc_claimAutoreleasedReturnValue(),
          v10,
          v9,
          v10))
    {
      v11 = [(NRLink *)self localToken];
      id v12 = [(NRLink *)self peerToken];
    }
    else
    {
      if (v25) {
        v13 = (void *)v25[6];
      }
      else {
        v13 = 0;
      }
      id v14 = v13;

      if (!v14)
      {
        id v20 = [(NRLink *)self nrUUID];
        v21 = (void *)_NRCopyLogObjectForNRUUID();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          uint64_t v23 = [(NRLink *)self nrUUID];
          uint64_t v24 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
        unsigned __int8 v19 = 1;
        BOOL v7 = 1;
        goto LABEL_20;
      }
      self;
      if (qword_1001F4A20 != -1) {
        dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
      }
      v15 = (id)qword_1001F4A18;
      v11 = sub_1000B92A4(v15, 0);

      if (v25) {
        int v16 = (void *)v25[6];
      }
      else {
        int v16 = 0;
      }
      id v12 = v16;
    }
    v17 = v12;
    id v18 = [v11 compare:v12];

    BOOL v7 = v18 == (id)-1;
    if (v18 == (id)-1) {
      unsigned __int8 v19 = 1;
    }
    else {
      unsigned __int8 v19 = 2;
    }
LABEL_20:
    [(NRLink *)self setIkev2Role:v19];
  }
  if (a3) {
    *a3 = v7;
  }
}

- (BOOL)publishDNSConfig:(id)a3
{
  id v4 = a3;
  if ([(NRLink *)self virtualInterface] && [(NRLink *)self state] == 8)
  {
    [(NRLink *)self virtualInterface];
    if (v4)
    {
      unsigned int v5 = [v4 hostname];
      v9 = v5;
      +[NSArray arrayWithObjects:&v9 count:1];
      NEVirtualInterfaceSetDNSServers();

      [(NRLink *)self virtualInterface];
      unsigned int v6 = [v4 port];
      [v6 intValue];
      NEVirtualInterfaceSetDNSPort();
    }
    else
    {
      NEVirtualInterfaceSetDNSServers();
      [(NRLink *)self virtualInterface];
      NEVirtualInterfaceSetDNSPort();
    }
    [(NRLink *)self virtualInterface];
    NEVirtualInterfaceUpdateAdHocService();
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)checkPeerAvailabilityWithForceAggressive:(BOOL)a3
{
  id v4 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v7 = (id)_NRCopyLogObjectForNRUUID();
    id v6 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
}

- (void)setPowerAssertionState:(BOOL)a3
{
  if (a3)
  {
    if (!self || !self->_powerAssertion)
    {
      id v4 = objc_alloc((Class)NSString);
      unsigned int v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      AssertionName = (__CFString *)[v4 initWithFormat:@"%@:[%llu]", v6, -[NRLink identifier](self, "identifier")];

      id v7 = (const char *)IOPMAssertionCreateWithName(@"NoIdleSleepAssertion", 0xFFu, AssertionName, &self->_powerAssertion);
      uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
      if (v7)
      {
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          id v10 = (void *)_NRCopyLogObjectForNRUUID();
          id v20 = [(NRLink *)self copyDescription];
          uint64_t v23 = v7;
          _NRLogWithArgs();
        }
        [(NRLink *)self reportEvent:3301, @"Error: %d", v7, v23 detailsFormat];
        self->_IOPMAssertionID powerAssertion = 0;
      }
      else
      {
        int v18 = _NRLogIsLevelEnabled();

        if (v18)
        {
          unsigned __int8 v19 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v24 = 697;
          id v25 = [(NRLink *)self copyDescription];
          uint64_t v23 = "-[NRLink setPowerAssertionState:]";
          _NRLogWithArgs();
        }
        [(NRLink *)self reportEvent:3300, @"id: %u", self->_powerAssertion, v23, v24, v25 detailsFormat];
      }
    }
  }
  else if (self)
  {
    IOPMAssertionID powerAssertion = self->_powerAssertion;
    if (powerAssertion)
    {
      id v12 = (const char *)IOPMAssertionRelease(powerAssertion);
      v13 = (void *)_NRCopyLogObjectForNRUUID();
      if (v12)
      {
        int v14 = _NRLogIsLevelEnabled();

        if (v14)
        {
          v15 = (void *)_NRCopyLogObjectForNRUUID();
          id v21 = [(NRLink *)self copyDescription];
          uint64_t v22 = v12;
          _NRLogWithArgs();
        }
        [(NRLink *)self reportEvent:3303, @"Error: %d", v12, v22, v24, v25 detailsFormat];
      }
      else
      {
        int v16 = _NRLogIsLevelEnabled();

        if (v16)
        {
          v17 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v24 = 710;
          id v25 = [(NRLink *)self copyDescription];
          uint64_t v22 = "-[NRLink setPowerAssertionState:]";
          _NRLogWithArgs();
        }
        [(NRLink *)self reportEvent:3302, @"id: %u", self->_powerAssertion, v22, v24, v25 detailsFormat];
      }
      self->_IOPMAssertionID powerAssertion = 0;
    }
  }
}

- (BOOL)setNoACKPrioritization
{
  if ([(NRLink *)self virtualInterface])
  {
    [(NRLink *)self virtualInterface];
    v3 = (void *)NEVirtualInterfaceCopyName();
    char v4 = sub_1001150F8(v3);
  }
  else
  {
    unsigned int v5 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return 0;
    }
    v3 = (void *)_NRCopyLogObjectForNRUUID();
    id v8 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    char v4 = 0;
  }

  return v4;
}

- (BOOL)setInterfacePeerEgressFunctionalType:(unsigned int)a3
{
  if (![(NRLink *)self virtualInterface])
  {
    id v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled) {
      goto LABEL_7;
    }
    return 0;
  }
  if (!a3)
  {
    v9 = (void *)_NRCopyLogObjectForNRUUID();
    int v10 = _NRLogIsLevelEnabled();

    if (v10)
    {
LABEL_7:
      unsigned int v5 = (void *)_NRCopyLogObjectForNRUUID();
      id v11 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();

      BOOL v6 = 0;
      goto LABEL_8;
    }
    return 0;
  }
  [(NRLink *)self virtualInterface];
  unsigned int v5 = (void *)NEVirtualInterfaceCopyName();
  BOOL v6 = sub_100114C80(v5, a3);
LABEL_8:

  return v6;
}

- (BOOL)setInterfaceSubfamily
{
  if ([(NRLink *)self virtualInterface])
  {
    [(NRLink *)self virtualInterface];
    v3 = (void *)NEVirtualInterfaceCopyName();
    unsigned int v4 = [(NRLink *)self type];
    if (v4 > 5) {
      int v5 = 2;
    }
    else {
      int v5 = dword_10016CA48[v4];
    }
    char v8 = sub_1001148A8(v3, v5);
  }
  else
  {
    BOOL v6 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return 0;
    }
    v3 = (void *)_NRCopyLogObjectForNRUUID();
    id v10 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    char v8 = 0;
  }

  return v8;
}

- (void)setInterfaceAvailability
{
  if ([(NRLink *)self virtualInterface])
  {
    [(NRLink *)self virtualInterface];
    id v6 = (id)NEVirtualInterfaceCopyName();
    sub_10011648C(v6);
  }
  else
  {
    v3 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return;
    }
    id v6 = (id)_NRCopyLogObjectForNRUUID();
    id v5 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
}

- (void)setIkeClassDEstablished:(BOOL)a3
{
  if (self->_ikeClassDEstablished != a3)
  {
    self->_ikeClassDEstablished = a3;
    if (a3) {
      uint64_t v4 = mach_absolute_time();
    }
    else {
      uint64_t v4 = 0;
    }
    self->_ikeClassDEstablishedTime = v4;
  }
}

- (void)setIkeClassCEstablished:(BOOL)a3
{
  if (self->_ikeClassCEstablished != a3)
  {
    self->_ikeClassCEstablished = a3;
    if (self->_isPrimary && a3)
    {
      unint64_t ikeClassDEstablishedTime = self->_ikeClassDEstablishedTime;
      uint64_t v6 = mach_absolute_time();
      if (ikeClassDEstablishedTime)
      {
        BOOL v9 = v6 >= ikeClassDEstablishedTime;
        unint64_t v10 = v6 - ikeClassDEstablishedTime;
        if (v10 != 0 && v9)
        {
          if (qword_1001F4BB8 != -1) {
            dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
          }
          LODWORD(v7) = dword_1001F4BC0;
          LODWORD(v8) = *(_DWORD *)algn_1001F4BC4;
          if ((double)v10 * (0.000000001 * (double)v7) / (double)v8 > 1.0)
          {
            id v11 = (void *)_NRCopyLogObjectForNRUUID();
            int IsLevelEnabled = _NRLogIsLevelEnabled();

            if (IsLevelEnabled)
            {
              v13 = (void *)_NRCopyLogObjectForNRUUID();
              id v20 = [(NRLink *)self copyDescription];
              _NRLogWithArgs();
            }
            self;
            if (qword_1001F4A20 != -1) {
              dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
            }
            id v21 = (id *)(id)qword_1001F4A18;
            int v14 = self->_nrUUID;
            if (!v21) {
              goto LABEL_21;
            }
            v15 = sub_10015BD9C();
            dispatch_assert_queue_V2(v15);

            if (v14)
            {
              int v16 = [v21[27] objectForKeyedSubscript:v14];

              if (!v16)
              {
LABEL_21:

                return;
              }
              v17 = [v21[27] objectForKeyedSubscript:v14];
              sub_1000EC228((uint64_t)v17);
            }
            else
            {
              id v18 = sub_1000AA13C();
              int v19 = _NRLogIsLevelEnabled();

              if (!v19) {
                goto LABEL_21;
              }
              v17 = sub_1000AA13C();
              _NRLogWithArgs();
            }

            goto LABEL_21;
          }
        }
      }
    }
  }
}

- (BOOL)shouldCreateCompanionProxyAgent
{
  v2 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
  if (!v2)
  {
    id v6 = sub_100118E90();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v8 = sub_100118E90();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v9 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v9 = 136446210;
    *(void *)(v9 + 4) = "-[NRLink shouldCreateCompanionProxyAgent]";
    sub_100118E90();
    _NRLogAbortWithPack();
  }
  v3 = v2;
  unsigned __int8 v4 = sub_100119B74(v2);

  return v4;
}

- (BOOL)setInterfaceRank
{
  if ([(NRLink *)self state] != 9)
  {
    unsigned __int8 v4 = [(NRLink *)self nrUUID];
    id v5 = (id *)sub_10013DC5C((uint64_t)NRDLocalDevice, v4);

    if (!v5)
    {
      id v17 = sub_100118E90();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v19 = sub_100118E90();
        _NRLogWithArgs();
      }
      _os_log_pack_size();
      __error();
      uint64_t v20 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v20 = 136446210;
      *(void *)(v20 + 4) = "-[NRLink setInterfaceRank]";
      sub_100118E90();
      _NRLogAbortWithPack();
    }
    id v6 = v5[16];

    if (v6)
    {
      id v7 = v5[16];
      unsigned int v8 = [v7 requiresReachability];

      unsigned int v9 = [(NRLink *)self isCompanionLink];
      unsigned int v10 = v9;
      if (v8)
      {
        [(NRLink *)self virtualInterface];
        if (!v10)
        {
          int v11 = NEVirtualInterfaceSetRankPrimaryEligible();
LABEL_15:
          int v3 = v11;

          return v3 != 0;
        }
LABEL_12:
        int v11 = NEVirtualInterfaceSetRankLast();
        goto LABEL_15;
      }
      if ((v9 & 1) == 0)
      {
        id v12 = v5[16];
        if ([v12 hasPoliciesForProxyCriteria])
        {
          id v13 = v5[16];
          int v14 = [v13 proxyProviderCriteria];
          unsigned int v15 = [v14 forwardNonMatchingTraffic];

          if (v15)
          {
            [(NRLink *)self virtualInterface];
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
    }
    [(NRLink *)self virtualInterface];
    int v11 = NEVirtualInterfaceSetRankNever();
    goto LABEL_15;
  }
  [(NRLink *)self virtualInterface];
  int v3 = NEVirtualInterfaceSetRankNever();
  return v3 != 0;
}

- (void)setIsCompanionLink:(BOOL)a3
{
  self->_isCompanionLink = a3;
}

- (void)processIKEDisconnection:(unsigned __int8)a3 error:(id)a4
{
  id v5 = a4;
  if (v5)
  {
    int state = self->_state;
    if (state == 8 || state == 9 && self->_type == 1)
    {
      uint64_t v7 = NEIKEv2ErrorDomain;
      id v15 = v5;
      BOOL v8 = [v5 code] == (id)3;
      unsigned int v9 = v15;
      if (!v8
        || ([v15 domain],
            unsigned int v10 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v11 = [v10 isEqualToString:v7],
            v10,
            unsigned int v9 = v15,
            (v11 & 1) == 0))
      {
        id String = v9;
        if ([String code] != (id)4)
        {
LABEL_11:

          id v5 = v15;
          goto LABEL_12;
        }
        id v13 = [String domain];
        unsigned int v14 = [v13 isEqualToString:v7];

        id v5 = v15;
        if (!v14) {
          goto LABEL_12;
        }
      }
      id String = (id)NRDataProtectionClassCreateString();
      [(NRLink *)self cancelWithReason:@"%@ session disconnected due to no response from peer", String];
      goto LABEL_11;
    }
  }
LABEL_12:
}

- (void)setIsPrimary:(BOOL)a3
{
  self->_isPrimary = a3;
}

- (void)dealloc
{
  int v3 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v5 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v8 = 482;
    id v9 = [(NRLink *)self copyDescription];
    id v6 = "";
    uint64_t v7 = "-[NRLink dealloc]";
    _NRLogWithArgs();
  }
  [(NRLink *)self invalidateLink];
  v10.receiver = self;
  v10.super_class = (Class)NRLink;
  [(NRLink *)&v10 dealloc];
}

- (void)setLinkMTU:(unsigned __int16)a3
{
  if (self->_linkMTU == a3 || !self->_virtualInterface) {
    return;
  }
  id v5 = (unsigned __int16 *)sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
  if (v5 && v5[14] >= 0xCu)
  {
    id v12 = v5;
    if (NEVirtualInterfaceSetMTU())
    {
      self->_linkMTU = a3;
      id v6 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      id v5 = v12;
      if (IsLevelEnabled) {
        goto LABEL_10;
      }
    }
    else
    {
      uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
      int v9 = _NRLogIsLevelEnabled();

      id v5 = v12;
      if (v9)
      {
LABEL_10:
        objc_super v10 = (void *)_NRCopyLogObjectForNRUUID();
        id v11 = [(NRLink *)self copyDescription];
        _NRLogWithArgs();

        id v5 = v12;
      }
    }
  }
}

- (BOOL)changeStateTo:(unsigned __int8)a3
{
  return [(NRLink *)self changeStateTo:a3 details:0];
}

- (BOOL)changeStateTo:(unsigned __int8)a3 detailsFormat:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v9];

  LOBYTE(v4) = [(NRLink *)self changeStateTo:v4 details:v7];
  return v4;
}

- (BOOL)changeStateTo:(unsigned __int8)a3 details:(id)a4
{
  unsigned int v4 = a3;
  id v6 = a4;
  id v7 = v6;
  switch(v4)
  {
    case 8u:
      uint64_t v8 = self;
      uint64_t v9 = 3004;
LABEL_7:
      [(NRLink *)v8 reportEvent:v9 details:v7];
      goto LABEL_8;
    case 0xFFu:
      uint64_t v8 = self;
      uint64_t v9 = 3005;
      goto LABEL_7;
    case 9u:
      uint64_t v8 = self;
      uint64_t v9 = 3002;
      goto LABEL_7;
  }
  if (v6 && [v6 length])
  {
    id v18 = sub_10011A480(v4);
    [(NRLink *)self reportEvent:3008, @"Changing state to %@ %@", v18, v7 detailsFormat];
  }
  else
  {
    id v18 = sub_10011A480(v4);
    [(NRLink *)self reportEvent:3008, @"Changing state to %@", v18, v20 detailsFormat];
  }

LABEL_8:
  int state = self->_state;
  if (state != v4)
  {
    if (state == 8)
    {
      unint64_t linkReadyStartTime = self->_linkReadyStartTime;
      uint64_t v12 = mach_absolute_time();
      double v15 = 0.0;
      if (linkReadyStartTime)
      {
        unint64_t v16 = v12 - linkReadyStartTime;
        if (v12 > linkReadyStartTime)
        {
          if (qword_1001F4BB8 != -1)
          {
            unint64_t v19 = v12 - linkReadyStartTime;
            dispatch_once(&qword_1001F4BB8, &stru_1001C7CB8);
            unint64_t v16 = v19;
          }
          LODWORD(v13) = dword_1001F4BC0;
          LODWORD(v14) = *(_DWORD *)algn_1001F4BC4;
          double v15 = (double)v16 * (0.000000001 * (double)v13) / (double)v14;
        }
      }
      self->_linkTotalReadyTimeInSec = self->_linkTotalReadyTimeInSec + v15;
    }
    if (v4 == 8)
    {
      self->_unint64_t linkReadyStartTime = mach_absolute_time();
      [(NRLink *)self setLinkMTU:1400];
    }
    else if (v4 == 255 || v4 == 9)
    {
      [(NRLink *)self removePolicies];
      if (v4 == 255 && state == 8 && [(NRLink *)self virtualInterface]) {
        [(NRLink *)self setInterfaceAvailability];
      }
    }
    self->_int state = v4;
  }

  return state != v4;
}

- (void)reportEvent:(unsigned int)a3
{
}

- (void)reportEvent:(unsigned int)a3 detailsFormat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [objc_alloc((Class)NSString) initWithFormat:v6 arguments:&v8];

  [(NRLink *)self reportEvent:v4 details:v7];
}

- (void)reportEvent:(unsigned int)a3 details:(id)a4
{
  id v6 = a4;
  id v8 = [(NRLink *)self nrUUID];
  id v7 = [(NRLink *)self copyShortDescription];
  sub_10012F648(v8, a3, v7, v6);
}

- (BOOL)sendControlData:(id)a3
{
  return 0;
}

- (BOOL)cancelWithReason:(id)a3
{
  return 1;
}

- (id)copyStatusString
{
  return (id)objc_claimAutoreleasedReturnValue();
}

- (unsigned)metric
{
  return -1;
}

- (BOOL)resume
{
  if (self->_ikeClassDEstablished || self->_ikeClassCEstablished) {
    return 1;
  }
  uint64_t v4 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    id v7 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();
  }
  return 0;
}

- (BOOL)suspend
{
  return 1;
}

- (BOOL)start
{
  return 1;
}

- (id)copyShortDescription
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NRLink *)self copyShortDescriptionInner];
  id v5 = [v3 initWithFormat:@"[%@]", v4];

  return v5;
}

- (id)copyShortDescriptionInner
{
  id v3 = objc_alloc((Class)NSString);
  unint64_t identifier = self->_identifier;
  unsigned int v5 = [(NRLink *)self isPrimary];
  ShortStringFromNRLinkType = (void *)createShortStringFromNRLinkType();
  unsigned int state = self->_state;
  if (state == 8) {
    id v8 = @"Rdy";
  }
  else {
    id v8 = (__CFString *)sub_10011A480(state);
  }
  uint64_t v9 = "";
  if (v5) {
    uint64_t v9 = " P";
  }
  id v10 = [v3 initWithFormat:@"%llu%s %@ %@", identifier, v9, ShortStringFromNRLinkType, v8];

  return v10;
}

- (NSString)description
{
  id v2 = [(NRLink *)self copyDescription];

  return (NSString *)v2;
}

- (id)copyDescription
{
  id v3 = objc_alloc((Class)NSString);
  id v4 = [(NRLink *)self copyDescriptionInner];
  id v5 = [v3 initWithFormat:@"[%@]", v4];

  return v5;
}

- (id)copyDescriptionInner
{
  id v3 = objc_alloc_init((Class)NSMutableString);
  [v3 appendFormat:@"%llu", -[NRLink identifier](self, "identifier")];
  if ([(NRLink *)self isPrimary]) {
    [v3 appendString:@", PRIMARY"];
  }
  [(NRLink *)self type];
  StringFromNRLinkType = (void *)createStringFromNRLinkType();
  [v3 appendFormat:@", %@", StringFromNRLinkType];

  if ([(NRLink *)self subtype])
  {
    [(NRLink *)self subtype];
    ShortStringFromNRLinkSubtype = (void *)createShortStringFromNRLinkSubtype();
    [v3 appendFormat:@"(%@)", ShortStringFromNRLinkSubtype];
  }
  id v6 = sub_10011A480([(NRLink *)self state]);
  [v3 appendFormat:@", %@", v6];

  if ([(NRLink *)self virtualInterface])
  {
    [(NRLink *)self virtualInterface];
    id v7 = (void *)NEVirtualInterfaceCopyName();
    [v3 appendFormat:@", %@", v7];
  }
  return v3;
}

- (id)initLinkWithQueue:(id)a3 linkDelegate:(id)a4 nrUUID:(id)a5
{
  uint64_t v9 = a3;
  id v10 = (char *)a4;
  id v11 = (char *)a5;
  if (!v9)
  {
    id v19 = sub_100118E90();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  dispatch_assert_queue_V2(v9);
  if (!v10)
  {
    id v21 = sub_100118E90();
    int v22 = _NRLogIsLevelEnabled();

    if (v22) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if (!v11)
  {
    id v23 = sub_100118E90();
    int v24 = _NRLogIsLevelEnabled();

    if (v24) {
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  if ((_NRIsUUIDNonZero() & 1) == 0)
  {
    id v25 = sub_100118E90();
    int v26 = _NRLogIsLevelEnabled();

    if (v26)
    {
LABEL_17:
      id v27 = sub_100118E90();
      _NRLogWithArgs();

      id v17 = 0;
      goto LABEL_9;
    }
LABEL_18:
    id v17 = 0;
    goto LABEL_9;
  }
  v33.receiver = self;
  v33.super_class = (Class)NRLink;
  uint64_t v12 = [(NRLink *)&v33 init];
  if (!v12)
  {
    id v28 = sub_100118E90();
    int v29 = _NRLogIsLevelEnabled();

    id v11 = "-[NRLink initLinkWithQueue:linkDelegate:nrUUID:]";
    if (v29)
    {
      id v30 = sub_100118E90();
      _NRLogWithArgs();
    }
    uint64_t v9 = _os_log_pack_size();
    id v10 = (char *)&v32 - (((unint64_t)&v9[1].isa + 7) & 0xFFFFFFFFFFFFFFF0);
    __error();
    uint64_t v31 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v31 = 136446210;
    *(void *)(v31 + 4) = "-[NRLink initLinkWithQueue:linkDelegate:nrUUID:]";
    sub_100118E90();
    _NRLogAbortWithPack();
    goto LABEL_22;
  }
  self = v12;
  objc_storeStrong((id *)&v12->_queue, a3);
  objc_storeWeak((id *)&self->_linkDelegate, v10);
  objc_storeStrong((id *)&self->_nrUUID, a5);
  *(_WORD *)&self->_unsigned int state = 1;
  self->_subtype = 0;
  self->_linkMTU = 1500;
  unint64_t v13 = [(NRLink *)self nrUUID];
  a5 = sub_10013DC5C((uint64_t)NRDLocalDevice, v13);

  if (!a5)
  {
LABEL_22:
    unint64_t v14 = 0;
    goto LABEL_8;
  }
  unint64_t v14 = (void *)*((void *)a5 + 16);
LABEL_8:
  id v15 = v14;
  self->_hasCompanionDatapath = [v15 hasCompanionDatapath];

  id v16 = objc_alloc_init((Class)NSMutableArray);
  [(NRLink *)self setPolicyIDs:v16];

  self->_unint64_t identifier = atomic_fetch_add_explicit(&qword_1001F43E8, 1uLL, memory_order_relaxed);
  self = self;

  id v17 = self;
LABEL_9:

  return v17;
}

- (void)checkProxyAgentWithForceUpdate:(BOOL)a3
{
  id v5 = (id *)sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
  if (!v5)
  {
    id v27 = sub_100118E90();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v29 = sub_100118E90();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v30 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v30 = 136446210;
    *(void *)(v30 + 4) = "-[NRLink(NRLinkProtected) checkProxyAgentWithForceUpdate:]";
    sub_100118E90();
    _NRLogAbortWithPack();
  }
  id v6 = v5;
  if (a3) {
    goto LABEL_26;
  }
  id v7 = self->_usedProxyNotifyPayload;
  id v8 = (NSData *)v6[12];
  if (v7 == v8)
  {

    goto LABEL_20;
  }
  uint64_t v9 = v8;
  id v10 = self->_usedProxyNotifyPayload;
  id v11 = v6[12];
  unsigned __int8 v12 = [(NSData *)v10 isEqual:v11];

  if ((v12 & 1) == 0)
  {
LABEL_26:
    id v13 = v6[16];
    id v14 = [v13 proxyCapability];

    if (v14 == (id)2)
    {
      [(NRLink *)self unregisterProxyAgent];
      objc_storeStrong((id *)&self->_usedProxyNotifyPayload, v6[12]);
      if (self->_usedProxyNotifyPayload)
      {
        id v32 = 0;
        id v33 = 0;
        id v31 = 0;
        if ([(NRLink *)self virtualInterface])
        {
          [(NRLink *)self virtualInterface];
          uint64_t v15 = NEVirtualInterfaceCopyName();
        }
        else
        {
          if ([(NRLink *)self hasCompanionDatapath])
          {
            id v16 = 0;
LABEL_14:
            id v17 = self->_usedProxyNotifyPayload;
            id v18 = [(NRLink *)self description];
            char v19 = sub_10011B1F0(v6, v17, v16, &v32, &v33, &v31, v18);

            if (v19)
            {
              id v20 = v32;
              [(NRLink *)self setProxyAgentRegistration:v32];
              id v21 = v33;
              objc_storeStrong((id *)&self->_proxyAgentUUID, v33);
              [(NRLink *)self setPublishedMasqueProxyConfig:v31];
              if (v31)
              {
                id v22 = v6[16];
                unsigned __int8 v23 = [v22 hasPoliciesForProxyCriteria];

                if ((v23 & 1) == 0)
                {
                  int v24 = [(NRLink *)self policyIdentifierString];
                  id v25 = sub_10011C6B8(v21, v16, v24);

                  int v26 = [(NRLink *)self policyIDs];
                  [v26 addObjectsFromArray:v25];
                }
              }
            }
            else
            {
              [(NRLink *)self cancelWithReason:@"Failed to configure proxy agent"];
              id v20 = v32;
              id v21 = v33;
            }

            goto LABEL_20;
          }
          uint64_t v15 = [(NRLink *)self localInterfaceName];
        }
        id v16 = (void *)v15;
        goto LABEL_14;
      }
    }
  }
LABEL_20:
}

- (BOOL)setupVirtualInterface
{
  if ([(NRLink *)self virtualInterface]
    || ![(NRLink *)self hasCompanionDatapath])
  {
LABEL_44:
    [(NRLink *)self checkProxyAgentWithForceUpdate:1];
    return [(NRLink *)self state] != 255;
  }
  id v3 = [(NRLink *)self queue];
  [(NRLink *)self setVirtualInterface:sub_10011D5DC(v3)];

  if (![(NRLink *)self virtualInterface])
  {
    id v17 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      return 0;
    }
    id v5 = (void *)_NRCopyLogObjectForNRUUID();
    id v54 = [(NRLink *)self copyDescription];
    _NRLogWithArgs();

    goto LABEL_48;
  }
  if (![(NRLink *)self setInterfaceSubfamily])
  {
    char v19 = (void *)_NRCopyLogObjectForNRUUID();
    int v20 = _NRLogIsLevelEnabled();

    if (v20) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (![(NRLink *)self setNoACKPrioritization])
  {
    id v22 = (void *)_NRCopyLogObjectForNRUUID();
    int v23 = _NRLogIsLevelEnabled();

    if (v23) {
      goto LABEL_24;
    }
    goto LABEL_25;
  }
  if (![(NRLink *)self setInterfaceRank])
  {
    int v24 = (void *)_NRCopyLogObjectForNRUUID();
    int v25 = _NRLogIsLevelEnabled();

    if (v25)
    {
LABEL_24:
      int v26 = (void *)_NRCopyLogObjectForNRUUID();
      id v27 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
LABEL_25:
    [(NRLink *)self invalidateVirtualInterface];
    return 0;
  }
  id v4 = [(NRLink *)self nrUUID];
  id v5 = sub_10013DC5C((uint64_t)NRDLocalDevice, v4);

  if (!v5)
  {
    id v49 = sub_100118E90();
    int v50 = _NRLogIsLevelEnabled();

    if (v50)
    {
      id v51 = sub_100118E90();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v52 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v52 = 136446210;
    *(void *)(v52 + 4) = "-[NRLink(NRLinkProtected) setupVirtualInterface]";
    sub_100118E90();
    _NRLogAbortWithPack();
  }
  [(NRLink *)self virtualInterface];
  id v6 = (void *)sub_10014B46C(v5);
  int v7 = NEVirtualInterfaceAddAddress();

  if (v7)
  {
    [(NRLink *)self virtualInterface];
    id v8 = (void *)sub_10014B4D4(v5);
    int v9 = NEVirtualInterfaceAddAddress();

    if (v9)
    {
      [(NRLink *)self virtualInterface];
      id v10 = (void *)sub_10014B7F4(v5);
      int v11 = NEVirtualInterfaceAddAddress();

      if (v11)
      {
        [(NRLink *)self virtualInterface];
        if (NEVirtualInterfaceAddAddress())
        {
          [(NRLink *)self virtualInterface];
          unsigned __int8 v12 = (void *)sub_10014B53C(v5);
          int v13 = NEVirtualInterfaceAddIPv6Route();

          if (v13)
          {
            [(NRLink *)self virtualInterface];
            id v14 = (void *)sub_10014B5A4(v5);
            int v15 = NEVirtualInterfaceAddIPv6Route();

            if (v15)
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                [(NRLink *)self virtualInterface];
                id v16 = [(NRLink *)self localInterfaceName];
                NEVirtualInterfaceSetDelegateInterface();

                [(NRLink *)self virtualInterface];
                NEVirtualInterfaceSetRankNever();
              }
              else if ([(NRLink *)self type] == 5)
              {
                [(NRLink *)self virtualInterface];
                long long v40 = [(NRLink *)self localInterfaceName];
                NEVirtualInterfaceSetDelegateInterface();
              }
              [(NRLink *)self virtualInterface];
              if (NEVirtualInterfaceUpdateAdHocService())
              {
                [(NRLink *)self virtualInterface];
                long long v41 = (void *)NEVirtualInterfaceCopyName();
                v42 = (void *)_NRCopyLogObjectForNRUUID();
                int v43 = _NRLogIsLevelEnabled();

                if (v43)
                {
                  v44 = (void *)_NRCopyLogObjectForNRUUID();
                  id v53 = [(NRLink *)self copyDescription];
                  _NRLogWithArgs();
                }
                goto LABEL_44;
              }
              v45 = (void *)_NRCopyLogObjectForNRUUID();
              int v46 = _NRLogIsLevelEnabled();

              if (!v46) {
                goto LABEL_47;
              }
              goto LABEL_46;
            }
            long long v38 = (void *)_NRCopyLogObjectForNRUUID();
            int v39 = _NRLogIsLevelEnabled();

            if (v39)
            {
LABEL_46:
              v47 = (void *)_NRCopyLogObjectForNRUUID();
              id v48 = [(NRLink *)self copyDescription];
              _NRLogWithArgs();
            }
          }
          else
          {
            v36 = (void *)_NRCopyLogObjectForNRUUID();
            int v37 = _NRLogIsLevelEnabled();

            if (v37) {
              goto LABEL_46;
            }
          }
        }
        else
        {
          id v34 = (void *)_NRCopyLogObjectForNRUUID();
          int v35 = _NRLogIsLevelEnabled();

          if (v35) {
            goto LABEL_46;
          }
        }
      }
      else
      {
        id v32 = (void *)_NRCopyLogObjectForNRUUID();
        int v33 = _NRLogIsLevelEnabled();

        if (v33) {
          goto LABEL_46;
        }
      }
    }
    else
    {
      uint64_t v30 = (void *)_NRCopyLogObjectForNRUUID();
      int v31 = _NRLogIsLevelEnabled();

      if (v31) {
        goto LABEL_46;
      }
    }
  }
  else
  {
    id v28 = (void *)_NRCopyLogObjectForNRUUID();
    int v29 = _NRLogIsLevelEnabled();

    if (v29) {
      goto LABEL_46;
    }
  }
LABEL_47:
  [(NRLink *)self invalidateVirtualInterface];
LABEL_48:

  return 0;
}

- (void)unregisterProxyAgent
{
  id v3 = [(NRLink *)self proxyAgentRegistration];

  if (v3)
  {
    id v4 = [(NRLink *)self proxyAgentRegistration];
    [v4 unregisterNetworkAgent];

    [(NRLink *)self setProxyAgentRegistration:0];
  }
  id v5 = [(NRLink *)self publishedMasqueProxyConfig];

  if (v5)
  {
    id v6 = [(NRLink *)self publishedMasqueProxyConfig];
    nw_proxy_config_unpublish();

    [(NRLink *)self setPublishedMasqueProxyConfig:0];
  }
  proxyAgentUUID = self->_proxyAgentUUID;
  self->_proxyAgentUUID = 0;
}

- (void)invalidateIKESessionForClass:(unsigned __int8)a3
{
  if (a3 == 3)
  {
    [(NRLink *)self setIkeClassCEstablished:0];
  }
  else if (a3 == 4)
  {
    [(NRLink *)self setIkeClassDEstablished:0];
  }
}

- (void)invalidateIKESession:(id *)a3
{
  if (*a3)
  {
    id v5 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      int v7 = (void *)_NRCopyLogObjectForNRUUID();
      id v13 = [(NRLink *)self copyDescription];
      _NRLogWithArgs();
    }
    objc_initWeak(&location, *a3);
    id v8 = [(id)objc_opt_class() description];
    dispatch_time_t v9 = dispatch_time(0, 5000000000);
    id v10 = [(NRLink *)self queue];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10011DD8C;
    block[3] = &unk_1001C88B8;
    objc_copyWeak(&v16, &location);
    id v11 = v8;
    id v15 = v11;
    dispatch_after(v9, v10, block);

    [*a3 setStateUpdateBlock:0];
    [*a3 setChildStateUpdateBlock:0];
    [*a3 setConfigurationUpdateBlock:0];
    [*a3 setTrafficSelectorUpdateBlock:0];
    [*a3 setAdditionalAddressesUpdateBlock:0];
    [*a3 setShortDPDEventBlock:0];
    [*a3 setRedirectEventBlock:0];
    [*a3 setPrivateNotifyStatusEvent:0];
    [*a3 disconnect];
    [*a3 invalidate];
    id v12 = *a3;
    *a3 = 0;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

- (void)invalidateVirtualInterface
{
  if ([(NRLink *)self virtualInterface])
  {
    CFRelease([(NRLink *)self virtualInterface]);
    [(NRLink *)self setVirtualInterface:0];
  }
}

- (void)invalidateLink
{
  objc_storeWeak((id *)&self->_linkDelegate, 0);
  *(_WORD *)&self->_ikeClassCEstablished = 0;
  [(NRLink *)self unregisterProxyAgent];
  [(NRLink *)self setPowerAssertionState:0];
  self;
  if (qword_1001F47E8 != -1) {
    dispatch_once(&qword_1001F47E8, &stru_1001C5EF8);
  }
  id v3 = (id *)(id)qword_1001F47E0;
  id v4 = self;
  if (!v3) {
    goto LABEL_24;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3[3];
  id v6 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (!v6)
  {
    id v16 = v5;
    goto LABEL_23;
  }
  id v7 = v6;
  int v29 = v4;
  uint64_t v8 = *(void *)v35;
LABEL_7:
  uint64_t v9 = 0;
  while (1)
  {
    if (*(void *)v35 != v8) {
      objc_enumerationMutation(v5);
    }
    id v10 = *(void **)(*((void *)&v34 + 1) + 8 * v9);
    uint64_t v11 = [v3[3] objectForKeyedSubscript:v10, v29];
    id v12 = (void *)v11;
    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v13 = (uint64_t)v3;
    id v14 = *(id *)(v11 + 24);
    id v15 = [v14 identifier];
    if (v15 == (id)[(NRLink *)v29 identifier]) {
      break;
    }

    id v3 = (id *)v13;
LABEL_9:

    if (v7 == (id)++v9)
    {
      id v7 = [v5 countByEnumeratingWithState:&v34 objects:v38 count:16];
      if (v7) {
        goto LABEL_7;
      }
      id v16 = v5;
      id v4 = v29;
      goto LABEL_23;
    }
  }
  id v16 = v10;

  id v4 = v29;
  id v3 = (id *)v13;
  if (!v16) {
    goto LABEL_24;
  }
  [*(id *)(v13 + 24) setObject:0 forKeyedSubscript:v16];
  if (qword_1001F47F8 != -1) {
    dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
  }
  if (_NRLogIsLevelEnabled())
  {
    if (qword_1001F47F8 != -1) {
      dispatch_once(&qword_1001F47F8, &stru_1001C5F68);
    }
    _NRLogWithArgs();
  }
  sub_100010D64(v13);
LABEL_23:

LABEL_24:
  if ([(NRLink *)v4 virtualInterface])
  {
    [(NRLink *)v4 virtualInterface];
    uint64_t v17 = NEVirtualInterfaceCopyName();
    if (v17)
    {
      id v18 = (char *)v17;
      char v19 = &unk_1001F4000;
      if (qword_1001F4C90 == -1) {
        goto LABEL_27;
      }
    }
    else
    {
      id v25 = sub_100118E90();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v27 = sub_100118E90();
        _NRLogWithArgs();
      }
      char v19 = (void *)_os_log_pack_size();
      id v18 = (char *)&v30[-1] - ((__chkstk_darwin(v19) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      uint64_t v28 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v28 = 136446210;
      *(void *)(v28 + 4) = "-[NRLink(NRLinkProtected) invalidateLink]";
      sub_100118E90();
      _NRLogAbortWithPack();
    }
    dispatch_once(&qword_1001F4C90, &stru_1001C7F60);
LABEL_27:
    if (_NRLogIsLevelEnabled())
    {
      if (v19[402] != -1) {
        dispatch_once(&qword_1001F4C90, &stru_1001C7F60);
      }
      _NRLogWithArgs();
    }
    id v20 = sub_1001154D0(v18);
    if (v20)
    {
      id v21 = [(id)objc_opt_class() description];
      dispatch_time_t v22 = dispatch_time(0, 5000000000);
      int v23 = [(NRLink *)v4 queue];
      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_10011E3E0;
      v30[3] = &unk_1001C8868;
      int v31 = v18;
      id v32 = v20;
      id v33 = v21;
      id v24 = v21;
      dispatch_after(v22, v23, v30);
    }
  }
}

- (void)setIkev2Role:(unsigned __int8)a3
{
  self->_ikev2Role = a3;
}

- (void)setVirtualInterface:(NEVirtualInterface_s *)a3
{
  self->_virtualInterface = a3;
}

- (void)setLinkDelegate:(id)a3
{
}

- (void)setStartRequested:(BOOL)a3
{
  self->_startRequested = a3;
}

- (void)setNrUUID:(id)a3
{
}

- (void)setIdentifier:(unint64_t)a3
{
  self->_unint64_t identifier = a3;
}

- (void)setSubtype:(unsigned __int8)a3
{
  self->_subtype = a3;
}

- (void)setType:(unsigned __int8)a3
{
  self->_type = a3;
}

- (void)setState:(unsigned __int8)a3
{
  self->_unsigned int state = a3;
}

- (void)setQueue:(id)a3
{
}

- (void)setLocalInterfaceName:(id)a3
{
}

- (void)setRemoteOuterEndpoint:(id)a3
{
}

- (void)setLocalOuterEndpoint:(id)a3
{
}

@end