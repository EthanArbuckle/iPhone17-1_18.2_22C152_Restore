@interface NEAssembly
- (NEAssembly)init;
@end

@implementation NEAssembly

- (NEAssembly)init
{
  return (NEAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
}

@end