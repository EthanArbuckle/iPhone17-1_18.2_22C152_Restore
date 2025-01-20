@interface IMGradientView
+ (Class)layerClass;
@end

@implementation IMGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end