@interface AAS3DownloadRequest
- (AAAsyncByteStream_impl)stream;
- (AAS3DownloadRequest)initWithSession:(id)a3 size:(unint64_t)a4 atOffset:(int64_t)a5 destinationBuffer:(char *)a6 destinationStream:(AAAsyncByteStream_impl *)a7 completionSemaphore:(id)a8;
- (AAS3DownloadSession)downloadSession;
- (NSMutableURLRequest)urlRequest;
- (OS_dispatch_semaphore)sem;
- (char)buf;
- (float)pauseInterval;
- (int)createAndResumeTask;
- (int)status;
- (int64_t)offset;
- (unint64_t)nbyte;
- (unsigned)remainingAttempts;
- (void)setBuf:(char *)a3;
- (void)setDownloadSession:(id)a3;
- (void)setNbyte:(unint64_t)a3;
- (void)setOffset:(int64_t)a3;
- (void)setPauseInterval:(float)a3;
- (void)setRemainingAttempts:(unsigned int)a3;
- (void)setSem:(id)a3;
- (void)setStatus:(int)a3;
- (void)setStream:(AAAsyncByteStream_impl *)a3;
- (void)setUrlRequest:(id)a3;
@end

@implementation AAS3DownloadRequest

- (AAS3DownloadRequest)initWithSession:(id)a3 size:(unint64_t)a4 atOffset:(int64_t)a5 destinationBuffer:(char *)a6 destinationStream:(AAAsyncByteStream_impl *)a7 completionSemaphore:(id)a8
{
  id v14 = a3;
  id v15 = a8;
  v27.receiver = self;
  v27.super_class = (Class)AAS3DownloadRequest;
  v16 = [(AAS3DownloadRequest *)&v27 init];
  v17 = v16;
  if (v16)
  {
    objc_storeWeak((id *)&v16->_downloadSession, v14);
    id v18 = objc_alloc((Class)NSMutableURLRequest);
    id v19 = [v14 url];
    v20 = (NSMutableURLRequest *)[v18 initWithURL:v19];
    urlRequest = v17->_urlRequest;
    v17->_urlRequest = v20;

    v17->_nbyte = a4;
    v17->_offset = a5;
    v17->_buf = a6;
    v17->_stream = a7;
    objc_storeWeak((id *)&v17->_sem, v15);
    v17->_remainingAttempts = [v14 maxAttempts];
    [v14 pauseInterval];
    v17->_pauseInterval = v22;
    v17->_status = 0;
    snprintf(__str, 0xC8uLL, "bytes=%llu-%llu", a5, a4 + a5 - 1);
    v23 = v17->_urlRequest;
    v24 = +[NSString stringWithUTF8String:__str];
    [(NSMutableURLRequest *)v23 addValue:v24 forHTTPHeaderField:@"Range"];

    v25 = v17;
  }

  return v17;
}

- (int)createAndResumeTask
{
  if ([(AAS3DownloadRequest *)self remainingAttempts])
  {
    [(AAS3DownloadRequest *)self setRemainingAttempts:[(AAS3DownloadRequest *)self remainingAttempts] - 1];
    objc_initWeak(&location, self);
    v5 = [(AAS3DownloadRequest *)self downloadSession];
    v6 = [(AAS3DownloadSession *)v5 urlSession];
    v7 = [(AAS3DownloadRequest *)self urlRequest];
    v13 = _NSConcreteStackBlock;
    uint64_t v14 = 3254779904;
    id v15 = sub_100021AB8;
    v16 = &unk_1001934D0;
    objc_copyWeak(&v17, &location);
    v8 = [(NSURLSession *)v6 dataTaskWithRequest:v7 completionHandler:&v13];

    if (v8)
    {
      [(NSURLSessionDataTask *)v8 resume];
      int v11 = 0;
    }
    else
    {
      sub_100025AB4((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadRequest createAndResumeTask]", 164, 121, 0, "dataTaskWithRequest", v9, v10, (char)v13);
      int v11 = -1;
    }

    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  else
  {
    sub_100025AB4((uint64_t)"/Library/Caches/com.apple.xbs/Sources/ParallelCompression/AppleArchiveS3/AAS3DownloadStreamURLSession.m", (uint64_t)"-[AAS3DownloadRequest createAndResumeTask]", 150, 121, 0, "no more attempts allowed", v3, v4, (char)v13);
    return -1;
  }
  return v11;
}

- (AAS3DownloadSession)downloadSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloadSession);

  return (AAS3DownloadSession *)WeakRetained;
}

- (void)setDownloadSession:(id)a3
{
}

- (NSMutableURLRequest)urlRequest
{
  return (NSMutableURLRequest *)objc_getProperty(self, a2, 32, 1);
}

- (void)setUrlRequest:(id)a3
{
}

- (unint64_t)nbyte
{
  return self->_nbyte;
}

- (void)setNbyte:(unint64_t)a3
{
  self->_nbyte = a3;
}

- (int64_t)offset
{
  return self->_offset;
}

- (void)setOffset:(int64_t)a3
{
  self->_offset = a3;
}

- (char)buf
{
  return self->_buf;
}

- (void)setBuf:(char *)a3
{
  self->_buf = a3;
}

- (AAAsyncByteStream_impl)stream
{
  return self->_stream;
}

- (void)setStream:(AAAsyncByteStream_impl *)a3
{
  self->_stream = a3;
}

- (OS_dispatch_semaphore)sem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sem);

  return (OS_dispatch_semaphore *)WeakRetained;
}

- (void)setSem:(id)a3
{
}

- (unsigned)remainingAttempts
{
  return self->_remainingAttempts;
}

- (void)setRemainingAttempts:(unsigned int)a3
{
  self->_remainingAttempts = a3;
}

- (float)pauseInterval
{
  return self->_pauseInterval;
}

- (void)setPauseInterval:(float)a3
{
  self->_pauseInterval = a3;
}

- (int)status
{
  return self->_status;
}

- (void)setStatus:(int)a3
{
  self->_status = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_sem);
  objc_storeStrong((id *)&self->_urlRequest, 0);

  objc_destroyWeak((id *)&self->_downloadSession);
}

@end