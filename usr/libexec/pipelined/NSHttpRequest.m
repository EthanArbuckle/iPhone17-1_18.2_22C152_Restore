@interface NSHttpRequest
+ (id)UrlFromUtf8String:(const void *)a3;
+ (id)encodeFormValues:(id)a3;
+ (id)getCookie:(id)a3 forUrl:(id)a4;
+ (id)getCookiesForUrl:(id)a3;
+ (id)header:(id)a3 valueForKey:(id)a4;
+ (id)header:(id)a3 valuesForKey:(id)a4;
+ (id)requestWithUrl:(id)a3;
- (BOOL)fExecuting;
- (BOOL)fFinished;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (NSHTTPURLResponse)fHttpResponse;
- (NSHttpRequest)init;
- (NSHttpRequest)initWithUrl:(id)a3;
- (NSMultiPartInputStream)fBody;
- (NSMutableData)fReceivedData;
- (NSMutableURLRequest)fActiveRequest;
- (NSString)description;
- (NSString)fOriginalThreadName;
- (NSURL)fUrl;
- (NSURLConnection)fUrlConnection;
- (id)onError;
- (id)onHeaders;
- (id)onProgress;
- (id)onResponse;
- (id)onUploadProgress;
- (void)addFormPart:(id)a3 withFilename:(id)a4 andDataStreams:(const void *)a5;
- (void)addFormPart:(id)a3 withFilename:(id)a4 andPath:(const void *)a5;
- (void)addValue:(id)a3 forHTTPHeaderField:(id)a4;
- (void)connection:(id)a3 didFailWithError:(id)a4;
- (void)connection:(id)a3 didReceiveData:(id)a4;
- (void)connection:(id)a3 didReceiveResponse:(id)a4;
- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6;
- (void)connectionDidFinishLoading:(id)a3;
- (void)handleCancelled:(id)a3;
- (void)handleCompleted;
- (void)main;
- (void)setCachePolicy:(unint64_t)a3;
- (void)setContentLength:(unint64_t)a3;
- (void)setContentType:(id)a3;
- (void)setFActiveRequest:(id)a3;
- (void)setFBody:(id)a3;
- (void)setFExecuting:(BOOL)a3;
- (void)setFFinished:(BOOL)a3;
- (void)setFHttpResponse:(id)a3;
- (void)setFOriginalThreadName:(id)a3;
- (void)setFReceivedData:(id)a3;
- (void)setFUrl:(id)a3;
- (void)setFUrlConnection:(id)a3;
- (void)setHttpBody:(id)a3;
- (void)setHttpBodyStream:(pair<NSInputStream *);
- (void)setHttpHeaders:(id)a3;
- (void)setHttpMethod:(int)a3;
- (void)setMainDocumentUrl:(id)a3;
- (void)setMultiPart;
- (void)setOnError:(id)a3;
- (void)setOnHeaders:(id)a3;
- (void)setOnProgress:(id)a3;
- (void)setOnResponse:(id)a3;
- (void)setOnUploadProgress:(id)a3;
- (void)setRequestType:(unint64_t)a3;
- (void)start;
- (void)startExecuting;
- (void)stopExecuting;
@end

@implementation NSHttpRequest

+ (id)UrlFromUtf8String:(const void *)a3
{
  if (*((char *)a3 + 23) < 0) {
    a3 = *(const void **)a3;
  }
  v3 = +[NSString stringWithUTF8String:a3];
  v4 = +[NSURL URLWithString:v3];

  return v4;
}

+ (id)header:(id)a3 valueForKey:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKey:v5];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [v6 objectAtIndex:0];
      goto LABEL_8;
    }
    uint64_t v8 = objc_opt_class();
    NSLog(@"Bad object type %@ stored for header %@", v8, v5);
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)header:(id)a3 valuesForKey:(id)a4
{
  id v5 = a4;
  v6 = [a3 objectForKey:v5];
  if (v6)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      goto LABEL_8;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = +[NSArray arrayWithObject:v6];
      goto LABEL_8;
    }
    uint64_t v8 = objc_opt_class();
    NSLog(@"Bad object type %@ stored for header %@", v8, v5);
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

+ (id)requestWithUrl:(id)a3
{
  id v3 = a3;
  v4 = [[NSHttpRequest alloc] initWithUrl:v3];

  return v4;
}

+ (id)getCookiesForUrl:(id)a3
{
  id v3 = a3;
  v4 = +[NSHTTPCookieStorage sharedHTTPCookieStorage];
  id v5 = [v4 cookiesForURL:v3];

  return v5;
}

+ (id)getCookie:(id)a3 forUrl:(id)a4
{
  id v5 = a3;
  +[NSHttpRequest getCookiesForUrl:a4];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        v11 = [v10 name];
        unsigned __int8 v12 = [v11 isEqualToString:v5];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

+ (id)encodeFormValues:(id)a3
{
  id v15 = a3;
  id v3 = objc_alloc_init((Class)NSMutableData);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v15;
  id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v17;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v17 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v3 length]) {
          [v3 appendBytes:"&" length:1];
        }
        v9 = [v4 objectForKeyedSubscript:v8];
        v10 = [v8 ps_urlEncode];
        v11 = [v9 ps_urlEncode];
        unsigned __int8 v12 = +[NSString stringWithFormat:@"%@=%@", v10, v11];

        v13 = [v12 dataUsingEncoding:4];
        [v3 appendData:v13];
      }
      id v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v5);
  }

  return v3;
}

- (NSHttpRequest)init
{
  id v2 = +[NSException exceptionWithName:NSInternalInconsistencyException reason:@"-init is not a valid initializer for the class LoginImpl" userInfo:0];
  objc_exception_throw(v2);
}

- (NSHttpRequest)initWithUrl:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)NSHttpRequest;
  id v5 = [(NSHttpRequest *)&v15 init];
  uint64_t v6 = v5;
  if (v5)
  {
    [(NSHttpRequest *)v5 setFUrl:v4];
    [(NSHttpRequest *)v6 setOnResponse:0];
    [(NSHttpRequest *)v6 setOnHeaders:0];
    [(NSHttpRequest *)v6 setOnError:0];
    [(NSHttpRequest *)v6 setFReceivedData:0];
    [(NSHttpRequest *)v6 setFFinished:0];
    [(NSHttpRequest *)v6 setFExecuting:0];
    [(NSHttpRequest *)v6 setFHttpResponse:0];
    id v7 = +[NSMutableURLRequest requestWithURL:v4];
    [(NSHttpRequest *)v6 setFActiveRequest:v7];

    uint64_t v8 = [(NSHttpRequest *)v6 fActiveRequest];
    [v8 setHTTPShouldUsePipelining:1];

    v9 = sub_1001637D8();
    sub_1000776C8((uint64_t)v9);
    LODWORD(v8) = v16[0];
    sub_100077BC8((uint64_t)v16);
    if (v8 != (int)v8 >> 31)
    {
      v16[0] = sub_1001637D8();
      v16[1] = v10;
      uint64_t v14 = 0;
      double v11 = sub_100367C70((uint64_t)v16, (double *)&v14);
      unsigned __int8 v12 = [(NSHttpRequest *)v6 fActiveRequest];
      [v12 setTimeoutInterval:v11];
    }
  }

  return v6;
}

- (void)setMainDocumentUrl:(id)a3
{
  id v5 = a3;
  id v4 = [(NSHttpRequest *)self fActiveRequest];
  [v4 setMainDocumentURL:v5];
}

- (void)handleCancelled:(id)a3
{
  id v4 = a3;
  if (v4) {
    [v4 cancel];
  }
  [(NSHttpRequest *)self handleCompleted];
}

- (void)startExecuting
{
  [(NSHttpRequest *)self willChangeValueForKey:@"isExecuting"];
  [(NSHttpRequest *)self setFExecuting:1];

  [(NSHttpRequest *)self didChangeValueForKey:@"isExecuting"];
}

- (void)stopExecuting
{
  [(NSHttpRequest *)self willChangeValueForKey:@"isExecuting"];
  [(NSHttpRequest *)self setFExecuting:0];

  [(NSHttpRequest *)self didChangeValueForKey:@"isExecuting"];
}

- (NSString)description
{
  id v2 = [(NSHttpRequest *)self fActiveRequest];
  id v3 = [v2 URL];
  id v4 = [v3 description];

  return (NSString *)v4;
}

- (void)handleCompleted
{
  [(NSHttpRequest *)self setFBody:0];
  [(NSHttpRequest *)self setFReceivedData:0];
  [(NSHttpRequest *)self setFHttpResponse:0];
  id v3 = [(NSHttpRequest *)self fOriginalThreadName];
  id v4 = +[NSThread currentThread];
  [v4 setName:v3];

  id v5 = [(NSHttpRequest *)self fUrl];
  uint64_t v6 = +[NSMutableURLRequest requestWithURL:v5];
  [(NSHttpRequest *)self setFActiveRequest:v6];

  [(NSHttpRequest *)self willChangeValueForKey:@"isFinished"];
  [(NSHttpRequest *)self willChangeValueForKey:@"isExecuting"];
  [(NSHttpRequest *)self setFFinished:1];
  [(NSHttpRequest *)self setFExecuting:0];
  [(NSHttpRequest *)self didChangeValueForKey:@"isExecuting"];

  [(NSHttpRequest *)self didChangeValueForKey:@"isFinished"];
}

- (void)start
{
  id v3 = [(NSHttpRequest *)self fBody];

  if (v3)
  {
    id v4 = [(NSHttpRequest *)self fBody];
    -[NSHttpRequest setContentLength:](self, "setContentLength:", [v4 length]);
  }
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:0];
  }
  else
  {
    id v5 = +[NSOperationQueue currentQueue];
    [(NSHttpRequest *)self startExecuting];
    if (v5) {
      [(NSHttpRequest *)self main];
    }
    else {
      +[NSThread detachNewThreadSelector:"main" toTarget:self withObject:0];
    }
  }
}

- (void)main
{
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:0];
  }
  else
  {
    [(NSHttpRequest *)self setFHttpResponse:0];
    id v11 = +[NSThread currentThread];
    id v3 = [v11 name];
    [(NSHttpRequest *)self setFOriginalThreadName:v3];

    id v12 = [(NSHttpRequest *)self fUrl];
    id v4 = +[NSString stringWithFormat:@"HttpRequest@%@", v12];
    id v5 = +[NSThread currentThread];
    [v5 setName:v4];

    id v6 = objc_alloc((Class)NSURLConnection);
    id v7 = [(NSHttpRequest *)self fActiveRequest];
    id v13 = [v6 initWithRequest:v7 delegate:self startImmediately:0];

    uint64_t v8 = +[NSRunLoop currentRunLoop];
    [v13 scheduleInRunLoop:v8 forMode:NSRunLoopCommonModes];
    [v13 start];
    [(NSHttpRequest *)self stopExecuting];
    do
    {
      if ([(NSHttpRequest *)self fFinished]) {
        break;
      }
      v9 = +[NSDate distantFuture];
      unsigned __int8 v10 = [v8 runMode:NSDefaultRunLoopMode beforeDate:v9];
    }
    while ((v10 & 1) != 0);
  }
}

- (BOOL)isConcurrent
{
  return 1;
}

- (BOOL)isExecuting
{
  return [(NSHttpRequest *)self fExecuting];
}

- (void)setRequestType:(unint64_t)a3
{
  id v4 = [(NSHttpRequest *)self fActiveRequest];
  [v4 setNetworkServiceType:a3];
}

- (void)setCachePolicy:(unint64_t)a3
{
  id v4 = [(NSHttpRequest *)self fActiveRequest];
  [v4 setCachePolicy:a3];
}

- (void)setHttpMethod:(int)a3
{
  if (a3)
  {
    if (a3 != 1)
    {
      __cxa_allocate_exception(0x40uLL);
      sub_1000AE4B0(&v5, "Unknown http method");
      std::runtime_error::runtime_error(&v6, &v5);
      v6.__vftable = (std::runtime_error_vtbl *)&off_100453860;
      sub_10018E868((uint64_t)v4);
      sub_1000D1698(&v6, (uint64_t)"-[NSHttpRequest setHttpMethod:]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/purpleslam/common/http/NSHttpRequest.mm", 292, (uint64_t)v4);
    }
    id v3 = [(NSHttpRequest *)self fActiveRequest];
    [v3 setHTTPMethod:@"GET"];
  }
  else
  {
    id v3 = [(NSHttpRequest *)self fActiveRequest];
    [v3 setHTTPMethod:@"POST"];
  }
}

- (void)setContentType:(id)a3
{
  id v5 = a3;
  id v4 = [(NSHttpRequest *)self fActiveRequest];
  [v4 setValue:v5 forHTTPHeaderField:@"Content-Type"];
}

- (void)setContentLength:(unint64_t)a3
{
  id v5 = [(NSHttpRequest *)self fActiveRequest];
  id v4 = +[NSString stringWithFormat:@"%zu", a3];
  [v5 setValue:v4 forHTTPHeaderField:@"Content-Length"];
}

- (void)setHttpHeaders:(id)a3
{
  id v5 = a3;
  id v4 = [(NSHttpRequest *)self fActiveRequest];
  [v4 setAllHTTPHeaderFields:v5];
}

- (void)addValue:(id)a3 forHTTPHeaderField:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  id v7 = [(NSHttpRequest *)self fActiveRequest];
  [v7 addValue:v8 forHTTPHeaderField:v6];
}

- (void)setHttpBody:(id)a3
{
  id v5 = a3;
  id v4 = [(NSHttpRequest *)self fActiveRequest];
  [v4 setHTTPBody:v5];

  -[NSHttpRequest setContentLength:](self, "setContentLength:", [v5 length]);
}

- (void)setHttpBodyStream:(pair<NSInputStream *)
{
  first = a3.first;
  id v5 = [(NSHttpRequest *)self fActiveRequest];
  [v5 setHTTPBodyStream:first->super.super.isa];

  Class isa = first[1].super.super.isa;

  [(NSHttpRequest *)self setContentLength:isa];
}

- (void)setMultiPart
{
  id v3 = [(NSHttpRequest *)self fBody];

  if (!v3)
  {
    id v7 = objc_alloc_init(NSMultiPartInputStream);
    -[NSHttpRequest setFBody:](self, "setFBody:");

    id v8 = [(NSHttpRequest *)self fActiveRequest];
    id v4 = [(NSHttpRequest *)self fBody];
    [v8 setHTTPBodyStream:v4];

    id v9 = [(NSHttpRequest *)self fBody];
    id v5 = [v9 boundary];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"multipart/form-data; boundary=%@",
    id v6 = v5);
    [(NSHttpRequest *)self setContentType:v6];
  }
}

- (void)addFormPart:(id)a3 withFilename:(id)a4 andPath:(const void *)a5
{
  id v10 = a3;
  id v8 = a4;
  [(NSHttpRequest *)self setMultiPart];
  id v9 = [(NSHttpRequest *)self fBody];
  [v9 addPart:v10 withPath:a5 andFilename:v8];
}

- (void)addFormPart:(id)a3 withFilename:(id)a4 andDataStreams:(const void *)a5
{
  id v10 = a3;
  id v8 = a4;
  [(NSHttpRequest *)self setMultiPart];
  id v9 = [(NSHttpRequest *)self fBody];
  [v9 addPart:v10 withData:a5 andFilename:v8];
}

- (void)connection:(id)a3 didReceiveResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSHttpRequest *)self startExecuting];
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:v6];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      sub_1000AE4B0(v19, "");
      sub_1002700F4("Non-http response received", &__p);
      sub_10016A2C4((uint64_t)v19, (uint64_t)&__p, 1);
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0) {
        operator delete(__p.__r_.__value_.__l.__data_);
      }
      if (v20 < 0) {
        operator delete(v19[0]);
      }
      sub_1000D11E0((uint64_t)&v18);
    }
    [(NSHttpRequest *)self setFHttpResponse:v7];
    id v8 = [(NSHttpRequest *)self onHeaders];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      __p.__r_.__value_.__s.__data_[0] = 0;
      id v10 = [(NSHttpRequest *)self onHeaders];
      id v11 = [(NSHttpRequest *)self fHttpResponse];
      ((void (**)(void, void *, std::string *))v10)[2](v10, v11, &__p);

      if (__p.__r_.__value_.__s.__data_[0]) {
        goto LABEL_6;
      }
    }
    id v12 = objc_alloc_init((Class)NSMutableData);
    [(NSHttpRequest *)self setFReceivedData:v12];

    id v13 = [(NSHttpRequest *)self onProgress];
    LOBYTE(v12) = v13 == 0;

    if (v12) {
      goto LABEL_9;
    }
    __p.__r_.__value_.__s.__data_[0] = 0;
    uint64_t v14 = [(NSHttpRequest *)self onProgress];
    objc_super v15 = [(NSHttpRequest *)self fReceivedData];
    id v16 = [v15 length];
    long long v17 = [(NSHttpRequest *)self fHttpResponse];
    ((void (**)(void, id, id, std::string *))v14)[2](v14, v16, [v17 expectedContentLength], &__p);

    if (__p.__r_.__value_.__s.__data_[0])
    {
LABEL_6:
      [(NSHttpRequest *)self cancel];
      [(NSHttpRequest *)self handleCancelled:v6];
    }
    else
    {
LABEL_9:
      [(NSHttpRequest *)self stopExecuting];
    }
  }
}

- (void)connection:(id)a3 didSendBodyData:(int64_t)a4 totalBytesWritten:(int64_t)a5 totalBytesExpectedToWrite:(int64_t)a6
{
  id v9 = a3;
  [(NSHttpRequest *)self startExecuting];
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:v9];
  }
  else
  {
    id v10 = [(NSHttpRequest *)self onUploadProgress];

    if (v10
      && (char v12 = 0,
          [(NSHttpRequest *)self onUploadProgress],
          id v11 = (void (**)(void, void, void, void))objc_claimAutoreleasedReturnValue(),
          ((void (**)(void, int64_t, int64_t, char *))v11)[2](v11, a5, a6, &v12),
          v11,
          v12))
    {
      [(NSHttpRequest *)self cancel];
      [(NSHttpRequest *)self handleCancelled:v9];
    }
    else
    {
      [(NSHttpRequest *)self stopExecuting];
    }
  }
}

- (void)connection:(id)a3 didReceiveData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(NSHttpRequest *)self startExecuting];
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:v6];
  }
  else
  {
    id v8 = [(NSHttpRequest *)self fReceivedData];
    [v8 appendData:v7];

    id v9 = [(NSHttpRequest *)self onProgress];

    if (!v9) {
      goto LABEL_6;
    }
    char v14 = 0;
    id v10 = [(NSHttpRequest *)self onProgress];
    id v11 = [(NSHttpRequest *)self fReceivedData];
    id v12 = [v11 length];
    id v13 = [(NSHttpRequest *)self fHttpResponse];
    ((void (**)(void, id, id, char *))v10)[2](v10, v12, [v13 expectedContentLength], &v14);

    if (v14)
    {
      [(NSHttpRequest *)self cancel];
      [(NSHttpRequest *)self handleCancelled:v6];
    }
    else
    {
LABEL_6:
      [(NSHttpRequest *)self stopExecuting];
    }
  }
}

- (void)connection:(id)a3 didFailWithError:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  [(NSHttpRequest *)self startExecuting];
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:v10];
  }
  else
  {
    id v7 = [(NSHttpRequest *)self onError];

    if (v7)
    {
      id v8 = [(NSHttpRequest *)self onError];
      id v9 = [(NSHttpRequest *)self fHttpResponse];
      ((void (**)(void, void *, id))v8)[2](v8, v9, v6);
    }
    [(NSHttpRequest *)self handleCompleted];
  }
}

- (void)connectionDidFinishLoading:(id)a3
{
  id v8 = a3;
  if ([(NSHttpRequest *)self isCancelled])
  {
    [(NSHttpRequest *)self handleCancelled:v8];
  }
  else
  {
    id v4 = [(NSHttpRequest *)self onResponse];

    if (v4)
    {
      id v5 = [(NSHttpRequest *)self onResponse];
      id v6 = [(NSHttpRequest *)self fHttpResponse];
      id v7 = [(NSHttpRequest *)self fReceivedData];
      ((void (**)(void, void *, void *))v5)[2](v5, v6, v7);
    }
    [(NSHttpRequest *)self handleCompleted];
  }
}

- (id)onResponse
{
  return self->_onResponse;
}

- (void)setOnResponse:(id)a3
{
}

- (id)onProgress
{
  return self->_onProgress;
}

- (void)setOnProgress:(id)a3
{
}

- (id)onUploadProgress
{
  return self->_onUploadProgress;
}

- (void)setOnUploadProgress:(id)a3
{
}

- (id)onHeaders
{
  return self->_onHeaders;
}

- (void)setOnHeaders:(id)a3
{
}

- (id)onError
{
  return self->_onError;
}

- (void)setOnError:(id)a3
{
}

- (NSURL)fUrl
{
  return self->_fUrl;
}

- (void)setFUrl:(id)a3
{
}

- (NSMutableURLRequest)fActiveRequest
{
  return self->_fActiveRequest;
}

- (void)setFActiveRequest:(id)a3
{
}

- (NSMutableData)fReceivedData
{
  return self->_fReceivedData;
}

- (void)setFReceivedData:(id)a3
{
}

- (NSURLConnection)fUrlConnection
{
  return self->_fUrlConnection;
}

- (void)setFUrlConnection:(id)a3
{
}

- (BOOL)fFinished
{
  return self->_fFinished;
}

- (void)setFFinished:(BOOL)a3
{
  self->_fFinished = a3;
}

- (BOOL)fExecuting
{
  return self->_fExecuting;
}

- (void)setFExecuting:(BOOL)a3
{
  self->_fExecuting = a3;
}

- (NSString)fOriginalThreadName
{
  return self->_fOriginalThreadName;
}

- (void)setFOriginalThreadName:(id)a3
{
}

- (NSMultiPartInputStream)fBody
{
  return self->_fBody;
}

- (void)setFBody:(id)a3
{
}

- (NSHTTPURLResponse)fHttpResponse
{
  return self->_fHttpResponse;
}

- (void)setFHttpResponse:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fHttpResponse, 0);
  objc_storeStrong((id *)&self->_fBody, 0);
  objc_storeStrong((id *)&self->_fOriginalThreadName, 0);
  objc_storeStrong((id *)&self->_fUrlConnection, 0);
  objc_storeStrong((id *)&self->_fReceivedData, 0);
  objc_storeStrong((id *)&self->_fActiveRequest, 0);
  objc_storeStrong((id *)&self->_fUrl, 0);
  objc_storeStrong(&self->_onError, 0);
  objc_storeStrong(&self->_onHeaders, 0);
  objc_storeStrong(&self->_onUploadProgress, 0);
  objc_storeStrong(&self->_onProgress, 0);

  objc_storeStrong(&self->_onResponse, 0);
}

@end