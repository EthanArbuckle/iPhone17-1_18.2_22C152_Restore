@interface NTPBLRUCacheEntry
- (BOOL)hasKey;
- (BOOL)hasLastAccessed;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)key;
- (NSData)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)lastAccessed;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasLastAccessed:(BOOL)a3;
- (void)setKey:(id)a3;
- (void)setLastAccessed:(unint64_t)a3;
- (void)setValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBLRUCacheEntry

- (void)dealloc
{
  [(NTPBLRUCacheEntry *)self setKey:0];
  [(NTPBLRUCacheEntry *)self setValue:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBLRUCacheEntry;
  [(NTPBLRUCacheEntry *)&v3 dealloc];
}

- (BOOL)hasKey
{
  return self->_key != 0;
}

- (BOOL)hasValue
{
  return self->_value != 0;
}

- (void)setLastAccessed:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lastAccessed = a3;
}

- (void)setHasLastAccessed:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLastAccessed
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBLRUCacheEntry;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBLRUCacheEntry description](&v3, sel_description), -[NTPBLRUCacheEntry dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  key = self->_key;
  if (key) {
    [v3 setObject:key forKey:@"key"];
  }
  value = self->_value;
  if (value) {
    [v4 setObject:value forKey:@"value"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_lastAccessed), @"last_accessed");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBLRUCacheEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_key) {
    PBDataWriterWriteDataField();
  }
  if (self->_value) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 16) = [(NSData *)self->_key copyWithZone:a3];
  *(void *)(v5 + 24) = [(NSData *)self->_value copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_lastAccessed;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    key = self->_key;
    if (!((unint64_t)key | *((void *)a3 + 2)) || (int v5 = -[NSData isEqual:](key, "isEqual:")) != 0)
    {
      value = self->_value;
      if (!((unint64_t)value | *((void *)a3 + 3)) || (int v5 = -[NSData isEqual:](value, "isEqual:")) != 0)
      {
        LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) == 0;
        if (*(unsigned char *)&self->_has) {
          LOBYTE(v5) = (*((unsigned char *)a3 + 32) & 1) != 0 && self->_lastAccessed == *((void *)a3 + 1);
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_key hash];
  uint64_t v4 = [(NSData *)self->_value hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v5 = 2654435761u * self->_lastAccessed;
  }
  else {
    unint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBLRUCacheEntry setKey:](self, "setKey:");
  }
  if (*((void *)a3 + 3)) {
    -[NTPBLRUCacheEntry setValue:](self, "setValue:");
  }
  if (*((unsigned char *)a3 + 32))
  {
    self->_lastAccessed = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)key
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

- (unint64_t)lastAccessed
{
  return self->_lastAccessed;
}

@end