@interface UIKitGetTextEffectsCatalog
@end

@implementation UIKitGetTextEffectsCatalog

void ___UIKitGetTextEffectsCatalog_block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F5E048]);
  v1 = (void *)MEMORY[0x1E4F28B50];
  _UIKitResourceBundlePath(@"TextEffectsCatalog.bundle");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = [v1 bundleWithPath:v5];
  uint64_t v3 = [v0 initWithName:@"TextEffects" fromBundle:v2 error:0];
  v4 = (void *)qword_1EB265528;
  qword_1EB265528 = v3;
}

@end