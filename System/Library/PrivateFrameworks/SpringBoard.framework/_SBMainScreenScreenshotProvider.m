@interface _SBMainScreenScreenshotProvider
- (id)captureScreenshot;
- (id)flasher;
@end

@implementation _SBMainScreenScreenshotProvider

- (id)flasher
{
  return +[SBScreenFlash mainScreenFlasher];
}

- (id)captureScreenshot
{
  v2 = (void *)_UICreateScreenUIImageWithRotation();
  return v2;
}

@end