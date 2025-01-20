@interface RPHIDGCSession
- (RPHIDGCSession)initWithOptions:(id)a3;
- (RPMessageable)messenger;
- (void)_activateWithCompletion:(id)a3;
- (void)_invalidate;
- (void)activateWithCompletion:(id)a3;
- (void)invalidate;
- (void)sendGCEvent:(RPHIDGCEvent *)a3 destinationID:(id)a4 completion:(id)a5;
- (void)setMessenger:(id)a3;
@end

@implementation RPHIDGCSession

- (RPHIDGCSession)initWithOptions:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)RPHIDGCSession;
  v6 = [(RPHIDGCSession *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_dispatchQueue, MEMORY[0x1E4F14428]);
    objc_storeStrong((id *)&v7->_options, a3);
    v8 = v7;
  }

  return v7;
}

- (void)_activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = self->_messenger;
  if (v5)
  {
    options = self->_options;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __42__RPHIDGCSession__activateWithCompletion___block_invoke;
    v8[3] = &unk_1E605BF98;
    id v9 = v4;
    [(RPMessageable *)v5 sendRequestID:@"_gcStart" request:options destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:v8];
  }
  else
  {
    v7 = RPErrorF();
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (v4) {
      (*((void (**)(id, void *))v4 + 2))(v4, v7);
    }
  }
}

void __42__RPHIDGCSession__activateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v10 = a2;
  id v7 = a3;
  id v8 = a4;
  if (v8)
  {
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
LABEL_13:
    }
      (*(void (**)(uint64_t))(v9 + 16))(v9);
  }
  else
  {
    if (gLogCategory_RPHIDGCSession <= 30
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    uint64_t v9 = *(void *)(a1 + 32);
    if (v9) {
      goto LABEL_13;
    }
  }
}

- (void)activateWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(RPMessageable *)self->_messenger dispatchQueue];
  dispatchQueue = v5;
  if (!v5) {
    dispatchQueue = self->_dispatchQueue;
  }
  objc_storeStrong((id *)&self->_dispatchQueue, dispatchQueue);

  id v7 = self->_dispatchQueue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__RPHIDGCSession_activateWithCompletion___block_invoke;
  v9[3] = &unk_1E605B650;
  v9[4] = self;
  id v10 = v4;
  id v8 = v4;
  dispatch_async(v7, v9);
}

uint64_t __41__RPHIDGCSession_activateWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _activateWithCompletion:*(void *)(a1 + 40)];
}

- (void)_invalidate
{
  if (gLogCategory_RPHIDGCSession <= 30
    && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  [(RPMessageable *)self->_messenger sendRequestID:@"_gcStop" request:MEMORY[0x1E4F1CC08] destinationID:@"rapport:rdid:DirectPeer" options:0 responseHandler:&__block_literal_global_6];
  messenger = self->_messenger;
  self->_messenger = 0;
}

void __29__RPHIDGCSession__invalidate__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v8 = a2;
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (gLogCategory_RPHIDGCSession <= 90
      && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
    {
LABEL_7:
      LogPrintF();
    }
  }
  else if (gLogCategory_RPHIDGCSession <= 30 {
         && (gLogCategory_RPHIDGCSession != -1 || _LogCategory_Initialize()))
  }
  {
    goto LABEL_7;
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__RPHIDGCSession_invalidate__block_invoke;
  block[3] = &unk_1E605B540;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __28__RPHIDGCSession_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)sendGCEvent:(RPHIDGCEvent *)a3 destinationID:(id)a4 completion:(id)a5
{
  v51[21] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = (void (**)(id, void *))a5;
  if (a3)
  {
    uint64_t v11 = a3->var17 | (a3->var16 << 8);
    uint64_t v12 = a3->var19 | (a3->var18 << 8);
    unsigned int v42 = a3->var21 | (a3->var20 << 8);
    v50[0] = @"_gcDU";
    *(float *)&double v10 = a3->var0;
    v48 = [NSNumber numberWithFloat:v10];
    v51[0] = v48;
    v50[1] = @"_gcDD";
    *(float *)&double v13 = a3->var1;
    v47 = [NSNumber numberWithFloat:v13];
    v51[1] = v47;
    v50[2] = @"_gcDL";
    *(float *)&double v14 = a3->var2;
    v46 = [NSNumber numberWithFloat:v14];
    v51[2] = v46;
    v50[3] = @"_gcDR";
    *(float *)&double v15 = a3->var3;
    v45 = [NSNumber numberWithFloat:v15];
    v51[3] = v45;
    v50[4] = @"_gcLThx";
    v44 = [NSNumber numberWithDouble:a3->var4.x];
    v51[4] = v44;
    v50[5] = @"_gcLThy";
    v43 = [NSNumber numberWithDouble:a3->var4.y];
    v51[5] = v43;
    v50[6] = @"_gcRThx";
    v41 = [NSNumber numberWithDouble:a3->var5.x];
    v51[6] = v41;
    v50[7] = @"_gcRThy";
    v40 = [NSNumber numberWithDouble:a3->var5.y];
    v51[7] = v40;
    v50[8] = @"_gcBtA";
    *(float *)&double v16 = a3->var6;
    v39 = [NSNumber numberWithFloat:v16];
    v51[8] = v39;
    v50[9] = @"_gcBtB";
    *(float *)&double v17 = a3->var7;
    v38 = [NSNumber numberWithFloat:v17];
    v51[9] = v38;
    v50[10] = @"_gcBtX";
    *(float *)&double v18 = a3->var8;
    v37 = [NSNumber numberWithFloat:v18];
    v51[10] = v37;
    v50[11] = @"_gcBtY";
    *(float *)&double v19 = a3->var9;
    v36 = [NSNumber numberWithFloat:v19];
    v51[11] = v36;
    v50[12] = @"_gcL1";
    *(float *)&double v20 = a3->var13;
    v35 = [NSNumber numberWithFloat:v20];
    v51[12] = v35;
    v50[13] = @"_gcL2";
    *(float *)&double v21 = a3->var10;
    v22 = [NSNumber numberWithFloat:v21];
    v51[13] = v22;
    v50[14] = @"_gcR1";
    *(float *)&double v23 = a3->var14;
    v24 = [NSNumber numberWithFloat:v23];
    v51[14] = v24;
    v50[15] = @"_gcR2";
    *(float *)&double v25 = a3->var11;
    [NSNumber numberWithFloat:v25];
    v26 = v49 = v9;
    v51[15] = v26;
    v50[16] = @"_gcLThB";
    v27 = [NSNumber numberWithInt:a3->var12];
    v51[16] = v27;
    v50[17] = @"_gcRThB";
    [NSNumber numberWithInt:a3->var15];
    v28 = v34 = self;
    v51[17] = v28;
    v50[18] = @"_gcBtHome";
    v29 = [NSNumber numberWithInt:v11];
    v51[18] = v29;
    v50[19] = @"_gcBtMenu";
    v30 = [NSNumber numberWithInt:v12];
    v51[19] = v30;
    v50[20] = @"_gcBtOptions";
    v31 = [NSNumber numberWithInt:v42];
    v51[20] = v31;
    v32 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v51 forKeys:v50 count:21];

    uint64_t v9 = v49;
    [(RPMessageable *)v34->_messenger sendEventID:@"_hidGC" event:v32 destinationID:v8 options:0 completion:v49];
  }
  else
  {
    v33 = [MEMORY[0x1E4F28C58] errorWithDomain:@"RPHIDGCSessionErrorDomain" code:0 userInfo:0];
    if (v9) {
      v9[2](v9, v33);
    }
  }
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
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end