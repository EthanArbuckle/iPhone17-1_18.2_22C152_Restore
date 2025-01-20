@interface VUIURLRequestOperation
- (NSData)data;
- (NSError)error;
- (NSURLRequest)request;
- (NSURLResponse)response;
- (NSURLSession)session;
- (NSURLSessionDataTask)task;
- (VUIURLRequestOperation)init;
- (VUIURLRequestOperation)initWithRequest:(id)a3;
- (VUIURLRequestOperation)initWithRequest:(id)a3 session:(id)a4;
- (unint64_t)elapsedTimeInMilliseconds;
- (unint64_t)taskStartTime;
- (void)cancel;
- (void)executionDidBegin;
- (void)setData:(id)a3;
- (void)setError:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setSession:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskStartTime:(unint64_t)a3;
@end

@implementation VUIURLRequestOperation

- (VUIURLRequestOperation)init
{
  v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The %@ initializer is not available.", v5 format];

  return 0;
}

- (VUIURLRequestOperation)initWithRequest:(id)a3
{
  return [(VUIURLRequestOperation *)self initWithRequest:a3 session:0];
}

- (VUIURLRequestOperation)initWithRequest:(id)a3 session:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"The %@ parameter must not be nil.", @"request" format];
  }
  v11.receiver = self;
  v11.super_class = (Class)VUIURLRequestOperation;
  v9 = [(VUIURLRequestOperation *)&v11 init];
  if (v9)
  {
    if (initWithRequest_session__onceToken != -1) {
      dispatch_once(&initWithRequest_session__onceToken, &__block_literal_global_10);
    }
    objc_storeStrong((id *)&v9->_request, a3);
    if (!v8)
    {
      id v8 = [MEMORY[0x1E4F290E0] sharedSession];
    }
    objc_storeStrong((id *)&v9->_session, v8);
  }

  return v9;
}

uint64_t __50__VUIURLRequestOperation_initWithRequest_session___block_invoke()
{
  return mach_timebase_info((mach_timebase_info_t)&__TimebaseInfo);
}

- (unint64_t)elapsedTimeInMilliseconds
{
  unint64_t result = [(VUIURLRequestOperation *)self taskStartTime];
  if (result)
  {
    uint64_t v4 = mach_absolute_time();
    unint64_t v5 = [(VUIURLRequestOperation *)self taskStartTime];
    return (v4 - v5) * (__TimebaseInfo / *(_DWORD *)algn_1EADD4BEC) / 0xF4240;
  }
  return result;
}

- (void)executionDidBegin
{
  objc_initWeak(&location, self);
  v3 = [(VUIURLRequestOperation *)self session];
  uint64_t v4 = [(VUIURLRequestOperation *)self request];
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __43__VUIURLRequestOperation_executionDidBegin__block_invoke;
  v9 = &unk_1E6DDD130;
  objc_copyWeak(&v10, &location);
  unint64_t v5 = [v3 dataTaskWithRequest:v4 completionHandler:&v6];

  -[VUIURLRequestOperation setTaskStartTime:](self, "setTaskStartTime:", mach_absolute_time(), v6, v7, v8, v9);
  [v5 resume];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __43__VUIURLRequestOperation_executionDidBegin__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v11 = a2;
  id v7 = a3;
  id v8 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setData:v11];
    [v10 setResponse:v7];
    [v10 setError:v8];
    [v10 _handleResponse:v7 responseData:v11 error:v8];
    [v10 finishExecutionIfPossible];
  }
}

- (void)cancel
{
  v4.receiver = self;
  v4.super_class = (Class)VUIURLRequestOperation;
  [(VUIURLRequestOperation *)&v4 cancel];
  v3 = [(VUIURLRequestOperation *)self task];
  [v3 cancel];

  [(VUIAsynchronousOperation *)self finishExecutionIfPossible];
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void)setRequest:(id)a3
{
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
}

- (NSURLResponse)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSURLSessionDataTask)task
{
  return self->_task;
}

- (void)setTask:(id)a3
{
}

- (unint64_t)taskStartTime
{
  return self->_taskStartTime;
}

- (void)setTaskStartTime:(unint64_t)a3
{
  self->_taskStartTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

@end