@interface PUWallpaperPosterMotionEffect
- (CGPoint)parallaxVectorFromKeyPathsAndRelativeValues:(id)a3;
- (PUWallpaperPosterMotionEffect)init;
@end

@implementation PUWallpaperPosterMotionEffect

- (CGPoint)parallaxVectorFromKeyPathsAndRelativeValues:(id)a3
{
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"focusDirectionX"];
  [v4 doubleValue];
  double v6 = v5;
  v7 = [v3 objectForKeyedSubscript:@"focusDirectionY"];

  [v7 doubleValue];
  double v9 = v8;

  double v10 = v6;
  double v11 = v9;
  result.y = v11;
  result.x = v10;
  return result;
}

- (PUWallpaperPosterMotionEffect)init
{
  v8[2] = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)PUWallpaperPosterMotionEffect;
  v2 = [(UIMotionEffect *)&v7 init];
  if (v2)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1870]) initWithKeyPath:@"focusDirectionX" type:0];
    [v3 setMinimumRelativeValue:&unk_1F078D350];
    [v3 setMaximumRelativeValue:&unk_1F078D360];
    v4 = (void *)[objc_alloc(MEMORY[0x1E4FB1870]) initWithKeyPath:@"focusDirectionY" type:1];
    [v4 setMinimumRelativeValue:&unk_1F078D350];
    [v4 setMaximumRelativeValue:&unk_1F078D360];
    v8[0] = v3;
    v8[1] = v4;
    double v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:2];
    [(UIMotionEffectGroup *)v2 setMotionEffects:v5];
  }
  return v2;
}

@end