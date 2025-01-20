@interface SFDeviceSupportsDesktopSitesByDefault
@end

@implementation SFDeviceSupportsDesktopSitesByDefault

uint64_t ___SFDeviceSupportsDesktopSitesByDefault_block_invoke()
{
  uint64_t result = _SFDeviceIsPad();
  if (result)
  {
    uint64_t result = MGGetSInt32Answer();
    BOOL v2 = result != 28 && (result & 0xFFFFFFFE) != 6;
    _SFDeviceSupportsDesktopSitesByDefault::supportsDesktopSites = v2;
  }
  return result;
}

@end