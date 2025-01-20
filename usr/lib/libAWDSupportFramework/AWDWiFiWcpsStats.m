@interface AWDWiFiWcpsStats
- (BOOL)hasAvgCca;
- (BOOL)hasAvgRssi;
- (BOOL)hasAvgRxRetry;
- (BOOL)hasAvgSnr;
- (BOOL)hasAvgTxAirLatency;
- (BOOL)hasAvgTxPacketLoss;
- (BOOL)hasAvgTxRetrans;
- (BOOL)hasCntAwdlActive;
- (BOOL)hasCntDisBtConnLatHi;
- (BOOL)hasCntDisBtEv3;
- (BOOL)hasCntRedBtConnLatLow;
- (BOOL)hasCntRedBtDisconnLatHi;
- (BOOL)hasCntVoBadPeriods;
- (BOOL)hasCntVoGoodPeriods;
- (BOOL)hasDurationBucket;
- (BOOL)hasEndCca;
- (BOOL)hasEndLinkState;
- (BOOL)hasEndRssi;
- (BOOL)hasEndRxRetry;
- (BOOL)hasEndSnr;
- (BOOL)hasEndTxAirLatency;
- (BOOL)hasEndTxPacketLoss;
- (BOOL)hasEndTxRetrans;
- (BOOL)hasMaxCca;
- (BOOL)hasMaxRssi;
- (BOOL)hasMaxRxRetry;
- (BOOL)hasMaxTxAirLatency;
- (BOOL)hasMaxTxPacketLoss;
- (BOOL)hasMaxTxRetrans;
- (BOOL)hasMaxnSnr;
- (BOOL)hasMinCca;
- (BOOL)hasMinRssi;
- (BOOL)hasMinRxRetry;
- (BOOL)hasMinSnr;
- (BOOL)hasMinTxAirLatency;
- (BOOL)hasMinTxPacketLoss;
- (BOOL)hasMinTxRetrans;
- (BOOL)hasPercentageActive;
- (BOOL)hasPercentagePowerSave;
- (BOOL)hasPercentageWcpsDisabled;
- (BOOL)hasPercentageWcpsEnabled;
- (BOOL)hasPercentageWcpsReduced;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)avgCca;
- (unint64_t)avgRssi;
- (unint64_t)avgRxRetry;
- (unint64_t)avgSnr;
- (unint64_t)avgTxAirLatency;
- (unint64_t)avgTxPacketLoss;
- (unint64_t)avgTxRetrans;
- (unint64_t)cntAwdlActive;
- (unint64_t)cntDisBtConnLatHi;
- (unint64_t)cntDisBtEv3;
- (unint64_t)cntRedBtConnLatLow;
- (unint64_t)cntRedBtDisconnLatHi;
- (unint64_t)cntVoBadPeriods;
- (unint64_t)cntVoGoodPeriods;
- (unint64_t)durationBucket;
- (unint64_t)endCca;
- (unint64_t)endLinkState;
- (unint64_t)endRssi;
- (unint64_t)endRxRetry;
- (unint64_t)endSnr;
- (unint64_t)endTxAirLatency;
- (unint64_t)endTxPacketLoss;
- (unint64_t)endTxRetrans;
- (unint64_t)hash;
- (unint64_t)maxCca;
- (unint64_t)maxRssi;
- (unint64_t)maxRxRetry;
- (unint64_t)maxTxAirLatency;
- (unint64_t)maxTxPacketLoss;
- (unint64_t)maxTxRetrans;
- (unint64_t)maxnSnr;
- (unint64_t)minCca;
- (unint64_t)minRssi;
- (unint64_t)minRxRetry;
- (unint64_t)minSnr;
- (unint64_t)minTxAirLatency;
- (unint64_t)minTxPacketLoss;
- (unint64_t)minTxRetrans;
- (unint64_t)percentageActive;
- (unint64_t)percentagePowerSave;
- (unint64_t)percentageWcpsDisabled;
- (unint64_t)percentageWcpsEnabled;
- (unint64_t)percentageWcpsReduced;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAvgCca:(unint64_t)a3;
- (void)setAvgRssi:(unint64_t)a3;
- (void)setAvgRxRetry:(unint64_t)a3;
- (void)setAvgSnr:(unint64_t)a3;
- (void)setAvgTxAirLatency:(unint64_t)a3;
- (void)setAvgTxPacketLoss:(unint64_t)a3;
- (void)setAvgTxRetrans:(unint64_t)a3;
- (void)setCntAwdlActive:(unint64_t)a3;
- (void)setCntDisBtConnLatHi:(unint64_t)a3;
- (void)setCntDisBtEv3:(unint64_t)a3;
- (void)setCntRedBtConnLatLow:(unint64_t)a3;
- (void)setCntRedBtDisconnLatHi:(unint64_t)a3;
- (void)setCntVoBadPeriods:(unint64_t)a3;
- (void)setCntVoGoodPeriods:(unint64_t)a3;
- (void)setDurationBucket:(unint64_t)a3;
- (void)setEndCca:(unint64_t)a3;
- (void)setEndLinkState:(unint64_t)a3;
- (void)setEndRssi:(unint64_t)a3;
- (void)setEndRxRetry:(unint64_t)a3;
- (void)setEndSnr:(unint64_t)a3;
- (void)setEndTxAirLatency:(unint64_t)a3;
- (void)setEndTxPacketLoss:(unint64_t)a3;
- (void)setEndTxRetrans:(unint64_t)a3;
- (void)setHasAvgCca:(BOOL)a3;
- (void)setHasAvgRssi:(BOOL)a3;
- (void)setHasAvgRxRetry:(BOOL)a3;
- (void)setHasAvgSnr:(BOOL)a3;
- (void)setHasAvgTxAirLatency:(BOOL)a3;
- (void)setHasAvgTxPacketLoss:(BOOL)a3;
- (void)setHasAvgTxRetrans:(BOOL)a3;
- (void)setHasCntAwdlActive:(BOOL)a3;
- (void)setHasCntDisBtConnLatHi:(BOOL)a3;
- (void)setHasCntDisBtEv3:(BOOL)a3;
- (void)setHasCntRedBtConnLatLow:(BOOL)a3;
- (void)setHasCntRedBtDisconnLatHi:(BOOL)a3;
- (void)setHasCntVoBadPeriods:(BOOL)a3;
- (void)setHasCntVoGoodPeriods:(BOOL)a3;
- (void)setHasDurationBucket:(BOOL)a3;
- (void)setHasEndCca:(BOOL)a3;
- (void)setHasEndLinkState:(BOOL)a3;
- (void)setHasEndRssi:(BOOL)a3;
- (void)setHasEndRxRetry:(BOOL)a3;
- (void)setHasEndSnr:(BOOL)a3;
- (void)setHasEndTxAirLatency:(BOOL)a3;
- (void)setHasEndTxPacketLoss:(BOOL)a3;
- (void)setHasEndTxRetrans:(BOOL)a3;
- (void)setHasMaxCca:(BOOL)a3;
- (void)setHasMaxRssi:(BOOL)a3;
- (void)setHasMaxRxRetry:(BOOL)a3;
- (void)setHasMaxTxAirLatency:(BOOL)a3;
- (void)setHasMaxTxPacketLoss:(BOOL)a3;
- (void)setHasMaxTxRetrans:(BOOL)a3;
- (void)setHasMaxnSnr:(BOOL)a3;
- (void)setHasMinCca:(BOOL)a3;
- (void)setHasMinRssi:(BOOL)a3;
- (void)setHasMinRxRetry:(BOOL)a3;
- (void)setHasMinSnr:(BOOL)a3;
- (void)setHasMinTxAirLatency:(BOOL)a3;
- (void)setHasMinTxPacketLoss:(BOOL)a3;
- (void)setHasMinTxRetrans:(BOOL)a3;
- (void)setHasPercentageActive:(BOOL)a3;
- (void)setHasPercentagePowerSave:(BOOL)a3;
- (void)setHasPercentageWcpsDisabled:(BOOL)a3;
- (void)setHasPercentageWcpsEnabled:(BOOL)a3;
- (void)setHasPercentageWcpsReduced:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setMaxCca:(unint64_t)a3;
- (void)setMaxRssi:(unint64_t)a3;
- (void)setMaxRxRetry:(unint64_t)a3;
- (void)setMaxTxAirLatency:(unint64_t)a3;
- (void)setMaxTxPacketLoss:(unint64_t)a3;
- (void)setMaxTxRetrans:(unint64_t)a3;
- (void)setMaxnSnr:(unint64_t)a3;
- (void)setMinCca:(unint64_t)a3;
- (void)setMinRssi:(unint64_t)a3;
- (void)setMinRxRetry:(unint64_t)a3;
- (void)setMinSnr:(unint64_t)a3;
- (void)setMinTxAirLatency:(unint64_t)a3;
- (void)setMinTxPacketLoss:(unint64_t)a3;
- (void)setMinTxRetrans:(unint64_t)a3;
- (void)setPercentageActive:(unint64_t)a3;
- (void)setPercentagePowerSave:(unint64_t)a3;
- (void)setPercentageWcpsDisabled:(unint64_t)a3;
- (void)setPercentageWcpsEnabled:(unint64_t)a3;
- (void)setPercentageWcpsReduced:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiWcpsStats

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasTimestamp
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setDurationBucket:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_durationBucket = a3;
}

- (void)setHasDurationBucket:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasDurationBucket
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setPercentageActive:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_percentageActive = a3;
}

- (void)setHasPercentageActive:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageActive
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setPercentagePowerSave:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_percentagePowerSave = a3;
}

- (void)setHasPercentagePowerSave:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentagePowerSave
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setPercentageWcpsEnabled:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_percentageWcpsEnabled = a3;
}

- (void)setHasPercentageWcpsEnabled:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageWcpsEnabled
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setPercentageWcpsReduced:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_percentageWcpsReduced = a3;
}

- (void)setHasPercentageWcpsReduced:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageWcpsReduced
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setPercentageWcpsDisabled:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_percentageWcpsDisabled = a3;
}

- (void)setHasPercentageWcpsDisabled:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasPercentageWcpsDisabled
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setCntVoGoodPeriods:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_cntVoGoodPeriods = a3;
}

- (void)setHasCntVoGoodPeriods:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCntVoGoodPeriods
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCntVoBadPeriods:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_cntVoBadPeriods = a3;
}

- (void)setHasCntVoBadPeriods:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCntVoBadPeriods
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setAvgRssi:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_avgRssi = a3;
}

- (void)setHasAvgRssi:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasAvgRssi
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAvgSnr:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_avgSnr = a3;
}

- (void)setHasAvgSnr:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasAvgSnr
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setAvgCca:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_avgCca = a3;
}

- (void)setHasAvgCca:(BOOL)a3
{
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasAvgCca
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setAvgTxAirLatency:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_avgTxAirLatency = a3;
}

- (void)setHasAvgTxAirLatency:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasAvgTxAirLatency
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAvgTxPacketLoss:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_avgTxPacketLoss = a3;
}

- (void)setHasAvgTxPacketLoss:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasAvgTxPacketLoss
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAvgTxRetrans:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_avgTxRetrans = a3;
}

- (void)setHasAvgTxRetrans:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasAvgTxRetrans
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setAvgRxRetry:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_avgRxRetry = a3;
}

- (void)setHasAvgRxRetry:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasAvgRxRetry
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEndRssi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_endRssi = a3;
}

- (void)setHasEndRssi:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasEndRssi
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setEndSnr:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_endSnr = a3;
}

- (void)setHasEndSnr:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasEndSnr
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setEndCca:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_endCca = a3;
}

- (void)setHasEndCca:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasEndCca
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setEndTxAirLatency:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_endTxAirLatency = a3;
}

- (void)setHasEndTxAirLatency:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasEndTxAirLatency
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setEndTxPacketLoss:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_endTxPacketLoss = a3;
}

- (void)setHasEndTxPacketLoss:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasEndTxPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setEndTxRetrans:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_endTxRetrans = a3;
}

- (void)setHasEndTxRetrans:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasEndTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setEndRxRetry:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_endRxRetry = a3;
}

- (void)setHasEndRxRetry:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasEndRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setMinRssi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_minRssi = a3;
}

- (void)setHasMinRssi:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasMinRssi
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setMinSnr:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_minSnr = a3;
}

- (void)setHasMinSnr:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasMinSnr
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setMinCca:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_minCca = a3;
}

- (void)setHasMinCca:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasMinCca
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setMinTxAirLatency:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_minTxAirLatency = a3;
}

- (void)setHasMinTxAirLatency:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasMinTxAirLatency
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setMinTxPacketLoss:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_minTxPacketLoss = a3;
}

- (void)setHasMinTxPacketLoss:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasMinTxPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setMinTxRetrans:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_minTxRetrans = a3;
}

- (void)setHasMinTxRetrans:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasMinTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setMinRxRetry:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_minRxRetry = a3;
}

- (void)setHasMinRxRetry:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasMinRxRetry
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setMaxRssi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_maxRssi = a3;
}

- (void)setHasMaxRssi:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasMaxRssi
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setMaxnSnr:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_maxnSnr = a3;
}

- (void)setHasMaxnSnr:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasMaxnSnr
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setMaxCca:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_maxCca = a3;
}

- (void)setHasMaxCca:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasMaxCca
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setMaxTxAirLatency:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_maxTxAirLatency = a3;
}

- (void)setHasMaxTxAirLatency:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasMaxTxAirLatency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setMaxTxPacketLoss:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_maxTxPacketLoss = a3;
}

- (void)setHasMaxTxPacketLoss:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasMaxTxPacketLoss
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setMaxTxRetrans:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_maxTxRetrans = a3;
}

- (void)setHasMaxTxRetrans:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasMaxTxRetrans
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setMaxRxRetry:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_maxRxRetry = a3;
}

- (void)setHasMaxRxRetry:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasMaxRxRetry
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setCntRedBtConnLatLow:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_cntRedBtConnLatLow = a3;
}

- (void)setHasCntRedBtConnLatLow:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCntRedBtConnLatLow
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCntRedBtDisconnLatHi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_cntRedBtDisconnLatHi = a3;
}

- (void)setHasCntRedBtDisconnLatHi:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCntRedBtDisconnLatHi
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCntDisBtConnLatHi:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_cntDisBtConnLatHi = a3;
}

- (void)setHasCntDisBtConnLatHi:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCntDisBtConnLatHi
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCntDisBtEv3:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_cntDisBtEuint64_t v3 = a3;
}

- (void)setHasCntDisBtEv3:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCntDisBtEv3
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCntAwdlActive:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_cntAwdlActive = a3;
}

- (void)setHasCntAwdlActive:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCntAwdlActive
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setEndLinkState:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_endLinkState = a3;
}

- (void)setHasEndLinkState:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($E61337C3C8DF5C121F217BB1569CBB9D)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasEndLinkState
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiWcpsStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiWcpsStats description](&v3, sel_description), -[AWDWiFiWcpsStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x2000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_durationBucket] forKey:@"durationBucket"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_percentageActive] forKey:@"percentageActive"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_percentagePowerSave] forKey:@"percentagePowerSave"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_percentageWcpsEnabled] forKey:@"percentageWcpsEnabled"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_percentageWcpsReduced] forKey:@"percentageWcpsReduced"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_percentageWcpsDisabled] forKey:@"percentageWcpsDisabled"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntVoGoodPeriods] forKey:@"cntVoGoodPeriods"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntVoBadPeriods] forKey:@"cntVoBadPeriods"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgRssi] forKey:@"avgRssi"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgSnr] forKey:@"avgSnr"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgCca] forKey:@"avgCca"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgTxAirLatency] forKey:@"avgTxAirLatency"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgTxPacketLoss] forKey:@"avgTxPacketLoss"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgTxRetrans] forKey:@"avgTxRetrans"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgRxRetry] forKey:@"avgRxRetry"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endRssi] forKey:@"endRssi"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endSnr] forKey:@"endSnr"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endCca] forKey:@"endCca"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endTxAirLatency] forKey:@"endTxAirLatency"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endTxPacketLoss] forKey:@"endTxPacketLoss"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endTxRetrans] forKey:@"endTxRetrans"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endRxRetry] forKey:@"endRxRetry"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minRssi] forKey:@"minRssi"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minSnr] forKey:@"minSnr"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minCca] forKey:@"minCca"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minTxAirLatency] forKey:@"minTxAirLatency"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minTxPacketLoss] forKey:@"minTxPacketLoss"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minTxRetrans] forKey:@"minTxRetrans"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_minRxRetry] forKey:@"minRxRetry"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxRssi] forKey:@"maxRssi"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxnSnr] forKey:@"maxnSnr"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxCca] forKey:@"maxCca"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxTxAirLatency] forKey:@"maxTxAirLatency"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxTxPacketLoss] forKey:@"maxTxPacketLoss"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxTxRetrans] forKey:@"maxTxRetrans"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_39;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxRxRetry] forKey:@"maxRxRetry"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntRedBtConnLatLow] forKey:@"cntRedBtConnLatLow"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntRedBtDisconnLatHi] forKey:@"cntRedBtDisconnLatHi"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_42;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntDisBtConnLatHi] forKey:@"cntDisBtConnLatHi"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_43;
    }
LABEL_87:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntAwdlActive] forKey:@"cntAwdlActive"];
    if ((*(void *)&self->_has & 0x10000) == 0) {
      return v3;
    }
    goto LABEL_44;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cntDisBtEv3] forKey:@"cntDisBtEv3"];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0) {
    goto LABEL_87;
  }
LABEL_43:
  if ((*(_DWORD *)&has & 0x10000) != 0) {
LABEL_44:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endLinkState] forKey:@"endLinkState"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiWcpsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x2000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_43;
    }
LABEL_86:
    PBDataWriterWriteUint64Field();
    if ((*(void *)&self->_has & 0x10000) == 0) {
      return;
    }
    goto LABEL_87;
  }
LABEL_85:
  PBDataWriterWriteUint64Field();
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) != 0) {
    goto LABEL_86;
  }
LABEL_43:
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    return;
  }
LABEL_87:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    *((void *)a3 + 43) = self->_timestamp;
    *((void *)a3 + 44) |= 0x40000000000uLL;
    $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x2000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 15) = self->_durationBucket;
  *((void *)a3 + 44) |= 0x4000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((void *)a3 + 38) = self->_percentageActive;
  *((void *)a3 + 44) |= 0x2000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)a3 + 39) = self->_percentagePowerSave;
  *((void *)a3 + 44) |= 0x4000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)a3 + 41) = self->_percentageWcpsEnabled;
  *((void *)a3 + 44) |= 0x10000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)a3 + 42) = self->_percentageWcpsReduced;
  *((void *)a3 + 44) |= 0x20000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)a3 + 40) = self->_percentageWcpsDisabled;
  *((void *)a3 + 44) |= 0x8000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)a3 + 14) = self->_cntVoGoodPeriods;
  *((void *)a3 + 44) |= 0x2000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)a3 + 13) = self->_cntVoBadPeriods;
  *((void *)a3 + 44) |= 0x1000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)a3 + 2) = self->_avgRssi;
  *((void *)a3 + 44) |= 2uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)a3 + 4) = self->_avgSnr;
  *((void *)a3 + 44) |= 8uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)a3 + 1) = self->_avgCca;
  *((void *)a3 + 44) |= 1uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)a3 + 5) = self->_avgTxAirLatency;
  *((void *)a3 + 44) |= 0x10uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)a3 + 6) = self->_avgTxPacketLoss;
  *((void *)a3 + 44) |= 0x20uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)a3 + 7) = self->_avgTxRetrans;
  *((void *)a3 + 44) |= 0x40uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)a3 + 3) = self->_avgRxRetry;
  *((void *)a3 + 44) |= 4uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)a3 + 18) = self->_endRssi;
  *((void *)a3 + 44) |= 0x20000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)a3 + 20) = self->_endSnr;
  *((void *)a3 + 44) |= 0x80000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)a3 + 16) = self->_endCca;
  *((void *)a3 + 44) |= 0x8000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)a3 + 21) = self->_endTxAirLatency;
  *((void *)a3 + 44) |= 0x100000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)a3 + 22) = self->_endTxPacketLoss;
  *((void *)a3 + 44) |= 0x200000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)a3 + 23) = self->_endTxRetrans;
  *((void *)a3 + 44) |= 0x400000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)a3 + 19) = self->_endRxRetry;
  *((void *)a3 + 44) |= 0x40000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)a3 + 32) = self->_minRssi;
  *((void *)a3 + 44) |= 0x80000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)a3 + 34) = self->_minSnr;
  *((void *)a3 + 44) |= 0x200000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)a3 + 31) = self->_minCca;
  *((void *)a3 + 44) |= 0x40000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)a3 + 35) = self->_minTxAirLatency;
  *((void *)a3 + 44) |= 0x400000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)a3 + 36) = self->_minTxPacketLoss;
  *((void *)a3 + 44) |= 0x800000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)a3 + 37) = self->_minTxRetrans;
  *((void *)a3 + 44) |= 0x1000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)a3 + 33) = self->_minRxRetry;
  *((void *)a3 + 44) |= 0x100000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)a3 + 25) = self->_maxRssi;
  *((void *)a3 + 44) |= 0x1000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)a3 + 30) = self->_maxnSnr;
  *((void *)a3 + 44) |= 0x20000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)a3 + 24) = self->_maxCca;
  *((void *)a3 + 44) |= 0x800000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)a3 + 27) = self->_maxTxAirLatency;
  *((void *)a3 + 44) |= 0x4000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)a3 + 28) = self->_maxTxPacketLoss;
  *((void *)a3 + 44) |= 0x8000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)a3 + 29) = self->_maxTxRetrans;
  *((void *)a3 + 44) |= 0x10000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)a3 + 26) = self->_maxRxRetry;
  *((void *)a3 + 44) |= 0x2000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)a3 + 11) = self->_cntRedBtConnLatLow;
  *((void *)a3 + 44) |= 0x400uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)a3 + 12) = self->_cntRedBtDisconnLatHi;
  *((void *)a3 + 44) |= 0x800uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)a3 + 9) = self->_cntDisBtConnLatHi;
  *((void *)a3 + 44) |= 0x100uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)a3 + 10) = self->_cntDisBtEv3;
  *((void *)a3 + 44) |= 0x200uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      return;
    }
LABEL_87:
    *((void *)a3 + 17) = self->_endLinkState;
    *((void *)a3 + 44) |= 0x10000uLL;
    return;
  }
LABEL_86:
  *((void *)a3 + 8) = self->_cntAwdlActive;
  *((void *)a3 + 44) |= 0x80uLL;
  if ((*(void *)&self->_has & 0x10000) != 0) {
    goto LABEL_87;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    *((void *)result + 43) = self->_timestamp;
    *((void *)result + 44) |= 0x40000000000uLL;
    $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x2000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_48;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 15) = self->_durationBucket;
  *((void *)result + 44) |= 0x4000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x2000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x4000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((void *)result + 38) = self->_percentageActive;
  *((void *)result + 44) |= 0x2000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x4000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((void *)result + 39) = self->_percentagePowerSave;
  *((void *)result + 44) |= 0x4000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((void *)result + 41) = self->_percentageWcpsEnabled;
  *((void *)result + 44) |= 0x10000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x8000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((void *)result + 42) = self->_percentageWcpsReduced;
  *((void *)result + 44) |= 0x20000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x8000000000) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_53;
  }
LABEL_52:
  *((void *)result + 40) = self->_percentageWcpsDisabled;
  *((void *)result + 44) |= 0x8000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_54;
  }
LABEL_53:
  *((void *)result + 14) = self->_cntVoGoodPeriods;
  *((void *)result + 44) |= 0x2000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_55;
  }
LABEL_54:
  *((void *)result + 13) = self->_cntVoBadPeriods;
  *((void *)result + 44) |= 0x1000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_11:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_56;
  }
LABEL_55:
  *((void *)result + 2) = self->_avgRssi;
  *((void *)result + 44) |= 2uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_57;
  }
LABEL_56:
  *((void *)result + 4) = self->_avgSnr;
  *((void *)result + 44) |= 8uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_13:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_58;
  }
LABEL_57:
  *((void *)result + 1) = self->_avgCca;
  *((void *)result + 44) |= 1uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_59;
  }
LABEL_58:
  *((void *)result + 5) = self->_avgTxAirLatency;
  *((void *)result + 44) |= 0x10uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((void *)result + 6) = self->_avgTxPacketLoss;
  *((void *)result + 44) |= 0x20uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_16:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((void *)result + 7) = self->_avgTxRetrans;
  *((void *)result + 44) |= 0x40uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&has & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((void *)result + 3) = self->_avgRxRetry;
  *((void *)result + 44) |= 4uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((void *)result + 18) = self->_endRssi;
  *((void *)result + 44) |= 0x20000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((void *)result + 20) = self->_endSnr;
  *((void *)result + 44) |= 0x80000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&has & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((void *)result + 16) = self->_endCca;
  *((void *)result + 44) |= 0x8000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x100000) == 0)
  {
LABEL_21:
    if ((*(_DWORD *)&has & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((void *)result + 21) = self->_endTxAirLatency;
  *((void *)result + 44) |= 0x100000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x200000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&has & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((void *)result + 22) = self->_endTxPacketLoss;
  *((void *)result + 44) |= 0x200000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x400000) == 0)
  {
LABEL_23:
    if ((*(_DWORD *)&has & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((void *)result + 23) = self->_endTxRetrans;
  *((void *)result + 44) |= 0x400000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&has & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((void *)result + 19) = self->_endRxRetry;
  *((void *)result + 44) |= 0x40000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
LABEL_25:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((void *)result + 32) = self->_minRssi;
  *((void *)result + 44) |= 0x80000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&has & 0x40000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_71;
  }
LABEL_70:
  *((void *)result + 34) = self->_minSnr;
  *((void *)result + 44) |= 0x200000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x40000000) == 0)
  {
LABEL_27:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_72;
  }
LABEL_71:
  *((void *)result + 31) = self->_minCca;
  *((void *)result + 44) |= 0x40000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_28:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_73;
  }
LABEL_72:
  *((void *)result + 35) = self->_minTxAirLatency;
  *((void *)result + 44) |= 0x400000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_29:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_74;
  }
LABEL_73:
  *((void *)result + 36) = self->_minTxPacketLoss;
  *((void *)result + 44) |= 0x800000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_30:
    if ((*(void *)&has & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((void *)result + 37) = self->_minTxRetrans;
  *((void *)result + 44) |= 0x1000000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x100000000) == 0)
  {
LABEL_31:
    if ((*(_DWORD *)&has & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((void *)result + 33) = self->_minRxRetry;
  *((void *)result + 44) |= 0x100000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x1000000) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&has & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((void *)result + 25) = self->_maxRssi;
  *((void *)result + 44) |= 0x1000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x20000000) == 0)
  {
LABEL_33:
    if ((*(_DWORD *)&has & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((void *)result + 30) = self->_maxnSnr;
  *((void *)result + 44) |= 0x20000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x800000) == 0)
  {
LABEL_34:
    if ((*(_DWORD *)&has & 0x4000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((void *)result + 24) = self->_maxCca;
  *((void *)result + 44) |= 0x800000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x4000000) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&has & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((void *)result + 27) = self->_maxTxAirLatency;
  *((void *)result + 44) |= 0x4000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(_DWORD *)&has & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((void *)result + 28) = self->_maxTxPacketLoss;
  *((void *)result + 44) |= 0x8000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x10000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&has & 0x2000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((void *)result + 29) = self->_maxTxRetrans;
  *((void *)result + 44) |= 0x10000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_DWORD *)&has & 0x2000000) == 0)
  {
LABEL_38:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_39;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((void *)result + 26) = self->_maxRxRetry;
  *((void *)result + 44) |= 0x2000000uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_39:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((void *)result + 11) = self->_cntRedBtConnLatLow;
  *((void *)result + 44) |= 0x400uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_40:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((void *)result + 12) = self->_cntRedBtDisconnLatHi;
  *((void *)result + 44) |= 0x800uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_41:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_42;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((void *)result + 9) = self->_cntDisBtConnLatHi;
  *((void *)result + 44) |= 0x100uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_42:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((void *)result + 10) = self->_cntDisBtEv3;
  *((void *)result + 44) |= 0x200uLL;
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      return result;
    }
    goto LABEL_44;
  }
LABEL_87:
  *((void *)result + 8) = self->_cntAwdlActive;
  *((void *)result + 44) |= 0x80uLL;
  if ((*(void *)&self->_has & 0x10000) == 0) {
    return result;
  }
LABEL_44:
  *((void *)result + 17) = self->_endLinkState;
  *((void *)result + 44) |= 0x10000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
    uint64_t v7 = *((void *)a3 + 44);
    if ((*(void *)&has & 0x40000000000) != 0)
    {
      if ((v7 & 0x40000000000) == 0 || self->_timestamp != *((void *)a3 + 43)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x40000000000) != 0)
    {
LABEL_216:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_durationBucket != *((void *)a3 + 15)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x2000000000) != 0)
    {
      if ((v7 & 0x2000000000) == 0 || self->_percentageActive != *((void *)a3 + 38)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x2000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x4000000000) != 0)
    {
      if ((v7 & 0x4000000000) == 0 || self->_percentagePowerSave != *((void *)a3 + 39)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x4000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x10000000000) != 0)
    {
      if ((v7 & 0x10000000000) == 0 || self->_percentageWcpsEnabled != *((void *)a3 + 41)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x10000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x20000000000) != 0)
    {
      if ((v7 & 0x20000000000) == 0 || self->_percentageWcpsReduced != *((void *)a3 + 42)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x20000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x8000000000) != 0)
    {
      if ((v7 & 0x8000000000) == 0 || self->_percentageWcpsDisabled != *((void *)a3 + 40)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x8000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_cntVoGoodPeriods != *((void *)a3 + 14)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_cntVoBadPeriods != *((void *)a3 + 13)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_avgRssi != *((void *)a3 + 2)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_avgSnr != *((void *)a3 + 4)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_216;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_avgCca != *((void *)a3 + 1)) {
        goto LABEL_216;
      }
    }
    else if (v7)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_avgTxAirLatency != *((void *)a3 + 5)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_avgTxPacketLoss != *((void *)a3 + 6)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_avgTxRetrans != *((void *)a3 + 7)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_avgRxRetry != *((void *)a3 + 3)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x20000) != 0)
    {
      if ((v7 & 0x20000) == 0 || self->_endRssi != *((void *)a3 + 18)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x20000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_endSnr != *((void *)a3 + 20)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_endCca != *((void *)a3 + 16)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x100000) != 0)
    {
      if ((v7 & 0x100000) == 0 || self->_endTxAirLatency != *((void *)a3 + 21)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x100000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x200000) != 0)
    {
      if ((v7 & 0x200000) == 0 || self->_endTxPacketLoss != *((void *)a3 + 22)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x200000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x400000) != 0)
    {
      if ((v7 & 0x400000) == 0 || self->_endTxRetrans != *((void *)a3 + 23)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x400000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x40000) != 0)
    {
      if ((v7 & 0x40000) == 0 || self->_endRxRetry != *((void *)a3 + 19)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x40000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((v7 & 0x80000000) == 0 || self->_minRssi != *((void *)a3 + 32)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x80000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x200000000) != 0)
    {
      if ((v7 & 0x200000000) == 0 || self->_minSnr != *((void *)a3 + 34)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x200000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x40000000) != 0)
    {
      if ((v7 & 0x40000000) == 0 || self->_minCca != *((void *)a3 + 31)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x40000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x400000000) != 0)
    {
      if ((v7 & 0x400000000) == 0 || self->_minTxAirLatency != *((void *)a3 + 35)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x400000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x800000000) != 0)
    {
      if ((v7 & 0x800000000) == 0 || self->_minTxPacketLoss != *((void *)a3 + 36)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x800000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x1000000000) != 0)
    {
      if ((v7 & 0x1000000000) == 0 || self->_minTxRetrans != *((void *)a3 + 37)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x1000000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(void *)&has & 0x100000000) != 0)
    {
      if ((v7 & 0x100000000) == 0 || self->_minRxRetry != *((void *)a3 + 33)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x100000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x1000000) != 0)
    {
      if ((v7 & 0x1000000) == 0 || self->_maxRssi != *((void *)a3 + 25)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x1000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x20000000) != 0)
    {
      if ((v7 & 0x20000000) == 0 || self->_maxnSnr != *((void *)a3 + 30)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x20000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x800000) != 0)
    {
      if ((v7 & 0x800000) == 0 || self->_maxCca != *((void *)a3 + 24)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x800000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x4000000) != 0)
    {
      if ((v7 & 0x4000000) == 0 || self->_maxTxAirLatency != *((void *)a3 + 27)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x4000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x8000000) != 0)
    {
      if ((v7 & 0x8000000) == 0 || self->_maxTxPacketLoss != *((void *)a3 + 28)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x8000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x10000000) != 0)
    {
      if ((v7 & 0x10000000) == 0 || self->_maxTxRetrans != *((void *)a3 + 29)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x10000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_DWORD *)&has & 0x2000000) != 0)
    {
      if ((v7 & 0x2000000) == 0 || self->_maxRxRetry != *((void *)a3 + 26)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x2000000) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_cntRedBtConnLatLow != *((void *)a3 + 11)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_cntRedBtDisconnLatHi != *((void *)a3 + 12)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_cntDisBtConnLatHi != *((void *)a3 + 9)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_216;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v7 & 0x200) == 0 || self->_cntDisBtEv3 != *((void *)a3 + 10)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x200) != 0)
    {
      goto LABEL_216;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_cntAwdlActive != *((void *)a3 + 8)) {
        goto LABEL_216;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_216;
    }
    LOBYTE(v5) = (v7 & 0x10000) == 0;
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_endLinkState != *((void *)a3 + 17)) {
        goto LABEL_216;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $E61337C3C8DF5C121F217BB1569CBB9D has = self->_has;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    unint64_t v46 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      unint64_t v45 = 2654435761u * self->_durationBucket;
      if ((*(void *)&has & 0x2000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else
  {
    unint64_t v46 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v45 = 0;
  if ((*(void *)&has & 0x2000000000) != 0)
  {
LABEL_4:
    unint64_t v44 = 2654435761u * self->_percentageActive;
    if ((*(void *)&has & 0x4000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  unint64_t v44 = 0;
  if ((*(void *)&has & 0x4000000000) != 0)
  {
LABEL_5:
    unint64_t v43 = 2654435761u * self->_percentagePowerSave;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  unint64_t v43 = 0;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_6:
    unint64_t v42 = 2654435761u * self->_percentageWcpsEnabled;
    if ((*(void *)&has & 0x20000000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  unint64_t v42 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_7:
    unint64_t v41 = 2654435761u * self->_percentageWcpsReduced;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  unint64_t v41 = 0;
  if ((*(void *)&has & 0x8000000000) != 0)
  {
LABEL_8:
    unint64_t v40 = 2654435761u * self->_percentageWcpsDisabled;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  unint64_t v40 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_9:
    unint64_t v39 = 2654435761u * self->_cntVoGoodPeriods;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  unint64_t v39 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_10:
    unint64_t v38 = 2654435761u * self->_cntVoBadPeriods;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  unint64_t v38 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_11:
    unint64_t v37 = 2654435761u * self->_avgRssi;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  unint64_t v37 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_12:
    unint64_t v36 = 2654435761u * self->_avgSnr;
    if (*(unsigned char *)&has) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  unint64_t v36 = 0;
  if (*(unsigned char *)&has)
  {
LABEL_13:
    unint64_t v35 = 2654435761u * self->_avgCca;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  unint64_t v35 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_14:
    unint64_t v34 = 2654435761u * self->_avgTxAirLatency;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  unint64_t v34 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_15:
    unint64_t v33 = 2654435761u * self->_avgTxPacketLoss;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  unint64_t v33 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_16:
    unint64_t v32 = 2654435761u * self->_avgTxRetrans;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  unint64_t v32 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_17:
    unint64_t v31 = 2654435761u * self->_avgRxRetry;
    if ((*(_DWORD *)&has & 0x20000) != 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  unint64_t v31 = 0;
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
LABEL_18:
    unint64_t v30 = 2654435761u * self->_endRssi;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  unint64_t v30 = 0;
  if ((*(_DWORD *)&has & 0x80000) != 0)
  {
LABEL_19:
    unint64_t v3 = 2654435761u * self->_endSnr;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  unint64_t v3 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_20:
    unint64_t v4 = 2654435761u * self->_endCca;
    if ((*(_DWORD *)&has & 0x100000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  unint64_t v4 = 0;
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
LABEL_21:
    unint64_t v5 = 2654435761u * self->_endTxAirLatency;
    if ((*(_DWORD *)&has & 0x200000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  unint64_t v5 = 0;
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
LABEL_22:
    unint64_t v6 = 2654435761u * self->_endTxPacketLoss;
    if ((*(_DWORD *)&has & 0x400000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  unint64_t v6 = 0;
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
LABEL_23:
    unint64_t v7 = 2654435761u * self->_endTxRetrans;
    if ((*(_DWORD *)&has & 0x40000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  unint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
LABEL_24:
    unint64_t v8 = 2654435761u * self->_endRxRetry;
    if ((*(_DWORD *)&has & 0x80000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  unint64_t v8 = 0;
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
LABEL_25:
    unint64_t v9 = 2654435761u * self->_minRssi;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  unint64_t v9 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_26:
    unint64_t v10 = 2654435761u * self->_minSnr;
    if ((*(_DWORD *)&has & 0x40000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  unint64_t v10 = 0;
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
LABEL_27:
    unint64_t v11 = 2654435761u * self->_minCca;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  unint64_t v11 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_28:
    unint64_t v12 = 2654435761u * self->_minTxAirLatency;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  unint64_t v12 = 0;
  if ((*(void *)&has & 0x800000000) != 0)
  {
LABEL_29:
    unint64_t v13 = 2654435761u * self->_minTxPacketLoss;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  unint64_t v13 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_30:
    unint64_t v14 = 2654435761u * self->_minTxRetrans;
    if ((*(void *)&has & 0x100000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  unint64_t v14 = 0;
  if ((*(void *)&has & 0x100000000) != 0)
  {
LABEL_31:
    unint64_t v15 = 2654435761u * self->_minRxRetry;
    if ((*(_DWORD *)&has & 0x1000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  unint64_t v15 = 0;
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
LABEL_32:
    unint64_t v16 = 2654435761u * self->_maxRssi;
    if ((*(_DWORD *)&has & 0x20000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  unint64_t v16 = 0;
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
LABEL_33:
    unint64_t v17 = 2654435761u * self->_maxnSnr;
    if ((*(_DWORD *)&has & 0x800000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  unint64_t v17 = 0;
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
LABEL_34:
    unint64_t v18 = 2654435761u * self->_maxCca;
    if ((*(_DWORD *)&has & 0x4000000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  unint64_t v18 = 0;
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
LABEL_35:
    unint64_t v19 = 2654435761u * self->_maxTxAirLatency;
    if ((*(_DWORD *)&has & 0x8000000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  unint64_t v19 = 0;
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
LABEL_36:
    unint64_t v20 = 2654435761u * self->_maxTxPacketLoss;
    if ((*(_DWORD *)&has & 0x10000000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  unint64_t v20 = 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
LABEL_37:
    unint64_t v21 = 2654435761u * self->_maxTxRetrans;
    if ((*(_DWORD *)&has & 0x2000000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  unint64_t v21 = 0;
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
LABEL_38:
    unint64_t v22 = 2654435761u * self->_maxRxRetry;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  unint64_t v22 = 0;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_39:
    unint64_t v23 = 2654435761u * self->_cntRedBtConnLatLow;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  unint64_t v23 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_40:
    unint64_t v24 = 2654435761u * self->_cntRedBtDisconnLatHi;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  unint64_t v24 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_41:
    unint64_t v25 = 2654435761u * self->_cntDisBtConnLatHi;
    if ((*(_WORD *)&has & 0x200) != 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  unint64_t v25 = 0;
  if ((*(_WORD *)&has & 0x200) != 0)
  {
LABEL_42:
    unint64_t v26 = 2654435761u * self->_cntDisBtEv3;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_43;
    }
LABEL_86:
    unint64_t v27 = 0;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_44;
    }
LABEL_87:
    unint64_t v28 = 0;
    return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
  }
LABEL_85:
  unint64_t v26 = 0;
  if ((*(unsigned char *)&has & 0x80) == 0) {
    goto LABEL_86;
  }
LABEL_43:
  unint64_t v27 = 2654435761u * self->_cntAwdlActive;
  if ((*(_DWORD *)&has & 0x10000) == 0) {
    goto LABEL_87;
  }
LABEL_44:
  unint64_t v28 = 2654435761u * self->_endLinkState;
  return v45 ^ v46 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x40000000000) != 0)
  {
    self->_timestamp = *((void *)a3 + 43);
    *(void *)&self->_has |= 0x40000000000uLL;
    uint64_t v3 = *((void *)a3 + 44);
    if ((v3 & 0x4000) == 0)
    {
LABEL_3:
      if ((v3 & 0x2000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_47;
    }
  }
  else if ((v3 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_durationBucket = *((void *)a3 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x2000000000) == 0)
  {
LABEL_4:
    if ((v3 & 0x4000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_percentageActive = *((void *)a3 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x4000000000) == 0)
  {
LABEL_5:
    if ((v3 & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_percentagePowerSave = *((void *)a3 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x10000000000) == 0)
  {
LABEL_6:
    if ((v3 & 0x20000000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_percentageWcpsEnabled = *((void *)a3 + 41);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x20000000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x8000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_percentageWcpsReduced = *((void *)a3 + 42);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x8000000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_percentageWcpsDisabled = *((void *)a3 + 40);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x2000) == 0)
  {
LABEL_9:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_53;
  }
LABEL_52:
  self->_cntVoGoodPeriods = *((void *)a3 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x1000) == 0)
  {
LABEL_10:
    if ((v3 & 2) == 0) {
      goto LABEL_11;
    }
    goto LABEL_54;
  }
LABEL_53:
  self->_cntVoBadPeriods = *((void *)a3 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 2) == 0)
  {
LABEL_11:
    if ((v3 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_55;
  }
LABEL_54:
  self->_avgRssi = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 8) == 0)
  {
LABEL_12:
    if ((v3 & 1) == 0) {
      goto LABEL_13;
    }
    goto LABEL_56;
  }
LABEL_55:
  self->_avgSnr = *((void *)a3 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 1) == 0)
  {
LABEL_13:
    if ((v3 & 0x10) == 0) {
      goto LABEL_14;
    }
    goto LABEL_57;
  }
LABEL_56:
  self->_avgCca = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x10) == 0)
  {
LABEL_14:
    if ((v3 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_58;
  }
LABEL_57:
  self->_avgTxAirLatency = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x20) == 0)
  {
LABEL_15:
    if ((v3 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_59;
  }
LABEL_58:
  self->_avgTxPacketLoss = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x40) == 0)
  {
LABEL_16:
    if ((v3 & 4) == 0) {
      goto LABEL_17;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_avgTxRetrans = *((void *)a3 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 4) == 0)
  {
LABEL_17:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_avgRxRetry = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x20000) == 0)
  {
LABEL_18:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_endRssi = *((void *)a3 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x80000) == 0)
  {
LABEL_19:
    if ((v3 & 0x8000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_endSnr = *((void *)a3 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x8000) == 0)
  {
LABEL_20:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_endCca = *((void *)a3 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x100000) == 0)
  {
LABEL_21:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_endTxAirLatency = *((void *)a3 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x200000) == 0)
  {
LABEL_22:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_endTxPacketLoss = *((void *)a3 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x400000) == 0)
  {
LABEL_23:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_endTxRetrans = *((void *)a3 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x40000) == 0)
  {
LABEL_24:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_endRxRetry = *((void *)a3 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_25:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_minRssi = *((void *)a3 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_26:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_minSnr = *((void *)a3 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_27:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_71;
  }
LABEL_70:
  self->_minCca = *((void *)a3 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_28:
    if ((v3 & 0x800000000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_72;
  }
LABEL_71:
  self->_minTxAirLatency = *((void *)a3 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x800000000) == 0)
  {
LABEL_29:
    if ((v3 & 0x1000000000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_73;
  }
LABEL_72:
  self->_minTxPacketLoss = *((void *)a3 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x1000000000) == 0)
  {
LABEL_30:
    if ((v3 & 0x100000000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_74;
  }
LABEL_73:
  self->_minTxRetrans = *((void *)a3 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_31:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_minRxRetry = *((void *)a3 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_32:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_maxRssi = *((void *)a3 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_33:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_maxnSnr = *((void *)a3 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x800000) == 0)
  {
LABEL_34:
    if ((v3 & 0x4000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_maxCca = *((void *)a3 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x4000000) == 0)
  {
LABEL_35:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_maxTxAirLatency = *((void *)a3 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_36:
    if ((v3 & 0x10000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_maxTxPacketLoss = *((void *)a3 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_37:
    if ((v3 & 0x2000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_maxTxRetrans = *((void *)a3 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x2000000) == 0)
  {
LABEL_38:
    if ((v3 & 0x400) == 0) {
      goto LABEL_39;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_maxRxRetry = *((void *)a3 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x400) == 0)
  {
LABEL_39:
    if ((v3 & 0x800) == 0) {
      goto LABEL_40;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_cntRedBtConnLatLow = *((void *)a3 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x800) == 0)
  {
LABEL_40:
    if ((v3 & 0x100) == 0) {
      goto LABEL_41;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_cntRedBtDisconnLatHi = *((void *)a3 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x100) == 0)
  {
LABEL_41:
    if ((v3 & 0x200) == 0) {
      goto LABEL_42;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_cntDisBtConnLatHi = *((void *)a3 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x200) == 0)
  {
LABEL_42:
    if ((v3 & 0x80) == 0) {
      goto LABEL_43;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_cntDisBtEuint64_t v3 = *((void *)a3 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v3 = *((void *)a3 + 44);
  if ((v3 & 0x80) == 0)
  {
LABEL_43:
    if ((v3 & 0x10000) == 0) {
      return;
    }
LABEL_87:
    self->_endLinkState = *((void *)a3 + 17);
    *(void *)&self->_has |= 0x10000uLL;
    return;
  }
LABEL_86:
  self->_cntAwdlActive = *((void *)a3 + 8);
  *(void *)&self->_has |= 0x80uLL;
  if ((*((void *)a3 + 44) & 0x10000) != 0) {
    goto LABEL_87;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)durationBucket
{
  return self->_durationBucket;
}

- (unint64_t)percentageActive
{
  return self->_percentageActive;
}

- (unint64_t)percentagePowerSave
{
  return self->_percentagePowerSave;
}

- (unint64_t)percentageWcpsEnabled
{
  return self->_percentageWcpsEnabled;
}

- (unint64_t)percentageWcpsReduced
{
  return self->_percentageWcpsReduced;
}

- (unint64_t)percentageWcpsDisabled
{
  return self->_percentageWcpsDisabled;
}

- (unint64_t)cntVoGoodPeriods
{
  return self->_cntVoGoodPeriods;
}

- (unint64_t)cntVoBadPeriods
{
  return self->_cntVoBadPeriods;
}

- (unint64_t)avgRssi
{
  return self->_avgRssi;
}

- (unint64_t)avgSnr
{
  return self->_avgSnr;
}

- (unint64_t)avgCca
{
  return self->_avgCca;
}

- (unint64_t)avgTxAirLatency
{
  return self->_avgTxAirLatency;
}

- (unint64_t)avgTxPacketLoss
{
  return self->_avgTxPacketLoss;
}

- (unint64_t)avgTxRetrans
{
  return self->_avgTxRetrans;
}

- (unint64_t)avgRxRetry
{
  return self->_avgRxRetry;
}

- (unint64_t)endRssi
{
  return self->_endRssi;
}

- (unint64_t)endSnr
{
  return self->_endSnr;
}

- (unint64_t)endCca
{
  return self->_endCca;
}

- (unint64_t)endTxAirLatency
{
  return self->_endTxAirLatency;
}

- (unint64_t)endTxPacketLoss
{
  return self->_endTxPacketLoss;
}

- (unint64_t)endTxRetrans
{
  return self->_endTxRetrans;
}

- (unint64_t)endRxRetry
{
  return self->_endRxRetry;
}

- (unint64_t)minRssi
{
  return self->_minRssi;
}

- (unint64_t)minSnr
{
  return self->_minSnr;
}

- (unint64_t)minCca
{
  return self->_minCca;
}

- (unint64_t)minTxAirLatency
{
  return self->_minTxAirLatency;
}

- (unint64_t)minTxPacketLoss
{
  return self->_minTxPacketLoss;
}

- (unint64_t)minTxRetrans
{
  return self->_minTxRetrans;
}

- (unint64_t)minRxRetry
{
  return self->_minRxRetry;
}

- (unint64_t)maxRssi
{
  return self->_maxRssi;
}

- (unint64_t)maxnSnr
{
  return self->_maxnSnr;
}

- (unint64_t)maxCca
{
  return self->_maxCca;
}

- (unint64_t)maxTxAirLatency
{
  return self->_maxTxAirLatency;
}

- (unint64_t)maxTxPacketLoss
{
  return self->_maxTxPacketLoss;
}

- (unint64_t)maxTxRetrans
{
  return self->_maxTxRetrans;
}

- (unint64_t)maxRxRetry
{
  return self->_maxRxRetry;
}

- (unint64_t)cntRedBtConnLatLow
{
  return self->_cntRedBtConnLatLow;
}

- (unint64_t)cntRedBtDisconnLatHi
{
  return self->_cntRedBtDisconnLatHi;
}

- (unint64_t)cntDisBtConnLatHi
{
  return self->_cntDisBtConnLatHi;
}

- (unint64_t)cntDisBtEv3
{
  return self->_cntDisBtEv3;
}

- (unint64_t)cntAwdlActive
{
  return self->_cntAwdlActive;
}

- (unint64_t)endLinkState
{
  return self->_endLinkState;
}

@end