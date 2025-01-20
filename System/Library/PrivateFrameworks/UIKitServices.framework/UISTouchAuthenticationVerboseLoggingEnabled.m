@interface UISTouchAuthenticationVerboseLoggingEnabled
@end

@implementation UISTouchAuthenticationVerboseLoggingEnabled

void ___UISTouchAuthenticationVerboseLoggingEnabled_block_invoke()
{
  if (os_variant_allows_internal_security_policies())
  {
    id v0 = (id)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.UIKit"];
    _MergedGlobals_12 = [v0 BOOLForKey:@"VerboseTouchAuthenticationLogging"];
  }
}

@end