@interface AVPlayerLayer
+ (Class)crl_renderableClass;
@end

@implementation AVPlayerLayer

+ (Class)crl_renderableClass
{
  return (Class)objc_opt_class();
}

@end