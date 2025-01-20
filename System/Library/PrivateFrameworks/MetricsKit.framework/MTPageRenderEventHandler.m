@interface MTPageRenderEventHandler
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)metricsDataWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6;
- (id)metricsDataWithPerfMeasurement:(id)a3;
- (id)xpSamplingPercentageUsers:(id)a3;
- (id)xpSessionDuration:(id)a3;
- (void)didCreateMetricsData:(id)a3;
@end

@implementation MTPageRenderEventHandler

- (id)metricsDataWithPageId:(id)a3 pageType:(id)a4 pageContext:(id)a5 eventData:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = [[MTCallerSuppliedFields alloc] initWithPageId:v13 pageType:v12 pageContext:v11 eventData:v10];

  v15 = [(MTEventHandler *)self metricsDataWithCallerSuppliedFields:v14];

  return v15;
}

- (id)knownFields
{
  v10[24] = *MEMORY[0x263EF8340];
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
    v9.super_class = (Class)MTPageRenderEventHandler;
    v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"pageRequestTime";
    v10[1] = @"interstitialPageAppearTime";
    v10[2] = @"pageAppearTime";
    v10[3] = @"pageUserInteractiveTime";
    v10[4] = @"pageEndTime";
    v10[5] = @"primaryDataRequestStartTime";
    v10[6] = @"primaryDataResponseStartTime";
    v10[7] = @"primaryDataResponseEndTime";
    v10[8] = @"primaryDataParseStartTime";
    v10[9] = @"primaryDataParseEndTime";
    v10[10] = @"pageInterruptTime";
    v10[11] = @"modelConstructionStartTime";
    v10[12] = @"modelConstructionEndTime";
    v10[13] = @"modelRenderStartTime";
    v10[14] = @"modelRenderEndTime";
    v10[15] = @"resourceRequestStartTime";
    v10[16] = @"resourceRequestEndTime";
    v10[17] = @"onScreenResourcesAppearEndTime";
    v10[18] = @"isAppLaunch";
    v10[19] = @"isPrimaryDataResponseCached";
    v10[20] = @"launchCorrelationKey";
    v10[21] = @"preloadStatus";
    v10[22] = @"xpSessionDuration";
    v10[23] = @"xpSamplingPercentageUsers";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:24];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTPageRenderEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"pageRender";
  }
  char v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTPageRenderEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  char v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FDA8;
  }
  id v5 = v3;

  return v5;
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
    id v10 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [v4 objectForKeyedSubscript:@"xpSessionDuration"];
  objc_super v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  id v11 = [(MTObject *)self metricsKit];
  id v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __46__MTPageRenderEventHandler_xpSessionDuration___block_invoke;
  v14[3] = &unk_26430F7F8;
  v14[4] = self;
  id v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __46__MTPageRenderEventHandler_xpSessionDuration___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  id v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"performance.sessionDurationPageRender" sources:v3];

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
    id v10 = v8;
    goto LABEL_7;
  }
  objc_super v9 = [v4 objectForKeyedSubscript:@"xpSamplingPercentageUsers"];
  objc_super v7 = v9;
  if (v9)
  {
    id v8 = v9;
    goto LABEL_5;
  }
  id v11 = [(MTObject *)self metricsKit];
  id v12 = [v11 config];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __54__MTPageRenderEventHandler_xpSamplingPercentageUsers___block_invoke;
  v14[3] = &unk_26430F7F8;
  v14[4] = self;
  id v10 = [v12 computeWithConfigSources:v14];

LABEL_7:

  return v10;
}

id __54__MTPageRenderEventHandler_xpSamplingPercentageUsers___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 metricsKit];
  id v5 = [v4 config];
  char v6 = [v5 configValueForKeyPath:@"performance.samplingPercentageUsersPageRender" sources:v3];

  return v6;
}

- (void)didCreateMetricsData:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MTPageRenderEventHandler;
  id v3 = a3;
  [(MTEventHandler *)&v4 didCreateMetricsData:v3];
  objc_msgSend(v3, "setSamplingEnabled:", 1, v4.receiver, v4.super_class);
}

- (id)metricsDataWithPerfMeasurement:(id)a3
{
  id v4 = a3;
  id v5 = [v4 pageId];
  char v6 = [v4 pageType];
  objc_super v7 = [v4 pageContext];
  id v8 = [v4 eventData];
  objc_super v9 = [(MTPageRenderEventHandler *)self metricsDataWithPageId:v5 pageType:v6 pageContext:v7 eventData:v8];

  id v10 = [v4 additionalFields];

  objc_msgSend(v9, "addFields:", v10, 0);

  return v9;
}

@end