@interface SUContinuation
- (SUContinuationDelegate)delegate;
- (void)cancel;
- (void)sendErrorToDelegate:(id)a3;
- (void)sendFinishToDelegate;
- (void)setDelegate:(id)a3;
@end

@implementation SUContinuation

- (void)cancel
{
}

- (void)sendErrorToDelegate:(id)a3
{
  v5 = self;
  delegate = self->_delegate;

  [(SUContinuationDelegate *)delegate continuation:self failedWithError:a3];
}

- (void)sendFinishToDelegate
{
  v3 = self;
  delegate = self->_delegate;

  [(SUContinuationDelegate *)delegate continuationFinished:self];
}

- (SUContinuationDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (SUContinuationDelegate *)a3;
}

@end