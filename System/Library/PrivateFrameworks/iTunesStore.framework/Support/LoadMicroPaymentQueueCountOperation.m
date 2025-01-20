@interface LoadMicroPaymentQueueCountOperation
- (BOOL)_loadCountReturningError:(id *)a3;
- (BOOL)_setCountWithResponse:(id)a3 error:(id *)a4;
- (MicroPaymentQueueRequest)request;
- (NSDate)lastQueueCheckDate;
- (NSString)URLBagKey;
- (int64_t)queueItemCount;
- (void)dealloc;
- (void)run;
- (void)setLastQueueCheckDate:(id)a3;
- (void)setQueueItemCount:(int64_t)a3;
- (void)setRequest:(id)a3;
- (void)setURLBagKey:(id)a3;
@end

@implementation LoadMicroPaymentQueueCountOperation

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)LoadMicroPaymentQueueCountOperation;
  [(LoadMicroPaymentQueueCountOperation *)&v3 dealloc];
}

- (void)run
{
  uint64_t v22 = 0;
  objc_super v3 = [(LoadMicroPaymentQueueCountOperation *)self request];
  v4 = [(LoadMicroPaymentQueueCountOperation *)self lastQueueCheckDate];
  if (v4
    && (v5 = v4, [(NSDate *)v4 timeIntervalSinceNow], v6 < 2.22044605e-16)
    && (id v7 = objc_msgSend(-[LoadMicroPaymentQueueCountOperation loadedURLBagWithContext:returningError:](self, "loadedURLBagWithContext:returningError:", +[SSURLBagContext contextWithBagType:](SSURLBagContext, "contextWithBagType:", -[MicroPaymentQueueRequest URLBagType](v3, "URLBagType")), 0), "valueForKey:", @"p2-in-app-download-queue-check-interval")) != 0&& (v8 = v7, -[NSDate timeIntervalSinceNow](v5, "timeIntervalSinceNow"), v10 = v9, objc_msgSend(v8, "doubleValue"), v10 >= -v11))
  {
    id v14 = +[SSLogConfig sharedDaemonConfig];
    if (!v14) {
      id v14 = +[SSLogConfig sharedConfig];
    }
    unsigned int v15 = [v14 shouldLog];
    if ([v14 shouldLogToDisk]) {
      int v16 = v15 | 2;
    }
    else {
      int v16 = v15;
    }
    if (!os_log_type_enabled((os_log_t)[v14 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v16 &= 2u;
    }
    if (v16)
    {
      int v23 = 138412546;
      uint64_t v24 = objc_opt_class();
      __int16 v25 = 2112;
      v26 = [(MicroPaymentQueueRequest *)v3 clientIdentity];
      LODWORD(v21) = 22;
      v20 = &v23;
      uint64_t v17 = _os_log_send_and_compose_impl();
      if (v17)
      {
        v18 = (void *)v17;
        v19 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v23, v21);
        free(v18);
        v20 = (int *)v19;
        SSFileLog();
      }
    }
    uint64_t v13 = SSError();
    BOOL v12 = 0;
    uint64_t v22 = v13;
  }
  else
  {
    BOOL v12 = [(LoadMicroPaymentQueueCountOperation *)self _loadCountReturningError:&v22];
    uint64_t v13 = v22;
  }
  -[LoadMicroPaymentQueueCountOperation setError:](self, "setError:", v13, v20);
  [(LoadMicroPaymentQueueCountOperation *)self setSuccess:v12];
}

- (BOOL)_loadCountReturningError:(id *)a3
{
  uint64_t v21 = 0;
  v5 = [(LoadMicroPaymentQueueCountOperation *)self request];
  id v6 = [(MicroPaymentQueueRequest *)v5 newStoreURLOperation:&v21];
  [v6 setDelegate:self];
  if (!v6)
  {
    BOOL v17 = 0;
    if (!a3) {
      return v17;
    }
    goto LABEL_18;
  }
  id v7 = objc_alloc_init(DaemonProtocolDataProvider);
  [v6 setDataProvider:v7];
  id v8 = objc_msgSend(objc_msgSend(v6, "requestProperties"), "mutableCopy");
  objc_msgSend(v8, "setURLBagKey:", -[LoadMicroPaymentQueueCountOperation URLBagKey](self, "URLBagKey"));
  [v6 setRequestProperties:v8];

  id v9 = +[SSLogConfig sharedDaemonConfig];
  if (!v9) {
    id v9 = +[SSLogConfig sharedConfig];
  }
  unsigned int v10 = [v9 shouldLog];
  if ([v9 shouldLogToDisk]) {
    int v11 = v10 | 2;
  }
  else {
    int v11 = v10;
  }
  if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
    v11 &= 2u;
  }
  if (v11)
  {
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = [(LoadMicroPaymentQueueCountOperation *)self URLBagKey];
    int v22 = 138412802;
    uint64_t v23 = v12;
    __int16 v24 = 2112;
    __int16 v25 = v13;
    __int16 v26 = 2112;
    v27 = v5;
    LODWORD(v20) = 32;
    v19 = &v22;
    uint64_t v14 = _os_log_send_and_compose_impl();
    if (v14)
    {
      unsigned int v15 = (void *)v14;
      int v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v22, v20);
      free(v15);
      v19 = (int *)v16;
      SSFileLog();
    }
  }
  if (-[LoadMicroPaymentQueueCountOperation runSubOperation:returningError:](self, "runSubOperation:returningError:", v6, &v21, v19))BOOL v17 = [(LoadMicroPaymentQueueCountOperation *)self _setCountWithResponse:[(DaemonProtocolDataProvider *)v7 output] error:&v21]; {
  else
  }
    BOOL v17 = 0;

  [v6 setDelegate:0];
  if (a3) {
LABEL_18:
  }
    *a3 = v21;
  return v17;
}

- (BOOL)_setCountWithResponse:(id)a3 error:(id *)a4
{
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) == 0)
  {
    uint64_t v12 = (void *)ISError();
    if (!a4) {
      return isKindOfClass & 1;
    }
    goto LABEL_15;
  }
  id v8 = [a3 objectForKey:@"download-queue-item-count"];
  if (objc_opt_respondsToSelector())
  {
    -[LoadMicroPaymentQueueCountOperation setQueueItemCount:](self, "setQueueItemCount:", (int)[v8 intValue]);
    id v9 = +[SSLogConfig sharedDaemonConfig];
    if (!v9) {
      id v9 = +[SSLogConfig sharedConfig];
    }
    int v10 = [v9 shouldLog];
    int v11 = [v9 shouldLogToDisk] ? v10 | 2 : v10;
    if (!os_log_type_enabled((os_log_t)[v9 OSLogObject], OS_LOG_TYPE_INFO)) {
      v11 &= 2u;
    }
    if (v11)
    {
      int v16 = 138412802;
      uint64_t v17 = objc_opt_class();
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = [(LoadMicroPaymentQueueCountOperation *)self URLBagKey];
      LODWORD(v15) = 32;
      uint64_t v12 = (void *)_os_log_send_and_compose_impl();
      if (!v12) {
        goto LABEL_14;
      }
      uint64_t v13 = v12;
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v16, v15);
      free(v13);
      SSFileLog();
    }
  }
  uint64_t v12 = 0;
LABEL_14:
  if (a4) {
LABEL_15:
  }
    *a4 = v12;
  return isKindOfClass & 1;
}

- (NSDate)lastQueueCheckDate
{
  return (NSDate *)objc_getProperty(self, a2, 96, 1);
}

- (void)setLastQueueCheckDate:(id)a3
{
}

- (int64_t)queueItemCount
{
  return self->_queueItemCount;
}

- (void)setQueueItemCount:(int64_t)a3
{
  self->_queueItemCount = a3;
}

- (MicroPaymentQueueRequest)request
{
  return (MicroPaymentQueueRequest *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRequest:(id)a3
{
}

- (NSString)URLBagKey
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setURLBagKey:(id)a3
{
}

@end