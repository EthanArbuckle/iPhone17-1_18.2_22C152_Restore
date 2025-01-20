@interface _REBoolFeatureValue
+ (id)featureValueWithBool:(BOOL)a3;
- (unint64_t)_integralFeatureValue;
- (unint64_t)type;
@end

@implementation _REBoolFeatureValue

+ (id)featureValueWithBool:(BOOL)a3
{
  BOOL v3 = a3;
  if (featureValueWithBool__onceToken != -1) {
    dispatch_once(&featureValueWithBool__onceToken, &__block_literal_global_83);
  }
  v4 = &featureValueWithBool__TrueValue;
  if (!v3) {
    v4 = &featureValueWithBool__FalseValue;
  }
  v5 = (void *)*v4;
  return v5;
}

- (unint64_t)type
{
  return 0;
}

- (unint64_t)_integralFeatureValue
{
  return [(REFeatureValue *)self BOOLValue];
}

@end