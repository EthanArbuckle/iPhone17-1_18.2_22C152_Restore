@interface FBSScene(RenderingEnvironment)
- (uint64_t)renderingEnvironment;
@end

@implementation FBSScene(RenderingEnvironment)

- (uint64_t)renderingEnvironment
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [a1 componentForExtension:v2 ofClass:v3];
}

@end