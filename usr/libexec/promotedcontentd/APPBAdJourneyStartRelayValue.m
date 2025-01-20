@interface APPBAdJourneyStartRelayValue
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)hasValueBool;
- (BOOL)hasValueDouble;
- (BOOL)hasValueInt;
- (BOOL)hasValueString;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)valueBool;
- (NSString)key;
- (NSString)valueString;
- (double)valueDouble;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)valueAsString:(int)a3;
- (int)StringAsValue:(id)a3;
- (int)value;
- (int64_t)valueInt;
- (unint64_t)hash;
- (void)clearOneofValuesForValue;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setHasValueBool:(BOOL)a3;
- (void)setHasValueDouble:(BOOL)a3;
- (void)setHasValueInt:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setValue:(int)a3;
- (void)setValueBool:(BOOL)a3;
- (void)setValueDouble:(double)a3;
- (void)setValueInt:(int64_t)a3;
- (void)setValueString:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBAdJourneyStartRelayValue

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setValueBool:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 1;
  *(unsigned char *)&self->_has |= 8u;
  self->_valueBool = a3;
}

- (void)setHasValueBool:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasValueBool
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setValueInt:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 2;
  *(unsigned char *)&self->_has |= 2u;
  self->_valueInt = a3;
}

- (void)setHasValueInt:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasValueInt
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setValueDouble:(double)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 3;
  *(unsigned char *)&self->_has |= 1u;
  self->_valueDouble = a3;
}

- (void)setHasValueDouble:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValueDouble
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasValueString
{
  return self->_valueString != 0;
}

- (void)setValueString:(id)a3
{
  v4 = (NSString *)a3;
  [(APPBAdJourneyStartRelayValue *)self clearOneofValuesForValue];
  *(unsigned char *)&self->_has |= 4u;
  self->_value = 4;
  valueString = self->_valueString;
  self->_valueString = v4;
}

- (int)value
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_value;
  }
  else {
    return 0;
  }
}

- (void)setValue:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasValue
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)valueAsString:(int)a3
{
  if (a3 >= 5)
  {
    char v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    char v3 = *(&off_100234DE0 + a3);
  }

  return v3;
}

- (int)StringAsValue:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PBUNSET"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"value_BOOL"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"value_int"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"value_double"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"value_string"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (void)clearOneofValuesForValue
{
  *(unsigned char *)&self->_has &= ~4u;
  self->_value = 0;
  *(unsigned char *)&self->_has &= ~8u;
  self->_valueBool = 0;
  *(unsigned char *)&self->_has &= ~2u;
  self->_valueInt = 0;
  *(unsigned char *)&self->_has &= ~1u;
  self->_valueDouble = 0.0;
  self->_valueString = 0;
  _objc_release_x1();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBAdJourneyStartRelayValue;
  id v3 = [(APPBAdJourneyStartRelayValue *)&v7 description];
  int v4 = [(APPBAdJourneyStartRelayValue *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  int v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = +[NSNumber numberWithBool:self->_valueBool];
    [v4 setObject:v11 forKey:@"value_BOOL"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  v12 = +[NSNumber numberWithLongLong:self->_valueInt];
  [v4 setObject:v12 forKey:@"value_int"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    objc_super v7 = +[NSNumber numberWithDouble:self->_valueDouble];
    [v4 setObject:v7 forKey:@"value_double"];
  }
LABEL_7:
  valueString = self->_valueString;
  if (valueString) {
    [v4 setObject:valueString forKey:@"value_string"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t value = self->_value;
    if (value >= 5)
    {
      v10 = +[NSString stringWithFormat:@"(unknown: %i)", self->_value];
    }
    else
    {
      v10 = *(&off_100234DE0 + value);
    }
    [v4 setObject:v10 forKey:@"value"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBAdJourneyStartRelayValueReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_key)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_5:
      if ((has & 1) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt64Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_6:
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
LABEL_7:
  if (self->_valueString)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[8] = self->_value;
    *((unsigned char *)v4 + 52) |= 4u;
  }
  id v6 = v4;
  if (self->_key)
  {
    [v4 setKey:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_valueBool;
    *((unsigned char *)v4 + 52) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((void *)v4 + 2) = self->_valueInt;
  *((unsigned char *)v4 + 52) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((void *)v4 + 1) = *(void *)&self->_valueDouble;
    *((unsigned char *)v4 + 52) |= 1u;
  }
LABEL_9:
  if (self->_valueString)
  {
    [v6 setValueString:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[8] = self->_value;
    *((unsigned char *)v5 + 52) |= 4u;
  }
  id v7 = [(NSString *)self->_key copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    v6[2] = self->_valueInt;
    *((unsigned char *)v6 + 52) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  *((unsigned char *)v6 + 48) = self->_valueBool;
  *((unsigned char *)v6 + 52) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    v6[1] = *(void *)&self->_valueDouble;
    *((unsigned char *)v6 + 52) |= 1u;
  }
LABEL_7:
  id v10 = [(NSString *)self->_valueString copyWithZone:a3];
  v11 = (void *)v6[5];
  v6[5] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_30;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 4) == 0 || self->_value != *((_DWORD *)v4 + 8)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    goto LABEL_30;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_30;
    }
    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 8) != 0)
    {
      if (self->_valueBool)
      {
        if (!*((unsigned char *)v4 + 48)) {
          goto LABEL_30;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 48)) {
        goto LABEL_18;
      }
    }
LABEL_30:
    unsigned __int8 v8 = 0;
    goto LABEL_31;
  }
  if ((*((unsigned char *)v4 + 52) & 8) != 0) {
    goto LABEL_30;
  }
LABEL_18:
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0 || self->_valueInt != *((void *)v4 + 2)) {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) != 0)
  {
    goto LABEL_30;
  }
  if (has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_valueDouble != *((double *)v4 + 1)) {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_30;
  }
  valueString = self->_valueString;
  if ((unint64_t)valueString | *((void *)v4 + 5)) {
    unsigned __int8 v8 = -[NSString isEqual:](valueString, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_31:

  return v8;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_value;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_13:
    unint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ [(NSString *)self->_valueString hash];
  }
  uint64_t v5 = 2654435761 * self->_valueBool;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_valueInt;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_7:
  double valueDouble = self->_valueDouble;
  double v8 = -valueDouble;
  if (valueDouble >= 0.0) {
    double v8 = self->_valueDouble;
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
  return v4 ^ v3 ^ v5 ^ v6 ^ v11 ^ [(NSString *)self->_valueString hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if ((*((unsigned char *)v4 + 52) & 4) != 0)
  {
    self->_uint64_t value = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[APPBAdJourneyStartRelayValue setKey:](self, "setKey:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if ((v5 & 8) != 0)
  {
    self->_valueBool = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 52);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 52) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_valueInt = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 52))
  {
LABEL_8:
    self->_double valueDouble = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
  if (*((void *)v4 + 5))
  {
    -[APPBAdJourneyStartRelayValue setValueString:](self, "setValueString:");
    id v4 = v6;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (BOOL)valueBool
{
  return self->_valueBool;
}

- (int64_t)valueInt
{
  return self->_valueInt;
}

- (double)valueDouble
{
  return self->_valueDouble;
}

- (NSString)valueString
{
  return self->_valueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueString, 0);

  objc_storeStrong((id *)&self->_key, 0);
}

@end