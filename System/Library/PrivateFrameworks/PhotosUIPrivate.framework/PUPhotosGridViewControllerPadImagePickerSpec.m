@interface PUPhotosGridViewControllerPadImagePickerSpec
- (BOOL)canCommitPreview;
- (BOOL)displaysAvalancheStacks;
- (unsigned)thumbnailImageFormat;
@end

@implementation PUPhotosGridViewControllerPadImagePickerSpec

- (BOOL)canCommitPreview
{
  return 0;
}

- (BOOL)displaysAvalancheStacks
{
  return 0;
}

- (unsigned)thumbnailImageFormat
{
  if (PUMainScreenScale_onceToken != -1) {
    dispatch_once(&PUMainScreenScale_onceToken, &__block_literal_global_28618);
  }
  if (*(double *)&PUMainScreenScale_screenScale <= 1.0) {
    return 3311;
  }
  else {
    return 3319;
  }
}

@end