@interface PRNeedsWallpaperCaptureView
@end

@implementation PRNeedsWallpaperCaptureView

void ___PRNeedsWallpaperCaptureView_block_invoke()
{
  v0 = [MEMORY[0x1E4F4F7D0] sharedInstance];
  id v2 = [v0 productType];

  if ([v2 isEqualToString:@"iPhone10,2"]) {
    char v1 = 1;
  }
  else {
    char v1 = [v2 isEqualToString:@"iPhone10,5"];
  }
  _PRNeedsWallpaperCaptureView_needsWallpaperCaptureView = v1;
}

@end