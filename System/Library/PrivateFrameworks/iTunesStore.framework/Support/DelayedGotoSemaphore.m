@interface DelayedGotoSemaphore
+ (void)_accessSemaphorePoolUsingBlock:(id)a3;
+ (void)signalSemaphoreForPushToken:(id)a3;
- (DelayedGotoSemaphore)initWithDelayedGoto:(id)a3;
- (NSDictionary)bodyDictionary;
- (NSURL)URL;
- (void)wait;
@end

@implementation DelayedGotoSemaphore

- (DelayedGotoSemaphore)initWithDelayedGoto:(id)a3
{
  id v4 = a3;
  v35.receiver = self;
  v35.super_class = (Class)DelayedGotoSemaphore;
  v5 = [(DelayedGotoSemaphore *)&v35 init];
  if (v5)
  {
    v6 = [v4 objectForKey:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (NSDictionary *)[v6 copy];
      bodyDictionary = v5->_bodyDictionary;
      v5->_bodyDictionary = v7;
    }
    v9 = [v4 objectForKey:@"url"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (NSURL *)[objc_alloc((Class)NSURL) initWithString:v9];
      url = v5->_url;
      v5->_url = v10;
    }
    v12 = [v4 objectForKey:@"delay"];

    char v13 = objc_opt_respondsToSelector();
    double v14 = 30.0;
    if (v13) {
      objc_msgSend(v12, "doubleValue", 30.0);
    }
    v5->_delay = v14;
    v15 = [v4 objectForKey:@"apnsToken"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = sub_100171C14;
      v33 = sub_100171C24;
      v34 = 0;
      v16 = objc_opt_class();
      v23 = _NSConcreteStackBlock;
      uint64_t v24 = 3221225472;
      v25 = sub_100171C2C;
      v26 = &unk_1003A82F8;
      v28 = &v29;
      id v17 = v15;
      id v27 = v17;
      [v16 _accessSemaphorePoolUsingBlock:&v23];
      objc_storeStrong((id *)&v5->_semaphore, (id)v30[5]);
      v18 = (NSString *)objc_msgSend(v17, "copy", v23, v24, v25, v26);
      pushToken = v5->_pushToken;
      v5->_pushToken = v18;

      _Block_object_dispose(&v29, 8);
      semaphore = v34;
    }
    else
    {
      dispatch_semaphore_t v21 = dispatch_semaphore_create(0);
      semaphore = v5->_semaphore;
      v5->_semaphore = (OS_dispatch_semaphore *)v21;
    }
  }
  return v5;
}

+ (void)signalSemaphoreForPushToken:(id)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = sub_100171C14;
  char v13 = sub_100171C24;
  id v14 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100171DE0;
  v6[3] = &unk_1003A82F8;
  v8 = &v9;
  id v4 = a3;
  id v7 = v4;
  [a1 _accessSemaphorePoolUsingBlock:v6];
  v5 = v10[5];
  if (v5) {
    dispatch_semaphore_signal(v5);
  }

  _Block_object_dispose(&v9, 8);
}

- (void)wait
{
  if (self->_semaphore)
  {
    pushToken = self->_pushToken;
    uint64_t v4 = +[SSLogConfig sharedDaemonConfig];
    v5 = (void *)v4;
    if (pushToken)
    {
      if (!v4)
      {
        v5 = +[SSLogConfig sharedConfig];
      }
      unsigned int v6 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v7 = v6 | 2;
      }
      else {
        int v7 = v6;
      }
      v8 = [v5 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        v7 &= 2u;
      }
      if (!v7) {
        goto LABEL_23;
      }
      uint64_t v9 = objc_opt_class();
      double delay = self->_delay;
      uint64_t v11 = self->_pushToken;
      int v22 = 138412802;
      v23 = v9;
      __int16 v24 = 2048;
      double v25 = delay;
      __int16 v26 = 2112;
      id v27 = v11;
      id v12 = v9;
      LODWORD(v20) = 32;
    }
    else
    {
      if (!v4)
      {
        v5 = +[SSLogConfig sharedConfig];
      }
      unsigned int v13 = [v5 shouldLog];
      if ([v5 shouldLogToDisk]) {
        int v14 = v13 | 2;
      }
      else {
        int v14 = v13;
      }
      v8 = [v5 OSLogObject];
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        v14 &= 2u;
      }
      if (!v14) {
        goto LABEL_23;
      }
      v15 = objc_opt_class();
      double v16 = self->_delay;
      int v22 = 138412546;
      v23 = v15;
      __int16 v24 = 2048;
      double v25 = v16;
      id v12 = v15;
      LODWORD(v20) = 22;
    }
    id v17 = (void *)_os_log_send_and_compose_impl();

    if (!v17) {
      goto LABEL_24;
    }
    v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v17, 4, &v22, v20);
    free(v17);
    SSFileLog();
LABEL_23:

LABEL_24:
    semaphore = self->_semaphore;
    dispatch_time_t v19 = dispatch_time(0, (uint64_t)(self->_delay * 1000000000.0));
    dispatch_semaphore_wait(semaphore, v19);
    if (self->_pushToken)
    {
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_10017217C;
      v21[3] = &unk_1003A8320;
      v21[4] = self;
      [(id)objc_opt_class() _accessSemaphorePoolUsingBlock:v21];
    }
  }
}

+ (void)_accessSemaphorePoolUsingBlock:(id)a3
{
  id v3 = a3;
  if (qword_100401F68 != -1) {
    dispatch_once(&qword_100401F68, &stru_1003A8340);
  }
  uint64_t v4 = qword_100401F70;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001722AC;
  block[3] = &unk_1003A31C8;
  id v7 = v3;
  id v5 = v3;
  dispatch_sync(v4, block);
}

- (NSDictionary)bodyDictionary
{
  return self->_bodyDictionary;
}

- (NSURL)URL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_pushToken, 0);

  objc_storeStrong((id *)&self->_bodyDictionary, 0);
}

@end