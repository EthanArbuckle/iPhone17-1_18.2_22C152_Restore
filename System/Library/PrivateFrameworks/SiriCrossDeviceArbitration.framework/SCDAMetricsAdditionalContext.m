@interface SCDAMetricsAdditionalContext
- (SCDAMetricsAdditionalContext)initWithRawGoodnessScore:(unsigned __int8)a3 goodnessScore:(unsigned __int8)a4 deviceClass:(unsigned __int8)a5 deviceProductType:(unsigned __int8)a6;
- (id)description;
- (unsigned)deviceClass;
- (unsigned)deviceProductType;
- (unsigned)goodnessScore;
- (unsigned)rawGoodnessScore;
@end

@implementation SCDAMetricsAdditionalContext

- (unsigned)deviceProductType
{
  return self->_deviceProductType;
}

- (unsigned)deviceClass
{
  return self->_deviceClass;
}

- (unsigned)goodnessScore
{
  return self->_goodnessScore;
}

- (unsigned)rawGoodnessScore
{
  return self->_rawGoodnessScore;
}

- (id)description
{
  return (id)[NSString stringWithFormat:@"raw Goodness = %d, boosted goodness = %d  class = %d, product type = %d", -[SCDAMetricsAdditionalContext rawGoodnessScore](self, "rawGoodnessScore"), -[SCDAMetricsAdditionalContext goodnessScore](self, "goodnessScore"), -[SCDAMetricsAdditionalContext deviceClass](self, "deviceClass"), -[SCDAMetricsAdditionalContext deviceProductType](self, "deviceProductType")];
}

- (SCDAMetricsAdditionalContext)initWithRawGoodnessScore:(unsigned __int8)a3 goodnessScore:(unsigned __int8)a4 deviceClass:(unsigned __int8)a5 deviceProductType:(unsigned __int8)a6
{
  v11.receiver = self;
  v11.super_class = (Class)SCDAMetricsAdditionalContext;
  result = [(SCDAMetricsAdditionalContext *)&v11 init];
  if (result)
  {
    result->_rawGoodnessScore = a3;
    result->_goodnessScore = a4;
    result->_deviceClass = a5;
    result->_deviceProductType = a6;
  }
  return result;
}

@end