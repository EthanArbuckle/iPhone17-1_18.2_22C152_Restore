@interface AWDWRMLinkPrefChangeEvent
- (BOOL)captiveNetworks;
- (BOOL)hasAppType;
- (BOOL)hasBcnPer;
- (BOOL)hasBssLoad;
- (BOOL)hasCallStatus;
- (BOOL)hasCaptiveNetworks;
- (BOOL)hasCcStatusUpdate;
- (BOOL)hasCcStatusUpdateDelay;
- (BOOL)hasCca;
- (BOOL)hasCellRSRP;
- (BOOL)hasCellSINR;
- (BOOL)hasChangeDirection;
- (BOOL)hasDataAppStatus;
- (BOOL)hasDataLQM;
- (BOOL)hasDataLinkPref;
- (BOOL)hasDecisionVIBE;
- (BOOL)hasDecisionVO;
- (BOOL)hasExpectedThroughputVIBE;
- (BOOL)hasExpectedThroughputVO;
- (BOOL)hasLqmScoreWifi;
- (BOOL)hasMotionState;
- (BOOL)hasPacketLifetimeVIBE;
- (BOOL)hasPkgLifeTimeVO;
- (BOOL)hasPktLossRateVO;
- (BOOL)hasQbssLoad;
- (BOOL)hasRatType;
- (BOOL)hasServiceType;
- (BOOL)hasServiceTypeOfLastGrant;
- (BOOL)hasSignalBar;
- (BOOL)hasStationCount;
- (BOOL)hasTimeToLastDecision;
- (BOOL)hasTimeToLastReverseDecision;
- (BOOL)hasTimeToLastReverseGrant;
- (BOOL)hasTimestamp;
- (BOOL)hasVoiceLQM;
- (BOOL)hasVoiceLinkPref;
- (BOOL)hasWifiEstimatedBandwitdh;
- (BOOL)hasWifiRssi;
- (BOOL)hasWifiRxPhyRate;
- (BOOL)hasWifiRxRetry;
- (BOOL)hasWifiSNR;
- (BOOL)hasWifiTxPER;
- (BOOL)hasWifiTxPhyRate;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)appType;
- (NSString)ratType;
- (id)ccStatusUpdateAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)motionStateAsString:(int)a3;
- (int)StringAsCcStatusUpdate:(id)a3;
- (int)StringAsMotionState:(id)a3;
- (int)ccStatusUpdate;
- (int)cellRSRP;
- (int)cellSINR;
- (int)dataLQM;
- (int)lqmScoreWifi;
- (int)motionState;
- (int64_t)wifiRssi;
- (int64_t)wifiSNR;
- (unint64_t)ccStatusUpdateDelay;
- (unint64_t)changeReasonsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)bcnPer;
- (unsigned)bssLoad;
- (unsigned)callStatus;
- (unsigned)cca;
- (unsigned)changeDirection;
- (unsigned)changeReasonAtIndex:(unint64_t)a3;
- (unsigned)changeReasons;
- (unsigned)dataAppStatus;
- (unsigned)dataLinkPref;
- (unsigned)decisionVIBE;
- (unsigned)decisionVO;
- (unsigned)expectedThroughputVIBE;
- (unsigned)expectedThroughputVO;
- (unsigned)packetLifetimeVIBE;
- (unsigned)pkgLifeTimeVO;
- (unsigned)pktLossRateVO;
- (unsigned)qbssLoad;
- (unsigned)serviceType;
- (unsigned)serviceTypeOfLastGrant;
- (unsigned)signalBar;
- (unsigned)stationCount;
- (unsigned)timeToLastDecision;
- (unsigned)timeToLastReverseDecision;
- (unsigned)timeToLastReverseGrant;
- (unsigned)voiceLQM;
- (unsigned)voiceLinkPref;
- (unsigned)wifiEstimatedBandwitdh;
- (unsigned)wifiRxPhyRate;
- (unsigned)wifiRxRetry;
- (unsigned)wifiTxPER;
- (unsigned)wifiTxPhyRate;
- (void)addChangeReason:(unsigned int)a3;
- (void)clearChangeReasons;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAppType:(id)a3;
- (void)setBcnPer:(unsigned int)a3;
- (void)setBssLoad:(unsigned int)a3;
- (void)setCallStatus:(unsigned int)a3;
- (void)setCaptiveNetworks:(BOOL)a3;
- (void)setCcStatusUpdate:(int)a3;
- (void)setCcStatusUpdateDelay:(unint64_t)a3;
- (void)setCca:(unsigned int)a3;
- (void)setCellRSRP:(int)a3;
- (void)setCellSINR:(int)a3;
- (void)setChangeDirection:(unsigned int)a3;
- (void)setChangeReasons:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDataAppStatus:(unsigned int)a3;
- (void)setDataLQM:(int)a3;
- (void)setDataLinkPref:(unsigned int)a3;
- (void)setDecisionVIBE:(unsigned int)a3;
- (void)setDecisionVO:(unsigned int)a3;
- (void)setExpectedThroughputVIBE:(unsigned int)a3;
- (void)setExpectedThroughputVO:(unsigned int)a3;
- (void)setHasBcnPer:(BOOL)a3;
- (void)setHasBssLoad:(BOOL)a3;
- (void)setHasCallStatus:(BOOL)a3;
- (void)setHasCaptiveNetworks:(BOOL)a3;
- (void)setHasCcStatusUpdate:(BOOL)a3;
- (void)setHasCcStatusUpdateDelay:(BOOL)a3;
- (void)setHasCca:(BOOL)a3;
- (void)setHasCellRSRP:(BOOL)a3;
- (void)setHasCellSINR:(BOOL)a3;
- (void)setHasChangeDirection:(BOOL)a3;
- (void)setHasDataAppStatus:(BOOL)a3;
- (void)setHasDataLQM:(BOOL)a3;
- (void)setHasDataLinkPref:(BOOL)a3;
- (void)setHasDecisionVIBE:(BOOL)a3;
- (void)setHasDecisionVO:(BOOL)a3;
- (void)setHasExpectedThroughputVIBE:(BOOL)a3;
- (void)setHasExpectedThroughputVO:(BOOL)a3;
- (void)setHasLqmScoreWifi:(BOOL)a3;
- (void)setHasMotionState:(BOOL)a3;
- (void)setHasPacketLifetimeVIBE:(BOOL)a3;
- (void)setHasPkgLifeTimeVO:(BOOL)a3;
- (void)setHasPktLossRateVO:(BOOL)a3;
- (void)setHasQbssLoad:(BOOL)a3;
- (void)setHasServiceType:(BOOL)a3;
- (void)setHasServiceTypeOfLastGrant:(BOOL)a3;
- (void)setHasSignalBar:(BOOL)a3;
- (void)setHasStationCount:(BOOL)a3;
- (void)setHasTimeToLastDecision:(BOOL)a3;
- (void)setHasTimeToLastReverseDecision:(BOOL)a3;
- (void)setHasTimeToLastReverseGrant:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasVoiceLQM:(BOOL)a3;
- (void)setHasVoiceLinkPref:(BOOL)a3;
- (void)setHasWifiEstimatedBandwitdh:(BOOL)a3;
- (void)setHasWifiRssi:(BOOL)a3;
- (void)setHasWifiRxPhyRate:(BOOL)a3;
- (void)setHasWifiRxRetry:(BOOL)a3;
- (void)setHasWifiSNR:(BOOL)a3;
- (void)setHasWifiTxPER:(BOOL)a3;
- (void)setHasWifiTxPhyRate:(BOOL)a3;
- (void)setLqmScoreWifi:(int)a3;
- (void)setMotionState:(int)a3;
- (void)setPacketLifetimeVIBE:(unsigned int)a3;
- (void)setPkgLifeTimeVO:(unsigned int)a3;
- (void)setPktLossRateVO:(unsigned int)a3;
- (void)setQbssLoad:(unsigned int)a3;
- (void)setRatType:(id)a3;
- (void)setServiceType:(unsigned int)a3;
- (void)setServiceTypeOfLastGrant:(unsigned int)a3;
- (void)setSignalBar:(unsigned int)a3;
- (void)setStationCount:(unsigned int)a3;
- (void)setTimeToLastDecision:(unsigned int)a3;
- (void)setTimeToLastReverseDecision:(unsigned int)a3;
- (void)setTimeToLastReverseGrant:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setVoiceLQM:(unsigned int)a3;
- (void)setVoiceLinkPref:(unsigned int)a3;
- (void)setWifiEstimatedBandwitdh:(unsigned int)a3;
- (void)setWifiRssi:(int64_t)a3;
- (void)setWifiRxPhyRate:(unsigned int)a3;
- (void)setWifiRxRetry:(unsigned int)a3;
- (void)setWifiSNR:(int64_t)a3;
- (void)setWifiTxPER:(unsigned int)a3;
- (void)setWifiTxPhyRate:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMLinkPrefChangeEvent

- (void)dealloc
{
  [(AWDWRMLinkPrefChangeEvent *)self setAppType:0];
  PBRepeatedUInt32Clear();
  [(AWDWRMLinkPrefChangeEvent *)self setRatType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMLinkPrefChangeEvent;
  [(AWDWRMLinkPrefChangeEvent *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setChangeDirection:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_changeDirection = a3;
}

- (void)setHasChangeDirection:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasChangeDirection
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setServiceType:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_serviceType = a3;
}

- (void)setHasServiceType:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasServiceType
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setVoiceLinkPref:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_voiceLinkPref = a3;
}

- (void)setHasVoiceLinkPref:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasVoiceLinkPref
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setDataLinkPref:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_dataLinkPref = a3;
}

- (void)setHasDataLinkPref:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDataLinkPref
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCallStatus:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_callStatus = a3;
}

- (void)setHasCallStatus:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCallStatus
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDataAppStatus:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_dataAppStatus = a3;
}

- (void)setHasDataAppStatus:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasDataAppStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (BOOL)hasAppType
{
  return self->_appType != 0;
}

- (int)motionState
{
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    return self->_motionState;
  }
  else {
    return 0;
  }
}

- (void)setMotionState:(int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_motionState = a3;
}

- (void)setHasMotionState:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasMotionState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (id)motionStateAsString:(int)a3
{
  if (a3 >= 4) {
    return [NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA3B8[a3];
  }
}

- (int)StringAsMotionState:(id)a3
{
  if ([a3 isEqualToString:@"STATIONARY"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"WALKING"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"RUNNING"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"VEHICULAR"]) {
    return 3;
  }
  return 0;
}

- (unint64_t)changeReasonsCount
{
  return self->_changeReasons.count;
}

- (unsigned)changeReasons
{
  return self->_changeReasons.list;
}

- (void)clearChangeReasons
{
}

- (void)addChangeReason:(unsigned int)a3
{
}

- (unsigned)changeReasonAtIndex:(unint64_t)a3
{
  p_changeReasons = &self->_changeReasons;
  unint64_t count = self->_changeReasons.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_changeReasons->list[a3];
}

- (void)setChangeReasons:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setWifiRssi:(int64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasWifiRssi
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiTxPER
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setWifiSNR:(int64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_wifiSNR = a3;
}

- (void)setHasWifiSNR:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasWifiSNR
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCaptiveNetworks:(BOOL)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_captiveNetworks = a3;
}

- (void)setHasCaptiveNetworks:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasCaptiveNetworks
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setWifiEstimatedBandwitdh:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_wifiEstimatedBandwitdh = a3;
}

- (void)setHasWifiEstimatedBandwitdh:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasWifiEstimatedBandwitdh
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setWifiTxPhyRate:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_wifiTxPhyRate = a3;
}

- (void)setHasWifiTxPhyRate:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiTxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setWifiRxPhyRate:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_wifiRxPhyRate = a3;
}

- (void)setHasWifiRxPhyRate:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasWifiRxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setQbssLoad:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_qbssLoad = a3;
}

- (void)setHasQbssLoad:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasQbssLoad
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setCca:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_cca = a3;
}

- (void)setHasCca:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCca
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setStationCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_stationCount = a3;
}

- (void)setHasStationCount:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasStationCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setBcnPer:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_bcnPer = a3;
}

- (void)setHasBcnPer:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasBcnPer
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setLqmScoreWifi:(int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_lqmScoreWifi = a3;
}

- (void)setHasLqmScoreWifi:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasLqmScoreWifi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setExpectedThroughputVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_expectedThroughputVO = a3;
}

- (void)setHasExpectedThroughputVO:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasExpectedThroughputVO
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setPkgLifeTimeVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_pkgLifeTimeVO = a3;
}

- (void)setHasPkgLifeTimeVO:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasPkgLifeTimeVO
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setPktLossRateVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_pktLossRateVO = a3;
}

- (void)setHasPktLossRateVO:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasPktLossRateVO
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setDecisionVO:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_decisionVO = a3;
}

- (void)setHasDecisionVO:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasDecisionVO
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setExpectedThroughputVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_expectedThroughputVIBE = a3;
}

- (void)setHasExpectedThroughputVIBE:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasExpectedThroughputVIBE
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setPacketLifetimeVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_packetLifetimeVIBE = a3;
}

- (void)setHasPacketLifetimeVIBE:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasPacketLifetimeVIBE
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setDecisionVIBE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_decisionVIBE = a3;
}

- (void)setHasDecisionVIBE:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasDecisionVIBE
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setDataLQM:(int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_dataLQM = a3;
}

- (void)setHasDataLQM:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasDataLQM
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setBssLoad:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_bssLoad = a3;
}

- (void)setHasBssLoad:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasBssLoad
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setVoiceLQM:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_voiceLQM = a3;
}

- (void)setHasVoiceLQM:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasVoiceLQM
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setSignalBar:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_signalBar = a3;
}

- (void)setHasSignalBar:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasSignalBar
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (BOOL)hasRatType
{
  return self->_ratType != 0;
}

- (void)setCellRSRP:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_cellRSRP = a3;
}

- (void)setHasCellRSRP:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCellRSRP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCellSINR:(int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_cellSINR = a3;
}

- (void)setHasCellSINR:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCellSINR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (int)ccStatusUpdate
{
  if ((*(unsigned char *)&self->_has & 0x80) != 0) {
    return self->_ccStatusUpdate;
  }
  else {
    return 0;
  }
}

- (void)setCcStatusUpdate:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_ccStatusUpdate = a3;
}

- (void)setHasCcStatusUpdate:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCcStatusUpdate
{
  return *(unsigned char *)&self->_has >> 7;
}

- (id)ccStatusUpdateAsString:(int)a3
{
  if (a3 >= 3) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA3D8[a3];
  }
}

- (int)StringAsCcStatusUpdate:(id)a3
{
  if ([a3 isEqualToString:@"POSITIVE"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"NEGATIVE"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"UNKOWN"]) {
    return 2;
  }
  return 0;
}

- (void)setCcStatusUpdateDelay:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_ccStatusUpdateDelay = a3;
}

- (void)setHasCcStatusUpdateDelay:(BOOL)a3
{
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasCcStatusUpdateDelay
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTimeToLastDecision:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_timeToLastDecision = a3;
}

- (void)setHasTimeToLastDecision:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasTimeToLastDecision
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setTimeToLastReverseDecision:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_timeToLastReverseDecision = a3;
}

- (void)setHasTimeToLastReverseDecision:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasTimeToLastReverseDecision
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTimeToLastReverseGrant:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_timeToLastReverseGrant = a3;
}

- (void)setHasTimeToLastReverseGrant:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasTimeToLastReverseGrant
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setServiceTypeOfLastGrant:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_serviceTypeOfLastGrant = a3;
}

- (void)setHasServiceTypeOfLastGrant:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($84E7E0E7C47E7A1784FD197DC212BB13)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasServiceTypeOfLastGrant
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMLinkPrefChangeEvent;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMLinkPrefChangeEvent description](&v3, sel_description), -[AWDWRMLinkPrefChangeEvent dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x2000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_changeDirection] forKey:@"changeDirection"];
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_serviceType] forKey:@"serviceType"];
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_voiceLinkPref] forKey:@"voiceLinkPref"];
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dataLinkPref] forKey:@"dataLinkPref"];
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_callStatus] forKey:@"callStatus"];
  if ((*(void *)&self->_has & 0x1000) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dataAppStatus] forKey:@"dataAppStatus"];
LABEL_9:
  appType = self->_appType;
  if (appType) {
    [v3 setObject:appType forKey:@"appType"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    uint64_t motionState = self->_motionState;
    if (motionState >= 4) {
      v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_motionState];
    }
    else {
      v7 = off_2641BA3B8[motionState];
    }
    [v3 setObject:v7 forKey:@"motionState"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"changeReason"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithLongLong:self->_wifiRssi] forKey:@"wifiRssi"];
    $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
    if ((*(void *)&v8 & 0x2000000000) == 0)
    {
LABEL_25:
      if ((*(unsigned char *)&v8 & 8) == 0) {
        goto LABEL_26;
      }
      goto LABEL_62;
    }
  }
  else if ((*(void *)&v8 & 0x2000000000) == 0)
  {
    goto LABEL_25;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTxPER] forKey:@"wifiTxPER"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_26:
    if ((*(void *)&v8 & 0x8000000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithLongLong:self->_wifiSNR] forKey:@"wifiSNR"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x8000000000) == 0)
  {
LABEL_27:
    if ((*(void *)&v8 & 0x1000000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithBool:self->_captiveNetworks] forKey:@"captiveNetworks"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000) == 0)
  {
LABEL_28:
    if ((*(void *)&v8 & 0x400000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRxRetry] forKey:@"wifiRxRetry"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x400000000) == 0)
  {
LABEL_29:
    if ((*(void *)&v8 & 0x4000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiEstimatedBandwitdh] forKey:@"wifiEstimatedBandwitdh"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&v8 & 0x800000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTxPhyRate] forKey:@"wifiTxPhyRate"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x800000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRxPhyRate] forKey:@"wifiRxPhyRate"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_33;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_qbssLoad] forKey:@"qbssLoad"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cca] forKey:@"cca"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_stationCount] forKey:@"stationCount"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x80000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bcnPer] forKey:@"bcnPer"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&v8 & 0x40000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithInt:self->_lqmScoreWifi] forKey:@"lqmScoreWifi"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_expectedThroughputVO] forKey:@"expectedThroughputVO"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pkgLifeTimeVO] forKey:@"pkgLifeTimeVO"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_pktLossRateVO] forKey:@"pktLossRateVO"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_decisionVO] forKey:@"decisionVO"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_expectedThroughputVIBE] forKey:@"expectedThroughputVI_BE"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_42:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_packetLifetimeVIBE] forKey:@"packetLifetimeVI_BE"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_43:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_decisionVIBE] forKey:@"decisionVI_BE"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_44:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_45;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithInt:self->_dataLQM] forKey:@"dataLQM"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_45:
    if ((*(void *)&v8 & 0x100000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bssLoad] forKey:@"bssLoad"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_voiceLQM] forKey:@"voiceLQM"];
  if ((*(void *)&self->_has & 0x8000000) != 0) {
LABEL_47:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_signalBar] forKey:@"signalBar"];
LABEL_48:
  ratType = self->_ratType;
  if (ratType) {
    [v3 setObject:ratType forKey:@"ratType"];
  }
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_cellRSRP] forKey:@"cellRSRP"];
    $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_52:
      if ((*(unsigned char *)&v10 & 0x80) == 0) {
        goto LABEL_53;
      }
      goto LABEL_86;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_52;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_cellSINR] forKey:@"cellSINR"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v10 & 1) == 0) {
      goto LABEL_54;
    }
    goto LABEL_90;
  }
LABEL_86:
  uint64_t ccStatusUpdate = self->_ccStatusUpdate;
  if (ccStatusUpdate >= 3) {
    v13 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_ccStatusUpdate];
  }
  else {
    v13 = off_2641BA3D8[ccStatusUpdate];
  }
  [v3 setObject:v13 forKey:@"ccStatusUpdate"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 1) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v10 & 0x20000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_91;
  }
LABEL_90:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_ccStatusUpdateDelay] forKey:@"ccStatusUpdateDelay"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000000) == 0)
  {
LABEL_55:
    if ((*(_DWORD *)&v10 & 0x40000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_timeToLastDecision] forKey:@"timeToLastDecision"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000000) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v10 & 0x80000000) == 0) {
      goto LABEL_57;
    }
LABEL_93:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_timeToLastReverseGrant] forKey:@"timeToLastReverseGrant"];
    if ((*(void *)&self->_has & 0x4000000) == 0) {
      return v3;
    }
    goto LABEL_58;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_timeToLastReverseDecision] forKey:@"timeToLastReverseDecision"];
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000000) != 0) {
    goto LABEL_93;
  }
LABEL_57:
  if ((*(_DWORD *)&v10 & 0x4000000) != 0) {
LABEL_58:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_serviceTypeOfLastGrant] forKey:@"serviceTypeOfLastGrant"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMLinkPrefChangeEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x2000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_54;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_57:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x1000) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_appType) {
    PBDataWriterWriteStringField();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_changeReasons.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_changeReasons.count);
  }
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
    PBDataWriterWriteSint64Field();
    $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
    if ((*(void *)&v6 & 0x2000000000) == 0)
    {
LABEL_18:
      if ((*(unsigned char *)&v6 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_61;
    }
  }
  else if ((*(void *)&v6 & 0x2000000000) == 0)
  {
    goto LABEL_18;
  }
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_19:
    if ((*(void *)&v6 & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteSint64Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(void *)&v6 & 0x8000000000) == 0)
  {
LABEL_20:
    if ((*(void *)&v6 & 0x1000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteBOOLField();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(void *)&v6 & 0x1000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&v6 & 0x400000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(void *)&v6 & 0x400000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v6 & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(void *)&v6 & 0x800000000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000000) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteInt32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_37:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_38;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteInt32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_38:
    if ((*(void *)&v6 & 0x100000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x8000000) != 0) {
LABEL_40:
  }
    PBDataWriterWriteUint32Field();
LABEL_41:
  if (self->_ratType) {
    PBDataWriterWriteStringField();
  }
  $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
  if ((*(_WORD *)&v7 & 0x200) != 0)
  {
    PBDataWriterWriteSint32Field();
    $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
    if ((*(_WORD *)&v7 & 0x400) == 0)
    {
LABEL_45:
      if ((*(unsigned char *)&v7 & 0x80) == 0) {
        goto LABEL_46;
      }
      goto LABEL_85;
    }
  }
  else if ((*(_WORD *)&v7 & 0x400) == 0)
  {
    goto LABEL_45;
  }
  PBDataWriterWriteSint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 0x80) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v7 & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteInt32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
  if ((*(unsigned char *)&v7 & 1) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v7 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint64Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x20000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v7 & 0x40000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x40000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v7 & 0x80000000) == 0) {
      goto LABEL_50;
    }
LABEL_89:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_has & 0x4000000) == 0) {
      return;
    }
    goto LABEL_90;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $84E7E0E7C47E7A1784FD197DC212BB13 v7 = self->_has;
  if ((*(_DWORD *)&v7 & 0x80000000) != 0) {
    goto LABEL_89;
  }
LABEL_50:
  if ((*(_DWORD *)&v7 & 0x4000000) == 0) {
    return;
  }
LABEL_90:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    *((void *)a3 + 5) = self->_timestamp;
    *(void *)((char *)a3 + 228) |= 2uLL;
    $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x2000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 25) = self->_changeDirection;
  *(void *)((char *)a3 + 228) |= 0x800uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 42) = self->_serviceType;
  *(void *)((char *)a3 + 228) |= 0x2000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)a3 + 50) = self->_voiceLinkPref;
  *(void *)((char *)a3 + 228) |= 0x200000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 28) = self->_dataLinkPref;
  *(void *)((char *)a3 + 228) |= 0x4000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_59:
  *((_DWORD *)a3 + 20) = self->_callStatus;
  *(void *)((char *)a3 + 228) |= 0x40uLL;
  if ((*(void *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 26) = self->_dataAppStatus;
    *(void *)((char *)a3 + 228) |= 0x1000uLL;
  }
LABEL_9:
  if (self->_appType) {
    [a3 setAppType:];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_motionState;
    *(void *)((char *)a3 + 228) |= 0x100000uLL;
  }
  if ([(AWDWRMLinkPrefChangeEvent *)self changeReasonsCount])
  {
    [a3 clearChangeReasons];
    unint64_t v6 = [(AWDWRMLinkPrefChangeEvent *)self changeReasonsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addChangeReason:-[AWDWRMLinkPrefChangeEvent changeReasonAtIndex:](self, "changeReasonAtIndex:", i)];
    }
  }
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 4) != 0)
  {
    *((void *)a3 + 6) = self->_wifiRssi;
    *(void *)((char *)a3 + 228) |= 4uLL;
    $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
    if ((*(void *)&v9 & 0x2000000000) == 0)
    {
LABEL_19:
      if ((*(unsigned char *)&v9 & 8) == 0) {
        goto LABEL_20;
      }
      goto LABEL_63;
    }
  }
  else if ((*(void *)&v9 & 0x2000000000) == 0)
  {
    goto LABEL_19;
  }
  *((_DWORD *)a3 + 54) = self->_wifiTxPER;
  *(void *)((char *)a3 + 228) |= 0x2000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_20:
    if ((*(void *)&v9 & 0x8000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 7) = self->_wifiSNR;
  *(void *)((char *)a3 + 228) |= 8uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(void *)&v9 & 0x8000000000) == 0)
  {
LABEL_21:
    if ((*(void *)&v9 & 0x1000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((unsigned char *)a3 + 224) = self->_captiveNetworks;
  *(void *)((char *)a3 + 228) |= 0x8000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(void *)&v9 & 0x1000000000) == 0)
  {
LABEL_22:
    if ((*(void *)&v9 & 0x400000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 53) = self->_wifiRxRetry;
  *(void *)((char *)a3 + 228) |= 0x1000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(void *)&v9 & 0x400000000) == 0)
  {
LABEL_23:
    if ((*(void *)&v9 & 0x4000000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 51) = self->_wifiEstimatedBandwitdh;
  *(void *)((char *)a3 + 228) |= 0x400000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(void *)&v9 & 0x4000000000) == 0)
  {
LABEL_24:
    if ((*(void *)&v9 & 0x800000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 55) = self->_wifiTxPhyRate;
  *(void *)((char *)a3 + 228) |= 0x4000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(void *)&v9 & 0x800000000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 52) = self->_wifiRxPhyRate;
  *(void *)((char *)a3 + 228) |= 0x800000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_26:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)a3 + 38) = self->_qbssLoad;
  *(void *)((char *)a3 + 228) |= 0x1000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x10000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((_DWORD *)a3 + 22) = self->_cca;
  *(void *)((char *)a3 + 228) |= 0x100uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v9 & 0x10) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((_DWORD *)a3 + 45) = self->_stationCount;
  *(void *)((char *)a3 + 228) |= 0x10000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x80000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((_DWORD *)a3 + 18) = self->_bcnPer;
  *(void *)((char *)a3 + 228) |= 0x10uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v9 & 0x40000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((_DWORD *)a3 + 33) = self->_lqmScoreWifi;
  *(void *)((char *)a3 + 228) |= 0x80000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v9 & 0x400000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 32) = self->_expectedThroughputVO;
  *(void *)((char *)a3 + 228) |= 0x40000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 36) = self->_pkgLifeTimeVO;
  *(void *)((char *)a3 + 228) |= 0x400000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&v9 & 0x10000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 37) = self->_pktLossRateVO;
  *(void *)((char *)a3 + 228) |= 0x800000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v9 & 0x20000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 30) = self->_decisionVO;
  *(void *)((char *)a3 + 228) |= 0x10000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v9 & 0x200000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 31) = self->_expectedThroughputVIBE;
  *(void *)((char *)a3 + 228) |= 0x20000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x200000) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v9 & 0x8000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 35) = self->_packetLifetimeVIBE;
  *(void *)((char *)a3 + 228) |= 0x200000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x8000) == 0)
  {
LABEL_37:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 29) = self->_decisionVIBE;
  *(void *)((char *)a3 + 228) |= 0x8000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v9 & 0x20) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)a3 + 27) = self->_dataLQM;
  *(void *)((char *)a3 + 228) |= 0x2000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x20) == 0)
  {
LABEL_39:
    if ((*(void *)&v9 & 0x100000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)a3 + 19) = self->_bssLoad;
  *(void *)((char *)a3 + 228) |= 0x20uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(void *)&v9 & 0x100000000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v9 & 0x8000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
LABEL_83:
  *((_DWORD *)a3 + 49) = self->_voiceLQM;
  *(void *)((char *)a3 + 228) |= 0x100000000uLL;
  if ((*(void *)&self->_has & 0x8000000) != 0)
  {
LABEL_41:
    *((_DWORD *)a3 + 44) = self->_signalBar;
    *(void *)((char *)a3 + 228) |= 0x8000000uLL;
  }
LABEL_42:
  if (self->_ratType) {
    [a3 setRatType:];
  }
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_WORD *)&v10 & 0x200) != 0)
  {
    *((_DWORD *)a3 + 23) = self->_cellRSRP;
    *(void *)((char *)a3 + 228) |= 0x200uLL;
    $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
    if ((*(_WORD *)&v10 & 0x400) == 0)
    {
LABEL_46:
      if ((*(unsigned char *)&v10 & 0x80) == 0) {
        goto LABEL_47;
      }
      goto LABEL_87;
    }
  }
  else if ((*(_WORD *)&v10 & 0x400) == 0)
  {
    goto LABEL_46;
  }
  *((_DWORD *)a3 + 24) = self->_cellSINR;
  *(void *)((char *)a3 + 228) |= 0x400uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 0x80) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v10 & 1) == 0) {
      goto LABEL_48;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 21) = self->_ccStatusUpdate;
  *(void *)((char *)a3 + 228) |= 0x80uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(unsigned char *)&v10 & 1) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v10 & 0x20000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((void *)a3 + 4) = self->_ccStatusUpdateDelay;
  *(void *)((char *)a3 + 228) |= 1uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x20000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v10 & 0x40000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 46) = self->_timeToLastDecision;
  *(void *)((char *)a3 + 228) |= 0x20000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x40000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v10 & 0x80000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)a3 + 47) = self->_timeToLastReverseDecision;
  *(void *)((char *)a3 + 228) |= 0x40000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
  if ((*(_DWORD *)&v10 & 0x80000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v10 & 0x4000000) == 0) {
      return;
    }
    goto LABEL_52;
  }
LABEL_91:
  *((_DWORD *)a3 + 48) = self->_timeToLastReverseGrant;
  *(void *)((char *)a3 + 228) |= 0x80000000uLL;
  if ((*(void *)&self->_has & 0x4000000) == 0) {
    return;
  }
LABEL_52:
  *((_DWORD *)a3 + 43) = self->_serviceTypeOfLastGrant;
  *(void *)((char *)a3 + 228) |= 0x4000000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    *(void *)(v5 + 40) = self->_timestamp;
    *(void *)(v5 + 228) |= 2uLL;
    $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
    if ((*(_WORD *)&has & 0x800) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x2000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&has & 0x800) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 100) = self->_changeDirection;
  *(void *)(v5 + 228) |= 0x800uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(_DWORD *)(v5 + 168) = self->_serviceType;
  *(void *)(v5 + 228) |= 0x2000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(_DWORD *)(v5 + 200) = self->_voiceLinkPref;
  *(void *)(v5 + 228) |= 0x200000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(_DWORD *)(v5 + 112) = self->_dataLinkPref;
  *(void *)(v5 + 228) |= 0x4000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_51:
  *(_DWORD *)(v5 + 80) = self->_callStatus;
  *(void *)(v5 + 228) |= 0x40uLL;
  if ((*(void *)&self->_has & 0x1000) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 104) = self->_dataAppStatus;
    *(void *)(v5 + 228) |= 0x1000uLL;
  }
LABEL_9:

  *(void *)(v6 + 64) = [(NSString *)self->_appType copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 136) = self->_motionState;
    *(void *)(v6 + 228) |= 0x100000uLL;
  }
  PBRepeatedUInt32Copy();
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) != 0)
  {
    *(void *)(v6 + 48) = self->_wifiRssi;
    *(void *)(v6 + 228) |= 4uLL;
    $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
    if ((*(void *)&v8 & 0x2000000000) == 0)
    {
LABEL_13:
      if ((*(unsigned char *)&v8 & 8) == 0) {
        goto LABEL_14;
      }
      goto LABEL_55;
    }
  }
  else if ((*(void *)&v8 & 0x2000000000) == 0)
  {
    goto LABEL_13;
  }
  *(_DWORD *)(v6 + 216) = self->_wifiTxPER;
  *(void *)(v6 + 228) |= 0x2000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_14:
    if ((*(void *)&v8 & 0x8000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_56;
  }
LABEL_55:
  *(void *)(v6 + 56) = self->_wifiSNR;
  *(void *)(v6 + 228) |= 8uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x8000000000) == 0)
  {
LABEL_15:
    if ((*(void *)&v8 & 0x1000000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_57;
  }
LABEL_56:
  *(unsigned char *)(v6 + 224) = self->_captiveNetworks;
  *(void *)(v6 + 228) |= 0x8000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x1000000000) == 0)
  {
LABEL_16:
    if ((*(void *)&v8 & 0x400000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v6 + 212) = self->_wifiRxRetry;
  *(void *)(v6 + 228) |= 0x1000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x400000000) == 0)
  {
LABEL_17:
    if ((*(void *)&v8 & 0x4000000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v6 + 204) = self->_wifiEstimatedBandwitdh;
  *(void *)(v6 + 228) |= 0x400000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000) == 0)
  {
LABEL_18:
    if ((*(void *)&v8 & 0x800000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v6 + 220) = self->_wifiTxPhyRate;
  *(void *)(v6 + 228) |= 0x4000000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x800000000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v6 + 208) = self->_wifiRxPhyRate;
  *(void *)(v6 + 228) |= 0x800000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v6 + 152) = self->_qbssLoad;
  *(void *)(v6 + 228) |= 0x1000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x10000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v6 + 88) = self->_cca;
  *(void *)(v6 + 228) |= 0x100uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v6 + 180) = self->_stationCount;
  *(void *)(v6 + 228) |= 0x10000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&v8 & 0x80000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v6 + 72) = self->_bcnPer;
  *(void *)(v6 + 228) |= 0x10uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v6 + 132) = self->_lqmScoreWifi;
  *(void *)(v6 + 228) |= 0x80000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v6 + 128) = self->_expectedThroughputVO;
  *(void *)(v6 + 228) |= 0x40000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v6 + 144) = self->_pkgLifeTimeVO;
  *(void *)(v6 + 228) |= 0x400000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_69;
  }
LABEL_68:
  *(_DWORD *)(v6 + 148) = self->_pktLossRateVO;
  *(void *)(v6 + 228) |= 0x800000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_70;
  }
LABEL_69:
  *(_DWORD *)(v6 + 120) = self->_decisionVO;
  *(void *)(v6 + 228) |= 0x10000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_71;
  }
LABEL_70:
  *(_DWORD *)(v6 + 124) = self->_expectedThroughputVIBE;
  *(void *)(v6 + 228) |= 0x20000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_72;
  }
LABEL_71:
  *(_DWORD *)(v6 + 140) = self->_packetLifetimeVIBE;
  *(void *)(v6 + 228) |= 0x200000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v6 + 116) = self->_decisionVIBE;
  *(void *)(v6 + 228) |= 0x8000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_33;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v6 + 108) = self->_dataLQM;
  *(void *)(v6 + 228) |= 0x2000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_33:
    if ((*(void *)&v8 & 0x100000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v6 + 76) = self->_bssLoad;
  *(void *)(v6 + 228) |= 0x20uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_75:
  *(_DWORD *)(v6 + 196) = self->_voiceLQM;
  *(void *)(v6 + 228) |= 0x100000000uLL;
  if ((*(void *)&self->_has & 0x8000000) != 0)
  {
LABEL_35:
    *(_DWORD *)(v6 + 176) = self->_signalBar;
    *(void *)(v6 + 228) |= 0x8000000uLL;
  }
LABEL_36:

  *(void *)(v6 + 160) = [(NSString *)self->_ratType copyWithZone:a3];
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) != 0)
  {
    *(_DWORD *)(v6 + 92) = self->_cellRSRP;
    *(void *)(v6 + 228) |= 0x200uLL;
    $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x400) == 0)
    {
LABEL_38:
      if ((*(unsigned char *)&v9 & 0x80) == 0) {
        goto LABEL_39;
      }
      goto LABEL_79;
    }
  }
  else if ((*(_WORD *)&v9 & 0x400) == 0)
  {
    goto LABEL_38;
  }
  *(_DWORD *)(v6 + 96) = self->_cellSINR;
  *(void *)(v6 + 228) |= 0x400uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x80) == 0)
  {
LABEL_39:
    if ((*(unsigned char *)&v9 & 1) == 0) {
      goto LABEL_40;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v6 + 84) = self->_ccStatusUpdate;
  *(void *)(v6 + 228) |= 0x80uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 1) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v9 & 0x20000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(void *)(v6 + 32) = self->_ccStatusUpdateDelay;
  *(void *)(v6 + 228) |= 1uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v9 & 0x40000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v6 + 184) = self->_timeToLastDecision;
  *(void *)(v6 + 228) |= 0x20000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v9 & 0x80000000) == 0) {
      goto LABEL_43;
    }
LABEL_83:
    *(_DWORD *)(v6 + 192) = self->_timeToLastReverseGrant;
    *(void *)(v6 + 228) |= 0x80000000uLL;
    if ((*(void *)&self->_has & 0x4000000) == 0) {
      return (id)v6;
    }
    goto LABEL_44;
  }
LABEL_82:
  *(_DWORD *)(v6 + 188) = self->_timeToLastReverseDecision;
  *(void *)(v6 + 228) |= 0x40000000uLL;
  $84E7E0E7C47E7A1784FD197DC212BB13 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x80000000) != 0) {
    goto LABEL_83;
  }
LABEL_43:
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
LABEL_44:
    *(_DWORD *)(v6 + 172) = self->_serviceTypeOfLastGrant;
    *(void *)(v6 + 228) |= 0x4000000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
    uint64_t v7 = *(void *)((char *)a3 + 228);
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_timestamp != *((void *)a3 + 5)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_211;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_changeDirection != *((_DWORD *)a3 + 25)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_211;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_serviceType != *((_DWORD *)a3 + 42)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_211;
    }
    if ((*(void *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_voiceLinkPref != *((_DWORD *)a3 + 50)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_211;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_dataLinkPref != *((_DWORD *)a3 + 28)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_211;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_callStatus != *((_DWORD *)a3 + 20)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_211;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_dataAppStatus != *((_DWORD *)a3 + 26)) {
        goto LABEL_211;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_211;
    }
    appType = self->_appType;
    if ((unint64_t)appType | *((void *)a3 + 8))
    {
      int IsEqual = -[NSString isEqual:](appType, "isEqual:");
      if (!IsEqual) {
        return IsEqual;
      }
      $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
    }
    uint64_t v9 = *(void *)((char *)a3 + 228);
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v9 & 0x100000) == 0 || self->_motionState != *((_DWORD *)a3 + 34)) {
        goto LABEL_211;
      }
    }
    else if ((v9 & 0x100000) != 0)
    {
      goto LABEL_211;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
      uint64_t v11 = *(void *)((char *)a3 + 228);
      if ((*(unsigned char *)&v10 & 4) != 0)
      {
        if ((v11 & 4) == 0 || self->_wifiRssi != *((void *)a3 + 6)) {
          goto LABEL_211;
        }
      }
      else if ((v11 & 4) != 0)
      {
        goto LABEL_211;
      }
      if ((*(void *)&v10 & 0x2000000000) != 0)
      {
        if ((v11 & 0x2000000000) == 0 || self->_wifiTxPER != *((_DWORD *)a3 + 54)) {
          goto LABEL_211;
        }
      }
      else if ((v11 & 0x2000000000) != 0)
      {
        goto LABEL_211;
      }
      if ((*(unsigned char *)&v10 & 8) != 0)
      {
        if ((v11 & 8) == 0 || self->_wifiSNR != *((void *)a3 + 7)) {
          goto LABEL_211;
        }
      }
      else if ((v11 & 8) != 0)
      {
        goto LABEL_211;
      }
      if ((*(void *)&v10 & 0x8000000000) == 0)
      {
        if ((v11 & 0x8000000000) != 0) {
          goto LABEL_211;
        }
        goto LABEL_69;
      }
      if ((v11 & 0x8000000000) != 0)
      {
        if (self->_captiveNetworks)
        {
          if (!*((unsigned char *)a3 + 224)) {
            goto LABEL_211;
          }
          goto LABEL_69;
        }
        if (!*((unsigned char *)a3 + 224))
        {
LABEL_69:
          if ((*(void *)&v10 & 0x1000000000) != 0)
          {
            if ((v11 & 0x1000000000) == 0 || self->_wifiRxRetry != *((_DWORD *)a3 + 53)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x1000000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(void *)&v10 & 0x400000000) != 0)
          {
            if ((v11 & 0x400000000) == 0 || self->_wifiEstimatedBandwitdh != *((_DWORD *)a3 + 51)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x400000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(void *)&v10 & 0x4000000000) != 0)
          {
            if ((v11 & 0x4000000000) == 0 || self->_wifiTxPhyRate != *((_DWORD *)a3 + 55)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x4000000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(void *)&v10 & 0x800000000) != 0)
          {
            if ((v11 & 0x800000000) == 0 || self->_wifiRxPhyRate != *((_DWORD *)a3 + 52)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x800000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x1000000) != 0)
          {
            if ((v11 & 0x1000000) == 0 || self->_qbssLoad != *((_DWORD *)a3 + 38)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x1000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_WORD *)&v10 & 0x100) != 0)
          {
            if ((v11 & 0x100) == 0 || self->_cca != *((_DWORD *)a3 + 22)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x100) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x10000000) != 0)
          {
            if ((v11 & 0x10000000) == 0 || self->_stationCount != *((_DWORD *)a3 + 45)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x10000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(unsigned char *)&v10 & 0x10) != 0)
          {
            if ((v11 & 0x10) == 0 || self->_bcnPer != *((_DWORD *)a3 + 18)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x10) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x80000) != 0)
          {
            if ((v11 & 0x80000) == 0 || self->_lqmScoreWifi != *((_DWORD *)a3 + 33)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x80000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x40000) != 0)
          {
            if ((v11 & 0x40000) == 0 || self->_expectedThroughputVO != *((_DWORD *)a3 + 32)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x40000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x400000) != 0)
          {
            if ((v11 & 0x400000) == 0 || self->_pkgLifeTimeVO != *((_DWORD *)a3 + 36)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x400000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x800000) != 0)
          {
            if ((v11 & 0x800000) == 0 || self->_pktLossRateVO != *((_DWORD *)a3 + 37)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x800000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x10000) != 0)
          {
            if ((v11 & 0x10000) == 0 || self->_decisionVO != *((_DWORD *)a3 + 30)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x10000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x20000) != 0)
          {
            if ((v11 & 0x20000) == 0 || self->_expectedThroughputVIBE != *((_DWORD *)a3 + 31)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x20000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x200000) != 0)
          {
            if ((v11 & 0x200000) == 0 || self->_packetLifetimeVIBE != *((_DWORD *)a3 + 35)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x200000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_WORD *)&v10 & 0x8000) != 0)
          {
            if ((v11 & 0x8000) == 0 || self->_decisionVIBE != *((_DWORD *)a3 + 29)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x8000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_WORD *)&v10 & 0x2000) != 0)
          {
            if ((v11 & 0x2000) == 0 || self->_dataLQM != *((_DWORD *)a3 + 27)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x2000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(unsigned char *)&v10 & 0x20) != 0)
          {
            if ((v11 & 0x20) == 0 || self->_bssLoad != *((_DWORD *)a3 + 19)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x20) != 0)
          {
            goto LABEL_211;
          }
          if ((*(void *)&v10 & 0x100000000) != 0)
          {
            if ((v11 & 0x100000000) == 0 || self->_voiceLQM != *((_DWORD *)a3 + 49)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x100000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x8000000) != 0)
          {
            if ((v11 & 0x8000000) == 0 || self->_signalBar != *((_DWORD *)a3 + 44)) {
              goto LABEL_211;
            }
          }
          else if ((v11 & 0x8000000) != 0)
          {
            goto LABEL_211;
          }
          ratType = self->_ratType;
          if ((unint64_t)ratType | *((void *)a3 + 20))
          {
            int IsEqual = -[NSString isEqual:](ratType, "isEqual:");
            if (!IsEqual) {
              return IsEqual;
            }
            $84E7E0E7C47E7A1784FD197DC212BB13 v10 = self->_has;
          }
          uint64_t v13 = *(void *)((char *)a3 + 228);
          if ((*(_WORD *)&v10 & 0x200) != 0)
          {
            if ((v13 & 0x200) == 0 || self->_cellRSRP != *((_DWORD *)a3 + 23)) {
              goto LABEL_211;
            }
          }
          else if ((v13 & 0x200) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_WORD *)&v10 & 0x400) != 0)
          {
            if ((v13 & 0x400) == 0 || self->_cellSINR != *((_DWORD *)a3 + 24)) {
              goto LABEL_211;
            }
          }
          else if ((v13 & 0x400) != 0)
          {
            goto LABEL_211;
          }
          if ((*(unsigned char *)&v10 & 0x80) != 0)
          {
            if ((v13 & 0x80) == 0 || self->_ccStatusUpdate != *((_DWORD *)a3 + 21)) {
              goto LABEL_211;
            }
          }
          else if ((v13 & 0x80) != 0)
          {
            goto LABEL_211;
          }
          if (*(unsigned char *)&v10)
          {
            if ((v13 & 1) == 0 || self->_ccStatusUpdateDelay != *((void *)a3 + 4)) {
              goto LABEL_211;
            }
          }
          else if (v13)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x20000000) != 0)
          {
            if ((v13 & 0x20000000) == 0 || self->_timeToLastDecision != *((_DWORD *)a3 + 46)) {
              goto LABEL_211;
            }
          }
          else if ((v13 & 0x20000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x40000000) != 0)
          {
            if ((v13 & 0x40000000) == 0 || self->_timeToLastReverseDecision != *((_DWORD *)a3 + 47)) {
              goto LABEL_211;
            }
          }
          else if ((v13 & 0x40000000) != 0)
          {
            goto LABEL_211;
          }
          if ((*(_DWORD *)&v10 & 0x80000000) != 0)
          {
            if ((v13 & 0x80000000) == 0 || self->_timeToLastReverseGrant != *((_DWORD *)a3 + 48)) {
              goto LABEL_211;
            }
          }
          else if ((v13 & 0x80000000) != 0)
          {
            goto LABEL_211;
          }
          LOBYTE(IsEqual) = (*(void *)((unsigned char *)a3 + 228) & 0x4000000) == 0;
          if ((*(_DWORD *)&v10 & 0x4000000) != 0)
          {
            if ((v13 & 0x4000000) == 0 || self->_serviceTypeOfLastGrant != *((_DWORD *)a3 + 43)) {
              goto LABEL_211;
            }
            LOBYTE(IsEqual) = 1;
          }
          return IsEqual;
        }
      }
LABEL_211:
      LOBYTE(IsEqual) = 0;
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $84E7E0E7C47E7A1784FD197DC212BB13 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0)
  {
    unint64_t v50 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x800) != 0)
    {
LABEL_3:
      uint64_t v49 = 2654435761 * self->_changeDirection;
      if ((*(_DWORD *)&has & 0x2000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v50 = 0;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v49 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_4:
    uint64_t v48 = 2654435761 * self->_serviceType;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v48 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_5:
    uint64_t v47 = 2654435761 * self->_voiceLinkPref;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v47 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_6:
    uint64_t v46 = 2654435761 * self->_dataLinkPref;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v45 = 0;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v46 = 0;
  if ((*(unsigned char *)&has & 0x40) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v45 = 2654435761 * self->_callStatus;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_8:
    uint64_t v44 = 2654435761 * self->_dataAppStatus;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v44 = 0;
LABEL_16:
  NSUInteger v43 = [(NSString *)self->_appType hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    uint64_t v42 = 2654435761 * self->_motionState;
  }
  else {
    uint64_t v42 = 0;
  }
  uint64_t v41 = PBRepeatedUInt32Hash();
  $84E7E0E7C47E7A1784FD197DC212BB13 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
    uint64_t v40 = 2654435761 * self->_wifiRssi;
    if ((*(void *)&v4 & 0x2000000000) != 0)
    {
LABEL_21:
      uint64_t v39 = 2654435761 * self->_wifiTxPER;
      if ((*(unsigned char *)&v4 & 8) != 0) {
        goto LABEL_22;
      }
      goto LABEL_46;
    }
  }
  else
  {
    uint64_t v40 = 0;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v39 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_22:
    uint64_t v38 = 2654435761 * self->_wifiSNR;
    if ((*(void *)&v4 & 0x8000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v38 = 0;
  if ((*(void *)&v4 & 0x8000000000) != 0)
  {
LABEL_23:
    uint64_t v37 = 2654435761 * self->_captiveNetworks;
    if ((*(void *)&v4 & 0x1000000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v37 = 0;
  if ((*(void *)&v4 & 0x1000000000) != 0)
  {
LABEL_24:
    uint64_t v36 = 2654435761 * self->_wifiRxRetry;
    if ((*(void *)&v4 & 0x400000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v36 = 0;
  if ((*(void *)&v4 & 0x400000000) != 0)
  {
LABEL_25:
    uint64_t v35 = 2654435761 * self->_wifiEstimatedBandwitdh;
    if ((*(void *)&v4 & 0x4000000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v35 = 0;
  if ((*(void *)&v4 & 0x4000000000) != 0)
  {
LABEL_26:
    uint64_t v34 = 2654435761 * self->_wifiTxPhyRate;
    if ((*(void *)&v4 & 0x800000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_51;
  }
LABEL_50:
  uint64_t v34 = 0;
  if ((*(void *)&v4 & 0x800000000) != 0)
  {
LABEL_27:
    uint64_t v33 = 2654435761 * self->_wifiRxPhyRate;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_52;
  }
LABEL_51:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_28:
    uint64_t v32 = 2654435761 * self->_qbssLoad;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_29;
    }
    goto LABEL_53;
  }
LABEL_52:
  uint64_t v32 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_29:
    uint64_t v31 = 2654435761 * self->_cca;
    if ((*(_DWORD *)&v4 & 0x10000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_54;
  }
LABEL_53:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&v4 & 0x10000000) != 0)
  {
LABEL_30:
    uint64_t v30 = 2654435761 * self->_stationCount;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_31;
    }
    goto LABEL_55;
  }
LABEL_54:
  uint64_t v30 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_31:
    uint64_t v29 = 2654435761 * self->_bcnPer;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v29 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) != 0)
  {
LABEL_32:
    uint64_t v28 = 2654435761 * self->_lqmScoreWifi;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_57;
  }
LABEL_56:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_33:
    uint64_t v27 = 2654435761 * self->_expectedThroughputVO;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_58;
  }
LABEL_57:
  uint64_t v27 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_34:
    uint64_t v26 = 2654435761 * self->_pkgLifeTimeVO;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_59;
  }
LABEL_58:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_35:
    uint64_t v25 = 2654435761 * self->_pktLossRateVO;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_60;
  }
LABEL_59:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_36:
    uint64_t v23 = 2654435761 * self->_decisionVO;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_61;
  }
LABEL_60:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_37:
    uint64_t v5 = 2654435761 * self->_expectedThroughputVIBE;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_62;
  }
LABEL_61:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_38:
    uint64_t v6 = 2654435761 * self->_packetLifetimeVIBE;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_63;
  }
LABEL_62:
  uint64_t v6 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_39:
    uint64_t v7 = 2654435761 * self->_decisionVIBE;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_64;
  }
LABEL_63:
  uint64_t v7 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_40:
    uint64_t v8 = 2654435761 * self->_dataLQM;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_41;
    }
    goto LABEL_65;
  }
LABEL_64:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_41:
    uint64_t v9 = 2654435761 * self->_bssLoad;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_42;
    }
LABEL_66:
    uint64_t v10 = 0;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_67;
  }
LABEL_65:
  uint64_t v9 = 0;
  if ((*(void *)&v4 & 0x100000000) == 0) {
    goto LABEL_66;
  }
LABEL_42:
  uint64_t v10 = 2654435761 * self->_voiceLQM;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
LABEL_43:
    uint64_t v11 = 2654435761 * self->_signalBar;
    goto LABEL_68;
  }
LABEL_67:
  uint64_t v11 = 0;
LABEL_68:
  NSUInteger v12 = [(NSString *)self->_ratType hash];
  $84E7E0E7C47E7A1784FD197DC212BB13 v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    uint64_t v14 = 2654435761 * self->_cellRSRP;
    if ((*(_WORD *)&v13 & 0x400) != 0)
    {
LABEL_70:
      uint64_t v15 = 2654435761 * self->_cellSINR;
      if ((*(unsigned char *)&v13 & 0x80) != 0) {
        goto LABEL_71;
      }
      goto LABEL_79;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(_WORD *)&v13 & 0x400) != 0) {
      goto LABEL_70;
    }
  }
  uint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 0x80) != 0)
  {
LABEL_71:
    uint64_t v16 = 2654435761 * self->_ccStatusUpdate;
    if (*(unsigned char *)&v13) {
      goto LABEL_72;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v16 = 0;
  if (*(unsigned char *)&v13)
  {
LABEL_72:
    unint64_t v17 = 2654435761u * self->_ccStatusUpdateDelay;
    if ((*(_DWORD *)&v13 & 0x20000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_81;
  }
LABEL_80:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&v13 & 0x20000000) != 0)
  {
LABEL_73:
    uint64_t v18 = 2654435761 * self->_timeToLastDecision;
    if ((*(_DWORD *)&v13 & 0x40000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v13 & 0x40000000) != 0)
  {
LABEL_74:
    uint64_t v19 = 2654435761 * self->_timeToLastReverseDecision;
    if ((*(_DWORD *)&v13 & 0x80000000) != 0) {
      goto LABEL_75;
    }
LABEL_83:
    uint64_t v20 = 0;
    if ((*(_DWORD *)&v13 & 0x4000000) != 0) {
      goto LABEL_76;
    }
LABEL_84:
    uint64_t v21 = 0;
    return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v43 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
  }
LABEL_82:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v13 & 0x80000000) == 0) {
    goto LABEL_83;
  }
LABEL_75:
  uint64_t v20 = 2654435761 * self->_timeToLastReverseGrant;
  if ((*(_DWORD *)&v13 & 0x4000000) == 0) {
    goto LABEL_84;
  }
LABEL_76:
  uint64_t v21 = 2654435761 * self->_serviceTypeOfLastGrant;
  return v49 ^ v50 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v43 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = *(void *)((char *)a3 + 228);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 5);
    *(void *)&self->_has |= 2uLL;
    uint64_t v5 = *(void *)((char *)a3 + 228);
    if ((v5 & 0x800) == 0)
    {
LABEL_3:
      if ((v5 & 0x2000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_55;
    }
  }
  else if ((v5 & 0x800) == 0)
  {
    goto LABEL_3;
  }
  self->_changeDirection = *((_DWORD *)a3 + 25);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v5 = *(void *)((char *)a3 + 228);
  if ((v5 & 0x2000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_serviceType = *((_DWORD *)a3 + 42);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 228);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_voiceLinkPref = *((_DWORD *)a3 + 50);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 228);
  if ((v5 & 0x4000) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_dataLinkPref = *((_DWORD *)a3 + 28);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v5 = *(void *)((char *)a3 + 228);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_58:
  self->_callStatus = *((_DWORD *)a3 + 20);
  *(void *)&self->_has |= 0x40uLL;
  if ((*(void *)((unsigned char *)a3 + 228) & 0x1000) != 0)
  {
LABEL_8:
    self->_dataAppStatus = *((_DWORD *)a3 + 26);
    *(void *)&self->_has |= 0x1000uLL;
  }
LABEL_9:
  if (*((void *)a3 + 8)) {
    -[AWDWRMLinkPrefChangeEvent setAppType:](self, "setAppType:");
  }
  if ((*((unsigned char *)a3 + 230) & 0x10) != 0)
  {
    self->_uint64_t motionState = *((_DWORD *)a3 + 34);
    *(void *)&self->_has |= 0x100000uLL;
  }
  uint64_t v6 = [a3 changeReasonsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDWRMLinkPrefChangeEvent addChangeReason:](self, "addChangeReason:", [a3 changeReasonAtIndex:i]);
  }
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 4) != 0)
  {
    self->_wifiRssuint64_t i = *((void *)a3 + 6);
    *(void *)&self->_has |= 4uLL;
    uint64_t v9 = *(void *)((char *)a3 + 228);
    if ((v9 & 0x2000000000) == 0)
    {
LABEL_18:
      if ((v9 & 8) == 0) {
        goto LABEL_19;
      }
      goto LABEL_62;
    }
  }
  else if ((v9 & 0x2000000000) == 0)
  {
    goto LABEL_18;
  }
  self->_wifiTxPER = *((_DWORD *)a3 + 54);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 8) == 0)
  {
LABEL_19:
    if ((v9 & 0x8000000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_wifiSNR = *((void *)a3 + 7);
  *(void *)&self->_has |= 8uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x8000000000) == 0)
  {
LABEL_20:
    if ((v9 & 0x1000000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_captiveNetworks = *((unsigned char *)a3 + 224);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x1000000000) == 0)
  {
LABEL_21:
    if ((v9 & 0x400000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_wifiRxRetry = *((_DWORD *)a3 + 53);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x400000000) == 0)
  {
LABEL_22:
    if ((v9 & 0x4000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_wifiEstimatedBandwitdh = *((_DWORD *)a3 + 51);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x4000000000) == 0)
  {
LABEL_23:
    if ((v9 & 0x800000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_wifiTxPhyRate = *((_DWORD *)a3 + 55);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x800000000) == 0)
  {
LABEL_24:
    if ((v9 & 0x1000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_wifiRxPhyRate = *((_DWORD *)a3 + 52);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x1000000) == 0)
  {
LABEL_25:
    if ((v9 & 0x100) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_qbssLoad = *((_DWORD *)a3 + 38);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x100) == 0)
  {
LABEL_26:
    if ((v9 & 0x10000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_cca = *((_DWORD *)a3 + 22);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x10000000) == 0)
  {
LABEL_27:
    if ((v9 & 0x10) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_stationCount = *((_DWORD *)a3 + 45);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x10) == 0)
  {
LABEL_28:
    if ((v9 & 0x80000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_bcnPer = *((_DWORD *)a3 + 18);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x80000) == 0)
  {
LABEL_29:
    if ((v9 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_lqmScoreWifuint64_t i = *((_DWORD *)a3 + 33);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x40000) == 0)
  {
LABEL_30:
    if ((v9 & 0x400000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_expectedThroughputVO = *((_DWORD *)a3 + 32);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x400000) == 0)
  {
LABEL_31:
    if ((v9 & 0x800000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_pkgLifeTimeVO = *((_DWORD *)a3 + 36);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x800000) == 0)
  {
LABEL_32:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_pktLossRateVO = *((_DWORD *)a3 + 37);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x10000) == 0)
  {
LABEL_33:
    if ((v9 & 0x20000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_decisionVO = *((_DWORD *)a3 + 30);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x20000) == 0)
  {
LABEL_34:
    if ((v9 & 0x200000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_expectedThroughputVIBE = *((_DWORD *)a3 + 31);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x200000) == 0)
  {
LABEL_35:
    if ((v9 & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_packetLifetimeVIBE = *((_DWORD *)a3 + 35);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x8000) == 0)
  {
LABEL_36:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_decisionVIBE = *((_DWORD *)a3 + 29);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x2000) == 0)
  {
LABEL_37:
    if ((v9 & 0x20) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_dataLQM = *((_DWORD *)a3 + 27);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x20) == 0)
  {
LABEL_38:
    if ((v9 & 0x100000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_bssLoad = *((_DWORD *)a3 + 19);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v9 = *(void *)((char *)a3 + 228);
  if ((v9 & 0x100000000) == 0)
  {
LABEL_39:
    if ((v9 & 0x8000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_40;
  }
LABEL_82:
  self->_voiceLQM = *((_DWORD *)a3 + 49);
  *(void *)&self->_has |= 0x100000000uLL;
  if ((*(void *)((unsigned char *)a3 + 228) & 0x8000000) != 0)
  {
LABEL_40:
    self->_signalBar = *((_DWORD *)a3 + 44);
    *(void *)&self->_has |= 0x8000000uLL;
  }
LABEL_41:
  if (*((void *)a3 + 20)) {
    -[AWDWRMLinkPrefChangeEvent setRatType:](self, "setRatType:");
  }
  uint64_t v10 = *(void *)((char *)a3 + 228);
  if ((v10 & 0x200) != 0)
  {
    self->_cellRSRP = *((_DWORD *)a3 + 23);
    *(void *)&self->_has |= 0x200uLL;
    uint64_t v10 = *(void *)((char *)a3 + 228);
    if ((v10 & 0x400) == 0)
    {
LABEL_45:
      if ((v10 & 0x80) == 0) {
        goto LABEL_46;
      }
      goto LABEL_86;
    }
  }
  else if ((v10 & 0x400) == 0)
  {
    goto LABEL_45;
  }
  self->_cellSINR = *((_DWORD *)a3 + 24);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v10 = *(void *)((char *)a3 + 228);
  if ((v10 & 0x80) == 0)
  {
LABEL_46:
    if ((v10 & 1) == 0) {
      goto LABEL_47;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_uint64_t ccStatusUpdate = *((_DWORD *)a3 + 21);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v10 = *(void *)((char *)a3 + 228);
  if ((v10 & 1) == 0)
  {
LABEL_47:
    if ((v10 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_ccStatusUpdateDelay = *((void *)a3 + 4);
  *(void *)&self->_has |= 1uLL;
  uint64_t v10 = *(void *)((char *)a3 + 228);
  if ((v10 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v10 & 0x40000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_timeToLastDecision = *((_DWORD *)a3 + 46);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v10 = *(void *)((char *)a3 + 228);
  if ((v10 & 0x40000000) == 0)
  {
LABEL_49:
    if ((v10 & 0x80000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_timeToLastReverseDecision = *((_DWORD *)a3 + 47);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v10 = *(void *)((char *)a3 + 228);
  if ((v10 & 0x80000000) == 0)
  {
LABEL_50:
    if ((v10 & 0x4000000) == 0) {
      return;
    }
    goto LABEL_51;
  }
LABEL_90:
  self->_timeToLastReverseGrant = *((_DWORD *)a3 + 48);
  *(void *)&self->_has |= 0x80000000uLL;
  if ((*(void *)((unsigned char *)a3 + 228) & 0x4000000) == 0) {
    return;
  }
LABEL_51:
  self->_serviceTypeOfLastGrant = *((_DWORD *)a3 + 43);
  *(void *)&self->_has |= 0x4000000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)changeDirection
{
  return self->_changeDirection;
}

- (unsigned)serviceType
{
  return self->_serviceType;
}

- (unsigned)voiceLinkPref
{
  return self->_voiceLinkPref;
}

- (unsigned)dataLinkPref
{
  return self->_dataLinkPref;
}

- (unsigned)callStatus
{
  return self->_callStatus;
}

- (unsigned)dataAppStatus
{
  return self->_dataAppStatus;
}

- (NSString)appType
{
  return self->_appType;
}

- (void)setAppType:(id)a3
{
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

- (unsigned)bcnPer
{
  return self->_bcnPer;
}

- (int)lqmScoreWifi
{
  return self->_lqmScoreWifi;
}

- (unsigned)expectedThroughputVO
{
  return self->_expectedThroughputVO;
}

- (unsigned)pkgLifeTimeVO
{
  return self->_pkgLifeTimeVO;
}

- (unsigned)pktLossRateVO
{
  return self->_pktLossRateVO;
}

- (unsigned)decisionVO
{
  return self->_decisionVO;
}

- (unsigned)expectedThroughputVIBE
{
  return self->_expectedThroughputVIBE;
}

- (unsigned)packetLifetimeVIBE
{
  return self->_packetLifetimeVIBE;
}

- (unsigned)decisionVIBE
{
  return self->_decisionVIBE;
}

- (int)dataLQM
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

- (int)cellRSRP
{
  return self->_cellRSRP;
}

- (int)cellSINR
{
  return self->_cellSINR;
}

- (unint64_t)ccStatusUpdateDelay
{
  return self->_ccStatusUpdateDelay;
}

- (unsigned)timeToLastDecision
{
  return self->_timeToLastDecision;
}

- (unsigned)timeToLastReverseDecision
{
  return self->_timeToLastReverseDecision;
}

- (unsigned)timeToLastReverseGrant
{
  return self->_timeToLastReverseGrant;
}

- (unsigned)serviceTypeOfLastGrant
{
  return self->_serviceTypeOfLastGrant;
}

@end