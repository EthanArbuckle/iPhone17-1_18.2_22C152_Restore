@interface MTImpressionsEventHandler
- (id)eventType;
- (id)eventVersion:(id)a3;
- (id)knownFields;
- (id)xpViewableThreshold:(id)a3;
@end

@implementation MTImpressionsEventHandler

- (id)knownFields
{
  v3 = [(MTEventDataProvider *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    v5 = [(MTEventDataProvider *)self delegate];
    uint64_t v6 = [v5 knownFields];
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTImpressionsEventHandler;
    v5 = [(MTImpressionableEventHandler *)&v9 knownFields];
    uint64_t v6 = [v5 arrayByAddingObject:@"xpViewableThreshold"];
  }
  v7 = (void *)v6;

  return v7;
}

- (id)eventType
{
  v6.receiver = self;
  v6.super_class = (Class)MTImpressionsEventHandler;
  v2 = [(MTEventHandler *)&v6 eventType];
  v3 = v2;
  if (!v2) {
    v2 = @"impressions";
  }
  char v4 = v2;

  return v4;
}

- (id)eventVersion:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MTImpressionsEventHandler;
  v3 = [(MTEventHandler *)&v7 eventVersion:a3];
  char v4 = v3;
  if (!v3) {
    v3 = &unk_26C96FE08;
  }
  id v5 = v3;

  return v5;
}

- (id)xpViewableThreshold:(id)a3
{
  id v4 = a3;
  id v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    objc_super v7 = [(MTEventDataProvider *)self delegate];
    v8 = [v7 xpViewableThreshold:v4];
  }
  else
  {
    objc_super v7 = [(MTObject *)self metricsKit];
    objc_super v9 = [v7 config];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __49__MTImpressionsEventHandler_xpViewableThreshold___block_invoke;
    v11[3] = &unk_264310A40;
    id v12 = v4;
    v13 = self;
    v8 = [v9 computeWithConfigSources:v11];
  }

  return v8;
}

id __49__MTImpressionsEventHandler_xpViewableThreshold___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"xpViewableThreshold"];
  id v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    objc_super v7 = [*(id *)(a1 + 40) metricsKit];
    v8 = [v7 config];
    objc_super v9 = [NSString stringWithFormat:@"%@.%@", @"impressions", @"viewableThreshold"];
    id v6 = [v8 configValueForKeyPath:v9 sources:v3];
  }

  return v6;
}

@end