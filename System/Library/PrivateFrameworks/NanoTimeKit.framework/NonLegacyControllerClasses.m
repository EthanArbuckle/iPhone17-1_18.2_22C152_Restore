@interface NonLegacyControllerClasses
@end

@implementation NonLegacyControllerClasses

void ___NonLegacyControllerClasses_block_invoke()
{
  v2[3] = *MEMORY[0x1E4F143B8];
  v2[0] = objc_opt_class();
  v2[1] = objc_opt_class();
  v2[2] = objc_opt_class();
  uint64_t v0 = [MEMORY[0x1E4F1C978] arrayWithObjects:v2 count:3];
  v1 = (void *)_NonLegacyControllerClasses___classes;
  _NonLegacyControllerClasses___classes = v0;
}

@end