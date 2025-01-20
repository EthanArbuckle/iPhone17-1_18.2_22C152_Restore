@interface AWDWiFiMetricsManagerSoftErrorUserFeedback
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)softErrorInstanceCounters;
- (int)softErrorInstanceCountersAtIndex:(unint64_t)a3;
- (int)softErrorUserConfirmationCounters;
- (int)softErrorUserConfirmationCountersAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)softErrorInstanceCountersCount;
- (unint64_t)softErrorUserConfirmationCountersCount;
- (unint64_t)timestamp;
- (void)addSoftErrorInstanceCounters:(int)a3;
- (void)addSoftErrorUserConfirmationCounters:(int)a3;
- (void)clearSoftErrorInstanceCounters;
- (void)clearSoftErrorUserConfirmationCounters;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSoftErrorInstanceCounters:(int *)a3 count:(unint64_t)a4;
- (void)setSoftErrorUserConfirmationCounters:(int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerSoftErrorUserFeedback

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftErrorUserFeedback;
  [(AWDWiFiMetricsManagerSoftErrorUserFeedback *)&v3 dealloc];
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

- (unint64_t)softErrorInstanceCountersCount
{
  return self->_softErrorInstanceCounters.count;
}

- (int)softErrorInstanceCounters
{
  return self->_softErrorInstanceCounters.list;
}

- (void)clearSoftErrorInstanceCounters
{
}

- (void)addSoftErrorInstanceCounters:(int)a3
{
}

- (int)softErrorInstanceCountersAtIndex:(unint64_t)a3
{
  p_softErrorInstanceCounters = &self->_softErrorInstanceCounters;
  unint64_t count = self->_softErrorInstanceCounters.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_softErrorInstanceCounters->list[a3];
}

- (void)setSoftErrorInstanceCounters:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)softErrorUserConfirmationCountersCount
{
  return self->_softErrorUserConfirmationCounters.count;
}

- (int)softErrorUserConfirmationCounters
{
  return self->_softErrorUserConfirmationCounters.list;
}

- (void)clearSoftErrorUserConfirmationCounters
{
}

- (void)addSoftErrorUserConfirmationCounters:(int)a3
{
}

- (int)softErrorUserConfirmationCountersAtIndex:(unint64_t)a3
{
  p_softErrorUserConfirmationCounters = &self->_softErrorUserConfirmationCounters;
  unint64_t count = self->_softErrorUserConfirmationCounters.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_softErrorUserConfirmationCounters->list[a3];
}

- (void)setSoftErrorUserConfirmationCounters:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerSoftErrorUserFeedback;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerSoftErrorUserFeedback description](&v3, sel_description), -[AWDWiFiMetricsManagerSoftErrorUserFeedback dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"softErrorInstanceCounters"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"softErrorUserConfirmationCounters"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerSoftErrorUserFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_softErrorInstanceCounters.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_softErrorInstanceCounters.count);
  }
  p_softErrorUserConfirmationCounters = &self->_softErrorUserConfirmationCounters;
  if (p_softErrorUserConfirmationCounters->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < p_softErrorUserConfirmationCounters->count);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 7) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if ([(AWDWiFiMetricsManagerSoftErrorUserFeedback *)self softErrorInstanceCountersCount])
  {
    [a3 clearSoftErrorInstanceCounters];
    unint64_t v5 = [(AWDWiFiMetricsManagerSoftErrorUserFeedback *)self softErrorInstanceCountersCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addSoftErrorInstanceCounters:-[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorInstanceCountersAtIndex:](self, "softErrorInstanceCountersAtIndex:", i)];
    }
  }
  if ([(AWDWiFiMetricsManagerSoftErrorUserFeedback *)self softErrorUserConfirmationCountersCount])
  {
    [a3 clearSoftErrorUserConfirmationCounters];
    unint64_t v8 = [(AWDWiFiMetricsManagerSoftErrorUserFeedback *)self softErrorUserConfirmationCountersCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addSoftErrorUserConfirmationCounters:-[AWDWiFiMetricsManagerSoftErrorUserFeedback softErrorUserConfirmationCountersAtIndex:](self, "softErrorUserConfirmationCountersAtIndex:", j)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 56) = self->_timestamp;
    *(unsigned char *)(v4 + 64) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
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
  if (!PBRepeatedInt32IsEqual()) {
    return 0;
  }

  return PBRepeatedInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v2 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v2 = 0;
  }
  uint64_t v3 = PBRepeatedInt32Hash() ^ v2;
  return v3 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 64))
  {
    self->_timestamp = *((void *)a3 + 7);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 softErrorInstanceCountersCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetricsManagerSoftErrorUserFeedback addSoftErrorInstanceCounters:](self, "addSoftErrorInstanceCounters:", [a3 softErrorInstanceCountersAtIndex:i]);
  }
  uint64_t v8 = [a3 softErrorUserConfirmationCountersCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWiFiMetricsManagerSoftErrorUserFeedback addSoftErrorUserConfirmationCounters:](self, "addSoftErrorUserConfirmationCounters:", [a3 softErrorUserConfirmationCountersAtIndex:j]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

@end