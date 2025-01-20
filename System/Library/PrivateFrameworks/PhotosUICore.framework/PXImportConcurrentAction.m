@interface PXImportConcurrentAction
- (BOOL)isAsynchronous;
- (BOOL)isConcurrent;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (id)performAction;
- (void)finish;
- (void)start;
@end

@implementation PXImportConcurrentAction

- (BOOL)isFinished
{
  return self->_finished;
}

- (BOOL)isExecuting
{
  return self->_executing;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isConcurrent
{
  return 1;
}

- (void)finish
{
  v3 = NSStringFromSelector(sel_isExecuting);
  [(PXImportConcurrentAction *)self willChangeValueForKey:v3];

  self->_executing = 0;
  v4 = NSStringFromSelector(sel_isExecuting);
  [(PXImportConcurrentAction *)self didChangeValueForKey:v4];

  v5 = NSStringFromSelector(sel_isFinished);
  [(PXImportConcurrentAction *)self willChangeValueForKey:v5];

  self->_finished = 1;
  v6 = NSStringFromSelector(sel_isFinished);
  [(PXImportConcurrentAction *)self didChangeValueForKey:v6];

  id v7 = +[_PXImportConcurrentActionManager sharedInstance];
  [v7 removeOperation:self];
}

- (id)performAction
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:self file:@"PXImportConcurrentAction.m" lineNumber:43 description:@"Subclassers to implement"];

  return 0;
}

- (void)start
{
  if ([(PXImportConcurrentAction *)self isCancelled])
  {
    v3 = NSStringFromSelector(sel_isFinished);
    [(PXImportConcurrentAction *)self willChangeValueForKey:v3];

    self->_finished = 1;
    NSStringFromSelector(sel_isFinished);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PXImportConcurrentAction didChangeValueForKey:](self, "didChangeValueForKey:");
  }
  else
  {
    v4 = NSStringFromSelector(sel_isExecuting);
    [(PXImportConcurrentAction *)self willChangeValueForKey:v4];

    self->_executing = 1;
    v5 = NSStringFromSelector(sel_isExecuting);
    [(PXImportConcurrentAction *)self didChangeValueForKey:v5];

    id v6 = +[_PXImportConcurrentActionManager sharedInstance];
    [v6 addOperation:self];
  }
}

@end