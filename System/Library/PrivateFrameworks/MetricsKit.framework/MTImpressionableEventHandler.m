@interface MTImpressionableEventHandler
- (id)impressions:(id)a3;
- (id)knownFields;
- (id)xpViewablePercentage:(id)a3;
@end

@implementation MTImpressionableEventHandler

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
    v9.super_class = (Class)MTImpressionableEventHandler;
    v5 = [(MTEventHandler *)&v9 knownFields];
    v10[0] = @"impressions";
    v10[1] = @"xpViewablePercentage";
    v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];
    v6 = [v5 arrayByAddingObjectsFromArray:v7];
  }

  return v6;
}

- (id)impressions:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    v8 = [v7 impressions:v4];
  }
  else
  {
    v8 = [v4 objectForKeyedSubscript:@"impressions"];
  }

  return v8;
}

- (id)xpViewablePercentage:(id)a3
{
  id v4 = a3;
  v5 = [(MTEventDataProvider *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    v7 = [(MTEventDataProvider *)self delegate];
    v8 = [v7 xpViewablePercentage:v4];
  }
  else
  {
    v7 = [(MTObject *)self metricsKit];
    objc_super v9 = [v7 config];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __53__MTImpressionableEventHandler_xpViewablePercentage___block_invoke;
    v11[3] = &unk_264310A40;
    id v12 = v4;
    v13 = self;
    v8 = [v9 computeWithConfigSources:v11];
  }

  return v8;
}

id __53__MTImpressionableEventHandler_xpViewablePercentage___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"xpViewablePercentage"];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v7 = [*(id *)(a1 + 40) metricsKit];
    v8 = [v7 config];
    objc_super v9 = [NSString stringWithFormat:@"%@.%@", @"impressions", @"viewablePercentage"];
    id v6 = [v8 configValueForKeyPath:v9 sources:v3];
  }

  return v6;
}

@end