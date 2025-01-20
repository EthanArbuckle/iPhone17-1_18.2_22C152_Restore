@interface PICinematicAudioAdjustmentController
+ (NSString)dialogMixBiasKey;
- (NSString)renderingStyle;
- (double)dialogMixBias;
- (void)setDialogMixBias:(double)a3;
- (void)setRenderingStyle:(id)a3;
- (void)setRenderingStyleToDefaultForPortraitVideo;
@end

@implementation PICinematicAudioAdjustmentController

- (void)setRenderingStyleToDefaultForPortraitVideo
{
}

- (void)setRenderingStyle:(id)a3
{
  id v4 = a3;
  id v5 = [(PIAdjustmentController *)self adjustment];
  [v5 setObject:v4 forKeyedSubscript:@"renderingStyle"];
}

- (NSString)renderingStyle
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = [v2 objectForKeyedSubscript:@"renderingStyle"];

  if (v3) {
    id v4 = v3;
  }
  else {
    id v4 = @"original";
  }
  id v5 = v4;

  return v5;
}

- (void)setDialogMixBias:(double)a3
{
  id v6 = [NSNumber numberWithDouble:a3];
  id v4 = [(PIAdjustmentController *)self adjustment];
  id v5 = +[PICinematicAudioAdjustmentController dialogMixBiasKey];
  [v4 setObject:v6 forKeyedSubscript:v5];
}

- (double)dialogMixBias
{
  v2 = [(PIAdjustmentController *)self adjustment];
  v3 = +[PICinematicAudioAdjustmentController dialogMixBiasKey];
  id v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = 0.5;
  }

  return v6;
}

+ (NSString)dialogMixBiasKey
{
  return (NSString *)@"dialogMixBias";
}

@end