@interface MediaDRMOperation
- (MediaDRMOperation)initWithMediaPath:(id)a3 sinfs:(id)a4;
- (NSString)mediaFileExtension;
- (NSString)mediaPath;
- (id)sinfs;
- (void)dealloc;
- (void)run;
@end

@implementation MediaDRMOperation

- (MediaDRMOperation)initWithMediaPath:(id)a3 sinfs:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)MediaDRMOperation;
  v6 = [(MediaDRMOperation *)&v8 init];
  if (v6)
  {
    v6->_mediaPath = (NSString *)[a3 copy];
    v6->_sinfs = [a4 copy];
  }
  return v6;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)MediaDRMOperation;
  [(MediaDRMOperation *)&v3 dealloc];
}

- (NSString)mediaFileExtension
{
  [(MediaDRMOperation *)self lock];
  objc_super v3 = self->_mediaFileExtension;
  [(MediaDRMOperation *)self unlock];
  return v3;
}

- (NSString)mediaPath
{
  v2 = self->_mediaPath;

  return v2;
}

- (id)sinfs
{
  id v2 = self->_sinfs;

  return v2;
}

- (void)run
{
  uint64_t v3 = OBJC_IVAR___ISOperation__progress;
  [*(id *)&self->ISOperation_opaque[OBJC_IVAR___ISOperation__progress] setMaxValue:100];
  [*(id *)&self->ISOperation_opaque[v3] setUnits:0];
  id v4 = +[SSLogConfig sharedDaemonConfig];
  if (!v4) {
    id v4 = +[SSLogConfig sharedConfig];
  }
  unsigned int v5 = [v4 shouldLog];
  if ([v4 shouldLogToDisk]) {
    int v6 = v5 | 2;
  }
  else {
    int v6 = v5;
  }
  if (!os_log_type_enabled((os_log_t)[v4 OSLogObject], OS_LOG_TYPE_INFO)) {
    v6 &= 2u;
  }
  if (v6)
  {
    uint64_t v7 = objc_opt_class();
    mediaPath = self->_mediaPath;
    int v28 = 138412546;
    uint64_t v29 = v7;
    __int16 v30 = 2112;
    v31 = mediaPath;
    LODWORD(v25) = 22;
    v24 = &v28;
    uint64_t v9 = _os_log_send_and_compose_impl();
    if (v9)
    {
      v10 = (void *)v9;
      v11 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v9, 4, &v28, v25);
      free(v10);
      v24 = (int *)v11;
      SSFileLog();
    }
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v27 = 0;
  id sinfs = self->_sinfs;
  if (sinfs) {
    [v12 setObject:sinfs forKey:ISWeakLinkedStringConstantForString()];
  }
  id v14 = [(id)ISWeakLinkedClassForString() fileProcessor];
  v15 = self->_mediaPath;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_10002A508;
  v26[3] = &unk_1003A3888;
  v26[4] = self;
  v16 = (NSString *)[v14 processPurchasedItem:v15 withAttributes:v12 resultInfo:&v27 progressBlock:v26];
  if (v16)
  {
    id v17 = +[SSLogConfig sharedDaemonConfig];
    if (!v17) {
      id v17 = +[SSLogConfig sharedConfig];
    }
    unsigned int v18 = objc_msgSend(v17, "shouldLog", v24);
    if ([v17 shouldLogToDisk]) {
      int v19 = v18 | 2;
    }
    else {
      int v19 = v18;
    }
    if (!os_log_type_enabled((os_log_t)[v17 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
      v19 &= 2u;
    }
    if (v19)
    {
      uint64_t v20 = objc_opt_class();
      int v28 = 138412546;
      uint64_t v29 = v20;
      __int16 v30 = 2112;
      v31 = v16;
      LODWORD(v25) = 22;
      uint64_t v21 = _os_log_send_and_compose_impl();
      if (v21)
      {
        v22 = (void *)v21;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v21, 4, &v28, v25);
        free(v22);
        SSFileLog();
      }
    }
    uint64_t v23 = ISErrorWithExternalError();
  }
  else
  {
    [(MediaDRMOperation *)self lock];

    self->_mediaFileExtension = (NSString *)[v27 objectForKey:ISWeakLinkedStringConstantForString()];
    [(MediaDRMOperation *)self unlock];
    uint64_t v23 = 0;
  }

  [(MediaDRMOperation *)self setError:v23];
  [(MediaDRMOperation *)self setSuccess:v16 == 0];
}

@end