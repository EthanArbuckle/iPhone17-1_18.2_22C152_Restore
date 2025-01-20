@interface _UISystemShellSceneHostingEnvironmentSettings
+ (id)protocol;
+ (void)configureSetting:(id)a3;
@end

@implementation _UISystemShellSceneHostingEnvironmentSettings

+ (id)protocol
{
  return &unk_1ED701480;
}

+ (void)configureSetting:(id)a3
{
  id v3 = a3;
  if ([v3 matchesProperty:sel_systemShellHostingSpaceIdentifier])
  {
    [v3 setPropagating:1];
    [v3 setNullPreserving:1];
  }
}

@end