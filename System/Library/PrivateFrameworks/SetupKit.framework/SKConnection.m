@interface SKConnection
- (BOOL)clientMode;
- (BOOL)conditionalPersistent;
- (BOOL)persistentPairing;
- (BOOL)reversePairing;
- (CBConnection)bleConnection;
- (NSData)pskData;
- (NSString)description;
- (NSString)label;
- (NSString)password;
- (OS_dispatch_queue)dispatchQueue;
- (SKConnection)init;
- (SKDevice)blePeerDevice;
- (id)authCompletionHandler;
- (id)authHidePasswordHandler;
- (id)authPromptHandler;
- (id)authShowPasswordHandler;
- (id)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 error:(id *)a8;
- (id)errorHandler;
- (id)invalidationHandler;
- (id)pairSetupConfigHandler;
- (id)receivedEventHandler;
- (id)receivedRequestHandler;
- (id)sendDataHandler;
- (id)stateChangedHandler;
- (int)passwordType;
- (int)state;
- (unsigned)bluetoothUseCase;
- (void)_abortRequestsWithError:(id)a3;
- (void)_activateWithCompletion:(id)a3;
- (void)_clientConnectCompleted:(id)a3;
- (void)_clientConnectStart;
- (void)_clientConnectStartBLE;
- (void)_clientError:(id)a3;
- (void)_clientPairSetupCompleted:(id)a3;
- (void)_clientPairSetupContinueWithData:(id)a3;
- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 passwordType:(int)a4 throttleSeconds:(int)a5;
- (void)_clientPairSetupStart;
- (void)_clientPairSetupStartReverse;
- (void)_clientPairVerifyCompleted:(id)a3;
- (void)_clientPairVerifyStart;
- (void)_clientPairVerifyWithData:(id)a3;
- (void)_clientRun;
- (void)_invalidateCore:(id)a3;
- (void)_invalidateWithError:(id)a3;
- (void)_invalidated;
- (void)_pairSetupInvalidate;
- (void)_pairVerifyInvalidate;
- (void)_processSends;
- (void)_pskPrepareClientMode:(BOOL)a3;
- (void)_receiveCompletion:(id)a3;
- (void)_receiveStart:(id)a3;
- (void)_receivedEvent:(id)a3;
- (void)_receivedHeader:(id *)a3 body:(id)a4;
- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4;
- (void)_receivedHeader:(id *)a3 unencryptedObjectData:(id)a4;
- (void)_receivedObject:(id)a3;
- (void)_receivedRequest:(id)a3;
- (void)_receivedResponse:(id)a3;
- (void)_run;
- (void)_sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4;
- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4;
- (void)_sendHeaderData:(id)a3 bodyData:(id)a4 completion:(id)a5;
- (void)_sendRequestID:(id)a3 request:(id)a4 options:(id)a5 sendEntry:(id)a6 responseHandler:(id)a7;
- (void)_sendResponse:(id)a3 error:(id)a4 xid:(id)a5 requestID:(id)a6 completion:(id)a7;
- (void)_serverAccept;
- (void)_serverAcceptBLE;
- (void)_serverError:(id)a3;
- (void)_serverPairSetupCompleted:(id)a3;
- (void)_serverPairSetupContinueWithData:(id)a3 start:(BOOL)a4;
- (void)_serverPairVerifyCompleted:(id)a3;
- (void)_serverPairVerifyContinueWithData:(id)a3 start:(BOOL)a4;
- (void)_serverRun;
- (void)_timeoutForSendEntry:(id)a3;
- (void)_timeoutForXID:(id)a3;
- (void)_updateExternalState;
- (void)activateWithCompletion:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)receivedData:(id)a3;
- (void)sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7;
- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6;
- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6;
- (void)setAuthCompletionHandler:(id)a3;
- (void)setAuthHidePasswordHandler:(id)a3;
- (void)setAuthPromptHandler:(id)a3;
- (void)setAuthShowPasswordHandler:(id)a3;
- (void)setBleConnection:(id)a3;
- (void)setBlePeerDevice:(id)a3;
- (void)setBluetoothUseCase:(unsigned int)a3;
- (void)setClientMode:(BOOL)a3;
- (void)setConditionalPersistent:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setErrorHandler:(id)a3;
- (void)setInvalidationHandler:(id)a3;
- (void)setLabel:(id)a3;
- (void)setPairSetupConfigHandler:(id)a3;
- (void)setPassword:(id)a3;
- (void)setPasswordType:(int)a3;
- (void)setPersistentPairing:(BOOL)a3;
- (void)setPskData:(id)a3;
- (void)setReceivedEventHandler:(id)a3;
- (void)setReceivedRequestHandler:(id)a3;
- (void)setReversePairing:(BOOL)a3;
- (void)setSendDataHandler:(id)a3;
- (void)setState:(int)a3;
- (void)setStateChangedHandler:(id)a3;
- (void)tryPassword:(id)a3;
- (void)updatePasswordType:(int)a3;
@end

@implementation SKConnection

- (void).cxx_destruct
{
  objc_storeStrong(&self->_stateChangedHandler, 0);
  objc_storeStrong(&self->_sendDataHandler, 0);
  objc_storeStrong(&self->_receivedRequestHandler, 0);
  objc_storeStrong(&self->_receivedEventHandler, 0);
  objc_storeStrong(&self->_pairSetupConfigHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_pskData, 0);
  objc_storeStrong(&self->_errorHandler, 0);
  objc_storeStrong((id *)&self->_blePeerDevice, 0);
  objc_storeStrong((id *)&self->_bleConnection, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_authPromptHandler, 0);
  objc_storeStrong(&self->_authShowPasswordHandler, 0);
  objc_storeStrong(&self->_authHidePasswordHandler, 0);
  objc_storeStrong(&self->_authCompletionHandler, 0);
  objc_storeStrong((id *)&self->_stepError, 0);
  objc_storeStrong((id *)&self->_startTimer, 0);
  objc_storeStrong((id *)&self->_sendArray, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_pairVerifySession, 0);
  objc_storeStrong((id *)&self->_pairSetupSession, 0);
  objc_storeStrong((id *)&self->_mainStream, 0);
  objc_storeStrong((id *)&self->_requestable, 0);

  objc_storeStrong((id *)&self->_authThrottleTimer, 0);
}

- (void)setStateChangedHandler:(id)a3
{
}

- (id)stateChangedHandler
{
  return self->_stateChangedHandler;
}

- (void)setState:(int)a3
{
  self->_state = a3;
}

- (int)state
{
  return self->_state;
}

- (void)setSendDataHandler:(id)a3
{
}

- (id)sendDataHandler
{
  return self->_sendDataHandler;
}

- (void)setReversePairing:(BOOL)a3
{
  self->_reversePairing = a3;
}

- (BOOL)reversePairing
{
  return self->_reversePairing;
}

- (void)setReceivedRequestHandler:(id)a3
{
}

- (id)receivedRequestHandler
{
  return self->_receivedRequestHandler;
}

- (void)setReceivedEventHandler:(id)a3
{
}

- (id)receivedEventHandler
{
  return self->_receivedEventHandler;
}

- (void)setPersistentPairing:(BOOL)a3
{
  self->_persistentPairing = a3;
}

- (BOOL)persistentPairing
{
  return self->_persistentPairing;
}

- (void)setPairSetupConfigHandler:(id)a3
{
}

- (id)pairSetupConfigHandler
{
  return self->_pairSetupConfigHandler;
}

- (void)setInvalidationHandler:(id)a3
{
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setPskData:(id)a3
{
}

- (NSData)pskData
{
  return self->_pskData;
}

- (void)setErrorHandler:(id)a3
{
}

- (id)errorHandler
{
  return self->_errorHandler;
}

- (void)setConditionalPersistent:(BOOL)a3
{
  self->_conditionalPersistent = a3;
}

- (BOOL)conditionalPersistent
{
  return self->_conditionalPersistent;
}

- (void)setClientMode:(BOOL)a3
{
  self->_clientMode = a3;
}

- (BOOL)clientMode
{
  return self->_clientMode;
}

- (void)setBluetoothUseCase:(unsigned int)a3
{
  self->_bluetoothUseCase = a3;
}

- (unsigned)bluetoothUseCase
{
  return self->_bluetoothUseCase;
}

- (void)setBlePeerDevice:(id)a3
{
}

- (SKDevice)blePeerDevice
{
  return self->_blePeerDevice;
}

- (void)setBleConnection:(id)a3
{
}

- (CBConnection)bleConnection
{
  return self->_bleConnection;
}

- (void)setPasswordType:(int)a3
{
  self->_passwordType = a3;
}

- (int)passwordType
{
  return self->_passwordType;
}

- (void)setPassword:(id)a3
{
}

- (NSString)password
{
  return self->_password;
}

- (NSString)label
{
  return self->_label;
}

- (void)setDispatchQueue:(id)a3
{
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setAuthPromptHandler:(id)a3
{
}

- (id)authPromptHandler
{
  return self->_authPromptHandler;
}

- (void)setAuthShowPasswordHandler:(id)a3
{
}

- (id)authShowPasswordHandler
{
  return self->_authShowPasswordHandler;
}

- (void)setAuthHidePasswordHandler:(id)a3
{
}

- (id)authHidePasswordHandler
{
  return self->_authHidePasswordHandler;
}

- (void)setAuthCompletionHandler:(id)a3
{
}

- (id)authCompletionHandler
{
  return self->_authCompletionHandler;
}

- (void)_receivedResponse:(id)a3
{
  id v4 = a3;
  v5 = NSDictionaryGetNSNumber();
  uint64_t v6 = [v5 unsignedIntValue];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v5];
    if (!v8)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      v9 = 0;
      goto LABEL_20;
    }
    v9 = (void *)v8;
    [(NSMutableDictionary *)self->_requests setObject:0 forKeyedSubscript:v5];
    v10 = [v9 timer];
    [v9 setTimer:0];
    if (v10) {
      dispatch_source_cancel(v10);
    }
    CFDictionaryGetTypeID();
    v11 = CFDictionaryGetTypedValue();
    if (v11)
    {
      mach_absolute_time();
      [v9 sendTicks];
      uint64_t v12 = UpTicksToMilliseconds();
      v13 = CUDecodeNSErrorDictionary();
      int v14 = self->_ucat->var0;
      if (v13)
      {
        if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize()))
        {
          CUPrintNSError();
          v22 = uint64_t v21 = v12;
          uint64_t v20 = v7;
          LogPrintF();
        }
        v15 = objc_msgSend(v9, "responseHandler", v20, v21, v22);
        v16 = (void (*)(void))v15[2];
      }
      else
      {
        if (v14 <= 30 && (v14 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v20 = v7;
          uint64_t v21 = v12;
          LogPrintF();
        }
        v15 = objc_msgSend(v9, "responseHandler", v20, v21);
        v16 = (void (*)(void))v15[2];
      }
      v16();
    }
    else
    {
      int v19 = self->_ucat->var0;
      if (v19 > 90 || v19 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_19;
      }
      v13 = CUPrintErrorCode();
      LogPrintF();
    }

LABEL_19:
LABEL_20:

    goto LABEL_21;
  }
  int v17 = self->_ucat->var0;
  if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize()))
  {
    v9 = CUPrintErrorCode();
    LogPrintF();
    goto LABEL_20;
  }
LABEL_21:
}

- (void)_receivedRequest:(id)a3
{
  id v4 = a3;
  int v24 = 0;
  v5 = NSDictionaryGetNSNumber();
  uint64_t v6 = [v5 unsignedIntValue];
  if (v6)
  {
    uint64_t v7 = v6;
    CFStringGetTypeID();
    uint64_t v8 = CFDictionaryGetTypedValue();
    if (v8)
    {
      CFDictionaryGetTypeID();
      uint64_t v9 = CFDictionaryGetTypedValue();
      int var0 = self->_ucat->var0;
      if (v9)
      {
        v11 = (void *)v9;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v19 = v7;
          uint64_t v20 = [v11 count];
          v18 = v8;
          LogPrintF();
        }
        if (objc_msgSend(v8, "isEqual:", @"_ping", v18, v19, v20))
        {
          [(SKConnection *)self _sendResponse:v11 error:0 xid:v5 requestID:v8 completion:&__block_literal_global_283];
        }
        else
        {
          uint64_t v12 = MEMORY[0x223C632B0](self->_receivedRequestHandler);
          v13 = (void *)v12;
          if (v12)
          {
            v22[0] = MEMORY[0x263EF8330];
            v22[1] = 3221225472;
            v22[2] = __33__SKConnection__receivedRequest___block_invoke_3;
            v22[3] = &unk_264548A70;
            v22[4] = self;
            v22[5] = v8;
            int v23 = v7;
            v22[6] = v5;
            (*(void (**)(uint64_t, void *, void *, void, void *))(v12 + 16))(v12, v8, v11, 0, v22);
          }
          else
          {
            int v14 = self->_ucat->var0;
            if (v14 <= 90 && (v14 != -1 || _LogCategory_Initialize())) {
              LogPrintF();
            }
            v15 = NSErrorF_safe();
            [(SKConnection *)self _sendResponse:0 error:v15 xid:v5 requestID:v8 completion:&__block_literal_global_287];
          }
        }
      }
      else
      {
        if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v21 = CUPrintErrorCode();
          LogPrintF();
        }
        v11 = 0;
      }
    }
    else
    {
      int v17 = self->_ucat->var0;
      if (v17 > 90 || v17 == -1 && !_LogCategory_Initialize())
      {
        uint64_t v8 = 0;
        goto LABEL_19;
      }
      v11 = CUPrintErrorCode();
      LogPrintF();
    }

LABEL_19:
    goto LABEL_20;
  }
  int v16 = self->_ucat->var0;
  if (v16 <= 90 && (v16 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v8 = CUPrintErrorCode();
    LogPrintF();
    goto LABEL_19;
  }
LABEL_20:
}

void __33__SKConnection__receivedRequest___block_invoke_3(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v14 = a2;
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = a1[4];
  if (*(unsigned char *)(v12 + 52))
  {
    int v13 = **(_DWORD **)(v12 + 144);
    if (v13 <= 90 && (v13 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    [(id)v12 _sendResponse:v14 error:v10 xid:a1[6] requestID:a1[5] completion:v11];
  }
}

- (void)_receivedEvent:(id)a3
{
  id v4 = a3;
  CFDictionaryGetTypeID();
  v5 = CFDictionaryGetTypedValue();
  if (v5)
  {
    CFStringGetTypeID();
    uint64_t v6 = CFDictionaryGetTypedValue();
    if (v6)
    {
      uint64_t v7 = NSDictionaryGetNSNumber();
      [v7 unsignedIntValue];
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
        [v5 count];
        LogPrintF();
      }
      uint64_t v9 = MEMORY[0x223C632B0](self->_receivedEventHandler);
      id v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t, void *, void *, void))(v9 + 16))(v9, v6, v5, 0);
      }
    }
    else
    {
      int v12 = self->_ucat->var0;
      if (v12 > 90 || v12 == -1 && !_LogCategory_Initialize())
      {
        uint64_t v6 = 0;
        goto LABEL_11;
      }
      uint64_t v7 = CUPrintErrorCode();
      LogPrintF();
    }

LABEL_11:
    goto LABEL_12;
  }
  int v11 = self->_ucat->var0;
  if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v6 = CUPrintErrorCode();
    LogPrintF();
    goto LABEL_11;
  }
LABEL_12:
}

- (void)_receivedObject:(id)a3
{
  id v7 = a3;
  int Int64Ranged = CFDictionaryGetInt64Ranged();
  if (Int64Ranged == 3)
  {
    p_int var0 = (int *)[(SKConnection *)self _receivedResponse:v7];
    goto LABEL_10;
  }
  if (Int64Ranged == 2)
  {
    p_int var0 = (int *)[(SKConnection *)self _receivedRequest:v7];
    goto LABEL_10;
  }
  id v5 = v7;
  if (Int64Ranged == 1)
  {
    p_int var0 = (int *)[(SKConnection *)self _receivedEvent:v7];
LABEL_10:
    id v5 = v7;
    goto LABEL_11;
  }
  p_int var0 = &self->_ucat->var0;
  if (*p_var0 <= 60)
  {
    if (*p_var0 != -1 || (p_int var0 = (int *)_LogCategory_Initialize(), v5 = v7, p_var0))
    {
      p_int var0 = (int *)LogPrintF();
      goto LABEL_10;
    }
  }
LABEL_11:

  MEMORY[0x270F9A758](p_var0, v5);
}

- (void)_receivedHeader:(id *)a3 unencryptedObjectData:(id)a4
{
  id v6 = a4;
  uint64_t v18 = 0;
  uint64_t v19 = &v18;
  uint64_t v20 = 0x3032000000;
  uint64_t v21 = __Block_byref_object_copy__229;
  v22 = __Block_byref_object_dispose__230;
  id v23 = 0;
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __54__SKConnection__receivedHeader_unencryptedObjectData___block_invoke;
  v17[3] = &unk_2645494E8;
  v17[4] = self;
  v17[5] = &v18;
  id v7 = (void (**)(void))MEMORY[0x223C632B0](v17);
  uint64_t v8 = (void *)OPACKDecodeData();
  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int var0 = self->_ucat->var0;
      if (a3->var0 == 8)
      {
        if (var0 <= 50 && (var0 != -1 || _LogCategory_Initialize()))
        {
          v15 = CUPrintNSObjectOneLine();
          LogPrintF();
        }
        pairSetupConfigHandler = (void (**)(id, void *))self->_pairSetupConfigHandler;
        if (pairSetupConfigHandler) {
          pairSetupConfigHandler[2](pairSetupConfigHandler, v8);
        }
      }
      else if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
      {
        [v6 length];
        LogPrintF();
      }
    }
    else
    {
      int v12 = (objc_class *)objc_opt_class();
      int v16 = NSStringFromClass(v12);
      uint64_t v13 = NSErrorF_safe();
      id v14 = (void *)v19[5];
      v19[5] = v13;
    }
  }
  else
  {
    id v11 = (id)NSErrorF_safe();
  }

  v7[2](v7);
  _Block_object_dispose(&v18, 8);
}

void __54__SKConnection__receivedHeader_unencryptedObjectData___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }
}

- (void)_receivedHeader:(id *)a3 encryptedObjectData:(id)a4
{
  id v6 = a4;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  int v24 = __Block_byref_object_copy__229;
  v25 = __Block_byref_object_dispose__230;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __52__SKConnection__receivedHeader_encryptedObjectData___block_invoke;
  v20[3] = &unk_2645494E8;
  v20[4] = self;
  v20[5] = &v21;
  id v7 = (void (**)(void))MEMORY[0x223C632B0](v20);
  uint64_t v8 = self->_mainStream;
  uint64_t v9 = v8;
  if (v8)
  {
    id v10 = (id *)(v22 + 5);
    id obj = (id)v22[5];
    id v11 = [(CUPairingStream *)v8 decryptData:v6 aadBytes:a3 aadLength:4 error:&obj];
    objc_storeStrong(v10, obj);
    if (v11)
    {
      int v12 = (void *)OPACKDecodeData();
      if (v12)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [(SKConnection *)self _receivedObject:v12];
        }
        else
        {
          v15 = (objc_class *)objc_opt_class();
          uint64_t v18 = NSStringFromClass(v15);
          uint64_t v16 = NSErrorF_safe();
          int v17 = (void *)v22[5];
          v22[5] = v16;
        }
      }
      else
      {
        id v14 = (id)NSErrorF_safe();
      }
    }
  }
  else
  {
    uint64_t v13 = NSErrorF_safe();
    id v11 = (void *)v22[5];
    v22[5] = v13;
  }

  v7[2](v7);
  _Block_object_dispose(&v21, 8);
}

void __52__SKConnection__receivedHeader_encryptedObjectData___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    int v1 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
    if (v1 <= 90 && (v1 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      id v2 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
    }
  }
}

- (void)_receivedHeader:(id *)a3 body:(id)a4
{
  id v6 = a4;
  uint64_t var0 = a3->var0;
  id v30 = v6;
  uint64_t v8 = [v6 length];
  if (var0 == 5) {
    int v9 = 10;
  }
  else {
    int v9 = 30;
  }
  int v10 = self->_ucat->var0;
  if (v9 >= v10)
  {
    unint64_t v11 = v8;
    if (v10 != -1 || _LogCategory_Initialize())
    {
      if (var0 > 8) {
        int v12 = "?";
      }
      else {
        int v12 = off_264548BC8[var0];
      }
      uint64_t v13 = CUPrintNSDataHex();
      id v14 = (void *)v13;
      v15 = "";
      if (v11 > 0x10) {
        v15 = "...";
      }
      uint64_t v28 = v13;
      v29 = v15;
      id v26 = v12;
      unint64_t v27 = v11;
      uint64_t v25 = var0;
      LogPrintF();
    }
  }
  switch((int)var0)
  {
    case 1:
      break;
    case 2:
      if (!self->_clientMode || self->_reversePairing)
      {
        uint64_t v16 = self;
        id v17 = v30;
        uint64_t v18 = 1;
        goto LABEL_21;
      }
      int v24 = self->_ucat->var0;
      if (v24 <= 60 && (v24 != -1 || _LogCategory_Initialize())) {
        goto LABEL_42;
      }
      break;
    case 3:
      if (self->_clientMode && !self->_reversePairing)
      {
        [(SKConnection *)self _clientPairSetupContinueWithData:v30];
      }
      else
      {
        uint64_t v16 = self;
        id v17 = v30;
        uint64_t v18 = 0;
LABEL_21:
        -[SKConnection _serverPairSetupContinueWithData:start:](v16, "_serverPairSetupContinueWithData:start:", v17, v18, v25, v26, v27, v28, v29);
      }
      break;
    case 5:
      [(SKConnection *)self _receivedHeader:a3 encryptedObjectData:v30];
      break;
    case 6:
      if (!self->_clientMode)
      {
        uint64_t v21 = self;
        id v22 = v30;
        uint64_t v23 = 1;
        goto LABEL_35;
      }
      int v20 = self->_ucat->var0;
      if (v20 <= 60 && (v20 != -1 || _LogCategory_Initialize())) {
        goto LABEL_42;
      }
      break;
    case 7:
      if (self->_clientMode)
      {
        [(SKConnection *)self _clientPairVerifyWithData:v30];
      }
      else
      {
        uint64_t v21 = self;
        id v22 = v30;
        uint64_t v23 = 0;
LABEL_35:
        -[SKConnection _serverPairVerifyContinueWithData:start:](v21, "_serverPairVerifyContinueWithData:start:", v22, v23, v25, v26, v27, v28, v29);
      }
      break;
    case 8:
      [(SKConnection *)self _receivedHeader:a3 unencryptedObjectData:v30];
      break;
    default:
      int v19 = self->_ucat->var0;
      if (v19 <= 60 && (v19 != -1 || _LogCategory_Initialize()))
      {
        objc_msgSend(v30, "length", v25, v26, v27, v28, v29);
LABEL_42:
        LogPrintF();
      }
      break;
  }
}

- (void)_receiveCompletion:(id)a3
{
  id v4 = a3;
  self->_readRequested = 0;
  id v5 = [v4 error];
  id v6 = v5;
  if (v5)
  {
    if ([v5 code] == -6753 || objc_msgSend(v6, "code") == -71148 || objc_msgSend(v6, "code") == -71143)
    {
      int var0 = self->_ucat->var0;
      if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
      {
LABEL_7:
        uint64_t v8 = CUPrintNSError();
        LogPrintF();
      }
    }
    else
    {
      int v17 = self->_ucat->var0;
      if (v17 <= 90 && (v17 != -1 || _LogCategory_Initialize())) {
        goto LABEL_7;
      }
    }
  }
  else
  {
    uint64_t v9 = [v4 length];
    int v10 = [v4 bufferData];
    [v10 setLength:v9];

    if (self->_receivingHeader)
    {
      unint64_t v11 = [v4 data];
      if ((unint64_t)[v11 length] <= 3)
      {
        int v22 = self->_ucat->var0;
        if (v22 <= 90 && (v22 != -1 || _LogCategory_Initialize()))
        {
          [v11 length];
          LogPrintF();
        }
      }
      else
      {
        int v12 = ($99C7B5D234F7D6D4241F49443380A03D *)[v11 bytes];
        $99C7B5D234F7D6D4241F49443380A03D v13 = *v12;
        self->_frameHeader = *v12;
        uint64_t v14 = (*(_DWORD *)&v13 << 8) & 0xFF0000 | (*(unsigned int *)&v13 >> 8) & 0xFF00 | v13.frameLen[2];
        int v15 = self->_ucat->var0;
        if (v14)
        {
          if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v23 = v14;
            LogPrintF();
          }
          self->_receivingHeader = 0;
          objc_msgSend(v4, "setMinLength:", v14, v23);
          [v4 setMaxLength:v14];
          v24[0] = MEMORY[0x263EF8330];
          v24[1] = 3221225472;
          v24[2] = __35__SKConnection__receiveCompletion___block_invoke;
          v24[3] = &unk_2645494C0;
          v24[4] = self;
          id v18 = v4;
          id v25 = v18;
          [v18 setCompletion:v24];
          [(CUReadWriteRequestable *)self->_requestable readWithRequest:v18];
          self->_readRequested = 1;
        }
        else
        {
          if (v15 <= 10 && (v15 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v21 = [MEMORY[0x263EFF8F8] data];
          [(SKConnection *)self _receivedHeader:&self->_frameHeader body:v21];

          [(SKConnection *)self _receiveStart:v4];
        }
      }
    }
    else
    {
      int v16 = self->_ucat->var0;
      if (v16 <= 10 && (v16 != -1 || _LogCategory_Initialize()))
      {
        uint64_t v23 = [v4 length];
        LogPrintF();
      }
      int v19 = objc_msgSend(v4, "data", v23);
      if (v19)
      {
        [(SKConnection *)self _receivedHeader:&self->_frameHeader body:v19];
      }
      else
      {
        int v20 = [MEMORY[0x263EFF8F8] data];
        [(SKConnection *)self _receivedHeader:&self->_frameHeader body:v20];
      }
      [(SKConnection *)self _receiveStart:v4];
    }
  }
}

uint64_t __35__SKConnection__receiveCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40)];
}

- (void)_receiveStart:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!v4) {
    id v5 = objc_alloc_init(MEMORY[0x263F385B8]);
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 10 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  self->_receivingHeader = 1;
  [v5 setMinLength:4];
  [v5 setMaxLength:4];
  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  int v10 = __30__SKConnection__receiveStart___block_invoke;
  unint64_t v11 = &unk_2645494C0;
  int v12 = self;
  id v13 = v5;
  id v7 = v5;
  [v7 setCompletion:&v8];
  -[CUReadWriteRequestable readWithRequest:](self->_requestable, "readWithRequest:", v7, v8, v9, v10, v11, v12);
  self->_readRequested = 1;
}

uint64_t __30__SKConnection__receiveStart___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _receiveCompletion:*(void *)(a1 + 40)];
}

- (void)receivedData:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __29__SKConnection_receivedData___block_invoke;
  v7[3] = &unk_2645494C0;
  id v8 = v4;
  uint64_t v9 = self;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

void __29__SKConnection_receivedData___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) length];
  if (v2 <= 3)
  {
    int v4 = **(_DWORD **)(*(void *)(a1 + 40) + 144);
    if (v4 <= 90 && (v4 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 32) bytes];
    objc_msgSend(*(id *)(a1 + 32), "subdataWithRange:", 4, v2 - 4);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    [*(id *)(a1 + 40) _receivedHeader:v3 body:v5];
  }
}

- (void)_timeoutForXID:(id)a3
{
  id v14 = a3;
  uint64_t v4 = [v14 unsignedIntValue];
  id v5 = [(NSMutableDictionary *)self->_requests objectForKeyedSubscript:v14];
  if (v5)
  {
    [(NSMutableDictionary *)self->_requests setObject:0 forKeyedSubscript:v14];
    mach_absolute_time();
    [v5 sendTicks];
    UpTicksToSecondsF();
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      uint64_t v8 = v6;
      if (var0 != -1 || _LogCategory_Initialize())
      {
        uint64_t v13 = v8;
        uint64_t v12 = v4;
        LogPrintF();
      }
    }
    objc_msgSend(v5, "responseHandler", v12, v13);
    uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    int v10 = NSErrorF_safe();
    ((void (**)(void, void, void, void *))v9)[2](v9, 0, 0, v10);
  }
  else
  {
    int v11 = self->_ucat->var0;
    if (v11 <= 90 && (v11 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
}

- (void)_timeoutForSendEntry:(id)a3
{
  id v15 = a3;
  uint64_t v4 = [v15 xidObj];
  if (v4)
  {
    [(SKConnection *)self _timeoutForXID:v4];
    goto LABEL_15;
  }
  mach_absolute_time();
  [v15 queueTicks];
  UpTicksToSecondsF();
  uint64_t v6 = v5;
  uint64_t v7 = [(NSMutableArray *)self->_sendArray indexOfObject:v15];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(NSMutableArray *)self->_sendArray removeObjectAtIndex:v7];
    int var0 = self->_ucat->var0;
    if (var0 <= 60)
    {
      int v11 = v15;
      if (var0 == -1)
      {
        if (!_LogCategory_Initialize()) {
          goto LABEL_13;
        }
        int v11 = v15;
      }
      [v11 requestID];
      v13 = uint64_t v14 = v6;
      LogPrintF();
    }
LABEL_13:
    objc_msgSend(v15, "responseHandler", v13, v14);
    uint64_t v9 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue();
    uint64_t v12 = NSErrorF_safe();
    ((void (**)(void, void, void, void *))v9)[2](v9, 0, 0, v12);

    goto LABEL_14;
  }
  int v8 = self->_ucat->var0;
  if (v8 <= 90 && (v8 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v9 = [v15 requestID];
    LogPrintF();
LABEL_14:
  }
LABEL_15:
}

- (void)_abortRequestsWithError:(id)a3
{
  id v4 = a3;
  requests = self->_requests;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __40__SKConnection__abortRequestsWithError___block_invoke;
  int v10 = &unk_264548A48;
  int v11 = self;
  id v12 = v4;
  id v6 = v4;
  [(NSMutableDictionary *)requests enumerateKeysAndObjectsUsingBlock:&v7];
  [(NSMutableDictionary *)self->_requests removeAllObjects];
}

void __40__SKConnection__abortRequestsWithError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  int v6 = **(_DWORD **)(*(void *)(a1 + 32) + 144);
  if (v6 <= 60 && (v6 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v7 = [v12 unsignedIntValue];
    CUPrintNSError();
    v11 = uint64_t v10 = v7;
    LogPrintF();
  }
  uint64_t v8 = objc_msgSend(v5, "timer", v10, v11);
  [v5 setTimer:0];
  if (v8) {
    dispatch_source_cancel(v8);
  }
  uint64_t v9 = [v5 responseHandler];
  [v5 setResponseHandler:0];
  if (v9) {
    v9[2](v9, 0, 0, *(void *)(a1 + 40));
  }
}

- (void)_processSends
{
  uint64_t v3 = [(NSMutableArray *)self->_sendArray popFirstObject];
  if (v3)
  {
    id v4 = (void *)v3;
    do
    {
      id v5 = [v4 eventID];
      if (v5)
      {
        int v6 = [v4 eventData];
        uint64_t v7 = v6;
        if (v6)
        {
          id v8 = v6;
        }
        else
        {
          id v8 = [MEMORY[0x263EFF8F8] data];
        }
        uint64_t v10 = v8;

        uint64_t v14 = [v4 completion];
        id v15 = v14;
        if (!v14) {
          uint64_t v14 = &__block_literal_global_243;
        }
        int v16 = (void *)MEMORY[0x223C632B0](v14);

        uint64_t v17 = [v4 xid];
        id v18 = [v4 options];
        [(SKConnection *)self _sendEventID:v5 data:v10 xid:v17 options:v18 completion:v16];
      }
      else
      {
        uint64_t v9 = [v4 requestID];
        if (v9)
        {
          uint64_t v10 = (void *)v9;
          int v11 = [v4 request];
          id v12 = v11;
          if (v11)
          {
            id v13 = v11;
          }
          else
          {
            id v13 = [NSDictionary dictionary];
          }
          int v20 = v13;

          uint64_t v21 = [v4 responseHandler];
          int v22 = [v4 options];
          [(SKConnection *)self _sendRequestID:v10 request:v20 options:v22 sendEntry:v4 responseHandler:v21];
        }
        else
        {
          int var0 = self->_ucat->var0;
          if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          uint64_t v10 = 0;
        }
      }

      id v4 = [(NSMutableArray *)self->_sendArray popFirstObject];
    }
    while (v4);
  }
}

- (void)_sendHeaderData:(id)a3 bodyData:(id)a4 completion:(id)a5
{
  v26[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = self->_requestable;
  if (v11)
  {
    id v12 = objc_alloc_init(MEMORY[0x263F38608]);
    uint64_t v19 = MEMORY[0x263EF8330];
    uint64_t v20 = 3221225472;
    uint64_t v21 = __52__SKConnection__sendHeaderData_bodyData_completion___block_invoke;
    int v22 = &unk_264549148;
    id v23 = v12;
    id v24 = v10;
    [v12 setCompletion:&v19];
    if (objc_msgSend(v9, "length", v19, v20, v21, v22, v23))
    {
      v26[0] = v8;
      v26[1] = v9;
      id v13 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v14 = (id *)v26;
      uint64_t v15 = 2;
    }
    else
    {
      id v25 = v8;
      id v13 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v14 = &v25;
      uint64_t v15 = 1;
    }
    id v18 = [v13 arrayWithObjects:v14 count:v15];
    [v12 setDataArray:v18];

    [(CUReadWriteRequestable *)v11 writeWithRequest:v12];
  }
  else
  {
    id v12 = (id)MEMORY[0x223C632B0](self->_sendDataHandler);
    if (v12)
    {
      id v16 = objc_alloc_init(MEMORY[0x263EFF990]);
      [v16 appendData:v8];
      if ([v9 length]) {
        [v16 appendData:v9];
      }
      (*((void (**)(id, id))v12 + 2))(v12, v16);
      uint64_t v17 = 0;
    }
    else
    {
      uint64_t v17 = NSErrorF_safe();
      id v16 = (id)v17;
    }
    (*((void (**)(id, uint64_t))v10 + 2))(v10, v17);
  }
}

void __52__SKConnection__sendHeaderData_bodyData_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) error];
  uint64_t v3 = *(void *)(a1 + 40);
  id v5 = (id)v2;
  if (v2)
  {
    id v4 = NSErrorNestedF();
    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)_sendFrameType:(unsigned __int8)a3 unencryptedObject:(id)a4
{
  uint64_t v4 = a3;
  int v9 = 0;
  int v6 = (void *)MEMORY[0x223C62E90](a4, 0, &v9);
  if (v6)
  {
    [(SKConnection *)self _sendFrameType:v4 body:v6];
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v8 = CUPrintErrorCode();
      LogPrintF();
    }
  }
}

- (void)_sendFrameType:(unsigned __int8)a3 body:(id)a4
{
  uint64_t v4 = a3;
  id v6 = a4;
  v21[0] = v4;
  unint64_t v7 = [v6 length];
  unint64_t v8 = v7;
  if (v7 >> 24)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
  }
  else
  {
    v21[1] = BYTE2(v7);
    v21[2] = BYTE1(v7);
    v21[3] = v7;
    int v9 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v21 length:4];
    int v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize()))
    {
      if (v4 > 8) {
        int v11 = "?";
      }
      else {
        int v11 = off_264548BC8[v4];
      }
      uint64_t v12 = CUPrintNSDataHex();
      id v13 = (void *)v12;
      uint64_t v14 = "";
      if (v8 > 0x10) {
        uint64_t v14 = "...";
      }
      uint64_t v19 = v12;
      uint64_t v20 = v14;
      uint64_t v17 = v11;
      unint64_t v18 = v8;
      uint64_t v16 = v4;
      LogPrintF();
    }
    -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v9, v6, &__block_literal_global_236, v16, v17, v18, v19, v20);
  }
}

- (void)_sendResponse:(id)a3 error:(id)a4 xid:(id)a5 requestID:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v55 = 0;
  v56 = (id *)&v55;
  uint64_t v57 = 0x3032000000;
  v58 = __Block_byref_object_copy__229;
  v59 = __Block_byref_object_dispose__230;
  id v60 = 0;
  uint64_t v17 = [v14 unsignedIntValue];
  v51[0] = MEMORY[0x263EF8330];
  v51[1] = 3221225472;
  v51[2] = __61__SKConnection__sendResponse_error_xid_requestID_completion___block_invoke;
  v51[3] = &unk_264548A20;
  v53 = &v55;
  v51[4] = self;
  int v54 = v17;
  id v47 = v16;
  id v52 = v47;
  v46 = (void (**)(void))MEMORY[0x223C632B0](v51);
  id v18 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  uint64_t v19 = v18;
  if (v13) {
    BOOL v20 = 1;
  }
  else {
    BOOL v20 = v12 == 0;
  }
  if (v20) {
    id v21 = (id)MEMORY[0x263EFFA78];
  }
  else {
    id v21 = v12;
  }
  [v18 setObject:v21 forKeyedSubscript:&unk_26D1D0370];
  [v19 setObject:&unk_26D1D0400 forKeyedSubscript:&unk_26D1D03A0];
  [v19 setObject:v14 forKeyedSubscript:&unk_26D1D03D0];
  if (v13)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v38 = uint64_t v37 = v17;
      LogPrintF();
    }
    CUEncodeNSErrorDictionary();
  }
  uint64_t v42 = v17;
  v45 = v15;
  int v50 = 0;
  id v23 = (void *)MEMORY[0x223C62E90](v19, 0, &v50);
  id v24 = v23;
  if (v23)
  {
    v49[0] = 5;
    unint64_t v25 = self->_mainAuthTagLength + [v23 length];
    if (v25 >> 24)
    {
      uint64_t v35 = NSErrorF_safe();
      id v26 = v56[5];
      v56[5] = (id)v35;
    }
    else
    {
      v49[1] = BYTE2(v25);
      v49[2] = BYTE1(v25);
      v49[3] = v25;
      id v26 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v49 length:4];
      unint64_t v27 = self->_mainStream;
      uint64_t v28 = v27;
      id v43 = v14;
      id v44 = v12;
      if (v27)
      {
        v29 = v56;
        id obj = v56[5];
        id v30 = [(CUPairingStream *)v27 encryptData:v24 aadData:v26 error:&obj];
        objc_storeStrong(v29 + 5, obj);
        if (v30)
        {
          int v31 = self->_ucat->var0;
          if (v31 <= 30 && (v31 != -1 || _LogCategory_Initialize()))
          {
            v32 = CUPrintNSObject();
            v41 = CUPrintNSError();
            LogPrintF();

            -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v26, v30, v47, v42, v32, v25, v41);
          }
          else
          {
            -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v26, v30, v47, v37, v38, v39, v40);
          }
        }
      }
      else
      {
        uint64_t v36 = NSErrorF_safe();
        id v30 = v56[5];
        v56[5] = (id)v36;
      }

      id v14 = v43;
      id v12 = v44;
    }
  }
  else
  {
    uint64_t v33 = NSErrorF_safe();
    id v34 = v56[5];
    v56[5] = (id)v33;
  }
  v46[2](v46);

  _Block_object_dispose(&v55, 8);
}

uint64_t __61__SKConnection__sendResponse_error_xid_requestID_completion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)_sendRequestID:(id)a3 request:(id)a4 options:(id)a5 sendEntry:(id)a6 responseHandler:(id)a7
{
  v65[4] = *MEMORY[0x263EF8340];
  id v12 = a3;
  id v44 = a4;
  id v48 = a5;
  id v46 = a6;
  id v13 = a7;
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    uint64_t v15 = xidLast + 1;
  }
  else {
    uint64_t v15 = 1;
  }
  self->_unsigned int xidLast = v15;
  uint64_t v58 = 0;
  v59 = (id *)&v58;
  uint64_t v60 = 0x3032000000;
  v61 = __Block_byref_object_copy__229;
  v62 = __Block_byref_object_dispose__230;
  id v63 = 0;
  v53[0] = MEMORY[0x263EF8330];
  v53[1] = 3221225472;
  v53[2] = __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke;
  v53[3] = &unk_2645489D0;
  v56 = &v58;
  v53[4] = self;
  id v47 = v12;
  id v54 = v47;
  int v57 = v15;
  id v43 = v13;
  id v55 = v43;
  uint64_t v42 = (void (**)(void))MEMORY[0x223C632B0](v53);
  uint64_t v16 = [NSNumber numberWithUnsignedInt:v15];
  v64[0] = &unk_26D1D0370;
  v64[1] = &unk_26D1D0388;
  v65[0] = v44;
  v65[1] = v47;
  v64[2] = &unk_26D1D03A0;
  v64[3] = &unk_26D1D03D0;
  v65[2] = &unk_26D1D03E8;
  v65[3] = v16;
  [NSDictionary dictionaryWithObjects:v65 forKeys:v64 count:4];
  v41 = int v52 = 0;
  uint64_t v17 = (void *)MEMORY[0x223C62E90](v41, 0, &v52);
  id v18 = v17;
  v45 = (void *)v16;
  if (v17)
  {
    int v51 = 5;
    unint64_t v19 = self->_mainAuthTagLength + [v17 length];
    if (v19 >> 24)
    {
      uint64_t v35 = NSErrorF_safe();
      id v20 = v59[5];
      v59[5] = (id)v35;
    }
    else
    {
      BYTE1(v51) = BYTE2(v19);
      BYTE2(v51) = BYTE1(v19);
      HIBYTE(v51) = v19;
      id v20 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:&v51 length:4];
      id v21 = self->_mainStream;
      int v22 = v21;
      if (v21)
      {
        id v23 = v59;
        id obj = v59[5];
        id v24 = [(CUPairingStream *)v21 encryptData:v18 aadData:v20 error:&obj];
        objc_storeStrong(v23 + 5, obj);
        if (v24)
        {
          unint64_t v25 = objc_alloc_init(SKRequestEntry);
          [(SKRequestEntry *)v25 setOptions:v48];
          [(SKRequestEntry *)v25 setRequestID:v47];
          [(SKRequestEntry *)v25 setResponseHandler:v43];
          [(SKRequestEntry *)v25 setSendTicks:mach_absolute_time()];
          if (v46)
          {
            id v26 = [v46 timer];
            [(SKRequestEntry *)v25 setTimer:v26];

            [v46 setXidObj:v45];
          }
          requests = self->_requests;
          if (!requests)
          {
            uint64_t v28 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
            v29 = self->_requests;
            self->_requests = v28;

            requests = self->_requests;
          }
          [(NSMutableDictionary *)requests setObject:v25 forKeyedSubscript:v45];
          int var0 = self->_ucat->var0;
          if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
          {
            uint64_t v39 = CUPrintNSObject();
            unint64_t v40 = v19;
            id v37 = v47;
            uint64_t v38 = v15;
            LogPrintF();
          }
          -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v20, v24, &__block_literal_global_235, v37, v38, v39, v40);
          if (v48)
          {
            CFDictionaryGetDouble();
            if (v31 > 0.0)
            {
              v32 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
              handler[0] = MEMORY[0x263EF8330];
              handler[1] = 3221225472;
              handler[2] = __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke_2;
              handler[3] = &unk_2645489F8;
              handler[4] = v32;
              handler[5] = self;
              handler[6] = v45;
              dispatch_source_set_event_handler(v32, handler);
              CUDispatchTimerSet();
              dispatch_activate(v32);
              [(SKRequestEntry *)v25 setTimer:v32];
            }
          }
        }
      }
      else
      {
        uint64_t v36 = NSErrorF_safe();
        id v24 = v59[5];
        v59[5] = (id)v36;
      }
    }
  }
  else
  {
    uint64_t v33 = NSErrorF_safe();
    id v34 = v59[5];
    v59[5] = (id)v33;
  }
  v42[2](v42);

  _Block_object_dispose(&v58, 8);
}

uint64_t __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
  return result;
}

uint64_t __73__SKConnection__sendRequestID_request_options_sendEntry_responseHandler___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _timeoutForXID:v3];
}

- (void)sendRequestID:(id)a3 request:(id)a4 options:(id)a5 responseHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v16 = NSErrorF_safe();
    (*((void (**)(id, void, void, void *))v13 + 2))(v13, 0, 0, v16);
  }
  else if ((self->_runState & 0xFFFFFFF7) == 0x14 && ![(NSMutableArray *)self->_sendArray count])
  {
    [(SKConnection *)self _sendRequestID:v10 request:v11 options:v12 sendEntry:0 responseHandler:v13];
  }
  else
  {
    int v15 = self->_ucat->var0;
    if (v15 <= 30 && (v15 != -1 || _LogCategory_Initialize()))
    {
      id v20 = v10;
      uint64_t v21 = [(NSMutableArray *)self->_sendArray count];
      LogPrintF();
    }
    uint64_t v17 = objc_alloc_init(SKSendEntry);
    [(SKSendEntry *)v17 setOptions:v12];
    [(SKSendEntry *)v17 setQueueTicks:mach_absolute_time()];
    [(SKSendEntry *)v17 setRequestID:v10];
    [(SKSendEntry *)v17 setRequest:v11];
    [(SKSendEntry *)v17 setResponseHandler:v13];
    if (v12)
    {
      CFDictionaryGetDouble();
      if (v18 > 0.0)
      {
        unint64_t v19 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
        handler[0] = MEMORY[0x263EF8330];
        handler[1] = 3221225472;
        handler[2] = __62__SKConnection_sendRequestID_request_options_responseHandler___block_invoke;
        handler[3] = &unk_2645489F8;
        handler[4] = v19;
        handler[5] = self;
        handler[6] = v17;
        dispatch_source_set_event_handler(v19, handler);
        CUDispatchTimerSet();
        dispatch_activate(v19);
        [(SKSendEntry *)v17 setTimer:v19];
      }
    }
    -[NSMutableArray addObject:](self->_sendArray, "addObject:", v17, v20, v21);
  }
}

uint64_t __62__SKConnection_sendRequestID_request_options_responseHandler___block_invoke(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  uint64_t v2 = *(void **)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 48);

  return [v2 _timeoutForSendEntry:v3];
}

- (void)_sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  uint64_t v42 = 0;
  id v43 = (id *)&v42;
  uint64_t v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__229;
  id v46 = __Block_byref_object_dispose__230;
  id v47 = 0;
  v37[0] = MEMORY[0x263EF8330];
  v37[1] = 3221225472;
  v37[2] = __57__SKConnection__sendEventID_data_xid_options_completion___block_invoke;
  v37[3] = &unk_2645489D0;
  unint64_t v40 = &v42;
  v37[4] = self;
  id v34 = v12;
  id v38 = v34;
  int v41 = v9;
  id v16 = v15;
  id v39 = v16;
  uint64_t v17 = (void (**)(void))MEMORY[0x223C632B0](v37);
  v36[0] = 5;
  unint64_t v18 = self->_mainAuthTagLength + [v13 length];
  if (v18 >> 24)
  {
    uint64_t v26 = NSErrorF_safe();
    id v19 = v43[5];
    v43[5] = (id)v26;
  }
  else
  {
    uint64_t v33 = v9;
    v36[1] = BYTE2(v18);
    v36[2] = BYTE1(v18);
    v36[3] = v18;
    id v19 = (id)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytes:v36 length:4];
    id v20 = self->_mainStream;
    uint64_t v21 = v20;
    if (v20)
    {
      int v22 = v43;
      id obj = v43[5];
      id v23 = v13;
      id v24 = [(CUPairingStream *)v20 encryptData:v13 aadData:v19 error:&obj];
      objc_storeStrong(v22 + 5, obj);
      if (v24)
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          double v31 = CUPrintNSObject();
          LogPrintF();

          -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v19, v24, v16, v34, v33, v31, v18);
        }
        else
        {
          -[SKConnection _sendHeaderData:bodyData:completion:](self, "_sendHeaderData:bodyData:completion:", v19, v24, v16, v28, v29, v30, v32);
        }
      }
    }
    else
    {
      id v23 = v13;
      uint64_t v27 = NSErrorF_safe();
      id v24 = v43[5];
      v43[5] = (id)v27;
    }

    id v13 = v23;
  }

  v17[2](v17);
  _Block_object_dispose(&v42, 8);
}

uint64_t __57__SKConnection__sendEventID_data_xid_options_completion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[7] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    uint64_t v4 = *(uint64_t (**)(void))(a1[6] + 16);
    return v4();
  }
  return result;
}

- (void)sendEventID:(id)a3 data:(id)a4 xid:(unsigned int)a5 options:(id)a6 completion:(id)a7
{
  uint64_t v9 = *(void *)&a5;
  id v19 = a3;
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void *))a7;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidateCalled)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v17 = NSErrorF_safe();
    v14[2](v14, v17);
  }
  else if ((self->_runState & 0xFFFFFFF7) == 0x14 && ![(NSMutableArray *)self->_sendArray count])
  {
    [(SKConnection *)self _sendEventID:v19 data:v12 xid:v9 options:v13 completion:v14];
  }
  else
  {
    int v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize()))
    {
      [(NSMutableArray *)self->_sendArray count];
      LogPrintF();
    }
    unint64_t v18 = objc_alloc_init(SKSendEntry);
    [(SKSendEntry *)v18 setCompletion:v14];
    [(SKSendEntry *)v18 setEventID:v19];
    [(SKSendEntry *)v18 setEventData:v12];
    [(SKSendEntry *)v18 setOptions:v13];
    [(SKSendEntry *)v18 setQueueTicks:mach_absolute_time()];
    [(SKSendEntry *)v18 setXid:v9];
    [(NSMutableArray *)self->_sendArray addObject:v18];
  }
}

- (void)sendEventID:(id)a3 event:(id)a4 options:(id)a5 completion:(id)a6
{
  v23[4] = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a5;
  id v12 = (void (**)(id, void *))a6;
  dispatchQueue = self->_dispatchQueue;
  id v14 = a4;
  dispatch_assert_queue_V2(dispatchQueue);
  unsigned int xidLast = self->_xidLast;
  if (xidLast + 1 > 1) {
    uint64_t v16 = xidLast + 1;
  }
  else {
    uint64_t v16 = 1;
  }
  self->_unsigned int xidLast = v16;
  v22[0] = &unk_26D1D0370;
  v22[1] = &unk_26D1D0388;
  v23[0] = v14;
  v23[1] = v10;
  v23[2] = &unk_26D1D03B8;
  v22[2] = &unk_26D1D03A0;
  v22[3] = &unk_26D1D03D0;
  uint64_t v17 = [NSNumber numberWithUnsignedInt:v16];
  v23[3] = v17;
  unint64_t v18 = [NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:4];

  int v21 = 0;
  id v19 = (void *)MEMORY[0x223C62E90](v18, 0, &v21);
  if (v19)
  {
    [(SKConnection *)self sendEventID:v10 data:v19 xid:v16 options:v11 completion:v12];
  }
  else
  {
    id v20 = NSErrorF_safe();
    v12[2](v12, v20);
  }
}

- (void)_serverError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v8 = v4;
  if (var0 <= 30)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v8, v6))
    {
      unint64_t v7 = CUPrintNSError();
      LogPrintF();

      id v4 = v8;
    }
  }
  -[SKConnection _invalidateWithError:](self, "_invalidateWithError:", v4, v7);
}

- (void)_serverPairVerifyCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    goto LABEL_3;
  }
  pairVerifySession = self->_pairVerifySession;
  id v14 = 0;
  unint64_t v7 = [(CUPairingSession *)pairVerifySession openStreamWithName:@"main" error:&v14];
  id v5 = v14;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v13 = CUPrintNSError();
      LogPrintF();
    }
    [(SKConnection *)self _pairVerifyInvalidate];
  }
  else
  {
    self->_mainAuthTagLength = [(CUPairingStream *)self->_mainStream authTagLength];
    int v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_runState == 24)
    {
      uint64_t v11 = MEMORY[0x223C632B0](self->_authCompletionHandler);
      id v12 = (void *)v11;
      if (v11) {
        (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
      }

      self->_stepDone = 1;
      [(SKConnection *)self _run];
    }
  }
}

- (void)_serverPairVerifyContinueWithData:(id)a3 start:(BOOL)a4
{
  id v6 = a3;
  uint64_t v28 = 0;
  uint64_t v29 = &v28;
  uint64_t v30 = 0x3032000000;
  double v31 = __Block_byref_object_copy__229;
  uint64_t v32 = __Block_byref_object_dispose__230;
  id v33 = 0;
  v27[0] = MEMORY[0x263EF8330];
  v27[1] = 3221225472;
  v27[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke;
  v27[3] = &unk_2645494E8;
  v27[4] = self;
  v27[5] = &v28;
  unint64_t v7 = (void (**)(void))MEMORY[0x223C632B0](v27);
  int v26 = 0;
  id v8 = (void *)OPACKDecodeData();
  if (!v8)
  {
    uint64_t v16 = NSErrorF_safe();
    id v15 = (void *)v29[5];
    v29[5] = v16;
    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v17 = (objc_class *)objc_opt_class();
    id v15 = NSStringFromClass(v17);
    uint64_t v18 = NSErrorF_safe();
    id v19 = (void *)v29[5];
    v29[5] = v18;

    goto LABEL_22;
  }
  if (a4 || !self->_pairVerifySession)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v12 = [v6 length];
      CUPrintNSObjectOneLineEx();
      id v23 = v22 = v12;
      LogPrintF();
    }
    [(SKConnection *)self _pairVerifyInvalidate];
    id v10 = objc_alloc_init(MEMORY[0x263F385A0]);
    objc_storeStrong((id *)&self->_pairVerifySession, v10);
    [v10 setDispatchQueue:self->_dispatchQueue];
    if (self->_conditionalPersistent || self->_persistentPairing) {
      uint64_t v13 = 8;
    }
    else {
      uint64_t v13 = 0x400000;
    }
    [v10 setFlags:v13];
    if (self->_label) {
      label = (__CFString *)self->_label;
    }
    else {
      label = @"SKCnx";
    }
    [v10 setLabel:label];
    [v10 setSessionType:4];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_2;
    v25[3] = &unk_264548958;
    v25[4] = v10;
    v25[5] = self;
    [v10 setSendDataHandler:v25];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_3;
    v24[3] = &unk_2645496B0;
    v24[4] = v10;
    void v24[5] = self;
    [v10 setCompletionHandler:v24];
    [v10 activate];
  }
  else
  {
    int v9 = self->_ucat->var0;
    if (v9 > 30 || v9 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_20;
    }
    [v6 length];
    CUPrintNSObjectOneLineEx();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    LogPrintF();
  }

LABEL_20:
  CFDataGetTypeID();
  id v15 = CFDictionaryGetTypedValue();
  if (v15)
  {
    [(CUPairingSession *)self->_pairVerifySession receivedData:v15];
  }
  else
  {
    uint64_t v20 = NSErrorF_safe();
    int v21 = (void *)v29[5];
    v29[5] = v20;

    id v15 = 0;
  }
LABEL_22:

  v7[2](v7);
  _Block_object_dispose(&v28, 8);
}

uint64_t __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    uint64_t v2 = result;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        unint64_t v7 = CUPrintNSError();
        LogPrintF();

        int v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v1 + 8) + 40);
    return [v3 _serverPairVerifyCompleted:v6];
  }
  return result;
}

void __56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  int v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[10])
  {
    unint64_t v7 = @"_pd";
    v8[0] = a3;
    int v4 = NSDictionary;
    id v5 = a3;
    uint64_t v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 _sendFrameType:7 unencryptedObject:v6];
  }
}

void *__56__SKConnection__serverPairVerifyContinueWithData_start___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[10]) {
    return (void *)[result _serverPairVerifyCompleted:a2];
  }
  return result;
}

- (void)_serverPairSetupCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    goto LABEL_3;
  }
  pairSetupSession = self->_pairSetupSession;
  id v16 = 0;
  unint64_t v7 = [(CUPairingSession *)pairSetupSession openStreamWithName:@"main" error:&v16];
  id v5 = v16;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      id v15 = CUPrintNSError();
      LogPrintF();

      [(SKConnection *)self _pairSetupInvalidate];
    }
    else
    {
      [(SKConnection *)self _pairSetupInvalidate];
    }
  }
  else
  {
    self->_mainAuthTagLength = [(CUPairingStream *)self->_mainStream authTagLength];
    int v13 = self->_ucat->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v5 = 0;
  }
  int runState = self->_runState;
  if (runState == 24 || runState == 18)
  {
    uint64_t v11 = MEMORY[0x223C632B0](self->_authCompletionHandler);
    uint64_t v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, id))(v11 + 16))(v11, v5);
    }

    if (!self->_stepError) {
      objc_storeStrong((id *)&self->_stepError, v5);
    }
    self->_stepDone = 1;
    [(SKConnection *)self _run];
  }
}

- (void)_serverPairSetupContinueWithData:(id)a3 start:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__229;
  uint64_t v36 = __Block_byref_object_dispose__230;
  id v37 = 0;
  v31[0] = MEMORY[0x263EF8330];
  v31[1] = 3221225472;
  v31[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke;
  v31[3] = &unk_2645494E8;
  v31[4] = self;
  v31[5] = &v32;
  unint64_t v7 = (void (**)(void))MEMORY[0x223C632B0](v31);
  int v30 = 0;
  id v8 = (void *)OPACKDecodeData();
  if (!v8)
  {
    uint64_t v18 = NSErrorF_safe();
    uint64_t v17 = (void *)v33[5];
    v33[5] = v18;
LABEL_33:

    goto LABEL_36;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v19 = (objc_class *)objc_opt_class();
    uint64_t v17 = NSStringFromClass(v19);
    uint64_t v20 = NSErrorF_safe();
    int v21 = (void *)v33[5];
    v33[5] = v20;

    goto LABEL_33;
  }
  if (!v4)
  {
    if (self->_pairSetupSession)
    {
      int var0 = self->_ucat->var0;
      if (var0 > 30 || var0 == -1 && !_LogCategory_Initialize()) {
        goto LABEL_31;
      }
      [v6 length];
      CUPrintNSObjectOneLineEx();
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      LogPrintF();
LABEL_30:

LABEL_31:
      CFDataGetTypeID();
      uint64_t v17 = CFDictionaryGetTypedValue();
      if (v17)
      {
        [(CUPairingSession *)self->_pairSetupSession receivedData:v17];
      }
      else
      {
        uint64_t v22 = NSErrorF_safe();
        id v23 = (void *)v33[5];
        v33[5] = v22;

        uint64_t v17 = 0;
      }
      goto LABEL_33;
    }
LABEL_12:
    int v13 = self->_ucat->var0;
    if (v13 <= 30 && (v13 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = [v6 length];
      CUPrintNSObjectOneLineEx();
      v25 = uint64_t v24 = v14;
      LogPrintF();
    }
    [(SKConnection *)self _pairSetupInvalidate];
    id v12 = objc_alloc_init(MEMORY[0x263F385A0]);
    objc_storeStrong((id *)&self->_pairSetupSession, v12);
    [v12 setDispatchQueue:self->_dispatchQueue];
    [v12 setFixedPIN:self->_password];
    if (self->_conditionalPersistent)
    {
      uint64_t v15 = 520;
    }
    else if (self->_persistentPairing)
    {
      uint64_t v15 = 8;
    }
    else
    {
      uint64_t v15 = 24;
    }
    [v12 setFlags:v15];
    if (self->_label) {
      label = (__CFString *)self->_label;
    }
    else {
      label = @"SKCnx";
    }
    [v12 setLabel:label];
    [v12 setPinType:self->_passwordType];
    [v12 setSessionType:2];
    if (self->_authShowPasswordHandler)
    {
      v29[0] = MEMORY[0x263EF8330];
      v29[1] = 3221225472;
      v29[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_2;
      v29[3] = &unk_2645489A8;
      v29[4] = v12;
      v29[5] = self;
      [v12 setShowPINHandlerEx:v29];
    }
    else
    {
      objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x80);
    }
    if (self->_authHidePasswordHandler)
    {
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_3;
      v28[3] = &unk_2645494C0;
      v28[4] = v12;
      v28[5] = self;
      [v12 setHidePINHandler:v28];
    }
    v27[0] = MEMORY[0x263EF8330];
    v27[1] = 3221225472;
    v27[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_4;
    v27[3] = &unk_264548958;
    v27[4] = v12;
    v27[5] = self;
    [v12 setSendDataHandler:v27];
    v26[0] = MEMORY[0x263EF8330];
    v26[1] = 3221225472;
    v26[2] = __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_5;
    void v26[3] = &unk_2645496B0;
    v26[4] = v12;
    v26[5] = self;
    [v12 setCompletionHandler:v26];
    [v12 activate];
    goto LABEL_30;
  }
  uint64_t Int64 = CFDictionaryGetInt64();
  self->_reversePairing = Int64 != 0;
  if (!Int64) {
    goto LABEL_12;
  }
  int v10 = self->_ucat->var0;
  if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SKConnection *)self _run];
LABEL_36:

  v7[2](v7);
  _Block_object_dispose(&v32, 8);
}

uint64_t __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        unint64_t v7 = CUPrintNSError();
        LogPrintF();

        uint64_t v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v1 + 8) + 40);
    return [v3 _serverPairSetupCompleted:v6];
  }
  return result;
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v5 + 72))
  {
    id v8 = v4;
    *(unsigned char *)(v5 + 112) = 1;
    uint64_t v6 = MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 40) + 192));
    unint64_t v7 = (void *)v6;
    if (v6) {
      (*(void (**)(uint64_t, void, id))(v6 + 16))(v6, *(unsigned int *)(*(void *)(a1 + 40) + 160), v8);
    }

    id v4 = v8;
  }
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 72) && *(unsigned char *)(v1 + 112))
  {
    *(unsigned char *)(v1 + 112) = 0;
    uint64_t v2 = (void (**)(void))MEMORY[0x223C632B0](*(void *)(*(void *)(a1 + 40) + 184));
    if (v2)
    {
      uint64_t v3 = v2;
      v2[2]();
      uint64_t v2 = v3;
    }
  }
}

void __55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  v8[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[9])
  {
    unint64_t v7 = @"_pd";
    v8[0] = a3;
    id v4 = NSDictionary;
    id v5 = a3;
    uint64_t v6 = [v4 dictionaryWithObjects:v8 forKeys:&v7 count:1];
    [v3 _sendFrameType:3 unencryptedObject:v6];
  }
}

void *__55__SKConnection__serverPairSetupContinueWithData_start___block_invoke_5(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[9]) {
    return (void *)[result _serverPairSetupCompleted:a2];
  }
  return result;
}

- (void)_serverAcceptBLE
{
  bleConnection = self->_bleConnection;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__SKConnection__serverAcceptBLE__block_invoke;
  v6[3] = &unk_2645496B0;
  v6[4] = bleConnection;
  v6[5] = self;
  id v4 = bleConnection;
  [(CBConnection *)v4 setErrorHandler:v6];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __32__SKConnection__serverAcceptBLE__block_invoke_2;
  v5[3] = &unk_2645494C0;
  v5[4] = v4;
  v5[5] = self;
  [(CBConnection *)v4 setInvalidationHandler:v5];
  [(SKConnection *)self _receiveStart:0];
}

void __32__SKConnection__serverAcceptBLE__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v1[29])
  {
    NSErrorNestedF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _serverError:v2];
  }
}

uint64_t __32__SKConnection__serverAcceptBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 232))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    id v5 = *(void **)(v1 + 232);
    *(void *)(v1 + 232) = 0;

    uint64_t v6 = *(void *)(v2 + 40);
    unint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    id v8 = *(void **)(v2 + 40);
    return [v8 _invalidated];
  }
  return result;
}

- (void)_serverAccept
{
  [(SKConnection *)self _pairSetupInvalidate];
  [(SKConnection *)self _pairVerifyInvalidate];
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  self->_reversePairing = 0;
  if (self->_bleConnection)
  {
    [(SKConnection *)self _serverAcceptBLE];
  }
  else if (self->_sendDataHandler)
  {
    self->_stepDone = 1;
  }
  else
  {
    NSErrorF_safe();
    int v4 = (NSError *)objc_claimAutoreleasedReturnValue();
    id v5 = self->_stepError;
    self->_stepError = v4;
    MEMORY[0x270F9A758](v4, v5);
  }
}

- (void)_serverRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      uint64_t runState = self->_runState;
      switch((int)runState)
      {
        case 23:
          [(SKConnection *)self _serverAccept];
          if (![(NSData *)self->_pskData length]) {
            goto LABEL_11;
          }
          unsigned int v4 = 27;
          goto LABEL_21;
        case 24:
          if (self->_reversePairing)
          {
            unsigned int v4 = 25;
LABEL_21:
            self->_uint64_t runState = v4;
            goto LABEL_22;
          }
          if (self->_stepError)
          {
LABEL_20:
            unsigned int v4 = 29;
            goto LABEL_21;
          }
          if (self->_stepDone)
          {
            self->_stepDone = 0;
LABEL_16:
            unsigned int v4 = 28;
            goto LABEL_21;
          }
          unsigned int v4 = 24;
LABEL_22:
          if (v4 == runState) {
            return;
          }
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_29;
          }
          if (var0 != -1) {
            goto LABEL_25;
          }
          if (_LogCategory_Initialize())
          {
            unsigned int v4 = self->_runState;
LABEL_25:
            uint64_t v6 = "?";
            if (v4 <= 0x1D) {
              uint64_t v6 = off_264548A90[v4];
            }
            unint64_t v7 = off_264548A90[runState];
            id v8 = v6;
            LogPrintF();
          }
LABEL_29:
          [(SKConnection *)self _updateExternalState];
          break;
        case 25:
          [(SKConnection *)self _clientPairSetupStart];
LABEL_11:
          unsigned int v4 = self->_runState + 1;
          goto LABEL_21;
        case 26:
          if (self->_stepError) {
            goto LABEL_20;
          }
          if (self->_stepDone) {
            goto LABEL_16;
          }
          unsigned int v4 = 26;
          goto LABEL_22;
        case 27:
          [(SKConnection *)self _pskPrepareClientMode:0];
          if (!self->_stepError) {
            goto LABEL_16;
          }
          goto LABEL_20;
        case 28:
          if (self->_stepError) {
            goto LABEL_20;
          }
          [(SKConnection *)self _processSends];
          unsigned int v4 = self->_runState;
          goto LABEL_22;
        case 29:
          goto LABEL_7;
        default:
          if (runState) {
            return;
          }
LABEL_7:
          unsigned int v4 = 23;
          goto LABEL_21;
      }
    }
  }
}

- (void)_clientError:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v12 = v4;
  if (var0 <= 90)
  {
    if (var0 != -1 || (v6 = _LogCategory_Initialize(), id v4 = v12, v6))
    {
      uint64_t v11 = CUPrintNSError();
      LogPrintF();

      id v4 = v12;
    }
  }
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v8 = startTimer;
    dispatch_source_cancel(v8);
    int v9 = self->_startTimer;
    self->_startTimer = 0;

    id v4 = v12;
  }
  if (v4)
  {
    -[SKConnection _abortRequestsWithError:](self, "_abortRequestsWithError:");
  }
  else
  {
    int v10 = NSErrorF_safe();
    [(SKConnection *)self _abortRequestsWithError:v10];
  }
  [(CBConnection *)self->_bleConnection invalidate];
  [(SKConnection *)self _invalidateWithError:v12];
}

- (void)_clientPairVerifyCompleted:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4) {
    goto LABEL_3;
  }
  pairVerifySession = self->_pairVerifySession;
  id v15 = 0;
  unint64_t v7 = [(CUPairingSession *)pairVerifySession openStreamWithName:@"main" error:&v15];
  id v5 = v15;
  mainStream = self->_mainStream;
  self->_mainStream = v7;

  if (v5)
  {
LABEL_3:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v14 = CUPrintNSError();
      LogPrintF();

      [(SKConnection *)self _pairVerifyInvalidate];
    }
    else
    {
      [(SKConnection *)self _pairVerifyInvalidate];
    }
  }
  else
  {
    self->_mainAuthTagLength = [(CUPairingStream *)self->_mainStream authTagLength];
    int v10 = self->_ucat->var0;
    if (v10 <= 30 && (v10 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v11 = MEMORY[0x223C632B0](self->_authCompletionHandler);
    id v12 = (void *)v11;
    if (v11) {
      (*(void (**)(uint64_t, void))(v11 + 16))(v11, 0);
    }

    id v5 = 0;
  }
  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, v5);
  }
  self->_stepDone = 1;
  [(SKConnection *)self _run];
}

- (void)_clientPairVerifyWithData:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__229;
  id v23 = __Block_byref_object_dispose__230;
  id v24 = 0;
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __42__SKConnection__clientPairVerifyWithData___block_invoke;
  v18[3] = &unk_2645494E8;
  v18[4] = self;
  v18[5] = &v19;
  id v5 = (void (**)(void))MEMORY[0x223C632B0](v18);
  if (self->_pairVerifySession)
  {
    int v6 = (void *)OPACKDecodeData();
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        int var0 = self->_ucat->var0;
        if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
        {
          [v4 length];
          uint64_t v17 = CUPrintNSObjectOneLineEx();
          LogPrintF();
        }
        CFDataGetTypeID();
        id v8 = CFDictionaryGetTypedValue();
        if (v8)
        {
          [(CUPairingSession *)self->_pairVerifySession receivedData:v8];
        }
        else
        {
          uint64_t v15 = NSErrorF_safe();
          id v16 = (void *)v20[5];
          v20[5] = v15;

          id v8 = 0;
        }
      }
      else
      {
        id v12 = (objc_class *)objc_opt_class();
        id v8 = NSStringFromClass(v12);
        uint64_t v13 = NSErrorF_safe();
        uint64_t v14 = (void *)v20[5];
        v20[5] = v13;
      }
    }
    else
    {
      uint64_t v11 = NSErrorF_safe();
      id v8 = (void *)v20[5];
      v20[5] = v11;
    }
  }
  else
  {
    uint64_t v9 = NSErrorF_safe();
    int v10 = (void *)v20[5];
    v20[5] = v9;
  }
  v5[2](v5);

  _Block_object_dispose(&v19, 8);
}

uint64_t __42__SKConnection__clientPairVerifyWithData___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    uint64_t v2 = result;
    int v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        unint64_t v7 = CUPrintNSError();
        LogPrintF();

        int v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v1 + 8) + 40);
    return [v3 _clientPairVerifyCompleted:v6];
  }
  return result;
}

- (void)_clientPairVerifyStart
{
  [(SKConnection *)self _pairVerifyInvalidate];
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init(MEMORY[0x263F385A0]);
  objc_storeStrong((id *)&self->_pairVerifySession, v5);
  [v5 setDispatchQueue:self->_dispatchQueue];
  uint64_t v6 = 8;
  if (!self->_conditionalPersistent)
  {
    if (self->_persistentPairing) {
      uint64_t v6 = 8;
    }
    else {
      uint64_t v6 = 0x400000;
    }
  }
  [v5 setFlags:v6];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"SKCnx";
  }
  [v5 setLabel:label];
  [v5 setSessionType:3];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __38__SKConnection__clientPairVerifyStart__block_invoke;
  v9[3] = &unk_264548958;
  v9[4] = v5;
  v9[5] = self;
  [v5 setSendDataHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __38__SKConnection__clientPairVerifyStart__block_invoke_2;
  v8[3] = &unk_2645496B0;
  v8[4] = v5;
  v8[5] = self;
  [v5 setCompletionHandler:v8];
  [v5 activate];
}

void __38__SKConnection__clientPairVerifyStart__block_invoke(uint64_t a1, char a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  int v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[10])
  {
    uint64_t v4 = a2 & 1 ^ 7u;
    id v8 = @"_pd";
    v9[0] = a3;
    id v5 = NSDictionary;
    id v6 = a3;
    unint64_t v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v3 _sendFrameType:v4 unencryptedObject:v7];
  }
}

void *__38__SKConnection__clientPairVerifyStart__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[10]) {
    return (void *)[result _clientPairVerifyCompleted:a2];
  }
  return result;
}

- (void)_clientPairSetupCompleted:(id)a3
{
  id v4 = a3;
  authThrottleTimer = self->_authThrottleTimer;
  if (authThrottleTimer)
  {
    id v6 = authThrottleTimer;
    dispatch_source_cancel(v6);
    unint64_t v7 = self->_authThrottleTimer;
    self->_authThrottleTimer = 0;
  }
  id v8 = v4;
  id v9 = v8;
  if (v8) {
    goto LABEL_5;
  }
  pairSetupSession = self->_pairSetupSession;
  id v19 = 0;
  uint64_t v11 = [(CUPairingSession *)pairSetupSession openStreamWithName:@"main" error:&v19];
  id v9 = v19;
  mainStream = self->_mainStream;
  self->_mainStream = v11;

  if (v9)
  {
LABEL_5:
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v18 = CUPrintNSError();
      LogPrintF();

      [(SKConnection *)self _pairSetupInvalidate];
    }
    else
    {
      [(SKConnection *)self _pairSetupInvalidate];
    }
  }
  else
  {
    self->_mainAuthTagLength = [(CUPairingStream *)self->_mainStream authTagLength];
    int v16 = self->_ucat->var0;
    if (v16 <= 30 && (v16 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    id v9 = 0;
  }
  uint64_t v14 = MEMORY[0x223C632B0](self->_authCompletionHandler);
  uint64_t v15 = (void *)v14;
  if (v14) {
    (*(void (**)(uint64_t, id))(v14 + 16))(v14, v9);
  }

  if (!self->_stepError) {
    objc_storeStrong((id *)&self->_stepError, v9);
  }
  self->_stepDone = 1;
  [(SKConnection *)self _run];
}

- (void)_clientPairSetupPromptWithFlags:(unsigned int)a3 passwordType:(int)a4 throttleSeconds:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v7 = *(void *)&a3;
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    int v10 = CUPrintFlags32();
    LogPrintF();

    if ((v7 & 0x20000) == 0) {
      goto LABEL_14;
    }
  }
  else if ((v7 & 0x20000) == 0)
  {
    goto LABEL_14;
  }
  if ((int)v5 < 1)
  {
LABEL_14:
    uint64_t v20 = (void (**)(void, void, void, void))MEMORY[0x223C632B0](self->_authPromptHandler);
    if (v20)
    {
      id v21 = v20;
      v20[2](v20, v6, v7, 0);
      uint64_t v20 = (void (**)(void, void, void, void))v21;
    }

    return;
  }
  uint64_t v11 = mach_absolute_time();
  uint64_t v12 = SecondsToUpTicks();
  p_authThrottleTimer = &self->_authThrottleTimer;
  authThrottleTimer = self->_authThrottleTimer;
  self->_authThrottleDeadlineTicks = v12 + v11;
  if (authThrottleTimer)
  {
    uint64_t v15 = authThrottleTimer;
    dispatch_source_cancel(v15);
    int v16 = *p_authThrottleTimer;
    *p_authThrottleTimer = 0;
  }
  dispatch_source_t v17 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_dispatchQueue);
  objc_storeStrong((id *)&self->_authThrottleTimer, v17);
  handler[0] = MEMORY[0x263EF8330];
  handler[1] = 3221225472;
  handler[2] = __77__SKConnection__clientPairSetupPromptWithFlags_passwordType_throttleSeconds___block_invoke;
  handler[3] = &unk_264548980;
  handler[4] = v17;
  handler[5] = self;
  int v23 = v6;
  dispatch_source_set_event_handler(v17, handler);
  CUDispatchTimerSet();
  dispatch_activate(v17);
  uint64_t v18 = MEMORY[0x223C632B0](self->_authPromptHandler);
  id v19 = (void *)v18;
  if (v18) {
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 16))(v18, v6, v7, v5);
  }
}

void __77__SKConnection__clientPairSetupPromptWithFlags_passwordType_throttleSeconds___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  if (*(void *)(a1 + 32) == *(void *)(v1 + 24))
  {
    uint64_t v3 = *(void *)(v1 + 16);
    if ((uint64_t)(v3 - mach_absolute_time()) < 1)
    {
      uint64_t v3 = 0;
    }
    else
    {
      UpTicksToSecondsF();
      LODWORD(v3) = llround(v4);
    }
    uint64_t v5 = *(void *)(a1 + 40);
    int v6 = **(_DWORD **)(v5 + 144);
    if (v6 <= 30)
    {
      if (v6 != -1 || (int v7 = _LogCategory_Initialize(), v5 = *(void *)(a1 + 40), v7))
      {
        LogPrintF();
        uint64_t v5 = *(void *)(a1 + 40);
      }
    }
    if ((int)v3 <= 0)
    {
      id v9 = *(void **)(v5 + 24);
      if (v9)
      {
        int v10 = v9;
        dispatch_source_cancel(v10);
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v12 = *(void **)(v11 + 24);
        *(void *)(v11 + 24) = 0;

        uint64_t v8 = 0;
        uint64_t v5 = *(void *)(a1 + 40);
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
    else
    {
      uint64_t v8 = 0x20000;
    }
    uint64_t v13 = (void (**)(void, void, void, void))MEMORY[0x223C632B0](*(void *)(v5 + 200));
    if (v13)
    {
      id v14 = v13;
      v13[2](v13, *(unsigned int *)(a1 + 48), v8, v3);
      uint64_t v13 = (void (**)(void, void, void, void))v14;
    }
  }
}

- (void)_clientPairSetupContinueWithData:(id)a3
{
  id v4 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  id v24 = __Block_byref_object_copy__229;
  unint64_t v25 = __Block_byref_object_dispose__230;
  id v26 = 0;
  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __49__SKConnection__clientPairSetupContinueWithData___block_invoke;
  v20[3] = &unk_2645494E8;
  v20[4] = self;
  v20[5] = &v21;
  uint64_t v5 = (void (**)(void))MEMORY[0x223C632B0](v20);
  int v6 = self->_pairSetupSession;
  if (!v6)
  {
    uint64_t v12 = NSErrorF_safe();
    uint64_t v13 = (void *)v22[5];
    v22[5] = v12;

    goto LABEL_13;
  }
  int v7 = (void *)OPACKDecodeData();
  if (!v7)
  {
    id v14 = (id)NSErrorF_safe();
    goto LABEL_12;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v15 = (objc_class *)objc_opt_class();
    uint64_t v11 = NSStringFromClass(v15);
    uint64_t v16 = NSErrorF_safe();
LABEL_19:
    uint64_t v18 = (void *)v22[5];
    v22[5] = v16;

    goto LABEL_11;
  }
  uint64_t v8 = CUDecodeNSErrorDictionary();
  id v9 = (void *)v22[5];
  v22[5] = v8;

  if (v22[5])
  {
    id v17 = (id)NSErrorNestedF();
    goto LABEL_12;
  }
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    [v4 length];
    id v19 = CUPrintNSObjectOneLineEx();
    LogPrintF();
  }
  CFDataGetTypeID();
  uint64_t v11 = CFDictionaryGetTypedValue();
  if (!v11)
  {
    uint64_t v16 = NSErrorF_safe();
    goto LABEL_19;
  }
  [(CUPairingSession *)v6 receivedData:v11];
LABEL_11:

LABEL_12:
LABEL_13:

  v5[2](v5);
  _Block_object_dispose(&v21, 8);
}

uint64_t __49__SKConnection__clientPairSetupContinueWithData___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(*(void *)(v1 + 8) + 40))
  {
    uint64_t v2 = result;
    uint64_t v3 = *(_DWORD ***)(result + 32);
    int v4 = *v3[18];
    if (v4 <= 90)
    {
      if (v4 != -1 || (int v5 = _LogCategory_Initialize(), v3 = *(_DWORD ***)(v2 + 32), v1 = *(void *)(v2 + 40), v5))
      {
        int v7 = CUPrintNSError();
        LogPrintF();

        uint64_t v3 = *(_DWORD ***)(v2 + 32);
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    uint64_t v6 = *(void *)(*(void *)(v1 + 8) + 40);
    return [v3 _clientPairSetupCompleted:v6];
  }
  return result;
}

- (void)_clientPairSetupStartReverse
{
  v7[1] = *MEMORY[0x263EF8340];
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  [(SKConnection *)self _pairSetupInvalidate];
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  uint64_t v6 = @"_pairReverse";
  v7[0] = MEMORY[0x263EFFA88];
  int v5 = [NSDictionary dictionaryWithObjects:v7 forKeys:&v6 count:1];
  [(SKConnection *)self _sendFrameType:2 unencryptedObject:v5];
}

- (void)_clientPairSetupStart
{
  [(SKConnection *)self _pairSetupInvalidate];
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  id v5 = objc_alloc_init(MEMORY[0x263F385A0]);
  objc_storeStrong((id *)&self->_pairSetupSession, v5);
  [v5 setDispatchQueue:self->_dispatchQueue];
  [v5 setFixedPIN:self->_password];
  if (self->_conditionalPersistent)
  {
    uint64_t v6 = 520;
  }
  else if (self->_persistentPairing)
  {
    uint64_t v6 = 8;
  }
  else
  {
    uint64_t v6 = 24;
  }
  [v5 setFlags:v6];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"SKCnx";
  }
  [v5 setLabel:label];
  [v5 setSessionType:1];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __37__SKConnection__clientPairSetupStart__block_invoke;
  v10[3] = &unk_264548930;
  v10[4] = self;
  v10[5] = v5;
  [v5 setPromptForPINHandler:v10];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  void v9[2] = __37__SKConnection__clientPairSetupStart__block_invoke_2;
  v9[3] = &unk_264548958;
  v9[4] = v5;
  v9[5] = self;
  [v5 setSendDataHandler:v9];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  void v8[2] = __37__SKConnection__clientPairSetupStart__block_invoke_3;
  v8[3] = &unk_2645496B0;
  v8[4] = v5;
  v8[5] = self;
  [v5 setCompletionHandler:v8];
  [v5 activate];
}

uint64_t __37__SKConnection__clientPairSetupStart__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = [*(id *)(a1 + 40) pinTypeActual];

  return [v5 _clientPairSetupPromptWithFlags:a2 passwordType:v6 throttleSeconds:a3];
}

void __37__SKConnection__clientPairSetupStart__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  v9[1] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v3[9])
  {
    uint64_t v4 = a2 & 1 ^ 3u;
    uint64_t v8 = @"_pd";
    v9[0] = a3;
    id v5 = NSDictionary;
    id v6 = a3;
    int v7 = [v5 dictionaryWithObjects:v9 forKeys:&v8 count:1];
    [v3 _sendFrameType:v4 unencryptedObject:v7];
  }
}

void *__37__SKConnection__clientPairSetupStart__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t result = *(void **)(a1 + 40);
  if (v3 == result[9]) {
    return (void *)[result _clientPairSetupCompleted:a2];
  }
  return result;
}

- (void)_clientConnectCompleted:(id)a3
{
  id v4 = a3;
  int var0 = self->_ucat->var0;
  id v9 = v4;
  if (v4)
  {
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize()))
    {
      uint64_t v8 = CUPrintNSError();
      LogPrintF();
    }
    if (!self->_stepError)
    {
      NSErrorNestedF();
      id v6 = (NSError *)objc_claimAutoreleasedReturnValue();
      stepError = self->_stepError;
      self->_stepError = v6;
    }
  }
  else
  {
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (!self->_readRequested) {
      [(SKConnection *)self _receiveStart:0];
    }
    self->_stepDone = 1;
  }
  [(SKConnection *)self _run];
}

- (void)_clientConnectStartBLE
{
  self->_stepDone = 0;
  stepError = self->_stepError;
  self->_stepError = 0;

  [(CBConnection *)self->_bleConnection invalidate];
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    blePeerDevice = self->_blePeerDevice;
    LogPrintF();
  }
  id v5 = objc_alloc_init(MEMORY[0x263EFEF10]);
  objc_storeStrong((id *)&self->_bleConnection, v5);
  unsigned int v6 = [(SKDevice *)self->_blePeerDevice blePSM];
  if (v6) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 130;
  }
  objc_msgSend(v5, "setBlePSM:", v7, blePeerDevice);
  [v5 setConnectionFlags:64];
  [v5 setConnectTimeoutSeconds:10.0];
  [v5 setDispatchQueue:self->_dispatchQueue];
  if (self->_label) {
    label = (__CFString *)self->_label;
  }
  else {
    label = @"SKCnx";
  }
  [v5 setLabel:label];
  [v5 setUseCase:self->_bluetoothUseCase];
  id v9 = [(SKDevice *)self->_blePeerDevice identifier];
  if (v9)
  {
    id v10 = objc_alloc_init(MEMORY[0x263EFEF20]);
    [v10 setIdentifier:v9];
    [v5 setPeerDevice:v10];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __38__SKConnection__clientConnectStartBLE__block_invoke;
    v16[3] = &unk_2645496B0;
    v16[4] = v5;
    v16[5] = self;
    [v5 setErrorHandler:v16];
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __38__SKConnection__clientConnectStartBLE__block_invoke_2;
    v15[3] = &unk_2645494C0;
    v15[4] = v5;
    v15[5] = self;
    [v5 setInvalidationHandler:v15];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __38__SKConnection__clientConnectStartBLE__block_invoke_3;
    v14[3] = &unk_2645496B0;
    v14[4] = v5;
    v14[5] = self;
    [v5 activateWithCompletion:v14];
  }
  else
  {
    NSErrorF_safe();
    uint64_t v11 = (NSError *)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = self->_stepError;
    self->_stepError = v11;
  }
}

void __38__SKConnection__clientConnectStartBLE__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 40);
  if (*(void *)(a1 + 32) == v1[29])
  {
    NSErrorNestedF();
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    [v1 _clientError:v2];
  }
}

uint64_t __38__SKConnection__clientConnectStartBLE__block_invoke_2(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 40);
  if (*(void *)(result + 32) == *(void *)(v1 + 232))
  {
    uint64_t v2 = result;
    int v3 = **(_DWORD **)(v1 + 144);
    if (v3 <= 30)
    {
      if (v3 != -1 || (int v4 = _LogCategory_Initialize(), v1 = *(void *)(v2 + 40), v4))
      {
        LogPrintF();
        uint64_t v1 = *(void *)(v2 + 40);
      }
    }
    id v5 = *(void **)(v1 + 232);
    *(void *)(v1 + 232) = 0;

    uint64_t v6 = *(void *)(v2 + 40);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = 0;

    uint64_t result = *(void *)(v2 + 40);
    if (*(unsigned char *)(result + 52))
    {
      return [(id)result _invalidated];
    }
  }
  return result;
}

void __38__SKConnection__clientConnectStartBLE__block_invoke_3(uint64_t a1, void *a2)
{
  int v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  if (v3 == *(void **)(v4 + 232))
  {
    objc_storeStrong((id *)(v4 + 40), v3);
    id v6 = a2;
    [*(id *)(a1 + 40) _clientConnectCompleted:v6];
  }
}

- (void)_clientConnectStart
{
  if (self->_blePeerDevice)
  {
    [(SKConnection *)self _clientConnectStartBLE];
  }
  else if (self->_sendDataHandler)
  {
    self->_stepDone = 1;
  }
  else
  {
    NSErrorF_safe();
    int v3 = (NSError *)objc_claimAutoreleasedReturnValue();
    stepError = self->_stepError;
    self->_stepError = v3;
    MEMORY[0x270F9A758](v3, stepError);
  }
}

- (void)_clientRun
{
  if (!self->_invalidateCalled)
  {
    while (1)
    {
      unint64_t runState = self->_runState;
      switch((int)runState)
      {
        case 0:
          self->_unint64_t runState = 11;
          goto LABEL_32;
        case 11:
          self->_unint64_t runState = 12;
          [(SKConnection *)self _clientConnectStart];
          goto LABEL_32;
        case 12:
          if (self->_stepError) {
            goto LABEL_24;
          }
          if (self->_stepDone)
          {
            if (![(NSData *)self->_pskData length]) {
              goto LABEL_20;
            }
            int v4 = 19;
            goto LABEL_31;
          }
          goto LABEL_32;
        case 13:
          self->_unint64_t runState = 14;
          [(SKConnection *)self _clientPairVerifyStart];
          goto LABEL_32;
        case 14:
          if (!self->_stepError) {
            goto LABEL_15;
          }
          int v4 = 15;
          goto LABEL_31;
        case 15:
          if (self->_reversePairing)
          {
            int v4 = 17;
LABEL_31:
            self->_unint64_t runState = v4;
          }
          else
          {
            self->_unint64_t runState = 16;
            [(SKConnection *)self _clientPairSetupStart];
          }
LABEL_32:
          unint64_t v6 = self->_runState;
          if (v6 == runState) {
            return;
          }
          int var0 = self->_ucat->var0;
          if (var0 > 30) {
            goto LABEL_41;
          }
          if (var0 != -1) {
            goto LABEL_35;
          }
          if (_LogCategory_Initialize())
          {
            unint64_t v6 = self->_runState;
LABEL_35:
            uint64_t v8 = "?";
            if (runState <= 0x1D) {
              uint64_t v8 = off_264548A90[runState];
            }
            id v9 = "?";
            if (v6 <= 0x1D) {
              id v9 = off_264548A90[v6];
            }
            id v10 = v8;
            uint64_t v11 = v9;
            LogPrintF();
          }
LABEL_41:
          [(SKConnection *)self _updateExternalState];
          break;
        case 16:
        case 18:
          if (self->_stepError) {
            goto LABEL_24;
          }
LABEL_15:
          if (self->_stepDone) {
LABEL_22:
          }
            self->_unint64_t runState = 20;
          goto LABEL_32;
        case 17:
          [(SKConnection *)self _clientPairSetupStartReverse];
LABEL_20:
          int v4 = self->_runState + 1;
          goto LABEL_31;
        case 19:
          [(SKConnection *)self _pskPrepareClientMode:1];
          if (!self->_stepError) {
            goto LABEL_22;
          }
          goto LABEL_24;
        case 20:
          if (self->_stepError) {
LABEL_24:
          }
            self->_unint64_t runState = 21;
          else {
            [(SKConnection *)self _processSends];
          }
          goto LABEL_32;
        case 21:
          if (self->_stepError)
          {
            -[SKConnection _clientError:](self, "_clientError:");
          }
          else
          {
            id v5 = NSErrorF_safe();
            [(SKConnection *)self _clientError:v5];
          }
          int v4 = 3;
          goto LABEL_31;
        default:
          goto LABEL_32;
      }
    }
  }
}

- (void)_updateExternalState
{
  int state = self->_state;
  unsigned int v3 = (self->_runState - 20) & 0xFFFFFFF7;
  int v4 = v3 == 0;
  if (state != v4)
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    self->_int state = v4;
    uint64_t v7 = (void (**)(void, void))MEMORY[0x223C632B0](self->_stateChangedHandler);
    if (v7)
    {
      id v9 = v7;
      v7[2](v7, v8);
      uint64_t v7 = (void (**)(void, void))v9;
    }
  }
}

- (void)updatePasswordType:(int)a3
{
  dispatchQueue = self->_dispatchQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __35__SKConnection_updatePasswordType___block_invoke;
  v4[3] = &unk_264548E18;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(dispatchQueue, v4);
}

void __35__SKConnection_updatePasswordType___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x263EF8340];
  uint64_t v1 = *(unsigned char **)(a1 + 32);
  if (!v1[52])
  {
    int v4 = @"_pt";
    uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
    v5[0] = v2;
    unsigned int v3 = [NSDictionary dictionaryWithObjects:v5 forKeys:&v4 count:1];
    [v1 _sendFrameType:8 unencryptedObject:v3];
  }
}

- (void)tryPassword:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __28__SKConnection_tryPassword___block_invoke;
  v7[3] = &unk_2645494C0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

int *__28__SKConnection_tryPassword___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 156) || *(unsigned char *)(v2 + 159))
  {
    id v3 = *(id *)(v2 + 72);
    id v4 = v3;
    id v7 = v3;
    if (v3)
    {
      int v5 = (int *)[v3 tryPIN:*(void *)(a1 + 40)];
    }
    else
    {
      int v5 = *(int **)(*(void *)(a1 + 32) + 144);
      if (*v5 > 90 || *v5 == -1 && (v5 = (int *)_LogCategory_Initialize(), id v4 = 0, !v5))
      {
LABEL_6:
        return (int *)MEMORY[0x270F9A758](v5, v4);
      }
      int v5 = (int *)LogPrintF();
    }
    id v4 = v7;
    goto LABEL_6;
  }
  uint64_t result = *(int **)(v2 + 144);
  if (*result <= 90)
  {
    if (*result != -1 || (uint64_t result = (int *)_LogCategory_Initialize(), result))
    {
      return (int *)LogPrintF();
    }
  }
  return result;
}

- (void)_run
{
  if (self->_clientMode) {
    [(SKConnection *)self _clientRun];
  }
  else {
    [(SKConnection *)self _serverRun];
  }
}

- (void)_pskPrepareClientMode:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = objc_alloc_init(MEMORY[0x263F385A8]);
  id v6 = self->_pskData;
  id v12 = 0;
  char v7 = [v5 prepareWithName:@"main" isClient:v3 pskData:v6 error:&v12];
  id v8 = v12;
  if (v7)
  {
    objc_storeStrong((id *)&self->_mainStream, v5);
    self->_mainAuthTagLength = [v5 authTagLength];
  }
  else
  {
    int var0 = self->_ucat->var0;
    if (var0 <= 90 && (var0 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    NSErrorNestedF();
    id v10 = (NSError *)objc_claimAutoreleasedReturnValue();
    stepError = self->_stepError;
    self->_stepError = v10;
  }
}

- (void)_pairVerifyInvalidate
{
  [(CUPairingSession *)self->_pairVerifySession setCompletionHandler:0];
  [(CUPairingSession *)self->_pairVerifySession setSendDataHandler:0];
  [(CUPairingSession *)self->_pairVerifySession invalidate];
  pairVerifySession = self->_pairVerifySession;
  self->_pairVerifySession = 0;
}

- (void)_pairSetupInvalidate
{
  authThrottleTimer = self->_authThrottleTimer;
  if (authThrottleTimer)
  {
    id v4 = authThrottleTimer;
    dispatch_source_cancel(v4);
    id v5 = self->_authThrottleTimer;
    self->_authThrottleTimer = 0;
  }
  [(CUPairingSession *)self->_pairSetupSession setCompletionHandler:0];
  [(CUPairingSession *)self->_pairSetupSession setSendDataHandler:0];
  [(CUPairingSession *)self->_pairSetupSession invalidate];
  pairSetupSession = self->_pairSetupSession;
  self->_pairSetupSession = 0;
}

- (id)deriveKeyWithSaltPtr:(const void *)a3 saltLen:(unint64_t)a4 infoPtr:(const void *)a5 infoLen:(unint64_t)a6 keyLen:(unint64_t)a7 error:(id *)a8
{
  pairSetupSession = self->_pairSetupSession;
  if (pairSetupSession)
  {
    uint64_t v15 = pairSetupSession;
LABEL_4:
    id v16 = (id) [objc_alloc(MEMORY[0x263EFF990]) initWithLength:a7];
    if (-[CUPairingSession deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:](v15, "deriveKeyWithSaltPtr:saltLen:infoPtr:infoLen:keyLen:outputKeyPtr:", a3, a4, a5, a6, a7, [v16 mutableBytes]))
    {
      if (a8)
      {
        NSErrorF_safe();
        id v17 = 0;
        *a8 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v17 = 0;
      }
    }
    else
    {
      id v17 = v16;
    }

    goto LABEL_7;
  }
  uint64_t v15 = self->_pairVerifySession;
  if (v15) {
    goto LABEL_4;
  }
  if (a8)
  {
    NSErrorF_safe();
    id v17 = 0;
    *a8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v17 = 0;
  }
LABEL_7:

  return v17;
}

- (void)_invalidated
{
  if (!self->_invalidateDone && !self->_bleConnection)
  {
    [(SKConnection *)self _pairSetupInvalidate];
    [(SKConnection *)self _pairVerifyInvalidate];
    startTimer = self->_startTimer;
    if (startTimer)
    {
      id v4 = startTimer;
      dispatch_source_cancel(v4);
      id v5 = self->_startTimer;
      self->_startTimer = 0;
    }
    uint64_t v19 = MEMORY[0x223C632B0](self->_invalidationHandler);
    id authCompletionHandler = self->_authCompletionHandler;
    self->_id authCompletionHandler = 0;

    id authShowPasswordHandler = self->_authShowPasswordHandler;
    self->_id authShowPasswordHandler = 0;

    id authHidePasswordHandler = self->_authHidePasswordHandler;
    self->_id authHidePasswordHandler = 0;

    id authPromptHandler = self->_authPromptHandler;
    self->_id authPromptHandler = 0;

    id errorHandler = self->_errorHandler;
    self->_id errorHandler = 0;

    id invalidationHandler = self->_invalidationHandler;
    self->_id invalidationHandler = 0;

    id pairSetupConfigHandler = self->_pairSetupConfigHandler;
    self->_id pairSetupConfigHandler = 0;

    id receivedEventHandler = self->_receivedEventHandler;
    self->_id receivedEventHandler = 0;

    id receivedRequestHandler = self->_receivedRequestHandler;
    self->_id receivedRequestHandler = 0;

    id sendDataHandler = self->_sendDataHandler;
    self->_id sendDataHandler = 0;

    id stateChangedHandler = self->_stateChangedHandler;
    self->_id stateChangedHandler = 0;

    uint64_t v17 = v19;
    self->_invalidateDone = 1;
    if (v19)
    {
      (*(void (**)(uint64_t))(v19 + 16))(v19);
      uint64_t v17 = v19;
    }
    p_int var0 = &self->_ucat->var0;
    if (*p_var0 <= 30)
    {
      if (*p_var0 != -1 || (p_var0 = (int *)_LogCategory_Initialize(), uint64_t v17 = v19, p_var0))
      {
        p_int var0 = (int *)LogPrintF();
        uint64_t v17 = v19;
      }
    }
    MEMORY[0x270F9A758](p_var0, v17);
  }
}

- (void)_invalidateCore:(id)a3
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v4 = (NSError *)a3;
  startTimer = self->_startTimer;
  if (startTimer)
  {
    id v6 = startTimer;
    dispatch_source_cancel(v6);
    char v7 = self->_startTimer;
    self->_startTimer = 0;
  }
  [(CBConnection *)self->_bleConnection invalidate];
  if (self->_showPasswordCalled)
  {
    self->_showPasswordCalled = 0;
    uint64_t v8 = MEMORY[0x223C632B0](self->_authHidePasswordHandler);
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
  }
  stepError = v4;
  uint64_t v27 = v4;
  if (v4 || (stepError = self->_stepError) != 0)
  {
    uint64_t v11 = stepError;
  }
  else
  {
    NSErrorF_safe();
    uint64_t v11 = (NSError *)objc_claimAutoreleasedReturnValue();
  }
  id v12 = v11;
  [(SKConnection *)self _abortRequestsWithError:v11];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id obj = self->_sendArray;
  uint64_t v13 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v31;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v31 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v30 + 1) + 8 * v16);
        int var0 = self->_ucat->var0;
        if (var0 <= 60 && (var0 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v19 = [v17 requestID];
          uint64_t v20 = (uint64_t)v19;
          if (!v19)
          {
            uint64_t v20 = [v17 eventID];
            uint64_t v28 = (void *)v20;
          }
          CUPrintNSError();
          id v26 = v25 = v20;
          LogPrintF();

          if (!v19) {
        }
          }
        uint64_t v21 = objc_msgSend(v17, "timer", v25, v26);
        [v17 setTimer:0];
        if (v21) {
          dispatch_source_cancel(v21);
        }
        uint64_t v22 = [v17 completion];
        [v17 setCompletion:0];
        if (v22)
        {
          ((void (**)(void, NSError *))v22)[2](v22, v12);
        }
        else
        {
          uint64_t v23 = [v17 responseHandler];
          [v17 setResponseHandler:0];
          if (v23) {
            ((void (**)(void, void, void, NSError *))v23)[2](v23, 0, 0, v12);
          }
        }
        ++v16;
      }
      while (v14 != v16);
      uint64_t v24 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v34 count:16];
      uint64_t v14 = v24;
    }
    while (v24);
  }

  [(NSMutableArray *)self->_sendArray removeAllObjects];
}

- (void)_invalidateWithError:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    int var0 = self->_ucat->var0;
    id v8 = v4;
    if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
    {
      char v7 = CUPrintNSError();
      LogPrintF();
    }
    -[SKConnection _invalidateCore:](self, "_invalidateCore:", v8, v7);
    id v4 = (id)[(SKConnection *)self _invalidated];
    id v5 = v8;
  }

  MEMORY[0x270F9A758](v4, v5);
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __26__SKConnection_invalidate__block_invoke;
  block[3] = &unk_264549660;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __26__SKConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateWithError:0];
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = __Block_byref_object_copy__229;
  uint64_t v23 = __Block_byref_object_dispose__230;
  id v24 = 0;
  uint64_t v12 = MEMORY[0x263EF8330];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __40__SKConnection__activateWithCompletion___block_invoke;
  uint64_t v15 = &unk_264549378;
  uint64_t v18 = &v19;
  uint64_t v16 = self;
  id v5 = v4;
  id v17 = v5;
  id v6 = (void (**)(void))MEMORY[0x223C632B0](&v12);
  if (self->_activateCalled || self->_invalidateCalled) {
    goto LABEL_14;
  }
  if (self->_blePeerDevice)
  {
    self->_clientMode = 1;
    goto LABEL_8;
  }
  bleConnection = self->_bleConnection;
  if (bleConnection)
  {
    self->_clientMode = 0;
    objc_storeStrong((id *)&self->_requestable, bleConnection);
    goto LABEL_8;
  }
  if (!self->_sendDataHandler)
  {
LABEL_14:
    uint64_t v9 = NSErrorF_safe();
    id v10 = (void *)v20[5];
    v20[5] = v9;

    goto LABEL_13;
  }
LABEL_8:
  int var0 = self->_ucat->var0;
  if (var0 <= 30 && (var0 != -1 || _LogCategory_Initialize()))
  {
    uint64_t v11 = self;
    LogPrintF();
  }
  self->_activateCalled = 1;
  [(SKConnection *)self _run];
  (*((void (**)(id, void))v5 + 2))(v5, 0);
LABEL_13:
  v6[2](v6);

  _Block_object_dispose(&v19, 8);
}

uint64_t __40__SKConnection__activateWithCompletion___block_invoke(void *a1)
{
  uint64_t result = *(void *)(*(void *)(a1[6] + 8) + 40);
  if (result)
  {
    int v3 = **(_DWORD **)(a1[4] + 144);
    if (v3 <= 90 && (v3 != -1 || _LogCategory_Initialize()))
    {
      id v5 = CUPrintNSError();
      LogPrintF();
    }
    id v4 = *(uint64_t (**)(void))(a1[5] + 16);
    return v4();
  }
  return result;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  void v7[2] = __39__SKConnection_activateWithCompletion___block_invoke;
  v7[3] = &unk_264549148;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(dispatchQueue, v7);
}

uint64_t __39__SKConnection_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
  id v4 = a3;
  [v4 UTF8String];

  LogCategoryReplaceF();
}

- (NSString)description
{
  int v18 = 12;
  int v3 = self->_label;
  uint64_t v17 = 0;
  CUAppendF();
  id v16 = 0;
  CUAppendF();
  id v4 = v16;

  v15[3] = v4;
  CUAppendF();
  id v5 = v4;

  v15[2] = v5;
  CUAppendF();
  id v6 = v5;

  v15[1] = v6;
  CUAppendF();
  char v7 = (__CFString *)v6;

  if (self->_bleConnection)
  {
    v15[0] = v7;
    id v8 = (id *)v15;
  }
  else if (self->_blePeerDevice)
  {
    uint64_t v14 = v7;
    id v8 = (id *)&v14;
  }
  else
  {
    if (!self->_sendDataHandler) {
      goto LABEL_8;
    }
    uint64_t v13 = v7;
    id v8 = (id *)&v13;
  }
  CUAppendF();
  uint64_t v9 = (__CFString *)*v8;

  char v7 = v9;
LABEL_8:
  if (v7) {
    id v10 = v7;
  }
  else {
    id v10 = &stru_26D1CA560;
  }
  uint64_t v11 = v10;

  return (NSString *)v11;
}

- (void)dealloc
{
  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove();
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)SKConnection;
  [(SKConnection *)&v4 dealloc];
}

- (SKConnection)init
{
  v8.receiver = self;
  v8.super_class = (Class)SKConnection;
  uint64_t v2 = [(SKConnection *)&v8 init];
  int v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x263EF83A0]);
    objc_super v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    sendArray = v3->_sendArray;
    v3->_sendArray = v4;

    v3->_ucat = (LogCategory *)&gLogCategory_SKConnection;
    RandomBytes();
    id v6 = v3;
  }

  return v3;
}

@end