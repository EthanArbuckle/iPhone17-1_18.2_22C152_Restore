@interface UIStatisticsBundleIdentifier
@end

@implementation UIStatisticsBundleIdentifier

uint64_t ___UIStatisticsBundleIdentifier_block_invoke()
{
  _MergedGlobals_1299 = os_variant_has_internal_diagnostics();
  uint64_t v0 = _UIMainBundleIdentifier();
  v1 = (void *)qword_1EB264D48;
  qword_1EB264D48 = v0;

  uint64_t result = [(id)qword_1EB264D48 hasPrefix:@"com.apple."];
  byte_1EB264C81 = result;
  return result;
}

@end