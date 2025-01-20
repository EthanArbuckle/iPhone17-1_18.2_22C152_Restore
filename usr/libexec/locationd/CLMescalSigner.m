@interface CLMescalSigner
- (double)replaceAfter;
- (id)_mescalSignerNSURLSession;
- (id)initInSilo:(id)a3;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)_churnMescalExchangeData:(id)a3 withCompletion:(id)a4;
- (void)_doSigningWhenReady;
- (void)_initializeMescalWithCompletion:(id)a3;
- (void)dealloc;
- (void)signData:(id)a3 withCompletion:(id)a4;
@end

@implementation CLMescalSigner

- (id)initInSilo:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CLMescalSigner;
  v4 = [(CLMescalSigner *)&v10 init];
  v5 = v4;
  if (v4)
  {
    sub_10037B3DC(0, 0, (uint64_t)&v4->_hardwareInfo);
    if (v6)
    {
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022B7CE0);
      }
      v7 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "MESCAL: Could not derive hardware info for SAPInit", buf, 2u);
      }
      if (sub_10013D1A0(115, 0))
      {
        bzero(buf, 0x65CuLL);
        if (qword_102419630 != -1) {
          dispatch_once(&qword_102419630, &stru_1022B7CE0);
        }
        v9 = (char *)_os_log_send_and_compose_impl();
        sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMescalSigner initInSilo:]", "%s\n", v9);
        if (v9 != (char *)buf) {
          free(v9);
        }
      }

      return 0;
    }
    else
    {
      v5->_silo = (CLSilo *)a3;
      v5->_worklist = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v5->_replaceAfter = CFAbsoluteTimeGetCurrent() + 3600.0;
    }
  }
  return v5;
}

- (void)dealloc
{
  self->_mescalVersion = 0;
  self->_mescalCertURL = 0;

  self->_mescalExchangeURL = 0;
  session = self->_session;
  if (session)
  {
    sub_1003514F0((uint64_t)session);
    self->_session = 0;
  }
  if ([(NSMutableArray *)self->_worklist count])
  {
    v4 = (CLMescalSigner *)sub_101A633B4();
    [(CLMescalSigner *)v4 signData:v6 withCompletion:v7];
  }
  else
  {

    self->_worklist = 0;
    v8.receiver = self;
    v8.super_class = (Class)CLMescalSigner;
    [(CLMescalSigner *)&v8 dealloc];
  }
}

- (void)signData:(id)a3 withCompletion:(id)a4
{
  if (!a3)
  {
    id v6 = (id)sub_101A63518(self, a2, 0, a4);
    goto LABEL_9;
  }
  worklist = self->_worklist;
  v9[0] = a3;
  v8[0] = @"dataIn";
  v8[1] = @"hdlr";
  v9[1] = [a4 copy];
  id v6 = [(NSMutableArray *)worklist addObject:+[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2]];
  if (self->_keyExchangeComplete)
  {
    [(CLMescalSigner *)self _doSigningWhenReady];
    return;
  }
  if (!self->_keyExchangeStarted)
  {
    self->_keyExchangeStarted = 1;
    if (!self->_session)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1004FE04C;
      v7[3] = &unk_1022B7C20;
      v7[4] = self;
      [(CLMescalSigner *)self _initializeMescalWithCompletion:v7];
      return;
    }
LABEL_9:
    sub_101A6367C(v6);
  }
}

- (void)_doSigningWhenReady
{
  if (!self->_keyExchangeComplete) {
    sub_101A63944();
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  worklist = self->_worklist;
  id v4 = [(NSMutableArray *)worklist countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v22;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v22 != v6) {
          objc_enumerationMutation(worklist);
        }
        objc_super v8 = *(void **)(*((void *)&v21 + 1) + 8 * (void)v7);
        id v9 = [v8 objectForKey:@"dataIn"];
        objc_super v10 = (void (**)(id, void))[v8 objectForKey:@"hdlr"];
        v11 = v10;
        session = self->_session;
        if (session)
        {
          uint64_t v20 = 0;
          unsigned int v19 = 0;
          sub_100362748((uint64_t)session, (uint64_t)[v9 bytes], (uint64_t)[v9 length], (uint64_t)&v20, (uint64_t)&v19);
          if (v13)
          {
            int v14 = v13;
            if (qword_102419630 != -1) {
              dispatch_once(&qword_102419630, &stru_1022B7CE0);
            }
            v15 = qword_102419638;
            if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 134349056;
              uint64_t v28 = v14;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "MESCAL: SAPSign failed with: %{public}ld", buf, 0xCu);
            }
            if (sub_10013D1A0(115, 0))
            {
              bzero(buf, 0x65CuLL);
              if (qword_102419630 != -1) {
                dispatch_once(&qword_102419630, &stru_1022B7CE0);
              }
              int v25 = 134349056;
              uint64_t v26 = v14;
              v17 = (char *)_os_log_send_and_compose_impl();
              sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMescalSigner _doSigningWhenReady]", "%s\n", v17);
              if (v17 != (char *)buf) {
                free(v17);
              }
            }
            v16 = 0;
          }
          else
          {
            v16 = +[NSData dataWithBytes:v20 length:v19];
            sub_100362430(v20);
          }
          ((void (**)(id, NSData *))v11)[2](v11, v16);
        }
        else
        {
          v10[2](v10, 0);
        }
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v18 = [(NSMutableArray *)worklist countByEnumeratingWithState:&v21 objects:v29 count:16];
      id v5 = v18;
    }
    while (v18);
  }
  [(NSMutableArray *)self->_worklist removeAllObjects];
}

- (id)_mescalSignerNSURLSession
{
  v3 = +[NSURLSessionConfiguration defaultSessionConfiguration];
  id v4 = [(CLSilo *)self->_silo operationQueue];

  return +[NSURLSession sessionWithConfiguration:v3 delegate:self delegateQueue:v4];
}

- (void)_initializeMescalWithCompletion:(id)a3
{
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v12 = sub_1004FE7A4;
  int v13 = &unk_1022B7C48;
  int v14 = self;
  id v15 = a3;
  sub_100360204((uint64_t)&self->_session, (uint64_t)&self->_hardwareInfo);
  if (v4)
  {
    int v5 = v4;
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022B7CE0);
    }
    uint64_t v6 = qword_102419638;
    if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134349056;
      uint64_t v19 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "MESCAL: SAPInit failed with: %{public}ld", buf, 0xCu);
    }
    if (!sub_10013D1A0(115, 0)) {
      goto LABEL_18;
    }
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022B7CE0);
    }
    int v16 = 134349056;
    uint64_t v17 = v5;
    goto LABEL_22;
  }
  if (objc_opt_class())
  {
    id v7 = +[SSURLBag URLBagForContext:objc_alloc_init((Class)SSURLBagContext)];
    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_1004FE96C;
      v10[3] = &unk_1022B7CC0;
      v10[4] = self;
      v10[5] = v11;
      [v7 loadWithCompletionBlock:v10];
      return;
    }
  }
  if (qword_102419630 != -1) {
    dispatch_once(&qword_102419630, &stru_1022B7CE0);
  }
  objc_super v8 = qword_102419638;
  if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "MESCAL: Could not obtain store URL bag", buf, 2u);
  }
  if (sub_10013D1A0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_102419630 != -1) {
      dispatch_once(&qword_102419630, &stru_1022B7CE0);
    }
    LOWORD(v16) = 0;
LABEL_22:
    id v9 = (char *)_os_log_send_and_compose_impl();
    sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMescalSigner _initializeMescalWithCompletion:]", "%s\n", v9);
    if (v9 != (char *)buf) {
      free(v9);
    }
  }
LABEL_18:
  v12((uint64_t)v11, 0);
}

- (void)_churnMescalExchangeData:(id)a3 withCompletion:(id)a4
{
  session = self->_session;
  if (!session)
  {
    self = (CLMescalSigner *)sub_101A63AA8();
    goto LABEL_22;
  }
  int v5 = (uint64_t *)a3;
  if (!a3)
  {
LABEL_22:
    sub_101A63C0C(self, a2);
    goto LABEL_23;
  }
  int v4 = (void (**)(id, void))a4;
  id v7 = self;
  uint64_t v19 = 0;
  unsigned int v18 = 0;
  char v17 = -1;
  sub_100387354(200, (uint64_t)&self->_hardwareInfo, (uint64_t)session, (uint64_t)[a3 bytes], (uint64_t)[a3 length], (uint64_t)&v19, (uint64_t)&v18, (uint64_t)&v17);
  LODWORD(session) = v8;
  id v9 = +[NSData dataWithBytes:v19 length:v18];
  sub_100362430(v19);
  if (session)
  {
    int v5 = &qword_102419000;
    if (qword_102419630 == -1)
    {
LABEL_5:
      objc_super v10 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134349056;
        uint64_t v25 = (int)session;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "MESCAL: SAPExchange failed with: %{public}ld", buf, 0xCu);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_8;
      }
      bzero(buf, 0x65CuLL);
      if (v5[198] != -1) {
        dispatch_once(&qword_102419630, &stru_1022B7CE0);
      }
      int v22 = 134349056;
      uint64_t v23 = (int)session;
LABEL_27:
      id v15 = (char *)_os_log_send_and_compose_impl();
      sub_1004BA5E4("Generic", 1, 0, 0, "-[CLMescalSigner _churnMescalExchangeData:withCompletion:]", "%s\n", v15);
      if (v15 != (char *)buf) {
        free(v15);
      }
LABEL_8:
      v4[2](v4, 0);
      return;
    }
LABEL_23:
    dispatch_once(&qword_102419630, &stru_1022B7CE0);
    goto LABEL_5;
  }
  if (v17 == 1)
  {
    CFStringRef v20 = @"sign-sap-setup-buffer";
    long long v21 = v9;
    v11 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", +[NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1], 100, 0, 0);
    v12 = +[NSMutableURLRequest requestWithURL:](NSMutableURLRequest, "requestWithURL:", +[NSURL URLWithString:v7->_mescalExchangeURL]);
    [(NSMutableURLRequest *)v12 setValue:@"application/x-apple-plist" forHTTPHeaderField:@"content-type"];
    [(NSMutableURLRequest *)v12 setHTTPMethod:@"POST"];
    [(NSMutableURLRequest *)v12 setHTTPBody:v11];
    id v13 = [(CLMescalSigner *)v7 _mescalSignerNSURLSession];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1004FF54C;
    v16[3] = &unk_1022B7C70;
    v16[4] = v7;
    v16[5] = v4;
    [objc_msgSend(v13, "dataTaskWithRequest:completionHandler:", v12, v16) resume];
    [v13 finishTasksAndInvalidate];
  }
  else
  {
    if (v17)
    {
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022B7CE0);
      }
      int v14 = qword_102419638;
      if (os_log_type_enabled((os_log_t)qword_102419638, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67240192;
        LODWORD(v25) = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_FAULT, "MESCAL: SAPExchange unexpect non-erroneous return code: %{public}d", buf, 8u);
      }
      if (!sub_10013D1A0(115, 0)) {
        goto LABEL_8;
      }
      bzero(buf, 0x65CuLL);
      if (qword_102419630 != -1) {
        dispatch_once(&qword_102419630, &stru_1022B7CE0);
      }
      int v22 = 67240192;
      LODWORD(v23) = v17;
      goto LABEL_27;
    }
    v4[2](v4, 1);
  }
}

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
}

- (double)replaceAfter
{
  return self->_replaceAfter;
}

@end