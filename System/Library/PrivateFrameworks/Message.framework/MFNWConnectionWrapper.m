@interface MFNWConnectionWrapper
+ (id)log;
- (BOOL)_connectToEndpoint:(id)a3 service:(id)a4;
- (BOOL)allowsTrustPrompt;
- (BOOL)connectToHost:(id)a3 withPort:(unsigned int)a4 service:(id)a5;
- (BOOL)disableEphemeralDiffieHellmanCiphers;
- (BOOL)isCellularConnection;
- (BOOL)isConstrained;
- (BOOL)isNonAppInitiated;
- (BOOL)isReadable;
- (BOOL)isValid;
- (BOOL)isWritable;
- (BOOL)setSecurityProtocol:(id)a3;
- (BOOL)usesOpportunisticSockets;
- (MFNWConnectionWrapper)init;
- (NSArray)clientCertificates;
- (NSError)error;
- (NSString)accountIdentifier;
- (NSString)connectionServiceType;
- (NSString)description;
- (NSString)networkAccountIdentifier;
- (NSString)remoteHostname;
- (NSString)service;
- (NSString)sourceApplicationBundleIdentifier;
- (id)_createConnectionWithEndpoint:(id)a3 error:(int *)a4;
- (id)_negotiatedSecurityProtocol;
- (id)bytesAvailableHandler;
- (id)networkActivityChangeBlock;
- (id)securityProtocol;
- (id)serverTrustHandler;
- (int64_t)readBytesIntoBuffer:(char *)a3 maxLength:(unint64_t)a4;
- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4;
- (unsigned)remotePortNumber;
- (unsigned)timeout;
- (void)_closeWithError:(id)a3;
- (void)_closeWithErrorDomain:(id)a3 code:(int64_t)a4;
- (void)_configureTLS:(id)a3;
- (void)_handleConnectionFailure:(int)a3;
- (void)_handleConnectionReady;
- (void)_networkActivityEnded;
- (void)_networkActivityStarted;
- (void)_scheduleNextRead;
- (void)cancel;
- (void)close;
- (void)dealloc;
- (void)enableThroughputMonitoring:(BOOL)a3;
- (void)registerForBytesAvailableWithHandler:(id)a3;
- (void)setAccountIdentifier:(id)a3;
- (void)setAllowsTrustPrompt:(BOOL)a3;
- (void)setBytesAvailableHandler:(id)a3;
- (void)setClientCertificates:(id)a3;
- (void)setConnectionServiceType:(id)a3;
- (void)setDisableEphemeralDiffieHellmanCiphers:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setIsNonAppInitiated:(BOOL)a3;
- (void)setNetworkAccountIdentifier:(id)a3;
- (void)setNetworkActivityChangeBlock:(id)a3;
- (void)setServerTrustHandler:(id)a3;
- (void)setSourceApplicationBundleIdentifier:(id)a3;
- (void)setTimeout:(unsigned int)a3;
- (void)setUsesOpportunisticSockets:(BOOL)a3;
- (void)startActivity;
- (void)stopActivity;
- (void)unregisterForBytesAvailable;
@end

@implementation MFNWConnectionWrapper

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__MFNWConnectionWrapper_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_25 != -1) {
    dispatch_once(&log_onceToken_25, block);
  }
  v2 = (void *)log_log_25;
  return v2;
}

void __28__MFNWConnectionWrapper_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_25;
  log_log_25 = (uint64_t)v1;
}

- (MFNWConnectionWrapper)init
{
  v11.receiver = self;
  v11.super_class = (Class)MFNWConnectionWrapper;
  v2 = [(MFNWConnectionWrapper *)&v11 init];
  if (v2)
  {
    id v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.mail.connection", v3);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F28BB8]) initWithCondition:0];
    readBufferLock = v2->_readBufferLock;
    v2->_readBufferLock = (NSConditionLock *)v6;

    dispatch_group_t v8 = dispatch_group_create();
    writeGroup = v2->_writeGroup;
    v2->_writeGroup = (OS_dispatch_group *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_timeout = 60;
  }
  return v2;
}

- (void)dealloc
{
  [(MFNWConnectionWrapper *)self close];
  v3.receiver = self;
  v3.super_class = (Class)MFNWConnectionWrapper;
  [(MFNWConnectionWrapper *)&v3 dealloc];
}

- (void)cancel
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  objc_super v3 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    uint64_t v6 = self;
    _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_DEFAULT, "Connection cancelled: %@", (uint8_t *)&v5, 0xCu);
  }

  dispatch_queue_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
  [(MFNWConnectionWrapper *)self _closeWithError:v4];
}

- (BOOL)connectToHost:(id)a3 withPort:(unsigned int)a4 service:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = v8;
  objc_super v11 = (const char *)[v10 UTF8String];
  objc_msgSend(NSString, "stringWithFormat:", @"%u", v6);
  id v12 = objc_claimAutoreleasedReturnValue();
  nw_endpoint_t host = nw_endpoint_create_host(v11, (const char *)[v12 UTF8String]);

  if (host)
  {
    BOOL v14 = [(MFNWConnectionWrapper *)self _connectToEndpoint:host service:v9];
  }
  else
  {
    uint64_t v15 = *__error();
    v16 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      -[MFNWConnectionWrapper connectToHost:withPort:service:]();
    }

    [(MFNWConnectionWrapper *)self _closeWithErrorDomain:*MEMORY[0x1E4F28798] code:v15];
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_connectToEndpoint:(id)a3 service:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  id v7 = a4;
  int v31 = 0;
  id v8 = [(MFNWConnectionWrapper *)self _createConnectionWithEndpoint:v6 error:&v31];
  if (!v8)
  {
    v20 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v21 = [NSString stringWithUTF8String:nw_endpoint_get_hostname(v6)];
      [(MFNWConnectionWrapper *)v21 _connectToEndpoint:buf service:v20];
    }

    [(MFNWConnectionWrapper *)self _closeWithErrorDomain:*MEMORY[0x1E4F28798] code:v31];
    goto LABEL_27;
  }
  objc_storeStrong((id *)&self->_service, a4);
  objc_storeStrong((id *)&self->_connection, v8);
  nw_connection_set_queue(v8, (dispatch_queue_t)self->_queue);
  [MEMORY[0x1E4F608C8] attachCurrentActivityToConnection:v8];
  connection = self->_connection;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke;
  v30[3] = &unk_1E5D404C8;
  v30[4] = self;
  MEMORY[0x1AD0E3C30](connection, v30);
  v29[15] = MEMORY[0x1E4F143A8];
  v29[16] = 3221225472;
  v29[17] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11;
  v29[18] = &unk_1E5D3B5C0;
  v29[19] = self;
  nw_connection_set_cancel_handler();
  v29[10] = MEMORY[0x1E4F143A8];
  v29[11] = 3221225472;
  v29[12] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12;
  v29[13] = &unk_1E5D3B5C0;
  v29[14] = self;
  nw_connection_set_read_close_handler();
  v29[5] = MEMORY[0x1E4F143A8];
  v29[6] = 3221225472;
  v29[7] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13;
  v29[8] = &unk_1E5D3B5C0;
  v29[9] = self;
  nw_connection_set_write_close_handler();
  id v10 = self->_connection;
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_14;
  v29[3] = &unk_1E5D404F0;
  v29[4] = self;
  nw_connection_set_viability_changed_handler(v10, v29);
  objc_super v11 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  eventSemaphore = self->_eventSemaphore;
  self->_eventSemaphore = v11;

  if (!self->_eventSemaphore)
  {
    v22 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_INFO, "could not create event semaphore", buf, 2u);
    }

    [(MFNWConnectionWrapper *)self _closeWithErrorDomain:*MEMORY[0x1E4F28798] code:12];
    goto LABEL_27;
  }
  [(MFNWConnectionWrapper *)self _networkActivityStarted];
  double Current = CFAbsoluteTimeGetCurrent();
  BOOL v14 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [(MFNWConnectionWrapper *)self securityProtocol];
    *(_DWORD *)buf = 134218498;
    v33 = self;
    __int16 v34 = 2112;
    CFAbsoluteTime v35 = *(double *)&v6;
    __int16 v36 = 2112;
    v37 = v15;
    _os_log_impl(&dword_1A7EFF000, v14, OS_LOG_TYPE_DEFAULT, "opening connection %p to %@ (%@)", buf, 0x20u);
  }
  nw_connection_start(v8);
  v16 = self->_eventSemaphore;
  dispatch_time_t v17 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v16, v17))
  {
    [(MFNWConnectionWrapper *)self _networkActivityEnded];
    v18 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "opening connection %p timed out", buf, 0xCu);
    }
    uint64_t v19 = 60;
  }
  else
  {
    self->_connectTime = CFAbsoluteTimeGetCurrent();
    if (self->_connectionState == 3)
    {
      v23 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        CFAbsoluteTime v24 = CFAbsoluteTimeGetCurrent();
        *(_DWORD *)buf = 134218240;
        v33 = self;
        __int16 v34 = 2048;
        CFAbsoluteTime v35 = v24 - Current;
        _os_log_impl(&dword_1A7EFF000, v23, OS_LOG_TYPE_DEFAULT, "opening connection %p took %f seconds", buf, 0x16u);
      }

      v25 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = [(MFNWConnectionWrapper *)self _negotiatedSecurityProtocol];
        *(_DWORD *)buf = 134218242;
        v33 = self;
        __int16 v34 = 2114;
        CFAbsoluteTime v35 = *(double *)&v26;
        _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_INFO, "negotiated SSL version for connection %p is %{public}@", buf, 0x16u);
      }
      [(MFNWConnectionWrapper *)self _networkActivityEnded];
      [(MFNWConnectionWrapper *)self _scheduleNextRead];
      if (!v31)
      {
        BOOL v27 = 1;
        goto LABEL_28;
      }
      uint64_t v19 = 57;
      goto LABEL_26;
    }
    [(MFNWConnectionWrapper *)self _networkActivityEnded];
    v18 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = self;
      _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_DEFAULT, "connection %p failed to connect", buf, 0xCu);
    }
    uint64_t v19 = 57;
  }

LABEL_26:
  [(MFNWConnectionWrapper *)self _closeWithErrorDomain:*MEMORY[0x1E4F28798] code:v19];
LABEL_27:
  BOOL v27 = 0;
LABEL_28:

  return v27;
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v15 = 134218498;
      uint64_t v16 = v7;
      __int16 v17 = 2080;
      uint64_t v18 = nw_connection_state_to_string();
      __int16 v19 = 2112;
      id v20 = v5;
      _os_log_error_impl(&dword_1A7EFF000, v6, OS_LOG_TYPE_ERROR, "state for connection %p: %s (error: %@)", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    uint64_t v6 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = nw_connection_state_to_string();
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_2(v8, v9, (uint8_t *)&v15, v6);
    }
  }

  *(_DWORD *)(*(void *)(a1 + 32) + 24) = a2;
  uint64_t v10 = *(void *)(a1 + 32);
  if (!*(void *)(v10 + 48))
  {
    nw_endpoint_t v11 = nw_connection_copy_endpoint(*(nw_connection_t *)(v10 + 16));
    uint64_t v12 = *(void *)(a1 + 32);
    v13 = *(void **)(v12 + 48);
    *(void *)(v12 + 48) = v11;

    uint64_t v10 = *(void *)(a1 + 32);
  }
  if (*(void *)(v10 + 32))
  {
    if (a2 == 3)
    {
      [(id)v10 _handleConnectionReady];
    }
    else if ((a2 & 0xFFFFFFFE) == 4)
    {
      [(id)v10 _handleConnectionFailure:a2];
    }
  }
  else
  {
    BOOL v14 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_1();
    }
  }
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11(uint64_t a1)
{
  uint64_t v1 = a1 + 32;
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 32);
  objc_super v3 = +[MFNWConnectionWrapper log];
  dispatch_queue_t v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11_cold_2();
    }

    *(_DWORD *)(*(void *)v1 + 24) = 5;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)v1 + 32));
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_1();
    }
  }
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12_cold_1();
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
  nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1 + 32) + 16));
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13(uint64_t a1)
{
  uint64_t v2 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13_cold_1();
  }

  *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_14(uint64_t a1, char a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((a2 & 1) == 0)
  {
    objc_super v3 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 134217984;
      uint64_t v6 = v4;
      _os_log_impl(&dword_1A7EFF000, v3, OS_LOG_TYPE_INFO, "connection %p no longer viable", (uint8_t *)&v5, 0xCu);
    }

    *(unsigned char *)(*(void *)(a1 + 32) + 120) = 0;
    *(unsigned char *)(*(void *)(a1 + 32) + 121) = 0;
    nw_connection_cancel(*(nw_connection_t *)(*(void *)(a1 + 32) + 16));
  }
}

- (id)_createConnectionWithEndpoint:(id)a3 error:(int *)a4
{
  uint64_t v7 = a3;
  if (!v7)
  {
    v29 = [MEMORY[0x1E4F28B00] currentHandler];
    [v29 handleFailureInMethod:a2 object:self file:@"MFNWConnectionWrapper.m" lineNumber:240 description:@"endpoint is NULL!"];
  }
  uint64_t v8 = _Block_copy((const void *)*MEMORY[0x1E4F38C90]);
  securityProtocol = self->_securityProtocol;
  if (securityProtocol && ![(NSString *)securityProtocol isEqualToString:*MEMORY[0x1E4F1D4C0]])
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__MFNWConnectionWrapper__createConnectionWithEndpoint_error___block_invoke;
    aBlock[3] = &unk_1E5D40518;
    aBlock[4] = self;
    uint64_t v10 = _Block_copy(aBlock);

    uint64_t v8 = v10;
  }
  secure_tcp = nw_parameters_create_secure_tcp(v8, &__block_literal_global_52);
  if (!secure_tcp)
  {
    uint64_t v21 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:]();
    }

    if (!a4)
    {
      nw_connection_t v23 = 0;
      goto LABEL_37;
    }
    v22 = __error();
    nw_connection_t v23 = 0;
    goto LABEL_36;
  }
  uint64_t v12 = [(MFNWConnectionWrapper *)self networkAccountIdentifier];

  if (v12)
  {
    id v13 = [(MFNWConnectionWrapper *)self networkAccountIdentifier];
    [v13 UTF8String];
    nw_parameters_set_account_id();
  }
  BOOL v14 = [(MFNWConnectionWrapper *)self sourceApplicationBundleIdentifier];

  if (v14)
  {
    id v15 = [(MFNWConnectionWrapper *)self sourceApplicationBundleIdentifier];
    [v15 UTF8String];
    nw_parameters_set_source_application_by_bundle_id();
  }
  if ([(MFNWConnectionWrapper *)self isNonAppInitiated]) {
    nw_parameters_attribution_t v16 = nw_parameters_attribution_user;
  }
  else {
    nw_parameters_attribution_t v16 = nw_parameters_attribution_developer;
  }
  nw_parameters_set_attribution(secure_tcp, v16);
  __int16 v17 = [(MFNWConnectionWrapper *)self connectionServiceType];

  if (v17)
  {
    id v18 = [(MFNWConnectionWrapper *)self connectionServiceType];
    __int16 v19 = (const char *)[v18 UTF8String];

    if (!strncmp(v19, "kCTDataConnectionServiceType", 0x1CuLL))
    {
      id v20 = xpc_array_create(0, 0);
      xpc_object_t v24 = xpc_array_create(0, 0);
      v25 = v24;
      if (v20 && v24)
      {
        xpc_array_set_string(v20, 0xFFFFFFFFFFFFFFFFLL, "Cellular");
        xpc_array_set_string(v25, 0xFFFFFFFFFFFFFFFFLL, v19 + 28);
        nw_parameters_set_required_netagent_classes();
      }
      else
      {
        v26 = +[MFNWConnectionWrapper log];
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
          -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:]();
        }
      }
    }
    else
    {
      id v20 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:].cold.4();
      }
    }
  }
  nw_connection_t v23 = nw_connection_create(v7, secure_tcp);
  if (!v23)
  {
    BOOL v27 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      -[MFNWConnectionWrapper _createConnectionWithEndpoint:error:]();
    }

    if (a4)
    {
      v22 = __error();
LABEL_36:
      *a4 = *v22;
    }
  }
LABEL_37:

  return v23;
}

uint64_t __61__MFNWConnectionWrapper__createConnectionWithEndpoint_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _configureTLS:a2];
}

void __61__MFNWConnectionWrapper__createConnectionWithEndpoint_error___block_invoke_2(int a1, nw_protocol_options_t options)
{
}

- (void)_handleConnectionReady
{
  *(_WORD *)&self->_readable = 257;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_eventSemaphore);
}

- (void)_handleConnectionFailure:(int)a3
{
  if (a3 == 5)
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_eventSemaphore);
  }
  else if (a3 == 4)
  {
    nw_connection_cancel((nw_connection_t)self->_connection);
  }
}

- (void)_configureTLS:(id)a3
{
  uint64_t v4 = a3;
  int v5 = [(MFNWConnectionWrapper *)self clientCertificates];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    uint64_t v7 = [(MFNWConnectionWrapper *)self clientCertificates];
    uint64_t v8 = [v7 objectAtIndexedSubscript:0];
    sec_protocol_options_set_local_identity(v4, v8);
  }
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__MFNWConnectionWrapper__configureTLS___block_invoke;
  v9[3] = &unk_1E5D40560;
  objc_copyWeak(&v10, &location);
  sec_protocol_options_set_verify_block(v4, v9, (dispatch_queue_t)self->_queue);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __39__MFNWConnectionWrapper__configureTLS___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = a3;
  uint64_t v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained[24])
  {
    SecTrustRef v9 = sec_trust_copy_ref(v6);
    uint64_t v10 = (*(uint64_t (**)(void))(WeakRetained[24] + 16))();
    id v11 = 0;
    if (v11) {
      [WeakRetained setError:v11];
    }
    uint64_t v12 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = NSStringFromBOOL();
      __39__MFNWConnectionWrapper__configureTLS___block_invoke_cold_1(v13, buf, v12);
    }

    CFRelease(v9);
  }
  else
  {
    uint64_t v10 = 1;
  }
  v7[2](v7, v10);
}

- (id)_negotiatedSecurityProtocol
{
  connection = self->_connection;
  if (connection)
  {
    objc_super v3 = MEMORY[0x1AD0E3D70]();
    uint64_t v4 = nw_connection_copy_protocol_metadata(connection, v3);

    uint64_t negotiated_protocol_version = sec_protocol_metadata_get_negotiated_protocol_version(v4);
    if negotiated_protocol_version < 0xB && ((0x595u >> negotiated_protocol_version))
    {
      uint64_t v6 = off_1E5D40640[(int)negotiated_protocol_version];
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown-protocol-version(%d)", negotiated_protocol_version);
      uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void)_networkActivityStarted
{
  ECAssertNetworkActivityAllowed();
  objc_super v3 = [(MFNWConnectionWrapper *)self networkActivityChangeBlock];

  if (v3)
  {
    uint64_t v4 = [(MFNWConnectionWrapper *)self networkActivityChangeBlock];
    v4[2](v4, 1);
  }
}

- (void)_networkActivityEnded
{
  objc_super v3 = [(MFNWConnectionWrapper *)self networkActivityChangeBlock];

  if (v3)
  {
    uint64_t v4 = [(MFNWConnectionWrapper *)self networkActivityChangeBlock];
    v4[2](v4, 0);
  }
}

- (int64_t)writeBytes:(const char *)a3 length:(unint64_t)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x2020000000;
  uint64_t v24 = -1;
  uint64_t v7 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v26 = self;
    __int16 v27 = 2048;
    double v28 = *(double *)&a4;
    _os_log_impl(&dword_1A7EFF000, v7, OS_LOG_TYPE_INFO, "writeBytes on connection %p for %zu bytes", buf, 0x16u);
  }

  if (self->_connection && self->_writable)
  {
    [(MFNWConnectionWrapper *)self _networkActivityStarted];
    uint64_t v8 = dispatch_data_create(a3, a4, 0, 0);
    dispatch_group_enter((dispatch_group_t)self->_writeGroup);
    connection = self->_connection;
    uint64_t v10 = *MEMORY[0x1E4F38C60];
    completion[0] = MEMORY[0x1E4F143A8];
    completion[1] = 3221225472;
    completion[2] = __43__MFNWConnectionWrapper_writeBytes_length___block_invoke;
    completion[3] = &unk_1E5D40588;
    completion[4] = self;
    completion[5] = &v21;
    completion[6] = a4;
    nw_connection_send(connection, v8, v10, 0, completion);
    writeGroup = self->_writeGroup;
    dispatch_time_t v12 = dispatch_time(0, 1000000000 * self->_timeout);
    if (dispatch_group_wait(writeGroup, v12))
    {
      id v13 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        double connectTime = self->_connectTime;
        CFAbsoluteTime v19 = Current - connectTime;
        LODWORD(connectTime) = self->_timeout;
        *(_DWORD *)buf = 134218240;
        v26 = self;
        __int16 v27 = 2048;
        double v28 = v19 - (double)*(unint64_t *)&connectTime;
        _os_log_error_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_ERROR, "writeBytes: connection %p timed out (lifetime: %f seconds)", buf, 0x16u);
      }

      BOOL v14 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:60 userInfo:0];
      [(MFNWConnectionWrapper *)self setError:v14];
    }
    [(MFNWConnectionWrapper *)self _networkActivityEnded];
  }
  int64_t v15 = v22[3];
  _Block_object_dispose(&v21, 8);
  return v15;
}

void __43__MFNWConnectionWrapper_writeBytes_length___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __43__MFNWConnectionWrapper_writeBytes_length___block_invoke_cold_1();
    }
  }
  else
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a1[6];
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1[4] + 64));
}

- (int64_t)readBytesIntoBuffer:(char *)a3 maxLength:(unint64_t)a4
{
  uint64_t v7 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[MFNWConnectionWrapper readBytesIntoBuffer:maxLength:]();
  }

  if (!self->_connection || !self->_readable) {
    return -1;
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __55__MFNWConnectionWrapper_readBytesIntoBuffer_maxLength___block_invoke;
  aBlock[3] = &unk_1E5D405B0;
  aBlock[4] = self;
  void aBlock[5] = a4;
  aBlock[6] = a3;
  uint64_t v8 = _Block_copy(aBlock);
  [(MFNWConnectionWrapper *)self _networkActivityStarted];
  SecTrustRef v9 = (uint64_t (*)(void *, __CFString *, id *, double))v8[2];
  id v16 = 0;
  int64_t v10 = v9(v8, @"buffered", &v16, 0.0);
  id v11 = v16;
  if (v10 < 0)
  {
    [(MFNWConnectionWrapper *)self _scheduleNextRead];
    LODWORD(v12) = self->_timeout;
    id v15 = v11;
    int64_t v10 = ((uint64_t (*)(void *, __CFString *, id *, double))v8[2])(v8, @"scheduled read", &v15, (double)v12);
    id v13 = v15;

    id v11 = v13;
  }
  [(MFNWConnectionWrapper *)self _networkActivityEnded];
  if (v11) {
    [(MFNWConnectionWrapper *)self setError:v11];
  }

  return v10;
}

int64_t __55__MFNWConnectionWrapper_readBytesIntoBuffer_maxLength___block_invoke(uint64_t a1, void *a2, __CFError **a3, double a4)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  uint64_t v8 = *(void **)(*(void *)(a1 + 32) + 56);
  SecTrustRef v9 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:a4];
  LODWORD(v8) = [v8 lockWhenCondition:2 beforeDate:v9];

  if (v8)
  {
    int64_t v10 = *(void **)(*(void *)(a1 + 32) + 88);
    if (v10)
    {
      uint64_t v11 = [v10 length];
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)(a1 + 32);
      if (*(void *)(a1 + 40) >= v11 - *(void *)(v13 + 96)) {
        int64_t v14 = v11 - *(void *)(v13 + 96);
      }
      else {
        int64_t v14 = *(void *)(a1 + 40);
      }
      if (v14 >= 1)
      {
        memcpy(*(void **)(a1 + 48), (const void *)([*(id *)(v13 + 88) bytes] + *(void *)(*(void *)(a1 + 32) + 96)), v14);
        *(void *)(*(void *)(a1 + 32) + 96) += v14;
        uint64_t v15 = *(void *)(a1 + 32);
        if (*(void *)(v15 + 96) == v12)
        {
          *(void *)(v15 + 96) = 0;
          uint64_t v16 = *(void *)(a1 + 32);
          __int16 v17 = *(void **)(v16 + 88);
          *(void *)(v16 + 88) = 0;
        }
      }
      id v18 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        double v19 = *(double *)(a1 + 32);
        uint64_t v20 = *(void *)(*(void *)&v19 + 96);
        int v39 = 138544130;
        v40 = v7;
        __int16 v41 = 2048;
        double v42 = v19;
        __int16 v43 = 2048;
        int64_t v44 = v14;
        __int16 v45 = 2048;
        uint64_t v46 = v20;
        _os_log_impl(&dword_1A7EFF000, v18, OS_LOG_TYPE_INFO, "readBytes: returning %{public}@ data for connection %p (%lu bytes, new offset %lu)", (uint8_t *)&v39, 0x2Au);
      }

      uint64_t v21 = *(void *)(a1 + 32);
      if (!*(unsigned char *)(v21 + 72))
      {
        if ((v14 & 0x8000000000000000) == 0)
        {
          [*(id *)(v21 + 56) unlockWithCondition:2 * (*(void *)(v21 + 88) != 0)];
          *a3 = 0;
          goto LABEL_32;
        }
        goto LABEL_26;
      }
    }
    else
    {
      v25 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        double v26 = *(double *)(a1 + 32);
        int v39 = 138543618;
        v40 = v7;
        __int16 v41 = 2048;
        double v42 = v26;
        _os_log_impl(&dword_1A7EFF000, v25, OS_LOG_TYPE_INFO, "readBytes: no %{public}@ data to return for connection %p", (uint8_t *)&v39, 0x16u);
      }

      uint64_t v21 = *(void *)(a1 + 32);
      int64_t v14 = -1;
      if (!*(unsigned char *)(v21 + 72))
      {
LABEL_26:
        v30 = *(NSObject **)(v21 + 80);
        if (v30) {
          CFErrorRef v31 = nw_error_copy_cf_error(v30);
        }
        else {
          CFErrorRef v31 = 0;
        }
        [*(id *)(*(void *)(a1 + 32) + 56) unlockWithCondition:0];
        v32 = +[MFNWConnectionWrapper log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = *(double **)(a1 + 32);
          double Current = CFAbsoluteTimeGetCurrent();
          double v35 = *(double *)(*(void *)(a1 + 32) + 128);
          __int16 v36 = [(__CFError *)v31 ef_publicDescription];
          int v39 = 134218498;
          v40 = v33;
          __int16 v41 = 2048;
          double v42 = Current - v35 - a4;
          __int16 v43 = 2114;
          int64_t v44 = (int64_t)v36;
          _os_log_impl(&dword_1A7EFF000, v32, OS_LOG_TYPE_DEFAULT, "readBytes: connection %p signaled with no buffered data (lifetime: %f seconds): %{public}@", (uint8_t *)&v39, 0x20u);
        }
        v37 = v31;
        *a3 = v37;

        goto LABEL_32;
      }
    }
    [*(id *)(v21 + 56) unlockWithCondition:1];
    __int16 v27 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      double v28 = *(double **)(a1 + 32);
      CFAbsoluteTime v29 = CFAbsoluteTimeGetCurrent() - v28[16];
      int v39 = 134218240;
      v40 = v28;
      __int16 v41 = 2048;
      double v42 = v29;
      _os_log_impl(&dword_1A7EFF000, v27, OS_LOG_TYPE_DEFAULT, "readBytes: connection %p canceled with a still scheduled read (lifetime: ~%f seconds)", (uint8_t *)&v39, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "ef_cancelledError");
    *a3 = (__CFError *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 <= 0.0)
    {
      *a3 = 0;
    }
    else
    {
      v22 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v23 = *(double **)(a1 + 32);
        CFAbsoluteTime v24 = CFAbsoluteTimeGetCurrent() - v23[16] - a4;
        int v39 = 134218240;
        v40 = v23;
        __int16 v41 = 2048;
        double v42 = v24;
        _os_log_impl(&dword_1A7EFF000, v22, OS_LOG_TYPE_DEFAULT, "readBytes: connection %p timed out (lifetime: %f seconds)", (uint8_t *)&v39, 0x16u);
      }

      *a3 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:60 userInfo:0];
    }
    int64_t v14 = -1;
  }
LABEL_32:

  return v14;
}

- (void)_scheduleNextRead
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "connection %p NOT calling nw_connection_receive", v2, v3, v4, v5, v6);
}

void __42__MFNWConnectionWrapper__scheduleNextRead__block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = a2;
  id v9 = a5;
  int64_t v10 = (id *)(a1 + 32);
  [*(id *)(*(void *)(a1 + 32) + 56) lock];
  uint64_t v11 = *(void **)(a1 + 32);
  if (v11[11])
  {
    v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MFNWConnectionWrapper.m" lineNumber:502 description:@"nw_connection_receive: _buffer must be NULL"];

    uint64_t v11 = *v10;
  }
  if (v11[12])
  {
    double v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"MFNWConnectionWrapper.m" lineNumber:503 description:@"nw_connection_receive: _bufferOffset must be 0"];
  }
  if (v8)
  {
    size_t size = dispatch_data_get_size(v8);
    uint64_t v13 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      id v23 = *v10;
      CFAbsoluteTime v24 = NSStringFromBOOL();
      int v27 = 134218754;
      id v28 = v23;
      __int16 v29 = 2048;
      size_t v30 = size;
      __int16 v31 = 2112;
      v32 = v24;
      __int16 v33 = 2112;
      id v34 = v9;
      _os_log_debug_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEBUG, "nw_connection_receive (%p): length=%lu isComplete=%@ error=%@", (uint8_t *)&v27, 0x2Au);
    }
    objc_storeStrong((id *)*v10 + 11, a2);
    int64_t v14 = (void *)*((void *)*v10 + 10);
    *((void *)*v10 + 10) = 0;
  }
  else
  {
    uint64_t v15 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v16 = *v10;
      int v27 = 134218242;
      id v28 = v16;
      __int16 v29 = 2112;
      size_t v30 = (size_t)v9;
      _os_log_impl(&dword_1A7EFF000, v15, OS_LOG_TYPE_DEFAULT, "nw_connection_receive (%p): no content error=%@", (uint8_t *)&v27, 0x16u);
    }

    __int16 v17 = *v10;
    id v18 = v9;
    int64_t v14 = (void *)v17[10];
    v17[10] = v18;
  }

  *((unsigned char *)*v10 + 72) = 0;
  [*((id *)*v10 + 7) unlockWithCondition:2];
  if (v8)
  {
    double v19 = [*v10 bytesAvailableHandler];
    BOOL v20 = v19 == 0;

    if (!v20)
    {
      uint64_t v21 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __42__MFNWConnectionWrapper__scheduleNextRead__block_invoke_cold_1();
      }

      v22 = [*v10 bytesAvailableHandler];
      v22[2]();
    }
  }
}

- (void)_closeWithError:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(MFNWConnectionWrapper *)self setError:v4];
    uint64_t v5 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint8_t v6 = objc_msgSend(v4, "ef_publicDescription");
      int v15 = 134218242;
      id v16 = self;
      __int16 v17 = 2114;
      id v18 = v6;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "closing connection %p with error: %{public}@", (uint8_t *)&v15, 0x16u);
    }
  }
  else
  {
    uint64_t v5 = +[MFNWConnectionWrapper log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 134217984;
      id v16 = self;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "closing connection %p", (uint8_t *)&v15, 0xCu);
    }
  }

  os_unfair_lock_lock(&self->_lock);
  connection = self->_connection;
  if (connection) {
    MEMORY[0x1AD0E3C30](connection, &__block_literal_global_65_0);
  }
  if (self->_connectionState != 5)
  {
    uint64_t v8 = self->_connection;
    if (v8) {
      nw_connection_cancel(v8);
    }
    eventSemaphore = self->_eventSemaphore;
    if (eventSemaphore)
    {
      dispatch_time_t v10 = dispatch_time(0, 5000000000);
      intptr_t v11 = dispatch_semaphore_wait(eventSemaphore, v10);
      int connectionState = self->_connectionState;
      if (v11)
      {
        if (connectionState == 5)
        {
          uint64_t v13 = +[MFNWConnectionWrapper log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
            -[MFNWConnectionWrapper _closeWithError:]();
          }
LABEL_19:

          int64_t v14 = self->_connection;
          if (v14) {
            nw_connection_force_cancel(v14);
          }
          goto LABEL_21;
        }
      }
      else if (connectionState == 5)
      {
        goto LABEL_21;
      }
      uint64_t v13 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        -[MFNWConnectionWrapper _closeWithError:]();
      }
      goto LABEL_19;
    }
  }
LABEL_21:
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_closeWithErrorDomain:(id)a3 code:(int64_t)a4
{
  id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:a3 code:a4 userInfo:0];
  -[MFNWConnectionWrapper _closeWithError:](self, "_closeWithError:");
}

- (void)startActivity
{
}

- (void)stopActivity
{
}

- (void)close
{
}

- (id)securityProtocol
{
  if (self->_securityProtocol) {
    return self->_securityProtocol;
  }
  else {
    return (id)*MEMORY[0x1E4F1D4C0];
  }
}

- (BOOL)setSecurityProtocol:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint8_t v6 = (NSString *)a3;
  os_unfair_lock_lock(&self->_lock);
  if ([(NSString *)self->_securityProtocol isEqualToString:v6])
  {
    uint64_t v7 = 0;
  }
  else
  {
    uint64_t v7 = self->_securityProtocol;
    objc_storeStrong((id *)&self->_securityProtocol, a3);
  }
  os_unfair_lock_unlock(&self->_lock);
  if (self->_connection)
  {
    BOOL v8 = 1;
    if (v6 && v7 != v6 && ![(NSString *)v6 isEqualToString:*MEMORY[0x1E4F1D4C0]])
    {
      id v9 = +[MFNWConnectionWrapper log];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v17 = 134217984;
        id v18 = self;
        _os_log_impl(&dword_1A7EFF000, v9, OS_LOG_TYPE_INFO, "starting TLS on connection %p", (uint8_t *)&v17, 0xCu);
      }

      nw_protocol_options_t options = nw_tls_create_options();
      [(MFNWConnectionWrapper *)self _configureTLS:options];
      if (!self->_eventSemaphore)
      {
        id v16 = [MEMORY[0x1E4F28B00] currentHandler];
        [v16 handleFailureInMethod:a2 object:self file:@"MFNWConnectionWrapper.m" lineNumber:601 description:@"event semaphore is NULL"];
      }
      nw_connection_append_and_start_application_protocol();
      eventSemaphore = self->_eventSemaphore;
      dispatch_time_t v12 = dispatch_time(0, 30000000000);
      if (dispatch_semaphore_wait(eventSemaphore, v12))
      {
        uint64_t v13 = +[MFNWConnectionWrapper log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[MFNWConnectionWrapper setSecurityProtocol:]();
        }
      }
      else
      {
        if (self->_connectionState == 3)
        {
          uint64_t v13 = +[MFNWConnectionWrapper log];
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
          {
            int64_t v14 = [(MFNWConnectionWrapper *)self _negotiatedSecurityProtocol];
            int v17 = 134218242;
            id v18 = self;
            __int16 v19 = 2114;
            BOOL v20 = v14;
            _os_log_impl(&dword_1A7EFF000, v13, OS_LOG_TYPE_DEFAULT, "negotiated SSL version for connection %p changed to %{public}@", (uint8_t *)&v17, 0x16u);
          }
          BOOL v8 = 1;
          goto LABEL_23;
        }
        uint64_t v13 = +[MFNWConnectionWrapper log];
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[MFNWConnectionWrapper setSecurityProtocol:]();
        }
      }
      BOOL v8 = 0;
LABEL_23:
    }
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

- (void)enableThroughputMonitoring:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (enableThroughputMonitoring__onceToken != -1) {
    dispatch_once(&enableThroughputMonitoring__onceToken, &__block_literal_global_70);
  }
  if (enableThroughputMonitoring__sLowThroughputThreshold
    && self->_connection
    && [(MFNWConnectionWrapper *)self isValid])
  {
    id v5 = +[MFNWConnectionWrapper log];
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_DWORD *)buf = 134217984;
        BOOL v8 = self;
        _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "turning throughput monitoring ON for connection %p", buf, 0xCu);
      }
    }
    else if (v6)
    {
      *(_DWORD *)buf = 134217984;
      BOOL v8 = self;
      _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, "turning throughput monitoring OFF for connection %p", buf, 0xCu);
    }

    nw_connection_set_low_throughput_handler();
  }
}

void __52__MFNWConnectionWrapper_enableThroughputMonitoring___block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4F1CB18], "em_userDefaults");
  enableThroughputMonitoring__sLowThroughputThreshold = [v0 integerForKey:@"ThroughputMonitoringThreshold"];

  BOOL v1 = enableThroughputMonitoring__sLowThroughputThreshold == 0;
  uint64_t v2 = +[MFNWConnectionWrapper log];
  BOOL v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      LOWORD(v7[0]) = 0;
      id v4 = "throughput monitoring is OFF";
      id v5 = v2;
      uint32_t v6 = 2;
      goto LABEL_6;
    }
  }
  else if (v3)
  {
    v7[0] = 67109120;
    v7[1] = enableThroughputMonitoring__sLowThroughputThreshold;
    id v4 = "throughput monitoring is ON (%u bytes/sec)";
    id v5 = v2;
    uint32_t v6 = 8;
LABEL_6:
    _os_log_impl(&dword_1A7EFF000, v5, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)v7, v6);
  }
}

uint64_t __52__MFNWConnectionWrapper_enableThroughputMonitoring___block_invoke_75(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v5 = 134217984;
    uint64_t v6 = v3;
    _os_log_impl(&dword_1A7EFF000, v2, OS_LOG_TYPE_DEFAULT, "closing connection %p due to low throughput", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(a1 + 32) _closeWithErrorDomain:*MEMORY[0x1E4F28798] code:60];
}

- (void)registerForBytesAvailableWithHandler:(id)a3
{
  id v4 = a3;
  int v5 = +[MFNWConnectionWrapper log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[MFNWConnectionWrapper registerForBytesAvailableWithHandler:]();
  }

  queue = self->_queue;
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  dispatch_time_t v10 = __62__MFNWConnectionWrapper_registerForBytesAvailableWithHandler___block_invoke;
  intptr_t v11 = &unk_1E5D3DEB0;
  dispatch_time_t v12 = self;
  id v7 = v4;
  id v13 = v7;
  dispatch_sync(queue, &v8);
  [(MFNWConnectionWrapper *)self _scheduleNextRead];
}

uint64_t __62__MFNWConnectionWrapper_registerForBytesAvailableWithHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBytesAvailableHandler:*(void *)(a1 + 40)];
}

- (void)unregisterForBytesAvailable
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "unregisterForBytesAvailable (%p)", v2, v3, v4, v5, v6);
}

uint64_t __52__MFNWConnectionWrapper_unregisterForBytesAvailable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setBytesAvailableHandler:0];
}

- (NSString)remoteHostname
{
  endpoint = self->_endpoint;
  if (endpoint)
  {
    endpoint = nw_endpoint_get_hostname(endpoint);
    if (endpoint)
    {
      endpoint = [NSString stringWithUTF8String:endpoint];
    }
  }
  return (NSString *)endpoint;
}

- (unsigned)remotePortNumber
{
  endpoint = self->_endpoint;
  if (endpoint) {
    LODWORD(endpoint) = nw_endpoint_get_port(endpoint);
  }
  return endpoint;
}

- (BOOL)isReadable
{
  return self->_connectionState == 3 && self->_readable && self->_buffer != 0;
}

- (BOOL)isWritable
{
  return self->_connectionState == 3 && self->_writable;
}

- (BOOL)isValid
{
  return self->_connectionState == 3;
}

- (BOOL)isCellularConnection
{
  uint64_t v2 = nw_connection_copy_connected_path();
  if (v2)
  {
    uint64_t v3 = (void *)nw_path_copy_interface();
    if (v3) {
      BOOL v4 = nw_path_uses_interface_type(v2, nw_interface_type_cellular);
    }
    else {
      BOOL v4 = 0;
    }
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)isConstrained
{
  uint64_t v2 = nw_connection_copy_current_path((nw_connection_t)self->_connection);
  uint64_t v3 = v2;
  if (v2) {
    BOOL is_constrained = nw_path_is_constrained(v2);
  }
  else {
    BOOL is_constrained = 0;
  }

  return is_constrained;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = nw_connection_state_to_string();
  endpoint = self->_endpoint;
  id v7 = [(MFNWConnectionWrapper *)self networkAccountIdentifier];
  uint64_t v8 = [v3 stringWithFormat:@"<%@ %p> state=%s endpoint=%@ account-id=%@ service=%@", v4, self, v5, endpoint, v7, self->_service];

  return (NSString *)v8;
}

- (NSString)accountIdentifier
{
  return self->_accountIdentifier;
}

- (void)setAccountIdentifier:(id)a3
{
}

- (BOOL)allowsTrustPrompt
{
  return self->_allowsTrustPrompt;
}

- (void)setAllowsTrustPrompt:(BOOL)a3
{
  self->_allowsTrustPrompt = a3;
}

- (NSArray)clientCertificates
{
  return self->_clientCertificates;
}

- (void)setClientCertificates:(id)a3
{
}

- (NSString)connectionServiceType
{
  return self->_connectionServiceType;
}

- (void)setConnectionServiceType:(id)a3
{
}

- (BOOL)isNonAppInitiated
{
  return self->_isNonAppInitiated;
}

- (void)setIsNonAppInitiated:(BOOL)a3
{
  self->_isNonAppInitiated = a3;
}

- (BOOL)disableEphemeralDiffieHellmanCiphers
{
  return self->_disableEphemeralDiffieHellmanCiphers;
}

- (void)setDisableEphemeralDiffieHellmanCiphers:(BOOL)a3
{
  self->_disableEphemeralDiffieHellmanCiphers = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 168, 1);
}

- (void)setError:(id)a3
{
}

- (NSString)networkAccountIdentifier
{
  return self->_networkAccountIdentifier;
}

- (void)setNetworkAccountIdentifier:(id)a3
{
}

- (id)networkActivityChangeBlock
{
  return self->_networkActivityChangeBlock;
}

- (void)setNetworkActivityChangeBlock:(id)a3
{
}

- (id)serverTrustHandler
{
  return self->_serverTrustHandler;
}

- (void)setServerTrustHandler:(id)a3
{
}

- (NSString)service
{
  return self->_service;
}

- (NSString)sourceApplicationBundleIdentifier
{
  return self->_sourceApplicationBundleIdentifier;
}

- (void)setSourceApplicationBundleIdentifier:(id)a3
{
}

- (unsigned)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(unsigned int)a3
{
  self->_timeout = a3;
}

- (BOOL)usesOpportunisticSockets
{
  return self->_usesOpportunisticSockets;
}

- (void)setUsesOpportunisticSockets:(BOOL)a3
{
  self->_usesOpportunisticSockets = a3;
}

- (id)bytesAvailableHandler
{
  return objc_getProperty(self, a2, 208, 1);
}

- (void)setBytesAvailableHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_bytesAvailableHandler, 0);
  objc_storeStrong((id *)&self->_sourceApplicationBundleIdentifier, 0);
  objc_storeStrong(&self->_serverTrustHandler, 0);
  objc_storeStrong(&self->_networkActivityChangeBlock, 0);
  objc_storeStrong((id *)&self->_networkAccountIdentifier, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_connectionServiceType, 0);
  objc_storeStrong((id *)&self->_clientCertificates, 0);
  objc_storeStrong((id *)&self->_accountIdentifier, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_securityProtocol, 0);
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_readError, 0);
  objc_storeStrong((id *)&self->_writeGroup, 0);
  objc_storeStrong((id *)&self->_readBufferLock, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);
  objc_storeStrong((id *)&self->_eventSemaphore, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)connectToHost:withPort:service:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_1A7EFF000, v1, OS_LOG_TYPE_ERROR, "nw_endpoint_create_host failed for %@ (error %d)", v2, 0x12u);
}

- (void)_connectToEndpoint:(uint8_t *)buf service:(os_log_t)log .cold.1(void *a1, int *a2, uint8_t *buf, os_log_t log)
{
  int v5 = *a2;
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 1024;
  *(_DWORD *)(buf + 14) = v5;
  _os_log_error_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_ERROR, "failed to open connection for %@ (%{errno}d)", buf, 0x12u);
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "event semaphore is NULL", v2, v3, v4, v5, v6);
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2080;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "state for connection %p: %s", buf, 0x16u);
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_11_cold_2()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "nw_connection_set_cancel_handler called for %p", v2, v3, v4, v5, v6);
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_12_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "read close (%p)", v2, v3, v4, v5, v6);
}

void __52__MFNWConnectionWrapper__connectToEndpoint_service___block_invoke_13_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "write close (%p)", v2, v3, v4, v5, v6);
}

- (void)_createConnectionWithEndpoint:error:.cold.1()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "nw_parameters_create failed", v2, v3, v4, v5, v6);
}

- (void)_createConnectionWithEndpoint:error:.cold.2()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "nw_connection_create failed", v2, v3, v4, v5, v6);
}

- (void)_createConnectionWithEndpoint:error:.cold.3()
{
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_2(&dword_1A7EFF000, v0, v1, "failed to set service type", v2, v3, v4, v5, v6);
}

- (void)_createConnectionWithEndpoint:error:.cold.4()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "unknown service type: %s", v2, v3, v4, v5, v6);
}

void __39__MFNWConnectionWrapper__configureTLS___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_debug_impl(&dword_1A7EFF000, log, OS_LOG_TYPE_DEBUG, "trust validation returned %@", buf, 0xCu);
}

void __43__MFNWConnectionWrapper_writeBytes_length___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_5_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A7EFF000, v1, OS_LOG_TYPE_ERROR, "write error on connection %p: %@", v2, 0x16u);
}

- (void)readBytesIntoBuffer:maxLength:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_1A7EFF000, v1, OS_LOG_TYPE_DEBUG, "readBytes on connection %p for %ld bytes", v2, 0x16u);
}

void __42__MFNWConnectionWrapper__scheduleNextRead__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "connection %p calling bytesAvailableHandler", v2, v3, v4, v5, v6);
}

- (void)_closeWithError:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "cancel failed on connection %p", v2, v3, v4, v5, v6);
}

- (void)_closeWithError:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "cancel timed out on connection %p", v2, v3, v4, v5, v6);
}

- (void)setSecurityProtocol:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "starting TLS on connection %p failed", v2, v3, v4, v5, v6);
}

- (void)setSecurityProtocol:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A7EFF000, v0, v1, "starting TLS timed out on connection %p", v2, v3, v4, v5, v6);
}

- (void)registerForBytesAvailableWithHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_5(&dword_1A7EFF000, v0, v1, "registerForBytesAvailableWithHandler (%p)", v2, v3, v4, v5, v6);
}

@end