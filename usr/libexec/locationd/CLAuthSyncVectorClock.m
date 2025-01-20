@interface CLAuthSyncVectorClock
- (BOOL)hasKey;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)key;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)value;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setValue:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CLAuthSyncVectorClock

- (void)dealloc
{
  [(CLAuthSyncVectorClock *)self setKey:0];
  v3.receiver = self;
  v3.super_class = (Class)CLAuthSyncVectorClock;
  [(CLAuthSyncVectorClock *)&v3 dealloc];
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (void)setValue:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)CLAuthSyncVectorClock;
  return +[NSString stringWithFormat:@"%@ %@", [(CLAuthSyncVectorClock *)&v3 description], [(CLAuthSyncVectorClock *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  if (*(unsigned char *)&self->_has) {
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_value)] forKey:@"value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10095D3B8((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_key) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_key) {
    [a3 setKey:];
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 4) = self->_value;
    *((unsigned char *)a3 + 20) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[1] = [(NSString *)self->_key copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_value;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((void *)a3 + 1))
      || (unsigned int v5 = -[NSString isEqual:](key, "isEqual:")) != 0)
    {
      LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) == 0;
      if (*(unsigned char *)&self->_has) {
        LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 1) != 0 && self->_value == *((_DWORD *)a3 + 4);
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_key hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_value;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[CLAuthSyncVectorClock setKey:](self, "setKey:");
  }
  if (*((unsigned char *)a3 + 20))
  {
    self->_value = *((_DWORD *)a3 + 4);
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

- (unsigned)value
{
  return self->_value;
}

@end