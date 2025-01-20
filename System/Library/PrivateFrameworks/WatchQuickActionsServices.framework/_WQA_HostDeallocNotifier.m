@interface _WQA_HostDeallocNotifier
- (WatchQuickActionHostObserver)hostObserver;
- (void)dealloc;
- (void)setHostObserver:(id)a3;
@end

@implementation _WQA_HostDeallocNotifier

- (void)dealloc
{
  v3 = [(_WQA_HostDeallocNotifier *)self hostObserver];
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __35___WQA_HostDeallocNotifier_dealloc__block_invoke;
    block[3] = &unk_264DB7FC0;
    id v7 = v3;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  v5.receiver = self;
  v5.super_class = (Class)_WQA_HostDeallocNotifier;
  [(_WQA_HostDeallocNotifier *)&v5 dealloc];
}

- (WatchQuickActionHostObserver)hostObserver
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostObserver);

  return (WatchQuickActionHostObserver *)WeakRetained;
}

- (void)setHostObserver:(id)a3
{
}

- (void).cxx_destruct
{
}

@end