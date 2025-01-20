@interface AWDWiFiMetricRssiHistory
- (BOOL)hasGatewayARPHistory;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)bcnFrmsHistoryAtIndex:(unint64_t)a3;
- (int)bcnFrmsHistorys;
- (int)bcnPerHistoryAtIndex:(unint64_t)a3;
- (int)bcnPerHistorys;
- (int)fwTxFrmsHistoryAtIndex:(unint64_t)a3;
- (int)fwTxFrmsHistorys;
- (int)fwTxPerHistoryAtIndex:(unint64_t)a3;
- (int)fwTxPerHistorys;
- (int)rssiHistoryAtIndex:(unint64_t)a3;
- (int)rssiHistorys;
- (int)txFrmsHistoryAtIndex:(unint64_t)a3;
- (int)txFrmsHistorys;
- (int)txPerHistoryAtIndex:(unint64_t)a3;
- (int)txPerHistorys;
- (unint64_t)bcnFrmsHistorysCount;
- (unint64_t)bcnPerHistorysCount;
- (unint64_t)fwTxFrmsHistorysCount;
- (unint64_t)fwTxPerHistorysCount;
- (unint64_t)hash;
- (unint64_t)rssiHistorysCount;
- (unint64_t)timestamp;
- (unint64_t)txFrmsHistorysCount;
- (unint64_t)txPerHistorysCount;
- (unsigned)gatewayARPHistory;
- (void)addBcnFrmsHistory:(int)a3;
- (void)addBcnPerHistory:(int)a3;
- (void)addFwTxFrmsHistory:(int)a3;
- (void)addFwTxPerHistory:(int)a3;
- (void)addRssiHistory:(int)a3;
- (void)addTxFrmsHistory:(int)a3;
- (void)addTxPerHistory:(int)a3;
- (void)clearBcnFrmsHistorys;
- (void)clearBcnPerHistorys;
- (void)clearFwTxFrmsHistorys;
- (void)clearFwTxPerHistorys;
- (void)clearRssiHistorys;
- (void)clearTxFrmsHistorys;
- (void)clearTxPerHistorys;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setGatewayARPHistory:(unsigned int)a3;
- (void)setHasGatewayARPHistory:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4;
- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricRssiHistory

- (void)dealloc
{
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricRssiHistory;
  [(AWDWiFiMetricRssiHistory *)&v3 dealloc];
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

- (unint64_t)rssiHistorysCount
{
  return self->_rssiHistorys.count;
}

- (int)rssiHistorys
{
  return self->_rssiHistorys.list;
}

- (void)clearRssiHistorys
{
}

- (void)addRssiHistory:(int)a3
{
}

- (int)rssiHistoryAtIndex:(unint64_t)a3
{
  p_rssiHistorys = &self->_rssiHistorys;
  unint64_t count = self->_rssiHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_rssiHistorys->list[a3];
}

- (void)setRssiHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txPerHistorysCount
{
  return self->_txPerHistorys.count;
}

- (int)txPerHistorys
{
  return self->_txPerHistorys.list;
}

- (void)clearTxPerHistorys
{
}

- (void)addTxPerHistory:(int)a3
{
}

- (int)txPerHistoryAtIndex:(unint64_t)a3
{
  p_txPerHistorys = &self->_txPerHistorys;
  unint64_t count = self->_txPerHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_txPerHistorys->list[a3];
}

- (void)setTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txFrmsHistorysCount
{
  return self->_txFrmsHistorys.count;
}

- (int)txFrmsHistorys
{
  return self->_txFrmsHistorys.list;
}

- (void)clearTxFrmsHistorys
{
}

- (void)addTxFrmsHistory:(int)a3
{
}

- (int)txFrmsHistoryAtIndex:(unint64_t)a3
{
  p_txFrmsHistorys = &self->_txFrmsHistorys;
  unint64_t count = self->_txFrmsHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_txFrmsHistorys->list[a3];
}

- (void)setTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)fwTxPerHistorysCount
{
  return self->_fwTxPerHistorys.count;
}

- (int)fwTxPerHistorys
{
  return self->_fwTxPerHistorys.list;
}

- (void)clearFwTxPerHistorys
{
}

- (void)addFwTxPerHistory:(int)a3
{
}

- (int)fwTxPerHistoryAtIndex:(unint64_t)a3
{
  p_fwTxPerHistorys = &self->_fwTxPerHistorys;
  unint64_t count = self->_fwTxPerHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_fwTxPerHistorys->list[a3];
}

- (void)setFwTxPerHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)fwTxFrmsHistorysCount
{
  return self->_fwTxFrmsHistorys.count;
}

- (int)fwTxFrmsHistorys
{
  return self->_fwTxFrmsHistorys.list;
}

- (void)clearFwTxFrmsHistorys
{
}

- (void)addFwTxFrmsHistory:(int)a3
{
}

- (int)fwTxFrmsHistoryAtIndex:(unint64_t)a3
{
  p_fwTxFrmsHistorys = &self->_fwTxFrmsHistorys;
  unint64_t count = self->_fwTxFrmsHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_fwTxFrmsHistorys->list[a3];
}

- (void)setFwTxFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bcnPerHistorysCount
{
  return self->_bcnPerHistorys.count;
}

- (int)bcnPerHistorys
{
  return self->_bcnPerHistorys.list;
}

- (void)clearBcnPerHistorys
{
}

- (void)addBcnPerHistory:(int)a3
{
}

- (int)bcnPerHistoryAtIndex:(unint64_t)a3
{
  p_bcnPerHistorys = &self->_bcnPerHistorys;
  unint64_t count = self->_bcnPerHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_bcnPerHistorys->list[a3];
}

- (void)setBcnPerHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (unint64_t)bcnFrmsHistorysCount
{
  return self->_bcnFrmsHistorys.count;
}

- (int)bcnFrmsHistorys
{
  return self->_bcnFrmsHistorys.list;
}

- (void)clearBcnFrmsHistorys
{
}

- (void)addBcnFrmsHistory:(int)a3
{
}

- (int)bcnFrmsHistoryAtIndex:(unint64_t)a3
{
  p_bcnFrmsHistorys = &self->_bcnFrmsHistorys;
  unint64_t count = self->_bcnFrmsHistorys.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_bcnFrmsHistorys->list[a3];
}

- (void)setBcnFrmsHistorys:(int *)a3 count:(unint64_t)a4
{
}

- (void)setGatewayARPHistory:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_gatewayARPHistory = a3;
}

- (void)setHasGatewayARPHistory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasGatewayARPHistory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricRssiHistory;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricRssiHistory description](&v3, sel_description), -[AWDWiFiMetricRssiHistory dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"rssiHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"txPerHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"txFrmsHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"fwTxPerHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"fwTxFrmsHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"bcnPerHistory"];
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"bcnFrmsHistory"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_gatewayARPHistory] forKey:@"gatewayARPHistory"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricRssiHistoryReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_rssiHistorys.count)
  {
    unint64_t v4 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v4;
    }
    while (v4 < self->_rssiHistorys.count);
  }
  if (self->_txPerHistorys.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v5;
    }
    while (v5 < self->_txPerHistorys.count);
  }
  if (self->_txFrmsHistorys.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v6;
    }
    while (v6 < self->_txFrmsHistorys.count);
  }
  if (self->_fwTxPerHistorys.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v7;
    }
    while (v7 < self->_fwTxPerHistorys.count);
  }
  if (self->_fwTxFrmsHistorys.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v8;
    }
    while (v8 < self->_fwTxFrmsHistorys.count);
  }
  if (self->_bcnPerHistorys.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v9;
    }
    while (v9 < self->_bcnPerHistorys.count);
  }
  if (self->_bcnFrmsHistorys.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v10;
    }
    while (v10 < self->_bcnFrmsHistorys.count);
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 22) = self->_timestamp;
    *((unsigned char *)a3 + 188) |= 1u;
  }
  if ([(AWDWiFiMetricRssiHistory *)self rssiHistorysCount])
  {
    [a3 clearRssiHistorys];
    unint64_t v5 = [(AWDWiFiMetricRssiHistory *)self rssiHistorysCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRssiHistory:-[AWDWiFiMetricRssiHistory rssiHistoryAtIndex:](self, "rssiHistoryAtIndex:", i)];
    }
  }
  if ([(AWDWiFiMetricRssiHistory *)self txPerHistorysCount])
  {
    [a3 clearTxPerHistorys];
    unint64_t v8 = [(AWDWiFiMetricRssiHistory *)self txPerHistorysCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addTxPerHistory:-[AWDWiFiMetricRssiHistory txPerHistoryAtIndex:](self, "txPerHistoryAtIndex:", j)];
    }
  }
  if ([(AWDWiFiMetricRssiHistory *)self txFrmsHistorysCount])
  {
    [a3 clearTxFrmsHistorys];
    unint64_t v11 = [(AWDWiFiMetricRssiHistory *)self txFrmsHistorysCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addTxFrmsHistory:-[AWDWiFiMetricRssiHistory txFrmsHistoryAtIndex:](self, "txFrmsHistoryAtIndex:", k)];
    }
  }
  if ([(AWDWiFiMetricRssiHistory *)self fwTxPerHistorysCount])
  {
    [a3 clearFwTxPerHistorys];
    unint64_t v14 = [(AWDWiFiMetricRssiHistory *)self fwTxPerHistorysCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addFwTxPerHistory:-[AWDWiFiMetricRssiHistory fwTxPerHistoryAtIndex:](self, "fwTxPerHistoryAtIndex:", m)];
    }
  }
  if ([(AWDWiFiMetricRssiHistory *)self fwTxFrmsHistorysCount])
  {
    [a3 clearFwTxFrmsHistorys];
    unint64_t v17 = [(AWDWiFiMetricRssiHistory *)self fwTxFrmsHistorysCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addFwTxFrmsHistory:-[AWDWiFiMetricRssiHistory fwTxFrmsHistoryAtIndex:](self, "fwTxFrmsHistoryAtIndex:", n)];
    }
  }
  if ([(AWDWiFiMetricRssiHistory *)self bcnPerHistorysCount])
  {
    [a3 clearBcnPerHistorys];
    unint64_t v20 = [(AWDWiFiMetricRssiHistory *)self bcnPerHistorysCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (iuint64_t i = 0; ii != v21; ++ii)
        [a3 addBcnPerHistory:-[AWDWiFiMetricRssiHistory bcnPerHistoryAtIndex:](self, "bcnPerHistoryAtIndex:", ii)];
    }
  }
  if ([(AWDWiFiMetricRssiHistory *)self bcnFrmsHistorysCount])
  {
    [a3 clearBcnFrmsHistorys];
    unint64_t v23 = [(AWDWiFiMetricRssiHistory *)self bcnFrmsHistorysCount];
    if (v23)
    {
      unint64_t v24 = v23;
      for (juint64_t j = 0; jj != v24; ++jj)
        [a3 addBcnFrmsHistory:-[AWDWiFiMetricRssiHistory bcnFrmsHistoryAtIndex:](self, "bcnFrmsHistoryAtIndex:", jj)];
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 46) = self->_gatewayARPHistory;
    *((unsigned char *)a3 + 188) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v4 + 176) = self->_timestamp;
    *(unsigned char *)(v4 + 188) |= 1u;
  }
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  PBRepeatedInt32Copy();
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 184) = self->_gatewayARPHistory;
    *(unsigned char *)(v5 + 188) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int IsEqual = [a3 isMemberOfClass:objc_opt_class()];
  if (IsEqual)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 188) & 1) == 0 || self->_timestamp != *((void *)a3 + 22)) {
        goto LABEL_18;
      }
    }
    else if (*((unsigned char *)a3 + 188))
    {
LABEL_18:
      LOBYTE(IsEqual) = 0;
      return IsEqual;
    }
    int IsEqual = PBRepeatedInt32IsEqual();
    if (IsEqual)
    {
      int IsEqual = PBRepeatedInt32IsEqual();
      if (IsEqual)
      {
        int IsEqual = PBRepeatedInt32IsEqual();
        if (IsEqual)
        {
          int IsEqual = PBRepeatedInt32IsEqual();
          if (IsEqual)
          {
            int IsEqual = PBRepeatedInt32IsEqual();
            if (IsEqual)
            {
              int IsEqual = PBRepeatedInt32IsEqual();
              if (IsEqual)
              {
                int IsEqual = PBRepeatedInt32IsEqual();
                if (IsEqual)
                {
                  LOBYTE(IsEqual) = (*((unsigned char *)a3 + 188) & 2) == 0;
                  if ((*(unsigned char *)&self->_has & 2) != 0)
                  {
                    if ((*((unsigned char *)a3 + 188) & 2) == 0 || self->_gatewayARPHistory != *((_DWORD *)a3 + 46)) {
                      goto LABEL_18;
                    }
                    LOBYTE(IsEqual) = 1;
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return IsEqual;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = PBRepeatedInt32Hash();
  uint64_t v5 = PBRepeatedInt32Hash();
  uint64_t v6 = PBRepeatedInt32Hash();
  uint64_t v7 = PBRepeatedInt32Hash();
  uint64_t v8 = PBRepeatedInt32Hash();
  uint64_t v9 = PBRepeatedInt32Hash();
  uint64_t v10 = PBRepeatedInt32Hash();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_gatewayARPHistory;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 188))
  {
    self->_timestamp = *((void *)a3 + 22);
    *(unsigned char *)&self->_has |= 1u;
  }
  uint64_t v5 = [a3 rssiHistorysCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiMetricRssiHistory addRssiHistory:](self, "addRssiHistory:", [a3 rssiHistoryAtIndex:i]);
  }
  uint64_t v8 = [a3 txPerHistorysCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWiFiMetricRssiHistory addTxPerHistory:](self, "addTxPerHistory:", [a3 txPerHistoryAtIndex:j]);
  }
  uint64_t v11 = [a3 txFrmsHistorysCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDWiFiMetricRssiHistory addTxFrmsHistory:](self, "addTxFrmsHistory:", [a3 txFrmsHistoryAtIndex:k]);
  }
  uint64_t v14 = [a3 fwTxPerHistorysCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDWiFiMetricRssiHistory addFwTxPerHistory:](self, "addFwTxPerHistory:", [a3 fwTxPerHistoryAtIndex:m]);
  }
  uint64_t v17 = [a3 fwTxFrmsHistorysCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[AWDWiFiMetricRssiHistory addFwTxFrmsHistory:](self, "addFwTxFrmsHistory:", [a3 fwTxFrmsHistoryAtIndex:n]);
  }
  uint64_t v20 = [a3 bcnPerHistorysCount];
  if (v20)
  {
    uint64_t v21 = v20;
    for (iuint64_t i = 0; ii != v21; ++ii)
      -[AWDWiFiMetricRssiHistory addBcnPerHistory:](self, "addBcnPerHistory:", [a3 bcnPerHistoryAtIndex:ii]);
  }
  uint64_t v23 = [a3 bcnFrmsHistorysCount];
  if (v23)
  {
    uint64_t v24 = v23;
    for (juint64_t j = 0; jj != v24; ++jj)
      -[AWDWiFiMetricRssiHistory addBcnFrmsHistory:](self, "addBcnFrmsHistory:", [a3 bcnFrmsHistoryAtIndex:jj]);
  }
  if ((*((unsigned char *)a3 + 188) & 2) != 0)
  {
    self->_gatewayARPHistory = *((_DWORD *)a3 + 46);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)gatewayARPHistory
{
  return self->_gatewayARPHistory;
}

@end