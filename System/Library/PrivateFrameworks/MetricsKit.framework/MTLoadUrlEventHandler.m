@interface MTLoadUrlEventHandler
- (id)dnsServersIPAddresses:(id)a3;
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)metricsDataWithPerfMeasurement:(id)a3;
- (id)xpSamplingPercentageUsers:(id)a3;
- (id)xpSessionDuration:(id)a3;
@end

@implementation MTLoadUrlEventHandler

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTLoadUrlEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"loadUrl";
  }
  v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTLoadUrlEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FDC0;
  }
  id v5 = v3;

  return v5;
}

- (id)knownFields
{
  v10[18] = *MEMORY[0x263EF8340];
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(MTEventDataProvider *)self delegate];
    objc_super v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTLoadUrlEventHandler;
    id v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"fetchStartTime";
    v10[1] = @"domainLookupStartTime";
    v10[2] = @"domainLookupEndTime";
    v10[3] = @"connectionStartTime";
    v10[4] = @"connectionEndTime";
    v10[5] = @"secureConnectionStartTime";
    v10[6] = @"requestStartTime";
    v10[7] = @"responseStartTime";
    v10[8] = @"responseEndTime";
    v10[9] = @"requestUrl";
    v10[10] = @"connectionReused";
    v10[11] = @"dnsServersIPAddresses";
    v10[12] = @"edgeNodeCacheStatus";
    v10[13] = @"redirectCount";
    v10[14] = @"resolvedIPAddress";
    v10[15] = @"statusCode";
    v10[16] = @"xpSessionDuration";
    v10[17] = @"xpSamplingPercentageUsers";
    objc_super v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:18];
    objc_super v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)xpSessionDuration:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpSessionDuration:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [v4 objectForKeyedSubscript:@"xpSessionDuration"];
  objc_super v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __43__MTLoadUrlEventHandler_xpSessionDuration___block_invoke;
  v14[3] = &unk_26430F7F8;
  v14[4] = self;
  v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __43__MTLoadUrlEventHandler_xpSessionDuration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  id v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"performance.sessionDuration" sources:v3];

  return v6;
}

- (id)xpSamplingPercentageUsers:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 xpSamplingPercentageUsers:v4];
LABEL_5:
    v10 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [v4 objectForKeyedSubscript:@"xpSamplingPercentageUsers"];
  objc_super v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  v11 = [(MTObject *)self metricsKit];
  v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__MTLoadUrlEventHandler_xpSamplingPercentageUsers___block_invoke;
  v14[3] = &unk_26430F7F8;
  v14[4] = self;
  v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __51__MTLoadUrlEventHandler_xpSamplingPercentageUsers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  id v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"performance.samplingPercentageUsers" sources:v3];

  return v6;
}

- (id)dnsServersIPAddresses:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    id v8 = [v7 dnsServersIPAddresses:v4];
  }
  else
  {
    id v8 = [v4 objectForKeyedSubscript:@"dnsServersIPAddresses"];
  }

  return v8;
}

- (id)metricsDataWithPerfMeasurement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 eventData];
  char v6 = [(MTEventHandler *)self metricsDataWithEventData:v5];

  objc_super v7 = [v4 additionalFields];

  objc_msgSend(v6, "addFields:", v7, 0);

  return v6;
}

@end