@interface SendOptInUpdateRequestOperation
- (IDSKTOptInResult)result;
- (KTOperationDependencies)deps;
- (NSDictionary)request;
- (NSOperation)finishedOp;
- (SendOptInUpdateRequestOperation)initWithDependenics:(id)a3 optInRequest:(id)a4;
- (void)groupStart;
- (void)setDeps:(id)a3;
- (void)setFinishedOp:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResult:(id)a3;
@end

@implementation SendOptInUpdateRequestOperation

- (SendOptInUpdateRequestOperation)initWithDependenics:(id)a3 optInRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SendOptInUpdateRequestOperation;
  v8 = [(KTGroupOperation *)&v11 init];
  v9 = v8;
  if (v8)
  {
    [(SendOptInUpdateRequestOperation *)v8 setDeps:v6];
    [(SendOptInUpdateRequestOperation *)v9 setRequest:v7];
  }

  return v9;
}

- (void)groupStart
{
  id v3 = objc_alloc_init((Class)NSOperation);
  [(SendOptInUpdateRequestOperation *)self setFinishedOp:v3];

  v4 = [(SendOptInUpdateRequestOperation *)self finishedOp];
  [(KTGroupOperation *)self dependOnBeforeGroupFinished:v4];

  if (qword_10032F2B8 != -1) {
    dispatch_once(&qword_10032F2B8, &stru_1002C8F40);
  }
  v5 = (void *)qword_10032F2C0;
  if (os_log_type_enabled((os_log_t)qword_10032F2C0, OS_LOG_TYPE_INFO))
  {
    id v6 = v5;
    id v7 = [(SendOptInUpdateRequestOperation *)self request];
    *(_DWORD *)buf = 138412290;
    v13 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "sending opt-in state change to IDS: %@", buf, 0xCu);
  }
  v8 = [(SendOptInUpdateRequestOperation *)self deps];
  v9 = [v8 idsOperations];
  v10 = [(SendOptInUpdateRequestOperation *)self request];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1001F8824;
  v11[3] = &unk_1002C8F88;
  v11[4] = self;
  [v9 sendOptInUpdateRequest:v10 withCompletion:v11];
}

- (KTOperationDependencies)deps
{
  return (KTOperationDependencies *)objc_getProperty(self, a2, 120, 1);
}

- (void)setDeps:(id)a3
{
}

- (NSOperation)finishedOp
{
  return (NSOperation *)objc_getProperty(self, a2, 128, 1);
}

- (void)setFinishedOp:(id)a3
{
}

- (NSDictionary)request
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setRequest:(id)a3
{
}

- (IDSKTOptInResult)result
{
  return (IDSKTOptInResult *)objc_getProperty(self, a2, 144, 1);
}

- (void)setResult:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_result, 0);
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_finishedOp, 0);

  objc_storeStrong((id *)&self->_deps, 0);
}

@end