@interface AWDWiFiMetricsManagerAwdlUsage
+ (Class)hopCountHistogramType;
+ (Class)parentRssiHistogramType;
+ (Class)servicesType;
+ (Class)statesType;
- (AWDWifiAwdlD2dMigrationStats)d2dMigrationStats;
- (BOOL)hasAdvertiseAddFilteredCount;
- (BOOL)hasAdvertiseAddTotalCount;
- (BOOL)hasAdvertiseDeleteFilteredCount;
- (BOOL)hasAdvertiseDeleteTotalCount;
- (BOOL)hasAppRxBytes;
- (BOOL)hasAppTxBytes;
- (BOOL)hasBrowseAddFilteredCount;
- (BOOL)hasBrowseAddTotalCount;
- (BOOL)hasBrowseDeleteFilteredCount;
- (BOOL)hasBrowseDeleteTotalCount;
- (BOOL)hasCachedPeersCapOther;
- (BOOL)hasCachedPeersDifferentInfra;
- (BOOL)hasCachedPeersNotAssociated;
- (BOOL)hasCachedPeersOn24G;
- (BOOL)hasCachedPeersOn5G;
- (BOOL)hasCachedPeersOnDFS;
- (BOOL)hasCachedPeersOnOther;
- (BOOL)hasCachedPeersSameInfra;
- (BOOL)hasD2dMigrationStats;
- (BOOL)hasDfspAirplayConnected;
- (BOOL)hasDfspAirplayFailed;
- (BOOL)hasDfspCSAReceivedFromAP;
- (BOOL)hasDfspCSAReceivedFromPeer;
- (BOOL)hasDfspResume;
- (BOOL)hasDfspSuspect;
- (BOOL)hasFlags;
- (BOOL)hasIfPacketFailures;
- (BOOL)hasIfRxBytes;
- (BOOL)hasIfTxBytes;
- (BOOL)hasNoServiceIdleTime;
- (BOOL)hasNumAirplaySessions;
- (BOOL)hasNumDynSdbAirplayAllowed;
- (BOOL)hasNumDynSdbEntrySuccess;
- (BOOL)hasNumDynSdbExitDueToRate;
- (BOOL)hasNumDynSdbReEntrySuccess;
- (BOOL)hasNumOfCachedPeers;
- (BOOL)hasNumOfPeers;
- (BOOL)hasPeerInfraChannel;
- (BOOL)hasPeerInfraChannelFlags;
- (BOOL)hasPeriodInMinutes;
- (BOOL)hasSelfCapOther;
- (BOOL)hasSelfInfraChannel;
- (BOOL)hasSelfInfraChannelFlags;
- (BOOL)hasSyncChangesCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)hopCountHistograms;
- (NSMutableArray)parentRssiHistograms;
- (NSMutableArray)services;
- (NSMutableArray)states;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hopCountHistogramAtIndex:(unint64_t)a3;
- (id)parentRssiHistogramAtIndex:(unint64_t)a3;
- (id)servicesAtIndex:(unint64_t)a3;
- (id)statesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hopCountHistogramsCount;
- (unint64_t)noServiceIdleTime;
- (unint64_t)parentRssiHistogramsCount;
- (unint64_t)servicesCount;
- (unint64_t)statesCount;
- (unint64_t)syncChangesCount;
- (unint64_t)timestamp;
- (unsigned)advertiseAddFilteredCount;
- (unsigned)advertiseAddTotalCount;
- (unsigned)advertiseDeleteFilteredCount;
- (unsigned)advertiseDeleteTotalCount;
- (unsigned)appRxBytes;
- (unsigned)appTxBytes;
- (unsigned)browseAddFilteredCount;
- (unsigned)browseAddTotalCount;
- (unsigned)browseDeleteFilteredCount;
- (unsigned)browseDeleteTotalCount;
- (unsigned)cachedPeersCapOther;
- (unsigned)cachedPeersDifferentInfra;
- (unsigned)cachedPeersNotAssociated;
- (unsigned)cachedPeersOn24G;
- (unsigned)cachedPeersOn5G;
- (unsigned)cachedPeersOnDFS;
- (unsigned)cachedPeersOnOther;
- (unsigned)cachedPeersSameInfra;
- (unsigned)dfspAirplayConnected;
- (unsigned)dfspAirplayFailed;
- (unsigned)dfspCSAReceivedFromAP;
- (unsigned)dfspCSAReceivedFromPeer;
- (unsigned)dfspResume;
- (unsigned)dfspSuspect;
- (unsigned)flags;
- (unsigned)ifPacketFailures;
- (unsigned)ifRxBytes;
- (unsigned)ifTxBytes;
- (unsigned)numAirplaySessions;
- (unsigned)numDynSdbAirplayAllowed;
- (unsigned)numDynSdbEntrySuccess;
- (unsigned)numDynSdbExitDueToRate;
- (unsigned)numDynSdbReEntrySuccess;
- (unsigned)numOfCachedPeers;
- (unsigned)numOfPeers;
- (unsigned)peerInfraChannel;
- (unsigned)peerInfraChannelFlags;
- (unsigned)periodInMinutes;
- (unsigned)selfCapOther;
- (unsigned)selfInfraChannel;
- (unsigned)selfInfraChannelFlags;
- (void)addHopCountHistogram:(id)a3;
- (void)addParentRssiHistogram:(id)a3;
- (void)addServices:(id)a3;
- (void)addStates:(id)a3;
- (void)clearHopCountHistograms;
- (void)clearParentRssiHistograms;
- (void)clearServices;
- (void)clearStates;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAdvertiseAddFilteredCount:(unsigned int)a3;
- (void)setAdvertiseAddTotalCount:(unsigned int)a3;
- (void)setAdvertiseDeleteFilteredCount:(unsigned int)a3;
- (void)setAdvertiseDeleteTotalCount:(unsigned int)a3;
- (void)setAppRxBytes:(unsigned int)a3;
- (void)setAppTxBytes:(unsigned int)a3;
- (void)setBrowseAddFilteredCount:(unsigned int)a3;
- (void)setBrowseAddTotalCount:(unsigned int)a3;
- (void)setBrowseDeleteFilteredCount:(unsigned int)a3;
- (void)setBrowseDeleteTotalCount:(unsigned int)a3;
- (void)setCachedPeersCapOther:(unsigned int)a3;
- (void)setCachedPeersDifferentInfra:(unsigned int)a3;
- (void)setCachedPeersNotAssociated:(unsigned int)a3;
- (void)setCachedPeersOn24G:(unsigned int)a3;
- (void)setCachedPeersOn5G:(unsigned int)a3;
- (void)setCachedPeersOnDFS:(unsigned int)a3;
- (void)setCachedPeersOnOther:(unsigned int)a3;
- (void)setCachedPeersSameInfra:(unsigned int)a3;
- (void)setD2dMigrationStats:(id)a3;
- (void)setDfspAirplayConnected:(unsigned int)a3;
- (void)setDfspAirplayFailed:(unsigned int)a3;
- (void)setDfspCSAReceivedFromAP:(unsigned int)a3;
- (void)setDfspCSAReceivedFromPeer:(unsigned int)a3;
- (void)setDfspResume:(unsigned int)a3;
- (void)setDfspSuspect:(unsigned int)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setHasAdvertiseAddFilteredCount:(BOOL)a3;
- (void)setHasAdvertiseAddTotalCount:(BOOL)a3;
- (void)setHasAdvertiseDeleteFilteredCount:(BOOL)a3;
- (void)setHasAdvertiseDeleteTotalCount:(BOOL)a3;
- (void)setHasAppRxBytes:(BOOL)a3;
- (void)setHasAppTxBytes:(BOOL)a3;
- (void)setHasBrowseAddFilteredCount:(BOOL)a3;
- (void)setHasBrowseAddTotalCount:(BOOL)a3;
- (void)setHasBrowseDeleteFilteredCount:(BOOL)a3;
- (void)setHasBrowseDeleteTotalCount:(BOOL)a3;
- (void)setHasCachedPeersCapOther:(BOOL)a3;
- (void)setHasCachedPeersDifferentInfra:(BOOL)a3;
- (void)setHasCachedPeersNotAssociated:(BOOL)a3;
- (void)setHasCachedPeersOn24G:(BOOL)a3;
- (void)setHasCachedPeersOn5G:(BOOL)a3;
- (void)setHasCachedPeersOnDFS:(BOOL)a3;
- (void)setHasCachedPeersOnOther:(BOOL)a3;
- (void)setHasCachedPeersSameInfra:(BOOL)a3;
- (void)setHasDfspAirplayConnected:(BOOL)a3;
- (void)setHasDfspAirplayFailed:(BOOL)a3;
- (void)setHasDfspCSAReceivedFromAP:(BOOL)a3;
- (void)setHasDfspCSAReceivedFromPeer:(BOOL)a3;
- (void)setHasDfspResume:(BOOL)a3;
- (void)setHasDfspSuspect:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasIfPacketFailures:(BOOL)a3;
- (void)setHasIfRxBytes:(BOOL)a3;
- (void)setHasIfTxBytes:(BOOL)a3;
- (void)setHasNoServiceIdleTime:(BOOL)a3;
- (void)setHasNumAirplaySessions:(BOOL)a3;
- (void)setHasNumDynSdbAirplayAllowed:(BOOL)a3;
- (void)setHasNumDynSdbEntrySuccess:(BOOL)a3;
- (void)setHasNumDynSdbExitDueToRate:(BOOL)a3;
- (void)setHasNumDynSdbReEntrySuccess:(BOOL)a3;
- (void)setHasNumOfCachedPeers:(BOOL)a3;
- (void)setHasNumOfPeers:(BOOL)a3;
- (void)setHasPeerInfraChannel:(BOOL)a3;
- (void)setHasPeerInfraChannelFlags:(BOOL)a3;
- (void)setHasPeriodInMinutes:(BOOL)a3;
- (void)setHasSelfCapOther:(BOOL)a3;
- (void)setHasSelfInfraChannel:(BOOL)a3;
- (void)setHasSelfInfraChannelFlags:(BOOL)a3;
- (void)setHasSyncChangesCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHopCountHistograms:(id)a3;
- (void)setIfPacketFailures:(unsigned int)a3;
- (void)setIfRxBytes:(unsigned int)a3;
- (void)setIfTxBytes:(unsigned int)a3;
- (void)setNoServiceIdleTime:(unint64_t)a3;
- (void)setNumAirplaySessions:(unsigned int)a3;
- (void)setNumDynSdbAirplayAllowed:(unsigned int)a3;
- (void)setNumDynSdbEntrySuccess:(unsigned int)a3;
- (void)setNumDynSdbExitDueToRate:(unsigned int)a3;
- (void)setNumDynSdbReEntrySuccess:(unsigned int)a3;
- (void)setNumOfCachedPeers:(unsigned int)a3;
- (void)setNumOfPeers:(unsigned int)a3;
- (void)setParentRssiHistograms:(id)a3;
- (void)setPeerInfraChannel:(unsigned int)a3;
- (void)setPeerInfraChannelFlags:(unsigned int)a3;
- (void)setPeriodInMinutes:(unsigned int)a3;
- (void)setSelfCapOther:(unsigned int)a3;
- (void)setSelfInfraChannel:(unsigned int)a3;
- (void)setSelfInfraChannelFlags:(unsigned int)a3;
- (void)setServices:(id)a3;
- (void)setStates:(id)a3;
- (void)setSyncChangesCount:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerAwdlUsage

- (void)dealloc
{
  [(AWDWiFiMetricsManagerAwdlUsage *)self setStates:0];
  [(AWDWiFiMetricsManagerAwdlUsage *)self setServices:0];
  [(AWDWiFiMetricsManagerAwdlUsage *)self setHopCountHistograms:0];
  [(AWDWiFiMetricsManagerAwdlUsage *)self setParentRssiHistograms:0];
  [(AWDWiFiMetricsManagerAwdlUsage *)self setD2dMigrationStats:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAwdlUsage;
  [(AWDWiFiMetricsManagerAwdlUsage *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSelfInfraChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_selfInfraChannel = a3;
}

- (void)setHasSelfInfraChannel:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasSelfInfraChannel
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setPeerInfraChannel:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_peerInfraChannel = a3;
}

- (void)setHasPeerInfraChannel:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasPeerInfraChannel
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setNumOfPeers:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_numOfPeers = a3;
}

- (void)setHasNumOfPeers:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasNumOfPeers
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setNumOfCachedPeers:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_numOfCachedPeers = a3;
}

- (void)setHasNumOfCachedPeers:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasNumOfCachedPeers
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setCachedPeersOn24G:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_cachedPeersOn24G = a3;
}

- (void)setHasCachedPeersOn24G:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCachedPeersOn24G
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCachedPeersOn5G:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_cachedPeersOn5G = a3;
}

- (void)setHasCachedPeersOn5G:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasCachedPeersOn5G
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCachedPeersOnDFS:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_cachedPeersOnDFS = a3;
}

- (void)setHasCachedPeersOnDFS:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasCachedPeersOnDFS
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCachedPeersNotAssociated:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_cachedPeersNotAssociated = a3;
}

- (void)setHasCachedPeersNotAssociated:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasCachedPeersNotAssociated
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setFlags:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasFlags
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setIfPacketFailures:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_ifPacketFailures = a3;
}

- (void)setHasIfPacketFailures:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasIfPacketFailures
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setIfRxBytes:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_ifRxBytes = a3;
}

- (void)setHasIfRxBytes:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasIfRxBytes
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setIfTxBytes:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_ifTxBytes = a3;
}

- (void)setHasIfTxBytes:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasIfTxBytes
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setAppRxBytes:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_appRxBytes = a3;
}

- (void)setHasAppRxBytes:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasAppRxBytes
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setAppTxBytes:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_appTxBytes = a3;
}

- (void)setHasAppTxBytes:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasAppTxBytes
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPeriodInMinutes:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_periodInMinutes = a3;
}

- (void)setHasPeriodInMinutes:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPeriodInMinutes
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)clearStates
{
}

- (void)addStates:(id)a3
{
  states = self->_states;
  if (!states)
  {
    states = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_states = states;
  }

  [(NSMutableArray *)states addObject:a3];
}

- (unint64_t)statesCount
{
  return [(NSMutableArray *)self->_states count];
}

- (id)statesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_states objectAtIndex:a3];
}

+ (Class)statesType
{
  return (Class)objc_opt_class();
}

- (void)setNoServiceIdleTime:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_noServiceIdleTime = a3;
}

- (void)setHasNoServiceIdleTime:(BOOL)a3
{
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasNoServiceIdleTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setBrowseAddTotalCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_browseAddTotalCount = a3;
}

- (void)setHasBrowseAddTotalCount:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasBrowseAddTotalCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBrowseAddFilteredCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_browseAddFilteredCount = a3;
}

- (void)setHasBrowseAddFilteredCount:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasBrowseAddFilteredCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBrowseDeleteTotalCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_browseDeleteTotalCount = a3;
}

- (void)setHasBrowseDeleteTotalCount:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasBrowseDeleteTotalCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setBrowseDeleteFilteredCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_browseDeleteFilteredCount = a3;
}

- (void)setHasBrowseDeleteFilteredCount:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasBrowseDeleteFilteredCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setAdvertiseAddTotalCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_advertiseAddTotalCount = a3;
}

- (void)setHasAdvertiseAddTotalCount:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAdvertiseAddTotalCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAdvertiseAddFilteredCount:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_advertiseAddFilteredCount = a3;
}

- (void)setHasAdvertiseAddFilteredCount:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAdvertiseAddFilteredCount
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAdvertiseDeleteTotalCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_advertiseDeleteTotalCount = a3;
}

- (void)setHasAdvertiseDeleteTotalCount:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAdvertiseDeleteTotalCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAdvertiseDeleteFilteredCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_advertiseDeleteFilteredCount = a3;
}

- (void)setHasAdvertiseDeleteFilteredCount:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAdvertiseDeleteFilteredCount
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)clearServices
{
}

- (void)addServices:(id)a3
{
  services = self->_services;
  if (!services)
  {
    services = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_services = services;
  }

  [(NSMutableArray *)services addObject:a3];
}

- (unint64_t)servicesCount
{
  return [(NSMutableArray *)self->_services count];
}

- (id)servicesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_services objectAtIndex:a3];
}

+ (Class)servicesType
{
  return (Class)objc_opt_class();
}

- (void)setCachedPeersSameInfra:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_cachedPeersSameInfra = a3;
}

- (void)setHasCachedPeersSameInfra:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasCachedPeersSameInfra
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCachedPeersDifferentInfra:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_cachedPeersDifferentInfra = a3;
}

- (void)setHasCachedPeersDifferentInfra:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasCachedPeersDifferentInfra
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setDfspCSAReceivedFromPeer:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_dfspCSAReceivedFromPeer = a3;
}

- (void)setHasDfspCSAReceivedFromPeer:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasDfspCSAReceivedFromPeer
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setDfspCSAReceivedFromAP:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_dfspCSAReceivedFromAP = a3;
}

- (void)setHasDfspCSAReceivedFromAP:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasDfspCSAReceivedFromAP
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setDfspSuspect:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_dfspSuspect = a3;
}

- (void)setHasDfspSuspect:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasDfspSuspect
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setDfspResume:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_dfspResume = a3;
}

- (void)setHasDfspResume:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasDfspResume
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDfspAirplayConnected:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_dfspAirplayConnected = a3;
}

- (void)setHasDfspAirplayConnected:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasDfspAirplayConnected
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setDfspAirplayFailed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_dfspAirplayFailed = a3;
}

- (void)setHasDfspAirplayFailed:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasDfspAirplayFailed
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)clearHopCountHistograms
{
}

- (void)addHopCountHistogram:(id)a3
{
  hopCountHistograms = self->_hopCountHistograms;
  if (!hopCountHistograms)
  {
    hopCountHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_hopCountHistograms = hopCountHistograms;
  }

  [(NSMutableArray *)hopCountHistograms addObject:a3];
}

- (unint64_t)hopCountHistogramsCount
{
  return [(NSMutableArray *)self->_hopCountHistograms count];
}

- (id)hopCountHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_hopCountHistograms objectAtIndex:a3];
}

+ (Class)hopCountHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearParentRssiHistograms
{
}

- (void)addParentRssiHistogram:(id)a3
{
  parentRssiHistograms = self->_parentRssiHistograms;
  if (!parentRssiHistograms)
  {
    parentRssiHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_parentRssiHistograms = parentRssiHistograms;
  }

  [(NSMutableArray *)parentRssiHistograms addObject:a3];
}

- (unint64_t)parentRssiHistogramsCount
{
  return [(NSMutableArray *)self->_parentRssiHistograms count];
}

- (id)parentRssiHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_parentRssiHistograms objectAtIndex:a3];
}

+ (Class)parentRssiHistogramType
{
  return (Class)objc_opt_class();
}

- (void)setSyncChangesCount:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_syncChangesCount = a3;
}

- (void)setHasSyncChangesCount:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasSyncChangesCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setNumAirplaySessions:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_numAirplaySessions = a3;
}

- (void)setHasNumAirplaySessions:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasNumAirplaySessions
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setNumDynSdbAirplayAllowed:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_numDynSdbAirplayAllowed = a3;
}

- (void)setHasNumDynSdbAirplayAllowed:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbAirplayAllowed
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setNumDynSdbEntrySuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_numDynSdbEntrySuccess = a3;
}

- (void)setHasNumDynSdbEntrySuccess:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbEntrySuccess
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setNumDynSdbExitDueToRate:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_numDynSdbExitDueToRate = a3;
}

- (void)setHasNumDynSdbExitDueToRate:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbExitDueToRate
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setNumDynSdbReEntrySuccess:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_numDynSdbReEntrySuccess = a3;
}

- (void)setHasNumDynSdbReEntrySuccess:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasNumDynSdbReEntrySuccess
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (BOOL)hasD2dMigrationStats
{
  return self->_d2dMigrationStats != 0;
}

- (void)setSelfInfraChannelFlags:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_selfInfraChannelFlags = a3;
}

- (void)setHasSelfInfraChannelFlags:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasSelfInfraChannelFlags
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setPeerInfraChannelFlags:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_peerInfraChannelFlags = a3;
}

- (void)setHasPeerInfraChannelFlags:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPeerInfraChannelFlags
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCachedPeersOnOther:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_cachedPeersOnOther = a3;
}

- (void)setHasCachedPeersOnOther:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasCachedPeersOnOther
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setSelfCapOther:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_selfCapOther = a3;
}

- (void)setHasSelfCapOther:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasSelfCapOther
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setCachedPeersCapOther:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_cachedPeersCapOther = a3;
}

- (void)setHasCachedPeersCapOther:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($A7F8C9E9D45357ACF4091D1997306C1B)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCachedPeersCapOther
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAwdlUsage;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerAwdlUsage description](&v3, sel_description), -[AWDWiFiMetricsManagerAwdlUsage dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    if ((*(void *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x4000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_91;
    }
  }
  else if ((*(void *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfInfraChannel] forKey:@"selfInfraChannel"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerInfraChannel] forKey:@"peerInfraChannel"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_93;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numOfPeers] forKey:@"numOfPeers"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_94;
  }
LABEL_93:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numOfCachedPeers] forKey:@"numOfCachedPeers"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_95;
  }
LABEL_94:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersOn24G] forKey:@"cachedPeersOn24G"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_96;
  }
LABEL_95:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersOn5G] forKey:@"cachedPeersOn5G"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersOnDFS] forKey:@"cachedPeersOnDFS"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersNotAssociated] forKey:@"cachedPeersNotAssociated"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_99;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_flags] forKey:@"flags"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_100;
  }
LABEL_99:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ifPacketFailures] forKey:@"ifPacketFailures"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_101;
  }
LABEL_100:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ifRxBytes] forKey:@"ifRxBytes"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_102;
  }
LABEL_101:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ifTxBytes] forKey:@"ifTxBytes"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_103;
  }
LABEL_102:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_appRxBytes] forKey:@"appRxBytes"];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_103:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_appTxBytes] forKey:@"appTxBytes"];
  if ((*(void *)&self->_has & 0x10000000000) != 0) {
LABEL_17:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_periodInMinutes] forKey:@"periodInMinutes"];
LABEL_18:
  if ([(NSMutableArray *)self->_states count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_states, "count")];
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    states = self->_states;
    uint64_t v7 = [(NSMutableArray *)states countByEnumeratingWithState:&v47 objects:v54 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v48;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v48 != v9) {
            objc_enumerationMutation(states);
          }
          [v5 addObject:[(*(id *)(*((void *)&v47 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)states countByEnumeratingWithState:&v47 objects:v54 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"states"];
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if (*(unsigned char *)&v11)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_noServiceIdleTime] forKey:@"noServiceIdleTime"];
    $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
    if ((*(_WORD *)&v11 & 0x400) == 0)
    {
LABEL_29:
      if ((*(_WORD *)&v11 & 0x200) == 0) {
        goto LABEL_30;
      }
      goto LABEL_107;
    }
  }
  else if ((*(_WORD *)&v11 & 0x400) == 0)
  {
    goto LABEL_29;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_browseAddTotalCount] forKey:@"browseAddTotalCount"];
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x200) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v11 & 0x1000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_browseAddFilteredCount] forKey:@"browseAddFilteredCount"];
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x1000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v11 & 0x800) == 0) {
      goto LABEL_32;
    }
    goto LABEL_109;
  }
LABEL_108:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_browseDeleteTotalCount] forKey:@"browseDeleteTotalCount"];
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if ((*(_WORD *)&v11 & 0x800) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v11 & 0x10) == 0) {
      goto LABEL_33;
    }
    goto LABEL_110;
  }
LABEL_109:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_browseDeleteFilteredCount] forKey:@"browseDeleteFilteredCount"];
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x10) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v11 & 8) == 0) {
      goto LABEL_34;
    }
    goto LABEL_111;
  }
LABEL_110:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_advertiseAddTotalCount] forKey:@"advertiseAddTotalCount"];
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 8) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v11 & 0x40) == 0) {
      goto LABEL_35;
    }
    goto LABEL_112;
  }
LABEL_111:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_advertiseAddFilteredCount] forKey:@"advertiseAddFilteredCount"];
  $A7F8C9E9D45357ACF4091D1997306C1B v11 = self->_has;
  if ((*(unsigned char *)&v11 & 0x40) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v11 & 0x20) == 0) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
LABEL_112:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_advertiseDeleteTotalCount] forKey:@"advertiseDeleteTotalCount"];
  if ((*(void *)&self->_has & 0x20) != 0) {
LABEL_36:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_advertiseDeleteFilteredCount] forKey:@"advertiseDeleteFilteredCount"];
LABEL_37:
  if ([(NSMutableArray *)self->_services count])
  {
    v12 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_services, "count")];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    services = self->_services;
    uint64_t v14 = [(NSMutableArray *)services countByEnumeratingWithState:&v43 objects:v53 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v15; ++j)
        {
          if (*(void *)v44 != v16) {
            objc_enumerationMutation(services);
          }
          [v12 addObject:[*(id *)(*((void *)&v43 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v15 = [(NSMutableArray *)services countByEnumeratingWithState:&v43 objects:v53 count:16];
      }
      while (v15);
    }
    [v3 setObject:v12 forKey:@"services"];
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x100000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersSameInfra] forKey:@"cachedPeersSameInfra"];
    $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x4000) == 0)
    {
LABEL_48:
      if ((*(_DWORD *)&v18 & 0x1000000) == 0) {
        goto LABEL_49;
      }
      goto LABEL_116;
    }
  }
  else if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
    goto LABEL_48;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersDifferentInfra] forKey:@"cachedPeersDifferentInfra"];
  $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x1000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v18 & 0x800000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_117;
  }
LABEL_116:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspCSAReceivedFromPeer] forKey:@"dfspCSAReceivedFromPeer"];
  $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x800000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v18 & 0x4000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_118;
  }
LABEL_117:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspCSAReceivedFromAP] forKey:@"dfspCSAReceivedFromAP"];
  $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v18 & 0x2000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_119;
  }
LABEL_118:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspSuspect] forKey:@"dfspSuspect"];
  $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v18 & 0x200000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_120;
  }
LABEL_119:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspResume] forKey:@"dfspResume"];
  $A7F8C9E9D45357ACF4091D1997306C1B v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x200000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v18 & 0x400000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_54;
  }
LABEL_120:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspAirplayConnected] forKey:@"dfspAirplayConnected"];
  if ((*(void *)&self->_has & 0x400000) != 0) {
LABEL_54:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dfspAirplayFailed] forKey:@"dfspAirplayFailed"];
LABEL_55:
  if ([(NSMutableArray *)self->_hopCountHistograms count])
  {
    v19 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_hopCountHistograms, "count")];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    hopCountHistograms = self->_hopCountHistograms;
    uint64_t v21 = [(NSMutableArray *)hopCountHistograms countByEnumeratingWithState:&v39 objects:v52 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v40;
      do
      {
        for (uint64_t k = 0; k != v22; ++k)
        {
          if (*(void *)v40 != v23) {
            objc_enumerationMutation(hopCountHistograms);
          }
          [v19 addObject:[*(id *)(*((void *)&v39 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v22 = [(NSMutableArray *)hopCountHistograms countByEnumeratingWithState:&v39 objects:v52 count:16];
      }
      while (v22);
    }
    [v3 setObject:v19 forKey:@"hopCountHistogram"];
  }
  if ([(NSMutableArray *)self->_parentRssiHistograms count])
  {
    v25 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_parentRssiHistograms, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    parentRssiHistograms = self->_parentRssiHistograms;
    uint64_t v27 = [(NSMutableArray *)parentRssiHistograms countByEnumeratingWithState:&v35 objects:v51 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v36;
      do
      {
        for (uint64_t m = 0; m != v28; ++m)
        {
          if (*(void *)v36 != v29) {
            objc_enumerationMutation(parentRssiHistograms);
          }
          [v25 addObject:[*(id *)(*((void *)&v35 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v28 = [(NSMutableArray *)parentRssiHistograms countByEnumeratingWithState:&v35 objects:v51 count:16];
      }
      while (v28);
    }
    [v3 setObject:v25 forKey:@"parentRssiHistogram"];
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v31 = self->_has;
  if ((*(unsigned char *)&v31 & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_syncChangesCount] forKey:@"syncChangesCount"];
    $A7F8C9E9D45357ACF4091D1997306C1B v31 = self->_has;
    if ((*(_DWORD *)&v31 & 0x80000000) == 0)
    {
LABEL_75:
      if ((*(void *)&v31 & 0x100000000) == 0) {
        goto LABEL_76;
      }
      goto LABEL_124;
    }
  }
  else if ((*(_DWORD *)&v31 & 0x80000000) == 0)
  {
    goto LABEL_75;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numAirplaySessions] forKey:@"numAirplaySessions"];
  $A7F8C9E9D45357ACF4091D1997306C1B v31 = self->_has;
  if ((*(void *)&v31 & 0x100000000) == 0)
  {
LABEL_76:
    if ((*(void *)&v31 & 0x200000000) == 0) {
      goto LABEL_77;
    }
    goto LABEL_125;
  }
LABEL_124:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numDynSdbAirplayAllowed] forKey:@"numDynSdbAirplayAllowed"];
  $A7F8C9E9D45357ACF4091D1997306C1B v31 = self->_has;
  if ((*(void *)&v31 & 0x200000000) == 0)
  {
LABEL_77:
    if ((*(void *)&v31 & 0x400000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_126;
  }
LABEL_125:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numDynSdbEntrySuccess] forKey:@"numDynSdbEntrySuccess"];
  $A7F8C9E9D45357ACF4091D1997306C1B v31 = self->_has;
  if ((*(void *)&v31 & 0x400000000) == 0)
  {
LABEL_78:
    if ((*(void *)&v31 & 0x800000000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_79;
  }
LABEL_126:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numDynSdbExitDueToRate] forKey:@"numDynSdbExitDueToRate"];
  if ((*(void *)&self->_has & 0x800000000) != 0) {
LABEL_79:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numDynSdbReEntrySuccess] forKey:@"numDynSdbReEntrySuccess"];
LABEL_80:
  d2dMigrationStats = self->_d2dMigrationStats;
  if (d2dMigrationStats) {
    [v3 setObject:-[AWDWifiAwdlD2dMigrationStats dictionaryRepresentation](d2dMigrationStats, "dictionaryRepresentation") forKey:@"d2dMigrationStats"];
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v33 = self->_has;
  if ((*(void *)&v33 & 0x80000000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfInfraChannelFlags] forKey:@"selfInfraChannelFlags"];
    $A7F8C9E9D45357ACF4091D1997306C1B v33 = self->_has;
    if ((*(void *)&v33 & 0x8000000000) == 0)
    {
LABEL_84:
      if ((*(_DWORD *)&v33 & 0x80000) == 0) {
        goto LABEL_85;
      }
      goto LABEL_130;
    }
  }
  else if ((*(void *)&v33 & 0x8000000000) == 0)
  {
    goto LABEL_84;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerInfraChannelFlags] forKey:@"peerInfraChannelFlags"];
  $A7F8C9E9D45357ACF4091D1997306C1B v33 = self->_has;
  if ((*(_DWORD *)&v33 & 0x80000) == 0)
  {
LABEL_85:
    if ((*(void *)&v33 & 0x20000000000) == 0) {
      goto LABEL_86;
    }
LABEL_131:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfCapOther] forKey:@"selfCapOther"];
    if ((*(void *)&self->_has & 0x2000) == 0) {
      return v3;
    }
    goto LABEL_87;
  }
LABEL_130:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersOnOther] forKey:@"cachedPeersOnOther"];
  $A7F8C9E9D45357ACF4091D1997306C1B v33 = self->_has;
  if ((*(void *)&v33 & 0x20000000000) != 0) {
    goto LABEL_131;
  }
LABEL_86:
  if ((*(_WORD *)&v33 & 0x2000) != 0) {
LABEL_87:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cachedPeersCapOther] forKey:@"cachedPeersCapOther"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAwdlUsageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    if ((*(void *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x4000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_83;
    }
  }
  else if ((*(void *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x10000000000) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  states = self->_states;
  uint64_t v6 = [(NSMutableArray *)states countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v42 != v8) {
          objc_enumerationMutation(states);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)states countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v7);
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if (*(unsigned char *)&v10)
  {
    PBDataWriterWriteUint64Field();
    $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v10 & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_99;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v10 & 0x1000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x1000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v10 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x800) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v10 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x10) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v10 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if ((*(unsigned char *)&v10 & 8) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v10 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v10 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x20) != 0) {
LABEL_34:
  }
    PBDataWriterWriteUint32Field();
LABEL_35:
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  services = self->_services;
  uint64_t v12 = [(NSMutableArray *)services countByEnumeratingWithState:&v37 objects:v47 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v38;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v38 != v14) {
          objc_enumerationMutation(services);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v13 = [(NSMutableArray *)services countByEnumeratingWithState:&v37 objects:v47 count:16];
    }
    while (v13);
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x100000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
    if ((*(_WORD *)&v16 & 0x4000) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v16 & 0x1000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_108;
    }
  }
  else if ((*(_WORD *)&v16 & 0x4000) == 0)
  {
    goto LABEL_44;
  }
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x1000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v16 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v16 & 0x4000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x4000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v16 & 0x2000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x2000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v16 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v16 = self->_has;
  if ((*(_DWORD *)&v16 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v16 & 0x400000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x400000) != 0) {
LABEL_50:
  }
    PBDataWriterWriteUint32Field();
LABEL_51:
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  hopCountHistograms = self->_hopCountHistograms;
  uint64_t v18 = [(NSMutableArray *)hopCountHistograms countByEnumeratingWithState:&v33 objects:v46 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v34;
    do
    {
      for (uint64_t k = 0; k != v19; ++k)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(hopCountHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v19 = [(NSMutableArray *)hopCountHistograms countByEnumeratingWithState:&v33 objects:v46 count:16];
    }
    while (v19);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  parentRssiHistograms = self->_parentRssiHistograms;
  uint64_t v23 = [(NSMutableArray *)parentRssiHistograms countByEnumeratingWithState:&v29 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(parentRssiHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v24 = [(NSMutableArray *)parentRssiHistograms countByEnumeratingWithState:&v29 objects:v45 count:16];
    }
    while (v24);
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v27 = self->_has;
  if ((*(unsigned char *)&v27 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    $A7F8C9E9D45357ACF4091D1997306C1B v27 = self->_has;
    if ((*(_DWORD *)&v27 & 0x80000000) == 0)
    {
LABEL_67:
      if ((*(void *)&v27 & 0x100000000) == 0) {
        goto LABEL_68;
      }
      goto LABEL_116;
    }
  }
  else if ((*(_DWORD *)&v27 & 0x80000000) == 0)
  {
    goto LABEL_67;
  }
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v27 = self->_has;
  if ((*(void *)&v27 & 0x100000000) == 0)
  {
LABEL_68:
    if ((*(void *)&v27 & 0x200000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v27 = self->_has;
  if ((*(void *)&v27 & 0x200000000) == 0)
  {
LABEL_69:
    if ((*(void *)&v27 & 0x400000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v27 = self->_has;
  if ((*(void *)&v27 & 0x400000000) == 0)
  {
LABEL_70:
    if ((*(void *)&v27 & 0x800000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
LABEL_118:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x800000000) != 0) {
LABEL_71:
  }
    PBDataWriterWriteUint32Field();
LABEL_72:
  if (self->_d2dMigrationStats) {
    PBDataWriterWriteSubmessage();
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v28 = self->_has;
  if ((*(void *)&v28 & 0x80000000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $A7F8C9E9D45357ACF4091D1997306C1B v28 = self->_has;
    if ((*(void *)&v28 & 0x8000000000) == 0)
    {
LABEL_76:
      if ((*(_DWORD *)&v28 & 0x80000) == 0) {
        goto LABEL_77;
      }
      goto LABEL_122;
    }
  }
  else if ((*(void *)&v28 & 0x8000000000) == 0)
  {
    goto LABEL_76;
  }
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v28 = self->_has;
  if ((*(_DWORD *)&v28 & 0x80000) == 0)
  {
LABEL_77:
    if ((*(void *)&v28 & 0x20000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint32Field();
  $A7F8C9E9D45357ACF4091D1997306C1B v28 = self->_has;
  if ((*(void *)&v28 & 0x20000000000) == 0)
  {
LABEL_78:
    if ((*(_WORD *)&v28 & 0x2000) == 0) {
      return;
    }
    goto LABEL_79;
  }
LABEL_123:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x2000) == 0) {
    return;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((void *)a3 + 30) |= 4uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    if ((*(void *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x4000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_71;
    }
  }
  else if ((*(void *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 54) = self->_selfInfraChannel;
  *((void *)a3 + 30) |= 0x40000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 50) = self->_peerInfraChannel;
  *((void *)a3 + 30) |= 0x4000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 47) = self->_numOfPeers;
  *((void *)a3 + 30) |= 0x2000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 46) = self->_numOfCachedPeers;
  *((void *)a3 + 30) |= 0x1000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 21) = self->_cachedPeersOn24G;
  *((void *)a3 + 30) |= 0x10000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 22) = self->_cachedPeersOn5G;
  *((void *)a3 + 30) |= 0x20000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 23) = self->_cachedPeersOnDFS;
  *((void *)a3 + 30) |= 0x40000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 20) = self->_cachedPeersNotAssociated;
  *((void *)a3 + 30) |= 0x8000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 34) = self->_flags;
  *((void *)a3 + 30) |= 0x8000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 38) = self->_ifPacketFailures;
  *((void *)a3 + 30) |= 0x10000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 39) = self->_ifRxBytes;
  *((void *)a3 + 30) |= 0x20000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)a3 + 40) = self->_ifTxBytes;
  *((void *)a3 + 30) |= 0x40000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
LABEL_83:
    *((_DWORD *)a3 + 13) = self->_appTxBytes;
    *((void *)a3 + 30) |= 0x100uLL;
    if ((*(void *)&self->_has & 0x10000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_82:
  *((_DWORD *)a3 + 12) = self->_appRxBytes;
  *((void *)a3 + 30) |= 0x80uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x100) != 0) {
    goto LABEL_83;
  }
LABEL_16:
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 52) = self->_periodInMinutes;
    *((void *)a3 + 30) |= 0x10000000000uLL;
  }
LABEL_18:
  if ([(AWDWiFiMetricsManagerAwdlUsage *)self statesCount])
  {
    [a3 clearStates];
    unint64_t v6 = [(AWDWiFiMetricsManagerAwdlUsage *)self statesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addStates:-[AWDWiFiMetricsManagerAwdlUsage statesAtIndex:](self, "statesAtIndex:", i)];
    }
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if (*(unsigned char *)&v9)
  {
    *((void *)a3 + 1) = self->_noServiceIdleTime;
    *((void *)a3 + 30) |= 1uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_24:
      if ((*(_WORD *)&v9 & 0x200) == 0) {
        goto LABEL_25;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_24;
  }
  *((_DWORD *)a3 + 15) = self->_browseAddTotalCount;
  *((void *)a3 + 30) |= 0x400uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v9 & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 14) = self->_browseAddFilteredCount;
  *((void *)a3 + 30) |= 0x200uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x1000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v9 & 0x800) == 0) {
      goto LABEL_27;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 17) = self->_browseDeleteTotalCount;
  *((void *)a3 + 30) |= 0x1000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x800) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v9 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 16) = self->_browseDeleteFilteredCount;
  *((void *)a3 + 30) |= 0x800uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v9 & 8) == 0) {
      goto LABEL_29;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)a3 + 9) = self->_advertiseAddTotalCount;
  *((void *)a3 + 30) |= 0x10uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v9 & 0x40) == 0) {
      goto LABEL_30;
    }
LABEL_92:
    *((_DWORD *)a3 + 11) = self->_advertiseDeleteTotalCount;
    *((void *)a3 + 30) |= 0x40uLL;
    if ((*(void *)&self->_has & 0x20) == 0) {
      goto LABEL_32;
    }
    goto LABEL_31;
  }
LABEL_91:
  *((_DWORD *)a3 + 8) = self->_advertiseAddFilteredCount;
  *((void *)a3 + 30) |= 8uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) != 0) {
    goto LABEL_92;
  }
LABEL_30:
  if ((*(unsigned char *)&v9 & 0x20) != 0)
  {
LABEL_31:
    *((_DWORD *)a3 + 10) = self->_advertiseDeleteFilteredCount;
    *((void *)a3 + 30) |= 0x20uLL;
  }
LABEL_32:
  if ([(AWDWiFiMetricsManagerAwdlUsage *)self servicesCount])
  {
    [a3 clearServices];
    unint64_t v10 = [(AWDWiFiMetricsManagerAwdlUsage *)self servicesCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addServices:-[AWDWiFiMetricsManagerAwdlUsage servicesAtIndex:](self, "servicesAtIndex:", j)];
    }
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) != 0)
  {
    *((_DWORD *)a3 + 25) = self->_cachedPeersSameInfra;
    *((void *)a3 + 30) |= 0x100000uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
    if ((*(_WORD *)&v13 & 0x4000) == 0)
    {
LABEL_38:
      if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
        goto LABEL_39;
      }
      goto LABEL_96;
    }
  }
  else if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
    goto LABEL_38;
  }
  *((_DWORD *)a3 + 19) = self->_cachedPeersDifferentInfra;
  *((void *)a3 + 30) |= 0x4000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v13 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 31) = self->_dfspCSAReceivedFromPeer;
  *((void *)a3 + 30) |= 0x1000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v13 & 0x4000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 30) = self->_dfspCSAReceivedFromAP;
  *((void *)a3 + 30) |= 0x800000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 33) = self->_dfspSuspect;
  *((void *)a3 + 30) |= 0x4000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v13 & 0x200000) == 0) {
      goto LABEL_43;
    }
LABEL_100:
    *((_DWORD *)a3 + 28) = self->_dfspAirplayConnected;
    *((void *)a3 + 30) |= 0x200000uLL;
    if ((*(void *)&self->_has & 0x400000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
LABEL_99:
  *((_DWORD *)a3 + 32) = self->_dfspResume;
  *((void *)a3 + 30) |= 0x2000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) != 0) {
    goto LABEL_100;
  }
LABEL_43:
  if ((*(_DWORD *)&v13 & 0x400000) != 0)
  {
LABEL_44:
    *((_DWORD *)a3 + 29) = self->_dfspAirplayFailed;
    *((void *)a3 + 30) |= 0x400000uLL;
  }
LABEL_45:
  if ([(AWDWiFiMetricsManagerAwdlUsage *)self hopCountHistogramsCount])
  {
    [a3 clearHopCountHistograms];
    unint64_t v14 = [(AWDWiFiMetricsManagerAwdlUsage *)self hopCountHistogramsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t k = 0; k != v15; ++k)
        [a3 addHopCountHistogram:-[AWDWiFiMetricsManagerAwdlUsage hopCountHistogramAtIndex:](self, "hopCountHistogramAtIndex:", k)];
    }
  }
  if ([(AWDWiFiMetricsManagerAwdlUsage *)self parentRssiHistogramsCount])
  {
    [a3 clearParentRssiHistograms];
    unint64_t v17 = [(AWDWiFiMetricsManagerAwdlUsage *)self parentRssiHistogramsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t m = 0; m != v18; ++m)
        [a3 addParentRssiHistogram:-[AWDWiFiMetricsManagerAwdlUsage parentRssiHistogramAtIndex:](self, "parentRssiHistogramAtIndex:", m)];
    }
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v20 = self->_has;
  if ((*(unsigned char *)&v20 & 2) != 0)
  {
    *((void *)a3 + 2) = self->_syncChangesCount;
    *((void *)a3 + 30) |= 2uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v20 = self->_has;
    if ((*(_DWORD *)&v20 & 0x80000000) == 0)
    {
LABEL_55:
      if ((*(void *)&v20 & 0x100000000) == 0) {
        goto LABEL_56;
      }
      goto LABEL_104;
    }
  }
  else if ((*(_DWORD *)&v20 & 0x80000000) == 0)
  {
    goto LABEL_55;
  }
  *((_DWORD *)a3 + 41) = self->_numAirplaySessions;
  *((void *)a3 + 30) |= 0x80000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v20 = self->_has;
  if ((*(void *)&v20 & 0x100000000) == 0)
  {
LABEL_56:
    if ((*(void *)&v20 & 0x200000000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)a3 + 42) = self->_numDynSdbAirplayAllowed;
  *((void *)a3 + 30) |= 0x100000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v20 = self->_has;
  if ((*(void *)&v20 & 0x200000000) == 0)
  {
LABEL_57:
    if ((*(void *)&v20 & 0x400000000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 43) = self->_numDynSdbEntrySuccess;
  *((void *)a3 + 30) |= 0x200000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v20 = self->_has;
  if ((*(void *)&v20 & 0x400000000) == 0)
  {
LABEL_58:
    if ((*(void *)&v20 & 0x800000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_59;
  }
LABEL_106:
  *((_DWORD *)a3 + 44) = self->_numDynSdbExitDueToRate;
  *((void *)a3 + 30) |= 0x400000000uLL;
  if ((*(void *)&self->_has & 0x800000000) != 0)
  {
LABEL_59:
    *((_DWORD *)a3 + 45) = self->_numDynSdbReEntrySuccess;
    *((void *)a3 + 30) |= 0x800000000uLL;
  }
LABEL_60:
  if (self->_d2dMigrationStats) {
    [a3 setD2dMigrationStats:];
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(void *)&v21 & 0x80000000000) != 0)
  {
    *((_DWORD *)a3 + 55) = self->_selfInfraChannelFlags;
    *((void *)a3 + 30) |= 0x80000000000uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
    if ((*(void *)&v21 & 0x8000000000) == 0)
    {
LABEL_64:
      if ((*(_DWORD *)&v21 & 0x80000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_110;
    }
  }
  else if ((*(void *)&v21 & 0x8000000000) == 0)
  {
    goto LABEL_64;
  }
  *((_DWORD *)a3 + 51) = self->_peerInfraChannelFlags;
  *((void *)a3 + 30) |= 0x8000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x80000) == 0)
  {
LABEL_65:
    if ((*(void *)&v21 & 0x20000000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 24) = self->_cachedPeersOnOther;
  *((void *)a3 + 30) |= 0x80000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(void *)&v21 & 0x20000000000) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&v21 & 0x2000) == 0) {
      return;
    }
    goto LABEL_67;
  }
LABEL_111:
  *((_DWORD *)a3 + 53) = self->_selfCapOther;
  *((void *)a3 + 30) |= 0x20000000000uLL;
  if ((*(void *)&self->_has & 0x2000) == 0) {
    return;
  }
LABEL_67:
  *((_DWORD *)a3 + 18) = self->_cachedPeersCapOther;
  *((void *)a3 + 30) |= 0x2000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(void *)(v5 + 240) |= 4uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    if ((*(void *)&has & 0x40000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x4000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_81;
    }
  }
  else if ((*(void *)&has & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 216) = self->_selfInfraChannel;
  *(void *)(v5 + 240) |= 0x40000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x2000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v5 + 200) = self->_peerInfraChannel;
  *(void *)(v5 + 240) |= 0x4000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v5 + 188) = self->_numOfPeers;
  *(void *)(v5 + 240) |= 0x2000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v5 + 184) = self->_numOfCachedPeers;
  *(void *)(v5 + 240) |= 0x1000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v5 + 84) = self->_cachedPeersOn24G;
  *(void *)(v5 + 240) |= 0x10000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v5 + 88) = self->_cachedPeersOn5G;
  *(void *)(v5 + 240) |= 0x20000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v5 + 92) = self->_cachedPeersOnDFS;
  *(void *)(v5 + 240) |= 0x40000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v5 + 80) = self->_cachedPeersNotAssociated;
  *(void *)(v5 + 240) |= 0x8000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v5 + 136) = self->_flags;
  *(void *)(v5 + 240) |= 0x8000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(_DWORD *)(v5 + 152) = self->_ifPacketFailures;
  *(void *)(v5 + 240) |= 0x10000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v5 + 156) = self->_ifRxBytes;
  *(void *)(v5 + 240) |= 0x20000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v5 + 160) = self->_ifTxBytes;
  *(void *)(v5 + 240) |= 0x40000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(_DWORD *)(v5 + 48) = self->_appRxBytes;
  *(void *)(v5 + 240) |= 0x80uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_16:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_93:
  *(_DWORD *)(v5 + 52) = self->_appTxBytes;
  *(void *)(v5 + 240) |= 0x100uLL;
  if ((*(void *)&self->_has & 0x10000000000) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 208) = self->_periodInMinutes;
    *(void *)(v5 + 240) |= 0x10000000000uLL;
  }
LABEL_18:
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  states = self->_states;
  uint64_t v9 = [(NSMutableArray *)states countByEnumeratingWithState:&v49 objects:v56 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v50 != v11) {
          objc_enumerationMutation(states);
        }
        $A7F8C9E9D45357ACF4091D1997306C1B v13 = (void *)[*(id *)(*((void *)&v49 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addStates:v13];
      }
      uint64_t v10 = [(NSMutableArray *)states countByEnumeratingWithState:&v49 objects:v56 count:16];
    }
    while (v10);
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if (*(unsigned char *)&v14)
  {
    *(void *)(v6 + 8) = self->_noServiceIdleTime;
    *(void *)(v6 + 240) |= 1uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
    if ((*(_WORD *)&v14 & 0x400) == 0)
    {
LABEL_27:
      if ((*(_WORD *)&v14 & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v14 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  *(_DWORD *)(v6 + 60) = self->_browseAddTotalCount;
  *(void *)(v6 + 240) |= 0x400uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_WORD *)&v14 & 0x1000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v6 + 56) = self->_browseAddFilteredCount;
  *(void *)(v6 + 240) |= 0x200uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x1000) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v14 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v6 + 68) = self->_browseDeleteTotalCount;
  *(void *)(v6 + 240) |= 0x1000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if ((*(_WORD *)&v14 & 0x800) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v14 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v6 + 64) = self->_browseDeleteFilteredCount;
  *(void *)(v6 + 240) |= 0x800uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v14 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v6 + 36) = self->_advertiseAddTotalCount;
  *(void *)(v6 + 240) |= 0x10uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v14 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v6 + 32) = self->_advertiseAddFilteredCount;
  *(void *)(v6 + 240) |= 8uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v14 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_102:
  *(_DWORD *)(v6 + 44) = self->_advertiseDeleteTotalCount;
  *(void *)(v6 + 240) |= 0x40uLL;
  if ((*(void *)&self->_has & 0x20) != 0)
  {
LABEL_34:
    *(_DWORD *)(v6 + 40) = self->_advertiseDeleteFilteredCount;
    *(void *)(v6 + 240) |= 0x20uLL;
  }
LABEL_35:
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  services = self->_services;
  uint64_t v16 = [(NSMutableArray *)services countByEnumeratingWithState:&v45 objects:v55 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v46;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(services);
        }
        $A7F8C9E9D45357ACF4091D1997306C1B v20 = (void *)[*(id *)(*((void *)&v45 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addServices:v20];
      }
      uint64_t v17 = [(NSMutableArray *)services countByEnumeratingWithState:&v45 objects:v55 count:16];
    }
    while (v17);
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x100000) != 0)
  {
    *(_DWORD *)(v6 + 100) = self->_cachedPeersSameInfra;
    *(void *)(v6 + 240) |= 0x100000uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
    if ((*(_WORD *)&v21 & 0x4000) == 0)
    {
LABEL_44:
      if ((*(_DWORD *)&v21 & 0x1000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_106;
    }
  }
  else if ((*(_WORD *)&v21 & 0x4000) == 0)
  {
    goto LABEL_44;
  }
  *(_DWORD *)(v6 + 76) = self->_cachedPeersDifferentInfra;
  *(void *)(v6 + 240) |= 0x4000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x1000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v21 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_107;
  }
LABEL_106:
  *(_DWORD *)(v6 + 124) = self->_dfspCSAReceivedFromPeer;
  *(void *)(v6 + 240) |= 0x1000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x800000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v21 & 0x4000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_108;
  }
LABEL_107:
  *(_DWORD *)(v6 + 120) = self->_dfspCSAReceivedFromAP;
  *(void *)(v6 + 240) |= 0x800000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x4000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v21 & 0x2000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_109;
  }
LABEL_108:
  *(_DWORD *)(v6 + 132) = self->_dfspSuspect;
  *(void *)(v6 + 240) |= 0x4000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x2000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v21 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_110;
  }
LABEL_109:
  *(_DWORD *)(v6 + 128) = self->_dfspResume;
  *(void *)(v6 + 240) |= 0x2000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v21 = self->_has;
  if ((*(_DWORD *)&v21 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v21 & 0x400000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_110:
  *(_DWORD *)(v6 + 112) = self->_dfspAirplayConnected;
  *(void *)(v6 + 240) |= 0x200000uLL;
  if ((*(void *)&self->_has & 0x400000) != 0)
  {
LABEL_50:
    *(_DWORD *)(v6 + 116) = self->_dfspAirplayFailed;
    *(void *)(v6 + 240) |= 0x400000uLL;
  }
LABEL_51:
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  hopCountHistograms = self->_hopCountHistograms;
  uint64_t v23 = [(NSMutableArray *)hopCountHistograms countByEnumeratingWithState:&v41 objects:v54 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v42;
    do
    {
      for (uint64_t k = 0; k != v24; ++k)
      {
        if (*(void *)v42 != v25) {
          objc_enumerationMutation(hopCountHistograms);
        }
        $A7F8C9E9D45357ACF4091D1997306C1B v27 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * k) copyWithZone:a3];
        [(id)v6 addHopCountHistogram:v27];
      }
      uint64_t v24 = [(NSMutableArray *)hopCountHistograms countByEnumeratingWithState:&v41 objects:v54 count:16];
    }
    while (v24);
  }
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  parentRssiHistograms = self->_parentRssiHistograms;
  uint64_t v29 = [(NSMutableArray *)parentRssiHistograms countByEnumeratingWithState:&v37 objects:v53 count:16];
  if (v29)
  {
    uint64_t v30 = v29;
    uint64_t v31 = *(void *)v38;
    do
    {
      for (uint64_t m = 0; m != v30; ++m)
      {
        if (*(void *)v38 != v31) {
          objc_enumerationMutation(parentRssiHistograms);
        }
        long long v33 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * m) copyWithZone:a3];
        [(id)v6 addParentRssiHistogram:v33];
      }
      uint64_t v30 = [(NSMutableArray *)parentRssiHistograms countByEnumeratingWithState:&v37 objects:v53 count:16];
    }
    while (v30);
  }
  $A7F8C9E9D45357ACF4091D1997306C1B v34 = self->_has;
  if ((*(unsigned char *)&v34 & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_syncChangesCount;
    *(void *)(v6 + 240) |= 2uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v34 = self->_has;
    if ((*(_DWORD *)&v34 & 0x80000000) == 0)
    {
LABEL_67:
      if ((*(void *)&v34 & 0x100000000) == 0) {
        goto LABEL_68;
      }
      goto LABEL_114;
    }
  }
  else if ((*(_DWORD *)&v34 & 0x80000000) == 0)
  {
    goto LABEL_67;
  }
  *(_DWORD *)(v6 + 164) = self->_numAirplaySessions;
  *(void *)(v6 + 240) |= 0x80000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v34 = self->_has;
  if ((*(void *)&v34 & 0x100000000) == 0)
  {
LABEL_68:
    if ((*(void *)&v34 & 0x200000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_115;
  }
LABEL_114:
  *(_DWORD *)(v6 + 168) = self->_numDynSdbAirplayAllowed;
  *(void *)(v6 + 240) |= 0x100000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v34 = self->_has;
  if ((*(void *)&v34 & 0x200000000) == 0)
  {
LABEL_69:
    if ((*(void *)&v34 & 0x400000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_116;
  }
LABEL_115:
  *(_DWORD *)(v6 + 172) = self->_numDynSdbEntrySuccess;
  *(void *)(v6 + 240) |= 0x200000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v34 = self->_has;
  if ((*(void *)&v34 & 0x400000000) == 0)
  {
LABEL_70:
    if ((*(void *)&v34 & 0x800000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
LABEL_116:
  *(_DWORD *)(v6 + 176) = self->_numDynSdbExitDueToRate;
  *(void *)(v6 + 240) |= 0x400000000uLL;
  if ((*(void *)&self->_has & 0x800000000) != 0)
  {
LABEL_71:
    *(_DWORD *)(v6 + 180) = self->_numDynSdbReEntrySuccess;
    *(void *)(v6 + 240) |= 0x800000000uLL;
  }
LABEL_72:

  *(void *)(v6 + 104) = [(AWDWifiAwdlD2dMigrationStats *)self->_d2dMigrationStats copyWithZone:a3];
  $A7F8C9E9D45357ACF4091D1997306C1B v35 = self->_has;
  if ((*(void *)&v35 & 0x80000000000) != 0)
  {
    *(_DWORD *)(v6 + 220) = self->_selfInfraChannelFlags;
    *(void *)(v6 + 240) |= 0x80000000000uLL;
    $A7F8C9E9D45357ACF4091D1997306C1B v35 = self->_has;
    if ((*(void *)&v35 & 0x8000000000) == 0)
    {
LABEL_74:
      if ((*(_DWORD *)&v35 & 0x80000) == 0) {
        goto LABEL_75;
      }
      goto LABEL_120;
    }
  }
  else if ((*(void *)&v35 & 0x8000000000) == 0)
  {
    goto LABEL_74;
  }
  *(_DWORD *)(v6 + 204) = self->_peerInfraChannelFlags;
  *(void *)(v6 + 240) |= 0x8000000000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v35 = self->_has;
  if ((*(_DWORD *)&v35 & 0x80000) == 0)
  {
LABEL_75:
    if ((*(void *)&v35 & 0x20000000000) == 0) {
      goto LABEL_76;
    }
LABEL_121:
    *(_DWORD *)(v6 + 212) = self->_selfCapOther;
    *(void *)(v6 + 240) |= 0x20000000000uLL;
    if ((*(void *)&self->_has & 0x2000) == 0) {
      return (id)v6;
    }
    goto LABEL_77;
  }
LABEL_120:
  *(_DWORD *)(v6 + 96) = self->_cachedPeersOnOther;
  *(void *)(v6 + 240) |= 0x80000uLL;
  $A7F8C9E9D45357ACF4091D1997306C1B v35 = self->_has;
  if ((*(void *)&v35 & 0x20000000000) != 0) {
    goto LABEL_121;
  }
LABEL_76:
  if ((*(_WORD *)&v35 & 0x2000) != 0)
  {
LABEL_77:
    *(_DWORD *)(v6 + 72) = self->_cachedPeersCapOther;
    *(void *)(v6 + 240) |= 0x2000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    uint64_t v7 = *((void *)a3 + 30);
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 4) != 0)
    {
LABEL_234:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(void *)&has & 0x40000000000) != 0)
    {
      if ((v7 & 0x40000000000) == 0 || self->_selfInfraChannel != *((_DWORD *)a3 + 54)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x40000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(void *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_peerInfraChannel != *((_DWORD *)a3 + 50)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(void *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_numOfPeers != *((_DWORD *)a3 + 47)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(void *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_numOfCachedPeers != *((_DWORD *)a3 + 46)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_cachedPeersOn24G != *((_DWORD *)a3 + 21)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_cachedPeersOn5G != *((_DWORD *)a3 + 22)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_cachedPeersOnDFS != *((_DWORD *)a3 + 23)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_cachedPeersNotAssociated != *((_DWORD *)a3 + 20)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_flags != *((_DWORD *)a3 + 34)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_ifPacketFailures != *((_DWORD *)a3 + 38)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_ifRxBytes != *((_DWORD *)a3 + 39)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_ifTxBytes != *((_DWORD *)a3 + 40)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_appRxBytes != *((_DWORD *)a3 + 12)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_appTxBytes != *((_DWORD *)a3 + 13)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_234;
    }
    if ((*(void *)&has & 0x10000000000) != 0)
    {
      if ((v7 & 0x10000000000) == 0 || self->_periodInMinutes != *((_DWORD *)a3 + 52)) {
        goto LABEL_234;
      }
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      goto LABEL_234;
    }
    states = self->_states;
    if ((unint64_t)states | *((void *)a3 + 29))
    {
      int v5 = -[NSMutableArray isEqual:](states, "isEqual:");
      if (!v5) {
        return v5;
      }
      $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    }
    uint64_t v9 = *((void *)a3 + 30);
    if (*(unsigned char *)&has)
    {
      if ((v9 & 1) == 0 || self->_noServiceIdleTime != *((void *)a3 + 1)) {
        goto LABEL_234;
      }
    }
    else if (v9)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v9 & 0x400) == 0 || self->_browseAddTotalCount != *((_DWORD *)a3 + 15)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x400) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_browseAddFilteredCount != *((_DWORD *)a3 + 14)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x200) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v9 & 0x1000) == 0 || self->_browseDeleteTotalCount != *((_DWORD *)a3 + 17)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x1000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v9 & 0x800) == 0 || self->_browseDeleteFilteredCount != *((_DWORD *)a3 + 16)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x800) != 0)
    {
      goto LABEL_234;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v9 & 0x10) == 0 || self->_advertiseAddTotalCount != *((_DWORD *)a3 + 9)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x10) != 0)
    {
      goto LABEL_234;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v9 & 8) == 0 || self->_advertiseAddFilteredCount != *((_DWORD *)a3 + 8)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 8) != 0)
    {
      goto LABEL_234;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v9 & 0x40) == 0 || self->_advertiseDeleteTotalCount != *((_DWORD *)a3 + 11)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x40) != 0)
    {
      goto LABEL_234;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v9 & 0x20) == 0 || self->_advertiseDeleteFilteredCount != *((_DWORD *)a3 + 10)) {
        goto LABEL_234;
      }
    }
    else if ((v9 & 0x20) != 0)
    {
      goto LABEL_234;
    }
    services = self->_services;
    if ((unint64_t)services | *((void *)a3 + 28))
    {
      int v5 = -[NSMutableArray isEqual:](services, "isEqual:");
      if (!v5) {
        return v5;
      }
      $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
    }
    uint64_t v11 = *((void *)a3 + 30);
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v11 & 0x100000) == 0 || self->_cachedPeersSameInfra != *((_DWORD *)a3 + 25)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x100000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v11 & 0x4000) == 0 || self->_cachedPeersDifferentInfra != *((_DWORD *)a3 + 19)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x4000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v11 & 0x1000000) == 0 || self->_dfspCSAReceivedFromPeer != *((_DWORD *)a3 + 31)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x1000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v11 & 0x800000) == 0 || self->_dfspCSAReceivedFromAP != *((_DWORD *)a3 + 30)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x800000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v11 & 0x4000000) == 0 || self->_dfspSuspect != *((_DWORD *)a3 + 33)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x4000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v11 & 0x2000000) == 0 || self->_dfspResume != *((_DWORD *)a3 + 32)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x2000000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v11 & 0x200000) == 0 || self->_dfspAirplayConnected != *((_DWORD *)a3 + 28)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x200000) != 0)
    {
      goto LABEL_234;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v11 & 0x400000) == 0 || self->_dfspAirplayFailed != *((_DWORD *)a3 + 29)) {
        goto LABEL_234;
      }
    }
    else if ((v11 & 0x400000) != 0)
    {
      goto LABEL_234;
    }
    hopCountHistograms = self->_hopCountHistograms;
    if (!((unint64_t)hopCountHistograms | *((void *)a3 + 18))
      || (int v5 = -[NSMutableArray isEqual:](hopCountHistograms, "isEqual:")) != 0)
    {
      parentRssiHistograms = self->_parentRssiHistograms;
      if (!((unint64_t)parentRssiHistograms | *((void *)a3 + 24))
        || (int v5 = -[NSMutableArray isEqual:](parentRssiHistograms, "isEqual:")) != 0)
      {
        $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
        uint64_t v15 = *((void *)a3 + 30);
        if ((*(unsigned char *)&v14 & 2) != 0)
        {
          if ((v15 & 2) == 0 || self->_syncChangesCount != *((void *)a3 + 2)) {
            goto LABEL_234;
          }
        }
        else if ((v15 & 2) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_DWORD *)&v14 & 0x80000000) != 0)
        {
          if ((v15 & 0x80000000) == 0 || self->_numAirplaySessions != *((_DWORD *)a3 + 41)) {
            goto LABEL_234;
          }
        }
        else if ((v15 & 0x80000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(void *)&v14 & 0x100000000) != 0)
        {
          if ((v15 & 0x100000000) == 0 || self->_numDynSdbAirplayAllowed != *((_DWORD *)a3 + 42)) {
            goto LABEL_234;
          }
        }
        else if ((v15 & 0x100000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(void *)&v14 & 0x200000000) != 0)
        {
          if ((v15 & 0x200000000) == 0 || self->_numDynSdbEntrySuccess != *((_DWORD *)a3 + 43)) {
            goto LABEL_234;
          }
        }
        else if ((v15 & 0x200000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(void *)&v14 & 0x400000000) != 0)
        {
          if ((v15 & 0x400000000) == 0 || self->_numDynSdbExitDueToRate != *((_DWORD *)a3 + 44)) {
            goto LABEL_234;
          }
        }
        else if ((v15 & 0x400000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(void *)&v14 & 0x800000000) != 0)
        {
          if ((v15 & 0x800000000) == 0 || self->_numDynSdbReEntrySuccess != *((_DWORD *)a3 + 45)) {
            goto LABEL_234;
          }
        }
        else if ((v15 & 0x800000000) != 0)
        {
          goto LABEL_234;
        }
        d2dMigrationStats = self->_d2dMigrationStats;
        if ((unint64_t)d2dMigrationStats | *((void *)a3 + 13))
        {
          int v5 = -[AWDWifiAwdlD2dMigrationStats isEqual:](d2dMigrationStats, "isEqual:");
          if (!v5) {
            return v5;
          }
          $A7F8C9E9D45357ACF4091D1997306C1B v14 = self->_has;
        }
        uint64_t v17 = *((void *)a3 + 30);
        if ((*(void *)&v14 & 0x80000000000) != 0)
        {
          if ((v17 & 0x80000000000) == 0 || self->_selfInfraChannelFlags != *((_DWORD *)a3 + 55)) {
            goto LABEL_234;
          }
        }
        else if ((v17 & 0x80000000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(void *)&v14 & 0x8000000000) != 0)
        {
          if ((v17 & 0x8000000000) == 0 || self->_peerInfraChannelFlags != *((_DWORD *)a3 + 51)) {
            goto LABEL_234;
          }
        }
        else if ((v17 & 0x8000000000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(_DWORD *)&v14 & 0x80000) != 0)
        {
          if ((v17 & 0x80000) == 0 || self->_cachedPeersOnOther != *((_DWORD *)a3 + 24)) {
            goto LABEL_234;
          }
        }
        else if ((v17 & 0x80000) != 0)
        {
          goto LABEL_234;
        }
        if ((*(void *)&v14 & 0x20000000000) != 0)
        {
          if ((v17 & 0x20000000000) == 0 || self->_selfCapOther != *((_DWORD *)a3 + 53)) {
            goto LABEL_234;
          }
        }
        else if ((v17 & 0x20000000000) != 0)
        {
          goto LABEL_234;
        }
        LOBYTE(v5) = (*((void *)a3 + 30) & 0x2000) == 0;
        if ((*(_WORD *)&v14 & 0x2000) != 0)
        {
          if ((v17 & 0x2000) == 0 || self->_cachedPeersCapOther != *((_DWORD *)a3 + 18)) {
            goto LABEL_234;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $A7F8C9E9D45357ACF4091D1997306C1B has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    unint64_t v57 = 2654435761u * self->_timestamp;
    if ((*(void *)&has & 0x40000000000) != 0)
    {
LABEL_3:
      uint64_t v56 = 2654435761 * self->_selfInfraChannel;
      if ((*(void *)&has & 0x4000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v57 = 0;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v56 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_4:
    uint64_t v55 = 2654435761 * self->_peerInfraChannel;
    if ((*(void *)&has & 0x2000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v55 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_5:
    uint64_t v54 = 2654435761 * self->_numOfPeers;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v54 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_6:
    uint64_t v53 = 2654435761 * self->_numOfCachedPeers;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v53 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_7:
    uint64_t v52 = 2654435761 * self->_cachedPeersOn24G;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v52 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_8:
    uint64_t v51 = 2654435761 * self->_cachedPeersOn5G;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v51 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_9:
    uint64_t v50 = 2654435761 * self->_cachedPeersOnDFS;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v50 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_10:
    uint64_t v49 = 2654435761 * self->_cachedPeersNotAssociated;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v49 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_11:
    uint64_t v48 = 2654435761 * self->_flags;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v48 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_12:
    uint64_t v47 = 2654435761 * self->_ifPacketFailures;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_13:
    uint64_t v46 = 2654435761 * self->_ifRxBytes;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_14:
    uint64_t v45 = 2654435761 * self->_ifTxBytes;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v45 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_15:
    uint64_t v44 = 2654435761 * self->_appRxBytes;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    uint64_t v43 = 0;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v44 = 0;
  if ((*(_WORD *)&has & 0x100) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v43 = 2654435761 * self->_appTxBytes;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_17:
    uint64_t v42 = 2654435761 * self->_periodInMinutes;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v42 = 0;
LABEL_34:
  uint64_t v41 = [(NSMutableArray *)self->_states hash];
  $A7F8C9E9D45357ACF4091D1997306C1B v4 = self->_has;
  if (*(unsigned char *)&v4)
  {
    unint64_t v40 = 2654435761u * self->_noServiceIdleTime;
    if ((*(_WORD *)&v4 & 0x400) != 0)
    {
LABEL_36:
      uint64_t v39 = 2654435761 * self->_browseAddTotalCount;
      if ((*(_WORD *)&v4 & 0x200) != 0) {
        goto LABEL_37;
      }
      goto LABEL_46;
    }
  }
  else
  {
    unint64_t v40 = 0;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_36;
    }
  }
  uint64_t v39 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_37:
    uint64_t v38 = 2654435761 * self->_browseAddFilteredCount;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v38 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_38:
    uint64_t v37 = 2654435761 * self->_browseDeleteTotalCount;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_39;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v37 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_39:
    uint64_t v36 = 2654435761 * self->_browseDeleteFilteredCount;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_40;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v36 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_40:
    uint64_t v35 = 2654435761 * self->_advertiseAddTotalCount;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_41;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_41:
    uint64_t v34 = 2654435761 * self->_advertiseAddFilteredCount;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_42;
    }
LABEL_51:
    uint64_t v33 = 0;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_43;
    }
    goto LABEL_52;
  }
LABEL_50:
  uint64_t v34 = 0;
  if ((*(unsigned char *)&v4 & 0x40) == 0) {
    goto LABEL_51;
  }
LABEL_42:
  uint64_t v33 = 2654435761 * self->_advertiseDeleteTotalCount;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_43:
    uint64_t v32 = 2654435761 * self->_advertiseDeleteFilteredCount;
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v32 = 0;
LABEL_53:
  uint64_t v31 = [(NSMutableArray *)self->_services hash];
  $A7F8C9E9D45357ACF4091D1997306C1B v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) != 0)
  {
    uint64_t v30 = 2654435761 * self->_cachedPeersSameInfra;
    if ((*(_WORD *)&v5 & 0x4000) != 0)
    {
LABEL_55:
      uint64_t v29 = 2654435761 * self->_cachedPeersDifferentInfra;
      if ((*(_DWORD *)&v5 & 0x1000000) != 0) {
        goto LABEL_56;
      }
      goto LABEL_64;
    }
  }
  else
  {
    uint64_t v30 = 0;
    if ((*(_WORD *)&v5 & 0x4000) != 0) {
      goto LABEL_55;
    }
  }
  uint64_t v29 = 0;
  if ((*(_DWORD *)&v5 & 0x1000000) != 0)
  {
LABEL_56:
    uint64_t v28 = 2654435761 * self->_dfspCSAReceivedFromPeer;
    if ((*(_DWORD *)&v5 & 0x800000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v5 & 0x800000) != 0)
  {
LABEL_57:
    uint64_t v27 = 2654435761 * self->_dfspCSAReceivedFromAP;
    if ((*(_DWORD *)&v5 & 0x4000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_66;
  }
LABEL_65:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&v5 & 0x4000000) != 0)
  {
LABEL_58:
    uint64_t v26 = 2654435761 * self->_dfspSuspect;
    if ((*(_DWORD *)&v5 & 0x2000000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_67;
  }
LABEL_66:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v5 & 0x2000000) != 0)
  {
LABEL_59:
    uint64_t v25 = 2654435761 * self->_dfspResume;
    if ((*(_DWORD *)&v5 & 0x200000) != 0) {
      goto LABEL_60;
    }
LABEL_68:
    uint64_t v24 = 0;
    if ((*(_DWORD *)&v5 & 0x400000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_69;
  }
LABEL_67:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v5 & 0x200000) == 0) {
    goto LABEL_68;
  }
LABEL_60:
  uint64_t v24 = 2654435761 * self->_dfspAirplayConnected;
  if ((*(_DWORD *)&v5 & 0x400000) != 0)
  {
LABEL_61:
    uint64_t v23 = 2654435761 * self->_dfspAirplayFailed;
    goto LABEL_70;
  }
LABEL_69:
  uint64_t v23 = 0;
LABEL_70:
  uint64_t v22 = [(NSMutableArray *)self->_hopCountHistograms hash];
  uint64_t v6 = [(NSMutableArray *)self->_parentRssiHistograms hash];
  $A7F8C9E9D45357ACF4091D1997306C1B v7 = self->_has;
  if ((*(unsigned char *)&v7 & 2) != 0)
  {
    unint64_t v8 = 2654435761u * self->_syncChangesCount;
    if ((*(_DWORD *)&v7 & 0x80000000) != 0)
    {
LABEL_72:
      uint64_t v9 = 2654435761 * self->_numAirplaySessions;
      if ((*(void *)&v7 & 0x100000000) != 0) {
        goto LABEL_73;
      }
      goto LABEL_79;
    }
  }
  else
  {
    unint64_t v8 = 0;
    if ((*(_DWORD *)&v7 & 0x80000000) != 0) {
      goto LABEL_72;
    }
  }
  uint64_t v9 = 0;
  if ((*(void *)&v7 & 0x100000000) != 0)
  {
LABEL_73:
    uint64_t v10 = 2654435761 * self->_numDynSdbAirplayAllowed;
    if ((*(void *)&v7 & 0x200000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v10 = 0;
  if ((*(void *)&v7 & 0x200000000) != 0)
  {
LABEL_74:
    uint64_t v11 = 2654435761 * self->_numDynSdbEntrySuccess;
    if ((*(void *)&v7 & 0x400000000) != 0) {
      goto LABEL_75;
    }
LABEL_81:
    uint64_t v12 = 0;
    if ((*(void *)&v7 & 0x800000000) != 0) {
      goto LABEL_76;
    }
    goto LABEL_82;
  }
LABEL_80:
  uint64_t v11 = 0;
  if ((*(void *)&v7 & 0x400000000) == 0) {
    goto LABEL_81;
  }
LABEL_75:
  uint64_t v12 = 2654435761 * self->_numDynSdbExitDueToRate;
  if ((*(void *)&v7 & 0x800000000) != 0)
  {
LABEL_76:
    uint64_t v13 = 2654435761 * self->_numDynSdbReEntrySuccess;
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v13 = 0;
LABEL_83:
  unint64_t v14 = [(AWDWifiAwdlD2dMigrationStats *)self->_d2dMigrationStats hash];
  $A7F8C9E9D45357ACF4091D1997306C1B v15 = self->_has;
  if ((*(void *)&v15 & 0x80000000000) != 0)
  {
    uint64_t v16 = 2654435761 * self->_selfInfraChannelFlags;
    if ((*(void *)&v15 & 0x8000000000) != 0)
    {
LABEL_85:
      uint64_t v17 = 2654435761 * self->_peerInfraChannelFlags;
      if ((*(_DWORD *)&v15 & 0x80000) != 0) {
        goto LABEL_86;
      }
      goto LABEL_91;
    }
  }
  else
  {
    uint64_t v16 = 0;
    if ((*(void *)&v15 & 0x8000000000) != 0) {
      goto LABEL_85;
    }
  }
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v15 & 0x80000) != 0)
  {
LABEL_86:
    uint64_t v18 = 2654435761 * self->_cachedPeersOnOther;
    if ((*(void *)&v15 & 0x20000000000) != 0) {
      goto LABEL_87;
    }
LABEL_92:
    uint64_t v19 = 0;
    if ((*(_WORD *)&v15 & 0x2000) != 0) {
      goto LABEL_88;
    }
LABEL_93:
    uint64_t v20 = 0;
    return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v41 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_91:
  uint64_t v18 = 0;
  if ((*(void *)&v15 & 0x20000000000) == 0) {
    goto LABEL_92;
  }
LABEL_87:
  uint64_t v19 = 2654435761 * self->_selfCapOther;
  if ((*(_WORD *)&v15 & 0x2000) == 0) {
    goto LABEL_93;
  }
LABEL_88:
  uint64_t v20 = 2654435761 * self->_cachedPeersCapOther;
  return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v41 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v6 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v52 = *MEMORY[0x263EF8340];
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(void *)&self->_has |= 4uLL;
    uint64_t v5 = *((void *)a3 + 30);
    if ((v5 & 0x40000000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x4000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_77;
    }
  }
  else if ((v5 & 0x40000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_selfInfraChannel = *((_DWORD *)a3 + 54);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x4000000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_peerInfraChannel = *((_DWORD *)a3 + 50);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x2000000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_numOfPeers = *((_DWORD *)a3 + 47);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_numOfCachedPeers = *((_DWORD *)a3 + 46);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x10000) == 0)
  {
LABEL_7:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_cachedPeersOn24G = *((_DWORD *)a3 + 21);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x20000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_cachedPeersOn5G = *((_DWORD *)a3 + 22);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x40000) == 0)
  {
LABEL_9:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_cachedPeersOnDFS = *((_DWORD *)a3 + 23);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x8000) == 0)
  {
LABEL_10:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_cachedPeersNotAssociated = *((_DWORD *)a3 + 20);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_flags = *((_DWORD *)a3 + 34);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_ifPacketFailures = *((_DWORD *)a3 + 38);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_ifRxBytes = *((_DWORD *)a3 + 39);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_ifTxBytes = *((_DWORD *)a3 + 40);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x80) == 0)
  {
LABEL_15:
    if ((v5 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_appRxBytes = *((_DWORD *)a3 + 12);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v5 = *((void *)a3 + 30);
  if ((v5 & 0x100) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_89:
  self->_appTxBytes = *((_DWORD *)a3 + 13);
  *(void *)&self->_has |= 0x100uLL;
  if ((*((void *)a3 + 30) & 0x10000000000) != 0)
  {
LABEL_17:
    self->_periodInMinutes = *((_DWORD *)a3 + 52);
    *(void *)&self->_has |= 0x10000000000uLL;
  }
LABEL_18:
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 29);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v45 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDWiFiMetricsManagerAwdlUsage *)self addStates:*(void *)(*((void *)&v44 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v8);
  }
  uint64_t v11 = *((void *)a3 + 30);
  if (v11)
  {
    self->_noServiceIdleTime = *((void *)a3 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v11 = *((void *)a3 + 30);
    if ((v11 & 0x400) == 0)
    {
LABEL_27:
      if ((v11 & 0x200) == 0) {
        goto LABEL_28;
      }
      goto LABEL_93;
    }
  }
  else if ((v11 & 0x400) == 0)
  {
    goto LABEL_27;
  }
  self->_browseAddTotalCount = *((_DWORD *)a3 + 15);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v11 = *((void *)a3 + 30);
  if ((v11 & 0x200) == 0)
  {
LABEL_28:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_browseAddFilteredCount = *((_DWORD *)a3 + 14);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v11 = *((void *)a3 + 30);
  if ((v11 & 0x1000) == 0)
  {
LABEL_29:
    if ((v11 & 0x800) == 0) {
      goto LABEL_30;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_browseDeleteTotalCount = *((_DWORD *)a3 + 17);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v11 = *((void *)a3 + 30);
  if ((v11 & 0x800) == 0)
  {
LABEL_30:
    if ((v11 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_browseDeleteFilteredCount = *((_DWORD *)a3 + 16);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v11 = *((void *)a3 + 30);
  if ((v11 & 0x10) == 0)
  {
LABEL_31:
    if ((v11 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_advertiseAddTotalCount = *((_DWORD *)a3 + 9);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v11 = *((void *)a3 + 30);
  if ((v11 & 8) == 0)
  {
LABEL_32:
    if ((v11 & 0x40) == 0) {
      goto LABEL_33;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_advertiseAddFilteredCount = *((_DWORD *)a3 + 8);
  *(void *)&self->_has |= 8uLL;
  uint64_t v11 = *((void *)a3 + 30);
  if ((v11 & 0x40) == 0)
  {
LABEL_33:
    if ((v11 & 0x20) == 0) {
      goto LABEL_35;
    }
    goto LABEL_34;
  }
LABEL_98:
  self->_advertiseDeleteTotalCount = *((_DWORD *)a3 + 11);
  *(void *)&self->_has |= 0x40uLL;
  if ((*((void *)a3 + 30) & 0x20) != 0)
  {
LABEL_34:
    self->_advertiseDeleteFilteredCount = *((_DWORD *)a3 + 10);
    *(void *)&self->_has |= 0x20uLL;
  }
LABEL_35:
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v12 = (void *)*((void *)a3 + 28);
  uint64_t v13 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v41;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v15) {
          objc_enumerationMutation(v12);
        }
        [(AWDWiFiMetricsManagerAwdlUsage *)self addServices:*(void *)(*((void *)&v40 + 1) + 8 * j)];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }
  uint64_t v17 = *((void *)a3 + 30);
  if ((v17 & 0x100000) != 0)
  {
    self->_cachedPeersSameInfra = *((_DWORD *)a3 + 25);
    *(void *)&self->_has |= 0x100000uLL;
    uint64_t v17 = *((void *)a3 + 30);
    if ((v17 & 0x4000) == 0)
    {
LABEL_44:
      if ((v17 & 0x1000000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_102;
    }
  }
  else if ((v17 & 0x4000) == 0)
  {
    goto LABEL_44;
  }
  self->_cachedPeersDifferentInfra = *((_DWORD *)a3 + 19);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v17 = *((void *)a3 + 30);
  if ((v17 & 0x1000000) == 0)
  {
LABEL_45:
    if ((v17 & 0x800000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_dfspCSAReceivedFromPeer = *((_DWORD *)a3 + 31);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v17 = *((void *)a3 + 30);
  if ((v17 & 0x800000) == 0)
  {
LABEL_46:
    if ((v17 & 0x4000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_dfspCSAReceivedFromAP = *((_DWORD *)a3 + 30);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v17 = *((void *)a3 + 30);
  if ((v17 & 0x4000000) == 0)
  {
LABEL_47:
    if ((v17 & 0x2000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_dfspSuspect = *((_DWORD *)a3 + 33);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v17 = *((void *)a3 + 30);
  if ((v17 & 0x2000000) == 0)
  {
LABEL_48:
    if ((v17 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_dfspResume = *((_DWORD *)a3 + 32);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v17 = *((void *)a3 + 30);
  if ((v17 & 0x200000) == 0)
  {
LABEL_49:
    if ((v17 & 0x400000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_50;
  }
LABEL_106:
  self->_dfspAirplayConnected = *((_DWORD *)a3 + 28);
  *(void *)&self->_has |= 0x200000uLL;
  if ((*((void *)a3 + 30) & 0x400000) != 0)
  {
LABEL_50:
    self->_dfspAirplayFailed = *((_DWORD *)a3 + 29);
    *(void *)&self->_has |= 0x400000uLL;
  }
LABEL_51:
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v18 = (void *)*((void *)a3 + 18);
  uint64_t v19 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      for (uint64_t k = 0; k != v20; ++k)
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        [(AWDWiFiMetricsManagerAwdlUsage *)self addHopCountHistogram:*(void *)(*((void *)&v36 + 1) + 8 * k)];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v36 objects:v49 count:16];
    }
    while (v20);
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v23 = (void *)*((void *)a3 + 24);
  uint64_t v24 = [v23 countByEnumeratingWithState:&v32 objects:v48 count:16];
  if (v24)
  {
    uint64_t v25 = v24;
    uint64_t v26 = *(void *)v33;
    do
    {
      for (uint64_t m = 0; m != v25; ++m)
      {
        if (*(void *)v33 != v26) {
          objc_enumerationMutation(v23);
        }
        [(AWDWiFiMetricsManagerAwdlUsage *)self addParentRssiHistogram:*(void *)(*((void *)&v32 + 1) + 8 * m)];
      }
      uint64_t v25 = [v23 countByEnumeratingWithState:&v32 objects:v48 count:16];
    }
    while (v25);
  }
  uint64_t v28 = *((void *)a3 + 30);
  if ((v28 & 2) != 0)
  {
    self->_syncChangesCount = *((void *)a3 + 2);
    *(void *)&self->_has |= 2uLL;
    uint64_t v28 = *((void *)a3 + 30);
    if ((v28 & 0x80000000) == 0)
    {
LABEL_67:
      if ((v28 & 0x100000000) == 0) {
        goto LABEL_68;
      }
      goto LABEL_110;
    }
  }
  else if ((v28 & 0x80000000) == 0)
  {
    goto LABEL_67;
  }
  self->_numAirplaySessions = *((_DWORD *)a3 + 41);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v28 = *((void *)a3 + 30);
  if ((v28 & 0x100000000) == 0)
  {
LABEL_68:
    if ((v28 & 0x200000000) == 0) {
      goto LABEL_69;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_numDynSdbAirplayAllowed = *((_DWORD *)a3 + 42);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v28 = *((void *)a3 + 30);
  if ((v28 & 0x200000000) == 0)
  {
LABEL_69:
    if ((v28 & 0x400000000) == 0) {
      goto LABEL_70;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_numDynSdbEntrySuccess = *((_DWORD *)a3 + 43);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v28 = *((void *)a3 + 30);
  if ((v28 & 0x400000000) == 0)
  {
LABEL_70:
    if ((v28 & 0x800000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_71;
  }
LABEL_112:
  self->_numDynSdbExitDueToRate = *((_DWORD *)a3 + 44);
  *(void *)&self->_has |= 0x400000000uLL;
  if ((*((void *)a3 + 30) & 0x800000000) != 0)
  {
LABEL_71:
    self->_numDynSdbReEntrySuccess = *((_DWORD *)a3 + 45);
    *(void *)&self->_has |= 0x800000000uLL;
  }
LABEL_72:
  d2dMigrationStats = self->_d2dMigrationStats;
  uint64_t v30 = *((void *)a3 + 13);
  if (d2dMigrationStats)
  {
    if (v30) {
      -[AWDWifiAwdlD2dMigrationStats mergeFrom:](d2dMigrationStats, "mergeFrom:");
    }
  }
  else if (v30)
  {
    -[AWDWiFiMetricsManagerAwdlUsage setD2dMigrationStats:](self, "setD2dMigrationStats:");
  }
  uint64_t v31 = *((void *)a3 + 30);
  if ((v31 & 0x80000000000) != 0)
  {
    self->_selfInfraChannelFlags = *((_DWORD *)a3 + 55);
    *(void *)&self->_has |= 0x80000000000uLL;
    uint64_t v31 = *((void *)a3 + 30);
    if ((v31 & 0x8000000000) == 0)
    {
LABEL_118:
      if ((v31 & 0x80000) == 0) {
        goto LABEL_119;
      }
      goto LABEL_125;
    }
  }
  else if ((v31 & 0x8000000000) == 0)
  {
    goto LABEL_118;
  }
  self->_peerInfraChannelFlags = *((_DWORD *)a3 + 51);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v31 = *((void *)a3 + 30);
  if ((v31 & 0x80000) == 0)
  {
LABEL_119:
    if ((v31 & 0x20000000000) == 0) {
      goto LABEL_120;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_cachedPeersOnOther = *((_DWORD *)a3 + 24);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v31 = *((void *)a3 + 30);
  if ((v31 & 0x20000000000) == 0)
  {
LABEL_120:
    if ((v31 & 0x2000) == 0) {
      return;
    }
    goto LABEL_121;
  }
LABEL_126:
  self->_selfCapOther = *((_DWORD *)a3 + 53);
  *(void *)&self->_has |= 0x20000000000uLL;
  if ((*((void *)a3 + 30) & 0x2000) == 0) {
    return;
  }
LABEL_121:
  self->_cachedPeersCapOther = *((_DWORD *)a3 + 18);
  *(void *)&self->_has |= 0x2000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)selfInfraChannel
{
  return self->_selfInfraChannel;
}

- (unsigned)peerInfraChannel
{
  return self->_peerInfraChannel;
}

- (unsigned)numOfPeers
{
  return self->_numOfPeers;
}

- (unsigned)numOfCachedPeers
{
  return self->_numOfCachedPeers;
}

- (unsigned)cachedPeersOn24G
{
  return self->_cachedPeersOn24G;
}

- (unsigned)cachedPeersOn5G
{
  return self->_cachedPeersOn5G;
}

- (unsigned)cachedPeersOnDFS
{
  return self->_cachedPeersOnDFS;
}

- (unsigned)cachedPeersNotAssociated
{
  return self->_cachedPeersNotAssociated;
}

- (unsigned)flags
{
  return self->_flags;
}

- (unsigned)ifPacketFailures
{
  return self->_ifPacketFailures;
}

- (unsigned)ifRxBytes
{
  return self->_ifRxBytes;
}

- (unsigned)ifTxBytes
{
  return self->_ifTxBytes;
}

- (unsigned)appRxBytes
{
  return self->_appRxBytes;
}

- (unsigned)appTxBytes
{
  return self->_appTxBytes;
}

- (unsigned)periodInMinutes
{
  return self->_periodInMinutes;
}

- (NSMutableArray)states
{
  return self->_states;
}

- (void)setStates:(id)a3
{
}

- (unint64_t)noServiceIdleTime
{
  return self->_noServiceIdleTime;
}

- (unsigned)browseAddTotalCount
{
  return self->_browseAddTotalCount;
}

- (unsigned)browseAddFilteredCount
{
  return self->_browseAddFilteredCount;
}

- (unsigned)browseDeleteTotalCount
{
  return self->_browseDeleteTotalCount;
}

- (unsigned)browseDeleteFilteredCount
{
  return self->_browseDeleteFilteredCount;
}

- (unsigned)advertiseAddTotalCount
{
  return self->_advertiseAddTotalCount;
}

- (unsigned)advertiseAddFilteredCount
{
  return self->_advertiseAddFilteredCount;
}

- (unsigned)advertiseDeleteTotalCount
{
  return self->_advertiseDeleteTotalCount;
}

- (unsigned)advertiseDeleteFilteredCount
{
  return self->_advertiseDeleteFilteredCount;
}

- (NSMutableArray)services
{
  return self->_services;
}

- (void)setServices:(id)a3
{
}

- (unsigned)cachedPeersSameInfra
{
  return self->_cachedPeersSameInfra;
}

- (unsigned)cachedPeersDifferentInfra
{
  return self->_cachedPeersDifferentInfra;
}

- (unsigned)dfspCSAReceivedFromPeer
{
  return self->_dfspCSAReceivedFromPeer;
}

- (unsigned)dfspCSAReceivedFromAP
{
  return self->_dfspCSAReceivedFromAP;
}

- (unsigned)dfspSuspect
{
  return self->_dfspSuspect;
}

- (unsigned)dfspResume
{
  return self->_dfspResume;
}

- (unsigned)dfspAirplayConnected
{
  return self->_dfspAirplayConnected;
}

- (unsigned)dfspAirplayFailed
{
  return self->_dfspAirplayFailed;
}

- (NSMutableArray)hopCountHistograms
{
  return self->_hopCountHistograms;
}

- (void)setHopCountHistograms:(id)a3
{
}

- (NSMutableArray)parentRssiHistograms
{
  return self->_parentRssiHistograms;
}

- (void)setParentRssiHistograms:(id)a3
{
}

- (unint64_t)syncChangesCount
{
  return self->_syncChangesCount;
}

- (unsigned)numAirplaySessions
{
  return self->_numAirplaySessions;
}

- (unsigned)numDynSdbAirplayAllowed
{
  return self->_numDynSdbAirplayAllowed;
}

- (unsigned)numDynSdbEntrySuccess
{
  return self->_numDynSdbEntrySuccess;
}

- (unsigned)numDynSdbExitDueToRate
{
  return self->_numDynSdbExitDueToRate;
}

- (unsigned)numDynSdbReEntrySuccess
{
  return self->_numDynSdbReEntrySuccess;
}

- (AWDWifiAwdlD2dMigrationStats)d2dMigrationStats
{
  return self->_d2dMigrationStats;
}

- (void)setD2dMigrationStats:(id)a3
{
}

- (unsigned)selfInfraChannelFlags
{
  return self->_selfInfraChannelFlags;
}

- (unsigned)peerInfraChannelFlags
{
  return self->_peerInfraChannelFlags;
}

- (unsigned)cachedPeersOnOther
{
  return self->_cachedPeersOnOther;
}

- (unsigned)selfCapOther
{
  return self->_selfCapOther;
}

- (unsigned)cachedPeersCapOther
{
  return self->_cachedPeersCapOther;
}

@end