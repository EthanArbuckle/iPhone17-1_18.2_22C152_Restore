@interface SXVideoPlayerAdSlotVisibilityMonitor
- (SVKeyValueObserver)observer;
- (SXVideoPlayerAdSlotVisibilityMonitor)initWithVideoPlayerViewController:(id)a3 videoAdSlotVisiblePercentageProvider:(id)a4;
@end

@implementation SXVideoPlayerAdSlotVisibilityMonitor

- (SXVideoPlayerAdSlotVisibilityMonitor)initWithVideoPlayerViewController:(id)a3 videoAdSlotVisiblePercentageProvider:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SXVideoPlayerAdSlotVisibilityMonitor;
  v8 = [(SXVisibilityMonitor *)&v16 initWithObject:v6 visiblePercentageProvider:v7];
  if (v8)
  {
    objc_initWeak(&location, v8);
    id v9 = objc_alloc(MEMORY[0x263F6C698]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __111__SXVideoPlayerAdSlotVisibilityMonitor_initWithVideoPlayerViewController_videoAdSlotVisiblePercentageProvider___block_invoke;
    v13[3] = &unk_264652868;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [v9 initWithKeyPath:@"mode" ofObject:v6 withOptions:1 change:v13];
    observer = v8->_observer;
    v8->_observer = (SVKeyValueObserver *)v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return v8;
}

void __111__SXVideoPlayerAdSlotVisibilityMonitor_initWithVideoPlayerViewController_videoAdSlotVisiblePercentageProvider___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateVisibility];
}

- (SVKeyValueObserver)observer
{
  return self->_observer;
}

- (void).cxx_destruct
{
}

@end