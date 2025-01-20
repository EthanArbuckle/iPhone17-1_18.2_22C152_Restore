@interface PXRunNodeOperation
+ (id)keyPathsForValuesAffectingIsExecuting;
+ (id)keyPathsForValuesAffectingIsFinished;
+ (id)keyPathsForValuesAffectingIsReady;
- (BOOL)_transitionToState:(unint64_t)a3;
- (BOOL)cancelIfAble;
- (BOOL)completeIfAble;
- (BOOL)isAsynchronous;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)isReady;
- (NSLock)_stateLock;
- (PXRunNode)runNode;
- (PXRunNodeOperation)init;
- (PXRunNodeOperation)initWithRunNode:(id)a3;
- (unint64_t)state;
- (void)start;
@end

@implementation PXRunNodeOperation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__stateLock, 0);
  objc_storeStrong((id *)&self->_runNode, 0);
}

- (NSLock)_stateLock
{
  return self->__stateLock;
}

- (PXRunNode)runNode
{
  return self->_runNode;
}

- (BOOL)completeIfAble
{
  return [(PXRunNodeOperation *)self _transitionToState:3];
}

- (BOOL)cancelIfAble
{
  [(PXRunNodeOperation *)self cancel];
  return [(PXRunNodeOperation *)self _transitionToState:2];
}

- (BOOL)_transitionToState:(unint64_t)a3
{
  [(PXRunNodeOperation *)self willChangeValueForKey:@"state"];
  v5 = [(PXRunNodeOperation *)self _stateLock];
  [v5 lock];

  unint64_t state = self->_state;
  if (a3 == 3)
  {
    if (state == 1) {
      goto LABEL_7;
    }
  }
  else
  {
    if (a3 != 2)
    {
      if (a3 != 1 || state) {
        goto LABEL_5;
      }
LABEL_7:
      self->_unint64_t state = a3;
      BOOL v7 = 1;
      goto LABEL_8;
    }
    if ((state & 0xFFFFFFFFFFFFFFFELL) != 2) {
      goto LABEL_7;
    }
  }
LABEL_5:
  BOOL v7 = 0;
LABEL_8:
  v8 = [(PXRunNodeOperation *)self _stateLock];
  [v8 unlock];

  [(PXRunNodeOperation *)self didChangeValueForKey:@"state"];
  return v7;
}

- (unint64_t)state
{
  v3 = [(PXRunNodeOperation *)self _stateLock];
  [v3 lock];

  unint64_t state = self->_state;
  v5 = [(PXRunNodeOperation *)self _stateLock];
  [v5 unlock];

  return state;
}

- (BOOL)isAsynchronous
{
  return 1;
}

- (BOOL)isFinished
{
  return ([(PXRunNodeOperation *)self state] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)isExecuting
{
  return [(PXRunNodeOperation *)self state] == 1;
}

- (BOOL)isReady
{
  unint64_t v3 = [(PXRunNodeOperation *)self state];
  v5.receiver = self;
  v5.super_class = (Class)PXRunNodeOperation;
  BOOL result = [(PXRunNodeOperation *)&v5 isReady];
  if (v3) {
    return 0;
  }
  return result;
}

- (void)start
{
  id v4 = [(PXRunNodeOperation *)self runNode];
  if ([(PXRunNodeOperation *)self _transitionToState:1])
  {
    unint64_t v3 = [v4 delegate];
    if (objc_opt_respondsToSelector()) {
      [v3 runNodeWillStartRunning:v4];
    }
    [v4 run];
  }
}

- (PXRunNodeOperation)initWithRunNode:(id)a3
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PXRunNodeOperation;
  BOOL v7 = [(PXRunNodeOperation *)&v12 init];
  if (v7)
  {
    if (!v6)
    {
      v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, v7, @"PXRunNodeOperation.m", 80, @"Invalid parameter not satisfying: %@", @"runNode" object file lineNumber description];
    }
    objc_storeStrong((id *)&v7->_runNode, a3);
    v8 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    stateLock = v7->__stateLock;
    v7->__stateLock = v8;
  }
  return v7;
}

- (PXRunNodeOperation)init
{
  return [(PXRunNodeOperation *)self initWithRunNode:0];
}

+ (id)keyPathsForValuesAffectingIsFinished
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"state"];
}

+ (id)keyPathsForValuesAffectingIsExecuting
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"state"];
}

+ (id)keyPathsForValuesAffectingIsReady
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"state"];
}

@end