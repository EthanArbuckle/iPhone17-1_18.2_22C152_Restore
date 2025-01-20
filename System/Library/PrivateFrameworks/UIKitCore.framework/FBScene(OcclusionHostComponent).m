@interface FBScene(OcclusionHostComponent)
- (uint64_t)_occlusionHostComponent;
@end

@implementation FBScene(OcclusionHostComponent)

- (uint64_t)_occlusionHostComponent
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [a1 componentForExtension:v2 ofClass:v3];
}

@end