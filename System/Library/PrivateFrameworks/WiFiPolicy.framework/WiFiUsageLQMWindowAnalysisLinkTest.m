@interface WiFiUsageLQMWindowAnalysisLinkTest
- (NSString)linkTestReason;
- (WFMeasureResult)linkTestResults;
- (WiFiUsageLQMWindowAnalysisLinkTest)initWithRollingWindow:(id)a3 andReason:(id)a4 withWFMeasureResults:(id)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8;
- (id)addDimensionsTo:(id)a3;
- (void)setLinkTestReason:(id)a3;
- (void)setLinkTestResults:(id)a3;
@end

@implementation WiFiUsageLQMWindowAnalysisLinkTest

- (WiFiUsageLQMWindowAnalysisLinkTest)initWithRollingWindow:(id)a3 andReason:(id)a4 withWFMeasureResults:(id)a5 andContext:(context)a6 andTimestamp:(id)a7 onQueue:(id)a8
{
  v17.receiver = self;
  v17.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkTest;
  uint64_t v12 = *(void *)&a6.var0 & 0xFFFFFFLL;
  id v13 = a5;
  id v14 = a4;
  v15 = [(WiFiUsageLQMWindowAnalysis *)&v17 initWithRollingWindow:a3 andReason:@"LinkTest" andContext:v12 andTimestamp:a7 onQueue:a8];
  -[WiFiUsageLQMWindowAnalysisLinkTest setLinkTestResults:](v15, "setLinkTestResults:", v13, v17.receiver, v17.super_class);

  [(WiFiUsageLQMWindowAnalysisLinkTest *)v15 setLinkTestReason:v14];
  return v15;
}

- (id)addDimensionsTo:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)WiFiUsageLQMWindowAnalysisLinkTest;
  id v5 = [(WiFiUsageLQMWindowAnalysis *)&v26 addDimensionsTo:v4];
  v6 = v4;
  [v4 setObject:self->_linkTestReason forKeyedSubscript:@"linktest_reason"];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v7 = self;
  id obj = [(WFMeasureResult *)self->_linkTestResults allPrimitiveProperties];
  uint64_t v8 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v23 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        id v13 = [(WFMeasureResult *)self->_linkTestResults binnedProperty:v12];
        id v14 = [NSString stringWithFormat:@"linktest_%@", v12];
        [v6 setObject:v13 forKeyedSubscript:v14];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v9);
  }

  v15 = [(WFMeasureResult *)self->_linkTestResults typeAsString];
  v16 = v6;
  [v6 setObject:v15 forKeyedSubscript:@"linktest_type"];

  objc_super v17 = [(WFMeasureResult *)v7->_linkTestResults statusForLocal];
  [v16 setValue:v17 forKey:@"linktest_statusForLocal"];

  v18 = [(WFMeasureResult *)v7->_linkTestResults statusForInternet];
  [v16 setValue:v18 forKey:@"linktest_statusForInternet"];

  v19 = [(WFMeasureResult *)v7->_linkTestResults statusForDNS];
  [v16 setValue:v19 forKey:@"linktest_statusForDNS"];

  return v16;
}

- (WFMeasureResult)linkTestResults
{
  return self->_linkTestResults;
}

- (void)setLinkTestResults:(id)a3
{
}

- (NSString)linkTestReason
{
  return self->_linkTestReason;
}

- (void)setLinkTestReason:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_linkTestReason, 0);

  objc_storeStrong((id *)&self->_linkTestResults, 0);
}

@end