@interface ShareSheetIsInCallService
@end

@implementation ShareSheetIsInCallService

void ___ShareSheetIsInCallService_block_invoke()
{
  v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"InCallService"];
  _ShareSheetIsInCallService_IsInCallService = (char)v0;
}

@end