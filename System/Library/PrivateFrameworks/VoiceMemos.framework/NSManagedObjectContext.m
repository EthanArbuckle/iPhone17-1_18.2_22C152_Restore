@interface NSManagedObjectContext
@end

@implementation NSManagedObjectContext

void __78__NSManagedObjectContext_RCExtensions__rc_performAndWaitReturningError_block___block_invoke(void *a1)
{
  uint64_t v2 = a1[4];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = (*(uint64_t (**)(void))(v2 + 16))();
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

@end