@interface _TVURLSessionDownloadTaskWrapper
- (_TVURLSessionDownloadTaskWrapper)initWithURL:(id)a3;
- (int64_t)state;
- (void)cancel;
- (void)resumeWithCompletionHandler:(id)a3;
@end

@implementation _TVURLSessionDownloadTaskWrapper

- (_TVURLSessionDownloadTaskWrapper)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_TVURLSessionDownloadTaskWrapper;
  v5 = [(_TVURLSessionDownloadTaskWrapper *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v5->_state = 1;
  }

  return v5;
}

- (int64_t)state
{
  return self->_state;
}

- (void)resumeWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (self->_state == 1)
  {
    v5 = (void *)(self->_downloadTaskID + 1);
    self->_downloadTaskID = (int64_t)v5;
    self->_state = 0;
    objc_initWeak(&location, self);
    uint64_t v6 = (void *)[(NSURL *)self->_url copy];
    v7 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64___TVURLSessionDownloadTaskWrapper_resumeWithCompletionHandler___block_invoke;
    block[3] = &unk_1E6DDDA28;
    id v10 = v6;
    id v8 = v6;
    objc_copyWeak(v12, &location);
    v12[1] = v5;
    id v11 = v4;
    dispatch_async(v7, block);

    objc_destroyWeak(v12);
    objc_destroyWeak(&location);
  }
}

- (void)cancel
{
  self->_state = 1;
  [(NSURLSessionDownloadTask *)self->_downloadTask cancel];
  downloadTask = self->_downloadTask;
  self->_downloadTask = 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end