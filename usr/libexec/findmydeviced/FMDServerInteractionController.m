@interface FMDServerInteractionController
- (BOOL)enqueueRequest:(id)a3;
- (FMDAccount)requestAccount;
- (FMDServerInteractionController)initWithChannels:(id)a3 delegate:(id)a4;
- (FMDServerInteractionControllerDelegate)delegate;
- (NSArray)channels;
- (NSMutableArray)requests;
- (NSRecursiveLock)requestModifierLock;
- (NSString)udid;
- (id)account;
- (id)redirectedRequestURLForType:(id)a3 udid:(id)a4;
- (id)redirectedURL:(id)a3;
- (id)requestUrlForType:(id)a3 udid:(id)a4;
- (void)_beginXPCTransactionForRequest:(id)a3;
- (void)_disablePowerAssertionForRequest:(id)a3;
- (void)_enablePowerAssertionForRequest:(id)a3;
- (void)_endXPCTransactionForRequest:(id)a3;
- (void)_evaluateRetriesForRequest:(id)a3;
- (void)_handleResponseForRequest:(id)a3 withStatus:(int64_t)a4 headers:(id)a5 body:(id)a6 location:(id)a7 error:(id)a8;
- (void)_markRequestCancelled:(id)a3;
- (void)_sendRequest:(id)a3;
- (void)cancelAllRequests;
- (void)cancelRequest:(id)a3;
- (void)setChannels:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setRequestAccount:(id)a3;
- (void)setRequestModifierLock:(id)a3;
- (void)setRequests:(id)a3;
- (void)setUdid:(id)a3;
@end

@implementation FMDServerInteractionController

- (FMDServerInteractionController)initWithChannels:(id)a3 delegate:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)FMDServerInteractionController;
  v9 = [(FMDServerInteractionController *)&v16 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_channels, a3);
    uint64_t v11 = +[NSMutableArray array];
    requests = v10->_requests;
    v10->_requests = (NSMutableArray *)v11;

    uint64_t v13 = objc_opt_new();
    requestModifierLock = v10->_requestModifierLock;
    v10->_requestModifierLock = (NSRecursiveLock *)v13;

    objc_storeStrong((id *)&v10->_delegate, a4);
  }

  return v10;
}

- (BOOL)enqueueRequest:(id)a3
{
  id v4 = a3;
  if ([v4 type])
  {
    v5 = [v4 authId];
    if (v5 && ([v4 authToken], (v6 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {
      uint64_t v7 = objc_opt_class();
      uint64_t v8 = objc_opt_class();
      if (v5) {

      }
      if (v7 != v8)
      {
        v9 = sub_100004238();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v44 = (id)objc_opt_class();
          __int16 v45 = 2048;
          id v46 = v4;
          id v10 = v44;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) No credentials found. Not sending the request", buf, 0x16u);
        }
        goto LABEL_14;
      }
    }
  }
  if ([v4 cancelled])
  {
    v9 = sub_100004238();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v44 = (id)objc_opt_class();
      __int16 v45 = 2048;
      id v46 = v4;
      id v11 = v44;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Enqueueing request already cancelled", buf, 0x16u);
    }
LABEL_14:

    BOOL v12 = 0;
    goto LABEL_36;
  }
  uint64_t v13 = [(FMDServerInteractionController *)self requestModifierLock];
  [v13 lock];

  v14 = sub_100004238();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v44 = (id)objc_opt_class();
    __int16 v45 = 2048;
    id v46 = v4;
    id v15 = v44;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Enqueueing request", buf, 0x16u);
  }
  objc_super v16 = +[NSMutableArray array];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  v17 = [(FMDServerInteractionController *)self requests];
  id v18 = [v17 countByEnumeratingWithState:&v39 objects:v52 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v40;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        if ([v4 canReplace:v21]) {
          [v16 addObject:v21];
        }
      }
      id v18 = [v17 countByEnumeratingWithState:&v39 objects:v52 count:16];
    }
    while (v18);
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = v16;
  id v22 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
  if (v22)
  {
    uint64_t v23 = *(void *)v36;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v36 != v23) {
          objc_enumerationMutation(obj);
        }
        v25 = *(void **)(*((void *)&v35 + 1) + 8 * (void)j);
        v26 = sub_100004238();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          id v27 = (id)objc_opt_class();
          v28 = objc_opt_class();
          *(_DWORD *)buf = 138413058;
          id v44 = v27;
          __int16 v45 = 2048;
          id v46 = v25;
          __int16 v47 = 2112;
          v48 = v28;
          __int16 v49 = 2048;
          id v50 = v4;
          v29 = self;
          id v30 = v28;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) is being replaced with %@ (0x%lX)", buf, 0x2Au);

          self = v29;
        }

        [(FMDServerInteractionController *)self cancelRequest:v25];
      }
      id v22 = [obj countByEnumeratingWithState:&v35 objects:v51 count:16];
    }
    while (v22);
  }

  v31 = [(FMDServerInteractionController *)self requests];
  [v31 addObject:v4];

  v32 = [(FMDServerInteractionController *)self requestModifierLock];
  [v32 unlock];

  [(FMDServerInteractionController *)self _sendRequest:v4];
  BOOL v12 = 1;
LABEL_36:

  return v12;
}

- (void)cancelAllRequests
{
  v3 = [(FMDServerInteractionController *)self requestModifierLock];
  [v3 lock];

  id v4 = [(FMDServerInteractionController *)self requests];
  id v5 = [v4 copy];

  v6 = +[NSMutableArray array];
  [(FMDServerInteractionController *)self setRequests:v6];

  uint64_t v7 = [(FMDServerInteractionController *)self requestModifierLock];
  [v7 unlock];

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v8 = [(FMDServerInteractionController *)self channels];
  id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v20 + 1) + 8 * i) cancelAllRequests];
      }
      id v9 = [v8 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v9);
  }

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v5;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        -[FMDServerInteractionController _markRequestCancelled:](self, "_markRequestCancelled:", *(void *)(*((void *)&v16 + 1) + 8 * (void)j), (void)v16);
      }
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (void)_sendRequest:(id)a3
{
  id v4 = a3;
  if (([v4 inProgress] & 1) == 0
    && ([v4 cancelled] & 1) == 0
    && ([v4 completed] & 1) == 0
    && [v4 willRetry])
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v5 = [(FMDServerInteractionController *)self channels];
    id v6 = [v5 countByEnumeratingWithState:&v52 objects:v62 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v53;
LABEL_7:
      uint64_t v9 = 0;
      while (1)
      {
        if (*(void *)v53 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v52 + 1) + 8 * v9);
        if ([v10 isActive])
        {
          if (objc_msgSend(v10, "supportsRequestType:", objc_msgSend(v4, "type"))) {
            break;
          }
        }
        if (v7 == (id)++v9)
        {
          id v7 = [v5 countByEnumeratingWithState:&v52 objects:v62 count:16];
          if (v7) {
            goto LABEL_7;
          }
          goto LABEL_14;
        }
      }
      id v11 = v10;

      if (!v11) {
        goto LABEL_46;
      }
      id v12 = sub_100004238();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        id v13 = objc_opt_class();
        id v14 = v13;
        id v15 = [v11 fm_logID];
        *(_DWORD *)buf = 138412802;
        v57 = v13;
        __int16 v58 = 2048;
        id v59 = v4;
        __int16 v60 = 2112;
        id v61 = v15;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending to channel %@", buf, 0x20u);
      }
      [v4 setInProgress:1];
      [v4 setAlertFromServerResponse:0];
      long long v16 = [v4 willSendHandler];

      if (v16)
      {
        long long v17 = [v4 willSendHandler];
        ((void (**)(void, id))v17)[2](v17, v4);
      }
      long long v18 = [v4 requestUrl];
      long long v19 = [(FMDServerInteractionController *)self redirectedURL:v18];
      long long v20 = v19;
      if (v19)
      {
        id v21 = v19;
      }
      else
      {
        long long v22 = [v4 urlTemplateType];
        long long v23 = [(FMDServerInteractionController *)self udid];
        id v21 = [(FMDServerInteractionController *)self redirectedRequestURLForType:v22 udid:v23];
      }
      v24 = [v4 requestBody];
      v25 = [v4 requestBodyData];
      if (v25) {
        goto LABEL_24;
      }
      if (!v24)
      {
LABEL_44:

        goto LABEL_45;
      }
      id v51 = 0;
      id v27 = +[NSJSONSerialization dataWithJSONObject:v24 options:0 error:&v51];
      id v41 = v51;
      v25 = v41;
      if (v27)
      {
        if (!v41)
        {
          v25 = v27;
LABEL_24:
          id v26 = v21;
          id v27 = [v4 requestHeaders:v24];
          id v28 = [v27 mutableCopy];
          v29 = [v28 objectForKeyedSubscript:@"Authorization"];

          if (v29) {
            [v28 setObject:@"REDACTED" forKeyedSubscript:@"Authorization"];
          }
          id v30 = +[NSJSONSerialization JSONObjectWithData:v25 options:0 error:0];
          v31 = sub_100059748();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            v32 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v57 = v32;
            __int16 v58 = 2048;
            id v59 = v4;
            __int16 v60 = 2112;
            id v61 = v26;
            id v33 = v32;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending to url %@ ", buf, 0x20u);
          }
          v34 = sub_100059748();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
          {
            long long v35 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v57 = v35;
            __int16 v58 = 2048;
            id v59 = v4;
            __int16 v60 = 2112;
            id v61 = v28;
            id v36 = v35;
            _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending headers: \n%@ ", buf, 0x20u);
          }
          long long v37 = sub_100059748();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
          {
            long long v38 = objc_opt_class();
            *(_DWORD *)buf = 138412802;
            v57 = v38;
            __int16 v58 = 2048;
            id v59 = v4;
            __int16 v60 = 2112;
            id v61 = v30;
            id v39 = v38;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Sending with body dict : \n%@ ", buf, 0x20u);
          }
          if ([v4 cancelled])
          {
            long long v40 = sub_100004238();
            id v21 = v26;
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG)) {
              sub_10023B348();
            }
          }
          else
          {
            [(FMDServerInteractionController *)self _enablePowerAssertionForRequest:v4];
            long long v42 = [v4 retryHelper];
            id v43 = [v42 totalRetryCount];

            id v21 = v26;
            if (!v43) {
              [(FMDServerInteractionController *)self _beginXPCTransactionForRequest:v4];
            }
            id v44 = [v4 requestId];
            v48[0] = _NSConcreteStackBlock;
            v48[1] = 3221225472;
            v48[2] = sub_10000B3D4;
            v48[3] = &unk_1002D9300;
            __int16 v49 = v4;
            id v50 = self;
            [v11 sendRequestWithId:v44 toURL:v26 withHeaders:v27 body:v25 completion:v48];

            long long v40 = v49;
          }
          v24 = v47;
LABEL_43:

          goto LABEL_44;
        }
      }
      else
      {
        __int16 v45 = sub_100004238();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
          sub_10023B2B4((uint64_t)v4, v45);
        }

        if (!v25) {
          goto LABEL_44;
        }
      }
      id v46 = sub_100004238();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR)) {
        sub_10023B22C();
      }

      long long v40 = sub_100059748();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
        sub_10023B1A4();
      }
      goto LABEL_43;
    }
LABEL_14:
    id v11 = v5;
LABEL_45:
  }
LABEL_46:
}

- (void)_handleResponseForRequest:(id)a3 withStatus:(int64_t)a4 headers:(id)a5 body:(id)a6 location:(id)a7 error:(id)a8
{
  id v14 = a3;
  id v84 = a5;
  id v15 = a6;
  id v81 = a7;
  id v83 = a8;
  long long v16 = sub_100059748();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    long long v17 = objc_opt_class();
    id v18 = v17;
    long long v19 = [v83 domain:v81];
    *(_DWORD *)buf = 138413314;
    v87 = v17;
    __int16 v88 = 2048;
    id v89 = v14;
    __int16 v90 = 2048;
    int64_t v91 = a4;
    __int16 v92 = 2112;
    v93 = v19;
    __int16 v94 = 2048;
    id v95 = [v83 code];
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) received response with status %ld, error %@:%ld", buf, 0x34u);
  }
  long long v20 = sub_100059748();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = objc_opt_class();
    id v22 = v21;
    long long v23 = [v84 objectForKeyedSubscript:@"X-Apple-Request-UUID"];
    v24 = [v84 objectForKeyedSubscript:@"X-Request-UUID"];
    v25 = [v84 objectForKeyedSubscript:@"X-Responding-Instance"];
    *(_DWORD *)buf = 138413314;
    v87 = v21;
    __int16 v88 = 2048;
    id v89 = v14;
    __int16 v90 = 2114;
    int64_t v91 = (int64_t)v23;
    __int16 v92 = 2114;
    v93 = v24;
    __int16 v94 = 2114;
    id v95 = v25;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) X-Apple-Request-UUID: %{public}@, X-Request-UUID: %{public}@, X-Apple-Responding-Instance : %{public}@", buf, 0x34u);
  }
  id v26 = sub_100059748();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = objc_opt_class();
    id v28 = v27;
    v29 = [v84 description];
    *(_DWORD *)buf = 138412802;
    v87 = v27;
    __int16 v88 = 2048;
    id v89 = v14;
    __int16 v90 = 2112;
    int64_t v91 = (int64_t)v29;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) received headers: \n%@", buf, 0x20u);
  }
  if (v15) {
    id v30 = [objc_alloc((Class)NSString) initWithData:v15 encoding:4];
  }
  else {
    id v30 = 0;
  }
  v31 = sub_100059748();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_opt_class();
    *(_DWORD *)buf = 138412802;
    v87 = v32;
    __int16 v88 = 2048;
    id v89 = v14;
    __int16 v90 = 2112;
    int64_t v91 = (int64_t)v30;
    id v33 = v32;
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) raw response body : %@", buf, 0x20u);
  }
  [v14 setHttpResponseStatus:a4];
  [v14 setHttpResponseHeaders:v84];
  [v14 setHttpResponseError:v83];
  if ([v15 length])
  {
    id v85 = 0;
    v34 = +[NSJSONSerialization JSONObjectWithData:v15 options:0 error:&v85];
    id v35 = v85;
    id v36 = v35;
    if (v34 || !v35)
    {
      [v14 setHttpResponseBody:v34];
      if (!v34)
      {
LABEL_21:

        goto LABEL_22;
      }
      long long v37 = sub_100059748();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        long long v38 = objc_opt_class();
        id v39 = v38;
        long long v40 = [v34 description];
        *(_DWORD *)buf = 138412802;
        v87 = v38;
        __int16 v88 = 2048;
        id v89 = v14;
        __int16 v90 = 2112;
        int64_t v91 = (int64_t)v40;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) response body dict : \n%@", buf, 0x20u);
      }
    }
    else
    {
      long long v37 = sub_100004238();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_10023B454();
      }
    }

    goto LABEL_21;
  }
LABEL_22:
  id v41 = [v14 httpResponseBody:v81];
  BOOL v42 = v41 == 0;

  if (!v42)
  {
    id v43 = [v14 httpResponseBody];
    id v44 = [v43 objectForKeyedSubscript:@"alert"];
    __int16 v45 = [v44 fm_nullToNil];
    [v14 setAlertFromServerResponse:v45];
  }
  [v14 setCompleted:[v14 responseErrorType] == 0];
  if ([v14 responseErrorType] == (id)1025)
  {
    id v46 = [v14 httpResponseHeaders];
    __int16 v47 = [v46 stringForCaseInsensitiveStringKey:@"X-Apple-MMe-Host"];

    if (v47)
    {
      v48 = [v14 urlTemplateType];
      __int16 v49 = [(FMDServerInteractionController *)self udid];
      id v50 = [(FMDServerInteractionController *)self redirectedRequestURLForType:v48 udid:v49];
      id v51 = [v50 host];

      long long v52 = [(FMDServerInteractionController *)self account];
      long long v53 = [v52 authId];
      +[FMDRealmSupport setRedirectedHost:v47 forHost:v51 withContext:v53];

      long long v54 = sub_100004238();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        long long v55 = objc_opt_class();
        id v56 = v55;
        v57 = [(FMDServerInteractionController *)self account];
        __int16 v58 = [v57 authId];
        *(_DWORD *)buf = 138413314;
        v87 = v55;
        __int16 v88 = 2048;
        id v89 = v14;
        __int16 v90 = 2112;
        int64_t v91 = (int64_t)v51;
        __int16 v92 = 2112;
        v93 = v47;
        __int16 v94 = 2112;
        id v95 = v58;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Realm redirection from %@ to %@ for %@", buf, 0x34u);
      }
    }
  }
  [(FMDServerInteractionController *)self _evaluateRetriesForRequest:v14];
  [v14 setInProgress:0];
  id v59 = [v14 completionHandler];

  if (v59)
  {
    __int16 v60 = sub_100059748();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      sub_10023B3CC();
    }

    id v61 = [v14 completionHandler];
    ((void (**)(void, id))v61)[2](v61, v14);
  }
  v62 = [v14 alertFromServerResponse];

  if (v62)
  {
    v63 = [(FMDServerInteractionController *)self delegate];
    [v63 didReceiveServerAlertForRequest:v14];
  }
  v64 = [v14 httpResponseHeaders];
  v65 = [v64 stringForCaseInsensitiveStringKey:@"X-Apple-Force-Register"];
  if ([v65 isEqualToString:@"true"])
  {
  }
  else
  {
    v66 = [v14 httpResponseHeaders];
    unsigned int v67 = [v66 BOOLForCaseInsensitiveStringKey:@"X-Apple-Force-Register"];

    if (!v67) {
      goto LABEL_40;
    }
  }
  v68 = +[FMDServiceProvider activeServiceProvider];
  [v68 registerDeviceWithCause:@"ForcedServerRegister" force:1];

LABEL_40:
  v69 = [v14 httpResponseHeaders];
  v70 = [v69 objectForKey:@"X-Apple-Ctx"];

  if (v70)
  {
    v71 = +[FMDProtectedContextManager sharedManager];
    [v71 cleanupAllContextsForKey:@"serverContextHeaderContext"];

    v72 = +[FMDProtectedContextManager sharedManager];
    id v73 = [v72 saveContext:v70 forContextKey:@"serverContextHeaderContext" dataProtectionClass:4];
  }
  if (([v14 willRetry] & 1) == 0)
  {
    v74 = sub_100004238();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
    {
      v75 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v87 = v75;
      __int16 v88 = 2048;
      id v89 = v14;
      id v76 = v75;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "%@ (0x%lX) Removing from the queue as it was completed or it exhausted its retries", buf, 0x16u);
    }
    [v14 deinitializeRequest];
    v77 = [(FMDServerInteractionController *)self requestModifierLock];
    [v77 lock];

    v78 = [(FMDServerInteractionController *)self requests];
    [v78 removeObject:v14];

    v79 = [(FMDServerInteractionController *)self requestModifierLock];
    [v79 unlock];

    [(FMDServerInteractionController *)self _endXPCTransactionForRequest:v14];
  }
  if ([v14 responseErrorType] == (id)257)
  {
    v80 = [(FMDServerInteractionController *)self delegate];
    [v80 didReceiveAuthFailureForRequest:v14];
  }
  [(FMDServerInteractionController *)self _disablePowerAssertionForRequest:v14];
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v22 = (id)objc_opt_class();
    __int16 v23 = 2048;
    id v24 = v4;
    id v6 = v22;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Cancelling request %@ (0x%lX)", buf, 0x16u);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v7 = [(FMDServerInteractionController *)self channels];
  id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v4 requestId];
        [v11 cancelRequestWithId:v12];
      }
      id v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  [(FMDServerInteractionController *)self _markRequestCancelled:v4];
  id v13 = [(FMDServerInteractionController *)self requestModifierLock];
  [v13 lock];

  id v14 = [(FMDServerInteractionController *)self requests];
  [v14 removeObject:v4];

  id v15 = [(FMDServerInteractionController *)self requestModifierLock];
  [v15 unlock];
}

- (void)_markRequestCancelled:(id)a3
{
  id v4 = a3;
  id v5 = sub_100004238();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)uint64_t v9 = 138412546;
    *(void *)&v9[4] = objc_opt_class();
    *(_WORD *)&v9[12] = 2048;
    *(void *)&v9[14] = v4;
    id v6 = *(id *)&v9[4];
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Marking request cancelled %@ (0x%lX)", v9, 0x16u);
  }
  [v4 setCancelled:1];
  [v4 setInProgress:0];
  [(FMDServerInteractionController *)self _evaluateRetriesForRequest:v4];
  id v7 = [v4 completionHandler];

  if (v7)
  {
    id v8 = [v4 completionHandler];
    ((void (**)(void, id))v8)[2](v8, v4);
  }
  [v4 deinitializeRequest:*(_OWORD *)v9, *(void *)&v9[16]];
  [(FMDServerInteractionController *)self _endXPCTransactionForRequest:v4];
  [(FMDServerInteractionController *)self _disablePowerAssertionForRequest:v4];
}

- (void)_evaluateRetriesForRequest:(id)a3
{
  id v4 = a3;
  id v5 = [v4 retryHelper];

  if (!v5)
  {
    objc_initWeak(&location, self);
    objc_initWeak(&from, v4);
    id v6 = [FMDRequestRetryHelper alloc];
    uint64_t v9 = _NSConcreteStackBlock;
    uint64_t v10 = 3221225472;
    id v11 = sub_10000C3F4;
    id v12 = &unk_1002D9328;
    objc_copyWeak(&v13, &location);
    objc_copyWeak(&v14, &from);
    id v7 = [(FMDRequestRetryHelper *)v6 initWithRequest:v4 retryAction:&v9];
    [v4 setRetryHelper:v7, v9, v10, v11, v12];

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&from);
    objc_destroyWeak(&location);
  }
  id v8 = [v4 retryHelper];
  [v8 checkAndScheduleRetries];
}

- (void)_beginXPCTransactionForRequest:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v7 = +[NSString stringWithFormat:@"%@-0x%p", v5, v3];

  id v6 = +[FMXPCTransactionManager sharedInstance];
  [v6 beginTransaction:v7];
}

- (void)_endXPCTransactionForRequest:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v7 = +[NSString stringWithFormat:@"%@-0x%p", v5, v3];

  id v6 = +[FMXPCTransactionManager sharedInstance];
  [v6 endTransaction:v7];
}

- (void)_enablePowerAssertionForRequest:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v7 = +[NSString stringWithFormat:@"%@-0x%p", v5, v3];

  id v6 = +[FMDPowerMgr sharedInstance];
  [v6 powerAssertionEnableWithReason:v7];
}

- (void)_disablePowerAssertionForRequest:(id)a3
{
  id v3 = a3;
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v7 = +[NSString stringWithFormat:@"%@-0x%p", v5, v3];

  id v6 = +[FMDPowerMgr sharedInstance];
  [v6 powerAssertionDisableWithReason:v7];
}

- (id)requestUrlForType:(id)a3 udid:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[FMDServerConfig sharedInstance];
  uint64_t v9 = [v8 urlTemplateForRequestType:v7];

  uint64_t v10 = objc_alloc_init(RequestTemplateURL);
  id v11 = [(FMDServerInteractionController *)self account];
  id v12 = [(RequestTemplateURL *)v10 urlFromTemplate:v9 account:v11 udid:v6];

  return v12;
}

- (id)redirectedRequestURLForType:(id)a3 udid:(id)a4
{
  id v5 = [(FMDServerInteractionController *)self requestUrlForType:a3 udid:a4];
  id v6 = [(FMDServerInteractionController *)self redirectedURL:v5];

  return v6;
}

- (id)redirectedURL:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    id v6 = [v4 host];
    id v7 = [(FMDServerInteractionController *)self account];
    id v8 = [v7 authId];
    uint64_t v9 = +[FMDRealmSupport redirectedHostForHost:v6 withContext:v8];

    uint64_t v10 = v5;
    if (v9)
    {
      uint64_t v10 = v5;
      if (([v6 isEqualToString:v9] & 1) == 0)
      {
        uint64_t v10 = [v5 URLByReplacingHost:v9];
      }
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)account
{
  id v3 = [(FMDServerInteractionController *)self requestAccount];

  if (v3)
  {
    id v4 = [(FMDServerInteractionController *)self requestAccount];
  }
  else
  {
    id v5 = [(FMDServerInteractionController *)self delegate];
    id v4 = [v5 accountForServerInteractionController:self];
  }

  return v4;
}

- (NSString)udid
{
  id v3 = +[FMDSystemConfig sharedInstance];
  id v4 = [v3 deviceUDID];

  if (self->_udid) {
    udid = self->_udid;
  }
  else {
    udid = v4;
  }
  id v6 = udid;

  return v6;
}

- (void)setUdid:(id)a3
{
}

- (FMDAccount)requestAccount
{
  return self->_requestAccount;
}

- (void)setRequestAccount:(id)a3
{
}

- (NSRecursiveLock)requestModifierLock
{
  return self->_requestModifierLock;
}

- (void)setRequestModifierLock:(id)a3
{
}

- (NSArray)channels
{
  return self->_channels;
}

- (void)setChannels:(id)a3
{
}

- (NSMutableArray)requests
{
  return self->_requests;
}

- (void)setRequests:(id)a3
{
}

- (FMDServerInteractionControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_requests, 0);
  objc_storeStrong((id *)&self->_channels, 0);
  objc_storeStrong((id *)&self->_requestModifierLock, 0);
  objc_storeStrong((id *)&self->_requestAccount, 0);

  objc_storeStrong((id *)&self->_udid, 0);
}

@end