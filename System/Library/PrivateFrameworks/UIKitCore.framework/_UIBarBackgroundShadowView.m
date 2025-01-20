@interface _UIBarBackgroundShadowView
+ (Class)_contentViewClass;
@end

@implementation _UIBarBackgroundShadowView

+ (Class)_contentViewClass
{
  return (Class)objc_opt_class();
}

@end