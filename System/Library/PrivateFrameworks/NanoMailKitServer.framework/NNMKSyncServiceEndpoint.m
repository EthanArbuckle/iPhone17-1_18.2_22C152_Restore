@interface NNMKSyncServiceEndpoint
- (BOOL)_willIdRepeat:(id)a3;
- (NNMKSyncServiceEndpoint)initWithIDSServiceName:(id)a3 queue:(id)a4;
- (NNMKSyncServiceTransport)serviceTransport;
- (NSMutableDictionary)repeatPreventionRecords;
- (NSString)idsServiceName;
- (OS_dispatch_queue)serviceQueue;
- (OS_dispatch_source)repeatPreventionCleanupTimer;
- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 repeatPreventionId:(id)a6 timeoutCategory:(unint64_t)a7 allowCloudDelivery:(BOOL)a8;
- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeout:(double)a6 allowCloudDelivery:(BOOL)a7;
- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6 allowCloudDelivery:(BOOL)a7;
- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6;
- (unint64_t)connectivityState;
- (void)_initializeServiceTransport;
- (void)_removeExpiredRepeatPreventionRecords;
- (void)_storeRepeatPreventionId:(id)a3 priority:(unint64_t)a4;
- (void)dealloc;
- (void)resetRepeatPreventionHistory;
- (void)setIdsServiceName:(id)a3;
- (void)setRepeatPreventionCleanupTimer:(id)a3;
- (void)setRepeatPreventionRecords:(id)a3;
- (void)setServiceQueue:(id)a3;
- (void)setServiceTransport:(id)a3;
- (void)syncServiceTransport:(id)a3 didFailSendingProtobufWithIdentifier:(id)a4 errorCode:(int64_t)a5;
- (void)syncServiceTransport:(id)a3 didReadProtobufData:(id)a4 type:(unint64_t)a5;
- (void)syncServiceTransport:(id)a3 didRecieveDataAtURL:(id)a4 metadata:(id)a5;
- (void)syncServiceTransport:(id)a3 didSendProtobufSuccessfullyWithIdentifier:(id)a4;
@end

@implementation NNMKSyncServiceEndpoint

- (NNMKSyncServiceEndpoint)initWithIDSServiceName:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v20.receiver = self;
  v20.super_class = (Class)NNMKSyncServiceEndpoint;
  v9 = [(NNMKSyncServiceEndpoint *)&v20 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_serviceQueue, a4);
    objc_storeStrong((id *)&v10->_idsServiceName, a3);
    [(NNMKSyncServiceEndpoint *)v10 _initializeServiceTransport];
    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    repeatPreventionRecords = v10->_repeatPreventionRecords;
    v10->_repeatPreventionRecords = v11;

    dispatch_source_t v13 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v10->_serviceQueue);
    repeatPreventionCleanupTimer = v10->_repeatPreventionCleanupTimer;
    v10->_repeatPreventionCleanupTimer = (OS_dispatch_source *)v13;

    objc_initWeak(&location, v10);
    v15 = v10->_repeatPreventionCleanupTimer;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __56__NNMKSyncServiceEndpoint_initWithIDSServiceName_queue___block_invoke;
    v17[3] = &unk_264E9A3D0;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v15, v17);
    dispatch_resume((dispatch_object_t)v10->_repeatPreventionCleanupTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v10;
}

void __56__NNMKSyncServiceEndpoint_initWithIDSServiceName_queue___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _removeExpiredRepeatPreventionRecords];
}

- (void)dealloc
{
  dispatch_source_cancel((dispatch_source_t)self->_repeatPreventionCleanupTimer);
  v3.receiver = self;
  v3.super_class = (Class)NNMKSyncServiceEndpoint;
  [(NNMKSyncServiceEndpoint *)&v3 dealloc];
}

- (void)_initializeServiceTransport
{
  self->_serviceTransport = (NNMKSyncServiceTransport *)[[NNMKSyncServiceIDSTransport alloc] initWithServiceName:self->_idsServiceName queue:self->_serviceQueue delegate:self];
  MEMORY[0x270F9A758]();
}

- (void)resetRepeatPreventionHistory
{
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeout:(double)a6 allowCloudDelivery:(BOOL)a7
{
  return (id)[(NNMKSyncServiceTransport *)self->_serviceTransport sendProtobufData:a3 type:a4 priority:a5 timeout:a7 allowCloudDelivery:a6];
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6 allowCloudDelivery:(BOOL)a7
{
  return (id)[(NNMKSyncServiceTransport *)self->_serviceTransport sendProtobufData:a3 type:a4 priority:a5 timeoutCategory:a6 allowCloudDelivery:a7];
}

- (id)sendProtobufData:(id)a3 type:(unint64_t)a4 priority:(unint64_t)a5 repeatPreventionId:(id)a6 timeoutCategory:(unint64_t)a7 allowCloudDelivery:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a6;
  if (v15)
  {
    if ([(NNMKSyncServiceEndpoint *)self _willIdRepeat:v15])
    {
      v16 = 0;
    }
    else
    {
      v16 = [(NNMKSyncServiceTransport *)self->_serviceTransport sendProtobufData:v14 type:a4 priority:a5 timeoutCategory:a7 allowCloudDelivery:v8];
      [(NNMKSyncServiceEndpoint *)self _storeRepeatPreventionId:v15 priority:a5];
    }
  }
  else
  {
    v16 = [(NNMKSyncServiceEndpoint *)self sendProtobufData:v14 type:a4 priority:a5 timeoutCategory:a7 allowCloudDelivery:v8];
  }

  return v16;
}

- (id)sendResourceAtURL:(id)a3 metadata:(id)a4 priority:(unint64_t)a5 timeoutCategory:(unint64_t)a6
{
  return (id)[(NNMKSyncServiceTransport *)self->_serviceTransport sendResourceAtURL:a3 metadata:a4 priority:a5 timeoutCategory:a6];
}

- (void)syncServiceTransport:(id)a3 didReadProtobufData:(id)a4 type:(unint64_t)a5
{
  id v10 = a3;
  id v8 = a4;
  v9 = (void *)MEMORY[0x23ED008A0]();
  [(NNMKSyncServiceEndpoint *)self readProtobufData:v8 type:a5];
}

- (void)syncServiceTransport:(id)a3 didRecieveDataAtURL:(id)a4 metadata:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = (void *)MEMORY[0x23ED008A0]();
  [(NNMKSyncServiceEndpoint *)self readResourceAtURL:v8 metadata:v9];
}

- (void)syncServiceTransport:(id)a3 didSendProtobufSuccessfullyWithIdentifier:(id)a4
{
}

- (void)syncServiceTransport:(id)a3 didFailSendingProtobufWithIdentifier:(id)a4 errorCode:(int64_t)a5
{
}

- (unint64_t)connectivityState
{
  return [(NNMKSyncServiceTransport *)self->_serviceTransport connectivityState];
}

- (BOOL)_willIdRepeat:(id)a3
{
  objc_super v3 = [(NSMutableDictionary *)self->_repeatPreventionRecords objectForKeyedSubscript:a3];
  v4 = v3;
  if (v3)
  {
    [v3 timeIntervalSinceNow];
    BOOL v6 = v5 > 0.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (void)_storeRepeatPreventionId:(id)a3 priority:(unint64_t)a4
{
  if (a4 == 300) {
    double v5 = 5.0;
  }
  else {
    double v5 = 15.0;
  }
  BOOL v6 = (void *)MEMORY[0x263EFF910];
  id v7 = a3;
  id v10 = [v6 dateWithTimeIntervalSinceNow:v5];
  [(NSMutableDictionary *)self->_repeatPreventionRecords setObject:v10 forKeyedSubscript:v7];

  repeatPreventionCleanupTimer = self->_repeatPreventionCleanupTimer;
  dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v5 * 1000000000.0));
  dispatch_source_set_timer(repeatPreventionCleanupTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
}

- (void)_removeExpiredRepeatPreventionRecords
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  objc_super v3 = [(NSMutableDictionary *)self->_repeatPreventionRecords allKeys];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v9 + 1) + 8 * i);
        if (![(NNMKSyncServiceEndpoint *)self _willIdRepeat:v8]) {
          [(NSMutableDictionary *)self->_repeatPreventionRecords removeObjectForKey:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (NNMKSyncServiceTransport)serviceTransport
{
  return self->_serviceTransport;
}

- (void)setServiceTransport:(id)a3
{
}

- (NSString)idsServiceName
{
  return self->_idsServiceName;
}

- (void)setIdsServiceName:(id)a3
{
}

- (OS_dispatch_queue)serviceQueue
{
  return self->_serviceQueue;
}

- (void)setServiceQueue:(id)a3
{
}

- (NSMutableDictionary)repeatPreventionRecords
{
  return self->_repeatPreventionRecords;
}

- (void)setRepeatPreventionRecords:(id)a3
{
}

- (OS_dispatch_source)repeatPreventionCleanupTimer
{
  return self->_repeatPreventionCleanupTimer;
}

- (void)setRepeatPreventionCleanupTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_repeatPreventionCleanupTimer, 0);
  objc_storeStrong((id *)&self->_repeatPreventionRecords, 0);
  objc_storeStrong((id *)&self->_serviceQueue, 0);
  objc_storeStrong((id *)&self->_idsServiceName, 0);
  objc_storeStrong((id *)&self->_serviceTransport, 0);
}

@end