@interface PALOngoingAccessIntervalState
- (BOOL)eligibleForMetricCollection;
- (NSMutableDictionary)assetIdentifierHashesByVisibilityState;
- (NSMutableDictionary)eventCountByVisibilityState;
- (OS_os_transaction)transaction;
- (PAAccess)access;
- (PAAssetIdentifierPool)assetIdentifierPool;
- (PALOngoingAccessIntervalState)initWithAccess:(id)a3 queue:(id)a4 applicationMetadataResolver:(id)a5 eligibleForMetricCollection:(BOOL)a6;
- (PALOngoingAccessIntervalState)initWithAccess:(id)a3 queue:(id)a4 applicationMetadataResolver:(id)a5 eligibleForMetricCollection:(BOOL)a6 startTimestamp:(unint64_t)a7;
- (double)intervalSinceStart;
- (unint64_t)startTimestamp;
- (void)dealloc;
- (void)invalidate;
- (void)recordAccessToAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5;
- (void)setAssetIdentifierPool:(id)a3;
@end

@implementation PALOngoingAccessIntervalState

- (PALOngoingAccessIntervalState)initWithAccess:(id)a3 queue:(id)a4 applicationMetadataResolver:(id)a5 eligibleForMetricCollection:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [(PALOngoingAccessIntervalState *)self initWithAccess:v12 queue:v11 applicationMetadataResolver:v10 eligibleForMetricCollection:v6 startTimestamp:mach_continuous_time()];

  return v13;
}

- (PALOngoingAccessIntervalState)initWithAccess:(id)a3 queue:(id)a4 applicationMetadataResolver:(id)a5 eligibleForMetricCollection:(BOOL)a6 startTimestamp:(unint64_t)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  v34.receiver = self;
  v34.super_class = (Class)PALOngoingAccessIntervalState;
  v16 = [(PALOngoingAccessIntervalState *)&v34 init];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_access, a3);
    v17->_eligibleForMetricCollection = a6;
    v17->_startTimestamp = a7;
    uint64_t v18 = os_transaction_create();
    transaction = v17->_transaction;
    v17->_transaction = (OS_os_transaction *)v18;

    id v20 = objc_alloc((Class)PAAssetIdentifierPool);
    uint64_t v21 = PADefaultAssetIdentifierPoolMaxSize;
    double v22 = PADefaultAssetIdentifierPoolAutoDrainInterval;
    v23 = [v15 bundleRecordRetriever];
    v24 = [v13 accessor];
    v25 = ((void (**)(void, void *))v23)[2](v23, v24);
    v26 = [v15 aggregateVisibilityStateMonitor];
    v27 = (PAAssetIdentifierPool *)[v20 initWithMaxPoolSize:v21 autoDrainInterval:v25 bundleRecord:v26 aggregateVisibilityStateMonitor:v14 onQueue:v17 delegate:v22];
    assetIdentifierPool = v17->_assetIdentifierPool;
    v17->_assetIdentifierPool = v27;

    uint64_t v29 = +[NSMutableDictionary dictionary];
    assetIdentifierHashesByVisibilityState = v17->_assetIdentifierHashesByVisibilityState;
    v17->_assetIdentifierHashesByVisibilityState = (NSMutableDictionary *)v29;

    uint64_t v31 = +[NSMutableDictionary dictionary];
    eventCountByVisibilityState = v17->_eventCountByVisibilityState;
    v17->_eventCountByVisibilityState = (NSMutableDictionary *)v31;
  }
  return v17;
}

- (void)dealloc
{
  [(PALOngoingAccessIntervalState *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)PALOngoingAccessIntervalState;
  [(PALOngoingAccessIntervalState *)&v3 dealloc];
}

- (void)invalidate
{
  [(PAAssetIdentifierPool *)self->_assetIdentifierPool invalidate];
  assetIdentifierPool = self->_assetIdentifierPool;
  self->_assetIdentifierPool = 0;
}

- (double)intervalSinceStart
{
  uint64_t v2 = mach_continuous_time() - self->_startTimestamp;

  _TMConvertTicksToSeconds(v2);
  return result;
}

- (void)recordAccessToAssetIdentifiers:(id)a3 withVisibilityState:(int64_t)a4 accessEventCount:(unint64_t)a5
{
  id v8 = a3;
  if ([(PALOngoingAccessIntervalState *)self eligibleForMetricCollection])
  {
    eventCountByVisibilityState = self->_eventCountByVisibilityState;
    id v10 = +[NSNumber numberWithInteger:a4];
    id v11 = [(NSMutableDictionary *)eventCountByVisibilityState objectForKeyedSubscript:v10];
    id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)[v11 integerValue] + a5);
    id v13 = self->_eventCountByVisibilityState;
    id v14 = +[NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)v13 setObject:v12 forKeyedSubscript:v14];

    if ([v8 count])
    {
      assetIdentifierHashesByVisibilityState = self->_assetIdentifierHashesByVisibilityState;
      v16 = +[NSNumber numberWithInteger:a4];
      v17 = [(NSMutableDictionary *)assetIdentifierHashesByVisibilityState objectForKeyedSubscript:v16];

      if (!v17)
      {
        v17 = +[NSMutableSet set];
        uint64_t v18 = self->_assetIdentifierHashesByVisibilityState;
        v19 = +[NSNumber numberWithInteger:a4];
        [(NSMutableDictionary *)v18 setObject:v17 forKeyedSubscript:v19];
      }
      long long v28 = 0u;
      long long v29 = 0u;
      long long v26 = 0u;
      long long v27 = 0u;
      id v20 = v8;
      id v21 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v21)
      {
        id v22 = v21;
        uint64_t v23 = *(void *)v27;
        do
        {
          v24 = 0;
          do
          {
            if (*(void *)v27 != v23) {
              objc_enumerationMutation(v20);
            }
            v25 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * (void)v24), "hash", (void)v26));
            [v17 addObject:v25];

            v24 = (char *)v24 + 1;
          }
          while (v22 != v24);
          id v22 = [v20 countByEnumeratingWithState:&v26 objects:v30 count:16];
        }
        while (v22);
      }
    }
  }
}

- (PAAccess)access
{
  return self->_access;
}

- (unint64_t)startTimestamp
{
  return self->_startTimestamp;
}

- (NSMutableDictionary)assetIdentifierHashesByVisibilityState
{
  return self->_assetIdentifierHashesByVisibilityState;
}

- (NSMutableDictionary)eventCountByVisibilityState
{
  return self->_eventCountByVisibilityState;
}

- (PAAssetIdentifierPool)assetIdentifierPool
{
  return self->_assetIdentifierPool;
}

- (void)setAssetIdentifierPool:(id)a3
{
}

- (BOOL)eligibleForMetricCollection
{
  return self->_eligibleForMetricCollection;
}

- (OS_os_transaction)transaction
{
  return self->_transaction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_assetIdentifierPool, 0);
  objc_storeStrong((id *)&self->_eventCountByVisibilityState, 0);
  objc_storeStrong((id *)&self->_assetIdentifierHashesByVisibilityState, 0);

  objc_storeStrong((id *)&self->_access, 0);
}

@end