@interface AWDDNSDomainStats
- (BOOL)hasDomain;
- (BOOL)hasNetworkType;
- (BOOL)hasRecordType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networkTypeAsString:(int)a3;
- (id)recordTypeAsString:(int)a3;
- (int)StringAsNetworkType:(id)a3;
- (int)StringAsRecordType:(id)a3;
- (int)networkType;
- (int)recordType;
- (unint64_t)answeredQuerySendCountsCount;
- (unint64_t)dnsOverTCPStatesCount;
- (unint64_t)expiredAnswerStatesCount;
- (unint64_t)hash;
- (unint64_t)negAnsweredQuerySendCountsCount;
- (unint64_t)negResponseLatencyMsCount;
- (unint64_t)responseLatencyMsCount;
- (unint64_t)unansweredQueryDurationMsCount;
- (unint64_t)unansweredQuerySendCountsCount;
- (unsigned)answeredQuerySendCountAtIndex:(unint64_t)a3;
- (unsigned)answeredQuerySendCounts;
- (unsigned)dnsOverTCPStateAtIndex:(unint64_t)a3;
- (unsigned)dnsOverTCPStates;
- (unsigned)expiredAnswerStateAtIndex:(unint64_t)a3;
- (unsigned)expiredAnswerStates;
- (unsigned)negAnsweredQuerySendCountAtIndex:(unint64_t)a3;
- (unsigned)negAnsweredQuerySendCounts;
- (unsigned)negResponseLatencyMs;
- (unsigned)negResponseLatencyMsAtIndex:(unint64_t)a3;
- (unsigned)responseLatencyMs;
- (unsigned)responseLatencyMsAtIndex:(unint64_t)a3;
- (unsigned)unansweredQueryDurationMs;
- (unsigned)unansweredQueryDurationMsAtIndex:(unint64_t)a3;
- (unsigned)unansweredQuerySendCountAtIndex:(unint64_t)a3;
- (unsigned)unansweredQuerySendCounts;
- (void)addAnsweredQuerySendCount:(unsigned int)a3;
- (void)addDnsOverTCPState:(unsigned int)a3;
- (void)addExpiredAnswerState:(unsigned int)a3;
- (void)addNegAnsweredQuerySendCount:(unsigned int)a3;
- (void)addNegResponseLatencyMs:(unsigned int)a3;
- (void)addResponseLatencyMs:(unsigned int)a3;
- (void)addUnansweredQueryDurationMs:(unsigned int)a3;
- (void)addUnansweredQuerySendCount:(unsigned int)a3;
- (void)clearAnsweredQuerySendCounts;
- (void)clearDnsOverTCPStates;
- (void)clearExpiredAnswerStates;
- (void)clearNegAnsweredQuerySendCounts;
- (void)clearNegResponseLatencyMs;
- (void)clearResponseLatencyMs;
- (void)clearUnansweredQueryDurationMs;
- (void)clearUnansweredQuerySendCounts;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAnsweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDnsOverTCPStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setDomain:(id)a3;
- (void)setExpiredAnswerStates:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setHasNetworkType:(BOOL)a3;
- (void)setHasRecordType:(BOOL)a3;
- (void)setNegAnsweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNegResponseLatencyMs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setNetworkType:(int)a3;
- (void)setRecordType:(int)a3;
- (void)setResponseLatencyMs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUnansweredQueryDurationMs:(unsigned int *)a3 count:(unint64_t)a4;
- (void)setUnansweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDDNSDomainStats

- (void)dealloc
{
  [(AWDDNSDomainStats *)self setDomain:0];
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  PBRepeatedUInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDDNSDomainStats;
  [(AWDDNSDomainStats *)&v3 dealloc];
}

- (int)networkType
{
  if (*(unsigned char *)&self->_has) {
    return self->_networkType;
  }
  else {
    return 0;
  }
}

- (void)setNetworkType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_networkType = a3;
}

- (void)setHasNetworkType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNetworkType
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)networkTypeAsString:(int)a3
{
  if (!a3) {
    return @"NonCellular";
  }
  if (a3 == 1) {
    return @"Cellular";
  }
  return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
}

- (int)StringAsNetworkType:(id)a3
{
  if ([a3 isEqualToString:@"NonCellular"]) {
    return 0;
  }
  else {
    return [a3 isEqualToString:@"Cellular"];
  }
}

- (BOOL)hasDomain
{
  return self->_domain != 0;
}

- (unint64_t)answeredQuerySendCountsCount
{
  return self->_answeredQuerySendCounts.count;
}

- (unsigned)answeredQuerySendCounts
{
  return self->_answeredQuerySendCounts.list;
}

- (void)clearAnsweredQuerySendCounts
{
}

- (void)addAnsweredQuerySendCount:(unsigned int)a3
{
}

- (unsigned)answeredQuerySendCountAtIndex:(unint64_t)a3
{
  p_answeredQuerySendCounts = &self->_answeredQuerySendCounts;
  unint64_t count = self->_answeredQuerySendCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_answeredQuerySendCounts->list[a3];
}

- (void)setAnsweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)unansweredQuerySendCountsCount
{
  return self->_unansweredQuerySendCounts.count;
}

- (unsigned)unansweredQuerySendCounts
{
  return self->_unansweredQuerySendCounts.list;
}

- (void)clearUnansweredQuerySendCounts
{
}

- (void)addUnansweredQuerySendCount:(unsigned int)a3
{
}

- (unsigned)unansweredQuerySendCountAtIndex:(unint64_t)a3
{
  p_unansweredQuerySendCounts = &self->_unansweredQuerySendCounts;
  unint64_t count = self->_unansweredQuerySendCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_unansweredQuerySendCounts->list[a3];
}

- (void)setUnansweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)responseLatencyMsCount
{
  return self->_responseLatencyMs.count;
}

- (unsigned)responseLatencyMs
{
  return self->_responseLatencyMs.list;
}

- (void)clearResponseLatencyMs
{
}

- (void)addResponseLatencyMs:(unsigned int)a3
{
}

- (unsigned)responseLatencyMsAtIndex:(unint64_t)a3
{
  p_responseLatencyMs = &self->_responseLatencyMs;
  unint64_t count = self->_responseLatencyMs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_responseLatencyMs->list[a3];
}

- (void)setResponseLatencyMs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (int)recordType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_recordType;
  }
  else {
    return 0;
  }
}

- (void)setRecordType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_recordType = a3;
}

- (void)setHasRecordType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasRecordType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)recordTypeAsString:(int)a3
{
  if (a3 >= 4) {
    return (id)[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else {
    return off_2641B9A80[a3];
  }
}

- (int)StringAsRecordType:(id)a3
{
  if ([a3 isEqualToString:@"Unspecified"]) {
    return 0;
  }
  if ([a3 isEqualToString:@"Any"]) {
    return 1;
  }
  if ([a3 isEqualToString:@"A"]) {
    return 2;
  }
  if ([a3 isEqualToString:@"AAAA"]) {
    return 3;
  }
  return 0;
}

- (unint64_t)negAnsweredQuerySendCountsCount
{
  return self->_negAnsweredQuerySendCounts.count;
}

- (unsigned)negAnsweredQuerySendCounts
{
  return self->_negAnsweredQuerySendCounts.list;
}

- (void)clearNegAnsweredQuerySendCounts
{
}

- (void)addNegAnsweredQuerySendCount:(unsigned int)a3
{
}

- (unsigned)negAnsweredQuerySendCountAtIndex:(unint64_t)a3
{
  p_negAnsweredQuerySendCounts = &self->_negAnsweredQuerySendCounts;
  unint64_t count = self->_negAnsweredQuerySendCounts.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_negAnsweredQuerySendCounts->list[a3];
}

- (void)setNegAnsweredQuerySendCounts:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)negResponseLatencyMsCount
{
  return self->_negResponseLatencyMs.count;
}

- (unsigned)negResponseLatencyMs
{
  return self->_negResponseLatencyMs.list;
}

- (void)clearNegResponseLatencyMs
{
}

- (void)addNegResponseLatencyMs:(unsigned int)a3
{
}

- (unsigned)negResponseLatencyMsAtIndex:(unint64_t)a3
{
  p_negResponseLatencyMs = &self->_negResponseLatencyMs;
  unint64_t count = self->_negResponseLatencyMs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_negResponseLatencyMs->list[a3];
}

- (void)setNegResponseLatencyMs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)unansweredQueryDurationMsCount
{
  return self->_unansweredQueryDurationMs.count;
}

- (unsigned)unansweredQueryDurationMs
{
  return self->_unansweredQueryDurationMs.list;
}

- (void)clearUnansweredQueryDurationMs
{
}

- (void)addUnansweredQueryDurationMs:(unsigned int)a3
{
}

- (unsigned)unansweredQueryDurationMsAtIndex:(unint64_t)a3
{
  p_unansweredQueryDurationMs = &self->_unansweredQueryDurationMs;
  unint64_t count = self->_unansweredQueryDurationMs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count)], "raise" reason userInfo];
  }
  return p_unansweredQueryDurationMs->list[a3];
}

- (void)setUnansweredQueryDurationMs:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)expiredAnswerStatesCount
{
  return self->_expiredAnswerStates.count;
}

- (unsigned)expiredAnswerStates
{
  return self->_expiredAnswerStates.list;
}

- (void)clearExpiredAnswerStates
{
}

- (void)addExpiredAnswerState:(unsigned int)a3
{
}

- (unsigned)expiredAnswerStateAtIndex:(unint64_t)a3
{
  p_expiredAnswerStates = &self->_expiredAnswerStates;
  unint64_t count = self->_expiredAnswerStates.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_expiredAnswerStates->list[a3];
}

- (void)setExpiredAnswerStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)dnsOverTCPStatesCount
{
  return self->_dnsOverTCPStates.count;
}

- (unsigned)dnsOverTCPStates
{
  return self->_dnsOverTCPStates.list;
}

- (void)clearDnsOverTCPStates
{
}

- (void)addDnsOverTCPState:(unsigned int)a3
{
}

- (unsigned)dnsOverTCPStateAtIndex:(unint64_t)a3
{
  p_dnsOverTCPStates = &self->_dnsOverTCPStates;
  unint64_t count = self->_dnsOverTCPStates.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_dnsOverTCPStates->list[a3];
}

- (void)setDnsOverTCPStates:(unsigned int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDDNSDomainStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDDNSDomainStats description](&v3, sel_description), -[AWDDNSDomainStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    int networkType = self->_networkType;
    if (networkType)
    {
      if (networkType == 1) {
        v5 = @"Cellular";
      }
      else {
        v5 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_networkType];
      }
    }
    else
    {
      v5 = @"NonCellular";
    }
    [v3 setObject:v5 forKey:@"networkType"];
  }
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"answeredQuerySendCount"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"unansweredQuerySendCount"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"responseLatencyMs"];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t recordType = self->_recordType;
    if (recordType >= 4) {
      v8 = (__CFString *)[NSString stringWithFormat:@"(unknown: %i)", self->_recordType];
    }
    else {
      v8 = off_2641B9A80[recordType];
    }
    [v3 setObject:v8 forKey:@"recordType"];
  }
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"negAnsweredQuerySendCount"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"negResponseLatencyMs"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"unansweredQueryDurationMs"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"expiredAnswerState"];
  [v3 setObject:PBRepeatedUInt32NSArray() forKey:@"dnsOverTCPState"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDDNSDomainStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_domain) {
    PBDataWriterWriteStringField();
  }
  if (self->_answeredQuerySendCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_answeredQuerySendCounts.count)
    {
      unint64_t v4 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v4;
      }
      while (v4 < self->_answeredQuerySendCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_unansweredQuerySendCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_unansweredQuerySendCounts.count)
    {
      unint64_t v5 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v5;
      }
      while (v5 < self->_unansweredQuerySendCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_responseLatencyMs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_responseLatencyMs.count)
    {
      unint64_t v6 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v6;
      }
      while (v6 < self->_responseLatencyMs.count);
    }
    PBDataWriterRecallMark();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_negAnsweredQuerySendCounts.count)
  {
    PBDataWriterPlaceMark();
    if (self->_negAnsweredQuerySendCounts.count)
    {
      unint64_t v7 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v7;
      }
      while (v7 < self->_negAnsweredQuerySendCounts.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_negResponseLatencyMs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_negResponseLatencyMs.count)
    {
      unint64_t v8 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v8;
      }
      while (v8 < self->_negResponseLatencyMs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_unansweredQueryDurationMs.count)
  {
    PBDataWriterPlaceMark();
    if (self->_unansweredQueryDurationMs.count)
    {
      unint64_t v9 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v9;
      }
      while (v9 < self->_unansweredQueryDurationMs.count);
    }
    PBDataWriterRecallMark();
  }
  if (self->_expiredAnswerStates.count)
  {
    PBDataWriterPlaceMark();
    if (self->_expiredAnswerStates.count)
    {
      unint64_t v10 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v10;
      }
      while (v10 < self->_expiredAnswerStates.count);
    }
    PBDataWriterRecallMark();
  }
  p_dnsOverTCPStates = &self->_dnsOverTCPStates;
  if (p_dnsOverTCPStates->count)
  {
    PBDataWriterPlaceMark();
    if (p_dnsOverTCPStates->count)
    {
      unint64_t v12 = 0;
      do
      {
        PBDataWriterWriteUint32Field();
        ++v12;
      }
      while (v12 < p_dnsOverTCPStates->count);
    }
    PBDataWriterRecallMark();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)a3 + 52) = self->_networkType;
    *((unsigned char *)a3 + 216) |= 1u;
  }
  if (self->_domain) {
    [a3 setDomain:];
  }
  if ([(AWDDNSDomainStats *)self answeredQuerySendCountsCount])
  {
    [a3 clearAnsweredQuerySendCounts];
    unint64_t v5 = [(AWDDNSDomainStats *)self answeredQuerySendCountsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addAnsweredQuerySendCount:-[AWDDNSDomainStats answeredQuerySendCountAtIndex:](self, "answeredQuerySendCountAtIndex:", i)];
    }
  }
  if ([(AWDDNSDomainStats *)self unansweredQuerySendCountsCount])
  {
    [a3 clearUnansweredQuerySendCounts];
    unint64_t v8 = [(AWDDNSDomainStats *)self unansweredQuerySendCountsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addUnansweredQuerySendCount:-[AWDDNSDomainStats unansweredQuerySendCountAtIndex:](self, "unansweredQuerySendCountAtIndex:", j)];
    }
  }
  if ([(AWDDNSDomainStats *)self responseLatencyMsCount])
  {
    [a3 clearResponseLatencyMs];
    unint64_t v11 = [(AWDDNSDomainStats *)self responseLatencyMsCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addResponseLatencyMs:-[AWDDNSDomainStats responseLatencyMsAtIndex:](self, "responseLatencyMsAtIndex:", k)];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 53) = self->_recordType;
    *((unsigned char *)a3 + 216) |= 2u;
  }
  if ([(AWDDNSDomainStats *)self negAnsweredQuerySendCountsCount])
  {
    [a3 clearNegAnsweredQuerySendCounts];
    unint64_t v14 = [(AWDDNSDomainStats *)self negAnsweredQuerySendCountsCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addNegAnsweredQuerySendCount:-[AWDDNSDomainStats negAnsweredQuerySendCountAtIndex:](self, "negAnsweredQuerySendCountAtIndex:", m)];
    }
  }
  if ([(AWDDNSDomainStats *)self negResponseLatencyMsCount])
  {
    [a3 clearNegResponseLatencyMs];
    unint64_t v17 = [(AWDDNSDomainStats *)self negResponseLatencyMsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addNegResponseLatencyMs:-[AWDDNSDomainStats negResponseLatencyMsAtIndex:](self, "negResponseLatencyMsAtIndex:", n)];
    }
  }
  if ([(AWDDNSDomainStats *)self unansweredQueryDurationMsCount])
  {
    [a3 clearUnansweredQueryDurationMs];
    unint64_t v20 = [(AWDDNSDomainStats *)self unansweredQueryDurationMsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        [a3 addUnansweredQueryDurationMs:-[AWDDNSDomainStats unansweredQueryDurationMsAtIndex:](self, "unansweredQueryDurationMsAtIndex:", ii)];
    }
  }
  if ([(AWDDNSDomainStats *)self expiredAnswerStatesCount])
  {
    [a3 clearExpiredAnswerStates];
    unint64_t v23 = [(AWDDNSDomainStats *)self expiredAnswerStatesCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0; jj != v24; ++jj)
        [a3 addExpiredAnswerState:-[AWDDNSDomainStats expiredAnswerStateAtIndex:](self, "expiredAnswerStateAtIndex:", jj)];
    }
  }
  if ([(AWDDNSDomainStats *)self dnsOverTCPStatesCount])
  {
    [a3 clearDnsOverTCPStates];
    unint64_t v26 = [(AWDDNSDomainStats *)self dnsOverTCPStatesCount];
    if (v26)
    {
      unint64_t v27 = v26;
      for (kuint64_t k = 0; kk != v27; ++kk)
        [a3 addDnsOverTCPState:-[AWDDNSDomainStats dnsOverTCPStateAtIndex:](self, "dnsOverTCPStateAtIndex:", kk)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 208) = self->_networkType;
    *(unsigned char *)(v5 + 216) |= 1u;
  }

  *(void *)(v6 + 200) = [(NSString *)self->_domain copyWithZone:a3];
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 212) = self->_recordType;
    *(unsigned char *)(v6 + 216) |= 2u;
  }
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  PBRepeatedUInt32Copy();
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 216) & 1) == 0 || self->_networkType != *((_DWORD *)a3 + 52)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 216))
  {
    return 0;
  }
  domaiuint64_t n = self->_domain;
  if ((unint64_t)domain | *((void *)a3 + 25) && !-[NSString isEqual:](domain, "isEqual:")
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual()
    || !PBRepeatedUInt32IsEqual())
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 216) & 2) == 0 || self->_recordType != *((_DWORD *)a3 + 53)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 216) & 2) != 0)
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
    uint64_t v3 = 2654435761 * self->_networkType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_domain hash];
  uint64_t v5 = PBRepeatedUInt32Hash();
  uint64_t v6 = PBRepeatedUInt32Hash();
  uint64_t v7 = PBRepeatedUInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_recordType;
  }
  else {
    uint64_t v8 = 0;
  }
  uint64_t v9 = v5 ^ v6 ^ v7 ^ v8 ^ PBRepeatedUInt32Hash();
  uint64_t v10 = v4 ^ v3 ^ v9 ^ PBRepeatedUInt32Hash();
  uint64_t v11 = PBRepeatedUInt32Hash();
  uint64_t v12 = v11 ^ PBRepeatedUInt32Hash();
  return v10 ^ v12 ^ PBRepeatedUInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 216))
  {
    self->_int networkType = *((_DWORD *)a3 + 52);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 25)) {
    -[AWDDNSDomainStats setDomain:](self, "setDomain:");
  }
  uint64_t v5 = [a3 answeredQuerySendCountsCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDDNSDomainStats addAnsweredQuerySendCount:](self, "addAnsweredQuerySendCount:", [a3 answeredQuerySendCountAtIndex:i]);
  }
  uint64_t v8 = [a3 unansweredQuerySendCountsCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDDNSDomainStats addUnansweredQuerySendCount:](self, "addUnansweredQuerySendCount:", [a3 unansweredQuerySendCountAtIndex:j]);
  }
  uint64_t v11 = [a3 responseLatencyMsCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDDNSDomainStats addResponseLatencyMs:](self, "addResponseLatencyMs:", [a3 responseLatencyMsAtIndex:k]);
  }
  if ((*((unsigned char *)a3 + 216) & 2) != 0)
  {
    self->_uint64_t recordType = *((_DWORD *)a3 + 53);
    *(unsigned char *)&self->_has |= 2u;
  }
  uint64_t v14 = [a3 negAnsweredQuerySendCountsCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDDNSDomainStats addNegAnsweredQuerySendCount:](self, "addNegAnsweredQuerySendCount:", [a3 negAnsweredQuerySendCountAtIndex:m]);
  }
  uint64_t v17 = [a3 negResponseLatencyMsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[AWDDNSDomainStats addNegResponseLatencyMs:](self, "addNegResponseLatencyMs:", [a3 negResponseLatencyMsAtIndex:n]);
  }
  uint64_t v20 = [a3 unansweredQueryDurationMsCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (iuint64_t i = 0; ii != v21; ++ii)
      -[AWDDNSDomainStats addUnansweredQueryDurationMs:](self, "addUnansweredQueryDurationMs:", [a3 unansweredQueryDurationMsAtIndex:ii]);
  }
  uint64_t v23 = [a3 expiredAnswerStatesCount];
  if (v23)
  {
    uint64_t v24 = v23;
    for (juint64_t j = 0; jj != v24; ++jj)
      -[AWDDNSDomainStats addExpiredAnswerState:](self, "addExpiredAnswerState:", [a3 expiredAnswerStateAtIndex:jj]);
  }
  uint64_t v26 = [a3 dnsOverTCPStatesCount];
  if (v26)
  {
    uint64_t v27 = v26;
    for (kuint64_t k = 0; kk != v27; ++kk)
      -[AWDDNSDomainStats addDnsOverTCPState:](self, "addDnsOverTCPState:", [a3 dnsOverTCPStateAtIndex:kk]);
  }
}

- (NSString)domain
{
  return self->_domain;
}

- (void)setDomain:(id)a3
{
}

@end