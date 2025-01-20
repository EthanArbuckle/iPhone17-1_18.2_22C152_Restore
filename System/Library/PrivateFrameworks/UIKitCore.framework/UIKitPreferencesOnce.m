@interface UIKitPreferencesOnce
@end

@implementation UIKitPreferencesOnce

void ___UIKitPreferencesOnce_block_invoke()
{
  _UIKitUserDefaults();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v0 = [v2 dictionaryRepresentation];
  v1 = (void *)qword_1EB264AD0;
  qword_1EB264AD0 = v0;
}

@end