@interface NAAssembly
- (NAAssembly)init;
@end

@implementation NAAssembly

- (NAAssembly)init
{
  return (NAAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
}

@end