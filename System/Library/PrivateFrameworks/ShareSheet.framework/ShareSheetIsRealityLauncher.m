@interface ShareSheetIsRealityLauncher
@end

@implementation ShareSheetIsRealityLauncher

void ___ShareSheetIsRealityLauncher_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"RealityLauncher"];
  _ShareSheetIsRealityLauncher_isRealityLauncher = (char)v0;
}

@end