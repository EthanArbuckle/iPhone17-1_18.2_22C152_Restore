@interface AWDWiFiMetricsManagerAutoJoinRecord
+ (Class)networksExcludedFromAJDueToThresholdsType;
- (BOOL)hasBandExclusionReason;
- (BOOL)hasBandScanCount24;
- (BOOL)hasBandScanCount5;
- (BOOL)hasBeganTimestamp;
- (BOOL)hasCcaBitmap;
- (BOOL)hasEndedTimestamp;
- (BOOL)hasEnteredKnownNetworkGeotagLocationTimeStamp;
- (BOOL)hasKnownNetworksFoundInScans;
- (BOOL)hasLastScanError;
- (BOOL)hasLastScanType;
- (BOOL)hasNwExclusionCount;
- (BOOL)hasResetReason;
- (BOOL)hasResetTypes;
- (BOOL)hasRetryIndex;
- (BOOL)hasRssiBitmap;
- (BOOL)hasScanResultFound;
- (BOOL)hasScanTypes;
- (BOOL)hasState;
- (BOOL)hasTimestamp;
- (BOOL)hasWakeTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)networksExcludedFromAJDueToThresholds;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networksExcludedFromAJDueToThresholdsAtIndex:(unint64_t)a3;
- (unint64_t)beganTimestamp;
- (unint64_t)endedTimestamp;
- (unint64_t)enteredKnownNetworkGeotagLocationTimeStamp;
- (unint64_t)hash;
- (unint64_t)networksExcludedFromAJDueToThresholdsCount;
- (unint64_t)scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount;
- (unint64_t)timestamp;
- (unint64_t)wakeTimestamp;
- (unsigned)bandExclusionReason;
- (unsigned)bandScanCount24;
- (unsigned)bandScanCount5;
- (unsigned)ccaBitmap;
- (unsigned)knownNetworksFoundInScans;
- (unsigned)lastScanError;
- (unsigned)lastScanType;
- (unsigned)nwExclusionCount;
- (unsigned)resetReason;
- (unsigned)resetTypes;
- (unsigned)retryIndex;
- (unsigned)rssiBitmap;
- (unsigned)scanResultFound;
- (unsigned)scanTypes;
- (unsigned)scannedNetworksExcludedFromAJDueToBlacklistReasonCounts;
- (unsigned)scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:(unint64_t)a3;
- (unsigned)state;
- (void)addNetworksExcludedFromAJDueToThresholds:(id)a3;
- (void)addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:(unsigned int)a3;
- (void)clearNetworksExcludedFromAJDueToThresholds;
- (void)clearScannedNetworksExcludedFromAJDueToBlacklistReasonCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBandExclusionReason:(unsigned int)a3;
- (void)setBandScanCount24:(unsigned int)a3;
- (void)setBandScanCount5:(unsigned int)a3;
- (void)setBeganTimestamp:(unint64_t)a3;
- (void)setCcaBitmap:(unsigned int)a3;
- (void)setEndedTimestamp:(unint64_t)a3;
- (void)setEnteredKnownNetworkGeotagLocationTimeStamp:(unint64_t)a3;
- (void)setHasBandExclusionReason:(BOOL)a3;
- (void)setHasBandScanCount24:(BOOL)a3;
- (void)setHasBandScanCount5:(BOOL)a3;
- (void)setHasBeganTimestamp:(BOOL)a3;
- (void)setHasCcaBitmap:(BOOL)a3;
- (void)setHasEndedTimestamp:(BOOL)a3;
- (void)setHasEnteredKnownNetworkGeotagLocationTimeStamp:(BOOL)a3;
- (void)setHasKnownNetworksFoundInScans:(BOOL)a3;
- (void)setHasLastScanError:(BOOL)a3;
- (void)setHasLastScanType:(BOOL)a3;
- (void)setHasNwExclusionCount:(BOOL)a3;
- (void)setHasResetReason:(BOOL)a3;
- (void)setHasResetTypes:(BOOL)a3;
- (void)setHasRetryIndex:(BOOL)a3;
- (void)setHasRssiBitmap:(BOOL)a3;
- (void)setHasScanResultFound:(BOOL)a3;
- (void)setHasScanTypes:(BOOL)a3;
- (void)setHasState:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWakeTimestamp:(BOOL)a3;
- (void)setKnownNetworksFoundInScans:(unsigned int)a3;
- (void)setLastScanError:(unsigned int)a3;
- (void)setLastScanType:(unsigned int)a3;
- (void)setNetworksExcludedFromAJDueToThresholds:(id)a3;
- (void)setNwExclusionCount:(unsigned int)a3;
- (void)setResetReason:(unsigned int)a3;
- (void)setResetTypes:(unsigned int)a3;
- (void)setRetryIndex:(unsigned int)a3;
- (void)setRssiBitmap:(unsigned int)a3;
- (void)setScanResultFound:(unsigned int)a3;
- (void)setScanTypes:(unsigned int)a3;
- (void)setScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setState:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWakeTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerAutoJoinRecord

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  [(AWDWiFiMetricsManagerAutoJoinRecord *)self setNetworksExcludedFromAJDueToThresholds:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinRecord;
  [(AWDWiFiMetricsManagerAutoJoinRecord *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBeganTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_beganTimestamp = a3;
}

- (void)setHasBeganTimestamp:(BOOL)a3
{
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasBeganTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setEndedTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_endedTimestamp = a3;
}

- (void)setHasEndedTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasEndedTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setWakeTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_wakeTimestamp = a3;
}

- (void)setHasWakeTimestamp:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasWakeTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setEnteredKnownNetworkGeotagLocationTimeStamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_enteredKnownNetworkGeotagLocationTimeStamp = a3;
}

- (void)setHasEnteredKnownNetworkGeotagLocationTimeStamp:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasEnteredKnownNetworkGeotagLocationTimeStamp
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setState:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80000u;
  self->_state = a3;
}

- (void)setHasState:(BOOL)a3
{
  if (a3) {
    int v3 = 0x80000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFF7FFFF | v3);
}

- (BOOL)hasState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setRetryIndex:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_retryIndex = a3;
}

- (void)setHasRetryIndex:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasRetryIndex
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (unint64_t)scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount
{
  return self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count;
}

- (unsigned)scannedNetworksExcludedFromAJDueToBlacklistReasonCounts
{
  return self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.list;
}

- (void)clearScannedNetworksExcludedFromAJDueToBlacklistReasonCounts
{
}

- (void)addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:(unsigned int)a3
{
}

- (unsigned)scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:(unint64_t)a3
{
  p_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts = &self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts;
  unint64_t count = self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts->list[a3];
}

- (void)setScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setScanTypes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40000u;
  self->_scanTypes = a3;
}

- (void)setHasScanTypes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x40000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFBFFFF | v3);
}

- (BOOL)hasScanTypes
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setLastScanType:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_lastScanType = a3;
}

- (void)setHasLastScanType:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasLastScanType
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setResetTypes:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_resetTypes = a3;
}

- (void)setHasResetTypes:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasResetTypes
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setResetReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_resetReason = a3;
}

- (void)setHasResetReason:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasResetReason
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setScanResultFound:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20000u;
  self->_scanResultFound = a3;
}

- (void)setHasScanResultFound:(BOOL)a3
{
  if (a3) {
    int v3 = 0x20000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFDFFFF | v3);
}

- (BOOL)hasScanResultFound
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setKnownNetworksFoundInScans:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_knownNetworksFoundInScans = a3;
}

- (void)setHasKnownNetworksFoundInScans:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasKnownNetworksFoundInScans
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setLastScanError:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_lastScanError = a3;
}

- (void)setHasLastScanError:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasLastScanError
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setRssiBitmap:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_rssiBitmap = a3;
}

- (void)setHasRssiBitmap:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasRssiBitmap
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCcaBitmap:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_ccaBitmap = a3;
}

- (void)setHasCcaBitmap:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasCcaBitmap
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setBandScanCount24:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_bandScanCount24 = a3;
}

- (void)setHasBandScanCount24:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasBandScanCount24
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setBandScanCount5:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_bandScanCount5 = a3;
}

- (void)setHasBandScanCount5:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasBandScanCount5
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setNwExclusionCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_nwExclusionCount = a3;
}

- (void)setHasNwExclusionCount:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasNwExclusionCount
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)clearNetworksExcludedFromAJDueToThresholds
{
}

- (void)addNetworksExcludedFromAJDueToThresholds:(id)a3
{
  networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
  if (!networksExcludedFromAJDueToThresholds)
  {
    networksExcludedFromAJDueToThresholds = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_networksExcludedFromAJDueToThresholds = networksExcludedFromAJDueToThresholds;
  }

  [(NSMutableArray *)networksExcludedFromAJDueToThresholds addObject:a3];
}

- (unint64_t)networksExcludedFromAJDueToThresholdsCount
{
  return [(NSMutableArray *)self->_networksExcludedFromAJDueToThresholds count];
}

- (id)networksExcludedFromAJDueToThresholdsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networksExcludedFromAJDueToThresholds objectAtIndex:a3];
}

+ (Class)networksExcludedFromAJDueToThresholdsType
{
  return (Class)objc_opt_class();
}

- (void)setBandExclusionReason:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_bandExclusionReason = a3;
}

- (void)setHasBandExclusionReason:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($F9739C39B86B3C7E49387613BF7BBB27)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasBandExclusionReason
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinRecord;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerAutoJoinRecord description](&v3, sel_description), -[AWDWiFiMetricsManagerAutoJoinRecord dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_36;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_beganTimestamp] forKey:@"beganTimestamp"];
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_endedTimestamp] forKey:@"endedTimestamp"];
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_wakeTimestamp] forKey:@"wakeTimestamp"];
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_enteredKnownNetworkGeotagLocationTimeStamp] forKey:@"enteredKnownNetworkGeotagLocationTimeStamp"];
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_state] forKey:@"state"];
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_8:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_retryIndex] forKey:@"retryIndex"];
LABEL_9:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"scannedNetworksExcludedFromAJDueToBlacklistReasonCounts"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanTypes] forKey:@"scanTypes"];
    $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x800) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v5 & 0x4000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_43;
    }
  }
  else if ((*(_WORD *)&v5 & 0x800) == 0)
  {
    goto LABEL_11;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lastScanType] forKey:@"lastScanType"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_resetTypes] forKey:@"resetTypes"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_45;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_resetReason] forKey:@"resetReason"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v5 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_46;
  }
LABEL_45:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_scanResultFound] forKey:@"scanResultFound"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_47;
  }
LABEL_46:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_knownNetworksFoundInScans] forKey:@"knownNetworksFoundInScans"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_48;
  }
LABEL_47:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_lastScanError] forKey:@"lastScanError"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v5 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_49;
  }
LABEL_48:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rssiBitmap] forKey:@"rssiBitmap"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v5 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_50;
  }
LABEL_49:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaBitmap] forKey:@"ccaBitmap"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v5 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_51;
  }
LABEL_50:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bandScanCount24] forKey:@"bandScanCount24"];
  $F9739C39B86B3C7E49387613BF7BBB27 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_51:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bandScanCount5] forKey:@"bandScanCount5"];
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_21:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_nwExclusionCount] forKey:@"nwExclusionCount"];
LABEL_22:
  if ([(NSMutableArray *)self->_networksExcludedFromAJDueToThresholds count])
  {
    v6 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_networksExcludedFromAJDueToThresholds, "count")];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
    uint64_t v8 = [(NSMutableArray *)networksExcludedFromAJDueToThresholds countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(networksExcludedFromAJDueToThresholds);
          }
          [v6 addObject:[*(id *)(*((void *)&v13 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v9 = [(NSMutableArray *)networksExcludedFromAJDueToThresholds countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
    [v3 setObject:v6 forKey:@"networksExcludedFromAJDueToThresholds"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bandExclusionReason] forKey:@"bandExclusionReason"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAutoJoinRecordReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint64Field();
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint64Field();
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint64Field();
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x8000) != 0) {
LABEL_8:
  }
    PBDataWriterWriteUint32Field();
LABEL_9:
  if (self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_scannedNetworksExcludedFromAJDueToBlacklistReasonCounts.count);
  }
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) != 0)
  {
    PBDataWriterWriteUint32Field();
    $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x800) == 0)
    {
LABEL_14:
      if ((*(_WORD *)&v6 & 0x4000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_44;
    }
  }
  else if ((*(_WORD *)&v6 & 0x800) == 0)
  {
    goto LABEL_14;
  }
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v6 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x200) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_19:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v6 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_21:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v6 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteUint32Field();
  $F9739C39B86B3C7E49387613BF7BBB27 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_52:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x1000) != 0) {
LABEL_24:
  }
    PBDataWriterWriteUint32Field();
LABEL_25:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
  uint64_t v8 = [(NSMutableArray *)networksExcludedFromAJDueToThresholds countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(networksExcludedFromAJDueToThresholds);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v9 = [(NSMutableArray *)networksExcludedFromAJDueToThresholds countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((_DWORD *)a3 + 36) |= 8u;
    $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_35;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)a3 + 4) = self->_beganTimestamp;
  *((_DWORD *)a3 + 36) |= 1u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((void *)a3 + 5) = self->_endedTimestamp;
  *((_DWORD *)a3 + 36) |= 2u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((void *)a3 + 8) = self->_wakeTimestamp;
  *((_DWORD *)a3 + 36) |= 0x10u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_7;
    }
LABEL_38:
    *((_DWORD *)a3 + 35) = self->_state;
    *((_DWORD *)a3 + 36) |= 0x80000u;
    if ((*(_DWORD *)&self->_has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_37:
  *((void *)a3 + 6) = self->_enteredKnownNetworkGeotagLocationTimeStamp;
  *((_DWORD *)a3 + 36) |= 4u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) != 0) {
    goto LABEL_38;
  }
LABEL_7:
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    *((_DWORD *)a3 + 31) = self->_retryIndex;
    *((_DWORD *)a3 + 36) |= 0x8000u;
  }
LABEL_9:
  if ([(AWDWiFiMetricsManagerAutoJoinRecord *)self scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount])
  {
    [a3 clearScannedNetworksExcludedFromAJDueToBlacklistReasonCounts];
    unint64_t v6 = [(AWDWiFiMetricsManagerAutoJoinRecord *)self scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:-[AWDWiFiMetricsManagerAutoJoinRecord scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:](self, "scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:", i)];
    }
  }
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x40000) != 0)
  {
    *((_DWORD *)a3 + 34) = self->_scanTypes;
    *((_DWORD *)a3 + 36) |= 0x40000u;
    $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
    if ((*(_WORD *)&v9 & 0x800) == 0)
    {
LABEL_15:
      if ((*(_WORD *)&v9 & 0x4000) == 0) {
        goto LABEL_16;
      }
      goto LABEL_42;
    }
  }
  else if ((*(_WORD *)&v9 & 0x800) == 0)
  {
    goto LABEL_15;
  }
  *((_DWORD *)a3 + 24) = self->_lastScanType;
  *((_DWORD *)a3 + 36) |= 0x800u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x4000) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&v9 & 0x2000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_43;
  }
LABEL_42:
  *((_DWORD *)a3 + 30) = self->_resetTypes;
  *((_DWORD *)a3 + 36) |= 0x4000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x2000) == 0)
  {
LABEL_17:
    if ((*(_DWORD *)&v9 & 0x20000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_44;
  }
LABEL_43:
  *((_DWORD *)a3 + 29) = self->_resetReason;
  *((_DWORD *)a3 + 36) |= 0x2000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x20000) == 0)
  {
LABEL_18:
    if ((*(_WORD *)&v9 & 0x200) == 0) {
      goto LABEL_19;
    }
    goto LABEL_45;
  }
LABEL_44:
  *((_DWORD *)a3 + 33) = self->_scanResultFound;
  *((_DWORD *)a3 + 36) |= 0x20000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x200) == 0)
  {
LABEL_19:
    if ((*(_WORD *)&v9 & 0x400) == 0) {
      goto LABEL_20;
    }
    goto LABEL_46;
  }
LABEL_45:
  *((_DWORD *)a3 + 22) = self->_knownNetworksFoundInScans;
  *((_DWORD *)a3 + 36) |= 0x200u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x400) == 0)
  {
LABEL_20:
    if ((*(_DWORD *)&v9 & 0x10000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_47;
  }
LABEL_46:
  *((_DWORD *)a3 + 23) = self->_lastScanError;
  *((_DWORD *)a3 + 36) |= 0x400u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_DWORD *)&v9 & 0x10000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v9 & 0x100) == 0) {
      goto LABEL_22;
    }
    goto LABEL_48;
  }
LABEL_47:
  *((_DWORD *)a3 + 32) = self->_rssiBitmap;
  *((_DWORD *)a3 + 36) |= 0x10000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(_WORD *)&v9 & 0x100) == 0)
  {
LABEL_22:
    if ((*(unsigned char *)&v9 & 0x40) == 0) {
      goto LABEL_23;
    }
    goto LABEL_49;
  }
LABEL_48:
  *((_DWORD *)a3 + 21) = self->_ccaBitmap;
  *((_DWORD *)a3 + 36) |= 0x100u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x40) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v9 & 0x80) == 0) {
      goto LABEL_24;
    }
LABEL_50:
    *((_DWORD *)a3 + 20) = self->_bandScanCount5;
    *((_DWORD *)a3 + 36) |= 0x80u;
    if ((*(_DWORD *)&self->_has & 0x1000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_25;
  }
LABEL_49:
  *((_DWORD *)a3 + 19) = self->_bandScanCount24;
  *((_DWORD *)a3 + 36) |= 0x40u;
  $F9739C39B86B3C7E49387613BF7BBB27 v9 = self->_has;
  if ((*(unsigned char *)&v9 & 0x80) != 0) {
    goto LABEL_50;
  }
LABEL_24:
  if ((*(_WORD *)&v9 & 0x1000) != 0)
  {
LABEL_25:
    *((_DWORD *)a3 + 28) = self->_nwExclusionCount;
    *((_DWORD *)a3 + 36) |= 0x1000u;
  }
LABEL_26:
  if ([(AWDWiFiMetricsManagerAutoJoinRecord *)self networksExcludedFromAJDueToThresholdsCount])
  {
    [a3 clearNetworksExcludedFromAJDueToThresholds];
    unint64_t v10 = [(AWDWiFiMetricsManagerAutoJoinRecord *)self networksExcludedFromAJDueToThresholdsCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t j = 0; j != v11; ++j)
        [a3 addNetworksExcludedFromAJDueToThresholds:-[AWDWiFiMetricsManagerAutoJoinRecord networksExcludedFromAJDueToThresholdsAtIndex:](self, "networksExcludedFromAJDueToThresholdsAtIndex:", j)];
    }
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((_DWORD *)a3 + 18) = self->_bandExclusionReason;
    *((_DWORD *)a3 + 36) |= 0x20u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (_DWORD *)v5;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    *(void *)(v5 + 56) = self->_timestamp;
    *(_DWORD *)(v5 + 144) |= 8u;
    $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
    if ((*(unsigned char *)&has & 1) == 0)
    {
LABEL_3:
      if ((*(unsigned char *)&has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(unsigned char *)&has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(void *)(v5 + 32) = self->_beganTimestamp;
  *(_DWORD *)(v5 + 144) |= 1u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_4:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(void *)(v5 + 40) = self->_endedTimestamp;
  *(_DWORD *)(v5 + 144) |= 2u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(void *)(v5 + 64) = self->_wakeTimestamp;
  *(_DWORD *)(v5 + 144) |= 0x10u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_6:
    if ((*(_DWORD *)&has & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(void *)(v5 + 48) = self->_enteredKnownNetworkGeotagLocationTimeStamp;
  *(_DWORD *)(v5 + 144) |= 4u;
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
LABEL_7:
    if ((*(_WORD *)&has & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_37:
  *(_DWORD *)(v5 + 140) = self->_state;
  *(_DWORD *)(v5 + 144) |= 0x80000u;
  if ((*(_DWORD *)&self->_has & 0x8000) != 0)
  {
LABEL_8:
    *(_DWORD *)(v5 + 124) = self->_retryIndex;
    *(_DWORD *)(v5 + 144) |= 0x8000u;
  }
LABEL_9:
  PBRepeatedUInt32Copy();
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) != 0)
  {
    v6[34] = self->_scanTypes;
    v6[36] |= 0x40000u;
    $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x800) == 0)
    {
LABEL_11:
      if ((*(_WORD *)&v8 & 0x4000) == 0) {
        goto LABEL_12;
      }
      goto LABEL_41;
    }
  }
  else if ((*(_WORD *)&v8 & 0x800) == 0)
  {
    goto LABEL_11;
  }
  v6[24] = self->_lastScanType;
  v6[36] |= 0x800u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_42;
  }
LABEL_41:
  v6[30] = self->_resetTypes;
  v6[36] |= 0x4000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_43;
  }
LABEL_42:
  v6[29] = self->_resetReason;
  v6[36] |= 0x2000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&v8 & 0x200) == 0) {
      goto LABEL_15;
    }
    goto LABEL_44;
  }
LABEL_43:
  v6[33] = self->_scanResultFound;
  v6[36] |= 0x20000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x200) == 0)
  {
LABEL_15:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  v6[22] = self->_knownNetworksFoundInScans;
  v6[36] |= 0x200u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_16:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  v6[23] = self->_lastScanError;
  v6[36] |= 0x400u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_17:
    if ((*(_WORD *)&v8 & 0x100) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  v6[32] = self->_rssiBitmap;
  v6[36] |= 0x10000u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_18:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  v6[21] = self->_ccaBitmap;
  v6[36] |= 0x100u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
LABEL_19:
    if ((*(unsigned char *)&v8 & 0x80) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  v6[19] = self->_bandScanCount24;
  v6[36] |= 0x40u;
  $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_21;
  }
LABEL_49:
  v6[20] = self->_bandScanCount5;
  v6[36] |= 0x80u;
  if ((*(_DWORD *)&self->_has & 0x1000) != 0)
  {
LABEL_21:
    v6[28] = self->_nwExclusionCount;
    v6[36] |= 0x1000u;
  }
LABEL_22:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
  uint64_t v10 = [(NSMutableArray *)networksExcludedFromAJDueToThresholds countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(networksExcludedFromAJDueToThresholds);
        }
        long long v14 = (void *)[*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [v6 addNetworksExcludedFromAJDueToThresholds:v14];
      }
      uint64_t v11 = [(NSMutableArray *)networksExcludedFromAJDueToThresholds countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v6[18] = self->_bandExclusionReason;
    v6[36] |= 0x20u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
    int v7 = *((_DWORD *)a3 + 36);
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_timestamp != *((void *)a3 + 7)) {
        goto LABEL_105;
      }
    }
    else if ((v7 & 8) != 0)
    {
LABEL_105:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_beganTimestamp != *((void *)a3 + 4)) {
        goto LABEL_105;
      }
    }
    else if (v7)
    {
      goto LABEL_105;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_endedTimestamp != *((void *)a3 + 5)) {
        goto LABEL_105;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_105;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_wakeTimestamp != *((void *)a3 + 8)) {
        goto LABEL_105;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_105;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_enteredKnownNetworkGeotagLocationTimeStamp != *((void *)a3 + 6)) {
        goto LABEL_105;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_DWORD *)&has & 0x80000) != 0)
    {
      if ((v7 & 0x80000) == 0 || self->_state != *((_DWORD *)a3 + 35)) {
        goto LABEL_105;
      }
    }
    else if ((v7 & 0x80000) != 0)
    {
      goto LABEL_105;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_retryIndex != *((_DWORD *)a3 + 31)) {
        goto LABEL_105;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_105;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
      int v9 = *((_DWORD *)a3 + 36);
      if ((*(_DWORD *)&v8 & 0x40000) != 0)
      {
        if ((v9 & 0x40000) == 0 || self->_scanTypes != *((_DWORD *)a3 + 34)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x40000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x800) != 0)
      {
        if ((v9 & 0x800) == 0 || self->_lastScanType != *((_DWORD *)a3 + 24)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x800) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x4000) != 0)
      {
        if ((v9 & 0x4000) == 0 || self->_resetTypes != *((_DWORD *)a3 + 30)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x4000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x2000) != 0)
      {
        if ((v9 & 0x2000) == 0 || self->_resetReason != *((_DWORD *)a3 + 29)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x2000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_DWORD *)&v8 & 0x20000) != 0)
      {
        if ((v9 & 0x20000) == 0 || self->_scanResultFound != *((_DWORD *)a3 + 33)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x20000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x200) != 0)
      {
        if ((v9 & 0x200) == 0 || self->_knownNetworksFoundInScans != *((_DWORD *)a3 + 22)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x200) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x400) != 0)
      {
        if ((v9 & 0x400) == 0 || self->_lastScanError != *((_DWORD *)a3 + 23)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x400) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_DWORD *)&v8 & 0x10000) != 0)
      {
        if ((v9 & 0x10000) == 0 || self->_rssiBitmap != *((_DWORD *)a3 + 32)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x10000) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x100) != 0)
      {
        if ((v9 & 0x100) == 0 || self->_ccaBitmap != *((_DWORD *)a3 + 21)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x100) != 0)
      {
        goto LABEL_105;
      }
      if ((*(unsigned char *)&v8 & 0x40) != 0)
      {
        if ((v9 & 0x40) == 0 || self->_bandScanCount24 != *((_DWORD *)a3 + 19)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x40) != 0)
      {
        goto LABEL_105;
      }
      if ((*(unsigned char *)&v8 & 0x80) != 0)
      {
        if ((v9 & 0x80) == 0 || self->_bandScanCount5 != *((_DWORD *)a3 + 20)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x80) != 0)
      {
        goto LABEL_105;
      }
      if ((*(_WORD *)&v8 & 0x1000) != 0)
      {
        if ((v9 & 0x1000) == 0 || self->_nwExclusionCount != *((_DWORD *)a3 + 28)) {
          goto LABEL_105;
        }
      }
      else if ((v9 & 0x1000) != 0)
      {
        goto LABEL_105;
      }
      networksExcludedFromAJDueToThresholds = self->_networksExcludedFromAJDueToThresholds;
      if ((unint64_t)networksExcludedFromAJDueToThresholds | *((void *)a3 + 13))
      {
        int IsEqual = -[NSMutableArray isEqual:](networksExcludedFromAJDueToThresholds, "isEqual:");
        if (!IsEqual) {
          return IsEqual;
        }
        $F9739C39B86B3C7E49387613BF7BBB27 v8 = self->_has;
      }
      int v11 = *((_DWORD *)a3 + 36);
      LOBYTE(IsEqual) = (v11 & 0x20) == 0;
      if ((*(unsigned char *)&v8 & 0x20) != 0)
      {
        if ((v11 & 0x20) == 0 || self->_bandExclusionReason != *((_DWORD *)a3 + 18)) {
          goto LABEL_105;
        }
        LOBYTE(IsEqual) = 1;
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  $F9739C39B86B3C7E49387613BF7BBB27 has = self->_has;
  if ((*(unsigned char *)&has & 8) != 0)
  {
    unint64_t v27 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&has)
    {
LABEL_3:
      unint64_t v26 = 2654435761u * self->_beganTimestamp;
      if ((*(unsigned char *)&has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    unint64_t v27 = 0;
    if (*(unsigned char *)&has) {
      goto LABEL_3;
    }
  }
  unint64_t v26 = 0;
  if ((*(unsigned char *)&has & 2) != 0)
  {
LABEL_4:
    unint64_t v25 = 2654435761u * self->_endedTimestamp;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  unint64_t v25 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_5:
    unint64_t v24 = 2654435761u * self->_wakeTimestamp;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v24 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_6:
    unint64_t v23 = 2654435761u * self->_enteredKnownNetworkGeotagLocationTimeStamp;
    if ((*(_DWORD *)&has & 0x80000) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v22 = 0;
    if ((*(_WORD *)&has & 0x8000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  unint64_t v23 = 0;
  if ((*(_DWORD *)&has & 0x80000) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v22 = 2654435761 * self->_state;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_8:
    uint64_t v21 = 2654435761 * self->_retryIndex;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v21 = 0;
LABEL_16:
  uint64_t v20 = PBRepeatedUInt32Hash();
  $F9739C39B86B3C7E49387613BF7BBB27 v4 = self->_has;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
    uint64_t v19 = 2654435761 * self->_scanTypes;
    if ((*(_WORD *)&v4 & 0x800) != 0)
    {
LABEL_18:
      uint64_t v18 = 2654435761 * self->_lastScanType;
      if ((*(_WORD *)&v4 & 0x4000) != 0) {
        goto LABEL_19;
      }
      goto LABEL_31;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_18;
    }
  }
  uint64_t v18 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_19:
    uint64_t v17 = 2654435761 * self->_resetTypes;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_20;
    }
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v17 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_20:
    uint64_t v16 = 2654435761 * self->_resetReason;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_21;
    }
    goto LABEL_33;
  }
LABEL_32:
  uint64_t v16 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_21:
    uint64_t v15 = 2654435761 * self->_scanResultFound;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_22;
    }
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v15 = 0;
  if ((*(_WORD *)&v4 & 0x200) != 0)
  {
LABEL_22:
    uint64_t v5 = 2654435761 * self->_knownNetworksFoundInScans;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_23;
    }
    goto LABEL_35;
  }
LABEL_34:
  uint64_t v5 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_23:
    uint64_t v6 = 2654435761 * self->_lastScanError;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_36;
  }
LABEL_35:
  uint64_t v6 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_24:
    uint64_t v7 = 2654435761 * self->_rssiBitmap;
    if ((*(_WORD *)&v4 & 0x100) != 0) {
      goto LABEL_25;
    }
    goto LABEL_37;
  }
LABEL_36:
  uint64_t v7 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_25:
    uint64_t v8 = 2654435761 * self->_ccaBitmap;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_26;
    }
    goto LABEL_38;
  }
LABEL_37:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_26:
    uint64_t v9 = 2654435761 * self->_bandScanCount24;
    if ((*(unsigned char *)&v4 & 0x80) != 0) {
      goto LABEL_27;
    }
LABEL_39:
    uint64_t v10 = 0;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_40;
  }
LABEL_38:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&v4 & 0x80) == 0) {
    goto LABEL_39;
  }
LABEL_27:
  uint64_t v10 = 2654435761 * self->_bandScanCount5;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_28:
    uint64_t v11 = 2654435761 * self->_nwExclusionCount;
    goto LABEL_41;
  }
LABEL_40:
  uint64_t v11 = 0;
LABEL_41:
  uint64_t v12 = [(NSMutableArray *)self->_networksExcludedFromAJDueToThresholds hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v13 = 2654435761 * self->_bandExclusionReason;
  }
  else {
    uint64_t v13 = 0;
  }
  return v26 ^ v27 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v20 ^ v15 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  int v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 7);
    *(_DWORD *)&self->_has |= 8u;
    int v5 = *((_DWORD *)a3 + 36);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_37;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_beganTimestamp = *((void *)a3 + 4);
  *(_DWORD *)&self->_has |= 1u;
  int v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_endedTimestamp = *((void *)a3 + 5);
  *(_DWORD *)&self->_has |= 2u;
  int v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_wakeTimestamp = *((void *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_enteredKnownNetworkGeotagLocationTimeStamp = *((void *)a3 + 6);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 36);
  if ((v5 & 0x80000) == 0)
  {
LABEL_7:
    if ((v5 & 0x8000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_40:
  self->_state = *((_DWORD *)a3 + 35);
  *(_DWORD *)&self->_has |= 0x80000u;
  if ((*((_DWORD *)a3 + 36) & 0x8000) != 0)
  {
LABEL_8:
    self->_retryIndex = *((_DWORD *)a3 + 31);
    *(_DWORD *)&self->_has |= 0x8000u;
  }
LABEL_9:
  uint64_t v6 = [a3 scannedNetworksExcludedFromAJDueToBlacklistReasonCountsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDWiFiMetricsManagerAutoJoinRecord addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:](self, "addScannedNetworksExcludedFromAJDueToBlacklistReasonCounts:", [a3 scannedNetworksExcludedFromAJDueToBlacklistReasonCountsAtIndex:i]);
  }
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x40000) != 0)
  {
    self->_scanTypes = *((_DWORD *)a3 + 34);
    *(_DWORD *)&self->_has |= 0x40000u;
    int v9 = *((_DWORD *)a3 + 36);
    if ((v9 & 0x800) == 0)
    {
LABEL_14:
      if ((v9 & 0x4000) == 0) {
        goto LABEL_15;
      }
      goto LABEL_44;
    }
  }
  else if ((v9 & 0x800) == 0)
  {
    goto LABEL_14;
  }
  self->_lastScanType = *((_DWORD *)a3 + 24);
  *(_DWORD *)&self->_has |= 0x800u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x4000) == 0)
  {
LABEL_15:
    if ((v9 & 0x2000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_45;
  }
LABEL_44:
  self->_resetTypes = *((_DWORD *)a3 + 30);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x2000) == 0)
  {
LABEL_16:
    if ((v9 & 0x20000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_46;
  }
LABEL_45:
  self->_resetReason = *((_DWORD *)a3 + 29);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x20000) == 0)
  {
LABEL_17:
    if ((v9 & 0x200) == 0) {
      goto LABEL_18;
    }
    goto LABEL_47;
  }
LABEL_46:
  self->_scanResultFound = *((_DWORD *)a3 + 33);
  *(_DWORD *)&self->_has |= 0x20000u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x200) == 0)
  {
LABEL_18:
    if ((v9 & 0x400) == 0) {
      goto LABEL_19;
    }
    goto LABEL_48;
  }
LABEL_47:
  self->_knownNetworksFoundInScans = *((_DWORD *)a3 + 22);
  *(_DWORD *)&self->_has |= 0x200u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x400) == 0)
  {
LABEL_19:
    if ((v9 & 0x10000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_49;
  }
LABEL_48:
  self->_lastScanError = *((_DWORD *)a3 + 23);
  *(_DWORD *)&self->_has |= 0x400u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x10000) == 0)
  {
LABEL_20:
    if ((v9 & 0x100) == 0) {
      goto LABEL_21;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_rssiBitmap = *((_DWORD *)a3 + 32);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x100) == 0)
  {
LABEL_21:
    if ((v9 & 0x40) == 0) {
      goto LABEL_22;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_ccaBitmap = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x100u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x40) == 0)
  {
LABEL_22:
    if ((v9 & 0x80) == 0) {
      goto LABEL_23;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_bandScanCount24 = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x40u;
  int v9 = *((_DWORD *)a3 + 36);
  if ((v9 & 0x80) == 0)
  {
LABEL_23:
    if ((v9 & 0x1000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
LABEL_52:
  self->_bandScanCount5 = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x80u;
  if ((*((_DWORD *)a3 + 36) & 0x1000) != 0)
  {
LABEL_24:
    self->_nwExclusionCount = *((_DWORD *)a3 + 28);
    *(_DWORD *)&self->_has |= 0x1000u;
  }
LABEL_25:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v10 = (void *)*((void *)a3 + 13);
  uint64_t v11 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDWiFiMetricsManagerAutoJoinRecord *)self addNetworksExcludedFromAJDueToThresholds:*(void *)(*((void *)&v15 + 1) + 8 * j)];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v12);
  }
  if ((*((unsigned char *)a3 + 144) & 0x20) != 0)
  {
    self->_bandExclusionReason = *((_DWORD *)a3 + 18);
    *(_DWORD *)&self->_has |= 0x20u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)beganTimestamp
{
  return self->_beganTimestamp;
}

- (unint64_t)endedTimestamp
{
  return self->_endedTimestamp;
}

- (unint64_t)wakeTimestamp
{
  return self->_wakeTimestamp;
}

- (unint64_t)enteredKnownNetworkGeotagLocationTimeStamp
{
  return self->_enteredKnownNetworkGeotagLocationTimeStamp;
}

- (unsigned)state
{
  return self->_state;
}

- (unsigned)retryIndex
{
  return self->_retryIndex;
}

- (unsigned)scanTypes
{
  return self->_scanTypes;
}

- (unsigned)lastScanType
{
  return self->_lastScanType;
}

- (unsigned)resetTypes
{
  return self->_resetTypes;
}

- (unsigned)resetReason
{
  return self->_resetReason;
}

- (unsigned)scanResultFound
{
  return self->_scanResultFound;
}

- (unsigned)knownNetworksFoundInScans
{
  return self->_knownNetworksFoundInScans;
}

- (unsigned)lastScanError
{
  return self->_lastScanError;
}

- (unsigned)rssiBitmap
{
  return self->_rssiBitmap;
}

- (unsigned)ccaBitmap
{
  return self->_ccaBitmap;
}

- (unsigned)bandScanCount24
{
  return self->_bandScanCount24;
}

- (unsigned)bandScanCount5
{
  return self->_bandScanCount5;
}

- (unsigned)nwExclusionCount
{
  return self->_nwExclusionCount;
}

- (NSMutableArray)networksExcludedFromAJDueToThresholds
{
  return self->_networksExcludedFromAJDueToThresholds;
}

- (void)setNetworksExcludedFromAJDueToThresholds:(id)a3
{
}

- (unsigned)bandExclusionReason
{
  return self->_bandExclusionReason;
}

@end