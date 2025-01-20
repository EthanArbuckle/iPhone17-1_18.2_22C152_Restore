@interface UIView(PKAppearanceObject)
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UIView(PKAppearanceObject)

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = a3;
  v5 = [v4 backgroundColor];
  [a1 setBackgroundColor:v5];

  id v6 = [v4 tintColor];

  [a1 setTintColor:v6];
}

@end