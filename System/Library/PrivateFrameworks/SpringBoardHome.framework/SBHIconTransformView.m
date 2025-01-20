@interface SBHIconTransformView
+ (Class)contentContainerViewClass;
+ (Class)layerClass;
@end

@implementation SBHIconTransformView

+ (Class)contentContainerViewClass
{
  return (Class)self;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end