@interface SBUIContinuitySessionParticipantSceneExtension
+ (id)clientComponents;
+ (id)clientSettingsExtensions;
+ (id)hostComponents;
+ (id)settingsExtensions;
+ (id)transitionContextExtensions;
@end

@implementation SBUIContinuitySessionParticipantSceneExtension

+ (id)settingsExtensions
{
  return 0;
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
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = objc_opt_class();
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  return v2;
}

@end