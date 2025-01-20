@interface PACoalescingIntervalTracker
- (BOOL)collectAssetIdentifiers;
- (PAAccessLogger)logger;
- (PACoalescingIntervalTracker)initWithLogger:(id)a3;
- (double)intervalEndTime;
- (void)coalesce:(id)a3;
- (void)dealloc;
- (void)expireIntervalWithMatcher:(id)a3 state:(id)a4;
- (void)invalidate;
- (void)setCollectAssetIdentifiers:(BOOL)a3;
- (void)setIntervalEndTime:(double)a3;
@end

@implementation PACoalescingIntervalTracker

- (void)coalesce:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  v5 = +[PAAccessMatcher coalescingMatcherForAccess:v4];
  uint64_t v6 = [(NSMutableDictionary *)self->_coalescingIntervals objectForKeyedSubscript:v5];
  if (self->_loggingOptions) {
    int v7 = [v4 supportsSameMinuteAccessCountLogging];
  }
  else {
    int v7 = 0;
  }
  v8 = [v4 assetIdentifiers];
  if (_os_feature_enabled_impl() && ![v8 count])
  {
    v9 = [MEMORY[0x1E4F1C9B8] dataWithBytes:&self->_injectedIdentifier length:8];
    ++self->_injectedIdentifier;
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:v9];

    v8 = (void *)v10;
  }
  v11 = (PACoalescingIntervalState *)v6;
  if (!v6)
  {
    if (v7)
    {
      v12 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      v13 = [MEMORY[0x1E4F1C9C8] date];
      v14 = [v12 components:128 fromDate:v13];

      uint64_t v15 = [v14 second];
      v16 = [(PACoalescingIntervalTracker *)self logger];
      v17 = [v16 beginIntervalForAccess:v4];

      v11 = [[PACoalescingIntervalState alloc] initWithInterval:v17 matcher:v5 tracker:self expiry:59.0 - (double)v15];
    }
    else
    {
      v18 = [(PACoalescingIntervalTracker *)self logger];
      v14 = [v18 beginIntervalForAccess:v4];

      v11 = [[PACoalescingIntervalState alloc] initWithInterval:v14 matcher:v5 tracker:self];
    }

    [(NSMutableDictionary *)self->_coalescingIntervals setObject:v11 forKeyedSubscript:v5];
  }
  v19 = logger_1();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v4;
    __int16 v24 = 2112;
    v25 = v11;
    __int16 v26 = 1024;
    BOOL v27 = v6 == 0;
    _os_log_debug_impl(&dword_1A8FA5000, v19, OS_LOG_TYPE_DEBUG, "Coalescing access=%@ into interval=%@ isNew=%d", buf, 0x1Cu);
  }

  if (self->_collectAssetIdentifiers)
  {
    v20 = [(PACoalescingIntervalState *)v11 interval];
    [v20 recordAccessToAssetIdentifiers:v8 withVisibilityState:0 accessEventCount:1];
  }
  if (v7) {
    [(PACoalescingIntervalState *)v11 setAccessCount:[(PACoalescingIntervalState *)v11 accessCount] + 1];
  }
  else {
    [(PACoalescingIntervalState *)v11 touch];
  }
  v21 = [(PACoalescingIntervalTracker *)self logger];
  [v21 notifyDidCoalesceAccess:v4];

  os_unfair_lock_unlock(&self->_lock);
}

- (PAAccessLogger)logger
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_logger);

  return (PAAccessLogger *)WeakRetained;
}

- (double)intervalEndTime
{
  return self->_intervalEndTime;
}

- (PACoalescingIntervalTracker)initWithLogger:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PACoalescingIntervalTracker;
  v5 = [(PACoalescingIntervalTracker *)&v10 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_logger, v4);
    v6->_intervalEndTime = 60.0;
    uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
    coalescingIntervals = v6->_coalescingIntervals;
    v6->_coalescingIntervals = (NSMutableDictionary *)v7;

    v6->_collectAssetIdentifiers = _os_feature_enabled_impl();
    v6->_loggingOptions = [v4 options];
  }

  return v6;
}

- (void)expireIntervalWithMatcher:(id)a3 state:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v9 = [(NSMutableDictionary *)self->_coalescingIntervals objectForKeyedSubscript:v6];
  objc_super v10 = logger_1();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[PACoalescingIntervalTracker expireIntervalWithMatcher:state:]((uint64_t)v9, v10);
  }

  [(NSMutableDictionary *)self->_coalescingIntervals setObject:0 forKeyedSubscript:v6];
  v11 = [v9 interval];
  [v9 timestampAdjustment];
  objc_msgSend(v11, "endWithTimestampAdjustment:accessCount:", objc_msgSend(v9, "accessCount"), v12);

  os_unfair_lock_unlock(p_lock);
}

- (void)invalidate
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_coalescingIntervals;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        v8 = -[NSMutableDictionary objectForKeyedSubscript:](self->_coalescingIntervals, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * v7), (void)v10);
        [v8 invalidate];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  coalescingIntervals = self->_coalescingIntervals;
  self->_coalescingIntervals = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  [(PACoalescingIntervalTracker *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PACoalescingIntervalTracker;
  [(PACoalescingIntervalTracker *)&v3 dealloc];
}

- (void)setIntervalEndTime:(double)a3
{
  self->_intervalEndTime = a3;
}

- (BOOL)collectAssetIdentifiers
{
  return self->_collectAssetIdentifiers;
}

- (void)setCollectAssetIdentifiers:(BOOL)a3
{
  self->_collectAssetIdentifiers = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_logger);

  objc_storeStrong((id *)&self->_coalescingIntervals, 0);
}

- (void)expireIntervalWithMatcher:(uint64_t)a1 state:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1A8FA5000, a2, OS_LOG_TYPE_DEBUG, "Ending idle coalescing interval=%@", (uint8_t *)&v2, 0xCu);
}

@end