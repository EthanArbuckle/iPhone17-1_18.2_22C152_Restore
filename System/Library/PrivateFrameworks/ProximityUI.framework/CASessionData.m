@interface CASessionData
- (CASessionData)init;
- (NSDictionary)configureCompleteEvent;
- (NSDictionary)configureEvent;
- (NSDictionary)deinitEvent;
- (NSNumber)isOwner;
- (NSNumber)numberOfErrorEvents;
- (NSUUID)productUUID;
- (void)error:(id)a3;
- (void)logData;
- (void)setConfigureCompleteEvent:(id)a3;
- (void)setConfigureEvent:(id)a3;
- (void)setDeinitEvent:(id)a3;
- (void)setIsOwner:(id)a3;
- (void)setNumberOfErrorEvents:(id)a3;
- (void)setProductUUID:(id)a3;
@end

@implementation CASessionData

- (CASessionData)init
{
  v5.receiver = self;
  v5.super_class = (Class)CASessionData;
  v2 = [(CASessionData *)&v5 init];
  if (v2)
  {
    v3 = [NSNumber numberWithInt:0];
    [(CASessionData *)v2 setNumberOfErrorEvents:v3];
  }
  return v2;
}

- (void)error:(id)a3
{
  v20[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = NSNumber;
  v6 = [(CASessionData *)self numberOfErrorEvents];
  v7 = objc_msgSend(v5, "numberWithInt:", objc_msgSend(v6, "intValue") + 1);
  [(CASessionData *)self setNumberOfErrorEvents:v7];

  v19[0] = @"status";
  v8 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v19[1] = @"errorDescription";
  v20[0] = v8;
  uint64_t v9 = objc_msgSend(v4, "objectForKeyedSubscript:");
  v20[1] = v9;
  v10 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:2];

  v11 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v10];
  v12 = [(CASessionData *)self productUUID];
  LOBYTE(v9) = v12 == 0;

  if ((v9 & 1) == 0)
  {
    v13 = [(CASessionData *)self productUUID];
    v14 = [v13 UUIDString];
    [v11 setObject:v14 forKeyedSubscript:@"ProductUUID"];
  }
  v15 = [(CASessionData *)self isOwner];
  BOOL v16 = v15 == 0;

  if (!v16)
  {
    v17 = [(CASessionData *)self isOwner];
    [v11 setObject:v17 forKeyedSubscript:@"IsOwner"];
  }
  id v18 = v11;
  AnalyticsSendEventLazy();
}

id __23__CASessionData_error___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)logData
{
  v32[3] = *MEMORY[0x263EF8340];
  v3 = [(CASessionData *)self configureEvent];

  if (v3)
  {
    id v4 = [(CASessionData *)self configureEvent];
    objc_super v5 = [v4 objectForKeyedSubscript:@"timeElapsed"];
    [v5 doubleValue];
    double v7 = v6;
  }
  else
  {
    double v7 = -1.0;
  }
  v8 = [(CASessionData *)self configureCompleteEvent];

  if (v8)
  {
    uint64_t v9 = [(CASessionData *)self configureCompleteEvent];
    v10 = [v9 objectForKeyedSubscript:@"timeElapsed"];
    [v10 doubleValue];
    double v12 = v11 - v7;
  }
  else
  {
    double v12 = -1.0;
  }
  v13 = [(CASessionData *)self deinitEvent];

  if (v13)
  {
    v14 = [(CASessionData *)self deinitEvent];
    v15 = [v14 objectForKeyedSubscript:@"timeElapsed"];
    [v15 doubleValue];
    double v17 = v16 - v7;
  }
  else
  {
    double v17 = -1.0;
  }
  id v18 = (void *)MEMORY[0x263EFF9A0];
  v31[0] = @"TimeToConfigure";
  uint64_t v19 = [NSNumber numberWithDouble:v12];
  v32[0] = v19;
  v31[1] = @"SessionDuration";
  v20 = [NSNumber numberWithDouble:v17];
  v32[1] = v20;
  v31[2] = @"NumberOfErrorEvents";
  v21 = [(CASessionData *)self numberOfErrorEvents];
  v32[2] = v21;
  v22 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:3];
  v23 = [v18 dictionaryWithDictionary:v22];

  v24 = [(CASessionData *)self productUUID];
  LOBYTE(v19) = v24 == 0;

  if ((v19 & 1) == 0)
  {
    v25 = [(CASessionData *)self productUUID];
    v26 = [v25 UUIDString];
    [v23 setObject:v26 forKeyedSubscript:@"ProductUUID"];
  }
  v27 = [(CASessionData *)self isOwner];
  BOOL v28 = v27 == 0;

  if (!v28)
  {
    v29 = [(CASessionData *)self isOwner];
    [v23 setObject:v29 forKeyedSubscript:@"IsOwner"];
  }
  id v30 = v23;
  AnalyticsSendEventLazy();
}

id __24__CASessionData_logData__block_invoke(uint64_t a1)
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

- (NSUUID)productUUID
{
  return self->_productUUID;
}

- (void)setProductUUID:(id)a3
{
}

- (NSNumber)isOwner
{
  return self->_isOwner;
}

- (void)setIsOwner:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_isOwner, 0);
  objc_storeStrong((id *)&self->_productUUID, 0);
  objc_storeStrong((id *)&self->_numberOfErrorEvents, 0);
  objc_storeStrong((id *)&self->_deinitEvent, 0);
  objc_storeStrong((id *)&self->_configureCompleteEvent, 0);
  objc_storeStrong((id *)&self->_configureEvent, 0);
}

@end