@interface AXSProcessIsSpringBoard
@end

@implementation AXSProcessIsSpringBoard

uint64_t ___AXSProcessIsSpringBoard_block_invoke()
{
  if (cachedAppID_onceToken != -1) {
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_2513);
  }
  uint64_t result = [(id)cachedAppID_CachedAppID isEqualToString:@"com.apple.springboard"];
  if (result) {
    _AXSProcessIsSpringBoard__AXSProcessIsSpringBoard = 1;
  }
  return result;
}

@end