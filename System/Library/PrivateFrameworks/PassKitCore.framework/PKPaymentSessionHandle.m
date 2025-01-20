@interface PKPaymentSessionHandle
- (BOOL)isFirstInQueue;
- (PKPaymentSessionHandle)init;
- (id)_initWithQueue:(void *)a1;
- (id)initWithInternalNFSessionHandle:(void *)a3 targetQueue:;
- (void)invalidateSession;
- (void)invalidateSessionWithCompletion:(id)a3;
@end

@implementation PKPaymentSessionHandle

- (PKPaymentSessionHandle)init
{
  return 0;
}

- (id)_initWithQueue:(void *)a1
{
  v3 = a2;
  v10.receiver = a1;
  v10.super_class = (Class)PKPaymentSessionHandle;
  id v4 = objc_msgSendSuper2(&v10, sel_init);
  if (v4)
  {
    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = dispatch_queue_attr_make_initially_inactive(v5);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.passkit.sessionHandle.internalSession", v6);
    v8 = (void *)*((void *)v4 + 1);
    *((void *)v4 + 1) = v7;

    if (v3) {
      dispatch_set_target_queue(*((dispatch_object_t *)v4 + 1), v3);
    }
    dispatch_activate(*((dispatch_object_t *)v4 + 1));
  }
  return v4;
}

- (id)initWithInternalNFSessionHandle:(void *)a3 targetQueue:
{
  id v6 = a2;
  id v7 = a3;
  if (a1 && v6)
  {
    v8 = (id *)-[PKPaymentSessionHandle _initWithQueue:](a1, v7);
    v9 = v8;
    if (v8) {
      objc_storeStrong(v8 + 2, a2);
    }
    else {
      [v6 endSession];
    }
    a1 = v9;
    objc_super v10 = a1;
  }
  else
  {
    objc_super v10 = 0;
  }

  return v10;
}

- (BOOL)isFirstInQueue
{
  if (self->_NFSessionHandle) {
    return [self->_NFSessionHandle isFirstInQueue];
  }
  if (self->_STSSession) {
    return self->_STSSessionIsFirstInQueue;
  }
  return 0;
}

- (void)invalidateSession
{
}

- (void)invalidateSessionWithCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  NFSessionHandle = self->_NFSessionHandle;
  if (NFSessionHandle)
  {
    id v7 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v16 = self;
      __int16 v17 = 2048;
      v18 = NFSessionHandle;
      _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSessionHandle (%p): invalidating NFSession handle %p.", buf, 0x16u);
    }

    v8 = self->_NFSessionHandle;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke;
    v13[3] = &unk_1E56D83D8;
    v13[4] = self;
    id v14 = v5;
    [(NFSession *)v8 endSessionWithCompletion:v13];

    STSSession = self->_STSSession;
    if (STSSession)
    {
      v5 = 0;
LABEL_8:
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v16 = self;
        __int16 v17 = 2048;
        v18 = STSSession;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "PKPaymentSessionHandle (%p): invalidating STSSession %p.", buf, 0x16u);
      }

      objc_super v10 = self->_STSSession;
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_47;
      v11[3] = &unk_1E56D83D8;
      v11[4] = self;
      v12 = v5;
      [(STSSession *)v10 endSessionWithCompletion:v11];
      v5 = v12;
      goto LABEL_11;
    }
  }
  else
  {
    STSSession = self->_STSSession;
    if (STSSession)
    {
      id v7 = PKLogFacilityTypeGetObject(6uLL);
      goto LABEL_8;
    }
    if (v4)
    {
      (*((void (**)(id))v4 + 2))(v4);
LABEL_11:
    }
  }
}

void __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_2;
    block[3] = &unk_1E56D8360;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_47(uint64_t a1)
{
  v1 = *(void **)(a1 + 40);
  if (v1)
  {
    v2 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_2_48;
    block[3] = &unk_1E56D8360;
    id v4 = v1;
    dispatch_async(v2, block);
  }
}

uint64_t __58__PKPaymentSessionHandle_invalidateSessionWithCompletion___block_invoke_2_48(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_STSSession, 0);
  objc_storeStrong((id *)&self->_NFSessionHandle, 0);
  objc_storeStrong((id *)&self->_internalSessionSerialQueue, 0);
}

@end