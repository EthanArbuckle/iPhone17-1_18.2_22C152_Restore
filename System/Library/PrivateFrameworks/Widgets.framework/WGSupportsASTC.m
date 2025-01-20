@interface WGSupportsASTC
@end

@implementation WGSupportsASTC

uint64_t ___WGSupportsASTC_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  _WGSupportsASTC___supportsASTC = result;
  return result;
}

@end