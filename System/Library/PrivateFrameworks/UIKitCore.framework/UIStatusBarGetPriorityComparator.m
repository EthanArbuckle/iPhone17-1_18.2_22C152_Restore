@interface UIStatusBarGetPriorityComparator
@end

@implementation UIStatusBarGetPriorityComparator

void ___UIStatusBarGetPriorityComparator_block_invoke()
{
  v0 = (void *)_UIStatusBarGetPriorityComparator_priorityComparator;
  _UIStatusBarGetPriorityComparator_priorityComparator = (uint64_t)&__block_literal_global_3_7;
}

uint64_t ___UIStatusBarGetPriorityComparator_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  uint64_t v6 = [v4 priority];
  if (v6 <= [v5 priority])
  {
    uint64_t v8 = [v4 priority];
    uint64_t v7 = v8 < [v5 priority];
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

@end