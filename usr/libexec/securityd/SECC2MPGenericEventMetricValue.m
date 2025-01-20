@interface SECC2MPGenericEventMetricValue
- (BOOL)hasDateValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasErrorValue;
- (BOOL)hasStringValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)stringValue;
- (SECC2MPError)errorValue;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)dateValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDateValue:(unint64_t)a3;
- (void)setDoubleValue:(double)a3;
- (void)setErrorValue:(id)a3;
- (void)setHasDateValue:(BOOL)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setStringValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPGenericEventMetricValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stringValue, 0);

  objc_storeStrong((id *)&self->_errorValue, 0);
}

- (void)setErrorValue:(id)a3
{
}

- (SECC2MPError)errorValue
{
  return self->_errorValue;
}

- (unint64_t)dateValue
{
  return self->_dateValue;
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (void)setStringValue:(id)a3
{
}

- (NSString)stringValue
{
  return self->_stringValue;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 4))
  {
    -[SECC2MPGenericEventMetricValue setStringValue:](self, "setStringValue:");
    id v4 = v8;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_doubleValue = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if (v5)
  {
    self->_dateValue = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  errorValue = self->_errorValue;
  uint64_t v7 = *((void *)v4 + 3);
  if (errorValue)
  {
    if (v7) {
      -[SECC2MPError mergeFrom:](errorValue, "mergeFrom:");
    }
  }
  else if (v7)
  {
    -[SECC2MPGenericEventMetricValue setErrorValue:](self, "setErrorValue:");
  }

  _objc_release_x1();
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_stringValue hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double doubleValue = self->_doubleValue;
    double v7 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v7 = self->_doubleValue;
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
  if (has) {
    unint64_t v10 = 2654435761u * self->_dateValue;
  }
  else {
    unint64_t v10 = 0;
  }
  return v5 ^ v3 ^ v10 ^ [(SECC2MPError *)self->_errorValue hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  stringValue = self->_stringValue;
  if ((unint64_t)stringValue | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](stringValue, "isEqual:")) {
      goto LABEL_16;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_doubleValue != *((double *)v4 + 2)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
LABEL_16:
    unsigned __int8 v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_dateValue != *((void *)v4 + 1)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_16;
  }
  errorValue = self->_errorValue;
  if ((unint64_t)errorValue | *((void *)v4 + 3)) {
    unsigned __int8 v7 = -[SECC2MPError isEqual:](errorValue, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_17:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSString *)self->_stringValue copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[4];
  v5[4] = v6;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5[2] = *(void *)&self->_doubleValue;
    *((unsigned char *)v5 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = self->_dateValue;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v9 = [(SECC2MPError *)self->_errorValue copyWithZone:a3];
  unint64_t v10 = (void *)v5[3];
  v5[3] = v9;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    [v4 setStringValue:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_dateValue;
    *((unsigned char *)v4 + 40) |= 1u;
  }
  if (self->_errorValue)
  {
    [v6 setErrorValue:];
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_stringValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_errorValue)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_100088D84((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  stringValue = self->_stringValue;
  if (stringValue) {
    [v3 setObject:stringValue forKey:@"string_value"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned __int8 v7 = +[NSNumber numberWithDouble:self->_doubleValue];
    [v4 setObject:v7 forKey:@"double_value"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long double v8 = +[NSNumber numberWithUnsignedLongLong:self->_dateValue];
    [v4 setObject:v8 forKey:@"date_value"];
  }
  errorValue = self->_errorValue;
  if (errorValue)
  {
    unint64_t v10 = [(SECC2MPError *)errorValue dictionaryRepresentation];
    [v4 setObject:v10 forKey:@"error_value"];
  }

  return v4;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPGenericEventMetricValue;
  NSUInteger v3 = [(SECC2MPGenericEventMetricValue *)&v7 description];
  id v4 = [(SECC2MPGenericEventMetricValue *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasErrorValue
{
  return self->_errorValue != 0;
}

- (BOOL)hasDateValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDateValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDateValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_dateValue = a3;
}

- (BOOL)hasDoubleValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double doubleValue = a3;
}

- (BOOL)hasStringValue
{
  return self->_stringValue != 0;
}

@end