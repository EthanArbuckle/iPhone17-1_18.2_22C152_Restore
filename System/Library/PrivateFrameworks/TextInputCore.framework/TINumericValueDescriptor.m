@interface TINumericValueDescriptor
+ (id)numericValueDescriptorWithMetricName:(id)a3 calculationExpression:(id)a4 calculationPrecondition:(id)a5 calculationDefaultValue:(id)a6 calculationDependencies:(id)a7 bucketThresholds:(id)a8 bucketValues:(id)a9;
- (NSArray)bucketThresholds;
- (NSArray)bucketValues;
- (NSArray)calculationDependencies;
- (NSNumber)calculationDefaultValue;
- (NSString)calculationExpression;
- (NSString)calculationPrecondition;
- (TINumericValueDescriptor)initWithMetricName:(id)a3 calculationExpression:(id)a4 calculationPrecondition:(id)a5 calculationDefaultValue:(id)a6 calculationDependencies:(id)a7 bucketThresholds:(id)a8 bucketValues:(id)a9;
@end

@implementation TINumericValueDescriptor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bucketValues, 0);
  objc_storeStrong((id *)&self->_bucketThresholds, 0);
  objc_storeStrong((id *)&self->_calculationDependencies, 0);
  objc_storeStrong((id *)&self->_calculationDefaultValue, 0);
  objc_storeStrong((id *)&self->_calculationPrecondition, 0);

  objc_storeStrong((id *)&self->_calculationExpression, 0);
}

- (NSArray)bucketValues
{
  return self->_bucketValues;
}

- (NSArray)bucketThresholds
{
  return self->_bucketThresholds;
}

- (NSArray)calculationDependencies
{
  return self->_calculationDependencies;
}

- (NSNumber)calculationDefaultValue
{
  return self->_calculationDefaultValue;
}

- (NSString)calculationPrecondition
{
  return self->_calculationPrecondition;
}

- (NSString)calculationExpression
{
  return self->_calculationExpression;
}

- (TINumericValueDescriptor)initWithMetricName:(id)a3 calculationExpression:(id)a4 calculationPrecondition:(id)a5 calculationDefaultValue:(id)a6 calculationDependencies:(id)a7 bucketThresholds:(id)a8 bucketValues:(id)a9
{
  id v24 = a4;
  id v23 = a5;
  id v22 = a6;
  id v21 = a7;
  id v16 = a8;
  id v17 = a9;
  v25.receiver = self;
  v25.super_class = (Class)TINumericValueDescriptor;
  v18 = [(TIMetricDescriptor *)&v25 initWithMetricName:a3];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_calculationExpression, a4);
    objc_storeStrong((id *)&v19->_calculationPrecondition, a5);
    objc_storeStrong((id *)&v19->_calculationDefaultValue, a6);
    objc_storeStrong((id *)&v19->_calculationDependencies, a7);
    objc_storeStrong((id *)&v19->_bucketThresholds, a8);
    objc_storeStrong((id *)&v19->_bucketValues, a9);
  }

  return v19;
}

+ (id)numericValueDescriptorWithMetricName:(id)a3 calculationExpression:(id)a4 calculationPrecondition:(id)a5 calculationDefaultValue:(id)a6 calculationDependencies:(id)a7 bucketThresholds:(id)a8 bucketValues:(id)a9
{
  id v15 = a9;
  id v16 = a8;
  id v17 = a7;
  id v18 = a6;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [[TINumericValueDescriptor alloc] initWithMetricName:v21 calculationExpression:v20 calculationPrecondition:v19 calculationDefaultValue:v18 calculationDependencies:v17 bucketThresholds:v16 bucketValues:v15];

  return v22;
}

@end