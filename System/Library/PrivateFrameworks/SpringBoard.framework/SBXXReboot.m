@interface SBXXReboot
@end

@implementation SBXXReboot

void ___SBXXReboot_block_invoke()
{
  id v3 = [(id)SBApp restartManager];
  v0 = NSString;
  v1 = FBSProcessPrettyDescription();
  v2 = [v0 stringWithFormat:@"Request from process = %@", v1];
  [v3 rebootForReason:v2];
}

@end