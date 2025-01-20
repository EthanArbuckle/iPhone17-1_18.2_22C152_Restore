@interface AWDWifiLinkQualityRecord
- (BOOL)hasArpFailureCount;
- (BOOL)hasBcnPerSign;
- (BOOL)hasBcnRcvs;
- (BOOL)hasBcnSched;
- (BOOL)hasDnsServersImpacted;
- (BOOL)hasDnsServersTotal;
- (BOOL)hasFwTxFail;
- (BOOL)hasFwTxFrames;
- (BOOL)hasFwTxPerSign;
- (BOOL)hasFwTxRetrans;
- (BOOL)hasGateOpenTime;
- (BOOL)hasGwArpExpiry;
- (BOOL)hasMetricReason;
- (BOOL)hasNetScore;
- (BOOL)hasRapidLqmDuration;
- (BOOL)hasRoamWaitTime;
- (BOOL)hasRssi;
- (BOOL)hasRxFrames;
- (BOOL)hasSympAwdCode;
- (BOOL)hasSympSign;
- (BOOL)hasTdEvalDuration;
- (BOOL)hasTrafficWatchDuration;
- (BOOL)hasTrafficWatchRx;
- (BOOL)hasTrafficWatchTime;
- (BOOL)hasTrgDisc;
- (BOOL)hasTxFail;
- (BOOL)hasTxFrames;
- (BOOL)hasTxPerSign;
- (BOOL)hasTxRetrans;
- (BOOL)hasUsrImpact;
- (BOOL)hasUsrInput;
- (BOOL)hasValidState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)gateOpenTime;
- (double)trafficWatchDuration;
- (double)trafficWatchTime;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)rssi;
- (unint64_t)hash;
- (unint64_t)rapidLqmDuration;
- (unint64_t)roamWaitTime;
- (unint64_t)tdEvalDuration;
- (unsigned)arpFailureCount;
- (unsigned)bcnPerSign;
- (unsigned)bcnRcvs;
- (unsigned)bcnSched;
- (unsigned)dnsServersImpacted;
- (unsigned)dnsServersTotal;
- (unsigned)fwTxFail;
- (unsigned)fwTxFrames;
- (unsigned)fwTxPerSign;
- (unsigned)fwTxRetrans;
- (unsigned)gwArpExpiry;
- (unsigned)metricReason;
- (unsigned)netScore;
- (unsigned)rxFrames;
- (unsigned)sympAwdCode;
- (unsigned)sympSign;
- (unsigned)trafficWatchRx;
- (unsigned)trgDisc;
- (unsigned)txFail;
- (unsigned)txFrames;
- (unsigned)txPerSign;
- (unsigned)txRetrans;
- (unsigned)usrImpact;
- (unsigned)usrInput;
- (unsigned)validState;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArpFailureCount:(unsigned int)a3;
- (void)setBcnPerSign:(unsigned int)a3;
- (void)setBcnRcvs:(unsigned int)a3;
- (void)setBcnSched:(unsigned int)a3;
- (void)setDnsServersImpacted:(unsigned int)a3;
- (void)setDnsServersTotal:(unsigned int)a3;
- (void)setFwTxFail:(unsigned int)a3;
- (void)setFwTxFrames:(unsigned int)a3;
- (void)setFwTxPerSign:(unsigned int)a3;
- (void)setFwTxRetrans:(unsigned int)a3;
- (void)setGateOpenTime:(double)a3;
- (void)setGwArpExpiry:(unsigned int)a3;
- (void)setHasArpFailureCount:(BOOL)a3;
- (void)setHasBcnPerSign:(BOOL)a3;
- (void)setHasBcnRcvs:(BOOL)a3;
- (void)setHasBcnSched:(BOOL)a3;
- (void)setHasDnsServersImpacted:(BOOL)a3;
- (void)setHasDnsServersTotal:(BOOL)a3;
- (void)setHasFwTxFail:(BOOL)a3;
- (void)setHasFwTxFrames:(BOOL)a3;
- (void)setHasFwTxPerSign:(BOOL)a3;
- (void)setHasFwTxRetrans:(BOOL)a3;
- (void)setHasGateOpenTime:(BOOL)a3;
- (void)setHasGwArpExpiry:(BOOL)a3;
- (void)setHasMetricReason:(BOOL)a3;
- (void)setHasNetScore:(BOOL)a3;
- (void)setHasRapidLqmDuration:(BOOL)a3;
- (void)setHasRoamWaitTime:(BOOL)a3;
- (void)setHasRssi:(BOOL)a3;
- (void)setHasRxFrames:(BOOL)a3;
- (void)setHasSympAwdCode:(BOOL)a3;
- (void)setHasSympSign:(BOOL)a3;
- (void)setHasTdEvalDuration:(BOOL)a3;
- (void)setHasTrafficWatchDuration:(BOOL)a3;
- (void)setHasTrafficWatchRx:(BOOL)a3;
- (void)setHasTrafficWatchTime:(BOOL)a3;
- (void)setHasTrgDisc:(BOOL)a3;
- (void)setHasTxFail:(BOOL)a3;
- (void)setHasTxFrames:(BOOL)a3;
- (void)setHasTxPerSign:(BOOL)a3;
- (void)setHasTxRetrans:(BOOL)a3;
- (void)setHasUsrImpact:(BOOL)a3;
- (void)setHasUsrInput:(BOOL)a3;
- (void)setHasValidState:(BOOL)a3;
- (void)setMetricReason:(unsigned int)a3;
- (void)setNetScore:(unsigned int)a3;
- (void)setRapidLqmDuration:(unint64_t)a3;
- (void)setRoamWaitTime:(unint64_t)a3;
- (void)setRssi:(int)a3;
- (void)setRxFrames:(unsigned int)a3;
- (void)setSympAwdCode:(unsigned int)a3;
- (void)setSympSign:(unsigned int)a3;
- (void)setTdEvalDuration:(unint64_t)a3;
- (void)setTrafficWatchDuration:(double)a3;
- (void)setTrafficWatchRx:(unsigned int)a3;
- (void)setTrafficWatchTime:(double)a3;
- (void)setTrgDisc:(unsigned int)a3;
- (void)setTxFail:(unsigned int)a3;
- (void)setTxFrames:(unsigned int)a3;
- (void)setTxPerSign:(unsigned int)a3;
- (void)setTxRetrans:(unsigned int)a3;
- (void)setUsrImpact:(unsigned int)a3;
- (void)setUsrInput:(unsigned int)a3;
- (void)setValidState:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWifiLinkQualityRecord

- (void)setTxFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000000u;
  self->_txFrames = a3;
}

- (void)setHasTxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFBFFFFFF | v3);
}

- (BOOL)hasTxFrames
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTxFail:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000000u;
  self->_txFail = a3;
}

- (void)setHasTxFail:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFDFFFFFF | v3);
}

- (BOOL)hasTxFail
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setTxRetrans:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000000u;
  self->_txRetrans = a3;
}

- (void)setHasTxRetrans:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xEFFFFFFF | v3);
}

- (BOOL)hasTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setBcnSched:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_bcnSched = a3;
}

- (void)setHasBcnSched:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasBcnSched
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setBcnRcvs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_bcnRcvs = a3;
}

- (void)setHasBcnRcvs:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasBcnRcvs
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setFwTxFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_fwTxFrames = a3;
}

- (void)setHasFwTxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasFwTxFrames
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setFwTxFail:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_fwTxFail = a3;
}

- (void)setHasFwTxFail:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasFwTxFail
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setFwTxRetrans:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_fwTxRetrans = a3;
}

- (void)setHasFwTxRetrans:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasFwTxRetrans
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setRxFrames:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_rxFrames = a3;
}

- (void)setHasRxFrames:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasRxFrames
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setRssi:(int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_rssi = a3;
}

- (void)setHasRssi:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTrgDisc:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000000u;
  self->_trgDisc = a3;
}

- (void)setHasTrgDisc:(BOOL)a3
{
  if (a3) {
    int v3 = 0x1000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFEFFFFFF | v3);
}

- (BOOL)hasTrgDisc
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setGwArpExpiry:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_gwArpExpiry = a3;
}

- (void)setHasGwArpExpiry:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasGwArpExpiry
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setUsrInput:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000000u;
  self->_usrInput = a3;
}

- (void)setHasUsrInput:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xBFFFFFFF | v3);
}

- (BOOL)hasUsrInput
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setTxPerSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000000u;
  self->_txPerSign = a3;
}

- (void)setHasTxPerSign:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xF7FFFFFF | v3);
}

- (BOOL)hasTxPerSign
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setFwTxPerSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_fwTxPerSign = a3;
}

- (void)setHasFwTxPerSign:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasFwTxPerSign
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setBcnPerSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_bcnPerSign = a3;
}

- (void)setHasBcnPerSign:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasBcnPerSign
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setSympSign:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400000u;
  self->_sympSign = a3;
}

- (void)setHasSympSign:(BOOL)a3
{
  if (a3) {
    int v3 = 0x400000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFBFFFFF | v3);
}

- (BOOL)hasSympSign
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setNetScore:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_netScore = a3;
}

- (void)setHasNetScore:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasNetScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setUsrImpact:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000000u;
  self->_usrImpact = a3;
}

- (void)setHasUsrImpact:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xDFFFFFFF | v3);
}

- (BOOL)hasUsrImpact
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setSympAwdCode:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200000u;
  self->_sympAwdCode = a3;
}

- (void)setHasSympAwdCode:(BOOL)a3
{
  if (a3) {
    int v3 = 0x200000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFDFFFFF | v3);
}

- (BOOL)hasSympAwdCode
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setArpFailureCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_arpFailureCount = a3;
}

- (void)setHasArpFailureCount:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasArpFailureCount
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setDnsServersImpacted:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_dnsServersImpacted = a3;
}

- (void)setHasDnsServersImpacted:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasDnsServersImpacted
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setDnsServersTotal:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_dnsServersTotal = a3;
}

- (void)setHasDnsServersTotal:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasDnsServersTotal
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setGateOpenTime:(double)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_gateOpenTime = a3;
}

- (void)setHasGateOpenTime:(BOOL)a3
{
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasGateOpenTime
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTrafficWatchRx:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800000u;
  self->_trafficWatchRx = a3;
}

- (void)setHasTrafficWatchRx:(BOOL)a3
{
  if (a3) {
    int v3 = 0x800000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFF7FFFFF | v3);
}

- (BOOL)hasTrafficWatchRx
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setTrafficWatchDuration:(double)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_trafficWatchDuration = a3;
}

- (void)setHasTrafficWatchDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTrafficWatchDuration
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTrafficWatchTime:(double)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_trafficWatchTime = a3;
}

- (void)setHasTrafficWatchTime:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTrafficWatchTime
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setValidState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000000;
  self->_validState = a3;
}

- (void)setHasValidState:(BOOL)a3
{
  if (a3) {
    unsigned int v3 = 0x80000000;
  }
  else {
    unsigned int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(v3 & 0x80000000 | *(_DWORD *)&self->_has & 0x7FFFFFFF);
}

- (BOOL)hasValidState
{
  return *(_DWORD *)&self->_has >> 31;
}

- (void)setMetricReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_metricReason = a3;
}

- (void)setHasMetricReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasMetricReason
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setRapidLqmDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rapidLqmDuration = a3;
}

- (void)setHasRapidLqmDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRapidLqmDuration
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTdEvalDuration:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_tdEvalDuration = a3;
}

- (void)setHasTdEvalDuration:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTdEvalDuration
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRoamWaitTime:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_roamWaitTime = a3;
}

- (void)setHasRoamWaitTime:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($C67A20E2E9CB71E70E8272DEC2C6C683)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasRoamWaitTime
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWifiLinkQualityRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWifiLinkQualityRecord description](&v3, sel_description), -[AWDWifiLinkQualityRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txFrames] forKey:@"txFrames"];
    $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txFail] forKey:@"txFail"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txRetrans] forKey:@"txRetrans"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bcnSched] forKey:@"bcnSched"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bcnRcvs] forKey:@"bcnRcvs"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_fwTxFrames] forKey:@"fwTxFrames"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_fwTxFail] forKey:@"fwTxFail"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_fwTxRetrans] forKey:@"fwTxRetrans"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rxFrames] forKey:@"rxFrames"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithInt:self->_rssi] forKey:@"rssi"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_trgDisc] forKey:@"trgDisc"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gwArpExpiry] forKey:@"gwArpExpiry"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_usrInput] forKey:@"usrInput"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_txPerSign] forKey:@"txPerSign"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_fwTxPerSign] forKey:@"fwTxPerSign"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bcnPerSign] forKey:@"bcnPerSign"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sympSign] forKey:@"sympSign"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_netScore] forKey:@"netScore"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_usrImpact] forKey:@"usrImpact"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sympAwdCode] forKey:@"sympAwdCode"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_arpFailureCount] forKey:@"arpFailureCount"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dnsServersImpacted] forKey:@"dnsServersImpacted"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dnsServersTotal] forKey:@"dnsServersTotal"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithDouble:self->_gateOpenTime] forKey:@"gateOpenTime"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_trafficWatchRx] forKey:@"trafficWatchRx"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithDouble:self->_trafficWatchDuration] forKey:@"trafficWatchDuration"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithDouble:self->_trafficWatchTime] forKey:@"trafficWatchTime"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_validState] forKey:@"validState"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_metricReason] forKey:@"metricReason"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_32;
    }
LABEL_65:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tdEvalDuration] forKey:@"tdEvalDuration"];
    if ((*(_DWORD *)&self->_has & 4) == 0) {
      return v3;
    }
    goto LABEL_33;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rapidLqmDuration] forKey:@"rapidLqmDuration"];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0) {
    goto LABEL_65;
  }
LABEL_32:
  if ((*(unsigned char *)&has & 4) != 0) {
LABEL_33:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_roamWaitTime] forKey:@"roamWaitTime"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWifiLinkQualityRecordReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  PBDataWriterWriteInt32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteDoubleField();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteDoubleField();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteDoubleField();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_32;
    }
LABEL_64:
    PBDataWriterWriteUint64Field();
    if ((*(_DWORD *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_65;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0) {
    goto LABEL_64;
  }
LABEL_32:
  if ((*(unsigned char *)&has & 4) == 0) {
    return;
  }
LABEL_65:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_txFrames;
    *((_DWORD *)a3 + 40) |= 0x4000000u;
    $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 33) = self->_txFail;
  *((_DWORD *)a3 + 40) |= 0x2000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 36) = self->_txRetrans;
  *((_DWORD *)a3 + 40) |= 0x10000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 17) = self->_bcnSched;
  *((_DWORD *)a3 + 40) |= 0x200u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)a3 + 16) = self->_bcnRcvs;
  *((_DWORD *)a3 + 40) |= 0x100u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)a3 + 21) = self->_fwTxFrames;
  *((_DWORD *)a3 + 40) |= 0x2000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)a3 + 20) = self->_fwTxFail;
  *((_DWORD *)a3 + 40) |= 0x1000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)a3 + 23) = self->_fwTxRetrans;
  *((_DWORD *)a3 + 40) |= 0x8000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 28) = self->_rxFrames;
  *((_DWORD *)a3 + 40) |= 0x100000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 27) = self->_rssi;
  *((_DWORD *)a3 + 40) |= 0x80000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 32) = self->_trgDisc;
  *((_DWORD *)a3 + 40) |= 0x1000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 24) = self->_gwArpExpiry;
  *((_DWORD *)a3 + 40) |= 0x10000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 38) = self->_usrInput;
  *((_DWORD *)a3 + 40) |= 0x40000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 35) = self->_txPerSign;
  *((_DWORD *)a3 + 40) |= 0x8000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 22) = self->_fwTxPerSign;
  *((_DWORD *)a3 + 40) |= 0x4000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)a3 + 15) = self->_bcnPerSign;
  *((_DWORD *)a3 + 40) |= 0x80u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)a3 + 30) = self->_sympSign;
  *((_DWORD *)a3 + 40) |= 0x400000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)a3 + 26) = self->_netScore;
  *((_DWORD *)a3 + 40) |= 0x40000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)a3 + 37) = self->_usrImpact;
  *((_DWORD *)a3 + 40) |= 0x20000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)a3 + 29) = self->_sympAwdCode;
  *((_DWORD *)a3 + 40) |= 0x200000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)a3 + 14) = self->_arpFailureCount;
  *((_DWORD *)a3 + 40) |= 0x40u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)a3 + 18) = self->_dnsServersImpacted;
  *((_DWORD *)a3 + 40) |= 0x400u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)a3 + 19) = self->_dnsServersTotal;
  *((_DWORD *)a3 + 40) |= 0x800u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 1) = *(void *)&self->_gateOpenTime;
  *((_DWORD *)a3 + 40) |= 1u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((_DWORD *)a3 + 31) = self->_trafficWatchRx;
  *((_DWORD *)a3 + 40) |= 0x800000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 5) = *(void *)&self->_trafficWatchDuration;
  *((_DWORD *)a3 + 40) |= 0x10u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)a3 + 6) = *(void *)&self->_trafficWatchTime;
  *((_DWORD *)a3 + 40) |= 0x20u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 39) = self->_validState;
  *((_DWORD *)a3 + 40) |= 0x80000000;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 25) = self->_metricReason;
  *((_DWORD *)a3 + 40) |= 0x20000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 2) = self->_rapidLqmDuration;
  *((_DWORD *)a3 + 40) |= 2u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 4) == 0) {
      return;
    }
LABEL_65:
    *((void *)a3 + 3) = self->_roamWaitTime;
    *((_DWORD *)a3 + 40) |= 4u;
    return;
  }
LABEL_64:
  *((void *)a3 + 4) = self->_tdEvalDuration;
  *((_DWORD *)a3 + 40) |= 8u;
  if ((*(_DWORD *)&self->_has & 4) != 0) {
    goto LABEL_65;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    *((_DWORD *)result + 34) = self->_txFrames;
    *((_DWORD *)result + 40) |= 0x4000000u;
    $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
    if ((*(_DWORD *)&has & 0x2000000) == 0)
    {
LABEL_3:
      if ((*(_DWORD *)&has & 0x10000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 33) = self->_txFail;
  *((_DWORD *)result + 40) |= 0x2000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)result + 36) = self->_txRetrans;
  *((_DWORD *)result + 40) |= 0x10000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  *((_DWORD *)result + 17) = self->_bcnSched;
  *((_DWORD *)result + 40) |= 0x200u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  *((_DWORD *)result + 16) = self->_bcnRcvs;
  *((_DWORD *)result + 40) |= 0x100u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_41;
  }
LABEL_40:
  *((_DWORD *)result + 21) = self->_fwTxFrames;
  *((_DWORD *)result + 40) |= 0x2000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_42;
  }
LABEL_41:
  *((_DWORD *)result + 20) = self->_fwTxFail;
  *((_DWORD *)result + 40) |= 0x1000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_9:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)result + 23) = self->_fwTxRetrans;
  *((_DWORD *)result + 40) |= 0x8000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_10:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)result + 28) = self->_rxFrames;
  *((_DWORD *)result + 40) |= 0x100000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_11:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)result + 27) = self->_rssi;
  *((_DWORD *)result + 40) |= 0x80000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_12:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)result + 32) = self->_trgDisc;
  *((_DWORD *)result + 40) |= 0x1000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)result + 24) = self->_gwArpExpiry;
  *((_DWORD *)result + 40) |= 0x10000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)result + 38) = self->_usrInput;
  *((_DWORD *)result + 40) |= 0x40000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)result + 35) = self->_txPerSign;
  *((_DWORD *)result + 40) |= 0x8000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)result + 22) = self->_fwTxPerSign;
  *((_DWORD *)result + 40) |= 0x4000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)result + 15) = self->_bcnPerSign;
  *((_DWORD *)result + 40) |= 0x80u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)result + 30) = self->_sympSign;
  *((_DWORD *)result + 40) |= 0x400000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((_DWORD *)result + 26) = self->_netScore;
  *((_DWORD *)result + 40) |= 0x40000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((_DWORD *)result + 37) = self->_usrImpact;
  *((_DWORD *)result + 40) |= 0x20000000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((_DWORD *)result + 29) = self->_sympAwdCode;
  *((_DWORD *)result + 40) |= 0x200000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((_DWORD *)result + 14) = self->_arpFailureCount;
  *((_DWORD *)result + 40) |= 0x40u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((_DWORD *)result + 18) = self->_dnsServersImpacted;
  *((_DWORD *)result + 40) |= 0x400u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_24:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((_DWORD *)result + 19) = self->_dnsServersTotal;
  *((_DWORD *)result + 40) |= 0x800u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_25:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 1) = *(void *)&self->_gateOpenTime;
  *((_DWORD *)result + 40) |= 1u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)result + 31) = self->_trafficWatchRx;
  *((_DWORD *)result + 40) |= 0x800000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_27:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 5) = *(void *)&self->_trafficWatchDuration;
  *((_DWORD *)result + 40) |= 0x10u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)result + 6) = *(void *)&self->_trafficWatchTime;
  *((_DWORD *)result + 40) |= 0x20u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_29:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)result + 39) = self->_validState;
  *((_DWORD *)result + 40) |= 0x80000000;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_30:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)result + 25) = self->_metricReason;
  *((_DWORD *)result + 40) |= 0x20000u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)result + 2) = self->_rapidLqmDuration;
  *((_DWORD *)result + 40) |= 2u;
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_32:
    if ((*(unsigned char *)&has & 4) == 0) {
      return result;
    }
    goto LABEL_33;
  }
LABEL_65:
  *((void *)result + 4) = self->_tdEvalDuration;
  *((_DWORD *)result + 40) |= 8u;
  if ((*(_DWORD *)&self->_has & 4) == 0) {
    return result;
  }
LABEL_33:
  *((void *)result + 3) = self->_roamWaitTime;
  *((_DWORD *)result + 40) |= 4u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
    int v7 = *((_DWORD *)a3 + 40);
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_txFrames != *((_DWORD *)a3 + 34)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_txFail != *((_DWORD *)a3 + 33)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_txRetrans != *((_DWORD *)a3 + 36)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_bcnSched != *((_DWORD *)a3 + 17)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_bcnRcvs != *((_DWORD *)a3 + 16)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_fwTxFrames != *((_DWORD *)a3 + 21)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_fwTxFail != *((_DWORD *)a3 + 20)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_fwTxRetrans != *((_DWORD *)a3 + 23)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_rxFrames != *((_DWORD *)a3 + 28)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_rssi != *((_DWORD *)a3 + 27)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_trgDisc != *((_DWORD *)a3 + 32)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_gwArpExpiry != *((_DWORD *)a3 + 24)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_usrInput != *((_DWORD *)a3 + 38)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_txPerSign != *((_DWORD *)a3 + 35)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_fwTxPerSign != *((_DWORD *)a3 + 22)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_bcnPerSign != *((_DWORD *)a3 + 15)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_sympSign != *((_DWORD *)a3 + 30)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_netScore != *((_DWORD *)a3 + 26)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_usrImpact != *((_DWORD *)a3 + 37)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_sympAwdCode != *((_DWORD *)a3 + 29)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_arpFailureCount != *((_DWORD *)a3 + 14)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_dnsServersImpacted != *((_DWORD *)a3 + 18)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_dnsServersTotal != *((_DWORD *)a3 + 19)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_161;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_gateOpenTime != *((double *)a3 + 1)) {
        goto LABEL_161;
      }
    }
    else if (v7)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_trafficWatchRx != *((_DWORD *)a3 + 31)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_trafficWatchDuration != *((double *)a3 + 5)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_161;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_trafficWatchTime != *((double *)a3 + 6)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_161;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_validState != *((_DWORD *)a3 + 39)) {
        goto LABEL_161;
      }
    }
    else if (v7 < 0)
    {
LABEL_161:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_metricReason != *((_DWORD *)a3 + 25)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_161;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rapidLqmDuration != *((void *)a3 + 2)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_161;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_tdEvalDuration != *((void *)a3 + 4)) {
        goto LABEL_161;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_161;
    }
    LOBYTE(v5) = (*((_DWORD *)a3 + 40) & 4) == 0;
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_roamWaitTime != *((void *)a3 + 3)) {
        goto LABEL_161;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $C67A20E2E9CB71E70E8272DEC2C6C683 has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    uint64_t v48 = 2654435761 * self->_txFrames;
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
LABEL_3:
      uint64_t v47 = 2654435761 * self->_txFail;
      if ((*(_DWORD *)&has & 0x10000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v48 = 0;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_4:
    uint64_t v46 = 2654435761 * self->_txRetrans;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v46 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_5:
    uint64_t v45 = 2654435761 * self->_bcnSched;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v45 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_6:
    uint64_t v44 = 2654435761 * self->_bcnRcvs;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v44 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_7:
    uint64_t v43 = 2654435761 * self->_fwTxFrames;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v43 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_8:
    uint64_t v42 = 2654435761 * self->_fwTxFail;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v42 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_9:
    uint64_t v41 = 2654435761 * self->_fwTxRetrans;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v41 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_10:
    uint64_t v40 = 2654435761 * self->_rxFrames;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v40 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_11:
    uint64_t v39 = 2654435761 * self->_rssi;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_39;
  }
LABEL_38:
  uint64_t v39 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_12:
    uint64_t v38 = 2654435761 * self->_trgDisc;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_40;
  }
LABEL_39:
  uint64_t v38 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_13:
    uint64_t v37 = 2654435761 * self->_gwArpExpiry;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_14:
    uint64_t v36 = 2654435761 * self->_usrInput;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_42;
  }
LABEL_41:
  uint64_t v36 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_15:
    uint64_t v35 = 2654435761 * self->_txPerSign;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_43;
  }
LABEL_42:
  uint64_t v35 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_16:
    uint64_t v34 = 2654435761 * self->_fwTxPerSign;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_17;
    }
    goto LABEL_44;
  }
LABEL_43:
  uint64_t v34 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_17:
    uint64_t v33 = 2654435761 * self->_bcnPerSign;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_45;
  }
LABEL_44:
  uint64_t v33 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_18:
    uint64_t v32 = 2654435761 * self->_sympSign;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_46;
  }
LABEL_45:
  uint64_t v32 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_19:
    uint64_t v31 = 2654435761 * self->_netScore;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_47;
  }
LABEL_46:
  uint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_20:
    uint64_t v30 = 2654435761 * self->_usrImpact;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_48;
  }
LABEL_47:
  uint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_21:
    uint64_t v4 = 2654435761 * self->_sympAwdCode;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_22;
    }
    goto LABEL_49;
  }
LABEL_48:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_22:
    uint64_t v5 = 2654435761 * self->_arpFailureCount;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_23:
    uint64_t v6 = 2654435761 * self->_dnsServersImpacted;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_24;
    }
LABEL_51:
    uint64_t v7 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_25;
    }
LABEL_52:
    unint64_t v12 = 0;
    goto LABEL_55;
  }
LABEL_50:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x800) == 0) {
    goto LABEL_51;
  }
LABEL_24:
  uint64_t v7 = 2654435761 * self->_dnsServersTotal;
  if ((*(unsigned char *)&has & 1) == 0) {
    goto LABEL_52;
  }
LABEL_25:
  double gateOpenTime = self->_gateOpenTime;
  double v9 = -gateOpenTime;
  if (gateOpenTime >= 0.0) {
    double v9 = self->_gateOpenTime;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_55:
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    uint64_t v13 = 2654435761 * self->_trafficWatchRx;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_57;
    }
LABEL_62:
    unint64_t v18 = 0;
    goto LABEL_65;
  }
  uint64_t v13 = 0;
  if ((*(unsigned char *)&has & 0x10) == 0) {
    goto LABEL_62;
  }
LABEL_57:
  double trafficWatchDuration = self->_trafficWatchDuration;
  double v15 = -trafficWatchDuration;
  if (trafficWatchDuration >= 0.0) {
    double v15 = self->_trafficWatchDuration;
  }
  long double v16 = floor(v15 + 0.5);
  double v17 = (v15 - v16) * 1.84467441e19;
  unint64_t v18 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
  if (v17 >= 0.0)
  {
    if (v17 > 0.0) {
      v18 += (unint64_t)v17;
    }
  }
  else
  {
    v18 -= (unint64_t)fabs(v17);
  }
LABEL_65:
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    double trafficWatchTime = self->_trafficWatchTime;
    double v21 = -trafficWatchTime;
    if (trafficWatchTime >= 0.0) {
      double v21 = self->_trafficWatchTime;
    }
    long double v22 = floor(v21 + 0.5);
    double v23 = (v21 - v22) * 1.84467441e19;
    unint64_t v19 = 2654435761u * (unint64_t)fmod(v22, 1.84467441e19);
    if (v23 >= 0.0)
    {
      if (v23 > 0.0) {
        v19 += (unint64_t)v23;
      }
    }
    else
    {
      v19 -= (unint64_t)fabs(v23);
    }
  }
  else
  {
    unint64_t v19 = 0;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    uint64_t v24 = 2654435761 * self->_validState;
    if ((*(_DWORD *)&has & 0x20000) == 0)
    {
LABEL_75:
      uint64_t v25 = 0;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_76;
      }
      goto LABEL_81;
    }
  }
  else
  {
    uint64_t v24 = 0;
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_75;
    }
  }
  uint64_t v25 = 2654435761 * self->_metricReason;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_76:
    unint64_t v26 = 2654435761u * self->_rapidLqmDuration;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_77;
    }
LABEL_82:
    unint64_t v27 = 0;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_78;
    }
LABEL_83:
    unint64_t v28 = 0;
    return v47 ^ v48 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_81:
  unint64_t v26 = 0;
  if ((*(unsigned char *)&has & 8) == 0) {
    goto LABEL_82;
  }
LABEL_77:
  unint64_t v27 = 2654435761u * self->_tdEvalDuration;
  if ((*(unsigned char *)&has & 4) == 0) {
    goto LABEL_83;
  }
LABEL_78:
  unint64_t v28 = 2654435761u * self->_roamWaitTime;
  return v47 ^ v48 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v4 ^ v5 ^ v6 ^ v7 ^ v12 ^ v13 ^ v18 ^ v19 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x4000000) != 0)
  {
    self->_txFrames = *((_DWORD *)a3 + 34);
    *(_DWORD *)&self->_has |= 0x4000000u;
    int v3 = *((_DWORD *)a3 + 40);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_3:
      if ((v3 & 0x10000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_3;
  }
  self->_txFail = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x2000000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_txRetrans = *((_DWORD *)a3 + 36);
  *(_DWORD *)&self->_has |= 0x10000000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x200) == 0)
  {
LABEL_5:
    if ((v3 & 0x100) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_bcnSched = *((_DWORD *)a3 + 17);
  *(_DWORD *)&self->_has |= 0x200u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x100) == 0)
  {
LABEL_6:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_bcnRcvs = *((_DWORD *)a3 + 16);
  *(_DWORD *)&self->_has |= 0x100u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x2000) == 0)
  {
LABEL_7:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_fwTxFrames = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x1000) == 0)
  {
LABEL_8:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_fwTxFail = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x8000) == 0)
  {
LABEL_9:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_fwTxRetrans = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x100000) == 0)
  {
LABEL_10:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_43;
  }
LABEL_42:
  self->_rxFrames = *((_DWORD *)a3 + 28);
  *(_DWORD *)&self->_has |= 0x100000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x80000) == 0)
  {
LABEL_11:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_44;
  }
LABEL_43:
  self->_rssi = *((_DWORD *)a3 + 27);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_12:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_trgDisc = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x1000000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x10000) == 0)
  {
LABEL_13:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_gwArpExpiry = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_14:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_usrInput = *((_DWORD *)a3 + 38);
  *(_DWORD *)&self->_has |= 0x40000000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_15:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_txPerSign = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x8000000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x4000) == 0)
  {
LABEL_16:
    if ((v3 & 0x80) == 0) {
      goto LABEL_17;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_fwTxPerSign = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x80) == 0)
  {
LABEL_17:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_bcnPerSign = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x80u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x400000) == 0)
  {
LABEL_18:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_sympSign = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x400000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x40000) == 0)
  {
LABEL_19:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_netScore = *((_DWORD *)a3 + 26);
  *(_DWORD *)&self->_has |= 0x40000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_usrImpact = *((_DWORD *)a3 + 37);
  *(_DWORD *)&self->_has |= 0x20000000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x200000) == 0)
  {
LABEL_21:
    if ((v3 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_sympAwdCode = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x200000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x40) == 0)
  {
LABEL_22:
    if ((v3 & 0x400) == 0) {
      goto LABEL_23;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_arpFailureCount = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x40u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x400) == 0)
  {
LABEL_23:
    if ((v3 & 0x800) == 0) {
      goto LABEL_24;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_dnsServersImpacted = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x400u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x800) == 0)
  {
LABEL_24:
    if ((v3 & 1) == 0) {
      goto LABEL_25;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_dnsServersTotal = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x800u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 1) == 0)
  {
LABEL_25:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_double gateOpenTime = *((double *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x800000) == 0)
  {
LABEL_26:
    if ((v3 & 0x10) == 0) {
      goto LABEL_27;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_trafficWatchRx = *((_DWORD *)a3 + 31);
  *(_DWORD *)&self->_has |= 0x800000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x10) == 0)
  {
LABEL_27:
    if ((v3 & 0x20) == 0) {
      goto LABEL_28;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_double trafficWatchDuration = *((double *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x20) == 0)
  {
LABEL_28:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_double trafficWatchTime = *((double *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_validState = *((_DWORD *)a3 + 39);
  *(_DWORD *)&self->_has |= 0x80000000;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 0x20000) == 0)
  {
LABEL_30:
    if ((v3 & 2) == 0) {
      goto LABEL_31;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_metricReason = *((_DWORD *)a3 + 25);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 2) == 0)
  {
LABEL_31:
    if ((v3 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_rapidLqmDuration = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v3 = *((_DWORD *)a3 + 40);
  if ((v3 & 8) == 0)
  {
LABEL_32:
    if ((v3 & 4) == 0) {
      return;
    }
LABEL_65:
    self->_roamWaitTime = *((void *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    return;
  }
LABEL_64:
  self->_tdEvalDuration = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  if ((*((_DWORD *)a3 + 40) & 4) != 0) {
    goto LABEL_65;
  }
}

- (unsigned)txFrames
{
  return self->_txFrames;
}

- (unsigned)txFail
{
  return self->_txFail;
}

- (unsigned)txRetrans
{
  return self->_txRetrans;
}

- (unsigned)bcnSched
{
  return self->_bcnSched;
}

- (unsigned)bcnRcvs
{
  return self->_bcnRcvs;
}

- (unsigned)fwTxFrames
{
  return self->_fwTxFrames;
}

- (unsigned)fwTxFail
{
  return self->_fwTxFail;
}

- (unsigned)fwTxRetrans
{
  return self->_fwTxRetrans;
}

- (unsigned)rxFrames
{
  return self->_rxFrames;
}

- (int)rssi
{
  return self->_rssi;
}

- (unsigned)trgDisc
{
  return self->_trgDisc;
}

- (unsigned)gwArpExpiry
{
  return self->_gwArpExpiry;
}

- (unsigned)usrInput
{
  return self->_usrInput;
}

- (unsigned)txPerSign
{
  return self->_txPerSign;
}

- (unsigned)fwTxPerSign
{
  return self->_fwTxPerSign;
}

- (unsigned)bcnPerSign
{
  return self->_bcnPerSign;
}

- (unsigned)sympSign
{
  return self->_sympSign;
}

- (unsigned)netScore
{
  return self->_netScore;
}

- (unsigned)usrImpact
{
  return self->_usrImpact;
}

- (unsigned)sympAwdCode
{
  return self->_sympAwdCode;
}

- (unsigned)arpFailureCount
{
  return self->_arpFailureCount;
}

- (unsigned)dnsServersImpacted
{
  return self->_dnsServersImpacted;
}

- (unsigned)dnsServersTotal
{
  return self->_dnsServersTotal;
}

- (double)gateOpenTime
{
  return self->_gateOpenTime;
}

- (unsigned)trafficWatchRx
{
  return self->_trafficWatchRx;
}

- (double)trafficWatchDuration
{
  return self->_trafficWatchDuration;
}

- (double)trafficWatchTime
{
  return self->_trafficWatchTime;
}

- (unsigned)validState
{
  return self->_validState;
}

- (unsigned)metricReason
{
  return self->_metricReason;
}

- (unint64_t)rapidLqmDuration
{
  return self->_rapidLqmDuration;
}

- (unint64_t)tdEvalDuration
{
  return self->_tdEvalDuration;
}

- (unint64_t)roamWaitTime
{
  return self->_roamWaitTime;
}

@end