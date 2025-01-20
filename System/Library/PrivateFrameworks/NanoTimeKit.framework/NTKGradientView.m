@interface NTKGradientView
+ (Class)layerClass;
@end

@implementation NTKGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end