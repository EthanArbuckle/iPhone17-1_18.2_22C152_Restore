@interface WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)ampduAGGAtIndex:(unint64_t)a3;
- (unint64_t)ampduAGGs;
- (unint64_t)ampduAGGsCount;
- (unint64_t)hash;
- (unint64_t)rxHESuccess;
- (unint64_t)rxHESuccessAtIndex:(unint64_t)a3;
- (unint64_t)rxHESuccessCount;
- (unint64_t)rxMCSSuccess;
- (unint64_t)rxMCSSuccessAtIndex:(unint64_t)a3;
- (unint64_t)rxMCSSuccessCount;
- (unint64_t)rxVHTSuccess;
- (unint64_t)rxVHTSuccessAtIndex:(unint64_t)a3;
- (unint64_t)rxVHTSuccessCount;
- (unint64_t)rxampduMUMIMOAtIndex:(unint64_t)a3;
- (unint64_t)rxampduMUMIMOs;
- (unint64_t)rxampduMUMIMOsCount;
- (unint64_t)rxampduOFDMAAtIndex:(unint64_t)a3;
- (unint64_t)rxampduOFDMAs;
- (unint64_t)rxampduOFDMAsCount;
- (unint64_t)rxampduSUAtIndex:(unint64_t)a3;
- (unint64_t)rxampduSUs;
- (unint64_t)rxampduSUsCount;
- (unint64_t)txHESuccess;
- (unint64_t)txHESuccessAtIndex:(unint64_t)a3;
- (unint64_t)txHESuccessCount;
- (unint64_t)txMCSSuccess;
- (unint64_t)txMCSSuccessAtIndex:(unint64_t)a3;
- (unint64_t)txMCSSuccessCount;
- (unint64_t)txVHTSuccess;
- (unint64_t)txVHTSuccessAtIndex:(unint64_t)a3;
- (unint64_t)txVHTSuccessCount;
- (unint64_t)txampduMUMIMOAtIndex:(unint64_t)a3;
- (unint64_t)txampduMUMIMOs;
- (unint64_t)txampduMUMIMOsCount;
- (unint64_t)txampduOFDMAAtIndex:(unint64_t)a3;
- (unint64_t)txampduOFDMAs;
- (unint64_t)txampduOFDMAsCount;
- (unint64_t)txampduSUAtIndex:(unint64_t)a3;
- (unint64_t)txampduSUs;
- (unint64_t)txampduSUsCount;
- (void)addAmpduAGG:(unint64_t)a3;
- (void)addRxHESuccess:(unint64_t)a3;
- (void)addRxMCSSuccess:(unint64_t)a3;
- (void)addRxVHTSuccess:(unint64_t)a3;
- (void)addRxampduMUMIMO:(unint64_t)a3;
- (void)addRxampduOFDMA:(unint64_t)a3;
- (void)addRxampduSU:(unint64_t)a3;
- (void)addTxHESuccess:(unint64_t)a3;
- (void)addTxMCSSuccess:(unint64_t)a3;
- (void)addTxVHTSuccess:(unint64_t)a3;
- (void)addTxampduMUMIMO:(unint64_t)a3;
- (void)addTxampduOFDMA:(unint64_t)a3;
- (void)addTxampduSU:(unint64_t)a3;
- (void)clearAmpduAGGs;
- (void)clearRxHESuccess;
- (void)clearRxMCSSuccess;
- (void)clearRxVHTSuccess;
- (void)clearRxampduMUMIMOs;
- (void)clearRxampduOFDMAs;
- (void)clearRxampduSUs;
- (void)clearTxHESuccess;
- (void)clearTxMCSSuccess;
- (void)clearTxVHTSuccess;
- (void)clearTxampduMUMIMOs;
- (void)clearTxampduOFDMAs;
- (void)clearTxampduSUs;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAmpduAGGs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxHESuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxampduMUMIMOs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxampduOFDMAs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setRxampduSUs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxHESuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxMCSSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxVHTSuccess:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxampduMUMIMOs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxampduOFDMAs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)setTxampduSUs:(unint64_t *)a3 count:(unint64_t)a4;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation

- (void)addTxVHTSuccess:(unint64_t)a3
{
}

- (void)addRxVHTSuccess:(unint64_t)a3
{
}

- (void)dealloc
{
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  PBRepeatedUInt64Clear();
  v3.receiver = self;
  v3.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation;
  [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)&v3 dealloc];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v19 = v4;
  if (self->_rxVHTSuccess.count)
  {
    unint64_t v5 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v5;
    }
    while (v5 < self->_rxVHTSuccess.count);
  }
  if (self->_txVHTSuccess.count)
  {
    unint64_t v6 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
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
      id v4 = v19;
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
      id v4 = v19;
      ++v8;
    }
    while (v8 < self->_txMCSSuccess.count);
  }
  if (self->_ampduAGGs.count)
  {
    unint64_t v9 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v9;
    }
    while (v9 < self->_ampduAGGs.count);
  }
  if (self->_rxHESuccess.count)
  {
    unint64_t v10 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v10;
    }
    while (v10 < self->_rxHESuccess.count);
  }
  if (self->_txHESuccess.count)
  {
    unint64_t v11 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v11;
    }
    while (v11 < self->_txHESuccess.count);
  }
  if (self->_rxampduSUs.count)
  {
    unint64_t v12 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v12;
    }
    while (v12 < self->_rxampduSUs.count);
  }
  if (self->_txampduSUs.count)
  {
    unint64_t v13 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v13;
    }
    while (v13 < self->_txampduSUs.count);
  }
  if (self->_rxampduOFDMAs.count)
  {
    unint64_t v14 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v14;
    }
    while (v14 < self->_rxampduOFDMAs.count);
  }
  if (self->_txampduOFDMAs.count)
  {
    unint64_t v15 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v15;
    }
    while (v15 < self->_txampduOFDMAs.count);
  }
  if (self->_rxampduMUMIMOs.count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v16;
    }
    while (v16 < self->_rxampduMUMIMOs.count);
  }
  p_txampduMUMIMOs = &self->_txampduMUMIMOs;
  if (p_txampduMUMIMOs->count)
  {
    unint64_t v18 = 0;
    do
    {
      PBDataWriterWriteUint64Field();
      id v4 = v19;
      ++v18;
    }
    while (v18 < p_txampduMUMIMOs->count);
  }
}

- (id)dictionaryRepresentation
{
  v2 = [MEMORY[0x263EFF9A0] dictionary];
  objc_super v3 = PBRepeatedUInt64NSArray();
  [v2 setObject:v3 forKey:@"rxVHTSuccess"];

  id v4 = PBRepeatedUInt64NSArray();
  [v2 setObject:v4 forKey:@"txVHTSuccess"];

  unint64_t v5 = PBRepeatedUInt64NSArray();
  [v2 setObject:v5 forKey:@"rxMCSSuccess"];

  unint64_t v6 = PBRepeatedUInt64NSArray();
  [v2 setObject:v6 forKey:@"txMCSSuccess"];

  unint64_t v7 = PBRepeatedUInt64NSArray();
  [v2 setObject:v7 forKey:@"ampduAGG"];

  unint64_t v8 = PBRepeatedUInt64NSArray();
  [v2 setObject:v8 forKey:@"rxHESuccess"];

  unint64_t v9 = PBRepeatedUInt64NSArray();
  [v2 setObject:v9 forKey:@"txHESuccess"];

  unint64_t v10 = PBRepeatedUInt64NSArray();
  [v2 setObject:v10 forKey:@"rxampduSU"];

  unint64_t v11 = PBRepeatedUInt64NSArray();
  [v2 setObject:v11 forKey:@"txampduSU"];

  unint64_t v12 = PBRepeatedUInt64NSArray();
  [v2 setObject:v12 forKey:@"rxampduOFDMA"];

  unint64_t v13 = PBRepeatedUInt64NSArray();
  [v2 setObject:v13 forKey:@"txampduOFDMA"];

  unint64_t v14 = PBRepeatedUInt64NSArray();
  [v2 setObject:v14 forKey:@"rxampduMUMIMO"];

  unint64_t v15 = PBRepeatedUInt64NSArray();
  [v2 setObject:v15 forKey:@"txampduMUMIMO"];

  return v2;
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

- (unint64_t)rxVHTSuccessAtIndex:(unint64_t)a3
{
  p_rxVHTSuccess = &self->_rxVHTSuccess;
  unint64_t count = self->_rxVHTSuccess.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
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

- (unint64_t)txVHTSuccessAtIndex:(unint64_t)a3
{
  p_txVHTSuccess = &self->_txVHTSuccess;
  unint64_t count = self->_txVHTSuccess.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
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
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
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
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
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
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_ampduAGGs->list[a3];
}

- (void)setAmpduAGGs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxHESuccessCount
{
  return self->_rxHESuccess.count;
}

- (unint64_t)rxHESuccess
{
  return self->_rxHESuccess.list;
}

- (void)clearRxHESuccess
{
}

- (void)addRxHESuccess:(unint64_t)a3
{
}

- (unint64_t)rxHESuccessAtIndex:(unint64_t)a3
{
  p_rxHESuccess = &self->_rxHESuccess;
  unint64_t count = self->_rxHESuccess.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_rxHESuccess->list[a3];
}

- (void)setRxHESuccess:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txHESuccessCount
{
  return self->_txHESuccess.count;
}

- (unint64_t)txHESuccess
{
  return self->_txHESuccess.list;
}

- (void)clearTxHESuccess
{
}

- (void)addTxHESuccess:(unint64_t)a3
{
}

- (unint64_t)txHESuccessAtIndex:(unint64_t)a3
{
  p_txHESuccess = &self->_txHESuccess;
  unint64_t count = self->_txHESuccess.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_txHESuccess->list[a3];
}

- (void)setTxHESuccess:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxampduSUsCount
{
  return self->_rxampduSUs.count;
}

- (unint64_t)rxampduSUs
{
  return self->_rxampduSUs.list;
}

- (void)clearRxampduSUs
{
}

- (void)addRxampduSU:(unint64_t)a3
{
}

- (unint64_t)rxampduSUAtIndex:(unint64_t)a3
{
  p_rxampduSUs = &self->_rxampduSUs;
  unint64_t count = self->_rxampduSUs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_rxampduSUs->list[a3];
}

- (void)setRxampduSUs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txampduSUsCount
{
  return self->_txampduSUs.count;
}

- (unint64_t)txampduSUs
{
  return self->_txampduSUs.list;
}

- (void)clearTxampduSUs
{
}

- (void)addTxampduSU:(unint64_t)a3
{
}

- (unint64_t)txampduSUAtIndex:(unint64_t)a3
{
  p_txampduSUs = &self->_txampduSUs;
  unint64_t count = self->_txampduSUs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_txampduSUs->list[a3];
}

- (void)setTxampduSUs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxampduOFDMAsCount
{
  return self->_rxampduOFDMAs.count;
}

- (unint64_t)rxampduOFDMAs
{
  return self->_rxampduOFDMAs.list;
}

- (void)clearRxampduOFDMAs
{
}

- (void)addRxampduOFDMA:(unint64_t)a3
{
}

- (unint64_t)rxampduOFDMAAtIndex:(unint64_t)a3
{
  p_rxampduOFDMAs = &self->_rxampduOFDMAs;
  unint64_t count = self->_rxampduOFDMAs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_rxampduOFDMAs->list[a3];
}

- (void)setRxampduOFDMAs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txampduOFDMAsCount
{
  return self->_txampduOFDMAs.count;
}

- (unint64_t)txampduOFDMAs
{
  return self->_txampduOFDMAs.list;
}

- (void)clearTxampduOFDMAs
{
}

- (void)addTxampduOFDMA:(unint64_t)a3
{
}

- (unint64_t)txampduOFDMAAtIndex:(unint64_t)a3
{
  p_txampduOFDMAs = &self->_txampduOFDMAs;
  unint64_t count = self->_txampduOFDMAs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_txampduOFDMAs->list[a3];
}

- (void)setTxampduOFDMAs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)rxampduMUMIMOsCount
{
  return self->_rxampduMUMIMOs.count;
}

- (unint64_t)rxampduMUMIMOs
{
  return self->_rxampduMUMIMOs.list;
}

- (void)clearRxampduMUMIMOs
{
}

- (void)addRxampduMUMIMO:(unint64_t)a3
{
}

- (unint64_t)rxampduMUMIMOAtIndex:(unint64_t)a3
{
  p_rxampduMUMIMOs = &self->_rxampduMUMIMOs;
  unint64_t count = self->_rxampduMUMIMOs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_rxampduMUMIMOs->list[a3];
}

- (void)setRxampduMUMIMOs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (unint64_t)txampduMUMIMOsCount
{
  return self->_txampduMUMIMOs.count;
}

- (unint64_t)txampduMUMIMOs
{
  return self->_txampduMUMIMOs.list;
}

- (void)clearTxampduMUMIMOs
{
}

- (void)addTxampduMUMIMO:(unint64_t)a3
{
}

- (unint64_t)txampduMUMIMOAtIndex:(unint64_t)a3
{
  p_txampduMUMIMOs = &self->_txampduMUMIMOs;
  unint64_t count = self->_txampduMUMIMOs.count;
  if (count <= a3)
  {
    unint64_t v6 = (void *)MEMORY[0x263EFF940];
    uint64_t v7 = *MEMORY[0x263EFF578];
    unint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"idx (%lu) is out of range (%lu)", a3, count);
    unint64_t v9 = [v6 exceptionWithName:v7 reason:v8 userInfo:0];
    [v9 raise];
  }
  return p_txampduMUMIMOs->list[a3];
}

- (void)setTxampduMUMIMOs:(unint64_t *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  objc_super v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation;
  id v4 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)&v8 description];
  unint64_t v5 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityRateAndAggregationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  id v43 = a3;
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxVHTSuccessCount])
  {
    [v43 clearRxVHTSuccess];
    unint64_t v4 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxVHTSuccessCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
        objc_msgSend(v43, "addRxVHTSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxVHTSuccessAtIndex:](self, "rxVHTSuccessAtIndex:", i));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txVHTSuccessCount])
  {
    [v43 clearTxVHTSuccess];
    unint64_t v7 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txVHTSuccessCount];
    if (v7)
    {
      unint64_t v8 = v7;
      for (uint64_t j = 0; j != v8; ++j)
        objc_msgSend(v43, "addTxVHTSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txVHTSuccessAtIndex:](self, "txVHTSuccessAtIndex:", j));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxMCSSuccessCount])
  {
    [v43 clearRxMCSSuccess];
    unint64_t v10 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxMCSSuccessCount];
    if (v10)
    {
      unint64_t v11 = v10;
      for (uint64_t k = 0; k != v11; ++k)
        objc_msgSend(v43, "addRxMCSSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxMCSSuccessAtIndex:](self, "rxMCSSuccessAtIndex:", k));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txMCSSuccessCount])
  {
    [v43 clearTxMCSSuccess];
    unint64_t v13 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txMCSSuccessCount];
    if (v13)
    {
      unint64_t v14 = v13;
      for (uint64_t m = 0; m != v14; ++m)
        objc_msgSend(v43, "addTxMCSSuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txMCSSuccessAtIndex:](self, "txMCSSuccessAtIndex:", m));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self ampduAGGsCount])
  {
    [v43 clearAmpduAGGs];
    unint64_t v16 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self ampduAGGsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t n = 0; n != v17; ++n)
        objc_msgSend(v43, "addAmpduAGG:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation ampduAGGAtIndex:](self, "ampduAGGAtIndex:", n));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxHESuccessCount])
  {
    [v43 clearRxHESuccess];
    unint64_t v19 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxHESuccessCount];
    if (v19)
    {
      unint64_t v20 = v19;
      for (iuint64_t i = 0; ii != v20; ++ii)
        objc_msgSend(v43, "addRxHESuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxHESuccessAtIndex:](self, "rxHESuccessAtIndex:", ii));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txHESuccessCount])
  {
    [v43 clearTxHESuccess];
    unint64_t v22 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txHESuccessCount];
    if (v22)
    {
      unint64_t v23 = v22;
      for (juint64_t j = 0; jj != v23; ++jj)
        objc_msgSend(v43, "addTxHESuccess:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txHESuccessAtIndex:](self, "txHESuccessAtIndex:", jj));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxampduSUsCount])
  {
    [v43 clearRxampduSUs];
    unint64_t v25 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxampduSUsCount];
    if (v25)
    {
      unint64_t v26 = v25;
      for (kuint64_t k = 0; kk != v26; ++kk)
        objc_msgSend(v43, "addRxampduSU:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduSUAtIndex:](self, "rxampduSUAtIndex:", kk));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txampduSUsCount])
  {
    [v43 clearTxampduSUs];
    unint64_t v28 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txampduSUsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (muint64_t m = 0; mm != v29; ++mm)
        objc_msgSend(v43, "addTxampduSU:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduSUAtIndex:](self, "txampduSUAtIndex:", mm));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxampduOFDMAsCount])
  {
    [v43 clearRxampduOFDMAs];
    unint64_t v31 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxampduOFDMAsCount];
    if (v31)
    {
      unint64_t v32 = v31;
      for (nuint64_t n = 0; nn != v32; ++nn)
        objc_msgSend(v43, "addRxampduOFDMA:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduOFDMAAtIndex:](self, "rxampduOFDMAAtIndex:", nn));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txampduOFDMAsCount])
  {
    [v43 clearTxampduOFDMAs];
    unint64_t v34 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txampduOFDMAsCount];
    if (v34)
    {
      unint64_t v35 = v34;
      for (uint64_t i1 = 0; i1 != v35; ++i1)
        objc_msgSend(v43, "addTxampduOFDMA:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduOFDMAAtIndex:](self, "txampduOFDMAAtIndex:", i1));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxampduMUMIMOsCount])
  {
    [v43 clearRxampduMUMIMOs];
    unint64_t v37 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self rxampduMUMIMOsCount];
    if (v37)
    {
      unint64_t v38 = v37;
      for (uint64_t i2 = 0; i2 != v38; ++i2)
        objc_msgSend(v43, "addRxampduMUMIMO:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation rxampduMUMIMOAtIndex:](self, "rxampduMUMIMOAtIndex:", i2));
    }
  }
  if ([(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txampduMUMIMOsCount])
  {
    [v43 clearTxampduMUMIMOs];
    unint64_t v40 = [(WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation *)self txampduMUMIMOsCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (uint64_t i3 = 0; i3 != v41; ++i3)
        objc_msgSend(v43, "addTxampduMUMIMO:", -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation txampduMUMIMOAtIndex:](self, "txampduMUMIMOAtIndex:", i3));
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  objc_super v3 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  PBRepeatedUInt64Copy();
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v3 = a3;
  if ([v3 isMemberOfClass:objc_opt_class()]
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual()
    && PBRepeatedUInt64IsEqual())
  {
    char IsEqual = PBRepeatedUInt64IsEqual();
  }
  else
  {
    char IsEqual = 0;
  }

  return IsEqual;
}

- (unint64_t)hash
{
  uint64_t v2 = PBRepeatedUInt64Hash();
  uint64_t v3 = PBRepeatedUInt64Hash() ^ v2;
  uint64_t v4 = PBRepeatedUInt64Hash();
  uint64_t v5 = v3 ^ v4 ^ PBRepeatedUInt64Hash();
  uint64_t v6 = PBRepeatedUInt64Hash();
  uint64_t v7 = v6 ^ PBRepeatedUInt64Hash();
  uint64_t v8 = v5 ^ v7 ^ PBRepeatedUInt64Hash();
  uint64_t v9 = PBRepeatedUInt64Hash();
  uint64_t v10 = v9 ^ PBRepeatedUInt64Hash();
  uint64_t v11 = v10 ^ PBRepeatedUInt64Hash();
  uint64_t v12 = v8 ^ v11 ^ PBRepeatedUInt64Hash();
  uint64_t v13 = PBRepeatedUInt64Hash();
  return v12 ^ v13 ^ PBRepeatedUInt64Hash();
}

- (void)mergeFrom:(id)a3
{
  id v43 = a3;
  uint64_t v4 = [v43 rxVHTSuccessCount];
  if (v4)
  {
    uint64_t v5 = v4;
    for (uint64_t i = 0; i != v5; ++i)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxVHTSuccess:](self, "addRxVHTSuccess:", [v43 rxVHTSuccessAtIndex:i]);
  }
  uint64_t v7 = [v43 txVHTSuccessCount];
  if (v7)
  {
    uint64_t v8 = v7;
    for (uint64_t j = 0; j != v8; ++j)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxVHTSuccess:](self, "addTxVHTSuccess:", [v43 txVHTSuccessAtIndex:j]);
  }
  uint64_t v10 = [v43 rxMCSSuccessCount];
  if (v10)
  {
    uint64_t v11 = v10;
    for (uint64_t k = 0; k != v11; ++k)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxMCSSuccess:](self, "addRxMCSSuccess:", [v43 rxMCSSuccessAtIndex:k]);
  }
  uint64_t v13 = [v43 txMCSSuccessCount];
  if (v13)
  {
    uint64_t v14 = v13;
    for (uint64_t m = 0; m != v14; ++m)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxMCSSuccess:](self, "addTxMCSSuccess:", [v43 txMCSSuccessAtIndex:m]);
  }
  uint64_t v16 = [v43 ampduAGGsCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t n = 0; n != v17; ++n)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addAmpduAGG:](self, "addAmpduAGG:", [v43 ampduAGGAtIndex:n]);
  }
  uint64_t v19 = [v43 rxHESuccessCount];
  if (v19)
  {
    uint64_t v20 = v19;
    for (iuint64_t i = 0; ii != v20; ++ii)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxHESuccess:](self, "addRxHESuccess:", [v43 rxHESuccessAtIndex:ii]);
  }
  uint64_t v22 = [v43 txHESuccessCount];
  if (v22)
  {
    uint64_t v23 = v22;
    for (juint64_t j = 0; jj != v23; ++jj)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxHESuccess:](self, "addTxHESuccess:", [v43 txHESuccessAtIndex:jj]);
  }
  uint64_t v25 = [v43 rxampduSUsCount];
  if (v25)
  {
    uint64_t v26 = v25;
    for (kuint64_t k = 0; kk != v26; ++kk)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxampduSU:](self, "addRxampduSU:", [v43 rxampduSUAtIndex:kk]);
  }
  uint64_t v28 = [v43 txampduSUsCount];
  if (v28)
  {
    uint64_t v29 = v28;
    for (muint64_t m = 0; mm != v29; ++mm)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxampduSU:](self, "addTxampduSU:", [v43 txampduSUAtIndex:mm]);
  }
  uint64_t v31 = [v43 rxampduOFDMAsCount];
  if (v31)
  {
    uint64_t v32 = v31;
    for (nuint64_t n = 0; nn != v32; ++nn)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxampduOFDMA:](self, "addRxampduOFDMA:", [v43 rxampduOFDMAAtIndex:nn]);
  }
  uint64_t v34 = [v43 txampduOFDMAsCount];
  if (v34)
  {
    uint64_t v35 = v34;
    for (uint64_t i1 = 0; i1 != v35; ++i1)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxampduOFDMA:](self, "addTxampduOFDMA:", [v43 txampduOFDMAAtIndex:i1]);
  }
  uint64_t v37 = [v43 rxampduMUMIMOsCount];
  if (v37)
  {
    uint64_t v38 = v37;
    for (uint64_t i2 = 0; i2 != v38; ++i2)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addRxampduMUMIMO:](self, "addRxampduMUMIMO:", [v43 rxampduMUMIMOAtIndex:i2]);
  }
  uint64_t v40 = [v43 txampduMUMIMOsCount];
  if (v40)
  {
    uint64_t v41 = v40;
    for (uint64_t i3 = 0; i3 != v41; ++i3)
      -[WiFiAnalyticsAWDWiFiNWActivityRateAndAggregation addTxampduMUMIMO:](self, "addTxampduMUMIMO:", [v43 txampduMUMIMOAtIndex:i3]);
  }
}

@end