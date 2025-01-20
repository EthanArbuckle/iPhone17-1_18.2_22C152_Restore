@interface SXVideoAdProvider
- (BOOL)hasAction;
- (SVVideoAdViewControllerProviding)fullscreenViewControllerProvider;
- (SVVideoMetadata)metadata;
- (SXAnalyticsReporting)analyticsReporter;
- (SXVideoAdProvider)initWithViewControllerProvider:(id)a3 videoPlayerVisibilityMonitor:(id)a4 videoVisibilityMonitor:(id)a5 component:(id)a6;
- (SXVideoAdStateManager)stateManager;
- (SXVideoComponent)component;
- (SXVisibilityMonitoring)videoPlayerVisibilityMonitor;
- (SXVisibilityMonitoring)videoVisibilityMonitor;
- (UIButton)privacyMarker;
- (UIView)metricsView;
- (double)impressionThreshold;
- (double)prerollReadyToPlayTimeout;
- (double)threshold;
- (id)loadWithCompletionBlock:(id)a3;
- (unint64_t)skipThreshold;
- (void)adVisibilityStateChanged;
- (void)playbackFailedWithError:(id)a3;
- (void)playbackFinished;
- (void)playbackPaused;
- (void)playbackResumed;
- (void)playbackStarted;
- (void)presentAction;
- (void)setAnalyticsReporter:(id)a3;
- (void)setMetadata:(id)a3;
- (void)skipped;
@end

@implementation SXVideoAdProvider

- (SXVideoAdProvider)initWithViewControllerProvider:(id)a3 videoPlayerVisibilityMonitor:(id)a4 videoVisibilityMonitor:(id)a5 component:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v20.receiver = self;
  v20.super_class = (Class)SXVideoAdProvider;
  v15 = [(SXVideoAdProvider *)&v20 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_fullscreenViewControllerProvider, a3);
    v17 = objc_alloc_init(SXVideoAdStateManager);
    stateManager = v16->_stateManager;
    v16->_stateManager = v17;

    objc_storeStrong((id *)&v16->_videoPlayerVisibilityMonitor, a4);
    objc_storeStrong((id *)&v16->_videoVisibilityMonitor, a5);
    objc_storeStrong((id *)&v16->_component, a6);
  }

  return v16;
}

- (id)loadWithCompletionBlock:(id)a3
{
  id v3 = (id)(*((uint64_t (**)(id, void))a3 + 2))(a3, 0);
  return 0;
}

- (void)playbackStarted
{
  id v2 = [(SXVideoAdProvider *)self stateManager];
  [v2 play];
}

- (void)playbackPaused
{
  id v2 = [(SXVideoAdProvider *)self stateManager];
  [v2 pause];
}

- (void)playbackResumed
{
  id v2 = [(SXVideoAdProvider *)self stateManager];
  [v2 play];
}

- (void)playbackFinished
{
  id v2 = [(SXVideoAdProvider *)self stateManager];
  [v2 finish];
}

- (void)playbackFailedWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(SXVideoAdProvider *)self stateManager];
  [v5 failWithError:v4];
}

- (void)skipped
{
  id v2 = [(SXVideoAdProvider *)self stateManager];
  [v2 skip];
}

- (unint64_t)skipThreshold
{
  return 0;
}

- (double)threshold
{
  return (double)[(SXVideoAdProvider *)self skipThreshold];
}

- (BOOL)hasAction
{
  return 0;
}

- (void)presentAction
{
  id v3 = [(SXVideoAdProvider *)self stateManager];
  [v3 pause];

  id v4 = [(SXVideoAdProvider *)self stateManager];
  [v4 learnMore];
}

- (UIView)metricsView
{
  return 0;
}

- (UIButton)privacyMarker
{
  id v3 = objc_alloc_init(MEMORY[0x263F6C688]);
  [v3 addTarget:self action:sel_presentPrivacyStatement forControlEvents:64];
  return (UIButton *)v3;
}

- (double)prerollReadyToPlayTimeout
{
  return 0.0;
}

- (double)impressionThreshold
{
  return 2.0;
}

- (void)adVisibilityStateChanged
{
  id v4 = [(SXVideoAdProvider *)self videoPlayerVisibilityMonitor];
  if ([v4 appeared])
  {
    id v3 = [(SXVideoAdProvider *)self videoVisibilityMonitor];
    [v3 appeared];
  }
}

- (SXAnalyticsReporting)analyticsReporter
{
  return self->_analyticsReporter;
}

- (void)setAnalyticsReporter:(id)a3
{
}

- (SVVideoMetadata)metadata
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_metadata);
  return (SVVideoMetadata *)WeakRetained;
}

- (void)setMetadata:(id)a3
{
}

- (SVVideoAdViewControllerProviding)fullscreenViewControllerProvider
{
  return self->_fullscreenViewControllerProvider;
}

- (SXVideoAdStateManager)stateManager
{
  return self->_stateManager;
}

- (SXVisibilityMonitoring)videoVisibilityMonitor
{
  return self->_videoVisibilityMonitor;
}

- (SXVisibilityMonitoring)videoPlayerVisibilityMonitor
{
  return self->_videoPlayerVisibilityMonitor;
}

- (SXVideoComponent)component
{
  return self->_component;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_videoPlayerVisibilityMonitor, 0);
  objc_storeStrong((id *)&self->_videoVisibilityMonitor, 0);
  objc_storeStrong((id *)&self->_stateManager, 0);
  objc_storeStrong((id *)&self->_fullscreenViewControllerProvider, 0);
  objc_destroyWeak((id *)&self->_metadata);
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
}

@end