@interface UIToolbar(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UIToolbar(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = a3;
  v5 = [v4 tintColor];
  [a1 setTintColor:v5];

  v6 = [v4 navBarPointImage];
  [a1 setBackgroundImage:v6 forToolbarPosition:0 barMetrics:0];

  id v7 = [v4 navBarShadowPointImage];

  [a1 setShadowImage:v7 forToolbarPosition:0];
}

@end