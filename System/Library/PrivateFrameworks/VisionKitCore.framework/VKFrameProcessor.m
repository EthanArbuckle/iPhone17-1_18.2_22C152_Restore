@interface VKFrameProcessor
+ (double)defaultInfrequentProcessingInterval;
+ (double)defaultProcessingInterval;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)wantsThrottling;
- (OS_dispatch_queue)resultHandlerQueue;
- (OS_dispatch_queue)serialQueue;
- (VKFrameProcessor)init;
- (double)infrequentProcessingInterval;
- (double)processingInterval;
- (void)_processFrame:(void *)a1;
- (void)cancel;
- (void)enqueueFrame:(id)a3;
- (void)lock;
- (void)requestImmediateProcessing;
- (void)reset;
- (void)setExecuting:(void *)a1;
- (void)setInfrequentProcessingInterval:(double)a3;
- (void)setProcessingInterval:(double)a3;
- (void)setResultHandlerQueue:(id)a3;
- (void)unlock;
@end

@implementation VKFrameProcessor

+ (double)defaultProcessingInterval
{
  return 0.25;
}

+ (double)defaultInfrequentProcessingInterval
{
  return 1.5;
}

- (VKFrameProcessor)init
{
  v14.receiver = self;
  v14.super_class = (Class)VKFrameProcessor;
  v2 = [(VKFrameProcessor *)&v14 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = dispatch_queue_attr_make_with_qos_class(v4, QOS_CLASS_USER_INITIATED, 0);

    v6 = NSString;
    v7 = (objc_class *)objc_opt_class();
    v8 = NSStringFromClass(v7);
    v9 = [v6 stringWithFormat:@"com.apple.visionkit.%@.serial", v8];

    id v10 = v9;
    dispatch_queue_t v11 = dispatch_queue_create((const char *)[v10 UTF8String], v5);
    serialQueue = v3->_serialQueue;
    v3->_serialQueue = (OS_dispatch_queue *)v11;

    *(_OWORD *)&v3->_processingInterval = xmmword_1DB33E970;
    v3->_currentProcessingInterval = 0.25;
  }
  return v3;
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (OS_dispatch_queue)resultHandlerQueue
{
  [(VKFrameProcessor *)self lock];
  v3 = self->_resultHandlerQueue;
  [(VKFrameProcessor *)self unlock];
  return v3;
}

- (void)setResultHandlerQueue:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__VKFrameProcessor_setResultHandlerQueue___block_invoke;
  v6[3] = &unk_1E6BF12B8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  vk_performWhileLocked(self, v6);
}

void __42__VKFrameProcessor_setResultHandlerQueue___block_invoke(uint64_t a1)
{
}

- (void)enqueueFrame:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(VKFrameProcessor *)self wantsThrottling];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __33__VKFrameProcessor_enqueueFrame___block_invoke;
  v7[3] = &unk_1E6BF1B78;
  BOOL v9 = v5;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  vk_performWhileLocked(self, v7);
}

void __33__VKFrameProcessor_enqueueFrame___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 32))
  {
    if (!*(unsigned char *)(a1 + 48))
    {
LABEL_9:
      *(unsigned char *)(v1 + 32) = 1;
      *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 56) = CFAbsoluteTimeGetCurrent();
      id v8 = *(void **)(a1 + 32);
      BOOL v9 = (void *)v8[3];
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __33__VKFrameProcessor_enqueueFrame___block_invoke_2;
      v10[3] = &unk_1E6BF1B50;
      id v11 = *(id *)(a1 + 40);
      vk_performBlockOnQueueWithStrongSelf(v9, v8, v10);

      return;
    }
    if (*(unsigned char *)(v1 + 34))
    {
      *(unsigned char *)(v1 + 34) = 0;
      uint64_t v1 = *(void *)(a1 + 32);
      goto LABEL_9;
    }
    v3 = [*(id *)(a1 + 40) info];
    uint64_t v4 = [v3 sceneStability];

    uint64_t v5 = 40;
    if (v4 == 3) {
      uint64_t v5 = 48;
    }
    *(void *)(*(void *)(a1 + 32) + 64) = *(void *)(*(void *)(a1 + 32) + v5);
    double Current = CFAbsoluteTimeGetCurrent();
    uint64_t v1 = *(void *)(a1 + 32);
    double v7 = *(double *)(v1 + 56);
    if (v7 == 0.0 || Current - v7 >= *(double *)(v1 + 64)) {
      goto LABEL_9;
    }
  }
}

void __33__VKFrameProcessor_enqueueFrame___block_invoke_2(uint64_t a1, void *a2)
{
}

- (void)_processFrame:(void *)a1
{
  if (a1)
  {
    v3 = a1[3];
    id v4 = a2;
    dispatch_assert_queue_V2(v3);
    [a1 processFrame:v4];

    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __34__VKFrameProcessor__processFrame___block_invoke;
    v5[3] = &unk_1E6BF0D18;
    v5[4] = a1;
    vk_performWhileLocked(a1, v5);
  }
}

uint64_t __34__VKFrameProcessor__processFrame___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = 0;
  *(unsigned char *)(*(void *)(result + 32) + 33) = 0;
  return result;
}

- (BOOL)wantsThrottling
{
  return 0;
}

- (double)processingInterval
{
  [(VKFrameProcessor *)self lock];
  double processingInterval = self->_processingInterval;
  [(VKFrameProcessor *)self unlock];
  return processingInterval;
}

- (void)setProcessingInterval:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__VKFrameProcessor_setProcessingInterval___block_invoke;
  v3[3] = &unk_1E6BF1BA0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  vk_performWhileLocked(self, v3);
}

double __42__VKFrameProcessor_setProcessingInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 40) = result;
  return result;
}

- (double)infrequentProcessingInterval
{
  [(VKFrameProcessor *)self lock];
  double infrequentProcessingInterval = self->_infrequentProcessingInterval;
  [(VKFrameProcessor *)self unlock];
  return infrequentProcessingInterval;
}

- (void)setInfrequentProcessingInterval:(double)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__VKFrameProcessor_setInfrequentProcessingInterval___block_invoke;
  v3[3] = &unk_1E6BF1BA0;
  v3[4] = self;
  *(double *)&v3[5] = a3;
  vk_performWhileLocked(self, v3);
}

double __52__VKFrameProcessor_setInfrequentProcessingInterval___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 48) = result;
  return result;
}

- (void)requestImmediateProcessing
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __46__VKFrameProcessor_requestImmediateProcessing__block_invoke;
  v2[3] = &unk_1E6BF0D18;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __46__VKFrameProcessor_requestImmediateProcessing__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 34) = 1;
  return result;
}

- (BOOL)isExecuting
{
  [(VKFrameProcessor *)self lock];
  BOOL isExecuting = self->_isExecuting;
  [(VKFrameProcessor *)self unlock];
  return isExecuting;
}

- (void)setExecuting:(void *)a1
{
  if (a1)
  {
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __33__VKFrameProcessor_setExecuting___block_invoke;
    v2[3] = &unk_1E6BF0CC8;
    v2[4] = a1;
    char v3 = a2;
    vk_performWhileLocked(a1, v2);
  }
}

uint64_t __33__VKFrameProcessor_setExecuting___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 32) = *(unsigned char *)(result + 40);
  return result;
}

- (BOOL)isCancelled
{
  [(VKFrameProcessor *)self lock];
  BOOL isCancelled = self->_isCancelled;
  [(VKFrameProcessor *)self unlock];
  return isCancelled;
}

- (void)cancel
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __26__VKFrameProcessor_cancel__block_invoke;
  v2[3] = &unk_1E6BF0D18;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __26__VKFrameProcessor_cancel__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 33) = 1;
  return result;
}

- (void)reset
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __25__VKFrameProcessor_reset__block_invoke;
  v2[3] = &unk_1E6BF0D18;
  v2[4] = self;
  vk_performWhileLocked(self, v2);
}

uint64_t __25__VKFrameProcessor_reset__block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (*(unsigned char *)(v1 + 32)) {
    *(unsigned char *)(v1 + 33) = 1;
  }
  return result;
}

- (void)lock
{
}

- (void)unlock
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_resultHandlerQueue, 0);
}

@end