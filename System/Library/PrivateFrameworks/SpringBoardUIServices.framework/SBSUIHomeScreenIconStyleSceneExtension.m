@interface SBSUIHomeScreenIconStyleSceneExtension
+ (id)clientComponents;
+ (id)clientSettingsExtensions;
+ (id)hostComponents;
+ (id)settingsExtensions;
+ (id)transitionContextExtensions;
@end

@implementation SBSUIHomeScreenIconStyleSceneExtension

+ (id)settingsExtensions
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = [MEMORY[0x1E4F62AE8] extensionForProtocol:&unk_1EFD5AC00];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

+ (id)clientSettingsExtensions
{
  return 0;
}

+ (id)transitionContextExtensions
{
  return 0;
}

+ (id)hostComponents
{
  return 0;
}

+ (id)clientComponents
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v2 = self;
  v5[0] = v2;
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];

  return v3;
}

@end