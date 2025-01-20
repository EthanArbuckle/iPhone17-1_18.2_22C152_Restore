@interface NSUnitConcentrationMass(WFAdditionalUnits)
+ (id)wf_microgramsPerCubicMeter;
@end

@implementation NSUnitConcentrationMass(WFAdditionalUnits)

+ (id)wf_microgramsPerCubicMeter
{
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F29170]) initWithCoefficient:0.000000001];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F29168]) initWithSymbol:@"μg/m³" converter:v0];

  return v1;
}

@end