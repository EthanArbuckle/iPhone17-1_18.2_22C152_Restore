@interface SAUIPluginSnippet(SiriVOX)
- (BOOL)svx_isResponseViewIdPresent;
@end

@implementation SAUIPluginSnippet(SiriVOX)

- (BOOL)svx_isResponseViewIdPresent
{
  v1 = [a1 responseViewId];
  BOOL v2 = v1 != 0;

  return v2;
}

@end