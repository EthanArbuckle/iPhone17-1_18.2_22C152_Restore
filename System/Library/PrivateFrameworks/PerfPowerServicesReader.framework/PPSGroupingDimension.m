@interface PPSGroupingDimension
+ (BOOL)supportsSecureCoding;
- (NSString)groupBy;
- (NSString)metricName;
- (PPSGroupingDimension)initWithCoder:(id)a3;
- (PPSGroupingDimension)initWithGroupBy:(id)a3;
- (PPSGroupingDimension)initWithMetricName:(id)a3 groupBy:(id)a4;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PPSGroupingDimension

- (PPSGroupingDimension)initWithMetricName:(id)a3 groupBy:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PPSGroupingDimension;
  v9 = [(PPSGroupingDimension *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_metricName, a3);
    objc_storeStrong((id *)&v10->_groupBy, a4);
  }

  return v10;
}

- (PPSGroupingDimension)initWithGroupBy:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PPSGroupingDimension;
  v6 = [(PPSGroupingDimension *)&v10 init];
  id v7 = v6;
  if (v6)
  {
    metricName = v6->_metricName;
    v6->_metricName = 0;

    objc_storeStrong((id *)&v7->_groupBy, a3);
  }

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PPSGroupingDimension)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PPSGroupingDimension;
  id v5 = [(PPSGroupingDimension *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"metric"];
    metricName = v5->_metricName;
    v5->_metricName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupBy"];
    groupBy = v5->_groupBy;
    v5->_groupBy = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_metricName forKey:@"metric"];
  [v4 encodeObject:self->_groupBy forKey:@"groupBy"];
}

- (NSString)metricName
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)groupBy
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupBy, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
}

@end