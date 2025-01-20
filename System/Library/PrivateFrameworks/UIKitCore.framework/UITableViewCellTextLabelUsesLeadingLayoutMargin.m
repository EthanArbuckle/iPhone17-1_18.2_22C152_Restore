@interface UITableViewCellTextLabelUsesLeadingLayoutMargin
@end

@implementation UITableViewCellTextLabelUsesLeadingLayoutMargin

void ___UITableViewCellTextLabelUsesLeadingLayoutMargin_block_invoke()
{
  if (qword_1EB25C788 != -1) {
    dispatch_once(&qword_1EB25C788, &__block_literal_global_520);
  }
  if (_MergedGlobals_47_1)
  {
    byte_1EB25C781 = 1;
  }
  else
  {
    _UIMainBundleIdentifier();
    id v0 = (id)objc_claimAutoreleasedReturnValue();
    byte_1EB25C781 = [v0 isEqualToString:@"com.apple.Preferences"];
  }
}

@end