@interface SBSecureAppPolicy
+ (BOOL)shouldAlwaysShowSecureSceneForApp:(id)a3;
@end

@implementation SBSecureAppPolicy

+ (BOOL)shouldAlwaysShowSecureSceneForApp:(id)a3
{
  uint64_t v3 = shouldAlwaysShowSecureSceneForApp__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&shouldAlwaysShowSecureSceneForApp__onceToken, &__block_literal_global_130);
  }
  v5 = (void *)shouldAlwaysShowSecureSceneForApp__bundleIDsOfAppsToShowSecureScene;
  v6 = [v4 bundleIdentifier];

  char v7 = [v5 containsObject:v6];
  return v7;
}

void __55__SBSecureAppPolicy_shouldAlwaysShowSecureSceneForApp___block_invoke()
{
  v4[7] = *MEMORY[0x1E4F143B8];
  v4[0] = @"com.apple.Maps";
  v4[1] = @"com.apple.purplebuddy";
  v0 = (void *)MEMORY[0x1E4F1CAD0];
  v4[2] = @"com.apple.VirtualDisplayTest";
  v4[3] = @"com.apple.mobilenotes";
  v4[4] = @"com.apple.VoiceMemos";
  v4[5] = @"com.apple.TVRemoteUIService";
  v4[6] = @"com.apple.ContinuityCaptureShieldUI";
  v1 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:7];
  uint64_t v2 = [v0 setWithArray:v1];
  uint64_t v3 = (void *)shouldAlwaysShowSecureSceneForApp__bundleIDsOfAppsToShowSecureScene;
  shouldAlwaysShowSecureSceneForApp__bundleIDsOfAppsToShowSecureScene = v2;
}

@end