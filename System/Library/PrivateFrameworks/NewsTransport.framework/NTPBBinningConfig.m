@interface NTPBBinningConfig
- (BOOL)enabled;
- (BOOL)hasDecreaseConsumptionThreshold;
- (BOOL)hasDefaultChannelBin;
- (BOOL)hasDefaultTopicBin;
- (BOOL)hasEnabled;
- (BOOL)hasEvaluationFrequency;
- (BOOL)hasHistoryLength;
- (BOOL)hasIncreaseConsumptionThreshold;
- (BOOL)hasMinimumArticleCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)decreaseConsumptionThreshold;
- (double)increaseConsumptionThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)defaultChannelBin;
- (int)defaultTopicBin;
- (int64_t)evaluationFrequency;
- (int64_t)historyLength;
- (int64_t)minimumArticleCount;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDecreaseConsumptionThreshold:(double)a3;
- (void)setDefaultChannelBin:(int)a3;
- (void)setDefaultTopicBin:(int)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setEvaluationFrequency:(int64_t)a3;
- (void)setHasDecreaseConsumptionThreshold:(BOOL)a3;
- (void)setHasDefaultChannelBin:(BOOL)a3;
- (void)setHasDefaultTopicBin:(BOOL)a3;
- (void)setHasEnabled:(BOOL)a3;
- (void)setHasEvaluationFrequency:(BOOL)a3;
- (void)setHasHistoryLength:(BOOL)a3;
- (void)setHasIncreaseConsumptionThreshold:(BOOL)a3;
- (void)setHasMinimumArticleCount:(BOOL)a3;
- (void)setHistoryLength:(int64_t)a3;
- (void)setIncreaseConsumptionThreshold:(double)a3;
- (void)setMinimumArticleCount:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBinningConfig

- (void)setEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_enabled = a3;
}

- (void)setHasEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasEnabled
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setEvaluationFrequency:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_evaluationFrequency = a3;
}

- (void)setHasEvaluationFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEvaluationFrequency
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHistoryLength:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_historyLength = a3;
}

- (void)setHasHistoryLength:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHistoryLength
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIncreaseConsumptionThreshold:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_increaseConsumptionThreshold = a3;
}

- (void)setHasIncreaseConsumptionThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIncreaseConsumptionThreshold
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setDecreaseConsumptionThreshold:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_decreaseConsumptionThreshold = a3;
}

- (void)setHasDecreaseConsumptionThreshold:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDecreaseConsumptionThreshold
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setMinimumArticleCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_minimumArticleCount = a3;
}

- (void)setHasMinimumArticleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasMinimumArticleCount
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (int)defaultTopicBin
{
  if ((*(unsigned char *)&self->_has & 0x40) != 0) {
    return self->_defaultTopicBin;
  }
  else {
    return 0;
  }
}

- (void)setDefaultTopicBin:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_defaultTopicBin = a3;
}

- (void)setHasDefaultTopicBin:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasDefaultTopicBin
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (int)defaultChannelBin
{
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    return self->_defaultChannelBin;
  }
  else {
    return 0;
  }
}

- (void)setDefaultChannelBin:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_defaultChannelBin = a3;
}

- (void)setHasDefaultChannelBin:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasDefaultChannelBin
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBinningConfig;
  v4 = [(NTPBBinningConfig *)&v8 description];
  v5 = [(NTPBBinningConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has < 0)
  {
    v7 = [NSNumber numberWithBool:self->_enabled];
    [v3 setObject:v7 forKey:@"enabled"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithLongLong:self->_evaluationFrequency];
  [v3 setObject:v8 forKey:@"evaluation_frequency"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  v9 = [NSNumber numberWithLongLong:self->_historyLength];
  [v3 setObject:v9 forKey:@"history_length"];

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  v10 = [NSNumber numberWithDouble:self->_increaseConsumptionThreshold];
  [v3 setObject:v10 forKey:@"increase_consumption_threshold"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  v11 = [NSNumber numberWithDouble:self->_decreaseConsumptionThreshold];
  [v3 setObject:v11 forKey:@"decrease_consumption_threshold"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  v12 = [NSNumber numberWithLongLong:self->_minimumArticleCount];
  [v3 setObject:v12 forKey:@"minimum_article_count"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  v13 = [NSNumber numberWithInt:self->_defaultTopicBin];
  [v3 setObject:v13 forKey:@"default_topic_bin"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_9:
    v5 = [NSNumber numberWithInt:self->_defaultChannelBin];
    [v3 setObject:v5 forKey:@"default_channel_bin"];
  }
LABEL_10:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBinningConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has < 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has < 0)
  {
    *((unsigned char *)result + 56) = self->_enabled;
    *((unsigned char *)result + 60) |= 0x80u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 2) = self->_evaluationFrequency;
  *((unsigned char *)result + 60) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((void *)result + 3) = self->_historyLength;
  *((unsigned char *)result + 60) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 4) = *(void *)&self->_increaseConsumptionThreshold;
  *((unsigned char *)result + 60) |= 8u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_6:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((void *)result + 1) = *(void *)&self->_decreaseConsumptionThreshold;
  *((unsigned char *)result + 60) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)result + 5) = self->_minimumArticleCount;
  *((unsigned char *)result + 60) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_9;
  }
LABEL_17:
  *((_DWORD *)result + 13) = self->_defaultTopicBin;
  *((unsigned char *)result + 60) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_9:
  *((_DWORD *)result + 12) = self->_defaultChannelBin;
  *((unsigned char *)result + 60) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  $930619314BB491B6042BE465C0200C5C has = self->_has;
  if ((*(_DWORD *)&has & 0x80000000) == 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x80) == 0) {
      goto LABEL_4;
    }
LABEL_44:
    BOOL v6 = 0;
    goto LABEL_45;
  }
  if ((*((unsigned char *)v4 + 60) & 0x80) == 0) {
    goto LABEL_44;
  }
  if (self->_enabled)
  {
    if (!*((unsigned char *)v4 + 56)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 56))
  {
    goto LABEL_44;
  }
LABEL_4:
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_evaluationFrequency != *((void *)v4 + 2)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_historyLength != *((void *)v4 + 3)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_increaseConsumptionThreshold != *((double *)v4 + 4)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_44;
  }
  if (*(unsigned char *)&has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_decreaseConsumptionThreshold != *((double *)v4 + 1)) {
      goto LABEL_44;
    }
  }
  else if (*((unsigned char *)v4 + 60))
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0 || self->_minimumArticleCount != *((void *)v4 + 5)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x40) == 0 || self->_defaultTopicBin != *((_DWORD *)v4 + 13)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x40) != 0)
  {
    goto LABEL_44;
  }
  BOOL v6 = (*((unsigned char *)v4 + 60) & 0x20) == 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x20) == 0 || self->_defaultChannelBin != *((_DWORD *)v4 + 12)) {
      goto LABEL_44;
    }
    BOOL v6 = 1;
  }
LABEL_45:

  return v6;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if (has < 0)
  {
    uint64_t v4 = 2654435761 * self->_enabled;
    if ((*(unsigned char *)&self->_has & 2) == 0)
    {
LABEL_3:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_11:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_12:
      unint64_t v11 = 0;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 2654435761 * self->_evaluationFrequency;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_historyLength;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_5:
  double increaseConsumptionThreshold = self->_increaseConsumptionThreshold;
  double v8 = -increaseConsumptionThreshold;
  if (increaseConsumptionThreshold >= 0.0) {
    double v8 = self->_increaseConsumptionThreshold;
  }
  long double v9 = floor(v8 + 0.5);
  double v10 = (v8 - v9) * 1.84467441e19;
  unint64_t v11 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
  if (v10 >= 0.0)
  {
    if (v10 > 0.0) {
      v11 += (unint64_t)v10;
    }
  }
  else
  {
    v11 -= (unint64_t)fabs(v10);
  }
LABEL_15:
  if (has)
  {
    double decreaseConsumptionThreshold = self->_decreaseConsumptionThreshold;
    double v14 = -decreaseConsumptionThreshold;
    if (decreaseConsumptionThreshold >= 0.0) {
      double v14 = self->_decreaseConsumptionThreshold;
    }
    long double v15 = floor(v14 + 0.5);
    double v16 = (v14 - v15) * 1.84467441e19;
    unint64_t v12 = 2654435761u * (unint64_t)fmod(v15, 1.84467441e19);
    if (v16 >= 0.0)
    {
      if (v16 > 0.0) {
        v12 += (unint64_t)v16;
      }
    }
    else
    {
      v12 -= (unint64_t)fabs(v16);
    }
  }
  else
  {
    unint64_t v12 = 0;
  }
  if ((has & 0x10) == 0)
  {
    uint64_t v17 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_25;
    }
LABEL_28:
    uint64_t v18 = 0;
    if ((has & 0x20) != 0) {
      goto LABEL_26;
    }
LABEL_29:
    uint64_t v19 = 0;
    return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19;
  }
  uint64_t v17 = 2654435761 * self->_minimumArticleCount;
  if ((has & 0x40) == 0) {
    goto LABEL_28;
  }
LABEL_25:
  uint64_t v18 = 2654435761 * self->_defaultTopicBin;
  if ((has & 0x20) == 0) {
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v19 = 2654435761 * self->_defaultChannelBin;
  return v5 ^ v4 ^ v6 ^ v11 ^ v12 ^ v17 ^ v18 ^ v19;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 60);
  if (v5 < 0)
  {
    self->_enabled = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 0x80u;
    char v5 = *((unsigned char *)v4 + 60);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_evaluationFrequency = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_historyLength = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 1) == 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_double increaseConsumptionThreshold = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 1) == 0)
  {
LABEL_6:
    if ((v5 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_double decreaseConsumptionThreshold = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 0x10) == 0)
  {
LABEL_7:
    if ((v5 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  self->_minimumArticleCount = *((void *)v4 + 5);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 0x40) == 0)
  {
LABEL_8:
    if ((v5 & 0x20) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_19:
  self->_defaultTopicBin = *((_DWORD *)v4 + 13);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v4 + 60) & 0x20) != 0)
  {
LABEL_9:
    self->_defaultChannelBin = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_10:
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (int64_t)evaluationFrequency
{
  return self->_evaluationFrequency;
}

- (int64_t)historyLength
{
  return self->_historyLength;
}

- (double)increaseConsumptionThreshold
{
  return self->_increaseConsumptionThreshold;
}

- (double)decreaseConsumptionThreshold
{
  return self->_decreaseConsumptionThreshold;
}

- (int64_t)minimumArticleCount
{
  return self->_minimumArticleCount;
}

@end