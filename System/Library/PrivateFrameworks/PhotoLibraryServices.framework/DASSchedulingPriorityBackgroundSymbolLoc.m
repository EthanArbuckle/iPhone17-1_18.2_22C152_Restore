@interface DASSchedulingPriorityBackgroundSymbolLoc
@end

@implementation DASSchedulingPriorityBackgroundSymbolLoc

void *__get_DASSchedulingPriorityBackgroundSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = DuetActivitySchedulerLibrary();
  result = dlsym(v2, "_DASSchedulingPriorityBackground");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  get_DASSchedulingPriorityBackgroundSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

@end