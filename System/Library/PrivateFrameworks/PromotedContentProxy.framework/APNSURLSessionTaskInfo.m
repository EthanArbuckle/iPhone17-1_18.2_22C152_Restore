@interface APNSURLSessionTaskInfo
- (APNSURLSessionTaskInfo)initWithTask:(id)a3 delegate:(id)a4 modes:(id)a5;
- (NSArray)modes;
- (NSThread)thread;
- (NSURLSessionDataDelegate)delegate;
- (NSURLSessionDataTask)task;
- (void)invalidate;
- (void)perform:(id)a3 waitUntilDone:(BOOL)a4;
- (void)performBlock:(id)a3;
- (void)performBlockAndWait:(id)a3;
- (void)performBlockOnClientThread:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setModes:(id)a3;
- (void)setThread:(id)a3;
@end

@implementation APNSURLSessionTaskInfo

- (APNSURLSessionTaskInfo)initWithTask:(id)a3 delegate:(id)a4 modes:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v27.receiver = self;
  v27.super_class = (Class)APNSURLSessionTaskInfo;
  v12 = [(APNSURLSessionTaskInfo *)&v27 init];
  v13 = v12;
  if (v12)
  {
    objc_storeWeak((id *)&v12->_delegate, v10);
    uint64_t v18 = objc_msgSend_currentThread(MEMORY[0x263F08B88], v14, v15, v16, v17);
    thread = v13->_thread;
    v13->_thread = (NSThread *)v18;

    uint64_t v24 = objc_msgSend_copy(v11, v20, v21, v22, v23);
    modes = v13->_modes;
    v13->_modes = (NSArray *)v24;

    objc_storeStrong((id *)&v13->_task, a3);
  }

  return v13;
}

- (void)performBlock:(id)a3
{
}

- (void)performBlockAndWait:(id)a3
{
}

- (void)perform:(id)a3 waitUntilDone:(BOOL)a4
{
  BOOL v5 = a4;
  id v19 = (id)objc_msgSend_copy(a3, a2, (uint64_t)a3, a4, v4);
  id v11 = objc_msgSend_thread(self, v7, v8, v9, v10);
  v12 = (void *)MEMORY[0x23ECA5590](v19);
  uint64_t v17 = objc_msgSend_modes(self, v13, v14, v15, v16);
  objc_msgSend_performSelector_onThread_withObject_waitUntilDone_modes_(self, v18, (uint64_t)sel_performBlockOnClientThread_, (uint64_t)v11, (uint64_t)v12, v5, v17);
}

- (void)performBlockOnClientThread:(id)a3
{
}

- (void)invalidate
{
  objc_msgSend_setDelegate_(self, a2, 0, v2, v3);

  MEMORY[0x270F9A6D0](self, sel_setThread_, 0, v5, v6);
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 8, 1);
}

- (NSURLSessionDataDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NSURLSessionDataDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSThread)thread
{
  return (NSThread *)objc_getProperty(self, a2, 24, 1);
}

- (void)setThread:(id)a3
{
}

- (NSArray)modes
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setModes:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modes, 0);
  objc_storeStrong((id *)&self->_thread, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_task, 0);
}

@end