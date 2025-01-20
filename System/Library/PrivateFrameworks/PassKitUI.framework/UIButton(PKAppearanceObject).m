@interface UIButton(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UIButton(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = a3;
  v5 = [v4 buttonTextColor];
  [a1 setTitleColor:v5 forState:0];

  v6 = [v4 buttonDisabledTextColor];
  [a1 setTitleColor:v6 forState:2];

  id v7 = [v4 buttonBackgroundColor];

  [a1 setBackgroundColor:v7];
}

@end