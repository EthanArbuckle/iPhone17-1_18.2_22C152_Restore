@interface NTPBWrappingKeyMapEntry
- (BOOL)hasWrappingKey;
- (BOOL)hasWrappingKeyId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)wrappingKey;
- (NSData)wrappingKeyId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setWrappingKey:(id)a3;
- (void)setWrappingKeyId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBWrappingKeyMapEntry

- (BOOL)hasWrappingKeyId
{
  return self->_wrappingKeyId != 0;
}

- (BOOL)hasWrappingKey
{
  return self->_wrappingKey != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBWrappingKeyMapEntry;
  v4 = [(NTPBWrappingKeyMapEntry *)&v8 description];
  v5 = [(NTPBWrappingKeyMapEntry *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  wrappingKeyId = self->_wrappingKeyId;
  if (wrappingKeyId) {
    [v3 setObject:wrappingKeyId forKey:@"wrapping_key_id"];
  }
  wrappingKey = self->_wrappingKey;
  if (wrappingKey) {
    [v4 setObject:wrappingKey forKey:@"wrapping_key"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBWrappingKeyMapEntryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_wrappingKeyId)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_wrappingKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_wrappingKeyId copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSData *)self->_wrappingKey copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((wrappingKeyId = self->_wrappingKeyId, !((unint64_t)wrappingKeyId | v4[2]))
     || -[NSData isEqual:](wrappingKeyId, "isEqual:")))
  {
    wrappingKey = self->_wrappingKey;
    if ((unint64_t)wrappingKey | v4[1]) {
      char v7 = -[NSData isEqual:](wrappingKey, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_wrappingKeyId hash];
  return [(NSData *)self->_wrappingKey hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[NTPBWrappingKeyMapEntry setWrappingKeyId:](self, "setWrappingKeyId:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[NTPBWrappingKeyMapEntry setWrappingKey:](self, "setWrappingKey:");
    id v4 = v5;
  }
}

- (NSData)wrappingKeyId
{
  return self->_wrappingKeyId;
}

- (void)setWrappingKeyId:(id)a3
{
}

- (NSData)wrappingKey
{
  return self->_wrappingKey;
}

- (void)setWrappingKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wrappingKeyId, 0);

  objc_storeStrong((id *)&self->_wrappingKey, 0);
}

@end