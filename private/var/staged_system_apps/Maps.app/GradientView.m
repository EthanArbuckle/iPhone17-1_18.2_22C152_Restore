@interface GradientView
+ (Class)layerClass;
@end

@implementation GradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end