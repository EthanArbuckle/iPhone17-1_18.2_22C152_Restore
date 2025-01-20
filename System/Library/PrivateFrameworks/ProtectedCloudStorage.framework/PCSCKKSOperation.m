@interface PCSCKKSOperation
+ (id)operation:(id)a3 block:(id)a4;
- (BOOL)checkDependencies;
- (BOOL)isCancelled;
- (BOOL)isExecuting;
- (BOOL)isFinished;
- (BOOL)startOperation;
- (NSError)error;
- (NSMutableArray)successDependencies;
- (void)addSuccessDependency:(id)a3;
- (void)completeOperation;
- (void)setCancelled:(BOOL)a3;
- (void)setError:(id)a3;
- (void)setExecuting:(BOOL)a3;
- (void)setFinished:(BOOL)a3;
- (void)setSuccessDependencies:(id)a3;
@end

@implementation PCSCKKSOperation

+ (id)operation:(id)a3 block:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = objc_alloc_init(PCSCKKSOperationBlock);
  [(PCSCKKSOperationBlock *)v7 setName:v6];

  [(PCSCKKSOperationBlock *)v7 setBlock:v5];
  return v7;
}

- (void)addSuccessDependency:(id)a3
{
  id v8 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v4 = self;
    objc_sync_enter(v4);
    successDependencies = v4->_successDependencies;
    if (!successDependencies)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
      v7 = v4->_successDependencies;
      v4->_successDependencies = (NSMutableArray *)v6;

      successDependencies = v4->_successDependencies;
    }
    [(NSMutableArray *)successDependencies addObject:v8];
    objc_sync_exit(v4);
  }
  [(PCSCKKSOperation *)self addDependency:v8];
}

- (BOOL)checkDependencies
{
  v2 = self;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obj = self->_successDependencies;
  uint64_t v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  BOOL v4 = v3 == 0;
  uint64_t v28 = v3;
  if (!v3) {
    goto LABEL_18;
  }
  char v5 = 0;
  char v6 = 0;
  v26 = v2;
  uint64_t v27 = *(void *)v31;
  uint64_t v24 = *MEMORY[0x1E4F28A50];
  char v7 = 1;
  do
  {
    uint64_t v8 = 0;
    do
    {
      if (*(void *)v31 != v27) {
        objc_enumerationMutation(obj);
      }
      v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
      char v10 = [v9 isFinished];
      char v29 = [v9 isCancelled];
      v11 = [v9 error];
      BOOL v12 = v11 != 0;

      v13 = [v9 error];

      if (v13)
      {
        v14 = [v9 error];
        v15 = [v14 domain];
        int v16 = [v15 isEqual:PCSCKKSOperationErrorDomain];

        if (v16)
        {
          v17 = [v9 error];
          v2 = v26;
          [(PCSCKKSOperation *)v26 setError:v17];
        }
        else
        {
          v18 = (void *)MEMORY[0x1E4F28C58];
          v19 = PCSCKKSOperationErrorDomain;
          uint64_t v34 = v24;
          v17 = [v9 error];
          v35 = v17;
          v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
          v21 = [v18 errorWithDomain:v19 code:1 userInfo:v20];
          v2 = v26;
          [(PCSCKKSOperation *)v26 setError:v21];
        }
      }
      v7 &= v10;
      v5 |= v29;
      v6 |= v12;
      ++v8;
    }
    while (v28 != v8);
    uint64_t v28 = [(NSMutableArray *)obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  }
  while (v28);

  if (!(v5 & 1 | ((v7 & 1) == 0) | v6 & 1)) {
    return 1;
  }
  v22 = [(PCSCKKSOperation *)v2 error];

  if (!v22)
  {
    obj = [MEMORY[0x1E4F28C58] errorWithDomain:PCSCKKSOperationErrorDomain code:2 userInfo:0];
    -[PCSCKKSOperation setError:](v2, "setError:");
    BOOL v4 = 0;
LABEL_18:

    return v4;
  }
  return 0;
}

- (BOOL)startOperation
{
  BOOL v3 = [(PCSCKKSOperation *)self checkDependencies];
  int v4 = [(PCSCKKSOperation *)self isCancelled] || !v3;
  if (v4) {
    char v5 = @"isFinished";
  }
  else {
    char v5 = @"isExecuting";
  }
  if (v4) {
    char v6 = &OBJC_IVAR___PCSCKKSOperation_finished;
  }
  else {
    char v6 = &OBJC_IVAR___PCSCKKSOperation_executing;
  }
  [(PCSCKKSOperation *)self willChangeValueForKey:v5];
  *((unsigned char *)&self->super.super.isa + *v6) = 1;
  [(PCSCKKSOperation *)self didChangeValueForKey:v5];
  return v4 ^ 1;
}

- (void)completeOperation
{
  [(PCSCKKSOperation *)self willChangeValueForKey:@"isFinished"];
  [(PCSCKKSOperation *)self willChangeValueForKey:@"isExecuting"];
  self->executing = 0;
  self->finished = 1;
  [(PCSCKKSOperation *)self didChangeValueForKey:@"isExecuting"];
  [(PCSCKKSOperation *)self didChangeValueForKey:@"isFinished"];
}

- (BOOL)isExecuting
{
  return self->executing;
}

- (void)setExecuting:(BOOL)a3
{
  self->executing = a3;
}

- (BOOL)isFinished
{
  return self->finished;
}

- (void)setFinished:(BOOL)a3
{
  self->finished = a3;
}

- (BOOL)isCancelled
{
  return self->cancelled;
}

- (void)setCancelled:(BOOL)a3
{
  self->cancelled = a3;
}

- (NSError)error
{
  return (NSError *)objc_getProperty(self, a2, 256, 1);
}

- (void)setError:(id)a3
{
}

- (NSMutableArray)successDependencies
{
  return (NSMutableArray *)objc_getProperty(self, a2, 264, 1);
}

- (void)setSuccessDependencies:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_successDependencies, 0);
  objc_storeStrong((id *)&self->_error, 0);
}

@end