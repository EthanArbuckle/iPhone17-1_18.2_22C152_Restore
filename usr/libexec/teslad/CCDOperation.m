@interface CCDOperation
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (BOOL)operationExecuting;
- (BOOL)operationFinished;
- (BOOL)operationReady;
- (CCDOperation)init;
- (void)endOperation;
- (void)setOperationExecuting:(BOOL)a3;
- (void)setOperationFinished:(BOOL)a3;
- (void)setOperationReady:(BOOL)a3;
@end

@implementation CCDOperation

- (CCDOperation)init
{
  v3.receiver = self;
  v3.super_class = (Class)CCDOperation;
  result = [(CCDOperation *)&v3 init];
  if (result) {
    result->_operationReady = 1;
  }
  return result;
}

- (void)setOperationReady:(BOOL)a3
{
  if (self->_operationReady != a3)
  {
    [(CCDOperation *)self willChangeValueForKey:@"ready"];
    self->_operationReady = a3;
    [(CCDOperation *)self didChangeValueForKey:@"ready"];
  }
}

- (void)setOperationExecuting:(BOOL)a3
{
  if (self->_operationExecuting != a3)
  {
    [(CCDOperation *)self willChangeValueForKey:@"executing"];
    self->_operationExecuting = a3;
    [(CCDOperation *)self didChangeValueForKey:@"executing"];
  }
}

- (void)setOperationFinished:(BOOL)a3
{
  if (self->_operationFinished != a3)
  {
    [(CCDOperation *)self willChangeValueForKey:@"finished"];
    self->_operationFinished = a3;
    [(CCDOperation *)self didChangeValueForKey:@"finished"];
  }
}

- (void)endOperation
{
  [(CCDOperation *)self setOperationExecuting:0];

  [(CCDOperation *)self setOperationFinished:1];
}

- (BOOL)isFinished
{
  return self->_operationFinished;
}

- (BOOL)isExecuting
{
  return self->_operationExecuting;
}

- (BOOL)isReady
{
  return self->_operationReady;
}

- (BOOL)operationExecuting
{
  return self->_operationExecuting;
}

- (BOOL)operationFinished
{
  return self->_operationFinished;
}

- (BOOL)operationReady
{
  return self->_operationReady;
}

@end