@interface MTLFunctionConstantValues(PTPTMTLFunctionConstantValuesAdditions)
- (uint64_t)setConstantFloat2:()PTPTMTLFunctionConstantValuesAdditions withName:;
- (uint64_t)setConstantFloat:()PTPTMTLFunctionConstantValuesAdditions withName:;
- (uint64_t)setConstantHalf3:()PTPTMTLFunctionConstantValuesAdditions withName:;
@end

@implementation MTLFunctionConstantValues(PTPTMTLFunctionConstantValuesAdditions)

- (uint64_t)setConstantFloat:()PTPTMTLFunctionConstantValuesAdditions withName:
{
  float v5 = a2;
  return [a1 setConstantValue:&v5 type:33 withName:a4];
}

- (uint64_t)setConstantHalf3:()PTPTMTLFunctionConstantValuesAdditions withName:
{
  return [a1 setConstantValue:a3 type:43 withName:a4];
}

- (uint64_t)setConstantFloat2:()PTPTMTLFunctionConstantValuesAdditions withName:
{
  double v5 = a2;
  return [a1 setConstantValue:&v5 type:34 withName:a4];
}

@end