@interface TIContextValueDescriptor
+ (id)contextValueDescriptorWithMetricName:(id)a3 contextFieldName:(id)a4;
- (NSString)contextFieldName;
- (TIContextValueDescriptor)initWithMetricName:(id)a3 contextFieldName:(id)a4;
- (void)setContextFieldName:(id)a3;
@end

@implementation TIContextValueDescriptor

- (void).cxx_destruct
{
}

- (void)setContextFieldName:(id)a3
{
}

- (NSString)contextFieldName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (TIContextValueDescriptor)initWithMetricName:(id)a3 contextFieldName:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)TIContextValueDescriptor;
  v8 = [(TIMetricDescriptor *)&v11 initWithMetricName:a3];
  v9 = v8;
  if (v8) {
    objc_storeStrong((id *)&v8->_contextFieldName, a4);
  }

  return v9;
}

+ (id)contextValueDescriptorWithMetricName:(id)a3 contextFieldName:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[TIContextValueDescriptor alloc] initWithMetricName:v6 contextFieldName:v5];

  return v7;
}

@end