@interface WFCloudKitAsyncOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (void)finishExecuting;
- (void)setIsExecuting:(BOOL)a3;
- (void)setIsFinished:(BOOL)a3;
- (void)startExecuting;
@end

@implementation WFCloudKitAsyncOperation

- (BOOL)isFinished
{
  return self->_isFinished;
}

- (BOOL)isExecuting
{
  return self->_isExecuting;
}

- (void)finishExecuting
{
  [(WFCloudKitAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  [(WFCloudKitAsyncOperation *)self willChangeValueForKey:@"isFinished"];
  [(WFCloudKitAsyncOperation *)self setIsExecuting:0];
  [(WFCloudKitAsyncOperation *)self setIsFinished:1];
  [(WFCloudKitAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
  [(WFCloudKitAsyncOperation *)self didChangeValueForKey:@"isFinished"];
}

- (void)setIsExecuting:(BOOL)a3
{
  self->_isExecuting = a3;
}

- (void)startExecuting
{
  [(WFCloudKitAsyncOperation *)self willChangeValueForKey:@"isExecuting"];
  [(WFCloudKitAsyncOperation *)self setIsExecuting:1];
  [(WFCloudKitAsyncOperation *)self didChangeValueForKey:@"isExecuting"];
}

- (void)setIsFinished:(BOOL)a3
{
  self->_isFinished = a3;
}

@end