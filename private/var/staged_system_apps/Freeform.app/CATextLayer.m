@interface CATextLayer
+ (Class)crl_renderableClass;
@end

@implementation CATextLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end