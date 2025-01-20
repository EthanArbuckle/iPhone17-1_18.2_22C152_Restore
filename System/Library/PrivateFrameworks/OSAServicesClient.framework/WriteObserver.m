@interface WriteObserver
- (BOOL)matches:(id)a3;
- (NSSet)bugTypes;
- (OSADiagnosticWriteObserver)observer;
- (WriteObserver)initWithObserver:(id)a3 bugTypes:(id)a4;
- (void)deliverDidWrite:(id)a3 on:(id)a4;
- (void)deliverWillWrite:(id)a3 on:(id)a4;
@end

@implementation WriteObserver

- (WriteObserver)initWithObserver:(id)a3 bugTypes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)WriteObserver;
  v8 = [(WriteObserver *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_observer, v6);
    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithArray:v7];
    bugTypes = v9->_bugTypes;
    v9->_bugTypes = (NSSet *)v10;
  }
  return v9;
}

- (BOOL)matches:(id)a3
{
  id v4 = a3;
  id v5 = [(WriteObserver *)self observer];

  return v5 == v4;
}

- (void)deliverWillWrite:(id)a3 on:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  bugTypes = self->_bugTypes;
  v9 = [v6 bugType];
  LODWORD(bugTypes) = [(NSSet *)bugTypes containsObject:v9];

  if (bugTypes)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __37__WriteObserver_deliverWillWrite_on___block_invoke;
    v10[3] = &unk_1E60C4580;
    v10[4] = self;
    id v11 = v6;
    dispatch_async(v7, v10);
  }
}

void __37__WriteObserver_deliverWillWrite_on___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 8));
  v2 = [*(id *)(a1 + 40) incidentID];
  v3 = [*(id *)(a1 + 40) bugType];
  [WeakRetained willWriteDiagnosticLog:v2 ofType:v3];
}

- (void)deliverDidWrite:(id)a3 on:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  bugTypes = self->_bugTypes;
  v9 = [v6 identity];
  uint64_t v10 = [v9 bugType];
  LODWORD(bugTypes) = [(NSSet *)bugTypes containsObject:v10];

  if (bugTypes)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __36__WriteObserver_deliverDidWrite_on___block_invoke;
    v11[3] = &unk_1E60C4580;
    id v12 = v6;
    objc_super v13 = self;
    dispatch_async(v7, v11);
  }
}

void __36__WriteObserver_deliverDidWrite_on___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) filePath];

  if (v2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    v3 = [*(id *)(a1 + 32) identity];
    id v4 = [v3 incidentID];
    id v5 = [*(id *)(a1 + 32) identity];
    id v6 = [v5 bugType];
    id v7 = [*(id *)(a1 + 32) filePath];
    [WeakRetained didWriteDiagnosticLog:v4 ofType:v6 toPath:v7];
  }
  else
  {
    v8 = [*(id *)(a1 + 32) error];

    if (!v8) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 8));
    v3 = [*(id *)(a1 + 32) identity];
    id v4 = [v3 incidentID];
    id v5 = [*(id *)(a1 + 32) identity];
    id v6 = [v5 bugType];
    id v7 = [*(id *)(a1 + 32) error];
    [WeakRetained failedToWriteDiagnosticLog:v4 ofType:v6 error:v7];
  }
}

- (OSADiagnosticWriteObserver)observer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  return (OSADiagnosticWriteObserver *)WeakRetained;
}

- (NSSet)bugTypes
{
  return self->_bugTypes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bugTypes, 0);
  objc_destroyWeak((id *)&self->_observer);
}

@end