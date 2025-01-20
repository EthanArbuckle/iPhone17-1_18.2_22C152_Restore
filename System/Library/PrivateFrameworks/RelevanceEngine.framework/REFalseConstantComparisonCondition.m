@interface REFalseConstantComparisonCondition
@end

@implementation REFalseConstantComparisonCondition

uint64_t __53___REFalseConstantComparisonCondition_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_Condition_11;
  sharedInstance_Condition_11 = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end