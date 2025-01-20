@interface AWDWiFiMetricsManagerInfraInterface
- (AWDWiFiMetricsManagerStateMachine)activityDown;
- (AWDWiFiMetricsManagerStateMachine)activityInvoluntarilyDown;
- (AWDWiFiMetricsManagerStateMachine)activityRoaming;
- (AWDWiFiMetricsManagerStateMachine)activityScanning;
- (AWDWiFiMetricsManagerStateMachine)activityUp;
- (AWDWiFiMetricsManagerStateMachine)avgCCA0pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA100pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA125pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA25pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA375pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA50pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA625pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA75pct;
- (AWDWiFiMetricsManagerStateMachine)avgCCA875pct;
- (AWDWiFiMetricsManagerStateMachine)linkLatency0ms;
- (AWDWiFiMetricsManagerStateMachine)linkLatency1024ms;
- (AWDWiFiMetricsManagerStateMachine)linkLatency128ms;
- (AWDWiFiMetricsManagerStateMachine)linkLatency256ms;
- (AWDWiFiMetricsManagerStateMachine)linkLatency512ms;
- (AWDWiFiMetricsManagerStateMachine)linkLatency64ms;
- (AWDWiFiMetricsManagerStateMachine)linkOpen0pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen100pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen125pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen25pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen375pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen50pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen625pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen75pct;
- (AWDWiFiMetricsManagerStateMachine)linkOpen875pct;
- (AWDWiFiMetricsManagerStateMachine)lqmBad;
- (AWDWiFiMetricsManagerStateMachine)lqmGood;
- (AWDWiFiMetricsManagerStateMachine)lqmOff;
- (AWDWiFiMetricsManagerStateMachine)lqmPoor;
- (AWDWiFiMetricsManagerStateMachine)lqmUnknown;
- (BOOL)hasActivityDown;
- (BOOL)hasActivityInvoluntarilyDown;
- (BOOL)hasActivityRoaming;
- (BOOL)hasActivityScanning;
- (BOOL)hasActivityUp;
- (BOOL)hasAvgCCA;
- (BOOL)hasAvgCCA0pct;
- (BOOL)hasAvgCCA100pct;
- (BOOL)hasAvgCCA125pct;
- (BOOL)hasAvgCCA25pct;
- (BOOL)hasAvgCCA375pct;
- (BOOL)hasAvgCCA50pct;
- (BOOL)hasAvgCCA625pct;
- (BOOL)hasAvgCCA75pct;
- (BOOL)hasAvgCCA875pct;
- (BOOL)hasDataTransferRateMpbs;
- (BOOL)hasEffectiveDataTransferRateMpbs;
- (BOOL)hasEffectiveLinkRateMpbs;
- (BOOL)hasLinkLatency0ms;
- (BOOL)hasLinkLatency1024ms;
- (BOOL)hasLinkLatency128ms;
- (BOOL)hasLinkLatency256ms;
- (BOOL)hasLinkLatency512ms;
- (BOOL)hasLinkLatency64ms;
- (BOOL)hasLinkLatencyMs;
- (BOOL)hasLinkOpen0pct;
- (BOOL)hasLinkOpen100pct;
- (BOOL)hasLinkOpen125pct;
- (BOOL)hasLinkOpen25pct;
- (BOOL)hasLinkOpen375pct;
- (BOOL)hasLinkOpen50pct;
- (BOOL)hasLinkOpen625pct;
- (BOOL)hasLinkOpen75pct;
- (BOOL)hasLinkOpen875pct;
- (BOOL)hasLinkOpenPct;
- (BOOL)hasLinkRateMbps;
- (BOOL)hasLqm;
- (BOOL)hasLqmBad;
- (BOOL)hasLqmGood;
- (BOOL)hasLqmOff;
- (BOOL)hasLqmPoor;
- (BOOL)hasLqmUnknown;
- (BOOL)hasRxBytes;
- (BOOL)hasRxPackets;
- (BOOL)hasTimestamp;
- (BOOL)hasTxBytes;
- (BOOL)hasTxBytesBe;
- (BOOL)hasTxBytesBk;
- (BOOL)hasTxBytesVi;
- (BOOL)hasTxBytesVo;
- (BOOL)hasTxPackets;
- (BOOL)hasTxPacketsBe;
- (BOOL)hasTxPacketsBk;
- (BOOL)hasTxPacketsVi;
- (BOOL)hasTxPacketsVo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)rxBytes;
- (unint64_t)rxPackets;
- (unint64_t)timestamp;
- (unint64_t)txBytes;
- (unint64_t)txBytesBe;
- (unint64_t)txBytesBk;
- (unint64_t)txBytesVi;
- (unint64_t)txBytesVo;
- (unint64_t)txPackets;
- (unint64_t)txPacketsBe;
- (unint64_t)txPacketsBk;
- (unint64_t)txPacketsVi;
- (unint64_t)txPacketsVo;
- (unsigned)avgCCA;
- (unsigned)dataTransferRateMpbs;
- (unsigned)effectiveDataTransferRateMpbs;
- (unsigned)effectiveLinkRateMpbs;
- (unsigned)linkLatencyMs;
- (unsigned)linkOpenPct;
- (unsigned)linkRateMbps;
- (unsigned)lqm;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setActivityDown:(id)a3;
- (void)setActivityInvoluntarilyDown:(id)a3;
- (void)setActivityRoaming:(id)a3;
- (void)setActivityScanning:(id)a3;
- (void)setActivityUp:(id)a3;
- (void)setAvgCCA0pct:(id)a3;
- (void)setAvgCCA100pct:(id)a3;
- (void)setAvgCCA125pct:(id)a3;
- (void)setAvgCCA25pct:(id)a3;
- (void)setAvgCCA375pct:(id)a3;
- (void)setAvgCCA50pct:(id)a3;
- (void)setAvgCCA625pct:(id)a3;
- (void)setAvgCCA75pct:(id)a3;
- (void)setAvgCCA875pct:(id)a3;
- (void)setAvgCCA:(unsigned int)a3;
- (void)setDataTransferRateMpbs:(unsigned int)a3;
- (void)setEffectiveDataTransferRateMpbs:(unsigned int)a3;
- (void)setEffectiveLinkRateMpbs:(unsigned int)a3;
- (void)setHasAvgCCA:(BOOL)a3;
- (void)setHasDataTransferRateMpbs:(BOOL)a3;
- (void)setHasEffectiveDataTransferRateMpbs:(BOOL)a3;
- (void)setHasEffectiveLinkRateMpbs:(BOOL)a3;
- (void)setHasLinkLatencyMs:(BOOL)a3;
- (void)setHasLinkOpenPct:(BOOL)a3;
- (void)setHasLinkRateMbps:(BOOL)a3;
- (void)setHasLqm:(BOOL)a3;
- (void)setHasRxBytes:(BOOL)a3;
- (void)setHasRxPackets:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxBytes:(BOOL)a3;
- (void)setHasTxBytesBe:(BOOL)a3;
- (void)setHasTxBytesBk:(BOOL)a3;
- (void)setHasTxBytesVi:(BOOL)a3;
- (void)setHasTxBytesVo:(BOOL)a3;
- (void)setHasTxPackets:(BOOL)a3;
- (void)setHasTxPacketsBe:(BOOL)a3;
- (void)setHasTxPacketsBk:(BOOL)a3;
- (void)setHasTxPacketsVi:(BOOL)a3;
- (void)setHasTxPacketsVo:(BOOL)a3;
- (void)setLinkLatency0ms:(id)a3;
- (void)setLinkLatency1024ms:(id)a3;
- (void)setLinkLatency128ms:(id)a3;
- (void)setLinkLatency256ms:(id)a3;
- (void)setLinkLatency512ms:(id)a3;
- (void)setLinkLatency64ms:(id)a3;
- (void)setLinkLatencyMs:(unsigned int)a3;
- (void)setLinkOpen0pct:(id)a3;
- (void)setLinkOpen100pct:(id)a3;
- (void)setLinkOpen125pct:(id)a3;
- (void)setLinkOpen25pct:(id)a3;
- (void)setLinkOpen375pct:(id)a3;
- (void)setLinkOpen50pct:(id)a3;
- (void)setLinkOpen625pct:(id)a3;
- (void)setLinkOpen75pct:(id)a3;
- (void)setLinkOpen875pct:(id)a3;
- (void)setLinkOpenPct:(unsigned int)a3;
- (void)setLinkRateMbps:(unsigned int)a3;
- (void)setLqm:(unsigned int)a3;
- (void)setLqmBad:(id)a3;
- (void)setLqmGood:(id)a3;
- (void)setLqmOff:(id)a3;
- (void)setLqmPoor:(id)a3;
- (void)setLqmUnknown:(id)a3;
- (void)setRxBytes:(unint64_t)a3;
- (void)setRxPackets:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxBytes:(unint64_t)a3;
- (void)setTxBytesBe:(unint64_t)a3;
- (void)setTxBytesBk:(unint64_t)a3;
- (void)setTxBytesVi:(unint64_t)a3;
- (void)setTxBytesVo:(unint64_t)a3;
- (void)setTxPackets:(unint64_t)a3;
- (void)setTxPacketsBe:(unint64_t)a3;
- (void)setTxPacketsBk:(unint64_t)a3;
- (void)setTxPacketsVi:(unint64_t)a3;
- (void)setTxPacketsVo:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerInfraInterface

- (void)dealloc
{
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkLatency0ms:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkLatency64ms:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkLatency128ms:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkLatency256ms:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkLatency512ms:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkLatency1024ms:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen0pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen125pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen25pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen375pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen50pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen625pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen75pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen875pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLinkOpen100pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA0pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA125pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA25pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA375pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA50pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA625pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA75pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA875pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setAvgCCA100pct:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLqmOff:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLqmUnknown:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLqmBad:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLqmPoor:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setLqmGood:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setActivityUp:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setActivityDown:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setActivityInvoluntarilyDown:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setActivityScanning:0];
  [(AWDWiFiMetricsManagerInfraInterface *)self setActivityRoaming:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerInfraInterface;
  [(AWDWiFiMetricsManagerInfraInterface *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setRxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_rxPackets = a3;
}

- (void)setHasRxPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasRxPackets
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTxPackets:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_txPackets = a3;
}

- (void)setHasTxPackets:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasTxPackets
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setTxPacketsBe:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_txPacketsBe = a3;
}

- (void)setHasTxPacketsBe:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasTxPacketsBe
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTxPacketsBk:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_txPacketsBk = a3;
}

- (void)setHasTxPacketsBk:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasTxPacketsBk
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setTxPacketsVi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_txPacketsVi = a3;
}

- (void)setHasTxPacketsVi:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasTxPacketsVi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setTxPacketsVo:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_txPacketsVo = a3;
}

- (void)setHasTxPacketsVo:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasTxPacketsVo
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setRxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_rxBytes = a3;
}

- (void)setHasRxBytes:(BOOL)a3
{
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasRxBytes
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setTxBytes:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_txBytes = a3;
}

- (void)setHasTxBytes:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTxBytes
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTxBytesBe:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_txBytesBe = a3;
}

- (void)setHasTxBytesBe:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasTxBytesBe
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTxBytesBk:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_txBytesBk = a3;
}

- (void)setHasTxBytesBk:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasTxBytesBk
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setTxBytesVi:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_txBytesVi = a3;
}

- (void)setHasTxBytesVi:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasTxBytesVi
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setTxBytesVo:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_txBytesVo = a3;
}

- (void)setHasTxBytesVo:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasTxBytesVo
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setLinkRateMbps:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_linkRateMbps = a3;
}

- (void)setHasLinkRateMbps:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasLinkRateMbps
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEffectiveLinkRateMpbs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_effectiveLinkRateMpbs = a3;
}

- (void)setHasEffectiveLinkRateMpbs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasEffectiveLinkRateMpbs
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setDataTransferRateMpbs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_dataTransferRateMpbs = a3;
}

- (void)setHasDataTransferRateMpbs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasDataTransferRateMpbs
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setEffectiveDataTransferRateMpbs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_effectiveDataTransferRateMpbs = a3;
}

- (void)setHasEffectiveDataTransferRateMpbs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasEffectiveDataTransferRateMpbs
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setLinkLatencyMs:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_linkLatencyMs = a3;
}

- (void)setHasLinkLatencyMs:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasLinkLatencyMs
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (BOOL)hasLinkLatency0ms
{
  return self->_linkLatency0ms != 0;
}

- (BOOL)hasLinkLatency64ms
{
  return self->_linkLatency64ms != 0;
}

- (BOOL)hasLinkLatency128ms
{
  return self->_linkLatency128ms != 0;
}

- (BOOL)hasLinkLatency256ms
{
  return self->_linkLatency256ms != 0;
}

- (BOOL)hasLinkLatency512ms
{
  return self->_linkLatency512ms != 0;
}

- (BOOL)hasLinkLatency1024ms
{
  return self->_linkLatency1024ms != 0;
}

- (void)setLinkOpenPct:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_linkOpenPct = a3;
}

- (void)setHasLinkOpenPct:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasLinkOpenPct
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (BOOL)hasLinkOpen0pct
{
  return self->_linkOpen0pct != 0;
}

- (BOOL)hasLinkOpen125pct
{
  return self->_linkOpen125pct != 0;
}

- (BOOL)hasLinkOpen25pct
{
  return self->_linkOpen25pct != 0;
}

- (BOOL)hasLinkOpen375pct
{
  return self->_linkOpen375pct != 0;
}

- (BOOL)hasLinkOpen50pct
{
  return self->_linkOpen50pct != 0;
}

- (BOOL)hasLinkOpen625pct
{
  return self->_linkOpen625pct != 0;
}

- (BOOL)hasLinkOpen75pct
{
  return self->_linkOpen75pct != 0;
}

- (BOOL)hasLinkOpen875pct
{
  return self->_linkOpen875pct != 0;
}

- (BOOL)hasLinkOpen100pct
{
  return self->_linkOpen100pct != 0;
}

- (void)setAvgCCA:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_avgCCA = a3;
}

- (void)setHasAvgCCA:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasAvgCCA
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (BOOL)hasAvgCCA0pct
{
  return self->_avgCCA0pct != 0;
}

- (BOOL)hasAvgCCA125pct
{
  return self->_avgCCA125pct != 0;
}

- (BOOL)hasAvgCCA25pct
{
  return self->_avgCCA25pct != 0;
}

- (BOOL)hasAvgCCA375pct
{
  return self->_avgCCA375pct != 0;
}

- (BOOL)hasAvgCCA50pct
{
  return self->_avgCCA50pct != 0;
}

- (BOOL)hasAvgCCA625pct
{
  return self->_avgCCA625pct != 0;
}

- (BOOL)hasAvgCCA75pct
{
  return self->_avgCCA75pct != 0;
}

- (BOOL)hasAvgCCA875pct
{
  return self->_avgCCA875pct != 0;
}

- (BOOL)hasAvgCCA100pct
{
  return self->_avgCCA100pct != 0;
}

- (void)setLqm:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100000u;
  self->_lqm = a3;
}

- (void)setHasLqm:(BOOL)a3
{
  if (a3) {
    int v3 = 0x100000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($D6F352D4FD6CE9CC3730891842732671)(*(_DWORD *)&self->_has & 0xFFEFFFFF | v3);
}

- (BOOL)hasLqm
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (BOOL)hasLqmOff
{
  return self->_lqmOff != 0;
}

- (BOOL)hasLqmUnknown
{
  return self->_lqmUnknown != 0;
}

- (BOOL)hasLqmBad
{
  return self->_lqmBad != 0;
}

- (BOOL)hasLqmPoor
{
  return self->_lqmPoor != 0;
}

- (BOOL)hasLqmGood
{
  return self->_lqmGood != 0;
}

- (BOOL)hasActivityUp
{
  return self->_activityUp != 0;
}

- (BOOL)hasActivityDown
{
  return self->_activityDown != 0;
}

- (BOOL)hasActivityInvoluntarilyDown
{
  return self->_activityInvoluntarilyDown != 0;
}

- (BOOL)hasActivityScanning
{
  return self->_activityScanning != 0;
}

- (BOOL)hasActivityRoaming
{
  return self->_activityRoaming != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerInfraInterface;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerInfraInterface description](&v3, sel_description), -[AWDWiFiMetricsManagerInfraInterface dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_97;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxPackets] forKey:@"rxPackets"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPackets] forKey:@"txPackets"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_99;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPacketsBe] forKey:@"txPacketsBe"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_100;
  }
LABEL_99:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPacketsBk] forKey:@"txPacketsBk"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_101;
  }
LABEL_100:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPacketsVi] forKey:@"txPacketsVi"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_102;
  }
LABEL_101:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPacketsVo] forKey:@"txPacketsVo"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_103;
  }
LABEL_102:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxBytes] forKey:@"rxBytes"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_104;
  }
LABEL_103:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytes] forKey:@"txBytes"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_105;
  }
LABEL_104:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytesBe] forKey:@"txBytesBe"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_106;
  }
LABEL_105:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytesBk] forKey:@"txBytesBk"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_107;
  }
LABEL_106:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytesVi] forKey:@"txBytesVi"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txBytesVo] forKey:@"txBytesVo"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_109;
  }
LABEL_108:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_linkRateMbps] forKey:@"linkRate_Mbps"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_110;
  }
LABEL_109:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_effectiveLinkRateMpbs] forKey:@"effectiveLinkRate_Mpbs"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_111;
  }
LABEL_110:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_dataTransferRateMpbs] forKey:@"dataTransferRate_Mpbs"];
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_111:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_effectiveDataTransferRateMpbs] forKey:@"effectiveDataTransferRate_Mpbs"];
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_19:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_linkLatencyMs] forKey:@"linkLatency_ms"];
LABEL_20:
  linkLatency0ms = self->_linkLatency0ms;
  if (linkLatency0ms) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency0ms, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"linkLatency_0ms"];
  }
  linkLatency64ms = self->_linkLatency64ms;
  if (linkLatency64ms) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency64ms, "dictionaryRepresentation") forKey:@"linkLatency_64ms"];
  }
  linkLatency128ms = self->_linkLatency128ms;
  if (linkLatency128ms) {
    [v3 setObject:[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency128ms, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"linkLatency_128ms"];
  }
  linkLatency256ms = self->_linkLatency256ms;
  if (linkLatency256ms) {
    [v3 setObject:linkLatency256ms forKey:@"linkLatency_256ms"];
  }
  linkLatency512ms = self->_linkLatency512ms;
  if (linkLatency512ms) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkLatency512ms, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"linkLatency_512ms"];
  }
  linkLatency1024ms = self->_linkLatency1024ms;
  if (linkLatency1024ms) {
    [v3 setObject:[[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation] dictionaryRepresentation] forKey:@"linkLatency_1024ms"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_linkOpenPct] forKey:@"linkOpen_pct"];
  }
  linkOpen0pct = self->_linkOpen0pct;
  if (linkOpen0pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen0pct, "dictionaryRepresentation")] forKey:@"linkOpen_0pct"];
  }
  linkOpen125pct = self->_linkOpen125pct;
  if (linkOpen125pct) {
    [v3 setObject:[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen125pct, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"linkOpen_125pct"];
  }
  linkOpen25pct = self->_linkOpen25pct;
  if (linkOpen25pct) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen25pct, "dictionaryRepresentation") forKey:@"linkOpen_25pct"];
  }
  linkOpen375pct = self->_linkOpen375pct;
  if (linkOpen375pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen375pct, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"linkOpen_375pct"];
  }
  linkOpen50pct = self->_linkOpen50pct;
  if (linkOpen50pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen50pct, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"linkOpen_50pct"];
  }
  linkOpen625pct = self->_linkOpen625pct;
  if (linkOpen625pct) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen625pct, "dictionaryRepresentation") forKey:@"linkOpen_625pct"];
  }
  linkOpen75pct = self->_linkOpen75pct;
  if (linkOpen75pct) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](linkOpen75pct, "dictionaryRepresentation") forKey:@"linkOpen_75pct"];
  }
  linkOpen875pct = self->_linkOpen875pct;
  if (linkOpen875pct) {
    [v3 setObject:linkOpen875pct dictionaryRepresentation] forKey:@"linkOpen_875pct"];
  }
  linkOpen100pct = self->_linkOpen100pct;
  if (linkOpen100pct) {
    [v3 setObject:linkOpen100pct forKey:@"linkOpen_100pct"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_avgCCA] forKey:@"avgCCA"];
  }
  avgCCA0pct = self->_avgCCA0pct;
  if (avgCCA0pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA0pct, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"avgCCA_0pct"];
  }
  avgCCA125pct = self->_avgCCA125pct;
  if (avgCCA125pct) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA125pct, "dictionaryRepresentation") forKey:@"avgCCA_125pct"];
  }
  avgCCA25pct = self->_avgCCA25pct;
  if (avgCCA25pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA25pct, "dictionaryRepresentation")] forKey:@"avgCCA_25pct"];
  }
  avgCCA375pct = self->_avgCCA375pct;
  if (avgCCA375pct) {
    [v3 setObject:[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA375pct, "dictionaryRepresentation")] forKey:@"avgCCA_375pct"];
  }
  avgCCA50pct = self->_avgCCA50pct;
  if (avgCCA50pct) {
    [v3 setObject:[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA50pct, "dictionaryRepresentation")] forKey:@"avgCCA_50pct"];
  }
  avgCCA625pct = self->_avgCCA625pct;
  if (avgCCA625pct) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA625pct, "dictionaryRepresentation") forKey:@"avgCCA_625pct"];
  }
  avgCCA75pct = self->_avgCCA75pct;
  if (avgCCA75pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA75pct, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"avgCCA_75pct"];
  }
  avgCCA875pct = self->_avgCCA875pct;
  if (avgCCA875pct) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA875pct, "dictionaryRepresentation")] forKey:@"avgCCA_875pct"];
  }
  avgCCA100pct = self->_avgCCA100pct;
  if (avgCCA100pct) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](avgCCA100pct, "dictionaryRepresentation") forKey:@"avgCCA_100pct"];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lqm] forKey:@"lqm"];
  }
  lqmOff = self->_lqmOff;
  if (lqmOff) {
    [v3 setObject:lqmOff forKey:@"lqm_Off"];
  }
  lqmUnknown = self->_lqmUnknown;
  if (lqmUnknown) {
    [v3 setObject:lqmUnknown dictionaryRepresentation] forKey:@"lqm_Unknown"];
  }
  lqmBad = self->_lqmBad;
  if (lqmBad) {
    [v3 setObject:lqmBad forKey:@"lqm_Bad"];
  }
  lqmPoor = self->_lqmPoor;
  if (lqmPoor) {
    [v3 setObject:lqmPoor forKey:@"lqm_Poor"];
  }
  lqmGood = self->_lqmGood;
  if (lqmGood) {
    [v3 setObject:lqmGood dictionaryRepresentation] forKey:@"lqm_Good"];
  }
  activityUp = self->_activityUp;
  if (activityUp) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityUp, "dictionaryRepresentation")] forKey:@"activity_Up"];
  }
  activityDown = self->_activityDown;
  if (activityDown) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityDown, "dictionaryRepresentation")] forKey:@"activity_Down"];
  }
  activityInvoluntarilyDown = self->_activityInvoluntarilyDown;
  if (activityInvoluntarilyDown) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityInvoluntarilyDown, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"activity_InvoluntarilyDown"];
  }
  activityScanning = self->_activityScanning;
  if (activityScanning) {
    [v3 setObject:-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityScanning, "dictionaryRepresentation") forKey:@"activity_Scanning"];
  }
  activityRoaming = self->_activityRoaming;
  if (activityRoaming) {
    [v3 setObject:[[-[AWDWiFiMetricsManagerStateMachine dictionaryRepresentation](activityRoaming, "dictionaryRepresentation") dictionaryRepresentation] forKey:@"activity_Roaming"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerInfraInterfaceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_98;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint64Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint32Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint32Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint32Field();
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_112:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x20000) != 0) {
LABEL_19:
  }
    PBDataWriterWriteUint32Field();
LABEL_20:
  if (self->_linkLatency0ms) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkLatency64ms) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkLatency128ms) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkLatency256ms) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkLatency512ms) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkLatency1024ms) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_linkOpen0pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen125pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen25pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen375pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen50pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen625pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen75pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen875pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_linkOpen100pct) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_avgCCA0pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA125pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA25pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA375pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA50pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA625pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA75pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA875pct) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_avgCCA100pct) {
    PBDataWriterWriteSubmessage();
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_lqmOff) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lqmUnknown) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lqmBad) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lqmPoor) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_lqmGood) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activityUp) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activityDown) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activityInvoluntarilyDown) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activityScanning) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_activityRoaming)
  {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_timestamp;
    *((_DWORD *)a3 + 108) |= 4u;
    $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_98;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 2) = self->_rxPackets;
  *((_DWORD *)a3 + 108) |= 2u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((void *)a3 + 9) = self->_txPackets;
  *((_DWORD *)a3 + 108) |= 0x100u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((void *)a3 + 10) = self->_txPacketsBe;
  *((_DWORD *)a3 + 108) |= 0x200u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((void *)a3 + 11) = self->_txPacketsBk;
  *((_DWORD *)a3 + 108) |= 0x400u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((void *)a3 + 12) = self->_txPacketsVi;
  *((_DWORD *)a3 + 108) |= 0x800u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((void *)a3 + 13) = self->_txPacketsVo;
  *((_DWORD *)a3 + 108) |= 0x1000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((void *)a3 + 1) = self->_rxBytes;
  *((_DWORD *)a3 + 108) |= 1u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((void *)a3 + 4) = self->_txBytes;
  *((_DWORD *)a3 + 108) |= 8u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((void *)a3 + 5) = self->_txBytesBe;
  *((_DWORD *)a3 + 108) |= 0x10u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((void *)a3 + 6) = self->_txBytesBk;
  *((_DWORD *)a3 + 108) |= 0x20u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((void *)a3 + 7) = self->_txBytesVi;
  *((_DWORD *)a3 + 108) |= 0x40u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((void *)a3 + 8) = self->_txBytesVo;
  *((_DWORD *)a3 + 108) |= 0x80u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((_DWORD *)a3 + 95) = self->_linkRateMbps;
  *((_DWORD *)a3 + 108) |= 0x80000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((_DWORD *)a3 + 60) = self->_effectiveLinkRateMpbs;
  *((_DWORD *)a3 + 108) |= 0x10000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((_DWORD *)a3 + 58) = self->_dataTransferRateMpbs;
  *((_DWORD *)a3 + 108) |= 0x4000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_112:
  *((_DWORD *)a3 + 59) = self->_effectiveDataTransferRateMpbs;
  *((_DWORD *)a3 + 108) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_19:
    *((_DWORD *)a3 + 74) = self->_linkLatencyMs;
    *((_DWORD *)a3 + 108) |= 0x20000u;
  }
LABEL_20:
  if (self->_linkLatency0ms) {
    [a3 setLinkLatency0ms:];
  }
  if (self->_linkLatency64ms) {
    [a3 setLinkLatency64ms:];
  }
  if (self->_linkLatency128ms) {
    [a3 setLinkLatency128ms:];
  }
  if (self->_linkLatency256ms) {
    [a3 setLinkLatency256ms:];
  }
  if (self->_linkLatency512ms) {
    [a3 setLinkLatency512ms:];
  }
  if (self->_linkLatency1024ms) {
    [a3 setLinkLatency1024ms:];
  }
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *((_DWORD *)a3 + 94) = self->_linkOpenPct;
    *((_DWORD *)a3 + 108) |= 0x40000u;
  }
  if (self->_linkOpen0pct) {
    [a3 setLinkOpen0pct:];
  }
  if (self->_linkOpen125pct) {
    [a3 setLinkOpen125pct:];
  }
  if (self->_linkOpen25pct) {
    [a3 setLinkOpen25pct:];
  }
  if (self->_linkOpen375pct) {
    [a3 setLinkOpen375pct:];
  }
  if (self->_linkOpen50pct) {
    [a3 setLinkOpen50pct:];
  }
  if (self->_linkOpen625pct) {
    [a3 setLinkOpen625pct:];
  }
  if (self->_linkOpen75pct) {
    [a3 setLinkOpen75pct:];
  }
  if (self->_linkOpen875pct) {
    [a3 setLinkOpen875pct:];
  }
  if (self->_linkOpen100pct) {
    [a3 setLinkOpen100pct:];
  }
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *((_DWORD *)a3 + 38) = self->_avgCCA;
    *((_DWORD *)a3 + 108) |= 0x2000u;
  }
  if (self->_avgCCA0pct) {
    [a3 setAvgCCA0pct:];
  }
  if (self->_avgCCA125pct) {
    [a3 setAvgCCA125pct:];
  }
  if (self->_avgCCA25pct) {
    [a3 setAvgCCA25pct:];
  }
  if (self->_avgCCA375pct) {
    [a3 setAvgCCA375pct:];
  }
  if (self->_avgCCA50pct) {
    [a3 setAvgCCA50pct:];
  }
  if (self->_avgCCA625pct) {
    [a3 setAvgCCA625pct:];
  }
  if (self->_avgCCA75pct) {
    [a3 setAvgCCA75pct:];
  }
  if (self->_avgCCA875pct) {
    [a3 setAvgCCA875pct:];
  }
  if (self->_avgCCA100pct) {
    [a3 setAvgCCA100pct:];
  }
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *((_DWORD *)a3 + 96) = self->_lqm;
    *((_DWORD *)a3 + 108) |= 0x100000u;
  }
  if (self->_lqmOff) {
    [a3 setLqmOff:];
  }
  if (self->_lqmUnknown) {
    [a3 setLqmUnknown:];
  }
  if (self->_lqmBad) {
    [a3 setLqmBad:];
  }
  if (self->_lqmPoor) {
    [a3 setLqmPoor:];
  }
  if (self->_lqmGood) {
    [a3 setLqmGood:];
  }
  if (self->_activityUp) {
    [a3 setActivityUp:];
  }
  if (self->_activityDown) {
    [a3 setActivityDown:];
  }
  if (self->_activityInvoluntarilyDown) {
    [a3 setActivityInvoluntarilyDown];
  }
  if (self->_activityScanning) {
    [a3 setActivityScanning:];
  }
  if (self->_activityRoaming)
  {
    [a3 setActivityRoaming:];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_timestamp;
    *(_DWORD *)(v5 + 432) |= 4u;
    $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
    if ((*(unsigned char *)&has & 2) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 16) = self->_rxPackets;
  *(_DWORD *)(v5 + 432) |= 2u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(void *)(v5 + 72) = self->_txPackets;
  *(_DWORD *)(v5 + 432) |= 0x100u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_5:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(void *)(v5 + 80) = self->_txPacketsBe;
  *(_DWORD *)(v5 + 432) |= 0x200u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_6:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v5 + 88) = self->_txPacketsBk;
  *(_DWORD *)(v5 + 432) |= 0x400u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(void *)(v5 + 96) = self->_txPacketsVi;
  *(_DWORD *)(v5 + 432) |= 0x800u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(void *)(v5 + 104) = self->_txPacketsVo;
  *(_DWORD *)(v5 + 432) |= 0x1000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_9:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(void *)(v5 + 8) = self->_rxBytes;
  *(_DWORD *)(v5 + 432) |= 1u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(void *)(v5 + 32) = self->_txBytes;
  *(_DWORD *)(v5 + 432) |= 8u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(void *)(v5 + 40) = self->_txBytesBe;
  *(_DWORD *)(v5 + 432) |= 0x10u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(void *)(v5 + 48) = self->_txBytesBk;
  *(_DWORD *)(v5 + 432) |= 0x20u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(void *)(v5 + 56) = self->_txBytesVi;
  *(_DWORD *)(v5 + 432) |= 0x40u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_14:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(void *)(v5 + 64) = self->_txBytesVo;
  *(_DWORD *)(v5 + 432) |= 0x80u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_15:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 380) = self->_linkRateMbps;
  *(_DWORD *)(v5 + 432) |= 0x80000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 240) = self->_effectiveLinkRateMpbs;
  *(_DWORD *)(v5 + 432) |= 0x10000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_43;
  }
LABEL_42:
  *(_DWORD *)(v5 + 232) = self->_dataTransferRateMpbs;
  *(_DWORD *)(v5 + 432) |= 0x4000u;
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_43:
  *(_DWORD *)(v5 + 236) = self->_effectiveDataTransferRateMpbs;
  *(_DWORD *)(v5 + 432) |= 0x8000u;
  if ((*(_DWORD *)&self->_has & 0x20000) != 0)
  {
LABEL_19:
    *(_DWORD *)(v5 + 296) = self->_linkLatencyMs;
    *(_DWORD *)(v5 + 432) |= 0x20000u;
  }
LABEL_20:

  *(void *)(v6 + 248) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency0ms copyWithZone:a3];
  *(void *)(v6 + 288) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency64ms copyWithZone:a3];

  *(void *)(v6 + 264) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency128ms copyWithZone:a3];
  *(void *)(v6 + 272) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency256ms copyWithZone:a3];

  *(void *)(v6 + 280) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency512ms copyWithZone:a3];
  *(void *)(v6 + 256) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency1024ms copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
  {
    *(_DWORD *)(v6 + 376) = self->_linkOpenPct;
    *(_DWORD *)(v6 + 432) |= 0x40000u;
  }

  *(void *)(v6 + 304) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen0pct copyWithZone:a3];
  *(void *)(v6 + 320) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen125pct copyWithZone:a3];

  *(void *)(v6 + 328) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen25pct copyWithZone:a3];
  *(void *)(v6 + 336) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen375pct copyWithZone:a3];

  *(void *)(v6 + 344) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen50pct copyWithZone:a3];
  *(void *)(v6 + 352) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen625pct copyWithZone:a3];

  *(void *)(v6 + 360) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen75pct copyWithZone:a3];
  *(void *)(v6 + 368) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen875pct copyWithZone:a3];

  *(void *)(v6 + 312) = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen100pct copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
  {
    *(_DWORD *)(v6 + 152) = self->_avgCCA;
    *(_DWORD *)(v6 + 432) |= 0x2000u;
  }

  *(void *)(v6 + 160) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA0pct copyWithZone:a3];
  *(void *)(v6 + 176) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA125pct copyWithZone:a3];

  *(void *)(v6 + 184) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA25pct copyWithZone:a3];
  *(void *)(v6 + 192) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA375pct copyWithZone:a3];

  *(void *)(v6 + 200) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA50pct copyWithZone:a3];
  *(void *)(v6 + 208) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA625pct copyWithZone:a3];

  *(void *)(v6 + 216) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA75pct copyWithZone:a3];
  *(void *)(v6 + 224) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA875pct copyWithZone:a3];

  *(void *)(v6 + 168) = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA100pct copyWithZone:a3];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 384) = self->_lqm;
    *(_DWORD *)(v6 + 432) |= 0x100000u;
  }

  *(void *)(v6 + 408) = [(AWDWiFiMetricsManagerStateMachine *)self->_lqmOff copyWithZone:a3];
  *(void *)(v6 + 424) = [(AWDWiFiMetricsManagerStateMachine *)self->_lqmUnknown copyWithZone:a3];

  *(void *)(v6 + 392) = [(AWDWiFiMetricsManagerStateMachine *)self->_lqmBad copyWithZone:a3];
  *(void *)(v6 + 416) = [(AWDWiFiMetricsManagerStateMachine *)self->_lqmPoor copyWithZone:a3];

  *(void *)(v6 + 400) = [(AWDWiFiMetricsManagerStateMachine *)self->_lqmGood copyWithZone:a3];
  *(void *)(v6 + 144) = [(AWDWiFiMetricsManagerStateMachine *)self->_activityUp copyWithZone:a3];

  *(void *)(v6 + 112) = [(AWDWiFiMetricsManagerStateMachine *)self->_activityDown copyWithZone:a3];
  *(void *)(v6 + 120) = [(AWDWiFiMetricsManagerStateMachine *)self->_activityInvoluntarilyDown copyWithZone:a3];

  *(void *)(v6 + 136) = [(AWDWiFiMetricsManagerStateMachine *)self->_activityScanning copyWithZone:a3];
  *(void *)(v6 + 128) = [(AWDWiFiMetricsManagerStateMachine *)self->_activityRoaming copyWithZone:a3];
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
    int v7 = *((_DWORD *)a3 + 108);
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_timestamp != *((void *)a3 + 3)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 4) != 0)
    {
LABEL_175:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_rxPackets != *((void *)a3 + 2)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_txPackets != *((void *)a3 + 9)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_txPacketsBe != *((void *)a3 + 10)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_txPacketsBk != *((void *)a3 + 11)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_txPacketsVi != *((void *)a3 + 12)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_txPacketsVo != *((void *)a3 + 13)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_175;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_rxBytes != *((void *)a3 + 1)) {
        goto LABEL_175;
      }
    }
    else if (v7)
    {
      goto LABEL_175;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_txBytes != *((void *)a3 + 4)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_175;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_txBytesBe != *((void *)a3 + 5)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_175;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_txBytesBk != *((void *)a3 + 6)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_175;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_txBytesVi != *((void *)a3 + 7)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_175;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_txBytesVo != *((void *)a3 + 8)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_linkRateMbps != *((_DWORD *)a3 + 95)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_effectiveLinkRateMpbs != *((_DWORD *)a3 + 60)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_dataTransferRateMpbs != *((_DWORD *)a3 + 58)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_effectiveDataTransferRateMpbs != *((_DWORD *)a3 + 59)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_175;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_linkLatencyMs != *((_DWORD *)a3 + 74)) {
        goto LABEL_175;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_175;
    }
    linkLatency0ms = self->_linkLatency0ms;
    if (!((unint64_t)linkLatency0ms | *((void *)a3 + 31))
      || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency0ms, "isEqual:")) != 0)
    {
      linkLatency64ms = self->_linkLatency64ms;
      if (!((unint64_t)linkLatency64ms | *((void *)a3 + 36))
        || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency64ms, "isEqual:")) != 0)
      {
        linkLatency128ms = self->_linkLatency128ms;
        if (!((unint64_t)linkLatency128ms | *((void *)a3 + 33))
          || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency128ms, "isEqual:")) != 0)
        {
          linkLatency256ms = self->_linkLatency256ms;
          if (!((unint64_t)linkLatency256ms | *((void *)a3 + 34))
            || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency256ms, "isEqual:")) != 0)
          {
            linkLatency512ms = self->_linkLatency512ms;
            if (!((unint64_t)linkLatency512ms | *((void *)a3 + 35))
              || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency512ms, "isEqual:")) != 0)
            {
              linkLatency1024ms = self->_linkLatency1024ms;
              if (!((unint64_t)linkLatency1024ms | *((void *)a3 + 32))
                || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkLatency1024ms, "isEqual:")) != 0)
              {
                int v14 = *((_DWORD *)a3 + 108);
                if ((*((unsigned char *)&self->_has + 2) & 4) != 0)
                {
                  if ((v14 & 0x40000) == 0 || self->_linkOpenPct != *((_DWORD *)a3 + 94)) {
                    goto LABEL_175;
                  }
                }
                else if ((v14 & 0x40000) != 0)
                {
                  goto LABEL_175;
                }
                linkOpen0pct = self->_linkOpen0pct;
                if (!((unint64_t)linkOpen0pct | *((void *)a3 + 38))
                  || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen0pct, "isEqual:")) != 0)
                {
                  linkOpen125pct = self->_linkOpen125pct;
                  if (!((unint64_t)linkOpen125pct | *((void *)a3 + 40))
                    || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen125pct, "isEqual:")) != 0)
                  {
                    linkOpen25pct = self->_linkOpen25pct;
                    if (!((unint64_t)linkOpen25pct | *((void *)a3 + 41))
                      || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen25pct, "isEqual:")) != 0)
                    {
                      linkOpen375pct = self->_linkOpen375pct;
                      if (!((unint64_t)linkOpen375pct | *((void *)a3 + 42))
                        || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen375pct, "isEqual:")) != 0)
                      {
                        linkOpen50pct = self->_linkOpen50pct;
                        if (!((unint64_t)linkOpen50pct | *((void *)a3 + 43))
                          || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen50pct, "isEqual:")) != 0)
                        {
                          linkOpen625pct = self->_linkOpen625pct;
                          if (!((unint64_t)linkOpen625pct | *((void *)a3 + 44))
                            || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen625pct, "isEqual:")) != 0)
                          {
                            linkOpen75pct = self->_linkOpen75pct;
                            if (!((unint64_t)linkOpen75pct | *((void *)a3 + 45))
                              || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen75pct, "isEqual:")) != 0)
                            {
                              linkOpen875pct = self->_linkOpen875pct;
                              if (!((unint64_t)linkOpen875pct | *((void *)a3 + 46))
                                || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen875pct, "isEqual:")) != 0)
                              {
                                linkOpen100pct = self->_linkOpen100pct;
                                if (!((unint64_t)linkOpen100pct | *((void *)a3 + 39))
                                  || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](linkOpen100pct, "isEqual:")) != 0)
                                {
                                  int v24 = *((_DWORD *)a3 + 108);
                                  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0)
                                  {
                                    if ((v24 & 0x2000) == 0 || self->_avgCCA != *((_DWORD *)a3 + 38)) {
                                      goto LABEL_175;
                                    }
                                  }
                                  else if ((v24 & 0x2000) != 0)
                                  {
                                    goto LABEL_175;
                                  }
                                  avgCCA0pct = self->_avgCCA0pct;
                                  if (!((unint64_t)avgCCA0pct | *((void *)a3 + 20))
                                    || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA0pct, "isEqual:")) != 0)
                                  {
                                    avgCCA125pct = self->_avgCCA125pct;
                                    if (!((unint64_t)avgCCA125pct | *((void *)a3 + 22))
                                      || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA125pct, "isEqual:")) != 0)
                                    {
                                      avgCCA25pct = self->_avgCCA25pct;
                                      if (!((unint64_t)avgCCA25pct | *((void *)a3 + 23))
                                        || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA25pct, "isEqual:")) != 0)
                                      {
                                        avgCCA375pct = self->_avgCCA375pct;
                                        if (!((unint64_t)avgCCA375pct | *((void *)a3 + 24))
                                          || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA375pct, "isEqual:")) != 0)
                                        {
                                          avgCCA50pct = self->_avgCCA50pct;
                                          if (!((unint64_t)avgCCA50pct | *((void *)a3 + 25))
                                            || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA50pct, "isEqual:")) != 0)
                                          {
                                            avgCCA625pct = self->_avgCCA625pct;
                                            if (!((unint64_t)avgCCA625pct | *((void *)a3 + 26))
                                              || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA625pct, "isEqual:")) != 0)
                                            {
                                              avgCCA75pct = self->_avgCCA75pct;
                                              if (!((unint64_t)avgCCA75pct | *((void *)a3 + 27))
                                                || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA75pct, "isEqual:")) != 0)
                                              {
                                                avgCCA875pct = self->_avgCCA875pct;
                                                if (!((unint64_t)avgCCA875pct | *((void *)a3 + 28))
                                                  || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA875pct, "isEqual:")) != 0)
                                                {
                                                  avgCCA100pct = self->_avgCCA100pct;
                                                  if (!((unint64_t)avgCCA100pct | *((void *)a3 + 21))
                                                    || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](avgCCA100pct, "isEqual:")) != 0)
                                                  {
                                                    int v34 = *((_DWORD *)a3 + 108);
                                                    if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0)
                                                    {
                                                      if ((v34 & 0x100000) == 0 || self->_lqm != *((_DWORD *)a3 + 96)) {
                                                        goto LABEL_175;
                                                      }
                                                    }
                                                    else if ((v34 & 0x100000) != 0)
                                                    {
                                                      goto LABEL_175;
                                                    }
                                                    lqmOff = self->_lqmOff;
                                                    if (!((unint64_t)lqmOff | *((void *)a3 + 51))
                                                      || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmOff, "isEqual:")) != 0)
                                                    {
                                                      lqmUnknown = self->_lqmUnknown;
                                                      if (!((unint64_t)lqmUnknown | *((void *)a3 + 53))
                                                        || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmUnknown, "isEqual:")) != 0)
                                                      {
                                                        lqmBad = self->_lqmBad;
                                                        if (!((unint64_t)lqmBad | *((void *)a3 + 49))
                                                          || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmBad, "isEqual:")) != 0)
                                                        {
                                                          lqmPoor = self->_lqmPoor;
                                                          if (!((unint64_t)lqmPoor | *((void *)a3 + 52))
                                                            || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmPoor, "isEqual:")) != 0)
                                                          {
                                                            lqmGood = self->_lqmGood;
                                                            if (!((unint64_t)lqmGood | *((void *)a3 + 50))
                                                              || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](lqmGood, "isEqual:")) != 0)
                                                            {
                                                              activityUp = self->_activityUp;
                                                              if (!((unint64_t)activityUp | *((void *)a3 + 18))
                                                                || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityUp, "isEqual:")) != 0)
                                                              {
                                                                activityDown = self->_activityDown;
                                                                if (!((unint64_t)activityDown | *((void *)a3 + 14))
                                                                  || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityDown, "isEqual:")) != 0)
                                                                {
                                                                  activityInvoluntarilyDown = self->_activityInvoluntarilyDown;
                                                                  if (!((unint64_t)activityInvoluntarilyDown | *((void *)a3 + 15))
                                                                    || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityInvoluntarilyDown, "isEqual:")) != 0)
                                                                  {
                                                                    activityScanning = self->_activityScanning;
                                                                    if (!((unint64_t)activityScanning | *((void *)a3 + 17))
                                                                      || (int v5 = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityScanning, "isEqual:")) != 0)
                                                                    {
                                                                      activityRoaming = self->_activityRoaming;
                                                                      if ((unint64_t)activityRoaming | *((void *)a3 + 16))
                                                                      {
                                                                        LOBYTE(v5) = -[AWDWiFiMetricsManagerStateMachine isEqual:](activityRoaming, "isEqual:");
                                                                      }
                                                                      else
                                                                      {
                                                                        LOBYTE(v5) = 1;
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
  return v5;
}

- (unint64_t)hash
{
  $D6F352D4FD6CE9CC3730891842732671 has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
    unint64_t v59 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&has & 2) != 0)
    {
LABEL_3:
      unint64_t v58 = 2654435761u * self->_rxPackets;
      if ((*(_WORD *)&has & 0x100) != 0) {
        goto LABEL_4;
      }
      goto LABEL_22;
    }
  }
  else
  {
    unint64_t v59 = 0;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v58 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_4:
    unint64_t v57 = 2654435761u * self->_txPackets;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_5;
    }
    goto LABEL_23;
  }
LABEL_22:
  unint64_t v57 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_5:
    unint64_t v56 = 2654435761u * self->_txPacketsBe;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_6;
    }
    goto LABEL_24;
  }
LABEL_23:
  unint64_t v56 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_6:
    unint64_t v55 = 2654435761u * self->_txPacketsBk;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_25;
  }
LABEL_24:
  unint64_t v55 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_7:
    unint64_t v54 = 2654435761u * self->_txPacketsVi;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  unint64_t v54 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_8:
    unint64_t v53 = 2654435761u * self->_txPacketsVo;
    if (*(unsigned char *)&has) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  unint64_t v53 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_9:
    unint64_t v52 = 2654435761u * self->_rxBytes;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  unint64_t v52 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_10:
    unint64_t v51 = 2654435761u * self->_txBytes;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  unint64_t v51 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_11:
    unint64_t v50 = 2654435761u * self->_txBytesBe;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  unint64_t v50 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_12:
    unint64_t v49 = 2654435761u * self->_txBytesBk;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  unint64_t v49 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_13:
    unint64_t v48 = 2654435761u * self->_txBytesVi;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  unint64_t v48 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_14:
    unint64_t v47 = 2654435761u * self->_txBytesVo;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  unint64_t v47 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_15:
    uint64_t v46 = 2654435761 * self->_linkRateMbps;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v46 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_16:
    uint64_t v45 = 2654435761 * self->_effectiveLinkRateMpbs;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v45 = 0;
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
LABEL_17:
    uint64_t v44 = 2654435761 * self->_dataTransferRateMpbs;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_18;
    }
LABEL_36:
    uint64_t v43 = 0;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_37;
  }
LABEL_35:
  uint64_t v44 = 0;
  if ((*(_WORD *)&has & 0x8000) == 0) {
    goto LABEL_36;
  }
LABEL_18:
  uint64_t v43 = 2654435761 * self->_effectiveDataTransferRateMpbs;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_19:
    uint64_t v42 = 2654435761 * self->_linkLatencyMs;
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v42 = 0;
LABEL_38:
  unint64_t v41 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency0ms hash];
  unint64_t v40 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency64ms hash];
  unint64_t v39 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency128ms hash];
  unint64_t v38 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency256ms hash];
  unint64_t v37 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency512ms hash];
  unint64_t v36 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkLatency1024ms hash];
  if ((*((unsigned char *)&self->_has + 2) & 4) != 0) {
    uint64_t v35 = 2654435761 * self->_linkOpenPct;
  }
  else {
    uint64_t v35 = 0;
  }
  unint64_t v34 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen0pct hash];
  unint64_t v33 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen125pct hash];
  unint64_t v32 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen25pct hash];
  unint64_t v31 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen375pct hash];
  unint64_t v30 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen50pct hash];
  unint64_t v29 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen625pct hash];
  unint64_t v28 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen75pct hash];
  unint64_t v27 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen875pct hash];
  unint64_t v25 = [(AWDWiFiMetricsManagerStateMachine *)self->_linkOpen100pct hash];
  if ((*((unsigned char *)&self->_has + 1) & 0x20) != 0) {
    uint64_t v4 = 2654435761 * self->_avgCCA;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA0pct hash];
  unint64_t v6 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA125pct hash];
  unint64_t v7 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA25pct hash];
  unint64_t v8 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA375pct hash];
  unint64_t v9 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA50pct hash];
  unint64_t v10 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA625pct hash];
  unint64_t v11 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA75pct hash];
  unint64_t v12 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA875pct hash];
  unint64_t v13 = [(AWDWiFiMetricsManagerStateMachine *)self->_avgCCA100pct hash];
  if ((*((unsigned char *)&self->_has + 2) & 0x10) != 0) {
    uint64_t v14 = 2654435761 * self->_lqm;
  }
  else {
    uint64_t v14 = 0;
  }
  unint64_t v15 = v58 ^ v59 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_lqmOff hash];
  unint64_t v16 = [(AWDWiFiMetricsManagerStateMachine *)self->_lqmUnknown hash];
  unint64_t v17 = v16 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_lqmBad hash];
  unint64_t v18 = v17 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_lqmPoor hash];
  unint64_t v19 = v18 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_lqmGood hash];
  unint64_t v20 = v19 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_activityUp hash];
  unint64_t v21 = v20 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_activityDown hash];
  unint64_t v22 = v21 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_activityInvoluntarilyDown hash];
  unint64_t v23 = v15 ^ v22 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_activityScanning hash];
  return v23 ^ [(AWDWiFiMetricsManagerStateMachine *)self->_activityRoaming hash];
}

- (void)mergeFrom:(id)a3
{
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 4) != 0)
  {
    self->_timestamp = *((void *)a3 + 3);
    *(_DWORD *)&self->_has |= 4u;
    int v5 = *((_DWORD *)a3 + 108);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 0x100) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((v5 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_rxPackets = *((void *)a3 + 2);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x100) == 0)
  {
LABEL_4:
    if ((v5 & 0x200) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_txPackets = *((void *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x200) == 0)
  {
LABEL_5:
    if ((v5 & 0x400) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_txPacketsBe = *((void *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x200u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_txPacketsBk = *((void *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x400u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x800) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_txPacketsVi = *((void *)a3 + 12);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x1000) == 0)
  {
LABEL_8:
    if ((v5 & 1) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_txPacketsVo = *((void *)a3 + 13);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 1) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_rxBytes = *((void *)a3 + 1);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_txBytes = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x10) == 0)
  {
LABEL_11:
    if ((v5 & 0x20) == 0) {
      goto LABEL_12;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_txBytesBe = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x20) == 0)
  {
LABEL_12:
    if ((v5 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_txBytesBk = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x40) == 0)
  {
LABEL_13:
    if ((v5 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_txBytesVi = *((void *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x80) == 0)
  {
LABEL_14:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_txBytesVo = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x80000) == 0)
  {
LABEL_15:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_linkRateMbps = *((_DWORD *)a3 + 95);
  *(_DWORD *)&self->_has |= 0x80000u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x10000) == 0)
  {
LABEL_16:
    if ((v5 & 0x4000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_effectiveLinkRateMpbs = *((_DWORD *)a3 + 60);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x4000) == 0)
  {
LABEL_17:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_dataTransferRateMpbs = *((_DWORD *)a3 + 58);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)a3 + 108);
  if ((v5 & 0x8000) == 0)
  {
LABEL_18:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_19;
  }
LABEL_39:
  self->_effectiveDataTransferRateMpbs = *((_DWORD *)a3 + 59);
  *(_DWORD *)&self->_has |= 0x8000u;
  if ((*((_DWORD *)a3 + 108) & 0x20000) != 0)
  {
LABEL_19:
    self->_linkLatencyMs = *((_DWORD *)a3 + 74);
    *(_DWORD *)&self->_has |= 0x20000u;
  }
LABEL_20:
  linkLatency0ms = self->_linkLatency0ms;
  uint64_t v7 = *((void *)a3 + 31);
  if (linkLatency0ms)
  {
    if (v7) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency0ms, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency0ms:](self, "setLinkLatency0ms:");
  }
  linkLatency64ms = self->_linkLatency64ms;
  uint64_t v9 = *((void *)a3 + 36);
  if (linkLatency64ms)
  {
    if (v9) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency64ms, "mergeFrom:");
    }
  }
  else if (v9)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency64ms:](self, "setLinkLatency64ms:");
  }
  linkLatency128ms = self->_linkLatency128ms;
  uint64_t v11 = *((void *)a3 + 33);
  if (linkLatency128ms)
  {
    if (v11) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency128ms, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency128ms:](self, "setLinkLatency128ms:");
  }
  linkLatency256ms = self->_linkLatency256ms;
  uint64_t v13 = *((void *)a3 + 34);
  if (linkLatency256ms)
  {
    if (v13) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency256ms, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency256ms:](self, "setLinkLatency256ms:");
  }
  linkLatency512ms = self->_linkLatency512ms;
  uint64_t v15 = *((void *)a3 + 35);
  if (linkLatency512ms)
  {
    if (v15) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency512ms, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency512ms:](self, "setLinkLatency512ms:");
  }
  linkLatency1024ms = self->_linkLatency1024ms;
  uint64_t v17 = *((void *)a3 + 32);
  if (linkLatency1024ms)
  {
    if (v17) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkLatency1024ms, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkLatency1024ms:](self, "setLinkLatency1024ms:");
  }
  if ((*((unsigned char *)a3 + 434) & 4) != 0)
  {
    self->_linkOpenPct = *((_DWORD *)a3 + 94);
    *(_DWORD *)&self->_has |= 0x40000u;
  }
  linkOpen0pct = self->_linkOpen0pct;
  uint64_t v19 = *((void *)a3 + 38);
  if (linkOpen0pct)
  {
    if (v19) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen0pct, "mergeFrom:");
    }
  }
  else if (v19)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen0pct:](self, "setLinkOpen0pct:");
  }
  linkOpen125pct = self->_linkOpen125pct;
  uint64_t v21 = *((void *)a3 + 40);
  if (linkOpen125pct)
  {
    if (v21) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen125pct, "mergeFrom:");
    }
  }
  else if (v21)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen125pct:](self, "setLinkOpen125pct:");
  }
  linkOpen25pct = self->_linkOpen25pct;
  uint64_t v23 = *((void *)a3 + 41);
  if (linkOpen25pct)
  {
    if (v23) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen25pct, "mergeFrom:");
    }
  }
  else if (v23)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen25pct:](self, "setLinkOpen25pct:");
  }
  linkOpen375pct = self->_linkOpen375pct;
  uint64_t v25 = *((void *)a3 + 42);
  if (linkOpen375pct)
  {
    if (v25) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen375pct, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen375pct:](self, "setLinkOpen375pct:");
  }
  linkOpen50pct = self->_linkOpen50pct;
  uint64_t v27 = *((void *)a3 + 43);
  if (linkOpen50pct)
  {
    if (v27) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen50pct, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen50pct:](self, "setLinkOpen50pct:");
  }
  linkOpen625pct = self->_linkOpen625pct;
  uint64_t v29 = *((void *)a3 + 44);
  if (linkOpen625pct)
  {
    if (v29) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen625pct, "mergeFrom:");
    }
  }
  else if (v29)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen625pct:](self, "setLinkOpen625pct:");
  }
  linkOpen75pct = self->_linkOpen75pct;
  uint64_t v31 = *((void *)a3 + 45);
  if (linkOpen75pct)
  {
    if (v31) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen75pct, "mergeFrom:");
    }
  }
  else if (v31)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen75pct:](self, "setLinkOpen75pct:");
  }
  linkOpen875pct = self->_linkOpen875pct;
  uint64_t v33 = *((void *)a3 + 46);
  if (linkOpen875pct)
  {
    if (v33) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen875pct, "mergeFrom:");
    }
  }
  else if (v33)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen875pct:](self, "setLinkOpen875pct:");
  }
  linkOpen100pct = self->_linkOpen100pct;
  uint64_t v35 = *((void *)a3 + 39);
  if (linkOpen100pct)
  {
    if (v35) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](linkOpen100pct, "mergeFrom:");
    }
  }
  else if (v35)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLinkOpen100pct:](self, "setLinkOpen100pct:");
  }
  if ((*((unsigned char *)a3 + 433) & 0x20) != 0)
  {
    self->_avgCCA = *((_DWORD *)a3 + 38);
    *(_DWORD *)&self->_has |= 0x2000u;
  }
  avgCCA0pct = self->_avgCCA0pct;
  uint64_t v37 = *((void *)a3 + 20);
  if (avgCCA0pct)
  {
    if (v37) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA0pct, "mergeFrom:");
    }
  }
  else if (v37)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA0pct:](self, "setAvgCCA0pct:");
  }
  avgCCA125pct = self->_avgCCA125pct;
  uint64_t v39 = *((void *)a3 + 22);
  if (avgCCA125pct)
  {
    if (v39) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA125pct, "mergeFrom:");
    }
  }
  else if (v39)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA125pct:](self, "setAvgCCA125pct:");
  }
  avgCCA25pct = self->_avgCCA25pct;
  uint64_t v41 = *((void *)a3 + 23);
  if (avgCCA25pct)
  {
    if (v41) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA25pct, "mergeFrom:");
    }
  }
  else if (v41)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA25pct:](self, "setAvgCCA25pct:");
  }
  avgCCA375pct = self->_avgCCA375pct;
  uint64_t v43 = *((void *)a3 + 24);
  if (avgCCA375pct)
  {
    if (v43) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA375pct, "mergeFrom:");
    }
  }
  else if (v43)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA375pct:](self, "setAvgCCA375pct:");
  }
  avgCCA50pct = self->_avgCCA50pct;
  uint64_t v45 = *((void *)a3 + 25);
  if (avgCCA50pct)
  {
    if (v45) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA50pct, "mergeFrom:");
    }
  }
  else if (v45)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA50pct:](self, "setAvgCCA50pct:");
  }
  avgCCA625pct = self->_avgCCA625pct;
  uint64_t v47 = *((void *)a3 + 26);
  if (avgCCA625pct)
  {
    if (v47) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA625pct, "mergeFrom:");
    }
  }
  else if (v47)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA625pct:](self, "setAvgCCA625pct:");
  }
  avgCCA75pct = self->_avgCCA75pct;
  uint64_t v49 = *((void *)a3 + 27);
  if (avgCCA75pct)
  {
    if (v49) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA75pct, "mergeFrom:");
    }
  }
  else if (v49)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA75pct:](self, "setAvgCCA75pct:");
  }
  avgCCA875pct = self->_avgCCA875pct;
  uint64_t v51 = *((void *)a3 + 28);
  if (avgCCA875pct)
  {
    if (v51) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA875pct, "mergeFrom:");
    }
  }
  else if (v51)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA875pct:](self, "setAvgCCA875pct:");
  }
  avgCCA100pct = self->_avgCCA100pct;
  uint64_t v53 = *((void *)a3 + 21);
  if (avgCCA100pct)
  {
    if (v53) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](avgCCA100pct, "mergeFrom:");
    }
  }
  else if (v53)
  {
    -[AWDWiFiMetricsManagerInfraInterface setAvgCCA100pct:](self, "setAvgCCA100pct:");
  }
  if ((*((unsigned char *)a3 + 434) & 0x10) != 0)
  {
    self->_lqm = *((_DWORD *)a3 + 96);
    *(_DWORD *)&self->_has |= 0x100000u;
  }
  lqmOff = self->_lqmOff;
  uint64_t v55 = *((void *)a3 + 51);
  if (lqmOff)
  {
    if (v55) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmOff, "mergeFrom:");
    }
  }
  else if (v55)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmOff:](self, "setLqmOff:");
  }
  lqmUnknown = self->_lqmUnknown;
  uint64_t v57 = *((void *)a3 + 53);
  if (lqmUnknown)
  {
    if (v57) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmUnknown, "mergeFrom:");
    }
  }
  else if (v57)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmUnknown:](self, "setLqmUnknown:");
  }
  lqmBad = self->_lqmBad;
  uint64_t v59 = *((void *)a3 + 49);
  if (lqmBad)
  {
    if (v59) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmBad, "mergeFrom:");
    }
  }
  else if (v59)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmBad:](self, "setLqmBad:");
  }
  lqmPoor = self->_lqmPoor;
  uint64_t v61 = *((void *)a3 + 52);
  if (lqmPoor)
  {
    if (v61) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmPoor, "mergeFrom:");
    }
  }
  else if (v61)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmPoor:](self, "setLqmPoor:");
  }
  lqmGood = self->_lqmGood;
  uint64_t v63 = *((void *)a3 + 50);
  if (lqmGood)
  {
    if (v63) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](lqmGood, "mergeFrom:");
    }
  }
  else if (v63)
  {
    -[AWDWiFiMetricsManagerInfraInterface setLqmGood:](self, "setLqmGood:");
  }
  activityUp = self->_activityUp;
  uint64_t v65 = *((void *)a3 + 18);
  if (activityUp)
  {
    if (v65) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityUp, "mergeFrom:");
    }
  }
  else if (v65)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityUp:](self, "setActivityUp:");
  }
  activityDown = self->_activityDown;
  uint64_t v67 = *((void *)a3 + 14);
  if (activityDown)
  {
    if (v67) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityDown, "mergeFrom:");
    }
  }
  else if (v67)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityDown:](self, "setActivityDown:");
  }
  activityInvoluntarilyDown = self->_activityInvoluntarilyDown;
  uint64_t v69 = *((void *)a3 + 15);
  if (activityInvoluntarilyDown)
  {
    if (v69) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityInvoluntarilyDown, "mergeFrom:");
    }
  }
  else if (v69)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityInvoluntarilyDown:](self, "setActivityInvoluntarilyDown:");
  }
  activityScanning = self->_activityScanning;
  uint64_t v71 = *((void *)a3 + 17);
  if (activityScanning)
  {
    if (v71) {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityScanning, "mergeFrom:");
    }
  }
  else if (v71)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityScanning:](self, "setActivityScanning:");
  }
  activityRoaming = self->_activityRoaming;
  uint64_t v73 = *((void *)a3 + 16);
  if (activityRoaming)
  {
    if (v73)
    {
      -[AWDWiFiMetricsManagerStateMachine mergeFrom:](activityRoaming, "mergeFrom:");
    }
  }
  else if (v73)
  {
    -[AWDWiFiMetricsManagerInfraInterface setActivityRoaming:](self, "setActivityRoaming:");
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)rxPackets
{
  return self->_rxPackets;
}

- (unint64_t)txPackets
{
  return self->_txPackets;
}

- (unint64_t)txPacketsBe
{
  return self->_txPacketsBe;
}

- (unint64_t)txPacketsBk
{
  return self->_txPacketsBk;
}

- (unint64_t)txPacketsVi
{
  return self->_txPacketsVi;
}

- (unint64_t)txPacketsVo
{
  return self->_txPacketsVo;
}

- (unint64_t)rxBytes
{
  return self->_rxBytes;
}

- (unint64_t)txBytes
{
  return self->_txBytes;
}

- (unint64_t)txBytesBe
{
  return self->_txBytesBe;
}

- (unint64_t)txBytesBk
{
  return self->_txBytesBk;
}

- (unint64_t)txBytesVi
{
  return self->_txBytesVi;
}

- (unint64_t)txBytesVo
{
  return self->_txBytesVo;
}

- (unsigned)linkRateMbps
{
  return self->_linkRateMbps;
}

- (unsigned)effectiveLinkRateMpbs
{
  return self->_effectiveLinkRateMpbs;
}

- (unsigned)dataTransferRateMpbs
{
  return self->_dataTransferRateMpbs;
}

- (unsigned)effectiveDataTransferRateMpbs
{
  return self->_effectiveDataTransferRateMpbs;
}

- (unsigned)linkLatencyMs
{
  return self->_linkLatencyMs;
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency0ms
{
  return self->_linkLatency0ms;
}

- (void)setLinkLatency0ms:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency64ms
{
  return self->_linkLatency64ms;
}

- (void)setLinkLatency64ms:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency128ms
{
  return self->_linkLatency128ms;
}

- (void)setLinkLatency128ms:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency256ms
{
  return self->_linkLatency256ms;
}

- (void)setLinkLatency256ms:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency512ms
{
  return self->_linkLatency512ms;
}

- (void)setLinkLatency512ms:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkLatency1024ms
{
  return self->_linkLatency1024ms;
}

- (void)setLinkLatency1024ms:(id)a3
{
}

- (unsigned)linkOpenPct
{
  return self->_linkOpenPct;
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen0pct
{
  return self->_linkOpen0pct;
}

- (void)setLinkOpen0pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen125pct
{
  return self->_linkOpen125pct;
}

- (void)setLinkOpen125pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen25pct
{
  return self->_linkOpen25pct;
}

- (void)setLinkOpen25pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen375pct
{
  return self->_linkOpen375pct;
}

- (void)setLinkOpen375pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen50pct
{
  return self->_linkOpen50pct;
}

- (void)setLinkOpen50pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen625pct
{
  return self->_linkOpen625pct;
}

- (void)setLinkOpen625pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen75pct
{
  return self->_linkOpen75pct;
}

- (void)setLinkOpen75pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen875pct
{
  return self->_linkOpen875pct;
}

- (void)setLinkOpen875pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)linkOpen100pct
{
  return self->_linkOpen100pct;
}

- (void)setLinkOpen100pct:(id)a3
{
}

- (unsigned)avgCCA
{
  return self->_avgCCA;
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA0pct
{
  return self->_avgCCA0pct;
}

- (void)setAvgCCA0pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA125pct
{
  return self->_avgCCA125pct;
}

- (void)setAvgCCA125pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA25pct
{
  return self->_avgCCA25pct;
}

- (void)setAvgCCA25pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA375pct
{
  return self->_avgCCA375pct;
}

- (void)setAvgCCA375pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA50pct
{
  return self->_avgCCA50pct;
}

- (void)setAvgCCA50pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA625pct
{
  return self->_avgCCA625pct;
}

- (void)setAvgCCA625pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA75pct
{
  return self->_avgCCA75pct;
}

- (void)setAvgCCA75pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA875pct
{
  return self->_avgCCA875pct;
}

- (void)setAvgCCA875pct:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)avgCCA100pct
{
  return self->_avgCCA100pct;
}

- (void)setAvgCCA100pct:(id)a3
{
}

- (unsigned)lqm
{
  return self->_lqm;
}

- (AWDWiFiMetricsManagerStateMachine)lqmOff
{
  return self->_lqmOff;
}

- (void)setLqmOff:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)lqmUnknown
{
  return self->_lqmUnknown;
}

- (void)setLqmUnknown:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)lqmBad
{
  return self->_lqmBad;
}

- (void)setLqmBad:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)lqmPoor
{
  return self->_lqmPoor;
}

- (void)setLqmPoor:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)lqmGood
{
  return self->_lqmGood;
}

- (void)setLqmGood:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)activityUp
{
  return self->_activityUp;
}

- (void)setActivityUp:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)activityDown
{
  return self->_activityDown;
}

- (void)setActivityDown:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)activityInvoluntarilyDown
{
  return self->_activityInvoluntarilyDown;
}

- (void)setActivityInvoluntarilyDown:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)activityScanning
{
  return self->_activityScanning;
}

- (void)setActivityScanning:(id)a3
{
}

- (AWDWiFiMetricsManagerStateMachine)activityRoaming
{
  return self->_activityRoaming;
}

- (void)setActivityRoaming:(id)a3
{
}

@end