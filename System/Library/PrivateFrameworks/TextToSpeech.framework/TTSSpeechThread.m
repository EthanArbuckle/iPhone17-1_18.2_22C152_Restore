@interface TTSSpeechThread
- (OS_voucher)voucher;
- (TTSSpeechThread)init;
- (void)cancel;
- (void)main;
- (void)setVoucher:(id)a3;
- (void)stop;
@end

@implementation TTSSpeechThread

- (TTSSpeechThread)init
{
  v12.receiver = self;
  v12.super_class = (Class)TTSSpeechThread;
  v2 = [(TTSSpeechThread *)&v12 init];
  v6 = v2;
  if (v2)
  {
    objc_msgSend_setName_(v2, v3, @"AXSpeech", v4, v5);
    v7 = (void *)voucher_copy();
    objc_msgSend_setVoucher_(v6, v8, (uint64_t)v7, v9, v10);
  }
  return v6;
}

- (void)main
{
  v6 = objc_msgSend_voucher(self, a2, v2, v3, v4);

  if (v6)
  {
    objc_msgSend_voucher(self, v7, v8, v9, v10);
    objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_currentRunLoop(MEMORY[0x1E4F1CAC0], v7, v8, v9, v10);
  v11 = (NSRunLoop *)objc_claimAutoreleasedReturnValue();
  threadRunLoop = self->_threadRunLoop;
  self->_threadRunLoop = v11;

  v17 = objc_msgSend_processInfo(MEMORY[0x1E4F28F80], v13, v14, v15, v16);
  objc_msgSend_processName(v17, v18, v19, v20, v21);
  id v49 = (id)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend_isEqualToString_(v49, v22, @"com.apple.accessibility.AccessibilityUIServer", v23, v24) & 1) != 0|| objc_msgSend_isEqualToString_(v49, v25, @"com.apple.AccessibilityUIServer", v26, v27))
  {
    AXSetThreadPriority();
  }
  objc_msgSend_port(MEMORY[0x1E4F1CA30], v28, v29, v30, v31);
  v32 = (NSPort *)objc_claimAutoreleasedReturnValue();
  machPort = self->_machPort;
  self->_machPort = v32;

  uint64_t v34 = *MEMORY[0x1E4F1C3A0];
  objc_msgSend_addPort_forMode_(self->_threadRunLoop, v35, (uint64_t)self->_machPort, *MEMORY[0x1E4F1C3A0], v36);
  do
  {
    if (objc_msgSend_isCancelled(self, v37, v38, v39, v40)) {
      break;
    }
    v45 = self->_threadRunLoop;
    v46 = objc_msgSend_distantFuture(MEMORY[0x1E4F1C9C8], v41, v42, v43, v44);
    LOBYTE(v45) = objc_msgSend_runMode_beforeDate_(v45, v47, v34, (uint64_t)v46, v48);
  }
  while ((v45 & 1) != 0);
}

- (void)cancel
{
}

- (void)stop
{
  objc_msgSend_currentThread(MEMORY[0x1E4F29060], a2, v2, v3, v4);
  v6 = (TTSSpeechThread *)objc_claimAutoreleasedReturnValue();

  if (v6 == self)
  {
    v12.receiver = self;
    v12.super_class = (Class)TTSSpeechThread;
    [(TTSSpeechThread *)&v12 cancel];
    CFRunLoop = (__CFRunLoop *)objc_msgSend_getCFRunLoop(self->_threadRunLoop, v7, v8, v9, v10);
    CFRunLoopStop(CFRunLoop);
  }
}

- (OS_voucher)voucher
{
  return self->_voucher;
}

- (void)setVoucher:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voucher, 0);
  objc_storeStrong((id *)&self->_threadRunLoop, 0);

  objc_storeStrong((id *)&self->_machPort, 0);
}

@end