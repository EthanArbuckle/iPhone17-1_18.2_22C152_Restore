@interface PPSMetricSample
+ (BOOL)supportsSecureCoding;
+ (PPSMetricSample)sampleWithValue:(id)a3 timestamp:(id)a4;
- (BOOL)BOOLValue;
- (NSDate)timestamp;
- (NSNumber)value;
- (PPSMetricSample)initWithCoder:(id)a3;
- (PPSMetricSample)initWithValue:(id)a3 timestamp:(id)a4;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (int)intValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSMetricSample

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (PPSMetricSample)sampleWithValue:(id)a3 timestamp:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = [[PPSMetricSample alloc] initWithValue:v6 timestamp:v5];

  return v7;
}

- (PPSMetricSample)initWithValue:(id)a3 timestamp:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    v13.receiver = self;
    v13.super_class = (Class)PPSMetricSample;
    v9 = [(PPSMetricSample *)&v13 init];
    p_isa = (id *)&v9->super.isa;
    if (v9)
    {
      objc_storeStrong((id *)&v9->_value, a3);
      objc_storeStrong(p_isa + 2, a4);
    }
    self = p_isa;
    v11 = self;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (PPSMetricSample)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSMetricSample;
  id v5 = [(PPSMetricSample *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"value"];
    value = v5->_value;
    v5->_value = (NSNumber *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"timestamp"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(PPSMetricSample *)self value];
  [v4 encodeObject:v5 forKey:@"value"];

  id v6 = [(PPSMetricSample *)self timestamp];
  [v4 encodeObject:v6 forKey:@"timestamp"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [+[PPSMetricSample allocWithZone:](PPSMetricSample, "allocWithZone:") init];
  uint64_t v6 = [(NSNumber *)self->_value copyWithZone:a3];
  value = v5->_value;
  v5->_value = (NSNumber *)v6;

  uint64_t v8 = [(NSDate *)self->_timestamp copyWithZone:a3];
  timestamp = v5->_timestamp;
  v5->_timestamp = (NSDate *)v8;

  return v5;
}

- (id)description
{
  v3 = NSString;
  id v4 = [(PPSMetricSample *)self value];
  id v5 = [(PPSMetricSample *)self timestamp];
  uint64_t v6 = [v3 stringWithFormat:@"PPSMetric value: %@ timestamp: %@", v4, v5];

  return v6;
}

- (BOOL)BOOLValue
{
  v2 = [(PPSMetricSample *)self value];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (int)intValue
{
  v2 = [(PPSMetricSample *)self value];
  int v3 = [v2 intValue];

  return v3;
}

- (double)doubleValue
{
  v2 = [(PPSMetricSample *)self value];
  [v2 doubleValue];
  double v4 = v3;

  return v4;
}

- (NSNumber)value
{
  return self->_value;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end