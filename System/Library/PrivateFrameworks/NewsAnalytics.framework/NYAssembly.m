@interface NYAssembly
- (NYAssembly)init;
@end

@implementation NYAssembly

- (NYAssembly)init
{
  return (NYAssembly *)Assembly.init()();
}

- (void).cxx_destruct
{
}

@end