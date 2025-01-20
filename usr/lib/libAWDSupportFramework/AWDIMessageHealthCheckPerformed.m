@interface AWDIMessageHealthCheckPerformed
- (BOOL)hasNumMessages;
- (BOOL)hasNumberOfRequests;
- (BOOL)hasNumberOfResponses;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)aliasesMatchedsCount;
- (unint64_t)coarseMatchedsCount;
- (unint64_t)hash;
- (unint64_t)numMissedsCount;
- (unint64_t)numOutOfOrdersCount;
- (unint64_t)timestamp;
- (unsigned)aliasesMatchedAtIndex:(unint64_t)a3;
- (unsigned)aliasesMatcheds;
- (unsigned)coarseMatchedAtIndex:(unint64_t)a3;
- (unsigned)coarseMatcheds;
- (unsigned)numMessages;
- (unsigned)numMissedAtIndex:(unint64_t)a3;
- (unsigned)numMisseds;
- (unsigned)numOutOfOrderAtIndex:(unint64_t)a3;
- (unsigned)numOutOfOrders;
- (unsigned)numberOfRequests;
- (unsigned)numberOfResponses;
- (void)addAliasesMatched:(unsigned int)a3;
- (void)addCoarseMatched:(unsigned int)a3;
- (void)addNumMissed:(unsigned int)a3;
- (void)addNumOutOfOrder:(unsigned int)a3;
- (void)clearAliasesMatcheds;
- (void)clearCoarseMatcheds;
- (void)clearNumMisseds;
- (void)clearNumOutOfOrders;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAliasesMatcheds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setCoarseMatcheds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasNumMessages:(BOOL)a3;
- (void)setHasNumberOfRequests:(BOOL)a3;
- (void)setHasNumberOfResponses:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setNumMessages:(unsigned int)a3;
- (void)setNumMisseds:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNumOutOfOrders:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNumberOfRequests:(unsigned int)a3;
- (void)setNumberOfResponses:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDIMessageHealthCheckPerformed

- (void)dealloc
{
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageHealthCheckPerformed;
  [(AWDIMessageHealthCheckPerformed *)&v3 dealloc];
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

- (void)setNumberOfRequests:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_numberOfRequests = a3;
}

- (void)setHasNumberOfRequests:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasNumberOfRequests
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setNumberOfResponses:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_numberOfResponses = a3;
}

- (void)setHasNumberOfResponses:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasNumberOfResponses
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setNumMessages:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_numMessages = a3;
}

- (void)setHasNumMessages:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasNumMessages
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (unint64_t)numOutOfOrdersCount
{
  return self->_numOutOfOrders.count;
}

- (unsigned)numOutOfOrders
{
  return self->_numOutOfOrders.list;
}

- (void)clearNumOutOfOrders
{
}

- (void)addNumOutOfOrder:(unsigned int)a3
{
}

- (unsigned)numOutOfOrderAtIndex:(unint64_t)a3
{
  p_numOutOfOrders = &self->_numOutOfOrders;
  unint64_t count = self->_numOutOfOrders.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_numOutOfOrders->list[a3];
}

- (void)setNumOutOfOrders:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)numMissedsCount
{
  return self->_numMisseds.count;
}

- (unsigned)numMisseds
{
  return self->_numMisseds.list;
}

- (void)clearNumMisseds
{
}

- (void)addNumMissed:(unsigned int)a3
{
}

- (unsigned)numMissedAtIndex:(unint64_t)a3
{
  p_numMisseds = &self->_numMisseds;
  unint64_t count = self->_numMisseds.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_numMisseds->list[a3];
}

- (void)setNumMisseds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)aliasesMatchedsCount
{
  return self->_aliasesMatcheds.count;
}

- (unsigned)aliasesMatcheds
{
  return self->_aliasesMatcheds.list;
}

- (void)clearAliasesMatcheds
{
}

- (void)addAliasesMatched:(unsigned int)a3
{
}

- (unsigned)aliasesMatchedAtIndex:(unint64_t)a3
{
  p_aliasesMatcheds = &self->_aliasesMatcheds;
  unint64_t count = self->_aliasesMatcheds.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_aliasesMatcheds->list[a3];
}

- (void)setAliasesMatcheds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)coarseMatchedsCount
{
  return self->_coarseMatcheds.count;
}

- (unsigned)coarseMatcheds
{
  return self->_coarseMatcheds.list;
}

- (void)clearCoarseMatcheds
{
}

- (void)addCoarseMatched:(unsigned int)a3
{
}

- (unsigned)coarseMatchedAtIndex:(unint64_t)a3
{
  p_coarseMatcheds = &self->_coarseMatcheds;
  unint64_t count = self->_coarseMatcheds.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_coarseMatcheds->list[a3];
}

- (void)setCoarseMatcheds:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDIMessageHealthCheckPerformed;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDIMessageHealthCheckPerformed description](&v3, sel_description), -[AWDIMessageHealthCheckPerformed dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numberOfResponses] forKey:@"numberOfResponses"];
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numberOfRequests] forKey:@"numberOfRequests"];
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numMessages] forKey:@"numMessages"];
LABEL_6:
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"numOutOfOrder"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"numMissed"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"aliasesMatched"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"coarseMatched"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDIMessageHealthCheckPerformedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_29;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_29:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
  if (self->_numOutOfOrders.count)
  {
    PBDataWriterPlaceMark();
    if (self->_numOutOfOrders.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_numOutOfOrders.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_numMisseds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_numMisseds.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_numMisseds.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_aliasesMatcheds.count)
  {
    PBDataWriterPlaceMark();
    if (self->_aliasesMatcheds.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_aliasesMatcheds.count);
    }
    PBDataWriterRecallMark();
  }
  p_coarseMatcheds = &self->_coarseMatcheds;
  if (p_coarseMatcheds->count)
  {
    PBDataWriterPlaceMark();
    if (p_coarseMatcheds->count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < p_coarseMatcheds->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 13) = self->_timestamp;
    *((unsigned char *)a3 + 124) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_25:
      *((_DWORD *)a3 + 30) = self->_numberOfResponses;
      *((unsigned char *)a3 + 124) |= 8u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 29) = self->_numberOfRequests;
  *((unsigned char *)a3 + 124) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_25;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 28) = self->_numMessages;
    *((unsigned char *)a3 + 124) |= 2u;
  }
LABEL_6:
  if ([(AWDIMessageHealthCheckPerformed *)self numOutOfOrdersCount])
  {
    [a3 clearNumOutOfOrders];
    unint64_t v6 = [(AWDIMessageHealthCheckPerformed *)self numOutOfOrdersCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addNumOutOfOrder:-[AWDIMessageHealthCheckPerformed numOutOfOrderAtIndex:](self, "numOutOfOrderAtIndex:", i)];
    }
  }
  if ([(AWDIMessageHealthCheckPerformed *)self numMissedsCount])
  {
    [a3 clearNumMisseds];
    unint64_t v9 = [(AWDIMessageHealthCheckPerformed *)self numMissedsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addNumMissed:-[AWDIMessageHealthCheckPerformed numMissedAtIndex:](self, "numMissedAtIndex:", j)];
    }
  }
  if ([(AWDIMessageHealthCheckPerformed *)self aliasesMatchedsCount])
  {
    [a3 clearAliasesMatcheds];
    unint64_t v12 = [(AWDIMessageHealthCheckPerformed *)self aliasesMatchedsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addAliasesMatched:^AWDIMessageHealthCheckPerformed(AWDIMessageHealthCheckPerformed *self, NSUInteger k) {
    }
  }
  if ([(AWDIMessageHealthCheckPerformed *)self coarseMatchedsCount])
  {
    [a3 clearCoarseMatcheds];
    unint64_t v15 = [(AWDIMessageHealthCheckPerformed *)self coarseMatchedsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addCoarseMatched:-[AWDIMessageHealthCheckPerformed coarseMatchedAtIndex:](self, "coarseMatchedAtIndex:", m)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v5 = (void *)v4;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v4 + 104) = self->_timestamp;
    *(unsigned char *)(v4 + 124) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v4 + 120) = self->_numberOfResponses;
      *(unsigned char *)(v4 + 124) |= 8u;
      if ((*(unsigned char *)&self->_has & 2) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v4 + 116) = self->_numberOfRequests;
  *(unsigned char *)(v4 + 124) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 2) != 0)
  {
LABEL_5:
    *(_DWORD *)(v4 + 112) = self->_numMessages;
    *(unsigned char *)(v4 + 124) |= 2u;
  }
LABEL_6:
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
    if ((*((unsigned char *)a3 + 124) & 1) == 0 || self->_timestamp != *((void *)a3 + 13)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 124))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 124) & 4) == 0 || self->_numberOfRequests != *((_DWORD *)a3 + 29)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 124) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 124) & 8) == 0 || self->_numberOfResponses != *((_DWORD *)a3 + 30)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 124) & 8) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 124) & 2) == 0 || self->_numMessages != *((_DWORD *)a3 + 28)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 124) & 2) != 0)
  {
    return 0;
  }
  if (!PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
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
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_numberOfRequests;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_numberOfResponses;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_numMessages;
LABEL_10:
  uint64_t v6 = v3 ^ v2 ^ v4 ^ v5 ^ PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  uint64_t v8 = v6 ^ v7 ^ PBRepeatedUInt32Hash();
  return v8 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  char v5 = *((unsigned char *)a3 + 124);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 13);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 124);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((*((unsigned char *)a3 + 124) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfRequests = *((_DWORD *)a3 + 29);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)a3 + 124);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_21:
  self->_numberOfResponses = *((_DWORD *)a3 + 30);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)a3 + 124) & 2) != 0)
  {
LABEL_5:
    self->_numMessages = *((_DWORD *)a3 + 28);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
  uint64_t v6 = [a3 numOutOfOrdersCount];
  if (v6)
  {
    uint64_t v7 = v6;
    for (uint64_t i = 0; i != v7; ++i)
      -[AWDIMessageHealthCheckPerformed addNumOutOfOrder:](self, "addNumOutOfOrder:", [a3 numOutOfOrderAtIndex:i]);
  }
  uint64_t v9 = [a3 numMissedsCount];
  if (v9)
  {
    uint64_t v10 = v9;
    for (uint64_t j = 0; j != v10; ++j)
      -[AWDIMessageHealthCheckPerformed addNumMissed:](self, "addNumMissed:", [a3 numMissedAtIndex:j]);
  }
  uint64_t v12 = [a3 aliasesMatchedsCount];
  if (v12)
  {
    uint64_t v13 = v12;
    for (uint64_t k = 0; k != v13; ++k)
      -[AWDIMessageHealthCheckPerformed addAliasesMatched:](self, "addAliasesMatched:", [a3 aliasesMatchedAtIndex:k]);
  }
  uint64_t v15 = [a3 coarseMatchedsCount];
  if (v15)
  {
    uint64_t v16 = v15;
    for (uint64_t m = 0; m != v16; ++m)
      -[AWDIMessageHealthCheckPerformed addCoarseMatched:](self, "addCoarseMatched:", [a3 coarseMatchedAtIndex:m]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)numberOfRequests
{
  return self->_numberOfRequests;
}

- (unsigned)numberOfResponses
{
  return self->_numberOfResponses;
}

- (unsigned)numMessages
{
  return self->_numMessages;
}

@end