@interface MSDOperationQueue
- (MSDOperationBarrier)checkpointBarrier;
- (MSDOperationQueue)init;
- (void)addOperation:(id)a3;
- (void)setCheckpointBarrier:(id)a3;
- (void)setSuspended:(BOOL)a3;
@end

@implementation MSDOperationQueue

- (MSDOperationQueue)init
{
  v5.receiver = self;
  v5.super_class = (Class)MSDOperationQueue;
  v2 = [(MSDOperationQueue *)&v5 init];
  if (v2)
  {
    v3 = objc_alloc_init(MSDOperationBarrier);
    [(MSDOperationQueue *)v2 setCheckpointBarrier:v3];
  }
  return v2;
}

- (void)addOperation:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = +[NSAssertionHandler currentHandler];
    [v7 handleFailureInMethod:a2, self, @"MSDOperationQueue.m", 37, @"%@ is not a flavor of MSDOperation.", v5 object file lineNumber description];
  }
  v6 = [(MSDOperationQueue *)self checkpointBarrier];
  [v5 addCheckpointBarrier:v6];

  v8.receiver = self;
  v8.super_class = (Class)MSDOperationQueue;
  [(MSDOperationQueue *)&v8 addOperation:v5];
}

- (void)setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MSDOperationQueue;
  -[MSDOperationQueue setSuspended:](&v7, "setSuspended:");
  id v5 = [(MSDOperationQueue *)self checkpointBarrier];
  v6 = v5;
  if (v3) {
    [v5 activate];
  }
  else {
    [v5 deactivate];
  }
}

- (MSDOperationBarrier)checkpointBarrier
{
  return self->_checkpointBarrier;
}

- (void)setCheckpointBarrier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end