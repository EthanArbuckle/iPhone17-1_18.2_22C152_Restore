@interface SBHIconImageTransformView
+ (Class)layerClass;
@end

@implementation SBHIconImageTransformView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end