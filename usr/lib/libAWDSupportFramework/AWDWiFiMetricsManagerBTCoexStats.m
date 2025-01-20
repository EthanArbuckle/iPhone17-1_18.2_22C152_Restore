@interface AWDWiFiMetricsManagerBTCoexStats
- (AWDWiFiMetricsManagerStateMachine)antennaOwnership2BT;
- (AWDWiFiMetricsManagerStateMachine)antennaOwnership2WLAN;
- (AWDWiFiMetricsManagerStateMachine)enbledStateOff;
- (AWDWiFiMetricsManagerStateMachine)enbledStateOn;
- (AWDWiFiMetricsManagerStateMachine)hybridStateOff;
- (AWDWiFiMetricsManagerStateMachine)hybridStateOn;
- (AWDWiFiMetricsManagerStateMachine)tdmStateOff;
- (AWDWiFiMetricsManagerStateMachine)tdmStateOn;
- (BOOL)hasAntennaGrants;
- (BOOL)hasAntennaOwnership2BT;
- (BOOL)hasAntennaOwnership2WLAN;
- (BOOL)hasAntennaRequests;
- (BOOL)hasBeaconLostCnt;
- (BOOL)hasEnbledStateOff;
- (BOOL)hasEnbledStateOn;
- (BOOL)hasEnvelopeLowToHighAccumulatedMsec;
- (BOOL)hasGuardTimeMicroseconds;
- (BOOL)hasHighUcodeLatency;
- (BOOL)hasHybridStateOff;
- (BOOL)hasHybridStateOn;
- (BOOL)hasPsRequestTxCnt;
- (BOOL)hasPsnullExceeded;
- (BOOL)hasRequestsA2DP;
- (BOOL)hasRequestsACL;
- (BOOL)hasRequestsBLE;
- (BOOL)hasRequestsBLEScan;
- (BOOL)hasRequestsInquiry;
- (BOOL)hasRequestsInquiryScan;
- (BOOL)hasRequestsMSS;
- (BOOL)hasRequestsOther;
- (BOOL)hasRequestsPARK;
- (BOOL)hasRequestsPage;
- (BOOL)hasRequestsPageScan;
- (BOOL)hasRequestsSCO;
- (BOOL)hasRequestsSniff;
- (BOOL)hasRequestseSCO;
- (BOOL)hasResumeTimeAccumulatedMsec;
- (BOOL)hasScoReservedSlotDenyCount;
- (BOOL)hasScoRetransmission1DenyCount;
- (BOOL)hasScoRetransmission2DenyCount;
- (BOOL)hasTdmStateOff;
- (BOOL)hasTdmStateOn;
- (BOOL)hasTimeTillResumeAccumulatedMsec;
- (BOOL)hasTimestamp;
- (BOOL)hasTxCTS2Self;
- (BOOL)hasWlanPreempted;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)antennaGrants;
- (unint64_t)antennaRequests;
- (unint64_t)beaconLostCnt;
- (unint64_t)envelopeLowToHighAccumulatedMsec;
- (unint64_t)guardTimeMicroseconds;
- (unint64_t)hash;
- (unint64_t)highUcodeLatency;
- (unint64_t)psRequestTxCnt;
- (unint64_t)psnullExceeded;
- (unint64_t)requestsA2DP;
- (unint64_t)requestsACL;
- (unint64_t)requestsBLE;
- (unint64_t)requestsBLEScan;
- (unint64_t)requestsInquiry;
- (unint64_t)requestsInquiryScan;
- (unint64_t)requestsMSS;
- (unint64_t)requestsOther;
- (unint64_t)requestsPARK;
- (unint64_t)requestsPage;
- (unint64_t)requestsPageScan;
- (unint64_t)requestsSCO;
- (unint64_t)requestsSniff;
- (unint64_t)requestseSCO;
- (unint64_t)resumeTimeAccumulatedMsec;
- (unint64_t)rxMPDUCountPerMCSAtIndex:(unint64_t)a3;
- (unint64_t)rxMPDUCountPerMCSs;
- (unint64_t)rxMPDUCountPerMCSsCount;
- (unint64_t)scoReservedSlotDenyCount;
- (unint64_t)scoRetransmission1DenyCount;
- (unint64_t)scoRetransmission2DenyCount;
- (unint64_t)timeTillResumeAccumulatedMsec;
- (unint64_t)timestamp;
- (unint64_t)txCTS2Self;
- (unint64_t)txMPDUCountPerMCSAtIndex:(unint64_t)a3;
- (unint64_t)txMPDUCountPerMCSs;
- (unint64_t)txMPDUCountPerMCSsCount;
- (unint64_t)wlanPreempted;
- (void)addRxMPDUCountPerMCS:(unint64_t)a3;
- (void)addTxMPDUCountPerMCS:(unint64_t)a3;
- (void)clearRxMPDUCountPerMCSs;
- (void)clearTxMPDUCountPerMCSs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAntennaGrants:(unint64_t)a3;
- (void)setAntennaOwnership2BT:(id)a3;
- (void)setAntennaOwnership2WLAN:(id)a3;
- (void)setAntennaRequests:(unint64_t)a3;
- (void)setBeaconLostCnt:(unint64_t)a3;
- (void)setEnbledStateOff:(id)a3;
- (void)setEnbledStateOn:(id)a3;
- (void)setEnvelopeLowToHighAccumulatedMsec:(unint64_t)a3;
- (void)setGuardTimeMicroseconds:(unint64_t)a3;
- (void)setHasAntennaGrants:(BOOL)a3;
- (void)setHasAntennaRequests:(BOOL)a3;
- (void)setHasBeaconLostCnt:(BOOL)a3;
- (void)setHasEnvelopeLowToHighAccumulatedMsec:(BOOL)a3;
- (void)setHasGuardTimeMicroseconds:(BOOL)a3;
- (void)setHasHighUcodeLatency:(BOOL)a3;
- (void)setHasPsRequestTxCnt:(BOOL)a3;
- (void)setHasPsnullExceeded:(BOOL)a3;
- (void)setHasRequestsA2DP:(BOOL)a3;
- (void)setHasRequestsACL:(BOOL)a3;
- (void)setHasRequestsBLE:(BOOL)a3;
- (void)setHasRequestsBLEScan:(BOOL)a3;
- (void)setHasRequestsInquiry:(BOOL)a3;
- (void)setHasRequestsInquiryScan:(BOOL)a3;
- (void)setHasRequestsMSS:(BOOL)a3;
- (void)setHasRequestsOther:(BOOL)a3;
- (void)setHasRequestsPARK:(BOOL)a3;
- (void)setHasRequestsPage:(BOOL)a3;
- (void)setHasRequestsPageScan:(BOOL)a3;
- (void)setHasRequestsSCO:(BOOL)a3;
- (void)setHasRequestsSniff:(BOOL)a3;
- (void)setHasRequestseSCO:(BOOL)a3;
- (void)setHasResumeTimeAccumulatedMsec:(BOOL)a3;
- (void)setHasScoReservedSlotDenyCount:(BOOL)a3;
- (void)setHasScoRetransmission1DenyCount:(BOOL)a3;
- (void)setHasScoRetransmission2DenyCount:(BOOL)a3;
- (void)setHasTimeTillResumeAccumulatedMsec:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxCTS2Self:(BOOL)a3;
- (void)setHasWlanPreempted:(BOOL)a3;
- (void)setHighUcodeLatency:(unint64_t)a3;
- (void)setHybridStateOff:(id)a3;
- (void)setHybridStateOn:(id)a3;
- (void)setPsRequestTxCnt:(unint64_t)a3;
- (void)setPsnullExceeded:(unint64_t)a3;
- (void)setRequestsA2DP:(unint64_t)a3;
- (void)setRequestsACL:(unint64_t)a3;
- (void)setRequestsBLE:(unint64_t)a3;
- (void)setRequestsBLEScan:(unint64_t)a3;
- (void)setRequestsInquiry:(unint64_t)a3;
- (void)setRequestsInquiryScan:(unint64_t)a3;
- (void)setRequestsMSS:(unint64_t)a3;
- (void)setRequestsOther:(unint64_t)a3;
- (void)setRequestsPARK:(unint64_t)a3;
- (void)setRequestsPage:(unint64_t)a3;
- (void)setRequestsPageScan:(unint64_t)a3;
- (void)setRequestsSCO:(unint64_t)a3;
- (void)setRequestsSniff:(unint64_t)a3;
- (void)setRequestseSCO:(unint64_t)a3;
- (void)setResumeTimeAccumulatedMsec:(unint64_t)a3;
- (void)setRxMPDUCountPerMCSs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setScoReservedSlotDenyCount:(unint64_t)a3;
- (void)setScoRetransmission1DenyCount:(unint64_t)a3;
- (void)setScoRetransmission2DenyCount:(unint64_t)a3;
- (void)setTdmStateOff:(id)a3;
- (void)setTdmStateOn:(id)a3;
- (void)setTimeTillResumeAccumulatedMsec:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxCTS2Self:(unint64_t)a3;
- (void)setTxMPDUCountPerMCSs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setWlanPreempted:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerBTCoexStats

- (void)dealloc
{
  [(AWDWiFiMetricsManagerBTCoexStats *)self setAntennaOwnership2BT:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setAntennaOwnership2WLAN:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setEnbledStateOn:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setEnbledStateOff:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setHybridStateOn:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setHybridStateOff:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setTdmStateOn:0];
  [(AWDWiFiMetricsManagerBTCoexStats *)self setTdmStateOff:0];
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBTCoexStats;
  [(AWDWiFiMetricsManagerBTCoexStats *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setAntennaRequests:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_antennaRequests = a3;
}

- (void)setHasAntennaRequests:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAntennaRequests
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAntennaGrants:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_antennaGrants = a3;
}

- (void)setHasAntennaGrants:(BOOL)a3
{
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasAntennaGrants
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWlanPreempted:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_wlanPreempted = a3;
}

- (void)setHasWlanPreempted:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasWlanPreempted
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setPsnullExceeded:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_psnullExceeded = a3;
}

- (void)setHasPsnullExceeded:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasPsnullExceeded
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setHighUcodeLatency:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_highUcodeLatency = a3;
}

- (void)setHasHighUcodeLatency:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasHighUcodeLatency
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasAntennaOwnership2BT
{
  return self->_antennaOwnership2BT != 0;
}

- (BOOL)hasAntennaOwnership2WLAN
{
  return self->_antennaOwnership2WLAN != 0;
}

- (BOOL)hasEnbledStateOn
{
  return self->_enbledStateOn != 0;
}

- (BOOL)hasEnbledStateOff
{
  return self->_enbledStateOff != 0;
}

- (BOOL)hasHybridStateOn
{
  return self->_hybridStateOn != 0;
}

- (BOOL)hasHybridStateOff
{
  return self->_hybridStateOff != 0;
}

- (BOOL)hasTdmStateOn
{
  return self->_tdmStateOn != 0;
}

- (BOOL)hasTdmStateOff
{
  return self->_tdmStateOff != 0;
}

- (void)setRequestsACL:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_requestsACL = a3;
}

- (void)setHasRequestsACL:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRequestsACL
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setRequestsSCO:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_requestsSCO = a3;
}

- (void)setHasRequestsSCO:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRequestsSCO
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRequestseSCO:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_requestseSCO = a3;
}

- (void)setHasRequestseSCO:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasRequestseSCO
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRequestsA2DP:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_requestsA2DP = a3;
}

- (void)setHasRequestsA2DP:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRequestsA2DP
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRequestsSniff:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_requestsSniff = a3;
}

- (void)setHasRequestsSniff:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRequestsSniff
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRequestsPageScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_requestsPageScan = a3;
}

- (void)setHasRequestsPageScan:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasRequestsPageScan
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setRequestsInquiryScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_requestsInquiryScan = a3;
}

- (void)setHasRequestsInquiryScan:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasRequestsInquiryScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setRequestsPage:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_requestsPage = a3;
}

- (void)setHasRequestsPage:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasRequestsPage
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRequestsInquiry:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_requestsInquiry = a3;
}

- (void)setHasRequestsInquiry:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasRequestsInquiry
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRequestsBLE:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_requestsBLE = a3;
}

- (void)setHasRequestsBLE:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRequestsBLE
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRequestsOther:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_requestsOther = a3;
}

- (void)setHasRequestsOther:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRequestsOther
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRequestsBLEScan:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_requestsBLEScan = a3;
}

- (void)setHasRequestsBLEScan:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasRequestsBLEScan
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setRequestsMSS:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_requestsMSS = a3;
}

- (void)setHasRequestsMSS:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasRequestsMSS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setRequestsPARK:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_requestsPARK = a3;
}

- (void)setHasRequestsPARK:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRequestsPARK
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setBeaconLostCnt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_beaconLostCnt = a3;
}

- (void)setHasBeaconLostCnt:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasBeaconLostCnt
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (unint64_t)rxMPDUCountPerMCSsCount
{
  return self->_rxMPDUCountPerMCSs.count;
}

- (unint64_t)rxMPDUCountPerMCSs
{
  return self->_rxMPDUCountPerMCSs.list;
}

- (void)clearRxMPDUCountPerMCSs
{
}

- (void)addRxMPDUCountPerMCS:(unint64_t)a3
{
}

- (unint64_t)rxMPDUCountPerMCSAtIndex:(unint64_t)a3
{
  p_rxMPDUCountPerMCSs = &self->_rxMPDUCountPerMCSs;
  unint64_t count = self->_rxMPDUCountPerMCSs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_rxMPDUCountPerMCSs->list[a3];
}

- (void)setRxMPDUCountPerMCSs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txMPDUCountPerMCSsCount
{
  return self->_txMPDUCountPerMCSs.count;
}

- (unint64_t)txMPDUCountPerMCSs
{
  return self->_txMPDUCountPerMCSs.list;
}

- (void)clearTxMPDUCountPerMCSs
{
}

- (void)addTxMPDUCountPerMCS:(unint64_t)a3
{
}

- (unint64_t)txMPDUCountPerMCSAtIndex:(unint64_t)a3
{
  p_txMPDUCountPerMCSs = &self->_txMPDUCountPerMCSs;
  unint64_t count = self->_txMPDUCountPerMCSs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_txMPDUCountPerMCSs->list[a3];
}

- (void)setTxMPDUCountPerMCSs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (void)setTimeTillResumeAccumulatedMsec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_timeTillResumeAccumulatedMsec = a3;
}

- (void)setHasTimeTillResumeAccumulatedMsec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTimeTillResumeAccumulatedMsec
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setResumeTimeAccumulatedMsec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_resumeTimeAccumulatedMsec = a3;
}

- (void)setHasResumeTimeAccumulatedMsec:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasResumeTimeAccumulatedMsec
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setEnvelopeLowToHighAccumulatedMsec:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_envelopeLowToHighAccumulatedMsec = a3;
}

- (void)setHasEnvelopeLowToHighAccumulatedMsec:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasEnvelopeLowToHighAccumulatedMsec
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setScoReservedSlotDenyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_scoReservedSlotDenyCount = a3;
}

- (void)setHasScoReservedSlotDenyCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasScoReservedSlotDenyCount
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setScoRetransmission1DenyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_scoRetransmission1DenyCount = a3;
}

- (void)setHasScoRetransmission1DenyCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasScoRetransmission1DenyCount
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setScoRetransmission2DenyCount:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_scoRetransmission2DenyCount = a3;
}

- (void)setHasScoRetransmission2DenyCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasScoRetransmission2DenyCount
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setGuardTimeMicroseconds:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_guardTimeMicroseconds = a3;
}

- (void)setHasGuardTimeMicroseconds:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasGuardTimeMicroseconds
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPsRequestTxCnt:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_psRequestTxCnt = a3;
}

- (void)setHasPsRequestTxCnt:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasPsRequestTxCnt
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTxCTS2Self:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_txCTS2Self = a3;
}

- (void)setHasTxCTS2Self:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($0E65A0BFD4F635254F2A60AA8857012C)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTxCTS2Self
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerBTCoexStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerBTCoexStats description](&v3, sel_description), -[AWDWiFiMetricsManagerBTCoexStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_53;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_antennaRequests] forKey:@"antennaRequests"];
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_antennaGrants] forKey:@"antennaGrants"];
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_wlanPreempted] forKey:@"wlanPreempted"];
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_psnullExceeded] forKey:@"psnullExceeded"];
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highUcodeLatency] forKey:@"highUcodeLatency"];
LABEL_8:
  antennaOwnership2BT = self->_antennaOwnership2BT;
  if (antennaOwnership2BT) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](antennaOwnership2BT, "dictionaryRepresentation")] forKey:@"antennaOwnership2_BT"];
  }
  antennaOwnership2WLAN = self->_antennaOwnership2WLAN;
  if (antennaOwnership2WLAN) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](antennaOwnership2WLAN, "dictionaryRepresentation") forKey:@"antennaOwnership2_WLAN"];
  }
  enbledStateOn = self->_enbledStateOn;
  if (enbledStateOn) {
    [v3 setObject:[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](enbledStateOn, "dictionaryRepresentation")] forKey:@"enbledState_On"];
  }
  enbledStateOff = self->_enbledStateOff;
  if (enbledStateOff) {
    [v3 setObject:[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](enbledStateOff, "dictionaryRepresentation")] forKey:@"enbledState_Off"];
  }
  hybridStateOn = self->_hybridStateOn;
  if (hybridStateOn) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](hybridStateOn, "dictionaryRepresentation") forKey:@"hybridState_On"];
  }
  hybridStateOff = self->_hybridStateOff;
  if (hybridStateOff) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](hybridStateOff, "dictionaryRepresentation")] forKey:@"hybridState_Off"];
  }
  tdmStateOn = self->_tdmStateOn;
  if (tdmStateOn) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](tdmStateOn, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"tdmState_On"];
  }
  tdmStateOff = self->_tdmStateOff;
  if (tdmStateOff) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](tdmStateOff, "dictionaryRepresentation")] forKey:@"tdmState_Off"];
  }
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x200) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsACL] forKey:@"requestsACL"];
    $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x80000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v13 & 0x200000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_59;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x80000) == 0)
  {
    goto LABEL_26;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsSCO] forKey:@"requestsSCO"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v13 & 0x100) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestseSCO] forKey:@"requestseSCO"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v13 & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsA2DP] forKey:@"requestsA2DP"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v13 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsSniff] forKey:@"requestsSniff"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v13 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsPageScan] forKey:@"requestsPageScan"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v13 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsInquiryScan] forKey:@"requestsInquiryScan"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v13 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsPage] forKey:@"requestsPage"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v13 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsInquiry] forKey:@"requestsInquiry"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v13 & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsBLE] forKey:@"requestsBLE"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v13 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsOther] forKey:@"requestsOther"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x800) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v13 & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsBLEScan] forKey:@"requestsBLEScan"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_WORD *)&v13 & 0x4000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v13 & 0x10000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsMSS] forKey:@"requestsMSS"];
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v13 & 4) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_requestsPARK] forKey:@"requestsPARK"];
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_39:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beaconLostCnt] forKey:@"beaconLostCnt"];
LABEL_40:
  [v3 setObject:PBRepeatedUInt64NSArray() forKey:@"rxMPDUCountPerMCS"];
  [v3 setObject:PBRepeatedUInt64NSArray() forKey:@"txMPDUCountPerMCS"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x4000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeTillResumeAccumulatedMsec] forKey:@"timeTillResumeAccumulatedMsec"];
    $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
    if ((*(_DWORD *)&v14 & 0x400000) == 0)
    {
LABEL_42:
      if ((*(unsigned char *)&v14 & 8) == 0) {
        goto LABEL_43;
      }
      goto LABEL_74;
    }
  }
  else if ((*(_DWORD *)&v14 & 0x400000) == 0)
  {
    goto LABEL_42;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_resumeTimeAccumulatedMsec] forKey:@"resumeTimeAccumulatedMsec"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(unsigned char *)&v14 & 8) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v14 & 0x800000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_envelopeLowToHighAccumulatedMsec] forKey:@"envelopeLowToHighAccumulatedMsec"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x800000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v14 & 0x1000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_scoReservedSlotDenyCount] forKey:@"scoReservedSlotDenyCount"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x1000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v14 & 0x2000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_scoRetransmission1DenyCount] forKey:@"scoRetransmission1DenyCount"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(_DWORD *)&v14 & 0x2000000) == 0)
  {
LABEL_46:
    if ((*(unsigned char *)&v14 & 0x10) == 0) {
      goto LABEL_47;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_scoRetransmission2DenyCount] forKey:@"scoRetransmission2DenyCount"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x10) == 0)
  {
LABEL_47:
    if ((*(unsigned char *)&v14 & 0x40) == 0) {
      goto LABEL_48;
    }
LABEL_79:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_psRequestTxCnt] forKey:@"psRequestTxCnt"];
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      return v3;
    }
    goto LABEL_49;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_guardTimeMicroseconds] forKey:@"guardTimeMicroseconds"];
  $0E65A0BFD4F635254F2A60AA8857012C v14 = self->_has;
  if ((*(unsigned char *)&v14 & 0x40) != 0) {
    goto LABEL_79;
  }
LABEL_48:
  if ((*(_DWORD *)&v14 & 0x10000000) != 0) {
LABEL_49:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txCTS2Self] forKey:@"txCTS2Self"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerBTCoexStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_58;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 0x20) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint64Field();
LABEL_8:
  if (self->_antennaOwnership2BT) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_antennaOwnership2WLAN) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_enbledStateOn) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_enbledStateOff) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_hybridStateOn) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_hybridStateOff) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tdmStateOn) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_tdmStateOff) {
    PBDataWriterWriteSubmessage();
  }
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) != 0)
  {
    PBDataWriterWriteUint64Field();
    $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
    if ((*(_DWORD *)&v5 & 0x80000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v5 & 0x200000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_64;
    }
  }
  else if ((*(_DWORD *)&v5 & 0x80000) == 0)
  {
    goto LABEL_26;
  }
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_28;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v5 & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_38:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  if ((*(_DWORD *)&self->_has & 4) != 0) {
LABEL_39:
  }
    PBDataWriterWriteUint64Field();
LABEL_40:
  if (self->_rxMPDUCountPerMCSs.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_rxMPDUCountPerMCSs.count);
  }
  if (self->_txMPDUCountPerMCSs.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v7;
    }
    while (v7 < self->_txMPDUCountPerMCSs.count);
  }
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x400000) == 0)
    {
LABEL_48:
      if ((*(unsigned char *)&v8 & 8) == 0) {
        goto LABEL_49;
      }
      goto LABEL_79;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
    goto LABEL_48;
  }
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_53;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_53:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_54;
    }
LABEL_84:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      return;
    }
    goto LABEL_85;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) != 0) {
    goto LABEL_84;
  }
LABEL_54:
  if ((*(_DWORD *)&v8 & 0x10000000) == 0) {
    return;
  }
LABEL_85:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    *((void *)a3 + 34) = self->_timestamp;
    *((_DWORD *)a3 + 90) |= 0x8000000u;
    $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_61;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 8) = self->_antennaRequests;
  *((_DWORD *)a3 + 90) |= 2u;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)a3 + 7) = self->_antennaGrants;
  *((_DWORD *)a3 + 90) |= 1u;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 36) = self->_wlanPreempted;
  *((_DWORD *)a3 + 90) |= 0x20000000u;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_63:
  *((void *)a3 + 14) = self->_psnullExceeded;
  *((_DWORD *)a3 + 90) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *((void *)a3 + 12) = self->_highUcodeLatency;
    *((_DWORD *)a3 + 90) |= 0x20u;
  }
LABEL_8:
  if (self->_antennaOwnership2BT) {
    [a3 setAntennaOwnership2BT:];
  }
  if (self->_antennaOwnership2WLAN) {
    [a3 setAntennaOwnership2WLAN];
  }
  if (self->_enbledStateOn) {
    [a3 setEnbledStateOn:];
  }
  if (self->_enbledStateOff) {
    [a3 setEnbledStateOff:];
  }
  if (self->_hybridStateOn) {
    [a3 setHybridStateOn:];
  }
  if (self->_hybridStateOff) {
    [a3 setHybridStateOff:];
  }
  if (self->_tdmStateOn) {
    [a3 setTdmStateOn:];
  }
  if (self->_tdmStateOff) {
    [a3 setTdmStateOff:];
  }
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) != 0)
  {
    *((void *)a3 + 16) = self->_requestsACL;
    *((_DWORD *)a3 + 90) |= 0x200u;
    $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
    if ((*(_DWORD *)&v6 & 0x80000) == 0)
    {
LABEL_26:
      if ((*(_DWORD *)&v6 & 0x200000) == 0) {
        goto LABEL_27;
      }
      goto LABEL_67;
    }
  }
  else if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
    goto LABEL_26;
  }
  *((void *)a3 + 26) = self->_requestsSCO;
  *((_DWORD *)a3 + 90) |= 0x80000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_28;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)a3 + 28) = self->_requestseSCO;
  *((_DWORD *)a3 + 90) |= 0x200000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)a3 + 15) = self->_requestsA2DP;
  *((_DWORD *)a3 + 90) |= 0x100u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)a3 + 27) = self->_requestsSniff;
  *((_DWORD *)a3 + 90) |= 0x100000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_30:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)a3 + 25) = self->_requestsPageScan;
  *((_DWORD *)a3 + 90) |= 0x40000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)a3 + 20) = self->_requestsInquiryScan;
  *((_DWORD *)a3 + 90) |= 0x2000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)a3 + 24) = self->_requestsPage;
  *((_DWORD *)a3 + 90) |= 0x20000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)a3 + 19) = self->_requestsInquiry;
  *((_DWORD *)a3 + 90) |= 0x1000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)a3 + 17) = self->_requestsBLE;
  *((_DWORD *)a3 + 90) |= 0x400u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_35:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_36;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)a3 + 22) = self->_requestsOther;
  *((_DWORD *)a3 + 90) |= 0x8000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_36:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)a3 + 18) = self->_requestsBLEScan;
  *((_DWORD *)a3 + 90) |= 0x800u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_38;
    }
LABEL_78:
    *((void *)a3 + 23) = self->_requestsPARK;
    *((_DWORD *)a3 + 90) |= 0x10000u;
    if ((*(_DWORD *)&self->_has & 4) == 0) {
      goto LABEL_40;
    }
    goto LABEL_39;
  }
LABEL_77:
  *((void *)a3 + 21) = self->_requestsMSS;
  *((_DWORD *)a3 + 90) |= 0x4000u;
  $0E65A0BFD4F635254F2A60AA8857012C v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) != 0) {
    goto LABEL_78;
  }
LABEL_38:
  if ((*(unsigned char *)&v6 & 4) != 0)
  {
LABEL_39:
    *((void *)a3 + 9) = self->_beaconLostCnt;
    *((_DWORD *)a3 + 90) |= 4u;
  }
LABEL_40:
  if ([(AWDWiFiMetricsManagerBTCoexStats *)self rxMPDUCountPerMCSsCount])
  {
    [a3 clearRxMPDUCountPerMCSs];
    unint64_t v7 = [(AWDWiFiMetricsManagerBTCoexStats *)self rxMPDUCountPerMCSsCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t i = 0; i != v8; ++i)
        [a3 addRxMPDUCountPerMCS:-[AWDWiFiMetricsManagerBTCoexStats rxMPDUCountPerMCSAtIndex:](self, "rxMPDUCountPerMCSAtIndex:", i)];
    }
  }
  if ([(AWDWiFiMetricsManagerBTCoexStats *)self txMPDUCountPerMCSsCount])
  {
    [a3 clearTxMPDUCountPerMCSs];
    unint64_t v10 = [(AWDWiFiMetricsManagerBTCoexStats *)self txMPDUCountPerMCSsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addTxMPDUCountPerMCS:-[AWDWiFiMetricsManagerBTCoexStats txMPDUCountPerMCSAtIndex:](self, "txMPDUCountPerMCSAtIndex:", j)];
    }
  }
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
    *((void *)a3 + 33) = self->_timeTillResumeAccumulatedMsec;
    *((_DWORD *)a3 + 90) |= 0x4000000u;
    $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
    if ((*(_DWORD *)&v13 & 0x400000) == 0)
    {
LABEL_50:
      if ((*(unsigned char *)&v13 & 8) == 0) {
        goto LABEL_51;
      }
      goto LABEL_82;
    }
  }
  else if ((*(_DWORD *)&v13 & 0x400000) == 0)
  {
    goto LABEL_50;
  }
  *((void *)a3 + 29) = self->_resumeTimeAccumulatedMsec;
  *((_DWORD *)a3 + 90) |= 0x400000u;
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(unsigned char *)&v13 & 8) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v13 & 0x800000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)a3 + 10) = self->_envelopeLowToHighAccumulatedMsec;
  *((_DWORD *)a3 + 90) |= 8u;
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x800000) == 0)
  {
LABEL_52:
    if ((*(_DWORD *)&v13 & 0x1000000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)a3 + 30) = self->_scoReservedSlotDenyCount;
  *((_DWORD *)a3 + 90) |= 0x800000u;
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x1000000) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v13 & 0x2000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)a3 + 31) = self->_scoRetransmission1DenyCount;
  *((_DWORD *)a3 + 90) |= 0x1000000u;
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x2000000) == 0)
  {
LABEL_54:
    if ((*(unsigned char *)&v13 & 0x10) == 0) {
      goto LABEL_55;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)a3 + 32) = self->_scoRetransmission2DenyCount;
  *((_DWORD *)a3 + 90) |= 0x2000000u;
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x10) == 0)
  {
LABEL_55:
    if ((*(unsigned char *)&v13 & 0x40) == 0) {
      goto LABEL_56;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)a3 + 11) = self->_guardTimeMicroseconds;
  *((_DWORD *)a3 + 90) |= 0x10u;
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(unsigned char *)&v13 & 0x40) == 0)
  {
LABEL_56:
    if ((*(_DWORD *)&v13 & 0x10000000) == 0) {
      return;
    }
    goto LABEL_57;
  }
LABEL_87:
  *((void *)a3 + 13) = self->_psRequestTxCnt;
  *((_DWORD *)a3 + 90) |= 0x40u;
  if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
    return;
  }
LABEL_57:
  *((void *)a3 + 35) = self->_txCTS2Self;
  *((_DWORD *)a3 + 90) |= 0x10000000u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    *(void *)(v5 + 272) = self->_timestamp;
    *(_DWORD *)(v5 + 360) |= 0x8000000u;
    $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 64) = self->_antennaRequests;
  *(_DWORD *)(v5 + 360) |= 2u;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_4:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(void *)(v5 + 56) = self->_antennaGrants;
  *(_DWORD *)(v5 + 360) |= 1u;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(void *)(v5 + 288) = self->_wlanPreempted;
  *(_DWORD *)(v5 + 360) |= 0x20000000u;
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_39:
  *(void *)(v5 + 112) = self->_psnullExceeded;
  *(_DWORD *)(v5 + 360) |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x20) != 0)
  {
LABEL_7:
    *(void *)(v5 + 96) = self->_highUcodeLatency;
    *(_DWORD *)(v5 + 360) |= 0x20u;
  }
LABEL_8:

  *(void *)(v6 + 296) = [(AWDWiFiMetricsManagerStateMachine *)self->_antennaOwnership2BT copyWithZone:a3];
  *(void *)(v6 + 304) = [(AWDWiFiMetricsManagerStateMachine *)self->_antennaOwnership2WLAN copyWithZone:a3];

  *(void *)(v6 + 320) = [(AWDWiFiMetricsManagerStateMachine *)self->_enbledStateOn copyWithZone:a3];
  *(void *)(v6 + 312) = [(AWDWiFiMetricsManagerStateMachine *)self->_enbledStateOff copyWithZone:a3];

  *(void *)(v6 + 336) = [(AWDWiFiMetricsManagerStateMachine *)self->_hybridStateOn copyWithZone:a3];
  *(void *)(v6 + 328) = [(AWDWiFiMetricsManagerStateMachine *)self->_hybridStateOff copyWithZone:a3];

  *(void *)(v6 + 352) = [(AWDWiFiMetricsManagerStateMachine *)self->_tdmStateOn copyWithZone:a3];
  *(void *)(v6 + 344) = [(AWDWiFiMetricsManagerStateMachine *)self->_tdmStateOff copyWithZone:a3];
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) != 0)
  {
    *(void *)(v6 + 128) = self->_requestsACL;
    *(_DWORD *)(v6 + 360) |= 0x200u;
    $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
    if ((*(_DWORD *)&v8 & 0x80000) == 0)
    {
LABEL_10:
      if ((*(_DWORD *)&v8 & 0x200000) == 0) {
        goto LABEL_11;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_DWORD *)&v8 & 0x80000) == 0)
  {
    goto LABEL_10;
  }
  *(void *)(v6 + 208) = self->_requestsSCO;
  *(_DWORD *)(v6 + 360) |= 0x80000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  *(void *)(v6 + 224) = self->_requestseSCO;
  *(_DWORD *)(v6 + 360) |= 0x200000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  *(void *)(v6 + 120) = self->_requestsA2DP;
  *(_DWORD *)(v6 + 360) |= 0x100u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v8 & 0x40000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *(void *)(v6 + 216) = self->_requestsSniff;
  *(_DWORD *)(v6 + 360) |= 0x100000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *(void *)(v6 + 200) = self->_requestsPageScan;
  *(_DWORD *)(v6 + 360) |= 0x40000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *(void *)(v6 + 160) = self->_requestsInquiryScan;
  *(_DWORD *)(v6 + 360) |= 0x2000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *(void *)(v6 + 192) = self->_requestsPage;
  *(_DWORD *)(v6 + 360) |= 0x20000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *(void *)(v6 + 152) = self->_requestsInquiry;
  *(_DWORD *)(v6 + 360) |= 0x1000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *(void *)(v6 + 136) = self->_requestsBLE;
  *(_DWORD *)(v6 + 360) |= 0x400u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  *(void *)(v6 + 176) = self->_requestsOther;
  *(_DWORD *)(v6 + 360) |= 0x8000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  *(void *)(v6 + 144) = self->_requestsBLEScan;
  *(_DWORD *)(v6 + 360) |= 0x800u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  *(void *)(v6 + 168) = self->_requestsMSS;
  *(_DWORD *)(v6 + 360) |= 0x4000u;
  $0E65A0BFD4F635254F2A60AA8857012C v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_54:
  *(void *)(v6 + 184) = self->_requestsPARK;
  *(_DWORD *)(v6 + 360) |= 0x10000u;
  if ((*(_DWORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    *(void *)(v6 + 72) = self->_beaconLostCnt;
    *(_DWORD *)(v6 + 360) |= 4u;
  }
LABEL_24:
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x4000000) != 0)
  {
    *(void *)(v6 + 264) = self->_timeTillResumeAccumulatedMsec;
    *(_DWORD *)(v6 + 360) |= 0x4000000u;
    $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
    if ((*(_DWORD *)&v9 & 0x400000) == 0)
    {
LABEL_26:
      if ((*(unsigned char *)&v9 & 8) == 0) {
        goto LABEL_27;
      }
      goto LABEL_58;
    }
  }
  else if ((*(_DWORD *)&v9 & 0x400000) == 0)
  {
    goto LABEL_26;
  }
  *(void *)(v6 + 232) = self->_resumeTimeAccumulatedMsec;
  *(_DWORD *)(v6 + 360) |= 0x400000u;
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(unsigned char *)&v9 & 8) == 0)
  {
LABEL_27:
    if ((*(_DWORD *)&v9 & 0x800000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(void *)(v6 + 80) = self->_envelopeLowToHighAccumulatedMsec;
  *(_DWORD *)(v6 + 360) |= 8u;
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x800000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v9 & 0x1000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(void *)(v6 + 240) = self->_scoReservedSlotDenyCount;
  *(_DWORD *)(v6 + 360) |= 0x800000u;
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x1000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&v9 & 0x2000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(void *)(v6 + 248) = self->_scoRetransmission1DenyCount;
  *(_DWORD *)(v6 + 360) |= 0x1000000u;
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x2000000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&v9 & 0x10) == 0) {
      goto LABEL_31;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(void *)(v6 + 256) = self->_scoRetransmission2DenyCount;
  *(_DWORD *)(v6 + 360) |= 0x2000000u;
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x10) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v9 & 0x40) == 0) {
      goto LABEL_32;
    }
LABEL_63:
    *(void *)(v6 + 104) = self->_psRequestTxCnt;
    *(_DWORD *)(v6 + 360) |= 0x40u;
    if ((*(_DWORD *)&self->_has & 0x10000000) == 0) {
      return (id)v6;
    }
    goto LABEL_33;
  }
LABEL_62:
  *(void *)(v6 + 88) = self->_guardTimeMicroseconds;
  *(_DWORD *)(v6 + 360) |= 0x10u;
  $0E65A0BFD4F635254F2A60AA8857012C v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) != 0) {
    goto LABEL_63;
  }
LABEL_32:
  if ((*(_DWORD *)&v9 & 0x10000000) != 0)
  {
LABEL_33:
    *(void *)(v6 + 280) = self->_txCTS2Self;
    *(_DWORD *)(v6 + 360) |= 0x10000000u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
    int v7 = *((_DWORD *)a3 + 90);
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_timestamp != *((void *)a3 + 34)) {
        goto LABEL_169;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
LABEL_169:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_antennaRequests != *((void *)a3 + 8)) {
        goto LABEL_169;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_169;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_antennaGrants != *((void *)a3 + 7)) {
        goto LABEL_169;
      }
    }
    else if (v7)
    {
      goto LABEL_169;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_wlanPreempted != *((void *)a3 + 36)) {
        goto LABEL_169;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_169;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_psnullExceeded != *((void *)a3 + 14)) {
        goto LABEL_169;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_169;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_highUcodeLatency != *((void *)a3 + 12)) {
        goto LABEL_169;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_169;
    }
    antennaOwnership2BT = self->_antennaOwnership2BT;
    if (!((unint64_t)antennaOwnership2BT | *((void *)a3 + 37))
      || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](antennaOwnership2BT, "isEqual:")) != 0)
    {
      antennaOwnership2WLAN = self->_antennaOwnership2WLAN;
      if (!((unint64_t)antennaOwnership2WLAN | *((void *)a3 + 38))
        || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](antennaOwnership2WLAN, "isEqual:")) != 0)
      {
        enbledStateOn = self->_enbledStateOn;
        if (!((unint64_t)enbledStateOn | *((void *)a3 + 40))
          || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](enbledStateOn, "isEqual:")) != 0)
        {
          enbledStateOff = self->_enbledStateOff;
          if (!((unint64_t)enbledStateOff | *((void *)a3 + 39))
            || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](enbledStateOff, "isEqual:")) != 0)
          {
            hybridStateOn = self->_hybridStateOn;
            if (!((unint64_t)hybridStateOn | *((void *)a3 + 42))
              || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](hybridStateOn, "isEqual:")) != 0)
            {
              hybridStateOff = self->_hybridStateOff;
              if (!((unint64_t)hybridStateOff | *((void *)a3 + 41))
                || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](hybridStateOff, "isEqual:")) != 0)
              {
                tdmStateOn = self->_tdmStateOn;
                if (!((unint64_t)tdmStateOn | *((void *)a3 + 44))
                  || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](tdmStateOn, "isEqual:")) != 0)
                {
                  tdmStateOff = self->_tdmStateOff;
                  if (!((unint64_t)tdmStateOff | *((void *)a3 + 43))
                    || (int IsEqual = -[AWDWiFiMetricsManagerStateMachine isEqual:](tdmStateOff, "isEqual:")) != 0)
                  {
                    $0E65A0BFD4F635254F2A60AA8857012C v16 = self->_has;
                    int v17 = *((_DWORD *)a3 + 90);
                    if ((*(_WORD *)&v16 & 0x200) != 0)
                    {
                      if ((v17 & 0x200) == 0 || self->_requestsACL != *((void *)a3 + 16)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x200) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x80000) != 0)
                    {
                      if ((v17 & 0x80000) == 0 || self->_requestsSCO != *((void *)a3 + 26)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x80000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x200000) != 0)
                    {
                      if ((v17 & 0x200000) == 0 || self->_requestseSCO != *((void *)a3 + 28)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x200000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x100) != 0)
                    {
                      if ((v17 & 0x100) == 0 || self->_requestsA2DP != *((void *)a3 + 15)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x100) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x100000) != 0)
                    {
                      if ((v17 & 0x100000) == 0 || self->_requestsSniff != *((void *)a3 + 27)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x100000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x40000) != 0)
                    {
                      if ((v17 & 0x40000) == 0 || self->_requestsPageScan != *((void *)a3 + 25)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x40000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x2000) != 0)
                    {
                      if ((v17 & 0x2000) == 0 || self->_requestsInquiryScan != *((void *)a3 + 20)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x2000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x20000) != 0)
                    {
                      if ((v17 & 0x20000) == 0 || self->_requestsPage != *((void *)a3 + 24)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x20000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x1000) != 0)
                    {
                      if ((v17 & 0x1000) == 0 || self->_requestsInquiry != *((void *)a3 + 19)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x1000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x400) != 0)
                    {
                      if ((v17 & 0x400) == 0 || self->_requestsBLE != *((void *)a3 + 17)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x400) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x8000) != 0)
                    {
                      if ((v17 & 0x8000) == 0 || self->_requestsOther != *((void *)a3 + 22)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x8000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x800) != 0)
                    {
                      if ((v17 & 0x800) == 0 || self->_requestsBLEScan != *((void *)a3 + 18)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x800) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_WORD *)&v16 & 0x4000) != 0)
                    {
                      if ((v17 & 0x4000) == 0 || self->_requestsMSS != *((void *)a3 + 21)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x4000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(_DWORD *)&v16 & 0x10000) != 0)
                    {
                      if ((v17 & 0x10000) == 0 || self->_requestsPARK != *((void *)a3 + 23)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 0x10000) != 0)
                    {
                      goto LABEL_169;
                    }
                    if ((*(unsigned char *)&v16 & 4) != 0)
                    {
                      if ((v17 & 4) == 0 || self->_beaconLostCnt != *((void *)a3 + 9)) {
                        goto LABEL_169;
                      }
                    }
                    else if ((v17 & 4) != 0)
                    {
                      goto LABEL_169;
                    }
                    int IsEqual = PBRepeatedUInt64IsEqual();
                    if (IsEqual)
                    {
                      int IsEqual = PBRepeatedUInt64IsEqual();
                      if (IsEqual)
                      {
                        $0E65A0BFD4F635254F2A60AA8857012C v18 = self->_has;
                        int v19 = *((_DWORD *)a3 + 90);
                        if ((*(_DWORD *)&v18 & 0x4000000) != 0)
                        {
                          if ((v19 & 0x4000000) == 0 || self->_timeTillResumeAccumulatedMsec != *((void *)a3 + 33)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x4000000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x400000) != 0)
                        {
                          if ((v19 & 0x400000) == 0 || self->_resumeTimeAccumulatedMsec != *((void *)a3 + 29)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x400000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(unsigned char *)&v18 & 8) != 0)
                        {
                          if ((v19 & 8) == 0 || self->_envelopeLowToHighAccumulatedMsec != *((void *)a3 + 10)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 8) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x800000) != 0)
                        {
                          if ((v19 & 0x800000) == 0 || self->_scoReservedSlotDenyCount != *((void *)a3 + 30)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x800000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x1000000) != 0)
                        {
                          if ((v19 & 0x1000000) == 0 || self->_scoRetransmission1DenyCount != *((void *)a3 + 31)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x1000000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(_DWORD *)&v18 & 0x2000000) != 0)
                        {
                          if ((v19 & 0x2000000) == 0 || self->_scoRetransmission2DenyCount != *((void *)a3 + 32)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x2000000) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(unsigned char *)&v18 & 0x10) != 0)
                        {
                          if ((v19 & 0x10) == 0 || self->_guardTimeMicroseconds != *((void *)a3 + 11)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x10) != 0)
                        {
                          goto LABEL_169;
                        }
                        if ((*(unsigned char *)&v18 & 0x40) != 0)
                        {
                          if ((v19 & 0x40) == 0 || self->_psRequestTxCnt != *((void *)a3 + 13)) {
                            goto LABEL_169;
                          }
                        }
                        else if ((v19 & 0x40) != 0)
                        {
                          goto LABEL_169;
                        }
                        LOBYTE(IsEqual) = (v19 & 0x10000000) == 0;
                        if ((*(_DWORD *)&v18 & 0x10000000) != 0)
                        {
                          if ((v19 & 0x10000000) == 0 || self->_txCTS2Self != *((void *)a3 + 35)) {
                            goto LABEL_169;
                          }
                          LOBYTE(IsEqual) = 1;
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $0E65A0BFD4F635254F2A60AA8857012C has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    unint64_t v46 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      unint64_t v45 = 2654435761u * self->_antennaRequests;
      if (*(unsigned char *)&has) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v46 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v45 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_4:
    unint64_t v44 = 2654435761u * self->_antennaGrants;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v44 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_5:
    unint64_t v43 = 2654435761u * self->_wlanPreempted;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    unint64_t v42 = 0;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v43 = 0;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  unint64_t v42 = 2654435761u * self->_psnullExceeded;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    unint64_t v41 = 2654435761u * self->_highUcodeLatency;
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v41 = 0;
LABEL_14:
  unint64_t v40 = [(AWDWiFiMetricsManagerStateMachine *)self->_antennaOwnership2BT hash];
  unint64_t v39 = [(AWDWiFiMetricsManagerStateMachine *)self->_antennaOwnership2WLAN hash];
  unint64_t v38 = [(AWDWiFiMetricsManagerStateMachine *)self->_enbledStateOn hash];
  unint64_t v37 = [(AWDWiFiMetricsManagerStateMachine *)self->_enbledStateOff hash];
  unint64_t v36 = [(AWDWiFiMetricsManagerStateMachine *)self->_hybridStateOn hash];
  unint64_t v35 = [(AWDWiFiMetricsManagerStateMachine *)self->_hybridStateOff hash];
  unint64_t v34 = [(AWDWiFiMetricsManagerStateMachine *)self->_tdmStateOn hash];
  unint64_t v33 = [(AWDWiFiMetricsManagerStateMachine *)self->_tdmStateOff hash];
  $0E65A0BFD4F635254F2A60AA8857012C v4 = self->_has;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
    unint64_t v32 = 2654435761u * self->_requestsACL;
    if ((*(_DWORD *)&v4 & 0x80000) != 0)
    {
LABEL_16:
      unint64_t v31 = 2654435761u * self->_requestsSCO;
      if ((*(_DWORD *)&v4 & 0x200000) != 0) {
        goto LABEL_17;
      }
      goto LABEL_32;
    }
  }
  else
  {
    unint64_t v32 = 0;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_16;
    }
  }
  unint64_t v31 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_17:
    unint64_t v30 = 2654435761u * self->_requestseSCO;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_18;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v30 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_18:
    unint64_t v29 = 2654435761u * self->_requestsA2DP;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_34;
  }
LABEL_33:
  unint64_t v29 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_19:
    unint64_t v28 = 2654435761u * self->_requestsSniff;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_35;
  }
LABEL_34:
  unint64_t v28 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_20:
    unint64_t v27 = 2654435761u * self->_requestsPageScan;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_36;
  }
LABEL_35:
  unint64_t v27 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_21:
    unint64_t v26 = 2654435761u * self->_requestsInquiryScan;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_37;
  }
LABEL_36:
  unint64_t v26 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_22:
    unint64_t v25 = 2654435761u * self->_requestsPage;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_38;
  }
LABEL_37:
  unint64_t v25 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_23:
    unint64_t v24 = 2654435761u * self->_requestsInquiry;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_24;
    }
    goto LABEL_39;
  }
LABEL_38:
  unint64_t v24 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_24:
    unint64_t v5 = 2654435761u * self->_requestsBLE;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_40;
  }
LABEL_39:
  unint64_t v5 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_25:
    unint64_t v6 = 2654435761u * self->_requestsOther;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_26;
    }
    goto LABEL_41;
  }
LABEL_40:
  unint64_t v6 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_26:
    unint64_t v7 = 2654435761u * self->_requestsBLEScan;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_42;
  }
LABEL_41:
  unint64_t v7 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_27:
    unint64_t v8 = 2654435761u * self->_requestsMSS;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_28;
    }
LABEL_43:
    unint64_t v9 = 0;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_29;
    }
    goto LABEL_44;
  }
LABEL_42:
  unint64_t v8 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) == 0) {
    goto LABEL_43;
  }
LABEL_28:
  unint64_t v9 = 2654435761u * self->_requestsPARK;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_29:
    unint64_t v10 = 2654435761u * self->_beaconLostCnt;
    goto LABEL_45;
  }
LABEL_44:
  unint64_t v10 = 0;
LABEL_45:
  uint64_t v11 = PBRepeatedUInt64Hash();
  uint64_t v12 = PBRepeatedUInt64Hash();
  $0E65A0BFD4F635254F2A60AA8857012C v13 = self->_has;
  if ((*(_DWORD *)&v13 & 0x4000000) != 0)
  {
    unint64_t v14 = 2654435761u * self->_timeTillResumeAccumulatedMsec;
    if ((*(_DWORD *)&v13 & 0x400000) != 0)
    {
LABEL_47:
      unint64_t v15 = 2654435761u * self->_resumeTimeAccumulatedMsec;
      if ((*(unsigned char *)&v13 & 8) != 0) {
        goto LABEL_48;
      }
      goto LABEL_57;
    }
  }
  else
  {
    unint64_t v14 = 0;
    if ((*(_DWORD *)&v13 & 0x400000) != 0) {
      goto LABEL_47;
    }
  }
  unint64_t v15 = 0;
  if ((*(unsigned char *)&v13 & 8) != 0)
  {
LABEL_48:
    unint64_t v16 = 2654435761u * self->_envelopeLowToHighAccumulatedMsec;
    if ((*(_DWORD *)&v13 & 0x800000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v16 = 0;
  if ((*(_DWORD *)&v13 & 0x800000) != 0)
  {
LABEL_49:
    unint64_t v17 = 2654435761u * self->_scoReservedSlotDenyCount;
    if ((*(_DWORD *)&v13 & 0x1000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&v13 & 0x1000000) != 0)
  {
LABEL_50:
    unint64_t v18 = 2654435761u * self->_scoRetransmission1DenyCount;
    if ((*(_DWORD *)&v13 & 0x2000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_60;
  }
LABEL_59:
  unint64_t v18 = 0;
  if ((*(_DWORD *)&v13 & 0x2000000) != 0)
  {
LABEL_51:
    unint64_t v19 = 2654435761u * self->_scoRetransmission2DenyCount;
    if ((*(unsigned char *)&v13 & 0x10) != 0) {
      goto LABEL_52;
    }
    goto LABEL_61;
  }
LABEL_60:
  unint64_t v19 = 0;
  if ((*(unsigned char *)&v13 & 0x10) != 0)
  {
LABEL_52:
    unint64_t v20 = 2654435761u * self->_guardTimeMicroseconds;
    if ((*(unsigned char *)&v13 & 0x40) != 0) {
      goto LABEL_53;
    }
LABEL_62:
    unint64_t v21 = 0;
    if ((*(_DWORD *)&v13 & 0x10000000) != 0) {
      goto LABEL_54;
    }
LABEL_63:
    unint64_t v22 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
  }
LABEL_61:
  unint64_t v20 = 0;
  if ((*(unsigned char *)&v13 & 0x40) == 0) {
    goto LABEL_62;
  }
LABEL_53:
  unint64_t v21 = 2654435761u * self->_psRequestTxCnt;
  if ((*(_DWORD *)&v13 & 0x10000000) == 0) {
    goto LABEL_63;
  }
LABEL_54:
  unint64_t v22 = 2654435761u * self->_txCTS2Self;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22;
}

- (void)mergeFrom:(id)a3
{
  int v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 0x8000000) != 0)
  {
    self->_timestamp = *((void *)a3 + 34);
    *(_DWORD *)&self->_has |= 0x8000000u;
    int v5 = *((_DWORD *)a3 + 90);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_antennaRequests = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  self->_antennaGrants = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_wlanPreempted = *((void *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x20000000u;
  int v5 = *((_DWORD *)a3 + 90);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_15:
  self->_psnullExceeded = *((void *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)a3 + 90) & 0x20) != 0)
  {
LABEL_7:
    self->_highUcodeLatency = *((void *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x20u;
  }
LABEL_8:
  antennaOwnership2BT = self->_antennaOwnership2BT;
  uint64_t v7 = *((void *)a3 + 37);
  if (antennaOwnership2BT)
  {
    if (v7) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](antennaOwnership2BT, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setAntennaOwnership2BT:](self, "setAntennaOwnership2BT:");
  }
  antennaOwnership2WLAN = self->_antennaOwnership2WLAN;
  uint64_t v9 = *((void *)a3 + 38);
  if (antennaOwnership2WLAN)
  {
    if (v9) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](antennaOwnership2WLAN, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setAntennaOwnership2WLAN:](self, "setAntennaOwnership2WLAN:");
  }
  enbledStateOn = self->_enbledStateOn;
  uint64_t v11 = *((void *)a3 + 40);
  if (enbledStateOn)
  {
    if (v11) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](enbledStateOn, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setEnbledStateOn:](self, "setEnbledStateOn:");
  }
  enbledStateOff = self->_enbledStateOff;
  uint64_t v13 = *((void *)a3 + 39);
  if (enbledStateOff)
  {
    if (v13) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](enbledStateOff, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setEnbledStateOff:](self, "setEnbledStateOff:");
  }
  hybridStateOn = self->_hybridStateOn;
  uint64_t v15 = *((void *)a3 + 42);
  if (hybridStateOn)
  {
    if (v15) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](hybridStateOn, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setHybridStateOn:](self, "setHybridStateOn:");
  }
  hybridStateOff = self->_hybridStateOff;
  uint64_t v17 = *((void *)a3 + 41);
  if (hybridStateOff)
  {
    if (v17) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](hybridStateOff, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setHybridStateOff:](self, "setHybridStateOff:");
  }
  tdmStateOn = self->_tdmStateOn;
  uint64_t v19 = *((void *)a3 + 44);
  if (tdmStateOn)
  {
    if (v19) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](tdmStateOn, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setTdmStateOn:](self, "setTdmStateOn:");
  }
  tdmStateOff = self->_tdmStateOff;
  uint64_t v21 = *((void *)a3 + 43);
  if (tdmStateOff)
  {
    if (v21) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](tdmStateOff, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[AWDWiFiMetricsManagerBTCoexStats setTdmStateOff:](self, "setTdmStateOff:");
  }
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x200) != 0)
  {
    self->_requestsACL = *((void *)a3 + 16);
    *(_DWORD *)&self->_has |= 0x200u;
    int v22 = *((_DWORD *)a3 + 90);
    if ((v22 & 0x80000) == 0)
    {
LABEL_56:
      if ((v22 & 0x200000) == 0) {
        goto LABEL_57;
      }
      goto LABEL_89;
    }
  }
  else if ((v22 & 0x80000) == 0)
  {
    goto LABEL_56;
  }
  self->_requestsSCO = *((void *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x200000) == 0)
  {
LABEL_57:
    if ((v22 & 0x100) == 0) {
      goto LABEL_58;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_requestseSCO = *((void *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x100) == 0)
  {
LABEL_58:
    if ((v22 & 0x100000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_requestsA2DP = *((void *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x100u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x100000) == 0)
  {
LABEL_59:
    if ((v22 & 0x40000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_requestsSniff = *((void *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x40000) == 0)
  {
LABEL_60:
    if ((v22 & 0x2000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_requestsPageScan = *((void *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x2000) == 0)
  {
LABEL_61:
    if ((v22 & 0x20000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_requestsInquiryScan = *((void *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x20000) == 0)
  {
LABEL_62:
    if ((v22 & 0x1000) == 0) {
      goto LABEL_63;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_requestsPage = *((void *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x1000) == 0)
  {
LABEL_63:
    if ((v22 & 0x400) == 0) {
      goto LABEL_64;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_requestsInquiry = *((void *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x400) == 0)
  {
LABEL_64:
    if ((v22 & 0x8000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_requestsBLE = *((void *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x400u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x8000) == 0)
  {
LABEL_65:
    if ((v22 & 0x800) == 0) {
      goto LABEL_66;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_requestsOther = *((void *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x800) == 0)
  {
LABEL_66:
    if ((v22 & 0x4000) == 0) {
      goto LABEL_67;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_requestsBLEScan = *((void *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x800u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x4000) == 0)
  {
LABEL_67:
    if ((v22 & 0x10000) == 0) {
      goto LABEL_68;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_requestsMSS = *((void *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v22 = *((_DWORD *)a3 + 90);
  if ((v22 & 0x10000) == 0)
  {
LABEL_68:
    if ((v22 & 4) == 0) {
      goto LABEL_70;
    }
    goto LABEL_69;
  }
LABEL_100:
  self->_requestsPARK = *((void *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x10000u;
  if ((*((_DWORD *)a3 + 90) & 4) != 0)
  {
LABEL_69:
    self->_beaconLostCnt = *((void *)a3 + 9);
    *(_DWORD *)&self->_has |= 4u;
  }
LABEL_70:
  uint64_t v23 = [a3 rxMPDUCountPerMCSsCount];
  if (v23)
  {
    uint64_t v24 = v23;
    for (uint64_t i = 0; i != v24; ++i)
      -[AWDWiFiMetricsManagerBTCoexStats addRxMPDUCountPerMCS:](self, "addRxMPDUCountPerMCS:", [a3 rxMPDUCountPerMCSAtIndex:i]);
  }
  uint64_t v26 = [a3 txMPDUCountPerMCSsCount];
  if (v26)
  {
    uint64_t v27 = v26;
    for (uint64_t j = 0; j != v27; ++j)
      -[AWDWiFiMetricsManagerBTCoexStats addTxMPDUCountPerMCS:](self, "addTxMPDUCountPerMCS:", [a3 txMPDUCountPerMCSAtIndex:j]);
  }
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x4000000) != 0)
  {
    self->_timeTillResumeAccumulatedMsec = *((void *)a3 + 33);
    *(_DWORD *)&self->_has |= 0x4000000u;
    int v29 = *((_DWORD *)a3 + 90);
    if ((v29 & 0x400000) == 0)
    {
LABEL_78:
      if ((v29 & 8) == 0) {
        goto LABEL_79;
      }
      goto LABEL_104;
    }
  }
  else if ((v29 & 0x400000) == 0)
  {
    goto LABEL_78;
  }
  self->_resumeTimeAccumulatedMsec = *((void *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 8) == 0)
  {
LABEL_79:
    if ((v29 & 0x800000) == 0) {
      goto LABEL_80;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_envelopeLowToHighAccumulatedMsec = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 8u;
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x800000) == 0)
  {
LABEL_80:
    if ((v29 & 0x1000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_scoReservedSlotDenyCount = *((void *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x1000000) == 0)
  {
LABEL_81:
    if ((v29 & 0x2000000) == 0) {
      goto LABEL_82;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_scoRetransmission1DenyCount = *((void *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x2000000) == 0)
  {
LABEL_82:
    if ((v29 & 0x10) == 0) {
      goto LABEL_83;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_scoRetransmission2DenyCount = *((void *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x10) == 0)
  {
LABEL_83:
    if ((v29 & 0x40) == 0) {
      goto LABEL_84;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_guardTimeMicroseconds = *((void *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x10u;
  int v29 = *((_DWORD *)a3 + 90);
  if ((v29 & 0x40) == 0)
  {
LABEL_84:
    if ((v29 & 0x10000000) == 0) {
      return;
    }
    goto LABEL_85;
  }
LABEL_109:
  self->_psRequestTxCnt = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x40u;
  if ((*((_DWORD *)a3 + 90) & 0x10000000) == 0) {
    return;
  }
LABEL_85:
  self->_txCTS2Self = *((void *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x10000000u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)antennaRequests
{
  return self->_antennaRequests;
}

- (unint64_t)antennaGrants
{
  return self->_antennaGrants;
}

- (unint64_t)wlanPreempted
{
  return self->_wlanPreempted;
}

- (unint64_t)psnullExceeded
{
  return self->_psnullExceeded;
}

- (unint64_t)highUcodeLatency
{
  return self->_highUcodeLatency;
}

- (AWDWiFiMetricsManagerStateMachine)antennaOwnership2BT
{
  return self->_antennaOwnership2BT;
}

- (void)setAntennaOwnership2BT:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)antennaOwnership2WLAN
{
  return self->_antennaOwnership2WLAN;
}

- (void)setAntennaOwnership2WLAN:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)enbledStateOn
{
  return self->_enbledStateOn;
}

- (void)setEnbledStateOn:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)enbledStateOff
{
  return self->_enbledStateOff;
}

- (void)setEnbledStateOff:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)hybridStateOn
{
  return self->_hybridStateOn;
}

- (void)setHybridStateOn:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)hybridStateOff
{
  return self->_hybridStateOff;
}

- (void)setHybridStateOff:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)tdmStateOn
{
  return self->_tdmStateOn;
}

- (void)setTdmStateOn:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)tdmStateOff
{
  return self->_tdmStateOff;
}

- (void)setTdmStateOff:(id)a3
{
}

- (unint64_t)requestsACL
{
  return self->_requestsACL;
}

- (unint64_t)requestsSCO
{
  return self->_requestsSCO;
}

- (unint64_t)requestseSCO
{
  return self->_requestseSCO;
}

- (unint64_t)requestsA2DP
{
  return self->_requestsA2DP;
}

- (unint64_t)requestsSniff
{
  return self->_requestsSniff;
}

- (unint64_t)requestsPageScan
{
  return self->_requestsPageScan;
}

- (unint64_t)requestsInquiryScan
{
  return self->_requestsInquiryScan;
}

- (unint64_t)requestsPage
{
  return self->_requestsPage;
}

- (unint64_t)requestsInquiry
{
  return self->_requestsInquiry;
}

- (unint64_t)requestsBLE
{
  return self->_requestsBLE;
}

- (unint64_t)requestsOther
{
  return self->_requestsOther;
}

- (unint64_t)requestsBLEScan
{
  return self->_requestsBLEScan;
}

- (unint64_t)requestsMSS
{
  return self->_requestsMSS;
}

- (unint64_t)requestsPARK
{
  return self->_requestsPARK;
}

- (unint64_t)beaconLostCnt
{
  return self->_beaconLostCnt;
}

- (unint64_t)timeTillResumeAccumulatedMsec
{
  return self->_timeTillResumeAccumulatedMsec;
}

- (unint64_t)resumeTimeAccumulatedMsec
{
  return self->_resumeTimeAccumulatedMsec;
}

- (unint64_t)envelopeLowToHighAccumulatedMsec
{
  return self->_envelopeLowToHighAccumulatedMsec;
}

- (unint64_t)scoReservedSlotDenyCount
{
  return self->_scoReservedSlotDenyCount;
}

- (unint64_t)scoRetransmission1DenyCount
{
  return self->_scoRetransmission1DenyCount;
}

- (unint64_t)scoRetransmission2DenyCount
{
  return self->_scoRetransmission2DenyCount;
}

- (unint64_t)guardTimeMicroseconds
{
  return self->_guardTimeMicroseconds;
}

- (unint64_t)psRequestTxCnt
{
  return self->_psRequestTxCnt;
}

- (unint64_t)txCTS2Self
{
  return self->_txCTS2Self;
}

@end