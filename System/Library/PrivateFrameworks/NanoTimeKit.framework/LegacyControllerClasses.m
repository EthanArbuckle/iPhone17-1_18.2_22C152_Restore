@interface LegacyControllerClasses
@end

@implementation LegacyControllerClasses

void ___LegacyControllerClasses_block_invoke()
{
  v2[5] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  v2[3] = objc_opt_class();
  v2[4] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:5];
  v1 = (void *)_LegacyControllerClasses___classes;
  _LegacyControllerClasses___classes = v0;
}

@end