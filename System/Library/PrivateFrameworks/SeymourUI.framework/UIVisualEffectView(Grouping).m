@interface UIVisualEffectView(Grouping)
- (void)initWithBackgroundEffects:()Grouping;
@end

@implementation UIVisualEffectView(Grouping)

- (void)initWithBackgroundEffects:()Grouping
{
  id v4 = a3;
  v5 = (void *)[a1 initWithEffect:0];
  v6 = v5;
  if (v5) {
    [v5 setBackgroundEffects:v4];
  }

  return v6;
}

@end