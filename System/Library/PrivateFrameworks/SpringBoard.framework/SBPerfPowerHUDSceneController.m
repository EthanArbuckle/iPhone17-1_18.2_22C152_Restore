@interface SBPerfPowerHUDSceneController
+ (id)_setupInfo;
@end

@implementation SBPerfPowerHUDSceneController

+ (id)_setupInfo
{
  v6[6] = *MEMORY[0x1E4F143B8];
  v5[0] = @"class";
  v6[0] = objc_opt_class();
  v6[1] = MEMORY[0x1E4F1CC38];
  v5[1] = @"enabled";
  v5[2] = @"jobLabel";
  v6[2] = @"com.apple.PerfPowerHUD";
  v6[3] = @"SBTraitsParticipantRolePerfPowerHUD";
  v5[3] = @"traitsRole";
  v5[4] = @"hostLevel";
  v2 = [NSNumber numberWithDouble:*MEMORY[0x1E4F43F20] + 5.0 + -1.0];
  v5[5] = @"workspaceID";
  v6[4] = v2;
  v6[5] = @"com.apple.SpringBoard.SceneWorkspace.PerfPowerHUD";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:v5 count:6];

  return v3;
}

@end