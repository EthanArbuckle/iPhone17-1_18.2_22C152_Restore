@interface PUParallaxLayerView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (PFParallaxLayer)parallaxLayer;
- (PUParallaxLayerLayoutInfo)currentLayoutInfo;
- (void)layoutWithInfo:(id)a3;
@end

@implementation PUParallaxLayerView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"] & 1) != 0
    || ([v4 isEqualToString:@"filters.colorMatrix.inputColorMatrix"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)PUParallaxLayerView;
    BOOL v5 = [(PUParallaxLayerView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

- (PUParallaxLayerLayoutInfo)currentLayoutInfo
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PUParallaxLayerView *)_PFAssertFailHandler();
  return (PUParallaxLayerLayoutInfo *)[(PUParallaxLayerView *)v3 parallaxLayer];
}

- (PFParallaxLayer)parallaxLayer
{
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  objc_claimAutoreleasedReturnValue();
  v3 = (PUParallaxLayerView *)_PFAssertFailHandler();
  [(PUParallaxLayerView *)v3 layoutWithInfo:v5];
  return result;
}

- (void)layoutWithInfo:(id)a3
{
  id v3 = a3;
  SEL v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  objc_claimAutoreleasedReturnValue();
  id v5 = (PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)_PFAssertFailHandler();
  [(PUTopPeopleWallpaperSuggestionsDebugSettingsViewController *)v5 .cxx_destruct];
}

@end