@interface MXVoiceTriggerInfo
- (BOOL)hasConfigVersion;
- (BOOL)hasExtraSamplesAtStart;
- (BOOL)hasHardwareSampleRate;
- (BOOL)hasRecognizerScore;
- (BOOL)hasRecognizerThresholdOffset;
- (BOOL)hasSatScore;
- (BOOL)hasSatThreshold;
- (BOOL)hasTriggerEnd;
- (BOOL)hasTriggerScore;
- (BOOL)hasTriggerThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)configVersion;
- (double)extraSamplesAtStart;
- (double)hardwareSampleRate;
- (double)recognizerScore;
- (double)recognizerThresholdOffset;
- (double)satScore;
- (double)satThreshold;
- (double)triggerEnd;
- (double)triggerScore;
- (double)triggerThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setConfigVersion:(id)a3;
- (void)setExtraSamplesAtStart:(double)a3;
- (void)setHardwareSampleRate:(double)a3;
- (void)setHasExtraSamplesAtStart:(BOOL)a3;
- (void)setHasHardwareSampleRate:(BOOL)a3;
- (void)setHasRecognizerScore:(BOOL)a3;
- (void)setHasRecognizerThresholdOffset:(BOOL)a3;
- (void)setHasSatScore:(BOOL)a3;
- (void)setHasSatThreshold:(BOOL)a3;
- (void)setHasTriggerEnd:(BOOL)a3;
- (void)setHasTriggerScore:(BOOL)a3;
- (void)setHasTriggerThreshold:(BOOL)a3;
- (void)setRecognizerScore:(double)a3;
- (void)setRecognizerThresholdOffset:(double)a3;
- (void)setSatScore:(double)a3;
- (void)setSatThreshold:(double)a3;
- (void)setTriggerEnd:(double)a3;
- (void)setTriggerScore:(double)a3;
- (void)setTriggerThreshold:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation MXVoiceTriggerInfo

- (void)setTriggerScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_triggerScore = a3;
}

- (void)setHasTriggerScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasTriggerScore
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setTriggerThreshold:(double)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_triggerThreshold = a3;
}

- (void)setHasTriggerThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasTriggerThreshold
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setSatScore:(double)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_satScore = a3;
}

- (void)setHasSatScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasSatScore
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setSatThreshold:(double)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_satThreshold = a3;
}

- (void)setHasSatThreshold:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasSatThreshold
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setRecognizerScore:(double)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_recognizerScore = a3;
}

- (void)setHasRecognizerScore:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasRecognizerScore
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setRecognizerThresholdOffset:(double)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_recognizerThresholdOffset = a3;
}

- (void)setHasRecognizerThresholdOffset:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasRecognizerThresholdOffset
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasConfigVersion
{
  return self->_configVersion != 0;
}

- (void)setHardwareSampleRate:(double)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_hardwareSampleRate = a3;
}

- (void)setHasHardwareSampleRate:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasHardwareSampleRate
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setExtraSamplesAtStart:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_extraSamplesAtStart = a3;
}

- (void)setHasExtraSamplesAtStart:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasExtraSamplesAtStart
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setTriggerEnd:(double)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_triggerEnd = a3;
}

- (void)setHasTriggerEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasTriggerEnd
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  __int16 v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)MXVoiceTriggerInfo;
  v4 = [(MXVoiceTriggerInfo *)&v8 description];
  v5 = [(MXVoiceTriggerInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = [MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v10 = [NSNumber numberWithDouble:self->_triggerScore];
    [v3 setObject:v10 forKey:@"trigger_score"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v11 = [NSNumber numberWithDouble:self->_triggerThreshold];
  [v3 setObject:v11 forKey:@"trigger_threshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v12 = [NSNumber numberWithDouble:self->_satScore];
  [v3 setObject:v12 forKey:@"sat_score"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v13 = [NSNumber numberWithDouble:self->_satThreshold];
  [v3 setObject:v13 forKey:@"sat_threshold"];

  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  v14 = [NSNumber numberWithDouble:self->_recognizerScore];
  [v3 setObject:v14 forKey:@"recognizer_score"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    v5 = [NSNumber numberWithDouble:self->_recognizerThresholdOffset];
    [v3 setObject:v5 forKey:@"recognizer_threshold_offset"];
  }
LABEL_8:
  configVersion = self->_configVersion;
  if (configVersion) {
    [v3 setObject:configVersion forKey:@"config_version"];
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 2) != 0)
  {
    v15 = [NSNumber numberWithDouble:self->_hardwareSampleRate];
    [v3 setObject:v15 forKey:@"hardware_sample_rate"];

    __int16 v7 = (__int16)self->_has;
    if ((v7 & 1) == 0)
    {
LABEL_12:
      if ((v7 & 0x40) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v7 & 1) == 0)
  {
    goto LABEL_12;
  }
  v16 = [NSNumber numberWithDouble:self->_extraSamplesAtStart];
  [v3 setObject:v16 forKey:@"extra_samples_at_start"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    objc_super v8 = [NSNumber numberWithDouble:self->_triggerEnd];
    [v3 setObject:v8 forKey:@"trigger_end"];
  }
LABEL_14:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MXVoiceTriggerInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  PBDataWriterWriteDoubleField();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_7:
  }
    PBDataWriterWriteDoubleField();
LABEL_8:
  if (self->_configVersion) {
    PBDataWriterWriteStringField();
  }
  __int16 v5 = (__int16)self->_has;
  if ((v5 & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    __int16 v5 = (__int16)self->_has;
    if ((v5 & 1) == 0)
    {
LABEL_12:
      if ((v5 & 0x40) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v5 & 1) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteDoubleField();
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
LABEL_13:
  }
    PBDataWriterWriteDoubleField();
LABEL_14:
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    v4[8] = *(void *)&self->_triggerScore;
    *((_WORD *)v4 + 44) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  v4[9] = *(void *)&self->_triggerThreshold;
  *((_WORD *)v4 + 44) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  v4[5] = *(void *)&self->_satScore;
  *((_WORD *)v4 + 44) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v4[6] = *(void *)&self->_satThreshold;
  *((_WORD *)v4 + 44) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  v4[3] = *(void *)&self->_recognizerScore;
  *((_WORD *)v4 + 44) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    v4[4] = *(void *)&self->_recognizerThresholdOffset;
    *((_WORD *)v4 + 44) |= 8u;
  }
LABEL_8:
  if (self->_configVersion)
  {
    __int16 v7 = v4;
    objc_msgSend(v4, "setConfigVersion:");
    v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    v4[2] = *(void *)&self->_hardwareSampleRate;
    *((_WORD *)v4 + 44) |= 2u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 1) == 0)
    {
LABEL_12:
      if ((v6 & 0x40) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_12;
  }
  v4[1] = *(void *)&self->_extraSamplesAtStart;
  *((_WORD *)v4 + 44) |= 1u;
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_13:
    v4[7] = *(void *)&self->_triggerEnd;
    *((_WORD *)v4 + 44) |= 0x40u;
  }
LABEL_14:
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    *(double *)(v5 + 64) = self->_triggerScore;
    *(_WORD *)(v5 + 88) |= 0x80u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_3:
      if ((has & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 72) = self->_triggerThreshold;
  *(_WORD *)(v5 + 88) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_4:
    if ((has & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  *(double *)(v5 + 40) = self->_satScore;
  *(_WORD *)(v5 + 88) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_5:
    if ((has & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  *(double *)(v5 + 48) = self->_satThreshold;
  *(_WORD *)(v5 + 88) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_6:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_17:
  *(double *)(v5 + 24) = self->_recognizerScore;
  *(_WORD *)(v5 + 88) |= 4u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_7:
    *(double *)(v5 + 32) = self->_recognizerThresholdOffset;
    *(_WORD *)(v5 + 88) |= 8u;
  }
LABEL_8:
  uint64_t v8 = [(NSString *)self->_configVersion copyWithZone:a3];
  v9 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v8;

  __int16 v10 = (__int16)self->_has;
  if ((v10 & 2) == 0)
  {
    if ((v10 & 1) == 0) {
      goto LABEL_10;
    }
LABEL_20:
    *(double *)(v6 + 8) = self->_extraSamplesAtStart;
    *(_WORD *)(v6 + 88) |= 1u;
    if ((*(_WORD *)&self->_has & 0x40) == 0) {
      return (id)v6;
    }
    goto LABEL_11;
  }
  *(double *)(v6 + 16) = self->_hardwareSampleRate;
  *(_WORD *)(v6 + 88) |= 2u;
  __int16 v10 = (__int16)self->_has;
  if (v10) {
    goto LABEL_20;
  }
LABEL_10:
  if ((v10 & 0x40) != 0)
  {
LABEL_11:
    *(double *)(v6 + 56) = self->_triggerEnd;
    *(_WORD *)(v6 + 88) |= 0x40u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  __int16 has = (__int16)self->_has;
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((has & 0x80) != 0)
  {
    if ((v6 & 0x80) == 0 || self->_triggerScore != *((double *)v4 + 8)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x80) != 0)
  {
    goto LABEL_49;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 44) & 0x100) == 0 || self->_triggerThreshold != *((double *)v4 + 9)) {
      goto LABEL_49;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) == 0 || self->_satScore != *((double *)v4 + 5)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x10) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 0x20) != 0)
  {
    if ((v6 & 0x20) == 0 || self->_satThreshold != *((double *)v4 + 6)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 0x20) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_recognizerScore != *((double *)v4 + 3)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_49;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_recognizerThresholdOffset != *((double *)v4 + 4)) {
      goto LABEL_49;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_49;
  }
  configVersion = self->_configVersion;
  if ((unint64_t)configVersion | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](configVersion, "isEqual:"))
    {
LABEL_49:
      BOOL v9 = 0;
      goto LABEL_50;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v8 = *((_WORD *)v4 + 44);
  if ((has & 2) != 0)
  {
    if ((v8 & 2) == 0 || self->_hardwareSampleRate != *((double *)v4 + 2)) {
      goto LABEL_49;
    }
  }
  else if ((v8 & 2) != 0)
  {
    goto LABEL_49;
  }
  if (has)
  {
    if ((v8 & 1) == 0 || self->_extraSamplesAtStart != *((double *)v4 + 1)) {
      goto LABEL_49;
    }
  }
  else if (v8)
  {
    goto LABEL_49;
  }
  BOOL v9 = (v8 & 0x40) == 0;
  if ((has & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_triggerEnd != *((double *)v4 + 7)) {
      goto LABEL_49;
    }
    BOOL v9 = 1;
  }
LABEL_50:

  return v9;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) != 0)
  {
    double triggerScore = self->_triggerScore;
    double v6 = -triggerScore;
    if (triggerScore >= 0.0) {
      double v6 = self->_triggerScore;
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
  if ((has & 0x100) != 0)
  {
    double triggerThreshold = self->_triggerThreshold;
    double v11 = -triggerThreshold;
    if (triggerThreshold >= 0.0) {
      double v11 = self->_triggerThreshold;
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
  if ((has & 0x10) != 0)
  {
    double satScore = self->_satScore;
    double v16 = -satScore;
    if (satScore >= 0.0) {
      double v16 = self->_satScore;
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
  if ((has & 0x20) != 0)
  {
    double satThreshold = self->_satThreshold;
    double v21 = -satThreshold;
    if (satThreshold >= 0.0) {
      double v21 = self->_satThreshold;
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
  if ((has & 4) != 0)
  {
    double recognizerScore = self->_recognizerScore;
    double v26 = -recognizerScore;
    if (recognizerScore >= 0.0) {
      double v26 = self->_recognizerScore;
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
  unint64_t v53 = v24;
  unint64_t v55 = v14;
  if ((has & 8) != 0)
  {
    double recognizerThresholdOffset = self->_recognizerThresholdOffset;
    double v32 = -recognizerThresholdOffset;
    if (recognizerThresholdOffset >= 0.0) {
      double v32 = self->_recognizerThresholdOffset;
    }
    long double v33 = floor(v32 + 0.5);
    double v34 = (v32 - v33) * 1.84467441e19;
    unint64_t v30 = 2654435761u * (unint64_t)fmod(v33, 1.84467441e19);
    unint64_t v29 = v4;
    if (v34 >= 0.0)
    {
      if (v34 > 0.0) {
        v30 += (unint64_t)v34;
      }
    }
    else
    {
      v30 -= (unint64_t)fabs(v34);
    }
  }
  else
  {
    unint64_t v29 = v4;
    unint64_t v30 = 0;
  }
  NSUInteger v35 = [(NSString *)self->_configVersion hash];
  __int16 v36 = (__int16)self->_has;
  if ((v36 & 2) != 0)
  {
    double hardwareSampleRate = self->_hardwareSampleRate;
    double v39 = -hardwareSampleRate;
    if (hardwareSampleRate >= 0.0) {
      double v39 = self->_hardwareSampleRate;
    }
    long double v40 = floor(v39 + 0.5);
    double v41 = (v39 - v40) * 1.84467441e19;
    unint64_t v37 = 2654435761u * (unint64_t)fmod(v40, 1.84467441e19);
    if (v41 >= 0.0)
    {
      if (v41 > 0.0) {
        v37 += (unint64_t)v41;
      }
    }
    else
    {
      v37 -= (unint64_t)fabs(v41);
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  if (v36)
  {
    double extraSamplesAtStart = self->_extraSamplesAtStart;
    double v44 = -extraSamplesAtStart;
    if (extraSamplesAtStart >= 0.0) {
      double v44 = self->_extraSamplesAtStart;
    }
    long double v45 = floor(v44 + 0.5);
    double v46 = (v44 - v45) * 1.84467441e19;
    unint64_t v42 = 2654435761u * (unint64_t)fmod(v45, 1.84467441e19);
    if (v46 >= 0.0)
    {
      if (v46 > 0.0) {
        v42 += (unint64_t)v46;
      }
    }
    else
    {
      v42 -= (unint64_t)fabs(v46);
    }
  }
  else
  {
    unint64_t v42 = 0;
  }
  if ((v36 & 0x40) != 0)
  {
    double triggerEnd = self->_triggerEnd;
    double v49 = -triggerEnd;
    if (triggerEnd >= 0.0) {
      double v49 = self->_triggerEnd;
    }
    long double v50 = floor(v49 + 0.5);
    double v51 = (v49 - v50) * 1.84467441e19;
    unint64_t v47 = 2654435761u * (unint64_t)fmod(v50, 1.84467441e19);
    if (v51 >= 0.0)
    {
      if (v51 > 0.0) {
        v47 += (unint64_t)v51;
      }
    }
    else
    {
      v47 -= (unint64_t)fabs(v51);
    }
  }
  else
  {
    unint64_t v47 = 0;
  }
  return v9 ^ v29 ^ v56 ^ v19 ^ v54 ^ v30 ^ v37 ^ v42 ^ v47 ^ v35;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x80) != 0)
  {
    self->_double triggerScore = *((double *)v4 + 8);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v5 = *((_WORD *)v4 + 44);
    if ((v5 & 0x100) == 0)
    {
LABEL_3:
      if ((v5 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*((_WORD *)v4 + 44) & 0x100) == 0)
  {
    goto LABEL_3;
  }
  self->_double triggerThreshold = *((double *)v4 + 9);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x10) == 0)
  {
LABEL_4:
    if ((v5 & 0x20) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  self->_double satScore = *((double *)v4 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 0x20) == 0)
  {
LABEL_5:
    if ((v5 & 4) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  self->_double satThreshold = *((double *)v4 + 6);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_21:
  self->_double recognizerScore = *((double *)v4 + 3);
  *(_WORD *)&self->_has |= 4u;
  if ((*((_WORD *)v4 + 44) & 8) != 0)
  {
LABEL_7:
    self->_double recognizerThresholdOffset = *((double *)v4 + 4);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_8:
  if (*((void *)v4 + 10))
  {
    id v7 = v4;
    -[MXVoiceTriggerInfo setConfigVersion:](self, "setConfigVersion:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 44);
  if ((v6 & 2) != 0)
  {
    self->_double hardwareSampleRate = *((double *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
    __int16 v6 = *((_WORD *)v4 + 44);
    if ((v6 & 1) == 0)
    {
LABEL_12:
      if ((v6 & 0x40) == 0) {
        goto LABEL_14;
      }
      goto LABEL_13;
    }
  }
  else if ((v6 & 1) == 0)
  {
    goto LABEL_12;
  }
  self->_double extraSamplesAtStart = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 44) & 0x40) != 0)
  {
LABEL_13:
    self->_double triggerEnd = *((double *)v4 + 7);
    *(_WORD *)&self->_has |= 0x40u;
  }
LABEL_14:
}

- (double)triggerScore
{
  return self->_triggerScore;
}

- (double)triggerThreshold
{
  return self->_triggerThreshold;
}

- (double)satScore
{
  return self->_satScore;
}

- (double)satThreshold
{
  return self->_satThreshold;
}

- (double)recognizerScore
{
  return self->_recognizerScore;
}

- (double)recognizerThresholdOffset
{
  return self->_recognizerThresholdOffset;
}

- (NSString)configVersion
{
  return self->_configVersion;
}

- (void)setConfigVersion:(id)a3
{
}

- (double)hardwareSampleRate
{
  return self->_hardwareSampleRate;
}

- (double)extraSamplesAtStart
{
  return self->_extraSamplesAtStart;
}

- (double)triggerEnd
{
  return self->_triggerEnd;
}

- (void).cxx_destruct
{
}

@end