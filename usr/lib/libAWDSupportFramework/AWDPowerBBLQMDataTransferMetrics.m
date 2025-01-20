@interface AWDPowerBBLQMDataTransferMetrics
+ (Class)lQMBytesType;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)lQMBytes;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lQMBytesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)lQMBytesCount;
- (unint64_t)lQMTransitionCntBucketsCount;
- (unint64_t)timestamp;
- (unsigned)lQMTransitionCntBuckets;
- (unsigned)lQMTransitionCntBucketsAtIndex:(unint64_t)a3;
- (void)addLQMBytes:(id)a3;
- (void)addLQMTransitionCntBuckets:(unsigned int)a3;
- (void)clearLQMBytes;
- (void)clearLQMTransitionCntBuckets;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLQMBytes:(id)a3;
- (void)setLQMTransitionCntBuckets:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDPowerBBLQMDataTransferMetrics

- (void)dealloc
{
  [(AWDPowerBBLQMDataTransferMetrics *)self setLQMBytes:0];
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBLQMDataTransferMetrics;
  [(AWDPowerBBLQMDataTransferMetrics *)&v3 dealloc];
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

- (void)clearLQMBytes
{
}

- (void)addLQMBytes:(id)a3
{
  lQMBytes = self->_lQMBytes;
  if (!lQMBytes)
  {
    lQMBytes = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_lQMBytes = lQMBytes;
  }

  [(NSMutableArray *)lQMBytes addObject:a3];
}

- (unint64_t)lQMBytesCount
{
  return [(NSMutableArray *)self->_lQMBytes count];
}

- (id)lQMBytesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lQMBytes objectAtIndex:a3];
}

+ (Class)lQMBytesType
{
  return (Class)objc_opt_class();
}

- (unint64_t)lQMTransitionCntBucketsCount
{
  return self->_lQMTransitionCntBuckets.count;
}

- (unsigned)lQMTransitionCntBuckets
{
  return self->_lQMTransitionCntBuckets.list;
}

- (void)clearLQMTransitionCntBuckets
{
}

- (void)addLQMTransitionCntBuckets:(unsigned int)a3
{
}

- (unsigned)lQMTransitionCntBucketsAtIndex:(unint64_t)a3
{
  p_lQMTransitionCntBuckets = &self->_lQMTransitionCntBuckets;
  unint64_t count = self->_lQMTransitionCntBuckets.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_lQMTransitionCntBuckets->list[a3];
}

- (void)setLQMTransitionCntBuckets:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDPowerBBLQMDataTransferMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDPowerBBLQMDataTransferMetrics description](&v3, sel_description), -[AWDPowerBBLQMDataTransferMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_lQMBytes count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_lQMBytes, "count")];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    lQMBytes = self->_lQMBytes;
    uint64_t v6 = [(NSMutableArray *)lQMBytes countByEnumeratingWithState:&v11 objects:v15 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v12 != v8) {
            objc_enumerationMutation(lQMBytes);
          }
          [v4 addObject:[*(id *)(*((void *)&v11 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)lQMBytes countByEnumeratingWithState:&v11 objects:v15 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"LQMBytes"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"LQMTransitionCntBuckets"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDPowerBBLQMDataTransferMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  lQMBytes = self->_lQMBytes;
  uint64_t v5 = [(NSMutableArray *)lQMBytes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(lQMBytes);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)lQMBytes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  p_lQMTransitionCntBuckets = &self->_lQMTransitionCntBuckets;
  if (p_lQMTransitionCntBuckets->count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v10;
    }
    while (v10 < p_lQMTransitionCntBuckets->count);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 48) |= 1u;
  }
  if ([(AWDPowerBBLQMDataTransferMetrics *)self lQMBytesCount])
  {
    [a3 clearLQMBytes];
    unint64_t v5 = [(AWDPowerBBLQMDataTransferMetrics *)self lQMBytesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addLQMBytes:-[AWDPowerBBLQMDataTransferMetrics lQMBytesAtIndex:](self, "lQMBytesAtIndex:", i)];
    }
  }
  if ([(AWDPowerBBLQMDataTransferMetrics *)self lQMTransitionCntBucketsCount])
  {
    [a3 clearLQMTransitionCntBuckets];
    unint64_t v8 = [(AWDPowerBBLQMDataTransferMetrics *)self lQMTransitionCntBucketsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addLQMTransitionCntBuckets:-[AWDPowerBBLQMDataTransferMetrics lQMTransitionCntBucketsAtIndex:](self, "lQMTransitionCntBucketsAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init")
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  lQMBytes = self->_lQMBytes;
  uint64_t v8 = [(NSMutableArray *)lQMBytes countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(lQMBytes);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v14 + 1) + 8 * i) copyWithZone:a3];
        [v6 addLQMBytes:v12];
      }
      uint64_t v9 = [(NSMutableArray *)lQMBytes countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }
  PBRepeatedUInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 48))
  {
    return 0;
  }
  lQMBytes = self->_lQMBytes;
  if ((unint64_t)lQMBytes | *((void *)a3 + 5)
    && !-[NSMutableArray isEqual:](lQMBytes, "isEqual:"))
  {
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
  uint64_t v3 = [(NSMutableArray *)self->_lQMBytes hash];
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 48))
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 5);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDPowerBBLQMDataTransferMetrics *)self addLQMBytes:*(void *)(*((void *)&v13 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }
  uint64_t v10 = [a3 lQMTransitionCntBucketsCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t j = 0; j != v11; ++j)
      -[AWDPowerBBLQMDataTransferMetrics addLQMTransitionCntBuckets:](self, "addLQMTransitionCntBuckets:", [a3 lQMTransitionCntBucketsAtIndex:j]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)lQMBytes
{
  return self->_lQMBytes;
}

- (void)setLQMBytes:(id)a3
{
}

@end