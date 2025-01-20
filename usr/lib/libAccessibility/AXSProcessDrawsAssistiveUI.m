@interface AXSProcessDrawsAssistiveUI
@end

@implementation AXSProcessDrawsAssistiveUI

void ___AXSProcessDrawsAssistiveUI_block_invoke()
{
  v0 = [MEMORY[0x1E4F28B50] mainBundle];
  id v2 = [v0 bundleIdentifier];

  if (([v2 isEqualToString:@"com.apple.accessibility.AccessibilityUIServer"] & 1) != 0
    || ([v2 isEqualToString:@"com.apple.AccessibilityUIServer"] & 1) != 0)
  {
    char v1 = 1;
  }
  else
  {
    char v1 = [v2 isEqualToString:@"com.apple.assistivetouchd"];
  }
  _AXSProcessDrawsAssistiveUI_result = v1;
}

@end