@interface PRETrialCompletionResult
- (BOOL)isCompletionCalled;
- (BOOL)isSuccess;
- (NSError)downloadError;
- (void)setDownloadError:(id)a3;
- (void)setIsCompletionCalled:(BOOL)a3;
- (void)setIsSuccess:(BOOL)a3;
@end

@implementation PRETrialCompletionResult

- (void).cxx_destruct
{
}

- (void)setDownloadError:(id)a3
{
}

- (NSError)downloadError
{
  return self->_downloadError;
}

- (void)setIsSuccess:(BOOL)a3
{
  self->_isSuccess = a3;
}

- (BOOL)isSuccess
{
  return self->_isSuccess;
}

- (void)setIsCompletionCalled:(BOOL)a3
{
  self->_isCompletionCalled = a3;
}

- (BOOL)isCompletionCalled
{
  return self->_isCompletionCalled;
}

@end