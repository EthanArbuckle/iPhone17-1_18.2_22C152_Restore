@interface BTSmartRoutingPipe
- (BOOL)_isPipeCleared;
- (BTSmartRoutingPipe)init;
- (void)_activateWithDispatch:(id)a3;
- (void)_invalidate;
- (void)_pipeCleanup;
- (void)_pipeConnectionComplete:(id)a3 andWxHeadset:(id)a4 isSender:(BOOL)a5;
- (void)_pipeDone;
- (void)_pipeEnsureStarted;
- (void)_pipeEnsureStopped;
- (void)_pipeReceivedRouteRequest:(id)a3 options:(id)a4 responseHandler:(id)a5;
- (void)_pipeRequestCompleted:(id)a3 error:(id)a4;
- (void)_pipeRequestResponse:(id)a3 error:(id)a4;
- (void)_pipeSendRouteRequestToSFDevice:(id)a3 andWxHeadset:(id)a4 newPipe:(BOOL)a5 connectionResult:(id)a6 completion:(id)a7;
- (void)_runPipeStates;
@end

@implementation BTSmartRoutingPipe

- (BTSmartRoutingPipe)init
{
  v6.receiver = self;
  v6.super_class = (Class)BTSmartRoutingPipe;
  v2 = [(BTSmartRoutingPipe *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

- (void)_activateWithDispatch:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);

  [(BTSmartRoutingPipe *)self _pipeEnsureStarted];
}

- (void)_invalidate
{
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_invalidateCalled = 1;

  [(BTSmartRoutingPipe *)self _pipeCleanup];
}

- (BOOL)_isPipeCleared
{
  return self->_client == 0;
}

- (void)_runPipeStates
{
  if (!self->_invalidateCalled)
  {
    int state = self->_state;
    switch(state)
    {
      case 12:
        if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
        {
          inError = self->_inError;
          LogPrintF();
        }
        [(BTSmartRoutingPipe *)self _pipeCleanup];
        break;
      case 11:
        if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
          LogPrintF();
        }
        [(BTSmartRoutingPipe *)self _pipeDone];
        break;
      case 10:
        self->_int state = 11;
        break;
    }
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_pipeEnsureStarted
{
  p_pipeResponder = &self->_pipeResponder;
  v4 = self->_pipeResponder;
  if (!v4)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v4 = (RPCompanionLinkClient *)objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)p_pipeResponder, v4);
    [(RPCompanionLinkClient *)v4 setControlFlags:(unint64_t)[(RPCompanionLinkClient *)v4 controlFlags] | 2];
    [(RPCompanionLinkClient *)v4 setDispatchQueue:self->_dispatchQueue];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100056968;
    v6[3] = &unk_100232738;
    v6[4] = self;
    [(RPCompanionLinkClient *)v4 activateWithCompletion:v6];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100056A24;
    v5[3] = &unk_100233DB8;
    v5[4] = self;
    [(RPCompanionLinkClient *)v4 registerRequestID:@"com.apple.SmartRoutingRequest" options:0 handler:v5];
  }
}

- (void)_pipeEnsureStopped
{
  if (self->_pipeResponder)
  {
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    [(RPCompanionLinkClient *)self->_pipeResponder invalidate];
    pipeResponder = self->_pipeResponder;
    self->_pipeResponder = 0;
  }
  [(BTSmartRoutingPipe *)self _pipeCleanup];
  client = self->_client;
  if (client)
  {
    self->_client = 0;
  }
}

- (void)_pipeCleanup
{
  inCompletion = (void (**)(id))self->_inCompletion;
  if (inCompletion)
  {
    if (self->_inError)
    {
      inCompletion[2](self->_inCompletion);
    }
    else
    {
      v4 = NSErrorF();
      ((void (*)(void (**)(id), void *))inCompletion[2])(inCompletion, v4);
    }
    id v5 = self->_inCompletion;
    self->_inCompletion = 0;
  }
  self->_invalidateCalled = 0;
  senderIDS = self->_senderIDS;
  if (senderIDS)
  {
    self->_senderIDS = 0;
  }
  self->_score = 0;
  client = self->_client;
  if (client)
  {
    [(RPCompanionLinkClient *)client invalidate];
    v8 = self->_client;
    self->_client = 0;
  }
}

- (void)_pipeConnectionComplete:(id)a3 andWxHeadset:(id)a4 isSender:(BOOL)a5
{
  BOOL v29 = a5;
  v7 = (__CFString *)a4;
  if (a3) {
    int v8 = 12;
  }
  else {
    int v8 = 11;
  }
  v30 = self;
  self->_int state = v8;
  id v9 = a3;
  uint64_t v10 = CUPrintNSError();
  v11 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  v12 = [v11 pipePendingRequest];
  v13 = [v12 timer];

  if (v13) {
    dispatch_source_cancel(v13);
  }
  v14 = [v11 pipePendingRequest];
  [v14 setTimer:0];

  [v11 setPipePendingRequest:0];
  [v11 _setTipiElectionInProgress:0];
  [v11 _setTipiElectionReceivedLePipe:&stru_10023D730];
  [v11 _startTipiSetupTicks];
  if (!a3) {
    [v11 _setIsFirstConnentionAfterSREnable:0 forDevice:v7];
  }
  if (v7) {
    v15 = v7;
  }
  else {
    v15 = &stru_10023D730;
  }
  v16 = v15;
  uint64_t v17 = [v11 _getWxFWVersion:v16];
  v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = &stru_10023D730;
  }
  v20 = v19;

  id v21 = [v11 _getWxProductID:v16];
  v31[0] = @"pipeError";
  v31[1] = @"pipeError2";
  v32[0] = v10;
  v32[1] = v10;
  v31[2] = @"pipeErrorCode";
  v28 = (void *)v10;
  id v22 = [v9 code];

  v23 = +[NSNumber numberWithInteger:v22];
  v32[2] = v23;
  v32[3] = v20;
  v31[3] = @"wxBuildVersion";
  v31[4] = @"wxPD";
  v24 = +[NSNumber numberWithUnsignedInt:v21];
  v32[4] = v24;
  v31[5] = @"isSender";
  v25 = +[NSNumber numberWithBool:v29];
  v32[5] = v25;
  v31[6] = @"isSender2";
  v26 = +[NSNumber numberWithBool:v29];
  v32[6] = v26;
  v27 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:7];

  CUMetricsLogEx();
  [(BTSmartRoutingPipe *)v30 _runPipeStates];
}

- (void)_pipeSendRouteRequestToSFDevice:(id)a3 andWxHeadset:(id)a4 newPipe:(BOOL)a5 connectionResult:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  id v13 = a3;
  id v14 = a4;
  id v32 = a6;
  id v15 = a7;
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x2020000000;
  BOOL v44 = v9;
  id v16 = objc_alloc_init((Class)NSMutableDictionary);
  uint64_t v17 = v16;
  if (v9)
  {
    id v18 = objc_alloc_init((Class)RPCompanionLinkDevice);
    [v18 setIdentifier:v13];
    inError = self->_inError;
    self->_inError = 0;

    id v20 = objc_retainBlock(v15);
    id inCompletion = self->_inCompletion;
    self->_id inCompletion = v20;

    objc_storeStrong((id *)&self->_senderIDS, a3);
    id v22 = objc_alloc_init((Class)RPCompanionLinkClient);
    objc_storeStrong((id *)&self->_client, v22);
    [v22 setControlFlags:((unint64_t)[v22 controlFlags] | 0x600100)];
    [v22 setDestinationDevice:v18];
    [v22 setDispatchQueue:self->_dispatchQueue];
    if (objc_opt_respondsToSelector()) {
      [v22 setBleClientUseCase:18];
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_100057380;
    v41[3] = &unk_100232A38;
    v41[4] = self;
    id v23 = v14;
    id v42 = v23;
    [v22 activateWithCompletion:v41];
    self->_int state = 10;
    v24 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
    v25 = [v24 _myBluetoothAddressString];
    [v17 setObject:v25 forKeyedSubscript:@"btAddress"];

    v26 = (void *)GestaltCopyAnswer();
    [v17 setObject:v26 forKeyedSubscript:@"btName"];

    v27 = +[NSNumber numberWithUnsignedInt:arc4random()];
    [v17 setObject:v27 forKeyedSubscript:@"btXID"];

    [v17 setObject:v23 forKeyedSubscript:@"wxAddress"];
    [v17 setObject:&off_100244058 forKeyedSubscript:@"version"];
  }
  else
  {
    [v16 setObject:v32 forKeyedSubscript:@"btConnectionResult"];
    [v17 setObject:&off_100244058 forKeyedSubscript:@"version"];
    [v17 setObject:v14 forKeyedSubscript:@"wxAddress"];
  }
  v28 = self->_client;
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  uint64_t v40 = 0;
  uint64_t v40 = mach_absolute_time();
  uint64_t v45 = RPOptionTimeoutSeconds;
  v46 = &off_1002448E0;
  BOOL v29 = +[NSDictionary dictionaryWithObjects:&v46 forKeys:&v45 count:1];
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_100057410;
  v33[3] = &unk_100233DE0;
  id v30 = v13;
  id v34 = v30;
  v35 = self;
  id v31 = v14;
  id v36 = v31;
  v37 = v39;
  v38 = v43;
  [(RPCompanionLinkClient *)v28 sendRequestID:@"com.apple.SmartRoutingRequest" request:v17 options:v29 responseHandler:v33];

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v43, 8);
}

- (void)_pipeReceivedRouteRequest:(id)a3 options:(id)a4 responseHandler:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  CFStringGetTypeID();
  v75 = v8;
  uint64_t v10 = CFDictionaryGetTypedValue();
  v11 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
  v12 = [v11 pipePendingRequest];
  if (!v12) {
    goto LABEL_3;
  }
  id v13 = [v11 pipePendingRequest];
  id v14 = [v13 senderIDS];
  unsigned __int8 v15 = [v14 isEqualToString:v10];

  if (v15)
  {
LABEL_3:
    id v16 = objc_alloc_init(BTSmartRoutingRouteRequest);
    uint64_t v17 = NSDictionaryGetNSNumber();
    [(BTSmartRoutingRouteRequest *)v16 setBtXID:v17];

    [(BTSmartRoutingRouteRequest *)v16 setRequest:v7];
    [(BTSmartRoutingRouteRequest *)v16 setResponseHandler:v9];
    [(BTSmartRoutingRouteRequest *)v16 setSenderIDS:v10];
    uint64_t v97 = 0;
    v98 = &v97;
    uint64_t v99 = 0x3032000000;
    v100 = sub_10001E20C;
    v101 = sub_10001E21C;
    id v102 = 0;
    v91[0] = _NSConcreteStackBlock;
    v91[1] = 3221225472;
    v91[2] = sub_1000584C0;
    v91[3] = &unk_100233E08;
    v96 = &v97;
    id v18 = v10;
    id v92 = v18;
    id v19 = v7;
    id v93 = v19;
    v94 = self;
    v95 = v16;
    id v20 = objc_retainBlock(v91);
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v55 = v18;
      id v58 = v19;
      LogPrintF();
    }
    [v11 _powerLogSmartIncomingConnection:v55, v58];
    id v22 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
    unsigned int v23 = [v22 _isForceRejectPipe];

    if (v23)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v24 = NSErrorF();
      v25 = (void *)v98[5];
      v98[5] = v24;
      goto LABEL_56;
    }
    CFStringGetTypeID();
    v72 = CFDictionaryGetTypedValue();
    CFStringGetTypeID();
    v73 = CFDictionaryGetTypedValue();
    v74 = [v19 objectForKey:@"version"];
    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      v56 = v74;
      LogPrintF();
    }
    -[BTSmartRoutingRouteRequest setVersion:](v16, "setVersion:", v74, v56);
    [v74 doubleValue];
    if (v26 >= 1.2)
    {
      if (v72)
      {
        v27 = [v11 pipePendingRequest];
        BOOL v28 = v27 == 0;

        if (!v28)
        {
          BOOL v29 = [v11 pipePendingRequest];
          unsigned int v30 = [v29 progressStarted];

          if (v30)
          {
            id v31 = [v11 pipePendingRequest];
            [v31 setProgressStarted:0];

            [v11 _setTipiElectionInProgress:0];
            [v11 _setTipiElectionReceivedLePipe:&stru_10023D730];
            [(BTSmartRoutingPipe *)self _pipeRequestCompleted:v16 error:0];
            if ([v72 isEqual:@"connectionResultError"])
            {
              if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
              {
                id v57 = v74;
                LogPrintF();
              }
              v48 = [v11 pipePendingRequest:v57];
              v68 = [v48 wxAddress];

              v49 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
              v50 = NSErrorF();
              [v49 _updateOtherTipiDevice:v68 otherAddress:0 otherName:0 otherVersion:0 withResult:v50];

              v66 = NSErrorF();
              [(BTSmartRoutingPipe *)self _pipeConnectionComplete:v66 andWxHeadset:v68 isSender:0];

LABEL_54:
              goto LABEL_55;
            }
            [(BTSmartRoutingPipe *)self _pipeConnectionComplete:0 andWxHeadset:v73 isSender:0];
            v69 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
            [v69 _notifyOtherTipiDeviceTipiScoreChanged:0 andNewScore:0];
          }
LABEL_55:

          v25 = v72;
LABEL_56:

          ((void (*)(void *))v20[2])(v20);
          _Block_object_dispose(&v97, 8);

          goto LABEL_57;
        }
      }
    }
    id v32 = [v11 pipePendingRequest];

    if (v32)
    {
      if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      id v34 = [v11 pipePendingRequest];
      v35 = [v34 timer];

      if (v35) {
        dispatch_source_cancel(v35);
      }
      id v36 = [v11 pipePendingRequest];
      [v36 setTimer:0];

      [v11 setPipePendingRequest:0];
    }
    CFStringGetTypeID();
    v68 = CFDictionaryGetTypedValue();
    if (v68)
    {
      CFStringGetTypeID();
      v65 = CFDictionaryGetTypedValue();
      if (v65)
      {
        v70 = [v11 _verifyWxConnectedBTAddress:v73 withVersion:v74];
        v37 = [v70 identifier];
        unsigned int v38 = [v37 isEqualToString:@"FF:FF:FF:FF:FF:FF"];

        if (v38)
        {
          uint64_t v39 = NSErrorF();
          uint64_t v40 = (void *)v98[5];
          v98[5] = v39;
        }
        else
        {
          v41 = [v70 btAddressData];
          uint64_t v64 = CUPrintNSDataAddress();

          if ([v11 _verifyWxConnectedRouted:v64])
          {
            id v42 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
            [(BTSmartRoutingRouteRequest *)v16 setTimer:v42];
            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_100058594;
            handler[3] = &unk_100233E30;
            id v85 = v18;
            id v86 = v19;
            v87 = self;
            v88 = v16;
            v89 = v11;
            id v43 = v70;
            id v90 = v43;
            dispatch_source_set_event_handler(v42, handler);
            CUDispatchTimerSet();
            dispatch_activate(v42);
            [(BTSmartRoutingRouteRequest *)v16 setWxAddress:v64];
            v61 = v42;
            BOOL v44 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
            v63 = [v44 _myBluetoothAddressString];

            if (v63)
            {
              v103[0] = v63;
              v103[1] = v68;
              uint64_t v45 = +[NSArray arrayWithObjects:v103 count:2];
              if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
              {
                id v57 = v43;
                v60 = v45;
                LogPrintF();
              }
              [v11 setPipePendingRequest:v16, v57, v60];
              [v11 _setTipiElectionInProgress:1];
              [v11 _setTipiElectionReceivedLePipe:v64];
              [(BTSmartRoutingRouteRequest *)v16 setProgressStarted:1];
              [v11 _startTipiSetupTicks];
              v46 = [v43 btAddressData];
              v47 = CUPrintNSDataAddress();
              [v11 _updateOtherTipiDevice:v47 otherAddress:v68 otherName:v65 otherVersion:v74 withResult:0];

              v77[0] = _NSConcreteStackBlock;
              v77[1] = 3221225472;
              v77[2] = sub_1000586D4;
              v77[3] = &unk_100233E58;
              id v78 = v73;
              v79 = v45;
              v80 = v11;
              id v81 = v43;
              v82 = self;
              v83 = v16;
              [v11 _updateAccessoryID:v81 connectionDeviceAddresses:v45 completion:v77];
            }
            else
            {
              uint64_t v54 = NSErrorF();
              uint64_t v45 = (void *)v98[5];
              v98[5] = v54;
            }
          }
          else
          {
            uint64_t v53 = NSErrorF();
            v62 = (void *)v98[5];
            v98[5] = v53;
          }
          uint64_t v40 = (void *)v64;
        }
      }
      else
      {
        uint64_t v52 = NSErrorF();
        v71 = (void *)v98[5];
        v98[5] = v52;
      }
    }
    else
    {
      uint64_t v51 = NSErrorF();
      v67 = (void *)v98[5];
      v98[5] = v51;
    }
    goto LABEL_54;
  }
  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    id v21 = [v11 pipePendingRequest];
    v59 = [v21 senderIDS];
    LogPrintF();
  }
  v33 = NSErrorF();
  (*((void (**)(id, void, void, void *))v9 + 2))(v9, 0, 0, v33);

LABEL_57:
}

- (void)_pipeRequestCompleted:(id)a3 error:(id)a4
{
  id v20 = a3;
  id v5 = a4;
  id v6 = objc_alloc_init((Class)NSMutableDictionary);
  id v7 = v6;
  if (v5) {
    CFStringRef v8 = @"NO";
  }
  else {
    CFStringRef v8 = @"YES";
  }
  [v6 setObject:v8 forKeyedSubscript:@"connectionResultACK"];
  id v9 = [v20 wxAddress];
  [v7 setObject:v9 forKeyedSubscript:@"wxAddress"];

  [v7 setObject:&off_100244058 forKeyedSubscript:@"version"];
  uint64_t v10 = [v20 btXID];
  [v7 setObject:v10 forKeyedSubscript:@"btXID"];

  if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
  {
    v11 = [v20 senderIDS];
    id v18 = [v20 request];
    id v19 = v7;
    id v16 = v11;
    uint64_t v17 = &off_100244058;
    LogPrintF();
  }
  uint64_t v12 = [v20 responseHandler:v16, v17, v18, v19];
  id v13 = (void *)v12;
  if (v12) {
    (*(void (**)(uint64_t, void *, void, id))(v12 + 16))(v12, v7, 0, v5);
  }

  [v20 setResponseHandler:0];
  id v14 = [v20 timer];
  unsigned __int8 v15 = v14;
  if (v14) {
    dispatch_source_cancel(v14);
  }
  [v20 setTimer:0];
}

- (void)_pipeRequestResponse:(id)a3 error:(id)a4
{
  id v24 = a3;
  id v6 = a4;
  if (v6)
  {
    if (dword_1002610B8 <= 90 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v7 = [v24 senderIDS];
      id v21 = [v24 request];
      id v22 = v6;
      id v20 = v7;
      LogPrintF();
    }
    uint64_t v14 = [v24 responseHandler:v20, v21, v22];
    unsigned __int8 v15 = (void *)v14;
    if (v14) {
      (*(void (**)(uint64_t, void, void, id))(v14 + 16))(v14, 0, 0, v6);
    }

    [v24 setResponseHandler:0];
    id v16 = [v24 timer];
    CFStringRef v8 = v16;
    if (v16) {
      dispatch_source_cancel(v16);
    }
    [v24 setTimer:0];
    uint64_t v17 = [v24 wxAddress];
    [(BTSmartRoutingPipe *)self _pipeConnectionComplete:v6 andWxHeadset:v17 isSender:0];
  }
  else
  {
    CFStringRef v8 = objc_alloc_init((Class)NSMutableDictionary);
    id v9 = +[BTSmartRoutingDaemon sharedBTSmartRoutingDaemon];
    uint64_t v10 = [v9 _myBluetoothAddressString];
    [v8 setObject:v10 forKeyedSubscript:@"btAddress"];

    v11 = (void *)GestaltCopyAnswer();
    [v8 setObject:v11 forKeyedSubscript:@"btName"];

    [v8 setObject:&off_100244058 forKeyedSubscript:@"version"];
    uint64_t v12 = [v24 btXID];
    [v8 setObject:v12 forKeyedSubscript:@"btXID"];

    if (dword_1002610B8 <= 30 && (dword_1002610B8 != -1 || _LogCategory_Initialize()))
    {
      id v13 = [v24 senderIDS];
      id v22 = [v24 request];
      unsigned int v23 = v8;
      id v20 = v13;
      id v21 = &off_100244058;
      LogPrintF();
    }
    uint64_t v18 = [v24 responseHandler:v20, v21, v22, v23];
    id v19 = (void *)v18;
    if (v18) {
      (*(void (**)(uint64_t, NSObject *, void, void))(v18 + 16))(v18, v8, 0, 0);
    }

    [v24 setResponseHandler:0];
  }
}

- (void)_pipeDone
{
  id inCompletion = (void (**)(id, void))self->_inCompletion;
  if (inCompletion)
  {
    inCompletion[2](inCompletion, 0);
    id v4 = self->_inCompletion;
    self->_id inCompletion = 0;
  }

  [(BTSmartRoutingPipe *)self _pipeCleanup];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_senderIDS, 0);
  objc_storeStrong((id *)&self->_pipeResponder, 0);
  objc_storeStrong((id *)&self->_inError, 0);
  objc_storeStrong(&self->_inCompletion, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);

  objc_storeStrong((id *)&self->_client, 0);
}

@end