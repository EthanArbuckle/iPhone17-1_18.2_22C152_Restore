@interface PeoplePredictionDataFeatureValue
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntValue;
- (BOOL)hasStringValue;
- (BOOL)hasTimeBucketValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)timeBucketValueAsString:(int)a3;
- (int)StringAsTimeBucketValue:(id)a3;
- (int)timeBucketValue;
- (unint64_t)hash;
- (unsigned)intValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntValue:(BOOL)a3;
- (void)setHasTimeBucketValue:(BOOL)a3;
- (void)setIntValue:(unsigned int)a3;
- (void)setStringValue:(id)a3;
- (void)setTimeBucketValue:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeoplePredictionDataFeatureValue

- (void)setIntValue:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_intValue = a3;
}

- (void)setHasIntValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (int)timeBucketValue
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_timeBucketValue;
  }
  else {
    return 0;
  }
}

- (void)setTimeBucketValue:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_timeBucketValue = a3;
}

- (void)setHasTimeBucketValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTimeBucketValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)timeBucketValueAsString:(int)a3
{
  if (a3 >= 0x17)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_26543EF70[a3];
  }
  return v3;
}

- (int)StringAsTimeBucketValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"TimeBucketUnknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LessThan2Mins"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LessThan5Mins"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"LessThan10Mins"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"LessThan30Mins"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"LessThan1Hr"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"LessThan2Hrs"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"LessThan4Hrs"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"LessThan6Hrs"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"LessThan12Hrs"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"LessThan24Hrs"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"LessThan2Days"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"LessThan3Days"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"LessThan4Days"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"LessThan5Days"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"LessThan6Days"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"LessThan1Week"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"LessThan1Month"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"LessThan3Month"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"LessThan6Month"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"LessThan1Year"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"LessThan5Years"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"Other"])
  {
    int v4 = 22;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeoplePredictionDataFeatureValue;
  int v4 = [(PeoplePredictionDataFeatureValue *)&v8 description];
  v5 = [(PeoplePredictionDataFeatureValue *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_intValue];
    [v3 setObject:v5 forKey:@"intValue"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithDouble:self->_doubleValue];
    [v3 setObject:v6 forKey:@"doubleValue"];
  }
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"stringValue"];
  }
  char v8 = (char)self->_has;
  if ((v8 & 8) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_BOOLValue];
    [v3 setObject:v9 forKey:@"BOOLValue"];

    char v8 = (char)self->_has;
  }
  if ((v8 & 4) != 0)
  {
    uint64_t timeBucketValue = self->_timeBucketValue;
    if (timeBucketValue >= 0x17)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_timeBucketValue);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = off_26543EF70[timeBucketValue];
    }
    [v3 setObject:v11 forKey:@"timeBucketValue"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataFeatureValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_stringValue) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[4] = self->_intValue;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_stringValue)
  {
    v7 = v4;
    objc_msgSend(v4, "setStringValue:");
    int v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 8) != 0)
  {
    *((unsigned char *)v4 + 36) = self->_BOOLValue;
    *((unsigned char *)v4 + 40) |= 8u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 4) != 0)
  {
    v4[8] = self->_timeBucketValue;
    *((unsigned char *)v4 + 40) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 16) = self->_intValue;
    *(unsigned char *)(v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(double *)(v5 + 8) = self->_doubleValue;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_stringValue copyWithZone:a3];
  v9 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v8;

  char v10 = (char)self->_has;
  if ((v10 & 8) != 0)
  {
    *(unsigned char *)(v6 + 36) = self->_BOOLValue;
    *(unsigned char *)(v6 + 40) |= 8u;
    char v10 = (char)self->_has;
  }
  if ((v10 & 4) != 0)
  {
    *(_DWORD *)(v6 + 32) = self->_timeBucketValue;
    *(unsigned char *)(v6 + 40) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_27;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_intValue != *((_DWORD *)v4 + 4)) {
      goto LABEL_27;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_27;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_27;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_27;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_27;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 8) != 0)
    {
      if (self->_BOOLValue)
      {
        if (!*((unsigned char *)v4 + 36)) {
          goto LABEL_27;
        }
        goto LABEL_23;
      }
      if (!*((unsigned char *)v4 + 36)) {
        goto LABEL_23;
      }
    }
LABEL_27:
    BOOL v7 = 0;
    goto LABEL_28;
  }
  if ((*((unsigned char *)v4 + 40) & 8) != 0) {
    goto LABEL_27;
  }
LABEL_23:
  BOOL v7 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_timeBucketValue != *((_DWORD *)v4 + 8)) {
      goto LABEL_27;
    }
    BOOL v7 = 1;
  }
LABEL_28:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_intValue;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double doubleValue = self->_doubleValue;
  double v5 = -doubleValue;
  if (doubleValue >= 0.0) {
    double v5 = self->_doubleValue;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmod(v6, 1.84467441e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabs(v7);
  }
LABEL_11:
  NSUInteger v9 = [(NSString *)self->_stringValue hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v10 = 2654435761 * self->_BOOLValue;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v8 ^ v3 ^ v10 ^ v11 ^ v9;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_timeBucketValue;
  return v8 ^ v3 ^ v10 ^ v11 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_intValue = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    id v7 = v4;
    -[PeoplePredictionDataFeatureValue setStringValue:](self, "setStringValue:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 40);
  if ((v6 & 8) != 0)
  {
    self->_BOOLValue = *((unsigned char *)v4 + 36);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 40);
  }
  if ((v6 & 4) != 0)
  {
    self->_uint64_t timeBucketValue = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (unsigned)intValue
{
  return self->_intValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)setStringValue:(id)a3
{
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (void).cxx_destruct
{
}

@end