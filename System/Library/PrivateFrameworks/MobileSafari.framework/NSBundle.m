@interface NSBundle
@end

@implementation NSBundle

void __73__NSBundle_MobileSafariFrameworkExtras__safari_isSafariViewServiceBundle__block_invoke()
{
  id v1 = [MEMORY[0x1E4F28B50] mainBundle];
  v0 = [v1 bundleIdentifier];
  safari_isSafariViewServiceBundle_isSafariViewService = [v0 isEqualToString:@"com.apple.SafariViewService"];
}

@end