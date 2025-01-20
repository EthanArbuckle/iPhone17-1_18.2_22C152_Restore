@interface SBImageAnalyzer
- (SBImageAnalyzer)init;
- (id)executeAnalysisRequest:(id)a3 completion:(id)a4;
- (id)executeAnalysisRequest:(id)a3 error:(id *)a4;
- (void)_self_invalidate;
- (void)cancelRequest:(id)a3;
- (void)dealloc;
- (void)invalidate;
@end

@implementation SBImageAnalyzer

- (SBImageAnalyzer)init
{
  v6.receiver = self;
  v6.super_class = (Class)SBImageAnalyzer;
  v2 = [(SBImageAnalyzer *)&v6 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    operationQueue = v2->_operationQueue;
    v2->_operationQueue = (NSOperationQueue *)v3;

    [(NSOperationQueue *)v2->_operationQueue setName:@"SBImageAnalyzer"];
    [(NSOperationQueue *)v2->_operationQueue setMaxConcurrentOperationCount:1];
  }
  return v2;
}

- (void)dealloc
{
  [(SBImageAnalyzer *)self _self_invalidate];
  v3.receiver = self;
  v3.super_class = (Class)SBImageAnalyzer;
  [(SBImageAnalyzer *)&v3 dealloc];
}

- (void)cancelRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  objc_super v6 = [v4 requestIdentifier];
  if (v6)
  {
    v7 = v5->_operationQueue;
    operationQueue = v5->_operationQueue;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1000048D4;
    v10[3] = &unk_10000C440;
    v9 = v7;
    v11 = v9;
    id v12 = v6;
    [(NSOperationQueue *)operationQueue addBarrierBlock:v10];
  }
  objc_sync_exit(v5);
}

- (id)executeAnalysisRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, void, void *))a4;
  v8 = self;
  objc_sync_enter(v8);
  if (v8->_operationQueue)
  {
    v9 = [[SBImageAnalyzerOperation alloc] initWithRequest:v6 completion:v7];
    [(NSOperationQueue *)v8->_operationQueue addOperation:v9];
    objc_initWeak(&location, v8);
    v10 = [(SBImageAnalyzerOperation *)v9 progress];
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100004C60;
    v13[3] = &unk_10000C468;
    objc_copyWeak(&v15, &location);
    id v14 = v6;
    [v10 setCancellationHandler:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
LABEL_5:

    goto LABEL_6;
  }
  if (v7)
  {
    NSErrorUserInfoKey v17 = NSLocalizedFailureReasonErrorKey;
    CFStringRef v18 = @"invalidated";
    v9 = +[NSDictionary dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v11 = +[NSError errorWithDomain:@"PRUISAnalyzer" code:-1 userInfo:v9];
    v7[2](v7, 0, v11);

    v10 = 0;
    goto LABEL_5;
  }
  v10 = 0;
LABEL_6:
  objc_sync_exit(v8);

  return v10;
}

- (id)executeAnalysisRequest:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v7->_operationQueue)
  {
    if (a4)
    {
      NSErrorUserInfoKey v21 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v22 = @"invalidated";
      id v12 = +[NSDictionary dictionaryWithObjects:&v22 forKeys:&v21 count:1];
      *a4 = +[NSError errorWithDomain:@"SBImageAnalyzer" code:-1 userInfo:v12];
    }
    objc_sync_exit(v7);

    v8 = 0;
    goto LABEL_12;
  }
  v8 = [[SBImageAnalyzerOperation alloc] initWithRequest:v6 completion:0];
  objc_sync_exit(v7);

  operationQueue = v7->_operationQueue;
  v20 = v8;
  v10 = +[NSArray arrayWithObjects:&v20 count:1];
  [(NSOperationQueue *)operationQueue addOperations:v10 waitUntilFinished:1];

  v11 = [(SBImageAnalyzerOperation *)v8 response];

  if (v11)
  {
    a4 = [(SBImageAnalyzerOperation *)v8 response];
    goto LABEL_13;
  }
  if (a4)
  {
    v13 = [(SBImageAnalyzerOperation *)v8 error];
    id v14 = v13;
    if (v13)
    {
      *a4 = v13;
    }
    else
    {
      NSErrorUserInfoKey v18 = NSLocalizedFailureReasonErrorKey;
      CFStringRef v19 = @"unknown error";
      id v15 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v16 = +[NSError errorWithDomain:@"PRUISAnalyzer" code:-2 userInfo:v15];
      *a4 = v16;
    }
LABEL_12:
    a4 = 0;
  }
LABEL_13:

  return a4;
}

- (void)invalidate
{
  obj = self;
  objc_sync_enter(obj);
  [(SBImageAnalyzer *)obj _self_invalidate];
  objc_sync_exit(obj);
}

- (void)_self_invalidate
{
  objc_super v3 = self->_operationQueue;
  operationQueue = self->_operationQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000502C;
  v7[3] = &unk_10000C490;
  v8 = v3;
  v5 = v3;
  [(NSOperationQueue *)operationQueue addBarrierBlock:v7];
  id v6 = self->_operationQueue;
  self->_operationQueue = 0;
}

- (void).cxx_destruct
{
}

@end