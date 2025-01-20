@interface PASNotificationTracker
@end

@implementation PASNotificationTracker

void __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  v5 = [v4 group];
  v6 = [v4 queue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke_2;
  block[3] = &unk_1E5AEA588;
  id v9 = v4;
  id v10 = *(id *)(a1 + 40);
  id v11 = *(id *)(a1 + 32);
  id v7 = v4;
  dispatch_group_async(v5, v6, block);
}

void __70___PASNotificationTracker_issueNotificationAsyncWithContext_callback___block_invoke_2(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1A62450A0]();
  unsigned __int8 v3 = atomic_load((unsigned __int8 *)(*(void *)(a1 + 32) + 8));
  if ((v3 & 1) == 0)
  {
    id v4 = [*(id *)(a1 + 32) handler];
    v4[2](v4, *(void *)(a1 + 40));
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

@end