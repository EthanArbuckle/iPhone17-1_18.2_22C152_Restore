@interface VUIDebugMetricsTermCollector
- (NSArray)baseTerms;
- (NSArray)filteredTerms;
- (NSArray)metricsKitTerms;
- (NSDictionary)primaryTerms;
- (id)accountTerms;
- (id)clickTerms;
- (id)dialogTerms;
- (id)enterTerms;
- (id)exitTerms;
- (id)impressionsTerms;
- (id)pageRenderTerms;
- (id)pageTerms;
- (id)searchTerms;
@end

@implementation VUIDebugMetricsTermCollector

- (NSArray)baseTerms
{
  return (NSArray *)&unk_1F3F3E270;
}

- (NSArray)metricsKitTerms
{
  return (NSArray *)&unk_1F3F3E288;
}

- (NSDictionary)primaryTerms
{
  v15[9] = *MEMORY[0x1E4F143B8];
  v3 = [(VUIDebugMetricsTermCollector *)self pageTerms];
  v15[0] = v3;
  v14[1] = @"click";
  v4 = [(VUIDebugMetricsTermCollector *)self clickTerms];
  v15[1] = v4;
  v14[2] = @"impressions";
  v5 = [(VUIDebugMetricsTermCollector *)self impressionsTerms];
  v15[2] = v5;
  v14[3] = @"media";
  v6 = [(VUIDebugMetricsTermCollector *)self clickTerms];
  v15[3] = v6;
  v14[4] = @"search";
  v7 = [(VUIDebugMetricsTermCollector *)self searchTerms];
  v15[4] = v7;
  v14[5] = @"enter";
  v8 = [(VUIDebugMetricsTermCollector *)self enterTerms];
  v15[5] = v8;
  v14[6] = @"exit";
  v9 = [(VUIDebugMetricsTermCollector *)self exitTerms];
  v15[6] = v9;
  v14[7] = @"account";
  v10 = [(VUIDebugMetricsTermCollector *)self accountTerms];
  v15[7] = v10;
  v14[8] = @"pageRender";
  v11 = [(VUIDebugMetricsTermCollector *)self pageRenderTerms];
  v15[8] = v11;
  v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:9];

  return (NSDictionary *)v12;
}

- (id)pageTerms
{
  return &unk_1F3F3E2A0;
}

- (id)dialogTerms
{
  return &unk_1F3F3E2B8;
}

- (id)clickTerms
{
  return &unk_1F3F3E2D0;
}

- (id)enterTerms
{
  return &unk_1F3F3E2E8;
}

- (id)exitTerms
{
  return &unk_1F3F3E300;
}

- (id)searchTerms
{
  return &unk_1F3F3E318;
}

- (id)accountTerms
{
  return &unk_1F3F3E330;
}

- (id)impressionsTerms
{
  return &unk_1F3F3E348;
}

- (id)pageRenderTerms
{
  return &unk_1F3F3E360;
}

- (NSArray)filteredTerms
{
  return (NSArray *)&unk_1F3F3E378;
}

@end