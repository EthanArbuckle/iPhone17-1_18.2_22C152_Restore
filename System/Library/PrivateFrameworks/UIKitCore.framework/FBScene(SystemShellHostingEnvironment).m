@interface FBScene(SystemShellHostingEnvironment)
- (uint64_t)systemShellHostingEnvironment;
@end

@implementation FBScene(SystemShellHostingEnvironment)

- (uint64_t)systemShellHostingEnvironment
{
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  return [a1 componentForExtension:v2 ofClass:v3];
}

@end