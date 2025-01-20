@interface ShareSheetIsSafari
@end

@implementation ShareSheetIsSafari

void ___ShareSheetIsSafari_block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F80] processInfo];
  v1 = [(id)v0 processName];

  LOBYTE(v0) = [v1 isEqualToString:@"MobileSafari"];
  if (v0)
  {
    char v2 = 1;
  }
  else
  {
    v3 = [MEMORY[0x1E4F28F80] processInfo];
    v4 = [v3 processName];

    char v2 = [v4 isEqualToString:@"SafariViewService"];
  }
  _ShareSheetIsSafari_isSafari = v2;
}

@end