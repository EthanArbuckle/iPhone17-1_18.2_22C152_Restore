@interface CAScrollLayer
+ (Class)crl_renderableClass;
@end

@implementation CAScrollLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end