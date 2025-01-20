@interface FMModel
- (FMCoreData)fmCoreData;
- (FMCoreTelephonyController)fmCoreTelephonyController;
- (FMModel)initWithFMCoreData:(id)a3 withQueueName:(const char *)a4;
- (FMRegulatoryDomainController)fmRegulatoryDomainController;
- (NSMutableDictionary)contextUUIDToStateMap;
- (dispatch_group_s)_initSyncGroup;
- (dispatch_queue_s)_queue;
- (id)findContextUuidsToDelete:(id)a3;
- (void)_handleAirplaneModeActiveChanged:(BOOL)a3;
- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)_handleIncomingMetric:(id)a3 withPayload:(id)a4;
- (void)_handleLocationAuthorizationUpdate:(int)a3;
- (void)_handleLocationUpdate:(id)a3;
- (void)_handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4;
- (void)_handleRegulatoryDomainEstimateUpdate:(id)a3;
- (void)_handleSignalStrengthChanged:(id)a3 bars:(id)a4;
- (void)_handleSignificantLocationsCleared;
- (void)_handleVisitEnded:(id)a3;
- (void)_handleVisitStarted:(id)a3;
- (void)_initializeStateForContext:(id)a3 atTime:(id)a4;
- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5;
- (void)dealloc;
- (void)handleAirplaneModeActiveChanged:(BOOL)a3;
- (void)handleCellMonitorUpdate:(id)a3 info:(id)a4;
- (void)handleIncomingMetric:(id)a3 withPayload:(id)a4;
- (void)handleLocationAuthorizationUpdate:(int)a3;
- (void)handleLocationUpdate:(id)a3;
- (void)handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4;
- (void)handleRegulatoryDomainEstimateUpdate:(id)a3;
- (void)handleSignalStrengthChanged:(id)a3 bars:(id)a4;
- (void)handleSignificantLocationsCleared;
- (void)handleVisitEnded:(id)a3;
- (void)handleVisitStarted:(id)a3;
- (void)populateSubscriptionContextsInUse:(id)a3;
- (void)setContextUUIDToStateMap:(id)a3;
- (void)setFmCoreData:(id)a3;
- (void)setFmCoreTelephonyController:(id)a3;
- (void)setFmRegulatoryDomainController:(id)a3;
- (void)set_initSyncGroup:(dispatch_group_s *)a3;
- (void)set_queue:(dispatch_queue_s *)a3;
@end

@implementation FMModel

- (void)handleIncomingMetric:(id)a3 withPayload:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMModel *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001E0D0;
  block[3] = &unk_1001B6698;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)v8, block);
}

- (void)handleCellMonitorUpdate:(id)a3 info:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMModel *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001DEC0;
  block[3] = &unk_1001B6698;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)v8, block);
}

- (dispatch_queue_s)_queue
{
  return self->__queue;
}

- (NSMutableDictionary)contextUUIDToStateMap
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (FMCoreData)fmCoreData
{
  return (FMCoreData *)objc_getProperty(self, a2, 24, 1);
}

- (FMModel)initWithFMCoreData:(id)a3 withQueueName:(const char *)a4
{
  id v6 = a3;
  if (!v6) {
    goto LABEL_13;
  }
  v15.receiver = self;
  v15.super_class = (Class)FMModel;
  self = [(FMModel *)&v15 init];
  if (!self)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001475C4();
    }
    self = 0;
    goto LABEL_13;
  }
  [(FMModel *)self set_queue:dispatch_queue_create(a4, 0)];
  if (![(FMModel *)self _queue]
    || ([(FMModel *)self set_initSyncGroup:dispatch_group_create()],
        ![(FMModel *)self _initSyncGroup]))
  {
LABEL_13:
    id v13 = 0;
    goto LABEL_14;
  }
  [(FMModel *)self setFmCoreData:v6];
  id v7 = objc_alloc_init((Class)NSMutableDictionary);
  [(FMModel *)self setContextUUIDToStateMap:v7];

  v8 = [[FMCoreTelephonyController alloc] initWithFMModel:self];
  [(FMModel *)self setFmCoreTelephonyController:v8];

  id v9 = [(FMModel *)self fmCoreTelephonyController];

  if (!v9)
  {
    if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
      sub_1001475F8();
    }
    goto LABEL_13;
  }
  id v10 = [[FMRegulatoryDomainController alloc] initWithFMModel:self];
  [(FMModel *)self setFmRegulatoryDomainController:v10];

  v11 = [(FMModel *)self fmRegulatoryDomainController];

  id v12 = *(NSObject **)(qword_1001D8080 + 136);
  if (!v11)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_10014762C();
    }
    goto LABEL_13;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    sub_100147660();
  }
  self = self;
  id v13 = self;
LABEL_14:

  return v13;
}

- (void)dealloc
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_DEBUG)) {
    sub_1001476A0();
  }
  v3 = [(FMModel *)self fmCoreTelephonyController];
  [v3 removeAsDelegate];

  if ([(FMModel *)self _queue]) {
    dispatch_release((dispatch_object_t)[(FMModel *)self _queue]);
  }
  if ([(FMModel *)self _initSyncGroup]) {
    dispatch_release((dispatch_object_t)[(FMModel *)self _initSyncGroup]);
  }
  v4.receiver = self;
  v4.super_class = (Class)FMModel;
  [(FMModel *)&v4 dealloc];
}

- (void)populateSubscriptionContextsInUse:(id)a3
{
  id v4 = a3;
  v5 = [(FMModel *)self _initSyncGroup];
  id v6 = [(FMModel *)self _queue];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10009B710;
  v8[3] = &unk_1001B7948;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_async((dispatch_group_t)v5, (dispatch_queue_t)v6, v8);
}

- (void)_initializeStateForContext:(id)a3 atTime:(id)a4
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
    sub_100147738();
  }
  +[NSException raise:@"NotImplementedException" format:@"Base class does not implement this method"];
}

- (void)_updateStateForContext:(id)a3 atTime:(id)a4 withExistingState:(id)a5
{
  if (os_log_type_enabled(*(os_log_t *)(qword_1001D8080 + 136), OS_LOG_TYPE_ERROR)) {
    sub_10014776C();
  }
  +[NSException raise:@"NotImplementedException" format:@"Base class does not implement this method"];
}

- (void)_handleAirplaneModeActiveChanged:(BOOL)a3
{
  v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001477A0(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)_handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4
{
  uint64_t v4 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100147818(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)_handleCellMonitorUpdate:(id)a3 info:(id)a4
{
  uint64_t v4 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100147890(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)_handleSignalStrengthChanged:(id)a3 bars:(id)a4
{
  uint64_t v4 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100147908(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (void)handleAirplaneModeActiveChanged:(BOOL)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009BC88;
  v3[3] = &unk_1001B97B8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async((dispatch_queue_t)[(FMModel *)self _queue], v3);
}

- (void)handleRegistrationStatusChanged:(id)a3 registrationStatus:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FMModel *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BD7C;
  block[3] = &unk_1001B6698;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)v8, block);
}

- (void)handleSignalStrengthChanged:(id)a3 bars:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(FMModel *)self _queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009BE70;
  block[3] = &unk_1001B6698;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)v8, block);
}

- (void)_handleLocationUpdate:(id)a3
{
  v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100147980(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)_handleLocationAuthorizationUpdate:(int)a3
{
  v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_1001479F8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)_handleVisitStarted:(id)a3
{
  v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100147A70(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)_handleVisitEnded:(id)a3
{
  v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100147AE8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)handleLocationUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMModel *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009C05C;
  v7[3] = &unk_1001B7948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, v7);
}

- (void)handleLocationAuthorizationUpdate:(int)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10009C0EC;
  v3[3] = &unk_1001B97E0;
  v3[4] = self;
  int v4 = a3;
  dispatch_async((dispatch_queue_t)[(FMModel *)self _queue], v3);
}

- (void)handleVisitStarted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMModel *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009C1B8;
  v7[3] = &unk_1001B7948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, v7);
}

- (void)handleVisitEnded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMModel *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009C280;
  v7[3] = &unk_1001B7948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, v7);
}

- (void)_handleSignificantLocationsCleared
{
  v2 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    sub_100147B60(v2, v3, v4, v5, v6, v7, v8, v9);
  }
}

- (void)handleSignificantLocationsCleared
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009C350;
  block[3] = &unk_1001B5F28;
  block[4] = self;
  dispatch_async((dispatch_queue_t)[(FMModel *)self _queue], block);
}

- (void)_handleRegulatoryDomainEstimateUpdate:(id)a3
{
  uint64_t v3 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_100147BD8(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

- (void)handleRegulatoryDomainEstimateUpdate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(FMModel *)self _queue];
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009C45C;
  v7[3] = &unk_1001B7948;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async((dispatch_queue_t)v5, v7);
}

- (void)_handleIncomingMetric:(id)a3 withPayload:(id)a4
{
  id v4 = *(NSObject **)(qword_1001D8080 + 136);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_100147C50(v4, v5, v6, v7, v8, v9, v10, v11);
  }
}

- (id)findContextUuidsToDelete:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableSet);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = [*(id *)(*((void *)&v22 + 1) + 8 * i) uuid];
        [v5 addObject:v10];
      }
      id v7 = [v6 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc_init((Class)NSMutableArray);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v12 = [(FMModel *)self contextUUIDToStateMap];
  id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v19;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v19 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v18 + 1) + 8 * (void)j);
        if (([v5 containsObject:v16] & 1) == 0) {
          [v11 addObject:v16];
        }
      }
      id v13 = [v12 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v13);
  }

  return v11;
}

- (dispatch_group_s)_initSyncGroup
{
  return self->__initSyncGroup;
}

- (void)set_initSyncGroup:(dispatch_group_s *)a3
{
  self->__initSyncGroup = a3;
}

- (void)set_queue:(dispatch_queue_s *)a3
{
  self->__queue = a3;
}

- (void)setFmCoreData:(id)a3
{
}

- (FMCoreTelephonyController)fmCoreTelephonyController
{
  return (FMCoreTelephonyController *)objc_getProperty(self, a2, 32, 1);
}

- (void)setFmCoreTelephonyController:(id)a3
{
}

- (FMRegulatoryDomainController)fmRegulatoryDomainController
{
  return (FMRegulatoryDomainController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setFmRegulatoryDomainController:(id)a3
{
}

- (void)setContextUUIDToStateMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextUUIDToStateMap, 0);
  objc_storeStrong((id *)&self->_fmRegulatoryDomainController, 0);
  objc_storeStrong((id *)&self->_fmCoreTelephonyController, 0);

  objc_storeStrong((id *)&self->_fmCoreData, 0);
}

@end