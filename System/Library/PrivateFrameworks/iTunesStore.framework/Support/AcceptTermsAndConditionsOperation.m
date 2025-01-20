@interface AcceptTermsAndConditionsOperation
- (AcceptTermsAndConditionsOperation)init;
- (AcceptTermsAndConditionsOperation)initWithAccount:(id)a3;
- (BOOL)isUserAccepted;
- (id)_newTermsAcceptSrvOperation;
- (id)_newTermsCheckSrvOperation;
- (void)_acceptTermsAndConditionsWithBlock:(id)a3;
- (void)_checkTermsAndConditionsWithBlock:(id)a3;
- (void)_dismissTermsAndConditionsWithAcceptance:(BOOL)a3;
- (void)_presentTermsAndConditions;
- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4;
- (void)alertProxyDidCancel:(id)a3;
- (void)run;
- (void)setUserAccepted:(BOOL)a3;
@end

@implementation AcceptTermsAndConditionsOperation

- (AcceptTermsAndConditionsOperation)init
{
  return [(AcceptTermsAndConditionsOperation *)self initWithAccount:0];
}

- (AcceptTermsAndConditionsOperation)initWithAccount:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AcceptTermsAndConditionsOperation;
  v6 = [(AcceptTermsAndConditionsOperation *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_account, a3);
  }

  return v7;
}

- (BOOL)isUserAccepted
{
  [(AcceptTermsAndConditionsOperation *)self lock];
  BOOL userAccepted = self->_userAccepted;
  [(AcceptTermsAndConditionsOperation *)self unlock];
  return userAccepted;
}

- (void)setUserAccepted:(BOOL)a3
{
  [(AcceptTermsAndConditionsOperation *)self lock];
  self->_BOOL userAccepted = a3;

  [(AcceptTermsAndConditionsOperation *)self unlock];
}

- (void)run
{
  v3 = +[SSLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[SSLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 shouldLog];
  if ([v3 shouldLogToDisk]) {
    int v5 = v4 | 2;
  }
  else {
    int v5 = v4;
  }
  v6 = [v3 OSLogObject];
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    v5 &= 2u;
  }
  if (v5)
  {
    LODWORD(v28) = 138412290;
    *(void *)((char *)&v28 + 4) = objc_opt_class();
    id v7 = *(id *)((char *)&v28 + 4);
    LODWORD(v22) = 12;
    v21 = (id *)&v28;
    v8 = (void *)_os_log_send_and_compose_impl();

    if (v8)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v8, 4, &v28, v22);
      objc_super v9 = (id *)objc_claimAutoreleasedReturnValue();
      free(v8);
      v21 = v9;
      SSFileLog();
    }
  }
  else
  {
  }
  *(void *)&long long v28 = 0;
  *((void *)&v28 + 1) = &v28;
  uint64_t v29 = 0x3032000000;
  v30 = sub_100019224;
  v31 = sub_100019234;
  id v32 = 0;
  if (!self->_account)
  {
    v12 = +[SSLogConfig sharedDaemonConfig];
    if (!v12)
    {
      v12 = +[SSLogConfig sharedConfig];
    }
    unsigned int v13 = objc_msgSend(v12, "shouldLog", v21);
    unsigned int v14 = [v12 shouldLogToDisk];
    v15 = [v12 OSLogObject];
    v16 = v15;
    if (v14) {
      v13 |= 2u;
    }
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
      v13 &= 2u;
    }
    if (v13)
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = (id)objc_opt_class();
      id v17 = *(id *)((char *)location + 4);
      LODWORD(v22) = 12;
      v21 = location;
      v18 = (void *)_os_log_send_and_compose_impl();

      if (!v18)
      {
LABEL_27:

        uint64_t v19 = SSError();
        v20 = *(void **)(*((void *)&v28 + 1) + 40);
        *(void *)(*((void *)&v28 + 1) + 40) = v19;

        goto LABEL_28;
      }
      v16 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v18, 4, location, v22);
      free(v18);
      v21 = (id *)v16;
      SSFileLog();
    }

    goto LABEL_27;
  }
  objc_initWeak(location, self);
  dispatch_semaphore_t v10 = dispatch_semaphore_create(0);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10001923C;
  v23[3] = &unk_1003A3540;
  objc_copyWeak(&v26, location);
  v25 = &v28;
  v23[4] = self;
  v11 = v10;
  v24 = v11;
  [(AcceptTermsAndConditionsOperation *)self _checkTermsAndConditionsWithBlock:v23];
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  if (!self->_userAccepted && !*(void *)(*((void *)&v28 + 1) + 40)) {
    [(AcceptTermsAndConditionsOperation *)self _presentTermsAndConditions];
  }

  objc_destroyWeak(&v26);
  objc_destroyWeak(location);
LABEL_28:
  -[AcceptTermsAndConditionsOperation setError:](self, "setError:", *(void *)(*((void *)&v28 + 1) + 40), v21);
  [(AcceptTermsAndConditionsOperation *)self setSuccess:self->_result];
  _Block_object_dispose(&v28, 8);
}

- (void)alertProxy:(id)a3 didReceiveMessage:(id)a4
{
  int v5 = xpc_dictionary_get_value(a4, "1");
  xpc_object_t xBOOL = v5;
  BOOL v6 = v5 && xpc_get_type(v5) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(xBOOL);
  [(AcceptTermsAndConditionsOperation *)self _dismissTermsAndConditionsWithAcceptance:v6];
}

- (void)alertProxyDidCancel:(id)a3
{
}

- (void)_acceptTermsAndConditionsWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, id, id))a3;
  id v5 = [(AcceptTermsAndConditionsOperation *)self _newTermsAcceptSrvOperation];
  BOOL v6 = +[ISDataProvider provider];
  [v5 setDataProvider:v6];

  [v5 setNeedsAuthentication:1];
  [v5 setNeedsTermsAndConditionsAcceptance:0];
  id v14 = 0;
  unsigned int v7 = [(AcceptTermsAndConditionsOperation *)self runSubOperation:v5 returningError:&v14];
  id v8 = v14;
  if (v4 && v7)
  {
    objc_super v9 = [v5 dataProvider];
    dispatch_semaphore_t v10 = [v9 output];

    if (v10)
    {
      id v13 = v8;
      id v11 = [objc_alloc((Class)SSTermsAndConditions) initWithResponseData:v10 error:&v13];
      id v12 = v13;

      id v8 = v12;
    }
    else
    {
      id v11 = 0;
    }
    v4[2](v4, [v11 isUserAccepted], v8);
  }
}

- (void)_checkTermsAndConditionsWithBlock:(id)a3
{
  unsigned int v4 = (void (**)(id, id, id))a3;
  id v5 = [(AcceptTermsAndConditionsOperation *)self _newTermsCheckSrvOperation];
  BOOL v6 = +[ISDataProvider provider];
  [v5 setDataProvider:v6];

  [v5 setNeedsAuthentication:1];
  [v5 setNeedsTermsAndConditionsAcceptance:0];
  id v13 = 0;
  LODWORD(v6) = [(AcceptTermsAndConditionsOperation *)self runSubOperation:v5 returningError:&v13];
  id v7 = v13;
  if (v6)
  {
    if (v4)
    {
      id v8 = [v5 dataProvider];
      objc_super v9 = [v8 output];

      if (v9)
      {
        id v12 = v7;
        id v10 = [objc_alloc((Class)SSTermsAndConditions) initWithResponseData:v9 error:&v12];
        id v11 = v12;

        id v7 = v11;
      }
      else
      {
        id v10 = 0;
      }
      v4[2](v4, v10, v7);
    }
  }
  else if (v4)
  {
    v4[2](v4, 0, v7);
  }
}

- (void)_dismissTermsAndConditionsWithAcceptance:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (!v7) {
    goto LABEL_13;
  }
  objc_super v9 = objc_opt_class();
  CFStringRef v10 = @"NO";
  if (v3) {
    CFStringRef v10 = @"YES";
  }
  int v20 = 138412546;
  v21 = v9;
  __int16 v22 = 2112;
  CFStringRef v23 = v10;
  id v11 = v9;
  LODWORD(v18) = 22;
  id v17 = &v20;
  id v12 = (void *)_os_log_send_and_compose_impl();

  if (v12)
  {
    id v8 = +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v12, 4, &v20, v18);
    free(v12);
    id v17 = (int *)v8;
    SSFileLog();
LABEL_13:
  }
  [(AcceptTermsAndConditionsOperation *)self lock];
  self->_BOOL userAccepted = v3;
  self->_result = 1;
  alertSemaphore = self->_alertSemaphore;
  if (alertSemaphore)
  {
    id v14 = alertSemaphore;
    v15 = self->_alertSemaphore;
    self->_alertSemaphore = 0;
  }
  -[SpringBoardAlertProxy setDelegate:](self->_alertProxy, "setDelegate:", 0, v17);
  alertProxy = self->_alertProxy;
  self->_alertProxy = 0;

  [(AcceptTermsAndConditionsOperation *)self unlock];
  if (self->_userAccepted)
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100019E30;
    v19[3] = &unk_1003A3568;
    v19[4] = self;
    [(AcceptTermsAndConditionsOperation *)self _acceptTermsAndConditionsWithBlock:v19];
  }
  if (alertSemaphore) {
    dispatch_semaphore_signal(alertSemaphore);
  }
}

- (id)_newTermsAcceptSrvOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  id v4 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v4 setITunesStoreRequest:1];
  [v4 setURLBagKey:@"terms-check"];
  [v4 setHTTPMethod:@"POST"];
  id v5 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v6 = +[NSNumber numberWithLongLong:[(SSTermsAndConditions *)self->_conditions currentVersionIdentifier]];
  [v5 setObject:v6 forKey:@"accepted"];

  int v7 = +[NSJSONSerialization dataWithJSONObject:v5 options:0 error:0];
  [v4 setHTTPBody:v7];

  [v3 setRequestProperties:v4];
  id v8 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:self->_account];
  [v8 setShouldIgnoreAccountConversion:1];
  [v8 setPromptStyle:1001];
  id v9 = [v8 copy];
  [v3 setAuthenticationContext:v9];

  return v3;
}

- (id)_newTermsCheckSrvOperation
{
  id v3 = objc_alloc_init((Class)ISStoreURLOperation);
  id v4 = objc_alloc_init((Class)SSMutableURLRequestProperties);
  [v4 setITunesStoreRequest:1];
  [v4 setURLBagKey:@"terms-check"];
  [v3 setRequestProperties:v4];
  id v5 = [objc_alloc((Class)SSMutableAuthenticationContext) initWithAccount:self->_account];
  [v5 setShouldIgnoreAccountConversion:1];
  [v5 setPromptStyle:1001];
  id v6 = [v5 copy];
  [v3 setAuthenticationContext:v6];

  return v3;
}

- (void)_presentTermsAndConditions
{
  id v3 = +[ISDevice sharedInstance];
  id v4 = [(AcceptTermsAndConditionsOperation *)self copyActivePowerAssertionIdentifiers];
  id v5 = +[SSLogConfig sharedDaemonConfig];
  if (!v5)
  {
    id v5 = +[SSLogConfig sharedConfig];
  }
  unsigned int v6 = [v5 shouldLog];
  if ([v5 shouldLogToDisk]) {
    int v7 = v6 | 2;
  }
  else {
    int v7 = v6;
  }
  id v8 = [v5 OSLogObject];
  if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    v7 &= 2u;
  }
  if (v7)
  {
    id v9 = objc_opt_class();
    id v10 = v9;
    *(_DWORD *)location = 138412546;
    *(void *)&location[4] = v9;
    __int16 v45 = 2048;
    id v46 = [v4 count];
    LODWORD(v31) = 22;
    v30 = location;
    id v11 = (void *)_os_log_send_and_compose_impl();

    if (v11)
    {
      +[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", v11, 4, location, v31);
      id v12 = (unsigned char *)objc_claimAutoreleasedReturnValue();
      free(v11);
      v30 = v12;
      SSFileLog();
    }
  }
  else
  {
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v13 = v4;
  id v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v39;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(v13);
        }
        objc_msgSend(v3, "releasePowerAssertion:", *(void *)(*((void *)&v38 + 1) + 8 * i), v30);
      }
      id v14 = [v13 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v14);
  }

  id v17 = +[Daemon daemon];
  [v17 beginShowingDialog];
  id v18 = objc_alloc_init((Class)NSMutableDictionary);
  [v18 setObject:@"ServiceTermsPageViewController" forKey:SBSUIRemoteAlertOptionViewControllerClass];
  id v19 = objc_alloc_init((Class)NSMutableDictionary);
  conditions = self->_conditions;
  if (conditions)
  {
    v21 = [(SSTermsAndConditions *)conditions currentText];
    __int16 v22 = v21;
    if (v21 && [v21 length]) {
      [v19 setObject:v22 forKey:@"terms"];
    }
  }
  CFStringRef v23 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  alertSemaphore = self->_alertSemaphore;
  self->_alertSemaphore = v23;

  objc_initWeak((id *)location, self);
  v25 = +[SpringBoardUtility sharedInstance];
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_10001A73C;
  v36[3] = &unk_1003A3590;
  objc_copyWeak(&v37, (id *)location);
  v36[4] = self;
  [v25 activateAlertWithDescription:v18 options:v19 completionBlock:v36];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_alertSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_destroyWeak(&v37);
  objc_destroyWeak((id *)location);

  [v17 endShowingDialog];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v26 = v13;
  id v27 = [v26 countByEnumeratingWithState:&v32 objects:v42 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v33;
    do
    {
      for (j = 0; j != v27; j = (char *)j + 1)
      {
        if (*(void *)v33 != v28) {
          objc_enumerationMutation(v26);
        }
        objc_msgSend(v3, "takePowerAssertion:", *(void *)(*((void *)&v32 + 1) + 8 * (void)j), v30);
      }
      id v27 = [v26 countByEnumeratingWithState:&v32 objects:v42 count:16];
    }
    while (v27);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conditions, 0);
  objc_storeStrong((id *)&self->_alertSemaphore, 0);
  objc_storeStrong((id *)&self->_alertProxy, 0);

  objc_storeStrong((id *)&self->_account, 0);
}

@end