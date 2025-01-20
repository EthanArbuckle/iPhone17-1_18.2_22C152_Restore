@interface PKSTSTapToProvisionReader
- (BOOL)cancelProvisionAndReturnError:(id *)a3;
- (PKSTSTapToProvisionDelegate)delegate;
- (PKSTSTapToProvisionReader)init;
- (PKSTSTapToProvisionReader)initWithReplyQueue:(id)a3;
- (void)onUpdateWithEvent:(int64_t)a3;
- (void)provisionCardWithParameters:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)tapToProvisionAvailableWithTimeout:(double)a3 completion:(id)a4;
@end

@implementation PKSTSTapToProvisionReader

- (PKSTSTapToProvisionReader)init
{
  return 0;
}

- (PKSTSTapToProvisionReader)initWithReplyQueue:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PKSTSTapToProvisionReader;
  v6 = [(PKSTSTapToProvisionReader *)&v13 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.taptoprovision.reader.queue", 0);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v7;

    objc_storeStrong((id *)&v6->_replyQueue, a3);
    v9 = v6->_workQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__PKSTSTapToProvisionReader_initWithReplyQueue___block_invoke;
    block[3] = &unk_1E56D8AE0;
    v12 = v6;
    dispatch_async(v9, block);
  }
  return v6;
}

uint64_t __48__PKSTSTapToProvisionReader_initWithReplyQueue___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)getSTSTapToProvisionReaderClass[0]());
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 8);
  *(void *)(v3 + 8) = v2;

  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  return objc_msgSend(v5, "setDelegate:");
}

- (void)provisionCardWithParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke;
  block[3] = &unk_1E56D89F0;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(workQueue, block);
}

void __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    uint64_t v3 = [*(id *)(a1 + 40) stsParameters];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_67;
    v8[3] = &unk_1E56ECB58;
    v8[4] = *(void *)(a1 + 32);
    id v9 = *(id *)(a1 + 48);
    [v2 provisionCardWithParameters:v3 completion:v8];
  }
  else
  {
    v4 = PKLogFacilityTypeGetObject(0x27uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = [*(id *)(a1 + 40) sid];
      *(_DWORD *)buf = 138412290;
      v11 = v5;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "[%@] PKSTSTapToProvisionReader: Failed to get reader instance", buf, 0xCu);
    }
    uint64_t v6 = *(void *)(a1 + 48);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"PKPaymentErrorDomain" code:0 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v6 + 16))(v6, 0, v7);
  }
}

void __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_67(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_2;
  block[3] = &unk_1E56D89F0;
  id v11 = v5;
  id v12 = v6;
  id v13 = *(id *)(a1 + 40);
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, block);
}

void __68__PKSTSTapToProvisionReader_provisionCardWithParameters_completion___block_invoke_2(void *a1)
{
  uint64_t v1 = a1[6];
  if (a1[4]) {
    BOOL v2 = a1[5] == 0;
  }
  else {
    BOOL v2 = 0;
  }
  if (v2)
  {
    id v5 = [[PKSTSTapToProvisionResult alloc] initWithSTSResult:a1[4]];
    (*(void (**)(uint64_t, PKSTSTapToProvisionResult *, void))(v1 + 16))(v1, v5, 0);
  }
  else
  {
    uint64_t v3 = *(void (**)(uint64_t, void))(v1 + 16);
    uint64_t v4 = a1[6];
    v3(v4, 0);
  }
}

- (BOOL)cancelProvisionAndReturnError:(id *)a3
{
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__45;
  id v12 = __Block_byref_object_dispose__45;
  id v13 = 0;
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__PKSTSTapToProvisionReader_cancelProvisionAndReturnError___block_invoke;
  block[3] = &unk_1E56E7C90;
  void block[4] = self;
  void block[5] = &v14;
  block[6] = &v8;
  dispatch_sync(workQueue, block);
  if (a3) {
    *a3 = (id) v9[5];
  }
  char v5 = *((unsigned char *)v15 + 24);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(&v14, 8);
  return v5;
}

void __59__PKSTSTapToProvisionReader_cancelProvisionAndReturnError___block_invoke(void *a1)
{
  BOOL v2 = *(void **)(a1[4] + 8);
  uint64_t v3 = *(void *)(a1[6] + 8);
  id obj = *(id *)(v3 + 40);
  char v4 = [v2 cancelProvisionAndReturnError:&obj];
  objc_storeStrong((id *)(v3 + 40), obj);
  *(unsigned char *)(*(void *)(a1[5] + 8) + 24) = v4;
}

- (void)tapToProvisionAvailableWithTimeout:(double)a3 completion:(id)a4
{
  id v6 = a4;
  if (self->_timer)
  {
    id v7 = PKLogFacilityTypeGetObject(0x24uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKSTSTapToProvisionReader: Clearing existing timer to start new preflight", buf, 2u);
    }

    dispatch_source_cancel((dispatch_source_t)self->_timer);
    timer = self->_timer;
    self->_timer = 0;
  }
  id v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, (dispatch_queue_t)self->_replyQueue);
  uint64_t v10 = self->_timer;
  self->_timer = v9;

  id v11 = self->_timer;
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  dispatch_source_set_timer(v11, v12, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
  id v13 = self->_timer;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke;
  handler[3] = &unk_1E56D8A18;
  handler[4] = self;
  id v14 = v6;
  id v20 = v14;
  dispatch_source_set_event_handler(v13, handler);
  workQueue = self->_workQueue;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_2;
  v17[3] = &unk_1E56D8A18;
  v17[4] = self;
  id v18 = v14;
  id v16 = v14;
  dispatch_async(workQueue, v17);
  dispatch_resume((dispatch_object_t)self->_timer);
}

uint64_t __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  BOOL v2 = *(void **)(v1 + 32);
  if (v2)
  {
    uint64_t v3 = result;
    *(void *)(v1 + 32) = 0;

    char v4 = *(uint64_t (**)(void))(*(void *)(v3 + 40) + 16);
    return v4();
  }
  return result;
}

void __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  BOOL v2 = *(void **)(v1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_3;
  v3[3] = &unk_1E56ECB80;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 checkStatusWithCompletion:v3];
}

void __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 24);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_4;
  v11[3] = &unk_1E56D8BA8;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = *(id *)(a1 + 40);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, v11);
}

void __75__PKSTSTapToProvisionReader_tapToProvisionAvailableWithTimeout_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32)) {
    BOOL v2 = 0;
  }
  else {
    BOOL v2 = *(void *)(a1 + 40) != 0;
  }
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 48) + 32);
  if (v3)
  {
    dispatch_source_cancel(v3);
    uint64_t v4 = *(void *)(a1 + 48);
    id v5 = *(void **)(v4 + 32);
    *(void *)(v4 + 32) = 0;

    if (v2) {
      goto LABEL_23;
    }
    uint64_t v8 = PKLogFacilityTypeGetObject(0x24uLL);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(__CFString **)(a1 + 32);
      int v16 = 138412290;
      char v17 = v9;
      _os_log_impl(&dword_190E10000, v8, OS_LOG_TYPE_DEFAULT, "PKSTSTapToProvisionReader: Check status returned not available with error: %@", (uint8_t *)&v16, 0xCu);
    }

    id v10 = [*(id *)(a1 + 32) domain];
    id v11 = (void *)*MEMORY[0x1E4FA5698];
    id v12 = v10;
    id v13 = v11;
    if (v12 == v13)
    {
    }
    else
    {
      uint64_t v14 = v13;
      if (!v12 || !v13)
      {

        goto LABEL_22;
      }
      int v15 = [v12 isEqualToString:v13];

      if (!v15) {
        goto LABEL_22;
      }
    }
    [*(id *)(a1 + 32) code];
LABEL_22:

LABEL_23:
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    return;
  }
  id v6 = PKLogFacilityTypeGetObject(0x24uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = @"No";
    if (v2) {
      uint64_t v7 = @"Yes";
    }
    int v16 = 138412290;
    char v17 = v7;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "PKSTSTapToProvisionReader: finished checking status, but timed out. Available: %@", (uint8_t *)&v16, 0xCu);
  }
}

- (void)onUpdateWithEvent:(int64_t)a3
{
  replyQueue = self->_replyQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __47__PKSTSTapToProvisionReader_onUpdateWithEvent___block_invoke;
  v4[3] = &unk_1E56DE608;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(replyQueue, v4);
}

void __47__PKSTSTapToProvisionReader_onUpdateWithEvent___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  [WeakRetained tapToProvisionReader:*(void *)(a1 + 32) didUpdateWithEvent:*(void *)(a1 + 40)];
}

- (PKSTSTapToProvisionDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PKSTSTapToProvisionDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_underlying, 0);
}

@end