@interface NFMIDSServiceDelegate
- (NFMIDSServiceDelegate)init;
- (NSMutableDictionary)inflightMessages;
- (NSMutableDictionary)pendingMessages;
- (id)_sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7;
- (id)sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9;
- (void)_enqueueMessage:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9 idsIdentifier:(id)a10;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7;
- (void)setInflightMessages:(id)a3;
- (void)setPendingMessages:(id)a3;
@end

@implementation NFMIDSServiceDelegate

void __77__NFMIDSServiceDelegate_service_account_identifier_didSendWithSuccess_error___block_invoke(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  v2 = nfm_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    int v10 = 138412802;
    v11 = v3;
    __int16 v12 = 2112;
    uint64_t v13 = v4;
    __int16 v14 = 2112;
    uint64_t v15 = v5;
    _os_log_impl(&dword_24011F000, v2, OS_LOG_TYPE_DEFAULT, "########### Firing fallback message ID: %@ (%@ -- %@)", (uint8_t *)&v10, 0x20u);
  }

  v6 = [*(id *)(a1[7] + 16) objectForKey:a1[4]];
  v7 = nfm_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_24011F000, v7, OS_LOG_TYPE_DEFAULT, "########### Firing messageInstance %@", (uint8_t *)&v10, 0xCu);
  }

  if (v6)
  {
    v8 = [v6 retryAction];

    if (v8)
    {
      [*(id *)(a1[7] + 8) setObject:v6 forKey:a1[4]];
      v9 = [v6 retryAction];
      v9[2]();
    }
  }
}

- (NFMIDSServiceDelegate)init
{
  v8.receiver = self;
  v8.super_class = (Class)NFMIDSServiceDelegate;
  v2 = [(NFMIDSServiceDelegate *)&v8 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    inflightMessages = v2->_inflightMessages;
    v2->_inflightMessages = v3;

    uint64_t v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    pendingMessages = v2->_pendingMessages;
    v2->_pendingMessages = v5;
  }
  return v2;
}

- (id)_sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = a4;
  __int16 v14 = nfm_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    int v23 = 60;
    __int16 v24 = 2080;
    v25 = "-[NFMIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]";
    _os_log_impl(&dword_24011F000, v14, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __91__NFMIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke;
  v19[3] = &unk_26509BDC8;
  id v20 = v12;
  id v21 = v11;
  id v15 = v11;
  id v16 = v12;
  v17 = NFMProtoSend(v13, v15, a5, v16, v7, v19);

  return v17;
}

void __91__NFMIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = nfm_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __91__NFMIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke_cold_1(a1, (uint64_t)v3, v4);
  }
}

- (void)_enqueueMessage:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9 idsIdentifier:(id)a10
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v17 = a3;
  id v18 = a4;
  id v19 = a6;
  id v20 = a10;
  id v21 = nfm_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    id buf = (id)0x4604000202;
    __int16 v39 = 2080;
    v40 = "-[NFMIDSServiceDelegate _enqueueMessage:service:priority:responseIdentifier:expectsResponse:retryCount:retryIn"
          "terval:idsIdentifier:]";
    _os_log_impl(&dword_24011F000, v21, OS_LOG_TYPE_DEFAULT, "%d %s", (uint8_t *)&buf, 0x12u);
  }

  objc_initWeak(&buf, self);
  uint64_t v29 = MEMORY[0x263EF8330];
  uint64_t v30 = 3221225472;
  v31 = __132__NFMIDSServiceDelegate__enqueueMessage_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval_idsIdentifier___block_invoke;
  v32 = &unk_26509BDF0;
  objc_copyWeak(v36, &buf);
  id v22 = v17;
  id v33 = v22;
  id v23 = v18;
  id v34 = v23;
  v36[1] = (id)a5;
  id v24 = v19;
  id v35 = v24;
  BOOL v37 = a7;
  v25 = (void *)MEMORY[0x2455DE870](&v29);
  inflightMessages = self->_inflightMessages;
  double v27 = 0.0;
  if (a9 >= 0.0) {
    double v27 = a9;
  }
  id v28 = +[NFMIDSMessageInstance newMessageInstanceWithAction:retryCount:retryInterval:](NFMIDSMessageInstance, "newMessageInstanceWithAction:retryCount:retryInterval:", v25, a8 & ~(a8 >> 63), v27, v29, v30, v31, v32);
  [(NSMutableDictionary *)inflightMessages setObject:v28 forKey:v20];

  objc_destroyWeak(v36);
  objc_destroyWeak(&buf);
}

void __132__NFMIDSServiceDelegate__enqueueMessage_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval_idsIdentifier___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v2 = (id)[WeakRetained _sendProtoBuf:*(void *)(a1 + 32) service:*(void *)(a1 + 40) priority:*(void *)(a1 + 64) responseIdentifier:*(void *)(a1 + 48) expectsResponse:*(unsigned __int8 *)(a1 + 72)];
}

- (id)sendProtoBuf:(id)a3 service:(id)a4 priority:(int64_t)a5 responseIdentifier:(id)a6 expectsResponse:(BOOL)a7 retryCount:(int64_t)a8 retryInterval:(double)a9
{
  BOOL v11 = a7;
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = nfm_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109378;
    int v34 = 80;
    __int16 v35 = 2080;
    v36 = "-[NFMIDSServiceDelegate sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:]";
    _os_log_impl(&dword_24011F000, v19, OS_LOG_TYPE_DEFAULT, "%d %s", buf, 0x12u);
  }

  uint64_t v20 = [(NFMIDSServiceDelegate *)self _sendProtoBuf:v16 service:v17 priority:a5 responseIdentifier:v18 expectsResponse:v11];
  id v21 = (void *)v20;
  if (v20)
  {
    [(NFMIDSServiceDelegate *)self _enqueueMessage:v16 service:v17 priority:a5 responseIdentifier:v18 expectsResponse:v11 retryCount:a8 retryInterval:a9 idsIdentifier:v20];
  }
  else
  {
    id v22 = nfm_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      -[NFMIDSServiceDelegate sendProtoBuf:service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:](v22);
    }

    dispatch_time_t v23 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __115__NFMIDSServiceDelegate_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval___block_invoke;
    block[3] = &unk_26509BE18;
    block[4] = self;
    id v26 = v16;
    id v27 = v17;
    int64_t v29 = a5;
    BOOL v32 = v11;
    id v28 = v18;
    int64_t v30 = a8;
    double v31 = a9;
    dispatch_after(v23, MEMORY[0x263EF83A0], block);
  }
  return v21;
}

uint64_t __115__NFMIDSServiceDelegate_sendProtoBuf_service_priority_responseIdentifier_expectsResponse_retryCount_retryInterval___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _sendProtoBuf:*(void *)(a1 + 40) service:*(void *)(a1 + 48) priority:*(void *)(a1 + 64) responseIdentifier:*(void *)(a1 + 56) expectsResponse:*(unsigned __int8 *)(a1 + 88)];
  if (v2) {
    [*(id *)(a1 + 32) _enqueueMessage:*(void *)(a1 + 40) service:*(void *)(a1 + 48) priority:*(void *)(a1 + 64) responseIdentifier:*(void *)(a1 + 56) expectsResponse:*(unsigned __int8 *)(a1 + 88) retryCount:*(void *)(a1 + 72) retryInterval:*(double *)(a1 + 80) idsIdentifier:v2];
  }
  return MEMORY[0x270F9A758]();
}

- (void)service:(id)a3 account:(id)a4 incomingUnhandledProtobuf:(id)a5 fromID:(id)a6 context:(id)a7
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v9 = a5;
  id v10 = a6;
  id v11 = a7;
  id v12 = nfm_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    int v13 = 138413058;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v10;
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 1024;
    int v20 = [v9 type];
    _os_log_error_impl(&dword_24011F000, v12, OS_LOG_TYPE_ERROR, "########### incomingUnhandledProtobuf: %@ from: %@ context: %@ type: %d", (uint8_t *)&v13, 0x26u);
  }
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  uint64_t v36 = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = nfm_log();
  __int16 v17 = v16;
  if (v15 || !a6)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)id buf = 138413058;
      id v29 = v14;
      __int16 v30 = 2112;
      id v31 = v12;
      __int16 v32 = 2112;
      id v33 = v13;
      __int16 v34 = 2112;
      id v35 = v15;
      _os_log_error_impl(&dword_24011F000, v17, OS_LOG_TYPE_ERROR, "########### Failed to send message ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
    }

    id v18 = [(NSMutableDictionary *)self->_inflightMessages objectForKey:v14];
    if ([v18 retryCount] < 1)
    {
      if (!v18)
      {
LABEL_16:

        goto LABEL_17;
      }
      id v22 = nfm_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)id buf = 138413058;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v12;
        __int16 v32 = 2112;
        id v33 = v13;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_error_impl(&dword_24011F000, v22, OS_LOG_TYPE_ERROR, "########### Failed fallback attempt(s) for message ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
      }
    }
    else
    {
      __int16 v19 = nfm_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id buf = 138413058;
        id v29 = v14;
        __int16 v30 = 2112;
        id v31 = v12;
        __int16 v32 = 2112;
        id v33 = v13;
        __int16 v34 = 2112;
        id v35 = v15;
        _os_log_impl(&dword_24011F000, v19, OS_LOG_TYPE_DEFAULT, "########### Attempt fallback message send for ID: %@ (%@ -- %@) Error: %@", buf, 0x2Au);
      }

      [(NSMutableDictionary *)self->_inflightMessages removeObjectForKey:v14];
      objc_msgSend(v18, "setRetryCount:", objc_msgSend(v18, "retryCount") - 1);
      [(NSMutableDictionary *)self->_pendingMessages setObject:v18 forKey:v14];
      [v18 retryInterval];
      dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v20 * 1000000000.0));
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __77__NFMIDSServiceDelegate_service_account_identifier_didSendWithSuccess_error___block_invoke;
      v23[3] = &unk_26509BE40;
      id v24 = v14;
      id v25 = v12;
      id v26 = v13;
      id v27 = self;
      dispatch_after(v21, MEMORY[0x263EF83A0], v23);

      id v22 = v24;
    }

    goto LABEL_16;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 138412290;
    id v29 = v14;
    _os_log_impl(&dword_24011F000, v17, OS_LOG_TYPE_DEFAULT, "########### Success Sending Message ID: %@", buf, 0xCu);
  }

  [(NSMutableDictionary *)self->_inflightMessages removeObjectForKey:v14];
  [(NSMutableDictionary *)self->_pendingMessages removeObjectForKey:v14];
LABEL_17:
}

- (NSMutableDictionary)inflightMessages
{
  return self->_inflightMessages;
}

- (void)setInflightMessages:(id)a3
{
}

- (NSMutableDictionary)pendingMessages
{
  return self->_pendingMessages;
}

- (void)setPendingMessages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingMessages, 0);
  objc_storeStrong((id *)&self->_inflightMessages, 0);
}

void __91__NFMIDSServiceDelegate__sendProtoBuf_service_priority_responseIdentifier_expectsResponse___block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v3 = @"Response ";
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  int v6 = 138413314;
  if (!v4) {
    id v3 = &stru_26F3F4318;
  }
  BOOL v7 = v3;
  __int16 v8 = 1024;
  int v9 = 62;
  __int16 v10 = 2080;
  id v11 = "-[NFMIDSServiceDelegate _sendProtoBuf:service:priority:responseIdentifier:expectsResponse:]_block_invoke";
  __int16 v12 = 2112;
  uint64_t v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = a2;
  _os_log_error_impl(&dword_24011F000, log, OS_LOG_TYPE_ERROR, "########### Failed to send IDS %@Protobuf (%d %s) -- %@ (Error: %@)", (uint8_t *)&v6, 0x30u);
}

- (void)sendProtoBuf:(os_log_t)log service:priority:responseIdentifier:expectsResponse:retryCount:retryInterval:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_24011F000, log, OS_LOG_TYPE_ERROR, "########### idsIdentifier was nil on first attempt", v1, 2u);
}

@end