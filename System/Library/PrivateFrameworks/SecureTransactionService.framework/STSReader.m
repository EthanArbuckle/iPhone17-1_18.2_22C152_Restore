@interface STSReader
- (BOOL)alternativeCarrierConnected;
- (BOOL)queuePaused;
- (NFSecureElementManagerSession)proxyReaderSESession;
- (NFSecureElementReaderProxyListener)seProxyListener;
- (NFSecureTransactionServicesHandoverSession)handoverSession;
- (NFSession)initiatingSession;
- (NSData)sessionTranscriptBytes;
- (OS_dispatch_queue)callbackQueue;
- (STSCASessionStats)caSessionStats;
- (STSHardwareManagerWrapper)nfHwManager;
- (STSHelperLibrary)stsHelper;
- (STSReader)initWithType:(unint64_t)a3 queue:(id)a4;
- (STSTimer)responseTimeout;
- (STSXPCClientNotificationListener)stsNotificationListener;
- (id)_translateNfcdXPCHelperError:(id)a3;
- (id)_translateSTSXPCHelperError:(id)a3;
- (id)_translateXPCClientNotificationStatus:(unint64_t)a3;
- (id)connectionHandler;
- (id)invalidationHandler;
- (id)sendRequestCompletion;
- (id)sessionStartCompletion;
- (id)startWithConfiguration:(id)a3 connectionHandler:(id)a4 tnepStatusHandler:(id)a5 invalidationHandler:(id)a6 completion:(id)a7;
- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 tnepStatusHandler:(id)a5 invalidationErrorHandler:(id)a6 completion:(id)a7;
- (id)tnepStatusHandler;
- (int64_t)state;
- (int64_t)transmissionState;
- (unint64_t)engagementConfiguration;
- (unint64_t)type;
- (void)_activateInvalidationHandler:(id)a3;
- (void)_activateOnConnectCompletion;
- (void)_activateSendRequestCompletion:(id)a3 terminationRequested:(BOOL)a4 error:(id)a5;
- (void)_activateSessionStartCompletion:(id)a3;
- (void)_activateTnepStatusHandler:(id)a3;
- (void)_seProxyCleanup:(id)a3;
- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3;
- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4;
- (void)connectionHandoverCompleted:(id)a3;
- (void)dealloc;
- (void)executeOnSEProxyWithBlock:(id)a3;
- (void)invalidate;
- (void)invalidateWithCode:(unsigned int)a3;
- (void)invalidateWithCodeSync:(unsigned int)a3;
- (void)notificationClientConnected;
- (void)receiveISO18013DeviceResponse:(id)a3 sessionDataStatus:(id)a4 mDocResponseStatus:(id)a5 error:(id)a6;
- (void)relinquishSEProxy;
- (void)sendDocumentRequest:(id)a3 timeoutInterval:(double)a4 sessionTermination:(BOOL)a5 responseHandler:(id)a6;
- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4;
- (void)session:(id)a3 didEndUnexpectedly:(id)a4;
- (void)session:(id)a3 fieldNotification:(id)a4;
- (void)session:(id)a3 tnepService:(id)a4;
- (void)sessionTranscriptGenerated:(id)a3;
- (void)setAlternativeCarrierConnected:(BOOL)a3;
- (void)setCaSessionStats:(id)a3;
- (void)setConnectionHandler:(id)a3;
- (void)setEngagementConfiguration:(unint64_t)a3;
- (void)setHandoverSession:(id)a3;
- (void)setInitiatingSession:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setNfHwManager:(id)a3;
- (void)setProxyReaderSESession:(id)a3;
- (void)setQueuePaused:(BOOL)a3;
- (void)setResponseTimeout:(id)a3;
- (void)setSeProxyListener:(id)a3;
- (void)setSendRequestCompletion:(id)a3;
- (void)setSessionStartCompletion:(id)a3;
- (void)setSessionTranscriptBytes:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setStsHelper:(id)a3;
- (void)setStsNotificationListener:(id)a3;
- (void)setTnepStatusHandler:(id)a3;
- (void)setTransmissionState:(int64_t)a3;
- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4;
- (void)transactionStarted:(unint64_t)a3;
- (void)xpcInterrupted;
- (void)xpcInvalidated;
@end

@implementation STSReader

- (STSReader)initWithType:(unint64_t)a3 queue:(id)a4
{
  id v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)STSReader;
  v7 = [(STSReader *)&v20 init];
  v8 = v7;
  if (v7)
  {
    v7->_type = a3;
    v7->_transmissionState = 0;
    uint64_t v9 = objc_opt_new();
    nfHwManager = v8->_nfHwManager;
    v8->_nfHwManager = (STSHardwareManagerWrapper *)v9;

    if (v6)
    {
      v11 = (OS_dispatch_queue *)v6;
      callbackQueue = v8->_callbackQueue;
      v8->_callbackQueue = v11;
    }
    else
    {
      callbackQueue = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      dispatch_queue_t v13 = dispatch_queue_create("STSReader", callbackQueue);
      v14 = v8->_callbackQueue;
      v8->_callbackQueue = (OS_dispatch_queue *)v13;
    }
    dispatch_suspend((dispatch_object_t)v8->_callbackQueue);
    v8->_queuePaused = 1;
    v8->_state = 0;
    v15 = [[STSXPCClientNotificationListener alloc] initWithDelegate:v8 queue:v8->_callbackQueue];
    stsNotificationListener = v8->_stsNotificationListener;
    v8->_stsNotificationListener = v15;

    uint64_t v17 = objc_opt_new();
    caSessionStats = v8->_caSessionStats;
    v8->_caSessionStats = (STSCASessionStats *)v17;
  }
  return v8;
}

- (void)dealloc
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader dealloc]", 220, self, &stru_26D2FDEC0, v2, v3, (uint64_t)v10.receiver);
  v5 = [(STSReader *)self caSessionStats];
  [v5 postReaderSessionEvent];

  if ([(STSReader *)self state] != 2)
  {
    id v6 = [(STSReader *)self responseTimeout];
    [v6 stopTimer];

    v7 = [(STSReader *)self handoverSession];
    [v7 endSession];

    [(STSReader *)self _seProxyCleanup:0];
    v8 = [(STSReader *)self stsHelper];
    [v8 invalidate];

    uint64_t v9 = [(STSReader *)self stsNotificationListener];
    [v9 invalidateXPCConnection];
  }
  v10.receiver = self;
  v10.super_class = (Class)STSReader;
  [(STSReader *)&v10 dealloc];
}

- (id)startWithHandoverType:(unint64_t)a3 connectionHandler:(id)a4 tnepStatusHandler:(id)a5 invalidationErrorHandler:(id)a6 completion:(id)a7
{
  char v10 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  v16 = _os_activity_create(&dword_221170000, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationHandler:completion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v20.opaque[0] = 0;
  v20.opaque[1] = 0;
  os_activity_scope_enter(v16, &v20);
  os_activity_scope_leave(&v20);

  uint64_t v17 = +[STSEngagementConfiguration configurationWithDeviceEngagementType:0 dataRetrievalType:v10 & 7 engagementData:0];
  v18 = [(STSReader *)self startWithConfiguration:v17 connectionHandler:v15 tnepStatusHandler:v14 invalidationHandler:v13 completion:v12];

  return v18;
}

- (id)startWithConfiguration:(id)a3 connectionHandler:(id)a4 tnepStatusHandler:(id)a5 invalidationHandler:(id)a6 completion:(id)a7
{
  v100[4] = *MEMORY[0x263EF8340];
  id v13 = a3;
  id v78 = a4;
  id v79 = a5;
  id v77 = a6;
  id v14 = a7;
  uint64_t v15 = [v13 deviceEngagementType];
  uint64_t v16 = [v13 dataRetrievalType];
  v75 = [v13 engagementData];
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 267, self, @"Start with deviceEngagementType = 0x%x, dataRetrievalType = 0x%x and engagementData = %@", v17, v18, v15);

  v19 = _os_activity_create(&dword_221170000, "startWithHandoverType:tnepStatusHandler:connectionHandler:invalidationHandler:completion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v19, &state);
  os_activity_scope_leave(&state);

  if ([(STSReader *)self queuePaused])
  {
    [(STSReader *)self setQueuePaused:0];
    os_activity_scope_state_s v20 = [(STSReader *)self callbackQueue];
    dispatch_resume(v20);
  }
  v21 = self;
  objc_sync_enter(v21);
  if ([(STSReader *)v21 state] && [(STSReader *)v21 state] != 2)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 287, v21, @"Unexpected state; invalidate existing sessions",
      v22,
      v23,
      v73);
    [(STSReader *)v21 invalidateWithCodeSync:17];
  }
  [(STSReader *)v21 setSessionStartCompletion:v14];
  [(STSReader *)v21 setTnepStatusHandler:v79];
  [(STSReader *)v21 setConnectionHandler:v78];
  [(STSReader *)v21 setState:1];
  [(STSReader *)v21 setInvalidationHandler:v77];
  v24 = [(STSReader *)v21 caSessionStats];
  objc_msgSend(v24, "setTotalTransactionsInSession:", objc_msgSend(v24, "totalTransactionsInSession") + 1);

  objc_sync_exit(v21);
  v25 = objc_opt_new();
  [(STSReader *)v21 setStsHelper:v25];

  if (![v13 deviceEngagementType])
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 302, v21, @"NFC Engagement", v26, v27, v73);
    char v36 = [v13 dataRetrievalType];
    unint64_t v37 = [v13 dataRetrievalType];
    unint64_t v38 = v36 & 1 | (8 * ((v37 >> 1) & 1)) & 0xFFFFFFFFFFFFFFEFLL | (16
                                                                   * (((unint64_t)[v13 dataRetrievalType] >> 2) & 1));
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 316, v21, @"Starting nfc handover session with handover Type=0x%lx", v39, v40, v38);
    v41 = v21;
    objc_sync_enter(v41);
    v42 = [(STSReader *)v41 nfHwManager];
    v43 = [v42 manager];

    if (!v43)
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 321, v41, @"Hardware not available", v44, v45, v74);
      v76 = (void *)MEMORY[0x263F087E8];
      v51 = [NSString stringWithUTF8String:"STS.fwk"];
      v99[0] = *MEMORY[0x263F08320];
      v52 = [NSString stringWithUTF8String:"Hardware Not Available"];
      v100[0] = v52;
      v100[1] = &unk_26D307750;
      v99[1] = @"Line";
      v99[2] = @"Method";
      v53 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), v16, v75);
      v100[2] = v53;
      v99[3] = *MEMORY[0x263F07F80];
      v54 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 322);
      v100[3] = v54;
      v55 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:4];
      v56 = [v76 errorWithDomain:v51 code:12 userInfo:v55];

      v57 = [(STSReader *)v41 callbackQueue];
      v96[0] = MEMORY[0x263EF8330];
      v96[1] = 3221225472;
      v96[2] = sub_221178C7C;
      v96[3] = &unk_264594558;
      id v98 = v14;
      id v58 = v56;
      id v97 = v58;
      dispatch_async(v57, v96);

      v59 = v97;
      id v35 = v58;

      objc_sync_exit(v41);
      goto LABEL_19;
    }
    objc_sync_exit(v41);

    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_221178C90;
    aBlock[3] = &unk_264594738;
    aBlock[4] = v41;
    aBlock[5] = a2;
    v46 = _Block_copy(aBlock);
    state.opaque[0] = 0;
    state.opaque[1] = (uint64_t)&state;
    uint64_t v91 = 0x3032000000;
    v92 = sub_221179124;
    v93 = sub_221179134;
    id v94 = 0;
    v87[0] = MEMORY[0x263EF8330];
    v87[1] = 3221225472;
    v87[2] = sub_22117913C;
    v87[3] = &unk_264594760;
    v87[4] = v41;
    id v88 = v46;
    p_os_activity_scope_state_s state = &state;
    id v47 = v46;
    uint64_t v48 = [v43 startSecureTransactionServicesSessionWithRole:1 connectionHandoverCofig:v38 completion:v87];
    v49 = *(void **)(state.opaque[1] + 40);
    *(void *)(state.opaque[1] + 40) = v48;

    _Block_object_dispose(&state, 8);
LABEL_18:
    id v35 = 0;
    goto LABEL_19;
  }
  if ([v13 deviceEngagementType] != 1) {
    goto LABEL_18;
  }
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 371, v21, @"QR Code Engagement", v28, v29, v73);
  v21->_engagementConfiguration = 64;
  if ([v13 dataRetrievalType]) {
    v21->_engagementConfiguration |= 1uLL;
  }
  if (([v13 dataRetrievalType] & 2) != 0) {
    v21->_engagementConfiguration |= 2uLL;
  }
  if (([v13 dataRetrievalType] & 4) != 0) {
    v21->_engagementConfiguration |= 4uLL;
  }
  v30 = [(STSReader *)v21 stsHelper];
  v31 = [v30 startISO18013WithConnectionHandoverConfiguration:v21->_engagementConfiguration type:1 credentialType:2 delegate:v21];

  if (v31)
  {
    v32 = [(STSReader *)v21 callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_2211792CC;
    block[3] = &unk_264594558;
    id v86 = v14;
    id v33 = v31;
    id v85 = v33;
    dispatch_async(v32, block);

    v34 = v85;
    id v35 = v33;

    goto LABEL_19;
  }
  v60 = [(STSReader *)v21 stsHelper];
  v61 = [(STSReader *)v21 stsNotificationListener];
  v62 = [v61 xpcEndpoint];
  v63 = [v60 connectToNotificationListener:v62];

  if (!v63)
  {
    v67 = [v13 engagementData];
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader startWithConfiguration:connectionHandler:tnepStatusHandler:invalidationHandler:completion:]", 404, v21, @"engagementData = %@", v68, v69, (uint64_t)v67);

    v70 = [(STSReader *)v21 stsHelper];
    v71 = [v13 engagementData];
    v72 = [(STSReader *)v21 callbackQueue];
    v80[0] = MEMORY[0x263EF8330];
    v80[1] = 3221225472;
    v80[2] = sub_2211792F4;
    v80[3] = &unk_2645945F8;
    v80[4] = v21;
    [v70 connectRemoteWithQRCodeHandoverData:v71 callbackQueue:v72 responseHandler:v80];

    goto LABEL_18;
  }
  v64 = [(STSReader *)v21 callbackQueue];
  v81[0] = MEMORY[0x263EF8330];
  v81[1] = 3221225472;
  v81[2] = sub_2211792E0;
  v81[3] = &unk_264594558;
  id v83 = v14;
  id v65 = v63;
  id v82 = v65;
  dispatch_async(v64, v81);

  v66 = v82;
  id v35 = v65;

LABEL_19:
  return v35;
}

- (void)sendDocumentRequest:(id)a3 timeoutInterval:(double)a4 sessionTermination:(BOOL)a5 responseHandler:(id)a6
{
  BOOL v7 = a5;
  v73[2] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a6;
  id v13 = _os_activity_create(&dword_221170000, "sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 432, self, @"timeoutInterval=%f", v14, v15, *(uint64_t *)&a4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || ![v11 length])
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 434, self, @"Invalid parameter", v16, v17, v56);
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = [NSString stringWithUTF8String:"STS.fwk"];
    v72[0] = *MEMORY[0x263F08320];
    uint64_t v29 = [NSString stringWithUTF8String:"Invalid Parameter"];
    v73[0] = v29;
    v72[1] = *MEMORY[0x263F08338];
    v30 = (void *)[[NSString alloc] initWithFormat:@"Invalid Parameter"];
    v73[1] = v30;
    v31 = [NSDictionary dictionaryWithObjects:v73 forKeys:v72 count:2];
    v32 = [v27 errorWithDomain:v28 code:8 userInfo:v31];

    id v33 = [(STSReader *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_221179BC4;
    block[3] = &unk_264594558;
    id v63 = v32;
    id v64 = v12;
    id v34 = v32;
    dispatch_async(v33, block);

    goto LABEL_6;
  }
  uint64_t v18 = self;
  objc_sync_enter(v18);
  if ([(STSReader *)v18 state] == 2)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 448, v18, @"invalidated flag already set", v19, v20, v56);
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = [NSString stringWithUTF8String:"STS.fwk"];
    v70[0] = *MEMORY[0x263F08320];
    uint64_t v23 = [NSString stringWithUTF8String:"Invalid State"];
    v71[0] = v23;
    v70[1] = *MEMORY[0x263F08338];
    v24 = (void *)[[NSString alloc] initWithFormat:@"Session invalidated"];
    v71[1] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v71 forKeys:v70 count:2];
    uint64_t v26 = [v21 errorWithDomain:v22 code:9 userInfo:v25];
    goto LABEL_9;
  }
  id v35 = [(STSReader *)v18 sendRequestCompletion];

  if (v35)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 451, v18, @"sendRequestCompletion already set", v36, v37, v56);
    unint64_t v38 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = [NSString stringWithUTF8String:"STS.fwk"];
    v68[0] = *MEMORY[0x263F08320];
    uint64_t v23 = [NSString stringWithUTF8String:"Invalid State"];
    v69[0] = v23;
    v68[1] = *MEMORY[0x263F08338];
    v24 = (void *)[[NSString alloc] initWithFormat:@"Pending send exists"];
    v69[1] = v24;
    v25 = [NSDictionary dictionaryWithObjects:v69 forKeys:v68 count:2];
    uint64_t v26 = [v38 errorWithDomain:v22 code:9 userInfo:v25];
    goto LABEL_9;
  }
  if ((v18->_engagementConfiguration & 0x40) == 0)
  {
    v42 = [(STSReader *)v18 handoverSession];
    BOOL v43 = v42 == 0;

    if (v43)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sendDocumentRequest:timeoutInterval:sessionTermination:responseHandler:]", 454, v18, @"Not a QRCode session and handoverSession is not created", v44, v45, v56);
      v55 = (void *)MEMORY[0x263F087E8];
      uint64_t v22 = [NSString stringWithUTF8String:"STS.fwk"];
      v66[0] = *MEMORY[0x263F08320];
      uint64_t v23 = [NSString stringWithUTF8String:"Invalid State"];
      v67[0] = v23;
      v66[1] = *MEMORY[0x263F08338];
      v24 = (void *)[[NSString alloc] initWithFormat:@"Session has not started"];
      v67[1] = v24;
      v25 = [NSDictionary dictionaryWithObjects:v67 forKeys:v66 count:2];
      uint64_t v26 = [v55 errorWithDomain:v22 code:9 userInfo:v25];
LABEL_9:
      uint64_t v39 = (void *)v26;

      if (v39)
      {
        uint64_t v40 = [(STSReader *)v18 callbackQueue];
        v59[0] = MEMORY[0x263EF8330];
        v59[1] = 3221225472;
        v59[2] = sub_221179BDC;
        v59[3] = &unk_264594558;
        id v60 = v39;
        id v61 = v12;
        id v41 = v39;
        dispatch_async(v40, v59);

        objc_sync_exit(v18);
        goto LABEL_6;
      }
    }
  }
  if (v7 && ![(STSReader *)v18 transmissionState]) {
    [(STSReader *)v18 setTransmissionState:1];
  }
  if ([(STSReader *)v18 transmissionState]) {
    BOOL v46 = [(STSReader *)v18 transmissionState] == 1;
  }
  else {
    BOOL v46 = 1;
  }
  [(STSReader *)v18 setSendRequestCompletion:v12];
  objc_sync_exit(v18);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_221179BF4;
  aBlock[3] = &unk_2645945F8;
  aBlock[4] = v18;
  id v47 = _Block_copy(aBlock);
  uint64_t v48 = [(STSReader *)v18 stsNotificationListener];
  v49 = v48;
  if (v46)
  {
    [v48 sendISO18013SessionEstablishment:v11 completion:v47];
  }
  else
  {
    if (v7) {
      v50 = &unk_26D3077B0;
    }
    else {
      v50 = 0;
    }
    [v48 sendISO18013SessionData:v11 status:v50 completion:v47];
  }

  v51 = [STSTimer alloc];
  v57[0] = MEMORY[0x263EF8330];
  v57[1] = 3221225472;
  v57[2] = sub_221179CB4;
  v57[3] = &unk_264594788;
  v57[4] = v18;
  v57[5] = a2;
  v52 = [(STSReader *)v18 callbackQueue];
  v53 = [(STSTimer *)v51 initWithCallback:v57 queue:v52];
  [(STSReader *)v18 setResponseTimeout:v53];

  v54 = [(STSReader *)v18 responseTimeout];
  [v54 startTimer:a4];

LABEL_6:
}

- (void)invalidate
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader invalidate]", 509, self, &stru_26D2FDEC0, v2, v3, v5);
  MEMORY[0x270F9A6D0](self, sel_invalidateWithCode_);
}

- (void)invalidateWithCode:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  obj = self;
  objc_sync_enter(obj);
  [(STSReader *)obj invalidateWithCodeSync:v3];
  objc_sync_exit(obj);
}

- (void)invalidateWithCodeSync:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  v32[4] = *MEMORY[0x263EF8340];
  id v6 = _os_activity_create(&dword_221170000, "invalidateWithCodeSync:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  if ([(STSReader *)self state] == 2)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader invalidateWithCodeSync:]", 526, self, @"Previously invalidated", v7, v8, v24);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader invalidateWithCodeSync:]", 530, self, @"code=%d", v7, v8, v3);
    uint64_t v9 = [(STSReader *)self responseTimeout];
    [v9 stopTimer];

    [(STSReader *)self setResponseTimeout:0];
    [(STSReader *)self setSessionTranscriptBytes:0];
    char v10 = [(STSReader *)self handoverSession];
    [v10 endSession];

    [(STSReader *)self setHandoverSession:0];
    [(STSReader *)self _seProxyCleanup:0];
    id v11 = [(STSReader *)self stsHelper];
    [v11 invalidate];

    [(STSReader *)self setStsHelper:0];
    [(STSReader *)self setState:2];
    id v12 = [(STSReader *)self invalidationHandler];
    [(STSReader *)self setInvalidationHandler:0];
    id v13 = [(STSReader *)self stsNotificationListener];
    [v13 invalidateXPCConnection];

    [(STSReader *)self setTransmissionState:0];
    uint64_t v14 = (void *)MEMORY[0x263F087E8];
    uint64_t v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v31[0] = *MEMORY[0x263F08320];
    if (v3 >= 0x18) {
      int v16 = 24;
    }
    else {
      int v16 = v3;
    }
    uint64_t v17 = [NSString stringWithUTF8String:off_264594668[v16]];
    v32[0] = v17;
    v32[1] = &unk_26D3077E0;
    v31[1] = @"Line";
    v31[2] = @"Method";
    uint64_t v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v32[2] = v18;
    v31[3] = *MEMORY[0x263F07F80];
    SEL v25 = a2;
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 546);
    v32[3] = v19;
    uint64_t v20 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
    v21 = [v14 errorWithDomain:v15 code:v3 userInfo:v20];
    [(STSReader *)self _activateSendRequestCompletion:0 terminationRequested:0 error:v21];

    if (v12)
    {
      uint64_t v22 = [(STSReader *)self callbackQueue];
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = sub_22117A31C;
      block[3] = &unk_2645947B0;
      int v29 = v3;
      id v27 = v12;
      SEL v28 = v25;
      id v23 = v12;
      dispatch_async(v22, block);
    }
  }
}

- (void)executeOnSEProxyWithBlock:(id)a3
{
  id v5 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 557, self, &stru_26D2FDEC0, v6, v7, v57);
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_22117AD84;
  aBlock[3] = &unk_2645945A8;
  aBlock[4] = self;
  uint64_t v9 = v8;
  v93 = v9;
  char v10 = (void (**)(void))_Block_copy(aBlock);
  id v11 = [(STSReader *)self initiatingSession];
  if (v11)
  {
  }
  else
  {
    uint64_t v14 = [(STSReader *)self proxyReaderSESession];

    if (!v14) {
      goto LABEL_5;
    }
  }
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 586, self, @"initiatingSession or proxyReaderSESession already exists. Clean it up first", v12, v13, v58);
  [(STSReader *)self _seProxyCleanup:0];
LABEL_5:
  uint64_t v15 = [(STSReader *)self handoverSession];

  if (!v15)
  {
    id v23 = [(STSReader *)self proxyReaderSESession];

    if (v23)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 623, self, @"Previous session exists, tear down now", v24, v25, v58);
      [(STSReader *)self _seProxyCleanup:v10];
    }
    else
    {
      v10[2](v10);
    }
LABEL_19:
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 630, self, @" Waiting for SE Proxy Session", v26, v27, v58);
    dispatch_time_t v37 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v9, v37);
    unint64_t v38 = [(STSReader *)self proxyReaderSESession];

    if (v38)
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 643, self, @" Create SE ProxyListener", v39, v40, v59);
      id v41 = [[NFSecureElementReaderProxyListener alloc] initWithSTSReaderSession:self];
      [(STSReader *)self setSeProxyListener:v41];

      v42 = [(STSReader *)self seProxyListener];

      if (v42)
      {
        uint64_t v45 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
        dispatch_queue_t v46 = dispatch_queue_create("STSXPCReader", v45);

        id v47 = [(STSReader *)self stsHelper];
        uint64_t v48 = [(STSReader *)self seProxyListener];
        v49 = [v47 startReaderSEProxyListener:v48 workQueue:v46];

        if (v49)
        {
          v52 = [(STSReader *)self callbackQueue];
          v63[0] = MEMORY[0x263EF8330];
          v63[1] = 3221225472;
          v63[2] = sub_22117B308;
          v63[3] = &unk_264594828;
          v53 = &v66;
          id v66 = v5;
          id v64 = v49;
          id v65 = self;
          dispatch_async(v52, v63);
        }
        else
        {
          sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 668, self, @"Could not startReaderSEProxyListener", v50, v51, v60);
          uint64_t v56 = [(STSReader *)self callbackQueue];
          v61[0] = MEMORY[0x263EF8330];
          v61[1] = 3221225472;
          v61[2] = sub_22117B370;
          v61[3] = &unk_264594800;
          v53 = (id *)v62;
          v62[0] = v5;
          v62[1] = a2;
          dispatch_async(v56, v61);

          [(STSReader *)self _seProxyCleanup:0];
        }
      }
      else
      {
        sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 648, self, @"Could not get the  Proxy Listener", v43, v44, v60);
        v55 = [(STSReader *)self callbackQueue];
        v67[0] = MEMORY[0x263EF8330];
        v67[1] = 3221225472;
        void v67[2] = sub_22117B154;
        v67[3] = &unk_264594800;
        uint64_t v68 = v5;
        SEL v69 = a2;
        dispatch_async(v55, v67);

        [(STSReader *)self _seProxyCleanup:0];
        dispatch_queue_t v46 = v68;
      }
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 635, self, @"Could not get the SE Proxy session", v39, v40, v59);
      v54 = [(STSReader *)self callbackQueue];
      v70[0] = MEMORY[0x263EF8330];
      v70[1] = 3221225472;
      void v70[2] = sub_22117AFA0;
      v70[3] = &unk_264594800;
      v71 = v5;
      SEL v72 = a2;
      dispatch_async(v54, v70);

      [(STSReader *)self _seProxyCleanup:0];
      dispatch_queue_t v46 = v71;
    }

    goto LABEL_28;
  }
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 591, self, @"Create a handoffToken", v16, v17, v58);
  uint64_t v86 = 0;
  v87 = (id *)&v86;
  uint64_t v88 = 0x3032000000;
  v89 = sub_221179124;
  v90 = sub_221179134;
  id v91 = 0;
  uint64_t v18 = [(STSReader *)self handoverSession];
  uint64_t v19 = v87;
  id v85 = v87[5];
  uint64_t v20 = [v18 createSessionHandoffToken:&v85];
  objc_storeStrong(v19 + 5, v85);

  if (v87[5])
  {
    v21 = [(STSReader *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22117AF60;
    block[3] = &unk_2645947D8;
    id v83 = v5;
    v84 = &v86;
    dispatch_async(v21, block);

    [(STSReader *)self _seProxyCleanup:0];
    int v22 = 1;
  }
  else
  {
    SEL v28 = [(STSReader *)self proxyReaderSESession];

    if (v28)
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 604, self, @"Previous session exists, tear down now", v29, v30, v58);
      [(STSReader *)self _seProxyCleanup:v10];
    }
    else
    {
      v10[2](v10);
    }
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 610, self, @"Activating session with token: %@", v31, v32, (uint64_t)v20);
    uint64_t v76 = 0;
    id v77 = &v76;
    uint64_t v78 = 0x3032000000;
    id v79 = sub_221179124;
    v80 = sub_221179134;
    id v33 = [(STSReader *)self initiatingSession];
    id v81 = [v33 activateWithToken:v20];

    if (v77[5])
    {
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 613, self, @"Session switching error=%@", v34, v35, v77[5]);
      uint64_t v36 = [(STSReader *)self callbackQueue];
      v73[0] = MEMORY[0x263EF8330];
      v73[1] = 3221225472;
      v73[2] = sub_22117AF80;
      v73[3] = &unk_2645947D8;
      id v74 = v5;
      v75 = &v76;
      dispatch_async(v36, v73);

      [(STSReader *)self _seProxyCleanup:0];
      int v22 = 1;
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_DEFAULT, 1, (uint64_t)"-[STSReader executeOnSEProxyWithBlock:]", 620, self, @"Activated session with token: %@", v34, v35, (uint64_t)v20);
      int v22 = 0;
    }
    _Block_object_dispose(&v76, 8);
  }
  _Block_object_dispose(&v86, 8);

  if (!v22) {
    goto LABEL_19;
  }
LABEL_28:
}

- (void)relinquishSEProxy
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader relinquishSEProxy]", 679, self, &stru_26D2FDEC0, v2, v3, v6);
  id v5 = [(STSReader *)self stsHelper];
  [v5 stopSEProxyListener];

  [(STSReader *)self setSeProxyListener:0];
}

- (void)transactionStarted:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader transactionStarted:]", 687, self, @"status=%lu", v3, v4, a3);
  if (a3)
  {
    id v7 = [(STSReader *)self _translateXPCClientNotificationStatus:a3];
    [(STSReader *)self _activateInvalidationHandler:v7];
  }
}

- (void)transactionEndedWithIdentifier:(id)a3 error:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader transactionEndedWithIdentifier:error:]", 695, self, @"identifier=%@, error=%@", v4, v5, (uint64_t)a3);
}

- (void)notificationClientConnected
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader notificationClientConnected]", 699, self, &stru_26D2FDEC0, v2, v3, v4);
}

- (void)receiveISO18013DeviceResponse:(id)a3 sessionDataStatus:(id)a4 mDocResponseStatus:(id)a5 error:(id)a6
{
  v37[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = [v11 length];
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 708, self, @"dataLen=%ld, SessionData.status=%@, mDocResponseStatus=%@, error=%@", v16, v17, v15);
  uint64_t v18 = [(STSReader *)self responseTimeout];
  [v18 stopTimer];

  [(STSReader *)self setResponseTimeout:0];
  uint64_t v19 = [v12 unsignedIntegerValue];
  if ((unint64_t)(v19 - 10) < 2) {
    goto LABEL_4;
  }
  if (v19 == 20)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 717, self, @"Session termination requested in session data status", v20, v21, v32);
LABEL_4:
    uint64_t v22 = 1;
    goto LABEL_6;
  }
  uint64_t v22 = 0;
LABEL_6:
  id v23 = self;
  objc_sync_enter(v23);
  if ([(STSReader *)v23 transmissionState] == 1)
  {
    uint64_t v24 = [(STSReader *)v23 stsNotificationListener];
    v35[0] = MEMORY[0x263EF8330];
    v35[1] = 3221225472;
    v35[2] = sub_22117BA64;
    v35[3] = &unk_2645945F8;
    v35[4] = v23;
    [v24 sendISO18013SessionData:0 status:&unk_26D3077B0 completion:v35];
  }
  objc_sync_exit(v23);

  if ([v11 length])
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 739, v23, @"activating send request completion: terminationRequested: %d", v25, v26, v22);
    [(STSReader *)v23 _activateSendRequestCompletion:v11 terminationRequested:v22 error:0];
  }
  else if (v22)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader receiveISO18013DeviceResponse:sessionDataStatus:mDocResponseStatus:error:]", 742, v23, @"Session termination request received", v25, v26, v32);
    id v33 = (void *)MEMORY[0x263F087E8];
    uint64_t v34 = [NSString stringWithUTF8String:"STS.fwk"];
    v36[0] = *MEMORY[0x263F08320];
    uint64_t v27 = [NSString stringWithUTF8String:"Invalidated"];
    v37[0] = v27;
    v37[1] = &unk_26D307858;
    v36[1] = @"Line";
    v36[2] = @"Method";
    SEL v28 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2), v12, v13, v14);
    v37[2] = v28;
    v36[3] = *MEMORY[0x263F07F80];
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 743);
    v37[3] = v29;
    uint64_t v30 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    uint64_t v31 = [v33 errorWithDomain:v34 code:17 userInfo:v30];
    [(STSReader *)v23 _activateInvalidationHandler:v31];
  }
}

- (void)alternativeCarrierReceived:(id)a3 dataPending:(BOOL)a4
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader alternativeCarrierReceived:dataPending:]", 748, self, &stru_26D2FDEC0, v4, v5, v6);
}

- (void)alternativeCarrierConnectedWithStatus:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader alternativeCarrierConnectedWithStatus:]", 756, self, @"status=%lu", v3, v4, a3);
  if (a3)
  {
    id v7 = [(STSReader *)self _translateXPCClientNotificationStatus:a3];
    -[STSReader _activateInvalidationHandler:](self, "_activateInvalidationHandler:");
  }
  else
  {
    [(STSReader *)self _activateOnConnectCompletion];
    id v7 = [(STSReader *)self handoverSession];
    [v7 stopTNEPOperation];
  }
}

- (void)alternativeCarrierDisconnectedWithStatus:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader alternativeCarrierDisconnectedWithStatus:]", 769, self, &stru_26D2FDEC0, v3, v4, v7);
  id v8 = [(STSReader *)self _translateXPCClientNotificationStatus:a3];
  [(STSReader *)self _activateInvalidationHandler:v8];
}

- (void)sessionTranscriptGenerated:(id)a3
{
  id v7 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader sessionTranscriptGenerated:]", 775, self, &stru_26D2FDEC0, v4, v5, v6);
  [(STSReader *)self setSessionTranscriptBytes:v7];
}

- (void)xpcInvalidated
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader xpcInvalidated]", 780, self, &stru_26D2FDEC0, v2, v3, v5);
  MEMORY[0x270F9A6D0](self, sel_invalidateWithCode_);
}

- (void)xpcInterrupted
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader xpcInterrupted]", 785, self, &stru_26D2FDEC0, v2, v3, v5);
  MEMORY[0x270F9A6D0](self, sel_invalidateWithCode_);
}

- (void)session:(id)a3 fieldNotification:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader session:fieldNotification:]", 793, self, @"fieldNotification=%@", v4, v5, (uint64_t)a4);
}

- (void)session:(id)a3 tnepService:(id)a4
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader session:tnepService:]", 797, self, @"Selected tnepService=%@", v4, v5, (uint64_t)a4);
}

- (void)session:(id)a3 connectionHandoverProcessFailure:(id)a4
{
  id v5 = a4;
  sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader session:connectionHandoverProcessFailure:]", 802, self, @"error=%@", v6, v7, (uint64_t)v5);
  id v14 = v5;
  id v8 = [v14 domain];
  char v9 = [v8 isEqualToString:@"STSXPCHelperErrorDomain"];

  id v10 = v14;
  if ((v9 & 1) == 0)
  {
    id v11 = [v14 userInfo];
    id v12 = [v11 objectForKeyedSubscript:*MEMORY[0x263F08608]];

    id v10 = v14;
    if (v12)
    {
      id v10 = v12;
    }
  }
  id v13 = [(STSReader *)self _translateSTSXPCHelperError:v10];

  [(STSReader *)self _activateTnepStatusHandler:v13];
  [(STSReader *)self _activateInvalidationHandler:v13];
}

- (void)connectionHandoverCompleted:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader connectionHandoverCompleted:]", 819, self, &stru_26D2FDEC0, v5, v6, v7);
  [v4 stopTNEPOperation];

  [(STSReader *)self _activateTnepStatusHandler:0];
}

- (void)session:(id)a3 didEndUnexpectedly:(id)a4
{
  v22[4] = *MEMORY[0x263EF8340];
  id v7 = a4;
  uint64_t v8 = [v7 code];
  char v9 = (void *)MEMORY[0x263F087E8];
  id v10 = [NSString stringWithUTF8String:"STS.fwk"];
  if (v8 == 47)
  {
    v21[0] = *MEMORY[0x263F08320];
    id v11 = [NSString stringWithUTF8String:"Reader mode protection enable"];
    v22[0] = v11;
    v22[1] = &unk_26D307870;
    v21[1] = @"Line";
    v21[2] = @"Method";
    id v4 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v22[2] = v4;
    v21[3] = *MEMORY[0x263F07F80];
    id v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 827);
    v22[3] = v12;
    id v13 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
    id v14 = [v9 errorWithDomain:v10 code:20 userInfo:v13];

LABEL_6:
    goto LABEL_7;
  }
  v19[0] = *MEMORY[0x263F08320];
  id v11 = [NSString stringWithUTF8String:"Aborted"];
  v20[0] = v11;
  v19[1] = *MEMORY[0x263F08608];
  id v12 = v7;
  if (!v7)
  {
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    id v4 = [NSString stringWithUTF8String:"STS.fwk"];
    id v12 = [v15 errorWithDomain:v4 code:5 userInfo:0];
  }
  v20[1] = v12;
  v20[2] = &unk_26D307888;
  v19[2] = @"Line";
  v19[3] = @"Method";
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v20[3] = v16;
  v19[4] = *MEMORY[0x263F07F80];
  uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 829);
  v20[4] = v17;
  uint64_t v18 = [NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:5];
  id v14 = [v9 errorWithDomain:v10 code:3 userInfo:v18];

  if (!v7) {
    goto LABEL_6;
  }
LABEL_7:

  [(STSReader *)self _activateInvalidationHandler:v14];
}

- (void)_seProxyCleanup:(id)a3
{
  id v15 = a3;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSReader _seProxyCleanup:]", 838, self, &stru_26D2FDEC0, v4, v5, v13);
  uint64_t v6 = [(STSReader *)self proxyReaderSESession];

  if (v6)
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader _seProxyCleanup:]", 841, self, @"relinquish SE back", v7, v8, v14);
    char v9 = [(STSReader *)self proxyReaderSESession];
    [v9 endSessionWithCompletion:&unk_26D2FDDE0];

    [(STSReader *)self setProxyReaderSESession:0];
  }
  id v10 = [(STSReader *)self initiatingSession];

  if (v10)
  {
    id v11 = [(STSReader *)self initiatingSession];
    [v11 endSessionWithCompletion:&unk_26D2FDE00];

    [(STSReader *)self setInitiatingSession:0];
  }
  id v12 = v15;
  if (v15)
  {
    (*((void (**)(id))v15 + 2))(v15);
    id v12 = v15;
  }
}

- (void)_activateSessionStartCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(STSReader *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22117C4B0;
  block[3] = &unk_264594870;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_activateTnepStatusHandler:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [(STSReader *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22117C66C;
  block[3] = &unk_264594870;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)_activateOnConnectCompletion
{
  objc_initWeak(&location, self);
  uint64_t v3 = [(STSReader *)self callbackQueue];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = sub_22117C800;
  v4[3] = &unk_264594898;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_activateSendRequestCompletion:(id)a3 terminationRequested:(BOOL)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_initWeak(&location, self);
  id v10 = [(STSReader *)self callbackQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = sub_22117C9B8;
  v13[3] = &unk_2645948C0;
  objc_copyWeak(&v17, &location);
  id v14 = v9;
  id v15 = v8;
  BOOL v18 = a4;
  uint64_t v16 = self;
  id v11 = v8;
  id v12 = v9;
  dispatch_async(v10, v13);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

- (void)_activateInvalidationHandler:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSReader _activateInvalidationHandler:]", 926, self, @"error=%@", v5, v6, (uint64_t)v4);
  uint64_t v7 = [(STSReader *)self handoverSession];
  [v7 endSession];

  objc_initWeak(&location, self);
  id v8 = [(STSReader *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_22117CC04;
  block[3] = &unk_264594870;
  objc_copyWeak(&v12, &location);
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, block);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

- (id)_translateXPCClientNotificationStatus:(unint64_t)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
      id v4 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v33[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Cancelled"];
      v34[0] = v6;
      v34[1] = &unk_26D3078A0;
      v33[1] = @"Line";
      v33[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v34[2] = v7;
      v33[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 953);
      v34[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
      id v10 = v4;
      id v11 = v5;
      uint64_t v12 = 13;
      goto LABEL_10;
    case 3uLL:
      id v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v31[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Timeout"];
      v32[0] = v6;
      v32[1] = &unk_26D3078B8;
      v31[1] = @"Line";
      v31[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v32[2] = v7;
      v31[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 955);
      v32[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
      id v10 = v14;
      id v11 = v5;
      uint64_t v12 = 4;
      goto LABEL_10;
    case 5uLL:
      id v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v29[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"No alernative carrier available"];
      v30[0] = v6;
      v30[1] = &unk_26D3078D0;
      v29[1] = @"Line";
      v29[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v30[2] = v7;
      v29[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 957);
      v30[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
      id v10 = v15;
      id v11 = v5;
      uint64_t v12 = 14;
      goto LABEL_10;
    case 6uLL:
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v27[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Requires Wifi power on"];
      v28[0] = v6;
      v28[1] = &unk_26D3078E8;
      v27[1] = @"Line";
      v27[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v28[2] = v7;
      v27[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 959);
      v28[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
      id v10 = v16;
      id v11 = v5;
      uint64_t v12 = 15;
      goto LABEL_10;
    case 7uLL:
      id v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v25[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Requires Bluetooth power on"];
      v26[0] = v6;
      v26[1] = &unk_26D307900;
      v25[1] = @"Line";
      v25[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v26[2] = v7;
      v25[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 961);
      v26[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
      id v10 = v17;
      id v11 = v5;
      uint64_t v12 = 16;
      goto LABEL_10;
    case 8uLL:
      BOOL v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v23[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Alternative Carrier transmission error"];
      v24[0] = v6;
      v24[1] = &unk_26D307918;
      v23[1] = @"Line";
      v23[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v24[2] = v7;
      v23[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 963);
      v24[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
      id v10 = v18;
      id v11 = v5;
      uint64_t v12 = 19;
      goto LABEL_10;
    case 9uLL:
      uint64_t v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v21[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Invalid State"];
      v22[0] = v6;
      v22[1] = &unk_26D307930;
      v21[1] = @"Line";
      v21[2] = @"Method";
      uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v22[2] = v7;
      v21[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 965);
      v22[3] = v8;
      id v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
      id v10 = v19;
      id v11 = v5;
      uint64_t v12 = 9;
LABEL_10:
      uint64_t v13 = [v10 errorWithDomain:v11 code:v12 userInfo:v9];

      break;
    default:
      uint64_t v13 = 0;
      break;
  }
  return v13;
}

- (id)_translateSTSXPCHelperError:(id)a3
{
  v104[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5)
  {
    a2 = 0;
    goto LABEL_15;
  }
  uint64_t v7 = [v5 domain];
  id v8 = [NSString stringWithUTF8String:"STS.fwk"];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = v6;
LABEL_7:
    a2 = v10;
    goto LABEL_15;
  }
  id v11 = [v6 domain];
  int v12 = [v11 isEqual:@"nfcd"];

  if (v12)
  {
    id v10 = [(STSReader *)self _translateNfcdXPCHelperError:v6];
    goto LABEL_7;
  }
  uint64_t v13 = [v6 domain];
  char v14 = [v13 isEqual:@"STSXPCHelperErrorDomain"];

  if (v14)
  {
    switch([v6 code])
    {
      case 0:
        v55 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v101[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Unexpected Result"];
        v102[0] = v17;
        v102[1] = &unk_26D307960;
        v101[1] = @"Line";
        v101[2] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v102[2] = v19;
        v101[3] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 989);
        v102[3] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v102 forKeys:v101 count:4];
        uint64_t v26 = v55;
        uint64_t v27 = v16;
        uint64_t v28 = 10;
        break;
      case 1:
        uint64_t v56 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v99[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Feature Not Supported"];
        uint64_t v57 = *MEMORY[0x263F08608];
        v100[0] = v17;
        v100[1] = v6;
        v99[1] = v57;
        v99[2] = @"Line";
        v100[2] = &unk_26D307978;
        v99[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v100[3] = v19;
        void v99[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 991);
        v100[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v100 forKeys:v99 count:5];
        uint64_t v26 = v56;
        uint64_t v27 = v16;
        uint64_t v28 = 11;
        break;
      case 2:
        uint64_t v32 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v97[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Invalid State"];
        uint64_t v33 = *MEMORY[0x263F08608];
        v98[0] = v17;
        v98[1] = v6;
        v97[1] = v33;
        v97[2] = @"Line";
        v98[2] = &unk_26D307990;
        v97[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v98[3] = v19;
        v97[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 993);
        v98[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v98 forKeys:v97 count:5];
        uint64_t v26 = v32;
        uint64_t v27 = v16;
        uint64_t v28 = 9;
        break;
      case 3:
      case 9:
      case 10:
      case 11:
        id v15 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v85[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Unknown Error"];
        uint64_t v18 = *MEMORY[0x263F08608];
        v86[0] = v17;
        v86[1] = v6;
        v85[1] = v18;
        v85[2] = @"Line";
        v86[2] = &unk_26D307A20;
        v85[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v86[3] = v19;
        v85[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1009);
        v86[4] = v20;
        uint64_t v21 = NSDictionary;
        uint64_t v22 = v86;
        id v23 = v85;
        goto LABEL_12;
      case 4:
        uint64_t v34 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v93[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"XPC Error"];
        uint64_t v35 = *MEMORY[0x263F08608];
        v94[0] = v17;
        v94[1] = v6;
        v93[1] = v35;
        v93[2] = @"Line";
        v94[2] = &unk_26D3079C0;
        v93[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v94[3] = v19;
        v93[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 997);
        v94[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v94 forKeys:v93 count:5];
        uint64_t v26 = v34;
        uint64_t v27 = v16;
        uint64_t v28 = 6;
        break;
      case 5:
        uint64_t v58 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v91[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Invalid Parameter"];
        uint64_t v59 = *MEMORY[0x263F08608];
        v92[0] = v17;
        v92[1] = v6;
        v91[1] = v59;
        v91[2] = @"Line";
        v92[2] = &unk_26D3079D8;
        v91[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v92[3] = v19;
        v91[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 999);
        v92[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v92 forKeys:v91 count:5];
        uint64_t v26 = v58;
        uint64_t v27 = v16;
        uint64_t v28 = 8;
        break;
      case 6:
        uint64_t v36 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v89[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Hardware Not Available"];
        uint64_t v37 = *MEMORY[0x263F08608];
        v90[0] = v17;
        v90[1] = v6;
        v89[1] = v37;
        v89[2] = @"Line";
        v90[2] = &unk_26D3079F0;
        v89[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v90[3] = v19;
        v89[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1001);
        v90[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v90 forKeys:v89 count:5];
        uint64_t v26 = v36;
        uint64_t v27 = v16;
        uint64_t v28 = 12;
        break;
      case 7:
        uint64_t v60 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v87[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Timeout"];
        uint64_t v61 = *MEMORY[0x263F08608];
        v88[0] = v17;
        v88[1] = v6;
        v87[1] = v61;
        v87[2] = @"Line";
        v88[2] = &unk_26D307A08;
        v87[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v88[3] = v19;
        v87[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1003);
        v88[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v88 forKeys:v87 count:5];
        uint64_t v26 = v60;
        uint64_t v27 = v16;
        uint64_t v28 = 4;
        break;
      case 8:
        unint64_t v38 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v95[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"No alernative carrier available"];
        uint64_t v39 = *MEMORY[0x263F08608];
        v96[0] = v17;
        v96[1] = v6;
        v95[1] = v39;
        v95[2] = @"Line";
        v96[2] = &unk_26D3079A8;
        v95[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v96[3] = v19;
        v95[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 995);
        void v96[4] = v20;
        uint64_t v40 = NSDictionary;
        id v41 = v96;
        v42 = v95;
        goto LABEL_42;
      case 12:
        uint64_t v43 = [v6 userInfo];
        uint64_t v44 = *MEMORY[0x263F08608];
        uint64_t v16 = [v43 objectForKeyedSubscript:*MEMORY[0x263F08608]];

        uint64_t v45 = [v16 domain];
        if ([v45 isEqual:@"BluetoothDomain"])
        {
          uint64_t v46 = [v16 code];

          if (!v46)
          {
            id v47 = (void *)MEMORY[0x263F087E8];
            id v17 = [NSString stringWithUTF8String:"STS.fwk"];
            v83[0] = *MEMORY[0x263F08320];
            uint64_t v48 = [NSString stringWithUTF8String:"Requires Bluetooth power on"];
            v84[0] = v48;
            v84[1] = v6;
            v83[1] = v44;
            v83[2] = @"Line";
            v84[2] = &unk_26D307A38;
            v83[3] = @"Method";
            v49 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
            v84[3] = v49;
            v83[4] = *MEMORY[0x263F07F80];
            uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1015);
            v84[4] = v50;
            uint64_t v51 = [NSDictionary dictionaryWithObjects:v84 forKeys:v83 count:5];
            v52 = v47;
            v53 = v17;
            uint64_t v54 = 16;
LABEL_38:
            a2 = [v52 errorWithDomain:v53 code:v54 userInfo:v51];

            goto LABEL_14;
          }
        }
        else
        {
        }
        uint64_t v68 = [v16 domain];
        if ([v68 isEqual:@"WifiDomain"])
        {
          uint64_t v69 = [v16 code];

          if (v69 == 3)
          {
            v70 = (void *)MEMORY[0x263F087E8];
            id v17 = [NSString stringWithUTF8String:"STS.fwk"];
            v81[0] = *MEMORY[0x263F08320];
            uint64_t v48 = [NSString stringWithUTF8String:"Requires Wifi power on"];
            v82[0] = v48;
            v82[1] = v6;
            v81[1] = v44;
            v81[2] = @"Line";
            v82[2] = &unk_26D307A50;
            v81[3] = @"Method";
            v49 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
            v82[3] = v49;
            void v81[4] = *MEMORY[0x263F07F80];
            uint64_t v50 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1019);
            v82[4] = v50;
            uint64_t v51 = [NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:5];
            v52 = v70;
            v53 = v17;
            uint64_t v54 = 15;
            goto LABEL_38;
          }
        }
        else
        {
        }
LABEL_41:
        unint64_t v38 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v79[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"No alernative carrier available"];
        v80[0] = v17;
        v80[1] = v6;
        v79[1] = v44;
        v79[2] = @"Line";
        v80[2] = &unk_26D307A68;
        v79[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v80[3] = v19;
        v79[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1023);
        v80[4] = v20;
        uint64_t v40 = NSDictionary;
        id v41 = v80;
        v42 = v79;
LABEL_42:
        uint64_t v25 = [v40 dictionaryWithObjects:v41 forKeys:v42 count:5];
        uint64_t v26 = v38;
        uint64_t v27 = v16;
        uint64_t v28 = 14;
        break;
      case 13:
        uint64_t v44 = *MEMORY[0x263F08608];
        goto LABEL_41;
      case 14:
      case 15:
        uint64_t v30 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v77[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Alternative Carrier transmission error"];
        uint64_t v31 = *MEMORY[0x263F08608];
        v78[0] = v17;
        v78[1] = v6;
        v77[1] = v31;
        v77[2] = @"Line";
        v78[2] = &unk_26D307A80;
        v77[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v78[3] = v19;
        v77[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1026);
        v78[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:5];
        uint64_t v26 = v30;
        uint64_t v27 = v16;
        uint64_t v28 = 19;
        break;
      case 16:
        v62 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v75[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Cancelled"];
        uint64_t v63 = *MEMORY[0x263F08608];
        v76[0] = v17;
        v76[1] = v6;
        v75[1] = v63;
        v75[2] = @"Line";
        v76[2] = &unk_26D307A98;
        v75[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v76[3] = v19;
        v75[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1028);
        v76[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v76 forKeys:v75 count:5];
        uint64_t v26 = v62;
        uint64_t v27 = v16;
        uint64_t v28 = 13;
        break;
      case 17:
        id v64 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v73[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"Invalidated"];
        uint64_t v65 = *MEMORY[0x263F08608];
        v74[0] = v17;
        v74[1] = v6;
        v73[1] = v65;
        v73[2] = @"Line";
        v74[2] = &unk_26D307AB0;
        v73[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v74[3] = v19;
        void v73[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1030);
        v74[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v74 forKeys:v73 count:5];
        uint64_t v26 = v64;
        uint64_t v27 = v16;
        uint64_t v28 = 17;
        break;
      case 18:
        id v66 = (void *)MEMORY[0x263F087E8];
        uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
        v71[0] = *MEMORY[0x263F08320];
        id v17 = [NSString stringWithUTF8String:"QRCode decoding error"];
        uint64_t v67 = *MEMORY[0x263F08608];
        v72[0] = v17;
        v72[1] = v6;
        v71[1] = v67;
        void v71[2] = @"Line";
        void v72[2] = &unk_26D307AC8;
        v71[3] = @"Method";
        uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
        v72[3] = v19;
        v71[4] = *MEMORY[0x263F07F80];
        uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1032);
        v72[4] = v20;
        uint64_t v25 = [NSDictionary dictionaryWithObjects:v72 forKeys:v71 count:5];
        uint64_t v26 = v66;
        uint64_t v27 = v16;
        uint64_t v28 = 21;
        break;
      default:
        goto LABEL_15;
    }
  }
  else
  {
    id v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
    v103[0] = *MEMORY[0x263F08320];
    id v17 = [NSString stringWithUTF8String:"Unknown Error"];
    uint64_t v24 = *MEMORY[0x263F08608];
    v104[0] = v17;
    v104[1] = v6;
    v103[1] = v24;
    v103[2] = @"Line";
    v104[2] = &unk_26D307948;
    v103[3] = @"Method";
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v104[3] = v19;
    v103[4] = *MEMORY[0x263F07F80];
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 981);
    v104[4] = v20;
    uint64_t v21 = NSDictionary;
    uint64_t v22 = v104;
    id v23 = v103;
LABEL_12:
    uint64_t v25 = [v21 dictionaryWithObjects:v22 forKeys:v23 count:5];
    uint64_t v26 = v15;
    uint64_t v27 = v16;
    uint64_t v28 = 5;
  }
  a2 = [v26 errorWithDomain:v27 code:v28 userInfo:v25];

LABEL_14:
LABEL_15:

  return (id)(id)a2;
}

- (id)_translateNfcdXPCHelperError:(id)a3
{
  v40[5] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v6 = v5;
  if (!v5) {
    goto LABEL_7;
  }
  uint64_t v7 = [v5 domain];
  char v8 = [v7 isEqual:@"nfcd"];

  if ((v8 & 1) == 0)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSReader _translateNfcdXPCHelperError:]", 1040, self, @"Wrong domain", v9, v10, v32);
    int v12 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v39[0] = *MEMORY[0x263F08320];
    char v14 = [NSString stringWithUTF8String:"Unknown Error"];
    uint64_t v22 = *MEMORY[0x263F08608];
    v40[0] = v14;
    v40[1] = v6;
    v39[1] = v22;
    v39[2] = @"Line";
    v40[2] = &unk_26D307AE0;
    v39[3] = @"Method";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v40[3] = v16;
    v39[4] = *MEMORY[0x263F07F80];
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1041);
    v40[4] = v17;
    uint64_t v18 = NSDictionary;
    uint64_t v19 = v40;
    uint64_t v20 = v39;
    goto LABEL_9;
  }
  int v11 = [v6 code];
  if (v11 > 14)
  {
    if (v11 == 21)
    {
      uint64_t v29 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
      v35[0] = *MEMORY[0x263F08320];
      char v14 = [NSString stringWithUTF8String:"TNEP connection error"];
      uint64_t v30 = *MEMORY[0x263F08608];
      v36[0] = v14;
      v36[1] = v6;
      v35[1] = v30;
      v35[2] = @"Line";
      v36[2] = &unk_26D307B10;
      v35[3] = @"Method";
      uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v36[3] = v16;
      v35[4] = *MEMORY[0x263F07F80];
      id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1054);
      void v36[4] = v17;
      id v23 = [NSDictionary dictionaryWithObjects:v36 forKeys:v35 count:5];
      uint64_t v24 = v29;
      uint64_t v25 = v13;
      uint64_t v26 = 23;
      goto LABEL_14;
    }
    if (v11 != 15) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v37[0] = *MEMORY[0x263F08320];
    char v14 = [NSString stringWithUTF8String:"NFC tear"];
    uint64_t v28 = *MEMORY[0x263F08608];
    v38[0] = v14;
    v38[1] = v6;
    v37[1] = v28;
    v37[2] = @"Line";
    v38[2] = &unk_26D307AF8;
    v37[3] = @"Method";
    uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v38[3] = v16;
    v37[4] = *MEMORY[0x263F07F80];
    id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1052);
    v38[4] = v17;
    id v23 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:5];
    uint64_t v24 = v27;
    uint64_t v25 = v13;
    uint64_t v26 = 22;
    goto LABEL_14;
  }
  if (!v11)
  {
LABEL_7:
    uint64_t v21 = 0;
    goto LABEL_15;
  }
  if (v11 == 5) {
    goto LABEL_12;
  }
LABEL_6:
  int v12 = (void *)MEMORY[0x263F087E8];
  uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
  v33[0] = *MEMORY[0x263F08320];
  char v14 = [NSString stringWithUTF8String:"Unknown Error"];
  uint64_t v15 = *MEMORY[0x263F08608];
  v34[0] = v14;
  v34[1] = v6;
  v33[1] = v15;
  v33[2] = @"Line";
  v34[2] = &unk_26D307B28;
  v33[3] = @"Method";
  uint64_t v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v34[3] = v16;
  void v33[4] = *MEMORY[0x263F07F80];
  id v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 1056);
  v34[4] = v17;
  uint64_t v18 = NSDictionary;
  uint64_t v19 = v34;
  uint64_t v20 = v33;
LABEL_9:
  id v23 = [v18 dictionaryWithObjects:v19 forKeys:v20 count:5];
  uint64_t v24 = v12;
  uint64_t v25 = v13;
  uint64_t v26 = 5;
LABEL_14:
  uint64_t v21 = [v24 errorWithDomain:v25 code:v26 userInfo:v23];

LABEL_15:
  return v21;
}

- (unint64_t)type
{
  return self->_type;
}

- (NSData)sessionTranscriptBytes
{
  return self->_sessionTranscriptBytes;
}

- (void)setSessionTranscriptBytes:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (STSXPCClientNotificationListener)stsNotificationListener
{
  return self->_stsNotificationListener;
}

- (void)setStsNotificationListener:(id)a3
{
}

- (NFSecureTransactionServicesHandoverSession)handoverSession
{
  return self->_handoverSession;
}

- (void)setHandoverSession:(id)a3
{
}

- (id)tnepStatusHandler
{
  return self->_tnepStatusHandler;
}

- (void)setTnepStatusHandler:(id)a3
{
}

- (id)sessionStartCompletion
{
  return self->_sessionStartCompletion;
}

- (void)setSessionStartCompletion:(id)a3
{
}

- (id)connectionHandler
{
  return self->_connectionHandler;
}

- (void)setConnectionHandler:(id)a3
{
}

- (id)sendRequestCompletion
{
  return self->_sendRequestCompletion;
}

- (void)setSendRequestCompletion:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (BOOL)alternativeCarrierConnected
{
  return self->_alternativeCarrierConnected;
}

- (void)setAlternativeCarrierConnected:(BOOL)a3
{
  self->_alternativeCarrierConnected = a3;
}

- (STSTimer)responseTimeout
{
  return self->_responseTimeout;
}

- (void)setResponseTimeout:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setState:(int64_t)a3
{
  self->_os_activity_scope_state_s state = a3;
}

- (BOOL)queuePaused
{
  return self->_queuePaused;
}

- (void)setQueuePaused:(BOOL)a3
{
  self->_queuePaused = a3;
}

- (int64_t)transmissionState
{
  return self->_transmissionState;
}

- (void)setTransmissionState:(int64_t)a3
{
  self->_transmissionState = a3;
}

- (STSHardwareManagerWrapper)nfHwManager
{
  return self->_nfHwManager;
}

- (void)setNfHwManager:(id)a3
{
}

- (STSHelperLibrary)stsHelper
{
  return self->_stsHelper;
}

- (void)setStsHelper:(id)a3
{
}

- (unint64_t)engagementConfiguration
{
  return self->_engagementConfiguration;
}

- (void)setEngagementConfiguration:(unint64_t)a3
{
  self->_engagementConfiguration = a3;
}

- (STSCASessionStats)caSessionStats
{
  return self->_caSessionStats;
}

- (void)setCaSessionStats:(id)a3
{
}

- (NFSession)initiatingSession
{
  return self->_initiatingSession;
}

- (void)setInitiatingSession:(id)a3
{
}

- (NFSecureElementManagerSession)proxyReaderSESession
{
  return self->_proxyReaderSESession;
}

- (void)setProxyReaderSESession:(id)a3
{
}

- (NFSecureElementReaderProxyListener)seProxyListener
{
  return self->_seProxyListener;
}

- (void)setSeProxyListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong((id *)&self->_proxyReaderSESession, 0);
  objc_storeStrong((id *)&self->_initiatingSession, 0);
  objc_storeStrong((id *)&self->_caSessionStats, 0);
  objc_storeStrong((id *)&self->_stsHelper, 0);
  objc_storeStrong((id *)&self->_nfHwManager, 0);
  objc_storeStrong((id *)&self->_responseTimeout, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_sendRequestCompletion, 0);
  objc_storeStrong(&self->_connectionHandler, 0);
  objc_storeStrong(&self->_sessionStartCompletion, 0);
  objc_storeStrong(&self->_tnepStatusHandler, 0);
  objc_storeStrong((id *)&self->_handoverSession, 0);
  objc_storeStrong((id *)&self->_stsNotificationListener, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_sessionTranscriptBytes, 0);
}

@end