@interface AWDWiFiP2PAirplayMetrics
+ (Class)avgCCAPeerInfraChannelType;
+ (Class)avgCCASelfInfraChannelType;
+ (Class)avgCCASocialChannelType;
+ (Class)peerRSSIType;
- (BOOL)csaDuringDfspMode;
- (BOOL)csaToDfsChannel;
- (BOOL)dfsProxyMode;
- (BOOL)hasAwdlVersion;
- (BOOL)hasClientModeDuration;
- (BOOL)hasCsaDuringDfspMode;
- (BOOL)hasCsaToDfsChannel;
- (BOOL)hasDfsProxyMode;
- (BOOL)hasForceRoamHasChannelsCnt;
- (BOOL)hasForceRoamHasNoChannel;
- (BOOL)hasInRetroMode;
- (BOOL)hasInfraDisconnectedCount;
- (BOOL)hasMissingAWStartEventCount;
- (BOOL)hasPeerInfraChannel;
- (BOOL)hasPeerInfraChannelFlags;
- (BOOL)hasPeerIsSDB;
- (BOOL)hasPsfEnabledCount;
- (BOOL)hasRoamOutOfOtherCount;
- (BOOL)hasRoamOutOfOtherFailure;
- (BOOL)hasRoamOutOfOtherSuccess;
- (BOOL)hasRoutablePeerCount;
- (BOOL)hasRxBytes;
- (BOOL)hasSelfInfraChannel;
- (BOOL)hasSelfInfraChannelFlags;
- (BOOL)hasSelfIsSDB;
- (BOOL)hasSenderPlatform;
- (BOOL)hasSequenceNumberNotUpdatedCount;
- (BOOL)hasServerModeDuration;
- (BOOL)hasSplitModeDuration;
- (BOOL)hasStartingRSSI;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalDuration;
- (BOOL)hasTotalPeerCount;
- (BOOL)hasTxBytes;
- (BOOL)inRetroMode;
- (BOOL)isEqual:(id)a3;
- (BOOL)peerIsSDB;
- (BOOL)readFrom:(id)a3;
- (BOOL)selfIsSDB;
- (NSMutableArray)avgCCAPeerInfraChannels;
- (NSMutableArray)avgCCASelfInfraChannels;
- (NSMutableArray)avgCCASocialChannels;
- (NSMutableArray)peerRSSIs;
- (id)avgCCAPeerInfraChannelAtIndex:(unint64_t)a3;
- (id)avgCCASelfInfraChannelAtIndex:(unint64_t)a3;
- (id)avgCCASocialChannelAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)peerRSSIAtIndex:(unint64_t)a3;
- (int)startingRSSI;
- (unint64_t)avgCCAPeerInfraChannelsCount;
- (unint64_t)avgCCASelfInfraChannelsCount;
- (unint64_t)avgCCASocialChannelsCount;
- (unint64_t)hash;
- (unint64_t)peerRSSIsCount;
- (unint64_t)rxBytes;
- (unint64_t)timestamp;
- (unint64_t)txBytes;
- (unsigned)awdlVersion;
- (unsigned)clientModeDuration;
- (unsigned)forceRoamHasChannelsCnt;
- (unsigned)forceRoamHasNoChannel;
- (unsigned)infraDisconnectedCount;
- (unsigned)missingAWStartEventCount;
- (unsigned)peerInfraChannel;
- (unsigned)peerInfraChannelFlags;
- (unsigned)psfEnabledCount;
- (unsigned)roamOutOfOtherCount;
- (unsigned)roamOutOfOtherFailure;
- (unsigned)roamOutOfOtherSuccess;
- (unsigned)routablePeerCount;
- (unsigned)selfInfraChannel;
- (unsigned)selfInfraChannelFlags;
- (unsigned)senderPlatform;
- (unsigned)sequenceNumberNotUpdatedCount;
- (unsigned)serverModeDuration;
- (unsigned)splitModeDuration;
- (unsigned)totalDuration;
- (unsigned)totalPeerCount;
- (void)addAvgCCAPeerInfraChannel:(id)a3;
- (void)addAvgCCASelfInfraChannel:(id)a3;
- (void)addAvgCCASocialChannel:(id)a3;
- (void)addPeerRSSI:(id)a3;
- (void)clearAvgCCAPeerInfraChannels;
- (void)clearAvgCCASelfInfraChannels;
- (void)clearAvgCCASocialChannels;
- (void)clearPeerRSSIs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAvgCCAPeerInfraChannels:(id)a3;
- (void)setAvgCCASelfInfraChannels:(id)a3;
- (void)setAvgCCASocialChannels:(id)a3;
- (void)setAwdlVersion:(unsigned int)a3;
- (void)setClientModeDuration:(unsigned int)a3;
- (void)setCsaDuringDfspMode:(BOOL)a3;
- (void)setCsaToDfsChannel:(BOOL)a3;
- (void)setDfsProxyMode:(BOOL)a3;
- (void)setForceRoamHasChannelsCnt:(unsigned int)a3;
- (void)setForceRoamHasNoChannel:(unsigned int)a3;
- (void)setHasAwdlVersion:(BOOL)a3;
- (void)setHasClientModeDuration:(BOOL)a3;
- (void)setHasCsaDuringDfspMode:(BOOL)a3;
- (void)setHasCsaToDfsChannel:(BOOL)a3;
- (void)setHasDfsProxyMode:(BOOL)a3;
- (void)setHasForceRoamHasChannelsCnt:(BOOL)a3;
- (void)setHasForceRoamHasNoChannel:(BOOL)a3;
- (void)setHasInRetroMode:(BOOL)a3;
- (void)setHasInfraDisconnectedCount:(BOOL)a3;
- (void)setHasMissingAWStartEventCount:(BOOL)a3;
- (void)setHasPeerInfraChannel:(BOOL)a3;
- (void)setHasPeerInfraChannelFlags:(BOOL)a3;
- (void)setHasPeerIsSDB:(BOOL)a3;
- (void)setHasPsfEnabledCount:(BOOL)a3;
- (void)setHasRoamOutOfOtherCount:(BOOL)a3;
- (void)setHasRoamOutOfOtherFailure:(BOOL)a3;
- (void)setHasRoamOutOfOtherSuccess:(BOOL)a3;
- (void)setHasRoutablePeerCount:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasSelfInfraChannel:(BOOL)a3;
- (void)setHasSelfInfraChannelFlags:(BOOL)a3;
- (void)setHasSelfIsSDB:(BOOL)a3;
- (void)setHasSenderPlatform:(BOOL)a3;
- (void)setHasSequenceNumberNotUpdatedCount:(BOOL)a3;
- (void)setHasServerModeDuration:(BOOL)a3;
- (void)setHasSplitModeDuration:(BOOL)a3;
- (void)setHasStartingRSSI:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalDuration:(BOOL)a3;
- (void)setHasTotalPeerCount:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setInRetroMode:(BOOL)a3;
- (void)setInfraDisconnectedCount:(unsigned int)a3;
- (void)setMissingAWStartEventCount:(unsigned int)a3;
- (void)setPeerInfraChannel:(unsigned int)a3;
- (void)setPeerInfraChannelFlags:(unsigned int)a3;
- (void)setPeerIsSDB:(BOOL)a3;
- (void)setPeerRSSIs:(id)a3;
- (void)setPsfEnabledCount:(unsigned int)a3;
- (void)setRoamOutOfOtherCount:(unsigned int)a3;
- (void)setRoamOutOfOtherFailure:(unsigned int)a3;
- (void)setRoamOutOfOtherSuccess:(unsigned int)a3;
- (void)setRoutablePeerCount:(unsigned int)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setSelfInfraChannel:(unsigned int)a3;
- (void)setSelfInfraChannelFlags:(unsigned int)a3;
- (void)setSelfIsSDB:(BOOL)a3;
- (void)setSenderPlatform:(unsigned int)a3;
- (void)setSequenceNumberNotUpdatedCount:(unsigned int)a3;
- (void)setServerModeDuration:(unsigned int)a3;
- (void)setSplitModeDuration:(unsigned int)a3;
- (void)setStartingRSSI:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalDuration:(unsigned int)a3;
- (void)setTotalPeerCount:(unsigned int)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiP2PAirplayMetrics

- (void)dealloc
{
  [(AWDWiFiP2PAirplayMetrics *)self setPeerRSSIs:0];
  [(AWDWiFiP2PAirplayMetrics *)self setAvgCCASocialChannels:0];
  [(AWDWiFiP2PAirplayMetrics *)self setAvgCCASelfInfraChannels:0];
  [(AWDWiFiP2PAirplayMetrics *)self setAvgCCAPeerInfraChannels:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiP2PAirplayMetrics;
  [(AWDWiFiP2PAirplayMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_totalDuration = a3;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTotalDuration
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setServerModeDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_serverModeDuration = a3;
}

- (void)setHasServerModeDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasServerModeDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setClientModeDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_clientModeDuration = a3;
}

- (void)setHasClientModeDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasClientModeDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSplitModeDuration:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_splitModeDuration = a3;
}

- (void)setHasSplitModeDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSplitModeDuration
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTxBytes
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasRxBytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setStartingRSSI:(int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_startingRSSI = a3;
}

- (void)setHasStartingRSSI:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasStartingRSSI
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setAwdlVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_awdlVersion = a3;
}

- (void)setHasAwdlVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAwdlVersion
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTotalPeerCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_totalPeerCount = a3;
}

- (void)setHasTotalPeerCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTotalPeerCount
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setRoutablePeerCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_routablePeerCount = a3;
}

- (void)setHasRoutablePeerCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRoutablePeerCount
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setInfraDisconnectedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_infraDisconnectedCount = a3;
}

- (void)setHasInfraDisconnectedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasInfraDisconnectedCount
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSequenceNumberNotUpdatedCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_sequenceNumberNotUpdatedCount = a3;
}

- (void)setHasSequenceNumberNotUpdatedCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasSequenceNumberNotUpdatedCount
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setMissingAWStartEventCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_missingAWStartEventCount = a3;
}

- (void)setHasMissingAWStartEventCount:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasMissingAWStartEventCount
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setPsfEnabledCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_psfEnabledCount = a3;
}

- (void)setHasPsfEnabledCount:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasPsfEnabledCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setSelfInfraChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_selfInfraChannel = a3;
}

- (void)setHasSelfInfraChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasSelfInfraChannel
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setPeerInfraChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_peerInfraChannel = a3;
}

- (void)setHasPeerInfraChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasPeerInfraChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setSenderPlatform:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_senderPlatform = a3;
}

- (void)setHasSenderPlatform:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasSenderPlatform
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCsaToDfsChannel:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_csaToDfsChannel = a3;
}

- (void)setHasCsaToDfsChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasCsaToDfsChannel
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setCsaDuringDfspMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_csaDuringDfspMode = a3;
}

- (void)setHasCsaDuringDfspMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasCsaDuringDfspMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setDfsProxyMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_dfsProxyMode = a3;
}

- (void)setHasDfsProxyMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasDfsProxyMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setSelfIsSDB:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_selfIsSDB = a3;
}

- (void)setHasSelfIsSDB:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasSelfIsSDB
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setPeerIsSDB:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_peerIsSDB = a3;
}

- (void)setHasPeerIsSDB:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasPeerIsSDB
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setInRetroMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_inRetroMode = a3;
}

- (void)setHasInRetroMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasInRetroMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)clearPeerRSSIs
{
}

- (void)addPeerRSSI:(id)a3
{
  peerRSSIs = self->_peerRSSIs;
  if (!peerRSSIs)
  {
    peerRSSIs = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_peerRSSIs = peerRSSIs;
  }

  [(NSMutableArray *)peerRSSIs addObject:a3];
}

- (unint64_t)peerRSSIsCount
{
  return [(NSMutableArray *)self->_peerRSSIs count];
}

- (id)peerRSSIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_peerRSSIs objectAtIndex:a3];
}

+ (Class)peerRSSIType
{
  return (Class)objc_opt_class();
}

- (void)clearAvgCCASocialChannels
{
}

- (void)addAvgCCASocialChannel:(id)a3
{
  avgCCASocialChannels = self->_avgCCASocialChannels;
  if (!avgCCASocialChannels)
  {
    avgCCASocialChannels = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_avgCCASocialChannels = avgCCASocialChannels;
  }

  [(NSMutableArray *)avgCCASocialChannels addObject:a3];
}

- (unint64_t)avgCCASocialChannelsCount
{
  return [(NSMutableArray *)self->_avgCCASocialChannels count];
}

- (id)avgCCASocialChannelAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_avgCCASocialChannels objectAtIndex:a3];
}

+ (Class)avgCCASocialChannelType
{
  return (Class)objc_opt_class();
}

- (void)clearAvgCCASelfInfraChannels
{
}

- (void)addAvgCCASelfInfraChannel:(id)a3
{
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  if (!avgCCASelfInfraChannels)
  {
    avgCCASelfInfraChannels = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_avgCCASelfInfraChannels = avgCCASelfInfraChannels;
  }

  [(NSMutableArray *)avgCCASelfInfraChannels addObject:a3];
}

- (unint64_t)avgCCASelfInfraChannelsCount
{
  return [(NSMutableArray *)self->_avgCCASelfInfraChannels count];
}

- (id)avgCCASelfInfraChannelAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_avgCCASelfInfraChannels objectAtIndex:a3];
}

+ (Class)avgCCASelfInfraChannelType
{
  return (Class)objc_opt_class();
}

- (void)clearAvgCCAPeerInfraChannels
{
}

- (void)addAvgCCAPeerInfraChannel:(id)a3
{
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  if (!avgCCAPeerInfraChannels)
  {
    avgCCAPeerInfraChannels = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_avgCCAPeerInfraChannels = avgCCAPeerInfraChannels;
  }

  [(NSMutableArray *)avgCCAPeerInfraChannels addObject:a3];
}

- (unint64_t)avgCCAPeerInfraChannelsCount
{
  return [(NSMutableArray *)self->_avgCCAPeerInfraChannels count];
}

- (id)avgCCAPeerInfraChannelAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_avgCCAPeerInfraChannels objectAtIndex:a3];
}

+ (Class)avgCCAPeerInfraChannelType
{
  return (Class)objc_opt_class();
}

- (void)setSelfInfraChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_selfInfraChannelFlags = a3;
}

- (void)setHasSelfInfraChannelFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasSelfInfraChannelFlags
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPeerInfraChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_peerInfraChannelFlags = a3;
}

- (void)setHasPeerInfraChannelFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasPeerInfraChannelFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRoamOutOfOtherCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_roamOutOfOtherCount = a3;
}

- (void)setHasRoamOutOfOtherCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRoamOutOfOtherCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRoamOutOfOtherSuccess:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_roamOutOfOtherSuccess = a3;
}

- (void)setHasRoamOutOfOtherSuccess:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRoamOutOfOtherSuccess
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRoamOutOfOtherFailure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_roamOutOfOtherFailure = a3;
}

- (void)setHasRoamOutOfOtherFailure:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRoamOutOfOtherFailure
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setForceRoamHasChannelsCnt:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_forceRoamHasChannelsCnt = a3;
}

- (void)setHasForceRoamHasChannelsCnt:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasForceRoamHasChannelsCnt
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setForceRoamHasNoChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_forceRoamHasNoChannel = a3;
}

- (void)setHasForceRoamHasNoChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($9AAF52838BB36F993592C58FF7F8D143)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasForceRoamHasNoChannel
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiP2PAirplayMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiP2PAirplayMetrics description](&v3, sel_description), -[AWDWiFiP2PAirplayMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalDuration] forKey:@"totalDuration"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_serverModeDuration] forKey:@"serverModeDuration"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_clientModeDuration] forKey:@"clientModeDuration"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_splitModeDuration] forKey:@"splitModeDuration"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytes] forKey:@"txBytes"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxBytes] forKey:@"rxBytes"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithInt:self->_startingRSSI] forKey:@"startingRSSI"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_awdlVersion] forKey:@"awdlVersion"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalPeerCount] forKey:@"totalPeerCount"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_routablePeerCount] forKey:@"routablePeerCount"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_infraDisconnectedCount] forKey:@"infraDisconnectedCount"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sequenceNumberNotUpdatedCount] forKey:@"sequenceNumberNotUpdatedCount"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_missingAWStartEventCount] forKey:@"missingAWStartEventCount"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_psfEnabledCount] forKey:@"psfEnabledCount"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfInfraChannel] forKey:@"selfInfraChannel"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_88;
  }
LABEL_87:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerInfraChannel] forKey:@"peerInfraChannel"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_89;
  }
LABEL_88:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_senderPlatform] forKey:@"senderPlatform"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_90;
  }
LABEL_89:
  [v3 setObject:[NSNumber numberWithBool:self->_csaToDfsChannel] forKey:@"csaToDfsChannel"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_91;
  }
LABEL_90:
  [v3 setObject:[NSNumber numberWithBool:self->_csaDuringDfspMode] forKey:@"csaDuringDfspMode"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setObject:[NSNumber numberWithBool:self->_dfsProxyMode] forKey:@"dfsProxyMode"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_93;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithBool:self->_selfIsSDB] forKey:@"selfIsSDB"];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_93:
  [v3 setObject:[NSNumber numberWithBool:self->_peerIsSDB] forKey:@"peerIsSDB"];
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
LABEL_25:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_inRetroMode] forKey:@"inRetroMode"];
LABEL_26:
  if ([(NSMutableArray *)self->_peerRSSIs count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_peerRSSIs, "count")];
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    peerRSSIs = self->_peerRSSIs;
    uint64_t v7 = [(NSMutableArray *)peerRSSIs countByEnumeratingWithState:&v43 objects:v50 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v44 != v9) {
            objc_enumerationMutation(peerRSSIs);
          }
          [v5 addObject:[*(id *)(*((void *)&v43 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)peerRSSIs countByEnumeratingWithState:&v43 objects:v50 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"peerRSSI"];
  }
  if ([(NSMutableArray *)self->_avgCCASocialChannels count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_avgCCASocialChannels, "count")];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    avgCCASocialChannels = self->_avgCCASocialChannels;
    uint64_t v13 = [(NSMutableArray *)avgCCASocialChannels countByEnumeratingWithState:&v39 objects:v49 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v40;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v40 != v15) {
            objc_enumerationMutation(avgCCASocialChannels);
          }
          [v11 addObject:[*(id *)(*((void *)&v39 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)avgCCASocialChannels countByEnumeratingWithState:&v39 objects:v49 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"avgCCASocialChannel"];
  }
  if ([(NSMutableArray *)self->_avgCCASelfInfraChannels count])
  {
    v17 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_avgCCASelfInfraChannels, "count")];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
    uint64_t v19 = [(NSMutableArray *)avgCCASelfInfraChannels countByEnumeratingWithState:&v35 objects:v48 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v36;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v36 != v21) {
            objc_enumerationMutation(avgCCASelfInfraChannels);
          }
          [v17 addObject:[*(id *)(*((void *)&v35 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v20 = [(NSMutableArray *)avgCCASelfInfraChannels countByEnumeratingWithState:&v35 objects:v48 count:16];
      }
      while (v20);
    }
    [v3 setObject:v17 forKey:@"avgCCASelfInfraChannel"];
  }
  if ([(NSMutableArray *)self->_avgCCAPeerInfraChannels count])
  {
    v23 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_avgCCAPeerInfraChannels, "count")];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
    uint64_t v25 = [(NSMutableArray *)avgCCAPeerInfraChannels countByEnumeratingWithState:&v31 objects:v47 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v32;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v32 != v27) {
            objc_enumerationMutation(avgCCAPeerInfraChannels);
          }
          [v23 addObject:[*(id *)(*((void *)&v31 + 1) + 8 * m) dictionaryRepresentation]];
        }
        uint64_t v26 = [(NSMutableArray *)avgCCAPeerInfraChannels countByEnumeratingWithState:&v31 objects:v47 count:16];
      }
      while (v26);
    }
    [v3 setObject:v23 forKey:@"avgCCAPeerInfraChannel"];
  }
  $9AAF52838BB36F993592C58FF7F8D143 v29 = self->_has;
  if ((*(_DWORD *)&v29 & 0x20000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfInfraChannelFlags] forKey:@"selfInfraChannelFlags"];
    $9AAF52838BB36F993592C58FF7F8D143 v29 = self->_has;
    if ((*(_WORD *)&v29 & 0x400) == 0)
    {
LABEL_64:
      if ((*(_WORD *)&v29 & 0x1000) == 0) {
        goto LABEL_65;
      }
      goto LABEL_97;
    }
  }
  else if ((*(_WORD *)&v29 & 0x400) == 0)
  {
    goto LABEL_64;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerInfraChannelFlags] forKey:@"peerInfraChannelFlags"];
  $9AAF52838BB36F993592C58FF7F8D143 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x1000) == 0)
  {
LABEL_65:
    if ((*(_WORD *)&v29 & 0x4000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamOutOfOtherCount] forKey:@"roamOutOfOtherCount"];
  $9AAF52838BB36F993592C58FF7F8D143 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x4000) == 0)
  {
LABEL_66:
    if ((*(_WORD *)&v29 & 0x2000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_99;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamOutOfOtherSuccess] forKey:@"roamOutOfOtherSuccess"];
  $9AAF52838BB36F993592C58FF7F8D143 v29 = self->_has;
  if ((*(_WORD *)&v29 & 0x2000) == 0)
  {
LABEL_67:
    if ((*(unsigned char *)&v29 & 0x20) == 0) {
      goto LABEL_68;
    }
LABEL_100:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_forceRoamHasChannelsCnt] forKey:@"forceRoamHasChannelsCnt"];
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      return v3;
    }
    goto LABEL_69;
  }
LABEL_99:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_roamOutOfOtherFailure] forKey:@"roamOutOfOtherFailure"];
  $9AAF52838BB36F993592C58FF7F8D143 v29 = self->_has;
  if ((*(unsigned char *)&v29 & 0x20) != 0) {
    goto LABEL_100;
  }
LABEL_68:
  if ((*(unsigned char *)&v29 & 0x40) != 0) {
LABEL_69:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_forceRoamHasNoChannel] forKey:@"forceRoamHasNoChannel"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiP2PAirplayMetricsReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteInt32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteBOOLField();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteBOOLField();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteBOOLField();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteBOOLField();
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_85:
  PBDataWriterWriteBOOLField();
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0) {
LABEL_25:
  }
    PBDataWriterWriteBOOLField();
LABEL_26:
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  peerRSSIs = self->_peerRSSIs;
  uint64_t v6 = [(NSMutableArray *)peerRSSIs countByEnumeratingWithState:&v38 objects:v45 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v39 != v8) {
          objc_enumerationMutation(peerRSSIs);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)peerRSSIs countByEnumeratingWithState:&v38 objects:v45 count:16];
    }
    while (v7);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  avgCCASocialChannels = self->_avgCCASocialChannels;
  uint64_t v11 = [(NSMutableArray *)avgCCASocialChannels countByEnumeratingWithState:&v34 objects:v44 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v35;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v35 != v13) {
          objc_enumerationMutation(avgCCASocialChannels);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)avgCCASocialChannels countByEnumeratingWithState:&v34 objects:v44 count:16];
    }
    while (v12);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  uint64_t v16 = [(NSMutableArray *)avgCCASelfInfraChannels countByEnumeratingWithState:&v30 objects:v43 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v31;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v31 != v18) {
          objc_enumerationMutation(avgCCASelfInfraChannels);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)avgCCASelfInfraChannels countByEnumeratingWithState:&v30 objects:v43 count:16];
    }
    while (v17);
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  uint64_t v21 = [(NSMutableArray *)avgCCAPeerInfraChannels countByEnumeratingWithState:&v26 objects:v42 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v27;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v27 != v23) {
          objc_enumerationMutation(avgCCAPeerInfraChannels);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)avgCCAPeerInfraChannels countByEnumeratingWithState:&v26 objects:v42 count:16];
    }
    while (v22);
  }
  $9AAF52838BB36F993592C58FF7F8D143 v25 = self->_has;
  if ((*(_DWORD *)&v25 & 0x20000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $9AAF52838BB36F993592C58FF7F8D143 v25 = self->_has;
    if ((*(_WORD *)&v25 & 0x400) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v25 & 0x1000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_89;
    }
  }
  else if ((*(_WORD *)&v25 & 0x400) == 0)
  {
    goto LABEL_56;
  }
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x1000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v25 & 0x4000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x4000) == 0)
  {
LABEL_58:
    if ((*(_WORD *)&v25 & 0x2000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 v25 = self->_has;
  if ((*(_WORD *)&v25 & 0x2000) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v25 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $9AAF52838BB36F993592C58FF7F8D143 v25 = self->_has;
  if ((*(unsigned char *)&v25 & 0x20) == 0)
  {
LABEL_60:
    if ((*(unsigned char *)&v25 & 0x40) == 0) {
      return;
    }
    goto LABEL_61;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((_DWORD *)a3 + 40) |= 2u;
    $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 36) = self->_totalDuration;
  *((_DWORD *)a3 + 40) |= 0x800000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 33) = self->_serverModeDuration;
  *((_DWORD *)a3 + 40) |= 0x100000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 15) = self->_clientModeDuration;
  *((_DWORD *)a3 + 40) |= 0x10u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 34) = self->_splitModeDuration;
  *((_DWORD *)a3 + 40) |= 0x200000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 3) = self->_txBytes;
  *((_DWORD *)a3 + 40) |= 4u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 1) = self->_rxBytes;
  *((_DWORD *)a3 + 40) |= 1u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 35) = self->_startingRSSI;
  *((_DWORD *)a3 + 40) |= 0x400000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 14) = self->_awdlVersion;
  *((_DWORD *)a3 + 40) |= 8u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 37) = self->_totalPeerCount;
  *((_DWORD *)a3 + 40) |= 0x1000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 28) = self->_routablePeerCount;
  *((_DWORD *)a3 + 40) |= 0x8000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 18) = self->_infraDisconnectedCount;
  *((_DWORD *)a3 + 40) |= 0x80u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 32) = self->_sequenceNumberNotUpdatedCount;
  *((_DWORD *)a3 + 40) |= 0x80000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 19) = self->_missingAWStartEventCount;
  *((_DWORD *)a3 + 40) |= 0x100u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 24) = self->_psfEnabledCount;
  *((_DWORD *)a3 + 40) |= 0x800u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 29) = self->_selfInfraChannel;
  *((_DWORD *)a3 + 40) |= 0x10000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 20) = self->_peerInfraChannel;
  *((_DWORD *)a3 + 40) |= 0x200u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 31) = self->_senderPlatform;
  *((_DWORD *)a3 + 40) |= 0x40000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((unsigned char *)a3 + 153) = self->_csaToDfsChannel;
  *((_DWORD *)a3 + 40) |= 0x4000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((unsigned char *)a3 + 152) = self->_csaDuringDfspMode;
  *((_DWORD *)a3 + 40) |= 0x2000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((unsigned char *)a3 + 154) = self->_dfsProxyMode;
  *((_DWORD *)a3 + 40) |= 0x8000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_24;
    }
LABEL_73:
    *((unsigned char *)a3 + 156) = self->_peerIsSDB;
    *((_DWORD *)a3 + 40) |= 0x20000000u;
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_72:
  *((unsigned char *)a3 + 157) = self->_selfIsSDB;
  *((_DWORD *)a3 + 40) |= 0x40000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) != 0) {
    goto LABEL_73;
  }
LABEL_24:
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_25:
    *((unsigned char *)a3 + 155) = self->_inRetroMode;
    *((_DWORD *)a3 + 40) |= 0x10000000u;
  }
LABEL_26:
  if ([(AWDWiFiP2PAirplayMetrics *)self peerRSSIsCount])
  {
    [a3 clearPeerRSSIs];
    unint64_t v6 = [(AWDWiFiP2PAirplayMetrics *)self peerRSSIsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addPeerRSSI:-[AWDWiFiP2PAirplayMetrics peerRSSIAtIndex:](self, "peerRSSIAtIndex:", i)];
    }
  }
  if ([(AWDWiFiP2PAirplayMetrics *)self avgCCASocialChannelsCount])
  {
    [a3 clearAvgCCASocialChannels];
    unint64_t v9 = [(AWDWiFiP2PAirplayMetrics *)self avgCCASocialChannelsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addAvgCCASocialChannel:-[AWDWiFiP2PAirplayMetrics avgCCASocialChannelAtIndex:](self, "avgCCASocialChannelAtIndex:", j)];
    }
  }
  if ([(AWDWiFiP2PAirplayMetrics *)self avgCCASelfInfraChannelsCount])
  {
    [a3 clearAvgCCASelfInfraChannels];
    unint64_t v12 = [(AWDWiFiP2PAirplayMetrics *)self avgCCASelfInfraChannelsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addAvgCCASelfInfraChannel:-[AWDWiFiP2PAirplayMetrics avgCCASelfInfraChannelAtIndex:](self, "avgCCASelfInfraChannelAtIndex:", k)];
    }
  }
  if ([(AWDWiFiP2PAirplayMetrics *)self avgCCAPeerInfraChannelsCount])
  {
    [a3 clearAvgCCAPeerInfraChannels];
    unint64_t v15 = [(AWDWiFiP2PAirplayMetrics *)self avgCCAPeerInfraChannelsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addAvgCCAPeerInfraChannel:[[AWDWiFiP2PAirplayMetrics avgCCAPeerInfraChannelAtIndex:](self, "avgCCAPeerInfraChannelAtIndex:", m)];
    }
  }
  $9AAF52838BB36F993592C58FF7F8D143 v18 = self->_has;
  if ((*(_DWORD *)&v18 & 0x20000) != 0)
  {
    *((_DWORD *)a3 + 30) = self->_selfInfraChannelFlags;
    *((_DWORD *)a3 + 40) |= 0x20000u;
    $9AAF52838BB36F993592C58FF7F8D143 v18 = self->_has;
    if ((*(_WORD *)&v18 & 0x400) == 0)
    {
LABEL_44:
      if ((*(_WORD *)&v18 & 0x1000) == 0) {
        goto LABEL_45;
      }
      goto LABEL_77;
    }
  }
  else if ((*(_WORD *)&v18 & 0x400) == 0)
  {
    goto LABEL_44;
  }
  *((_DWORD *)a3 + 21) = self->_peerInfraChannelFlags;
  *((_DWORD *)a3 + 40) |= 0x400u;
  $9AAF52838BB36F993592C58FF7F8D143 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x1000) == 0)
  {
LABEL_45:
    if ((*(_WORD *)&v18 & 0x4000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 25) = self->_roamOutOfOtherCount;
  *((_DWORD *)a3 + 40) |= 0x1000u;
  $9AAF52838BB36F993592C58FF7F8D143 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x4000) == 0)
  {
LABEL_46:
    if ((*(_WORD *)&v18 & 0x2000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 27) = self->_roamOutOfOtherSuccess;
  *((_DWORD *)a3 + 40) |= 0x4000u;
  $9AAF52838BB36F993592C58FF7F8D143 v18 = self->_has;
  if ((*(_WORD *)&v18 & 0x2000) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v18 & 0x20) == 0) {
      goto LABEL_48;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 26) = self->_roamOutOfOtherFailure;
  *((_DWORD *)a3 + 40) |= 0x2000u;
  $9AAF52838BB36F993592C58FF7F8D143 v18 = self->_has;
  if ((*(unsigned char *)&v18 & 0x20) == 0)
  {
LABEL_48:
    if ((*(unsigned char *)&v18 & 0x40) == 0) {
      return;
    }
    goto LABEL_49;
  }
LABEL_80:
  *((_DWORD *)a3 + 16) = self->_forceRoamHasChannelsCnt;
  *((_DWORD *)a3 + 40) |= 0x20u;
  if ((*(_DWORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_49:
  *((_DWORD *)a3 + 17) = self->_forceRoamHasNoChannel;
  *((_DWORD *)a3 + 40) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (_DWORD *)v5;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(_DWORD *)(v5 + 160) |= 2u;
    $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
    if ((*(_DWORD *)&has & 0x800000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }
  else if ((*(_DWORD *)&has & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 144) = self->_totalDuration;
  *(_DWORD *)(v5 + 160) |= 0x800000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v5 + 132) = self->_serverModeDuration;
  *(_DWORD *)(v5 + 160) |= 0x100000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 60) = self->_clientModeDuration;
  *(_DWORD *)(v5 + 160) |= 0x10u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v5 + 136) = self->_splitModeDuration;
  *(_DWORD *)(v5 + 160) |= 0x200000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(void *)(v5 + 24) = self->_txBytes;
  *(_DWORD *)(v5 + 160) |= 4u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(void *)(v5 + 8) = self->_rxBytes;
  *(_DWORD *)(v5 + 160) |= 1u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v5 + 140) = self->_startingRSSI;
  *(_DWORD *)(v5 + 160) |= 0x400000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v5 + 56) = self->_awdlVersion;
  *(_DWORD *)(v5 + 160) |= 8u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v5 + 148) = self->_totalPeerCount;
  *(_DWORD *)(v5 + 160) |= 0x1000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v5 + 112) = self->_routablePeerCount;
  *(_DWORD *)(v5 + 160) |= 0x8000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v5 + 72) = self->_infraDisconnectedCount;
  *(_DWORD *)(v5 + 160) |= 0x80u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v5 + 128) = self->_sequenceNumberNotUpdatedCount;
  *(_DWORD *)(v5 + 160) |= 0x80000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v5 + 76) = self->_missingAWStartEventCount;
  *(_DWORD *)(v5 + 160) |= 0x100u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v5 + 96) = self->_psfEnabledCount;
  *(_DWORD *)(v5 + 160) |= 0x800u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v5 + 116) = self->_selfInfraChannel;
  *(_DWORD *)(v5 + 160) |= 0x10000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v5 + 80) = self->_peerInfraChannel;
  *(_DWORD *)(v5 + 160) |= 0x200u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v5 + 124) = self->_senderPlatform;
  *(_DWORD *)(v5 + 160) |= 0x40000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(unsigned char *)(v5 + 153) = self->_csaToDfsChannel;
  *(_DWORD *)(v5 + 160) |= 0x4000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(unsigned char *)(v5 + 152) = self->_csaDuringDfspMode;
  *(_DWORD *)(v5 + 160) |= 0x2000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(unsigned char *)(v5 + 154) = self->_dfsProxyMode;
  *(_DWORD *)(v5 + 160) |= 0x8000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(unsigned char *)(v5 + 157) = self->_selfIsSDB;
  *(_DWORD *)(v5 + 160) |= 0x40000000u;
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_85:
  *(unsigned char *)(v5 + 156) = self->_peerIsSDB;
  *(_DWORD *)(v5 + 160) |= 0x20000000u;
  if ((*(_DWORD *)&self->_has & 0x10000000) != 0)
  {
LABEL_25:
    *(unsigned char *)(v5 + 155) = self->_inRetroMode;
    *(_DWORD *)(v5 + 160) |= 0x10000000u;
  }
LABEL_26:
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  peerRSSIs = self->_peerRSSIs;
  uint64_t v9 = [(NSMutableArray *)peerRSSIs countByEnumeratingWithState:&v46 objects:v53 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v47 != v11) {
          objc_enumerationMutation(peerRSSIs);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v46 + 1) + 8 * i) copyWithZone:a3];
        [v6 addPeerRSSI:v13];
      }
      uint64_t v10 = [(NSMutableArray *)peerRSSIs countByEnumeratingWithState:&v46 objects:v53 count:16];
    }
    while (v10);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  avgCCASocialChannels = self->_avgCCASocialChannels;
  uint64_t v15 = [(NSMutableArray *)avgCCASocialChannels countByEnumeratingWithState:&v42 objects:v52 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v43 != v17) {
          objc_enumerationMutation(avgCCASocialChannels);
        }
        uint64_t v19 = (void *)[*(id *)(*((void *)&v42 + 1) + 8 * j) copyWithZone:a3];
        [v6 addAvgCCASocialChannel:v19];
      }
      uint64_t v16 = [(NSMutableArray *)avgCCASocialChannels countByEnumeratingWithState:&v42 objects:v52 count:16];
    }
    while (v16);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  uint64_t v21 = [(NSMutableArray *)avgCCASelfInfraChannels countByEnumeratingWithState:&v38 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(avgCCASelfInfraChannels);
        }
        $9AAF52838BB36F993592C58FF7F8D143 v25 = (void *)[*(id *)(*((void *)&v38 + 1) + 8 * k) copyWithZone:a3];
        [v6 addAvgCCASelfInfraChannel:v25];
      }
      uint64_t v22 = [(NSMutableArray *)avgCCASelfInfraChannels countByEnumeratingWithState:&v38 objects:v51 count:16];
    }
    while (v22);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  uint64_t v27 = [(NSMutableArray *)avgCCAPeerInfraChannels countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v35 != v29) {
          objc_enumerationMutation(avgCCAPeerInfraChannels);
        }
        long long v31 = (void *)[*(id *)(*((void *)&v34 + 1) + 8 * m) copyWithZone:a3];
        [v6 addAvgCCAPeerInfraChannel:v31];
      }
      uint64_t v28 = [(NSMutableArray *)avgCCAPeerInfraChannels countByEnumeratingWithState:&v34 objects:v50 count:16];
    }
    while (v28);
  }
  $9AAF52838BB36F993592C58FF7F8D143 v32 = self->_has;
  if ((*(_DWORD *)&v32 & 0x20000) != 0)
  {
    v6[30] = self->_selfInfraChannelFlags;
    v6[40] |= 0x20000u;
    $9AAF52838BB36F993592C58FF7F8D143 v32 = self->_has;
    if ((*(_WORD *)&v32 & 0x400) == 0)
    {
LABEL_56:
      if ((*(_WORD *)&v32 & 0x1000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_89;
    }
  }
  else if ((*(_WORD *)&v32 & 0x400) == 0)
  {
    goto LABEL_56;
  }
  v6[21] = self->_peerInfraChannelFlags;
  v6[40] |= 0x400u;
  $9AAF52838BB36F993592C58FF7F8D143 v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x1000) == 0)
  {
LABEL_57:
    if ((*(_WORD *)&v32 & 0x4000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_90;
  }
LABEL_89:
  v6[25] = self->_roamOutOfOtherCount;
  v6[40] |= 0x1000u;
  $9AAF52838BB36F993592C58FF7F8D143 v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x4000) == 0)
  {
LABEL_58:
    if ((*(_WORD *)&v32 & 0x2000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_91;
  }
LABEL_90:
  v6[27] = self->_roamOutOfOtherSuccess;
  v6[40] |= 0x4000u;
  $9AAF52838BB36F993592C58FF7F8D143 v32 = self->_has;
  if ((*(_WORD *)&v32 & 0x2000) == 0)
  {
LABEL_59:
    if ((*(unsigned char *)&v32 & 0x20) == 0) {
      goto LABEL_60;
    }
LABEL_92:
    v6[16] = self->_forceRoamHasChannelsCnt;
    v6[40] |= 0x20u;
    if ((*(_DWORD *)&self->_has & 0x40) == 0) {
      return v6;
    }
    goto LABEL_61;
  }
LABEL_91:
  v6[26] = self->_roamOutOfOtherFailure;
  v6[40] |= 0x2000u;
  $9AAF52838BB36F993592C58FF7F8D143 v32 = self->_has;
  if ((*(unsigned char *)&v32 & 0x20) != 0) {
    goto LABEL_92;
  }
LABEL_60:
  if ((*(unsigned char *)&v32 & 0x40) != 0)
  {
LABEL_61:
    v6[17] = self->_forceRoamHasNoChannel;
    v6[40] |= 0x40u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  int v7 = *((_DWORD *)a3 + 40);
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_totalDuration != *((_DWORD *)a3 + 36)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_serverModeDuration != *((_DWORD *)a3 + 33)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_clientModeDuration != *((_DWORD *)a3 + 15)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_splitModeDuration != *((_DWORD *)a3 + 34)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_txBytes != *((void *)a3 + 3)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_136;
  }
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_rxBytes != *((void *)a3 + 1)) {
      goto LABEL_136;
    }
  }
  else if (v7)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_startingRSSI != *((_DWORD *)a3 + 35)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_awdlVersion != *((_DWORD *)a3 + 14)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v7 & 0x1000000) == 0 || self->_totalPeerCount != *((_DWORD *)a3 + 37)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x1000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_routablePeerCount != *((_DWORD *)a3 + 28)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_infraDisconnectedCount != *((_DWORD *)a3 + 18)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_sequenceNumberNotUpdatedCount != *((_DWORD *)a3 + 32)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v7 & 0x100) == 0 || self->_missingAWStartEventCount != *((_DWORD *)a3 + 19)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x100) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v7 & 0x800) == 0 || self->_psfEnabledCount != *((_DWORD *)a3 + 24)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x800) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_selfInfraChannel != *((_DWORD *)a3 + 29)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v7 & 0x200) == 0 || self->_peerInfraChannel != *((_DWORD *)a3 + 20)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x200) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_senderPlatform != *((_DWORD *)a3 + 31)) {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v7 & 0x4000000) == 0) {
      goto LABEL_136;
    }
    if (self->_csaToDfsChannel)
    {
      if (!*((unsigned char *)a3 + 153)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)a3 + 153))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x4000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_136;
    }
    if (self->_csaDuringDfspMode)
    {
      if (!*((unsigned char *)a3 + 152)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)a3 + 152))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v7 & 0x8000000) == 0) {
      goto LABEL_136;
    }
    if (self->_dfsProxyMode)
    {
      if (!*((unsigned char *)a3 + 154)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)a3 + 154))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x8000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v7 & 0x40000000) == 0) {
      goto LABEL_136;
    }
    if (self->_selfIsSDB)
    {
      if (!*((unsigned char *)a3 + 157)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)a3 + 157))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x40000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v7 & 0x20000000) == 0) {
      goto LABEL_136;
    }
    if (self->_peerIsSDB)
    {
      if (!*((unsigned char *)a3 + 156)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)a3 + 156))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x20000000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v7 & 0x10000000) == 0) {
      goto LABEL_136;
    }
    if (self->_inRetroMode)
    {
      if (!*((unsigned char *)a3 + 155)) {
        goto LABEL_136;
      }
    }
    else if (*((unsigned char *)a3 + 155))
    {
      goto LABEL_136;
    }
  }
  else if ((v7 & 0x10000000) != 0)
  {
    goto LABEL_136;
  }
  peerRSSIs = self->_peerRSSIs;
  if ((unint64_t)peerRSSIs | *((void *)a3 + 11))
  {
    int v5 = -[NSMutableArray isEqual:](peerRSSIs, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  avgCCASocialChannels = self->_avgCCASocialChannels;
  if ((unint64_t)avgCCASocialChannels | *((void *)a3 + 6))
  {
    int v5 = -[NSMutableArray isEqual:](avgCCASocialChannels, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  avgCCASelfInfraChannels = self->_avgCCASelfInfraChannels;
  if ((unint64_t)avgCCASelfInfraChannels | *((void *)a3 + 5))
  {
    int v5 = -[NSMutableArray isEqual:](avgCCASelfInfraChannels, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  avgCCAPeerInfraChannels = self->_avgCCAPeerInfraChannels;
  if ((unint64_t)avgCCAPeerInfraChannels | *((void *)a3 + 4))
  {
    int v5 = -[NSMutableArray isEqual:](avgCCAPeerInfraChannels, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $9AAF52838BB36F993592C58FF7F8D143 v12 = self->_has;
  int v13 = *((_DWORD *)a3 + 40);
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
    if ((v13 & 0x20000) == 0 || self->_selfInfraChannelFlags != *((_DWORD *)a3 + 30)) {
      goto LABEL_136;
    }
  }
  else if ((v13 & 0x20000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x400) != 0)
  {
    if ((v13 & 0x400) == 0 || self->_peerInfraChannelFlags != *((_DWORD *)a3 + 21)) {
      goto LABEL_136;
    }
  }
  else if ((v13 & 0x400) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    if ((v13 & 0x1000) == 0 || self->_roamOutOfOtherCount != *((_DWORD *)a3 + 25)) {
      goto LABEL_136;
    }
  }
  else if ((v13 & 0x1000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x4000) != 0)
  {
    if ((v13 & 0x4000) == 0 || self->_roamOutOfOtherSuccess != *((_DWORD *)a3 + 27)) {
      goto LABEL_136;
    }
  }
  else if ((v13 & 0x4000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
    if ((v13 & 0x2000) == 0 || self->_roamOutOfOtherFailure != *((_DWORD *)a3 + 26)) {
      goto LABEL_136;
    }
  }
  else if ((v13 & 0x2000) != 0)
  {
    goto LABEL_136;
  }
  if ((*(unsigned char *)&v12 & 0x20) != 0)
  {
    if ((v13 & 0x20) == 0 || self->_forceRoamHasChannelsCnt != *((_DWORD *)a3 + 16)) {
      goto LABEL_136;
    }
    goto LABEL_180;
  }
  if ((v13 & 0x20) != 0)
  {
LABEL_136:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_180:
  LOBYTE(v5) = (*((_DWORD *)a3 + 40) & 0x40) == 0;
  if ((*(unsigned char *)&v12 & 0x40) == 0) {
    return v5;
  }
  if ((v13 & 0x40) == 0 || self->_forceRoamHasNoChannel != *((_DWORD *)a3 + 17)) {
    goto LABEL_136;
  }
  LOBYTE(v5) = 1;
  return v5;
}

- (unint64_t)hash
{
  $9AAF52838BB36F993592C58FF7F8D143 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    unint64_t v40 = 2654435761u * self->_timestamp;
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
LABEL_3:
      uint64_t v39 = 2654435761 * self->_totalDuration;
      if ((*(_DWORD *)&has & 0x100000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_28;
    }
  }
  else
  {
    unint64_t v40 = 0;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v39 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_4:
    uint64_t v38 = 2654435761 * self->_serverModeDuration;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v38 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v37 = 2654435761 * self->_clientModeDuration;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_6:
    uint64_t v36 = 2654435761 * self->_splitModeDuration;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v36 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_7:
    unint64_t v35 = 2654435761u * self->_txBytes;
    if (*(unsigned char *)&has) {
      goto LABEL_8;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v35 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_8:
    unint64_t v34 = 2654435761u * self->_rxBytes;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_9:
    uint64_t v33 = 2654435761 * self->_startingRSSI;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v33 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_10:
    uint64_t v32 = 2654435761 * self->_awdlVersion;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_11:
    uint64_t v31 = 2654435761 * self->_totalPeerCount;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v31 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_12:
    uint64_t v30 = 2654435761 * self->_routablePeerCount;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_13:
    uint64_t v29 = 2654435761 * self->_infraDisconnectedCount;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_14:
    uint64_t v28 = 2654435761 * self->_sequenceNumberNotUpdatedCount;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_15;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v28 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_15:
    uint64_t v27 = 2654435761 * self->_missingAWStartEventCount;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_16;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v27 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_16:
    uint64_t v26 = 2654435761 * self->_psfEnabledCount;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_17:
    uint64_t v25 = 2654435761 * self->_selfInfraChannel;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_18;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_18:
    uint64_t v24 = 2654435761 * self->_peerInfraChannel;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    uint64_t v23 = 2654435761 * self->_senderPlatform;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_20:
    uint64_t v22 = 2654435761 * self->_csaToDfsChannel;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_21:
    uint64_t v4 = 2654435761 * self->_csaDuringDfspMode;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_22:
    uint64_t v5 = 2654435761 * self->_dfsProxyMode;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_23:
    uint64_t v6 = 2654435761 * self->_selfIsSDB;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_24;
    }
LABEL_48:
    uint64_t v7 = 0;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_47:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x20000000) == 0) {
    goto LABEL_48;
  }
LABEL_24:
  uint64_t v7 = 2654435761 * self->_peerIsSDB;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_25:
    uint64_t v8 = 2654435761 * self->_inRetroMode;
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v8 = 0;
LABEL_50:
  uint64_t v9 = [(NSMutableArray *)self->_peerRSSIs hash];
  uint64_t v10 = [(NSMutableArray *)self->_avgCCASocialChannels hash];
  uint64_t v11 = [(NSMutableArray *)self->_avgCCASelfInfraChannels hash];
  uint64_t v12 = [(NSMutableArray *)self->_avgCCAPeerInfraChannels hash];
  $9AAF52838BB36F993592C58FF7F8D143 v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) != 0)
  {
    uint64_t v14 = 2654435761 * self->_selfInfraChannelFlags;
    if ((*(_WORD *)&v13 & 0x400) != 0)
    {
LABEL_52:
      uint64_t v15 = 2654435761 * self->_peerInfraChannelFlags;
      if ((*(_WORD *)&v13 & 0x1000) != 0) {
        goto LABEL_53;
      }
      goto LABEL_60;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&v13 & 0x400) != 0) {
      goto LABEL_52;
    }
  }
  uint64_t v15 = 0;
  if ((*(_WORD *)&v13 & 0x1000) != 0)
  {
LABEL_53:
    uint64_t v16 = 2654435761 * self->_roamOutOfOtherCount;
    if ((*(_WORD *)&v13 & 0x4000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v16 = 0;
  if ((*(_WORD *)&v13 & 0x4000) != 0)
  {
LABEL_54:
    uint64_t v17 = 2654435761 * self->_roamOutOfOtherSuccess;
    if ((*(_WORD *)&v13 & 0x2000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v17 = 0;
  if ((*(_WORD *)&v13 & 0x2000) != 0)
  {
LABEL_55:
    uint64_t v18 = 2654435761 * self->_roamOutOfOtherFailure;
    if ((*(unsigned char *)&v13 & 0x20) != 0) {
      goto LABEL_56;
    }
LABEL_63:
    uint64_t v19 = 0;
    if ((*(unsigned char *)&v13 & 0x40) != 0) {
      goto LABEL_57;
    }
LABEL_64:
    uint64_t v20 = 0;
    return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
  }
LABEL_62:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&v13 & 0x20) == 0) {
    goto LABEL_63;
  }
LABEL_56:
  uint64_t v19 = 2654435761 * self->_forceRoamHasChannelsCnt;
  if ((*(unsigned char *)&v13 & 0x40) == 0) {
    goto LABEL_64;
  }
LABEL_57:
  uint64_t v20 = 2654435761 * self->_forceRoamHasNoChannel;
  return v39 ^ v40 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v47 = *MEMORY[0x263EF8340];
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(_DWORD *)&self->_has |= 2u;
    int v5 = *((_DWORD *)a3 + 40);
    if ((v5 & 0x800000) == 0)
    {
LABEL_3:
      if ((v5 & 0x100000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_65;
    }
  }
  else if ((v5 & 0x800000) == 0)
  {
    goto LABEL_3;
  }
  self->_totalDuration = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x100000) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_serverModeDuration = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_clientModeDuration = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x200000) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_splitModeDuration = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 1) == 0) {
      goto LABEL_8;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_txBytes = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_8:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_rxBytes = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x400000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_startingRSSI = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_awdlVersion = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_totalPeerCount = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x8000) == 0)
  {
LABEL_12:
    if ((v5 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_routablePeerCount = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x80) == 0)
  {
LABEL_13:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_infraDisconnectedCount = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x80000) == 0)
  {
LABEL_14:
    if ((v5 & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_sequenceNumberNotUpdatedCount = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x100) == 0)
  {
LABEL_15:
    if ((v5 & 0x800) == 0) {
      goto LABEL_16;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_missingAWStartEventCount = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x800) == 0)
  {
LABEL_16:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_psfEnabledCount = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((v5 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_selfInfraChannel = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x200) == 0)
  {
LABEL_18:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_peerInfraChannel = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x40000) == 0)
  {
LABEL_19:
    if ((v5 & 0x4000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_senderPlatforuint64_t m = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x4000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_csaToDfsChannel = *((unsigned char *)a3 + 153);
  *(_DWORD *)&self->_has |= 0x4000000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_21:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_csaDuringDfspMode = *((unsigned char *)a3 + 152);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_22:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_dfsProxyMode = *((unsigned char *)a3 + 154);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_23:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_selfIsSDB = *((unsigned char *)a3 + 157);
  *(_DWORD *)&self->_has |= 0x40000000u;
  int v5 = *((_DWORD *)a3 + 40);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_24:
    if ((v5 & 0x10000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_85:
  self->_peerIsSDB = *((unsigned char *)a3 + 156);
  *(_DWORD *)&self->_has |= 0x20000000u;
  if ((*((_DWORD *)a3 + 40) & 0x10000000) != 0)
  {
LABEL_25:
    self->_inRetroMode = *((unsigned char *)a3 + 155);
    *(_DWORD *)&self->_has |= 0x10000000u;
  }
LABEL_26:
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 11);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v40 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDWiFiP2PAirplayMetrics *)self addPeerRSSI:*(void *)(*((void *)&v39 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v39 objects:v46 count:16];
    }
    while (v8);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 6);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDWiFiP2PAirplayMetrics *)self addAvgCCASocialChannel:*(void *)(*((void *)&v35 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v35 objects:v45 count:16];
    }
    while (v13);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v16 = (void *)*((void *)a3 + 5);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v32 != v19) {
          objc_enumerationMutation(v16);
        }
        [(AWDWiFiP2PAirplayMetrics *)self addAvgCCASelfInfraChannel:*(void *)(*((void *)&v31 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v31 objects:v44 count:16];
    }
    while (v18);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v21 = (void *)*((void *)a3 + 4);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v28 != v24) {
          objc_enumerationMutation(v21);
        }
        [(AWDWiFiP2PAirplayMetrics *)self addAvgCCAPeerInfraChannel:*(void *)(*((void *)&v27 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v27 objects:v43 count:16];
    }
    while (v23);
  }
  int v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x20000) != 0)
  {
    self->_selfInfraChannelFlags = *((_DWORD *)a3 + 30);
    *(_DWORD *)&self->_has |= 0x20000u;
    int v26 = *((_DWORD *)a3 + 40);
    if ((v26 & 0x400) == 0)
    {
LABEL_56:
      if ((v26 & 0x1000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_89;
    }
  }
  else if ((v26 & 0x400) == 0)
  {
    goto LABEL_56;
  }
  self->_peerInfraChannelFlags = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x400u;
  int v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x1000) == 0)
  {
LABEL_57:
    if ((v26 & 0x4000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_roamOutOfOtherCount = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x4000) == 0)
  {
LABEL_58:
    if ((v26 & 0x2000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_roamOutOfOtherSuccess = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x2000) == 0)
  {
LABEL_59:
    if ((v26 & 0x20) == 0) {
      goto LABEL_60;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_roamOutOfOtherFailure = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v26 = *((_DWORD *)a3 + 40);
  if ((v26 & 0x20) == 0)
  {
LABEL_60:
    if ((v26 & 0x40) == 0) {
      return;
    }
    goto LABEL_61;
  }
LABEL_92:
  self->_forceRoamHasChannelsCnt = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x20u;
  if ((*((_DWORD *)a3 + 40) & 0x40) == 0) {
    return;
  }
LABEL_61:
  self->_forceRoamHasNoChannel = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)totalDuration
{
  return self->_totalDuration;
}

- (unsigned)serverModeDuration
{
  return self->_serverModeDuration;
}

- (unsigned)clientModeDuration
{
  return self->_clientModeDuration;
}

- (unsigned)splitModeDuration
{
  return self->_splitModeDuration;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (int)startingRSSI
{
  return self->_startingRSSI;
}

- (unsigned)awdlVersion
{
  return self->_awdlVersion;
}

- (unsigned)totalPeerCount
{
  return self->_totalPeerCount;
}

- (unsigned)routablePeerCount
{
  return self->_routablePeerCount;
}

- (unsigned)infraDisconnectedCount
{
  return self->_infraDisconnectedCount;
}

- (unsigned)sequenceNumberNotUpdatedCount
{
  return self->_sequenceNumberNotUpdatedCount;
}

- (unsigned)missingAWStartEventCount
{
  return self->_missingAWStartEventCount;
}

- (unsigned)psfEnabledCount
{
  return self->_psfEnabledCount;
}

- (unsigned)selfInfraChannel
{
  return self->_selfInfraChannel;
}

- (unsigned)peerInfraChannel
{
  return self->_peerInfraChannel;
}

- (unsigned)senderPlatform
{
  return self->_senderPlatform;
}

- (BOOL)csaToDfsChannel
{
  return self->_csaToDfsChannel;
}

- (BOOL)csaDuringDfspMode
{
  return self->_csaDuringDfspMode;
}

- (BOOL)dfsProxyMode
{
  return self->_dfsProxyMode;
}

- (BOOL)selfIsSDB
{
  return self->_selfIsSDB;
}

- (BOOL)peerIsSDB
{
  return self->_peerIsSDB;
}

- (BOOL)inRetroMode
{
  return self->_inRetroMode;
}

- (NSMutableArray)peerRSSIs
{
  return self->_peerRSSIs;
}

- (void)setPeerRSSIs:(id)a3
{
}

- (NSMutableArray)avgCCASocialChannels
{
  return self->_avgCCASocialChannels;
}

- (void)setAvgCCASocialChannels:(id)a3
{
}

- (NSMutableArray)avgCCASelfInfraChannels
{
  return self->_avgCCASelfInfraChannels;
}

- (void)setAvgCCASelfInfraChannels:(id)a3
{
}

- (NSMutableArray)avgCCAPeerInfraChannels
{
  return self->_avgCCAPeerInfraChannels;
}

- (void)setAvgCCAPeerInfraChannels:(id)a3
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

- (unsigned)roamOutOfOtherCount
{
  return self->_roamOutOfOtherCount;
}

- (unsigned)roamOutOfOtherSuccess
{
  return self->_roamOutOfOtherSuccess;
}

- (unsigned)roamOutOfOtherFailure
{
  return self->_roamOutOfOtherFailure;
}

- (unsigned)forceRoamHasChannelsCnt
{
  return self->_forceRoamHasChannelsCnt;
}

- (unsigned)forceRoamHasNoChannel
{
  return self->_forceRoamHasNoChannel;
}

@end