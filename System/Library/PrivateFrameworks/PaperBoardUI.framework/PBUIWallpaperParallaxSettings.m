@interface PBUIWallpaperParallaxSettings
+ (CGSize)_requiredOverhangSizeForCurrentDevice;
+ (CGSize)_requiredOverhangSizeForDeviceType:(int64_t)a3;
+ (CGSize)bestWallpaperSizeForParallaxFactor:(double)a3;
+ (CGSize)bestWallpaperSizeForParallaxFactor:(double)a3 portrait:(BOOL)a4;
+ (CGSize)bestWallpaperSizeForWallpaperSize:(CGSize)a3 deviceType:(int64_t)a4 parallaxFactor:(double)a5 portrait:(BOOL)a6;
+ (CGSize)minimumWallpaperSizeForCurrentDevice;
+ (CGSize)minimumWallpaperSizeForWallpaperSize:(CGSize)a3 deviceType:(int64_t)a4;
+ (CGSize)overhangSizeForCurrentDevice;
+ (CGSize)overhangSizeForDeviceType:(int64_t)a3;
+ (double)minimumZoomScaleForCurrentDeviceForWallpaperSize:(CGSize)a3 parallaxFactor:(double)a4;
+ (double)minimumZoomScaleForWallpaperSize:(CGSize)a3 parallaxFactor:(double)a4 deviceType:(int64_t)a5;
+ (id)settingsControllerModule;
+ (int64_t)_currentDeviceType;
- (double)overhangX;
- (double)overhangY;
- (double)perspectiveTransform;
- (void)setDefaultValues;
- (void)setOverhangX:(double)a3;
- (void)setOverhangY:(double)a3;
- (void)setPerspectiveTransform:(double)a3;
@end

@implementation PBUIWallpaperParallaxSettings

+ (int64_t)_currentDeviceType
{
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  int64_t v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

+ (CGSize)_requiredOverhangSizeForCurrentDevice
{
  uint64_t v3 = [a1 _currentDeviceType];
  [a1 _requiredOverhangSizeForDeviceType:v3];
  result.height = v5;
  result.width = v4;
  return result;
}

+ (CGSize)_requiredOverhangSizeForDeviceType:(int64_t)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      double v3 = 78.0;
      double v4 = 119.0;
    }
    else
    {
      double v3 = *MEMORY[0x1E4F1DB30];
      double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
  }
  else
  {
    double v3 = 26.0;
    double v4 = 64.0;
  }
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)setDefaultValues
{
  v5.receiver = self;
  v5.super_class = (Class)PBUIWallpaperParallaxSettings;
  [(PBUIParallaxSettings *)&v5 setDefaultValues];
  [(id)objc_opt_class() _requiredOverhangSizeForCurrentDevice];
  double v4 = v3;
  -[PBUIWallpaperParallaxSettings setOverhangX:](self, "setOverhangX:");
  [(PBUIWallpaperParallaxSettings *)self setOverhangY:v4];
  [(PBUIWallpaperParallaxSettings *)self setPerspectiveTransform:0.2];
}

+ (CGSize)bestWallpaperSizeForParallaxFactor:(double)a3
{
  BOOL v5 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation] != 0;
  [a1 bestWallpaperSizeForParallaxFactor:v5 portrait:a3];
  result.height = v7;
  result.width = v6;
  return result;
}

+ (CGSize)bestWallpaperSizeForParallaxFactor:(double)a3 portrait:(BOOL)a4
{
  BOOL v4 = a4;
  double v7 = [MEMORY[0x1E4F42D90] mainScreen];
  [v7 _referenceBounds];
  double v9 = v8;
  double v11 = v10;

  uint64_t v12 = [a1 _currentDeviceType];
  objc_msgSend(a1, "bestWallpaperSizeForWallpaperSize:deviceType:parallaxFactor:portrait:", v12, v4, v9, v11, a3);
  result.height = v14;
  result.width = v13;
  return result;
}

+ (CGSize)bestWallpaperSizeForWallpaperSize:(CGSize)a3 deviceType:(int64_t)a4 parallaxFactor:(double)a5 portrait:(BOOL)a6
{
  if (a3.width >= a3.height) {
    double width = a3.width;
  }
  else {
    double width = a3.height;
  }
  objc_msgSend(a1, "_requiredOverhangSizeForDeviceType:", a4, a6);
  double v9 = width + (v8 + v8) * a5;
  double v11 = width + (v10 + v10) * a5;
  result.height = v11;
  result.double width = v9;
  return result;
}

+ (CGSize)minimumWallpaperSizeForCurrentDevice
{
  double v3 = [MEMORY[0x1E4F42D90] mainScreen];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  if ([MEMORY[0x1E4F42FF0] _motionEffectsEnabled])
  {
    [a1 _requiredOverhangSizeForCurrentDevice];
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v10 = v5 + v8 * 2.0;
  double v11 = v7 + v9 * 2.0;
  result.height = v11;
  result.double width = v10;
  return result;
}

+ (CGSize)minimumWallpaperSizeForWallpaperSize:(CGSize)a3 deviceType:(int64_t)a4
{
  double height = a3.height;
  double width = a3.width;
  if ([MEMORY[0x1E4F42FF0] _motionEffectsEnabled])
  {
    [a1 _requiredOverhangSizeForDeviceType:a4];
  }
  else
  {
    double v8 = *MEMORY[0x1E4F1DB30];
    double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  double v10 = width + v8 * 2.0;
  double v11 = height + v9 * 2.0;
  result.double height = v11;
  result.double width = v10;
  return result;
}

+ (CGSize)overhangSizeForCurrentDevice
{
  if ([MEMORY[0x1E4F42FF0] _motionEffectsEnabled])
  {
    [a1 _requiredOverhangSizeForCurrentDevice];
  }
  else
  {
    double v3 = *MEMORY[0x1E4F1DB30];
    double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

+ (CGSize)overhangSizeForDeviceType:(int64_t)a3
{
  if ([MEMORY[0x1E4F42FF0] _motionEffectsEnabled])
  {
    [a1 _requiredOverhangSizeForDeviceType:a3];
  }
  else
  {
    double v5 = *MEMORY[0x1E4F1DB30];
    double v6 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.double height = v6;
  result.double width = v5;
  return result;
}

+ (double)minimumZoomScaleForWallpaperSize:(CGSize)a3 parallaxFactor:(double)a4 deviceType:(int64_t)a5
{
  double width = a3.width;
  double result = 1.0;
  if (a4 != 0.0)
  {
    objc_msgSend(a1, "overhangSizeForDeviceType:", a5, 1.0, a3.height);
    return 1.0 / ((width - v7 - v7) / width);
  }
  return result;
}

+ (double)minimumZoomScaleForCurrentDeviceForWallpaperSize:(CGSize)a3 parallaxFactor:(double)a4
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v8 = [a1 _currentDeviceType];
  objc_msgSend(a1, "minimumZoomScaleForWallpaperSize:parallaxFactor:deviceType:", v8, width, height, a4);
  return result;
}

+ (id)settingsControllerModule
{
  v19[3] = *MEMORY[0x1E4F143B8];
  double v3 = [MEMORY[0x1E4F94148] rowWithTitle:@"Horizontal overhang (pts)" valueKeyPath:@"overhangX"];
  double v4 = [v3 precision:0];
  v19[0] = v4;
  double v5 = [MEMORY[0x1E4F94148] rowWithTitle:@"Vertical overhang (pts)" valueKeyPath:@"overhangY"];
  double v6 = [v5 precision:0];
  v19[1] = v6;
  double v7 = [MEMORY[0x1E4F941D8] rowWithTitle:@"Perspective transform" valueKeyPath:@"perspectiveTransform"];
  v19[2] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v19 count:3];

  double v9 = [MEMORY[0x1E4F94160] sectionWithRows:v8];
  double v10 = (void *)MEMORY[0x1E4F94160];
  v17.receiver = a1;
  v17.super_class = (Class)&OBJC_METACLASS___PBUIWallpaperParallaxSettings;
  double v11 = objc_msgSendSuper2(&v17, sel_settingsControllerModule);
  uint64_t v12 = [v10 submoduleWithModule:v11 childSettingsKeyPath:0];

  double v13 = (void *)MEMORY[0x1E4F94160];
  v18[0] = v9;
  v18[1] = v12;
  double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
  v15 = [v13 moduleWithTitle:@"Wallpaper" contents:v14];

  return v15;
}

- (double)overhangX
{
  return self->_overhangX;
}

- (void)setOverhangX:(double)a3
{
  self->_overhangX = a3;
}

- (double)overhangY
{
  return self->_overhangY;
}

- (void)setOverhangY:(double)a3
{
  self->_overhangY = a3;
}

- (double)perspectiveTransform
{
  return self->_perspectiveTransform;
}

- (void)setPerspectiveTransform:(double)a3
{
  self->_perspectiveTransform = a3;
}

@end