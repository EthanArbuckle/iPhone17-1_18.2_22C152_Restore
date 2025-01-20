@interface NTPBScoreProfileDebug
- (BOOL)hasAudioMultiplier;
- (BOOL)hasBundleFreeMultiplier;
- (BOOL)hasBundlePaidMultiplier;
- (BOOL)hasEvergreenMultiplier;
- (BOOL)hasFeaturedMultiplier;
- (BOOL)hasGroupingReason;
- (BOOL)hasListenedPenalty;
- (BOOL)hasMultiplierDampener;
- (BOOL)hasMutedVoteDampener;
- (BOOL)hasReadPenalty;
- (BOOL)hasScoringAssetsIdentifier;
- (BOOL)hasScoringContext;
- (BOOL)hasScoringType;
- (BOOL)hasSeenPenalty;
- (BOOL)hasSparseTagsPenalty;
- (BOOL)hasTimeDecayPenalty;
- (BOOL)hasUserConversionScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)scoringAssetsIdentifier;
- (double)audioMultiplier;
- (double)bundleFreeMultiplier;
- (double)bundlePaidMultiplier;
- (double)evergreenMultiplier;
- (double)featuredMultiplier;
- (double)listenedPenalty;
- (double)multiplierDampener;
- (double)mutedVoteDampener;
- (double)readPenalty;
- (double)seenPenalty;
- (double)sparseTagsPenalty;
- (double)timeDecayPenalty;
- (double)userConversionScore;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)groupingReason;
- (int64_t)scoringContext;
- (int64_t)scoringType;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAudioMultiplier:(double)a3;
- (void)setBundleFreeMultiplier:(double)a3;
- (void)setBundlePaidMultiplier:(double)a3;
- (void)setEvergreenMultiplier:(double)a3;
- (void)setFeaturedMultiplier:(double)a3;
- (void)setGroupingReason:(int64_t)a3;
- (void)setHasAudioMultiplier:(BOOL)a3;
- (void)setHasBundleFreeMultiplier:(BOOL)a3;
- (void)setHasBundlePaidMultiplier:(BOOL)a3;
- (void)setHasEvergreenMultiplier:(BOOL)a3;
- (void)setHasFeaturedMultiplier:(BOOL)a3;
- (void)setHasGroupingReason:(BOOL)a3;
- (void)setHasListenedPenalty:(BOOL)a3;
- (void)setHasMultiplierDampener:(BOOL)a3;
- (void)setHasMutedVoteDampener:(BOOL)a3;
- (void)setHasReadPenalty:(BOOL)a3;
- (void)setHasScoringContext:(BOOL)a3;
- (void)setHasScoringType:(BOOL)a3;
- (void)setHasSeenPenalty:(BOOL)a3;
- (void)setHasSparseTagsPenalty:(BOOL)a3;
- (void)setHasTimeDecayPenalty:(BOOL)a3;
- (void)setHasUserConversionScore:(BOOL)a3;
- (void)setListenedPenalty:(double)a3;
- (void)setMultiplierDampener:(double)a3;
- (void)setMutedVoteDampener:(double)a3;
- (void)setReadPenalty:(double)a3;
- (void)setScoringAssetsIdentifier:(id)a3;
- (void)setScoringContext:(int64_t)a3;
- (void)setScoringType:(int64_t)a3;
- (void)setSeenPenalty:(double)a3;
- (void)setSparseTagsPenalty:(double)a3;
- (void)setTimeDecayPenalty:(double)a3;
- (void)setUserConversionScore:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBScoreProfileDebug

- (void)dealloc
{
  [(NTPBScoreProfileDebug *)self setScoringAssetsIdentifier:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfileDebug;
  [(NTPBScoreProfileDebug *)&v3 dealloc];
}

- (void)setUserConversionScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x8000u;
  self->_userConversionScore = a3;
}

- (void)setHasUserConversionScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x8000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = v3 & 0x8000 | *(_WORD *)&self->_has & 0x7FFF;
}

- (BOOL)hasUserConversionScore
{
  return *(_WORD *)&self->_has >> 15;
}

- (void)setBundlePaidMultiplier:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_bundlePaidMultiplier = a3;
}

- (void)setHasBundlePaidMultiplier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBundlePaidMultiplier
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setBundleFreeMultiplier:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_bundleFreeMultiplier = a3;
}

- (void)setHasBundleFreeMultiplier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasBundleFreeMultiplier
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setFeaturedMultiplier:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_featuredMultiplier = a3;
}

- (void)setHasFeaturedMultiplier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasFeaturedMultiplier
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setAudioMultiplier:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_audioMultiplier = a3;
}

- (void)setHasAudioMultiplier:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasAudioMultiplier
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setEvergreenMultiplier:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_evergreenMultiplier = a3;
}

- (void)setHasEvergreenMultiplier:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasEvergreenMultiplier
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setSeenPenalty:(double)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_seenPenalty = a3;
}

- (void)setHasSeenPenalty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasSeenPenalty
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setReadPenalty:(double)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_readPenalty = a3;
}

- (void)setHasReadPenalty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasReadPenalty
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setSparseTagsPenalty:(double)a3
{
  *(_WORD *)&self->_has |= 0x2000u;
  self->_sparseTagsPenalty = a3;
}

- (void)setHasSparseTagsPenalty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x2000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xDFFF | v3;
}

- (BOOL)hasSparseTagsPenalty
{
  return (*(_WORD *)&self->_has >> 13) & 1;
}

- (void)setTimeDecayPenalty:(double)a3
{
  *(_WORD *)&self->_has |= 0x4000u;
  self->_timeDecayPenalty = a3;
}

- (void)setHasTimeDecayPenalty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 0x4000;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xBFFF | v3;
}

- (BOOL)hasTimeDecayPenalty
{
  return (*(_WORD *)&self->_has >> 14) & 1;
}

- (void)setMultiplierDampener:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_multiplierDampener = a3;
}

- (void)setHasMultiplierDampener:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasMultiplierDampener
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setMutedVoteDampener:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mutedVoteDampener = a3;
}

- (void)setHasMutedVoteDampener:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMutedVoteDampener
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setScoringType:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_scoringType = a3;
}

- (void)setHasScoringType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasScoringType
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setGroupingReason:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_groupingReason = a3;
}

- (void)setHasGroupingReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasGroupingReason
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setScoringContext:(int64_t)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_scoringContext = a3;
}

- (void)setHasScoringContext:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasScoringContext
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setListenedPenalty:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_listenedPenalty = a3;
}

- (void)setHasListenedPenalty:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasListenedPenalty
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (BOOL)hasScoringAssetsIdentifier
{
  return self->_scoringAssetsIdentifier != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBScoreProfileDebug;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBScoreProfileDebug description](&v3, sel_description), -[NTPBScoreProfileDebug dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has < 0)
  {
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_userConversionScore), @"userConversionScore");
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_bundlePaidMultiplier), @"bundlePaidMultiplier");
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_bundleFreeMultiplier), @"bundleFreeMultiplier");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_featuredMultiplier), @"featuredMultiplier");
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_audioMultiplier), @"audioMultiplier");
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_evergreenMultiplier), @"evergreenMultiplier");
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_seenPenalty), @"seenPenalty");
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_readPenalty), @"readPenalty");
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_sparseTagsPenalty), @"sparseTagsPenalty");
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_30:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_timeDecayPenalty), @"timeDecayPenalty");
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_multiplierDampener), @"multiplierDampener");
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_mutedVoteDampener), @"mutedVoteDampener");
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_scoringType), @"scoring_type");
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_groupingReason), @"grouping_reason");
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_16:
    if ((has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithLongLong:", self->_scoringContext), @"scoring_context");
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_17:
  }
    objc_msgSend(v3, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_listenedPenalty), @"listenedPenalty");
LABEL_18:
  scoringAssetsIdentifier = self->_scoringAssetsIdentifier;
  if (scoringAssetsIdentifier) {
    [v3 setObject:scoringAssetsIdentifier forKey:@"scoringAssetsIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBScoreProfileDebugReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_3:
    PBDataWriterWriteDoubleField();
    *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  }
LABEL_4:
  if ((*(unsigned char *)&has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
    if ((*(unsigned char *)&has & 0x10) == 0)
    {
LABEL_6:
      if ((*(unsigned char *)&has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&has & 0x10) == 0)
  {
    goto LABEL_6;
  }
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(unsigned char *)&has & 1) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x200) == 0)
  {
LABEL_10:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x4000) == 0)
  {
LABEL_12:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_13:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_14:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteDoubleField();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt64Field();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteInt64Field();
  *(_WORD *)&$5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
  if ((*(_WORD *)&has & 0x400) == 0)
  {
LABEL_17:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_35:
  PBDataWriterWriteInt64Field();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_18:
  }
    PBDataWriterWriteDoubleField();
LABEL_19:
  if (self->_scoringAssetsIdentifier)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  __int16 has = (__int16)self->_has;
  if (has < 0)
  {
    *(double *)(v5 + 128) = self->_userConversionScore;
    *(_WORD *)(v5 + 144) |= 0x8000u;
    __int16 has = (__int16)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_bundlePaidMultiplier;
  *(_WORD *)(v5 + 144) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *(double *)(v5 + 16) = self->_bundleFreeMultiplier;
  *(_WORD *)(v5 + 144) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *(double *)(v5 + 40) = self->_featuredMultiplier;
  *(_WORD *)(v5 + 144) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(double *)(v5 + 8) = self->_audioMultiplier;
  *(_WORD *)(v5 + 144) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_7:
    if ((has & 0x1000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(double *)(v5 + 32) = self->_evergreenMultiplier;
  *(_WORD *)(v5 + 144) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(double *)(v5 + 104) = self->_seenPenalty;
  *(_WORD *)(v5 + 144) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 0x2000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(double *)(v5 + 80) = self->_readPenalty;
  *(_WORD *)(v5 + 144) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x2000) == 0)
  {
LABEL_10:
    if ((has & 0x4000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(double *)(v5 + 112) = self->_sparseTagsPenalty;
  *(_WORD *)(v5 + 144) |= 0x2000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x4000) == 0)
  {
LABEL_11:
    if ((has & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(double *)(v5 + 120) = self->_timeDecayPenalty;
  *(_WORD *)(v5 + 144) |= 0x4000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_12:
    if ((has & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(double *)(v5 + 64) = self->_multiplierDampener;
  *(_WORD *)(v5 + 144) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_13:
    if ((has & 0x800) == 0) {
      goto LABEL_14;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(double *)(v5 + 72) = self->_mutedVoteDampener;
  *(_WORD *)(v5 + 144) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_14:
    if ((has & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v5 + 96) = self->_scoringType;
  *(_WORD *)(v5 + 144) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_15:
    if ((has & 0x400) == 0) {
      goto LABEL_16;
    }
LABEL_33:
    *(void *)(v5 + 88) = self->_scoringContext;
    *(_WORD *)(v5 + 144) |= 0x400u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_32:
  *(void *)(v5 + 48) = self->_groupingReason;
  *(_WORD *)(v5 + 144) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) != 0) {
    goto LABEL_33;
  }
LABEL_16:
  if ((has & 0x40) != 0)
  {
LABEL_17:
    *(double *)(v5 + 56) = self->_listenedPenalty;
    *(_WORD *)(v5 + 144) |= 0x40u;
  }
LABEL_18:

  v6[17] = [(NSString *)self->_scoringAssetsIdentifier copyWithZone:a3];
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $5E1402458F4F2AA2E07294A3B0AC2E0F has = self->_has;
    __int16 v7 = *((_WORD *)a3 + 72);
    if ((*(_DWORD *)&has & 0x80000000) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x8000) == 0 || self->_userConversionScore != *((double *)a3 + 16)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x8000) != 0)
    {
LABEL_84:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_bundlePaidMultiplier != *((double *)a3 + 3)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_84;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_bundleFreeMultiplier != *((double *)a3 + 2)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_84;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_featuredMultiplier != *((double *)a3 + 5)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_84;
    }
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_audioMultiplier != *((double *)a3 + 1)) {
        goto LABEL_84;
      }
    }
    else if (v7)
    {
      goto LABEL_84;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_evergreenMultiplier != *((double *)a3 + 4)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x1000) == 0 || self->_seenPenalty != *((double *)a3 + 13)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x1000) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x200) == 0 || self->_readPenalty != *((double *)a3 + 10)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x200) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x2000) == 0 || self->_sparseTagsPenalty != *((double *)a3 + 14)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x2000) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x4000) == 0 || self->_timeDecayPenalty != *((double *)a3 + 15)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x4000) != 0)
    {
      goto LABEL_84;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_multiplierDampener != *((double *)a3 + 8)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x100) == 0 || self->_mutedVoteDampener != *((double *)a3 + 9)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x100) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x800) == 0 || self->_scoringType != *((void *)a3 + 12)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x800) != 0)
    {
      goto LABEL_84;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_groupingReason != *((void *)a3 + 6)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_84;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((*((_WORD *)a3 + 72) & 0x400) == 0 || self->_scoringContext != *((void *)a3 + 11)) {
        goto LABEL_84;
      }
    }
    else if ((*((_WORD *)a3 + 72) & 0x400) != 0)
    {
      goto LABEL_84;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_listenedPenalty != *((double *)a3 + 7)) {
        goto LABEL_84;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_84;
    }
    scoringAssetsIdentifier = self->_scoringAssetsIdentifier;
    if ((unint64_t)scoringAssetsIdentifier | *((void *)a3 + 17))
    {
      LOBYTE(v5) = -[NSString isEqual:](scoringAssetsIdentifier, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has < 0)
  {
    double userConversionScore = self->_userConversionScore;
    double v6 = -userConversionScore;
    if (userConversionScore >= 0.0) {
      double v6 = self->_userConversionScore;
    }
    long double v7 = floor(v6 + 0.5);
    double v8 = (v6 - v7) * 1.84467441e19;
    unint64_t v4 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
    if (v8 >= 0.0)
    {
      if (v8 > 0.0) {
        v4 += (unint64_t)v8;
      }
    }
    else
    {
      v4 -= (unint64_t)fabs(v8);
    }
  }
  else
  {
    unint64_t v4 = 0;
  }
  unint64_t v95 = v4;
  if ((has & 4) != 0)
  {
    double bundlePaidMultiplier = self->_bundlePaidMultiplier;
    double v11 = -bundlePaidMultiplier;
    if (bundlePaidMultiplier >= 0.0) {
      double v11 = self->_bundlePaidMultiplier;
    }
    long double v12 = floor(v11 + 0.5);
    double v13 = (v11 - v12) * 1.84467441e19;
    unint64_t v9 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
    if (v13 >= 0.0)
    {
      if (v13 > 0.0) {
        v9 += (unint64_t)v13;
      }
    }
    else
    {
      v9 -= (unint64_t)fabs(v13);
    }
  }
  else
  {
    unint64_t v9 = 0;
  }
  if ((has & 2) != 0)
  {
    double bundleFreeMultiplier = self->_bundleFreeMultiplier;
    double v16 = -bundleFreeMultiplier;
    if (bundleFreeMultiplier >= 0.0) {
      double v16 = self->_bundleFreeMultiplier;
    }
    long double v17 = floor(v16 + 0.5);
    double v18 = (v16 - v17) * 1.84467441e19;
    unint64_t v14 = 2654435761u * (unint64_t)fmod(v17, 1.84467441e19);
    if (v18 >= 0.0)
    {
      if (v18 > 0.0) {
        v14 += (unint64_t)v18;
      }
    }
    else
    {
      v14 -= (unint64_t)fabs(v18);
    }
  }
  else
  {
    unint64_t v14 = 0;
  }
  if ((has & 0x10) != 0)
  {
    double featuredMultiplier = self->_featuredMultiplier;
    double v21 = -featuredMultiplier;
    if (featuredMultiplier >= 0.0) {
      double v21 = self->_featuredMultiplier;
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
  if (has)
  {
    double audioMultiplier = self->_audioMultiplier;
    double v26 = -audioMultiplier;
    if (audioMultiplier >= 0.0) {
      double v26 = self->_audioMultiplier;
    }
    long double v27 = floor(v26 + 0.5);
    double v28 = (v26 - v27) * 1.84467441e19;
    unint64_t v24 = 2654435761u * (unint64_t)fmod(v27, 1.84467441e19);
    if (v28 >= 0.0)
    {
      if (v28 > 0.0) {
        v24 += (unint64_t)v28;
      }
    }
    else
    {
      v24 -= (unint64_t)fabs(v28);
    }
  }
  else
  {
    unint64_t v24 = 0;
  }
  unint64_t v94 = v24;
  if ((has & 8) != 0)
  {
    double evergreenMultiplier = self->_evergreenMultiplier;
    double v31 = -evergreenMultiplier;
    if (evergreenMultiplier >= 0.0) {
      double v31 = self->_evergreenMultiplier;
    }
    long double v32 = floor(v31 + 0.5);
    double v33 = (v31 - v32) * 1.84467441e19;
    unint64_t v29 = 2654435761u * (unint64_t)fmod(v32, 1.84467441e19);
    if (v33 >= 0.0)
    {
      if (v33 > 0.0) {
        v29 += (unint64_t)v33;
      }
    }
    else
    {
      v29 -= (unint64_t)fabs(v33);
    }
  }
  else
  {
    unint64_t v29 = 0;
  }
  if ((has & 0x1000) != 0)
  {
    double seenPenalty = self->_seenPenalty;
    double v36 = -seenPenalty;
    if (seenPenalty >= 0.0) {
      double v36 = self->_seenPenalty;
    }
    long double v37 = floor(v36 + 0.5);
    double v38 = (v36 - v37) * 1.84467441e19;
    unint64_t v34 = 2654435761u * (unint64_t)fmod(v37, 1.84467441e19);
    if (v38 >= 0.0)
    {
      if (v38 > 0.0) {
        v34 += (unint64_t)v38;
      }
    }
    else
    {
      v34 -= (unint64_t)fabs(v38);
    }
  }
  else
  {
    unint64_t v34 = 0;
  }
  if ((has & 0x200) != 0)
  {
    double readPenalty = self->_readPenalty;
    double v41 = -readPenalty;
    if (readPenalty >= 0.0) {
      double v41 = self->_readPenalty;
    }
    long double v42 = floor(v41 + 0.5);
    double v43 = (v41 - v42) * 1.84467441e19;
    unint64_t v39 = 2654435761u * (unint64_t)fmod(v42, 1.84467441e19);
    if (v43 >= 0.0)
    {
      if (v43 > 0.0) {
        v39 += (unint64_t)v43;
      }
    }
    else
    {
      v39 -= (unint64_t)fabs(v43);
    }
  }
  else
  {
    unint64_t v39 = 0;
  }
  if ((has & 0x2000) == 0)
  {
    unint64_t v98 = 0;
    goto LABEL_74;
  }
  double sparseTagsPenalty = self->_sparseTagsPenalty;
  double v45 = -sparseTagsPenalty;
  if (sparseTagsPenalty >= 0.0) {
    double v45 = self->_sparseTagsPenalty;
  }
  long double v46 = floor(v45 + 0.5);
  double v47 = (v45 - v46) * 1.84467441e19;
  double v48 = fmod(v46, 1.84467441e19);
  if (v47 >= 0.0)
  {
    unint64_t v98 = 2654435761u * (unint64_t)v48;
    if (v47 <= 0.0) {
      goto LABEL_74;
    }
    unint64_t v49 = v98 + (unint64_t)v47;
  }
  else
  {
    unint64_t v49 = 2654435761u * (unint64_t)v48 - (unint64_t)fabs(v47);
  }
  unint64_t v98 = v49;
LABEL_74:
  if ((has & 0x4000) == 0)
  {
    unint64_t v97 = 0;
    goto LABEL_83;
  }
  double timeDecayPenalty = self->_timeDecayPenalty;
  double v51 = -timeDecayPenalty;
  if (timeDecayPenalty >= 0.0) {
    double v51 = self->_timeDecayPenalty;
  }
  long double v52 = floor(v51 + 0.5);
  double v53 = (v51 - v52) * 1.84467441e19;
  double v54 = fmod(v52, 1.84467441e19);
  if (v53 >= 0.0)
  {
    unint64_t v97 = 2654435761u * (unint64_t)v54;
    if (v53 <= 0.0) {
      goto LABEL_83;
    }
    unint64_t v55 = v97 + (unint64_t)v53;
  }
  else
  {
    unint64_t v55 = 2654435761u * (unint64_t)v54 - (unint64_t)fabs(v53);
  }
  unint64_t v97 = v55;
LABEL_83:
  if ((has & 0x80) != 0)
  {
    double multiplierDampener = self->_multiplierDampener;
    double v58 = -multiplierDampener;
    if (multiplierDampener >= 0.0) {
      double v58 = self->_multiplierDampener;
    }
    long double v59 = floor(v58 + 0.5);
    double v60 = (v58 - v59) * 1.84467441e19;
    unint64_t v56 = 2654435761u * (unint64_t)fmod(v59, 1.84467441e19);
    if (v60 >= 0.0)
    {
      if (v60 > 0.0) {
        v56 += (unint64_t)v60;
      }
    }
    else
    {
      v56 -= (unint64_t)fabs(v60);
    }
  }
  else
  {
    unint64_t v56 = 0;
  }
  if ((has & 0x100) != 0)
  {
    unint64_t v62 = v19;
    unint64_t v63 = v14;
    unint64_t v64 = v9;
    unint64_t v65 = v56;
    double mutedVoteDampener = self->_mutedVoteDampener;
    double v67 = -mutedVoteDampener;
    if (mutedVoteDampener >= 0.0) {
      double v67 = self->_mutedVoteDampener;
    }
    long double v68 = floor(v67 + 0.5);
    double v69 = (v67 - v68) * 1.84467441e19;
    unint64_t v61 = 2654435761u * (unint64_t)fmod(v68, 1.84467441e19);
    if (v69 >= 0.0)
    {
      unint64_t v56 = v65;
      unint64_t v9 = v64;
      unint64_t v14 = v63;
      unint64_t v19 = v62;
      if (v69 > 0.0) {
        v61 += (unint64_t)v69;
      }
    }
    else
    {
      v61 -= (unint64_t)fabs(v69);
      unint64_t v56 = v65;
      unint64_t v9 = v64;
      unint64_t v14 = v63;
      unint64_t v19 = v62;
    }
  }
  else
  {
    unint64_t v61 = 0;
  }
  if ((has & 0x800) != 0)
  {
    uint64_t v70 = 2654435761 * self->_scoringType;
    if ((has & 0x20) != 0) {
      goto LABEL_99;
    }
  }
  else
  {
    uint64_t v70 = 0;
    if ((has & 0x20) != 0)
    {
LABEL_99:
      uint64_t v71 = 2654435761 * self->_groupingReason;
      goto LABEL_102;
    }
  }
  uint64_t v71 = 0;
LABEL_102:
  unint64_t v96 = v39;
  unint64_t v72 = v34;
  unint64_t v73 = v29;
  if ((has & 0x400) != 0)
  {
    unint64_t v75 = v19;
    unint64_t v76 = v14;
    unint64_t v77 = v9;
    unint64_t v79 = v94;
    unint64_t v78 = v95;
    v74 = self;
    uint64_t v80 = 2654435761 * self->_scoringContext;
    if ((has & 0x40) != 0) {
      goto LABEL_104;
    }
LABEL_109:
    unint64_t v86 = 0;
    unint64_t v88 = v97;
    unint64_t v87 = v98;
    return v77 ^ v78 ^ v76 ^ v75 ^ v79 ^ v73 ^ v72 ^ v96 ^ v87 ^ v88 ^ v56 ^ v61 ^ v70 ^ v71 ^ v80 ^ v86 ^ [(NSString *)v74->_scoringAssetsIdentifier hash];
  }
  v74 = self;
  unint64_t v75 = v19;
  unint64_t v76 = v14;
  unint64_t v77 = v9;
  unint64_t v79 = v94;
  unint64_t v78 = v95;
  uint64_t v80 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_109;
  }
LABEL_104:
  uint64_t v90 = v80;
  uint64_t v91 = v71;
  uint64_t v92 = v70;
  unint64_t v93 = v61;
  unint64_t v81 = v56;
  double listenedPenalty = v74->_listenedPenalty;
  double v83 = -listenedPenalty;
  if (listenedPenalty >= 0.0) {
    double v83 = v74->_listenedPenalty;
  }
  long double v84 = floor(v83 + 0.5);
  double v85 = (v83 - v84) * 1.84467441e19;
  unint64_t v86 = 2654435761u * (unint64_t)fmod(v84, 1.84467441e19);
  if (v85 >= 0.0)
  {
    unint64_t v88 = v97;
    unint64_t v87 = v98;
    unint64_t v56 = v81;
    uint64_t v70 = v92;
    unint64_t v61 = v93;
    uint64_t v80 = v90;
    uint64_t v71 = v91;
    if (v85 > 0.0) {
      v86 += (unint64_t)v85;
    }
  }
  else
  {
    v86 -= (unint64_t)fabs(v85);
    unint64_t v88 = v97;
    unint64_t v87 = v98;
    unint64_t v56 = v81;
    uint64_t v70 = v92;
    unint64_t v61 = v93;
    uint64_t v80 = v90;
    uint64_t v71 = v91;
  }
  return v77 ^ v78 ^ v76 ^ v75 ^ v79 ^ v73 ^ v72 ^ v96 ^ v87 ^ v88 ^ v56 ^ v61 ^ v70 ^ v71 ^ v80 ^ v86 ^ [(NSString *)v74->_scoringAssetsIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  int v3 = *((__int16 *)a3 + 72);
  if ((v3 & 0x80000000) == 0)
  {
    if ((v3 & 4) == 0) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  self->_double userConversionScore = *((double *)a3 + 16);
  *(_WORD *)&self->_has |= 0x8000u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 4) != 0)
  {
LABEL_3:
    self->_double bundlePaidMultiplier = *((double *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    LOWORD(v3) = *((_WORD *)a3 + 72);
  }
LABEL_4:
  if ((v3 & 2) != 0)
  {
    self->_double bundleFreeMultiplier = *((double *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
    LOWORD(v3) = *((_WORD *)a3 + 72);
    if ((v3 & 0x10) == 0)
    {
LABEL_6:
      if ((v3 & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_23;
    }
  }
  else if ((v3 & 0x10) == 0)
  {
    goto LABEL_6;
  }
  self->_double featuredMultiplier = *((double *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 1) == 0)
  {
LABEL_7:
    if ((v3 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_double audioMultiplier = *((double *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 8) == 0)
  {
LABEL_8:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_double evergreenMultiplier = *((double *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x1000) == 0)
  {
LABEL_9:
    if ((v3 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_double seenPenalty = *((double *)a3 + 13);
  *(_WORD *)&self->_has |= 0x1000u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x200) == 0)
  {
LABEL_10:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_double readPenalty = *((double *)a3 + 10);
  *(_WORD *)&self->_has |= 0x200u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x2000) == 0)
  {
LABEL_11:
    if ((v3 & 0x4000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_double sparseTagsPenalty = *((double *)a3 + 14);
  *(_WORD *)&self->_has |= 0x2000u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x4000) == 0)
  {
LABEL_12:
    if ((v3 & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_double timeDecayPenalty = *((double *)a3 + 15);
  *(_WORD *)&self->_has |= 0x4000u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x80) == 0)
  {
LABEL_13:
    if ((v3 & 0x100) == 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_double multiplierDampener = *((double *)a3 + 8);
  *(_WORD *)&self->_has |= 0x80u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x100) == 0)
  {
LABEL_14:
    if ((v3 & 0x800) == 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_double mutedVoteDampener = *((double *)a3 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x800) == 0)
  {
LABEL_15:
    if ((v3 & 0x20) == 0) {
      goto LABEL_16;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_scoringType = *((void *)a3 + 12);
  *(_WORD *)&self->_has |= 0x800u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x20) == 0)
  {
LABEL_16:
    if ((v3 & 0x400) == 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_groupingReason = *((void *)a3 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  LOWORD(v3) = *((_WORD *)a3 + 72);
  if ((v3 & 0x400) == 0)
  {
LABEL_17:
    if ((v3 & 0x40) == 0) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
LABEL_33:
  self->_scoringContext = *((void *)a3 + 11);
  *(_WORD *)&self->_has |= 0x400u;
  if ((*((_WORD *)a3 + 72) & 0x40) != 0)
  {
LABEL_18:
    self->_double listenedPenalty = *((double *)a3 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_19:
  if (*((void *)a3 + 17)) {
    -[NTPBScoreProfileDebug setScoringAssetsIdentifier:](self, "setScoringAssetsIdentifier:");
  }
}

- (double)userConversionScore
{
  return self->_userConversionScore;
}

- (double)bundlePaidMultiplier
{
  return self->_bundlePaidMultiplier;
}

- (double)bundleFreeMultiplier
{
  return self->_bundleFreeMultiplier;
}

- (double)featuredMultiplier
{
  return self->_featuredMultiplier;
}

- (double)audioMultiplier
{
  return self->_audioMultiplier;
}

- (double)evergreenMultiplier
{
  return self->_evergreenMultiplier;
}

- (double)seenPenalty
{
  return self->_seenPenalty;
}

- (double)readPenalty
{
  return self->_readPenalty;
}

- (double)sparseTagsPenalty
{
  return self->_sparseTagsPenalty;
}

- (double)timeDecayPenalty
{
  return self->_timeDecayPenalty;
}

- (double)multiplierDampener
{
  return self->_multiplierDampener;
}

- (double)mutedVoteDampener
{
  return self->_mutedVoteDampener;
}

- (int64_t)scoringType
{
  return self->_scoringType;
}

- (int64_t)groupingReason
{
  return self->_groupingReason;
}

- (int64_t)scoringContext
{
  return self->_scoringContext;
}

- (double)listenedPenalty
{
  return self->_listenedPenalty;
}

- (NSString)scoringAssetsIdentifier
{
  return self->_scoringAssetsIdentifier;
}

- (void)setScoringAssetsIdentifier:(id)a3
{
}

@end