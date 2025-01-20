@interface UINavigationBar(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UINavigationBar(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = a3;
  if ([v4 hasDarkAppearance])
  {
    [a1 setBarStyle:1];
    [a1 setTranslucent:1];
  }
  v5 = [v4 tintColor];
  [a1 setTintColor:v5];

  v6 = [v4 navBarPointImage];
  [a1 setBackgroundImage:v6 forBarMetrics:0];

  id v7 = [v4 navBarShadowPointImage];

  [a1 setShadowImage:v7];
}

@end