@interface NTPBABConfigBucket
- (BOOL)hasBucketCeiling;
- (BOOL)hasBucketFloor;
- (BOOL)hasConfig;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBConfig)config;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)bucketCeiling;
- (int64_t)bucketFloor;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setBucketCeiling:(int64_t)a3;
- (void)setBucketFloor:(int64_t)a3;
- (void)setConfig:(id)a3;
- (void)setHasBucketCeiling:(BOOL)a3;
- (void)setHasBucketFloor:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBABConfigBucket

- (void)setBucketFloor:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_bucketFloor = a3;
}

- (void)setHasBucketFloor:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBucketFloor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setBucketCeiling:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bucketCeiling = a3;
}

- (void)setHasBucketCeiling:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBucketCeiling
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasConfig
{
  return self->_config != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBABConfigBucket;
  v4 = [(NTPBABConfigBucket *)&v8 description];
  v5 = [(NTPBABConfigBucket *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithLongLong:self->_bucketFloor];
    [v3 setObject:v5 forKey:@"bucket_floor"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithLongLong:self->_bucketCeiling];
    [v3 setObject:v6 forKey:@"bucket_ceiling"];
  }
  config = self->_config;
  if (config)
  {
    objc_super v8 = [(NTPBConfig *)config dictionaryRepresentation];
    [v3 setObject:v8 forKey:@"config"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBABConfigBucketReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_config)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_bucketFloor;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_bucketCeiling;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  id v8 = [(NTPBConfig *)self->_config copyWithZone:a3];
  v9 = (void *)v6[3];
  v6[3] = v8;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_bucketFloor != *((void *)v4 + 2)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_bucketCeiling != *((void *)v4 + 1)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_14;
  }
  config = self->_config;
  if ((unint64_t)config | *((void *)v4 + 3)) {
    char v6 = -[NTPBConfig isEqual:](config, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_bucketFloor;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NTPBConfig *)self->_config hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_bucketCeiling;
  return v3 ^ v2 ^ [(NTPBConfig *)self->_config hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = (int64_t *)a3;
  uint64_t v5 = v4;
  char v6 = *((unsigned char *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_bucketFloor = v4[2];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if (v6)
  {
    self->_bucketCeiling = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  config = self->_config;
  uint64_t v8 = v5[3];
  if (config)
  {
    if (v8) {
      -[NTPBConfig mergeFrom:](config, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBABConfigBucket setConfig:](self, "setConfig:");
  }

  MEMORY[0x270F9A758]();
}

- (int64_t)bucketFloor
{
  return self->_bucketFloor;
}

- (int64_t)bucketCeiling
{
  return self->_bucketCeiling;
}

- (NTPBConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (void).cxx_destruct
{
}

@end