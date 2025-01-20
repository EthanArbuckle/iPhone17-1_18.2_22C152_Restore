@interface VUIAppDocumentUpdateEventObserverContext
@end

@implementation VUIAppDocumentUpdateEventObserverContext

void __89___VUIAppDocumentUpdateEventObserverContext__refreshTimerWithRefreshTimeEventDescriptor___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v6 = WeakRetained;
    v3 = [WeakRetained refreshTimerByEventDescriptor];
    [v3 removeObjectForKey:*(void *)(a1 + 32)];

    v4 = [v6 refreshTimerFiredBlock];
    if (v4)
    {
      v5 = [[VUIAppDocumentRefreshEvent alloc] initWithRefreshEventDescriptor:*(void *)(a1 + 32)];
      ((void (**)(void, VUIAppDocumentRefreshEvent *))v4)[2](v4, v5);
    }
    id WeakRetained = v6;
  }
}

@end