@interface WBSWellKnownURLResponseCodeReliabilityChecker
- (WBSWellKnownURLResponseCodeReliabilityChecker)initWithURL:(id)a3;
- (void)cancel;
- (void)checkReliabilityWithCompletion:(id)a3;
@end

@implementation WBSWellKnownURLResponseCodeReliabilityChecker

- (WBSWellKnownURLResponseCodeReliabilityChecker)initWithURL:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)WBSWellKnownURLResponseCodeReliabilityChecker;
  v5 = [(WBSWellKnownURLResponseCodeReliabilityChecker *)&v17 init];
  if (v5)
  {
    uint64_t v6 = objc_msgSend(v4, "safari_wellKnownResponseCodeReliabilityURL");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E4F28F08]);
    fetchOperationQueue = v5->_fetchOperationQueue;
    v5->_fetchOperationQueue = v8;

    v10 = [NSString stringWithFormat:@"com.apple.SafariShared.%@.%p.operationQueue", objc_opt_class(), v5];
    [(NSOperationQueue *)v5->_fetchOperationQueue setName:v10];

    v11 = (void *)MEMORY[0x1E4F18DC0];
    v12 = objc_msgSend(MEMORY[0x1E4F18DD0], "safari_ephemeralSessionConfiguration");
    uint64_t v13 = [v11 sessionWithConfiguration:v12 delegate:0 delegateQueue:v5->_fetchOperationQueue];
    session = v5->_session;
    v5->_session = (NSURLSession *)v13;

    v15 = v5;
  }

  return v5;
}

- (void)checkReliabilityWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = (void *)[objc_alloc(MEMORY[0x1E4F18D50]) initWithURL:self->_url cachePolicy:1 timeoutInterval:10.0];
  [v5 setAttribution:1];
  uint64_t v6 = (void *)MEMORY[0x1AD0C4F80](v4);
  id completion = self->_completion;
  self->_id completion = v6;

  session = self->_session;
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  uint64_t v13 = __80__WBSWellKnownURLResponseCodeReliabilityChecker_checkReliabilityWithCompletion___block_invoke;
  v14 = &unk_1E5CA0AF8;
  v15 = self;
  id v16 = v4;
  id v9 = v4;
  v10 = [(NSURLSession *)session dataTaskWithRequest:v5 completionHandler:&v11];
  objc_msgSend(v10, "resume", v11, v12, v13, v14, v15);
}

void __80__WBSWellKnownURLResponseCodeReliabilityChecker_checkReliabilityWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  id v9 = a3;
  if (a4 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  else
  {
    objc_msgSend(v9, "safari_statusCodeGroup");
    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
  }
  v6();
  uint64_t v7 = *(void *)(a1 + 32);
  v8 = *(void **)(v7 + 32);
  *(void *)(v7 + 32) = 0;
}

- (void)cancel
{
  [(NSURLSession *)self->_session finishTasksAndInvalidate];
  id completion = (void (**)(id, uint64_t))self->_completion;
  if (completion)
  {
    completion[2](completion, 2);
    id v4 = self->_completion;
    self->_id completion = 0;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_storeStrong((id *)&self->_fetchOperationQueue, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end