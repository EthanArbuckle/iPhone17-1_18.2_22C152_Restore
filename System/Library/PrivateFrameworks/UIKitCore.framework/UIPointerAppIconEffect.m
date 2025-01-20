@interface UIPointerAppIconEffect
- (BOOL)useSoftShadow;
- (id)overrideSlipPoints;
- (id)settings;
@end

@implementation UIPointerAppIconEffect

- (id)settings
{
  v2 = +[_UIPointerSettingsDomain rootSettings];
  v3 = [v2 SBAppIconEffectSettings];

  return v3;
}

- (id)overrideSlipPoints
{
  v3 = (void *)MEMORY[0x1E4F29238];
  v4 = [(UIPointerAppIconEffect *)self settings];
  [v4 overrideSlipPoints];
  double v6 = v5;
  v7 = [(UIPointerAppIconEffect *)self settings];
  [v7 overrideSlipPoints];
  v9 = objc_msgSend(v3, "valueWithCGPoint:", v6, v8);

  return v9;
}

- (BOOL)useSoftShadow
{
  return 0;
}

@end