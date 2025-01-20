@interface SWCDownloadTaskState
- (BOOL)isDiscretionary;
- (NSDate)dateScheduled;
- (NSError)cancellationError;
- (NSMutableArray)completionHandlers;
- (NSMutableData)buffer;
- (NSString)taskDescription;
- (NSURLSessionDataTask)task;
- (SWCDownloadTaskState)initWithDownloader:(id)a3 domain:(id)a4 downloadRoute:(unsigned __int8)a5;
- (SWCDownloader)downloader;
- (_SWCDomain)domain;
- (id)debugDescription;
- (id)description;
- (id)redactedDescription;
- (unsigned)downloadRoute;
- (void)cancelTaskWithError:(id)a3;
- (void)receiveSIGTERMSignal;
- (void)resumeTask;
- (void)setBuffer:(id)a3;
- (void)setCancellationError:(id)a3;
- (void)setDiscretionary:(BOOL)a3;
- (void)setDownloadRoute:(unsigned __int8)a3;
@end

@implementation SWCDownloadTaskState

- (SWCDownloadTaskState)initWithDownloader:(id)a3 domain:(id)a4 downloadRoute:(unsigned __int8)a5
{
  id v8 = a3;
  id v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SWCDownloadTaskState;
  v10 = [(SWCDownloadTaskState *)&v19 init];
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_downloader, v8);
    memset(out, 0, sizeof(out));
    uuid_generate_random(out);
    memset(v20, 0, 37);
    uuid_unparse(out, v20);
    v12 = (NSString *)[objc_alloc((Class)NSString) initWithFormat:@"AASA-%s", v20];
    taskDescription = v11->_taskDescription;
    v11->_taskDescription = v12;

    objc_storeStrong((id *)&v11->_domain, a4);
    v11->_downloadRoute = a5;
    v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    completionHandlers = v11->_completionHandlers;
    v11->_completionHandlers = v14;

    v16 = (NSMutableData *)objc_alloc_init((Class)NSMutableData);
    buffer = v11->_buffer;
    v11->_buffer = v16;
  }
  return v11;
}

- (void)receiveSIGTERMSignal
{
  self->_transaction = 0;
  _objc_release_x1();
}

- (void)resumeTask
{
  p_task = &self->_task;
  if (!self->_task)
  {
    v6 = [(SWCDownloadTaskState *)self downloader];
    v7 = v6;
    if (v6)
    {
      id v8 = [v6 _sessionForTaskState:self];
      if (!v8)
      {
        v21 = +[NSAssertionHandler currentHandler];
        [v21 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:385 description:@"Failed to get/create URL session"];
      }
      id v9 = [(SWCDownloadTaskState *)self domain];
      v10 = [v7 _URLRequestWithDomain:v9 downloadRoute:-[SWCDownloadTaskState downloadRoute](self, "downloadRoute")];

      if (!v10)
      {
        v22 = +[NSAssertionHandler currentHandler];
        [v22 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:387 description:@"Failed to create URL request"];
      }
      v11 = [v8 dataTaskWithRequest:v10];
      if (!v11)
      {
        v23 = +[NSAssertionHandler currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"SWCDownloader.mm" lineNumber:389 description:@"Failed to get data task from URL session"];
      }
      v12 = [(SWCDownloadTaskState *)self taskDescription];
      [v11 setTaskDescription:v12];

      objc_storeStrong((id *)p_task, v11);
      v13 = (NSDate *)[objc_alloc((Class)NSDate) initWithTimeIntervalSince1970:(double)time(0)];
      dateScheduled = self->_dateScheduled;
      self->_dateScheduled = v13;

      id v15 = objc_alloc((Class)NSString);
      v16 = [(_SWCDomain *)self->_domain redactedDescription];
      id v17 = [v15 initWithFormat:@"com.apple.swc.aasa.dl-%@", v16];
      [v17 UTF8String];
      v18 = (OS_os_transaction *)os_transaction_create();
      transaction = self->_transaction;
      self->_transaction = v18;

      if (qword_10003B1B0 != -1) {
        dispatch_once(&qword_10003B1B0, &stru_100034918);
      }
      v20 = qword_10003B1A8;
      if (os_log_type_enabled((os_log_t)qword_10003B1A8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = self;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Beginning data task %@", buf, 0xCu);
      }
      [v11 resume];
    }
  }
}

- (void)cancelTaskWithError:(id)a3
{
  objc_storeStrong((id *)&self->_cancellationError, a3);
  id v6 = a3;
  transaction = self->_transaction;
  self->_transaction = 0;

  [(NSURLSessionDataTask *)self->_task cancel];
}

- (id)description
{
  id v3 = objc_alloc((Class)NSString);
  v4 = [(NSURLSessionDataTask *)self->_task taskDescription];
  domain = self->_domain;
  NSUInteger v6 = [(NSMutableData *)self->_buffer length];
  v7 = sub_1000050D8(self->_downloadRoute);
  id v8 = [v3 initWithFormat:@"%@ { domain: %@, bytes: %llu, route: %@ }", v4, domain, v6, v7];

  return v8;
}

- (id)debugDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = objc_opt_class();
  v5 = [(SWCDownloadTaskState *)self description];
  id v6 = [v3 initWithFormat:@"<%@ %p> %@", v4, self, v5];

  return v6;
}

- (id)redactedDescription
{
  id v3 = objc_alloc((Class)NSString);
  uint64_t v4 = [(NSURLSessionDataTask *)self->_task taskDescription];
  v5 = [(_SWCDomain *)self->_domain redactedDescription];
  NSUInteger v6 = [(NSMutableData *)self->_buffer length];
  v7 = sub_1000050D8(self->_downloadRoute);
  id v8 = [v3 initWithFormat:@"%@ { domain: %@, bytes: %llu, route: %@ }", v4, v5, v6, v7];

  return v8;
}

- (SWCDownloader)downloader
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_downloader);

  return (SWCDownloader *)WeakRetained;
}

- (NSURLSessionDataTask)task
{
  return (NSURLSessionDataTask *)objc_getProperty(self, a2, 32, 1);
}

- (NSError)cancellationError
{
  return (NSError *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCancellationError:(id)a3
{
}

- (NSString)taskDescription
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (NSDate)dateScheduled
{
  return (NSDate *)objc_getProperty(self, a2, 56, 1);
}

- (_SWCDomain)domain
{
  return (_SWCDomain *)objc_getProperty(self, a2, 64, 1);
}

- (BOOL)isDiscretionary
{
  return self->_discretionary;
}

- (void)setDiscretionary:(BOOL)a3
{
  self->_discretionary = a3;
}

- (unsigned)downloadRoute
{
  return self->_downloadRoute;
}

- (void)setDownloadRoute:(unsigned __int8)a3
{
  self->_downloadRoute = a3;
}

- (NSMutableArray)completionHandlers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 72, 1);
}

- (NSMutableData)buffer
{
  return (NSMutableData *)objc_getProperty(self, a2, 80, 1);
}

- (void)setBuffer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_domain, 0);
  objc_storeStrong((id *)&self->_dateScheduled, 0);
  objc_storeStrong((id *)&self->_taskDescription, 0);
  objc_storeStrong((id *)&self->_cancellationError, 0);
  objc_storeStrong((id *)&self->_task, 0);
  objc_destroyWeak((id *)&self->_downloader);

  objc_storeStrong((id *)&self->_transaction, 0);
}

@end