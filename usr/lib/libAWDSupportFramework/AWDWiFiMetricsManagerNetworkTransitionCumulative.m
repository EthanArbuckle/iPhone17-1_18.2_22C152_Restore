@interface AWDWiFiMetricsManagerNetworkTransitionCumulative
- (BOOL)hasColocatedNetworksFoundCount;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)channelScanCountsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)channelScanCountAtIndex:(unint64_t)a3;
- (unsigned)channelScanCounts;
- (unsigned)colocatedNetworksFoundCount;
- (void)addChannelScanCount:(unsigned int)a3;
- (void)clearChannelScanCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setChannelScanCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setColocatedNetworksFoundCount:(unsigned int)a3;
- (void)setHasColocatedNetworksFoundCount:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerNetworkTransitionCumulative

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionCumulative;
  [(AWDWiFiMetricsManagerNetworkTransitionCumulative *)&v3 dealloc];
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

- (void)setColocatedNetworksFoundCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_colocatedNetworksFoundCount = a3;
}

- (void)setHasColocatedNetworksFoundCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasColocatedNetworksFoundCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)channelScanCountsCount
{
  return self->_channelScanCounts.count;
}

- (unsigned)channelScanCounts
{
  return self->_channelScanCounts.list;
}

- (void)clearChannelScanCounts
{
}

- (void)addChannelScanCount:(unsigned int)a3
{
}

- (unsigned)channelScanCountAtIndex:(unint64_t)a3
{
  p_channelScanCounts = &self->_channelScanCounts;
  unint64_t count = self->_channelScanCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_channelScanCounts->list[a3];
}

- (void)setChannelScanCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerNetworkTransitionCumulative;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerNetworkTransitionCumulative description](&v3, sel_description), -[AWDWiFiMetricsManagerNetworkTransitionCumulative dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_colocatedNetworksFoundCount] forKey:@"colocatedNetworksFoundCount"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"channelScanCount"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerNetworkTransitionCumulativeReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
  p_channelScanCounts = &self->_channelScanCounts;
  if (p_channelScanCounts->count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < p_channelScanCounts->count);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_colocatedNetworksFoundCount;
    *((unsigned char *)a3 + 44) |= 2u;
  }
  if ([(AWDWiFiMetricsManagerNetworkTransitionCumulative *)self channelScanCountsCount])
  {
    [a3 clearChannelScanCounts];
    unint64_t v6 = [(AWDWiFiMetricsManagerNetworkTransitionCumulative *)self channelScanCountsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addChannelScanCount:-[AWDWiFiMetricsManagerNetworkTransitionCumulative channelScanCountAtIndex:](self, "channelScanCountAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [[(id)objc_opt_class() allocWithZone:a3] init];
  v5 = (void *)v4;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v4 + 32) = self->_timestamp;
    *(unsigned char *)(v4 + 44) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v4 + 40) = self->_colocatedNetworksFoundCount;
    *(unsigned char *)(v4 + 44) |= 2u;
  }
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
    if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 44))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_colocatedNetworksFoundCount != *((_DWORD *)a3 + 10)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) != 0)
  {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ PBRepeatedUInt32Hash();
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_colocatedNetworksFoundCount;
  return v3 ^ v2 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 44);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_colocatedNetworksFoundCount = *((_DWORD *)a3 + 10);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v6 = [a3 channelScanCountsCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDWiFiMetricsManagerNetworkTransitionCumulative addChannelScanCount:](self, "addChannelScanCount:", [a3 channelScanCountAtIndex:i]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)colocatedNetworksFoundCount
{
  return self->_colocatedNetworksFoundCount;
}

@end