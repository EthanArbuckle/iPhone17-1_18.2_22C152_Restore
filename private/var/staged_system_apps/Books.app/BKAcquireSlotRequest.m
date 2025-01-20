@interface BKAcquireSlotRequest
- (BKAcquireSlotRequest)init;
- (ICStoreRequestContext)requestContext;
- (NSString)additionalParams;
- (void)_acquireSlotWithURL:(id)a3;
- (void)execute;
- (void)performRequestWithResponseHandler:(id)a3;
- (void)setAdditionalParams:(id)a3;
- (void)setRequestContext:(id)a3;
@end

@implementation BKAcquireSlotRequest

- (BKAcquireSlotRequest)init
{
  v7.receiver = self;
  v7.super_class = (Class)BKAcquireSlotRequest;
  v2 = [(BKAcquireSlotRequest *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc((Class)ICStoreRequestContext);
    uint64_t v4 = [v3 ae_initWithActiveAccountAllowAuthenticationOnceADay];
    requestContext = v2->_requestContext;
    v2->_requestContext = (ICStoreRequestContext *)v4;
  }
  return v2;
}

- (void)performRequestWithResponseHandler:(id)a3
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013AE8C;
  v5[3] = &unk_100A46A58;
  id v6 = a3;
  id v4 = v6;
  [(BKAcquireSlotRequest *)self performRequestWithCompletionHandler:v5];
}

- (void)execute
{
  id v3 = +[BUBag defaultBag];
  objc_initWeak(&location, self);
  id v4 = [v3 acquireSlotURL];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10013AF98;
  v5[3] = &unk_100A47CD8;
  objc_copyWeak(&v6, &location);
  [v4 valueWithCompletion:v5];

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)_acquireSlotWithURL:(id)a3
{
  id v4 = a3;
  v5 = [(BKAcquireSlotRequest *)self additionalParams];

  id v6 = v4;
  if (v5)
  {
    if (v4)
    {
      id v7 = [objc_alloc((Class)NSURLComponents) initWithURL:v4 resolvingAgainstBaseURL:0];
      v8 = [(BKAcquireSlotRequest *)self additionalParams];
      [v7 setQuery:v8];

      id v6 = [v7 URL];
    }
    else
    {
      v9 = sub_1000EBDE8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Nil url, can't add additional query parms.", (uint8_t *)buf, 2u);
      }

      id v6 = 0;
    }
  }
  id v10 = [objc_alloc((Class)NSMutableURLRequest) initWithURL:v6];
  [v10 setHTTPMethod:@"GET"];
  objc_initWeak(buf, self);
  id v11 = [objc_alloc((Class)ICStoreURLRequest) initWithURLRequest:v10 requestContext:self->_requestContext];
  v12 = +[ICURLSessionManager highPrioritySession];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10013B278;
  v13[3] = &unk_100A47D00;
  objc_copyWeak(&v14, buf);
  [v12 enqueueDataRequest:v11 withCompletionHandler:v13];
  objc_destroyWeak(&v14);

  objc_destroyWeak(buf);
}

- (NSString)additionalParams
{
  return self->_additionalParams;
}

- (void)setAdditionalParams:(id)a3
{
}

- (ICStoreRequestContext)requestContext
{
  return self->_requestContext;
}

- (void)setRequestContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestContext, 0);

  objc_storeStrong((id *)&self->_additionalParams, 0);
}

@end