@interface MockAPMetricNotificationRegister
- (id)block;
- (int64_t)registerHandlerForAllPurposesAndAllMetricsWithClosure:(id)a3;
- (int64_t)registerHandlerForExternalPurposesAndAllMetricsWithClosure:(id)a3;
- (int64_t)registerHandlerForInternalPurposesAndAllMetricsWithClosure:(id)a3;
- (int64_t)registerHandlerForPurpose:(int64_t)a3 andMetric:(int64_t)a4 closure:(id)a5;
- (int64_t)registerHandlerForPurpose:(int64_t)a3 closure:(id)a4;
- (void)callBlockWithMetric:(id)a3;
- (void)setBlock:(id)a3;
@end

@implementation MockAPMetricNotificationRegister

- (int64_t)registerHandlerForPurpose:(int64_t)a3 andMetric:(int64_t)a4 closure:(id)a5
{
  id v6 = [a5 copy:a3, a4];
  [(MockAPMetricNotificationRegister *)self setBlock:v6];

  return 0;
}

- (int64_t)registerHandlerForPurpose:(int64_t)a3 closure:(id)a4
{
  return 0;
}

- (int64_t)registerHandlerForAllPurposesAndAllMetricsWithClosure:(id)a3
{
  return 0;
}

- (int64_t)registerHandlerForExternalPurposesAndAllMetricsWithClosure:(id)a3
{
  return 0;
}

- (int64_t)registerHandlerForInternalPurposesAndAllMetricsWithClosure:(id)a3
{
  return 0;
}

- (void)callBlockWithMetric:(id)a3
{
  id v4 = a3;
  v5 = [(MockAPMetricNotificationRegister *)self block];
  v5[2](v5, v4);
}

- (id)block
{
  return self->_block;
}

- (void)setBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end