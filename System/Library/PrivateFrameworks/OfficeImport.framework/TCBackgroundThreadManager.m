@interface TCBackgroundThreadManager
- (BOOL)isCancelled;
- (TCBackgroundThreadManager)initWithCancelDelegate:(id)a3;
- (TCMessageContext)messageContext;
- (TCProgressContext)progressContext;
- (void)addASyncBlock:(id)a3;
- (void)dealloc;
- (void)setMessageContext:(id)a3;
- (void)setProgressContext:(id)a3;
- (void)waitUntilComplete;
@end

@implementation TCBackgroundThreadManager

- (BOOL)isCancelled
{
  return [(TCCancelDelegate *)self->mCancelDelegate isCancelled];
}

- (TCBackgroundThreadManager)initWithCancelDelegate:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)TCBackgroundThreadManager;
  v6 = [(TCBackgroundThreadManager *)&v20 init];
  if (v6)
  {
    uint64_t v7 = dispatch_get_global_queue(0, 0);
    mQueue = v6->mQueue;
    v6->mQueue = (OS_dispatch_queue *)v7;

    dispatch_queue_t v9 = dispatch_queue_create("com.apple.iWork.TCBackgroundProgressQueue", 0);
    mProgressReportingQueue = v6->mProgressReportingQueue;
    v6->mProgressReportingQueue = (OS_dispatch_queue *)v9;

    dispatch_group_t v11 = dispatch_group_create();
    mGroup = v6->mGroup;
    v6->mGroup = (OS_dispatch_group *)v11;

    objc_storeStrong((id *)&v6->mCancelDelegate, a3);
    v13 = [MEMORY[0x263F08B88] currentThread];
    v14 = [v13 threadDictionary];
    v15 = [v14 objectForKey:@"TCMessageContext Instance"];
    [(TCBackgroundThreadManager *)v6 setMessageContext:v15];

    v16 = [MEMORY[0x263F08B88] currentThread];
    v17 = [v16 threadDictionary];
    v18 = [v17 objectForKey:@"TCProgressContext Instance"];
    [(TCBackgroundThreadManager *)v6 setProgressContext:v18];
  }
  return v6;
}

- (void)dealloc
{
  mQueue = self->mQueue;
  if (mQueue)
  {
    self->mQueue = 0;
  }
  mGroup = self->mGroup;
  if (mGroup)
  {
    self->mGroup = 0;
  }
  mProgressReportingQueue = self->mProgressReportingQueue;
  if (mProgressReportingQueue)
  {
    self->mProgressReportingQueue = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TCBackgroundThreadManager;
  [(TCBackgroundThreadManager *)&v6 dealloc];
}

- (void)addASyncBlock:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->mIsWaiting)
  {
    objc_super v6 = [NSString stringWithUTF8String:"-[TCBackgroundThreadManager addASyncBlock:]"];
    uint64_t v7 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/compatibility/Common/Utilities/TCBackgroundThreadManager.m"];
    +[OITSUAssertionHandler handleFailureInFunction:v6 file:v7 lineNumber:83 isFatal:0 description:"TCBackgroundThreadManager: Cannot add blocks when waiting"];

    +[OITSUAssertionHandler logBacktraceThrottled];
  }
  else
  {
    mQueue = self->mQueue;
    ++self->mBlockCount;
    mGroup = self->mGroup;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __43__TCBackgroundThreadManager_addASyncBlock___block_invoke;
    v10[3] = &unk_264D616F8;
    v10[4] = self;
    id v11 = v4;
    dispatch_group_async(mGroup, mQueue, v10);
  }
}

void __43__TCBackgroundThreadManager_addASyncBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v2 + 16))
  {
    v3 = *(NSObject **)(v2 + 48);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __43__TCBackgroundThreadManager_addASyncBlock___block_invoke_2;
    block[3] = &unk_264D61310;
    block[4] = v2;
    dispatch_sync(v3, block);
    uint64_t v2 = *(void *)(a1 + 32);
  }
  --*(void *)(v2 + 24);
}

uint64_t __43__TCBackgroundThreadManager_addASyncBlock___block_invoke_2(uint64_t a1)
{
  return +[TCProgressContext advanceProgressInContext:*(void *)(*(void *)(a1 + 32) + 64) progress:1.0];
}

- (void)waitUntilComplete
{
  +[TCProgressContext createStageWithSteps:@"Background object processing" takingSteps:(double)self->mBlockCount name:100.0];
  self->mIsWaiting = 1;
  dispatch_group_wait((dispatch_group_t)self->mGroup, 0xFFFFFFFFFFFFFFFFLL);
  +[TCProgressContext endStage];
}

- (TCMessageContext)messageContext
{
  return (TCMessageContext *)objc_getProperty(self, a2, 56, 1);
}

- (void)setMessageContext:(id)a3
{
}

- (TCProgressContext)progressContext
{
  return (TCProgressContext *)objc_getProperty(self, a2, 64, 1);
}

- (void)setProgressContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mProgressContext, 0);
  objc_storeStrong((id *)&self->mMessageContext, 0);
  objc_storeStrong((id *)&self->mProgressReportingQueue, 0);
  objc_storeStrong((id *)&self->mGroup, 0);
  objc_storeStrong((id *)&self->mQueue, 0);
  objc_storeStrong((id *)&self->mCancelDelegate, 0);
}

@end