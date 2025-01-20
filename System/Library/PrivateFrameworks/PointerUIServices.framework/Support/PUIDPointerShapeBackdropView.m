@interface PUIDPointerShapeBackdropView
+ (Class)layerClass;
@end

@implementation PUIDPointerShapeBackdropView

+ (Class)layerClass
{
  return (Class)_objc_opt_self(CABackdropLayer, a2);
}

@end