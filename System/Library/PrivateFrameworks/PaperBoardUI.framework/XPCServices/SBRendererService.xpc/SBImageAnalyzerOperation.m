@interface SBImageAnalyzerOperation
- (BOOL)_hasError;
- (NSError)error;
- (NSProgress)progress;
- (PRUISAnalysisServiceRequest)request;
- (PRUISAnalysisServiceResponse)response;
- (SBImageAnalyzerOperation)initWithRequest:(id)a3 completion:(id)a4;
- (void)_determineProminentColor;
- (void)_fireCompletionWithError:(id)a3;
- (void)_setupAnalysisOperations;
- (void)cancel;
@end

@implementation SBImageAnalyzerOperation

- (SBImageAnalyzerOperation)initWithRequest:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)SBImageAnalyzerOperation;
  v9 = [(SBImageAnalyzerOperation *)&v19 init];
  if (v9)
  {
    id v10 = [v8 copy];
    id completionBlock = v9->_completionBlock;
    v9->_id completionBlock = v10;

    uint64_t v12 = objc_opt_new();
    firedCompletionSignal = v9->_firedCompletionSignal;
    v9->_firedCompletionSignal = (BSAtomicSignal *)v12;

    uint64_t v14 = objc_opt_new();
    accumulatedErrors = v9->_accumulatedErrors;
    v9->_accumulatedErrors = (NSMutableArray *)v14;

    objc_storeStrong((id *)&v9->_request, a3);
    uint64_t v16 = +[NSProgress progressWithTotalUnitCount:-1];
    progress = v9->_progress;
    v9->_progress = (NSProgress *)v16;

    [(SBImageAnalyzerOperation *)v9 _setupAnalysisOperations];
  }

  return v9;
}

- (void)cancel
{
  v6.receiver = self;
  v6.super_class = (Class)SBImageAnalyzerOperation;
  [(SBImageAnalyzerOperation *)&v6 cancel];
  v3 = self;
  objc_sync_enter(v3);
  NSErrorUserInfoKey v7 = NSLocalizedFailureReasonErrorKey;
  CFStringRef v8 = @"cancelled.";
  v4 = +[NSDictionary dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v5 = +[NSError errorWithDomain:@"com.apple.PaperBoardUI" code:-1 userInfo:v4];
  [(SBImageAnalyzerOperation *)v3 _fireCompletionWithError:v5];

  objc_sync_exit(v3);
}

- (void)_setupAnalysisOperations
{
  v3 = [(PRUISAnalysisServiceRequest *)self->_request requestIdentifier];
  v4 = +[NSString stringWithFormat:@"SBImageAnalyzerOperation servicing request %@", v3];

  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000054F8;
  v8[3] = &unk_10000C468;
  objc_copyWeak(&v10, &location);
  id v5 = v4;
  id v9 = v5;
  [(SBImageAnalyzerOperation *)self addExecutionBlock:v8];
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100005680;
  v6[3] = &unk_10000C4B8;
  objc_copyWeak(&v7, &location);
  [(SBImageAnalyzerOperation *)self setCompletionBlock:v6];
  objc_destroyWeak(&v7);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (BOOL)_hasError
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL v3 = [(NSMutableArray *)v2->_accumulatedErrors count] != 0;
  objc_sync_exit(v2);

  return v3;
}

- (void)_fireCompletionWithError:(id)a3
{
  id v4 = a3;
  id v5 = self;
  objc_sync_enter(v5);
  if ([(BSAtomicSignal *)v5->_firedCompletionSignal signal])
  {
    id v6 = [(NSMutableArray *)v5->_accumulatedErrors copy];
    id v7 = objc_opt_new();
    if (![v6 count])
    {
      CFStringRef v8 = [(PRUISAnalysisServiceRequest *)v5->_request requestedAnalyses];
      v18[0] = _NSConcreteStackBlock;
      v18[1] = 3221225472;
      v18[2] = sub_100005A64;
      v18[3] = &unk_10000C4E0;
      v18[4] = v5;
      id v19 = v7;
      [v8 enumerateObjectsUsingBlock:v18];
    }
    if ([v7 count])
    {
      id v9 = objc_alloc((Class)PRUISAnalysisServiceResponse);
      error = [(PRUISAnalysisServiceRequest *)v5->_request requestIdentifier];
      v11 = (PRUISAnalysisServiceResponse *)[v9 initWithRequestIdentifier:error reports:v7];
      response = v5->_response;
      v5->_response = v11;
    }
    else if ([v6 count] == (id)1)
    {
      uint64_t v13 = [v6 firstObject];
      error = v5->_error;
      v5->_error = (NSError *)v13;
    }
    else
    {
      if ([v6 count])
      {
        v20[0] = NSLocalizedFailureReasonErrorKey;
        v20[1] = NSMultipleUnderlyingErrorsKey;
        v21[0] = @"multiple crippling failures were experienced";
        v21[1] = v6;
        +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];
      }
      else
      {
        NSErrorUserInfoKey v22 = NSLocalizedFailureReasonErrorKey;
        CFStringRef v23 = @"no results were returned";
        +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
      error = };
      uint64_t v14 = +[NSError errorWithDomain:@"com.apple.PaperBoardUI" code:-1 userInfo:error];
      v15 = v5->_error;
      v5->_error = (NSError *)v14;
    }
    id completionBlock = (void (**)(id, PRUISAnalysisServiceResponse *, NSError *))v5->_completionBlock;
    if (completionBlock)
    {
      completionBlock[2](completionBlock, v5->_response, v5->_error);
      id v17 = v5->_completionBlock;
      v5->_id completionBlock = 0;
    }
  }
  objc_sync_exit(v5);
}

- (void)_determineProminentColor
{
  if (![(SBImageAnalyzerOperation *)self _hasError])
  {
    objc_initWeak(&location, self);
    BOOL v3 = dispatch_group_create();
    dispatch_group_enter(v3);
    id v4 = [(PRUISAnalysisServiceRequest *)self->_request image];
    [v4 CGImage];
    objc_copyWeak(&v7, &location);
    id v6 = v3;
    PRUISExecuteProminentColorAnalysisOnImage();

    dispatch_time_t v5 = dispatch_time(0, 20000000000);
    dispatch_group_wait(v6, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (NSProgress)progress
{
  return (NSProgress *)objc_getProperty(self, a2, 48, 1);
}

- (NSError)error
{
  return self->_error;
}

- (PRUISAnalysisServiceResponse)response
{
  return self->_response;
}

- (PRUISAnalysisServiceRequest)request
{
  return self->_request;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_request, 0);
  objc_storeStrong((id *)&self->_response, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_prominentColor, 0);
  objc_storeStrong((id *)&self->_accumulatedErrors, 0);
  objc_storeStrong((id *)&self->_osTransaction, 0);
  objc_storeStrong((id *)&self->_firedCompletionSignal, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end