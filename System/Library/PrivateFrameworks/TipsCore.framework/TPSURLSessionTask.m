@interface TPSURLSessionTask
+ (TPSURLSessionDelegateResponds)delegateRespondsWithDelegate:(id)a3;
- (BOOL)isCacheData;
- (BOOL)isCancelled;
- (NSError)dataError;
- (NSHTTPURLResponse)response;
- (NSHashTable)sessionTaskDelegates;
- (NSMutableData)dataTaskData;
- (NSString)identifier;
- (NSString)lastModified;
- (NSString)requestType;
- (NSURL)URL;
- (NSURLSession)underlyingSession;
- (NSURLSessionTask)task;
- (TPSURLSessionDelegate)networkDelegate;
- (TPSURLSessionDelegateResponds)delegateResponds;
- (TPSURLSessionTask)initWithSessionTask:(id)a3 identifier:(id)a4;
- (float)priority;
- (id)formattedData;
- (int64_t)dataType;
- (unint64_t)downloadTaskTotalBytes;
- (unint64_t)retryCount;
- (void)cancel;
- (void)dealloc;
- (void)didCompleteWithError:(id)a3;
- (void)registerDelegate:(id)a3;
- (void)resume;
- (void)setCancelled:(BOOL)a3;
- (void)setDataError:(id)a3;
- (void)setDataTaskData:(id)a3;
- (void)setDataType:(int64_t)a3;
- (void)setDelegateResponds:(TPSURLSessionDelegateResponds)a3;
- (void)setDownloadTaskTotalBytes:(unint64_t)a3;
- (void)setFormattedData:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsCacheData:(BOOL)a3;
- (void)setLastModified:(id)a3;
- (void)setNetworkDelegate:(id)a3;
- (void)setPriority:(float)a3;
- (void)setRequestType:(id)a3;
- (void)setResponse:(id)a3;
- (void)setRetryCount:(unint64_t)a3;
- (void)setSessionTaskDelegates:(id)a3;
- (void)setTask:(id)a3;
- (void)setUnderlyingSession:(id)a3;
- (void)unregisterDelegate:(id)a3;
@end

@implementation TPSURLSessionTask

- (void)setPriority:(float)a3
{
  [(NSURLSessionTask *)self->_task priority];
  if (*(float *)&v5 != a3)
  {
    task = self->_task;
    *(float *)&double v5 = a3;
    [(NSURLSessionTask *)task setPriority:v5];
  }
}

- (void)setDataType:(int64_t)a3
{
  self->_dataType = a3;
}

- (TPSURLSessionTask)initWithSessionTask:(id)a3 identifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)TPSURLSessionTask;
  v9 = [(TPSURLSessionTask *)&v18 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a4);
    objc_storeStrong((id *)&v10->_task, a3);
    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v12 = dispatch_queue_create("com.apple.tipsd.urlsessionQueue", v11);
    sessionTaskDelegateQueue = v10->_sessionTaskDelegateQueue;
    v10->_sessionTaskDelegateQueue = (OS_dispatch_queue *)v12;

    v14 = v10->_sessionTaskDelegateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__TPSURLSessionTask_initWithSessionTask_identifier___block_invoke;
    block[3] = &unk_1E5906740;
    v17 = v10;
    dispatch_sync(v14, block);
  }
  return v10;
}

- (void)setUnderlyingSession:(id)a3
{
}

- (void)setRequestType:(id)a3
{
}

- (void)setNetworkDelegate:(id)a3
{
}

- (void)setDelegateResponds:(TPSURLSessionDelegateResponds)a3
{
  self->_delegateResponds = a3;
}

- (void)registerDelegate:(id)a3
{
  id v4 = a3;
  if (v4 && ![(NSHashTable *)self->_sessionTaskDelegates containsObject:v4])
  {
    sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __38__TPSURLSessionTask_registerDelegate___block_invoke;
    v6[3] = &unk_1E5906790;
    v6[4] = self;
    id v7 = v4;
    dispatch_sync(sessionTaskDelegateQueue, v6);
  }
}

void __52__TPSURLSessionTask_initWithSessionTask_identifier___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
  [*(id *)(a1 + 32) setSessionTaskDelegates:v2];
}

- (void)setSessionTaskDelegates:(id)a3
{
}

- (void)resume
{
}

- (NSURLSessionTask)task
{
  return self->_task;
}

void __38__TPSURLSessionTask_registerDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (NSHashTable)sessionTaskDelegates
{
  return self->_sessionTaskDelegates;
}

+ (TPSURLSessionDelegateResponds)delegateRespondsWithDelegate:(id)a3
{
  id v3 = a3;
  char v4 = objc_opt_respondsToSelector();
  char v5 = objc_opt_respondsToSelector();
  char v6 = objc_opt_respondsToSelector();
  char v7 = objc_opt_respondsToSelector();
  char v8 = objc_opt_respondsToSelector();

  uint64_t v9 = 0x100000000;
  if ((v4 & 1) == 0) {
    uint64_t v9 = 0;
  }
  uint64_t v10 = 0x1000000;
  if ((v8 & 1) == 0) {
    uint64_t v10 = 0;
  }
  uint64_t v11 = 0x10000;
  if ((v5 & 1) == 0) {
    uint64_t v11 = 0;
  }
  uint64_t v12 = 256;
  if ((v7 & 1) == 0) {
    uint64_t v12 = 0;
  }
  return (TPSURLSessionDelegateResponds)((v11 | v9) & 0xFFFFFFFFFFFFFFFELL | v6 & 1 | v12 | v10);
}

- (void)dealloc
{
  [(TPSURLSessionTask *)self cancel];
  v3.receiver = self;
  v3.super_class = (Class)TPSURLSessionTask;
  [(TPSURLSessionTask *)&v3 dealloc];
}

- (NSString)identifier
{
  identifier = self->_identifier;
  if (identifier)
  {
    objc_super v3 = identifier;
  }
  else
  {
    char v4 = [(TPSURLSessionTask *)self URL];
    objc_super v3 = [v4 lastPathComponent];
  }
  return v3;
}

- (NSURL)URL
{
  id v2 = [(NSURLSessionTask *)self->_task originalRequest];
  objc_super v3 = [v2 URL];

  return (NSURL *)v3;
}

- (float)priority
{
  [(NSURLSessionTask *)self->_task priority];
  return result;
}

- (void)didCompleteWithError:(id)a3
{
  id v4 = a3;
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__TPSURLSessionTask_didCompleteWithError___block_invoke;
  v7[3] = &unk_1E5906790;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(sessionTaskDelegateQueue, v7);
}

void __42__TPSURLSessionTask_didCompleteWithError___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "sessionTaskDelegates", 0);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v6++) URLSessionSessionTask:*(void *)(a1 + 32) didCompleteWithError:*(void *)(a1 + 40)];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }

  char v7 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v7 removeAllObjects];
}

- (void)unregisterDelegate:(id)a3
{
  id v4 = a3;
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  long long v9 = __40__TPSURLSessionTask_unregisterDelegate___block_invoke;
  long long v10 = &unk_1E5906790;
  long long v11 = self;
  id v6 = v4;
  id v12 = v6;
  dispatch_sync(sessionTaskDelegateQueue, &v7);
  if (![(NSHashTable *)self->_sessionTaskDelegates count]) {
    [(TPSURLSessionTask *)self cancel];
  }
}

void __40__TPSURLSessionTask_unregisterDelegate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)cancel
{
  [(NSURLSessionTask *)self->_task cancel];
  sessionTaskDelegateQueue = self->_sessionTaskDelegateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__TPSURLSessionTask_cancel__block_invoke;
  block[3] = &unk_1E5906740;
  void block[4] = self;
  dispatch_sync(sessionTaskDelegateQueue, block);
  self->_cancelled = 1;
}

void __27__TPSURLSessionTask_cancel__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) sessionTaskDelegates];
  [v1 removeAllObjects];
}

- (NSURLSession)underlyingSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_underlyingSession);
  return (NSURLSession *)WeakRetained;
}

- (TPSURLSessionDelegate)networkDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_networkDelegate);
  return (TPSURLSessionDelegate *)WeakRetained;
}

- (TPSURLSessionDelegateResponds)delegateResponds
{
  return (TPSURLSessionDelegateResponds)(*(unsigned int *)&self->_delegateResponds.willCacheResponse | ((unint64_t)self->_delegateResponds.taskDidReceiveChallenge << 32));
}

- (BOOL)isCancelled
{
  return self->_cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->_cancelled = a3;
}

- (BOOL)isCacheData
{
  return self->_isCacheData;
}

- (void)setIsCacheData:(BOOL)a3
{
  self->_isCacheData = a3;
}

- (unint64_t)downloadTaskTotalBytes
{
  return self->_downloadTaskTotalBytes;
}

- (void)setDownloadTaskTotalBytes:(unint64_t)a3
{
  self->_downloadTaskTotalBytes = a3;
}

- (unint64_t)retryCount
{
  return self->_retryCount;
}

- (void)setRetryCount:(unint64_t)a3
{
  self->_retryCount = a3;
}

- (int64_t)dataType
{
  return self->_dataType;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)requestType
{
  return self->_requestType;
}

- (id)formattedData
{
  return self->_formattedData;
}

- (void)setFormattedData:(id)a3
{
}

- (void)setTask:(id)a3
{
}

- (NSHTTPURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSString)lastModified
{
  return self->_lastModified;
}

- (void)setLastModified:(id)a3
{
}

- (NSMutableData)dataTaskData
{
  return self->_dataTaskData;
}

- (void)setDataTaskData:(id)a3
{
}

- (NSError)dataError
{
  return self->_dataError;
}

- (void)setDataError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTaskDelegates, 0);
  objc_storeStrong((id *)&self->_dataError, 0);
  objc_storeStrong((id *)&self->_dataTaskData, 0);
  objc_storeStrong((id *)&self->_lastModified, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong(&self->_formattedData, 0);
  objc_storeStrong((id *)&self->_requestType, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_networkDelegate);
  objc_destroyWeak((id *)&self->_underlyingSession);
  objc_storeStrong((id *)&self->_sessionTaskDelegateQueue, 0);
}

@end