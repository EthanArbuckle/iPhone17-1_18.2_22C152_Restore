@interface PBUIBokehImageArbiter
+ (id)imageForBokehImage:(uint64_t)a1;
+ (uint64_t)bokehImageForDiameter:(double)a1;
@end

@implementation PBUIBokehImageArbiter

+ (uint64_t)bokehImageForDiameter:(double)a1
{
  self;
  v2 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  double v4 = a1 / 1.5;
  if (v3 != 1) {
    double v4 = a1;
  }
  double v5 = (v4 + -40.0) / -130.0 + 1.0;
  if (v5 < 0.0) {
    double v5 = 0.0;
  }
  if (v5 >= 1.0) {
    double v6 = 11.0;
  }
  else {
    double v6 = v5 * 11.0;
  }
  return blurTable[vcvtad_u64_f64(v6)];
}

+ (id)imageForBokehImage:(uint64_t)a1
{
  self;
  uint64_t v3 = +[PBUIWallpaperCache wallpaperCache];
  double v4 = imageTable[a2];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__PBUIBokehImageArbiter_imageForBokehImage___block_invoke;
  v7[3] = &__block_descriptor_40_e18___UIImage_16__0_Q8l;
  v7[4] = a2;
  double v5 = [v3 imageForKey:v4 generatingIfNecessaryWithBlock:v7];

  return v5;
}

uint64_t __44__PBUIBokehImageArbiter_imageForBokehImage___block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F42A80];
  v2 = imageTable[*(void *)(a1 + 32)];
  if (_PBUIBundle___onceToken != -1) {
    dispatch_once(&_PBUIBundle___onceToken, &__block_literal_global_20);
  }
  uint64_t v3 = _PBUIBundle___paperBoardUIBundle;
  return [v1 imageNamed:v2 inBundle:v3 compatibleWithTraitCollection:0];
}

@end