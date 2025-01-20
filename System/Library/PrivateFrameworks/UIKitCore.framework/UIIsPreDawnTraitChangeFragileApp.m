@interface UIIsPreDawnTraitChangeFragileApp
@end

@implementation UIIsPreDawnTraitChangeFragileApp

void ___UIIsPreDawnTraitChangeFragileApp_block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    byte_1EB25BA6A = 0;
  }
  else
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EB25BA6A = [&unk_1ED3F13F0 containsObject:v0];
  }
}

@end