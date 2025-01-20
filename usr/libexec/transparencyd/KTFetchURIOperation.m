@interface KTFetchURIOperation
- (KTFetchURIOperation)initWithURI:(id)a3 application:(id)a4 dependencies:(id)a5;
- (KTOperationDependencies)deps;
- (NSOperation)finishedOp;
- (NSString)application;
- (NSString)uri;
- (QueryRequest)queryRequest;
- (QueryResponse)queryResponse;
- (void)groupStart;
- (void)setApplication:(id)a3;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setQueryRequest:(id)a3;
- (void)setQueryResponse:(id)a3;
- (void)setUri:(id)a3;
@end

@implementation KTFetchURIOperation

- (KTFetchURIOperation)initWithURI:(id)a3 application:(id)a4 dependencies:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)KTFetchURIOperation;
  v11 = [(KTGroupOperation *)&v16 init];
  v12 = v11;
  if (v11)
  {
    [(KTFetchURIOperation *)v11 setUri:v8];
    [(KTFetchURIOperation *)v12 setApplication:v9];
    [(KTFetchURIOperation *)v12 setDeps:v10];
    id v13 = objc_alloc_init((Class)NSOperation);
    [(KTFetchURIOperation *)v12 setFinishedOp:v13];

    v14 = v12;
  }

  return v12;
}

- (void)groupStart
{
  v3 = [(KTFetchURIOperation *)self uri];
  v4 = [(KTFetchURIOperation *)self application];
  id v19 = 0;
  v5 = +[TransparencyRPCRequestBuilder buildQueryRequest:v3 application:v4 error:&v19];
  id v6 = v19;
  [(KTFetchURIOperation *)self setQueryRequest:v5];

  v7 = [(KTFetchURIOperation *)self queryRequest];
  LODWORD(v3) = v7 == 0;

  if (v3)
  {
    if (qword_10032EF10 != -1) {
      dispatch_once(&qword_10032EF10, &stru_1002C5058);
    }
    v14 = (void *)qword_10032EF18;
    if (os_log_type_enabled((os_log_t)qword_10032EF18, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      objc_super v16 = [(KTFetchURIOperation *)self uri];
      *(_DWORD *)location = 141558530;
      *(void *)&location[4] = 1752392040;
      __int16 v21 = 2112;
      v22 = v16;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "FetchKTSelf: failed to create query request for %{mask.hash}@: %@", location, 0x20u);
    }
    [(KTResultOperation *)self setError:v6];
  }
  else
  {
    id v8 = objc_alloc_init((Class)NSOperation);
    [(KTFetchURIOperation *)self setFinishedOp:v8];

    id v9 = [(KTFetchURIOperation *)self finishedOp];
    [(KTGroupOperation *)self dependOnBeforeGroupFinished:v9];

    id v10 = +[NSUUID UUID];
    *(void *)location = 0;
    objc_initWeak((id *)location, self);
    v11 = [(KTFetchURIOperation *)self deps];
    v12 = [v11 logClient];
    id v13 = [(KTFetchURIOperation *)self queryRequest];
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10019DF50;
    v17[3] = &unk_1002C50E0;
    objc_copyWeak(&v18, (id *)location);
    [v12 fetchQuery:v13 uuid:v10 completionHandler:v17];

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)location);
  }
}

- (NSString)uri
{
  return (NSString *)objc_getProperty(self, a2, 120, 1);
}

- (void)setUri:(id)a3
{
}

- (NSString)application
{
  return (NSString *)objc_getProperty(self, a2, 128, 1);
}

- (void)setApplication:(id)a3
{
}

- (QueryRequest)queryRequest
{
  return (QueryRequest *)objc_getProperty(self, a2, 136, 1);
}

- (void)setQueryRequest:(id)a3
{
}

- (QueryResponse)queryResponse
{
  return (QueryResponse *)objc_getProperty(self, a2, 144, 1);
}

- (void)setQueryResponse:(id)a3
{
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 152, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 160, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finishedOp, 0);
  objc_storeStrong((id *)&self->_deps, 0);
  objc_storeStrong((id *)&self->_queryResponse, 0);
  objc_storeStrong((id *)&self->_queryRequest, 0);
  objc_storeStrong((id *)&self->_application, 0);

  objc_storeStrong((id *)&self->_uri, 0);
}

@end