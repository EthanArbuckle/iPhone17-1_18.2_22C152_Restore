@interface NPSUserDefaultsMsgKey
- (BOOL)hasTimestamp;
- (BOOL)hasTwoWaySync;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)twoWaySync;
- (NSData)value;
- (NSString)key;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTwoWaySync:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)setTwoWaySync:(BOOL)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPSUserDefaultsMsgKey

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setTwoWaySync:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_twoWaySync = a3;
}

- (void)setHasTwoWaySync:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTwoWaySync
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPSUserDefaultsMsgKey;
  char v3 = [(NPSUserDefaultsMsgKey *)&v7 description];
  v4 = [(NPSUserDefaultsMsgKey *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithBool:self->_twoWaySync];
    [v4 setObject:v8 forKey:@"twoWaySync"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v9 = +[NSNumber numberWithDouble:self->_timestamp];
    [v4 setObject:v9 forKey:@"timestamp"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_100003904((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    sub_100028800();
  }
  id v7 = v4;
  PBDataWriterWriteStringField();
  if (self->_value) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  v6 = v7;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    v6 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setKey:self->_key];
  if (self->_value) {
    objc_msgSend(v5, "setValue:");
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 32) = self->_twoWaySync;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v5 + 1) = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 36) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_key copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_value copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 32) = self->_twoWaySync;
    *((unsigned char *)v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = *(void *)&self->_timestamp;
    *((unsigned char *)v5 + 36) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](key, "isEqual:")) {
      goto LABEL_18;
    }
  }
  value = self->_value;
  if ((unint64_t)value | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](value, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_twoWaySync)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_18;
        }
        goto LABEL_14;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_14;
      }
    }
LABEL_18:
    BOOL v7 = 0;
    goto LABEL_19;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_18;
  }
LABEL_14:
  BOOL v7 = (*((unsigned char *)v4 + 36) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_timestamp != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
    BOOL v7 = 1;
  }
LABEL_19:

  return v7;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_value hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_twoWaySync;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v10 = 0;
    return v4 ^ v3 ^ v5 ^ v10;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double timestamp = self->_timestamp;
  double v7 = -timestamp;
  if (timestamp >= 0.0) {
    double v7 = self->_timestamp;
  }
  long double v8 = floor(v7 + 0.5);
  double v9 = (v7 - v8) * 1.84467441e19;
  unint64_t v10 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
  if (v9 >= 0.0)
  {
    if (v9 > 0.0) {
      v10 += (unint64_t)v9;
    }
  }
  else
  {
    v10 -= (unint64_t)fabs(v9);
  }
  return v4 ^ v3 ^ v5 ^ v10;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[NPSUserDefaultsMsgKey setKey:](self, "setKey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[NPSUserDefaultsMsgKey setValue:](self, "setValue:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 36);
  if ((v5 & 2) != 0)
  {
    self->_twoWaySync = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 36);
  }
  if (v5)
  {
    self->_double timestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (NSData)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (BOOL)twoWaySync
{
  return self->_twoWaySync;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_key, 0);
}

@end