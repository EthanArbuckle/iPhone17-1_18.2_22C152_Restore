@interface PXRunNode
+ (id)_defaultNodeRunnerWithQualityOfService:(int64_t)a3;
+ (void)processGraphForRunNode:(id)a3;
+ (void)processGraphForRunNode:(id)a3 withQualityOfService:(int64_t)a4;
- (BOOL)isCanceled;
- (BOOL)isComplete;
- (BOOL)isRunning;
- (BOOL)isWaiting;
- (NSArray)dependencies;
- (NSLock)_operationLock;
- (NSSet)_dependencySet;
- (PXRunNode)init;
- (PXRunNode)initWithDependencies:(id)a3;
- (PXRunNodeDelegate)delegate;
- (id)newOperation;
- (unint64_t)state;
- (void)_performChangesToOperation:(id)a3;
- (void)cancel;
- (void)cancelWithError:(id)a3;
- (void)complete;
- (void)completeWithError:(id)a3;
- (void)run;
- (void)setDelegate:(id)a3;
@end

@implementation PXRunNode

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__operationLock, 0);
  objc_storeStrong((id *)&self->__dependencySet, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_dependencies, 0);
  objc_destroyWeak((id *)&self->_operation);
}

- (NSLock)_operationLock
{
  return self->__operationLock;
}

- (NSSet)_dependencySet
{
  return self->__dependencySet;
}

- (void)setDelegate:(id)a3
{
}

- (PXRunNodeDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXRunNodeDelegate *)WeakRetained;
}

- (NSArray)dependencies
{
  return self->_dependencies;
}

- (void)cancelWithError:(id)a3
{
  id v4 = a3;
  v5 = [(PXRunNode *)self delegate];
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __29__PXRunNode_cancelWithError___block_invoke;
  v7[3] = &unk_1E5DAFF50;
  v7[4] = &v8;
  [(PXRunNode *)self _performChangesToOperation:v7];
  if (*((unsigned char *)v9 + 24))
  {
    [(PXRunNode *)self didCancel];
    if (objc_opt_respondsToSelector())
    {
      v6 = [(PXRunNode *)self delegate];
      [v6 runNode:self didCancelWithError:v4];
    }
  }
  _Block_object_dispose(&v8, 8);
}

id __29__PXRunNode_cancelWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 cancelIfAble];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)cancel
{
}

- (void)run
{
  if (([(PXRunNode *)self isMemberOfClass:objc_opt_class()] & 1) == 0)
  {
    id v4 = [MEMORY[0x1E4F28B00] currentHandler];
    [v4 handleFailureInMethod:a2, self, @"PXRunNode.m", 153, @"%@ should override %s", objc_opt_class(), "-[PXRunNode run]" object file lineNumber description];
  }
  [(PXRunNode *)self complete];
}

- (void)completeWithError:(id)a3
{
  id v4 = a3;
  id v5 = [(PXRunNode *)self delegate];
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __31__PXRunNode_completeWithError___block_invoke;
  v6[3] = &unk_1E5DAFF50;
  v6[4] = &v7;
  [(PXRunNode *)self _performChangesToOperation:v6];
  if (*((unsigned char *)v8 + 24) && (objc_opt_respondsToSelector() & 1) != 0) {
    [v5 runNode:self didCompleteWithError:v4];
  }
  _Block_object_dispose(&v7, 8);
}

id __31__PXRunNode_completeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 completeIfAble];
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    id v4 = 0;
  }
  else {
    id v4 = v3;
  }
  id v5 = v4;

  return v5;
}

- (void)complete
{
}

- (BOOL)isComplete
{
  return [(PXRunNode *)self state] == 3;
}

- (BOOL)isCanceled
{
  return [(PXRunNode *)self state] == 2;
}

- (BOOL)isRunning
{
  return [(PXRunNode *)self state] == 1;
}

- (BOOL)isWaiting
{
  return [(PXRunNode *)self state] == 0;
}

- (unint64_t)state
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __18__PXRunNode_state__block_invoke;
  v4[3] = &unk_1E5DAFF50;
  v4[4] = &v5;
  [(PXRunNode *)self _performChangesToOperation:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

id __18__PXRunNode_state__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3) {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v3 state];
  }
  return v4;
}

- (void)_performChangesToOperation:(id)a3
{
  id v4 = (void (**)(id, id))a3;
  uint64_t v5 = [(PXRunNode *)self _operationLock];
  [v5 lock];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_operation);
  v6 = v4[2](v4, WeakRetained);

  objc_storeWeak((id *)&self->_operation, v6);
  uint64_t v7 = [(PXRunNode *)self _operationLock];
  [v7 unlock];
}

- (id)newOperation
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x3032000000;
  uint64_t v8 = __Block_byref_object_copy__11114;
  uint64_t v9 = __Block_byref_object_dispose__11115;
  id v10 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __25__PXRunNode_newOperation__block_invoke;
  v4[3] = &unk_1E5DAFF28;
  v4[4] = self;
  void v4[5] = &v5;
  [(PXRunNode *)self _performChangesToOperation:v4];
  id v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

id __25__PXRunNode_newOperation__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [v3 state];
  if (!v3 || (v4 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    uint64_t v5 = [[PXRunNodeOperation alloc] initWithRunNode:*(void *)(a1 + 32)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v8 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    id v3 = v8;
  }
  return v3;
}

- (PXRunNode)initWithDependencies:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PXRunNode;
  uint64_t v5 = [(PXRunNode *)&v15 init];
  if (v5)
  {
    uint64_t v6 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    operationLock = v5->__operationLock;
    v5->__operationLock = v6;

    if (v4)
    {
      uint64_t v8 = [v4 copy];
      dependencies = v5->_dependencies;
      v5->_dependencies = (NSArray *)v8;

      [MEMORY[0x1E4F1CAD0] setWithArray:v4];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1C978] array];
      v12 = v5->_dependencies;
      v5->_dependencies = (NSArray *)v11;

      [MEMORY[0x1E4F1CAD0] set];
    uint64_t v10 = };
    dependencySet = v5->__dependencySet;
    v5->__dependencySet = (NSSet *)v10;
  }
  return v5;
}

- (PXRunNode)init
{
  return [(PXRunNode *)self initWithDependencies:0];
}

+ (void)processGraphForRunNode:(id)a3 withQualityOfService:(int64_t)a4
{
  id v5 = a3;
  id v6 = [(id)objc_opt_class() _defaultNodeRunnerWithQualityOfService:a4];
  [v6 processGraphForRunNode:v5];
}

+ (void)processGraphForRunNode:(id)a3
{
}

+ (id)_defaultNodeRunnerWithQualityOfService:(int64_t)a3
{
  if (_defaultNodeRunnerWithQualityOfService__onceToken != -1) {
    dispatch_once(&_defaultNodeRunnerWithQualityOfService__onceToken, &__block_literal_global_11128);
  }
  id v4 = (void *)_defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS;
  id v5 = [NSNumber numberWithInteger:a3];
  id v6 = [v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v6 = objc_alloc_init(PXNodeRunner);
    [(PXNodeRunner *)v6 setQualityOfService:a3];
    uint64_t v7 = (void *)_defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS;
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    [v7 setObject:v6 forKeyedSubscript:v8];
  }
  return v6;
}

void __52__PXRunNode__defaultNodeRunnerWithQualityOfService___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v1 = (void *)_defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS;
  _defaultNodeRunnerWithQualityOfService__nodeRunnersByQOS = (uint64_t)v0;
}

@end