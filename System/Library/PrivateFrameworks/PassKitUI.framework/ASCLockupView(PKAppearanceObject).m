@interface ASCLockupView(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation ASCLockupView(PKAppearanceObject)

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = a3;
  v5 = [v4 foregroundColor];
  [a1 setBackgroundColor:v5];

  id v6 = [v4 tintColor];

  [a1 setTintColor:v6];
}

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

@end