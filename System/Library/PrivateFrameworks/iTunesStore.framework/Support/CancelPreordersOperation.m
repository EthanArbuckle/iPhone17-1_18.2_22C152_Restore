@interface CancelPreordersOperation
- (BOOL)_cancelPreorderWithOperation:(id)a3 error:(id *)a4;
- (id)_newURLOperationWithItemID:(id)a3 accountID:(id)a4;
- (id)uniqueKey;
- (void)run;
@end

@implementation CancelPreordersOperation

- (void)run
{
  id v3 = +[DownloadsDatabase downloadsDatabase];
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_1000FE3C4;
  v21[3] = &unk_1003A3F18;
  v21[4] = self;
  v21[5] = v4;
  [v3 readUsingTransactionBlock:v21];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
  if (v5)
  {
    id v6 = v5;
    id v7 = 0;
    uint64_t v8 = *(void *)v18;
    char v14 = 1;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v18 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        id v11 = objc_alloc_init((Class)NSAutoreleasePool);
        id v12 = [v4 objectForKey:v10];
        id v16 = 0;
        if ([(CancelPreordersOperation *)self _cancelPreorderWithOperation:v12 error:&v16])
        {
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_1000FE55C;
          v15[3] = &unk_1003A5F80;
          v15[4] = v10;
          [v3 modifyUsingTransactionBlock:v15];
        }
        else
        {
          if (!v7) {
            id v7 = v16;
          }
          char v14 = 0;
        }
        [v11 drain];
      }
      id v6 = [v4 countByEnumeratingWithState:&v17 objects:v22 count:16];
    }
    while (v6);
  }
  else
  {
    id v7 = 0;
    char v14 = 1;
  }

  id v13 = v7;
  [(CancelPreordersOperation *)self setError:v7];
  [(CancelPreordersOperation *)self setSuccess:v14 & 1];
}

- (id)uniqueKey
{
  return @"com.apple.itunesstored.CancelPreordersOperation";
}

- (BOOL)_cancelPreorderWithOperation:(id)a3 error:(id *)a4
{
  v25 = 0;
  LODWORD(v6) = [(CancelPreordersOperation *)self runSubOperation:a3 returningError:&v25];
  if (v6)
  {
    id v7 = objc_msgSend(objc_msgSend(a3, "dataProvider"), "output");
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [v7 objectForKey:kISFailureTypeKey];
      if (v8)
      {
        v9 = v8;
        id v10 = +[SSLogConfig sharedDaemonConfig];
        if (!v10) {
          id v10 = +[SSLogConfig sharedConfig];
        }
        unsigned int v11 = [v10 shouldLog];
        if ([v10 shouldLogToDisk]) {
          int v12 = v11 | 2;
        }
        else {
          int v12 = v11;
        }
        if (!os_log_type_enabled((os_log_t)[v10 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
          v12 &= 2u;
        }
        if (v12)
        {
          uint64_t v13 = objc_opt_class();
          int v26 = 138412546;
          uint64_t v27 = v13;
          __int16 v28 = 2112;
          uint64_t v29 = (uint64_t)v9;
          LODWORD(v24) = 22;
          uint64_t v14 = _os_log_send_and_compose_impl();
          if (v14)
          {
            v15 = (void *)v14;
            +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v14, 4, &v26, v24);
            free(v15);
            SSFileLog();
          }
        }
        if (objc_opt_respondsToSelector()) {
          [v9 intValue];
        }
        uint64_t v22 = SSError();
        LOBYTE(v6) = 0;
        v25 = (void *)v22;
      }
      else
      {
        LOBYTE(v6) = 1;
      }
    }
    else
    {
      id v16 = +[SSLogConfig sharedDaemonConfig];
      if (!v16) {
        id v16 = +[SSLogConfig sharedConfig];
      }
      unsigned int v17 = [v16 shouldLog];
      if ([v16 shouldLogToDisk]) {
        int v18 = v17 | 2;
      }
      else {
        int v18 = v17;
      }
      if (!os_log_type_enabled((os_log_t)[v16 OSLogObject], OS_LOG_TYPE_DEFAULT)) {
        v18 &= 2u;
      }
      if (v18)
      {
        uint64_t v19 = objc_opt_class();
        uint64_t v20 = objc_opt_class();
        int v26 = 138412546;
        uint64_t v27 = v19;
        __int16 v28 = 2112;
        uint64_t v29 = v20;
        LODWORD(v24) = 22;
        uint64_t v6 = _os_log_send_and_compose_impl();
        if (!v6) {
          goto LABEL_29;
        }
        v21 = (void *)v6;
        +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v6, 4, &v26, v24);
        free(v21);
        SSFileLog();
      }
      LOBYTE(v6) = 0;
    }
  }
LABEL_29:
  if (a4) {
    *a4 = v25;
  }
  return v6;
}

- (id)_newURLOperationWithItemID:(id)a3 accountID:(id)a4
{
  id v6 = objc_alloc_init((Class)ISStoreURLOperation);
  objc_msgSend(v6, "setDataProvider:", +[DaemonProtocolDataProvider provider](DaemonProtocolDataProvider, "provider"));
  [v6 setNeedsAuthentication:1];
  id v7 = [objc_alloc((Class)SSAuthenticationContext) initWithAccountIdentifier:a4];
  [v6 setAuthenticationContext:v7];

  id v8 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v8 setURLBagKey:@"p2-cancel-pre-order"];
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  objc_msgSend(v9, "setObject:forKey:", objc_msgSend(a3, "stringValue"), @"id");
  [v8 setRequestParameters:v9];

  [v6 setRequestProperties:v8];
  return v6;
}

@end