@interface STSXPCClientNotificationListener
- (BOOL)connected;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSMutableArray)delayWork;
- (NSXPCConnection)xpcConnection;
- (NSXPCListener)xpc;
- (NSXPCListenerEndpoint)xpcEndpoint;
- (OS_dispatch_queue)callbackQueue;
- (STSXPCClientNotificationListener)initWithDelegate:(id)a3 queue:(id)a4;
- (STSXPCClientNotificationListenerDelegate)delegate;
- (id)_asynchronousRemoteProxyWithErrorHandler:(id)a3;
- (id)_generateFromCredRequest:(id)a3;
- (id)_stsHandoverNotificationListenerCallbackProtocol;
- (id)_stsHandoverNotificationListenerProtocol;
- (id)_synchronousRemoteProxyWithErrorHandler:(id)a3;
- (id)setRequestHandoverConfirmation:(BOOL)a3;
- (id)startHandoff;
- (os_unfair_lock_s)xpcUpdateLock;
- (unint64_t)_translateFromCarrierConnectionStatus:(unint64_t)a3;
- (void)_executeWhenXPCAvailable:(id)a3;
- (void)activateISO18013CredentialWithIdentifier:(id)a3 elementSelection:(id)a4 authData:(id)a5 completion:(id)a6;
- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3;
- (void)alternativerCarrierSend:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)dummyStart;
- (void)invalidateXPCConnection;
- (void)iso18013DecryptedDeviceResponse:(id)a3 sessionDataStatus:(id)a4 mDocResponseStatus:(id)a5 error:(id)a6;
- (void)processCredentialRequestList:(id)a3 readerAuthInfo:(id)a4;
- (void)receivedRawDataFromAlternativeCarrier:(id)a3 dataPending:(BOOL)a4;
- (void)sendConnectionHandoverCompleted;
- (void)sendConnectionHandoverStarted;
- (void)sendISO18013SessionData:(id)a3 status:(id)a4 completion:(id)a5;
- (void)sendISO18013SessionEstablishment:(id)a3 completion:(id)a4;
- (void)sessionTranscriptGenerated:(id)a3;
- (void)setCallbackQueue:(id)a3;
- (void)setDelayWork:(id)a3;
- (void)setXpc:(id)a3;
- (void)setXpcConnection:(id)a3;
- (void)setXpcUpdateLock:(os_unfair_lock_s)a3;
- (void)testGetRemoteTransceiverProxyXPCEndpointWithType:(unint64_t)a3 completion:(id)a4;
- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4;
- (void)transactionStarted:(unint64_t)a3;
@end

@implementation STSXPCClientNotificationListener

- (STSXPCClientNotificationListener)initWithDelegate:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)STSXPCClientNotificationListener;
  v8 = [(STSXPCClientNotificationListener *)&v18 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    p_callbackQueue = (void **)&v9->_callbackQueue;
    objc_storeStrong((id *)&v9->_callbackQueue, a4);
    if (!v9->_callbackQueue)
    {
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INITIATED, 0);

      dispatch_queue_t v13 = dispatch_queue_create("STSHelperNotificaitonListener", v12);
      v14 = *p_callbackQueue;
      *p_callbackQueue = v13;
    }
    v9->_xpcUpdateLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = objc_opt_new();
    delayWork = v9->_delayWork;
    v9->_delayWork = (NSMutableArray *)v15;
  }
  return v9;
}

- (BOOL)connected
{
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_2211852DC;
  v5[3] = &unk_264594A10;
  v5[4] = self;
  os_unfair_lock_lock(&self->_xpcUpdateLock);
  v3 = sub_2211852DC((uint64_t)v5);
  os_unfair_lock_unlock(p_xpcUpdateLock);
  LOBYTE(p_xpcUpdateLock) = [v3 BOOLValue];

  return (char)p_xpcUpdateLock;
}

- (void)_executeWhenXPCAvailable:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v9 = sub_22118544C;
  v10 = &unk_264594A38;
  v11 = self;
  dispatch_queue_t v13 = &v14;
  id v6 = (void (**)(void))v4;
  id v12 = v6;
  id v7 = v8;
  os_unfair_lock_lock(p_xpcUpdateLock);
  v9((uint64_t)v7);
  os_unfair_lock_unlock(p_xpcUpdateLock);

  if (*((unsigned char *)v15 + 24)) {
    v6[2](v6);
  }

  _Block_object_dispose(&v14, 8);
}

- (void)alternativerCarrierSend:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_2211855B4;
  v11[3] = &unk_264594AB0;
  id v13 = v8;
  SEL v14 = a2;
  v11[4] = self;
  id v12 = v7;
  id v9 = v7;
  id v10 = v8;
  [(STSXPCClientNotificationListener *)self _executeWhenXPCAvailable:v11];
}

- (void)sendConnectionHandoverStarted
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_22118591C;
  v2[3] = &unk_264594620;
  v2[4] = self;
  [(STSXPCClientNotificationListener *)self _executeWhenXPCAvailable:v2];
}

- (void)sendConnectionHandoverCompleted
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = sub_221185A54;
  v2[3] = &unk_264594620;
  v2[4] = self;
  [(STSXPCClientNotificationListener *)self _executeWhenXPCAvailable:v2];
}

- (id)setRequestHandoverConfirmation:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = sub_221185C38;
  id v12 = sub_221185C48;
  id v13 = 0;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = sub_221185C50;
  v7[3] = &unk_264594AD8;
  v7[4] = self;
  v7[5] = &v8;
  id v4 = [(STSXPCClientNotificationListener *)self _asynchronousRemoteProxyWithErrorHandler:v7];
  [v4 setRequestHandoverConfirmation:v3];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)startHandoff
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = sub_221185C38;
  v11 = sub_221185C48;
  id v12 = 0;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = sub_221185E24;
  v6[3] = &unk_264594AD8;
  v6[4] = self;
  v6[5] = &v7;
  v2 = [(STSXPCClientNotificationListener *)self _synchronousRemoteProxyWithErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = sub_221185E9C;
  v5[3] = &unk_264594B00;
  v5[4] = &v7;
  [v2 startHandoffWithCompletion:v5];

  id v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (void)activateISO18013CredentialWithIdentifier:(id)a3 elementSelection:(id)a4 authData:(id)a5 completion:(id)a6
{
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  uint64_t v15 = sub_221188848((id *)[STSCredentialSelect alloc], v14, v13, v12);

  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = sub_221185FD4;
  v18[3] = &unk_264594A60;
  v18[4] = self;
  id v19 = v11;
  SEL v20 = a2;
  id v16 = v11;
  char v17 = [(STSXPCClientNotificationListener *)self _asynchronousRemoteProxyWithErrorHandler:v18];
  [v17 sendCredentialSelect:v15 callback:v16];
}

- (void)sendISO18013SessionEstablishment:(id)a3 completion:(id)a4
{
  id v7 = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2211862D4;
  v14[3] = &unk_264594A60;
  v14[4] = self;
  id v8 = v7;
  id v15 = v8;
  SEL v16 = a2;
  id v9 = a3;
  uint64_t v10 = [(STSXPCClientNotificationListener *)self _asynchronousRemoteProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = sub_2211864AC;
  v12[3] = &unk_264594A88;
  id v13 = v8;
  id v11 = v8;
  [v10 iso18013ReaderSendSessionEstablishment:v9 callback:v12];
}

- (void)sendISO18013SessionData:(id)a3 status:(id)a4 completion:(id)a5
{
  id v9 = a5;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_221186600;
  v17[3] = &unk_264594A60;
  v17[4] = self;
  id v10 = v9;
  id v18 = v10;
  SEL v19 = a2;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(STSXPCClientNotificationListener *)self _asynchronousRemoteProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = sub_2211867D8;
  v15[3] = &unk_264594A88;
  id v16 = v10;
  id v14 = v10;
  [v13 iso18013ReaderSendSessionData:v12 status:v11 callback:v15];
}

- (void)testGetRemoteTransceiverProxyXPCEndpointWithType:(unint64_t)a3 completion:(id)a4
{
  id v7 = a4;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22118690C;
  v13[3] = &unk_264594A60;
  v13[4] = self;
  id v8 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v9 = [(STSXPCClientNotificationListener *)self _asynchronousRemoteProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = sub_221186AE8;
  v11[3] = &unk_264594B28;
  id v12 = v8;
  id v10 = v8;
  [v9 getRemoteTransceiverProxyXPCEndpointWithType:a3 == 0 callback:v11];
}

- (void)invalidateXPCConnection
{
  id v3 = [(STSXPCClientNotificationListener *)self xpcConnection];
  [v3 invalidate];

  [(STSXPCClientNotificationListener *)self setXpcConnection:0];
}

- (void)dealloc
{
  id v3 = [(STSXPCClientNotificationListener *)self xpc];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)STSXPCClientNotificationListener;
  [(STSXPCClientNotificationListener *)&v4 dealloc];
}

- (NSXPCListenerEndpoint)xpcEndpoint
{
  v2 = self;
  objc_sync_enter(v2);
  id v3 = [(STSXPCClientNotificationListener *)v2 xpc];

  if (!v3)
  {
    objc_super v4 = [MEMORY[0x263F08D88] anonymousListener];
    [(STSXPCClientNotificationListener *)v2 setXpc:v4];

    id v5 = [(STSXPCClientNotificationListener *)v2 xpc];
    [v5 setDelegate:v2];

    id v6 = [(STSXPCClientNotificationListener *)v2 xpc];
    [v6 resume];
  }
  id v7 = [(STSXPCClientNotificationListener *)v2 xpc];
  id v8 = [v7 endpoint];

  objc_sync_exit(v2);
  return (NSXPCListenerEndpoint *)v8;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5 = a4;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = sub_221186D64;
  id v13 = &unk_264594B78;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  id v14 = self;
  id v15 = v5;
  id v7 = v5;
  os_unfair_lock_lock(p_xpcUpdateLock);
  id v8 = sub_221186D64((uint64_t)&v10);
  os_unfair_lock_unlock(p_xpcUpdateLock);
  LOBYTE(p_xpcUpdateLock) = objc_msgSend(v8, "BOOLValue", v10, v11);

  return (char)p_xpcUpdateLock;
}

- (void)dummyStart
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener dummyStart]", 285, self, @"Listener started", v2, v3, v4);
}

- (void)transactionStarted:(unint64_t)a3
{
  if (a3 - 1 > 3) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = qword_2211A6668[a3 - 1];
  }
  id v4 = [(STSXPCClientNotificationListener *)self delegate];
  [v4 transactionStarted:v3];
}

- (void)processCredentialRequestList:(id)a3 readerAuthInfo:(id)a4
{
  uint64_t v57 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (id *)a4;
  uint64_t v10 = [(STSXPCClientNotificationListener *)self delegate];
  if (v10 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v49 = v10;
    id v11 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v50 = v6;
    id v12 = v6;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v56 count:16];
    if (v13)
    {
      uint64_t v16 = v13;
      uint64_t v17 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v53 != v17) {
            objc_enumerationMutation(v12);
          }
          uint64_t v19 = *(void *)(*((void *)&v52 + 1) + 8 * i);
          if (v19 && *(void *)(v19 + 8))
          {
            sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSXPCClientNotificationListener processCredentialRequestList:readerAuthInfo:]", 328, self, @"Unexpected type=%lu", v14, v15, *(void *)(v19 + 8));
          }
          else
          {
            SEL v20 = -[STSXPCClientNotificationListener _generateFromCredRequest:](self, "_generateFromCredRequest:");
            if (v20) {
              [v11 addObject:v20];
            }
          }
        }
        uint64_t v16 = [v12 countByEnumeratingWithState:&v52 objects:v56 count:16];
      }
      while (v16);
    }

    if (v7 && (v21 = (id *)v7[10]) != 0)
    {
      v22 = v21;
      id v48 = v21[2];
      int v23 = 0;
      id v24 = v22[3];
    }
    else
    {
      id v48 = 0;
      v22 = 0;
      id v24 = 0;
      int v23 = 1;
    }
    id v47 = v24;
    v25 = [STS18013ReaderAnalyticsData alloc];
    if (v23)
    {
      id v29 = 0;
      id v27 = 0;
      BOOL v26 = 0;
      id v28 = 0;
      id v30 = 0;
    }
    else
    {
      BOOL v26 = *((unsigned char *)v22 + 8) != 0;
      id v27 = v22[2];
      id v28 = v22[3];
      id v29 = v22[4];
      id v30 = v22[5];
    }
    id v31 = v30;
    v51 = [(STS18013ReaderAnalyticsData *)v25 initWithTrusted:v26 untrustedIdentifier:v27 untrustedOrganization:v28 untrustedIssuerIdentifier:v29 untrustedIssuerOrganization:v31];

    v46 = (void *)[v11 copy];
    v44 = [STS18013ReaderAuthInfo alloc];
    v45 = v22;
    if (v7)
    {
      id v32 = v7[1];
      id v43 = v7[2];
      id v42 = v7[3];
      id v41 = v7[4];
      id v40 = v7[5];
      id v39 = v7[6];
      id v33 = v7[7];
      id v34 = v7[8];
      id v35 = v7[9];
    }
    else
    {
      id v34 = 0;
      id v39 = 0;
      id v41 = 0;
      id v42 = 0;
      id v43 = 0;
      id v32 = 0;
      id v40 = 0;
      id v33 = 0;
      id v35 = 0;
    }
    id v36 = v35;
    v37 = [(STS18013ReaderAuthInfo *)v44 initWithIdentifier:v32 organization:v43 organizationUnit:v42 iconData:v41 iconURL:v40 iconMediaType:v39 privacyPolicyURL:v33 merchantCategoryCode:v34 certificateData:v36 readerAnalyticsData:v51];

    uint64_t v10 = v49;
    [v49 processISO18013CredentialProposals:v46 readerAuthInfo:v37];

    id v6 = v50;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSXPCClientNotificationListener processCredentialRequestList:readerAuthInfo:]", 321, self, @"Not implemented", v8, v9, v38);
  }
}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(STSXPCClientNotificationListener *)self delegate];
  [v8 transactionEndedWithIdentifier:v7 error:v6];
}

- (void)receivedRawDataFromAlternativeCarrier:(id)a3 dataPending:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = a3;
  id v6 = [(STSXPCClientNotificationListener *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v6 alternativeCarrierReceived:v7 dataPending:v4];
  }
}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  id v5 = [(STSXPCClientNotificationListener *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "alternativeCarrierConnectedWithStatus:", -[STSXPCClientNotificationListener _translateFromCarrierConnectionStatus:](self, "_translateFromCarrierConnectionStatus:", a3));
  }
}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  id v5 = [(STSXPCClientNotificationListener *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v5, "alternativeCarrierDisconnectedWithStatus:", -[STSXPCClientNotificationListener _translateFromCarrierConnectionStatus:](self, "_translateFromCarrierConnectionStatus:", a3));
  }
}

- (void)iso18013DecryptedDeviceResponse:(id)a3 sessionDataStatus:(id)a4 mDocResponseStatus:(id)a5 error:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v13 = [(STSXPCClientNotificationListener *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v13 receiveISO18013DeviceResponse:v14 sessionDataStatus:v10 mDocResponseStatus:v11 error:v12];
  }
}

- (void)sessionTranscriptGenerated:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(STSXPCClientNotificationListener *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 sessionTranscriptGenerated:v5];
  }
}

- (id)_stsHandoverNotificationListenerProtocol
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D30BC18];
  uint64_t v3 = (void *)MEMORY[0x263EFFA08];
  uint64_t v4 = objc_opt_class();
  id v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel_processCredentialRequestList_readerAuthInfo_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)_stsHandoverNotificationListenerCallbackProtocol
{
  uint64_t v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26D310668];
  uint64_t v3 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);
  [v2 setClasses:v3 forSelector:sel_sendCredentialSelect_callback_ argumentIndex:0 ofReply:0];

  return v2;
}

- (id)_generateFromCredRequest:(id)a3
{
  uint64_t v3 = a3;
  id v4 = v3;
  if (!v3)
  {
    id v5 = objc_opt_new();
    id v6 = 0;
    goto LABEL_5;
  }
  if (!v3[1])
  {
    id v5 = objc_opt_new();
    id v6 = (void *)*((void *)v4 + 2);
LABEL_5:
    id v7 = v6;
    [v5 setCredentialIdentifier:v7];

    if (v4)
    {
      id v8 = *((id *)v4 + 4);
      [v5 setAuthenticationACL:v8];

      uint64_t v9 = (void *)*((void *)v4 + 6);
    }
    else
    {
      [v5 setAuthenticationACL:0];
      uint64_t v9 = 0;
    }
    id v10 = v9;
    [v5 setDocType:v10];

    id v11 = objc_opt_new();
    if (v4) {
      id v12 = (void *)*((void *)v4 + 3);
    }
    else {
      id v12 = 0;
    }
    id v13 = v12;
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_221187E64;
    v17[3] = &unk_264594BA0;
    id v18 = v11;
    id v14 = v11;
    [v13 enumerateKeysAndObjectsUsingBlock:v17];

    uint64_t v15 = (void *)[v14 copy];
    [v5 setElementsByNamespace:v15];

    goto LABEL_10;
  }
  id v5 = 0;
LABEL_10:

  return v5;
}

- (unint64_t)_translateFromCarrierConnectionStatus:(unint64_t)a3
{
  if (a3 - 1 > 6) {
    return 0;
  }
  else {
    return qword_2211A6688[a3 - 1];
  }
}

- (id)_synchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_221188104;
  v10[3] = &unk_264594BC8;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v10[4] = self;
  id v11 = v5;
  SEL v12 = a2;
  id v7 = v5;
  os_unfair_lock_lock(&self->_xpcUpdateLock);
  id v8 = sub_221188104((uint64_t)v10);
  os_unfair_lock_unlock(p_xpcUpdateLock);

  return v8;
}

- (id)_asynchronousRemoteProxyWithErrorHandler:(id)a3
{
  id v5 = a3;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = sub_221188498;
  v10[3] = &unk_264594BC8;
  p_xpcUpdateLock = &self->_xpcUpdateLock;
  v10[4] = self;
  id v11 = v5;
  SEL v12 = a2;
  id v7 = v5;
  os_unfair_lock_lock(&self->_xpcUpdateLock);
  id v8 = sub_221188498((uint64_t)v10);
  os_unfair_lock_unlock(p_xpcUpdateLock);

  return v8;
}

- (STSXPCClientNotificationListenerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (STSXPCClientNotificationListenerDelegate *)WeakRetained;
}

- (NSXPCListener)xpc
{
  return self->_xpc;
}

- (void)setXpc:(id)a3
{
}

- (NSXPCConnection)xpcConnection
{
  return self->_xpcConnection;
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (os_unfair_lock_s)xpcUpdateLock
{
  return self->_xpcUpdateLock;
}

- (void)setXpcUpdateLock:(os_unfair_lock_s)a3
{
  self->_xpcUpdateLock = a3;
}

- (NSMutableArray)delayWork
{
  return self->_delayWork;
}

- (void)setDelayWork:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delayWork, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_xpc, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end