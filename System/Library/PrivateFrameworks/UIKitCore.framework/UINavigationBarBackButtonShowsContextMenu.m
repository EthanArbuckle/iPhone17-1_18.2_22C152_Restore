@interface UINavigationBarBackButtonShowsContextMenu
@end

@implementation UINavigationBarBackButtonShowsContextMenu

void ___UINavigationBarBackButtonShowsContextMenu_block_invoke()
{
  v0 = _UIKitUserDefaults();
  id v2 = [v0 objectForKey:@"NavigationBarBackButtonShowsContextMenu"];

  if (v2) {
    char v1 = [v2 BOOLValue];
  }
  else {
    char v1 = dyld_program_sdk_at_least();
  }
  byte_1EB25C819 = v1;
}

@end