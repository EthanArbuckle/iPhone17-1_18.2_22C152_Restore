@interface MTMetricsKit
- (MTMetricsKit)initWithTopic:(id)a3;
- (id)metricsDataWithFlexibleEventType:(id)a3 eventData:(id)a4;
- (id)metricsDataWithFlexibleEventType:(id)a3 fields:(id)a4;
- (void)performMaintenanceForUserId:(id)a3;
@end

@implementation MTMetricsKit

- (void)performMaintenanceForUserId:(id)a3
{
  id v4 = a3;
  v5 = [(MTMetricsKitTemplate *)self config];
  v6 = [v5 sources];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__MTMetricsKit_Demographic__performMaintenanceForUserId___block_invoke;
  v9[3] = &unk_26430FC28;
  v9[4] = self;
  id v10 = v4;
  id v7 = v4;
  id v8 = (id)[v6 thenWithBlock:v9];
}

uint64_t __57__MTMetricsKit_Demographic__performMaintenanceForUserId___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 config];
  v6 = [v5 configValueForKeyPath:@"identifiers.ageTopics" sources:v4];

  id v7 = [*(id *)(a1 + 32) topic];
  id v8 = [v6 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [v8 objectForKeyedSubscript:@"updateInterval"];
    [v9 doubleValue];
    if (v10 == 0.0) {
      double v11 = 2592000.0;
    }
    else {
      double v11 = v10;
    }

    v12 = [*(id *)(a1 + 32) eventHandlers];
    v13 = [v12 objectForKeyedSubscript:@"demographic"];

    v14 = [v13 ageDataForUserId:*(void *)(a1 + 40) updateInterval:v11];
    [v14 setAnonymous:1];
    id v15 = (id)[v14 recordEvent];
  }
  return 0;
}

- (MTMetricsKit)initWithTopic:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTMetricsKit;
  v3 = [(MTMetricsKitTemplate *)&v7 initWithTopic:a3];
  if (v3)
  {
    id v4 = [(MTObject *)[MTMetricsEventHandlers alloc] initWithMetricsKit:v3];
    [(MTMetricsKitTemplate *)v3 setEventHandlers:v4];

    v5 = [(MTObject *)[MTMetricsUtils alloc] initWithMetricsKit:v3];
    [(MTMetricsKitTemplate *)v3 setUtils:v5];
  }
  return v3;
}

- (id)metricsDataWithFlexibleEventType:(id)a3 eventData:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MTMetricsKitTemplate *)self eventHandlers];
  v9 = [v8 flexible];
  double v10 = [v9 metricsDataWithEventType:v7 eventData:v6];

  return v10;
}

- (id)metricsDataWithFlexibleEventType:(id)a3 fields:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x263EFF980] array];
  v16 = (id *)&v18;
  id v9 = v7;
  double v10 = v9;
  if (v9)
  {
    double v11 = v9;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v8 addObjectsFromArray:v11];
      }
      else {
        [v8 addObject:v11];
      }
      v12 = v16++;
      id v13 = *v12;

      double v11 = v13;
    }
    while (v13);
  }
  v14 = [(MTMetricsKit *)self metricsDataWithFlexibleEventType:v6 eventData:v8];

  return v14;
}

@end