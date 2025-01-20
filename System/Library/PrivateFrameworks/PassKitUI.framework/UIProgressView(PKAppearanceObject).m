@interface UIProgressView(PKAppearanceObject)
- (uint64_t)pk_childrenForAppearance;
- (void)pk_applyAppearance:()PKAppearanceObject;
@end

@implementation UIProgressView(PKAppearanceObject)

- (uint64_t)pk_childrenForAppearance
{
  return MEMORY[0x1E4F1CBF0];
}

- (void)pk_applyAppearance:()PKAppearanceObject
{
  id v4 = a3;
  v5 = [v4 tintColor];
  [a1 setTintColor:v5];

  [a1 tintColorDidChange];
  v6 = [v4 progressBarTintColor];
  [a1 setProgressTintColor:v6];

  id v7 = [v4 progressBarTrackTintColor];

  [a1 setTrackTintColor:v7];
}

@end