@interface SUUIGradientView
+ (Class)layerClass;
@end

@implementation SUUIGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end