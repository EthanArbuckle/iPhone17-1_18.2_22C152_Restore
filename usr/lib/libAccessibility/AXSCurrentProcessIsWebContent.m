@interface AXSCurrentProcessIsWebContent
@end

@implementation AXSCurrentProcessIsWebContent

void ___AXSCurrentProcessIsWebContent_block_invoke()
{
  if (_AXHasBooleanEntitlement(@"com.apple.developer.web-browser-engine.webcontent"))
  {
    _AXSCurrentProcessIsWebContent_IsWebContent = 1;
  }
  else
  {
    id v1 = [MEMORY[0x1E4F28B50] mainBundle];
    v0 = [v1 bundleIdentifier];
    _AXSCurrentProcessIsWebContent_IsWebContent = [v0 hasPrefix:@"com.apple.WebKit.WebContent"];
  }
}

@end