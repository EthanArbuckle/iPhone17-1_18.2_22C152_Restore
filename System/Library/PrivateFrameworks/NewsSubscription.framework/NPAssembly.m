@interface NPAssembly
- (NPAssembly)init;
@end

@implementation NPAssembly

- (NPAssembly)init
{
  return (NPAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
}

@end