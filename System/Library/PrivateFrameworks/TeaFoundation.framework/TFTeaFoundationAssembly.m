@interface TFTeaFoundationAssembly
- (TFTeaFoundationAssembly)init;
@end

@implementation TFTeaFoundationAssembly

- (TFTeaFoundationAssembly)init
{
  return (TFTeaFoundationAssembly *)FrameworkAssembly.init()();
}

- (void).cxx_destruct
{
}

@end