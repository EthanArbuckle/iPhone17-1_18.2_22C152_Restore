@interface CarVisualEffectView
+ (BOOL)isDisablingBlur;
+ (void)setDisableBlur:(BOOL)a3;
- (CarVisualEffectView)initWithCoder:(id)a3;
- (CarVisualEffectView)initWithEffect:(id)a3;
@end

@implementation CarVisualEffectView

+ (BOOL)isDisablingBlur
{
  return GEOConfigGetBOOL();
}

+ (void)setDisableBlur:(BOOL)a3
{
}

- (CarVisualEffectView)initWithEffect:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarVisualEffectView;
  v3 = [(CarVisualEffectView *)&v5 initWithEffect:a3];
  if (v3) {
    -[CarVisualEffectView setAllowsBlurring:](v3, "setAllowsBlurring:", [(id)objc_opt_class() isDisablingBlur] ^ 1);
  }
  return v3;
}

- (CarVisualEffectView)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CarVisualEffectView;
  v3 = [(CarVisualEffectView *)&v5 initWithCoder:a3];
  if (v3) {
    -[CarVisualEffectView setAllowsBlurring:](v3, "setAllowsBlurring:", [(id)objc_opt_class() isDisablingBlur] ^ 1);
  }
  return v3;
}

@end