@interface ShareSheetIsTV
@end

@implementation ShareSheetIsTV

void ___ShareSheetIsTV_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"AppleTV"];
  _ShareSheetIsTV_IsTV = (char)v0;
}

@end