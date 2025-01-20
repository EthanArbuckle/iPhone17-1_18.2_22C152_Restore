@interface STSSession
+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 outError:(id *)a5;
- (BOOL)supportsSecureRanging;
- (NFSecureElementProxyListener)seProxyListener;
- (STSSession)init;
- (id)_translateXPCClientNotificationStatus:(unint64_t)a3;
- (id)canStartSession;
- (id)createHandlerForCredential:(id)a3;
- (id)enableExpressModeForActiveCredential:(BOOL)a3;
- (id)enablePlasticCardMode:(BOOL)a3;
- (id)felicaCredentialState:(id)a3 error:(id *)a4;
- (id)releaseCredential:(id)a3 withAuthorization:(id)a4;
- (id)releaseCredential:(id)a3 withAuthorization:(id)a4 iso18013Selection:(id)a5;
- (id)rkeCancelFunction:(id)a3;
- (id)rkeGetVehicleReports:(id *)a3;
- (id)rkePauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4;
- (id)rkeResumeRangingForReaderIdentifier:(id)a3;
- (id)rkeSendPassthroughMessage:(id)a3;
- (id)sendRequestCompletion;
- (id)setAuxiliaryCredentials:(id)a3;
- (id)startHandoff;
- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4;
- (id)startWithDelegate:(id)a3;
- (id)startWithDelegate:(id)a3 callback:(id)a4;
- (id)startWithNotificationTesterDelegate:(id)a3 outNotificationListener:(id *)a4;
- (id)stopTransaction;
- (id)transitCredentialState:(id)a3 error:(id *)a4;
- (void)_activateInvalidationHandler:(id)a3;
- (void)_activateOnConnectCompletion;
- (void)_activateSendRequestCompletion:(id)a3 sessionTerminationRequested:(BOOL)a4 error:(id)a5;
- (void)fireDidExpireTransaction:(BOOL)a3;
- (void)fireDidFailDeferredAuth:(BOOL)a3;
- (void)fireDidPerformAuxiliaryTransactions:(id)a3;
- (void)fireDidReceive18013Requests:(id)a3 readerAuthInfo:(id)a4;
- (void)fireDidReceiveActivityTimeout:(id)a3;
- (void)fireDidReceivePassthroughMessage:(id)a3;
- (void)fireDigitalCarKeyEventPayload:(id)a3;
- (void)fireExpressModeStateChangeWithInfo:(id)a3;
- (void)fireFieldDetectEvent:(BOOL)a3;
- (void)fireFieldNotificationEvent:(id)a3;
- (void)fireHasPendingServerRequest:(BOOL)a3;
- (void)fireRequestHandoverConfirmation;
- (void)fireSessionDidConsumeAuthorizationEvent;
- (void)fireSessionEndEvent:(id)a3;
- (void)fireTransactionEndEvent:(id)a3;
- (void)fireTransactionStartEvent:(id)a3;
- (void)generateHandoverRequestForQRCodeWithConfiguration:(unint64_t)a3 responseHandler:(id)a4;
- (void)handoverSelected:(unint64_t)a3;
- (void)iso18013DataRetrievalCompleted;
- (void)relinquishSEProxy;
- (void)reqlinquishNFCReaderProxy;
- (void)restartNFCReaderDiscovery;
- (void)rkeSendFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6;
- (void)setSeProxyListener:(id)a3;
- (void)setSendRequestCompletion:(id)a3;
- (void)testSendToAlternativeCarrier:(id)a3 completion:(id)a4;
@end

@implementation STSSession

- (void)generateHandoverRequestForQRCodeWithConfiguration:(unint64_t)a3 responseHandler:(id)a4
{
  v51[4] = *MEMORY[0x263EF8340];
  v7 = (void (**)(id, void, void *))a4;
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]", 64, self, @"dataRetrievalType = 0x%x", v8, v9, a3);
  v10 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]", 67, self, @"Invalid ISO18013 configuration", v12, v13, v45);
    v32 = (void *)MEMORY[0x263F087E8];
    v17 = [NSString stringWithUTF8String:"STS.fwk"];
    v50[0] = *MEMORY[0x263F08320];
    v19 = [NSString stringWithUTF8String:"Invalid State"];
    v51[0] = v19;
    v51[1] = &unk_26D307BA0;
    v50[1] = @"Line";
    v50[2] = @"Method";
    v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v51[2] = v29;
    v50[3] = *MEMORY[0x263F07F80];
    v33 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 68);
    v51[3] = v33;
    v34 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
    v35 = [v32 errorWithDomain:v17 code:9 userInfo:v34];
    v7[2](v7, 0, v35);

    goto LABEL_13;
  }
  v14 = [ISO18013Handler alloc];
  v15 = [(STSSessionBase *)self callbackQueue];
  v16 = v15;
  if (!v14)
  {

    goto LABEL_12;
  }
  v17 = (id *)sub_221181FA0(v14, (uint64_t)self, v14, 1, v15);

  if (!v17)
  {
LABEL_12:
    v40 = (void *)MEMORY[0x263F087E8];
    v19 = [NSString stringWithUTF8String:"STS.fwk"];
    v48[0] = *MEMORY[0x263F08320];
    v29 = [NSString stringWithUTF8String:"Unexpected Result"];
    v49[0] = v29;
    v49[1] = &unk_26D307BB8;
    v48[1] = @"Line";
    v48[2] = @"Method";
    v41 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v49[2] = v41;
    v48[3] = *MEMORY[0x263F07F80];
    v42 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 76);
    v49[3] = v42;
    v43 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    v44 = [v40 errorWithDomain:v19 code:10 userInfo:v43];
    v7[2](v7, 0, v44);

    v17 = 0;
    goto LABEL_13;
  }
  v18 = [(STSSessionBase *)self handler];
  v19 = [v18 activeSTSCredential];

  v20 = [(STSSessionBase *)self handler];
  v21 = [v20 handoffToken];
  [v17 setHandoffToken:v21];

  v22 = [(STSSessionBase *)self handler];
  [v22 tearDownWithCompletion:0];

  [(STSSessionBase *)self setHandler:v17];
  v23 = [(STSSessionBase *)self handler];
  id v24 = (id)[v23 setActiveCredential:v19];

  [(STSSession *)self setSendRequestCompletion:v7];
  v25 = [[NFSecureElementProxyListener alloc] initWithSTSSession:self];
  [(STSSession *)self setSeProxyListener:v25];

  id v26 = v17[9];
  v27 = [(STSSession *)self seProxyListener];
  v28 = [(STSSessionBase *)self callbackQueue];
  v29 = [v26 startSEProxyListener:v27 parameters:MEMORY[0x263EFFA78] workQueue:v28];

  if (v29)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Identity) generateHandoverRequestForQRCodeWithConfiguration:responseHandler:]", 113, self, @"SE proxy listener start error=%{public}@", v30, v31, (uint64_t)v29);
    v7[2](v7, 0, v29);
  }
  else
  {
    unint64_t v36 = a3 & 7 | 0x40;
    id v37 = v17[9];
    v38 = [v37 startISO18013WithConnectionHandoverConfiguration:v36 type:0 credentialType:2 delegate:self];

    if (v38)
    {
      v7[2](v7, 0, v38);
    }
    else
    {
      id v39 = v17[9];
      v46[0] = MEMORY[0x263EF8330];
      v46[1] = 3221225472;
      v46[2] = sub_221180684;
      v46[3] = &unk_264594910;
      v46[4] = self;
      v47 = v7;
      [v39 generateQRCodeCHRequestAndStartACWithQueue:0 responseHandler:v46];
    }
    v29 = 0;
  }
LABEL_13:
}

- (void)iso18013DataRetrievalCompleted
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) iso18013DataRetrievalCompleted]", 141, self, &stru_26D2FDEC0, v2, v3, v4);
}

- (void)relinquishSEProxy
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) relinquishSEProxy]", 145, self, &stru_26D2FDEC0, v2, v3, v9);
  uint64_t v5 = [(STSSessionBase *)self handler];
  v6 = (void *)v5;
  if (v5) {
    v7 = *(void **)(v5 + 72);
  }
  else {
    v7 = 0;
  }
  id v8 = v7;
  [v8 stopSEProxyListener];

  [(STSSession *)self setSeProxyListener:0];
}

- (void)restartNFCReaderDiscovery
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) restartNFCReaderDiscovery]", 153, self, &stru_26D2FDEC0, v2, v3, v4);
}

- (void)reqlinquishNFCReaderProxy
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) reqlinquishNFCReaderProxy]", 157, self, &stru_26D2FDEC0, v2, v3, v4);
}

- (void)handoverSelected:(unint64_t)a3
{
  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession(Identity) handoverSelected:]", 161, self, &stru_26D2FDEC0, v3, v4, v5);
}

- (void)_activateInvalidationHandler:(id)a3
{
  id v4 = a3;
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Identity) _activateInvalidationHandler:]", 166, self, @"error=%@", v5, v6, (uint64_t)v4);
  objc_initWeak(&location, self);
  v7 = [(STSSessionBase *)self callbackQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = sub_221180970;
  block[3] = &unk_264594870;
  objc_copyWeak(&v11, &location);
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (void)_activateSendRequestCompletion:(id)a3 sessionTerminationRequested:(BOOL)a4 error:(id)a5
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Identity) _activateSendRequestCompletion:sessionTerminationRequested:error:]", 181, self, @"error=%@", v5, v6, (uint64_t)a5);
}

- (void)_activateOnConnectCompletion
{
  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Identity) _activateOnConnectCompletion]", 185, self, &stru_26D2FDEC0, v2, v3, v4);
}

- (id)_translateXPCClientNotificationStatus:(unint64_t)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  switch(a3)
  {
    case 1uLL:
    case 2uLL:
    case 4uLL:
      uint64_t v4 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v33[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Cancelled"];
      v34[0] = v6;
      v34[1] = &unk_26D307BD0;
      v33[1] = @"Line";
      v33[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v34[2] = v7;
      v33[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 195);
      v34[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
      id v10 = v4;
      id v11 = v5;
      uint64_t v12 = 13;
      goto LABEL_10;
    case 3uLL:
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v31[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Timeout"];
      v32[0] = v6;
      v32[1] = &unk_26D307BE8;
      v31[1] = @"Line";
      v31[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v32[2] = v7;
      v31[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 197);
      v32[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
      id v10 = v14;
      id v11 = v5;
      uint64_t v12 = 4;
      goto LABEL_10;
    case 5uLL:
      v15 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v29[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"No alernative carrier available"];
      v30[0] = v6;
      v30[1] = &unk_26D307C00;
      v29[1] = @"Line";
      v29[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v30[2] = v7;
      v29[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 199);
      v30[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v30 forKeys:v29 count:4];
      id v10 = v15;
      id v11 = v5;
      uint64_t v12 = 14;
      goto LABEL_10;
    case 6uLL:
      v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v27[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Requires Wifi power on"];
      v28[0] = v6;
      v28[1] = &unk_26D307C18;
      v27[1] = @"Line";
      v27[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v28[2] = v7;
      v27[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 201);
      v28[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
      id v10 = v16;
      id v11 = v5;
      uint64_t v12 = 15;
      goto LABEL_10;
    case 7uLL:
      v17 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v25[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Requires Bluetooth power on"];
      v26[0] = v6;
      v26[1] = &unk_26D307C30;
      v25[1] = @"Line";
      v25[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v26[2] = v7;
      v25[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 203);
      v26[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v26 forKeys:v25 count:4];
      id v10 = v17;
      id v11 = v5;
      uint64_t v12 = 16;
      goto LABEL_10;
    case 8uLL:
      v18 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v23[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Alternative Carrier transmission error"];
      v24[0] = v6;
      v24[1] = &unk_26D307C48;
      v23[1] = @"Line";
      v23[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v24[2] = v7;
      v23[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 205);
      v24[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
      id v10 = v18;
      id v11 = v5;
      uint64_t v12 = 19;
      goto LABEL_10;
    case 9uLL:
      v19 = (void *)MEMORY[0x263F087E8];
      uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
      v21[0] = *MEMORY[0x263F08320];
      uint64_t v6 = [NSString stringWithUTF8String:"Invalid State"];
      v22[0] = v6;
      v22[1] = &unk_26D307C60;
      v21[1] = @"Line";
      v21[2] = @"Method";
      v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v22[2] = v7;
      v21[3] = *MEMORY[0x263F07F80];
      id v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 207);
      v22[3] = v8;
      uint64_t v9 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
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

- (void)fireFieldDetectEvent:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 stsSession:self didDetectField:v3];
  }
}

- (void)fireFieldNotificationEvent:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didReceiveFieldNotification:v5];
  }
}

- (void)fireSessionDidConsumeAuthorizationEvent
{
  id v3 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 stsSessionDidConsumeAuthorization:self];
  }
}

- (void)fireTransactionStartEvent:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didStartTransaction:v5];
  }
}

- (void)fireTransactionEndEvent:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didEndTransaction:v5];
  }
}

- (void)fireHasPendingServerRequest:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 stsSession:self hasPendingServerRequest:v3];
  }
}

- (void)fireDidFailDeferredAuth:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 stsSession:self didFailDeferredAuth:v3];
  }
}

- (void)fireExpressModeStateChangeWithInfo:(id)a3
{
  id v8 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    id v5 = v8;
    uint64_t v6 = [v5 state];
    v7 = [v5 detail];

    [v4 stsSession:self didChangeExpressModeState:v6 withObject:v7];
  }
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didChangeExpressModeWithInfo:v8];
  }
}

- (void)fireDidReceiveActivityTimeout:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didReceiveActivityTimeout:v5];
  }
}

- (void)fireDidPerformAuxiliaryTransactions:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didPerformAuxiliaryTransactions:v5];
  }
}

- (void)fireDidExpireTransaction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v5 stsSession:self didExpireTransaction:v3];
  }
}

- (void)fireSessionEndEvent:(id)a3
{
  id v5 = a3;
  if ([(STSSessionBase *)self hasStartedWithDelegate])
  {
    uint64_t v4 = [(STSSessionBase *)self delegate];
    if (objc_opt_respondsToSelector()) {
      [v4 stsSession:self didEnd:v5];
    }
  }
}

- (void)fireDidReceive18013Requests:(id)a3 readerAuthInfo:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  v7 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v7 stsSession:self didReceive18013Requests:v8];
  }
  if (objc_opt_respondsToSelector()) {
    [v7 stsSession:self didReceive18013Requests:v8 readerAuthInfo:v6];
  }
}

- (void)fireDidReceivePassthroughMessage:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self didReceivePassthroughMessage:v5];
  }
}

- (void)fireDigitalCarKeyEventPayload:(id)a3
{
  id v5 = a3;
  uint64_t v4 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 stsSession:self digitalCarKeyEventPayload:v5];
  }
}

- (void)fireRequestHandoverConfirmation
{
  id v3 = [(STSSessionBase *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 stsSessionRequestHandoffConfirmation:self];
  }
}

- (id)setAuxiliaryCredentials:(id)a3
{
  v39[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_221170000, "setAuxiliaryCredentials:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 23, self, @"%@", v7, v8, (uint64_t)v5);
  uint64_t v9 = [(STSSessionBase *)self handler];

  if (v9)
  {
    uint64_t v12 = [(STSSessionBase *)self handler];
    int v13 = [v12 supportedCredentialType];

    if (v13 == 1) {
      goto LABEL_6;
    }
    v14 = [(STSSessionBase *)self handler];
    v15 = [v14 activeSTSCredential];
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 33, self, @"new handler required, switching credential from %@ to STSCredentialTypeApplet", v16, v17, (uint64_t)v15);

    v18 = [(STSTransactionHandler *)[PaymentHandler alloc] initWithParent:self];
    v19 = [(STSSessionBase *)self handler];
    [v19 tearDownWithCompletion:0];
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 27, self, @"Creating initial handler", v10, v11, v36);
    v18 = [(STSTransactionHandler *)[PaymentHandler alloc] initWithParent:self];
  }
  [(STSSessionBase *)self setHandler:v18];

LABEL_6:
  v20 = [(STSSessionBase *)self handler];

  if (v20)
  {
    uint64_t v23 = [(STSSessionBase *)self activateChildSession];
    if (v23)
    {
      id v26 = (void *)v23;
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 43, self, @"Handler activation failure: %@", v24, v25, v23);
      id v27 = v26;
      v28 = v27;
    }
    else
    {
      v34 = [(STSSessionBase *)self handler];
      v28 = sub_221189CBC((uint64_t)v34, v5);

      id v27 = 0;
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(Auxiliary) setAuxiliaryCredentials:]", 50, self, @"Failed to create payment handler", v21, v22, v36);
    v29 = (void *)MEMORY[0x263F087E8];
    id v27 = [NSString stringWithUTF8String:"STS.fwk"];
    v38[0] = *MEMORY[0x263F08320];
    uint64_t v30 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v39[0] = v30;
    v39[1] = &unk_26D308398;
    v38[1] = @"Line";
    v38[2] = @"Method";
    uint64_t v31 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v39[2] = v31;
    v38[3] = *MEMORY[0x263F07F80];
    v32 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 51);
    v39[3] = v32;
    v33 = [NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:4];
    v28 = [v29 errorWithDomain:v27 code:11 userInfo:v33];
  }
  return v28;
}

- (BOOL)supportsSecureRanging
{
  id v3 = [(STSSessionBase *)self handler];

  if (v3)
  {
    id v6 = [(STSSessionBase *)self handler];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v8 = [(STSSessionBase *)self handler];
    uint64_t v16 = v8;
    if (isKindOfClass)
    {
      char v17 = sub_221196260(v8, v9, v10, v11, v12, v13, v14, v15);

      return v17;
    }
    v19 = (objc_class *)objc_opt_class();
    v20 = NSStringFromClass(v19);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) supportsSecureRanging]", 37, self, @"Invalid handler - %@", v21, v22, (uint64_t)v20);
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) supportsSecureRanging]", 34, self, @"No handler available", v4, v5, v23);
  }
  return 0;
}

- (id)rkeSendPassthroughMessage:(id)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_221170000, "rkeSendPassthroughMessage:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v7 = [(STSSessionBase *)self handler];

  if (v7)
  {
    uint64_t v10 = [(STSSessionBase *)self handler];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v12 = [(STSSessionBase *)self handler];
    uint64_t v13 = v12;
    if (isKindOfClass)
    {
      uint64_t v14 = sub_221196474(v12, v5);
      goto LABEL_7;
    }
    uint64_t v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendPassthroughMessage:]", 52, self, @"Invalid handler - %@", v25, v26, (uint64_t)v24);

    id v27 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v31[0] = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v32[0] = v16;
    v32[1] = &unk_26D308410;
    v31[1] = @"Line";
    v31[2] = @"Method";
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v32[2] = v17;
    v31[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 53);
    v32[3] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
    v20 = v27;
    uint64_t v21 = v13;
    uint64_t v22 = 11;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendPassthroughMessage:]", 49, self, @"No handler available", v8, v9, v29);
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v33[0] = *MEMORY[0x263F08320];
    uint64_t v16 = [NSString stringWithUTF8String:"Invalid State"];
    v34[0] = v16;
    v34[1] = &unk_26D3083F8;
    v33[1] = @"Line";
    v33[2] = @"Method";
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v34[2] = v17;
    v33[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 50);
    v34[3] = v18;
    v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    v20 = v15;
    uint64_t v21 = v13;
    uint64_t v22 = 9;
  }
  uint64_t v14 = [v20 errorWithDomain:v21 code:v22 userInfo:v19];

LABEL_7:
  return v14;
}

- (void)rkeSendFunction:(id)a3 action:(id)a4 authorization:(id)a5 completion:(id)a6
{
  v51[4] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = _os_activity_create(&dword_221170000, "rkeSendFunction:action:authorization:completion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v15, &state);
  os_activity_scope_leave(&state);

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_22119A314;
  aBlock[3] = &unk_264594DE0;
  aBlock[4] = self;
  id v16 = v14;
  id v46 = v16;
  char v17 = (void (**)(void *, void, void *))_Block_copy(aBlock);
  v18 = [(STSSessionBase *)self handler];

  if (!v18)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendFunction:action:authorization:completion:]", 74, self, @"No handler available", v19, v20, v42);
    uint64_t v25 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = [NSString stringWithUTF8String:"STS.fwk"];
    v50[0] = *MEMORY[0x263F08320];
    uint64_t v26 = [NSString stringWithUTF8String:"Invalid State"];
    v51[0] = v26;
    v51[1] = &unk_26D308428;
    v50[1] = @"Line";
    v50[2] = @"Method";
    id v44 = v13;
    id v27 = v12;
    id v28 = v11;
    uint64_t v29 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v51[2] = v29;
    v50[3] = *MEMORY[0x263F07F80];
    uint64_t v30 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 75);
    v51[3] = v30;
    uint64_t v31 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:4];
    v32 = [v25 errorWithDomain:v24 code:9 userInfo:v31];
    v17[2](v17, 0, v32);

    id v11 = v28;
    id v12 = v27;
LABEL_7:
    id v13 = v44;

    goto LABEL_8;
  }
  uint64_t v21 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v23 = [(STSSessionBase *)self handler];
  uint64_t v24 = (void *)v23;
  if ((isKindOfClass & 1) == 0)
  {
    v33 = (objc_class *)objc_opt_class();
    v34 = NSStringFromClass(v33);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeSendFunction:action:authorization:completion:]", 77, self, @"Invalid handler - %@", v35, v36, (uint64_t)v34);

    v43 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = [NSString stringWithUTF8String:"STS.fwk"];
    v48[0] = *MEMORY[0x263F08320];
    uint64_t v26 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v49[0] = v26;
    v49[1] = &unk_26D308440;
    v48[1] = @"Line";
    v48[2] = @"Method";
    objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    id v44 = v13;
    v38 = id v37 = v11;
    v49[2] = v38;
    v48[3] = *MEMORY[0x263F07F80];
    id v39 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 78);
    v49[3] = v39;
    v40 = [NSDictionary dictionaryWithObjects:v49 forKeys:v48 count:4];
    v41 = [v43 errorWithDomain:v24 code:11 userInfo:v40];
    v17[2](v17, 0, v41);

    id v11 = v37;
    goto LABEL_7;
  }
  if (v23) {
    [*(id *)(v23 + 56) sendRKEFunction:v11 action:v12 authorization:v13 completion:v17];
  }
LABEL_8:
}

- (id)rkeCancelFunction:(id)a3
{
  v34[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_221170000, "rkeCancelFunction:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  uint64_t v7 = [(STSSessionBase *)self handler];

  if (v7)
  {
    uint64_t v10 = [(STSSessionBase *)self handler];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    id v12 = [(STSSessionBase *)self handler];
    id v13 = v12;
    if (isKindOfClass)
    {
      id v14 = sub_2211968D0(v12, (uint64_t)v5);
      goto LABEL_7;
    }
    uint64_t v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeCancelFunction:]", 92, self, @"Invalid handler - %@", v25, v26, (uint64_t)v24);

    id v27 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v31[0] = *MEMORY[0x263F08320];
    id v16 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v32[0] = v16;
    v32[1] = &unk_26D308470;
    v31[1] = @"Line";
    v31[2] = @"Method";
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v32[2] = v17;
    v31[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 93);
    v32[3] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
    uint64_t v20 = v27;
    uint64_t v21 = v13;
    uint64_t v22 = 11;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeCancelFunction:]", 89, self, @"No handler available", v8, v9, v29);
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v33[0] = *MEMORY[0x263F08320];
    id v16 = [NSString stringWithUTF8String:"Invalid State"];
    v34[0] = v16;
    v34[1] = &unk_26D308458;
    v33[1] = @"Line";
    v33[2] = @"Method";
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v34[2] = v17;
    v33[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 90);
    v34[3] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    uint64_t v20 = v15;
    uint64_t v21 = v13;
    uint64_t v22 = 9;
  }
  id v14 = [v20 errorWithDomain:v21 code:v22 userInfo:v19];

LABEL_7:
  return v14;
}

- (id)rkePauseRangingForReaderIdentifier:(id)a3 durationInSec:(id)a4
{
  v37[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = _os_activity_create(&dword_221170000, "rkePauseRangingForReaderIdentifier:durationInSec:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  uint64_t v10 = [(STSSessionBase *)self handler];

  if (v10)
  {
    id v13 = [(STSSessionBase *)self handler];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v15 = [(STSSessionBase *)self handler];
    id v16 = v15;
    if (isKindOfClass)
    {
      char v17 = sub_221196910(v15, (uint64_t)v7, (uint64_t)v8);
      goto LABEL_7;
    }
    uint64_t v26 = (objc_class *)objc_opt_class();
    id v27 = NSStringFromClass(v26);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkePauseRangingForReaderIdentifier:durationInSec:]", 108, self, @"Invalid handler - %@", v28, v29, (uint64_t)v27);

    uint64_t v30 = (void *)MEMORY[0x263F087E8];
    id v16 = [NSString stringWithUTF8String:"STS.fwk"];
    v34[0] = *MEMORY[0x263F08320];
    uint64_t v19 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v35[0] = v19;
    v35[1] = &unk_26D3084A0;
    v34[1] = @"Line";
    v34[2] = @"Method";
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v35[2] = v20;
    v34[3] = *MEMORY[0x263F07F80];
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 109);
    v35[3] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:4];
    uint64_t v23 = v30;
    uint64_t v24 = v16;
    uint64_t v25 = 11;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkePauseRangingForReaderIdentifier:durationInSec:]", 105, self, @"No handler available", v11, v12, v32);
    v18 = (void *)MEMORY[0x263F087E8];
    id v16 = [NSString stringWithUTF8String:"STS.fwk"];
    v36[0] = *MEMORY[0x263F08320];
    uint64_t v19 = [NSString stringWithUTF8String:"Invalid State"];
    v37[0] = v19;
    v37[1] = &unk_26D308488;
    v36[1] = @"Line";
    v36[2] = @"Method";
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v37[2] = v20;
    v36[3] = *MEMORY[0x263F07F80];
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 106);
    v37[3] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v37 forKeys:v36 count:4];
    uint64_t v23 = v18;
    uint64_t v24 = v16;
    uint64_t v25 = 9;
  }
  char v17 = [v23 errorWithDomain:v24 code:v25 userInfo:v22];

LABEL_7:
  return v17;
}

- (id)rkeResumeRangingForReaderIdentifier:(id)a3
{
  void v34[4] = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v6 = _os_activity_create(&dword_221170000, "rkeResumeRangingForReaderIdentifier:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  id v7 = [(STSSessionBase *)self handler];

  if (v7)
  {
    uint64_t v10 = [(STSSessionBase *)self handler];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v12 = [(STSSessionBase *)self handler];
    id v13 = v12;
    if (isKindOfClass)
    {
      id v14 = sub_221196950(v12, (uint64_t)v5);
      goto LABEL_7;
    }
    uint64_t v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeResumeRangingForReaderIdentifier:]", 123, self, @"Invalid handler - %@", v25, v26, (uint64_t)v24);

    id v27 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v31[0] = *MEMORY[0x263F08320];
    id v16 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v32[0] = v16;
    v32[1] = &unk_26D3084D0;
    v31[1] = @"Line";
    v31[2] = @"Method";
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v32[2] = v17;
    v31[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 124);
    v32[3] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:4];
    uint64_t v20 = v27;
    uint64_t v21 = v13;
    uint64_t v22 = 11;
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeResumeRangingForReaderIdentifier:]", 120, self, @"No handler available", v8, v9, v29);
    uint64_t v15 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v33[0] = *MEMORY[0x263F08320];
    id v16 = [NSString stringWithUTF8String:"Invalid State"];
    v34[0] = v16;
    v34[1] = &unk_26D3084B8;
    v33[1] = @"Line";
    v33[2] = @"Method";
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v34[2] = v17;
    v33[3] = *MEMORY[0x263F07F80];
    v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 121);
    v34[3] = v18;
    uint64_t v19 = [NSDictionary dictionaryWithObjects:v34 forKeys:v33 count:4];
    uint64_t v20 = v15;
    uint64_t v21 = v13;
    uint64_t v22 = 9;
  }
  id v14 = [v20 errorWithDomain:v21 code:v22 userInfo:v19];

LABEL_7:
  return v14;
}

- (id)rkeGetVehicleReports:(id *)a3
{
  void v33[4] = *MEMORY[0x263EF8340];
  id v6 = _os_activity_create(&dword_221170000, "rkeGetVehicleReports:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v6, &state);
  os_activity_scope_leave(&state);

  id v7 = [(STSSessionBase *)self handler];

  if (!v7)
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeGetVehicleReports:]", 135, self, @"No handler available", v8, v9, v28);
    if (!a3) {
      goto LABEL_10;
    }
    id v14 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v32[0] = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:"Invalid State"];
    v33[0] = v15;
    v33[1] = &unk_26D3084E8;
    v32[1] = @"Line";
    v32[2] = @"Method";
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v33[2] = v16;
    v32[3] = *MEMORY[0x263F07F80];
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 137);
    v33[3] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v33 forKeys:v32 count:4];
    uint64_t v19 = v14;
    uint64_t v20 = v13;
    uint64_t v21 = 9;
LABEL_8:
    *a3 = [v19 errorWithDomain:v20 code:v21 userInfo:v18];

    a3 = 0;
    goto LABEL_9;
  }
  uint64_t v10 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v12 = [(STSSessionBase *)self handler];
  id v13 = v12;
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession(RKE) rkeGetVehicleReports:]", 141, self, @"Invalid handler - %@", v24, v25, (uint64_t)v23);

    if (!a3) {
      goto LABEL_10;
    }
    uint64_t v26 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v30[0] = *MEMORY[0x263F08320];
    uint64_t v15 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v31[0] = v15;
    v31[1] = &unk_26D308500;
    v30[1] = @"Line";
    v30[2] = @"Method";
    id v16 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v31[2] = v16;
    v30[3] = *MEMORY[0x263F07F80];
    char v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 143);
    v31[3] = v17;
    v18 = [NSDictionary dictionaryWithObjects:v31 forKeys:v30 count:4];
    uint64_t v19 = v26;
    uint64_t v20 = v13;
    uint64_t v21 = 11;
    goto LABEL_8;
  }
  sub_2211962C8(v12, (uint64_t)a3);
  a3 = (id *)objc_claimAutoreleasedReturnValue();
LABEL_9:

LABEL_10:
  return a3;
}

+ (id)requestAssertionForKeyID:(id)a3 options:(id)a4 outError:(id *)a5
{
  id v5 = sub_2211970E8((uint64_t)DigitalCarKeyHandler, a3, a4, (__CFString **)a5);
  if (v5) {
    id v6 = [[STSDCKAssertion alloc] initWithAssertion:v5];
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (id)createHandlerForCredential:(id)a3
{
  id v4 = a3;
  switch([v4 type])
  {
    case 0u:
      unsigned int v5 = [v4 type];
      sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession createHandlerForCredential:]", 42, self, @"Unsupported credential type %02x", v6, v7, v5);
      goto LABEL_3;
    case 1u:
      uint64_t v12 = PaymentHandler;
      goto LABEL_9;
    case 2u:
      uint64_t v9 = [ISO18013Handler alloc];
      uint64_t v10 = [(STSSessionBase *)self callbackQueue];
      if (!v9) {
        goto LABEL_17;
      }
      uint64_t v11 = sub_221181FA0(v9, (uint64_t)self, v9, 0, v10);
      goto LABEL_12;
    case 3u:
      uint64_t v12 = UnifiedAccessHandler;
      goto LABEL_9;
    case 4u:
      uint64_t v12 = DigitalCarKeyHandler;
LABEL_9:
      uint64_t v8 = (void *)[[v12 alloc] initWithParent:self];
      goto LABEL_14;
    case 5u:
      id v13 = [ISO18013HybridHandler alloc];
      uint64_t v10 = [(STSSessionBase *)self callbackQueue];
      if (v13)
      {
        uint64_t v11 = sub_22118D1C4(v13, (uint64_t)self, v13, 0, v10);
LABEL_12:
        uint64_t v8 = (void *)v11;
      }
      else
      {
LABEL_17:
        uint64_t v8 = 0;
      }

LABEL_14:
      return v8;
    default:
LABEL_3:
      uint64_t v8 = 0;
      goto LABEL_14;
  }
}

- (STSSession)init
{
  v3.receiver = self;
  v3.super_class = (Class)STSSession;
  return [(STSSessionBase *)&v3 init];
}

- (id)startWithDelegate:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _os_activity_create(&dword_221170000, "startWithDelegate:callback:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession startWithDelegate:callback:]", 60, self, &stru_26D2FDEC0, v9, v10, v16[0]);
  uint64_t v11 = [(STSSession *)self canStartSession];
  if (v11)
  {
    uint64_t v12 = [(STSSessionBase *)self callbackQueue];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = (uint64_t)sub_22119BCE8;
    v16[3] = (uint64_t)&unk_264594558;
    id v18 = v7;
    id v13 = v11;
    id v17 = v13;
    dispatch_async(v12, v16);

    id v14 = v13;
  }
  else
  {
    LOBYTE(state.opaque[0]) = 0;
    [(STSSessionBase *)self setTheStartCallback:v7];
    [(STSSessionBase *)self startWithDelegate:v6 isFirstInQueue:&state];
  }

  return v11;
}

- (id)startWithDelegate:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _os_activity_create(&dword_221170000, "startWithDelegate:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v12.opaque[0] = 0;
  v12.opaque[1] = 0;
  os_activity_scope_enter(v5, &v12);
  os_activity_scope_leave(&v12);

  sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession startWithDelegate:]", 79, self, &stru_26D2FDEC0, v6, v7, v12.opaque[0]);
  uint64_t v8 = [(STSSession *)self canStartSession];
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = v8;
  }
  else
  {
    LOBYTE(v12.opaque[0]) = 0;
    [(STSSessionBase *)self startWithDelegate:v4 isFirstInQueue:&v12];
  }

  return v9;
}

- (id)canStartSession
{
  void v29[4] = *MEMORY[0x263EF8340];
  id v4 = [(STSSessionBase *)self nfHardwareManager];
  if ([v4 getHwSupport] == 2)
  {
    uint64_t v25 = 1;
    uint64_t v7 = [v4 getRadioEnabledState:&v25];
    id v10 = (void *)v7;
    if (!v7 && v25)
    {
      uint64_t v11 = 0;
      goto LABEL_10;
    }
    id v17 = @"NFRadioStateDisabled";
    if (v7) {
      id v17 = (__CFString *)v7;
    }
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession canStartSession]", 104, self, @"NFC Radio is not available (error=%@).", v8, v9, (uint64_t)v17);
    id v18 = (void *)MEMORY[0x263F087E8];
    id v13 = [NSString stringWithUTF8String:"STS.fwk"];
    v26[0] = *MEMORY[0x263F08320];
    uint64_t v19 = [NSString stringWithUTF8String:"NFC radio disabled"];
    v27[0] = v19;
    v27[1] = &unk_26D308530;
    v26[1] = @"Line";
    v26[2] = @"Method";
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v27[2] = v20;
    v26[3] = *MEMORY[0x263F07F80];
    uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 105);
    v27[3] = v21;
    uint64_t v22 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    uint64_t v11 = [v18 errorWithDomain:v13 code:18 userInfo:v22];
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession canStartSession]", 97, self, @"Hardware not available", v5, v6, v24);
    os_activity_scope_state_s v12 = (void *)MEMORY[0x263F087E8];
    id v10 = [NSString stringWithUTF8String:"STS.fwk"];
    v28[0] = *MEMORY[0x263F08320];
    id v13 = [NSString stringWithUTF8String:"Hardware Not Available"];
    v29[0] = v13;
    v29[1] = &unk_26D308518;
    v28[1] = @"Line";
    v28[2] = @"Method";
    id v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v29[2] = v14;
    v28[3] = *MEMORY[0x263F07F80];
    uint64_t v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 98);
    v29[3] = v15;
    id v16 = [NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:4];
    uint64_t v11 = [v12 errorWithDomain:v10 code:12 userInfo:v16];
  }
LABEL_10:

  return v11;
}

- (id)startTransactionWithAuthorization:(id)a3 options:(unint64_t)a4
{
  void v27[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = _os_activity_create(&dword_221170000, "startTransactionWithAuthorization:options:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  uint64_t v9 = [(STSSessionBase *)self handler];

  if (v9)
  {
    os_activity_scope_state_s v12 = [(STSSessionBase *)self activateChildSession];
    if (v12)
    {
      id v15 = v12;
      id v16 = v15;
    }
    else
    {
      sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession startTransactionWithAuthorization:options:]", 124, self, @"options: 0x%04x", v13, v14, a4);
      uint64_t v22 = [(STSSessionBase *)self handler];
      id v16 = [v22 startTransactionWithAuthorization:v7 options:a4];

      id v15 = 0;
    }
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession startTransactionWithAuthorization:options:]", 115, self, @"Handler invalid", v10, v11, v24);
    id v17 = (void *)MEMORY[0x263F087E8];
    id v15 = [NSString stringWithUTF8String:"STS.fwk"];
    v26[0] = *MEMORY[0x263F08320];
    id v18 = [NSString stringWithUTF8String:"Invalid State"];
    v27[0] = v18;
    v27[1] = &unk_26D308548;
    v26[1] = @"Line";
    v26[2] = @"Method";
    uint64_t v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v27[2] = v19;
    v26[3] = *MEMORY[0x263F07F80];
    uint64_t v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 116);
    v27[3] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:4];
    id v16 = [v17 errorWithDomain:v15 code:9 userInfo:v21];
  }
  return v16;
}

- (id)stopTransaction
{
  v19[4] = *MEMORY[0x263EF8340];
  id v4 = _os_activity_create(&dword_221170000, "stopTransaction:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v4, &state);
  os_activity_scope_leave(&state);

  uint64_t v5 = [(STSSessionBase *)self handler];

  if (v5)
  {
    sub_2211981D8(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSSession stopTransaction]", 136, self, &stru_26D2FDEC0, v6, v7, v16);
    uint64_t v8 = [(STSSessionBase *)self handler];
    uint64_t v9 = [v8 stopTransaction];
  }
  else
  {
    sub_2211981D8(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSSession stopTransaction]", 132, self, @"Handler invalid", v6, v7, v16);
    uint64_t v10 = (void *)MEMORY[0x263F087E8];
    uint64_t v8 = [NSString stringWithUTF8String:"STS.fwk"];
    v18[0] = *MEMORY[0x263F08320];
    uint64_t v11 = [NSString stringWithUTF8String:"Invalid State"];
    v19[0] = v11;
    v19[1] = &unk_26D308560;
    v18[1] = @"Line";
    v18[2] = @"Method";
    os_activity_scope_state_s v12 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v19[2] = v12;
    v18[3] = *MEMORY[0x263F07F80];
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 133);
    v19[3] = v13;
    uint64_t v14 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    uint64_t v9 = [v10 errorWithDomain:v8 code:9 userInfo:v14];
  }
  return v9;
}

- (id)enableExpressModeForActiveCredential:(BOOL)a3
{
  v13[4] = *MEMORY[0x263EF8340];
  id v4 = (void *)MEMORY[0x263F087E8];
  uint64_t v5 = [NSString stringWithUTF8String:"STS.fwk"];
  v12[0] = *MEMORY[0x263F08320];
  uint64_t v6 = [NSString stringWithUTF8String:"Feature Not Supported"];
  v13[0] = v6;
  v13[1] = &unk_26D308578;
  v12[1] = @"Line";
  v12[2] = @"Method";
  uint64_t v7 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v13[2] = v7;
  v12[3] = *MEMORY[0x263F07F80];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 141);
  v13[3] = v8;
  uint64_t v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];
  uint64_t v10 = [v4 errorWithDomain:v5 code:11 userInfo:v9];

  return v10;
}

- (id)releaseCredential:(id)a3 withAuthorization:(id)a4
{
  v14[4] = *MEMORY[0x263EF8340];
  uint64_t v5 = (void *)MEMORY[0x263F087E8];
  uint64_t v6 = objc_msgSend(NSString, "stringWithUTF8String:", "STS.fwk", a4);
  v13[0] = *MEMORY[0x263F08320];
  uint64_t v7 = [NSString stringWithUTF8String:"Feature Not Supported"];
  v14[0] = v7;
  v14[1] = &unk_26D308590;
  v13[1] = @"Line";
  v13[2] = @"Method";
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v14[2] = v8;
  v13[3] = *MEMORY[0x263F07F80];
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 145);
  v14[3] = v9;
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:4];
  uint64_t v11 = [v5 errorWithDomain:v6 code:11 userInfo:v10];

  return v11;
}

- (id)releaseCredential:(id)a3 withAuthorization:(id)a4 iso18013Selection:(id)a5
{
  void v28[4] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  os_activity_scope_state_s v12 = _os_activity_create(&dword_221170000, "releaseCredential:withAuthorization:iso18013Selection:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v12, &state);
  os_activity_scope_leave(&state);

  uint64_t v13 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  id v15 = [(STSSessionBase *)self handler];
  uint64_t v16 = v15;
  if (isKindOfClass)
  {
    uint64_t v17 = sub_221182F50(v15, v9, v10, v11);
LABEL_5:
    uint64_t v19 = (void *)v17;
    goto LABEL_7;
  }
  objc_opt_class();
  char v18 = objc_opt_isKindOfClass();

  if (v18)
  {
    uint64_t v16 = [(STSSessionBase *)self handler];
    uint64_t v17 = sub_22118F280((id *)v16, v9, v10, v11);
    goto LABEL_5;
  }
  uint64_t v20 = (void *)MEMORY[0x263F087E8];
  uint64_t v16 = [NSString stringWithUTF8String:"STS.fwk"];
  v27[0] = *MEMORY[0x263F08320];
  uint64_t v21 = [NSString stringWithUTF8String:"Feature Not Supported"];
  v28[0] = v21;
  v28[1] = &unk_26D3085A8;
  v27[1] = @"Line";
  v27[2] = @"Method";
  uint64_t v22 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
  v28[2] = v22;
  v27[3] = *MEMORY[0x263F07F80];
  uint64_t v23 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 163);
  v28[3] = v23;
  uint64_t v24 = [NSDictionary dictionaryWithObjects:v28 forKeys:v27 count:4];
  uint64_t v19 = [v20 errorWithDomain:v16 code:11 userInfo:v24];

LABEL_7:
  return v19;
}

- (id)startHandoff
{
  void v22[4] = *MEMORY[0x263EF8340];
  id v4 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  uint64_t v6 = [(STSSessionBase *)self handler];
  uint64_t v7 = (void *)v6;
  if (isKindOfClass)
  {
    if (v6) {
      uint64_t v8 = *(void **)(v6 + 64);
    }
    else {
      uint64_t v8 = 0;
    }
    id v9 = v8;
    id v10 = [v9 startHandoff];
  }
  else
  {
    objc_opt_class();
    char v11 = objc_opt_isKindOfClass();

    if (v11)
    {
      uint64_t v12 = [(STSSessionBase *)self handler];
      uint64_t v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = *(void **)(v12 + 64);
      }
      else {
        uint64_t v14 = 0;
      }
      id v15 = v14;
      id v10 = [v15 startHandoff];
    }
    else
    {
      uint64_t v16 = (void *)MEMORY[0x263F087E8];
      uint64_t v13 = [NSString stringWithUTF8String:"STS.fwk"];
      v21[0] = *MEMORY[0x263F08320];
      id v15 = [NSString stringWithUTF8String:"Invalid State"];
      v22[0] = v15;
      v22[1] = &unk_26D3085C0;
      v21[1] = @"Line";
      v21[2] = @"Method";
      uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
      v22[2] = v17;
      v21[3] = *MEMORY[0x263F07F80];
      char v18 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 176);
      v22[3] = v18;
      uint64_t v19 = [NSDictionary dictionaryWithObjects:v22 forKeys:v21 count:4];
      id v10 = [v16 errorWithDomain:v13 code:9 userInfo:v19];
    }
  }
  return v10;
}

- (id)sendRequestCompletion
{
  return self->_sendRequestCompletion;
}

- (void)setSendRequestCompletion:(id)a3
{
}

- (NFSecureElementProxyListener)seProxyListener
{
  return self->_seProxyListener;
}

- (void)setSeProxyListener:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong(&self->_sendRequestCompletion, 0);
}

- (id)startWithNotificationTesterDelegate:(id)a3 outNotificationListener:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = _os_activity_create(&dword_221170000, "startWithNotificationTesterDelegate:outNotificationListener:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v16.opaque[0] = 0;
  v16.opaque[1] = 0;
  os_activity_scope_enter(v7, &v16);
  os_activity_scope_leave(&v16);

  uint64_t v8 = [ISO18013Handler alloc];
  id v9 = [(STSSessionBase *)self callbackQueue];
  id v10 = (void *)sub_2211820D4(v8, v6, (uint64_t)self, v9);

  [(STSSessionBase *)self setHandler:v10];
  if (a4)
  {
    if (v10) {
      char v11 = (void *)v10[8];
    }
    else {
      char v11 = 0;
    }
    *a4 = v11;
  }
  if (v10) {
    uint64_t v12 = (void *)v10[8];
  }
  else {
    uint64_t v12 = 0;
  }
  id v13 = v12;
  uint64_t v14 = [v13 xpcEndpoint];

  return v14;
}

- (void)testSendToAlternativeCarrier:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = _os_activity_create(&dword_221170000, "testSendToAlternativeCarrier:completion:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  uint64_t v10 = [(STSSessionBase *)self handler];
  if (!v10) {
    goto LABEL_6;
  }
  char v11 = (void *)v10;
  uint64_t v12 = [(STSSessionBase *)self handler];
  id v13 = sub_221184B60((uint64_t)ISO18013Handler, v12);

  if (v13)
  {
    uint64_t v14 = [(STSSessionBase *)self handler];
    id v15 = v14;
    if (v14) {
      os_activity_scope_state_s v16 = *(void **)(v14 + 64);
    }
    else {
      os_activity_scope_state_s v16 = 0;
    }
    id v17 = v16;
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = sub_22119D478;
    v21[3] = &unk_264594A88;
    char v18 = &v22;
    id v22 = v8;
    id v19 = v8;
    [v17 alternativerCarrierSend:v7 completion:v21];
  }
  else
  {
LABEL_6:
    id v15 = [(STSSessionBase *)self callbackQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = sub_22119D2C8;
    block[3] = &unk_264594800;
    char v18 = (id *)v24;
    v24[0] = v8;
    v24[1] = a2;
    id v20 = v8;
    dispatch_async(v15, block);
  }
}

- (id)enablePlasticCardMode:(BOOL)a3
{
  BOOL v3 = a3;
  void v24[4] = *MEMORY[0x263EF8340];
  id v6 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v8 = [(STSSessionBase *)self handler];
    id v15 = sub_22118A310(v8, v3, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    os_activity_scope_state_s v16 = (void *)MEMORY[0x263F087E8];
    id v17 = [NSString stringWithUTF8String:"STS.fwk"];
    v23[0] = *MEMORY[0x263F08320];
    char v18 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v24[0] = v18;
    v24[1] = &unk_26D3085F0;
    v23[1] = @"Line";
    v23[2] = @"Method";
    id v19 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    void v24[2] = v19;
    v23[3] = *MEMORY[0x263F07F80];
    id v20 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 17);
    v24[3] = v20;
    uint64_t v21 = [NSDictionary dictionaryWithObjects:v24 forKeys:v23 count:4];
    id v15 = [v16 errorWithDomain:v17 code:11 userInfo:v21];
  }
  return v15;
}

- (id)felicaCredentialState:(id)a3 error:(id *)a4
{
  v19[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(STSSessionBase *)self handler];
    sub_22118A6F4(v10, v7, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = [NSString stringWithUTF8String:"STS.fwk"];
    v18[0] = *MEMORY[0x263F08320];
    uint64_t v13 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v19[0] = v13;
    v19[1] = &unk_26D308608;
    v18[1] = @"Line";
    v18[2] = @"Method";
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v19[2] = v14;
    v18[3] = *MEMORY[0x263F07F80];
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 26);
    v19[3] = v15;
    os_activity_scope_state_s v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    *a4 = [v11 errorWithDomain:v12 code:11 userInfo:v16];

    a4 = 0;
  }

  return a4;
}

- (id)transitCredentialState:(id)a3 error:(id *)a4
{
  v19[4] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = [(STSSessionBase *)self handler];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v10 = [(STSSessionBase *)self handler];
    sub_22118ACF4(v10, v7, a4);
    a4 = (id *)objc_claimAutoreleasedReturnValue();
  }
  else if (a4)
  {
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v12 = [NSString stringWithUTF8String:"STS.fwk"];
    v18[0] = *MEMORY[0x263F08320];
    uint64_t v13 = [NSString stringWithUTF8String:"Feature Not Supported"];
    v19[0] = v13;
    v19[1] = &unk_26D308620;
    v18[1] = @"Line";
    v18[2] = @"Method";
    uint64_t v14 = objc_msgSend(NSString, "stringWithFormat:", @"%s", sel_getName(a2));
    v19[2] = v14;
    v18[3] = *MEMORY[0x263F07F80];
    id v15 = objc_msgSend(NSString, "stringWithFormat:", @"%s:%d", sel_getName(a2), 38);
    v19[3] = v15;
    os_activity_scope_state_s v16 = [NSDictionary dictionaryWithObjects:v19 forKeys:v18 count:4];
    *a4 = [v11 errorWithDomain:v12 code:11 userInfo:v16];

    a4 = 0;
  }

  return a4;
}

@end