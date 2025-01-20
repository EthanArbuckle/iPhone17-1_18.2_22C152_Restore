@interface PUPassiveContentDebugViewSpec
+ (BOOL)shouldShowClockOverlayForViewMode:(unint64_t)a3;
+ (unint64_t)cropModeForViewMode:(unint64_t)a3;
- (BOOL)shouldShowClockOverlay;
- (CGSize)headerReferenceSize;
- (CGSize)itemSize;
- (Class)collectionViewCellClass;
- (PUPassiveContentDebugViewSpec)initWithViewMode:(unint64_t)a3;
- (UIEdgeInsets)collectionViewContentInsets;
- (UIEdgeInsets)headerInsets;
- (unint64_t)cropMode;
- (unint64_t)viewMode;
@end

@implementation PUPassiveContentDebugViewSpec

- (unint64_t)cropMode
{
  return self->_cropMode;
}

- (BOOL)shouldShowClockOverlay
{
  return self->_shouldShowClockOverlay;
}

- (unint64_t)viewMode
{
  return self->_viewMode;
}

- (Class)collectionViewCellClass
{
  if ([(PUPassiveContentDebugViewSpec *)self viewMode] <= 3)
  {
    v2 = objc_opt_class();
  }
  return (Class)v2;
}

- (CGSize)itemSize
{
  v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double v5 = v4;

  double v6 = (v5 + -20.0) / 3.0 + -8.0;
  switch([(PUPassiveContentDebugViewSpec *)self viewMode])
  {
    case 0uLL:
    case 2uLL:
      PXSizeGetAspectRatio();
      double v8 = v6 / v7;
      break;
    case 1uLL:
      double v8 = v6 + 30.0;
      break;
    case 3uLL:
      v9 = +[PUAmbientPhotoFrameSettings sharedInstance];
      +[PUWatchFaceHelper screenBoundsForWatchType:](PUWatchFaceHelper, "screenBoundsForWatchType:", [v9 watchType]);
      PXSizeGetAspectRatio();
      double v8 = v6 / v10;

      break;
    default:
      double v8 = 0.0;
      double v6 = 0.0;
      break;
  }
  double v11 = v6;
  double v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (UIEdgeInsets)headerInsets
{
  double v2 = 0.0;
  double v3 = 15.0;
  double v4 = 0.0;
  double v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (CGSize)headerReferenceSize
{
  double v2 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v2 bounds];
  double v4 = v3;

  double v5 = 30.0;
  double v6 = v4;
  result.height = v5;
  result.width = v6;
  return result;
}

- (UIEdgeInsets)collectionViewContentInsets
{
  double v2 = 10.0;
  double v3 = 10.0;
  double v4 = 10.0;
  double v5 = 10.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (PUPassiveContentDebugViewSpec)initWithViewMode:(unint64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUPassiveContentDebugViewSpec;
  double v4 = [(PUPassiveContentDebugViewSpec *)&v7 init];
  double v5 = v4;
  if (v4)
  {
    v4->_viewMode = a3;
    v4->_shouldShowClockOverlay = [(id)objc_opt_class() shouldShowClockOverlayForViewMode:a3];
    v5->_cropMode = [(id)objc_opt_class() cropModeForViewMode:a3];
  }
  return v5;
}

+ (unint64_t)cropModeForViewMode:(unint64_t)a3
{
  if (a3 - 1 > 2) {
    return 0;
  }
  else {
    return qword_1AEFF8368[a3 - 1];
  }
}

+ (BOOL)shouldShowClockOverlayForViewMode:(unint64_t)a3
{
  return a3 == 3 || a3 == 0;
}

@end