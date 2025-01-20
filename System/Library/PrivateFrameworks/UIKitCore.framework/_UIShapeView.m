@interface _UIShapeView
+ (Class)layerClass;
@end

@implementation _UIShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end