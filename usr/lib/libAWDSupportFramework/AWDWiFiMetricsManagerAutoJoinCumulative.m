@interface AWDWiFiMetricsManagerAutoJoinCumulative
- (BOOL)hasAjScansPerformedWithLocation;
- (BOOL)hasAjScansPerformedWithoutLocation;
- (BOOL)hasBandScanCount24;
- (BOOL)hasBandScanCount5;
- (BOOL)hasCcaBitmap;
- (BOOL)hasDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
- (BOOL)hasRssiBitmap;
- (BOOL)hasTimestamp;
- (BOOL)hasUserChoseToAssociateToAJBlacklistedCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)excludedDueToAJBlacklistCountsCount;
- (unint64_t)hash;
- (unint64_t)scanTypesCountsCount;
- (unint64_t)timestamp;
- (unsigned)ajScansPerformedWithLocation;
- (unsigned)ajScansPerformedWithoutLocation;
- (unsigned)bandScanCount24;
- (unsigned)bandScanCount5;
- (unsigned)ccaBitmap;
- (unsigned)didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
- (unsigned)excludedDueToAJBlacklistCountAtIndex:(unint64_t)a3;
- (unsigned)excludedDueToAJBlacklistCounts;
- (unsigned)rssiBitmap;
- (unsigned)scanTypesCountAtIndex:(unint64_t)a3;
- (unsigned)scanTypesCounts;
- (unsigned)userChoseToAssociateToAJBlacklistedCount;
- (void)addExcludedDueToAJBlacklistCount:(unsigned int)a3;
- (void)addScanTypesCount:(unsigned int)a3;
- (void)clearExcludedDueToAJBlacklistCounts;
- (void)clearScanTypesCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAjScansPerformedWithLocation:(unsigned int)a3;
- (void)setAjScansPerformedWithoutLocation:(unsigned int)a3;
- (void)setBandScanCount24:(unsigned int)a3;
- (void)setBandScanCount5:(unsigned int)a3;
- (void)setCcaBitmap:(unsigned int)a3;
- (void)setDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount:(unsigned int)a3;
- (void)setExcludedDueToAJBlacklistCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasAjScansPerformedWithLocation:(BOOL)a3;
- (void)setHasAjScansPerformedWithoutLocation:(BOOL)a3;
- (void)setHasBandScanCount24:(BOOL)a3;
- (void)setHasBandScanCount5:(BOOL)a3;
- (void)setHasCcaBitmap:(BOOL)a3;
- (void)setHasDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount:(BOOL)a3;
- (void)setHasRssiBitmap:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasUserChoseToAssociateToAJBlacklistedCount:(BOOL)a3;
- (void)setRssiBitmap:(unsigned int)a3;
- (void)setScanTypesCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)setUserChoseToAssociateToAJBlacklistedCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerAutoJoinCumulative

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinCumulative;
  [(AWDWiFiMetricsManagerAutoJoinCumulative *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (unint64_t)scanTypesCountsCount
{
  return self->_scanTypesCounts.count;
}

- (unsigned)scanTypesCounts
{
  return self->_scanTypesCounts.list;
}

- (void)clearScanTypesCounts
{
}

- (void)addScanTypesCount:(unsigned int)a3
{
}

- (unsigned)scanTypesCountAtIndex:(unint64_t)a3
{
  p_scanTypesCounts = &self->_scanTypesCounts;
  unint64_t count = self->_scanTypesCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_scanTypesCounts->list[a3];
}

- (void)setScanTypesCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)excludedDueToAJBlacklistCountsCount
{
  return self->_excludedDueToAJBlacklistCounts.count;
}

- (unsigned)excludedDueToAJBlacklistCounts
{
  return self->_excludedDueToAJBlacklistCounts.list;
}

- (void)clearExcludedDueToAJBlacklistCounts
{
}

- (void)addExcludedDueToAJBlacklistCount:(unsigned int)a3
{
}

- (unsigned)excludedDueToAJBlacklistCountAtIndex:(unint64_t)a3
{
  p_excludedDueToAJBlacklistCounts = &self->_excludedDueToAJBlacklistCounts;
  unint64_t count = self->_excludedDueToAJBlacklistCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_excludedDueToAJBlacklistCounts->list[a3];
}

- (void)setExcludedDueToAJBlacklistCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setUserChoseToAssociateToAJBlacklistedCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_userChoseToAssociateToAJBlacklistedCount = a3;
}

- (void)setHasUserChoseToAssociateToAJBlacklistedCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasUserChoseToAssociateToAJBlacklistedCount
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setAjScansPerformedWithLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_ajScansPerformedWithLocation = a3;
}

- (void)setHasAjScansPerformedWithLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAjScansPerformedWithLocation
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setAjScansPerformedWithoutLocation:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ajScansPerformedWithoutLocation = a3;
}

- (void)setHasAjScansPerformedWithoutLocation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasAjScansPerformedWithoutLocation
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount = a3;
}

- (void)setHasDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasDidAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setRssiBitmap:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_rssiBitmap = a3;
}

- (void)setHasRssiBitmap:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasRssiBitmap
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setCcaBitmap:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_ccaBitmap = a3;
}

- (void)setHasCcaBitmap:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasCcaBitmap
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setBandScanCount24:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_bandScanCount24 = a3;
}

- (void)setHasBandScanCount24:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBandScanCount24
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setBandScanCount5:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_bandScanCount5 = a3;
}

- (void)setHasBandScanCount5:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBandScanCount5
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerAutoJoinCumulative;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerAutoJoinCumulative description](&v3, sel_description), -[AWDWiFiMetricsManagerAutoJoinCumulative dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(_WORD *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"scanTypesCount"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"excludedDueToAJBlacklistCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_userChoseToAssociateToAJBlacklistedCount] forKey:@"userChoseToAssociateToAJBlacklistedCount"];
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ajScansPerformedWithLocation] forKey:@"ajScansPerformedWithLocation"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ajScansPerformedWithoutLocation] forKey:@"ajScansPerformedWithoutLocation"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount] forKey:@"didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rssiBitmap] forKey:@"rssiBitmap"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_19:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bandScanCount24] forKey:@"bandScanCount24"];
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return v3;
    }
    goto LABEL_11;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaBitmap] forKey:@"ccaBitmap"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if ((has & 0x10) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_bandScanCount5] forKey:@"bandScanCount5"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerAutoJoinCumulativeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(_WORD *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_scanTypesCounts.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_scanTypesCounts.count);
  }
  if (self->_excludedDueToAJBlacklistCounts.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_excludedDueToAJBlacklistCounts.count);
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_11:
      if ((has & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_12:
    if ((has & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_13:
    if ((has & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 8) == 0) {
      goto LABEL_16;
    }
LABEL_24:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return;
    }
    goto LABEL_25;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_24;
  }
LABEL_16:
  if ((has & 0x10) == 0) {
    return;
  }
LABEL_25:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  if (*(_WORD *)&self->_has)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((_WORD *)a3 + 48) |= 1u;
  }
  if ([(AWDWiFiMetricsManagerAutoJoinCumulative *)self scanTypesCountsCount])
  {
    [a3 clearScanTypesCounts];
    unint64_t v5 = [(AWDWiFiMetricsManagerAutoJoinCumulative *)self scanTypesCountsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addScanTypesCount:-[AWDWiFiMetricsManagerAutoJoinCumulative scanTypesCountAtIndex:](self, "scanTypesCountAtIndex:", i)];
    }
  }
  if ([(AWDWiFiMetricsManagerAutoJoinCumulative *)self excludedDueToAJBlacklistCountsCount])
  {
    [a3 clearExcludedDueToAJBlacklistCounts];
    unint64_t v8 = [(AWDWiFiMetricsManagerAutoJoinCumulative *)self excludedDueToAJBlacklistCountsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addExcludedDueToAJBlacklistCount:-[AWDWiFiMetricsManagerAutoJoinCumulative excludedDueToAJBlacklistCountAtIndex:](self, "excludedDueToAJBlacklistCountAtIndex:", j)];
    }
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *((_DWORD *)a3 + 23) = self->_userChoseToAssociateToAJBlacklistedCount;
    *((_WORD *)a3 + 48) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_13:
      if ((has & 4) == 0) {
        goto LABEL_14;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_13;
  }
  *((_DWORD *)a3 + 16) = self->_ajScansPerformedWithLocation;
  *((_WORD *)a3 + 48) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_14:
    if ((has & 0x40) == 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 17) = self->_ajScansPerformedWithoutLocation;
  *((_WORD *)a3 + 48) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_15:
    if ((has & 0x80) == 0) {
      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 21) = self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
  *((_WORD *)a3 + 48) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_16:
    if ((has & 0x20) == 0) {
      goto LABEL_17;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 22) = self->_rssiBitmap;
  *((_WORD *)a3 + 48) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_17:
    if ((has & 8) == 0) {
      goto LABEL_18;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 20) = self->_ccaBitmap;
  *((_WORD *)a3 + 48) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_18:
    if ((has & 0x10) == 0) {
      return;
    }
    goto LABEL_19;
  }
LABEL_27:
  *((_DWORD *)a3 + 18) = self->_bandScanCount24;
  *((_WORD *)a3 + 48) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) == 0) {
    return;
  }
LABEL_19:
  *((_DWORD *)a3 + 19) = self->_bandScanCount5;
  *((_WORD *)a3 + 48) |= 0x10u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  if (*(_WORD *)&self->_has)
  {
    *(void *)(v4 + 56) = self->_timestamp;
    *(_WORD *)(v4 + 96) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 92) = self->_userChoseToAssociateToAJBlacklistedCount;
    *(_WORD *)(v5 + 96) |= 0x100u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_15;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_5;
  }
  *(_DWORD *)(v5 + 64) = self->_ajScansPerformedWithLocation;
  *(_WORD *)(v5 + 96) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(_DWORD *)(v5 + 68) = self->_ajScansPerformedWithoutLocation;
  *(_WORD *)(v5 + 96) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(_DWORD *)(v5 + 84) = self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
  *(_WORD *)(v5 + 96) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_18;
  }
LABEL_17:
  *(_DWORD *)(v5 + 88) = self->_rssiBitmap;
  *(_WORD *)(v5 + 96) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_19:
    *(_DWORD *)(v5 + 72) = self->_bandScanCount24;
    *(_WORD *)(v5 + 96) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      return (id)v5;
    }
    goto LABEL_11;
  }
LABEL_18:
  *(_DWORD *)(v5 + 80) = self->_ccaBitmap;
  *(_WORD *)(v5 + 96) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 76) = self->_bandScanCount5;
    *(_WORD *)(v5 + 96) |= 0x10u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    __int16 v6 = *((_WORD *)a3 + 48);
    if (*(_WORD *)&self->_has)
    {
      if ((v6 & 1) == 0 || self->_timestamp != *((void *)a3 + 7)) {
        goto LABEL_48;
      }
    }
    else if (v6)
    {
LABEL_48:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    int IsEqual = PBRepeatedUInt32IsEqual();
    if (IsEqual)
    {
      int IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        __int16 has = (__int16)self->_has;
        __int16 v8 = *((_WORD *)a3 + 48);
        if ((has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 48) & 0x100) == 0
            || self->_userChoseToAssociateToAJBlacklistedCount != *((_DWORD *)a3 + 23))
          {
            goto LABEL_48;
          }
        }
        else if ((*((_WORD *)a3 + 48) & 0x100) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 2) != 0)
        {
          if ((v8 & 2) == 0 || self->_ajScansPerformedWithLocation != *((_DWORD *)a3 + 16)) {
            goto LABEL_48;
          }
        }
        else if ((v8 & 2) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 4) != 0)
        {
          if ((v8 & 4) == 0 || self->_ajScansPerformedWithoutLocation != *((_DWORD *)a3 + 17)) {
            goto LABEL_48;
          }
        }
        else if ((v8 & 4) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 0x40) != 0)
        {
          if ((v8 & 0x40) == 0 || self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount != *((_DWORD *)a3 + 21)) {
            goto LABEL_48;
          }
        }
        else if ((v8 & 0x40) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 0x80) != 0)
        {
          if ((v8 & 0x80) == 0 || self->_rssiBitmap != *((_DWORD *)a3 + 22)) {
            goto LABEL_48;
          }
        }
        else if ((v8 & 0x80) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 0x20) != 0)
        {
          if ((v8 & 0x20) == 0 || self->_ccaBitmap != *((_DWORD *)a3 + 20)) {
            goto LABEL_48;
          }
        }
        else if ((v8 & 0x20) != 0)
        {
          goto LABEL_48;
        }
        if ((has & 8) != 0)
        {
          if ((v8 & 8) == 0 || self->_bandScanCount24 != *((_DWORD *)a3 + 18)) {
            goto LABEL_48;
          }
        }
        else if ((v8 & 8) != 0)
        {
          goto LABEL_48;
        }
        LOBYTE(IsEqual) = (v8 & 0x10) == 0;
        if ((has & 0x10) != 0)
        {
          if ((v8 & 0x10) == 0 || self->_bandScanCount5 != *((_DWORD *)a3 + 19)) {
            goto LABEL_48;
          }
          LOBYTE(IsEqual) = 1;
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if (*(_WORD *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = PBRepeatedUInt32Hash();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) != 0)
  {
    uint64_t v7 = 2654435761 * self->_userChoseToAssociateToAJBlacklistedCount;
    if ((has & 2) != 0)
    {
LABEL_6:
      uint64_t v8 = 2654435761 * self->_ajScansPerformedWithLocation;
      if ((has & 4) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((has & 2) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v8 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v9 = 2654435761 * self->_ajScansPerformedWithoutLocation;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v10 = 2654435761 * self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v10 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_9:
    uint64_t v11 = 2654435761 * self->_rssiBitmap;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v11 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    uint64_t v12 = 2654435761 * self->_ccaBitmap;
    if ((has & 8) != 0) {
      goto LABEL_11;
    }
LABEL_19:
    uint64_t v13 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_12;
    }
LABEL_20:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
  }
LABEL_18:
  uint64_t v12 = 0;
  if ((has & 8) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  uint64_t v13 = 2654435761 * self->_bandScanCount24;
  if ((has & 0x10) == 0) {
    goto LABEL_20;
  }
LABEL_12:
  uint64_t v14 = 2654435761 * self->_bandScanCount5;
  return v4 ^ v3 ^ v5 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  if (*((_WORD *)a3 + 48))
  {
    self->_timestamp = *((void *)a3 + 7);
    *(_WORD *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 scanTypesCountsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetricsManagerAutoJoinCumulative addScanTypesCount:](self, "addScanTypesCount:", [a3 scanTypesCountAtIndex:i]);
  }
  uint64_t v8 = [a3 excludedDueToAJBlacklistCountsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWiFiMetricsManagerAutoJoinCumulative addExcludedDueToAJBlacklistCount:](self, "addExcludedDueToAJBlacklistCount:", [a3 excludedDueToAJBlacklistCountAtIndex:j]);
  }
  __int16 v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x100) != 0)
  {
    self->_userChoseToAssociateToAJBlacklistedCount = *((_DWORD *)a3 + 23);
    *(_WORD *)&self->_has |= 0x100u;
    __int16 v11 = *((_WORD *)a3 + 48);
    if ((v11 & 2) == 0)
    {
LABEL_11:
      if ((v11 & 4) == 0) {
        goto LABEL_12;
      }
      goto LABEL_21;
    }
  }
  else if ((v11 & 2) == 0)
  {
    goto LABEL_11;
  }
  self->_ajScansPerformedWithLocation = *((_DWORD *)a3 + 16);
  *(_WORD *)&self->_has |= 2u;
  __int16 v11 = *((_WORD *)a3 + 48);
  if ((v11 & 4) == 0)
  {
LABEL_12:
    if ((v11 & 0x40) == 0) {
      goto LABEL_13;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_ajScansPerformedWithoutLocation = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 4u;
  __int16 v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x40) == 0)
  {
LABEL_13:
    if ((v11 & 0x80) == 0) {
      goto LABEL_14;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount = *((_DWORD *)a3 + 21);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x80) == 0)
  {
LABEL_14:
    if ((v11 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_rssiBitmap = *((_DWORD *)a3 + 22);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v11 = *((_WORD *)a3 + 48);
  if ((v11 & 0x20) == 0)
  {
LABEL_15:
    if ((v11 & 8) == 0) {
      goto LABEL_16;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_ccaBitmap = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v11 = *((_WORD *)a3 + 48);
  if ((v11 & 8) == 0)
  {
LABEL_16:
    if ((v11 & 0x10) == 0) {
      return;
    }
    goto LABEL_17;
  }
LABEL_25:
  self->_bandScanCount24 = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 48) & 0x10) == 0) {
    return;
  }
LABEL_17:
  self->_bandScanCount5 = *((_DWORD *)a3 + 19);
  *(_WORD *)&self->_has |= 0x10u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)userChoseToAssociateToAJBlacklistedCount
{
  return self->_userChoseToAssociateToAJBlacklistedCount;
}

- (unsigned)ajScansPerformedWithLocation
{
  return self->_ajScansPerformedWithLocation;
}

- (unsigned)ajScansPerformedWithoutLocation
{
  return self->_ajScansPerformedWithoutLocation;
}

- (unsigned)didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount
{
  return self->_didAssocTo5GHzAfterBroadcastPeriodicAllBandScanCount;
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

@end