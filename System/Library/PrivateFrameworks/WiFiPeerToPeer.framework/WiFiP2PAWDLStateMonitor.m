@interface WiFiP2PAWDLStateMonitor
- (BOOL)fetchAWDLActiveServices:(id *)a3 withActivePorts:(id *)a4 error:(id *)a5;
- (BOOL)updateLTERestrictedChannels:(id)a3 error:(id *)a4;
- (WiFiP2PAWDLStateMonitor)init;
- (id)channelSequenceUpdatedEventHandler;
- (id)copyActiveServiceUniqueIdentifiers;
- (id)copyLowLatencyStatistics;
- (id)copyStatistics;
- (id)exportedInterface;
- (id)lowLatencyStatisticsDifferenceBetweenPrevious:(id)a3 current:(id)a4;
- (id)lowLatencyStatisticsUpdatedHandler;
- (id)queryPeerDatabase;
- (id)realtimeModeUpdatedHandler;
- (id)serviceAvailabilityUpdatedHandler;
- (id)softAPChannelChangedEventHandler;
- (id)stateUpdatedHandler;
- (id)statisticsUpdatedHandler;
- (id)threadCoexistenceEventHandler;
- (int)queryAverageRSSIForPeer:(id)a3;
- (void)availabilityUpdatedForService:(id)a3 error:(id)a4;
- (void)beginMonitoring;
- (void)channelSequenceChangedEvent:(id)a3;
- (void)endMonitoring;
- (void)registerAvailabilityUpdatesForService:(id)a3;
- (void)setChannelSequenceUpdatedEventHandler:(id)a3;
- (void)setLowLatencyStatisticsUpdatedHandler:(id)a3;
- (void)setRealtimeModeUpdatedHandler:(id)a3;
- (void)setServiceAvailabilityUpdatedHandler:(id)a3;
- (void)setSoftAPChannelChangedEventHandler:(id)a3;
- (void)setStateUpdatedHandler:(id)a3;
- (void)setStatisticsUpdatedHandler:(id)a3;
- (void)setThreadCoexistenceEventHandler:(id)a3;
- (void)softAPChannelChangedEvent:(BOOL)a3 channelNumber:(unsigned __int16)a4;
- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4;
- (void)threadCoexistenceEvent:(id)a3;
- (void)updatedAWDLState:(id)a3;
- (void)updatedLowLatencyStatistics;
- (void)updatedRealtimeMode:(BOOL)a3;
- (void)updatedStatistics;
@end

@implementation WiFiP2PAWDLStateMonitor

- (WiFiP2PAWDLStateMonitor)init
{
  v11.receiver = self;
  v11.super_class = (Class)WiFiP2PAWDLStateMonitor;
  v2 = [(WiFiP2PAWDLStateMonitor *)&v11 init];
  v3 = v2;
  if (v2)
  {
    interestedUniqueIdentifiers = v2->_interestedUniqueIdentifiers;
    v2->_interestedUniqueIdentifiers = 0;

    v5 = [WiFiP2PXPCConnection alloc];
    v6 = +[WiFiP2PXPCConnection wifiPeerToPeerWorkloop];
    dispatch_queue_t v7 = dispatch_queue_create_with_target_V2("com.apple.wifip2p.WiFiP2PAWDLStateMonitor", 0, v6);
    uint64_t v8 = [(WiFiP2PXPCConnection *)v5 initWithEndpointType:2 queue:v7 retryTimeout:-1];
    xpcConnection = v3->_xpcConnection;
    v3->_xpcConnection = (WiFiP2PXPCConnection *)v8;

    [(WiFiP2PXPCConnection *)v3->_xpcConnection setDelegate:v3];
  }
  return v3;
}

- (id)exportedInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F1813A60];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_channelSequenceChangedEvent_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)startConnectionUsingProxy:(id)a3 completionHandler:(id)a4
{
  id v18 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = objc_alloc_init(WiFiP2PAWDLStateMonitorConfiguration);
  uint64_t v8 = [(WiFiP2PAWDLStateMonitor *)self stateUpdatedHandler];

  if (v8) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 1];
  }
  v9 = [(WiFiP2PAWDLStateMonitor *)self statisticsUpdatedHandler];

  if (v9) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 2];
  }
  v10 = [(WiFiP2PAWDLStateMonitor *)self lowLatencyStatisticsUpdatedHandler];

  if (v10) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 0x40];
  }
  objc_super v11 = [(WiFiP2PAWDLStateMonitor *)self realtimeModeUpdatedHandler];

  if (v11) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 4];
  }
  v12 = [(WiFiP2PAWDLStateMonitor *)self threadCoexistenceEventHandler];

  if (v12) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 8];
  }
  v13 = [(WiFiP2PAWDLStateMonitor *)self softAPChannelChangedEventHandler];

  if (v13) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 0x10];
  }
  v14 = [(WiFiP2PAWDLStateMonitor *)self channelSequenceUpdatedEventHandler];

  if (v14) {
    [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setOptions:[(WiFiP2PAWDLStateMonitorConfiguration *)v7 options] | 0x20];
  }
  uint64_t v15 = [(WiFiP2PAWDLStateMonitor *)self serviceAvailabilityUpdatedHandler];
  if (v15)
  {
    v16 = (void *)v15;
    uint64_t v17 = [(NSMutableArray *)self->_interestedUniqueIdentifiers count];

    if (v17) {
      [(WiFiP2PAWDLStateMonitorConfiguration *)v7 setServicesRequiringAvailabilityNotification:self->_interestedUniqueIdentifiers];
    }
  }
  [v18 startMonitoringAWDLStateWithConfiguration:v7 completionHandler:v6];
}

- (void)registerAvailabilityUpdatesForService:(id)a3
{
  interestedUniqueIdentifiers = self->_interestedUniqueIdentifiers;
  if (interestedUniqueIdentifiers)
  {
    [(NSMutableArray *)interestedUniqueIdentifiers addObject:a3];
  }
  else
  {
    self->_interestedUniqueIdentifiers = [MEMORY[0x1E4F1CA48] arrayWithObject:a3];
    MEMORY[0x1F41817F8]();
  }
}

- (void)beginMonitoring
{
}

- (void)endMonitoring
{
}

- (void)updatedAWDLState:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(WiFiP2PAWDLStateMonitor *)self stateUpdatedHandler];

  if (v4)
  {
    v5 = [(WiFiP2PAWDLStateMonitor *)self stateUpdatedHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)updatedStatistics
{
  v3 = [(WiFiP2PAWDLStateMonitor *)self statisticsUpdatedHandler];

  if (v3)
  {
    uint64_t v4 = [(WiFiP2PAWDLStateMonitor *)self statisticsUpdatedHandler];
    v4[2]();
  }
}

- (void)updatedLowLatencyStatistics
{
  v3 = [(WiFiP2PAWDLStateMonitor *)self lowLatencyStatisticsUpdatedHandler];

  if (v3)
  {
    uint64_t v4 = [(WiFiP2PAWDLStateMonitor *)self lowLatencyStatisticsUpdatedHandler];
    v4[2]();
  }
}

- (void)updatedRealtimeMode:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(WiFiP2PAWDLStateMonitor *)self realtimeModeUpdatedHandler];

  if (v5)
  {
    id v6 = [(WiFiP2PAWDLStateMonitor *)self realtimeModeUpdatedHandler];
    v6[2](v6, v3);
  }
}

- (void)threadCoexistenceEvent:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(WiFiP2PAWDLStateMonitor *)self threadCoexistenceEventHandler];

  if (v4)
  {
    v5 = [(WiFiP2PAWDLStateMonitor *)self threadCoexistenceEventHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)softAPChannelChangedEvent:(BOOL)a3 channelNumber:(unsigned __int16)a4
{
  uint64_t v4 = a4;
  BOOL v5 = a3;
  dispatch_queue_t v7 = [(WiFiP2PAWDLStateMonitor *)self softAPChannelChangedEventHandler];

  if (v7)
  {
    uint64_t v8 = [(WiFiP2PAWDLStateMonitor *)self softAPChannelChangedEventHandler];
    v8[2](v8, v5, v4);
  }
}

- (void)channelSequenceChangedEvent:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(WiFiP2PAWDLStateMonitor *)self channelSequenceUpdatedEventHandler];

  if (v4)
  {
    BOOL v5 = [(WiFiP2PAWDLStateMonitor *)self channelSequenceUpdatedEventHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)availabilityUpdatedForService:(id)a3 error:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  dispatch_queue_t v7 = [(WiFiP2PAWDLStateMonitor *)self serviceAvailabilityUpdatedHandler];

  if (v7)
  {
    uint64_t v8 = [(WiFiP2PAWDLStateMonitor *)self serviceAvailabilityUpdatedHandler];
    ((void (**)(void, id, BOOL, id))v8)[2](v8, v9, v6 == 0, v6);
  }
}

- (id)copyStatistics
{
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __41__WiFiP2PAWDLStateMonitor_copyStatistics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryAWDLStatisticsWithCompletionHandler:");
}

- (BOOL)updateLTERestrictedChannels:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__WiFiP2PAWDLStateMonitor_updateLTERestrictedChannels_error___block_invoke;
  v8[3] = &unk_1E633F528;
  id v9 = v5;
  id v6 = v5;
  LOBYTE(a4) = +[WiFiP2PXPCConnection directRequestOnEndpointType:2 error:a4 requesting:v8];

  return (char)a4;
}

uint64_t __61__WiFiP2PAWDLStateMonitor_updateLTERestrictedChannels_error___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 updateAWDLLTERestrictedChannels:*(void *)(a1 + 32) completionHandler:a3];
}

- (id)lowLatencyStatisticsDifferenceBetweenPrevious:(id)a3 current:(id)a4
{
  v81[2] = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v56 = a4;
  v81[0] = @"LL_STATS_ACTIVE_SERVICES_BITMAP";
  v81[1] = @"LL_STATS_REMOTE_CAMERA_ACTIVE";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:2];
  v80[0] = @"LL_STATS_ISSDB";
  v80[1] = @"LL_STATS_COUNTRY_CODE";
  v80[2] = @"LL_STATS_PEERRSSI24G";
  v80[3] = @"LL_STATS_PEERRSSI5G";
  v80[4] = @"LL_STATS_TX_AVG_CCA";
  v80[5] = @"LL_STATS_SELF_INFRA_PRE_START";
  v80[6] = @"LL_STATS_SELF_INFRA_POST_START";
  v80[7] = @"LL_STATS_PEER_INFRA_PRE_START";
  v80[8] = @"LL_STATS_PEER_INFRA_POST_START";
  v80[9] = @"LL_STATS_LIMITED_TX_MIN_RATE";
  v80[10] = @"LL_STATS_PREF_5G_CHAN_COUNT";
  v80[11] = @"LL_STATS_PREF_2G_CHAN_COUNT";
  v80[12] = @"LL_STATS_IS_ODEON_ACTIVE";
  v80[13] = @"LL_STATS_2G_IN_CHAN_SEQ";
  v80[14] = @"LL_STATS_SIDECAR_SERV_TYPE_BITMAP";
  v80[15] = @"LL_STATS_RTG_ID";
  v80[16] = @"LL_STATS_REDUCED_AWDL_BW";
  v80[17] = @"LL_STATS_REDUCED_BW_PERCENT_SESSION";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:18];
  v79[0] = @"LL_STATS_BSSSTEERING_ATTEMPT_COUNT";
  v79[1] = @"LL_STATS_BSSSTEERING_SUCCESS_COUNT";
  v79[2] = @"LL_STATS_BSSSTEERING_FAILURE_COUNT";
  v79[3] = @"LL_STATS_BSSSTEERING_TIMEOUT_COUNT";
  v79[4] = @"LL_STATS_INFRA_DISCONNECTED_POLICY_COUNT";
  v79[5] = @"LL_STATS_INFRA_DISCONNECTED_FAILURE_COUNT";
  v79[6] = @"LL_STATS_SESSION_DURATION";
  v79[7] = @"LL_STATS_IDLE_SLOTS_COUNT";
  v79[8] = @"LL_STATS_SYNC_ERRORS_COUNT";
  v79[9] = @"LL_STATS_CHANNEL_SEQ_MISMATCH_COUNT";
  v79[10] = @"LL_STATS_PARENT_NODE_CHANGE_COUNT";
  v79[11] = @"LL_STATS_ROOT_NODE_CHANGE_COUNT";
  v79[12] = @"LL_STATS_WATCHDOG_OR_CHIPTRAP_COUNT";
  v79[13] = @"LL_STATS_TXSUCCESSCOUNT";
  v79[14] = @"LL_STATS_TXEXPIREDCOUNT";
  v79[15] = @"LL_STATS_TXNOBUFFCOUNT";
  v79[16] = @"LL_STATS_TXNOACKCOUNT";
  v79[17] = @"LL_STATS_TXFAILCOUNT";
  v79[18] = @"LL_STATS_TXNORESOURCESCOUNT";
  v79[19] = @"LL_STATS_TXIOERRORCOUNT";
  v79[20] = @"LL_STATS_TXMBFREECOUNT";
  v79[21] = @"LL_STATS_TXCHIPMODEERRCOUNT";
  v79[22] = @"LL_STATS_TXNOREMOTEPEERCOUNT";
  v79[23] = @"LL_STATS_TXINTRERRCOUNT";
  v79[24] = @"LL_STATS_TXDRPCOUNT";
  v79[25] = @"LL_STATS_TXFWFREEPKTCOUNT";
  v79[26] = @"LL_STATS_TXMAXRETRIESCOUNT";
  v79[27] = @"LL_STATS_TXFORCELIFETIMEEXPIREDCOUNT";
  v79[28] = @"LL_STATS_TXERRORCOUNT";
  v79[29] = @"LL_STATS_TX_ON_5G_COUNT";
  v79[30] = @"LL_STATS_TX_ON_2G_COUNT";
  v79[31] = @"LL_STATS_TX_OVERRIDE_ON_5G_COUNT";
  v79[32] = @"LL_STATS_TX_NA_COUNT";
  v79[33] = @"LL_STATS_RX_PACKET_COUNT";
  v79[34] = @"LL_STATS_RX_ON_5G_COUNT";
  v79[35] = @"LL_STATS_RX_ON_2G_COUNT";
  v79[36] = @"LL_STATS_TX_REQUEUE_COUNT";
  v79[37] = @"LL_STATS_TX_REQUEUE_FAIL_COUNT";
  v79[38] = @"LL_STATS_TX_SWITCH_NAV_COUNT";
  v79[39] = @"LL_STATS_TX_SWITCH_HOF_COUNT";
  dispatch_queue_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:40];
  v78[0] = @"LL_STATS_TX_TOTAL_DELAY";
  v78[1] = @"LL_STATS_TX_COMPLETION_DELAY";
  v78[2] = @"LL_STATS_TX_IPCL_DELAY";
  v78[3] = @"LL_STATS_TX_FW_DELAY";
  v78[4] = @"LL_STATS_TX_HW_DELAY";
  v78[5] = @"LL_STATS_TX_DATA_RATE";
  v78[6] = @"LL_STATS_TX_RETRIES";
  v78[7] = @"LL_STATS_TX_PACKET_BURST_SIZE";
  v78[8] = @"LL_STATS_TX_PACKET_BURST_INTERVAL";
  v78[9] = @"LL_STATS_TX_PACKET_EXPIRY";
  v78[10] = @"LL_STATS_TX_CONSECUTIVE_ERRORS";
  v78[11] = @"LL_STATS_TX_CCA";
  v78[12] = @"LL_STATS_REQUEUE_COUNT";
  v78[13] = @"LL_STATS_RX_TOTAL_DELAY";
  v78[14] = @"LL_STATS_RX_IPC_DELAY";
  v78[15] = @"LL_STATS_RX_FW_DELAY";
  v78[16] = @"LL_STATS_RX_DATA_RATE";
  v78[17] = @"LL_STATS_RX_RSSI";
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v78 count:18];
  id v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v70 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  id v10 = v5;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v70 objects:v77 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v71;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v71 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v70 + 1) + 8 * i);
        v16 = [v57 objectForKey:v15];
        if (v16) {
          [v9 setObject:v16 forKey:v15];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v70 objects:v77 count:16];
    }
    while (v12);
  }

  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  id v17 = v6;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v66 objects:v76 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v67;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v67 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void *)(*((void *)&v66 + 1) + 8 * j);
        v23 = [v56 objectForKey:v22];
        if (v23) {
          [v9 setObject:v23 forKey:v22];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v66 objects:v76 count:16];
    }
    while (v19);
  }
  v51 = v17;
  v52 = v10;

  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  obuint64_t j = v7;
  uint64_t v24 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v63;
    do
    {
      for (uint64_t k = 0; k != v25; ++k)
      {
        if (*(void *)v63 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v62 + 1) + 8 * k);
        v29 = [v57 valueForKey:v28];
        uint64_t v30 = [v29 integerValue];

        v31 = [v56 valueForKey:v28];
        uint64_t v32 = [v31 integerValue];

        v33 = [NSNumber numberWithInteger:v32 - v30];
        [v9 setObject:v33 forKey:v28];
      }
      uint64_t v25 = [obj countByEnumeratingWithState:&v62 objects:v75 count:16];
    }
    while (v25);
  }

  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  id v53 = v8;
  uint64_t v34 = [v53 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (v34)
  {
    uint64_t v35 = v34;
    uint64_t v55 = *(void *)v59;
    do
    {
      for (uint64_t m = 0; m != v35; ++m)
      {
        if (*(void *)v59 != v55) {
          objc_enumerationMutation(v53);
        }
        uint64_t v37 = *(void *)(*((void *)&v58 + 1) + 8 * m);
        v38 = [v57 objectForKey:v37];
        v39 = [v56 objectForKey:v37];
        v40 = [MEMORY[0x1E4F1CA48] array];
        if ([v38 count])
        {
          unint64_t v41 = 0;
          do
          {
            if (v41 >= [v39 count]) {
              break;
            }
            v42 = [v38 objectAtIndex:v41];
            [v42 doubleValue];
            double v44 = v43;

            v45 = [v39 objectAtIndex:v41];
            [v45 doubleValue];
            double v47 = v46;

            v48 = [NSNumber numberWithDouble:v47 - v44];
            [v40 addObject:v48];

            ++v41;
          }
          while (v41 < [v38 count]);
        }
        v49 = [v40 componentsJoinedByString:@","];
        [v9 setObject:v49 forKey:v37];
      }
      uint64_t v35 = [v53 countByEnumeratingWithState:&v58 objects:v74 count:16];
    }
    while (v35);
  }

  return v9;
}

- (id)copyLowLatencyStatistics
{
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __51__WiFiP2PAWDLStateMonitor_copyLowLatencyStatistics__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryAWDLLowLatencyStatisticsWithCompletionHandler:");
}

- (id)copyActiveServiceUniqueIdentifiers
{
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t __61__WiFiP2PAWDLStateMonitor_copyActiveServiceUniqueIdentifiers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "queryActiveServiceUniqueIdentifiersWithCompletionHandler:");
}

- (int)queryAverageRSSIForPeer:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke;
    v8[3] = &unk_1E633F488;
    id v9 = v3;
    id v5 = +[WiFiP2PXPCConnection directQueryOnEndpointType:2 error:0 querying:v8];
    int v6 = [v5 intValue];
  }
  else
  {
    int v6 = 0;
  }

  return v6;
}

void __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void *)(a1 + 32);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke_2;
  v8[3] = &unk_1E633F550;
  id v9 = v5;
  id v7 = v5;
  [a2 queryAverageRSSIForAWDLPeer:v6 completionHandler:v8];
}

void __51__WiFiP2PAWDLStateMonitor_queryAverageRSSIForPeer___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = [NSNumber numberWithInt:a2];
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);
}

- (id)queryPeerDatabase
{
  uint64_t v2 = +[WiFiP2PXPCConnection directQueryOnEndpointType:2 error:0 querying:&__block_literal_global_591];
  id v3 = v2;
  if (!v2) {
    uint64_t v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v4 = v2;

  return v4;
}

void __44__WiFiP2PAWDLStateMonitor_queryPeerDatabase__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __44__WiFiP2PAWDLStateMonitor_queryPeerDatabase__block_invoke_2;
  v6[3] = &unk_1E633F578;
  id v7 = v4;
  id v5 = v4;
  [a2 queryPeersWithCompletionHandler:v6];
}

uint64_t __44__WiFiP2PAWDLStateMonitor_queryPeerDatabase__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)fetchAWDLActiveServices:(id *)a3 withActivePorts:(id *)a4 error:(id *)a5
{
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__1;
  uint64_t v24 = __Block_byref_object_dispose__1;
  id v25 = 0;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__1;
  uint64_t v18 = __Block_byref_object_dispose__1;
  id v19 = 0;
  v12[5] = &v14;
  id v13 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke;
  v12[3] = &unk_1E633F5C8;
  v12[4] = &v20;
  uint64_t v8 = +[WiFiP2PXPCConnection directQueryOnEndpointType:2 error:&v13 querying:v12];
  id v9 = v13;
  id v10 = v9;
  if (v9)
  {
    if (a3) {
      *a3 = 0;
    }
    if (a4) {
      *a4 = 0;
    }
    if (!a5) {
      goto LABEL_13;
    }
LABEL_12:
    *a5 = v9;
    goto LABEL_13;
  }
  if (a3) {
    *a3 = (id) v21[5];
  }
  if (a4)
  {
    id v9 = (id)v15[5];
    a5 = a4;
    goto LABEL_12;
  }
LABEL_13:

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v20, 8);

  return v10 == 0;
}

void __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke_2;
  v7[3] = &unk_1E633F5A0;
  long long v9 = *(_OWORD *)(a1 + 32);
  id v8 = v5;
  id v6 = v5;
  [a2 queryActiveServicesAndActivePortsWithCompletionHandler:v7];
}

void __73__WiFiP2PAWDLStateMonitor_fetchAWDLActiveServices_withActivePorts_error___block_invoke_2(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1[5] + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(a1[6] + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  (*(void (**)(void))(a1[4] + 16))();
}

- (id)stateUpdatedHandler
{
  return self->_stateUpdatedHandler;
}

- (void)setStateUpdatedHandler:(id)a3
{
}

- (id)statisticsUpdatedHandler
{
  return self->_statisticsUpdatedHandler;
}

- (void)setStatisticsUpdatedHandler:(id)a3
{
}

- (id)lowLatencyStatisticsUpdatedHandler
{
  return self->_lowLatencyStatisticsUpdatedHandler;
}

- (void)setLowLatencyStatisticsUpdatedHandler:(id)a3
{
}

- (id)realtimeModeUpdatedHandler
{
  return self->_realtimeModeUpdatedHandler;
}

- (void)setRealtimeModeUpdatedHandler:(id)a3
{
}

- (id)threadCoexistenceEventHandler
{
  return self->_threadCoexistenceEventHandler;
}

- (void)setThreadCoexistenceEventHandler:(id)a3
{
}

- (id)softAPChannelChangedEventHandler
{
  return self->_softAPChannelChangedEventHandler;
}

- (void)setSoftAPChannelChangedEventHandler:(id)a3
{
}

- (id)channelSequenceUpdatedEventHandler
{
  return self->_channelSequenceUpdatedEventHandler;
}

- (void)setChannelSequenceUpdatedEventHandler:(id)a3
{
}

- (id)serviceAvailabilityUpdatedHandler
{
  return self->_serviceAvailabilityUpdatedHandler;
}

- (void)setServiceAvailabilityUpdatedHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_serviceAvailabilityUpdatedHandler, 0);
  objc_storeStrong(&self->_channelSequenceUpdatedEventHandler, 0);
  objc_storeStrong(&self->_softAPChannelChangedEventHandler, 0);
  objc_storeStrong(&self->_threadCoexistenceEventHandler, 0);
  objc_storeStrong(&self->_realtimeModeUpdatedHandler, 0);
  objc_storeStrong(&self->_lowLatencyStatisticsUpdatedHandler, 0);
  objc_storeStrong(&self->_statisticsUpdatedHandler, 0);
  objc_storeStrong(&self->_stateUpdatedHandler, 0);
  objc_storeStrong((id *)&self->_interestedUniqueIdentifiers, 0);

  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end