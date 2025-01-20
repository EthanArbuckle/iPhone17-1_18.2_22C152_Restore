@interface CAShapeLayer(TSDRenderableSubclassing)
+ (uint64_t)tsd_renderableClass;
@end

@implementation CAShapeLayer(TSDRenderableSubclassing)

+ (uint64_t)tsd_renderableClass
{
  return objc_opt_class();
}

@end