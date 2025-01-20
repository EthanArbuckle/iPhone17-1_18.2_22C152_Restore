@interface UITabOverridesDefaultPlacement
@end

@implementation UITabOverridesDefaultPlacement

void ___UITabOverridesDefaultPlacement_block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v0 = [v2 arrayForKey:@"UITabOverrideDefaultPlacements"];
  v1 = (void *)qword_1EB25FE50;
  qword_1EB25FE50 = v0;
}

@end