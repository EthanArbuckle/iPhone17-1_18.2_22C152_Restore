@interface SIOpenIndexFilesWithState
@end

@implementation SIOpenIndexFilesWithState

void ___SIOpenIndexFilesWithState_block_invoke(uint64_t a1, const void *a2)
{
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_845(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 0, 1);
}

void ___SIOpenIndexFilesWithState_block_invoke_2(uint64_t a1, const void *a2)
{
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_856(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 0, 1);
}

void ___SIOpenIndexFilesWithState_block_invoke_2_858(uint64_t a1, const void *a2)
{
}

void ___SIOpenIndexFilesWithState_block_invoke_861(uint64_t a1, const void *a2)
{
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_2_863(uint64_t a1, uint64_t a2)
{
  return _si_next_index_id(*(os_unfair_lock_s **)(a1 + 32), a2, 0, 1);
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_3(uint64_t a1)
{
  return si_set_obj_state(*(os_unfair_lock_s **)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_6(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = 100;
  return 1;
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_7(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = 99;
  return 1;
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_4(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = 100;
  return 1;
}

uint64_t ___SIOpenIndexFilesWithState_block_invoke_5(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 4) = 99;
  return 1;
}

@end