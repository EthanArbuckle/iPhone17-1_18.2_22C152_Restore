@interface PPTState
@end

@implementation PPTState

void __31___PPTState_leaveDispatchGroup__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(int *)(v1 + 24) >= 1)
  {
    dispatch_group_leave(*(dispatch_group_t *)(v1 + 16));
    --*(_DWORD *)(*(void *)(a1 + 32) + 24);
  }
}

void __31___PPTState_enterDispatchGroup__block_invoke(uint64_t a1)
{
}

@end