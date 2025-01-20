@interface AWDMDNSResponderDNSMessageSizeStats
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)querySizeCountsCount;
- (unint64_t)responseSizeCountsCount;
- (unint64_t)timestamp;
- (unsigned)querySizeCountAtIndex:(unint64_t)a3;
- (unsigned)querySizeCounts;
- (unsigned)responseSizeCountAtIndex:(unint64_t)a3;
- (unsigned)responseSizeCounts;
- (void)addQuerySizeCount:(unsigned int)a3;
- (void)addResponseSizeCount:(unsigned int)a3;
- (void)clearQuerySizeCounts;
- (void)clearResponseSizeCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setQuerySizeCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setResponseSizeCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMDNSResponderDNSMessageSizeStats

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderDNSMessageSizeStats;
  [(AWDMDNSResponderDNSMessageSizeStats *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
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

- (unint64_t)querySizeCountsCount
{
  return self->_querySizeCounts.count;
}

- (unsigned)querySizeCounts
{
  return self->_querySizeCounts.list;
}

- (void)clearQuerySizeCounts
{
}

- (void)addQuerySizeCount:(unsigned int)a3
{
}

- (unsigned)querySizeCountAtIndex:(unint64_t)a3
{
  p_querySizeCounts = &self->_querySizeCounts;
  unint64_t count = self->_querySizeCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_querySizeCounts->list[a3];
}

- (void)setQuerySizeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)responseSizeCountsCount
{
  return self->_responseSizeCounts.count;
}

- (unsigned)responseSizeCounts
{
  return self->_responseSizeCounts.list;
}

- (void)clearResponseSizeCounts
{
}

- (void)addResponseSizeCount:(unsigned int)a3
{
}

- (unsigned)responseSizeCountAtIndex:(unint64_t)a3
{
  p_responseSizeCounts = &self->_responseSizeCounts;
  unint64_t count = self->_responseSizeCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_responseSizeCounts->list[a3];
}

- (void)setResponseSizeCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDMDNSResponderDNSMessageSizeStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDMDNSResponderDNSMessageSizeStats description](&v3, sel_description), -[AWDMDNSResponderDNSMessageSizeStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"querySizeCount"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"responseSizeCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMDNSResponderDNSMessageSizeStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_querySizeCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_querySizeCounts.count)
    {
      unint64_t v4 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v4;
      }
      while (v4 < self->_querySizeCounts.count);
    }
    PBDataWriterRecallMark();
  }
  p_responseSizeCounts = &self->_responseSizeCounts;
  if (p_responseSizeCounts->count)
  {
    PBDataWriterPlaceMark();
    if (p_responseSizeCounts->count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < p_responseSizeCounts->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if ([(AWDMDNSResponderDNSMessageSizeStats *)self querySizeCountsCount])
  {
    [a3 clearQuerySizeCounts];
    unint64_t v5 = [(AWDMDNSResponderDNSMessageSizeStats *)self querySizeCountsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addQuerySizeCount:-[AWDMDNSResponderDNSMessageSizeStats querySizeCountAtIndex:](self, "querySizeCountAtIndex:", i)];
    }
  }
  if ([(AWDMDNSResponderDNSMessageSizeStats *)self responseSizeCountsCount])
  {
    [a3 clearResponseSizeCounts];
    unint64_t v8 = [(AWDMDNSResponderDNSMessageSizeStats *)self responseSizeCountsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addResponseSizeCount:-[AWDMDNSResponderDNSMessageSizeStats responseSizeCountAtIndex:](self, "responseSizeCountAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 56) = self->_timestamp;
    *(unsigned char *)(v4 + 64) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_timestamp != *((void *)a3 + 7)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 64))
  {
    return 0;
  }
  if (!PBRepeatedUInt32IsEqual()) {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  uint64_t v3 = PBRepeatedUInt32Hash() ^ v2;
  return v3 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 64))
  {
    self->_timestamp = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 querySizeCountsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDMDNSResponderDNSMessageSizeStats addQuerySizeCount:](self, "addQuerySizeCount:", [a3 querySizeCountAtIndex:i]);
  }
  uint64_t v8 = [a3 responseSizeCountsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDMDNSResponderDNSMessageSizeStats addResponseSizeCount:](self, "addResponseSizeCount:", [a3 responseSizeCountAtIndex:j]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end