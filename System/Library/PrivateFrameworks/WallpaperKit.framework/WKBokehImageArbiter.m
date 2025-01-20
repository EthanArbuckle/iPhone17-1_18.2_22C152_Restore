@interface WKBokehImageArbiter
+ (id)imageForZ:(double)a1;
@end

@implementation WKBokehImageArbiter

+ (id)imageForZ:(double)a1
{
  self;
  double v2 = (a1 + 1.5) / 1.2;
  if (v2 < 0.0) {
    double v2 = 0.0;
  }
  if (v2 >= 1.0) {
    double v3 = 0.0;
  }
  else {
    double v3 = (1.0 - v2) * 9.0;
  }
  v4 = (void *)MEMORY[0x1E4FB1818];
  v5 = imageTable[blurTable[vcvtad_u64_f64(v3)]];
  v6 = WKBundleForWallpaperKitFramework();
  v7 = [v4 imageNamed:v5 inBundle:v6 compatibleWithTraitCollection:0];

  return v7;
}

@end