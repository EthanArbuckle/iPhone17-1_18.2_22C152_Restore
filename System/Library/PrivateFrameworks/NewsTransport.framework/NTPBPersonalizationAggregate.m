@interface NTPBPersonalizationAggregate
- (BOOL)hasClicks;
- (BOOL)hasEventCount;
- (BOOL)hasFeatureKey;
- (BOOL)hasImpressions;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)featureKey;
- (double)clicks;
- (double)impressions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)eventCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setClicks:(double)a3;
- (void)setEventCount:(unint64_t)a3;
- (void)setFeatureKey:(id)a3;
- (void)setHasClicks:(BOOL)a3;
- (void)setHasEventCount:(BOOL)a3;
- (void)setHasImpressions:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setImpressions:(double)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationAggregate

- (void)dealloc
{
  [(NTPBPersonalizationAggregate *)self setFeatureKey:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregate;
  [(NTPBPersonalizationAggregate *)&v3 dealloc];
}

- (void)setFeatureKey:(id)a3
{
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationAggregateReadFrom((uint64_t)self, (uint64_t)a3);
}

- (double)impressions
{
  return self->_impressions;
}

- (double)clicks
{
  return self->_clicks;
}

- (void)setImpressions:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_impressions = a3;
}

- (void)setClicks:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_clicks = a3;
}

- (void)writeTo:(id)a3
{
  if (self->_featureKey) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_10:
      PBDataWriterWriteUint64Field();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteUint64Field();
}

- (BOOL)hasFeatureKey
{
  return self->_featureKey != 0;
}

- (void)setHasClicks:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasClicks
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasImpressions:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasImpressions
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setEventCount:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventCount = a3;
}

- (void)setHasEventCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregate;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizationAggregate description](&v3, sel_description), -[NTPBPersonalizationAggregate dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  featureKey = self->_featureKey;
  if (featureKey) {
    [v3 setObject:featureKey forKey:@"feature_key"];
  }
  char has = (char)self->_has;
  if (has)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_clicks), @"clicks");
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_eventCount), @"event_count");
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v4;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_impressions), @"impressions");
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 8) != 0) {
LABEL_7:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestamp), @"timestamp");
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 40) = [(NSString *)self->_featureKey copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_clicks;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(void *)(v5 + 16) = self->_eventCount;
      *(unsigned char *)(v5 + 48) |= 2u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(double *)(v5 + 24) = self->_impressions;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    featureKey = self->_featureKey;
    if (!((unint64_t)featureKey | *((void *)a3 + 5))
      || (int v5 = -[NSString isEqual:](featureKey, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_clicks != *((double *)a3 + 1)) {
          goto LABEL_23;
        }
      }
      else if (*((unsigned char *)a3 + 48))
      {
LABEL_23:
        LOBYTE(v5) = 0;
        return v5;
      }
      if ((*(unsigned char *)&self->_has & 4) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 4) == 0 || self->_impressions != *((double *)a3 + 3)) {
          goto LABEL_23;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 4) != 0)
      {
        goto LABEL_23;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_eventCount != *((void *)a3 + 2)) {
          goto LABEL_23;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 2) != 0)
      {
        goto LABEL_23;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 8) == 0;
      if ((*(unsigned char *)&self->_has & 8) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
          goto LABEL_23;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_featureKey hash];
  char has = (char)self->_has;
  if (has)
  {
    double clicks = self->_clicks;
    double v7 = -clicks;
    if (clicks >= 0.0) {
      double v7 = self->_clicks;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  if ((has & 4) != 0)
  {
    double impressions = self->_impressions;
    double v12 = -impressions;
    if (impressions >= 0.0) {
      double v12 = self->_impressions;
    }
    long double v13 = floor(v12 + 0.5);
    double v14 = (v12 - v13) * 1.84467441e19;
    unint64_t v10 = 2654435761u * (unint64_t)fmod(v13, 1.84467441e19);
    if (v14 >= 0.0)
    {
      if (v14 > 0.0) {
        v10 += (unint64_t)v14;
      }
    }
    else
    {
      v10 -= (unint64_t)fabs(v14);
    }
  }
  else
  {
    unint64_t v10 = 0;
  }
  if ((has & 2) != 0)
  {
    unint64_t v15 = 2654435761u * self->_eventCount;
    if ((has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_21:
    unint64_t v16 = 0;
    return v5 ^ v3 ^ v10 ^ v15 ^ v16;
  }
  unint64_t v15 = 0;
  if ((has & 8) == 0) {
    goto LABEL_21;
  }
LABEL_19:
  unint64_t v16 = 2654435761u * self->_timestamp;
  return v5 ^ v3 ^ v10 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 5)) {
    -[NTPBPersonalizationAggregate setFeatureKey:](self, "setFeatureKey:");
  }
  char v5 = *((unsigned char *)a3 + 48);
  if (v5)
  {
    self->_double clicks = *((double *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 48);
    if ((v5 & 4) == 0)
    {
LABEL_5:
      if ((v5 & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 48) & 4) == 0)
  {
    goto LABEL_5;
  }
  self->_double impressions = *((double *)a3 + 3);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 48);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  self->_eventCount = *((void *)a3 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 48) & 8) == 0) {
    return;
  }
LABEL_7:
  self->_timestamp = *((void *)a3 + 4);
  *(unsigned char *)&self->_has |= 8u;
}

- (NSString)featureKey
{
  return self->_featureKey;
}

@end