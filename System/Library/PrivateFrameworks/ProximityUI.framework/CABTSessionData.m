@interface CABTSessionData
- (BOOL)isOwner;
- (CABTSessionData)init;
- (NSDictionary)configureCompleteEvent;
- (NSDictionary)configureEvent;
- (NSDictionary)deinitEvent;
- (NSNumber)numberOfErrorEvents;
- (NSUUID)productUUID;
- (int)txPower;
- (void)configure:(id)a3 withOwner:(BOOL)a4;
- (void)configureComplete:(id)a3 withTxPower:(int)a4;
- (void)error:(id)a3;
- (void)logData;
- (void)setConfigureCompleteEvent:(id)a3;
- (void)setConfigureEvent:(id)a3;
- (void)setDeinitEvent:(id)a3;
- (void)setIsOwner:(BOOL)a3;
- (void)setNumberOfErrorEvents:(id)a3;
- (void)setProductUUID:(id)a3;
- (void)setTxPower:(int)a3;
@end

@implementation CABTSessionData

- (CABTSessionData)init
{
  v5.receiver = self;
  v5.super_class = (Class)CABTSessionData;
  v2 = [(CABTSessionData *)&v5 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CABTSessionData *)v2 setNumberOfErrorEvents:v3];

    [(CABTSessionData *)v2 setTxPower:4294967096];
  }
  return v2;
}

- (void)configure:(id)a3 withOwner:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  [(CABTSessionData *)self setIsOwner:v4];
  [(CABTSessionData *)self setConfigureEvent:v6];
}

- (void)configureComplete:(id)a3 withTxPower:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  -[CABTSessionData setConfigureCompleteEvent:](self, "setConfigureCompleteEvent:");
  [(CABTSessionData *)self setTxPower:v4];
}

- (void)error:(id)a3
{
  v17[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = NSNumber;
  id v6 = [(CABTSessionData *)self numberOfErrorEvents];
  v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CABTSessionData *)self setNumberOfErrorEvents:v7];

  v16[0] = @"status";
  v8 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v16[1] = @"errorDescription";
  v17[0] = v8;
  uint64_t v9 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v17[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v17 forKeys:v16 count:2];

  v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
  v12 = [(CABTSessionData *)self productUUID];
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    v13 = [(CABTSessionData *)self productUUID];
    v14 = [v13 UUIDString];
    [v11 setObject:v14 forKeyedSubscript:@"ProductUUID"];
  }
  id v15 = v11;
  AnalyticsSendEventLazy();
}

id __25__CABTSessionData_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logData
{
  v31[5] = *MEMORY[0x263EF8340];
  v3 = [(CABTSessionData *)self configureEvent];

  if (v3)
  {
    id v4 = [(CABTSessionData *)self configureEvent];
    objc_super v5 = [v4 objectForKeyedSubscript:@"timeElapsed"];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }
  v8 = [(CABTSessionData *)self configureCompleteEvent];

  if (v8)
  {
    uint64_t v9 = [(CABTSessionData *)self configureCompleteEvent];
    v10 = [v9 objectForKeyedSubscript:@"timeElapsed"];
    [v10 doubleValue];
    double v12 = v11 - v7;
  }
  else
  {
    double v12 = -1.0;
  }
  v13 = [(CABTSessionData *)self deinitEvent];

  if (v13)
  {
    v14 = [(CABTSessionData *)self deinitEvent];
    id v15 = [v14 objectForKeyedSubscript:@"timeElapsed"];
    [v15 doubleValue];
    double v17 = v16 - v7;
  }
  else
  {
    double v17 = -1.0;
  }
  v18 = (void *)MEMORY[0x263EFF9A0];
  v30[0] = @"TimeToConfigure";
  uint64_t v19 = [NSNumber numberWithDouble:v12];
  v31[0] = v19;
  v30[1] = @"SessionDuration";
  v20 = [NSNumber numberWithDouble:v17];
  v31[1] = v20;
  v30[2] = @"NumberOfErrorEvents";
  v21 = [(CABTSessionData *)self numberOfErrorEvents];
  v31[2] = v21;
  v30[3] = @"IsOwner";
  v22 = objc_msgSend(NSNumber, "numberWithBool:", -[CABTSessionData isOwner](self, "isOwner"));
  v31[3] = v22;
  v30[4] = @"TxPower";
  v23 = objc_msgSend(NSNumber, "numberWithInt:", -[CABTSessionData txPower](self, "txPower"));
  v31[4] = v23;
  v24 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:5];
  v25 = [v18 dictionaryWithDictionary:v24];

  v26 = [(CABTSessionData *)self productUUID];
  LOBYTE(v19) = v26 == 0;

  if ((v19 & 1) == 0)
  {
    v27 = [(CABTSessionData *)self productUUID];
    v28 = [v27 UUIDString];
    [v25 setObject:v28 forKeyedSubscript:@"ProductUUID"];
  }
  id v29 = v25;
  AnalyticsSendEventLazy();
}

id __26__CABTSessionData_logData__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (NSDictionary)configureEvent
{
  return self->_configureEvent;
}

- (void)setConfigureEvent:(id)a3
{
}

- (NSDictionary)configureCompleteEvent
{
  return self->_configureCompleteEvent;
}

- (void)setConfigureCompleteEvent:(id)a3
{
}

- (NSDictionary)deinitEvent
{
  return self->_deinitEvent;
}

- (void)setDeinitEvent:(id)a3
{
}

- (NSNumber)numberOfErrorEvents
{
  return self->_numberOfErrorEvents;
}

- (void)setNumberOfErrorEvents:(id)a3
{
}

- (BOOL)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(BOOL)a3
{
  self->_isOwner = a3;
}

- (int)txPower
{
  return self->_txPower;
}

- (void)setTxPower:(int)a3
{
  self->_txPower = a3;
}

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_deinitEvent, 0);
  objc_storeStrong((id *)&self->_configureCompleteEvent, 0);
  objc_storeStrong((id *)&self->_configureEvent, 0);
}

@end