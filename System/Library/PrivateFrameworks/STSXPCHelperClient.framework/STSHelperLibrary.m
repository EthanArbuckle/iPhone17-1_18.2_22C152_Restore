@interface STSHelperLibrary
- (BOOL)setupConnectWithXPCService;
- (NSXPCConnection)xpc;
- (STSHelperLibraryDelegateProtocol)delegate;
- (STSRemoteTransceiverProxyListener)nfcReaderListener;
- (STSRemoteTransceiverProxyListener)seProxyListener;
- (STSUnifiedAccessHandler)unifiedAccessHandler;
- (id)_stsHelperCallbackInterface;
- (id)_stsHelperInterface;
- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (id)connectToNotificationListener:(id)a3;
- (id)signalUnifiedAccessStepUpWithEventDictionary:(id)a3;
- (id)startBTDeviceWithServiceUUID:(id)a3 peripheralAddress:(id)a4 centralRole:(BOOL)a5;
- (id)startBTReaderWithServiceUUID:(id)a3 peripheralAddress:(id)a4 centralRole:(BOOL)a5;
- (id)startISO18013WithConnectionHandoverConfiguration:(unint64_t)a3 type:(unint64_t)a4 credentialType:(unsigned __int8)a5 delegate:(id)a6;
- (id)startISO18013WithConnectionHandoverConfiguration:(unint64_t)a3 type:(unint64_t)a4 delegate:(id)a5;
- (id)startReaderSEProxyListener:(id)a3 workQueue:(id)a4;
- (id)startSEProxyListener:(id)a3 parameters:(id)a4 workQueue:(id)a5;
- (id)startWifiPublisherWithServiceName:(id)a3 datapathPMK:(id)a4 datapathPMKID:(id)a5;
- (id)startWifiSubscriberWithServiceName:(id)a3 datapathPMK:(id)a4 datapathPMKID:(id)a5;
- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3;
- (unint64_t)handoverConfig;
- (unint64_t)type;
- (void)connectRemoteWithConnectionHandoverSelect:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5;
- (void)connectRemoteWithQRCodeHandoverData:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5;
- (void)didInvalidateXPC:(BOOL)a3 connection:(id)a4;
- (void)generateConnectionHandoverRequestWithQueue:(id)a3 responseHandler:(id)a4;
- (void)generateQRCodeCHRequestAndStartACWithQueue:(id)a3 responseHandler:(id)a4;
- (void)invalidate;
- (void)processConnectionHandoverRequest:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5;
- (void)processConnectionHandoverRequestData:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5;
- (void)processUnifiedAccessStepupAPDU:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5;
- (void)setDelegate:(id)a3;
- (void)setNfcReaderListener:(id)a3;
- (void)setSeProxyListener:(id)a3;
- (void)setType:(unint64_t)a3;
- (void)setUnifiedAccessHandler:(id)a3;
- (void)setXpc:(id)a3;
- (void)stopReaderSEProxyListener;
- (void)stopSEProxyListener;
@end

@implementation STSHelperLibrary

- (id)startISO18013WithConnectionHandoverConfiguration:(unint64_t)a3 type:(unint64_t)a4 delegate:(id)a5
{
  id v8 = a5;
  sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:delegate:]", 69, self, @"configuration = 0x%x", v9, v10, a3);
  v11 = _os_activity_create(&dword_2146C3000, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  objc_storeWeak((id *)&self->_delegate, v8);
  self->_type = a4;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = sub_2146C9184;
  v14[3] = &unk_264217970;
  v14[4] = self;
  v14[5] = a3;
  v14[6] = a4;
  v12 = sub_2146C90B0((uint64_t)v14);

  return v12;
}

- (id)startISO18013WithConnectionHandoverConfiguration:(unint64_t)a3 type:(unint64_t)a4 credentialType:(unsigned __int8)a5 delegate:(id)a6
{
  id v10 = a6;
  sub_2146CE940(OS_LOG_TYPE_INFO, 0, (uint64_t)"-[STSHelperLibrary startISO18013WithConnectionHandoverConfiguration:type:credentialType:delegate:]", 95, self, @"configuration = 0x%x", v11, v12, a3);
  v13 = _os_activity_create(&dword_2146C3000, "startISO18013WithConnectionHandoverConfiguration:type:delegate:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v13, &state);
  os_activity_scope_leave(&state);

  objc_storeWeak((id *)&self->_delegate, v10);
  self->_type = a4;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = sub_2146C94C8;
  v16[3] = &unk_264217998;
  v16[4] = self;
  v16[5] = a3;
  v16[6] = a4;
  unsigned __int8 v17 = a5;
  v14 = sub_2146C90B0((uint64_t)v16);

  return v14;
}

- (id)connectToNotificationListener:(id)a3
{
  id v4 = a3;
  v5 = _os_activity_create(&dword_2146C3000, "connectToNotificationListener:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v5, &state);
  os_activity_scope_leave(&state);

  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = sub_2146C97B8;
  v9[3] = &unk_2642179C0;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = sub_2146C90B0((uint64_t)v9);

  return v7;
}

- (void)processUnifiedAccessStepupAPDU:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8 = a3;
  uint64_t v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "processUnifiedAccessStepupAPDU:callbackQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  uint64_t v12 = self;
  objc_sync_enter(v12);
  v15 = objc_msgSend_unifiedAccessHandler(v12, v13, v14);

  if (!v15)
  {
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = sub_2146C9B1C;
    v19[3] = &unk_264217B50;
    v19[4] = v12;
    id v20 = v10;
    dispatch_async(v9, v19);
  }
  objc_sync_exit(v12);

  objc_msgSend_unifiedAccessHandler(v12, v16, v17);
  v18 = (id *)objc_claimAutoreleasedReturnValue();
  sub_2146D156C(v18, v8, v9, v10);
}

- (void)processConnectionHandoverRequest:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "processConnectionHandoverRequest:callbackQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2146C9E40;
  v24[3] = &unk_264217A10;
  id v25 = v8;
  id v26 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = (void *)MEMORY[0x2166A65A0](v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2146C9F4C;
  v22[3] = &unk_264217A38;
  v22[4] = self;
  id v15 = v14;
  id v23 = v15;
  uint64_t v17 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2146C9FD0;
  v20[3] = &unk_264217A60;
  id v21 = v15;
  id v18 = v15;
  objc_msgSend_processAlternativeCarrierRequest_callback_(v17, v19, (uint64_t)v10, v20);
}

- (void)processConnectionHandoverRequestData:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "processConnectionHandoverRequestData:callbackQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2146CA1C8;
  v24[3] = &unk_264217AB0;
  id v25 = v8;
  id v26 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = (void *)MEMORY[0x2166A65A0](v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2146CA2EC;
  v22[3] = &unk_264217A38;
  v22[4] = self;
  id v15 = v14;
  id v23 = v15;
  uint64_t v17 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2146CA374;
  v20[3] = &unk_264217AD8;
  id v21 = v15;
  id v18 = v15;
  objc_msgSend_processHandoverRequest_callback_(v17, v19, (uint64_t)v10, v20);
}

- (void)generateConnectionHandoverRequestWithQueue:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_2146C3000, "generateConnectionHandoverRequestWithQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2146CA550;
  v21[3] = &unk_264217B00;
  id v22 = v6;
  id v23 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = (void *)MEMORY[0x2166A65A0](v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2146CA65C;
  v19[3] = &unk_264217A38;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  uint64_t v14 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v19);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2146CA6E0;
  v17[3] = &unk_264217B28;
  id v18 = v12;
  id v15 = v12;
  objc_msgSend_generateHandoverRequestWithCallback_(v14, v16, (uint64_t)v17);
}

- (void)generateQRCodeCHRequestAndStartACWithQueue:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _os_activity_create(&dword_2146C3000, "generateQRCodeCHRequestAndStartACWithQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  os_activity_scope_leave(&state);

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = sub_2146CA8BC;
  v21[3] = &unk_264217B00;
  id v22 = v6;
  id v23 = v7;
  id v9 = v7;
  id v10 = v6;
  uint64_t v11 = (void *)MEMORY[0x2166A65A0](v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = sub_2146CA9C8;
  v19[3] = &unk_264217A38;
  v19[4] = self;
  id v12 = v11;
  id v20 = v12;
  uint64_t v14 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(self, v13, (uint64_t)v19);
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2146CAA4C;
  v17[3] = &unk_264217B28;
  id v18 = v12;
  id v15 = v12;
  objc_msgSend_generateQRCodeHandoverRequestWithCallback_(v14, v16, (uint64_t)v17);
}

- (void)connectRemoteWithConnectionHandoverSelect:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "connectRemoteWithConnectionHandoverSelect:callbackQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2146CAC3C;
  v24[3] = &unk_264217A38;
  id v25 = v8;
  id v26 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = (void *)MEMORY[0x2166A65A0](v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2146CAD20;
  v22[3] = &unk_264217A38;
  v22[4] = self;
  id v15 = v14;
  id v23 = v15;
  uint64_t v17 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2146CADA0;
  v20[3] = &unk_264217B78;
  id v21 = v15;
  id v18 = v15;
  objc_msgSend_processHandoverResponse_callback_(v17, v19, (uint64_t)v10, v20);
}

- (void)connectRemoteWithQRCodeHandoverData:(id)a3 callbackQueue:(id)a4 responseHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "connectRemoteWithQRCodeHandoverData:callbackQueue:responseHandler:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = sub_2146CAF90;
  v24[3] = &unk_264217A38;
  id v25 = v8;
  id v26 = v9;
  id v12 = v9;
  id v13 = v8;
  uint64_t v14 = (void *)MEMORY[0x2166A65A0](v24);
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = sub_2146CB074;
  v22[3] = &unk_264217A38;
  v22[4] = self;
  id v15 = v14;
  id v23 = v15;
  uint64_t v17 = objc_msgSend_asynchronousRemoteObjectProxyWithErrorHandler_(self, v16, (uint64_t)v22);
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = sub_2146CB0F4;
  v20[3] = &unk_264217B78;
  id v21 = v15;
  id v18 = v15;
  objc_msgSend_processQRCodeHandoverRequestMessage_callback_(v17, v19, (uint64_t)v10, v20);
}

- (id)startSEProxyListener:(id)a3 parameters:(id)a4 workQueue:(id)a5
{
  id v7 = a5;
  id v8 = a3;
  id v9 = _os_activity_create(&dword_2146C3000, "startSEProxyListener:parameters:workQueue:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v9, &state);
  os_activity_scope_leave(&state);

  id v12 = objc_msgSend_seProxyListener(self, v10, v11);

  if (v12)
  {
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary startSEProxyListener:parameters:workQueue:]", 353, self, @"Replacing existig STSRemoteTransceiverProxyListener; invalidate existing copy",
      v13,
      v14,
      v30);
    uint64_t v17 = objc_msgSend_seProxyListener(self, v15, v16);
    sub_2146CFC70((uint64_t)v17, v18, v19);
  }
  id v20 = [STSRemoteTransceiverProxyListener alloc];
  if (v20) {
    id v21 = sub_2146CFB0C((id *)&v20->super.isa, v8, 0, v7);
  }
  else {
    id v21 = 0;
  }

  objc_msgSend_setSeProxyListener_(self, v22, (uint64_t)v21);
  id v25 = objc_msgSend_seProxyListener(self, v23, v24);
  sub_2146CFBFC((uint64_t)v25, v26, v27);

  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = sub_2146CB298;
  v31[3] = &unk_264217BA0;
  v31[4] = self;
  v28 = sub_2146C90B0((uint64_t)v31);

  return v28;
}

- (void)stopSEProxyListener
{
  id v4 = objc_msgSend_seProxyListener(self, a2, v2);
  sub_2146CFC70((uint64_t)v4, v5, v6);

  objc_msgSend_setSeProxyListener_(self, v7, 0);
}

- (id)startReaderSEProxyListener:(id)a3 workQueue:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _os_activity_create(&dword_2146C3000, "startReaderSEProxyListener:parameters:workQueue:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v33.opaque[0] = 0;
  v33.opaque[1] = 0;
  os_activity_scope_enter(v8, &v33);
  os_activity_scope_leave(&v33);

  uint64_t v11 = objc_msgSend_seProxyListener(self, v9, v10);

  if (v11)
  {
    sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHelperLibrary startReaderSEProxyListener:workQueue:]", 386, self, @"Replacing existig STSRemoteTransceiverProxyListener; invalidate existing copy",
      v12,
      v13,
      v33.opaque[0]);
    uint64_t v16 = objc_msgSend_seProxyListener(self, v14, v15);
    sub_2146CFC70((uint64_t)v16, v17, v18);
  }
  uint64_t v19 = sub_2146CFB0C((id *)[STSRemoteTransceiverProxyListener alloc], v7, 1, v6);

  objc_msgSend_setSeProxyListener_(self, v20, (uint64_t)v19);
  id v23 = objc_msgSend_seProxyListener(self, v21, v22);
  sub_2146CFBFC((uint64_t)v23, v24, v25);

  objc_msgSend_seProxyListener(self, v26, v27);
  v28 = (void **)objc_claimAutoreleasedReturnValue();
  v31 = sub_2146CFCB8(v28, v29, v30);

  return v31;
}

- (void)stopReaderSEProxyListener
{
  id v4 = objc_msgSend_seProxyListener(self, a2, v2);
  sub_2146CFC70((uint64_t)v4, v5, v6);

  objc_msgSend_setSeProxyListener_(self, v7, 0);
}

- (id)signalUnifiedAccessStepUpWithEventDictionary:(id)a3
{
  v41[1] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _os_activity_create(&dword_2146C3000, "signalUnifiedAccessStepUpWithEventDictionary:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  v40.opaque[0] = 0;
  v40.opaque[1] = 0;
  os_activity_scope_enter(v5, &v40);
  os_activity_scope_leave(&v40);

  if (objc_msgSend_type(self, v6, v7) == 2)
  {
    uint64_t v11 = objc_msgSend_objectForKeyedSubscript_(v4, v8, @"endpointIdentifier");
    if (v11 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v15 = objc_msgSend_objectForKeyedSubscript_(v4, v12, @"sharedSecret");
      if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
      {
        uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v4, v16, @"appletIdentifier");
        if (v19 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          id v20 = self;
          objc_sync_enter(v20);
          id v21 = sub_2146D0308((id *)[STSUnifiedAccessHandler alloc], v20, v19, v15, v11);
          objc_msgSend_setUnifiedAccessHandler_(v20, v22, (uint64_t)v21);

          objc_sync_exit(v20);
          id v23 = 0;
        }
        else
        {
          sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary signalUnifiedAccessStepUpWithEventDictionary:]", 427, self, @"Invalid identifier.", v17, v18, v40.opaque[0]);
          v35 = (void *)MEMORY[0x263F087E8];
          v41[0] = *MEMORY[0x263F08320];
          v40.opaque[0] = (uint64_t)off_26781B028;
          v37 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v36, (uint64_t)&v40, v41, 1);
          id v23 = objc_msgSend_errorWithDomain_code_userInfo_(v35, v38, @"STSXPCHelperErrorDomain", 5, v37);
        }
      }
      else
      {
        sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary signalUnifiedAccessStepUpWithEventDictionary:]", 422, self, @"Invalid shared data.", v13, v14, v40.opaque[0]);
        v31 = (void *)MEMORY[0x263F087E8];
        v41[0] = *MEMORY[0x263F08320];
        v40.opaque[0] = (uint64_t)off_26781B028;
        os_activity_scope_state_s v33 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v32, (uint64_t)&v40, v41, 1);
        id v23 = objc_msgSend_errorWithDomain_code_userInfo_(v31, v34, @"STSXPCHelperErrorDomain", 5, v33);
      }
    }
    else
    {
      sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary signalUnifiedAccessStepUpWithEventDictionary:]", 417, self, @"Invalid endpointID.", v9, v10, v40.opaque[0]);
      uint64_t v27 = (void *)MEMORY[0x263F087E8];
      v41[0] = *MEMORY[0x263F08320];
      v40.opaque[0] = (uint64_t)off_26781B028;
      v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v28, (uint64_t)&v40, v41, 1);
      id v23 = objc_msgSend_errorWithDomain_code_userInfo_(v27, v30, @"STSXPCHelperErrorDomain", 5, v29);
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x263F087E8];
    v41[0] = *MEMORY[0x263F08320];
    v40.opaque[0] = (uint64_t)off_26781B010;
    uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)&v40, v41, 1);
    id v23 = objc_msgSend_errorWithDomain_code_userInfo_(v24, v26, @"STSXPCHelperErrorDomain", 2, v25);
  }

  return v23;
}

- (void)invalidate
{
  v3 = _os_activity_create(&dword_2146C3000, "invalidate:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  os_activity_scope_leave(&state);

  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_xpc)
  {
    objc_sync_exit(v4);

    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = sub_2146CBBD0;
    v14[3] = &unk_264217BA0;
    v14[4] = v4;
    id v6 = sub_2146C90B0((uint64_t)v14);
    uint64_t v7 = v4;
    objc_sync_enter(v7);
    objc_msgSend_setUnifiedAccessHandler_(v7, v8, 0);
    uint64_t v11 = objc_msgSend_xpc(v7, v9, v10);
    objc_msgSend_invalidate(v11, v12, v13);

    objc_sync_exit(v7);
  }
  else
  {
    objc_msgSend_setUnifiedAccessHandler_(v4, v5, 0);
    objc_sync_exit(v4);
  }
}

- (id)synchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend_setupConnectWithXPCService(v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_xpc(v5, v8, v9);
    uint64_t v12 = objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v4);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = off_26781B020;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v19, &v18, 1);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, @"STSXPCHelperErrorDomain", 4, v14);

    v4[2](v4, v16);
    uint64_t v12 = 0;
  }
  objc_sync_exit(v5);

  return v12;
}

- (id)asynchronousRemoteObjectProxyWithErrorHandler:(id)a3
{
  v19[1] = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void *))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (objc_msgSend_setupConnectWithXPCService(v5, v6, v7))
  {
    uint64_t v10 = objc_msgSend_xpc(v5, v8, v9);
    uint64_t v12 = objc_msgSend_remoteObjectProxyWithErrorHandler_(v10, v11, (uint64_t)v4);
  }
  else
  {
    uint64_t v13 = (void *)MEMORY[0x263F087E8];
    uint64_t v18 = *MEMORY[0x263F08320];
    v19[0] = off_26781B020;
    uint64_t v14 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v8, (uint64_t)v19, &v18, 1);
    uint64_t v16 = objc_msgSend_errorWithDomain_code_userInfo_(v13, v15, @"STSXPCHelperErrorDomain", 4, v14);

    v4[2](v4, v16);
    uint64_t v12 = 0;
  }
  objc_sync_exit(v5);

  return v12;
}

- (BOOL)setupConnectWithXPCService
{
  xpc = self->_xpc;
  if (!xpc)
  {
    id v4 = objc_alloc(MEMORY[0x263F08D68]);
    id v6 = (NSXPCConnection *)objc_msgSend_initWithServiceName_(v4, v5, @"com.apple.STSXPCHelper");
    uint64_t v7 = self->_xpc;
    self->_xpc = v6;

    uint64_t v10 = objc_msgSend__stsHelperInterface(self, v8, v9);
    objc_msgSend_setRemoteObjectInterface_(self->_xpc, v11, (uint64_t)v10);

    uint64_t v14 = objc_msgSend__stsHelperCallbackInterface(self, v12, v13);
    objc_msgSend_setExportedInterface_(self->_xpc, v15, (uint64_t)v14);

    objc_msgSend_setExportedObject_(self->_xpc, v16, (uint64_t)self);
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = sub_2146CC288;
    v24[3] = &unk_264217BE8;
    objc_copyWeak(&v25, &location);
    objc_msgSend_setInvalidationHandler_(self->_xpc, v17, (uint64_t)v24);
    v22[0] = MEMORY[0x263EF8330];
    v22[1] = 3221225472;
    v22[2] = sub_2146CC31C;
    v22[3] = &unk_264217BE8;
    objc_copyWeak(&v23, &location);
    objc_msgSend_setInterruptionHandler_(self->_xpc, v18, (uint64_t)v22);
    objc_msgSend_resume(self->_xpc, v19, v20);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
    xpc = self->_xpc;
  }
  return xpc != 0;
}

- (id)_stsHelperInterface
{
  return (id)objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26C55ED88);
}

- (id)_stsHelperCallbackInterface
{
  return (id)objc_msgSend_interfaceWithProtocol_(MEMORY[0x263F08D80], a2, (uint64_t)&unk_26C55D230);
}

- (void)didInvalidateXPC:(BOOL)a3 connection:(id)a4
{
  BOOL v4 = a3;
  id v14 = a4;
  id v6 = self;
  objc_sync_enter(v6);
  if (v4)
  {
    sub_2146CE940(OS_LOG_TYPE_ERROR, 0, (uint64_t)"-[STSHelperLibrary didInvalidateXPC:connection:]", 547, v6, @"XPC connection invalidated.  connection=%@", v7, v8, (uint64_t)v14);
    objc_msgSend_stopSEProxyListener(v6, v9, v10);
    objc_msgSend_setInvalidationHandler_(v6->_xpc, v11, 0);
    objc_msgSend_setInterruptionHandler_(v6->_xpc, v12, 0);
    xpc = v6->_xpc;
    v6->_xpc = 0;
  }
  else
  {
    sub_2146CE940(OS_LOG_TYPE_DEFAULT, 0, (uint64_t)"-[STSHelperLibrary didInvalidateXPC:connection:]", 555, v6, @"XPC connection interrupted.  connection=%@", v7, v8, (uint64_t)v14);
  }
  objc_sync_exit(v6);
}

- (STSHelperLibraryDelegateProtocol)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (STSHelperLibraryDelegateProtocol *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)handoverConfig
{
  return self->_handoverConfig;
}

- (unint64_t)type
{
  return self->_type;
}

- (void)setType:(unint64_t)a3
{
  self->_type = a3;
}

- (NSXPCConnection)xpc
{
  return self->_xpc;
}

- (void)setXpc:(id)a3
{
}

- (STSRemoteTransceiverProxyListener)seProxyListener
{
  return self->_seProxyListener;
}

- (void)setSeProxyListener:(id)a3
{
}

- (STSRemoteTransceiverProxyListener)nfcReaderListener
{
  return self->_nfcReaderListener;
}

- (void)setNfcReaderListener:(id)a3
{
}

- (STSUnifiedAccessHandler)unifiedAccessHandler
{
  return self->_unifiedAccessHandler;
}

- (void)setUnifiedAccessHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unifiedAccessHandler, 0);
  objc_storeStrong((id *)&self->_nfcReaderListener, 0);
  objc_storeStrong((id *)&self->_seProxyListener, 0);
  objc_storeStrong((id *)&self->_xpc, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (id)startWifiPublisherWithServiceName:(id)a3 datapathPMK:(id)a4 datapathPMKID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "startWifiPublisherWithServiceName:datapathPMK:dataPathPMKID:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2146CC71C;
  v17[3] = &unk_264217C10;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = sub_2146C90B0((uint64_t)v17);

  return v15;
}

- (id)startWifiSubscriberWithServiceName:(id)a3 datapathPMK:(id)a4 datapathPMKID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = _os_activity_create(&dword_2146C3000, "startWifiSubscriberWithServiceName:datapathPMK:dataPathPMKID:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v11, &state);
  os_activity_scope_leave(&state);

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = sub_2146CC9EC;
  v17[3] = &unk_264217C10;
  void v17[4] = self;
  id v18 = v8;
  id v19 = v9;
  id v20 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  uint64_t v15 = sub_2146C90B0((uint64_t)v17);

  return v15;
}

- (id)startBTReaderWithServiceUUID:(id)a3 peripheralAddress:(id)a4 centralRole:(BOOL)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = _os_activity_create(&dword_2146C3000, "startBTReaderWithServiceUUID:peripheralAddrss:centralRole:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if (v8 | v9)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2146CCD4C;
    v17[3] = &unk_264217C38;
    void v17[4] = self;
    BOOL v20 = a5;
    id v18 = (id)v8;
    id v19 = (id)v9;
    uint64_t v15 = sub_2146C90B0((uint64_t)v17);
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    v22[0] = *MEMORY[0x263F08320];
    state.opaque[0] = (uint64_t)off_26781B028;
    id v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)&state, v22, 1);
    uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v14, @"STSXPCHelperErrorDomain", 5, v13);
  }

  return v15;
}

- (id)startBTDeviceWithServiceUUID:(id)a3 peripheralAddress:(id)a4 centralRole:(BOOL)a5
{
  v22[1] = *MEMORY[0x263EF8340];
  unint64_t v8 = (unint64_t)a3;
  unint64_t v9 = (unint64_t)a4;
  id v10 = _os_activity_create(&dword_2146C3000, "startBTDeviceWithServiceUUID:peripheralAddrss:centralRole:", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v10, &state);
  os_activity_scope_leave(&state);

  if (v8 | v9)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = sub_2146CD0B0;
    v17[3] = &unk_264217C38;
    void v17[4] = self;
    BOOL v20 = a5;
    id v18 = (id)v8;
    id v19 = (id)v9;
    uint64_t v15 = sub_2146C90B0((uint64_t)v17);
  }
  else
  {
    id v12 = (void *)MEMORY[0x263F087E8];
    v22[0] = *MEMORY[0x263F08320];
    state.opaque[0] = (uint64_t)off_26781B028;
    id v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(NSDictionary, v11, (uint64_t)&state, v22, 1);
    uint64_t v15 = objc_msgSend_errorWithDomain_code_userInfo_(v12, v14, @"STSXPCHelperErrorDomain", 5, v13);
  }

  return v15;
}

@end