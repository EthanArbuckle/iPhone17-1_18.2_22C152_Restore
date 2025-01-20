@interface BPAssembly
- (BPAssembly)init;
@end

@implementation BPAssembly

- (BPAssembly)init
{
  return (BPAssembly *)FrameworkAssembly.init()();
}

- (void).cxx_destruct
{
}

@end