@interface _PXStoryPPTMeasureInfo
- (PXStatsCalculator)statistics;
- (_PXStoryPPTMeasureInfo)init;
- (_PXStoryPPTMeasureInfo)initWithMetric:(int64_t)a3;
- (int64_t)metric;
@end

@implementation _PXStoryPPTMeasureInfo

- (void).cxx_destruct
{
}

- (PXStatsCalculator)statistics
{
  return self->_statistics;
}

- (int64_t)metric
{
  return self->_metric;
}

- (_PXStoryPPTMeasureInfo)initWithMetric:(int64_t)a3
{
  v9.receiver = self;
  v9.super_class = (Class)_PXStoryPPTMeasureInfo;
  v4 = [(_PXStoryPPTMeasureInfo *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_metric = a3;
    v6 = objc_alloc_init(PXStatsCalculator);
    statistics = v5->_statistics;
    v5->_statistics = v6;
  }
  return v5;
}

- (_PXStoryPPTMeasureInfo)init
{
  return [(_PXStoryPPTMeasureInfo *)self initWithMetric:0];
}

@end