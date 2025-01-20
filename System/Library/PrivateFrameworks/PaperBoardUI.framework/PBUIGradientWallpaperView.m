@interface PBUIGradientWallpaperView
+ (Class)layerClass;
- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4;
- (PBUIGradientWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8;
- (PBUIWallpaperGradient)wallpaperGradient;
- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5;
- (id)_computeAverageColor;
- (int64_t)wallpaperType;
@end

@implementation PBUIGradientWallpaperView

+ (Class)layerClass
{
  return (Class)self;
}

- (PBUIGradientWallpaperView)initWithFrame:(CGRect)a3 configuration:(id)a4 variant:(int64_t)a5 cacheGroup:(id)a6 delegate:(id)a7 options:(unint64_t)a8
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v17 = a4;
  v23.receiver = self;
  v23.super_class = (Class)PBUIGradientWallpaperView;
  v18 = -[PBUIWallpaperView initWithFrame:configuration:variant:cacheGroup:delegate:options:](&v23, sel_initWithFrame_configuration_variant_cacheGroup_delegate_options_, v17, a5, a6, a7, a8, x, y, width, height);
  if (v18)
  {
    uint64_t v19 = [v17 wallpaperGradient];
    wallpaperGradient = v18->_wallpaperGradient;
    v18->_wallpaperGradient = (PBUIWallpaperGradient *)v19;

    v21 = [(PBUIGradientWallpaperView *)v18 layer];
    [(PBUIWallpaperGradient *)v18->_wallpaperGradient configureLayer:v21];
  }
  return v18;
}

- (int64_t)wallpaperType
{
  return 5;
}

- (BOOL)isDisplayingWallpaperWithConfiguration:(id)a3 forVariant:(int64_t)a4
{
  id v5 = a3;
  if ([v5 wallpaperType] == 5)
  {
    v6 = [v5 wallpaperGradient];
    v7 = [(PBUIGradientWallpaperView *)self wallpaperGradient];
    char v8 = [v7 isEqual:v6];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_computeAverageColor
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v2 = [(PBUIGradientWallpaperView *)self wallpaperGradient];
  v3 = [v2 colors];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v19;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v3);
        }
        v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        double v16 = 0.0;
        double v17 = 0.0;
        double v15 = 0.0;
        if ([v12 getRed:&v17 green:&v16 blue:&v15 alpha:0])
        {
          double v10 = v10 + v17 * 255.0 * (v17 * 255.0);
          double v9 = v9 + v16 * 255.0 * (v16 * 255.0);
          double v8 = v8 + v15 * 255.0 * (v15 * 255.0);
          ++v6;
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
    double v8 = 0.0;
    double v9 = 0.0;
    double v10 = 0.0;
  }
  v13 = [MEMORY[0x1E4F428B8] colorWithRed:sqrt(v10 / (double)v6) / 255.0 green:sqrt(v9 / (double)v6) / 255.0 blue:sqrt(v8 / (double)v6) / 255.0 alpha:1.0];

  return v13;
}

- (double)contrastInRect:(CGRect)a3 contrastWithinBoxes:(double *)a4 contrastBetweenBoxes:(double *)a5
{
  if (a4) {
    *a4 = 0.0;
  }
  if (a5) {
    *a5 = 0.0;
  }
  return 0.0;
}

- (PBUIWallpaperGradient)wallpaperGradient
{
  return self->_wallpaperGradient;
}

- (void).cxx_destruct
{
}

@end