@interface CAShapeLayer
+ (Class)crl_renderableClass;
@end

@implementation CAShapeLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end