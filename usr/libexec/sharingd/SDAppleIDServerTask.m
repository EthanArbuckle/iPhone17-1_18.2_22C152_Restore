@interface SDAppleIDServerTask
- (BOOL)_isTaskInfoValid;
- (BOOL)activated;
- (BOOL)invalidated;
- (NSDictionary)taskInfo;
- (NSString)appleID;
- (NSString)gsToken;
- (NSURLRequest)urlRequest;
- (NSURLSession)session;
- (OS_dispatch_queue)dispatchQueue;
- (SDAppleIDServerTask)initWithType:(int64_t)a3 appleID:(id)a4 info:(id)a5;
- (id)_parseCreateCertificateResponse:(id)a3 error:(int *)a4;
- (id)_parseFetchCertificateResponse:(id)a3 error:(int *)a4;
- (id)_parseFindPersonResponse:(id)a3 error:(int *)a4;
- (id)_parseGetMyInfoResponse:(id)a3 error:(int *)a4;
- (id)_parseServerResponse:(id)a3 error:(int *)a4;
- (id)description;
- (id)responseHandler;
- (int64_t)type;
- (void)_activate;
- (void)_callResponseHandlerWithInfo:(id)a3 error:(int)a4;
- (void)_callResponseHandlerWithInfo:(id)a3 errorInfo:(id)a4 error:(int)a5;
- (void)_handleGSTokenIsAvailable;
- (void)_handleServerError:(int64_t)a3 withStatusCode:(int64_t)a4 nextSuggestedAttemptDelay:(int64_t)a5;
- (void)_handleTaskResponse:(id)a3 withData:(id)a4 error:(int)a5;
- (void)_handleURLIsAvailable:(id)a3 error:(int)a4 completion:(id)a5;
- (void)_handleURLRequestIsAvailable;
- (void)_invalidate;
- (void)_sendRequest;
- (void)_urlRequestWithCompletion:(id)a3;
- (void)_urlWithCompletion:(id)a3;
- (void)activate;
- (void)invalidate;
- (void)setActivated:(BOOL)a3;
- (void)setDispatchQueue:(id)a3;
- (void)setGsToken:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setResponseHandler:(id)a3;
- (void)setSession:(id)a3;
- (void)setUrlRequest:(id)a3;
@end

@implementation SDAppleIDServerTask

- (SDAppleIDServerTask)initWithType:(int64_t)a3 appleID:(id)a4 info:(id)a5
{
  id v9 = a4;
  id v10 = a5;
  v20.receiver = self;
  v20.super_class = (Class)SDAppleIDServerTask;
  v11 = [(SDAppleIDServerTask *)&v20 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_appleID, a4);
    uint64_t v13 = SFMainQueue();
    dispatchQueue = v12->_dispatchQueue;
    v12->_dispatchQueue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v12->_taskInfo, a5);
    v12->_type = a3;
    v15 = +[NSURLSessionConfiguration ephemeralSessionConfiguration];
    [v15 setTimeoutIntervalForResource:3600.0];
    [v15 set_tlsTrustPinningPolicyName:kSecPolicyNameAppleAIDCService];
    id v16 = [objc_alloc((Class)AKAppleIDSession) initWithIdentifier:@"com.apple.coreservices.appleidauthagent"];
    [v15 setWaitsForConnectivity:1];
    [v15 set_appleIDContext:v16];
    uint64_t v17 = +[NSURLSession sessionWithConfiguration:v15];
    session = v12->_session;
    v12->_session = (NSURLSession *)v17;
  }
  return v12;
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (void)activate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100109308;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_callResponseHandlerWithInfo:(id)a3 errorInfo:(id)a4 error:(int)a5
{
  id v12 = a3;
  id v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  id v9 = [(SDAppleIDServerTask *)self responseHandler];

  if (v9)
  {
    if (a5)
    {
      id v10 = +[NSError errorWithDomain:SFAppleIDErrorDomain code:a5 userInfo:v8];
    }
    else
    {
      id v10 = 0;
    }
    v11 = [(SDAppleIDServerTask *)self responseHandler];
    ((void (**)(void, id, void *))v11)[2](v11, v12, v10);

    [(SDAppleIDServerTask *)self setResponseHandler:0];
  }
}

- (void)_callResponseHandlerWithInfo:(id)a3 error:(int)a4
{
}

- (BOOL)_isTaskInfoValid
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v3 = [(SDAppleIDServerTask *)self taskInfo];
  id v4 = [v3 count];

  switch([(SDAppleIDServerTask *)self type])
  {
    case 0:
      if (v4 != (id)1) {
        goto LABEL_40;
      }
      v5 = [(SDAppleIDServerTask *)self taskInfo];
      v6 = v5;
      CFStringRef v7 = @"csr";
      goto LABEL_9;
    case 1:
      if (v4 != (id)1) {
        goto LABEL_40;
      }
      v5 = [(SDAppleIDServerTask *)self taskInfo];
      v6 = v5;
      CFStringRef v7 = @"certificateToken";
LABEL_9:
      id v8 = [v5 objectForKeyedSubscript:v7];

      if (!v8) {
        goto LABEL_43;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_42;
    case 2:
      if (v4 != (id)2) {
        goto LABEL_40;
      }
      id v10 = [(SDAppleIDServerTask *)self taskInfo];
      id v8 = [v10 objectForKeyedSubscript:@"serialNumber"];

      if (!v8) {
        goto LABEL_43;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_43;
      }
      v11 = [(SDAppleIDServerTask *)self taskInfo];
      id v12 = [v11 objectForKeyedSubscript:@"clientAidvrId"];

      if (!v12) {
        goto LABEL_40;
      }
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();
      goto LABEL_37;
    case 3:
      if (v4 != (id)1) {
        goto LABEL_40;
      }
      long long v26 = 0u;
      long long v27 = 0u;
      long long v24 = 0u;
      long long v25 = 0u;
      uint64_t v13 = [(SDAppleIDServerTask *)self taskInfo];
      id v14 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
      if (!v14) {
        goto LABEL_26;
      }
      id v15 = v14;
      uint64_t v16 = *(void *)v25;
      break;
    default:
      if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
      {
        [(SDAppleIDServerTask *)self type];
        LogPrintF();
      }
      goto LABEL_40;
  }
  while (2)
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v25 != v16) {
        objc_enumerationMutation(v13);
      }
      uint64_t v18 = *(void *)(*((void *)&v24 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || ![&off_100906F68 containsObject:v18])
      {

LABEL_40:
        char isKindOfClass = 0;
        goto LABEL_41;
      }
    }
    id v15 = [v13 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v15) {
      continue;
    }
    break;
  }
LABEL_26:

  v19 = [(SDAppleIDServerTask *)self taskInfo];
  id v8 = [v19 objectForKeyedSubscript:@"emails"];

  char isKindOfClass = v8 != 0;
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || [v8 count] != (id)1)
    {
LABEL_43:
      char isKindOfClass = 0;
      goto LABEL_42;
    }
  }
  objc_super v20 = [(SDAppleIDServerTask *)self taskInfo];
  id v12 = [v20 objectForKeyedSubscript:@"phones"];

  if (!v12)
  {
LABEL_41:
    id v8 = 0;
    goto LABEL_42;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = [v12 count];
    if (v8) {
      BOOL v22 = 1;
    }
    else {
      BOOL v22 = v21 == (id)1;
    }
    char isKindOfClass = v22;
  }
  else
  {
    char isKindOfClass = 0;
  }
LABEL_37:
  id v8 = v12;
LABEL_42:

  return isKindOfClass & 1;
}

- (void)_urlWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    if (dword_100967BC8 <= 30 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int64_t v5 = [(SDAppleIDServerTask *)self type];
    v6 = dispatch_get_global_queue(0, 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100109980;
    block[3] = &unk_1008CD7F8;
    int64_t v9 = v5;
    block[4] = self;
    id v8 = v4;
    dispatch_async(v6, block);
  }
  else if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
}

- (void)_handleURLIsAvailable:(id)a3 error:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  int64_t v9 = (void (**)(id, id, uint64_t))a5;
  id v10 = v8;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  v11 = 0;
  id v12 = 0;
  uint64_t v13 = 0;
  id v14 = 0;
  if (v10 && !v6)
  {
    id v14 = [(SDAppleIDServerTask *)self gsToken];

    if (v14)
    {
      id v15 = [SDAppleIDMutableURLRequest alloc];
      uint64_t v16 = [(SDAppleIDServerTask *)self gsToken];
      id v14 = [(SDAppleIDMutableURLRequest *)v15 initWithURL:v10 gsToken:v16];

      if (v14)
      {
        v11 = [(SDAppleIDServerTask *)self taskInfo];

        if (!v11)
        {
LABEL_8:
          uint64_t v13 = v14;
          id v12 = 0;
          uint64_t v6 = 0;
          id v14 = v13;
          goto LABEL_9;
        }
        uint64_t v17 = [(SDAppleIDServerTask *)self taskInfo];
        id v19 = 0;
        v11 = +[NSJSONSerialization dataWithJSONObject:v17 options:0 error:&v19];
        id v12 = v19;

        if (!v12)
        {
          [(SDAppleIDMutableURLRequest *)v14 setHTTPBody:v11];
          goto LABEL_8;
        }
        if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v18 = [v12 localizedDescription];
          LogPrintF();
        }
        uint64_t v6 = NSErrorToOSStatus();
        uint64_t v13 = 0;
      }
      else
      {
        v11 = 0;
        id v12 = 0;
        uint64_t v13 = 0;
        uint64_t v6 = 4294960534;
      }
    }
    else
    {
      v11 = 0;
      id v12 = 0;
      uint64_t v13 = 0;
      uint64_t v6 = 4294960587;
    }
  }
LABEL_9:
  if (v9) {
    v9[2](v9, v13, v6);
  }
}

- (void)_urlRequestWithCompletion:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (v4)
  {
    int64_t v5 = [(SDAppleIDServerTask *)self gsToken];

    if (v5)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_100109F80;
      v7[3] = &unk_1008CD820;
      v7[4] = self;
      id v8 = v4;
      [(SDAppleIDServerTask *)self _urlWithCompletion:v7];

      goto LABEL_4;
    }
    uint64_t v6 = 4294960587;
  }
  else
  {
    uint64_t v6 = 4294960591;
  }
  if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
  if (v4) {
    (*((void (**)(id, void, uint64_t))v4 + 2))(v4, 0, v6);
  }
LABEL_4:
}

- (void)_activate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_activated)
  {
    if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (self->_invalidated)
    {
      if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v3 = 4294960573;
    }
    else
    {
      if (dword_100967BC8 <= 30 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      if ([(SDAppleIDServerTask *)self _isTaskInfoValid])
      {
        [(SDAppleIDServerTask *)self _sendRequest];
        self->_activated = 1;
        return;
      }
      uint64_t v3 = 4294960591;
    }
    [(SDAppleIDServerTask *)self _callResponseHandlerWithInfo:0 error:v3];
  }
}

- (void)invalidate
{
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010A18C;
  block[3] = &unk_1008CA4B8;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_handleURLRequestIsAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = [(SDAppleIDServerTask *)self urlRequest];

  if (v3)
  {
    session = self->_session;
    int64_t v5 = [(SDAppleIDServerTask *)self urlRequest];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_10010A380;
    v12[3] = &unk_1008CD848;
    v12[4] = self;
    uint64_t v3 = [(NSURLSession *)session dataTaskWithRequest:v5 completionHandler:v12];

    [v3 resume];
    if (dword_100967BC8 <= 30)
    {
      if (dword_100967BC8 != -1 || _LogCategory_Initialize())
      {
        unint64_t v6 = [(SDAppleIDServerTask *)self type];
        if (v6 > 3) {
          CFStringRef v7 = @"?";
        }
        else {
          CFStringRef v7 = *(&off_1008CD8B8 + v6);
        }
        CFStringRef v10 = v7;
        LogPrintF();
      }
      if (dword_100967BC8 <= 10 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
      {
        id v8 = [(SDAppleIDServerTask *)self urlRequest];
        int64_t v9 = [v8 allHTTPHeaderFields];
        v11 = [(SDAppleIDServerTask *)self taskInfo];
        LogPrintF();
      }
    }
  }
  else
  {
    [(SDAppleIDServerTask *)self _callResponseHandlerWithInfo:0 error:4294960587];
  }
}

- (void)_handleGSTokenIsAvailable
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  uint64_t v3 = [(SDAppleIDServerTask *)self gsToken];

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_10010A584;
    v4[3] = &unk_1008CD870;
    v4[4] = self;
    [(SDAppleIDServerTask *)self _urlRequestWithCompletion:v4];
  }
  else
  {
    [(SDAppleIDServerTask *)self _callResponseHandlerWithInfo:0 error:4294960587];
  }
}

- (void)_handleServerError:(int64_t)a3 withStatusCode:(int64_t)a4 nextSuggestedAttemptDelay:(int64_t)a5
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (a4 != 401)
  {
    if (a4 != 200)
    {
      if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
      {
        int64_t v11 = a4;
        int64_t v12 = a3;
        LogPrintF();
      }
      uint64_t v9 = 4294960584;
      goto LABEL_26;
    }
    uint64_t v9 = 201215;
    if (a3 > -20210)
    {
      if (a3 == -1)
      {
        uint64_t v9 = 201221;
        goto LABEL_26;
      }
      if (a3 == -20209) {
        goto LABEL_5;
      }
    }
    else
    {
      if ((unint64_t)(a3 + 22412) < 4)
      {
LABEL_5:
        if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
        {
          uint64_t v13 = 200;
          int64_t v11 = a3;
          int64_t v12 = 401;
LABEL_11:
          LogPrintF();
          goto LABEL_26;
        }
        goto LABEL_26;
      }
      if (a3 == -22413)
      {
        if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
        {
          int64_t v11 = 4294944883;
          LogPrintF();
        }
        uint64_t v9 = 201217;
        goto LABEL_26;
      }
    }
    if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      int64_t v11 = a3;
      LogPrintF();
    }
    uint64_t v9 = 201200;
    goto LABEL_26;
  }
  uint64_t v9 = 201215;
  if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    int64_t v11 = 401;
    int64_t v12 = a3;
    goto LABEL_11;
  }
LABEL_26:
  if (a5)
  {
    uint64_t v14 = SFAppleIDErrorUserInfoRetryDelaySecondsKey;
    CFStringRef v10 = +[NSNumber numberWithInteger:a5];
    id v15 = v10;
    a5 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  }
  -[SDAppleIDServerTask _callResponseHandlerWithInfo:errorInfo:error:](self, "_callResponseHandlerWithInfo:errorInfo:error:", 0, a5, v9, v11, v12, v13);
}

- (void)_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  if (self->_invalidated)
  {
    if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    if (dword_100967BC8 <= 30 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    if (self->_activated) {
      [(SDAppleIDServerTask *)self _callResponseHandlerWithInfo:0 error:4294960573];
    }
    self->_invalidated = 1;
  }
}

- (void)_handleTaskResponse:(id)a3 withData:(id)a4 error:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = a4;
  CFStringRef v10 = self;
  id v11 = v9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  unsigned int v50 = v5;
  if (v5)
  {
    if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v33 = [(SDAppleIDServerTask *)self type];
      if (v33 > 3) {
        CFStringRef v34 = @"?";
      }
      else {
        CFStringRef v34 = *(&off_1008CD8B8 + v33);
      }
      id v41 = (id)v34;
      id v42 = (id)v5;
      LogPrintF();
    }
    long long v24 = 0;
    uint64_t v16 = 0;
    v31 = 0;
    BOOL v22 = 0;
    v32 = 0;
    id v49 = 0;
    goto LABEL_25;
  }
  if (!v8)
  {
    if (dword_100967BC8 > 60 || dword_100967BC8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_56;
    }
LABEL_37:
    LogPrintF();
LABEL_56:
    long long v24 = 0;
    uint64_t v16 = 0;
    v31 = 0;
    BOOL v22 = 0;
    v32 = 0;
    id v49 = 0;
    uint64_t v5 = 4294960534;
    unsigned int v50 = -6762;
    goto LABEL_25;
  }
  if (dword_100967BC8 <= 30 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    unint64_t v12 = [(SDAppleIDServerTask *)self type];
    if (v12 > 3) {
      CFStringRef v13 = @"?";
    }
    else {
      CFStringRef v13 = *(&off_1008CD8B8 + v12);
    }
    id v41 = (id)v13;
    id v42 = [v8 statusCode];
    LogPrintF();
    CFStringRef v10 = self;
  }
  if (!v11)
  {
    if (dword_100967BC8 > 60 || dword_100967BC8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_56;
    }
    goto LABEL_37;
  }
  id v14 = v11;
  id v49 = v8;
  id v15 = [[SDAppleIDURLResponse alloc] initWithHTTPUTLResponse:v49 data:v14];
  uint64_t v16 = v15;
  id v47 = v11;
  id v48 = v8;
  id v46 = v14;
  if (v15)
  {
    uint64_t v17 = [(SDAppleIDURLResponse *)v15 responseInfo];

    if (v17)
    {
      if (dword_100967BC8 <= 10 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
      {
        id v41 = [(SDAppleIDURLResponse *)v16 responseInfo];
        LogPrintF();
      }
      uint64_t v18 = [(SDAppleIDURLResponse *)v16 responseInfo];
      uint64_t Int64 = CFDictionaryGetInt64();

      id v20 = [(SDAppleIDURLResponse *)v16 statusCode];
      id v21 = [(SDAppleIDURLResponse *)v16 responseInfo];
      if (v20 != (id)200 || Int64)
      {
        CFStringGetTypeID();
        uint64_t v36 = CFDictionaryGetTypedValue();

        if (v36) {
          CFStringRef v37 = (const __CFString *)v36;
        }
        else {
          CFStringRef v37 = &stru_1008E7020;
        }
        v38 = [(SDAppleIDURLResponse *)v16 responseInfo];
        uint64_t v39 = CFDictionaryGetInt64();

        if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
        {
          CFStringRef v43 = v37;
          uint64_t v44 = v39 / 1000;
          id v41 = [(SDAppleIDURLResponse *)v16 statusCode];
          id v42 = (id)Int64;
          LogPrintF();
        }
        CFStringRef v45 = v37;
        [(SDAppleIDServerTask *)v10 _handleServerError:Int64 withStatusCode:[(SDAppleIDURLResponse *)v16 statusCode] nextSuggestedAttemptDelay:v39 / 1000];
        BOOL v22 = 0;
        int v23 = 0;
      }
      else
      {
        BOOL v22 = [(SDAppleIDServerTask *)v10 _parseServerResponse:v21 error:&v50];

        uint64_t Int64 = 0;
        if (v22)
        {
          CFStringRef v45 = 0;
        }
        else
        {
          CFStringRef v45 = 0;
          int v40 = v50;
          if (!v50) {
            int v40 = 201217;
          }
          unsigned int v50 = v40;
        }
        int v23 = 1;
      }
      goto LABEL_23;
    }
    if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      id v41 = [v49 statusCode:v41 v42];
      id v42 = v49;
      LogPrintF();
    }
    BOOL v22 = 0;
    CFStringRef v45 = 0;
    int v35 = -6712;
  }
  else
  {
    BOOL v22 = 0;
    CFStringRef v45 = 0;
    int v35 = -6762;
  }
  unsigned int v50 = v35;
  int v23 = 1;
  uint64_t Int64 = -1;
LABEL_23:
  long long v24 = +[AKURLBag sharedBag];
  v51[0] = @"httpStatusCode";
  long long v25 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v49 statusCode]);
  v52[0] = v25;
  v51[1] = @"errorCode";
  long long v26 = +[NSNumber numberWithInteger:Int64];
  v52[1] = v26;
  v51[2] = @"type";
  long long v27 = v10;
  v28 = +[NSNumber numberWithInteger:v10->_type];
  v52[2] = v28;
  v51[3] = @"idmsEnv";
  v29 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v24 IDMSEnvironment]);
  v52[3] = v29;
  v30 = +[NSDictionary dictionaryWithObjects:v52 forKeys:v51 count:4];
  SFMetricsLog();

  if (!v23)
  {
    id v11 = v47;
    id v8 = v48;
    v32 = (__CFString *)v45;
    v31 = v46;
    goto LABEL_27;
  }
  uint64_t v5 = v50;
  id v11 = v47;
  id v8 = v48;
  CFStringRef v10 = v27;
  v32 = (__CFString *)v45;
  v31 = v46;
LABEL_25:
  -[SDAppleIDServerTask _callResponseHandlerWithInfo:error:](v10, "_callResponseHandlerWithInfo:error:", v22, v5, v41, v42);
LABEL_27:
}

- (id)_parseCreateCertificateResponse:(id)a3 error:(int *)a4
{
  id v5 = a3;
  CFStringGetTypeID();
  unint64_t v6 = CFDictionaryGetTypedValue();
  if (!v6)
  {
    if (dword_100967BC8 > 90 || dword_100967BC8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_34;
    }
LABEL_27:
    LogPrintF();
LABEL_34:
    id v8 = 0;
    goto LABEL_35;
  }
  CFDictionaryGetTypeID();
  uint64_t v7 = CFDictionaryGetTypedValue();
  if (!v7)
  {
    if (dword_100967BC8 > 90 || dword_100967BC8 == -1 && !_LogCategory_Initialize()) {
      goto LABEL_34;
    }
    goto LABEL_27;
  }
  id v8 = (void *)v7;
  CFStringGetTypeID();
  uint64_t v9 = CFDictionaryGetTypedValue();
  if (v9)
  {
    CFStringRef v10 = (void *)v9;
    id v11 = NSDictionaryGetNSNumber();
    unint64_t v12 = v11;
    if (v11)
    {
      CFStringRef v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)[v11 integerValue] / 1000);
    }
    else
    {
      CFStringRef v13 = 0;
    }
    if (dword_100967BC8 <= 30 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      id v19 = v10;
      id v20 = v13;
      uint64_t v18 = v6;
      LogPrintF();
    }
    if (!v13 || ((unint64_t)[v13 integerValue] & 0x8000000000000000) != 0)
    {
      id v14 = &off_100902B68;
    }
    else
    {
      if ((uint64_t)[v13 integerValue] < 601) {
        goto LABEL_17;
      }
      id v14 = &off_100902B80;
    }

    CFStringRef v13 = v14;
LABEL_17:
    v21[0] = @"AltDSID";
    v21[1] = @"CertificateToken";
    v22[0] = v6;
    v22[1] = v10;
    v21[2] = @"Delay";
    v22[2] = v13;
    id v15 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v22, v21, 3, v18, v19, v20);
    int v16 = 0;
    if (!a4) {
      goto LABEL_19;
    }
    goto LABEL_18;
  }
  if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_35:
  CFStringRef v10 = 0;
  unint64_t v12 = 0;
  CFStringRef v13 = 0;
  id v15 = 0;
  int v16 = 201240;
  if (a4) {
LABEL_18:
  }
    *a4 = v16;
LABEL_19:

  return v15;
}

- (id)_parseFetchCertificateResponse:(id)a3 error:(int *)a4
{
  id v4 = a3;
  id v5 = +[NSMutableDictionary dictionary];
  if (!v5)
  {
    v31 = 0;
    unint64_t v12 = 0;
    uint64_t v7 = 0;
    id v11 = 0;
    CFStringRef v10 = 0;
    v28 = 0;
    v29 = 0;
    id v20 = 0;
    BOOL v22 = 0;
    long long v25 = 0;
    uint64_t v9 = 0;
    int v26 = -6728;
    goto LABEL_80;
  }
  CFStringGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();
  if (v6)
  {
    [v5 setObject:v6 forKeyedSubscript:@"AltDSID"];
  }
  else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFDictionaryGetTypeID();
  uint64_t v7 = CFDictionaryGetTypedValue();
  v31 = (void *)v6;
  if (!v7)
  {
    if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    uint64_t v9 = 0;
    v28 = 0;
    v29 = 0;
    CFStringRef v10 = 0;
    id v11 = 0;
    unint64_t v12 = 0;
    goto LABEL_64;
  }
  CFStringGetTypeID();
  uint64_t v8 = CFDictionaryGetTypedValue();
  v29 = (void *)v8;
  if (v8)
  {
    [v5 setObject:v8 forKeyedSubscript:@"CertificateToken"];
  }
  else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  v28 = CFDictionaryGetTypedValue();
  CFStringRef v13 = [v28 lowercaseString];
  if ([v13 isEqualToString:@"issued"])
  {
    uint64_t v14 = 1;
  }
  else if ([v13 isEqualToString:@"pending"])
  {
    uint64_t v14 = 2;
  }
  else if ([v13 isEqualToString:@"failed"])
  {
    uint64_t v14 = 3;
  }
  else if ([v13 isEqualToString:@"revoked"])
  {
    uint64_t v14 = 4;
  }
  else if ([v13 isEqualToString:@"expired"])
  {
    uint64_t v14 = 5;
  }
  else
  {
    uint64_t v14 = 0;
  }

  id v15 = +[NSNumber numberWithInteger:v14];
  [v5 setObject:v15 forKeyedSubscript:@"CertificateStatus"];

  CFDictionaryGetDouble();
  if (v16 <= 0.0)
  {
    if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    unint64_t v12 = +[NSDate date];
    id v18 = [v12 dateByAddingTimeInterval:15552000.0];
    uint64_t v9 = 0;
LABEL_41:

    unint64_t v12 = v18;
    if (v18) {
      goto LABEL_34;
    }
    goto LABEL_42;
  }
  unint64_t v12 = +[NSDate dateWithTimeIntervalSince1970:v16 / 1000.0];
  uint64_t v17 = +[NSDate date];
  uint64_t v9 = [v17 dateByAddingTimeInterval:155520000.0];

  if ([v9 compare:v12] == (id)-1)
  {
    id v18 = v9;
    uint64_t v9 = v18;
    goto LABEL_41;
  }
  if (v12)
  {
LABEL_34:
    [v5 setObject:v12 forKeyedSubscript:@"CertificateExpirationDate"];
    goto LABEL_46;
  }
LABEL_42:
  if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
    LogPrintF();
  }
LABEL_46:
  CFStringGetTypeID();
  id v11 = CFDictionaryGetTypedValue();
  if (v11)
  {
    [v5 setObject:v11 forKeyedSubscript:@"CertificatePEM"];
  }
  else if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFStringGetTypeID();
  CFStringRef v10 = CFDictionaryGetTypedValue();
  if (v10)
  {
    [v5 setObject:v10 forKeyedSubscript:@"CertificateSerialNumber"];
  }
  else if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  if (v14 != 2)
  {
LABEL_64:
    id v20 = 0;
    BOOL v22 = 0;
    goto LABEL_73;
  }
  id v19 = NSDictionaryGetNSNumber();
  id v20 = v19;
  if (!v19)
  {
    if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    BOOL v22 = 0;
    goto LABEL_70;
  }
  id v21 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)[v19 integerValue] / 1000);
  BOOL v22 = v21;
  if (!v21 || ((unint64_t)[v21 integerValue] & 0x8000000000000000) != 0)
  {
LABEL_70:
    int v23 = &off_100902B68;
    goto LABEL_71;
  }
  if ((uint64_t)[v22 integerValue] >= 601)
  {
    int v23 = &off_100902B80;
LABEL_71:

    BOOL v22 = v23;
  }
  [v5 setObject:v22 forKeyedSubscript:@"Delay"];
LABEL_73:
  CFStringGetTypeID();
  uint64_t v24 = CFDictionaryGetTypedValue();
  if (v24)
  {
    long long v25 = (void *)v24;
    [v5 setObject:v24 forKeyedSubscript:@"IntermediateCertificate"];
    int v26 = 0;
  }
  else
  {
    if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    int v26 = 0;
    long long v25 = 0;
  }
LABEL_80:
  if (a4) {
    *a4 = v26;
  }

  return v5;
}

- (id)_parseFindPersonResponse:(id)a3 error:(int *)a4
{
  BOOL v22 = a4;
  id v4 = a3;
  id v5 = +[NSDate date];
  int v23 = v4;
  if (!v5)
  {
    CFStringRef v10 = 0;
    id v11 = 0;
    CFStringRef v13 = 0;
    uint64_t v17 = 0;
    id v18 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    goto LABEL_69;
  }
  CFArrayGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();
  if (v6)
  {
    uint64_t v7 = v6;
    if ([v6 count])
    {
      if ([v7 count] == (id)1)
      {
        uint64_t v8 = [v7 firstObject];
        uint64_t v9 = +[NSMutableDictionary dictionary];
        if (v9)
        {
          CFStringGetTypeID();
          CFStringRef v10 = CFDictionaryGetTypedValue();
          if (v10)
          {
            [v9 setObject:v10 forKeyedSubscript:@"AccountIdentifier"];
          }
          else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          CFStringGetTypeID();
          id v11 = CFDictionaryGetTypedValue();
          if (v11)
          {
            [v9 setObject:v11 forKeyedSubscript:@"AltDSID"];
          }
          else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          CFStringGetTypeID();
          unint64_t v12 = CFDictionaryGetTypedValue();
          CFStringRef v13 = v12;
          if (v12)
          {
            uint64_t v14 = [v12 lowercaseString];
            if ([v14 isEqualToString:@"issued"])
            {
              uint64_t v15 = 1;
            }
            else if ([v14 isEqualToString:@"pending"])
            {
              uint64_t v15 = 2;
            }
            else if ([v14 isEqualToString:@"failed"])
            {
              uint64_t v15 = 3;
            }
            else if ([v14 isEqualToString:@"revoked"])
            {
              uint64_t v15 = 4;
            }
            else if ([v14 isEqualToString:@"expired"])
            {
              uint64_t v15 = 5;
            }
            else
            {
              uint64_t v15 = 0;
            }

            double v16 = +[NSNumber numberWithInteger:v15];
            [v9 setObject:v16 forKeyedSubscript:@"CertificateStatus"];
          }
          else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          CFStringGetTypeID();
          uint64_t v17 = CFDictionaryGetTypedValue();
          if (v17)
          {
            [v9 setObject:v17 forKeyedSubscript:@"Matched"];
          }
          else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          CFStringGetTypeID();
          id v18 = CFDictionaryGetTypedValue();
          if (v18)
          {
            [v9 setObject:v18 forKeyedSubscript:@"MatchedValue"];
          }
          else if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
          {
            LogPrintF();
          }
          id v19 = [v5 dateByAddingTimeInterval:2592000.0, v22, v23];
          [v9 setObject:v19 forKeyedSubscript:@"ValidUntil"];

          if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
            LogPrintF();
          }
          int v20 = 0;
          goto LABEL_53;
        }
        CFStringRef v10 = 0;
        id v11 = 0;
        CFStringRef v13 = 0;
        uint64_t v17 = 0;
        id v18 = 0;
LABEL_69:
        int v20 = -6728;
        goto LABEL_53;
      }
      if (dword_100967BC8 <= 60 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      CFStringRef v10 = 0;
      id v11 = 0;
      CFStringRef v13 = 0;
      uint64_t v17 = 0;
      id v18 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
      int v20 = 201241;
    }
    else
    {
      int v20 = 201223;
      if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      CFStringRef v10 = 0;
      id v11 = 0;
      CFStringRef v13 = 0;
      uint64_t v17 = 0;
      id v18 = 0;
      uint64_t v8 = 0;
      uint64_t v9 = 0;
    }
  }
  else
  {
    if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
      LogPrintF();
    }
    CFStringRef v10 = 0;
    id v11 = 0;
    CFStringRef v13 = 0;
    uint64_t v17 = 0;
    id v18 = 0;
    uint64_t v7 = 0;
    uint64_t v8 = 0;
    uint64_t v9 = 0;
    int v20 = 201240;
  }
LABEL_53:
  if (v22) {
    *BOOL v22 = v20;
  }

  return v9;
}

- (id)_parseGetMyInfoResponse:(id)a3 error:(int *)a4
{
  id v5 = a3;
  CFDictionaryGetTypeID();
  uint64_t v6 = CFDictionaryGetTypedValue();
  if (v6)
  {
    CFStringGetTypeID();
    uint64_t v45 = CFDictionaryGetTypedValue();
    CFDictionaryGetDouble();
    uint64_t v8 = 0;
    if (v7 > 0.0)
    {
      uint64_t v8 = +[NSDate dateWithTimeIntervalSince1970:v7 / 1000.0];
    }
    CFStringGetTypeID();
    id v46 = CFDictionaryGetTypedValue();
    CFStringGetTypeID();
    uint64_t v9 = CFDictionaryGetTypedValue();
    CFStringRef v10 = [v9 lowercaseString];
    if ([v10 isEqualToString:@"issued"])
    {
      uint64_t v11 = 1;
    }
    else if ([v10 isEqualToString:@"pending"])
    {
      uint64_t v11 = 2;
    }
    else if ([v10 isEqualToString:@"failed"])
    {
      uint64_t v11 = 3;
    }
    else if ([v10 isEqualToString:@"revoked"])
    {
      uint64_t v11 = 4;
    }
    else
    {
      unsigned int v12 = [v10 isEqualToString:@"expired"];
      uint64_t v11 = 5;
      if (!v12) {
        uint64_t v11 = 0;
      }
    }
    uint64_t v41 = v11;

    CFStringRef v43 = v9;
    if (dword_100967BC8 <= 30 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      int v35 = v46;
      uint64_t v36 = v9;
      unint64_t v33 = (void *)v45;
      CFStringRef v34 = (void *)v8;
      LogPrintF();
    }
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v45 = 0;
    id v46 = 0;
    CFStringRef v43 = 0;
    uint64_t v41 = 0;
  }
  CFStringGetTypeID();
  uint64_t v13 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  v51 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  unsigned int v50 = CFDictionaryGetTypedValue();
  CFDictionaryGetDouble();
  double v15 = v14;
  CFArrayGetTypeID();
  id v49 = CFDictionaryGetTypedValue();
  CFArrayGetTypeID();
  id v48 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  double v16 = CFDictionaryGetTypedValue();
  CFStringGetTypeID();
  id v47 = CFDictionaryGetTypedValue();
  uint64_t v17 = NSDictionaryGetNSNumber();
  if (dword_100967BC8 <= 30)
  {
    if (dword_100967BC8 != -1 || _LogCategory_Initialize())
    {
      CFStringRef v37 = v48;
      v38 = v47;
      uint64_t v36 = v49;
      int v35 = v50;
      unint64_t v33 = (void *)v13;
      CFStringRef v34 = v51;
      uint64_t v39 = v17;
      uint64_t v40 = (int)v15;
      LogPrintF();
    }
    if (dword_100967BC8 <= 10 && (dword_100967BC8 != -1 || _LogCategory_Initialize()))
    {
      unint64_t v33 = v16;
      LogPrintF();
    }
  }
  id v42 = (void *)v13;
  double v18 = v15 / 1000.0;
  if (v15 / 1000.0 > 7776000.0 || v18 == 0.0) {
    double v20 = 2592000.0;
  }
  else {
    double v20 = v15 / 1000.0;
  }
  id v21 = +[NSDate date];
  BOOL v22 = [v21 dateByAddingTimeInterval:v20];
  if (v17) {
    int v23 = (_UNKNOWN **)v17;
  }
  else {
    int v23 = &off_100902B98;
  }
  if (v16) {
    id v24 = [objc_alloc((Class)NSData) initWithBase64EncodedString:v16 options:1];
  }
  else {
    id v24 = 0;
  }
  long long v25 = +[NSMutableDictionary dictionary];
  int v26 = v25;
  uint64_t v44 = (void *)v8;
  if (v25)
  {
    [v25 setObject:v8 forKeyedSubscript:@"CertificateExpirationDate"];
    [v26 setObject:v46 forKeyedSubscript:@"CertificateSerialNumber"];
    +[NSNumber numberWithInteger:v41];
    long long v27 = a4;
    v29 = v28 = v6;
    [v26 setObject:v29 forKeyedSubscript:@"CertificateStatus"];

    uint64_t v6 = v28;
    a4 = v27;
    v30 = (void *)v45;
    [v26 setObject:v45 forKeyedSubscript:@"CertificateToken"];
    [v26 setObject:v51 forKeyedSubscript:@"FirstName"];
    [v26 setObject:v50 forKeyedSubscript:@"LastName"];
    [v26 setObject:v49 forKeyedSubscript:@"ValidatedEmails"];
    [v26 setObject:v48 forKeyedSubscript:@"ValidatedPhones"];
    [v26 setObject:v24 forKeyedSubscript:@"ValidationRecordData"];
    [v26 setObject:v47 forKeyedSubscript:@"ValidationRecordDataID"];
    [v26 setObject:v22 forKeyedSubscript:@"ValidationRecordNextCheckDate"];
    [v26 setObject:v23 forKeyedSubscript:@"Version"];
    int v31 = 0;
    if (!a4) {
      goto LABEL_42;
    }
    goto LABEL_41;
  }
  int v31 = -6728;
  v30 = (void *)v45;
  if (a4) {
LABEL_41:
  }
    *a4 = v31;
LABEL_42:

  return v26;
}

- (id)_parseServerResponse:(id)a3 error:(int *)a4
{
  id v6 = a3;
  int v10 = 0;
  switch(self->_type)
  {
    case 0:
      uint64_t v7 = [(SDAppleIDServerTask *)self _parseCreateCertificateResponse:v6 error:&v10];
      goto LABEL_9;
    case 1:
      uint64_t v7 = [(SDAppleIDServerTask *)self _parseFetchCertificateResponse:v6 error:&v10];
      goto LABEL_9;
    case 2:
      uint64_t v7 = [(SDAppleIDServerTask *)self _parseGetMyInfoResponse:v6 error:&v10];
      goto LABEL_9;
    case 3:
      uint64_t v7 = [(SDAppleIDServerTask *)self _parseFindPersonResponse:v6 error:&v10];
LABEL_9:
      uint64_t v8 = (void *)v7;
      if (a4) {
        goto LABEL_10;
      }
      goto LABEL_11;
    default:
      if (dword_100967BC8 <= 90 && (dword_100967BC8 != -1 || _LogCategory_Initialize())) {
        LogPrintF();
      }
      uint64_t v8 = 0;
      int v10 = -6756;
      if (!a4) {
        goto LABEL_11;
      }
LABEL_10:
      *a4 = v10;
LABEL_11:

      return v8;
  }
}

- (void)_sendRequest
{
  uint64_t v3 = [(SDAppleIDServerTask *)self appleID];
  dispatchQueue = self->_dispatchQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10010CBE8;
  v5[3] = &unk_1008CD898;
  v5[4] = self;
  sub_10022F51C(v3, dispatchQueue, v5);
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
}

- (id)responseHandler
{
  return self->_responseHandler;
}

- (void)setResponseHandler:(id)a3
{
}

- (BOOL)activated
{
  return self->_activated;
}

- (void)setActivated:(BOOL)a3
{
  self->_activated = a3;
}

- (NSString)appleID
{
  return self->_appleID;
}

- (NSString)gsToken
{
  return self->_gsToken;
}

- (void)setGsToken:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (NSURLSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (NSDictionary)taskInfo
{
  return self->_taskInfo;
}

- (int64_t)type
{
  return self->_type;
}

- (NSURLRequest)urlRequest
{
  return self->_urlRequest;
}

- (void)setUrlRequest:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_urlRequest, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_gsToken, 0);
  objc_storeStrong((id *)&self->_appleID, 0);
  objc_storeStrong(&self->_responseHandler, 0);

  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end