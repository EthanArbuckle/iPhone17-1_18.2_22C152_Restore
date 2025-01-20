@interface NSManagedObjectContext
@end

@implementation NSManagedObjectContext

void __74__NSManagedObjectContext_IC__ic_performBlock_andPerformBlockOnMainThread___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(void **)(a1 + 40);
  v3 = MEMORY[0x263EF83A0];
  dispatch_async(v3, v2);
}

uint64_t __88__NSManagedObjectContext_IC__ic_performBlockAndWait_andPerformBlockAndWaitOnMainThread___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

@end