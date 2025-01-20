@interface UIView(SystemApertureUIAdditions)
+ (id)_sauiBlurInputRadiusKeyPath;
+ (id)_sauiBlurKeyPath;
- (BOOL)isSauiBlurConfigured;
- (double)sauiBlurRadius;
- (void)_configureBlurFilterIfNecessary;
- (void)setSauiBlurRadius:()SystemApertureUIAdditions;
@end

@implementation UIView(SystemApertureUIAdditions)

+ (id)_sauiBlurKeyPath
{
  if (_sauiBlurKeyPath_onceToken != -1) {
    dispatch_once(&_sauiBlurKeyPath_onceToken, &__block_literal_global);
  }
  v0 = (void *)_sauiBlurKeyPath___sauiBlurKeyPath;
  return v0;
}

+ (id)_sauiBlurInputRadiusKeyPath
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__UIView_SystemApertureUIAdditions___sauiBlurInputRadiusKeyPath__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (_sauiBlurInputRadiusKeyPath_onceToken != -1) {
    dispatch_once(&_sauiBlurInputRadiusKeyPath_onceToken, block);
  }
  v1 = (void *)_sauiBlurInputRadiusKeyPath___sauiBlurInputRadiusKeyPath;
  return v1;
}

- (void)_configureBlurFilterIfNecessary
{
  if (([a1 isSauiBlurConfigured] & 1) == 0)
  {
    id v9 = [a1 layer];
    id v2 = objc_alloc(MEMORY[0x263F157C8]);
    v3 = (void *)[v2 initWithType:*MEMORY[0x263F15BC8]];
    v4 = [v9 filters];
    v5 = (void *)[v4 mutableCopy];
    v6 = v5;
    if (v5) {
      id v7 = v5;
    }
    else {
      id v7 = objc_alloc_init(MEMORY[0x263EFF980]);
    }
    v8 = v7;

    [v8 addObject:v3];
    [v9 setFilters:v8];
  }
}

- (double)sauiBlurRadius
{
  double v2 = 0.0;
  if ([a1 isSauiBlurConfigured])
  {
    v3 = [a1 layer];
    v4 = [(id)objc_opt_class() _sauiBlurInputRadiusKeyPath];
    v5 = [v3 valueForKeyPath:v4];
    [v5 floatValue];
    double v2 = v6;
  }
  return v2;
}

- (void)setSauiBlurRadius:()SystemApertureUIAdditions
{
  if (a2 > 0.0) {
    [a1 _configureBlurFilterIfNecessary];
  }
  if ([a1 isSauiBlurConfigured])
  {
    id v6 = [a1 layer];
    v4 = [NSNumber numberWithDouble:a2];
    v5 = [(id)objc_opt_class() _sauiBlurInputRadiusKeyPath];
    [v6 setValue:v4 forKeyPath:v5];
  }
}

- (BOOL)isSauiBlurConfigured
{
  v1 = [a1 layer];
  double v2 = [(id)objc_opt_class() _sauiBlurKeyPath];
  v3 = [v1 valueForKeyPath:v2];
  BOOL v4 = v3 != 0;

  return v4;
}

@end