@interface ShareSheetDeviceScreenScale
@end

@implementation ShareSheetDeviceScreenScale

void ___ShareSheetDeviceScreenScale_block_invoke()
{
  v0 = [MEMORY[0x1E4FB16C8] currentDevice];
  uint64_t v1 = [v0 userInterfaceIdiom];

  if (v1 == 6)
  {
    _ShareSheetDeviceScreenScale_scale = 0x3FF0000000000000;
  }
  else
  {
    id v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v3 scale];
    _ShareSheetDeviceScreenScale_scale = v2;
  }
}

@end