@interface SKUIPlayButtonShapeView
+ (Class)layerClass;
@end

@implementation SKUIPlayButtonShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end