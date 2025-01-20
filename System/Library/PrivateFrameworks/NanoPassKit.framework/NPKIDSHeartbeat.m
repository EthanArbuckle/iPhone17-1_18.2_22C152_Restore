@interface NPKIDSHeartbeat
- (IDSProtobuf)pendingStatusProtobuf;
- (IDSService)service;
- (NPKIDSHeartbeat)initWithPendingStatusProtobuf:(id)a3 service:(id)a4 priority:(int64_t)a5 maxUpdates:(unint64_t)a6 responseIdentifier:(id)a7 sendOptions:(id)a8 queue:(id)a9;
- (NPKIDSHeartbeat)initWithPendingStatusProtobuf:(id)a3 service:(id)a4 priority:(int64_t)a5 maxUpdates:(unint64_t)a6 responseIdentifier:(id)a7 sendOptions:(id)a8 queue:(id)a9 updateInterval:(double)a10;
- (NSDictionary)sendOptions;
- (NSString)responseIdentifier;
- (OS_dispatch_queue)queue;
- (OS_dispatch_source)statusTimer;
- (int64_t)messagePriority;
- (unint64_t)maxUpdates;
- (unint64_t)updatesSent;
- (void)_sendHeartbeat;
- (void)dealloc;
- (void)invalidate;
- (void)setMaxUpdates:(unint64_t)a3;
- (void)setMessagePriority:(int64_t)a3;
- (void)setPendingStatusProtobuf:(id)a3;
- (void)setQueue:(id)a3;
- (void)setResponseIdentifier:(id)a3;
- (void)setSendOptions:(id)a3;
- (void)setService:(id)a3;
- (void)setStatusTimer:(id)a3;
- (void)setUpdatesSent:(unint64_t)a3;
@end

@implementation NPKIDSHeartbeat

- (NPKIDSHeartbeat)initWithPendingStatusProtobuf:(id)a3 service:(id)a4 priority:(int64_t)a5 maxUpdates:(unint64_t)a6 responseIdentifier:(id)a7 sendOptions:(id)a8 queue:(id)a9
{
  return -[NPKIDSHeartbeat initWithPendingStatusProtobuf:service:priority:maxUpdates:responseIdentifier:sendOptions:queue:updateInterval:](self, "initWithPendingStatusProtobuf:service:priority:maxUpdates:responseIdentifier:sendOptions:queue:updateInterval:", a3, a4, a5, a6, a7, a8, 0.0);
}

- (NPKIDSHeartbeat)initWithPendingStatusProtobuf:(id)a3 service:(id)a4 priority:(int64_t)a5 maxUpdates:(unint64_t)a6 responseIdentifier:(id)a7 sendOptions:(id)a8 queue:(id)a9 updateInterval:(double)a10
{
  uint64_t v51 = *MEMORY[0x263EF8340];
  id v41 = a3;
  id v40 = a4;
  id v39 = a7;
  id v18 = a8;
  id v19 = a9;
  v44.receiver = self;
  v44.super_class = (Class)NPKIDSHeartbeat;
  v20 = [(NPKIDSHeartbeat *)&v44 init];
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_pendingStatusProtobuf, a3);
    objc_storeStrong((id *)&v21->_service, a4);
    v21->_messagePriority = a5;
    objc_storeStrong((id *)&v21->_responseIdentifier, a7);
    uint64_t v22 = objc_msgSend(v18, "copy", v39, v40, v41);
    sendOptions = v21->_sendOptions;
    v21->_sendOptions = (NSDictionary *)v22;

    objc_storeStrong((id *)&v21->_queue, a9);
    v21->_updatesSent = 0;
    v21->_maxUpdates = a6;
    dispatch_source_t v24 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)v21->_queue);
    statusTimer = v21->_statusTimer;
    v21->_statusTimer = (OS_dispatch_source *)v24;

    if (a10 <= 0.0) {
      uint64_t v26 = 30000000000;
    }
    else {
      uint64_t v26 = (uint64_t)(a10 * 1000000000.0);
    }
    v27 = v21->_statusTimer;
    dispatch_time_t v28 = dispatch_time(0, v26);
    dispatch_source_set_timer(v27, v28, v26, 0);
    v29 = v21->_statusTimer;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __129__NPKIDSHeartbeat_initWithPendingStatusProtobuf_service_priority_maxUpdates_responseIdentifier_sendOptions_queue_updateInterval___block_invoke;
    handler[3] = &unk_2644D2910;
    v30 = v21;
    v43 = v30;
    dispatch_source_set_event_handler(v29, handler);
    dispatch_resume((dispatch_object_t)v21->_statusTimer);
    v31 = pk_Payment_log();
    BOOL v32 = os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT);

    if (v32)
    {
      v33 = pk_Payment_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        v34 = [(NPKIDSHeartbeat *)v30 service];
        v35 = [(NPKIDSHeartbeat *)v30 pendingStatusProtobuf];
        int v36 = [v35 type];
        v37 = [(NPKIDSHeartbeat *)v30 responseIdentifier];
        *(_DWORD *)buf = 138412802;
        v46 = v34;
        __int16 v47 = 1024;
        int v48 = v36;
        __int16 v49 = 2112;
        v50 = v37;
        _os_log_impl(&dword_21E92F000, v33, OS_LOG_TYPE_DEFAULT, "Notice: Started providing periodic updates:\n\tservice: %@\n\tmessage type: %u\n\tresponse identifier: %@", buf, 0x1Cu);
      }
    }
  }
  return v21;
}

uint64_t __129__NPKIDSHeartbeat_initWithPendingStatusProtobuf_service_priority_maxUpdates_responseIdentifier_sendOptions_queue_updateInterval___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _sendHeartbeat];
}

- (void)invalidate
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(NPKIDSHeartbeat *)self responseIdentifier];
      int v9 = 138412290;
      v10 = v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Provisioning service agent status updater invalidating: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v7 = [(NPKIDSHeartbeat *)self statusTimer];
  v8 = v7;
  if (v7)
  {
    dispatch_source_cancel(v7);
    [(NPKIDSHeartbeat *)self setStatusTimer:0];
  }
}

- (void)dealloc
{
  [(NPKIDSHeartbeat *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)NPKIDSHeartbeat;
  [(NPKIDSHeartbeat *)&v3 dealloc];
}

- (void)_sendHeartbeat
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = pk_Payment_log();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    v5 = pk_Payment_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = [(NPKIDSHeartbeat *)self responseIdentifier];
      *(_DWORD *)buf = 138412290;
      unint64_t v25 = (unint64_t)v6;
      _os_log_impl(&dword_21E92F000, v5, OS_LOG_TYPE_DEFAULT, "Notice: Sending heartbeat for response identifer: %@", buf, 0xCu);
    }
  }
  v7 = [MEMORY[0x263EFF9A0] dictionary];
  v8 = [(NPKIDSHeartbeat *)self sendOptions];

  if (v8)
  {
    int v9 = [(NPKIDSHeartbeat *)self sendOptions];
    [v7 addEntriesFromDictionary:v9];
  }
  v10 = [(NPKIDSHeartbeat *)self responseIdentifier];

  if (v10)
  {
    uint64_t v11 = [(NPKIDSHeartbeat *)self responseIdentifier];
    [v7 setObject:v11 forKey:*MEMORY[0x263F49F60]];
  }
  v12 = [(NPKIDSHeartbeat *)self service];
  v13 = [(NPKIDSHeartbeat *)self pendingStatusProtobuf];
  uint64_t v14 = [(NPKIDSHeartbeat *)self messagePriority];
  v15 = [(NPKIDSHeartbeat *)self responseIdentifier];
  v23[0] = MEMORY[0x263EF8330];
  v23[1] = 3221225472;
  v23[2] = __33__NPKIDSHeartbeat__sendHeartbeat__block_invoke;
  v23[3] = &unk_2644D29D0;
  v23[4] = self;
  id v16 = NPKProtoSendWithOptions(v12, v13, v14, v15, 0, v23, v7);

  [(NPKIDSHeartbeat *)self setUpdatesSent:[(NPKIDSHeartbeat *)self updatesSent] + 1];
  unint64_t v17 = [(NPKIDSHeartbeat *)self updatesSent];
  if (v17 >= [(NPKIDSHeartbeat *)self maxUpdates])
  {
    id v18 = pk_Payment_log();
    BOOL v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);

    if (v19)
    {
      v20 = pk_Payment_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t v21 = [(NPKIDSHeartbeat *)self maxUpdates];
        uint64_t v22 = [(NPKIDSHeartbeat *)self responseIdentifier];
        *(_DWORD *)buf = 134218242;
        unint64_t v25 = v21;
        __int16 v26 = 2112;
        v27 = v22;
        _os_log_impl(&dword_21E92F000, v20, OS_LOG_TYPE_DEFAULT, "Warning: Reached limit of %lu heartbeats for response identifier %@; will not send further updates.",
          buf,
          0x16u);
      }
    }
    [(NPKIDSHeartbeat *)self invalidate];
  }
}

void __33__NPKIDSHeartbeat__sendHeartbeat__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v2 = pk_Payment_log();
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_ERROR);

  if (v3)
  {
    BOOL v4 = pk_Payment_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = [*(id *)(a1 + 32) service];
      v6 = [*(id *)(a1 + 32) pendingStatusProtobuf];
      int v7 = [v6 type];
      v8 = [*(id *)(a1 + 32) responseIdentifier];
      int v9 = 138412802;
      v10 = v5;
      __int16 v11 = 1024;
      int v12 = v7;
      __int16 v13 = 2112;
      uint64_t v14 = v8;
      _os_log_impl(&dword_21E92F000, v4, OS_LOG_TYPE_ERROR, "Error: Not able to send heartbeat:\n\tservice: %@\n\tmessage type: %u\n\tresponse identifier: %@", (uint8_t *)&v9, 0x1Cu);
    }
  }
}

- (IDSService)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
}

- (IDSProtobuf)pendingStatusProtobuf
{
  return self->_pendingStatusProtobuf;
}

- (void)setPendingStatusProtobuf:(id)a3
{
}

- (int64_t)messagePriority
{
  return self->_messagePriority;
}

- (void)setMessagePriority:(int64_t)a3
{
  self->_messagePriority = a3;
}

- (NSString)responseIdentifier
{
  return self->_responseIdentifier;
}

- (void)setResponseIdentifier:(id)a3
{
}

- (OS_dispatch_source)statusTimer
{
  return self->_statusTimer;
}

- (void)setStatusTimer:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSDictionary)sendOptions
{
  return self->_sendOptions;
}

- (void)setSendOptions:(id)a3
{
}

- (unint64_t)updatesSent
{
  return self->_updatesSent;
}

- (void)setUpdatesSent:(unint64_t)a3
{
  self->_updatesSent = a3;
}

- (unint64_t)maxUpdates
{
  return self->_maxUpdates;
}

- (void)setMaxUpdates:(unint64_t)a3
{
  self->_maxUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sendOptions, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_statusTimer, 0);
  objc_storeStrong((id *)&self->_responseIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingStatusProtobuf, 0);
  objc_storeStrong((id *)&self->_service, 0);
}

@end