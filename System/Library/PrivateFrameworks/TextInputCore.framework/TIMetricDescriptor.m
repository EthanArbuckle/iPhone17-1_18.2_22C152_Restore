@interface TIMetricDescriptor
- (NSString)metricName;
- (TIMetricDescriptor)initWithMetricName:(id)a3;
@end

@implementation TIMetricDescriptor

- (void).cxx_destruct
{
}

- (NSString)metricName
{
  return self->_metricName;
}

- (TIMetricDescriptor)initWithMetricName:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TIMetricDescriptor;
  v6 = [(TIMetricDescriptor *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_metricName, a3);
  }

  return v7;
}

@end