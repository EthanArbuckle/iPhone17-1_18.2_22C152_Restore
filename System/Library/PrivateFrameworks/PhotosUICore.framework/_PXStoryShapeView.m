@interface _PXStoryShapeView
+ (Class)layerClass;
@end

@implementation _PXStoryShapeView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end