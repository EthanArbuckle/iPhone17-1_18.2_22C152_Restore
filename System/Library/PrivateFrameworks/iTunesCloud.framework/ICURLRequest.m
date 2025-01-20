@interface ICURLRequest
+ (Class)_responseClass;
+ (Class)_responseHandlerClass;
+ (id)_nameForRequestType:(int64_t)a3;
+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3;
- (AVURLAsset)avURLAsset;
- (BOOL)cancelOnHTTPErrors;
- (BOOL)prioritize;
- (BOOL)shouldReportLoadURLMetrics;
- (ICRequestContext)requestContext;
- (ICURLAggregatedPerformanceMetrics)aggregatedPerformanceMetrics;
- (ICURLRequest)initWithURL:(id)a3 requestContext:(id)a4;
- (ICURLRequest)initWithURL:(id)a3 requestContext:(id)a4 resumeData:(id)a5;
- (ICURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4;
- (ICURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5;
- (ICURLResponseHandler)responseHandler;
- (NSData)resumeData;
- (NSDictionary)avDownloadOptions;
- (NSError)error;
- (NSMutableData)responseData;
- (NSProgress)progress;
- (NSString)description;
- (NSString)loadURLMetricsRequestName;
- (NSString)retryReason;
- (NSURL)responseDataURL;
- (NSURLRequest)currentURLRequest;
- (NSURLRequest)urlRequest;
- (NSURLResponse)urlResponse;
- (NSURLSessionTask)task;
- (OS_dispatch_semaphore)waitSemaphore;
- (double)lastProgressUpdateTime;
- (double)lastUpdateTime;
- (double)retryDelay;
- (double)startTime;
- (id)_analyticSignature;
- (id)completionHandler;
- (int64_t)handlingType;
- (int64_t)requestState;
- (int64_t)type;
- (unint64_t)_maxRetryCountForReason:(id)a3;
- (unint64_t)_retryCountForReason:(id)a3;
- (unint64_t)maxRetryCount;
- (unint64_t)redirectCount;
- (unint64_t)retryCount;
- (void)_ensureValidRetryReason:(id)a3;
- (void)_incrementRetryCountForReason:(id)a3;
- (void)_setMaxRetryCount:(unint64_t)a3 forReason:(id)a4;
- (void)_updateSignpostsForNewState:(int64_t)a3;
- (void)buildURLRequestWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)enableLoadURLMetricsWithRequestName:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setAVDownloadOptions:(id)a3;
- (void)setAVURLAsset:(id)a3;
- (void)setAggregatedPerformanceMetrics:(id)a3;
- (void)setCancelOnHTTPErrors:(BOOL)a3;
- (void)setCompletionHandler:(id)a3;
- (void)setCurrentURLRequest:(id)a3;
- (void)setError:(id)a3;
- (void)setHandlingType:(int64_t)a3;
- (void)setLastProgressUpdateTime:(double)a3;
- (void)setLastUpdateTime:(double)a3;
- (void)setMaxRetryCount:(unint64_t)a3;
- (void)setPrioritize:(BOOL)a3;
- (void)setProgress:(id)a3;
- (void)setRedirectCount:(unint64_t)a3;
- (void)setRequestState:(int64_t)a3;
- (void)setResponseData:(id)a3;
- (void)setResponseDataURL:(id)a3;
- (void)setResponseHandler:(id)a3;
- (void)setRetryDelay:(double)a3;
- (void)setRetryReason:(id)a3;
- (void)setStartTime:(double)a3;
- (void)setTask:(id)a3;
- (void)setType:(int64_t)a3;
- (void)setUrlResponse:(id)a3;
- (void)setWaitSemaphore:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateState:(int64_t)a3;
@end

@implementation ICURLRequest

- (NSString)description
{
  unint64_t requestState = self->_requestState;
  if (requestState > 3) {
    v4 = 0;
  }
  else {
    v4 = off_1E5AC8EC0[requestState];
  }
  v5 = NSString;
  uint64_t v6 = objc_opt_class();
  v7 = [(ICRequestContext *)self->_requestContext clientInfo];
  v8 = [v7 _clientIdentifierForUserAgent];
  v9 = [(ICRequestContext *)self->_requestContext clientInfo];
  v10 = [v9 clientVersion];
  v11 = [v5 stringWithFormat:@"<%@ %p (%@) [%@/%@]>", v6, self, v4, v8, v10];

  return (NSString *)v11;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (ICRequestContext)requestContext
{
  return self->_requestContext;
}

- (unint64_t)redirectCount
{
  return self->_redirectCount;
}

- (void)setCancelOnHTTPErrors:(BOOL)a3
{
  self->_cancelOnHTTPErrors = a3;
}

- (ICURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v29.receiver = self;
  v29.super_class = (Class)ICURLRequest;
  v12 = [(ICURLRequest *)&v29 init];
  if (v12)
  {
    v13 = (ICURLResponseHandler *)objc_alloc_init((Class)[(id)objc_opt_class() _responseHandlerClass]);
    responseHandler = v12->_responseHandler;
    v12->_responseHandler = v13;

    objc_storeStrong((id *)&v12->_urlRequest, a3);
    *(_WORD *)&v12->_prioritize = 256;
    v12->_handlingType = 0;
    objc_storeStrong((id *)&v12->_retryReason, 0);
    v12->_retryDelay = 10.0;
    dispatch_semaphore_t v15 = dispatch_semaphore_create(0);
    waitSemaphore = v12->_waitSemaphore;
    v12->_waitSemaphore = (OS_dispatch_semaphore *)v15;

    v17 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E4F1CA58]);
    responseData = v12->_responseData;
    v12->_responseData = v17;

    uint64_t v19 = [v10 copy];
    requestContext = v12->_requestContext;
    v12->_requestContext = (ICRequestContext *)v19;

    uint64_t v21 = [v11 copy];
    resumeData = v12->_resumeData;
    v12->_resumeData = (NSData *)v21;

    uint64_t v23 = [MEMORY[0x1E4F1CA48] array];
    observers = v12->_observers;
    v12->_observers = (NSMutableArray *)v23;

    v12->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v25 = dispatch_queue_create("com.apple.itunescloud.ICURLRequest.observer", MEMORY[0x1E4F14430]);
    observerQueue = v12->_observerQueue;
    v12->_observerQueue = (OS_dispatch_queue *)v25;

    v27 = [MEMORY[0x1E4F28F90] progressWithTotalUnitCount:100];
    [(ICURLRequest *)v12 setProgress:v27];
  }
  return v12;
}

- (void)setProgress:(id)a3
{
}

- (void)setPrioritize:(BOOL)a3
{
  self->_prioritize = a3;
}

- (BOOL)prioritize
{
  return self->_prioritize;
}

- (void)setCompletionHandler:(id)a3
{
}

- (id)completionHandler
{
  return self->_completionHandler;
}

+ (id)_nameForRequestType:(int64_t)a3
{
  if ((unint64_t)a3 > 5) {
    return @"<unknown>";
  }
  else {
    return off_1E5AC8EE0[a3];
  }
}

- (void)setType:(int64_t)a3
{
  self->_type = a3;
}

- (double)lastUpdateTime
{
  return self->_lastUpdateTime;
}

- (int64_t)requestState
{
  return self->_requestState;
}

- (void)setAggregatedPerformanceMetrics:(id)a3
{
}

- (void)updateState:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(ICURLRequest *)self setRequestState:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = self->_observers;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector())
        {
          observerQueue = self->_observerQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __28__ICURLRequest_updateState___block_invoke;
          block[3] = &unk_1E5AC8EA0;
          block[4] = v10;
          block[5] = self;
          block[6] = a3;
          dispatch_async(observerQueue, block);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16, lock);
    }
    while (v7);
  }

  os_unfair_lock_unlock(lock);
}

- (void)setRequestState:(int64_t)a3
{
  -[ICURLRequest _updateSignpostsForNewState:](self, "_updateSignpostsForNewState:");
  [(ICURLRequest *)self willChangeValueForKey:@"requestState"];
  self->_unint64_t requestState = a3;

  [(ICURLRequest *)self didChangeValueForKey:@"requestState"];
}

- (void)_updateSignpostsForNewState:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  unint64_t signpostIdentifier = self->_signpostIdentifier;
  if (!signpostIdentifier)
  {
    uint64_t v6 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
    self->_unint64_t signpostIdentifier = os_signpost_id_make_with_pointer(v6, self);

    uint64_t v7 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
    uint64_t v8 = v7;
    os_signpost_id_t v9 = self->_signpostIdentifier;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      id v10 = [(ICURLRequest *)self _analyticSignature];
      *(_DWORD *)buf = 136446210;
      uint64_t v29 = [v10 UTF8String];
      _os_signpost_emit_with_name_impl(&dword_1A2D01000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v9, "ICURLRequestWaiting", " enableTelemetry=YES request=%{public, signpost.telemetry:string1}s", buf, 0xCu);
    }
    unint64_t signpostIdentifier = self->_signpostIdentifier;
  }
  if (signpostIdentifier + 1 >= 2)
  {
    if (a3 == 1 && !self->_requestState)
    {
      id v11 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      v12 = v11;
      os_signpost_id_t v13 = self->_signpostIdentifier;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A2D01000, v12, OS_SIGNPOST_INTERVAL_END, v13, "ICURLRequestWaiting", (const char *)&unk_1A305A88B, buf, 2u);
      }

      long long v14 = [(ICURLRequest *)self _analyticSignature];
      long long v15 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
      long long v16 = v15;
      os_signpost_id_t v17 = self->_signpostIdentifier;
      if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        uint64_t v18 = [(__CFString *)v14 UTF8String];
        *(_DWORD *)buf = 136446210;
        uint64_t v29 = v18;
        _os_signpost_emit_with_name_impl(&dword_1A2D01000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v17, "ICURLRequest", " enableTelemetry=YES request=%{public, signpost.telemetry:string1}s", buf, 0xCu);
      }

LABEL_25:
      return;
    }
    if (a3 != 3) {
      return;
    }
    uint64_t v19 = [(ICURLRequest *)self error];

    if (v19)
    {
      v20 = [(ICURLRequest *)self error];
      uint64_t v21 = objc_msgSend(v20, "msv_analyticSignature");
    }
    else
    {
      v26 = [(ICURLRequest *)self urlResponse];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        long long v14 = @"OK";
LABEL_21:
        v22 = os_log_create("com.apple.amp.iTunesCloud", "Analytics");
        uint64_t v23 = v22;
        os_signpost_id_t v24 = self->_signpostIdentifier;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
        {
          uint64_t v25 = [(__CFString *)v14 UTF8String];
          *(_DWORD *)buf = 136446210;
          uint64_t v29 = v25;
          _os_signpost_emit_with_name_impl(&dword_1A2D01000, v23, OS_SIGNPOST_INTERVAL_END, v24, "ICURLRequest", "result=%{public, signpost.telemetry:string2}s", buf, 0xCu);
        }

        self->_unint64_t signpostIdentifier = -1;
        goto LABEL_25;
      }
      v20 = [(ICURLRequest *)self urlResponse];
      if ([v20 statusCode] == 200)
      {
        long long v14 = @"OK";
        goto LABEL_20;
      }
      uint64_t v21 = objc_msgSend(NSString, "stringWithFormat:", @"HTTP-%ld", objc_msgSend(v20, "statusCode"));
    }
    long long v14 = (__CFString *)v21;
LABEL_20:

    goto LABEL_21;
  }
}

- (id)_analyticSignature
{
  v2 = [(ICURLRequest *)self urlRequest];
  v3 = [v2 URL];

  v4 = [v3 host];
  v5 = [v3 path];
  if ([v5 hasPrefix:@"/WebObjects/"])
  {
    id v6 = [NSString stringWithFormat:@"%@%@", v4, v5];
  }
  else
  {
    id v6 = v4;
  }
  uint64_t v7 = v6;

  return v7;
}

- (NSURLResponse)urlResponse
{
  return self->_urlResponse;
}

- (ICURLAggregatedPerformanceMetrics)aggregatedPerformanceMetrics
{
  return self->_aggregatedPerformanceMetrics;
}

+ (Class)_responseClass
{
  return (Class)objc_opt_class();
}

- (int64_t)type
{
  return self->_type;
}

- (double)startTime
{
  return self->_startTime;
}

- (void)setUrlResponse:(id)a3
{
}

- (ICURLResponseHandler)responseHandler
{
  return self->_responseHandler;
}

- (NSMutableData)responseData
{
  return self->_responseData;
}

- (NSProgress)progress
{
  return self->_progress;
}

- (NSURLRequest)currentURLRequest
{
  return self->_currentURLRequest;
}

- (void)setLastUpdateTime:(double)a3
{
  self->_lastUpdateTime = a3;
}

- (NSURLSessionTask)task
{
  return self->_task;
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)shouldReportLoadURLMetrics
{
  return self->_loadURLMetricsRequestName != 0;
}

- (void)setTask:(id)a3
{
}

- (void)setStartTime:(double)a3
{
  self->_startTime = a3;
}

- (void)setRetryReason:(id)a3
{
}

- (void)setResponseData:(id)a3
{
}

- (void)setHandlingType:(int64_t)a3
{
  self->_handlingType = a3;
}

- (void)setCurrentURLRequest:(id)a3
{
}

- (NSString)retryReason
{
  return self->_retryReason;
}

- (unint64_t)retryCount
{
  return [(ICURLRequest *)self _retryCountForReason:@"other"];
}

- (unint64_t)maxRetryCount
{
  return [(ICURLRequest *)self _maxRetryCountForReason:@"other"];
}

- (NSString)loadURLMetricsRequestName
{
  return self->_loadURLMetricsRequestName;
}

- (int64_t)handlingType
{
  return self->_handlingType;
}

- (BOOL)cancelOnHTTPErrors
{
  return self->_cancelOnHTTPErrors;
}

- (unint64_t)_maxRetryCountForReason:(id)a3
{
  id v4 = a3;
  [(ICURLRequest *)self _ensureValidRetryReason:v4];
  os_unfair_lock_lock(&self->_lock);
  v5 = [(NSMutableDictionary *)self->_maxRetryCounts objectForKey:v4];
  id v6 = v5;
  if (v5) {
    unint64_t v7 = [v5 unsignedIntegerValue];
  }
  else {
    unint64_t v7 = 0x7FFFFFFFFFFFFFFFLL;
  }

  os_unfair_lock_unlock(&self->_lock);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL) {
    unint64_t v7 = [(id)objc_opt_class() _defaultMaxRetryCountForReason:v4];
  }

  return v7;
}

- (unint64_t)_retryCountForReason:(id)a3
{
  id v4 = a3;
  [(ICURLRequest *)self _ensureValidRetryReason:v4];
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(NSMutableDictionary *)self->_retryCounts objectForKey:v4];

  unint64_t v7 = [v6 unsignedIntegerValue];
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)_ensureValidRetryReason:(id)a3
{
  id v5 = a3;
  id v7 = v5;
  if (!v5 || [v5 isEqual:0])
  {
    id v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:self file:@"ICURLRequest.m" lineNumber:272 description:@"There is no retry count for ICURLResponseHandlingRetryReasonNone."];
  }
}

- (void)buildURLRequestWithCompletionHandler:(id)a3
{
  os_signpost_id_t v13 = (void (**)(id, void *, void))a3;
  currentURLRequest = self->_currentURLRequest;
  if (!currentURLRequest) {
    currentURLRequest = self->_urlRequest;
  }
  id v5 = (void *)[(NSURLRequest *)currentURLRequest mutableCopy];
  id v6 = [(ICURLRequest *)self requestContext];
  id v7 = [v5 valueForHTTPHeaderField:@"User-Agent"];

  if (!v7)
  {
    uint64_t v8 = [v6 userAgent];
    [v5 setValue:v8 forHTTPHeaderField:@"User-Agent"];
  }
  os_signpost_id_t v9 = [v5 valueForHTTPHeaderField:@"Accept-Language"];

  if (!v9)
  {
    id v10 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v11 = [v10 objectForKey:@"AppleLanguages"];

    if ([v11 count])
    {
      v12 = [v11 objectAtIndex:0];
    }
    else
    {
      v12 = @"en";
    }
    [v5 setValue:v12 forHTTPHeaderField:@"Accept-Language"];
  }
  v13[2](v13, v5, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_aggregatedPerformanceMetrics, 0);
  objc_storeStrong((id *)&self->_retryReason, 0);
  objc_storeStrong((id *)&self->_avURLAsset, 0);
  objc_storeStrong((id *)&self->_avDownloadOptions, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_responseDataURL, 0);
  objc_storeStrong((id *)&self->_responseData, 0);
  objc_storeStrong((id *)&self->_urlResponse, 0);
  objc_storeStrong((id *)&self->_currentURLRequest, 0);
  objc_storeStrong((id *)&self->_waitSemaphore, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_responseHandler, 0);
  objc_storeStrong((id *)&self->_resumeData, 0);
  objc_storeStrong((id *)&self->_requestContext, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_loadURLMetricsRequestName, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);
  objc_storeStrong((id *)&self->_retryCounts, 0);
  objc_storeStrong((id *)&self->_maxRetryCounts, 0);

  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)dealloc
{
  [(NSMutableArray *)self->_observers removeAllObjects];
  v3.receiver = self;
  v3.super_class = (Class)ICURLRequest;
  [(ICURLRequest *)&v3 dealloc];
}

- (void)setLastProgressUpdateTime:(double)a3
{
  self->_lastProgressUpdateTime = a3;
}

- (double)lastProgressUpdateTime
{
  return self->_lastProgressUpdateTime;
}

- (void)setAVURLAsset:(id)a3
{
}

- (AVURLAsset)avURLAsset
{
  return self->_avURLAsset;
}

- (void)setAVDownloadOptions:(id)a3
{
}

- (NSDictionary)avDownloadOptions
{
  return self->_avDownloadOptions;
}

- (void)setError:(id)a3
{
}

- (void)setResponseDataURL:(id)a3
{
}

- (NSURL)responseDataURL
{
  return self->_responseDataURL;
}

- (void)setWaitSemaphore:(id)a3
{
}

- (OS_dispatch_semaphore)waitSemaphore
{
  return self->_waitSemaphore;
}

- (void)setResponseHandler:(id)a3
{
}

- (NSData)resumeData
{
  return self->_resumeData;
}

- (void)setRetryDelay:(double)a3
{
  self->_retryDelay = a3;
}

- (double)retryDelay
{
  return self->_retryDelay;
}

- (void)setRedirectCount:(unint64_t)a3
{
  self->_redirectCount = a3;
}

- (void)enableLoadURLMetricsWithRequestName:(id)a3
{
}

- (void)_incrementRetryCountForReason:(id)a3
{
  id v10 = a3;
  [(ICURLRequest *)self _ensureValidRetryReason:v10];
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableDictionary *)self->_retryCounts objectForKey:v10];
  uint64_t v5 = [v4 unsignedIntegerValue];
  id v6 = [NSNumber numberWithUnsignedInteger:v5 + 1];

  retryCounts = self->_retryCounts;
  if (!retryCounts)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    os_signpost_id_t v9 = self->_retryCounts;
    self->_retryCounts = v8;

    retryCounts = self->_retryCounts;
  }
  [(NSMutableDictionary *)retryCounts setObject:v6 forKey:v10];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_setMaxRetryCount:(unint64_t)a3 forReason:(id)a4
{
  id v10 = a4;
  -[ICURLRequest _ensureValidRetryReason:](self, "_ensureValidRetryReason:");
  os_unfair_lock_lock(&self->_lock);
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  maxRetryCounts = self->_maxRetryCounts;
  if (!maxRetryCounts)
  {
    uint64_t v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    os_signpost_id_t v9 = self->_maxRetryCounts;
    self->_maxRetryCounts = v8;

    maxRetryCounts = self->_maxRetryCounts;
  }
  [(NSMutableDictionary *)maxRetryCounts setObject:v6 forKey:v10];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)setMaxRetryCount:(unint64_t)a3
{
}

uint64_t __28__ICURLRequest_updateState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) ICURLRequest:*(void *)(a1 + 40) didChangeState:*(void *)(a1 + 48)];
}

- (void)unregisterObserver:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_observers removeObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)registerObserver:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableArray *)self->_observers addObject:v5];

  os_unfair_lock_unlock(p_lock);
}

- (ICURLRequest)initWithURLRequest:(id)a3 requestContext:(id)a4
{
  return [(ICURLRequest *)self initWithURLRequest:a3 requestContext:a4 resumeData:0];
}

- (ICURLRequest)initWithURL:(id)a3 requestContext:(id)a4 resumeData:(id)a5
{
  uint64_t v8 = (void *)MEMORY[0x1E4F18DA8];
  id v9 = a5;
  id v10 = a4;
  id v11 = [v8 requestWithURL:a3];
  v12 = [(ICURLRequest *)self initWithURLRequest:v11 requestContext:v10 resumeData:v9];

  return v12;
}

- (ICURLRequest)initWithURL:(id)a3 requestContext:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F18DA8];
  id v7 = a4;
  uint64_t v8 = [v6 requestWithURL:a3];
  id v9 = [(ICURLRequest *)self initWithURLRequest:v8 requestContext:v7 resumeData:0];

  return v9;
}

+ (Class)_responseHandlerClass
{
  return (Class)objc_opt_class();
}

+ (unint64_t)_defaultMaxRetryCountForReason:(id)a3
{
  objc_super v3 = (__CFString *)a3;
  id v4 = @"authentication-performed";
  if (v3 == @"authentication-performed")
  {

    goto LABEL_7;
  }
  char v5 = [(__CFString *)v3 isEqual:@"authentication-performed"];

  if (v5)
  {
LABEL_7:
    unint64_t v6 = 1;
    goto LABEL_8;
  }
  if (v3 != @"other") {
    [(__CFString *)v3 isEqual:@"other"];
  }
  unint64_t v6 = 0;
LABEL_8:

  return v6;
}

@end