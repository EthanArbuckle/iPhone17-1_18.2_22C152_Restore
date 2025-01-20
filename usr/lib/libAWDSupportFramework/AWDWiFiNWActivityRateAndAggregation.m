@interface AWDWiFiNWActivityRateAndAggregation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)ampduAGGAtIndex:(unint64_t)a3;
- (unint64_t)ampduAGGs;
- (unint64_t)ampduAGGsCount;
- (unint64_t)hash;
- (unint64_t)rxMCSSuccess;
- (unint64_t)rxMCSSuccessAtIndex:(unint64_t)a3;
- (unint64_t)rxMCSSuccessCount;
- (unint64_t)rxVHTSuccess;
- (unint64_t)rxVHTSuccessAtIndex:(unint64_t)a3;
- (unint64_t)rxVHTSuccessCount;
- (unint64_t)txMCSSuccess;
- (unint64_t)txMCSSuccessAtIndex:(unint64_t)a3;
- (unint64_t)txMCSSuccessCount;
- (unint64_t)txVHTSuccess;
- (unint64_t)txVHTSuccessAtIndex:(unint64_t)a3;
- (unint64_t)txVHTSuccessCount;
- (void)addAmpduAGG:(unint64_t)a3;
- (void)addRxMCSSuccess:(unint64_t)a3;
- (void)addRxVHTSuccess:(unint64_t)a3;
- (void)addTxMCSSuccess:(unint64_t)a3;
- (void)addTxVHTSuccess:(unint64_t)a3;
- (void)clearAmpduAGGs;
- (void)clearRxMCSSuccess;
- (void)clearRxVHTSuccess;
- (void)clearTxMCSSuccess;
- (void)clearTxVHTSuccess;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAmpduAGGs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiNWActivityRateAndAggregation

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityRateAndAggregation;
  [(AWDWiFiNWActivityRateAndAggregation *)&v3 dealloc];
}

- (unint64_t)rxVHTSuccessCount
{
  return self->_rxVHTSuccess.count;
}

- (unint64_t)rxVHTSuccess
{
  return self->_rxVHTSuccess.list;
}

- (void)clearRxVHTSuccess
{
}

- (void)addRxVHTSuccess:(unint64_t)a3
{
}

- (unint64_t)rxVHTSuccessAtIndex:(unint64_t)a3
{
  p_rxVHTSuccess = &self->_rxVHTSuccess;
  unint64_t count = self->_rxVHTSuccess.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_rxVHTSuccess->list[a3];
}

- (void)setRxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txVHTSuccessCount
{
  return self->_txVHTSuccess.count;
}

- (unint64_t)txVHTSuccess
{
  return self->_txVHTSuccess.list;
}

- (void)clearTxVHTSuccess
{
}

- (void)addTxVHTSuccess:(unint64_t)a3
{
}

- (unint64_t)txVHTSuccessAtIndex:(unint64_t)a3
{
  p_txVHTSuccess = &self->_txVHTSuccess;
  unint64_t count = self->_txVHTSuccess.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count), 0), "raise" reason userInfo];
  }
  return p_txVHTSuccess->list[a3];
}

- (void)setTxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxMCSSuccessCount
{
  return self->_rxMCSSuccess.count;
}

- (unint64_t)rxMCSSuccess
{
  return self->_rxMCSSuccess.list;
}

- (void)clearRxMCSSuccess
{
}

- (void)addRxMCSSuccess:(unint64_t)a3
{
}

- (unint64_t)rxMCSSuccessAtIndex:(unint64_t)a3
{
  p_rxMCSSuccess = &self->_rxMCSSuccess;
  unint64_t count = self->_rxMCSSuccess.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count) 0], "raise" reason userInfo];
  }
  return p_rxMCSSuccess->list[a3];
}

- (void)setRxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txMCSSuccessCount
{
  return self->_txMCSSuccess.count;
}

- (unint64_t)txMCSSuccess
{
  return self->_txMCSSuccess.list;
}

- (void)clearTxMCSSuccess
{
}

- (void)addTxMCSSuccess:(unint64_t)a3
{
}

- (unint64_t)txMCSSuccessAtIndex:(unint64_t)a3
{
  p_txMCSSuccess = &self->_txMCSSuccess;
  unint64_t count = self->_txMCSSuccess.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count], "raise" reason userInfo];
  }
  return p_txMCSSuccess->list[a3];
}

- (void)setTxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)ampduAGGsCount
{
  return self->_ampduAGGs.count;
}

- (unint64_t)ampduAGGs
{
  return self->_ampduAGGs.list;
}

- (void)clearAmpduAGGs
{
}

- (void)addAmpduAGG:(unint64_t)a3
{
}

- (unint64_t)ampduAGGAtIndex:(unint64_t)a3
{
  p_ampduAGGs = &self->_ampduAGGs;
  unint64_t count = self->_ampduAGGs.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_ampduAGGs->list[a3];
}

- (void)setAmpduAGGs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiNWActivityRateAndAggregation;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiNWActivityRateAndAggregation description](&v3, sel_description), -[AWDWiFiNWActivityRateAndAggregation dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  v2 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  [v2 setObject:PBRepeatedUInt64NSArray() forKey:@"rxVHTSuccess"];
  [v2 setObject:PBRepeatedUInt64NSArray() forKey:@"txVHTSuccess"];
  [v2 setObject:PBRepeatedUInt64NSArray() forKey:@"rxMCSSuccess"];
  [v2 setObject:PBRepeatedUInt64NSArray() forKey:@"txMCSSuccess"];
  [v2 setObject:PBRepeatedUInt64NSArray() forKey:@"ampduAGG"];
  return v2;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiNWActivityRateAndAggregationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_rxVHTSuccess = &self->_rxVHTSuccess;
  if (self->_rxVHTSuccess.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v5;
    }
    while (v5 < p_rxVHTSuccess->count);
  }
  if (self->_txVHTSuccess.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v6;
    }
    while (v6 < self->_txVHTSuccess.count);
  }
  if (self->_rxMCSSuccess.count)
  {
    unint64_t v7 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v7;
    }
    while (v7 < self->_rxMCSSuccess.count);
  }
  if (self->_txMCSSuccess.count)
  {
    unint64_t v8 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v8;
    }
    while (v8 < self->_txMCSSuccess.count);
  }
  p_ampduAGGs = &self->_ampduAGGs;
  if (p_ampduAGGs->count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      ++v10;
    }
    while (v10 < p_ampduAGGs->count);
  }
}

- (void)copyTo:(id)a3
{
  if ([(AWDWiFiNWActivityRateAndAggregation *)self rxVHTSuccessCount])
  {
    [a3 clearRxVHTSuccess];
    unint64_t v5 = [(AWDWiFiNWActivityRateAndAggregation *)self rxVHTSuccessCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addRxVHTSuccess:-[AWDWiFiNWActivityRateAndAggregation rxVHTSuccessAtIndex:](self, "rxVHTSuccessAtIndex:", i)];
    }
  }
  if ([(AWDWiFiNWActivityRateAndAggregation *)self txVHTSuccessCount])
  {
    [a3 clearTxVHTSuccess];
    unint64_t v8 = [(AWDWiFiNWActivityRateAndAggregation *)self txVHTSuccessCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
        [a3 addTxVHTSuccess:-[AWDWiFiNWActivityRateAndAggregation txVHTSuccessAtIndex:](self, "txVHTSuccessAtIndex:", j)];
    }
  }
  if ([(AWDWiFiNWActivityRateAndAggregation *)self rxMCSSuccessCount])
  {
    [a3 clearRxMCSSuccess];
    unint64_t v11 = [(AWDWiFiNWActivityRateAndAggregation *)self rxMCSSuccessCount];
    if (v11)
    {
      unint64_t v12 = v11;
      for (uint64_t k = 0; k != v12; ++k)
        [a3 addRxMCSSuccess:-[AWDWiFiNWActivityRateAndAggregation rxMCSSuccessAtIndex:](self, "rxMCSSuccessAtIndex:", k)];
    }
  }
  if ([(AWDWiFiNWActivityRateAndAggregation *)self txMCSSuccessCount])
  {
    [a3 clearTxMCSSuccess];
    unint64_t v14 = [(AWDWiFiNWActivityRateAndAggregation *)self txMCSSuccessCount];
    if (v14)
    {
      unint64_t v15 = v14;
      for (uint64_t m = 0; m != v15; ++m)
        [a3 addTxMCSSuccess:-[AWDWiFiNWActivityRateAndAggregation txMCSSuccessAtIndex:](self, "txMCSSuccessAtIndex:", m)];
    }
  }
  if ([(AWDWiFiNWActivityRateAndAggregation *)self ampduAGGsCount])
  {
    [a3 clearAmpduAGGs];
    unint64_t v17 = [(AWDWiFiNWActivityRateAndAggregation *)self ampduAGGsCount];
    if (v17)
    {
      unint64_t v18 = v17;
      for (uint64_t n = 0; n != v18; ++n)
        [a3 addAmpduAGG:[[self ampduAGGAtIndex:n]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = [objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedUInt64IsEqual()
    || !PBRepeatedUInt64IsEqual())
  {
    return 0;
  }

  return PBRepeatedUInt64IsEqual();
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedUInt64Hash();
  uint64_t v3 = PBRepeatedUInt64Hash() ^ v2;
  uint64_t v4 = PBRepeatedUInt64Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedUInt64Hash();
  return v5 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = [a3 rxVHTSuccessCount];
  if (v5)
  {
    uint64_t v6 = v5;
    for (uint64_t i = 0; i != v6; ++i)
      -[AWDWiFiNWActivityRateAndAggregation addRxVHTSuccess:](self, "addRxVHTSuccess:", [a3 rxVHTSuccessAtIndex:i]);
  }
  uint64_t v8 = [a3 txVHTSuccessCount];
  if (v8)
  {
    uint64_t v9 = v8;
    for (uint64_t j = 0; j != v9; ++j)
      -[AWDWiFiNWActivityRateAndAggregation addTxVHTSuccess:](self, "addTxVHTSuccess:", [a3 txVHTSuccessAtIndex:j]);
  }
  uint64_t v11 = [a3 rxMCSSuccessCount];
  if (v11)
  {
    uint64_t v12 = v11;
    for (uint64_t k = 0; k != v12; ++k)
      -[AWDWiFiNWActivityRateAndAggregation addRxMCSSuccess:](self, "addRxMCSSuccess:", [a3 rxMCSSuccessAtIndex:k]);
  }
  uint64_t v14 = [a3 txMCSSuccessCount];
  if (v14)
  {
    uint64_t v15 = v14;
    for (uint64_t m = 0; m != v15; ++m)
      -[AWDWiFiNWActivityRateAndAggregation addTxMCSSuccess:](self, "addTxMCSSuccess:", [a3 txMCSSuccessAtIndex:m]);
  }
  uint64_t v17 = [a3 ampduAGGsCount];
  if (v17)
  {
    uint64_t v18 = v17;
    for (uint64_t n = 0; n != v18; ++n)
      -[AWDWiFiNWActivityRateAndAggregation addAmpduAGG:](self, "addAmpduAGG:", [a3 ampduAGGAtIndex:n]);
  }
}

@end