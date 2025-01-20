@interface SiriCoreConnectionMetrics
- (NSArray)connectionMethodHistory;
- (NSDictionary)flowNetworkInterfaceType;
- (NSDictionary)subflowSwitchCounts;
- (NSDictionary)symptomsBasedNetworkQuality;
- (NSDictionary)tcpInfoMetricsByInterfaceName;
- (NSNumber)attemptCount;
- (NSNumber)cca;
- (NSNumber)connectedSubflowCount;
- (NSNumber)connectionDelay;
- (NSNumber)connectionEstablishmentTimeMsec;
- (NSNumber)connectionFallbackReason;
- (NSNumber)connectionStartTimeToConnectionEstablishmentTimeMsec;
- (NSNumber)connectionStartTimeToDNSResolutionTimeMsec;
- (NSNumber)connectionStartTimeToTLSHandshakeTimeMsec;
- (NSNumber)dnsResolutionTime;
- (NSNumber)firstTxByteDelay;
- (NSNumber)idsLastMessageDelay;
- (NSNumber)idsLastSocketDelay;
- (NSNumber)idsLastSocketOpenError;
- (NSNumber)isCaptive;
- (NSNumber)meanPing;
- (NSNumber)metricsCount;
- (NSNumber)pingCount;
- (NSNumber)rssi;
- (NSNumber)signalStrengthBars;
- (NSNumber)simSubscriptions;
- (NSNumber)snr;
- (NSNumber)subflowCount;
- (NSNumber)timeUntilFirstByteRead;
- (NSNumber)timeUntilOpen;
- (NSNumber)tlsHandshakeTimeMsec;
- (NSNumber)unacknowledgedPingCount;
- (NSString)carrierName;
- (NSString)connectionEdgeID;
- (NSString)connectionEdgeType;
- (NSString)connectionMethod;
- (NSString)policyId;
- (NSString)primarySubflowInterfaceName;
- (NSString)providerStyle;
- (NSString)tlsVersion;
- (NSString)wifiChannelInfo;
- (NSString)wifiPhyMode;
- (SiriCoreConnectionMetrics)remoteMetrics;
- (id)getConnectionMetricsDescription;
- (void)_setConnectionMetricsFromNSPControlConnection:(id)a3 withCompletion:(id)a4;
- (void)_setConnectionMetricsTCPInfo:(id)a3;
- (void)setAttemptCount:(id)a3;
- (void)setCarrierName:(id)a3;
- (void)setCca:(id)a3;
- (void)setConnectedSubflowCount:(id)a3;
- (void)setConnectionDelay:(id)a3;
- (void)setConnectionEdgeID:(id)a3;
- (void)setConnectionEdgeType:(id)a3;
- (void)setConnectionEstablishmentTimeMsec:(id)a3;
- (void)setConnectionFallbackReason:(id)a3;
- (void)setConnectionMethod:(id)a3;
- (void)setConnectionMethodHistory:(id)a3;
- (void)setConnectionMetricsForIDS:(double)a3 messageDelay:(double)a4 openErrorCode:(unint64_t)a5;
- (void)setConnectionMetricsFromConnection:(id)a3 isPop:(BOOL)a4 isMPTCP:(BOOL)a5 attemptedEndpoints:(id)a6 completion:(id)a7;
- (void)setConnectionMetricsFromNWConnectionForDirect:(id)a3 isMPTCP:(BOOL)a4 attemptedEndpoints:(id)a5 withCompletion:(id)a6;
- (void)setConnectionMetricsFromNWConnectionForPOP:(id)a3 withCompletion:(id)a4;
- (void)setConnectionMetricsFromStream:(id)a3 isPop:(BOOL)a4 withCompletion:(id)a5;
- (void)setConnectionMetricsFromStreamForDirect:(id)a3 withCompletion:(id)a4;
- (void)setConnectionMetricsFromStreamForPOP:(id)a3 withCompletion:(id)a4;
- (void)setConnectionStartTimeToConnectionEstablishmentTimeMsec:(id)a3;
- (void)setConnectionStartTimeToDNSResolutionTimeMsec:(id)a3;
- (void)setConnectionStartTimeToTLSHandshakeTimeMsec:(id)a3;
- (void)setDnsResolutionTime:(id)a3;
- (void)setFirstTxByteDelay:(id)a3;
- (void)setFlowNetworkInterfaceType:(id)a3;
- (void)setIdsLastMessageDelay:(id)a3;
- (void)setIdsLastSocketDelay:(id)a3;
- (void)setIdsLastSocketOpenError:(id)a3;
- (void)setIsCaptive:(id)a3;
- (void)setMeanPing:(id)a3;
- (void)setMetricsCount:(id)a3;
- (void)setPingCount:(id)a3;
- (void)setPolicyId:(id)a3;
- (void)setPrimarySubflowInterfaceName:(id)a3;
- (void)setProviderStyle:(id)a3;
- (void)setRemoteMetrics:(id)a3;
- (void)setRssi:(id)a3;
- (void)setSignalStrengthBars:(id)a3;
- (void)setSimSubscriptions:(id)a3;
- (void)setSnr:(id)a3;
- (void)setSubflowCount:(id)a3;
- (void)setSubflowSwitchCounts:(id)a3;
- (void)setSymptomsBasedNetworkQuality:(id)a3;
- (void)setTCPInfoMetricsByInterfaceName:(id)a3;
- (void)setTimeUntilFirstByteRead:(id)a3;
- (void)setTimeUntilOpen:(id)a3;
- (void)setTlsHandshakeTimeMsec:(id)a3;
- (void)setTlsVersion:(id)a3;
- (void)setUnacknowledgedPingCount:(id)a3;
- (void)setWifiChannelInfo:(id)a3;
- (void)setWifiPhyMode:(id)a3;
@end

@implementation SiriCoreConnectionMetrics

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simSubscriptions, 0);
  objc_storeStrong((id *)&self->_tlsVersion, 0);
  objc_storeStrong((id *)&self->_idsLastSocketOpenError, 0);
  objc_storeStrong((id *)&self->_idsLastSocketDelay, 0);
  objc_storeStrong((id *)&self->_idsLastMessageDelay, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToTLSHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_tlsHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToConnectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToDNSResolutionTimeMsec, 0);
  objc_storeStrong((id *)&self->_dnsResolutionTime, 0);
  objc_storeStrong((id *)&self->_symptomsBasedNetworkQuality, 0);
  objc_storeStrong((id *)&self->_isCaptive, 0);
  objc_storeStrong((id *)&self->_cca, 0);
  objc_storeStrong((id *)&self->_snr, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wifiChannelInfo, 0);
  objc_storeStrong((id *)&self->_wifiPhyMode, 0);
  objc_storeStrong((id *)&self->_flowNetworkInterfaceType, 0);
  objc_storeStrong((id *)&self->_policyId, 0);
  objc_storeStrong((id *)&self->_providerStyle, 0);
  objc_storeStrong((id *)&self->_signalStrengthBars, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_firstTxByteDelay, 0);
  objc_storeStrong((id *)&self->_connectionDelay, 0);
  objc_storeStrong((id *)&self->_connectionFallbackReason, 0);
  objc_storeStrong((id *)&self->_connectionEdgeType, 0);
  objc_storeStrong((id *)&self->_connectionMethodHistory, 0);
  objc_storeStrong((id *)&self->_connectionEdgeID, 0);
  objc_storeStrong((id *)&self->_connectionMethod, 0);
  objc_storeStrong((id *)&self->_remoteMetrics, 0);
  objc_storeStrong((id *)&self->_subflowSwitchCounts, 0);
  objc_storeStrong((id *)&self->_primarySubflowInterfaceName, 0);
  objc_storeStrong((id *)&self->_connectedSubflowCount, 0);
  objc_storeStrong((id *)&self->_subflowCount, 0);
  objc_storeStrong((id *)&self->_tcpInfoMetricsByInterfaceName, 0);
  objc_storeStrong((id *)&self->_unacknowledgedPingCount, 0);
  objc_storeStrong((id *)&self->_pingCount, 0);
  objc_storeStrong((id *)&self->_meanPing, 0);
  objc_storeStrong((id *)&self->_metricsCount, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_timeUntilFirstByteRead, 0);

  objc_storeStrong((id *)&self->_timeUntilOpen, 0);
}

- (void)setSimSubscriptions:(id)a3
{
}

- (NSNumber)simSubscriptions
{
  return self->_simSubscriptions;
}

- (void)setTlsVersion:(id)a3
{
}

- (NSString)tlsVersion
{
  return self->_tlsVersion;
}

- (void)setIdsLastSocketOpenError:(id)a3
{
}

- (NSNumber)idsLastSocketOpenError
{
  return self->_idsLastSocketOpenError;
}

- (void)setIdsLastSocketDelay:(id)a3
{
}

- (NSNumber)idsLastSocketDelay
{
  return self->_idsLastSocketDelay;
}

- (void)setIdsLastMessageDelay:(id)a3
{
}

- (NSNumber)idsLastMessageDelay
{
  return self->_idsLastMessageDelay;
}

- (void)setConnectionStartTimeToTLSHandshakeTimeMsec:(id)a3
{
}

- (NSNumber)connectionStartTimeToTLSHandshakeTimeMsec
{
  return self->_connectionStartTimeToTLSHandshakeTimeMsec;
}

- (void)setTlsHandshakeTimeMsec:(id)a3
{
}

- (NSNumber)tlsHandshakeTimeMsec
{
  return self->_tlsHandshakeTimeMsec;
}

- (void)setConnectionStartTimeToConnectionEstablishmentTimeMsec:(id)a3
{
}

- (NSNumber)connectionStartTimeToConnectionEstablishmentTimeMsec
{
  return self->_connectionStartTimeToConnectionEstablishmentTimeMsec;
}

- (void)setConnectionEstablishmentTimeMsec:(id)a3
{
}

- (NSNumber)connectionEstablishmentTimeMsec
{
  return self->_connectionEstablishmentTimeMsec;
}

- (void)setConnectionStartTimeToDNSResolutionTimeMsec:(id)a3
{
}

- (NSNumber)connectionStartTimeToDNSResolutionTimeMsec
{
  return self->_connectionStartTimeToDNSResolutionTimeMsec;
}

- (void)setDnsResolutionTime:(id)a3
{
}

- (NSNumber)dnsResolutionTime
{
  return self->_dnsResolutionTime;
}

- (void)setSymptomsBasedNetworkQuality:(id)a3
{
}

- (NSDictionary)symptomsBasedNetworkQuality
{
  return self->_symptomsBasedNetworkQuality;
}

- (void)setIsCaptive:(id)a3
{
}

- (NSNumber)isCaptive
{
  return self->_isCaptive;
}

- (void)setCca:(id)a3
{
}

- (NSNumber)cca
{
  return self->_cca;
}

- (void)setSnr:(id)a3
{
}

- (NSNumber)snr
{
  return self->_snr;
}

- (void)setRssi:(id)a3
{
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setWifiChannelInfo:(id)a3
{
}

- (NSString)wifiChannelInfo
{
  return self->_wifiChannelInfo;
}

- (void)setWifiPhyMode:(id)a3
{
}

- (NSString)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setFlowNetworkInterfaceType:(id)a3
{
}

- (NSDictionary)flowNetworkInterfaceType
{
  return self->_flowNetworkInterfaceType;
}

- (void)setPolicyId:(id)a3
{
}

- (NSString)policyId
{
  return self->_policyId;
}

- (void)setProviderStyle:(id)a3
{
}

- (NSString)providerStyle
{
  return self->_providerStyle;
}

- (void)setSignalStrengthBars:(id)a3
{
}

- (NSNumber)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setCarrierName:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setFirstTxByteDelay:(id)a3
{
}

- (NSNumber)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setConnectionDelay:(id)a3
{
}

- (NSNumber)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionFallbackReason:(id)a3
{
}

- (NSNumber)connectionFallbackReason
{
  return self->_connectionFallbackReason;
}

- (void)setConnectionEdgeType:(id)a3
{
}

- (NSString)connectionEdgeType
{
  return self->_connectionEdgeType;
}

- (void)setConnectionMethodHistory:(id)a3
{
}

- (NSArray)connectionMethodHistory
{
  return self->_connectionMethodHistory;
}

- (void)setConnectionEdgeID:(id)a3
{
}

- (NSString)connectionEdgeID
{
  return self->_connectionEdgeID;
}

- (void)setConnectionMethod:(id)a3
{
}

- (NSString)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setRemoteMetrics:(id)a3
{
}

- (SiriCoreConnectionMetrics)remoteMetrics
{
  return self->_remoteMetrics;
}

- (void)setSubflowSwitchCounts:(id)a3
{
}

- (NSDictionary)subflowSwitchCounts
{
  return self->_subflowSwitchCounts;
}

- (void)setPrimarySubflowInterfaceName:(id)a3
{
}

- (NSString)primarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName;
}

- (void)setConnectedSubflowCount:(id)a3
{
}

- (NSNumber)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (void)setSubflowCount:(id)a3
{
}

- (NSNumber)subflowCount
{
  return self->_subflowCount;
}

- (NSDictionary)tcpInfoMetricsByInterfaceName
{
  return self->_tcpInfoMetricsByInterfaceName;
}

- (void)setUnacknowledgedPingCount:(id)a3
{
}

- (NSNumber)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (void)setPingCount:(id)a3
{
}

- (NSNumber)pingCount
{
  return self->_pingCount;
}

- (void)setMeanPing:(id)a3
{
}

- (NSNumber)meanPing
{
  return self->_meanPing;
}

- (void)setMetricsCount:(id)a3
{
}

- (NSNumber)metricsCount
{
  return self->_metricsCount;
}

- (void)setAttemptCount:(id)a3
{
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setTimeUntilFirstByteRead:(id)a3
{
}

- (NSNumber)timeUntilFirstByteRead
{
  return self->_timeUntilFirstByteRead;
}

- (void)setTimeUntilOpen:(id)a3
{
}

- (NSNumber)timeUntilOpen
{
  return self->_timeUntilOpen;
}

- (id)getConnectionMetricsDescription
{
  v3 = NSString;
  v4 = [(SiriCoreConnectionMetrics *)self connectionMethod];
  v5 = [(SiriCoreConnectionMetrics *)self connectionEdgeID];
  v6 = [(SiriCoreConnectionMetrics *)self tcpInfoMetricsByInterfaceName];
  v7 = [v3 stringWithFormat:@"ConnectionMethod: %@ on Edge: %@ TCP_INFO: %@", v4, v5, v6];

  return v7;
}

- (void)setConnectionMetricsForIDS:(double)a3 messageDelay:(double)a4 openErrorCode:(unint64_t)a5
{
  v8 = [NSNumber numberWithDouble:a4];
  [(SiriCoreConnectionMetrics *)self setIdsLastMessageDelay:v8];

  v9 = [NSNumber numberWithDouble:a3];
  [(SiriCoreConnectionMetrics *)self setIdsLastSocketDelay:v9];

  id v10 = [NSNumber numberWithUnsignedInteger:a5];
  [(SiriCoreConnectionMetrics *)self setIdsLastSocketOpenError:v10];
}

- (void)setConnectionMetricsFromNWConnectionForPOP:(id)a3 withCompletion:(id)a4
{
  v6 = (objc_class *)MEMORY[0x263F58258];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initFromNWConnection:v8];

  [(SiriCoreConnectionMetrics *)self _setConnectionMetricsFromNSPControlConnection:v9 withCompletion:v7];
}

- (void)setConnectionMetricsFromNWConnectionForDirect:(id)a3 isMPTCP:(BOOL)a4 attemptedEndpoints:(id)a5 withCompletion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v52 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(void))a6;
  uint64_t v13 = nw_connection_copy_tcp_info();
  v14 = (void *)v13;
  if (v13 && MEMORY[0x21D4B95F0](v13) == MEMORY[0x263EF8708] && xpc_dictionary_get_count(v14))
  {
    id v15 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    applier[0] = MEMORY[0x263EF8330];
    applier[1] = 3221225472;
    applier[2] = __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke;
    applier[3] = &unk_26443A460;
    id v48 = v15;
    id v16 = v15;
    xpc_dictionary_apply(v14, applier);
    [(SiriCoreConnectionMetrics *)self _setConnectionMetricsTCPInfo:v16];
  }
  if (!v8)
  {
    [(SiriCoreConnectionMetrics *)self setSubflowCount:0];
    [(SiriCoreConnectionMetrics *)self setConnectedSubflowCount:0];
    [(SiriCoreConnectionMetrics *)self setPrimarySubflowInterfaceName:0];
    [(SiriCoreConnectionMetrics *)self setSubflowSwitchCounts:0];
    if (!v10) {
      goto LABEL_41;
    }
LABEL_14:
    v26 = (void *)nw_connection_copy_connected_remote_endpoint();
    if (v26)
    {
      uint64_t description = nw_endpoint_get_description();
      if (description)
      {
        v28 = (void *)[[NSString alloc] initWithUTF8String:description];
        if (v28) {
          [(SiriCoreConnectionMetrics *)self setConnectionEdgeID:v28];
        }

        goto LABEL_29;
      }
      v33 = @"addressUnavailable";
    }
    else
    {
      if ([v11 count])
      {
        v44 = v14;
        uint64_t v29 = [v11 count];
        id v30 = objc_alloc_init(MEMORY[0x263F089D8]);
        if (v29)
        {
          for (uint64_t i = 0; i != v29; ++i)
          {
            if (i) {
              [v30 appendString:@","];
            }
            v32 = [v11 objectAtIndexedSubscript:i];
            [v30 appendString:v32];
          }
        }
        [(SiriCoreConnectionMetrics *)self setConnectionEdgeID:v30];

        v14 = v44;
        goto LABEL_29;
      }
      v33 = @"peerUnavailable";
    }
    [(SiriCoreConnectionMetrics *)self setConnectionEdgeID:v33];
LABEL_29:
    *(void *)v49 = 0;
    uint64_t v50 = 0;
    uint64_t v51 = 0;
    if (nw_connection_fillout_tcp_statistics())
    {
      v34 = [NSNumber numberWithUnsignedInt:*(unsigned int *)v49];
      [(SiriCoreConnectionMetrics *)self setDnsResolutionTime:v34];

      v35 = [NSNumber numberWithUnsignedInt:*(unsigned int *)&v49[4]];
      [(SiriCoreConnectionMetrics *)self setConnectionStartTimeToDNSResolutionTimeMsec:v35];

      v36 = [NSNumber numberWithUnsignedInt:v50];
      [(SiriCoreConnectionMetrics *)self setConnectionEstablishmentTimeMsec:v36];

      v37 = [NSNumber numberWithUnsignedInt:HIDWORD(v50)];
      [(SiriCoreConnectionMetrics *)self setConnectionStartTimeToConnectionEstablishmentTimeMsec:v37];

      v38 = [NSNumber numberWithUnsignedInt:v51];
      [(SiriCoreConnectionMetrics *)self setTlsHandshakeTimeMsec:v38];

      v39 = [NSNumber numberWithUnsignedInt:HIDWORD(v51)];
      [(SiriCoreConnectionMetrics *)self setConnectionStartTimeToTLSHandshakeTimeMsec:v39];

      v40 = MEMORY[0x21D4B8F10]();
      v41 = nw_connection_copy_protocol_metadata(v10, v40);

      int negotiated_tls_protocol_version = sec_protocol_metadata_get_negotiated_tls_protocol_version(v41);
      switch(negotiated_tls_protocol_version)
      {
        case 768:
          v43 = @"SSL30";
          break;
        case 769:
          v43 = @"TLS10";
          break;
        case 770:
          v43 = @"TLS11";
          break;
        case 771:
          v43 = @"TLS12";
          break;
        case 772:
          v43 = @"TLS13";
          break;
        default:
          if (negotiated_tls_protocol_version) {
            v43 = @"TLSOther";
          }
          else {
            v43 = @"Unknown";
          }
          break;
      }
      [(SiriCoreConnectionMetrics *)self setTlsVersion:v43];
    }
    goto LABEL_41;
  }
  unsigned int subflow_count = nw_connection_multipath_get_subflow_count();
  v18 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:subflow_count];
  [(SiriCoreConnectionMetrics *)self setSubflowCount:v18];

  v19 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:subflow_count];
  [(SiriCoreConnectionMetrics *)self setConnectedSubflowCount:v19];

  unsigned int primary_subflow_interface_index = nw_connection_multipath_get_primary_subflow_interface_index();
  if (if_indextoname(primary_subflow_interface_index, v49))
  {
    v21 = (void *)[[NSString alloc] initWithUTF8String:v49];
    [(SiriCoreConnectionMetrics *)self setPrimarySubflowInterfaceName:v21];
  }
  uint64_t v22 = nw_connection_multipath_copy_subflow_counts();
  v23 = (void *)v22;
  if (v22 && MEMORY[0x21D4B95F0](v22) == MEMORY[0x263EF8708])
  {
    id v24 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    v45[0] = MEMORY[0x263EF8330];
    v45[1] = 3221225472;
    v45[2] = __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke_2;
    v45[3] = &unk_26443A460;
    id v46 = v24;
    id v25 = v24;
    xpc_dictionary_apply(v23, v45);
    [(SiriCoreConnectionMetrics *)self setSubflowSwitchCounts:v25];
  }
  if (v10) {
    goto LABEL_14;
  }
LABEL_41:
  if (v12) {
    v12[2](v12);
  }
}

uint64_t __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  bytes_ptr = xpc_data_get_bytes_ptr(v5);
  if (bytes_ptr)
  {
    id v7 = bytes_ptr;
    if (xpc_data_get_length(v5) == 408 && MEMORY[0x21D4B95F0](v5) == MEMORY[0x263EF86F8])
    {
      BOOL v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", a2);
      id v9 = [MEMORY[0x263EFF8F8] dataWithBytes:v7 length:408];
      [*(id *)(a1 + 32) setObject:v9 forKey:v8];
    }
  }

  return 1;
}

uint64_t __117__SiriCoreConnectionMetrics_setConnectionMetricsFromNWConnectionForDirect_isMPTCP_attemptedEndpoints_withCompletion___block_invoke_2(uint64_t a1, uint64_t a2, xpc_object_t xuint)
{
  id v5 = [NSNumber numberWithUnsignedLongLong:xpc_uint64_get_value(xuint)];
  v6 = *(void **)(a1 + 32);
  id v7 = [NSString stringWithUTF8String:a2];
  [v6 setObject:v5 forKeyedSubscript:v7];

  return 1;
}

- (void)setConnectionMetricsFromConnection:(id)a3 isPop:(BOOL)a4 isMPTCP:(BOOL)a5 attemptedEndpoints:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a6;
  v14 = (void (**)(void))a7;
  if (!v12)
  {
    id v15 = *MEMORY[0x263F28390];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_ERROR))
    {
      int v16 = 136315138;
      v17 = "-[SiriCoreConnectionMetrics setConnectionMetricsFromConnection:isPop:isMPTCP:attemptedEndpoints:completion:]";
      _os_log_error_impl(&dword_21CBF7000, v15, OS_LOG_TYPE_ERROR, "%s NWConnection nil. Unable to obtain metrics", (uint8_t *)&v16, 0xCu);
      if (!v14) {
        goto LABEL_8;
      }
    }
    else if (!v14)
    {
      goto LABEL_8;
    }
    v14[2](v14);
    goto LABEL_8;
  }
  if (v10) {
    [(SiriCoreConnectionMetrics *)self setConnectionMetricsFromNWConnectionForPOP:v12 withCompletion:v14];
  }
  else {
    [(SiriCoreConnectionMetrics *)self setConnectionMetricsFromNWConnectionForDirect:v12 isMPTCP:v9 attemptedEndpoints:v13 withCompletion:v14];
  }
LABEL_8:
}

- (void)_setConnectionMetricsFromNSPControlConnection:(id)a3 withCompletion:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  BOOL v8 = v7;
  if (v6)
  {
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __90__SiriCoreConnectionMetrics__setConnectionMetricsFromNSPControlConnection_withCompletion___block_invoke;
    v10[3] = &unk_26443A438;
    v10[4] = self;
    id v11 = v7;
    [v6 fetchConnectionInfoWithCompletionHandler:v10];
  }
  else
  {
    if (v7) {
      v7[2](v7);
    }
    BOOL v9 = *MEMORY[0x263F28390];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28390], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v13 = "-[SiriCoreConnectionMetrics _setConnectionMetricsFromNSPControlConnection:withCompletion:]";
      _os_log_error_impl(&dword_21CBF7000, v9, OS_LOG_TYPE_ERROR, "%s NSP Control Connection was nil. Stream did not use NSP.", buf, 0xCu);
    }
  }
}

void __90__SiriCoreConnectionMetrics__setConnectionMetricsFromNSPControlConnection_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v3 = a2;
  v4 = *MEMORY[0x263F28358];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28358], OS_LOG_TYPE_INFO))
  {
    int v32 = 136315138;
    v33 = "-[SiriCoreConnectionMetrics _setConnectionMetricsFromNSPControlConnection:withCompletion:]_block_invoke";
    _os_log_impl(&dword_21CBF7000, v4, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v32, 0xCu);
  }
  id v5 = [v3 TCPInfo];
  [*(id *)(a1 + 32) _setConnectionMetricsTCPInfo:v5];
  int v6 = [v3 isMultipath];
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    BOOL v8 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v3, "multipathSubflowCount"));
    [v7 setSubflowCount:v8];

    BOOL v9 = *(void **)(a1 + 32);
    BOOL v10 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v3, "multipathConnectedSubflowCount"));
    [v9 setConnectedSubflowCount:v10];

    if (if_indextoname([v3 multipathPrimarySubflowInterfaceIndex], (char *)&v32))
    {
      id v11 = *(void **)(a1 + 32);
      id v12 = (void *)[[NSString alloc] initWithUTF8String:&v32];
      [v11 setPrimarySubflowInterfaceName:v12];
    }
    id v13 = [v3 multipathSubflowSwitchCounts];
    if (v13) {
      [*(id *)(a1 + 32) setSubflowSwitchCounts:v13];
    }
  }
  else
  {
    [*(id *)(a1 + 32) setSubflowCount:0];
    [*(id *)(a1 + 32) setConnectedSubflowCount:0];
    [*(id *)(a1 + 32) setPrimarySubflowInterfaceName:0];
    [*(id *)(a1 + 32) setSubflowSwitchCounts:0];
  }
  uint64_t v14 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:@"Tuscany"];
  uint64_t v15 = [v3 pathType];
  int v16 = @"_DirectTCP";
  if (v6)
  {
    int v16 = @"_DirectMPTCP";
    v17 = @"_UnknownMPTCP";
  }
  else
  {
    v17 = @"_UnknownTCP";
  }
  uint64_t v18 = @"_TCP";
  if (v6) {
    uint64_t v18 = @"_MPTCP";
  }
  if (v15 == 1) {
    v17 = v18;
  }
  if (v15 == 2) {
    v19 = v16;
  }
  else {
    v19 = v17;
  }
  [v14 appendString:v19];
  [*(id *)(a1 + 32) setConnectionMethod:v14];
  v20 = [v3 edgeAddress];
  if (v20) {
    [*(id *)(a1 + 32) setConnectionEdgeID:v20];
  }
  unint64_t v21 = [v3 edgeType];
  if (v21 > 3) {
    uint64_t v22 = @"Unavailable";
  }
  else {
    uint64_t v22 = off_26443A480[v21];
  }
  [*(id *)(a1 + 32) setConnectionEdgeType:v22];
  if ([v3 fallbackReason])
  {
    v23 = *(void **)(a1 + 32);
    id v24 = objc_msgSend(objc_alloc(NSNumber), "initWithUnsignedInteger:", objc_msgSend(v3, "fallbackReason"));
    [v23 setConnectionFallbackReason:v24];
  }
  [v3 connectionDelay];
  if (v25 != 0.0)
  {
    v26 = *(void **)(a1 + 32);
    v27 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v26 setConnectionDelay:v27];
  }
  [v3 firstTxByteDelay];
  if (v28 != 0.0)
  {
    uint64_t v29 = *(void **)(a1 + 32);
    id v30 = objc_msgSend(NSNumber, "numberWithDouble:");
    [v29 setFirstTxByteDelay:v30];
  }
  uint64_t v31 = *(void *)(a1 + 40);
  if (v31) {
    (*(void (**)(void))(v31 + 16))();
  }
}

- (void)_setConnectionMetricsTCPInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 count];
  if (v5)
  {
    uint64_t v6 = v5;
    id v7 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v5];
    BOOL v8 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v6];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    id v13 = __58__SiriCoreConnectionMetrics__setConnectionMetricsTCPInfo___block_invoke;
    uint64_t v14 = &unk_26443A410;
    id v15 = v7;
    id v16 = v8;
    id v9 = v8;
    id v10 = v7;
    [v4 enumerateKeysAndObjectsUsingBlock:&v11];
    -[SiriCoreConnectionMetrics setTCPInfoMetricsByInterfaceName:](self, "setTCPInfoMetricsByInterfaceName:", v10, v11, v12, v13, v14);
    [(SiriCoreConnectionMetrics *)self setFlowNetworkInterfaceType:v9];
  }
  else
  {
    [(SiriCoreConnectionMetrics *)self setTCPInfoMetricsByInterfaceName:0];
  }
}

void __58__SiriCoreConnectionMetrics__setConnectionMetricsTCPInfo___block_invoke(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  id v6 = a2;
  SiriCoreConnectionTCPInfoMetricsCreate(v6, [v5 bytes]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKey:v6];
  id v7 = SiriCoreConnectionTechnologyGetDescription(+[SiriCoreNetworkManager connectionTypeForInterface:v6]);
  [*(id *)(a1 + 40) setObject:v7 forKey:v6];
}

- (void)setTCPInfoMetricsByInterfaceName:(id)a3
{
  self->_tcpInfoMetricsByInterfaceName = (NSDictionary *)[a3 copy];

  MEMORY[0x270F9A758]();
}

- (void)setConnectionMetricsFromStreamForPOP:(id)a3 withCompletion:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F58258];
  id v7 = a4;
  id v8 = a3;
  id v9 = (id)[[v6 alloc] initFromStream:v8];

  [(SiriCoreConnectionMetrics *)self _setConnectionMetricsFromNSPControlConnection:v9 withCompletion:v7];
}

- (void)setConnectionMetricsFromStreamForDirect:(id)a3 withCompletion:(id)a4
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  id v8 = [v6 propertyForKey:*MEMORY[0x263EFC6C0]];
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v9];
    uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:v10];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __84__SiriCoreConnectionMetrics_setConnectionMetricsFromStreamForDirect_withCompletion___block_invoke;
    v26[3] = &unk_26443A410;
    id v27 = v11;
    id v28 = v12;
    id v13 = v12;
    id v14 = v11;
    [v8 enumerateKeysAndObjectsUsingBlock:v26];
    [(SiriCoreConnectionMetrics *)self setTCPInfoMetricsByInterfaceName:v14];
    [(SiriCoreConnectionMetrics *)self setFlowNetworkInterfaceType:v13];
  }
  else
  {
    [(SiriCoreConnectionMetrics *)self setTCPInfoMetricsByInterfaceName:0];
  }
  id v15 = [v6 propertyForKey:*MEMORY[0x263EFC768]];
  int v16 = [v15 BOOLValue];

  if (v16)
  {
    v17 = [v6 propertyForKey:*MEMORY[0x263EFC7C8]];
    [(SiriCoreConnectionMetrics *)self setSubflowCount:v17];

    uint64_t v18 = [v6 propertyForKey:*MEMORY[0x263EFC7B8]];
    [(SiriCoreConnectionMetrics *)self setConnectedSubflowCount:v18];

    v19 = [v6 propertyForKey:*MEMORY[0x263EFC7C0]];
    [(SiriCoreConnectionMetrics *)self setPrimarySubflowInterfaceName:v19];

    v20 = [v6 propertyForKey:*MEMORY[0x263EFC7D0]];
    [(SiriCoreConnectionMetrics *)self setSubflowSwitchCounts:v20];
  }
  else
  {
    [(SiriCoreConnectionMetrics *)self setSubflowCount:0];
    [(SiriCoreConnectionMetrics *)self setConnectedSubflowCount:0];
    [(SiriCoreConnectionMetrics *)self setPrimarySubflowInterfaceName:0];
    [(SiriCoreConnectionMetrics *)self setSubflowSwitchCounts:0];
  }
  unint64_t v21 = [v6 propertyForKey:@"__kCFStreamPropertyPeerAddress"];
  uint64_t v22 = v21;
  if (v21)
  {
    id v23 = v21;
    if (!getnameinfo((const sockaddr *)[v23 bytes], objc_msgSend(v23, "length"), v29, 0x100u, 0, 0, 2))
    {
      double v25 = [NSString stringWithCString:v29 encoding:4];
      if (v25) {
        [(SiriCoreConnectionMetrics *)self setConnectionEdgeID:v25];
      }

      if (v7) {
        goto LABEL_12;
      }
      goto LABEL_13;
    }
    id v24 = @"addressUnavailable";
  }
  else
  {
    id v24 = @"peerUnavailable";
  }
  [(SiriCoreConnectionMetrics *)self setConnectionEdgeID:v24];
  if (v7) {
LABEL_12:
  }
    v7[2](v7);
LABEL_13:
}

void __84__SiriCoreConnectionMetrics_setConnectionMetricsFromStreamForDirect_withCompletion___block_invoke(uint64_t a1, void *a2, id a3)
{
  id v5 = a3;
  id v6 = a2;
  SiriCoreConnectionTCPInfoMetricsCreate(v6, [v5 bytes]);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [*(id *)(a1 + 32) setObject:v8 forKey:v6];
  id v7 = SiriCoreConnectionTechnologyGetDescription(+[SiriCoreNetworkManager connectionTypeForInterface:v6]);
  [*(id *)(a1 + 40) setObject:v7 forKey:v6];
}

- (void)setConnectionMetricsFromStream:(id)a3 isPop:(BOOL)a4 withCompletion:(id)a5
{
  if (a4) {
    [(SiriCoreConnectionMetrics *)self setConnectionMetricsFromStreamForPOP:a3 withCompletion:a5];
  }
  else {
    [(SiriCoreConnectionMetrics *)self setConnectionMetricsFromStreamForDirect:a3 withCompletion:a5];
  }
}

@end