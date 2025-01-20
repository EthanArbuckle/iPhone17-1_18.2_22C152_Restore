@interface _OSHighBatteryDrainLowChargeDurationModelOutput
- (NSDictionary)classProbability;
- (NSSet)featureNames;
- (_OSHighBatteryDrainLowChargeDurationModelOutput)initWithLabel:(int64_t)a3 classProbability:(id)a4;
- (id)featureValueForName:(id)a3;
- (int64_t)label;
- (void)setClassProbability:(id)a3;
- (void)setLabel:(int64_t)a3;
@end

@implementation _OSHighBatteryDrainLowChargeDurationModelOutput

- (_OSHighBatteryDrainLowChargeDurationModelOutput)initWithLabel:(int64_t)a3 classProbability:(id)a4
{
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_OSHighBatteryDrainLowChargeDurationModelOutput;
  v8 = [(_OSHighBatteryDrainLowChargeDurationModelOutput *)&v11 init];
  v9 = v8;
  if (v8)
  {
    v8->_label = a3;
    objc_storeStrong((id *)&v8->_classProbability, a4);
  }

  return v9;
}

- (NSSet)featureNames
{
  return +[NSSet setWithArray:&off_1000699D0];
}

- (id)featureValueForName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"label"])
  {
    v5 = +[MLFeatureValue featureValueWithInt64:[(_OSHighBatteryDrainLowChargeDurationModelOutput *)self label]];
  }
  else if ([v4 isEqualToString:@"classProbability"])
  {
    v6 = [(_OSHighBatteryDrainLowChargeDurationModelOutput *)self classProbability];
    v5 = +[MLFeatureValue featureValueWithDictionary:v6 error:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)label
{
  return self->_label;
}

- (void)setLabel:(int64_t)a3
{
  self->_label = a3;
}

- (NSDictionary)classProbability
{
  return self->_classProbability;
}

- (void)setClassProbability:(id)a3
{
}

- (void).cxx_destruct
{
}

@end