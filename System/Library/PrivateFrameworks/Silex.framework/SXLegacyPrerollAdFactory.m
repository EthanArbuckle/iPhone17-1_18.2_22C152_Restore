@interface SXLegacyPrerollAdFactory
- (SXLegacyPrerollAdFactory)initWithViewport:(id)a3 scrollObserverManager:(id)a4;
- (SXScrollObserverManager)scrollObserverManager;
- (SXViewport)viewport;
- (id)createVideoAdProviderForComponentView:(id)a3 videoPlayerViewController:(id)a4 analyticsReporter:(id)a5;
@end

@implementation SXLegacyPrerollAdFactory

- (SXLegacyPrerollAdFactory)initWithViewport:(id)a3 scrollObserverManager:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SXLegacyPrerollAdFactory;
  v9 = [(SXLegacyPrerollAdFactory *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_viewport, a3);
    objc_storeStrong((id *)&v10->_scrollObserverManager, a4);
  }

  return v10;
}

- (id)createVideoAdProviderForComponentView:(id)a3 videoPlayerViewController:(id)a4 analyticsReporter:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = [SXComponentVisiblePercentageProvider alloc];
  objc_super v12 = [(SXLegacyPrerollAdFactory *)self viewport];
  v13 = [(SXComponentVisiblePercentageProvider *)v11 initWithViewport:v12];

  v14 = [(SXVisibilityMonitor *)[SXVideoComponentVisibilityMonitor alloc] initWithObject:v10 visiblePercentageProvider:v13];
  [(SXVisibilityMonitor *)v14 updateVisibility];
  v15 = [(SXLegacyPrerollAdFactory *)self scrollObserverManager];
  [v15 addScrollObserver:v14];

  v16 = (void *)[objc_alloc(MEMORY[0x263F6C6A8]) initWithViewControllerProvider:v9];
  v17 = objc_alloc_init(SXVideoPlayerAdSlotVisiblePercentageProvider);
  v18 = [[SXVideoPlayerAdSlotVisibilityMonitor alloc] initWithVideoPlayerViewController:v9 videoAdSlotVisiblePercentageProvider:v17];

  v19 = [SXVideoAdProvider alloc];
  v20 = [v10 component];

  v21 = [(SXVideoAdProvider *)v19 initWithViewControllerProvider:v16 videoPlayerVisibilityMonitor:v14 videoVisibilityMonitor:v18 component:v20];
  [(SXVideoAdProvider *)v21 setAnalyticsReporter:v8];

  return v21;
}

- (SXViewport)viewport
{
  return self->_viewport;
}

- (SXScrollObserverManager)scrollObserverManager
{
  return self->_scrollObserverManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scrollObserverManager, 0);
  objc_storeStrong((id *)&self->_viewport, 0);
}

@end