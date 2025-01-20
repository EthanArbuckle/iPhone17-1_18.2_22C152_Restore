@interface PASLazyPurgeableResult
@end

@implementation PASLazyPurgeableResult

void __49___PASLazyPurgeableResult__createDispatchSources__block_invoke_2(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (pthread_mutex_t *)(WeakRetained + 16);
    v7 = WeakRetained;
    pthread_mutex_lock((pthread_mutex_t *)(WeakRetained + 16));
    v3 = (void *)*((void *)v7 + 1);
    *((void *)v7 + 1) = 0;

    dispatch_source_cancel(*((dispatch_source_t *)v7 + 12));
    v4 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = 0;

    v5 = *((void *)v7 + 13);
    if (v5)
    {
      dispatch_source_cancel(v5);
      v6 = (void *)*((void *)v7 + 13);
      *((void *)v7 + 13) = 0;
    }
    pthread_mutex_unlock(v2);
    WeakRetained = v7;
  }
}

void __49___PASLazyPurgeableResult__createDispatchSources__block_invoke()
{
  v0 = (void *)MEMORY[0x1A62450A0]();
  uint64_t v1 = +[_PASDispatch autoreleasingSerialQueueWithLabel:"_PASLazyPurgeableResult-dispatch-sources" qosClass:17];
  v2 = (void *)_createDispatchSources__pasExprOnceResult;
  _createDispatchSources__pasExprOnceResult = v1;
}

@end