@interface ContentIndex
@end

@implementation ContentIndex

uint64_t __ContentIndex_catch_mach_exception_raise_identity_protected_block_invoke(uint64_t result, int a2)
{
  uint64_t v2 = *(void *)(result + 32);
  if (a2)
  {
    v3 = *(uint64_t (**)(uint64_t))(v2 + 256);
    if (!v3) {
      return result;
    }
  }
  else
  {
    if (!*(void *)(v2 + 264)) {
      return result;
    }
    uint64_t v4 = result;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    uint64_t v2 = *(void *)(v4 + 32);
    *(CFAbsoluteTime *)(v2 + 192) = Current;
    v3 = *(uint64_t (**)(uint64_t))(v2 + 264);
  }
  uint64_t v6 = *(void *)(v2 + 288);
  return v3(v6);
}

@end