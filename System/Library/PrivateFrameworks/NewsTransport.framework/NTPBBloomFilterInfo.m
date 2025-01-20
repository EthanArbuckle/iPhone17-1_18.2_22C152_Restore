@interface NTPBBloomFilterInfo
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bloomFilterData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)hashFunctionCount;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBloomFilterData:(id)a3;
- (void)setHashFunctionCount:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBloomFilterInfo

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBloomFilterInfo;
  v4 = [(NTPBBloomFilterInfo *)&v8 description];
  v5 = [(NTPBBloomFilterInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  bloomFilterData = self->_bloomFilterData;
  if (bloomFilterData) {
    [v3 setObject:bloomFilterData forKey:@"bloom_filter_data"];
  }
  v6 = [NSNumber numberWithInt:self->_hashFunctionCount];
  [v4 setObject:v6 forKey:@"hash_function_count"];

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBloomFilterInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteDataField();
  PBDataWriterWriteInt32Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_bloomFilterData copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  *(_DWORD *)(v5 + 16) = self->_hashFunctionCount;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && ((bloomFilterData = self->_bloomFilterData, !((unint64_t)bloomFilterData | *((void *)v4 + 1)))
     || -[NSData isEqual:](bloomFilterData, "isEqual:"))
    && self->_hashFunctionCount == *((_DWORD *)v4 + 4);

  return v6;
}

- (unint64_t)hash
{
  return (2654435761 * self->_hashFunctionCount) ^ [(NSData *)self->_bloomFilterData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NTPBBloomFilterInfo setBloomFilterData:](self, "setBloomFilterData:");
    id v4 = v5;
  }
  self->_hashFunctionCount = v4[4];
}

- (NSData)bloomFilterData
{
  return self->_bloomFilterData;
}

- (void)setBloomFilterData:(id)a3
{
}

- (int)hashFunctionCount
{
  return self->_hashFunctionCount;
}

- (void)setHashFunctionCount:(int)a3
{
  self->_hashFunctionCount = a3;
}

- (void).cxx_destruct
{
}

@end