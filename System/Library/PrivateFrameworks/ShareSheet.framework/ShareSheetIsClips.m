@interface ShareSheetIsClips
@end

@implementation ShareSheetIsClips

void ___ShareSheetIsClips_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Clips"];
  _ShareSheetIsClips_IsClips = (char)v0;
}

@end