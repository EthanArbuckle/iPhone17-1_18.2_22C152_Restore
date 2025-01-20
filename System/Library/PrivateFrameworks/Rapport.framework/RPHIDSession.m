@interface RPHIDSession
- (RPHIDSession)init;
- (RPMessageable)messenger;
- (void)activateWithCompletion:(id)a3;
- (void)hidCommand:(int)a3 buttonState:(int)a4 destinationID:(id)a5 completion:(id)a6;
- (void)hidCommand:(int)a3 destinationID:(id)a4 completion:(id)a5;
- (void)invalidate;
- (void)setMessenger:(id)a3;
@end

@implementation RPHIDSession

- (RPHIDSession)init
{
  v6.receiver = self;
  v6.super_class = (Class)RPHIDSession;
  v2 = [(RPHIDSession *)&v6 init];
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E4F14428]);
    v4 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__RPHIDSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E605B650;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

void __39__RPHIDSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(*(void *)(a1 + 32) + 16))
  {
    if (gLogCategory_RPHIDSession <= 30 && (gLogCategory_RPHIDSession != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v3 = *(void *)(a1 + 40);
    if (v3)
    {
      id v4 = *(void (**)(void))(v3 + 16);
      v4();
    }
  }
  else
  {
    v2 = RPErrorF();
    v7 = v2;
    if (gLogCategory_RPHIDSession <= 90)
    {
      if (gLogCategory_RPHIDSession != -1 || (int v5 = _LogCategory_Initialize(), v2 = v7, v5))
      {
        LogPrintF();
        v2 = v7;
      }
    }
    uint64_t v6 = *(void *)(a1 + 40);
    if (v6)
    {
      (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);
      v2 = v7;
    }
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__RPHIDSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

void __26__RPHIDSession_invalidate__block_invoke(uint64_t a1)
{
  if (gLogCategory_RPHIDSession <= 30 && (gLogCategory_RPHIDSession != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;
}

- (void)hidCommand:(int)a3 destinationID:(id)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  v18[1] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  messenger = self->_messenger;
  v17 = @"_hidC";
  id v10 = NSNumber;
  id v11 = a4;
  v12 = [v10 numberWithInt:v6];
  v18[0] = v12;
  v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:&v17 count:1];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__RPHIDSession_hidCommand_destinationID_completion___block_invoke;
  v15[3] = &unk_1E605BF98;
  id v16 = v8;
  id v14 = v8;
  [(RPMessageable *)messenger sendRequestID:@"_hidC" request:v13 destinationID:v11 options:0 responseHandler:v15];
}

uint64_t __52__RPHIDSession_hidCommand_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (void)hidCommand:(int)a3 buttonState:(int)a4 destinationID:(id)a5 completion:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  uint64_t v8 = *(void *)&a3;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v10 = a6;
  messenger = self->_messenger;
  v20[0] = @"_hBtS";
  v12 = NSNumber;
  id v13 = a5;
  id v14 = [v12 numberWithInt:v7];
  v20[1] = @"_hidC";
  v21[0] = v14;
  v15 = [NSNumber numberWithInt:v8];
  v21[1] = v15;
  id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:v20 count:2];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  void v18[2] = __64__RPHIDSession_hidCommand_buttonState_destinationID_completion___block_invoke;
  v18[3] = &unk_1E605BF98;
  id v19 = v10;
  id v17 = v10;
  [(RPMessageable *)messenger sendRequestID:@"_hidC" request:v16 destinationID:v13 options:0 responseHandler:v18];
}

uint64_t __64__RPHIDSession_hidCommand_buttonState_destinationID_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a4);
  }
  return result;
}

- (RPMessageable)messenger
{
  return self->_messenger;
}

- (void)setMessenger:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messenger, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end