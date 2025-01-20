@interface MRProtocolClientConnection
- (BOOL)_client:(void *)a3 supportsMessage:;
- (BOOL)disconnected;
- (BOOL)isValid;
- (MRDeviceInfo)deviceInfo;
- (MRExternalDeviceTransportConnection)connection;
- (MRProtocolClientConnection)initWithConnection:(id)a3 queue:(id)a4;
- (MRProtocolClientConnectionDelegate)delegate;
- (MRSupportedProtocolMessages)supportedMessages;
- (NSError)error;
- (NSString)debugDescription;
- (NSString)label;
- (OS_dispatch_queue)queue;
- (id)_protocolMessageFromData:(uint64_t)a3 error:;
- (id)dataForMessage:(id)a3;
- (id)decryptData:(id)a3 error:(id *)a4;
- (id)encryptDataForMessage:(id)a3;
- (uint64_t)_adjustTimestamp:(uint64_t)a1;
- (void)_notifyDelegateClientDidDisconnectWithError:(id *)a1;
- (void)_parseMessageData:(uint64_t)a1;
- (void)_processMessage:(void *)a1;
- (void)_sendMessage:(void *)a3 reply:;
- (void)dealloc;
- (void)disconnectWithError:(id)a3;
- (void)parser:(id)a3 didParseMessage:(id)a4;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 reply:(id)a4;
- (void)sendMessage:(id)a3 timeout:(double)a4 reply:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setError:(id)a3;
- (void)setLabel:(id)a3;
- (void)setSupportedMessages:(id)a3;
- (void)transport:(id)a3 didReceiveData:(id)a4;
- (void)transportDidClose:(id)a3 error:(id)a4;
@end

@implementation MRProtocolClientConnection

- (MRProtocolClientConnection)initWithConnection:(id)a3 queue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)MRProtocolClientConnection;
  v9 = [(MRProtocolClientConnection *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_queue, a4);
    objc_storeStrong((id *)&v10->_connection, a3);
    [(MRExternalDeviceTransportConnection *)v10->_connection addObserver:v10];
    v11 = (MSVMessageParser *)objc_alloc_init(MEMORY[0x1E4F779A0]);
    parser = v10->_parser;
    v10->_parser = v11;

    [(MSVMessageParser *)v10->_parser setDelegate:v10];
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingReplyQueue = v10->_pendingReplyQueue;
    v10->_pendingReplyQueue = v13;
  }
  return v10;
}

- (void)dealloc
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = _MRLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v21 = self;
    _os_log_impl(&dword_194F3C000, v3, OS_LOG_TYPE_DEFAULT, "[ProtocolClientConnection] %{public}@ Dealloc", buf, 0xCu);
  }

  self->_disconnected = 1;
  [(MRExternalDeviceTransportConnection *)self->_connection removeObserver:self];
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:104 description:@"MRProtocolClientConnection.dealloc"];
  [(MRExternalDeviceTransportConnection *)self->_connection closeWithError:v4];
  Error = (void *)MRMediaRemoteCreateError(25);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v6 = [(NSMutableDictionary *)self->_pendingReplyQueue allValues];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * v10);
        v12 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:Error];
        v13 = [v11 reply];
        ((void (**)(void, MRProtocolMessage *))v13)[2](v13, v12);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  v14.receiver = self;
  v14.super_class = (Class)MRProtocolClientConnection;
  [(MRProtocolClientConnection *)&v14 dealloc];
}

- (NSString)debugDescription
{
  id v3 = [NSString alloc];
  uint64_t v4 = objc_opt_class();
  v5 = [(MRProtocolClientConnection *)self connection];
  v6 = (void *)[v3 initWithFormat:@"<%@:%p %@>", v4, self, v5];

  return (NSString *)v6;
}

- (NSError)error
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = (void *)[(NSError *)v2->_error copy];
  objc_sync_exit(v2);

  return (NSError *)v3;
}

- (BOOL)isValid
{
  return [(MRExternalDeviceTransportConnection *)self->_connection isValid];
}

- (void)setDeviceInfo:(id)a3
{
  uint64_t v4 = (MRDeviceInfo *)a3;
  obj = self;
  objc_sync_enter(obj);
  deviceInfo = obj->_deviceInfo;
  obj->_deviceInfo = v4;

  objc_sync_exit(obj);
}

- (MRDeviceInfo)deviceInfo
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_deviceInfo;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSupportedMessages:(id)a3
{
  uint64_t v4 = (MRSupportedProtocolMessages *)a3;
  obj = self;
  objc_sync_enter(obj);
  supportedMessages = obj->_supportedMessages;
  obj->_supportedMessages = v4;

  objc_sync_exit(obj);
}

- (MRSupportedProtocolMessages)supportedMessages
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = v2->_supportedMessages;
  objc_sync_exit(v2);

  return v3;
}

- (void)sendMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 reply:(id)a4
{
}

- (void)sendMessage:(id)a3 timeout:(double)a4 reply:(id)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  v41[0] = MEMORY[0x1E4F143A8];
  v41[1] = 3221225472;
  v41[2] = __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke;
  v41[3] = &unk_1E57D9288;
  id v10 = v9;
  id v43 = v10;
  v11 = (MRCompositeMessage *)v8;
  v42 = v11;
  objc_copyWeak(&v44, &location);
  v12 = (void (**)(void, void))MEMORY[0x1997190F0](v41);
  if (!self->_disconnected)
  {
    if (![(MRExternalDeviceTransportConnection *)self->_connection isValid])
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:100 description:@"connection is not valid"];
      ((void (**)(void, void *))v12)[2](v12, v13);
      goto LABEL_34;
    }
    if (!v11)
    {
      v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 description:@"attempting to send nil message"];
      ((void (**)(void, void *))v12)[2](v12, v13);
      v11 = 0;
      goto LABEL_34;
    }
    v13 = [(MRProtocolClientConnection *)self supportedMessages];
    if (!-[MRProtocolClientConnection _client:supportsMessage:]((BOOL)self, v13, v11))
    {
      long long v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28C58]), "initWithMRError:format:", 108, @"client does not support message M%lu> > <%lu>", -[MRProtocolMessage type](v11, "type"), objc_msgSend(v13, "lastSupportedMessageType"));
      ((void (**)(void, void *))v12)[2](v12, v17);
LABEL_33:

      goto LABEL_34;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = v11;
      objc_super v14 = [(MRCompositeMessage *)v33 messages];
      BOOL v15 = [v14 count] == 0;

      if (v15)
      {
        long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 description:@"attempting to send composite message with no children"];
        ((void (**)(void, void *))v12)[2](v12, v16);
        goto LABEL_14;
      }
      if (v10)
      {
        long long v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:2 description:@"attempting to send composite message that expects a reply"];
        ((void (**)(void, void *))v12)[2](v12, v16);
LABEL_14:

        long long v17 = v33;
        v11 = v33;
        goto LABEL_33;
      }
      v11 = objc_alloc_init(MRCompositeMessage);
      long long v18 = [(MRCompositeMessage *)v33 transportOptions];

      if (v18)
      {
        v19 = [(MRCompositeMessage *)v33 transportOptions];
        [(MRCompositeMessage *)v11 setTransportOptions:v19];
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      v20 = [(MRCompositeMessage *)v33 messages];
      uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v38;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v38 != v22) {
              objc_enumerationMutation(v20);
            }
            v24 = *(void **)(*((void *)&v37 + 1) + 8 * i);
            if (-[MRProtocolClientConnection _client:supportsMessage:]((BOOL)self, v13, v24)) {
              [(MRCompositeMessage *)v11 addMessage:v24];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v37 objects:v46 count:16];
        }
        while (v21);
      }

      v25 = [(MRProtocolMessage *)v33 replyIdentifier];

      if (v25)
      {
        v26 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:0];
        v27 = [(MRProtocolMessage *)v33 replyIdentifier];
        [(MRProtocolMessage *)v26 setReplyIdentifier:v27];

        [(MRCompositeMessage *)v11 addMessage:v26];
      }
    }
    kdebug_trace();
    long long v17 = (void *)MEMORY[0x1997190F0](v10);
    if (a4 > 0.0 && v10)
    {
      v28 = [MRBlockGuard alloc];
      v29 = [(MRProtocolMessage *)v11 uniqueIdentifier];
      v30 = [(MRBlockGuard *)v28 initWithTimeout:v29 reason:v12 handler:a4];

      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke_2;
      v34[3] = &unk_1E57D92B0;
      v35 = v30;
      id v36 = v10;
      v31 = v30;
      uint64_t v32 = MEMORY[0x1997190F0](v34);

      long long v17 = (void *)v32;
    }
    -[MRProtocolClientConnection _sendMessage:reply:](self, v11, v17);
    goto LABEL_33;
  }
  v13 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithMRError:100 description:@"connection disconnection when message was attempted to be sent"];
  ((void (**)(void, void *))v12)[2](v12, v13);
LABEL_34:

  objc_destroyWeak(&v44);
  objc_destroyWeak(&location);
}

void __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke(uint64_t a1, void *a2)
{
  if (*(void *)(a1 + 40))
  {
    id v3 = a2;
    uint64_t v7 = [[MRProtocolMessage alloc] initWithUnderlyingCodableMessage:0 error:v3];

    uint64_t v4 = [*(id *)(a1 + 32) replyIdentifier];
    [(MRProtocolMessage *)v7 setReplyIdentifier:v4];

    v5 = +[MRProtocolMessageLogger sharedLogger];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [v5 logMessage:@"Message Generated on behalf of" client:WeakRetained protocolMessage:*(void *)(a1 + 32)];

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (BOOL)_client:(void *)a3 supportsMessage:
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (a1) {
    a1 = (objc_msgSend(v5, "isSupported:", objc_msgSend(v6, "type")) & 1) != 0 || objc_msgSend(v7, "type") == 15;
  }

  return a1;
}

void __56__MRProtocolClientConnection_sendMessage_timeout_reply___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([*(id *)(a1 + 32) disarm]) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (void)_sendMessage:(void *)a3 reply:
{
  id v17 = a2;
  id v5 = a3;
  if (a1)
  {
    id v6 = a1;
    objc_sync_enter(v6);
    if (v5)
    {
      uint64_t v7 = [v17 replyIdentifier];

      if (!v7)
      {
        id v8 = [MEMORY[0x1E4F29128] UUID];
        id v9 = [v8 UUIDString];
        [v17 setReplyIdentifier:v9];
      }
      id v10 = objc_alloc_init(MRMessageReplyIdentifier);
      [(MRMessageReplyIdentifier *)v10 setReply:v5];
      id v11 = v6[7];
      v12 = [v17 replyIdentifier];
      [v11 setObject:v10 forKey:v12];
    }
    id v13 = v6[1];
    objc_sync_exit(v6);

    objc_super v14 = +[MRProtocolMessageLogger sharedLogger];
    [v14 logMessage:@"Message Sent To" client:v6 protocolMessage:v17];

    BOOL v15 = [v6 dataForMessage:v17];
    long long v16 = [v17 transportOptions];
    [v13 sendTransportData:v15 options:v16];
  }
}

- (void)disconnectWithError:(id)a3
{
  id v6 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if (!v5->_disconnected)
  {
    objc_storeStrong((id *)&v5->_error, a3);
    v5->_disconnected = 1;
    [(MRExternalDeviceTransportConnection *)v5->_connection closeWithError:v6];
    -[MRProtocolClientConnection _notifyDelegateClientDidDisconnectWithError:]((id *)&v5->super.isa, v6);
  }
  objc_sync_exit(v5);
}

- (void)_notifyDelegateClientDidDisconnectWithError:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    id WeakRetained = objc_loadWeakRetained(a1 + 12);
    id v5 = [a1 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __74__MRProtocolClientConnection__notifyDelegateClientDidDisconnectWithError___block_invoke;
    block[3] = &unk_1E57D1B18;
    id v8 = WeakRetained;
    id v9 = a1;
    id v10 = v3;
    id v6 = WeakRetained;
    dispatch_async(v5, block);
  }
}

- (id)encryptDataForMessage:(id)a3
{
  return (id)[a3 protobufData];
}

- (id)decryptData:(id)a3 error:(id *)a4
{
  id v4 = a3;

  return v4;
}

- (id)dataForMessage:(id)a3
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v22[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [v4 messages];

    id v5 = (void *)v6;
  }
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = [(MRProtocolClientConnection *)self encryptDataForMessage:*(void *)(*((void *)&v17 + 1) + 8 * i)];
        if (v13)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
          BOOL v15 = objc_msgSend(MEMORY[0x1E4F779A0], "createHeader:", objc_msgSend(v13, "length"));
          [v14 appendData:v15];
          [v14 appendData:v13];
          [v7 appendData:v14];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (void)transportDidClose:(id)a3 error:(id)a4
{
}

- (void)transport:(id)a3 didReceiveData:(id)a4
{
}

- (void)_parseMessageData:(uint64_t)a1
{
  id v3 = a2;
  if (a1 && !*(unsigned char *)(a1 + 64))
  {
    kdebug_trace();
    [*(id *)(a1 + 16) processData:v3];
    kdebug_trace();
  }
}

- (void)parser:(id)a3 didParseMessage:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7 && !self->_disconnected)
  {
    id v29 = 0;
    id v8 = [(MRProtocolClientConnection *)self decryptData:v7 error:&v29];
    id v9 = v29;
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = _MRLogForCategory(4uLL);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        uint64_t v32 = self;
        _os_log_impl(&dword_194F3C000, v11, OS_LOG_TYPE_DEFAULT, "[ProtocolClientConnection] %{public}@ Crypto Error. Disconnecting...", buf, 0xCu);
      }

      [(MRProtocolClientConnection *)self disconnectWithError:v10];
    }
    else
    {
      v12 = (void *)MEMORY[0x199718E70]();
      id v28 = 0;
      id v13 = -[MRProtocolClientConnection _protocolMessageFromData:error:]((uint64_t)self, (uint64_t)v8, (uint64_t)&v28);
      id v10 = v28;
      if (v10)
      {
        id v14 = _MRLogForCategory(4uLL);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          uint64_t v32 = self;
          _os_log_impl(&dword_194F3C000, v14, OS_LOG_TYPE_DEFAULT, "[ProtocolClientConnection] %{public}@ Parse Error. Disconnecting...", buf, 0xCu);
        }

        [(MRProtocolClientConnection *)self disconnectWithError:v10];
      }
      else
      {
        uint64_t v22 = v12;
        v23 = v8;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v15 = v13;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
        if (v16)
        {
          uint64_t v17 = v16;
          uint64_t v18 = *(void *)v25;
          do
          {
            for (uint64_t i = 0; i != v17; ++i)
            {
              if (*(void *)v25 != v18) {
                objc_enumerationMutation(v15);
              }
              long long v20 = *(void **)(*((void *)&v24 + 1) + 8 * i);
              uint64_t v21 = +[MRProtocolMessageLogger sharedLogger];
              [v21 logMessage:@"Message Received From" client:self protocolMessage:v20];

              [v20 setClientConnection:self];
              -[MRProtocolClientConnection _adjustTimestamp:]((uint64_t)self, v20);
              -[MRProtocolClientConnection _processMessage:](self, v20);
            }
            uint64_t v17 = [v15 countByEnumeratingWithState:&v24 objects:v30 count:16];
          }
          while (v17);
        }

        id v8 = v23;
        v12 = v22;
        id v10 = 0;
      }
    }
  }
}

- (id)_protocolMessageFromData:(uint64_t)a3 error:
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v3 = +[MRProtocolMessage protocolMessageWithProtobufData:a2 error:a3];
    id v4 = (void *)v3;
    if (v3)
    {
      v7[0] = v3;
      id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (void)_processMessage:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    uint64_t v22 = 0;
    v23 = &v22;
    uint64_t v24 = 0x3032000000;
    long long v25 = __Block_byref_object_copy__43;
    long long v26 = __Block_byref_object_dispose__43;
    id v27 = 0;
    id v4 = a1;
    objc_sync_enter(v4);
    id v5 = [v3 replyIdentifier];

    if (v5)
    {
      id v6 = v4[7];
      id v7 = [v3 replyIdentifier];
      id v8 = [v6 objectForKey:v7];

      if (!_os_feature_enabled_impl()
        || (uint64_t v9 = [v8 messageNumber], v9 == objc_msgSend(v3, "type"))
        || ![v8 messageNumber])
      {
        uint64_t v10 = [v8 reply];
        uint64_t v11 = (void *)v23[5];
        v23[5] = v10;
      }
      if (v23[5])
      {
        id v12 = v4[7];
        id v13 = [v3 replyIdentifier];
        [v12 removeObjectForKey:v13];

        [v3 setIsIncomingReply:1];
      }
    }
    objc_sync_exit(v4);

    id WeakRetained = objc_loadWeakRetained(v4 + 12);
    id v15 = [v4 queue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __46__MRProtocolClientConnection__processMessage___block_invoke;
    v17[3] = &unk_1E57D92D8;
    uint64_t v21 = &v22;
    id v18 = v3;
    id v19 = WeakRetained;
    long long v20 = v4;
    id v16 = WeakRetained;
    dispatch_async(v15, v17);

    _Block_object_dispose(&v22, 8);
  }
}

uint64_t __46__MRProtocolClientConnection__processMessage___block_invoke(void *a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (v2)
  {
    id v3 = *(uint64_t (**)(void))(v2 + 16);
    return v3();
  }
  else
  {
    uint64_t result = objc_opt_respondsToSelector();
    if (result)
    {
      id v5 = (void *)a1[5];
      uint64_t v6 = a1[6];
      uint64_t v7 = a1[4];
      return [v5 clientConnection:v6 didReceiveMessage:v7];
    }
  }
  return result;
}

- (uint64_t)_adjustTimestamp:(uint64_t)a1
{
  id v3 = a2;
  id v4 = v3;
  if (a1)
  {
    id v8 = v3;
    id v3 = (id)[v3 timestamp];
    id v4 = v8;
    if (v3)
    {
      if (!*(void *)(a1 + 32))
      {
        uint64_t v5 = mach_absolute_time();
        id v4 = v8;
        *(void *)(a1 + 32) = v5;
      }
      if (!*(void *)(a1 + 24))
      {
        uint64_t v6 = [v4 timestamp];
        id v4 = v8;
        *(void *)(a1 + 24) = v6;
      }
      id v3 = (id)objc_msgSend(v8, "setTimestamp:", *(void *)(a1 + 32)+ (unint64_t)((double)(unint64_t)(objc_msgSend(v4, "timestamp") - *(void *)(a1 + 24))/ MRTimeUtilitiesGetProcessorTimeScale()));
      id v4 = v8;
    }
  }

  return MEMORY[0x1F41817F8](v3, v4);
}

uint64_t __74__MRProtocolClientConnection__notifyDelegateClientDidDisconnectWithError___block_invoke(void *a1)
{
  uint64_t result = objc_opt_respondsToSelector();
  if (result)
  {
    id v3 = (void *)a1[4];
    uint64_t v4 = a1[5];
    uint64_t v5 = a1[6];
    return [v3 clientDidDisconnect:v4 error:v5];
  }
  return result;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (BOOL)disconnected
{
  return self->_disconnected;
}

- (void)setError:(id)a3
{
}

- (MRExternalDeviceTransportConnection)connection
{
  return self->_connection;
}

- (MRProtocolClientConnectionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRProtocolClientConnectionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_pendingReplyQueue, 0);
  objc_storeStrong((id *)&self->_supportedMessages, 0);
  objc_storeStrong((id *)&self->_deviceInfo, 0);
  objc_storeStrong((id *)&self->_parser, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end