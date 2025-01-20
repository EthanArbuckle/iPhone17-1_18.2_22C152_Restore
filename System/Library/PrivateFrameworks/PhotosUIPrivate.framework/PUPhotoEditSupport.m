@interface PUPhotoEditSupport
+ (BOOL)currentDeviceShouldAllowRawDecode;
+ (double)changeValueOfSlider:(id)a3 reverse:(BOOL)a4 coarse:(BOOL)a5;
+ (id)createEditSlider;
+ (id)createPlayPauseButton;
@end

@implementation PUPhotoEditSupport

+ (id)createPlayPauseButton
{
  v2 = [MEMORY[0x1E4FB14D0] buttonWithType:0];
  [v2 setAlpha:0.0];
  objc_msgSend(v2, "_setTouchInsets:", -15.0, -15.0, -15.0, -15.0);
  id v3 = [MEMORY[0x1E4FB1618] blackColor];
  uint64_t v4 = [v3 CGColor];
  v5 = [v2 layer];
  [v5 setShadowColor:v4];

  v6 = [v2 layer];
  LODWORD(v7) = 1050253722;
  [v6 setShadowOpacity:v7];

  v8 = [v2 layer];
  [v8 setShadowRadius:5.0];

  v9 = [MEMORY[0x1E4FB1818] systemImageNamed:@"play.fill"];
  [v2 setImage:v9 forState:0];

  v10 = [MEMORY[0x1E4FB1818] systemImageNamed:@"pause.fill"];
  [v2 setImage:v10 forState:4];

  return v2;
}

+ (id)createEditSlider
{
  id v2 = objc_alloc(MEMORY[0x1E4F57D68]);
  id v3 = objc_msgSend(v2, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  uint64_t v4 = [MEMORY[0x1E4FB1618] clearColor];
  [v3 setBackgroundColor:v4];

  [v3 setUseTickMarkLegibilityShadows:1];
  v5 = [MEMORY[0x1E4FB1618] labelColor];
  v6 = [v3 tickMarksConfiguration];
  [v6 setMainTickMarkColor:v5];

  double v7 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  v8 = [v7 colorWithAlphaComponent:0.5];
  v9 = [v3 tickMarksConfiguration];
  [v9 setSecondaryTickMarkColor:v8];

  return v3;
}

+ (double)changeValueOfSlider:(id)a3 reverse:(BOOL)a4 coarse:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  [v7 maximumValue];
  double v9 = v8;
  [v7 minimumValue];
  double v11 = (v9 - v10) / fmax((double)([v7 tickMarkCount] - 1), 1.0);
  if (v6) {
    double v11 = -v11;
  }
  if (v5) {
    double v12 = v11 * 5.0;
  }
  else {
    double v12 = v11;
  }
  [v7 value];
  [v7 setValue:v13 + v12];

  return v12;
}

+ (BOOL)currentDeviceShouldAllowRawDecode
{
  if (currentDeviceShouldAllowRawDecode_onceToken != -1) {
    dispatch_once(&currentDeviceShouldAllowRawDecode_onceToken, &__block_literal_global_59351);
  }
  return currentDeviceShouldAllowRawDecode_supportsRawDecode;
}

void __55__PUPhotoEditSupport_currentDeviceShouldAllowRawDecode__block_invoke()
{
  id v0 = MTLCreateSystemDefaultDevice();
  size_t v2 = 8;
  unint64_t v3 = 0;
  if (sysctlbyname("hw.memsize", &v3, &v2, 0, 0) || v3 >= 0x60000001) {
    char v1 = [v0 supportsFeatureSet:1];
  }
  else {
    char v1 = 0;
  }
  currentDeviceShouldAllowRawDecode_supportsRawDecode = v1;
}

@end