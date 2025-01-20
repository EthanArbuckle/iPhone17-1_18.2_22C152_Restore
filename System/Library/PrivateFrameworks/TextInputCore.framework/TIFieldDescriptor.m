@interface TIFieldDescriptor
+ (id)fieldDescriptorWithFieldName:(id)a3 fieldDescription:(id)a4 metricName:(id)a5 metricType:(id)a6 inactiveValue:(id)a7;
- (NSObject)inactiveValue;
- (NSString)fieldDescription;
- (NSString)fieldName;
- (NSString)metricName;
- (NSString)metricType;
- (TIFieldDescriptor)initWithFieldName:(id)a3 fieldDescription:(id)a4 metricName:(id)a5 metricType:(id)a6 inactiveValue:(id)a7;
@end

@implementation TIFieldDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inactiveValue, 0);
  objc_storeStrong((id *)&self->_metricType, 0);
  objc_storeStrong((id *)&self->_metricName, 0);
  objc_storeStrong((id *)&self->_fieldDescription, 0);

  objc_storeStrong((id *)&self->_fieldName, 0);
}

- (NSObject)inactiveValue
{
  return self->_inactiveValue;
}

- (NSString)metricType
{
  return self->_metricType;
}

- (NSString)metricName
{
  return self->_metricName;
}

- (NSString)fieldDescription
{
  return self->_fieldDescription;
}

- (NSString)fieldName
{
  return self->_fieldName;
}

- (TIFieldDescriptor)initWithFieldName:(id)a3 fieldDescription:(id)a4 metricName:(id)a5 metricType:(id)a6 inactiveValue:(id)a7
{
  id v20 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)TIFieldDescriptor;
  v17 = [(TIFieldDescriptor *)&v21 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_fieldName, a3);
    objc_storeStrong((id *)&v18->_fieldDescription, a4);
    objc_storeStrong((id *)&v18->_metricName, a5);
    objc_storeStrong((id *)&v18->_metricType, a6);
    objc_storeStrong((id *)&v18->_inactiveValue, a7);
  }

  return v18;
}

+ (id)fieldDescriptorWithFieldName:(id)a3 fieldDescription:(id)a4 metricName:(id)a5 metricType:(id)a6 inactiveValue:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [[TIFieldDescriptor alloc] initWithFieldName:v15 fieldDescription:v14 metricName:v13 metricType:v12 inactiveValue:v11];

  return v16;
}

@end