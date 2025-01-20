@interface UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode
@end

@implementation UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode

void ___UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode_block_invoke()
{
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v1 = [v0 valueForKey:@"com.apple.UIKit.ScreenshotForceSRGB"];

  if ((objc_opt_respondsToSelector() & 1) != 0 && [v1 BOOLValue]) {
    byte_1EB259DB8 = 1;
  }
}

__IOSurface *___UICreateScreenUIImageFromRectUncheckedWithRotationEnforceSecureMode_block_invoke_2(double a1, double a2, uint64_t a3, void *a4)
{
  return _UIRenderingBufferCreate(a4, a1, a2);
}

@end