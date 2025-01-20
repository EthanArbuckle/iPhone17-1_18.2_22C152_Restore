@interface NSSNewsAnalyticsSubmitEnvelopesOperation
- (BOOL)validateOperation;
- (NSArray)envelopes;
- (NSSNewsAnalyticsSubmitEnvelopesOperation)init;
- (id)submissionCompletion;
- (void)operationDidFinishWithError:(id)a3;
- (void)performOperation;
- (void)setEnvelopes:(id)a3;
- (void)setSubmissionCompletion:(id)a3;
- (void)validateOperation;
@end

@implementation NSSNewsAnalyticsSubmitEnvelopesOperation

- (NSSNewsAnalyticsSubmitEnvelopesOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)NSSNewsAnalyticsSubmitEnvelopesOperation;
  return [(FCOperation *)&v3 init];
}

- (BOOL)validateOperation
{
  v2 = [(NSSNewsAnalyticsSubmitEnvelopesOperation *)self envelopes];

  if (!v2 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
    -[NSSNewsAnalyticsSubmitEnvelopesOperation validateOperation]();
  }
  return v2 != 0;
}

- (void)performOperation
{
  objc_super v3 = [(NSSNewsAnalyticsSubmitEnvelopesOperation *)self envelopes];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__NSSNewsAnalyticsSubmitEnvelopesOperation_performOperation__block_invoke;
  v10[3] = &unk_1E6D3FAC0;
  v10[4] = self;
  v4 = (void *)MEMORY[0x1E01F0A60](v10);
  if ([v3 count])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F29268]);
    v6 = (void *)[v5 initWithMachServiceName:*MEMORY[0x1E4F7E8E0] options:0];
    v7 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F3B6CB10];
    [v6 setRemoteObjectInterface:v7];
    [v6 resume];
    v8 = [v6 remoteObjectProxyWithErrorHandler:v4];
    [v8 submitEnvelopes:v3 withCompletion:v4];
    [MEMORY[0x1E4F7D428] registerEnvelopesAsSubmittedToUploader:v3];
  }
  else
  {
    v9 = v4;
    v9[2](v9, 0);
    v6 = v9;
  }
}

uint64_t __60__NSSNewsAnalyticsSubmitEnvelopesOperation_performOperation__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) finishedPerformingOperationWithError:a2];
}

uint64_t __60__NSSNewsAnalyticsSubmitEnvelopesOperation_performOperation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)operationDidFinishWithError:(id)a3
{
  id v6 = a3;
  v4 = [(NSSNewsAnalyticsSubmitEnvelopesOperation *)self submissionCompletion];

  if (v4)
  {
    id v5 = [(NSSNewsAnalyticsSubmitEnvelopesOperation *)self submissionCompletion];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (NSArray)envelopes
{
  return self->_envelopes;
}

- (void)setEnvelopes:(id)a3
{
}

- (id)submissionCompletion
{
  return self->_submissionCompletion;
}

- (void)setSubmissionCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_submissionCompletion, 0);
  objc_storeStrong((id *)&self->_envelopes, 0);
}

- (void)validateOperation
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[[NSString alloc] initWithFormat:@"submit envelopes operation requires envelopes"];
  int v1 = 136315906;
  v2 = "-[NSSNewsAnalyticsSubmitEnvelopesOperation validateOperation]";
  __int16 v3 = 2080;
  v4 = "NSSNewsAnalyticsSubmitEnvelopesOperation.m";
  __int16 v5 = 1024;
  int v6 = 42;
  __int16 v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1E0102000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", (uint8_t *)&v1, 0x26u);
}

@end