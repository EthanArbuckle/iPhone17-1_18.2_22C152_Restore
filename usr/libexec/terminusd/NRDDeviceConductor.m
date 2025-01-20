@interface NRDDeviceConductor
- (BOOL)preferWiFiP2PRequestUpdated;
- (BOOL)preferWiFiRequestAvailable;
- (BOOL)preferWiFiRequestUnavailable;
- (NSString)description;
- (void)apsIsConnected:(BOOL)a3;
- (void)deviceHasBTLinkUpgradeRequest:(BOOL)a3;
- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3;
- (void)deviceHasQuickRelayRequest:(id)a3 hasQuickRelayRequest:(BOOL)a4;
- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStartTrackingNOI:(id)a3;
- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4;
- (void)didStopTrackingAllNOIs:(id)a3;
- (void)didUpdateDNSProxyState:(id)a3 state:(unsigned __int8)a4;
- (void)directToCloudRequestAvailable;
- (void)directToCloudRequestUnavailable;
- (void)linkDidReceiveData:(id)a3 data:(id)a4;
- (void)linkIsAvailable:(id)a3;
- (void)linkIsReady:(id)a3;
- (void)linkIsSuspended:(id)a3;
- (void)linkIsUnavailable:(id)a3;
- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4;
- (void)localAWDLEndpointChanged:(id)a3;
- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4;
- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4;
- (void)processAppStateChanged:(id)a3;
- (void)reportBTLinkUpgradeClientAdded:(id)a3;
- (void)reportBTLinkUpgradeClientRemoved:(id)a3;
@end

@implementation NRDDeviceConductor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_availabilityAgentPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_availabilityAgentType, 0);
  objc_storeStrong((id *)&self->_availabilityAgent, 0);
  objc_storeStrong((id *)&self->_proxyUsageTokenToTokenAgent, 0);
  objc_storeStrong((id *)&self->_asNamesToResolvedEndpoints, 0);
  objc_storeStrong((id *)&self->_endpointServiceUUID, 0);
  objc_storeStrong((id *)&self->_asClient, 0);
  objc_storeStrong((id *)&self->_linkUpgradeReportWiFiInfra, 0);
  objc_storeStrong((id *)&self->_linkUpgradeReportForBTClassic, 0);
  objc_storeStrong((id *)&self->_currentALUAdviceID, 0);
  objc_storeStrong((id *)&self->_aluMonitor, 0);
  objc_storeStrong((id *)&self->_discoveryProxyClient, 0);
  objc_storeStrong((id *)&self->_discoveryProxyServer, 0);
  objc_storeStrong((id *)&self->_dnsProxyServer, 0);
  objc_storeStrong((id *)&self->_dnsProxyClient, 0);
  objc_storeStrong((id *)&self->_proxyConfigurationPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_companionLinkMonitorPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_lastReceivedNetInfoDataHash, 0);
  objc_storeStrong((id *)&self->_companionNWDescAgentDataHash, 0);
  objc_storeStrong((id *)&self->_companionNWDescAgent, 0);
  objc_storeStrong((id *)&self->_pathOverrideAgent, 0);
  objc_storeStrong((id *)&self->_netInfo, 0);
  objc_storeStrong((id *)&self->_masqueProxyConfig, 0);
  objc_storeStrong((id *)&self->_proxyAgentUUID, 0);
  objc_storeStrong((id *)&self->_proxyAgentRegistration, 0);
  objc_storeStrong((id *)&self->_usedProxyNotifyPayload, 0);
  objc_storeStrong((id *)&self->_companionProxyConfigAgent, 0);
  objc_storeStrong((id *)&self->_linkTypesForLinkUpgrade, 0);
  objc_storeStrong((id *)&self->_discoveredEndpoint, 0);
  objc_storeStrong((id *)&self->_discoveryClient, 0);
  objc_storeStrong((id *)&self->_lastActiveCompanionInterfaceName, 0);
  objc_storeStrong((id *)&self->_companionLinkViabilityAgent, 0);
  objc_storeStrong((id *)&self->_phoneCallRelayAnalytics, 0);
  objc_storeStrong((id *)&self->_preferWiFiAnalytics, 0);
  objc_storeStrong((id *)&self->_idsPathWatcherSource, 0);
  objc_storeStrong((id *)&self->_companionAgentRemovalPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_proxyCriteriaPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_flowDivertPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_companionNWDescPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_netInfoPolicyIdentifier, 0);
  objc_storeStrong((id *)&self->_policyIdentifier, 0);
  objc_storeStrong((id *)&self->_directToCloudAnalytics, 0);
  objc_storeStrong((id *)&self->_addedPermittedClientPolicyIDArray, 0);
  objc_storeStrong((id *)&self->_forcedWoWUUID, 0);
  objc_storeStrong((id *)&self->_symptomsNOIManager, 0);
  objc_storeStrong((id *)&self->_btLinkPreferencesAgent, 0);
  objc_storeStrong((id *)&self->_quickRelayAgent, 0);
  objc_storeStrong((id *)&self->_devicePreferencesManager, 0);
  objc_storeStrong((id *)&self->_deviceSetupInProgressConnections, 0);
  objc_storeStrong((id *)&self->_deviceMonitorConnections, 0);
  objc_storeStrong((id *)&self->_pendingNotifications, 0);
  objc_storeStrong((id *)&self->_xpcCommConnections, 0);
  objc_storeStrong((id *)&self->_lastSentWiFiSignature, 0);
  objc_storeStrong((id *)&self->_lastSentWiFiEndpoint, 0);
  objc_storeStrong((id *)&self->_primaryLink, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_availableLinks, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_nrUUID, 0);
}

- (void)didCompleteIncomingResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v10 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v10 && self->_asClient == v6)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    sub_1000D4E3C((uint64_t)self, v10);
  }
}

- (void)didStopResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v17 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v17 && self->_asClient == v6)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      uint64_t v15 = 8735;
      id v16 = v17;
      v13 = "";
      v14 = "-[NRDDeviceConductor didStopResolveRequestForASName:asClient:]";
      _NRLogWithArgs();
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_asNamesToResolvedEndpoints, "setObject:forKeyedSubscript:", 0, v17, v13, v14, v15, v16);
    asClient = self->_asClient;
    if (asClient) {
      asClient = (NRApplicationServiceClient *)asClient->_asNamesForResolving;
    }
    v11 = asClient;
    if ([(NRApplicationServiceClient *)v11 count])
    {
    }
    else
    {
      BOOL qrAssertedForResolve = self->_qrAssertedForResolve;

      if (qrAssertedForResolve)
      {
        self->_BOOL qrAssertedForResolve = 0;
        [(NRQuickRelayAgent *)self->_quickRelayAgent unassertAgentWithOptions:0];
      }
    }
  }
}

- (void)didStartResolveRequestForASName:(id)a3 asClient:(id)a4
{
  id v10 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v10 && self->_asClient == v6)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    sub_1000D53DC((uint64_t)self, 0, 1);
  }
}

- (void)didStopBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v13 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v13 && self->_asClient == v6)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    asClient = self->_asClient;
    if (asClient) {
      asClient = (NRApplicationServiceClient *)asClient->_asNamesForBrowsing;
    }
    v11 = asClient;
    if ([(NRApplicationServiceClient *)v11 count])
    {
    }
    else
    {
      BOOL qrAssertedForBrowse = self->_qrAssertedForBrowse;

      if (qrAssertedForBrowse)
      {
        self->_BOOL qrAssertedForBrowse = 0;
        [(NRQuickRelayAgent *)self->_quickRelayAgent unassertAgentWithOptions:0];
      }
    }
  }
}

- (void)didStartBrowseRequestForASName:(id)a3 asClient:(id)a4
{
  id v10 = a3;
  v6 = (NRApplicationServiceClient *)a4;
  if (self && self->_isEnabled && v10 && self->_asClient == v6)
  {
    v7 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      v9 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    sub_1000D53DC((uint64_t)self, 1, 0);
  }
}

- (void)localAWDLEndpointChanged:(id)a3
{
  if (self && self->_isEnabled && self->_supportsAWDL)
  {
    sub_1000D63BC((uint64_t)self);
    sub_1000D6614(self);
  }
}

- (void)directToCloudRequestUnavailable
{
  if (!self || !self->_allowsDirectToCloud) {
    return;
  }
  uint64_t v3 = mach_absolute_time();
  directToCloudAnalytics = self->_directToCloudAnalytics;
  if (!directToCloudAnalytics
    || (directToCloudAnalytics->_directToCloudRequestEnd = v3, (v5 = self->_directToCloudAnalytics) == 0))
  {
    self->_directToCloudRequestEndTime = 0;
    v6 = 0;
    goto LABEL_12;
  }
  self->_directToCloudRequestEndTime = v5->_directToCloudRequestEnd;
  v6 = v5;
  if (!v6->_iRATManagerQueryStart)
  {
LABEL_12:

    goto LABEL_13;
  }
  v7 = self->_directToCloudAnalytics;
  if (!v7)
  {

    v9 = self->_directToCloudAnalytics;
    if (!v9) {
      goto LABEL_13;
    }
    goto LABEL_9;
  }
  unint64_t iRATManagerQueryEnd = v7->_iRATManagerQueryEnd;

  if (!iRATManagerQueryEnd)
  {
    v9 = self->_directToCloudAnalytics;
    if (v9) {
LABEL_9:
    }
      v9->_iRATManagerQueryIncomplete = 1;
  }
LABEL_13:
  [(NRAnalyticsDirectToCloud *)self->_directToCloudAnalytics submit];
  id v10 = self->_directToCloudAnalytics;
  self->_directToCloudAnalytics = 0;
}

- (void)directToCloudRequestAvailable
{
  if (self && self->_allowsDirectToCloud)
  {
    v2 = [(NRLink *)self->_primaryLink companionProxyAgent];
  }
}

- (BOOL)preferWiFiRequestUnavailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_preferWiFiRequestInFlight = 0;
  if (_NRIsAppleInternal())
  {
    if (self->_disablePreferWiFi)
    {
      uint64_t v3 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      BOOL result = 0;
      if (!IsLevelEnabled) {
        return result;
      }
LABEL_10:
      id v10 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();

      return 0;
    }
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    v6 = (unsigned __int8 *)(id)qword_1001F4A18;
    if (v6)
    {
      int v7 = v6[8];

      if (v7)
      {
        v8 = (void *)_NRCopyLogObjectForNRUUID();
        int v9 = _NRLogIsLevelEnabled();

        BOOL result = 0;
        if (!v9) {
          return result;
        }
        goto LABEL_10;
      }
    }
  }
  if (self->_hasPhoneCallRelayRequest)
  {
    v11 = (void *)_NRCopyLogObjectForNRUUID();
    int v12 = _NRLogIsLevelEnabled();

    if (v12)
    {
      id v13 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
  }
  else
  {
    self->_p2pRequested = 0;
    if (!sub_1000DB33C((uint64_t)self, 0, 1, 1, 0, 0) && !sub_1000DB33C((uint64_t)self, 0, 1, 1, 1, 0)) {
      sub_1000DB33C((uint64_t)self, 0, 1, 0, 0, 0);
    }
    self->_pendingPreferWiFiRequest = 0;
    sub_1000DB474((uint64_t)self, 0);
  }
  return 1;
}

- (BOOL)preferWiFiRequestAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_preferWiFiRequestInFlight = 0;
  if (_NRIsAppleInternal())
  {
    if (self->_disablePreferWiFi)
    {
      uint64_t v3 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      BOOL result = 0;
      if (IsLevelEnabled) {
        goto LABEL_13;
      }
      return result;
    }
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    v6 = (unsigned __int8 *)(id)qword_1001F4A18;
    if (v6)
    {
      int v7 = v6[8];

      if (v7)
      {
        v8 = (void *)_NRCopyLogObjectForNRUUID();
        int v9 = _NRLogIsLevelEnabled();

        BOOL result = 0;
        if (v9) {
          goto LABEL_13;
        }
        return result;
      }
    }
  }
  if (self->_deviceSetupInProgress)
  {
    id v10 = (void *)_NRCopyLogObjectForNRUUID();
    int v11 = _NRLogIsLevelEnabled();

    BOOL result = 0;
    if (v11)
    {
LABEL_13:
      int v12 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();

      return 0;
    }
  }
  else
  {
    if (self->_hasPhoneCallRelayRequest)
    {
      id v13 = (void *)_NRCopyLogObjectForNRUUID();
      int v14 = _NRLogIsLevelEnabled();

      if (v14)
      {
        uint64_t v15 = (void *)_NRCopyLogObjectForNRUUID();
        _NRLogWithArgs();
      }
    }
    else
    {
      if (self->_supportsAWDL)
      {
        self;
        if (qword_1001F4A20 != -1) {
          dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
        }
        id v16 = (id)qword_1001F4A18;
        id v17 = v16;
        if (v16) {
          v18 = (void *)*((void *)v16 + 12);
        }
        else {
          v18 = 0;
        }
        id v19 = v18;
        self->_p2pRequested = sub_10006760C((uint64_t)v19, 0);
      }
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      id v20 = sub_1000DC5BC((uint64_t)self, 2, 101);
      v27 = v20;
      if (v20 && [v20 state] != 255) {
        goto LABEL_31;
      }
      if (!self->_p2pRequested) {
        goto LABEL_37;
      }
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      self;
      if (qword_1001F4A20 != -1) {
        dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
      }
      id v28 = (id)qword_1001F4A18;
      v29 = v28;
      v30 = v28 ? (void *)*((void *)v28 + 6) : 0;
      id v31 = v30;

      BOOL v32 = sub_10015774C((uint64_t)v31);
      if (v32)
      {
LABEL_31:
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        if (self->_isAlwaysReachableOverWiFi)
        {
          v33 = objc_alloc_init(NRLinkDirectorRequest);
          v34 = v33;
          if (v33)
          {
            v33->_type = 1;
            v33->_requiredLinkType = 1;
            *(_WORD *)&v33->_attemptImmediately = 257;
          }
          sub_1000D6720((uint64_t)self, v33);
        }
        if (sub_1000DB33C((uint64_t)self, 1, 1, 1, 0, 0))
        {
          [v27 start];
        }
        else
        {
          self->_pendingPreferWiFiRequest = 1;
          v39[0] = _NSConcreteStackBlock;
          v39[1] = 3221225472;
          v39[2] = sub_1000DEA08;
          v39[3] = &unk_1001C8BA8;
          v39[4] = self;
          sub_1000DB33C((uint64_t)self, 1, 0, 0, 0, v39);
          v35 = (void *)_NRCopyLogObjectForNRUUID();
          int v36 = _NRLogIsLevelEnabled();

          if (v36)
          {
            v37 = (void *)_NRCopyLogObjectForNRUUID();
            _NRLogWithArgs();
          }
        }
      }
      else
      {
LABEL_37:
        sub_1000DE254((uint64_t)self, @"No Wi-Fi link available", v21, v22, v23, v24, v25, v26, v38);
        self->_pendingPreferWiFiRequest = 1;
      }
    }
    return 1;
  }
  return result;
}

- (BOOL)preferWiFiP2PRequestUpdated
{
  if (_NRIsAppleInternal())
  {
    if (self && self->_disablePreferWiFi) {
      return 0;
    }
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    uint64_t v3 = (unsigned __int8 *)(id)qword_1001F4A18;
    if (v3)
    {
      int v4 = v3[8];

      if (v4) {
        return 0;
      }
    }
  }
  if (!self || !self->_preferWiFiRequest && !self->_preferWiFiRequestInFlight)
  {
    int v11 = (void *)_NRCopyLogObjectForNRUUID();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    BOOL result = 0;
    if (!IsLevelEnabled) {
      return result;
    }
    id v13 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();

    return 0;
  }
  if (self->_supportsAWDL)
  {
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    id v5 = (id)qword_1001F4A18;
    v6 = v5;
    if (v5) {
      int v7 = (void *)*((void *)v5 + 12);
    }
    else {
      int v7 = 0;
    }
    id v8 = v7;
    int v9 = sub_10006760C((uint64_t)v8, 0);

    if (v9 != self->_p2pRequested)
    {
      [(NRDDeviceConductor *)self preferWiFiRequestUnavailable];
      [(NRDDeviceConductor *)self preferWiFiRequestAvailable];
    }
  }
  return 1;
}

- (void)reportBTLinkUpgradeClientRemoved:(id)a3
{
  if (self) {
    self = (NRDDeviceConductor *)self->_devicePreferencesManager;
  }
  sub_100121A98((uint64_t)self, a3);
}

- (void)reportBTLinkUpgradeClientAdded:(id)a3
{
  if (self) {
    self = (NRDDeviceConductor *)self->_devicePreferencesManager;
  }
  sub_100121990((uint64_t)self, a3);
}

- (void)deviceHasBTLinkUpgradeRequest:(BOOL)a3
{
  if (a3)
  {
    id v4 = objc_alloc_init((Class)NRBluetoothLinkPreferences);
    [v4 setPacketsPerSecond:&off_1001D4AB0];
    if (self)
    {
      id v5 = self->_devicePreferencesManager;
      v6 = self->_btLinkPreferencesAgent;
      int v7 = [(NRBTLinkPreferencesAgent *)v6 agentUUID];
      id v8 = [v7 UUIDString];
      sub_100121BA0((uint64_t)v5, v4, v8);

      unint64_t v9 = (self->_effectiveALUAdvice >> 1) & 1;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_1000DEF0C;
      v19[3] = &unk_1001C7530;
      char v20 = v9;
      v19[4] = self;
      sub_1000DC374((uint64_t)self, 1, v9, v19);
    }
    else
    {
      uint64_t v15 = [0 agentUUID];
      id v16 = [v15 UUIDString];
      sub_100121BA0(0, v4, v16);
    }
  }
  else if (self)
  {
    id v10 = self->_devicePreferencesManager;
    int v11 = self->_btLinkPreferencesAgent;
    int v12 = [(NRBTLinkPreferencesAgent *)v11 agentUUID];
    id v13 = [v12 UUIDString];
    sub_100121C80((uint64_t)v10, v13);

    linkUpgradeReportForBTClassic = self->_linkUpgradeReportForBTClassic;
    sub_1000DCB28((uint64_t)self, linkUpgradeReportForBTClassic);
  }
  else
  {
    id v17 = [0 agentUUID];
    v18 = [v17 UUIDString];
    sub_100121C80(0, v18);
  }
}

- (void)deviceHasQuickRelayRequest:(id)a3 hasQuickRelayRequest:(BOOL)a4
{
  id v6 = a3;
  id v25 = v6;
  if (self)
  {
    if ([v6 isEqual:self->_nrUUID])
    {
      if (self->_isEnabled)
      {
        int v7 = (void *)_NRCopyLogObjectForNRUUID();
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          unint64_t v9 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
        self->_hasQuickRelayRequest = a4;
        if (!self->_hasReceivedFirstAPSIsConnectedUpdate)
        {
          self;
          if (qword_1001F4A20 != -1) {
            dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
          }
          id v10 = (id *)(id)qword_1001F4A18;
          int v11 = v10;
          if (v10)
          {
            int v12 = v10[7];
            if (v12) {
              BOOL v13 = v12[32] != 0;
            }
            else {
              BOOL v13 = 0;
            }
          }
          else
          {
            int v12 = 0;
            BOOL v13 = 0;
          }
          self->_apsIsConnected = v13;

          int v14 = (void *)_NRCopyLogObjectForNRUUID();
          int v15 = _NRLogIsLevelEnabled();

          if (v15)
          {
            id v16 = (void *)_NRCopyLogObjectForNRUUID();
            _NRLogWithArgs();
          }
        }
        sub_1000DF254((uint64_t)self);
        goto LABEL_22;
      }
      goto LABEL_20;
    }
  }
  else if ([v6 isEqual:0])
  {
LABEL_20:
    uint64_t v22 = (void *)_NRCopyLogObjectForNRUUID();
    int v23 = _NRLogIsLevelEnabled();

    if (v23)
    {
      uint64_t v24 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    goto LABEL_22;
  }
  id v17 = (void *)_NRCopyLogObjectForNRUUID();
  int v18 = _NRLogIsLevelEnabled();

  if (v18)
  {
    if (self) {
      nrUUID = self->_nrUUID;
    }
    else {
      nrUUID = 0;
    }
    char v20 = nrUUID;
    uint64_t v21 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
LABEL_22:
}

- (void)apsIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  if (self)
  {
    self->_hasReceivedFirstAPSIsConnectedUpdate = 1;
    if (self->_apsIsConnected == a3) {
      return;
    }
  }
  else if (!a3)
  {
    return;
  }
  id v5 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    int v7 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  if (self && (self->_apsIsConnected = v3, self->_isEnabled))
  {
    if (v3)
    {
      sub_1000DF254((uint64_t)self);
    }
  }
  else
  {
    id v8 = (void *)_NRCopyLogObjectForNRUUID();
    int v9 = _NRLogIsLevelEnabled();

    if (v9)
    {
      id v10 = (id)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
  }
}

- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_isEnabled || !self->_supportsPhoneCallRelay || self->_hasPhoneCallRelayRequest == v3) {
    return;
  }
  if (!self->_phoneCallRelayAnalytics)
  {
    id v5 = objc_alloc_init(NRAnalyticsPhoneCallRelay);
    phoneCallRelayAnalytics = self->_phoneCallRelayAnalytics;
    self->_phoneCallRelayAnalytics = v5;
  }
  uint64_t v7 = mach_absolute_time();
  id v8 = self->_phoneCallRelayAnalytics;
  if (v3)
  {
    if (v8) {
      v8->_phoneCallRelayStart = v7;
    }
  }
  else
  {
    if (v8)
    {
      v8->_phoneCallRelayEnd = v7;
      int v9 = self->_phoneCallRelayAnalytics;
    }
    else
    {
      int v9 = 0;
    }
    [(NRAnalyticsPhoneCallRelay *)v9 submit];
    id v10 = self->_phoneCallRelayAnalytics;
    self->_phoneCallRelayAnalytics = 0;
  }
  int v11 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    BOOL v13 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  self->_hasPhoneCallRelayRequest = v3;
  if (self->_isPreferWiFiProvider)
  {
    if (v3) {
      return;
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    id v14 = (id)qword_1001F4A18;
    int v15 = v14;
    if (v14) {
      id v16 = (void *)*((void *)v14 + 6);
    }
    else {
      id v16 = 0;
    }
    id v17 = v16;

    if (v17
      && (int v18 = v17[3],
          dispatch_assert_queue_V2(v18),
          v18,
          *((int *)v17 + 10) >= 1))
    {
      BOOL preferWiFiRequest = self->_preferWiFiRequest;

      if (!preferWiFiRequest)
      {
        char v20 = (void *)_NRCopyLogObjectForNRUUID();
        int v21 = _NRLogIsLevelEnabled();

        if (v21)
        {
          uint64_t v22 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
        [(NRDDeviceConductor *)self preferWiFiRequestAvailable];
        return;
      }
    }
    else
    {
    }
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    id v26 = (id)qword_1001F4A18;
    v27 = v26;
    if (v26) {
      id v28 = (void *)*((void *)v26 + 6);
    }
    else {
      id v28 = 0;
    }
    v35 = v28;

    v29 = v35;
    if (v35
      && (v30 = v35[3],
          dispatch_assert_queue_V2(v30),
          v30,
          v29 = v35,
          *((int *)v35 + 10) > 0))
    {
    }
    else
    {
      BOOL v31 = self->_preferWiFiRequest;

      if (v31)
      {
        BOOL v32 = (void *)_NRCopyLogObjectForNRUUID();
        int v33 = _NRLogIsLevelEnabled();

        if (v33)
        {
          v34 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
        [(NRDDeviceConductor *)self preferWiFiRequestUnavailable];
      }
    }
  }
  else if (v3 && !self->_preferWiFiRequest && self->_pendingPreferWiFiRequest)
  {
    int v23 = (void *)_NRCopyLogObjectForNRUUID();
    int v24 = _NRLogIsLevelEnabled();

    if (v24)
    {
      id v25 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    self->_pendingPreferWiFiRequest = 0;
  }
}

- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v13 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_peerDidUnpairBluetooth != v4)
  {
    if (([(NSUUID *)self->_nrUUID isEqual:v13] & 1) == 0)
    {
      id v9 = sub_1000D8B78();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        id v11 = sub_1000D8B78();
        _NRLogWithArgs();
      }
      _os_log_pack_size();
      __error();
      uint64_t v12 = _os_log_pack_fill();
      *(_DWORD *)uint64_t v12 = 136446210;
      *(void *)(v12 + 4) = "-[NRDDeviceConductor peerDidUnpairBluetooth:nrUUID:]";
      sub_1000D8B78();
      _NRLogAbortWithPack();
    }
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    int v7 = _NRLogIsLevelEnabled();

    if (v7)
    {
      id v8 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    self->_peerDidUnpairBluetooth = v4;
    sub_1000DFD74((uint64_t)self);
  }
}

- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (([(NSUUID *)self->_nrUUID isEqual:v6] & 1) == 0)
  {
    id v13 = sub_1000D8B78();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
      id v15 = sub_1000D8B78();
      _NRLogWithArgs();
    }
    _os_log_pack_size();
    __error();
    uint64_t v16 = _os_log_pack_fill();
    *(_DWORD *)uint64_t v16 = 136446210;
    *(void *)(v16 + 4) = "-[NRDDeviceConductor pipeDidConnectForNRUUID:nrUUID:]";
    sub_1000D8B78();
    _NRLogAbortWithPack();
  }
  int v7 = (void *)_NRCopyLogObjectForNRUUID();
  int v8 = _NRLogIsLevelEnabled();

  if (v8)
  {
    id v9 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  self->_peerDeviceIsNearby = v4;
  ++self->_peerDeviceIsNearbyUpdateCounter;
  if (v4)
  {
    sub_100034488((uint64_t)self->_quickRelayAgent);
    unint64_t peerDeviceIsNearbyUpdateCounter = self->_peerDeviceIsNearbyUpdateCounter;
    dispatch_time_t v11 = dispatch_time(0x8000000000000000, 3000000000);
    queue = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000E0910;
    block[3] = &unk_1001C7580;
    block[4] = self;
    block[5] = peerDeviceIsNearbyUpdateCounter;
    dispatch_after(v11, queue, block);
  }
  sub_1000DFD74((uint64_t)self);
}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  id v13 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v6 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    int v8 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  self->_peerDeviceIsAsleep = a4;
  if (!a4 && self->_peerDeviceIsNearby)
  {
    netInfo = self->_netInfo;
    if (netInfo)
    {
      if (!netInfo->_isCoalescing)
      {
        unint64_t netInfoGenerationSent = self->_netInfoGenerationSent;
        goto LABEL_11;
      }
      id v10 = sub_10001A05C((dispatch_queue_t *)netInfo);

      if (v10)
      {
        netInfo = self->_netInfo;
        unint64_t netInfoGenerationSent = self->_netInfoGenerationSent;
        if (!netInfo)
        {
          unint64_t generation = 0;
          goto LABEL_12;
        }
LABEL_11:
        unint64_t generation = netInfo->_generation;
LABEL_12:
        if (netInfoGenerationSent != generation) {
          sub_1000E0F64((uint64_t)self, self->_primaryLink);
        }
      }
    }
    if (self->_sendThermalPressureUpdateWhenAwake) {
      sub_1000E0B98((uint64_t)self, self->_primaryLink);
    }
    if (self->_sendDeviceStateUpdateWhenAwake) {
      sub_1000E0D9C((uint64_t)self, self->_primaryLink);
    }
  }
  sub_1000DFD74((uint64_t)self);
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v7 = a3;
  id v385 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_isEnabled)
  {
    if ([v7 state] != 255)
    {
      v387 = v7;
      int v8 = self->_nrUUID;
      id v9 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (IsLevelEnabled)
      {
        dispatch_time_t v11 = self->_nrUUID;
        uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID();
        id v378 = [v385 length];
        id v379 = v387;
        uint64_t v377 = 5993;
        v375 = "";
        v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
        _NRLogWithArgs();
      }
      id v13 = self->_nrUUID;
      id v14 = (void *)sub_1000255E8((uint64_t)NRLinkDirectorMessage, v385, v13);

      v386 = v14;
      if (!v14)
      {
        v52 = (void *)_NRCopyLogObjectForNRUUID();
        int v53 = _NRLogIsLevelEnabled();

        id v7 = v387;
        if (v53)
        {
          v54 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
LABEL_315:

        goto LABEL_316;
      }
      id v15 = sub_1000261E8(v14, 1);
      uint64_t v16 = [v15 firstObject];

      id v17 = &unk_1001F4000;
      int v18 = (id *)&unk_1001F4000;
      if (v16)
      {
        id v19 = self->_nrUUID;
        char v20 = (void *)_NRCopyLogObjectForNRUUID();
        int v21 = _NRLogIsLevelEnabled();

        if (v21)
        {
          uint64_t v22 = self->_nrUUID;
          int v23 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v377 = 6002;
          v375 = "";
          v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
          _NRLogWithArgs();
        }
        if (self->_helloMessageReceivedOnce)
        {
          int v24 = self->_nrUUID;
          id v25 = (void *)_NRCopyLogObjectForNRUUID();
          int v26 = _NRLogIsLevelEnabled();

          if (v26)
          {
            v27 = self->_nrUUID;
            id v28 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v377 = 6008;
            v375 = "";
            v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
            _NRLogWithArgs();
          }
          id v29 = v387;
          dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
          v30 = (id *)sub_100025474([NRLinkDirectorMessage alloc], self->_nrUUID);
          BOOL v31 = v30;
          if (v30)
          {
            objc_storeStrong(v30 + 3, a3);
            sub_100025B00((uint64_t)v31, 1, 0);
          }
          sub_100027090((uint64_t)v31);
          self->_helloMessageSent = 1;

          self;
          if (qword_1001F4DE0 != -1) {
            dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
          }
          id v32 = (id)qword_1001F4DD8;
          if (v32)
          {
            int v33 = v32;
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v32 + 2));
            if (!v33[10])
            {
              v33[10] = 1;
              if (v33[8] == 4)
              {
                sub_100158FD0((uint64_t)v33);
                if (v33[9])
                {
                  v33[8] = 3;
                  sub_100159248((uint64_t)v33);
                }
              }
            }
            int v34 = v33[8] & 0xFD;

            if (v34 == 1)
            {
              sub_1000DE254((uint64_t)self, @"Other side restarted", v35, v36, v37, v38, v39, v40, (uint64_t)v375);
              if (self->_isPreferWiFiProvider)
              {
                dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                self;
                if (qword_1001F4A20 != -1) {
                  dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
                }
                id v41 = (id)qword_1001F4A18;
                v42 = v41;
                if (v41) {
                  v43 = (void *)*((void *)v41 + 6);
                }
                else {
                  v43 = 0;
                }
                v44 = v43;

                if (v44)
                {
                  v45 = v44[3];
                  dispatch_assert_queue_V2(v45);

                  BOOL v46 = *((_DWORD *)v44 + 10) > 0;
                }
                else
                {
                  BOOL v46 = 0;
                }
                self->_pendingPreferWiFiRequest = v46;
              }
            }
          }
        }
        else
        {
          self->_helloMessageReceivedOnce = 1;
        }
      }
      v55 = v386;
      v56 = sub_1000261E8(v386, 3);
      v57 = [v56 firstObject];

      if (v57
        || (v58 = sub_1000261E8(v386, 2),
            [v58 firstObject],
            v59 = objc_claimAutoreleasedReturnValue(),
            v58,
            v55 = v386,
            v59,
            v59))
      {
        self->_latestWiFiAddressUpdateMsgIdentifier = sub_100024424((uint64_t)v55);
      }
      id v7 = v387;
      if (self->_supportsAWDL)
      {
        v60 = sub_1000261E8(v55, 10);
        v61 = [v60 firstObject];

        v55 = v386;
        if (v61) {
          self->_latestAWDLAddressUpdateMsgIdentifier = sub_100024424((uint64_t)v386);
        }
      }
      v62 = sub_1000261E8(v55, 7);
      v63 = [v62 firstObject];

      v64 = v386;
      if (v63
        || (v65 = sub_1000261E8(v386, 13),
            [v65 firstObject],
            v66 = objc_claimAutoreleasedReturnValue(),
            v65,
            v64 = v386,
            v66,
            v66))
      {
        self->_latestPreferWiFiAckMsgIdentifier = sub_100024424((uint64_t)v64);
      }
      v67 = sub_1000261E8(v64, 5);
      v68 = [v67 firstObject];

      v69 = v386;
      if (v68
        || (v70 = sub_1000261E8(v386, 13),
            [v70 firstObject],
            v71 = objc_claimAutoreleasedReturnValue(),
            v70,
            v69 = v386,
            v71,
            v71))
      {
        self->_latestPreferWiFiRequestMsgIdentifier = sub_100024424((uint64_t)v69);
      }
      v72 = sub_1000261E8(v69, 6);
      v73 = [v72 firstObject];

      if (v73) {
        self->_latestDeviceLinkStateMsgIdentifier = sub_100024424((uint64_t)v386);
      }
      v74 = sub_1000261E8(v386, 15);
      v75 = [v74 firstObject];

      if (v75) {
        self->_latestCountryCodeMsgIdentifier = sub_100024424((uint64_t)v386);
      }
      self;
      if (qword_1001F4A20 != -1) {
        dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
      }
      id v76 = (id)qword_1001F4A18;
      v435[0] = _NSConcreteStackBlock;
      v435[1] = 3221225472;
      v435[2] = sub_1000E42A0;
      v435[3] = &unk_1001C8840;
      v435[4] = self;
      v77 = v386;
      id v436 = v77;
      sub_1000B7F50((uint64_t)v76, v435);

      v384 = v77;
      v78 = sub_1000261E8(v77, 8);
      v79 = [v78 firstObject];

      if (v79 && !self->_handlesLinkRecommendations && !self->_didForceWoWMode)
      {
        if (!self->_forcedWoWUUID)
        {
          v80 = +[NSUUID UUID];
          forcedWoWUUID = self->_forcedWoWUUID;
          self->_forcedWoWUUID = v80;
        }
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        self;
        if (qword_1001F4A20 != -1) {
          dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
        }
        id v82 = (id)qword_1001F4A18;
        v83 = v82;
        if (v82) {
          v84 = (void *)*((void *)v82 + 6);
        }
        else {
          v84 = 0;
        }
        id v85 = v84;

        sub_100155CF0((uint64_t)v85, 1, self->_forcedWoWUUID);
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        self;
        if (qword_1001F4A20 != -1) {
          dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
        }
        id v86 = (id)qword_1001F4A18;
        v87 = v86;
        if (v86) {
          v88 = (void *)*((void *)v86 + 6);
        }
        else {
          v88 = 0;
        }
        v89 = v88;

        sub_1001573C0(v89, 16, self->_forcedWoWUUID, &off_1001D4D60);
        dispatch_time_t v90 = dispatch_time(0x8000000000000000, 60000000000);
        queue = self->_queue;
        block = _NSConcreteStackBlock;
        uint64_t v460 = 3221225472;
        v461 = sub_1000E8E08;
        v462 = &unk_1001C8BA8;
        v463 = self;
        dispatch_after(v90, queue, &block);
        self->_didForceWoWMode = 1;
        sub_10012F648(self->_nrUUID, 1029, 0, 0);
      }
      v92 = v384;
      v93 = sub_1000261E8(v384, 11);
      v94 = [v93 firstObject];

      v383 = v94;
      if ((unint64_t)[v94 length] < 8)
      {
LABEL_108:
        v409 = self;
        if (self->_supportsPathOverrides)
        {
          v102 = sub_1000261E8(v92, 12);
          v103 = [v102 firstObject];

          if (v103)
          {
            v104 = sub_100017EAC((char *)[NRNetInfo alloc], v103);
            v105 = v104;
            if (v104 && (v104[16] | 2) == 3) {
              sub_1000E57D4((uint64_t)self);
            }
            else {
              sub_1000E5970((uint64_t)self);
            }
            id v107 = v103;
            CC_SHA256([v107 bytes], (CC_LONG)[v107 length], (unsigned __int8 *)&block);
            id v106 = [objc_alloc((Class)NSData) initWithBytes:&block length:32];
          }
          else
          {
            v105 = 0;
            id v106 = 0;
          }

          v108 = self->_lastReceivedNetInfoDataHash;
          unsigned int v109 = [v106 isEqualToData:v108];

          if (v109)
          {
            v110 = self->_nrUUID;
            v111 = (void *)_NRCopyLogObjectForNRUUID();
            int v112 = _NRLogIsLevelEnabled();

            if (v112)
            {
              v113 = self->_nrUUID;
              v114 = (void *)_NRCopyLogObjectForNRUUID();
              uint64_t v377 = 6246;
              v375 = "";
              v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
              _NRLogWithArgs();
            }
          }
          else if (v103)
          {
            v115 = self->_nrUUID;
            v116 = (void *)_NRCopyLogObjectForNRUUID();
            int v117 = _NRLogIsLevelEnabled();

            if (v117)
            {
              v118 = self->_nrUUID;
              v119 = (void *)_NRCopyLogObjectForNRUUID();
              id v378 = v105;
              id v379 = [v103 length];
              uint64_t v377 = 6248;
              v375 = "";
              v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
              _NRLogWithArgs();
            }
            sub_1000E59E8((uint64_t)self, v105 == 0);
            if (v105)
            {
              id v405 = v106;
              objc_storeStrong((id *)&self->_lastReceivedNetInfoDataHash, v106);
              v120 = (void *)nw_path_override_info_create();
              nw_path_override_info_set_expensive();
              nw_path_override_info_set_constrained();
              nw_path_override_info_set_roaming();
              nw_path_override_info_set_uses_wifi();
              nw_path_override_info_set_uses_cellular();
              id v121 = *((id *)v105 + 16);
              long long v431 = 0u;
              long long v432 = 0u;
              long long v433 = 0u;
              long long v434 = 0u;
              id v122 = v121;
              v123 = (char *)[v122 countByEnumeratingWithState:&v431 objects:v450 count:16];
              if (v123)
              {
                v124 = v123;
                uint64_t v125 = *(void *)v432;
                do
                {
                  for (i = 0; i != v124; ++i)
                  {
                    if (*(void *)v432 != v125) {
                      objc_enumerationMutation(v122);
                    }
                    nw_path_override_info_add_resolver_config();
                  }
                  v124 = (char *)[v122 countByEnumeratingWithState:&v431 objects:v450 count:16];
                }
                while (v124);
              }
              v410 = v105;

              v127 = v409->_queue;
              v128 = nw_agent_create_with_path_override_info();
              objc_storeStrong((id *)&v409->_pathOverrideAgent, v128);

              v129 = v409->_pathOverrideAgent;
              v130 = (void *)nw_path_override_info_copy_data();
              nw_agent_change_state();

              long long v464 = 0uLL;
              v131 = v409->_pathOverrideAgent;
              nw_agent_get_uuid();

              id v132 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v464];
              v133 = v409->_nrUUID;
              v134 = (void *)_NRCopyLogObjectForNRUUID();
              int v135 = _NRLogIsLevelEnabled();

              if (v135)
              {
                v136 = v409->_nrUUID;
                v137 = (void *)_NRCopyLogObjectForNRUUID();
                uint64_t v377 = 6274;
                id v378 = v132;
                v375 = "";
                v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                _NRLogWithArgs();
              }
              v138 = +[NEPolicyRouteRule routeRuleWithAction:forType:](NEPolicyRouteRule, "routeRuleWithAction:forType:", 5, 6, v375, v376, v377, v378, v379);
              id v401 = v132;
              [v138 setNetworkAgentUUID:v132];
              id v139 = objc_alloc((Class)NEPolicy);
              v399 = v138;
              v449 = v138;
              v140 = +[NSArray arrayWithObjects:&v449 count:1];
              v141 = +[NEPolicyResult routeRules:v140];
              v142 = +[NEPolicyCondition allInterfaces];
              v448 = v142;
              v143 = +[NSArray arrayWithObjects:&v448 count:1];
              id v144 = [v139 initWithOrder:10 result:v141 conditions:v143];

              self;
              if (qword_1001F4D28 != -1) {
                dispatch_once(&qword_1001F4D28, &stru_1001C8658);
              }
              v105 = v410;
              id v145 = (id)qword_1001F4D20;
              v146 = v409->_netInfoPolicyIdentifier;
              id v147 = sub_100134CFC((uint64_t)v145, v146, v144);

              v148 = v410;
              id v149 = v148[5];
              v150 = v149;
              id v7 = v387;
              if (v149)
              {
                CC_SHA256([v149 bytes], (CC_LONG)[v149 length], (unsigned __int8 *)&block);
                id v151 = [objc_alloc((Class)NSData) initWithBytes:&block length:32];
              }
              else
              {
                id v151 = 0;
              }

              v396 = v144;
              if (![(NSData *)v409->_companionNWDescAgentDataHash isEqualToData:v151])
              {
                id obj = v151;
                v394 = v148;
                if (!v409->_companionNWDescAgent)
                {
                  v152 = v409->_queue;
                  uint64_t v153 = nw_agent_create();
                  companionNWDescAgent = v409->_companionNWDescAgent;
                  v409->_companionNWDescAgent = (OS_nw_agent *)v153;
                }
                id v155 = v148[5];

                if (v155)
                {
                  id v156 = v148[5];
                  dispatch_data_t v390 = dispatch_data_create([v156 bytes], (size_t)[v156 length], (dispatch_queue_t)v409->_queue, 0);
                }
                else
                {
                  dispatch_data_t v390 = 0;
                }
                self;
                if (qword_1001F4D28 != -1) {
                  dispatch_once(&qword_1001F4D28, &stru_1001C8658);
                }
                id v157 = (id)qword_1001F4D20;
                sub_10013502C((uint64_t)v157, v409->_companionNWDescPolicyIdentifier);

                nw_agent_change_state();
                objc_storeStrong((id *)&v409->_companionNWDescAgentDataHash, v151);
                long long v451 = 0uLL;
                nw_agent_get_uuid();
                id v158 = [objc_alloc((Class)NSUUID) initWithUUIDBytes:&v451];
                id v159 = objc_alloc((Class)NEPolicy);
                v160 = v158;
                v161 = +[NEPolicyResult netAgentUUID:v158];
                v162 = +[NEPolicyCondition allInterfaces];
                block = v162;
                v163 = +[NEPolicyCondition platformBinary];
                uint64_t v460 = (uint64_t)v163;
                v164 = +[NEPolicyCondition customEntitlement:@"com.apple.networkrelay.companionNetworkDescription"];
                v461 = v164;
                v165 = +[NSArray arrayWithObjects:&block count:3];
                id v166 = [v159 initWithOrder:10 result:v161 conditions:v165];

                self;
                if (qword_1001F4D28 != -1) {
                  dispatch_once(&qword_1001F4D28, &stru_1001C8658);
                }
                v105 = v410;
                id v167 = (id)qword_1001F4D20;
                id v168 = sub_100134CFC((uint64_t)v167, v409->_companionNWDescPolicyIdentifier, v166);

                id v7 = v387;
                id v151 = obj;
                v148 = v394;
              }

              self;
              if (qword_1001F4D28 != -1) {
                dispatch_once(&qword_1001F4D28, &stru_1001C8658);
              }
              int v18 = (id *)&unk_1001F4000;
              id v17 = (void *)&unk_1001F4000;
              id v169 = (id)qword_1001F4D20;
              v170 = (id *)v169;
              if (v169)
              {
                dispatch_assert_queue_V2(*((dispatch_queue_t *)v169 + 1));
                if (([v170[2] apply] & 1) == 0) {
                  sub_100115AB0(@"NRPolicySessionManager", @"ApplyPolicy Failed", 0, 1, @"Failed to apply policies", v171, v172, v173, (uint64_t)v375);
                }
              }

              if (*((unsigned char *)v148 + 9) && !v409->_hasNonCompanionClients) {
                sub_1000E5B48((uint64_t)v409);
              }
              unsigned int v174 = v105[16] - 1;
              if (v174 <= 2)
              {
                uint64_t v175 = dword_10016CA60[(char)v174];
                long long v429 = 0u;
                long long v430 = 0u;
                long long v427 = 0u;
                long long v428 = 0u;
                v176 = v409->_availableLinks;
                id v177 = [(NSMutableSet *)v176 countByEnumeratingWithState:&v427 objects:v447 count:16];
                if (v177)
                {
                  id v178 = v177;
                  uint64_t v179 = *(void *)v428;
                  do
                  {
                    for (j = 0; j != v178; j = (char *)j + 1)
                    {
                      if (*(void *)v428 != v179) {
                        objc_enumerationMutation(v176);
                      }
                      v181 = *(void **)(*((void *)&v427 + 1) + 8 * (void)j);
                      if ([v181 virtualInterface])
                      {
                        v182 = [v181 proxyAgentUUID];

                        if (v182) {
                          [v181 setInterfacePeerEgressFunctionalType:v175];
                        }
                      }
                    }
                    id v178 = [(NSMutableSet *)v176 countByEnumeratingWithState:&v427 objects:v447 count:16];
                  }
                  while (v178);
                }

                v105 = v410;
                id v7 = v387;
                int v18 = (id *)&unk_1001F4000;
                id v17 = &unk_1001F4000;
                if (v409->_catchAllInterface)
                {
                  v183 = v409->_proxyAgentUUID;

                  if (v183)
                  {
                    if (v409->_catchAllInterface) {
                      v184 = (void *)NEVirtualInterfaceCopyName();
                    }
                    else {
                      v184 = 0;
                    }
                    sub_100114C80(v184, v175);
                  }
                }
              }

              id v106 = v405;
              self = v409;
            }
            else
            {
              sub_1000E5C84((uint64_t)self);
            }
            sub_1000E5DDC((uint64_t)self, 1);
          }

          v92 = v384;
        }
        v185 = sub_1000261E8(v92, 6);
        v186 = v185;
        if (v185 && [v185 count])
        {
          long long v454 = 0u;
          long long v453 = 0u;
          long long v452 = 0u;
          long long v451 = 0u;
          v187 = v186;
          id v188 = [v187 countByEnumeratingWithState:&v451 objects:&block count:16];
          if (v188)
          {
            id v189 = v188;
            id v190 = 0;
            uint64_t v191 = *(void *)v452;
            do
            {
              for (k = 0; k != v189; k = (char *)k + 1)
              {
                if (*(void *)v452 != v191) {
                  objc_enumerationMutation(v187);
                }
                v195 = *(void **)(*((void *)&v451 + 1) + 8 * (void)k);
                LOBYTE(v464) = 0;
                if ((unint64_t)objc_msgSend(v195, "length", v375, v376, v377) <= 1) {
                  uint64_t v196 = (uint64_t)[v195 length];
                }
                else {
                  uint64_t v196 = 1;
                }
                [v195 getBytes:&v464 length:v196];
                if (!v190) {
                  id v190 = objc_alloc_init((Class)NSMutableArray);
                }
                if (v464 >= 8uLL) {
                  char v193 = 0;
                }
                else {
                  char v193 = 0x202020504020100uLL >> (8 * v464);
                }
                v194 = +[NSNumber numberWithUnsignedChar:v193 & 7];
                [v190 addObject:v194];
              }
              id v189 = [v187 countByEnumeratingWithState:&v451 objects:&block count:16];
            }
            while (v189);

            if (v190)
            {
              id v7 = v387;
              v92 = v384;
              if ([v190 count])
              {
                long long v425 = 0u;
                long long v426 = 0u;
                long long v423 = 0u;
                long long v424 = 0u;
                id v290 = v190;
                id v291 = [v290 countByEnumeratingWithState:&v423 objects:v446 count:16];
                v398 = v290;
                if (v291)
                {
                  id v292 = v291;
                  int v293 = 0;
                  char v412 = 0;
                  uint64_t v294 = *(void *)v424;
                  while (1)
                  {
                    v295 = 0;
                    int v408 = v293;
                    int v296 = -v293;
                    do
                    {
                      if (*(void *)v424 != v294) {
                        objc_enumerationMutation(v290);
                      }
                      unsigned __int8 v297 = [*(id *)(*((void *)&v423 + 1) + 8 * (void)v295) unsignedShortValue:v375, v376, v377, v378];
                      StringFromNRLinkType = (void *)createStringFromNRLinkType();
                      v299 = v409->_nrUUID;
                      v300 = (void *)_NRCopyLogObjectForNRUUID();
                      int v301 = _NRLogIsLevelEnabled();

                      if (v296 == v295)
                      {
                        char v412 = v297;
                        if (v301)
                        {
                          v302 = v409->_nrUUID;
                          v303 = (void *)_NRCopyLogObjectForNRUUID();
                          uint64_t v377 = 6330;
                          id v378 = StringFromNRLinkType;
                          v375 = "";
                          v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                          _NRLogWithArgs();
                          char v412 = v297;
LABEL_323:
                        }
                      }
                      else if (v301)
                      {
                        v302 = v409->_nrUUID;
                        v303 = (void *)_NRCopyLogObjectForNRUUID();
                        uint64_t v377 = 6332;
                        id v378 = StringFromNRLinkType;
                        v375 = "";
                        v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                        _NRLogWithArgs();
                        goto LABEL_323;
                      }

                      v295 = (char *)v295 + 1;
                      id v290 = v398;
                    }
                    while (v292 != v295);
                    int v293 = v408 + v292;
                    id v292 = [v398 countByEnumeratingWithState:&v423 objects:v446 count:16];
                    if (!v292) {
                      goto LABEL_340;
                    }
                  }
                }
                char v412 = 0;
LABEL_340:

                v304 = sub_1000261E8(v384, 6);
                v305 = v304;
                if (v304 && [v304 count])
                {
                  long long v454 = 0u;
                  long long v453 = 0u;
                  long long v452 = 0u;
                  long long v451 = 0u;
                  v306 = v305;
                  id v307 = [v306 countByEnumeratingWithState:&v451 objects:&block count:16];
                  if (v307)
                  {
                    id v308 = v307;
                    id v309 = 0;
                    uint64_t v310 = *(void *)v452;
                    do
                    {
                      for (m = 0; m != v308; m = (char *)m + 1)
                      {
                        if (*(void *)v452 != v310) {
                          objc_enumerationMutation(v306);
                        }
                        v314 = *(void **)(*((void *)&v451 + 1) + 8 * (void)m);
                        LOBYTE(v464) = 0;
                        if ((unint64_t)objc_msgSend(v314, "length", v375) <= 1) {
                          uint64_t v315 = (uint64_t)[v314 length];
                        }
                        else {
                          uint64_t v315 = 1;
                        }
                        [v314 getBytes:&v464 length:v315];
                        if (!v309) {
                          id v309 = objc_alloc_init((Class)NSMutableArray);
                        }
                        if (v464 >= 8uLL) {
                          unsigned __int8 v312 = 0;
                        }
                        else {
                          unsigned __int8 v312 = 0x6867660000650000uLL >> (8 * v464);
                        }
                        v313 = +[NSNumber numberWithUnsignedChar:v312];
                        [v309 addObject:v313];
                      }
                      id v308 = [v306 countByEnumeratingWithState:&v451 objects:&block count:16];
                    }
                    while (v308);
                  }
                  else
                  {
                    id v309 = 0;
                  }
                }
                else
                {
                  id v309 = 0;
                }

                long long v419 = 0u;
                long long v420 = 0u;
                long long v421 = 0u;
                long long v422 = 0u;
                id v404 = v309;
                id v316 = [v404 countByEnumeratingWithState:&v419 objects:v445 count:16];
                self = v409;
                if (v316)
                {
                  id v317 = v316;
                  int v318 = 0;
                  uint64_t v319 = *(void *)v420;
                  do
                  {
                    v320 = 0;
                    int v400 = v318;
                    int v321 = -v318;
                    do
                    {
                      if (*(void *)v420 != v319) {
                        objc_enumerationMutation(v404);
                      }
                      int v324 = [*(id *)(*((void *)&v419 + 1) + 8 * (void)v320) unsignedShortValue:v375, v376, v377, v378];
                      StringFromNRLinkSubtype = (void *)createStringFromNRLinkSubtype();
                      v326 = self->_nrUUID;
                      v327 = (void *)_NRCopyLogObjectForNRUUID();
                      int v328 = _NRLogIsLevelEnabled();

                      if (v321 == v320 && v324)
                      {
                        self = v409;
                        if (v328)
                        {
                          v322 = v409->_nrUUID;
                          v323 = (void *)_NRCopyLogObjectForNRUUID();
                          uint64_t v377 = 6347;
                          id v378 = StringFromNRLinkSubtype;
                          v375 = "";
                          v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                          _NRLogWithArgs();
                          goto LABEL_368;
                        }
                      }
                      else
                      {
                        if (v328)
                        {
                          self = v409;
                          v322 = v409->_nrUUID;
                          v323 = (void *)_NRCopyLogObjectForNRUUID();
                          uint64_t v377 = 6349;
                          id v378 = StringFromNRLinkSubtype;
                          v375 = "";
                          v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                          _NRLogWithArgs();
LABEL_368:

                          goto LABEL_369;
                        }
                        self = v409;
                      }
LABEL_369:

                      v320 = (char *)v320 + 1;
                    }
                    while (v317 != v320);
                    int v318 = v400 + v317;
                    id v317 = [v404 countByEnumeratingWithState:&v419 objects:v445 count:16];
                  }
                  while (v317);
                }

                v329 = self->_nrUUID;
                v330 = (void *)_NRCopyLogObjectForNRUUID();
                int v331 = _NRLogIsLevelEnabled();

                if (v331)
                {
                  v332 = self->_nrUUID;
                  v333 = (void *)_NRCopyLogObjectForNRUUID();
                  v334 = v409->_primaryLink;
                  [(NRLink *)v334 type];
                  v335 = (void *)createStringFromNRLinkType();
                  v336 = v409->_primaryLink;
                  [(NRLink *)v336 subtype];
                  v337 = (void *)createStringFromNRLinkSubtype();
                  v380 = (void *)createStringFromNRLinkType();
                  v381 = (void *)createStringFromNRLinkSubtype();
                  id v378 = v335;
                  id v379 = v337;
                  v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                  uint64_t v377 = 6356;
                  v375 = "";
                  _NRLogWithArgs();

                  self = v409;
                }
                id v7 = v387;
                if (!self->_followsPeerPrimaryLink) {
                  goto LABEL_412;
                }
                char v338 = v412;
                if (!v412)
                {
                  v339 = self->_nrUUID;
                  v340 = (void *)_NRCopyLogObjectForNRUUID();
                  int v341 = _NRLogIsLevelEnabled();

                  if (v341)
                  {
                    v342 = self->_nrUUID;
                    v343 = (void *)_NRCopyLogObjectForNRUUID();
                    _NRLogWithArgs();
                  }
                  char v338 = 1;
                }
                v344 = self->_nrUUID;
                v345 = (void *)_NRCopyLogObjectForNRUUID();
                int v346 = _NRLogIsLevelEnabled();

                if (v346)
                {
                  v347 = self->_nrUUID;
                  v348 = (void *)_NRCopyLogObjectForNRUUID();
                  uint64_t v377 = 6446;
                  id v378 = (id)createStringFromNRLinkType();
                  v375 = "";
                  v376 = "-[NRDDeviceConductor linkDidReceiveData:data:]";
                  _NRLogWithArgs();
                }
                if (v338 != 2)
                {
                  if (v338 == 1)
                  {
                    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                    id v349 = sub_1000DC5BC((uint64_t)self, 1, 0);
                    v350 = v349;
                    if (v349)
                    {
                      if ([v349 state] == 1)
                      {
                        v351 = (void *)_NRCopyLogObjectForNRUUID();
                        int v352 = _NRLogIsLevelEnabled();

                        if (v352)
                        {
                          v353 = (void *)_NRCopyLogObjectForNRUUID();
                          uint64_t v377 = 3271;
                          id v378 = v350;
                          v375 = "";
                          v376 = "-[NRDDeviceConductor resumeLinkOfType:]";
                          _NRLogWithArgs();
                        }
                        [v350 start:v375, v376, v377, v378, v379, v380, v381];
                        goto LABEL_411;
                      }
                      if ([v350 state] != 8)
                      {
                        if ([v350 state] == 9)
                        {
                          v360 = (void *)_NRCopyLogObjectForNRUUID();
                          int v361 = _NRLogIsLevelEnabled();

                          if (v361)
                          {
                            v362 = (void *)_NRCopyLogObjectForNRUUID();
                            uint64_t v377 = 3288;
                            id v378 = v350;
                            v375 = "";
                            v376 = "-[NRDDeviceConductor resumeLinkOfType:]";
                            _NRLogWithArgs();
                          }
                          [v350 resume:v375, v376, v377, v378, v379, v380, v381];
                          goto LABEL_411;
                        }
                        [v350 setSuspendWhenReady:0];
                        v363 = (void *)_NRCopyLogObjectForNRUUID();
                        int v364 = _NRLogIsLevelEnabled();

                        if (v364)
                        {
                          v359 = (void *)_NRCopyLogObjectForNRUUID();
                          uint64_t v377 = 3284;
                          id v378 = v350;
                          v375 = "";
                          v376 = "-[NRDDeviceConductor resumeLinkOfType:]";
                          _NRLogWithArgs();
                          goto LABEL_403;
                        }
                      }
                    }
                    else
                    {
                      v357 = (void *)_NRCopyLogObjectForNRUUID();
                      int v358 = _NRLogIsLevelEnabled();

                      if (v358)
                      {
                        v359 = (void *)_NRCopyLogObjectForNRUUID();
                        uint64_t v377 = 3266;
                        id v378 = (id)createStringFromNRLinkType();
                        v375 = "";
                        v376 = "-[NRDDeviceConductor resumeLinkOfType:]";
                        _NRLogWithArgs();

LABEL_403:
                      }
                    }
LABEL_411:

                    sub_1000DCA2C((uint64_t)self);
                  }
LABEL_412:
                  long long v417 = 0u;
                  long long v418 = 0u;
                  long long v415 = 0u;
                  long long v416 = 0u;
                  v365 = self->_availableLinks;
                  id v366 = [(NSMutableSet *)v365 copy];

                  id v367 = [v366 countByEnumeratingWithState:&v415 objects:v444 count:16];
                  if (v367)
                  {
                    id v368 = v367;
                    uint64_t v369 = *(void *)v416;
                    do
                    {
                      for (n = 0; n != v368; n = (char *)n + 1)
                      {
                        if (*(void *)v416 != v369) {
                          objc_enumerationMutation(v366);
                        }
                        v371 = *(void **)(*((void *)&v415 + 1) + 8 * (void)n);
                        if (objc_msgSend(v371, "state", v375, v376, v377, v378) == 8)
                        {
                          v372 = +[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v371 type]);
                          if (![v398 containsObject:v372]
                            || [v371 subtype]
                            && (+[NSNumber numberWithUnsignedChar:](NSNumber, "numberWithUnsignedChar:", [v371 subtype]), v373 = objc_claimAutoreleasedReturnValue(), unsigned __int8 v374 = objc_msgSend(v404, "containsObject:", v373), v373, (v374 & 1) == 0))
                          {
                            [v371 checkPeerAvailabilityWithForceAggressive:1];
                          }

                          id v7 = v387;
                        }
                      }
                      id v368 = [v366 countByEnumeratingWithState:&v415 objects:v444 count:16];
                    }
                    while (v368);
                  }

                  v92 = v384;
                  int v18 = (id *)&unk_1001F4000;
                  id v17 = (void *)&unk_1001F4000;
                  id v190 = v398;
                  goto LABEL_195;
                }
                dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
                id v354 = sub_1000DC5BC((uint64_t)self, 2, 101);
                v355 = v354;
                if (v354 && [v354 state] == 8)
                {
                  id v356 = v355;
                }
                else
                {
                  id v356 = sub_1000DC5BC((uint64_t)self, 2, 102);

                  if (!v356 || [v356 state] != 8) {
                    goto LABEL_400;
                  }
                }
                sub_1000DBBF4((uint64_t)self);
LABEL_400:

                goto LABEL_412;
              }
              self = v409;
            }
            else
            {
              id v7 = v387;
              self = v409;
              v92 = v384;
            }
          }
          else
          {

            id v190 = 0;
            v92 = v384;
          }
        }
        else
        {

          id v190 = 0;
        }
LABEL_195:
        v197 = sub_1000261E8(v92, 14);
        v198 = [v197 firstObject];

        if (v198)
        {
          v199 = sub_1000261E8(v92, 14);
          v200 = [v199 firstObject];

          LOBYTE(block) = 0;
          if ([v200 length] && (objc_msgSend(v200, "getBytes:length:", &block, 1), (_BYTE)block))
          {
            if (block >= 0xBu)
            {
              if (block >= 0x15u)
              {
                if (block >= 0x1Fu) {
                  int v201 = block >= 0x29u ? 50 : 40;
                }
                else {
                  int v201 = 30;
                }
              }
              else
              {
                int v201 = 20;
              }
            }
            else
            {
              int v201 = 10;
            }
          }
          else
          {
            int v201 = 0;
          }

          self->_lastSeenPeerThermalPressure = v201;
          v92 = v384;
          if (self->_lastReportedPeerThermalPressure != v201) {
            sub_1000DFD74((uint64_t)self);
          }
        }
        v202 = sub_1000261E8(v92, 22);
        v203 = [v202 firstObject];

        if (v203)
        {
          v204 = sub_1000261E8(v92, 22);
          v205 = [v204 firstObject];

          if (v205 && [v205 length])
          {
            LOBYTE(block) = 0;
            [v205 getBytes:&block length:1];
            v206 = (block & 1) != 0 ? &__kCFBooleanTrue : &__kCFBooleanFalse;
          }
          else
          {
            v206 = 0;
          }

          unsigned int v207 = [v206 BOOLValue];
          self->_lastSeenPeerPluggedInState = v207;
          v92 = v384;
          if (v207 != self->_lastReportedPluggedInState) {
            sub_1000DFD74((uint64_t)self);
          }
        }
        v208 = sub_1000261E8(v92, 16);
        v209 = [v208 firstObject];

        if (v209) {
          goto LABEL_216;
        }
        v210 = sub_1000261E8(v92, 18);
        v211 = [v210 firstObject];

        if (v211) {
          goto LABEL_216;
        }
        v212 = sub_1000261E8(v92, 17);
        v213 = [v212 firstObject];

        if (v213
          || (v214 = sub_1000261E8(v92, 19),
              [v214 firstObject],
              v215 = objc_claimAutoreleasedReturnValue(),
              v214,
              v215,
              v215))
        {
LABEL_216:
          self;
          if (v17[444] != -1) {
            dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
          }
          v92 = v384;
          id v216 = v18[443];
          v413[0] = _NSConcreteStackBlock;
          v413[1] = 3221225472;
          v413[2] = sub_1000E64CC;
          v413[3] = &unk_1001C8840;
          v413[4] = self;
          v414 = v384;
          sub_10015969C((uint64_t)v216, v413);
        }
        v217 = sub_1000261E8(v92, 20);
        v218 = [v217 firstObject];

        id v397 = v190;
        if (v218)
        {
          v219 = sub_1000261E8(v92, 20);
          v220 = [v219 firstObject];

          if (self)
          {
            id v402 = v220;
            id v221 = sub_1000E6FA0(v220);
            v222 = (void *)_NRCopyLogObjectForNRUUID();
            int v223 = _NRLogIsLevelEnabled();

            if (v223)
            {
              v224 = (void *)_NRCopyLogObjectForNRUUID();
              uint64_t v377 = 8625;
              id v378 = v221;
              v375 = "";
              v376 = "-[NRDDeviceConductor handleIncomingResolveRequest:]";
              _NRLogWithArgs();
            }
            long long v454 = 0u;
            long long v453 = 0u;
            long long v452 = 0u;
            long long v451 = 0u;
            id v225 = v221;
            id v226 = [v225 countByEnumeratingWithState:&v451 objects:&block count:16];
            if (v226)
            {
              id v227 = v226;
              uint64_t v406 = *(void *)v452;
              do
              {
                for (ii = 0; ii != v227; ii = (char *)ii + 1)
                {
                  if (*(void *)v452 != v406) {
                    objc_enumerationMutation(v225);
                  }
                  v230 = *(void **)(*((void *)&v451 + 1) + 8 * (void)ii);
                  v231 = [v225 objectForKeyedSubscript:v230, v375, v376, v377, v378];
                  id v232 = objc_alloc_init((Class)NSMutableArray);
                  *(void *)&long long v464 = _NSConcreteStackBlock;
                  *((void *)&v464 + 1) = 3221225472;
                  *(void *)&long long v465 = sub_1000E7EC4;
                  *((void *)&v465 + 1) = &unk_1001C7668;
                  *(void *)&long long v466 = v232;
                  id v233 = v232;
                  nw_array_apply();
                  long long v455 = 0uLL;
                  v234 = +[NSUUID UUID];
                  [v234 getUUIDBytes:&v455];

                  [v230 UTF8String];
                  application_service = (void *)nw_endpoint_create_application_service();
                  nw_endpoint_set_public_keys();
                  sub_1000D601C((uint64_t)self, application_service);
                  asClient = self->_asClient;
                  id v237 = v230;
                  id v238 = application_service;
                  if (asClient && !asClient->_cancelled)
                  {
                    if (([(NSMutableArray *)asClient->_asNamesForIncomingResolveRequests containsObject:v237] & 1) == 0)[(NSMutableArray *)asClient->_asNamesForIncomingResolveRequests addObject:v237]; {
                    self;
                    }
                    if (qword_1001F4AE8 != -1) {
                      dispatch_once(&qword_1001F4AE8, &stru_1001C77F8);
                    }
                    v239 = (id *)qword_1001F4AE0;
                    v240 = v238;
                    v241 = v240;
                    if (!v239) {
                      goto LABEL_229;
                    }
                    if (v240)
                    {
                      if (nw_endpoint_get_type(v240) != (nw_endpoint_type_url|nw_endpoint_type_host))
                      {
                        if (qword_1001F4AF8 != -1) {
                          dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                        }
                        if (_NRLogIsLevelEnabled())
                        {
                          if (qword_1001F4AF8 != -1) {
                            dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                          }
                          uint64_t v377 = 625;
                          id v378 = v241;
                          v375 = "";
                          v376 = "-[NRApplicationServiceManager addIncomingResolveRequestForEndpoint:]";
                          _NRLogWithArgs();
                        }
                        goto LABEL_229;
                      }
                      id v229 = +[NSString stringWithUTF8String:nw_endpoint_get_application_service_name()];
                      [v239[7] setObject:v241 forKeyedSubscript:v229];
                      sub_100100A28(v239);
                    }
                    else
                    {
                      if (qword_1001F4AF8 != -1) {
                        dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                      }
                      id v242 = (id)qword_1001F4AF0;
                      int v243 = _NRLogIsLevelEnabled();

                      if (!v243) {
                        goto LABEL_229;
                      }
                      if (qword_1001F4AF8 != -1) {
                        dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                      }
                      id v229 = (id)qword_1001F4AF0;
                      v375 = "-[NRApplicationServiceManager addIncomingResolveRequestForEndpoint:]";
                      _NRLogWithArgs();
                    }

LABEL_229:
                  }

                  self = v409;
                }
                id v227 = [v225 countByEnumeratingWithState:&v451 objects:&block count:16];
              }
              while (v227);
            }

            sub_1000E714C((uint64_t)self, 1);
            id v190 = v397;
            v220 = v402;
          }

          id v7 = v387;
          v92 = v384;
        }
        v244 = sub_1000261E8(v92, 21);
        v245 = [v244 firstObject];

        if (v245)
        {
          v246 = sub_1000261E8(v92, 21);
          v247 = [v246 firstObject];

          id v248 = v247;
          if (self)
          {
            v249 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
            id v382 = v248;
            id v250 = sub_1000E6FA0(v248);
            v251 = (void *)_NRCopyLogObjectForNRUUID();
            int v252 = _NRLogIsLevelEnabled();

            if (v252)
            {
              v253 = (void *)_NRCopyLogObjectForNRUUID();
              _NRLogWithArgs();
            }
            long long v458 = 0u;
            long long v457 = 0u;
            long long v456 = 0u;
            long long v455 = 0u;
            id v254 = v250;
            id v407 = [v254 countByEnumeratingWithState:&v455 objects:&v451 count:16];
            if (v407)
            {
              id v403 = *(id *)v456;
              v255 = (void *)&unk_1001F4000;
              id v388 = v254;
              v389 = v249;
              do
              {
                uint64_t v256 = 0;
                do
                {
                  if (*(id *)v456 != v403) {
                    objc_enumerationMutation(v254);
                  }
                  v260 = *(void **)(*((void *)&v455 + 1) + 8 * v256);
                  v261 = self->_asClient;
                  v262 = v261;
                  uint64_t v411 = v256;
                  if (v261) {
                    asNamesForResolving = v261->_asNamesForResolving;
                  }
                  else {
                    asNamesForResolving = 0;
                  }
                  v264 = asNamesForResolving;
                  unsigned int v265 = [(NSMutableArray *)v264 containsObject:v260];

                  if (v265)
                  {
                    [(NSMutableDictionary *)self->_asNamesToResolvedEndpoints setObject:0 forKeyedSubscript:v260];
                    id v266 = objc_alloc_init((Class)NSMutableArray);
                    v267 = [v254 objectForKeyedSubscript:v260];
                    v437 = _NSConcreteStackBlock;
                    uint64_t v438 = 3221225472;
                    v439 = sub_1000E70B0;
                    v440 = &unk_1001C7640;
                    v441 = self;
                    v442 = v249;
                    id v443 = v266;
                    id v258 = v266;
                    nw_array_apply();
                    [(NSMutableDictionary *)self->_asNamesToResolvedEndpoints setObject:v258 forKeyedSubscript:v260];
                    v268 = self->_asClient;
                    id v259 = v260;
                    id v257 = v267;
                    if (v268 && !v268->_cancelled)
                    {
                      self;
                      if (qword_1001F4AE8 != -1) {
                        dispatch_once(&qword_1001F4AE8, &stru_1001C77F8);
                      }
                      uint64_t v269 = qword_1001F4AE0;
                      id v395 = v259;
                      id v270 = v259;
                      id v271 = v257;
                      v272 = v271;
                      if (v269)
                      {
                        if (v271)
                        {
                          dispatch_assert_queue_V2(*(dispatch_queue_t *)(v269 + 8));
                          id v273 = [*(id *)(v269 + 40) objectForKeyedSubscript:v270];
                          if ([v273 count])
                          {
                            id v391 = v257;
                            id obja = v258;
                            long long v466 = 0u;
                            long long v467 = 0u;
                            long long v464 = 0u;
                            long long v465 = 0u;
                            id v273 = v273;
                            id v274 = [v273 countByEnumeratingWithState:&v464 objects:&block count:16];
                            if (v274)
                            {
                              id v275 = v274;
                              uint64_t v276 = *(void *)v465;
                              do
                              {
                                for (jj = 0; jj != v275; jj = (char *)jj + 1)
                                {
                                  if (*(void *)v465 != v276) {
                                    objc_enumerationMutation(v273);
                                  }
                                  uint64_t v280 = *(void *)(*((void *)&v464 + 1) + 8 * (void)jj);
                                  if (!v280 || !*(unsigned char *)(v280 + 48))
                                  {
                                    if (v255[351] != -1) {
                                      dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                                    }
                                    if (_NRLogIsLevelEnabled())
                                    {
                                      if (v255[351] != -1) {
                                        dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                                      }
                                      id v278 = (id)qword_1001F4AF0;
                                      _NRLogWithArgs();

                                      v255 = &unk_1001F4000;
                                    }
                                    if (v280)
                                    {
                                      *(unsigned char *)(v280 + 48) = 1;
                                      uint64_t v279 = *(void *)(v280 + 56);
                                    }
                                    else
                                    {
                                      uint64_t v279 = 0;
                                    }
                                    (*(void (**)(uint64_t, void *))(v279 + 16))(v279, v272);
                                  }
                                }
                                id v275 = [v273 countByEnumeratingWithState:&v464 objects:&block count:16];
                              }
                              while (v275);
                            }

                            self = v409;
                            id v257 = v391;
                            id v258 = obja;
                          }
                          goto LABEL_265;
                        }
                        id v281 = v257;
                        if (v255[351] != -1) {
                          dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                        }
                        id v282 = (id)qword_1001F4AF0;
                        int v283 = _NRLogIsLevelEnabled();

                        id v257 = v281;
                        if (v283)
                        {
                          if (v255[351] != -1) {
                            dispatch_once(&qword_1001F4AF8, &stru_1001C7890);
                          }
                          id v273 = (id)qword_1001F4AF0;
                          _NRLogWithArgs();
LABEL_265:
                        }
                      }

                      id v259 = v395;
                      id v190 = v397;
                      id v254 = v388;
                      v249 = v389;
                    }
                  }
                  uint64_t v256 = v411 + 1;
                }
                while ((id)(v411 + 1) != v407);
                id v407 = [v254 countByEnumeratingWithState:&v455 objects:&v451 count:16];
              }
              while (v407);
            }

            sub_1000E714C((uint64_t)self, 1);
            id v7 = v387;
            id v248 = v382;
          }

          v92 = v384;
        }
        v284 = sub_1000261E8(v92, 23);
        v285 = [v284 firstObject];

        if (v285)
        {
          v286 = sub_1000261E8(v92, 23);
          v287 = [v286 firstObject];

          self;
          if (qword_1001F4A20 != -1) {
            dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
          }
          id v288 = (id)qword_1001F4A18;
          v289 = self->_nrUUID;
          sub_1000B8E90((uint64_t)v288, v287, v289);
        }
        goto LABEL_315;
      }
      block = 0;
      [v94 getBytes:&block length:8];
      char v95 = (char)block;
      v96 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
      v97 = v96;
      if (v96 && *((unsigned __int16 *)v96 + 14) >= 0x16u)
      {
        if ((v95 & 4) == 0)
        {
          if ((v95 & 8) == 0) {
            goto LABEL_107;
          }
          if (qword_1001F4AA8 != -1) {
            dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
          }
          if (!_NRLogIsLevelEnabled()) {
            goto LABEL_89;
          }
          if (qword_1001F4AA8 != -1) {
            dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
          }
          uint64_t v98 = 3977;
          goto LABEL_88;
        }
        if (qword_1001F4AA8 != -1) {
          dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4AA8 != -1) {
            dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
          }
          uint64_t v101 = 3974;
LABEL_103:
          uint64_t v377 = v101;
          v375 = "";
          v376 = "-[NRDDeviceConductor processReceivedRequestFlags:]";
          _NRLogWithArgs();
        }
      }
      else
      {
        if ((v95 & 2) == 0)
        {
          if ((v95 & 4) == 0) {
            goto LABEL_107;
          }
          if (qword_1001F4AA8 != -1) {
            dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
          }
          if (!_NRLogIsLevelEnabled()) {
            goto LABEL_89;
          }
          if (qword_1001F4AA8 != -1) {
            dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
          }
          uint64_t v98 = 3985;
LABEL_88:
          uint64_t v377 = v98;
          v375 = "";
          v376 = "-[NRDDeviceConductor processReceivedRequestFlags:]";
          _NRLogWithArgs();
LABEL_89:
          netInfo = self->_netInfo;
          if (netInfo)
          {
            char v100 = 0;
LABEL_106:
            netInfo->_disableCoalescing = v100;
            goto LABEL_107;
          }
          goto LABEL_107;
        }
        if (qword_1001F4AA8 != -1) {
          dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
        }
        if (_NRLogIsLevelEnabled())
        {
          if (qword_1001F4AA8 != -1) {
            dispatch_once(&qword_1001F4AA8, &stru_1001C76B0);
          }
          uint64_t v101 = 3982;
          goto LABEL_103;
        }
      }
      netInfo = self->_netInfo;
      if (netInfo)
      {
        char v100 = 1;
        goto LABEL_106;
      }
LABEL_107:

      v92 = v384;
      goto LABEL_108;
    }
    v49 = (void *)_NRCopyLogObjectForNRUUID();
    int v50 = _NRLogIsLevelEnabled();

    if (v50) {
      goto LABEL_33;
    }
  }
  else
  {
    v47 = (void *)_NRCopyLogObjectForNRUUID();
    int v48 = _NRLogIsLevelEnabled();

    if (v48)
    {
LABEL_33:
      v51 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
  }
LABEL_316:
}

- (void)linkIsUnavailable:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v4)
  {
    id v51 = sub_1000D8B78();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_81;
    }
    uint64_t v16 = sub_1000D8B78();
    goto LABEL_11;
  }
  BOOL isEnabled = self->_isEnabled;
  id v6 = (void *)_NRCopyLogObjectForNRUUID();
  int v7 = _NRLogIsLevelEnabled();

  if (!isEnabled)
  {
    if (!v7) {
      goto LABEL_81;
    }
    uint64_t v16 = (void *)_NRCopyLogObjectForNRUUID();
LABEL_11:
    _NRLogWithArgs();

    goto LABEL_81;
  }
  if (v7)
  {
    int v8 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v57 = 5822;
    id v59 = v4;
    int v53 = "";
    v55 = "-[NRDDeviceConductor linkIsUnavailable:]";
    _NRLogWithArgs();
  }
  id v9 = [v4 copyShortDescription:v53, v55, v57, v59];
  sub_1000D85E8((uint64_t)self, 1007, @"%@", v10, v11, v12, v13, v14, (uint64_t)v9);

  [(NSMutableSet *)self->_availableLinks removeObject:v4];
  if ([v4 type] == 1)
  {
    sub_1000E9FA4((uint64_t)self);
    self;
    if (qword_1001F4A20 != -1) {
      dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
    }
    id v15 = (id)qword_1001F4A18;
    v65[0] = _NSConcreteStackBlock;
    v65[1] = 3221225472;
    v65[2] = sub_1000EA0B8;
    v65[3] = &unk_1001C8BA8;
    v65[4] = self;
    sub_1000B7F50((uint64_t)v15, v65);
    goto LABEL_72;
  }
  if ([v4 type] != 2)
  {
    if ([v4 type] == 4)
    {
      quickRelayAgent = self->_quickRelayAgent;
      if (quickRelayAgent)
      {
        if (quickRelayAgent->_state.state != 1)
        {
          quickRelayAgent->_state.state = 1;
          -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
        }
      }
    }
    goto LABEL_73;
  }
  BOOL v17 = [v4 subtype] == 103 || [v4 subtype] == 102;
  id v15 = sub_1000DC5BC((uint64_t)self, 2, 102);
  id v19 = sub_1000DC5BC((uint64_t)self, 2, 103);
  if (v17)
  {
    if ([v4 startRequested])
    {
      if (!self->_peerDeviceIsNearby) {
        sub_1000EA280((uint64_t)self);
      }
      goto LABEL_29;
    }
  }
  else
  {
    if (([v15 state] == 255 || (objc_msgSend(v15, "startRequested") & 1) == 0)
      && ([v19 state] == 255 || !objc_msgSend(v19, "startRequested")))
    {
LABEL_29:
      if (self->_pendingPreferWiFiRequest) {
        sub_1000DC6FC((uint64_t)self, 2u);
      }
      if (self->_isPreferWiFiProvider)
      {
        if (self->_preferWiFiRequest && !self->_preferwiFiTimeoutSet)
        {
          char v20 = (void *)_NRCopyLogObjectForNRUUID();
          int v21 = _NRLogIsLevelEnabled();

          if (v21)
          {
            id v28 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v58 = 5892;
            v54 = "";
            v56 = "-[NRDDeviceConductor linkIsUnavailable:]";
            _NRLogWithArgs();
          }
          sub_1000DE254((uint64_t)self, @"Wi-Fi link went away", v22, v23, v24, v25, v26, v27, (uint64_t)v54);
          id v29 = sub_1000D8308((uint64_t)self);
          self->_pendingPreferWiFiRequest = sub_1001575D0((BOOL)v29);
        }
        if (self->_preferwiFiTimeoutSet)
        {
          v30 = (void *)_NRCopyLogObjectForNRUUID();
          int v31 = _NRLogIsLevelEnabled();

          if (v31)
          {
            id v32 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v58 = 5897;
            v54 = "";
            v56 = "-[NRDDeviceConductor linkIsUnavailable:]";
            _NRLogWithArgs();
          }
        }
      }
      if (self->_bringUpWiFiImmediately)
      {
        int v33 = (void *)_NRCopyLogObjectForNRUUID();
        int v34 = _NRLogIsLevelEnabled();

        if (v34)
        {
          uint64_t v35 = (void *)_NRCopyLogObjectForNRUUID();
          uint64_t v58 = 5903;
          v54 = "";
          v56 = "-[NRDDeviceConductor linkIsUnavailable:]";
          _NRLogWithArgs();
        }
        sub_1000DD714((uint64_t)self);
      }
      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      uint64_t v36 = self->_availableLinks;
      id v37 = [(NSMutableSet *)v36 countByEnumeratingWithState:&v61 objects:v66 count:16];
      if (v37)
      {
        id v38 = v37;
        id v39 = 0;
        uint64_t v40 = *(void *)v62;
        while (2)
        {
          id v41 = 0;
          v42 = v39;
          do
          {
            if (*(void *)v62 != v40) {
              objc_enumerationMutation(v36);
            }
            id v39 = *(id *)(*((void *)&v61 + 1) + 8 * (void)v41);

            if ([v39 type] == 1)
            {
              char v43 = 0;
              goto LABEL_55;
            }
            id v41 = (char *)v41 + 1;
            v42 = v39;
          }
          while (v38 != v41);
          id v38 = [(NSMutableSet *)v36 countByEnumeratingWithState:&v61 objects:v66 count:16];
          if (v38) {
            continue;
          }
          break;
        }
      }
      id v39 = 0;
      char v43 = 1;
LABEL_55:

      id v44 = sub_1000DC5BC((uint64_t)self, 2, 101);
      if ([v15 state] != 8 && objc_msgSend(v44, "state") != 8)
      {
        if ([v15 state] != 255
          && ([v15 startRequested] & 1) != 0
          || objc_msgSend(v44, "state", v54, v56, v58) != 255
          && [v44 startRequested])
        {
          sub_1000DBB24((uint64_t)self);
        }
        if ((v43 & 1) == 0)
        {
          v45 = (void *)_NRCopyLogObjectForNRUUID();
          int v46 = _NRLogIsLevelEnabled();

          if (v46)
          {
            v47 = self->_nrUUID;
            int v48 = (void *)_NRCopyLogObjectForNRUUID();
            uint64_t v58 = 5940;
            id v60 = v39;
            v54 = "";
            v56 = "-[NRDDeviceConductor linkIsUnavailable:]";
            _NRLogWithArgs();
          }
          if (objc_msgSend(v39, "state", v54, v56, v58, v60, (void)v61) == 9
            && !self->_preferwiFiTimeoutSet)
          {
            [v39 resume];
          }
          else if ([v39 state] == 1)
          {
            [v39 start];
          }
        }
      }

      goto LABEL_71;
    }
    sub_1000DBDE8((uint64_t)self);
  }
LABEL_71:

LABEL_72:
LABEL_73:
  queue = self->_queue;
  id v50 = v4;
  dispatch_assert_queue_V2(queue);
  [v50 removePolicies];

  sub_1000EA2CC((uint64_t)self);
  sub_1000DFD74((uint64_t)self);
  if ([v50 subtype] != 102
    && [v50 subtype] != 103
    && [v50 subtype] != 104
    && [v50 type] != 4
    || objc_msgSend(v50, "startRequested", v54))
  {
    sub_1000EA54C((uint64_t)self, self->_primaryLink);
  }
  if (objc_msgSend(v50, "startRequested", v54)) {
    sub_1000EA8DC((uint64_t)self);
  }
LABEL_81:
}

- (void)linkIsSuspended:(id)a3
{
  id v22 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v22)
  {
    if (!self->_isEnabled)
    {
      id v15 = (void *)_NRCopyLogObjectForNRUUID();
      int IsLevelEnabled = _NRLogIsLevelEnabled();

      if (!IsLevelEnabled) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    if ([v22 state] == 255)
    {
      BOOL v17 = (void *)_NRCopyLogObjectForNRUUID();
      int v18 = _NRLogIsLevelEnabled();

      if (!v18) {
        goto LABEL_15;
      }
      goto LABEL_13;
    }
    queue = self->_queue;
    id v5 = v22;
    dispatch_assert_queue_V2(queue);
    [v5 removePolicies];

    sub_1000EA2CC((uint64_t)self);
    sub_1000DFD74((uint64_t)self);
    if ([v5 type] == 4)
    {
      quickRelayAgent = self->_quickRelayAgent;
      if (quickRelayAgent)
      {
        if (quickRelayAgent->_state.state != 1)
        {
          quickRelayAgent->_state.state = 1;
          -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
        }
      }
    }
    id v7 = [v5 copyShortDescription];
    sub_1000D85E8((uint64_t)self, 1006, @"%@", v8, v9, v10, v11, v12, (uint64_t)v7);

    uint64_t v13 = (void *)_NRCopyLogObjectForNRUUID();
    int v14 = _NRLogIsLevelEnabled();

    if (v14)
    {
LABEL_13:
      id v19 = (void *)_NRCopyLogObjectForNRUUID();
LABEL_14:
      _NRLogWithArgs();
    }
  }
  else
  {
    id v20 = sub_1000D8B78();
    int v21 = _NRLogIsLevelEnabled();

    if (v21)
    {
      id v19 = sub_1000D8B78();
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)linkIsReady:(id)a3
{
  id v99 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v99)
  {
    id v88 = sub_1000D8B78();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (!IsLevelEnabled) {
      goto LABEL_112;
    }
    id v22 = sub_1000D8B78();
    _NRLogWithArgs();
LABEL_111:

    goto LABEL_112;
  }
  if (!self->_isEnabled)
  {
    id v20 = (void *)_NRCopyLogObjectForNRUUID();
    int v21 = _NRLogIsLevelEnabled();

    if (!v21) {
      goto LABEL_112;
    }
LABEL_19:
    id v22 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
    goto LABEL_111;
  }
  unsigned int v5 = [v99 state];
  id v6 = (void *)_NRCopyLogObjectForNRUUID();
  if (v5 == 255)
  {
    int v23 = _NRLogIsLevelEnabled();

    if (!v23) {
      goto LABEL_112;
    }
    goto LABEL_19;
  }
  int v7 = _NRLogIsLevelEnabled();

  if (v7)
  {
    uint64_t v8 = (void *)_NRCopyLogObjectForNRUUID();
    uint64_t v94 = 5683;
    id v96 = v99;
    dispatch_time_t v90 = "";
    v92 = "-[NRDDeviceConductor linkIsReady:]";
    _NRLogWithArgs();
  }
  id v9 = [v99 copyShortDescription:v90, v92, v94, v96];
  sub_1000D85E8((uint64_t)self, 1005, @"%@", v10, v11, v12, v13, v14, (uint64_t)v9);

  sub_1000ED3DC((uint64_t)self);
  sub_1000EE04C((uint64_t)self);
  if ([v99 suspendWhenReady])
  {
    id v15 = (void *)_NRCopyLogObjectForNRUUID();
    int v16 = _NRLogIsLevelEnabled();

    if (v16)
    {
      BOOL v17 = (void *)_NRCopyLogObjectForNRUUID();
      uint64_t v95 = 5689;
      id v97 = v99;
      v91 = "";
      v93 = "-[NRDDeviceConductor linkIsReady:]";
      _NRLogWithArgs();
    }
    [v99 setSuspendWhenReady:0, v91, v93, v95, v97];
    [v99 suspend];
  }
  if ([v99 type] == 1)
  {
    sub_1000DCA2C((uint64_t)self);
    sub_100034488((uint64_t)self->_quickRelayAgent);
    if (self->_alwaysOnWiFiQueryComplete && !self->_alwaysOnWiFiUpdateSent)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      if (!self->_isAlwaysReachableOverWiFi)
      {
        self->_alwaysOnWiFiQueryComplete = 1;
        dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
        id v18 = sub_1000DC5BC((uint64_t)self, 1, 0);
        id v19 = v18;
        if (v18) {
          self->_alwaysOnWiFiUpdateSent = sub_1000A79F4((uint64_t)v18);
        }
      }
    }
    sub_1000D6614(self);
  }
  else
  {
    if ([v99 type] == 2)
    {
      if ([v99 subtype] != 101) {
        goto LABEL_44;
      }
      id v24 = sub_1000DC5BC((uint64_t)self, 2, 102);
      if ([v24 startRequested] && !self->_needsAWDL) {
        [v24 cancelWithReason:@"not needed anymore"];
      }
      if (self->_preferWiFiRequest || (self->_effectiveALUAdvice & 4) != 0)
      {
        uint64_t v25 = self->_linkUpgradeReportWiFiInfra;
        if (v25) {
          v25->_flags |= 0x800u;
        }

        if ((self->_effectiveALUAdvice & 4) != 0)
        {
          currentALUAdviceID = self->_currentALUAdviceID;
          uint64_t v27 = self->_aluMonitor;
          sub_10006DB48(v27, currentALUAdviceID);
        }
      }
    }
    else
    {
      if ([v99 type] != 4) {
        goto LABEL_44;
      }
      quickRelayAgent = self->_quickRelayAgent;
      if (quickRelayAgent && quickRelayAgent->_state.state != 2)
      {
        quickRelayAgent->_state.state = 2;
        -[NWNetworkAgentRegistration updateNetworkAgent:](quickRelayAgent->_registrationObject, "updateNetworkAgent:");
      }
      id v29 = objc_alloc_init(NRLinkDirectorRequest);
      int v31 = v29;
      if (v29)
      {
        v29->_type = 8;
        v29->_allowsSuspendedLink = 0;
        v29->_requiredLinkType = 1;
      }
      newValue[0] = _NSConcreteStackBlock;
      newValue[1] = 3221225472;
      newValue[2] = sub_1000DF500;
      newValue[3] = &unk_1001C8BA8;
      newValue[4] = self;
      if (v29) {
        objc_setProperty_nonatomic_copy(v29, v30, newValue, 48);
      }
      sub_1000D6720((uint64_t)self, v31);

      dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
      id v24 = sub_1000DC5BC((uint64_t)self, 2, 101);
      if ([v24 state] == 8) {
        [v24 checkPeerAvailabilityWithForceAggressive:1];
      }
    }
  }
LABEL_44:
  sub_1000EE2E8((void **)&self->super.isa);
  sub_1000EE94C((char *)self, v99);
  id v32 = v99;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_helloMessageSent)
  {
    int v33 = (id *)sub_100025474([NRLinkDirectorMessage alloc], self->_nrUUID);
    int v34 = v33;
    if (v33)
    {
      objc_storeStrong(v33 + 3, a3);
      sub_100025B00((uint64_t)v34, 1, 0);
    }
    sub_100027090((uint64_t)v34);
    self->_helloMessageSent = 1;
  }
  sub_1000EA2CC((uint64_t)self);
  sub_1000F201C((uint64_t)self);
  if ([v32 type] == 1 && (sub_1000D81C8((uint64_t)self, 1) & 1) == 0)
  {
    sub_1000DE93C((uint64_t)self, 1);
  }
  else
  {
    uint64_t v35 = (void *)_NRCopyLogObjectForNRUUID();
    int v36 = _NRLogIsLevelEnabled();

    if (v36)
    {
      id v37 = (void *)_NRCopyLogObjectForNRUUID();
      uint64_t v95 = 5749;
      v91 = "";
      v93 = "-[NRDDeviceConductor linkIsReady:]";
      _NRLogWithArgs();
    }
  }
  sub_1000F3A20((uint64_t)self);
  sub_1000DFD74((uint64_t)self);
  sub_1000EA54C((uint64_t)self, v32);
  sub_1000E0F64((uint64_t)self, v32);
  sub_1000E0B98((uint64_t)self, v32);
  sub_1000E0D9C((uint64_t)self, v32);
  if (self->_hasPendingImmediateNetInfoUpdateMessage) {
    sub_1000E5B48((uint64_t)self);
  }
  sub_1000E83E0((unsigned int *)self);
  sub_1000E7F0C((uint64_t)self);
  BOOL isCurrentlyPairing = self->_isCurrentlyPairing;
  self->_BOOL isCurrentlyPairing = 0;
  if (isCurrentlyPairing && [v32 subtype] != 103)
  {
    discoveredEndpoint = self->_discoveredEndpoint;
    self->_discoveredEndpoint = 0;

    discoveryClient = self->_discoveryClient;
    if (discoveryClient)
    {
      sub_1001272AC((uint64_t)discoveryClient);
      v74 = self->_discoveryClient;
      self->_discoveryClient = 0;
    }
    sub_1000D8CD8((uint64_t)self, [v32 type:v91 subtype:v93], (char)[v32 subtype]);
LABEL_97:
    sub_1000F3EC0((uint64_t)self);
    if (!self->_isProxyClient) {
      goto LABEL_112;
    }
    goto LABEL_98;
  }
  if ((sub_1000D95DC((uint64_t)self) & 1) == 0) {
    goto LABEL_97;
  }
  long long v109 = 0u;
  long long v110 = 0u;
  long long v107 = 0u;
  long long v108 = 0u;
  id obj = self->_availableLinks;
  id v39 = [(NSMutableSet *)obj countByEnumeratingWithState:&v107 objects:newValue count:16];
  if (v39)
  {
    id v40 = v39;
    id v41 = &objc_sync_exit_ptr;
    uint64_t v42 = *(void *)v108;
    uint64_t v100 = *(void *)v108;
    uint64_t v101 = self;
    do
    {
      for (i = 0; i != v40; i = (char *)i + 1)
      {
        if (*(void *)v108 != v42) {
          objc_enumerationMutation(obj);
        }
        id v44 = *(void **)(*((void *)&v107 + 1) + 8 * i);
        if (objc_msgSend(v44, "state", v91, v93, v95, v97, v98) != 8)
        {
          id v45 = v40;
          int v46 = v41;
          long long v105 = 0u;
          long long v106 = 0u;
          long long v103 = 0u;
          long long v104 = 0u;
          v47 = self->_availableLinks;
          id v48 = [(NSMutableSet *)v47 countByEnumeratingWithState:&v103 objects:v111 count:16];
          if (v48)
          {
            id v49 = v48;
            uint64_t v50 = *(void *)v104;
LABEL_70:
            uint64_t v51 = 0;
            while (1)
            {
              if (*(void *)v104 != v50) {
                objc_enumerationMutation(v47);
              }
              v52 = *(void **)(*((void *)&v103 + 1) + 8 * v51);
              unsigned int v53 = [v52 type];
              if (v53 == [v44 type])
              {
                unsigned int v54 = [v52 subtype];
                if (v54 == [v44 subtype] && objc_msgSend(v52, "state") == 8) {
                  break;
                }
              }
              if (v49 == (id)++v51)
              {
                id v49 = [(NSMutableSet *)v47 countByEnumeratingWithState:&v103 objects:v111 count:16];
                if (!v49) {
                  goto LABEL_78;
                }
                goto LABEL_70;
              }
            }

            id v41 = v46;
            id v40 = v45;
            uint64_t v42 = v100;
            self = v101;
          }
          else
          {
LABEL_78:

            unsigned int v55 = [v44 type];
            unsigned int v56 = [v44 subtype];
            self = v101;
            id v41 = v46;
            id v40 = v45;
            uint64_t v42 = v100;
            if (!sub_1000D95DC((uint64_t)v101)) {
              continue;
            }
            unsigned int v57 = (v56 - 101);
            if (v57 >= 4)
            {
              if (v55 >= 6 || (unint64_t v58 = 0x40300020100uLL >> (8 * v55), !(_BYTE)v58))
              {
LABEL_89:
                v69 = (void *)_NRCopyLogObjectForNRUUID();
                int v70 = _NRLogIsLevelEnabled();

                if (v70)
                {
                  v71 = (void *)_NRCopyLogObjectForNRUUID();
                  id v97 = (id)v55;
                  uint64_t v98 = v56;
                  uint64_t v95 = 7546;
                  v91 = "";
                  v93 = "-[NRDDeviceConductor stopDiscoveryOverLinkType:subtype:]";
                  _NRLogWithArgs();
                }
                continue;
              }
            }
            else
            {
              LODWORD(v58) = 0x7060502u >> (8 * v57);
              if (!(_BYTE)v58) {
                goto LABEL_89;
              }
            }
            uint64_t v59 = (uint64_t)v101->_discoveryClient;
            if (v59)
            {
              id v60 = *(void **)(v59 + 104);
              long long v61 = [v41[219] numberWithUnsignedChar:v58];
              [v60 removeObject:v61];

              if (*(unsigned char *)(v59 + 19))
              {
                if (*(unsigned char *)(v59 + 20))
                {
                  long long v62 = v41[219];
                  id v63 = *(id *)(v59 + 168);
                  long long v64 = [v62 numberWithUnsignedChar:v58];
                  v65 = [v63 objectForKeyedSubscript:v64];

                  if (v65)
                  {
                    nw_browser_cancel(v65);
                    v66 = v41[219];
                    id v67 = *(id *)(v59 + 168);
                    v68 = [v66 numberWithUnsignedChar:v58];
                    [v67 setObject:0 forKeyedSubscript:v68];
                  }
                  sub_10012AE8C(v59, v58);
                  self = v101;
                }
              }
            }
          }
        }
      }
      id v40 = [(NSMutableSet *)obj countByEnumeratingWithState:&v107 objects:newValue count:16];
    }
    while (v40);
  }

  sub_1000F3EC0((uint64_t)self);
  if (self && self->_isProxyClient)
  {
LABEL_98:
    v75 = sub_10013DC5C((uint64_t)NRDLocalDevice, self->_nrUUID);
    id v22 = v75;
    if (v75) {
      id v76 = (void *)*((void *)v75 + 16);
    }
    else {
      id v76 = 0;
    }
    id v77 = v76;
    unsigned int v78 = [v77 usesTLS];

    if (v78)
    {
      self;
      if (qword_1001F4A20 != -1) {
        dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
      }
      id v79 = (id)qword_1001F4A18;
      v80 = v79;
      if (v79) {
        v81 = (void *)*((void *)v79 + 13);
      }
      else {
        v81 = 0;
      }
      id v82 = v81;

      if (v82)
      {
        v83 = sub_100025474([NRLinkDirectorMessage alloc], self->_nrUUID);
        self;
        if (qword_1001F4A20 != -1) {
          dispatch_once(&qword_1001F4A20, &stru_1001C6EC8);
        }
        id v84 = (id)qword_1001F4A18;
        id v85 = v84;
        if (v84) {
          id v86 = (void *)*((void *)v84 + 13);
        }
        else {
          id v86 = 0;
        }
        id v87 = v86;
        sub_100025B00((uint64_t)v83, 23, v87);

        sub_100027090((uint64_t)v83);
      }
    }
    goto LABEL_111;
  }
LABEL_112:
}

- (void)linkIsAvailable:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (self->_isEnabled)
    {
      unsigned int v5 = [v4 state];
      id v6 = (void *)_NRCopyLogObjectForNRUUID();
      if (v5 != 255)
      {
        int IsLevelEnabled = _NRLogIsLevelEnabled();

        if (IsLevelEnabled)
        {
          uint64_t v8 = self->_nrUUID;
          id v9 = (void *)_NRCopyLogObjectForNRUUID();
          _NRLogWithArgs();
        }
        id v10 = [v4 copyShortDescription];
        sub_10012F648(self->_nrUUID, 1004, 0, v10);

        [(NSMutableSet *)self->_availableLinks addObject:v4];
        [v4 setPolicyIdentifierString:self->_policyIdentifier];
        [v4 setIsCompanionLink:self->_isCompanionLink];
        sub_1000DADDC((uint64_t)self, v4);
        switch([v4 type])
        {
          case 0u:
            id v52 = sub_1000D8B78();
            int v53 = _NRLogIsLevelEnabled();

            if (v53)
            {
              id v54 = sub_1000D8B78();
              _NRLogWithArgs();
            }
            self = (NRDDeviceConductor *)_os_log_pack_size();
            uint64_t v25 = (char *)block - ((__chkstk_darwin(self) + 15) & 0xFFFFFFFFFFFFFFF0);
            __error();
            uint64_t v55 = _os_log_pack_fill();
            *(_DWORD *)uint64_t v55 = 136446466;
            *(void *)(v55 + 4) = "-[NRDDeviceConductor linkIsAvailable:]";
            *(_WORD *)(v55 + 12) = 2112;
            *(void *)(v55 + 14) = v4;
            sub_1000D8B78();
            _NRLogAbortWithPack();
            goto LABEL_78;
          case 1u:
            if (!self->_isPreferWiFiProvider) {
              goto LABEL_56;
            }
            if (self->_preferWiFiRequest) {
              [v4 setSuspendWhenReady:1];
            }
            self;
            if (qword_1001F4DE0 != -1) {
              dispatch_once(&qword_1001F4DE0, &stru_1001C8A30);
            }
            id v11 = (id)qword_1001F4DD8;
            uint64_t v12 = v11;
            if (!v11) {
              goto LABEL_49;
            }
            dispatch_assert_queue_V2(*((dispatch_queue_t *)v11 + 2));
            if (!v12[10])
            {
              v12[10] = 1;
              if (v12[8] == 4)
              {
                sub_100158FD0((uint64_t)v12);
                if (v12[9])
                {
                  v12[8] = 3;
                  sub_100159248((uint64_t)v12);
                }
              }
            }
            if ((v12[8] & 0xFD) != 1)
            {
LABEL_49:

              goto LABEL_56;
            }
            int latestPreferWiFiRequestType = self->_latestPreferWiFiRequestType;
            if (latestPreferWiFiRequestType == 2)
            {
            }
            else
            {

              if (latestPreferWiFiRequestType != 3) {
                goto LABEL_56;
              }
            }
            if (self->_latestPreferWiFiRequestType == 2)
            {
              int v31 = sub_1000D8308((uint64_t)self);
              BOOL v32 = sub_1001575D0((BOOL)v31);
            }
            else
            {
              BOOL v32 = 0;
            }
            v64[0] = _NSConcreteStackBlock;
            v64[1] = 3221225472;
            v64[2] = sub_1000F695C;
            v64[3] = &unk_1001C7530;
            v64[4] = self;
            BOOL v65 = v32;
            sub_1000DB33C((uint64_t)self, v32, 0, 0, 1, v64);
LABEL_56:
            int v33 = (void *)_NRCopyLogObjectForNRUUID();
            int v34 = _NRLogIsLevelEnabled();

            if (v34)
            {
              uint64_t v35 = (void *)_NRCopyLogObjectForNRUUID();
              _NRLogWithArgs();
            }
LABEL_58:
            [v4 start];
            goto LABEL_59;
          case 2u:
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              id v48 = (unsigned __int8 *)sub_1000AB38C();
              if (!v48 || (int v49 = v48[8], v48, !v49))
              {
                uint64_t v50 = (void *)_NRCopyLogObjectForNRUUID();
                int v51 = _NRLogIsLevelEnabled();

                if (v51)
                {
                  StringFromNRLinkType = self->_nrUUID;
                  int v23 = (void *)_NRCopyLogObjectForNRUUID();
LABEL_27:
                  _NRLogWithArgs();
                }
                goto LABEL_59;
              }
            }
            uint64_t v25 = (char *)v4;
            if ([v25 subtype] == 101)
            {
              dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
              if (self->_isAlwaysReachableOverWiFi)
              {
                uint64_t v26 = objc_alloc_init(NRLinkDirectorRequest);
                uint64_t v27 = v26;
                if (v26)
                {
                  v26->_type = 1;
                  v26->_requiredLinkType = 1;
                  *(_WORD *)&v26->_attemptImmediately = 257;
                }
                sub_1000D6720((uint64_t)self, v26);
              }
            }
            if (self->_isPreferWiFiProvider && !self->_isCoalescingLinkUpgradeRequest)
            {
              if (self->_supportsNAN || self->_supportsAWDL) {
                int64_t v28 = 5000000000;
              }
              else {
                int64_t v28 = 1000000000;
              }
              self->_isCoalescingLinkUpgradeRequest = 1;
              dispatch_time_t v29 = dispatch_time(0x8000000000000000, v28);
              queue = self->_queue;
              block[0] = _NSConcreteStackBlock;
              block[1] = 3221225472;
              block[2] = sub_1000F6A48;
              block[3] = &unk_1001C8BA8;
              block[4] = self;
              dispatch_after(v29, queue, block);
            }
            if ([v25 subtype] == 102)
            {
              if (self->_isCompanionLink) {
                sub_1000DC04C((uint64_t)self);
              }
              else {
                sub_1000DD8F8(self);
              }
              goto LABEL_43;
            }
            if ([v25 subtype] == 103 || objc_msgSend(v25, "subtype") == 104) {
              goto LABEL_48;
            }
            if ([v25 subtype] == 101)
            {
              if (self->_isAlwaysReachableOverWiFi || !self->_isCompanionLink)
              {
LABEL_48:
                [v25 start];

LABEL_59:
                sub_1000F3A20((uint64_t)self);
                sub_1000DFD74((uint64_t)self);
                goto LABEL_60;
              }
              id v40 = (unsigned __int8 *)sub_1000AB38C();
              if (v40)
              {
                int v41 = v40[8];

                if (v41)
                {
                  uint64_t v42 = (void *)_NRCopyLogObjectForNRUUID();
                  int v43 = _NRLogIsLevelEnabled();

                  if (v43)
                  {
                    id v44 = (void *)_NRCopyLogObjectForNRUUID();
                    _NRLogWithArgs();
                  }
                  goto LABEL_48;
                }
              }
LABEL_78:
              if (self->_pendingPreferWiFiRequest || self->_preferWiFiRequest || self->_bringUpWiFiImmediately)
              {
                unsigned int v56 = sub_1000D8308((uint64_t)self);
                unsigned int v57 = sub_1001558C0((uint64_t)v56, self->_nrUUID);

                if (v57)
                {
                  sub_1000DC04C((uint64_t)self);
                }
                else
                {
                  unint64_t v58 = (void *)_NRCopyLogObjectForNRUUID();
                  int v59 = _NRLogIsLevelEnabled();

                  if (v59)
                  {
                    id v60 = (void *)_NRCopyLogObjectForNRUUID();
                    _NRLogWithArgs();
                  }
                }
              }
              else
              {
                long long v61 = (void *)_NRCopyLogObjectForNRUUID();
                int v62 = _NRLogIsLevelEnabled();

                if (!v62) {
                  goto LABEL_43;
                }
                unsigned int v57 = (void *)_NRCopyLogObjectForNRUUID();
                _NRLogWithArgs();
              }
            }
            else
            {
              int v36 = (void *)_NRCopyLogObjectForNRUUID();
              int v37 = _NRLogIsLevelEnabled();

              if (v37)
              {
                id v38 = self->_nrUUID;
                id v39 = (void *)_NRCopyLogObjectForNRUUID();
                _NRLogWithArgs();

                goto LABEL_59;
              }
            }
LABEL_43:

            goto LABEL_59;
          case 3u:
            id v20 = (void *)_NRCopyLogObjectForNRUUID();
            int v21 = _NRLogIsLevelEnabled();

            if (!v21) {
              goto LABEL_59;
            }
            id v22 = self->_nrUUID;
            int v23 = (void *)_NRCopyLogObjectForNRUUID();
            [v4 type];

            StringFromNRLinkType = (NSUUID *)createStringFromNRLinkType();
            goto LABEL_27;
          case 4u:
            sub_1000DF254((uint64_t)self);
            goto LABEL_59;
          case 5u:
            goto LABEL_58;
          default:
            goto LABEL_59;
        }
      }
      int v17 = _NRLogIsLevelEnabled();

      if (v17)
      {
        id v18 = self->_nrUUID;
        id v19 = (void *)_NRCopyLogObjectForNRUUID();
        _NRLogWithArgs();
      }
    }
    else
    {
      uint64_t v14 = (void *)_NRCopyLogObjectForNRUUID();
      int v15 = _NRLogIsLevelEnabled();

      if (v15)
      {
        int v16 = (void *)_NRCopyLogObjectForNRUUID();
        _NRLogWithArgs();
      }
    }
  }
  else
  {
    id v45 = sub_1000D8B78();
    int v46 = _NRLogIsLevelEnabled();

    if (v46)
    {
      id v47 = sub_1000D8B78();
      _NRLogWithArgs();
    }
  }
LABEL_60:
}

- (void)didStopTrackingAllNOIs:(id)a3
{
  id v4 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  if (self)
  {
    aluMonitor = self->_aluMonitor;
    if (aluMonitor && ![(NRAutoLinkUpgradeMonitor *)self->_aluMonitor cancelled])
    {
      [(NRAutoLinkUpgradeMonitor *)aluMonitor setCancelled:1];
      [(NRAutoLinkUpgradeMonitor *)aluMonitor setUpdateBlock:0];
      [(NRAutoLinkUpgradeMonitor *)aluMonitor invalidateAggregateStatsTimerSource];
      [(NRAutoLinkUpgradeMonitor *)aluMonitor reportEvent:30003];
    }
    linkUpgradeReportWiFiInfra = self->_linkUpgradeReportWiFiInfra;
    self->_linkUpgradeReportWiFiInfra = 0;

    linkUpgradeReportForBTClassic = self->_linkUpgradeReportForBTClassic;
    self->_linkUpgradeReportForBTClassic = 0;

    *(_OWORD *)&self->_effectiveALUAdvice = 0u;
    sub_1000F6E14(self);
  }
}

- (void)didStartTrackingNOI:(id)a3
{
  if (!self || !self->_isEnabled || !self->_aluSupported) {
    return;
  }
  id v4 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v6 = (void *)_NRCopyLogObjectForNRUUID();
    _NRLogWithArgs();
  }
  int v7 = [NRAutoLinkUpgradeMonitor alloc];
  nrUUID = self->_nrUUID;
  id v9 = self->_queue;
  id v10 = (NRAutoLinkUpgradeMonitor *)sub_10006D9A4((id *)&v7->super.isa, v9, nrUUID);

  id v11 = self->_aluMonitor;
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = self->_aluMonitor;
    uint64_t v14 = v13;
    if (v13 && (int v15 = v13->_lastReceivedAdviceID) != 0)
    {
      int v16 = v15;
      aluMonitor = self->_aluMonitor;
      if (aluMonitor) {
        aluMonitor = (NRAutoLinkUpgradeMonitor *)aluMonitor->_lastReceivedAdviceID;
      }
      id v18 = aluMonitor;
      id v19 = [(NRAutoLinkUpgradeMonitor *)v18 unsignedLongLongValue];

      if (!v19) {
        goto LABEL_17;
      }
      id v20 = (void *)_NRCopyLogObjectForNRUUID();
      int v21 = _NRLogIsLevelEnabled();

      if (!v21) {
        goto LABEL_17;
      }
      uint64_t v12 = (void *)_NRCopyLogObjectForNRUUID();
      _NRLogWithArgs();
    }
    else
    {
    }
  }
LABEL_17:
  id v22 = self->_aluMonitor;
  self->_aluMonitor = v10;
}

- (void)didUpdateDNSProxyState:(id)a3 state:(unsigned __int8)a4
{
  unsigned int v4 = a4;
  id v6 = (NRDiscoveryProxyServer *)a3;
  if (!v6) {
    goto LABEL_26;
  }
  int v7 = (void *)_NRCopyLogObjectForNRUUID();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v9 = (void *)_NRCopyLogObjectForNRUUID();
    int v34 = v6;
    uint64_t v35 = v4;
    uint64_t v33 = 4617;
    int v31 = "";
    BOOL v32 = "-[NRDDeviceConductor didUpdateDNSProxyState:state:]";
    _NRLogWithArgs();
  }
  if (v4 != 4 && v4 != 2) {
    goto LABEL_26;
  }
  if (!self)
  {
    uint64_t v12 = 0;
    discoveryProxyClient = 0;
    goto LABEL_11;
  }
  id v10 = self->_dnsProxyServer;
  if (v10 == (NRDNSProxyServer *)v6)
  {

LABEL_18:
    id v17 = objc_alloc_init((Class)NSMutableData);
    sub_1000F74DC((uint64_t)self, v6, v17);
    id v18 = sub_100025528([NRLinkDirectorMessage alloc], self->_nrUUID);
    id v19 = v18;
    if ((NRDiscoveryProxyServer *)self->_dnsProxyServer == v6)
    {
      sub_100025B00((uint64_t)v18, 17, v17);
      if (v4 != 4)
      {
LABEL_25:
        sub_100027090((uint64_t)v19);

        goto LABEL_26;
      }
      p_dnsProxyServer = (id *)&self->_dnsProxyServer;
    }
    else
    {
      if (self->_discoveryProxyServer != v6) {
        goto LABEL_25;
      }
      sub_100025B00((uint64_t)v18, 19, v17);
      if (v4 != 4) {
        goto LABEL_25;
      }
      p_dnsProxyServer = (id *)&self->_discoveryProxyServer;
    }
    [*p_dnsProxyServer cancel:v31, v32, v33, v34, v35];
    id v21 = *p_dnsProxyServer;
    id *p_dnsProxyServer = 0;

    goto LABEL_25;
  }
  discoveryProxyServer = self->_discoveryProxyServer;

  if (discoveryProxyServer == v6) {
    goto LABEL_18;
  }
  uint64_t v12 = self->_dnsProxyClient;
  if (v12 != (NRDNSProxyClient *)v6)
  {
    discoveryProxyClient = self->_discoveryProxyClient;
LABEL_11:

    if (discoveryProxyClient != (NRDNSProxyClient *)v6) {
      goto LABEL_26;
    }
    if (v4 != 2)
    {
LABEL_13:
      uint64_t v14 = [NRLinkDirectorMessage alloc];
      if (self)
      {
        int v15 = (NSMutableSet *)sub_100025528(v14, self->_nrUUID);
        int v16 = v15;
        if ((NRDiscoveryProxyServer *)self->_dnsProxyClient == v6)
        {
          sub_100025FA0((uint64_t)v15, 16, 0);
          sub_1000F765C((uint64_t)self);
        }
        else if ((NRDiscoveryProxyServer *)self->_discoveryProxyClient == v6)
        {
          sub_100025FA0((uint64_t)v15, 18, 0);
          sub_1000F7670((uint64_t)self);
        }
      }
      else
      {
        int v16 = (NSMutableSet *)sub_100025528(v14, 0);
      }
      sub_100027090((uint64_t)v16);
      [(NRDiscoveryProxyServer *)v6 cancel];
LABEL_44:

      goto LABEL_26;
    }
    goto LABEL_28;
  }

  if (v4 != 2) {
    goto LABEL_13;
  }
LABEL_28:
  if (self && (NRDiscoveryProxyServer *)self->_dnsProxyClient == v6)
  {
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    int v16 = self->_availableLinks;
    id v22 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v37;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(void *)v37 != v24) {
            objc_enumerationMutation(v16);
          }
          int64_t v28 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if (objc_msgSend(v28, "ikeClassDEstablished", v31, v32, v33, v34, v35))
          {
            dispatch_time_t v29 = self->_dnsProxyClient;
            v30 = v29;
            if (v29) {
              serverEndpoint = v29->super._serverEndpoint;
            }
            else {
              serverEndpoint = 0;
            }
            uint64_t v27 = serverEndpoint;
            [v28 publishDNSConfig:v27];
          }
        }
        id v23 = [(NSMutableSet *)v16 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v23);
    }
    goto LABEL_44;
  }
LABEL_26:
}

- (void)processAppStateChanged:(id)a3
{
  id v4 = a3;
  if (self) {
    queue = self->_queue;
  }
  else {
    queue = 0;
  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F7728;
  v7[3] = &unk_1001C8840;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

- (NSString)description
{
  id v3 = objc_alloc((Class)NSString);
  if (self) {
    nrUUID = self->_nrUUID;
  }
  else {
    nrUUID = 0;
  }
  unsigned int v5 = [(NSUUID *)nrUUID UUIDString];
  id v6 = [v3 initWithFormat:@"Conductor[%@]", v5];

  return (NSString *)v6;
}

@end