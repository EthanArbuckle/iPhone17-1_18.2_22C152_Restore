@interface SBTipsHomeScreenUsageObserver
- (SBHIconManager)iconManager;
- (SBTipsHomeScreenUsageObserver)initWithIconManager:(id)a3;
- (void)homeScreenUsageAggregatorDidNoteEditingModeEntered:(id)a3;
@end

@implementation SBTipsHomeScreenUsageObserver

- (SBTipsHomeScreenUsageObserver)initWithIconManager:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBTipsHomeScreenUsageObserver;
  v5 = [(SBTipsHomeScreenUsageObserver *)&v9 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_iconManager, v4);
    [v4 setUsageMonitoringEnabled:1];
    v7 = [v4 usageMonitor];
    [v7 addObserver:v6];
  }
  return v6;
}

- (void)homeScreenUsageAggregatorDidNoteEditingModeEntered:(id)a3
{
  v3 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v3, &__block_literal_global_212);
}

void __84__SBTipsHomeScreenUsageObserver_homeScreenUsageAggregatorDidNoteEditingModeEntered___block_invoke()
{
  id v2 = [MEMORY[0x1E4F504C8] discoverabilitySignal];
  v0 = [v2 source];
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F50318]) initWithIdentifier:@"com.apple.springboard.homescreen.didEnterEditMode" bundleID:@"com.apple.springboard" context:0 userInfo:0];
  [v0 sendEvent:v1];
}

- (SBHIconManager)iconManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_iconManager);
  return (SBHIconManager *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end