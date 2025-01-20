@interface SBExternalDisplayApplicationSceneEntity
- (Class)viewControllerClass;
@end

@implementation SBExternalDisplayApplicationSceneEntity

- (Class)viewControllerClass
{
  return (Class)objc_opt_class();
}

@end