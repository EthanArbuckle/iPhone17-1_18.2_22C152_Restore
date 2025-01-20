@interface NRPBNumber
- (BOOL)BOOLValue;
- (BOOL)hasBoolValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasFloatValue;
- (BOOL)hasInt32Value;
- (BOOL)hasInt64Value;
- (BOOL)hasIsShortOrChar;
- (BOOL)hasIsUnsigned;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShortOrChar;
- (BOOL)isUnsigned;
- (BOOL)readFrom:(id)a3;
- (double)doubleValue;
- (float)floatValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)int32Value;
- (int64_t)int64Value;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBoolValue:(BOOL)a3;
- (void)setDoubleValue:(double)a3;
- (void)setFloatValue:(float)a3;
- (void)setHasBoolValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasFloatValue:(BOOL)a3;
- (void)setHasInt32Value:(BOOL)a3;
- (void)setHasInt64Value:(BOOL)a3;
- (void)setHasIsShortOrChar:(BOOL)a3;
- (void)setHasIsUnsigned:(BOOL)a3;
- (void)setInt32Value:(int)a3;
- (void)setInt64Value:(int64_t)a3;
- (void)setIsShortOrChar:(BOOL)a3;
- (void)setIsUnsigned:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NRPBNumber

- (void)setInt32Value:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int32Value = a3;
}

- (void)setHasInt32Value:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInt32Value
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setFloatValue:(float)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_floatValue = a3;
}

- (void)setHasFloatValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasFloatValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
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

- (void)setBoolValue:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_BOOLValue = a3;
}

- (void)setHasBoolValue:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasBoolValue
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setInt64Value:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int64Value = a3;
}

- (void)setHasInt64Value:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInt64Value
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsUnsigned:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_isUnsigned = a3;
}

- (void)setHasIsUnsigned:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasIsUnsigned
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setIsShortOrChar:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isShortOrChar = a3;
}

- (void)setHasIsShortOrChar:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsShortOrChar
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NRPBNumber;
  v4 = [(NRPBNumber *)&v8 description];
  v5 = [(NRPBNumber *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_int32Value];
    [v3 setObject:v8 forKey:@"int32Value"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(float *)&double v4 = self->_floatValue;
  v9 = [NSNumber numberWithFloat:v4];
  [v3 setObject:v9 forKey:@"floatValue"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  v10 = [NSNumber numberWithDouble:self->_doubleValue];
  [v3 setObject:v10 forKey:@"doubleValue"];

  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  v11 = [NSNumber numberWithBool:self->_BOOLValue];
  [v3 setObject:v11 forKey:@"BOOLValue"];

  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  v12 = [NSNumber numberWithLongLong:self->_int64Value];
  [v3 setObject:v12 forKey:@"int64Value"];

  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  v13 = [NSNumber numberWithBool:self->_isUnsigned];
  [v3 setObject:v13 forKey:@"isUnsigned"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    v6 = [NSNumber numberWithBool:self->_isShortOrChar];
    [v3 setObject:v6 forKey:@"isShortOrChar"];
  }
LABEL_9:

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NRPBNumberReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  PBDataWriterWriteDoubleField();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_8:
  }
    PBDataWriterWriteBOOLField();
LABEL_9:
}

- (void)copyTo:(id)a3
{
  double v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[7] = self->_int32Value;
    *((unsigned char *)v4 + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[6] = LODWORD(self->_floatValue);
  *((unsigned char *)v4 + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)v4 + 1) = *(void *)&self->_doubleValue;
  *((unsigned char *)v4 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  *((unsigned char *)v4 + 32) = self->_BOOLValue;
  *((unsigned char *)v4 + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  *((void *)v4 + 2) = self->_int64Value;
  *((unsigned char *)v4 + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  *((unsigned char *)v4 + 34) = self->_isUnsigned;
  *((unsigned char *)v4 + 36) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *((unsigned char *)v4 + 33) = self->_isShortOrChar;
    *((unsigned char *)v4 + 36) |= 0x20u;
  }
LABEL_9:
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)result + 7) = self->_int32Value;
    *((unsigned char *)result + 36) |= 8u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 6) = LODWORD(self->_floatValue);
  *((unsigned char *)result + 36) |= 4u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  *((void *)result + 1) = *(void *)&self->_doubleValue;
  *((unsigned char *)result + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  *((unsigned char *)result + 32) = self->_BOOLValue;
  *((unsigned char *)result + 36) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  *((void *)result + 2) = self->_int64Value;
  *((unsigned char *)result + 36) |= 2u;
  char has = (char)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 0x20) == 0) {
      return result;
    }
    goto LABEL_8;
  }
LABEL_15:
  *((unsigned char *)result + 34) = self->_isUnsigned;
  *((unsigned char *)result + 36) |= 0x40u;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    return result;
  }
LABEL_8:
  *((unsigned char *)result + 33) = self->_isShortOrChar;
  *((unsigned char *)result + 36) |= 0x20u;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 8) == 0 || self->_int32Value != *((_DWORD *)v4 + 7)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 8) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 4) == 0 || self->_floatValue != *((float *)v4 + 6)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) != 0)
  {
    goto LABEL_40;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_40;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x10) == 0) {
      goto LABEL_40;
    }
    if (self->_BOOLValue)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x10) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0 || self->_int64Value != *((void *)v4 + 2)) {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 2) != 0)
  {
    goto LABEL_40;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x40) == 0) {
      goto LABEL_40;
    }
    if (self->_isUnsigned)
    {
      if (!*((unsigned char *)v4 + 34)) {
        goto LABEL_40;
      }
    }
    else if (*((unsigned char *)v4 + 34))
    {
      goto LABEL_40;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 0x40) != 0)
  {
    goto LABEL_40;
  }
  BOOL v5 = (*((unsigned char *)v4 + 36) & 0x20) == 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
    {
      if (self->_isShortOrChar)
      {
        if (!*((unsigned char *)v4 + 33)) {
          goto LABEL_40;
        }
      }
      else if (*((unsigned char *)v4 + 33))
      {
        goto LABEL_40;
      }
      BOOL v5 = 1;
      goto LABEL_41;
    }
LABEL_40:
    BOOL v5 = 0;
  }
LABEL_41:

  return v5;
}

- (unint64_t)hash
{
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v4 = 2654435761 * self->_int32Value;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v9 = 0;
    goto LABEL_11;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float floatValue = self->_floatValue;
  float v6 = -floatValue;
  if (floatValue >= 0.0) {
    float v6 = self->_floatValue;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
LABEL_11:
  if (has)
  {
    double doubleValue = self->_doubleValue;
    double v12 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v12 = self->_doubleValue;
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
  if ((has & 0x10) != 0)
  {
    uint64_t v15 = 2654435761 * self->_BOOLValue;
    if ((has & 2) != 0)
    {
LABEL_21:
      uint64_t v16 = 2654435761 * self->_int64Value;
      if ((has & 0x40) != 0) {
        goto LABEL_22;
      }
LABEL_26:
      uint64_t v17 = 0;
      if ((has & 0x20) != 0) {
        goto LABEL_23;
      }
LABEL_27:
      uint64_t v18 = 0;
      return v9 ^ v4 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if ((has & 2) != 0) {
      goto LABEL_21;
    }
  }
  uint64_t v16 = 0;
  if ((has & 0x40) == 0) {
    goto LABEL_26;
  }
LABEL_22:
  uint64_t v17 = 2654435761 * self->_isUnsigned;
  if ((has & 0x20) == 0) {
    goto LABEL_27;
  }
LABEL_23:
  uint64_t v18 = 2654435761 * self->_isShortOrChar;
  return v9 ^ v4 ^ v10 ^ v15 ^ v16 ^ v17 ^ v18;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 8) != 0)
  {
    self->_int32Value = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 36);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_float floatValue = *((float *)v4 + 6);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  self->_double doubleValue = *((double *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x10) == 0)
  {
LABEL_5:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  self->_BOOLValue = *((unsigned char *)v4 + 32);
  *(unsigned char *)&self->_has |= 0x10u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) == 0)
  {
LABEL_6:
    if ((v5 & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  self->_int64Value = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 0x40) == 0)
  {
LABEL_7:
    if ((v5 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_17:
  self->_isUnsigned = *((unsigned char *)v4 + 34);
  *(unsigned char *)&self->_has |= 0x40u;
  if ((*((unsigned char *)v4 + 36) & 0x20) != 0)
  {
LABEL_8:
    self->_isShortOrChar = *((unsigned char *)v4 + 33);
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_9:
}

- (int)int32Value
{
  return self->_int32Value;
}

- (float)floatValue
{
  return self->_floatValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (BOOL)BOOLValue
{
  return self->_BOOLValue;
}

- (int64_t)int64Value
{
  return self->_int64Value;
}

- (BOOL)isUnsigned
{
  return self->_isUnsigned;
}

- (BOOL)isShortOrChar
{
  return self->_isShortOrChar;
}

@end