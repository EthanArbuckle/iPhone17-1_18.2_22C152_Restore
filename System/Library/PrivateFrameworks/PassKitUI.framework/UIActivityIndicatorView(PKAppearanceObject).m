@interface UIActivityIndicatorView(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UIActivityIndicatorView(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = [a3 textColor];
  [a1 setColor:v4];
}

@end