@interface NSNotificationCenter
@end

@implementation NSNotificationCenter

void __95__NSNotificationCenter_SafariCoreExtras__safari_addObserverForUserDefaultKey_queue_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = a2;
  id v6 = [v4 userInfo];
  v5 = [v6 objectForKeyedSubscript:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id, void *))(v3 + 16))(v3, v4, v5);
}

@end