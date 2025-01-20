@interface FBSScene(SBContinuityHostProxyClientComponent)
- (uint64_t)continuityHostProxyClientComponent;
@end

@implementation FBSScene(SBContinuityHostProxyClientComponent)

- (uint64_t)continuityHostProxyClientComponent
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [a1 componentForExtension:v2 ofClass:v3];
}

@end