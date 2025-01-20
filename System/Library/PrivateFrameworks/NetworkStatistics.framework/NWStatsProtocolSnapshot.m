@interface NWStatsProtocolSnapshot
+ (double)_intervalWithContinuousTime:(unint64_t)a3;
+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3;
+ (id)_snapshotWithDictionary:(id)a3;
+ (id)snapshotWithDictionary:(id)a3;
+ (void)_initializeQUICDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4;
+ (void)_initializeTCPDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4;
+ (void)_initializeUDPDescriptor:(nstat_udp_descriptor *)a3 fromDictionary:(id)a4;
+ (void)initialize;
+ (void)logFlowAnomaly:(id)a3 anomaly:(id)a4;
- (BOOL)attributedEntityIsBundleName;
- (BOOL)attributedEntityIsProcessName;
- (BOOL)changedAddress;
- (BOOL)changedEUUID;
- (BOOL)changedEUUIDFromUUID;
- (BOOL)changedEpid;
- (BOOL)changedLocalAddress;
- (BOOL)changedLocalPort;
- (BOOL)changedMetadata;
- (BOOL)changedOwnership;
- (BOOL)changedPid;
- (BOOL)changedProcname;
- (BOOL)changedRemoteAddress;
- (BOOL)changedRemotePort;
- (BOOL)changedUUID;
- (BOOL)failedConsistencyChecks;
- (BOOL)failedFlowswitchValuesLookup;
- (BOOL)failedNegativeDeltaCheck;
- (BOOL)failedRouteValuesLookup;
- (BOOL)failedRxCountCheck;
- (BOOL)failedSkywalkAction;
- (BOOL)failedTCPMultipleInterfaceCheck;
- (BOOL)flowUsesChannels;
- (BOOL)hasCellTraffic;
- (BOOL)hasCellTrafficDelta;
- (BOOL)hasLocalDestination;
- (BOOL)hasNonLocalDestination;
- (BOOL)hasTraffic;
- (BOOL)hasTrafficDelta;
- (BOOL)hasWiFiTraffic;
- (BOOL)hasWiFiTrafficDelta;
- (BOOL)hasWiredTraffic;
- (BOOL)hasWiredTrafficDelta;
- (BOOL)interfaceAWDL;
- (BOOL)interfaceCellular;
- (BOOL)interfaceCellularViaAnyFallback;
- (BOOL)interfaceCellularViaFallback;
- (BOOL)interfaceCellularViaFastFallback;
- (BOOL)interfaceCellularViaIndependentFallback;
- (BOOL)interfaceCellularViaPreferredFallback;
- (BOOL)interfaceCellularViaSlowFallback;
- (BOOL)interfaceCompanionLink;
- (BOOL)interfaceCompanionLinkBluetooth;
- (BOOL)interfaceConstrained;
- (BOOL)interfaceExpensive;
- (BOOL)interfaceLLW;
- (BOOL)interfaceLoopback;
- (BOOL)interfaceUnknown;
- (BOOL)interfaceWiFi;
- (BOOL)interfaceWired;
- (BOOL)isIPv4;
- (BOOL)isIPv6;
- (BOOL)isKnownInbound;
- (BOOL)isKnownListener;
- (BOOL)isKnownOutbound;
- (BOOL)isKnownVPNClient;
- (BOOL)isKnownVPNFromKernel;
- (BOOL)isKnownVPNProvider;
- (BOOL)isSimpleInterface:(unsigned int)a3;
- (BOOL)uiBackgroundAudioCapable;
- (NSData)localAddress;
- (NSData)remoteAddress;
- (NSDate)flowSnapshotTimestamp;
- (NSDate)flowStartTimestamp;
- (NSString)countsDescription;
- (NSString)descriptorDescription;
- (NSString)flowType;
- (NSString)flowTypeLowerCase;
- (NSString)interfaceCellularViaFallbackString;
- (NSString)localAddressString;
- (NSString)remoteAddressString;
- (NSString)savedAccumulatorCountsDescription;
- (NSString)savedCountsDescription;
- (NSString)verboseDescription;
- (NSUUID)flowuuid;
- (NSUUID)vuuid;
- (NWStatsProtocolSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8;
- (accumulator_bytes)_update_adjustment_bytes;
- (const)_update_delta_ptr;
- (const)_update_ptr;
- (double)_rttAverage;
- (double)_rttMinimum;
- (double)_rttVariation;
- (double)flowDuration;
- (double)flowSnapshotTimeIntervalSince1970;
- (double)flowSnapshotTimeIntervalSinceReferenceDate;
- (double)flowStartTimeIntervalSince1970;
- (double)flowStartTimeIntervalSinceReferenceDate;
- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16];
- (id)_interfaceCellularViaFallbackConciseString;
- (id)_nstatCountsDictionaryForm:(nstat_counts *)a3;
- (id)_quicDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3;
- (id)_tcpDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3;
- (id)_udpDescriptorDictionaryForm:(nstat_udp_descriptor *)a3;
- (id)attributionReasonString;
- (id)briefDescription;
- (id)description;
- (id)dictionaryForm;
- (id)domainDescription;
- (id)snapshotReasonString;
- (unint64_t)_adjustedByteCount:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5;
- (unint64_t)_byteOverheadForPacketCount:(unint64_t)a3;
- (unint64_t)_deltaForCurrentBytes:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5 prevBytes:(unint64_t)a6 prevOtherBytes:(unint64_t)a7 prevPackets:(unint64_t)a8;
- (unint64_t)deltaAccountingRxCellularBytes;
- (unint64_t)deltaAccountingRxCompanionLinkBluetoothBytes;
- (unint64_t)deltaAccountingRxWiFiBytes;
- (unint64_t)deltaAccountingRxWiredBytes;
- (unint64_t)deltaAccountingTxCellularBytes;
- (unint64_t)deltaAccountingTxCompanionLinkBluetoothBytes;
- (unint64_t)deltaAccountingTxWiFiBytes;
- (unint64_t)deltaAccountingTxWiredBytes;
- (unint64_t)deltaRxBytes;
- (unint64_t)deltaRxCellularBytes;
- (unint64_t)deltaRxCompanionLinkBluetoothBytes;
- (unint64_t)deltaRxPackets;
- (unint64_t)deltaRxWiFiBytes;
- (unint64_t)deltaRxWiredBytes;
- (unint64_t)deltaTxBytes;
- (unint64_t)deltaTxCellularBytes;
- (unint64_t)deltaTxCompanionLinkBluetoothBytes;
- (unint64_t)deltaTxPackets;
- (unint64_t)deltaTxWiFiBytes;
- (unint64_t)deltaTxWiredBytes;
- (unint64_t)eventFlags;
- (unint64_t)flowStartContinuousTime;
- (unint64_t)networkActivityMapPart1;
- (unint64_t)networkActivityMapPart2;
- (unint64_t)networkActivityMapStartTime;
- (unint64_t)rawDeltaRxCellularBytes;
- (unint64_t)rawDeltaRxCompanionLinkBluetoothBytes;
- (unint64_t)rawDeltaRxWiFiBytes;
- (unint64_t)rawDeltaRxWiredBytes;
- (unint64_t)rawDeltaTxCellularBytes;
- (unint64_t)rawDeltaTxCompanionLinkBluetoothBytes;
- (unint64_t)rawDeltaTxWiFiBytes;
- (unint64_t)rawDeltaTxWiredBytes;
- (unint64_t)rawRxCellularBytes;
- (unint64_t)rawRxCompanionLinkBluetoothBytes;
- (unint64_t)rawRxWiFiBytes;
- (unint64_t)rawRxWiredBytes;
- (unint64_t)rawTxCellularBytes;
- (unint64_t)rawTxCompanionLinkBluetoothBytes;
- (unint64_t)rawTxWiFiBytes;
- (unint64_t)rawTxWiredBytes;
- (unint64_t)rxBytes;
- (unint64_t)rxCellularBytes;
- (unint64_t)rxCompanionLinkBluetoothBytes;
- (unint64_t)rxPackets;
- (unint64_t)rxWiFiBytes;
- (unint64_t)rxWiredBytes;
- (unint64_t)sourceIdentifier;
- (unint64_t)txBytes;
- (unint64_t)txCellularBytes;
- (unint64_t)txCompanionLinkBluetoothBytes;
- (unint64_t)txPackets;
- (unint64_t)txWiFiBytes;
- (unint64_t)txWiredBytes;
- (unsigned)_deltaRxDuplicateBytes;
- (unsigned)_deltaRxOutOfOrderBytes;
- (unsigned)_deltaTxRetransmittedBytes;
- (unsigned)_rxDuplicateBytes;
- (unsigned)_rxOutOfOrderBytes;
- (unsigned)_txRetransmittedBytes;
- (unsigned)ifnet_properties;
- (unsigned)interfaceIndex;
- (unsigned)localPort;
- (unsigned)receiveBufferSize;
- (unsigned)receiveBufferUsed;
- (unsigned)remotePort;
- (unsigned)trafficClass;
- (void)applyTrafficAdjustmentFactor:(double)a3;
- (void)donateBytesToAccumulator;
- (void)removeBytesFromAccumulator;
- (void)runConsistencyChecks;
- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6;
- (void)setDomainName:(id)a3 owner:(id)a4 context:(id)a5 attributedBundleId:(id)a6 isTracker:(BOOL)a7 isNonAppInitiated:(BOOL)a8 isSilent:(BOOL)a9;
- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3;
- (void)setIsKnownVPNClient:(BOOL)a3;
- (void)setIsKnownVPNProvider:(BOOL)a3;
- (void)setUiBackgroundAudioCapable:(BOOL)a3;
@end

@implementation NWStatsProtocolSnapshot

- (unint64_t)txBytes
{
  return self->_nstat_update.hdr.counts.nstat_txbytes;
}

- (unint64_t)rxBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxbytes;
}

- (BOOL)failedConsistencyChecks
{
  return (self->_flags & 0xF00) != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteAddressString, 0);
  objc_storeStrong((id *)&self->_localAddressString, 0);
  objc_storeStrong((id *)&self->_remoteAddress, 0);
  objc_storeStrong((id *)&self->_localAddress, 0);
  objc_storeStrong((id *)&self->_flowuuid, 0);
  objc_storeStrong((id *)&self->_vuuid, 0);
  objc_storeStrong((id *)&self->_flowSnapshotTimestamp, 0);
  objc_storeStrong((id *)&self->_flowStartTimestamp, 0);
}

- (void)setDomainName:(id)a3 owner:(id)a4 context:(id)a5 attributedBundleId:(id)a6 isTracker:(BOOL)a7 isNonAppInitiated:(BOOL)a8 isSilent:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v22 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  if (v22)
  {
    v18 = (void *)[[NSString alloc] initWithString:v22];
    [(NWStatsSnapshot *)self setDomainName:v18];

    if (v15) {
      goto LABEL_3;
    }
  }
  else
  {
    [(NWStatsSnapshot *)self setDomainName:0];
    if (v15)
    {
LABEL_3:
      v19 = (void *)[[NSString alloc] initWithString:v15];
      [(NWStatsSnapshot *)self setDomainOwner:v19];

      if (v16) {
        goto LABEL_4;
      }
LABEL_8:
      [(NWStatsSnapshot *)self setDomainTrackerContext:0];
      if (v17) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  [(NWStatsSnapshot *)self setDomainOwner:0];
  if (!v16) {
    goto LABEL_8;
  }
LABEL_4:
  v20 = (void *)[[NSString alloc] initWithString:v16];
  [(NWStatsSnapshot *)self setDomainTrackerContext:v20];

  if (v17)
  {
LABEL_5:
    v21 = (void *)[[NSString alloc] initWithString:v17];
    [(NWStatsSnapshot *)self setDomainAttributedBundleId:v21];

    goto LABEL_10;
  }
LABEL_9:
  [(NWStatsSnapshot *)self setDomainAttributedBundleId:0];
LABEL_10:
  [(NWStatsSnapshot *)self setIsTracker:v10];
  [(NWStatsSnapshot *)self setIsNonAppInitiated:v9];
  [(NWStatsSnapshot *)self setIsSilent:a9];
}

- (void)setAppStateIsForeground:(BOOL)a3 screenStateOn:(BOOL)a4 startAppStateIsForeground:(BOOL)a5 startScreenStateOn:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  [(NWStatsSnapshot *)self setSnapshotAppStateIsForeground:a3];
  [(NWStatsSnapshot *)self setSnapshotScreenStateOn:v8];
  [(NWStatsSnapshot *)self setStartAppStateIsForeground:v7];
  [(NWStatsSnapshot *)self setStartScreenStateOn:v6];
}

- (NWStatsProtocolSnapshot)initWithUpdate:(const nstat_msg_src_update_convenient *)a3 startTime:(double)a4 flowFlags:(unsigned int)a5 previously:(update_subset_for_deltas *)a6 bluetoothCounts:(const nstat_interface_counts *)a7 peerEgressCellularCounts:(const nstat_interface_counts *)a8
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v27.receiver = self;
  v27.super_class = (Class)NWStatsProtocolSnapshot;
  v12 = [(NWStatsProtocolSnapshot *)&v27 init];
  v13 = (NWStatsProtocolSnapshot *)v12;
  if (v12)
  {
    *((_DWORD *)v12 + 52) = a5;
    long long v15 = *(_OWORD *)&a6->savedTxPackets;
    long long v14 = *(_OWORD *)&a6->savedRxCellularBytes;
    *(_OWORD *)(v12 + 216) = *(_OWORD *)&a6->savedRxPackets;
    *(_OWORD *)(v12 + 232) = v15;
    *(_OWORD *)(v12 + 248) = v14;
    long long v16 = *(_OWORD *)&a6->savedRxDuplicateBytes;
    long long v18 = *(_OWORD *)&a6->savedRxWiredBytes;
    long long v17 = *(_OWORD *)&a6->savedTxCellularBytes;
    *(_OWORD *)(v12 + 296) = *(_OWORD *)&a6->savedTxWiredBytes;
    *(_OWORD *)(v12 + 312) = v16;
    *(_OWORD *)(v12 + 264) = v18;
    *(_OWORD *)(v12 + 280) = v17;
    v12[932] = 0;
    if (a7)
    {
      long long v19 = *(_OWORD *)&a7->nstat_txpackets;
      *(_OWORD *)(v12 + 872) = *(_OWORD *)&a7->nstat_rxpackets;
      *(_OWORD *)(v12 + 888) = v19;
    }
    unsigned int provider = a3->hdr.provider;
    if (provider <= 0xA)
    {
      if (((1 << provider) & 0x430) != 0)
      {
        v21 = v12 + 376;
        id v22 = a3;
        size_t v23 = 432;
        goto LABEL_10;
      }
      if (((1 << provider) & 0xC) != 0 || provider == 8)
      {
        v21 = v12 + 376;
        id v22 = a3;
        size_t v23 = 496;
LABEL_10:
        memcpy(v21, v22, v23);
        return v13;
      }
    }
    v25 = NStatGetLog();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      unsigned int v26 = a3->hdr.provider;
      *(_DWORD *)buf = 67109120;
      unsigned int v29 = v26;
      _os_log_impl(&dword_21C4BC000, v25, OS_LOG_TYPE_ERROR, "unknown provider %d type for snapshot", buf, 8u);
    }

    return 0;
  }
  return v13;
}

- (void)runConsistencyChecks
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  v3 = [(NWStatsProtocolSnapshot *)self _update_ptr];
  v4 = [(NWStatsProtocolSnapshot *)self _update_delta_ptr];
  unint64_t nstat_rxbytes = v3->hdr.counts.nstat_rxbytes;
  if (v3->hdr.counts.nstat_rxpackets < v4->savedRxPackets
    || nstat_rxbytes < v4->savedRxBytes
    || v3->hdr.counts.nstat_txpackets < v4->savedTxPackets
    || v3->hdr.counts.nstat_txbytes < v4->savedTxBytes
    || (unint64_t nstat_cell_rxbytes = v3->hdr.counts.nstat_cell_rxbytes, nstat_cell_rxbytes < v4->savedRxCellularBytes)
    || v3->hdr.counts.nstat_cell_txbytes < v4->savedTxCellularBytes
    || (unint64_t nstat_wifi_rxbytes = v3->hdr.counts.nstat_wifi_rxbytes, nstat_wifi_rxbytes < v4->savedRxWiFiBytes)
    || v3->hdr.counts.nstat_wifi_txbytes < v4->savedTxWiFiBytes
    || (unint64_t nstat_wired_rxbytes = v3->hdr.counts.nstat_wired_rxbytes, nstat_wired_rxbytes < v4->savedRxWiredBytes)
    || v3->hdr.counts.nstat_wired_txbytes < v4->savedTxWiredBytes
    || v3->hdr.counts.nstat_rxduplicatebytes < v4->savedRxDuplicateBytes
    || v3->hdr.counts.nstat_rxoutoforderbytes < v4->savedRxOutOfOrderBytes
    || v3->hdr.counts.nstat_txretransmit < v4->savedTxRetransmittedBytes)
  {
    self->_flags |= 0x100u;
    unint64_t nstat_cell_rxbytes = v3->hdr.counts.nstat_cell_rxbytes;
    unint64_t nstat_wifi_rxbytes = v3->hdr.counts.nstat_wifi_rxbytes;
    unint64_t nstat_wired_rxbytes = v3->hdr.counts.nstat_wired_rxbytes;
  }
  if (nstat_wifi_rxbytes + nstat_cell_rxbytes + nstat_wired_rxbytes < nstat_rxbytes
    && ![(NWStatsProtocolSnapshot *)self interfaceUnknown]
    && ![(NWStatsProtocolSnapshot *)self interfaceLoopback]
    && ![(NWStatsProtocolSnapshot *)self interfaceCompanionLink]
    && (self->_flags & 0x10) != 0
    && [(NWStatsProtocolSnapshot *)self noBluetoothUseExpected:[(NWStatsProtocolSnapshot *)self interfaceIndex]]&& v3->hdr.counts.nstat_cell_rxbytes + v3->hdr.counts.nstat_wifi_rxbytes + v3->hdr.counts.nstat_wired_rxbytes + 100 < v3->hdr.counts.nstat_rxbytes)
  {
    self->_flags |= 0x200u;
  }
  if ((self->_flags & 0x10) != 0)
  {
    if (v3->hdr.counts.nstat_cell_rxbytes || (unint64_t nstat_cell_txbytes = v3->hdr.counts.nstat_cell_txbytes) != 0) {
      LODWORD(nstat_cell_txbytes) = 1;
    }
    if (v3->hdr.counts.nstat_wifi_rxbytes || v3->hdr.counts.nstat_wifi_txbytes) {
      LODWORD(nstat_cell_txbytes) = nstat_cell_txbytes + 1;
    }
    if (v3->hdr.counts.nstat_wired_rxbytes || v3->hdr.counts.nstat_wired_txbytes) {
      LODWORD(nstat_cell_txbytes) = nstat_cell_txbytes + 1;
    }
    if (nstat_cell_txbytes >= 2
      && [(NWStatsProtocolSnapshot *)self fixedInterfaceUseExpected:[(NWStatsProtocolSnapshot *)self interfaceIndex]])
    {
      self->_flags |= 0x400u;
    }
  }
  BOOL v10 = [(NWStatsProtocolSnapshot *)self failedSkywalkAction];
  unsigned int flags = self->_flags;
  if (v10)
  {
    flags |= 0x800u;
    self->_unsigned int flags = flags;
  }
  if ((flags & 0xF00) != 0)
  {
    v12 = NStatGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unsigned int v13 = self->_flags;
      long long v14 = &stru_26CCA59A8;
      if ((v13 & 0x100) != 0) {
        long long v15 = @"(negative delta) ";
      }
      else {
        long long v15 = &stru_26CCA59A8;
      }
      if ((v13 & 0x200) != 0) {
        long long v16 = @"(inconsistent rx counts) ";
      }
      else {
        long long v16 = &stru_26CCA59A8;
      }
      if ((v13 & 0x400) != 0) {
        long long v17 = @"(multiple TCP interfaces) ";
      }
      else {
        long long v17 = &stru_26CCA59A8;
      }
      if ([(NWStatsProtocolSnapshot *)self failedRouteValuesLookup]) {
        long long v18 = @"(no route lookup) ";
      }
      else {
        long long v18 = &stru_26CCA59A8;
      }
      if ([(NWStatsProtocolSnapshot *)self failedFlowswitchValuesLookup]) {
        long long v14 = @"(no flowswitch lookup) ";
      }
      long long v19 = [(NWStatsProtocolSnapshot *)self verboseDescription];
      int v20 = 138413570;
      v21 = v15;
      __int16 v22 = 2112;
      size_t v23 = v16;
      __int16 v24 = 2112;
      v25 = v17;
      __int16 v26 = 2112;
      objc_super v27 = v18;
      __int16 v28 = 2112;
      unsigned int v29 = v14;
      __int16 v30 = 2112;
      v31 = v19;
      _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "failed consistency checks %@%@%@%@%@ %@", (uint8_t *)&v20, 0x3Eu);
    }
  }
}

- (const)_update_ptr
{
  return &self->_nstat_update;
}

- (const)_update_delta_ptr
{
  return &self->_prev_items;
}

- (id)_createNSUUIDForBytes:(unsigned __int8)a3[16]
{
  if (uuid_is_null(a3)) {
    v4 = 0;
  }
  else {
    v4 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3];
  }
  return v4;
}

+ (double)_referenceIntervalWithContinuousTime:(unint64_t)a3
{
  int v5 = 9;
  do
  {
    uint64_t v6 = mach_continuous_time();
    [MEMORY[0x263EFF910] timeIntervalSinceReferenceDate];
    double v8 = v7;
    uint64_t v9 = mach_continuous_time() - v6;
    [a1 _intervalWithContinuousTime:v9];
  }
  while (v10 * 1000000.0 >= 50.0 && v5-- != 0);
  uint64_t v12 = v6 + (v9 >> 1);
  if (v12 <= a3)
  {
    [a1 _intervalWithContinuousTime:a3 - v12];
    return v8 + v15;
  }
  else
  {
    [a1 _intervalWithContinuousTime:v12 - a3];
    return v8 - v13;
  }
}

+ (double)_intervalWithContinuousTime:(unint64_t)a3
{
  LODWORD(v3) = timebase_info_0;
  LODWORD(v4) = *(_DWORD *)algn_26AB127AC;
  return (double)a3 * (double)v3 / (double)v4 / 1000000000.0;
}

- (unint64_t)deltaAccountingRxCellularBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NWStatsProtocolSnapshot *)self deltaRxCellularBytes];
  unint64_t rxCellularBytes = self->_adjustment_bytes.rxCellularBytes;
  BOOL v5 = v3 >= rxCellularBytes;
  unint64_t result = v3 - rxCellularBytes;
  if (!v5)
  {
    double v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(NWStatsProtocolSnapshot *)self deltaRxCellularBytes];
      unint64_t v9 = self->_adjustment_bytes.rxCellularBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxCellularBytes = %llu, adjustmentRxCellularBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaRxCellularBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_nstat_update.hdr.counts.nstat_cell_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_bluetooth_counts.nstat_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets prevBytes:self->_prev_items.savedRxCellularBytes prevOtherBytes:self->_prev_items.savedRxWiredBytes+ self->_prev_items.savedRxWiFiBytes+ self->_prev_items.savedRxCompanionLinkBluetoothBytes prevPackets:self->_prev_items.savedRxPackets];
}

- (unint64_t)deltaAccountingTxWiredBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NWStatsProtocolSnapshot *)self deltaTxWiredBytes];
  unint64_t txWiredBytes = self->_adjustment_bytes.txWiredBytes;
  BOOL v5 = v3 >= txWiredBytes;
  unint64_t result = v3 - txWiredBytes;
  if (!v5)
  {
    double v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(NWStatsProtocolSnapshot *)self deltaTxWiredBytes];
      unint64_t v9 = self->_adjustment_bytes.txWiredBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxWiredBytes = %llu, adjustmentTxWiredBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaTxWiredBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_nstat_update.hdr.counts.nstat_wired_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets prevBytes:self->_prev_items.savedTxWiredBytes prevOtherBytes:self->_prev_items.savedTxWiFiBytes+ self->_prev_items.savedTxCellularBytes+ self->_prev_items.savedTxCompanionLinkBluetoothBytes prevPackets:self->_prev_items.savedTxPackets];
}

- (unint64_t)deltaAccountingRxWiredBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NWStatsProtocolSnapshot *)self deltaRxWiredBytes];
  unint64_t rxWiredBytes = self->_adjustment_bytes.rxWiredBytes;
  BOOL v5 = v3 >= rxWiredBytes;
  unint64_t result = v3 - rxWiredBytes;
  if (!v5)
  {
    double v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(NWStatsProtocolSnapshot *)self deltaRxWiredBytes];
      unint64_t v9 = self->_adjustment_bytes.rxWiredBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxWiredBytes = %llu, adjustmentRxWiredBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaRxWiredBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_nstat_update.hdr.counts.nstat_wired_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets prevBytes:self->_prev_items.savedRxWiredBytes prevOtherBytes:self->_prev_items.savedRxWiFiBytes+ self->_prev_items.savedRxCellularBytes+ self->_prev_items.savedRxCompanionLinkBluetoothBytes prevPackets:self->_prev_items.savedRxPackets];
}

- (unint64_t)deltaAccountingTxCellularBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NWStatsProtocolSnapshot *)self deltaTxCellularBytes];
  unint64_t txCellularBytes = self->_adjustment_bytes.txCellularBytes;
  BOOL v5 = v3 >= txCellularBytes;
  unint64_t result = v3 - txCellularBytes;
  if (!v5)
  {
    double v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(NWStatsProtocolSnapshot *)self deltaTxCellularBytes];
      unint64_t v9 = self->_adjustment_bytes.txCellularBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxCellularBytes = %llu, adjustmentTxCellularBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaAccountingTxWiFiBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NWStatsProtocolSnapshot *)self deltaTxWiFiBytes];
  unint64_t txWiFiBytes = self->_adjustment_bytes.txWiFiBytes;
  BOOL v5 = v3 >= txWiFiBytes;
  unint64_t result = v3 - txWiFiBytes;
  if (!v5)
  {
    double v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(NWStatsProtocolSnapshot *)self deltaTxWiFiBytes];
      unint64_t v9 = self->_adjustment_bytes.txWiFiBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaTxWiFiBytes = %llu, adjustmentTxWiFiBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)deltaAccountingRxWiFiBytes
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  unint64_t v3 = [(NWStatsProtocolSnapshot *)self deltaRxWiFiBytes];
  unint64_t rxWiFiBytes = self->_adjustment_bytes.rxWiFiBytes;
  BOOL v5 = v3 >= rxWiFiBytes;
  unint64_t result = v3 - rxWiFiBytes;
  if (!v5)
  {
    double v7 = NStatGetLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      unint64_t v8 = [(NWStatsProtocolSnapshot *)self deltaRxWiFiBytes];
      unint64_t v9 = self->_adjustment_bytes.rxWiFiBytes;
      int v10 = 134218240;
      unint64_t v11 = v8;
      __int16 v12 = 2048;
      unint64_t v13 = v9;
      _os_log_impl(&dword_21C4BC000, v7, OS_LOG_TYPE_ERROR, "VPN adjustment bytecounts > actual deltas in the snapshot. deltaRxWiFiBytes = %llu, adjustmentRxWiFiBytes = %llu", (uint8_t *)&v10, 0x16u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)_deltaForCurrentBytes:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5 prevBytes:(unint64_t)a6 prevOtherBytes:(unint64_t)a7 prevPackets:(unint64_t)a8
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  if (a3 < a6)
  {
    uint64_t v11 = [[NSString alloc] initWithFormat:@"Flow anomaly: flow %lld has negative bytecount delta, old count %lld new count %lld", -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"), a6, a3];
LABEL_5:
    uint64_t v14 = (void *)v11;
    +[NWStatsProtocolSnapshot logFlowAnomaly:self anomaly:v11];

    return 0;
  }
  if (a5 < a8)
  {
    uint64_t v11 = [[NSString alloc] initWithFormat:@"Flow anomaly: flow %lld has negative packet count delta, old count %lld new count %lld", -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"), a8, a5];
    goto LABEL_5;
  }
  unint64_t v18 = [(NWStatsProtocolSnapshot *)self _adjustedByteCount:a3 otherBytes:a4 packets:a5];
  unint64_t v19 = [(NWStatsProtocolSnapshot *)self _adjustedByteCount:a6 otherBytes:a7 packets:a8];
  BOOL v20 = v18 >= v19;
  unint64_t result = v18 - v19;
  if (!v20)
  {
    v21 = NStatGetLog();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134219520;
      unint64_t v23 = [(NWStatsProtocolSnapshot *)self sourceIdentifier];
      __int16 v24 = 2048;
      unint64_t v25 = a3;
      __int16 v26 = 2048;
      unint64_t v27 = a4;
      __int16 v28 = 2048;
      unint64_t v29 = a5;
      __int16 v30 = 2048;
      unint64_t v31 = a6;
      __int16 v32 = 2048;
      unint64_t v33 = a7;
      __int16 v34 = 2048;
      unint64_t v35 = a8;
      _os_log_impl(&dword_21C4BC000, v21, OS_LOG_TYPE_ERROR, "Inverted numbers in delta calculations for flow %lld, current bytes %lld other bytes %lld pkts %lld when previous bytes %lld other %lld pkts %lld", buf, 0x48u);
    }

    return 0;
  }
  return result;
}

- (unint64_t)_adjustedByteCount:(unint64_t)a3 otherBytes:(unint64_t)a4 packets:(unint64_t)a5
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  if (!a3 || (self->_flags & 0x10) == 0 && [(NWStatsSnapshot *)self snapshotReason] != 2) {
    goto LABEL_19;
  }
  unint64_t v9 = [(NWStatsProtocolSnapshot *)self _byteOverheadForPacketCount:a5];
  if (a4)
  {
    if ((self->_flags & 0x10) == 0)
    {
      unint64_t v9 = (unint64_t)((double)a3 / (double)(a4 + a3) * (double)v9);
      goto LABEL_7;
    }
    uint64_t v11 = NStatGetLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      unint64_t v16 = [(NWStatsProtocolSnapshot *)self sourceIdentifier];
      _os_log_impl(&dword_21C4BC000, v11, OS_LOG_TYPE_ERROR, "Unexpected multiple interface usage for TCP flow %lld", buf, 0xCu);
    }

    __int16 v12 = NStatGetLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      unint64_t v13 = [(NWStatsProtocolSnapshot *)self verboseDescription];
      *(_DWORD *)buf = 138412290;
      unint64_t v16 = (unint64_t)v13;
      _os_log_impl(&dword_21C4BC000, v12, OS_LOG_TYPE_ERROR, "Flow details %@", buf, 0xCu);
    }
LABEL_19:
    unint64_t v9 = 0;
    return v9 + a3;
  }
LABEL_7:
  if (a5 >= 0x65 && v9 > 16 * a3)
  {
    if ((self->_flags & 0x1000000) == 0)
    {
      int v10 = (void *)[[NSString alloc] initWithFormat:@"Possible flow anomaly, flow %lld has minimal average payload when packet counts %lld byte count %lld", -[NWStatsProtocolSnapshot sourceIdentifier](self, "sourceIdentifier"), a5, a3];
      +[NWStatsProtocolSnapshot logFlowAnomaly:self anomaly:v10];
      self->_flags |= 0x1000000u;
    }
    unint64_t v9 = [(NWStatsProtocolSnapshot *)self _byteOverheadForPacketCount:100];
    if (16 * a3 > v9) {
      unint64_t v9 = 16 * a3;
    }
  }
  return v9 + a3;
}

- (unint64_t)_byteOverheadForPacketCount:(unint64_t)a3
{
  unsigned int flags = self->_flags;
  LODWORD(v4) = (flags >> 2) & 8;
  if ((flags & 0x10) != 0) {
    uint64_t v4 = 20;
  }
  else {
    uint64_t v4 = v4;
  }
  uint64_t v5 = v4 + 40;
  if ((flags & 8) == 0) {
    uint64_t v5 = v4;
  }
  uint64_t v6 = v4 + 20;
  if ((flags & 4) != 0) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  return v7 * a3;
}

- (unint64_t)deltaRxWiFiBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_nstat_update.hdr.counts.nstat_wifi_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets prevBytes:self->_prev_items.savedRxWiFiBytes prevOtherBytes:self->_prev_items.savedRxWiredBytes+ self->_prev_items.savedRxCellularBytes+ self->_prev_items.savedRxCompanionLinkBluetoothBytes prevPackets:self->_prev_items.savedRxPackets];
}

- (unint64_t)deltaTxWiFiBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_nstat_update.hdr.counts.nstat_wifi_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets prevBytes:self->_prev_items.savedTxWiFiBytes prevOtherBytes:self->_prev_items.savedTxWiredBytes+ self->_prev_items.savedTxCellularBytes+ self->_prev_items.savedTxCompanionLinkBluetoothBytes prevPackets:self->_prev_items.savedTxPackets];
}

- (unint64_t)deltaTxCellularBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_nstat_update.hdr.counts.nstat_cell_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_bluetooth_counts.nstat_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets prevBytes:self->_prev_items.savedTxCellularBytes prevOtherBytes:self->_prev_items.savedTxWiredBytes+ self->_prev_items.savedTxWiFiBytes+ self->_prev_items.savedTxCompanionLinkBluetoothBytes prevPackets:self->_prev_items.savedTxPackets];
}

+ (void)logFlowAnomaly:(id)a3 anomaly:(id)a4
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = a4;
  os_unfair_lock_lock((os_unfair_lock_t)&flowsWithAnomalousCountsLock);
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v5, "sourceIdentifier"));
  if ([v5 snapshotReason] == 2)
  {
    [(id)flowsWithAnomalousCounts removeObject:v7];
  }
  else
  {
    if ((unint64_t)[(id)flowsWithAnomalousCounts count] > 0x64
      || ([(id)flowsWithAnomalousCounts containsObject:v7] & 1) != 0)
    {
      goto LABEL_11;
    }
    [(id)flowsWithAnomalousCounts addObject:v7];
  }
  unint64_t v8 = NStatGetLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_21C4BC000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@", (uint8_t *)&v11, 0xCu);
  }

  unint64_t v9 = NStatGetLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = [v5 verboseDescription];
    int v11 = 138412290;
    id v12 = v10;
    _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_DEFAULT, "Flow details for anomalous flow condition: %{pubic}@", (uint8_t *)&v11, 0xCu);
  }
LABEL_11:

  os_unfair_lock_unlock((os_unfair_lock_t)&flowsWithAnomalousCountsLock);
}

- (unint64_t)sourceIdentifier
{
  return self->_nstat_update.hdr.srcref;
}

- (unint64_t)txPackets
{
  return self->_nstat_update.hdr.counts.nstat_txpackets;
}

- (unint64_t)rxPackets
{
  return self->_nstat_update.hdr.counts.nstat_rxpackets;
}

- (BOOL)attributedEntityIsProcessName
{
  int v2 = [(NWStatsSnapshot *)self attributionReason];
  return attributionReasonImpliesProcessName(v2);
}

- (BOOL)attributedEntityIsBundleName
{
  unsigned int v2 = [(NWStatsSnapshot *)self attributionReason];
  return attributionReasonImpliesBundleName(v2);
}

- (unint64_t)rxCellularBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_nstat_update.hdr.counts.nstat_cell_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_bluetooth_counts.nstat_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets];
}

- (unint64_t)txCellularBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_nstat_update.hdr.counts.nstat_cell_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_bluetooth_counts.nstat_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets];
}

- (unint64_t)rxWiFiBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_nstat_update.hdr.counts.nstat_wifi_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets];
}

- (unint64_t)txWiFiBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_nstat_update.hdr.counts.nstat_wifi_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wired_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets];
}

- (unsigned)_txRetransmittedBytes
{
  return self->_nstat_update.hdr.counts.nstat_txretransmit;
}

- (unsigned)_rxOutOfOrderBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxoutoforderbytes;
}

- (unsigned)_rxDuplicateBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxduplicatebytes;
}

- (unsigned)_deltaTxRetransmittedBytes
{
  return self->_nstat_update.hdr.counts.nstat_txretransmit - self->_prev_items.savedTxRetransmittedBytes;
}

- (unsigned)_deltaRxOutOfOrderBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxoutoforderbytes - self->_prev_items.savedRxOutOfOrderBytes;
}

- (unsigned)_deltaRxDuplicateBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxduplicatebytes - self->_prev_items.savedRxDuplicateBytes;
}

- (id)snapshotReasonString
{
  int v2 = [(NWStatsSnapshot *)self snapshotReason] - 1;
  if (v2 > 3) {
    return @"unknown";
  }
  else {
    return *(&off_264405470 + v2);
  }
}

- (NSString)interfaceCellularViaFallbackString
{
  if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaFastFallback])
  {
    unint64_t v3 = @"fastFallback";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaSlowFallback])
  {
    unint64_t v3 = @"slowFallback";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaPreferredFallback])
  {
    unint64_t v3 = @"preferredFallback";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaIndependentFallback])
  {
    unint64_t v3 = @"independentFallback";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaAnyFallback])
  {
    unint64_t v3 = @"unqualifiedFallback";
  }
  else
  {
    unint64_t v3 = &stru_26CCA59A8;
  }
  return (NSString *)v3;
}

- (id)_interfaceCellularViaFallbackConciseString
{
  if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaFastFallback])
  {
    unint64_t v3 = @"fastRNF ";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaSlowFallback])
  {
    unint64_t v3 = @"slowRNF ";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaPreferredFallback])
  {
    unint64_t v3 = @"prefRNF ";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaIndependentFallback])
  {
    unint64_t v3 = @"indRNF ";
  }
  else if ([(NWStatsProtocolSnapshot *)self interfaceCellularViaAnyFallback])
  {
    unint64_t v3 = @"unqualifiedRNF ";
  }
  else
  {
    unint64_t v3 = &stru_26CCA59A8;
  }
  return v3;
}

- (id)description
{
  id v15 = [NSString alloc];
  uint64_t v14 = [(NWStatsSnapshot *)self processName];
  uint64_t v13 = [(NWStatsProtocolSnapshot *)self flowType];
  unint64_t v12 = [(NWStatsProtocolSnapshot *)self sourceIdentifier];
  int v11 = [(NWStatsProtocolSnapshot *)self snapshotReasonString];
  BOOL v3 = [(NWStatsProtocolSnapshot *)self failedConsistencyChecks];
  uint64_t v4 = &stru_26CCA59A8;
  if (v3) {
    uint64_t v4 = @"-inconsistent";
  }
  int v10 = v4;
  unint64_t v9 = [(NWStatsProtocolSnapshot *)self _interfaceCellularViaFallbackConciseString];
  BOOL v5 = [(NWStatsProtocolSnapshot *)self flowUsesChannels];
  id v6 = @"so";
  if (v5) {
    id v6 = @"ch";
  }
  uint64_t v7 = objc_msgSend(v15, "initWithFormat:", @"%@ %@ flow id %lld (%@%@) %@%@ i/f %d props 0x%x first %d pkts rx %lld tx %lld, bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld comp_bt %lld %lld deltas %lld %lld %lld %lld %lld %lld %lld %lld %lld %lld acct_deltas %lld %lld %lld %lld %lld %lld", v14, v13, v12, v11, v10, v9, v6, -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"), -[NWStatsProtocolSnapshot ifnet_properties](self, "ifnet_properties"), -[NWStatsSnapshot firstOccurrence](self, "firstOccurrence"), -[NWStatsProtocolSnapshot rxPackets](self, "rxPackets"), -[NWStatsProtocolSnapshot txPackets](self, "txPackets"), -[NWStatsProtocolSnapshot rxBytes](self, "rxBytes"), -[NWStatsProtocolSnapshot txBytes](self, "txBytes"), -[NWStatsProtocolSnapshot rxCellularBytes](self, "rxCellularBytes"), -[NWStatsProtocolSnapshot txCellularBytes](self, "txCellularBytes"),
                 [(NWStatsProtocolSnapshot *)self rxWiFiBytes],
                 [(NWStatsProtocolSnapshot *)self txWiFiBytes],
                 [(NWStatsProtocolSnapshot *)self rxWiredBytes],
                 [(NWStatsProtocolSnapshot *)self txWiredBytes],
                 [(NWStatsProtocolSnapshot *)self rxCompanionLinkBluetoothBytes],
                 [(NWStatsProtocolSnapshot *)self txCompanionLinkBluetoothBytes],
                 [(NWStatsProtocolSnapshot *)self deltaRxBytes],
                 [(NWStatsProtocolSnapshot *)self deltaTxBytes],
                 [(NWStatsProtocolSnapshot *)self deltaRxCellularBytes],
                 [(NWStatsProtocolSnapshot *)self deltaTxCellularBytes],
                 [(NWStatsProtocolSnapshot *)self deltaRxWiFiBytes],
                 [(NWStatsProtocolSnapshot *)self deltaTxWiFiBytes],
                 [(NWStatsProtocolSnapshot *)self deltaRxWiredBytes],
                 [(NWStatsProtocolSnapshot *)self deltaTxWiredBytes],
                 [(NWStatsProtocolSnapshot *)self deltaRxCompanionLinkBluetoothBytes], [(NWStatsProtocolSnapshot *)self deltaTxCompanionLinkBluetoothBytes], [(NWStatsProtocolSnapshot *)self deltaAccountingRxCellularBytes], [(NWStatsProtocolSnapshot *)self deltaAccountingTxCellularBytes], [(NWStatsProtocolSnapshot *)self deltaAccountingRxWiFiBytes], [(NWStatsProtocolSnapshot *)self deltaAccountingTxWiFiBytes], [(NWStatsProtocolSnapshot *)self deltaAccountingRxWiredBytes], [(NWStatsProtocolSnapshot *)self deltaAccountingTxWiredBytes]);

  return v7;
}

- (id)briefDescription
{
  id v12 = [NSString alloc];
  BOOL v3 = [(NWStatsSnapshot *)self processName];
  uint64_t v4 = [(NWStatsProtocolSnapshot *)self flowType];
  unint64_t v11 = [(NWStatsProtocolSnapshot *)self sourceIdentifier];
  BOOL v5 = [(NWStatsProtocolSnapshot *)self snapshotReasonString];
  if ([(NWStatsProtocolSnapshot *)self failedConsistencyChecks]) {
    id v6 = @"-inconsistent";
  }
  else {
    id v6 = &stru_26CCA59A8;
  }
  uint64_t v7 = [(NWStatsProtocolSnapshot *)self _interfaceCellularViaFallbackConciseString];
  if ([(NWStatsProtocolSnapshot *)self flowUsesChannels]) {
    unint64_t v8 = @"ch";
  }
  else {
    unint64_t v8 = @"so";
  }
  unint64_t v9 = (void *)[v12 initWithFormat:@"%@ %@ flow id %lld (%@%@) %@%@ pkts rx %lld tx %lld, bytes %lld %lld", v3, v4, v11, v5, v6, v7, v8, -[NWStatsProtocolSnapshot rxPackets](self, "rxPackets"), -[NWStatsProtocolSnapshot txPackets](self, "txPackets"), -[NWStatsProtocolSnapshot rxBytes](self, "rxBytes"), -[NWStatsProtocolSnapshot txBytes](self, "txBytes")];

  return v9;
}

- (id)domainDescription
{
  id v14 = [NSString alloc];
  BOOL v3 = [(NWStatsSnapshot *)self processName];
  uint64_t v4 = [(NWStatsProtocolSnapshot *)self flowType];
  unint64_t v5 = [(NWStatsProtocolSnapshot *)self sourceIdentifier];
  id v6 = [(NWStatsProtocolSnapshot *)self snapshotReasonString];
  uint64_t v7 = [(NWStatsProtocolSnapshot *)self flowuuid];
  unint64_t v8 = [(NWStatsSnapshot *)self domainName];
  unint64_t v9 = [(NWStatsSnapshot *)self domainOwner];
  int v10 = [(NWStatsSnapshot *)self domainTrackerContext];
  unint64_t v11 = [(NWStatsSnapshot *)self domainAttributedBundleId];
  id v12 = (void *)[v14 initWithFormat:@"%@ %@ flow id %lld (%@) fuuid %@ domain name %@ owner %@ context %@ attributed %@ silent %d", v3, v4, v5, v6, v7, v8, v9, v10, v11, -[NWStatsSnapshot isSilent](self, "isSilent")];

  return v12;
}

- (NSString)countsDescription
{
  int v2 = [(NWStatsProtocolSnapshot *)self _update_ptr];
  BOOL v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"count rx/tx pkts %lld %lld bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld dup %d ooo %d retx %d", v2->hdr.counts.nstat_rxpackets, v2->hdr.counts.nstat_txpackets, v2->hdr.counts.nstat_rxbytes, v2->hdr.counts.nstat_txbytes, v2->hdr.counts.nstat_cell_rxbytes, v2->hdr.counts.nstat_cell_txbytes, v2->hdr.counts.nstat_wifi_rxbytes, v2->hdr.counts.nstat_wifi_txbytes, v2->hdr.counts.nstat_wired_rxbytes, v2->hdr.counts.nstat_wired_txbytes, v2->hdr.counts.nstat_rxduplicatebytes, v2->hdr.counts.nstat_rxoutoforderbytes, v2->hdr.counts.nstat_txretransmit);
  return (NSString *)v3;
}

- (NSString)savedCountsDescription
{
  int v2 = [(NWStatsProtocolSnapshot *)self _update_delta_ptr];
  BOOL v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"saved rx/tx pkts %lld %lld bytes %lld %lld cell %lld %lld wifi %lld %lld wired %lld %lld dup %d ooo %d retx %d", v2->savedRxPackets, v2->savedTxPackets, v2->savedRxBytes, v2->savedTxBytes, v2->savedRxCellularBytes, v2->savedTxCellularBytes, v2->savedRxWiFiBytes, v2->savedTxWiFiBytes, v2->savedRxWiredBytes, v2->savedTxWiredBytes, v2->savedRxDuplicateBytes, v2->savedRxOutOfOrderBytes, v2->savedTxRetransmittedBytes);
  return (NSString *)v3;
}

- (NSString)savedAccumulatorCountsDescription
{
  int v2 = [(NWStatsProtocolSnapshot *)self _update_adjustment_bytes];
  BOOL v3 = objc_msgSend([NSString alloc], "initWithFormat:", @"saved rx/tx cell %lld %lld wifi %lld %lld wired %lld %lld", v2->rxCellularBytes, v2->txCellularBytes, v2->rxWiFiBytes, v2->txWiFiBytes, v2->rxWiredBytes, v2->txWiredBytes);
  return (NSString *)v3;
}

- (NSString)verboseDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = [(NWStatsProtocolSnapshot *)self briefDescription];
  unint64_t v5 = [(NWStatsProtocolSnapshot *)self countsDescription];
  id v6 = [(NWStatsProtocolSnapshot *)self savedCountsDescription];
  uint64_t v7 = [(NWStatsProtocolSnapshot *)self savedAccumulatorCountsDescription];
  unint64_t v8 = [(NWStatsProtocolSnapshot *)self descriptorDescription];
  unint64_t v9 = (void *)[v3 initWithFormat:@"%@\n    %@\n    %@\n    %@\n    %@", v4, v5, v6, v7, v8];

  return (NSString *)v9;
}

- (NSString)descriptorDescription
{
  return 0;
}

- (NSString)flowType
{
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0)
  {
    if ((flags & 4) != 0)
    {
      return (NSString *)@"TCP4";
    }
    else if ((flags & 8) != 0)
    {
      return (NSString *)@"TCP6";
    }
    else
    {
      return (NSString *)@"TCP??";
    }
  }
  else
  {
    if ((flags & 0x20) == 0) {
      return (NSString *)@"???";
    }
    unsigned int v4 = self->_flags & 0xCC;
    if (v4 > 0x47)
    {
      switch(v4)
      {
        case 0x48u:
          return (NSString *)@"QUIC6";
        case 0x84u:
          return (NSString *)@"UDPSUBFLOW4";
        case 0x88u:
          return (NSString *)@"UDPSUBFLOW6";
      }
    }
    else
    {
      switch(v4)
      {
        case 4u:
          return (NSString *)@"UDP4";
        case 8u:
          return (NSString *)@"UDP6";
        case 0x44u:
          return (NSString *)@"QUIC4";
      }
    }
    return (NSString *)@"UDP??";
  }
}

- (NSString)flowTypeLowerCase
{
  unsigned int flags = self->_flags;
  if ((flags & 0x10) != 0)
  {
    if ((flags & 4) != 0)
    {
      return (NSString *)@"tcp4";
    }
    else if ((flags & 8) != 0)
    {
      return (NSString *)@"tcp6";
    }
    else
    {
      return (NSString *)@"tcp??";
    }
  }
  else
  {
    if ((flags & 0x20) == 0) {
      return (NSString *)@"???";
    }
    unsigned int v4 = self->_flags & 0xCC;
    if (v4 > 0x47)
    {
      switch(v4)
      {
        case 0x48u:
          return (NSString *)@"quic6";
        case 0x84u:
          return (NSString *)@"udp-sflow4";
        case 0x88u:
          return (NSString *)@"udp-sflow6";
      }
    }
    else
    {
      switch(v4)
      {
        case 4u:
          return (NSString *)@"udp4";
        case 8u:
          return (NSString *)@"udp6";
        case 0x44u:
          return (NSString *)@"quic4";
      }
    }
    return (NSString *)@"udp??";
  }
}

- (BOOL)isIPv4
{
  return (LOBYTE(self->_flags) >> 2) & 1;
}

- (BOOL)isIPv6
{
  return (LOBYTE(self->_flags) >> 3) & 1;
}

- (BOOL)changedMetadata
{
  return (self->_flags & 0x3FF000) != 0;
}

- (BOOL)changedAddress
{
  return (self->_flags & 0x1E0000) != 0;
}

- (BOOL)changedLocalAddress
{
  return (BYTE2(self->_flags) >> 1) & 1;
}

- (BOOL)changedLocalPort
{
  return (BYTE2(self->_flags) >> 3) & 1;
}

- (BOOL)changedRemoteAddress
{
  return (BYTE2(self->_flags) >> 2) & 1;
}

- (BOOL)changedRemotePort
{
  return (BYTE2(self->_flags) >> 4) & 1;
}

- (BOOL)changedOwnership
{
  return (self->_flags & 0x21F000) != 0;
}

- (BOOL)changedUUID
{
  return (BYTE1(self->_flags) >> 4) & 1;
}

- (BOOL)changedEUUID
{
  return (BYTE1(self->_flags) >> 5) & 1;
}

- (BOOL)changedEUUIDFromUUID
{
  return (BYTE1(self->_flags) >> 6) & 1;
}

- (BOOL)changedEpid
{
  return BYTE2(self->_flags) & 1;
}

- (BOOL)changedPid
{
  return BYTE1(self->_flags) >> 7;
}

- (BOOL)changedProcname
{
  return (BYTE2(self->_flags) >> 5) & 1;
}

- (unint64_t)eventFlags
{
  return self->_nstat_update.hdr.event_flags;
}

- (unint64_t)rxWiredBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_nstat_update.hdr.counts.nstat_wired_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_bluetooth_counts.nstat_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets];
}

- (unint64_t)rxCompanionLinkBluetoothBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_bluetooth_counts.nstat_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_nstat_update.hdr.counts.nstat_wired_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets];
}

- (unint64_t)rawRxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes;
}

- (unint64_t)rawRxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes;
}

- (unint64_t)rawRxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes;
}

- (unint64_t)rawRxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_rxbytes;
}

- (unint64_t)txWiredBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_nstat_update.hdr.counts.nstat_wired_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_bluetooth_counts.nstat_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets];
}

- (unint64_t)txCompanionLinkBluetoothBytes
{
  return [(NWStatsProtocolSnapshot *)self _adjustedByteCount:self->_bluetooth_counts.nstat_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_nstat_update.hdr.counts.nstat_wired_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets];
}

- (unint64_t)rawTxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_txbytes;
}

- (unint64_t)rawTxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_txbytes;
}

- (unint64_t)rawTxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_txbytes;
}

- (unint64_t)rawTxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_txbytes;
}

- (double)_rttMinimum
{
  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_min_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttAverage
{
  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_avg_rtt;
  return (double)v2 / 32000.0;
}

- (double)_rttVariation
{
  LODWORD(v2) = self->_nstat_update.hdr.counts.nstat_var_rtt;
  return (double)v2 / 32000.0;
}

- (unint64_t)deltaRxPackets
{
  return self->_nstat_update.hdr.counts.nstat_rxpackets - self->_prev_items.savedRxPackets;
}

- (unint64_t)deltaRxBytes
{
  return self->_nstat_update.hdr.counts.nstat_rxbytes - self->_prev_items.savedRxBytes;
}

- (unint64_t)deltaTxPackets
{
  return self->_nstat_update.hdr.counts.nstat_txpackets - self->_prev_items.savedTxPackets;
}

- (unint64_t)deltaTxBytes
{
  return self->_nstat_update.hdr.counts.nstat_txbytes - self->_prev_items.savedTxBytes;
}

- (unint64_t)deltaRxCompanionLinkBluetoothBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_bluetooth_counts.nstat_rxbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_rxbytes+ self->_nstat_update.hdr.counts.nstat_cell_rxbytes+ self->_nstat_update.hdr.counts.nstat_wired_rxbytes packets:self->_nstat_update.hdr.counts.nstat_rxpackets prevBytes:self->_prev_items.savedRxCompanionLinkBluetoothBytes prevOtherBytes:self->_prev_items.savedRxWiFiBytes+ self->_prev_items.savedRxCellularBytes+ self->_prev_items.savedRxWiredBytes prevPackets:self->_prev_items.savedRxPackets];
}

- (unint64_t)deltaTxCompanionLinkBluetoothBytes
{
  return [(NWStatsProtocolSnapshot *)self _deltaForCurrentBytes:self->_bluetooth_counts.nstat_txbytes otherBytes:self->_nstat_update.hdr.counts.nstat_wifi_txbytes+ self->_nstat_update.hdr.counts.nstat_cell_txbytes+ self->_nstat_update.hdr.counts.nstat_wired_txbytes packets:self->_nstat_update.hdr.counts.nstat_txpackets prevBytes:self->_prev_items.savedTxCompanionLinkBluetoothBytes prevOtherBytes:self->_prev_items.savedTxWiFiBytes+ self->_prev_items.savedTxCellularBytes+ self->_prev_items.savedTxWiredBytes prevPackets:self->_prev_items.savedTxPackets];
}

- (unint64_t)rawDeltaRxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes - self->_prev_items.savedRxCellularBytes;
}

- (unint64_t)rawDeltaRxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes - self->_prev_items.savedRxWiFiBytes;
}

- (unint64_t)rawDeltaRxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes - self->_prev_items.savedRxWiredBytes;
}

- (unint64_t)rawDeltaRxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_rxbytes - self->_prev_items.savedRxCompanionLinkBluetoothBytes;
}

- (unint64_t)rawDeltaTxCellularBytes
{
  return self->_nstat_update.hdr.counts.nstat_cell_txbytes - self->_prev_items.savedTxCellularBytes;
}

- (unint64_t)rawDeltaTxWiFiBytes
{
  return self->_nstat_update.hdr.counts.nstat_wifi_txbytes - self->_prev_items.savedTxWiFiBytes;
}

- (unint64_t)rawDeltaTxWiredBytes
{
  return self->_nstat_update.hdr.counts.nstat_wired_txbytes - self->_prev_items.savedTxWiredBytes;
}

- (unint64_t)rawDeltaTxCompanionLinkBluetoothBytes
{
  return self->_bluetooth_counts.nstat_txbytes - self->_prev_items.savedTxCompanionLinkBluetoothBytes;
}

- (BOOL)hasTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes
      || self->_nstat_update.hdr.counts.nstat_wifi_txbytes
      || self->_nstat_update.hdr.counts.nstat_cell_rxbytes
      || self->_nstat_update.hdr.counts.nstat_cell_txbytes
      || self->_nstat_update.hdr.counts.nstat_wired_rxbytes
      || self->_nstat_update.hdr.counts.nstat_wired_txbytes != 0;
}

- (BOOL)hasTrafficDelta
{
  if ([(NWStatsProtocolSnapshot *)self hasCellTrafficDelta]
    || [(NWStatsProtocolSnapshot *)self hasWiFiTrafficDelta])
  {
    return 1;
  }
  return [(NWStatsProtocolSnapshot *)self hasWiredTrafficDelta];
}

- (BOOL)hasCellTraffic
{
  return self->_nstat_update.hdr.counts.nstat_cell_rxbytes || self->_nstat_update.hdr.counts.nstat_cell_txbytes != 0;
}

- (BOOL)hasCellTrafficDelta
{
  return [(NWStatsProtocolSnapshot *)self rawDeltaRxCellularBytes]
      || [(NWStatsProtocolSnapshot *)self rawDeltaTxCellularBytes] != 0;
}

- (BOOL)hasWiFiTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wifi_rxbytes || self->_nstat_update.hdr.counts.nstat_wifi_txbytes != 0;
}

- (BOOL)hasWiFiTrafficDelta
{
  return [(NWStatsProtocolSnapshot *)self rawDeltaRxWiFiBytes]
      || [(NWStatsProtocolSnapshot *)self rawDeltaTxWiFiBytes] != 0;
}

- (BOOL)hasWiredTraffic
{
  return self->_nstat_update.hdr.counts.nstat_wired_rxbytes || self->_nstat_update.hdr.counts.nstat_wired_txbytes != 0;
}

- (BOOL)hasWiredTrafficDelta
{
  return [(NWStatsProtocolSnapshot *)self rawDeltaRxWiredBytes]
      || [(NWStatsProtocolSnapshot *)self rawDeltaTxWiredBytes] != 0;
}

- (accumulator_bytes)_update_adjustment_bytes
{
  return &self->_adjustment_bytes;
}

- (BOOL)failedNegativeDeltaCheck
{
  return BYTE1(self->_flags) & 1;
}

- (BOOL)failedTCPMultipleInterfaceCheck
{
  return (BYTE1(self->_flags) >> 2) & 1;
}

- (BOOL)failedRxCountCheck
{
  return (BYTE1(self->_flags) >> 1) & 1;
}

- (BOOL)isSimpleInterface:(unsigned int)a3
{
  unint64_t v9 = 0;
  if (getifaddrs(&v9) < 0) {
    return 0;
  }
  unsigned int v4 = v9;
  if (!v9)
  {
LABEL_11:
    MEMORY[0x21D4A8140](v4);
    return 0;
  }
  unint64_t v5 = v9;
  while (1)
  {
    ifa_addr = v5->ifa_addr;
    if (ifa_addr)
    {
      ifa_name = v5->ifa_name;
      if (ifa_name)
      {
        if (ifa_addr->sa_family == 18
          && *(unsigned __int16 *)ifa_addr->sa_data == a3
          && (!strncmp(v5->ifa_name, "en", 2uLL) || !strncmp(ifa_name, "pdp", 3uLL)))
        {
          break;
        }
      }
    }
    unint64_t v5 = v5->ifa_next;
    if (!v5) {
      goto LABEL_11;
    }
  }
  MEMORY[0x21D4A8140](v4);
  return 1;
}

- (BOOL)isKnownVPNFromKernel
{
  return LOBYTE(self->_flags) >> 7;
}

- (id)_tcpDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v5 = [NSNumber numberWithUnsignedLongLong:a3->upid];
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  id v6 = [NSNumber numberWithUnsignedLongLong:a3->eupid];
  [v4 setObject:v6 forKeyedSubscript:@"eupid"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->start_timestamp];
  [v4 setObject:v7 forKeyedSubscript:@"start_timestamp"];

  unint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3->timestamp];
  [v4 setObject:v8 forKeyedSubscript:@"timestamp"];

  unint64_t v9 = [NSNumber numberWithUnsignedInt:a3->ifindex];
  [v4 setObject:v9 forKeyedSubscript:@"ifindex"];

  int v10 = [NSNumber numberWithUnsignedInt:a3->state];
  [v4 setObject:v10 forKeyedSubscript:@"state"];

  unint64_t v11 = [NSNumber numberWithUnsignedInt:a3->sndbufsize];
  [v4 setObject:v11 forKeyedSubscript:@"sndbufsize"];

  id v12 = [NSNumber numberWithUnsignedInt:a3->sndbufused];
  [v4 setObject:v12 forKeyedSubscript:@"sndbufused"];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:a3->rcvbufsize];
  [v4 setObject:v13 forKeyedSubscript:@"rcvbufsize"];

  id v14 = [NSNumber numberWithUnsignedInt:a3->rcvbufused];
  [v4 setObject:v14 forKeyedSubscript:@"rcvbufused"];

  id v15 = [NSNumber numberWithUnsignedInt:a3->txunacked];
  [v4 setObject:v15 forKeyedSubscript:@"txunacked"];

  unint64_t v16 = [NSNumber numberWithUnsignedInt:a3->txwindow];
  [v4 setObject:v16 forKeyedSubscript:@"txwindow"];

  uint64_t v17 = [NSNumber numberWithUnsignedInt:a3->txcwindow];
  [v4 setObject:v17 forKeyedSubscript:@"txcwindow"];

  unint64_t v18 = [NSNumber numberWithUnsignedInt:a3->traffic_class];
  [v4 setObject:v18 forKeyedSubscript:@"traffic_class"];

  unint64_t v19 = [NSNumber numberWithUnsignedInt:a3->traffic_mgt_flags];
  [v4 setObject:v19 forKeyedSubscript:@"traffic_mgt_flags"];

  BOOL v20 = [NSNumber numberWithUnsignedInt:a3->pid];
  [v4 setObject:v20 forKeyedSubscript:@"pid"];

  v21 = [NSNumber numberWithUnsignedInt:a3->epid];
  [v4 setObject:v21 forKeyedSubscript:@"epid"];

  [v4 setObject:@"tbd" forKeyedSubscript:@"local"];
  [v4 setObject:@"tbd" forKeyedSubscript:@"remote"];
  __int16 v22 = [NSString stringWithUTF8String:a3->cc_algo];
  [v4 setObject:v22 forKeyedSubscript:@"cc_algo"];

  unint64_t v23 = [NSString stringWithUTF8String:a3->pname];
  [v4 setObject:v23 forKeyedSubscript:@"pname"];

  __int16 v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->uuid];
  unint64_t v25 = [v24 UUIDString];
  [v4 setObject:v25 forKeyedSubscript:@"uuid"];

  __int16 v26 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->euuid];
  unint64_t v27 = [v26 UUIDString];
  [v4 setObject:v27 forKeyedSubscript:@"euuid"];

  __int16 v28 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->vuuid];
  unint64_t v29 = [v28 UUIDString];
  [v4 setObject:v29 forKeyedSubscript:@"vuuid"];

  __int16 v30 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->fuuid];
  unint64_t v31 = [v30 UUIDString];
  [v4 setObject:v31 forKeyedSubscript:@"fuuid"];

  __int16 v32 = [NSNumber numberWithUnsignedShort:LOWORD(a3->ifnet_properties)];
  [v4 setObject:v32 forKeyedSubscript:@"ifnet_properties"];

  unint64_t v33 = [NSNumber numberWithBool:a3->var0.__pad_connstatus[0] & 1];
  [v4 setObject:v33 forKeyedSubscript:@"probe_activated"];

  __int16 v34 = [NSNumber numberWithBool:(a3->var0.__pad_connstatus[0] >> 1) & 1];
  [v4 setObject:v34 forKeyedSubscript:@"write_probe_failed"];

  unint64_t v35 = [NSNumber numberWithBool:(a3->var0.__pad_connstatus[0] >> 2) & 1];
  [v4 setObject:v35 forKeyedSubscript:@"read_probe_failed"];

  uint64_t v36 = [NSNumber numberWithBool:(a3->var0.__pad_connstatus[0] >> 3) & 1];
  [v4 setObject:v36 forKeyedSubscript:@"conn_probe_failed"];

  return v4;
}

- (id)_udpDescriptorDictionaryForm:(nstat_udp_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v5 = [NSNumber numberWithUnsignedLongLong:a3->upid];
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  id v6 = [NSNumber numberWithUnsignedLongLong:a3->eupid];
  [v4 setObject:v6 forKeyedSubscript:@"eupid"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->start_timestamp];
  [v4 setObject:v7 forKeyedSubscript:@"start_timestamp"];

  unint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3->timestamp];
  [v4 setObject:v8 forKeyedSubscript:@"timestamp"];

  unint64_t v9 = [NSNumber numberWithUnsignedInt:a3->ifindex];
  [v4 setObject:v9 forKeyedSubscript:@"ifindex"];

  int v10 = [NSNumber numberWithUnsignedInt:a3->rcvbufsize];
  [v4 setObject:v10 forKeyedSubscript:@"rcvbufsize"];

  unint64_t v11 = [NSNumber numberWithUnsignedInt:a3->rcvbufused];
  [v4 setObject:v11 forKeyedSubscript:@"rcvbufused"];

  id v12 = [NSNumber numberWithUnsignedInt:a3->traffic_class];
  [v4 setObject:v12 forKeyedSubscript:@"traffic_class"];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:a3->pid];
  [v4 setObject:v13 forKeyedSubscript:@"pid"];

  id v14 = [NSNumber numberWithUnsignedInt:a3->epid];
  [v4 setObject:v14 forKeyedSubscript:@"epid"];

  [v4 setObject:@"tbd" forKeyedSubscript:@"local"];
  [v4 setObject:@"tbd" forKeyedSubscript:@"remote"];
  id v15 = [NSString stringWithUTF8String:a3->pname];
  [v4 setObject:v15 forKeyedSubscript:@"pname"];

  unint64_t v16 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->uuid];
  uint64_t v17 = [v16 UUIDString];
  [v4 setObject:v17 forKeyedSubscript:@"uuid"];

  unint64_t v18 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->euuid];
  unint64_t v19 = [v18 UUIDString];
  [v4 setObject:v19 forKeyedSubscript:@"euuid"];

  BOOL v20 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->vuuid];
  v21 = [v20 UUIDString];
  [v4 setObject:v21 forKeyedSubscript:@"vuuid"];

  __int16 v22 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->fuuid];
  unint64_t v23 = [v22 UUIDString];
  [v4 setObject:v23 forKeyedSubscript:@"fuuid"];

  __int16 v24 = [NSNumber numberWithUnsignedShort:LOWORD(a3->ifnet_properties)];
  [v4 setObject:v24 forKeyedSubscript:@"ifnet_properties"];

  return v4;
}

- (id)_quicDescriptorDictionaryForm:(nstat_tcp_descriptor *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v5 = [NSNumber numberWithUnsignedLongLong:a3->upid];
  [v4 setObject:v5 forKeyedSubscript:@"upid"];

  id v6 = [NSNumber numberWithUnsignedLongLong:a3->eupid];
  [v4 setObject:v6 forKeyedSubscript:@"eupid"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->start_timestamp];
  [v4 setObject:v7 forKeyedSubscript:@"start_timestamp"];

  unint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3->timestamp];
  [v4 setObject:v8 forKeyedSubscript:@"timestamp"];

  unint64_t v9 = [NSNumber numberWithUnsignedInt:a3->ifindex];
  [v4 setObject:v9 forKeyedSubscript:@"ifindex"];

  int v10 = [NSNumber numberWithUnsignedInt:a3->state];
  [v4 setObject:v10 forKeyedSubscript:@"state"];

  unint64_t v11 = [NSNumber numberWithUnsignedInt:a3->sndbufsize];
  [v4 setObject:v11 forKeyedSubscript:@"sndbufsize"];

  id v12 = [NSNumber numberWithUnsignedInt:a3->sndbufused];
  [v4 setObject:v12 forKeyedSubscript:@"sndbufused"];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:a3->rcvbufsize];
  [v4 setObject:v13 forKeyedSubscript:@"rcvbufsize"];

  id v14 = [NSNumber numberWithUnsignedInt:a3->rcvbufused];
  [v4 setObject:v14 forKeyedSubscript:@"rcvbufused"];

  id v15 = [NSNumber numberWithUnsignedInt:a3->txunacked];
  [v4 setObject:v15 forKeyedSubscript:@"txunacked"];

  unint64_t v16 = [NSNumber numberWithUnsignedInt:a3->txwindow];
  [v4 setObject:v16 forKeyedSubscript:@"txwindow"];

  uint64_t v17 = [NSNumber numberWithUnsignedInt:a3->txcwindow];
  [v4 setObject:v17 forKeyedSubscript:@"txcwindow"];

  unint64_t v18 = [NSNumber numberWithUnsignedInt:a3->traffic_class];
  [v4 setObject:v18 forKeyedSubscript:@"traffic_class"];

  unint64_t v19 = [NSNumber numberWithUnsignedInt:a3->traffic_mgt_flags];
  [v4 setObject:v19 forKeyedSubscript:@"traffic_mgt_flags"];

  BOOL v20 = [NSNumber numberWithUnsignedInt:a3->pid];
  [v4 setObject:v20 forKeyedSubscript:@"pid"];

  v21 = [NSNumber numberWithUnsignedInt:a3->epid];
  [v4 setObject:v21 forKeyedSubscript:@"epid"];

  [v4 setObject:@"tbd" forKeyedSubscript:@"local"];
  [v4 setObject:@"tbd" forKeyedSubscript:@"remote"];
  __int16 v22 = [NSString stringWithUTF8String:a3->cc_algo];
  [v4 setObject:v22 forKeyedSubscript:@"cc_algo"];

  unint64_t v23 = [NSString stringWithUTF8String:a3->pname];
  [v4 setObject:v23 forKeyedSubscript:@"pname"];

  __int16 v24 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->uuid];
  unint64_t v25 = [v24 UUIDString];
  [v4 setObject:v25 forKeyedSubscript:@"uuid"];

  __int16 v26 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->euuid];
  unint64_t v27 = [v26 UUIDString];
  [v4 setObject:v27 forKeyedSubscript:@"euuid"];

  __int16 v28 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->vuuid];
  unint64_t v29 = [v28 UUIDString];
  [v4 setObject:v29 forKeyedSubscript:@"vuuid"];

  __int16 v30 = (void *)[objc_alloc(MEMORY[0x263F08C38]) initWithUUIDBytes:a3->fuuid];
  unint64_t v31 = [v30 UUIDString];
  [v4 setObject:v31 forKeyedSubscript:@"fuuid"];

  __int16 v32 = [NSNumber numberWithUnsignedShort:LOWORD(a3->ifnet_properties)];
  [v4 setObject:v32 forKeyedSubscript:@"ifnet_properties"];

  unint64_t v33 = [NSNumber numberWithBool:a3->var0.__pad_connstatus[0] & 1];
  [v4 setObject:v33 forKeyedSubscript:@"probe_activated"];

  __int16 v34 = [NSNumber numberWithBool:(a3->var0.__pad_connstatus[0] >> 1) & 1];
  [v4 setObject:v34 forKeyedSubscript:@"write_probe_failed"];

  unint64_t v35 = [NSNumber numberWithBool:(a3->var0.__pad_connstatus[0] >> 2) & 1];
  [v4 setObject:v35 forKeyedSubscript:@"read_probe_failed"];

  uint64_t v36 = [NSNumber numberWithBool:(a3->var0.__pad_connstatus[0] >> 3) & 1];
  [v4 setObject:v36 forKeyedSubscript:@"conn_probe_failed"];

  return v4;
}

- (id)_nstatCountsDictionaryForm:(nstat_counts *)a3
{
  id v4 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v5 = [NSNumber numberWithUnsignedLongLong:a3->nstat_rxpackets];
  [v4 setObject:v5 forKeyedSubscript:@"nstat_rxpackets"];

  id v6 = [NSNumber numberWithUnsignedLongLong:a3->nstat_txpackets];
  [v4 setObject:v6 forKeyedSubscript:@"nstat_txpackets"];

  uint64_t v7 = [NSNumber numberWithUnsignedLongLong:a3->nstat_rxbytes];
  [v4 setObject:v7 forKeyedSubscript:@"nstat_rxbytes"];

  unint64_t v8 = [NSNumber numberWithUnsignedLongLong:a3->nstat_txbytes];
  [v4 setObject:v8 forKeyedSubscript:@"nstat_txbytes"];

  unint64_t v9 = [NSNumber numberWithUnsignedLongLong:a3->nstat_cell_rxbytes];
  [v4 setObject:v9 forKeyedSubscript:@"nstat_cell_rxbytes"];

  int v10 = [NSNumber numberWithUnsignedLongLong:a3->nstat_cell_txbytes];
  [v4 setObject:v10 forKeyedSubscript:@"nstat_cell_txbytes"];

  unint64_t v11 = [NSNumber numberWithUnsignedLongLong:a3->nstat_wifi_rxbytes];
  [v4 setObject:v11 forKeyedSubscript:@"nstat_wifi_rxbytes"];

  id v12 = [NSNumber numberWithUnsignedLongLong:a3->nstat_wifi_txbytes];
  [v4 setObject:v12 forKeyedSubscript:@"nstat_wifi_txbytes"];

  uint64_t v13 = [NSNumber numberWithUnsignedLongLong:a3->nstat_wired_rxbytes];
  [v4 setObject:v13 forKeyedSubscript:@"nstat_wired_rxbytes"];

  id v14 = [NSNumber numberWithUnsignedLongLong:a3->nstat_wired_txbytes];
  [v4 setObject:v14 forKeyedSubscript:@"nstat_wired_txbytes"];

  id v15 = [NSNumber numberWithUnsignedInt:a3->nstat_rxduplicatebytes];
  [v4 setObject:v15 forKeyedSubscript:@"nstat_rxduplicatebytes"];

  unint64_t v16 = [NSNumber numberWithUnsignedInt:a3->nstat_rxoutoforderbytes];
  [v4 setObject:v16 forKeyedSubscript:@"nstat_rxoutoforderbytes"];

  uint64_t v17 = [NSNumber numberWithUnsignedInt:a3->nstat_txretransmit];
  [v4 setObject:v17 forKeyedSubscript:@"nstat_txretransmit"];

  unint64_t v18 = [NSNumber numberWithUnsignedInt:a3->nstat_connectattempts];
  [v4 setObject:v18 forKeyedSubscript:@"nstat_connectattempts"];

  unint64_t v19 = [NSNumber numberWithUnsignedInt:a3->nstat_connectsuccesses];
  [v4 setObject:v19 forKeyedSubscript:@"nstat_connectsuccesses"];

  BOOL v20 = [NSNumber numberWithUnsignedInt:a3->nstat_min_rtt];
  [v4 setObject:v20 forKeyedSubscript:@"nstat_min_rtt"];

  v21 = [NSNumber numberWithUnsignedInt:a3->nstat_avg_rtt];
  [v4 setObject:v21 forKeyedSubscript:@"nstat_avg_rtt"];

  __int16 v22 = [NSNumber numberWithUnsignedInt:a3->nstat_var_rtt];
  [v4 setObject:v22 forKeyedSubscript:@"nstat_var_rtt"];

  return v4;
}

- (id)dictionaryForm
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = NSNumber;
  [(NWStatsProtocolSnapshot *)self flowStartTimeIntervalSinceReferenceDate];
  *(float *)&double v5 = v5;
  id v6 = [v4 numberWithFloat:v5];
  [v3 setObject:v6 forKeyedSubscript:@"_startStamp"];

  uint64_t v7 = NSNumber;
  [(NWStatsProtocolSnapshot *)self flowStartTimeIntervalSinceReferenceDate];
  unint64_t v9 = [v7 numberWithUnsignedLongLong:(unint64_t)(v8 * 1000000.0)];
  [v3 setObject:v9 forKeyedSubscript:@"_startStampUsecs"];

  int v10 = NSNumber;
  [(NWStatsProtocolSnapshot *)self flowSnapshotTimeIntervalSinceReferenceDate];
  id v12 = [v10 numberWithUnsignedLongLong:(unint64_t)(v11 * 1000000.0)];
  [v3 setObject:v12 forKeyedSubscript:@"_snapStampUsecs"];

  uint64_t v13 = [NSNumber numberWithUnsignedInt:self->_flags];
  [v3 setObject:v13 forKeyedSubscript:@"_flags"];

  id v14 = [(NWStatsSnapshot *)self attributedEntity];
  if (v14)
  {
    [v3 setObject:v14 forKeyedSubscript:@"attributedEntity"];
  }
  else
  {
    id v15 = [MEMORY[0x263EFF9D0] null];
    [v3 setObject:v15 forKeyedSubscript:@"attributedEntity"];
  }
  unint64_t v16 = [(NWStatsSnapshot *)self delegateName];
  if (v16)
  {
    [v3 setObject:v16 forKeyedSubscript:@"delegateName"];
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263EFF9D0] null];
    [v3 setObject:v17 forKeyedSubscript:@"delegateName"];
  }
  unint64_t v18 = objc_msgSend(NSNumber, "numberWithInt:", -[NWStatsSnapshot attributionReason](self, "attributionReason"));
  [v3 setObject:v18 forKeyedSubscript:@"attributionReason"];

  unint64_t v19 = objc_msgSend(NSNumber, "numberWithInt:", -[NWStatsSnapshot snapshotReason](self, "snapshotReason"));
  [v3 setObject:v19 forKeyedSubscript:@"snapshotReason"];

  BOOL v20 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsSnapshot startAppStateIsForeground](self, "startAppStateIsForeground"));
  [v3 setObject:v20 forKeyedSubscript:@"startAppStateIsForeground"];

  v21 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsSnapshot snapshotAppStateIsForeground](self, "snapshotAppStateIsForeground"));
  [v3 setObject:v21 forKeyedSubscript:@"snapshotAppStateIsForeground"];

  __int16 v22 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsSnapshot startScreenStateOn](self, "startScreenStateOn"));
  [v3 setObject:v22 forKeyedSubscript:@"startScreenStateOn"];

  unint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsSnapshot snapshotScreenStateOn](self, "snapshotScreenStateOn"));
  [v3 setObject:v23 forKeyedSubscript:@"snapshotScreenStateOn"];

  __int16 v24 = objc_msgSend(NSNumber, "numberWithInt:", -[NWStatsSnapshot delegateAttributionReason](self, "delegateAttributionReason"));
  [v3 setObject:v24 forKeyedSubscript:@"delegateAttributionReason"];

  unint64_t v25 = objc_msgSend(NSNumber, "numberWithBool:", -[NWStatsProtocolSnapshot uiBackgroundAudioCapable](self, "uiBackgroundAudioCapable"));
  [v3 setObject:v25 forKeyedSubscript:@"uiBackgroundAudioCapable"];

  id v26 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  unint64_t v27 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedRxPackets];
  [v26 setObject:v27 forKeyedSubscript:@"savedRxPackets"];

  __int16 v28 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedTxPackets];
  [v26 setObject:v28 forKeyedSubscript:@"savedTxPackets"];

  unint64_t v29 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedRxBytes];
  [v26 setObject:v29 forKeyedSubscript:@"savedRxBytes"];

  __int16 v30 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedTxBytes];
  [v26 setObject:v30 forKeyedSubscript:@"savedTxBytes"];

  unint64_t v31 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedRxCellularBytes];
  [v26 setObject:v31 forKeyedSubscript:@"savedRxCellularBytes"];

  __int16 v32 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedTxCellularBytes];
  [v26 setObject:v32 forKeyedSubscript:@"savedTxCellularBytes"];

  unint64_t v33 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedRxWiFiBytes];
  [v26 setObject:v33 forKeyedSubscript:@"savedRxWiFiBytes"];

  __int16 v34 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedTxWiFiBytes];
  [v26 setObject:v34 forKeyedSubscript:@"savedTxWiFiBytes"];

  unint64_t v35 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedRxWiredBytes];
  [v26 setObject:v35 forKeyedSubscript:@"savedRxWiredBytes"];

  uint64_t v36 = [NSNumber numberWithUnsignedLongLong:self->_prev_items.savedTxWiredBytes];
  [v26 setObject:v36 forKeyedSubscript:@"savedTxWiredBytes"];

  v37 = [NSNumber numberWithUnsignedInt:self->_prev_items.savedRxDuplicateBytes];
  [v26 setObject:v37 forKeyedSubscript:@"savedRxDuplicateBytes"];

  v38 = [NSNumber numberWithUnsignedInt:self->_prev_items.savedRxOutOfOrderBytes];
  [v26 setObject:v38 forKeyedSubscript:@"savedRxOutOfOrderBytes"];

  v39 = [NSNumber numberWithUnsignedInt:self->_prev_items.savedTxRetransmittedBytes];
  [v26 setObject:v39 forKeyedSubscript:@"savedTxRetransmittedBytes"];

  [v3 setObject:v26 forKeyedSubscript:@"_prev_items"];
  id v40 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  p_nstat_update = &self->_nstat_update;
  v42 = [NSNumber numberWithUnsignedLongLong:self->_nstat_update.hdr.srcref];
  [v40 setObject:v42 forKeyedSubscript:@"srcref"];

  v43 = [NSNumber numberWithUnsignedLongLong:self->_nstat_update.hdr.event_flags];
  [v40 setObject:v43 forKeyedSubscript:@"event_flags"];

  v44 = [NSNumber numberWithUnsignedInt:self->_nstat_update.hdr.provider];
  [v40 setObject:v44 forKeyedSubscript:@"provider"];

  id v45 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  v46 = [NSNumber numberWithUnsignedLongLong:self->_nstat_update.hdr.hdr.context];
  [v45 setObject:v46 forKeyedSubscript:@"context"];

  v47 = [NSNumber numberWithUnsignedInt:self->_nstat_update.hdr.hdr.type];
  [v45 setObject:v47 forKeyedSubscript:@"type"];

  v48 = [NSNumber numberWithUnsignedShort:self->_nstat_update.hdr.hdr.length];
  [v45 setObject:v48 forKeyedSubscript:@"length"];

  v49 = [NSNumber numberWithUnsignedShort:self->_nstat_update.hdr.hdr.flags];
  [v45 setObject:v49 forKeyedSubscript:@"flags"];

  [v40 setObject:v45 forKeyedSubscript:@"hdr"];
  v50 = [(NWStatsProtocolSnapshot *)self _nstatCountsDictionaryForm:&self->_nstat_update.hdr.counts];
  [v40 setObject:v50 forKeyedSubscript:@"counts"];

  unsigned int provider = self->_nstat_update.hdr.provider;
  if (provider <= 0xA)
  {
    if (((1 << provider) & 0x430) != 0)
    {
      v52 = [(NWStatsProtocolSnapshot *)self _udpDescriptorDictionaryForm:&self->_nstat_update.var0];
      v53 = @"udp_descriptor";
      goto LABEL_14;
    }
    if (((1 << provider) & 0xC) != 0)
    {
      v52 = [(NWStatsProtocolSnapshot *)self _tcpDescriptorDictionaryForm:&self->_nstat_update.var0];
      v53 = @"tcp_descriptor";
LABEL_14:
      [v40 setObject:v52 forKeyedSubscript:v53];
      goto LABEL_15;
    }
    if (provider == 8)
    {
      v52 = [(NWStatsProtocolSnapshot *)self _quicDescriptorDictionaryForm:&self->_nstat_update.var0];
      v53 = @"quic_descriptor";
      goto LABEL_14;
    }
  }
  v52 = NStatGetLog();
  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
  {
    unsigned int v55 = p_nstat_update->hdr.provider;
    v56[0] = 67109120;
    v56[1] = v55;
    _os_log_impl(&dword_21C4BC000, v52, OS_LOG_TYPE_ERROR, "Unexpected provider %d when converting to dictionary form", (uint8_t *)v56, 8u);
  }
LABEL_15:

  [v3 setObject:v40 forKeyedSubscript:@"update"];
  return v3;
}

+ (void)_initializeTCPDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4
{
  id v76 = a4;
  double v5 = [v76 objectForKeyedSubscript:@"upid"];
  a3->upid = [v5 unsignedLongLongValue];

  id v6 = [v76 objectForKeyedSubscript:@"eupid"];
  a3->eupid = [v6 unsignedLongLongValue];

  uint64_t v7 = [v76 objectForKeyedSubscript:@"start_timestamp"];
  a3->start_timestamp = [v7 unsignedLongLongValue];

  double v8 = [v76 objectForKeyedSubscript:@"timestamp"];
  a3->timestamp = [v8 unsignedLongLongValue];

  unint64_t v9 = [v76 objectForKeyedSubscript:@"ifindex"];
  a3->ifindex = [v9 unsignedIntValue];

  int v10 = [v76 objectForKeyedSubscript:@"state"];
  a3->state = [v10 unsignedIntValue];

  double v11 = [v76 objectForKeyedSubscript:@"sndbufsize"];
  a3->sndbufsize = [v11 unsignedIntValue];

  id v12 = [v76 objectForKeyedSubscript:@"sndbufused"];
  a3->sndbufused = [v12 unsignedIntValue];

  uint64_t v13 = [v76 objectForKeyedSubscript:@"rcvbufsize"];
  a3->rcvbufsize = [v13 unsignedIntValue];

  id v14 = [v76 objectForKeyedSubscript:@"rcvbufused"];
  a3->rcvbufused = [v14 unsignedIntValue];

  id v15 = [v76 objectForKeyedSubscript:@"txunacked"];
  a3->txunacked = [v15 unsignedIntValue];

  unint64_t v16 = [v76 objectForKeyedSubscript:@"txwindow"];
  a3->txwindow = [v16 unsignedIntValue];

  uint64_t v17 = [v76 objectForKeyedSubscript:@"txcwindow"];
  a3->txcwindow = [v17 unsignedIntValue];

  unint64_t v18 = [v76 objectForKeyedSubscript:@"traffic_class"];
  a3->traffic_class = [v18 unsignedIntValue];

  unint64_t v19 = [v76 objectForKeyedSubscript:@"traffic_mgt_flags"];
  a3->traffic_mgt_unsigned int flags = [v19 unsignedIntValue];

  BOOL v20 = [v76 objectForKeyedSubscript:@"pid"];
  a3->pid = [v20 unsignedIntValue];

  v21 = [v76 objectForKeyedSubscript:@"epid"];
  a3->epid = [v21 unsignedIntValue];

  uint64_t v22 = [v76 objectForKeyedSubscript:@"cc_algo"];
  if (v22)
  {
    unint64_t v23 = (void *)v22;
    __int16 v24 = [v76 objectForKeyedSubscript:@"cc_algo"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v26 = [v76 objectForKeyedSubscript:@"cc_algo"];
      unint64_t v27 = (unsigned __int8 *)[v26 UTF8String];
      if (!v27) {
        goto LABEL_49;
      }
      cc_algo = a3->cc_algo;
      uint64_t v29 = 16;
      while (1)
      {
        int v30 = *v27;
        char *cc_algo = v30;
        if (!v30) {
          break;
        }
        ++cc_algo;
        ++v27;
        if ((unint64_t)--v29 <= 1)
        {
          char *cc_algo = 0;
          break;
        }
      }
    }
  }
  uint64_t v31 = [v76 objectForKeyedSubscript:@"pname"];
  if (v31)
  {
    __int16 v32 = (void *)v31;
    unint64_t v33 = [v76 objectForKeyedSubscript:@"pname"];
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if (v34)
    {
      id v35 = [v76 objectForKeyedSubscript:@"pname"];
      uint64_t v36 = (unsigned __int8 *)[v35 UTF8String];
      if (v36)
      {
        pname = a3->pname;
        uint64_t v38 = 64;
        while (1)
        {
          int v39 = *v36;
          char *pname = v39;
          if (!v39) {
            break;
          }
          ++pname;
          ++v36;
          if ((unint64_t)--v38 <= 1)
          {
            char *pname = 0;
            break;
          }
        }

        goto LABEL_17;
      }
LABEL_49:
      __break(1u);
      return;
    }
  }
LABEL_17:
  uint64_t v40 = [v76 objectForKeyedSubscript:@"uuid"];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [v76 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    char v43 = objc_opt_isKindOfClass();

    if (v43)
    {
      id v44 = objc_alloc(MEMORY[0x263F08C38]);
      id v45 = [v76 objectForKeyedSubscript:@"uuid"];
      v46 = (void *)[v44 initWithUUIDString:v45];

      if (v46) {
        [v46 getUUIDBytes:a3->uuid];
      }
    }
  }
  uint64_t v47 = [v76 objectForKeyedSubscript:@"euuid"];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [v76 objectForKeyedSubscript:@"euuid"];
    objc_opt_class();
    char v50 = objc_opt_isKindOfClass();

    if (v50)
    {
      id v51 = objc_alloc(MEMORY[0x263F08C38]);
      v52 = [v76 objectForKeyedSubscript:@"euuid"];
      v53 = (void *)[v51 initWithUUIDString:v52];

      if (v53) {
        [v53 getUUIDBytes:a3->euuid];
      }
    }
  }
  uint64_t v54 = [v76 objectForKeyedSubscript:@"vuuid"];
  if (v54)
  {
    unsigned int v55 = (void *)v54;
    v56 = [v76 objectForKeyedSubscript:@"vuuid"];
    objc_opt_class();
    char v57 = objc_opt_isKindOfClass();

    if (v57)
    {
      id v58 = objc_alloc(MEMORY[0x263F08C38]);
      v59 = [v76 objectForKeyedSubscript:@"vuuid"];
      v60 = (void *)[v58 initWithUUIDString:v59];

      if (v60) {
        [v60 getUUIDBytes:a3->vuuid];
      }
    }
  }
  uint64_t v61 = [v76 objectForKeyedSubscript:@"fuuid"];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [v76 objectForKeyedSubscript:@"fuuid"];
    objc_opt_class();
    char v64 = objc_opt_isKindOfClass();

    if (v64)
    {
      id v65 = objc_alloc(MEMORY[0x263F08C38]);
      v66 = [v76 objectForKeyedSubscript:@"fuuid"];
      v67 = (void *)[v65 initWithUUIDString:v66];

      if (v67) {
        [v67 getUUIDBytes:a3->fuuid];
      }
    }
  }
  v68 = [v76 objectForKeyedSubscript:@"ifnet_properties"];
  a3->ifnet_properties = [v68 unsignedShortValue];

  v69 = [v76 objectForKeyedSubscript:@"probe_activated"];
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFE | [v69 BOOLValue];

  v70 = [v76 objectForKeyedSubscript:@"write_probe_failed"];
  if ([v70 BOOLValue]) {
    char v71 = 2;
  }
  else {
    char v71 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFD | v71;

  v72 = [v76 objectForKeyedSubscript:@"read_probe_failed"];
  if ([v72 BOOLValue]) {
    char v73 = 4;
  }
  else {
    char v73 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFB | v73;

  v74 = [v76 objectForKeyedSubscript:@"conn_probe_failed"];
  if ([v74 BOOLValue]) {
    char v75 = 8;
  }
  else {
    char v75 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xF7 | v75;
}

+ (void)_initializeUDPDescriptor:(nstat_udp_descriptor *)a3 fromDictionary:(id)a4
{
  id v53 = a4;
  double v5 = [v53 objectForKeyedSubscript:@"upid"];
  a3->upid = [v5 unsignedLongLongValue];

  id v6 = [v53 objectForKeyedSubscript:@"eupid"];
  a3->eupid = [v6 unsignedLongLongValue];

  uint64_t v7 = [v53 objectForKeyedSubscript:@"start_timestamp"];
  a3->start_timestamp = [v7 unsignedLongLongValue];

  double v8 = [v53 objectForKeyedSubscript:@"timestamp"];
  a3->timestamp = [v8 unsignedLongLongValue];

  unint64_t v9 = [v53 objectForKeyedSubscript:@"ifindex"];
  a3->ifindex = [v9 unsignedIntValue];

  int v10 = [v53 objectForKeyedSubscript:@"rcvbufsize"];
  a3->rcvbufsize = [v10 unsignedIntValue];

  double v11 = [v53 objectForKeyedSubscript:@"rcvbufused"];
  a3->rcvbufused = [v11 unsignedIntValue];

  id v12 = [v53 objectForKeyedSubscript:@"traffic_class"];
  a3->traffic_class = [v12 unsignedIntValue];

  uint64_t v13 = [v53 objectForKeyedSubscript:@"pid"];
  a3->pid = [v13 unsignedIntValue];

  id v14 = [v53 objectForKeyedSubscript:@"epid"];
  a3->epid = [v14 unsignedIntValue];

  uint64_t v15 = [v53 objectForKeyedSubscript:@"pname"];
  if (v15)
  {
    unint64_t v16 = (void *)v15;
    uint64_t v17 = [v53 objectForKeyedSubscript:@"pname"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v19 = [v53 objectForKeyedSubscript:@"pname"];
      BOOL v20 = (unsigned __int8 *)[v19 UTF8String];
      if (!v20)
      {
        __break(1u);
        return;
      }
      pname = a3->pname;
      uint64_t v22 = 64;
      while (1)
      {
        int v23 = *v20;
        char *pname = v23;
        if (!v23) {
          break;
        }
        ++pname;
        ++v20;
        if ((unint64_t)--v22 <= 1)
        {
          char *pname = 0;
          break;
        }
      }
    }
  }
  uint64_t v24 = [v53 objectForKeyedSubscript:@"uuid"];
  if (v24)
  {
    unint64_t v25 = (void *)v24;
    id v26 = [v53 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    char v27 = objc_opt_isKindOfClass();

    if (v27)
    {
      id v28 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v29 = [v53 objectForKeyedSubscript:@"uuid"];
      int v30 = (void *)[v28 initWithUUIDString:v29];

      if (v30) {
        [v30 getUUIDBytes:a3->uuid];
      }
    }
  }
  uint64_t v31 = [v53 objectForKeyedSubscript:@"euuid"];
  if (v31)
  {
    __int16 v32 = (void *)v31;
    unint64_t v33 = [v53 objectForKeyedSubscript:@"euuid"];
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if (v34)
    {
      id v35 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v36 = [v53 objectForKeyedSubscript:@"euuid"];
      v37 = (void *)[v35 initWithUUIDString:v36];

      if (v37) {
        [v37 getUUIDBytes:a3->euuid];
      }
    }
  }
  uint64_t v38 = [v53 objectForKeyedSubscript:@"vuuid"];
  if (v38)
  {
    int v39 = (void *)v38;
    uint64_t v40 = [v53 objectForKeyedSubscript:@"vuuid"];
    objc_opt_class();
    char v41 = objc_opt_isKindOfClass();

    if (v41)
    {
      id v42 = objc_alloc(MEMORY[0x263F08C38]);
      char v43 = [v53 objectForKeyedSubscript:@"vuuid"];
      id v44 = (void *)[v42 initWithUUIDString:v43];

      if (v44) {
        [v44 getUUIDBytes:a3->vuuid];
      }
    }
  }
  uint64_t v45 = [v53 objectForKeyedSubscript:@"fuuid"];
  if (v45)
  {
    v46 = (void *)v45;
    uint64_t v47 = [v53 objectForKeyedSubscript:@"fuuid"];
    objc_opt_class();
    char v48 = objc_opt_isKindOfClass();

    if (v48)
    {
      id v49 = objc_alloc(MEMORY[0x263F08C38]);
      char v50 = [v53 objectForKeyedSubscript:@"fuuid"];
      id v51 = (void *)[v49 initWithUUIDString:v50];

      if (v51) {
        [v51 getUUIDBytes:a3->fuuid];
      }
    }
  }
  v52 = [v53 objectForKeyedSubscript:@"ifnet_properties"];
  a3->ifnet_properties = [v52 unsignedShortValue];
}

+ (void)_initializeQUICDescriptor:(nstat_tcp_descriptor *)a3 fromDictionary:(id)a4
{
  id v76 = a4;
  double v5 = [v76 objectForKeyedSubscript:@"upid"];
  a3->upid = [v5 unsignedLongLongValue];

  id v6 = [v76 objectForKeyedSubscript:@"eupid"];
  a3->eupid = [v6 unsignedLongLongValue];

  uint64_t v7 = [v76 objectForKeyedSubscript:@"start_timestamp"];
  a3->start_timestamp = [v7 unsignedLongLongValue];

  double v8 = [v76 objectForKeyedSubscript:@"timestamp"];
  a3->timestamp = [v8 unsignedLongLongValue];

  unint64_t v9 = [v76 objectForKeyedSubscript:@"ifindex"];
  a3->ifindex = [v9 unsignedIntValue];

  int v10 = [v76 objectForKeyedSubscript:@"state"];
  a3->state = [v10 unsignedIntValue];

  double v11 = [v76 objectForKeyedSubscript:@"sndbufsize"];
  a3->sndbufsize = [v11 unsignedIntValue];

  id v12 = [v76 objectForKeyedSubscript:@"sndbufused"];
  a3->sndbufused = [v12 unsignedIntValue];

  uint64_t v13 = [v76 objectForKeyedSubscript:@"rcvbufsize"];
  a3->rcvbufsize = [v13 unsignedIntValue];

  id v14 = [v76 objectForKeyedSubscript:@"rcvbufused"];
  a3->rcvbufused = [v14 unsignedIntValue];

  uint64_t v15 = [v76 objectForKeyedSubscript:@"txunacked"];
  a3->txunacked = [v15 unsignedIntValue];

  unint64_t v16 = [v76 objectForKeyedSubscript:@"txwindow"];
  a3->txwindow = [v16 unsignedIntValue];

  uint64_t v17 = [v76 objectForKeyedSubscript:@"txcwindow"];
  a3->txcwindow = [v17 unsignedIntValue];

  unint64_t v18 = [v76 objectForKeyedSubscript:@"traffic_class"];
  a3->traffic_class = [v18 unsignedIntValue];

  id v19 = [v76 objectForKeyedSubscript:@"traffic_mgt_flags"];
  a3->traffic_mgt_unsigned int flags = [v19 unsignedIntValue];

  BOOL v20 = [v76 objectForKeyedSubscript:@"pid"];
  a3->pid = [v20 unsignedIntValue];

  v21 = [v76 objectForKeyedSubscript:@"epid"];
  a3->epid = [v21 unsignedIntValue];

  uint64_t v22 = [v76 objectForKeyedSubscript:@"cc_algo"];
  if (v22)
  {
    int v23 = (void *)v22;
    uint64_t v24 = [v76 objectForKeyedSubscript:@"cc_algo"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v26 = [v76 objectForKeyedSubscript:@"cc_algo"];
      char v27 = (unsigned __int8 *)[v26 UTF8String];
      if (!v27) {
        goto LABEL_49;
      }
      cc_algo = a3->cc_algo;
      uint64_t v29 = 16;
      while (1)
      {
        int v30 = *v27;
        char *cc_algo = v30;
        if (!v30) {
          break;
        }
        ++cc_algo;
        ++v27;
        if ((unint64_t)--v29 <= 1)
        {
          char *cc_algo = 0;
          break;
        }
      }
    }
  }
  uint64_t v31 = [v76 objectForKeyedSubscript:@"pname"];
  if (v31)
  {
    __int16 v32 = (void *)v31;
    unint64_t v33 = [v76 objectForKeyedSubscript:@"pname"];
    objc_opt_class();
    char v34 = objc_opt_isKindOfClass();

    if (v34)
    {
      id v35 = [v76 objectForKeyedSubscript:@"pname"];
      uint64_t v36 = (unsigned __int8 *)[v35 UTF8String];
      if (v36)
      {
        pname = a3->pname;
        uint64_t v38 = 64;
        while (1)
        {
          int v39 = *v36;
          char *pname = v39;
          if (!v39) {
            break;
          }
          ++pname;
          ++v36;
          if ((unint64_t)--v38 <= 1)
          {
            char *pname = 0;
            break;
          }
        }

        goto LABEL_17;
      }
LABEL_49:
      __break(1u);
      return;
    }
  }
LABEL_17:
  uint64_t v40 = [v76 objectForKeyedSubscript:@"uuid"];
  if (v40)
  {
    char v41 = (void *)v40;
    id v42 = [v76 objectForKeyedSubscript:@"uuid"];
    objc_opt_class();
    char v43 = objc_opt_isKindOfClass();

    if (v43)
    {
      id v44 = objc_alloc(MEMORY[0x263F08C38]);
      uint64_t v45 = [v76 objectForKeyedSubscript:@"uuid"];
      v46 = (void *)[v44 initWithUUIDString:v45];

      if (v46) {
        [v46 getUUIDBytes:a3->uuid];
      }
    }
  }
  uint64_t v47 = [v76 objectForKeyedSubscript:@"euuid"];
  if (v47)
  {
    char v48 = (void *)v47;
    id v49 = [v76 objectForKeyedSubscript:@"euuid"];
    objc_opt_class();
    char v50 = objc_opt_isKindOfClass();

    if (v50)
    {
      id v51 = objc_alloc(MEMORY[0x263F08C38]);
      v52 = [v76 objectForKeyedSubscript:@"euuid"];
      id v53 = (void *)[v51 initWithUUIDString:v52];

      if (v53) {
        [v53 getUUIDBytes:a3->euuid];
      }
    }
  }
  uint64_t v54 = [v76 objectForKeyedSubscript:@"vuuid"];
  if (v54)
  {
    unsigned int v55 = (void *)v54;
    v56 = [v76 objectForKeyedSubscript:@"vuuid"];
    objc_opt_class();
    char v57 = objc_opt_isKindOfClass();

    if (v57)
    {
      id v58 = objc_alloc(MEMORY[0x263F08C38]);
      v59 = [v76 objectForKeyedSubscript:@"vuuid"];
      v60 = (void *)[v58 initWithUUIDString:v59];

      if (v60) {
        [v60 getUUIDBytes:a3->vuuid];
      }
    }
  }
  uint64_t v61 = [v76 objectForKeyedSubscript:@"fuuid"];
  if (v61)
  {
    v62 = (void *)v61;
    v63 = [v76 objectForKeyedSubscript:@"fuuid"];
    objc_opt_class();
    char v64 = objc_opt_isKindOfClass();

    if (v64)
    {
      id v65 = objc_alloc(MEMORY[0x263F08C38]);
      v66 = [v76 objectForKeyedSubscript:@"fuuid"];
      v67 = (void *)[v65 initWithUUIDString:v66];

      if (v67) {
        [v67 getUUIDBytes:a3->fuuid];
      }
    }
  }
  v68 = [v76 objectForKeyedSubscript:@"ifnet_properties"];
  a3->ifnet_properties = [v68 unsignedShortValue];

  v69 = [v76 objectForKeyedSubscript:@"probe_activated"];
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFE | [v69 BOOLValue];

  v70 = [v76 objectForKeyedSubscript:@"write_probe_failed"];
  if ([v70 BOOLValue]) {
    char v71 = 2;
  }
  else {
    char v71 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFD | v71;

  v72 = [v76 objectForKeyedSubscript:@"read_probe_failed"];
  if ([v72 BOOLValue]) {
    char v73 = 4;
  }
  else {
    char v73 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xFB | v73;

  v74 = [v76 objectForKeyedSubscript:@"conn_probe_failed"];
  if ([v74 BOOLValue]) {
    char v75 = 8;
  }
  else {
    char v75 = 0;
  }
  a3->var0.__pad_connstatus[0] = a3->var0.__pad_connstatus[0] & 0xF7 | v75;
}

+ (id)_snapshotWithDictionary:(id)a3
{
  uint64_t v124 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v121 = 0u;
  memset(v122, 0, sizeof(v122));
  uint64_t v123 = 0;
  v93[11] = 0;
  v93[7] = 0;
  double v5 = [v4 objectForKeyedSubscript:@"update"];
  id v6 = [v4 objectForKeyedSubscript:@"_prev_items"];
  uint64_t v7 = [v5 objectForKeyedSubscript:@"hdr"];
  double v8 = [v5 objectForKeyedSubscript:@"counts"];
  unint64_t v9 = [v6 objectForKeyedSubscript:@"savedRxPackets"];
  v93[0] = [v9 longLongValue];

  int v10 = [v6 objectForKeyedSubscript:@"savedTxPackets"];
  v93[2] = [v10 longLongValue];

  double v11 = [v6 objectForKeyedSubscript:@"savedRxBytes"];
  v93[1] = [v11 longLongValue];

  id v12 = [v6 objectForKeyedSubscript:@"savedTxBytes"];
  v93[3] = [v12 longLongValue];

  uint64_t v13 = [v6 objectForKeyedSubscript:@"savedRxCellularBytes"];
  v93[4] = [v13 longLongValue];

  id v14 = [v6 objectForKeyedSubscript:@"savedTxCellularBytes"];
  v93[8] = [v14 longLongValue];

  uint64_t v15 = [v6 objectForKeyedSubscript:@"savedRxWiFiBytes"];
  v93[5] = [v15 longLongValue];

  unint64_t v16 = [v6 objectForKeyedSubscript:@"savedTxWiFiBytes"];
  v93[9] = [v16 longLongValue];

  uint64_t v17 = [v6 objectForKeyedSubscript:@"savedRxWiredBytes"];
  v93[6] = [v17 longLongValue];

  unint64_t v18 = [v6 objectForKeyedSubscript:@"savedTxWiredBytes"];
  v93[10] = [v18 longLongValue];

  id v19 = [v6 objectForKeyedSubscript:@"savedRxDuplicateBytes"];
  int v94 = [v19 unsignedIntValue];

  BOOL v20 = [v6 objectForKeyedSubscript:@"savedRxOutOfOrderBytes"];
  int v95 = [v20 unsignedIntValue];

  v21 = [v6 objectForKeyedSubscript:@"savedTxRetransmittedBytes"];
  uint64_t v96 = [v21 unsignedIntValue];

  uint64_t v22 = [v7 objectForKeyedSubscript:@"context"];
  uint64_t v99 = [v22 longLongValue];

  int v23 = [v7 objectForKeyedSubscript:@"type"];
  int v100 = [v23 unsignedIntValue];

  uint64_t v24 = [v7 objectForKeyedSubscript:@"length"];
  __int16 v101 = [v24 unsignedShortValue];

  unint64_t v25 = [v7 objectForKeyedSubscript:@"flags"];
  __int16 v102 = [v25 unsignedShortValue];

  id v26 = [v5 objectForKeyedSubscript:@"srcref"];
  uint64_t v103 = [v26 longLongValue];

  char v27 = [v5 objectForKeyedSubscript:@"event_flags"];
  uint64_t v104 = [v27 longLongValue];

  id v28 = [v8 objectForKeyedSubscript:@"nstat_rxpackets"];
  uint64_t v105 = [v28 longLongValue];

  uint64_t v29 = [v8 objectForKeyedSubscript:@"nstat_txpackets"];
  uint64_t v107 = [v29 longLongValue];

  int v30 = [v8 objectForKeyedSubscript:@"nstat_rxbytes"];
  uint64_t v106 = [v30 longLongValue];

  uint64_t v31 = [v8 objectForKeyedSubscript:@"nstat_txbytes"];
  uint64_t v108 = [v31 longLongValue];

  __int16 v32 = [v8 objectForKeyedSubscript:@"nstat_cell_rxbytes"];
  uint64_t v109 = [v32 longLongValue];

  unint64_t v33 = [v8 objectForKeyedSubscript:@"nstat_cell_txbytes"];
  uint64_t v110 = [v33 longLongValue];

  char v34 = [v8 objectForKeyedSubscript:@"nstat_wifi_rxbytes"];
  uint64_t v111 = [v34 longLongValue];

  id v35 = [v8 objectForKeyedSubscript:@"nstat_wifi_txbytes"];
  uint64_t v112 = [v35 longLongValue];

  uint64_t v36 = [v8 objectForKeyedSubscript:@"nstat_wired_rxbytes"];
  uint64_t v113 = [v36 longLongValue];

  v37 = [v8 objectForKeyedSubscript:@"nstat_wired_txbytes"];
  uint64_t v114 = [v37 longLongValue];

  uint64_t v38 = [v8 objectForKeyedSubscript:@"nstat_rxduplicatebytes"];
  int v115 = [v38 unsignedIntValue];

  int v39 = [v8 objectForKeyedSubscript:@"nstat_rxoutoforderbytes"];
  int v116 = [v39 unsignedIntValue];

  uint64_t v40 = [v8 objectForKeyedSubscript:@"nstat_txretransmit"];
  int v117 = [v40 unsignedIntValue];

  char v41 = [v8 objectForKeyedSubscript:@"nstat_connectattempts"];
  int v118 = [v41 unsignedIntValue];

  id v42 = [v8 objectForKeyedSubscript:@"nstat_connectsuccesses"];
  int v119 = [v42 unsignedIntValue];

  char v43 = [v8 objectForKeyedSubscript:@"nstat_min_rtt"];
  int v120 = [v43 unsignedIntValue];

  id v44 = [v8 objectForKeyedSubscript:@"nstat_avg_rtt"];
  LODWORD(v121) = [v44 unsignedIntValue];

  uint64_t v45 = [v8 objectForKeyedSubscript:@"nstat_var_rtt"];
  DWORD1(v121) = [v45 unsignedIntValue];

  v46 = [v5 objectForKeyedSubscript:@"provider"];
  unsigned int v47 = [v46 unsignedIntValue];
  DWORD2(v121) = v47;

  char v48 = [v4 objectForKeyedSubscript:@"_startStamp"];

  if (v48)
  {
    id v49 = [v4 objectForKeyedSubscript:@"_startStamp"];
    [v49 floatValue];
    double v51 = v50;
  }
  else
  {
    double v51 = 0.0;
  }
  v52 = [v4 objectForKeyedSubscript:@"_startStampUsecs"];

  if (v52)
  {
    id v53 = [v4 objectForKeyedSubscript:@"_startStampUsecs"];
    double v51 = (double)(unint64_t)[v53 unsignedLongLongValue] / 1000000.0;
  }
  if (v47 > 0xA) {
    goto LABEL_26;
  }
  if (((1 << v47) & 0x430) != 0)
  {
    uint64_t v54 = [v5 objectForKeyedSubscript:@"udp_descriptor"];
    [a1 _initializeUDPDescriptor:v122 fromDictionary:v54];
    unsigned int v55 = &off_264404DA8;
    goto LABEL_13;
  }
  if (((1 << v47) & 0xC) == 0)
  {
    if (v47 == 8)
    {
      uint64_t v54 = [v5 objectForKeyedSubscript:@"quic_descriptor"];
      [a1 _initializeQUICDescriptor:v122 fromDictionary:v54];
      unsigned int v55 = off_264404D98;
      goto LABEL_13;
    }
LABEL_26:
    v86 = NStatGetLog();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109120;
      unsigned int v98 = v47;
      _os_log_impl(&dword_21C4BC000, v86, OS_LOG_TYPE_ERROR, "unknown provider %d type for snapshot", buf, 8u);
    }
    id v58 = 0;
    goto LABEL_29;
  }
  uint64_t v54 = [v5 objectForKeyedSubscript:@"tcp_descriptor"];
  [a1 _initializeTCPDescriptor:v122 fromDictionary:v54];
  unsigned int v55 = off_264404DA0;
LABEL_13:

  id v56 = objc_alloc(*v55);
  char v57 = [v4 objectForKeyedSubscript:@"_flags"];
  id v58 = objc_msgSend(v56, "initWithUpdate:startTime:flowFlags:previously:bluetoothCounts:peerEgressCellularCounts:", &v99, objc_msgSend(v57, "unsignedIntValue"), v93, 0, 0, v51);

  if (!v58) {
    goto LABEL_30;
  }
  v59 = [v4 objectForKeyedSubscript:@"snapshotReason"];
  objc_msgSend(v58, "setSnapshotReason:", objc_msgSend(v59, "intValue"));

  v60 = [v4 objectForKeyedSubscript:@"attributedEntity"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v62 = [v4 objectForKeyedSubscript:@"attributedEntity"];
  }
  else
  {
    v62 = @"<unknown>";
  }
  v63 = [v4 objectForKeyedSubscript:@"delegateName"];
  objc_opt_class();
  char v64 = objc_opt_isKindOfClass();

  v89 = v6;
  v90 = v5;
  v88 = v7;
  if (v64)
  {
    uint64_t v65 = [v4 objectForKeyedSubscript:@"delegateName"];
  }
  else
  {
    uint64_t v65 = 0;
  }
  v66 = [v4 objectForKeyedSubscript:@"attributionReason"];
  uint64_t v67 = [v66 intValue];
  [v4 objectForKeyedSubscript:@"delegateAttributionReason"];
  v69 = v68 = v4;
  v91 = (void *)v65;
  v92 = v62;
  objc_msgSend(v58, "setAttribution:derivation:delegateName:delegateDerivation:extensionName:", v62, v67, v65, objc_msgSend(v69, "intValue"), 0);

  v70 = [v68 objectForKeyedSubscript:@"uiBackgroundAudioCapable"];
  objc_msgSend(v58, "setIsUIBackgroundAudioCapable:", objc_msgSend(v70, "BOOLValue"));

  char v71 = [v68 objectForKeyedSubscript:@"snapshotAppStateIsForeground"];
  uint64_t v72 = [v71 BOOLValue];
  char v73 = [v68 objectForKeyedSubscript:@"snapshotScreenStateOn"];
  uint64_t v74 = [v73 BOOLValue];
  char v75 = [v68 objectForKeyedSubscript:@"startAppStateIsForeground"];
  uint64_t v76 = [v75 BOOLValue];
  v77 = [v68 objectForKeyedSubscript:@"startScreenStateOn"];
  uint64_t v78 = [v77 BOOLValue];
  uint64_t v79 = v72;
  id v4 = v68;
  [v58 setAppStateIsForeground:v79 screenStateOn:v74 startAppStateIsForeground:v76 startScreenStateOn:v78];

  uint64_t v80 = [v68 objectForKeyedSubscript:@"_snapStampUsecs"];
  if (v80
    && (v81 = (void *)v80,
        [v68 objectForKeyedSubscript:@"_snapStampUsecs"],
        v82 = objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        char v83 = objc_opt_isKindOfClass(),
        v82,
        v81,
        (v83 & 1) != 0))
  {
    v84 = [v68 objectForKeyedSubscript:@"_snapStampUsecs"];
    double v85 = (double)(unint64_t)[v84 unsignedLongLongValue] / 1000000.0;

    [v58 setFlowSnapshotTimeIntervalSinceReferenceDate:v85];
    id v6 = v89;
    double v5 = v90;
    uint64_t v7 = v88;
  }
  else
  {
    id v6 = v89;
    double v5 = v90;
    uint64_t v7 = v88;
    if ((reportSnapshotWithDictionaryIssues & 1) == 0) {
      reportSnapshotWithDictionaryIssues = 1;
    }
  }
  [v58 runConsistencyChecks];

  v86 = v92;
LABEL_29:

LABEL_30:
  return v58;
}

+ (id)snapshotWithDictionary:(id)a3
{
  id v4 = a3;
  double v5 = v4;
  if (v4)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      int v10 = 0;
      double v8 = 0;
      uint64_t v7 = 0;
      id v6 = 0;
      goto LABEL_22;
    }
    id v4 = [v5 objectForKeyedSubscript:@"update"];
    id v6 = v4;
    if (v4)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        int v10 = 0;
        double v8 = 0;
        uint64_t v7 = 0;
        goto LABEL_22;
      }
      uint64_t v7 = [v6 objectForKeyedSubscript:@"tcp_descriptor"];
      double v8 = [v6 objectForKeyedSubscript:@"udp_descriptor"];
      uint64_t v9 = [v6 objectForKeyedSubscript:@"quic_descriptor"];
      int v10 = (void *)v9;
      int v11 = v7 != 0;
      if (v7) {
        int v12 = 2;
      }
      else {
        int v12 = 1;
      }
      if (v8) {
        int v11 = v12;
      }
      if (v9) {
        ++v11;
      }
      if (v11 != 1) {
        goto LABEL_22;
      }
      uint64_t v13 = [v6 objectForKeyedSubscript:@"provider"];
      unsigned int v14 = [v13 unsignedIntValue];

      id v4 = 0;
      if (v14 <= 0xA)
      {
        if (((1 << v14) & 0x430) != 0)
        {
          if (v8) {
            goto LABEL_28;
          }
        }
        else
        {
          if (((1 << v14) & 0xC) == 0)
          {
            if (v14 != 8) {
              goto LABEL_23;
            }
            if (!v10) {
              goto LABEL_22;
            }
            goto LABEL_28;
          }
          if (v7)
          {
LABEL_28:
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v4 = [a1 _snapshotWithDictionary:v5];
              goto LABEL_23;
            }
          }
        }
LABEL_22:
        id v4 = 0;
      }
    }
    else
    {
      int v10 = 0;
      double v8 = 0;
      uint64_t v7 = 0;
    }
  }
  else
  {
    int v10 = 0;
    double v8 = 0;
    uint64_t v7 = 0;
    id v6 = 0;
  }
LABEL_23:
  id v15 = v4;

  return v15;
}

- (id)attributionReasonString
{
  unsigned int v2 = [(NWStatsSnapshot *)self attributionReason];
  return attributionReasonString(v2);
}

- (void)applyTrafficAdjustmentFactor:(double)a3
{
  [(NWStatsProtocolSnapshot *)self flowDuration];
  if (a3 > 0.0 && v5 > a3)
  {
    double v7 = (v5 - a3) / v5;
    self->_adjustment_bytes.unint64_t rxCellularBytes = (unint64_t)(v7
                                                               * (double)[(NWStatsProtocolSnapshot *)self deltaAccountingRxCellularBytes]);
    self->_adjustment_bytes.unint64_t txCellularBytes = (unint64_t)(v7
                                                               * (double)[(NWStatsProtocolSnapshot *)self deltaAccountingTxCellularBytes]);
    self->_adjustment_bytes.unint64_t rxWiFiBytes = (unint64_t)(v7
                                                           * (double)[(NWStatsProtocolSnapshot *)self deltaAccountingRxWiFiBytes]);
    self->_adjustment_bytes.unint64_t txWiFiBytes = (unint64_t)(v7
                                                           * (double)[(NWStatsProtocolSnapshot *)self deltaAccountingTxWiFiBytes]);
    self->_adjustment_bytes.unint64_t rxWiredBytes = (unint64_t)(v7
                                                            * (double)[(NWStatsProtocolSnapshot *)self deltaAccountingRxWiredBytes]);
    self->_adjustment_bytes.unint64_t txWiredBytes = (unint64_t)(v7
                                                            * (double)[(NWStatsProtocolSnapshot *)self deltaAccountingTxWiredBytes]);
  }
}

- (void)donateBytesToAccumulator
{
  id v3 = +[NWStatsInterfaceRegistry sharedInstance];
  objc_msgSend(v3, "addVPNBytesForInterfaceIndex:fromSnapshot:", -[NWStatsProtocolSnapshot interfaceIndex](self, "interfaceIndex"), self);
  self->_isKnownVPNClient = 1;
}

- (void)removeBytesFromAccumulator
{
  id v4 = +[NWStatsInterfaceRegistry sharedInstance];
  id v3 = [(NWStatsSnapshot *)self euuid];
  [v4 subtractVPNBytesForVPNProviderAppUUID:v3 fromSnapshot:self];

  self->_isKnownVPNProvider = 1;
}

+ (void)initialize
{
  kern_return_t v2;
  kern_return_t v3;
  NSObject *v4;
  id v5;
  void *v6;
  _DWORD v7[2];
  uint64_t v8;

  double v8 = *MEMORY[0x263EF8340];
  unsigned int v2 = mach_timebase_info((mach_timebase_info_t)&timebase_info_0);
  if (v2)
  {
    id v3 = v2;
    id v4 = NStatGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_21C4BC000, v4, OS_LOG_TYPE_ERROR, "mach_timebase_info failed %d", (uint8_t *)v7, 8u);
    }
  }
  double v5 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v6 = (void *)flowsWithAnomalousCounts;
  flowsWithAnomalousCounts = (uint64_t)v5;

  flowsWithAnomalousCountsLock = 0;
}

- (unint64_t)flowStartContinuousTime
{
  return self->_flowStartContinuousTime;
}

- (NSDate)flowStartTimestamp
{
  return self->_flowStartTimestamp;
}

- (NSDate)flowSnapshotTimestamp
{
  return self->_flowSnapshotTimestamp;
}

- (double)flowStartTimeIntervalSinceReferenceDate
{
  return self->_flowStartTimeIntervalSinceReferenceDate;
}

- (double)flowSnapshotTimeIntervalSinceReferenceDate
{
  return self->_flowSnapshotTimeIntervalSinceReferenceDate;
}

- (void)setFlowSnapshotTimeIntervalSinceReferenceDate:(double)a3
{
  self->_flowSnapshotTimeIntervalSinceReferenceDate = a3;
}

- (double)flowStartTimeIntervalSince1970
{
  return self->_flowStartTimeIntervalSince1970;
}

- (double)flowSnapshotTimeIntervalSince1970
{
  return self->_flowSnapshotTimeIntervalSince1970;
}

- (double)flowDuration
{
  return self->_flowDuration;
}

- (unint64_t)deltaAccountingRxCompanionLinkBluetoothBytes
{
  return self->_deltaAccountingRxCompanionLinkBluetoothBytes;
}

- (unint64_t)deltaAccountingTxCompanionLinkBluetoothBytes
{
  return self->_deltaAccountingTxCompanionLinkBluetoothBytes;
}

- (unsigned)interfaceIndex
{
  return self->_interfaceIndex;
}

- (unsigned)receiveBufferSize
{
  return self->_receiveBufferSize;
}

- (unsigned)receiveBufferUsed
{
  return self->_receiveBufferUsed;
}

- (unsigned)trafficClass
{
  return self->_trafficClass;
}

- (NSUUID)vuuid
{
  return self->_vuuid;
}

- (NSUUID)flowuuid
{
  return self->_flowuuid;
}

- (BOOL)uiBackgroundAudioCapable
{
  return self->_uiBackgroundAudioCapable;
}

- (void)setUiBackgroundAudioCapable:(BOOL)a3
{
  self->_uiBackgroundAudioCapable = a3;
}

- (BOOL)failedRouteValuesLookup
{
  return self->_failedRouteValuesLookup;
}

- (BOOL)failedFlowswitchValuesLookup
{
  return self->_failedFlowswitchValuesLookup;
}

- (BOOL)failedSkywalkAction
{
  return self->_failedSkywalkAction;
}

- (NSData)localAddress
{
  return self->_localAddress;
}

- (NSData)remoteAddress
{
  return self->_remoteAddress;
}

- (unsigned)localPort
{
  return self->_localPort;
}

- (unsigned)remotePort
{
  return self->_remotePort;
}

- (NSString)localAddressString
{
  return self->_localAddressString;
}

- (NSString)remoteAddressString
{
  return self->_remoteAddressString;
}

- (BOOL)isKnownListener
{
  return self->_isKnownListener;
}

- (BOOL)isKnownInbound
{
  return self->_isKnownInbound;
}

- (BOOL)isKnownOutbound
{
  return self->_isKnownOutbound;
}

- (BOOL)interfaceUnknown
{
  return self->_interfaceUnknown;
}

- (BOOL)interfaceLoopback
{
  return self->_interfaceLoopback;
}

- (BOOL)interfaceCellular
{
  return self->_interfaceCellular;
}

- (BOOL)interfaceCellularViaFallback
{
  return self->_interfaceCellularViaFallback;
}

- (BOOL)interfaceCellularViaSlowFallback
{
  return self->_interfaceCellularViaSlowFallback;
}

- (BOOL)interfaceCellularViaFastFallback
{
  return self->_interfaceCellularViaFastFallback;
}

- (BOOL)interfaceCellularViaPreferredFallback
{
  return self->_interfaceCellularViaPreferredFallback;
}

- (BOOL)interfaceCellularViaIndependentFallback
{
  return self->_interfaceCellularViaIndependentFallback;
}

- (BOOL)interfaceCellularViaAnyFallback
{
  return self->_interfaceCellularViaAnyFallback;
}

- (BOOL)interfaceWiFi
{
  return self->_interfaceWiFi;
}

- (BOOL)interfaceWired
{
  return self->_interfaceWired;
}

- (BOOL)interfaceAWDL
{
  return self->_interfaceAWDL;
}

- (BOOL)interfaceLLW
{
  return self->_interfaceLLW;
}

- (BOOL)interfaceExpensive
{
  return self->_interfaceExpensive;
}

- (BOOL)interfaceConstrained
{
  return self->_interfaceConstrained;
}

- (BOOL)interfaceCompanionLink
{
  return self->_interfaceCompanionLink;
}

- (BOOL)interfaceCompanionLinkBluetooth
{
  return self->_interfaceCompanionLinkBluetooth;
}

- (BOOL)isKnownVPNClient
{
  return self->_isKnownVPNClient;
}

- (void)setIsKnownVPNClient:(BOOL)a3
{
  self->_isKnownVPNClient = a3;
}

- (BOOL)flowUsesChannels
{
  return self->_flowUsesChannels;
}

- (BOOL)hasLocalDestination
{
  return self->_hasLocalDestination;
}

- (BOOL)hasNonLocalDestination
{
  return self->_hasNonLocalDestination;
}

- (unint64_t)networkActivityMapStartTime
{
  return self->_networkActivityMapStartTime;
}

- (unint64_t)networkActivityMapPart1
{
  return self->_networkActivityMapPart1;
}

- (unint64_t)networkActivityMapPart2
{
  return self->_networkActivityMapPart2;
}

- (BOOL)isKnownVPNProvider
{
  return self->_isKnownVPNProvider;
}

- (void)setIsKnownVPNProvider:(BOOL)a3
{
  self->_isKnownVPNProvider = a3;
}

- (unsigned)ifnet_properties
{
  return self->_ifnet_properties;
}

@end