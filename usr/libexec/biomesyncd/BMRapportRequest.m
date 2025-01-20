@interface BMRapportRequest
- (BMRapportRequest)initWithUUID:(id)a3 activity:(id)a4 requestBlock:(id)a5 queue:(id)a6 completionHandler:(id)a7;
- (BMSyncSessionContext)sessionContext;
- (NSDictionary)errorFromDevice;
- (NSSet)deliveredToDevices;
- (NSSet)inFlightToDevices;
- (NSUUID)uuid;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)requestTimeout;
- (OS_xpc_object)activity;
- (id)completionHandler;
- (id)requestBlock;
- (id)requestTimeoutHandler;
- (unint64_t)state;
- (void)markAsDeliveredToDevice:(id)a3 withError:(id)a4;
- (void)markAsInFlightToDevice:(id)a3;
- (void)requestTimeoutDidFire;
- (void)runRequestOnDevice:(id)a3;
- (void)setActivity:(id)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setDeliveredToDevices:(id)a3;
- (void)setErrorFromDevice:(id)a3;
- (void)setInFlightToDevices:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRequestBlock:(id)a3;
- (void)setRequestTimeout:(id)a3;
- (void)setRequestTimeoutHandler:(id)a3;
- (void)setSessionContext:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setUuid:(id)a3;
- (void)startRequestTimeout;
- (void)stopRequestTimeout;
@end

@implementation BMRapportRequest

- (BMRapportRequest)initWithUUID:(id)a3 activity:(id)a4 requestBlock:(id)a5 queue:(id)a6 completionHandler:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v33.receiver = self;
  v33.super_class = (Class)BMRapportRequest;
  v18 = [(BMRapportRequest *)&v33 init];
  v19 = v18;
  if (v18)
  {
    v18->_state = 0;
    objc_storeStrong((id *)&v18->_uuid, a3);
    objc_storeStrong((id *)&v19->_activity, a4);
    id v20 = [v15 copy];
    id requestBlock = v19->_requestBlock;
    v19->_id requestBlock = v20;

    id v22 = [v17 copy];
    id completionHandler = v19->_completionHandler;
    v19->_id completionHandler = v22;

    uint64_t v24 = objc_opt_new();
    deliveredToDevices = v19->_deliveredToDevices;
    v19->_deliveredToDevices = (NSMutableSet *)v24;

    uint64_t v26 = objc_opt_new();
    inFlightToDevices = v19->_inFlightToDevices;
    v19->_inFlightToDevices = (NSMutableSet *)v26;

    uint64_t v28 = objc_opt_new();
    errorFromDevice = v19->_errorFromDevice;
    v19->_errorFromDevice = (NSMutableDictionary *)v28;

    objc_storeStrong((id *)&v19->_queue, a6);
    uint64_t v30 = os_transaction_create();
    transaction = v19->_transaction;
    v19->_transaction = (OS_os_transaction *)v30;

    [(BMRapportRequest *)v19 startRequestTimeout];
  }

  return v19;
}

- (void)runRequestOnDevice:(id)a3
{
  id v4 = a3;
  [(BMRapportRequest *)self stopRequestTimeout];
  self->_state = 1;
  v5 = [(BMRapportRequest *)self requestBlock];
  v5[2](v5, v4);
}

- (void)markAsInFlightToDevice:(id)a3
{
}

- (void)markAsDeliveredToDevice:(id)a3 withError:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  [(NSMutableSet *)self->_inFlightToDevices removeObject:v9];
  [(NSMutableSet *)self->_deliveredToDevices addObject:v9];
  if (v6)
  {
    errorFromDevice = self->_errorFromDevice;
    v8 = [v9 rapportIdentifier];
    [(NSMutableDictionary *)errorFromDevice setObject:v6 forKeyedSubscript:v8];
  }
}

- (void)startRequestTimeout
{
  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    dispatch_time_t v3 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(requestTimeout, v3, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
  }
  else
  {
    v5 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    id v6 = self->_requestTimeout;
    self->_requestTimeout = v5;

    v7 = self->_requestTimeout;
    dispatch_time_t v8 = dispatch_time(0, 30000000000);
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x6FC23AC00uLL);
    objc_initWeak(&location, self);
    id v9 = self->_requestTimeout;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100009718;
    v10[3] = &unk_10006CA48;
    objc_copyWeak(&v11, &location);
    dispatch_source_set_event_handler(v9, v10);
    dispatch_resume((dispatch_object_t)self->_requestTimeout);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)stopRequestTimeout
{
  requestTimeout = self->_requestTimeout;
  if (requestTimeout)
  {
    dispatch_source_cancel(requestTimeout);
    id v4 = self->_requestTimeout;
    self->_requestTimeout = 0;
  }
}

- (void)requestTimeoutDidFire
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  dispatch_time_t v3 = [(BMRapportRequest *)self requestTimeoutHandler];

  if (v3)
  {
    id v4 = [(BMRapportRequest *)self requestTimeoutHandler];
    v4[2]();
  }
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (OS_xpc_object)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
}

- (id)requestBlock
{
  return self->_requestBlock;
}

- (void)setRequestBlock:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (NSSet)deliveredToDevices
{
  return &self->_deliveredToDevices->super;
}

- (void)setDeliveredToDevices:(id)a3
{
}

- (NSSet)inFlightToDevices
{
  return &self->_inFlightToDevices->super;
}

- (void)setInFlightToDevices:(id)a3
{
}

- (NSDictionary)errorFromDevice
{
  return &self->_errorFromDevice->super;
}

- (void)setErrorFromDevice:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_source)requestTimeout
{
  return self->_requestTimeout;
}

- (void)setRequestTimeout:(id)a3
{
}

- (id)requestTimeoutHandler
{
  return self->_requestTimeoutHandler;
}

- (void)setRequestTimeoutHandler:(id)a3
{
}

- (BMSyncSessionContext)sessionContext
{
  return self->_sessionContext;
}

- (void)setSessionContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionContext, 0);
  objc_storeStrong(&self->_requestTimeoutHandler, 0);
  objc_storeStrong((id *)&self->_requestTimeout, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong(&self->_requestBlock, 0);
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_errorFromDevice, 0);
  objc_storeStrong((id *)&self->_inFlightToDevices, 0);
  objc_storeStrong((id *)&self->_deliveredToDevices, 0);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end