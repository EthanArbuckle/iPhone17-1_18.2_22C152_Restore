@interface SUUIShapeView
+ (Class)layerClass;
@end

@implementation SUUIShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end