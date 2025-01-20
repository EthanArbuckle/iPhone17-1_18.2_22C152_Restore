@interface PNPGradientView
+ (Class)layerClass;
@end

@implementation PNPGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end