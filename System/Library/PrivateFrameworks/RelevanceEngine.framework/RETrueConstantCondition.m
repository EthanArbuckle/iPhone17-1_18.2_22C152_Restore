@interface RETrueConstantCondition
@end

@implementation RETrueConstantCondition

uint64_t __42___RETrueConstantCondition_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_Condition;
  sharedInstance_Condition = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

@end