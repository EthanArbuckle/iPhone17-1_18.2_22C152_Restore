@interface _UIGradientView
+ (Class)layerClass;
@end

@implementation _UIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end