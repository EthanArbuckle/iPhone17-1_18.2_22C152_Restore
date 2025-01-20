@interface _UISTouchAuthenticationDurationBasedTelemetryManager
- (_UISTouchAuthenticationDurationBasedTelemetryManager)initWithQueue:(id)a3;
- (void)_reportEventRecordToCoreAnalyticsIfNecessary:(void *)a1;
- (void)enqueueRecordForAnalytics:(id)a3;
- (void)flushRecordsWithIdentifier:(int64_t)a3;
@end

@implementation _UISTouchAuthenticationDurationBasedTelemetryManager

- (_UISTouchAuthenticationDurationBasedTelemetryManager)initWithQueue:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)_UISTouchAuthenticationDurationBasedTelemetryManager;
  v6 = [(_UISTouchAuthenticationDurationBasedTelemetryManager *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F62850]);
    recordMap = v7->_recordMap;
    v7->_recordMap = v8;
  }
  return v7;
}

- (void)enqueueRecordForAnalytics:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __82___UISTouchAuthenticationDurationBasedTelemetryManager_enqueueRecordForAnalytics___block_invoke;
  block[3] = &unk_1E57350E8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)flushRecordsWithIdentifier:(int64_t)a3
{
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83___UISTouchAuthenticationDurationBasedTelemetryManager_flushRecordsWithIdentifier___block_invoke;
  block[3] = &unk_1E5735110;
  objc_copyWeak(v7, &location);
  v7[1] = (id)a3;
  dispatch_async(queue, block);
  objc_destroyWeak(v7);
  objc_destroyWeak(&location);
}

- (void)_reportEventRecordToCoreAnalyticsIfNecessary:(void *)a1
{
  id v1 = a1;
  if (-[_UISTouchAuthenticationRecord timeSinceCreation]((uint64_t)v1) > 0.2) {
    _UISTouchAuthenticationTelemetryReportRecordWithDuration(v1, 1);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recordMap, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end