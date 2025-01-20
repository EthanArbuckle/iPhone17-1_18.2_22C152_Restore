@interface NetworkQualityExecutionsResult
- (NSMutableDictionary)idleLatencyResults;
- (NSMutableDictionary)mutableOtherValues;
- (NSMutableDictionary)mutableURLSessionMetrics;
- (NSMutableDictionary)workingLatencyResults;
- (NetworkQualityExecutionsResult)init;
- (void)setIdleLatencyResults:(id)a3;
- (void)setMutableOtherValues:(id)a3;
- (void)setMutableURLSessionMetrics:(id)a3;
- (void)setWorkingLatencyResults:(id)a3;
@end

@implementation NetworkQualityExecutionsResult

- (NetworkQualityExecutionsResult)init
{
  v8.receiver = self;
  v8.super_class = (Class)NetworkQualityExecutionsResult;
  v2 = [(NetworkQualityResult *)&v8 init];
  if (v2)
  {
    v3 = [MEMORY[0x263EFF9A0] dictionary];
    [(NetworkQualityExecutionsResult *)v2 setWorkingLatencyResults:v3];

    v4 = [MEMORY[0x263EFF9A0] dictionary];
    [(NetworkQualityExecutionsResult *)v2 setIdleLatencyResults:v4];

    v5 = [MEMORY[0x263EFF9A0] dictionary];
    [(NetworkQualityExecutionsResult *)v2 setMutableOtherValues:v5];

    id v6 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(NetworkQualityExecutionsResult *)v2 setMutableURLSessionMetrics:v6];
  }
  return v2;
}

- (NSMutableDictionary)workingLatencyResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 288, 1);
}

- (void)setWorkingLatencyResults:(id)a3
{
}

- (NSMutableDictionary)idleLatencyResults
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 296, 1);
}

- (void)setIdleLatencyResults:(id)a3
{
}

- (NSMutableDictionary)mutableOtherValues
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 304, 1);
}

- (void)setMutableOtherValues:(id)a3
{
}

- (NSMutableDictionary)mutableURLSessionMetrics
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 312, 1);
}

- (void)setMutableURLSessionMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutableURLSessionMetrics, 0);
  objc_storeStrong((id *)&self->_mutableOtherValues, 0);
  objc_storeStrong((id *)&self->_idleLatencyResults, 0);

  objc_storeStrong((id *)&self->_workingLatencyResults, 0);
}

@end