@interface REBoolFeatureValue
@end

@implementation REBoolFeatureValue

uint64_t __44___REBoolFeatureValue_featureValueWithBool___block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)featureValueWithBool__TrueValue;
  featureValueWithBool__TrueValue = v0;

  uint64_t v2 = objc_opt_new();
  uint64_t v3 = featureValueWithBool__FalseValue;
  featureValueWithBool__FalseValue = v2;
  return MEMORY[0x270F9A758](v2, v3);
}

@end