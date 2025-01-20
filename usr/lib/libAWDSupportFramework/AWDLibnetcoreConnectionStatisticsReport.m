@interface AWDLibnetcoreConnectionStatisticsReport
- (BOOL)cellularFallback;
- (BOOL)cellularRRCConnected;
- (BOOL)connected;
- (BOOL)dNSAnswersCached;
- (BOOL)firstParty;
- (BOOL)hasAppDataStallTimerMsecs;
- (BOOL)hasAppReportingDataStallCount;
- (BOOL)hasBestRTTMsecs;
- (BOOL)hasBetterRouteEventCount;
- (BOOL)hasBytesDuplicate;
- (BOOL)hasBytesIn;
- (BOOL)hasBytesOut;
- (BOOL)hasBytesOutOfOrder;
- (BOOL)hasBytesRetransmitted;
- (BOOL)hasCellularFallback;
- (BOOL)hasCellularRRCConnected;
- (BOOL)hasConnected;
- (BOOL)hasConnectedInterfaceType;
- (BOOL)hasConnectionEstablishmentTimeMsecs;
- (BOOL)hasConnectionReuseCount;
- (BOOL)hasCurrentRTTMsecs;
- (BOOL)hasDNSAnswersCached;
- (BOOL)hasDNSResolvedTimeMsecs;
- (BOOL)hasFirstParty;
- (BOOL)hasFlowDurationMsecs;
- (BOOL)hasIPAddressAttemptCount;
- (BOOL)hasInterfaceType;
- (BOOL)hasKernelReportedStalls;
- (BOOL)hasKernelReportingConnectionStalled;
- (BOOL)hasKernelReportingReadStalled;
- (BOOL)hasKernelReportingWriteStalled;
- (BOOL)hasMultipathBytesInCell;
- (BOOL)hasMultipathBytesInInitial;
- (BOOL)hasMultipathBytesInWiFi;
- (BOOL)hasMultipathBytesOutCell;
- (BOOL)hasMultipathBytesOutInitial;
- (BOOL)hasMultipathBytesOutWiFi;
- (BOOL)hasMultipathServiceType;
- (BOOL)hasPacketsDuplicate;
- (BOOL)hasPacketsIn;
- (BOOL)hasPacketsOut;
- (BOOL)hasPacketsOutOfOrder;
- (BOOL)hasPacketsRetransmitted;
- (BOOL)hasRTTvariance;
- (BOOL)hasSmoothedRTTMsecs;
- (BOOL)hasSynRetransmissionCount;
- (BOOL)hasTcpFastOpen;
- (BOOL)hasTimeToConnectionEstablishmentMsecs;
- (BOOL)hasTimeToConnectionStartMsecs;
- (BOOL)hasTimeToDNSResolvedMsecs;
- (BOOL)hasTimeToDNSStartMsecs;
- (BOOL)hasTrafficClass;
- (BOOL)isEqual:(id)a3;
- (BOOL)kernelReportedStalls;
- (BOOL)kernelReportingConnectionStalled;
- (BOOL)kernelReportingReadStalled;
- (BOOL)kernelReportingWriteStalled;
- (BOOL)readFrom:(id)a3;
- (BOOL)tcpFastOpen;
- (id)connectedInterfaceTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)interfaceTypeAsString:(int)a3;
- (int)StringAsConnectedInterfaceType:(id)a3;
- (int)StringAsInterfaceType:(id)a3;
- (int)connectedInterfaceType;
- (int)interfaceType;
- (unint64_t)appDataStallTimerMsecs;
- (unint64_t)appReportingDataStallCount;
- (unint64_t)bestRTTMsecs;
- (unint64_t)betterRouteEventCount;
- (unint64_t)bytesDuplicate;
- (unint64_t)bytesIn;
- (unint64_t)bytesOut;
- (unint64_t)bytesOutOfOrder;
- (unint64_t)bytesRetransmitted;
- (unint64_t)connectionEstablishmentTimeMsecs;
- (unint64_t)connectionReuseCount;
- (unint64_t)currentRTTMsecs;
- (unint64_t)dNSResolvedTimeMsecs;
- (unint64_t)flowDurationMsecs;
- (unint64_t)hash;
- (unint64_t)iPAddressAttemptCount;
- (unint64_t)multipathBytesInCell;
- (unint64_t)multipathBytesInInitial;
- (unint64_t)multipathBytesInWiFi;
- (unint64_t)multipathBytesOutCell;
- (unint64_t)multipathBytesOutInitial;
- (unint64_t)multipathBytesOutWiFi;
- (unint64_t)multipathServiceType;
- (unint64_t)packetsDuplicate;
- (unint64_t)packetsIn;
- (unint64_t)packetsOut;
- (unint64_t)packetsOutOfOrder;
- (unint64_t)packetsRetransmitted;
- (unint64_t)rTTvariance;
- (unint64_t)smoothedRTTMsecs;
- (unint64_t)synRetransmissionCount;
- (unint64_t)timeToConnectionEstablishmentMsecs;
- (unint64_t)timeToConnectionStartMsecs;
- (unint64_t)timeToDNSResolvedMsecs;
- (unint64_t)timeToDNSStartMsecs;
- (unint64_t)trafficClass;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppDataStallTimerMsecs:(unint64_t)a3;
- (void)setAppReportingDataStallCount:(unint64_t)a3;
- (void)setBestRTTMsecs:(unint64_t)a3;
- (void)setBetterRouteEventCount:(unint64_t)a3;
- (void)setBytesDuplicate:(unint64_t)a3;
- (void)setBytesIn:(unint64_t)a3;
- (void)setBytesOut:(unint64_t)a3;
- (void)setBytesOutOfOrder:(unint64_t)a3;
- (void)setBytesRetransmitted:(unint64_t)a3;
- (void)setCellularFallback:(BOOL)a3;
- (void)setCellularRRCConnected:(BOOL)a3;
- (void)setConnected:(BOOL)a3;
- (void)setConnectedInterfaceType:(int)a3;
- (void)setConnectionEstablishmentTimeMsecs:(unint64_t)a3;
- (void)setConnectionReuseCount:(unint64_t)a3;
- (void)setCurrentRTTMsecs:(unint64_t)a3;
- (void)setDNSAnswersCached:(BOOL)a3;
- (void)setDNSResolvedTimeMsecs:(unint64_t)a3;
- (void)setFirstParty:(BOOL)a3;
- (void)setFlowDurationMsecs:(unint64_t)a3;
- (void)setHasAppDataStallTimerMsecs:(BOOL)a3;
- (void)setHasAppReportingDataStallCount:(BOOL)a3;
- (void)setHasBestRTTMsecs:(BOOL)a3;
- (void)setHasBetterRouteEventCount:(BOOL)a3;
- (void)setHasBytesDuplicate:(BOOL)a3;
- (void)setHasBytesIn:(BOOL)a3;
- (void)setHasBytesOut:(BOOL)a3;
- (void)setHasBytesOutOfOrder:(BOOL)a3;
- (void)setHasBytesRetransmitted:(BOOL)a3;
- (void)setHasCellularFallback:(BOOL)a3;
- (void)setHasCellularRRCConnected:(BOOL)a3;
- (void)setHasConnected:(BOOL)a3;
- (void)setHasConnectedInterfaceType:(BOOL)a3;
- (void)setHasConnectionEstablishmentTimeMsecs:(BOOL)a3;
- (void)setHasConnectionReuseCount:(BOOL)a3;
- (void)setHasCurrentRTTMsecs:(BOOL)a3;
- (void)setHasDNSAnswersCached:(BOOL)a3;
- (void)setHasDNSResolvedTimeMsecs:(BOOL)a3;
- (void)setHasFirstParty:(BOOL)a3;
- (void)setHasFlowDurationMsecs:(BOOL)a3;
- (void)setHasIPAddressAttemptCount:(BOOL)a3;
- (void)setHasInterfaceType:(BOOL)a3;
- (void)setHasKernelReportedStalls:(BOOL)a3;
- (void)setHasKernelReportingConnectionStalled:(BOOL)a3;
- (void)setHasKernelReportingReadStalled:(BOOL)a3;
- (void)setHasKernelReportingWriteStalled:(BOOL)a3;
- (void)setHasMultipathBytesInCell:(BOOL)a3;
- (void)setHasMultipathBytesInInitial:(BOOL)a3;
- (void)setHasMultipathBytesInWiFi:(BOOL)a3;
- (void)setHasMultipathBytesOutCell:(BOOL)a3;
- (void)setHasMultipathBytesOutInitial:(BOOL)a3;
- (void)setHasMultipathBytesOutWiFi:(BOOL)a3;
- (void)setHasMultipathServiceType:(BOOL)a3;
- (void)setHasPacketsDuplicate:(BOOL)a3;
- (void)setHasPacketsIn:(BOOL)a3;
- (void)setHasPacketsOut:(BOOL)a3;
- (void)setHasPacketsOutOfOrder:(BOOL)a3;
- (void)setHasPacketsRetransmitted:(BOOL)a3;
- (void)setHasRTTvariance:(BOOL)a3;
- (void)setHasSmoothedRTTMsecs:(BOOL)a3;
- (void)setHasSynRetransmissionCount:(BOOL)a3;
- (void)setHasTcpFastOpen:(BOOL)a3;
- (void)setHasTimeToConnectionEstablishmentMsecs:(BOOL)a3;
- (void)setHasTimeToConnectionStartMsecs:(BOOL)a3;
- (void)setHasTimeToDNSResolvedMsecs:(BOOL)a3;
- (void)setHasTimeToDNSStartMsecs:(BOOL)a3;
- (void)setHasTrafficClass:(BOOL)a3;
- (void)setIPAddressAttemptCount:(unint64_t)a3;
- (void)setInterfaceType:(int)a3;
- (void)setKernelReportedStalls:(BOOL)a3;
- (void)setKernelReportingConnectionStalled:(BOOL)a3;
- (void)setKernelReportingReadStalled:(BOOL)a3;
- (void)setKernelReportingWriteStalled:(BOOL)a3;
- (void)setMultipathBytesInCell:(unint64_t)a3;
- (void)setMultipathBytesInInitial:(unint64_t)a3;
- (void)setMultipathBytesInWiFi:(unint64_t)a3;
- (void)setMultipathBytesOutCell:(unint64_t)a3;
- (void)setMultipathBytesOutInitial:(unint64_t)a3;
- (void)setMultipathBytesOutWiFi:(unint64_t)a3;
- (void)setMultipathServiceType:(unint64_t)a3;
- (void)setPacketsDuplicate:(unint64_t)a3;
- (void)setPacketsIn:(unint64_t)a3;
- (void)setPacketsOut:(unint64_t)a3;
- (void)setPacketsOutOfOrder:(unint64_t)a3;
- (void)setPacketsRetransmitted:(unint64_t)a3;
- (void)setRTTvariance:(unint64_t)a3;
- (void)setSmoothedRTTMsecs:(unint64_t)a3;
- (void)setSynRetransmissionCount:(unint64_t)a3;
- (void)setTcpFastOpen:(BOOL)a3;
- (void)setTimeToConnectionEstablishmentMsecs:(unint64_t)a3;
- (void)setTimeToConnectionStartMsecs:(unint64_t)a3;
- (void)setTimeToDNSResolvedMsecs:(unint64_t)a3;
- (void)setTimeToDNSStartMsecs:(unint64_t)a3;
- (void)setTrafficClass:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLibnetcoreConnectionStatisticsReport

- (void)setTimeToDNSResolvedMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_timeToDNSResolvedMsecs = a3;
}

- (void)setHasTimeToDNSResolvedMsecs:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasTimeToDNSResolvedMsecs
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setDNSAnswersCached:(BOOL)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_dNSAnswersCached = a3;
}

- (void)setHasDNSAnswersCached:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasDNSAnswersCached
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setTimeToConnectionEstablishmentMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_timeToConnectionEstablishmentMsecs = a3;
}

- (void)setHasTimeToConnectionEstablishmentMsecs:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTimeToConnectionEstablishmentMsecs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setIPAddressAttemptCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_iPAddressAttemptCount = a3;
}

- (void)setHasIPAddressAttemptCount:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasIPAddressAttemptCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setFlowDurationMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_flowDurationMsecs = a3;
}

- (void)setHasFlowDurationMsecs:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasFlowDurationMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (int)connectedInterfaceType
{
  if ((*((unsigned char *)&self->_has + 4) & 8) != 0) {
    return self->_connectedInterfaceType;
  }
  else {
    return 0;
  }
}

- (void)setConnectedInterfaceType:(int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_connectedInterfaceType = a3;
}

- (void)setHasConnectedInterfaceType:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasConnectedInterfaceType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (id)connectedInterfaceTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B97B8[a3];
  }
}

- (int)StringAsConnectedInterfaceType:(id)a3
{
  if ([a3 isEqualToString:@"INTERFACE_TYPE_OTHER"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"INTERFACE_TYPE_WIFI"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"INTERFACE_TYPE_CELLULAR"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"INTERFACE_TYPE_WIRED"]) {
    return 3;
  }
  return 0;
}

- (void)setKernelReportedStalls:(BOOL)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_kernelReportedStalls = a3;
}

- (void)setHasKernelReportedStalls:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportedStalls
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setKernelReportingConnectionStalled:(BOOL)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_kernelReportingConnectionStalled = a3;
}

- (void)setHasKernelReportingConnectionStalled:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportingConnectionStalled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setKernelReportingReadStalled:(BOOL)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_kernelReportingReadStalled = a3;
}

- (void)setHasKernelReportingReadStalled:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportingReadStalled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setKernelReportingWriteStalled:(BOOL)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_kernelReportingWriteStalled = a3;
}

- (void)setHasKernelReportingWriteStalled:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasKernelReportingWriteStalled
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setBytesIn:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bytesIn = a3;
}

- (void)setHasBytesIn:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBytesIn
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBytesOut:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_bytesOut = a3;
}

- (void)setHasBytesOut:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasBytesOut
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setBytesDuplicate:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_bytesDuplicate = a3;
}

- (void)setHasBytesDuplicate:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBytesDuplicate
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setBytesOutOfOrder:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_bytesOutOfOrder = a3;
}

- (void)setHasBytesOutOfOrder:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasBytesOutOfOrder
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setBytesRetransmitted:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_bytesRetransmitted = a3;
}

- (void)setHasBytesRetransmitted:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasBytesRetransmitted
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPacketsIn:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_packetsIn = a3;
}

- (void)setHasPacketsIn:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPacketsIn
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setPacketsOut:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_packetsOut = a3;
}

- (void)setHasPacketsOut:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasPacketsOut
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setPacketsDuplicate:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_packetsDuplicate = a3;
}

- (void)setHasPacketsDuplicate:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPacketsDuplicate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPacketsOutOfOrder:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_packetsOutOfOrder = a3;
}

- (void)setHasPacketsOutOfOrder:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasPacketsOutOfOrder
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setPacketsRetransmitted:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_packetsRetransmitted = a3;
}

- (void)setHasPacketsRetransmitted:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasPacketsRetransmitted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCurrentRTTMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_currentRTTMsecs = a3;
}

- (void)setHasCurrentRTTMsecs:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCurrentRTTMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSmoothedRTTMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_smoothedRTTMsecs = a3;
}

- (void)setHasSmoothedRTTMsecs:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasSmoothedRTTMsecs
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setBestRTTMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_bestRTTMsecs = a3;
}

- (void)setHasBestRTTMsecs:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasBestRTTMsecs
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRTTvariance:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_rTTvariance = a3;
}

- (void)setHasRTTvariance:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRTTvariance
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSynRetransmissionCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_synRetransmissionCount = a3;
}

- (void)setHasSynRetransmissionCount:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasSynRetransmissionCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setConnectionReuseCount:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_connectionReuseCount = a3;
}

- (void)setHasConnectionReuseCount:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasConnectionReuseCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAppReportingDataStallCount:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_appReportingDataStallCount = a3;
}

- (void)setHasAppReportingDataStallCount:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAppReportingDataStallCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAppDataStallTimerMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_appDataStallTimerMsecs = a3;
}

- (void)setHasAppDataStallTimerMsecs:(BOOL)a3
{
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAppDataStallTimerMsecs
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTrafficClass:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_trafficClass = a3;
}

- (void)setHasTrafficClass:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasTrafficClass
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setTcpFastOpen:(BOOL)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_tcpFastOpen = a3;
}

- (void)setHasTcpFastOpen:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasTcpFastOpen
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setCellularFallback:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_cellularFallback = a3;
}

- (void)setHasCellularFallback:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasCellularFallback
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCellularRRCConnected:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_cellularRRCConnected = a3;
}

- (void)setHasCellularRRCConnected:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasCellularRRCConnected
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setConnected:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_connected = a3;
}

- (void)setHasConnected:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasConnected
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (int)interfaceType
{
  if ((*((unsigned char *)&self->_has + 4) & 0x10) != 0) {
    return self->_interfaceType;
  }
  else {
    return 0;
  }
}

- (void)setInterfaceType:(int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_interfaceType = a3;
}

- (void)setHasInterfaceType:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasInterfaceType
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (id)interfaceTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B97B8[a3];
  }
}

- (int)StringAsInterfaceType:(id)a3
{
  if ([a3 isEqualToString:@"INTERFACE_TYPE_OTHER"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"INTERFACE_TYPE_WIFI"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"INTERFACE_TYPE_CELLULAR"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"INTERFACE_TYPE_WIRED"]) {
    return 3;
  }
  return 0;
}

- (void)setTimeToDNSStartMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_timeToDNSStartMsecs = a3;
}

- (void)setHasTimeToDNSStartMsecs:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasTimeToDNSStartMsecs
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setDNSResolvedTimeMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_dNSResolvedTimeMsecs = a3;
}

- (void)setHasDNSResolvedTimeMsecs:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDNSResolvedTimeMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setTimeToConnectionStartMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_timeToConnectionStartMsecs = a3;
}

- (void)setHasTimeToConnectionStartMsecs:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTimeToConnectionStartMsecs
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setConnectionEstablishmentTimeMsecs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_connectionEstablishmentTimeMsecs = a3;
}

- (void)setHasConnectionEstablishmentTimeMsecs:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasConnectionEstablishmentTimeMsecs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBetterRouteEventCount:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_betterRouteEventCount = a3;
}

- (void)setHasBetterRouteEventCount:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasBetterRouteEventCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setMultipathServiceType:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_multipathServiceType = a3;
}

- (void)setHasMultipathServiceType:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasMultipathServiceType
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setFirstParty:(BOOL)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_firstParty = a3;
}

- (void)setHasFirstParty:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasFirstParty
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setMultipathBytesInCell:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_multipathBytesInCell = a3;
}

- (void)setHasMultipathBytesInCell:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasMultipathBytesInCell
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setMultipathBytesOutCell:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_multipathBytesOutCell = a3;
}

- (void)setHasMultipathBytesOutCell:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasMultipathBytesOutCell
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMultipathBytesInWiFi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_multipathBytesInWiFi = a3;
}

- (void)setHasMultipathBytesInWiFi:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasMultipathBytesInWiFi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setMultipathBytesOutWiFi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_multipathBytesOutWiFi = a3;
}

- (void)setHasMultipathBytesOutWiFi:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMultipathBytesOutWiFi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setMultipathBytesInInitial:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_multipathBytesInInitial = a3;
}

- (void)setHasMultipathBytesInInitial:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasMultipathBytesInInitial
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setMultipathBytesOutInitial:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_multipathBytesOutInitial = a3;
}

- (void)setHasMultipathBytesOutInitial:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($13AFF146FFF692FEAF73A0FE35206A83)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasMultipathBytesOutInitial
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLibnetcoreConnectionStatisticsReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLibnetcoreConnectionStatisticsReport description](&v3, sel_description), -[AWDLibnetcoreConnectionStatisticsReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeToDNSResolvedMsecs] forKey:@"timeToDNSResolved_msecs"];
    $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
    if ((*(void *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_52;
    }
  }
  else if ((*(void *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_dNSAnswersCached] forKey:@"DNSAnswersCached"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeToConnectionEstablishmentMsecs] forKey:@"timeToConnectionEstablishment_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_iPAddressAttemptCount] forKey:@"IPAddressAttemptCount"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_flowDurationMsecs] forKey:@"flowDuration_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_59;
  }
LABEL_55:
  uint64_t connectedInterfaceType = self->_connectedInterfaceType;
  if (connectedInterfaceType >= 4) {
    v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_connectedInterfaceType];
  }
  else {
    v7 = off_2641B97B8[connectedInterfaceType];
  }
  [v3 setObject:v7 forKey:@"connectedInterfaceType"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithBool:self->_kernelReportedStalls] forKey:@"kernelReportedStalls"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithBool:self->_kernelReportingConnectionStalled] forKey:@"kernelReportingConnectionStalled"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithBool:self->_kernelReportingReadStalled] forKey:@"kernelReportingReadStalled"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithBool:self->_kernelReportingWriteStalled] forKey:@"kernelReportingWriteStalled"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesIn] forKey:@"bytesIn"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesOut] forKey:@"bytesOut"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesDuplicate] forKey:@"bytesDuplicate"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesOutOfOrder] forKey:@"bytesOutOfOrder"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bytesRetransmitted] forKey:@"bytesRetransmitted"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsIn] forKey:@"packetsIn"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsOut] forKey:@"packetsOut"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsDuplicate] forKey:@"packetsDuplicate"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsOutOfOrder] forKey:@"packetsOutOfOrder"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_packetsRetransmitted] forKey:@"packetsRetransmitted"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_currentRTTMsecs] forKey:@"currentRTT_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_smoothedRTTMsecs] forKey:@"smoothedRTT_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bestRTTMsecs] forKey:@"bestRTT_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rTTvariance] forKey:@"RTTvariance"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_synRetransmissionCount] forKey:@"synRetransmissionCount"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionReuseCount] forKey:@"connectionReuseCount"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_appReportingDataStallCount] forKey:@"appReportingDataStallCount"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_appDataStallTimerMsecs] forKey:@"appDataStallTimer_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_trafficClass] forKey:@"trafficClass"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithBool:self->_tcpFastOpen] forKey:@"tcpFastOpen"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithBool:self->_cellularFallback] forKey:@"cellularFallback"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithBool:self->_cellularRRCConnected] forKey:@"cellularRRCConnected"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithBool:self->_connected] forKey:@"connected"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_90;
  }
LABEL_86:
  uint64_t interfaceType = self->_interfaceType;
  if (interfaceType >= 4) {
    v9 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_interfaceType];
  }
  else {
    v9 = off_2641B97B8[interfaceType];
  }
  [v3 setObject:v9 forKey:@"interfaceType"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_91;
  }
LABEL_90:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeToDNSStartMsecs] forKey:@"timeToDNSStart_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_dNSResolvedTimeMsecs] forKey:@"DNSResolvedTime_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_93;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeToConnectionStartMsecs] forKey:@"timeToConnectionStart_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_40;
    }
    goto LABEL_94;
  }
LABEL_93:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_connectionEstablishmentTimeMsecs] forKey:@"connectionEstablishmentTime_msecs"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_95;
  }
LABEL_94:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_betterRouteEventCount] forKey:@"betterRouteEventCount"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_96;
  }
LABEL_95:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathServiceType] forKey:@"multipathServiceType"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setObject:[NSNumber numberWithBool:self->_firstParty] forKey:@"firstParty"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInCell] forKey:@"multipathBytesInCell"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_99;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutCell] forKey:@"multipathBytesOutCell"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_100;
  }
LABEL_99:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInWiFi] forKey:@"multipathBytesInWiFi"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_47;
    }
LABEL_101:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesInInitial] forKey:@"multipathBytesInInitial"];
    if ((*(void *)&self->_has & 0x80000) == 0) {
      return v3;
    }
    goto LABEL_48;
  }
LABEL_100:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutWiFi] forKey:@"multipathBytesOutWiFi"];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0) {
    goto LABEL_101;
  }
LABEL_47:
  if ((*(_DWORD *)&has & 0x80000) != 0) {
LABEL_48:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_multipathBytesOutInitial] forKey:@"multipathBytesOutInitial"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLibnetcoreConnectionStatisticsReportReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
    if ((*(void *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((*(void *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteInt32Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteInt32Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteBOOLField();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_47;
    }
LABEL_94:
    PBDataWriterWriteUint64Field();
    if ((*(void *)&self->_has & 0x80000) == 0) {
      return;
    }
    goto LABEL_95;
  }
LABEL_93:
  PBDataWriterWriteUint64Field();
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) != 0) {
    goto LABEL_94;
  }
LABEL_47:
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    return;
  }
LABEL_95:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    *((void *)a3 + 33) = self->_timeToDNSResolvedMsecs;
    *(void *)((char *)a3 + 308) |= 0x100000000uLL;
    $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
    if ((*(void *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((*(void *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 299) = self->_dNSAnswersCached;
  *(void *)((char *)a3 + 308) |= 0x10000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 31) = self->_timeToConnectionEstablishmentMsecs;
  *(void *)((char *)a3 + 308) |= 0x40000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 15) = self->_iPAddressAttemptCount;
  *(void *)((char *)a3 + 308) |= 0x4000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 14) = self->_flowDurationMsecs;
  *(void *)((char *)a3 + 308) |= 0x2000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 72) = self->_connectedInterfaceType;
  *(void *)((char *)a3 + 308) |= 0x800000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((unsigned char *)a3 + 301) = self->_kernelReportedStalls;
  *(void *)((char *)a3 + 308) |= 0x40000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)a3 + 302) = self->_kernelReportingConnectionStalled;
  *(void *)((char *)a3 + 308) |= 0x80000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)a3 + 303) = self->_kernelReportingReadStalled;
  *(void *)((char *)a3 + 308) |= 0x100000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)a3 + 304) = self->_kernelReportingWriteStalled;
  *(void *)((char *)a3 + 308) |= 0x200000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 6) = self->_bytesIn;
  *(void *)((char *)a3 + 308) |= 0x20uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)a3 + 7) = self->_bytesOut;
  *(void *)((char *)a3 + 308) |= 0x40uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)a3 + 5) = self->_bytesDuplicate;
  *(void *)((char *)a3 + 308) |= 0x10uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 8) = self->_bytesOutOfOrder;
  *(void *)((char *)a3 + 308) |= 0x80uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 9) = self->_bytesRetransmitted;
  *(void *)((char *)a3 + 308) |= 0x100uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)a3 + 24) = self->_packetsIn;
  *(void *)((char *)a3 + 308) |= 0x800000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)a3 + 25) = self->_packetsOut;
  *(void *)((char *)a3 + 308) |= 0x1000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)a3 + 23) = self->_packetsDuplicate;
  *(void *)((char *)a3 + 308) |= 0x400000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)a3 + 26) = self->_packetsOutOfOrder;
  *(void *)((char *)a3 + 308) |= 0x2000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)a3 + 27) = self->_packetsRetransmitted;
  *(void *)((char *)a3 + 308) |= 0x4000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)a3 + 12) = self->_currentRTTMsecs;
  *(void *)((char *)a3 + 308) |= 0x800uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)a3 + 29) = self->_smoothedRTTMsecs;
  *(void *)((char *)a3 + 308) |= 0x10000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)a3 + 3) = self->_bestRTTMsecs;
  *(void *)((char *)a3 + 308) |= 4uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)a3 + 28) = self->_rTTvariance;
  *(void *)((char *)a3 + 308) |= 0x8000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)a3 + 30) = self->_synRetransmissionCount;
  *(void *)((char *)a3 + 308) |= 0x20000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)a3 + 11) = self->_connectionReuseCount;
  *(void *)((char *)a3 + 308) |= 0x400uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)a3 + 2) = self->_appReportingDataStallCount;
  *(void *)((char *)a3 + 308) |= 2uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)a3 + 1) = self->_appDataStallTimerMsecs;
  *(void *)((char *)a3 + 308) |= 1uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)a3 + 35) = self->_trafficClass;
  *(void *)((char *)a3 + 308) |= 0x400000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((unsigned char *)a3 + 305) = self->_tcpFastOpen;
  *(void *)((char *)a3 + 308) |= 0x400000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((unsigned char *)a3 + 296) = self->_cellularFallback;
  *(void *)((char *)a3 + 308) |= 0x2000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((unsigned char *)a3 + 297) = self->_cellularRRCConnected;
  *(void *)((char *)a3 + 308) |= 0x4000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((unsigned char *)a3 + 298) = self->_connected;
  *(void *)((char *)a3 + 308) |= 0x8000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)a3 + 73) = self->_interfaceType;
  *(void *)((char *)a3 + 308) |= 0x1000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)a3 + 34) = self->_timeToDNSStartMsecs;
  *(void *)((char *)a3 + 308) |= 0x200000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)a3 + 13) = self->_dNSResolvedTimeMsecs;
  *(void *)((char *)a3 + 308) |= 0x1000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)a3 + 32) = self->_timeToConnectionStartMsecs;
  *(void *)((char *)a3 + 308) |= 0x80000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)a3 + 10) = self->_connectionEstablishmentTimeMsecs;
  *(void *)((char *)a3 + 308) |= 0x200uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((void *)a3 + 4) = self->_betterRouteEventCount;
  *(void *)((char *)a3 + 308) |= 8uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((void *)a3 + 22) = self->_multipathServiceType;
  *(void *)((char *)a3 + 308) |= 0x200000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((unsigned char *)a3 + 300) = self->_firstParty;
  *(void *)((char *)a3 + 308) |= 0x20000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((void *)a3 + 16) = self->_multipathBytesInCell;
  *(void *)((char *)a3 + 308) |= 0x8000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((void *)a3 + 19) = self->_multipathBytesOutCell;
  *(void *)((char *)a3 + 308) |= 0x40000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((void *)a3 + 18) = self->_multipathBytesInWiFi;
  *(void *)((char *)a3 + 308) |= 0x20000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((void *)a3 + 21) = self->_multipathBytesOutWiFi;
  *(void *)((char *)a3 + 308) |= 0x100000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      return;
    }
LABEL_95:
    *((void *)a3 + 20) = self->_multipathBytesOutInitial;
    *(void *)((char *)a3 + 308) |= 0x80000uLL;
    return;
  }
LABEL_94:
  *((void *)a3 + 17) = self->_multipathBytesInInitial;
  *(void *)((char *)a3 + 308) |= 0x10000uLL;
  if ((*(void *)&self->_has & 0x80000) != 0) {
    goto LABEL_95;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init]];
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    *((void *)result + 33) = self->_timeToDNSResolvedMsecs;
    *(void *)((char *)result + 308) |= 0x100000000uLL;
    $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
    if ((*(void *)&has & 0x10000000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_52;
    }
  }
  else if ((*(void *)&has & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 299) = self->_dNSAnswersCached;
  *(void *)((char *)result + 308) |= 0x10000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)result + 31) = self->_timeToConnectionEstablishmentMsecs;
  *(void *)((char *)result + 308) |= 0x40000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)result + 15) = self->_iPAddressAttemptCount;
  *(void *)((char *)result + 308) |= 0x4000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 14) = self->_flowDurationMsecs;
  *(void *)((char *)result + 308) |= 0x2000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 72) = self->_connectedInterfaceType;
  *(void *)((char *)result + 308) |= 0x800000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((unsigned char *)result + 301) = self->_kernelReportedStalls;
  *(void *)((char *)result + 308) |= 0x40000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((unsigned char *)result + 302) = self->_kernelReportingConnectionStalled;
  *(void *)((char *)result + 308) |= 0x80000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((unsigned char *)result + 303) = self->_kernelReportingReadStalled;
  *(void *)((char *)result + 308) |= 0x100000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)result + 304) = self->_kernelReportingWriteStalled;
  *(void *)((char *)result + 308) |= 0x200000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 6) = self->_bytesIn;
  *(void *)((char *)result + 308) |= 0x20uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)result + 7) = self->_bytesOut;
  *(void *)((char *)result + 308) |= 0x40uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)result + 5) = self->_bytesDuplicate;
  *(void *)((char *)result + 308) |= 0x10uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)result + 8) = self->_bytesOutOfOrder;
  *(void *)((char *)result + 308) |= 0x80uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)result + 9) = self->_bytesRetransmitted;
  *(void *)((char *)result + 308) |= 0x100uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)result + 24) = self->_packetsIn;
  *(void *)((char *)result + 308) |= 0x800000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)result + 25) = self->_packetsOut;
  *(void *)((char *)result + 308) |= 0x1000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)result + 23) = self->_packetsDuplicate;
  *(void *)((char *)result + 308) |= 0x400000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)result + 26) = self->_packetsOutOfOrder;
  *(void *)((char *)result + 308) |= 0x2000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)result + 27) = self->_packetsRetransmitted;
  *(void *)((char *)result + 308) |= 0x4000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)result + 12) = self->_currentRTTMsecs;
  *(void *)((char *)result + 308) |= 0x800uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)result + 29) = self->_smoothedRTTMsecs;
  *(void *)((char *)result + 308) |= 0x10000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)result + 3) = self->_bestRTTMsecs;
  *(void *)((char *)result + 308) |= 4uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)result + 28) = self->_rTTvariance;
  *(void *)((char *)result + 308) |= 0x8000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)result + 30) = self->_synRetransmissionCount;
  *(void *)((char *)result + 308) |= 0x20000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)result + 11) = self->_connectionReuseCount;
  *(void *)((char *)result + 308) |= 0x400uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)result + 2) = self->_appReportingDataStallCount;
  *(void *)((char *)result + 308) |= 2uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)result + 1) = self->_appDataStallTimerMsecs;
  *(void *)((char *)result + 308) |= 1uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)result + 35) = self->_trafficClass;
  *(void *)((char *)result + 308) |= 0x400000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_31:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((unsigned char *)result + 305) = self->_tcpFastOpen;
  *(void *)((char *)result + 308) |= 0x400000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_32:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((unsigned char *)result + 296) = self->_cellularFallback;
  *(void *)((char *)result + 308) |= 0x2000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_33:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((unsigned char *)result + 297) = self->_cellularRRCConnected;
  *(void *)((char *)result + 308) |= 0x4000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_34:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((unsigned char *)result + 298) = self->_connected;
  *(void *)((char *)result + 308) |= 0x8000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_35:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)result + 73) = self->_interfaceType;
  *(void *)((char *)result + 308) |= 0x1000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)result + 34) = self->_timeToDNSStartMsecs;
  *(void *)((char *)result + 308) |= 0x200000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)result + 13) = self->_dNSResolvedTimeMsecs;
  *(void *)((char *)result + 308) |= 0x1000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)result + 32) = self->_timeToConnectionStartMsecs;
  *(void *)((char *)result + 308) |= 0x80000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_40;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((void *)result + 10) = self->_connectionEstablishmentTimeMsecs;
  *(void *)((char *)result + 308) |= 0x200uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((void *)result + 4) = self->_betterRouteEventCount;
  *(void *)((char *)result + 308) |= 8uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_41:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((void *)result + 22) = self->_multipathServiceType;
  *(void *)((char *)result + 308) |= 0x200000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((unsigned char *)result + 300) = self->_firstParty;
  *(void *)((char *)result + 308) |= 0x20000000000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((void *)result + 16) = self->_multipathBytesInCell;
  *(void *)((char *)result + 308) |= 0x8000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((void *)result + 19) = self->_multipathBytesOutCell;
  *(void *)((char *)result + 308) |= 0x40000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((void *)result + 18) = self->_multipathBytesInWiFi;
  *(void *)((char *)result + 308) |= 0x20000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((void *)result + 21) = self->_multipathBytesOutWiFi;
  *(void *)((char *)result + 308) |= 0x100000uLL;
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      return result;
    }
    goto LABEL_48;
  }
LABEL_95:
  *((void *)result + 17) = self->_multipathBytesInInitial;
  *(void *)((char *)result + 308) |= 0x10000uLL;
  if ((*(void *)&self->_has & 0x80000) == 0) {
    return result;
  }
LABEL_48:
  *((void *)result + 20) = self->_multipathBytesOutInitial;
  *(void *)((char *)result + 308) |= 0x80000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  uint64_t v7 = *(void *)((char *)a3 + 308);
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v7 & 0x100000000) == 0 || self->_timeToDNSResolvedMsecs != *((void *)a3 + 33)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x100000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_dNSAnswersCached)
    {
      if (!*((unsigned char *)a3 + 299)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 299))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0 || self->_timeToConnectionEstablishmentMsecs != *((void *)a3 + 31)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_iPAddressAttemptCount != *((void *)a3 + 15)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v7 & 0x2000) == 0 || self->_flowDurationMsecs != *((void *)a3 + 14)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x2000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_connectedInterfaceType != *((_DWORD *)a3 + 72)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_kernelReportedStalls)
    {
      if (!*((unsigned char *)a3 + 301)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 301))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_kernelReportingConnectionStalled)
    {
      if (!*((unsigned char *)a3 + 302)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 302))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_kernelReportingReadStalled)
    {
      if (!*((unsigned char *)a3 + 303)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 303))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_kernelReportingWriteStalled)
    {
      if (!*((unsigned char *)a3 + 304)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 304))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_bytesIn != *((void *)a3 + 6)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_bytesOut != *((void *)a3 + 7)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bytesDuplicate != *((void *)a3 + 5)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_bytesOutOfOrder != *((void *)a3 + 8)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_bytesRetransmitted != *((void *)a3 + 9)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_packetsIn != *((void *)a3 + 24)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_packetsOut != *((void *)a3 + 25)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_packetsDuplicate != *((void *)a3 + 23)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0 || self->_packetsOutOfOrder != *((void *)a3 + 26)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0 || self->_packetsRetransmitted != *((void *)a3 + 27)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_currentRTTMsecs != *((void *)a3 + 12)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0 || self->_smoothedRTTMsecs != *((void *)a3 + 29)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_bestRTTMsecs != *((void *)a3 + 3)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0 || self->_rTTvariance != *((void *)a3 + 28)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0 || self->_synRetransmissionCount != *((void *)a3 + 30)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_connectionReuseCount != *((void *)a3 + 11)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_appReportingDataStallCount != *((void *)a3 + 2)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_266;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_appDataStallTimerMsecs != *((void *)a3 + 1)) {
      goto LABEL_266;
    }
  }
  else if (v7)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_trafficClass != *((void *)a3 + 35)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x400000000000) != 0)
  {
    if ((v7 & 0x400000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_tcpFastOpen)
    {
      if (!*((unsigned char *)a3 + 305)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 305))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x400000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v7 & 0x2000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_cellularFallback)
    {
      if (!*((unsigned char *)a3 + 296)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 296))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x2000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v7 & 0x4000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_cellularRRCConnected)
    {
      if (!*((unsigned char *)a3 + 297)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 297))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x4000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0) {
      goto LABEL_266;
    }
    if (self->_connected)
    {
      if (!*((unsigned char *)a3 + 298)) {
        goto LABEL_266;
      }
    }
    else if (*((unsigned char *)a3 + 298))
    {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_interfaceType != *((_DWORD *)a3 + 73)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_timeToDNSStartMsecs != *((void *)a3 + 34)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v7 & 0x1000) == 0 || self->_dNSResolvedTimeMsecs != *((void *)a3 + 13)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x1000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0 || self->_timeToConnectionStartMsecs != *((void *)a3 + 32)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x80000000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_connectionEstablishmentTimeMsecs != *((void *)a3 + 10)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_266;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_betterRouteEventCount != *((void *)a3 + 4)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_multipathServiceType != *((void *)a3 + 22)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(void *)&has & 0x20000000000) == 0)
  {
    if ((v7 & 0x20000000000) != 0) {
      goto LABEL_266;
    }
    goto LABEL_237;
  }
  if ((v7 & 0x20000000000) == 0) {
    goto LABEL_266;
  }
  if (self->_firstParty)
  {
    if (!*((unsigned char *)a3 + 300)) {
      goto LABEL_266;
    }
    goto LABEL_237;
  }
  if (*((unsigned char *)a3 + 300))
  {
LABEL_266:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_237:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_multipathBytesInCell != *((void *)a3 + 16)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_multipathBytesOutCell != *((void *)a3 + 19)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v7 & 0x20000) == 0 || self->_multipathBytesInWiFi != *((void *)a3 + 18)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x20000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_multipathBytesOutWiFi != *((void *)a3 + 21)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_266;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_multipathBytesInInitial != *((void *)a3 + 17)) {
      goto LABEL_266;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_266;
  }
  uint64_t v8 = *(void *)((char *)a3 + 308);
  LOBYTE(v5) = (v8 & 0x80000) == 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v8 & 0x80000) == 0 || self->_multipathBytesOutInitial != *((void *)a3 + 20)) {
      goto LABEL_266;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $13AFF146FFF692FEAF73A0FE35206A83 has = self->_has;
  if ((*(void *)&has & 0x100000000) != 0)
  {
    unint64_t v50 = 2654435761u * self->_timeToDNSResolvedMsecs;
    if ((*(void *)&has & 0x10000000000) != 0)
    {
LABEL_3:
      uint64_t v49 = 2654435761 * self->_dNSAnswersCached;
      if ((*(_DWORD *)&has & 0x40000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else
  {
    unint64_t v50 = 0;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v49 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_4:
    unint64_t v48 = 2654435761u * self->_timeToConnectionEstablishmentMsecs;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  unint64_t v48 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_5:
    unint64_t v47 = 2654435761u * self->_iPAddressAttemptCount;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v47 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_6:
    unint64_t v46 = 2654435761u * self->_flowDurationMsecs;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v46 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_7:
    uint64_t v45 = 2654435761 * self->_connectedInterfaceType;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v45 = 0;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_8:
    uint64_t v44 = 2654435761 * self->_kernelReportedStalls;
    if ((*(void *)&has & 0x80000000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v44 = 0;
  if ((*(void *)&has & 0x80000000000) != 0)
  {
LABEL_9:
    uint64_t v43 = 2654435761 * self->_kernelReportingConnectionStalled;
    if ((*(void *)&has & 0x100000000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v43 = 0;
  if ((*(void *)&has & 0x100000000000) != 0)
  {
LABEL_10:
    uint64_t v42 = 2654435761 * self->_kernelReportingReadStalled;
    if ((*(void *)&has & 0x200000000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v42 = 0;
  if ((*(void *)&has & 0x200000000000) != 0)
  {
LABEL_11:
    uint64_t v41 = 2654435761 * self->_kernelReportingWriteStalled;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v41 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_12:
    unint64_t v40 = 2654435761u * self->_bytesIn;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  unint64_t v40 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_13:
    unint64_t v39 = 2654435761u * self->_bytesOut;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  unint64_t v39 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_14:
    unint64_t v38 = 2654435761u * self->_bytesDuplicate;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  unint64_t v38 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_15:
    unint64_t v37 = 2654435761u * self->_bytesOutOfOrder;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  unint64_t v37 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_16:
    unint64_t v36 = 2654435761u * self->_bytesRetransmitted;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  unint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_17:
    unint64_t v35 = 2654435761u * self->_packetsIn;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  unint64_t v35 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_18:
    unint64_t v34 = 2654435761u * self->_packetsOut;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  unint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_19:
    unint64_t v33 = 2654435761u * self->_packetsDuplicate;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  unint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_20:
    unint64_t v32 = 2654435761u * self->_packetsOutOfOrder;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  unint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_21:
    unint64_t v31 = 2654435761u * self->_packetsRetransmitted;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  unint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_22:
    unint64_t v30 = 2654435761u * self->_currentRTTMsecs;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  unint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_23:
    unint64_t v3 = 2654435761u * self->_smoothedRTTMsecs;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  unint64_t v3 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_24:
    unint64_t v4 = 2654435761u * self->_bestRTTMsecs;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  unint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_25:
    unint64_t v5 = 2654435761u * self->_rTTvariance;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  unint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_26:
    unint64_t v6 = 2654435761u * self->_synRetransmissionCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  unint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_27:
    unint64_t v7 = 2654435761u * self->_connectionReuseCount;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  unint64_t v7 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_28:
    unint64_t v8 = 2654435761u * self->_appReportingDataStallCount;
    if (*(unsigned char *)&has) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  unint64_t v8 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_29:
    unint64_t v9 = 2654435761u * self->_appDataStallTimerMsecs;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  unint64_t v9 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_30:
    unint64_t v10 = 2654435761u * self->_trafficClass;
    if ((*(void *)&has & 0x400000000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  unint64_t v10 = 0;
  if ((*(void *)&has & 0x400000000000) != 0)
  {
LABEL_31:
    uint64_t v11 = 2654435761 * self->_tcpFastOpen;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v11 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_32:
    uint64_t v12 = 2654435761 * self->_cellularFallback;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v12 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_33:
    uint64_t v13 = 2654435761 * self->_cellularRRCConnected;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v13 = 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_34:
    uint64_t v14 = 2654435761 * self->_connected;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v14 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_35:
    uint64_t v15 = 2654435761 * self->_interfaceType;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v15 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_36:
    unint64_t v16 = 2654435761u * self->_timeToDNSStartMsecs;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  unint64_t v16 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_37:
    unint64_t v17 = 2654435761u * self->_dNSResolvedTimeMsecs;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_38:
    unint64_t v18 = 2654435761u * self->_timeToConnectionStartMsecs;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  unint64_t v18 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_39:
    unint64_t v19 = 2654435761u * self->_connectionEstablishmentTimeMsecs;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  unint64_t v19 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_40:
    unint64_t v20 = 2654435761u * self->_betterRouteEventCount;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  unint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_41:
    unint64_t v21 = 2654435761u * self->_multipathServiceType;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  unint64_t v21 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_42:
    uint64_t v22 = 2654435761 * self->_firstParty;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_43:
    unint64_t v23 = 2654435761u * self->_multipathBytesInCell;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  unint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_44:
    unint64_t v24 = 2654435761u * self->_multipathBytesOutCell;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  unint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_45:
    unint64_t v25 = 2654435761u * self->_multipathBytesInWiFi;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_93;
  }
LABEL_92:
  unint64_t v25 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_46:
    unint64_t v26 = 2654435761u * self->_multipathBytesOutWiFi;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_47;
    }
LABEL_94:
    unint64_t v27 = 0;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_48;
    }
LABEL_95:
    unint64_t v28 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_93:
  unint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_94;
  }
LABEL_47:
  unint64_t v27 = 2654435761u * self->_multipathBytesInInitial;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_95;
  }
LABEL_48:
  unint64_t v28 = 2654435761u * self->_multipathBytesOutInitial;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x100000000) != 0)
  {
    self->_timeToDNSResolvedMsecs = *((void *)a3 + 33);
    *(void *)&self->_has |= 0x100000000uLL;
    uint64_t v3 = *(void *)((char *)a3 + 308);
    if ((v3 & 0x10000000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x40000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_51;
    }
  }
  else if ((v3 & 0x10000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_dNSAnswersCached = *((unsigned char *)a3 + 299);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_timeToConnectionEstablishmentMsecs = *((void *)a3 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x4000) == 0)
  {
LABEL_5:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_iPAddressAttemptCount = *((void *)a3 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x2000) == 0)
  {
LABEL_6:
    if ((v3 & 0x800000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_flowDurationMsecs = *((void *)a3 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x40000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_uint64_t connectedInterfaceType = *((_DWORD *)a3 + 72);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x40000000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x80000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_kernelReportedStalls = *((unsigned char *)a3 + 301);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x80000000000) == 0)
  {
LABEL_9:
    if ((v3 & 0x100000000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_kernelReportingConnectionStalled = *((unsigned char *)a3 + 302);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x100000000000) == 0)
  {
LABEL_10:
    if ((v3 & 0x200000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_kernelReportingReadStalled = *((unsigned char *)a3 + 303);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x200000000000) == 0)
  {
LABEL_11:
    if ((v3 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_kernelReportingWriteStalled = *((unsigned char *)a3 + 304);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x20) == 0)
  {
LABEL_12:
    if ((v3 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_bytesIn = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x40) == 0)
  {
LABEL_13:
    if ((v3 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_bytesOut = *((void *)a3 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x10) == 0)
  {
LABEL_14:
    if ((v3 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_bytesDuplicate = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x80) == 0)
  {
LABEL_15:
    if ((v3 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_bytesOutOfOrder = *((void *)a3 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x100) == 0)
  {
LABEL_16:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_bytesRetransmitted = *((void *)a3 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x800000) == 0)
  {
LABEL_17:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_packetsIn = *((void *)a3 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_18:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_packetsOut = *((void *)a3 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x400000) == 0)
  {
LABEL_19:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_packetsDuplicate = *((void *)a3 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_packetsOutOfOrder = *((void *)a3 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_21:
    if ((v3 & 0x800) == 0) {
      goto LABEL_22;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_packetsRetransmitted = *((void *)a3 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x800) == 0)
  {
LABEL_22:
    if ((v3 & 0x10000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_currentRTTMsecs = *((void *)a3 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_23:
    if ((v3 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_smoothedRTTMsecs = *((void *)a3 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 4) == 0)
  {
LABEL_24:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_bestRTTMsecs = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_rTTvariance = *((void *)a3 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x400) == 0) {
      goto LABEL_27;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_synRetransmissionCount = *((void *)a3 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x400) == 0)
  {
LABEL_27:
    if ((v3 & 2) == 0) {
      goto LABEL_28;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_connectionReuseCount = *((void *)a3 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 2) == 0)
  {
LABEL_28:
    if ((v3 & 1) == 0) {
      goto LABEL_29;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_appReportingDataStallCount = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 1) == 0)
  {
LABEL_29:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_appDataStallTimerMsecs = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x400000000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_trafficClass = *((void *)a3 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x400000000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x2000000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_tcpFastOpen = *((unsigned char *)a3 + 305);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x4000000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_cellularFallback = *((unsigned char *)a3 + 296);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x8000000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_cellularRRCConnected = *((unsigned char *)a3 + 297);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_34:
    if ((v3 & 0x1000000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_connected = *((unsigned char *)a3 + 298);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_35:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_uint64_t interfaceType = *((_DWORD *)a3 + 73);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_36:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_timeToDNSStartMsecs = *((void *)a3 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x1000) == 0)
  {
LABEL_37:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_dNSResolvedTimeMsecs = *((void *)a3 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_38:
    if ((v3 & 0x200) == 0) {
      goto LABEL_39;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_timeToConnectionStartMsecs = *((void *)a3 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x200) == 0)
  {
LABEL_39:
    if ((v3 & 8) == 0) {
      goto LABEL_40;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_connectionEstablishmentTimeMsecs = *((void *)a3 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 8) == 0)
  {
LABEL_40:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_betterRouteEventCount = *((void *)a3 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x200000) == 0)
  {
LABEL_41:
    if ((v3 & 0x20000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_multipathServiceType = *((void *)a3 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_42:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_firstParty = *((unsigned char *)a3 + 300);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x8000) == 0)
  {
LABEL_43:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_multipathBytesInCell = *((void *)a3 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x40000) == 0)
  {
LABEL_44:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_multipathBytesOutCell = *((void *)a3 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x20000) == 0)
  {
LABEL_45:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_multipathBytesInWiFi = *((void *)a3 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x100000) == 0)
  {
LABEL_46:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_multipathBytesOutWiFi = *((void *)a3 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v3 = *(void *)((char *)a3 + 308);
  if ((v3 & 0x10000) == 0)
  {
LABEL_47:
    if ((v3 & 0x80000) == 0) {
      return;
    }
LABEL_95:
    self->_multipathBytesOutInitial = *((void *)a3 + 20);
    *(void *)&self->_has |= 0x80000uLL;
    return;
  }
LABEL_94:
  self->_multipathBytesInInitial = *((void *)a3 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  if ((*(void *)((unsigned char *)a3 + 308) & 0x80000) != 0) {
    goto LABEL_95;
  }
}

- (unint64_t)timeToDNSResolvedMsecs
{
  return self->_timeToDNSResolvedMsecs;
}

- (BOOL)dNSAnswersCached
{
  return self->_dNSAnswersCached;
}

- (unint64_t)timeToConnectionEstablishmentMsecs
{
  return self->_timeToConnectionEstablishmentMsecs;
}

- (unint64_t)iPAddressAttemptCount
{
  return self->_iPAddressAttemptCount;
}

- (unint64_t)flowDurationMsecs
{
  return self->_flowDurationMsecs;
}

- (BOOL)kernelReportedStalls
{
  return self->_kernelReportedStalls;
}

- (BOOL)kernelReportingConnectionStalled
{
  return self->_kernelReportingConnectionStalled;
}

- (BOOL)kernelReportingReadStalled
{
  return self->_kernelReportingReadStalled;
}

- (BOOL)kernelReportingWriteStalled
{
  return self->_kernelReportingWriteStalled;
}

- (unint64_t)bytesIn
{
  return self->_bytesIn;
}

- (unint64_t)bytesOut
{
  return self->_bytesOut;
}

- (unint64_t)bytesDuplicate
{
  return self->_bytesDuplicate;
}

- (unint64_t)bytesOutOfOrder
{
  return self->_bytesOutOfOrder;
}

- (unint64_t)bytesRetransmitted
{
  return self->_bytesRetransmitted;
}

- (unint64_t)packetsIn
{
  return self->_packetsIn;
}

- (unint64_t)packetsOut
{
  return self->_packetsOut;
}

- (unint64_t)packetsDuplicate
{
  return self->_packetsDuplicate;
}

- (unint64_t)packetsOutOfOrder
{
  return self->_packetsOutOfOrder;
}

- (unint64_t)packetsRetransmitted
{
  return self->_packetsRetransmitted;
}

- (unint64_t)currentRTTMsecs
{
  return self->_currentRTTMsecs;
}

- (unint64_t)smoothedRTTMsecs
{
  return self->_smoothedRTTMsecs;
}

- (unint64_t)bestRTTMsecs
{
  return self->_bestRTTMsecs;
}

- (unint64_t)rTTvariance
{
  return self->_rTTvariance;
}

- (unint64_t)synRetransmissionCount
{
  return self->_synRetransmissionCount;
}

- (unint64_t)connectionReuseCount
{
  return self->_connectionReuseCount;
}

- (unint64_t)appReportingDataStallCount
{
  return self->_appReportingDataStallCount;
}

- (unint64_t)appDataStallTimerMsecs
{
  return self->_appDataStallTimerMsecs;
}

- (unint64_t)trafficClass
{
  return self->_trafficClass;
}

- (BOOL)tcpFastOpen
{
  return self->_tcpFastOpen;
}

- (BOOL)cellularFallback
{
  return self->_cellularFallback;
}

- (BOOL)cellularRRCConnected
{
  return self->_cellularRRCConnected;
}

- (BOOL)connected
{
  return self->_connected;
}

- (unint64_t)timeToDNSStartMsecs
{
  return self->_timeToDNSStartMsecs;
}

- (unint64_t)dNSResolvedTimeMsecs
{
  return self->_dNSResolvedTimeMsecs;
}

- (unint64_t)timeToConnectionStartMsecs
{
  return self->_timeToConnectionStartMsecs;
}

- (unint64_t)connectionEstablishmentTimeMsecs
{
  return self->_connectionEstablishmentTimeMsecs;
}

- (unint64_t)betterRouteEventCount
{
  return self->_betterRouteEventCount;
}

- (unint64_t)multipathServiceType
{
  return self->_multipathServiceType;
}

- (BOOL)firstParty
{
  return self->_firstParty;
}

- (unint64_t)multipathBytesInCell
{
  return self->_multipathBytesInCell;
}

- (unint64_t)multipathBytesOutCell
{
  return self->_multipathBytesOutCell;
}

- (unint64_t)multipathBytesInWiFi
{
  return self->_multipathBytesInWiFi;
}

- (unint64_t)multipathBytesOutWiFi
{
  return self->_multipathBytesOutWiFi;
}

- (unint64_t)multipathBytesInInitial
{
  return self->_multipathBytesInInitial;
}

- (unint64_t)multipathBytesOutInitial
{
  return self->_multipathBytesOutInitial;
}

@end