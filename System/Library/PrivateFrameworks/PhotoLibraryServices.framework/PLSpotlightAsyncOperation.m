@interface PLSpotlightAsyncOperation
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (id)_keyObserverStringForOperationState:(unint64_t)a3;
- (unint64_t)operationState;
- (void)cancel;
- (void)main;
- (void)setOperationState:(unint64_t)a3;
- (void)start;
@end

@implementation PLSpotlightAsyncOperation

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  return [(PLSpotlightAsyncOperation *)self operationState] == 2;
}

- (BOOL)isExecuting
{
  return [(PLSpotlightAsyncOperation *)self operationState] == 1;
}

- (void)cancel
{
}

- (void)main
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PLSpotlightAsyncOperation.m" lineNumber:75 description:@"This method must be overridden by the subclass"];
}

- (void)start
{
  if ([(PLSpotlightAsyncOperation *)self isCancelled])
  {
    [(PLSpotlightAsyncOperation *)self setOperationState:2];
  }
  else
  {
    [(PLSpotlightAsyncOperation *)self setOperationState:1];
    [(PLSpotlightAsyncOperation *)self main];
  }
}

- (id)_keyObserverStringForOperationState:(unint64_t)a3
{
  if (a3 > 2) {
    return 0;
  }
  else {
    return off_1E586CC38[a3];
  }
}

- (unint64_t)operationState
{
  v2 = self;
  objc_sync_enter(v2);
  unint64_t operationState = v2->_operationState;
  objc_sync_exit(v2);

  return operationState;
}

- (void)setOperationState:(unint64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  id v4 = [(PLSpotlightAsyncOperation *)obj _keyObserverStringForOperationState:obj->_operationState];
  v5 = [(PLSpotlightAsyncOperation *)obj _keyObserverStringForOperationState:a3];
  [(PLSpotlightAsyncOperation *)obj willChangeValueForKey:v4];
  [(PLSpotlightAsyncOperation *)obj willChangeValueForKey:v5];
  obj->_unint64_t operationState = a3;
  [(PLSpotlightAsyncOperation *)obj didChangeValueForKey:v4];
  [(PLSpotlightAsyncOperation *)obj didChangeValueForKey:v5];

  objc_sync_exit(obj);
}

@end