@interface SSEnableVellumExport
@end

@implementation SSEnableVellumExport

uint64_t ___SSEnableVellumExport_block_invoke()
{
  uint64_t result = _SSUserDefaultsBooleanForKeyWithNODefault(@"SSEnableVellumExport");
  if (result) {
    uint64_t result = MGGetBoolAnswer();
  }
  _SSEnableVellumExport___SSEnableVellumExport = result;
  return result;
}

@end