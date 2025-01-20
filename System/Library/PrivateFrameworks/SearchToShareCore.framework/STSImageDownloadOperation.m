@interface STSImageDownloadOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSURLRequest)request;
- (STSImageDownloadOperation)initWithRequest:(id)a3 session:(id)a4 begin:(id)a5 progress:(id)a6 completion:(id)a7;
- (void)_markAsCompleted;
- (void)cancel;
- (void)completedWithResponse:(id)a3 location:(id)a4 timingData:(id)a5 error:(id)a6;
- (void)main;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)start;
- (void)updateProgressWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4;
@end

@implementation STSImageDownloadOperation

- (STSImageDownloadOperation)initWithRequest:(id)a3 session:(id)a4 begin:(id)a5 progress:(id)a6 completion:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v29.receiver = self;
  v29.super_class = (Class)STSImageDownloadOperation;
  v18 = [(STSImageDownloadOperation *)&v29 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_request, a3);
    uint64_t v20 = [v15 copy];
    id begin = v19->_begin;
    v19->_id begin = (id)v20;

    uint64_t v22 = [v16 copy];
    id progress = v19->_progress;
    v19->_id progress = (id)v22;

    uint64_t v24 = MEMORY[0x230FB7F40](v17);
    id completion = v19->_completion;
    v19->_id completion = (id)v24;

    uint64_t v26 = [v14 downloadTaskWithRequest:v13];
    task = v19->_task;
    v19->_task = (NSURLSessionDownloadTask *)v26;
  }
  return v19;
}

- (void)start
{
  if ([(STSImageDownloadOperation *)self isCancelled])
  {
    [(STSImageDownloadOperation *)self setFinished:1];
  }
  else
  {
    [(STSImageDownloadOperation *)self setExecuting:1];
    [(STSImageDownloadOperation *)self main];
  }
}

- (void)main
{
  id begin = (void (**)(id, SEL))self->_begin;
  if (begin) {
    begin[2](begin, a2);
  }
  task = self->_task;

  [(NSURLSessionDownloadTask *)task resume];
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isExecuting
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL executing = v2->_executing;
  objc_sync_exit(v2);

  return executing;
}

- (void)setExecuting:(BOOL)a3
{
  if ([(STSImageDownloadOperation *)self isExecuting] != a3)
  {
    [(STSImageDownloadOperation *)self willChangeValueForKey:@"isExecuting"];
    v5 = self;
    objc_sync_enter(v5);
    v5->_BOOL executing = a3;
    objc_sync_exit(v5);

    [(STSImageDownloadOperation *)v5 didChangeValueForKey:@"isExecuting"];
  }
}

- (void)cancel
{
  [(NSURLSessionDownloadTask *)self->_task cancel];
  v3.receiver = self;
  v3.super_class = (Class)STSImageDownloadOperation;
  [(STSImageDownloadOperation *)&v3 cancel];
}

- (BOOL)isFinished
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL finished = v2->_finished;
  objc_sync_exit(v2);

  return finished;
}

- (void)setFinished:(BOOL)a3
{
  if ([(STSImageDownloadOperation *)self isFinished] != a3)
  {
    [(STSImageDownloadOperation *)self willChangeValueForKey:@"isFinished"];
    v5 = self;
    objc_sync_enter(v5);
    v5->_BOOL finished = a3;
    objc_sync_exit(v5);

    [(STSImageDownloadOperation *)v5 didChangeValueForKey:@"isFinished"];
  }
}

- (void)updateProgressWithTotalBytesWritten:(int64_t)a3 totalBytesExpectedToWrite:(int64_t)a4
{
  id progress = (void (**)(id, int64_t, int64_t))self->_progress;
  if (progress) {
    progress[2](progress, a3, a4);
  }
}

- (void)completedWithResponse:(id)a3 location:(id)a4 timingData:(id)a5 error:(id)a6
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v14 = [v10 statusCode];
    uint64_t v15 = v14;
    if (v11 && v14 == 200) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = -1;
  }
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v27 = v13;
    _os_log_impl(&dword_22F3DE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "image downloaded error %@", buf, 0xCu);
  }
LABEL_8:
  id v23 = 0;
  [v11 getResourceValue:&v23 forKey:*MEMORY[0x263EFF688] error:0];
  id v16 = v23;
  v24[0] = @"STSImageDownloadOperationStatusCode";
  uint64_t v17 = [NSNumber numberWithInteger:v15];
  v18 = (void *)v17;
  v19 = &unk_26E2BA900;
  if (v16) {
    v19 = v16;
  }
  v25[0] = v17;
  v25[1] = v19;
  v24[1] = @"STSImageDownloadOperationSize";
  v24[2] = @"STSImageDownloadOperationTimingData";
  if (v12) {
    id v20 = v12;
  }
  else {
    id v20 = (id)MEMORY[0x263EFFA78];
  }
  v25[2] = v20;
  v21 = [NSDictionary dictionaryWithObjects:v25 forKeys:v24 count:3];

  id completion = (void (**)(id, id, id, void *, id))self->_completion;
  if (completion) {
    completion[2](completion, v10, v11, v21, v13);
  }
  [(STSImageDownloadOperation *)self _markAsCompleted];
}

- (void)_markAsCompleted
{
  if ([(STSImageDownloadOperation *)self isExecuting])
  {
    [(STSImageDownloadOperation *)self setExecuting:0];
    [(STSImageDownloadOperation *)self setFinished:1];
  }
}

- (NSURLRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_feedback, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong(&self->_progress, 0);
  objc_storeStrong(&self->_begin, 0);

  objc_storeStrong((id *)&self->_task, 0);
}

@end