@interface AWDWiFiMetricJoinTimeout
- (BOOL)hasSequence;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)associationStatesCount;
- (unint64_t)channelsCount;
- (unint64_t)hash;
- (unint64_t)joinClassificationInfosCount;
- (unint64_t)joinTargetClassificationInfosCount;
- (unint64_t)totalNumberOfJoinAttemptsCount;
- (unsigned)associationStateAtIndex:(unint64_t)a3;
- (unsigned)associationStates;
- (unsigned)channelAtIndex:(unint64_t)a3;
- (unsigned)channels;
- (unsigned)joinClassificationInfoAtIndex:(unint64_t)a3;
- (unsigned)joinClassificationInfos;
- (unsigned)joinTargetClassificationInfoAtIndex:(unint64_t)a3;
- (unsigned)joinTargetClassificationInfos;
- (unsigned)sequence;
- (unsigned)totalNumberOfJoinAttempts;
- (unsigned)totalNumberOfJoinAttemptsAtIndex:(unint64_t)a3;
- (void)addAssociationState:(unsigned int)a3;
- (void)addChannel:(unsigned int)a3;
- (void)addJoinClassificationInfo:(unsigned int)a3;
- (void)addJoinTargetClassificationInfo:(unsigned int)a3;
- (void)addTotalNumberOfJoinAttempts:(unsigned int)a3;
- (void)clearAssociationStates;
- (void)clearChannels;
- (void)clearJoinClassificationInfos;
- (void)clearJoinTargetClassificationInfos;
- (void)clearTotalNumberOfJoinAttempts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAssociationStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setChannels:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasSequence:(BOOL)a3;
- (void)setJoinClassificationInfos:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setJoinTargetClassificationInfos:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setSequence:(unsigned int)a3;
- (void)setTotalNumberOfJoinAttempts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricJoinTimeout

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricJoinTimeout;
  [(AWDWiFiMetricJoinTimeout *)&v3 dealloc];
}

- (void)setSequence:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sequence = a3;
}

- (void)setHasSequence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSequence
{
  return *(unsigned char *)&self->_has & 1;
}

- (unint64_t)joinClassificationInfosCount
{
  return self->_joinClassificationInfos.count;
}

- (unsigned)joinClassificationInfos
{
  return self->_joinClassificationInfos.list;
}

- (void)clearJoinClassificationInfos
{
}

- (void)addJoinClassificationInfo:(unsigned int)a3
{
}

- (unsigned)joinClassificationInfoAtIndex:(unint64_t)a3
{
  p_joinClassificationInfos = &self->_joinClassificationInfos;
  unint64_t count = self->_joinClassificationInfos.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_joinClassificationInfos->list[a3];
}

- (void)setJoinClassificationInfos:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)joinTargetClassificationInfosCount
{
  return self->_joinTargetClassificationInfos.count;
}

- (unsigned)joinTargetClassificationInfos
{
  return self->_joinTargetClassificationInfos.list;
}

- (void)clearJoinTargetClassificationInfos
{
}

- (void)addJoinTargetClassificationInfo:(unsigned int)a3
{
}

- (unsigned)joinTargetClassificationInfoAtIndex:(unint64_t)a3
{
  p_joinTargetClassificationInfos = &self->_joinTargetClassificationInfos;
  unint64_t count = self->_joinTargetClassificationInfos.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_joinTargetClassificationInfos->list[a3];
}

- (void)setJoinTargetClassificationInfos:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)associationStatesCount
{
  return self->_associationStates.count;
}

- (unsigned)associationStates
{
  return self->_associationStates.list;
}

- (void)clearAssociationStates
{
}

- (void)addAssociationState:(unsigned int)a3
{
}

- (unsigned)associationStateAtIndex:(unint64_t)a3
{
  p_associationStates = &self->_associationStates;
  unint64_t count = self->_associationStates.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_associationStates->list[a3];
}

- (void)setAssociationStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)channelsCount
{
  return self->_channels.count;
}

- (unsigned)channels
{
  return self->_channels.list;
}

- (void)clearChannels
{
}

- (void)addChannel:(unsigned int)a3
{
}

- (unsigned)channelAtIndex:(unint64_t)a3
{
  p_channels = &self->_channels;
  unint64_t count = self->_channels.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_channels->list[a3];
}

- (void)setChannels:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)totalNumberOfJoinAttemptsCount
{
  return self->_totalNumberOfJoinAttempts.count;
}

- (unsigned)totalNumberOfJoinAttempts
{
  return self->_totalNumberOfJoinAttempts.list;
}

- (void)clearTotalNumberOfJoinAttempts
{
}

- (void)addTotalNumberOfJoinAttempts:(unsigned int)a3
{
}

- (unsigned)totalNumberOfJoinAttemptsAtIndex:(unint64_t)a3
{
  p_totalNumberOfJoinAttempts = &self->_totalNumberOfJoinAttempts;
  unint64_t count = self->_totalNumberOfJoinAttempts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_totalNumberOfJoinAttempts->list[a3];
}

- (void)setTotalNumberOfJoinAttempts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricJoinTimeout;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricJoinTimeout description](&v3, sel_description), -[AWDWiFiMetricJoinTimeout dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_sequence] forKey:@"sequence"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"joinClassificationInfo"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"joinTargetClassificationInfo"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"associationState"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"channel"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"totalNumberOfJoinAttempts"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricJoinTimeoutReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_joinClassificationInfos.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v4;
    }
    while (v4 < self->_joinClassificationInfos.count);
  }
  if (self->_joinTargetClassificationInfos.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v5;
    }
    while (v5 < self->_joinTargetClassificationInfos.count);
  }
  if (self->_associationStates.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v6;
    }
    while (v6 < self->_associationStates.count);
  }
  if (self->_channels.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v7;
    }
    while (v7 < self->_channels.count);
  }
  p_totalNumberOfJoinAttempts = &self->_totalNumberOfJoinAttempts;
  if (p_totalNumberOfJoinAttempts->count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint32Field();
      ++v9;
    }
    while (v9 < p_totalNumberOfJoinAttempts->count);
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 32) = self->_sequence;
    *((unsigned char *)a3 + 132) |= 1u;
  }
  if ([(AWDWiFiMetricJoinTimeout *)self joinClassificationInfosCount])
  {
    [a3 clearJoinClassificationInfos];
    unint64_t v5 = [(AWDWiFiMetricJoinTimeout *)self joinClassificationInfosCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addJoinClassificationInfo:-[AWDWiFiMetricJoinTimeout joinClassificationInfoAtIndex:](self, "joinClassificationInfoAtIndex:", i)];
    }
  }
  if ([(AWDWiFiMetricJoinTimeout *)self joinTargetClassificationInfosCount])
  {
    [a3 clearJoinTargetClassificationInfos];
    unint64_t v8 = [(AWDWiFiMetricJoinTimeout *)self joinTargetClassificationInfosCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addJoinTargetClassificationInfo:-[AWDWiFiMetricJoinTimeout joinTargetClassificationInfoAtIndex:](self, "joinTargetClassificationInfoAtIndex:", j)];
    }
  }
  if ([(AWDWiFiMetricJoinTimeout *)self associationStatesCount])
  {
    [a3 clearAssociationStates];
    unint64_t v11 = [(AWDWiFiMetricJoinTimeout *)self associationStatesCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addAssociationState:-[AWDWiFiMetricJoinTimeout associationStateAtIndex:](self, "associationStateAtIndex:", k)];
    }
  }
  if ([(AWDWiFiMetricJoinTimeout *)self channelsCount])
  {
    [a3 clearChannels];
    unint64_t v14 = [(AWDWiFiMetricJoinTimeout *)self channelsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addChannel:-[AWDWiFiMetricJoinTimeout channelAtIndex:](self, "channelAtIndex:", m)];
    }
  }
  if ([(AWDWiFiMetricJoinTimeout *)self totalNumberOfJoinAttemptsCount])
  {
    [a3 clearTotalNumberOfJoinAttempts];
    unint64_t v17 = [(AWDWiFiMetricJoinTimeout *)self totalNumberOfJoinAttemptsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addTotalNumberOfJoinAttempts:-[AWDWiFiMetricJoinTimeout totalNumberOfJoinAttemptsAtIndex:](self, "totalNumberOfJoinAttemptsAtIndex:", n)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = (void *)v4;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v4 + 128) = self->_sequence;
    *(unsigned char *)(v4 + 132) |= 1u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
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
    if ((*((unsigned char *)a3 + 132) & 1) == 0 || self->_sequence != *((_DWORD *)a3 + 32)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 132))
  {
    return 0;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    return 0;
  }

  return PBRepeatedUInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_sequence;
  }
  else {
    uint64_t v2 = 0;
  }
  uint64_t v3 = PBRepeatedUInt32Hash() ^ v2;
  uint64_t v4 = PBRepeatedUInt32Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  return v5 ^ v6 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 132))
  {
    self->_sequence = *((_DWORD *)a3 + 32);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 joinClassificationInfosCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetricJoinTimeout addJoinClassificationInfo:](self, "addJoinClassificationInfo:", [a3 joinClassificationInfoAtIndex:i]);
  }
  uint64_t v8 = [a3 joinTargetClassificationInfosCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWiFiMetricJoinTimeout addJoinTargetClassificationInfo:](self, "addJoinTargetClassificationInfo:", [a3 joinTargetClassificationInfoAtIndex:j]);
  }
  uint64_t v11 = [a3 associationStatesCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDWiFiMetricJoinTimeout addAssociationState:](self, "addAssociationState:", [a3 associationStateAtIndex:k]);
  }
  uint64_t v14 = [a3 channelsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDWiFiMetricJoinTimeout addChannel:](self, "addChannel:", [a3 channelAtIndex:m]);
  }
  uint64_t v17 = [a3 totalNumberOfJoinAttemptsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[AWDWiFiMetricJoinTimeout addTotalNumberOfJoinAttempts:](self, "addTotalNumberOfJoinAttempts:", [a3 totalNumberOfJoinAttemptsAtIndex:n]);
  }
}

- (unsigned)sequence
{
  return self->_sequence;
}

@end