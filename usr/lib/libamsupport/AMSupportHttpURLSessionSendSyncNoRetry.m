@interface AMSupportHttpURLSessionSendSyncNoRetry
@end

@implementation AMSupportHttpURLSessionSendSyncNoRetry

intptr_t ___AMSupportHttpURLSessionSendSyncNoRetry_block_invoke(void *a1, void *a2, void *a3, void *a4)
{
  *(void *)(*(void *)(a1[5] + 8) + 40) = a2;
  *(void *)(*(void *)(a1[6] + 8) + 40) = (id)[a3 allHeaderFields];
  *(void *)(*(void *)(a1[7] + 8) + 40) = a4;
  *(_DWORD *)(*(void *)(a1[8] + 8) + 24) = [a3 statusCode];
  v7 = a1[4];

  return dispatch_semaphore_signal(v7);
}

@end