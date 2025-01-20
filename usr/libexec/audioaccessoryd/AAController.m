@interface AAController
- (AAController)init;
- (OS_dispatch_queue)dispatchQueue;
- (id)_ensureXPCStarted;
- (id)conversationDetectMessageHandler;
- (id)description;
- (id)deviceInfoChangeHandler;
- (id)interruptionHandler;
- (id)invalidationHandler;
- (id)multimodalContextMessageHandler;
- (id)pmeConfigMessageHandler;
- (unsigned)clientID;
- (unsigned)coreBluetoothInternalFlag;
- (void)_activate;
- (void)_activateXPC:(BOOL)a3;
- (void)_activateXPCCompleted:(id)a3;
- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4;
- (void)_interrupted;
- (void)_invalidated;
- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4;
- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4;
- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6;
- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)_xpcReceivedAccessoryEvent:(id)a3;
- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3;
- (void)_xpcReceivedMessage:(id)a3;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4;
- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5;
- (void)setClientID:(unsigned int)a3;
- (void)setConversationDetectMessageHandler:(id)a3;
- (void)setCoreBluetoothInternalFlag:(unsigned int)a3;
- (void)setDeviceInfoChangeHandler:(id)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setInterruptionHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setMultimodalContextMessageHandler:(id)a3;
- (void)setPmeConfigMessageHandler:(id)a3;
- (void)xpcReceivedMessage:(id)a3;
@end

@implementation AAController

- (AAController)init
{
  v5.receiver = self;
  v5.super_class = (Class)AAController;
  v2 = [(AAController *)&v5 init];
  if (v2)
  {
    v2->_clientID = sub_1000046E8();
    objc_storeStrong((id *)&v2->_dispatchQueue, &_dispatch_main_q);
    v2->_coreBluetoothInternalFlag = 0x2000;
    v3 = v2;
  }

  return v2;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  objc_super v5 = self;
  objc_sync_enter(v5);
  if (!v5->_activateCalled)
  {
    v5->_activateCalled = 1;
    id v6 = objc_retainBlock(v4);
    id activateCompletion = v5->_activateCompletion;
    v5->_id activateCompletion = v6;

    dispatchQueue = v5->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000048F8;
    block[3] = &unk_100232710;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);
}

- (void)_activate
{
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100260D60 <= 90 && (dword_100260D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v3 = (void (**)(id, id))objc_retainBlock(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v3) {
      v3[2](v3, v5);
    }
  }
  else
  {
    [(AAController *)self _activateXPC:0];
  }
}

- (void)_activateXPC:(BOOL)a3
{
  if (a3)
  {
    if (dword_100260D60 <= 30 && (dword_100260D60 != -1 || _LogCategory_Initialize())) {
LABEL_7:
    }
      LogPrintF();
  }
  else if (dword_100260D60 <= 30 && (dword_100260D60 != -1 || _LogCategory_Initialize()))
  {
    goto LABEL_7;
  }
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  id v5 = v4;
  uint64_t coreBluetoothInternalFlag = self->_coreBluetoothInternalFlag;
  if (coreBluetoothInternalFlag) {
    xpc_dictionary_set_uint64(v4, "intF", coreBluetoothInternalFlag);
  }
  xpc_dictionary_set_string(v5, "mTyp", "CtrA");
  v7 = [(AAController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100004B90;
  handler[3] = &unk_100232838;
  handler[4] = self;
  xpc_connection_send_message_with_reply(v7, v5, (dispatch_queue_t)dispatchQueue, handler);
}

- (void)_activateXPCCompleted:(id)a3
{
  id v4 = a3;
  id v5 = CUXPCDecodeNSErrorIfNeeded();
  if (v5)
  {
    if (dword_100260D60 <= 90 && (dword_100260D60 != -1 || _LogCategory_Initialize()))
    {
      v11 = CUPrintNSError();
      LogPrintF();
    }
    v7 = (void (**)(id, void *))objc_retainBlock(self->_activateCompletion);
    id activateCompletion = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v7) {
      v7[2](v7, v5);
    }
  }
  else
  {
    xpc_dictionary_get_array(v4, "aaDD");
    id v6 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_100004D94;
      applier[3] = &unk_100232860;
      applier[4] = self;
      xpc_array_apply(v6, applier);
    }
    if (dword_100260D60 <= 30 && (dword_100260D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    v9 = (void (**)(id, void))objc_retainBlock(self->_activateCompletion);
    id v10 = self->_activateCompletion;
    self->_id activateCompletion = 0;

    if (v9) {
      v9[2](v9, 0);
    }
  }
}

- (id)_ensureXPCStarted
{
  id v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_xpcCnx;
  if (!v2->_xpcCnx)
  {
    xpc_connection_t mach_service = xpc_connection_create_mach_service("com.apple.bluetooth.xpc", (dispatch_queue_t)v2->_dispatchQueue, 0);

    objc_storeStrong((id *)&v2->_xpcCnx, mach_service);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100004F14;
    v6[3] = &unk_100232888;
    v3 = mach_service;
    v7 = v3;
    v8 = v2;
    xpc_connection_set_event_handler(v3, v6);
    xpc_connection_activate(v3);
  }
  objc_sync_exit(v2);

  return v3;
}

- (void)_interrupted
{
  if (!self->_invalidateCalled)
  {
    if (dword_100260D60 <= 30 && (dword_100260D60 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v3 = objc_retainBlock(self->_interruptionHandler);
    id v4 = v3;
    if (v3) {
      (*((void (**)(id))v3 + 2))(v3);
    }

    if (self->_activateCalled)
    {
      [(AAController *)self _activateXPC:1];
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000506C;
  block[3] = &unk_100232710;
  block[4] = self;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_invalidated
{
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    id v3 = self;
    objc_sync_enter(v3);
    xpcCnx = v3->_xpcCnx;
    objc_sync_exit(v3);

    if (!xpcCnx)
    {
      id conversationDetectMessageHandler = v3->_conversationDetectMessageHandler;
      v3->_id conversationDetectMessageHandler = 0;

      id deviceInfoChangeHandler = v3->_deviceInfoChangeHandler;
      v3->_id deviceInfoChangeHandler = 0;

      id multimodalContextMessageHandler = v3->_multimodalContextMessageHandler;
      v3->_id multimodalContextMessageHandler = 0;

      id pmeConfigMessageHandler = v3->_pmeConfigMessageHandler;
      v3->_id pmeConfigMessageHandler = 0;

      id interruptionHandler = v3->_interruptionHandler;
      v3->_id interruptionHandler = 0;

      v13 = (uint64_t (**)(id))objc_retainBlock(v3->_invalidationHandler);
      id invalidationHandler = v3->_invalidationHandler;
      v3->_id invalidationHandler = 0;

      v12 = v13;
      if (v13)
      {
        uint64_t v11 = v13[2](v13);
        v12 = v13;
      }
      self->_invalidateDone = 1;
      if (dword_100260D60 <= 30)
      {
        if (dword_100260D60 != -1 || (uint64_t v11 = _LogCategory_Initialize(), v12 = v13, v11))
        {
          uint64_t v11 = LogPrintF();
          v12 = v13;
        }
      }
      _objc_release_x1(v11, v12);
    }
  }
}

- (void)sendConversationDetectMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000053BC;
  v15[3] = &unk_1002328B0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);
}

- (void)sendMultimodalContextMessage:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000553C;
  v15[3] = &unk_1002328B0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);
}

- (void)sendPMEConfigData:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000056BC;
  v15[3] = &unk_1002328B0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);
}

- (void)sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000583C;
  v15[3] = &unk_1002328B0;
  id v16 = v9;
  v17 = self;
  id v18 = v8;
  id v19 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async((dispatch_queue_t)dispatchQueue, v15);
}

- (void)sendGetTipiTableMessageToDestinationIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005998;
  block[3] = &unk_1002328D8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async((dispatch_queue_t)dispatchQueue, block);
}

- (void)_sendAccessoryEventMessage:(id)a3 eventType:(unsigned __int8)a4 destinationIdentifier:(id)a5 completionHandler:(id)a6
{
  unsigned int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, id))a6;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100260D60 > 90 || dword_100260D60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  if (!v11)
  {
    NSErrorF();
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100260D60 > 90 || dword_100260D60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_16;
    }
LABEL_15:
    v28 = CUPrintNSError();
    LogPrintF();

LABEL_16:
    v12[2](v12, v13);
    goto LABEL_17;
  }
  id v13 = objc_alloc_init((Class)CBDevice);
  [v13 setIdentifier:v11];
  [v13 dictionaryRepresentation];
  id v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "mTyp", "SnAE");
  xpc_dictionary_set_uint64(v15, "acET", v8);
  if (v10)
  {
    id v16 = v10;
    id v17 = v15;
    id v18 = v16;
    id v19 = (const char *)[v18 bytes];
    v20 = "";
    if (v19) {
      v20 = v19;
    }
    bytes = v20;
    id v21 = v10;
    id v22 = v13;
    v23 = v14;
    id v24 = [v18 length];

    size_t v25 = (size_t)v24;
    id v14 = v23;
    id v13 = v22;
    id v10 = v21;
    xpc_dictionary_set_data(v17, "acMd", bytes, v25);
  }
  xpc_dictionary_set_value(v15, "dstD", v14);
  v26 = [(AAController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100005DD4;
  handler[3] = &unk_100232900;
  v31 = v12;
  xpc_connection_send_message_with_reply(v26, v15, (dispatch_queue_t)dispatchQueue, handler);

LABEL_17:
}

- (void)_sendDeviceConfig:(id)a3 destinationIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, id))a5;
  if (self->_invalidateCalled)
  {
    NSErrorF();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100260D60 > 90 || dword_100260D60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
    goto LABEL_4;
  }
  if (!v9)
  {
    NSErrorF();
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    if (dword_100260D60 > 90 || dword_100260D60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_11;
    }
LABEL_4:
    id v12 = CUPrintNSError();
    LogPrintF();

LABEL_11:
    v10[2](v10, v11);
    goto LABEL_12;
  }
  id v11 = objc_alloc_init((Class)CBDevice);
  [v11 setIdentifier:v9];
  [v11 dictionaryRepresentation];
  id v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v14, "mTyp", "SnAC");
  xpc_dictionary_set_value(v14, "acMd", v8);
  xpc_dictionary_set_value(v14, "dstD", v13);
  xpc_object_t v15 = [(AAController *)self _ensureXPCStarted];
  dispatchQueue = self->_dispatchQueue;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000060DC;
  handler[3] = &unk_100232900;
  id v18 = v10;
  xpc_connection_send_message_with_reply(v15, v14, (dispatch_queue_t)dispatchQueue, handler);

LABEL_12:
}

- (void)xpcReceivedMessage:(id)a3
{
  id v4 = a3;
  id v15 = v4;
  if (dword_100260D60 <= 10)
  {
    if (dword_100260D60 != -1 || (int v5 = _LogCategory_Initialize(), v4 = v15, v5))
    {
      id v13 = CUPrintXPC();
      LogPrintF();

      id v4 = v15;
    }
  }
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    [(AAController *)self _xpcReceivedMessage:v15];
  }
  else if (v15 == &_xpc_error_connection_interrupted)
  {
    [(AAController *)self _interrupted];
  }
  else if (v15 == &_xpc_error_connection_invalid)
  {
    if (!self->_invalidateCalled
      && dword_100260D60 <= 90
      && (dword_100260D60 != -1 || _LogCategory_Initialize()))
    {
      xpc_connection_copy_invalidation_reason();
      LogPrintF();
    }
    id v11 = self;
    objc_sync_enter(v11);
    xpcCnx = v11->_xpcCnx;
    v11->_xpcCnx = 0;

    objc_sync_exit(v11);
    [(AAController *)v11 _invalidated];
  }
  else
  {
    id v6 = CUXPCDecodeNSErrorIfNeeded();
    id v7 = v6;
    if (v6)
    {
      id v8 = v6;
    }
    else
    {
      NSErrorF();
      id v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v9 = v8;

    if (dword_100260D60 <= 90 && (dword_100260D60 != -1 || _LogCategory_Initialize()))
    {
      id v10 = CUPrintNSError();
      xpc_object_t v14 = CUPrintXPC();
      LogPrintF();
    }
  }
}

- (void)_xpcReceivedMessage:(id)a3
{
  id v6 = a3;
  string = xpc_dictionary_get_string(v6, "mTyp");
  if (!string)
  {
    if (dword_100260D60 > 90 || dword_100260D60 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_15;
    }
LABEL_9:
    LogPrintF();
    goto LABEL_15;
  }
  int v5 = string;
  if (!strcmp(string, "AcRc"))
  {
    [(AAController *)self _xpcReceivedAccessoryEvent:v6];
    goto LABEL_15;
  }
  if (!strcmp(v5, "AcIC"))
  {
    [(AAController *)self _xpcReceivedAudioAccessoryDeviceInfoChange:v6];
    goto LABEL_15;
  }
  if (dword_100260D60 <= 10 && (dword_100260D60 != -1 || _LogCategory_Initialize())) {
    goto LABEL_9;
  }
LABEL_15:
}

- (void)_xpcReceivedAccessoryEvent:(id)a3
{
  id v3 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10000693C;
  xpc_object_t v14 = sub_10000694C;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006954;
  v9[3] = &unk_100232928;
  v9[4] = &v10;
  id v4 = objc_retainBlock(v9);
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    objc_opt_class();
    CUXPCDecodeObject();
    id v5 = 0;
    id v8 = CUPrintNSError();
    uint64_t v6 = NSPrintF_safe();
    id v7 = (void *)v11[5];
    v11[5] = v6;
  }
  else
  {
    id v5 = (id)v11[5];
    v11[5] = @"non-dict message";
  }

  ((void (*)(void *))v4[2])(v4);
  _Block_object_dispose(&v10, 8);
}

- (void)_xpcReceivedAudioAccessoryDeviceInfoChange:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_10000693C;
  xpc_object_t v14 = sub_10000694C;
  id v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100006BC0;
  v9[3] = &unk_100232928;
  v9[4] = &v10;
  id v5 = objc_retainBlock(v9);
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64_t v6 = xpc_dictionary_get_value(v4, "aaID");
    if (xpc_get_type(v6) == (xpc_type_t)&_xpc_type_dictionary)
    {
      id v7 = objc_retainBlock(self->_deviceInfoChangeHandler);
      id v8 = v7;
      if (v7) {
        (*((void (**)(id, void *))v7 + 2))(v7, v6);
      }
    }
    else
    {
      id v8 = (void *)v11[5];
      v11[5] = @"missing key for AADeviceInfo";
    }
  }
  else
  {
    uint64_t v6 = (void *)v11[5];
    v11[5] = @"non-dict message";
  }

  ((void (*)(void *))v5[2])(v5);
  _Block_object_dispose(&v10, 8);
}

- (void)_conversationDetectMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10000693C;
  v20 = sub_10000694C;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100006E90;
  v15[3] = &unk_100232928;
  void v15[4] = &v16;
  id v8 = objc_retainBlock(v15);
  if (dword_100260D60 <= 10 && (dword_100260D60 != -1 || _LogCategory_Initialize()))
  {
    xpc_object_t v14 = CUPrintNSDataHex();
    LogPrintF();
  }
  id v9 = (void (**)(id, void *, id))objc_retainBlock(self->_conversationDetectMessageHandler);
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    if (v10)
    {
      v9[2](v9, v10, v6);
    }
    else
    {
      id v13 = CUPrintNSError();
      uint64_t v11 = NSPrintF_safe();
      uint64_t v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v16, 8);
}

- (void)_multimodalContextMessageReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10000693C;
  v20 = sub_10000694C;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007160;
  v15[3] = &unk_100232928;
  void v15[4] = &v16;
  id v8 = objc_retainBlock(v15);
  if (dword_100260D60 <= 10 && (dword_100260D60 != -1 || _LogCategory_Initialize()))
  {
    xpc_object_t v14 = CUPrintNSDataHex();
    LogPrintF();
  }
  id v9 = (void (**)(id, void *, id))objc_retainBlock(self->_multimodalContextMessageHandler);
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    if (v10)
    {
      v9[2](v9, v10, v6);
    }
    else
    {
      id v13 = CUPrintNSError();
      uint64_t v11 = NSPrintF_safe();
      uint64_t v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v16, 8);
}

- (void)_pmeConfigDataReceived:(id)a3 fromDevice:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  id v17 = &v16;
  uint64_t v18 = 0x3032000000;
  id v19 = sub_10000693C;
  v20 = sub_10000694C;
  id v21 = 0;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100007430;
  v15[3] = &unk_100232928;
  void v15[4] = &v16;
  id v8 = objc_retainBlock(v15);
  if (dword_100260D60 <= 10 && (dword_100260D60 != -1 || _LogCategory_Initialize()))
  {
    xpc_object_t v14 = CUPrintNSDataHex();
    LogPrintF();
  }
  id v9 = (void (**)(id, void *, id))objc_retainBlock(self->_pmeConfigMessageHandler);
  if (v9)
  {
    uint64_t v10 = [v7 identifier];
    if (v10)
    {
      v9[2](v9, v10, v6);
    }
    else
    {
      id v13 = CUPrintNSError();
      uint64_t v11 = NSPrintF_safe();
      uint64_t v12 = (void *)v17[5];
      v17[5] = v11;
    }
  }

  ((void (*)(void *))v8[2])(v8);
  _Block_object_dispose(&v16, 8);
}

- (id)conversationDetectMessageHandler
{
  return self->_conversationDetectMessageHandler;
}

- (void)setConversationDetectMessageHandler:(id)a3
{
}

- (id)deviceInfoChangeHandler
{
  return self->_deviceInfoChangeHandler;
}

- (void)setDeviceInfoChangeHandler:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)interruptionHandler
{
  return self->_interruptionHandler;
}

- (void)setInterruptionHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)multimodalContextMessageHandler
{
  return self->_multimodalContextMessageHandler;
}

- (void)setMultimodalContextMessageHandler:(id)a3
{
}

- (id)pmeConfigMessageHandler
{
  return self->_pmeConfigMessageHandler;
}

- (void)setPmeConfigMessageHandler:(id)a3
{
}

- (unsigned)clientID
{
  return self->_clientID;
}

- (void)setClientID:(unsigned int)a3
{
  self->_clientID = a3;
}

- (unsigned)coreBluetoothInternalFlag
{
  return self->_coreBluetoothInternalFlag;
}

- (void)setCoreBluetoothInternalFlag:(unsigned int)a3
{
  self->_uint64_t coreBluetoothInternalFlag = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pmeConfigMessageHandler, 0);
  objc_storeStrong(&self->_multimodalContextMessageHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong(&self->_interruptionHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceInfoChangeHandler, 0);
  objc_storeStrong(&self->_conversationDetectMessageHandler, 0);
  objc_storeStrong((id *)&self->_xpcCnx, 0);

  objc_storeStrong(&self->_activateCompletion, 0);
}

@end