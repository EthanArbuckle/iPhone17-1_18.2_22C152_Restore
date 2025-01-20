@interface PAAssetIdentifierPool
- (PAAssetIdentifierPool)initWithMaxPoolSize:(unint64_t)a3 autoDrainInterval:(double)a4 bundleRecord:(id)a5 aggregateVisibilityStateMonitor:(id)a6 onQueue:(id)a7 delegate:(id)a8;
- (void)addAssetIdentifiers:(id)a3;
- (void)addAssetIdentifiers:(id)a3 accessEventCount:(unint64_t)a4;
- (void)drainPool;
- (void)invalidate;
@end

@implementation PAAssetIdentifierPool

- (PAAssetIdentifierPool)initWithMaxPoolSize:(unint64_t)a3 autoDrainInterval:(double)a4 bundleRecord:(id)a5 aggregateVisibilityStateMonitor:(id)a6 onQueue:(id)a7 delegate:(id)a8
{
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)PAAssetIdentifierPool;
  v18 = [(PAAssetIdentifierPool *)&v27 init];
  if (v18)
  {
    v19 = [[PABasicAssetIdentifierPool alloc] initWithMaxPoolSize:a3 autoDrainInterval:v16 onQueue:v17 delegate:a4];
    assetIdentifierPool = v18->_assetIdentifierPool;
    v18->_assetIdentifierPool = v19;

    if ([v14 conformsToProtocol:&unk_1EFF86FB0]) {
      v21 = v14;
    }
    else {
      v21 = 0;
    }
    v22 = PAAssociatedBundleIdentifiersForApplication(v21);
    uint64_t v23 = [v15 startMonitoringAggregateVisibilityStateForBundleIdentifiers:v22 onQueue:v16 withDelegate:v18->_assetIdentifierPool];
    stateMonitorHandle = v18->_stateMonitorHandle;
    v18->_stateMonitorHandle = (PAProcessStateMonitoringEnding *)v23;

    v25 = v18;
  }

  return v18;
}

- (void)drainPool
{
}

- (void)addAssetIdentifiers:(id)a3
{
}

- (void)addAssetIdentifiers:(id)a3 accessEventCount:(unint64_t)a4
{
}

- (void)invalidate
{
  [(PAProcessStateMonitoringEnding *)self->_stateMonitorHandle invalidate];
  assetIdentifierPool = self->_assetIdentifierPool;

  [(PABasicAssetIdentifierPool *)assetIdentifierPool invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateMonitorHandle, 0);

  objc_storeStrong((id *)&self->_assetIdentifierPool, 0);
}

@end