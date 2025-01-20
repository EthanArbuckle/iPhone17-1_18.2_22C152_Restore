@interface MTFlexiblePerfEventHandler
- (BOOL)mtIncludeBaseFields;
- (id)knownFields;
- (id)metricsDataWithEventType:(id)a3 eventData:(id)a4;
- (id)metricsDataWithPerfMeasurement:(id)a3;
- (id)xpSamplingPercentage:(id)a3;
@end

@implementation MTFlexiblePerfEventHandler

- (id)metricsDataWithPerfMeasurement:(id)a3
{
  id v4 = a3;
  v5 = [v4 eventType];
  v6 = [v4 eventData];
  v7 = [(MTFlexiblePerfEventHandler *)self metricsDataWithEventType:v5 eventData:v6];

  v8 = [v4 additionalFields];

  objc_msgSend(v7, "addFields:", v8, 0);

  return v7;
}

- (id)metricsDataWithEventType:(id)a3 eventData:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  v12 = @"eventType";
  v13[0] = a3;
  v6 = NSDictionary;
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v10 = -[MTEventHandler metricsDataWithFields:](self, "metricsDataWithFields:", v9, v7, 0);

  return v10;
}

- (id)knownFields
{
  v10[2] = *MEMORY[0x263EF8340];
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTFlexiblePerfEventHandler;
    v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"eventTime";
    v10[1] = @"xpSamplingPercentage";
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (BOOL)mtIncludeBaseFields
{
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0) {
    return 1;
  }
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = [v5 mtIncludeBaseFields];

  return v6;
}

- (id)xpSamplingPercentage:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    id v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpSamplingPercentage:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [v4 objectForKeyedSubscript:@"xpSamplingPercentage"];
  id v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__MTFlexiblePerfEventHandler_xpSamplingPercentage___block_invoke;
  v14[3] = &unk_26430F7F8;
  v14[4] = self;
  v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __51__MTFlexiblePerfEventHandler_xpSamplingPercentage___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"performance.samplingPercentage" sources:v3];

  return v6;
}

@end