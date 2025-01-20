@interface UIBlurEffect
+ (id)crl_popoverVibrantBackgroundEffect;
+ (id)crl_standardVibrantBackgroundEffect;
+ (int64_t)crl_standardVibrantBackgroundStyle;
@end

@implementation UIBlurEffect

+ (int64_t)crl_standardVibrantBackgroundStyle
{
  return 9;
}

+ (id)crl_standardVibrantBackgroundEffect
{
  id v2 = [a1 crl_standardVibrantBackgroundStyle];

  return +[UIBlurEffect effectWithStyle:v2];
}

+ (id)crl_popoverVibrantBackgroundEffect
{
  id v2 = [a1 crl_popoverVibrantBackgroundStyle];

  return +[UIBlurEffect effectWithStyle:v2];
}

@end