@interface ShareSheetIsMusic
@end

@implementation ShareSheetIsMusic

void ___ShareSheetIsMusic_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"Music"];
  _ShareSheetIsMusic_IsMusic = (char)v0;
}

@end