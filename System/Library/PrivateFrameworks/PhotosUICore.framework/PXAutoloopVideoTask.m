@interface PXAutoloopVideoTask
- (BOOL)_isOnIvarQueue;
- (BOOL)_isRunning;
- (NSError)error;
- (NSString)temporaryFilesDirectory;
- (PXAutoloopVideoTask)init;
- (PXAutoloopVideoTaskDelegate)delegate;
- (double)progress;
- (int64_t)status;
- (void)_performIvarRead:(id)a3;
- (void)_performIvarWrite:(id)a3;
- (void)_reset;
- (void)cancel;
- (void)performTaskWithInput:(id)a3;
- (void)runWithInput:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setProgress:(double)a3;
- (void)setStatus:(int64_t)a3;
- (void)setTemporaryFilesDirectory:(id)a3;
@end

@implementation PXAutoloopVideoTask

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryFilesDirectory, 0);
  objc_storeStrong((id *)&self->_ivarQueue_error, 0);
  objc_destroyWeak((id *)&self->_ivarQueue_delegate);
  objc_storeStrong((id *)&self->_ivarQueue, 0);
  objc_storeStrong((id *)&self->_performQueue, 0);
}

- (NSString)temporaryFilesDirectory
{
  return self->_temporaryFilesDirectory;
}

- (void)_performIvarWrite:(id)a3
{
  ivarQueue = self->_ivarQueue;
  if (ivarQueue) {
    dispatch_barrier_sync(ivarQueue, a3);
  }
  else {
    (*((void (**)(id))a3 + 2))(a3);
  }
}

- (void)_performIvarRead:(id)a3
{
  id v4 = a3;
  dispatch_block_t block = v4;
  if (self->_ivarQueue && (v5 = [(PXAutoloopVideoTask *)self _isOnIvarQueue], id v4 = block, !v5)) {
    dispatch_sync((dispatch_queue_t)self->_ivarQueue, block);
  }
  else {
    (*((void (**)(id))v4 + 2))(v4);
  }
}

- (BOOL)_isOnIvarQueue
{
  return dispatch_get_specific((const void *)PXAutoloopVideoTaskIvarQueueContext) == self->_ivarQueueIdentifier;
}

- (BOOL)_isRunning
{
  return [(PXAutoloopVideoTask *)self status] == 2;
}

- (void)setStatus:(int64_t)a3
{
  if ([(PXAutoloopVideoTask *)self status] != a3)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __33__PXAutoloopVideoTask_setStatus___block_invoke;
    v11[3] = &unk_1E5DD08D8;
    v11[4] = self;
    v11[5] = a3;
    [(PXAutoloopVideoTask *)self _performIvarWrite:v11];
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x2020000000;
    char v10 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __33__PXAutoloopVideoTask_setStatus___block_invoke_2;
    v6[3] = &unk_1E5DD0588;
    v6[4] = self;
    v6[5] = &v7;
    [(PXAutoloopVideoTask *)self _performIvarRead:v6];
    if (*((unsigned char *)v8 + 24))
    {
      BOOL v5 = [(PXAutoloopVideoTask *)self delegate];
      [v5 autoloopVideoTaskStatusDidChange:self];
    }
    _Block_object_dispose(&v7, 8);
  }
}

uint64_t __33__PXAutoloopVideoTask_setStatus___block_invoke(uint64_t result)
{
  *(void *)(*(void *)(result + 32) + 40) = *(void *)(result + 40);
  return result;
}

uint64_t __33__PXAutoloopVideoTask_setStatus___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 65);
  return result;
}

- (int64_t)status
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PXAutoloopVideoTask_status__block_invoke;
  v4[3] = &unk_1E5DD0588;
  v4[4] = self;
  v4[5] = &v5;
  [(PXAutoloopVideoTask *)self _performIvarRead:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__PXAutoloopVideoTask_status__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 40);
  return result;
}

- (void)setProgress:(double)a3
{
  [(PXAutoloopVideoTask *)self progress];
  if (v5 != a3)
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __35__PXAutoloopVideoTask_setProgress___block_invoke;
    v12[3] = &unk_1E5DD08D8;
    v12[4] = self;
    *(double *)&v12[5] = a3;
    [(PXAutoloopVideoTask *)self _performIvarWrite:v12];
    uint64_t v8 = 0;
    uint64_t v9 = &v8;
    uint64_t v10 = 0x2020000000;
    char v11 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __35__PXAutoloopVideoTask_setProgress___block_invoke_2;
    v7[3] = &unk_1E5DD0588;
    v7[4] = self;
    v7[5] = &v8;
    [(PXAutoloopVideoTask *)self _performIvarRead:v7];
    if (*((unsigned char *)v9 + 24))
    {
      v6 = [(PXAutoloopVideoTask *)self delegate];
      [v6 autoloopVideoTaskProgressDidChange:self];
    }
    _Block_object_dispose(&v8, 8);
  }
}

double __35__PXAutoloopVideoTask_setProgress___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

uint64_t __35__PXAutoloopVideoTask_setProgress___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 64);
  return result;
}

- (double)progress
{
  uint64_t v5 = 0;
  v6 = (double *)&v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__PXAutoloopVideoTask_progress__block_invoke;
  v4[3] = &unk_1E5DD0588;
  v4[4] = self;
  v4[5] = &v5;
  [(PXAutoloopVideoTask *)self _performIvarRead:v4];
  double v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

double __31__PXAutoloopVideoTask_progress__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 48);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setError:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAutoloopVideoTask *)self error];

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __32__PXAutoloopVideoTask_setError___block_invoke;
    v6[3] = &unk_1E5DD32A8;
    v6[4] = self;
    id v7 = v4;
    [(PXAutoloopVideoTask *)self _performIvarWrite:v6];
  }
}

void __32__PXAutoloopVideoTask_setError___block_invoke(uint64_t a1)
{
}

- (NSError)error
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__50039;
  uint64_t v9 = __Block_byref_object_dispose__50040;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__PXAutoloopVideoTask_error__block_invoke;
  v4[3] = &unk_1E5DD0588;
  v4[4] = self;
  v4[5] = &v5;
  [(PXAutoloopVideoTask *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (NSError *)v2;
}

void __28__PXAutoloopVideoTask_error__block_invoke(uint64_t a1)
{
}

- (void)setTemporaryFilesDirectory:(id)a3
{
  uint64_t v8 = (NSString *)a3;
  id v4 = self->_temporaryFilesDirectory;
  temporaryFilesDirectory = v8;
  if (v4 != v8)
  {
    BOOL v6 = [(NSString *)v8 isEqualToString:v4];

    if (v6) {
      goto LABEL_5;
    }
    uint64_t v7 = (NSString *)[(NSString *)v8 copy];
    temporaryFilesDirectory = self->_temporaryFilesDirectory;
    self->_temporaryFilesDirectory = v7;
  }

LABEL_5:
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(PXAutoloopVideoTask *)self delegate];

  if (v5 != v4)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __35__PXAutoloopVideoTask_setDelegate___block_invoke;
    v6[3] = &unk_1E5DD32A8;
    v6[4] = self;
    id v7 = v4;
    [(PXAutoloopVideoTask *)self _performIvarWrite:v6];
  }
}

uint64_t __35__PXAutoloopVideoTask_setDelegate___block_invoke(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 32), *(id *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = objc_opt_respondsToSelector() & 1;
  uint64_t result = objc_opt_respondsToSelector();
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = result & 1;
  return result;
}

- (PXAutoloopVideoTaskDelegate)delegate
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__50039;
  uint64_t v9 = __Block_byref_object_dispose__50040;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __31__PXAutoloopVideoTask_delegate__block_invoke;
  v4[3] = &unk_1E5DD0588;
  v4[4] = self;
  v4[5] = &v5;
  [(PXAutoloopVideoTask *)self _performIvarRead:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return (PXAutoloopVideoTaskDelegate *)v2;
}

void __31__PXAutoloopVideoTask_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = WeakRetained;
}

- (void)cancel
{
}

- (void)performTaskWithInput:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v5 = NSStringFromSelector(a2);
  BOOL v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v8 handleFailureInMethod:a2, self, @"PXAutoloopVideoTask.m", 72, @"The method %@ in %@ must be overridden.", v5, v7 object file lineNumber description];
}

- (void)runWithInput:(id)a3
{
  id v4 = a3;
  if ([(PXAutoloopVideoTask *)self _isRunning]) {
    [(PXAutoloopVideoTask *)self cancel];
  }
  [(PXAutoloopVideoTask *)self _reset];
  [(PXAutoloopVideoTask *)self setStatus:2];
  objc_initWeak(&location, self);
  performQueue = self->_performQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PXAutoloopVideoTask_runWithInput___block_invoke;
  block[3] = &unk_1E5DD20C8;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(performQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __36__PXAutoloopVideoTask_runWithInput___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained performTaskWithInput:*(void *)(a1 + 32)];
}

- (void)_reset
{
  [(PXAutoloopVideoTask *)self setStatus:0];
  [(PXAutoloopVideoTask *)self setProgress:0.0];
  [(PXAutoloopVideoTask *)self setError:0];
}

- (PXAutoloopVideoTask)init
{
  v10.receiver = self;
  v10.super_class = (Class)PXAutoloopVideoTask;
  id v2 = [(PXAutoloopVideoTask *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.PXAutoloopVideoTask.perform", 0);
    id v4 = (void *)*((void *)v2 + 1);
    *((void *)v2 + 1) = v3;

    dispatch_queue_t v5 = dispatch_queue_create("com.apple.PXAutoloopVideoTask.ivars", MEMORY[0x1E4F14430]);
    id v6 = (void *)*((void *)v2 + 2);
    *((void *)v2 + 2) = v5;

    uint64_t v7 = NSNumber;
    atomic_fetch_add(init_ivarQueueCounter, 1u);
    id v8 = objc_msgSend(v7, "numberWithInt:");
    *((void *)v2 + 3) = v8;
    dispatch_queue_set_specific(*((dispatch_queue_t *)v2 + 2), (const void *)PXAutoloopVideoTaskIvarQueueContext, v8, 0);
    objc_storeWeak((id *)v2 + 4, 0);
    *((void *)v2 + 5) = 0;
    *((void *)v2 + 6) = 0;
  }
  return (PXAutoloopVideoTask *)v2;
}

@end