@interface MOPerformanceMetric
- (BOOL)initializedWithValue;
- (MOPerformanceMetric)initWithDisplayName:(id)a3 pcMetricID:(unint64_t)a4 unit:(id)a5 denominator:(double)a6;
- (NSString)displayName;
- (NSString)unit;
- (double)denominator;
- (double)rawValue;
- (double)value;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionary;
- (unint64_t)pcMetricID;
- (void)setDenominator:(double)a3;
- (void)setDisplayName:(id)a3;
- (void)setInitializedWithValue:(BOOL)a3;
- (void)setPcMetricID:(unint64_t)a3;
- (void)setRawValue:(double)a3;
- (void)setUnit:(id)a3;
@end

@implementation MOPerformanceMetric

- (MOPerformanceMetric)initWithDisplayName:(id)a3 pcMetricID:(unint64_t)a4 unit:(id)a5 denominator:(double)a6
{
  id v11 = a3;
  id v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MOPerformanceMetric;
  v13 = [(MOPerformanceMetric *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_displayName, a3);
    objc_storeStrong((id *)&v14->_unit, a5);
    v14->_denominator = a6;
    v14->_pcMetricID = a4;
    v14->_initializedWithValue = 0;
    v14->_rawValue = 0.0;
  }

  return v14;
}

- (id)dictionary
{
  v10[3] = *MEMORY[0x263EF8340];
  v9[0] = @"MOPerformanceMetricName";
  v3 = [(MOPerformanceMetric *)self displayName];
  v10[0] = v3;
  v9[1] = @"MOPerformanceMetricUnit";
  v4 = [(MOPerformanceMetric *)self unit];
  v10[1] = v4;
  v9[2] = @"MOPerformanceMetricValue";
  v5 = NSNumber;
  [(MOPerformanceMetric *)self value];
  v6 = objc_msgSend(v5, "numberWithDouble:");
  v10[2] = v6;
  v7 = [NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:3];

  return v7;
}

- (id)description
{
  v3 = NSString;
  v4 = [(MOPerformanceMetric *)self displayName];
  v5 = [(MOPerformanceMetric *)self unit];
  [(MOPerformanceMetric *)self value];
  v7 = [v3 stringWithFormat:@" Metric Name: %@, Metric Unit: %@, Value: %.2f", v4, v5, v6];

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = [MOPerformanceMetric alloc];
  v5 = [(MOPerformanceMetric *)self displayName];
  unint64_t v6 = [(MOPerformanceMetric *)self pcMetricID];
  v7 = [(MOPerformanceMetric *)self unit];
  [(MOPerformanceMetric *)self denominator];
  v8 = -[MOPerformanceMetric initWithDisplayName:pcMetricID:unit:denominator:](v4, "initWithDisplayName:pcMetricID:unit:denominator:", v5, v6, v7);

  return v8;
}

- (void)setRawValue:(double)a3
{
  self->_rawValue = a3;
  self->_initializedWithValue = 1;
}

- (double)rawValue
{
  return self->_rawValue;
}

- (double)value
{
  if (self->_initializedWithValue) {
    return self->_rawValue / self->_denominator;
  }
  else {
    return -1.0;
  }
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setDisplayName:(id)a3
{
}

- (NSString)unit
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUnit:(id)a3
{
}

- (double)denominator
{
  return self->_denominator;
}

- (void)setDenominator:(double)a3
{
  self->_denominator = a3;
}

- (unint64_t)pcMetricID
{
  return self->_pcMetricID;
}

- (void)setPcMetricID:(unint64_t)a3
{
  self->_pcMetricID = a3;
}

- (BOOL)initializedWithValue
{
  return self->_initializedWithValue;
}

- (void)setInitializedWithValue:(BOOL)a3
{
  self->_initializedWithValue = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end