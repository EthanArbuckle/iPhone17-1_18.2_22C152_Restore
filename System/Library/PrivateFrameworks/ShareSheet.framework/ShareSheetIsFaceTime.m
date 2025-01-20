@interface ShareSheetIsFaceTime
@end

@implementation ShareSheetIsFaceTime

void ___ShareSheetIsFaceTime_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"FaceTime"];
  _ShareSheetIsFaceTime_IsFaceTime = (char)v0;
}

@end