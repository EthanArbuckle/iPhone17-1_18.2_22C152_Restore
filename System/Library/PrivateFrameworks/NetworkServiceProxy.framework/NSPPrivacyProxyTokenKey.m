@interface NSPPrivacyProxyTokenKey
- (BOOL)hasExpiration;
- (BOOL)hasRotation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)expiration;
- (unint64_t)hash;
- (unint64_t)rotation;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExpiration:(unint64_t)a3;
- (void)setHasExpiration:(BOOL)a3;
- (void)setHasRotation:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setRotation:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSPPrivacyProxyTokenKey

- (void)setExpiration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_expiration = a3;
}

- (void)setHasExpiration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExpiration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setRotation:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_rotation = a3;
}

- (void)setHasRotation:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRotation
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSPPrivacyProxyTokenKey;
  v4 = [(NSPPrivacyProxyTokenKey *)&v8 description];
  v5 = [(NSPPrivacyProxyTokenKey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v7 = [NSNumber numberWithUnsignedLongLong:self->_expiration];
    [v4 setObject:v7 forKey:@"expiration"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithUnsignedLongLong:self->_rotation];
    [v4 setObject:v8 forKey:@"rotation"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSPPrivacyProxyTokenKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_key) {
    __assert_rtn("-[NSPPrivacyProxyTokenKey writeTo:]", "NSPPrivacyProxyTokenKey.m", 135, "nil != self->_key");
  }
  id v6 = v4;
  PBDataWriterWriteDataField();
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  id v5 = a3;
  [v5 setKey:self->_key];
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v5 + 1) = self->_expiration;
    *((unsigned char *)v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v5 + 2) = self->_rotation;
    *((unsigned char *)v5 + 32) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_key copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_expiration;
    *(unsigned char *)(v5 + 32) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_rotation;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  key = self->_key;
  if ((unint64_t)key | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](key, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_expiration != *((void *)v4 + 1)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_13:
    BOOL v6 = 0;
    goto LABEL_14;
  }
  BOOL v6 = (*((unsigned char *)v4 + 32) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_rotation != *((void *)v4 + 2)) {
      goto LABEL_13;
    }
    BOOL v6 = 1;
  }
LABEL_14:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_key hash];
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v4 = 2654435761u * self->_expiration;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  unint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_rotation;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = (unint64_t *)a3;
  if (v4[3])
  {
    BOOL v6 = v4;
    -[NSPPrivacyProxyTokenKey setKey:](self, "setKey:");
    unint64_t v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 32);
  if (v5)
  {
    self->_expiration = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if ((v5 & 2) != 0)
  {
    self->_rotation = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSData)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (unint64_t)expiration
{
  return self->_expiration;
}

- (unint64_t)rotation
{
  return self->_rotation;
}

- (void).cxx_destruct
{
}

@end