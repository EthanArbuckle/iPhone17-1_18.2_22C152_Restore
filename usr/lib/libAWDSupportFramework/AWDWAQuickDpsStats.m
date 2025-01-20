@interface AWDWAQuickDpsStats
- (BOOL)hasAwdlActivityThreshold;
- (BOOL)hasCcaThreshold;
- (BOOL)hasIsDpsValidationDisabled;
- (BOOL)hasProbabilityThreshold;
- (BOOL)hasQuickDpsResetRecommendation;
- (BOOL)hasQuickDpsTimeSincePreviousTriggerMinutes;
- (BOOL)hasRssiThreshold;
- (BOOL)hasScreenOffThreshold;
- (BOOL)hasScreenOnThreshold;
- (BOOL)hasScreenStateOn;
- (BOOL)hasStallPrediction;
- (BOOL)hasStallProbability;
- (BOOL)hasSuppressedReason;
- (BOOL)isDpsValidationDisabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)quickDpsResetRecommendation;
- (BOOL)readFrom:(id)a3;
- (BOOL)screenStateOn;
- (BOOL)stallPrediction;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)suppressedReasonAsString:(int)a3;
- (int)StringAsSuppressedReason:(id)a3;
- (int)suppressedReason;
- (unint64_t)hash;
- (unint64_t)quickDpsTimeSincePreviousTriggerMinutes;
- (unsigned)awdlActivityThreshold;
- (unsigned)ccaThreshold;
- (unsigned)probabilityThreshold;
- (unsigned)rssiThreshold;
- (unsigned)screenOffThreshold;
- (unsigned)screenOnThreshold;
- (unsigned)stallProbability;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAwdlActivityThreshold:(unsigned int)a3;
- (void)setCcaThreshold:(unsigned int)a3;
- (void)setHasAwdlActivityThreshold:(BOOL)a3;
- (void)setHasCcaThreshold:(BOOL)a3;
- (void)setHasIsDpsValidationDisabled:(BOOL)a3;
- (void)setHasProbabilityThreshold:(BOOL)a3;
- (void)setHasQuickDpsResetRecommendation:(BOOL)a3;
- (void)setHasQuickDpsTimeSincePreviousTriggerMinutes:(BOOL)a3;
- (void)setHasRssiThreshold:(BOOL)a3;
- (void)setHasScreenOffThreshold:(BOOL)a3;
- (void)setHasScreenOnThreshold:(BOOL)a3;
- (void)setHasScreenStateOn:(BOOL)a3;
- (void)setHasStallPrediction:(BOOL)a3;
- (void)setHasStallProbability:(BOOL)a3;
- (void)setHasSuppressedReason:(BOOL)a3;
- (void)setIsDpsValidationDisabled:(BOOL)a3;
- (void)setProbabilityThreshold:(unsigned int)a3;
- (void)setQuickDpsResetRecommendation:(BOOL)a3;
- (void)setQuickDpsTimeSincePreviousTriggerMinutes:(unint64_t)a3;
- (void)setRssiThreshold:(unsigned int)a3;
- (void)setScreenOffThreshold:(unsigned int)a3;
- (void)setScreenOnThreshold:(unsigned int)a3;
- (void)setScreenStateOn:(BOOL)a3;
- (void)setStallPrediction:(BOOL)a3;
- (void)setStallProbability:(unsigned int)a3;
- (void)setSuppressedReason:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWAQuickDpsStats

- (void)setScreenStateOn:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_screenStateOn = a3;
}

- (void)setHasScreenStateOn:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasScreenStateOn
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setQuickDpsResetRecommendation:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_quickDpsResetRecommendation = a3;
}

- (void)setHasQuickDpsResetRecommendation:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasQuickDpsResetRecommendation
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setStallPrediction:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_stallPrediction = a3;
}

- (void)setHasStallPrediction:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasStallPrediction
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setStallProbability:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_stallProbability = a3;
}

- (void)setHasStallProbability:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasStallProbability
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setProbabilityThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_probabilityThreshold = a3;
}

- (void)setHasProbabilityThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasProbabilityThreshold
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setCcaThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_ccaThreshold = a3;
}

- (void)setHasCcaThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasCcaThreshold
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRssiThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_rssiThreshold = a3;
}

- (void)setHasRssiThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasRssiThreshold
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setScreenOnThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_screenOnThreshold = a3;
}

- (void)setHasScreenOnThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasScreenOnThreshold
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setScreenOffThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_screenOffThreshold = a3;
}

- (void)setHasScreenOffThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasScreenOffThreshold
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (int)suppressedReason
{
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    return self->_suppressedReason;
  }
  else {
    return 0;
  }
}

- (void)setSuppressedReason:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_suppressedReason = a3;
}

- (void)setHasSuppressedReason:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasSuppressedReason
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (id)suppressedReasonAsString:(int)a3
{
  if (a3 >= 0xB) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641BA1D0[a3];
  }
}

- (int)StringAsSuppressedReason:(id)a3
{
  if ([a3 isEqualToString:@"kNotSuppressed"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"kMLPrediction"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"kPredictionProbability"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"kQuickDpsDisabled"]) {
    return 3;
  }
  if ([a3 isEqualToString:@"kValidationFailure"]) {
    return 4;
  }
  if ([a3 isEqualToString:@"kBudgetThresholdReached"]) {
    return 5;
  }
  if ([a3 isEqualToString:@"kCcaThresholdReached"]) {
    return 6;
  }
  if ([a3 isEqualToString:@"kTriggerDisconnectSuspected"]) {
    return 7;
  }
  if ([a3 isEqualToString:@"kHighAwdlActivitySuspected"]) {
    return 8;
  }
  if ([a3 isEqualToString:@"kValidationFailureTxSuccessInAtleastOneAC"]) {
    return 9;
  }
  if ([a3 isEqualToString:@"kValidationFailureOtherErr"]) {
    return 10;
  }
  return 0;
}

- (void)setIsDpsValidationDisabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_isDpsValidationDisabled = a3;
}

- (void)setHasIsDpsValidationDisabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasIsDpsValidationDisabled
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setAwdlActivityThreshold:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_awdlActivityThreshold = a3;
}

- (void)setHasAwdlActivityThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasAwdlActivityThreshold
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setQuickDpsTimeSincePreviousTriggerMinutes:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_quickDpsTimeSincePreviousTriggerMinutes = a3;
}

- (void)setHasQuickDpsTimeSincePreviousTriggerMinutes:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasQuickDpsTimeSincePreviousTriggerMinutes
{
  return *(_WORD *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWAQuickDpsStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWAQuickDpsStats description](&v3, sel_description), -[AWDWAQuickDpsStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    [v3 setObject:[NSNumber numberWithBool:self->_screenStateOn] forKey:@"screenStateOn"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_quickDpsResetRecommendation] forKey:@"quickDpsResetRecommendation"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  [v3 setObject:[NSNumber numberWithBool:self->_stallPrediction] forKey:@"stallPrediction"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_stallProbability] forKey:@"stallProbability"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_probabilityThreshold] forKey:@"probabilityThreshold"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_ccaThreshold] forKey:@"ccaThreshold"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rssiThreshold] forKey:@"rssiThreshold"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_screenOnThreshold] forKey:@"screenOnThreshold"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_screenOffThreshold] forKey:@"screenOffThreshold"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_25:
  uint64_t suppressedReason = self->_suppressedReason;
  if (suppressedReason >= 0xB) {
    v7 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_suppressedReason];
  }
  else {
    v7 = off_2641BA1D0[suppressedReason];
  }
  [v3 setObject:v7 forKey:@"suppressedReason"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
LABEL_30:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_awdlActivityThreshold] forKey:@"awdlActivityThreshold"];
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return v3;
    }
    goto LABEL_14;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithBool:self->_isDpsValidationDisabled] forKey:@"isDpsValidationDisabled"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_30;
  }
LABEL_13:
  if (has) {
LABEL_14:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_quickDpsTimeSincePreviousTriggerMinutes] forKey:@"quickDpsTimeSincePreviousTriggerMinutes"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWAQuickDpsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
LABEL_26:
    PBDataWriterWriteUint32Field();
    if ((*(_WORD *)&self->_has & 1) == 0) {
      return;
    }
    goto LABEL_27;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_26;
  }
LABEL_13:
  if ((has & 1) == 0) {
    return;
  }
LABEL_27:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((unsigned char *)a3 + 50) = self->_screenStateOn;
    *((_WORD *)a3 + 26) |= 0x800u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 49) = self->_quickDpsResetRecommendation;
  *((_WORD *)a3 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((unsigned char *)a3 + 51) = self->_stallPrediction;
  *((_WORD *)a3 + 26) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((_DWORD *)a3 + 10) = self->_stallProbability;
  *((_WORD *)a3 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)a3 + 6) = self->_probabilityThreshold;
  *((_WORD *)a3 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 5) = self->_ccaThreshold;
  *((_WORD *)a3 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 7) = self->_rssiThreshold;
  *((_WORD *)a3 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)a3 + 9) = self->_screenOnThreshold;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 8) = self->_screenOffThreshold;
  *((_WORD *)a3 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_suppressedReason;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)a3 + 48) = self->_isDpsValidationDisabled;
  *((_WORD *)a3 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      return;
    }
LABEL_27:
    *((void *)a3 + 1) = self->_quickDpsTimeSincePreviousTriggerMinutes;
    *((_WORD *)a3 + 26) |= 1u;
    return;
  }
LABEL_26:
  *((_DWORD *)a3 + 4) = self->_awdlActivityThreshold;
  *((_WORD *)a3 + 26) |= 2u;
  if (*(_WORD *)&self->_has) {
    goto LABEL_27;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    *((unsigned char *)result + 50) = self->_screenStateOn;
    *((_WORD *)result + 26) |= 0x800u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_18;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 49) = self->_quickDpsResetRecommendation;
  *((_WORD *)result + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_19;
  }
LABEL_18:
  *((unsigned char *)result + 51) = self->_stallPrediction;
  *((_WORD *)result + 26) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)result + 10) = self->_stallProbability;
  *((_WORD *)result + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)result + 6) = self->_probabilityThreshold;
  *((_WORD *)result + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)result + 5) = self->_ccaThreshold;
  *((_WORD *)result + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)result + 7) = self->_rssiThreshold;
  *((_WORD *)result + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)result + 9) = self->_screenOnThreshold;
  *((_WORD *)result + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)result + 8) = self->_screenOffThreshold;
  *((_WORD *)result + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)result + 11) = self->_suppressedReason;
  *((_WORD *)result + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((unsigned char *)result + 48) = self->_isDpsValidationDisabled;
  *((_WORD *)result + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_27:
  *((_DWORD *)result + 4) = self->_awdlActivityThreshold;
  *((_WORD *)result + 26) |= 2u;
  if ((*(_WORD *)&self->_has & 1) == 0) {
    return result;
  }
LABEL_14:
  *((void *)result + 1) = self->_quickDpsTimeSincePreviousTriggerMinutes;
  *((_WORD *)result + 26) |= 1u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 26);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x800) == 0) {
      goto LABEL_78;
    }
    if (self->_screenStateOn)
    {
      if (!*((unsigned char *)a3 + 50)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)a3 + 50))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x800) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x400) == 0) {
      goto LABEL_78;
    }
    if (self->_quickDpsResetRecommendation)
    {
      if (!*((unsigned char *)a3 + 49)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)a3 + 49))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x400) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x1000) == 0) {
      goto LABEL_78;
    }
    if (self->_stallPrediction)
    {
      if (!*((unsigned char *)a3 + 51)) {
        goto LABEL_78;
      }
    }
    else if (*((unsigned char *)a3 + 51))
    {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x1000) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_stallProbability != *((_DWORD *)a3 + 10)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_probabilityThreshold != *((_DWORD *)a3 + 6)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_ccaThreshold != *((_DWORD *)a3 + 5)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_rssiThreshold != *((_DWORD *)a3 + 7)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_screenOnThreshold != *((_DWORD *)a3 + 9)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_screenOffThreshold != *((_DWORD *)a3 + 8)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0 || self->_suppressedReason != *((_DWORD *)a3 + 11)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0) {
      goto LABEL_78;
    }
    goto LABEL_69;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0) {
    goto LABEL_78;
  }
  if (self->_isDpsValidationDisabled)
  {
    if (!*((unsigned char *)a3 + 48)) {
      goto LABEL_78;
    }
    goto LABEL_69;
  }
  if (*((unsigned char *)a3 + 48))
  {
LABEL_78:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_69:
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_awdlActivityThreshold != *((_DWORD *)a3 + 4)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  LOBYTE(v5) = (v7 & 1) == 0;
  if (has)
  {
    if ((v7 & 1) == 0 || self->_quickDpsTimeSincePreviousTriggerMinutes != *((void *)a3 + 1)) {
      goto LABEL_78;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    uint64_t v3 = 2654435761 * self->_screenStateOn;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_quickDpsResetRecommendation;
      if ((*(_WORD *)&self->_has & 0x1000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_stallPrediction;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_stallProbability;
    if ((has & 8) != 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_probabilityThreshold;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
  if ((has & 4) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_ccaThreshold;
    if ((has & 0x10) != 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v8 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_rssiThreshold;
    if ((has & 0x40) != 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v9 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_screenOnThreshold;
    if ((has & 0x20) != 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v10 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_screenOffThreshold;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v11 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_11:
    uint64_t v12 = 2654435761 * self->_suppressedReason;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v13 = 2654435761 * self->_isDpsValidationDisabled;
    if ((has & 2) != 0) {
      goto LABEL_13;
    }
LABEL_26:
    uint64_t v14 = 0;
    if (has) {
      goto LABEL_14;
    }
LABEL_27:
    unint64_t v15 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
  }
LABEL_25:
  uint64_t v13 = 0;
  if ((has & 2) == 0) {
    goto LABEL_26;
  }
LABEL_13:
  uint64_t v14 = 2654435761 * self->_awdlActivityThreshold;
  if ((has & 1) == 0) {
    goto LABEL_27;
  }
LABEL_14:
  unint64_t v15 = 2654435761u * self->_quickDpsTimeSincePreviousTriggerMinutes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15;
}

- (void)mergeFrom:(id)a3
{
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x800) != 0)
  {
    self->_screenStateOn = *((unsigned char *)a3 + 50);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v3 = *((_WORD *)a3 + 26);
    if ((v3 & 0x400) == 0)
    {
LABEL_3:
      if ((v3 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_quickDpsResetRecommendation = *((unsigned char *)a3 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x1000) == 0)
  {
LABEL_4:
    if ((v3 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_stallPrediction = *((unsigned char *)a3 + 51);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x80) == 0)
  {
LABEL_5:
    if ((v3 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_stallProbability = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 8) == 0)
  {
LABEL_6:
    if ((v3 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_probabilityThreshold = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 4) == 0)
  {
LABEL_7:
    if ((v3 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_ccaThreshold = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x10) == 0)
  {
LABEL_8:
    if ((v3 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_rssiThreshold = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x40) == 0)
  {
LABEL_9:
    if ((v3 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_screenOnThreshold = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x20) == 0)
  {
LABEL_10:
    if ((v3 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_screenOffThreshold = *((_DWORD *)a3 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x100) == 0)
  {
LABEL_11:
    if ((v3 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_uint64_t suppressedReason = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 0x200) == 0)
  {
LABEL_12:
    if ((v3 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_isDpsValidationDisabled = *((unsigned char *)a3 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v3 = *((_WORD *)a3 + 26);
  if ((v3 & 2) == 0)
  {
LABEL_13:
    if ((v3 & 1) == 0) {
      return;
    }
LABEL_27:
    self->_quickDpsTimeSincePreviousTriggerMinutes = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    return;
  }
LABEL_26:
  self->_awdlActivityThreshold = *((_DWORD *)a3 + 4);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)a3 + 26)) {
    goto LABEL_27;
  }
}

- (BOOL)screenStateOn
{
  return self->_screenStateOn;
}

- (BOOL)quickDpsResetRecommendation
{
  return self->_quickDpsResetRecommendation;
}

- (BOOL)stallPrediction
{
  return self->_stallPrediction;
}

- (unsigned)stallProbability
{
  return self->_stallProbability;
}

- (unsigned)probabilityThreshold
{
  return self->_probabilityThreshold;
}

- (unsigned)ccaThreshold
{
  return self->_ccaThreshold;
}

- (unsigned)rssiThreshold
{
  return self->_rssiThreshold;
}

- (unsigned)screenOnThreshold
{
  return self->_screenOnThreshold;
}

- (unsigned)screenOffThreshold
{
  return self->_screenOffThreshold;
}

- (BOOL)isDpsValidationDisabled
{
  return self->_isDpsValidationDisabled;
}

- (unsigned)awdlActivityThreshold
{
  return self->_awdlActivityThreshold;
}

- (unint64_t)quickDpsTimeSincePreviousTriggerMinutes
{
  return self->_quickDpsTimeSincePreviousTriggerMinutes;
}

@end