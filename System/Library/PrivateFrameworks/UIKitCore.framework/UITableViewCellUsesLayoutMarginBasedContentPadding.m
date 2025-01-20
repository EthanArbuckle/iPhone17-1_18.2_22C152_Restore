@interface UITableViewCellUsesLayoutMarginBasedContentPadding
@end

@implementation UITableViewCellUsesLayoutMarginBasedContentPadding

void ___UITableViewCellUsesLayoutMarginBasedContentPadding_block_invoke()
{
  if (dyld_program_sdk_at_least())
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    _MergedGlobals_47_1 = [&unk_1ED3F1288 containsObject:v0] ^ 1;
  }
  else
  {
    _MergedGlobals_47_1 = 0;
  }
}

@end