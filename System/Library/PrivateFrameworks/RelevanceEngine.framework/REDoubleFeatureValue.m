@interface REDoubleFeatureValue
@end

@implementation REDoubleFeatureValue

uint64_t __48___REDoubleFeatureValue_featureValueWithDouble___block_invoke()
{
  v0 = [[_REDoubleFeatureValue alloc] initWithValue:0.0];
  v1 = (void *)featureValueWithDouble__ZeroValue;
  featureValueWithDouble__ZeroValue = (uint64_t)v0;

  featureValueWithDouble__OneValue = [[_REDoubleFeatureValue alloc] initWithValue:1.0];
  return MEMORY[0x270F9A758]();
}

@end