@interface NMAssembly
- (NMAssembly)init;
@end

@implementation NMAssembly

- (NMAssembly)init
{
  return (NMAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
}

@end