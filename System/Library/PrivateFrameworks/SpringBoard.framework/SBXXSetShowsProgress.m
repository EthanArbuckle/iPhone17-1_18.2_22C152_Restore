@interface SBXXSetShowsProgress
@end

@implementation SBXXSetShowsProgress

uint64_t ___SBXXSetShowsProgress_block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowsProgress:*(_DWORD *)(a1 + 40) != 0];
}

@end