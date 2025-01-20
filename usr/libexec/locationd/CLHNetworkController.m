@interface CLHNetworkController
- (CLHEndpointSelector)endpointSelector;
- (CLHNetworkController)initWithQueue:(id)a3;
- (CLHNetworkControllerDelegate)delegate;
- (double)timeout;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5;
- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setEndpointSelector:(id)a3;
- (void)setTimeout:(double)a3;
- (void)submitRequest:(id)a3;
@end

@implementation CLHNetworkController

- (CLHNetworkController)initWithQueue:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CLHNetworkController;
  v4 = [(CLHNetworkController *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_queue = (OS_dispatch_queue *)a3;
    v6 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    v5->_operationQueue = v6;
    [(NSOperationQueue *)v6 setUnderlyingQueue:a3];
    [(NSOperationQueue *)v5->_operationQueue setName:@"CLHNetworkControllerQueue"];
    v5->_session = 0;
    v5->_activeTasks = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    v5->_dateFormatter = v7;
    [(NSDateFormatter *)v7 setDateFormat:@"EEE',' dd MMM yyyy HH':'mm':'ss zzz"];
  }
  return v5;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CLHNetworkController;
  [(CLHNetworkController *)&v3 dealloc];
}

- (void)submitRequest:(id)a3
{
  dispatch_assert_queue_V2([(NSOperationQueue *)self->_operationQueue underlyingQueue]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023217C0);
  }
  v5 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v6 = [(NSMutableArray *)self->_activeTasks count];
    int v15 = 68289539;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2113;
    id v20 = a3;
    __int16 v21 = 1026;
    LODWORD(v22) = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network NetworkController received request\", \"request\":%{private, location:escape_only}@, \"activeTasks\":%{public}d}", (uint8_t *)&v15, 0x22u);
  }
  session = self->_session;
  if (!session)
  {
    v8 = +[NSURLSession sessionWithConfiguration:delegate:delegateQueue:](NSURLSession, "sessionWithConfiguration:delegate:delegateQueue:", +[NSURLSessionConfiguration defaultSessionConfiguration], self, self->_operationQueue);
    self->_session = v8;
    objc_super v9 = v8;
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023217C0);
    }
    v10 = qword_102419568;
    BOOL v11 = os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG);
    session = self->_session;
    if (v11)
    {
      int v15 = 68289282;
      int v16 = 0;
      __int16 v17 = 2082;
      v18 = "";
      __int16 v19 = 2114;
      id v20 = session;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network Created NSURLSession\", \"session\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x1Cu);
      session = self->_session;
    }
  }
  v12 = -[NSURLSession dataTaskWithRequest:](session, "dataTaskWithRequest:", [a3 URLRequest]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023217C0);
  }
  v13 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    v14 = self->_session;
    int v15 = 68289538;
    int v16 = 0;
    __int16 v17 = 2082;
    v18 = "";
    __int16 v19 = 2114;
    id v20 = v14;
    __int16 v21 = 2114;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network Created DataTask\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v15, 0x26u);
  }
  [(NSMutableArray *)self->_activeTasks addObject:v12];
  [(NSURLSessionDataTask *)v12 resume];
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  dispatch_assert_queue_V2([(NSOperationQueue *)self->_operationQueue underlyingQueue]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023217C0);
  }
  objc_super v9 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 68289538;
    v10[1] = 0;
    __int16 v11 = 2082;
    v12 = "";
    __int16 v13 = 2114;
    id v14 = a3;
    __int16 v15 = 2114;
    id v16 = a4;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network task didSendBodyData\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)v10, 0x26u);
  }
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  dispatch_assert_queue_V2([(NSOperationQueue *)self->_operationQueue underlyingQueue]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023217C0);
  }
  objc_super v9 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 68289794;
    int v14 = 0;
    __int16 v15 = 2082;
    id v16 = "";
    __int16 v17 = 2114;
    id v18 = a3;
    __int16 v19 = 2114;
    id v20 = a4;
    __int16 v21 = 2114;
    id v22 = a5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network task did complete with error\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"error\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x30u);
  }
  if ([(NSMutableArray *)self->_activeTasks containsObject:a4])
  {
    [(NSMutableArray *)self->_activeTasks removeObject:a4];
    if (![(NSMutableArray *)self->_activeTasks count])
    {
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023217C0);
      }
      v10 = qword_102419568;
      if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
      {
        int v13 = 68289282;
        int v14 = 0;
        __int16 v15 = 2082;
        id v16 = "";
        __int16 v17 = 2114;
        id v18 = a3;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network Invalidating NSURLSession\", \"session\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x1Cu);
      }
      [(NSURLSession *)self->_session finishTasksAndInvalidate];

      self->_session = 0;
    }
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023217C0);
    }
    __int16 v11 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_FAULT))
    {
      int v13 = 68289538;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      __int16 v17 = 2114;
      id v18 = a3;
      __int16 v19 = 2114;
      id v20 = a4;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "{\"msg%{public}.0s\":\"#network unknown task reported to didCompleteWithError:\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x26u);
      if (qword_102419560 != -1) {
        dispatch_once(&qword_102419560, &stru_1023217C0);
      }
    }
    v12 = qword_102419568;
    if (os_signpost_enabled((os_log_t)qword_102419568))
    {
      int v13 = 68289538;
      int v14 = 0;
      __int16 v15 = 2082;
      id v16 = "";
      __int16 v17 = 2114;
      id v18 = a3;
      __int16 v19 = 2114;
      id v20 = a4;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#network unknown task reported to didCompleteWithError:", "{\"msg%{public}.0s\":\"#network unknown task reported to didCompleteWithError:\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v13, 0x26u);
    }
  }
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveResponse:(id)a5 completionHandler:(id)a6
{
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023217C0);
  }
  __int16 v11 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
  {
    int v17 = 68289538;
    int v18 = 0;
    __int16 v19 = 2082;
    id v20 = "";
    __int16 v21 = 2114;
    id v22 = a3;
    __int16 v23 = 2114;
    id v24 = a4;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#network task didReceiveResponse\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@}", (uint8_t *)&v17, 0x26u);
  }
  v12 = [[self->_dateFormatter dateFromString:[objc_msgSend(objc_msgSend(a5, "allHeaderFields"), "objectForKey:", @"Date")];
  if (v12)
  {
    int v13 = v12;
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023217C0);
    }
    int v14 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEBUG))
    {
      id v15 = [a4 taskIdentifier];
      int v17 = 68289283;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      __int16 v21 = 2049;
      id v22 = v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"injecting data to CoreTime\", \"taskIdentifier\":%{private}lu}", (uint8_t *)&v17, 0x1Cu);
    }
    [(NSDate *)v13 timeIntervalSinceReferenceDate];
    TMSetSourceTime();
  }
  else
  {
    if (qword_102419560 != -1) {
      dispatch_once(&qword_102419560, &stru_1023217C0);
    }
    id v16 = qword_102419568;
    if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 68289026;
      int v18 = 0;
      __int16 v19 = 2082;
      id v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#Warning NSHTTPURLResponse contains date in an obsolete format. Ignoring.\"}", (uint8_t *)&v17, 0x12u);
    }
  }
  (*((void (**)(id, uint64_t))a6 + 2))(a6, 1);
}

- (void)URLSession:(id)a3 dataTask:(id)a4 didReceiveData:(id)a5
{
  dispatch_assert_queue_V2([(NSOperationQueue *)self->_operationQueue underlyingQueue]);
  if (qword_102419560 != -1) {
    dispatch_once(&qword_102419560, &stru_1023217C0);
  }
  v8 = qword_102419568;
  if (os_log_type_enabled((os_log_t)qword_102419568, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 68289794;
    v9[1] = 0;
    __int16 v10 = 2082;
    __int16 v11 = "";
    __int16 v12 = 2114;
    id v13 = a3;
    __int16 v14 = 2114;
    id v15 = a4;
    __int16 v16 = 2114;
    id v17 = a5;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#network task didReceiveData\", \"session\":%{public, location:escape_only}@, \"task\":%{public, location:escape_only}@, \"data\":%{public, location:escape_only}@}", (uint8_t *)v9, 0x30u);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

- (double)timeout
{
  return self->_timeout;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (CLHEndpointSelector)endpointSelector
{
  return self->_endpointSelector;
}

- (void)setEndpointSelector:(id)a3
{
}

- (CLHNetworkControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

@end