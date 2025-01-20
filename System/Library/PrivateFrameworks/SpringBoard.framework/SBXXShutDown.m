@interface SBXXShutDown
@end

@implementation SBXXShutDown

void ___SBXXShutDown_block_invoke()
{
  id v3 = [(id)SBApp restartManager];
  v0 = NSString;
  v1 = FBSProcessPrettyDescription();
  v2 = [v0 stringWithFormat:@"Request from process = %@", v1];
  [v3 shutdownForReason:v2];
}

@end