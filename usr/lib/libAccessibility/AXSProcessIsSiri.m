@interface AXSProcessIsSiri
@end

@implementation AXSProcessIsSiri

uint64_t ___AXSProcessIsSiri_block_invoke()
{
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  uint64_t result = [(id)cachedAppID_CachedAppID isEqualToString:@"com.apple.siri"];
  if (result) {
    _AXSProcessIsSiri__AXSProcessIsSiri = 1;
  }
  return result;
}

@end