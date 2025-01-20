@interface NTPBCacheHint
- (BOOL)hasAccessTime;
- (BOOL)hasKey;
- (BOOL)hasLifetime;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)lifetime;
- (unint64_t)accessTime;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAccessTime:(unint64_t)a3;
- (void)setHasAccessTime:(BOOL)a3;
- (void)setHasLifetime:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setLifetime:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBCacheHint

- (NSString)key
{
  return self->_key;
}

- (void)dealloc
{
  [(NTPBCacheHint *)self setKey:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBCacheHint;
  [(NTPBCacheHint *)&v3 dealloc];
}

- (void)setKey:(id)a3
{
}

- (void)setAccessTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_accessTime = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NSString *)self->_key copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_lifetime;
    *(unsigned char *)(v5 + 28) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_accessTime;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  return (id)v5;
}

- (void)setLifetime:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lifetime = a3;
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (int)lifetime
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_lifetime;
  }
  else {
    return 0;
  }
}

- (void)setHasLifetime:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLifetime
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAccessTime:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAccessTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBCacheHint;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBCacheHint description](&v3, sel_description), -[NTPBCacheHint dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithInt:", self->_lifetime), @"lifetime");
    char has = (char)self->_has;
  }
  if (has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_accessTime), @"access_time");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBCacheHintReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 28) & 2) == 0 || self->_lifetime != *((_DWORD *)a3 + 6)) {
          goto LABEL_13;
        }
      }
      else if ((*((unsigned char *)a3 + 28) & 2) != 0)
      {
LABEL_13:
        LOBYTE(v5) = 0;
        return v5;
      }
      LOBYTE(v5) = (*((unsigned char *)a3 + 28) & 1) == 0;
      if (*(unsigned char *)&self->_has)
      {
        if ((*((unsigned char *)a3 + 28) & 1) == 0 || self->_accessTime != *((void *)a3 + 1)) {
          goto LABEL_13;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_lifetime;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_accessTime;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBCacheHint setKey:](self, "setKey:");
  }
  char v5 = *((unsigned char *)a3 + 28);
  if ((v5 & 2) != 0)
  {
    self->_lifetime = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 28);
  }
  if (v5)
  {
    self->_accessTime = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)accessTime
{
  return self->_accessTime;
}

@end