@interface AWDMetricContainer
- (PBCodable)metric;
- (unsigned)metricId;
- (void)setMetric:(id)a3;
@end

@implementation AWDMetricContainer

- (PBCodable)metric
{
  return self->_metric;
}

- (void)setMetric:(id)a3
{
}

- (unsigned)metricId
{
  return self->_metricId;
}

- (void).cxx_destruct
{
}

@end