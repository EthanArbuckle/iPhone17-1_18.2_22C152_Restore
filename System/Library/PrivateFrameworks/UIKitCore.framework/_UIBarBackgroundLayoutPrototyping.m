@interface _UIBarBackgroundLayoutPrototyping
+ (BOOL)prototypingEnabled;
+ (id)prototypingLayoutForBarType:(int64_t)a3;
+ (void)registerPrototypingCallback:(id)a3;
- (BOOL)bg1HasShadow;
- (BOOL)shouldUseExplicitGeometry;
- (id)bg1Color;
- (id)bg1Effects;
- (id)bg1ShadowColor;
- (void)describeInto:(id)a3;
@end

@implementation _UIBarBackgroundLayoutPrototyping

+ (void)registerPrototypingCallback:(id)a3
{
  id v3 = a3;
  uint64_t v4 = helper;
  aBlock = v3;
  if (!helper)
  {
    uint64_t v5 = objc_opt_new();
    v6 = (void *)helper;
    helper = v5;

    uint64_t v7 = objc_opt_new();
    v8 = *(void **)(helper + 8);
    *(void *)(helper + 8) = v7;

    v9 = +[_UIBarSettingsDomain rootSettings];
    [v9 addKeyObserver:helper];

    id v3 = aBlock;
    uint64_t v4 = helper;
  }
  v10 = *(void **)(v4 + 8);
  v11 = _Block_copy(v3);
  [v10 addObject:v11];
}

+ (BOOL)prototypingEnabled
{
  v2 = +[_UIBarSettingsDomain rootSettings];
  BOOL v3 = [v2 backgroundMode] != 0;

  return v3;
}

+ (id)prototypingLayoutForBarType:(int64_t)a3
{
  uint64_t v4 = prototypingLayoutForBarType__layouts[a3];
  if (!v4)
  {
    uint64_t v5 = objc_opt_new();
    id v6 = prototypingLayoutForBarType__layouts[a3];
    prototypingLayoutForBarType__layouts[a3] = v5;

    uint64_t v4 = v5;
    switch(a3)
    {
      case 1:
        double v7 = 1.0;
        break;
      case 2:
        double v7 = 0.0;
        double v8 = 1.0;
        double v9 = 1.0;
        goto LABEL_9;
      case 3:
        double v7 = 0.0;
        break;
      default:
        uint64_t v10 = +[UIColor colorWithWhite:1.0 alpha:0.25];
        goto LABEL_11;
    }
    double v8 = 1.0;
    double v9 = 0.0;
LABEL_9:
    uint64_t v10 = +[UIColor colorWithRed:v7 green:v8 blue:v9 alpha:0.25];
LABEL_11:
    v11 = (void *)v4[11];
    v4[11] = v10;
  }
  return v4;
}

- (BOOL)shouldUseExplicitGeometry
{
  return 0;
}

- (id)bg1Effects
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v2 = +[_UIBarSettingsDomain rootSettings];
  if ([v2 backgroundMode] == 2)
  {
    BOOL v3 = +[UIBlurEffect _effectWithBlurRadius:10.0 scale:1.0];
    v6[0] = v3;
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    uint64_t v4 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v4;
}

- (id)bg1Color
{
  BOOL v3 = +[_UIBarSettingsDomain rootSettings];
  if ([v3 colorByBarType]) {
    colorWash = self->_colorWash;
  }
  else {
    colorWash = 0;
  }
  uint64_t v5 = colorWash;

  return v5;
}

- (BOOL)bg1HasShadow
{
  v2 = +[_UIBarSettingsDomain rootSettings];
  char v3 = [v2 retainShadow];

  return v3;
}

- (id)bg1ShadowColor
{
  v2 = +[_UIBarBackgroundAppearanceData standardBackgroundData];
  char v3 = [v2 shadowColor];

  return v3;
}

- (void)describeInto:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIBarBackgroundLayoutPrototyping;
  id v4 = a3;
  [(_UIBarBackgroundLayout *)&v5 describeInto:v4];
  [v4 appendFormat:@" colorWash=%@", self->_colorWash];
}

- (void).cxx_destruct
{
}

@end