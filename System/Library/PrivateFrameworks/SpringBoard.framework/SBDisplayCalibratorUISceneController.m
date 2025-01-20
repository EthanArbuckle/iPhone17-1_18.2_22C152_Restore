@interface SBDisplayCalibratorUISceneController
+ (id)_setupInfo;
@end

@implementation SBDisplayCalibratorUISceneController

+ (id)_setupInfo
{
  v5[4] = *MEMORY[0x1E4F143B8];
  v4[0] = @"class";
  v5[0] = objc_opt_class();
  v5[1] = MEMORY[0x1E4F1CC38];
  v4[1] = @"enabled";
  v4[2] = @"traitsRole";
  v4[3] = @"presentationStyle";
  v5[2] = @"SBTraitsParticipantRoleSystemUIScene";
  v5[3] = &unk_1F3349398;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:v4 count:4];
  return v2;
}

@end