@interface SBUIPowerDownViewControllerFactory
+ (id)newPowerDownViewController;
@end

@implementation SBUIPowerDownViewControllerFactory

+ (id)newPowerDownViewController
{
  return objc_alloc_init(SBUIPowerDownViewController);
}

@end