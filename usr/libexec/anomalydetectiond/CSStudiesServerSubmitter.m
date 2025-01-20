@interface CSStudiesServerSubmitter
- (CSStudiesServerSubmitter)initWithEndpoint:(id)a3 authorization:(id)a4 subjectToken:(id)a5;
- (NSMutableDictionary)completionHandlers;
- (NSString)authorization;
- (NSString)subjectToken;
- (NSURL)endpoint;
- (NSURLSession)session;
- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4;
- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5;
- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7;
- (void)createSession;
- (void)dealloc;
- (void)setSubjectToken:(id)a3;
- (void)submitFileWithURL:(id)a3 andCompletionHandler:(id)a4;
- (void)updateRegistrationWithSubjectToken:(id)a3;
@end

@implementation CSStudiesServerSubmitter

- (void)createSession
{
  id v8 = +[NSUUID UUID];
  v3 = [v8 UUIDString];
  v4 = +[NSString stringWithFormat:@"com.apple.anomalydetectiond.CSStudiesServerSubmitter:%@", v3];
  v5 = +[NSURLSessionConfiguration backgroundSessionConfigurationWithIdentifier:v4];

  [v5 setDiscretionary:1];
  [v5 setAllowsCellularAccess:0];
  [v5 setWaitsForConnectivity:1];
  [v5 setTimeoutIntervalForResource:604800.0];
  v6 = +[NSURLSession sessionWithConfiguration:v5 delegate:self delegateQueue:0];
  session = self->_session;
  self->_session = v6;
}

- (CSStudiesServerSubmitter)initWithEndpoint:(id)a3 authorization:(id)a4 subjectToken:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v17.receiver = self;
  v17.super_class = (Class)CSStudiesServerSubmitter;
  v12 = [(CSStudiesServerSubmitter *)&v17 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_endpoint, a3);
    objc_storeStrong((id *)&v13->_authorization, a4);
    objc_storeStrong((id *)&v13->_subjectToken, a5);
    [(CSStudiesServerSubmitter *)v13 createSession];
    v14 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    completionHandlers = v13->_completionHandlers;
    v13->_completionHandlers = v14;
  }
  return v13;
}

- (void)updateRegistrationWithSubjectToken:(id)a3
{
  id v4 = a3;
  if (qword_1003DB790 != -1) {
    dispatch_once(&qword_1003DB790, &stru_10039B070);
  }
  v5 = qword_1003DB798;
  if (os_log_type_enabled((os_log_t)qword_1003DB798, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Updating submitter registration", v6, 2u);
  }
  [(CSStudiesServerSubmitter *)self setSubjectToken:v4];
}

- (void)dealloc
{
  v3 = [(CSStudiesServerSubmitter *)self session];
  [v3 finishTasksAndInvalidate];

  v4.receiver = self;
  v4.super_class = (Class)CSStudiesServerSubmitter;
  [(CSStudiesServerSubmitter *)&v4 dealloc];
}

- (void)submitFileWithURL:(id)a3 andCompletionHandler:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  if (qword_1003DB790 != -1) {
    dispatch_once(&qword_1003DB790, &stru_10039B070);
  }
  id v8 = qword_1003DB798;
  if (os_log_type_enabled((os_log_t)qword_1003DB798, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "submitFileWithURL", buf, 2u);
  }
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  *(void *)buf = 0;
  v30 = buf;
  uint64_t v31 = 0x2020000000;
  char v32 = 0;
  session = self->_session;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100018124;
  v25[3] = &unk_10039B050;
  id v11 = v6;
  id v26 = v11;
  v28 = buf;
  v12 = v9;
  v27 = v12;
  [(NSURLSession *)session getTasksWithCompletionHandler:v25];
  dispatch_time_t v13 = dispatch_time(0, 60000000000);
  if (dispatch_semaphore_wait(v12, v13))
  {
    v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:4610 userInfo:0];
    v7[2](v7, 0, v14);
  }
  else if (v30[24])
  {
    v14 = +[NSError errorWithDomain:NSCocoaErrorDomain code:516 userInfo:0];
    v7[2](v7, 0, v14);
  }
  else
  {
    v15 = [(CSStudiesServerSubmitter *)self endpoint];
    v14 = +[NSMutableURLRequest requestWithURL:v15];

    v16 = [(CSStudiesServerSubmitter *)self authorization];
    [v14 setValue:v16 forHTTPHeaderField:@"Authorization"];

    objc_super v17 = [(CSStudiesServerSubmitter *)self subjectToken];
    [v14 setValue:v17 forHTTPHeaderField:@"X-HDS-Subject-Authorization"];

    [v14 setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [v14 setValue:@"application/octet-stream" forHTTPHeaderField:@"Content-Type"];
    [v14 setAllowsCellularAccess:0];
    [v14 setHTTPMethod:@"POST"];
    v18 = [(CSStudiesServerSubmitter *)self session];
    v19 = [v18 uploadTaskWithRequest:v14 fromFile:v11];

    v20 = [v11 absoluteString];
    [v19 setTaskDescription:v20];

    v21 = +[NSDate now];
    [v19 setEarliestBeginDate:v21];

    completionHandlers = self->_completionHandlers;
    v23 = objc_retainBlock(v7);
    v24 = [v19 taskDescription];
    [(NSMutableDictionary *)completionHandlers setObject:v23 forKey:v24];

    [v19 resume];
  }

  _Block_object_dispose(buf, 8);
}

- (void)URLSession:(id)a3 task:(id)a4 didCompleteWithError:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v9 taskDescription];
  if (v11)
  {
    v12 = [(NSMutableDictionary *)self->_completionHandlers objectForKey:v11];

    if (v12)
    {
      uint64_t v13 = [(NSMutableDictionary *)self->_completionHandlers objectForKey:v11];
      v14 = (void (**)(void, void, void))v13;
      if (v10)
      {
        (*(void (**)(uint64_t, void, id))(v13 + 16))(v13, 0, v10);
      }
      else
      {
        v23 = [v9 response];
        ((void (**)(void, void *, void))v14)[2](v14, v23, 0);

        [(NSMutableDictionary *)self->_completionHandlers removeObjectForKey:v11];
      }

      goto LABEL_16;
    }
    if (qword_1003DB790 != -1) {
      dispatch_once(&qword_1003DB790, &stru_10039B070);
    }
    v22 = (void *)qword_1003DB798;
    if (os_log_type_enabled((os_log_t)qword_1003DB798, OS_LOG_TYPE_ERROR))
    {
      v16 = v22;
      objc_super v17 = [v8 configuration];
      v18 = [v17 identifier];
      int v24 = 138543618;
      v25 = v18;
      __int16 v26 = 2114;
      v27 = v11;
      v19 = "Got called for %{public}@ with non existent file: %{public}@";
      v20 = v16;
      uint32_t v21 = 22;
      goto LABEL_13;
    }
  }
  else
  {
    if (qword_1003DB790 != -1) {
      dispatch_once(&qword_1003DB790, &stru_10039B070);
    }
    v15 = (void *)qword_1003DB798;
    if (os_log_type_enabled((os_log_t)qword_1003DB798, OS_LOG_TYPE_ERROR))
    {
      v16 = v15;
      objc_super v17 = [v8 configuration];
      v18 = [v17 identifier];
      int v24 = 138543362;
      v25 = v18;
      v19 = "Got called with task with no file for: %{public}@";
      v20 = v16;
      uint32_t v21 = 12;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, v19, (uint8_t *)&v24, v21);
    }
  }
LABEL_16:
}

- (void)URLSession:(id)a3 task:(id)a4 didSendBodyData:(int64_t)a5 totalBytesSent:(int64_t)a6 totalBytesExpectedToSend:(int64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  if (qword_1003DB790 != -1) {
    dispatch_once(&qword_1003DB790, &stru_10039B070);
  }
  uint64_t v13 = (void *)qword_1003DB798;
  if (os_log_type_enabled((os_log_t)qword_1003DB798, OS_LOG_TYPE_INFO))
  {
    v14 = v13;
    v15 = [v11 configuration];
    v16 = [v15 identifier];
    int v17 = 138413314;
    id v18 = v12;
    __int16 v19 = 2048;
    int64_t v20 = a5;
    __int16 v21 = 2048;
    int64_t v22 = a6;
    __int16 v23 = 2048;
    int64_t v24 = a7;
    __int16 v25 = 2112;
    __int16 v26 = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Got called back with task: %@ and bytesSent: %lld and totalBytesSent: %lld and totalBytesExpectedToSend: %lld and id: %@", (uint8_t *)&v17, 0x34u);
  }
}

- (void)URLSession:(id)a3 didBecomeInvalidWithError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (qword_1003DB790 != -1) {
    dispatch_once(&qword_1003DB790, &stru_10039B070);
  }
  id v8 = qword_1003DB798;
  if (os_log_type_enabled((os_log_t)qword_1003DB798, OS_LOG_TYPE_ERROR))
  {
    int v9 = 138543362;
    id v10 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Session got invalidated with error: %{public}@", (uint8_t *)&v9, 0xCu);
  }
  [(CSStudiesServerSubmitter *)self createSession];
}

- (NSURLSession)session
{
  return (NSURLSession *)objc_getProperty(self, a2, 8, 1);
}

- (NSURL)endpoint
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)authorization
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)subjectToken
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setSubjectToken:(id)a3
{
}

- (NSMutableDictionary)completionHandlers
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionHandlers, 0);
  objc_storeStrong((id *)&self->_subjectToken, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_endpoint, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end