@interface AWDWRMFacetimeRecommendation
- (BOOL)alertedMode;
- (BOOL)captiveNetworks;
- (BOOL)cellMode;
- (BOOL)hasAlertedMode;
- (BOOL)hasAudioErasure;
- (BOOL)hasBssLoad;
- (BOOL)hasCaptiveNetworks;
- (BOOL)hasCca;
- (BOOL)hasCellMode;
- (BOOL)hasCellRsrp;
- (BOOL)hasCellRsrq;
- (BOOL)hasCellSnr;
- (BOOL)hasCounter;
- (BOOL)hasDataLQM;
- (BOOL)hasFacetimeAction;
- (BOOL)hasFacetimePacketLoss;
- (BOOL)hasFacetimeTimeDelay;
- (BOOL)hasIRATRecommendation;
- (BOOL)hasIRATRecommendationReason;
- (BOOL)hasIsPCDetected;
- (BOOL)hasIsStallDetected;
- (BOOL)hasQbssLoad;
- (BOOL)hasRatType;
- (BOOL)hasSignalBar;
- (BOOL)hasStationCount;
- (BOOL)hasTimestamp;
- (BOOL)hasVideoErasure;
- (BOOL)hasVoiceLQM;
- (BOOL)hasWifiEstimatedBandwitdh;
- (BOOL)hasWifiRssi;
- (BOOL)hasWifiRxPhyRate;
- (BOOL)hasWifiRxRetry;
- (BOOL)hasWifiSNR;
- (BOOL)hasWifiTxPER;
- (BOOL)hasWifiTxPhyRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPCDetected;
- (BOOL)isStallDetected;
- (BOOL)readFrom:(id)a3;
- (NSString)iRATRecommendation;
- (NSString)iRATRecommendationReason;
- (NSString)ratType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cellRsrp;
- (int)cellRsrq;
- (int)cellSnr;
- (int64_t)wifiRssi;
- (int64_t)wifiSNR;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)audioErasure;
- (unsigned)bssLoad;
- (unsigned)cca;
- (unsigned)counter;
- (unsigned)dataLQM;
- (unsigned)facetimeAction;
- (unsigned)facetimePacketLoss;
- (unsigned)facetimeTimeDelay;
- (unsigned)qbssLoad;
- (unsigned)signalBar;
- (unsigned)stationCount;
- (unsigned)videoErasure;
- (unsigned)voiceLQM;
- (unsigned)wifiEstimatedBandwitdh;
- (unsigned)wifiRxPhyRate;
- (unsigned)wifiRxRetry;
- (unsigned)wifiTxPER;
- (unsigned)wifiTxPhyRate;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlertedMode:(BOOL)a3;
- (void)setAudioErasure:(unsigned int)a3;
- (void)setBssLoad:(unsigned int)a3;
- (void)setCaptiveNetworks:(BOOL)a3;
- (void)setCca:(unsigned int)a3;
- (void)setCellMode:(BOOL)a3;
- (void)setCellRsrp:(int)a3;
- (void)setCellRsrq:(int)a3;
- (void)setCellSnr:(int)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setDataLQM:(unsigned int)a3;
- (void)setFacetimeAction:(unsigned int)a3;
- (void)setFacetimePacketLoss:(unsigned int)a3;
- (void)setFacetimeTimeDelay:(unsigned int)a3;
- (void)setHasAlertedMode:(BOOL)a3;
- (void)setHasAudioErasure:(BOOL)a3;
- (void)setHasBssLoad:(BOOL)a3;
- (void)setHasCaptiveNetworks:(BOOL)a3;
- (void)setHasCca:(BOOL)a3;
- (void)setHasCellMode:(BOOL)a3;
- (void)setHasCellRsrp:(BOOL)a3;
- (void)setHasCellRsrq:(BOOL)a3;
- (void)setHasCellSnr:(BOOL)a3;
- (void)setHasCounter:(BOOL)a3;
- (void)setHasDataLQM:(BOOL)a3;
- (void)setHasFacetimeAction:(BOOL)a3;
- (void)setHasFacetimePacketLoss:(BOOL)a3;
- (void)setHasFacetimeTimeDelay:(BOOL)a3;
- (void)setHasIsPCDetected:(BOOL)a3;
- (void)setHasIsStallDetected:(BOOL)a3;
- (void)setHasQbssLoad:(BOOL)a3;
- (void)setHasSignalBar:(BOOL)a3;
- (void)setHasStationCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVideoErasure:(BOOL)a3;
- (void)setHasVoiceLQM:(BOOL)a3;
- (void)setHasWifiEstimatedBandwitdh:(BOOL)a3;
- (void)setHasWifiRssi:(BOOL)a3;
- (void)setHasWifiRxPhyRate:(BOOL)a3;
- (void)setHasWifiRxRetry:(BOOL)a3;
- (void)setHasWifiSNR:(BOOL)a3;
- (void)setHasWifiTxPER:(BOOL)a3;
- (void)setHasWifiTxPhyRate:(BOOL)a3;
- (void)setIRATRecommendation:(id)a3;
- (void)setIRATRecommendationReason:(id)a3;
- (void)setIsPCDetected:(BOOL)a3;
- (void)setIsStallDetected:(BOOL)a3;
- (void)setQbssLoad:(unsigned int)a3;
- (void)setRatType:(id)a3;
- (void)setSignalBar:(unsigned int)a3;
- (void)setStationCount:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVideoErasure:(unsigned int)a3;
- (void)setVoiceLQM:(unsigned int)a3;
- (void)setWifiEstimatedBandwitdh:(unsigned int)a3;
- (void)setWifiRssi:(int64_t)a3;
- (void)setWifiRxPhyRate:(unsigned int)a3;
- (void)setWifiRxRetry:(unsigned int)a3;
- (void)setWifiSNR:(int64_t)a3;
- (void)setWifiTxPER:(unsigned int)a3;
- (void)setWifiTxPhyRate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMFacetimeRecommendation

- (void)dealloc
{
  [(AWDWRMFacetimeRecommendation *)self setRatType:0];
  [(AWDWRMFacetimeRecommendation *)self setIRATRecommendation:0];
  [(AWDWRMFacetimeRecommendation *)self setIRATRecommendationReason:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMFacetimeRecommendation;
  [(AWDWRMFacetimeRecommendation *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWifiRssi:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasWifiRssi
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasWifiTxPER
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setWifiSNR:(int64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasWifiSNR
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCaptiveNetworks:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_captiveNetworks = a3;
}

- (void)setHasCaptiveNetworks:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasCaptiveNetworks
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasWifiRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setWifiEstimatedBandwitdh:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_wifiEstimatedBandwitdh = a3;
}

- (void)setHasWifiEstimatedBandwitdh:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasWifiEstimatedBandwitdh
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setWifiTxPhyRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_wifiTxPhyRate = a3;
}

- (void)setHasWifiTxPhyRate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasWifiTxPhyRate
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setWifiRxPhyRate:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_wifiRxPhyRate = a3;
}

- (void)setHasWifiRxPhyRate:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasWifiRxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setQbssLoad:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_qbssLoad = a3;
}

- (void)setHasQbssLoad:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasQbssLoad
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCca:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasCca
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setStationCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_stationCount = a3;
}

- (void)setHasStationCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasStationCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setDataLQM:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_dataLQM = a3;
}

- (void)setHasDataLQM:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDataLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setBssLoad:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_bssLoad = a3;
}

- (void)setHasBssLoad:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasBssLoad
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setVoiceLQM:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_voiceLQM = a3;
}

- (void)setHasVoiceLQM:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasVoiceLQM
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setSignalBar:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_signalBar = a3;
}

- (void)setHasSignalBar:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSignalBar
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (BOOL)hasRatType
{
  return self->_ratType != 0;
}

- (BOOL)hasIRATRecommendation
{
  return self->_iRATRecommendation != 0;
}

- (BOOL)hasIRATRecommendationReason
{
  return self->_iRATRecommendationReason != 0;
}

- (void)setFacetimePacketLoss:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_facetimePacketLoss = a3;
}

- (void)setHasFacetimePacketLoss:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasFacetimePacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFacetimeAction:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_facetimeAction = a3;
}

- (void)setHasFacetimeAction:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasFacetimeAction
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setFacetimeTimeDelay:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_facetimeTimeDelay = a3;
}

- (void)setHasFacetimeTimeDelay:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasFacetimeTimeDelay
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCounter:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasCounter
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setAlertedMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_alertedMode = a3;
}

- (void)setHasAlertedMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasAlertedMode
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setIsStallDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_isStallDetected = a3;
}

- (void)setHasIsStallDetected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasIsStallDetected
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setIsPCDetected:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_isPCDetected = a3;
}

- (void)setHasIsPCDetected:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasIsPCDetected
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setVideoErasure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_videoErasure = a3;
}

- (void)setHasVideoErasure:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasVideoErasure
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setAudioErasure:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_audioErasure = a3;
}

- (void)setHasAudioErasure:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasAudioErasure
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCellRsrp:(int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_cellRsrp = a3;
}

- (void)setHasCellRsrp:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasCellRsrp
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCellRsrq:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_cellRsrq = a3;
}

- (void)setHasCellRsrq:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasCellRsrq
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCellSnr:(int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_cellSnr = a3;
}

- (void)setHasCellSnr:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCellSnr
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCellMode:(BOOL)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_cellMode = a3;
}

- (void)setHasCellMode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F57CBE7E82B36495573539A3C92CBBA7)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasCellMode
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMFacetimeRecommendation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMFacetimeRecommendation description](&v3, sel_description), -[AWDWRMFacetimeRecommendation dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithLongLong:self->_wifiRssi] forKey:@"wifiRssi"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTxPER] forKey:@"wifiTxPER"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithLongLong:self->_wifiSNR] forKey:@"wifiSNR"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithBool:self->_captiveNetworks] forKey:@"captiveNetworks"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRxRetry] forKey:@"wifiRxRetry"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiEstimatedBandwitdh] forKey:@"wifiEstimatedBandwitdh"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTxPhyRate] forKey:@"wifiTxPhyRate"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRxPhyRate] forKey:@"wifiRxPhyRate"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_qbssLoad] forKey:@"qbssLoad"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cca] forKey:@"cca"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_stationCount] forKey:@"stationCount"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dataLQM] forKey:@"dataLQM"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bssLoad] forKey:@"bssLoad"];
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_voiceLQM] forKey:@"voiceLQM"];
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_17:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_signalBar] forKey:@"signalBar"];
LABEL_18:
  ratType = self->_ratType;
  if (ratType) {
    [v3 setObject:ratType forKey:@"ratType"];
  }
  iRATRecommendation = self->_iRATRecommendation;
  if (iRATRecommendation) {
    [v3 setObject:iRATRecommendation forKey:@"iRATRecommendation"];
  }
  iRATRecommendationReason = self->_iRATRecommendationReason;
  if (iRATRecommendationReason) {
    [v3 setObject:iRATRecommendationReason forKey:@"iRATRecommendationReason"];
  }
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_facetimePacketLoss] forKey:@"facetimePacketLoss"];
    $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v8 & 0x2000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_facetimeAction] forKey:@"facetimeAction"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v8 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_facetimeTimeDelay] forKey:@"facetimeTimeDelay"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_counter] forKey:@"counter"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithBool:self->_alertedMode] forKey:@"alertedMode"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithBool:self->_isStallDetected] forKey:@"isStallDetected"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithBool:self->_isPCDetected] forKey:@"isPCDetected"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_videoErasure] forKey:@"videoErasure"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_audioErasure] forKey:@"audioErasure"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v8 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithInt:self->_cellRsrp] forKey:@"cell_rsrp"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_36;
    }
LABEL_66:
    [v3 setObject:[NSNumber numberWithInt:self->_cellSnr] forKey:@"cell_snr"];
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0) {
      return v3;
    }
    goto LABEL_37;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithInt:self->_cellRsrq] forKey:@"cell_rsrq"];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0) {
    goto LABEL_66;
  }
LABEL_36:
  if ((*(_DWORD *)&v8 & 0x4000000) != 0) {
LABEL_37:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_cellMode] forKey:@"cellMode"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMFacetimeRecommendationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_40;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint64Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteSint64Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteBOOLField();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  if (self->_ratType) {
    PBDataWriterWriteStringField();
  }
  if (self->_iRATRecommendation) {
    PBDataWriterWriteStringField();
  }
  if (self->_iRATRecommendationReason) {
    PBDataWriterWriteStringField();
  }
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v5 & 0x2000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteBOOLField();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteBOOLField();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteBOOLField();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v5 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x40) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v5 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteSint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_36;
    }
LABEL_65:
    PBDataWriterWriteSint32Field();
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0) {
      return;
    }
    goto LABEL_66;
  }
LABEL_64:
  PBDataWriterWriteSint32Field();
  $F57CBE7E82B36495573539A3C92CBBA7 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) != 0) {
    goto LABEL_65;
  }
LABEL_36:
  if ((*(_DWORD *)&v5 & 0x4000000) == 0) {
    return;
  }
LABEL_66:

  PBDataWriterWriteBOOLField();
}

- (void)copyTo:(id)a3
{
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 39) |= 1u;
    $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_wifiRssi;
  *((_DWORD *)a3 + 39) |= 2u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 35) = self->_wifiTxPER;
  *((_DWORD *)a3 + 39) |= 0x400000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((void *)a3 + 3) = self->_wifiSNR;
  *((_DWORD *)a3 + 39) |= 4u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((unsigned char *)a3 + 149) = self->_captiveNetworks;
  *((_DWORD *)a3 + 39) |= 0x2000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 34) = self->_wifiRxRetry;
  *((_DWORD *)a3 + 39) |= 0x200000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 32) = self->_wifiEstimatedBandwitdh;
  *((_DWORD *)a3 + 39) |= 0x80000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 36) = self->_wifiTxPhyRate;
  *((_DWORD *)a3 + 39) |= 0x800000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 33) = self->_wifiRxPhyRate;
  *((_DWORD *)a3 + 39) |= 0x100000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 24) = self->_qbssLoad;
  *((_DWORD *)a3 + 39) |= 0x4000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 10) = self->_cca;
  *((_DWORD *)a3 + 39) |= 0x20u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 29) = self->_stationCount;
  *((_DWORD *)a3 + 39) |= 0x10000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 15) = self->_dataLQM;
  *((_DWORD *)a3 + 39) |= 0x400u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 9) = self->_bssLoad;
  *((_DWORD *)a3 + 39) |= 0x10u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_53:
  *((_DWORD *)a3 + 31) = self->_voiceLQM;
  *((_DWORD *)a3 + 39) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 28) = self->_signalBar;
    *((_DWORD *)a3 + 39) |= 0x8000u;
  }
LABEL_18:
  if (self->_ratType) {
    [a3 setRatType:];
  }
  if (self->_iRATRecommendation) {
    [a3 setIRATRecommendation:];
  }
  if (self->_iRATRecommendationReason) {
    [a3 setIRATRecommendationReason:];
  }
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) != 0)
  {
    *((_DWORD *)a3 + 17) = self->_facetimePacketLoss;
    *((_DWORD *)a3 + 39) |= 0x1000u;
    $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_26:
      if ((*(_WORD *)&v6 & 0x2000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_57;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  *((_DWORD *)a3 + 16) = self->_facetimeAction;
  *((_DWORD *)a3 + 39) |= 0x800u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 18) = self->_facetimeTimeDelay;
  *((_DWORD *)a3 + 39) |= 0x2000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 14) = self->_counter;
  *((_DWORD *)a3 + 39) |= 0x200u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((unsigned char *)a3 + 148) = self->_alertedMode;
  *((_DWORD *)a3 + 39) |= 0x1000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((unsigned char *)a3 + 152) = self->_isStallDetected;
  *((_DWORD *)a3 + 39) |= 0x10000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((unsigned char *)a3 + 151) = self->_isPCDetected;
  *((_DWORD *)a3 + 39) |= 0x8000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 30) = self->_videoErasure;
  *((_DWORD *)a3 + 39) |= 0x20000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 8) = self->_audioErasure;
  *((_DWORD *)a3 + 39) |= 8u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 11) = self->_cellRsrp;
  *((_DWORD *)a3 + 39) |= 0x40u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 12) = self->_cellRsrq;
  *((_DWORD *)a3 + 39) |= 0x80u;
  $F57CBE7E82B36495573539A3C92CBBA7 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      return;
    }
    goto LABEL_37;
  }
LABEL_66:
  *((_DWORD *)a3 + 13) = self->_cellSnr;
  *((_DWORD *)a3 + 39) |= 0x100u;
  if ((*(_DWORD *)&self->_has & 0x4000000) == 0) {
    return;
  }
LABEL_37:
  *((unsigned char *)a3 + 150) = self->_cellMode;
  *((_DWORD *)a3 + 39) |= 0x4000000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 156) |= 1u;
    $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_wifiRssi;
  *(_DWORD *)(v5 + 156) |= 2u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 140) = self->_wifiTxPER;
  *(_DWORD *)(v5 + 156) |= 0x400000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_5:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(void *)(v5 + 24) = self->_wifiSNR;
  *(_DWORD *)(v5 + 156) |= 4u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(unsigned char *)(v5 + 149) = self->_captiveNetworks;
  *(_DWORD *)(v5 + 156) |= 0x2000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_7:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 136) = self->_wifiRxRetry;
  *(_DWORD *)(v5 + 156) |= 0x200000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_8:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 128) = self->_wifiEstimatedBandwitdh;
  *(_DWORD *)(v5 + 156) |= 0x80000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 144) = self->_wifiTxPhyRate;
  *(_DWORD *)(v5 + 156) |= 0x800000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 132) = self->_wifiRxPhyRate;
  *(_DWORD *)(v5 + 156) |= 0x100000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 96) = self->_qbssLoad;
  *(_DWORD *)(v5 + 156) |= 0x4000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(_DWORD *)(v5 + 40) = self->_cca;
  *(_DWORD *)(v5 + 156) |= 0x20u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(_DWORD *)(v5 + 116) = self->_stationCount;
  *(_DWORD *)(v5 + 156) |= 0x10000u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(_DWORD *)(v5 + 60) = self->_dataLQM;
  *(_DWORD *)(v5 + 156) |= 0x400u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(_DWORD *)(v5 + 36) = self->_bssLoad;
  *(_DWORD *)(v5 + 156) |= 0x10u;
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_47:
  *(_DWORD *)(v5 + 124) = self->_voiceLQM;
  *(_DWORD *)(v5 + 156) |= 0x40000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 112) = self->_signalBar;
    *(_DWORD *)(v5 + 156) |= 0x8000u;
  }
LABEL_18:

  *(void *)(v6 + 104) = [(NSString *)self->_ratType copyWithZone:a3];
  *(void *)(v6 + 80) = [(NSString *)self->_iRATRecommendation copyWithZone:a3];

  *(void *)(v6 + 88) = [(NSString *)self->_iRATRecommendationReason copyWithZone:a3];
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) != 0)
  {
    *(_DWORD *)(v6 + 68) = self->_facetimePacketLoss;
    *(_DWORD *)(v6 + 156) |= 0x1000u;
    $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_20:
      if ((*(_WORD *)&v8 & 0x2000) == 0) {
        goto LABEL_21;
      }
      goto LABEL_51;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_20;
  }
  *(_DWORD *)(v6 + 64) = self->_facetimeAction;
  *(_DWORD *)(v6 + 156) |= 0x800u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x200) == 0) {
      goto LABEL_22;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(_DWORD *)(v6 + 72) = self->_facetimeTimeDelay;
  *(_DWORD *)(v6 + 156) |= 0x2000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(_DWORD *)(v6 + 56) = self->_counter;
  *(_DWORD *)(v6 + 156) |= 0x200u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(unsigned char *)(v6 + 148) = self->_alertedMode;
  *(_DWORD *)(v6 + 156) |= 0x1000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_55;
  }
LABEL_54:
  *(unsigned char *)(v6 + 152) = self->_isStallDetected;
  *(_DWORD *)(v6 + 156) |= 0x10000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(unsigned char *)(v6 + 151) = self->_isPCDetected;
  *(_DWORD *)(v6 + 156) |= 0x8000000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_27;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(_DWORD *)(v6 + 120) = self->_videoErasure;
  *(_DWORD *)(v6 + 156) |= 0x20000u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 32) = self->_audioErasure;
  *(_DWORD *)(v6 + 156) |= 8u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v8 & 0x80) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 44) = self->_cellRsrp;
  *(_DWORD *)(v6 + 156) |= 0x40u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_30;
    }
LABEL_60:
    *(_DWORD *)(v6 + 52) = self->_cellSnr;
    *(_DWORD *)(v6 + 156) |= 0x100u;
    if ((*(_DWORD *)&self->_has & 0x4000000) == 0) {
      return (id)v6;
    }
    goto LABEL_31;
  }
LABEL_59:
  *(_DWORD *)(v6 + 48) = self->_cellRsrq;
  *(_DWORD *)(v6 + 156) |= 0x80u;
  $F57CBE7E82B36495573539A3C92CBBA7 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) != 0) {
    goto LABEL_60;
  }
LABEL_30:
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
LABEL_31:
    *(unsigned char *)(v6 + 150) = self->_cellMode;
    *(_DWORD *)(v6 + 156) |= 0x4000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  int v7 = *((_DWORD *)a3 + 39);
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_162;
    }
  }
  else if (v7)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_wifiRssi != *((void *)a3 + 2)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v7 & 0x400000) == 0 || self->_wifiTxPER != *((_DWORD *)a3 + 35)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x400000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_wifiSNR != *((void *)a3 + 3)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v7 & 0x2000000) == 0) {
      goto LABEL_162;
    }
    if (self->_captiveNetworks)
    {
      if (!*((unsigned char *)a3 + 149)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)a3 + 149))
    {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x2000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v7 & 0x200000) == 0 || self->_wifiRxRetry != *((_DWORD *)a3 + 34)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x200000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
    if ((v7 & 0x80000) == 0 || self->_wifiEstimatedBandwitdh != *((_DWORD *)a3 + 32)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x80000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v7 & 0x800000) == 0 || self->_wifiTxPhyRate != *((_DWORD *)a3 + 36)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x800000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v7 & 0x100000) == 0 || self->_wifiRxPhyRate != *((_DWORD *)a3 + 33)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x100000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v7 & 0x4000) == 0 || self->_qbssLoad != *((_DWORD *)a3 + 24)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x4000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_cca != *((_DWORD *)a3 + 10)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v7 & 0x10000) == 0 || self->_stationCount != *((_DWORD *)a3 + 29)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x10000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v7 & 0x400) == 0 || self->_dataLQM != *((_DWORD *)a3 + 15)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x400) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_bssLoad != *((_DWORD *)a3 + 9)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v7 & 0x40000) == 0 || self->_voiceLQM != *((_DWORD *)a3 + 31)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x40000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v7 & 0x8000) == 0 || self->_signalBar != *((_DWORD *)a3 + 28)) {
      goto LABEL_162;
    }
  }
  else if ((v7 & 0x8000) != 0)
  {
    goto LABEL_162;
  }
  ratType = self->_ratType;
  if ((unint64_t)ratType | *((void *)a3 + 13))
  {
    int v5 = -[NSString isEqual:](ratType, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  iRATRecommendation = self->_iRATRecommendation;
  if ((unint64_t)iRATRecommendation | *((void *)a3 + 10))
  {
    int v5 = -[NSString isEqual:](iRATRecommendation, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  iRATRecommendationReason = self->_iRATRecommendationReason;
  if ((unint64_t)iRATRecommendationReason | *((void *)a3 + 11))
  {
    int v5 = -[NSString isEqual:](iRATRecommendationReason, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  $F57CBE7E82B36495573539A3C92CBBA7 v11 = self->_has;
  int v12 = *((_DWORD *)a3 + 39);
  if ((*(_WORD *)&v11 & 0x1000) != 0)
  {
    if ((v12 & 0x1000) == 0 || self->_facetimePacketLoss != *((_DWORD *)a3 + 17)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x1000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x800) != 0)
  {
    if ((v12 & 0x800) == 0 || self->_facetimeAction != *((_DWORD *)a3 + 16)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x800) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x2000) != 0)
  {
    if ((v12 & 0x2000) == 0 || self->_facetimeTimeDelay != *((_DWORD *)a3 + 18)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x2000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x200) != 0)
  {
    if ((v12 & 0x200) == 0 || self->_counter != *((_DWORD *)a3 + 14)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x200) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x1000000) != 0)
  {
    if ((v12 & 0x1000000) == 0) {
      goto LABEL_162;
    }
    if (self->_alertedMode)
    {
      if (!*((unsigned char *)a3 + 148)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)a3 + 148))
    {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x1000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x10000000) != 0)
  {
    if ((v12 & 0x10000000) == 0) {
      goto LABEL_162;
    }
    if (self->_isStallDetected)
    {
      if (!*((unsigned char *)a3 + 152)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)a3 + 152))
    {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x10000000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_DWORD *)&v11 & 0x8000000) != 0)
  {
    if ((v12 & 0x8000000) != 0)
    {
      if (self->_isPCDetected)
      {
        if (!*((unsigned char *)a3 + 151)) {
          goto LABEL_162;
        }
        goto LABEL_135;
      }
      if (!*((unsigned char *)a3 + 151)) {
        goto LABEL_135;
      }
    }
LABEL_162:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v12 & 0x8000000) != 0) {
    goto LABEL_162;
  }
LABEL_135:
  if ((*(_DWORD *)&v11 & 0x20000) != 0)
  {
    if ((v12 & 0x20000) == 0 || self->_videoErasure != *((_DWORD *)a3 + 30)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x20000) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v11 & 8) != 0)
  {
    if ((v12 & 8) == 0 || self->_audioErasure != *((_DWORD *)a3 + 8)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 8) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_cellRsrp != *((_DWORD *)a3 + 11)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_162;
  }
  if ((*(unsigned char *)&v11 & 0x80) != 0)
  {
    if ((v12 & 0x80) == 0 || self->_cellRsrq != *((_DWORD *)a3 + 12)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x80) != 0)
  {
    goto LABEL_162;
  }
  if ((*(_WORD *)&v11 & 0x100) != 0)
  {
    if ((v12 & 0x100) == 0 || self->_cellSnr != *((_DWORD *)a3 + 13)) {
      goto LABEL_162;
    }
  }
  else if ((v12 & 0x100) != 0)
  {
    goto LABEL_162;
  }
  LOBYTE(v5) = (v12 & 0x4000000) == 0;
  if ((*(_DWORD *)&v11 & 0x4000000) != 0)
  {
    if ((v12 & 0x4000000) == 0) {
      goto LABEL_162;
    }
    if (self->_cellMode)
    {
      if (!*((unsigned char *)a3 + 150)) {
        goto LABEL_162;
      }
    }
    else if (*((unsigned char *)a3 + 150))
    {
      goto LABEL_162;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $F57CBE7E82B36495573539A3C92CBBA7 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v37 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      uint64_t v36 = 2654435761 * self->_wifiRssi;
      if ((*(_DWORD *)&has & 0x400000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v37 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_4:
    uint64_t v35 = 2654435761 * self->_wifiTxPER;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v35 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_5:
    uint64_t v34 = 2654435761 * self->_wifiSNR;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v34 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_6:
    uint64_t v33 = 2654435761 * self->_captiveNetworks;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_7:
    uint64_t v32 = 2654435761 * self->_wifiRxRetry;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_8:
    uint64_t v31 = 2654435761 * self->_wifiEstimatedBandwitdh;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_9:
    uint64_t v30 = 2654435761 * self->_wifiTxPhyRate;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_10:
    uint64_t v29 = 2654435761 * self->_wifiRxPhyRate;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v29 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_11:
    uint64_t v28 = 2654435761 * self->_qbssLoad;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v28 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_12:
    uint64_t v27 = 2654435761 * self->_cca;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    uint64_t v4 = 2654435761 * self->_stationCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v4 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_14:
    uint64_t v5 = 2654435761 * self->_dataLQM;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_15:
    uint64_t v6 = 2654435761 * self->_bssLoad;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    uint64_t v7 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x40000) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v7 = 2654435761 * self->_voiceLQM;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_17:
    uint64_t v8 = 2654435761 * self->_signalBar;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v8 = 0;
LABEL_34:
  NSUInteger v9 = [(NSString *)self->_ratType hash];
  NSUInteger v10 = [(NSString *)self->_iRATRecommendation hash];
  NSUInteger v11 = [(NSString *)self->_iRATRecommendationReason hash];
  $F57CBE7E82B36495573539A3C92CBBA7 v12 = self->_has;
  if ((*(_WORD *)&v12 & 0x1000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_facetimePacketLoss;
    if ((*(_WORD *)&v12 & 0x800) != 0)
    {
LABEL_36:
      uint64_t v14 = 2654435761 * self->_facetimeAction;
      if ((*(_WORD *)&v12 & 0x2000) != 0) {
        goto LABEL_37;
      }
      goto LABEL_50;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&v12 & 0x800) != 0) {
      goto LABEL_36;
    }
  }
  uint64_t v14 = 0;
  if ((*(_WORD *)&v12 & 0x2000) != 0)
  {
LABEL_37:
    uint64_t v15 = 2654435761 * self->_facetimeTimeDelay;
    if ((*(_WORD *)&v12 & 0x200) != 0) {
      goto LABEL_38;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v15 = 0;
  if ((*(_WORD *)&v12 & 0x200) != 0)
  {
LABEL_38:
    uint64_t v16 = 2654435761 * self->_counter;
    if ((*(_DWORD *)&v12 & 0x1000000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v12 & 0x1000000) != 0)
  {
LABEL_39:
    uint64_t v17 = 2654435761 * self->_alertedMode;
    if ((*(_DWORD *)&v12 & 0x10000000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v17 = 0;
  if ((*(_DWORD *)&v12 & 0x10000000) != 0)
  {
LABEL_40:
    uint64_t v18 = 2654435761 * self->_isStallDetected;
    if ((*(_DWORD *)&v12 & 0x8000000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v12 & 0x8000000) != 0)
  {
LABEL_41:
    uint64_t v19 = 2654435761 * self->_isPCDetected;
    if ((*(_DWORD *)&v12 & 0x20000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v12 & 0x20000) != 0)
  {
LABEL_42:
    uint64_t v20 = 2654435761 * self->_videoErasure;
    if ((*(unsigned char *)&v12 & 8) != 0) {
      goto LABEL_43;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v20 = 0;
  if ((*(unsigned char *)&v12 & 8) != 0)
  {
LABEL_43:
    uint64_t v21 = 2654435761 * self->_audioErasure;
    if ((*(unsigned char *)&v12 & 0x40) != 0) {
      goto LABEL_44;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v21 = 0;
  if ((*(unsigned char *)&v12 & 0x40) != 0)
  {
LABEL_44:
    uint64_t v22 = 2654435761 * self->_cellRsrp;
    if ((*(unsigned char *)&v12 & 0x80) != 0) {
      goto LABEL_45;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v22 = 0;
  if ((*(unsigned char *)&v12 & 0x80) != 0)
  {
LABEL_45:
    uint64_t v23 = 2654435761 * self->_cellRsrq;
    if ((*(_WORD *)&v12 & 0x100) != 0) {
      goto LABEL_46;
    }
LABEL_59:
    uint64_t v24 = 0;
    if ((*(_DWORD *)&v12 & 0x4000000) != 0) {
      goto LABEL_47;
    }
LABEL_60:
    uint64_t v25 = 0;
    return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
  }
LABEL_58:
  uint64_t v23 = 0;
  if ((*(_WORD *)&v12 & 0x100) == 0) {
    goto LABEL_59;
  }
LABEL_46:
  uint64_t v24 = 2654435761 * self->_cellSnr;
  if ((*(_DWORD *)&v12 & 0x4000000) == 0) {
    goto LABEL_60;
  }
LABEL_47:
  uint64_t v25 = 2654435761 * self->_cellMode;
  return v36 ^ v37 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25;
}

- (void)mergeFrom:(id)a3
{
  int v5 = *((_DWORD *)a3 + 39);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)a3 + 39);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x400000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_41;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiRssi = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x400000) == 0)
  {
LABEL_4:
    if ((v5 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_wifiTxPER = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 4) == 0)
  {
LABEL_5:
    if ((v5 & 0x2000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_wifiSNR = *((void *)a3 + 3);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_captiveNetworks = *((unsigned char *)a3 + 149);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x200000) == 0)
  {
LABEL_7:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_wifiRxRetry = *((_DWORD *)a3 + 34);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x80000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_wifiEstimatedBandwitdh = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_wifiTxPhyRate = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x100000) == 0)
  {
LABEL_10:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_wifiRxPhyRate = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x4000) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_qbssLoad = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_cca = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x10000) == 0)
  {
LABEL_13:
    if ((v5 & 0x400) == 0) {
      goto LABEL_14;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_stationCount = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x400) == 0)
  {
LABEL_14:
    if ((v5 & 0x10) == 0) {
      goto LABEL_15;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_dataLQM = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x10) == 0)
  {
LABEL_15:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_bssLoad = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 39);
  if ((v5 & 0x40000) == 0)
  {
LABEL_16:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_53:
  self->_voiceLQM = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x40000u;
  if ((*((_DWORD *)a3 + 39) & 0x8000) != 0)
  {
LABEL_17:
    self->_signalBar = *((_DWORD *)a3 + 28);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_18:
  if (*((void *)a3 + 13)) {
    -[AWDWRMFacetimeRecommendation setRatType:](self, "setRatType:");
  }
  if (*((void *)a3 + 10)) {
    -[AWDWRMFacetimeRecommendation setIRATRecommendation:](self, "setIRATRecommendation:");
  }
  if (*((void *)a3 + 11)) {
    -[AWDWRMFacetimeRecommendation setIRATRecommendationReason:](self, "setIRATRecommendationReason:");
  }
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x1000) != 0)
  {
    self->_facetimePacketLoss = *((_DWORD *)a3 + 17);
    *(_DWORD *)&self->_has |= 0x1000u;
    int v6 = *((_DWORD *)a3 + 39);
    if ((v6 & 0x800) == 0)
    {
LABEL_26:
      if ((v6 & 0x2000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_57;
    }
  }
  else if ((v6 & 0x800) == 0)
  {
    goto LABEL_26;
  }
  self->_facetimeAction = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x800u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x2000) == 0)
  {
LABEL_27:
    if ((v6 & 0x200) == 0) {
      goto LABEL_28;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_facetimeTimeDelay = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x200) == 0)
  {
LABEL_28:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_counter = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x200u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_29:
    if ((v6 & 0x10000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_alertedMode = *((unsigned char *)a3 + 148);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x10000000) == 0)
  {
LABEL_30:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_isStallDetected = *((unsigned char *)a3 + 152);
  *(_DWORD *)&self->_has |= 0x10000000u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_31:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_isPCDetected = *((unsigned char *)a3 + 151);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((v6 & 8) == 0) {
      goto LABEL_33;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_videoErasure = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 8) == 0)
  {
LABEL_33:
    if ((v6 & 0x40) == 0) {
      goto LABEL_34;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_audioErasure = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 8u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x40) == 0)
  {
LABEL_34:
    if ((v6 & 0x80) == 0) {
      goto LABEL_35;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_cellRsrp = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x40u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x80) == 0)
  {
LABEL_35:
    if ((v6 & 0x100) == 0) {
      goto LABEL_36;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_cellRsrq = *((_DWORD *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x80u;
  int v6 = *((_DWORD *)a3 + 39);
  if ((v6 & 0x100) == 0)
  {
LABEL_36:
    if ((v6 & 0x4000000) == 0) {
      return;
    }
    goto LABEL_37;
  }
LABEL_66:
  self->_cellSnr = *((_DWORD *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x100u;
  if ((*((_DWORD *)a3 + 39) & 0x4000000) == 0) {
    return;
  }
LABEL_37:
  self->_cellMode = *((unsigned char *)a3 + 150);
  *(_DWORD *)&self->_has |= 0x4000000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int64_t)wifiRssi
{
  return self->_wifiRssi;
}

- (unsigned)wifiTxPER
{
  return self->_wifiTxPER;
}

- (int64_t)wifiSNR
{
  return self->_wifiSNR;
}

- (BOOL)captiveNetworks
{
  return self->_captiveNetworks;
}

- (unsigned)wifiRxRetry
{
  return self->_wifiRxRetry;
}

- (unsigned)wifiEstimatedBandwitdh
{
  return self->_wifiEstimatedBandwitdh;
}

- (unsigned)wifiTxPhyRate
{
  return self->_wifiTxPhyRate;
}

- (unsigned)wifiRxPhyRate
{
  return self->_wifiRxPhyRate;
}

- (unsigned)qbssLoad
{
  return self->_qbssLoad;
}

- (unsigned)cca
{
  return self->_cca;
}

- (unsigned)stationCount
{
  return self->_stationCount;
}

- (unsigned)dataLQM
{
  return self->_dataLQM;
}

- (unsigned)bssLoad
{
  return self->_bssLoad;
}

- (unsigned)voiceLQM
{
  return self->_voiceLQM;
}

- (unsigned)signalBar
{
  return self->_signalBar;
}

- (NSString)ratType
{
  return self->_ratType;
}

- (void)setRatType:(id)a3
{
}

- (NSString)iRATRecommendation
{
  return self->_iRATRecommendation;
}

- (void)setIRATRecommendation:(id)a3
{
}

- (NSString)iRATRecommendationReason
{
  return self->_iRATRecommendationReason;
}

- (void)setIRATRecommendationReason:(id)a3
{
}

- (unsigned)facetimePacketLoss
{
  return self->_facetimePacketLoss;
}

- (unsigned)facetimeAction
{
  return self->_facetimeAction;
}

- (unsigned)facetimeTimeDelay
{
  return self->_facetimeTimeDelay;
}

- (unsigned)counter
{
  return self->_counter;
}

- (BOOL)alertedMode
{
  return self->_alertedMode;
}

- (BOOL)isStallDetected
{
  return self->_isStallDetected;
}

- (BOOL)isPCDetected
{
  return self->_isPCDetected;
}

- (unsigned)videoErasure
{
  return self->_videoErasure;
}

- (unsigned)audioErasure
{
  return self->_audioErasure;
}

- (int)cellRsrp
{
  return self->_cellRsrp;
}

- (int)cellRsrq
{
  return self->_cellRsrq;
}

- (int)cellSnr
{
  return self->_cellSnr;
}

- (BOOL)cellMode
{
  return self->_cellMode;
}

@end