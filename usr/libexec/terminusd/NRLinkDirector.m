@interface NRLinkDirector
- (BOOL)perpetualStandaloneMeadowEnabledForNRUUID:(id)a3;
- (BOOL)preferWiFiP2PRequestUpdated;
- (BOOL)preferWiFiRequestAvailable;
- (BOOL)preferWiFiRequestUnavailable;
- (void)apsIsConnected:(BOOL)a3;
- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3;
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
@end

@implementation NRLinkDirector

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsDeviceIDCompletionBlocks, 0);
  objc_storeStrong((id *)&self->_nrUUIDToSPKIs, 0);
  objc_storeStrong((id *)&self->_localIdentity, 0);
  objc_storeStrong((id *)&self->_vpnProviderUUIDs, 0);
  objc_storeStrong((id *)&self->_appVPNAppUUIDs, 0);
  objc_storeStrong((id *)&self->_appVPNAgentUUID, 0);
  objc_storeStrong((id *)&self->_appVPNEvaluator, 0);
  objc_storeStrong((id *)&self->_perpetualStandaloneMeadowCellObserver, 0);
  objc_storeStrong((id *)&self->_perpetualStandaloneMeadowWiFiObserver, 0);
  objc_storeStrong((id *)&self->_fdUsageMonitorSource, 0);
  objc_storeStrong((id *)&self->_xpcCommExecUUID, 0);
  objc_storeStrong((id *)&self->_wifiManagerAvailableBlocks, 0);
  objc_storeStrong((id *)&self->_ephemeralDeviceConnections, 0);
  objc_storeStrong((id *)&self->_orphanedDevicePreferencesConnections, 0);
  objc_storeStrong((id *)&self->_orphanedDeviceMonitorConnections, 0);
  objc_storeStrong((id *)&self->_conductors, 0);
  objc_storeStrong((id *)&self->_phoneCallRelayAgent, 0);
  objc_storeStrong((id *)&self->_testServer, 0);
  objc_storeStrong((id *)&self->_onDemandLinkSetupManager, 0);
  objc_storeStrong((id *)&self->_fixedInterfaceManager, 0);
  objc_storeStrong((id *)&self->_shoesProxyAnalytics, 0);
  objc_storeStrong((id *)&self->_shoesProxyAnalyticsTimerSource, 0);
  objc_storeStrong((id *)&self->_masqueProxyTokenCache, 0);
  objc_storeStrong((id *)&self->_masqueServer, 0);
  objc_storeStrong((id *)&self->_socksServer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_persistentKeyReference, 0);
  objc_storeStrong((id *)&self->_persistentIdentityReference, 0);
  objc_storeStrong((id *)&self->_persistentCertificateReference, 0);
  objc_storeStrong((id *)&self->_spkiForLocalIdentity, 0);
  objc_storeStrong((id *)&self->_preferWiFiAgent, 0);
  objc_storeStrong((id *)&self->_fixedInterfacePeerIDSDeviceID, 0);
  objc_storeStrong((id *)&self->_fixedInterfacePeerAddressStr, 0);
  objc_storeStrong((id *)&self->_fixedInterfaceName, 0);
  objc_storeStrong((id *)&self->_wiredManager, 0);
  objc_storeStrong((id *)&self->_quickRelayManager, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);

  objc_storeStrong((id *)&self->_bluetoothManager, 0);
}

- (BOOL)perpetualStandaloneMeadowEnabledForNRUUID:(id)a3
{
  id v4 = a3;
  if (_NRIsAppleInternal())
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0;
    }
    v6 = [(NSMutableDictionary *)conductors objectForKeyedSubscript:v4];
    if (v6) {
      BOOL v7 = v6[11] & 1;
    }
    else {
      BOOL v7 = 0;
    }
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)localAWDLEndpointChanged:(id)a3
{
  id v4 = a3;
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    conductors = self->_conductors;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    conductors = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
  }
  v6 = conductors;
  id v7 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    if (self)
    {
      do
      {
        v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v14 + 1) + 8 * (void)v10), (void)v14);
          [v11 localAWDLEndpointChanged:v4];

          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
    else
    {
      do
      {
        v12 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v13 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * (void)v12)][v14];
          [v13 localAWDLEndpointChanged:v4];

          v12 = (char *)v12 + 1;
        }
        while (v8 != v12);
        id v8 = [(NSMutableDictionary *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }
  }
}

- (void)directToCloudRequestUnavailable
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    conductors = self->_conductors;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    conductors = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v4 = conductors;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    if (self)
    {
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v9 directToCloudRequestUnavailable];
        }
        id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      do
      {
        for (j = 0; j != v6; j = (char *)j + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v11 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)j), (void)v12];
          [v11 directToCloudRequestUnavailable];
        }
        id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (void)directToCloudRequestAvailable
{
  if (self)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    conductors = self->_conductors;
  }
  else
  {
    dispatch_assert_queue_V2(0);
    conductors = 0;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
  }
  id v4 = conductors;
  id v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    if (self)
    {
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
          [v9 directToCloudRequestAvailable];
        }
        id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
    else
    {
      do
      {
        for (j = 0; j != v6; j = (char *)j + 1)
        {
          if (*(void *)v13 != v7) {
            objc_enumerationMutation(v4);
          }
          v11 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v12 + 1) + 8 * (void)j), (void)v12];
          [v11 directToCloudRequestAvailable];
        }
        id v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v6);
    }
  }
}

- (BOOL)preferWiFiP2PRequestUpdated
{
  v3 = sub_10015BD9C();
  dispatch_assert_queue_V2(v3);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0;
  }
  id v5 = conductors;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          unsigned __int8 v12 = [v11 preferWiFiP2PRequestUpdated];

          v9 &= v12;
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      do
      {
        for (j = 0; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v15 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)j) withObject:v17];
          unsigned __int8 v16 = [v15 preferWiFiP2PRequestUpdated];

          v9 &= v16;
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)preferWiFiRequestUnavailable
{
  v3 = sub_10015BD9C();
  dispatch_assert_queue_V2(v3);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0;
  }
  id v5 = conductors;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          unsigned __int8 v12 = [v11 preferWiFiRequestUnavailable];

          v9 &= v12;
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      do
      {
        for (j = 0; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v15 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)][v17];
          unsigned __int8 v16 = [v15 preferWiFiRequestUnavailable];

          v9 &= v16;
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (BOOL)preferWiFiRequestAvailable
{
  v3 = sub_10015BD9C();
  dispatch_assert_queue_V2(v3);

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0;
  }
  id v5 = conductors;
  id v6 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v18;
    char v9 = 1;
    if (self)
    {
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          v11 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
          unsigned __int8 v12 = [v11 preferWiFiRequestAvailable];

          v9 &= v12;
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
    else
    {
      do
      {
        for (j = 0; j != v7; j = (char *)j + 1)
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v15 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v17 + 1) + 8 * (void)j)][v17];
          unsigned __int8 v16 = [v15 preferWiFiRequestAvailable];

          v9 &= v16;
        }
        id v7 = [(NSMutableDictionary *)v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }
  }
  else
  {
    char v9 = 1;
  }

  return v9;
}

- (void)apsIsConnected:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10015BD9C();
  dispatch_assert_queue_V2(v5);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0;
  }
  id v7 = conductors;
  id v8 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v16;
    if (self)
    {
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          unsigned __int8 v12 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v15 + 1) + 8 * (void)v11), (void)v15);
          [v12 apsIsConnected:v3];

          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
    else
    {
      do
      {
        long long v13 = 0;
        do
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v14 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v15 + 1) + 8 * (void)v13), (void)v15];
          [v14 apsIsConnected:v3];

          long long v13 = (char *)v13 + 1;
        }
        while (v9 != v13);
        id v9 = [(NSMutableDictionary *)v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v9);
    }
  }
}

- (void)deviceHasPhoneCallRelayRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = sub_10015BD9C();
  dispatch_assert_queue_V2(v5);

  if (v3)
  {
    if (self)
    {
      bluetoothManager = self->_bluetoothManager;
      if (bluetoothManager)
      {
        id v7 = bluetoothManager->super._queue;
        dispatch_assert_queue_V2(v7);

        if (bluetoothManager->_pipeManager)
        {
          if (bluetoothManager->_hasEnabledDevicesUsingClientServer)
          {
            id v8 = sub_10002C700((uint64_t)bluetoothManager, 3, 0);
            if (v8) {
              v8->_flags |= 4u;
            }
          }
          if (bluetoothManager->_hasEnabledDevicesUsingP2P)
          {
            id v9 = sub_10002C700((uint64_t)bluetoothManager, 3, 1);
            if (v9) {
              v9->_flags |= 4u;
            }
          }
          sub_10002B498((uint64_t)bluetoothManager, 3, 0);
          sub_10002B498((uint64_t)bluetoothManager, 3, 1);
        }
      }
LABEL_22:
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      conductors = self->_conductors;
      goto LABEL_23;
    }
  }
  else if (self)
  {
    uint64_t v10 = self->_bluetoothManager;
    if (v10)
    {
      v11 = v10->super._queue;
      dispatch_assert_queue_V2(v11);

      if (v10->_pipeManager)
      {
        unsigned __int8 v12 = v10->_pipeRegistrations;
        long long v13 = [(NSMutableDictionary *)v12 objectForKeyedSubscript:&off_1001D48A0];
        if (v13) {
          v13[9] &= ~4u;
        }

        long long v14 = v10->_p2pPipeRegistrations;
        long long v15 = [(NSMutableDictionary *)v14 objectForKeyedSubscript:&off_1001D48A0];
        if (v15) {
          v15[9] &= ~4u;
        }

        sub_100029D00((uint64_t)v10, 3, 0);
        sub_100029D00((uint64_t)v10, 3, 1);
      }
    }
    goto LABEL_22;
  }
  conductors = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
LABEL_23:
  long long v17 = conductors;
  id v18 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v18)
  {
    id v19 = v18;
    uint64_t v20 = *(void *)v26;
    if (self)
    {
      do
      {
        v21 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v22 = -[NSMutableDictionary objectForKeyedSubscript:](self->_conductors, "objectForKeyedSubscript:", *(void *)(*((void *)&v25 + 1) + 8 * (void)v21), (void)v25);
          [v22 deviceHasPhoneCallRelayRequest:v3];

          v21 = (char *)v21 + 1;
        }
        while (v19 != v21);
        id v19 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }
    else
    {
      do
      {
        v23 = 0;
        do
        {
          if (*(void *)v26 != v20) {
            objc_enumerationMutation(v17);
          }
          v24 = [0 objectForKeyedSubscript:*(void *)(*((void *)&v25 + 1) + 8 * (void)v23), (void)v25];
          [v24 deviceHasPhoneCallRelayRequest:v3];

          v23 = (char *)v23 + 1;
        }
        while (v19 != v23);
        id v19 = [(NSMutableDictionary *)v17 countByEnumeratingWithState:&v25 objects:v29 count:16];
      }
      while (v19);
    }
  }
}

- (void)peerDidUnpairBluetooth:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v17 = a4;
  id v6 = sub_10015BD9C();
  dispatch_assert_queue_V2(v6);

  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0;
  }
  id v8 = [(NSMutableDictionary *)conductors objectForKeyedSubscript:v17];
  id v9 = v8;
  if (v8)
  {
    [v8 peerDidUnpairBluetooth:v4 nrUUID:v17];
  }
  else
  {
    if (v4) {
      uint64_t v10 = "";
    }
    else {
      uint64_t v10 = "not ";
    }
    long long v16 = [v17 UUIDString];
    sub_1000A9E64((uint64_t)self, 1014, @"peer did%s unregister %@", v11, v12, v13, v14, v15, (uint64_t)v10);
  }
}

- (void)pipeDidConnectForNRUUID:(BOOL)a3 nrUUID:(id)a4
{
  BOOL v4 = a3;
  id v17 = a4;
  id v6 = sub_10015BD9C();
  dispatch_assert_queue_V2(v6);

  if (self) {
    conductors = self->_conductors;
  }
  else {
    conductors = 0;
  }
  id v8 = [(NSMutableDictionary *)conductors objectForKeyedSubscript:v17];
  id v9 = v8;
  if (v8)
  {
    [v8 pipeDidConnectForNRUUID:v4 nrUUID:v17];
  }
  else
  {
    if (v4) {
      uint64_t v10 = "";
    }
    else {
      uint64_t v10 = " not";
    }
    long long v16 = [v17 UUIDString];
    sub_1000A9E64((uint64_t)self, 1014, @"peer%s nearby %@", v11, v12, v13, v14, v15, (uint64_t)v10);
  }
}

- (void)linkPeerIsAsleep:(id)a3 isAsleep:(BOOL)a4
{
  BOOL v4 = a4;
  id v21 = a3;
  id v6 = sub_10015BD9C();
  dispatch_assert_queue_V2(v6);

  if (v21)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0;
    }
    id v8 = conductors;
    id v9 = [v21 nrUUID];
    uint64_t v10 = [(NSMutableDictionary *)v8 objectForKeyedSubscript:v9];

    if (v10)
    {
      [v10 linkPeerIsAsleep:v21 isAsleep:v4];
    }
    else
    {
      if (v4) {
        uint64_t v11 = "";
      }
      else {
        uint64_t v11 = " not";
      }
      uint64_t v12 = [v21 nrUUID];
      uint64_t v20 = [v12 UUIDString];
      sub_1000A9E64((uint64_t)self, 1014, @"peer%s asleep %@ %@", v13, v14, v15, v16, v17, (uint64_t)v11);

      uint64_t v10 = 0;
    }
    goto LABEL_10;
  }
  id v18 = sub_1000AA13C();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    uint64_t v10 = sub_1000AA13C();
    _NRLogWithArgs();
LABEL_10:
  }
}

- (void)linkDidReceiveData:(id)a3 data:(id)a4
{
  id v23 = a3;
  id v6 = a4;
  id v7 = sub_10015BD9C();
  dispatch_assert_queue_V2(v7);

  if (v23)
  {
    if (v6)
    {
      if (self) {
        conductors = self->_conductors;
      }
      else {
        conductors = 0;
      }
      id v9 = conductors;
      uint64_t v10 = [v23 nrUUID];
      uint64_t v11 = [(NSMutableDictionary *)v9 objectForKeyedSubscript:v10];

      if (v11)
      {
        [v11 linkDidReceiveData:v23 data:v6];
      }
      else
      {
        uint64_t v12 = [v23 nrUUID];
        v22 = [v12 UUIDString];
        sub_1000A9E64((uint64_t)self, 1014, @"linkDidReceiveData %@ %@", v13, v14, v15, v16, v17, (uint64_t)v23);

        uint64_t v11 = 0;
      }
      goto LABEL_8;
    }
    id v20 = sub_1000AA13C();
    int IsLevelEnabled = _NRLogIsLevelEnabled();

    if (IsLevelEnabled)
    {
LABEL_15:
      uint64_t v11 = sub_1000AA13C();
      _NRLogWithArgs();
LABEL_8:
    }
  }
  else
  {
    id v18 = sub_1000AA13C();
    int v19 = _NRLogIsLevelEnabled();

    if (v19) {
      goto LABEL_15;
    }
  }
}

- (void)linkIsUnavailable:(id)a3
{
  id v18 = a3;
  BOOL v4 = sub_10015BD9C();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0;
    }
    id v6 = conductors;
    id v7 = [v18 nrUUID];
    id v8 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      [v8 linkIsUnavailable:v18];
      sub_1000AA4D0((uint64_t)self);
    }
    else
    {
      id v9 = [v18 nrUUID];
      uint64_t v17 = [v9 UUIDString];
      sub_1000A9E64((uint64_t)self, 1014, @"linkUnavailable %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0;
    }
    goto LABEL_7;
  }
  id v15 = sub_1000AA13C();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v8 = sub_1000AA13C();
    _NRLogWithArgs();
LABEL_7:
  }
}

- (void)linkIsSuspended:(id)a3
{
  id v18 = a3;
  BOOL v4 = sub_10015BD9C();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0;
    }
    id v6 = conductors;
    id v7 = [v18 nrUUID];
    id v8 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      [v8 linkIsSuspended:v18];
      sub_1000AA4D0((uint64_t)self);
    }
    else
    {
      id v9 = [v18 nrUUID];
      uint64_t v17 = [v9 UUIDString];
      sub_1000A9E64((uint64_t)self, 1014, @"linkSuspended %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0;
    }
    goto LABEL_7;
  }
  id v15 = sub_1000AA13C();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v8 = sub_1000AA13C();
    _NRLogWithArgs();
LABEL_7:
  }
}

- (void)linkIsReady:(id)a3
{
  id v18 = a3;
  BOOL v4 = sub_10015BD9C();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0;
    }
    id v6 = conductors;
    id v7 = [v18 nrUUID];
    id v8 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      [v8 linkIsReady:v18];
      sub_1000AA4D0((uint64_t)self);
    }
    else
    {
      id v9 = [v18 nrUUID];
      uint64_t v17 = [v9 UUIDString];
      sub_1000A9E64((uint64_t)self, 1014, @"linkReady %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0;
    }
    goto LABEL_7;
  }
  id v15 = sub_1000AA13C();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v8 = sub_1000AA13C();
    _NRLogWithArgs();
LABEL_7:
  }
}

- (void)linkIsAvailable:(id)a3
{
  id v18 = a3;
  BOOL v4 = sub_10015BD9C();
  dispatch_assert_queue_V2(v4);

  if (v18)
  {
    if (self) {
      conductors = self->_conductors;
    }
    else {
      conductors = 0;
    }
    id v6 = conductors;
    id v7 = [v18 nrUUID];
    id v8 = [(NSMutableDictionary *)v6 objectForKeyedSubscript:v7];

    if (v8)
    {
      [v8 linkIsAvailable:v18];
    }
    else
    {
      id v9 = [v18 nrUUID];
      uint64_t v17 = [v9 UUIDString];
      sub_1000A9E64((uint64_t)self, 1014, @"linkAvailable %@ %@", v10, v11, v12, v13, v14, (uint64_t)v18);

      id v8 = 0;
    }
    goto LABEL_7;
  }
  id v15 = sub_1000AA13C();
  int IsLevelEnabled = _NRLogIsLevelEnabled();

  if (IsLevelEnabled)
  {
    id v8 = sub_1000AA13C();
    _NRLogWithArgs();
LABEL_7:
  }
}

@end