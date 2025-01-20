@interface MTMediaActivityEventHandler
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)metricsDataForStartActionWithPosition:(unint64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7;
- (id)metricsDataForStopActionWithPosition:(unint64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 startMetricsData:(id)a7 eventData:(id)a8;
- (void)didCreateMetricsData:(id)a3;
@end

@implementation MTMediaActivityEventHandler

- (void)didCreateMetricsData:(id)a3
{
  id v4 = a3;
  [v4 addPostProcessingBlock:&__block_literal_global_4];
  v5.receiver = self;
  v5.super_class = (Class)MTMediaActivityEventHandler;
  [(MTEventHandler *)&v5 didCreateMetricsData:v4];
}

void __52__MTMediaActivityEventHandler_didCreateMetricsData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (_block_invoke_onceToken != -1) {
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_3);
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = (id)_block_invoke_mediaTimeFieldNames;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v2, "objectForKeyedSubscript:", v8, (void)v12);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "unsignedLongLongValue"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0) {
            goto LABEL_13;
          }
          uint64_t v10 = [(id)_block_invoke_numberFormatter numberFromString:v9];
        }
        v11 = (void *)v10;
        [v2 setObject:v10 forKeyedSubscript:v8];

LABEL_13:
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

void __52__MTMediaActivityEventHandler_didCreateMetricsData___block_invoke_2()
{
  v4[8] = *MEMORY[0x263EF8340];
  v4[0] = @"startTime";
  v4[1] = @"length";
  v4[4] = @"startPosition";
  v4[5] = @"startOverallPosition";
  v4[2] = @"position";
  v4[3] = @"overallPosition";
  v4[6] = @"duration";
  v4[7] = @"overallPosition";
  uint64_t v0 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:8];
  v1 = (void *)_block_invoke_mediaTimeFieldNames;
  _block_invoke_mediaTimeFieldNames = v0;

  id v2 = objc_alloc_init(MEMORY[0x263F08A30]);
  id v3 = (void *)_block_invoke_numberFormatter;
  _block_invoke_numberFormatter = (uint64_t)v2;
}

- (id)metricsDataForStartActionWithPosition:(unint64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 eventData:(id)a7
{
  v25[4] = *MEMORY[0x263EF8340];
  id v12 = a5;
  id v13 = a6;
  v24[0] = @"position";
  long long v14 = NSNumber;
  id v15 = a7;
  v16 = [v14 numberWithLongLong:a3];
  v25[0] = v16;
  v24[1] = @"overallPosition";
  uint64_t v17 = [NSNumber numberWithLongLong:a4];
  v25[1] = v17;
  v24[2] = @"startType";
  v18 = v12;
  if (!v12)
  {
    v18 = [MEMORY[0x263EFF9D0] null];
  }
  v25[2] = v18;
  v24[3] = @"startReason";
  v19 = v13;
  if (!v13)
  {
    v19 = [MEMORY[0x263EFF9D0] null];
  }
  v25[3] = v19;
  v20 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:4];
  if (v13)
  {
    if (v12) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v12) {
      goto LABEL_7;
    }
  }

LABEL_7:
  v23.receiver = self;
  v23.super_class = (Class)MTMediaActivityEventHandler;
  v21 = -[MTEventHandler metricsDataWithFields:](&v23, sel_metricsDataWithFields_, v20, v15, 0);

  return v21;
}

- (id)metricsDataForStopActionWithPosition:(unint64_t)a3 overallPosition:(unint64_t)a4 type:(id)a5 reason:(id)a6 startMetricsData:(id)a7 eventData:(id)a8
{
  v30[4] = *MEMORY[0x263EF8340];
  id v14 = a5;
  id v15 = a6;
  v29[0] = @"position";
  v16 = NSNumber;
  id v17 = a8;
  id v18 = a7;
  v19 = [v16 numberWithLongLong:a3];
  v30[0] = v19;
  v29[1] = @"overallPosition";
  v20 = [NSNumber numberWithLongLong:a4];
  v30[1] = v20;
  v29[2] = @"stopType";
  v21 = v14;
  if (!v14)
  {
    v21 = [MEMORY[0x263EFF9D0] null];
  }
  v30[2] = v21;
  v29[3] = @"stopReason";
  v22 = v15;
  if (!v15)
  {
    v22 = [MEMORY[0x263EFF9D0] null];
  }
  v30[3] = v22;
  objc_super v23 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
  if (v15)
  {
    if (v14) {
      goto LABEL_7;
    }
  }
  else
  {

    if (v14) {
      goto LABEL_7;
    }
  }

LABEL_7:
  v24 = [v18 toDictionary];

  v28[0] = MEMORY[0x263EF8330];
  v28[1] = 3221225472;
  v28[2] = __123__MTMediaActivityEventHandler_metricsDataForStopActionWithPosition_overallPosition_type_reason_startMetricsData_eventData___block_invoke;
  v28[3] = &unk_26430F898;
  v28[4] = self;
  v25 = [v24 thenWithBlock:v28];

  v26 = -[MTEventHandler metricsDataWithFields:](self, "metricsDataWithFields:", v25, v23, v17, 0);

  return v26;
}

id __123__MTMediaActivityEventHandler_metricsDataForStopActionWithPosition_overallPosition_type_reason_startMetricsData_eventData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
  uint64_t v5 = [v3 objectForKeyedSubscript:@"startType"];

  if (v5)
  {
    uint64_t v6 = [v3 objectForKeyedSubscript:@"startType"];
    [v4 setObject:v6 forKeyedSubscript:@"startType"];
  }
  v7 = [v3 objectForKeyedSubscript:@"startReason"];

  if (v7)
  {
    uint64_t v8 = [v3 objectForKeyedSubscript:@"startReason"];
    [v4 setObject:v8 forKeyedSubscript:@"startReason"];
  }
  v9 = [v3 objectForKeyedSubscript:@"startReasonType"];

  if (v9)
  {
    uint64_t v10 = [v3 objectForKeyedSubscript:@"startReasonType"];
    [v4 setObject:v10 forKeyedSubscript:@"startReasonType"];
  }
  v11 = [v3 objectForKeyedSubscript:@"eventTime"];

  if (v11)
  {
    id v12 = [v3 objectForKeyedSubscript:@"eventTime"];
    [v4 setObject:v12 forKeyedSubscript:@"startTime"];
  }
  id v13 = [v3 objectForKeyedSubscript:@"position"];

  if (v13)
  {
    id v14 = [v3 objectForKeyedSubscript:@"position"];
    [v4 setObject:v14 forKeyedSubscript:@"startPosition"];
  }
  id v15 = [v3 objectForKeyedSubscript:@"overallPosition"];

  if (v15)
  {
    v16 = [v3 objectForKeyedSubscript:@"overallPosition"];
    [v4 setObject:v16 forKeyedSubscript:@"startOverallPosition"];
  }
  uint64_t v17 = [v3 objectForKeyedSubscript:@"assetId"];
  if (v17)
  {
    id v18 = (void *)v17;
    v19 = [*(id *)(a1 + 32) registeredName];
    int v20 = [v19 isEqualToString:@"seekStop"];

    if (v20)
    {
      v21 = [v3 objectForKeyedSubscript:@"assetId"];
      [v4 setObject:v21 forKeyedSubscript:@"startAssetId"];
    }
  }
  v22 = [v3 objectForKeyedSubscript:@"dsId"];

  if (v22)
  {
    objc_super v23 = [v3 objectForKeyedSubscript:@"dsId"];
    [v4 setObject:v23 forKeyedSubscript:@"dsId"];
  }
  v24 = (void *)[v4 copy];
  v25 = +[MTPromise promiseWithResult:v24];

  return v25;
}

- (id)knownFields
{
  v10[1] = *MEMORY[0x263EF8340];
  id v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    uint64_t v5 = [(MTEventDataProvider *)self delegate];
    uint64_t v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTMediaActivityEventHandler;
    uint64_t v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"actionType";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:1];
    uint64_t v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTMediaActivityEventHandler;
  id v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  char v4 = v3;
  if (!v3) {
    id v3 = &unk_26C96FD60;
  }
  id v5 = v3;

  return v5;
}

@end