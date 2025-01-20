@interface SBMomentsUISceneController
+ (id)_setupInfo;
@end

@implementation SBMomentsUISceneController

+ (id)_setupInfo
{
  v5[6] = *MEMORY[0x1E4F143B8];
  v5[0] = MEMORY[0x1E4F1CC38];
  v4[0] = @"enabled";
  v4[1] = @"class";
  v5[1] = objc_opt_class();
  v5[2] = @"com.apple.MomentsUIService";
  v4[2] = @"jobLabel";
  v4[3] = @"workspaceID";
  v5[3] = @"com.apple.SpringBoard.SceneWorkspace.Moments";
  v5[4] = @"SBTraitsParticipantRoleMomentsUI";
  v4[4] = @"traitsRole";
  v4[5] = @"vendingStrategy";
  v5[5] = &unk_1F3349EF0;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:6];
  return v2;
}

@end