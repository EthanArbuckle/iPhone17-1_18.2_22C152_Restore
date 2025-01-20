@interface SBEnsembleUISceneController
+ (id)_setupInfo;
@end

@implementation SBEnsembleUISceneController

+ (id)_setupInfo
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"class";
  v6[0] = objc_opt_class();
  v5[1] = @"enabled";
  v2 = [NSNumber numberWithBool:_os_feature_enabled_impl()];
  v6[1] = v2;
  v6[2] = MEMORY[0x1E4F1CC38];
  v5[2] = @"isDaemon";
  v5[3] = @"jobLabel";
  v6[3] = @"com.apple.ensemble";
  v6[4] = @"SBTraitsParticipantRoleEnsembleUI";
  v5[4] = @"traitsRole";
  v5[5] = @"workspaceID";
  v6[5] = @"com.apple.SpringBoard.SceneWorkspace.Ensemble";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];

  return v3;
}

@end