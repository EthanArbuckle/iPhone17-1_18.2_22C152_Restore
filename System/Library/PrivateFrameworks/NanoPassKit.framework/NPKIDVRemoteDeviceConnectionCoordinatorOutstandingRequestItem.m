@interface NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem
- (NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem)initWithtimeoutQueue:(id)a3;
- (NSString)messageIdentifier;
- (id)completion;
- (id)errorHandler;
- (id)timeoutHandler;
- (void)dealloc;
- (void)invalidateCleanupTimer;
- (void)setCompletion:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setMessageIdentifier:(id)a3;
- (void)setOrResetCleanupTimer;
- (void)setTimeoutHandler:(id)a3;
@end

@implementation NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem

- (NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem)initWithtimeoutQueue:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem;
  v6 = [(NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_timeoutQueue, a3);
  }

  return v7;
}

- (void)dealloc
{
  [(NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *)self invalidateCleanupTimer];
  v3.receiver = self;
  v3.super_class = (Class)NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem;
  [(NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *)&v3 dealloc];
}

- (void)setOrResetCleanupTimer
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  objc_super v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      messageIdentifier = self->_messageIdentifier;
      *(_DWORD *)buf = 138412290;
      v14 = messageIdentifier;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: NPKIDVRemoteDeviceService: Setting or resetting cleanup timer for message with identifier %@", buf, 0xCu);
    }
  }
  [(NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem *)self invalidateCleanupTimer];
  v7 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_timeoutQueue);
  dispatch_time_t v8 = dispatch_time(0, 30000000000);
  dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  objc_initWeak((id *)buf, self);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __87__NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem_setOrResetCleanupTimer__block_invoke;
  handler[3] = &unk_2644D29A8;
  objc_copyWeak(&v12, (id *)buf);
  dispatch_source_set_event_handler(v7, handler);
  timeoutTimer = self->_timeoutTimer;
  self->_timeoutTimer = (OS_dispatch_source *)v7;
  v10 = v7;

  dispatch_resume(v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __87__NPKIDVRemoteDeviceConnectionCoordinatorOutstandingRequestItem_setOrResetCleanupTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v3 = *((void *)WeakRetained + 6);
    if (v3)
    {
      BOOL v4 = v2;
      (*(void (**)(void))(v3 + 16))();
      v2 = v4;
    }
  }
}

- (void)invalidateCleanupTimer
{
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel(timeoutTimer);
    BOOL v4 = self->_timeoutTimer;
    self->_timeoutTimer = 0;
  }
}

- (NSString)messageIdentifier
{
  return self->_messageIdentifier;
}

- (void)setMessageIdentifier:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)timeoutHandler
{
  return self->_timeoutHandler;
}

- (void)setTimeoutHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_timeoutHandler, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_messageIdentifier, 0);
  objc_storeStrong((id *)&self->_timeoutQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
}

@end