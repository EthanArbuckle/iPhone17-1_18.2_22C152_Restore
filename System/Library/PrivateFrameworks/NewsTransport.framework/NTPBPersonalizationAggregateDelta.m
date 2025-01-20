@interface NTPBPersonalizationAggregateDelta
- (BOOL)hasDefaultClicks;
- (BOOL)hasDefaultImpressions;
- (BOOL)hasFeatureKey;
- (BOOL)hasGroupBias;
- (BOOL)hasImpressionBias;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)featureKey;
- (double)defaultClicks;
- (double)defaultImpressions;
- (double)groupBias;
- (double)impressionBias;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)eventsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)events;
- (unsigned)eventsAtIndex:(unint64_t)a3;
- (void)addEvents:(unsigned int)a3;
- (void)clearEvents;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDefaultClicks:(double)a3;
- (void)setDefaultImpressions:(double)a3;
- (void)setEvents:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setFeatureKey:(id)a3;
- (void)setGroupBias:(double)a3;
- (void)setHasDefaultClicks:(BOOL)a3;
- (void)setHasDefaultImpressions:(BOOL)a3;
- (void)setHasGroupBias:(BOOL)a3;
- (void)setHasImpressionBias:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setImpressionBias:(double)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPersonalizationAggregateDelta

- (void)dealloc
{
  [(NTPBPersonalizationAggregateDelta *)self setFeatureKey:0];
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregateDelta;
  [(NTPBPersonalizationAggregateDelta *)&v3 dealloc];
}

- (BOOL)hasFeatureKey
{
  return self->_featureKey != 0;
}

- (void)setDefaultClicks:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_defaultClicks = a3;
}

- (void)setHasDefaultClicks:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDefaultClicks
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setDefaultImpressions:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_defaultImpressions = a3;
}

- (void)setHasDefaultImpressions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDefaultImpressions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)eventsCount
{
  return self->_events.count;
}

- (unsigned)events
{
  return self->_events.list;
}

- (void)clearEvents
{
}

- (void)addEvents:(unsigned int)a3
{
}

- (unsigned)eventsAtIndex:(unint64_t)a3
{
  p_events = &self->_events;
  unint64_t count = self->_events.count;
  if (count <= a3) {
    [(id)objc_msgSend(MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578], objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_events->list[a3];
}

- (void)setEvents:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setImpressionBias:(double)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_impressionBias = a3;
}

- (void)setHasImpressionBias:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasImpressionBias
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setGroupBias:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_groupBias = a3;
}

- (void)setHasGroupBias:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasGroupBias
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPersonalizationAggregateDelta;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPersonalizationAggregateDelta description](&v3, sel_description), -[NTPBPersonalizationAggregateDelta dictionaryRepresentation](self, "dictionaryRepresentation")];
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
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_defaultClicks), @"default_clicks");
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_defaultImpressions), @"default_impressions");
  }
  [v4 setObject:PBRepeatedUInt32NSArray() forKey:@"events"];
  char v7 = (char)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_impressionBias), @"impression_bias");
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return v4;
    }
    goto LABEL_10;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_timestamp), @"timestamp");
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((v7 & 4) != 0) {
LABEL_10:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithDouble:", self->_groupBias), @"group_bias");
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPersonalizationAggregateDeltaReadFrom((uint64_t)self, (uint64_t)a3);
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
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_events.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_events.count);
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_12;
    }
LABEL_15:
    PBDataWriterWriteDoubleField();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_16;
  }
  PBDataWriterWriteUint64Field();
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0) {
    goto LABEL_15;
  }
LABEL_12:
  if ((v6 & 4) == 0) {
    return;
  }
LABEL_16:

  PBDataWriterWriteDoubleField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 72) = [(NSString *)self->_featureKey copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 32) = self->_defaultClicks;
    *(unsigned char *)(v5 + 80) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(double *)(v5 + 40) = self->_defaultImpressions;
    *(unsigned char *)(v5 + 80) |= 2u;
  }
  PBRepeatedUInt32Copy();
  char v7 = (char)self->_has;
  if ((v7 & 0x10) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_7;
    }
LABEL_11:
    *(double *)(v5 + 56) = self->_impressionBias;
    *(unsigned char *)(v5 + 80) |= 8u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v5;
    }
    goto LABEL_8;
  }
  *(void *)(v5 + 64) = self->_timestamp;
  *(unsigned char *)(v5 + 80) |= 0x10u;
  char v7 = (char)self->_has;
  if ((v7 & 8) != 0) {
    goto LABEL_11;
  }
LABEL_7:
  if ((v7 & 4) != 0)
  {
LABEL_8:
    *(double *)(v5 + 48) = self->_groupBias;
    *(unsigned char *)(v5 + 80) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    featureKey = self->_featureKey;
    if (!((unint64_t)featureKey | *((void *)a3 + 9))
      || (int IsEqual = -[NSString isEqual:](featureKey, "isEqual:")) != 0)
    {
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 80) & 1) == 0 || self->_defaultClicks != *((double *)a3 + 4)) {
          goto LABEL_29;
        }
      }
      else if (*((unsigned char *)a3 + 80))
      {
LABEL_29:
        LOBYTE(IsEqual) = 0;
        return IsEqual;
      }
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 80) & 2) == 0 || self->_defaultImpressions != *((double *)a3 + 5)) {
          goto LABEL_29;
        }
      }
      else if ((*((unsigned char *)a3 + 80) & 2) != 0)
      {
        goto LABEL_29;
      }
      int IsEqual = PBRepeatedUInt32IsEqual();
      if (IsEqual)
      {
        if ((*(unsigned char *)&self->_has & 0x10) != 0)
        {
          if ((*((unsigned char *)a3 + 80) & 0x10) == 0 || self->_timestamp != *((void *)a3 + 8)) {
            goto LABEL_29;
          }
        }
        else if ((*((unsigned char *)a3 + 80) & 0x10) != 0)
        {
          goto LABEL_29;
        }
        if ((*(unsigned char *)&self->_has & 8) != 0)
        {
          if ((*((unsigned char *)a3 + 80) & 8) == 0 || self->_impressionBias != *((double *)a3 + 7)) {
            goto LABEL_29;
          }
        }
        else if ((*((unsigned char *)a3 + 80) & 8) != 0)
        {
          goto LABEL_29;
        }
        LOBYTE(IsEqual) = (*((unsigned char *)a3 + 80) & 4) == 0;
        if ((*(unsigned char *)&self->_has & 4) != 0)
        {
          if ((*((unsigned char *)a3 + 80) & 4) == 0 || self->_groupBias != *((double *)a3 + 6)) {
            goto LABEL_29;
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
  NSUInteger v3 = [(NSString *)self->_featureKey hash];
  char has = (char)self->_has;
  if (has)
  {
    double defaultClicks = self->_defaultClicks;
    double v7 = -defaultClicks;
    if (defaultClicks >= 0.0) {
      double v7 = self->_defaultClicks;
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
  if ((has & 2) != 0)
  {
    double defaultImpressions = self->_defaultImpressions;
    double v12 = -defaultImpressions;
    if (defaultImpressions >= 0.0) {
      double v12 = self->_defaultImpressions;
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
  uint64_t v15 = PBRepeatedUInt32Hash();
  char v16 = (char)self->_has;
  if ((v16 & 0x10) != 0)
  {
    unint64_t v17 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_19;
    }
LABEL_24:
    unint64_t v22 = 0;
    goto LABEL_27;
  }
  unint64_t v17 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_24;
  }
LABEL_19:
  double impressionBias = self->_impressionBias;
  double v19 = -impressionBias;
  if (impressionBias >= 0.0) {
    double v19 = self->_impressionBias;
  }
  long double v20 = floor(v19 + 0.5);
  double v21 = (v19 - v20) * 1.84467441e19;
  unint64_t v22 = 2654435761u * (unint64_t)fmod(v20, 1.84467441e19);
  if (v21 >= 0.0)
  {
    if (v21 > 0.0) {
      v22 += (unint64_t)v21;
    }
  }
  else
  {
    v22 -= (unint64_t)fabs(v21);
  }
LABEL_27:
  if ((v16 & 4) != 0)
  {
    double groupBias = self->_groupBias;
    double v25 = -groupBias;
    if (groupBias >= 0.0) {
      double v25 = self->_groupBias;
    }
    long double v26 = floor(v25 + 0.5);
    double v27 = (v25 - v26) * 1.84467441e19;
    unint64_t v23 = 2654435761u * (unint64_t)fmod(v26, 1.84467441e19);
    if (v27 >= 0.0)
    {
      if (v27 > 0.0) {
        v23 += (unint64_t)v27;
      }
    }
    else
    {
      v23 -= (unint64_t)fabs(v27);
    }
  }
  else
  {
    unint64_t v23 = 0;
  }
  return v5 ^ v3 ^ v10 ^ v15 ^ v17 ^ v22 ^ v23;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 9)) {
    -[NTPBPersonalizationAggregateDelta setFeatureKey:](self, "setFeatureKey:");
  }
  char v5 = *((unsigned char *)a3 + 80);
  if (v5)
  {
    self->_double defaultClicks = *((double *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 80);
  }
  if ((v5 & 2) != 0)
  {
    self->_double defaultImpressions = *((double *)a3 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v6 = [a3 eventsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[NTPBPersonalizationAggregateDelta addEvents:](self, "addEvents:", [a3 eventsAtIndex:i]);
  }
  char v9 = *((unsigned char *)a3 + 80);
  if ((v9 & 0x10) != 0)
  {
    self->_timestamp = *((void *)a3 + 8);
    *(unsigned char *)&self->_has |= 0x10u;
    char v9 = *((unsigned char *)a3 + 80);
    if ((v9 & 8) == 0)
    {
LABEL_12:
      if ((v9 & 4) == 0) {
        return;
      }
      goto LABEL_13;
    }
  }
  else if ((*((unsigned char *)a3 + 80) & 8) == 0)
  {
    goto LABEL_12;
  }
  self->_double impressionBias = *((double *)a3 + 7);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 80) & 4) == 0) {
    return;
  }
LABEL_13:
  self->_double groupBias = *((double *)a3 + 6);
  *(unsigned char *)&self->_has |= 4u;
}

- (NSString)featureKey
{
  return self->_featureKey;
}

- (void)setFeatureKey:(id)a3
{
}

- (double)defaultClicks
{
  return self->_defaultClicks;
}

- (double)defaultImpressions
{
  return self->_defaultImpressions;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (double)impressionBias
{
  return self->_impressionBias;
}

- (double)groupBias
{
  return self->_groupBias;
}

@end