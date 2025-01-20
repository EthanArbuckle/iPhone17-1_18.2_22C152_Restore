@interface NTPBIAdConfig
- (BOOL)hasSegmentsEnabled;
- (BOOL)hasSegmentsHistoryWindowInterval;
- (BOOL)hasSegmentsMinimumArticleCount;
- (BOOL)hasSegmentsSubmissionFrequency;
- (BOOL)hasSegmentsThreshold;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)segmentsEnabled;
- (double)segmentsThreshold;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)segmentsHistoryWindowInterval;
- (int64_t)segmentsMinimumArticleCount;
- (int64_t)segmentsSubmissionFrequency;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasSegmentsEnabled:(BOOL)a3;
- (void)setHasSegmentsHistoryWindowInterval:(BOOL)a3;
- (void)setHasSegmentsMinimumArticleCount:(BOOL)a3;
- (void)setHasSegmentsSubmissionFrequency:(BOOL)a3;
- (void)setHasSegmentsThreshold:(BOOL)a3;
- (void)setSegmentsEnabled:(BOOL)a3;
- (void)setSegmentsHistoryWindowInterval:(int64_t)a3;
- (void)setSegmentsMinimumArticleCount:(int64_t)a3;
- (void)setSegmentsSubmissionFrequency:(int64_t)a3;
- (void)setSegmentsThreshold:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBIAdConfig

- (void)setSegmentsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_segmentsEnabled = a3;
}

- (void)setHasSegmentsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasSegmentsEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setSegmentsThreshold:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_segmentsThreshold = a3;
}

- (void)setHasSegmentsThreshold:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSegmentsThreshold
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setSegmentsSubmissionFrequency:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_segmentsSubmissionFrequency = a3;
}

- (void)setHasSegmentsSubmissionFrequency:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSegmentsSubmissionFrequency
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSegmentsHistoryWindowInterval:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_segmentsHistoryWindowInterval = a3;
}

- (void)setHasSegmentsHistoryWindowInterval:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSegmentsHistoryWindowInterval
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSegmentsMinimumArticleCount:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_segmentsMinimumArticleCount = a3;
}

- (void)setHasSegmentsMinimumArticleCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSegmentsMinimumArticleCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBIAdConfig;
  v4 = [(NTPBIAdConfig *)&v8 description];
  v5 = [(NTPBIAdConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v7 = [NSNumber numberWithBool:self->_segmentsEnabled];
    [v3 setObject:v7 forKey:@"segments_enabled"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  objc_super v8 = [NSNumber numberWithDouble:self->_segmentsThreshold];
  [v3 setObject:v8 forKey:@"segments_threshold"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  v9 = [NSNumber numberWithLongLong:self->_segmentsSubmissionFrequency];
  [v3 setObject:v9 forKey:@"segments_submission_frequency"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  v10 = [NSNumber numberWithLongLong:self->_segmentsHistoryWindowInterval];
  [v3 setObject:v10 forKey:@"segments_history_window_interval"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    v5 = [NSNumber numberWithLongLong:self->_segmentsMinimumArticleCount];
    [v3 setObject:v5 forKey:@"segments_minimum_article_count"];
  }
LABEL_7:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBIAdConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_6:
  }
    PBDataWriterWriteInt64Field();
LABEL_7:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    *((unsigned char *)result + 40) = self->_segmentsEnabled;
    *((unsigned char *)result + 44) |= 0x10u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *((void *)result + 4) = *(void *)&self->_segmentsThreshold;
  *((unsigned char *)result + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  *((void *)result + 3) = self->_segmentsSubmissionFrequency;
  *((unsigned char *)result + 44) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_6;
  }
LABEL_11:
  *((void *)result + 1) = self->_segmentsHistoryWindowInterval;
  *((unsigned char *)result + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_6:
  *((void *)result + 2) = self->_segmentsMinimumArticleCount;
  *((unsigned char *)result + 44) |= 2u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 0x10) != 0)
    {
      if (self->_segmentsEnabled)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_29;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_10;
      }
    }
LABEL_29:
    BOOL v5 = 0;
    goto LABEL_30;
  }
  if ((*((unsigned char *)v4 + 44) & 0x10) != 0) {
    goto LABEL_29;
  }
LABEL_10:
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0 || self->_segmentsThreshold != *((double *)v4 + 4)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_29;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_segmentsSubmissionFrequency != *((void *)v4 + 3)) {
      goto LABEL_29;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_29;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_segmentsHistoryWindowInterval != *((void *)v4 + 1)) {
      goto LABEL_29;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_29;
  }
  BOOL v5 = (*((unsigned char *)v4 + 44) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_segmentsMinimumArticleCount != *((void *)v4 + 2)) {
      goto LABEL_29;
    }
    BOOL v5 = 1;
  }
LABEL_30:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    uint64_t v4 = 2654435761 * self->_segmentsEnabled;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double segmentsThreshold = self->_segmentsThreshold;
  double v6 = -segmentsThreshold;
  if (segmentsThreshold >= 0.0) {
    double v6 = self->_segmentsThreshold;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmod(v7, 1.84467441e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabs(v8);
  }
LABEL_11:
  if ((has & 4) == 0)
  {
    uint64_t v10 = 0;
    if (has) {
      goto LABEL_13;
    }
LABEL_16:
    uint64_t v11 = 0;
    if ((has & 2) != 0) {
      goto LABEL_14;
    }
LABEL_17:
    uint64_t v12 = 0;
    return v9 ^ v4 ^ v10 ^ v11 ^ v12;
  }
  uint64_t v10 = 2654435761 * self->_segmentsSubmissionFrequency;
  if ((has & 1) == 0) {
    goto LABEL_16;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_segmentsHistoryWindowInterval;
  if ((has & 2) == 0) {
    goto LABEL_17;
  }
LABEL_14:
  uint64_t v12 = 2654435761 * self->_segmentsMinimumArticleCount;
  return v9 ^ v4 ^ v10 ^ v11 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 0x10) != 0)
  {
    self->_segmentsEnabled = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 0x10u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 8) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) == 0)
  {
    goto LABEL_3;
  }
  self->_double segmentsThreshold = *((double *)v4 + 4);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  self->_segmentsSubmissionFrequency = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  self->_segmentsHistoryWindowInterval = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_6:
    self->_segmentsMinimumArticleCount = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_7:
}

- (BOOL)segmentsEnabled
{
  return self->_segmentsEnabled;
}

- (double)segmentsThreshold
{
  return self->_segmentsThreshold;
}

- (int64_t)segmentsSubmissionFrequency
{
  return self->_segmentsSubmissionFrequency;
}

- (int64_t)segmentsHistoryWindowInterval
{
  return self->_segmentsHistoryWindowInterval;
}

- (int64_t)segmentsMinimumArticleCount
{
  return self->_segmentsMinimumArticleCount;
}

@end