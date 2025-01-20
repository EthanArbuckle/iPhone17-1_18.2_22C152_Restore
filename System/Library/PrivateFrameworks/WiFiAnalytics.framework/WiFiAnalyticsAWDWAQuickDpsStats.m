@interface WiFiAnalyticsAWDWAQuickDpsStats
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

@implementation WiFiAnalyticsAWDWAQuickDpsStats

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
  if (a3 >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    __int16 v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    __int16 v3 = off_2644674B8[a3];
  }
  return v3;
}

- (int)StringAsSuppressedReason:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"kNotSuppressed"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"kMLPrediction"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"kPredictionProbability"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"kQuickDpsDisabled"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"kValidationFailure"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"kBudgetThresholdReached"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"kCcaThresholdReached"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"kTriggerDisconnectSuspected"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"kHighAwdlActivitySuspected"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"kValidationFailureTxSuccessInAtleastOneAC"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"kValidationFailureOtherErr"])
  {
    int v4 = 10;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
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
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWAQuickDpsStats;
  int v4 = [(WiFiAnalyticsAWDWAQuickDpsStats *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWAQuickDpsStats *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_screenStateOn];
    [v3 setObject:v7 forKey:@"screenStateOn"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithBool:self->_quickDpsResetRecommendation];
  [v3 setObject:v8 forKey:@"quickDpsResetRecommendation"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v9 = [NSNumber numberWithBool:self->_stallPrediction];
  [v3 setObject:v9 forKey:@"stallPrediction"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  v10 = [NSNumber numberWithUnsignedInt:self->_stallProbability];
  [v3 setObject:v10 forKey:@"stallProbability"];

  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  v11 = [NSNumber numberWithUnsignedInt:self->_probabilityThreshold];
  [v3 setObject:v11 forKey:@"probabilityThreshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  v12 = [NSNumber numberWithUnsignedInt:self->_ccaThreshold];
  [v3 setObject:v12 forKey:@"ccaThreshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  v13 = [NSNumber numberWithUnsignedInt:self->_rssiThreshold];
  [v3 setObject:v13 forKey:@"rssiThreshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  v14 = [NSNumber numberWithUnsignedInt:self->_screenOnThreshold];
  [v3 setObject:v14 forKey:@"screenOnThreshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = [NSNumber numberWithUnsignedInt:self->_screenOffThreshold];
  [v3 setObject:v15 forKey:@"screenOffThreshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_31;
  }
LABEL_27:
  uint64_t suppressedReason = self->_suppressedReason;
  if (suppressedReason >= 0xB)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_suppressedReason);
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v17 = off_2644674B8[suppressedReason];
  }
  [v3 setObject:v17 forKey:@"suppressedReason"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_32;
  }
LABEL_31:
  v18 = [NSNumber numberWithBool:self->_isDpsValidationDisabled];
  [v3 setObject:v18 forKey:@"isDpsValidationDisabled"];

  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_32:
  v19 = [NSNumber numberWithUnsignedInt:self->_awdlActivityThreshold];
  [v3 setObject:v19 forKey:@"awdlActivityThreshold"];

  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    v5 = [NSNumber numberWithUnsignedLongLong:self->_quickDpsTimeSincePreviousTriggerMinutes];
    [v3 setObject:v5 forKey:@"quickDpsTimeSincePreviousTriggerMinutes"];
  }
LABEL_15:
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWAQuickDpsStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
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
      goto LABEL_20;
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
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if (*(_WORD *)&self->_has) {
LABEL_14:
  }
    PBDataWriterWriteUint64Field();
LABEL_15:
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) != 0)
  {
    v4[50] = self->_screenStateOn;
    *((_WORD *)v4 + 26) |= 0x800u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x400) == 0)
    {
LABEL_3:
      if ((has & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_3;
  }
  v4[49] = self->_quickDpsResetRecommendation;
  *((_WORD *)v4 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x1000) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[51] = self->_stallPrediction;
  *((_WORD *)v4 + 26) |= 0x1000u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v4 + 10) = self->_stallProbability;
  *((_WORD *)v4 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v4 + 6) = self->_probabilityThreshold;
  *((_WORD *)v4 + 26) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_7:
    if ((has & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)v4 + 5) = self->_ccaThreshold;
  *((_WORD *)v4 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_8:
    if ((has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)v4 + 7) = self->_rssiThreshold;
  *((_WORD *)v4 + 26) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)v4 + 9) = self->_screenOnThreshold;
  *((_WORD *)v4 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_10:
    if ((has & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v4 + 8) = self->_screenOffThreshold;
  *((_WORD *)v4 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_11:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v4 + 11) = self->_suppressedReason;
  *((_WORD *)v4 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_12:
    if ((has & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  v4[48] = self->_isDpsValidationDisabled;
  *((_WORD *)v4 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  *((_DWORD *)v4 + 4) = self->_awdlActivityThreshold;
  *((_WORD *)v4 + 26) |= 2u;
  if (*(_WORD *)&self->_has)
  {
LABEL_14:
    *((void *)v4 + 1) = self->_quickDpsTimeSincePreviousTriggerMinutes;
    *((_WORD *)v4 + 26) |= 1u;
  }
LABEL_15:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
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
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_79;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 26);
  if ((has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x800) == 0) {
      goto LABEL_79;
    }
    if (self->_screenStateOn)
    {
      if (!*((unsigned char *)v4 + 50)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 50))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x800) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x400) == 0) {
      goto LABEL_79;
    }
    if (self->_quickDpsResetRecommendation)
    {
      if (!*((unsigned char *)v4 + 49)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 49))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x1000) == 0) {
      goto LABEL_79;
    }
    if (self->_stallPrediction)
    {
      if (!*((unsigned char *)v4 + 51)) {
        goto LABEL_79;
      }
    }
    else if (*((unsigned char *)v4 + 51))
    {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x1000) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_stallProbability != *((_DWORD *)v4 + 10)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_probabilityThreshold != *((_DWORD *)v4 + 6)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_ccaThreshold != *((_DWORD *)v4 + 5)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_rssiThreshold != *((_DWORD *)v4 + 7)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x40) != 0)
  {
    if ((v6 & 0x40) == 0 || self->_screenOnThreshold != *((_DWORD *)v4 + 9)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x40) != 0)
  {
    goto LABEL_79;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_screenOffThreshold != *((_DWORD *)v4 + 8)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x100) == 0 || self->_suppressedReason != *((_DWORD *)v4 + 11)) {
      goto LABEL_79;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x100) != 0)
  {
    goto LABEL_79;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 26) & 0x200) != 0)
    {
      if (self->_isDpsValidationDisabled)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_79;
        }
        goto LABEL_69;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_69;
      }
    }
LABEL_79:
    BOOL v7 = 0;
    goto LABEL_80;
  }
  if ((*((_WORD *)v4 + 26) & 0x200) != 0) {
    goto LABEL_79;
  }
LABEL_69:
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_awdlActivityThreshold != *((_DWORD *)v4 + 4)) {
      goto LABEL_79;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_79;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_quickDpsTimeSincePreviousTriggerMinutes != *((void *)v4 + 1)) {
      goto LABEL_79;
    }
    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = (v6 & 1) == 0;
  }
LABEL_80:

  return v7;
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
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x800) != 0)
  {
    self->_screenStateOn = *((unsigned char *)v4 + 50);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v5 = *((_WORD *)v4 + 26);
    if ((v5 & 0x400) == 0)
    {
LABEL_3:
      if ((v5 & 0x1000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((*((_WORD *)v4 + 26) & 0x400) == 0)
  {
    goto LABEL_3;
  }
  self->_quickDpsResetRecommendation = *((unsigned char *)v4 + 49);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x1000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_stallPrediction = *((unsigned char *)v4 + 51);
  *(_WORD *)&self->_has |= 0x1000u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  self->_stallProbability = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  self->_probabilityThreshold = *((_DWORD *)v4 + 6);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_7:
    if ((v5 & 0x10) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_ccaThreshold = *((_DWORD *)v4 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x10) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_rssiThreshold = *((_DWORD *)v4 + 7);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_screenOnThreshold = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_10:
    if ((v5 & 0x100) == 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_screenOffThreshold = *((_DWORD *)v4 + 8);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_11:
    if ((v5 & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_uint64_t suppressedReason = *((_DWORD *)v4 + 11);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_12:
    if ((v5 & 2) == 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_isDpsValidationDisabled = *((unsigned char *)v4 + 48);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 26);
  if ((v5 & 2) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_29:
  self->_awdlActivityThreshold = *((_DWORD *)v4 + 4);
  *(_WORD *)&self->_has |= 2u;
  if (*((_WORD *)v4 + 26))
  {
LABEL_14:
    self->_quickDpsTimeSincePreviousTriggerMinutes = *((void *)v4 + 1);
    *(_WORD *)&self->_has |= 1u;
  }
LABEL_15:
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