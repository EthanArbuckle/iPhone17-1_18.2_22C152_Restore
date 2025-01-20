@interface SIOpenIndex
@end

@implementation SIOpenIndex

void ___SIOpenIndex_block_invoke(uint64_t a1, const void *a2)
{
}

uint64_t ___SIOpenIndex_block_invoke_803(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 6576) |= 0x1000u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 6576) |= 0x800u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_3(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 6576) |= 0x40u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_4(uint64_t result)
{
  *(_DWORD *)(*(void *)(result + 32) + 6576) |= 0x100u;
  return result;
}

uint64_t ___SIOpenIndex_block_invoke_821(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 0, 1);
}

@end