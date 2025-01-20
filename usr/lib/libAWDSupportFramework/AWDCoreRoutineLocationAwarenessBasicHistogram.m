@interface AWDCoreRoutineLocationAwarenessBasicHistogram
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)countAtIndex:(unint64_t)a3;
- (int)counts;
- (unint64_t)countsCount;
- (unint64_t)hash;
- (void)addCount:(int)a3;
- (void)clearCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCounts:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLocationAwarenessBasicHistogram

- (void)dealloc
{
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessBasicHistogram;
  [(AWDCoreRoutineLocationAwarenessBasicHistogram *)&v3 dealloc];
}

- (unint64_t)countsCount
{
  return self->_counts.count;
}

- (int)counts
{
  return self->_counts.list;
}

- (void)clearCounts
{
}

- (void)addCount:(int)a3
{
}

- (int)countAtIndex:(unint64_t)a3
{
  p_counts = &self->_counts;
  unint64_t count = self->_counts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_counts->list[a3];
}

- (void)setCounts:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessBasicHistogram;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLocationAwarenessBasicHistogram description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessBasicHistogram dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:PBRepeatedInt32NSArray() forKey:@"count"];
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessBasicHistogramReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_counts = &self->_counts;
  if (self->_counts.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < p_counts->count);
  }
}

- (void)copyTo:(id)a3
{
  if ([(AWDCoreRoutineLocationAwarenessBasicHistogram *)self countsCount])
  {
    [a3 clearCounts];
    unint64_t v5 = [(AWDCoreRoutineLocationAwarenessBasicHistogram *)self countsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addCount:-[AWDCoreRoutineLocationAwarenessBasicHistogram countAtIndex:](self, "countAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedInt32Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  int v3 = [a3 isMemberOfClass:objc_opt_class()];
  if (v3)
  {
    LOBYTE(v3) = PBRepeatedInt32IsEqual();
  }
  return v3;
}

- (unint64_t)hash
{
  return PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = [a3 countsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDCoreRoutineLocationAwarenessBasicHistogram addCount:](self, "addCount:", [a3 countAtIndex:i]);
  }
}

@end