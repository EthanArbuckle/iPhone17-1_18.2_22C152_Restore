@interface UGCPhotoDownloadOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (NSData)downloadedImageData;
- (NSError)downloadError;
- (UGCPhotoDownloadOperation)initWithPhotoInfo:(id)a3 completionQueue:(id)a4 completion:(id)a5;
- (void)_completeOperation;
- (void)cancel;
- (void)main;
- (void)start;
@end

@implementation UGCPhotoDownloadOperation

- (UGCPhotoDownloadOperation)initWithPhotoInfo:(id)a3 completionQueue:(id)a4 completion:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)UGCPhotoDownloadOperation;
  v12 = [(UGCPhotoDownloadOperation *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_photoInfo, a3);
    v13->_finished = 0;
    v13->_executing = 0;
    id v14 = [v11 copy];
    id completionBlock = v13->_completionBlock;
    v13->_id completionBlock = v14;

    objc_storeStrong((id *)&v13->_completionQueue, a4);
  }

  return v13;
}

- (void)start
{
  if ([(UGCPhotoDownloadOperation *)self isCancelled])
  {
    [(UGCPhotoDownloadOperation *)self willChangeValueForKey:@"isFinished"];
    self->_finished = 1;
    [(UGCPhotoDownloadOperation *)self didChangeValueForKey:@"isFinished"];
  }
  else
  {
    [(UGCPhotoDownloadOperation *)self willChangeValueForKey:@"isExecuting"];
    self->_executing = 1;
    [(UGCPhotoDownloadOperation *)self didChangeValueForKey:@"isExecuting"];
    [(UGCPhotoDownloadOperation *)self main];
  }
}

- (void)main
{
  id v3 = objc_alloc((Class)NSURLRequest);
  v4 = [(UGCDownloadablePhotoInfo *)self->_photoInfo url];
  [(UGCDownloadablePhotoInfo *)self->_photoInfo timeoutInterval];
  id v5 = [v3 initWithURL:v4 cachePolicy:2];

  objc_initWeak(&location, self);
  v6 = +[NSURLSession sharedSession];
  id v9 = _NSConcreteStackBlock;
  uint64_t v10 = 3221225472;
  id v11 = sub_1004578A0;
  v12 = &unk_1012EAB30;
  objc_copyWeak(&v13, &location);
  v7 = [v6 dataTaskWithRequest:v5 completionHandler:&v9];
  downloadTask = self->_downloadTask;
  self->_downloadTask = v7;

  [(NSURLSessionDataTask *)self->_downloadTask resume];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

- (void)_completeOperation
{
  id v3 = sub_1005777AC();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = [(UGCPhotoDownloadOperation *)self name];
    int v5 = 138412290;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Download operation finished %@", (uint8_t *)&v5, 0xCu);
  }
  [(UGCPhotoDownloadOperation *)self willChangeValueForKey:@"isFinished"];
  [(UGCPhotoDownloadOperation *)self willChangeValueForKey:@"isExecuting"];
  self->_executing = 0;
  self->_finished = 1;
  [(UGCPhotoDownloadOperation *)self didChangeValueForKey:@"isExecuting"];
  [(UGCPhotoDownloadOperation *)self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isFinished
{
  return self->_finished;
}

- (void)cancel
{
  [(NSURLSessionDataTask *)self->_downloadTask cancel];
  v3.receiver = self;
  v3.super_class = (Class)UGCPhotoDownloadOperation;
  [(UGCPhotoDownloadOperation *)&v3 cancel];
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (NSData)downloadedImageData
{
  return self->_downloadedImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadedImageData, 0);
  objc_storeStrong((id *)&self->_downloadError, 0);
  objc_storeStrong((id *)&self->_completionQueue, 0);
  objc_storeStrong((id *)&self->_downloadTask, 0);
  objc_storeStrong(&self->_completionBlock, 0);

  objc_storeStrong((id *)&self->_photoInfo, 0);
}

@end