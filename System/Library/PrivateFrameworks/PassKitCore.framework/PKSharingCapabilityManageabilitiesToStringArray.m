@interface PKSharingCapabilityManageabilitiesToStringArray
@end

@implementation PKSharingCapabilityManageabilitiesToStringArray

__CFString *__PKSharingCapabilityManageabilitiesToStringArray_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 unsignedIntegerValue];
  if ((unint64_t)(v2 + 1) > 3) {
    return @"none";
  }
  else {
    return off_1E56E56A0[v2 + 1];
  }
}

@end