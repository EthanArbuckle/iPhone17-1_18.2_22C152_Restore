@interface _UIFlippingView
+ (Class)layerClass;
@end

@implementation _UIFlippingView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end