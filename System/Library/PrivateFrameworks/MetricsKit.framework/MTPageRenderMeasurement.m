@interface MTPageRenderMeasurement
- (MTPageRenderMeasurement)initWithMeasurementTransformer:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 eventData:(id)a7;
- (NSString)pageContext;
- (NSString)pageId;
- (NSString)pageType;
- (void)mark:(id)a3;
- (void)mark:(id)a3 date:(id)a4;
- (void)mark:(id)a3 time:(int64_t)a4;
- (void)setAppLaunch:(BOOL)a3;
- (void)setLaunchCorrelationKey:(id)a3;
- (void)setPageContext:(id)a3;
- (void)setPageId:(id)a3;
- (void)setPageType:(id)a3;
- (void)setPreloadStatus:(id)a3;
- (void)setPrimaryDataResponseCached:(BOOL)a3;
- (void)setXpSamplingForced:(BOOL)a3;
- (void)setXpSamplingPercentageUsers:(double)a3;
- (void)setXpSessionDuration:(unint64_t)a3;
@end

@implementation MTPageRenderMeasurement

- (void)mark:(id)a3
{
  v4 = (void *)MEMORY[0x263EFF910];
  id v5 = a3;
  -[MTPageRenderMeasurement mark:time:](self, "mark:time:", v5, objc_msgSend(v4, "mt_longMillisecondsSince1970"));
}

- (void)mark:(id)a3 date:(id)a4
{
  id v6 = a3;
  -[MTPageRenderMeasurement mark:time:](self, "mark:time:", v6, objc_msgSend(a4, "mt_longMillisecondsSince1970"));
}

- (MTPageRenderMeasurement)initWithMeasurementTransformer:(id)a3 pageId:(id)a4 pageType:(id)a5 pageContext:(id)a6 eventData:(id)a7
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)MTPageRenderMeasurement;
  v15 = [(MTPerfBaseMeasurement *)&v23 initWithMeasurementTransformer:a3 eventData:a7];
  if (v15)
  {
    uint64_t v16 = [v12 copy];
    pageId = v15->_pageId;
    v15->_pageId = (NSString *)v16;

    uint64_t v18 = [v13 copy];
    pageType = v15->_pageType;
    v15->_pageType = (NSString *)v18;

    uint64_t v20 = [v14 copy];
    pageContext = v15->_pageContext;
    v15->_pageContext = (NSString *)v20;
  }
  return v15;
}

- (void)mark:(id)a3 time:(int64_t)a4
{
  id v6 = NSNumber;
  id v7 = a3;
  id v9 = [v6 numberWithLongLong:a4];
  v8 = [(MTPerfBaseMeasurement *)self timestamps];
  [v8 setObject:v9 forKeyedSubscript:v7];
}

- (void)setLaunchCorrelationKey:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v5 setObject:v4 forKeyedSubscript:@"launchCorrelationKey"];
}

- (void)setPrimaryDataResponseCached:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"isPrimaryDataResponseCached"];
}

- (void)setAppLaunch:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"isAppLaunch"];
}

- (void)setPreloadStatus:(id)a3
{
  id v4 = a3;
  id v5 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v5 setObject:v4 forKeyedSubscript:@"preloadStatus"];
}

- (void)setXpSessionDuration:(unint64_t)a3
{
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSessionDuration"];
}

- (void)setXpSamplingForced:(BOOL)a3
{
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSamplingForced"];
}

- (void)setXpSamplingPercentageUsers:(double)a3
{
  id v5 = [NSNumber numberWithDouble:a3];
  id v4 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  [v4 setObject:v5 forKeyedSubscript:@"xpSamplingPercentageUsers"];
}

- (NSString)pageId
{
  return self->_pageId;
}

- (void)setPageId:(id)a3
{
}

- (NSString)pageType
{
  return self->_pageType;
}

- (void)setPageType:(id)a3
{
}

- (NSString)pageContext
{
  return self->_pageContext;
}

- (void)setPageContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageContext, 0);
  objc_storeStrong((id *)&self->_pageType, 0);

  objc_storeStrong((id *)&self->_pageId, 0);
}

@end