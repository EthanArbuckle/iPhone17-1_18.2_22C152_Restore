@interface NTPBBucketGroupConfig
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)version;
- (int64_t)byteCount;
- (int64_t)numberOfBuckets;
- (int64_t)validUntilDate;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setByteCount:(int64_t)a3;
- (void)setNumberOfBuckets:(int64_t)a3;
- (void)setValidUntilDate:(int64_t)a3;
- (void)setVersion:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBBucketGroupConfig

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBBucketGroupConfig;
  v4 = [(NTPBBucketGroupConfig *)&v8 description];
  v5 = [(NTPBBucketGroupConfig *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = [NSNumber numberWithInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  v5 = [NSNumber numberWithLongLong:self->_numberOfBuckets];
  [v3 setObject:v5 forKey:@"number_of_buckets"];

  v6 = [NSNumber numberWithLongLong:self->_byteCount];
  [v3 setObject:v6 forKey:@"byte_count"];

  v7 = [NSNumber numberWithLongLong:self->_validUntilDate];
  [v3 setObject:v7 forKey:@"valid_until_date"];

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBBucketGroupConfigReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v3 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
  PBDataWriterWriteInt64Field();
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *((_DWORD *)result + 8) = self->_version;
  *((void *)result + 2) = self->_numberOfBuckets;
  *((void *)result + 1) = self->_byteCount;
  *((void *)result + 3) = self->_validUntilDate;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 8)
    && self->_numberOfBuckets == *((void *)v4 + 2)
    && self->_byteCount == *((void *)v4 + 1)
    && self->_validUntilDate == *((void *)v4 + 3);

  return v5;
}

- (unint64_t)hash
{
  return (2654435761 * self->_numberOfBuckets) ^ (2654435761 * self->_version) ^ (2654435761 * self->_byteCount) ^ (2654435761 * self->_validUntilDate);
}

- (void)mergeFrom:(id)a3
{
  self->_version = *((_DWORD *)a3 + 8);
  self->_numberOfBuckets = *((void *)a3 + 2);
  self->_byteCount = *((void *)a3 + 1);
  self->_validUntilDate = *((void *)a3 + 3);
}

- (int)version
{
  return self->_version;
}

- (void)setVersion:(int)a3
{
  self->_version = a3;
}

- (int64_t)numberOfBuckets
{
  return self->_numberOfBuckets;
}

- (void)setNumberOfBuckets:(int64_t)a3
{
  self->_numberOfBuckets = a3;
}

- (int64_t)byteCount
{
  return self->_byteCount;
}

- (void)setByteCount:(int64_t)a3
{
  self->_byteCount = a3;
}

- (int64_t)validUntilDate
{
  return self->_validUntilDate;
}

- (void)setValidUntilDate:(int64_t)a3
{
  self->_validUntilDate = a3;
}

@end