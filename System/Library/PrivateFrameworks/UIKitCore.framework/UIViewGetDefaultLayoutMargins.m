@interface UIViewGetDefaultLayoutMargins
@end

@implementation UIViewGetDefaultLayoutMargins

uint64_t ___UIViewGetDefaultLayoutMargins_block_invoke()
{
  uint64_t result = dyld_program_sdk_at_least();
  if ((result & 1) == 0)
  {
    _MergedGlobals_321 = 0x4020000000000000;
    unk_1E8FB0030 = 0x4020000000000000;
    qword_1E8FB0038 = 0x4020000000000000;
    unk_1E8FB0040 = 0x4020000000000000;
  }
  return result;
}

@end