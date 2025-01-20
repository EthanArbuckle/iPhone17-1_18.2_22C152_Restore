@interface SNConnectionMetrics
- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)debugConnectionSnapshot;
- (NETSchemaNETSessionConnectionSnapshotCaptured)connectionSnapshot;
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
- (NSString)snapshotTriggerReason;
- (NSString)tlsVersion;
- (NSString)wifiChannelInfo;
- (NSString)wifiPhyMode;
- (SNConnectionMetrics)remoteMetrics;
- (id)getConnectionMetricsDescription;
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
- (void)setConnectionSnapshot:(id)a3;
- (void)setConnectionStartTimeToConnectionEstablishmentTimeMsec:(id)a3;
- (void)setConnectionStartTimeToDNSResolutionTimeMsec:(id)a3;
- (void)setConnectionStartTimeToTLSHandshakeTimeMsec:(id)a3;
- (void)setDebugConnectionSnapshot:(id)a3;
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
- (void)setSnapshotTriggerReason:(id)a3;
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

@implementation SNConnectionMetrics

- (id)getConnectionMetricsDescription
{
  v3 = NSString;
  v4 = [(SNConnectionMetrics *)self connectionMethod];
  v5 = [(SNConnectionMetrics *)self connectionEdgeID];
  v6 = [(SNConnectionMetrics *)self tcpInfoMetricsByInterfaceName];
  v7 = [v3 stringWithFormat:@"ConnectionMethod: %@ on Edge: %@ TCP_INFO: %@", v4, v5, v6];

  return v7;
}

- (SNConnectionMetrics)remoteMetrics
{
  return self->_remoteMetrics;
}

- (void)setRemoteMetrics:(id)a3
{
}

- (NSString)snapshotTriggerReason
{
  return self->_snapshotTriggerReason;
}

- (void)setSnapshotTriggerReason:(id)a3
{
}

- (NSString)providerStyle
{
  return self->_providerStyle;
}

- (void)setProviderStyle:(id)a3
{
}

- (NSNumber)metricsCount
{
  return self->_metricsCount;
}

- (void)setMetricsCount:(id)a3
{
}

- (NSString)policyId
{
  return self->_policyId;
}

- (void)setPolicyId:(id)a3
{
}

- (NSNumber)timeUntilOpen
{
  return self->_timeUntilOpen;
}

- (void)setTimeUntilOpen:(id)a3
{
}

- (NSNumber)timeUntilFirstByteRead
{
  return self->_timeUntilFirstByteRead;
}

- (void)setTimeUntilFirstByteRead:(id)a3
{
}

- (NSNumber)attemptCount
{
  return self->_attemptCount;
}

- (void)setAttemptCount:(id)a3
{
}

- (NSNumber)dnsResolutionTime
{
  return self->_dnsResolutionTime;
}

- (void)setDnsResolutionTime:(id)a3
{
}

- (NSNumber)connectionStartTimeToDNSResolutionTimeMsec
{
  return self->_connectionStartTimeToDNSResolutionTimeMsec;
}

- (void)setConnectionStartTimeToDNSResolutionTimeMsec:(id)a3
{
}

- (NSNumber)connectionEstablishmentTimeMsec
{
  return self->_connectionEstablishmentTimeMsec;
}

- (void)setConnectionEstablishmentTimeMsec:(id)a3
{
}

- (NSNumber)connectionStartTimeToConnectionEstablishmentTimeMsec
{
  return self->_connectionStartTimeToConnectionEstablishmentTimeMsec;
}

- (void)setConnectionStartTimeToConnectionEstablishmentTimeMsec:(id)a3
{
}

- (NSNumber)connectionStartTimeToTLSHandshakeTimeMsec
{
  return self->_connectionStartTimeToTLSHandshakeTimeMsec;
}

- (void)setConnectionStartTimeToTLSHandshakeTimeMsec:(id)a3
{
}

- (NSString)tlsVersion
{
  return self->_tlsVersion;
}

- (void)setTlsVersion:(id)a3
{
}

- (NSNumber)tlsHandshakeTimeMsec
{
  return self->_tlsHandshakeTimeMsec;
}

- (void)setTlsHandshakeTimeMsec:(id)a3
{
}

- (NSNumber)pingCount
{
  return self->_pingCount;
}

- (void)setPingCount:(id)a3
{
}

- (NSNumber)meanPing
{
  return self->_meanPing;
}

- (void)setMeanPing:(id)a3
{
}

- (NSNumber)unacknowledgedPingCount
{
  return self->_unacknowledgedPingCount;
}

- (void)setUnacknowledgedPingCount:(id)a3
{
}

- (NSDictionary)flowNetworkInterfaceType
{
  return self->_flowNetworkInterfaceType;
}

- (void)setFlowNetworkInterfaceType:(id)a3
{
}

- (NSDictionary)tcpInfoMetricsByInterfaceName
{
  return self->_tcpInfoMetricsByInterfaceName;
}

- (void)setTCPInfoMetricsByInterfaceName:(id)a3
{
}

- (NSNumber)subflowCount
{
  return self->_subflowCount;
}

- (void)setSubflowCount:(id)a3
{
}

- (NSNumber)connectedSubflowCount
{
  return self->_connectedSubflowCount;
}

- (void)setConnectedSubflowCount:(id)a3
{
}

- (NSDictionary)subflowSwitchCounts
{
  return self->_subflowSwitchCounts;
}

- (void)setSubflowSwitchCounts:(id)a3
{
}

- (NSString)primarySubflowInterfaceName
{
  return self->_primarySubflowInterfaceName;
}

- (void)setPrimarySubflowInterfaceName:(id)a3
{
}

- (NSString)connectionMethod
{
  return self->_connectionMethod;
}

- (void)setConnectionMethod:(id)a3
{
}

- (NSString)connectionEdgeID
{
  return self->_connectionEdgeID;
}

- (void)setConnectionEdgeID:(id)a3
{
}

- (NSString)connectionEdgeType
{
  return self->_connectionEdgeType;
}

- (void)setConnectionEdgeType:(id)a3
{
}

- (NSArray)connectionMethodHistory
{
  return self->_connectionMethodHistory;
}

- (void)setConnectionMethodHistory:(id)a3
{
}

- (NSNumber)connectionFallbackReason
{
  return self->_connectionFallbackReason;
}

- (void)setConnectionFallbackReason:(id)a3
{
}

- (NSNumber)connectionDelay
{
  return self->_connectionDelay;
}

- (void)setConnectionDelay:(id)a3
{
}

- (NSNumber)firstTxByteDelay
{
  return self->_firstTxByteDelay;
}

- (void)setFirstTxByteDelay:(id)a3
{
}

- (NSString)carrierName
{
  return self->_carrierName;
}

- (void)setCarrierName:(id)a3
{
}

- (NSNumber)signalStrengthBars
{
  return self->_signalStrengthBars;
}

- (void)setSignalStrengthBars:(id)a3
{
}

- (NSNumber)simSubscriptions
{
  return self->_simSubscriptions;
}

- (void)setSimSubscriptions:(id)a3
{
}

- (NSString)wifiPhyMode
{
  return self->_wifiPhyMode;
}

- (void)setWifiPhyMode:(id)a3
{
}

- (NSString)wifiChannelInfo
{
  return self->_wifiChannelInfo;
}

- (void)setWifiChannelInfo:(id)a3
{
}

- (NSNumber)rssi
{
  return self->_rssi;
}

- (void)setRssi:(id)a3
{
}

- (NSNumber)snr
{
  return self->_snr;
}

- (void)setSnr:(id)a3
{
}

- (NSNumber)cca
{
  return self->_cca;
}

- (void)setCca:(id)a3
{
}

- (NSNumber)isCaptive
{
  return self->_isCaptive;
}

- (void)setIsCaptive:(id)a3
{
}

- (NSDictionary)symptomsBasedNetworkQuality
{
  return self->_symptomsBasedNetworkQuality;
}

- (void)setSymptomsBasedNetworkQuality:(id)a3
{
}

- (NSNumber)idsLastMessageDelay
{
  return self->_idsLastMessageDelay;
}

- (void)setIdsLastMessageDelay:(id)a3
{
}

- (NSNumber)idsLastSocketDelay
{
  return self->_idsLastSocketDelay;
}

- (void)setIdsLastSocketDelay:(id)a3
{
}

- (NSNumber)idsLastSocketOpenError
{
  return self->_idsLastSocketOpenError;
}

- (void)setIdsLastSocketOpenError:(id)a3
{
}

- (NETSchemaNETSessionConnectionSnapshotCaptured)connectionSnapshot
{
  return self->_connectionSnapshot;
}

- (void)setConnectionSnapshot:(id)a3
{
}

- (NETSchemaNETDebugSessionConnectionSnapshotCaptured)debugConnectionSnapshot
{
  return self->_debugConnectionSnapshot;
}

- (void)setDebugConnectionSnapshot:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugConnectionSnapshot, 0);
  objc_storeStrong((id *)&self->_connectionSnapshot, 0);
  objc_storeStrong((id *)&self->_idsLastSocketOpenError, 0);
  objc_storeStrong((id *)&self->_idsLastSocketDelay, 0);
  objc_storeStrong((id *)&self->_idsLastMessageDelay, 0);
  objc_storeStrong((id *)&self->_symptomsBasedNetworkQuality, 0);
  objc_storeStrong((id *)&self->_isCaptive, 0);
  objc_storeStrong((id *)&self->_cca, 0);
  objc_storeStrong((id *)&self->_snr, 0);
  objc_storeStrong((id *)&self->_rssi, 0);
  objc_storeStrong((id *)&self->_wifiChannelInfo, 0);
  objc_storeStrong((id *)&self->_wifiPhyMode, 0);
  objc_storeStrong((id *)&self->_simSubscriptions, 0);
  objc_storeStrong((id *)&self->_signalStrengthBars, 0);
  objc_storeStrong((id *)&self->_carrierName, 0);
  objc_storeStrong((id *)&self->_firstTxByteDelay, 0);
  objc_storeStrong((id *)&self->_connectionDelay, 0);
  objc_storeStrong((id *)&self->_connectionFallbackReason, 0);
  objc_storeStrong((id *)&self->_connectionMethodHistory, 0);
  objc_storeStrong((id *)&self->_connectionEdgeType, 0);
  objc_storeStrong((id *)&self->_connectionEdgeID, 0);
  objc_storeStrong((id *)&self->_connectionMethod, 0);
  objc_storeStrong((id *)&self->_primarySubflowInterfaceName, 0);
  objc_storeStrong((id *)&self->_subflowSwitchCounts, 0);
  objc_storeStrong((id *)&self->_connectedSubflowCount, 0);
  objc_storeStrong((id *)&self->_subflowCount, 0);
  objc_storeStrong((id *)&self->_tcpInfoMetricsByInterfaceName, 0);
  objc_storeStrong((id *)&self->_flowNetworkInterfaceType, 0);
  objc_storeStrong((id *)&self->_unacknowledgedPingCount, 0);
  objc_storeStrong((id *)&self->_meanPing, 0);
  objc_storeStrong((id *)&self->_pingCount, 0);
  objc_storeStrong((id *)&self->_tlsHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_tlsVersion, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToTLSHandshakeTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToConnectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionEstablishmentTimeMsec, 0);
  objc_storeStrong((id *)&self->_connectionStartTimeToDNSResolutionTimeMsec, 0);
  objc_storeStrong((id *)&self->_dnsResolutionTime, 0);
  objc_storeStrong((id *)&self->_attemptCount, 0);
  objc_storeStrong((id *)&self->_timeUntilFirstByteRead, 0);
  objc_storeStrong((id *)&self->_timeUntilOpen, 0);
  objc_storeStrong((id *)&self->_policyId, 0);
  objc_storeStrong((id *)&self->_metricsCount, 0);
  objc_storeStrong((id *)&self->_providerStyle, 0);
  objc_storeStrong((id *)&self->_snapshotTriggerReason, 0);

  objc_storeStrong((id *)&self->_remoteMetrics, 0);
}

@end