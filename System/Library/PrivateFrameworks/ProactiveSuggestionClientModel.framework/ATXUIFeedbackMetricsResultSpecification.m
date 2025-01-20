@interface ATXUIFeedbackMetricsResultSpecification
- (ATXUIFeedbackMetricsResultSpecification)init;
- (int64_t)trendPlotGranularity;
- (void)setTrendPlotGranularity:(int64_t)a3;
@end

@implementation ATXUIFeedbackMetricsResultSpecification

- (ATXUIFeedbackMetricsResultSpecification)init
{
  v3.receiver = self;
  v3.super_class = (Class)ATXUIFeedbackMetricsResultSpecification;
  result = [(ATXUIFeedbackMetricsResultSpecification *)&v3 init];
  if (result) {
    result->_trendPlotGranularity = 2;
  }
  return result;
}

- (int64_t)trendPlotGranularity
{
  return self->_trendPlotGranularity;
}

- (void)setTrendPlotGranularity:(int64_t)a3
{
  self->_trendPlotGranularity = a3;
}

@end