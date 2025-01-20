@interface ShareSheetIsAppleApp
@end

@implementation ShareSheetIsAppleApp

void ___ShareSheetIsAppleApp_block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  _ShareSheetIsAppleApp_isAppleApp = [v0 hasPrefix:@"com.apple."];
}

@end