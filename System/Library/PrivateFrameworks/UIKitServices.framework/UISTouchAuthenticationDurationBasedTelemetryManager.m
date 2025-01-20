@interface UISTouchAuthenticationDurationBasedTelemetryManager
@end

@implementation UISTouchAuthenticationDurationBasedTelemetryManager

void __82___UISTouchAuthenticationDurationBasedTelemetryManager_enqueueRecordForAnalytics___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = *(id *)(a1 + 32);
  if (WeakRetained)
  {
    BSDispatchQueueAssert();
    uint64_t v3 = [v2 serviceInstanceIdentifier];
    if (v3 <= 0)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:sel__queue_processRecord_ object:WeakRetained file:@"_UISTouchAuthenticationDurationBasedTelemetryManager.m" lineNumber:60 description:@"Records provided to _UISTouchAuthenticationDurationBasedTelemetryManager require a valid serviceInstanceIdentifier"];
    }
    int v4 = [WeakRetained[2] containsObjectForKey:v3];
    id v5 = WeakRetained[2];
    if (v4)
    {
      v6 = [v5 objectForKey:v3];
      v7 = v6;
      if (!v6 || ([v6 isEqual:v2] & 1) == 0)
      {
        -[_UISTouchAuthenticationDurationBasedTelemetryManager _reportEventRecordToCoreAnalyticsIfNecessary:](v7);
        [WeakRetained[2] setObject:v2 forKey:v3];
      }
    }
    else
    {
      [v5 setObject:v2 forKey:v3];
    }
  }
}

void __83___UISTouchAuthenticationDurationBasedTelemetryManager_flushRecordsWithIdentifier___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = *(void *)(a1 + 40);
    BSDispatchQueueAssert();
    if ([WeakRetained[2] containsObjectForKey:v2])
    {
      uint64_t v3 = [WeakRetained[2] objectForKey:v2];
      -[_UISTouchAuthenticationDurationBasedTelemetryManager _reportEventRecordToCoreAnalyticsIfNecessary:](v3);

      [WeakRetained[2] removeObjectForKey:v2];
    }
  }
}

@end