@interface TUAssembly
- (TUAssembly)init;
@end

@implementation TUAssembly

- (TUAssembly)init
{
  return (TUAssembly *)FrameworkAssembly.init()();
}

- (void).cxx_destruct
{
}

@end